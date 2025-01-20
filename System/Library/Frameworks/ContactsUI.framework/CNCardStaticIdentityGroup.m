@interface CNCardStaticIdentityGroup
- (BOOL)canAddEditingItem;
- (BOOL)didChange;
- (BOOL)isMultiValue;
- (BOOL)saveChangesToKTStore;
- (CNCardStaticIdentityGroup)initWithContact:(id)a3;
- (NSArray)staticIdentities;
- (id)currentIdentity;
- (id)displayItems;
- (id)editingItems;
- (void)addIdentity:(id)a3 isNew:(BOOL)a4;
- (void)clearDisplay;
- (void)removeEditingItem:(id)a3;
- (void)setDidChange:(BOOL)a3;
- (void)setStaticIdentities:(id)a3;
@end

@implementation CNCardStaticIdentityGroup

- (void).cxx_destruct
{
}

- (void)setStaticIdentities:(id)a3
{
}

- (NSArray)staticIdentities
{
  return self->_staticIdentities;
}

- (void)setDidChange:(BOOL)a3
{
  self->_didChange = a3;
}

- (BOOL)didChange
{
  return self->_didChange;
}

- (BOOL)saveChangesToKTStore
{
  if (![(CNCardStaticIdentityGroup *)self didChange]) {
    return 1;
  }
  v3 = [(CNCardStaticIdentityGroup *)self staticIdentities];
  uint64_t v4 = [v3 count];

  v5 = (void *)MEMORY[0x1E4F5A700];
  if (v4)
  {
    v6 = [(CNCardStaticIdentityGroup *)self staticIdentities];
    v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [(CNCardGroup *)self contact];
    char v9 = [v5 addStaticKeyWithPublicIDString:v7 contact:v8];
  }
  else
  {
    v6 = [(CNCardGroup *)self contact];
    [v5 removeAccountKeyFromContact:v6];
    char v9 = 1;
  }

  self->_didChange = 0;
  return v9;
}

- (id)editingItems
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(CNCardStaticIdentityGroup *)self displayItems];
  if ([v2 count])
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = objc_alloc_init(CNCardStaticIdentityPlaceholderGroupItem);
    v6[0] = v4;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }

  return v3;
}

- (id)displayItems
{
  v2 = [(CNCardStaticIdentityGroup *)self staticIdentities];
  id v3 = objc_msgSend(v2, "_cn_map:", &__block_literal_global_37621);

  return v3;
}

CNCardStaticIdentityGroupItem *__41__CNCardStaticIdentityGroup_displayItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNCardStaticIdentityGroupItem alloc] initWithIdentity:v2];

  return v3;
}

- (BOOL)isMultiValue
{
  return 0;
}

- (void)removeEditingItem:(id)a3
{
  id v7 = a3;
  if (![(CNCardStaticIdentityGroup *)self didChange])
  {
    uint64_t v4 = [v7 identity];
    -[CNCardStaticIdentityGroup setDidChange:](self, "setDidChange:", [v4 isEqualToString:@" "] ^ 1);
  }
  v5 = [MEMORY[0x1E4F1C978] array];
  staticIdentities = self->_staticIdentities;
  self->_staticIdentities = v5;
}

- (id)currentIdentity
{
  id v3 = [(CNCardStaticIdentityGroup *)self staticIdentities];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(CNCardStaticIdentityGroup *)self staticIdentities];
    v6 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canAddEditingItem
{
  return 0;
}

- (void)clearDisplay
{
  id v3 = [MEMORY[0x1E4F1C978] array];
  staticIdentities = self->_staticIdentities;
  self->_staticIdentities = v3;

  self->_didChange = 0;
}

- (void)addIdentity:(id)a3 isNew:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
  [(CNCardStaticIdentityGroup *)self setStaticIdentities:v6];

  if (v4 && ([v7 isEqualToString:@" "] & 1) == 0) {
    self->_didChange = 1;
  }
}

- (CNCardStaticIdentityGroup)initWithContact:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNCardStaticIdentityGroup;
  id v3 = [(CNCardGroup *)&v7 initWithContact:a3];
  BOOL v4 = v3;
  if (v3)
  {
    [(CNCardStaticIdentityGroup *)v3 clearDisplay];
    v5 = v4;
  }

  return v4;
}

@end