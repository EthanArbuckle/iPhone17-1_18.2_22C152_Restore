@interface InternetViewController
- (NSString)swapDescriptionText;
- (NSString)swapSourceLabelText;
- (UIImageView)cablingImageLastFrame;
- (UIView)descriptionContainerView;
- (UIView)diagramContainerView;
- (UIView)spinnerWithStatusAdjacentView;
- (UIView)tableHeaderContainerView;
- (unint64_t)internetFlow;
- (void)addInformationalDiagramWithWANConnectedBaseProductID:(unsigned int)a3 replacementProductID:(unsigned int)a4;
- (void)addInternetNotWorkingUI;
- (void)addInternetWANPluginUI;
- (void)addSwapCablingUI;
- (void)dealloc;
- (void)determineInfoForDevice:(id)a3 deviceDiagramInfo:(id *)a4;
- (void)loadView;
- (void)presentInternetDisconnectedUI;
- (void)presentInternetWANPluginUI;
- (void)presentSwapCablingCompleteUI;
- (void)presentSwapCablingUI;
- (void)setCablingImageLastFrame:(id)a3;
- (void)setCommonTraitsForLabel:(id)a3 forSize:(double)a4;
- (void)setDescriptionContainerView:(id)a3;
- (void)setDiagramContainerView:(id)a3;
- (void)setInternetFlow:(unint64_t)a3;
- (void)setSpinnerWithStatusAdjacentView:(id)a3;
- (void)setSwapDescriptionText:(id)a3;
- (void)setSwapSourceLabelText:(id)a3;
- (void)setTableHeaderContainerView:(id)a3;
- (void)startAnimatingCablingForView:(id)a3 startingOpacity:(float)a4 endingOpacity:(float)a5 duration:(double)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation InternetViewController

- (void)loadView
{
  v42 = 0;
  uint64_t v43 = 0;
  v41.receiver = self;
  v41.super_class = (Class)InternetViewController;
  [(AUUITableViewController *)&v41 loadView];
  v5 = objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  double v9 = v8;
  uint64_t v13 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v10, v11, v8, v12);
  objc_msgSend_setTableView_(self, v14, v13);
  uint64_t v17 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v15, v16, v9);
  objc_msgSend_setTableHeaderContainerView_(self, v18, v17);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->tableHeaderContainerView, v19, 0);
  self->spinnerWithStatusAdjacentLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_withSpinner_above_(AssistantSubUIViewController, v20, (uint64_t)&v43, &v42, 0, v9);
  objc_msgSend_setSpinnerWithStatusAdjacentView_(self, v21, v43);
  self->spinnerWithStatusAdjacentSpinner = v42;
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->spinnerWithStatusAdjacentView, v22, 0);
  uint64_t v43 = 0;
  self->descriptionLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v23, (uint64_t)&v43, v9);
  objc_msgSend_setDescriptionContainerView_(self, v24, v43);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->descriptionContainerView, v25, 0);
  uint64_t v28 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v26, v27, v9);
  objc_msgSend_setDiagramContainerView_(self, v29, v28);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->diagramContainerView, v30, 0);
  objc_msgSend_setLeftNavigationButton_enable_hide_(self, v31, @"kBack", 1, 0);
  BOOL v34 = objc_msgSend_internetFlow(self, v32, v33) != 3;
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v35, @"kNext", v34, 0);
  uint64_t v38 = objc_msgSend_internetFlow(self, v36, v37);
  switch(v38)
  {
    case 3:
      objc_msgSend_addSwapCablingUI(self, v39, v40);
      break;
    case 2:
      objc_msgSend_addInternetNotWorkingUI(self, v39, v40);
      break;
    case 1:
      objc_msgSend_addInternetWANPluginUI(self, v39, v40);
      break;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_msgSend_layer(self->cablingImageLastFrame, a2, a3);
  objc_msgSend_removeAllAnimations(v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)InternetViewController;
  [(AUUITableViewController *)&v8 viewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)InternetViewController;
  [(InternetViewController *)&v15 viewDidAppear:a3];
  objc_msgSend_bounds(self->tableHeaderContainerView, v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v12 = objc_msgSend_tableView(self, v10, v11);
  objc_msgSend_setContentSize_(v12, v13, v14, v7, v9);
}

- (void)dealloc
{
  objc_msgSend_setSpinnerWithStatusAdjacentView_(self, a2, 0);
  objc_msgSend_setDescriptionContainerView_(self, v3, 0);
  objc_msgSend_setTableHeaderContainerView_(self, v4, 0);
  objc_msgSend_setDiagramContainerView_(self, v5, 0);
  objc_msgSend_setCablingImageLastFrame_(self, v6, 0);
  objc_msgSend_setSwapDescriptionText_(self, v7, 0);
  objc_msgSend_setSwapSourceLabelText_(self, v8, 0);
  v9.receiver = self;
  v9.super_class = (Class)InternetViewController;
  [(AssistantSubUIViewController *)&v9 dealloc];
}

- (void)presentSwapCablingUI
{
}

- (void)presentSwapCablingCompleteUI
{
  uint64_t v4 = objc_msgSend_inParamDict(self, a2, v2);
  CFStringRef v6 = (const __CFString *)objc_msgSend_objectForKey_(v4, v5, @"kSBSKey_TargetBase");
  uint64_t v7 = sub_22685D62C(@"SwapAllCablesDetectedOK", qword_268148378);
  double v8 = NSString;
  unsigned int v16 = sub_22685AB94(v6, v9, v10, v11, v12, v13, v14, v15);
  int v24 = sub_22685AB68((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
  v25 = sub_22685D7D0(v16, v24, 0);
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v8, v26, v7, @"%@", 0, v25);
  sub_22684E878(self->descriptionLabel, (char *)self->descriptionContainerView, valid);
  objc_msgSend_setText_(self->spinnerWithStatusAdjacentLabel, v28, (uint64_t)&stru_26DA6BE88);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v29, @"kNext", 1, 0);
  spinnerWithStatusAdjacentSpinner = self->spinnerWithStatusAdjacentSpinner;

  objc_msgSend_stopAnimating(spinnerWithStatusAdjacentSpinner, v30, v31);
}

- (void)presentInternetWANPluginUI
{
}

- (void)presentInternetDisconnectedUI
{
}

- (void)determineInfoForDevice:(id)a3 deviceDiagramInfo:(id *)a4
{
  a4->var1 = sub_22685AB94((const __CFString *)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  a4->var2 = sub_22685BA14((const __CFString *)a3, v10, v11, v12, v13, v14, v15, v16);
  a4->var4 = sub_22685AB68((uint64_t)a3, v17, v18, v19, v20, v21, v22, v23);
  unsigned int v24 = sub_22683C4F8(a4->var1);
  a4->var3 = v24;
  a4->var0 = 1;
  if (v24) {
    a4->var0 = sub_22683C4C8(a4->var1);
  }
}

- (void)startAnimatingCablingForView:(id)a3 startingOpacity:(float)a4 endingOpacity:(float)a5 duration:(double)a6
{
  uint64_t v10 = objc_msgSend_layer(a3, a2, (uint64_t)a3);
  *(float *)&double v11 = a4;
  objc_msgSend_setOpacity_(v10, v12, v13, v11);
  uint64_t v15 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], v14, @"opacity");
  LODWORD(v16) = 2139095040;
  objc_msgSend_setRepeatCount_(v15, v17, v18, v16);
  objc_msgSend_setAutoreverses_(v15, v19, 1);
  objc_msgSend_setDuration_(v15, v20, v21, a6);
  *(float *)&double v22 = a5;
  uint64_t v25 = objc_msgSend_numberWithFloat_(NSNumber, v23, v24, v22);
  objc_msgSend_setToValue_(v15, v26, v25);
  uint64_t v29 = objc_msgSend_layer(a3, v27, v28);

  MEMORY[0x270F9A6D0](v29, sel_addAnimation_forKey_, v15);
}

- (UIView)tableHeaderContainerView
{
  return self->tableHeaderContainerView;
}

- (void)setTableHeaderContainerView:(id)a3
{
}

- (UIView)descriptionContainerView
{
  return self->descriptionContainerView;
}

- (void)setDescriptionContainerView:(id)a3
{
}

- (UIView)diagramContainerView
{
  return self->diagramContainerView;
}

- (void)setDiagramContainerView:(id)a3
{
}

- (UIView)spinnerWithStatusAdjacentView
{
  return self->spinnerWithStatusAdjacentView;
}

- (void)setSpinnerWithStatusAdjacentView:(id)a3
{
}

- (UIImageView)cablingImageLastFrame
{
  return self->cablingImageLastFrame;
}

- (void)setCablingImageLastFrame:(id)a3
{
}

- (unint64_t)internetFlow
{
  return self->internetFlow;
}

- (void)setInternetFlow:(unint64_t)a3
{
  self->internetFlow = a3;
}

- (NSString)swapDescriptionText
{
  return self->_swapDescriptionText;
}

- (void)setSwapDescriptionText:(id)a3
{
}

- (NSString)swapSourceLabelText
{
  return self->_swapSourceLabelText;
}

- (void)setSwapSourceLabelText:(id)a3
{
}

- (void)addSwapCablingUI
{
  uint64_t v4 = objc_msgSend_inParamDict(self, a2, v2);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"kSBSKey_TargetBase");
  uint64_t v9 = objc_msgSend_inParamDict(self, v7, v8);
  CFStringRef v11 = (const __CFString *)objc_msgSend_objectForKey_(v9, v10, @"kSBSKey_SourceBase");
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v12, v6, &v41);
  objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v13, (uint64_t)v11, &v38);
  double v16 = objc_msgSend_swapDescriptionText(self, v14, v15);
  if (!objc_msgSend_length(v16, v17, v18))
  {
    uint64_t v21 = NSString;
    uint64_t v22 = sub_22685D62C(@"SwapAllCables", qword_268148378);
    uint64_t v23 = sub_22685D7D0(v39, SHIDWORD(v40), 0);
    uint64_t v25 = sub_22685DA7C(v11, (const char *)1, v24);
    v26 = sub_22685D7D0(v42, SHIDWORD(v43), 0);
    uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v21, v27, v22, @"%@%@%@", 0, v23, v25, v26);
    objc_msgSend_setSwapDescriptionText_(self, v29, valid);
  }
  descriptionLabel = self->descriptionLabel;
  descriptionContainerView = (char *)self->descriptionContainerView;
  v32 = objc_msgSend_swapDescriptionText(self, v19, v20);
  sub_22684E878(descriptionLabel, descriptionContainerView, v32);
  objc_msgSend_startAnimating(self->spinnerWithStatusAdjacentSpinner, v33, v34);
  uint64_t v35 = sub_22685D62C(@"SwapCablesWaiting", qword_268148378);
  objc_msgSend_setText_(self->spinnerWithStatusAdjacentLabel, v36, v35);
  objc_msgSend_addInformationalDiagramWithWANConnectedBaseProductID_replacementProductID_(self, v37, v39, v42);
}

- (void)addInternetWANPluginUI
{
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v4 = objc_msgSend_inParamDict(self, a2, v2);
  objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v5, v4, &v26);
  uint64_t v6 = NSString;
  uint64_t v7 = sub_22685D75C(v27, SHIDWORD(v28));
  uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v6, v8, @"InternetNoWorkie%@", @"%@", 0, v7);
  uint64_t v10 = sub_22685D62C(@"TextualSentenceConcatenator", qword_268148378);
  CFStringRef v11 = NSString;
  uint64_t v12 = sub_22685D62C(valid, qword_268148378);
  uint64_t v13 = sub_22685D62C(@"PlugInWANCableForInternet", qword_268148378);
  uint64_t v15 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v11, v14, v10, @"%@%@", 0, v12, v13);
  uint64_t v16 = sub_22685D62C(@"TextualSentenceConcatenator2NewLines", qword_268148378);
  uint64_t v17 = NSString;
  uint64_t v18 = sub_22685D62C(@"ContinueWithoutInternet", qword_268148378);
  uint64_t v20 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v17, v19, v16, @"%@%@", 0, v15, v18);
  sub_22684E878(self->descriptionLabel, (char *)self->descriptionContainerView, v20);
  objc_msgSend_startAnimating(self->spinnerWithStatusAdjacentSpinner, v21, v22);
  uint64_t v23 = sub_22685D62C(@"WaitingForWANPlugin", qword_268148378);
  objc_msgSend_setText_(self->spinnerWithStatusAdjacentLabel, v24, v23);
  objc_msgSend_addInformationalDiagramWithWANConnectedBaseProductID_replacementProductID_(self, v25, v27, 0);
}

- (void)addInformationalDiagramWithWANConnectedBaseProductID:(unsigned int)a3 replacementProductID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [InfoDiagramView alloc];
  objc_msgSend_frame(self->diagramContainerView, v8, v9);
  id v11 = (id)objc_msgSend_initWithFrame_wanConnectedBaseProductID_replacementProductID_(v7, v10, v5, v4);
  if (objc_msgSend_swapSourceLabelText(self, v12, v13))
  {
    uint64_t v16 = objc_msgSend_swapSourceLabelText(self, v14, v15);
    objc_msgSend_setWANConnectedBaseLabelString_(v11, v17, v16);
  }
  objc_msgSend_addSubview_(self->diagramContainerView, v14, (uint64_t)v11);
  diagramContainerView = self->diagramContainerView;
  uint64_t v19 = (void *)MEMORY[0x263F08938];
  uint64_t v20 = _NSDictionaryOfVariableBindings(&cfstr_Diagramcontain.isa, diagramContainerView, 0);
  uint64_t v22 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v19, v21, @"V:[diagramContainerView(100@250)]", 0, 0, v20);
  objc_msgSend_addConstraints_(diagramContainerView, v23, v22);
  uint64_t v24 = self->diagramContainerView;
  uint64_t v25 = (void *)MEMORY[0x263F08938];
  uint64_t v26 = _NSDictionaryOfVariableBindings(&cfstr_Infoview.isa, v11, 0);
  uint64_t v28 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v25, v27, @"V:|-10-[infoView]-10-|", 512, 0, v26);
  objc_msgSend_addConstraints_(v24, v29, v28);
  v30 = self->diagramContainerView;
  uint64_t v32 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v31, (uint64_t)v11, 9, 0, v30, 9, 1.0, 0.0);
  objc_msgSend_addConstraint_(v30, v33, v32);
  uint64_t v34 = self->diagramContainerView;
  uint64_t v35 = (void *)MEMORY[0x263F08938];
  v36 = _NSDictionaryOfVariableBindings(&cfstr_Infoview.isa, v11, 0);
  uint64_t v38 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v35, v37, @"H:|-(>=10)-[infoView]-(>=10)-|", 0, 0, v36);
  objc_msgSend_addConstraints_(v34, v39, v38);
  objc_msgSend_setNeedsLayout(self->diagramContainerView, v40, v41);
  v44 = objc_msgSend_parentController(self, v42, v43);
  tableHeaderContainerView = self->tableHeaderContainerView;
  uint64_t v47 = objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v46, (uint64_t)self->spinnerWithStatusAdjacentView, self->diagramContainerView, self->descriptionContainerView, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v44, v48, (uint64_t)tableHeaderContainerView, v47, 1);
  v49 = self->tableHeaderContainerView;
  v52 = objc_msgSend_tableView(self, v50, v51);
  objc_msgSend_setTableHeaderView_(v52, v53, (uint64_t)v49);
  v56 = objc_msgSend_tableView(self, v54, v55);
  v57 = (void *)MEMORY[0x263F08938];
  v58 = _NSDictionaryOfVariableBindings(&cfstr_Tableheadercon.isa, self->tableHeaderContainerView, 0);
  uint64_t v60 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v57, v59, @"V:|[tableHeaderContainerView]", 0, 0, v58);
  objc_msgSend_addConstraints_(v56, v61, v60);
  v64 = objc_msgSend_tableView(self, v62, v63);
  v65 = (void *)MEMORY[0x263F08938];
  v66 = _NSDictionaryOfVariableBindings(&cfstr_Tableheadercon.isa, self->tableHeaderContainerView, 0);
  uint64_t v68 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v65, v67, @"H:|[tableHeaderContainerView]|", 0, 0, v66);
  objc_msgSend_addConstraints_(v64, v69, v68);
  v72 = objc_msgSend_tableView(self, v70, v71);
  v73 = (void *)MEMORY[0x263F08938];
  v74 = self->tableHeaderContainerView;
  uint64_t v77 = objc_msgSend_tableView(self, v75, v76);
  uint64_t v79 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v73, v78, (uint64_t)v74, 7, 0, v77, 7, 1.0, 0.0);
  objc_msgSend_addConstraint_(v72, v80, v79);
  cablingImageLastFrame = self->cablingImageLastFrame;

  MEMORY[0x270F9A6D0](self, sel_startAnimatingCablingForView_startingOpacity_endingOpacity_duration_, cablingImageLastFrame);
}

- (void)setCommonTraitsForLabel:(id)a3 forSize:(double)a4
{
  objc_msgSend_setTextAlignment_(a3, a2, 1);
  objc_msgSend_setLineBreakMode_(a3, v6, 0);
  uint64_t v9 = objc_msgSend__secondaryLabelColor(MEMORY[0x263F1C550], v7, v8);
  objc_msgSend_setTextColor_(a3, v10, v9);
  objc_msgSend_setNumberOfLines_(a3, v11, 0);
  uint64_t v15 = objc_msgSend_systemFontOfSize_(MEMORY[0x263F1C658], v12, v13, a4);

  objc_msgSend_setFont_(a3, v14, v15);
}

- (void)addInternetNotWorkingUI
{
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  uint64_t v4 = objc_msgSend_inParamDict(self, a2, v2);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"kSBSKey_TargetBase");
  objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v7, v6, &v79);
  uint64_t v8 = NSString;
  uint64_t v9 = sub_22685D75C(v80, SHIDWORD(v81));
  uint64_t v11 = objc_msgSend_stringWithFormat_(v8, v10, @"InternetNoWorkie%@", v9);
  uint64_t v12 = sub_22685D62C(@"TextualSentenceConcatenator2NewLines", qword_268148378);
  uint64_t v13 = NSString;
  uint64_t v14 = sub_22685D62C(v11, qword_268148378);
  uint64_t v15 = sub_22685D62C(@"NoInternet1", qword_268148378);
  uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v13, v16, v12, @"%@%@", 0, v14, v15);
  uint64_t v18 = NSString;
  uint64_t v19 = sub_22685D62C(@"NoInternet1.1", qword_268148378);
  uint64_t v21 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v18, v20, v12, @"%@%@", 0, valid, v19);
  uint64_t v22 = NSString;
  uint64_t v23 = sub_22685D62C(@"NoInternet2", qword_268148378);
  uint64_t v25 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v22, v24, v12, @"%@%@", 0, v21, v23);
  uint64_t v26 = NSString;
  uint64_t v27 = sub_22685D62C(@"NoInternet3", qword_268148378);
  uint64_t v29 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v26, v28, v12, @"%@%@", 0, v25, v27);
  v30 = NSString;
  uint64_t v31 = sub_22685D62C(@"ContinueWithoutInternet", qword_268148378);
  uint64_t v33 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v30, v32, v12, @"%@%@", 0, v29, v31);
  sub_22684E878(self->descriptionLabel, (char *)self->descriptionContainerView, v33);
  objc_msgSend_startAnimating(self->spinnerWithStatusAdjacentSpinner, v34, v35);
  uint64_t v36 = sub_22685D62C(@"WaitingForInternetAccess", qword_268148378);
  objc_msgSend_setText_(self->spinnerWithStatusAdjacentLabel, v37, v36);
  sub_22686CBB0(self->diagramContainerView, v38, v39);
  uint64_t v42 = objc_msgSend_parentController(self, v40, v41);
  tableHeaderContainerView = self->tableHeaderContainerView;
  uint64_t v45 = objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v44, (uint64_t)self->spinnerWithStatusAdjacentView, self->diagramContainerView, self->descriptionContainerView, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v42, v46, (uint64_t)tableHeaderContainerView, v45, 1);
  uint64_t v47 = self->tableHeaderContainerView;
  v50 = objc_msgSend_tableView(self, v48, v49);
  objc_msgSend_setTableHeaderView_(v50, v51, (uint64_t)v47);
  v54 = objc_msgSend_tableView(self, v52, v53);
  uint64_t v55 = (void *)MEMORY[0x263F08938];
  v56 = _NSDictionaryOfVariableBindings(&cfstr_Tableheadercon.isa, self->tableHeaderContainerView, 0);
  uint64_t v58 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v55, v57, @"V:|[tableHeaderContainerView]", 0, 0, v56);
  objc_msgSend_addConstraints_(v54, v59, v58);
  v62 = objc_msgSend_tableView(self, v60, v61);
  uint64_t v63 = (void *)MEMORY[0x263F08938];
  v64 = _NSDictionaryOfVariableBindings(&cfstr_Tableheadercon.isa, self->tableHeaderContainerView, 0);
  uint64_t v66 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v63, v65, @"H:|[tableHeaderContainerView]|", 0, 0, v64);
  objc_msgSend_addConstraints_(v62, v67, v66);
  v70 = objc_msgSend_tableView(self, v68, v69);
  uint64_t v71 = (void *)MEMORY[0x263F08938];
  v72 = self->tableHeaderContainerView;
  uint64_t v75 = objc_msgSend_tableView(self, v73, v74);
  uint64_t v77 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v71, v76, (uint64_t)v72, 7, 0, v75, 7, 1.0, 0.0);
  objc_msgSend_addConstraint_(v70, v78, v77);
}

@end