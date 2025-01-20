@interface NSURLSessionTask(ECNWActivity)
- (void)ec_setActivityWithDomain:()ECNWActivity type:;
@end

@implementation NSURLSessionTask(ECNWActivity)

- (void)ec_setActivityWithDomain:()ECNWActivity type:
{
  id v2 = (id)nw_activity_create();
  objc_msgSend(a1, "set_nw_activity:");
}

@end