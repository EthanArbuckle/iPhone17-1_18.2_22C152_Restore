@interface CNMeCardSharedProfileGroup
- (CNContactSharedProfileSettingsAction)sharedProfileSettingsAction;
- (id)displayItems;
- (void)setSharedProfileSettingsAction:(id)a3;
@end

@implementation CNMeCardSharedProfileGroup

- (void).cxx_destruct
{
}

- (void)setSharedProfileSettingsAction:(id)a3
{
}

- (CNContactSharedProfileSettingsAction)sharedProfileSettingsAction
{
  return self->_sharedProfileSettingsAction;
}

- (id)displayItems
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNMeCardSharedProfileGroup *)self sharedProfileSettingsAction];

  if (v3)
  {
    v4 = objc_alloc_init(CNMeCardSharedProfileGroupActionItem);
    v5 = [(CNMeCardSharedProfileGroup *)self sharedProfileSettingsAction];
    [(CNMeCardSharedProfileGroupActionItem *)v4 setSharedProfileSettingsAction:v5];

    v8[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

@end