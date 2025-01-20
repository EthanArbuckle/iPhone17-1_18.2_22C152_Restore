@interface _ATXIconLocation
- (BOOL)appearOnlyInAppLibrary;
- (BOOL)isInstalled;
- (BOOL)isOnDock;
- (NSIndexPath)indexPath;
- (_ATXIconLocation)initWithIndexPath:(id)a3 isOnDock:(BOOL)a4 existsInAppLibraryOnly:(BOOL)a5 isInstalled:(BOOL)a6;
@end

@implementation _ATXIconLocation

- (_ATXIconLocation)initWithIndexPath:(id)a3 isOnDock:(BOOL)a4 existsInAppLibraryOnly:(BOOL)a5 isInstalled:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_ATXIconLocation;
  v12 = [(_ATXIconLocation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_indexPath, a3);
    v13->_isOnDock = a4;
    v13->_appearOnlyInAppLibrary = a5;
    v13->_isInstalled = a6;
  }

  return v13;
}

- (BOOL)isOnDock
{
  return self->_isOnDock;
}

- (BOOL)appearOnlyInAppLibrary
{
  return self->_appearOnlyInAppLibrary;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
}

@end