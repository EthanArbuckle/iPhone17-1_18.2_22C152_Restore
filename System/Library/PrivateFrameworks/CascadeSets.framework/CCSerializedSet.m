@interface CCSerializedSet
+ (BOOL)supportsSecureCoding;
+ (id)_serializeSet:(id)a3 useCase:(id)a4 error:(id *)a5;
+ (id)setEnumeratorWithSerializedSets:(id)a3;
- (BOOL)writeToStream:(id)a3 format:(unsigned __int8)a4 error:(id *)a5;
- (CCSerializedSet)initWithCoder:(id)a3;
- (CCSerializedSet)initWithData:(id)a3 error:(id *)a4;
- (CCSerializedSet)initWithItemType:(unsigned __int16)a3 descriptors:(id)a4 localInstances:(id)a5 error:(id *)a6;
- (CCSerializedSet)initWithItemType:(unsigned __int16)a3 personaIdentifier:(id)a4 isInUserVault:(BOOL)a5 descriptors:(id)a6 localInstances:(id)a7 error:(id *)a8;
- (CCSerializedSet)initWithSet:(id)a3 useCase:(id)a4 error:(id *)a5;
- (CCSerializedSet)initWithSetMessage:(id)a3 error:(id *)a4;
- (NSData)data;
- (id)_deduplicateItemsOfType:(unsigned __int16)a3 localInstances:(id)a4 deviceIndexes:(id)a5 error:(id *)a6;
- (id)changePublisher;
- (id)changePublisherWithUseCase:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CCSerializedSet

+ (id)setEnumeratorWithSerializedSets:(id)a3
{
  id v3 = a3;
  v4 = [[CCSerializedSetEnumerator alloc] initWithSerializedSets:v3];

  return v4;
}

- (CCSerializedSet)initWithSetMessage:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v5 = a3;
  v6 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v5 descriptors];
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v12 = [CCSetDescriptor alloc];
        v13 = objc_msgSend(v11, "key", v28);
        v14 = [v11 value];
        v15 = [(BMResourceDescriptor *)v12 initWithKey:v13 value:v14 error:a4];

        if (!v15)
        {
          v26 = 0;
          v25 = self;
          goto LABEL_15;
        }
        [v6 addObject:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v16 = [v5 accountIdentifier];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F29E60]);
    v18 = [v5 accountIdentifier];
    v19 = (void *)[v17 initWithAccountIdentifier:v18];

    id v20 = CCAddAcountInfoToDescriptors(v6, (uint64_t)v19, (uint64_t)a4);
  }
  objc_msgSend(v5, "personaIdentifier", v28);
  v32.receiver = self;
  v32.super_class = (Class)CCSerializedSet;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = -[CCSet initWithItemType:personaIdentifier:descriptors:options:error:](&v32, sel_initWithItemType_personaIdentifier_descriptors_options_error_, (unsigned __int16)[v5 itemType], obj, v6, objc_msgSend(v5, "options"), a4);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_setMessage, v29);
    uint64_t v23 = [(CCSerializedSetMessage *)v22->_setMessage data];
    data = v22->_data;
    v22->_data = (NSData *)v23;
  }
  v25 = v22;
  v26 = v25;
LABEL_15:

  return v26;
}

- (CCSerializedSet)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "subdataWithRange:", 0, 1);
  uint64_t v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  if ([v8 isEqual:@"{"])
  {
    uint64_t v9 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:a4];
    if (!v9) {
      goto LABEL_4;
    }
    v10 = (void *)v9;
    v11 = (void *)[objc_alloc((Class)getCCSerializedSetMessageClass()) initWithJSONDictionary:v9 error:a4];

    if (!v11) {
      goto LABEL_4;
    }
LABEL_6:
    self = [(CCSerializedSet *)self initWithSetMessage:v11 error:a4];

    v12 = self;
    goto LABEL_7;
  }
  v11 = (void *)[objc_alloc((Class)getCCSerializedSetMessageClass()) initWithData:v6 error:a4];
  if (v11) {
    goto LABEL_6;
  }
LABEL_4:
  v12 = 0;
LABEL_7:

  return v12;
}

- (CCSerializedSet)initWithItemType:(unsigned __int16)a3 descriptors:(id)a4 localInstances:(id)a5 error:(id *)a6
{
  return [(CCSerializedSet *)self initWithItemType:a3 personaIdentifier:0 isInUserVault:0 descriptors:a4 localInstances:a5 error:a6];
}

- (CCSerializedSet)initWithItemType:(unsigned __int16)a3 personaIdentifier:(id)a4 isInUserVault:(BOOL)a5 descriptors:(id)a6 localInstances:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  unsigned int v12 = a3;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)[objc_alloc((Class)getCCSerializedSetDeviceClass()) initWithDeviceIdentifier:@"local-device-placeholder" options:&unk_26FDCD448 error:a8];
  if (v17)
  {
    BOOL v39 = v11;
    unsigned int v40 = v12;
    v43 = v16;
    v44 = v17;
    id v45 = v14;
    v42 = self;
    v46 = objc_alloc_init(CCMutableRepeatedUInt32);
    [(CCMutableRepeatedUInt32 *)v46 appendUInt32Value:0];
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v41 = v15;
    id v19 = v15;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v25 = objc_alloc((Class)getCCSerializedSetDescriptorClass());
          v26 = [v24 key];
          v27 = [v24 value];
          id v28 = (void *)[v25 initWithKey:v26 value:v27 error:a8];

          if (!v28)
          {
            long long v36 = 0;
            self = v42;
            goto LABEL_18;
          }
          [v18 addObject:v28];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    self = v42;
    id v16 = v43;
    id v19 = [(CCSerializedSet *)v42 _deduplicateItemsOfType:v40 localInstances:v43 deviceIndexes:v46 error:a8];
    if (v19)
    {
      id v38 = objc_alloc((Class)getCCSerializedSetMessageClass());
      uint64_t v29 = [NSNumber numberWithUnsignedShort:v40];
      v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
      v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
      v51 = v44;
      objc_super v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
      long long v33 = [NSNumber numberWithUnsignedChar:v39];
      long long v34 = (void *)v29;
      long long v35 = (void *)[v38 initWithItemType:v29 personaIdentifier:v45 descriptors:v18 sharedItemCount:v30 localItemInstanceCount:v31 devices:v32 items:v19 options:v33 error:a8];

      if (v35)
      {
        self = [(CCSerializedSet *)v42 initWithSetMessage:v35 error:a8];
        long long v36 = self;
      }
      else
      {
        long long v36 = 0;
      }

LABEL_18:
      id v15 = v41;
      id v16 = v43;
    }
    else
    {
      long long v36 = 0;
      id v15 = v41;
    }

    id v17 = v44;
    id v14 = v45;
  }
  else
  {
    long long v36 = 0;
  }

  return v36;
}

- (id)_deduplicateItemsOfType:(unsigned __int16)a3 localInstances:(id)a4 deviceIndexes:(id)a5 error:(id *)a6
{
  unsigned int v58 = a3;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  id v53 = v10;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v56 = *(void *)v61;
    id v52 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v61 != v56) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        id v15 = [v14 content];
        uint64_t v16 = [(id)objc_opt_class() itemType];

        if (v16 != v58)
        {
          id v41 = (void *)MEMORY[0x263F087E8];
          uint64_t v64 = *MEMORY[0x263F07F80];
          v42 = NSString;
          v43 = CCTypeIdentifierRegistryBridge();
          v44 = [v43 descriptionForTypeIdentifier:v16];
          id v45 = CCTypeIdentifierRegistryBridge();
          v46 = [v45 descriptionForTypeIdentifier:v58];
          long long v47 = [v42 stringWithFormat:@"Inconsistent item type (%@) of instance: %@ expected itemType: %@", v44, v14, v46];
          v65 = v47;
          long long v48 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
          long long v49 = [v41 errorWithDomain:@"com.apple.CascadeSets.Item" code:2 userInfo:v48];
          CCSetError(a6, v49);

          id v10 = v53;
LABEL_22:
          unsigned int v40 = 0;
          long long v50 = obj;
          id v34 = obj;
          id v8 = v52;
          goto LABEL_25;
        }
        id v17 = objc_alloc((Class)getCCSerializedSetItemInstanceClass());
        v18 = [v14 metaContent];
        id v19 = [v18 data];
        uint64_t v20 = [v14 instanceIdentifier];
        uint64_t v21 = (void *)[v17 initWithMetaContent:v19 instanceIdentifier:v20 error:a6];

        if (!v21) {
          goto LABEL_22;
        }
        uint64_t v22 = [v14 metaContent];
        uint64_t v23 = [v22 sourceItemIdentifier];

        if (([v10 containsObject:v23] & 1) == 0)
        {
          [v10 addObject:v23];
          v24 = [v14 sharedIdentifier];
          uint64_t v25 = [v9 indexOfObject:v24];
          if (v25 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v26 = v9;
            [v9 addObject:v24];
            id v27 = objc_alloc((Class)getCCSerializedSetSharedItemClass());
            id v28 = [v14 content];
            uint64_t v29 = [v28 data];
            v30 = (void *)[v27 initWithContent:v29 sharedIdentifier:v24 error:a6];

            if (!v30)
            {

              unsigned int v40 = 0;
              long long v50 = obj;
              id v34 = obj;
              id v9 = v26;
              id v8 = v52;
              id v10 = v53;
              goto LABEL_25;
            }
            [v55 addObject:v30];
            v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v21, 0);
            [v57 addObject:v31];

            id v9 = v26;
            id v10 = v53;
          }
          else
          {
            v30 = [v57 objectAtIndex:v25];
            [v30 addObject:v21];
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      id v8 = v52;
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v32 = v9;
  uint64_t v33 = [v9 count];
  id v34 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v33];
  if (v33)
  {
    uint64_t v35 = 0;
    while (1)
    {
      id v36 = objc_alloc((Class)getCCSerializedSetItemClass());
      v37 = [v55 objectAtIndex:v35];
      id v38 = [v57 objectAtIndex:v35];
      BOOL v39 = (void *)[v36 initWithSharedItem:v37 deviceIndexes:v8 localInstances:v38 error:a6];

      if (!v39) {
        break;
      }
      [v34 addObject:v39];

      if (v33 == ++v35) {
        goto LABEL_20;
      }
    }
    unsigned int v40 = 0;
  }
  else
  {
LABEL_20:
    id v34 = v34;
    unsigned int v40 = v34;
  }
  id v9 = v32;
  id v10 = v53;
  long long v50 = obj;
LABEL_25:

  return v40;
}

- (CCSerializedSet)initWithSet:(id)a3 useCase:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() _serializeSet:v9 useCase:v8 error:a5];

  if (v10)
  {
    self = [(CCSerializedSet *)self initWithSetMessage:v10 error:a5];
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)writeToStream:(id)a3 format:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  id v8 = a3;
  if (v6 == 2)
  {
    id v10 = [(CCSerializedSetMessage *)self->_setMessage jsonDictionary];
    uint64_t v9 = [MEMORY[0x263F08900] writeJSONObject:v10 toStream:v8 options:9 error:a5];
  }
  else if (v6 == 1)
  {
    uint64_t v9 = objc_msgSend(v8, "write:maxLength:", -[NSData bytes](self->_data, "bytes"), -[NSData length](self->_data, "length"));
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9 > 0;
}

+ (id)_serializeSet:(id)a3 useCase:(id)a4 error:(id *)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy_;
  v71 = __Block_byref_object_dispose_;
  id v72 = 0;
  id v45 = a3;
  id v43 = a4;
  long long v47 = objc_msgSend(v45, "changePublisherWithUseCase:");
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v47, "sharedItemCount"));
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __47__CCSerializedSet__serializeSet_useCase_error___block_invoke;
  v66[3] = &unk_265279CE8;
  v66[4] = &v67;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __47__CCSerializedSet__serializeSet_useCase_error___block_invoke_2;
  v59[3] = &unk_265279D10;
  long long v63 = &v67;
  uint64_t v64 = &v73;
  id v42 = v8;
  id v60 = v42;
  id v46 = v7;
  id v61 = v46;
  id v44 = v9;
  id v62 = v44;
  v65 = &v77;
  id v10 = (id)[v47 sinkWithCompletion:v66 receiveInput:v59];
  uint64_t v11 = (void *)v68[5];
  if (v11)
  {
    CCSetError(a5, v11);
    uint64_t v12 = 0;
  }
  else
  {
    id v41 = a5;
    long long v48 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v46, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v13 = v46;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v82 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v56;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v56 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v18 = objc_alloc((Class)getCCSerializedSetDeviceClass());
          id v19 = [v17 identifier];
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v17, "options"));
          uint64_t v21 = (id *)(v68 + 5);
          id obj = (id)v68[5];
          uint64_t v22 = (void *)[v18 initWithDeviceIdentifier:v19 options:v20 error:&obj];
          objc_storeStrong(v21, obj);

          uint64_t v23 = (void *)v68[5];
          if (v23)
          {
            CCSetError(v41, v23);
            uint64_t v12 = 0;
            goto LABEL_23;
          }
          [v48 addObject:v22];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v82 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v24 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v25 = [v45 descriptors];
    id v13 = (id)objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v22 = [v45 descriptors];
    uint64_t v26 = [v22 countByEnumeratingWithState:&v50 objects:v81 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v51;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v51 != v27) {
            objc_enumerationMutation(v22);
          }
          uint64_t v29 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          id v30 = objc_alloc((Class)getCCSerializedSetDescriptorClass());
          v31 = [v29 key];
          id v32 = [v29 value];
          uint64_t v33 = (id *)(v68 + 5);
          id v49 = (id)v68[5];
          id v34 = (void *)[v30 initWithKey:v31 value:v32 error:&v49];
          objc_storeStrong(v33, v49);

          uint64_t v35 = (void *)v68[5];
          if (v35)
          {
            CCSetError(v41, v35);
            uint64_t v12 = 0;
            goto LABEL_22;
          }
          [v13 addObject:v34];
        }
        uint64_t v26 = [v22 countByEnumeratingWithState:&v50 objects:v81 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    id v36 = objc_alloc((Class)getCCSerializedSetMessageClass());
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v45, "itemType"));
    id v34 = [v45 personaIdentifier];
    v37 = [NSNumber numberWithUnsignedInteger:v78[3]];
    id v38 = [NSNumber numberWithUnsignedInteger:v74[3]];
    BOOL v39 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v45, "options"));
    uint64_t v12 = (void *)[v36 initWithItemType:v22 personaIdentifier:v34 descriptors:v13 sharedItemCount:v37 localItemInstanceCount:v38 devices:v48 items:v44 options:v39 error:v41];

LABEL_22:
LABEL_23:
  }
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);

  return v12;
}

void __47__CCSerializedSet__serializeSet_useCase_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 state] == 1)
  {
    uint64_t v3 = [v6 error];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __47__CCSerializedSet__serializeSet_useCase_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 sharedItem];

  if (v4)
  {
    id v5 = objc_alloc((Class)getCCSerializedSetSharedItemClass());
    id v6 = [v3 sharedItem];
    id v7 = [v6 content];
    id v8 = [v7 data];
    uint64_t v9 = [v3 sharedItem];
    id v10 = [v9 sharedIdentifier];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v11 + 40);
    uint64_t v35 = (void *)[v5 initWithContent:v8 sharedIdentifier:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v35 = 0;
  }
  id v12 = objc_alloc(MEMORY[0x263EFF980]);
  id v13 = [v3 allLocalInstances];
  v37 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v34 = v3;
  uint64_t v14 = [v3 allLocalInstances];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v36 = *(void *)v45;
LABEL_7:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v45 != v36) {
        objc_enumerationMutation(v14);
      }
      id v18 = *(void **)(*((void *)&v44 + 1) + 8 * v17);
      id v19 = objc_alloc((Class)getCCSerializedSetItemInstanceClass());
      uint64_t v20 = [v18 metaContent];
      uint64_t v21 = [v20 data];
      uint64_t v22 = [v18 instanceIdentifier];
      uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
      id v43 = *(id *)(v23 + 40);
      id v24 = (void *)[v19 initWithMetaContent:v21 instanceIdentifier:v22 error:&v43];
      objc_storeStrong((id *)(v23 + 40), v43);

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        break;
      }
      [v37 addObject:v24];
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

      if (v16 == ++v17)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v16) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:

    uint64_t v14 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v25 = [v34 allDevices];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v31 = [*(id *)(a1 + 32) objectForKeyedSubscript:v30];
          if (!v31)
          {
            v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
            [*(id *)(a1 + 32) setObject:v31 forKeyedSubscript:v30];
            [*(id *)(a1 + 40) addObject:v30];
          }
          objc_msgSend(v14, "appendUInt32Value:", objc_msgSend(v31, "unsignedIntegerValue"));
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v27);
    }

    id v32 = objc_alloc((Class)getCCSerializedSetItemClass());
    uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8);
    id v38 = *(id *)(v33 + 40);
    id v24 = (void *)[v32 initWithSharedItem:v35 deviceIndexes:v14 localInstances:v37 error:&v38];
    objc_storeStrong((id *)(v33 + 40), v38);
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      [*(id *)(a1 + 48) addObject:v24];
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
  }

  id v3 = v34;
LABEL_25:
}

- (id)changePublisher
{
  return [(CCSerializedSet *)self changePublisherWithUseCase:*MEMORY[0x263F29E30]];
}

- (id)changePublisherWithUseCase:(id)a3
{
  uint64_t v4 = [CCSetChangePublisher alloc];
  id v5 = [[CCSerializedSetChangeEnumerator alloc] initWithSetMessage:self->_setMessage];
  id v6 = [(CCSetChangePublisher *)v4 initWithEnumerator:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CCSerializedSet)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];

  id v13 = 0;
  id v6 = [(CCSerializedSet *)self initWithData:v5 error:&v13];
  id v7 = v13;
  id v8 = v6;
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    uint64_t v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CCSerializedSet initWithCoder:]((uint64_t)v7, v11);
    }
  }
  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_setMessage, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Failed to decode serialized set %@", (uint8_t *)&v2, 0xCu);
}

@end