@interface MPStoreLibraryMappingResponse
- (id)libraryIdentifierSetForIdentifierSet:(id)a3;
- (int64_t)libraryAddedStatus;
- (void)setLibraryAddedStatus:(int64_t)a3;
- (void)setLibraryIdentifierSet:(id)a3 forIdentifierSet:(id)a4;
@end

@implementation MPStoreLibraryMappingResponse

- (id)libraryIdentifierSetForIdentifierSet:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_storeIdentifierSetToLibraryIdentifierSet objectForKey:a3];
}

- (void).cxx_destruct
{
}

- (void)setLibraryAddedStatus:(int64_t)a3
{
  self->_libraryAddedStatus = a3;
}

- (int64_t)libraryAddedStatus
{
  return self->_libraryAddedStatus;
}

- (void)setLibraryIdentifierSet:(id)a3 forIdentifierSet:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    storeIdentifierSetToLibraryIdentifierSet = self->_storeIdentifierSetToLibraryIdentifierSet;
    id v8 = v11;
    if (v11)
    {
      if (!storeIdentifierSetToLibraryIdentifierSet)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v10 = self->_storeIdentifierSetToLibraryIdentifierSet;
        self->_storeIdentifierSetToLibraryIdentifierSet = v9;

        id v8 = v11;
        storeIdentifierSetToLibraryIdentifierSet = self->_storeIdentifierSetToLibraryIdentifierSet;
      }
      [(NSMutableDictionary *)storeIdentifierSetToLibraryIdentifierSet setObject:v8 forKey:v6];
    }
    else
    {
      [(NSMutableDictionary *)storeIdentifierSetToLibraryIdentifierSet removeObjectForKey:v6];
    }
  }
}

@end