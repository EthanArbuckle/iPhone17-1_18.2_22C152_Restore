@interface DNDSPlaceholderModesRecord
+ (id)backingStoreWithFileURL:(id)a3;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSPlaceholderModesRecord)init;
- (NSArray)placeholderModes;
- (NSString)description;
- (id)_initWithModePlaceholders:(id)a3;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (unint64_t)hash;
@end

@implementation DNDSPlaceholderModesRecord

+ (id)backingStoreWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = [[DNDSJSONBackingStore alloc] initWithRecordClass:a1 fileURL:v4 versionNumber:1];

  return v5;
}

- (DNDSPlaceholderModesRecord)init
{
  return (DNDSPlaceholderModesRecord *)[(DNDSPlaceholderModesRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = [a3 placeholderModes];
  id v5 = [(DNDSPlaceholderModesRecord *)self _initWithModePlaceholders:v4];

  return v5;
}

- (id)_initWithModePlaceholders:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSPlaceholderModesRecord;
  v6 = [(DNDSPlaceholderModesRecord *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_placeholderModes, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_placeholderModes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSPlaceholderModesRecord *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(DNDSPlaceholderModesRecord *)self placeholderModes];
      v7 = [(DNDSPlaceholderModesRecord *)v5 placeholderModes];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDSPlaceholderModesRecord *)self placeholderModes];
        if (v8)
        {
          objc_super v9 = [(DNDSPlaceholderModesRecord *)v5 placeholderModes];
          if (v9)
          {
            v10 = [(DNDSPlaceholderModesRecord *)self placeholderModes];
            v11 = [(DNDSPlaceholderModesRecord *)v5 placeholderModes];
            char v12 = [v10 isEqual:v11];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; placeholderModes: %@>",
                       objc_opt_class(),
                       self,
                       self->_placeholderModes);
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_placeholderModes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentationWithContext:", v4, (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char v12 = [MEMORY[0x1E4F1CA60] dictionary];
  [v12 setObject:v5 forKeyedSubscript:@"placeholderModes"];

  return v12;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"placeholderModes", objc_opt_class());
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = +[DNDSModeRecord newWithDictionaryRepresentation:context:](DNDSModeRecord, "newWithDictionaryRepresentation:context:", *(void *)(*((void *)&v18 + 1) + 8 * v14), v7, (void)v18);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  long long v16 = (void *)[objc_alloc((Class)a1) _initWithModePlaceholders:v9];
  return v16;
}

- (NSArray)placeholderModes
{
  return self->_placeholderModes;
}

- (void).cxx_destruct
{
}

@end