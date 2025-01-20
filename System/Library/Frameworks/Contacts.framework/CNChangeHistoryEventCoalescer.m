@interface CNChangeHistoryEventCoalescer
+ (id)coalesceEvents:(id)a3;
+ (id)coalescingLog;
- (CNChangeHistoryEventCoalescer)init;
- (NSArray)events;
- (void)visitAddContactEvent:(id)a3;
- (void)visitAddGroupEvent:(id)a3;
- (void)visitAddMemberToGroupEvent:(id)a3;
- (void)visitAddSubgroupToGroupEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDeleteGroupEvent:(id)a3;
- (void)visitDifferentMeCardEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitLinkContactsEvent:(id)a3;
- (void)visitPreferredContactForImageEvent:(id)a3;
- (void)visitPreferredContactForNameEvent:(id)a3;
- (void)visitRemoveMemberFromGroupEvent:(id)a3;
- (void)visitRemoveSubgroupFromGroupEvent:(id)a3;
- (void)visitUnlinkContactEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
- (void)visitUpdateGroupEvent:(id)a3;
@end

@implementation CNChangeHistoryEventCoalescer

+ (id)coalescingLog
{
  if (coalescingLog_cn_once_token_0 != -1) {
    dispatch_once(&coalescingLog_cn_once_token_0, &__block_literal_global_4);
  }
  v2 = (void *)coalescingLog_cn_once_object_0;

  return v2;
}

uint64_t __46__CNChangeHistoryEventCoalescer_coalescingLog__block_invoke()
{
  coalescingLog_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts", "change-history-coalescing");

  return MEMORY[0x1F41817F8]();
}

+ (id)coalesceEvents:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(CNChangeHistoryEventCoalescer);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "acceptEventVisitor:", v4, (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(CNChangeHistoryEventCoalescer *)v4 events];

  return v10;
}

- (CNChangeHistoryEventCoalescer)init
{
  v25.receiver = self;
  v25.super_class = (Class)CNChangeHistoryEventCoalescer;
  v2 = [(CNChangeHistoryEventCoalescer *)&v25 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    controlEvents = v2->_controlEvents;
    v2->_controlEvents = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    addedContacts = v2->_addedContacts;
    v2->_addedContacts = (CNMutableOrderedDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    updatedContacts = v2->_updatedContacts;
    v2->_updatedContacts = (CNMutableOrderedDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    deletedContacts = v2->_deletedContacts;
    v2->_deletedContacts = (CNMutableOrderedDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    addedGroups = v2->_addedGroups;
    v2->_addedGroups = (CNMutableOrderedDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    updatedGroups = v2->_updatedGroups;
    v2->_updatedGroups = (CNMutableOrderedDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    deletedGroups = v2->_deletedGroups;
    v2->_deletedGroups = (CNMutableOrderedDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    contactLinkingEvents = v2->_contactLinkingEvents;
    v2->_contactLinkingEvents = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    groupMembershipEvents = v2->_groupMembershipEvents;
    v2->_groupMembershipEvents = (NSMutableArray *)v19;

    uint64_t v21 = objc_opt_new();
    otherContactEvents = v2->_otherContactEvents;
    v2->_otherContactEvents = (NSMutableArray *)v21;

    v23 = v2;
  }

  return v2;
}

- (NSArray)events
{
  uint64_t v3 = objc_opt_new();
  [v3 addObjectsFromArray:self->_controlEvents];
  v4 = [(CNMutableOrderedDictionary *)self->_addedContacts allObjects];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(CNMutableOrderedDictionary *)self->_updatedContacts allObjects];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = [(CNMutableOrderedDictionary *)self->_deletedContacts allObjects];
  [v3 addObjectsFromArray:v6];

  uint64_t v7 = [(CNMutableOrderedDictionary *)self->_addedGroups allObjects];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = [(CNMutableOrderedDictionary *)self->_updatedGroups allObjects];
  [v3 addObjectsFromArray:v8];

  uint64_t v9 = [(CNMutableOrderedDictionary *)self->_deletedGroups allObjects];
  [v3 addObjectsFromArray:v9];

  [v3 addObjectsFromArray:self->_contactLinkingEvents];
  [v3 addObjectsFromArray:self->_groupMembershipEvents];
  [v3 addObjectsFromArray:self->_otherContactEvents];

  return (NSArray *)v3;
}

- (void)visitDropEverythingEvent:(id)a3
{
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 contact];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = [(CNMutableOrderedDictionary *)self->_addedContacts objectForKeyedSubscript:v6];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() coalescingLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNChangeHistoryEventCoalescer visitAddContactEvent:]();
    }

    [(CNMutableOrderedDictionary *)self->_addedContacts setObject:v4 forKeyedSubscript:v6];
  }
  else
  {
    uint64_t v9 = [(CNMutableOrderedDictionary *)self->_updatedContacts objectForKeyedSubscript:v6];
    if (v9)
    {
      v10 = [(id)objc_opt_class() coalescingLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CNChangeHistoryEventCoalescer visitAddContactEvent:]();
      }

      uint64_t v11 = [CNChangeHistoryUpdateContactEvent alloc];
      long long v12 = [v4 contact];
      uint64_t v13 = [(CNChangeHistoryUpdateContactEvent *)v11 initWithContact:v12 imagesChanged:1];
      [(CNMutableOrderedDictionary *)self->_updatedContacts setObject:v13 forKeyedSubscript:v6];
    }
    else
    {
      long long v12 = [(CNMutableOrderedDictionary *)self->_deletedContacts objectForKeyedSubscript:v6];
      if (v12)
      {
        long long v14 = [(id)objc_opt_class() coalescingLog];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CNChangeHistoryEventCoalescer visitAddContactEvent:]();
        }

        [(CNMutableOrderedDictionary *)self->_deletedContacts setObject:0 forKeyedSubscript:v6];
        uint64_t v15 = [CNChangeHistoryUpdateContactEvent alloc];
        v16 = [v4 contact];
        uint64_t v17 = [(CNChangeHistoryUpdateContactEvent *)v15 initWithContact:v16 imagesChanged:1];
        [(CNMutableOrderedDictionary *)self->_updatedContacts setObject:v17 forKeyedSubscript:v6];
      }
      else
      {
        [(CNMutableOrderedDictionary *)self->_addedContacts setObject:v4 forKeyedSubscript:v6];
      }
    }
  }
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 contact];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = [(CNMutableOrderedDictionary *)self->_addedContacts objectForKeyedSubscript:v6];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() coalescingLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:]();
    }

    uint64_t v9 = [CNChangeHistoryAddContactEvent alloc];
    v10 = [v4 contact];
    uint64_t v11 = [v7 containerIdentifier];
    long long v12 = [(CNChangeHistoryAddContactEvent *)v9 initWithContact:v10 containerIdentifier:v11];
    [(CNMutableOrderedDictionary *)self->_addedContacts setObject:v12 forKeyedSubscript:v6];
  }
  else
  {
    v10 = [(CNMutableOrderedDictionary *)self->_updatedContacts objectForKeyedSubscript:v6];
    if (v10)
    {
      uint64_t v13 = [(id)objc_opt_class() coalescingLog];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:]();
      }

      [(CNMutableOrderedDictionary *)self->_updatedContacts setObject:v4 forKeyedSubscript:v6];
    }
    else
    {
      long long v14 = [(CNMutableOrderedDictionary *)self->_deletedContacts objectForKeyedSubscript:v6];
      if (v14)
      {
        uint64_t v15 = [(id)objc_opt_class() coalescingLog];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:]();
        }

        [(CNMutableOrderedDictionary *)self->_updatedContacts setObject:v4 forKeyedSubscript:v6];
        deletedContacts = self->_deletedContacts;
        id v17 = 0;
      }
      else
      {
        deletedContacts = self->_updatedContacts;
        id v17 = v4;
      }
      [(CNMutableOrderedDictionary *)deletedContacts setObject:v17 forKeyedSubscript:v6];
    }
  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 contactIdentifier];
  uint64_t v6 = [(CNMutableOrderedDictionary *)self->_addedContacts objectForKeyedSubscript:v5];
  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() coalescingLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:]();
    }

    [(CNMutableOrderedDictionary *)self->_addedContacts setObject:0 forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v8 = [(CNMutableOrderedDictionary *)self->_updatedContacts objectForKeyedSubscript:v5];
    if (v8)
    {
      uint64_t v9 = [(id)objc_opt_class() coalescingLog];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:]();
      }

      [(CNMutableOrderedDictionary *)self->_updatedContacts setObject:0 forKeyedSubscript:v5];
      [(CNMutableOrderedDictionary *)self->_deletedContacts setObject:v4 forKeyedSubscript:v5];
    }
    else
    {
      v10 = [(CNMutableOrderedDictionary *)self->_deletedContacts objectForKeyedSubscript:v5];
      if (v10)
      {
        uint64_t v11 = [(id)objc_opt_class() coalescingLog];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:]();
        }
      }
      [(CNMutableOrderedDictionary *)self->_deletedContacts setObject:v4 forKeyedSubscript:v5];
    }
  }
}

- (void)visitAddGroupEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 group];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = [(CNMutableOrderedDictionary *)self->_addedGroups objectForKeyedSubscript:v6];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() coalescingLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNChangeHistoryEventCoalescer visitAddGroupEvent:]();
    }

    [(CNMutableOrderedDictionary *)self->_addedGroups setObject:v4 forKeyedSubscript:v6];
  }
  else
  {
    uint64_t v9 = [(CNMutableOrderedDictionary *)self->_updatedGroups objectForKeyedSubscript:v6];
    if (v9)
    {
      v10 = [(id)objc_opt_class() coalescingLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CNChangeHistoryEventCoalescer visitAddGroupEvent:]();
      }

      uint64_t v11 = [CNChangeHistoryUpdateGroupEvent alloc];
      long long v12 = [v4 group];
      uint64_t v13 = [(CNChangeHistoryUpdateGroupEvent *)v11 initWithGroup:v12];
      [(CNMutableOrderedDictionary *)self->_updatedGroups setObject:v13 forKeyedSubscript:v6];
    }
    else
    {
      long long v12 = [(CNMutableOrderedDictionary *)self->_deletedGroups objectForKeyedSubscript:v6];
      if (v12)
      {
        long long v14 = [(id)objc_opt_class() coalescingLog];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[CNChangeHistoryEventCoalescer visitAddGroupEvent:]();
        }

        uint64_t v15 = [CNChangeHistoryUpdateGroupEvent alloc];
        v16 = [v4 group];
        id v17 = [(CNChangeHistoryUpdateGroupEvent *)v15 initWithGroup:v16];
        [(CNMutableOrderedDictionary *)self->_updatedGroups setObject:v17 forKeyedSubscript:v6];

        deletedGroups = self->_deletedGroups;
        id v19 = 0;
      }
      else
      {
        deletedGroups = self->_addedGroups;
        id v19 = v4;
      }
      [(CNMutableOrderedDictionary *)deletedGroups setObject:v19 forKeyedSubscript:v6];
    }
  }
}

- (void)visitUpdateGroupEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 group];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = [(CNMutableOrderedDictionary *)self->_addedGroups objectForKeyedSubscript:v6];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() coalescingLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:]();
    }

    uint64_t v9 = [CNChangeHistoryAddGroupEvent alloc];
    v10 = [v4 group];
    uint64_t v11 = [v7 containerIdentifier];
    long long v12 = [(CNChangeHistoryAddGroupEvent *)v9 initWithGroup:v10 containerIdentifier:v11];
    [(CNMutableOrderedDictionary *)self->_addedGroups setObject:v12 forKeyedSubscript:v6];
  }
  else
  {
    v10 = [(CNMutableOrderedDictionary *)self->_updatedGroups objectForKeyedSubscript:v6];
    if (v10)
    {
      uint64_t v13 = [(id)objc_opt_class() coalescingLog];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:]();
      }

      [(CNMutableOrderedDictionary *)self->_updatedGroups setObject:v4 forKeyedSubscript:v6];
    }
    else
    {
      long long v14 = [(CNMutableOrderedDictionary *)self->_deletedGroups objectForKeyedSubscript:v6];
      if (v14)
      {
        uint64_t v15 = [(id)objc_opt_class() coalescingLog];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CNChangeHistoryEventCoalescer visitUpdateContactEvent:]();
        }

        [(CNMutableOrderedDictionary *)self->_updatedGroups setObject:v4 forKeyedSubscript:v6];
        deletedGroups = self->_deletedGroups;
        id v17 = 0;
      }
      else
      {
        deletedGroups = self->_updatedGroups;
        id v17 = v4;
      }
      [(CNMutableOrderedDictionary *)deletedGroups setObject:v17 forKeyedSubscript:v6];
    }
  }
}

- (void)visitDeleteGroupEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 groupIdentifier];
  uint64_t v6 = [(CNMutableOrderedDictionary *)self->_addedGroups objectForKeyedSubscript:v5];
  if (v6)
  {
    [(CNMutableOrderedDictionary *)self->_addedGroups setObject:0 forKeyedSubscript:v5];
    uint64_t v7 = [(id)objc_opt_class() coalescingLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:]();
    }
  }
  else
  {
    uint64_t v7 = [(CNMutableOrderedDictionary *)self->_updatedGroups objectForKeyedSubscript:v5];
    if (v7)
    {
      uint64_t v8 = [(id)objc_opt_class() coalescingLog];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:]();
      }

      [(CNMutableOrderedDictionary *)self->_updatedGroups setObject:0 forKeyedSubscript:v5];
      [(CNMutableOrderedDictionary *)self->_deletedGroups setObject:v4 forKeyedSubscript:v5];
    }
    else
    {
      uint64_t v9 = [(CNMutableOrderedDictionary *)self->_deletedGroups objectForKeyedSubscript:v5];
      if (v9)
      {
        v10 = [(id)objc_opt_class() coalescingLog];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CNChangeHistoryEventCoalescer visitDeleteContactEvent:]();
        }
      }
      [(CNMutableOrderedDictionary *)self->_deletedGroups setObject:v4 forKeyedSubscript:v5];
    }
  }
}

- (void)visitAddMemberToGroupEvent:(id)a3
{
}

- (void)visitRemoveMemberFromGroupEvent:(id)a3
{
}

- (void)visitAddSubgroupToGroupEvent:(id)a3
{
}

- (void)visitRemoveSubgroupFromGroupEvent:(id)a3
{
}

- (void)visitLinkContactsEvent:(id)a3
{
}

- (void)visitUnlinkContactEvent:(id)a3
{
}

- (void)visitPreferredContactForImageEvent:(id)a3
{
}

- (void)visitPreferredContactForNameEvent:(id)a3
{
}

- (void)visitDifferentMeCardEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherContactEvents, 0);
  objc_storeStrong((id *)&self->_groupMembershipEvents, 0);
  objc_storeStrong((id *)&self->_contactLinkingEvents, 0);
  objc_storeStrong((id *)&self->_deletedGroups, 0);
  objc_storeStrong((id *)&self->_updatedGroups, 0);
  objc_storeStrong((id *)&self->_addedGroups, 0);
  objc_storeStrong((id *)&self->_deletedContacts, 0);
  objc_storeStrong((id *)&self->_updatedContacts, 0);
  objc_storeStrong((id *)&self->_addedContacts, 0);

  objc_storeStrong((id *)&self->_controlEvents, 0);
}

- (void)visitAddContactEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Change history protocol error: Delete + Add (%{public}@); will treat as an Update.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)visitAddContactEvent:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Change history coalescing: Change history protocol error: Update + Add (%{public}@); will treat as an Update.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)visitAddContactEvent:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Change history coalescing: Change history protocol error: Add + Add (%{public}@); will treat as a single Add.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)visitUpdateContactEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Change history protocol error: Delete + Update (%{public}@); will treat as an Update.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)visitUpdateContactEvent:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1909E3000, v0, v1, "Change history coalescing: Update + Update -> Update (%@)", v2, v3, v4, v5, v6);
}

- (void)visitUpdateContactEvent:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1909E3000, v0, v1, "Change history coalescing: Add + Update -> Add (%@)", v2, v3, v4, v5, v6);
}

- (void)visitDeleteContactEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Change history protocol error: Delete + Delete (%{public}@); will treat as a single Delete.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)visitDeleteContactEvent:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1909E3000, v0, v1, "Change history coalescing: Update + Delete -> Delete (%@)", v2, v3, v4, v5, v6);
}

- (void)visitDeleteContactEvent:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1909E3000, v0, v1, "Change history coalescing: Add + Delete -> Delete (%@)", v2, v3, v4, v5, v6);
}

- (void)visitAddGroupEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1909E3000, v0, v1, "Change history coalescing: Delete + Add -> Update (%@)", v2, v3, v4, v5, v6);
}

- (void)visitAddGroupEvent:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Change history protocol error: Update + Add (%{public}@); will treat as an Update.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)visitAddGroupEvent:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Change history protocol error: Add + Add (%{public}@); will treat as a single Add.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end