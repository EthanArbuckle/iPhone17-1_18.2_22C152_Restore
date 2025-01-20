@interface AssistantSubUIViewController
+ (id)containerViewWithWidth:(double)a3;
+ (id)labelViewInContainer:(id *)a3 width:(double)a4;
+ (id)labelViewInContainer:(id *)a3 width:(double)a4 constrain:(BOOL)a5;
+ (id)labelViewInContainer:(id *)a3 width:(double)a4 withSpinner:(id *)a5 above:(BOOL)a6;
+ (id)tableViewWithWidth:(double)a3 height:(double)a4;
+ (id)topoViewWithWidth:(double)a3;
- (AssistantSubUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AssistantUIViewController)parentController;
- (NSDictionary)inParamDict;
- (NSDictionary)outResultsDict;
- (id)getProductLocalizedStringWithFormat:(id)a3;
- (void)dealloc;
- (void)setInParamDict:(id)a3;
- (void)setLeftNavigationButton:(id)a3 enable:(BOOL)a4 hide:(BOOL)a5;
- (void)setParentController:(id)a3;
- (void)setRightNavigationButton:(id)a3 enable:(BOOL)a4 hide:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation AssistantSubUIViewController

- (AssistantSubUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AssistantSubUIViewController;
  v8 = [(AUUITableViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v8) {
    v8->_outResultsDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  if (dword_268145E68 <= 100 && (dword_268145E68 != -1 || sub_226865630((uint64_t)&dword_268145E68, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145E68, (uint64_t)"-[AssistantSubUIViewController initWithNibName:bundle:]", 100, (uint64_t)"%@\n", v4, v5, v6, v7, (uint64_t)v8);
  }
  return v8;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)AssistantSubUIViewController;
  [(AssistantSubUIViewController *)&v14 viewDidLoad];
  uint64_t v4 = objc_msgSend_objectForKey_(self->_inParamDict, v3, @"kSBSKey_TargetNetwork");
  int v6 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v5, v4);
  uint64_t v7 = sub_22685DBE0(v6);
  uint64_t v8 = sub_22685D62C((uint64_t)v7, qword_268148378);
  v11 = objc_msgSend_navigationItem(self, v9, v10);
  objc_msgSend_setTitle_(v11, v12, v8);
  objc_msgSend_setLeftNavigationButton_enable_hide_(self, v13, @"kBack", 1, 0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AssistantSubUIViewController;
  [(AUUITableViewController *)&v3 dealloc];
}

- (void)setLeftNavigationButton:(id)a3 enable:(BOOL)a4 hide:(BOOL)a5
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"kBack", a4, a5))
  {
    id v8 = objc_alloc(MEMORY[0x263F1C468]);
    uint64_t v9 = sub_22685D62C(@"kBack", qword_268148378);
    uint64_t v11 = objc_msgSend_initWithTitle_style_target_action_(v8, v10, v9, 0, 0, 0);
    objc_super v14 = objc_msgSend_navigationItem(self, v12, v13);
    objc_msgSend_setBackBarButtonItem_(v14, v15, v11);
  }
  else if (objc_msgSend_isEqualToString_(a3, v7, @"kCancel"))
  {
    id v16 = objc_alloc(MEMORY[0x263F1C468]);
    uint64_t v17 = sub_22685D62C(@"kCancel", qword_268148378);
    uint64_t v20 = objc_msgSend_parentController(self, v18, v19);
    uint64_t v22 = objc_msgSend_initWithTitle_style_target_action_(v16, v21, v17, 0, v20, sel_handleCancelButton_);
    v25 = objc_msgSend_navigationItem(self, v23, v24);
    objc_msgSend_setLeftBarButtonItem_(v25, v26, v22);
  }
}

- (void)setRightNavigationButton:(id)a3 enable:(BOOL)a4 hide:(BOOL)a5
{
  BOOL v6 = a4;
  if (objc_msgSend_isEqualToString_(a3, a2, @"kNext"))
  {
    if (a5)
    {
      id v10 = 0;
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x263F1C468]);
      uint64_t v12 = sub_22685D62C(@"kNext", qword_268148378);
      uint64_t v15 = objc_msgSend_parentController(self, v13, v14);
      id v10 = (id)objc_msgSend_initWithTitle_style_target_action_(v11, v16, v12, 2, v15, sel_handleNextButton_);
      objc_msgSend_setEnabled_(v10, v17, v6);
    }
    v18 = objc_msgSend_navigationItem(self, v8, v9);
    objc_msgSend_setRightBarButtonItem_(v18, v19, (uint64_t)v10);
  }
}

- (id)getProductLocalizedStringWithFormat:(id)a3
{
  uint64_t v5 = objc_msgSend_inParamDict(self, a2, (uint64_t)a3);

  return (id)objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v4, (uint64_t)a3, v5);
}

+ (id)labelViewInContainer:(id *)a3 width:(double)a4
{
  return (id)objc_msgSend_labelViewInContainer_width_constrain_(AssistantSubUIViewController, a2, (uint64_t)a3, 1, a4);
}

+ (id)labelViewInContainer:(id *)a3 width:(double)a4 constrain:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = objc_alloc(MEMORY[0x263F1CB60]);
  id v11 = (id)objc_msgSend_initWithFrame_(v8, v9, v10, 0.0, 0.0, a4, 50.0);
  uint64_t v12 = v11;
  if (a3) {
    *a3 = v11;
  }
  id v13 = objc_alloc(MEMORY[0x263F1C768]);
  id v16 = (id)objc_msgSend_initWithFrame_(v13, v14, v15, 0.0, 0.0, a4, 50.0);
  objc_msgSend_setText_(v16, v17, (uint64_t)&stru_26DA6BE88);
  uint64_t v20 = objc_msgSend_systemFontOfSize_(MEMORY[0x263F1C658], v18, v19, 15.0);
  objc_msgSend_setFont_(v16, v21, v20);
  objc_msgSend_setAdjustsFontSizeToFitWidth_(v16, v22, 1);
  objc_msgSend_setMinimumScaleFactor_(v16, v23, v24, 0.866666667);
  uint64_t v27 = objc_msgSend__secondaryLabelColor(MEMORY[0x263F1C550], v25, v26);
  objc_msgSend_setTextColor_(v16, v28, v27);
  objc_msgSend_setTextAlignment_(v16, v29, 1);
  objc_msgSend_setLineBreakMode_(v16, v30, 0);
  objc_msgSend_setNumberOfLines_(v16, v31, 0);
  objc_msgSend_addSubview_(v12, v32, (uint64_t)v16);
  if (v5)
  {
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v16, v33, 0);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v12, v34, 0);
    v35 = (void *)MEMORY[0x263F08938];
    v36 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v16, 0);
    uint64_t v38 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v35, v37, @"V:|-10-[label]-10-|", 0, 0, v36);
    objc_msgSend_addConstraints_(v12, v39, v38);
    v40 = (void *)MEMORY[0x263F08938];
    v41 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v16, 0);
    uint64_t v43 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v40, v42, @"H:|-10-[label]-10-|", 0, 0, v41);
    objc_msgSend_addConstraints_(v12, v44, v43);
  }
  return v16;
}

+ (id)labelViewInContainer:(id *)a3 width:(double)a4 withSpinner:(id *)a5 above:(BOOL)a6
{
  BOOL v6 = a6;
  v48 = 0;
  uint64_t v9 = objc_msgSend_labelViewInContainer_width_constrain_(AssistantSubUIViewController, a2, (uint64_t)&v48, 0, a4);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v9, v10, 0);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v48, v11, 0);
  if (a3) {
    *a3 = v48;
  }
  id v12 = objc_alloc(MEMORY[0x263F1C3D8]);
  id v14 = (id)objc_msgSend_initWithActivityIndicatorStyle_(v12, v13, 100);
  uint64_t v17 = objc_msgSend__labelColor(MEMORY[0x263F1C550], v15, v16);
  objc_msgSend_setColor_(v14, v18, v17);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v14, v19, 0);
  if (a5) {
    *a5 = v14;
  }
  objc_msgSend_addSubview_(v48, v20, (uint64_t)v14);
  v21 = v48;
  uint64_t v22 = (void *)MEMORY[0x263F08938];
  if (v6)
  {
    v23 = _NSDictionaryOfVariableBindings(&cfstr_SpinnerLabel.isa, v14, v9, 0);
    uint64_t v25 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v22, v24, @"V:|-4-[spinner]-4-[label]-4-|", 0, 0, v23);
    objc_msgSend_addConstraints_(v21, v26, v25);
    uint64_t v27 = v48;
    uint64_t v29 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x263F08938], v28, (uint64_t)v14, 9, 0, v48, 9, 1.0, 0.0);
    objc_msgSend_addConstraint_(v27, v30, v29);
    v31 = v48;
    v32 = (void *)MEMORY[0x263F08938];
    v33 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v9, 0);
    uint64_t v35 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v32, v34, @"H:|-10-[label]-10-|", 0, 0, v33);
    objc_msgSend_addConstraints_(v31, v36, v35);
  }
  else
  {
    v37 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v9, 0);
    uint64_t v39 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v22, v38, @"V:|-10-[label]-10-|", 0, 0, v37);
    objc_msgSend_addConstraints_(v21, v40, v39);
    v41 = v48;
    v42 = (void *)MEMORY[0x263F08938];
    uint64_t v43 = _NSDictionaryOfVariableBindings(&cfstr_SpinnerLabel.isa, v14, v9, 0);
    uint64_t v45 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v42, v44, @"H:|-[spinner]-[label]-|", 1024, 0, v43);
    objc_msgSend_addConstraints_(v41, v46, v45);
  }
  return v9;
}

+ (id)topoViewWithWidth:(double)a3
{
  uint64_t v4 = [UITopoView alloc];
  id v7 = (id)objc_msgSend_initWithFrame_(v4, v5, v6, 0.0, 0.0, a3, 140.0);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v7, v8, 0);
  return v7;
}

+ (id)containerViewWithWidth:(double)a3
{
  id v4 = objc_alloc(MEMORY[0x263F1CB60]);
  id v7 = objc_msgSend_initWithFrame_(v4, v5, v6, 0.0, 0.0, a3, 20.0);

  return v7;
}

+ (id)tableViewWithWidth:(double)a3 height:(double)a4
{
  id v6 = objc_alloc(MEMORY[0x263F1CA40]);
  id v8 = objc_msgSend_initWithFrame_style_(v6, v7, 1, 0.0, 0.0, a3, a4);

  return v8;
}

- (AssistantUIViewController)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
  self->_parentController = (AssistantUIViewController *)a3;
}

- (NSDictionary)inParamDict
{
  return self->_inParamDict;
}

- (void)setInParamDict:(id)a3
{
}

- (NSDictionary)outResultsDict
{
  return &self->_outResultsDict->super;
}

@end