@interface IKJSPlaylistRepeatMode
- (IKJSPlaylistRepeatMode)init;
- (int64_t)ALL;
- (int64_t)NONE;
- (int64_t)ONE;
@end

@implementation IKJSPlaylistRepeatMode

- (IKJSPlaylistRepeatMode)init
{
  v3 = +[IKAppContext currentAppContext];
  v6.receiver = self;
  v6.super_class = (Class)IKJSPlaylistRepeatMode;
  v4 = [(IKJSObject *)&v6 initWithAppContext:v3];

  return v4;
}

- (int64_t)NONE
{
  return 0;
}

- (int64_t)ALL
{
  return 1;
}

- (int64_t)ONE
{
  return 2;
}

@end