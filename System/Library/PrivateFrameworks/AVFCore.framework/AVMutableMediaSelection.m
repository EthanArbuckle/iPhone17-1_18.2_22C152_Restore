@interface AVMutableMediaSelection
- (BOOL)_isValidMediaSelectionOption:(id)a3 forMediaSelectionGroup:(id)a4;
- (id)_validatedGroupIdentifierKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)selectMediaOption:(AVMediaSelectionOption *)mediaSelectionOption inMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;
@end

@implementation AVMutableMediaSelection

- (BOOL)_isValidMediaSelectionOption:(id)a3 forMediaSelectionGroup:(id)a4
{
  if (!a3)
  {
    if (([a4 allowsEmptySelection] & 1) == 0)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    goto LABEL_6;
  }
  if (!a4 || (int v4 = objc_msgSend((id)objc_msgSend(a4, "options"), "containsObject:", a3)) != 0) {
LABEL_6:
  }
    LOBYTE(v4) = 1;
  return v4;
}

- (id)_validatedGroupIdentifierKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(AVMediaSelection *)self _loadiVarsIfNeeded];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = *(void **)([(AVMediaSelection *)self _internal] + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    v9 = (void *)*MEMORY[0x1E4F34708];
    v10 = (void *)*MEMORY[0x1E4F34718];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v9), "isEqual:", objc_msgSend(a3, "_groupID")))v13 = v9; {
        else
        }
          v13 = 0;
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v10), "isEqual:", objc_msgSend(a3, "_groupMediaType")))v14 = v10; {
        else
        }
          v14 = v13;
        if (v14)
        {
          id v15 = v14;
          return v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v14 = 0;
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = [AVMediaSelection alloc];
  v5 = [(AVMediaSelection *)self asset];
  id v6 = [(AVMediaSelection *)self _selectedMediaArray];
  return [(AVMediaSelection *)v4 _initWithAsset:v5 selectedMediaArray:v6];
}

- (void)selectMediaOption:(AVMediaSelectionOption *)mediaSelectionOption inMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  [(AVMediaSelection *)self _loadiVarsIfNeeded];
  id v7 = [(AVMutableMediaSelection *)self _validatedGroupIdentifierKey:mediaSelectionGroup];
  if (v7)
  {
    uint64_t v8 = v7;
    if ([(AVMutableMediaSelection *)self _isValidMediaSelectionOption:mediaSelectionOption forMediaSelectionGroup:mediaSelectionGroup])
    {
      if (mediaSelectionOption) {
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[AVMediaSelectionOption dictionary](mediaSelectionOption, "dictionary"));
      }
      else {
        uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v10 = (void *)v9;
      uint64_t v11 = *MEMORY[0x1E4F34718];
      if ([v8 isEqualToString:*MEMORY[0x1E4F34718]])
      {
        id v12 = [(AVMediaSelectionGroup *)mediaSelectionGroup _groupMediaType];
        if (!v12)
        {
LABEL_13:
          v13 = *(void **)([(AVMediaSelection *)self _internal] + 24);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __67__AVMutableMediaSelection_selectMediaOption_inMediaSelectionGroup___block_invoke;
          v16[3] = &unk_1E57B2CB8;
          v16[4] = v10;
          uint64_t v14 = [v13 indexOfObjectPassingTest:v16];
          id v15 = *(void **)([(AVMediaSelection *)self _internal] + 24);
          if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
            [v15 addObject:v10];
          }
          else {
            [v15 replaceObjectAtIndex:v14 withObject:v10];
          }
          return;
        }
      }
      else
      {
        uint64_t v11 = *MEMORY[0x1E4F34708];
        if (![v8 isEqualToString:*MEMORY[0x1E4F34708]]
          || ![(AVMediaSelectionGroup *)mediaSelectionGroup _groupID])
        {
          goto LABEL_13;
        }
        id v12 = [(AVMediaSelectionGroup *)mediaSelectionGroup _groupID];
      }
      [v10 setObject:v12 forKey:v11];
      goto LABEL_13;
    }
  }
}

uint64_t __67__AVMutableMediaSelection_selectMediaOption_inMediaSelectionGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ((objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E4F34708]), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E4F34708])) & 1) != 0|| (uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E4F34718]), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E4F34718])), result))
  {
    uint64_t result = 1;
    *a4 = 1;
  }
  return result;
}

@end