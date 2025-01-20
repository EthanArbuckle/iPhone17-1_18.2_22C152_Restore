@interface PHQuestionDeleteRequest
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
@end

@implementation PHQuestionDeleteRequest

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 managedObjectContext];
  [v6 deleteObject:v5];
}

@end