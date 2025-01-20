@interface NSCFLocalDataTask
@end

@implementation NSCFLocalDataTask

uint64_t __62____NSCFLocalDataTask__onqueue_didReceiveResponse_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_private_onqueue_didReceiveResponseDisposition:completion:", a2, *(void *)(a1 + 40));
}

@end