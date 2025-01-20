@interface NSCFBackgroundDownloadTask
@end

@implementation NSCFBackgroundDownloadTask

void __60____NSCFBackgroundDownloadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (v1)
  {
    v2 = *(unsigned char **)(a1 + 40);
    if ([*(id *)(a1 + 32) state] > 2 || v1[772])
    {
      uint64_t v3 = [v1 session];
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      v8 = __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
      v9 = &unk_1E5257FD8;
      v10 = v2;
      -[NSURLSession runDelegateBlock:](v3, &v6);
    }
    else
    {
      v1[772] = 1;
      [v1 setState:2];
      v4 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]([v1 session]);
      uint64_t v5 = [v1 taskIdentifier];
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      v8 = __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke;
      v9 = &unk_1E5254F30;
      v10 = v1;
      v11 = v2;
      [v4 cancelTaskWithIdentifier:v5 byProducingResumeData:&v6];
    }
  }
}

void __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke(uint64_t a1, NSData *a2)
{
  if (a2) {
    -[__NSURLBackgroundSession moveFileToTempForBackgroundResumeData:]([*(id *)(a1 + 32) session], a2);
  }
  uint64_t v4 = [*(id *)(a1 + 32) session];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
  v6[3] = &unk_1E5258028;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v5;
  -[NSURLSession runDelegateBlock:](v4, v6);
}

uint64_t __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __67____NSCFBackgroundDownloadTask__onqueue_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _pathToDownloadTaskFile];
  if (!result)
  {
    uint64_t v3 = (const char *)[*(id *)(a1 + 40) fileSystemRepresentation];
    return unlink(v3);
  }
  return result;
}

@end