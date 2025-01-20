@interface _CDDataCollectionAnonymizer
- (id)anonymizeArray:(uint64_t)a1;
- (id)anonymizeDictionary:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithSalt:(id *)a1;
- (void)anonymizeObject:(void *)a1;
@end

@implementation _CDDataCollectionAnonymizer

- (id)initWithSalt:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_CDDataCollectionAnonymizer;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_CDDataCollectionAnonymizer allocWithZone:a3];
  if (self) {
    salt = self->_salt;
  }
  else {
    salt = 0;
  }
  return -[_CDDataCollectionAnonymizer initWithSalt:]((id *)&v4->super.isa, salt);
}

- (id)anonymizeArray:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[_CDDataCollectionAnonymizer anonymizeObject:](a1, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)anonymizeObject:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = +[_CDHashUtilities sha256Hash:v3 withSalt:a1[1]];
LABEL_10:
      a1 = v4;
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = -[_CDDataCollectionAnonymizer anonymizeArray:]((uint64_t)a1, v3);
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = -[_CDDataCollectionAnonymizer anonymizeDictionary:](a1, v3);
      goto LABEL_10;
    }
    a1 = 0;
  }
LABEL_11:

  return a1;
}

- (id)anonymizeDictionary:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v15);
          long long v13 = -[_CDDataCollectionAnonymizer anonymizeObject:](a1, v12);

          if (v13) {
            [v5 setObject:v13 forKey:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end