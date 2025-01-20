@interface HUSoftwareUpdateFetchItem
+ (id)_dateFormatter;
- (HMHome)home;
- (HUSoftwareUpdateFetchItem)init;
- (HUSoftwareUpdateFetchItem)initWithHome:(id)a3 softwareUpdateFetchFuture:(id)a4;
- (NAFuture)softwareUpdateFetchFuture;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)description;
- (void)setSoftwareUpdateFetchFuture:(id)a3;
@end

@implementation HUSoftwareUpdateFetchItem

+ (id)_dateFormatter
{
  if (qword_1EA12E100 != -1) {
    dispatch_once(&qword_1EA12E100, &__block_literal_global_175);
  }
  v2 = (void *)_MergedGlobals_3_9;

  return v2;
}

void __43__HUSoftwareUpdateFetchItem__dateFormatter__block_invoke()
{
  id v2 = [MEMORY[0x1E4F69160] sharedInstance];
  uint64_t v0 = [v2 timeFormatter];
  v1 = (void *)_MergedGlobals_3_9;
  _MergedGlobals_3_9 = v0;
}

- (HUSoftwareUpdateFetchItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_softwareUpdateFetchFuture_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateFetchItem.m", 39, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateFetchItem init]",
    v5);

  return 0;
}

- (HUSoftwareUpdateFetchItem)initWithHome:(id)a3 softwareUpdateFetchFuture:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUSoftwareUpdateFetchItem;
  v9 = [(HUSoftwareUpdateFetchItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_softwareUpdateFetchFuture, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F692F0]);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B00]];
  id v9 = objc_alloc(MEMORY[0x1E4F695B0]);
  v10 = [(HUSoftwareUpdateFetchItem *)self home];
  v11 = [v10 accessories];
  objc_super v12 = (void *)[v9 initWithAccessories:v11];

  if ([v12 softwareUpdatesRequested])
  {
    v13 = [MEMORY[0x1E4F42A98] configurationWithPointSize:22.0];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"clock" configuration:v13];
    [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

    v15 = [v12 accessoriesWithRequestedSoftwareUpdates];
    uint64_t v16 = [v15 count];
    v17 = [v12 accessoriesDownloadingSoftwareUpdates];
    if ([v17 count] + v16 == 1) {
      v18 = @"HUSoftwareUpdateFetchMessageRequested_One";
    }
    else {
      v18 = @"HUSoftwareUpdateFetchMessageRequested_Multiple";
    }
    v19 = _HULocalizedStringWithDefaultValue(v18, v18, 1);
    [v4 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  }
  else
  {
    if ([v12 updatesReadyToInstall]
      || [v12 softwareUpdatesInProgress]
      || ([(HUSoftwareUpdateFetchItem *)self home],
          v20 = objc_claimAutoreleasedReturnValue(),
          int v21 = objc_msgSend(v20, "hf_canUpdateToHH2"),
          v20,
          v21))
    {
      v22 = (__CFString *)*MEMORY[0x1E4F68B10];
      v23 = (void *)MEMORY[0x1E4F1CC38];
    }
    else
    {
      v26 = [(HUSoftwareUpdateFetchItem *)self softwareUpdateFetchFuture];
      int v27 = [v26 isFinished];

      if (v27)
      {
        v28 = [MEMORY[0x1E4F42A98] configurationWithPointSize:22.0];
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"checkmark.circle" configuration:v28];
        [v4 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

        v30 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateFetchMessageUpToDate", @"HUSoftwareUpdateFetchMessageUpToDate", 1);
        v31 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        v32 = [v31 homeManager];
        if ([v32 hasOptedToHH2])
        {
          v33 = [(HUSoftwareUpdateFetchItem *)self home];
          v34 = objc_msgSend(v33, "hf_displayName");
          v41 = HULocalizedStringWithFormat(@"HUSoftwareUpdateFetchMessageUpToDateWithHH2", @"%@", v35, v36, v37, v38, v39, v40, (uint64_t)v34);

          v30 = v33;
        }
        else
        {
          v41 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateFetchMessageUpToDate", @"HUSoftwareUpdateFetchMessageUpToDate", 1);
        }

        [v4 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
        v43 = [(id)objc_opt_class() _dateFormatter];
        v44 = [MEMORY[0x1E4F1C9C8] date];
        v45 = [v43 stringFromDate:v44];
        v52 = HULocalizedStringWithFormat(@"HUSoftwareUpdateFetchLastChecked", @"%@", v46, v47, v48, v49, v50, v51, (uint64_t)v45);
        [v4 setObject:v52 forKeyedSubscript:*MEMORY[0x1E4F68980]];

        goto LABEL_11;
      }
      v42 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateFetchMessageCheckingForUpdate", @"HUSoftwareUpdateFetchMessageCheckingForUpdate", 1);
      [v4 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68C48]];
      v22 = @"instructionsStyle";
      v23 = &unk_1F19B4940;
    }
    [v4 setObject:v23 forKeyedSubscript:v22];
  }
LABEL_11:
  v24 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v24;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  id v4 = [(HUSoftwareUpdateFetchItem *)self latestResults];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), @"hidden", 1);

  uint64_t v7 = [(HUSoftwareUpdateFetchItem *)self latestResults];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  id v9 = (id)[v3 appendObject:v8 withName:@"title" skipIfNil:1];

  v10 = [v3 build];

  return v10;
}

- (HMHome)home
{
  return self->_home;
}

- (NAFuture)softwareUpdateFetchFuture
{
  return self->_softwareUpdateFetchFuture;
}

- (void)setSoftwareUpdateFetchFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end