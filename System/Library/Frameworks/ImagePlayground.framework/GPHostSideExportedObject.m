@interface GPHostSideExportedObject
- (void)editorDidCancelWithRequiresShowingGrid:(BOOL)a3;
- (void)editorDidChangeCanStartUpscaling:(BOOL)a3;
- (void)editorDidChangeHasSignificantEdits:(BOOL)a3;
- (void)editorDidGenerateAssets:(id)a3;
- (void)pickerDidCancel;
- (void)pickerDidSelectAssets:(id)a3;
- (void)pickerWantsToStartCreationWithIsTransitionSupported:(BOOL)a3 replyHandler:(id)a4;
- (void)pickerWillStartCreation;
@end

@implementation GPHostSideExportedObject

- (void)pickerDidSelectAssets:(id)a3
{
}

- (void)pickerDidCancel
{
}

- (void)pickerWantsToStartCreationWithIsTransitionSupported:(BOOL)a3 replyHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  sub_243FB287C(a3, (uint64_t)sub_243FB8B14, v6);
  swift_release();

  swift_release();
}

- (void)pickerWillStartCreation
{
}

- (void)editorDidGenerateAssets:(id)a3
{
}

- (void)editorDidCancelWithRequiresShowingGrid:(BOOL)a3
{
}

- (void)editorDidChangeCanStartUpscaling:(BOOL)a3
{
}

- (void)editorDidChangeHasSignificantEdits:(BOOL)a3
{
}

@end