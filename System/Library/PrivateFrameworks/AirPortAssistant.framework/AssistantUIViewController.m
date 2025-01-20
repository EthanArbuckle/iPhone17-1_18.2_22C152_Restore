@interface AssistantUIViewController
+ (void)readjustSubviewsInContainer:(id)a3;
- (AUPasswordUIAlert)passwordAlert;
- (AUUIAlert)askUserQuestionAlert;
- (AUUIAlert)connectionVerificationAlert;
- (AUUIAlert)uiAlert;
- (AssistantCallbackController)_controllerContext;
- (AssistantSubUIViewController)currentSubController;
- (AssistantUIController)_assistantUIController;
- (AssistantUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AssistantViewControllerDelegate)assistantDelegate;
- (BOOL)auUIAlertAlternateAction:(id)a3;
- (BOOL)auUIAlertCancelAction:(id)a3;
- (BOOL)auUIAlertDestructiveAction:(id)a3;
- (BOOL)auUIAlertOKAction:(id)a3;
- (BOOL)disablesAutomaticKeyboardDismissal;
- (NSArray)paramScanResults;
- (NSDictionary)callerParamDict;
- (NSDictionary)recommendationParamDict;
- (NSDictionary)scanInfoRecord;
- (NSString)macAddress;
- (NSString)settingUpStatusText;
- (NetTopoMiniStaticLayout)topoLayout;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)nextButton;
- (UILabel)justTextLabel;
- (UITableView)mainTableView;
- (UITextField)currentTextField;
- (UIView)justTextContainerView;
- (UIView)spinnerWithStatusAdjacentView;
- (UIView)spinnerWithStatusBelowView;
- (UIView)tableHeaderContainerView;
- (UIView)topoView;
- (id)modifyTopoUIInLayer:(id)a3 withLayout:(id)a4 newLayout:(id)a5;
- (id)newStepByStepControllerForStep:(int)a3;
- (id)radioNameFromBaseStation:(id)a3;
- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5;
- (int)callbackAskUserAQuestion:(int)a3 paramDict:(id)a4 forController:(id)a5;
- (int)callbackAskUserForPassword:(int)a3 param:(id)a4 forController:(id)a5;
- (int)callbackAskUserForSetupCode:(int)a3 isRetry:(BOOL)a4 forController:(id)a5;
- (int)callbackAskUserForUncertifiedForController:(id)a3;
- (int64_t)letMeChooseButtonIndex;
- (int64_t)recommendationButtonIndex;
- (int64_t)restoreButtonIndex;
- (void)assistantUpdateProgress:(id)a3 forState:(int)a4;
- (void)assistantWaitingForResourcesComplete;
- (void)assistantWaitingForResourcesStart;
- (void)baseStationConfigurationComplete:(id)a3;
- (void)callbackAskCancel;
- (void)confirmSkipWANPort;
- (void)connectionVerificationSucceededForSelector:(int)a3;
- (void)continueWithDiagsAndUsageStats;
- (void)continueWithGuestNetSettings;
- (void)continueWithPPPoESettings;
- (void)continueWithSwapCabling;
- (void)dealloc;
- (void)doneWithAssistantResult:(int)a3;
- (void)handeImmediateCancel;
- (void)handleCancelButton:(id)a3;
- (void)handleCancelRequest:(BOOL)a3;
- (void)handleNextButton:(id)a3;
- (void)initializeServiesDone;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)playDoneSound;
- (void)popToRootViewControllerAnimated:(BOOL)a3;
- (void)presentUIForRecommendationResult:(int)a3 paramDict:(id)a4;
- (void)presentUIForRecommendationStatus;
- (void)presentUIForRecommmendationTargetInfo:(id)a3;
- (void)presentUIForSetupResult:(int)a3 baseStationInfo:(id)a4 withPrompt:(id)a5;
- (void)presentUIForSetupStatusWithRecommendationDict:(id)a3;
- (void)presentUIForStepByStepNextStep:(int)a3 paramDict:(id)a4;
- (void)presentWaitingForWANViewWithContinueText:(BOOL)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)readyToGuess;
- (void)replaceSubviewsInView:(id)a3 newSubviews:(id)a4 withAnimation:(BOOL)a5;
- (void)setAskUserQuestionAlert:(id)a3;
- (void)setAssistantDelegate:(id)a3;
- (void)setCallerParamDict:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setConnectionVerificationAlert:(id)a3;
- (void)setCurrentSubController:(id)a3;
- (void)setCurrentTextField:(id)a3;
- (void)setJustTextContainerView:(id)a3;
- (void)setJustTextLabel:(id)a3;
- (void)setLetMeChooseButtonIndex:(int64_t)a3;
- (void)setMacAddress:(id)a3;
- (void)setMainTableView:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setParamScanResults:(id)a3;
- (void)setPasswordAlert:(id)a3;
- (void)setRecommendationButtonIndex:(int64_t)a3;
- (void)setRecommendationParamDict:(id)a3;
- (void)setRestoreButtonIndex:(int64_t)a3;
- (void)setScanInfoRecord:(id)a3;
- (void)setSettingUpStatusText:(id)a3;
- (void)setSpinnerWithStatusAdjacentView:(id)a3;
- (void)setSpinnerWithStatusBelowView:(id)a3;
- (void)setTableHeaderContainerView:(id)a3;
- (void)setTopoLayout:(id)a3;
- (void)setTopoView:(id)a3;
- (void)setUiAlert:(id)a3;
- (void)set_assistantUIController:(id)a3;
- (void)set_controllerContext:(id)a3;
- (void)setupCompleteShowPasswords:(BOOL)a3;
- (void)showAskUserForPPPoECredentialsForStatus:(int)a3 paramDict:(id)a4;
- (void)showAskUserSwapCablingForStatus:(int)a3 paramDict:(id)a4;
- (void)showTellUserToFixTheirInternetConnection;
- (void)showTellUserToPlugInEthernetForStatus:(int)a3 paramDict:(id)a4;
- (void)showTellUserToResetBroadbandDeviceForStatus:(int)a3 paramDict:(id)a4;
- (void)showUIConfigPromptForGuestNetConfigWithParamDict:(id)a3;
- (void)showUIConfigPromptToSendDiagsUsageStatsWithParamDict:(id)a3;
- (void)showUIForSetupStatus;
- (void)skipPluginAudioCabling;
- (void)skipWANPort;
- (void)startSetup:(id)a3;
- (void)touchInCellAtIndexPath:(id)a3;
@end

@implementation AssistantUIViewController

- (AssistantUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AssistantUIViewController;
  v4 = [(AUUITableViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    sub_22685D5C4(@"SetupRecommendations");
  }
  return v4;
}

- (void)loadView
{
  v145[1] = *MEMORY[0x263EF8340];
  v143.receiver = self;
  v143.super_class = (Class)AssistantUIViewController;
  [(AUUITableViewController *)&v143 loadView];
  if (!objc_msgSend__assistantUIController(self, v3, v4))
  {
    objc_super v6 = objc_alloc_init(AssistantUIController);
    objc_msgSend_set_assistantUIController_(self, v7, (uint64_t)v6);
  }
  objc_msgSend_setDelegate_(self, v5, (uint64_t)self);
  id v8 = objc_alloc(MEMORY[0x263F1C468]);
  id v10 = (id)objc_msgSend_initWithBarButtonSystemItem_target_action_(v8, v9, 1, self, sel_handleCancelButton_);
  objc_msgSend_setCancelButton_(self, v11, (uint64_t)v10);
  id v12 = objc_alloc(MEMORY[0x263F1C468]);
  uint64_t v13 = sub_22685D62C(@"kNext", qword_268148378);
  id v15 = (id)objc_msgSend_initWithTitle_style_target_action_(v12, v14, v13, 2, self, sel_handleNextButton_);
  objc_msgSend_setNextButton_(self, v16, (uint64_t)v15);
  uint64_t v19 = objc_msgSend_cancelButton(self, v17, v18);
  v22 = objc_msgSend_navigationItem(self, v20, v21);
  objc_msgSend_setLeftBarButtonItem_(v22, v23, v19);
  uint64_t Button = objc_msgSend_nextButton(self, v24, v25);
  v29 = objc_msgSend_navigationItem(self, v27, v28);
  objc_msgSend_setRightBarButtonItem_(v29, v30, Button);
  v33 = objc_msgSend_nextButton(self, v31, v32);
  objc_msgSend_setEnabled_(v33, v34, 0);
  v37 = objc_msgSend_cancelButton(self, v35, v36);
  objc_msgSend_setEnabled_(v37, v38, 0);
  LODWORD(v40) = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v39, (uint64_t)self->_scanInfoRecord);
  if (!v40)
  {
    uint64_t v40 = objc_msgSend_callerParamDict(self, v41, v42);
    if (v40)
    {
      v45 = objc_msgSend_callerParamDict(self, v43, v44);
      v47 = objc_msgSend_objectForKey_(v45, v46, @"wacShouldHideFindAppUI");
      if (objc_msgSend_BOOLValue(v47, v48, v49)) {
        LODWORD(v40) = 4;
      }
      else {
        LODWORD(v40) = 0;
      }
    }
  }
  v50 = sub_22685DBE0(v40);
  uint64_t v51 = sub_22685D62C((uint64_t)v50, qword_268148378);
  v54 = objc_msgSend_navigationItem(self, v52, v53);
  objc_msgSend_setTitle_(v54, v55, v51);
  objc_msgSend_setDelegate_(self->_assistantUIController, v56, (uint64_t)self);
  objc_msgSend_performSelector_withObject_afterDelay_(self, v57, (uint64_t)sel_initializeServiesDone, 0, 0.0);
  v60 = objc_msgSend_navigationController(self, v58, v59);
  objc_msgSend_setDelegate_(v60, v61, (uint64_t)self);
  id v62 = objc_alloc(MEMORY[0x263F1C468]);
  uint64_t v63 = sub_22685D62C(@"kBack", qword_268148378);
  id v65 = (id)objc_msgSend_initWithTitle_style_target_action_(v62, v64, v63, 0, 0, 0);
  v68 = objc_msgSend_navigationItem(self, v66, v67);
  objc_msgSend_setBackBarButtonItem_(v68, v69, (uint64_t)v65);
  uint64_t v142 = 0;
  v72 = objc_msgSend_view(self, v70, v71);
  objc_msgSend_frame(v72, v73, v74);
  self->justTextLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v75, (uint64_t)&v142, v76);
  objc_msgSend_setJustTextContainerView_(self, v77, v142);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->justTextContainerView, v78, 0);
  justTextLabel = self->justTextLabel;
  v80 = (void *)MEMORY[0x263F08938];
  v144 = @"height";
  v81 = NSNumber;
  objc_msgSend_frame(justTextLabel, v82, v83);
  *(float *)&double v85 = v84;
  v145[0] = objc_msgSend_numberWithFloat_(v81, v86, v87, v85);
  uint64_t v89 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v88, (uint64_t)v145, &v144, 1);
  v90 = _NSDictionaryOfVariableBindings(&cfstr_Justtextlabel.isa, self->justTextLabel, 0);
  uint64_t v92 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v80, v91, @"V:[justTextLabel(>=height)]", 0, v89, v90);
  objc_msgSend_addConstraints_(justTextLabel, v93, v92);
  v141 = 0;
  uint64_t v142 = 0;
  v96 = objc_msgSend_view(self, v94, v95);
  objc_msgSend_frame(v96, v97, v98);
  self->spinnerWithStatusBelowLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_withSpinner_above_(AssistantSubUIViewController, v99, (uint64_t)&v142, &v141, 1, v100);
  uint64_t v101 = v142;
  self->spinnerWithStatusBelowSpinner = v141;
  objc_msgSend_setSpinnerWithStatusBelowView_(self, v102, v101);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->spinnerWithStatusBelowView, v103, 0);
  uint64_t v142 = 0;
  v106 = objc_msgSend_view(self, v104, v105);
  objc_msgSend_frame(v106, v107, v108);
  uint64_t v112 = objc_msgSend_topoViewWithWidth_(AssistantSubUIViewController, v109, v110, v111);
  objc_msgSend_setTopoView_(self, v113, v112);
  v116 = objc_msgSend_view(self, v114, v115);
  objc_msgSend_frame(v116, v117, v118);
  uint64_t v122 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v119, v120, v121);
  objc_msgSend_setTableHeaderContainerView_(self, v123, v122);
  v126 = objc_msgSend_view(self, v124, v125);
  objc_msgSend_frame(v126, v127, v128);
  double v130 = v129;
  v133 = objc_msgSend_view(self, v131, v132);
  objc_msgSend_frame(v133, v134, v135);
  uint64_t v139 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v136, v137, v130, v138);
  objc_msgSend_setTableView_(self, v140, v139);
}

- (void)initializeServiesDone
{
}

- (void)dealloc
{
  objc_msgSend_setPasswordAlert_(self, v3, 0);
  objc_msgSend_setAskUserQuestionAlert_(self, v4, 0);
  objc_msgSend_setConnectionVerificationAlert_(self, v5, 0);
  objc_msgSend_set_controllerContext_(self, v6, 0);
  mfiAccessoryResponseDict = self->_mfiAccessoryResponseDict;
  if (mfiAccessoryResponseDict) {

  }
  sub_22685D600();
  objc_msgSend_setCurrentSubController_(self, v8, 0);
  objc_msgSend_setJustTextContainerView_(self, v9, 0);
  objc_msgSend_setSpinnerWithStatusBelowView_(self, v10, 0);
  objc_msgSend_setTopoView_(self, v11, 0);
  v12.receiver = self;
  v12.super_class = (Class)AssistantUIViewController;
  [(AUUITableViewController *)&v12 dealloc];
}

- (void)readyToGuess
{
  uint64_t v6 = objc_msgSend_macAddress(self, a2, v2);
  if (v6
    || (v7 = objc_msgSend_scanInfoRecord(self, v4, v5),
        (uint64_t v6 = objc_msgSend_objectForKey_(v7, v8, @"BSSID")) != 0)
    || (v9 = objc_msgSend_scanInfoRecord(self, v4, v5),
        (uint64_t v6 = objc_msgSend_objectForKey_(v9, v10, @"raMA")) != 0))
  {
    uint64_t v11 = objc_msgSend_scanInfoRecord(self, v4, v5);
    objc_msgSend_setTargetScanRecord_(self->_assistantUIController, v12, v11);
    objc_msgSend_setTargetMACAddress_(self->_assistantUIController, v13, v6);
    uint64_t v16 = objc_msgSend_paramScanResults(self, v14, v15);
    objc_msgSend_setParamScanResults_(self->_assistantUIController, v17, v16);
    assistantUIController = self->_assistantUIController;
    MEMORY[0x270F9A6D0](assistantUIController, sel_startAutoGuess, v18);
  }
}

- (void)baseStationConfigurationComplete:(id)a3
{
  if (objc_msgSend_doneWithAssistant_(self->_assistantUIController, a2, 0) != -6771)
  {
    uint64_t v6 = objc_msgSend_assistantResult(self->_assistantUIController, v4, v5);
    MEMORY[0x270F9A6D0](self, sel_doneWithAssistantResult_, v6);
  }
}

- (void)callbackAskCancel
{
  if (objc_msgSend__controllerContext(self, a2, v2)) {
    objc_msgSend_set_controllerContext_(self, v4, 0);
  }
  uint64_t v6 = objc_msgSend_uiAlert(self, v4, v5);

  objc_msgSend_dismissWithNoActionAnimated_(v6, v7, 1);
}

- (BOOL)auUIAlertOKAction:(id)a3
{
  switch(objc_msgSend_tag(a3, a2, (uint64_t)a3))
  {
    case 4000:
      objc_msgSend_skipWANPort(self, v5, v6);
      goto LABEL_10;
    case 4001:
      id v8 = objc_msgSend_uiAlert(self, v5, v6);
      uint64_t v11 = objc_msgSend_context(v8, v9, v10);
      v14 = objc_msgSend_textField(a3, v12, v13);
      uint64_t v17 = objc_msgSend_text(v14, v15, v16);
      objc_msgSend_callbackAskUserForPasswordResult_password_remember_(v11, v18, 0, v17, 2);
      goto LABEL_10;
    case 4002:
      uint64_t v19 = objc_msgSend_uiAlert(self, v5, v6);
      v22 = objc_msgSend_context(v19, v20, v21);
      objc_msgSend_callbackAskUserAQuestionResult_result_(v22, v23, 4, 0);
      goto LABEL_10;
    case 4003:
      v24 = objc_msgSend_uiAlert(self, v5, v6);
      v27 = objc_msgSend_context(v24, v25, v26);
      objc_msgSend_callbackAskUserAQuestionResult_result_(v27, v28, 5, 4294960539);
      goto LABEL_10;
    case 4004:
      v29 = objc_msgSend_uiAlert(self, v5, v6);
      uint64_t v32 = objc_msgSend_context(v29, v30, v31);
      v35 = objc_msgSend_textField(a3, v33, v34);
      uint64_t v38 = objc_msgSend_text(v35, v36, v37);
      objc_msgSend_callbackAskUserForSetupCodeResult_password_(v32, v39, 0, v38);
      goto LABEL_10;
    case 4005:
      uint64_t v40 = objc_msgSend_uiAlert(self, v5, v6);
      v43 = objc_msgSend_context(v40, v41, v42);
      objc_msgSend_callbackAskUserForUncertifiedResult_(v43, v44, 0);
LABEL_10:
      BOOL v7 = 1;
      break;
    default:
      BOOL v7 = 0;
      break;
  }
  objc_msgSend_setUiAlert_(self, v5, 0);
  return v7;
}

- (BOOL)auUIAlertCancelAction:(id)a3
{
  switch(objc_msgSend_tag(a3, a2, (uint64_t)a3))
  {
    case 4000:
      goto LABEL_9;
    case 4001:
      uint64_t v6 = objc_msgSend_uiAlert(self, v4, v5);
      v9 = objc_msgSend_context(v6, v7, v8);
      objc_msgSend_callbackAskUserForPasswordResult_password_remember_(v9, v10, 4294960573, 0, 2);
      goto LABEL_9;
    case 4002:
      objc_super v12 = objc_msgSend_uiAlert(self, v4, v5);
      uint64_t v15 = objc_msgSend_context(v12, v13, v14);
      objc_msgSend_callbackAskUserAQuestionResult_result_(v15, v16, 4, 4294960573);
      goto LABEL_9;
    case 4003:
      uint64_t v17 = objc_msgSend_uiAlert(self, v4, v5);
      v20 = objc_msgSend_context(v17, v18, v19);
      objc_msgSend_callbackAskUserAQuestionResult_result_(v20, v21, 5, 4294960527);
      goto LABEL_9;
    case 4004:
      v22 = objc_msgSend_uiAlert(self, v4, v5);
      uint64_t v25 = objc_msgSend_context(v22, v23, v24);
      objc_msgSend_callbackAskUserForSetupCodeResult_password_(v25, v26, 4294960573, &stru_26DA6BE88);
      goto LABEL_9;
    case 4005:
      v27 = objc_msgSend_uiAlert(self, v4, v5);
      v30 = objc_msgSend_context(v27, v28, v29);
      objc_msgSend_callbackAskUserForUncertifiedResult_(v30, v31, 4294960573);
LABEL_9:
      BOOL v11 = 1;
      break;
    default:
      BOOL v11 = 0;
      break;
  }
  objc_msgSend_setUiAlert_(self, v4, 0);
  return v11;
}

- (BOOL)auUIAlertAlternateAction:(id)a3
{
  return 0;
}

- (BOOL)auUIAlertDestructiveAction:(id)a3
{
  return 0;
}

- (int)callbackAskUserForUncertifiedForController:(id)a3
{
  if (objc_msgSend_uiAlert(self, a2, (uint64_t)a3)) {
    return -6721;
  }
  sub_22685D5C4(@"SetupRecommendations");
  uint64_t v6 = [AUUIAlert alloc];
  id v8 = (id)objc_msgSend_initWithViewController_(v6, v7, (uint64_t)self);
  objc_msgSend_setUiAlert_(self, v9, (uint64_t)v8);
  uint64_t v10 = sub_22685D62C(@"kAddHomeKitAccessoryTitle", qword_268148378);
  objc_msgSend_setTitle_(self->uiAlert, v11, v10);
  uint64_t v12 = sub_22685D62C(@"kAddHomeKitAccessoryMessage", qword_268148378);
  objc_msgSend_setMessage_(self->uiAlert, v13, v12);
  objc_msgSend_setDelegate_(self->uiAlert, v14, (uint64_t)self);
  uint64_t v15 = sub_22685D62C(@"kAddHomeKitAccessoryAddAnyway", qword_268148378);
  objc_msgSend_setOkButtonTitle_(self->uiAlert, v16, v15);
  uint64_t v17 = sub_22685D62C(@"kCancel", qword_268148378);
  objc_msgSend_setCancelButtonTitle_(self->uiAlert, v18, v17);
  objc_msgSend_setContext_(self->uiAlert, v19, (uint64_t)a3);
  objc_msgSend_setTag_(self->uiAlert, v20, 4005);
  objc_msgSend_show(self->uiAlert, v21, v22);
  return 0;
}

- (int)callbackAskUserForPassword:(int)a3 param:(id)a4 forController:(id)a5
{
  if (!a4) {
    return -6705;
  }
  if (objc_msgSend_uiAlert(self, a2, *(uint64_t *)&a3)) {
    return -6721;
  }
  if (!a3)
  {
    uint64_t v10 = @"kAskUserForBasePassword";
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    uint64_t v10 = @"kAskUserForNetworkPassword";
LABEL_9:
    BOOL v11 = NSString;
    uint64_t v12 = sub_22685D62C((uint64_t)v10, qword_268148378);
    uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v11, v13, v12, @"%@", 0, a4);
    uint64_t v15 = [AUPasswordUIAlert alloc];
    id v17 = (id)objc_msgSend_initWithViewController_(v15, v16, (uint64_t)self);
    objc_msgSend_setUiAlert_(self, v18, (uint64_t)v17);
    objc_msgSend_setTitle_(self->uiAlert, v19, valid);
    objc_msgSend_setMessage_(self->uiAlert, v20, (uint64_t)&stru_26DA6BE88);
    objc_msgSend_setDelegate_(self->uiAlert, v21, (uint64_t)self);
    uint64_t v22 = sub_22685D62C(@"kOK", qword_268148378);
    objc_msgSend_setOkButtonTitle_(self->uiAlert, v23, v22);
    uint64_t v24 = sub_22685D62C(@"kCancel", qword_268148378);
    objc_msgSend_setCancelButtonTitle_(self->uiAlert, v25, v24);
    objc_msgSend_setContext_(self->uiAlert, v26, (uint64_t)a5);
    objc_msgSend_setTag_(self->uiAlert, v27, 4001);
    objc_msgSend_show(self->uiAlert, v28, v29);
    return 0;
  }
  return -6705;
}

- (int)callbackAskUserForSetupCode:(int)a3 isRetry:(BOOL)a4 forController:(id)a5
{
  BOOL v6 = a4;
  if (objc_msgSend_uiAlert(self, a2, *(uint64_t *)&a3)) {
    return -6721;
  }
  sub_22685D5C4(@"SetupRecommendations");
  if (v6) {
    v9 = @"kAskUserForSetupCodeRetry";
  }
  else {
    v9 = @"kAskUserForSetupCode";
  }
  uint64_t v10 = sub_22685D62C((uint64_t)v9, qword_268148378);
  BOOL v11 = [AUSetupCodeUIAlert alloc];
  id v13 = (id)objc_msgSend_initWithViewController_(v11, v12, (uint64_t)self);
  objc_msgSend_setUiAlert_(self, v14, (uint64_t)v13);
  objc_msgSend_setTitle_(self->uiAlert, v15, v10);
  objc_msgSend_setMessage_(self->uiAlert, v16, (uint64_t)&stru_26DA6BE88);
  objc_msgSend_setDelegate_(self->uiAlert, v17, (uint64_t)self);
  uint64_t v18 = sub_22685D62C(@"kOK", qword_268148378);
  objc_msgSend_setOkButtonTitle_(self->uiAlert, v19, v18);
  uint64_t v20 = sub_22685D62C(@"kCancel", qword_268148378);
  objc_msgSend_setCancelButtonTitle_(self->uiAlert, v21, v20);
  objc_msgSend_setContext_(self->uiAlert, v22, (uint64_t)a5);
  objc_msgSend_setTag_(self->uiAlert, v23, 4004);
  objc_msgSend_show(self->uiAlert, v24, v25);
  return 0;
}

- (int)callbackAskUserAQuestion:(int)a3 paramDict:(id)a4 forController:(id)a5
{
  if (self->_controllerContext) {
    return -6721;
  }
  if (a3 == 5)
  {
    if (a4)
    {
      uint64_t v9 = objc_msgSend_objectForKey_(a4, a2, @"kAssistantCallbackAskUserParamKey_MessageKey");
      uint64_t v10 = sub_22685D62C(v9, qword_268148378);
      uint64_t v12 = objc_msgSend_objectForKey_(a4, v11, @"kAssistantCallbackAskUserParamKey_OKKey");
      uint64_t v13 = sub_22685D62C(v12, qword_268148378);
      uint64_t v15 = objc_msgSend_objectForKey_(a4, v14, @"kAssistantCallbackAskUserParamKey_CancelKey");
      uint64_t v16 = sub_22685D62C(v15, qword_268148378);
      id v17 = [AUUIAlert alloc];
      id v19 = (id)objc_msgSend_initWithViewController_(v17, v18, (uint64_t)self);
      objc_msgSend_setUiAlert_(self, v20, (uint64_t)v19);
      objc_msgSend_setTitle_(self->uiAlert, v21, v10);
      objc_msgSend_setMessage_(self->uiAlert, v22, (uint64_t)&stru_26DA6BE88);
      objc_msgSend_setDelegate_(self->uiAlert, v23, (uint64_t)self);
      objc_msgSend_setOkButtonTitle_(self->uiAlert, v24, v13);
      objc_msgSend_setCancelButtonTitle_(self->uiAlert, v25, v16);
      objc_msgSend_setContext_(self->uiAlert, v26, (uint64_t)a5);
      objc_msgSend_setTag_(self->uiAlert, v27, 4003);
      objc_msgSend_show(self->uiAlert, v28, v29);
      return 0;
    }
  }
  else
  {
    if (a3 != 4)
    {
      if (a3 == 3) {
        objc_msgSend_callbackAskUserAQuestionResult_result_(a5, a2, *(uint64_t *)&a3, 0);
      }
      return 0;
    }
    if (a4)
    {
      uint64_t v30 = objc_msgSend_objectForKey_(a4, a2, @"kAssistantCallbackAskUserParamKey_Warning_MessageKey");
      uint64_t v32 = objc_msgSend_objectForKey_(a4, v31, @"kAssistantCallbackAskUserParamKey_Warning_MessageParam1");
      uint64_t v34 = objc_msgSend_objectForKey_(a4, v33, @"kAssistantCallbackAskUserParamKey_Warning_MessageParam2");
      v35 = NSString;
      uint64_t v36 = sub_22685D62C(v30, qword_268148378);
      uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v35, v37, v36, @"%@%@", 0, v32, v34);
      uint64_t v40 = objc_msgSend_objectForKey_(a4, v39, @"kAssistantCallbackAskUserParamKey_Warning_PromptKey");
      uint64_t v42 = objc_msgSend_objectForKey_(a4, v41, @"kAssistantCallbackAskUserParamKey_Warning_PromptParam1");
      uint64_t v44 = objc_msgSend_objectForKey_(a4, v43, @"kAssistantCallbackAskUserParamKey_Warning_PromptParam2");
      v45 = NSString;
      uint64_t v46 = sub_22685D62C(v40, qword_268148378);
      uint64_t v48 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v45, v47, v46, @"%@%@", 0, v42, v44);
      v50 = (__CFString *)objc_msgSend_objectForKey_(a4, v49, @"kAssistantCallbackAskUserParamKey_OKKey");
      if (!v50) {
        v50 = @"kOK";
      }
      uint64_t v51 = sub_22685D62C((uint64_t)v50, qword_268148378);
      uint64_t v53 = objc_msgSend_objectForKey_(a4, v52, @"kAssistantCallbackAskUserParamKey_CancelKey");
      if (v53) {
        uint64_t v53 = sub_22685D62C(v53, qword_268148378);
      }
      if (v53) {
        uint64_t v54 = v51;
      }
      else {
        uint64_t v54 = 0;
      }
      if (v53) {
        uint64_t v51 = v53;
      }
      v55 = [AUUIAlert alloc];
      id v57 = (id)objc_msgSend_initWithViewController_(v55, v56, (uint64_t)self);
      objc_msgSend_setUiAlert_(self, v58, (uint64_t)v57);
      objc_msgSend_setTitle_(self->uiAlert, v59, v48);
      objc_msgSend_setMessage_(self->uiAlert, v60, valid);
      objc_msgSend_setDelegate_(self->uiAlert, v61, (uint64_t)self);
      objc_msgSend_setOkButtonTitle_(self->uiAlert, v62, v54);
      objc_msgSend_setCancelButtonTitle_(self->uiAlert, v63, v51);
      objc_msgSend_setContext_(self->uiAlert, v64, (uint64_t)a5);
      objc_msgSend_setTag_(self->uiAlert, v65, 4002);
      objc_msgSend_show(self->uiAlert, v66, v67);
      return 0;
    }
  }
  return -6705;
}

- (void)playDoneSound
{
  uint64_t v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  uint64_t v5 = objc_msgSend_bundleForClass_(v2, v4, v3);
  CFStringRef v7 = (const __CFString *)objc_msgSend_pathForResource_ofType_(v5, v6, @"burn complete.aif", &stru_26DA6BE88);
  CFURLRef v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB30], v7, kCFURLPOSIXPathStyle, 0);
  SystemSoundID outSystemSoundID = 0;
  OSStatus v9 = AudioServicesCreateSystemSoundID(v8, &outSystemSoundID);
  CFRelease(v8);
  if (!v9)
  {
    AudioServicesAddSystemSoundCompletion(outSystemSoundID, 0, 0, (AudioServicesSystemSoundCompletionProc)sub_22684774C, 0);
    AudioServicesPlayAlertSound(outSystemSoundID);
  }
}

- (void)showTellUserToResetBroadbandDeviceForStatus:(int)a3 paramDict:(id)a4
{
  uint64_t v5 = [InternetViewController alloc];
  CFStringRef v7 = objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  uint64_t v10 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v8, v9);
  uint64_t v12 = objc_msgSend_unconfiguredBaseStationFromGuessCompleteDict_(AutoGuessController, v11, v10);
  if (v12)
  {
    uint64_t v14 = v12;
    objc_msgSend_setCurrentSubController_(self, v13, (uint64_t)v7);
    id v17 = objc_msgSend_currentSubController(self, v15, v16);
    objc_msgSend_setInParamDict_(v17, v18, v14);
    uint64_t v21 = objc_msgSend_currentSubController(self, v19, v20);
    objc_msgSend_setParentController_(v21, v22, (uint64_t)self);

    self->_currentUIConfigStep = 1;
    objc_msgSend_presentInternetDisconnectedUI(v7, v23, v24);
    objc_msgSend_setDelegate_(v7, v25, (uint64_t)self);
    objc_msgSend_pushViewController_animated_(self, v26, (uint64_t)v7, 1);
  }
}

- (void)showAskUserForPPPoECredentialsForStatus:(int)a3 paramDict:(id)a4
{
  uint64_t v5 = [PPPoEViewController alloc];
  CFStringRef v7 = objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  objc_msgSend_setCurrentSubController_(self, v8, (uint64_t)v7);
  BOOL v11 = objc_msgSend_currentSubController(self, v9, v10);
  objc_msgSend_setParentController_(v11, v12, (uint64_t)self);

  self->_currentUIConfigStep = 3;

  objc_msgSend_pushViewController_animated_(self, v13, (uint64_t)v7, 1);
}

- (void)showUIConfigPromptToSendDiagsUsageStatsWithParamDict:(id)a3
{
  uint64_t v4 = [AssistantDiagsUsageStatsUIViewController alloc];
  BOOL v6 = objc_msgSend_initWithNibName_bundle_(v4, v5, 0, 0);
  objc_msgSend_setCurrentSubController_(self, v7, (uint64_t)v6);
  uint64_t v10 = objc_msgSend_currentSubController(self, v8, v9);
  objc_msgSend_setParentController_(v10, v11, (uint64_t)self);

  self->_currentUIConfigStep = 7;

  objc_msgSend_pushViewController_animated_(self, v12, (uint64_t)v6, 1);
}

- (void)showUIConfigPromptForGuestNetConfigWithParamDict:(id)a3
{
  uint64_t v5 = objc_msgSend_newStepByStepControllerForStep_(self, a2, 3);
  if (v5)
  {
    CFStringRef v7 = (void *)v5;
    CFURLRef v8 = NSDictionary;
    uint64_t v9 = objc_msgSend_objectForKey_(a3, v6, @"kBSConfigurationUIConfig_TargetBaseKey");
    uint64_t v11 = objc_msgSend_objectForKey_(a3, v10, @"kBSConfigurationUIConfig_BaseNameKey");
    uint64_t v13 = objc_msgSend_objectForKey_(a3, v12, @"kBSConfigurationUIConfig_NetworkameKey");
    uint64_t v15 = objc_msgSend_dictionaryWithObjectsAndKeys_(v8, v14, v9, @"kSBSKey_TargetBase", v11, @"kSBSKey_BaseName", v13, @"kSBSKey_NetworkName", 0);
    objc_msgSend_setInParamDict_(v7, v16, v15);
    objc_msgSend_setCurrentSubController_(self, v17, (uint64_t)v7);
    uint64_t v20 = objc_msgSend_currentSubController(self, v18, v19);
    objc_msgSend_setParentController_(v20, v21, (uint64_t)self);

    self->_currentUIConfigStep = 8;
    objc_msgSend_pushViewController_animated_(self, v22, (uint64_t)v7, 1);
  }
}

- (void)showTellUserToPlugInEthernetForStatus:(int)a3 paramDict:(id)a4
{
  uint64_t v5 = [InternetViewController alloc];
  CFStringRef v7 = objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  uint64_t v10 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v8, v9);
  uint64_t v12 = objc_msgSend_unconfiguredBaseStationFromGuessCompleteDict_(AutoGuessController, v11, v10);
  if (v12)
  {
    uint64_t v14 = v12;
    objc_msgSend_setCurrentSubController_(self, v13, (uint64_t)v7);
    id v17 = objc_msgSend_currentSubController(self, v15, v16);
    objc_msgSend_setInParamDict_(v17, v18, v14);
    uint64_t v21 = objc_msgSend_currentSubController(self, v19, v20);
    objc_msgSend_setParentController_(v21, v22, (uint64_t)self);

    self->_currentUIConfigStep = 1;
    objc_msgSend_presentInternetWANPluginUI(v7, v23, v24);
    objc_msgSend_setDelegate_(v7, v25, (uint64_t)self);
    objc_msgSend_pushViewController_animated_(self, v26, (uint64_t)v7, 1);
  }
}

- (void)showAskUserSwapCablingForStatus:(int)a3 paramDict:(id)a4
{
  if (a3 == -6771)
  {
    uint64_t v5 = objc_msgSend_currentSubController(self, a2, *(uint64_t *)&a3, a4);
    MEMORY[0x270F9A6D0](v5, sel_presentSwapCablingCompleteUI, v6);
  }
  else
  {
    CFURLRef v8 = [InternetViewController alloc];
    uint64_t v10 = objc_msgSend_initWithNibName_bundle_(v8, v9, 0, 0);
    uint64_t v12 = objc_msgSend_objectForKey_(a4, v11, @"kBSConfigurationSwapCabling_TargetBase");
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = objc_msgSend_objectForKey_(a4, v13, @"kBSConfigurationSwapCabling_SourceBase");
      if (v15)
      {
        uint64_t v17 = v15;
        objc_msgSend_setCurrentSubController_(self, v16, (uint64_t)v10);
        uint64_t v19 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v18, v14, @"kSBSKey_TargetBase", v17, @"kSBSKey_SourceBase", 0);
        uint64_t v22 = objc_msgSend_currentSubController(self, v20, v21);
        objc_msgSend_setInParamDict_(v22, v23, v19);
        uint64_t v26 = objc_msgSend_currentSubController(self, v24, v25);
        objc_msgSend_setParentController_(v26, v27, (uint64_t)self);

        self->_currentUIConfigStep = 5;
        objc_msgSend_presentSwapCablingUI(v10, v28, v29);
        objc_msgSend_setDelegate_(v10, v30, (uint64_t)self);
        objc_msgSend_pushViewController_animated_(self, v31, (uint64_t)v10, 1);
      }
    }
  }
}

- (void)showTellUserToFixTheirInternetConnection
{
  uint64_t v3 = [InternetViewController alloc];
  uint64_t v5 = objc_msgSend_initWithNibName_bundle_(v3, v4, 0, 0);
  objc_msgSend_setCurrentSubController_(self, v6, (uint64_t)v5);
  uint64_t v9 = objc_msgSend_currentSubController(self, v7, v8);
  objc_msgSend_setParentController_(v9, v10, (uint64_t)self);

  objc_msgSend_pushViewController_animated_(self, v11, (uint64_t)v5, 1);
}

- (void)handeImmediateCancel
{
}

- (void)handleCancelButton:(id)a3
{
}

- (void)handleNextButton:(id)a3
{
  switch(objc_msgSend_state(self->_assistantUIController, a2, (uint64_t)a3))
  {
    case 2u:
      uint64_t v6 = objc_msgSend_navigationController(self, v4, v5);
      uint64_t v9 = objc_msgSend_topViewController(v6, v7, v8);
      uint64_t v12 = objc_msgSend_tableManager(v9, v10, v11);
      uint64_t v15 = objc_msgSend_tableManager(v9, v13, v14);
      uint64_t v17 = objc_msgSend_indexOfSectionWithIdentifier_(v15, v16, @"ActionTableSection");
      unint64_t v19 = objc_msgSend_tagOfSelectedRowInMenuSection_(v12, v18, v17);
      self->_selectedActionTag = v19;
      if (v19 == 1349675373) {
        goto LABEL_5;
      }
      if (v19 == 1299149413)
      {
        assistantUIController = self->_assistantUIController;
        MEMORY[0x270F9A6D0](assistantUIController, sel_startStepByStepFromAutoGuessRecommendation, v21);
      }
      else
      {
        if (v19) {
          return;
        }
LABEL_5:
        uint64_t v22 = objc_msgSend_outResultsDict(v9, v20, v21);
        MEMORY[0x270F9A6D0](self, sel_startSetup_, v22);
      }
      return;
    case 3u:
      v23 = objc_msgSend_navigationController(self, v4, v5);
      uint64_t v32 = objc_msgSend_topViewController(v23, v24, v25);
      if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u))) {
        sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController handleNextButton:]", 100, (uint64_t)"GOING FORWARD from current controller %@\n", v28, v29, v30, v31, (uint64_t)v32);
      }
      v33 = self->_assistantUIController;
      uint64_t v35 = objc_msgSend_outResultsDict(v32, v26, v27);
      objc_msgSend_presentUIForStepByStepNextStepResult_withOptions_(v33, v34, 0, v35);
      return;
    case 6u:
      switch(self->_currentUIConfigStep)
      {
        case 1:
          MEMORY[0x270F9A6D0](self, sel_confirmSkipWANPort, v5);
          break;
        case 3:
          MEMORY[0x270F9A6D0](self, sel_continueWithPPPoESettings, v5);
          break;
        case 5:
          MEMORY[0x270F9A6D0](self, sel_continueWithSwapCabling, v5);
          break;
        case 6:
          MEMORY[0x270F9A6D0](self, sel_skipPluginAudioCabling, v5);
          break;
        default:
          return;
      }
      return;
    case 7u:
      int currentUIConfigStep = self->_currentUIConfigStep;
      if (currentUIConfigStep == 8)
      {
        MEMORY[0x270F9A6D0](self, sel_continueWithGuestNetSettings, v5);
      }
      else if (currentUIConfigStep == 7)
      {
        MEMORY[0x270F9A6D0](self, sel_continueWithDiagsAndUsageStats, v5);
      }
      return;
    default:
      return;
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  self->_goingBack = 0;
  if (objc_msgSend_currentSubController(self, a2, (uint64_t)a3, a4, a5)
    && (id)objc_msgSend_currentSubController(self, v8, v9) != a4)
  {
    uint64_t v14 = objc_msgSend_viewControllers(a3, v8, v9);
    uint64_t v17 = objc_msgSend_currentSubController(self, v15, v16);
    self->_goingBack = objc_msgSend_indexOfObject_(v14, v18, v17) == 0x7FFFFFFFFFFFFFFFLL;
  }
  if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController navigationController:didShowViewController:animated:]", 100, (uint64_t)"%@\n", v10, v11, v12, v13, (uint64_t)a4);
  }
  if (objc_msgSend_state(self->_assistantUIController, v8, v9) == 3)
  {
    if (!self->_goingBack) {
      goto LABEL_26;
    }
    objc_msgSend_presentUIForStepByStepNextStepResult_withOptions_(self->_assistantUIController, v19, 4294960527, 0);
LABEL_19:
    if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u)))
    {
      uint64_t v23 = objc_msgSend_currentSubController(self, v19, v20);
      sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController navigationController:didShowViewController:animated:]", 100, (uint64_t)"GOING BACKWARD from %@ to %@\n", v24, v25, v26, v27, v23);
    }
    goto LABEL_26;
  }
  if (objc_msgSend_state(self->_assistantUIController, v19, v20) == 6)
  {
    if (!self->_goingBack) {
      goto LABEL_26;
    }
    int currentUIConfigStep = self->_currentUIConfigStep;
    if ((currentUIConfigStep - 3) < 4 || currentUIConfigStep == 1) {
      objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self->_assistantUIController, v19, 4294960527, 0);
    }
    goto LABEL_19;
  }
  if (objc_msgSend_state(self->_assistantUIController, v19, v20) == 7 && self->_goingBack)
  {
    objc_msgSend_showUIConfigPromptResult_withOptions_(self->_assistantUIController, v19, 4294960527, 0);
    objc_msgSend_showUIForSetupStatus(self, v28, v29);
  }
LABEL_26:
  uint64_t v30 = objc_msgSend_tableManager(self, v19, v20);

  MEMORY[0x270F9A6D0](v30, sel_hideKeyboard, v31);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  uint64_t v4 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  CFStringRef v7 = objc_msgSend_tableManager(self, v5, v6);
  if (v4 == objc_msgSend_indexOfSectionWithIdentifier_(v7, v8, @"ShowPasswords"))
  {
    BOOL v11 = !self->showingPasswordsAtEnd;
    MEMORY[0x270F9A6D0](self, sel_setupCompleteShowPasswords_, v11);
  }
  else
  {
    uint64_t v12 = objc_msgSend_tableManager(self, v9, v10);
    if (v4 == objc_msgSend_indexOfSectionWithIdentifier_(v12, v13, @"FindAppTableSection"))
    {
      mfiAccessoryResponseDict = self->_mfiAccessoryResponseDict;
      sub_22690A998((const __CFDictionary *)mfiAccessoryResponseDict);
    }
  }
}

- (void)assistantWaitingForResourcesStart
{
  uint64_t v3 = objc_msgSend_cancelButton(self, a2, v2);

  objc_msgSend_setEnabled_(v3, v4, 1);
}

- (void)assistantWaitingForResourcesComplete
{
  uint64_t v3 = objc_msgSend_cancelButton(self, a2, v2);

  objc_msgSend_setEnabled_(v3, v4, 0);
}

- (void)assistantUpdateProgress:(id)a3 forState:(int)a4
{
  switch(a4)
  {
    case 1:
    case 6:
      goto LABEL_10;
    case 3:
    case 4:
      if (objc_msgSend_length(a3, a2, (uint64_t)a3))
      {
        objc_msgSend_currentSubController(self, v6, v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = objc_msgSend_currentSubController(self, v8, v9);
          MEMORY[0x270F9A6D0](v10, sel_stepByStepUpdateProgress_forState_, a3);
        }
      }
      return;
    case 5:
      goto LABEL_9;
    case 8:
      if (objc_msgSend_settingUpStatusText(self, a2, (uint64_t)a3))
      {
        justTextLabel = self->justTextLabel;
        justTextContainerView = (char *)self->justTextContainerView;
        uint64_t v13 = objc_msgSend_settingUpStatusText(self, a2, (uint64_t)a3);
        sub_22684E878(justTextLabel, justTextContainerView, v13);
        objc_msgSend_setSettingUpStatusText_(self, v14, 0);
      }
LABEL_9:
      if (objc_msgSend_length(a3, a2, (uint64_t)a3))
      {
LABEL_10:
        sub_22684E878(self->spinnerWithStatusBelowLabel, (char *)self->spinnerWithStatusBelowView, a3);
        tableHeaderContainerView = self->tableHeaderContainerView;
        objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v15, (uint64_t)tableHeaderContainerView);
      }
      break;
    default:
      return;
  }
}

- (void)doneWithAssistantResult:(int)a3
{
  uint64_t v7 = *(void *)&a3;
  if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController doneWithAssistantResult:]", 100, (uint64_t)" result %d\n", v3, v4, v5, v6, v7);
  }
  uint64_t v9 = self->_assistantUIController;
  objc_msgSend_set_assistantUIController_(self, v10, 0);
  uint64_t v13 = objc_msgSend_uiAlert(self, v11, v12);
  objc_msgSend_dismissWithNoActionAnimated_(v13, v14, 1);
  if (self->_assistantDelegate)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend_assistantCompleteWithResult_(self->_assistantDelegate, v15, v7);
      self->_assistantDelegate = 0;
    }
  }
}

- (void)presentUIForRecommendationStatus
{
  uint64_t v4 = objc_msgSend_tableManager(self, a2, v2);
  objc_msgSend_cleanTableViewForReuse(v4, v5, v6);
  justTextLabel = self->justTextLabel;
  justTextContainerView = (char *)self->justTextContainerView;
  uint64_t v9 = (void *)sub_22685D62C(@"CheckingOutYourNetwork", qword_268148378);
  sub_22684E878(justTextLabel, justTextContainerView, v9);
  spinnerWithStatusBelowLabel = self->spinnerWithStatusBelowLabel;
  spinnerWithStatusBelowView = (char *)self->spinnerWithStatusBelowView;
  uint64_t v12 = (void *)sub_22685D62C(@"kIntializingServicesString", qword_268148378);
  sub_22684E878(spinnerWithStatusBelowLabel, spinnerWithStatusBelowView, v12);
  if (!objc_msgSend_subviews(self->tableHeaderContainerView, v13, v14))
  {
    tableHeaderContainerView = self->tableHeaderContainerView;
    uint64_t v18 = objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v15, (uint64_t)self->justTextContainerView, self->spinnerWithStatusBelowView, 0);
    objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(self, v19, (uint64_t)tableHeaderContainerView, v18, 1);
  }
  uint64_t v20 = self->tableHeaderContainerView;
  uint64_t v21 = objc_msgSend_tableView(self, v15, v16);
  objc_msgSend_setTableHeaderView_(v21, v22, (uint64_t)v20);
  uint64_t Button = objc_msgSend_nextButton(self, v23, v24);
  objc_msgSend_setEnabled_(Button, v26, 0);
  uint64_t v29 = objc_msgSend_cancelButton(self, v27, v28);
  objc_msgSend_setEnabled_(v29, v30, 1);
  spinnerWithStatusBelowSpinner = self->spinnerWithStatusBelowSpinner;

  objc_msgSend_startAnimating(spinnerWithStatusBelowSpinner, v31, v32);
}

- (void)presentUIForRecommmendationTargetInfo:(id)a3
{
  if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController presentUIForRecommmendationTargetInfo:]", 100, (uint64_t)"targetInfo: %@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  uint64_t v9 = objc_msgSend_objectForKey_(a3, a2, @"kRecommendationTargetInfoKey_ProductID");
  BOOL v11 = objc_msgSend_objectForKey_(a3, v10, @"kRecommendationTargetInfoKey_DeviceKind");
  int v16 = objc_msgSend_integerValue(v11, v12, v13);
  if ((v16 - 3) > 1)
  {
    unsigned int v19 = objc_msgSend_integerValue(v9, v14, v15);
    uint64_t v17 = (uint64_t)sub_22685E098(v19, v16);
  }
  else
  {
    uint64_t v17 = objc_msgSend_objectForKey_(a3, v14, @"kRecommendationTargetInfoKey_BaseName");
  }
  uint64_t v20 = v17;
  uint64_t v21 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v18, (uint64_t)self->justTextContainerView);
  uint64_t v23 = v21;
  if ((v16 - 2) >= 3) {
    objc_msgSend_addObject_(v21, v22, (uint64_t)self->topoView);
  }
  objc_msgSend_addObject_(v23, v22, (uint64_t)self->spinnerWithStatusBelowView);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(self, v24, (uint64_t)self->tableHeaderContainerView, v23, 1);
  tableHeaderContainerView = self->tableHeaderContainerView;
  uint64_t v28 = objc_msgSend_tableView(self, v26, v27);
  objc_msgSend_setTableHeaderView_(v28, v29, (uint64_t)tableHeaderContainerView);
  assistantUIController = self->_assistantUIController;
  uint64_t v33 = objc_msgSend_layer(self->topoView, v31, v32);
  uint64_t v36 = objc_msgSend_topoLayout(self, v34, v35);
  uint64_t v39 = objc_msgSend_topoView(self, v37, v38);
  uint64_t v42 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(assistantUIController, v40, v33, v36, v39, v9, v11, v20, 0, 0, 0, 0, 0, 0);

  objc_msgSend_setTopoLayout_(self, v41, v42);
}

- (void)presentUIForRecommendationResult:(int)a3 paramDict:(id)a4
{
  if (a3 == -6723)
  {
    MEMORY[0x270F9A6D0](self, sel_doneWithAssistantResult_, 4294960573);
  }
  else
  {
    self->_goingBack = 0;
    uint64_t v7 = objc_msgSend_navigationController(self, a2, *(uint64_t *)&a3);
    if ((AssistantUIViewController *)objc_msgSend_topViewController(v7, v8, v9) != self)
    {
      uint64_t v12 = objc_msgSend_navigationController(self, v10, v11);
      uint64_t v15 = objc_msgSend_topViewController(v12, v13, v14);
      objc_msgSend_setCurrentSubController_(self, v16, v15);
    }
    uint64_t v17 = objc_msgSend_navigationController(self, v10, v11);
    uint64_t v20 = (AssistantUIViewController *)objc_msgSend_topViewController(v17, v18, v19);
    if (a4)
    {
      if (v20 == self)
      {
        objc_msgSend_setRecommendationParamDict_(self, v21, (uint64_t)a4);
        uint64_t v23 = objc_msgSend_objectForKey_(a4, v22, @"promptString");
        if (v23)
        {
          uint64_t v26 = (void *)v23;
          uint64_t v27 = objc_msgSend_cancelButton(self, v24, v25);
          objc_msgSend_setEnabled_(v27, v28, 1);
          objc_msgSend_stopAnimating(self->spinnerWithStatusBelowSpinner, v29, v30);
          objc_msgSend_setText_(self->spinnerWithStatusBelowLabel, v31, (uint64_t)&stru_26DA6BE88);
          sub_22684E878(self->spinnerWithStatusBelowLabel, (char *)self->spinnerWithStatusBelowView, &stru_26DA6BE88);
          sub_22684E878(self->justTextLabel, (char *)self->justTextContainerView, v26);
          objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v32, (uint64_t)self->tableHeaderContainerView);
          tableHeaderContainerView = self->tableHeaderContainerView;
          uint64_t v36 = objc_msgSend_tableView(self, v34, v35);
          objc_msgSend_setTableHeaderView_(v36, v37, (uint64_t)tableHeaderContainerView);
          uint64_t Button = objc_msgSend_nextButton(self, v38, v39);
          objc_msgSend_setEnabled_(Button, v41, 0);
          if (!a3)
          {
            v70 = 0;
            uint64_t v44 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v42, v43);
            CFStringRef v46 = (const __CFString *)objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, v45, v44);
            uint64_t v49 = objc_msgSend_sharedInstance(WiFiUtils, v47, v48);
            CFArrayRef v52 = (const __CFArray *)objc_msgSend_unmergedScanInfoArray(v49, v50, v51);
            if (!sub_2268CB9C8(v46, v52, &v70, v53, v54, v55, v56, v57))
            {
              if (v70)
              {
                uint64_t v59 = objc_msgSend_objectForKey_(v70, v58, @"kSBSKey_Step");
                uint64_t v62 = objc_msgSend_integerValue(v59, v60, v61);
                v64 = objc_msgSend_newStepByStepControllerForStep_(self, v63, v62);
                if (v64)
                {
                  v66 = v64;
                  objc_msgSend_setParentController_(v64, v65, (uint64_t)self);
                  objc_msgSend_setInParamDict_(v66, v67, (uint64_t)v70);

                  objc_msgSend_pushViewController_animated_(self, v68, (uint64_t)v66, 0);
                  objc_msgSend_setCurrentSubController_(self, v69, (uint64_t)v66);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)presentUIForStepByStepNextStep:(int)a3 paramDict:(id)a4
{
  uint64_t v9 = *(void *)&a3;
  if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController presentUIForStepByStepNextStep:paramDict:]", 100, (uint64_t)"step: %d\n", v4, v5, v6, v7, v9);
  }
  if (self->_goingBack)
  {
    uint64_t v11 = objc_msgSend_navigationController(self, a2, *(uint64_t *)&a3);
    uint64_t v14 = objc_msgSend_topViewController(v11, v12, v13);
    objc_msgSend_setCurrentSubController_(self, v15, v14);
    self->_goingBack = 0;
    if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u)))
    {
      uint64_t v18 = "going BACKWARD to %@\n";
LABEL_24:
      uint64_t v58 = objc_msgSend_currentSubController(self, v16, v17);
      sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController presentUIForStepByStepNextStep:paramDict:]", 100, (uint64_t)v18, v59, v60, v61, v62, v58);
    }
  }
  else
  {
    uint64_t v19 = objc_msgSend_newStepByStepControllerForStep_(self, a2, v9);
    objc_msgSend_setParentController_(v19, v20, (uint64_t)self);
    objc_msgSend_setInParamDict_(v19, v21, (uint64_t)a4);
    uint64_t v24 = objc_msgSend_currentSubController(self, v22, v23);
    uint64_t v27 = objc_msgSend_inParamDict(v24, v25, v26);
    uint64_t v29 = objc_msgSend_objectForKey_(v27, v28, @"kSBSKey_CannotBeBackedInto");
    if (objc_msgSend_BOOLValue(v29, v30, v31))
    {
      uint64_t v34 = objc_msgSend_navigationController(self, v32, v33);
      objc_msgSend_popViewControllerAnimated_(v34, v35, 0);
    }
    if (objc_msgSend_currentSubController(self, v32, v33)
      && (uint64_t v38 = objc_msgSend_currentSubController(self, v36, v37),
          v41 = objc_msgSend_inParamDict(v38, v39, v40),
          uint64_t v43 = objc_msgSend_objectForKey_(v41, v42, @"kSBSKey_Step"),
          objc_msgSend_integerValue(v43, v44, v45) == v9))
    {
      v47 = objc_msgSend_navigationController(self, v36, v46);
      objc_msgSend_popViewControllerAnimated_(v47, v48, 0);
      uint64_t v53 = 0;
      if (dword_268145EA8 <= 100)
      {
        if (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u)) {
          sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController presentUIForStepByStepNextStep:paramDict:]", 100, (uint64_t)"REPLACING step with same step %d\n", v49, v50, v51, v52, v9);
        }
        uint64_t v53 = 0;
      }
    }
    else
    {
      uint64_t v53 = 1;
    }
    objc_msgSend_setCurrentSubController_(self, v36, (uint64_t)v19);

    uint64_t v56 = objc_msgSend_currentSubController(self, v54, v55);
    objc_msgSend_pushViewController_animated_(self, v57, v56, v53);
    if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u)))
    {
      uint64_t v18 = "going FORWARD to %@\n";
      goto LABEL_24;
    }
  }
}

- (id)modifyTopoUIInLayer:(id)a3 withLayout:(id)a4 newLayout:(id)a5
{
  uint64_t v6 = objc_msgSend_topoDevicesDescriptor(a5, a2, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);
  if (v9 == 2)
  {
    uint64_t v21 = objc_msgSend_objectAtIndex_(v6, v10, 0);
    uint64_t v23 = objc_msgSend_valueForKey_(v21, v22, (uint64_t)off_268147F48[0]);
    uint64_t v25 = objc_msgSend_valueForKey_(v21, v24, (uint64_t)off_268147F50[0]);
    uint64_t v27 = objc_msgSend_valueForKey_(v21, v26, (uint64_t)off_268147F58[0]);
    uint64_t v29 = objc_msgSend_valueForKey_(v21, v28, (uint64_t)off_268147F60[0]);
    uint64_t v31 = objc_msgSend_objectAtIndex_(v6, v30, 1);
    uint64_t v14 = objc_msgSend_valueForKey_(v31, v32, (uint64_t)off_268147F48[0]);
    uint64_t v16 = objc_msgSend_valueForKey_(v31, v33, (uint64_t)off_268147F50[0]);
    uint64_t v18 = objc_msgSend_valueForKey_(v31, v34, (uint64_t)off_268147F58[0]);
    uint64_t v20 = objc_msgSend_valueForKey_(v31, v35, (uint64_t)off_268147F60[0]);
    uint64_t v37 = objc_msgSend_valueForKey_(v31, v36, (uint64_t)off_268147F68[0]);
  }
  else
  {
    if (v9 == 1)
    {
      uint64_t v12 = objc_msgSend_objectAtIndex_(v6, v10, 0);
      uint64_t v14 = objc_msgSend_valueForKey_(v12, v13, (uint64_t)off_268147F48[0]);
      uint64_t v16 = objc_msgSend_valueForKey_(v12, v15, (uint64_t)off_268147F50[0]);
      uint64_t v18 = objc_msgSend_valueForKey_(v12, v17, (uint64_t)off_268147F58[0]);
      uint64_t v20 = objc_msgSend_valueForKey_(v12, v19, (uint64_t)off_268147F60[0]);
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
      uint64_t v20 = 0;
      uint64_t v18 = 0;
    }
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    uint64_t v29 = 0;
    uint64_t v27 = 0;
    uint64_t v37 = 0;
  }
  uint64_t v38 = self;
  assistantUIController = self->_assistantUIController;
  uint64_t v40 = objc_msgSend_topoView(v38, v10, v11);
  return (id)objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(assistantUIController, v41, (uint64_t)a3, a4, v40, v14, v16, v20, v18, v23, v25, v29, v27, v37);
}

- (void)connectionVerificationSucceededForSelector:(int)a3
{
  uint64_t v4 = objc_msgSend_uiAlert(self, a2, *(uint64_t *)&a3);
  objc_msgSend_dismissWithNoActionAnimated_(v4, v5, 1);

  objc_msgSend_showUIForSetupStatus(self, v6, v7);
}

- (void)presentUIForSetupStatusWithRecommendationDict:(id)a3
{
  uint64_t v5 = objc_msgSend_objectForKey_(a3, a2, @"BSAutoGuess_Recommendation");
  if (!v5) {
    return;
  }
  uint64_t v7 = (void *)v5;
  CFStringRef v8 = (const __CFString *)objc_msgSend_objectForKey_(a3, v6, @"BSAutoGuess_UnconfiguredBase");
  uint64_t v10 = objc_msgSend_objectForKey_(a3, v9, @"BSAutoGuess_UnconfiguredNetwork");
  if (v8)
  {
    CFStringRef v18 = sub_22685AB94(v8, (uint64_t)v11, v12, v13, v14, v15, v16, v17);
    int v26 = sub_22685AB68((uint64_t)v8, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v27 = (uint64_t)v18;
  }
  else
  {
    uint64_t v28 = v10;
    uint64_t v29 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v11, v10);
    int v26 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v30, v28);
    uint64_t v27 = v29;
  }
  uint64_t v31 = sub_22685D75C(v27, v26);
  uint64_t v33 = objc_msgSend_stringWithFormat_(NSString, v32, @"%1$@.InProcess%2$@", v7, v31);
  uint64_t valid = sub_22685D62C(v33, qword_268148378);
  uint64_t v37 = objc_msgSend_setupOptions(self->_assistantUIController, v35, v36);
  uint64_t v39 = objc_msgSend_objectForKey_(v37, v38, @"kBSAutoGuessSetupOptionKey_ExtendOption_JoinApple");
  if (objc_msgSend_BOOLValue(v39, v40, v41)) {
    uint64_t v33 = objc_msgSend_stringWithFormat_(NSString, v42, @"%1$@.InProcess%2$@", @"BSSetupRecommend_OfferJoinNetwork", v31);
  }
  if ((objc_msgSend_isEqualToString_(v7, v42, @"BSSetupRecommend_OfferExtendWirelessly") & 1) == 0
    && !objc_msgSend_isEqualToString_(v7, v43, @"BSSetupRecommend_AskUserChooseBaseWireless"))
  {
    if ((objc_msgSend_isEqualToString_(v7, v43, @"BSSetupRecommend_OfferExtendOverEthernet") & 1) != 0
      || objc_msgSend_isEqualToString_(v7, v58, @"BSSetupRecommend_AskUserChooseBaseWired"))
    {
      uint64_t v59 = objc_msgSend_objectForKey_(a3, v58, @"BSAutoGuess_SourceBase");
      if (v59)
      {
LABEL_18:
        uint64_t v57 = objc_msgSend_valueForKey_(v59, v60, @"name");
        goto LABEL_19;
      }
      uint64_t v62 = objc_msgSend_setupOptions(self->_assistantUIController, v60, v61);
      uint64_t v59 = objc_msgSend_objectForKey_(v62, v63, @"kBSAutoGuessSetupOptionKey_SourceBase");
    }
    else
    {
      if ((objc_msgSend_isEqualToString_(v7, v58, @"BSSetupRecommend_OfferCreate") & 1) != 0
        || objc_msgSend_isEqualToString_(v7, v107, @"BSSetupRecommend_OfferReplaceSourceIsUnconfigurable"))
      {
        v109 = objc_msgSend_setupOptions(self->_assistantUIController, v107, v108);
        if (!objc_msgSend_objectForKey_(v109, v110, @"kBSAutoGuessSetupOptionKey_NetworkName")) {
          return;
        }
        goto LABEL_21;
      }
      if ((objc_msgSend_isEqualToString_(v7, v107, @"BSSetupRecommend_OfferJoinNetwork") & 1) != 0
        || objc_msgSend_isEqualToString_(v7, v111, @"BSSetupRecommend_AskUserChooseNetworkToJoin"))
      {
        v113 = objc_msgSend_setupOptions(self->_assistantUIController, v111, v112);
        uint64_t v116 = objc_msgSend_objectForKey_(v113, v114, @"kBSAutoGuessSetupOptionKey_SourceNetwork");
        if (!v116)
        {
          uint64_t v116 = objc_msgSend_objectForKey_(a3, v115, @"BSAutoGuess_SourceNetwork");
          if (!v116) {
            return;
          }
        }
        uint64_t v57 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v115, v116);
        goto LABEL_19;
      }
      if ((objc_msgSend_isEqualToString_(v7, v111, @"BSSetupRecommend_OfferRestore") & 1) != 0
        || (objc_msgSend_isEqualToString_(v7, v67, @"BSSetupRecommend_OfferReplaceConfiguration") & 1) != 0)
      {
        goto LABEL_21;
      }
      if (!objc_msgSend_isEqualToString_(v7, v67, @"BSSetupRecommend_OfferReplace")) {
        return;
      }
      uint64_t v59 = objc_msgSend_objectForKey_(a3, v117, @"BSAutoGuess_SourceBase");
    }
    if (!v59) {
      return;
    }
    goto LABEL_18;
  }
  uint64_t v46 = (__CFString *)objc_msgSend_objectForKey_(a3, v43, @"BSAutoGuess_SourceBase");
  if (!v46)
  {
    v47 = objc_msgSend_setupOptions(self->_assistantUIController, v44, v45);
    uint64_t v46 = (__CFString *)objc_msgSend_objectForKey_(v47, v48, @"kBSAutoGuessSetupOptionKey_SourceBase");
    if (!v46) {
      return;
    }
  }
  uint64_t v56 = objc_msgSend_valueForKey_(v46, v44, @"raNm");
  if (v56) {
    goto LABEL_20;
  }
  uint64_t v57 = (uint64_t)sub_22685B6F8(v46, v49, v50, v51, v52, v53, v54, v55);
LABEL_19:
  uint64_t v56 = v57;
LABEL_20:
  v64 = NSString;
  uint64_t v65 = sub_22685D62C(v33, qword_268148378);
  uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v64, v66, v65, @"%@", 0, v56);
LABEL_21:
  objc_msgSend_setSettingUpStatusText_(self, v67, valid);
  v70 = objc_msgSend_navigationController(self, v68, v69);
  v73 = objc_msgSend_topViewController(v70, v71, v72);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v76 = objc_msgSend_topoLayout(v73, v74, v75);
    uint64_t v79 = objc_msgSend_topoLayout(self, v77, v78);
    uint64_t v82 = objc_msgSend_layer(self->topoView, v80, v81);
    objc_msgSend_modifyTopoUIInLayer_withLayout_newLayout_(self, v83, v82, v79, v76);
    if (objc_opt_respondsToSelector())
    {
      justTextLabel = self->justTextLabel;
      justTextContainerView = (char *)self->justTextContainerView;
      v86 = objc_msgSend_performSelector_(v73, v74, (uint64_t)sel_justTextLabel);
      uint64_t v89 = objc_msgSend_text(v86, v87, v88);
      sub_22684E878(justTextLabel, justTextContainerView, v89);
    }
  }
  objc_msgSend_showUIForSetupStatus(self, v74, v75);
  uint64_t v90 = sub_22685D62C(@"kDone", qword_268148378);
  uint64_t Button = objc_msgSend_nextButton(self, v91, v92);
  objc_msgSend_setTitle_(Button, v94, v90);
  v97 = objc_msgSend_nextButton(self, v95, v96);
  objc_msgSend_setStyle_(v97, v98, 2);
  uint64_t v101 = objc_msgSend_nextButton(self, v99, v100);
  objc_msgSend_setEnabled_(v101, v102, 0);
  uint64_t v105 = objc_msgSend_cancelButton(self, v103, v104);

  objc_msgSend_setEnabled_(v105, v106, 0);
}

- (void)presentUIForSetupResult:(int)a3 baseStationInfo:(id)a4 withPrompt:(id)a5
{
  sub_22684E878(self->justTextLabel, (char *)self->justTextContainerView, &stru_26DA6BE88);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v9, (uint64_t)self->tableHeaderContainerView);
  if (a3 == -6769)
  {
LABEL_11:
    uint64_t v41 = objc_msgSend_cancelButton(self, v10, v11);
    objc_msgSend_setEnabled_(v41, v42, 1);
    objc_msgSend_stopAnimating(self->spinnerWithStatusBelowSpinner, v43, v44);
    spinnerWithStatusBelowLabel = self->spinnerWithStatusBelowLabel;
    spinnerWithStatusBelowView = (char *)self->spinnerWithStatusBelowView;
    sub_22684E878(spinnerWithStatusBelowLabel, spinnerWithStatusBelowView, &stru_26DA6BE88);
    return;
  }
  if (a3)
  {
    if (a3 == -6723)
    {
      objc_msgSend_handleCancelButton_(self, v10, 0);
    }
    else
    {
      sub_22684E878(self->justTextLabel, (char *)self->justTextContainerView, a5);
      objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v40, (uint64_t)self->tableHeaderContainerView);
    }
    goto LABEL_11;
  }
  uint64_t v12 = objc_msgSend_objectForKey_(a4, v10, @"kSetupBaseStationInfoKey_RecommendationInfo");
  uint64_t v14 = objc_msgSend_objectForKey_(v12, v13, @"BSAutoGuess_Recommendation");
  if (objc_msgSend_isEqualToString_(v14, v15, @"BSSetupRecommend_OfferReplaceSourceIsUnconfigurable"))
  {
    id v165 = a4;
    uint64_t v164 = sub_22685D62C(@"TextualSentenceConcatenator", qword_268148378);
    CFStringRef v17 = (const __CFString *)objc_msgSend_objectForKey_(v12, v16, @"BSAutoGuess_SourceBase");
    uint64_t v25 = (__CFString *)sub_22685B6F8(v17, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v28 = objc_msgSend_setupOptions(self->_assistantUIController, v26, v27);
    uint64_t v30 = objc_msgSend_objectForKey_(v28, v29, @"kBSAutoGuessSetupOptionKey_BaseName");
    uint64_t v33 = objc_msgSend_length(v25, v31, v32);
    uint64_t v36 = objc_msgSend_length(v30, v34, v35);
    if (v33 && v36 && !objc_msgSend_isEqualToString_(v25, v37, (uint64_t)v30))
    {
      uint64_t v47 = sub_22685D62C(@"RestoreDefaultsReplacedNamed", @"AirPortSettings");
      uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v48, v47, @"%@", 0, v25);
    }
    else
    {
      uint64_t valid = sub_22685D62C(@"RestoreDefaultsReplaced", @"AirPortSettings");
    }
    a5 = (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v39, v164, @"%@%@", 0, a5, valid);
    a4 = v165;
  }
  sub_22684E878(self->justTextLabel, (char *)self->justTextContainerView, a5);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v49, (uint64_t)self->tableHeaderContainerView);
  uint64_t v52 = objc_msgSend_tableManager(self, v50, v51);
  objc_msgSend_cleanTableViewForReuse(v52, v53, v54);
  uint64_t v56 = objc_msgSend_objectForKey_(a4, v55, @"kSetupBaseStationInfoKey_BrowseRecord");
  BOOL v59 = sub_22685AAD0(v56) != 2 && sub_22685AAD0(v56) != 3 && sub_22685AAD0(v56) != 4;
  uint64_t v60 = objc_msgSend_callerParamDict(self, v57, v58);
  if (v60)
  {
    uint64_t v63 = objc_msgSend_callerParamDict(self, v61, v62);
    uint64_t v65 = objc_msgSend_objectForKey_(v63, v64, @"wacShouldHideFindAppUI");
    LODWORD(v60) = objc_msgSend_BOOLValue(v65, v66, v67);
  }
  if (((v59 | v60) & 1) == 0)
  {
    v68 = (NSDictionary *)(id)objc_msgSend_objectForKey_(a4, v61, @"kSetupBaseStationInfoKey_MFiAccessoryResponse");
    self->_mfiAccessoryResponseDict = v68;
    if (v68)
    {
      if (sub_22690A958((const __CFDictionary *)v68))
      {
        uint64_t v69 = objc_msgSend_array(MEMORY[0x263EFF980], v61, v62);
        uint64_t v72 = objc_msgSend_tableManager(self, v70, v71);
        uint64_t v73 = sub_22685D62C(@"FindAppForAccessory", @"AirPortSettings");
        uint64_t RowStyleBasicWholeCellButton_withTag = objc_msgSend_createRowStyleBasicWholeCellButton_withTag_(v72, v74, v73, 1097887809);
        objc_msgSend_addObject_(v69, v76, RowStyleBasicWholeCellButton_withTag);
        uint64_t v79 = objc_msgSend_tableManager(self, v77, v78);
        uint64_t v81 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v80, (uint64_t)v69, @"sectionRows", @"FindAppTableSection", @"identifier", 0);
        objc_msgSend_addSectionInfo_(v79, v82, v81);
      }
    }
  }
  uint64_t v83 = objc_msgSend_array(MEMORY[0x263EFF980], v61, v62);
  v86 = objc_msgSend_text(self->justTextLabel, v84, v85);
  if (objc_msgSend_length(v86, v87, v88)) {
    objc_msgSend_addObject_(v83, v89, (uint64_t)self->justTextContainerView);
  }
  if (v59) {
    objc_msgSend_addObject_(v83, v89, (uint64_t)self->topoView);
  }
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(self, v89, (uint64_t)self->tableHeaderContainerView, v83, 1);
  tableHeaderContainerView = self->tableHeaderContainerView;
  v93 = objc_msgSend_tableView(self, v91, v92);
  objc_msgSend_setTableHeaderView_(v93, v94, (uint64_t)tableHeaderContainerView);
  uint64_t v95 = sub_22685D62C(@"kDone", qword_268148378);
  uint64_t Button = objc_msgSend_nextButton(self, v96, v97);
  objc_msgSend_setTitle_(Button, v99, v95);
  v102 = objc_msgSend_nextButton(self, v100, v101);
  objc_msgSend_setStyle_(v102, v103, 2);
  v106 = objc_msgSend_nextButton(self, v104, v105);
  objc_msgSend_setEnabled_(v106, v107, 1);
  uint64_t v110 = objc_msgSend_nextButton(self, v108, v109);
  objc_msgSend_setAction_(v110, v111, (uint64_t)sel_baseStationConfigurationComplete_);
  uint64_t v112 = sub_22685D62C(@"SetupCompleteTitle", qword_268148378);
  uint64_t v115 = objc_msgSend_navigationItem(self, v113, v114);
  objc_msgSend_setTitle_(v115, v116, v112);
  v119 = objc_msgSend_navigationItem(self, v117, v118);
  objc_msgSend_setLeftBarButtonItem_(v119, v120, 0);
  uint64_t v122 = objc_msgSend_objectForKey_(a4, v121, @"kSetupBaseStationInfoKey_GeneralInfo");
  uint64_t v123 = sub_22685D6E8(1937330263);
  uint64_t v127 = objc_msgSend_objectForKey_(v122, v124, v123);
  if (v127)
  {
    uint64_t v128 = objc_msgSend_setupOptions(self->_assistantUIController, v125, v126);
    objc_msgSend_setObject_forKey_(v128, v129, v127, @"kBSAutoGuessSetupOptionKey_BasePassword");
  }
  double v130 = objc_msgSend_objectForKey_(a4, v125, @"kSetupBaseStationInfoKey_RadioInfo");
  uint64_t v131 = sub_22685D6E8(1651725131);
  if (objc_msgSend_objectForKey_(v130, v132, v131))
  {
    uint64_t v135 = objc_msgSend_setupOptions(self->_assistantUIController, v133, v134);
    uint64_t v137 = objc_msgSend_objectForKey_(a4, v136, @"kSetupBaseStationInfoKey_RadioInfo");
    uint64_t v138 = sub_22685D6E8(1651725131);
    uint64_t v140 = objc_msgSend_objectForKey_(v137, v139, v138);
    objc_msgSend_setObject_forKey_(v135, v141, v140, @"kBSAutoGuessSetupOptionKey_NetworkPassword");
  }
  if (objc_msgSend_objectForKey_(a4, v133, @"kSetupBaseStationInfoKey_DiskInfo"))
  {
    v144 = objc_msgSend_objectForKey_(a4, v142, @"kSetupBaseStationInfoKey_DiskInfo");
    uint64_t v145 = sub_22685D6E8(1718842224);
    uint64_t v147 = objc_msgSend_objectForKey_(v144, v146, v145);
    if (v147) {
      uint64_t v127 = v147;
    }
    v150 = objc_msgSend_setupOptions(self->_assistantUIController, v148, v149);
    objc_msgSend_setObject_forKey_(v150, v151, v127, @"kBSAutoGuessSetupOptionKey_DiskSharing_Password");
  }
  else
  {
    v153 = objc_msgSend_setupOptions(self->_assistantUIController, v142, v143);
    objc_msgSend_removeObjectForKey_(v153, v154, @"kBSAutoGuessSetupOptionKey_DiskSharing_Password");
  }
  v155 = objc_msgSend_objectForKey_(a4, v152, @"kSetupBaseStationInfoKey_GuestNetworkInfo");
  uint64_t v156 = sub_22685D6E8(1651722064);
  uint64_t v158 = objc_msgSend_objectForKey_(v155, v157, v156);
  if (v158)
  {
    uint64_t v161 = v158;
    v162 = objc_msgSend_setupOptions(self->_assistantUIController, v159, v160);
    objc_msgSend_setObject_forKey_(v162, v163, v161, @"kBSAutoGuessSetupOptionKey_GuestNetwork_Password");
  }
}

- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5
{
  if (a5 > 1196314742)
  {
    if (a5 == 1196314743)
    {
      uint64_t v5 = @"kBSAutoGuessSetupOptionKey_GuestNetwork_Password";
      goto LABEL_11;
    }
    if (a5 == 1464225889)
    {
      uint64_t v5 = @"kBSAutoGuessSetupOptionKey_NetworkPassword";
      goto LABEL_11;
    }
    return &stru_26DA6BE88;
  }
  if (a5 == 1113673825)
  {
    uint64_t v5 = @"kBSAutoGuessSetupOptionKey_BasePassword";
    goto LABEL_11;
  }
  if (a5 != 1147752545) {
    return &stru_26DA6BE88;
  }
  uint64_t v5 = @"kBSAutoGuessSetupOptionKey_DiskSharing_Password";
LABEL_11:
  uint64_t v7 = objc_msgSend_setupOptions(self->_assistantUIController, a2, (uint64_t)a3, a4);

  return (id)objc_msgSend_objectForKey_(v7, v8, (uint64_t)v5);
}

- (void)presentWaitingForWANViewWithContinueText:(BOOL)a3
{
  uint64_t v4 = [InternetViewController alloc];
  uint64_t v6 = objc_msgSend_initWithNibName_bundle_(v4, v5, 0, 0);
  uint64_t v9 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v7, v8);
  uint64_t v11 = objc_msgSend_unconfiguredBaseStationFromGuessCompleteDict_(AutoGuessController, v10, v9);
  if (v11)
  {
    uint64_t v13 = v11;
    objc_msgSend_setCurrentSubController_(self, v12, (uint64_t)v6);
    uint64_t v16 = objc_msgSend_currentSubController(self, v14, v15);
    objc_msgSend_setInParamDict_(v16, v17, v13);
    uint64_t v20 = objc_msgSend_currentSubController(self, v18, v19);
    objc_msgSend_setParentController_(v20, v21, (uint64_t)self);

    self->_int currentUIConfigStep = 1;
    objc_msgSend_presentInternetWANPluginUI(v6, v22, v23);
    objc_msgSend_setDelegate_(v6, v24, (uint64_t)self);
    objc_msgSend_pushViewController_animated_(self, v25, (uint64_t)v6, 1);
  }
}

+ (void)readjustSubviewsInContainer:(id)a3
{
}

- (void)replaceSubviewsInView:(id)a3 newSubviews:(id)a4 withAnimation:(BOOL)a5
{
  id v5 = a4;
  uint64_t v79 = *MEMORY[0x263EF8340];
  unint64_t v7 = objc_msgSend_count(a4, a2, (uint64_t)a3);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v10 = objc_msgSend_subviews(a3, v8, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v74, v78, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v75 != v16) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_removeFromSuperview(*(void **)(*((void *)&v74 + 1) + 8 * i), v13, v14);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v74, v78, 16);
    }
    while (v15);
  }
  if (v7)
  {
    Object = objc_msgSend_firstObject(v5, v13, v14);
    LODWORD(v19) = 1148846080;
    objc_msgSend_setContentCompressionResistancePriority_forAxis_(Object, v20, 1, v19);
    objc_msgSend_addSubview_(a3, v21, (uint64_t)Object);
    uint64_t v22 = (void *)MEMORY[0x263F08938];
    uint64_t v23 = _NSDictionaryOfVariableBindings(&cfstr_Cursubview.isa, Object, 0);
    uint64_t v25 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v22, v24, @"H:|[curSubview]|", 0, 0, v23);
    objc_msgSend_addConstraints_(a3, v26, v25);
    uint64_t v27 = (void *)MEMORY[0x263F08938];
    uint64_t v28 = _NSDictionaryOfVariableBindings(&cfstr_Cursubview.isa, Object, 0);
    uint64_t v30 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v27, v29, @"V:|[curSubview]", 0, 0, v28);
    objc_msgSend_addConstraints_(a3, v31, v30);
    double v32 = *MEMORY[0x263F1D498];
    double v33 = *(double *)(MEMORY[0x263F1D498] + 8);
    objc_msgSend_systemLayoutSizeFittingSize_(Object, v34, v35, *MEMORY[0x263F1D498], v33);
    double v37 = v36 + 0.0;
    if (v7 - 1 < 2)
    {
      uint64_t v39 = Object;
    }
    else
    {
      uint64_t v38 = 2;
      do
      {
        uint64_t v39 = objc_msgSend_objectAtIndex_(v5, v13, v38 - 1);
        objc_msgSend_addSubview_(a3, v40, (uint64_t)v39);
        id v41 = v5;
        uint64_t v42 = (void *)MEMORY[0x263F08938];
        uint64_t v43 = _NSDictionaryOfVariableBindings(&cfstr_Cursubview.isa, v39, 0);
        uint64_t v45 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v42, v44, @"H:|[curSubview]|", 0, 0, v43);
        objc_msgSend_addConstraints_(a3, v46, v45);
        uint64_t v47 = (void *)MEMORY[0x263F08938];
        uint64_t v48 = _NSDictionaryOfVariableBindings(&cfstr_Previoussubvie.isa, Object, v39, 0);
        uint64_t v49 = v47;
        id v5 = v41;
        uint64_t v51 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v49, v50, @"V:[previousSubview][curSubview]", 0, 0, v48);
        objc_msgSend_addConstraints_(a3, v52, v51);
        objc_msgSend_systemLayoutSizeFittingSize_(v39, v53, v54, v32, v33);
        double v37 = v37 + v55;
        ++v38;
        Object = v39;
      }
      while (v7 != v38);
    }
    if (v7 >= 2)
    {
      uint64_t v56 = objc_msgSend_lastObject(v5, v13, v14);
      objc_msgSend_addSubview_(a3, v57, (uint64_t)v56);
      uint64_t v58 = (void *)MEMORY[0x263F08938];
      BOOL v59 = _NSDictionaryOfVariableBindings(&cfstr_Cursubview.isa, v56, 0);
      uint64_t v61 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v58, v60, @"H:|[curSubview]|", 0, 0, v59);
      objc_msgSend_addConstraints_(a3, v62, v61);
      uint64_t v63 = (void *)MEMORY[0x263F08938];
      v64 = _NSDictionaryOfVariableBindings(&cfstr_Previoussubvie.isa, v39, v56, 0);
      uint64_t v66 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v63, v65, @"V:[previousSubview][curSubview]|", 0, 0, v64);
      objc_msgSend_addConstraints_(a3, v67, v66);
      objc_msgSend_systemLayoutSizeFittingSize_(v56, v68, v69, v32, v33);
    }
  }
  objc_msgSend_frame(a3, v13, v14);
  objc_msgSend_setFrame_(a3, v70, v71);
  objc_msgSend_setNeedsLayout(a3, v72, v73);
}

- (AssistantViewControllerDelegate)assistantDelegate
{
  return (AssistantViewControllerDelegate *)self->_assistantDelegate;
}

- (void)setAssistantDelegate:(id)a3
{
  self->_assistantDelegate = a3;
}

- (AssistantUIController)_assistantUIController
{
  return self->_assistantUIController;
}

- (void)set_assistantUIController:(id)a3
{
}

- (AssistantCallbackController)_controllerContext
{
  return self->_controllerContext;
}

- (void)set_controllerContext:(id)a3
{
}

- (NSDictionary)scanInfoRecord
{
  return self->_scanInfoRecord;
}

- (void)setScanInfoRecord:(id)a3
{
}

- (NSArray)paramScanResults
{
  return self->_paramScanResults;
}

- (void)setParamScanResults:(id)a3
{
}

- (NSDictionary)recommendationParamDict
{
  return self->recommendationParamDict;
}

- (void)setRecommendationParamDict:(id)a3
{
}

- (NSDictionary)callerParamDict
{
  return self->_callerParamDict;
}

- (void)setCallerParamDict:(id)a3
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

- (UIView)spinnerWithStatusBelowView
{
  return self->spinnerWithStatusBelowView;
}

- (void)setSpinnerWithStatusBelowView:(id)a3
{
}

- (UIBarButtonItem)nextButton
{
  return self->nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UITextField)currentTextField
{
  return self->currentTextField;
}

- (void)setCurrentTextField:(id)a3
{
}

- (AssistantSubUIViewController)currentSubController
{
  return self->_currentSubController;
}

- (void)setCurrentSubController:(id)a3
{
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

- (UIView)tableHeaderContainerView
{
  return self->tableHeaderContainerView;
}

- (void)setTableHeaderContainerView:(id)a3
{
}

- (UITableView)mainTableView
{
  return self->_mainTableView;
}

- (void)setMainTableView:(id)a3
{
}

- (int64_t)letMeChooseButtonIndex
{
  return self->letMeChooseButtonIndex;
}

- (void)setLetMeChooseButtonIndex:(int64_t)a3
{
  self->letMeChooseButtonIndex = a3;
}

- (int64_t)restoreButtonIndex
{
  return self->restoreButtonIndex;
}

- (void)setRestoreButtonIndex:(int64_t)a3
{
  self->restoreButtonIndex = a3;
}

- (int64_t)recommendationButtonIndex
{
  return self->recommendationButtonIndex;
}

- (void)setRecommendationButtonIndex:(int64_t)a3
{
  self->recommendationButtonIndex = a3;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (NSString)settingUpStatusText
{
  return (NSString *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setSettingUpStatusText:(id)a3
{
}

- (AUPasswordUIAlert)passwordAlert
{
  return self->passwordAlert;
}

- (void)setPasswordAlert:(id)a3
{
}

- (AUUIAlert)askUserQuestionAlert
{
  return self->askUserQuestionAlert;
}

- (void)setAskUserQuestionAlert:(id)a3
{
}

- (AUUIAlert)connectionVerificationAlert
{
  return self->connectionVerificationAlert;
}

- (void)setConnectionVerificationAlert:(id)a3
{
}

- (AUUIAlert)uiAlert
{
  return self->uiAlert;
}

- (void)setUiAlert:(id)a3
{
}

- (UIView)spinnerWithStatusAdjacentView
{
  return self->_spinnerWithStatusAdjacentView;
}

- (void)setSpinnerWithStatusAdjacentView:(id)a3
{
}

- (id)newStepByStepControllerForStep:(int)a3
{
  uint64_t v3 = 0;
  while (dword_2647B8468[v3] != a3)
  {
    v3 += 4;
    if (v3 == 60) {
      return 0;
    }
  }
  id v5 = objc_alloc(NSClassFromString(*(NSString **)&dword_2647B8468[v3 + 2]));

  return (id)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
}

- (void)startSetup:(id)a3
{
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend_navigationController(self, a2, a3);
  uint64_t v8 = v5;
  if (v3)
  {
    uint64_t v9 = objc_msgSend_viewControllers(v5, v6, v7);
    if ((unint64_t)objc_msgSend_count(v9, v10, v11) >= 2)
    {
      id v13 = (id)objc_msgSend_objectAtIndex_(v9, v12, 0);
      uint64_t v14 = (void *)MEMORY[0x263EFF980];
      uint64_t v17 = objc_msgSend_topViewController(v8, v15, v16);
      double v19 = objc_msgSend_arrayWithObject_(v14, v18, v17);
      objc_msgSend_setViewControllers_animated_(v8, v20, (uint64_t)v19, 0);
      objc_msgSend_removeAllObjects(v19, v21, v22);
      objc_msgSend_addObject_(v19, v23, (uint64_t)v13);
      objc_msgSend_setViewControllers_animated_(v8, v24, (uint64_t)v19, 1);
    }
  }
  else
  {
    objc_msgSend_popToRootViewControllerAnimated_(v5, v6, 0);
  }
  objc_msgSend_setCurrentSubController_(self, v12, 0);
  self->_goingBack = 0;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = objc_msgSend_navigationController(self, a2, (uint64_t)a3);

  objc_msgSend_pushViewController_animated_(v6, v7, (uint64_t)a3, v4);
}

- (void)confirmSkipWANPort
{
  uint64_t v4 = objc_msgSend_guessCompleteDict(self->_assistantUIController, a2, v2);
  CFStringRef v6 = (const __CFString *)objc_msgSend_unconfiguredBaseStationFromGuessCompleteDict_(AutoGuessController, v5, v4);
  uint64_t v9 = objc_msgSend_currentSubController(self, v7, v8);
  if (v9 && objc_msgSend_internetFlow(v9, v10, v11) == 1) {
    uint64_t v12 = @"ConnectionVerificationMessage1";
  }
  else {
    uint64_t v12 = @"ConnectionVerificationMessage2";
  }
  uint64_t v13 = sub_22685D62C((uint64_t)v12, qword_268148378);
  uint64_t v14 = NSString;
  unsigned int v22 = sub_22685AB94(v6, v15, v16, v17, v18, v19, v20, v21);
  int v30 = sub_22685AB68((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);
  uint64_t v31 = sub_22685D7D0(v22, v30, 0);
  uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v14, v32, v13, @"%@", 0, v31);
  uint64_t v34 = [AUUIAlert alloc];
  id v36 = (id)objc_msgSend_initWithViewController_(v34, v35, (uint64_t)self);
  objc_msgSend_setUiAlert_(self, v37, (uint64_t)v36);
  uint64_t v38 = sub_22685D62C(@"NoInternetConnection", qword_268148378);
  objc_msgSend_setTitle_(self->uiAlert, v39, v38);
  objc_msgSend_setMessage_(self->uiAlert, v40, valid);
  objc_msgSend_setDelegate_(self->uiAlert, v41, (uint64_t)self);
  uint64_t v42 = sub_22685D62C(@"ContinueAnyway", qword_268148378);
  objc_msgSend_setOkButtonTitle_(self->uiAlert, v43, v42);
  uint64_t v44 = sub_22685D62C(@"ReviewSettings", qword_268148378);
  objc_msgSend_setCancelButtonTitle_(self->uiAlert, v45, v44);
  objc_msgSend_setTag_(self->uiAlert, v46, 4000);
  objc_msgSend_setStackButtons_(self->uiAlert, v47, 1);
  uiAlert = self->uiAlert;

  objc_msgSend_show(uiAlert, v48, v49);
}

- (void)skipWANPort
{
  objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self->_assistantUIController, a2, 4294960539, 0);

  objc_msgSend_showUIForSetupStatus(self, v3, v4);
}

- (void)continueWithPPPoESettings
{
  assistantUIController = self->_assistantUIController;
  id v5 = objc_msgSend_currentSubController(self, a2, v2);
  uint64_t v8 = objc_msgSend_outResultsDict(v5, v6, v7);
  objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(assistantUIController, v9, 0, v8);

  objc_msgSend_showUIForSetupStatus(self, v10, v11);
}

- (void)continueWithDiagsAndUsageStats
{
  assistantUIController = self->_assistantUIController;
  id v5 = objc_msgSend_currentSubController(self, a2, v2);
  uint64_t v8 = objc_msgSend_outResultsDict(v5, v6, v7);
  objc_msgSend_showUIConfigPromptResult_withOptions_(assistantUIController, v9, 0, v8);

  objc_msgSend_showUIForSetupStatus(self, v10, v11);
}

- (void)continueWithGuestNetSettings
{
  uint64_t v11 = 0;
  uint64_t v4 = objc_msgSend_currentSubController(self, a2, v2);
  CFStringRef v7 = (const __CFString *)objc_msgSend_outResultsDict(v4, v5, v6);
  sub_2268CAABC(v7, &v11);
  objc_msgSend_showUIConfigPromptResult_withOptions_(self->_assistantUIController, v8, 0, v11);

  objc_msgSend_showUIForSetupStatus(self, v9, v10);
}

- (void)continueWithSwapCabling
{
  objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self->_assistantUIController, a2, 4294960525, 0);

  objc_msgSend_showUIForSetupStatus(self, v3, v4);
}

- (void)skipPluginAudioCabling
{
  objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self->_assistantUIController, a2, 4294960539, 0);

  objc_msgSend_showUIForSetupStatus(self, v3, v4);
}

- (void)showUIForSetupStatus
{
  if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController(private) showUIForSetupStatus]", 100, (uint64_t)"\n", v3, v4, v5, v6, v52);
  }
  uint64_t v8 = objc_msgSend_currentSubController(self, a2, v2);
  uint64_t v11 = objc_msgSend_tableManager(v8, v9, v10);
  objc_msgSend_cleanTableViewForReuse(v11, v12, v13);
  objc_msgSend_popToRootViewControllerAnimated_(self, v14, 0);
  uint64_t v17 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v15, v16);
  if (v17)
  {
    uint64_t v19 = objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, v18, v17);
    uint64_t v21 = objc_msgSend_valueForKey_(v19, v20, @"BSAutoGuess_UnconfiguredBase");
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = objc_msgSend_valueForKey_(0, v18, @"BSAutoGuess_UnconfiguredBase");
  }
  if (v21)
  {
    int v29 = sub_22685AB68(v21, (uint64_t)v22, v23, v24, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v30 = objc_msgSend_valueForKey_(v19, v22, @"BSAutoGuess_UnconfiguredNetwork");
    int v29 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v31, v30);
  }
  int v32 = v29;
  double v33 = sub_22685DBE0(v29);
  uint64_t v34 = sub_22685D62C((uint64_t)v33, qword_268148378);
  double v37 = objc_msgSend_navigationItem(self, v35, v36);
  objc_msgSend_setTitle_(v37, v38, v34);
  uint64_t v40 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v39, (uint64_t)self->justTextContainerView);
  uint64_t v42 = v40;
  if ((v32 - 2) >= 3) {
    objc_msgSend_addObject_(v40, v41, (uint64_t)self->topoView);
  }
  objc_msgSend_addObject_(v42, v41, (uint64_t)self->spinnerWithStatusBelowView);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(self, v43, (uint64_t)self->tableHeaderContainerView, v42, 1);
  tableHeaderContainerView = self->tableHeaderContainerView;
  uint64_t v47 = objc_msgSend_tableView(self, v45, v46);
  objc_msgSend_setTableHeaderView_(v47, v48, (uint64_t)tableHeaderContainerView);
  spinnerWithStatusBelowSpinner = self->spinnerWithStatusBelowSpinner;

  objc_msgSend_startAnimating(spinnerWithStatusBelowSpinner, v49, v50);
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  v3.receiver = self;
  v3.super_class = (Class)AssistantUIViewController;
  [(AssistantUIViewController *)&v3 disablesAutomaticKeyboardDismissal];
  return 0;
}

- (void)setupCompleteShowPasswords:(BOOL)a3
{
  if (!a3) {
    goto LABEL_13;
  }
  uint64_t v4 = objc_msgSend_tableManager(self, a2, a3);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, @"ShowPasswords") != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = objc_msgSend_tableManager(self, v6, v7);
    objc_msgSend_deleteSectionWithIdentifier_(v8, v9, @"ShowPasswords");
  }
  uint64_t v10 = objc_msgSend_tableManager(self, v6, v7);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v10, v11, @"PasswordsTableSection") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3);
    uint64_t v15 = objc_msgSend_tableManager(self, v13, v14);
    uint64_t v16 = sub_22685D62C(@"WiFiPasswordLabel", qword_268148378);
    uint64_t RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v15, v17, 0, v16, @"dynamicValue", 1464225889);
    objc_msgSend_addObject_(v12, v19, RowStyleBasicWithImage_text1_text2_withTag);
    unsigned int v22 = objc_msgSend_tableManager(self, v20, v21);
    uint64_t v23 = sub_22685D62C(@"BasePasswordLabel", qword_268148378);
    uint64_t v25 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v22, v24, 0, v23, @"dynamicValue", 1113673825);
    objc_msgSend_addObject_(v12, v26, v25);
    int v29 = objc_msgSend_setupOptions(self->_assistantUIController, v27, v28);
    if (objc_msgSend_valueForKey_(v29, v30, @"kBSAutoGuessSetupOptionKey_DiskSharing_Password")
      && objc_msgSend_valueForItemOfType_atTypeIndex_inCellWithTag_(self, v31, @"editTextView", 0, 1147752545))
    {
      double v33 = objc_msgSend_tableManager(self, v31, v32);
      uint64_t v34 = sub_22685D62C(@"DiskPasswordLabel", qword_268148378);
      uint64_t v36 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v33, v35, 0, v34, @"dynamicValue", 1147752545);
      objc_msgSend_addObject_(v12, v37, v36);
    }
    if (objc_msgSend_valueForItemOfType_atTypeIndex_inCellWithTag_(self, v31, @"editTextView", 0, 1196314743))
    {
      uint64_t v40 = objc_msgSend_tableManager(self, v38, v39);
      uint64_t v41 = sub_22685D62C(@"GuestNetPasswordLabel", qword_268148378);
      uint64_t v43 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v40, v42, 0, v41, @"dynamicValue", 1196314743);
      objc_msgSend_addObject_(v12, v44, v43);
    }
    uint64_t v45 = objc_msgSend_tableManager(self, v38, v39);
    uint64_t v48 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v46, (uint64_t)v12, @"sectionRows", @"PasswordsTableSection", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v45, v47, v48);
  }
  else
  {
LABEL_13:
    uint64_t v49 = objc_msgSend_tableManager(self, a2, a3);
    objc_msgSend_deleteSectionWithIdentifier_(v49, v50, @"PasswordsTableSection");
  }
}

- (void)handleCancelRequest:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_setEnabled_(self->cancelButton, a2, 0);
  objc_msgSend_setEnabled_(self->nextButton, v5, 0);
  uint64_t v12 = objc_msgSend_cancelCurrentAssistantState_(self->_assistantUIController, v6, v3);
  if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController(private) handleCancelRequest:]", 100, (uint64_t)"cancelCurrentAssistantState err: %m\n", v8, v9, v10, v11, v12);
  }
  if (v3 || v12 != -6771)
  {
    uint64_t v19 = objc_msgSend_doneWithAssistant_(self->_assistantUIController, v7, v3);
    if (dword_268145EA8 <= 100 && (dword_268145EA8 != -1 || sub_226865630((uint64_t)&dword_268145EA8, 0x64u))) {
      sub_226865EB4((uint64_t)&dword_268145EA8, (uint64_t)"-[AssistantUIViewController(private) handleCancelRequest:]", 100, (uint64_t)"doneWithAssistant err: %m\n", v15, v16, v17, v18, v19);
    }
    if (v3 || v19 != -6771)
    {
      uint64_t v20 = objc_msgSend_assistantResult(self->_assistantUIController, v13, v14);
      MEMORY[0x270F9A6D0](self, sel_doneWithAssistantResult_, v20);
    }
  }
}

- (id)radioNameFromBaseStation:(id)a3
{
  if (a3) {
    return (id)objc_msgSend_objectForKey_(a3, a2, @"raNm");
  }
  else {
    return 0;
  }
}

@end