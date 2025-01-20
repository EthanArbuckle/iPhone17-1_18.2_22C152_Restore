@interface UIDocumentTargetSelectionController
@end

@implementation UIDocumentTargetSelectionController

uint64_t __55___UIDocumentTargetSelectionController_viewWillAppear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupPalette];
  v2 = *(void **)(a1 + 32);

  return [v2 _setupNavigationItem];
}

uint64_t __48___UIDocumentTargetSelectionController_dismiss___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) finishObserving];
}

id __54___UIDocumentTargetSelectionController__updatePalette__block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ui_resolveOnDiskBookmarkAndPromise");
  id v9 = 0;
  int v3 = [v2 getPromisedItemResourceValue:&v9 forKey:*MEMORY[0x263EFF738] error:0];
  id v4 = v9;
  v5 = v4;
  if (v3)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 lastPathComponent];
  }
  v7 = v6;

  return v7;
}

void __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v9 = *MEMORY[0x263F1C238];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1016) font];
  v10[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v3 sizeWithAttributes:v5];
  double v7 = v6;
  double v8 = *(double *)(a1 + 40);

  if (v7 < v8) {
    [*(id *)(*(void *)(a1 + 32) + 1016) setText:v3];
  }
}

void __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_3(uint64_t a1)
{
  v2 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_4;
  block[3] = &unk_26492D260;
  id v4 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v5);
}

void __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_4(uint64_t a1)
{
  __int16 v8 = 0;
  v2 = +[_UIDocumentTargetSelectionController _loadThumbnailForURL:size:scale:wantsBorder:generatedThumbnail:](_UIDocumentTargetSelectionController, "_loadThumbnailForURL:size:scale:wantsBorder:generatedThumbnail:", *(void *)(a1 + 32), (char *)&v8 + 1, &v8, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained && (_BYTE)v8)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_5;
    block[3] = &unk_26492D238;
    void block[4] = WeakRetained;
    id v6 = v2;
    char v7 = HIBYTE(v8);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setIconViewImage:*(void *)(a1 + 40) border:*(unsigned __int8 *)(a1 + 48)];
}

@end