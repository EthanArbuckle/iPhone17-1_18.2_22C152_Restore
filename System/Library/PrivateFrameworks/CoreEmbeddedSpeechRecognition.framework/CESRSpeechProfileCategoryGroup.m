@interface CESRSpeechProfileCategoryGroup
+ (id)_addAssociatedSpeechCategories:(id)a3;
+ (id)_all;
+ (id)all;
+ (id)groupForSets:(id)a3;
+ (id)groupForSpeechCategories:(id)a3;
+ (id)mergeGroups:(id)a3;
+ (void)_buildCaches;
+ (void)_buildCachesFromBaseMap:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpeechCategoryGroup:(id)a3;
- (CESRSpeechProfileCategoryGroup)initWithItemTypes:(id)a3 speechCategories:(id)a4;
- (NSSet)itemTypes;
- (NSSet)speechCategories;
- (id)description;
- (id)speechCategoriesDescription;
- (unint64_t)hash;
@end

@implementation CESRSpeechProfileCategoryGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechCategories, 0);

  objc_storeStrong((id *)&self->_itemTypes, 0);
}

- (NSSet)speechCategories
{
  return self->_speechCategories;
}

- (NSSet)itemTypes
{
  return self->_itemTypes;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_itemTypes hash];
  return [(NSSet *)self->_speechCategories hash] ^ v3;
}

- (BOOL)isEqualToSpeechCategoryGroup:(id)a3
{
  id v4 = a3;
  itemTypes = self->_itemTypes;
  v6 = [v4 itemTypes];
  if ([(NSSet *)itemTypes isEqual:v6])
  {
    speechCategories = self->_speechCategories;
    v8 = [v4 speechCategories];
    char v9 = [(NSSet *)speechCategories isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CESRSpeechProfileCategoryGroup *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CESRSpeechProfileCategoryGroup *)self isEqualToSpeechCategoryGroup:v5];

  return v6;
}

- (id)speechCategoriesDescription
{
  v2 = NSString;
  uint64_t v3 = _speechCategoriesDescription(self->_speechCategories);
  id v4 = [v2 stringWithFormat:@"[%@]", v3];

  return v4;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  id v4 = self->_itemTypes;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSSet count](v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v6 = v4;
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) unsignedShortValue];
        v12 = [MEMORY[0x1E4F70B80] descriptionForTypeIdentifier:v11];
        [v5 addObject:v12];
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v13 = [v5 componentsJoinedByString:@", "];

  v14 = _speechCategoriesDescription(self->_speechCategories);
  v15 = [v3 stringWithFormat:@"{itemTypes: [%@], speechCategories: [%@]}", v13, v14, (void)v17];

  return v15;
}

- (CESRSpeechProfileCategoryGroup)initWithItemTypes:(id)a3 speechCategories:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CESRSpeechProfileCategoryGroup;
  uint64_t v9 = [(CESRSpeechProfileCategoryGroup *)&v16 init];
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_itemTypes, a3), objc_storeStrong((id *)&v10->_speechCategories, a4),
                                                     v10->_itemTypes)
    && v10->_speechCategories)
  {
    uint64_t v11 = v10;
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      v14 = v12;
      v15 = [(CESRSpeechProfileCategoryGroup *)v10 description];
      *(_DWORD *)buf = 136315394;
      long long v18 = "-[CESRSpeechProfileCategoryGroup initWithItemTypes:speechCategories:]";
      __int16 v19 = 2112;
      long long v20 = v15;
      _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)mergeGroups:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "itemTypes", (void)v18);
          v14 = [v13 allObjects];
          [v5 addObjectsFromArray:v14];

          v15 = [v12 speechCategories];
          objc_super v16 = [v15 allObjects];
          [v6 addObjectsFromArray:v16];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v4 = [[CESRSpeechProfileCategoryGroup alloc] initWithItemTypes:v5 speechCategories:v6];
  }

  return v4;
}

+ (id)_all
{
  [(id)objc_opt_class() _buildCaches];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(id)speechCategoryToItemTypeCache allKeys];
  id v4 = [v2 setWithArray:v3];

  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(id)itemTypeToSpeechCategoryCache allKeys];
  id v7 = [v5 setWithArray:v6];

  uint64_t v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithItemTypes:v7 speechCategories:v4];

  return v8;
}

+ (id)all
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CESRSpeechProfileCategoryGroup_all__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (all_onceToken != -1) {
    dispatch_once(&all_onceToken, block);
  }
  v2 = (void *)all_all;

  return v2;
}

uint64_t __37__CESRSpeechProfileCategoryGroup_all__block_invoke()
{
  uint64_t v0 = [(id)objc_opt_class() _all];
  uint64_t v1 = all_all;
  all_all = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_addAssociatedSpeechCategories:(id)a3
{
  id v3 = [MEMORY[0x1E4F1CA80] setWithSet:a3];
  if (([v3 containsObject:@"\\NT-contact"] & 1) != 0
    || [v3 containsObject:@"\\NT-appcontact"])
  {
    [v3 addObject:@"\\NT-contact"];
    [v3 addObject:@"\\NT-appcontact"];
  }

  return v3;
}

+ (id)groupForSpeechCategories:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [(id)objc_opt_class() _buildCaches];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = +[CESRSpeechProfileCategoryGroup _addAssociatedSpeechCategories:v3];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend((id)speechCategoryToItemTypeCache, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v4 unionSet:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }

  if (![v4 count])
  {
    v12 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v21 = "+[CESRSpeechProfileCategoryGroup groupForSpeechCategories:]";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_ERROR, "%s Categories (%@) matched no item types", buf, 0x16u);
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", (void)v16);

    id v6 = (id)v13;
  }
  v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithItemTypes:v4 speechCategories:v6];

  return v14;
}

+ (id)groupForSets:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v20 = a1;
  [(id)objc_opt_class() _buildCaches];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "itemType", v20));
        uint64_t v10 = [(id)itemTypeToSpeechCategoryCache objectForKey:v9];
        uint64_t v11 = +[CESRSpeechProfileCategoryGroup _addAssociatedSpeechCategories:v10];

        if ([v11 count])
        {
          [v22 unionSet:v11];
          [v5 addObject:v9];
        }
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = [(id)speechCategoryToItemTypeCache objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * j)];
              if (v17) {
                [v5 unionSet:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  long long v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithItemTypes:v5 speechCategories:v22];

  return v18;
}

+ (void)_buildCaches
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CESRSpeechProfileCategoryGroup__buildCaches__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_buildCaches_onceToken != -1) {
    dispatch_once(&_buildCaches_onceToken, block);
  }
}

void __46__CESRSpeechProfileCategoryGroup__buildCaches__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  id v1 = +[CESRSpeechProfileBuilder categoryToFieldTypeMap];
  [v0 _buildCachesFromBaseMap:v1];
}

+ (void)_buildCachesFromBaseMap:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = (void *)speechCategoryToItemTypeCache;
  speechCategoryToItemTypeCache = v4;

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = (void *)itemTypeToSpeechCategoryCache;
  itemTypeToSpeechCategoryCache = (uint64_t)v6;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [v3 allKeys];
  uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v8;
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * v8);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v10 = [v3 objectForKey:v9];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          id v13 = 0;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = [*(id *)(*((void *)&v27 + 1) + 8 * i) unsignedShortValue];
              id v26 = 0;
              uint64_t v17 = [MEMORY[0x1E4F70B80] itemTypeForFieldType:v16 error:&v26];
              id v18 = v26;
              if (v17)
              {
                long long v19 = [NSNumber numberWithUnsignedShort:v17];
                if (!v13)
                {
                  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  [(id)speechCategoryToItemTypeCache setObject:v13 forKey:v9];
                }
                [v13 addObject:v19];
                id v20 = [(id)itemTypeToSpeechCategoryCache objectForKey:v19];
                if (!v20)
                {
                  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  [(id)itemTypeToSpeechCategoryCache setObject:v20 forKey:v19];
                }
                [v20 addObject:v9];
              }
              else
              {
                long long v21 = *MEMORY[0x1E4F4E380];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v36 = "+[CESRSpeechProfileCategoryGroup _buildCachesFromBaseMap:]";
                  __int16 v37 = 2112;
                  id v38 = v18;
                  _os_log_error_impl(&dword_1B8CCB000, v21, OS_LOG_TYPE_ERROR, "%s Failed to resolve item type for field type, error: %@", buf, 0x16u);
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v12);
        }
        else
        {
          id v13 = 0;
        }

        uint64_t v8 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v24);
  }
}

@end