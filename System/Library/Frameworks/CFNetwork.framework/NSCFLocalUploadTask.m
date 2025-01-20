@interface NSCFLocalUploadTask
@end

@implementation NSCFLocalUploadTask

void __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = v2[88];
    if (!v3) {
      uint64_t v3 = v2[87];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke_2;
  v5[3] = &unk_1E5258228;
  v5[4] = v2;
  -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v3, v2, v4, v5);
}

void __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke_2(uint64_t a1)
{
}

void __48____NSCFLocalUploadTask__private_issueDidFinish__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 776);
  *(void *)(v2 + 776) = 0;
  uint64_t v4 = 0;
  if (![*(id *)(a1 + 32) error])
  {
    uint64_t v4 = (uint64_t)v3;
    if (!v3) {
      uint64_t v4 = [MEMORY[0x1E4F1C9B8] data];
    }
  }
  +[__NSURLSessionStatistics reportMetricsToSymptoms:*(void *)(a1 + 32)];
  (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), v4, [*(id *)(a1 + 32) response], objc_msgSend(*(id *)(a1 + 32), "error"));
  if (v3) {
    dispatch_release(v3);
  }
  _Block_release(*(const void **)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);

  [(NSURLSessionTask *)v6 _resetTaskDelegate];
}

uint64_t __53____NSCFLocalUploadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancelByProducingResumeData:", *(void *)(a1 + 40));
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56____NSCFLocalUploadTask__private_completionAfterMetrics__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(const void **)(a1 + 40);

  _Block_release(v2);
}

@end