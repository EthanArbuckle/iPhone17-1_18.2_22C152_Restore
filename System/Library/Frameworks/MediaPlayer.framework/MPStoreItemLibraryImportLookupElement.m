@interface MPStoreItemLibraryImportLookupElement
- (MPStoreItemLibraryImportLookupElement)initWithLookupDictionary:(id)a3 additionalTrackMetadata:(id)a4;
- (NSDictionary)lookupDictionary;
- (id)storeItem;
@end

@implementation MPStoreItemLibraryImportLookupElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupDictionary, 0);

  objc_storeStrong((id *)&self->_storeItem, 0);
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

- (id)storeItem
{
  return self->_storeItem;
}

- (MPStoreItemLibraryImportLookupElement)initWithLookupDictionary:(id)a3 additionalTrackMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 valueForKey:@"id"];
  uint64_t v9 = [v8 longLongValue];

  v16.receiver = self;
  v16.super_class = (Class)MPStoreItemLibraryImportLookupElement;
  v10 = [(MPStoreItemLibraryImportElement *)&v16 initWithStoreItemID:v9 additionalTrackMetadata:v7];

  if (v10)
  {
    uint64_t v11 = [v6 copy];
    lookupDictionary = v10->_lookupDictionary;
    v10->_lookupDictionary = (NSDictionary *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB8748]) initWithMetadataDictionary:v6];
    storeItem = v10->_storeItem;
    v10->_storeItem = (ICStorePlatformMetadata *)v13;
  }
  return v10;
}

@end