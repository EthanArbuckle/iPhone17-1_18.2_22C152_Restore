@interface PHCollectionDeleteRequest
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
@end

@implementation PHCollectionDeleteRequest

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(PHTrashableObjectDeleteRequest *)self operation];
  switch(v8)
  {
    case 2:
      id v10 = v6;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
      [v7 userUntrashAlbums:v9];
      goto LABEL_7;
    case 1:
      id v11 = v6;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      [v7 userExpungeAlbums:v9];
      goto LABEL_7;
    case 0:
      v12[0] = v6;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v7 userTrashAlbums:v9];
LABEL_7:

      break;
  }
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHCollectionDeleteRequest;
  id v16 = 0;
  unsigned int v7 = [(PHTrashableObjectDeleteRequest *)&v15 validateForDeleteManagedObject:v6 error:&v16];
  id v8 = v16;
  if (v7)
  {
    if ([(PHObjectDeleteRequest *)self isClientEntitled]
      || (objc_opt_respondsToSelector() & 1) == 0
      || ![v6 isCloudSharedAlbum])
    {
      BOOL v13 = 1;
      goto LABEL_10;
    }
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithFormat:@"Cannot modify iCloud Shared Streams"];
    v18[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v12 = objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v11);

    id v8 = (id)v12;
  }
  if (a4)
  {
    id v8 = v8;
    BOOL v13 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_10:

  return v13;
}

@end