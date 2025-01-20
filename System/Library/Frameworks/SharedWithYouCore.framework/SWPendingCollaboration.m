@interface SWPendingCollaboration
@end

@implementation SWPendingCollaboration

void __62___SWPendingCollaboration_NSItemProvider__processSigningQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SharedWithYouCore.SWPendingCollaborationProcessSigning", v2);
  v1 = (void *)processSigningQueue_internalQueue;
  processSigningQueue_internalQueue = (uint64_t)v0;
}

void __103___SWPendingCollaboration_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 collaborationMetadata];
  [v5 setSourceProcessData:v4];

  if ([*(id *)(a1 + 40) isEqualToString:@"com.apple.SharedWithYou.SWPendingCollaboration"])
  {
    id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 32) requiringSecureCoding:1 error:0];
    uint64_t v6 = *(void *)(a1 + 48);
    v7 = (void *)[v9 copy];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v8();
  }
}

@end