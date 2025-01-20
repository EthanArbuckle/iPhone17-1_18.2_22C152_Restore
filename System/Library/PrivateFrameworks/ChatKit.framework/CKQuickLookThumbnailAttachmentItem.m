@interface CKQuickLookThumbnailAttachmentItem
+ (CGSize)defaultSize;
+ (id)UTITypes;
- (CGSize)size;
- (void)generatePreviewWithCompletion:(id)a3;
@end

@implementation CKQuickLookThumbnailAttachmentItem

+ (id)UTITypes
{
  return +[CKQuickLookThumbnailMediaObject UTITypes];
}

+ (CGSize)defaultSize
{
  double v2 = 100.0;
  double v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)size
{
  double v2 = objc_opt_class();

  [v2 defaultSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  double v4 = (void (**)(id, void *))a3;
  v5 = [(id)objc_opt_class() previewCache];
  v6 = CKAttachmentPreviewCacheKey(self);
  [(id)objc_opt_class() defaultSize];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v11 = [v5 cachedPreviewForKey:v6];
  if (v11)
  {
    v4[2](v4, v11);
  }
  else if (([v5 isGeneratingPreviewForKey:v6] & 1) == 0)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke;
    v17[3] = &unk_1E5623A10;
    v17[4] = self;
    v17[5] = v8;
    v17[6] = v10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
    v12[3] = &unk_1E5622F40;
    id v13 = v5;
    id v14 = v6;
    v15 = self;
    v16 = v4;
    [v13 enqueueGenerationBlock:v17 completion:v12 withPriority:1 forKey:v14];
  }
}

id __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  id v4 = objc_alloc(MEMORY[0x1E4F3A6C0]);
  v5 = [*(id *)(a1 + 32) fileURL];
  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  uint64_t v8 = objc_msgSend(v4, "initWithFileAtURL:size:scale:representationTypes:", v5, 4, *(double *)(a1 + 40), *(double *)(a1 + 48), v7);

  [v8 setShouldUseRestrictedExtension:1];
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__49;
  v22 = __Block_byref_object_dispose__49;
  id v23 = 0;
  uint64_t v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  uint64_t v10 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_40;
  v15[3] = &unk_1E5629920;
  v17 = &v18;
  v11 = v9;
  v16 = v11;
  [v10 generateBestRepresentationForRequest:v8 completionHandler:v15];

  dispatch_time_t v12 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v11, v12)) {
    _IMWarn();
  }
  id v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v13;
}

void __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [a2 UIImage];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_3;
  v5[3] = &unk_1E5622F40;
  id v6 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  id v4 = v2;
  if (v2)
  {
    [*(id *)(a1 + 48) _savePreview:v2];
    id v2 = v4;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v2);
    id v2 = v4;
  }
}

@end