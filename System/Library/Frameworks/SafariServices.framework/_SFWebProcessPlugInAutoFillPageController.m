@interface _SFWebProcessPlugInAutoFillPageController
- (_SFFormMetadataController)formMetadataController;
- (_SFWebProcessPlugInAutoFillPageController)initWithPlugIn:(id)a3 contextController:(id)a4;
- (void)annotateForm:(int64_t)a3 inFrame:(id)a4 withValues:(id)a5;
- (void)autoFillForm:(int64_t)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5;
- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7;
- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 fieldsToObscure:(id)a8 submitForm:(BOOL)a9;
- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 submitForm:(BOOL)a8;
- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 selectFieldAfterFilling:(id)a6;
- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4;
- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5;
- (void)automaticPasswordSheetDimissedInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4;
- (void)clearAutoFillMetadata;
- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5;
- (void)collectFormMetadataForPageLevelAutoFillAtURL:(id)a3;
- (void)collectFormMetadataForPrefillingAtURL:(id)a3;
- (void)collectFormMetadataForTestingAtURL:(id)a3;
- (void)collectURLsForPrefillingAtURL:(id)a3;
- (void)diagnosticsFormMetadataWithCompletionHandler:(id)a3;
- (void)fillTextField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5;
- (void)focusFormForStreamlinedLogin:(int64_t)a3 inFrame:(id)a4;
- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 atURL:(id)a5 completionHandler:(id)a6;
- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5;
- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4;
- (void)runJavaScriptForActivity:(id)a3 withScript:(id)a4 object:(id)a5 invokeMethod:(id)a6 completionHandler:(id)a7;
- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5;
- (void)setFormControls:(id)a3 areAutoFilled:(BOOL)a4 andClearField:(id)a5 inFrame:(id)a6;
- (void)setFormMetadataController:(id)a3;
- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5;
- (void)substitutePasswordElementsWithAutomaticPasswordElementsInFrame:(id)a3 formID:(int64_t)a4 focusedPasswordControlUniqueID:(id)a5 passwordControlUniqueIDs:(id)a6 automaticPassword:(id)a7 blurAfterSubstitution:(BOOL)a8 completionHandler:(id)a9;
- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didRemoveFrameFromHierarchy:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didSameDocumentNavigation:(int64_t)a4 forFrame:(id)a5;
- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4;
- (void)willDestroyBrowserContextController:(id)a3;
@end

@implementation _SFWebProcessPlugInAutoFillPageController

- (void)setFormMetadataController:(id)a3
{
}

- (_SFWebProcessPlugInAutoFillPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFWebProcessPlugInAutoFillPageController;
  v7 = [(WBSWebProcessPlugInPageController *)&v18 initWithPlugIn:a3 contextController:v6];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC562C0];
    activityControllerInterface = v7->_activityControllerInterface;
    v7->_activityControllerInterface = (_WKRemoteObjectInterface *)v8;

    v10 = [v6 _remoteObjectRegistry];
    [v10 registerExportedObject:v7 interface:v7->_activityControllerInterface];

    v11 = [[_SFFormMetadataController alloc] initWithPageController:v7];
    formMetadataController = v7->_formMetadataController;
    v7->_formMetadataController = v11;

    uint64_t v13 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC56210];
    autoFillerInterface = v7->_autoFillerInterface;
    v7->_autoFillerInterface = (_WKRemoteObjectInterface *)v13;

    v15 = [v6 _remoteObjectRegistry];
    [v15 registerExportedObject:v7 interface:v7->_autoFillerInterface];

    v16 = v7;
  }

  return v7;
}

- (void)willDestroyBrowserContextController:(id)a3
{
  id v4 = a3;
  v5 = [v4 _remoteObjectRegistry];
  [v5 unregisterExportedObject:self interface:self->_autoFillerInterface];

  autoFillerInterface = self->_autoFillerInterface;
  self->_autoFillerInterface = 0;

  v7 = [v4 _remoteObjectRegistry];
  [v7 unregisterExportedObject:self interface:self->_activityControllerInterface];

  activityControllerInterface = self->_activityControllerInterface;
  self->_activityControllerInterface = 0;

  [(_SFFormMetadataController *)self->_formMetadataController invalidate];
  formMetadataController = self->_formMetadataController;
  self->_formMetadataController = 0;

  v10.receiver = self;
  v10.super_class = (Class)_SFWebProcessPlugInAutoFillPageController;
  [(WBSWebProcessPlugInPageController *)&v10 willDestroyBrowserContextController:v4];
}

- (void)runJavaScriptForActivity:(id)a3 withScript:(id)a4 object:(id)a5 invokeMethod:(id)a6 completionHandler:(id)a7
{
  id v29 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(id, void))a7;
  if (!self->_isolatedWorld)
  {
    v16 = [MEMORY[0x1E4F466E8] world];
    isolatedWorld = self->_isolatedWorld;
    self->_isolatedWorld = v16;

    [(WKWebProcessPlugInScriptWorld *)self->_isolatedWorld makeAllShadowRootsOpen];
  }
  objc_super v18 = [(WBSWebProcessPlugInPageController *)self mainFrame];
  v19 = [v18 jsContextForWorld:self->_isolatedWorld];

  if ([v29 isEqualToString:@"WebClipMetadataJS"])
  {
    v20 = +[_SFWebClipMetadataFetcher metadataFetcherScriptSource];
    id v21 = (id)[v19 evaluateScript:v20];
  }
  if ([v12 length]) {
    id v22 = (id)[v19 evaluateScript:v12];
  }
  v23 = [v19 globalObject];
  v24 = [v23 valueForProperty:v13];

  [(WKWebProcessPlugInScriptWorld *)self->_isolatedWorld clearWrappers];
  if (([v24 isUndefined] & 1) != 0
    || ([v24 valueForProperty:v14],
        v25 = objc_claimAutoreleasedReturnValue(),
        int v26 = [v25 isUndefined],
        v25,
        v26))
  {
    v15[2](v15, 0);
  }
  else
  {
    v27 = [v24 invokeMethod:v14 withArguments:0];
    v28 = [v27 toDictionary];
    ((void (**)(id, void *))v15)[2](v15, v28);
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4
{
  formMetadataController = self->_formMetadataController;
  id v5 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:a4];
  [(WBSFormMetadataController *)formMetadataController recursivelyClearMetadataForFrames:v5];
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didRemoveFrameFromHierarchy:(id)a4
{
  formMetadataController = self->_formMetadataController;
  id v5 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:a4];
  [(WBSFormMetadataController *)formMetadataController clearMetadataForFrame:v5];
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didSameDocumentNavigation:(int64_t)a4 forFrame:(id)a5
{
  id v10 = a5;
  id v8 = [a3 mainFrame];

  v9 = v10;
  if (v8 == v10)
  {
    [(_SFFormMetadataController *)self->_formMetadataController didSameDocumentNavigation:a4 inFrame:v10];
    v9 = v10;
  }
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 selectFieldAfterFilling:(id)a6
{
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7
{
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 submitForm:(BOOL)a8
{
  LOBYTE(v8) = a8;
  [(_SFWebProcessPlugInAutoFillPageController *)self autoFillFormAsynchronouslyInFrame:a3 withValues:a4 setAutoFilled:a5 focusFieldAfterFilling:a6 fieldToFocus:a7 fieldsToObscure:0 submitForm:v8];
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 fieldsToObscure:(id)a8 submitForm:(BOOL)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v21 = a4;
  id v15 = a7;
  id v16 = a8;
  v17 = [a3 frameHandle];
  if (v17)
  {
    objc_super v18 = [MEMORY[0x1E4F466D8] lookUpFrameFromHandle:v17];
    v19 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v18];

    LOBYTE(v20) = a9;
    [(_SFFormMetadataController *)self->_formMetadataController autoFillFormInFrame:v19 withValues:v21 fillSynchronously:0 setAutoFilled:v12 focusFieldAfterFilling:v11 fieldToFocus:v15 fieldsToObscure:v16 submitForm:v20];
  }
}

- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F466D8];
  id v7 = a4;
  uint64_t v8 = [a3 frameHandle];
  v9 = [v6 lookUpFrameFromHandle:v8];
  id v10 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v9];

  [(WBSFormMetadataController *)self->_formMetadataController autoFillFormSynchronouslyInFrame:v10 withValues:v7];
}

- (void)autoFillForm:(int64_t)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  id v13 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F466D8];
  v9 = [a4 frameHandle];
  id v10 = [v8 lookUpFrameFromHandle:v9];
  BOOL v11 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v10];

  id v12 = [(_SFFormMetadataController *)self->_formMetadataController fillForm:v11 inFrame:v13 withPassword:0 focusedFieldControlID:(double)a3];
}

- (void)annotateForm:(int64_t)a3 inFrame:(id)a4 withValues:(id)a5
{
  id v11 = a5;
  uint64_t v8 = [a4 frameHandle];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F466D8] lookUpFrameFromHandle:v8];
    id v10 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v9];

    [(WBSFormMetadataController *)self->_formMetadataController annotateForm:v10 inFrame:v11 withValues:(double)a3];
  }
}

- (void)fillTextField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F466D8];
  id v9 = a5;
  id v10 = a3;
  id v11 = [a4 frameHandle];
  id v12 = [v8 lookUpFrameFromHandle:v11];
  id v13 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v12];

  [(WBSFormMetadataController *)self->_formMetadataController fillField:v10 inFrame:v13 withGeneratedPassword:v9];
}

- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F466D8];
  id v9 = a4;
  id v10 = [a3 frameHandle];
  id v11 = [v8 lookUpFrameFromHandle:v10];
  id v12 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v11];

  [(WBSFormMetadataController *)self->_formMetadataController autoFillOneTimeCodeFieldsInFrame:v12 withValue:v9 shouldSubmit:v5];
}

- (void)focusFormForStreamlinedLogin:(int64_t)a3 inFrame:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F466D8];
  id v7 = [a4 frameHandle];
  uint64_t v8 = [v6 lookUpFrameFromHandle:v7];
  id v9 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v8];

  [(_SFFormMetadataController *)self->_formMetadataController focusFormForStreamlinedLogin:v9 inFrame:(double)a3];
}

- (void)setFormControls:(id)a3 areAutoFilled:(BOOL)a4 andClearField:(id)a5 inFrame:(id)a6
{
  BOOL v7 = a4;
  id v15 = a5;
  id v10 = (void *)MEMORY[0x1E4F466D8];
  id v11 = a3;
  id v12 = [a6 frameHandle];
  id v13 = [v10 lookUpFrameFromHandle:v12];
  id v14 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v13];

  [(WBSFormMetadataController *)self->_formMetadataController setFormControls:v11 inFrame:v14 asAutoFilled:v7];
  if (v15) {
    [(_SFFormMetadataController *)self->_formMetadataController clearField:v15 inFrame:v14];
  }
}

- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F466D8];
  id v9 = a5;
  id v10 = a3;
  id v11 = [a4 frameHandle];
  id v12 = [v8 lookUpFrameFromHandle:v11];
  id v13 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v12];

  [(WBSFormMetadataController *)self->_formMetadataController clearFieldsAndSetFormControlsToNotAutoFilled:v10 inFrame:v13 completionHandler:v9];
}

- (void)collectURLsForPrefillingAtURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  id v6 = [v5 mainFrame];
  BOOL v7 = [v6 URL];
  int v8 = [v7 isEqual:v4];

  if (v8)
  {
    formMetadataController = self->_formMetadataController;
    [(_SFFormMetadataController *)formMetadataController collectURLsForPreFilling];
  }
}

- (void)collectFormMetadataForTestingAtURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  id v6 = [v5 mainFrame];
  BOOL v7 = [v6 URL];
  int v8 = [v7 isEqual:v4];

  if (v8)
  {
    formMetadataController = self->_formMetadataController;
    [(_SFFormMetadataController *)formMetadataController collectFormMetadataForTesting];
  }
}

- (void)collectFormMetadataForPrefillingAtURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  id v6 = [v5 mainFrame];
  BOOL v7 = [v6 URL];
  int v8 = [v7 isEqual:v4];

  if (v8)
  {
    formMetadataController = self->_formMetadataController;
    [(_SFFormMetadataController *)formMetadataController collectFormMetadataForPreFilling];
  }
}

- (void)collectFormMetadataForPageLevelAutoFillAtURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  id v6 = [v5 mainFrame];
  BOOL v7 = [v6 URL];
  int v8 = [v7 isEqual:v4];

  if (v8)
  {
    formMetadataController = self->_formMetadataController;
    [(_SFFormMetadataController *)formMetadataController collectFormMetadataForPageLevelAutoFill];
  }
}

- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 atURL:(id)a5 completionHandler:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  id v14 = [v13 mainFrame];
  id v15 = [v14 URL];
  int v16 = [v15 isEqual:v12];

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4F466D8];
    objc_super v18 = [v10 frameHandle];
    v19 = [v17 lookUpFrameFromHandle:v18];
    uint64_t v20 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v19];

    [(WBSFormMetadataController *)self->_formMetadataController getMetadataForTextField:v21 inFrame:v20 completionHandler:v11];
  }
}

- (void)clearAutoFillMetadata
{
  formMetadataController = self->_formMetadataController;
  id v5 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  v3 = [v5 mainFrame];
  id v4 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v3];
  [(WBSFormMetadataController *)formMetadataController recursivelyClearMetadataForFrames:v4];
}

- (void)substitutePasswordElementsWithAutomaticPasswordElementsInFrame:(id)a3 formID:(int64_t)a4 focusedPasswordControlUniqueID:(id)a5 passwordControlUniqueIDs:(id)a6 automaticPassword:(id)a7 blurAfterSubstitution:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  int v16 = (void *)MEMORY[0x1E4F466D8];
  v17 = (void (**)(id, void *))a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = [a3 frameHandle];
  id v22 = [v16 lookUpFrameFromHandle:v21];
  id v24 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v22];

  v23 = [(WBSFormMetadataController *)self->_formMetadataController substitutePasswordElementsWithAutomaticPasswordElementsInFrame:v24 formID:v20 focusedPasswordControlUniqueID:v19 passwordControlUniqueIDs:v18 automaticPassword:v9 blurAfterSubstitution:(double)a4];

  v17[2](v17, v23);
}

- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5
{
  int v8 = (void *)MEMORY[0x1E4F466D8];
  id v9 = a5;
  id v10 = a4;
  id v11 = [a3 frameHandle];
  id v12 = [v8 lookUpFrameFromHandle:v11];
  id v13 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v12];

  [(_SFFormMetadataController *)self->_formMetadataController removeAutomaticPasswordElementsInFrame:v13 focusedPasswordControlUniqueID:v10 passwordControlUniqueIDs:v9 blurAfterRemoval:0];
}

- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F466D8];
  id v7 = a4;
  int v8 = [a3 frameHandle];
  id v9 = [v6 lookUpFrameFromHandle:v8];
  id v10 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v9];

  [(_SFFormMetadataController *)self->_formMetadataController removeAutomaticPasswordVisualTreatmentInFrame:v10 passwordControlUniqueIDs:v7];
}

- (void)automaticPasswordSheetDimissedInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F466D8];
  id v7 = a4;
  int v8 = [a3 frameHandle];
  id v9 = [v6 lookUpFrameFromHandle:v8];
  id v10 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v9];

  [(WBSFormMetadataController *)self->_formMetadataController automaticPasswordSheetDimissedInFrame:v10 focusedPasswordControlUniqueID:v7];
}

- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5
{
  BOOL v6 = a3;
  int v8 = (void *)MEMORY[0x1E4F466D8];
  id v9 = a5;
  id v10 = [a4 frameHandle];
  id v11 = [v8 lookUpFrameFromHandle:v10];
  id v12 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v11];

  [(_SFFormMetadataController *)self->_formMetadataController setStrongPasswordElementViewableIfAppropriate:v6 frame:v12 passwordControlUniqueIDs:v9];
}

- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5
{
  BOOL v6 = a3;
  int v8 = (void *)MEMORY[0x1E4F466D8];
  id v9 = a4;
  id v10 = [a5 frameHandle];
  id v11 = [v8 lookUpFrameFromHandle:v10];
  id v12 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:v11];

  [(WBSFormMetadataController *)self->_formMetadataController setAutoFillSpinnerVisibility:v6 textFieldMetadata:v9 frame:v12];
}

- (void)diagnosticsFormMetadataWithCompletionHandler:(id)a3
{
  formMetadataController = self->_formMetadataController;
  id v5 = a3;
  id v6 = [(_SFFormMetadataController *)formMetadataController diagnosticsFormMetadata];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (_SFFormMetadataController)formMetadataController
{
  return self->_formMetadataController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formMetadataController, 0);
  objc_storeStrong((id *)&self->_isolatedWorld, 0);
  objc_storeStrong((id *)&self->_autoFillerInterface, 0);

  objc_storeStrong((id *)&self->_activityControllerInterface, 0);
}

@end