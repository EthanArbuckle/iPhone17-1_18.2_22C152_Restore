@interface _INVocabularyGenerationDocument
- (BOOL)haveAssignedAllSiriIDs;
- (BOOL)resetOnNextSync;
- (NSArray)vocabularyItems;
- (NSString)appBundleID;
- (NSString)intentSlot;
- (NSString)thisGeneration;
- (NSString)validity;
- (_INVocabularyGenerationDocument)initWithContentsOfFile:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_everyVocabularyItemSiriID;
- (id)_initWithDictionary:(id)a3;
- (id)_itemsBySiriID;
- (id)_stringForSelector:(SEL)a3 from:(id)a4;
- (id)_valueForSelector:(SEL)a3 ofClass:(Class)a4 from:(id)a5;
- (id)_vocabularyItemForSiriID:(id)a3;
- (id)_vocabularyItemWithString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)diffFromPreviousDocument:(id)a3;
- (id)writeToFile:(id)a3 createIntermediateDirectories:(BOOL)a4;
- (void)_addValueForSelector:(SEL)a3 toDictionary:(id)a4;
- (void)_clearVocabularyItemCaches;
- (void)_takeValuesFromDictionary:(id)a3;
- (void)assignMissingSiriIDsForOptimalDiffFromPreviousDocument:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setHaveAssignedAllSiriIDs:(BOOL)a3;
- (void)setIntentSlot:(id)a3;
- (void)setResetOnNextSync:(BOOL)a3;
- (void)setThisGeneration:(id)a3;
- (void)setValidity:(id)a3;
- (void)setVocabularyItems:(id)a3;
@end

@implementation _INVocabularyGenerationDocument

- (id)diffFromPreviousDocument:(id)a3
{
  *(void *)((char *)&v58[2] + 6) = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 appBundleID];
    v7 = [(_INVocabularyGenerationDocument *)self appBundleID];
    char v8 = [v6 isEqual:v7];

    if (v8)
    {
      v9 = [v5 intentSlot];
      v10 = [(_INVocabularyGenerationDocument *)self intentSlot];
      char v11 = [v9 isEqual:v10];

      if (v11) {
        goto LABEL_4;
      }
      v44 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        v38 = 0;
        goto LABEL_32;
      }
      v40 = v44;
      v41 = [v5 intentSlot];
      v42 = [(_INVocabularyGenerationDocument *)self intentSlot];
      *(_DWORD *)buf = 136315906;
      v53 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      __int16 v54 = 2082;
      v55 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      __int16 v56 = 2114;
      *(void *)v57 = v41;
      *(_WORD *)&v57[8] = 2114;
      v58[0] = v42;
      v43 = "%s %{public}s previous document's slot %{public}@ != ours %{public}@";
    }
    else
    {
      v39 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      v40 = v39;
      v41 = [v5 appBundleID];
      v42 = [(_INVocabularyGenerationDocument *)self appBundleID];
      *(_DWORD *)buf = 136315906;
      v53 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      __int16 v54 = 2082;
      v55 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      __int16 v56 = 2114;
      *(void *)v57 = v41;
      *(_WORD *)&v57[8] = 2114;
      v58[0] = v42;
      v43 = "%s %{public}s previous document's appBundleID %{public}@ != ours %{public}@";
    }
    _os_log_error_impl(&dword_18CB2F000, v40, OS_LOG_TYPE_ERROR, v43, buf, 0x2Au);

    goto LABEL_31;
  }
LABEL_4:
  v12 = objc_alloc_init(_INVocabularyGenerationDiff);
  v13 = [(_INVocabularyGenerationDocument *)self appBundleID];
  [(_INVocabularyGenerationDiff *)v12 setAppBundleID:v13];

  v14 = [(_INVocabularyGenerationDocument *)self intentSlot];
  [(_INVocabularyGenerationDiff *)v12 setIntentSlotName:v14];

  v15 = [v5 vocabularyItems];
  uint64_t v16 = [v15 count];

  if (v16 && ([v5 haveAssignedAllSiriIDs] & 1) == 0)
  {
    v17 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v53 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      __int16 v54 = 2080;
      v55 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      __int16 v56 = 2112;
      *(void *)v57 = v5;
      _os_log_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_INFO, "%s %s previous document %@ has items that are missing identifiers, so it can not be trusted as a source for remote truth.", buf, 0x20u);
    }

    v5 = 0;
  }
  if (([v5 resetOnNextSync] & 1) != 0
    || [(_INVocabularyGenerationDocument *)self resetOnNextSync])
  {
    v18 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      int v20 = [v5 resetOnNextSync];
      BOOL v21 = [(_INVocabularyGenerationDocument *)self resetOnNextSync];
      *(_DWORD *)buf = 136316162;
      v53 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      __int16 v54 = 2080;
      v55 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      __int16 v56 = 1024;
      *(_DWORD *)v57 = v20;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v21;
      LOWORD(v58[0]) = 2112;
      *(void *)((char *)v58 + 2) = v5;
      _os_log_impl(&dword_18CB2F000, v19, OS_LOG_TYPE_INFO, "%s %s Reset requested by old=%d current=%d, computing diff as-if from nil. Discarded old %@", buf, 0x2Cu);
    }
    goto LABEL_14;
  }
  if (!v5)
  {
LABEL_14:
    [(_INVocabularyGenerationDiff *)v12 setIsFullReset:1];
    v5 = 0;
  }
  v22 = [v5 vocabularyItems];
  uint64_t v23 = [v22 count];

  if (!v23)
  {
    v24 = [(_INVocabularyGenerationDocument *)self vocabularyItems];
    uint64_t v25 = [v24 count];

    if (v25) {
      [(_INVocabularyGenerationDiff *)v12 setIsFullReset:1];
    }
  }
  v46 = v12;
  [v5 assignMissingSiriIDsForOptimalDiffFromPreviousDocument:0];
  [(_INVocabularyGenerationDocument *)self assignMissingSiriIDsForOptimalDiffFromPreviousDocument:v5];
  v26 = [(_INVocabularyGenerationDocument *)self vocabularyItems];
  v27 = [v5 _everyVocabularyItemSiriID];
  v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v26, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v29 = v26;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v48 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v35 = [v34 _siriID];
        [v27 removeObject:v35];

        v36 = [v34 _siriID];
        v37 = [v5 _vocabularyItemForSiriID:v36];

        if (([v37 _isSimilarEnoughToNotSync:v34] & 1) == 0) {
          [v28 addObject:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v31);
  }

  v38 = v46;
  -[_INVocabularyGenerationDiff setCountOfVocabularyItemsAfterApplying:](v46, "setCountOfVocabularyItemsAfterApplying:", [v29 count]);
  [(_INVocabularyGenerationDiff *)v46 setUpdatedVocabularyItems:v28];
  [(_INVocabularyGenerationDiff *)v46 setDeletedSiriIDs:v27];

LABEL_32:

  return v38;
}

- (NSArray)vocabularyItems
{
  return self->_vocabularyItems;
}

- (BOOL)resetOnNextSync
{
  return self->_resetOnNextSync;
}

- (NSString)intentSlot
{
  return self->_intentSlot;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)assignMissingSiriIDsForOptimalDiffFromPreviousDocument:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_haveAssignedAllSiriIDs)
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[_INVocabularyGenerationDocument assignMissingSiriIDsForOptimalDiffFromPreviousDocument:]";
      __int16 v41 = 2112;
      id v42 = v4;
      _os_log_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    v28 = self;
    v6 = [(_INVocabularyGenerationDocument *)self vocabularyItems];
    v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    char v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v15 = [v14 _siriID];
          if (v15)
          {
            uint64_t v16 = v8;
            v17 = v15;
          }
          else
          {
            uint64_t v16 = v7;
            v17 = v14;
          }
          [v16 addObject:v17];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v11);
    }
    v27 = v9;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          v24 = objc_msgSend(v23, "string", v27);
          uint64_t v25 = [v4 _vocabularyItemWithString:v24];

          if (!v25) {
            goto LABEL_23;
          }
          v26 = [v25 _siriID];
          if (!v26 || [v8 containsObject:v26])
          {

LABEL_23:
            v26 = [MEMORY[0x1E4F29128] UUID];
          }
          [v23 _setSiriID:v26];
          [v8 addObject:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }

    v28->_haveAssignedAllSiriIDs = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyItems, 0);
  objc_storeStrong((id *)&self->_thisGeneration, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_intentSlot, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_itemsByStringCache, 0);

  objc_storeStrong((id *)&self->_itemsBySiriIDCache, 0);
}

- (id)writeToFile:(id)a3 createIntermediateDirectories:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    char v8 = [v6 stringByDeletingLastPathComponent];
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    int v10 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:MEMORY[0x1E4F1CC08] error:&v21];
    id v11 = v21;

    if (!v10)
    {
      id v16 = v11;
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F28F98];
  v13 = [(_INVocabularyGenerationDocument *)self _dictionaryRepresentation];
  id v20 = 0;
  char v8 = [v12 dataWithPropertyList:v13 format:200 options:0 error:&v20];
  id v14 = v20;

  id v19 = v14;
  int v15 = [v8 writeToFile:v7 options:1073741825 error:&v19];
  id v16 = v19;

  if (v15) {
    id v11 = 0;
  }
  else {
    id v11 = v16;
  }
LABEL_9:
  id v17 = v11;

  return v17;
}

- (void)setVocabularyItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_INVocabularyGenerationDocument *)self _clearVocabularyItemCaches];
  v5 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
  vocabularyItems = self->_vocabularyItems;
  self->_vocabularyItems = v5;

  self->_haveAssignedAllSiriIDs = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_vocabularyItems;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_siriID", (void)v13);

        if (!v12)
        {
          self->_haveAssignedAllSiriIDs = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setIntentSlot:(id)a3
{
}

- (void)setAppBundleID:(id)a3
{
}

- (_INVocabularyGenerationDocument)initWithContentsOfFile:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  if (v5)
  {
    self = (_INVocabularyGenerationDocument *)[(_INVocabularyGenerationDocument *)self _initWithDictionary:v5];
    id v6 = self;
  }
  else
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[_INVocabularyGenerationDocument initWithContentsOfFile:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s No file at %@", (uint8_t *)&v9, 0x16u);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)_dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:&unk_1EDBA7438 forKey:@"version"];
  if ([(_INVocabularyGenerationDocument *)self resetOnNextSync]) {
    [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"resetOnNextSync"];
  }
  [(_INVocabularyGenerationDocument *)self _addValueForSelector:sel_validity toDictionary:v3];
  [(_INVocabularyGenerationDocument *)self _addValueForSelector:sel_thisGeneration toDictionary:v3];
  [(_INVocabularyGenerationDocument *)self _addValueForSelector:sel_appBundleID toDictionary:v3];
  [(_INVocabularyGenerationDocument *)self _addValueForSelector:sel_intentSlot toDictionary:v3];
  id v4 = [(_INVocabularyGenerationDocument *)self vocabularyItems];
  v5 = [v4 valueForKey:@"_dictionaryForSaving"];

  [v3 setValue:v5 forKey:@"vocabularyItems"];

  return v3;
}

- (void)_addValueForSelector:(SEL)a3 toDictionary:(id)a4
{
  id v8 = a4;
  id v6 = [(_INVocabularyGenerationDocument *)self performSelector:a3];
  if (v6)
  {
    v7 = NSStringFromSelector(a3);
    [v8 setValue:v6 forKey:v7];
  }
}

- (NSString)validity
{
  return self->_validity;
}

- (NSString)thisGeneration
{
  return self->_thisGeneration;
}

- (void)_clearVocabularyItemCaches
{
  itemsBySiriIDCache = self->_itemsBySiriIDCache;
  self->_itemsBySiriIDCache = 0;

  itemsByStringCache = self->_itemsByStringCache;
  self->_itemsByStringCache = 0;
}

- (void)setHaveAssignedAllSiriIDs:(BOOL)a3
{
  self->_haveAssignedAllSiriIDs = a3;
}

- (BOOL)haveAssignedAllSiriIDs
{
  return self->_haveAssignedAllSiriIDs;
}

- (void)setThisGeneration:(id)a3
{
}

- (void)setValidity:(id)a3
{
}

- (void)setResetOnNextSync:(BOOL)a3
{
  self->_resetOnNextSync = a3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(_INVocabularyGenerationDocument *)self resetOnNextSync]) {
    v5 = @"requires reset, ";
  }
  else {
    v5 = &stru_1EDA6DB28;
  }
  id v6 = [(_INVocabularyGenerationDocument *)self thisGeneration];
  v7 = NSNumber;
  id v8 = [(_INVocabularyGenerationDocument *)self vocabularyItems];
  int v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p>{%@at %@, %@ items}", v4, self, v5, v6, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(_INVocabularyGenerationDocument *)self _dictionaryRepresentation];
  id v6 = (void *)[v4 _initWithDictionary:v5];

  return v6;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_INVocabularyGenerationDocument;
  v5 = [(_INVocabularyGenerationDocument *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(_INVocabularyGenerationDocument *)v5 _takeValuesFromDictionary:v4];
  }

  return v6;
}

- (void)_takeValuesFromDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24 = [v4 valueForKey:@"version"];
  if (([v24 isEqual:&unk_1EDBA7438] & 1) == 0)
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v34 = "-[_INVocabularyGenerationDocument _takeValuesFromDictionary:]";
      __int16 v35 = 2080;
      long long v36 = "-[_INVocabularyGenerationDocument _takeValuesFromDictionary:]";
      _os_log_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_INFO, "%s %s dictionary is missing version number", buf, 0x16u);
    }
  }
  id v6 = [v4 valueForKey:@"resetOnNextSync"];
  -[_INVocabularyGenerationDocument setResetOnNextSync:](self, "setResetOnNextSync:", [v6 BOOLValue]);

  v7 = [(_INVocabularyGenerationDocument *)self _stringForSelector:sel_validity from:v4];
  [(_INVocabularyGenerationDocument *)self setValidity:v7];

  objc_super v8 = [(_INVocabularyGenerationDocument *)self _stringForSelector:sel_thisGeneration from:v4];
  [(_INVocabularyGenerationDocument *)self setThisGeneration:v8];

  int v9 = [(_INVocabularyGenerationDocument *)self _stringForSelector:sel_appBundleID from:v4];
  [(_INVocabularyGenerationDocument *)self setAppBundleID:v9];

  uint64_t v10 = [(_INVocabularyGenerationDocument *)self _stringForSelector:sel_intentSlot from:v4];
  [(_INVocabularyGenerationDocument *)self setIntentSlot:v10];

  uint64_t v25 = v4;
  __int16 v11 = [(_INVocabularyGenerationDocument *)self _valueForSelector:sel_vocabularyItems ofClass:objc_opt_class() from:v4];
  v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = [(_INVocabularyGenerationDocument *)self _stringForSelector:sel_string from:v16];
          uint64_t v18 = [(_INVocabularyGenerationDocument *)self _stringForSelector:sel_vocabularyIdentifier from:v16];
          id v19 = [(_INVocabularyGenerationDocument *)self _valueForSelector:sel_requiresUserIdentification ofClass:objc_opt_class() from:v16];
          uint64_t v20 = [v19 BOOLValue];

          if (v17)
          {
            id v21 = [[_INVocabularyItem alloc] initWithString:v17 vocabularyIdentifier:v18 requiresUserIdentification:v20];
            v22 = [(_INVocabularyGenerationDocument *)self _stringForSelector:sel__siriID from:v16];
            if (v22)
            {
              uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v22];
              [(_INVocabularyItem *)v21 _setSiriID:v23];
            }
            [v26 addObject:v21];
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  [(_INVocabularyGenerationDocument *)self setVocabularyItems:v26];
}

- (id)_stringForSelector:(SEL)a3 from:(id)a4
{
  id v6 = a4;
  v7 = [(_INVocabularyGenerationDocument *)self _valueForSelector:a3 ofClass:objc_opt_class() from:v6];

  return v7;
}

- (id)_valueForSelector:(SEL)a3 ofClass:(Class)a4 from:(id)a5
{
  id v6 = a5;
  v7 = NSStringFromSelector(a3);
  objc_super v8 = [v6 objectForKeyedSubscript:v7];

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_super v8 = 0;
  }

  return v8;
}

- (id)_vocabularyItemWithString:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    itemsByStringCache = self->_itemsByStringCache;
    if (!itemsByStringCache)
    {
      id v21 = v4;
      id v6 = [(_INVocabularyGenerationDocument *)self vocabularyItems];
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      objc_super v8 = self->_itemsByStringCache;
      self->_itemsByStringCache = v7;

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            long long v15 = [v14 string];
            if ([v15 length])
            {
              [(NSMutableDictionary *)self->_itemsByStringCache setObject:v14 forKeyedSubscript:v15];
            }
            else
            {
              uint64_t v16 = (void *)INSiriLogContextIntents;
              if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
              {
                id v17 = v16;
                uint64_t v18 = [v14 _siriID];
                *(_DWORD *)buf = 136315650;
                v27 = "-[_INVocabularyGenerationDocument _vocabularyItemWithString:]";
                __int16 v28 = 2112;
                long long v29 = v14;
                __int16 v30 = 2112;
                long long v31 = v18;
                _os_log_error_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_ERROR, "%s found _INVocabularyItem with empty string %@ %@", buf, 0x20u);
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
        }
        while (v11);
      }

      itemsByStringCache = self->_itemsByStringCache;
      id v4 = v21;
    }
    id v19 = [(NSMutableDictionary *)itemsByStringCache objectForKeyedSubscript:v4];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)_vocabularyItemForSiriID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(_INVocabularyGenerationDocument *)self _itemsBySiriID];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_everyVocabularyItemSiriID
{
  v2 = [(_INVocabularyGenerationDocument *)self _itemsBySiriID];
  v3 = [v2 allKeys];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_itemsBySiriID
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  itemsBySiriIDCache = self->_itemsBySiriIDCache;
  if (itemsBySiriIDCache)
  {
    v3 = itemsBySiriIDCache;
  }
  else
  {
    [(_INVocabularyGenerationDocument *)self assignMissingSiriIDsForOptimalDiffFromPreviousDocument:0];
    v5 = [(_INVocabularyGenerationDocument *)self vocabularyItems];
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_itemsBySiriIDCache;
    self->_itemsBySiriIDCache = v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "_siriID", (void)v16);
          if (v14) {
            [(NSMutableDictionary *)self->_itemsBySiriIDCache setObject:v13 forKeyedSubscript:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    v3 = self->_itemsBySiriIDCache;
  }

  return v3;
}

@end