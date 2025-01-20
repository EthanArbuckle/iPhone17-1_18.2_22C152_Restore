@interface MPStoreItemLibraryImport
- (BOOL)addToCloudLibrary;
- (BOOL)addToDeviceLibraryOnly;
- (MPModelObject)referralObject;
- (MPStoreItemLibraryImport)initWithImportElements:(id)a3 referralObject:(id)a4 usingCloudLibraryDestination:(BOOL)a5;
- (MPStoreItemLibraryImport)initWithImportElements:(id)a3 usingCloudLibraryDestination:(BOOL)a4;
- (NSArray)importElements;
- (id)_initWithImportElements:(id)a3 referralObject:(id)a4 usingCloudLibraryDestination:(BOOL)a5 localLibraryDestination:(BOOL)a6;
- (id)initUsingLocalDeviceLibraryDestinationWithImportElements:(id)a3 referralObject:(id)a4 usingLocalLibraryDestination:(BOOL)a5 usingCloudLibraryDestination:(BOOL)a6;
- (id)initUsingLocalDeviceLibraryDestinationWithImportElements:(id)a3 usingLocalLibraryDestination:(BOOL)a4 usingCloudLibraryDestination:(BOOL)a5;
@end

@implementation MPStoreItemLibraryImport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referralObject, 0);

  objc_storeStrong((id *)&self->_importElements, 0);
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (BOOL)addToDeviceLibraryOnly
{
  return self->_addToDeviceLibraryOnly;
}

- (BOOL)addToCloudLibrary
{
  return self->_addToCloudLibrary;
}

- (NSArray)importElements
{
  return self->_importElements;
}

- (id)_initWithImportElements:(id)a3 referralObject:(id)a4 usingCloudLibraryDestination:(BOOL)a5 localLibraryDestination:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPStoreItemLibraryImport;
  v12 = [(MPStoreItemLibraryImport *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_referralObject, a4);
    uint64_t v14 = [v10 copy];
    importElements = v13->_importElements;
    v13->_importElements = (NSArray *)v14;

    v13->_addToCloudLibrary = a5;
    v13->_addToDeviceLibraryOnly = a6;
  }

  return v13;
}

- (id)initUsingLocalDeviceLibraryDestinationWithImportElements:(id)a3 referralObject:(id)a4 usingLocalLibraryDestination:(BOOL)a5 usingCloudLibraryDestination:(BOOL)a6
{
  return [(MPStoreItemLibraryImport *)self _initWithImportElements:a3 referralObject:a4 usingCloudLibraryDestination:a6 localLibraryDestination:a5];
}

- (MPStoreItemLibraryImport)initWithImportElements:(id)a3 referralObject:(id)a4 usingCloudLibraryDestination:(BOOL)a5
{
  return (MPStoreItemLibraryImport *)[(MPStoreItemLibraryImport *)self _initWithImportElements:a3 referralObject:a4 usingCloudLibraryDestination:a5 localLibraryDestination:a5];
}

- (id)initUsingLocalDeviceLibraryDestinationWithImportElements:(id)a3 usingLocalLibraryDestination:(BOOL)a4 usingCloudLibraryDestination:(BOOL)a5
{
  return [(MPStoreItemLibraryImport *)self _initWithImportElements:a3 referralObject:0 usingCloudLibraryDestination:a5 localLibraryDestination:a4];
}

- (MPStoreItemLibraryImport)initWithImportElements:(id)a3 usingCloudLibraryDestination:(BOOL)a4
{
  return (MPStoreItemLibraryImport *)[(MPStoreItemLibraryImport *)self _initWithImportElements:a3 referralObject:0 usingCloudLibraryDestination:a4 localLibraryDestination:a4];
}

@end