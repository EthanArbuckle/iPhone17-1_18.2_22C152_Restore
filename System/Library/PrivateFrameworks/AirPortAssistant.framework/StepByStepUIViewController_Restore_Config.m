@interface StepByStepUIViewController_Restore_Config
- (UIView)dontRestoreRecommendationContainerView;
- (UIView)restoreRecommendationContainerView;
- (void)dealloc;
- (void)loadView;
- (void)setDontRestoreRecommendationContainerView:(id)a3;
- (void)setRestoreRecommendationContainerView:(id)a3;
- (void)setupInitialTableHeaderConfiguration;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController_Restore_Config

- (void)loadView
{
  v43.receiver = self;
  v43.super_class = (Class)StepByStepUIViewController_Restore_Config;
  [(StepByStepUIViewController *)&v43 loadView];
  uint64_t v42 = 0;
  v5 = objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  self->restoreRecommendationLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v8, (uint64_t)&v42, v9);
  objc_msgSend_setRestoreRecommendationContainerView_(self, v10, v42);
  uint64_t v42 = 0;
  v13 = objc_msgSend_view(self, v11, v12);
  objc_msgSend_frame(v13, v14, v15);
  self->dontRestoreRecommendationLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v16, (uint64_t)&v42, v17);
  objc_msgSend_setDontRestoreRecommendationContainerView_(self, v18, v42);
  uint64_t v21 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v19, v20, 0.5, 0.0, 0.0, 1.0);
  objc_msgSend_setTextColor_(self->dontRestoreRecommendationLabel, v22, v21);
  uint64_t v25 = objc_msgSend_tableHeaderContainerView(self, v23, v24);
  v28 = objc_msgSend_tableView(self, v26, v27);
  objc_msgSend_setTableHeaderView_(v28, v29, v25);
  v32 = objc_msgSend_tableView(self, v30, v31);
  v33 = (void *)MEMORY[0x263F08938];
  tableHeaderContainerView = self->super.tableHeaderContainerView;
  uint64_t v37 = objc_msgSend_tableView(self, v35, v36);
  uint64_t v39 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v33, v38, (uint64_t)tableHeaderContainerView, 7, 0, v37, 7, 1.0, 0.0);
  objc_msgSend_addConstraint_(v32, v40, v39);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v41, @"kNext", 1, 0);
}

- (void)dealloc
{
  objc_msgSend_setRestoreRecommendationContainerView_(self, a2, 0);
  objc_msgSend_setDontRestoreRecommendationContainerView_(self, v3, 0);
  v4.receiver = self;
  v4.super_class = (Class)StepByStepUIViewController_Restore_Config;
  [(StepByStepUIViewController *)&v4 dealloc];
}

- (void)setupInitialTableHeaderConfiguration
{
  objc_super v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  uint64_t v10 = objc_msgSend_topoView(self, v6, v7);
  if (self->dontRestore) {
    uint64_t v11 = objc_msgSend_dontRestoreRecommendationContainerView(self, v8, v9);
  }
  else {
    uint64_t v11 = objc_msgSend_restoreRecommendationContainerView(self, v8, v9);
  }
  uint64_t v13 = objc_msgSend_arrayWithObjects_(v4, v12, v5, v10, v11, 0);
  v16 = objc_msgSend_parentController(self, v14, v15);
  uint64_t v19 = objc_msgSend_tableHeaderContainerView(self, v17, v18);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v16, v20, v19, v13, 1);
  uint64_t v23 = objc_msgSend_tableHeaderContainerView(self, v21, v22);
  v26 = objc_msgSend_tableView(self, v24, v25);

  objc_msgSend_setTableHeaderView_(v26, v27, v23);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v49 = 0;
  uint64_t v50 = 0;
  v48 = 0;
  uint64_t v5 = objc_msgSend_inParamDict(self, a2, a3);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, @"kSBSKey_TargetBase");
  objc_msgSend_syncTopoUIForTarget_andSource_andNetwork_connectionType_(self, v8, v7, 0, 0, 0);
  justTextLabel = self->super.justTextLabel;
  justTextContainerView = (char *)self->super.justTextContainerView;
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, @"StepByStepStatus_Restore%@");
  sub_22684E878(justTextLabel, justTextContainerView, ProductLocalizedStringWithFormat);
  uint64_t v15 = objc_msgSend_tableHeaderContainerView(self, v13, v14);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v16, v15);
  uint64_t v19 = objc_msgSend_inParamDict(self, v17, v18);
  uint64_t v21 = objc_msgSend_objectForKey_(v19, v20, @"kSBSKey_RestoreRecommendation");
  uint64_t v24 = objc_msgSend_inParamDict(self, v22, v23);
  uint64_t v27 = objc_msgSend_inParamDict(self, v25, v26);
  v29 = objc_msgSend_objectForKey_(v27, v28, @"kSBSKey_Step");
  uint64_t v32 = objc_msgSend_integerValue(v29, v30, v31);
  objc_msgSend_formatRecommendation_fromParamDict_forStep_restoreString_restoreSpecificString_dontRecommendString_(StepByStepUtilities, v33, v21, v24, v32, &v50, &v49, &v48);
  uint64_t v36 = objc_msgSend_length(v48, v34, v35);
  self->dontRestore = v36 != 0;
  if (v36)
  {
    dontRestoreRecommendationLabel = self->dontRestoreRecommendationLabel;
    dontRestoreRecommendationContainerView = (char *)self->dontRestoreRecommendationContainerView;
    v41 = v48;
  }
  else
  {
    uint64_t v42 = objc_msgSend_length(v49, v37, v38);
    dontRestoreRecommendationContainerView = (char *)self->restoreRecommendationContainerView;
    if (v42) {
      objc_super v43 = &v49;
    }
    else {
      objc_super v43 = (void **)&v50;
    }
    v41 = *v43;
    dontRestoreRecommendationLabel = self->restoreRecommendationLabel;
  }
  sub_22684E878(dontRestoreRecommendationLabel, dontRestoreRecommendationContainerView, v41);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v44, (uint64_t)self->super.tableHeaderContainerView);
  objc_msgSend_setupInitialTableHeaderConfiguration(self, v45, v46);
  v47.receiver = self;
  v47.super_class = (Class)StepByStepUIViewController_Restore_Config;
  [(StepByStepUIViewController *)&v47 viewWillAppear:v3];
}

- (UIView)restoreRecommendationContainerView
{
  return self->restoreRecommendationContainerView;
}

- (void)setRestoreRecommendationContainerView:(id)a3
{
}

- (UIView)dontRestoreRecommendationContainerView
{
  return self->dontRestoreRecommendationContainerView;
}

- (void)setDontRestoreRecommendationContainerView:(id)a3
{
}

@end