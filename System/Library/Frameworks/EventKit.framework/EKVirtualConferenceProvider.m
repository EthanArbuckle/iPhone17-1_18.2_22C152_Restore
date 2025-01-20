@interface EKVirtualConferenceProvider
- (EKVirtualConferenceProvider)init;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)extendExpirationOfURL:(id)a3 toExpirationDate:(id)a4 withCompletion:(id)a5;
- (void)fetchAvailableRoomTypesWithCompletionHandler:(void *)completionHandler;
- (void)fetchVirtualConferenceForIdentifier:(EKVirtualConferenceRoomTypeIdentifier)identifier completionHandler:(void *)completionHandler;
- (void)invalidateURL:(id)a3 withCompletionHandler:(id)a4;
- (void)isURLValid:(id)a3 withCompletion:(id)a4;
@end

@implementation EKVirtualConferenceProvider

- (EKVirtualConferenceProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)EKVirtualConferenceProvider;
  v2 = [(EKVirtualConferenceProvider *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel_beginRequestWithExtensionContext_);
    if (InstanceMethod != class_getInstanceMethod(v3, sel_beginRequestWithExtensionContext_))
    {
      v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C3A8];
      v8 = NSStringFromClass(v3);
      [v6 raise:v7, @"You have overridden beginRequestWithExtensionContext: on your subclass of EKVirtualConferenceProvider (%@) - this is not allowed", v8 format];
    }
  }
  return v2;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  if ([v4 requestType] == 1)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke;
    v16[3] = &unk_1E5B96F78;
    id v17 = v4;
    [(EKVirtualConferenceProvider *)self fetchAvailableRoomTypesWithCompletionHandler:v16];
    v5 = v17;
  }
  else if ([v4 requestType] == 2)
  {
    v6 = [v4 roomTypeIdentifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_2;
    v14[3] = &unk_1E5B96FA0;
    id v15 = v4;
    [(EKVirtualConferenceProvider *)self fetchVirtualConferenceForIdentifier:v6 completionHandler:v14];

    v5 = v15;
  }
  else if ([v4 requestType] == 5)
  {
    uint64_t v7 = [v4 URLForInvalidation];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_3;
    v12[3] = &unk_1E5B96FC8;
    id v13 = v4;
    [(EKVirtualConferenceProvider *)self invalidateURL:v7 withCompletionHandler:v12];

    v5 = v13;
  }
  else
  {
    if ([v4 requestType] != 4)
    {
      [v4 completeRequestReturningItems:0 completionHandler:0];
      goto LABEL_10;
    }
    v8 = [v4 URLForRenewal];
    v9 = [v4 renewalDate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_4;
    v10[3] = &unk_1E5B96FC8;
    id v11 = v4;
    [(EKVirtualConferenceProvider *)self extendExpirationOfURL:v8 toExpirationDate:v9 withCompletion:v10];

    v5 = v11;
  }

LABEL_10:
}

uint64_t __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeRequestWithAvailableRoomTypes:a2 completionHandler:0];
}

uint64_t __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeRequestWithVirtualConference:a2 completionHandler:0];
}

uint64_t __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeRequestWithInvalidationSuccess:a2 == 0 error:a2 completionHandler:0];
}

uint64_t __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeRequestWithRenewalSuccess:a2 == 0 error:a2 completionHandler:0];
}

- (void)isURLValid:(id)a3 withCompletion:(id)a4
{
}

- (void)extendExpirationOfURL:(id)a3 toExpirationDate:(id)a4 withCompletion:(id)a5
{
}

- (void)invalidateURL:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)fetchAvailableRoomTypesWithCompletionHandler:(void *)completionHandler
{
  id v14 = completionHandler;
  objc_opt_class();
  uint64_t v3 = NSRequestConcreteImplementation();
  uint64_t v11 = OUTLINED_FUNCTION_0_4(v3, v4, v5, v6, v7, v8, v9, v10, v13, (uint64_t)v14);
  v12(v11);
}

- (void)fetchVirtualConferenceForIdentifier:(EKVirtualConferenceRoomTypeIdentifier)identifier completionHandler:(void *)completionHandler
{
  id v15 = completionHandler;
  objc_opt_class();
  uint64_t v4 = NSRequestConcreteImplementation();
  uint64_t v12 = OUTLINED_FUNCTION_0_4(v4, v5, v6, v7, v8, v9, v10, v11, v14, (uint64_t)v15);
  v13(v12);
}

@end