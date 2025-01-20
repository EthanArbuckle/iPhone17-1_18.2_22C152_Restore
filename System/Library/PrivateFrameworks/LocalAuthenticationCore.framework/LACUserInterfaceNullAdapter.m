@interface LACUserInterfaceNullAdapter
- (void)processRequest:(id)a3 completion:(id)a4;
@end

@implementation LACUserInterfaceNullAdapter

- (void)processRequest:(id)a3 completion:(id)a4
{
  v5 = NSString;
  v6 = (void (**)(id, void *))a4;
  id v8 = [v5 stringWithFormat:@"%@ is not supported in this platform", self];
  v7 = +[LACError errorWithCode:-1020 debugDescription:v8];
  v6[2](v6, v7);
}

@end