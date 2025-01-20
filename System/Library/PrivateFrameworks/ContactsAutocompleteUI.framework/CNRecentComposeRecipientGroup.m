@interface CNRecentComposeRecipientGroup
- (CNRecentComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4 recentContact:(id)a5;
- (CRRecentContact)recentContact;
- (id)label;
- (id)placeholderName;
@end

@implementation CNRecentComposeRecipientGroup

- (CNRecentComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4 recentContact:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CNRecentComposeRecipientGroup;
  v10 = [(CNComposeRecipientGroup *)&v14 initWithChildren:a3 displayString:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_recentContact, a5);
    v12 = v11;
  }

  return v11;
}

- (id)label
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"RECENT_GROUP" value:&stru_1F0EC0C28 table:@"Localized"];

  return v3;
}

- (id)placeholderName
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"RECENT_GROUP_PLACEHOLDER" value:&stru_1F0EC0C28 table:@"Localized"];

  return v3;
}

- (CRRecentContact)recentContact
{
  return self->_recentContact;
}

- (void).cxx_destruct
{
}

@end