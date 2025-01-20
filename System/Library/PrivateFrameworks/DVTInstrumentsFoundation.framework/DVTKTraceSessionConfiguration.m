@interface DVTKTraceSessionConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)useExisting;
- (DVTKTraceSessionConfiguration)init;
- (DVTKTraceSessionConfiguration)initWithCoder:(id)a3;
- (NSData)bitmap;
- (NSDictionary)providers;
- (unint64_t)collectionInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setBitmap:(id)a3;
- (void)setCollectionInterval:(unint64_t)a3;
- (void)setProviders:(id)a3;
- (void)setUseExisting:(BOOL)a3;
@end

@implementation DVTKTraceSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DVTKTraceSessionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)DVTKTraceSessionConfiguration;
  result = [(DVTKTraceSessionConfiguration *)&v3 init];
  if (result) {
    result->_collectionInterval = 100;
  }
  return result;
}

- (DVTKTraceSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DVTKTraceSessionConfiguration;
  v5 = [(DVTKTraceSessionConfiguration *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bitmap"];
    bitmap = v5->_bitmap;
    v5->_bitmap = (NSData *)v6;

    v5->_useExisting = [v4 decodeBoolForKey:@"_useExisting"];
    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = [v8 setWithObjects:v9, nil];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_providers"];
    providers = v5->_providers;
    v5->_providers = (NSDictionary *)v11;

    v5->_collectionInterval = [v4 decodeInt64ForKey:@"_collectionInterval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bitmap = self->_bitmap;
  id v5 = a3;
  [v5 encodeObject:bitmap forKey:@"_bitmap"];
  [v5 encodeBool:self->_useExisting forKey:@"_useExisting"];
  [v5 encodeObject:self->_providers forKey:@"_providers"];
  [v5 encodeInt64:self->_collectionInterval forKey:@"_collectionInterval"];
}

- (NSData)bitmap
{
  return self->_bitmap;
}

- (void)setBitmap:(id)a3
{
}

- (BOOL)useExisting
{
  return self->_useExisting;
}

- (void)setUseExisting:(BOOL)a3
{
  self->_useExisting = a3;
}

- (NSDictionary)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (unint64_t)collectionInterval
{
  return self->_collectionInterval;
}

- (void)setCollectionInterval:(unint64_t)a3
{
  self->_collectionInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_bitmap, 0);
}

@end