@interface CNAccountsAndGroupsItem
- (BOOL)acceptsVCardDrop;
- (BOOL)bypassIfUnique;
- (BOOL)canDelete;
- (BOOL)canEmail;
- (BOOL)canExport;
- (BOOL)canMessage;
- (BOOL)canRename;
- (BOOL)canShowContextMenu;
- (BOOL)isEditable;
- (BOOL)isSelected;
- (BOOL)shouldHide;
- (BOOL)soloSelect;
- (CNAccountsAndGroupsItem)initWithType:(int64_t)a3 nameProvider:(id)a4;
- (CNAccountsAndGroupsItem)parentItem;
- (CNGroup)group;
- (NSArray)childItems;
- (NSString)contactCountString;
- (NSString)containerIdentifier;
- (NSString)identifier;
- (NSString)name;
- (UIImage)groupSymbol;
- (id)arrayForDisplay:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nameProvider;
- (int64_t)contactCount;
- (int64_t)containerType;
- (int64_t)localizedCompare:(id)a3;
- (int64_t)type;
- (void)setBypassIfUnique:(BOOL)a3;
- (void)setChildItems:(id)a3;
- (void)setContactCount:(int64_t)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setContainerType:(int64_t)a3;
- (void)setGroup:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setParentItem:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 affectingChildren:(BOOL)a4;
- (void)setShouldHide:(BOOL)a3;
- (void)setSoloSelect:(BOOL)a3;
@end

@implementation CNAccountsAndGroupsItem

- (CNAccountsAndGroupsItem)initWithType:(int64_t)a3 nameProvider:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNAccountsAndGroupsItem;
  v7 = [(CNAccountsAndGroupsItem *)&v12 init];
  v7->_type = a3;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    if (a3) {
      goto LABEL_5;
    }
    v8 = &__block_literal_global_30981;
  }
  uint64_t v9 = [v8 copy];
  id nameProvider = v7->_nameProvider;
  v7->_id nameProvider = (id)v9;

LABEL_5:
  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentItem);
  objc_storeStrong((id *)&self->_childItems, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_nameProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setSoloSelect:(BOOL)a3
{
  self->_soloSelect = a3;
}

- (BOOL)soloSelect
{
  return self->_soloSelect;
}

- (void)setShouldHide:(BOOL)a3
{
  self->_shouldHide = a3;
}

- (BOOL)shouldHide
{
  return self->_shouldHide;
}

- (void)setBypassIfUnique:(BOOL)a3
{
  self->_bypassIfUnique = a3;
}

- (BOOL)bypassIfUnique
{
  return self->_bypassIfUnique;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setParentItem:(id)a3
{
}

- (CNAccountsAndGroupsItem)parentItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentItem);

  return (CNAccountsAndGroupsItem *)WeakRetained;
}

- (NSArray)childItems
{
  return self->_childItems;
}

- (void)setContactCount:(int64_t)a3
{
  self->_contactCount = a3;
}

- (int64_t)contactCount
{
  return self->_contactCount;
}

- (void)setContainerType:(int64_t)a3
{
  self->_containerType = a3;
}

- (int64_t)containerType
{
  return self->_containerType;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setGroup:(id)a3
{
}

- (CNGroup)group
{
  return self->_group;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setName:(id)a3
{
}

- (id)nameProvider
{
  return self->_nameProvider;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CNAccountsAndGroupsItem alloc];
  int64_t v5 = [(CNAccountsAndGroupsItem *)self type];
  id v6 = [(CNAccountsAndGroupsItem *)self nameProvider];
  v7 = [(CNAccountsAndGroupsItem *)v4 initWithType:v5 nameProvider:v6];

  v8 = [(CNAccountsAndGroupsItem *)self containerIdentifier];
  [(CNAccountsAndGroupsItem *)v7 setContainerIdentifier:v8];

  [(CNAccountsAndGroupsItem *)v7 setContactCount:[(CNAccountsAndGroupsItem *)self contactCount]];
  uint64_t v9 = [(CNAccountsAndGroupsItem *)self childItems];
  [(CNAccountsAndGroupsItem *)v7 setChildItems:v9];

  v10 = [(CNAccountsAndGroupsItem *)self parentItem];
  [(CNAccountsAndGroupsItem *)v7 setParentItem:v10];

  [(CNAccountsAndGroupsItem *)v7 setBypassIfUnique:[(CNAccountsAndGroupsItem *)self bypassIfUnique]];
  [(CNAccountsAndGroupsItem *)v7 setSoloSelect:[(CNAccountsAndGroupsItem *)self soloSelect]];
  v11 = [(CNAccountsAndGroupsItem *)self identifier];
  [(CNAccountsAndGroupsItem *)v7 setIdentifier:v11];

  [(CNAccountsAndGroupsItem *)v7 setContainerType:[(CNAccountsAndGroupsItem *)self containerType]];
  [(CNAccountsAndGroupsItem *)v7 setSelected:[(CNAccountsAndGroupsItem *)self isSelected]];
  return v7;
}

- (UIImage)groupSymbol
{
  unint64_t v2 = [(CNAccountsAndGroupsItem *)self type];
  if (v2 <= 4 && ((0x17u >> v2) & 1) != 0)
  {
    v3 = [MEMORY[0x1E4FB1818] systemImageNamed:off_1E5498DA8[v2]];
  }
  else
  {
    v3 = 0;
  }

  return (UIImage *)v3;
}

- (NSString)contactCountString
{
  v3 = [(CNAccountsAndGroupsItem *)self identifier];
  char v4 = [v3 isEqualToString:@"groupPlaceholderIdentifier"];

  if (v4)
  {
    int64_t v5 = 0;
  }
  else
  {
    unint64_t v6 = [(CNAccountsAndGroupsItem *)self type];
    int64_t v5 = 0;
    if (v6 <= 4 && v6 != 3)
    {
      v7 = NSString;
      v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNAccountsAndGroupsItem contactCount](self, "contactCount"));
      int64_t v5 = [v7 localizedStringWithFormat:@"%@", v8];
    }
  }

  return (NSString *)v5;
}

- (int64_t)localizedCompare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNAccountsAndGroupsItem *)self name];
  unint64_t v6 = [v4 name];

  int64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

- (NSString)name
{
  if (!self->_name)
  {
    v3 = [(CNAccountsAndGroupsItem *)self nameProvider];

    if (v3)
    {
      id v4 = [(CNAccountsAndGroupsItem *)self nameProvider];
      v4[2]();
      int64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v5;
    }
  }
  int64_t v7 = self->_name;

  return v7;
}

- (id)arrayForDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (![(CNAccountsAndGroupsItem *)self shouldHide]) {
    [v5 addObject:self];
  }
  unint64_t v6 = [(CNAccountsAndGroupsItem *)self childItems];
  int64_t v7 = v6;
  if (v3 && [v6 count] == 1)
  {
    v8 = [v7 firstObject];
    if ([v8 bypassIfUnique])
    {
      uint64_t v9 = [v8 childItems];

      int64_t v7 = (void *)v9;
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "arrayForDisplay:", v3, (void)v17);
        [v5 addObjectsFromArray:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected == a3) {
    return;
  }
  BOOL v3 = a3;
  p_parentItem = &self->_parentItem;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentItem);
  if (![WeakRetained isSelected])
  {

    goto LABEL_6;
  }
  BOOL v7 = [(CNAccountsAndGroupsItem *)self soloSelect];

  if (!v7)
  {
LABEL_6:
    uint64_t v9 = self;
    uint64_t v10 = v3;
    uint64_t v11 = 1;
    goto LABEL_7;
  }
  id v8 = objc_loadWeakRetained((id *)p_parentItem);
  [v8 setSelected:0 affectingChildren:1];

  uint64_t v9 = self;
  uint64_t v10 = 1;
  uint64_t v11 = 0;
LABEL_7:

  [(CNAccountsAndGroupsItem *)v9 setSelected:v10 affectingChildren:v11];
}

- (void)setSelected:(BOOL)a3 affectingChildren:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_selected != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    [(CNAccountsAndGroupsItem *)self willChangeValueForKey:@"selected"];
    self->_selected = v5;
    if (!self->_type)
    {
      BOOL v7 = CNContactsUIBundle();
      id v8 = v7;
      if (v5) {
        uint64_t v9 = @"HIDE_ALL_CONTACTS";
      }
      else {
        uint64_t v9 = @"SHOW_ALL_CONTACTS";
      }
      uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_1ED8AC728 table:@"Localized"];
      [(CNAccountsAndGroupsItem *)self setName:v10];
    }
    [(CNAccountsAndGroupsItem *)self didChangeValueForKey:@"selected"];
    if (v4)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v11 = [(CNAccountsAndGroupsItem *)self childItems];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v17 + 1) + 8 * v15++) setSelected:v5 affectingChildren:1];
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }
    if (!v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_parentItem);
      [WeakRetained setSelected:0 affectingChildren:0];
    }
  }
}

- (void)setChildItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (NSArray *)a3;
  if (self->_childItems != v5)
  {
    objc_storeStrong((id *)&self->_childItems, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unint64_t v6 = v5;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setParentItem:", self, (void)v11);
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)canDelete
{
  return [(CNAccountsAndGroupsItem *)self type] == 4;
}

- (BOOL)canRename
{
  return [(CNAccountsAndGroupsItem *)self type] == 4;
}

- (BOOL)canExport
{
  return [(CNAccountsAndGroupsItem *)self type] != 3
      && [(CNAccountsAndGroupsItem *)self contactCount] > 0;
}

- (BOOL)canMessage
{
  return [(CNAccountsAndGroupsItem *)self type] != 3
      && [(CNAccountsAndGroupsItem *)self contactCount] >= 1
      && [(CNAccountsAndGroupsItem *)self contactCount] < 32;
}

- (BOOL)canEmail
{
  return [(CNAccountsAndGroupsItem *)self type] != 3
      && [(CNAccountsAndGroupsItem *)self contactCount] >= 1
      && [(CNAccountsAndGroupsItem *)self contactCount] < 101;
}

- (BOOL)canShowContextMenu
{
  return [(CNAccountsAndGroupsItem *)self type] != 3;
}

- (BOOL)acceptsVCardDrop
{
  return [(CNAccountsAndGroupsItem *)self type] == 4
      || [(CNAccountsAndGroupsItem *)self type] == 2
      || [(CNAccountsAndGroupsItem *)self type] == 1;
}

- (BOOL)isEditable
{
  if ([(CNAccountsAndGroupsItem *)self canRename]) {
    return 1;
  }

  return [(CNAccountsAndGroupsItem *)self canDelete];
}

id __53__CNAccountsAndGroupsItem_initWithType_nameProvider___block_invoke()
{
  v0 = CNContactsUIBundle();
  v1 = [v0 localizedStringForKey:@"ALL_CONTACTS_FOR_ACCOUNT" value:&stru_1ED8AC728 table:@"Localized"];

  return v1;
}

@end