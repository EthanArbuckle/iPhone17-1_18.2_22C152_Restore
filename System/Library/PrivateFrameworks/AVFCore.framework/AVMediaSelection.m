@interface AVMediaSelection
- (AVAsset)asset;
- (AVMediaSelection)initWithAsset:(id)a3 propertyList:(id)a4;
- (AVMediaSelectionOption)selectedMediaOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;
- (BOOL)isEqual:(id)a3;
- (BOOL)mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;
- (id)_dictionaryGroupsWithSelectedOption;
- (id)_groupDictionaries;
- (id)_initWithAsset:(id)a3;
- (id)_initWithAsset:(id)a3 selectedMediaArray:(id)a4;
- (id)_initWithAssetWithoutGroupDictionaries:(id)a3;
- (id)_initWithDeferredLoadingOfAsset:(id)a3 selectedMediaArray:(id)a4;
- (id)_internal;
- (id)_propertyListForSelectedMediaOptionInMediaSelectionGroup:(id)a3;
- (id)_selectedMediaArray;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_createDefaultMediaSelectionOptions;
- (void)_loadiVarsIfNeeded;
- (void)dealloc;
@end

@implementation AVMediaSelection

- (id)_initWithAsset:(id)a3 selectedMediaArray:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVMediaSelection;
  v6 = [(AVMediaSelection *)&v9 init];
  if (v6)
  {
    v7 = objc_alloc_init(AVMediaSelectionInternal);
    v6->_mediaSelection = v7;
    if (v7)
    {
      v6->_mediaSelection->assetWeakReference = (AVWeakReference *)(id)[a3 _weakReference];
      v6->_mediaSelection->groupDictionaries = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "_mediaSelectionGroupDictionaries"), "copy");
      if (a4) {
        v6->_mediaSelection->selectedMediaArray = (NSMutableArray *)[a4 mutableCopy];
      }
      else {
        [(AVMediaSelection *)v6 _loadiVarsIfNeeded];
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (id)_initWithDeferredLoadingOfAsset:(id)a3 selectedMediaArray:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVMediaSelection;
  v6 = [(AVMediaSelection *)&v9 init];
  if (v6)
  {
    v7 = objc_alloc_init(AVMediaSelectionInternal);
    v6->_mediaSelection = v7;
    if (v7)
    {
      v6->_mediaSelection->assetWeakReference = (AVWeakReference *)(id)[a3 _weakReference];
      v6->_mediaSelection->groupDictionaries = 0;
      v6->_mediaSelection->selectedMediaArray = (NSMutableArray *)[a4 mutableCopy];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (id)_initWithAsset:(id)a3
{
  return [(AVMediaSelection *)self _initWithAsset:a3 selectedMediaArray:0];
}

- (id)_initWithAssetWithoutGroupDictionaries:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVMediaSelection;
  v4 = [(AVMediaSelection *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVMediaSelectionInternal);
    v4->_mediaSelection = v5;
    if (v5)
    {
      v4->_mediaSelection->assetWeakReference = (AVWeakReference *)(id)[a3 _weakReference];
      v4->_mediaSelection->groupDictionaries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v4->_mediaSelection->selectedMediaArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)_selectedMediaArray
{
  [(AVMediaSelection *)self _loadiVarsIfNeeded];
  v3 = (void *)[(NSMutableArray *)self->_mediaSelection->selectedMediaArray copy];
  return v3;
}

- (id)_groupDictionaries
{
  return self->_mediaSelection->groupDictionaries;
}

- (void)_loadiVarsIfNeeded
{
  mediaSelection = self->_mediaSelection;
  if (!mediaSelection->groupDictionaries)
  {
    self->_mediaSelection->groupDictionaries = (NSArray *)objc_msgSend(-[AVAsset _mediaSelectionGroupDictionaries](-[AVMediaSelection asset](self, "asset"), "_mediaSelectionGroupDictionaries"), "copy");
    mediaSelection = self->_mediaSelection;
  }
  if (!mediaSelection->selectedMediaArray)
  {
    [(AVMediaSelection *)self _createDefaultMediaSelectionOptions];
  }
}

- (void)_createDefaultMediaSelectionOptions
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v17 = self;
  obuint64_t j = self->_mediaSelection->groupDictionaries;
  uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    uint64_t v23 = *MEMORY[0x1E4F34718];
    uint64_t v3 = *MEMORY[0x1E4F34708];
    uint64_t v20 = *MEMORY[0x1E4F34720];
    uint64_t v4 = *MEMORY[0x1E4F34778];
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v7 = [v6 objectForKey:v23];
        uint64_t v8 = [v6 objectForKey:v3];
        objc_super v9 = (void *)[v6 objectForKey:v20];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v14, "objectForKey:", v4), "BOOLValue"))
              {
                v15 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v14];
                v16 = v15;
                if (v7) {
                  [v15 setObject:v7 forKey:v23];
                }
                if (v8) {
                  [v16 setObject:v8 forKey:v3];
                }
                [v16 setObject:MEMORY[0x1E4F1CC38] forKey:@"AVMediaSelection_DefaultSelection"];
                [(NSMutableArray *)v19 addObject:v16];
                goto LABEL_20;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_20:
        ;
      }
      uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
  v17->_mediaSelection->selectedMediaArray = v19;
}

- (AVMediaSelection)initWithAsset:(id)a3 propertyList:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v9 = self;
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"[propertyList isKindOfClass:[NSArray class]]"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  return (AVMediaSelection *)[(AVMediaSelection *)self _initWithAsset:a3 selectedMediaArray:a4];
}

- (void)dealloc
{
  mediaSelection = self->_mediaSelection;
  if (mediaSelection)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMediaSelection;
  [(AVMediaSelection *)&v4 dealloc];
}

- (id)_dictionaryGroupsWithSelectedOption
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [(AVMediaSelection *)self _loadiVarsIfNeeded];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  selectedMediaArray = self->_mediaSelection->selectedMediaArray;
  uint64_t v5 = [(NSMutableArray *)selectedMediaArray countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(selectedMediaArray);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = 0;
        id v10 = [(AVAsset *)[(AVMediaSelection *)self asset] mediaSelectionGroupForPropertyList:v9 mediaSelectionOption:&v12];
        if (v12) {
          [v3 setObject:v12 forKey:v10];
        }
      }
      uint64_t v6 = [(NSMutableArray *)selectedMediaArray countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [(AVMediaSelection *)self _dictionaryGroupsWithSelectedOption];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = @"{";
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v5 + (int)i >= 1) {
          uint64_t v7 = (__CFString *)[(__CFString *)v7 stringByAppendingString:@","];
        }
        uint64_t v7 = (__CFString *)-[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", @" %@ : %@ ", [v9 _primaryMediaCharacteristic], objc_msgSend(v2, "objectForKey:", v9));
      }
      v5 += v4;
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v7 = @"{";
  }
  uint64_t v10 = [(__CFString *)v7 stringByAppendingString:@"}"];
  uint64_t v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  return (id)[v11 stringWithFormat:@"<%@: %p, group characteristics and selected options = %@>", NSStringFromClass(v12), self, v10];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(AVMediaSelection *)self _dictionaryGroupsWithSelectedOption];
  uint64_t v6 = [a3 _dictionaryGroupsWithSelectedOption];
  return [v5 isEqualToDictionary:v6];
}

- (unint64_t)hash
{
  id v2 = [(AVMediaSelection *)self _dictionaryGroupsWithSelectedOption];
  return [v2 hash];
}

- (id)_internal
{
  return self->_mediaSelection;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [AVMutableMediaSelection alloc];
  id v5 = [(AVMediaSelection *)self asset];
  id v6 = [(AVMediaSelection *)self _selectedMediaArray];
  return [(AVMediaSelection *)v4 _initWithAsset:v5 selectedMediaArray:v6];
}

- (AVAsset)asset
{
  return (AVAsset *)[(AVWeakReference *)self->_mediaSelection->assetWeakReference referencedObject];
}

- (id)_propertyListForSelectedMediaOptionInMediaSelectionGroup:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(AVMediaSelection *)self _loadiVarsIfNeeded];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  selectedMediaArray = self->_mediaSelection->selectedMediaArray;
  id v6 = (void *)[(NSMutableArray *)selectedMediaArray countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = *MEMORY[0x1E4F34708];
    uint64_t v10 = *MEMORY[0x1E4F34718];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(selectedMediaArray);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v9), "isEqual:", objc_msgSend(a3, "_groupID")) & 1) != 0
          || objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v10), "isEqual:", objc_msgSend(a3, "_groupMediaType")))
        {
          id v6 = (void *)[v12 copy];
          return v6;
        }
      }
      uint64_t v7 = [(NSMutableArray *)selectedMediaArray countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v6 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (AVMediaSelectionOption)selectedMediaOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  id v4 = -[AVMediaSelection _propertyListForSelectedMediaOptionInMediaSelectionGroup:](self, "_propertyListForSelectedMediaOptionInMediaSelectionGroup:");
  if (v4)
  {
    return [(AVMediaSelectionGroup *)mediaSelectionGroup mediaSelectionOptionWithPropertyList:v4];
  }
  else
  {
    return [(AVMediaSelectionGroup *)mediaSelectionGroup defaultOption];
  }
}

- (BOOL)mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  id v3 = [(AVMediaSelection *)self _propertyListForSelectedMediaOptionInMediaSelectionGroup:mediaSelectionGroup];
  if (!v3) {
    return 1;
  }
  id v4 = v3;
  if (objc_msgSend((id)objc_msgSend(v3, "objectForKey:", @"AVMediaSelection_DefaultSelection"), "BOOLValue")) {
    return 1;
  }
  id v6 = (void *)[v4 objectForKey:*MEMORY[0x1E4F33CE0]];
  return [v6 BOOLValue];
}

@end