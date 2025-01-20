@interface SCNetworkConnectionInitialize
@end

@implementation SCNetworkConnectionInitialize

uint64_t ____SCNetworkConnectionInitialize_block_invoke()
{
  v0 = getenv("PPPDebug");
  if (v0 && sscanf(v0, "%d", &debug) != 1) {
    debug = 1;
  }
  __kSCNetworkConnectionTypeID = _CFRuntimeRegisterClass();

  return pthread_atfork(0, 0, childForkHandler_0);
}

@end