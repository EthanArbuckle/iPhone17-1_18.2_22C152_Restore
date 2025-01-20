@interface _MPRemoteLaunchCommandCenter
- (void)dealloc;
@end

@implementation _MPRemoteLaunchCommandCenter

- (void)dealloc
{
  [(MPRemoteCommandCenter *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_MPRemoteLaunchCommandCenter;
  [(MPRemoteCommandCenter *)&v3 dealloc];
}

@end