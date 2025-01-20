@interface EMSmartMailbox
+ (EMMailboxScope)em_defaultExcludedMailboxesScope;
+ (EMMailboxScope)em_inboxMailboxScope;
+ (EMSmartMailbox)em_VIPMailbox;
+ (EMSmartMailbox)em_flaggedMailbox;
+ (EMSmartMailbox)em_followUpMailbox;
+ (EMSmartMailbox)em_readLaterMailbox;
+ (id)blueMailboxWithMailboxScope:(id)a3;
+ (id)coreSpotlightMailboxWithName:(id)a3 queryString:(id)a4;
+ (id)em_scopedSendLaterMailboxWithMailboxURL:(id)a3;
+ (id)flaggedMailboxWithMailboxScope:(id)a3;
+ (id)followUpMailboxWithMailboxScope:(id)a3;
+ (id)grayMailboxWithMailboxScope:(id)a3;
+ (id)greenMailboxWithMailboxScope:(id)a3;
+ (id)hasAttachmentsMailboxWithMailboxScope:(id)a3;
+ (id)includesMeMailboxWithMailboxScope:(id)a3;
+ (id)muteThreadsMailboxWithMailboxScope:(id)a3;
+ (id)notifyThreadsMailboxWithMailboxScope:(id)a3;
+ (id)orangeMailboxWithMailboxScope:(id)a3;
+ (id)purpleMailboxWithMailboxScope:(id)a3;
+ (id)readLaterMailboxWithMailboxScope:(id)a3;
+ (id)redMailboxWithMailboxScope:(id)a3;
+ (id)sendLaterMailboxWithMailboxScope:(id)a3;
+ (id)todayMailboxWithMailboxScope:(id)a3;
+ (id)unifiedMailboxOfType:(int64_t)a3 name:(id)a4;
+ (id)unifiedMailboxOfType:(int64_t)a3 name:(id)a4 additionalPredicate:(id)a5;
+ (id)unreadMailboxWithMailboxScope:(id)a3;
+ (id)unsubscribeMailboxWithMailboxScope:(id)a3;
+ (id)vipMailboxWithMailboxScope:(id)a3;
+ (id)vipMailboxWithName:(id)a3 additionalPredicate:(id)a4;
+ (id)yellowMailboxWithMailboxScope:(id)a3;
- (BOOL)_shouldArchiveByDefault;
- (BOOL)isCoreSpotlightMailbox;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSendLaterMailbox;
- (BOOL)isSmartMailbox;
- (BOOL)supportsSelectAll;
- (EMMailboxScope)mailboxScope;
- (EMSmartMailbox)initWithType:(int64_t)a3 mailboxType:(int64_t)a4 name:(id)a5 mailboxScope:(id)a6 predicateGenerator:(id)a7;
- (id)ef_publicDescription;
- (id)makePredicate;
- (int64_t)smartMailboxType;
- (unint64_t)hash;
@end

@implementation EMSmartMailbox

+ (EMMailboxScope)em_defaultExcludedMailboxesScope
{
  v2 = +[EMMailboxScope mailboxScopeForMailboxTypes:&unk_1F1A62040 forExclusion:1];
  return (EMMailboxScope *)v2;
}

+ (id)yellowMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__EMSmartMailbox_yellowMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:1 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (EMSmartMailbox)em_flaggedMailbox
{
  v2 = objc_msgSend(a1, "em_defaultExcludedMailboxesScope");
  id v3 = +[EMSmartMailbox flaggedMailboxWithMailboxScope:v2];

  return (EMSmartMailbox *)v3;
}

+ (EMSmartMailbox)em_readLaterMailbox
{
  v2 = objc_msgSend(a1, "em_defaultExcludedMailboxesScope");
  id v3 = +[EMSmartMailbox readLaterMailboxWithMailboxScope:v2];

  return (EMSmartMailbox *)v3;
}

+ (id)readLaterMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__EMSmartMailbox_readLaterMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:9 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)flaggedMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__EMSmartMailbox_flaggedMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:1 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)notifyThreadsMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__EMSmartMailbox_notifyThreadsMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:5 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)hasAttachmentsMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__EMSmartMailbox_hasAttachmentsMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:4 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)includesMeMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__EMSmartMailbox_includesMeMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:3 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

- (EMSmartMailbox)initWithType:(int64_t)a3 mailboxType:(int64_t)a4 name:(id)a5 mailboxScope:(id)a6 predicateGenerator:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = objc_alloc_init(EMMailboxObjectID);
  v21.receiver = self;
  v21.super_class = (Class)EMSmartMailbox;
  v16 = [(EMMailbox *)&v21 initWithObjectID:v15 name:v12 accountIdentifier:0 type:a4 builder:&__block_literal_global_52];
  v17 = v16;
  if (v16)
  {
    v16->_smartMailboxType = a3;
    objc_storeStrong((id *)&v16->_mailboxScope, a6);
    uint64_t v18 = [v14 copy];
    id predicateGenerator = v17->_predicateGenerator;
    v17->_id predicateGenerator = (id)v18;
  }
  return v17;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (id)ef_publicDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EMMailbox *)self name];
  v6 = [v3 stringWithFormat:@"<%@: %p> Name:%@", v4, self, v5];

  return v6;
}

+ (EMSmartMailbox)em_VIPMailbox
{
  v2 = objc_msgSend(a1, "em_inboxMailboxScope");
  id v3 = +[EMSmartMailbox vipMailboxWithMailboxScope:v2];

  return (EMSmartMailbox *)v3;
}

+ (EMMailboxScope)em_inboxMailboxScope
{
  return (EMMailboxScope *)+[EMMailboxScope mailboxScopeForMailboxType:7 forExclusion:0];
}

+ (id)vipMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__EMSmartMailbox_vipMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:0 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (EMSmartMailbox)em_followUpMailbox
{
  v2 = +[EMMailboxScope mailboxScopeForMailboxTypes:&unk_1F1A62058 forExclusion:1];
  id v3 = +[EMSmartMailbox followUpMailboxWithMailboxScope:v2];

  return (EMSmartMailbox *)v3;
}

+ (id)followUpMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__EMSmartMailbox_followUpMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:10 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)em_scopedSendLaterMailboxWithMailboxURL:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [[EMMailboxObjectID alloc] initWithURL:v3];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6 = +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v5 forExclusion:0];

  id v7 = +[EMSmartMailbox sendLaterMailboxWithMailboxScope:v6];

  return v7;
}

+ (id)sendLaterMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__EMSmartMailbox_sendLaterMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:11 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)unreadMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__EMSmartMailbox_unreadMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:2 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)todayMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__EMSmartMailbox_todayMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:6 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)redMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__EMSmartMailbox_redMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:1 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)purpleMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__EMSmartMailbox_purpleMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:1 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)orangeMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__EMSmartMailbox_orangeMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:1 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)muteThreadsMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__EMSmartMailbox_muteThreadsMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:7 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)greenMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__EMSmartMailbox_greenMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:1 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)grayMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__EMSmartMailbox_grayMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:1 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

+ (id)blueMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__EMSmartMailbox_blueMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:1 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

id __45__EMSmartMailbox_vipMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForIsVIP:1];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __49__EMSmartMailbox_flaggedMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForFlaggedMessages];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __48__EMSmartMailbox_orangeMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForFlagColor:1];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __45__EMSmartMailbox_redMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForFlagColor:0];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __48__EMSmartMailbox_purpleMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForFlagColor:5];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __46__EMSmartMailbox_blueMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForFlagColor:4];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __48__EMSmartMailbox_yellowMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForFlagColor:2];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __47__EMSmartMailbox_greenMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForFlagColor:3];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __46__EMSmartMailbox_grayMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForFlagColor:6];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __48__EMSmartMailbox_unreadMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForUnreadMessages];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __56__EMSmartMailbox_hasAttachmentsMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForMessagesWithAttachments];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __55__EMSmartMailbox_notifyThreadsMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForNotifyMessages];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __47__EMSmartMailbox_todayMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForTodayMessages];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __53__EMSmartMailbox_muteThreadsMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForMuteMessages];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __52__EMSmartMailbox_includesMeMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForIncludesMeMessages];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __51__EMSmartMailbox_readLaterMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForReadLaterSmartMailbox];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __50__EMSmartMailbox_followUpMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForMessagesWithUnfiredFollowUp];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

id __51__EMSmartMailbox_sendLaterMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForSendLaterMessages];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

+ (id)unsubscribeMailboxWithMailboxScope:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _EFLocalizedString();
  id v5 = +[EMMailboxScope allMailboxesScope];

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v3];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__EMSmartMailbox_unsubscribeMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E63E2CF0;
  id v7 = v6;
  id v12 = v7;
  v8 = (void *)MEMORY[0x1C18A2160](v11);
  v9 = [[EMSmartMailbox alloc] initWithType:12 mailboxType:0 name:v4 mailboxScope:v3 predicateGenerator:v8];

  return v9;
}

id __53__EMSmartMailbox_unsubscribeMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForUnsubscribableMessages];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

+ (id)unifiedMailboxOfType:(int64_t)a3 name:(id)a4
{
  uint64_t v4 = [a1 unifiedMailboxOfType:a3 name:a4 additionalPredicate:0];
  return v4;
}

+ (id)unifiedMailboxOfType:(int64_t)a3 name:(id)a4 additionalPredicate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((unint64_t)(a3 - 1) < 5 || a3 == 7)
  {
    v9 = +[EMMailboxScope mailboxScopeForMailboxType:a3 forExclusion:0];
    v10 = [EMSmartMailbox alloc];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__EMSmartMailbox_unifiedMailboxOfType_name_additionalPredicate___block_invoke;
    v13[3] = &unk_1E63E6700;
    int64_t v15 = a3;
    id v14 = v8;
    v11 = [(EMSmartMailbox *)v10 initWithType:8 mailboxType:a3 name:v7 mailboxScope:v9 predicateGenerator:v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __64__EMSmartMailbox_unifiedMailboxOfType_name_additionalPredicate___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForMessagesInMailboxWithType:*(void *)(a1 + 40)];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

+ (id)vipMailboxWithName:(id)a3 additionalPredicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[EMMailboxScope mailboxScopeForMailboxType:7 forExclusion:0];
  id v8 = [EMSmartMailbox alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__EMSmartMailbox_vipMailboxWithName_additionalPredicate___block_invoke;
  v12[3] = &unk_1E63E2CF0;
  id v9 = v6;
  id v13 = v9;
  v10 = [(EMSmartMailbox *)v8 initWithType:0 mailboxType:0 name:v5 mailboxScope:v7 predicateGenerator:v12];

  return v10;
}

id __57__EMSmartMailbox_vipMailboxWithName_additionalPredicate___block_invoke(uint64_t a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EMMessageListItemPredicates predicateForMessagesInMailboxWithType:7];
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = v2;
    v9[1] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

    id v3 = (void *)v7;
  }
  return v3;
}

+ (id)coreSpotlightMailboxWithName:(id)a3 queryString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[EMMailboxScope allMailboxesScope];
  id v8 = [EMSmartMailbox alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__EMSmartMailbox_coreSpotlightMailboxWithName_queryString___block_invoke;
  v12[3] = &unk_1E63E2CF0;
  id v9 = v6;
  id v13 = v9;
  v10 = [(EMSmartMailbox *)v8 initWithType:13 mailboxType:0 name:v5 mailboxScope:v7 predicateGenerator:v12];

  return v10;
}

id __59__EMSmartMailbox_coreSpotlightMailboxWithName_queryString___block_invoke(uint64_t a1)
{
  return +[EMMessageListItemSearchPredicates spotlightQueryPredicateForString:*(void *)(a1 + 32)];
}

- (BOOL)isSmartMailbox
{
  return 1;
}

- (BOOL)isCoreSpotlightMailbox
{
  return [(EMSmartMailbox *)self smartMailboxType] == 13;
}

- (BOOL)isSendLaterMailbox
{
  return [(EMSmartMailbox *)self smartMailboxType] == 11;
}

- (BOOL)supportsSelectAll
{
  return [(EMSmartMailbox *)self smartMailboxType] == 8;
}

- (id)makePredicate
{
  return (id)(*((uint64_t (**)(void))self->_predicateGenerator + 2))();
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EMSmartMailbox *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if ([(EMSmartMailbox *)v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    int64_t v6 = [(EMSmartMailbox *)self smartMailboxType];
    if (v6 == [(EMSmartMailbox *)v5 smartMailboxType]
      && (int64_t v7 = [(EMMailbox *)self type], v7 == [(EMMailbox *)v5 type]))
    {
      id v8 = [(EMMailbox *)self name];
      id v9 = [(EMMailbox *)v5 name];
      if (objc_msgSend(v8, "ef_caseInsensitiveIsEqualToString:", v9))
      {
        v10 = [(EMSmartMailbox *)self mailboxScope];
        v11 = [(EMSmartMailbox *)v5 mailboxScope];
        char v12 = EFObjectsAreEqual();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  int64_t v3 = [(EMSmartMailbox *)self smartMailboxType];
  int64_t v4 = [(EMMailbox *)self type];
  id v5 = [(EMMailbox *)self name];
  int64_t v6 = [v5 lowercaseString];
  unint64_t v7 = 33 * (33 * v3 + v4) + [v6 hash] + 35937;

  return v7;
}

- (BOOL)_shouldArchiveByDefault
{
  uint64_t v2 = [(EMMailbox *)self repository];
  int64_t v3 = [v2 accountRepository];
  int64_t v4 = [v3 receivingAccounts];

  LOBYTE(v2) = objc_msgSend(v4, "ef_all:", &__block_literal_global_102);
  return (char)v2;
}

uint64_t __41__EMSmartMailbox__shouldArchiveByDefault__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shouldArchiveByDefault];
}

- (int64_t)smartMailboxType
{
  return self->_smartMailboxType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong(&self->_predicateGenerator, 0);
}

@end