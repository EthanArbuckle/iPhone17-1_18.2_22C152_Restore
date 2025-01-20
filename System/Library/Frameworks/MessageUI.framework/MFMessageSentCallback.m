@interface MFMessageSentCallback
@end

@implementation MFMessageSentCallback

uint64_t ___MFMessageSentCallback_block_invoke(uint64_t a1)
{
  return +[_MFMessageObserver invokeCompletionForMessageGUID:*(void *)(a1 + 32) didSend:*(unsigned __int8 *)(a1 + 40)];
}

@end