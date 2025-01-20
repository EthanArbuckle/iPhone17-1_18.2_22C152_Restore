@interface SiriTTSDaemonSession
@end

@implementation SiriTTSDaemonSession

void __51__SiriTTSDaemonSession_AFAddition__afSharedSession__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA4F30]);
  v1 = (void *)afSharedSession_session;
  afSharedSession_session = (uint64_t)v0;
}

@end