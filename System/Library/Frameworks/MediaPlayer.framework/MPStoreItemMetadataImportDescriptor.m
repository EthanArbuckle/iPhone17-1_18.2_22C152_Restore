@interface MPStoreItemMetadataImportDescriptor
- (ICUserIdentity)userIdentity;
- (MPStoreItemMetadataImportDescriptor)initWithPayload:(id)a3 userIdentity:(id)a4;
- (NSDictionary)platformDictionary;
@end

@implementation MPStoreItemMetadataImportDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_platformDictionary, 0);
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSDictionary)platformDictionary
{
  return self->_platformDictionary;
}

- (MPStoreItemMetadataImportDescriptor)initWithPayload:(id)a3 userIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPStoreItemMetadataImportDescriptor;
  v9 = [(MPStoreItemMetadataImportDescriptor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userIdentity, a4);
    objc_storeStrong((id *)&v10->_platformDictionary, a3);
  }

  return v10;
}

@end