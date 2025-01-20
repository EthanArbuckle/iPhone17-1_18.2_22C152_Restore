@interface PHSearchEntityDeleteRequest
+ (void)deleteAllSearchEntities;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
@end

@implementation PHSearchEntityDeleteRequest

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 managedObjectContext];
  [v6 deleteObject:v5];
}

+ (void)deleteAllSearchEntities
{
  id v6 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
  v3 = [v6 librarySpecificFetchOptions];
  v4 = +[PHSearchEntity fetchSearchEntitiesWithOptions:v3];

  id v5 = +[PHObjectDeleteRequest deleteRequestsForObjects:v4 ofType:objc_opt_class() forSelector:a2];
}

@end