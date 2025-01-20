@interface MPStoreModelObjectBuilder
+ (id)allSupportedProperties;
- (BOOL)preventStoreItemMetadataCaching;
- (MPPropertySet)requestedPropertySet;
- (MPStoreModelObjectBuilder)initWithRequestedPropertySet:(id)a3;
- (id)modelObjectWithStoreItemMetadata:(id)a3;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
- (id)modelObjectWithStoreItemMetadata:(id)a3 userIdentity:(id)a4;
- (id)modelObjectWithStorePlatformDictionary:(id)a3;
- (id)modelObjectWithStorePlatformDictionary:(id)a3 userIdentity:(id)a4;
- (void)setPreventStoreItemMetadataCaching:(BOOL)a3;
@end

@implementation MPStoreModelObjectBuilder

- (void).cxx_destruct
{
}

- (void)setPreventStoreItemMetadataCaching:(BOOL)a3
{
  self->_preventStoreItemMetadataCaching = a3;
}

- (BOOL)preventStoreItemMetadataCaching
{
  return self->_preventStoreItemMetadataCaching;
}

- (MPPropertySet)requestedPropertySet
{
  return self->_requestedPropertySet;
}

- (id)modelObjectWithStorePlatformDictionary:(id)a3 userIdentity:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    v8 = [[MPStoreItemMetadata alloc] initWithStorePlatformDictionary:v7];

    if (v8)
    {
      v9 = [(MPStoreModelObjectBuilder *)self modelObjectWithStoreItemMetadata:v8 userIdentity:v6];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  return 0;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 userIdentity:(id)a4
{
  return [(MPStoreModelObjectBuilder *)self modelObjectWithStoreItemMetadata:a3 sourceModelObject:0 userIdentity:a4];
}

- (id)modelObjectWithStorePlatformDictionary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB87B8];
  id v5 = a3;
  id v6 = [v4 activeAccount];
  id v7 = [(MPStoreModelObjectBuilder *)self modelObjectWithStorePlatformDictionary:v5 userIdentity:v6];

  return v7;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4FB87B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 activeAccount];
  v10 = [(MPStoreModelObjectBuilder *)self modelObjectWithStoreItemMetadata:v8 sourceModelObject:v7 userIdentity:v9];

  return v10;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB87B8];
  id v5 = a3;
  id v6 = [v4 activeAccount];
  id v7 = [(MPStoreModelObjectBuilder *)self modelObjectWithStoreItemMetadata:v5 userIdentity:v6];

  return v7;
}

- (MPStoreModelObjectBuilder)initWithRequestedPropertySet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreModelObjectBuilder;
  id v5 = [(MPStoreModelObjectBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestedPropertySet = v5->_requestedPropertySet;
    v5->_requestedPropertySet = (MPPropertySet *)v6;
  }
  return v5;
}

+ (id)allSupportedProperties
{
  return +[MPPropertySet emptyPropertySet];
}

@end