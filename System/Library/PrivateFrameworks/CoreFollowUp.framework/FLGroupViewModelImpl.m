@interface FLGroupViewModelImpl
- (BOOL)needsAccountID;
- (BOOL)restrictionEnabled;
- (BOOL)shouldCoalesceItems;
- (FLGroupViewModelImpl)initWithIdentifier:(id)a3;
- (NSString)accountID;
- (NSString)description;
- (NSString)groupTitle;
- (NSString)identifier;
- (NSString)rowTitle;
- (id)_expirationOrInformativeText;
- (id)footerText;
- (id)items;
- (id)subtitleText;
- (void)addItem:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setGroupTitle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNeedsAccountID:(BOOL)a3;
- (void)setRowTitle:(id)a3;
@end

@implementation FLGroupViewModelImpl

- (BOOL)shouldCoalesceItems
{
  if ([(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.account"]
    || [(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.services"]
    || [(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.ndo"])
  {
    v3 = [(FLGroupViewModelImpl *)self items];
    BOOL v4 = (unint64_t)[v3 count] > 1;
  }
  else
  {
    if (![(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.device"])
    {
      [(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.none"];
      return 0;
    }
    v3 = [(FLGroupViewModelImpl *)self items];
    BOOL v4 = (unint64_t)[v3 count] > 2;
  }
  BOOL v5 = v4;

  return v5;
}

- (id)items
{
  v2 = (void *)[(NSMutableArray *)self->_mutableItems copy];

  return v2;
}

- (FLGroupViewModelImpl)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [(FLGroupViewModelImpl *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (void)setRowTitle:(id)a3
{
}

- (void)setNeedsAccountID:(BOOL)a3
{
  self->_needsAccountID = a3;
}

- (void)setAccountID:(id)a3
{
}

- (void)setGroupTitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (id)footerText
{
  if ([(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.ndo"])
  {
    if ([(FLGroupViewModelImpl *)self shouldCoalesceItems])
    {
      v3 = [(NSMutableArray *)self->_mutableItems firstObject];
      BOOL v4 = [v3 userInfo];
      id v5 = [v4 objectForKeyedSubscript:@"FLUserInfoPropertyCoalescedGroupFooterText"];

      if (v5)
      {
        v6 = [(NSMutableArray *)self->_mutableItems firstObject];
        v7 = [v6 userInfo];
        v8 = [v7 objectForKeyedSubscript:@"FLUserInfoPropertyCoalescedGroupFooterText"];

        goto LABEL_8;
      }
    }
  }
  else if ([(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.services"])
  {
    v8 = 0;
    goto LABEL_8;
  }
  v8 = [(FLGroupViewModelImpl *)self _expirationOrInformativeText];
LABEL_8:

  return v8;
}

- (id)_expirationOrInformativeText
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v4 = self->_mutableItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v11 = [v10 informativeFooterText];

        if (v11)
        {
          uint64_t v12 = [v10 informativeFooterText];

          v7 = (void *)v12;
        }
        if ([v10 displayExpirationDate])
        {
          [v3 addObject:v10];
          uint64_t v13 = [v10 formattedExpirationDate];

          v7 = (void *)v13;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if ((unint64_t)[v3 count] >= 2)
  {
    [v3 sortUsingComparator:&__block_literal_global_12];
    v14 = [v3 firstObject];
    v15 = +[FLFollowUpItem _expirationDateFormatter];
    v16 = [v14 _midnightAdjustedDate];
    v17 = [v15 stringFromDate:v16];

    v18 = NSString;
    v19 = FLLoc(@"EARLIEST_ITEM_EXPIRATION_FORMAT");
    uint64_t v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);

    v7 = (void *)v20;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ - \x10%@ - %@ - %@", self->_rowTitle, self->_groupTitle, self->_identifier, self->_mutableItems];
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  mutableItems = self->_mutableItems;
  id v8 = v4;
  if (!mutableItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_mutableItems;
    self->_mutableItems = v6;

    id v4 = v8;
    mutableItems = self->_mutableItems;
  }
  [(NSMutableArray *)mutableItems addObject:v4];
}

- (id)subtitleText
{
  if ([(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.services"])
  {
    v3 = [(FLGroupViewModelImpl *)self _expirationOrInformativeText];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __52__FLGroupViewModelImpl__expirationOrInformativeText__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 expirationDate];
  uint64_t v6 = [v4 expirationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)restrictionEnabled
{
  if (![(NSString *)self->_identifier isEqualToString:@"com.apple.followup.group.account"]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] == 2;

  return v3;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)rowTitle
{
  return self->_rowTitle;
}

- (BOOL)needsAccountID
{
  return self->_needsAccountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_groupTitle, 0);
  objc_storeStrong((id *)&self->_rowTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_mutableItems, 0);
}

@end