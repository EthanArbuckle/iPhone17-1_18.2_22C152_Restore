@interface HUTriggerBuilderContext
- (BOOL)allowConvertToShortcut;
- (BOOL)allowDurationEditing;
- (BOOL)filtersEmptyActionSets;
- (BOOL)showActionSetsInstructions;
- (BOOL)showConditionTriggers;
- (BOOL)showTriggerDeleteButton;
- (BOOL)showTriggerEnableSwitch;
- (BOOL)showTriggerSummary;
- (HFItem)suggestionItem;
- (HUTriggerBuilderContext)init;
- (HUTriggerBuilderContext)initWithTriggerBuilderContext:(id)a3;
- (NSSet)unsupportedTriggers;
- (NSString)actionEditorInstructionsDescription;
- (NSString)deleteConfirmationAlertMessage;
- (NSString)deleteConfirmationAlertTitle;
- (NSString)deleteInstructionDescription;
- (NSString)doneButtonTitle;
- (NSString)serviceActionsInstructionDescription;
- (NSString)testActionsInstructionDescription;
- (NSString)triggerContextAwareTitle;
- (void)setActionEditorInstructionsDescription:(id)a3;
- (void)setAllowConvertToShortcut:(BOOL)a3;
- (void)setAllowDurationEditing:(BOOL)a3;
- (void)setDeleteConfirmationAlertMessage:(id)a3;
- (void)setDeleteConfirmationAlertTitle:(id)a3;
- (void)setDeleteInstructionDescription:(id)a3;
- (void)setDoneButtonTitle:(id)a3;
- (void)setFiltersEmptyActionSets:(BOOL)a3;
- (void)setServiceActionsInstructionDescription:(id)a3;
- (void)setShowActionSetsInstructions:(BOOL)a3;
- (void)setShowConditionTriggers:(BOOL)a3;
- (void)setShowTriggerDeleteButton:(BOOL)a3;
- (void)setShowTriggerEnableSwitch:(BOOL)a3;
- (void)setShowTriggerSummary:(BOOL)a3;
- (void)setSuggestionItem:(id)a3;
- (void)setTestActionsInstructionDescription:(id)a3;
- (void)setTriggerContextAwareTitle:(id)a3;
- (void)setUnsupportedTriggers:(id)a3;
@end

@implementation HUTriggerBuilderContext

- (HUTriggerBuilderContext)initWithTriggerBuilderContext:(id)a3
{
  id v4 = a3;
  v5 = [(HUTriggerBuilderContext *)self init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_showTriggerEnableSwitch = [v4 showTriggerEnableSwitch];
      v6->_showTriggerSummary = [v4 showTriggerSummary];
      v6->_showTriggerDeleteButton = [v4 showTriggerDeleteButton];
      v6->_showActionSetsInstructions = [v4 showActionSetsInstructions];
      v6->_showConditionTriggers = [v4 showConditionTriggers];
      v6->_allowDurationEditing = [v4 allowDurationEditing];
      int allowConvertToShortcut = [v4 allowConvertToShortcut];
    }
    else
    {
      int allowConvertToShortcut = v5->_allowConvertToShortcut;
    }
    v6->_int allowConvertToShortcut = allowConvertToShortcut != 0;
    v8 = [v4 testActionsInstructionDescription];
    if (v8)
    {
      [(HUTriggerBuilderContext *)v6 setTestActionsInstructionDescription:v8];
    }
    else
    {
      v9 = [(HUTriggerBuilderContext *)v6 testActionsInstructionDescription];
      [(HUTriggerBuilderContext *)v6 setTestActionsInstructionDescription:v9];
    }
    v10 = [v4 serviceActionsInstructionDescription];
    if (v10)
    {
      [(HUTriggerBuilderContext *)v6 setServiceActionsInstructionDescription:v10];
    }
    else
    {
      v11 = [(HUTriggerBuilderContext *)v6 serviceActionsInstructionDescription];
      [(HUTriggerBuilderContext *)v6 setServiceActionsInstructionDescription:v11];
    }
    v12 = [v4 deleteInstructionDescription];
    if (v12)
    {
      [(HUTriggerBuilderContext *)v6 setDeleteInstructionDescription:v12];
    }
    else
    {
      v13 = [(HUTriggerBuilderContext *)v6 deleteInstructionDescription];
      [(HUTriggerBuilderContext *)v6 setDeleteInstructionDescription:v13];
    }
    v14 = [v4 actionEditorInstructionsDescription];
    if (v14)
    {
      [(HUTriggerBuilderContext *)v6 setActionEditorInstructionsDescription:v14];
    }
    else
    {
      v15 = [(HUTriggerBuilderContext *)v6 actionEditorInstructionsDescription];
      [(HUTriggerBuilderContext *)v6 setActionEditorInstructionsDescription:v15];
    }
    v16 = [v4 triggerContextAwareTitle];
    if (v16)
    {
      [(HUTriggerBuilderContext *)v6 setTriggerContextAwareTitle:v16];
    }
    else
    {
      v17 = [(HUTriggerBuilderContext *)v6 triggerContextAwareTitle];
      [(HUTriggerBuilderContext *)v6 setTriggerContextAwareTitle:v17];
    }
    v18 = [v4 unsupportedTriggers];
    if (v18)
    {
      [(HUTriggerBuilderContext *)v6 setUnsupportedTriggers:v18];
    }
    else
    {
      v19 = [(HUTriggerBuilderContext *)v6 unsupportedTriggers];
      [(HUTriggerBuilderContext *)v6 setUnsupportedTriggers:v19];
    }
    v20 = [v4 deleteConfirmationAlertTitle];
    if (v20)
    {
      [(HUTriggerBuilderContext *)v6 setDeleteConfirmationAlertTitle:v20];
    }
    else
    {
      v21 = [(HUTriggerBuilderContext *)v6 deleteConfirmationAlertTitle];
      [(HUTriggerBuilderContext *)v6 setDeleteConfirmationAlertTitle:v21];
    }
    v22 = [v4 deleteConfirmationAlertMessage];
    if (v22)
    {
      [(HUTriggerBuilderContext *)v6 setDeleteConfirmationAlertMessage:v22];
    }
    else
    {
      v23 = [(HUTriggerBuilderContext *)v6 deleteConfirmationAlertMessage];
      [(HUTriggerBuilderContext *)v6 setDeleteConfirmationAlertMessage:v23];
    }
    v24 = [v4 doneButtonTitle];
    if (v24)
    {
      [(HUTriggerBuilderContext *)v6 setDoneButtonTitle:v24];
    }
    else
    {
      v25 = [(HUTriggerBuilderContext *)v6 doneButtonTitle];
      [(HUTriggerBuilderContext *)v6 setDoneButtonTitle:v25];
    }
    v26 = [v4 suggestionItem];
    if (v26)
    {
      [(HUTriggerBuilderContext *)v6 setSuggestionItem:v26];
    }
    else
    {
      v27 = [(HUTriggerBuilderContext *)v6 suggestionItem];
      [(HUTriggerBuilderContext *)v6 setSuggestionItem:v27];
    }
  }

  return v6;
}

- (HUTriggerBuilderContext)init
{
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerBuilderContext;
  v2 = [(HUTriggerBuilderContext *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(HUTriggerBuilderContext *)v2 setShowTriggerSummary:1];
    [(HUTriggerBuilderContext *)v3 setShowTriggerEnableSwitch:1];
    [(HUTriggerBuilderContext *)v3 setShowTriggerDeleteButton:1];
    [(HUTriggerBuilderContext *)v3 setShowActionSetsInstructions:1];
    [(HUTriggerBuilderContext *)v3 setShowConditionTriggers:1];
    [(HUTriggerBuilderContext *)v3 setAllowDurationEditing:1];
    [(HUTriggerBuilderContext *)v3 setAllowConvertToShortcut:1];
    [(HUTriggerBuilderContext *)v3 setFiltersEmptyActionSets:0];
    id v4 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryTestTriggerButtonTitle", @"HUTriggerSummaryTestTriggerButtonTitle", 1);
    [(HUTriggerBuilderContext *)v3 setTestActionsInstructionDescription:v4];

    v5 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryAddActionButtonTitle", @"HUTriggerSummaryAddActionButtonTitle", 1);
    [(HUTriggerBuilderContext *)v3 setServiceActionsInstructionDescription:v5];

    v6 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryDeleteTriggerButtonTitle", @"HUTriggerSummaryDeleteTriggerButtonTitle", 1);
    [(HUTriggerBuilderContext *)v3 setDeleteInstructionDescription:v6];

    v7 = _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorInstructionsDescription", @"HUTriggerActionEditorInstructionsDescription", 1);
    [(HUTriggerBuilderContext *)v3 setActionEditorInstructionsDescription:v7];

    if ([MEMORY[0x1E4F69758] isAMac])
    {
      v8 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryDeleteTriggerConfirmationAlertTitleMac", @"HUTriggerSummaryDeleteTriggerConfirmationAlertTitleMac", 1);
      [(HUTriggerBuilderContext *)v3 setDeleteConfirmationAlertTitle:v8];

      v9 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryDeleteTriggerConfirmationAlertMessageMac", @"HUTriggerSummaryDeleteTriggerConfirmationAlertMessageMac", 1);
      [(HUTriggerBuilderContext *)v3 setDeleteConfirmationAlertMessage:v9];
    }
    v10 = [MEMORY[0x1E4F1CAD0] set];
    [(HUTriggerBuilderContext *)v3 setUnsupportedTriggers:v10];
  }
  return v3;
}

- (BOOL)showTriggerSummary
{
  return self->_showTriggerSummary;
}

- (void)setShowTriggerSummary:(BOOL)a3
{
  self->_showTriggerSummary = a3;
}

- (BOOL)showTriggerEnableSwitch
{
  return self->_showTriggerEnableSwitch;
}

- (void)setShowTriggerEnableSwitch:(BOOL)a3
{
  self->_showTriggerEnableSwitch = a3;
}

- (BOOL)showTriggerDeleteButton
{
  return self->_showTriggerDeleteButton;
}

- (void)setShowTriggerDeleteButton:(BOOL)a3
{
  self->_showTriggerDeleteButton = a3;
}

- (BOOL)showActionSetsInstructions
{
  return self->_showActionSetsInstructions;
}

- (void)setShowActionSetsInstructions:(BOOL)a3
{
  self->_showActionSetsInstructions = a3;
}

- (BOOL)showConditionTriggers
{
  return self->_showConditionTriggers;
}

- (void)setShowConditionTriggers:(BOOL)a3
{
  self->_showConditionTriggers = a3;
}

- (BOOL)allowDurationEditing
{
  return self->_allowDurationEditing;
}

- (void)setAllowDurationEditing:(BOOL)a3
{
  self->_allowDurationEditing = a3;
}

- (BOOL)allowConvertToShortcut
{
  return self->_allowConvertToShortcut;
}

- (void)setAllowConvertToShortcut:(BOOL)a3
{
  self->_int allowConvertToShortcut = a3;
}

- (BOOL)filtersEmptyActionSets
{
  return self->_filtersEmptyActionSets;
}

- (void)setFiltersEmptyActionSets:(BOOL)a3
{
  self->_filtersEmptyActionSets = a3;
}

- (NSString)testActionsInstructionDescription
{
  return self->_testActionsInstructionDescription;
}

- (void)setTestActionsInstructionDescription:(id)a3
{
}

- (NSString)serviceActionsInstructionDescription
{
  return self->_serviceActionsInstructionDescription;
}

- (void)setServiceActionsInstructionDescription:(id)a3
{
}

- (NSString)deleteInstructionDescription
{
  return self->_deleteInstructionDescription;
}

- (void)setDeleteInstructionDescription:(id)a3
{
}

- (NSString)actionEditorInstructionsDescription
{
  return self->_actionEditorInstructionsDescription;
}

- (void)setActionEditorInstructionsDescription:(id)a3
{
}

- (NSString)triggerContextAwareTitle
{
  return self->_triggerContextAwareTitle;
}

- (void)setTriggerContextAwareTitle:(id)a3
{
}

- (NSSet)unsupportedTriggers
{
  return self->_unsupportedTriggers;
}

- (void)setUnsupportedTriggers:(id)a3
{
}

- (HFItem)suggestionItem
{
  return self->_suggestionItem;
}

- (void)setSuggestionItem:(id)a3
{
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDoneButtonTitle:(id)a3
{
}

- (NSString)deleteConfirmationAlertTitle
{
  return self->_deleteConfirmationAlertTitle;
}

- (void)setDeleteConfirmationAlertTitle:(id)a3
{
}

- (NSString)deleteConfirmationAlertMessage
{
  return self->_deleteConfirmationAlertMessage;
}

- (void)setDeleteConfirmationAlertMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteConfirmationAlertMessage, 0);
  objc_storeStrong((id *)&self->_deleteConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_suggestionItem, 0);
  objc_storeStrong((id *)&self->_unsupportedTriggers, 0);
  objc_storeStrong((id *)&self->_triggerContextAwareTitle, 0);
  objc_storeStrong((id *)&self->_actionEditorInstructionsDescription, 0);
  objc_storeStrong((id *)&self->_deleteInstructionDescription, 0);
  objc_storeStrong((id *)&self->_serviceActionsInstructionDescription, 0);

  objc_storeStrong((id *)&self->_testActionsInstructionDescription, 0);
}

@end