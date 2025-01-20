@interface _SFFormMetadataController
- (BOOL)_formContainsAutoFilledElements:(id)a3;
- (BOOL)_webProcessPlugInBrowserContextControllerShouldNotifyOnFormChanges:(id)a3;
- (BOOL)shouldIncludeNonEmptyFields;
- (NSArray)diagnosticsFormMetadata;
- (WKWebProcessPlugInScriptWorld)scriptWorld;
- (_SFFormMetadataController)initWithPageController:(id)a3;
- (id)_assistedNodeMetadataWithPasswordField:(id)a3 passwordFieldMetadata:(id)a4 formMetadata:(id)a5 inFrame:(id)a6;
- (id)_observer;
- (id)_webProcessPlugInBrowserContextController:(id)a3 willBeginInputSessionForElement:(id)a4 inFrame:(id)a5 userIsInteracting:(BOOL)a6;
- (id)_webProcessPlugInBrowserContextController:(id)a3 willSubmitForm:(id)a4 toFrame:(id)a5 fromFrame:(id)a6 withValues:(id)a7;
- (id)fillForm:(double)a3 inFrame:(id)a4 withPassword:(id)a5 focusedFieldControlID:(id)a6;
- (id)formAutoFillNodeForJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4;
- (void)_checkSearchURLTemplateStringInFrame:(id)a3 autoFillFrame:(id)a4 autoFillNode:(id)a5 controller:(id)a6;
- (void)_collectFormMetadataForPreFilling:(BOOL)a3;
- (void)_collectFormMetadataWithRequestType:(unint64_t)a3 ignoreAutoFilledForms:(BOOL)a4 completionHandler:(id)a5;
- (void)_webProcessPlugInBrowserContextController:(id)a3 textDidChangeInTextField:(id)a4 inFrame:(id)a5 initiatedByUserTyping:(BOOL)a6;
- (void)_webProcessPlugInBrowserContextController:(id)a3 willSendSubmitEventToForm:(id)a4 inFrame:(id)a5 targetFrame:(id)a6 values:(id)a7;
- (void)_willNavigateFrameWithUnsubmittedForm:(id)a3;
- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 fieldsToObscure:(id)a9 submitForm:(BOOL)a10;
- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 selectFieldAfterFilling:(id)a7;
- (void)autoFilledField:(id)a3 inForm:(id)a4 inFrame:(id)a5;
- (void)clearField:(id)a3 inFrame:(id)a4;
- (void)clearScriptWorld;
- (void)collectFormMetadataForPageLevelAutoFill;
- (void)collectFormMetadataForPreFilling;
- (void)collectFormMetadataForTesting;
- (void)collectURLsForPreFilling;
- (void)dealloc;
- (void)didSameDocumentNavigation:(int64_t)a3 inFrame:(id)a4;
- (void)didStartProvisionalLoadForFrame:(id)a3;
- (void)finishedAutoFillingForm:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5;
- (void)finishedAutoFillingOneTimeCode:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5;
- (void)focusFormForStreamlinedLogin:(double)a3 inFrame:(id)a4;
- (void)invalidate;
- (void)passwordFieldFocused:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6 isPasswordFieldForUserCredentials:(BOOL)a7;
- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5 blurAfterRemoval:(BOOL)a6;
- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4;
- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5;
- (void)usernameFieldFocused:(id)a3 fieldMetadata:(id)a4 inForm:(id)a5 inFrame:(id)a6;
@end

@implementation _SFFormMetadataController

- (void)dealloc
{
  [(_SFFormMetadataController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SFFormMetadataController;
  [(_SFFormMetadataController *)&v3 dealloc];
}

- (void)invalidate
{
  id v3 = objc_storeWeak((id *)&self->_pageController, 0);
  v4 = [0 browserContextController];
  [v4 _setFormDelegate:0];

  observer = self->_observer;
  self->_observer = 0;
}

- (_SFFormMetadataController)initWithPageController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFFormMetadataController;
  v5 = [(WBSFormMetadataController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pageController, v4);
    v7 = [v4 browserContextController];
    [v7 _setFormDelegate:v6];

    v8 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDidChangeEventCoalescer, 0);
  objc_storeStrong((id *)&self->_unsubmittedFormFrame, 0);
  objc_storeStrong((id *)&self->_unsubmittedForm, 0);
  objc_storeStrong((id *)&self->_assistedNodeMetadata, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_destroyWeak((id *)&self->_pageController);

  objc_storeStrong((id *)&self->_scriptWorld, 0);
}

- (WKWebProcessPlugInScriptWorld)scriptWorld
{
  scriptWorld = self->_scriptWorld;
  if (!scriptWorld)
  {
    id v4 = [MEMORY[0x1E4F466E8] world];
    v5 = self->_scriptWorld;
    self->_scriptWorld = v4;

    [(WKWebProcessPlugInScriptWorld *)self->_scriptWorld makeAllShadowRootsOpen];
    [(WKWebProcessPlugInScriptWorld *)self->_scriptWorld disableOverrideBuiltinsBehavior];
    scriptWorld = self->_scriptWorld;
  }

  return scriptWorld;
}

- (void)collectURLsForPreFilling
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  id v4 = [WeakRetained mainFrame];

  addURLsInFrameTreeToArray(v4, v8);
  v5 = [(_SFFormMetadataController *)self _observer];
  v6 = [v4 URL];
  v7 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:v4];
  [v5 didCollectURLsForPreFilling:v8 atURL:v6 inFrame:v7];
}

- (BOOL)_formContainsAutoFilledElements:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a3, "controls", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isAutoFilledTextField])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)collectFormMetadataForTesting
{
}

- (void)collectFormMetadataForPreFilling
{
}

- (void)collectFormMetadataForPageLevelAutoFill
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68___SFFormMetadataController_collectFormMetadataForPageLevelAutoFill__block_invoke;
  v2[3] = &unk_1E5C73A30;
  v2[4] = self;
  [(_SFFormMetadataController *)self _collectFormMetadataWithRequestType:0 ignoreAutoFilledForms:0 completionHandler:v2];
}

- (NSArray)diagnosticsFormMetadata
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  uint64_t v4 = [WeakRetained browserContextController];
  uint64_t v5 = [v4 mainFrame];
  v6 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v5];

  id v9 = 0;
  [(WBSFormMetadataController *)self getMetadataForAllFormsInPageWithMainFrame:v6 requestType:4 frames:0 formMetadata:&v9];
  id v7 = v9;

  return (NSArray *)v7;
}

- (void)_collectFormMetadataForPreFilling:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  BOOL shouldListenForFormChanges = self->_shouldListenForFormChanges;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63___SFFormMetadataController__collectFormMetadataForPreFilling___block_invoke;
  v5[3] = &unk_1E5C73A30;
  v5[4] = self;
  [(_SFFormMetadataController *)self _collectFormMetadataWithRequestType:v3 ignoreAutoFilledForms:shouldListenForFormChanges completionHandler:v5];
}

- (void)_collectFormMetadataWithRequestType:(unint64_t)a3 ignoreAutoFilledForms:(BOOL)a4 completionHandler:(id)a5
{
  p_pageController = &self->_pageController;
  id v9 = (void (**)(id, id))a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_pageController);
  long long v11 = [WeakRetained browserContextController];
  v12 = [v11 mainFrame];
  uint64_t v13 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v12];
  id v24 = 0;
  id v25 = 0;
  [(WBSFormMetadataController *)self getMetadataForAllFormsInPageWithMainFrame:v13 requestType:a3 frames:&v25 formMetadata:&v24];
  id v14 = v25;
  id v15 = v24;

  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105___SFFormMetadataController__collectFormMetadataWithRequestType_ignoreAutoFilledForms_completionHandler___block_invoke;
  v19[3] = &unk_1E5C73A58;
  id v20 = v16;
  id v21 = v15;
  BOOL v23 = a4;
  v22 = self;
  id v17 = v15;
  id v18 = v16;
  [v14 enumerateObjectsUsingBlock:v19];
  v9[2](v9, v18);
}

- (void)clearScriptWorld
{
  scriptWorld = self->_scriptWorld;
  if (scriptWorld)
  {
    [(WKWebProcessPlugInScriptWorld *)scriptWorld clearWrappers];
    uint64_t v4 = self->_scriptWorld;
    self->_scriptWorld = 0;
  }
}

- (id)formAutoFillNodeForJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4
{
  uint64_t v4 = [[SFFormAutoFillNode alloc] initWithJSWrapper:a3 inContext:a4];

  return v4;
}

- (void)usernameFieldFocused:(id)a3 fieldMetadata:(id)a4 inForm:(id)a5 inFrame:(id)a6
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  long long v11 = [a6 plugInFrame];
  v18[0] = @"usernameField";
  v12 = [v10 serializedData];

  v19[0] = v12;
  v18[1] = @"form";
  uint64_t v13 = [v9 serializedData];

  v19[1] = v13;
  v18[2] = @"frame";
  id v14 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:v11];
  id v15 = [(SFFormAutoFillFrameHandle *)v14 serializedData];
  v19[2] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  assistedNodeMetadata = self->_assistedNodeMetadata;
  self->_assistedNodeMetadata = v16;
}

- (void)passwordFieldFocused:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6 isPasswordFieldForUserCredentials:(BOOL)a7
{
  if (a7)
  {
    long long v8 = [(_SFFormMetadataController *)self _assistedNodeMetadataWithPasswordField:a3 passwordFieldMetadata:a5 formMetadata:a6 inFrame:a4];
    assistedNodeMetadata = self->_assistedNodeMetadata;
    self->_assistedNodeMetadata = v8;
  }
}

- (id)_assistedNodeMetadataWithPasswordField:(id)a3 passwordFieldMetadata:(id)a4 formMetadata:(id)a5 inFrame:(id)a6
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [a6 plugInFrame];
  v23[0] = @"passwordField";
  uint64_t v13 = [v10 serializedData];

  v24[0] = v13;
  v23[1] = @"form";
  id v14 = [v9 serializedData];

  v24[1] = v14;
  v23[2] = @"frame";
  id v15 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:v12];
  v16 = [(SFFormAutoFillFrameHandle *)v15 serializedData];
  v24[2] = v16;
  v23[3] = @"autoFillButtonType";
  id v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "htmlInputElementAutoFillButtonType"));
  v24[3] = v17;
  v23[4] = @"lastAutoFillButtonType";
  id v18 = NSNumber;
  uint64_t v19 = [v11 htmlInputElementLastAutoFillButtonType];

  id v20 = [v18 numberWithInteger:v19];
  v24[4] = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];

  return v21;
}

- (id)_observer
{
  observer = self->_observer;
  if (!observer)
  {
    uint64_t v4 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC30EB8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
    v6 = [WeakRetained browserContextController];
    id v7 = [v6 _remoteObjectRegistry];
    long long v8 = [v7 remoteObjectProxyWithInterface:v4];
    id v9 = self->_observer;
    self->_observer = v8;

    observer = self->_observer;
  }

  return observer;
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 selectFieldAfterFilling:(id)a7
{
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 fieldsToObscure:(id)a9 submitForm:(BOOL)a10
{
  self->_autoFillInProgress = 1;
  v11.receiver = self;
  v11.super_class = (Class)_SFFormMetadataController;
  [(WBSFormMetadataController *)&v11 autoFillFormInFrame:a3 withValues:a4 fillSynchronously:a5 setAutoFilled:a6 focusFieldAfterFilling:a7 fieldToFocus:a8 fieldsToObscure:a9 submitForm:a10];
}

- (id)fillForm:(double)a3 inFrame:(id)a4 withPassword:(id)a5 focusedFieldControlID:(id)a6
{
  v21.receiver = self;
  v21.super_class = (Class)_SFFormMetadataController;
  id v10 = a4;
  objc_super v11 = [(WBSFormMetadataController *)&v21 fillForm:v10 inFrame:a5 withPassword:a6 focusedFieldControlID:a3];
  v12 = -[WBSFormMetadataController formElementWithFormID:inFrame:](self, "formElementWithFormID:inFrame:", v10, a3, v21.receiver, v21.super_class);
  uint64_t v13 = [(WBSFormMetadataController *)self metadataForForm:v12 inFrame:v10 requestType:0];
  unsubmittedForm = self->_unsubmittedForm;
  self->_unsubmittedForm = v13;

  id v15 = [v10 plugInFrame];

  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = v15;

  id v17 = [(_SFFormMetadataController *)self _observer];
  id v18 = self->_unsubmittedForm;
  uint64_t v19 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:self->_unsubmittedFormFrame];
  [v17 didFillGeneratedPasswordInForm:v18 inFrame:v19];

  return v11;
}

- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5 blurAfterRemoval:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(WBSFormMetadataController *)self autoFillFrameIsValid:v10])
  {
    v24.receiver = self;
    v24.super_class = (Class)_SFFormMetadataController;
    [(WBSFormMetadataController *)&v24 removeAutomaticPasswordElementsInFrame:v10 focusedPasswordControlUniqueID:v11 passwordControlUniqueIDs:v12 blurAfterRemoval:v6];
    uint64_t v13 = [(WBSFormMetadataController *)self formAutoFillNodeForField:v11 inFrame:v10];
    id v22 = 0;
    id v23 = 0;
    [(WBSFormMetadataController *)self getMetadataForTextField:v13 inFrame:v10 textFieldMetadata:&v23 formMetadata:&v22 requestType:3];
    id v14 = v23;
    id v15 = v22;
    id v16 = v22;
    id v17 = [v10 plugInFrame];
    objc_storeStrong((id *)&self->_unsubmittedForm, v15);
    if (v16) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
    objc_storeStrong((id *)&self->_unsubmittedFormFrame, v18);
    uint64_t v19 = 0;
    if (v13 && v14 && v16)
    {
      uint64_t v19 = [(_SFFormMetadataController *)self _assistedNodeMetadataWithPasswordField:v13 passwordFieldMetadata:v14 formMetadata:v16 inFrame:v10];
    }
    id v20 = [(_SFFormMetadataController *)self _observer];
    objc_super v21 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:v17];
    [v20 didRemoveAutomaticStrongPasswordInForm:v16 inputSessionUserObject:v19 inFrame:v21];
  }
}

- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WBSFormMetadataController *)self autoFillFrameIsValid:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFFormMetadataController;
    [(WBSFormMetadataController *)&v8 removeAutomaticPasswordVisualTreatmentInFrame:v6 passwordControlUniqueIDs:v7];
  }
}

- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(WBSFormMetadataController *)self autoFillFrameIsValid:v8])
  {
    v10.receiver = self;
    v10.super_class = (Class)_SFFormMetadataController;
    [(WBSFormMetadataController *)&v10 setStrongPasswordElementViewableIfAppropriate:v6 frame:v8 passwordControlUniqueIDs:v9];
  }
}

- (void)clearField:(id)a3 inFrame:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_SFFormMetadataController;
  id v7 = a3;
  [(WBSFormMetadataController *)&v20 clearField:v7 inFrame:v6];
  id v8 = [(WBSFormMetadataController *)self formAutoFillNodeForField:v7 inFrame:v6];

  id v18 = 0;
  id v19 = 0;
  [(WBSFormMetadataController *)self getMetadataForTextField:v8 inFrame:v6 textFieldMetadata:&v19 formMetadata:&v18 requestType:3];
  id v9 = v19;
  id v10 = v18;
  id v11 = v18;

  p_unsubmittedForm = &self->_unsubmittedForm;
  objc_storeStrong((id *)&self->_unsubmittedForm, v10);
  if (v11)
  {
    uint64_t v13 = [v6 plugInFrame];
  }
  else
  {
    uint64_t v13 = 0;
  }
  p_unsubmittedFormFrame = &self->_unsubmittedFormFrame;
  objc_storeStrong((id *)&self->_unsubmittedFormFrame, v13);
  if (v11) {

  }
  id v15 = [(_SFFormMetadataController *)self _observer];
  id v16 = *p_unsubmittedForm;
  id v17 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:*p_unsubmittedFormFrame];
  [v15 didUpdateUnsubmittedForm:v16 inFrame:v17];
}

- (void)autoFilledField:(id)a3 inForm:(id)a4 inFrame:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 type];
  if (v8 <= 5 && ((1 << v8) & 0x3A) != 0)
  {
    id v10 = [(_SFFormMetadataController *)self _observer];
    [v10 autoFilledField:v11 inForm:v7];
  }
}

- (void)finishedAutoFillingForm:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v9 = [a4 plugInFrame];
  objc_storeStrong((id *)&self->_unsubmittedForm, a3);
  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = v9;
  id v11 = v9;

  self->_autoFillInProgress = 0;
  id v12 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:v11];
  uint64_t v13 = [(_SFFormMetadataController *)self _observer];
  [v13 didUpdateUnsubmittedForm:self->_unsubmittedForm inFrame:v12];

  if ([v15 type] == 3
    || [v15 type] == 5
    || [v15 type] == 1
    || [v15 type] == 4)
  {
    id v14 = [(_SFFormMetadataController *)self _observer];
    [v14 autoFillDidFinishWithUpdatedFormMetadata:v15 inFrame:v12 shouldSubmit:v5];
  }
}

- (void)finishedAutoFillingOneTimeCode:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = [(_SFFormMetadataController *)self _observer];
  [v6 didFillOneTimeCodeAndShouldSubmit:v5];
}

- (void)focusFormForStreamlinedLogin:(double)a3 inFrame:(id)a4
{
  self->_focusingFormForStreamlinedLogin = 1;
  v5.receiver = self;
  v5.super_class = (Class)_SFFormMetadataController;
  [(WBSFormMetadataController *)&v5 focusFormForStreamlinedLogin:a4 inFrame:a3];
  self->_focusingFormForStreamlinedLogin = 0;
}

- (void)_willNavigateFrameWithUnsubmittedForm:(id)a3
{
  id v4 = a3;
  if (self->_unsubmittedForm)
  {
    id v10 = v4;
    int IsDescendantOfFrame = frameIsDescendantOfFrame(self->_unsubmittedFormFrame, v4);
    id v4 = v10;
    if (IsDescendantOfFrame)
    {
      id v6 = [(_SFFormMetadataController *)self _observer];
      id v7 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:self->_unsubmittedFormFrame];
      [v6 willNavigateFrame:v7 withUnsubmittedForm:self->_unsubmittedForm];

      unsubmittedForm = self->_unsubmittedForm;
      self->_unsubmittedForm = 0;

      unsubmittedFormFrame = self->_unsubmittedFormFrame;
      self->_unsubmittedFormFrame = 0;

      id v4 = v10;
    }
  }
}

- (void)didStartProvisionalLoadForFrame:(id)a3
{
  p_pageController = &self->_pageController;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pageController);
  id v6 = [WeakRetained mainFrame];

  if (v6 == v7) {
    self->_BOOL shouldListenForFormChanges = 0;
  }
  [(_SFFormMetadataController *)self _willNavigateFrameWithUnsubmittedForm:v7];
}

- (void)didSameDocumentNavigation:(int64_t)a3 inFrame:(id)a4
{
  if (a3) {
    [(_SFFormMetadataController *)self _willNavigateFrameWithUnsubmittedForm:a4];
  }
}

- (BOOL)shouldIncludeNonEmptyFields
{
  return 1;
}

- (void)_checkSearchURLTemplateStringInFrame:(id)a3 autoFillFrame:(id)a4 autoFillNode:(id)a5 controller:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    [(WBSFormMetadataController *)self visibleNonEmptyTextFieldsInForm:a5 inFrame:v11];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    id v15 = v13;
    if (v14)
    {
      uint64_t v16 = v14;
      id v15 = 0;
      uint64_t v17 = *(void *)v23;
      while (2)
      {
        uint64_t v18 = 0;
        id v19 = v15;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v13);
          }
          objc_super v20 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
          char v21 = objc_msgSend(v20, "isHTMLInputElementUserEdited", (void)v22);
          if (v19 && (v21 & 1) != 0)
          {
            id v15 = v13;
LABEL_15:

            goto LABEL_16;
          }
          id v15 = v20;

          ++v18;
          id v19 = v15;
        }
        while (v16 != v18);
        uint64_t v16 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16) {
          continue;
        }
        break;
      }

      if (v15)
      {
        id v19 = [(WBSFormMetadataController *)self formSubmissionURLStringForSearchTextField:v15 inFrame:v11 useStrictDetection:1];
        if (v19) {
          [(_SFFormMetadataController *)self didFindSearchURLTemplateString:v19 inFrame:v10 pageController:v12];
        }
        goto LABEL_15;
      }
    }
    else
    {
LABEL_16:
    }
  }
}

- (void)_webProcessPlugInBrowserContextController:(id)a3 textDidChangeInTextField:(id)a4 inFrame:(id)a5 initiatedByUserTyping:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!self->_textDidChangeEventCoalescer)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F989B8]);
    id v13 = (WBSBlockCoalescer *)[v12 initWithMinimumTimeIntervalBeforeExecution:MEMORY[0x1E4F14428] queue:0.1];
    textDidChangeEventCoalescer = self->_textDidChangeEventCoalescer;
    self->_textDidChangeEventCoalescer = v13;
  }
  objc_initWeak(&location, self);
  id v15 = self->_textDidChangeEventCoalescer;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __126___SFFormMetadataController__webProcessPlugInBrowserContextController_textDidChangeInTextField_inFrame_initiatedByUserTyping___block_invoke;
  void v18[3] = &unk_1E5C72808;
  objc_copyWeak(&v21, &location);
  id v16 = v10;
  id v19 = v16;
  id v17 = v11;
  id v20 = v17;
  [(WBSBlockCoalescer *)v15 scheduleBlock:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (id)_webProcessPlugInBrowserContextController:(id)a3 willBeginInputSessionForElement:(id)a4 inFrame:(id)a5 userIsInteracting:(BOOL)a6
{
  BOOL v6 = a6;
  v36[3] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = self->_autoFillInProgress || self->_focusingFormForStreamlinedLogin;
  if (([v9 isTextField] & 1) == 0 && !objc_msgSend(v9, "isSelectElement")) {
    goto LABEL_17;
  }
  if (v11 || v6) {
    goto LABEL_9;
  }
  if (GSEventIsHardwareKeyboardAttached()) {
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  id v13 = [WeakRetained webProcessPlugIn];
  uint64_t v14 = [v13 plugInController];
  id v15 = [v14 parameters];
  id v16 = [v15 valueForKey:@"launchedToTest"];
  int v17 = [v16 BOOLValue];

  if (v17)
  {
LABEL_9:
    uint64_t v18 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v10];
    id v19 = +[SFFormAutoFillNode autoFillNodeWithNodeHandle:v9];
    id v33 = 0;
    id v34 = 0;
    [(WBSFormMetadataController *)self getMetadataForTextField:v19 inFrame:v18 textFieldMetadata:&v34 formMetadata:&v33 requestType:0];
    id v20 = v34;
    id v21 = v33;
    [(WBSFormMetadataController *)self textFieldFocused:v19 inFrame:v18 textFieldMetadata:v20 formMetadata:v21];
    long long v22 = self->_assistedNodeMetadata;
    assistedNodeMetadata = self->_assistedNodeMetadata;
    self->_assistedNodeMetadata = 0;

    if (v22) {
      BOOL v24 = 1;
    }
    else {
      BOOL v24 = v21 == 0;
    }
    if (!v24)
    {
      v35[0] = @"textField";
      v31 = [v20 serializedData];
      v36[0] = v31;
      v35[1] = @"form";
      [v21 serializedData];
      id v32 = v9;
      v26 = id v25 = v10;
      v36[1] = v26;
      v35[2] = @"frame";
      uint64_t v27 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:v25];
      v28 = [(SFFormAutoFillFrameHandle *)v27 serializedData];
      v36[2] = v28;
      long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

      id v10 = v25;
      id v9 = v32;
    }
    if (self->_focusingFormForStreamlinedLogin)
    {
      v29 = (NSDictionary *)[(NSDictionary *)v22 mutableCopy];
      [(NSDictionary *)v29 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"focusingForStreamlinedLogin"];

      long long v22 = v29;
    }
  }
  else
  {
LABEL_17:
    long long v22 = 0;
  }

  return v22;
}

- (void)_webProcessPlugInBrowserContextController:(id)a3 willSendSubmitEventToForm:(id)a4 inFrame:(id)a5 targetFrame:(id)a6 values:(id)a7
{
  id v9 = (WKWebProcessPlugInFrame *)a5;
  id v10 = a4;
  id v19 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v9];
  BOOL v11 = +[SFFormAutoFillNode autoFillNodeWithNodeHandle:v10];

  [(WBSFormMetadataController *)self willSendSubmitEventForForm:v11 inFrame:v19];
  id v12 = [(WBSFormMetadataController *)self metadataForForm:v11 inFrame:v19 requestType:0];
  unsubmittedForm = self->_unsubmittedForm;
  self->_unsubmittedForm = v12;

  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = v9;
  id v15 = v9;

  id v16 = [(_SFFormMetadataController *)self _observer];
  int v17 = self->_unsubmittedForm;
  uint64_t v18 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:self->_unsubmittedFormFrame];
  [v16 didUpdateUnsubmittedForm:v17 inFrame:v18];
}

- (id)_webProcessPlugInBrowserContextController:(id)a3 willSubmitForm:(id)a4 toFrame:(id)a5 fromFrame:(id)a6 withValues:(id)a7
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  id v15 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v13];
  id v16 = +[SFFormAutoFillNode autoFillNodeWithNodeHandle:v14];

  int v17 = [(WBSFormMetadataController *)self metadataForForm:v16 inFrame:v15 requestType:0 addUserEditedStateForUserNameAndPasswordFields:1];
  if (v17)
  {
    [(WBSFormMetadataController *)self willSubmitForm:v16 inFrame:v15];
    v34[0] = @"form";
    uint64_t v18 = [v17 serializedData];
    v34[1] = @"frame";
    v35[0] = v18;
    id v19 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:v13];
    id v33 = v15;
    id v20 = v17;
    id v21 = v13;
    id v22 = v11;
    id v23 = v12;
    BOOL v24 = v19;
    id v25 = [(SFFormAutoFillFrameHandle *)v19 serializedData];
    v35[1] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

    id v12 = v23;
    id v11 = v22;
    id v13 = v21;
    int v17 = v20;
    id v15 = v33;
  }
  else
  {
    unsubmittedForm = self->_unsubmittedForm;
    self->_unsubmittedForm = 0;

    unsubmittedFormFrame = self->_unsubmittedFormFrame;
    self->_unsubmittedFormFrame = 0;

    v29 = [(_SFFormMetadataController *)self _observer];
    [v29 didUpdateUnsubmittedForm:0 inFrame:0];

    [(WBSFormMetadataController *)self willSubmitForm:v16 inFrame:v15];
    v26 = 0;
  }
  id v30 = [v11 mainFrame];

  if (v30 == v13)
  {
    v31 = [(WBSFormMetadataController *)self visibleNonEmptyTextFieldsInForm:v16 inFrame:v15];
    if ([v31 count]) {
      [(_SFFormMetadataController *)self _checkSearchURLTemplateStringInFrame:v12 autoFillFrame:v15 autoFillNode:v16 controller:v11];
    }
  }

  return v26;
}

- (BOOL)_webProcessPlugInBrowserContextControllerShouldNotifyOnFormChanges:(id)a3
{
  return self->_shouldListenForFormChanges;
}

@end