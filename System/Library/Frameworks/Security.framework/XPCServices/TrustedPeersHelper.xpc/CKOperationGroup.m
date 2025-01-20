@interface CKOperationGroup
+ (id)CKKSGroupWithName:(id)a3;
@end

@implementation CKOperationGroup

+ (id)CKKSGroupWithName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CKOperationGroup);
  [v4 setExpectedSendSize:1];
  [v4 setExpectedReceiveSize:1];
  [v4 setName:v3];

  return v4;
}

@end