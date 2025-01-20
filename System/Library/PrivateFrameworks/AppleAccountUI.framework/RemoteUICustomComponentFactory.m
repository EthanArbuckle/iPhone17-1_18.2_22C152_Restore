@interface RemoteUICustomComponentFactory
+ (void)registerRemoteUISwiftViews;
- (RemoteUICustomComponentFactory)init;
@end

@implementation RemoteUICustomComponentFactory

+ (void)registerRemoteUISwiftViews
{
}

- (RemoteUICustomComponentFactory)init
{
  return (RemoteUICustomComponentFactory *)CustomComponentFactory.init()();
}

@end