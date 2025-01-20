@interface AMLArrayBatchProvider
+ (BOOL)supportsSecureCoding;
- (AMLArrayBatchProvider)initWithArray:(id)a3;
- (AMLArrayBatchProvider)initWithCoder:(id)a3;
- (AMLArrayBatchProvider)initWithMLArrayBatchProvider:(id)a3;
- (MLArrayBatchProvider)batchProvider;
- (id)featuresAtIndex:(int64_t)a3;
- (int64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMLArrayBatchProvider

- (AMLArrayBatchProvider)initWithMLArrayBatchProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMLArrayBatchProvider;
  v6 = [(AMLArrayBatchProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_batchProvider, a3);
  }

  return v7;
}

- (AMLArrayBatchProvider)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMLArrayBatchProvider;
  id v5 = [(AMLArrayBatchProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v4];
    batchProvider = v5->_batchProvider;
    v5->_batchProvider = (MLArrayBatchProvider *)v6;
  }
  return v5;
}

- (int64_t)count
{
  return [(MLArrayBatchProvider *)self->_batchProvider count];
}

- (id)featuresAtIndex:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 < 0) {
    int64_t v3 = [(MLArrayBatchProvider *)self->_batchProvider count] + a3;
  }
  batchProvider = self->_batchProvider;

  return (id)[(MLArrayBatchProvider *)batchProvider featuresAtIndex:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMLArrayBatchProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x24C55D580]();
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = self;
  v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, 0);

  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"array"];
  v13 = (void *)[objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v12];
  v14 = [(AMLArrayBatchProvider *)self initWithMLArrayBatchProvider:v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)MEMORY[0x24C55D580]();
  id v5 = [(MLArrayBatchProvider *)self->_batchProvider array];
  [v6 encodeObject:v5 forKey:@"array"];
}

- (MLArrayBatchProvider)batchProvider
{
  return self->_batchProvider;
}

- (void).cxx_destruct
{
}

@end