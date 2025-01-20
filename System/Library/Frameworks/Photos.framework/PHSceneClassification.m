@interface PHSceneClassification
+ (id)_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 includeTemporalClassifications:(BOOL)a4 sceneClassificationTypePredicate:(id)a5;
+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3;
+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 includeTemporalClassifications:(BOOL)a4;
+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 sceneClassificationType:(int64_t)a4;
+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 sceneClassificationType:(int64_t)a4 includeTemporalClassifications:(BOOL)a5;
- (BOOL)_validateStartTime:(double)a3 duration:(double)a4 classificationType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSceneClassification:(id)a3;
- (CGRect)boundingBox;
- (PHSceneClassification)initWithDictionaryRepresentation:(id)a3;
- (PHSceneClassification)initWithExtendedSceneIdentifier:(unint64_t)a3 confidence:(double)a4 boundingBox:(CGRect)a5 startTime:(double)a6 duration:(double)a7 classificationType:(int64_t)a8;
- (PHSceneClassification)initWithExtendedSceneIdentifier:(unint64_t)a3 confidence:(double)a4 classificationType:(int64_t)a5;
- (double)confidence;
- (double)duration;
- (double)startTime;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)classificationType;
- (int64_t)packedBoundingBoxRect;
- (unint64_t)extendedSceneIdentifier;
- (unint64_t)hash;
- (unsigned)sceneIdentifier;
- (void)setPackedBoundingBoxRect:(int64_t)a3;
- (void)setSceneIdentifier:(unsigned int)a3;
@end

@implementation PHSceneClassification

- (int64_t)classificationType
{
  return self->_classificationType;
}

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setPackedBoundingBoxRect:(int64_t)a3
{
  self->_packedBoundingBoxRect = a3;
}

- (int64_t)packedBoundingBoxRect
{
  return self->_packedBoundingBoxRect;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)confidence
{
  return self->_confidence;
}

- (unint64_t)extendedSceneIdentifier
{
  return self->_extendedSceneIdentifier;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PHSceneClassification;
  v4 = [(PHSceneClassification *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ id: %llu, classificationType: %ld, confidence %.4f", v4, self->_extendedSceneIdentifier, self->_classificationType, *(void *)&self->_confidence];

  return v5;
}

- (PHSceneClassification)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  objc_super v7 = [v4 objectForKeyedSubscript:@"packedBoundingBoxRect"];
  id v32 = 0;
  v8 = [v5 unarchivedObjectOfClass:v6 fromData:v7 error:&v32];
  id v9 = v32;

  if (v9)
  {
    v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v9;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Failed to archive boundingBoxData, error: %@", buf, 0xCu);
    }
  }
  double v11 = MEMORY[0x19F388450](v8);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [v4 objectForKeyedSubscript:@"sceneIdentifier"];
  uint64_t v19 = [v18 unsignedLongLongValue];
  v20 = [v4 objectForKeyedSubscript:@"confidence"];
  [v20 doubleValue];
  double v22 = v21;
  v23 = [v4 objectForKeyedSubscript:@"startTime"];
  [v23 doubleValue];
  double v25 = v24;
  v26 = [v4 objectForKeyedSubscript:@"duration"];
  [v26 doubleValue];
  double v28 = v27;
  v29 = [v4 objectForKeyedSubscript:@"classificationType"];
  v30 = -[PHSceneClassification initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:](self, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v19, [v29 integerValue], v22, v11, v13, v15, v17, v25, v28);

  return v30;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DB0];
  id v4 = DCIM_NSValueFromCGRect();
  id v15 = 0;
  v5 = [v3 archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v15];
  id v6 = v15;

  if (v6)
  {
    objc_super v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Failed to archive boundingBoxData, error: %@", buf, 0xCu);
    }
  }
  v16[0] = @"sceneIdentifier";
  v8 = [NSNumber numberWithUnsignedLongLong:self->_extendedSceneIdentifier];
  v17[0] = v8;
  v16[1] = @"confidence";
  id v9 = [NSNumber numberWithDouble:self->_confidence];
  v17[1] = v9;
  v17[2] = v5;
  v16[2] = @"packedBoundingBoxRect";
  v16[3] = @"startTime";
  v10 = [NSNumber numberWithDouble:self->_startTime];
  v17[3] = v10;
  v16[4] = @"duration";
  double v11 = [NSNumber numberWithDouble:self->_duration];
  v17[4] = v11;
  v16[5] = @"classificationType";
  double v12 = [NSNumber numberWithInteger:self->_classificationType];
  v17[5] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v13;
}

- (unint64_t)hash
{
  return self->_extendedSceneIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHSceneClassification *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PHSceneClassification *)self isEqualToSceneClassification:v4];
  }

  return v5;
}

- (BOOL)isEqualToSceneClassification:(id)a3
{
  id v4 = a3;
  int64_t classificationType = self->_classificationType;
  if (classificationType == [v4 classificationType]
    && (unint64_t extendedSceneIdentifier = self->_extendedSceneIdentifier,
        extendedSceneIdentifier == [v4 extendedSceneIdentifier])
    && (double confidence = self->_confidence, [v4 confidence], confidence == v8))
  {
    [v4 boundingBox];
    v15.origin.double x = v9;
    v15.origin.double y = v10;
    v15.size.double width = v11;
    v15.size.double height = v12;
    BOOL v13 = CGRectEqualToRect(self->_boundingBox, v15);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)setSceneIdentifier:(unsigned int)a3
{
  self->_unint64_t extendedSceneIdentifier = a3;
}

- (unsigned)sceneIdentifier
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t extendedSceneIdentifier = self->_extendedSceneIdentifier;
  if (HIDWORD(extendedSceneIdentifier))
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      unint64_t v5 = self->_extendedSceneIdentifier;
      int v7 = 134217984;
      unint64_t v8 = v5;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_FAULT, "Using 32 bit SPI to return 64 bit value (value: %lld)", (uint8_t *)&v7, 0xCu);
    }

    LODWORD(extendedSceneIdentifier) = 0;
  }
  return extendedSceneIdentifier;
}

- (PHSceneClassification)initWithExtendedSceneIdentifier:(unint64_t)a3 confidence:(double)a4 boundingBox:(CGRect)a5 startTime:(double)a6 duration:(double)a7 classificationType:(int64_t)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  if (![(PHSceneClassification *)self _validateStartTime:a8 duration:a6 classificationType:a7]|| (v38.receiver = self, v38.super_class = (Class)PHSceneClassification, (id v19 = [(PHSceneClassification *)&v38 init]) == 0))
  {
    double v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    v30 = [NSString stringWithFormat:@"Invalid combination of parameters for PHSceneClassification (id: %llu) - startTime: %g, duration: %g, classificationType: %ld", a3, *(void *)&a6, *(void *)&a7, a8];
    id v31 = [v28 exceptionWithName:v29 reason:v30 userInfo:0];

    objc_exception_throw(v31);
  }
  uint64_t v20 = v19;
  v19->_boundingBox.origin.double x = x;
  p_double x = (_OWORD *)&v19->_boundingBox.origin.x;
  v19->_unint64_t extendedSceneIdentifier = a3;
  v19->_double confidence = a4;
  v19->_boundingBox.origin.double y = y;
  v19->_boundingBox.size.double width = width;
  v19->_boundingBox.size.double height = height;
  v19->_startTime = a6;
  v19->_duration = a7;
  v19->_int64_t classificationType = a8;
  double v22 = *MEMORY[0x1E4F1DB28];
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.double width = width;
  v39.size.double height = height;
  v41.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v41.origin.double y = v23;
  v41.size.double width = v24;
  v41.size.double height = v25;
  if (CGRectEqualToRect(v39, v41))
  {
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *p_double x = *MEMORY[0x1E4F1DB20];
    p_x[1] = v26;
  }
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  if (CGRectIsNull(v40))
  {
    double height = v25;
    double width = v24;
    double y = v23;
    double x = v22;
  }
  if (!PLCGRectIsNormalized())
  {
    id v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    id v34 = NSString;
    uint64_t v35 = NSStringFromSelector(a2);
    v36 = [v34 stringWithFormat:@"Invalid CGRect for PHSceneClassification (id: %llu) passed to %@, rect must be non-zero normalized or CGRectNull", a3, v35];
    id v37 = [v32 exceptionWithName:v33 reason:v36 userInfo:0];

    objc_exception_throw(v37);
  }
  v20->_packedBoundingBoxRect = MEMORY[0x19F388EB0](x, y, width, height);
  return v20;
}

- (PHSceneClassification)initWithExtendedSceneIdentifier:(unint64_t)a3 confidence:(double)a4 classificationType:(int64_t)a5
{
  return -[PHSceneClassification initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:](self, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", a3, a5, a4, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), 0.0, 0.0);
}

- (BOOL)_validateStartTime:(double)a3 duration:(double)a4 classificationType:(int64_t)a5
{
  BOOL v5 = a3 == 0.0;
  if (a4 != 0.0) {
    BOOL v5 = 0;
  }
  BOOL v6 = ((1 << a5) & 0xC) != 0 && a4 > 0.0;
  if (((1 << a5) & 0xF1) != 0) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (unint64_t)a5 <= 7 && v7;
}

+ (id)_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 includeTemporalClassifications:(BOOL)a4 sceneClassificationTypePredicate:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a5;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__20820;
  v36 = __Block_byref_object_dispose__20821;
  id v37 = 0;
  unint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
  BOOL v23 = v6;
  CGFloat v12 = 0;
  if (v11)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        CGRect v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        double v16 = [v15 objectID];
        [v8 addObject:v16];
        double v17 = [v15 localIdentifier];
        [v9 setObject:v17 forKey:v16];

        if (!v12)
        {
          v18 = [v15 photoLibrary];
          CGFloat v12 = [v18 photoLibrary];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v11);
  }

  id v19 = (void *)MEMORY[0x1E4F8AB80];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __154__PHSceneClassification__fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_includeTemporalClassifications_sceneClassificationTypePredicate___block_invoke;
  v25[3] = &unk_1E5845000;
  double v27 = &v32;
  id v20 = v9;
  id v26 = v20;
  [v19 batchFetchScenesByAssetObjectIDWithAssetObjectIDs:v8 library:v12 includeTemporalClassifications:v23 sceneClassificationTypePredicate:v24 completion:v25];
  id v21 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v21;
}

void __154__PHSceneClassification__fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_includeTemporalClassifications_sceneClassificationTypePredicate___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  uint64_t v5 = [v3 dictionary];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __154__PHSceneClassification__fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_includeTemporalClassifications_sceneClassificationTypePredicate___block_invoke_2;
  v10[3] = &unk_1E5844FD8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
}

void __154__PHSceneClassification__fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_includeTemporalClassifications_sceneClassificationTypePredicate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v31 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v28 = a1;
  long long v29 = v5;
  double v27 = [*(id *)(a1 + 32) objectForKey:v5];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"packedBoundingBoxRect"];
        [v12 longLongValue];
        PLSplitToCGRectFromInt64();

        uint64_t v13 = [PHSceneClassification alloc];
        double v14 = [v11 objectForKeyedSubscript:@"sceneIdentifier"];
        uint64_t v15 = [v14 unsignedLongLongValue];
        double v16 = [v11 objectForKeyedSubscript:@"confidence"];
        [v16 doubleValue];
        double v18 = v17;
        id v19 = [v11 objectForKeyedSubscript:@"startTime"];
        [v19 doubleValue];
        double v21 = v20;
        double v22 = [v11 objectForKeyedSubscript:@"duration"];
        [v22 doubleValue];
        double v24 = v23;
        double v25 = [v11 objectForKeyedSubscript:@"classificationType"];
        id v26 = -[PHSceneClassification initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:](v13, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v15, [v25 integerValue], v18, 0.0, 0.0, 0.0, 0.0, v21, v24);

        [v31 addObject:v26];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }

  [*(id *)(*(void *)(*(void *)(v28 + 40) + 8) + 40) setObject:v31 forKeyedSubscript:v27];
}

+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 sceneClassificationType:(int64_t)a4 includeTemporalClassifications:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = a3;
  id v10 = objc_msgSend(v8, "predicateWithFormat:", @"%K = %ld", @"classificationType", a4);
  id v11 = [a1 _fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v9 includeTemporalClassifications:v5 sceneClassificationTypePredicate:v10];

  return v11;
}

+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 sceneClassificationType:(int64_t)a4
{
  return (id)[a1 fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:a3 sceneClassificationType:a4 includeTemporalClassifications:1];
}

+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 includeTemporalClassifications:(BOOL)a4
{
  return (id)[a1 _fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:a3 includeTemporalClassifications:a4 sceneClassificationTypePredicate:0];
}

+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  return (id)[a1 _fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:a3 includeTemporalClassifications:0 sceneClassificationTypePredicate:0];
}

@end