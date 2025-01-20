@interface AMSRenewAccountCredentialsFollowUpItem
+ (id)clear;
- (AMSRenewAccountCredentialsFollowUpItem)initWithAccount:(id)a3 bag:(id)a4;
@end

@implementation AMSRenewAccountCredentialsFollowUpItem

+ (id)clear
{
  v2 = objc_alloc_init(AMSFollowUp);
  v3 = [(AMSFollowUp *)v2 clearFollowUpWithBackingIdentifier:@"com.apple.SSFollowUpIdentifier.RenewCredentials"];

  return v3;
}

- (AMSRenewAccountCredentialsFollowUpItem)initWithAccount:(id)a3 bag:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSRenewAccountCredentialsFollowUpItem;
  v7 = [(AMSFollowUpItem *)&v16 initWithIdentifier:@"com.apple.SSFollowUpIdentifier.RenewCredentials" account:a3 priority:0];
  v8 = v7;
  if (v7)
  {
    [(AMSFollowUpItem *)v7 setDisplayStyle:0];
    v9 = AMSLocalizedString(@"FOLLOWUP_RENEW_CREDENTIALS_MESSAGE", v6);
    [(AMSFollowUpItem *)v8 setInformativeText:v9];

    v10 = AMSLocalizedString(@"FOLLOWUP_RENEW_APPLE_ACCOUNT_CREDENTIALS_TITLE", v6);
    [(AMSFollowUpItem *)v8 setTitle:v10];

    v11 = [AMSFollowUpAction alloc];
    v12 = AMSLocalizedString(@"FOLLOWUP_RENEW_CREDENTIALS_PRIMARY", v6);
    v13 = [(AMSFollowUpAction *)v11 initWithLabel:v12 parentIdentifier:@"com.apple.SSFollowUpIdentifier.RenewCredentials"];

    [(AMSFollowUpAction *)v13 setIdentifier:*MEMORY[0x1E4F4BF50]];
    v17[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(AMSFollowUpItem *)v8 setActions:v14];
  }
  return v8;
}

@end