@interface ASDIAPInfoRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDIAPInfoRequestOptions)initWithAdamIds:(id)a3;
- (ASDIAPInfoRequestOptions)initWithCoder:(id)a3;
- (NSArray)adamIds;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDIAPInfoRequestOptions

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSArray *)self->_adamIds copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSArray)adamIds
{
  return self->_adamIds;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASDIAPInfoRequestOptions)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDIAPInfoRequestOptions;
  uint64_t v5 = [(ASDIAPInfoRequestOptions *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ASDIAPInfoRequestOptionsAdamIdsCodingKey"];

    adamIds = v5->_adamIds;
    v5->_adamIds = (NSArray *)v9;
  }
  return v5;
}

- (ASDIAPInfoRequestOptions)initWithAdamIds:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDIAPInfoRequestOptions;
  uint64_t v5 = [(ASDIAPInfoRequestOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    adamIds = v5->_adamIds;
    v5->_adamIds = (NSArray *)v6;
  }
  return v5;
}

@end