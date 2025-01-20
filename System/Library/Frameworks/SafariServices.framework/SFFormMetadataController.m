@interface SFFormMetadataController
@end

@implementation SFFormMetadataController

void __68___SFFormMetadataController_collectFormMetadataForPageLevelAutoFill__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 _observer];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  v6 = [WeakRetained mainFrame];
  v7 = [v6 URL];
  [v8 didCollectFormMetadataForPageLevelAutoFill:v4 atURL:v7];
}

void __63___SFFormMetadataController__collectFormMetadataForPreFilling___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 _observer];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  v7 = [WeakRetained mainFrame];
  id v8 = [v7 URL];
  [v5 didCollectFormMetadataForPreFilling:v4 atURL:v8];

  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
}

void __105___SFFormMetadataController__collectFormMetadataWithRequestType_ignoreAutoFilledForms_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = [a2 plugInFrame];
  v5 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:v8];
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  if (!*(unsigned char *)(a1 + 56) || ([*(id *)(a1 + 48) _formContainsAutoFilledElements:v7] & 1) == 0) {
    [v6 addObject:v7];
  }
}

void __126___SFFormMetadataController__webProcessPlugInBrowserContextController_textDidChangeInTextField_inFrame_initiatedByUserTyping___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = +[SFFormAutoFillNode autoFillNodeWithNodeHandle:*(void *)(a1 + 32)];
    id v4 = +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:*(void *)(a1 + 40)];
    id v11 = 0;
    id v12 = 0;
    [WeakRetained getMetadataForTextField:v3 inFrame:v4 textFieldMetadata:&v12 formMetadata:&v11 requestType:3];
    id v5 = v12;
    id v6 = v11;
    id v7 = v11;

    objc_storeStrong(WeakRetained + 8, v6);
    if (v7) {
      id v8 = *(void **)(a1 + 40);
    }
    else {
      id v8 = 0;
    }
    objc_storeStrong(WeakRetained + 9, v8);
    v9 = [WeakRetained _observer];
    v10 = [[SFFormAutoFillFrameHandle alloc] initWithWebProcessPlugInFrame:*(void *)(a1 + 40)];
    [v9 textDidChangeInTextField:v5 inForm:v7 inFrame:v10];
  }
}

@end