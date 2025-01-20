@interface IMKeyValueCollection
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLForKey:(id)a3 withDefault:(BOOL)a4;
- (IMKeyValueCollection)init;
- (IMKeyValueCollection)initWithKeyValueStorage:(id)a3;
- (IMKeyValueCollectionDelegate)delegate;
- (IMKeyValueCollectionStorage)keyValueStorage;
- (NSMutableDictionary)recordedChanges;
- (NSString)description;
- (double)doubleForKey:(id)a3;
- (double)doubleForKey:(id)a3 withDefault:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)errorArrayForKey:(id)a3;
- (id)errorForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 withDefault:(id)a4;
- (id)stringForKey:(id)a3;
- (int64_t)int64ForKey:(id)a3;
- (int64_t)int64ForKey:(id)a3 withDefault:(int64_t)a4;
- (int64_t)integerForKey:(id)a3;
- (int64_t)integerForKey:(id)a3 withDefault:(int64_t)a4;
- (unint64_t)uint64ForKey:(id)a3;
- (unint64_t)uint64ForKey:(id)a3 withDefault:(unint64_t)a4;
- (void)_broadcastIfNeeded;
- (void)_commitBatchWrite;
- (void)_notifyListeners;
- (void)_recordChange:(id)a3 forKey:(id)a4;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)_startBatchWrite;
- (void)addErrorToArray:(id)a3 forKey:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setError:(id)a3 forKey:(id)a4;
- (void)setInt64:(int64_t)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setUint64:(int64_t)a3 forKey:(id)a4;
@end

@implementation IMKeyValueCollection

- (void)_commitBatchWrite
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = obj->_batchCount - 1;
  obj->_batchCount = v2;
  if (!v2) {
    [(IMKeyValueCollection *)obj _broadcastIfNeeded];
  }
  objc_sync_exit(obj);
}

- (void)_broadcastIfNeeded
{
  if ((byte_1E94FE758 & 1) == 0)
  {
    recordedChanges = self->_recordedChanges;
    if (recordedChanges)
    {
      if ([(NSMutableDictionary *)recordedChanges count])
      {
        byte_1E94FE758 = 1;
        v4 = (void *)MEMORY[0x1A6228190]();
        [(IMKeyValueCollection *)self _notifyListeners];
        v5 = self->_recordedChanges;
        self->_recordedChanges = 0;

        byte_1E94FE758 = 0;
      }
    }
  }
}

- (void)_startBatchWrite
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_batchCount;
  objc_sync_exit(obj);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(IMKeyValueCollection *)self setObject:v8 forKey:v7];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(IMKeyValueCollection *)self setObject:v8 forKey:v7];
}

- (BOOL)BOOLForKey:(id)a3 withDefault:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  v9 = [(IMKeyValueCollection *)self objectForKey:v7 withDefault:v8];

  LOBYTE(v6) = [v9 BOOLValue];
  return (char)v6;
}

- (id)objectForKey:(id)a3 withDefault:(id)a4
{
  id v6 = a4;
  id v7 = [(IMKeyValueCollection *)self objectForKey:a3];
  id v8 = v7;
  if (!v7) {
    id v7 = v6;
  }
  id v9 = v7;

  return v9;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(IMKeyValueCollection *)v5 keyValueStorage];
  id v7 = [v6 objectForKey:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  unint64_t v10 = (unint64_t)a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(IMKeyValueCollection *)v7 keyValueStorage];
  uint64_t v9 = [v8 objectForKey:v6];

  if (v10 | v9 && (!v10 && v9 || v10 && !v9 || v10 && v9 && ([(id)v10 isEqual:v9] & 1) == 0))
  {
    [(IMKeyValueCollection *)v7 _setObject:v10 forKey:v6];
    [(IMKeyValueCollection *)v7 _recordChange:v10 forKey:v6];
    if (!v7->_batchCount) {
      [(IMKeyValueCollection *)v7 _broadcastIfNeeded];
    }
  }

  objc_sync_exit(v7);
}

- (IMKeyValueCollectionStorage)keyValueStorage
{
  return self->_keyValueStorage;
}

- (void)setError:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  objc_msgSend(a3, "serializedError_im");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(IMKeyValueCollection *)self setObject:v7 forKey:v6];
}

- (id)errorForKey:(id)a3
{
  v3 = [(IMKeyValueCollection *)self objectForKey:a3];
  if (v3) {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithSerializedError_im:", v3);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)addErrorToArray:(id)a3 forKey:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(IMKeyValueCollection *)self objectForKey:v7];
    uint64_t v9 = v8;
    if (!v8) {
      goto LABEL_16;
    }
    v29 = self;
    v30 = v8;
    id v31 = v7;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      v14 = @"IMSerializedErrorDomainKey";
      do
      {
        uint64_t v15 = 0;
        uint64_t v32 = v12;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
          v17 = objc_msgSend(v6, "domain", v29);
          v18 = [v16 objectForKeyedSubscript:v14];
          if ([v17 isEqualToString:v18])
          {
            uint64_t v19 = [v6 code];
            id v20 = v6;
            v21 = v14;
            uint64_t v22 = v19;
            v23 = [v16 objectForKeyedSubscript:@"IMSerializedErrorCodeKey"];
            id v24 = v10;
            uint64_t v25 = [v23 integerValue];

            BOOL v26 = v22 == v25;
            v14 = v21;
            id v6 = v20;
            uint64_t v12 = v32;
            id v10 = v24;
            if (v26)
            {
              uint64_t v9 = v30;
              id v7 = v31;
              goto LABEL_18;
            }
          }
          else
          {
          }
          ++v15;
        }
        while (v12 != v15);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    v27 = (void *)[v10 mutableCopy];
    uint64_t v9 = v30;
    id v7 = v31;
    self = v29;
    if (!v27)
    {
LABEL_16:
      v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v29);
    }
    v28 = objc_msgSend(v6, "serializedError_im", v29);
    [v27 addObject:v28];

    id v10 = v27;
    [(IMKeyValueCollection *)self setObject:v27 forKey:v7];
LABEL_18:
  }
}

- (id)errorArrayForKey:(id)a3
{
  v3 = [(IMKeyValueCollection *)self objectForKey:a3];
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "errorArrayFromSerializedErrorArray_im:", v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (IMKeyValueCollection)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(IMKeyValueCollection *)self keyValueStorage];
  id v6 = (void *)[v5 copy];
  id v7 = (void *)[v4 initWithKeyValueStorage:v6];

  return v7;
}

- (IMKeyValueCollection)initWithKeyValueStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMKeyValueCollection;
  id v6 = [(IMKeyValueCollection *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyValueStorage, a3);
  }

  return v7;
}

- (void)_notifyListeners
{
  id v5 = [(IMKeyValueCollection *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = (void *)[(NSMutableDictionary *)self->_recordedChanges copy];
    [v5 keyValueCollection:self willUpdateValues:v3];
  }
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)[(NSMutableDictionary *)self->_recordedChanges copy];
    [v5 keyValueCollection:self didUpdateValues:v4];
  }
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = [(IMKeyValueCollection *)self keyValueStorage];
    [v7 setObject:v8 forKey:v6];
  }
  else
  {
    id v7 = [(IMKeyValueCollection *)self keyValueStorage];
    [v7 removeObjectForKey:v6];
  }
}

- (void)_recordChange:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_recordedChanges)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    recordedChanges = self->_recordedChanges;
    self->_recordedChanges = v7;
  }
  objc_super v9 = self->_recordedChanges;
  if (v11)
  {
    [(NSMutableDictionary *)v9 setObject:v11 forKey:v6];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)v9 setObject:v10 forKey:v6];
  }
}

- (void)removeObjectForKey:(id)a3
{
}

- (BOOL)BOOLForKey:(id)a3
{
  return MEMORY[0x1F4181798](self, sel_BOOLForKey_withDefault_);
}

- (int64_t)integerForKey:(id)a3 withDefault:(int64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  objc_super v9 = [(IMKeyValueCollection *)self objectForKey:v7 withDefault:v8];

  int64_t v10 = [v9 integerValue];
  return v10;
}

- (int64_t)integerForKey:(id)a3
{
  return MEMORY[0x1F4181798](self, sel_integerForKey_withDefault_);
}

- (int64_t)int64ForKey:(id)a3 withDefault:(int64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithLongLong:a4];
  objc_super v9 = [(IMKeyValueCollection *)self objectForKey:v7 withDefault:v8];

  int64_t v10 = [v9 longValue];
  return v10;
}

- (int64_t)int64ForKey:(id)a3
{
  return MEMORY[0x1F4181798](self, sel_int64ForKey_withDefault_);
}

- (void)setInt64:(int64_t)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(IMKeyValueCollection *)self setObject:v8 forKey:v7];
}

- (unint64_t)uint64ForKey:(id)a3 withDefault:(unint64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedLongLong:a4];
  objc_super v9 = [(IMKeyValueCollection *)self objectForKey:v7 withDefault:v8];

  unint64_t v10 = [v9 unsignedLongValue];
  return v10;
}

- (unint64_t)uint64ForKey:(id)a3
{
  return MEMORY[0x1F4181798](self, sel_uint64ForKey_withDefault_);
}

- (void)setUint64:(int64_t)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(IMKeyValueCollection *)self setObject:v8 forKey:v7];
}

- (double)doubleForKey:(id)a3 withDefault:(double)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithDouble:a4];
  objc_super v9 = [(IMKeyValueCollection *)self objectForKey:v7 withDefault:v8];

  [v9 doubleValue];
  double v11 = v10;

  return v11;
}

- (double)doubleForKey:(id)a3
{
  MEMORY[0x1F4181798](self, sel_doubleForKey_withDefault_);
  return result;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(IMKeyValueCollection *)self setObject:v8 forKey:v7];
}

- (id)stringForKey:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_stringForKey_withDefault_);
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)IMKeyValueCollection;
  id v4 = [(IMKeyValueCollection *)&v8 description];
  id v5 = [(IMKeyValueCollection *)self keyValueStorage];
  id v6 = [v3 stringWithFormat:@"%@ storage:%@, recorded changes: %@, batch count: %zd]", v4, v5, self->_recordedChanges, self->_batchCount];

  return (NSString *)v6;
}

- (IMKeyValueCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMKeyValueCollectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)recordedChanges
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedChanges, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_keyValueStorage, 0);
}

@end