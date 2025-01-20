@interface NTKCompanionUltraCubeImageDataDescriptor
- (BOOL)_initDataAndOrientationFromAsset;
- (BOOL)_initFaceRectsByComputing;
- (BOOL)_initFaceRectsFromAsset;
- (BOOL)isValid;
- (CGAffineTransform)normalizedPresentationTransform;
- (CGAffineTransform)presentationTransform;
- (CGSize)presentationSize;
- (CGSize)storedSize;
- (NSArray)faceRects;
- (NSData)data;
- (NTKCompanionUltraCubeImageDataDescriptor)initWithAsset:(id)a3;
- (NTKImageSource)imageSource;
- (NTKUltraCubeSegmentation)segmentation;
- (PHAsset)asset;
- (unsigned)orientation;
- (void)_loadFaceRegions;
- (void)setImageSource:(id)a3;
- (void)setSegmentation:(id)a3;
@end

@implementation NTKCompanionUltraCubeImageDataDescriptor

- (NTKCompanionUltraCubeImageDataDescriptor)initWithAsset:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NTKCompanionUltraCubeImageDataDescriptor;
  v6 = [(NTKCompanionUltraCubeImageDataDescriptor *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    data = v7->_data;
    v7->_data = 0;

    v7->_orientation = 1;
    CGSize v9 = CGSizeZero;
    v7->_storedSize = CGSizeZero;
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v7->_presentationTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v7->_presentationTransform.c = v11;
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v7->_presentationTransform.tx = v12;
    *(_OWORD *)&v7->_normalizedPresentationTransform.a = v10;
    *(_OWORD *)&v7->_normalizedPresentationTransform.c = v11;
    *(_OWORD *)&v7->_normalizedPresentationTransform.tx = v12;
    v7->_presentationSize = v9;
    faceRects = v7->_faceRects;
    v7->_faceRects = (NSArray *)&__NSArray0__struct;

    v7->_valid = 0;
    if ([(NTKCompanionUltraCubeImageDataDescriptor *)v7 _initDataAndOrientationFromAsset])
    {
      CGFloat v14 = (double)(unint64_t)[v5 pixelWidth];
      id v15 = [v5 pixelHeight];
      v7->_presentationSize.width = v14;
      v7->_presentationSize.height = (double)(unint64_t)v15;
      sub_1B350();
      v7->_storedSize.width = v16;
      v7->_storedSize.height = v17;
      NTKCGImagePropertyOrientationToUIImageOrientation();
      NTKImagePresentationTransform();
      long long v18 = *(_OWORD *)&buf[16];
      *(_OWORD *)&v7->_presentationTransform.a = *(_OWORD *)buf;
      *(_OWORD *)&v7->_presentationTransform.c = v18;
      *(_OWORD *)&v7->_presentationTransform.tx = v25;
      NTKImagePresentationTransform();
      long long v19 = *(_OWORD *)&buf[16];
      *(_OWORD *)&v7->_normalizedPresentationTransform.a = *(_OWORD *)buf;
      *(_OWORD *)&v7->_normalizedPresentationTransform.c = v19;
      *(_OWORD *)&v7->_normalizedPresentationTransform.tx = v25;
      [(NTKCompanionUltraCubeImageDataDescriptor *)v7 _loadFaceRegions];
      v7->_valid = 1;
    }
    else
    {
      v20 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [(PHAsset *)v7->_asset localIdentifier];
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[NTKCompanionUltraCubeImageDataDescriptor initWithAsset:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%s: Cannot read image data from asset %@", buf, 0x16u);
      }
    }
  }

  return v7;
}

- (NTKUltraCubeSegmentation)segmentation
{
  segmentation = self->_segmentation;
  if (!segmentation)
  {
    v4 = [(NTKCompanionUltraCubeImageDataDescriptor *)self imageSource];
    if (!v4) {
      goto LABEL_5;
    }
    id v5 = v4;
    v6 = +[NTKUltraCubeSegmentationGenerator segmentationFromImageSource:v4 faceRects:self->_faceRects orientation:self->_orientation];
    v7 = self->_segmentation;
    self->_segmentation = v6;

    segmentation = self->_segmentation;
  }
  v4 = segmentation;
LABEL_5:

  return v4;
}

- (BOOL)_initDataAndOrientationFromAsset
{
  id v3 = objc_alloc_init((Class)PHImageRequestOptions);
  [v3 setVersion:0];
  [v3 setDeliveryMode:1];
  [v3 setNetworkAccessAllowed:1];
  [v3 setSynchronous:1];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_73E8;
  v31 = sub_73F8;
  id v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 1;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_73E8;
  v21 = sub_73F8;
  id v22 = 0;
  v4 = +[PHImageManager defaultManager];
  asset = self->_asset;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_7400;
  v16[3] = &unk_48D38;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = &v27;
  v16[7] = &v23;
  [v4 requestImageDataAndOrientationForAsset:asset options:v3 resultHandler:v16];

  v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(PHAsset *)self->_asset localIdentifier];
    id v8 = [(id)v28[5] length];
    CGSize v9 = +[PHAsset originalUniformTypeIdentifierForAsset:self->_asset];
    *(_DWORD *)buf = 136315906;
    v34 = "-[NTKCompanionUltraCubeImageDataDescriptor _initDataAndOrientationFromAsset]";
    __int16 v35 = 2112;
    NSUInteger v36 = (NSUInteger)v7;
    __int16 v37 = 2048;
    id v38 = v8;
    __int16 v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s: f == %@, size == %ld bytes, type == %@", buf, 0x2Au);
  }
  long long v10 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v11 = [(PHAsset *)self->_asset pixelWidth];
    NSUInteger v12 = [(PHAsset *)self->_asset pixelHeight];
    v13 = (void *)*((unsigned int *)v24 + 6);
    *(_DWORD *)buf = 134218496;
    v34 = (const char *)v11;
    __int16 v35 = 2048;
    NSUInteger v36 = v12;
    __int16 v37 = 2048;
    id v38 = v13;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "w == %ld, h == %ld, o == %ld", buf, 0x20u);
  }

  objc_storeStrong((id *)&self->_data, (id)v28[5]);
  self->_orientation = *((_DWORD *)v24 + 6);
  BOOL v14 = v18[5] == 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (void)_loadFaceRegions
{
  if (![(NTKCompanionUltraCubeImageDataDescriptor *)self _initFaceRectsFromAsset]
    && ![(NTKCompanionUltraCubeImageDataDescriptor *)self _initFaceRectsByComputing])
  {
    id v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(PHAsset *)self->_asset localIdentifier];
      int v5 = 136315394;
      v6 = "-[NTKCompanionUltraCubeImageDataDescriptor _loadFaceRegions]";
      __int16 v7 = 2112;
      id v8 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s: No face data in asset %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (BOOL)_initFaceRectsFromAsset
{
  id v3 = +[PHFace fetchFacesInAsset:self->_asset options:0];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  CGFloat height = self->_presentationSize.height;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v41;
    long long v36 = 0x8200502uLL;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(obj);
        }
        CGSize v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_msgSend(v9, "size", v36);
        double width = self->_presentationSize.width;
        if (width < self->_presentationSize.height) {
          double width = self->_presentationSize.height;
        }
        double v12 = v10 * width;
        [v9 centerX];
        double v14 = fmax(v12 * -0.5 + v13 * self->_presentationSize.width, 0.0);
        [v9 centerY];
        double v15 = self->_presentationSize.width;
        double v16 = self->_presentationSize.height;
        double v18 = fmax(v12 * -0.5 + v17 * v16, 0.0);
        if (v12 >= v15 - v14) {
          double v19 = v15 - v14;
        }
        else {
          double v19 = v12;
        }
        *(void *)v44 = 0x3FF0000000000000;
        *(void *)&v44[8] = 0;
        *(void *)&v44[16] = 0;
        if (v12 >= v16 - v18) {
          double v20 = v16 - v18;
        }
        else {
          double v20 = v12;
        }
        *(_OWORD *)&v44[24] = xmmword_44270;
        *(CGFloat *)&v44[40] = height;
        double v21 = v14;
        CGRect v46 = CGRectApplyAffineTransform(*(CGRect *)(&v18 - 1), (CGAffineTransform *)v44);
        CGFloat x = v46.origin.x;
        CGFloat y = v46.origin.y;
        CGFloat v24 = v46.size.width;
        CGFloat v25 = v46.size.height;
        *(float *)&v46.origin.CGFloat x = v15;
        *(float *)&v46.origin.CGFloat y = v16;
        CGAffineTransformMakeScale(&v39, (float)(1.0 / *(float *)&v46.origin.x), (float)(1.0 / *(float *)&v46.origin.y));
        v47.origin.CGFloat x = x;
        v47.origin.CGFloat y = y;
        v47.size.double width = v24;
        v47.size.CGFloat height = v25;
        CGRect v48 = CGRectApplyAffineTransform(v47, &v39);
        double v26 = v48.origin.x;
        double v27 = v48.origin.y;
        double v28 = v48.size.width;
        double v29 = v48.size.height;
        v30 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v44 = v36;
          *(void *)&v44[4] = "-[NTKCompanionUltraCubeImageDataDescriptor _initFaceRectsFromAsset]";
          *(_WORD *)&v44[12] = 2048;
          *(double *)&v44[14] = v26;
          *(_WORD *)&v44[22] = 2048;
          *(double *)&v44[24] = v27;
          *(_WORD *)&v44[32] = 2048;
          *(double *)&v44[34] = v28;
          *(_WORD *)&v44[42] = 2048;
          *(double *)&v44[44] = v29;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "%s: { %.2f, %.2f, %.2f, %.2f }", v44, 0x34u);
        }

        v31 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", v26, v27, v28, v29);
        [v4 addObject:v31];
      }
      id v6 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v6);
  }

  if ([v4 count])
  {
    id v32 = v4;
    p_super = &self->_faceRects->super;
    self->_faceRects = v32;
  }
  else
  {
    p_super = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v44 = 136315138;
      *(void *)&v44[4] = "-[NTKCompanionUltraCubeImageDataDescriptor _initFaceRectsFromAsset]";
      _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, "%s: No PHFace data in asset", v44, 0xCu);
    }
  }

  BOOL v34 = [v4 count] != 0;
  return v34;
}

- (BOOL)_initFaceRectsByComputing
{
  id v3 = [(NTKCompanionUltraCubeImageDataDescriptor *)self imageSource];
  v4 = v3;
  if (v3)
  {
    id v5 = (CGImage *)[v3 CreateCGImageWithSubsampleFactor:1];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = NTKUltraCubeComputeFaceRectsForCGImage((uint64_t)v5, self->_orientation);
      if ([v7 count])
      {
        objc_storeStrong((id *)&self->_faceRects, v7);
      }
      else
      {
        id v8 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315138;
          NSUInteger v11 = "-[NTKCompanionUltraCubeImageDataDescriptor _initFaceRectsByComputing]";
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s: No face rectangles in image data", (uint8_t *)&v10, 0xCu);
        }
      }
      CGImageRelease(v6);
      LOBYTE(v6) = [v7 count] != 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (NTKImageSource)imageSource
{
  imageSource = self->_imageSource;
  if (!imageSource)
  {
    v4 = +[NTKImageSource imageSourceWithData:self->_data];
    id v5 = self->_imageSource;
    self->_imageSource = v4;

    imageSource = self->_imageSource;
  }

  return imageSource;
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (CGSize)storedSize
{
  objc_copyStruct(v4, &self->_storedSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.double width = v2;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (CGAffineTransform)presentationTransform
{
  objc_copyStruct(retstr, &self->_presentationTransform, 48, 1, 0);
  return result;
}

- (CGAffineTransform)normalizedPresentationTransform
{
  objc_copyStruct(retstr, &self->_normalizedPresentationTransform, 48, 1, 0);
  return result;
}

- (CGSize)presentationSize
{
  objc_copyStruct(v4, &self->_presentationSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.double width = v2;
  return result;
}

- (NSArray)faceRects
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setSegmentation:(id)a3
{
}

- (void)setImageSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSource, 0);
  objc_storeStrong((id *)&self->_segmentation, 0);
  objc_storeStrong((id *)&self->_faceRects, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end