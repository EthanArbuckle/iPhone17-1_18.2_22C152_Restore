@interface NSURLSession(GKAdditions)
+ (void)_gkSendAsynchronousRequest:()GKAdditions completionHandler:;
@end

@implementation NSURLSession(GKAdditions)

+ (void)_gkSendAsynchronousRequest:()GKAdditions completionHandler:
{
  id v5 = a3;
  id v6 = a4;
  if (_gkSendAsynchronousRequest_completionHandler__onceToken != -1) {
    dispatch_once(&_gkSendAsynchronousRequest_completionHandler__onceToken, &__block_literal_global_151);
  }
  v7 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke_2;
  v10[3] = &unk_1E646E198;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

@end