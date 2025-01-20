@interface MADSpotlightImageAssetEntry
+ (id)entryWithAsset:(id)a3;
- (BOOL)isMovieAsset;
- (BOOL)needsEmbeddingProcessing;
- (BOOL)needsOCRProcessing;
- (BOOL)needsSceneProcessing;
- (CSSearchableItemAttributeSet)attributeSet;
- (MADManagedSpotlightEntry)asset;
- (MADSpotlightImageAssetEntry)initWithAsset:(id)a3;
- (__CVBuffer)decodeImageAtImageURL:(id)a3;
- (__CVBuffer)decodeImageAtVideoURL:(id)a3;
- (id)_blastdoorMediaMetadata:(id)a3 withURL:(id)a4;
- (id)filePath;
- (id)logPrefix;
- (id)uniqueIdentifier;
- (int)previousStatus;
- (void)dealloc;
- (void)setPreviousStatus:(int)a3;
@end

@implementation MADSpotlightImageAssetEntry

- (MADSpotlightImageAssetEntry)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADSpotlightImageAssetEntry;
  v6 = [(MADSpotlightImageAssetEntry *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    v7->_previousStatus = [v5 status];
    v7->_sandboxHandle = -1;
  }

  return v7;
}

+ (id)entryWithAsset:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithAsset:v3];

  return v4;
}

- (BOOL)needsSceneProcessing
{
  return 1;
}

- (BOOL)needsOCRProcessing
{
  return 1;
}

- (BOOL)needsEmbeddingProcessing
{
  return ![(MADSpotlightImageAssetEntry *)self isMovieAsset];
}

- (id)logPrefix
{
  return @"Spotlight|Image";
}

- (id)filePath
{
  if (self->_sandboxHandle < 0
    && ([(MADManagedSpotlightEntry *)self->_asset sandboxToken],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 UTF8String],
        self->_sandboxHandle = sandbox_extension_consume(),
        v3,
        self->_sandboxHandle < 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v7, v8))
      {
        objc_super v9 = [(MADSpotlightImageAssetEntry *)self uniqueIdentifier];
        int v10 = 138412290;
        v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] Failed to consume sandbox extension", (uint8_t *)&v10, 0xCu);
      }
    }
    id v5 = 0;
  }
  else
  {
    id v4 = [(MADManagedSpotlightEntry *)self->_asset url];
    id v5 = [v4 path];
  }
  return v5;
}

- (id)uniqueIdentifier
{
  return [(MADManagedSpotlightEntry *)self->_asset uniqueIdentifier];
}

- (BOOL)isMovieAsset
{
  return [(MADManagedSpotlightEntry *)self->_asset mediaType] == 2;
}

- (void)dealloc
{
  if ((self->_sandboxHandle & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)MADSpotlightImageAssetEntry;
  [(MADSpotlightImageAssetEntry *)&v3 dealloc];
}

- (id)_blastdoorMediaMetadata:(id)a3 withURL:(id)a4
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100160ADC;
  v19 = sub_100160AEC;
  id v20 = 0;
  id v6 = a4;
  id v7 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100160AF4;
  v12[3] = &unk_10021F020;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v14 = &v15;
  v12[4] = self;
  os_log_type_t v8 = v13;
  objc_super v9 = objc_retainBlock(v12);
  [v7 generateMetadataforAttachmentWithfileURL:v6 resultHandler:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (__CVBuffer)decodeImageAtImageURL:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = [(MADSpotlightImageAssetEntry *)self logPrefix];
      os_log_type_t v8 = [v4 path];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v7;
      __int16 v38 = 2112;
      v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%@][Process] Decoding image at image URL: %@", buf, 0x16u);
    }
  }
  id v9 = objc_alloc_init((Class)sub_10016115C());
  id v10 = [(MADSpotlightImageAssetEntry *)self _blastdoorMediaMetadata:v9 withURL:v4];
  id v11 = [v10 rawPixelWidth];
  id v12 = [v10 rawPixelHeight];
  if ((unint64_t)v11 >= 3)
  {
    id v13 = v12;
    if ((unint64_t)[v10 rawPixelHeight] > 2)
    {
      unint64_t v21 = [(MADSpotlightImageAssetEntryBase *)self targetMajorDimensionForImageWithWidth:v11 height:v13 andMinPreferredMinorDimension:1210];
      if (v11 <= v13) {
        unint64_t v24 = (unint64_t)v13;
      }
      else {
        unint64_t v24 = (unint64_t)v11;
      }
      if (v21) {
        unint64_t v24 = v21;
      }
      *(float *)&double v22 = (float)v24;
      id v36 = 0;
      LODWORD(v23) = 1.0;
      v25 = [v9 generateImagePreviewForFileURL:v4 maxPixelDimension:&v36 scale:v22 error:v23];
      v14 = v36;
      if (v25)
      {
        v26 = [v25 image];
        BOOL v27 = [v26 cgImage] == 0;

        if (!v27)
        {
          *(void *)buf = 0;
          v28 = [v25 image];
          v29 = (CGImage *)[v28 cgImage];
          if (*(void *)buf)
          {
            CFRelease(*(CFTypeRef *)buf);
            *(void *)buf = 0;
          }
          sub_100161240(v29, (CVPixelBufferRef *)buf);

          if (*(void *)buf) {
            id v20 = (__CVBuffer *)CFRetain(*(CFTypeRef *)buf);
          }
          else {
            id v20 = 0;
          }
          sub_100004484((const void **)buf);
          goto LABEL_34;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v30 = VCPLogInstance();
          os_log_type_t v33 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v30, v33))
          {
            v34 = [(MADSpotlightImageAssetEntry *)self logPrefix];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v34;
            _os_log_impl((void *)&_mh_execute_header, v30, v33, "[%@][Process] Failed to obtain cgImage from preview image", buf, 0xCu);
          }
LABEL_30:
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v30 = VCPLogInstance();
        os_log_type_t v31 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v30, v31))
        {
          v32 = [(MADSpotlightImageAssetEntry *)self logPrefix];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v32;
          __int16 v38 = 2112;
          v39 = v14;
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "[%@][Process] Failed to obtain blastdoor preview image: %@", buf, 0x16u);
        }
        goto LABEL_30;
      }
      id v20 = 0;
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v14, v15))
    {
      v16 = [(MADSpotlightImageAssetEntry *)self logPrefix];
      uint64_t v17 = [v4 path];
      id v18 = [v10 rawPixelWidth];
      id v19 = [v10 rawPixelHeight];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v16;
      __int16 v38 = 2112;
      v39 = v17;
      __int16 v40 = 2048;
      id v41 = v18;
      __int16 v42 = 2048;
      id v43 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%@][Process][%@] Image has invalid or too small dimensions (%ldx%ld)", buf, 0x2Au);
    }
    id v20 = 0;
    goto LABEL_35;
  }
  id v20 = 0;
LABEL_36:

  return v20;
}

- (__CVBuffer)decodeImageAtVideoURL:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = [(MADSpotlightImageAssetEntry *)self logPrefix];
      os_log_type_t v8 = [v4 path];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v7;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%@][Process] Decoding image at video URL: %@", buf, 0x16u);
    }
  }
  id v9 = objc_alloc_init((Class)sub_10016115C());
  id v10 = [(MADSpotlightImageAssetEntry *)self _blastdoorMediaMetadata:v9 withURL:v4];
  id v11 = (uint64_t (*)(uint64_t, uint64_t))[v10 rawPixelWidth];
  id v12 = (uint64_t (*)(uint64_t, uint64_t))[v10 rawPixelHeight];
  id v13 = v12;
  if ((unint64_t)v11 >= 3 && (unint64_t)v12 > 2)
  {
    unint64_t v14 = [(MADSpotlightImageAssetEntryBase *)self targetMajorDimensionForImageWithWidth:v11 height:v12 andMinPreferredMinorDimension:1210];
    if ((unint64_t)v11 <= (unint64_t)v13) {
      os_log_type_t v15 = v13;
    }
    else {
      os_log_type_t v15 = v11;
    }
    if (v14) {
      unint64_t v16 = v14;
    }
    else {
      unint64_t v16 = (unint64_t)v15;
    }
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3812000000;
    v32 = sub_100161AE8;
    *(void *)&long long v33 = sub_100161AF8;
    *((void *)&v33 + 1) = &unk_1001D3A67;
    v34 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100161B00;
    v28[3] = &unk_10021F048;
    v28[4] = self;
    v30 = buf;
    id v18 = v17;
    v29 = v18;
    id v19 = objc_retainBlock(v28);
    *(float *)&double v20 = (float)v16;
    LODWORD(v21) = 1.0;
    objc_msgSend(v9, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:", v4, v19, v20, 3.0, 3.0, v21);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    double v22 = *(const void **)(*(void *)&buf[8] + 48);
    if (v22) {
      double v23 = (__CVBuffer *)CFRetain(v22);
    }
    else {
      double v23 = 0;
    }

    _Block_object_dispose(buf, 8);
    sub_100004484(&v34);
LABEL_22:

    goto LABEL_23;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v18 = VCPLogInstance();
    os_log_type_t v24 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v18, v24))
    {
      v25 = [(MADSpotlightImageAssetEntry *)self logPrefix];
      v26 = [v4 path];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v25;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2048;
      v32 = v11;
      LOWORD(v33) = 2048;
      *(void *)((char *)&v33 + 2) = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, v24, "[%@][Process][%@] Video keyframe has invalid or too small dimensions (%ldx%ld)", buf, 0x2Au);
    }
    double v23 = 0;
    goto LABEL_22;
  }
  double v23 = 0;
LABEL_23:

  return v23;
}

- (CSSearchableItemAttributeSet)attributeSet
{
  attributeSet = self->_attributeSet;
  if (attributeSet)
  {
    objc_super v3 = attributeSet;
    goto LABEL_23;
  }
  id v5 = [(MADManagedSpotlightEntry *)self->_asset typeIdentifier];
  os_log_type_t v6 = +[UTType typeWithIdentifier:v5];

  if (!v6)
  {
    objc_super v3 = 0;
    goto LABEL_22;
  }
  id v7 = (CSSearchableItemAttributeSet *)[objc_alloc((Class)CSSearchableItemAttributeSet) initWithContentType:v6];
  os_log_type_t v8 = [(MADManagedSpotlightEntry *)self->_asset url];
  [(CSSearchableItemAttributeSet *)v7 setContentURL:v8];

  id v9 = [(MADManagedSpotlightEntry *)self->_asset bundleIdentifier];
  [(CSSearchableItemAttributeSet *)v7 setBundleID:v9];

  if ([(MADSpotlightImageAssetEntry *)self needsSceneProcessing])
  {
    id v10 = +[NSNumber numberWithInt:[(MADSpotlightImageAssetEntryBase *)self sceneVersion]];
    [(CSSearchableItemAttributeSet *)v7 setPhotosSceneAnalysisVersion:v10];

    id v11 = [(MADSpotlightImageAssetEntryBase *)self sceneClassifications];
    id v12 = +[PHSearch spotlightSceneClassificationsFromPhotosSceneClassifications:v11 algorithmVersion:[(MADSpotlightImageAssetEntryBase *)self sceneVersion]];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v37;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v13);
          }
          dispatch_semaphore_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_msgSend(v17, "setSceneType:", 1, (void)v36);
          [v17 setMediaType:1];
        }
        id v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v14);
    }

    [(CSSearchableItemAttributeSet *)v7 setPhotosSceneClassifications:v13];
    id v18 = [(MADSpotlightImageAssetEntryBase *)self nsfwClassifications];
    id v19 = +[PHSearch spotlightContentRatingFromPhotosSceneClassifications:v18 algorithmVersion:[(MADSpotlightImageAssetEntryBase *)self sceneVersion]];
    [(CSSearchableItemAttributeSet *)v7 setContentRating:v19];

    [(MADSpotlightImageAssetEntryBase *)self aestheticScore];
    double v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [(CSSearchableItemAttributeSet *)v7 setAestheticScore:v20];
  }
  if ([(MADSpotlightImageAssetEntry *)self needsOCRProcessing])
  {
    double v21 = [(MADSpotlightImageAssetEntryBase *)self ocrObservation];
    double v22 = +[PHSearch spotlightTextLinesFromDocumentObservation:v21 algorithmVersion:[(MADSpotlightImageAssetEntryBase *)self ocrVersion]];
    [(CSSearchableItemAttributeSet *)v7 setTextContentPieces:v22];

    double v23 = +[NSNumber numberWithInt:[(MADSpotlightImageAssetEntryBase *)self ocrVersion]];
    [(CSSearchableItemAttributeSet *)v7 setPhotosCharacterRecognitionAnalysisVersion:v23];
  }
  if ([(MADSpotlightImageAssetEntry *)self needsEmbeddingProcessing])
  {
    if ((id)[(MADSpotlightImageAssetEntryBase *)self embeddingVersion] == (id)4
      || (id)[(MADSpotlightImageAssetEntryBase *)self embeddingVersion] == (id)5)
    {
      id v24 = objc_alloc((Class)_CSEmbedding);
      unsigned __int16 v25 = (unsigned __int16)[(MADSpotlightImageAssetEntryBase *)self embeddingVersion];
      v26 = [(MADSpotlightImageAssetEntryBase *)self embeddings];
      id v27 = [v24 initWithFormat:1 dimension:1 version:v25 vectors:v26];
      [(CSSearchableItemAttributeSet *)v7 setPhotoEmbedding:v27];

      v28 = +[NSNumber numberWithUnsignedInteger:[(MADSpotlightImageAssetEntryBase *)self embeddingVersion]];
      [(CSSearchableItemAttributeSet *)v7 setMediaEmbeddingVersion:v28];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_20;
      }
      v28 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v28, v33))
      {
        v34 = [(MADSpotlightImageAssetEntry *)self logPrefix];
        unint64_t v35 = [(MADSpotlightImageAssetEntryBase *)self embeddingVersion];
        *(_DWORD *)buf = 138412546;
        id v41 = v34;
        __int16 v42 = 2048;
        unint64_t v43 = v35;
        _os_log_impl((void *)&_mh_execute_header, v28, v33, "[%@][Publish] Embedding version: %ld not supported, skip embedding publishing", buf, 0x16u);
      }
    }
  }
LABEL_20:
  p_attributeSet = &self->_attributeSet;
  v30 = self->_attributeSet;
  self->_attributeSet = v7;
  os_log_type_t v31 = v7;

  objc_super v3 = *p_attributeSet;
LABEL_22:

LABEL_23:
  return v3;
}

- (MADManagedSpotlightEntry)asset
{
  return self->_asset;
}

- (int)previousStatus
{
  return self->_previousStatus;
}

- (void)setPreviousStatus:(int)a3
{
  self->_previousStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_attributeSet, 0);
}

@end