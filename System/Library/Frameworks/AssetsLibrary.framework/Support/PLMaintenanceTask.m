@interface PLMaintenanceTask
- (PLLibraryServicesManager)libraryServicesManager;
- (PLMaintenanceTask)initWithLibraryBundle:(id)a3;
- (PLPhotoLibrary)photoLibrary;
- (PLPhotoLibraryBundle)libraryBundle;
@end

@implementation PLMaintenanceTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyPhotoLibrary, 0);

  objc_storeStrong((id *)&self->_libraryBundle, 0);
}

- (PLPhotoLibraryBundle)libraryBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 8, 1);
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)[(PLLazyObject *)self->_lazyPhotoLibrary objectValue];
}

- (PLLibraryServicesManager)libraryServicesManager
{
  v2 = [(PLMaintenanceTask *)self libraryBundle];
  v3 = [v2 libraryServicesManager];

  return (PLLibraryServicesManager *)v3;
}

- (PLMaintenanceTask)initWithLibraryBundle:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLMaintenanceTask;
  v6 = [(PLMaintenanceTask *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryBundle, a3);
    id v8 = objc_initWeak(&location, v7);

    id v9 = objc_alloc((Class)PLLazyObject);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000085BC;
    v13[3] = &unk_10002CD20;
    objc_copyWeak(&v14, &location);
    v10 = (PLLazyObject *)[v9 initWithBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    lazyPhotoLibrary = v7->_lazyPhotoLibrary;
    v7->_lazyPhotoLibrary = v10;
  }
  return v7;
}

@end