@interface PHCloudSharedAlbumDeleteRequest
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
@end

@implementation PHCloudSharedAlbumDeleteRequest

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v6 userTrashAlbums:v7];
  }
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PHCloudSharedAlbumDeleteRequest;
  id v10 = 0;
  BOOL v5 = [(PHObjectDeleteRequest *)&v9 validateForDeleteManagedObject:a3 error:&v10];
  id v6 = v10;
  v7 = v6;
  if (a4 && !v5) {
    *a4 = v6;
  }

  return v5;
}

@end