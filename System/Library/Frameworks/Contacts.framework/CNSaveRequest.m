@interface CNSaveRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)canIgnoreError:(id)a3;
- (BOOL)hasConflictingSaveOperations;
- (BOOL)ignoresContactProviderRestrictions;
- (BOOL)ignoresGuardianRestrictions;
- (BOOL)shouldRefetchContacts;
- (BOOL)suppressChangeNotifications;
- (BOOL)unsafeApplyChangesOnly;
- (CNSaveRequest)init;
- (CNSaveRequest)initWithCoder:(id)a3;
- (CNSaveRequestDelegate)delegate;
- (NSArray)addedAccounts;
- (NSArray)allAccountIdentifierStrings;
- (NSArray)allContactIdentifiers;
- (NSArray)allContacts;
- (NSArray)allContainers;
- (NSArray)allGroupIdentifiers;
- (NSArray)allGroups;
- (NSArray)contactChangeRequests;
- (NSArray)deletedContacts;
- (NSArray)deletedContainers;
- (NSArray)deletedGroups;
- (NSArray)linkRequests;
- (NSArray)removedAccounts;
- (NSArray)updatedContacts;
- (NSArray)updatedContainers;
- (NSArray)updatedGroups;
- (NSDictionary)addedAccountContainersByParentContainerIdentifier;
- (NSDictionary)addedContactsByContainerIdentifier;
- (NSDictionary)addedContainersByParentContainerIdentifier;
- (NSDictionary)addedGroupsByContainerIdentifier;
- (NSDictionary)addedMembersByGroupIdentifier;
- (NSDictionary)addedSubgroupsByGroupIdentifier;
- (NSDictionary)defaultAccountContainersByAccountIdentifier;
- (NSDictionary)deletedContactsByIdentifier;
- (NSDictionary)movedContainersByParentContainerIdentifier;
- (NSDictionary)removedMembersByGroupIdentifier;
- (NSDictionary)removedSubgroupsByGroupIdentifier;
- (NSString)changeHistoryClientIdentifier;
- (NSString)meCardIdentifier;
- (NSString)saveRequestIdentifier;
- (NSString)storeIdentifier;
- (NSString)transactionAuthor;
- (id)_dictionaryOfArraysFromDictionaryOfDictionaries:(id)a3;
- (id)allAccountIdentifiers;
- (id)allContainerIdentifierStrings:(BOOL *)a3;
- (id)allContainerIdentifiers:(BOOL *)a3;
- (id)distinctDeletedContacts;
- (id)flattenedDictionaryForDictionaryOfTuples:(id)a3;
- (id)groupWithAddedMemberForGroupIdentifier:(id)a3;
- (id)groupWithAddedSubgroupForGroupIdentifier:(id)a3;
- (id)groupWithRemovedMemberForGroupIdentifier:(id)a3;
- (id)groupWithRemovedSubgroupForGroupIdentifier:(id)a3;
- (void)_insertContact:(id)a3 intoDictionary:(id)a4 complementDictionary:(id)a5;
- (void)acceptChangeHistoryEventVisitor:(id)a3;
- (void)addAccount:(id)a3;
- (void)addContact:(CNMutableContact *)contact toContainerWithIdentifier:(NSString *)identifier;
- (void)addContainer:(id)a3 toAccountWithIdentifier:(id)a4;
- (void)addContainer:(id)a3 toContainerWithIdentifier:(id)a4;
- (void)addDistinctObject:(id)a3 intoArray:(id)a4;
- (void)addGroup:(CNMutableGroup *)group toContainerWithIdentifier:(NSString *)identifier;
- (void)addMember:(CNContact *)contact toGroup:(CNGroup *)group;
- (void)addSubgroup:(CNGroup *)subgroup toGroup:(CNGroup *)group;
- (void)deleteContact:(CNMutableContact *)contact;
- (void)deleteContainer:(id)a3;
- (void)deleteGroup:(CNMutableGroup *)group;
- (void)encodeWithCoder:(id)a3;
- (void)linkContact:(id)a3 toContact:(id)a4;
- (void)moveContainer:(id)a3 toContainerWithIdentifier:(id)a4;
- (void)preferLinkedContactForImage:(id)a3 inUnifiedContact:(id)a4;
- (void)preferLinkedContactForName:(id)a3 inUnifiedContact:(id)a4;
- (void)removeAccount:(id)a3;
- (void)removeMember:(CNContact *)contact fromGroup:(CNGroup *)group;
- (void)removeSubgroup:(CNGroup *)subgroup fromGroup:(CNGroup *)group;
- (void)setChangeHistoryClientIdentifier:(id)a3;
- (void)setContainer:(id)a3 asDefaultContainerOfAccountWithIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIgnoresContactProviderRestrictions:(BOOL)a3;
- (void)setIgnoresGuardianRestrictions:(BOOL)a3;
- (void)setLinkIdentifier:(id)a3 forContact:(id)a4;
- (void)setMeCardIdentifier:(id)a3;
- (void)setShouldRefetchContacts:(BOOL)shouldRefetchContacts;
- (void)setSuppressChangeNotifications:(BOOL)a3;
- (void)setTransactionAuthor:(NSString *)transactionAuthor;
- (void)setUnsafeApplyChangesOnly:(BOOL)a3;
- (void)unlinkContact:(id)a3;
- (void)updateContact:(CNMutableContact *)contact;
- (void)updateContainer:(id)a3;
- (void)updateGroup:(CNMutableGroup *)group;
- (void)withDifferentMeCard:(id)a3;
- (void)withEachAddedContact:(id)a3;
- (void)withEachAddedGroup:(id)a3;
- (void)withEachContactPreferredForImage:(id)a3;
- (void)withEachContactPreferredForName:(id)a3;
- (void)withEachDeletedContact:(id)a3;
- (void)withEachDeletedGroup:(id)a3;
- (void)withEachLinkedContact:(id)a3;
- (void)withEachMemberAddedToGroup:(id)a3;
- (void)withEachMemberRemovedFromGroup:(id)a3;
- (void)withEachSubgroupAddedToGroup:(id)a3;
- (void)withEachSubgroupRemovedFromGroup:(id)a3;
- (void)withEachUnlinkedContact:(id)a3;
- (void)withEachUpdatedContact:(id)a3;
- (void)withEachUpdatedGroup:(id)a3;
@end

@implementation CNSaveRequest

- (void)acceptChangeHistoryEventVisitor:(id)a3
{
  id v4 = a3;
  v7 = objc_alloc_init(CNChangeHistoryEventFactory);
  v5 = [[CNSaveRequestVisitationTask alloc] initWithSaveRequest:self visitor:v4 factory:v7];

  id v6 = [(CNSaveRequestVisitationTask *)v5 run:0];
}

- (void)withEachAddedContact:(id)a3
{
  id v4 = a3;
  addedContactsByIdentifier = self->_addedContactsByIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CNSaveRequest_Visitation__withEachAddedContact___block_invoke;
  v7[3] = &unk_1E56B7A88;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)addedContactsByIdentifier _cn_each:v7];
}

void __50__CNSaveRequest_Visitation__withEachAddedContact___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = [v4 firstObject];
  uint64_t v5 = *MEMORY[0x1E4F5A2B0];
  id v6 = [v4 lastObject];

  v7 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachUpdatedContact:(id)a3
{
  id v4 = a3;
  updatedContacts = self->_updatedContacts;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CNSaveRequest_Visitation__withEachUpdatedContact___block_invoke;
  v7[3] = &unk_1E56B7AB0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)updatedContacts _cn_each:v7];
}

uint64_t __52__CNSaveRequest_Visitation__withEachUpdatedContact___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachDeletedContact:(id)a3
{
  id v4 = a3;
  deletedContactsByIdentifier = self->_deletedContactsByIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CNSaveRequest_Visitation__withEachDeletedContact___block_invoke;
  v7[3] = &unk_1E56B7AD8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)deletedContactsByIdentifier _cn_each:v7];
}

uint64_t __52__CNSaveRequest_Visitation__withEachDeletedContact___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachAddedGroup:(id)a3
{
  id v4 = a3;
  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CNSaveRequest_Visitation__withEachAddedGroup___block_invoke;
  v7[3] = &unk_1E56B7A88;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)addedGroupsByIdentifier _cn_each:v7];
}

void __48__CNSaveRequest_Visitation__withEachAddedGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = [v4 firstObject];
  uint64_t v5 = *MEMORY[0x1E4F5A2B0];
  id v6 = [v4 lastObject];

  v7 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachUpdatedGroup:(id)a3
{
  id v4 = a3;
  updatedGroups = self->_updatedGroups;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CNSaveRequest_Visitation__withEachUpdatedGroup___block_invoke;
  v7[3] = &unk_1E56B7B00;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)updatedGroups _cn_each:v7];
}

uint64_t __50__CNSaveRequest_Visitation__withEachUpdatedGroup___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachDeletedGroup:(id)a3
{
  id v4 = a3;
  deletedGroupsByIdentifier = self->_deletedGroupsByIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CNSaveRequest_Visitation__withEachDeletedGroup___block_invoke;
  v7[3] = &unk_1E56B7AD8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)deletedGroupsByIdentifier _cn_each:v7];
}

uint64_t __50__CNSaveRequest_Visitation__withEachDeletedGroup___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachMemberAddedToGroup:(id)a3
{
  id v4 = a3;
  addedMembersByGroupIdentifier = self->_addedMembersByGroupIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CNSaveRequest_Visitation__withEachMemberAddedToGroup___block_invoke;
  v7[3] = &unk_1E56B7B50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)addedMembersByGroupIdentifier _cn_each:v7];
}

void __56__CNSaveRequest_Visitation__withEachMemberAddedToGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 208);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__CNSaveRequest_Visitation__withEachMemberAddedToGroup___block_invoke_2;
  v10[3] = &unk_1E56B7B28;
  id v8 = *(id *)(a1 + 40);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  objc_msgSend(v6, "_cn_each:", v10);
}

uint64_t __56__CNSaveRequest_Visitation__withEachMemberAddedToGroup___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, *(void *)(a1 + 32));
}

- (void)withEachMemberRemovedFromGroup:(id)a3
{
  id v4 = a3;
  removedMembersByGroupIdentifier = self->_removedMembersByGroupIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CNSaveRequest_Visitation__withEachMemberRemovedFromGroup___block_invoke;
  v7[3] = &unk_1E56B7B50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)removedMembersByGroupIdentifier _cn_each:v7];
}

void __60__CNSaveRequest_Visitation__withEachMemberRemovedFromGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 208);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__CNSaveRequest_Visitation__withEachMemberRemovedFromGroup___block_invoke_2;
  v10[3] = &unk_1E56B7B28;
  id v8 = *(id *)(a1 + 40);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  objc_msgSend(v6, "_cn_each:", v10);
}

uint64_t __60__CNSaveRequest_Visitation__withEachMemberRemovedFromGroup___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, *(void *)(a1 + 32));
}

- (void)withEachSubgroupAddedToGroup:(id)a3
{
  id v4 = a3;
  addedSubgroupsByGroupIdentifier = self->_addedSubgroupsByGroupIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CNSaveRequest_Visitation__withEachSubgroupAddedToGroup___block_invoke;
  v7[3] = &unk_1E56B7B50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)addedSubgroupsByGroupIdentifier _cn_each:v7];
}

void __58__CNSaveRequest_Visitation__withEachSubgroupAddedToGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 208);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CNSaveRequest_Visitation__withEachSubgroupAddedToGroup___block_invoke_2;
  v10[3] = &unk_1E56B7B78;
  id v8 = *(id *)(a1 + 40);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  objc_msgSend(v6, "_cn_each:", v10);
}

uint64_t __58__CNSaveRequest_Visitation__withEachSubgroupAddedToGroup___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, *(void *)(a1 + 32));
}

- (void)withEachSubgroupRemovedFromGroup:(id)a3
{
  id v4 = a3;
  removedSubgroupsByGroupIdentifier = self->_removedSubgroupsByGroupIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CNSaveRequest_Visitation__withEachSubgroupRemovedFromGroup___block_invoke;
  v7[3] = &unk_1E56B7B50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)removedSubgroupsByGroupIdentifier _cn_each:v7];
}

void __62__CNSaveRequest_Visitation__withEachSubgroupRemovedFromGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 208);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CNSaveRequest_Visitation__withEachSubgroupRemovedFromGroup___block_invoke_2;
  v10[3] = &unk_1E56B7B78;
  id v8 = *(id *)(a1 + 40);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  objc_msgSend(v6, "_cn_each:", v10);
}

uint64_t __62__CNSaveRequest_Visitation__withEachSubgroupRemovedFromGroup___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, *(void *)(a1 + 32));
}

- (void)withEachLinkedContact:(id)a3
{
  id v4 = a3;
  linkRequests = self->_linkRequests;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CNSaveRequest_Visitation__withEachLinkedContact___block_invoke;
  v7[3] = &unk_1E56B7BA0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)linkRequests _cn_each:v7];
}

void __51__CNSaveRequest_Visitation__withEachLinkedContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 first];
  id v4 = [v3 second];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachUnlinkedContact:(id)a3
{
  id v4 = a3;
  unlinkRequests = self->_unlinkRequests;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CNSaveRequest_Visitation__withEachUnlinkedContact___block_invoke;
  v7[3] = &unk_1E56B7AB0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)unlinkRequests _cn_each:v7];
}

uint64_t __53__CNSaveRequest_Visitation__withEachUnlinkedContact___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachContactPreferredForName:(id)a3
{
  id v4 = a3;
  preferredForNameRequests = self->_preferredForNameRequests;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CNSaveRequest_Visitation__withEachContactPreferredForName___block_invoke;
  v7[3] = &unk_1E56B7BA0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)preferredForNameRequests _cn_each:v7];
}

void __61__CNSaveRequest_Visitation__withEachContactPreferredForName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 first];
  id v4 = [v3 second];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withEachContactPreferredForImage:(id)a3
{
  id v4 = a3;
  preferredForImageRequests = self->_preferredForImageRequests;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CNSaveRequest_Visitation__withEachContactPreferredForImage___block_invoke;
  v7[3] = &unk_1E56B7BA0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)preferredForImageRequests _cn_each:v7];
}

void __62__CNSaveRequest_Visitation__withEachContactPreferredForImage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 first];
  id v4 = [v3 second];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withDifferentMeCard:(id)a3
{
  id v4 = (void (**)(id, NSString *))a3;
  meCardIdentifier = self->_meCardIdentifier;
  if (meCardIdentifier)
  {
    id v8 = v4;
    id v6 = [MEMORY[0x1E4F1CA98] null];

    if (meCardIdentifier == v6
      || [(NSString *)self->_meCardIdentifier isEqualToString:&stru_1EE052B80])
    {
      v7 = 0;
    }
    else
    {
      v7 = self->_meCardIdentifier;
    }
    v8[2](v8, v7);
    id v4 = v8;
  }
}

- (CNSaveRequest)init
{
  v57.receiver = self;
  v57.super_class = (Class)CNSaveRequest;
  v2 = [(CNSaveRequest *)&v57 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F29128] UUID];
    id v4 = [v3 UUIDString];
    uint64_t v5 = [v4 copy];
    saveRequestIdentifier = v2->_saveRequestIdentifier;
    v2->_saveRequestIdentifier = (NSString *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addedContactsByIdentifier = v2->_addedContactsByIdentifier;
    v2->_addedContactsByIdentifier = v7;

    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedContacts = v2->_updatedContacts;
    v2->_updatedContacts = v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deletedContactsByIdentifier = v2->_deletedContactsByIdentifier;
    v2->_deletedContactsByIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addedGroupsByIdentifier = v2->_addedGroupsByIdentifier;
    v2->_addedGroupsByIdentifier = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedGroups = v2->_updatedGroups;
    v2->_updatedGroups = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deletedGroupsByIdentifier = v2->_deletedGroupsByIdentifier;
    v2->_deletedGroupsByIdentifier = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addedMembersByGroupIdentifier = v2->_addedMembersByGroupIdentifier;
    v2->_addedMembersByGroupIdentifier = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    removedMembersByGroupIdentifier = v2->_removedMembersByGroupIdentifier;
    v2->_removedMembersByGroupIdentifier = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addedSubgroupsByGroupIdentifier = v2->_addedSubgroupsByGroupIdentifier;
    v2->_addedSubgroupsByGroupIdentifier = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    removedSubgroupsByGroupIdentifier = v2->_removedSubgroupsByGroupIdentifier;
    v2->_removedSubgroupsByGroupIdentifier = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addedContainersByIdentifier = v2->_addedContainersByIdentifier;
    v2->_addedContainersByIdentifier = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedContainers = v2->_updatedContainers;
    v2->_updatedContainers = v29;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deletedContainersByIdentifier = v2->_deletedContainersByIdentifier;
    v2->_deletedContainersByIdentifier = v31;

    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    movedContainersByIdentifier = v2->_movedContainersByIdentifier;
    v2->_movedContainersByIdentifier = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addedAccountContainersByIdentifier = v2->_addedAccountContainersByIdentifier;
    v2->_addedAccountContainersByIdentifier = v35;

    v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    defaultAccountContainersByIdentifier = v2->_defaultAccountContainersByIdentifier;
    v2->_defaultAccountContainersByIdentifier = v37;

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contactChangeRequests = v2->_contactChangeRequests;
    v2->_contactChangeRequests = v39;

    v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    addedAccounts = v2->_addedAccounts;
    v2->_addedAccounts = v41;

    v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    removedAccounts = v2->_removedAccounts;
    v2->_removedAccounts = v43;

    v45 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    linkRequests = v2->_linkRequests;
    v2->_linkRequests = v45;

    v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unlinkRequests = v2->_unlinkRequests;
    v2->_unlinkRequests = v47;

    v49 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    preferredForNameRequests = v2->_preferredForNameRequests;
    v2->_preferredForNameRequests = v49;

    v51 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    preferredForImageRequests = v2->_preferredForImageRequests;
    v2->_preferredForImageRequests = v51;

    v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    parentRecordsByIdentifier = v2->_parentRecordsByIdentifier;
    v2->_parentRecordsByIdentifier = v53;

    v2->_shouldRefetchContacts = 1;
    v2->_suppressChangeNotifications = 0;
    v55 = v2;
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSaveRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v137.receiver = self;
  v137.super_class = (Class)CNSaveRequest;
  uint64_t v5 = [(CNSaveRequest *)&v137 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_saveRequestIdentifier"];
    uint64_t v7 = [v6 copy];
    saveRequestIdentifier = v5->_saveRequestIdentifier;
    v5->_saveRequestIdentifier = (NSString *)v7;

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_addedContactsByIdentifier"];
    addedContactsByIdentifier = v5->_addedContactsByIdentifier;
    v5->_addedContactsByIdentifier = (NSMutableDictionary *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"_updatedContacts"];
    updatedContacts = v5->_updatedContacts;
    v5->_updatedContacts = (NSMutableArray *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"_deletedContactsByIdentifier"];
    deletedContactsByIdentifier = v5->_deletedContactsByIdentifier;
    v5->_deletedContactsByIdentifier = (NSMutableDictionary *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"_addedGroupsByIdentifier"];
    addedGroupsByIdentifier = v5->_addedGroupsByIdentifier;
    v5->_addedGroupsByIdentifier = (NSMutableDictionary *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"_updatedGroups"];
    updatedGroups = v5->_updatedGroups;
    v5->_updatedGroups = (NSMutableArray *)v39;

    v41 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    v44 = objc_msgSend(v41, "setWithObjects:", v42, v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"_deletedGroupsByIdentifier"];
    deletedGroupsByIdentifier = v5->_deletedGroupsByIdentifier;
    v5->_deletedGroupsByIdentifier = (NSMutableDictionary *)v45;

    v47 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    v50 = objc_msgSend(v47, "setWithObjects:", v48, v49, objc_opt_class(), 0);
    uint64_t v51 = [v4 decodeObjectOfClasses:v50 forKey:@"_addedMembersByGroupIdentifier"];
    addedMembersByGroupIdentifier = v5->_addedMembersByGroupIdentifier;
    v5->_addedMembersByGroupIdentifier = (NSMutableDictionary *)v51;

    v53 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    v56 = objc_msgSend(v53, "setWithObjects:", v54, v55, objc_opt_class(), 0);
    uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"_removedMembersByGroupIdentifier"];
    removedMembersByGroupIdentifier = v5->_removedMembersByGroupIdentifier;
    v5->_removedMembersByGroupIdentifier = (NSMutableDictionary *)v57;

    v59 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v60 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    v62 = objc_msgSend(v59, "setWithObjects:", v60, v61, objc_opt_class(), 0);
    uint64_t v63 = [v4 decodeObjectOfClasses:v62 forKey:@"_addedSubgroupsByGroupIdentifier"];
    addedSubgroupsByGroupIdentifier = v5->_addedSubgroupsByGroupIdentifier;
    v5->_addedSubgroupsByGroupIdentifier = (NSMutableDictionary *)v63;

    v65 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v66 = objc_opt_class();
    uint64_t v67 = objc_opt_class();
    uint64_t v68 = objc_opt_class();
    v69 = objc_msgSend(v65, "setWithObjects:", v66, v67, v68, objc_opt_class(), 0);
    uint64_t v70 = [v4 decodeObjectOfClasses:v69 forKey:@"_removedSubgroupsByGroupIdentifier"];
    removedSubgroupsByGroupIdentifier = v5->_removedSubgroupsByGroupIdentifier;
    v5->_removedSubgroupsByGroupIdentifier = (NSMutableDictionary *)v70;

    v72 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v73 = objc_opt_class();
    uint64_t v74 = objc_opt_class();
    v75 = objc_msgSend(v72, "setWithObjects:", v73, v74, objc_opt_class(), 0);
    uint64_t v76 = [v4 decodeObjectOfClasses:v75 forKey:@"_addedContainersByIdentifier"];
    addedContainersByIdentifier = v5->_addedContainersByIdentifier;
    v5->_addedContainersByIdentifier = (NSMutableDictionary *)v76;

    v78 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v79 = objc_opt_class();
    v80 = objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    uint64_t v81 = [v4 decodeObjectOfClasses:v80 forKey:@"_updatedContainers"];
    updatedContainers = v5->_updatedContainers;
    v5->_updatedContainers = (NSMutableArray *)v81;

    v83 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v84 = objc_opt_class();
    uint64_t v85 = objc_opt_class();
    v86 = objc_msgSend(v83, "setWithObjects:", v84, v85, objc_opt_class(), 0);
    uint64_t v87 = [v4 decodeObjectOfClasses:v86 forKey:@"_deletedContainersByIdentifier"];
    deletedContainersByIdentifier = v5->_deletedContainersByIdentifier;
    v5->_deletedContainersByIdentifier = (NSMutableDictionary *)v87;

    v89 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v90 = objc_opt_class();
    uint64_t v91 = objc_opt_class();
    v92 = objc_msgSend(v89, "setWithObjects:", v90, v91, objc_opt_class(), 0);
    uint64_t v93 = [v4 decodeObjectOfClasses:v92 forKey:@"_movedContainersByIdentifier"];
    movedContainersByIdentifier = v5->_movedContainersByIdentifier;
    v5->_movedContainersByIdentifier = (NSMutableDictionary *)v93;

    v95 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v96 = objc_opt_class();
    uint64_t v97 = objc_opt_class();
    uint64_t v98 = objc_opt_class();
    uint64_t v99 = objc_opt_class();
    v100 = objc_msgSend(v95, "setWithObjects:", v96, v97, v98, v99, objc_opt_class(), 0);
    uint64_t v101 = [v4 decodeObjectOfClasses:v100 forKey:@"_addedAccountContainersByIdentifier"];
    addedAccountContainersByIdentifier = v5->_addedAccountContainersByIdentifier;
    v5->_addedAccountContainersByIdentifier = (NSMutableDictionary *)v101;

    v103 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v104 = objc_opt_class();
    uint64_t v105 = objc_opt_class();
    uint64_t v106 = objc_opt_class();
    uint64_t v107 = objc_opt_class();
    v108 = objc_msgSend(v103, "setWithObjects:", v104, v105, v106, v107, objc_opt_class(), 0);
    uint64_t v109 = [v4 decodeObjectOfClasses:v108 forKey:@"_defaultAccountContainersByIdentifier"];
    defaultAccountContainersByIdentifier = v5->_defaultAccountContainersByIdentifier;
    v5->_defaultAccountContainersByIdentifier = (NSMutableDictionary *)v109;

    v111 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v112 = objc_opt_class();
    v113 = objc_msgSend(v111, "setWithObjects:", v112, objc_opt_class(), 0);
    uint64_t v114 = [v4 decodeObjectOfClasses:v113 forKey:@"_contactChangeRequests"];
    contactChangeRequests = v5->_contactChangeRequests;
    v5->_contactChangeRequests = (NSMutableArray *)v114;

    v116 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v117 = objc_opt_class();
    v118 = objc_msgSend(v116, "setWithObjects:", v117, objc_opt_class(), 0);
    uint64_t v119 = [v4 decodeObjectOfClasses:v118 forKey:@"_addedAccounts"];
    addedAccounts = v5->_addedAccounts;
    v5->_addedAccounts = (NSMutableArray *)v119;

    v121 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v122 = objc_opt_class();
    v123 = objc_msgSend(v121, "setWithObjects:", v122, objc_opt_class(), 0);
    uint64_t v124 = [v4 decodeObjectOfClasses:v123 forKey:@"_removedAccounts"];
    removedAccounts = v5->_removedAccounts;
    v5->_removedAccounts = (NSMutableArray *)v124;

    v126 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v127 = objc_opt_class();
    uint64_t v128 = objc_opt_class();
    v129 = objc_msgSend(v126, "setWithObjects:", v127, v128, objc_opt_class(), 0);
    uint64_t v130 = [v4 decodeObjectOfClasses:v129 forKey:@"_parentRecordsByIdentifier"];
    parentRecordsByIdentifier = v5->_parentRecordsByIdentifier;
    v5->_parentRecordsByIdentifier = (NSMutableDictionary *)v130;

    v5->_shouldRefetchContacts = [v4 decodeBoolForKey:@"_shouldRefetchContacts"];
    v132 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transactionAuthor"];
    uint64_t v133 = [v132 copy];
    transactionAuthor = v5->_transactionAuthor;
    v5->_transactionAuthor = (NSString *)v133;

    v5->_unsafeApplyChangesOnly = [v4 decodeBoolForKey:@"_unsafeApplyChangesOnly"];
    v5->_ignoresGuardianRestrictions = [v4 decodeBoolForKey:@"_ignoresGuardianRestrictions"];
    v5->_ignoresContactProviderRestrictions = [v4 decodeBoolForKey:@"_ignoresContactProviderRestrictions"];
    v5->_suppressChangeNotifications = [v4 decodeBoolForKey:@"_suppressChangeNotifications"];
    v135 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  saveRequestIdentifier = self->_saveRequestIdentifier;
  id v5 = a3;
  [v5 encodeObject:saveRequestIdentifier forKey:@"_saveRequestIdentifier"];
  [v5 encodeObject:self->_addedContactsByIdentifier forKey:@"_addedContactsByIdentifier"];
  [v5 encodeObject:self->_updatedContacts forKey:@"_updatedContacts"];
  [v5 encodeObject:self->_deletedContactsByIdentifier forKey:@"_deletedContactsByIdentifier"];
  [v5 encodeObject:self->_addedGroupsByIdentifier forKey:@"_addedGroupsByIdentifier"];
  [v5 encodeObject:self->_updatedGroups forKey:@"_updatedGroups"];
  [v5 encodeObject:self->_deletedGroupsByIdentifier forKey:@"_deletedGroupsByIdentifier"];
  [v5 encodeObject:self->_addedMembersByGroupIdentifier forKey:@"_addedMembersByGroupIdentifier"];
  [v5 encodeObject:self->_removedMembersByGroupIdentifier forKey:@"_removedMembersByGroupIdentifier"];
  [v5 encodeObject:self->_addedSubgroupsByGroupIdentifier forKey:@"_addedSubgroupsByGroupIdentifier"];
  [v5 encodeObject:self->_removedSubgroupsByGroupIdentifier forKey:@"_removedSubgroupsByGroupIdentifier"];
  [v5 encodeObject:self->_addedContainersByIdentifier forKey:@"_addedContainersByIdentifier"];
  [v5 encodeObject:self->_updatedContainers forKey:@"_updatedContainers"];
  [v5 encodeObject:self->_deletedContainersByIdentifier forKey:@"_deletedContainersByIdentifier"];
  [v5 encodeObject:self->_movedContainersByIdentifier forKey:@"_movedContainersByIdentifier"];
  [v5 encodeObject:self->_addedAccountContainersByIdentifier forKey:@"_addedAccountContainersByIdentifier"];
  [v5 encodeObject:self->_defaultAccountContainersByIdentifier forKey:@"_defaultAccountContainersByIdentifier"];
  [v5 encodeObject:self->_parentRecordsByIdentifier forKey:@"_parentRecordsByIdentifier"];
  [v5 encodeObject:self->_contactChangeRequests forKey:@"_contactChangeRequests"];
  [v5 encodeObject:self->_addedAccounts forKey:@"_addedAccounts"];
  [v5 encodeObject:self->_removedAccounts forKey:@"_removedAccounts"];
  [v5 encodeObject:self->_transactionAuthor forKey:@"_transactionAuthor"];
  [v5 encodeBool:self->_shouldRefetchContacts forKey:@"_shouldRefetchContacts"];
  [v5 encodeBool:self->_ignoresGuardianRestrictions forKey:@"_ignoresGuardianRestrictions"];
  [v5 encodeBool:self->_ignoresContactProviderRestrictions forKey:@"_ignoresContactProviderRestrictions"];
  [v5 encodeBool:self->_suppressChangeNotifications forKey:@"_suppressChangeNotifications"];
  [v5 encodeBool:self->_unsafeApplyChangesOnly forKey:@"_unsafeApplyChangesOnly"];
}

- (NSString)storeIdentifier
{
  return 0;
}

- (void)_insertContact:(id)a3 intoDictionary:(id)a4 complementDictionary:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 isSuggested] & 1) == 0 && (objc_msgSend(v7, "isImplicitAugmentation") & 1) == 0)
  {
    if ([v7 isUnified])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v10 = objc_msgSend(v7, "linkedContacts", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (([v15 isSuggested] & 1) == 0 && (objc_msgSend(v15, "isImplicitAugmentation") & 1) == 0)
            {
              v16 = [v15 identifier];
              v17 = [v9 objectForKey:v16];

              uint64_t v18 = [v15 identifier];
              if (v17) {
                [v9 removeObjectForKey:v18];
              }
              else {
                [v8 setObject:v7 forKey:v18];
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }
    }
    else
    {
      v19 = [v7 identifier];
      uint64_t v20 = [v9 objectForKey:v19];

      uint64_t v10 = [v7 identifier];
      if (v20) {
        [v9 removeObjectForKey:v10];
      }
      else {
        [v8 setObject:v7 forKey:v10];
      }
    }
  }
}

- (void)addDistinctObject:(id)a3 intoArray:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 indexOfObjectIdenticalTo:v7];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 removeObjectAtIndex:v6];
  }
  [v5 addObject:v7];
}

- (void)addContact:(CNMutableContact *)contact toContainerWithIdentifier:(NSString *)identifier
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = contact;
  id v7 = identifier;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (!v7) {
      goto LABEL_12;
    }
  }
  else
  {
    -[CNSaveRequest addContact:toContainerWithIdentifier:](v8);
    if (!v7) {
      goto LABEL_12;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
    }
    id v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNSaveRequest addContact:toContainerWithIdentifier:](v9);
    }
  }
LABEL_12:
  addedContactsByIdentifier = self->_addedContactsByIdentifier;
  v16[0] = v6;
  uint64_t v11 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();
  v16[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v13 = [(CNContact *)v6 identifier];
  [(NSMutableDictionary *)addedContactsByIdentifier setObject:v12 forKey:v13];

  deletedContactsByIdentifier = self->_deletedContactsByIdentifier;
  uint64_t v15 = [(CNContact *)v6 identifier];
  [(NSMutableDictionary *)deletedContactsByIdentifier removeObjectForKey:v15];
}

- (void)updateContact:(CNMutableContact *)contact
{
  id v4 = contact;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
    }
    id v5 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNSaveRequest addContact:toContainerWithIdentifier:](v5);
    }
  }
  [(CNSaveRequest *)self addDistinctObject:v4 intoArray:self->_updatedContacts];
}

- (void)deleteContact:(CNMutableContact *)contact
{
  id v4 = contact;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
    }
    id v5 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNSaveRequest addContact:toContainerWithIdentifier:](v5);
    }
  }
  [(CNSaveRequest *)self _insertContact:v4 intoDictionary:self->_deletedContactsByIdentifier complementDictionary:self->_addedContactsByIdentifier];
}

- (void)setMeCardIdentifier:(id)a3
{
  (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (NSString *)[v6 copy];
  meCardIdentifier = self->_meCardIdentifier;
  self->_meCardIdentifier = v4;
}

- (void)addGroup:(CNMutableGroup *)group toContainerWithIdentifier:(NSString *)identifier
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = group;
  id v7 = identifier;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (!v7) {
      goto LABEL_12;
    }
  }
  else
  {
    -[CNSaveRequest addGroup:toContainerWithIdentifier:](v8);
    if (!v7) {
      goto LABEL_12;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
    }
    id v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNSaveRequest addContact:toContainerWithIdentifier:](v9);
    }
  }
LABEL_12:
  v16[0] = v6;
  uint64_t v10 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();
  v16[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  uint64_t v13 = [(CNMutableGroup *)v6 identifier];
  [(NSMutableDictionary *)addedGroupsByIdentifier setObject:v11 forKey:v13];

  deletedGroupsByIdentifier = self->_deletedGroupsByIdentifier;
  uint64_t v15 = [(CNMutableGroup *)v6 identifier];
  [(NSMutableDictionary *)deletedGroupsByIdentifier removeObjectForKey:v15];
}

- (void)updateGroup:(CNMutableGroup *)group
{
  id v4 = group;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
    }
    id v5 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNSaveRequest addGroup:toContainerWithIdentifier:](v5);
    }
  }
  [(CNSaveRequest *)self addDistinctObject:v4 intoArray:self->_updatedGroups];
}

- (void)deleteGroup:(CNMutableGroup *)group
{
  id v4 = group;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
    }
    id v5 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNSaveRequest addGroup:toContainerWithIdentifier:](v5);
    }
  }
  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  id v7 = [(CNMutableGroup *)v4 identifier];
  id v8 = [(NSMutableDictionary *)addedGroupsByIdentifier objectForKey:v7];

  if (v8)
  {
    id v9 = self->_addedGroupsByIdentifier;
    uint64_t v10 = [(CNMutableGroup *)v4 identifier];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];
  }
  else
  {
    deletedGroupsByIdentifier = self->_deletedGroupsByIdentifier;
    uint64_t v10 = [(CNMutableGroup *)v4 identifier];
    [(NSMutableDictionary *)deletedGroupsByIdentifier setObject:v4 forKey:v10];
  }
}

- (void)addMember:(CNContact *)contact toGroup:(CNGroup *)group
{
  id v6 = contact;
  id v7 = group;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {
    -[CNSaveRequest addMember:toGroup:](v8);
    if (v7)
    {
LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
    -[CNSaveRequest addMember:toGroup:](v9);
  }
LABEL_12:
  uint64_t v10 = (void *)[(CNContact *)v6 copy];

  addedMembersByGroupIdentifier = self->_addedMembersByGroupIdentifier;
  uint64_t v12 = [(CNGroup *)v7 identifier];
  uint64_t v13 = [(NSMutableDictionary *)addedMembersByGroupIdentifier objectForKey:v12];

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    parentRecordsByIdentifier = self->_parentRecordsByIdentifier;
    uint64_t v15 = [(CNGroup *)v7 identifier];
    [(NSMutableDictionary *)parentRecordsByIdentifier setObject:v7 forKey:v15];

    v16 = self->_addedMembersByGroupIdentifier;
    v17 = [(CNGroup *)v7 identifier];
    [(NSMutableDictionary *)v16 setObject:v13 forKey:v17];
  }
  uint64_t v18 = [v10 identifier];
  [v13 setObject:v10 forKey:v18];

  removedMembersByGroupIdentifier = self->_removedMembersByGroupIdentifier;
  uint64_t v20 = [(CNGroup *)v7 identifier];
  long long v21 = [(NSMutableDictionary *)removedMembersByGroupIdentifier objectForKey:v20];

  long long v22 = [v10 identifier];
  [v21 removeObjectForKey:v22];
}

- (void)removeMember:(CNContact *)contact fromGroup:(CNGroup *)group
{
  id v6 = contact;
  id v7 = group;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {
    -[CNSaveRequest addMember:toGroup:](v8);
    if (v7)
    {
LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
    -[CNSaveRequest addMember:toGroup:](v9);
  }
LABEL_12:
  uint64_t v10 = (void *)[(CNContact *)v6 copy];

  removedMembersByGroupIdentifier = self->_removedMembersByGroupIdentifier;
  uint64_t v12 = [(CNGroup *)v7 identifier];
  uint64_t v13 = [(NSMutableDictionary *)removedMembersByGroupIdentifier objectForKey:v12];

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    parentRecordsByIdentifier = self->_parentRecordsByIdentifier;
    uint64_t v15 = [(CNGroup *)v7 identifier];
    [(NSMutableDictionary *)parentRecordsByIdentifier setObject:v7 forKey:v15];

    v16 = self->_removedMembersByGroupIdentifier;
    v17 = [(CNGroup *)v7 identifier];
    [(NSMutableDictionary *)v16 setObject:v13 forKey:v17];
  }
  uint64_t v18 = [v10 identifier];
  [v13 setObject:v10 forKey:v18];

  addedMembersByGroupIdentifier = self->_addedMembersByGroupIdentifier;
  uint64_t v20 = [(CNGroup *)v7 identifier];
  long long v21 = [(NSMutableDictionary *)addedMembersByGroupIdentifier objectForKey:v20];

  long long v22 = [v10 identifier];
  [v21 removeObjectForKey:v22];
}

- (void)addSubgroup:(CNGroup *)subgroup toGroup:(CNGroup *)group
{
  id v6 = subgroup;
  id v7 = group;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {
    -[CNSaveRequest addSubgroup:toGroup:](v8);
    if (v7)
    {
LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
    -[CNSaveRequest addMember:toGroup:](v9);
  }
LABEL_12:
  uint64_t v10 = (void *)[(CNGroup *)v6 copy];

  addedSubgroupsByGroupIdentifier = self->_addedSubgroupsByGroupIdentifier;
  uint64_t v12 = [(CNGroup *)v7 identifier];
  uint64_t v13 = [(NSMutableDictionary *)addedSubgroupsByGroupIdentifier objectForKey:v12];

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    parentRecordsByIdentifier = self->_parentRecordsByIdentifier;
    uint64_t v15 = [(CNGroup *)v7 identifier];
    [(NSMutableDictionary *)parentRecordsByIdentifier setObject:v7 forKey:v15];

    v16 = self->_addedSubgroupsByGroupIdentifier;
    v17 = [(CNGroup *)v7 identifier];
    [(NSMutableDictionary *)v16 setObject:v13 forKey:v17];
  }
  uint64_t v18 = [v10 identifier];
  [v13 setObject:v10 forKey:v18];

  removedSubgroupsByGroupIdentifier = self->_removedSubgroupsByGroupIdentifier;
  uint64_t v20 = [(CNGroup *)v7 identifier];
  long long v21 = [(NSMutableDictionary *)removedSubgroupsByGroupIdentifier objectForKey:v20];

  long long v22 = [v10 identifier];
  [v21 removeObjectForKey:v22];
}

- (void)removeSubgroup:(CNGroup *)subgroup fromGroup:(CNGroup *)group
{
  id v6 = subgroup;
  id v7 = group;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {
    -[CNSaveRequest addSubgroup:toGroup:](v8);
    if (v7)
    {
LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_324);
  }
  id v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
    -[CNSaveRequest addMember:toGroup:](v9);
  }
LABEL_12:
  uint64_t v10 = (void *)[(CNGroup *)v6 copy];

  removedSubgroupsByGroupIdentifier = self->_removedSubgroupsByGroupIdentifier;
  uint64_t v12 = [(CNGroup *)v7 identifier];
  uint64_t v13 = [(NSMutableDictionary *)removedSubgroupsByGroupIdentifier objectForKey:v12];

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    parentRecordsByIdentifier = self->_parentRecordsByIdentifier;
    uint64_t v15 = [(CNGroup *)v7 identifier];
    [(NSMutableDictionary *)parentRecordsByIdentifier setObject:v7 forKey:v15];

    v16 = self->_removedSubgroupsByGroupIdentifier;
    v17 = [(CNGroup *)v7 identifier];
    [(NSMutableDictionary *)v16 setObject:v13 forKey:v17];
  }
  uint64_t v18 = [v10 identifier];
  [v13 setObject:v10 forKey:v18];

  addedSubgroupsByGroupIdentifier = self->_addedSubgroupsByGroupIdentifier;
  uint64_t v20 = [(CNGroup *)v7 identifier];
  long long v21 = [(NSMutableDictionary *)addedSubgroupsByGroupIdentifier objectForKey:v20];

  long long v22 = [v10 identifier];
  [v21 removeObjectForKey:v22];
}

- (id)flattenedDictionaryForDictionaryOfTuples:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CNSaveRequest_flattenedDictionaryForDictionaryOfTuples___block_invoke;
  v8[3] = &unk_1E56B7A28;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __58__CNSaveRequest_flattenedDictionaryForDictionaryOfTuples___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 objectAtIndex:1];
  id v5 = [*(id *)(a1 + 32) objectForKey:v4];
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 32) setObject:v5 forKey:v4];
  }
  id v6 = [v7 objectAtIndex:0];
  [v5 addObject:v6];
}

- (id)_dictionaryOfArraysFromDictionaryOfDictionaries:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__CNSaveRequest__dictionaryOfArraysFromDictionaryOfDictionaries___block_invoke;
  v8[3] = &unk_1E56B7A28;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __65__CNSaveRequest__dictionaryOfArraysFromDictionaryOfDictionaries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 allValues];
  [v4 setObject:v6 forKey:v5];
}

- (NSDictionary)addedContactsByContainerIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self flattenedDictionaryForDictionaryOfTuples:self->_addedContactsByIdentifier];
}

- (NSArray)updatedContacts
{
  v2 = (void *)[(NSMutableArray *)self->_updatedContacts copy];

  return (NSArray *)v2;
}

- (NSArray)deletedContacts
{
  v2 = cn_objectResultWithObjectLock();

  return (NSArray *)v2;
}

id __32__CNSaveRequest_deletedContacts__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[4];
  if (!v3)
  {
    uint64_t v4 = [v2 distinctDeletedContacts];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }

  return v3;
}

- (id)distinctDeletedContacts
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__35;
  uint64_t v11 = __Block_byref_object_dispose__35;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(NSMutableDictionary *)self->_deletedContactsByIdentifier allValues];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__CNSaveRequest_distinctDeletedContacts__block_invoke;
  v6[3] = &unk_1E56B8FA8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "_cn_each:", v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __40__CNSaveRequest_distinctDeletedContacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addDistinctObject:a2 intoArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (NSString)meCardIdentifier
{
  return self->_meCardIdentifier;
}

- (NSDictionary)addedGroupsByContainerIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self flattenedDictionaryForDictionaryOfTuples:self->_addedGroupsByIdentifier];
}

- (NSArray)updatedGroups
{
  v2 = (void *)[(NSMutableArray *)self->_updatedGroups copy];

  return (NSArray *)v2;
}

- (NSArray)deletedGroups
{
  return (NSArray *)[(NSMutableDictionary *)self->_deletedGroupsByIdentifier allValues];
}

- (NSDictionary)addedMembersByGroupIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self _dictionaryOfArraysFromDictionaryOfDictionaries:self->_addedMembersByGroupIdentifier];
}

- (NSDictionary)removedMembersByGroupIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self _dictionaryOfArraysFromDictionaryOfDictionaries:self->_removedMembersByGroupIdentifier];
}

- (NSDictionary)addedSubgroupsByGroupIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self _dictionaryOfArraysFromDictionaryOfDictionaries:self->_addedSubgroupsByGroupIdentifier];
}

- (NSDictionary)removedSubgroupsByGroupIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self _dictionaryOfArraysFromDictionaryOfDictionaries:self->_removedSubgroupsByGroupIdentifier];
}

- (NSDictionary)addedContainersByParentContainerIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self flattenedDictionaryForDictionaryOfTuples:self->_addedContainersByIdentifier];
}

- (NSDictionary)addedAccountContainersByParentContainerIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self flattenedDictionaryForDictionaryOfTuples:self->_addedAccountContainersByIdentifier];
}

- (NSDictionary)defaultAccountContainersByAccountIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self flattenedDictionaryForDictionaryOfTuples:self->_defaultAccountContainersByIdentifier];
}

- (NSArray)deletedContainers
{
  return (NSArray *)[(NSMutableDictionary *)self->_deletedContainersByIdentifier allValues];
}

- (NSArray)updatedContainers
{
  v2 = (void *)[(NSMutableArray *)self->_updatedContainers copy];

  return (NSArray *)v2;
}

- (NSDictionary)movedContainersByParentContainerIdentifier
{
  return (NSDictionary *)[(CNSaveRequest *)self flattenedDictionaryForDictionaryOfTuples:self->_movedContainersByIdentifier];
}

- (BOOL)hasConflictingSaveOperations
{
  id v3 = [(CNSaveRequest *)self contactChangeRequests];
  if ([v3 count])
  {
    id v4 = [(CNSaveRequest *)self addedContactsByContainerIdentifier];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)addContainer:(id)a3 toContainerWithIdentifier:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)[a3 copy];
  addedContainersByIdentifier = self->_addedContainersByIdentifier;
  v16[0] = v7;
  uint64_t v9 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();

  v16[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v11 = [v7 identifier];
  [(NSMutableDictionary *)addedContainersByIdentifier setObject:v10 forKey:v11];

  deletedContainersByIdentifier = self->_deletedContainersByIdentifier;
  uint64_t v13 = [v7 identifier];
  [(NSMutableDictionary *)deletedContainersByIdentifier removeObjectForKey:v13];

  addedAccountContainersByIdentifier = self->_addedAccountContainersByIdentifier;
  uint64_t v15 = [v7 identifier];
  [(NSMutableDictionary *)addedAccountContainersByIdentifier removeObjectForKey:v15];
}

- (void)addContainer:(id)a3 toAccountWithIdentifier:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  addedAccountContainersByIdentifier = self->_addedAccountContainersByIdentifier;
  v17[0] = a3;
  uint64_t v7 = *MEMORY[0x1E4F5A2A8];
  id v8 = *(void (**)(uint64_t, id))(*MEMORY[0x1E4F5A2A8] + 16);
  id v9 = a3;
  uint64_t v10 = v8(v7, a4);
  v17[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v12 = [v9 identifier];
  [(NSMutableDictionary *)addedAccountContainersByIdentifier setObject:v11 forKey:v12];

  deletedContainersByIdentifier = self->_deletedContainersByIdentifier;
  v14 = [v9 identifier];
  [(NSMutableDictionary *)deletedContainersByIdentifier removeObjectForKey:v14];

  addedContainersByIdentifier = self->_addedContainersByIdentifier;
  v16 = [v9 identifier];
  [(NSMutableDictionary *)addedContainersByIdentifier removeObjectForKey:v16];
}

- (void)setContainer:(id)a3 asDefaultContainerOfAccountWithIdentifier:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  defaultAccountContainersByIdentifier = self->_defaultAccountContainersByIdentifier;
  v12[0] = a3;
  uint64_t v6 = *MEMORY[0x1E4F5A2A8];
  uint64_t v7 = *(void (**)(uint64_t, id))(*MEMORY[0x1E4F5A2A8] + 16);
  id v8 = a3;
  id v9 = v7(v6, a4);
  v12[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v11 = [v8 identifier];
  [(NSMutableDictionary *)defaultAccountContainersByIdentifier setObject:v10 forKey:v11];
}

- (void)moveContainer:(id)a3 toContainerWithIdentifier:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)[a3 copy];
  movedContainersByIdentifier = self->_movedContainersByIdentifier;
  v12[0] = v7;
  id v9 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();

  v12[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v11 = [v7 identifier];
  [(NSMutableDictionary *)movedContainersByIdentifier setObject:v10 forKey:v11];
}

- (void)deleteContainer:(id)a3
{
  id v8 = (id)[a3 copy];
  deletedContainersByIdentifier = self->_deletedContainersByIdentifier;
  BOOL v5 = [v8 identifier];
  [(NSMutableDictionary *)deletedContainersByIdentifier setObject:v8 forKey:v5];

  addedContainersByIdentifier = self->_addedContainersByIdentifier;
  uint64_t v7 = [v8 identifier];
  [(NSMutableDictionary *)addedContainersByIdentifier removeObjectForKey:v7];
}

- (void)updateContainer:(id)a3
{
}

- (NSArray)contactChangeRequests
{
  v2 = (void *)[(NSMutableArray *)self->_contactChangeRequests copy];

  return (NSArray *)v2;
}

- (void)linkContact:(id)a3 toContact:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 != v7 && v6 && v7)
  {
    if ([v6 isUnified])
    {
      id v9 = [v6 linkedContacts];
      uint64_t v10 = [v9 firstObject];

      id v6 = (id)v10;
    }
    if ([v8 isUnified])
    {
      uint64_t v11 = [v8 linkedContacts];
      uint64_t v12 = [v11 firstObject];

      id v8 = (void *)v12;
    }
    v17[0] = v6;
    v17[1] = v8;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v14 = +[CNContactChangeRequest contactChangeRequestWithKind:0 contacts:v13 linkIdentifier:0];

    [(NSMutableArray *)self->_contactChangeRequests addObject:v14];
    linkRequests = self->_linkRequests;
    v16 = [MEMORY[0x1E4F5A490] pairWithFirst:v6 second:v8];
    [(NSMutableArray *)linkRequests addObject:v16];
  }
}

- (void)unlinkContact:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v23[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v16 = v5;
    if ([v5 isUnified])
    {
      uint64_t v7 = [v5 linkedContactsFromStoreWithIdentifier:0];

      id v6 = (void *)v7;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v21 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          uint64_t v13 = v21;
          v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
          uint64_t v15 = +[CNContactChangeRequest contactChangeRequestWithKind:1 contacts:v14 linkIdentifier:0];

          [(NSMutableArray *)self->_contactChangeRequests addObject:v15];
          [(NSMutableArray *)self->_unlinkRequests addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    BOOL v5 = v16;
  }
}

- (void)preferLinkedContactForName:(id)a3 inUnifiedContact:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v14[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    if (v7 && [v7 isUnified])
    {
      uint64_t v9 = [v7 linkedContactsFromStoreWithIdentifier:0];
      uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

      id v8 = (void *)v10;
    }
    uint64_t v11 = +[CNContactChangeRequest contactChangeRequestWithKind:2 contacts:v8 linkIdentifier:0];
    [(NSMutableArray *)self->_contactChangeRequests addObject:v11];
    preferredForNameRequests = self->_preferredForNameRequests;
    uint64_t v13 = [MEMORY[0x1E4F5A490] pairWithFirst:v6 second:v7];
    [(NSMutableArray *)preferredForNameRequests addObject:v13];
  }
}

- (void)preferLinkedContactForImage:(id)a3 inUnifiedContact:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v14[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    if (v7 && [v7 isUnified])
    {
      uint64_t v9 = [v7 linkedContactsFromStoreWithIdentifier:0];
      uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

      id v8 = (void *)v10;
    }
    uint64_t v11 = +[CNContactChangeRequest contactChangeRequestWithKind:3 contacts:v8 linkIdentifier:0];
    [(NSMutableArray *)self->_contactChangeRequests addObject:v11];
    preferredForImageRequests = self->_preferredForImageRequests;
    uint64_t v13 = [MEMORY[0x1E4F5A490] pairWithFirst:v6 second:v7];
    [(NSMutableArray *)preferredForImageRequests addObject:v13];
  }
}

- (void)addAccount:(id)a3
{
  addedAccounts = self->_addedAccounts;
  id v5 = a3;
  [(NSMutableArray *)addedAccounts addObject:v5];
  [(NSMutableArray *)self->_removedAccounts removeObject:v5];
}

- (void)removeAccount:(id)a3
{
  removedAccounts = self->_removedAccounts;
  id v5 = a3;
  [(NSMutableArray *)removedAccounts addObject:v5];
  [(NSMutableArray *)self->_addedAccounts removeObject:v5];
}

- (id)groupWithAddedMemberForGroupIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parentRecordsByIdentifier objectForKey:a3];
}

- (id)groupWithRemovedMemberForGroupIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parentRecordsByIdentifier objectForKey:a3];
}

- (id)groupWithAddedSubgroupForGroupIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parentRecordsByIdentifier objectForKey:a3];
}

- (id)groupWithRemovedSubgroupForGroupIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parentRecordsByIdentifier objectForKey:a3];
}

- (NSArray)allGroups
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_updatedGroups];
  id v4 = [(NSMutableDictionary *)self->_deletedGroupsByIdentifier allValues];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_137];
  [v3 addObjectsFromArray:v5];

  id v6 = [MEMORY[0x1E4F1CA48] array];
  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __26__CNSaveRequest_allGroups__block_invoke_2;
  v11[3] = &unk_1E56B7A28;
  id v12 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)addedGroupsByIdentifier enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_137];
  [v3 addObjectsFromArray:v9];

  return (NSArray *)v3;
}

uint64_t __26__CNSaveRequest_allGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __26__CNSaveRequest_allGroups__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 objectAtIndexedSubscript:0];
  [v3 addObject:v4];
}

- (NSArray)allGroupIdentifiers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = (void *)MEMORY[0x1E4F1CAA0];
  id v5 = [(NSMutableArray *)self->_updatedGroups _cn_map:&__block_literal_global_102_0];
  id v6 = [v4 orderedSetWithArray:v5];
  uint64_t v7 = [v6 array];
  [v3 addObjectsFromArray:v7];

  id v8 = [(NSMutableDictionary *)self->_deletedGroupsByIdentifier allKeys];
  [v3 addObjectsFromArray:v8];

  uint64_t v9 = [(NSMutableDictionary *)self->_addedGroupsByIdentifier allKeys];
  [v3 addObjectsFromArray:v9];

  uint64_t v10 = [(NSMutableDictionary *)self->_addedSubgroupsByGroupIdentifier allKeys];
  [v3 addObjectsFromArray:v10];

  uint64_t v11 = [(NSMutableDictionary *)self->_removedSubgroupsByGroupIdentifier allKeys];
  [v3 addObjectsFromArray:v11];

  addedSubgroupsByGroupIdentifier = self->_addedSubgroupsByGroupIdentifier;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __36__CNSaveRequest_allGroupIdentifiers__block_invoke_2;
  v26[3] = &unk_1E56B7A28;
  id v13 = v3;
  id v27 = v13;
  [(NSMutableDictionary *)addedSubgroupsByGroupIdentifier enumerateKeysAndObjectsUsingBlock:v26];
  removedSubgroupsByGroupIdentifier = self->_removedSubgroupsByGroupIdentifier;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  long long v23 = __36__CNSaveRequest_allGroupIdentifiers__block_invoke_3;
  long long v24 = &unk_1E56B7A28;
  id v15 = v13;
  id v25 = v15;
  [(NSMutableDictionary *)removedSubgroupsByGroupIdentifier enumerateKeysAndObjectsUsingBlock:&v21];
  v16 = [(NSMutableDictionary *)self->_addedMembersByGroupIdentifier allKeys];
  [v15 addObjectsFromArray:v16];

  long long v17 = [(NSMutableDictionary *)self->_removedMembersByGroupIdentifier allKeys];
  [v15 addObjectsFromArray:v17];

  long long v18 = v25;
  long long v19 = (NSArray *)v15;

  return v19;
}

uint64_t __36__CNSaveRequest_allGroupIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __36__CNSaveRequest_allGroupIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allKeys];
  [v3 addObjectsFromArray:v4];
}

void __36__CNSaveRequest_allGroupIdentifiers__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allKeys];
  [v3 addObjectsFromArray:v4];
}

- (NSArray)allContacts
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_updatedContacts];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_contactChangeRequests;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v21 + 1) + 8 * i) contacts];
        [v3 addObjectsFromArray:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [(CNSaveRequest *)self deletedContacts];
  uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_105];
  [v3 addObjectsFromArray:v10];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__35;
  long long v19 = __Block_byref_object_dispose__35;
  id v20 = [MEMORY[0x1E4F1CA48] array];
  addedContactsByIdentifier = self->_addedContactsByIdentifier;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __28__CNSaveRequest_allContacts__block_invoke_2;
  v14[3] = &unk_1E56B8FF0;
  v14[4] = &v15;
  [(NSMutableDictionary *)addedContactsByIdentifier enumerateKeysAndObjectsUsingBlock:v14];
  id v12 = [(id)v16[5] sortedArrayUsingComparator:&__block_literal_global_105];
  [v3 addObjectsFromArray:v12];

  _Block_object_dispose(&v15, 8);

  return (NSArray *)v3;
}

uint64_t __28__CNSaveRequest_allContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 identifier];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __28__CNSaveRequest_allContacts__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a3 objectAtIndexedSubscript:0];
  [v3 addObject:v4];
}

- (NSArray)allContactIdentifiers
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v5 = [(NSMutableArray *)self->_updatedContacts _cn_map:&__block_literal_global_109];
  uint64_t v6 = [v4 orderedSetWithArray:v5];
  uint64_t v7 = [v6 array];
  [v3 addObjectsFromArray:v7];

  id v8 = [(NSMutableDictionary *)self->_deletedContactsByIdentifier allKeys];
  [v3 addObjectsFromArray:v8];

  uint64_t v9 = [(NSMutableDictionary *)self->_addedContactsByIdentifier allKeys];
  [v3 addObjectsFromArray:v9];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()) {
    [v3 addObject:self->_meCardIdentifier];
  }
  addedMembersByGroupIdentifier = self->_addedMembersByGroupIdentifier;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __38__CNSaveRequest_allContactIdentifiers__block_invoke_2;
  v38[3] = &unk_1E56B7A28;
  id v11 = v3;
  id v39 = v11;
  [(NSMutableDictionary *)addedMembersByGroupIdentifier enumerateKeysAndObjectsUsingBlock:v38];
  removedMembersByGroupIdentifier = self->_removedMembersByGroupIdentifier;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __38__CNSaveRequest_allContactIdentifiers__block_invoke_3;
  v36[3] = &unk_1E56B7A28;
  id v13 = v11;
  id v37 = v13;
  [(NSMutableDictionary *)removedMembersByGroupIdentifier enumerateKeysAndObjectsUsingBlock:v36];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v14 = self->_contactChangeRequests;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v20 = objc_msgSend(v19, "contactIdentifiers", 0);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v29;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v29 != v23) {
                objc_enumerationMutation(v20);
              }
              [v13 addObject:*(void *)(*((void *)&v28 + 1) + 8 * v24++)];
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
          }
          while (v22);
        }

        ++v18;
      }
      while (v18 != v16);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v16);
  }

  id v25 = v37;
  uint64_t v26 = (NSArray *)v13;

  return v26;
}

uint64_t __38__CNSaveRequest_allContactIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __38__CNSaveRequest_allContactIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allKeys];
  [v3 addObjectsFromArray:v4];
}

void __38__CNSaveRequest_allContactIdentifiers__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allKeys];
  [v3 addObjectsFromArray:v4];
}

- (NSArray)allContainers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_updatedContainers];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  addedAccountContainersByIdentifier = self->_addedAccountContainersByIdentifier;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __30__CNSaveRequest_allContainers__block_invoke_2;
  void v17[3] = &unk_1E56B7A28;
  id v6 = v4;
  id v18 = v6;
  [(NSMutableDictionary *)addedAccountContainersByIdentifier enumerateKeysAndObjectsUsingBlock:v17];
  defaultAccountContainersByIdentifier = self->_defaultAccountContainersByIdentifier;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __30__CNSaveRequest_allContainers__block_invoke_3;
  uint64_t v15 = &unk_1E56B7A28;
  id v16 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)defaultAccountContainersByIdentifier enumerateKeysAndObjectsUsingBlock:&v12];
  uint64_t v9 = objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_112_0, v12, v13, v14, v15);
  [v3 addObjectsFromArray:v9];

  uint64_t v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

uint64_t __30__CNSaveRequest_allContainers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __30__CNSaveRequest_allContainers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 objectAtIndexedSubscript:0];
  [v3 addObject:v4];
}

void __30__CNSaveRequest_allContainers__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 objectAtIndexedSubscript:0];
  [v3 addObject:v4];
}

- (id)allContainerIdentifiers:(BOOL *)a3
{
  v32[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(NSMutableDictionary *)self->_addedContainersByIdentifier allKeys];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CAA0];
  id v8 = [(NSMutableArray *)self->_updatedContainers _cn_map:&__block_literal_global_115_0];
  uint64_t v9 = [v7 orderedSetWithArray:v8];
  uint64_t v10 = [v9 array];
  [v5 addObjectsFromArray:v10];

  id v11 = [(NSMutableDictionary *)self->_deletedContainersByIdentifier allKeys];
  [v5 addObjectsFromArray:v11];

  uint64_t v12 = [(NSMutableDictionary *)self->_movedContainersByIdentifier allKeys];
  [v5 addObjectsFromArray:v12];

  uint64_t v13 = [(NSMutableDictionary *)self->_addedAccountContainersByIdentifier allKeys];
  [v5 addObjectsFromArray:v13];

  v14 = [(NSMutableDictionary *)self->_defaultAccountContainersByIdentifier allKeys];
  [v5 addObjectsFromArray:v14];

  movedContainersByIdentifier = self->_movedContainersByIdentifier;
  v32[0] = self->_addedContainersByIdentifier;
  v32[1] = movedContainersByIdentifier;
  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  v32[2] = self->_addedContactsByIdentifier;
  v32[3] = addedGroupsByIdentifier;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __41__CNSaveRequest_allContainerIdentifiers___block_invoke_2;
        v24[3] = &unk_1E56B7550;
        id v25 = v5;
        uint64_t v26 = a3;
        [v22 enumerateKeysAndObjectsUsingBlock:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }

  return v5;
}

uint64_t __41__CNSaveRequest_allContainerIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __41__CNSaveRequest_allContainerIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 objectAtIndex:1];
  id v4 = [MEMORY[0x1E4F1CA98] null];
  char v5 = [v8 isEqual:v4];

  if (v5)
  {
    id v6 = *(unsigned char **)(a1 + 40);
    uint64_t v7 = v8;
    if (v6) {
      *id v6 = 1;
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v8];
    uint64_t v7 = v8;
  }
}

- (id)allContainerIdentifierStrings:(BOOL *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNSaveRequest *)self allContainerIdentifiers:a3];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(void *)(*((void *)&v11 + 1) + 8 * i)) {
          [v4 addObject:(void)v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)allAccountIdentifiers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  addedAccountContainersByIdentifier = self->_addedAccountContainersByIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__CNSaveRequest_allAccountIdentifiers__block_invoke;
  v13[3] = &unk_1E56B7A28;
  id v5 = v3;
  id v14 = v5;
  [(NSMutableDictionary *)addedAccountContainersByIdentifier enumerateKeysAndObjectsUsingBlock:v13];
  defaultAccountContainersByIdentifier = self->_defaultAccountContainersByIdentifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__CNSaveRequest_allAccountIdentifiers__block_invoke_2;
  v11[3] = &unk_1E56B7A28;
  id v7 = v5;
  id v12 = v7;
  [(NSMutableDictionary *)defaultAccountContainersByIdentifier enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __38__CNSaveRequest_allAccountIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 objectAtIndexedSubscript:1];
  [v3 addObject:v4];
}

void __38__CNSaveRequest_allAccountIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 objectAtIndexedSubscript:1];
  [v3 addObject:v4];
}

- (NSArray)allAccountIdentifierStrings
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(CNSaveRequest *)self allAccountIdentifiers];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8 * i)) {
          [v3 addObject:(void)v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSString)changeHistoryClientIdentifier
{
  return self->_transactionAuthor;
}

- (void)setChangeHistoryClientIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  transactionAuthor = self->_transactionAuthor;
  self->_transactionAuthor = v4;

  MEMORY[0x1F41817F8](v4, transactionAuthor);
}

- (BOOL)canIgnoreError:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = [v7 saveRequest:self shouldProceedAfterError:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)unsafeApplyChangesOnly
{
  return self->_unsafeApplyChangesOnly;
}

- (void)setUnsafeApplyChangesOnly:(BOOL)a3
{
  self->_unsafeApplyChangesOnly = a3;
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (void)setTransactionAuthor:(NSString *)transactionAuthor
{
}

- (BOOL)shouldRefetchContacts
{
  return self->_shouldRefetchContacts;
}

- (void)setShouldRefetchContacts:(BOOL)shouldRefetchContacts
{
  self->_shouldRefetchContacts = shouldRefetchContacts;
}

- (NSArray)addedAccounts
{
  return &self->_addedAccounts->super;
}

- (NSArray)removedAccounts
{
  return &self->_removedAccounts->super;
}

- (NSArray)linkRequests
{
  return &self->_linkRequests->super;
}

- (CNSaveRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSaveRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)saveRequestIdentifier
{
  return self->_saveRequestIdentifier;
}

- (NSDictionary)deletedContactsByIdentifier
{
  return &self->_deletedContactsByIdentifier->super;
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (BOOL)ignoresContactProviderRestrictions
{
  return self->_ignoresContactProviderRestrictions;
}

- (void)setIgnoresContactProviderRestrictions:(BOOL)a3
{
  self->_ignoresContactProviderRestrictions = a3;
}

- (BOOL)suppressChangeNotifications
{
  return self->_suppressChangeNotifications;
}

- (void)setSuppressChangeNotifications:(BOOL)a3
{
  self->_suppressChangeNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveRequestIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
  objc_storeStrong((id *)&self->_parentRecordsByIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredForImageRequests, 0);
  objc_storeStrong((id *)&self->_preferredForNameRequests, 0);
  objc_storeStrong((id *)&self->_unlinkRequests, 0);
  objc_storeStrong((id *)&self->_linkRequests, 0);
  objc_storeStrong((id *)&self->_removedAccounts, 0);
  objc_storeStrong((id *)&self->_addedAccounts, 0);
  objc_storeStrong((id *)&self->_contactChangeRequests, 0);
  objc_storeStrong((id *)&self->_defaultAccountContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_addedAccountContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_movedContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_deletedContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_updatedContainers, 0);
  objc_storeStrong((id *)&self->_addedContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_removedSubgroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_addedSubgroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_removedMembersByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_addedMembersByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_deletedGroupsByIdentifier, 0);
  objc_storeStrong((id *)&self->_updatedGroups, 0);
  objc_storeStrong((id *)&self->_addedGroupsByIdentifier, 0);
  objc_storeStrong((id *)&self->_meCardIdentifier, 0);
  objc_storeStrong((id *)&self->_deletedContacts, 0);
  objc_storeStrong((id *)&self->_deletedContactsByIdentifier, 0);
  objc_storeStrong((id *)&self->_updatedContacts, 0);

  objc_storeStrong((id *)&self->_addedContactsByIdentifier, 0);
}

- (void)setLinkIdentifier:(id)a3 forContact:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7 && [v6 length])
  {
    if ([v7 isUnified])
    {
      char v8 = [v7 linkedContacts];
      uint64_t v9 = [v8 firstObject];

      id v7 = (id)v9;
    }
    v12[0] = v7;
    long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    long long v11 = +[CNContactChangeRequest contactChangeRequestWithKind:4 contacts:v10 linkIdentifier:v6];

    [(NSMutableArray *)self->_contactChangeRequests addObject:v11];
  }
}

- (void)addContact:(void *)a1 toContainerWithIdentifier:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_1_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v5, v6, "parameter ‘containerIdentifier’ must be of type %{public}@", v7, v8, v9, v10, v11);
}

- (void)addContact:(void *)a1 toContainerWithIdentifier:.cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_1_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v5, v6, "parameter ‘contact’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);
}

- (void)addGroup:(void *)a1 toContainerWithIdentifier:.cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_1_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v5, v6, "parameter ‘group’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);
}

- (void)addMember:(void *)a1 toGroup:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_1_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v5, v6, "parameter ‘group’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);
}

- (void)addMember:(void *)a1 toGroup:.cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_1_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v5, v6, "parameter ‘contact’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);
}

- (void)addSubgroup:(void *)a1 toGroup:.cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_1_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v5, v6, "parameter ‘subgroup’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);
}

@end