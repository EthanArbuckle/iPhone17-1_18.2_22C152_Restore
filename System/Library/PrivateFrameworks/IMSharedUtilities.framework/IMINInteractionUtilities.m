@interface IMINInteractionUtilities
+ (id)sharedInstance;
- (CSSearchableIndex)searchableIndex;
- (IMINInteractionUtilities)init;
- (void)dealloc;
- (void)deleteInteractionsWithChatGUIDs:(id)a3;
- (void)deleteInteractionsWithMessageGUIDs:(id)a3;
- (void)setSearchableIndex:(id)a3;
@end

@implementation IMINInteractionUtilities

+ (id)sharedInstance
{
  if (qword_1EB4A66C8 != -1) {
    dispatch_once(&qword_1EB4A66C8, &unk_1EF2BF080);
  }
  return (id)qword_1EB4A6628;
}

- (IMINInteractionUtilities)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMINInteractionUtilities;
  v2 = [(IMINInteractionUtilities *)&v4 init];
  if (v2) {
    v2->_searchableIndex = (CSSearchableIndex *)objc_alloc_init((Class)MEMORY[0x1A6227910](@"CSSearchableIndex", @"CoreSpotlight"));
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMINInteractionUtilities;
  [(IMINInteractionUtilities *)&v3 dealloc];
}

- (void)deleteInteractionsWithChatGUIDs:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Calling API to delete INInteractions with chat guids %@", buf, 0xCu);
    }
  }
  v6 = [(IMINInteractionUtilities *)self searchableIndex];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A079ED70;
  v7[3] = &unk_1E5A100A8;
  v7[4] = a3;
  [(CSSearchableIndex *)v6 deleteInteractionsWithGroupIdentifiers:a3 bundleID:@"com.apple.MobileSMS" protectionClass:0 completionHandler:v7];
}

- (void)deleteInteractionsWithMessageGUIDs:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Calling API to delete INInteractions with message guids %@", buf, 0xCu);
    }
  }
  v6 = [(IMINInteractionUtilities *)self searchableIndex];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A079F01C;
  v7[3] = &unk_1E5A100A8;
  v7[4] = a3;
  [(CSSearchableIndex *)v6 deleteInteractionsWithIdentifiers:a3 bundleID:@"com.apple.MobileSMS" protectionClass:0 completionHandler:v7];
}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void)setSearchableIndex:(id)a3
{
}

@end