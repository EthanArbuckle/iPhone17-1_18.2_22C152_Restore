@interface INItemProviderRequestMetadata
+ (BOOL)supportsSecureCoding;
- (INItemProviderRequestMetadata)initWithCoder:(id)a3;
- (INItemProviderRequestMetadata)initWithMetadata:(id)a3 supportedContentTypes:(id)a4;
- (NSArray)supportedContentTypes;
- (NSData)metadata;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INItemProviderRequestMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)encodeWithCoder:(id)a3
{
  metadata = self->_metadata;
  id v5 = a3;
  [v5 encodeObject:metadata forKey:@"metadata"];
  [v5 encodeObject:self->_supportedContentTypes forKey:@"supportedContentTypes"];
}

- (INItemProviderRequestMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"supportedContentTypes"];

  v10 = [(INItemProviderRequestMetadata *)self initWithMetadata:v5 supportedContentTypes:v9];
  return v10;
}

- (INItemProviderRequestMetadata)initWithMetadata:(id)a3 supportedContentTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(INItemProviderRequestMetadata *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    metadata = v8->_metadata;
    v8->_metadata = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    supportedContentTypes = v8->_supportedContentTypes;
    v8->_supportedContentTypes = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

@end