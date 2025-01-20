@interface MKLinkPreviewImageHelper
+ (void)resizeImageIfNeeded:(id)a3 toFrameSize:(CGSize)a4 displayScale:(double)a5 completion:(id)a6;
@end

@implementation MKLinkPreviewImageHelper

+ (void)resizeImageIfNeeded:(id)a3 toFrameSize:(CGSize)a4 displayScale:(double)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a6;
  v12 = (void (**)(void, void))v11;
  if (v10)
  {
    double v13 = width * a5;
    double v14 = height * a5;
    [v10 size];
    double v16 = v15;
    [v10 size];
    double v18 = v17;
    [v10 size];
    if (v16 >= v18) {
      double v21 = v20 / v14;
    }
    else {
      double v21 = v19 / v13;
    }
    [v10 size];
    double v24 = v23;
    [v10 size];
    double v26 = v25;
    [v10 size];
    if (v27 <= v13)
    {
      [v10 size];
      if (v28 <= v14)
      {
        ((void (**)(void, id))v12)[2](v12, v10);
        goto LABEL_10;
      }
    }
    v29[1] = 3221225472;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[2] = __84__MKLinkPreviewImageHelper_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_2;
    v29[3] = &unk_1E54B97F8;
    v31 = v12;
    id v30 = v10;
    objc_msgSend(v30, "_mapkit_prepareThumbnailOfSize:completionHandler:", v29, v24 / v21, v26 / v21);

    v22 = v31;
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __84__MKLinkPreviewImageHelper_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke;
    v32[3] = &unk_1E54B82E8;
    id v33 = v11;
    _performBlockOnMainThreadIfNeeded(v32);
    v22 = v33;
  }

LABEL_10:
}

uint64_t __84__MKLinkPreviewImageHelper_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__MKLinkPreviewImageHelper_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__MKLinkPreviewImageHelper_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_3;
  v5[3] = &unk_1E54B83F8;
  id v8 = *(id *)(a1 + 40);
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  _performBlockOnMainThreadIfNeeded(v5);
}

uint64_t __84__MKLinkPreviewImageHelper_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  if (!v3) {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

@end