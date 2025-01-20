@interface IKDataBindingPropertyPath
+ (id)pathStringForAccessorSequence:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IKDataBindingPropertyPath)initWithAccessorSequence:(id)a3;
- (IKDataBindingPropertyPath)initWithString:(id)a3;
- (NSArray)accessorSequence;
- (NSString)string;
- (id)_initWithAccessorSequence:(id)a3;
- (id)propertyPathByCombiningAccessorSequence:(id)a3;
- (id)propertyPathByRemovingFirstAccessor;
- (unint64_t)hash;
@end

@implementation IKDataBindingPropertyPath

+ (id)pathStringForAccessorSequence:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  v5 = [v3 string];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__IKDataBindingPropertyPath_pathStringForAccessorSequence___block_invoke;
  v9[3] = &unk_1E6DE6C78;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  v7 = (void *)[v6 copy];
  return v7;
}

void __59__IKDataBindingPropertyPath_pathStringForAccessorSequence___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3) {
      [*(id *)(a1 + 32) appendString:@"."];
    }
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v8 property];
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"[%ld]", objc_msgSend(v8, "subscriptIndex"));
  }
  v7 = (void *)v6;
  [v5 appendString:v6];
}

- (IKDataBindingPropertyPath)initWithString:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IKDataBindingPropertyPath;
  v5 = [(IKDataBindingPropertyPath *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    string = v5->_string;
    v5->_string = (NSString *)v6;

    id v8 = [v4 componentsSeparatedByString:@"."];
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v8;
    uint64_t v21 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(obj);
          }
          v11 = [MEMORY[0x1E4F28FE8] scannerWithString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          id v23 = 0;
          [v11 scanUpToString:@"[" intoString:&v23];
          id v12 = v23;
          if ([v12 length])
          {
            v13 = [[IKDataProperty alloc] initWithProperty:v12];
            [v9 addObject:v13];
          }
          if (([v11 isAtEnd] & 1) == 0)
          {
            do
            {
              [v11 scanString:@"[" intoString:0];
              unint64_t v22 = 0xFFFFFFFF80000000;
              if ([v11 scanInteger:&v22]) {
                [v11 scanUpToString:@"]" intoString:0];
              }
              if (v22 > 0x7FFFFFFE) {
                break;
              }
              if (([v11 scanString:@"]" intoString:0] & 1) == 0) {
                break;
              }
              v14 = [IKDataSubscript alloc];
              v15 = [(IKDataSubscript *)v14 initWithSubscriptIndex:v22];
              [v9 addObject:v15];
            }
            while (![v11 isAtEnd]);
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v21);
    }

    uint64_t v16 = [v9 count];
    if (v16) {
      v17 = (void *)[v9 copy];
    }
    else {
      v17 = 0;
    }
    objc_storeStrong((id *)&v5->_accessorSequence, v17);
    if (v16) {
  }
    }
  return v5;
}

- (IKDataBindingPropertyPath)initWithAccessorSequence:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKDataBindingPropertyPath;
  v5 = [(IKDataBindingPropertyPath *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    accessorSequence = v5->_accessorSequence;
    v5->_accessorSequence = (NSArray *)v6;

    uint64_t v8 = [(id)objc_opt_class() pathStringForAccessorSequence:v4];
    string = v5->_string;
    v5->_string = (NSString *)v8;
  }
  return v5;
}

- (id)propertyPathByCombiningAccessorSequence:(id)a3
{
  id v4 = a3;
  v5 = [(IKDataBindingPropertyPath *)self accessorSequence];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 addObjectsFromArray:v4];
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = (void *)[v6 copy];
  v9 = (void *)[v7 _initWithAccessorSequence:v8];

  return v9;
}

- (id)propertyPathByRemovingFirstAccessor
{
  v2 = [(IKDataBindingPropertyPath *)self accessorSequence];
  v3 = (void *)[v2 mutableCopy];

  [v3 removeObjectAtIndex:0];
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)[v3 copy];
  uint64_t v6 = (void *)[v4 _initWithAccessorSequence:v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(IKDataBindingPropertyPath *)self string];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 string];
    uint64_t v6 = [(IKDataBindingPropertyPath *)self string];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_initWithAccessorSequence:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKDataBindingPropertyPath;
  v5 = [(IKDataBindingPropertyPath *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() pathStringForAccessorSequence:v4];
    string = v5->_string;
    v5->_string = (NSString *)v6;

    uint64_t v8 = [v4 copy];
    accessorSequence = v5->_accessorSequence;
    v5->_accessorSequence = (NSArray *)v8;
  }
  return v5;
}

- (NSString)string
{
  return self->_string;
}

- (NSArray)accessorSequence
{
  return self->_accessorSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorSequence, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end