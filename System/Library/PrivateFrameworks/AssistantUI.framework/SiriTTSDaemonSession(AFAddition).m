@interface SiriTTSDaemonSession(AFAddition)
+ (id)afSharedSession;
@end

@implementation SiriTTSDaemonSession(AFAddition)

+ (id)afSharedSession
{
  if (afSharedSession_onceToken != -1) {
    dispatch_once(&afSharedSession_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)afSharedSession_session;

  return v0;
}

@end