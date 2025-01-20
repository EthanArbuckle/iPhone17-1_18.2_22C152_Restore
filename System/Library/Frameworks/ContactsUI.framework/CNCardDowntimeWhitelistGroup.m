@interface CNCardDowntimeWhitelistGroup
- (BOOL)isMultiValue;
- (BOOL)modified;
- (id)displayItems;
- (id)editingItems;
- (id)policyForItem:(id)a3;
@end

@implementation CNCardDowntimeWhitelistGroup

- (BOOL)isMultiValue
{
  return 0;
}

- (id)policyForItem:(id)a3
{
  v3 = objc_alloc_init(CNReadonlyPolicy);

  return v3;
}

- (BOOL)modified
{
  return 0;
}

- (id)editingItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1B9C8];
  v4 = [(CNCardGroup *)self contact];
  LODWORD(v3) = [v3 isWhitelistedContact:v4];

  if (v3)
  {
    v5 = [(CNCardGroup *)self contact];
    v6 = +[CNPropertyGroupItem propertyGroupItemWithLabel:&stru_1ED8AC728 group:self contact:v5];
    v9[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)displayItems
{
  return 0;
}

@end