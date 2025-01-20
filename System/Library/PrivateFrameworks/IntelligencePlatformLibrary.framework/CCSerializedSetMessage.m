@interface CCSerializedSetMessage
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasItemType;
- (BOOL)hasLocalItemInstanceCount;
- (BOOL)hasOptions;
- (BOOL)hasSharedItemCount;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCSerializedSetMessage)initWithItemType:(id)a3 accountIdentifier:(id)a4 descriptors:(id)a5 sharedItemCount:(id)a6 localItemInstanceCount:(id)a7 devices:(id)a8 items:(id)a9 error:(id *)a10;
- (CCSerializedSetMessage)initWithItemType:(id)a3 personaIdentifier:(id)a4 descriptors:(id)a5 sharedItemCount:(id)a6 localItemInstanceCount:(id)a7 devices:(id)a8 items:(id)a9 options:(id)a10 error:(id *)a11;
- (CCSerializedSetMessage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (NSArray)descriptors;
- (NSArray)devices;
- (NSArray)items;
- (NSString)accountIdentifier;
- (NSString)personaIdentifier;
- (id)jsonDictionary;
- (unsigned)itemType;
- (unsigned)localItemInstanceCount;
- (unsigned)options;
- (unsigned)sharedItemCount;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasItemType:(BOOL)a3;
- (void)setHasLocalItemInstanceCount:(BOOL)a3;
- (void)setHasOptions:(BOOL)a3;
- (void)setHasSharedItemCount:(BOOL)a3;
@end

@implementation CCSerializedSetMessage

- (CCSerializedSetMessage)initWithItemType:(id)a3 accountIdentifier:(id)a4 descriptors:(id)a5 sharedItemCount:(id)a6 localItemInstanceCount:(id)a7 devices:(id)a8 items:(id)a9 error:(id *)a10
{
  return [(CCSerializedSetMessage *)self initWithItemType:a3 personaIdentifier:0 descriptors:a5 sharedItemCount:a6 localItemInstanceCount:a7 devices:a8 items:a9 options:&unk_270396978 error:a10];
}

- (NSString)accountIdentifier
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
}

- (void)setHasOptions:(BOOL)a3
{
  self->_hasOptions = a3;
}

- (BOOL)hasOptions
{
  return self->_hasOptions;
}

- (void)setHasLocalItemInstanceCount:(BOOL)a3
{
  self->_hasLocalItemInstanceCount = a3;
}

- (BOOL)hasLocalItemInstanceCount
{
  return self->_hasLocalItemInstanceCount;
}

- (void)setHasSharedItemCount:(BOOL)a3
{
  self->_hasSharedItemCount = a3;
}

- (BOOL)hasSharedItemCount
{
  return self->_hasSharedItemCount;
}

- (void)setHasItemType:(BOOL)a3
{
  self->_hasItemType = a3;
}

- (BOOL)hasItemType
{
  return self->_hasItemType;
}

- (unsigned)options
{
  return self->_options;
}

- (unsigned)localItemInstanceCount
{
  return self->_localItemInstanceCount;
}

- (unsigned)sharedItemCount
{
  return self->_sharedItemCount;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (CCSerializedSetMessage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  uint64_t v93 = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"itemType"];
    v10 = [v6 objectForKeyedSubscript:@"personaIdentifier"];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"descriptors"];
    if (v11)
    {
      v12 = (void *)v11;
      objc_opt_class();
      id v92 = v8;
      char v13 = CCValidateIsInstanceOfExpectedClass();
      id v14 = v8;

      if ((v13 & 1) == 0)
      {
        CCSetError();
        v43 = 0;
LABEL_57:

        id v8 = v14;
        goto LABEL_58;
      }
      v64 = a4;
      v66 = v9;
      v73 = v10;
      v15 = objc_opt_new();
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v88 objects:v96 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v89 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v88 + 1) + 8 * i);
            v22 = [CCSerializedSetDescriptor alloc];
            id v87 = 0;
            v23 = [(CCSerializedSetDescriptor *)v22 initWithJSONDictionary:v21 error:&v87];
            id v24 = v87;
            if (v23) {
              BOOL v25 = v24 == 0;
            }
            else {
              BOOL v25 = 0;
            }
            if (!v25)
            {
              v42 = v24;
              CCSetError();

              v43 = 0;
              v12 = v16;
              v9 = v66;
              v10 = v73;
              goto LABEL_57;
            }
            [v15 addObject:v23];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v88 objects:v96 count:16];
        }
        while (v18);
      }

      v9 = v66;
      v10 = v73;
      a4 = v64;
    }
    else
    {
      v15 = 0;
      id v14 = v8;
    }
    v26 = [v6 objectForKeyedSubscript:@"sharedItemCount"];
    v72 = [v6 objectForKeyedSubscript:@"localItemInstanceCount"];
    uint64_t v27 = [v6 objectForKeyedSubscript:@"devices"];
    v74 = v10;
    v71 = v15;
    if (v27)
    {
      v28 = (void *)v27;
      objc_opt_class();
      id v86 = v14;
      char v29 = CCValidateIsInstanceOfExpectedClass();
      id v30 = v14;

      if ((v29 & 1) == 0)
      {
        CCSetError();
        v43 = 0;
        v31 = v28;
        id v14 = v30;
LABEL_56:

        v10 = v74;
        v12 = v71;
        goto LABEL_57;
      }
      id v14 = v30;
      v62 = v26;
      v67 = v9;
      v69 = self;
      v31 = objc_opt_new();
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v32 = v28;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v82 objects:v95 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v83;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v83 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v82 + 1) + 8 * j);
            v38 = [CCSerializedSetDevice alloc];
            id v81 = 0;
            v39 = [(CCSerializedSetDevice *)v38 initWithJSONDictionary:v37 error:&v81];
            id v40 = v81;
            if (v39) {
              BOOL v41 = v40 == 0;
            }
            else {
              BOOL v41 = 0;
            }
            if (!v41)
            {
              v58 = v40;
              CCSetError();

              v43 = 0;
              v31 = v32;
              v9 = v67;
              self = v69;
              v26 = v62;
              goto LABEL_56;
            }
            [v31 addObject:v39];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v82 objects:v95 count:16];
        }
        while (v34);
      }

      self = v69;
      v26 = v62;
    }
    else
    {
      v31 = 0;
    }
    uint64_t v44 = [v6 objectForKeyedSubscript:@"items"];
    if (v44)
    {
      id v45 = (id)v44;
      objc_opt_class();
      id v80 = v14;
      char v46 = CCValidateIsInstanceOfExpectedClass();
      id v47 = v14;

      if ((v46 & 1) == 0)
      {
        CCSetError();
        v43 = 0;
        id v14 = v47;
        goto LABEL_55;
      }
      v63 = v26;
      v65 = a4;
      v68 = v9;
      v70 = self;
      id v14 = v47;
      v48 = objc_opt_new();
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v45 = v45;
      uint64_t v49 = [v45 countByEnumeratingWithState:&v76 objects:v94 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v77;
        do
        {
          for (uint64_t k = 0; k != v50; ++k)
          {
            if (*(void *)v77 != v51) {
              objc_enumerationMutation(v45);
            }
            uint64_t v53 = *(void *)(*((void *)&v76 + 1) + 8 * k);
            v54 = [CCSerializedSetItem alloc];
            id v75 = 0;
            v55 = [(CCSerializedSetItem *)v54 initWithJSONDictionary:v53 error:&v75];
            id v56 = v75;
            if (v55) {
              BOOL v57 = v56 == 0;
            }
            else {
              BOOL v57 = 0;
            }
            if (!v57)
            {
              v60 = v56;
              CCSetError();

              v43 = 0;
              v9 = v68;
              self = v70;
              v26 = v63;
              goto LABEL_55;
            }
            [v48 addObject:v55];
          }
          uint64_t v50 = [v45 countByEnumeratingWithState:&v76 objects:v94 count:16];
        }
        while (v50);
      }

      self = v70;
      v26 = v63;
      a4 = v65;
    }
    else
    {
      v48 = 0;
    }
    v59 = [v6 objectForKeyedSubscript:@"options"];
    v43 = [[CCSerializedSetMessage alloc] initWithItemType:v9 personaIdentifier:v74 descriptors:v71 sharedItemCount:v26 localItemInstanceCount:v72 devices:v31 items:v48 options:v59 error:a4];

    id v45 = v48;
LABEL_55:

    goto LABEL_56;
  }
  CCSetError();
  v43 = 0;
LABEL_58:

  return v43;
}

- (id)jsonDictionary
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (self->_hasItemType)
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCSerializedSetMessage itemType](self, "itemType"));
    [v3 setObject:v4 forKeyedSubscript:@"itemType"];
  }
  if (self->_personaIdentifier)
  {
    v5 = [(CCSerializedSetMessage *)self personaIdentifier];
    [v3 setObject:v5 forKeyedSubscript:@"personaIdentifier"];
  }
  id v6 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v7 = [(CCSerializedSetMessage *)self descriptors];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v40 + 1) + 8 * i) jsonDictionary];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v9);
  }

  [v3 setObject:v6 forKeyedSubscript:@"descriptors"];
  if (self->_hasSharedItemCount)
  {
    char v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCSerializedSetMessage sharedItemCount](self, "sharedItemCount"));
    [v3 setObject:v13 forKeyedSubscript:@"sharedItemCount"];
  }
  if (self->_hasLocalItemInstanceCount)
  {
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCSerializedSetMessage localItemInstanceCount](self, "localItemInstanceCount"));
    [v3 setObject:v14 forKeyedSubscript:@"localItemInstanceCount"];
  }
  v15 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v16 = [(CCSerializedSetMessage *)self devices];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v36 + 1) + 8 * j) jsonDictionary];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v18);
  }

  [v3 setObject:v15 forKeyedSubscript:@"devices"];
  v22 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v23 = [(CCSerializedSetMessage *)self items];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [*(id *)(*((void *)&v32 + 1) + 8 * k) jsonDictionary];
        [v22 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v25);
  }

  [v3 setObject:v22 forKeyedSubscript:@"items"];
  if (self->_hasOptions)
  {
    char v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCSerializedSetMessage options](self, "options"));
    [v3 setObject:v29 forKeyedSubscript:@"options"];
  }
  id v30 = (void *)[v3 copy];

  return v30;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v14 = (void (**)(id, void *))a3;
  v5 = (unsigned __int16 *)MEMORY[0x263F316D0];
  if (self->_hasItemType)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:(unsigned __int16)*MEMORY[0x263F316D0] uint32Value:self->_itemType];
    v14[2](v14, v6);
  }
  if (self->_personaIdentifier)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 stringValue:self->_personaIdentifier];
    v14[2](v14, v7);
  }
  if (self->_descriptors)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 repeatedSubMessageValue:self->_descriptors];
    v14[2](v14, v8);
  }
  if (self->_hasSharedItemCount)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 uint32Value:self->_sharedItemCount];
    v14[2](v14, v9);
  }
  if (self->_hasLocalItemInstanceCount)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 uint32Value:self->_localItemInstanceCount];
    v14[2](v14, v10);
  }
  if (self->_devices)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 repeatedSubMessageValue:self->_devices];
    v14[2](v14, v11);
  }
  if (self->_items)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 repeatedSubMessageValue:self->_items];
    v14[2](v14, v12);
  }
  if (self->_hasOptions)
  {
    char v13 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 uint32Value:self->_options];
    v14[2](v14, v13);
  }
}

- (NSArray)items
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_items copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)devices
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_devices copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)descriptors
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_descriptors copyItems:1];
  return (NSArray *)v2;
}

- (NSString)personaIdentifier
{
  v2 = (void *)[(NSString *)self->_personaIdentifier copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v66 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v66];
  id v6 = (int *)MEMORY[0x263F317C8];
  v7 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v5[*MEMORY[0x263F317C8]] >= *(void *)&v5[*MEMORY[0x263F317C0]])
  {
    v67 = 0;
    v68 = 0;
    uint64_t v8 = 0;
LABEL_88:
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    v67 = 0;
    v68 = 0;
    id v9 = 0;
    uint64_t v10 = (int *)MEMORY[0x263F317B8];
    uint64_t v11 = (int *)MEMORY[0x263F317B0];
    do
    {
      if (*(void *)&v5[*v10]) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = v9 == 0;
      }
      if (!v12) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v6;
        unint64_t v17 = *(void *)&v5[v16];
        if (v17 == -1 || v17 >= *(void *)&v5[*v7]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v5[*v11] + v17);
        *(void *)&v5[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0) {
          goto LABEL_17;
        }
        v13 += 7;
        BOOL v19 = v14++ >= 9;
        if (v19)
        {
          unint64_t v15 = 0;
          if (*(void *)&v5[*v10]) {
            goto LABEL_88;
          }
          goto LABEL_18;
        }
      }
      *(void *)&v5[*v10] = 1;
LABEL_17:
      if (*(void *)&v5[*v10]) {
        goto LABEL_88;
      }
LABEL_18:
      switch((v15 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (1)
          {
            uint64_t v23 = *v6;
            unint64_t v24 = *(void *)&v5[v23];
            if (v24 == -1 || v24 >= *(void *)&v5[*v7]) {
              break;
            }
            char v25 = *(unsigned char *)(*(void *)&v5[*v11] + v24);
            *(void *)&v5[v23] = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0) {
              goto LABEL_69;
            }
            v20 += 7;
            BOOL v19 = v21++ >= 9;
            if (v19)
            {
              LODWORD(v22) = 0;
              goto LABEL_71;
            }
          }
          *(void *)&v5[*v10] = 1;
LABEL_69:
          if (*(void *)&v5[*v10]) {
            LODWORD(v22) = 0;
          }
LABEL_71:
          id v9 = 0;
          self->_itemType = v22;
          uint64_t v54 = 16;
          goto LABEL_84;
        case 2u:
          CCPBReaderReadStringNoCopy();
          v28 = (NSString *)objc_claimAutoreleasedReturnValue();
          personaIdentifier = self->_personaIdentifier;
          self->_personaIdentifier = v28;

          goto LABEL_29;
        case 3u:
          id v30 = CCPBReaderReadDataNoCopy();
          if (!v68) {
            v68 = objc_opt_new();
          }
          v31 = [CCSerializedSetDescriptor alloc];
          id v71 = 0;
          long long v32 = [(CCItemMessage *)v31 initWithData:v30 error:&v71];
          id v9 = v71;
          if (v9 || !v32) {
            goto LABEL_60;
          }
          long long v33 = v68;
          goto LABEL_59;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          while (2)
          {
            uint64_t v37 = *v6;
            unint64_t v38 = *(void *)&v5[v37];
            if (v38 == -1 || v38 >= *(void *)&v5[*v7])
            {
              *(void *)&v5[*v10] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v5[*v11] + v38);
              *(void *)&v5[v37] = v38 + 1;
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v19 = v35++ >= 9;
                if (v19)
                {
                  LODWORD(v36) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(void *)&v5[*v10]) {
            LODWORD(v36) = 0;
          }
LABEL_75:
          id v9 = 0;
          self->_sharedItemCount = v36;
          uint64_t v54 = 17;
          goto LABEL_84;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          while (2)
          {
            uint64_t v43 = *v6;
            unint64_t v44 = *(void *)&v5[v43];
            if (v44 == -1 || v44 >= *(void *)&v5[*v7])
            {
              *(void *)&v5[*v10] = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)&v5[*v11] + v44);
              *(void *)&v5[v43] = v44 + 1;
              v42 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                BOOL v19 = v41++ >= 9;
                if (v19)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*(void *)&v5[*v10]) {
            LODWORD(v42) = 0;
          }
LABEL_79:
          id v9 = 0;
          self->_localItemInstanceCount = v42;
          uint64_t v54 = 18;
          goto LABEL_84;
        case 6u:
          id v30 = CCPBReaderReadDataNoCopy();
          if (!v67) {
            v67 = objc_opt_new();
          }
          char v46 = [CCSerializedSetDevice alloc];
          id v70 = 0;
          long long v32 = [(CCItemMessage *)v46 initWithData:v30 error:&v70];
          id v9 = v70;
          if (v9 || !v32) {
            goto LABEL_60;
          }
          long long v33 = v67;
          goto LABEL_59;
        case 7u:
          id v30 = CCPBReaderReadDataNoCopy();
          if (!v8) {
            uint64_t v8 = objc_opt_new();
          }
          uint64_t v47 = [CCSerializedSetItem alloc];
          id v69 = 0;
          long long v32 = [(CCItemMessage *)v47 initWithData:v30 error:&v69];
          id v9 = v69;
          if (v9 || !v32) {
            goto LABEL_60;
          }
          long long v33 = v8;
LABEL_59:
          [v33 addObject:v32];
LABEL_60:

          continue;
        case 8u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          break;
        default:
          if (CCPBReaderSkipValueWithTag())
          {
LABEL_29:
            id v9 = 0;
          }
          else
          {
            uint64_t v26 = (objc_class *)objc_opt_class();
            uint64_t v27 = NSStringFromClass(v26);
            CCSkipFieldErrorForMessage();
            id v9 = (id)objc_claimAutoreleasedReturnValue();
          }
          continue;
      }
      while (1)
      {
        uint64_t v51 = *v6;
        unint64_t v52 = *(void *)&v5[v51];
        if (v52 == -1 || v52 >= *(void *)&v5[*v7]) {
          break;
        }
        char v53 = *(unsigned char *)(*(void *)&v5[*v11] + v52);
        *(void *)&v5[v51] = v52 + 1;
        v50 |= (unint64_t)(v53 & 0x7F) << v48;
        if ((v53 & 0x80) == 0) {
          goto LABEL_81;
        }
        v48 += 7;
        BOOL v19 = v49++ >= 9;
        if (v19)
        {
          LODWORD(v50) = 0;
          goto LABEL_83;
        }
      }
      *(void *)&v5[*v10] = 1;
LABEL_81:
      if (*(void *)&v5[*v10]) {
        LODWORD(v50) = 0;
      }
LABEL_83:
      id v9 = 0;
      self->_options = v50;
      uint64_t v54 = 19;
LABEL_84:
      *((unsigned char *)&self->super.super.isa + v54) = 1;
    }
    while (*(void *)&v5[*v6] < *(void *)&v5[*v7]);
  }
  v55 = (NSArray *)[v68 copy];
  descriptors = self->_descriptors;
  self->_descriptors = v55;

  BOOL v57 = (NSArray *)[v67 copy];
  devices = self->_devices;
  self->_devices = v57;

  v59 = (NSArray *)[v8 copy];
  items = self->_items;
  self->_items = v59;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v5[*MEMORY[0x263F317B8]])
    {
      BOOL v64 = 1;
      goto LABEL_94;
    }
    v61 = (objc_class *)objc_opt_class();
    v62 = NSStringFromClass(v61);
    v63 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v64 = 0;
LABEL_94:

  return v64;
}

- (CCSerializedSetMessage)initWithItemType:(id)a3 personaIdentifier:(id)a4 descriptors:(id)a5 sharedItemCount:(id)a6 localItemInstanceCount:(id)a7 devices:(id)a8 items:(id)a9 options:(id)a10 error:(id *)a11
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v70 = a8;
  id v69 = a9;
  id v21 = a10;
  uint64_t v22 = objc_opt_new();
  if (!v16)
  {
    id v24 = 0;
    if (!v17) {
      goto LABEL_4;
    }
LABEL_19:
    objc_opt_class();
    id v88 = v24;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v25 = v24;

    if (!IsInstanceOfExpectedClass)
    {
LABEL_49:
      CCSetError();
      char v34 = 0;
      id v24 = v25;
      goto LABEL_50;
    }
    CCPBDataWriterWriteStringField();
    if (v18) {
      goto LABEL_5;
    }
LABEL_21:
    id v24 = v25;
    if (!v19) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  uint64_t v89 = 0;
  int v23 = CCValidateIsInstanceOfExpectedClass();
  id v24 = 0;
  if (!v23) {
    goto LABEL_17;
  }
  [v16 unsignedIntValue];
  CCPBDataWriterWriteUint32Field();
  if (v17) {
    goto LABEL_19;
  }
LABEL_4:
  id v25 = v24;
  if (!v18) {
    goto LABEL_21;
  }
LABEL_5:
  objc_opt_class();
  id v87 = v25;
  int v26 = CCValidateArrayValues();
  id v24 = v25;

  if (!v26) {
    goto LABEL_17;
  }
  id v62 = v21;
  id v64 = v20;
  id v61 = v19;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v27 = v18;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v83 objects:v92 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v84 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * i), "data", v61);
        CCPBDataWriterWriteDataField();
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v83 objects:v92 count:16];
    }
    while (v29);
  }

  id v19 = v61;
  id v21 = v62;
  id v20 = v64;
  if (!v61)
  {
LABEL_14:
    id v25 = v24;
    if (v20) {
      goto LABEL_15;
    }
LABEL_24:
    id v24 = v25;
    goto LABEL_25;
  }
LABEL_22:
  objc_opt_class();
  id v82 = v24;
  int v36 = CCValidateIsInstanceOfExpectedClass();
  id v25 = v24;

  if (!v36) {
    goto LABEL_49;
  }
  [v19 unsignedIntValue];
  CCPBDataWriterWriteUint32Field();
  if (!v20) {
    goto LABEL_24;
  }
LABEL_15:
  objc_opt_class();
  id v81 = v25;
  int v33 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v25;

  if (v33)
  {
    [v20 unsignedIntValue];
    CCPBDataWriterWriteUint32Field();
LABEL_25:
    uint64_t v37 = v70;
    if (v70)
    {
      id v61 = v18;
      objc_opt_class();
      id v80 = v24;
      int v38 = CCValidateArrayValues();
      id v39 = v24;

      if (!v38)
      {
        CCSetError();
        char v34 = 0;
        id v24 = v39;
        id v18 = v61;
        goto LABEL_51;
      }
      v63 = v21;
      id v65 = v20;
      id v40 = v19;
      long long v79 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v76 = 0u;
      id v41 = v70;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v76 objects:v91 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v77;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v77 != v44) {
              objc_enumerationMutation(v41);
            }
            char v46 = objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * j), "data", v61);
            CCPBDataWriterWriteDataField();
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v76 objects:v91 count:16];
        }
        while (v43);
      }

      id v19 = v40;
      id v20 = v65;
      uint64_t v37 = v70;
      id v24 = v39;
      id v18 = v61;
    }
    else
    {
      v63 = v21;
    }
    if (v69)
    {
      objc_opt_class();
      id v75 = v24;
      int v47 = CCValidateArrayValues();
      id v48 = v24;
      unsigned int v49 = v24;
      id v24 = v48;

      if (!v47)
      {
        CCSetError();
        char v34 = 0;
        id v21 = v63;
        goto LABEL_51;
      }
      id v66 = v20;
      id v61 = v19;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v50 = v69;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v71 objects:v90 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v72;
        do
        {
          for (uint64_t k = 0; k != v52; ++k)
          {
            if (*(void *)v72 != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * k), "data", v61);
            CCPBDataWriterWriteDataField();
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v71 objects:v90 count:16];
        }
        while (v52);
      }

      id v19 = v61;
      id v20 = v66;
      uint64_t v37 = v70;
    }
    id v21 = v63;
    if (!v63)
    {
      id v67 = v20;
      id v57 = v19;
      goto LABEL_55;
    }
    objc_opt_class();
    int v56 = CCValidateIsInstanceOfExpectedClass();
    id v25 = v24;

    if (v56)
    {
      id v67 = v20;
      id v57 = v19;
      [v63 unsignedIntValue];
      CCPBDataWriterWriteUint32Field();
      id v24 = v25;
      uint64_t v37 = v70;
LABEL_55:
      v59 = objc_msgSend(v22, "immutableData", v61);
      v60 = [(CCItemMessage *)self initWithData:v59 error:a11];

      self = v60;
      char v34 = v60;
      id v19 = v57;
      id v20 = v67;
      goto LABEL_51;
    }
    goto LABEL_49;
  }
LABEL_17:
  CCSetError();
  char v34 = 0;
LABEL_50:
  uint64_t v37 = v70;
LABEL_51:

  return v34;
}

+ (Class)contentMessageClass
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return 0;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (unsigned)itemType
{
  return *MEMORY[0x263F316D0];
}

@end