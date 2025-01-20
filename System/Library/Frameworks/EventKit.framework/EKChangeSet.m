@interface EKChangeSet
- (BOOL)_isNewAndUnsaved;
- (BOOL)hasChanges;
- (BOOL)hasUnsavedChangeForKey:(id)a3;
- (BOOL)hasUnsavedChanges;
- (BOOL)hasUnsavedMultiValueAdditionForKey:(id)a3;
- (BOOL)hasUnsavedMultiValueRemovalForKey:(id)a3;
- (BOOL)isDeleted;
- (BOOL)isEffectivelyEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isModified;
- (BOOL)isNew;
- (BOOL)isSaved;
- (BOOL)isUndeleted;
- (BOOL)isUndetached;
- (BOOL)isUniqueAddedObject:(id)a3 forKey:(id)a4;
- (BOOL)skipsPersistentObjectCopy;
- (EKChangeSet)init;
- (EKChangeSet)initWithChangeSet:(id)a3;
- (EKChangeSet)initWithChangeSet:(id)a3 changesToKeep:(id)a4;
- (EKChangeSet)initWithChangeSet:(id)a3 changesToSkip:(id)a4;
- (EKChangeSet)initWithChangeSet:(id)a3 filter:(id)a4;
- (EKChangeSet)initWithSingleValueChanges:(id)a3 multiValueAdditions:(id)a4 multiValueRemovals:(id)a5;
- (NSMutableDictionary)multiValueAdditions;
- (NSMutableDictionary)multiValueRemovals;
- (NSMutableDictionary)singleValueChanges;
- (id)_initWithChangeSet:(id)a3 filter:(id)a4;
- (id)_uniqueIdentifierToObjectMapForObjects:(id)a3 identifierBlock:(id)a4;
- (id)changedKeys;
- (id)changedMultiValueKeys;
- (id)changedSingleValueKeys;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)summary;
- (id)unsavedMultiValueAddedObjectsForKey:(id)a3;
- (id)unsavedMultiValueRemovedObjectsForKey:(id)a3;
- (id)valueForSingleValueKey:(id)a3 basedOn:(id)a4;
- (id)valueForSingleValueKey:(id)a3 basedOn:(id)a4 and:(id)a5;
- (id)valuesForMultiValueKey:(id)a3 basedOn:(id)a4 and:(id)a5;
- (id)valuesForMultiValueKey:(id)a3 basedOnSet:(id)a4;
- (void)_cleanupEmptySetsForMultiValueKey:(id)a3;
- (void)addChanges:(id)a3;
- (void)addChanges:(id)a3 shouldCopyKeyCallback:(id)a4;
- (void)addChanges:(id)a3 shouldCopyKeyCallback:(id)a4 objectIdentifierBlock:(id)a5;
- (void)addChangesAndUpdateUniqueMultiValueObjects:(id)a3;
- (void)addToChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6;
- (void)addToChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6 shouldCopyKeyCallback:(id)a7 objectIdentifierBlock:(id)a8;
- (void)changeSingleValue:(id)a3 forKey:(id)a4 basedOn:(id)a5;
- (void)changeSingleValue:(id)a3 forKey:(id)a4 basedOn:(id)a5 and:(id)a6;
- (void)forceChangeValue:(id)a3 forKey:(id)a4;
- (void)markChangesAsSaved;
- (void)removeAllChangesExceptRemovals;
- (void)removeFromChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6;
- (void)removeFromChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6 objectIdentifierBlock:(id)a7;
- (void)replaceMultiChangeAddedObject:(id)a3 withObject:(id)a4 forKey:(id)a5;
- (void)replaceUniqueMultiValueObjectsWithUpdatedObjects:(id)a3;
- (void)rollbackChanges;
- (void)rollbackChangesForKeys:(id)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setIsModified:(BOOL)a3;
- (void)setIsNew:(BOOL)a3;
- (void)setIsSaved:(BOOL)a3;
- (void)setIsUndeleted:(BOOL)a3;
- (void)setIsUndetached:(BOOL)a3;
- (void)setMultiValueAdditions:(id)a3;
- (void)setMultiValueRemovals:(id)a3;
- (void)setSingleValueChanges:(id)a3;
- (void)setSkipsPersistentObjectCopy:(BOOL)a3;
@end

@implementation EKChangeSet

- (EKChangeSet)initWithChangeSet:(id)a3
{
  id v4 = a3;
  v5 = [v4 singleValueChanges];
  v6 = [v4 multiValueAdditions];
  v7 = [v4 multiValueRemovals];

  v8 = [(EKChangeSet *)self initWithSingleValueChanges:v5 multiValueAdditions:v6 multiValueRemovals:v7];
  return v8;
}

- (EKChangeSet)initWithSingleValueChanges:(id)a3 multiValueAdditions:(id)a4 multiValueRemovals:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v43 = a5;
  v52.receiver = self;
  v52.super_class = (Class)EKChangeSet;
  v10 = [(EKChangeSet *)&v52 init];
  v11 = v10;
  if (v10)
  {
    [(EKChangeSet *)v10 setIsNew:0];
    id v40 = v8;
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v8];
    [(EKChangeSet *)v11 setSingleValueChanges:v12];

    v13 = objc_opt_new();
    [(EKChangeSet *)v11 setMultiValueAdditions:v13];

    if (v9)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = [v9 allKeys];
      uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v49 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            [v9 valueForKey:v18];
            v20 = id v19 = v9;
            v21 = [MEMORY[0x1E4F1CA80] setWithSet:v20];
            v22 = [(EKChangeSet *)v11 multiValueAdditions];
            [v22 setObject:v21 forKeyedSubscript:v18];

            id v9 = v19;
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
        }
        while (v15);
      }
    }
    v23 = objc_opt_new();
    [(EKChangeSet *)v11 setMultiValueRemovals:v23];

    if (v43)
    {
      id obja = v9;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v24 = [v43 allKeys];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v45 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v44 + 1) + 8 * j);
            v30 = [v43 valueForKey:v29];
            v31 = [MEMORY[0x1E4F1CA80] setWithSet:v30];
            v32 = [(EKChangeSet *)v11 multiValueRemovals];
            [v32 setObject:v31 forKeyedSubscript:v29];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v53 count:16];
        }
        while (v26);
      }

      id v9 = obja;
    }
    v33 = [(EKChangeSet *)v11 singleValueChanges];
    uint64_t v34 = [v33 count];

    v35 = [(EKChangeSet *)v11 multiValueAdditions];
    uint64_t v36 = v34 | [v35 count];

    v37 = [(EKChangeSet *)v11 multiValueRemovals];
    uint64_t v38 = [v37 count];

    [(EKChangeSet *)v11 setIsModified:(v36 | v38) != 0];
    id v8 = v40;
  }

  return v11;
}

- (BOOL)hasUnsavedChangeForKey:(id)a3
{
  id v4 = a3;
  if ([(EKChangeSet *)self isDeleted])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v6 = [(EKChangeSet *)self _isNewAndUnsaved];
    if (v4 || !v6)
    {
      v7 = [(EKChangeSet *)self singleValueChanges];
      id v8 = v7;
      if (v4)
      {
        id v9 = [v7 objectForKeyedSubscript:v4];
        BOOL v10 = v9 != 0;

        v11 = [(EKChangeSet *)self multiValueAdditions];
        v12 = [v11 objectForKeyedSubscript:v4];
        uint64_t v13 = [v12 count];

        uint64_t v14 = [(EKChangeSet *)self multiValueRemovals];
        uint64_t v15 = [v14 objectForKeyedSubscript:v4];
        uint64_t v16 = [v15 count];
      }
      else
      {
        BOOL v10 = [v7 count] != 0;

        v17 = [(EKChangeSet *)self multiValueAdditions];
        uint64_t v13 = [v17 count];

        uint64_t v14 = [(EKChangeSet *)self multiValueRemovals];
        uint64_t v16 = [v14 count];
      }

      if (v13) {
        char v18 = 1;
      }
      else {
        char v18 = v10;
      }
      if (v16) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = v18;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (NSMutableDictionary)multiValueRemovals
{
  return self->_multiValueRemovals;
}

- (NSMutableDictionary)multiValueAdditions
{
  return self->_multiValueAdditions;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (BOOL)_isNewAndUnsaved
{
  BOOL v3 = [(EKChangeSet *)self isNew];
  if (v3) {
    LOBYTE(v3) = ![(EKChangeSet *)self isSaved];
  }
  return v3;
}

- (BOOL)isSaved
{
  return self->_isSaved;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(BOOL)a3
{
  self->_isNew = a3;
}

- (void)setSingleValueChanges:(id)a3
{
}

- (void)setMultiValueRemovals:(id)a3
{
}

- (void)setMultiValueAdditions:(id)a3
{
}

- (void)setIsSaved:(BOOL)a3
{
  self->_isSaved = a3;
}

- (void)changeSingleValue:(id)a3 forKey:(id)a4 basedOn:(id)a5 and:(id)a6
{
  unint64_t v14 = (unint64_t)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    uint64_t v13 = [(EKChangeSet *)self valueForSingleValueKey:v10 basedOn:v11 and:v12];
    if (!(v14 | v13) || ([(id)v14 isEqual:v13] & 1) != 0)
    {

      goto LABEL_7;
    }
  }
  [(EKChangeSet *)self forceChangeValue:v14 forKey:v10];
LABEL_7:
}

- (void)forceChangeValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      id v7 = v10;
    }
    else {
      id v7 = (id)[v10 copy];
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  id v8 = v7;
  id v9 = [(EKChangeSet *)self singleValueChanges];
  [v9 setObject:v8 forKeyedSubscript:v6];

  [(EKChangeSet *)self setIsModified:1];
}

- (id)valueForSingleValueKey:(id)a3 basedOn:(id)a4 and:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EKChangeSet *)self singleValueChanges];
  id v12 = [v11 objectForKeyedSubscript:v8];

  if (!v12)
  {
    uint64_t v13 = [v10 objectForKeyedSubscript:v8];
    unint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v9 valueForKey:v8];
    }
    id v12 = v15;
  }
  uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  if (v12 == v16) {
    v17 = 0;
  }
  else {
    v17 = v12;
  }
  id v18 = v17;

  return v18;
}

- (NSMutableDictionary)singleValueChanges
{
  return self->_singleValueChanges;
}

- (void)setIsModified:(BOOL)a3
{
  self->_isModified = a3;
}

- (EKChangeSet)init
{
  return [(EKChangeSet *)self initWithChangeSet:0];
}

- (EKChangeSet)initWithChangeSet:(id)a3 changesToSkip:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__EKChangeSet_initWithChangeSet_changesToSkip___block_invoke;
  v12[3] = &unk_1E5B97F50;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1A6266730](v12);
  id v10 = [(EKChangeSet *)self _initWithChangeSet:v8 filter:v9];

  return v10;
}

uint64_t __47__EKChangeSet_initWithChangeSet_changesToSkip___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (EKChangeSet)initWithChangeSet:(id)a3 changesToKeep:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__EKChangeSet_initWithChangeSet_changesToKeep___block_invoke;
  v12[3] = &unk_1E5B97F50;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1A6266730](v12);
  id v10 = [(EKChangeSet *)self _initWithChangeSet:v8 filter:v9];

  return v10;
}

uint64_t __47__EKChangeSet_initWithChangeSet_changesToKeep___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (EKChangeSet)initWithChangeSet:(id)a3 filter:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__EKChangeSet_initWithChangeSet_filter___block_invoke;
  v10[3] = &unk_1E5B97F78;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(EKChangeSet *)self _initWithChangeSet:a3 filter:v10];

  return v8;
}

uint64_t __40__EKChangeSet_initWithChangeSet_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_initWithChangeSet:(id)a3 filter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [EKChangeSet alloc];
  id v9 = [v7 singleValueChanges];
  id v10 = [v9 filteredDictionaryPassingTest:v6];
  id v11 = [v7 multiValueAdditions];
  id v12 = [v11 filteredDictionaryPassingTest:v6];
  id v13 = [v7 multiValueRemovals];
  unint64_t v14 = [v13 filteredDictionaryPassingTest:v6];

  id v15 = [(EKChangeSet *)v8 initWithSingleValueChanges:v10 multiValueAdditions:v12 multiValueRemovals:v14];
  -[EKChangeSet setIsNew:](v15, "setIsNew:", [v7 isNew]);
  -[EKChangeSet setIsModified:](v15, "setIsModified:", [v7 isModified]);
  -[EKChangeSet setIsSaved:](v15, "setIsSaved:", [v7 isSaved]);
  -[EKChangeSet setIsDeleted:](v15, "setIsDeleted:", [v7 isDeleted]);
  -[EKChangeSet setIsUndeleted:](v15, "setIsUndeleted:", [v7 isUndeleted]);
  uint64_t v16 = [v7 isUndetached];

  [(EKChangeSet *)v15 setIsUndetached:v16];
  return v15;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [[EKChangeSet alloc] initWithChangeSet:self];
  [(EKChangeSet *)v4 setIsNew:[(EKChangeSet *)self isNew]];
  [(EKChangeSet *)v4 setIsModified:[(EKChangeSet *)self isModified]];
  [(EKChangeSet *)v4 setIsSaved:[(EKChangeSet *)self isSaved]];
  [(EKChangeSet *)v4 setIsDeleted:[(EKChangeSet *)self isDeleted]];
  [(EKChangeSet *)v4 setIsUndeleted:[(EKChangeSet *)self isUndeleted]];
  [(EKChangeSet *)v4 setIsUndetached:[(EKChangeSet *)self isUndetached]];
  return v4;
}

- (void)rollbackChanges
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(EKChangeSet *)self setSingleValueChanges:v3];

  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [(EKChangeSet *)self setMultiValueAdditions:v4];

  BOOL v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [(EKChangeSet *)self setMultiValueRemovals:v5];

  [(EKChangeSet *)self setIsModified:0];
}

- (void)rollbackChangesForKeys:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKChangeSet *)self singleValueChanges];
  [v5 removeObjectsForKeys:v4];

  id v6 = [(EKChangeSet *)self multiValueAdditions];
  [v6 removeObjectsForKeys:v4];

  id v7 = [(EKChangeSet *)self multiValueRemovals];
  [v7 removeObjectsForKeys:v4];
}

- (void)markChangesAsSaved
{
  [(EKChangeSet *)self setIsSaved:1];
  [(EKChangeSet *)self setIsNew:0];
  BOOL v3 = [(EKChangeSet *)self isModified];
  [(EKChangeSet *)self rollbackChanges];

  [(EKChangeSet *)self setIsModified:v3];
}

- (id)changedKeys
{
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(EKChangeSet *)self changedSingleValueKeys];
  [v3 unionSet:v4];

  BOOL v5 = [(EKChangeSet *)self changedMultiValueKeys];
  [v3 unionSet:v5];

  return v3;
}

- (id)changedSingleValueKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v3 = [(EKChangeSet *)self singleValueChanges];
  id v4 = [v3 allKeys];
  BOOL v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)changedMultiValueKeys
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(EKChangeSet *)self multiValueAdditions];
  BOOL v5 = [v4 allKeys];
  id v6 = [v3 setWithArray:v5];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [(EKChangeSet *)self multiValueRemovals];
  id v9 = [v8 allKeys];
  id v10 = [v7 setWithArray:v9];
  [v6 unionSet:v10];

  return v6;
}

- (BOOL)hasChanges
{
  if ([(EKChangeSet *)self isDeleted]) {
    return 0;
  }
  if ([(EKChangeSet *)self isModified]) {
    return 1;
  }

  return [(EKChangeSet *)self isNew];
}

- (BOOL)hasUnsavedChanges
{
  return [(EKChangeSet *)self hasUnsavedChangeForKey:0];
}

- (BOOL)hasUnsavedMultiValueAdditionForKey:(id)a3
{
  id v4 = a3;
  if ([(EKChangeSet *)self isDeleted])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(EKChangeSet *)self multiValueAdditions];
    id v7 = [v6 objectForKeyedSubscript:v4];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

- (id)unsavedMultiValueAddedObjectsForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKChangeSet *)self multiValueAdditions];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)hasUnsavedMultiValueRemovalForKey:(id)a3
{
  id v4 = a3;
  if ([(EKChangeSet *)self isDeleted])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(EKChangeSet *)self multiValueRemovals];
    id v7 = [v6 objectForKeyedSubscript:v4];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

- (id)unsavedMultiValueRemovedObjectsForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKChangeSet *)self multiValueRemovals];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)valueForSingleValueKey:(id)a3 basedOn:(id)a4
{
  return [(EKChangeSet *)self valueForSingleValueKey:a3 basedOn:a4 and:0];
}

- (void)changeSingleValue:(id)a3 forKey:(id)a4 basedOn:(id)a5
{
}

- (id)valuesForMultiValueKey:(id)a3 basedOn:(id)a4 and:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a5 objectForKeyedSubscript:v8];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v9 valueForKey:v8];
  }
  id v13 = v12;

  unint64_t v14 = [(EKChangeSet *)self valuesForMultiValueKey:v8 basedOnSet:v13];

  return v14;
}

- (id)valuesForMultiValueKey:(id)a3 basedOnSet:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v15 = [v14 uniqueIdentifier];
        if (v15) {
          [v8 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v11);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v16 = [(EKChangeSet *)self multiValueRemovals];
  v17 = [v16 objectForKeyedSubscript:v6];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v39 + 1) + 8 * j) uniqueIdentifier];
        [v8 removeObjectForKey:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v19);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v23 = [(EKChangeSet *)self multiValueAdditions];
  v24 = [v23 objectForKeyedSubscript:v6];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v35 + 1) + 8 * k);
        v30 = [v29 uniqueIdentifier];
        [v8 setObject:v29 forKeyedSubscript:v30];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v26);
  }

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  v32 = [v8 allValues];
  v33 = [v31 setWithArray:v32];

  return v33;
}

- (BOOL)isUniqueAddedObject:(id)a3 forKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_multiValueAdditions objectForKeyedSubscript:a4];
  if (v7)
  {
    id v8 = [v6 uniqueIdentifier];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "uniqueIdentifier", (void)v16);
          char v14 = [v13 isEqualToString:v8];

          if (v14)
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)replaceMultiChangeAddedObject:(id)a3 withObject:(id)a4 forKey:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = [(NSMutableDictionary *)self->_multiValueAdditions objectForKeyedSubscript:a5];
  if ([v9 containsObject:v10])
  {
    [v9 removeObject:v10];
    [v9 addObject:v8];
  }
}

- (void)addChanges:(id)a3
{
}

- (void)addChanges:(id)a3 shouldCopyKeyCallback:(id)a4
{
}

- (void)addChanges:(id)a3 shouldCopyKeyCallback:(id)a4 objectIdentifierBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v29 = a4;
  id v9 = a5;
  if ([v8 isModified])
  {
    [(EKChangeSet *)self setIsModified:1];
    id v10 = [v8 singleValueChanges];
    uint64_t v11 = v10;
    if (!self->_skipsPersistentObjectCopy)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __70__EKChangeSet_addChanges_shouldCopyKeyCallback_objectIdentifierBlock___block_invoke;
      v34[3] = &unk_1E5B97FA0;
      id v36 = v29;
      id v13 = v12;
      id v35 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v34];
      id v14 = v13;

      uint64_t v11 = v14;
    }
    id v15 = [(EKChangeSet *)self singleValueChanges];
    uint64_t v27 = v11;
    [v15 addEntriesFromDictionary:v11];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = [v8 changedMultiValueKeys];
    uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v21 = [v8 multiValueRemovals];
          v22 = [v21 objectForKeyedSubscript:v20];
          v23 = (void *)[v22 copy];
          [(EKChangeSet *)self removeFromChanges:v23 forMultiValueKey:v20 basedOn:0 and:0 objectIdentifierBlock:v9];

          v24 = [v8 multiValueAdditions];
          uint64_t v25 = [v24 objectForKeyedSubscript:v20];
          uint64_t v26 = (void *)[v25 copy];
          [(EKChangeSet *)self addToChanges:v26 forMultiValueKey:v20 basedOn:0 and:0 shouldCopyKeyCallback:v29 objectIdentifierBlock:v9];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v17);
    }
  }
}

void __70__EKChangeSet_addChanges_shouldCopyKeyCallback_objectIdentifierBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v8))
    {
      uint64_t v7 = [v5 copy];

      id v5 = (id)v7;
    }
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
}

- (void)addToChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6
{
}

- (void)addToChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6 shouldCopyKeyCallback:(id)a7 objectIdentifierBlock:(id)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v47 = a5;
  id v16 = a6;
  uint64_t v17 = (unsigned int (**)(void))a7;
  uint64_t v18 = (void (**)(id, void *))a8;
  if ([v14 count])
  {
    long long v19 = [(EKChangeSet *)self multiValueAdditions];
    uint64_t v20 = [v19 objectForKeyedSubscript:v15];

    long long v46 = (void *)v20;
    if (!v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
      v22 = [(EKChangeSet *)self multiValueAdditions];
      long long v46 = (void *)v21;
      [v22 setObject:v21 forKeyedSubscript:v15];
    }
    if (!v18) {
      uint64_t v18 = (void (**)(id, void *))&__block_literal_global_41;
    }
    v23 = [v16 objectForKeyedSubscript:v15];
    v24 = v23;
    long long v44 = v17;
    id v41 = v16;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [v47 valueForKey:v15];
    }
    id v26 = v25;

    long long v48 = v26;
    uint64_t v50 = [(EKChangeSet *)self _uniqueIdentifierToObjectMapForObjects:v26 identifierBlock:v18];
    uint64_t v27 = [(EKChangeSet *)self multiValueRemovals];
    id v43 = v15;
    v28 = [v27 objectForKeyedSubscript:v15];

    long long v45 = self;
    id v29 = [(EKChangeSet *)self _uniqueIdentifierToObjectMapForObjects:v28 identifierBlock:v18];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v42 = v14;
    obuint64_t j = v14;
    uint64_t v30 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v52 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v35 = v18[2](v18, v34);
          id v36 = [v29 objectForKey:v35];

          long long v37 = v18[2](v18, v34);
          uint64_t v38 = [v50 objectForKey:v37];

          if (v36)
          {
            [v28 removeObject:v36];
          }
          else if (!v48 || ([v38 isEqual:v34] & 1) == 0)
          {
            long long v39 = objc_msgSend(v34, "frozenObject", v41);
            if (!v47 && !v45->_skipsPersistentObjectCopy)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (!v44 || v44[2]()))
              {
                uint64_t v40 = [v39 copy];

                long long v39 = (void *)v40;
              }
            }
            [v46 addObject:v39];
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v31);
    }

    [(EKChangeSet *)v45 setIsModified:1];
    id v15 = v43;
    [(EKChangeSet *)v45 _cleanupEmptySetsForMultiValueKey:v43];

    id v16 = v41;
    id v14 = v42;
    uint64_t v17 = v44;
  }
}

uint64_t __101__EKChangeSet_addToChanges_forMultiValueKey_basedOn_and_shouldCopyKeyCallback_objectIdentifierBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)removeFromChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6
{
}

- (void)removeFromChanges:(id)a3 forMultiValueKey:(id)a4 basedOn:(id)a5 and:(id)a6 objectIdentifierBlock:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void))a7;
  if ([v12 count])
  {
    uint64_t v17 = [(EKChangeSet *)self multiValueRemovals];
    uint64_t v18 = [v17 objectForKeyedSubscript:v13];

    id v43 = (void *)v18;
    if (!v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v20 = [(EKChangeSet *)self multiValueRemovals];
      id v43 = (void *)v19;
      [v20 setObject:v19 forKeyedSubscript:v13];
    }
    if (!v16) {
      id v16 = (void (**)(id, void))&__block_literal_global_10_2;
    }
    uint64_t v21 = [v15 objectForKeyedSubscript:v13];
    v22 = v21;
    id v40 = v15;
    id v41 = v14;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [v14 valueForKey:v13];
    }
    id v24 = v23;

    long long v44 = v24;
    id v47 = [(EKChangeSet *)self _uniqueIdentifierToObjectMapForObjects:v24 identifierBlock:v16];
    id v25 = [(EKChangeSet *)self multiValueAdditions];
    uint64_t v26 = [v25 objectForKeyedSubscript:v13];

    long long v39 = self;
    long long v46 = (void *)v26;
    uint64_t v27 = [(EKChangeSet *)self _uniqueIdentifierToObjectMapForObjects:v26 identifierBlock:v16];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v42 = v12;
    obuint64_t j = v12;
    uint64_t v28 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v49 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          long long v33 = ((void (**)(id, void *))v16)[2](v16, v32);
          uint64_t v34 = [v27 objectForKey:v33];

          id v35 = ((void (**)(id, void *))v16)[2](v16, v32);
          id v36 = [v47 objectForKey:v35];

          if (v34)
          {
            [v46 removeObject:v34];
            goto LABEL_21;
          }
          if (v44)
          {
            if (!v36) {
              goto LABEL_21;
            }
            long long v37 = v43;
            uint64_t v38 = v36;
          }
          else
          {
            long long v37 = v43;
            uint64_t v38 = v32;
          }
          [v37 addObject:v38];
LABEL_21:
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v29);
    }

    [(EKChangeSet *)v39 setIsModified:1];
    [(EKChangeSet *)v39 _cleanupEmptySetsForMultiValueKey:v13];

    id v12 = v42;
    id v15 = v40;
    id v14 = v41;
  }
}

uint64_t __84__EKChangeSet_removeFromChanges_forMultiValueKey_basedOn_and_objectIdentifierBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)replaceUniqueMultiValueObjectsWithUpdatedObjects:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v32 = self;
  obuint64_t j = [(EKChangeSet *)self multiValueAdditions];
  uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v31 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        id v9 = [(EKChangeSet *)v32 multiValueAdditions];
        id v10 = [v9 objectForKeyedSubscript:v8];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v11 = v10;
        id v12 = (void *)[v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v42;
          while (2)
          {
            for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v42 != v13) {
                objc_enumerationMutation(v11);
              }
              id v15 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
              id v16 = [v15 uniqueIdentifier];
              uint64_t v17 = [v4 objectForKeyedSubscript:v16];
              if (v17)
              {
                uint64_t v19 = (void *)v17;
                uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
                id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
                [v18 addObject:v15];
                [v12 addObject:v19];

                goto LABEL_16;
              }
            }
            id v12 = (void *)[v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        uint64_t v18 = 0;
LABEL_16:

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v20 = v18;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v38;
          do
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v38 != v23) {
                objc_enumerationMutation(v20);
              }
              [v11 removeObject:*(void *)(*((void *)&v37 + 1) + 8 * k)];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
          }
          while (v22);
        }

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v25 = v12;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v49 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v34;
          do
          {
            for (uint64_t m = 0; m != v27; ++m)
            {
              if (*(void *)v34 != v28) {
                objc_enumerationMutation(v25);
              }
              [v11 addObject:*(void *)(*((void *)&v33 + 1) + 8 * m)];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v49 count:16];
          }
          while (v27);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v6);
  }
}

- (void)addChangesAndUpdateUniqueMultiValueObjects:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EKChangeSet *)self addChanges:v4];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v21 = v4;
  obuint64_t j = [v4 multiValueAdditions];
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v10 = [v21 multiValueAdditions];
        id v11 = [v10 objectForKeyedSubscript:v9];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if (!v7) {
                id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              uint64_t v18 = [v17 uniqueIdentifier];
              [v7 setObject:v17 forKeyedSubscript:v18];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v14);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  [(EKChangeSet *)self replaceUniqueMultiValueObjectsWithUpdatedObjects:v7];
}

- (void)_cleanupEmptySetsForMultiValueKey:(id)a3
{
  id v12 = a3;
  id v4 = [(EKChangeSet *)self multiValueAdditions];
  uint64_t v5 = [v4 objectForKeyedSubscript:v12];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = [(EKChangeSet *)self multiValueAdditions];
    [v7 removeObjectForKey:v12];
  }
  uint64_t v8 = [(EKChangeSet *)self multiValueRemovals];
  uint64_t v9 = [v8 objectForKeyedSubscript:v12];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    id v11 = [(EKChangeSet *)self multiValueRemovals];
    [v11 removeObjectForKey:v12];
  }
}

- (id)_uniqueIdentifierToObjectMapForObjects:(id)a3 identifierBlock:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  if ([v5 count])
  {
    id v7 = [v5 anyObject];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "frozenClass"), "propertyKeyForUniqueIdentifier");

    if (([v8 isEqualToString:@"uniqueIdentifier"] & 1) == 0)
    {
      uint64_t v9 = [v5 anyObject];
      uint64_t v10 = [v9 eventStore];

      v36[0] = v8;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      [v10 ensureLoadedProperties:v11 forObjects:v5];
    }
    long long v23 = v8;
    id v12 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = v5;
    id v13 = v5;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v19 = v6[2](v6, v18);
          if (v19)
          {
            [v12 setObject:v18 forKey:v19];
          }
          else
          {
            uint64_t v20 = (void *)EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            {
              long long v25 = (void *)MEMORY[0x1E4F29060];
              log = v20;
              uint64_t v21 = objc_msgSend(v25, "callStackSymbols", v23);
              *(_DWORD *)buf = 138412546;
              uint64_t v32 = v18;
              __int16 v33 = 2112;
              long long v34 = v21;
              _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Object %@ has no unique identifier: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v15);
    }

    id v5 = v24;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v12;
}

- (BOOL)skipsPersistentObjectCopy
{
  return self->_skipsPersistentObjectCopy;
}

- (void)setSkipsPersistentObjectCopy:(BOOL)a3
{
  self->_skipsPersistentObjectCopy = a3;
}

- (void)removeAllChangesExceptRemovals
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_multiValueAdditions removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_singleValueChanges allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [(NSMutableDictionary *)self->_singleValueChanges objectForKeyedSubscript:v7];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
        id v11 = v10;
        if (isKindOfClass)
        {
          [(NSMutableDictionary *)self->_singleValueChanges setObject:v10 forKeyedSubscript:v7];
        }
        else
        {

          if (v8 != v11) {
            [(NSMutableDictionary *)self->_singleValueChanges removeObjectForKey:v7];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (id)summary
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = [(EKChangeSet *)self singleValueChanges];
  [v3 appendFormat:@"singleValueChanges: %@ \n", v4];

  uint64_t v5 = [(EKChangeSet *)self multiValueAdditions];
  [v3 appendFormat:@"multiValueAdditions: %@ \n", v5];

  uint64_t v6 = [(EKChangeSet *)self multiValueRemovals];
  [v3 appendFormat:@"multiValueRemovals: %@ \n", v6];

  [v3 appendString:@"\n"];
  objc_msgSend(v3, "appendFormat:", @"is new: %d is deleted: %d is saved: %d is modified: %d", -[EKChangeSet isNew](self, "isNew"), -[EKChangeSet isDeleted](self, "isDeleted"), -[EKChangeSet isSaved](self, "isSaved"), -[EKChangeSet isModified](self, "isModified"));
  if ([(EKChangeSet *)self isUndeleted])
  {
    [v3 appendString:@"\n"];
    objc_msgSend(v3, "appendFormat:", @"is undeleted: %d", -[EKChangeSet isUndeleted](self, "isUndeleted"));
  }
  if ([(EKChangeSet *)self isUndetached])
  {
    [v3 appendString:@"\n"];
    objc_msgSend(v3, "appendFormat:", @"is undetached: %d", -[EKChangeSet isUndetached](self, "isUndetached"));
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EKChangeSet *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(EKChangeSet *)self singleValueChanges];
    uint64_t v8 = [(EKChangeSet *)v6 singleValueChanges];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(EKChangeSet *)self multiValueAdditions];
      uint64_t v10 = [(EKChangeSet *)v6 multiValueAdditions];
      if ([v9 isEqual:v10])
      {
        id v11 = [(EKChangeSet *)self multiValueRemovals];
        id v12 = [(EKChangeSet *)v6 multiValueRemovals];
        if ([v11 isEqual:v12]
          && (BOOL v13 = [(EKChangeSet *)self isNew], v13 == [(EKChangeSet *)v6 isNew])
          && (BOOL v14 = [(EKChangeSet *)self isModified], v14 == [(EKChangeSet *)v6 isModified])
          && (BOOL v15 = [(EKChangeSet *)self isSaved], v15 == [(EKChangeSet *)v6 isSaved])
          && (BOOL v16 = [(EKChangeSet *)self isDeleted], v16 == [(EKChangeSet *)v6 isDeleted])
          && (BOOL v17 = [(EKChangeSet *)self isUndeleted], v17 == [(EKChangeSet *)v6 isUndeleted]))
        {
          BOOL v20 = [(EKChangeSet *)self isUndetached];
          BOOL v18 = v20 ^ [(EKChangeSet *)v6 isUndetached] ^ 1;
        }
        else
        {
          LOBYTE(v18) = 0;
        }
      }
      else
      {
        LOBYTE(v18) = 0;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)isEffectivelyEqual:(id)a3
{
  uint64_t v4 = (EKChangeSet *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    BOOL v5 = [(EKChangeSet *)self isNew];
    if (v5 == [(EKChangeSet *)v4 isNew]
      && (BOOL v6 = [(EKChangeSet *)self isSaved], v6 == [(EKChangeSet *)v4 isSaved])
      && (BOOL v7 = [(EKChangeSet *)self isDeleted], v7 == [(EKChangeSet *)v4 isDeleted])
      && (BOOL v8 = [(EKChangeSet *)self isUndeleted], v8 == [(EKChangeSet *)v4 isUndeleted])
      && (BOOL v9 = [(EKChangeSet *)self isUndetached], v9 == [(EKChangeSet *)v4 isUndetached]))
    {
      id v12 = objc_opt_new();
      BOOL v13 = [(EKChangeSet *)self singleValueChanges];
      BOOL v14 = [v13 CalDictionaryWithEmptyObjectsRemoved];

      if (v4)
      {
        BOOL v15 = [(EKChangeSet *)v4 singleValueChanges];
        id v16 = [v15 CalDictionaryWithEmptyObjectsRemoved];
      }
      else
      {
        id v16 = v12;
      }
      if ([v14 isEqual:v16])
      {
        BOOL v17 = [(EKChangeSet *)self multiValueAdditions];
        BOOL v18 = [v17 CalDictionaryWithEmptyObjectsRemoved];

        if (v4)
        {
          uint64_t v19 = [(EKChangeSet *)v4 multiValueAdditions];
          id v20 = [v19 CalDictionaryWithEmptyObjectsRemoved];
        }
        else
        {
          id v20 = v12;
        }
        if ([v18 isEqual:v20])
        {
          uint64_t v21 = [(EKChangeSet *)self multiValueRemovals];
          long long v22 = [v21 CalDictionaryWithEmptyObjectsRemoved];

          if (v4)
          {
            long long v23 = [(EKChangeSet *)v4 multiValueRemovals];
            id v24 = [v23 CalDictionaryWithEmptyObjectsRemoved];
          }
          else
          {
            id v24 = v12;
          }
          char v10 = [v22 isEqual:v24];
        }
        else
        {
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isModified
{
  return self->_isModified;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (BOOL)isUndeleted
{
  return self->_isUndeleted;
}

- (void)setIsUndeleted:(BOOL)a3
{
  self->_isUndeleted = a3;
}

- (BOOL)isUndetached
{
  return self->_isUndetached;
}

- (void)setIsUndetached:(BOOL)a3
{
  self->_isUndetached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiValueRemovals, 0);
  objc_storeStrong((id *)&self->_multiValueAdditions, 0);

  objc_storeStrong((id *)&self->_singleValueChanges, 0);
}

@end