@interface NSUserActivity(INCacheSupport)
+ (void)buildFromCachePayload:()INCacheSupport identifier:completion:;
- (void)generateCachePayloadWithCompletion:()INCacheSupport;
@end

@implementation NSUserActivity(INCacheSupport)

- (void)generateCachePayloadWithCompletion:()INCacheSupport
{
  id v4 = a3;
  if (v4)
  {
    [a1 _intentsPrepareForEncoding];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__NSUserActivity_INCacheSupport__generateCachePayloadWithCompletion___block_invoke;
    v5[3] = &unk_1E551F888;
    id v6 = v4;
    [a1 _createUserActivityDataWithOptions:0 completionHandler:v5];
  }
}

+ (void)buildFromCachePayload:()INCacheSupport identifier:completion:
{
  id v6 = a5;
  if (v6)
  {
    v7 = [a3 objectForKey:@"userActivityData"];
    v8 = INCacheableGetSerializationQueue();
    if (v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__NSUserActivity_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke;
      block[3] = &unk_1E551F740;
      v9 = &v13;
      id v13 = v7;
      v14 = v6;
      dispatch_async(v8, block);

      v8 = v14;
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __78__NSUserActivity_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke_2;
      v10[3] = &unk_1E551BEC0;
      v9 = &v11;
      id v11 = v6;
      dispatch_async(v8, v10);
    }
  }
}

@end