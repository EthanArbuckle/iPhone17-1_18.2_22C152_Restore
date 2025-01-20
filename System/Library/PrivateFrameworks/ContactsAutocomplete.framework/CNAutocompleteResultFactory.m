@interface CNAutocompleteResultFactory
+ (CNAutocompleteResultFactory)factoryWithPriorityDomain:(id)a3 sendingAddress:(id)a4;
- (CNAutocompleteResultFactory)initWithPriorityDomain:(id)a3 sendingAddress:(id)a4;
- (id)MAIDGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5;
- (id)MAIDResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 userInfo:(id)a6;
- (id)calendarServerResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 userInfo:(id)a6;
- (id)directoryServerResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5;
- (id)duetGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5;
- (id)duetResultWithDisplayName:(id)a3 value:(id)a4 contactIdentifier:(id)a5;
- (id)extensionGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5;
- (id)extensionResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5;
- (id)frequentRecentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 date:(id)a6 group:(BOOL)a7 completesChosenGroup:(BOOL)a8;
- (id)infrequentRecentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7 group:(BOOL)a8 completesChosenGroup:(BOOL)a9;
- (id)localContactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 contactIdentifier:(id)a6;
- (id)localGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4;
- (id)localGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5;
- (id)recentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7 group:(BOOL)a8 completesChosenGroup:(BOOL)a9;
- (id)suggestedResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5;
- (void)applyLastSendingAddressBitToResult:(id)a3;
- (void)applyPreferredDomainBitToResult:(id)a3;
- (void)applySearchContextToResult:(id)a3;
@end

@implementation CNAutocompleteResultFactory

+ (CNAutocompleteResultFactory)factoryWithPriorityDomain:(id)a3 sendingAddress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithPriorityDomain:v7 sendingAddress:v6];

  return (CNAutocompleteResultFactory *)v8;
}

- (CNAutocompleteResultFactory)initWithPriorityDomain:(id)a3 sendingAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNAutocompleteResultFactory *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    preferredDomain = v8->_preferredDomain;
    v8->_preferredDomain = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    sendingAddress = v8->_sendingAddress;
    v8->_sendingAddress = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)localContactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 contactIdentifier:(id)a6
{
  id v7 = +[CNAutocompleteResult contactResultWithDisplayName:a3 value:a4 nameComponents:a5 identifier:a6];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v7];
  [v7 setSourceType:2];
  return v7;
}

- (id)localGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4
{
  v5 = +[CNAutocompleteResult groupResultWithDisplayName:a3 identifier:a4];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v5];
  [v5 setSourceType:2];
  return v5;
}

- (id)localGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(CNAutocompleteResultFactory *)self localGroupResultWithDisplayName:a3 groupIdentifier:a4];
  [v9 setMembersProvider:v8];

  return v9;
}

- (id)duetGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(CNAutocompleteResultFactory *)self localGroupResultWithDisplayName:a3 groupIdentifier:a4];
  [v9 setMembersProvider:v8];

  [v9 setSourceType:16];
  return v9;
}

- (id)recentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7 group:(BOOL)a8 completesChosenGroup:(BOOL)a9
{
  if (a6 < 5)
  {
    LOBYTE(v11) = a9;
    -[CNAutocompleteResultFactory infrequentRecentResultWithDisplayName:value:lastSendingAddress:dateCount:date:group:completesChosenGroup:](self, "infrequentRecentResultWithDisplayName:value:lastSendingAddress:dateCount:date:group:completesChosenGroup:", a3, a4, a5, v11);
  }
  else
  {
    [(CNAutocompleteResultFactory *)self frequentRecentResultWithDisplayName:a3 value:a4 lastSendingAddress:a5 date:a7 group:a8 completesChosenGroup:a9];
  uint64_t v9 = };
  return v9;
}

- (id)frequentRecentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 date:(id)a6 group:(BOOL)a7 completesChosenGroup:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (a7)
  {
    id v18 = +[CNAutocompleteRecentResult groupResultWithDisplayName:v14 date:v17];
    [(CNAutocompleteResultFactory *)self applySearchContextToResult:v18];
    [v18 setSourceType:1];
  }
  else
  {
    id v18 = +[CNAutocompleteRecentResult contactResultWithDisplayName:v14 value:v15 lastSendingAddress:v16 date:v17];
    [(CNAutocompleteResultFactory *)self applySearchContextToResult:v18];
    [v18 setSourceType:1];
    if (a8)
    {
      objc_opt_class();
      id v18 = v18;
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      id v20 = v19;

      [v20 setCompletesChosenGroup:1];
    }
  }

  return v18;
}

- (id)infrequentRecentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7 group:(BOOL)a8 completesChosenGroup:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (a8)
  {
    id v19 = +[CNAutocompleteInfrequentRecentResult groupResultWithDisplayName:v15 dateCount:a6 date:v18];
    [(CNAutocompleteResultFactory *)self applySearchContextToResult:v19];
    [v19 setSourceType:1];
  }
  else
  {
    id v19 = +[CNAutocompleteInfrequentRecentResult contactResultWithDisplayName:v15 value:v16 lastSendingAddress:v17 dateCount:a6 date:v18];
    [(CNAutocompleteResultFactory *)self applySearchContextToResult:v19];
    [v19 setSourceType:1];
    if (a9)
    {
      objc_opt_class();
      id v19 = v19;
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;

      [v21 setCompletesChosenGroup:1];
    }
  }

  return v19;
}

- (id)suggestedResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5
{
  id v6 = +[CNAutocompleteResult contactResultWithDisplayName:a3 value:a4 nameComponents:a5 identifier:0];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v6];
  [v6 setSourceType:4];
  return v6;
}

- (id)MAIDResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 userInfo:(id)a6
{
  id v10 = a6;
  uint64_t v11 = +[CNAutocompleteResult contactResultWithDisplayName:a3 value:a4 nameComponents:a5 identifier:0];
  [v11 setUserInfo:v10];

  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v11];
  [v11 setSourceType:128];
  return v11;
}

- (id)MAIDGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5
{
  id v8 = a5;
  uint64_t v9 = +[CNAutocompleteResult groupResultWithDisplayName:a3 identifier:a4];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v9];
  [v9 setSourceType:128];
  [v9 setMembersProvider:v8];

  return v9;
}

- (id)extensionResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5
{
  id v6 = +[CNAutocompleteResult contactResultWithDisplayName:a3 value:a4 nameComponents:a5 identifier:0];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v6];
  [v6 setSourceType:256];
  return v6;
}

- (id)extensionGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5
{
  id v8 = a5;
  uint64_t v9 = +[CNAutocompleteResult groupResultWithDisplayName:a3 identifier:a4];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v9];
  [v9 setSourceType:256];
  [v9 setMembersProvider:v8];

  return v9;
}

- (id)directoryServerResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5
{
  id v6 = +[CNAutocompleteResult contactResultWithDisplayName:a3 value:a4 nameComponents:a5 identifier:0];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v6];
  [v6 setSourceType:8];
  return v6;
}

- (id)calendarServerResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 userInfo:(id)a6
{
  id v7 = +[CNAutocompleteCalendarServerResult contactResultWithDisplayName:a3 value:a4 nameComponents:a5 identifier:0 userInfo:a6];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v7];
  return v7;
}

- (id)duetResultWithDisplayName:(id)a3 value:(id)a4 contactIdentifier:(id)a5
{
  id v6 = +[CNAutocompleteResult contactResultWithDisplayName:a3 value:a4 nameComponents:0 identifier:a5];
  [(CNAutocompleteResultFactory *)self applySearchContextToResult:v6];
  [v6 setSourceType:16];
  return v6;
}

- (void)applySearchContextToResult:(id)a3
{
  id v4 = a3;
  [(CNAutocompleteResultFactory *)self applyPreferredDomainBitToResult:v4];
  [(CNAutocompleteResultFactory *)self applyLastSendingAddressBitToResult:v4];
}

- (void)applyPreferredDomainBitToResult:(id)a3
{
  id v6 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    id v4 = [v6 value];
    v5 = [v4 address];

    if ([v5 hasSuffix:self->_preferredDomain]) {
      [v6 setHasPreferredDomain:1];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)applyLastSendingAddressBitToResult:(id)a3
{
  id v9 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    objc_opt_class();
    id v4 = v9;
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      sendingAddress = self->_sendingAddress;
      id v8 = [v6 lastSendingAddress];
      LODWORD(sendingAddress) = [(NSString *)sendingAddress _cn_caseInsensitiveIsEqual:v8];

      if (sendingAddress) {
        [v6 setMatchesSendingAddress:1];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_preferredDomain, 0);
}

@end