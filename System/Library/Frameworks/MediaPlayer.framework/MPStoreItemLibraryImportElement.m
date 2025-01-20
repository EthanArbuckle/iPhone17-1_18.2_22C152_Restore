@interface MPStoreItemLibraryImportElement
- (MPStoreItemLibraryImportElement)initWithStoreItemID:(int64_t)a3 additionalTrackMetadata:(id)a4;
- (NSDictionary)additionalTrackMetadata;
- (id)storeItem;
- (int64_t)storeItemID;
@end

@implementation MPStoreItemLibraryImportElement

- (void).cxx_destruct
{
}

- (NSDictionary)additionalTrackMetadata
{
  return self->_additionalTrackMetadata;
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (id)storeItem
{
  return 0;
}

- (MPStoreItemLibraryImportElement)initWithStoreItemID:(int64_t)a3 additionalTrackMetadata:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPStoreItemLibraryImportElement;
  v7 = [(MPStoreItemLibraryImportElement *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_storeItemID = a3;
    uint64_t v9 = [v6 copy];
    additionalTrackMetadata = v8->_additionalTrackMetadata;
    v8->_additionalTrackMetadata = (NSDictionary *)v9;
  }
  return v8;
}

@end