@interface HUMediaDestinationItem
- (HMMediaDestination)thisDestination;
- (HUHomeTheaterAudioItemModule)homeTheaterAudioItemModule;
- (HUMediaDestinationItem)init;
- (HUMediaDestinationItem)initWithDestination:(id)a3 withModule:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)iconForAudioDestination:(id)a3;
@end

@implementation HUMediaDestinationItem

- (HUMediaDestinationItem)initWithDestination:(id)a3 withModule:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMediaDestinationItem;
  v9 = [(HUMediaDestinationItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeTheaterAudioItemModule, a4);
    objc_storeStrong((id *)&v10->_thisDestination, a3);
  }

  return v10;
}

- (HUMediaDestinationItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithDestination_withModule_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUMediaDestinationItem.m", 37, @"%s is unavailable; use %@ instead",
    "-[HUMediaDestinationItem init]",
    v5);

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E4F7A0D8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HUMediaDestinationItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1E638CB90;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a2;
  id v7 = [v6 futureWithBlock:v9];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v7;
}

void __54__HUMediaDestinationItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F692F0]);
  id v7 = [WeakRetained homeTheaterAudioItemModule];
  id v8 = [v7 mediaProfileContainer];
  v9 = objc_msgSend(v8, "hf_backingAccessory");
  v10 = [v9 audioDestinationController];
  v11 = [v10 destination];

  objc_super v12 = [WeakRetained thisDestination];

  if (v12)
  {
    v13 = [WeakRetained homeTheaterAudioItemModule];
    v14 = [v13 selectedUncommittedItem];

    if (v14)
    {
      v15 = [WeakRetained homeTheaterAudioItemModule];
      v16 = [v15 selectedUncommittedItem];
      uint64_t v17 = [v16 isEqual:WeakRetained];
    }
    else
    {
      v15 = [v11 audioDestinationIdentifier];
      v16 = [WeakRetained thisDestination];
      v18 = [v16 audioDestinationIdentifier];
      uint64_t v17 = [v15 isEqualToString:v18];
    }
  }
  else
  {
    uint64_t v17 = v11 == 0;
  }
  v19 = [WeakRetained homeTheaterAudioItemModule];
  v20 = [v19 tappedDestinationIdentifier];

  if (v20)
  {
    v21 = [WeakRetained thisDestination];

    v22 = [WeakRetained homeTheaterAudioItemModule];
    v23 = [v22 tappedDestinationIdentifier];
    v24 = v23;
    if (v21)
    {
      [WeakRetained thisDestination];
      id v52 = v4;
      v26 = v25 = v11;
      [v26 audioDestinationIdentifier];
      id v27 = v6;
      int v28 = v17;
      v29 = uint64_t v17 = v2;
      uint64_t v30 = [v24 isEqualToString:v29];

      uint64_t v2 = v17;
      LODWORD(v17) = v28;
      id v6 = v27;

      v11 = v25;
      id v4 = v52;
    }
    else
    {
      uint64_t v30 = [v23 isEqualToString:@"kIdentifierStringForBuiltIn"];
    }

    uint64_t v17 = v17 & ~v30;
  }
  else
  {
    uint64_t v30 = 0;
  }
  v31 = HFLogForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v46 = NSStringFromSelector(*(SEL *)(v2 + 40));
    v51 = [WeakRetained thisDestination];
    [v51 audioDestinationIdentifier];
    v47 = v53 = v11;
    v50 = [WeakRetained homeTheaterAudioItemModule];
    v48 = [v50 tappedDestinationIdentifier];
    v49 = [v53 audioDestinationIdentifier];
    *(_DWORD *)buf = 138413826;
    id v55 = WeakRetained;
    __int16 v56 = 2112;
    v57 = v46;
    __int16 v58 = 2112;
    v59 = v47;
    __int16 v60 = 2112;
    v61 = v48;
    __int16 v62 = 2112;
    v63 = v49;
    __int16 v64 = 1024;
    int v65 = v17;
    __int16 v66 = 1024;
    int v67 = v30;
    _os_log_debug_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEBUG, "%@:%@: self.thisDestination: %@ tappedDestinationIdentifier: %@ selectedDestination: %@... isSelected = %{BOOL}d, showSpinner = %{BOOL}d", buf, 0x40u);

    v11 = v53;
  }

  v32 = [WeakRetained thisDestination];

  if (v32)
  {
    v33 = [WeakRetained thisDestination];
    v34 = [v33 audioDestinationName];
    [v6 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    v35 = [WeakRetained thisDestination];
    v36 = [v35 audioDestinationIdentifier];
    [v6 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F68B50]];
  }
  else
  {
    v37 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSettings_DefaultOutput", @"HUHomeTheaterSettings_DefaultOutput", 1);
    [v6 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v6 setObject:@"kIdentifierStringForBuiltIn" forKeyedSubscript:*MEMORY[0x1E4F68B50]];
  }
  v38 = [NSNumber numberWithBool:v17];
  [v6 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  v39 = [NSNumber numberWithBool:v30];
  [v6 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F68C48]];

  v40 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v6 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v41 = [WeakRetained thisDestination];

  if (v41)
  {
    v42 = [WeakRetained thisDestination];
    v43 = [WeakRetained iconForAudioDestination:v42];

    if (v43) {
      [v6 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
    }
  }
  else
  {
    id v44 = objc_alloc(MEMORY[0x1E4F691D0]);
    v43 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
    v45 = (void *)[v44 initWithSystemImageNamed:@"tv.and.hifispeaker.fill" configuration:v43];
    [v6 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  }
  [v4 finishWithResult:v6];
}

- (id)iconForAudioDestination:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [v9 components];
    v11 = [v10 firstObject];
    objc_super v12 = [v11 mediaProfile];
    uint64_t v13 = [v12 accessory];

    id v6 = (id)v13;
  }
  if ([v7 audioDestinationType] == 1)
  {
    if ([v6 homePodVariant] == 2)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F691D0]);
      v15 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
      v16 = @"homepodmini.fill";
LABEL_21:
      uint64_t v17 = (void *)[v14 initWithSystemImageNamed:v16 configuration:v15];

      goto LABEL_23;
    }
    if ([v6 homePodVariant] == 1 || objc_msgSend(v6, "homePodVariant") == 3)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F691D0]);
      v15 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
      v16 = @"homepod.fill";
      goto LABEL_21;
    }
  }
  else if ([v7 audioDestinationType] == 2)
  {
    if ([v6 homePodVariant] == 2)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F691D0]);
      v15 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
      v16 = @"homepodmini.2.fill";
      goto LABEL_21;
    }
    if ([v6 homePodVariant] == 1 || objc_msgSend(v6, "homePodVariant") == 3)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F691D0]);
      v15 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
      v16 = @"homepod.2.fill";
      goto LABEL_21;
    }
  }
  uint64_t v17 = 0;
LABEL_23:

  return v17;
}

- (HUHomeTheaterAudioItemModule)homeTheaterAudioItemModule
{
  return (HUHomeTheaterAudioItemModule *)objc_getProperty(self, a2, 56, 1);
}

- (HMMediaDestination)thisDestination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thisDestination, 0);

  objc_storeStrong((id *)&self->_homeTheaterAudioItemModule, 0);
}

@end