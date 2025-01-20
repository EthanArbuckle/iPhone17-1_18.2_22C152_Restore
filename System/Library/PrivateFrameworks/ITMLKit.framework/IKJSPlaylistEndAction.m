@interface IKJSPlaylistEndAction
- (IKJSPlaylistEndAction)init;
- (int64_t)PAUSE;
- (int64_t)STOP;
- (int64_t)WAIT_FOR_MORE_ITEMS;
@end

@implementation IKJSPlaylistEndAction

- (IKJSPlaylistEndAction)init
{
  v3 = +[IKAppContext currentAppContext];
  v6.receiver = self;
  v6.super_class = (Class)IKJSPlaylistEndAction;
  v4 = [(IKJSObject *)&v6 initWithAppContext:v3];

  return v4;
}

- (int64_t)STOP
{
  return 0;
}

- (int64_t)PAUSE
{
  return 1;
}

- (int64_t)WAIT_FOR_MORE_ITEMS
{
  return 2;
}

@end