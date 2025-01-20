@interface MADProtoSceneAsset
+ (Class)objectSaliencyRectsType;
+ (Class)sceneClassificationsType;
+ (id)protoFromPhotosAsset:(id)a3;
- (BOOL)hasDuplicateMatchingAlternateData;
- (BOOL)hasDuplicateMatchingData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)colorNormalizationData;
- (NSData)duplicateMatchingAlternateData;
- (NSData)duplicateMatchingData;
- (NSData)sceneprintData;
- (NSMutableArray)objectSaliencyRects;
- (NSMutableArray)sceneClassifications;
- (NSString)assetCloudIdentifier;
- (VCPProtoBounds)acceptableCropRect;
- (VCPProtoBounds)preferredCropRect;
- (double)adjustmentVersion;
- (double)assetAdjustmentTimestamp;
- (float)blurrinessScore;
- (float)exposureScore;
- (float)failureScore;
- (float)harmoniousColorScore;
- (float)iconicScore;
- (float)immersivenessScore;
- (float)interestingSubjectScore;
- (float)intrusiveObjectPresenceScore;
- (float)livelyColorScore;
- (float)lowLight;
- (float)noiseScore;
- (float)overallAestheticScore;
- (float)pleasantCameraTiltScore;
- (float)pleasantCompositionScore;
- (float)pleasantLightingScore;
- (float)pleasantPatternScore;
- (float)pleasantPerspectiveScore;
- (float)pleasantPostProcessingScore;
- (float)pleasantReflectionsScore;
- (float)pleasantSymmetryScore;
- (float)probableRotationDirectionConfidence;
- (float)sharplyFocusedSubjectScore;
- (float)tastefullyBlurredScore;
- (float)wallpaperScore;
- (float)wellChosenSubjectScore;
- (float)wellFramedSubjectScore;
- (float)wellTimedShotScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)objectSaliencyRectsAtIndex:(unint64_t)a3;
- (id)sceneClassificationsAtIndex:(unint64_t)a3;
- (int)algorithmVersion;
- (int)probableRotationDirection;
- (unint64_t)hash;
- (unint64_t)objectSaliencyRectsCount;
- (unint64_t)sceneClassificationsCount;
- (void)addObjectSaliencyRects:(id)a3;
- (void)addSceneClassifications:(id)a3;
- (void)clearObjectSaliencyRects;
- (void)clearSceneClassifications;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)persistToPhotosAsset:(id)a3;
- (void)setAcceptableCropRect:(id)a3;
- (void)setAdjustmentVersion:(double)a3;
- (void)setAlgorithmVersion:(int)a3;
- (void)setAssetAdjustmentTimestamp:(double)a3;
- (void)setAssetCloudIdentifier:(id)a3;
- (void)setBlurrinessScore:(float)a3;
- (void)setColorNormalizationData:(id)a3;
- (void)setDuplicateMatchingAlternateData:(id)a3;
- (void)setDuplicateMatchingData:(id)a3;
- (void)setExposureScore:(float)a3;
- (void)setFailureScore:(float)a3;
- (void)setHarmoniousColorScore:(float)a3;
- (void)setIconicScore:(float)a3;
- (void)setImmersivenessScore:(float)a3;
- (void)setInterestingSubjectScore:(float)a3;
- (void)setIntrusiveObjectPresenceScore:(float)a3;
- (void)setLivelyColorScore:(float)a3;
- (void)setLowLight:(float)a3;
- (void)setNoiseScore:(float)a3;
- (void)setObjectSaliencyRects:(id)a3;
- (void)setOverallAestheticScore:(float)a3;
- (void)setPleasantCameraTiltScore:(float)a3;
- (void)setPleasantCompositionScore:(float)a3;
- (void)setPleasantLightingScore:(float)a3;
- (void)setPleasantPatternScore:(float)a3;
- (void)setPleasantPerspectiveScore:(float)a3;
- (void)setPleasantPostProcessingScore:(float)a3;
- (void)setPleasantReflectionsScore:(float)a3;
- (void)setPleasantSymmetryScore:(float)a3;
- (void)setPreferredCropRect:(id)a3;
- (void)setProbableRotationDirection:(int)a3;
- (void)setProbableRotationDirectionConfidence:(float)a3;
- (void)setSceneClassifications:(id)a3;
- (void)setSceneprintData:(id)a3;
- (void)setSharplyFocusedSubjectScore:(float)a3;
- (void)setTastefullyBlurredScore:(float)a3;
- (void)setWallpaperScore:(float)a3;
- (void)setWellChosenSubjectScore:(float)a3;
- (void)setWellFramedSubjectScore:(float)a3;
- (void)setWellTimedShotScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MADProtoSceneAsset

- (void)clearSceneClassifications
{
}

- (void)addSceneClassifications:(id)a3
{
  id v4 = a3;
  sceneClassifications = self->_sceneClassifications;
  id v8 = v4;
  if (!sceneClassifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sceneClassifications;
    self->_sceneClassifications = v6;

    id v4 = v8;
    sceneClassifications = self->_sceneClassifications;
  }
  [(NSMutableArray *)sceneClassifications addObject:v4];
}

- (unint64_t)sceneClassificationsCount
{
  return [(NSMutableArray *)self->_sceneClassifications count];
}

- (id)sceneClassificationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sceneClassifications objectAtIndex:a3];
}

+ (Class)sceneClassificationsType
{
  return (Class)objc_opt_class();
}

- (void)clearObjectSaliencyRects
{
}

- (void)addObjectSaliencyRects:(id)a3
{
  id v4 = a3;
  objectSaliencyRects = self->_objectSaliencyRects;
  id v8 = v4;
  if (!objectSaliencyRects)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_objectSaliencyRects;
    self->_objectSaliencyRects = v6;

    id v4 = v8;
    objectSaliencyRects = self->_objectSaliencyRects;
  }
  [(NSMutableArray *)objectSaliencyRects addObject:v4];
}

- (unint64_t)objectSaliencyRectsCount
{
  return [(NSMutableArray *)self->_objectSaliencyRects count];
}

- (id)objectSaliencyRectsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_objectSaliencyRects objectAtIndex:a3];
}

+ (Class)objectSaliencyRectsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDuplicateMatchingData
{
  return self->_duplicateMatchingData != 0;
}

- (BOOL)hasDuplicateMatchingAlternateData
{
  return self->_duplicateMatchingAlternateData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MADProtoSceneAsset;
  id v4 = [(MADProtoSceneAsset *)&v8 description];
  v5 = [(MADProtoSceneAsset *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if (assetCloudIdentifier) {
    [v3 setObject:assetCloudIdentifier forKey:@"assetCloudIdentifier"];
  }
  v6 = [NSNumber numberWithDouble:self->_assetAdjustmentTimestamp];
  [v4 setObject:v6 forKey:@"assetAdjustmentTimestamp"];

  v7 = [NSNumber numberWithInt:self->_algorithmVersion];
  [v4 setObject:v7 forKey:@"algorithmVersion"];

  objc_super v8 = [NSNumber numberWithDouble:self->_adjustmentVersion];
  [v4 setObject:v8 forKey:@"adjustmentVersion"];

  if ([(NSMutableArray *)self->_sceneClassifications count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sceneClassifications, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v11 = self->_sceneClassifications;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v91 objects:v96 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v92 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v91 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v91 objects:v96 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"sceneClassifications"];
  }
  *(float *)&double v9 = self->_overallAestheticScore;
  v17 = [NSNumber numberWithFloat:v9];
  [v4 setObject:v17 forKey:@"overallAestheticScore"];

  *(float *)&double v18 = self->_wellFramedSubjectScore;
  v19 = [NSNumber numberWithFloat:v18];
  [v4 setObject:v19 forKey:@"wellFramedSubjectScore"];

  *(float *)&double v20 = self->_wellChosenSubjectScore;
  v21 = [NSNumber numberWithFloat:v20];
  [v4 setObject:v21 forKey:@"wellChosenSubjectScore"];

  *(float *)&double v22 = self->_tastefullyBlurredScore;
  v23 = [NSNumber numberWithFloat:v22];
  [v4 setObject:v23 forKey:@"tastefullyBlurredScore"];

  *(float *)&double v24 = self->_sharplyFocusedSubjectScore;
  v25 = [NSNumber numberWithFloat:v24];
  [v4 setObject:v25 forKey:@"sharplyFocusedSubjectScore"];

  *(float *)&double v26 = self->_wellTimedShotScore;
  v27 = [NSNumber numberWithFloat:v26];
  [v4 setObject:v27 forKey:@"wellTimedShotScore"];

  *(float *)&double v28 = self->_pleasantLightingScore;
  v29 = [NSNumber numberWithFloat:v28];
  [v4 setObject:v29 forKey:@"pleasantLightingScore"];

  *(float *)&double v30 = self->_pleasantReflectionsScore;
  v31 = [NSNumber numberWithFloat:v30];
  [v4 setObject:v31 forKey:@"pleasantReflectionsScore"];

  *(float *)&double v32 = self->_harmoniousColorScore;
  v33 = [NSNumber numberWithFloat:v32];
  [v4 setObject:v33 forKey:@"harmoniousColorScore"];

  *(float *)&double v34 = self->_livelyColorScore;
  v35 = [NSNumber numberWithFloat:v34];
  [v4 setObject:v35 forKey:@"livelyColorScore"];

  *(float *)&double v36 = self->_pleasantSymmetryScore;
  v37 = [NSNumber numberWithFloat:v36];
  [v4 setObject:v37 forKey:@"pleasantSymmetryScore"];

  *(float *)&double v38 = self->_pleasantPatternScore;
  v39 = [NSNumber numberWithFloat:v38];
  [v4 setObject:v39 forKey:@"pleasantPatternScore"];

  *(float *)&double v40 = self->_immersivenessScore;
  v41 = [NSNumber numberWithFloat:v40];
  [v4 setObject:v41 forKey:@"immersivenessScore"];

  *(float *)&double v42 = self->_pleasantPerspectiveScore;
  v43 = [NSNumber numberWithFloat:v42];
  [v4 setObject:v43 forKey:@"pleasantPerspectiveScore"];

  *(float *)&double v44 = self->_pleasantPostProcessingScore;
  v45 = [NSNumber numberWithFloat:v44];
  [v4 setObject:v45 forKey:@"pleasantPostProcessingScore"];

  *(float *)&double v46 = self->_noiseScore;
  v47 = [NSNumber numberWithFloat:v46];
  [v4 setObject:v47 forKey:@"noiseScore"];

  *(float *)&double v48 = self->_failureScore;
  v49 = [NSNumber numberWithFloat:v48];
  [v4 setObject:v49 forKey:@"failureScore"];

  *(float *)&double v50 = self->_pleasantCompositionScore;
  v51 = [NSNumber numberWithFloat:v50];
  [v4 setObject:v51 forKey:@"pleasantCompositionScore"];

  *(float *)&double v52 = self->_interestingSubjectScore;
  v53 = [NSNumber numberWithFloat:v52];
  [v4 setObject:v53 forKey:@"interestingSubjectScore"];

  *(float *)&double v54 = self->_intrusiveObjectPresenceScore;
  v55 = [NSNumber numberWithFloat:v54];
  [v4 setObject:v55 forKey:@"intrusiveObjectPresenceScore"];

  *(float *)&double v56 = self->_pleasantCameraTiltScore;
  v57 = [NSNumber numberWithFloat:v56];
  [v4 setObject:v57 forKey:@"pleasantCameraTiltScore"];

  *(float *)&double v58 = self->_lowLight;
  v59 = [NSNumber numberWithFloat:v58];
  [v4 setObject:v59 forKey:@"lowLight"];

  preferredCropRect = self->_preferredCropRect;
  if (preferredCropRect)
  {
    v61 = [(VCPProtoBounds *)preferredCropRect dictionaryRepresentation];
    [v4 setObject:v61 forKey:@"preferredCropRect"];
  }
  acceptableCropRect = self->_acceptableCropRect;
  if (acceptableCropRect)
  {
    v63 = [(VCPProtoBounds *)acceptableCropRect dictionaryRepresentation];
    [v4 setObject:v63 forKey:@"acceptableCropRect"];
  }
  if ([(NSMutableArray *)self->_objectSaliencyRects count])
  {
    v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_objectSaliencyRects, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v66 = self->_objectSaliencyRects;
    uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v87 objects:v95 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v68; ++j)
        {
          if (*(void *)v88 != v69) {
            objc_enumerationMutation(v66);
          }
          v71 = objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * j), "dictionaryRepresentation", (void)v87);
          [v65 addObject:v71];
        }
        uint64_t v68 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v87 objects:v95 count:16];
      }
      while (v68);
    }

    [v4 setObject:v65 forKey:@"objectSaliencyRects"];
  }
  sceneprintData = self->_sceneprintData;
  if (sceneprintData) {
    [v4 setObject:sceneprintData forKey:@"sceneprintData"];
  }
  *(float *)&double v64 = self->_wallpaperScore;
  v73 = objc_msgSend(NSNumber, "numberWithFloat:", v64, (void)v87);
  [v4 setObject:v73 forKey:@"wallpaperScore"];

  colorNormalizationData = self->_colorNormalizationData;
  if (colorNormalizationData) {
    [v4 setObject:colorNormalizationData forKey:@"colorNormalizationData"];
  }
  *(float *)&double v74 = self->_blurrinessScore;
  v76 = [NSNumber numberWithFloat:v74];
  [v4 setObject:v76 forKey:@"blurrinessScore"];

  *(float *)&double v77 = self->_exposureScore;
  v78 = [NSNumber numberWithFloat:v77];
  [v4 setObject:v78 forKey:@"exposureScore"];

  v79 = [NSNumber numberWithInt:self->_probableRotationDirection];
  [v4 setObject:v79 forKey:@"probableRotationDirection"];

  *(float *)&double v80 = self->_probableRotationDirectionConfidence;
  v81 = [NSNumber numberWithFloat:v80];
  [v4 setObject:v81 forKey:@"probableRotationDirectionConfidence"];

  duplicateMatchingData = self->_duplicateMatchingData;
  if (duplicateMatchingData) {
    [v4 setObject:duplicateMatchingData forKey:@"duplicateMatchingData"];
  }
  duplicateMatchingAlternateData = self->_duplicateMatchingAlternateData;
  if (duplicateMatchingAlternateData) {
    [v4 setObject:duplicateMatchingAlternateData forKey:@"duplicateMatchingAlternateData"];
  }
  *(float *)&double v82 = self->_iconicScore;
  v85 = [NSNumber numberWithFloat:v82];
  [v4 setObject:v85 forKey:@"iconicScore"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoSceneAssetReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_sceneClassifications;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_objectSaliencyRects;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  PBDataWriterWriteDataField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteDataField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteFloatField();
  if (self->_duplicateMatchingData) {
    PBDataWriterWriteDataField();
  }
  if (self->_duplicateMatchingAlternateData) {
    PBDataWriterWriteDataField();
  }
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  [v13 setAssetCloudIdentifier:self->_assetCloudIdentifier];
  *((void *)v13 + 2) = *(void *)&self->_assetAdjustmentTimestamp;
  *((_DWORD *)v13 + 8) = self->_algorithmVersion;
  *((void *)v13 + 1) = *(void *)&self->_adjustmentVersion;
  if ([(MADProtoSceneAsset *)self sceneClassificationsCount])
  {
    [v13 clearSceneClassifications];
    unint64_t v4 = [(MADProtoSceneAsset *)self sceneClassificationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MADProtoSceneAsset *)self sceneClassificationsAtIndex:i];
        [v13 addSceneClassifications:v7];
      }
    }
  }
  *((_DWORD *)v13 + 32) = LODWORD(self->_overallAestheticScore);
  *((_DWORD *)v13 + 54) = LODWORD(self->_wellFramedSubjectScore);
  *((_DWORD *)v13 + 53) = LODWORD(self->_wellChosenSubjectScore);
  *((_DWORD *)v13 + 51) = LODWORD(self->_tastefullyBlurredScore);
  *((_DWORD *)v13 + 50) = LODWORD(self->_sharplyFocusedSubjectScore);
  *((_DWORD *)v13 + 55) = LODWORD(self->_wellTimedShotScore);
  *((_DWORD *)v13 + 35) = LODWORD(self->_pleasantLightingScore);
  *((_DWORD *)v13 + 39) = LODWORD(self->_pleasantReflectionsScore);
  *((_DWORD *)v13 + 22) = LODWORD(self->_harmoniousColorScore);
  *((_DWORD *)v13 + 27) = LODWORD(self->_livelyColorScore);
  *((_DWORD *)v13 + 40) = LODWORD(self->_pleasantSymmetryScore);
  *((_DWORD *)v13 + 36) = LODWORD(self->_pleasantPatternScore);
  *((_DWORD *)v13 + 24) = LODWORD(self->_immersivenessScore);
  *((_DWORD *)v13 + 37) = LODWORD(self->_pleasantPerspectiveScore);
  *((_DWORD *)v13 + 38) = LODWORD(self->_pleasantPostProcessingScore);
  *((_DWORD *)v13 + 29) = LODWORD(self->_noiseScore);
  *((_DWORD *)v13 + 21) = LODWORD(self->_failureScore);
  *((_DWORD *)v13 + 34) = LODWORD(self->_pleasantCompositionScore);
  *((_DWORD *)v13 + 25) = LODWORD(self->_interestingSubjectScore);
  *((_DWORD *)v13 + 26) = LODWORD(self->_intrusiveObjectPresenceScore);
  *((_DWORD *)v13 + 33) = LODWORD(self->_pleasantCameraTiltScore);
  *((_DWORD *)v13 + 28) = LODWORD(self->_lowLight);
  [v13 setPreferredCropRect:self->_preferredCropRect];
  [v13 setAcceptableCropRect:self->_acceptableCropRect];
  if ([(MADProtoSceneAsset *)self objectSaliencyRectsCount])
  {
    [v13 clearObjectSaliencyRects];
    unint64_t v8 = [(MADProtoSceneAsset *)self objectSaliencyRectsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(MADProtoSceneAsset *)self objectSaliencyRectsAtIndex:j];
        [v13 addObjectSaliencyRects:v11];
      }
    }
  }
  [v13 setSceneprintData:self->_sceneprintData];
  *((_DWORD *)v13 + 52) = LODWORD(self->_wallpaperScore);
  [v13 setColorNormalizationData:self->_colorNormalizationData];
  uint64_t v12 = (float *)v13;
  *((_DWORD *)v13 + 12) = LODWORD(self->_blurrinessScore);
  *((_DWORD *)v13 + 20) = LODWORD(self->_exposureScore);
  *((_DWORD *)v13 + 44) = self->_probableRotationDirection;
  *((_DWORD *)v13 + 45) = LODWORD(self->_probableRotationDirectionConfidence);
  if (self->_duplicateMatchingData)
  {
    objc_msgSend(v13, "setDuplicateMatchingData:");
    uint64_t v12 = (float *)v13;
  }
  if (self->_duplicateMatchingAlternateData)
  {
    objc_msgSend(v13, "setDuplicateMatchingAlternateData:");
    uint64_t v12 = (float *)v13;
  }
  v12[23] = self->_iconicScore;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_assetCloudIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(double *)(v5 + 16) = self->_assetAdjustmentTimestamp;
  *(_DWORD *)(v5 + 32) = self->_algorithmVersion;
  *(double *)(v5 + 8) = self->_adjustmentVersion;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  unint64_t v8 = self->_sceneClassifications;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addSceneClassifications:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v10);
  }

  *(float *)(v5 + 128) = self->_overallAestheticScore;
  *(float *)(v5 + 216) = self->_wellFramedSubjectScore;
  *(float *)(v5 + 212) = self->_wellChosenSubjectScore;
  *(float *)(v5 + 204) = self->_tastefullyBlurredScore;
  *(float *)(v5 + 200) = self->_sharplyFocusedSubjectScore;
  *(float *)(v5 + 220) = self->_wellTimedShotScore;
  *(float *)(v5 + 140) = self->_pleasantLightingScore;
  *(float *)(v5 + 156) = self->_pleasantReflectionsScore;
  *(float *)(v5 + 88) = self->_harmoniousColorScore;
  *(float *)(v5 + 108) = self->_livelyColorScore;
  *(float *)(v5 + 160) = self->_pleasantSymmetryScore;
  *(float *)(v5 + 144) = self->_pleasantPatternScore;
  *(float *)(v5 + 96) = self->_immersivenessScore;
  *(float *)(v5 + 148) = self->_pleasantPerspectiveScore;
  *(float *)(v5 + 152) = self->_pleasantPostProcessingScore;
  *(float *)(v5 + 116) = self->_noiseScore;
  *(float *)(v5 + 84) = self->_failureScore;
  *(float *)(v5 + 136) = self->_pleasantCompositionScore;
  *(float *)(v5 + 100) = self->_interestingSubjectScore;
  *(float *)(v5 + 104) = self->_intrusiveObjectPresenceScore;
  *(float *)(v5 + 132) = self->_pleasantCameraTiltScore;
  *(float *)(v5 + 112) = self->_lowLight;
  id v14 = [(VCPProtoBounds *)self->_preferredCropRect copyWithZone:a3];
  long long v15 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v14;

  id v16 = [(VCPProtoBounds *)self->_acceptableCropRect copyWithZone:a3];
  long long v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v18 = self->_objectSaliencyRects;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v22), "copyWithZone:", a3, (void)v33);
        [(id)v5 addObjectSaliencyRects:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [(NSData *)self->_sceneprintData copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v24;

  *(float *)(v5 + 208) = self->_wallpaperScore;
  uint64_t v26 = [(NSData *)self->_colorNormalizationData copyWithZone:a3];
  v27 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v26;

  *(float *)(v5 + 48) = self->_blurrinessScore;
  *(float *)(v5 + 80) = self->_exposureScore;
  *(_DWORD *)(v5 + 176) = self->_probableRotationDirection;
  *(float *)(v5 + 180) = self->_probableRotationDirectionConfidence;
  uint64_t v28 = [(NSData *)self->_duplicateMatchingData copyWithZone:a3];
  v29 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v28;

  uint64_t v30 = [(NSData *)self->_duplicateMatchingAlternateData copyWithZone:a3];
  v31 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v30;

  *(float *)(v5 + 92) = self->_iconicScore;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if ((unint64_t)assetCloudIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](assetCloudIdentifier, "isEqual:")) {
      goto LABEL_51;
    }
  }
  if (self->_assetAdjustmentTimestamp != *((double *)v4 + 2)) {
    goto LABEL_51;
  }
  if (self->_algorithmVersion != *((_DWORD *)v4 + 8)) {
    goto LABEL_51;
  }
  if (self->_adjustmentVersion != *((double *)v4 + 1)) {
    goto LABEL_51;
  }
  sceneClassifications = self->_sceneClassifications;
  if ((unint64_t)sceneClassifications | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](sceneClassifications, "isEqual:")) {
      goto LABEL_51;
    }
  }
  if (self->_overallAestheticScore == *((float *)v4 + 32)
    && self->_wellFramedSubjectScore == *((float *)v4 + 54)
    && self->_wellChosenSubjectScore == *((float *)v4 + 53)
    && self->_tastefullyBlurredScore == *((float *)v4 + 51)
    && self->_sharplyFocusedSubjectScore == *((float *)v4 + 50)
    && self->_wellTimedShotScore == *((float *)v4 + 55)
    && self->_pleasantLightingScore == *((float *)v4 + 35)
    && self->_pleasantReflectionsScore == *((float *)v4 + 39)
    && self->_harmoniousColorScore == *((float *)v4 + 22)
    && self->_livelyColorScore == *((float *)v4 + 27)
    && self->_pleasantSymmetryScore == *((float *)v4 + 40)
    && self->_pleasantPatternScore == *((float *)v4 + 36)
    && self->_immersivenessScore == *((float *)v4 + 24)
    && self->_pleasantPerspectiveScore == *((float *)v4 + 37)
    && self->_pleasantPostProcessingScore == *((float *)v4 + 38)
    && self->_noiseScore == *((float *)v4 + 29)
    && self->_failureScore == *((float *)v4 + 21)
    && self->_pleasantCompositionScore == *((float *)v4 + 34)
    && self->_interestingSubjectScore == *((float *)v4 + 25)
    && self->_intrusiveObjectPresenceScore == *((float *)v4 + 26)
    && self->_pleasantCameraTiltScore == *((float *)v4 + 33)
    && self->_lowLight == *((float *)v4 + 28)
    && ((preferredCropRect = self->_preferredCropRect, !((unint64_t)preferredCropRect | *((void *)v4 + 21)))
     || -[VCPProtoBounds isEqual:](preferredCropRect, "isEqual:"))
    && ((acceptableCropRect = self->_acceptableCropRect, !((unint64_t)acceptableCropRect | *((void *)v4 + 3)))
     || -[VCPProtoBounds isEqual:](acceptableCropRect, "isEqual:"))
    && ((objectSaliencyRects = self->_objectSaliencyRects,
         !((unint64_t)objectSaliencyRects | *((void *)v4 + 15)))
     || -[NSMutableArray isEqual:](objectSaliencyRects, "isEqual:"))
    && ((sceneprintData = self->_sceneprintData, !((unint64_t)sceneprintData | *((void *)v4 + 24)))
     || -[NSData isEqual:](sceneprintData, "isEqual:"))
    && self->_wallpaperScore == *((float *)v4 + 52)
    && ((colorNormalizationData = self->_colorNormalizationData,
         !((unint64_t)colorNormalizationData | *((void *)v4 + 7)))
     || -[NSData isEqual:](colorNormalizationData, "isEqual:"))
    && self->_blurrinessScore == *((float *)v4 + 12)
    && self->_exposureScore == *((float *)v4 + 20)
    && self->_probableRotationDirection == *((_DWORD *)v4 + 44)
    && self->_probableRotationDirectionConfidence == *((float *)v4 + 45)
    && ((duplicateMatchingData = self->_duplicateMatchingData,
         !((unint64_t)duplicateMatchingData | *((void *)v4 + 9)))
     || -[NSData isEqual:](duplicateMatchingData, "isEqual:"))
    && ((duplicateMatchingAlternateData = self->_duplicateMatchingAlternateData,
         !((unint64_t)duplicateMatchingAlternateData | *((void *)v4 + 8)))
     || -[NSData isEqual:](duplicateMatchingAlternateData, "isEqual:")))
  {
    BOOL v14 = self->_iconicScore == *((float *)v4 + 23);
  }
  else
  {
LABEL_51:
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v183 = [(NSString *)self->_assetCloudIdentifier hash];
  double assetAdjustmentTimestamp = self->_assetAdjustmentTimestamp;
  double v4 = -assetAdjustmentTimestamp;
  if (assetAdjustmentTimestamp >= 0.0) {
    double v4 = self->_assetAdjustmentTimestamp;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  uint64_t algorithmVersion = self->_algorithmVersion;
  unint64_t v182 = v7;
  double adjustmentVersion = self->_adjustmentVersion;
  double v9 = -adjustmentVersion;
  if (adjustmentVersion >= 0.0) {
    double v9 = self->_adjustmentVersion;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  unint64_t v180 = v12;
  uint64_t v179 = [(NSMutableArray *)self->_sceneClassifications hash];
  float overallAestheticScore = self->_overallAestheticScore;
  float v14 = -overallAestheticScore;
  if (overallAestheticScore >= 0.0) {
    float v14 = self->_overallAestheticScore;
  }
  float v15 = floorf(v14 + 0.5);
  float v16 = (float)(v14 - v15) * 1.8447e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabsf(v16);
  }
  unint64_t v178 = v17;
  float wellFramedSubjectScore = self->_wellFramedSubjectScore;
  float v19 = -wellFramedSubjectScore;
  if (wellFramedSubjectScore >= 0.0) {
    float v19 = self->_wellFramedSubjectScore;
  }
  float v20 = floorf(v19 + 0.5);
  float v21 = (float)(v19 - v20) * 1.8447e19;
  unint64_t v22 = 2654435761u * (unint64_t)fmodf(v20, 1.8447e19);
  if (v21 >= 0.0)
  {
    if (v21 > 0.0) {
      v22 += (unint64_t)v21;
    }
  }
  else
  {
    v22 -= (unint64_t)fabsf(v21);
  }
  unint64_t v177 = v22;
  float wellChosenSubjectScore = self->_wellChosenSubjectScore;
  float v24 = -wellChosenSubjectScore;
  if (wellChosenSubjectScore >= 0.0) {
    float v24 = self->_wellChosenSubjectScore;
  }
  float v25 = floorf(v24 + 0.5);
  float v26 = (float)(v24 - v25) * 1.8447e19;
  unint64_t v27 = 2654435761u * (unint64_t)fmodf(v25, 1.8447e19);
  if (v26 >= 0.0)
  {
    if (v26 > 0.0) {
      v27 += (unint64_t)v26;
    }
  }
  else
  {
    v27 -= (unint64_t)fabsf(v26);
  }
  unint64_t v176 = v27;
  float tastefullyBlurredScore = self->_tastefullyBlurredScore;
  float v29 = -tastefullyBlurredScore;
  if (tastefullyBlurredScore >= 0.0) {
    float v29 = self->_tastefullyBlurredScore;
  }
  float v30 = floorf(v29 + 0.5);
  float v31 = (float)(v29 - v30) * 1.8447e19;
  unint64_t v32 = 2654435761u * (unint64_t)fmodf(v30, 1.8447e19);
  if (v31 >= 0.0)
  {
    if (v31 > 0.0) {
      v32 += (unint64_t)v31;
    }
  }
  else
  {
    v32 -= (unint64_t)fabsf(v31);
  }
  unint64_t v175 = v32;
  float sharplyFocusedSubjectScore = self->_sharplyFocusedSubjectScore;
  float v34 = -sharplyFocusedSubjectScore;
  if (sharplyFocusedSubjectScore >= 0.0) {
    float v34 = self->_sharplyFocusedSubjectScore;
  }
  float v35 = floorf(v34 + 0.5);
  float v36 = (float)(v34 - v35) * 1.8447e19;
  unint64_t v37 = 2654435761u * (unint64_t)fmodf(v35, 1.8447e19);
  if (v36 >= 0.0)
  {
    if (v36 > 0.0) {
      v37 += (unint64_t)v36;
    }
  }
  else
  {
    v37 -= (unint64_t)fabsf(v36);
  }
  unint64_t v174 = v37;
  float wellTimedShotScore = self->_wellTimedShotScore;
  float v39 = -wellTimedShotScore;
  if (wellTimedShotScore >= 0.0) {
    float v39 = self->_wellTimedShotScore;
  }
  float v40 = floorf(v39 + 0.5);
  float v41 = (float)(v39 - v40) * 1.8447e19;
  unint64_t v42 = 2654435761u * (unint64_t)fmodf(v40, 1.8447e19);
  if (v41 >= 0.0)
  {
    if (v41 > 0.0) {
      v42 += (unint64_t)v41;
    }
  }
  else
  {
    v42 -= (unint64_t)fabsf(v41);
  }
  unint64_t v173 = v42;
  float pleasantLightingScore = self->_pleasantLightingScore;
  float v44 = -pleasantLightingScore;
  if (pleasantLightingScore >= 0.0) {
    float v44 = self->_pleasantLightingScore;
  }
  float v45 = floorf(v44 + 0.5);
  float v46 = (float)(v44 - v45) * 1.8447e19;
  unint64_t v47 = 2654435761u * (unint64_t)fmodf(v45, 1.8447e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0) {
      v47 += (unint64_t)v46;
    }
  }
  else
  {
    v47 -= (unint64_t)fabsf(v46);
  }
  unint64_t v172 = v47;
  float pleasantReflectionsScore = self->_pleasantReflectionsScore;
  float v49 = -pleasantReflectionsScore;
  if (pleasantReflectionsScore >= 0.0) {
    float v49 = self->_pleasantReflectionsScore;
  }
  float v50 = floorf(v49 + 0.5);
  float v51 = (float)(v49 - v50) * 1.8447e19;
  unint64_t v52 = 2654435761u * (unint64_t)fmodf(v50, 1.8447e19);
  if (v51 >= 0.0)
  {
    if (v51 > 0.0) {
      v52 += (unint64_t)v51;
    }
  }
  else
  {
    v52 -= (unint64_t)fabsf(v51);
  }
  unint64_t v171 = v52;
  float harmoniousColorScore = self->_harmoniousColorScore;
  float v54 = -harmoniousColorScore;
  if (harmoniousColorScore >= 0.0) {
    float v54 = self->_harmoniousColorScore;
  }
  float v55 = floorf(v54 + 0.5);
  float v56 = (float)(v54 - v55) * 1.8447e19;
  unint64_t v57 = 2654435761u * (unint64_t)fmodf(v55, 1.8447e19);
  if (v56 >= 0.0)
  {
    if (v56 > 0.0) {
      v57 += (unint64_t)v56;
    }
  }
  else
  {
    v57 -= (unint64_t)fabsf(v56);
  }
  unint64_t v170 = v57;
  float livelyColorScore = self->_livelyColorScore;
  float v59 = -livelyColorScore;
  if (livelyColorScore >= 0.0) {
    float v59 = self->_livelyColorScore;
  }
  float v60 = floorf(v59 + 0.5);
  float v61 = (float)(v59 - v60) * 1.8447e19;
  unint64_t v62 = 2654435761u * (unint64_t)fmodf(v60, 1.8447e19);
  if (v61 >= 0.0)
  {
    if (v61 > 0.0) {
      v62 += (unint64_t)v61;
    }
  }
  else
  {
    v62 -= (unint64_t)fabsf(v61);
  }
  unint64_t v169 = v62;
  float pleasantSymmetryScore = self->_pleasantSymmetryScore;
  float v64 = -pleasantSymmetryScore;
  if (pleasantSymmetryScore >= 0.0) {
    float v64 = self->_pleasantSymmetryScore;
  }
  float v65 = floorf(v64 + 0.5);
  float v66 = (float)(v64 - v65) * 1.8447e19;
  unint64_t v67 = 2654435761u * (unint64_t)fmodf(v65, 1.8447e19);
  if (v66 >= 0.0)
  {
    if (v66 > 0.0) {
      v67 += (unint64_t)v66;
    }
  }
  else
  {
    v67 -= (unint64_t)fabsf(v66);
  }
  unint64_t v168 = v67;
  float pleasantPatternScore = self->_pleasantPatternScore;
  float v69 = -pleasantPatternScore;
  if (pleasantPatternScore >= 0.0) {
    float v69 = self->_pleasantPatternScore;
  }
  float v70 = floorf(v69 + 0.5);
  float v71 = (float)(v69 - v70) * 1.8447e19;
  unint64_t v72 = 2654435761u * (unint64_t)fmodf(v70, 1.8447e19);
  if (v71 >= 0.0)
  {
    if (v71 > 0.0) {
      v72 += (unint64_t)v71;
    }
  }
  else
  {
    v72 -= (unint64_t)fabsf(v71);
  }
  unint64_t v167 = v72;
  float immersivenessScore = self->_immersivenessScore;
  float v74 = -immersivenessScore;
  if (immersivenessScore >= 0.0) {
    float v74 = self->_immersivenessScore;
  }
  float v75 = floorf(v74 + 0.5);
  float v76 = (float)(v74 - v75) * 1.8447e19;
  unint64_t v77 = 2654435761u * (unint64_t)fmodf(v75, 1.8447e19);
  if (v76 >= 0.0)
  {
    if (v76 > 0.0) {
      v77 += (unint64_t)v76;
    }
  }
  else
  {
    v77 -= (unint64_t)fabsf(v76);
  }
  unint64_t v166 = v77;
  float pleasantPerspectiveScore = self->_pleasantPerspectiveScore;
  float v79 = -pleasantPerspectiveScore;
  if (pleasantPerspectiveScore >= 0.0) {
    float v79 = self->_pleasantPerspectiveScore;
  }
  float v80 = floorf(v79 + 0.5);
  float v81 = (float)(v79 - v80) * 1.8447e19;
  unint64_t v82 = 2654435761u * (unint64_t)fmodf(v80, 1.8447e19);
  if (v81 >= 0.0)
  {
    if (v81 > 0.0) {
      v82 += (unint64_t)v81;
    }
  }
  else
  {
    v82 -= (unint64_t)fabsf(v81);
  }
  unint64_t v165 = v82;
  float pleasantPostProcessingScore = self->_pleasantPostProcessingScore;
  float v84 = -pleasantPostProcessingScore;
  if (pleasantPostProcessingScore >= 0.0) {
    float v84 = self->_pleasantPostProcessingScore;
  }
  float v85 = floorf(v84 + 0.5);
  float v86 = (float)(v84 - v85) * 1.8447e19;
  unint64_t v87 = 2654435761u * (unint64_t)fmodf(v85, 1.8447e19);
  if (v86 >= 0.0)
  {
    if (v86 > 0.0) {
      v87 += (unint64_t)v86;
    }
  }
  else
  {
    v87 -= (unint64_t)fabsf(v86);
  }
  unint64_t v164 = v87;
  float noiseScore = self->_noiseScore;
  float v89 = -noiseScore;
  if (noiseScore >= 0.0) {
    float v89 = self->_noiseScore;
  }
  float v90 = floorf(v89 + 0.5);
  float v91 = (float)(v89 - v90) * 1.8447e19;
  unint64_t v92 = 2654435761u * (unint64_t)fmodf(v90, 1.8447e19);
  if (v91 >= 0.0)
  {
    if (v91 > 0.0) {
      v92 += (unint64_t)v91;
    }
  }
  else
  {
    v92 -= (unint64_t)fabsf(v91);
  }
  unint64_t v163 = v92;
  float failureScore = self->_failureScore;
  float v94 = -failureScore;
  if (failureScore >= 0.0) {
    float v94 = self->_failureScore;
  }
  float v95 = floorf(v94 + 0.5);
  float v96 = (float)(v94 - v95) * 1.8447e19;
  unint64_t v97 = 2654435761u * (unint64_t)fmodf(v95, 1.8447e19);
  if (v96 >= 0.0)
  {
    if (v96 > 0.0) {
      v97 += (unint64_t)v96;
    }
  }
  else
  {
    v97 -= (unint64_t)fabsf(v96);
  }
  unint64_t v162 = v97;
  float pleasantCompositionScore = self->_pleasantCompositionScore;
  float v99 = -pleasantCompositionScore;
  if (pleasantCompositionScore >= 0.0) {
    float v99 = self->_pleasantCompositionScore;
  }
  float v100 = floorf(v99 + 0.5);
  float v101 = (float)(v99 - v100) * 1.8447e19;
  unint64_t v102 = 2654435761u * (unint64_t)fmodf(v100, 1.8447e19);
  if (v101 >= 0.0)
  {
    if (v101 > 0.0) {
      v102 += (unint64_t)v101;
    }
  }
  else
  {
    v102 -= (unint64_t)fabsf(v101);
  }
  unint64_t v161 = v102;
  float interestingSubjectScore = self->_interestingSubjectScore;
  float v104 = -interestingSubjectScore;
  if (interestingSubjectScore >= 0.0) {
    float v104 = self->_interestingSubjectScore;
  }
  float v105 = floorf(v104 + 0.5);
  float v106 = (float)(v104 - v105) * 1.8447e19;
  unint64_t v107 = 2654435761u * (unint64_t)fmodf(v105, 1.8447e19);
  if (v106 >= 0.0)
  {
    if (v106 > 0.0) {
      v107 += (unint64_t)v106;
    }
  }
  else
  {
    v107 -= (unint64_t)fabsf(v106);
  }
  unint64_t v160 = v107;
  float intrusiveObjectPresenceScore = self->_intrusiveObjectPresenceScore;
  float v109 = -intrusiveObjectPresenceScore;
  if (intrusiveObjectPresenceScore >= 0.0) {
    float v109 = self->_intrusiveObjectPresenceScore;
  }
  float v110 = floorf(v109 + 0.5);
  float v111 = (float)(v109 - v110) * 1.8447e19;
  unint64_t v112 = 2654435761u * (unint64_t)fmodf(v110, 1.8447e19);
  if (v111 >= 0.0)
  {
    if (v111 > 0.0) {
      v112 += (unint64_t)v111;
    }
  }
  else
  {
    v112 -= (unint64_t)fabsf(v111);
  }
  unint64_t v159 = v112;
  float pleasantCameraTiltScore = self->_pleasantCameraTiltScore;
  float v114 = -pleasantCameraTiltScore;
  if (pleasantCameraTiltScore >= 0.0) {
    float v114 = self->_pleasantCameraTiltScore;
  }
  float v115 = floorf(v114 + 0.5);
  float v116 = (float)(v114 - v115) * 1.8447e19;
  unint64_t v117 = 2654435761u * (unint64_t)fmodf(v115, 1.8447e19);
  if (v116 >= 0.0)
  {
    if (v116 > 0.0) {
      v117 += (unint64_t)v116;
    }
  }
  else
  {
    v117 -= (unint64_t)fabsf(v116);
  }
  unint64_t v158 = v117;
  float lowLight = self->_lowLight;
  float v119 = -lowLight;
  if (lowLight >= 0.0) {
    float v119 = self->_lowLight;
  }
  float v120 = floorf(v119 + 0.5);
  float v121 = (float)(v119 - v120) * 1.8447e19;
  unint64_t v122 = 2654435761u * (unint64_t)fmodf(v120, 1.8447e19);
  if (v121 >= 0.0)
  {
    if (v121 > 0.0) {
      v122 += (unint64_t)v121;
    }
  }
  else
  {
    v122 -= (unint64_t)fabsf(v121);
  }
  unint64_t v157 = [(VCPProtoBounds *)self->_preferredCropRect hash];
  unint64_t v156 = [(VCPProtoBounds *)self->_acceptableCropRect hash];
  uint64_t v155 = [(NSMutableArray *)self->_objectSaliencyRects hash];
  uint64_t v154 = [(NSData *)self->_sceneprintData hash];
  float wallpaperScore = self->_wallpaperScore;
  float v124 = -wallpaperScore;
  if (wallpaperScore >= 0.0) {
    float v124 = self->_wallpaperScore;
  }
  float v125 = floorf(v124 + 0.5);
  float v126 = (float)(v124 - v125) * 1.8447e19;
  unint64_t v127 = 2654435761u * (unint64_t)fmodf(v125, 1.8447e19);
  if (v126 >= 0.0)
  {
    if (v126 > 0.0) {
      v127 += (unint64_t)v126;
    }
  }
  else
  {
    v127 -= (unint64_t)fabsf(v126);
  }
  uint64_t v152 = [(NSData *)self->_colorNormalizationData hash];
  float blurrinessScore = self->_blurrinessScore;
  float v129 = -blurrinessScore;
  if (blurrinessScore >= 0.0) {
    float v129 = self->_blurrinessScore;
  }
  float v130 = floorf(v129 + 0.5);
  float v131 = (float)(v129 - v130) * 1.8447e19;
  unint64_t v132 = 2654435761u * (unint64_t)fmodf(v130, 1.8447e19);
  if (v131 >= 0.0)
  {
    if (v131 > 0.0) {
      v132 += (unint64_t)v131;
    }
  }
  else
  {
    v132 -= (unint64_t)fabsf(v131);
  }
  float exposureScore = self->_exposureScore;
  float v134 = -exposureScore;
  if (exposureScore >= 0.0) {
    float v134 = self->_exposureScore;
  }
  float v135 = floorf(v134 + 0.5);
  float v136 = (float)(v134 - v135) * 1.8447e19;
  unint64_t v137 = 2654435761u * (unint64_t)fmodf(v135, 1.8447e19);
  if (v136 >= 0.0)
  {
    if (v136 > 0.0) {
      v137 += (unint64_t)v136;
    }
  }
  else
  {
    v137 -= (unint64_t)fabsf(v136);
  }
  uint64_t probableRotationDirection = self->_probableRotationDirection;
  float probableRotationDirectionConfidence = self->_probableRotationDirectionConfidence;
  float v140 = -probableRotationDirectionConfidence;
  if (probableRotationDirectionConfidence >= 0.0) {
    float v140 = self->_probableRotationDirectionConfidence;
  }
  float v141 = floorf(v140 + 0.5);
  float v142 = (float)(v140 - v141) * 1.8447e19;
  unint64_t v143 = 2654435761u * (unint64_t)fmodf(v141, 1.8447e19);
  if (v142 >= 0.0)
  {
    if (v142 > 0.0) {
      v143 += (unint64_t)v142;
    }
  }
  else
  {
    v143 -= (unint64_t)fabsf(v142);
  }
  uint64_t v144 = [(NSData *)self->_duplicateMatchingData hash];
  uint64_t v145 = [(NSData *)self->_duplicateMatchingAlternateData hash];
  float iconicScore = self->_iconicScore;
  float v147 = -iconicScore;
  if (iconicScore >= 0.0) {
    float v147 = self->_iconicScore;
  }
  float v148 = floorf(v147 + 0.5);
  float v149 = (float)(v147 - v148) * 1.8447e19;
  unint64_t v150 = 2654435761u * (unint64_t)fmodf(v148, 1.8447e19);
  if (v149 >= 0.0)
  {
    if (v149 > 0.0) {
      v150 += (unint64_t)v149;
    }
  }
  else
  {
    v150 -= (unint64_t)fabsf(v149);
  }
  return v182 ^ v183 ^ (2654435761 * algorithmVersion) ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v122 ^ v157 ^ v156 ^ v155 ^ v154 ^ v127 ^ v153 ^ v132 ^ v137 ^ (2654435761 * probableRotationDirection) ^ v143 ^ v144 ^ v145 ^ v150;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[MADProtoSceneAsset setAssetCloudIdentifier:](self, "setAssetCloudIdentifier:");
  }
  self->_double assetAdjustmentTimestamp = *((double *)v4 + 2);
  self->_uint64_t algorithmVersion = *((_DWORD *)v4 + 8);
  self->_double adjustmentVersion = *((double *)v4 + 1);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = *((id *)v4 + 23);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [(MADProtoSceneAsset *)self addSceneClassifications:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  self->_float overallAestheticScore = *((float *)v4 + 32);
  self->_float wellFramedSubjectScore = *((float *)v4 + 54);
  self->_float wellChosenSubjectScore = *((float *)v4 + 53);
  self->_float tastefullyBlurredScore = *((float *)v4 + 51);
  self->_float sharplyFocusedSubjectScore = *((float *)v4 + 50);
  self->_float wellTimedShotScore = *((float *)v4 + 55);
  self->_float pleasantLightingScore = *((float *)v4 + 35);
  self->_float pleasantReflectionsScore = *((float *)v4 + 39);
  self->_float harmoniousColorScore = *((float *)v4 + 22);
  self->_float livelyColorScore = *((float *)v4 + 27);
  self->_float pleasantSymmetryScore = *((float *)v4 + 40);
  self->_float pleasantPatternScore = *((float *)v4 + 36);
  self->_float immersivenessScore = *((float *)v4 + 24);
  self->_float pleasantPerspectiveScore = *((float *)v4 + 37);
  self->_float pleasantPostProcessingScore = *((float *)v4 + 38);
  self->_float noiseScore = *((float *)v4 + 29);
  self->_float failureScore = *((float *)v4 + 21);
  self->_float pleasantCompositionScore = *((float *)v4 + 34);
  self->_float interestingSubjectScore = *((float *)v4 + 25);
  self->_float intrusiveObjectPresenceScore = *((float *)v4 + 26);
  self->_float pleasantCameraTiltScore = *((float *)v4 + 33);
  self->_float lowLight = *((float *)v4 + 28);
  preferredCropRect = self->_preferredCropRect;
  uint64_t v11 = *((void *)v4 + 21);
  if (preferredCropRect)
  {
    if (v11) {
      -[VCPProtoBounds mergeFrom:](preferredCropRect, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[MADProtoSceneAsset setPreferredCropRect:](self, "setPreferredCropRect:");
  }
  acceptableCropRect = self->_acceptableCropRect;
  uint64_t v13 = *((void *)v4 + 3);
  if (acceptableCropRect)
  {
    if (v13) {
      -[VCPProtoBounds mergeFrom:](acceptableCropRect, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[MADProtoSceneAsset setAcceptableCropRect:](self, "setAcceptableCropRect:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 15);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[MADProtoSceneAsset addObjectSaliencyRects:](self, "addObjectSaliencyRects:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }

  if (*((void *)v4 + 24)) {
    -[MADProtoSceneAsset setSceneprintData:](self, "setSceneprintData:");
  }
  self->_float wallpaperScore = *((float *)v4 + 52);
  if (*((void *)v4 + 7)) {
    -[MADProtoSceneAsset setColorNormalizationData:](self, "setColorNormalizationData:");
  }
  self->_float blurrinessScore = *((float *)v4 + 12);
  self->_float exposureScore = *((float *)v4 + 20);
  self->_uint64_t probableRotationDirection = *((_DWORD *)v4 + 44);
  self->_float probableRotationDirectionConfidence = *((float *)v4 + 45);
  if (*((void *)v4 + 9)) {
    -[MADProtoSceneAsset setDuplicateMatchingData:](self, "setDuplicateMatchingData:");
  }
  if (*((void *)v4 + 8)) {
    -[MADProtoSceneAsset setDuplicateMatchingAlternateData:](self, "setDuplicateMatchingAlternateData:");
  }
  self->_float iconicScore = *((float *)v4 + 23);
}

- (NSString)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (void)setAssetCloudIdentifier:(id)a3
{
}

- (double)assetAdjustmentTimestamp
{
  return self->_assetAdjustmentTimestamp;
}

- (void)setAssetAdjustmentTimestamp:(double)a3
{
  self->_double assetAdjustmentTimestamp = a3;
}

- (int)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setAlgorithmVersion:(int)a3
{
  self->_uint64_t algorithmVersion = a3;
}

- (double)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentVersion:(double)a3
{
  self->_double adjustmentVersion = a3;
}

- (NSMutableArray)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneClassifications:(id)a3
{
}

- (float)overallAestheticScore
{
  return self->_overallAestheticScore;
}

- (void)setOverallAestheticScore:(float)a3
{
  self->_float overallAestheticScore = a3;
}

- (float)wellFramedSubjectScore
{
  return self->_wellFramedSubjectScore;
}

- (void)setWellFramedSubjectScore:(float)a3
{
  self->_float wellFramedSubjectScore = a3;
}

- (float)wellChosenSubjectScore
{
  return self->_wellChosenSubjectScore;
}

- (void)setWellChosenSubjectScore:(float)a3
{
  self->_float wellChosenSubjectScore = a3;
}

- (float)tastefullyBlurredScore
{
  return self->_tastefullyBlurredScore;
}

- (void)setTastefullyBlurredScore:(float)a3
{
  self->_float tastefullyBlurredScore = a3;
}

- (float)sharplyFocusedSubjectScore
{
  return self->_sharplyFocusedSubjectScore;
}

- (void)setSharplyFocusedSubjectScore:(float)a3
{
  self->_float sharplyFocusedSubjectScore = a3;
}

- (float)wellTimedShotScore
{
  return self->_wellTimedShotScore;
}

- (void)setWellTimedShotScore:(float)a3
{
  self->_float wellTimedShotScore = a3;
}

- (float)pleasantLightingScore
{
  return self->_pleasantLightingScore;
}

- (void)setPleasantLightingScore:(float)a3
{
  self->_float pleasantLightingScore = a3;
}

- (float)pleasantReflectionsScore
{
  return self->_pleasantReflectionsScore;
}

- (void)setPleasantReflectionsScore:(float)a3
{
  self->_float pleasantReflectionsScore = a3;
}

- (float)harmoniousColorScore
{
  return self->_harmoniousColorScore;
}

- (void)setHarmoniousColorScore:(float)a3
{
  self->_float harmoniousColorScore = a3;
}

- (float)livelyColorScore
{
  return self->_livelyColorScore;
}

- (void)setLivelyColorScore:(float)a3
{
  self->_float livelyColorScore = a3;
}

- (float)pleasantSymmetryScore
{
  return self->_pleasantSymmetryScore;
}

- (void)setPleasantSymmetryScore:(float)a3
{
  self->_float pleasantSymmetryScore = a3;
}

- (float)pleasantPatternScore
{
  return self->_pleasantPatternScore;
}

- (void)setPleasantPatternScore:(float)a3
{
  self->_float pleasantPatternScore = a3;
}

- (float)immersivenessScore
{
  return self->_immersivenessScore;
}

- (void)setImmersivenessScore:(float)a3
{
  self->_float immersivenessScore = a3;
}

- (float)pleasantPerspectiveScore
{
  return self->_pleasantPerspectiveScore;
}

- (void)setPleasantPerspectiveScore:(float)a3
{
  self->_float pleasantPerspectiveScore = a3;
}

- (float)pleasantPostProcessingScore
{
  return self->_pleasantPostProcessingScore;
}

- (void)setPleasantPostProcessingScore:(float)a3
{
  self->_float pleasantPostProcessingScore = a3;
}

- (float)noiseScore
{
  return self->_noiseScore;
}

- (void)setNoiseScore:(float)a3
{
  self->_float noiseScore = a3;
}

- (float)failureScore
{
  return self->_failureScore;
}

- (void)setFailureScore:(float)a3
{
  self->_float failureScore = a3;
}

- (float)pleasantCompositionScore
{
  return self->_pleasantCompositionScore;
}

- (void)setPleasantCompositionScore:(float)a3
{
  self->_float pleasantCompositionScore = a3;
}

- (float)interestingSubjectScore
{
  return self->_interestingSubjectScore;
}

- (void)setInterestingSubjectScore:(float)a3
{
  self->_float interestingSubjectScore = a3;
}

- (float)intrusiveObjectPresenceScore
{
  return self->_intrusiveObjectPresenceScore;
}

- (void)setIntrusiveObjectPresenceScore:(float)a3
{
  self->_float intrusiveObjectPresenceScore = a3;
}

- (float)pleasantCameraTiltScore
{
  return self->_pleasantCameraTiltScore;
}

- (void)setPleasantCameraTiltScore:(float)a3
{
  self->_float pleasantCameraTiltScore = a3;
}

- (float)lowLight
{
  return self->_lowLight;
}

- (void)setLowLight:(float)a3
{
  self->_float lowLight = a3;
}

- (VCPProtoBounds)preferredCropRect
{
  return self->_preferredCropRect;
}

- (void)setPreferredCropRect:(id)a3
{
}

- (VCPProtoBounds)acceptableCropRect
{
  return self->_acceptableCropRect;
}

- (void)setAcceptableCropRect:(id)a3
{
}

- (NSMutableArray)objectSaliencyRects
{
  return self->_objectSaliencyRects;
}

- (void)setObjectSaliencyRects:(id)a3
{
}

- (NSData)sceneprintData
{
  return self->_sceneprintData;
}

- (void)setSceneprintData:(id)a3
{
}

- (float)wallpaperScore
{
  return self->_wallpaperScore;
}

- (void)setWallpaperScore:(float)a3
{
  self->_float wallpaperScore = a3;
}

- (NSData)colorNormalizationData
{
  return self->_colorNormalizationData;
}

- (void)setColorNormalizationData:(id)a3
{
}

- (float)blurrinessScore
{
  return self->_blurrinessScore;
}

- (void)setBlurrinessScore:(float)a3
{
  self->_float blurrinessScore = a3;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(float)a3
{
  self->_float exposureScore = a3;
}

- (int)probableRotationDirection
{
  return self->_probableRotationDirection;
}

- (void)setProbableRotationDirection:(int)a3
{
  self->_uint64_t probableRotationDirection = a3;
}

- (float)probableRotationDirectionConfidence
{
  return self->_probableRotationDirectionConfidence;
}

- (void)setProbableRotationDirectionConfidence:(float)a3
{
  self->_float probableRotationDirectionConfidence = a3;
}

- (NSData)duplicateMatchingData
{
  return self->_duplicateMatchingData;
}

- (void)setDuplicateMatchingData:(id)a3
{
}

- (NSData)duplicateMatchingAlternateData
{
  return self->_duplicateMatchingAlternateData;
}

- (void)setDuplicateMatchingAlternateData:(id)a3
{
}

- (float)iconicScore
{
  return self->_iconicScore;
}

- (void)setIconicScore:(float)a3
{
  self->_float iconicScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneprintData, 0);
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
  objc_storeStrong((id *)&self->_preferredCropRect, 0);
  objc_storeStrong((id *)&self->_objectSaliencyRects, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingData, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingAlternateData, 0);
  objc_storeStrong((id *)&self->_colorNormalizationData, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_acceptableCropRect, 0);
}

+ (id)protoFromPhotosAsset:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MADProtoSceneAsset);
  id v5 = [v3 photoLibrary];
  uint64_t v6 = [v3 localIdentifier];
  id v49 = 0;
  uint64_t v7 = objc_msgSend(v5, "mad_cloudIdentifierForLocalIdentifier:error:", v6, &v49);
  id v8 = v49;
  [(MADProtoSceneAsset *)v4 setAssetCloudIdentifier:v7];

  double v9 = [(MADProtoSceneAsset *)v4 assetCloudIdentifier];

  if (v9)
  {
    id v40 = v8;
    long double v10 = [v3 adjustmentTimestamp];
    [v10 timeIntervalSinceReferenceDate];
    -[MADProtoSceneAsset setAssetAdjustmentTimestamp:](v4, "setAssetAdjustmentTimestamp:");

    uint64_t v11 = [v3 sceneAnalysisProperties];
    -[MADProtoSceneAsset setAlgorithmVersion:](v4, "setAlgorithmVersion:", [v11 sceneAnalysisVersion]);
    float v39 = v11;
    unint64_t v12 = [v11 sceneAnalysisTimestamp];
    [v12 timeIntervalSinceReferenceDate];
    -[MADProtoSceneAsset setAdjustmentVersion:](v4, "setAdjustmentVersion:");

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v13 = [v3 sceneClassifications];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = +[MADProtoSceneClassification protoFromPhotosSceneClassification:*(void *)(*((void *)&v45 + 1) + 8 * i)];
          [(MADProtoSceneAsset *)v4 addSceneClassifications:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v15);
    }

    [v3 overallAestheticScore];
    -[MADProtoSceneAsset setOverallAestheticScore:](v4, "setOverallAestheticScore:");
    long long v19 = [v3 aestheticProperties];
    [v19 wellFramedSubjectScore];
    -[MADProtoSceneAsset setWellFramedSubjectScore:](v4, "setWellFramedSubjectScore:");
    [v19 wellChosenSubjectScore];
    -[MADProtoSceneAsset setWellChosenSubjectScore:](v4, "setWellChosenSubjectScore:");
    [v19 tastefullyBlurredScore];
    -[MADProtoSceneAsset setTastefullyBlurredScore:](v4, "setTastefullyBlurredScore:");
    [v19 sharplyFocusedSubjectScore];
    -[MADProtoSceneAsset setSharplyFocusedSubjectScore:](v4, "setSharplyFocusedSubjectScore:");
    [v19 wellTimedShotScore];
    -[MADProtoSceneAsset setWellTimedShotScore:](v4, "setWellTimedShotScore:");
    [v19 pleasantLightingScore];
    -[MADProtoSceneAsset setPleasantLightingScore:](v4, "setPleasantLightingScore:");
    [v19 pleasantReflectionsScore];
    -[MADProtoSceneAsset setPleasantReflectionsScore:](v4, "setPleasantReflectionsScore:");
    [v19 harmoniousColorScore];
    -[MADProtoSceneAsset setHarmoniousColorScore:](v4, "setHarmoniousColorScore:");
    [v19 livelyColorScore];
    -[MADProtoSceneAsset setLivelyColorScore:](v4, "setLivelyColorScore:");
    [v19 pleasantSymmetryScore];
    -[MADProtoSceneAsset setPleasantSymmetryScore:](v4, "setPleasantSymmetryScore:");
    [v19 pleasantPatternScore];
    -[MADProtoSceneAsset setPleasantPatternScore:](v4, "setPleasantPatternScore:");
    [v19 immersivenessScore];
    -[MADProtoSceneAsset setImmersivenessScore:](v4, "setImmersivenessScore:");
    [v19 pleasantPerspectiveScore];
    -[MADProtoSceneAsset setPleasantPerspectiveScore:](v4, "setPleasantPerspectiveScore:");
    [v19 pleasantPostProcessingScore];
    -[MADProtoSceneAsset setPleasantPostProcessingScore:](v4, "setPleasantPostProcessingScore:");
    [v19 noiseScore];
    -[MADProtoSceneAsset setNoiseScore:](v4, "setNoiseScore:");
    [v19 failureScore];
    -[MADProtoSceneAsset setFailureScore:](v4, "setFailureScore:");
    [v19 pleasantCompositionScore];
    -[MADProtoSceneAsset setPleasantCompositionScore:](v4, "setPleasantCompositionScore:");
    [v19 interestingSubjectScore];
    -[MADProtoSceneAsset setInterestingSubjectScore:](v4, "setInterestingSubjectScore:");
    [v19 intrusiveObjectPresenceScore];
    -[MADProtoSceneAsset setIntrusiveObjectPresenceScore:](v4, "setIntrusiveObjectPresenceScore:");
    [v19 pleasantCameraTiltScore];
    -[MADProtoSceneAsset setPleasantCameraTiltScore:](v4, "setPleasantCameraTiltScore:");
    [v19 lowLight];
    -[MADProtoSceneAsset setLowLight:](v4, "setLowLight:");
    [v3 preferredCropRect];
    long long v20 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
    [(MADProtoSceneAsset *)v4 setPreferredCropRect:v20];

    [v3 acceptableCropRect];
    long long v21 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
    [(MADProtoSceneAsset *)v4 setAcceptableCropRect:v21];

    long long v22 = [v3 curationProperties];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v23 = [v22 objectSaliencyRects];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * j) rectValue];
          uint64_t v28 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
          [(MADProtoSceneAsset *)v4 addObjectSaliencyRects:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v25);
    }

    uint64_t v29 = [v3 mediaAnalysisProperties];
    [v29 wallpaperScore];
    -[MADProtoSceneAsset setWallpaperScore:](v4, "setWallpaperScore:");
    float v30 = [v29 colorNormalizationData];
    [(MADProtoSceneAsset *)v4 setColorNormalizationData:v30];

    [v29 blurrinessScore];
    -[MADProtoSceneAsset setBlurrinessScore:](v4, "setBlurrinessScore:");
    [v29 exposureScore];
    -[MADProtoSceneAsset setExposureScore:](v4, "setExposureScore:");
    -[MADProtoSceneAsset setProbableRotationDirection:](v4, "setProbableRotationDirection:", [v29 probableRotationDirection]);
    [v29 probableRotationDirectionConfidence];
    -[MADProtoSceneAsset setProbableRotationDirectionConfidence:](v4, "setProbableRotationDirectionConfidence:");
    float v31 = [v3 sceneprintProperties];
    unint64_t v32 = [v31 sceneprint];
    [(MADProtoSceneAsset *)v4 setSceneprintData:v32];

    long long v33 = [v31 duplicateMatchingData];
    [(MADProtoSceneAsset *)v4 setDuplicateMatchingData:v33];

    float v34 = [v31 duplicateMatchingAlternateData];
    [(MADProtoSceneAsset *)v4 setDuplicateMatchingAlternateData:v34];

    float v35 = [v3 iconicScoreProperties];
    [v35 iconicScore];
    *(float *)&double v36 = v36;
    [(MADProtoSceneAsset *)v4 setIconicScore:v36];
    unint64_t v37 = v4;

    id v8 = v40;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[MADProtoAssetOCRAnalysis(Photos) protoFromPhotosAsset:](v3, (uint64_t)v8);
    }
    unint64_t v37 = 0;
  }

  return v37;
}

- (void)persistToPhotosAsset:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F38ED8], "changeRequestForAsset:");
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v6 = [(MADProtoSceneAsset *)self sceneClassifications];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v38 + 1) + 8 * i) photosSceneClassification];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
  }

  __int16 v12 = [(MADProtoSceneAsset *)self algorithmVersion];
  uint64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
  [(MADProtoSceneAsset *)self adjustmentVersion];
  uint64_t v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  [v4 setSceneClassifications:v5 ofType:0 version:v12 timestamp:v14];

  [(MADProtoSceneAsset *)self overallAestheticScore];
  objc_msgSend(v4, "setOverallAestheticScore:");
  [(MADProtoSceneAsset *)self wellFramedSubjectScore];
  objc_msgSend(v4, "setWellFramedSubjectScore:");
  [(MADProtoSceneAsset *)self wellChosenSubjectScore];
  objc_msgSend(v4, "setWellChosenSubjectScore:");
  [(MADProtoSceneAsset *)self tastefullyBlurredScore];
  objc_msgSend(v4, "setTastefullyBlurredScore:");
  [(MADProtoSceneAsset *)self sharplyFocusedSubjectScore];
  objc_msgSend(v4, "setSharplyFocusedSubjectScore:");
  [(MADProtoSceneAsset *)self wellTimedShotScore];
  objc_msgSend(v4, "setWellTimedShotScore:");
  [(MADProtoSceneAsset *)self pleasantLightingScore];
  objc_msgSend(v4, "setPleasantLightingScore:");
  [(MADProtoSceneAsset *)self pleasantReflectionsScore];
  objc_msgSend(v4, "setPleasantReflectionsScore:");
  [(MADProtoSceneAsset *)self harmoniousColorScore];
  objc_msgSend(v4, "setHarmoniousColorScore:");
  [(MADProtoSceneAsset *)self livelyColorScore];
  objc_msgSend(v4, "setLivelyColorScore:");
  [(MADProtoSceneAsset *)self pleasantSymmetryScore];
  objc_msgSend(v4, "setPleasantSymmetryScore:");
  [(MADProtoSceneAsset *)self pleasantPatternScore];
  objc_msgSend(v4, "setPleasantPatternScore:");
  [(MADProtoSceneAsset *)self immersivenessScore];
  objc_msgSend(v4, "setImmersivenessScore:");
  [(MADProtoSceneAsset *)self pleasantPerspectiveScore];
  objc_msgSend(v4, "setPleasantPerspectiveScore:");
  [(MADProtoSceneAsset *)self pleasantPostProcessingScore];
  objc_msgSend(v4, "setPleasantPostProcessingScore:");
  [(MADProtoSceneAsset *)self noiseScore];
  objc_msgSend(v4, "setNoiseScore:");
  [(MADProtoSceneAsset *)self failureScore];
  objc_msgSend(v4, "setFailureScore:");
  [(MADProtoSceneAsset *)self pleasantCompositionScore];
  objc_msgSend(v4, "setPleasantCompositionScore:");
  [(MADProtoSceneAsset *)self interestingSubjectScore];
  objc_msgSend(v4, "setInterestingSubjectScore:");
  [(MADProtoSceneAsset *)self intrusiveObjectPresenceScore];
  objc_msgSend(v4, "setIntrusiveObjectPresenceScore:");
  [(MADProtoSceneAsset *)self pleasantCameraTiltScore];
  objc_msgSend(v4, "setPleasantCameraTiltScore:");
  [(MADProtoSceneAsset *)self lowLight];
  objc_msgSend(v4, "setLowLight:");
  uint64_t v15 = [(MADProtoSceneAsset *)self preferredCropRect];
  [v15 rectValue];
  objc_msgSend(v4, "setPreferredCropRectWithNormalizedRect:");

  uint64_t v16 = [(MADProtoSceneAsset *)self acceptableCropRect];
  [v16 rectValue];
  objc_msgSend(v4, "setAcceptableCropRectWithNormalizedRect:");

  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v18 = [(MADProtoSceneAsset *)self objectSaliencyRects];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = (void *)MEMORY[0x1E4F29238];
        [*(id *)(*((void *)&v34 + 1) + 8 * j) rectValue];
        uint64_t v24 = objc_msgSend(v23, "valueWithRect:");
        [v17 addObject:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }

  [v4 setObjectSaliencyRects:v17];
  uint64_t v25 = [(MADProtoSceneAsset *)self sceneprintData];
  [v4 setSceneprintData:v25];

  [(MADProtoSceneAsset *)self wallpaperScore];
  objc_msgSend(v4, "setWallpaperScore:");
  uint64_t v26 = [(MADProtoSceneAsset *)self colorNormalizationData];
  [v4 setColorNormalizationData:v26];

  [(MADProtoSceneAsset *)self blurrinessScore];
  objc_msgSend(v4, "setBlurrinessScore:");
  [(MADProtoSceneAsset *)self exposureScore];
  objc_msgSend(v4, "setExposureScore:");
  objc_msgSend(v4, "setProbableRotationDirection:", (__int16)-[MADProtoSceneAsset probableRotationDirection](self, "probableRotationDirection"));
  [(MADProtoSceneAsset *)self probableRotationDirectionConfidence];
  objc_msgSend(v4, "setProbableRotationDirectionConfidence:");
  unint64_t v27 = [(MADProtoSceneAsset *)self duplicateMatchingData];
  if (v27)
  {
    uint64_t v28 = [(MADProtoSceneAsset *)self duplicateMatchingAlternateData];
    BOOL v29 = v28 != 0;
  }
  else
  {
    BOOL v29 = 0;
  }

  float v30 = [(MADProtoSceneAsset *)self duplicateMatchingData];
  float v31 = [(MADProtoSceneAsset *)self duplicateMatchingAlternateData];
  [v4 setDuplicateMatchingData:v30 duplicateMatchingAlternateData:v31 processingSucceeded:v29];

  [(MADProtoSceneAsset *)self iconicScore];
  [v4 setIconicScore:v32];
  if (objc_msgSend(v33, "mad_isEligibleForComputeSync")) {
    objc_msgSend(v4, "setLocalAnalysisStage:", objc_msgSend(v33, "mad_analysisStageAfterCompletingAnalysis:", 2));
  }
}

@end