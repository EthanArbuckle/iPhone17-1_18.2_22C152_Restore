@interface HUPrimaryUserHomePodAccountItem
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUPrimaryUserHomePodAccountItem

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HUPrimaryUserHomePodAccountItem *)self valueSource];
  v6 = [(HUPrimaryUserHomePodAccountItem *)self mediaProfileContainer];
  v7 = (void *)[v4 initWithValueSource:v5 mediaProfileContainer:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUPrimaryUserHomePodAccountItem;
  v5 = [(HUPrimaryUserHomePodAccountItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HUPrimaryUserHomePodAccountItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6385350;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

id __63__HUPrimaryUserHomePodAccountItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = _HULocalizedStringWithDefaultValue(@"HUPrimaryUserSettingsUserSection_HomePodAccountTitle", @"HUPrimaryUserSettingsUserSection_HomePodAccountTitle", 1);
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v7 = [WeakRetained mediaProfileContainer];
  v8 = objc_msgSend(v7, "hf_appleMusicCurrentLoggedInAccount");

  if (v8)
  {
    [v5 setObject:&stru_1F18F92B8 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  else
  {
    id v9 = _HULocalizedStringWithDefaultValue(@"HUPrimaryUserSettingsUserSection_HomePodAccountDescription_SignedOut", @"HUPrimaryUserSettingsUserSection_HomePodAccountDescription_SignedOut", 1);
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  objc_super v10 = [WeakRetained mediaProfileContainer];
  uint64_t v11 = objc_msgSend(v10, "hf_preferredUserSelectionType");

  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109376;
    v16[1] = v8 != 0;
    __int16 v17 = 1024;
    BOOL v18 = v11 == 0;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Is there a signed-in account on this HomePod?: %{BOOL}d isSelectionTypeHomePodAccount?: %{BOOL}d", (uint8_t *)v16, 0xEu);
  }

  v13 = [NSNumber numberWithBool:v11 == 0];
  [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v14;
}

@end