@interface CKAlertSuppressionContextHelper
+ (id)alertSuppressionContextsForVisibleChatControllerWithConversation:(id)a3;
@end

@implementation CKAlertSuppressionContextHelper

+ (id)alertSuppressionContextsForVisibleChatControllerWithConversation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [v3 chat];
  v6 = [v5 persistentID];
  if (v6) {
    [v4 addObject:v6];
  }
  v7 = [v5 personCentricID];
  if (v7) {
    [v4 addObject:v7];
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Adding alert suppression contexts %@ for visible chat %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4;
}

@end