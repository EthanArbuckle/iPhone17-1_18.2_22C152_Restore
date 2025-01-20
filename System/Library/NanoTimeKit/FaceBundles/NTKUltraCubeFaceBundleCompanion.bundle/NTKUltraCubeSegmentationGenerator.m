@interface NTKUltraCubeSegmentationGenerator
+ (id)segmentationFromImageSource:(id)a3 faceRects:(id)a4 orientation:(unsigned int)a5;
- (NTKUltraCubeSegmentationGenerator)init;
- (id)_classifyImage;
- (id)_computeSegmentationAuxiliaryDictionary;
- (id)_computeSegmentationForImageRequestHandler:(id)a3 ofQuality:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 releaseCachedResources:(BOOL)a7;
- (id)_computeThresholdAuxiliaryDictionaryIfEnabled;
- (id)_createThresholdSegmentationFromDisparityData:(id)a3;
- (id)_extractDisparityData;
- (id)_extractPortraitEffectsMatteIfSupported;
- (id)_retrieveAuxiliaryDictionary;
- (id)segmentationFromImageSource:(id)a3 faceRects:(id)a4 orientation:(unsigned int)a5;
- (unint64_t)_identifySegmentationType;
@end

@implementation NTKUltraCubeSegmentationGenerator

+ (id)segmentationFromImageSource:(id)a3 faceRects:(id)a4 orientation:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(NTKUltraCubeSegmentationGenerator);
  v10 = [(NTKUltraCubeSegmentationGenerator *)v9 segmentationFromImageSource:v8 faceRects:v7 orientation:v5];

  return v10;
}

- (NTKUltraCubeSegmentationGenerator)init
{
  v12.receiver = self;
  v12.super_class = (Class)NTKUltraCubeSegmentationGenerator;
  v2 = [(NTKUltraCubeSegmentationGenerator *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSSet setWithArray:&off_4B530];
    personIdentifiers = v2->_personIdentifiers;
    v2->_personIdentifiers = (NSSet *)v3;

    uint64_t v5 = +[NSSet setWithArray:&off_4B548];
    animalIdentifiers = v2->_animalIdentifiers;
    v2->_animalIdentifiers = (NSSet *)v5;

    uint64_t v7 = +[NSSet setWithArray:&off_4B560];
    cityscapeIdentifiers = v2->_cityscapeIdentifiers;
    v2->_cityscapeIdentifiers = (NSSet *)v7;

    uint64_t v9 = +[NSSet setWithArray:&off_4B578];
    landscapeIdentifiers = v2->_landscapeIdentifiers;
    v2->_landscapeIdentifiers = (NSSet *)v9;
  }
  return v2;
}

- (id)segmentationFromImageSource:(id)a3 faceRects:(id)a4 orientation:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_imageSource, a3);
  objc_storeStrong((id *)&self->_faceRects, a4);
  self->_orientation = a5;
  self->_identifiedType = [(NTKUltraCubeSegmentationGenerator *)self _identifySegmentationType];
  objc_super v12 = [(NTKUltraCubeSegmentationGenerator *)self _retrieveAuxiliaryDictionary];
  faceRects = self->_faceRects;
  self->_faceRects = 0;

  self->_orientation = 1;
  v14 = +[VNSession globalSession];
  [v14 releaseCachedResources];

  v15 = [[NTKUltraCubeSegmentation alloc] initWithType:self->_identifiedType dictionary:v12];

  return v15;
}

- (id)_retrieveAuxiliaryDictionary
{
  unint64_t identifiedType = self->_identifiedType;
  v4 = _NTKLoggingObjectForDomain();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (identifiedType)
  {
    if (v5)
    {
      int v15 = 136315138;
      v16 = "-[NTKUltraCubeSegmentationGenerator _retrieveAuxiliaryDictionary]";
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s: check if data contains portrait effects matte", (uint8_t *)&v15, 0xCu);
    }

    v6 = [(NTKUltraCubeSegmentationGenerator *)self _extractPortraitEffectsMatteIfSupported];
    v4 = v6;
    if (v6)
    {
      self->_unint64_t identifiedType = 1;
      v4 = v6;
      uint64_t v7 = v4;
    }
    else
    {
      id v8 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        v16 = "-[NTKUltraCubeSegmentationGenerator _retrieveAuxiliaryDictionary]";
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s: no existing matte data; try to compute our own segmentation data",
          (uint8_t *)&v15,
          0xCu);
      }

      id v9 = [(NTKUltraCubeSegmentationGenerator *)self _computeSegmentationAuxiliaryDictionary];
      id v10 = _NTKLoggingObjectForDomain();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          int v15 = 136315138;
          v16 = "-[NTKUltraCubeSegmentationGenerator _retrieveAuxiliaryDictionary]";
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s: successfully computed segmentation data", (uint8_t *)&v15, 0xCu);
        }

        uint64_t v7 = v9;
      }
      else
      {
        if (v11)
        {
          int v15 = 136315138;
          v16 = "-[NTKUltraCubeSegmentationGenerator _retrieveAuxiliaryDictionary]";
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s: failed to compute segmentation data; try computing threshold segmentation, if enabled",
            (uint8_t *)&v15,
            0xCu);
        }

        objc_super v12 = [(NTKUltraCubeSegmentationGenerator *)self _computeThresholdAuxiliaryDictionaryIfEnabled];
        uint64_t v7 = v12;
        if (v12) {
          v13 = v12;
        }
      }
    }
  }
  else
  {
    if (v5)
    {
      int v15 = 136315138;
      v16 = "-[NTKUltraCubeSegmentationGenerator _retrieveAuxiliaryDictionary]";
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s: segmentation type is 'None', do not try to compute segmentation", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)_identifySegmentationType
{
  uint64_t v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[NTKUltraCubeSegmentationGenerator _identifySegmentationType]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s: attempting to identify segmentation type for image", (uint8_t *)&v9, 0xCu);
  }

  if ([(NSArray *)self->_faceRects count]) {
    return 1;
  }
  BOOL v5 = [(NTKUltraCubeSegmentationGenerator *)self _classifyImage];
  if ([v5 hasPeople])
  {
    uint64_t v4 = 1;
  }
  else if ([v5 hasAnimal])
  {
    uint64_t v4 = 2;
  }
  else if (([v5 hasCityscape] & 1) != 0 || objc_msgSend(v5, "hasNature"))
  {
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringForSegmentationType(v4);
    int v9 = 136315394;
    id v10 = "-[NTKUltraCubeSegmentationGenerator _identifySegmentationType]";
    __int16 v11 = 2112;
    objc_super v12 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s: identified the segmentation type: %@", (uint8_t *)&v9, 0x16u);
  }
  return v4;
}

- (id)_classifyImage
{
  uint64_t v3 = objc_opt_new();
  BOOL v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: attempting to classify image", buf, 0xCu);
  }

  v6 = [(NTKImageSource *)self->_imageSource CreateCGImageWithSubsampleFactor:1];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [objc_alloc((Class)VNImageRequestHandler) initWithCGImage:v6 orientation:self->_orientation options:&__NSDictionary0__struct];
    CGImageRelease(v7);
    id v9 = objc_alloc_init((Class)VNClassifyImageRequest);
    [v9 setMaximumHierarchicalObservations:10];
    [v9 setMaximumLeafObservations:10];
    id v55 = v9;
    id v10 = +[NSArray arrayWithObjects:&v55 count:1];
    id v49 = 0;
    unsigned int v11 = [v8 performRequests:v10 error:&v49];
    id v12 = v49;

    if (v11)
    {
      if (!v12)
      {
        id v43 = v8;
        v44 = v4;
        v19 = [v9 results];
        v20 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [v19 count];
          *(_DWORD *)buf = 136315394;
          v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
          __int16 v53 = 2048;
          id v54 = v21;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%s: successful VNClassifyImageRequest; returned (%ld) results",
            buf,
            0x16u);
        }

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v13 = v19;
        id v22 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v46;
          while (2)
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v46 != v24) {
                objc_enumerationMutation(v13);
              }
              v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              [v26 confidence];
              if (v27 < 0.5)
              {
                v40 = _NTKLoggingObjectForDomain();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
                  _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "%s: classification observation confidence lower than threshold", buf, 0xCu);
                }

                goto LABEL_44;
              }
              personIdentifiers = self->_personIdentifiers;
              v29 = [v26 identifier];
              LODWORD(personIdentifiers) = [(NSSet *)personIdentifiers containsObject:v29];

              if (personIdentifiers)
              {
                v30 = _NTKLoggingObjectForDomain();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
                  _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "%s: identified person", buf, 0xCu);
                }

                [v3 setHasPeople:1];
              }
              else
              {
                animalIdentifiers = self->_animalIdentifiers;
                v32 = [v26 identifier];
                LODWORD(animalIdentifiers) = [(NSSet *)animalIdentifiers containsObject:v32];

                if (animalIdentifiers)
                {
                  v33 = _NTKLoggingObjectForDomain();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
                    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "%s: identified animal", buf, 0xCu);
                  }

                  [v3 setHasAnimal:1];
                }
                else
                {
                  cityscapeIdentifiers = self->_cityscapeIdentifiers;
                  v35 = [v26 identifier];
                  LODWORD(cityscapeIdentifiers) = [(NSSet *)cityscapeIdentifiers containsObject:v35];

                  if (cityscapeIdentifiers)
                  {
                    v36 = _NTKLoggingObjectForDomain();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
                      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "%s: identified cityscape", buf, 0xCu);
                    }

                    [v3 setHasCityscape:1];
                  }
                  else
                  {
                    landscapeIdentifiers = self->_landscapeIdentifiers;
                    v38 = [v26 identifier];
                    LODWORD(landscapeIdentifiers) = [(NSSet *)landscapeIdentifiers containsObject:v38];

                    if (landscapeIdentifiers)
                    {
                      v39 = _NTKLoggingObjectForDomain();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136315138;
                        v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
                        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "%s: identified nature", buf, 0xCu);
                      }

                      [v3 setHasNature:1];
                    }
                  }
                }
              }
            }
            id v23 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
LABEL_44:

        id v8 = v43;
        uint64_t v4 = v44;
        id v12 = 0;
        goto LABEL_45;
      }
      v13 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
        __int16 v53 = 2114;
        id v54 = v12;
        v14 = "%s: failed to perform VNClassifyImageRequest: %{public}@";
        int v15 = v13;
        uint32_t v16 = 22;
LABEL_13:
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      v13 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
        v14 = "%s: Failed to perform VNClassifyImageRequest";
        int v15 = v13;
        uint32_t v16 = 12;
        goto LABEL_13;
      }
    }
LABEL_45:

    id v41 = v3;
    goto LABEL_46;
  }
  v17 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[NTKUltraCubeSegmentationGenerator _classifyImage]";
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%s: Failed to create image for classification", buf, 0xCu);
  }

  id v18 = v3;
LABEL_46:

  return v3;
}

- (id)_extractDisparityData
{
  imageSource = self->_imageSource;
  if (imageSource) {
    imageSource = CGImageSourceCopyAuxiliaryDataInfoAtIndex((CGImageSourceRef)[imageSource CGImageSource], 0, kCGImageAuxiliaryDataTypeDisparity);
  }

  return imageSource;
}

- (id)_extractPortraitEffectsMatteIfSupported
{
  if ([(NSArray *)self->_faceRects count] && self->_imageSource)
  {
    uint64_t v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[NTKUltraCubeSegmentationGenerator _extractPortraitEffectsMatteIfSupported]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s: yes face rects; look for PortraitEffectsMatte in the image data",
        (uint8_t *)&v7,
        0xCu);
    }

    CFDictionaryRef v4 = CGImageSourceCopyAuxiliaryDataInfoAtIndex([(NTKImageSource *)self->_imageSource CGImageSource], 0, kCGImageAuxiliaryDataTypePortraitEffectsMatte);
    if (v4)
    {
      BOOL v5 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        id v8 = "-[NTKUltraCubeSegmentationGenerator _extractPortraitEffectsMatteIfSupported]";
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: found PortraitEffectsMatte in image data, no computation needed", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  else
  {
    CFDictionaryRef v4 = 0;
  }

  return v4;
}

- (id)_computeSegmentationAuxiliaryDictionary
{
  uint64_t v3 = [(NTKImageSource *)self->_imageSource CreateCGImageWithSubsampleFactor:2];
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    id v5 = [objc_alloc((Class)VNImageRequestHandler) initWithCGImage:v3 orientation:self->_orientation options:&__NSDictionary0__struct];
    size_t Width = CGImageGetWidth(v4);
    size_t Height = CGImageGetHeight(v4);
    CGImageRelease(v4);
    id v8 = [(NTKUltraCubeSegmentationGenerator *)self _computeSegmentationForImageRequestHandler:v5 ofQuality:0 width:Width height:Height releaseCachedResources:0];
    if (+[NTKUltraCubeSegmentationValidator isAuxiliaryDictionarySegmentationValid:v8])
    {
      id v9 = [(NTKUltraCubeSegmentationGenerator *)self _computeSegmentationForImageRequestHandler:v5 ofQuality:1 width:Width height:Height releaseCachedResources:1];

      id v8 = v9;
      id v10 = v8;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_computeSegmentationForImageRequestHandler:(id)a3 ofQuality:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 releaseCachedResources:(BOOL)a7
{
  uint64_t v44 = 0;
  int v43 = 0;
  id v12 = a3;
  v13 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringForSegmentationType(self->_identifiedType);
    *(_DWORD *)buf = 136315394;
    v50 = "-[NTKUltraCubeSegmentationGenerator _computeSegmentationForImageRequestHandler:ofQuality:width:height:releaseC"
          "achedResources:]";
    __int16 v51 = 2112;
    id v52 = v14;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%s: created CGImageRef; compute segementation of type %@",
      buf,
      0x16u);
  }
  unint64_t identifiedType = self->_identifiedType;
  uint64_t orientation = self->_orientation;
  id v42 = 0;
  unsigned int v17 = NTKUltraCubeComputeSegmentation(v12, identifiedType, a4, a5, a6, orientation, &v42, (_DWORD *)&v44 + 1, &v44, &v43, a7);

  id v18 = v42;
  v19 = v18;
  if (v17)
  {
    unint64_t v41 = 0;
    unsigned int v40 = 0;
    unsigned int v20 = self->_orientation;
    int v22 = v44;
    int v21 = HIDWORD(v44);
    int v23 = v43;
    CFDataRef v39 = 0;
    CFDataRef v24 = (const __CFData *)v18;
    CFDataRef v25 = v24;
    if (v20 == 1)
    {
      CFDataRef v39 = v24;
      unint64_t v41 = __PAIR64__(v21, v22);
      unsigned int v40 = v23;
    }
    else
    {
      v28 = CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
      v29 = CGDataProviderCreateWithCFData(v25);
      v30 = CGImageCreate(v21, v22, 8uLL, 8uLL, v23, v28, 0, v29, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v29);
      CGColorSpaceRelease(v28);
      uint64_t v31 = NTKCGImagePropertyOrientationToUIImageOrientation();
      sub_1B3FC(v30, 0, v31, &v39, (int *)&v41 + 1, (int *)&v41, (int *)&v40);
      CGImageRelease(v30);
    }

    v26 = v39;
    v32 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [v26 length];
      *(_DWORD *)buf = 136316162;
      v50 = "-[NTKUltraCubeSegmentationGenerator _computeSegmentationForImageRequestHandler:ofQuality:width:height:releas"
            "eCachedResources:]";
      __int16 v51 = 2048;
      id v52 = v33;
      __int16 v53 = 2048;
      uint64_t v54 = SHIDWORD(v41);
      __int16 v55 = 2048;
      uint64_t v56 = (int)v41;
      __int16 v57 = 2048;
      uint64_t v58 = (int)v40;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%s: computing MatteAuxilaryDictionary succeeded: %ld bytes, (%ldx%ld) bpr=%ld)", buf, 0x34u);
    }

    v47[0] = kCGImagePropertyWidth;
    v34 = +[NSNumber numberWithInt:HIDWORD(v41)];
    v48[0] = v34;
    v47[1] = kCGImagePropertyHeight;
    v35 = +[NSNumber numberWithInt:v41];
    v48[1] = v35;
    v47[2] = kCGImagePropertyBytesPerRow;
    v36 = +[NSNumber numberWithInt:v40];
    v47[3] = kCGImagePropertyPixelFormat;
    v48[2] = v36;
    v48[3] = &off_4B758;
    v37 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];

    v45[0] = kCGImageAuxiliaryDataInfoData;
    v45[1] = kCGImageAuxiliaryDataInfoDataDescription;
    v46[0] = v26;
    v46[1] = v37;
    float v27 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  }
  else
  {
    v26 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[NTKUltraCubeSegmentationGenerator _computeSegmentationForImageRequestHandler:ofQuality:width:height:releas"
            "eCachedResources:]";
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "%s: computing MatteAuxilaryDictionary failed", buf, 0xCu);
    }
    float v27 = 0;
  }

  return v27;
}

- (id)_computeThresholdAuxiliaryDictionaryIfEnabled
{
  int v3 = _os_feature_enabled_impl();
  CFDictionaryRef v4 = _NTKLoggingObjectForDomain();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      int v10 = 136315138;
      unsigned int v11 = "-[NTKUltraCubeSegmentationGenerator _computeThresholdAuxiliaryDictionaryIfEnabled]";
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s: compute threshold segmentation disabled; aborting",
        (uint8_t *)&v10,
        0xCu);
    }
    goto LABEL_13;
  }
  if (v5)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "compute threshold segmentation enabled; look for disparity data",
      (uint8_t *)&v10,
      2u);
  }

  CFDictionaryRef v4 = [(NTKUltraCubeSegmentationGenerator *)self _extractDisparityData];
  v6 = _NTKLoggingObjectForDomain();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v7)
    {
      int v10 = 136315138;
      unsigned int v11 = "-[NTKUltraCubeSegmentationGenerator _computeThresholdAuxiliaryDictionaryIfEnabled]";
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s: no disparity data; no point trying to compute threshold segmentation",
        (uint8_t *)&v10,
        0xCu);
    }

LABEL_13:
    id v8 = 0;
    goto LABEL_14;
  }
  if (v7)
  {
    int v10 = 136315138;
    unsigned int v11 = "-[NTKUltraCubeSegmentationGenerator _computeThresholdAuxiliaryDictionaryIfEnabled]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s: yes disparity data; compute threshold enabled; attempt to compute threshold segmentation",
      (uint8_t *)&v10,
      0xCu);
  }

  id v8 = [(NTKUltraCubeSegmentationGenerator *)self _createThresholdSegmentationFromDisparityData:v4];
LABEL_14:

  return v8;
}

- (id)_createThresholdSegmentationFromDisparityData:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NTKImageSource *)self->_imageSource CreateCGImageWithSubsampleFactor:1];
  if (v5)
  {
    v6 = v5;
    uint64_t v21 = 0;
    int v20 = 0;
    BOOL v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v27 = "-[NTKUltraCubeSegmentationGenerator _createThresholdSegmentationFromDisparityData:]";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s: start computing threshold segementation", buf, 0xCu);
    }

    uint64_t orientation = self->_orientation;
    id v19 = 0;
    int v9 = NTKUltraCubeComputeThresholdSegmentation((uint64_t)v6, orientation, v4, &v19, (int *)&v21 + 1, (int *)&v21, (unsigned int *)&v20);
    id v10 = v19;
    unsigned int v11 = _NTKLoggingObjectForDomain();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        id v13 = [v10 length];
        *(_DWORD *)buf = 136316162;
        float v27 = "-[NTKUltraCubeSegmentationGenerator _createThresholdSegmentationFromDisparityData:]";
        __int16 v28 = 2048;
        id v29 = v13;
        __int16 v30 = 2048;
        uint64_t v31 = SHIDWORD(v21);
        __int16 v32 = 2048;
        uint64_t v33 = (int)v21;
        __int16 v34 = 2048;
        uint64_t v35 = v20;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s: computing MatteAuxilaryDictionary succeeded: %ld bytes, (%ldx%ld) bpr=%ld)", buf, 0x34u);
      }

      v24[0] = kCGImagePropertyWidth;
      v14 = +[NSNumber numberWithInt:HIDWORD(v21)];
      v25[0] = v14;
      v24[1] = kCGImagePropertyHeight;
      int v15 = +[NSNumber numberWithInt:v21];
      v25[1] = v15;
      v24[2] = kCGImagePropertyBytesPerRow;
      uint32_t v16 = +[NSNumber numberWithInt:v20];
      v25[2] = v16;
      v25[3] = &off_4B758;
      v24[3] = kCGImagePropertyPixelFormat;
      v24[4] = @"NTKImageAuxiliaryThresholdSegmentation";
      v25[4] = &__kCFBooleanTrue;
      unsigned int v11 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

      v22[0] = kCGImageAuxiliaryDataInfoData;
      v22[1] = kCGImageAuxiliaryDataInfoDataDescription;
      v23[0] = v10;
      v23[1] = v11;
      unsigned int v17 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        float v27 = "-[NTKUltraCubeSegmentationGenerator _createThresholdSegmentationFromDisparityData:]";
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s: computing MatteAuxilaryDictionary failed", buf, 0xCu);
      }
      unsigned int v17 = 0;
    }

    CGImageRelease(v6);
  }
  else
  {
    unsigned int v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeIdentifiers, 0);
  objc_storeStrong((id *)&self->_cityscapeIdentifiers, 0);
  objc_storeStrong((id *)&self->_animalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageSource, 0);

  objc_storeStrong((id *)&self->_faceRects, 0);
}

@end