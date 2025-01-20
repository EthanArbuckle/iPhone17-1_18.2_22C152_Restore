@interface NSURLSession
@end

@implementation NSURLSession

uint64_t __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(20);
  v1 = (void *)_gkSendAsynchronousRequest_completionHandler__sNetworkSemaphore;
  _gkSendAsynchronousRequest_completionHandler__sNetworkSemaphore = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)_gkSendAsynchronousRequest_completionHandler__sHandlerQueue;
  _gkSendAsynchronousRequest_completionHandler__sHandlerQueue = v2;

  [(id)_gkSendAsynchronousRequest_completionHandler__sHandlerQueue setName:@"com.apple.gamed.networkReplyHandler"];
  v4 = (void *)_gkSendAsynchronousRequest_completionHandler__sHandlerQueue;

  return [v4 setMaxConcurrentOperationCount:-1];
}

void __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_wait((dispatch_semaphore_t)_gkSendAsynchronousRequest_completionHandler__sNetworkSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = GKGetRuntimeStrategy();
  v3 = [v2 instrumentedURLSession];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E646E170;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v5 = [v3 dataTaskWithRequest:v4 completionHandler:v6];
  [v5 resume];
}

void __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  dispatch_semaphore_signal((dispatch_semaphore_t)_gkSendAsynchronousRequest_completionHandler__sNetworkSemaphore);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v7, v10, v8);
  }
}

@end