@interface AssistantUIController
- (AUSetupController)setupController;
- (AssistantUIController)init;
- (AutoGuessController)autoGuessController;
- (BOOL)restoreNetworkIfNeeded:(BOOL)a3 disassociateIfNeeded:(BOOL)a4 forceQuit:(BOOL)a5;
- (NSArray)paramScanResults;
- (NSDictionary)guessCompleteDict;
- (NSDictionary)lastAssociatedInfo;
- (NSDictionary)lastAutoguessInstrumentation;
- (NSDictionary)lastSetupInstrumentation;
- (NSDictionary)lastStepByStepInstrumentation;
- (NSDictionary)targetBrowseRecord;
- (NSDictionary)targetScanRecord;
- (NSMutableDictionary)setupOptions;
- (NSString)targetMACAddress;
- (StepByStepController)stepByStepController;
- (id)delegate;
- (id)modifyTopoUIInLayer:(id)a3 withLayout:(id)a4 andOwningView:(id)a5 targetProductID:(id)a6 targetDeviceKind:(id)a7 targetName:(id)a8 targetWiFiName:(id)a9 sourceProductID:(id)a10 sourceDeviceKind:(id)a11 sourceName:(id)a12 sourceWiFiName:(id)a13 connectionType:(id)a14;
- (id)setupPromptStringForBaseInfo:(id)a3 andResult:(int)a4;
- (int)assistantResult;
- (int)cancelCurrentAssistantState:(BOOL)a3;
- (int)connectionStatusSelectorAwaitingResolution;
- (int)doneWithAssistant:(BOOL)a3;
- (int)startAutoGuess;
- (int)startRestoreFromAutoGuessRecommendation;
- (int)startRestoreNetwork:(id)a3;
- (int)startSetupFromAutoGuessRecommendation:(id)a3;
- (int)startSetupFromStepByStepResults:(id)a3;
- (int)startStepByStepFromAutoGuessRecommendation;
- (int)state;
- (void)autoguessProgressComplete:(id)a3;
- (void)autoguessProgressUpdated:(int)a3 paramString:(id)a4;
- (void)autoguessUpdateTargetInfo:(id)a3;
- (void)dealloc;
- (void)deliverSetupUIConfigResult:(int)a3 withOptions:(id)a4;
- (void)handlePresentAutoGuessUIFromAutoGuessCompleteResult:(BOOL)a3;
- (void)presentUIForConnectionVerification:(int)a3 status:(int)a4 paramDict:(id)a5;
- (void)presentUIForConnectionVerificationResult:(int)a3 withOptions:(id)a4;
- (void)presentUIForStepByStepNextStepResult:(int)a3 withOptions:(id)a4;
- (void)presentUIForUIConfigPrompt:(int)a3 paramDict:(id)a4;
- (void)restoreNetworkDone:(id)a3;
- (void)setAutoGuessController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGuessCompleteDict:(id)a3;
- (void)setLastAssociatedInfo:(id)a3;
- (void)setLastAutoguessInstrumentation:(id)a3;
- (void)setLastSetupInstrumentation:(id)a3;
- (void)setLastStepByStepInstrumentation:(id)a3;
- (void)setParamScanResults:(id)a3;
- (void)setSetupController:(id)a3;
- (void)setSetupOptions:(id)a3;
- (void)setStepByStepController:(id)a3;
- (void)setTargetBrowseRecord:(id)a3;
- (void)setTargetMACAddress:(id)a3;
- (void)setTargetScanRecord:(id)a3;
- (void)setupCompleteWithResult:(int)a3 baseStationInfo:(id)a4 forController:(id)a5;
- (void)setupProgressUpdated:(int)a3 status:(int)a4 paramDict:(id)a5 forController:(id)a6;
- (void)setupUIConfigConnectionStatusUpdated:(int)a3 status:(int)a4 paramDict:(id)a5 forController:(id)a6;
- (void)setupUIConfigPrompt:(int)a3 paramDict:(id)a4 forController:(id)a5;
- (void)showUIConfigPromptResult:(int)a3 withOptions:(id)a4;
- (void)stepByStepCompleteWithResult:(int)a3 paramDict:(id)a4;
- (void)stepByStepNextStep:(int)a3 paramDict:(id)a4;
- (void)stepByStepProgressUpdated:(int)a3 status:(int)a4 paramString:(id)a5;
@end

@implementation AssistantUIController

- (AssistantUIController)init
{
  v11.receiver = self;
  v11.super_class = (Class)AssistantUIController;
  v2 = [(AssistantUIController *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(AutoGuessController);
    objc_msgSend_setAutoGuessController_(v2, v4, (uint64_t)v3);
    objc_msgSend_setDelegate_(v2->_autoGuessController, v5, (uint64_t)v2);
    v2->_state = 0;
    v6 = (void *)sub_22685D62C(@"untitled", @"AirPortSettings");
    v9 = (char *)objc_msgSend_UTF8String(v6, v7, v8);
    sub_2268A7A28(v9);
  }
  return v2;
}

- (void)dealloc
{
  v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, @"com.apple.WiFiUtils.Join.Complete", 0);
  objc_msgSend_setAutoGuessController_(self, v6, 0);
  v7.receiver = self;
  v7.super_class = (Class)AssistantUIController;
  [(AssistantUIController *)&v7 dealloc];
}

- (int)startAutoGuess
{
  if (self->_state)
  {
    LODWORD(delegate) = -6709;
  }
  else if (self->_autoGuessController)
  {
    *(void *)&self->_state = 1;
    v5 = objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
    if (objc_msgSend_airPortIsOn(v5, v6, v7))
    {
      if (objc_msgSend_isCurrentlyAssociatedToAnInfrastructureNetwork_(v5, v8, 0))
      {
        uint64_t CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(v5, v8, v9);
        objc_msgSend_setLastAssociatedInfo_(self, v11, CurrentAssociationInfo);
        if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
          sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController startAutoGuess]", 100, (uint64_t)"lastAssociatedInfo: %@\n", v12, v13, v14, v15, (uint64_t)self->_lastAssociatedInfo);
        }
      }
    }
    objc_msgSend_setTargetMACAddress_(self->_autoGuessController, v8, (uint64_t)self->_targetMACAddress);
    objc_msgSend_setTargetScanRecord_(self->_autoGuessController, v16, (uint64_t)self->_targetScanRecord);
    objc_msgSend_setTargetBrowseRecord_(self->_autoGuessController, v17, (uint64_t)self->_targetBrowseRecord);
    objc_msgSend_setUiDelegate_(self->_autoGuessController, v18, (uint64_t)self->_delegate);
    autoGuessController = self->_autoGuessController;
    if (objc_msgSend_count(self->_paramScanResults, v20, v21))
    {
      LODWORD(delegate) = objc_msgSend_runAutoGuessWithWifiScanInfos_(autoGuessController, v22, (uint64_t)self->_paramScanResults);
    }
    else
    {
      uint64_t v24 = objc_msgSend_unmergedScanInfoArray(v5, v22, v23);
      LODWORD(delegate) = objc_msgSend_runAutoGuessWithWifiScanInfos_(autoGuessController, v25, v24);
    }
    if (!delegate)
    {
      id delegate = self->_delegate;
      if (delegate)
      {
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_presentUIForRecommendationStatus(self->_delegate, v26, v27);
        }
        LODWORD(delegate) = 0;
      }
    }
  }
  else
  {
    LODWORD(delegate) = -6718;
  }
  return (int)delegate;
}

- (int)startSetupFromAutoGuessRecommendation:(id)a3
{
  if (self->_state != 2) {
    return -6709;
  }
  if (self->_setupController) {
    return -6721;
  }
  v6 = objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, a2, (uint64_t)self->_guessCompleteDict);
  if (!v6) {
    return -6727;
  }
  uint64_t v8 = v6;
  uint64_t v9 = objc_msgSend_objectForKey_(v6, v7, @"BSAutoGuess_UnconfiguredNetwork");
  int v11 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v10, v9);
  uint64_t v14 = off_2647B7C80;
  if ((v11 - 3) >= 2) {
    uint64_t v14 = off_2647B7C88;
  }
  uint64_t v15 = objc_msgSend_setupController(*v14, v12, v13);
  objc_msgSend_setSetupController_(self, v16, v15);
  setupController = self->_setupController;
  if (!setupController) {
    return -6728;
  }
  self->_state = 5;
  v20 = objc_msgSend_setupDelegates(setupController, v17, v18);
  objc_msgSend_addObject_(v20, v21, (uint64_t)self);
  objc_msgSend_setUiConfigDelegate_(self->_setupController, v22, (uint64_t)self);
  objc_msgSend_setUiDelegate_(self->_setupController, v23, (uint64_t)self->_delegate);
  setupOptions = self->_setupOptions;
  uint64_t v26 = objc_msgSend_numberWithBool_(NSNumber, v25, 1);
  objc_msgSend_setObject_forKey_(setupOptions, v27, v26, @"kBSAutoGuessSetupOptionKey_RecommendationIsAutomatic");
  if (a3)
  {
    uint64_t v29 = objc_msgSend_objectForKey_(a3, v28, @"kSBSKey_BaseName");
    if (v29) {
      objc_msgSend_setObject_forKey_(self->_setupOptions, v30, v29, @"kBSAutoGuessSetupOptionKey_BaseName");
    }
    uint64_t v31 = objc_msgSend_objectForKey_(a3, v30, @"kSBSKey_BasePassword");
    if (v31) {
      objc_msgSend_setObject_forKey_(self->_setupOptions, v32, v31, @"kBSAutoGuessSetupOptionKey_BasePassword");
    }
    uint64_t v33 = objc_msgSend_objectForKey_(a3, v32, @"kSBSKey_AirPlayPassword");
    if (v33) {
      objc_msgSend_setObject_forKey_(self->_setupOptions, v34, v33, @"kBSAutoGuessSetupOptionKey_AirPlayPassword");
    }
    uint64_t v35 = objc_msgSend_objectForKey_(a3, v34, @"kSBSKey_NetworkName");
    if (v35) {
      objc_msgSend_setObject_forKey_(self->_setupOptions, v36, v35, @"kBSAutoGuessSetupOptionKey_NetworkName");
    }
    uint64_t v37 = objc_msgSend_objectForKey_(a3, v36, @"kSBSKey_NetworkPassword");
    if (v37) {
      objc_msgSend_setObject_forKey_(self->_setupOptions, v38, v37, @"kBSAutoGuessSetupOptionKey_NetworkPassword");
    }
    uint64_t v39 = objc_msgSend_objectForKey_(a3, v38, @"kSBSKey_SourceNetwork");
    if (v39) {
      objc_msgSend_setObject_forKey_(self->_setupOptions, v40, v39, @"kBSAutoGuessSetupOptionKey_SourceNetwork");
    }
    uint64_t v41 = objc_msgSend_objectForKey_(a3, v40, @"kSBSKey_SourceBase");
    if (v41) {
      objc_msgSend_setObject_forKey_(self->_setupOptions, v42, v41, @"kBSAutoGuessSetupOptionKey_SourceBase");
    }
    uint64_t v43 = objc_msgSend_objectForKey_(v8, v42, @"BSAutoGuess_UnconfiguredNetwork");
    if (v43) {
      objc_msgSend_setObject_forKey_(self->_setupOptions, v28, v43, @"BSAutoGuess_UnconfiguredNetwork");
    }
  }
  int result = objc_msgSend_setupFromAutoguessRecommendation_withOptions_(self->_setupController, v28, (uint64_t)v8, self->_setupOptions);
  if (!result)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend_presentUIForSetupStatusWithRecommendationDict_(self->_delegate, v44, (uint64_t)v8);
    }
    v46 = self->_setupController;
    return objc_msgSend_updateSettingsAsync(v46, v44, v45);
  }
  return result;
}

- (int)startStepByStepFromAutoGuessRecommendation
{
  if (self->_state != 2) {
    return -6709;
  }
  if (self->_stepByStepController) {
    return -6721;
  }
  uint64_t v4 = objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, a2, (uint64_t)self->_guessCompleteDict);
  if (!v4) {
    return -6727;
  }
  uint64_t v7 = v4;
  uint64_t v8 = objc_msgSend_stepByStepController(StepByStepController, v5, v6);
  objc_msgSend_setStepByStepController_(self, v9, v8);
  stepByStepController = self->_stepByStepController;
  if (!stepByStepController) {
    return -6728;
  }
  self->_state = 3;
  objc_msgSend_setDelegate_(stepByStepController, v10, (uint64_t)self);
  objc_msgSend_setUiDelegate_(self->_stepByStepController, v12, (uint64_t)self->_delegate);
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend_presentUIForStepByStepStart(self->_delegate, v13, v14);
  }
  uint64_t v15 = objc_msgSend_restoreRecommendationDictionaryFromCompletionDict_(AutoGuessController, v13, (uint64_t)self->_guessCompleteDict);
  objc_msgSend_setRestoreRecommendation_(self->_stepByStepController, v16, v15);
  uint64_t v18 = self->_stepByStepController;
  setupOptions = self->_setupOptions;

  return objc_msgSend_setupFromAutoguessRecommendation_withOptions_(v18, v17, v7, setupOptions);
}

- (int)startRestoreFromAutoGuessRecommendation
{
  self->_state = 5;
  return 0;
}

- (int)cancelCurrentAssistantState:(BOOL)a3
{
  BOOL v3 = a3;
  autoGuessController = self->_autoGuessController;
  if (autoGuessController && self->_state == 1)
  {
    uint64_t v6 = objc_msgSend_cancelAutoGuess(autoGuessController, a2, a3);
    if (v6 == -6720)
    {
      self->_int state = 10;
      uint64_t v7 = self->_autoGuessController;
      objc_msgSend_setAutoGuessController_(self, v8, 0);
LABEL_17:
      uint64_t v6 = 0;
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  setupController = self->_setupController;
  if (!setupController)
  {
LABEL_11:
    stepByStepController = self->_stepByStepController;
    if (stepByStepController && self->_state == 3)
    {
      uint64_t v6 = objc_msgSend_cancelStepByStep(stepByStepController, a2, a3);
      if (!v6)
      {
        self->_int state = 10;
        uint64_t v14 = self->_stepByStepController;
        objc_msgSend_setStepByStepController_(self, v15, 0);
      }
      goto LABEL_18;
    }
    self->_int state = 10;
    if (self->_assistantResult)
    {
      uint64_t v6 = 0;
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  int state = self->_state;
  switch(state)
  {
    case 7:
      objc_msgSend_showUIConfigPromptResult_withOptions_(self, a2, 4294960573, 0);
      break;
    case 6:
      objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self, a2, 4294960573, 0);
      break;
    case 5:
      uint64_t v6 = objc_msgSend_cancelSetup(setupController, a2, a3);
      if (v6 == -6720)
      {
        self->_int state = 10;
        int v11 = self->_setupController;
        objc_msgSend_setSetupController_(self, v12, 0);
        goto LABEL_17;
      }
LABEL_18:
      self->_assistantResult = -6723;
      goto LABEL_22;
    default:
      goto LABEL_11;
  }
  uint64_t v6 = 4294960525;
LABEL_22:
  v16 = objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  objc_msgSend_cancelAsync(v16, v17, v18);
  if (v3)
  {
    if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
      sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController cancelCurrentAssistantState:]", 100, (uint64_t)"forcing cancel state cancel err: %m\n", v21, v22, v23, v24, v6);
    }
    *(void *)&self->_int state = 0xFFFFE5BD0000000ALL;
    if (self->_autoGuessController)
    {
      v25 = objc_msgSend_autoGuessController(self, v19, v20);
      objc_msgSend_setDelegate_(v25, v26, 0);
    }
    if (self->_stepByStepController)
    {
      uint64_t v27 = objc_msgSend_stepByStepController(self, v19, v20);
      objc_msgSend_setDelegate_(v27, v28, 0);
    }
    if (self->_setupController)
    {
      uint64_t v29 = objc_msgSend_setupController(self, v19, v20);
      objc_msgSend_setUiConfigDelegate_(v29, v30, 0);
      uint64_t v33 = objc_msgSend_setupController(self, v31, v32);
      v36 = objc_msgSend_setupDelegates(v33, v34, v35);
      objc_msgSend_removeObject_(v36, v37, (uint64_t)self);
    }
    LODWORD(v6) = 0;
  }
  return v6;
}

- (int)doneWithAssistant:(BOOL)a3
{
  int state = self->_state;
  if ((state - 9) > 1) {
    return -6709;
  }
  self->_int state = 11;
  if (state == 9
    || !objc_msgSend_restoreNetworkIfNeeded_disassociateIfNeeded_forceQuit_(self, a2, 1, 1, a3))
  {
    if (dword_2681462C8 <= 100)
    {
      if (dword_2681462C8 == -1)
      {
        int v8 = 0;
        if (!sub_226865630((uint64_t)&dword_2681462C8, 0x64u)) {
          return v8;
        }
      }
      else
      {
        int v8 = 0;
      }
      uint64_t v9 = "No restore needed - done\n";
LABEL_17:
      sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController doneWithAssistant:]", 100, (uint64_t)v9, v3, v4, v5, v6, v11);
      return v8;
    }
    return 0;
  }
  else if (dword_2681462C8 > 100)
  {
    return -6771;
  }
  else
  {
    if (dword_2681462C8 != -1)
    {
      int v8 = -6771;
LABEL_16:
      uint64_t v9 = "Holding up done, until restore is complete\n";
      goto LABEL_17;
    }
    int v8 = -6771;
    if (sub_226865630((uint64_t)&dword_2681462C8, 0x64u)) {
      goto LABEL_16;
    }
  }
  return v8;
}

- (id)modifyTopoUIInLayer:(id)a3 withLayout:(id)a4 andOwningView:(id)a5 targetProductID:(id)a6 targetDeviceKind:(id)a7 targetName:(id)a8 targetWiFiName:(id)a9 sourceProductID:(id)a10 sourceDeviceKind:(id)a11 sourceName:(id)a12 sourceWiFiName:(id)a13 connectionType:(id)a14
{
  if (a4)
  {
    id v19 = a4;
    if (a3) {
      objc_msgSend_setContainerLayer_(a4, a2, (uint64_t)a3);
    }
  }
  else
  {
    if (!a3) {
      return 0;
    }
    uint64_t v20 = [NetTopoMiniStaticLayout alloc];
    id v19 = (id)objc_msgSend_initWithContainerLayer_andOptions_(v20, v21, (uint64_t)a3, 4);
  }
  objc_msgSend_setNetTopoMiniStaticLayout_(a5, a2, (uint64_t)v19);
  uint64_t v24 = 4;
  if (a10)
  {
    if (sub_226905310(a5, v22, v23) == 1) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = 4;
    }
  }
  objc_msgSend_setLayoutOptions_(v19, v22, v24);
  objc_msgSend_setOwningView_(v19, v25, (uint64_t)a5);
  uint64_t v29 = objc_msgSend_array(MEMORY[0x263EFF980], v26, v27);
  if (a10)
  {
    v30 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v28, (uint64_t)off_268147F40[0], off_268147F38[0], a10, off_268147F48[0], a11, off_268147F50[0], 0);
    uint64_t v32 = v30;
    if (a13) {
      objc_msgSend_setObject_forKey_(v30, v31, (uint64_t)a13, off_268147F58[0]);
    }
    if (a12) {
      objc_msgSend_setObject_forKey_(v32, v31, (uint64_t)a12, off_268147F60[0]);
    }
    objc_msgSend_addObject_(v29, v31, (uint64_t)v32);
  }
  uint64_t v33 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v28, (uint64_t)off_268147F40[0], off_268147F38[0], a6, off_268147F48[0], a7, off_268147F50[0], 0);
  uint64_t v35 = v33;
  if (a9) {
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)a9, off_268147F58[0]);
  }
  if (a8) {
    objc_msgSend_setObject_forKey_(v35, v34, (uint64_t)a8, off_268147F60[0]);
  }
  if (a10) {
    objc_msgSend_setObject_forKey_(v35, v34, (uint64_t)a14, off_268147F68[0]);
  }
  objc_msgSend_addObject_(v29, v34, (uint64_t)v35);
  objc_msgSend_createLayoutForDevices_(v19, v36, (uint64_t)v29);
  return v19;
}

- (void)deliverSetupUIConfigResult:(int)a3 withOptions:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_setupUIConfigResult_withOptions_(self->_setupController, v7, v5, a4);
  }
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    MEMORY[0x270F9A6D0](delegate, sel_showUIConfigPromptPostHook, v8);
  }
}

- (void)presentUIForConnectionVerificationResult:(int)a3 withOptions:(id)a4
{
  if (self->_setupController)
  {
    if (self->_state == 6) {
      objc_msgSend_deliverSetupUIConfigResult_withOptions_(self, a2, *(uint64_t *)&a3, a4);
    }
  }
}

- (void)showUIConfigPromptResult:(int)a3 withOptions:(id)a4
{
  if (self->_setupController)
  {
    if (self->_state == 7)
    {
      objc_msgSend_deliverSetupUIConfigResult_withOptions_(self, a2, *(uint64_t *)&a3, a4);
      self->_int state = 5;
    }
  }
}

- (void)presentUIForStepByStepNextStepResult:(int)a3 withOptions:(id)a4
{
  uint64_t v8 = *(void *)&a3;
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController presentUIForStepByStepNextStepResult:withOptions:]", 100, (uint64_t)"result: %ld options: %@\n", v4, v5, v6, v7, v8);
  }
  if (self->_state == 3)
  {
    stepByStepController = self->_stepByStepController;
    MEMORY[0x270F9A6D0](stepByStepController, sel_stepByStepNextStepResult_withOptions_, v8);
  }
}

- (void)autoguessUpdateTargetInfo:(id)a3
{
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController autoguessUpdateTargetInfo:]", 100, (uint64_t)"targetInfo: %@ \n", v3, v4, v5, v6, (uint64_t)a3);
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    MEMORY[0x270F9A6D0](delegate, sel_presentUIForRecommmendationTargetInfo_, a3);
  }
}

- (void)autoguessProgressUpdated:(int)a3 paramString:(id)a4
{
  uint64_t v9 = *(void *)&a3;
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController autoguessProgressUpdated:paramString:]", 100, (uint64_t)"selector: %d paramString: %@\n", v4, v5, v6, v7, v9);
  }
  uint64_t v11 = &stru_26DA6BE88;
  switch((int)v9)
  {
    case 3:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kProgress_Browsing";
      goto LABEL_20;
    case 5:
      if (!a4) {
        break;
      }
      uint64_t v14 = NSString;
      uint64_t v15 = qword_268148378;
      v16 = @"kProgress_NetworkJoin";
      goto LABEL_13;
    case 7:
      if (!a4) {
        break;
      }
      uint64_t v14 = NSString;
      uint64_t v15 = qword_268148378;
      v16 = @"kProgress_WaitingForBase";
      goto LABEL_13;
    case 9:
      if (!a4) {
        break;
      }
      uint64_t v14 = NSString;
      uint64_t v15 = qword_268148378;
      v16 = @"kProgress_NetworkSearch";
LABEL_13:
      uint64_t v17 = sub_22685D62C((uint64_t)v16, v15);
      uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v14, v18, v17, @"%@", 0, a4);
      goto LABEL_21;
    case 11:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kProgress_WaitingForResources";
      goto LABEL_20;
    case 15:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kIntializingServicesString";
      goto LABEL_20;
    case 16:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kProgress_ExaminingRestoreProfile";
      goto LABEL_20;
    case 17:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kProgress_ExaminingOtherBaseStations";
      goto LABEL_20;
    case 18:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kProgress_ExaminingNewBaseStation";
      goto LABEL_20;
    case 19:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kCancelingServicesString";
LABEL_20:
      uint64_t valid = sub_22685D62C((uint64_t)v13, v12);
LABEL_21:
      uint64_t v11 = (__CFString *)valid;
      break;
    default:
      break;
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    MEMORY[0x270F9A6D0](delegate, sel_assistantUpdateProgress_forState_, v11);
  }
}

- (void)autoguessProgressComplete:(id)a3
{
  objc_msgSend_setGuessCompleteDict_(self, a2, (uint64_t)a3);
  uint64_t Instrumentation = objc_msgSend_lastInstrumentation(self->_autoGuessController, v4, v5);
  objc_msgSend_setLastAutoguessInstrumentation_(self, v7, Instrumentation);
  uint64_t v8 = self->_autoGuessController;
  objc_msgSend_setAutoGuessController_(self, v9, 0);
  if (objc_msgSend_restoreNetworkIfNeeded_disassociateIfNeeded_forceQuit_(self, v10, 1, 0, 0)
    && dword_2681462C8 <= 100
    && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u)))
  {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController autoguessProgressComplete:]", 100, (uint64_t)"Restoring network \n", v12, v13, v14, v15, v16);
  }

  objc_msgSend_handlePresentAutoGuessUIFromAutoGuessCompleteResult_(self, v11, 1);
}

- (void)setupProgressUpdated:(int)a3 status:(int)a4 paramDict:(id)a5 forController:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController setupProgressUpdated:status:paramDict:forController:]", 100, (uint64_t)"selector: %d status: %ld paramDict: %@\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v9);
  }
  uint64_t v11 = objc_msgSend_objectForKey_(a5, a2, @"BSAssistantProgressKey_StringParameter");
  uint64_t v16 = v11;
  switch((int)v9)
  {
    case 5:
      if (!v11) {
        goto LABEL_42;
      }
      uint64_t v18 = NSString;
      uint64_t v19 = qword_268148378;
      uint64_t v20 = @"kProgress_NetworkJoin";
      goto LABEL_33;
    case 7:
      if (!v11) {
        goto LABEL_42;
      }
      uint64_t v18 = NSString;
      uint64_t v19 = qword_268148378;
      uint64_t v20 = @"kProgress_WaitingForBase";
      goto LABEL_33;
    case 9:
      if (!v11) {
        goto LABEL_42;
      }
      uint64_t v18 = NSString;
      uint64_t v19 = qword_268148378;
      uint64_t v20 = @"kProgress_NetworkSearch";
      goto LABEL_33;
    case 11:
      uint64_t v21 = NSString;
      uint64_t v22 = sub_22685D62C(@"kProgress_WaitingForResources", qword_268148378);
      uint64_t valid = (__CFString *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v21, v23, v22, @"%@", 0, v16);
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
        objc_msgSend_assistantWaitingForResourcesStart(self->_delegate, v25, v26);
      }
      goto LABEL_43;
    case 12:
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
        objc_msgSend_assistantWaitingForResourcesComplete(self->_delegate, v27, v28);
      }
      goto LABEL_42;
    case 14:
      uint64_t v29 = qword_268148378;
      v30 = @"kProgress_Start";
      goto LABEL_38;
    case 15:
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v32 = objc_msgSend_objectForKey_(a5, v31, @"BSAssistantProgressKey_DictionaryParameter");
        uint64_t v34 = objc_msgSend_objectForKey_(v32, v33, @"kBSConfigurationSetupComplete_RemovedBase");
        objc_msgSend_performSelector_withObject_(self->_delegate, v35, (uint64_t)sel_setRemovedBaseStation_, v34);
      }
      goto LABEL_42;
    case 18:
      if (!v11) {
        goto LABEL_42;
      }
      uint64_t v18 = NSString;
      uint64_t v19 = qword_268148378;
      uint64_t v20 = @"kProgress_ReadSettings";
      goto LABEL_33;
    case 20:
      if (!v11) {
        goto LABEL_42;
      }
      uint64_t v18 = NSString;
      uint64_t v19 = qword_268148378;
      uint64_t v20 = @"kProgress_WriteSettings";
      goto LABEL_33;
    case 21:
      if (!v11) {
        goto LABEL_42;
      }
      uint64_t v18 = NSString;
      uint64_t v19 = qword_268148378;
      uint64_t v20 = @"kProgress_BaseReady";
LABEL_33:
      uint64_t v36 = sub_22685D62C((uint64_t)v20, v19);
      uint64_t v38 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v18, v37, v36, @"%@", 0, v16);
      goto LABEL_39;
    case 22:
      self->_int state = 6;
      if (!v11) {
        goto LABEL_42;
      }
      uint64_t v29 = qword_268148378;
      v30 = @"kProgress_VerifyConnection";
      goto LABEL_38;
    case 23:
    case 25:
      int v17 = 5;
      goto LABEL_41;
    case 24:
      self->_int state = 6;
      if (!v11) {
        goto LABEL_42;
      }
      uint64_t v29 = qword_268148378;
      v30 = @"kProgress_PluginConnection";
LABEL_38:
      uint64_t v38 = sub_22685D62C((uint64_t)v30, v29);
LABEL_39:
      uint64_t valid = (__CFString *)v38;
      goto LABEL_43;
    case 26:
      int v17 = 8;
LABEL_41:
      self->_int state = v17;
      goto LABEL_42;
    default:
      if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
        sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController setupProgressUpdated:status:paramDict:forController:]", 100, (uint64_t)"\n", v12, v13, v14, v15, v40);
      }
LABEL_42:
      uint64_t valid = &stru_26DA6BE88;
LABEL_43:
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id delegate = self->_delegate;
        MEMORY[0x270F9A6D0](delegate, sel_assistantUpdateProgress_forState_, valid);
      }
      return;
  }
}

- (void)setupCompleteWithResult:(int)a3 baseStationInfo:(id)a4 forController:(id)a5
{
  self->_assistantResult = a3;
  if (a3 == -6723) {
    uint64_t v7 = 4294960527;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 != -6769)
  {
    if (v7)
    {
      self->_int state = 10;
    }
    else
    {
      self->_int state = 9;
      objc_msgSend_setLastAssociatedInfo_(self, a2, 0, a4, a5);
    }
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v8 = objc_msgSend_setupPromptStringForBaseInfo_andResult_(self, a2, (uint64_t)a4, v7);
    objc_msgSend_presentUIForSetupResult_baseStationInfo_withPrompt_(self->_delegate, v9, v7, a4, v8);
  }
  uint64_t Instrumentation = objc_msgSend_lastInstrumentation(self->_setupController, a2, *(uint64_t *)&a3);
  objc_msgSend_setLastSetupInstrumentation_(self, v11, Instrumentation);
  uint64_t v12 = self->_setupController;
  objc_msgSend_setSetupController_(self, v13, 0);
  objc_msgSend_setStepByStepController_(self, v14, 0);
  if (v7 == -6769)
  {
    objc_msgSend_handlePresentAutoGuessUIFromAutoGuessCompleteResult_(self, v15, 0);
  }
}

- (void)setupUIConfigConnectionStatusUpdated:(int)a3 status:(int)a4 paramDict:(id)a5 forController:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController setupUIConfigConnectionStatusUpdated:status:paramDict:forController:]", 100, (uint64_t)" selector: %d status: %ld paramDict: %@\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v9);
  }
  if (a4)
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend_showUIConfigPromptPreHook(self->_delegate, v11, v12);
    }
    MEMORY[0x270F9A6D0](self, sel_presentUIForConnectionVerification_status_paramDict_, v9);
  }
  else if (self->_state == 6)
  {
    self->_connectionStatusSelectorAwaitingResolution = 0;
    if (self->_delegate)
    {
      if (objc_opt_respondsToSelector())
      {
        id delegate = self->_delegate;
        MEMORY[0x270F9A6D0](delegate, sel_connectionVerificationSucceededForSelector_, v9);
      }
    }
  }
}

- (void)setupUIConfigPrompt:(int)a3 paramDict:(id)a4 forController:(id)a5
{
}

- (void)stepByStepProgressUpdated:(int)a3 status:(int)a4 paramString:(id)a5
{
  uint64_t v9 = *(void *)&a3;
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController stepByStepProgressUpdated:status:paramString:]", 100, (uint64_t)"selector: %d paramString: %@\n", (uint64_t)a5, v5, v6, v7, v9);
  }
  uint64_t v11 = &stru_26DA6BE88;
  switch((int)v9)
  {
    case 1:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kPerformingWiFiScanString";
      goto LABEL_8;
    case 3:
      uint64_t v12 = qword_268148378;
      uint64_t v13 = @"kProgress_Browsing";
LABEL_8:
      uint64_t valid = sub_22685D62C((uint64_t)v13, v12);
      goto LABEL_16;
    case 5:
      if (!a5) {
        goto LABEL_17;
      }
      uint64_t v15 = NSString;
      uint64_t v16 = qword_268148378;
      int v17 = @"kProgress_NetworkJoin";
      break;
    case 7:
      if (!a5) {
        goto LABEL_17;
      }
      uint64_t v15 = NSString;
      uint64_t v16 = qword_268148378;
      int v17 = @"kProgress_WaitingForBase";
      break;
    case 9:
      if (!a5) {
        goto LABEL_17;
      }
      uint64_t v15 = NSString;
      uint64_t v16 = qword_268148378;
      int v17 = @"kProgress_NetworkSearch";
      break;
    default:
      goto LABEL_17;
  }
  uint64_t v18 = sub_22685D62C((uint64_t)v17, v16);
  uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v15, v19, v18, @"%@", 0, a5);
LABEL_16:
  uint64_t v11 = (__CFString *)valid;
LABEL_17:
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    MEMORY[0x270F9A6D0](delegate, sel_assistantUpdateProgress_forState_, v11);
  }
}

- (void)stepByStepCompleteWithResult:(int)a3 paramDict:(id)a4
{
  if (a3 == -6769) {
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)&a3;
  if (a3 == -6723) {
    int v7 = 10;
  }
  else {
    int v7 = 4;
  }
  self->_int state = v7;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_presentUIForStepByStepResult_(self->_delegate, a2, v6);
  }
  if (v6)
  {
LABEL_8:
    objc_msgSend_handlePresentAutoGuessUIFromAutoGuessCompleteResult_(self, a2, 0);
    uint64_t v8 = self->_stepByStepController;
    objc_msgSend_setStepByStepController_(self, v9, 0);
  }
  else if (a4)
  {
    MEMORY[0x270F9A6D0](self, sel_startSetupFromStepByStepResults_, a4);
  }
}

- (void)stepByStepNextStep:(int)a3 paramDict:(id)a4
{
  if (self->_delegate)
  {
    uint64_t v5 = *(void *)&a3;
    if (objc_opt_respondsToSelector())
    {
      id delegate = self->_delegate;
      MEMORY[0x270F9A6D0](delegate, sel_presentUIForStepByStepNextStep_paramDict_, v5);
    }
  }
}

- (NSString)targetMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTargetMACAddress:(id)a3
{
}

- (NSDictionary)targetScanRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTargetScanRecord:(id)a3
{
}

- (NSDictionary)targetBrowseRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTargetBrowseRecord:(id)a3
{
}

- (NSArray)paramScanResults
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setParamScanResults:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_id delegate = a3;
}

- (NSMutableDictionary)setupOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSetupOptions:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (int)assistantResult
{
  return self->_assistantResult;
}

- (AutoGuessController)autoGuessController
{
  return (AutoGuessController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAutoGuessController:(id)a3
{
}

- (AUSetupController)setupController
{
  return (AUSetupController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSetupController:(id)a3
{
}

- (StepByStepController)stepByStepController
{
  return (StepByStepController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStepByStepController:(id)a3
{
}

- (NSDictionary)guessCompleteDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGuessCompleteDict:(id)a3
{
}

- (int)connectionStatusSelectorAwaitingResolution
{
  return self->_connectionStatusSelectorAwaitingResolution;
}

- (NSDictionary)lastAssociatedInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastAssociatedInfo:(id)a3
{
}

- (NSDictionary)lastAutoguessInstrumentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastAutoguessInstrumentation:(id)a3
{
}

- (NSDictionary)lastSetupInstrumentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastSetupInstrumentation:(id)a3
{
}

- (NSDictionary)lastStepByStepInstrumentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastStepByStepInstrumentation:(id)a3
{
}

- (int)startSetupFromStepByStepResults:(id)a3
{
  if (self->_setupController) {
    return -6721;
  }
  id v29 = 0;
  id v30 = 0;
  int result = sub_2268CACF8((const __CFString *)a3, (__CFArray **)&v30, (__CFArray **)&v29, v3, v4, v5, v6, v7);
  if (!result)
  {
    if (v30)
    {
      id v10 = v30;
      id v11 = v29;
      uint64_t v14 = objc_msgSend_setupController(AUSetupController, v12, v13);
      objc_msgSend_setSetupController_(self, v15, v14);
      setupController = self->_setupController;
      if (setupController)
      {
        self->_int state = 5;
        uint64_t v19 = objc_msgSend_setupDelegates(setupController, v16, v17);
        objc_msgSend_addObject_(v19, v20, (uint64_t)self);
        objc_msgSend_setUiConfigDelegate_(self->_setupController, v21, (uint64_t)self);
        objc_msgSend_setUiDelegate_(self->_setupController, v22, (uint64_t)self->_delegate);
        uint64_t v24 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v23, (uint64_t)v29);
        objc_msgSend_setSetupOptions_(self, v25, v24);
        int result = objc_msgSend_setupFromAutoguessRecommendation_withOptions_(self->_setupController, v26, (uint64_t)v30, v29);
        if (!result)
        {
          if (self->_delegate)
          {
            if (objc_opt_respondsToSelector()) {
              objc_msgSend_presentUIForSetupStatusWithRecommendationDict_(self->_delegate, v27, (uint64_t)v30);
            }
          }
          return objc_msgSend_updateSettingsAsync(self->_setupController, v27, v28);
        }
      }
      else
      {
        return -6728;
      }
    }
    else
    {
      return -6727;
    }
  }
  return result;
}

- (void)presentUIForConnectionVerification:(int)a3 status:(int)a4 paramDict:(id)a5
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) presentUIForConnectionVerification:status:paramDict:]", 100, (uint64_t)" selector: %d status: %ld paramDict: %@\n", (uint64_t)a5, v5, v6, v7, v9);
  }
  self->_connectionStatusSelectorAwaitingResolution = v9;
  switch((int)v9)
  {
    case 1:
      if (objc_opt_respondsToSelector())
      {
        id delegate = self->_delegate;
        MEMORY[0x270F9A6D0](delegate, sel_showTellUserToPlugInEthernetForStatus_paramDict_, v8);
      }
      break;
    case 2:
      if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
        sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) presentUIForConnectionVerification:status:paramDict:]", 100, (uint64_t)"%s: eBSConfigurationUIConfigSelector_DHCPOrPPPoESeen\n", (uint64_t)a5, v5, v6, v7, (uint64_t)"-[AssistantUIController(Private) presentUIForConnectionVerification:status:paramDict:]");
      }
      goto LABEL_14;
    case 3:
      if (objc_opt_respondsToSelector())
      {
        id v13 = self->_delegate;
        MEMORY[0x270F9A6D0](v13, sel_showAskUserForPPPoECredentialsForStatus_paramDict_, v8);
      }
      break;
    case 4:
LABEL_14:
      if (objc_opt_respondsToSelector())
      {
        id v12 = self->_delegate;
        MEMORY[0x270F9A6D0](v12, sel_showTellUserToResetBroadbandDeviceForStatus_paramDict_, v8);
      }
      break;
    case 5:
      if (objc_opt_respondsToSelector())
      {
        id v14 = self->_delegate;
        MEMORY[0x270F9A6D0](v14, sel_showAskUserSwapCablingForStatus_paramDict_, v8);
      }
      break;
    default:
      return;
  }
}

- (void)presentUIForUIConfigPrompt:(int)a3 paramDict:(id)a4
{
  self->_int state = 7;
  if (a3 == 8)
  {
    if (objc_opt_respondsToSelector())
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_showUIConfigPromptPreHook(self->_delegate, v9, v10);
      }
      id delegate = self->_delegate;
      MEMORY[0x270F9A6D0](delegate, sel_showUIConfigPromptForGuestNetConfigWithParamDict_, a4);
    }
  }
  else if (a3 == 7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend_showUIConfigPromptPreHook(self->_delegate, v6, v7);
    }
    id v8 = self->_delegate;
    MEMORY[0x270F9A6D0](v8, sel_showUIConfigPromptToSendDiagsUsageStatsWithParamDict_, a4);
  }
}

- (void)handlePresentAutoGuessUIFromAutoGuessCompleteResult:(BOOL)a3
{
  BOOL v7 = a3;
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) handlePresentAutoGuessUIFromAutoGuessCompleteResult:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v55);
  }
  unint64_t v9 = 0x263EFF000uLL;
  if (!self->_guessCompleteDict)
  {
    uint64_t v21 = 0;
    uint64_t v23 = 0;
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    uint64_t v27 = 4294960591;
    goto LABEL_38;
  }
  if (v7)
  {
    uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, a3);
    objc_msgSend_setSetupOptions_(self, v11, v10);
  }
  if (!self->_setupOptions)
  {
    uint64_t v21 = 0;
    uint64_t v23 = 0;
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    uint64_t v27 = 4294960568;
    goto LABEL_38;
  }
  id v12 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, a3);
  if (objc_msgSend_BOOLForKey_(v12, v13, @"skipConnectionTesting"))
  {
    setupOptions = self->_setupOptions;
    uint64_t v16 = objc_msgSend_numberWithBool_(NSNumber, v14, 1);
    objc_msgSend_setObject_forKey_(setupOptions, v17, v16, @"kBSAutoGuessSetupOptionKey_SkipInternetTests");
  }
  uint64_t v18 = objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, v14, (uint64_t)self->_guessCompleteDict);
  uint64_t v21 = objc_msgSend_objectForKey_(v18, v19, @"BSAutoGuess_Recommendation");
  if (v18) {
    uint64_t v22 = objc_msgSend_objectForKey_(v18, v20, @"BSAutoGuess_Recommendation");
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v28 = objc_msgSend_valueForKey_(v18, v20, @"BSAutoGuess_UnconfiguredBase");
  id v30 = objc_msgSend_objectForKey_(v28, v29, @"syFl");
  if (v30) {
    unint64_t v26 = ((unint64_t)objc_msgSend_integerValue(v30, v31, v32) >> 10) & 1;
  }
  else {
    unint64_t v26 = 0;
  }
  uint64_t v25 = objc_msgSend_restoreOfferFromCompletionDict_(AutoGuessController, v31, (uint64_t)self->_guessCompleteDict);
  uint64_t v23 = objc_msgSend_recommendationStringFromCompletionDict_(AutoGuessController, v33, (uint64_t)self->_guessCompleteDict);
  if (!v23) {
    goto LABEL_35;
  }
  uint64_t v34 = objc_msgSend_objectForKey_(self->_guessCompleteDict, a2, @"fullGuessResults");
  uint64_t v36 = objc_msgSend_objectForKey_(v34, v35, @"BSAutoGuessComplete_ErrorResult");
  uint64_t v39 = objc_msgSend_integerValue(v36, v37, v38);
  uint64_t v27 = v39;
  if (v39)
  {
    uint64_t v24 = 0;
    self->_int state = 10;
    self->_assistantResult = v39;
LABEL_37:
    unint64_t v9 = 0x263EFF000uLL;
    goto LABEL_38;
  }
  *(void *)&self->_int state = 2;
  if (!v21)
  {
    uint64_t v24 = 0;
    uint64_t v27 = 4294960569;
    goto LABEL_37;
  }
  if (!objc_msgSend_isEqualToString_(v21, a2, @"BSSetupRecommend_OfferCreate"))
  {
    if (objc_msgSend_isEqualToString_(v21, a2, @"BSSetupRecommend_OfferJoinNetwork"))
    {
      char v56 = 0;
      uint64_t v42 = objc_msgSend_objectForKey_(v18, a2, @"BSAutoGuess_SourceNetwork");
      if (v42)
      {
        uint64_t v43 = v42;
        int isEnterprise = objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, a2, v42, 0, &v56);
        uint64_t v24 = 1;
        if (isEnterprise)
        {
          if (!v56)
          {
            uint64_t NetworkPassword = objc_msgSend_getNetworkPassword_(WiFiUtils, a2, v43);
            uint64_t v24 = 1;
            if (NetworkPassword)
            {
              if (v7)
              {
                objc_msgSend_setObject_forKey_(self->_setupOptions, a2, NetworkPassword, @"kBSAutoGuessSetupOptionKey_NetworkPassword");
                uint64_t v24 = 1;
              }
            }
          }
        }
        goto LABEL_36;
      }
    }
LABEL_35:
    uint64_t v24 = 0;
LABEL_36:
    uint64_t v27 = 0;
    goto LABEL_37;
  }
  unint64_t v9 = 0x263EFF000;
  if (v7)
  {
    uint64_t v40 = sub_22685E110();
    objc_msgSend_setObject_forKey_(self->_setupOptions, v41, (uint64_t)v40, @"kBSAutoGuessSetupOptionKey_NetworkName");
  }
  uint64_t v27 = 0;
  uint64_t v24 = 3;
LABEL_38:
  v46 = *(void **)(v9 + 2464);
  uint64_t v47 = objc_msgSend_numberWithInteger_(NSNumber, a2, v24);
  uint64_t v49 = objc_msgSend_numberWithBool_(NSNumber, v48, v26);
  v51 = objc_msgSend_dictionaryWithObjectsAndKeys_(v46, v50, v47, @"passwordUIFlags", v49, @"pppoeDetected", 0);
  v53 = v51;
  if (v23) {
    objc_msgSend_setObject_forKey_(v51, v52, v23, @"promptString");
  }
  if (v25) {
    objc_msgSend_setObject_forKey_(v53, v52, v25, @"restoreOffer");
  }
  if (v22) {
    objc_msgSend_setObject_forKey_(v53, v52, v22, @"actionKey");
  }
  if (v21) {
    objc_msgSend_setObject_forKey_(v53, v52, (uint64_t)v21, @"primaryRecommendation");
  }
  if (self->_delegate)
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend_presentUIForRecommendationResult_paramDict_(self->_delegate, v54, v27, v53);
    }
  }
}

- (id)setupPromptStringForBaseInfo:(id)a3 andResult:(int)a4
{
  if (!a3 || a4)
  {
    uint64_t v54 = qword_268148378;
    return (id)sub_22685D62C(@"kSetup_SetupRecommendationErrorGeneric", v54);
  }
  else
  {
    uint64_t v6 = objc_msgSend_objectForKey_(a3, a2, @"kSetupBaseStationInfoKey_RecommendationInfo");
    id v8 = (__CFString *)objc_msgSend_objectForKey_(v6, v7, @"BSAutoGuess_Recommendation");
    uint64_t v10 = objc_msgSend_objectForKey_(a3, v9, @"kSetupBaseStationInfoKey_GeneralInfo");
    uint64_t v11 = sub_22685D6E8(1937326416);
    id v13 = objc_msgSend_objectForKey_(v10, v12, v11);
    uint64_t v14 = sub_22685D6E8(1937329773);
    uint64_t v16 = objc_msgSend_objectForKey_(v10, v15, v14);
    uint64_t v18 = objc_msgSend_objectForKey_(v6, v17, @"BSAutoGuess_SourceBase");
    uint64_t v20 = objc_msgSend_objectForKey_(v18, v19, @"name");
    uint64_t v23 = objc_msgSend_setupOptions(self, v21, v22);
    uint64_t v25 = objc_msgSend_objectForKey_(v23, v24, @"kBSAutoGuessSetupOptionKey_ExtendOption_JoinApple");
    int v28 = objc_msgSend_BOOLValue(v25, v26, v27);
    uint64_t v31 = objc_msgSend_objectForKey_(a3, v29, @"kSetupBaseStationInfoKey_BrowseRecord");
    if (v28)
    {
      id v8 = @"BSSetupRecommend_OfferJoinNetwork";
      int isEqualToString = objc_msgSend_isEqualToString_(@"BSSetupRecommend_OfferJoinNetwork", v30, @"BSSetupRecommend_OfferReplaceSourceIsUnconfigurable");
    }
    else
    {
      int isEqualToString = objc_msgSend_isEqualToString_(v8, v30, @"BSSetupRecommend_OfferReplaceSourceIsUnconfigurable");
    }
    int v34 = isEqualToString;
    if ((objc_msgSend_isEqualToString_(v8, v33, @"BSSetupRecommend_OfferCreate") & 1) != 0 || v34)
    {
      uint64_t v55 = objc_msgSend_valueForKey_(self->_setupOptions, v35, @"kBSAutoGuessSetupOptionKey_NetworkName");
      uint64_t v57 = objc_msgSend_stringWithFormat_(NSString, v56, @"%@.Complete", v8);
      v51 = (void *)sub_22685D62C(v57, qword_268148378);
      if (v55) {
        return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v58, (uint64_t)v51, @"%@", 0, v55);
      }
    }
    else if ((objc_msgSend_isEqualToString_(v8, v35, @"BSSetupRecommend_OfferJoinNetwork") & 1) != 0 {
           || objc_msgSend_isEqualToString_(v8, v36, @"BSSetupRecommend_AskUserChooseNetworkToJoin"))
    }
    {
      uint64_t v37 = objc_msgSend_objectForKey_(a3, v36, @"kSetupBaseStationInfoKey_RadioInfo");
      uint64_t v38 = sub_22685D6E8(1918979693);
      uint64_t v16 = objc_msgSend_objectForKey_(v37, v39, v38);
      uint64_t v41 = objc_msgSend_objectForKey_(a3, v40, @"kSetupBaseStationInfoKey_BrowseRecord");
      int v42 = sub_22685AAD0(v41);
      uint64_t v43 = NSString;
      uint64_t v46 = objc_msgSend_integerValue(v13, v44, v45);
      uint64_t v47 = sub_22685D75C(v46, v42);
      uint64_t v49 = objc_msgSend_stringWithFormat_(v43, v48, @"%@.Complete%@", v8, v47);
      v51 = (void *)sub_22685D62C(v49, qword_268148378);
      if (v16)
      {
        v52 = NSString;
        return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v52, v50, (uint64_t)v51, @"%@", 0, v16);
      }
    }
    else
    {
      int v59 = objc_msgSend_isEqualToString_(v8, v36, @"BSSetupRecommend_OfferRestore");
      v60 = NSString;
      uint64_t v63 = objc_msgSend_integerValue(v13, v61, v62);
      int v71 = sub_22685AB68(v31, v64, v65, v66, v67, v68, v69, v70);
      v72 = sub_22685D75C(v63, v71);
      uint64_t v74 = objc_msgSend_stringWithFormat_(v60, v73, @"%@.Complete%@", v8, v72);
      v51 = (void *)sub_22685D62C(v74, qword_268148378);
      if (!v59 && v20) {
        return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v50, (uint64_t)v51, @"%@", 0, v20);
      }
      if (v16)
      {
        v52 = NSString;
        return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v52, v50, (uint64_t)v51, @"%@", 0, v16);
      }
    }
    return v51;
  }
}

- (BOOL)restoreNetworkIfNeeded:(BOOL)a3 disassociateIfNeeded:(BOOL)a4 forceQuit:(BOOL)a5
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) restoreNetworkIfNeeded:disassociateIfNeeded:forceQuit:]", 100, (uint64_t)"_lastAssociatedInfo: %@\n", a5, v5, v6, v7, (uint64_t)self->_lastAssociatedInfo);
  }
  uint64_t v11 = objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  int v14 = objc_msgSend_airPortIsOn(v11, v12, v13);
  if (v14)
  {
    int isCurrentlyAssociatedToAnInfrastructureNetwork = objc_msgSend_isCurrentlyAssociatedToAnInfrastructureNetwork_(v11, v15, 0);
    lastAssociatedInfo = self->_lastAssociatedInfo;
    if (lastAssociatedInfo)
    {
      unint64_t v26 = objc_msgSend_objectForKey_(lastAssociatedInfo, v16, @"SSID_STR");
      if (isCurrentlyAssociatedToAnInfrastructureNetwork)
      {
        uint64_t CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(v11, v20, v21);
        id v29 = (__CFString *)objc_msgSend_objectForKey_(CurrentAssociationInfo, v28, @"SSID_STR");
      }
      else
      {
        id v29 = &stru_26DA6BE88;
      }
      if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
        sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) restoreNetworkIfNeeded:disassociateIfNeeded:forceQuit:]", 100, (uint64_t)"curName: %@ oldName: %@\n", v22, v23, v24, v25, (uint64_t)v29);
      }
      char isEqualToString = objc_msgSend_isEqualToString_(v26, v20, (uint64_t)v29);
      if ((isEqualToString & 1) == 0 && !v8)
      {
        LOBYTE(v14) = objc_msgSend_startRestoreNetwork_(self, v16, (uint64_t)v26) == 0;
        return v14;
      }
      if (isEqualToString) {
        goto LABEL_11;
      }
    }
    else if (((v9 || v8) & isCurrentlyAssociatedToAnInfrastructureNetwork & 1) == 0)
    {
LABEL_11:
      LOBYTE(v14) = 0;
      return v14;
    }
    objc_msgSend_disassociateSync(v11, v16, v17);
    goto LABEL_11;
  }
  return v14;
}

- (int)startRestoreNetwork:(id)a3
{
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) startRestoreNetwork:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v26);
  }
  if (!a3) {
    return -6705;
  }
  BOOL v9 = objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)a3);
  uint64_t v11 = objc_msgSend_objectForKey_(self->_lastAssociatedInfo, v10, @"BSSID");
  if (v11 && (uint64_t v17 = objc_msgSend_scanInfoForMACAddress_(v9, v12, v11)) != 0
    || (uint64_t v17 = objc_msgSend_scanInfoForName_wifiType_(v9, v12, (uint64_t)a3, 3)) != 0)
  {
    char v27 = 0;
    if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
      sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) startRestoreNetwork:]", 100, (uint64_t)" restoring with scan info \n", v13, v14, v15, v16, v26);
    }
    int isEnterprise = objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, v12, v17, 0, &v27);
    uint64_t NetworkPassword = 0;
    if (!isEnterprise
      || v27
      || (uint64_t NetworkPassword = objc_msgSend_getNetworkPassword_(WiFiUtils, v19, v17, 0)) != 0)
    {
      int result = objc_msgSend_joinNetworkWithScanInfoAsync_password_rememberChoice_(v9, v19, v17, NetworkPassword, 1);
      if (result) {
        return result;
      }
      goto LABEL_24;
    }
    return -16;
  }
  else
  {
    if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
      sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) startRestoreNetwork:]", 100, (uint64_t)" restoring with name only \n", v13, v14, v15, v16, v26);
    }
    int result = objc_msgSend_joinNetworkWithNameAsync_password_rememberChoice_(v9, v12, (uint64_t)a3, 0, 1);
    if (!result)
    {
LABEL_24:
      uint64_t v24 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v22, v23);
      objc_msgSend_addObserver_selector_name_object_(v24, v25, (uint64_t)self, sel_restoreNetworkDone_, @"com.apple.WiFiUtils.Join.Complete", 0);
      return 0;
    }
  }
  return result;
}

- (void)restoreNetworkDone:(id)a3
{
  if (dword_2681462C8 <= 100 && (dword_2681462C8 != -1 || sub_226865630((uint64_t)&dword_2681462C8, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681462C8, (uint64_t)"-[AssistantUIController(Private) restoreNetworkDone:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v22);
  }
  BOOL v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, (uint64_t)a3);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, @"com.apple.WiFiUtils.Join.Complete", 0);
  uint64_t v13 = objc_msgSend_userInfo(a3, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKey_(v13, v14, @"WiFiUtils_OSStatus");
  if (v15) {
    objc_msgSend_integerValue(v15, v16, v17);
  }
  if (self->_state == 11 && self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    uint64_t v21 = objc_msgSend_assistantResult(self, v18, v19);
    MEMORY[0x270F9A6D0](delegate, sel_doneWithAssistantResult_, v21);
  }
}

@end