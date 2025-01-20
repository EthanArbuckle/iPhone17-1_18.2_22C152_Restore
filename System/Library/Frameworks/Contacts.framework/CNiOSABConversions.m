@interface CNiOSABConversions
+ (CFTypeRef)requiredABPropertyIDSetForKeysToFetch:(uint64_t)a1;
+ (CNAccount)accountFromABAccount:(uint64_t)a1;
+ (CNContactMatchInfo)contactMatchInfoFromABMatchMetadataDictionary:(uint64_t)a1;
+ (id)accountsFromABAccounts:(uint64_t)a1;
+ (id)arrayByMappingTransform:(id)a3 onCFArray:(__CFArray *)a4;
+ (id)contactFromABPerson:(void *)a3 keysToConvert:(uint64_t)a4 mutable:;
+ (id)contactFromABPerson:(void *)a3 uniqueKeysToConvert:(id)a4 mutable:(BOOL)a5;
+ (id)contactIdentifierFromABPerson:(uint64_t)a1;
+ (id)contactPropertiesByABPropertyID;
+ (id)containerFromABSource:(int)a3 remote:(int)a4 includeDisabledSources:;
+ (id)containersFromABSources:(char)a3 remote:(char)a4 includeDisabledSources:;
+ (id)dataFromABBytes:(char *)a3 length:(unint64_t)a4;
+ (id)dateFromABBytes:(char *)a3 length:(unint64_t)a4;
+ (id)groupFromABGroup:(uint64_t)a1;
+ (id)groupsFromABGroups:(uint64_t)a1;
+ (id)numberFromIntegerABBytes:(char *)a3 length:(unint64_t)a4;
+ (id)os_log;
+ (id)personToContactTransformWithKeysToFetch:(char)a3 mutable:;
+ (id)stringFromABBytes:(char *)a3 length:(unint64_t)a4;
+ (void)updateContact:(id)a3 fromABPerson:(void *)a4 keysToConvert:(id)a5 availableKeyDescriptor:(id *)a6;
@end

@implementation CNiOSABConversions

+ (id)contactPropertiesByABPropertyID
{
  self;
  if (contactPropertiesByABPropertyID_onceToken != -1) {
    dispatch_once(&contactPropertiesByABPropertyID_onceToken, &__block_literal_global_6_5);
  }
  v0 = (void *)contactPropertiesByABPropertyID_propertiesByABPropertyID;

  return v0;
}

+ (id)stringFromABBytes:(char *)a3 length:(unint64_t)a4
{
  v4 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];

  return v4;
}

+ (id)numberFromIntegerABBytes:(char *)a3 length:(unint64_t)a4
{
  if (a4 == 4)
  {
    v4 = [NSNumber numberWithInt:*(unsigned int *)a3];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Integer parameter was unexpectedly large during contact buffer decode."];
    v4 = 0;
  }

  return v4;
}

void __60__CNiOSABConversions_requiredABPropertyIDSetForKeysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 key];
  v6 = [v4 objectForKey:v5];

  if (v6)
  {
    LODWORD(value) = 0;
    if ([v6 abPropertyID:&value]) {
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), (const void *)(int)value);
    }
  }
}

+ (CFTypeRef)requiredABPropertyIDSetForKeysToFetch:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  CFMutableSetRef Mutable = CFSetCreateMutable(0, [v2 count], 0);
  v4 = +[CN contactPropertiesByKey];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "_cn_requiredKeys");
        v11 = (void *)[v10 mutableCopy];

        v12 = objc_msgSend(v9, "_cn_optionalKeys");
        [v11 unionKeyVector:v12];

        if (objc_opt_respondsToSelector())
        {
          v13 = objc_msgSend(v9, "_cn_unauthorizedKeys");

          if (v13)
          {
            v14 = objc_msgSend(v9, "_cn_unauthorizedKeys");
            [v11 minusKeyVector:v14];
          }
        }
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__CNiOSABConversions_requiredABPropertyIDSetForKeysToFetch___block_invoke;
        v18[3] = &unk_1E56B7A00;
        id v19 = v4;
        CFMutableSetRef v20 = Mutable;
        [v11 enumeratePropertiesUsingBlock:v18];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  CFTypeRef v15 = CFAutorelease(Mutable);
  return v15;
}

void __53__CNiOSABConversions_contactPropertiesByABPropertyID__block_invoke()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = +[CN allContactProperties];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v14 + 1) + 8 * v5);
        unsigned int v13 = 0;
        if ([v6 abPropertyID:&v13])
        {
          uint64_t v7 = [NSNumber numberWithInt:v13];
          v8 = [v0 objectForKey:v7];

          if (v8)
          {
            v9 = [v8 arrayByAddingObject:v6];
          }
          else
          {
            v18 = v6;
            v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
          }
          v10 = [NSNumber numberWithInt:v13];
          [v0 setObject:v9 forKey:v10];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v3);
  }
  uint64_t v11 = [v0 copy];
  v12 = (void *)contactPropertiesByABPropertyID_propertiesByABPropertyID;
  contactPropertiesByABPropertyID_propertiesByABPropertyID = v11;
}

+ (id)dateFromABBytes:(char *)a3 length:(unint64_t)a4
{
  if (a4 == 8)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)a3];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Date parameter was unexpectedly large during contact buffer decode."];
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)dataFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_13 != -1) {
    dispatch_once(&os_log_cn_once_token_0_13, &__block_literal_global_91);
  }
  uint64_t v2 = (void *)os_log_cn_once_object_0_13;

  return v2;
}

uint64_t __28__CNiOSABConversions_os_log__block_invoke()
{
  os_log_cn_once_object_0_13 = (uint64_t)os_log_create("com.apple.contacts", "contacts-iOSAB-conversions");

  return MEMORY[0x1F41817F8]();
}

+ (id)contactFromABPerson:(void *)a3 keysToConvert:(uint64_t)a4 mutable:
{
  id v6 = a3;
  uint64_t v7 = self;
  v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];

  v9 = [v7 contactFromABPerson:a2 uniqueKeysToConvert:v8 mutable:a4];

  return v9;
}

+ (id)contactFromABPerson:(void *)a3 uniqueKeysToConvert:(id)a4 mutable:(BOOL)a5
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3)
  {
    id v10 = v6;
    v8 = CNResultWithAutoreleasePool();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

CNMutableContact *__70__CNiOSABConversions_contactFromABPerson_uniqueKeysToConvert_mutable___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CNiOSABConversions contactIdentifierFromABPerson:](*(void *)(a1 + 40), *(const void **)(a1 + 48));
  uint64_t v3 = [(CNContact *)[CNMutableContact alloc] initWithIdentifier:v2];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v13 = 0;
  [v4 updateContact:v3 fromABPerson:v5 keysToConvert:v6 availableKeyDescriptor:&v13];
  id v7 = v13;
  [(CNMutableContact *)v3 setAvailableKeyDescriptor:v7];
  int v8 = *(unsigned __int8 *)(a1 + 56);
  ABRecordID RecordID = ABRecordGetRecordID(*(ABRecordRef *)(a1 + 48));

  if (v8)
  {
    if (RecordID != -1) {
      [(CNMutableContact *)v3 setSnapshot:v3];
    }
    id v10 = v3;
  }
  else
  {
    if (RecordID == -1) {
      [(CNMutableContact *)v3 freeze];
    }
    else {
    id v10 = [(CNMutableContact *)v3 freezeWithSelfAsSnapshot];
    }
  }
  uint64_t v11 = v10;

  return v11;
}

+ (id)contactIdentifierFromABPerson:(uint64_t)a1
{
  self;
  if (a2)
  {
    uint64_t v3 = (void *)ABRecordCopyValue(a2, *MEMORY[0x1E4F49BB8]);
    if (v3) {
      uint64_t v3 = (void *)CFAutorelease(v3);
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)personToContactTransformWithKeysToFetch:(char)a3 mutable:
{
  id v4 = a2;
  self;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __70__CNiOSABConversions_personToContactTransformWithKeysToFetch_mutable___block_invoke;
  v12 = &unk_1E56B78F8;
  id v13 = v4;
  char v14 = a3;
  id v5 = v4;
  uint64_t v6 = _Block_copy(&v9);
  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

id __70__CNiOSABConversions_personToContactTransformWithKeysToFetch_mutable___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNiOSABConversions contactFromABPerson:a2 uniqueKeysToConvert:*(void *)(a1 + 32) mutable:*(unsigned __int8 *)(a1 + 40)];
}

+ (void)updateContact:(id)a3 fromABPerson:(void *)a4 keysToConvert:(id)a5 availableKeyDescriptor:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (a4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke;
    aBlock[3] = &unk_1E56B7920;
    id v42 = v10;
    v43 = a4;
    v12 = _Block_copy(aBlock);
    if (v11)
    {
      uint64_t v26 = a6;
      id v29 = v10;
      id v13 = objc_opt_new();
      char v14 = +[CN writableAlwaysFetchedProperties];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke_2;
      v38[3] = &unk_1E56B7948;
      v27 = v12;
      id v15 = v12;
      id v40 = v15;
      long long v16 = v13;
      v39 = v16;
      [v14 enumerateObjectsUsingBlock:v38];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v28 = v11;
      id v17 = v11;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (!v18) {
        goto LABEL_21;
      }
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      while (1)
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(id *)(*((void *)&v34 + 1) + 8 * v21);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {

LABEL_13:
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke_3;
            v30[3] = &unk_1E56B7970;
            v30[4] = v22;
            id v33 = a1;
            id v32 = v15;
            v31 = v16;
            objc_msgSend(v22, "_cn_executeGetterForRepresentedKeys:", v30);

            goto LABEL_14;
          }
          int v23 = [v22 conformsToProtocol:&unk_1EE097850];

          if (v23) {
            goto LABEL_13;
          }
          long long v24 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v45 = v22;
            _os_log_impl(&dword_1909E3000, v24, OS_LOG_TYPE_INFO, "Found a key descriptor non conforming to the expected protocol, ignoring: %{public}@", buf, 0xCu);
          }

LABEL_14:
          ++v21;
        }
        while (v19 != v21);
        uint64_t v25 = [v17 countByEnumeratingWithState:&v34 objects:v46 count:16];
        uint64_t v19 = v25;
        if (!v25)
        {
LABEL_21:

          if (v26) {
            *uint64_t v26 = [v16 copy];
          }

          id v11 = v28;
          id v10 = v29;
          v12 = v27;
          goto LABEL_26;
        }
      }
    }
    long long v16 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1909E3000, v16, OS_LOG_TYPE_INFO, "Keys to convert should have been non null, not fetching anything", buf, 2u);
    }
LABEL_26:
  }
}

__CFString *__86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6
    && ([v5 key],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 containsKey:v7],
        v7,
        v8))
  {
    uint64_t v9 = [v5 CNValueForContact:*(void *)(a1 + 32)];
  }
  else if (v5)
  {
    objc_msgSend(v5, "CNValueFromABValue:", objc_msgSend(v5, "ABValueForABPerson:", *(void *)(a1 + 40)));
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if ([v5 isNonnull])
      {
        uint64_t v10 = [v5 valueClass];
        if (v10 == objc_opt_class())
        {
          uint64_t v9 = &stru_1EE052B80;
        }
        else
        {
          uint64_t v11 = [v5 valueClass];
          if (v11 == objc_opt_class())
          {
            uint64_t v9 = (__CFString *)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            uint64_t v12 = [v5 valueClass];
            if (v12 == objc_opt_class()) {
              uint64_t v9 = (__CFString *)MEMORY[0x1E4F1CC08];
            }
            else {
              uint64_t v9 = 0;
            }
          }
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    [v5 setCNValue:v9 onContact:*(void *)(a1 + 32)];
    if (v6)
    {
      id v13 = [v5 key];
      [v6 addKey:v13];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)(*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

id __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "_cn_unauthorizedKeys"),
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 containsKey:v3],
        v4,
        v5))
  {
    id v6 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138543362;
      id v12 = v3;
      _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_INFO, "Found an unauthorized key, ignoring: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = 0;
  }
  else
  {
    int v8 = +[CN contactPropertiesByKey];
    uint64_t v9 = [v8 objectForKeyedSubscript:v3];

    id v7 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  return v7;
}

+ (id)groupFromABGroup:(uint64_t)a1
{
  self;
  if (a2)
  {
    id v3 = (void *)ABRecordCopyValue(a2, *MEMORY[0x1E4F499A8]);
    if (v3) {
      id v3 = (void *)CFAutorelease(v3);
    }
    uint64_t v4 = *MEMORY[0x1E4F5A1F8];
    ABPropertyID v5 = *MEMORY[0x1E4F499B0];
    id v6 = v3;
    CFTypeRef v7 = ABRecordCopyValue(a2, v5);
    if (v7) {
      CFTypeRef v8 = CFAutorelease(v7);
    }
    else {
      CFTypeRef v8 = 0;
    }
    uint64_t v9 = (*(void (**)(uint64_t, CFTypeRef))(v4 + 16))(v4, v8);
    uint64_t RecordID = ABRecordGetRecordID(a2);
    int v11 = (void *)ABRecordCopyValue(a2, *MEMORY[0x1E4F49988]);
    if (v11) {
      int v11 = (void *)CFAutorelease(v11);
    }
    ABPropertyID v12 = *MEMORY[0x1E4F49998];
    id v13 = v11;
    char v14 = (void *)ABRecordCopyValue(a2, v12);
    if (v14) {
      char v14 = (void *)CFAutorelease(v14);
    }
    ABPropertyID v15 = *MEMORY[0x1E4F49990];
    id v16 = v14;
    id v17 = (void *)ABRecordCopyValue(a2, v15);
    if (v17) {
      id v17 = (void *)CFAutorelease(v17);
    }
    ABPropertyID v18 = *MEMORY[0x1E4F499A0];
    id v19 = v17;
    uint64_t v20 = (void *)ABRecordCopyValue(a2, v18);
    if (v20) {
      uint64_t v20 = (void *)CFAutorelease(v20);
    }
    id v21 = v20;
    id v22 = [(CNGroup *)[CNMutableGroup alloc] initWithIdentifier:v6 name:v9];

    [(CNMutableGroup *)v22 setIOSLegacyIdentifier:RecordID];
    [(CNMutableGroup *)v22 setExternalIdentifier:v13];

    [(CNMutableGroup *)v22 setExternalRepresentation:v16];
    [(CNMutableGroup *)v22 setExternalModificationTag:v19];

    [(CNMutableGroup *)v22 setExternalUUID:v21];
    a2 = [(CNMutableGroup *)v22 freezeWithSelfAsSnapshot];
  }

  return a2;
}

+ (id)groupsFromABGroups:(uint64_t)a1
{
  id v3 = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CNiOSABConversions_groupsFromABGroups___block_invoke;
  v6[3] = &__block_descriptor_40_e9__16__0_v8l;
  v6[4] = v3;
  uint64_t v4 = [v3 arrayByMappingTransform:v6 onCFArray:a2];

  return v4;
}

id __41__CNiOSABConversions_groupsFromABGroups___block_invoke(uint64_t a1, void *a2)
{
  return +[CNiOSABConversions groupFromABGroup:](*(void *)(a1 + 32), a2);
}

+ (id)containerFromABSource:(int)a3 remote:(int)a4 includeDisabledSources:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self;
  if (a2)
  {
    if (ABSourceIsRemote() != a3
      || (!ABRecordGetIntValue() ? (BOOL v7 = a4 == 0) : (BOOL v7 = 0), v7))
    {
      a2 = 0;
    }
    else
    {
      CFTypeRef v8 = objc_alloc_init(CNMutableContainer);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v9 = +[CN allContainerProperties];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            char v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v15 = [v14 ABValueForABSource:a2];
            if (![v14 isConvertibleABValue:v15])
            {

              a2 = 0;
              goto LABEL_18;
            }
            id v16 = [v14 CNValueFromABValue:v15];
            [v14 setCNValue:v16 onContainer:v8];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      a2 = [(CNMutableContainer *)v8 freezeWithSelfAsSnapshot];
LABEL_18:
    }
  }

  return a2;
}

+ (id)containersFromABSources:(char)a3 remote:(char)a4 includeDisabledSources:
{
  BOOL v7 = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CNiOSABConversions_containersFromABSources_remote_includeDisabledSources___block_invoke;
  v10[3] = &__block_descriptor_42_e9__16__0_v8l;
  v10[4] = v7;
  char v11 = a3;
  char v12 = a4;
  CFTypeRef v8 = [v7 arrayByMappingTransform:v10 onCFArray:a2];

  return v8;
}

id __76__CNiOSABConversions_containersFromABSources_remote_includeDisabledSources___block_invoke(uint64_t a1, void *a2)
{
  return +[CNiOSABConversions containerFromABSource:remote:includeDisabledSources:](*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

+ (CNAccount)accountFromABAccount:(uint64_t)a1
{
  self;
  if (a2)
  {
    uint64_t v3 = ABAccountCopyIdentifier();
    if (v3)
    {
      uint64_t v4 = (const void *)v3;
      ABPropertyID v5 = (const void *)ABAccountCopyInternalUUID();
      a2 = [[CNAccount alloc] initWithIdentifier:v5 externalIdentifier:v4 iOSLegacyIdentifier:ABRecordGetRecordID(a2)];
      if (v5) {
        CFRelease(v5);
      }
      CFRelease(v4);
    }
    else
    {
      a2 = +[CNAccount localAccount];
    }
  }

  return a2;
}

+ (id)accountsFromABAccounts:(uint64_t)a1
{
  uint64_t v3 = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CNiOSABConversions_accountsFromABAccounts___block_invoke;
  v6[3] = &__block_descriptor_40_e9__16__0_v8l;
  v6[4] = v3;
  uint64_t v4 = [v3 arrayByMappingTransform:v6 onCFArray:a2];

  return v4;
}

CNAccount *__45__CNiOSABConversions_accountsFromABAccounts___block_invoke(uint64_t a1, CNAccount *a2)
{
  return +[CNiOSABConversions accountFromABAccount:](*(void *)(a1 + 32), a2);
}

+ (CNContactMatchInfo)contactMatchInfoFromABMatchMetadataDictionary:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = objc_alloc_init(CNContactMatchInfo);
  uint64_t v4 = [v2 objectForKey:*MEMORY[0x1E4F49878]];
  if (v4)
  {
    [(CNContactMatchInfo *)v3 setRelevanceScore:v4];
    -[CNContactMatchInfo setMatchedNameProperty:](v3, "setMatchedNameProperty:", [v4 integerValue] > 0);
  }
  ABPropertyID v5 = [v2 objectForKey:*MEMORY[0x1E4F49868]];
  if ([(NSMapTable *)v5 count])
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v7 = +[CNiOSABConversions contactPropertiesByABPropertyID]();
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, v5);
    key = 0;
    value = 0;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
    {
      CFTypeRef v8 = [NSNumber numberWithInt:(key - 1)];
      uint64_t v9 = [v7 objectForKey:v8];
      uint64_t v10 = [v9 objectAtIndexedSubscript:0];

      if (v10)
      {
        char v11 = [v10 key];
        if (v11) {
          [v6 setValue:value forKey:v11];
        }
      }
    }
    NSEndMapTableEnumeration(&enumerator);
    [(CNContactMatchInfo *)v3 setMatchedProperties:v6];
  }
  char v12 = [v2 objectForKey:*MEMORY[0x1E4F49860]];
  if (v12)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v12];
    uint64_t v14 = *MEMORY[0x1E4F49858];
    uint64_t v15 = [v13 length];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __68__CNiOSABConversions_contactMatchInfoFromABMatchMetadataDictionary___block_invoke;
    uint64_t v23 = &unk_1E56B79D8;
    id v24 = v13;
    id v16 = v13;
    objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v15, 0, &v20);
    id v17 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
    objc_msgSend(v17, "finishWithResult:", v16, v20, v21, v22, v23);
    [(CNContactMatchInfo *)v3 setExcerpt:v17];
  }
  long long v18 = [v2 objectForKey:*MEMORY[0x1E4F49870]];
  [(CNContactMatchInfo *)v3 setMatchedTerms:v18];

  return v3;
}

void __68__CNiOSABConversions_contactMatchInfoFromABMatchMetadataDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([a2 BOOLValue])
  {
    BOOL v7 = *(void **)(a1 + 32);
    uint64_t v10 = @"contactExcerptEmphasized";
    CFTypeRef v8 = [NSNumber numberWithBool:1];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v7, "setAttributes:range:", v9, a3, a4);
  }
}

+ (id)arrayByMappingTransform:(id)a3 onCFArray:(__CFArray *)a4
{
  ABPropertyID v5 = (void (**)(id, const void *))a3;
  if (a4)
  {
    CFIndex Count = CFArrayGetCount(a4);
    BOOL v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
        uint64_t v10 = v5[2](v5, ValueAtIndex);
        if (v10) {
          [v7 addObject:v10];
        }
      }
    }
    a4 = (__CFArray *)[v7 copy];
  }

  return a4;
}

@end