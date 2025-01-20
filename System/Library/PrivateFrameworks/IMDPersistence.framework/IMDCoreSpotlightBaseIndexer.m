@interface IMDCoreSpotlightBaseIndexer
+ (BOOL)cancelIndexingForItem:(id)a3;
+ (NSString)timingProfileKey;
+ (id)auxiliaryItemsForPrimaryAttributes:(id)a3 withItem:(id)a4 chat:(id)a5 isReindexing:(BOOL)a6 timingProfiler:(id)a7 rejectedItems:(id)a8;
+ (id)chatUniqueIdentifierKey;
+ (id)isBusinessChatCustomKey;
+ (id)isChatMutedCustomKey;
+ (id)isFromMeCustomKey;
+ (id)mentionedAddressesCustomKey;
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
+ (void)startTimingWithProfiler:(id)a3;
+ (void)stopTimingWithProfiler:(id)a3;
@end

@implementation IMDCoreSpotlightBaseIndexer

+ (BOOL)cancelIndexingForItem:(id)a3
{
  return 0;
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "IMDCoreSpotlightIndexer - Invalid to call IMDCoreSpotlightBaseIndexer directly, use subclass", v15, 2u);
    }
  }
}

+ (id)auxiliaryItemsForPrimaryAttributes:(id)a3 withItem:(id)a4 chat:(id)a5 isReindexing:(BOOL)a6 timingProfiler:(id)a7 rejectedItems:(id)a8
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)isFromMeCustomKey
{
  if (qword_1E9AF8018 != -1) {
    dispatch_once(&qword_1E9AF8018, &unk_1F084CDA0);
  }
  v2 = (void *)qword_1E9AF8010;
  return v2;
}

+ (id)isBusinessChatCustomKey
{
  if (qword_1EB5ABBB0 != -1) {
    dispatch_once(&qword_1EB5ABBB0, &unk_1F084C3A0);
  }
  v2 = (void *)qword_1EB5ABBA8;
  return v2;
}

+ (id)mentionedAddressesCustomKey
{
  if (qword_1EB5ABAD0 != -1) {
    dispatch_once(&qword_1EB5ABAD0, &unk_1F084C040);
  }
  v2 = (void *)qword_1EB5ABAC8;
  return v2;
}

+ (id)chatUniqueIdentifierKey
{
  if (qword_1EB5ABA08 != -1) {
    dispatch_once(&qword_1EB5ABA08, &unk_1F084C0A0);
  }
  v2 = (void *)qword_1EB5ABA00;
  return v2;
}

+ (id)isChatMutedCustomKey
{
  if (qword_1E9AF8000 != -1) {
    dispatch_once(&qword_1E9AF8000, &unk_1F084C4C8);
  }
  v2 = (void *)qword_1E9AF7FF8;
  return v2;
}

+ (NSString)timingProfileKey
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (void)startTimingWithProfiler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() timingProfileKey];
  [v3 startTimingForKey:v4];
}

+ (void)stopTimingWithProfiler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() timingProfileKey];
  [v3 stopTimingForKey:v4];
}

@end