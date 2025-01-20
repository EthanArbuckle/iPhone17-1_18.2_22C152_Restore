@interface PHPhotoLibraryDeletionOptions
- (BOOL)deleteCloudSyncLibrary;
- (void)setDeleteCloudSyncLibrary:(BOOL)a3;
@end

@implementation PHPhotoLibraryDeletionOptions

- (void)setDeleteCloudSyncLibrary:(BOOL)a3
{
  self->_deleteCloudSyncLibrary = a3;
}

- (BOOL)deleteCloudSyncLibrary
{
  return self->_deleteCloudSyncLibrary;
}

@end