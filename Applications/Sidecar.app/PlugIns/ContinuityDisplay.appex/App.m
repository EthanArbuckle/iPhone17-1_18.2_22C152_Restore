@interface App
- (App)init;
- (void)sendEvent:(id)a3;
@end

@implementation App

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000041C8(v4);
}

- (App)init
{
  return (App *)sub_100004298();
}

- (void).cxx_destruct
{
}

@end