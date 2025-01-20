@interface CNCardGroupMembershipGroup
- (NSArray)groupsToDisplayForEditing;
- (NSArray)parentGroups;
- (id)displayItems;
- (id)editingItems;
- (id)groupItemsToDisplayForEditing;
- (id)parentGroupItems;
- (id)title;
- (void)setGroupsToDisplayForEditing:(id)a3;
- (void)setParentGroups:(id)a3;
@end

@implementation CNCardGroupMembershipGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsToDisplayForEditing, 0);

  objc_storeStrong((id *)&self->_parentGroups, 0);
}

- (void)setGroupsToDisplayForEditing:(id)a3
{
}

- (NSArray)groupsToDisplayForEditing
{
  return self->_groupsToDisplayForEditing;
}

- (void)setParentGroups:(id)a3
{
}

- (NSArray)parentGroups
{
  return self->_parentGroups;
}

- (id)groupItemsToDisplayForEditing
{
  v3 = [(CNCardGroupMembershipGroup *)self groupsToDisplayForEditing];

  if (v3)
  {
    v4 = [(CNCardGroupMembershipGroup *)self groupsToDisplayForEditing];
    v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_14_31021);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

CNCardGroupMembershipGroupItem *__59__CNCardGroupMembershipGroup_groupItemsToDisplayForEditing__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CNCardGroupMembershipGroupItem alloc] initWithGroup:v2];

  return v3;
}

- (id)parentGroupItems
{
  v3 = [(CNCardGroupMembershipGroup *)self parentGroups];

  if (v3)
  {
    v4 = [(CNCardGroupMembershipGroup *)self parentGroups];
    v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_31025);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

CNCardGroupMembershipGroupItem *__46__CNCardGroupMembershipGroup_parentGroupItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CNCardGroupMembershipGroupItem alloc] initWithGroup:v2];

  return v3;
}

- (id)editingItems
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(CNCardGroupMembershipGroup *)self groupItemsToDisplayForEditing];
  [v3 addObjectsFromArray:v4];
  v5 = objc_alloc_init(CNCardGroupMembershipPlaceholderGroupItem);
  [v3 addObject:v5];

  return v3;
}

- (id)displayItems
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(CNCardGroupMembershipGroup *)self parentGroupItems];
  [v3 addObjectsFromArray:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(CNCardGroup *)self actionItems];
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
        [v3 addObject:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)title
{
  uint64_t v3 = *MEMORY[0x1E4F5A258];
  v4 = [(CNCardGroupMembershipGroup *)self parentGroups];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if (v3)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v6 = [(CNCardGroupMembershipGroup *)self parentGroups];
    uint64_t v7 = [v6 count];

    uint64_t v8 = CNContactsUIBundle();
    v9 = v8;
    if (v7 == 1) {
      v10 = @"GROUP_MEMBERSHIP_TABLE_SECTION_TITLE_ONE";
    }
    else {
      v10 = @"GROUP_MEMBERSHIP_TABLE_SECTION_TITLE_MANY";
    }
    v5 = [v8 localizedStringForKey:v10 value:&stru_1ED8AC728 table:@"Localized"];
  }

  return v5;
}

@end