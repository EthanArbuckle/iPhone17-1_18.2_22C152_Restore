@interface SFReaderFontOptionsGroupController
@end

@implementation SFReaderFontOptionsGroupController

void __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F98D68];
  id v5 = a2;
  v4 = [v3 sharedManager];
  [v4 downloadFont:*(void *)(a1 + 32)];

  [v5 setDownloading:1];
}

void __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_2(id *a1)
{
  id v2 = a1[4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_3;
  v3[3] = &unk_1E5C74FA8;
  objc_copyWeak(&v7, a1 + 7);
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[4];
  [v2 isInstalledWithCompletionHandler:v3];

  objc_destroyWeak(&v7);
}

void __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_3(id *a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_4;
  block[3] = &unk_1E5C74F80;
  char v8 = a2;
  objc_copyWeak(&v7, a1 + 7);
  id v4 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
}

void __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v6 = WeakRetained;
      [*(id *)(a1 + 32) setEnabled:1];
      [*(id *)(a1 + 40) setAccessoryView:0];
      v3 = [v6 _attributedStringForReaderFont:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) setAttributedTitle:v3];

      id v4 = (void *)v6[5];
      id v5 = [*(id *)(a1 + 48) familyName];
      [v4 activateFont:v5];

      WeakRetained = v6;
    }
  }
}

@end