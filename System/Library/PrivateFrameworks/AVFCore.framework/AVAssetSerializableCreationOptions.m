@interface AVAssetSerializableCreationOptions
+ (BOOL)supportsSecureCoding;
- (AVAssetSerializableCreationOptions)initWithCoder:(id)a3;
- (AVAssetSerializableCreationOptions)initWithCreationOptions:(id)a3;
- (id)creationOptions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVAssetSerializableCreationOptions

- (AVAssetSerializableCreationOptions)initWithCreationOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetSerializableCreationOptions;
  v4 = [(AVAssetSerializableCreationOptions *)&v6 init];
  if (v4) {
    v4->_creationOptions = (NSDictionary *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetSerializableCreationOptions;
  [(AVAssetSerializableCreationOptions *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, v19), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  id v11 = (id)[(NSDictionary *)self->_creationOptions mutableCopy];
  [v11 removeObjectForKey:@"AVURLAssetHTTPCookiesKey"];
  [a3 encodeObject:v11 forKey:@"assetCreationOptions"];
  id v12 = [(NSDictionary *)self->_creationOptions objectForKeyedSubscript:@"AVURLAssetHTTPCookiesKey"];
  if ([v12 count])
  {
    v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17++), "properties"));
        }
        while (v15 != v17);
        uint64_t v15 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
    [a3 encodeObject:v13 forKey:@"httpCookies"];
  }
}

- (AVAssetSerializableCreationOptions)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v27 = self;
    v33 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v28, v29, v30, v31, v32, v34), 0 reason userInfo];
    objc_exception_throw(v33);
  }
  v39.receiver = self;
  v39.super_class = (Class)AVAssetSerializableCreationOptions;
  uint64_t v6 = [(AVAssetSerializableCreationOptions *)&v39 init];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v6->_creationOptions = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0), @"assetCreationOptions");
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0), @"httpCookies");
    if (v18)
    {
      long long v19 = (void *)v18;
      long long v20 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v36;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E4F18D28], "cookieWithProperties:", *(void *)(*((void *)&v35 + 1) + 8 * v24++)));
          }
          while (v22 != v24);
          uint64_t v22 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v22);
      }
      v25 = (NSDictionary *)[(NSDictionary *)v6->_creationOptions mutableCopy];
      [(NSDictionary *)v25 setObject:v20 forKey:@"AVURLAssetHTTPCookiesKey"];

      v6->_creationOptions = v25;
    }
  }
  return v6;
}

- (id)creationOptions
{
  v2 = self->_creationOptions;
  return v2;
}

@end