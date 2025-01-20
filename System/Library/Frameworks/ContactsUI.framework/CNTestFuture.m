@interface CNTestFuture
+ (BOOL)supportsSecureCoding;
+ (id)futureWithError:(id)a3;
+ (id)futureWithResult:(id)a3;
- (CNTestFuture)initWithCoder:(id)a3;
- (CNTestFuture)initWithError:(id)a3;
- (CNTestFuture)initWithResult:(id)a3;
- (NSError)error;
- (NSObject)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNTestFuture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSObject)result
{
  return self->_result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"CNTestFuture.m" lineNumber:87 description:0];
  }
  v6 = [(CNTestFuture *)self result];

  if (v6)
  {
    v7 = [(CNTestFuture *)self result];
    v8 = objc_opt_class();

    v9 = (void *)MEMORY[0x1E4F1CA80];
    v10 = nameForSanitizedClass(v8);
    v11 = [v9 setWithObject:v10];

    v12 = [(CNTestFuture *)self result];
    int v13 = [v12 conformsToProtocol:&unk_1ED9F0F58];

    if (v13)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v14 = [(CNTestFuture *)self result];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            if (([*(id *)(*((void *)&v27 + 1) + 8 * v18) conformsToProtocol:&unk_1ED925CD8] & 1) == 0)
            {
              [MEMORY[0x1E4F28B00] currentHandler];
              v21 = v26 = a2;
              [v21 handleFailureInMethod:v26 object:self file:@"CNTestFuture.m" lineNumber:93 description:0];

              a2 = v26;
            }
            v19 = objc_opt_class();
            v20 = nameForSanitizedClass(v19);
            [v11 addObject:v20];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v16);
      }
    }
    [v5 encodeObject:v11 forKey:@"resultClasses"];
    v22 = [(CNTestFuture *)self result];
    [v5 encodeObject:v22 forKey:@"result"];
  }
  else
  {
    v23 = [(CNTestFuture *)self error];

    if (v23)
    {
      v24 = [(CNTestFuture *)self error];
      [v5 encodeObject:v24 forKey:@"error"];
    }
  }
}

- (CNTestFuture)initWithCoder:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNTestFuture;
  v6 = [(CNTestFuture *)&v21 init];
  if (v6)
  {

    if (([v5 allowsKeyedCoding] & 1) == 0)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:0 file:@"CNTestFuture.m" lineNumber:56 description:0];
    }
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v5 decodeObjectOfClasses:v9 forKey:@"resultClasses"];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v12 = [v10 allObjects];
    int v13 = objc_msgSend(v12, "_cn_map:", &__block_literal_global_3570);
    v14 = [v11 setWithArray:v13];

    uint64_t v15 = [v5 decodeObjectOfClasses:v14 forKey:@"result"];
    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F5A408] futureWithResult:v15];
    }
    else
    {
      uint64_t v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
      uint64_t v16 = [MEMORY[0x1E4F5A408] futureWithError:v18];
    }
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

Class __30__CNTestFuture_initWithCoder___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (CNTestFuture)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTestFuture;
  v6 = [(CNTestFuture *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

- (CNTestFuture)initWithResult:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTestFuture;
  v6 = [(CNTestFuture *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_result, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)futureWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithError:v4];

  return v5;
}

+ (id)futureWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithResult:v4];

  return v5;
}

@end