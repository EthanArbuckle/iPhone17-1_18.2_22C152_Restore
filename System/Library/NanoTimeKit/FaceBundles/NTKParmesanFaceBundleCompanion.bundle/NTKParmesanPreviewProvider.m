@interface NTKParmesanPreviewProvider
- (BOOL)Parmesan_canAddPhotoAssets;
- (BOOL)Parmesan_canCrop;
- (BOOL)Parmesan_canDelete;
- (CGRect)Parmesan_screenBounds;
- (CGSize)Parmesan_minimumNormalizedCropSize;
- (CLKFont)Parmesan_timeLabelFont;
- (NTKParmesanOrderedImageEditor)editor;
- (NTKParmesanPreviewProvider)initWithEditor:(id)a3 selectedImageIndex:(int64_t)a4;
- (NTKParmesanTypefaceMetrics)Parmesan_typefaceMetrics;
- (double)Parmesan_screenCornerRadius;
- (int64_t)selectedImageIndex;
- (void)Parmesan_changePhotoWithAsset:(id)a3 completion:(id)a4;
- (void)Parmesan_getOptimizedPreviewWithCompletion:(id)a3;
- (void)Parmesan_getPreviewWithCompletion:(id)a3;
- (void)Parmesan_resetCropWithCompletion:(id)a3;
@end

@implementation NTKParmesanPreviewProvider

- (NTKParmesanPreviewProvider)initWithEditor:(id)a3 selectedImageIndex:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKParmesanPreviewProvider;
  v8 = [(NTKParmesanPreviewProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_editor, a3);
    v9->_selectedImageIndex = a4;
  }

  return v9;
}

- (BOOL)Parmesan_canCrop
{
  return objc_msgSend_canChangeOriginalCropOfPhotoAtIndex_(self->_editor, a2, self->_selectedImageIndex, v2);
}

- (BOOL)Parmesan_canDelete
{
  return objc_msgSend_photosCount(self->_editor, a2, v2, v3) > 1;
}

- (BOOL)Parmesan_canAddPhotoAssets
{
  return ((uint64_t (*)(NTKParmesanOrderedImageEditor *, char *))MEMORY[0x270F9A6D0])(self->_editor, sel_allowAddingPhotoAssets);
}

- (CGRect)Parmesan_screenBounds
{
  v4 = objc_msgSend_device(self->_editor, a2, v2, v3);
  objc_msgSend_screenBounds(v4, v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (double)Parmesan_screenCornerRadius
{
  v4 = objc_msgSend_device(self->_editor, a2, v2, v3);
  objc_msgSend_screenCornerRadius(v4, v5, v6, v7);
  double v9 = v8;

  return v9;
}

- (CGSize)Parmesan_minimumNormalizedCropSize
{
  ((void (*)(NTKParmesanOrderedImageEditor *, char *, int64_t))MEMORY[0x270F9A6D0])(self->_editor, sel_minimumNormalizedCropSizeForPhotoAtIndex_, self->_selectedImageIndex);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NTKParmesanTypefaceMetrics)Parmesan_typefaceMetrics
{
  double v3 = [NTKParmesanTypefaceMetrics alloc];
  uint64_t v7 = objc_msgSend_device(self->_editor, v4, v5, v6);
  double v10 = objc_msgSend_initWithDevice_(v3, v8, (uint64_t)v7, v9);

  return (NTKParmesanTypefaceMetrics *)v10;
}

- (CLKFont)Parmesan_timeLabelFont
{
  return (CLKFont *)((uint64_t (*)(void, char *))MEMORY[0x270F9A6D0])(MEMORY[0x263EFD198], sel_systemFontOfSize_);
}

- (void)Parmesan_getPreviewWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v8 = objc_msgSend_logObject(NTKParmesanFaceBundle, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t selectedImageIndex = self->_selectedImageIndex;
    int v15 = 134217984;
    int64_t v16 = selectedImageIndex;
    _os_log_impl(&dword_246B51000, v8, OS_LOG_TYPE_DEFAULT, "Requesting preview for asset index = %ld", (uint8_t *)&v15, 0xCu);
  }

  editor = self->_editor;
  if (editor)
  {
    objc_msgSend_previewOfLibraryPhotoAtIndex_completion_(editor, v10, self->_selectedImageIndex, (uint64_t)v4);
  }
  else
  {
    double v14 = objc_msgSend_logObject(NTKParmesanFaceBundle, v10, v11, v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_246C2B870((uint64_t)self, v14);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)Parmesan_getOptimizedPreviewWithCompletion:(id)a3
{
}

- (void)Parmesan_resetCropWithCompletion:(id)a3
{
}

- (void)Parmesan_changePhotoWithAsset:(id)a3 completion:(id)a4
{
  id v14 = a3;
  uint64_t v6 = (void (**)(id, void, void *))a4;
  if (objc_msgSend_Parmesan_canAddPhotoAssets(self, v7, v8, v9))
  {
    double v13 = objc_msgSend_replaceAssetAtIndex_withAsset_(self->_editor, v10, self->_selectedImageIndex, (uint64_t)v14);
    if (v13) {
      v6[2](v6, 0, v13);
    }
    else {
      objc_msgSend_Parmesan_getPreviewWithCompletion_(self, v11, (uint64_t)v6, v12);
    }
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

- (NTKParmesanOrderedImageEditor)editor
{
  return self->_editor;
}

- (int64_t)selectedImageIndex
{
  return self->_selectedImageIndex;
}

- (void).cxx_destruct
{
}

@end