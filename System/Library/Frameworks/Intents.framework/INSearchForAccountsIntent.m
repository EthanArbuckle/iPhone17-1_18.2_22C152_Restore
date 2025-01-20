@interface INSearchForAccountsIntent
+ (BOOL)supportsSecureCoding;
- (INAccountType)accountType;
- (INBalanceType)requestedBalanceType;
- (INSearchForAccountsIntent)initWithAccountNickname:(INSpeakableString *)accountNickname accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName requestedBalanceType:(INBalanceType)requestedBalanceType;
- (INSpeakableString)accountNickname;
- (INSpeakableString)organizationName;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAccountNickname:(id)a3;
- (void)setAccountType:(int64_t)a3;
- (void)setOrganizationName:(id)a3;
- (void)setRequestedBalanceType:(int64_t)a3;
@end

@implementation INSearchForAccountsIntent

- (id)verb
{
  return @"SearchForAccounts";
}

- (id)domain
{
  return @"Payments";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"accountNickname";
  v3 = [(INSearchForAccountsIntent *)self accountNickname];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v4;
  v15[1] = @"accountType";
  INAccountType v5 = [(INSearchForAccountsIntent *)self accountType];
  if ((unint64_t)(v5 - 1) > 6) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E55193D0[v5 - 1];
  }
  v7 = v6;
  v16[1] = v7;
  v15[2] = @"organizationName";
  v8 = [(INSearchForAccountsIntent *)self organizationName];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v9;
  v15[3] = @"requestedBalanceType";
  INBalanceType v10 = [(INSearchForAccountsIntent *)self requestedBalanceType];
  if ((unint64_t)(v10 - 1) > 2) {
    v11 = @"unknown";
  }
  else {
    v11 = off_1E5517F68[v10 - 1];
  }
  v12 = v11;
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  if (!v8) {
  if (!v3)
  }

  return v13;
}

- (void)setRequestedBalanceType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  v4 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasRequestedBalanceType:0];
  }
  else {
    objc_msgSend(v4, "setRequestedBalanceType:");
  }
}

- (INBalanceType)requestedBalanceType
{
  unint64_t v3 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  int v4 = [v3 hasRequestedBalanceType];
  id v5 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 requestedBalanceType] - 1;
  if (v6 <= 2) {
    INBalanceType v7 = v6 + 1;
  }
  else {
    INBalanceType v7 = INBalanceTypeUnknown;
  }
  if (v4) {
    INBalanceType v8 = v7;
  }
  else {
    INBalanceType v8 = INBalanceTypeUnknown;
  }

  return v8;
}

- (void)setOrganizationName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setOrganizationName:v5];
}

- (INSpeakableString)organizationName
{
  v2 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 organizationName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setAccountType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 6) {
    [v4 setHasAccountType:0];
  }
  else {
    objc_msgSend(v4, "setAccountType:");
  }
}

- (INAccountType)accountType
{
  unint64_t v3 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  int v4 = [v3 hasAccountType];
  id v5 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 accountType] - 1;
  if (v6 <= 6) {
    INAccountType v7 = v6 + 1;
  }
  else {
    INAccountType v7 = INAccountTypeUnknown;
  }
  if (v4) {
    INAccountType v8 = v7;
  }
  else {
    INAccountType v8 = INAccountTypeUnknown;
  }

  return v8;
}

- (void)setAccountNickname:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setAccountNickname:v5];
}

- (INSpeakableString)accountNickname
{
  v2 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 accountNickname];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INSearchForAccountsIntent)initWithAccountNickname:(INSpeakableString *)accountNickname accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName requestedBalanceType:(INBalanceType)requestedBalanceType
{
  INBalanceType v10 = accountNickname;
  v11 = organizationName;
  v15.receiver = self;
  v15.super_class = (Class)INSearchForAccountsIntent;
  v12 = [(INIntent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(INSearchForAccountsIntent *)v12 setAccountNickname:v10];
    [(INSearchForAccountsIntent *)v13 setAccountType:accountType];
    [(INSearchForAccountsIntent *)v13 setOrganizationName:v11];
    [(INSearchForAccountsIntent *)v13 setRequestedBalanceType:requestedBalanceType];
  }

  return v13;
}

- (id)_categoryVerb
{
  return @"Search";
}

- (int64_t)_intentCategory
{
  return 9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSearchForAccountsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end