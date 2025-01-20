@interface _SFQRCodeDetectionController
+ (_SFQRCodeDetectionController)sharedController;
- (_SFQRCodeDetectionController)init;
- (id)actionForElement:(id)a3;
- (id)adjustedCopyActionForAction:(id)a3 elementInfo:(id)a4;
- (id)elementForAction:(id)a3;
- (id)getActionForImageSynchronously:(id)a3 userInfo:(id *)a4;
- (id)menuElementsForElementInfo:(id)a3;
- (void)cacheElement:(id)a3;
- (void)clearCachedElement:(id)a3;
- (void)getActionForImage:(id)a3 completion:(id)a4;
@end

@implementation _SFQRCodeDetectionController

+ (_SFQRCodeDetectionController)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___SFQRCodeDetectionController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_sharedController;

  return (_SFQRCodeDetectionController *)v2;
}

- (_SFQRCodeDetectionController)init
{
  v11.receiver = self;
  v11.super_class = (Class)_SFQRCodeDetectionController;
  v2 = [(_SFQRCodeDetectionController *)&v11 init];
  if (v2)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v3 = (void *)getBCSQRCodeParserClass_softClass;
    uint64_t v16 = getBCSQRCodeParserClass_softClass;
    if (!getBCSQRCodeParserClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getBCSQRCodeParserClass_block_invoke;
      v12[3] = &unk_1E5C723B0;
      v12[4] = &v13;
      __getBCSQRCodeParserClass_block_invoke((uint64_t)v12);
      v3 = (void *)v14[3];
    }
    v4 = v3;
    _Block_object_dispose(&v13, 8);
    v5 = (BCSQRCodeParser *)objc_alloc_init(v4);
    QRCodeParser = v2->_QRCodeParser;
    v2->_QRCodeParser = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    cachedElements = v2->_cachedElements;
    v2->_cachedElements = v7;

    v9 = v2;
  }

  return v2;
}

- (void)getActionForImage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  QRCodeParser = self->_QRCodeParser;
  uint64_t v8 = [a3 CGImage];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61___SFQRCodeDetectionController_getActionForImage_completion___block_invoke;
  v10[3] = &unk_1E5C76CE0;
  id v11 = v6;
  id v9 = v6;
  [(BCSQRCodeParser *)QRCodeParser parseCodeFromImage:v8 completionHandler:v10];
}

- (id)getActionForImageSynchronously:(id)a3 userInfo:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  QRCodeParser = self->_QRCodeParser;
  id v9 = v6;
  uint64_t v10 = [v9 CGImage];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72___SFQRCodeDetectionController_getActionForImageSynchronously_userInfo___block_invoke;
  v17[3] = &unk_1E5C76D08;
  v19 = &v20;
  id v11 = v7;
  v18 = v11;
  [(BCSQRCodeParser *)QRCodeParser parseCodeFromImage:v10 completionHandler:v17];
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v11, v12);
  if (a4)
  {
    uint64_t v13 = v21[5];
    if (v13)
    {
      v26 = @"action";
      v27[0] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      *a4 = v14;
    }
    else
    {
      *a4 = 0;
    }
  }
  id v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v15;
}

- (id)elementForAction:(id)a3
{
  id v4 = a3;
  cachedElements = self->_cachedElements;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49___SFQRCodeDetectionController_elementForAction___block_invoke;
  v9[3] = &unk_1E5C76D30;
  id v10 = v4;
  id v6 = v4;
  dispatch_semaphore_t v7 = [(NSMutableSet *)cachedElements safari_anyObjectPassingTest:v9];

  return v7;
}

- (id)menuElementsForElementInfo:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"action"];

  v5 = [v4 urlThatCanBeOpened];

  id v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (!v5 && v4)
  {
    dispatch_semaphore_t v7 = [v4 actionPickerItems];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = [v4 actionPickerItems];
      id v6 = objc_msgSend(v9, "safari_mapObjectsUsingBlock:", &__block_literal_global_42);
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v6;
}

- (id)actionForElement:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"action"];

  return v4;
}

- (void)cacheElement:(id)a3
{
}

- (void)clearCachedElement:(id)a3
{
}

- (id)adjustedCopyActionForAction:(id)a3 elementInfo:(id)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = [(_SFQRCodeDetectionController *)self actionForElement:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 urlThatCanBeOpened];
    if (v9)
    {
      id v10 = (void *)MEMORY[0x1E4FB13F0];
      id v11 = _WBSLocalizedString();
      dispatch_time_t v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72___SFQRCodeDetectionController_adjustedCopyActionForAction_elementInfo___block_invoke;
      v17[3] = &unk_1E5C72170;
      id v18 = v9;
      id v13 = [v10 actionWithTitle:v11 image:v12 identifier:0 handler:v17];
    }
    else
    {
      id v14 = [v8 actionPickerItems];
      char v15 = objc_msgSend(v14, "safari_containsObjectPassingTest:", &__block_literal_global_21);

      if (v15) {
        id v13 = 0;
      }
      else {
        id v13 = v6;
      }
    }
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedElements, 0);
  objc_storeStrong((id *)&self->_lastDetectedAction, 0);

  objc_storeStrong((id *)&self->_QRCodeParser, 0);
}

@end