@interface StepByStepController
+ (id)stepByStepController;
- (NSDictionary)restoreRecommendation;
- (StepByStepController)init;
- (StepByStepUIDelegate)delegate;
- (int)cancelStepByStep;
- (int)resume;
- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4;
- (int)subclassAssistantCallback:(AssistantCallbackContext *)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setRestoreRecommendation:(id)a3;
- (void)stepByStepNextStepResult:(int)a3 withOptions:(id)a4;
@end

@implementation StepByStepController

- (StepByStepController)init
{
  v27.receiver = self;
  v27.super_class = (Class)StepByStepController;
  v2 = [(AssistantCallbackController *)&v27 init];
  v10 = (StepByStepController *)v2;
  if (v2)
  {
    v11 = (uint64_t *)(v2 + 32);
    sub_2268C72DC((uint64_t *)v2 + 4, v3, v4, v5, v6, v7, v8, v9);
    sub_2268CA24C(*v11, (uint64_t)sub_226879580, (uint64_t)v10, v12, v13, v14, v15, v16);
    uint64_t v17 = *v11;
    uint64_t v20 = objc_msgSend_assistantCallback(v10, v18, v19);
    sub_2268CA2FC(v17, v20, (uint64_t)v10, v21, v22, v23, v24, v25);
  }
  return v10;
}

- (void)dealloc
{
  objc_msgSend_setRestoreRecommendation_(self, a2, 0);
  sub_2268C742C((uint64_t)self->_stepByStepContext, v3, v4, v5, v6, v7, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)StepByStepController;
  [(AssistantCallbackController *)&v10 dealloc];
}

- (int)subclassAssistantCallback:(AssistantCallbackContext *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  if (!a3) {
    goto LABEL_16;
  }
  sub_2268DCEEC((uint64_t)a3, @"kBSAssistantCallbackKey_SBS_SBSStep", &v19, v3, v4, v5, v6, v7);
  int v12 = v11;
  if (v11) {
    goto LABEL_17;
  }
  if (!v19)
  {
LABEL_19:
    int v12 = -6728;
    goto LABEL_17;
  }
  uint64_t v13 = objc_msgSend_integerValue(v19, v10, (uint64_t)a3);
  uint64_t v14 = v13;
  if (v13 != 117)
  {
    if ((v13 - 1) <= 0xF)
    {
      sub_2268DCEEC((uint64_t)a3, @"kBSAssistantCallbackKey_SBS_SBSParamDict", &v18, v3, v4, v5, v6, v7);
      int v12 = v15;
      if (!v15)
      {
        if (v18)
        {
          if (dword_2681468A0 <= 100 && (dword_2681468A0 != -1 || sub_226865630((uint64_t)&dword_2681468A0, 0x64u))) {
            sub_226865EB4((uint64_t)&dword_2681468A0, (uint64_t)"-[StepByStepController subclassAssistantCallback:]", 100, (uint64_t)"step: %d paramDict: %@\n", v4, v5, v6, v7, v14);
          }
          if (self->super._callbackContext)
          {
            int v12 = -6721;
          }
          else
          {
            if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
            {
              self->super._callbackContext = a3;
              objc_msgSend_stepByStepNextStep_paramDict_(self->_delegate, v17, v14, v18);
              return 0;
            }
            int v12 = -6718;
          }
          goto LABEL_17;
        }
        goto LABEL_19;
      }
LABEL_17:
      sub_2268DD134(a3, v12, (uint64_t)a3, v3, v4, v5, v6, v7);
      return v12;
    }
LABEL_16:
    int v12 = -6705;
    goto LABEL_17;
  }
  if (!self->super._callbackContext)
  {
    int v12 = -6709;
    goto LABEL_17;
  }
  int v12 = 0;
  self->super._callbackContext = 0;
  return v12;
}

+ (id)stepByStepController
{
  v2 = objc_alloc_init(StepByStepController);

  return v2;
}

- (int)cancelStepByStep
{
  stepByStepContext = self->_stepByStepContext;
  if (!stepByStepContext) {
    return -6705;
  }
  int result = sub_2268C7558((uint64_t)stepByStepContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result == -6771) {
    int v11 = 0;
  }
  else {
    int v11 = result;
  }
  if (v11 == -6720) {
    return -6720;
  }
  if (!v11)
  {
    int result = 0;
    self->super._callbackContext = 0;
  }
  return result;
}

- (int)resume
{
  stepByStepContext = self->_stepByStepContext;
  if (stepByStepContext) {
    return sub_2268C75EC(stepByStepContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else {
    return -6705;
  }
}

- (void)stepByStepNextStepResult:(int)a3 withOptions:(id)a4
{
  callbackContext = self->super._callbackContext;
  if (callbackContext)
  {
    if (!a4
      || (int v11 = sub_2268DD050((uint64_t)callbackContext, @"kBSAssistantCallbackKey_SBS_SBSOptionsDict", (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7)) == 0)
    {
      int v11 = a3;
    }
    int v12 = self->super._callbackContext;
    if (v12) {
      sub_2268DD134(v12, v11, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
    }
  }
  self->super._callbackContext = 0;
}

- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4
{
  if (dword_2681468A0 <= 100 && (dword_2681468A0 != -1 || sub_226865630((uint64_t)&dword_2681468A0, 0x64u))) {
    sub_226865EB4((uint64_t)&dword_2681468A0, (uint64_t)"-[StepByStepController setupFromAutoguessRecommendation:withOptions:]", 100, (uint64_t)"\n", v4, v5, v6, v7, v37);
  }
  if (!self->_stepByStepContext) {
    return -6718;
  }
  if (!a3) {
    return -6705;
  }
  uint64_t v10 = objc_msgSend_objectForKey_(a3, a2, @"BSAutoGuess_UnconfiguredBase");
  if (!v10) {
    return -6727;
  }
  CFStringRef v12 = (const __CFString *)v10;
  uint64_t v13 = objc_msgSend_objectForKey_(a3, v11, @"BSAutoGuess_UnconfiguredBaseSettings");
  if (!v13) {
    return -6727;
  }
  int v15 = (const void *)v13;
  uint64_t v16 = (const void *)objc_msgSend_objectForKey_(a3, v14, @"BSAutoGuess_Recommendation");
  if (!v16) {
    return -6727;
  }
  int result = sub_2268CA3AC((uint64_t)self->_stepByStepContext, v16);
  if (!result)
  {
    restoreRecommendation = self->_restoreRecommendation;
    if (!restoreRecommendation
      || (int result = sub_2268CA404((uint64_t)self->_stepByStepContext, restoreRecommendation)) == 0)
    {
      uint64_t v20 = objc_msgSend_sharedInstance(WiFiUtils, (const char *)restoreRecommendation, v18);
      uint64_t v23 = objc_msgSend_mergedScanInfoArray(v20, v21, v22);
      if (!v23 || (int result = sub_2268CA45C((uint64_t)self->_stepByStepContext, v23, 1)) == 0)
      {
        int result = sub_2268CA660(self->_stepByStepContext, v12, v15, v24, v25, v26, v27, v28);
        if (!result)
        {
          stepByStepContext = self->_stepByStepContext;
          return sub_2268CA840(stepByStepContext, v29, v30, v31, v32, v33, v34, v35);
        }
      }
    }
  }
  return result;
}

- (StepByStepUIDelegate)delegate
{
  return (StepByStepUIDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (NSDictionary)restoreRecommendation
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRestoreRecommendation:(id)a3
{
}

@end