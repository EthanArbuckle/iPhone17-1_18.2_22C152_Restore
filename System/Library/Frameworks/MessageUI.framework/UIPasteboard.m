@interface UIPasteboard
@end

@implementation UIPasteboard

void __94__UIPasteboard_MFAttachmentsPasteboardSupport__mf_addPasteboardRepresentationsForAttachments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [[MFAttachmentPasteboardRepresentation alloc] initWithMFAttachment:v5];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

@end