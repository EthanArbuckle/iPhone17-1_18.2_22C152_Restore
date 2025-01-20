@interface CNPhotoPickerPhotoFacesProvider
+ (id)log;
- (CGRect)cropRectForAsset:(id)a3 face:(id)a4;
- (CNPhotoPickerPhotoFacesProvider)initWithVisualIdentity:(id)a3;
- (CNVisualIdentity)visualIdentity;
- (NSString)identifier;
- (id)getItemsFromPhotoLibraryWithItemDelegate:(id)a3;
- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8;
- (void)setIdentifier:(id)a3;
@end

@implementation CNPhotoPickerPhotoFacesProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGRect)cropRectForAsset:(id)a3 face:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  [v5 size];
  double v8 = v7;
  [v5 centerX];
  double v10 = v9;
  [v5 centerY];
  double v12 = v11;

  double v13 = (double)(unint64_t)[v6 pixelWidth];
  unint64_t v14 = [v6 pixelHeight];

  double v15 = (double)v14;
  if (v13 >= (double)v14) {
    double v16 = (double)v14;
  }
  else {
    double v16 = v13;
  }
  double v17 = v8 * v16;
  double v18 = v8 * v16 * -0.5;
  double v19 = v18 + v10 * v13;
  double v20 = v18 + (1.0 - v12) * v15;
  double v21 = v8 * v16 + v19 - v13;
  if (v21 < v8 * v16 + v20 - v15) {
    double v21 = v8 * v16 + v20 - v15;
  }
  double v22 = -(v8 * v16);
  if (v21 >= v22) {
    double v22 = v21;
  }
  double v23 = v22 - fmin(v19 + v22, 0.0);
  CGFloat v24 = v23 - fmin(v20 + v23, 0.0);
  double v25 = v17;
  CGRect v48 = CGRectInset(*(CGRect *)&v19, v24, v24);
  CGFloat x = v48.origin.x;
  CGFloat y = v48.origin.y;
  CGFloat width = v48.size.width;
  CGFloat height = v48.size.height;
  v30 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v35 = 134219264;
    CGFloat v36 = x;
    __int16 v37 = 2048;
    CGFloat v38 = y;
    __int16 v39 = 2048;
    CGFloat v40 = width;
    __int16 v41 = 2048;
    CGFloat v42 = height;
    __int16 v43 = 2048;
    double v44 = v13;
    __int16 v45 = 2048;
    double v46 = (double)v14;
    _os_log_debug_impl(&dword_18B625000, v30, OS_LOG_TYPE_DEBUG, "cropRect {%.2f, %.2f, %.2f, %.2f} for face asset of size (%.2f x %.2f)", (uint8_t *)&v35, 0x3Eu);
  }

  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (id)getItemsFromPhotoLibraryWithItemDelegate:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  CGFloat v38 = [MEMORY[0x1E4F1CA48] array];
  id v48 = 0;
  v4 = +[CNPhotoLibraryProvider photoLibraryWithError:&v48];
  id v5 = v48;
  if (v4)
  {
    id v6 = objc_alloc_init((Class)getPHFetchOptionsClass[0]());
    [v6 setPhotoLibrary:v4];
    double v7 = [(CNPhotoPickerPhotoFacesProvider *)self visualIdentity];
    double v8 = [v7 identifier];

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
    {
      Class PHPersonClass = getPHPersonClass();
      v50 = v8;
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      double v11 = [(objc_class *)PHPersonClass fetchPersonsForContactIdentifiers:v10 options:v6];

      double v12 = [v11 firstObject];
      if (v12)
      {
        double v31 = v11;
        double v32 = v8;
        CGFloat v36 = self;
        id v33 = v5;
        id v13 = objc_alloc_init((Class)getPHFetchOptionsClass[0]());
        double v34 = v4;
        [v13 setPhotoLibrary:v4];
        [v13 setFetchLimit:4];
        v29 = v13;
        v30 = v12;
        v28 = [(Class)getPHFaceClass[0]() fetchSuggestedFacesForPerson:v12 options:v13];
        unint64_t v14 = [v28 fetchedObjects];
        double v15 = [(Class)getPHAssetClass[0]() fetchAssetsGroupedByFaceUUIDForFaces:v14];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id obj = v14;
        uint64_t v16 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v45 != v18) {
                objc_enumerationMutation(obj);
              }
              double v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              double v21 = [v20 uuid];
              double v22 = [v15 objectForKeyedSubscript:v21];

              if (v22)
              {
                getPHImageRequestOptionsClass[0]();
                double v23 = objc_opt_new();
                [v23 setSynchronous:1];
                [v23 setNetworkAccessAllowed:1];
                [v23 setResizeMode:1];
                CGFloat v24 = [(Class)getPHImageManagerClass[0]() defaultManager];
                v39[0] = MEMORY[0x1E4F143A8];
                v39[1] = 3221225472;
                v39[2] = __76__CNPhotoPickerPhotoFacesProvider_getItemsFromPhotoLibraryWithItemDelegate___block_invoke;
                v39[3] = &unk_1E5499F70;
                v39[4] = v36;
                id v25 = v22;
                id v40 = v25;
                __int16 v41 = v20;
                id v42 = v37;
                id v43 = v38;
                [v24 requestImageDataAndOrientationForAsset:v25 options:v23 resultHandler:v39];
              }
            }
            uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
          }
          while (v17);
        }

        id v5 = v33;
        v4 = v34;
        double v8 = v32;
        double v12 = v30;
        double v11 = v31;
      }
      id v26 = v38;
    }
    else
    {
      id v26 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v5;
      _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "Unable to fetch faces from photo library %@", buf, 0xCu);
    }
    id v26 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v26;
}

void __76__CNPhotoPickerPhotoFacesProvider_getItemsFromPhotoLibraryWithItemDelegate___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  [v3 cropRectForAsset:v4 face:v5];
  double v12 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerPhotoFacesProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v6, 0, 0, v7, v8, v9, v10);

  double v11 = [*(id *)(a1 + 40) modificationDate];
  [(CNPhotoPickerProviderItem *)v12 setSortDate:v11];

  [(CNPhotoPickerProviderItem *)v12 setDelegate:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) addObject:v12];
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  id v11 = a6;
  id v12 = a7;
  id v13 = a8;
  if (+[CNPhotoPickerCapabilities allowsPhotoLibraryAccess]&& [(objc_class *)getPHPhotoLibraryClass_47173() authorizationStatus] != 2)
  {
    uint64_t v22 = 0;
    double v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__47174;
    id v26 = __Block_byref_object_dispose__47175;
    id v27 = 0;
    if ([(objc_class *)getPHPhotoLibraryClass_47173() authorizationStatus])
    {
      uint64_t v15 = [(CNPhotoPickerPhotoFacesProvider *)self getItemsFromPhotoLibraryWithItemDelegate:v13];
      uint64_t v16 = (void *)v23[5];
      v23[5] = v15;
    }
    else
    {
      Class PHPhotoLibraryClass_47173 = getPHPhotoLibraryClass_47173();
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __104__CNPhotoPickerPhotoFacesProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke;
      v19[3] = &unk_1E5499F48;
      double v21 = &v22;
      v19[4] = self;
      id v20 = v13;
      [(objc_class *)PHPhotoLibraryClass_47173 requestAuthorization:v19];
    }
    id v14 = (id)v23[5];
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __104__CNPhotoPickerPhotoFacesProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 3)
  {
    uint64_t v3 = [*(id *)(a1 + 32) getItemsFromPhotoLibraryWithItemDelegate:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

- (CNPhotoPickerPhotoFacesProvider)initWithVisualIdentity:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerPhotoFacesProvider;
  uint64_t v6 = [(CNPhotoPickerPhotoFacesProvider *)&v13 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    double v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    id v11 = v7;
  }

  return v7;
}

+ (id)log
{
  if (log_cn_once_token_20_47189 != -1) {
    dispatch_once(&log_cn_once_token_20_47189, &__block_literal_global_47190);
  }
  v2 = (void *)log_cn_once_object_20_47191;

  return v2;
}

void __38__CNPhotoPickerPhotoFacesProvider_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNPhotoPickerPhotoFacesProvider");
  v1 = (void *)log_cn_once_object_20_47191;
  log_cn_once_object_20_47191 = (uint64_t)v0;
}

@end