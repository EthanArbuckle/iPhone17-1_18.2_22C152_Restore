@interface NTKCompanionUltraCubePhotosEditor
- (BOOL)_ensurePreviewEditSessionIsLoadedForPhotoAtIndex:(int64_t)a3 computeCrop:(BOOL)a4;
- (BOOL)addAssetsFromAssetList:(id)a3;
- (BOOL)addAssetsFromAssetList:(id)a3 maxPhotosCount:(unint64_t)a4;
- (BOOL)addPhotosFromUIImagePicker:(id)a3;
- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3;
- (BOOL)savePreview:(id)a3 forPhotoAtIndex:(int64_t)a4;
- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3;
- (NTKCompanionUltraCubePhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4;
- (id)_copyOrTranscodePhotosTo:(id)a3;
- (id)_createPreviewEditSessionForPhoto:(id)a3;
- (id)_fetchAssetsForNewPhotos:(id)a3;
- (int64_t)photosCount;
- (void)_fetchAssetsForResourceDirectoryPhotos;
- (void)_readResourceDirectoryPhotosFrom:(id)a3;
- (void)_reinitializeWithImageList:(id)a3 andResourceDirectory:(id)a4;
- (void)deletePhotoAtIndex:(int64_t)a3;
- (void)finalizeWithCompletion:(id)a3;
- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3;
- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)previewOfLibraryPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)purgeResourcesForPreviewAtIndex:(int64_t)a3;
- (void)resetCropOfPhotoAtIndex:(int64_t)a3 completion:(id)a4;
- (void)thumbnailImageForPhotoAtIndex:(int64_t)a3 completion:(id)a4;
@end

@implementation NTKCompanionUltraCubePhotosEditor

- (NTKCompanionUltraCubePhotosEditor)initWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)NTKCompanionUltraCubePhotosEditor;
  v4 = [(NTKCompanionUltraCubePhotosEditor *)&v14 initWithResourceDirectory:a3 forDevice:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    photos = v4->_photos;
    v4->_photos = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    orderList = v4->_orderList;
    v4->_orderList = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    scaledImageCache = v4->_scaledImageCache;
    v4->_scaledImageCache = (NSCache *)v9;

    v4->_galleryPreviewIsValid = 0;
    v4->_editedIndex = -1;
    v11 = [(NTKCompanionUltraCubePhotosEditor *)v4 resourceDirectory];

    if (v11)
    {
      v12 = [(NTKCompanionUltraCubePhotosEditor *)v4 resourceDirectory];
      [(NTKCompanionUltraCubePhotosEditor *)v4 _readResourceDirectoryPhotosFrom:v12];
    }
    [(NTKCompanionUltraCubePhotosEditor *)v4 setState:1];
  }
  return v4;
}

- (void)generateGalleryPreviewResourceDirectoryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "generateGalleryPreviewResourceDirectoryWithCompletion: generating preview for NTKCompanionUltraCubePhotosEditor", buf, 2u);
  }

  *(void *)buf = 0;
  v20 = buf;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1DA14;
  v23 = sub_1DA24;
  id v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1DA2C;
  v15[3] = &unk_49248;
  v17 = buf;
  id v18 = [(NTKCompanionUltraCubePhotosEditor *)self state];
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  uint64_t v7 = objc_retainBlock(v15);
  if ([(NTKCompanionUltraCubePhotosEditor *)self state]
    && (uint64_t)[(NTKCompanionUltraCubePhotosEditor *)self state] <= 2)
  {
    if ([(NTKCompanionUltraCubePhotosEditor *)self state] == (char *)&dword_0 + 1)
    {
      uint64_t v9 = [(NTKCompanionUltraCubePhotosEditor *)self resourceDirectory];
    }
    else
    {
      if (!self->_galleryPreviewIsValid)
      {
        [(NTKCompanionUltraCubePhotosEditor *)self setState:3];
        v11 = dispatch_get_global_queue(2, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1DBD8;
        block[3] = &unk_49270;
        block[4] = self;
        v13 = v7;
        objc_super v14 = buf;
        dispatch_async(v11, block);

        goto LABEL_12;
      }
      uint64_t v9 = [(NTKCompanionUltraCubePhotosEditor *)self galleryPreviewResourceDirectory];
    }
    v10 = (void *)*((void *)v20 + 5);
    *((void *)v20 + 5) = v9;

    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  ((void (*)(void *, uint64_t))v7[2])(v7, v8);
LABEL_12:

  _Block_object_dispose(buf, 8);
}

- (void)finalizeWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "finalizeWithCompletion: finalizing NTKCompanionUltraCubePhotosEditor", buf, 2u);
  }

  if ([(NTKCompanionUltraCubePhotosEditor *)self state]
    && (uint64_t)[(NTKCompanionUltraCubePhotosEditor *)self state] < 3)
  {
    if ([(NTKCompanionUltraCubePhotosEditor *)self state] == (char *)&dword_0 + 1)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1F9B4;
      v10[3] = &unk_492C0;
      v10[4] = self;
      id v11 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
      id v6 = v11;
    }
    else
    {
      [(NTKCompanionUltraCubePhotosEditor *)self setState:4];
      uint64_t v7 = dispatch_get_global_queue(2, 0);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1FA10;
      v8[3] = &unk_49338;
      v8[4] = self;
      id v9 = v4;
      dispatch_async(v7, v8);

      id v6 = v9;
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1F9A0;
    block[3] = &unk_49298;
    id v13 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v6 = v13;
  }
}

- (int64_t)photosCount
{
  return (int64_t)[(NSMutableArray *)self->_orderList count];
}

- (BOOL)addPhotosFromUIImagePicker:(id)a3
{
  v3 = self;
  id v4 = [(NTKCompanionUltraCubePhotosEditor *)self _fetchAssetsForNewPhotos:a3];
  LOBYTE(v3) = [(NTKCompanionUltraCubePhotosEditor *)v3 addAssetsFromAssetList:v4 maxPhotosCount:24];

  return (char)v3;
}

- (BOOL)addAssetsFromAssetList:(id)a3
{
  return [(NTKCompanionUltraCubePhotosEditor *)self addAssetsFromAssetList:a3 maxPhotosCount:24];
}

- (BOOL)addAssetsFromAssetList:(id)a3 maxPhotosCount:(unint64_t)a4
{
  id v6 = a3;
  if (![(NTKCompanionUltraCubePhotosEditor *)self state]
    || (uint64_t)[(NTKCompanionUltraCubePhotosEditor *)self state] > 2
    || (int64_t v7 = [(NTKCompanionUltraCubePhotosEditor *)self photosCount],
        (unint64_t)[v6 count] + v7 > a4))
  {
    BOOL v8 = 0;
    goto LABEL_5;
  }
  v38 = [(NSMutableArray *)self->_orderList firstObject];
  id v39 = v6;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (!v10) {
    goto LABEL_28;
  }
  id v11 = v10;
  uint64_t v41 = *(void *)v43;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v43 != v41) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      objc_super v14 = [v13 localIdentifier];
      v15 = objc_opt_new();
      [v15 setAsset:v13];
      [v15 setSubsampleFactor:sub_201E4(v13)];
      [v15 setPhoto:0];
      id v16 = objc_alloc_init(_NTKLayoutDescriptor);
      [v15 setLayout:v16];

      v17 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v14];
      id v18 = v17;
      if (v17)
      {
        if ([v17 isInResourceDirectory])
        {
          v19 = [v18 photo];
          v20 = [v19 modificationDate];
          uint64_t v21 = objc_msgSend(v13, "ntk_modificationDate");
          [v20 timeIntervalSince1970];
          double v23 = v22;
          [v21 timeIntervalSince1970];
          double v25 = vabdd_f64(v23, v24);

          v26 = _NTKLoggingObjectForDomain();
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
          if (v25 > 2.0)
          {
            if (v27)
            {
              v28 = [v18 photo];
              v29 = [v28 baseImageURL];
              *(_DWORD *)buf = 138412290;
              v47 = v29;
              _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "addAssetsFromAssetList: replacing existing photo %@ because it was modified", buf, 0xCu);
            }
            [(NSMutableDictionary *)self->_photos setObject:v15 forKeyedSubscript:v14];
            goto LABEL_26;
          }
          if (v27)
          {
            v33 = [v18 photo];
            v34 = [v33 baseImageURL];
            *(_DWORD *)buf = 138412290;
            v47 = v34;
            v35 = v26;
            v36 = "addAssetsFromAssetList: not adding existing photo %@";
LABEL_24:
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
          }
        }
        else
        {
          v26 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v33 = [v15 asset];
            v34 = [v33 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v47 = v34;
            v35 = v26;
            v36 = "addAssetsFromAssetList: not adding new asset again %@";
            goto LABEL_24;
          }
        }

        goto LABEL_26;
      }
      v30 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [v15 asset];
        v32 = [v31 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v47 = v32;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "addAssetsFromAssetList: adding new asset %@", buf, 0xCu);
      }
      [(NSMutableDictionary *)self->_photos setObject:v15 forKeyedSubscript:v14];
      [(NSMutableArray *)self->_orderList addObject:v14];
LABEL_26:
    }
    id v11 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  }
  while (v11);
LABEL_28:

  if (self->_galleryPreviewIsValid)
  {
    v37 = [(NSMutableArray *)self->_orderList firstObject];
    self->_galleryPreviewIsValid = NTKEqualStrings();
  }
  [(NTKCompanionUltraCubePhotosEditor *)self setState:2];

  BOOL v8 = 1;
  id v6 = v39;
LABEL_5:

  return v8;
}

- (void)deletePhotoAtIndex:(int64_t)a3
{
  if (![(NTKCompanionUltraCubePhotosEditor *)self state]) {
    return;
  }
  id v5 = [(NTKCompanionUltraCubePhotosEditor *)self state];
  if (a3 < 0 || (uint64_t)v5 > 2 || (unint64_t)[(NSMutableArray *)self->_orderList count] <= a3) {
    return;
  }
  id v6 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
  [(NSMutableArray *)self->_orderList removeObject:v6];
  int64_t v7 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v6];
  if ([v7 isInResourceDirectory])
  {
    BOOL v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 photo];
      id v10 = [v9 baseImageURL];
      *(_DWORD *)v15 = 138412546;
      *(void *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2048;
      *(void *)&v15[14] = a3;
      id v11 = "deletePhotoAtIndex: deleting existing photo %@ at index %ld";
LABEL_10:
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, v11, v15, 0x16u);
    }
  }
  else
  {
    scaledImageCache = self->_scaledImageCache;
    id v13 = [v7 asset];
    objc_super v14 = [v13 localIdentifier];
    [(NSCache *)scaledImageCache removeObjectForKey:v14];

    BOOL v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 asset];
      id v10 = [v9 localIdentifier];
      *(_DWORD *)v15 = 138412546;
      *(void *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2048;
      *(void *)&v15[14] = a3;
      id v11 = "deletePhotoAtIndex: deleting new asset id %@ at index %ld";
      goto LABEL_10;
    }
  }

  [(NSMutableDictionary *)self->_photos removeObjectForKey:v6];
  if (self->_galleryPreviewIsValid) {
    self->_galleryPreviewIsValid = a3 != 0;
  }
  -[NTKCompanionUltraCubePhotosEditor setState:](self, "setState:", 2, *(_OWORD *)v15, *(void *)&v15[16]);
}

- (void)movePhotoAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  if ([(NTKCompanionUltraCubePhotosEditor *)self state])
  {
    id v7 = [(NTKCompanionUltraCubePhotosEditor *)self state];
    if ((a3 & 0x8000000000000000) == 0 && (uint64_t)v7 <= 2)
    {
      id v8 = [(NSMutableArray *)self->_orderList count];
      if ((a4 & 0x8000000000000000) == 0
        && (unint64_t)v8 > a3
        && (unint64_t)[(NSMutableArray *)self->_orderList count] > a4)
      {
        id v9 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
        id v10 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 134218240;
          int64_t v15 = a3;
          __int16 v16 = 2048;
          int64_t v17 = a4;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "movePhotoAtIndex: moving photo from index %ld to index %ld", (uint8_t *)&v14, 0x16u);
        }

        [(NSMutableArray *)self->_orderList removeObjectAtIndex:a3];
        [(NSMutableArray *)self->_orderList insertObject:v9 atIndex:a4];
        if (self->_galleryPreviewIsValid)
        {
          if (a3) {
            BOOL v11 = a4 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          BOOL v13 = !v11 || a3 == a4;
          self->_galleryPreviewIsValid = v13;
        }
        [(NTKCompanionUltraCubePhotosEditor *)self setState:2];
      }
    }
  }
}

- (void)thumbnailImageForPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3 < 0 || (unint64_t)[(NSMutableArray *)self->_orderList count] <= a3)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_20A44;
    v44[3] = &unk_49298;
    id v45 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v44);
    id v7 = v45;
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
    id v8 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v7];
    if ([v8 isInResourceDirectory])
    {
      id v9 = [v8 photo];
      id v10 = [v9 baseImageURL];
      BOOL v11 = NTKPhotosImageForURL();

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_20A58;
      block[3] = &unk_492C0;
      id v42 = v11;
      id v43 = v6;
      id v12 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      BOOL v13 = v43;
    }
    else
    {
      scaledImageCache = self->_scaledImageCache;
      int64_t v15 = [v8 asset];
      __int16 v16 = [v15 localIdentifier];
      id v12 = [(NSCache *)scaledImageCache objectForKey:v16];

      if (v12)
      {
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_20A6C;
        v38[3] = &unk_492C0;
        id v40 = v6;
        id v12 = v12;
        id v39 = v12;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v38);

        BOOL v13 = v40;
      }
      else
      {
        int64_t v17 = [v8 layout];
        [v17 crop];
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;

        v31 = _NSConcreteStackBlock;
        uint64_t v32 = 3221225472;
        v33 = sub_20A80;
        v34 = &unk_49360;
        v35 = self;
        id v26 = v8;
        id v36 = v26;
        id v37 = v6;
        BOOL v27 = objc_retainBlock(&v31);
        v53.origin.x = v19;
        v53.origin.y = v21;
        v53.size.width = v23;
        v53.size.height = v25;
        if (CGRectIsEmpty(v53))
        {
          objc_msgSend(v26, "asset", v31, v32, v33, v34, v35);
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          +[NTKCompanionUltraCubePhotosEditor _imageForAsset:forSize:completion:](NTKCompanionUltraCubePhotosEditor, "_imageForAsset:forSize:completion:", v28, v27, 480.0, 600.0);
        }
        else
        {
          v29 = objc_msgSend(v26, "asset", v31, v32, v33, v34, v35);
          v30 = v27;
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_23440;
          v46[3] = &unk_49400;
          CGFloat v49 = v19;
          CGFloat v50 = v21;
          CGFloat v51 = v23;
          CGFloat v52 = v25;
          id v47 = v29;
          v48 = v30;
          id v28 = v29;
          +[NTKCompanionUltraCubePhotosEditor _imageDataForAsset:v28 completion:v46];
        }
        BOOL v13 = v36;
      }
    }
  }
}

- (BOOL)canChangeOriginalCropOfPhotoAtIndex:(int64_t)a3
{
  if (a3 < 0 || (unint64_t)[(NSMutableArray *)self->_orderList count] <= a3) {
    return 0;
  }
  id v5 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
  id v6 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v5];
  id v7 = [v6 asset];
  BOOL v8 = v7 != 0;

  return v8;
}

- (void)previewOfLibraryPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_20CF4;
  block[3] = &unk_49388;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)resetCropOfPhotoAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_210C0;
  block[3] = &unk_49388;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (CGSize)minimumNormalizedCropSizeForPhotoAtIndex:(int64_t)a3
{
  double v3 = 1.0;
  if (a3 < 0)
  {
    double v6 = 1.0;
  }
  else
  {
    double v6 = 1.0;
    if ((unint64_t)[(NSMutableArray *)self->_orderList count] > a3)
    {
      id v7 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
      id v8 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v7];
      id v9 = [v8 asset];

      id v10 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v7];
      id v11 = [v10 subsampleFactor];

      if (v9)
      {
        double v12 = (double)(unint64_t)[v9 pixelWidth];
        id v13 = [v9 pixelHeight];
        if ((double)(unint64_t)v11 * 480.0 / v12 <= 1.0) {
          double v6 = (double)(unint64_t)v11 * 480.0 / v12;
        }
        else {
          double v6 = 1.0;
        }
        if ((double)(unint64_t)v11 * 600.0 / (double)(unint64_t)v13 <= 1.0) {
          double v3 = (double)(unint64_t)v11 * 600.0 / (double)(unint64_t)v13;
        }
        else {
          double v3 = 1.0;
        }
      }
    }
  }
  double v14 = v6;
  double v15 = v3;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)savePreview:(id)a3 forPhotoAtIndex:(int64_t)a4
{
  id v6 = a3;
  if (![(NTKCompanionUltraCubePhotosEditor *)self state]) {
    goto LABEL_16;
  }
  id v7 = [(NTKCompanionUltraCubePhotosEditor *)self state];
  BOOL v8 = 0;
  if (a4 < 0 || (uint64_t)v7 > 2) {
    goto LABEL_17;
  }
  if ((unint64_t)[(NSMutableArray *)self->_orderList count] <= a4
    || ![(NTKCompanionUltraCubePhotosEditor *)self canChangeOriginalCropOfPhotoAtIndex:a4])
  {
LABEL_16:
    BOOL v8 = 0;
    goto LABEL_17;
  }
  id v9 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a4];
  id v10 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v9];
  [v6 crop];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGAffineTransformMakeScale(&v47, (double)(unint64_t)[v10 subsampleFactor], (double)(unint64_t)objc_msgSend(v10, "subsampleFactor"));
  v48.origin.double x = v12;
  v48.origin.double y = v14;
  v48.size.double width = v16;
  v48.size.double height = v18;
  CGRect v49 = CGRectApplyAffineTransform(v48, &v47);
  double x = v49.origin.x;
  double y = v49.origin.y;
  double width = v49.size.width;
  double height = v49.size.height;
  [(_NTKPreviewEditSession *)self->_previewEditSession presentationSize];
  double v25 = v24 - width;
  if (x < v25) {
    double v25 = x;
  }
  double v26 = fmax(v25, 0.0);
  double v27 = v23 - height;
  if (y < v23 - height) {
    double v27 = y;
  }
  double v28 = fmax(v27, 0.0);
  if ([v10 isInResourceDirectory])
  {
    v29 = [v10 layout];
    id v30 = [v29 position];
    id v31 = [v6 timeLabelPosition];

    uint64_t v32 = [v10 layout];
    [v32 crop];
    int v33 = CLKRectEqualsRect();

    if (v33) {
      BOOL v34 = v30 == v31;
    }
    else {
      BOOL v34 = 0;
    }
    if (v34)
    {
      id v35 = 0;
      goto LABEL_22;
    }
    id v35 = (id)objc_opt_new();
    id v36 = [v10 asset];
    [v35 setAsset:v36];

    objc_msgSend(v35, "setSubsampleFactor:", objc_msgSend(v10, "subsampleFactor"));
    [v35 setPhoto:0];
    id v37 = objc_alloc_init(_NTKLayoutDescriptor);
    [v35 setLayout:v37];

    [v35 setUserAdjusted:0];
  }
  else
  {
    id v35 = v10;
  }
  if (!v35)
  {
LABEL_22:
    char v45 = 1;
    goto LABEL_23;
  }
  scaledImageCache = self->_scaledImageCache;
  id v40 = [v35 asset];
  uint64_t v41 = [v40 localIdentifier];
  [(NSCache *)scaledImageCache removeObjectForKey:v41];

  id v42 = [v35 layout];
  objc_msgSend(v42, "setCrop:", v26, v28, width, height);

  id v43 = [v6 timeLabelPosition];
  long long v44 = [v35 layout];
  [v44 setPosition:v43];

  objc_msgSend(v35, "setUserAdjusted:", objc_msgSend(v6, "isRevertable"));
  [(NSMutableDictionary *)self->_photos setObject:v35 forKeyedSubscript:v9];
  char v45 = 0;
LABEL_23:
  [(NTKCompanionUltraCubePhotosEditor *)self purgeResourcesForPreviewAtIndex:a4];
  if (self->_galleryPreviewIsValid)
  {
    if (a4) {
      BOOL v46 = 0;
    }
    else {
      BOOL v46 = v45;
    }
    self->_galleryPreviewIsValid = v46;
  }
  [(NTKCompanionUltraCubePhotosEditor *)self setState:2];

  BOOL v8 = 1;
LABEL_17:

  return v8;
}

- (void)purgeResourcesForPreviewAtIndex:(int64_t)a3
{
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "purgeResourcesForPreviewAtIndex: %ld", (uint8_t *)&v7, 0xCu);
  }

  if (self->_editedIndex == a3)
  {
    self->_editedIndedouble x = -1;
    previewEditSession = self->_previewEditSession;
    self->_previewEditSession = 0;
  }
}

- (void)_readResourceDirectoryPhotosFrom:(id)a3
{
  +[NTKUltraCubePhotosReader readerForResourceDirectory:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        int64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 localIdentifier];
        id v10 = objc_opt_new();
        [v10 setAsset:0];
        [v10 setSubsampleFactor:1];
        [v10 setPhoto:v8];
        objc_msgSend(v10, "setUserAdjusted:", objc_msgSend(v8, "isUserAdjusted"));
        double v11 = objc_alloc_init(_NTKLayoutDescriptor);
        [v8 originalCrop];
        -[_NTKLayoutDescriptor setCrop:](v11, "setCrop:");
        [v8 timeElementUnitBaseline];
        -[_NTKLayoutDescriptor setBaseline:](v11, "setBaseline:");
        [v8 timeElementZorder];
        -[_NTKLayoutDescriptor setTimeElementZorder:](v11, "setTimeElementZorder:");
        [v8 maskedImageZorder];
        -[_NTKLayoutDescriptor setMaskedImageZorder:](v11, "setMaskedImageZorder:");
        [v10 setLayout:v11];
        [(NSMutableDictionary *)self->_photos setObject:v10 forKeyedSubscript:v9];
        [(NSMutableArray *)self->_orderList addObject:v9];
      }
      id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  [(NTKCompanionUltraCubePhotosEditor *)self _fetchAssetsForResourceDirectoryPhotos];
}

- (void)_fetchAssetsForResourceDirectoryPhotos
{
  double v3 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = [(NSMutableDictionary *)self->_photos allValues];
  id v5 = [v4 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v9 isInResourceDirectory])
        {
          id v10 = [v9 photo];
          double v11 = [v10 localIdentifier];

          if (v11) {
            [v3 addObject:v11];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v6);
  }

  CGFloat v12 = NTKPHAssetsForLocalIdentifiers();
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        CGFloat v19 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
        double v20 = [v19 localIdentifier];
        [v13 setObject:v19 forKeyedSubscript:v20];
      }
      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v16);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  CGFloat v21 = [(NSMutableDictionary *)self->_photos allValues];
  id v22 = [v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (k = 0; k != v23; k = (char *)k + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        double v26 = *(void **)(*((void *)&v30 + 1) + 8 * (void)k);
        if ([v26 isInResourceDirectory])
        {
          double v27 = [v26 photo];
          double v28 = [v27 localIdentifier];

          if (v28)
          {
            v29 = [v13 objectForKeyedSubscript:v28];
            [v26 setAsset:v29];
            [v26 setSubsampleFactor:sub_201E4(v29)];
          }
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v23);
  }
}

- (id)_fetchAssetsForNewPhotos:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v9), "objectForKeyedSubscript:", UIImagePickerControllerPHAsset, (void)v19);
        double v11 = v10;
        if (v10)
        {
          CGFloat v12 = [v10 localIdentifier];
          [v4 addObject:v12];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  id v13 = NTKPHAssetsForLocalIdentifiers();
  id v14 = [v13 count];
  if (v14 != [v4 count])
  {
    id v15 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2BBA0(v13, v4, v15);
    }
  }
  if (objc_msgSend(v13, "count", (void)v19)) {
    id v16 = v13;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  return v17;
}

- (id)_copyOrTranscodePhotosTo:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1DA14;
  id v16 = sub_1DA24;
  id v17 = (id)objc_opt_new();
  orderList = self->_orderList;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_22A4C;
  v9[3] = &unk_493B0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  double v11 = &v12;
  [(NSMutableArray *)orderList enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_reinitializeWithImageList:(id)a3 andResourceDirectory:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  id v6 = (NSMutableDictionary *)objc_opt_new();
  id v7 = (NSMutableArray *)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = +[NTKUltraCubePhoto decodeFromDictionary:*(void *)(*((void *)&v24 + 1) + 8 * (void)v11) forResourceDirectory:v22];
        id v13 = [v12 localIdentifier];
        uint64_t v14 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v13];
        id v15 = [v14 asset];

        id v16 = objc_opt_new();
        [v16 setAsset:v15];
        [v16 setSubsampleFactor:sub_201E4(v15)];
        [v16 setPhoto:v12];
        objc_msgSend(v16, "setUserAdjusted:", objc_msgSend(v12, "isUserAdjusted"));
        id v17 = objc_alloc_init(_NTKLayoutDescriptor);
        [v12 originalCrop];
        -[_NTKLayoutDescriptor setCrop:](v17, "setCrop:");
        [v12 timeElementUnitBaseline];
        -[_NTKLayoutDescriptor setBaseline:](v17, "setBaseline:");
        [v12 timeElementZorder];
        -[_NTKLayoutDescriptor setTimeElementZorder:](v17, "setTimeElementZorder:");
        [v12 maskedImageZorder];
        -[_NTKLayoutDescriptor setMaskedImageZorder:](v17, "setMaskedImageZorder:");
        [v16 setLayout:v17];
        [(NSMutableDictionary *)v6 setObject:v16 forKeyedSubscript:v13];
        [(NSMutableArray *)v7 addObject:v13];

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  orderList = self->_orderList;
  self->_orderList = v7;
  long long v19 = v7;

  photos = self->_photos;
  self->_photos = v6;
}

- (BOOL)_ensurePreviewEditSessionIsLoadedForPhotoAtIndex:(int64_t)a3 computeCrop:(BOOL)a4
{
  if (a3 < 0) {
    return 0;
  }
  BOOL v4 = a4;
  if ((unint64_t)[(NSMutableArray *)self->_orderList count] <= a3) {
    return 0;
  }
  if (!self->_previewEditSession || self->_editedIndex != a3)
  {
    id v8 = [(NSMutableArray *)self->_orderList objectAtIndexedSubscript:a3];
    id v9 = [(NSMutableDictionary *)self->_photos objectForKeyedSubscript:v8];
    uint64_t v10 = [v9 asset];
    BOOL v7 = v10 != 0;

    if (v10)
    {
      double v11 = [(NTKCompanionUltraCubePhotosEditor *)self _createPreviewEditSessionForPhoto:v9];
      previewEditSession = self->_previewEditSession;
      self->_previewEditSession = v11;

      self->_editedIndedouble x = a3;
      uint64_t v13 = [v9 photo];
      if (!v13) {
        goto LABEL_20;
      }
      uint64_t v14 = (void *)v13;
      id v15 = [v9 asset];
      id v16 = [v15 modificationDate];

      if (!v16) {
        goto LABEL_20;
      }
      id v17 = [v9 asset];
      CGFloat v18 = objc_msgSend(v17, "ntk_modificationDate");
      long long v19 = [v9 photo];
      long long v20 = [v19 modificationDate];
      [v18 timeIntervalSinceDate:v20];
      double v22 = v21;

      if (v22 > 1.0)
      {
        if (!v4) {
          goto LABEL_16;
        }
      }
      else
      {
LABEL_20:
        if (!v4) {
          goto LABEL_16;
        }
        id v23 = [(_NTKPreviewEditSession *)self->_previewEditSession layout];
        [v23 crop];
        IsEmptdouble y = CGRectIsEmpty(v34);

        if (!IsEmpty) {
          goto LABEL_16;
        }
      }
      long long v25 = self->_previewEditSession;
      long long v26 = [(_NTKPreviewEditSession *)v25 photoImageMasked];
      BOOL v27 = v26 != 0;

      double v28 = [(_NTKPreviewEditSession *)v25 faceRects];
      v29 = [(_NTKPreviewEditSession *)v25 previewValidator];
      [(_NTKPreviewEditSession *)v25 presentationSize];
      long long v32 = sub_21454(v28, v27, v29, v30, v31);
      [(_NTKPreviewEditSession *)v25 setLayout:v32];
    }
LABEL_16:

    return v7;
  }
  return 1;
}

- (id)_createPreviewEditSessionForPhoto:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(_NTKPreviewEditSession);
  id v5 = [NTKCompanionUltraCubeImageDataDescriptor alloc];
  id v6 = [v3 asset];
  BOOL v7 = [(NTKCompanionUltraCubeImageDataDescriptor *)v5 initWithAsset:v6];

  if ([(NTKCompanionUltraCubeImageDataDescriptor *)v7 isValid])
  {
    [(NTKCompanionUltraCubeImageDataDescriptor *)v7 orientation];
    uint64_t v8 = NTKCGImagePropertyOrientationToUIImageOrientation();
    id v9 = [(NTKCompanionUltraCubeImageDataDescriptor *)v7 data];
    uint64_t v10 = +[NTKCompanionResourceDirectoryEditor _subsampledImageWithData:orientation:subsampleFactor:](NTKCompanionResourceDirectoryEditor, "_subsampledImageWithData:orientation:subsampleFactor:", v9, v8, [v3 subsampleFactor]);

    double v11 = [(NTKCompanionUltraCubeImageDataDescriptor *)v7 segmentation];
    if ([v11 hasAuxiliaryDictionary]
      && (uint64_t v12 = (CGImage *)[v11 auxiliaryMaskImage]) != 0)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_232E0((CGImage *)[v10 CGImage], v12);
      id v15 = +[UIImage imageWithCGImage:v14 scale:v8 orientation:1.0];
      id v16 = [[NTKUltraCubePreviewCoveragePercentageValidator alloc] initWithMaskImage:v13 orientation:[(NTKCompanionUltraCubeImageDataDescriptor *)v7 orientation]];
      CGImageRelease(v14);
      CGImageRelease(v13);
    }
    else
    {
      id v16 = 0;
      id v15 = 0;
    }
    CGFloat v18 = [v11 auxiliaryDictionary];
    [(_NTKPreviewEditSession *)v4 setAuxiliaryDict:v18];

    long long v19 = [(NTKCompanionUltraCubeImageDataDescriptor *)v7 faceRects];
    [(_NTKPreviewEditSession *)v4 setFaceRects:v19];

    [(_NTKPreviewEditSession *)v4 setOrientation:[(NTKCompanionUltraCubeImageDataDescriptor *)v7 orientation]];
    [(NTKCompanionUltraCubeImageDataDescriptor *)v7 presentationSize];
    -[_NTKPreviewEditSession setPresentationSize:](v4, "setPresentationSize:");
    [(_NTKPreviewEditSession *)v4 setPhotoImage:v10];
    [(_NTKPreviewEditSession *)v4 setPhotoImageMasked:v15];
    [(_NTKPreviewEditSession *)v4 setPreviewValidator:v16];
    long long v20 = [v3 layout];
    id v21 = [v20 copy];
    [(_NTKPreviewEditSession *)v4 setLayout:v21];

    -[_NTKPreviewEditSession setUserAdjusted:](v4, "setUserAdjusted:", [v3 isUserAdjusted]);
    id v17 = v4;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewEditSession, 0);
  objc_storeStrong((id *)&self->_scaledImageCache, 0);
  objc_storeStrong((id *)&self->_orderList, 0);

  objc_storeStrong((id *)&self->_photos, 0);
}

@end