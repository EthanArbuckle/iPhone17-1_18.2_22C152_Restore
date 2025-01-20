@interface FAFetchFamilyPhotoOperationContext
- (id)runFetchFamilyCircleOperation:(id)a3;
- (void)runAAFamilyMemberPhotoRequest:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation FAFetchFamilyPhotoOperationContext

- (void)runAAFamilyMemberPhotoRequest:(id)a3 withCompletionHandler:(id)a4
{
}

- (id)runFetchFamilyCircleOperation:(id)a3
{
  return [a3 fetchFamilyCircle];
}

@end