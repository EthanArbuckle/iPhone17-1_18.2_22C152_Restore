@interface SWCollaborationMetadata
@end

@implementation SWCollaborationMetadata

void __62__SWCollaborationMetadata_NSItemProvider__processSigningQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SharedWithYouCore.SWPendingCollaborationProcessSigning", v2);
  v1 = (void *)processSigningQueue_internalQueue;
  processSigningQueue_internalQueue = (uint64_t)v0;
}

void __103__SWCollaborationMetadata_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSourceProcessData:a2];
  if ([*(id *)(a1 + 40) isEqualToString:@"com.apple.SharedWithYou.SWCollaborationMetadata"])
  {
    v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 32) requiringSecureCoding:1 error:0];
    uint64_t v4 = *(void *)(a1 + 48);
    id v7 = v3;
    v5 = (void *)[v3 copy];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
  else
  {
    if (![*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4F3BE60]]) {
      return;
    }
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F3BE08]) initWithMetadata:*(void *)(a1 + 32)];
    id v6 = (id)[v7 loadDataWithTypeIdentifier:*(void *)(a1 + 40) forItemProviderCompletionHandler:*(void *)(a1 + 48)];
  }
}

@end