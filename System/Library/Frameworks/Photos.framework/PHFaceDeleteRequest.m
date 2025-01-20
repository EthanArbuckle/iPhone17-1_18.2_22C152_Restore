@interface PHFaceDeleteRequest
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
@end

@implementation PHFaceDeleteRequest

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 managedObjectContext];
  [v6 deleteObject:v5];
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PHFaceDeleteRequest;
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