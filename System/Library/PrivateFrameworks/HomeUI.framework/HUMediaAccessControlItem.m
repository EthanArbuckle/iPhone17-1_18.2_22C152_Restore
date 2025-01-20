@interface HUMediaAccessControlItem
- (HMHome)home;
- (HUMediaAccessControlItem)init;
- (HUMediaAccessControlItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUMediaAccessControlItem

- (HUMediaAccessControlItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUMediaAccessControlItem.m", 24, @"%s is unavailable; use %@ instead",
    "-[HUMediaAccessControlItem init]",
    v5);

  return 0;
}

- (HUMediaAccessControlItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUMediaAccessControlItem;
  v6 = [(HUMediaAccessControlItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  id v5 = [(HUMediaAccessControlItem *)self home];
  v6 = objc_msgSend(v5, "hf_accessControlDescriptor");

  uint64_t v7 = [MEMORY[0x1E4F692A8] mediaContainerSymbolConfiguration];
  v8 = [MEMORY[0x1E4F42A98] configurationWithPointSize:26.0];
  v27 = (void *)v7;
  objc_super v9 = [v8 configurationByApplyingConfiguration:v7];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"tv.and.hifispeaker.fill.fill"];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  v14 = [v13 imageIconDescriptorWithUpdatedImageSymbolConfiguration:v9];
  [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  v15 = [(HUMediaAccessControlItem *)self home];
  v16 = [v15 accessories];
  int v17 = objc_msgSend(v16, "na_any:", &__block_literal_global_130);

  if (v6
    && v17
    && ([(HUMediaAccessControlItem *)self home],
        v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = objc_msgSend(v18, "hf_currentUserIsAdministrator"),
        v18,
        (v19 & 1) != 0))
  {
    v20 = HFLocalizedString();
    [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v4 setObject:@"Home.HomeSettings.SpeakersAndTV" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v6 access];
    v21 = NSLocalizedStringFromHFMediaAccessControlClassification();
    [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68AF0]];
  v22 = (void *)MEMORY[0x1E4F1CAD0];
  v23 = [(HUMediaAccessControlItem *)self home];
  v24 = [v22 setWithObject:v23];
  [v4 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v25 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v25;
}

BOOL __56__HUMediaAccessControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_mediaAccessControlCapabilities") != 0;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end