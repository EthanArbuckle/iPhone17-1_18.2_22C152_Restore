@interface CKStarkConversationController
- (CKStarkConversationController)initWithInterfaceController:(id)a3;
- (CNAvatarImageRenderer)avatarImageRenderer;
- (CPInterfaceController)interfaceController;
- (CPListTemplate)conversationListTemplate;
- (CPSessionConfiguration)sessionConfiguration;
- (NSDateFormatter)dateFormatter;
- (NSDateFormatter)timeFormatter;
- (id)_filterStewieConversation:(id)a3;
- (void)_resortAndReloadData;
- (void)conversationListDidChange:(id)a3;
- (void)sessionConfiguration:(id)a3 contentStyleChanged:(unint64_t)a4;
- (void)setAvatarImageRenderer:(id)a3;
- (void)setConversationListTemplate:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setInterfaceController:(id)a3;
- (void)setSessionConfiguration:(id)a3;
- (void)setTimeFormatter:(id)a3;
- (void)templateWillAppear:(id)a3 animated:(BOOL)a4;
@end

@implementation CKStarkConversationController

- (CKStarkConversationController)initWithInterfaceController:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKStarkConversationController;
  v6 = [(CKStarkConversationController *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interfaceController, a3);
    [(CPInterfaceController *)v7->_interfaceController setDelegate:v7];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F19200]) initWithDelegate:v7];
    sessionConfiguration = v7->_sessionConfiguration;
    v7->_sessionConfiguration = (CPSessionConfiguration *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F191C8]);
    v11 = CKFrameworkBundle();
    v12 = [v11 localizedStringForKey:@"MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v13 = [v10 initWithTitle:v12 sections:MEMORY[0x1E4F1CBF0]];
    conversationListTemplate = v7->_conversationListTemplate;
    v7->_conversationListTemplate = (CPListTemplate *)v13;

    id v15 = objc_alloc_init(MEMORY[0x1E4F191D0]);
    [v15 setButtonStyle:1];
    v16 = v7->_conversationListTemplate;
    v27[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [(CPListTemplate *)v16 setTrailingNavigationBarButtons:v17];

    [(CPInterfaceController *)v7->_interfaceController setRootTemplate:v7->_conversationListTemplate animated:0];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v7 selector:sel_conversationListDidChange_ name:@"CKConversationListConversationLeftNotification" object:0];
    [v18 addObserver:v7 selector:sel_conversationListDidChange_ name:@"CKConversationListFinishedLoadingNotification" object:0];
    [v18 addObserver:v7 selector:sel_conversationListDidChange_ name:@"CKConversationListChangedNotification" object:0];
    [v18 addObserver:v7 selector:sel_conversationListDidChange_ name:*MEMORY[0x1E4F6B898] object:0];
    [v18 addObserver:v7 selector:sel_conversationListDidChange_ name:*MEMORY[0x1E4F6B8D8] object:0];
    [v18 addObserver:v7 selector:sel_conversationListDidChange_ name:*MEMORY[0x1E4F6BA90] object:0];
    [v18 addObserver:v7 selector:sel_conversationListDidChange_ name:CKConversationListContactPhotosEnabledNotification object:0];
    id v19 = objc_alloc(MEMORY[0x1E4F1BB20]);
    v20 = (void *)MEMORY[0x1E4F1BB28];
    v21 = +[CKUIBehavior sharedBehaviors];
    v22 = objc_msgSend(v20, "defaultSettingsWithCacheSize:", objc_msgSend(v21, "contactsSettingsCacheSize"));
    uint64_t v23 = [v19 initWithSettings:v22];

    avatarImageRenderer = v7->_avatarImageRenderer;
    v7->_avatarImageRenderer = (CNAvatarImageRenderer *)v23;
  }
  return v7;
}

- (void)templateWillAppear:(id)a3 animated:(BOOL)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[CKStarkConversationController templateWillAppear:animated:]";
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Resorting and reloading conversation table for: %s", (uint8_t *)&v7, 0xCu);
    }
  }
  [(CKStarkConversationController *)self _resortAndReloadData];
}

- (void)conversationListDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [v4 name];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Resorting and reloading conversation table for notification: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(CKStarkConversationController *)self _resortAndReloadData];
}

- (void)sessionConfiguration:(id)a3 contentStyleChanged:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[CKStarkConversationController sessionConfiguration:contentStyleChanged:]";
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Resorting and reloading conversation table for: %s", (uint8_t *)&v7, 0xCu);
    }
  }
  [(CKStarkConversationController *)self _resortAndReloadData];
}

- (void)_resortAndReloadData
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Resorting and reloading conversation table", buf, 2u);
    }
  }
  id v4 = [(CKStarkConversationController *)self timeFormatter];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v6 setDateStyle:0];
    [v6 setTimeStyle:1];
    [v7 setDateStyle:1];
    [v7 setTimeStyle:0];
    uint64_t v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v7 setLocale:v8];

    uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v6 setLocale:v9];

    [v7 setDoesRelativeDateFormatting:1];
    [(CKStarkConversationController *)self setDateFormatter:v7];
    [(CKStarkConversationController *)self setTimeFormatter:v6];
  }
  v28 = +[CKConversationList sharedConversationList];
  [v28 resort];
  [v28 updateConversationListsAndSortIfEnabled];
  id v10 = [v28 conversationsForFilterMode:CKMessageUnknownFilteringEnabled() != 0];
  v11 = [MEMORY[0x1E4F6BC48] sharedInstance];
  char v12 = [v11 isStewieActive];

  if (v12)
  {
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v14 = [(CKStarkConversationController *)self _filterStewieConversation:v10];

    uint64_t v13 = (void *)v14;
  }
  v29 = v13;
  unint64_t v15 = [v13 count];
  if (v15 >= 0xA) {
    uint64_t v16 = 10;
  }
  else {
    uint64_t v16 = v15;
  }
  v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
  v18 = [(CPInterfaceController *)self->_interfaceController carTraitCollection];
  if (v16)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      v20 = [v29 objectAtIndexedSubscript:i];
      v21 = [(CKStarkConversationController *)self dateFormatter];
      v22 = [(CKStarkConversationController *)self timeFormatter];
      uint64_t v23 = [(CKStarkConversationController *)self avatarImageRenderer];
      v24 = [v20 carPlayMessageListItemWithTraitCollection:v18 dateFormatter:v21 timeFormatter:v22 avatarImageRenderer:v23];

      [v17 addObject:v24];
    }
  }
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F191C0]) initWithItems:v17];
  objc_super v26 = [(CKStarkConversationController *)self conversationListTemplate];
  v31[0] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [v26 updateSections:v27];
}

- (id)_filterStewieConversation:(id)a3
{
  return (id)objc_msgSend(a3, "__imArrayByFilteringWithBlock:", &__block_literal_global_35);
}

uint64_t __59__CKStarkConversationController__filterStewieConversation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isStewieConversation] ^ 1;
}

- (CPInterfaceController)interfaceController
{
  return self->_interfaceController;
}

- (void)setInterfaceController:(id)a3
{
}

- (CPListTemplate)conversationListTemplate
{
  return self->_conversationListTemplate;
}

- (void)setConversationListTemplate:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)setTimeFormatter:(id)a3
{
}

- (CPSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (CNAvatarImageRenderer)avatarImageRenderer
{
  return self->_avatarImageRenderer;
}

- (void)setAvatarImageRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_conversationListTemplate, 0);

  objc_storeStrong((id *)&self->_interfaceController, 0);
}

@end