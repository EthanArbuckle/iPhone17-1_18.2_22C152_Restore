@interface IMDCoreSpotlightMessageHighlightIndexer
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
@end

@implementation IMDCoreSpotlightMessageHighlightIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = objc_alloc_init(IMDSharedWithYouMetadataManager);
  v15 = [(IMDSharedWithYouMetadataManager *)v14 updateAttributesWithSharedWithYouMetadata:v12 withItem:v10 chat:v11];
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [v15 identifier];
      int v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Message highlight indexer updating SearchableItem with identifier %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

@end