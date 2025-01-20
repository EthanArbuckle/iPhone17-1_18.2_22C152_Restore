@interface HRERecommendationEmptyTriggerBuilderContext
- (BOOL)allowConvertToShortcut;
- (BOOL)allowDurationEditing;
- (BOOL)filtersEmptyActionSets;
- (BOOL)showActionSetsInstructions;
- (BOOL)showConditionTriggers;
- (BOOL)showTriggerDeleteButton;
- (BOOL)showTriggerEnableSwitch;
- (BOOL)showTriggerSummary;
- (HFItem)suggestionItem;
- (HRERecommendationEmptyTriggerBuilderContext)init;
- (NSSet)unsupportedTriggers;
- (NSString)actionEditorInstructionsDescription;
- (NSString)deleteConfirmationAlertMessage;
- (NSString)deleteConfirmationAlertTitle;
- (NSString)deleteInstructionDescription;
- (NSString)doneButtonTitle;
- (NSString)serviceActionsInstructionDescription;
- (NSString)testActionsInstructionDescription;
- (NSString)triggerContextAwareTitle;
@end

@implementation HRERecommendationEmptyTriggerBuilderContext

- (HRERecommendationEmptyTriggerBuilderContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)HRERecommendationEmptyTriggerBuilderContext;
  v2 = [(HRERecommendationEmptyTriggerBuilderContext *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->allowDurationEditing = 0;
    if (qword_268944C30 != -1) {
      dispatch_once(&qword_268944C30, &__block_literal_global_271);
    }
    objc_storeStrong((id *)&v3->testActionsInstructionDescription, (id)qword_268944C38);
    if (qword_268944C40 != -1) {
      dispatch_once(&qword_268944C40, &__block_literal_global_278);
    }
    objc_storeStrong((id *)&v3->serviceActionsInstructionDescription, (id)qword_268944C48);
    if (qword_268944C50 != -1) {
      dispatch_once(&qword_268944C50, &__block_literal_global_282);
    }
    objc_storeStrong((id *)&v3->actionEditorInstructionsDescription, (id)qword_268944C58);
    if (qword_268944C60 != -1) {
      dispatch_once(&qword_268944C60, &__block_literal_global_286);
    }
    objc_storeStrong((id *)&v3->triggerContextAwareTitle, (id)qword_268944C68);
    if (qword_268944C70 != -1) {
      dispatch_once(&qword_268944C70, &__block_literal_global_290);
    }
    objc_storeStrong((id *)&v3->deleteInstructionDescription, (id)qword_268944C78);
    if (qword_268944C80 != -1) {
      dispatch_once(&qword_268944C80, &__block_literal_global_294);
    }
    objc_storeStrong((id *)&v3->deleteConfirmationAlertTitle, (id)qword_268944C88);
    if (qword_268944C90 != -1) {
      dispatch_once(&qword_268944C90, &__block_literal_global_298);
    }
    objc_storeStrong((id *)&v3->deleteConfirmationAlertMessage, (id)qword_268944C98);
    if (qword_268944CA0 != -1) {
      dispatch_once(&qword_268944CA0, &__block_literal_global_302);
    }
    objc_storeStrong((id *)&v3->doneButtonTitle, (id)qword_268944CA8);
    uint64_t v4 = [MEMORY[0x263EFFA08] set];
    unsupportedTriggers = v3->unsupportedTriggers;
    v3->unsupportedTriggers = (NSSet *)v4;
  }
  return v3;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_2()
{
  v0 = (void *)qword_268944C38;
  qword_268944C38 = (uint64_t)&stru_26EAB1AB0;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_4()
{
  v0 = (void *)qword_268944C48;
  qword_268944C48 = (uint64_t)&stru_26EAB1AB0;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_6()
{
  v0 = (void *)qword_268944C58;
  qword_268944C58 = (uint64_t)&stru_26EAB1AB0;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_8()
{
  v0 = (void *)qword_268944C68;
  qword_268944C68 = (uint64_t)&stru_26EAB1AB0;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_10()
{
  v0 = (void *)qword_268944C78;
  qword_268944C78 = (uint64_t)&stru_26EAB1AB0;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_12()
{
  v0 = (void *)qword_268944C88;
  qword_268944C88 = (uint64_t)&stru_26EAB1AB0;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_14()
{
  v0 = (void *)qword_268944C98;
  qword_268944C98 = (uint64_t)&stru_26EAB1AB0;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_16()
{
  v0 = (void *)qword_268944CA8;
  qword_268944CA8 = (uint64_t)&stru_26EAB1AB0;
}

- (BOOL)allowDurationEditing
{
  return self->allowDurationEditing;
}

- (BOOL)allowConvertToShortcut
{
  return self->allowConvertToShortcut;
}

- (BOOL)filtersEmptyActionSets
{
  return self->filtersEmptyActionSets;
}

- (NSString)serviceActionsInstructionDescription
{
  return self->serviceActionsInstructionDescription;
}

- (BOOL)showActionSetsInstructions
{
  return self->showActionSetsInstructions;
}

- (BOOL)showConditionTriggers
{
  return self->showConditionTriggers;
}

- (BOOL)showTriggerDeleteButton
{
  return self->showTriggerDeleteButton;
}

- (BOOL)showTriggerEnableSwitch
{
  return self->showTriggerEnableSwitch;
}

- (BOOL)showTriggerSummary
{
  return self->showTriggerSummary;
}

- (NSString)testActionsInstructionDescription
{
  return self->testActionsInstructionDescription;
}

- (NSString)actionEditorInstructionsDescription
{
  return self->actionEditorInstructionsDescription;
}

- (NSString)deleteConfirmationAlertMessage
{
  return self->deleteConfirmationAlertMessage;
}

- (NSString)deleteConfirmationAlertTitle
{
  return self->deleteConfirmationAlertTitle;
}

- (NSString)deleteInstructionDescription
{
  return self->deleteInstructionDescription;
}

- (NSString)doneButtonTitle
{
  return self->doneButtonTitle;
}

- (NSString)triggerContextAwareTitle
{
  return self->triggerContextAwareTitle;
}

- (NSSet)unsupportedTriggers
{
  return self->unsupportedTriggers;
}

- (HFItem)suggestionItem
{
  return self->suggestionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->suggestionItem, 0);
  objc_storeStrong((id *)&self->unsupportedTriggers, 0);
  objc_storeStrong((id *)&self->triggerContextAwareTitle, 0);
  objc_storeStrong((id *)&self->doneButtonTitle, 0);
  objc_storeStrong((id *)&self->deleteInstructionDescription, 0);
  objc_storeStrong((id *)&self->deleteConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->deleteConfirmationAlertMessage, 0);
  objc_storeStrong((id *)&self->actionEditorInstructionsDescription, 0);
  objc_storeStrong((id *)&self->testActionsInstructionDescription, 0);

  objc_storeStrong((id *)&self->serviceActionsInstructionDescription, 0);
}

@end