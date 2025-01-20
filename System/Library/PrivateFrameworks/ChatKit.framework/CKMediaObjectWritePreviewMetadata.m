@interface CKMediaObjectWritePreviewMetadata
@end

@implementation CKMediaObjectWritePreviewMetadata

void ___CKMediaObjectWritePreviewMetadata_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) fileURL];
  v4 = [*v2 previewMetadataFilenameExtension];
  v5 = IMAttachmentPreviewMetadataFileURL();

  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Persisting preview metadata to URL %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) writePreviewMetadata:*(void *)(a1 + 40) toURL:v5 error:0];
}

@end