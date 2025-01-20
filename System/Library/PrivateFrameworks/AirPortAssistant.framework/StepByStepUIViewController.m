@interface StepByStepUIViewController
- (NetTopoMiniStaticLayout)topoLayout;
- (UIActivityIndicatorView)spinnerWithStatusBelowSpinner;
- (UILabel)justTextLabel;
- (UILabel)spinnerWithStatusBelowLabel;
- (UIView)justTextContainerView;
- (UIView)spinnerWithStatusBelowView;
- (UIView)tableFooterContainerView;
- (UIView)tableHeaderContainerView;
- (UIView)topoView;
- (int)sbsMode;
- (void)dealloc;
- (void)loadView;
- (void)setJustTextContainerView:(id)a3;
- (void)setJustTextLabel:(id)a3;
- (void)setSbsMode:(int)a3;
- (void)setSpinnerWithStatusBelowLabel:(id)a3;
- (void)setSpinnerWithStatusBelowSpinner:(id)a3;
- (void)setSpinnerWithStatusBelowView:(id)a3;
- (void)setTableFooterContainerView:(id)a3;
- (void)setTableHeaderContainerView:(id)a3;
- (void)setTopoLayout:(id)a3;
- (void)setTopoView:(id)a3;
- (void)stepByStepUpdateProgress:(id)a3 forState:(int)a4;
- (void)syncTopoUIForTarget:(id)a3 andSource:(id)a4 andNetwork:(id)a5 connectionType:(id)a6;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController

- (void)dealloc
{
  objc_msgSend_setTopoLayout_(self, a2, 0);
  objc_msgSend_setSpinnerWithStatusBelowLabel_(self, v3, 0);
  objc_msgSend_setSpinnerWithStatusBelowView_(self, v4, 0);
  objc_msgSend_setSpinnerWithStatusBelowSpinner_(self, v5, 0);
  objc_msgSend_setTopoView_(self, v6, 0);
  objc_msgSend_setTableFooterContainerView_(self, v7, 0);
  objc_msgSend_setJustTextContainerView_(self, v8, 0);
  objc_msgSend_setTableHeaderContainerView_(self, v9, 0);
  v10.receiver = self;
  v10.super_class = (Class)StepByStepUIViewController;
  [(AssistantSubUIViewController *)&v10 dealloc];
}

- (void)loadView
{
  v90[1] = *MEMORY[0x263EF8340];
  v88.receiver = self;
  v88.super_class = (Class)StepByStepUIViewController;
  [(AUUITableViewController *)&v88 loadView];
  v5 = objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  uint64_t v11 = objc_msgSend_topoViewWithWidth_(AssistantSubUIViewController, v8, v9, v10);
  objc_msgSend_setTopoView_(self, v12, v11);
  uint64_t v87 = 0;
  v15 = objc_msgSend_view(self, v13, v14);
  objc_msgSend_frame(v15, v16, v17);
  self->justTextLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v18, (uint64_t)&v87, v19);
  objc_msgSend_setJustTextContainerView_(self, v20, v87);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->justTextContainerView, v21, 0);
  justTextLabel = self->justTextLabel;
  v23 = (void *)MEMORY[0x263F08938];
  v89 = @"height";
  v24 = NSNumber;
  objc_msgSend_frame(justTextLabel, v25, v26);
  *(float *)&double v28 = v27;
  v90[0] = objc_msgSend_numberWithFloat_(v24, v29, v30, v28);
  uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)v90, &v89, 1);
  v33 = _NSDictionaryOfVariableBindings(&cfstr_Justtextlabel.isa, self->justTextLabel, 0);
  uint64_t v35 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v23, v34, @"V:[justTextLabel(>=height)]", 0, v32, v33);
  objc_msgSend_addConstraints_(justTextLabel, v36, v35);
  v39 = objc_msgSend_view(self, v37, v38);
  objc_msgSend_frame(v39, v40, v41);
  uint64_t v45 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v42, v43, v44);
  objc_msgSend_setTableHeaderContainerView_(self, v46, v45);
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  v49 = objc_msgSend_view(self, v47, v48);
  objc_msgSend_frame(v49, v50, v51);
  uint64_t v54 = objc_msgSend_labelViewInContainer_width_withSpinner_above_(AssistantSubUIViewController, v52, (uint64_t)&v87, &v86, 1, v53);
  objc_msgSend_setSpinnerWithStatusBelowLabel_(self, v55, v54);
  objc_msgSend_setSpinnerWithStatusBelowView_(self, v56, v87);
  objc_msgSend_setSpinnerWithStatusBelowSpinner_(self, v57, v86);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->spinnerWithStatusBelowView, v58, 0);
  v61 = objc_msgSend_view(self, v59, v60);
  objc_msgSend_frame(v61, v62, v63);
  uint64_t v67 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v64, v65, v66);
  objc_msgSend_setTableFooterContainerView_(self, v68, v67);
  v71 = objc_msgSend_view(self, v69, v70);
  objc_msgSend_frame(v71, v72, v73);
  double v75 = v74;
  v78 = objc_msgSend_view(self, v76, v77);
  objc_msgSend_frame(v78, v79, v80);
  uint64_t v84 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v81, v82, v75, v83);
  objc_msgSend_setTableView_(self, v85, v84);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_msgSend_tableView(self, a2, a3);
  objc_msgSend_setTableFooterView_(v5, v6, 0);
  v7.receiver = self;
  v7.super_class = (Class)StepByStepUIViewController;
  [(AUUITableViewController *)&v7 viewWillAppear:v3];
}

- (void)syncTopoUIForTarget:(id)a3 andSource:(id)a4 andNetwork:(id)a5 connectionType:(id)a6
{
  double v10 = (__CFString *)a4;
  v13 = NSNumber;
  unsigned int v14 = sub_22685AB94((const __CFString *)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7);
  v16 = objc_msgSend_numberWithInteger_(v13, v15, v14);
  uint64_t v17 = NSNumber;
  unsigned int v25 = sub_22685AB68((uint64_t)a3, v18, v19, v20, v21, v22, v23, v24);
  uint64_t v96 = objc_msgSend_numberWithInteger_(v17, v26, v25);
  id v97 = a6;
  if (v10)
  {
    v29 = NSNumber;
    unsigned int v30 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v27, (uint64_t)v10);
    uint64_t v32 = objc_msgSend_numberWithInteger_(v29, v31, v30);
    v40 = NSNumber;
    if (v32)
    {
      uint64_t v41 = (void *)v32;
      unsigned int v42 = sub_22685AAD0((uint64_t)v10);
      double v44 = objc_msgSend_numberWithInteger_(v40, v43, v42);
      unsigned int v47 = objc_msgSend_integerValue(v41, v45, v46);
      int v50 = objc_msgSend_integerValue(v44, v48, v49);
      uint64_t v51 = (uint64_t)sub_22685E098(v47, v50);
    }
    else
    {
      unsigned int v52 = sub_22685AB94(v10, v33, v34, v35, v36, v37, v38, v39);
      uint64_t v41 = objc_msgSend_numberWithInteger_(v40, v53, v52);
      uint64_t v54 = NSNumber;
      unsigned int v62 = sub_22685AB68((uint64_t)v10, v55, v56, v57, v58, v59, v60, v61);
      double v44 = objc_msgSend_numberWithInteger_(v54, v63, v62);
      uint64_t v51 = objc_msgSend_objectForKey_(v10, v64, @"name");
    }
    double v10 = (__CFString *)v51;
  }
  else
  {
    uint64_t v41 = 0;
    double v44 = 0;
  }
  unsigned int v65 = objc_msgSend_integerValue(v16, v27, v28);
  int v73 = sub_22685AB68((uint64_t)a3, v66, v67, v68, v69, v70, v71, v72);
  double v74 = sub_22685E098(v65, v73);
  uint64_t v77 = objc_msgSend_parentController(self, v75, v76);
  uint64_t v80 = objc_msgSend__assistantUIController(v77, v78, v79);
  double v83 = objc_msgSend_topoView(self, v81, v82);
  uint64_t v86 = objc_msgSend_layer(v83, v84, v85);
  uint64_t v89 = objc_msgSend_topoLayout(self, v87, v88);
  uint64_t v92 = objc_msgSend_topoView(self, v90, v91);
  uint64_t v95 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(v80, v93, v86, v89, v92, v16, v96, v74, a5, v41, v44, v10, a5, v97);

  objc_msgSend_setTopoLayout_(self, v94, v95);
}

- (void)stepByStepUpdateProgress:(id)a3 forState:(int)a4
{
  if (objc_msgSend_tableView(self, a2, (uint64_t)a3, *(void *)&a4)
    && objc_msgSend_tableFooterContainerView(self, v6, v7)
    && objc_msgSend_spinnerWithStatusBelowView(self, v8, v9)
    && objc_msgSend_spinnerWithStatusBelowLabel(self, v10, v11))
  {
    unsigned int v14 = objc_msgSend_navigationItem(self, v12, v13);
    uint64_t v17 = objc_msgSend_rightBarButtonItem(v14, v15, v16);
    objc_msgSend_setEnabled_(v17, v18, 0);
    uint64_t v21 = objc_msgSend_tableView(self, v19, v20);
    if (objc_msgSend_numberOfSections(v21, v22, v23) >= 1)
    {
      uint64_t v26 = objc_msgSend_tableManager(self, v24, v25);
      objc_msgSend_cleanTableViewForReuse(v26, v27, v28);
      v29 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v32 = objc_msgSend_spinnerWithStatusBelowView(self, v30, v31);
      uint64_t v34 = objc_msgSend_arrayWithObjects_(v29, v33, v32, 0);
      uint64_t v37 = objc_msgSend_parentController(self, v35, v36);
      uint64_t v40 = objc_msgSend_tableFooterContainerView(self, v38, v39);
      objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v37, v41, v40, v34, 1);
      uint64_t v44 = objc_msgSend_tableFooterContainerView(self, v42, v43);
      unsigned int v47 = objc_msgSend_tableView(self, v45, v46);
      objc_msgSend_setTableFooterView_(v47, v48, v44);
    }
    objc_msgSend_startAnimating(self->spinnerWithStatusBelowSpinner, v24, v25);
    spinnerWithStatusBelowLabel = self->spinnerWithStatusBelowLabel;
    spinnerWithStatusBelowView = self->spinnerWithStatusBelowView;
    if (objc_msgSend_length(a3, v51, v52)) {
      objc_msgSend_setText_(spinnerWithStatusBelowLabel, v53, (uint64_t)a3);
    }
    else {
      objc_msgSend_setText_(spinnerWithStatusBelowLabel, v53, @"\n");
    }
    objc_msgSend_sizeToFit(spinnerWithStatusBelowLabel, v54, v55);
    objc_msgSend_setNeedsLayout(spinnerWithStatusBelowLabel, v56, v57);
    objc_msgSend_setNeedsLayout(spinnerWithStatusBelowView, v58, v59);
    tableHeaderContainerView = self->tableHeaderContainerView;
    objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v60, (uint64_t)tableHeaderContainerView);
  }
}

- (UIView)tableHeaderContainerView
{
  return self->tableHeaderContainerView;
}

- (void)setTableHeaderContainerView:(id)a3
{
}

- (UIView)justTextContainerView
{
  return self->justTextContainerView;
}

- (void)setJustTextContainerView:(id)a3
{
}

- (UILabel)justTextLabel
{
  return self->justTextLabel;
}

- (void)setJustTextLabel:(id)a3
{
  self->justTextLabel = (UILabel *)a3;
}

- (UIView)topoView
{
  return self->topoView;
}

- (void)setTopoView:(id)a3
{
}

- (NetTopoMiniStaticLayout)topoLayout
{
  return self->topoLayout;
}

- (void)setTopoLayout:(id)a3
{
}

- (UIView)tableFooterContainerView
{
  return self->tableFooterContainerView;
}

- (void)setTableFooterContainerView:(id)a3
{
}

- (UIView)spinnerWithStatusBelowView
{
  return self->spinnerWithStatusBelowView;
}

- (void)setSpinnerWithStatusBelowView:(id)a3
{
}

- (UILabel)spinnerWithStatusBelowLabel
{
  return self->spinnerWithStatusBelowLabel;
}

- (void)setSpinnerWithStatusBelowLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinnerWithStatusBelowSpinner
{
  return self->spinnerWithStatusBelowSpinner;
}

- (void)setSpinnerWithStatusBelowSpinner:(id)a3
{
}

- (int)sbsMode
{
  return self->sbsMode;
}

- (void)setSbsMode:(int)a3
{
  self->sbsMode = a3;
}

@end