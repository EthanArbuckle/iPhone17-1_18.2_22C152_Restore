@interface HFTriggerUISummary
- (BOOL)triggerNameIsConfigured;
- (HFIconDescriptor)triggerIconDescriptor;
- (HFTriggerUISummary)initWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5;
- (HFTriggerUISummary)initWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5 ignoringDisabled:(BOOL)a6;
- (NSArray)triggerSummaryIconDescriptors;
- (NSString)triggerDescription;
- (NSString)triggerDisplayTitle;
- (NSString)triggerName;
- (NSString)triggerNaturalLanguageTitle;
- (NSString)triggerTitle;
- (unint64_t)triggerType;
- (void)_getTriggerName:(id)a3 home:(id)a4;
- (void)_updateWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5 ignoringDisabled:(BOOL)a6;
@end

@implementation HFTriggerUISummary

- (HFTriggerUISummary)initWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFTriggerUISummary;
  v10 = [(HFTriggerUISummary *)&v13 init];
  v11 = v10;
  if (v10) {
    [(HFTriggerUISummary *)v10 _updateWithTrigger:v8 inHome:v9 forceDisabled:v5 ignoringDisabled:0];
  }

  return v11;
}

- (HFTriggerUISummary)initWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5 ignoringDisabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFTriggerUISummary;
  v12 = [(HFTriggerUISummary *)&v15 init];
  objc_super v13 = v12;
  if (v12) {
    [(HFTriggerUISummary *)v12 _updateWithTrigger:v10 inHome:v11 forceDisabled:v7 ignoringDisabled:v6];
  }

  return v13;
}

- (void)_updateWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5 ignoringDisabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  [(HFTriggerUISummary *)self _getTriggerName:v10 home:v11];
  int v12 = [v10 isEnabled];
  objc_super v13 = [HFTriggerActionSetsBuilder alloc];
  v14 = [v10 actionSets];
  objc_super v15 = [(HFTriggerActionSetsBuilder *)v13 initWithActionSets:v14 inHome:v11 filterEmptyActionSets:1];

  v16 = [(HFTriggerActionSetsBuilder *)v15 actionSetsSummary];
  objc_opt_class();
  id v26 = v10;
  if (objc_opt_isKindOfClass()) {
    v17 = v26;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  uint64_t v19 = objc_msgSend(v11, "hf_remoteAccessState");
  if (v19 == 1 || [v18 triggerActivationState] == 1)
  {
    _HFLocalizedStringWithDefaultValue(@"HFTriggerDescriptionRemoteAccessStateNotCapable", @"HFTriggerDescriptionRemoteAccessStateNotCapable", 1);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = [v16 summaryText:v12 & !v7 | v6];
  }
  triggerDescription = self->_triggerDescription;
  self->_triggerDescription = v20;

  v22 = [v16 summaryIconDescriptors];
  triggerSummaryIconDescriptors = self->_triggerSummaryIconDescriptors;
  self->_triggerSummaryIconDescriptors = v22;

  self->_triggerType = objc_msgSend(v26, "hf_triggerType");
  v24 = +[HFTriggerIconFactory iconDescriptorForTrigger:v26];
  triggerIconDescriptor = self->_triggerIconDescriptor;
  self->_triggerIconDescriptor = v24;
}

- (void)_getTriggerName:(id)a3 home:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  BOOL v7 = [v15 configuredName];
  self->_triggerNameIsConfigured = v7 != 0;

  id v8 = [v15 configuredName];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v15 name];
  }
  triggerName = self->_triggerName;
  self->_triggerName = v10;

  objc_msgSend(v15, "hf_naturalLanguageNameWithHome:type:", v6, 2);
  int v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  triggerNaturalLanguageTitle = self->_triggerNaturalLanguageTitle;
  self->_triggerNaturalLanguageTitle = v12;

  uint64_t v14 = 24;
  if (!self->_triggerNameIsConfigured) {
    uint64_t v14 = 32;
  }
  objc_storeStrong((id *)&self->_triggerDisplayTitle, *(id *)((char *)&self->super.isa + v14));
  objc_storeStrong((id *)&self->_triggerTitle, self->_triggerDisplayTitle);
}

- (NSString)triggerDisplayTitle
{
  return self->_triggerDisplayTitle;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (NSString)triggerNaturalLanguageTitle
{
  return self->_triggerNaturalLanguageTitle;
}

- (BOOL)triggerNameIsConfigured
{
  return self->_triggerNameIsConfigured;
}

- (NSString)triggerTitle
{
  return self->_triggerTitle;
}

- (NSString)triggerDescription
{
  return self->_triggerDescription;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (HFIconDescriptor)triggerIconDescriptor
{
  return self->_triggerIconDescriptor;
}

- (NSArray)triggerSummaryIconDescriptors
{
  return self->_triggerSummaryIconDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerSummaryIconDescriptors, 0);
  objc_storeStrong((id *)&self->_triggerIconDescriptor, 0);
  objc_storeStrong((id *)&self->_triggerDescription, 0);
  objc_storeStrong((id *)&self->_triggerTitle, 0);
  objc_storeStrong((id *)&self->_triggerNaturalLanguageTitle, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_triggerDisplayTitle, 0);
}

@end