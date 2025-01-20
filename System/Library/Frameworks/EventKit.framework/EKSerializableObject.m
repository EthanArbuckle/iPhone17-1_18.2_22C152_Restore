@interface EKSerializableObject
+ (BOOL)supportsSecureCoding;
+ (id)classesForKey;
- (EKSerializableObject)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKSerializableObject

+ (id)classesForKey
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "classesForKey", 0);
  v6 = [v5 allKeys];

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
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12 = [(EKSerializableObject *)self valueForKey:v11];
        [v4 encodeObject:v12 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (EKSerializableObject)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EKSerializableObject;
  v5 = [(EKSerializableObject *)&v23 init];
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = [(id)objc_opt_class() classesForKey];
    uint64_t v7 = [v6 allKeys];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
          long long v13 = [(id)objc_opt_class() classesForKey];
          long long v14 = [v13 objectForKey:v12];

          long long v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
          long long v16 = [v4 decodeObjectOfClasses:v15 forKey:v12];

          [(EKSerializableObject *)v5 setValue:v16 forKey:v12];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v9);
    }
  }
  return v5;
}

@end