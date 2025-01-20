@interface CNPhotosPosterConfigurationReader
+ (id)compoundLayerStackFromURL:(id)a3;
+ (id)faceRectsFromUserInfo:(id)a3;
+ (id)facesFromConfiguration:(id)a3;
+ (id)userInfoFromConfiguration:(id)a3;
- (BOOL)hasFaceRectInPosterSnapshot;
- (CGRect)denormalizeFaceRect:(CGRect)a3 toOriginalImageSize:(CGSize)a4;
- (CGRect)faceRect:(CGRect)a3 forFullExtentImageSize:(CGSize)a4 fromOriginalImageSize:(CGSize)a5 zoomOut:(BOOL)a6;
- (CGRect)faceRectInPosterSnapshot;
- (CGRect)fullExtentPreviewImageFaceRect;
- (CGRect)fullExtentPreviewImageFaceRectFromConfiguration;
- (CGRect)transformFaceRectToTopLeftOrigin:(CGRect)a3 withSize:(CGSize)a4;
- (CGSize)fullExtentPreviewImageSize;
- (CNPhotosPosterConfigurationReader)initWithPosterConfiguration:(id)a3;
- (NSData)fullExtentPreviewImageData;
- (NSURL)wallpaperURL;
- (PFPosterConfiguration)photosConfiguration;
- (double)faceRectInPosterSnapshotPercentFromTop;
- (id)faceRectInPosterSnapshotFromConfiguration;
- (id)fullExtentPreviewImageDataFromConfiguration;
- (void)setFaceRectInPosterSnapshot:(CGRect)a3;
- (void)setFaceRectInPosterSnapshotPercentFromTop:(double)a3;
- (void)setFullExtentPreviewImageData:(id)a3;
- (void)setFullExtentPreviewImageFaceRect:(CGRect)a3;
- (void)setFullExtentPreviewImageSize:(CGSize)a3;
- (void)setPhotosConfiguration:(id)a3;
- (void)setWallpaperURL:(id)a3;
@end

@implementation CNPhotosPosterConfigurationReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullExtentPreviewImageData, 0);
  objc_storeStrong((id *)&self->_wallpaperURL, 0);

  objc_storeStrong((id *)&self->_photosConfiguration, 0);
}

- (void)setFaceRectInPosterSnapshotPercentFromTop:(double)a3
{
  self->_faceRectInPosterSnapshotPercentFromTop = a3;
}

- (void)setFaceRectInPosterSnapshot:(CGRect)a3
{
  self->_faceRectInPosterSnapshot = a3;
}

- (void)setFullExtentPreviewImageFaceRect:(CGRect)a3
{
  self->_fullExtentPreviewImageFaceRect = a3;
}

- (void)setFullExtentPreviewImageSize:(CGSize)a3
{
  self->_fullExtentPreviewImageSize = a3;
}

- (void)setFullExtentPreviewImageData:(id)a3
{
}

- (void)setWallpaperURL:(id)a3
{
}

- (NSURL)wallpaperURL
{
  return self->_wallpaperURL;
}

- (void)setPhotosConfiguration:(id)a3
{
}

- (PFPosterConfiguration)photosConfiguration
{
  return self->_photosConfiguration;
}

- (CGRect)transformFaceRectToTopLeftOrigin:(CGRect)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  CGFloat v5 = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 1.0, -1.0);
  CGAffineTransform v9 = v11;
  CGAffineTransformTranslate(&v10, &v9, 0.0, -height);
  CGAffineTransform v11 = v10;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.double height = v5;
  return CGRectApplyAffineTransform(v12, &v10);
}

- (CGRect)denormalizeFaceRect:(CGRect)a3 toOriginalImageSize:(CGSize)a4
{
  double v4 = a3.origin.x * a4.width;
  double v5 = a3.origin.y * a4.height;
  double v6 = a3.size.width * a4.width;
  double v7 = a3.size.height * a4.height;
  result.size.double height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (id)faceRectInPosterSnapshotFromConfiguration
{
  v3 = objc_opt_class();
  double v4 = [(CNPhotosPosterConfigurationReader *)self photosConfiguration];
  double v5 = [v3 facesFromConfiguration:v4];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    double v6 = 0;
  }
  else
  {
    double v7 = objc_opt_class();
    v8 = [(CNPhotosPosterConfigurationReader *)self wallpaperURL];
    CGAffineTransform v9 = [v7 compoundLayerStackFromURL:v8];

    if (v9)
    {
      CGAffineTransform v10 = [v9 portraitLayerStack];
      CGAffineTransform v11 = v10;
      if (v10)
      {
        CGRect v12 = [v10 backgroundLayer];
        objc_opt_class();
        v13 = v12;
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
        v15 = v14;

        v16 = (__CVBuffer *)[v15 image];
        double Width = (double)CVPixelBufferGetWidth(v16);
        double Height = (double)CVPixelBufferGetHeight(v16);
        v19 = [v11 layout];
        [v19 imageSize];
        double v21 = v20;
        double v23 = v22;
        [v19 visibleFrame];
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        CFDictionaryRef v32 = [v5 firstObject];
        memset(&v46, 0, sizeof(v46));
        CGRectMakeWithDictionaryRepresentation(v32, &v46);
        -[CNPhotosPosterConfigurationReader denormalizeFaceRect:toOriginalImageSize:](self, "denormalizeFaceRect:toOriginalImageSize:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size, v21, v23);
        v46.origin.CGFloat x = Width / v29 * (v33 - v25);
        v46.origin.CGFloat y = Height / v31 * (v34 - v27);
        v46.size.CGFloat width = Width / v29 * v35;
        v46.size.double height = Height / v31 * v36;
        [(CNPhotosPosterConfigurationReader *)self transformFaceRectToTopLeftOrigin:*(_OWORD *)&v46.origin withSize:*(_OWORD *)&v46.size];
        objc_msgSend(MEMORY[0x1E4F5A420], "squareCropRect:toFitSize:", v37, v38, v39, v40);
        v46.origin.CGFloat x = v41;
        v46.origin.CGFloat y = v42;
        v46.size.CGFloat width = v43;
        v46.size.double height = v44;
        double v6 = objc_alloc_init(CNPhotosPosterConfigurationReaderFaceRectResult);
        [(CNPhotosPosterConfigurationReaderFaceRectResult *)v6 setPercentFromTop:v46.origin.y / Height];
        -[CNPhotosPosterConfigurationReaderFaceRectResult setFaceRect:](v6, "setFaceRect:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);
      }
      else
      {
        v13 = CNUILogPosters();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v46.origin.x) = 0;
          _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Could not load portrait layer stack", (uint8_t *)&v46, 2u);
        }
        double v6 = 0;
      }
    }
    else
    {
      double v6 = 0;
    }
  }

  return v6;
}

- (BOOL)hasFaceRectInPosterSnapshot
{
  [(CNPhotosPosterConfigurationReader *)self faceRectInPosterSnapshot];
  CGFloat x = v7.origin.x;
  CGFloat y = v7.origin.y;
  CGFloat width = v7.size.width;
  CGFloat height = v7.size.height;
  if (CGRectEqualToRect(v7, *MEMORY[0x1E4F1DB28])) {
    return 0;
  }
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return !CGRectIsNull(v8);
}

- (double)faceRectInPosterSnapshotPercentFromTop
{
  double faceRectInPosterSnapshotPercentFromTop = self->_faceRectInPosterSnapshotPercentFromTop;
  if (faceRectInPosterSnapshotPercentFromTop == 0.0)
  {
    double v4 = [(CNPhotosPosterConfigurationReader *)self faceRectInPosterSnapshotFromConfiguration];
    [v4 faceRect];
    self->_faceRectInPosterSnapshot.origin.CGFloat x = v5;
    self->_faceRectInPosterSnapshot.origin.CGFloat y = v6;
    self->_faceRectInPosterSnapshot.size.CGFloat width = v7;
    self->_faceRectInPosterSnapshot.size.CGFloat height = v8;
    [v4 percentFromTop];
    double faceRectInPosterSnapshotPercentFromTop = v9;
    self->_double faceRectInPosterSnapshotPercentFromTop = v9;
  }
  return faceRectInPosterSnapshotPercentFromTop;
}

- (CGRect)faceRectInPosterSnapshot
{
  if (CGRectEqualToRect(self->_faceRectInPosterSnapshot, *MEMORY[0x1E4F1DB28]))
  {
    v3 = [(CNPhotosPosterConfigurationReader *)self faceRectInPosterSnapshotFromConfiguration];
    [v3 faceRect];
    self->_faceRectInPosterSnapshot.origin.CGFloat x = v4;
    self->_faceRectInPosterSnapshot.origin.CGFloat y = v5;
    self->_faceRectInPosterSnapshot.size.CGFloat width = v6;
    self->_faceRectInPosterSnapshot.size.CGFloat height = v7;
    [v3 percentFromTop];
    self->_double faceRectInPosterSnapshotPercentFromTop = v8;
    CGFloat x = self->_faceRectInPosterSnapshot.origin.x;
    CGFloat y = self->_faceRectInPosterSnapshot.origin.y;
    CGFloat width = self->_faceRectInPosterSnapshot.size.width;
    CGFloat height = self->_faceRectInPosterSnapshot.size.height;
  }
  else
  {
    CGFloat x = self->_faceRectInPosterSnapshot.origin.x;
    CGFloat y = self->_faceRectInPosterSnapshot.origin.y;
    CGFloat width = self->_faceRectInPosterSnapshot.size.width;
    CGFloat height = self->_faceRectInPosterSnapshot.size.height;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)faceRect:(CGRect)a3 forFullExtentImageSize:(CGSize)a4 fromOriginalImageSize:(CGSize)a5 zoomOut:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.height;
  double v10 = a4.width;
  -[CNPhotosPosterConfigurationReader denormalizeFaceRect:toOriginalImageSize:](self, "denormalizeFaceRect:toOriginalImageSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.width, a5.height);
  -[CNPhotosPosterConfigurationReader transformFaceRectToTopLeftOrigin:withSize:](self, "transformFaceRectToTopLeftOrigin:withSize:");
  if (width != v10 || height != v9)
  {
    double v12 = v10 / width * v12;
    double v13 = v10 / width * v13;
    double v14 = v10 / width * v14;
    double v15 = v10 / width * v15;
  }
  if (v6)
  {
    double v14 = v14 * 3.0;
    double v17 = v15 * 3.0;
    if (v14 >= v17) {
      double v14 = v17;
    }
    double v12 = v12 - v14 * 0.3;
    double v13 = v13 - v14 * 0.3;
    double v15 = v14;
  }
  v18 = (void *)MEMORY[0x1E4F5A420];

  objc_msgSend(v18, "squareCropRect:toFitSize:", v12, v13, v14, v15, v10, v9);
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)fullExtentPreviewImageFaceRectFromConfiguration
{
  v3 = objc_opt_class();
  CGFloat v4 = [(CNPhotosPosterConfigurationReader *)self photosConfiguration];
  CGFloat v5 = [v3 facesFromConfiguration:v4];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v10 = objc_opt_class();
    CGAffineTransform v11 = [(CNPhotosPosterConfigurationReader *)self wallpaperURL];
    double v12 = [v10 compoundLayerStackFromURL:v11];

    if (v12)
    {
      double v13 = [v12 layout];
      [v13 imageSize];
      double v15 = v14;
      double v17 = v16;
      CFDictionaryRef v18 = [v5 firstObject];
      memset(&v29, 0, sizeof(v29));
      CGRectMakeWithDictionaryRepresentation(v18, &v29);
      [(CNPhotosPosterConfigurationReader *)self fullExtentPreviewImageSize];
      -[CNPhotosPosterConfigurationReader faceRect:forFullExtentImageSize:fromOriginalImageSize:zoomOut:](self, "faceRect:forFullExtentImageSize:fromOriginalImageSize:zoomOut:", 1, *(_OWORD *)&v29.origin, *(_OWORD *)&v29.size, v19, v20, v15, v17);
      double v6 = v21;
      double v7 = v22;
      double v8 = v23;
      double v9 = v24;
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DB28];
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  double v25 = v6;
  double v26 = v7;
  double v27 = v8;
  double v28 = v9;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)fullExtentPreviewImageDataFromConfiguration
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v3 = (void *)getPISegmentationClass_softClass;
  uint64_t v19 = getPISegmentationClass_softClass;
  if (!getPISegmentationClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    double v21 = __getPISegmentationClass_block_invoke;
    double v22 = &unk_1E549AD00;
    double v23 = &v16;
    __getPISegmentationClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v17[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v16, 8);
  CGFloat v5 = [(CNPhotosPosterConfigurationReader *)self wallpaperURL];
  id v15 = 0;
  double v6 = (CGImage *)[v4 createFullExtentPreviewImageForWallpaperAtURL:v5 error:&v15];
  id v7 = v15;

  if (v6)
  {
    double v8 = (__CFData *)objc_opt_new();
    double v9 = CGImageDestinationCreateWithData(v8, @"public.jpeg", 1uLL, 0);
    CGImageDestinationAddImage(v9, v6, 0);
    CGImageDestinationFinalize(v9);
    if (v9) {
      CFRelease(v9);
    }
    size_t Width = CGImageGetWidth(v6);
    size_t Height = CGImageGetHeight(v6);
    CFRelease(v6);
    double v12 = objc_alloc_init(CNPhotosPosterConfigurationReaderPreviewImageResult);
    double v13 = (void *)[(__CFData *)v8 copy];
    [(CNPhotosPosterConfigurationReaderPreviewImageResult *)v12 setImageData:v13];

    -[CNPhotosPosterConfigurationReaderPreviewImageResult setImageSize:](v12, "setImageSize:", (double)Width, (double)Height);
  }
  else
  {
    CNUILogPosters();
    double v8 = (__CFData *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_18B625000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "[PISegmentation createFullSizePreviewImageForWallpaperAtURL:error:] failed: %@", (uint8_t *)&buf, 0xCu);
    }
    double v12 = 0;
  }

  return v12;
}

- (CGRect)fullExtentPreviewImageFaceRect
{
  if (CGRectEqualToRect(self->_fullExtentPreviewImageFaceRect, *MEMORY[0x1E4F1DB28]))
  {
    [(CNPhotosPosterConfigurationReader *)self fullExtentPreviewImageFaceRectFromConfiguration];
    self->_fullExtentPreviewImageFaceRect.origin.double x = x;
    self->_fullExtentPreviewImageFaceRect.origin.double y = y;
    self->_fullExtentPreviewImageFaceRect.size.double width = width;
    self->_fullExtentPreviewImageFaceRect.size.double height = height;
  }
  else
  {
    double width = self->_fullExtentPreviewImageFaceRect.size.width;
    double height = self->_fullExtentPreviewImageFaceRect.size.height;
    double x = self->_fullExtentPreviewImageFaceRect.origin.x;
    double y = self->_fullExtentPreviewImageFaceRect.origin.y;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)fullExtentPreviewImageSize
{
  double width = self->_fullExtentPreviewImageSize.width;
  double height = self->_fullExtentPreviewImageSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v6 = [(CNPhotosPosterConfigurationReader *)self fullExtentPreviewImageDataFromConfiguration];
    id v7 = [v6 imageData];
    fullExtentPreviewImageData = self->_fullExtentPreviewImageData;
    self->_fullExtentPreviewImageData = v7;

    [v6 imageSize];
    double width = v9;
    double height = v10;
    self->_fullExtentPreviewImageSize.double width = v9;
    self->_fullExtentPreviewImageSize.double height = v10;
  }
  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (NSData)fullExtentPreviewImageData
{
  v3 = self->_fullExtentPreviewImageData;
  if (!v3)
  {
    id v4 = [(CNPhotosPosterConfigurationReader *)self fullExtentPreviewImageDataFromConfiguration];
    CGFloat v5 = [v4 imageData];
    fullExtentPreviewImageData = self->_fullExtentPreviewImageData;
    self->_fullExtentPreviewImageData = v5;

    [v4 imageSize];
    self->_fullExtentPreviewImageSize.double width = v7;
    self->_fullExtentPreviewImageSize.double height = v8;
    v3 = self->_fullExtentPreviewImageData;
  }

  return v3;
}

- (CNPhotosPosterConfigurationReader)initWithPosterConfiguration:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNPhotosPosterConfigurationReader;
  double v6 = [(CNPhotosPosterConfigurationReader *)&v21 init];
  if (v6)
  {
    CGFloat v7 = [v5 assetDirectory];
    id v20 = 0;
    CGFloat v8 = [MEMORY[0x1E4F8CCF8] loadFromURL:v7 error:&v20];
    id v9 = v20;
    if (v8)
    {
      objc_storeStrong((id *)&v6->_photosConfiguration, v8);
      CGFloat v10 = [v8 media];
      uint64_t v11 = [v10 count];

      if (v11 != 1)
      {
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2 object:v6 file:@"CNPhotosPosterConfigurationReader.m" lineNumber:70 description:@"ERROR: expected the poster config to have exactly one media"];
      }
      double v12 = [v8 media];
      double v13 = [v12 objectAtIndexedSubscript:0];

      double v14 = [v13 subpath];
      id v15 = [v7 URLByAppendingPathComponent:v14];

      if (v15)
      {
        objc_storeStrong((id *)&v6->_wallpaperURL, v15);
        uint64_t v16 = v6;
      }
      else
      {
        double v17 = CNUILogPosters();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v23 = v5;
          _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, "Error finding wallpaper URL for posterConfig: %@", buf, 0xCu);
        }

        uint64_t v16 = 0;
      }
    }
    else
    {
      double v13 = CNUILogPosters();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v23 = v7;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Failed to load photos poster config at %@: error %@", buf, 0x16u);
      }
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)facesFromConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() userInfoFromConfiguration:v3];

  if (v4)
  {
    id v5 = [(id)objc_opt_class() faceRectsFromUserInfo:v4];
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))()) {
      id v6 = (id)MEMORY[0x1E4F1CBF0];
    }
    else {
      id v6 = v5;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

+ (id)faceRectsFromUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"regions"];
  id v5 = [v4 objectForKeyedSubscript:@"faces"];

  uint64_t v6 = *MEMORY[0x1E4F5A258];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v5))
  {
    CGFloat v7 = [v3 objectForKeyedSubscript:@"regions"];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"pets"];

    id v5 = (void *)v8;
  }
  if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5))
  {
    id v9 = CNUILogPosters();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v12 = 0;
      _os_log_debug_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEBUG, "No face rect found, userInfo contained no faces", v12, 2u);
    }

    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

+ (id)compoundLayerStackFromURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v4 = (void *)getPISegmentationLoaderClass_softClass;
  uint64_t v15 = getPISegmentationLoaderClass_softClass;
  if (!getPISegmentationLoaderClass_softClass)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPISegmentationLoaderClass_block_invoke;
    double v17 = &unk_1E549AD00;
    uint64_t v18 = &v12;
    __getPISegmentationLoaderClass_block_invoke((uint64_t)buf);
    id v4 = (void *)v13[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v12, 8);
  id v11 = 0;
  uint64_t v6 = [v5 loadCompoundLayerStackFromWallpaperURL:v3 options:0 error:&v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = CNUILogPosters();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "Could not could not load layer stack at %@: error %@", buf, 0x16u);
    }
  }

  return v6;
}

+ (id)userInfoFromConfiguration:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = CNUILogPosters();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "Could not find poster configuration userInfo", v8, 2u);
    }
  }

  return v4;
}

@end