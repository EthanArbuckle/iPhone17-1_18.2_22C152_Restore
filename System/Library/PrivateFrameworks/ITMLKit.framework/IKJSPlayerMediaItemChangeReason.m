@interface IKJSPlayerMediaItemChangeReason
- (IKJSPlayerMediaItemChangeReason)init;
- (int64_t)ERRORED;
- (int64_t)FORWARDED_TO_END;
- (int64_t)PLAYED_TO_END;
- (int64_t)PLAYLIST_CHANGED;
- (int64_t)UNKNOWN;
- (int64_t)USER_INITIATED;
@end

@implementation IKJSPlayerMediaItemChangeReason

- (IKJSPlayerMediaItemChangeReason)init
{
  v3 = +[IKAppContext currentAppContext];
  v6.receiver = self;
  v6.super_class = (Class)IKJSPlayerMediaItemChangeReason;
  v4 = [(IKJSObject *)&v6 initWithAppContext:v3];

  return v4;
}

- (int64_t)UNKNOWN
{
  return 0;
}

- (int64_t)PLAYED_TO_END
{
  return 1;
}

- (int64_t)FORWARDED_TO_END
{
  return 2;
}

- (int64_t)ERRORED
{
  return 3;
}

- (int64_t)PLAYLIST_CHANGED
{
  return 4;
}

- (int64_t)USER_INITIATED
{
  return 5;
}

@end