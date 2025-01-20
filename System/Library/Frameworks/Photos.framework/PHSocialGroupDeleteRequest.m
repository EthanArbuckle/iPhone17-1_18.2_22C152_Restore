@interface PHSocialGroupDeleteRequest
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
@end

@implementation PHSocialGroupDeleteRequest

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 managedObjectContext];
  [v6 deleteObject:v5];
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHSocialGroupDeleteRequest;
  id v16 = 0;
  unsigned int v7 = [(PHObjectDeleteRequest *)&v15 validateForDeleteManagedObject:v6 error:&v16];
  id v8 = v16;
  if (!v7)
  {
    BOOL v13 = 0;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v9 = (void *)[MEMORY[0x1E4F8ABF8] newNodeContainerWithNode:v6];
  if ([v9 socialGroupVerifiedType] == 2
    || ![v9 socialGroupVerifiedType])
  {
    BOOL v13 = 1;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v18[0] = @"Attempt to delete a non graph-verified social group";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v12 = [v10 errorWithDomain:@"PHPhotosErrorDomain" code:3300 userInfo:v11];

    BOOL v13 = 0;
    id v8 = (id)v12;
  }

  if (a4)
  {
LABEL_9:
    if (!v13) {
      *a4 = v8;
    }
  }
LABEL_11:

  return v13;
}

@end