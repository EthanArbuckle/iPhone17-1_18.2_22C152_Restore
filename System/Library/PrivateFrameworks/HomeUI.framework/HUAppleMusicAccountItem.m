@interface HUAppleMusicAccountItem
- (ACAccount)account;
- (HUAppleMusicAccountItem)init;
- (HUAppleMusicAccountItem)initWithMediaProfileContainer:(id)a3 account:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUAppleMusicAccountItem

- (HUAppleMusicAccountItem)initWithMediaProfileContainer:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUAppleMusicAccountItem.m", 24, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HUAppleMusicAccountItem;
  v9 = [(HUAppleMusicItem *)&v13 initWithMediaProfileContainer:v7];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_account, a4);
  }

  return v10;
}

- (HUAppleMusicAccountItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithMediaProfileContainer_account_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAppleMusicAccountItem.m", 35, @"%s is unavailable; use %@ instead",
    "-[HUAppleMusicAccountItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HUAppleMusicItem *)self mediaProfileContainer];
  v6 = [(HUAppleMusicAccountItem *)self account];
  id v7 = (void *)[v4 initWithMediaProfileContainer:v5 account:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUAppleMusicAccountItem;
  v5 = [(HUAppleMusicItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HUAppleMusicAccountItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6385350;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

id __55__HUAppleMusicAccountItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = [WeakRetained mediaProfileContainer];
  id v7 = objc_msgSend(v6, "hf_appleMusicCurrentLoggedInAccountDSID");
  id v8 = [WeakRetained account];
  id v9 = objc_msgSend(v8, "aa_altDSID");
  uint64_t v10 = [v7 isEqualToString:v9];

  v11 = [WeakRetained mediaProfileContainer];
  LODWORD(v7) = objc_msgSend(v11, "hf_homePodSupportsMultiUser");

  if (v7)
  {
    v12 = [WeakRetained mediaProfileContainer];
    objc_super v13 = objc_msgSend(v12, "hf_appleMusicCurrentLoggedInAccount");

    if (v13)
    {
      v14 = [WeakRetained mediaProfileContainer];
      v15 = objc_msgSend(v14, "hf_appleMusicCurrentLoggedInAccount");
      [v5 setObject:v15 forKeyedSubscript:@"HOAppleMusicAccountKey"];
    }
    v16 = [NSNumber numberWithBool:v13 != 0];
    [v5 setObject:v16 forKeyedSubscript:@"HOAppleMusicAccountIsLoggedInKey"];
  }
  else
  {
    v17 = [WeakRetained account];

    if (v17)
    {
      v18 = [WeakRetained account];
      [v5 setObject:v18 forKeyedSubscript:@"HOAppleMusicAccountKey"];

      v19 = [NSNumber numberWithBool:v10];
      [v5 setObject:v19 forKeyedSubscript:@"HOAppleMusicAccountIsLoggedInKey"];

      v20 = [WeakRetained account];
      v21 = [v20 username];
      uint64_t v22 = [v21 length];

      if (v22)
      {
        v23 = [WeakRetained account];
        v24 = [v23 username];
        v31 = HULocalizedStringWithFormat(@"HUAppleMusicAccountUseFormatString", @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);
        [v5 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

        uint64_t v32 = MEMORY[0x1E4F1CC28];
        goto LABEL_10;
      }
    }
    else
    {
      [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"HOAppleMusicAccountIsLoggedInKey"];
    }
  }
  uint64_t v32 = MEMORY[0x1E4F1CC38];
LABEL_10:
  [v5 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  v33 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v33;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end