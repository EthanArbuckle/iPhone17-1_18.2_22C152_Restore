@interface AMSMutablePromise(AppStoreComponents)
- (id)asc_copy;
@end

@implementation AMSMutablePromise(AppStoreComponents)

- (id)asc_copy
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4DDB0]);
  v3 = [v2 completionHandlerAdapter];
  [a1 addFinishBlock:v3];

  return v2;
}

@end