@interface HUTriggerBuilderItem
+ (id)_detailedErrorDescriptionForForceDisableReasons:(unint64_t)a3 inHome:(id)a4;
+ (id)settingsURLForForceDisableReasons:(unint64_t)a3;
- (HFTriggerBuilder)triggerBuilder;
- (HUTriggerBuilderItem)init;
- (HUTriggerBuilderItem)initWithTriggerBuilder:(id)a3 nameType:(unint64_t)a4;
- (id)_forceDisableReasons;
- (id)_resultsForTriggerConditions;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_triggerType;
- (unint64_t)naturalLanguageNameType;
@end

@implementation HUTriggerBuilderItem

- (HUTriggerBuilderItem)initWithTriggerBuilder:(id)a3 nameType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerBuilderItem;
  v8 = [(HUTriggerBuilderItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
    v9->_naturalLanguageNameType = a4;
  }

  return v9;
}

- (HUTriggerBuilderItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithTriggerBuilder_nameType_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTriggerBuilderItem.m", 41, @"%s is unavailable; use %@ instead",
    "-[HUTriggerBuilderItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HUTriggerBuilderItem *)self triggerBuilder];
  v6 = objc_msgSend(v4, "initWithTriggerBuilder:nameType:", v5, -[HUTriggerBuilderItem naturalLanguageNameType](self, "naturalLanguageNameType"));

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(HUTriggerBuilderItem *)self triggerBuilder];

  if (!v4) {
    NSLog(&cfstr_Triggerbuilder_0.isa);
  }
  v5 = [(HUTriggerBuilderItem *)self triggerBuilder];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_opt_class();
    id v7 = [(HUTriggerBuilderItem *)self triggerBuilder];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    id v10 = objc_alloc(MEMORY[0x1E4F696F0]);
    objc_super v11 = [(HUTriggerBuilderItem *)self triggerBuilder];
    v12 = [v11 trigger];
    v13 = [(HUTriggerBuilderItem *)self triggerBuilder];
    v14 = [v13 home];
    v15 = (void *)[v10 initWithTrigger:v12 inHome:v14 forceDisabled:0 ignoringDisabled:1];

    v16 = [(HUTriggerBuilderItem *)self triggerBuilder];
    v17 = objc_msgSend(v16, "naturalLanguageNameOfType:", -[HUTriggerBuilderItem naturalLanguageNameType](self, "naturalLanguageNameType"));

    if ([(HUTriggerBuilderItem *)self naturalLanguageNameType] == 3)
    {
      v18 = [v15 triggerDisplayTitle];
    }
    else
    {
      v22 = [(HUTriggerBuilderItem *)self triggerBuilder];
      v18 = objc_msgSend(v22, "naturalLanguageNameOfType:", -[HUTriggerBuilderItem naturalLanguageNameType](self, "naturalLanguageNameType"));

      v17 = v22;
    }

    if (v18) {
      v23 = v18;
    }
    else {
      v23 = (void *)MEMORY[0x1E4F1CC38];
    }
    v24 = (void *)MEMORY[0x1E4F68B10];
    if (v18) {
      v24 = (void *)MEMORY[0x1E4F68AB8];
    }
    [v6 setObject:v23 forKeyedSubscript:*v24];
    v25 = objc_msgSend(MEMORY[0x1E4F696D0], "iconDescriptorForTriggerType:", -[HUTriggerBuilderItem _triggerType](self, "_triggerType"));
    [v6 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

    v26 = [(HUTriggerBuilderItem *)self triggerBuilder];
    v27 = [v26 home];
    int v28 = objc_msgSend(v27, "hf_currentUserIsAdministrator");
    uint64_t v29 = v28 ^ 1u;

    if (v9)
    {
      v30 = [v9 locationInterface];
      v31 = [v30 locationEventBuilder];

      if (v31)
      {
        if (v28)
        {
          v32 = [v9 locationInterface];
          v33 = [v32 locationEventBuilder];
          v34 = [v33 eventType];
          uint64_t v29 = v34 == 0;
        }
        else
        {
          uint64_t v29 = 1;
        }
        objc_opt_class();
        v35 = [v9 locationInterface];
        v36 = [v35 locationEventBuilder];
        v37 = (objc_opt_isKindOfClass() & 1) != 0 ? v36 : 0;

        if (v37)
        {
          v38 = [v9 trigger];
          v39 = [v38 creator];

          if (v29)
          {
            uint64_t v29 = 1;
          }
          else
          {
            v40 = [(HUTriggerBuilderItem *)self triggerBuilder];
            v41 = [v40 home];
            v42 = [v41 currentUser];
            uint64_t v29 = v39 != v42;
          }
        }
      }
    }
    v43 = [NSNumber numberWithBool:v29];
    [v6 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

    v44 = (void *)MEMORY[0x1E4F7A0D8];
    v45 = [(HUTriggerBuilderItem *)self _resultsForTriggerConditions];
    v53[0] = v45;
    v46 = [(HUTriggerBuilderItem *)self _forceDisableReasons];
    v53[1] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    v48 = [v44 combineAllFutures:v47];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __52__HUTriggerBuilderItem__subclass_updateWithOptions___block_invoke;
    v51[3] = &unk_1E6385620;
    id v52 = v6;
    id v49 = v6;
    v21 = [v48 flatMap:v51];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F7A0D8];
    v20 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    v21 = [v19 futureWithError:v20];
  }

  return v21;
}

id __52__HUTriggerBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__HUTriggerBuilderItem__subclass_updateWithOptions___block_invoke_2;
  v8[3] = &unk_1E63892F0;
  id v9 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_each:", v8);
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v5 = [MEMORY[0x1E4F69228] outcomeWithResults:*(void *)(a1 + 32)];
  v6 = [v4 futureWithResult:v5];

  return v6;
}

uint64_t __52__HUTriggerBuilderItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
}

- (id)_resultsForTriggerConditions
{
  v3 = [HUTriggerConditionSummaryItem alloc];
  id v4 = [(HUTriggerBuilderItem *)self triggerBuilder];
  v5 = [v4 conditionCollection];
  v6 = [v5 conditions];
  id v7 = [(HUTriggerBuilderItem *)self triggerBuilder];
  v8 = [v7 home];
  id v9 = [(HUTriggerConditionSummaryItem *)v3 initWithConditions:v6 home:v8];

  id v10 = [(HUTriggerConditionSummaryItem *)v9 updateWithOptions:MEMORY[0x1E4F1CC08]];
  objc_super v11 = [v10 flatMap:&__block_literal_global_73];

  return v11;
}

id __52__HUTriggerBuilderItem__resultsForTriggerConditions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  id v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v5;
}

- (id)_forceDisableReasons
{
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = [NSNumber numberWithUnsignedInteger:0];
  v5 = [v3 futureWithResult:v4];

  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F69728] sharedInstance];
    id v7 = [v6 notificationSettings];
    v8 = [v7 flatMap:&__block_literal_global_33_0];
    uint64_t v9 = [v8 recover:&__block_literal_global_36];

    v5 = (void *)v9;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__HUTriggerBuilderItem__forceDisableReasons__block_invoke_3;
  v12[3] = &unk_1E6385648;
  v12[4] = self;
  id v10 = [v5 flatMap:v12];

  return v10;
}

id __44__HUTriggerBuilderItem__forceDisableReasons__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 authorizationStatus] != 2;
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = [NSNumber numberWithUnsignedInteger:v2];
  v5 = [v3 futureWithResult:v4];

  return v5;
}

id __44__HUTriggerBuilderItem__forceDisableReasons__block_invoke_2()
{
  v0 = (void *)MEMORY[0x1E4F7A0D8];
  v1 = [NSNumber numberWithUnsignedInteger:1];
  BOOL v2 = [v0 futureWithResult:v1];

  return v2;
}

id __44__HUTriggerBuilderItem__forceDisableReasons__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 unsignedIntegerValue];

  if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
    || ([MEMORY[0x1E4F69758] isAVisionPro] & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v8 = [v7 homeManager];
    int v9 = [v8 isAccessAllowedWhenLocked];

    if (v9) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v5 | 2;
    }
    objc_super v11 = [*(id *)(a1 + 32) triggerBuilder];
    int v6 = [v11 requiresLocationServicesAuthorization];

    if (v6) {
      uint64_t v5 = v10 | 0x10;
    }
    else {
      uint64_t v5 = v10;
    }
  }
  v12 = [*(id *)(a1 + 32) triggerBuilder];
  int v13 = [v12 requiresUpdatedHomeHub];

  if (v13) {
    uint64_t v14 = v5 | 8;
  }
  else {
    uint64_t v14 = v5;
  }
  v15 = [*(id *)(a1 + 32) triggerBuilder];
  int v16 = [v15 requiresHomeHub];

  if (v16) {
    uint64_t v17 = v14 | 4;
  }
  else {
    uint64_t v17 = v14;
  }
  char v18 = v16 | v13 | v6;
  v19 = [*(id *)(a1 + 32) triggerBuilder];
  int v20 = [v19 requiresFMFDeviceToRun];

  if (v20)
  {
    v21 = [*(id *)(a1 + 32) triggerBuilder];
    v22 = [v21 home];

    v23 = [v22 currentUser];
    v24 = [v22 homeAccessControlForUser:v23];
    uint64_t v25 = [v24 presenceComputationStatus];

    if (v25 == 3)
    {
      v17 |= 0x20uLL;
      char v18 = 1;
    }
  }
  v26 = [*(id *)(a1 + 32) triggerBuilder];
  int v27 = [v26 requiresConfirmationToRun];

  if ((v18 & 1) != 0 || v27)
  {
    uint64_t v29 = objc_opt_class();
    v30 = [*(id *)(a1 + 32) triggerBuilder];
    v31 = [v30 home];
    v32 = [v29 _detailedErrorDescriptionForForceDisableReasons:v17 inHome:v31];
    [v4 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F689A0]];

    v33 = [NSNumber numberWithUnsignedInteger:v17];
    [v4 setObject:v33 forKeyedSubscript:@"activeForceDisableReasons"];

    uint64_t v28 = v17;
  }
  else
  {
    uint64_t v28 = 0;
  }
  v34 = [*(id *)(a1 + 32) triggerBuilder];
  int v35 = [v34 secureActionsRequireConfirmationToRun];

  if (v35)
  {
    v36 = [NSNumber numberWithUnsignedInteger:v17];
    [v4 setObject:v36 forKeyedSubscript:@"forceDisableReasonsForSecureCharacteristicControl"];
  }
  v37 = [*(id *)(a1 + 32) triggerBuilder];
  unsigned __int8 v38 = [v37 enabled];

  if ((v38 & (v28 == 0)) != 0) {
    uint64_t v39 = 2;
  }
  else {
    uint64_t v39 = 1;
  }
  v40 = [NSNumber numberWithInteger:v39];
  [v4 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  uint64_t v41 = MEMORY[0x1E4F1CC38];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68AE0]];
  [v4 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F68B08]];
  v42 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v42;
}

- (unint64_t)_triggerType
{
  objc_opt_class();
  id v3 = [(HUTriggerBuilderItem *)self triggerBuilder];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  int v6 = [(HUTriggerBuilderItem *)self triggerBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v8 = 1;
  }
  else if (v5)
  {
    int v9 = [v5 eventTypes];
    unint64_t v10 = [v9 count];

    if (v10 <= 1)
    {
      int v13 = [v5 eventTypes];
      int v14 = [v13 containsObject:*MEMORY[0x1E4F68450]];

      if (v14)
      {
        v15 = [v5 locationInterface];
        id v16 = [v15 locationEventBuilder];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v8 = 2;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v16 locationEventType] == 2) {
              unint64_t v8 = 4;
            }
            else {
              unint64_t v8 = 3;
            }
          }
          else
          {
            unint64_t v8 = 0;
          }
        }
      }
      else
      {
        uint64_t v17 = [v5 eventTypes];
        int v18 = [v17 containsObject:*MEMORY[0x1E4F68448]];

        if (!v18)
        {
          unint64_t v8 = 0;
          goto LABEL_27;
        }
        v19 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
        int v20 = [v5 characteristics];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __36__HUTriggerBuilderItem__triggerType__block_invoke;
        v23[3] = &unk_1E6387020;
        id v24 = v19;
        id v16 = v19;
        int v21 = objc_msgSend(v20, "na_any:", v23);

        if (v21) {
          unint64_t v8 = 6;
        }
        else {
          unint64_t v8 = 5;
        }
      }
      goto LABEL_27;
    }
    unint64_t v8 = 8;
  }
  else
  {
    objc_super v11 = [(HUTriggerBuilderItem *)self triggerBuilder];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if (v12) {
      unint64_t v8 = 7;
    }
    else {
      unint64_t v8 = 0;
    }
  }
LABEL_27:

  return v8;
}

uint64_t __36__HUTriggerBuilderItem__triggerType__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (id)_detailedErrorDescriptionForForceDisableReasons:(unint64_t)a3 inHome:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  if ((a3 & 8) != 0)
  {
    unint64_t v8 = objc_msgSend(v5, "hf_primaryResidentDevice");
    int v9 = [v8 name];

    if (v9) {
      HULocalizedStringWithFormat(@"HUTriggerRequiresUpdatedHomeHub", @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
    }
    else {
    id v16 = _HULocalizedStringWithDefaultValue(@"HUTriggerRequiresUpdatedHomeHubGenericName", @"HUTriggerRequiresUpdatedHomeHubGenericName", 1);
    }

    goto LABEL_21;
  }
  if ((a3 & 4) != 0)
  {
    id v7 = @"HUTriggerRequiresHomeHub";
    goto LABEL_14;
  }
  if ((a3 & 0x10) != 0)
  {
    id v7 = @"HUTriggerRequiresLocationServicesAuthorization";
    goto LABEL_14;
  }
  if (a3)
  {
    uint64_t v17 = @"RequiresConfirmationToRunButNotificationsAreDisabled";
  }
  else if ((a3 & 2) != 0)
  {
    uint64_t v17 = @"RequiresConfirmationToRunButAccessWhileLockedIsDisabled";
  }
  else
  {
    if ((a3 & 0x20) == 0)
    {
      id v7 = @"HUTriggerRequiresConfirmationToRunWarning";
LABEL_14:
      id v16 = _HULocalizedStringWithDefaultValue(v7, v7, 1);
      goto LABEL_21;
    }
    uint64_t v17 = @"RequiresFMFDevice";
  }
  int v18 = [NSString stringWithFormat:@"HUTrigger%@SettingsLinkTitle", v17];
  v19 = _HULocalizedStringWithDefaultValue(v18, v18, 1);
  int v20 = [NSString stringWithFormat:@"HUTrigger%@WarningFormat", v17];
  int v27 = HULocalizedStringWithFormat(v20, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v19);
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v27];
  uint64_t v28 = [v27 rangeOfString:v19 options:4];
  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v30 = v28;
    uint64_t v34 = v29;
    v31 = [MEMORY[0x1E4F1CA60] dictionary];
    v32 = [(id)objc_opt_class() settingsURLForForceDisableReasons:a3];
    objc_msgSend(v31, "na_safeSetObject:forKey:", v32, *MEMORY[0x1E4F42530]);

    objc_msgSend(v16, "addAttributes:range:", v31, v30, v34);
  }

LABEL_21:

  return v16;
}

+ (id)settingsURLForForceDisableReasons:(unint64_t)a3
{
  if (a3)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_notificationSettingsURL");
  }
  else if ((a3 & 2) != 0)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_allowAccessWhileLockedSettingsURL");
  }
  else if ((a3 & 0x20) != 0)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_locationDeviceSettingsURL");
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (unint64_t)naturalLanguageNameType
{
  return self->_naturalLanguageNameType;
}

- (void).cxx_destruct
{
}

@end