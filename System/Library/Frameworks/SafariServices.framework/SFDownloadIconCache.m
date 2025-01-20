@interface SFDownloadIconCache
@end

@implementation SFDownloadIconCache

void __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke_2;
  v4[3] = &unk_1E5C77F98;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_copyWeak(&v6, (id *)(a1 + 56));
  [v2 _generateThumbnailForURL:v3 completionHandler:v4];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke_3;
  block[3] = &unk_1E5C77F70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v3) {
      [v4 _didGenerateThumbnail:*(void *)(a1 + 32) forSource:v3];
    }

    id WeakRetained = v4;
  }
}

void __67___SFDownloadIconCache__generateThumbnailForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___SFDownloadIconCache__generateThumbnailForURL_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5C73300;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __67___SFDownloadIconCache__generateThumbnailForURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) UIImage];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end