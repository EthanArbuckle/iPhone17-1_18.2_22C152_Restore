@interface SWCollaborationMetadata(NSItemProvider)
+ (id)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:;
+ (id)readableTypeIdentifiersForItemProvider;
+ (id)writableTypeIdentifiersForItemProvider;
- (id)processSigningQueue;
- (id)softSigningController;
- (id)writableTypeIdentifiersForItemProvider;
- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:;
@end

@implementation SWCollaborationMetadata(NSItemProvider)

- (id)processSigningQueue
{
  if (processSigningQueue_onceToken != -1) {
    dispatch_once(&processSigningQueue_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)processSigningQueue_internalQueue;

  return v0;
}

+ (id)readableTypeIdentifiersForItemProvider
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3BE60];
  v3[0] = @"com.apple.SharedWithYou.SWCollaborationMetadata";
  v3[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];

  return v1;
}

+ (id)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 isEqualToString:@"com.apple.SharedWithYou.SWCollaborationMetadata"])
  {
    v9 = (void *)MEMORY[0x1E4F28DC0];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v12 = [v10 setWithArray:v11];
    id v17 = 0;
    v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v7 error:&v17];
    id v14 = v17;

    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (![v8 isEqualToString:*MEMORY[0x1E4F3BE60]])
  {
    id v14 = 0;
    v13 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v15 = [MEMORY[0x1E4F3BE08] objectWithItemProviderData:v7 typeIdentifier:v8 error:a5];
  v13 = [v15 collaborationMetadata];

  id v14 = 0;
  if (a5) {
LABEL_8:
  }
    *a5 = v14;
LABEL_9:

  return v13;
}

- (id)softSigningController
{
  if (getSLCollaborationSigningControllerClass()
    && [getSLCollaborationSigningControllerClass() instancesRespondToSelector:sel_initWithTargetSerialQueue_synchronous_])
  {
    id v2 = objc_alloc((Class)getSLCollaborationSigningControllerClass());
    v3 = [a1 processSigningQueue];
    v4 = (void *)[v2 initWithTargetSerialQueue:v3 synchronous:1];

    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3BE60];
  v3[0] = @"com.apple.SharedWithYou.SWCollaborationMetadata";
  v3[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];

  return v1;
}

- (id)writableTypeIdentifiersForItemProvider
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3BE60];
  v3[0] = @"com.apple.SharedWithYou.SWCollaborationMetadata";
  v3[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];

  return v1;
}

- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__SWCollaborationMetadata_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E5665C98;
  aBlock[4] = a1;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  v11 = [a1 sourceProcessData];

  if (v11 || ([a1 softSigningController], (v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12 = [a1 sourceProcessData];
    v10[2](v10, v12, 0);
  }
  else
  {
    v12 = v13;
    [v13 signSourceProcessWithMetadata:a1 timeout:v10 completion:5.0];
  }

  return 0;
}

@end