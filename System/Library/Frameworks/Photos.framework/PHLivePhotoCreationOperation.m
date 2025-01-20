@interface PHLivePhotoCreationOperation
- (BOOL)prefersHDR;
- (CGSize)targetSize;
- (NSArray)resourceURLs;
- (PHLivePhotoCreationOperation)initWithResourceURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 prefersHDR:(BOOL)a6 resultHandler:(id)a7;
- (id)_createImageOnlyLivePhotoWithImageURL:(id)a3;
- (id)resultHandler;
- (int64_t)contentMode;
- (void)main;
@end

@implementation PHLivePhotoCreationOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);

  objc_storeStrong((id *)&self->_resourceURLs, 0);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (BOOL)prefersHDR
{
  return self->_prefersHDR;
}

- (NSArray)resourceURLs
{
  return self->_resourceURLs;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_createImageOnlyLivePhotoWithImageURL:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PHLivePhotoCreationOperation *)self contentMode];
  [(PHLivePhotoCreationOperation *)self targetSize];
  double v7 = v6;
  double v9 = v8;
  [(PHLivePhotoCreationOperation *)self prefersHDR];
  v10 = DCIM_newPLImageWithContentsOfFileURL();
  DCIM_sizeFromPLImage();
  if ((v7 != *MEMORY[0x1E4F1DB30] || v9 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) && (v11 > v7 || v12 > v9))
  {
    if (v5 == 1) {
      DCIM_sizeScaleToFillSize();
    }
    else {
      DCIM_sizeScaleToFitSize();
    }
    DCIM_sizeScale();
    MEMORY[0x19F388500](v10);
    uint64_t v15 = DCIM_scaleImageFromURL();

    v10 = (void *)v15;
  }
  v16 = [PHLivePhoto alloc];
  uint64_t v17 = DCIM_CGImageRefFromPLImage();
  uint64_t v18 = MEMORY[0x19F388500](v10);
  long long v21 = *MEMORY[0x1E4F1F9F8];
  uint64_t v22 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v19 = [(PHLivePhoto *)v16 initWithImage:v17 uiOrientation:v18 videoAsset:0 photoTime:&v21 asset:0];

  return v19;
}

- (void)main
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PHLivePhotoCreationOperation *)self resourceURLs];
  id v4 = [(PHLivePhotoCreationOperation *)self resultHandler];
  id v29 = 0;
  id v30 = 0;
  id v28 = 0;
  BOOL v5 = +[PHLivePhoto _identifyResourceURLs:v3 outImageURL:&v30 outVideoURL:&v29 error:&v28];
  id v6 = v30;
  id v7 = v29;
  id v8 = v28;
  id v9 = 0;
  if (v5)
  {
    if ([(PHLivePhotoCreationOperation *)self isCancelled])
    {
      id v9 = 0;
    }
    else
    {
      v10 = [(PHLivePhotoCreationOperation *)self _createImageOnlyLivePhotoWithImageURL:v6];
      v35 = @"PHLivePhotoInfoIsDegradedKey";
      v36[0] = MEMORY[0x1E4F1CC38];
      double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      ((void (**)(void, void *, void *, void))v4)[2](v4, v10, v11, 0);

      if ([(PHLivePhotoCreationOperation *)self isCancelled])
      {
        id v9 = 0;
      }
      else
      {
        v26 = v10;
        double v12 = [v7 path];
        v27[1] = 0;
        v13 = PFVideoComplementMetadataForVideoAtPath();
        id v14 = 0;

        v27[0] = v14;
        BOOL v15 = +[PHLivePhoto _canCreateLivePhotoWithURLs:v3 videoComplementMetadata:v13 outError:v27];
        id v25 = v27[0];

        id v9 = 0;
        if (v15)
        {
          if ([(PHLivePhotoCreationOperation *)self isCancelled])
          {
            id v9 = 0;
          }
          else
          {
            v16 = [PHLivePhoto alloc];
            [(PHLivePhotoCreationOperation *)self targetSize];
            id v9 = -[PHLivePhoto _initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:prefersHDR:](v16, "_initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:prefersHDR:", v6, v7, v13, [(PHLivePhotoCreationOperation *)self contentMode], [(PHLivePhotoCreationOperation *)self prefersHDR], v17, v18);
          }
        }

        v10 = v26;
      }
    }
  }
  if (v8)
  {
    v33[0] = @"PHLivePhotoInfoCancelledKey";
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[PHLivePhotoCreationOperation isCancelled](self, "isCancelled"));
    v33[1] = @"PHLivePhotoInfoErrorKey";
    v34[0] = v19;
    v34[1] = v8;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    long long v21 = (void **)v34;
    uint64_t v22 = (__CFString **)v33;
    uint64_t v23 = 2;
  }
  else
  {
    v31 = @"PHLivePhotoInfoCancelledKey";
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[PHLivePhotoCreationOperation isCancelled](self, "isCancelled"));
    v32 = v19;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    long long v21 = &v32;
    uint64_t v22 = &v31;
    uint64_t v23 = 1;
  }
  v24 = objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23, v25);

  ((void (**)(void, id, void *, uint64_t))v4)[2](v4, v9, v24, 1);
}

- (PHLivePhotoCreationOperation)initWithResourceURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 prefersHDR:(BOOL)a6 resultHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PHLivePhotoCreationOperation;
  BOOL v15 = [(PHLivePhotoCreationOperation *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    resourceURLs = v15->_resourceURLs;
    v15->_resourceURLs = (NSArray *)v16;

    v15->_contentMode = a5;
    uint64_t v18 = [v14 copy];
    id resultHandler = v15->_resultHandler;
    v15->_id resultHandler = (id)v18;

    v15->_targetSize.CGFloat width = width;
    v15->_targetSize.CGFloat height = height;
    v15->_prefersHDR = a6;
  }

  return v15;
}

@end