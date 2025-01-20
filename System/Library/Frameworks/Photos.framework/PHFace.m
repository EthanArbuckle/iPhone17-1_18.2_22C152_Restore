@interface PHFace
+ (BOOL)managedObjectSupportsBodyDetection;
+ (BOOL)managedObjectSupportsDetectionType;
+ (BOOL)managedObjectSupportsFaceState;
+ (Class)propertySetClassForPropertySet:(id)a3;
+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3;
+ (id)analyticsPropertiesToFetch;
+ (id)corePropertiesToFetch;
+ (id)croppingPropertiesToFetch;
+ (id)entityKeyMap;
+ (id)fetchFacesForFaceCrop:(id)a3 options:(id)a4;
+ (id)fetchFacesForPerson:(id)a3 options:(id)a4;
+ (id)fetchFacesGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4;
+ (id)fetchFacesInAsset:(id)a3 options:(id)a4;
+ (id)fetchFacesInAssets:(id)a3 options:(id)a4;
+ (id)fetchFacesInFaceGroup:(id)a3 options:(id)a4;
+ (id)fetchFacesOnAssetWithFace:(id)a3 options:(id)a4;
+ (id)fetchFacesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchFacesWithOptions:(id)a3;
+ (id)fetchFacesWithVuObservationIDs:(id)a3 options:(id)a4;
+ (id)fetchKeyFaceByPersonLocalIdentifierForPersons:(id)a3 options:(id)a4;
+ (id)fetchKeyFaceForFaceGroup:(id)a3 options:(id)a4;
+ (id)fetchKeyFaceForPerson:(id)a3 options:(id)a4;
+ (id)fetchRejectedFacesForPerson:(id)a3 options:(id)a4;
+ (id)fetchSingletonFacesWithOptions:(id)a3;
+ (id)fetchSuggestedFacesForPerson:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)genderAgePropertiesToFetch;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)personBuilderPropertiesToFetch;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)propertySetAccessorsByPropertySet;
+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (int64_t)faceFetchTypeForOptions:(id)a3;
+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3;
- (BOOL)hasFaceMask;
- (BOOL)hasSmile;
- (BOOL)isConfirmedFaceCropGenerationPending;
- (BOOL)isHidden;
- (BOOL)isInTrash;
- (BOOL)isInVIPModel;
- (BOOL)isLeftEyeClosed;
- (BOOL)isRightEyeClosed;
- (BOOL)isTorsoOnly;
- (BOOL)manual;
- (CGRect)gazeRect;
- (Class)changeRequestClass;
- (NSString)personLocalIdentifier;
- (NSString)personUUID;
- (PHFace)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (double)blurScore;
- (double)bodyCenterX;
- (double)bodyCenterY;
- (double)bodyHeight;
- (double)bodyWidth;
- (double)centerX;
- (double)centerY;
- (double)duration;
- (double)gazeCenterX;
- (double)gazeCenterY;
- (double)poseYaw;
- (double)quality;
- (double)roll;
- (double)size;
- (double)startTime;
- (float)gazeAngle;
- (float)gazeConfidence;
- (id)_createPropertyObjectOfClass:(Class)a3;
- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4;
- (id)adjustmentVersion;
- (id)faceClusteringProperties;
- (int)trainingType;
- (int64_t)clusterSequenceNumber;
- (int64_t)faceAlgorithmVersion;
- (int64_t)nameSource;
- (int64_t)qualityMeasure;
- (int64_t)sourceHeight;
- (int64_t)sourceWidth;
- (int64_t)vuObservationID;
- (signed)confirmedFaceCropGenerationState;
- (signed)detectionType;
- (unsigned)ageType;
- (unsigned)ethnicityType;
- (unsigned)eyeMakeupType;
- (unsigned)eyesState;
- (unsigned)faceExpressionType;
- (unsigned)facialHairType;
- (unsigned)gazeType;
- (unsigned)glassesType;
- (unsigned)hairColorType;
- (unsigned)hairType;
- (unsigned)headgearType;
- (unsigned)lipMakeupType;
- (unsigned)poseType;
- (unsigned)sexType;
- (unsigned)skintoneType;
- (unsigned)smileType;
- (void)setFaceAlgorithmVersion:(int64_t)a3;
- (void)setPoseYaw:(double)a3;
@end

@implementation PHFace

+ (id)managedEntityName
{
  return @"DetectedFace";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_31969 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_31969, &__block_literal_global_234_31970);
  }
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__31690;
  v9 = __Block_byref_object_dispose__31691;
  id v10 = 0;
  pl_dispatch_sync();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (PHFace)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v94.receiver = self;
  v94.super_class = (Class)PHFace;
  v9 = [(PHObject *)&v94 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (!v9) {
    goto LABEL_8;
  }
  id v10 = [v8 objectForKeyedSubscript:@"size"];
  [v10 doubleValue];
  v9->_size = v11;

  v12 = [v8 objectForKeyedSubscript:@"centerX"];
  [v12 doubleValue];
  v9->_centerX = v13;

  v14 = [v8 objectForKeyedSubscript:@"centerY"];
  [v14 doubleValue];
  v9->_centerY = v15;

  v16 = [v8 objectForKeyedSubscript:@"bodyCenterX"];
  [v16 doubleValue];
  v9->_bodyCenterX = v17;

  v18 = [v8 objectForKeyedSubscript:@"bodyCenterY"];
  [v18 doubleValue];
  v9->_bodyCenterY = v19;

  v20 = [v8 objectForKeyedSubscript:@"bodyWidth"];
  [v20 doubleValue];
  v9->_bodyWidth = v21;

  v22 = [v8 objectForKeyedSubscript:@"bodyHeight"];
  [v22 doubleValue];
  v9->_bodyHeight = v23;

  v24 = [v8 objectForKeyedSubscript:@"detectionType"];
  v9->_detectionType = [v24 intValue];

  v25 = [v8 objectForKeyedSubscript:@"sourceWidth"];
  v9->_sourceWidth = [v25 longLongValue];

  v26 = [v8 objectForKeyedSubscript:@"sourceHeight"];
  v9->_sourceHeight = [v26 longLongValue];

  v27 = [v8 objectForKeyedSubscript:@"roll"];
  [v27 doubleValue];
  v9->_roll = v28;

  v29 = [v8 objectForKeyedSubscript:@"hidden"];
  v9->_hidden = [v29 BOOLValue];

  v30 = [v8 objectForKeyedSubscript:@"isInTrash"];
  v9->_inTrash = [v30 BOOLValue];

  v31 = [v8 objectForKeyedSubscript:@"manual"];
  v9->_manual = [v31 BOOLValue];

  v32 = [v8 objectForKeyedSubscript:@"hasSmile"];
  v9->_hasSmile = [v32 BOOLValue];

  v33 = [v8 objectForKeyedSubscript:@"blurScore"];
  [v33 doubleValue];
  v9->_blurScore = v34;

  v35 = [v8 objectForKeyedSubscript:@"isLeftEyeClosed"];
  v9->_leftEyeClosed = [v35 BOOLValue];

  v36 = [v8 objectForKeyedSubscript:@"isRightEyeClosed"];
  v9->_rightEyeClosed = [v36 BOOLValue];

  uint64_t v37 = [v8 objectForKeyedSubscript:@"adjustmentVersion"];
  id adjustmentVersion = v9->_adjustmentVersion;
  v9->_id adjustmentVersion = (id)v37;

  v39 = [v8 objectForKeyedSubscript:@"nameSource"];
  v9->_nameSource = [v39 integerValue];

  v40 = [v8 objectForKeyedSubscript:@"trainingType"];
  v9->_trainingType = [v40 intValue];

  v41 = [v8 objectForKeyedSubscript:@"confirmedFaceCropGenerationState"];
  v9->_confirmedFaceCropGenerationState = [v41 intValue];

  v42 = [v8 objectForKeyedSubscript:@"poseYaw"];
  [v42 doubleValue];
  v9->_poseYaw = v43;

  v44 = [v8 objectForKeyedSubscript:@"faceAlgorithmVersion"];
  v9->_faceAlgorithmVersion = [v44 integerValue];

  v45 = [v8 objectForKeyedSubscript:@"clusterSequenceNumber"];
  v9->_clusterSequenceNumber = [v45 integerValue];

  v46 = [v8 objectForKeyedSubscript:@"qualityMeasure"];
  v9->_qualityMeasure = [v46 integerValue];

  v47 = [v8 objectForKeyedSubscript:@"quality"];
  [v47 doubleValue];
  v9->_quality = v48;

  v49 = [v8 objectForKeyedSubscript:@"vuObservationID"];
  v9->_vuObservationID = [v49 integerValue];

  v50 = [v8 objectForKeyedSubscript:@"ageType"];
  v9->_ageType = [v50 integerValue];

  v51 = [v8 objectForKeyedSubscript:@"genderType"];
  v9->_sexType = [v51 integerValue];

  v52 = [v8 objectForKeyedSubscript:@"eyesState"];
  v9->_eyesState = [v52 integerValue];

  v53 = [v8 objectForKeyedSubscript:@"smileType"];
  v9->_smileType = [v53 integerValue];

  v54 = [v8 objectForKeyedSubscript:@"facialHairType"];
  v9->_facialHairType = [v54 integerValue];

  v55 = [v8 objectForKeyedSubscript:@"hairColorType"];
  v9->_hairColorType = [v55 integerValue];

  v56 = [v8 objectForKeyedSubscript:@"glassesType"];
  v9->_glassesType = [v56 integerValue];

  v57 = [v8 objectForKeyedSubscript:@"eyeMakeupType"];
  v9->_eyeMakeupType = [v57 integerValue];

  v58 = [v8 objectForKeyedSubscript:@"lipMakeupType"];
  v9->_lipMakeupType = [v58 integerValue];

  v59 = [v8 objectForKeyedSubscript:@"faceExpressionType"];
  v9->_faceExpressionType = [v59 integerValue];

  v60 = [v8 objectForKeyedSubscript:@"headgearType"];
  v9->_headgearType = [v60 integerValue];

  v61 = [v8 objectForKeyedSubscript:@"hairType"];
  v9->_hairType = [v61 integerValue];

  v62 = [v8 objectForKeyedSubscript:@"poseType"];
  v9->_poseType = [v62 integerValue];

  v63 = [v8 objectForKeyedSubscript:@"skintoneType"];
  v9->_skintoneType = [v63 integerValue];

  v64 = [v8 objectForKeyedSubscript:@"ethnicityType"];
  v9->_ethnicityType = [v64 integerValue];

  v65 = [v8 objectForKeyedSubscript:@"hasFaceMask"];
  v9->_hasFaceMask = [v65 BOOLValue];

  v66 = [v8 objectForKeyedSubscript:@"gazeType"];
  v9->_gazeType = [v66 integerValue];

  v67 = [v8 objectForKeyedSubscript:@"gazeCenterX"];
  [v67 doubleValue];
  v9->_gazeCenterX = v68;

  v69 = [v8 objectForKeyedSubscript:@"gazeCenterY"];
  [v69 doubleValue];
  v9->_gazeCenterY = v70;

  v71 = (void *)MEMORY[0x1E4F8A7B0];
  v72 = [v8 objectForKeyedSubscript:@"gazeRectString"];
  [v71 cgRectFromGazeRectString:v72];
  v9->_gazeRect.origin.x = v73;
  v9->_gazeRect.origin.y = v74;
  v9->_gazeRect.size.width = v75;
  v9->_gazeRect.size.height = v76;

  v77 = [v8 objectForKeyedSubscript:@"gazeAngle"];
  [v77 floatValue];
  v9->_gazeAngle = v78;

  v79 = [v8 objectForKeyedSubscript:@"gazeConfidence"];
  [v79 floatValue];
  v9->_gazeConfidence = v80;

  v81 = [v8 objectForKeyedSubscript:@"startTime"];
  [v81 doubleValue];
  v9->_startTime = v82;

  v83 = [v8 objectForKeyedSubscript:@"duration"];
  [v83 doubleValue];
  v9->_duration = v84;

  uint64_t v85 = [v8 objectForKeyedSubscript:@"personForFace.personUUID"];
  personUUID = v9->_personUUID;
  v9->_personUUID = (NSString *)v85;

  if (!v9->_personUUID)
  {
    uint64_t v87 = [v8 objectForKeyedSubscript:@"personForTemporalDetectedFaces.personUUID"];
    v88 = v9->_personUUID;
    v9->_personUUID = (NSString *)v87;
  }
  v89 = [v8 objectForKeyedSubscript:@"vipModelType"];
  __int16 v90 = [v89 integerValue];

  if (!v90)
  {
    BOOL v91 = 0;
LABEL_10:
    v9->_isInVIPModel = v91;
    if ((a4 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v91 = v90;
  if (v90 == 1) {
    goto LABEL_10;
  }
  if ((a4 & 4) != 0) {
LABEL_7:
  }
    id v92 = [(PHFace *)v9 _createPropertyObjectOfClass:objc_opt_class() preFetchedProperties:v8];
LABEL_8:

  return v9;
}

+ (BOOL)managedObjectSupportsFaceState
{
  return 1;
}

+ (BOOL)managedObjectSupportsDetectionType
{
  return 1;
}

+ (BOOL)managedObjectSupportsBodyDetection
{
  return 1;
}

- (double)centerX
{
  return self->_centerX;
}

- (int64_t)sourceWidth
{
  return self->_sourceWidth;
}

- (int64_t)sourceHeight
{
  return self->_sourceHeight;
}

- (double)size
{
  return self->_size;
}

- (double)centerY
{
  return self->_centerY;
}

+ (int64_t)faceFetchTypeForOptions:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  if ([v3 includeTorsoAndFaceDetectionData]
    && ![v4 includeOnlyTorsoDetectionData])
  {
    int64_t v5 = 2;
    goto LABEL_8;
  }
  if (([v4 includeTorsoAndFaceDetectionData] & 1) == 0) {
    int64_t v5 = [v4 includeOnlyTorsoDetectionData];
  }
  else {
LABEL_5:
  }
    int64_t v5 = 0;
LABEL_8:

  return v5;
}

+ (id)fetchFacesInAsset:(id)a3 options:(id)a4
{
  if (a3)
  {
    v4 = +[PHQuery queryForFacesInAsset:a3 options:a4];
    int64_t v5 = [v4 executeQuery];
  }
  else
  {
    int64_t v5 = objc_alloc_init(PHFetchResult);
  }

  return v5;
}

void __36__PHFace_propertiesToFetchWithHint___block_invoke_237(uint64_t a1)
{
  v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_31972;
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 48) _composePropertiesToFetchWithHint:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_31972;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    double v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v10 setObject:v12 forKey:v11];
  }
}

+ (id)fetchKeyFaceForPerson:(id)a3 options:(id)a4
{
  if (a3)
  {
    uint64_t v4 = +[PHQuery queryForKeyFaceOnPerson:a3 options:a4];
    uint64_t v5 = [v4 executeQuery];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(PHFetchResult);
  }

  return v5;
}

id __32__PHFace_fetchFacesWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForFacesWithOptions:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_adjustmentVersion, 0);

  objc_storeStrong((id *)&self->_personUUID, 0);
}

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (float)gazeConfidence
{
  return self->_gazeConfidence;
}

- (float)gazeAngle
{
  return self->_gazeAngle;
}

- (CGRect)gazeRect
{
  double x = self->_gazeRect.origin.x;
  double y = self->_gazeRect.origin.y;
  double width = self->_gazeRect.size.width;
  double height = self->_gazeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)gazeCenterY
{
  return self->_gazeCenterY;
}

- (double)gazeCenterX
{
  return self->_gazeCenterX;
}

- (unsigned)gazeType
{
  return self->_gazeType;
}

- (BOOL)hasFaceMask
{
  return self->_hasFaceMask;
}

- (unsigned)ethnicityType
{
  return self->_ethnicityType;
}

- (unsigned)skintoneType
{
  return self->_skintoneType;
}

- (unsigned)poseType
{
  return self->_poseType;
}

- (unsigned)hairType
{
  return self->_hairType;
}

- (unsigned)headgearType
{
  return self->_headgearType;
}

- (unsigned)faceExpressionType
{
  return self->_faceExpressionType;
}

- (unsigned)lipMakeupType
{
  return self->_lipMakeupType;
}

- (unsigned)eyeMakeupType
{
  return self->_eyeMakeupType;
}

- (unsigned)glassesType
{
  return self->_glassesType;
}

- (unsigned)hairColorType
{
  return self->_hairColorType;
}

- (unsigned)facialHairType
{
  return self->_facialHairType;
}

- (unsigned)smileType
{
  return self->_smileType;
}

- (unsigned)eyesState
{
  return self->_eyesState;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (unsigned)ageType
{
  return self->_ageType;
}

- (void)setFaceAlgorithmVersion:(int64_t)a3
{
  self->_faceAlgorithmVersion = a3;
}

- (int64_t)faceAlgorithmVersion
{
  return self->_faceAlgorithmVersion;
}

- (void)setPoseYaw:(double)a3
{
  self->_poseYaw = a3;
}

- (double)poseYaw
{
  return self->_poseYaw;
}

- (int)trainingType
{
  return self->_trainingType;
}

- (int64_t)nameSource
{
  return self->_nameSource;
}

- (id)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (BOOL)isRightEyeClosed
{
  return self->_rightEyeClosed;
}

- (BOOL)isLeftEyeClosed
{
  return self->_leftEyeClosed;
}

- (double)blurScore
{
  return self->_blurScore;
}

- (BOOL)hasSmile
{
  return self->_hasSmile;
}

- (BOOL)manual
{
  return self->_manual;
}

- (BOOL)isInTrash
{
  return self->_inTrash;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isInVIPModel
{
  return self->_isInVIPModel;
}

- (double)roll
{
  return self->_roll;
}

- (signed)confirmedFaceCropGenerationState
{
  return self->_confirmedFaceCropGenerationState;
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (int64_t)vuObservationID
{
  return self->_vuObservationID;
}

- (double)quality
{
  return self->_quality;
}

- (int64_t)qualityMeasure
{
  return self->_qualityMeasure;
}

- (int64_t)clusterSequenceNumber
{
  return self->_clusterSequenceNumber;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (BOOL)isConfirmedFaceCropGenerationPending
{
  return [(PHFace *)self confirmedFaceCropGenerationState] == 1;
}

- (id)faceClusteringProperties
{
  [(PHObject *)self assertRequiredFetchPropertyHints:4];
  uint64_t v3 = objc_opt_class();

  return [(PHFace *)self _createPropertyObjectOfClass:v3];
}

- (id)_createPropertyObjectOfClass:(Class)a3
{
  return [(PHFace *)self _createPropertyObjectOfClass:a3 preFetchedProperties:0];
}

- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  id v6 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__31690;
  v41 = __Block_byref_object_dispose__31691;
  ph_objc_getAssociatedObject(self, a3);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)v38[5];
  if (!v7)
  {
    uint64_t v8 = [(objc_class *)a3 keyPathToPrimaryObject];
    if (v6)
    {
      uint64_t v9 = [[a3 alloc] initWithFetchDictionary:v6 face:self prefetched:1];
      id v10 = (__CFString *)v38[5];
      v38[5] = v9;
    }
    else
    {
      uint64_t v11 = [(objc_class *)a3 entityName];
      id v12 = (void *)v11;
      double v13 = @"DetectedFace";
      if (v11) {
        double v13 = (__CFString *)v11;
      }
      v14 = v13;

      double v15 = (void *)MEMORY[0x1E4F28F60];
      v16 = [(PHObject *)self objectID];
      if (v8) {
        [v15 predicateWithFormat:@"%K == %@", v8, v16];
      }
      else {
      double v17 = [v15 predicateWithFormat:@"self == %@", v16];
      }

      v18 = [(objc_class *)a3 propertiesToFetch];
      double v19 = [(PHObject *)self photoLibrary];
      v20 = [(objc_class *)a3 propertySetName];
      double v21 = [v19 objectFetchingManagedObjectContextForObject:self propertySet:v20];

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __60__PHFace__createPropertyObjectOfClass_preFetchedProperties___block_invoke;
      v29[3] = &unk_1E58468D0;
      id v10 = v14;
      v30 = v10;
      id v22 = v17;
      id v31 = v22;
      id v23 = v18;
      id v32 = v23;
      id v24 = v21;
      v35 = &v37;
      Class v36 = a3;
      id v33 = v24;
      double v34 = self;
      [v24 performBlockAndWait:v29];
    }
    uint64_t v25 = ph_objc_setAssociatedObjectIfNotSet(self, a3, (void *)v38[5]);
    v26 = (void *)v38[5];
    v38[5] = v25;

    uint64_t v7 = (void *)v38[5];
  }
  id v27 = v7;
  _Block_object_dispose(&v37, 8);

  return v27;
}

void __60__PHFace__createPropertyObjectOfClass_preFetchedProperties___block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  [v7 setPredicate:*(void *)(a1 + 40)];
  [v7 setPropertiesToFetch:*(void *)(a1 + 48)];
  [v7 setResultType:2];
  v2 = [*(id *)(a1 + 56) executeFetchRequest:v7 error:0];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 80)) initWithFetchDictionary:v3 face:*(void *)(a1 + 64) prefetched:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (NSString)personLocalIdentifier
{
  if (self->_personUUID)
  {
    v2 = +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:");
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (BOOL)isTorsoOnly
{
  [(PHFace *)self centerX];
  if (v3 != 0.0) {
    return 0;
  }
  [(PHFace *)self bodyCenterX];
  return v4 != 0.0;
}

+ (id)fetchSuggestedFacesForPerson:(id)a3 options:(id)a4
{
  v119[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v74 = v7;
  uint64_t v8 = [v6 photoLibrary];
  uint64_t v9 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v8 orObject:v5];

  [v9 setFetchLimit:250];
  id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v119[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v119[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
  [v9 setSortDescriptors:v12];

  [v9 setWantsIncrementalChangeDetails:0];
  CGFloat v75 = v9;
  double v13 = +[PHAsset fetchAssetsForPerson:v5 options:v9];
  CGFloat v76 = v6;
  v14 = (void *)[v6 copy];
  v88 = +[PHFace fetchFacesGroupedByAssetLocalIdentifierForAssets:v13 options:v14];

  v81 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  double v84 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v77 = v5;
  double v15 = [v5 localIdentifier];
  v83 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  obuint64_t j = v13;
  uint64_t v89 = [obj countByEnumeratingWithState:&v105 objects:v118 count:16];
  if (v89)
  {
    uint64_t v86 = *(void *)v106;
    double v16 = 0.75;
    do
    {
      for (uint64_t i = 0; i != v89; ++i)
      {
        if (*(void *)v106 != v86) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        double v19 = (void *)MEMORY[0x19F389B10]();
        v20 = [v18 localIdentifier];
        double v21 = [v88 objectForKeyedSubscript:v20];
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v101 objects:v117 count:16];
        id v24 = v22;
        if (v23)
        {
          uint64_t v25 = v23;
          BOOL v91 = v20;
          id v93 = v19;
          uint64_t v26 = *(void *)v102;
LABEL_8:
          uint64_t v27 = 0;
          while (1)
          {
            if (*(void *)v102 != v26) {
              objc_enumerationMutation(v22);
            }
            double v28 = *(void **)(*((void *)&v101 + 1) + 8 * v27);
            v29 = [v28 personLocalIdentifier];
            char v30 = [v29 isEqualToString:v15];

            if (v30) {
              break;
            }
            if (v25 == ++v27)
            {
              uint64_t v25 = [v22 countByEnumeratingWithState:&v101 objects:v117 count:16];
              if (v25) {
                goto LABEL_8;
              }
              id v24 = v22;
              v20 = v91;
              double v19 = v93;
              goto LABEL_32;
            }
          }
          id v24 = v28;

          v20 = v91;
          double v19 = v93;
          if (!v24) {
            goto LABEL_33;
          }
          [v83 addObject:v18];
          [v84 setObject:v24 forKeyedSubscript:v91];
          [v24 roll];
          if (v31 < 0.0) {
            double v31 = -v31;
          }
          double v32 = 0.0;
          if (v31 <= 3.142) {
            double v33 = (3.142 - v31) / 3.142;
          }
          else {
            double v33 = 0.0;
          }
          [v24 size];
          if (v34 >= 0.05 && v34 <= v16)
          {
            if (v34 <= 0.4)
            {
              double v32 = v34 / 0.4;
            }
            else
            {
              double v16 = 0.75;
              if (v34 >= 0.75) {
                double v32 = 0.0;
              }
              else {
                double v32 = (0.75 - v34) / 0.35;
              }
            }
          }
          [v18 overallAestheticScore];
          double v37 = ceil(v36 * 10.0) / 10.0;
          [v18 curationScore];
          double v39 = 1.0 / (double)(unint64_t)[v22 count]
              + v33 * 10.0
              + ceil(v32 * 4.0) * 0.25 * 0.1
              + v37 * 0.01
              + ceil(v38 * 10.0) / 10.0 * 0.01;
          [v24 quality];
          v41 = objc_msgSend(NSNumber, "numberWithDouble:", v39 + fmax(v40, 0.0) * 0.001);
          [v81 setObject:v41 forKeyedSubscript:v91];
        }
LABEL_32:

LABEL_33:
      }
      uint64_t v89 = [obj countByEnumeratingWithState:&v105 objects:v118 count:16];
    }
    while (v89);
  }

  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __47__PHFace_fetchSuggestedFacesForPerson_options___block_invoke;
  v99[3] = &unk_1E5846948;
  id v82 = v81;
  id v100 = v82;
  id v42 = [v83 sortedArrayUsingComparator:v99];
  if (v76 && [v76 fetchLimit]) {
    uint64_t v43 = [v76 fetchLimit];
  }
  else {
    uint64_t v43 = 4;
  }
  __int16 v90 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v43];
  v44 = [v77 photoLibrary];
  v45 = [v44 librarySpecificFetchOptions];

  [v45 setFetchLimit:1];
  [v45 setWantsIncrementalChangeDetails:0];
  float v80 = v45;
  v79 = +[PHFace fetchKeyFaceForPerson:v77 options:v45];
  v46 = [v79 firstObject];
  id v92 = [v46 localIdentifier];
  unint64_t v87 = v43;
  v47 = [MEMORY[0x1E4F1CA80] setWithCapacity:v43];
  double v48 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if (v46)
  {
    [v90 addObject:v46];
    v116 = v46;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    v50 = +[PHAsset fetchAssetsForFaces:v49 options:0];
    v51 = [v50 firstObject];

    if (v51)
    {
      v52 = [v51 creationDate];
      v53 = objc_msgSend(v48, "pl_startOfDayForDate:", v52);

      [v47 addObject:v53];
    }
  }
  float v78 = v46;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v94 = v42;
  uint64_t v54 = [v94 countByEnumeratingWithState:&v95 objects:v115 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v96;
    while (2)
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v96 != v56) {
          objc_enumerationMutation(v94);
        }
        v58 = *(void **)(*((void *)&v95 + 1) + 8 * j);
        v59 = [v58 creationDate];
        v60 = objc_msgSend(v48, "pl_startOfDayForDate:", v59);

        if (([v47 containsObject:v60] & 1) == 0)
        {
          [v47 addObject:v60];
          v61 = [v58 localIdentifier];
          v62 = [v84 objectForKeyedSubscript:v61];

          if (v62)
          {
            v63 = [v62 localIdentifier];
            char v64 = [v63 isEqualToString:v92];

            if ((v64 & 1) == 0)
            {
              [v90 addObject:v62];
              if ([v90 count] >= v87)
              {

                goto LABEL_57;
              }
            }
          }
        }
      }
      uint64_t v55 = [v94 countByEnumeratingWithState:&v95 objects:v115 count:16];
      if (v55) {
        continue;
      }
      break;
    }
  }
LABEL_57:

  v65 = [PHManualFetchResult alloc];
  v66 = [v75 photoLibrary];
  v67 = +[PHFace fetchType];
  double v68 = [v76 fetchPropertySetsAsSet];
  v69 = [(PHManualFetchResult *)v65 initWithObjects:v90 photoLibrary:v66 fetchType:v67 fetchPropertySets:v68 identifier:0 registerIfNeeded:0];

  double v70 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v71 = [(PHFetchResult *)v69 count];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 138412802;
    v110 = v15;
    __int16 v111 = 2048;
    uint64_t v112 = v71;
    __int16 v113 = 2048;
    double v114 = (v72 - v74) * 1000.0;
    _os_log_impl(&dword_19B043000, v70, OS_LOG_TYPE_DEFAULT, "Finished running suggested faces for: %@. Found %lu assets, took %f ms", buf, 0x20u);
  }

  return v69;
}

uint64_t __47__PHFace_fetchSuggestedFacesForPerson_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [a3 localIdentifier];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v6 localIdentifier];

  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

+ (id)fetchFacesGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  double v37 = __Block_byref_object_copy__31690;
  double v38 = __Block_byref_object_dispose__31691;
  id v39 = 0;
  double v7 = [v6 photoLibrary];
  if (!v7)
  {
    memset(v33, 0, sizeof(v33));
    id v8 = v5;
    if ([v8 countByEnumeratingWithState:v33 objects:v47 count:16])
    {
      double v7 = [**((id **)&v33[0] + 1) photoLibrary];
      uint64_t v9 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v7];

      id v6 = (id)v9;
    }
    else
    {
      double v7 = 0;
    }
  }
  id v10 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v5;
  uint64_t v12 = 0;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      v12 += v13;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = [*(id *)(*((void *)&v29 + 1) + 8 * v15) uuid];
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v46 count:16];
    }
    while (v13);
  }

  if (v7)
  {
    double v17 = [v7 photoLibraryForCurrentQueueQoS];
    if (v17)
    {
      if (v6)
      {
        v18 = +[PHQuery queryForFacesWithOptions:v6];
        double v19 = [v18 fetchRequest];
      }
      else
      {
        double v19 = 0;
      }
      int64_t v21 = +[PHFace faceFetchTypeForOptions:v6];
      id v22 = (void *)MEMORY[0x1E4F8A7B0];
      uint64_t v23 = [v19 predicate];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __67__PHFace_fetchFacesGroupedByAssetLocalIdentifierForAssets_options___block_invoke;
      v25[3] = &unk_1E5846920;
      double v28 = &v34;
      id v26 = v7;
      id v27 = v6;
      [v22 batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs:v10 predicate:v23 fetchType:v21 library:v17 completion:v25];

      id v20 = (id)v35[5];
    }
    else
    {
      double v19 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v41 = 0;
        __int16 v42 = 2112;
        id v43 = v6;
        __int16 v44 = 2048;
        uint64_t v45 = v12;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "No photolibrary to use for executing the batch fetching person groups: %@, options: %@, assets: %ld", buf, 0x20u);
      }
      id v20 = (id)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    double v17 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v41 = 0;
      __int16 v42 = 2112;
      id v43 = v6;
      __int16 v44 = 2048;
      uint64_t v45 = v12;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "No photolibrary to use for executing the batch fetching person groups: %@, options: %@, assets: %ld", buf, 0x20u);
    }
    id v20 = (id)MEMORY[0x1E4F1CC08];
  }

  _Block_object_dispose(&v34, 8);

  return v20;
}

void __67__PHFace_fetchFacesGroupedByAssetLocalIdentifierForAssets_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__PHFace_fetchFacesGroupedByAssetLocalIdentifierForAssets_options___block_invoke_2;
    v13[3] = &unk_1E58468F8;
    uint64_t v14 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v15 = v10;
    uint64_t v16 = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v13];

    uint64_t v12 = v14;
  }
  else
  {
    uint64_t v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Error batch fetching person groups by asset: %@", buf, 0xCu);
    }
  }
}

void __67__PHFace_fetchFacesGroupedByAssetLocalIdentifierForAssets_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v19 = +[PHObject localIdentifierWithUUID:a2];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [(PHObjectPLAdapter *)[PHFacePLAdapter alloc] initWithPLManagedObject:*(void *)(*((void *)&v20 + 1) + 8 * v11) photoLibrary:*(void *)(a1 + 32)];
        uint64_t v13 = [*(id *)(a1 + 40) fetchPropertySets];
        id v14 = [(PHFacePLAdapter *)v12 newObjectWithPropertySets:v13];

        [v6 addObject:v14];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  id v15 = [PHManualFetchResult alloc];
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = [*(id *)(a1 + 40) fetchPropertySetsAsSet];
  id v18 = [(PHManualFetchResult *)v15 initWithObjects:v6 photoLibrary:v16 fetchType:@"PHFace" fetchPropertySets:v17 identifier:0 registerIfNeeded:0];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v18 forKeyedSubscript:v19];
}

+ (id)propertySetAccessorsByPropertySet
{
  if (propertySetAccessorsByPropertySet_onceToken_31936 != -1) {
    dispatch_once(&propertySetAccessorsByPropertySet_onceToken_31936, &__block_literal_global_269);
  }
  v2 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_31937;

  return v2;
}

void __43__PHFace_propertySetAccessorsByPropertySet__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHFacePropertySetIdentifier";
  v2[1] = @"PHFacePropertySetCore";
  v3[0] = @"self";
  v3[1] = @"self";
  v2[2] = @"PHFacePropertySetClustering";
  v2[3] = @"PHFacePropertySetCropping";
  v3[2] = @"faceClusteringProperties";
  v3[3] = @"self";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_31937;
  propertySetAccessorsByPropertySet_accessorByPropertySetName_31937 = v0;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  uint64_t v3 = propertySetClassForPropertySet__onceToken_31944;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&propertySetClassForPropertySet__onceToken_31944, &__block_literal_global_266_31945);
  }
  id v5 = [(id)propertySetClassForPropertySet__propertySetClassByPropertySetName_31946 objectForKey:v4];

  return (Class)v5;
}

void __41__PHFace_propertySetClassForPropertySet___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHFacePropertySetIdentifier";
  v3[0] = objc_opt_class();
  v2[1] = @"PHFacePropertySetCore";
  v3[1] = objc_opt_class();
  v2[2] = @"PHFacePropertySetClustering";
  v3[2] = objc_opt_class();
  v2[3] = @"PHFacePropertySetCropping";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)propertySetClassForPropertySet__propertySetClassByPropertySetName_31946;
  propertySetClassForPropertySet__propertySetClassByPropertySetName_31946 = v0;
}

+ (id)fetchKeyFaceByPersonLocalIdentifierForPersons:(id)a3 options:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v15 = [v14 objectID];
        [v6 addObject:v15];
        uint64_t v16 = [v14 localIdentifier];
        [v7 setObject:v16 forKeyedSubscript:v15];

        if (!v11)
        {
          uint64_t v11 = [v14 photoLibrary];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  if ([v6 count])
  {
    double v17 = [v26 fetchPropertySets];
    if (!v17)
    {
      uint64_t v36 = @"PHFacePropertySetCore";
      double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    }
    id v18 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v19 = (void *)MEMORY[0x1E4F8A7B0];
    long long v20 = [v11 photoLibrary];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __64__PHFace_fetchKeyFaceByPersonLocalIdentifierForPersons_options___block_invoke;
    v27[3] = &unk_1E58468A8;
    id v28 = v11;
    id v29 = v17;
    id v30 = v7;
    id v21 = v18;
    id v31 = v21;
    id v22 = v17;
    [v19 batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs:v6 library:v20 completion:v27];

    long long v23 = v31;
    id v24 = v21;
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CC08];
  }

  return v24;
}

void __64__PHFace_fetchKeyFaceByPersonLocalIdentifierForPersons_options___block_invoke(id *a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PHFace_fetchKeyFaceByPersonLocalIdentifierForPersons_options___block_invoke_2;
  v4[3] = &unk_1E5846880;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  [a2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __64__PHFace_fetchKeyFaceByPersonLocalIdentifierForPersons_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v9 = [(PHObjectPLAdapter *)[PHFacePLAdapter alloc] initWithPLManagedObject:v5 photoLibrary:*(void *)(a1 + 32)];

  id v7 = [(PHFacePLAdapter *)v9 newObjectWithPropertySets:*(void *)(a1 + 40)];
  id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];

  if (v8 && v7) {
    [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (id)fetchFacesForFaceCrop:(id)a3 options:(id)a4
{
  id v4 = +[PHQuery queryForFacesOnFaceCrop:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchRejectedFacesForPerson:(id)a3 options:(id)a4
{
  if (a3)
  {
    id v4 = +[PHQuery queryForRejectedFacesOnPerson:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = objc_alloc_init(PHFetchResult);
  }

  return v5;
}

+ (id)fetchSingletonFacesWithOptions:(id)a3
{
  uint64_t v3 = +[PHQuery queryForSingletonFacesWithOptions:a3];
  id v4 = [v3 executeQuery];

  return v4;
}

+ (id)fetchKeyFaceForFaceGroup:(id)a3 options:(id)a4
{
  if (a3)
  {
    id v4 = +[PHQuery queryForKeyFaceForFaceGroup:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = objc_alloc_init(PHFetchResult);
  }

  return v5;
}

+ (id)fetchFacesInFaceGroup:(id)a3 options:(id)a4
{
  if (a3)
  {
    id v4 = +[PHQuery queryForFacesInFaceGroup:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = objc_alloc_init(PHFetchResult);
  }

  return v5;
}

+ (id)fetchFacesOnAssetWithFace:(id)a3 options:(id)a4
{
  if (a3)
  {
    id v4 = +[PHQuery queryForFacesOnAssetWithFace:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = objc_alloc_init(PHFetchResult);
  }

  return v5;
}

+ (id)fetchFacesForPerson:(id)a3 options:(id)a4
{
  if (a3)
  {
    id v4 = +[PHQuery queryForFacesForPerson:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = objc_alloc_init(PHFetchResult);
  }

  return v5;
}

+ (id)fetchFacesInAssets:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = +[PHQuery queryForFacesInAssets:v5 options:v6];
    id v8 = [v7 executeQuery];
  }
  else
  {
    id v8 = objc_alloc_init(PHFetchResult);
  }

  return v8;
}

+ (id)fetchFacesWithVuObservationIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PHFace_fetchFacesWithVuObservationIDs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __49__PHFace_fetchFacesWithVuObservationIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForFacesWithVuObservationIDs:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchFacesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PHFace_fetchFacesWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __49__PHFace_fetchFacesWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForFacesWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchFacesWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_259];
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PHFace_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_31951 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_31951, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_31952 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __46__PHFace_transformValueExpression_forKeyPath___block_invoke()
{
  v4[53] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"uuid";
  v4[1] = @"size";
  v4[2] = @"centerX";
  v4[3] = @"centerY";
  void v4[4] = @"detectionType";
  v4[5] = @"bodyCenterX";
  v4[6] = @"bodyCenterY";
  v4[7] = @"bodyWidth";
  v4[8] = @"bodyHeight";
  v4[9] = @"sourceWidth";
  v4[10] = @"sourceHeight";
  v4[11] = @"roll";
  v4[12] = @"hidden";
  v4[13] = @"manual";
  v4[14] = @"isInVIPModel";
  v4[15] = @"hasSmile";
  v4[16] = @"blurScore";
  v4[17] = @"isLeftEyeClosed";
  v4[18] = @"isRightEyeClosed";
  v4[19] = @"nameSource";
  v4[20] = @"adjustmentVersion";
  v4[21] = @"poseYaw";
  v4[22] = @"faceAlgorithmVersion";
  v4[23] = @"clusterSequenceNumber";
  v4[24] = @"qualityMeasure";
  v4[25] = @"quality";
  v4[26] = @"vuObservationID";
  v4[27] = @"confirmedFaceCropGenerationState";
  v4[28] = @"trainingType";
  v4[29] = @"ageType";
  v4[30] = @"sexType";
  v4[31] = @"eyesState";
  v4[32] = @"smileType";
  v4[33] = @"facialHairType";
  v4[34] = @"hairColorType";
  v4[35] = @"glassesType";
  v4[36] = @"eyeMakeupType";
  v4[37] = @"lipMakeupType";
  v4[38] = @"faceExpressionType";
  v4[39] = @"headgearType";
  v4[40] = @"hairType";
  v4[41] = @"poseType";
  v4[42] = @"skintoneType";
  v4[43] = @"ethnicityType";
  v4[44] = @"hasFaceMask";
  v4[45] = @"gazeType";
  v4[46] = @"gazeCenterX";
  v4[47] = @"gazeCenterY";
  v4[48] = @"gazeAngle";
  v4[49] = @"gazeConfidence";
  v4[50] = @"startTime";
  v4[51] = @"duration";
  v4[52] = @"personUUID";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:53];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_31952;
  transformValueExpression_forKeyPath___passThroughSet_31952 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_16_31964;

  return v2;
}

void __22__PHFace_entityKeyMap__block_invoke()
{
  v113[54] = *MEMORY[0x1E4F143B8];
  __int16 v44 = [PHEntityKeyMap alloc];
  v112[0] = @"uuid";
  __int16 v111 = @"uuid";
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
  v113[0] = v57;
  v112[1] = @"size";
  v110 = @"size";
  uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
  v113[1] = v56;
  v112[2] = @"centerX";
  v109 = @"centerX";
  uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
  v113[2] = v55;
  v112[3] = @"centerY";
  long long v108 = @"centerY";
  uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
  v113[3] = v54;
  v112[4] = @"detectionType";
  long long v107 = @"detectionType";
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  v113[4] = v53;
  v112[5] = @"bodyCenterX";
  long long v106 = @"bodyCenterX";
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
  v113[5] = v52;
  v112[6] = @"bodyCenterY";
  long long v105 = @"bodyCenterY";
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
  v113[6] = v51;
  v112[7] = @"bodyWidth";
  long long v104 = @"bodyWidth";
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
  v113[7] = v50;
  v112[8] = @"bodyHeight";
  long long v103 = @"bodyHeight";
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
  v113[8] = v49;
  v112[9] = @"sourceWidth";
  long long v102 = @"sourceWidth";
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  v113[9] = v48;
  v112[10] = @"sourceHeight";
  long long v101 = @"sourceHeight";
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
  v113[10] = v47;
  v112[11] = @"roll";
  id v100 = @"roll";
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
  v113[11] = v46;
  v112[12] = @"hidden";
  v99 = @"hidden";
  uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
  v113[12] = v45;
  v112[13] = @"manual";
  long long v98 = @"manual";
  id v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
  v113[13] = v43;
  v112[14] = @"vipModelType";
  long long v97 = @"isInVIPModel";
  __int16 v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
  v113[14] = v42;
  v112[15] = @"hasSmile";
  long long v96 = @"hasSmile";
  uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  v113[15] = v41;
  v112[16] = @"blurScore";
  long long v95 = @"blurScore";
  double v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
  v113[16] = v40;
  v112[17] = @"isLeftEyeClosed";
  id v94 = @"isLeftEyeClosed";
  id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
  v113[17] = v39;
  v112[18] = @"isRightEyeClosed";
  id v93 = @"isRightEyeClosed";
  uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
  v113[18] = v38;
  v112[19] = @"nameSource";
  id v92 = @"nameSource";
  double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
  v113[19] = v37;
  v112[20] = @"adjustmentVersion";
  BOOL v91 = @"adjustmentVersion";
  uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  v113[20] = v36;
  v112[21] = @"poseYaw";
  __int16 v90 = @"poseYaw";
  long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
  v113[21] = v35;
  v112[22] = @"faceAlgorithmVersion";
  uint64_t v89 = @"faceAlgorithmVersion";
  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v113[22] = v34;
  v112[23] = @"clusterSequenceNumber";
  v88 = @"clusterSequenceNumber";
  long long v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  v113[23] = v33;
  v112[24] = @"qualityMeasure";
  unint64_t v87 = @"qualityMeasure";
  long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v113[24] = v32;
  v112[25] = @"quality";
  uint64_t v86 = @"quality";
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  v113[25] = v31;
  v112[26] = @"vuObservationID";
  uint64_t v85 = @"vuObservationID";
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v113[26] = v30;
  v112[27] = @"confirmedFaceCropGenerationState";
  double v84 = @"confirmedFaceCropGenerationState";
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
  v113[27] = v29;
  v112[28] = @"trainingType";
  v83 = @"trainingType";
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v113[28] = v28;
  v112[29] = @"ageType";
  id v82 = @"ageType";
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  v113[29] = v27;
  v112[30] = @"genderType";
  v81 = @"sexType";
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  v113[30] = v26;
  v112[31] = @"eyesState";
  float v80 = @"eyesState";
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  v113[31] = v25;
  v112[32] = @"smileType";
  v79 = @"smileType";
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  v113[32] = v24;
  v112[33] = @"facialHairType";
  float v78 = @"facialHairType";
  long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
  v113[33] = v23;
  v112[34] = @"hairColorType";
  v77 = @"hairColorType";
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
  v113[34] = v22;
  v112[35] = @"glassesType";
  CGFloat v76 = @"glassesType";
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  v113[35] = v21;
  v112[36] = @"eyeMakeupType";
  CGFloat v75 = @"eyeMakeupType";
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  v113[36] = v20;
  v112[37] = @"lipMakeupType";
  double v74 = @"lipMakeupType";
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  v113[37] = v19;
  v112[38] = @"faceExpressionType";
  CGFloat v73 = @"faceExpressionType";
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
  v113[38] = v18;
  v112[39] = @"headgearType";
  double v72 = @"headgearType";
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  v113[39] = v17;
  v112[40] = @"hairType";
  uint64_t v71 = @"hairType";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  v113[40] = v16;
  v112[41] = @"poseType";
  double v70 = @"poseType";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  v113[41] = v15;
  v112[42] = @"skintoneType";
  v69 = @"skintoneType";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  v113[42] = v14;
  v112[43] = @"ethnicityType";
  double v68 = @"ethnicityType";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  v113[43] = v13;
  v112[44] = @"hasFaceMask";
  v67 = @"hasFaceMask";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  v113[44] = v12;
  v112[45] = @"gazeType";
  v66 = @"gazeType";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  v113[45] = v0;
  v112[46] = @"gazeCenterX";
  v65 = @"gazeCenterX";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  v113[46] = v1;
  v112[47] = @"gazeCenterY";
  char v64 = @"gazeCenterY";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  v113[47] = v2;
  v112[48] = @"gazeRectString";
  v63 = @"gazeRect";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  v113[48] = v3;
  v112[49] = @"gazeAngle";
  v62 = @"gazeAngle";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  v113[49] = v4;
  v112[50] = @"gazeConfidence";
  v61 = @"gazeConfidence";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  v113[50] = v5;
  v112[51] = @"startTime";
  v60 = @"startTime";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  v113[51] = v6;
  v112[52] = @"duration";
  v59 = @"duration";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  v113[52] = v7;
  v112[53] = @"personForFace.personUUID";
  v58 = @"personUUID";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  v113[53] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:54];
  uint64_t v10 = [(PHEntityKeyMap *)v44 initWithPropertyKeysByEntityKey:v9];
  uint64_t v11 = (void *)entityKeyMap_pl_once_object_16_31964;
  entityKeyMap_pl_once_object_16_31964 = v10;
}

void __36__PHFace_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_31972;
  propertiesToFetchWithHint__propertiesToFetchByHint_31972 = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.facepropertyhints", 0);
  uint64_t v3 = (void *)propertiesToFetchWithHint__propertyQueue_31971;
  propertiesToFetchWithHint__propertyQueue_31971 = (uint64_t)v2;
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  char v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    id v8 = [a1 identifierPropertiesToFetch];
    [a1 extendPropertiesToFetch:v5 withProperties:v8];

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v9 = [a1 corePropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v9];

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [a1 extendPropertiesToFetch:v5 withPropertySetClass:objc_opt_class()];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = [a1 croppingPropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v10];

  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v11 = [a1 personBuilderPropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v11];

  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  uint64_t v12 = [a1 genderAgePropertiesToFetch];
  [a1 extendPropertiesToFetch:v5 withProperties:v12];

  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    id v6 = [a1 analyticsPropertiesToFetch];
    [a1 extendPropertiesToFetch:v5 withProperties:v6];
  }
LABEL_9:

  return v5;
}

+ (id)analyticsPropertiesToFetch
{
  pl_dispatch_once();
  dispatch_queue_t v2 = (void *)analyticsPropertiesToFetch_pl_once_object_15;

  return v2;
}

void __36__PHFace_analyticsPropertiesToFetch__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"ageType";
  v3[1] = @"size";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [v0 copy];
  dispatch_queue_t v2 = (void *)analyticsPropertiesToFetch_pl_once_object_15;
  analyticsPropertiesToFetch_pl_once_object_15 = v1;
}

+ (id)genderAgePropertiesToFetch
{
  if (genderAgePropertiesToFetch_onceToken != -1) {
    dispatch_once(&genderAgePropertiesToFetch_onceToken, &__block_literal_global_229);
  }
  dispatch_queue_t v2 = (void *)genderAgePropertiesToFetch_array;

  return v2;
}

void __36__PHFace_genderAgePropertiesToFetch__block_invoke()
{
  void v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"genderType";
  v2[1] = @"ageType";
  v2[2] = @"personForFace.personUUID";
  v2[3] = @"personForTemporalDetectedFaces.personUUID";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  uint64_t v1 = (void *)genderAgePropertiesToFetch_array;
  genderAgePropertiesToFetch_arradouble y = v0;
}

+ (id)personBuilderPropertiesToFetch
{
  if (personBuilderPropertiesToFetch_onceToken != -1) {
    dispatch_once(&personBuilderPropertiesToFetch_onceToken, &__block_literal_global_227);
  }
  dispatch_queue_t v2 = (void *)personBuilderPropertiesToFetch_array;

  return v2;
}

void __40__PHFace_personBuilderPropertiesToFetch__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"clusterSequenceNumber";
  v2[1] = @"vuObservationID";
  v2[2] = @"confirmedFaceCropGenerationState";
  v2[3] = @"trainingType";
  void v2[4] = @"nameSource";
  void v2[5] = @"personForFace.personUUID";
  v2[6] = @"personForTemporalDetectedFaces.personUUID";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  uint64_t v1 = (void *)personBuilderPropertiesToFetch_array;
  personBuilderPropertiesToFetch_arradouble y = v0;
}

+ (id)croppingPropertiesToFetch
{
  if (croppingPropertiesToFetch_onceToken != -1) {
    dispatch_once(&croppingPropertiesToFetch_onceToken, &__block_literal_global_225);
  }
  dispatch_queue_t v2 = (void *)croppingPropertiesToFetch_array;

  return v2;
}

void __35__PHFace_croppingPropertiesToFetch__block_invoke()
{
  void v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"size";
  v2[1] = @"centerX";
  v2[2] = @"centerY";
  v2[3] = @"sourceWidth";
  void v2[4] = @"sourceHeight";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  uint64_t v1 = (void *)croppingPropertiesToFetch_array;
  croppingPropertiesToFetch_arradouble y = v0;
}

+ (id)corePropertiesToFetch
{
  if (corePropertiesToFetch_onceToken_31975 != -1) {
    dispatch_once(&corePropertiesToFetch_onceToken_31975, &__block_literal_global_31976);
  }
  dispatch_queue_t v2 = (void *)corePropertiesToFetch_array_31977;

  return v2;
}

void __31__PHFace_corePropertiesToFetch__block_invoke()
{
  v2[53] = *MEMORY[0x1E4F143B8];
  v2[0] = @"size";
  v2[1] = @"centerX";
  v2[2] = @"centerY";
  v2[3] = @"detectionType";
  void v2[4] = @"bodyCenterX";
  void v2[5] = @"bodyCenterY";
  void v2[6] = @"bodyWidth";
  v2[7] = @"bodyHeight";
  void v2[8] = @"sourceWidth";
  v2[9] = @"sourceHeight";
  v2[10] = @"roll";
  v2[11] = @"hidden";
  v2[12] = @"isInTrash";
  v2[13] = @"vipModelType";
  v2[14] = @"manual";
  v2[15] = @"hasSmile";
  v2[16] = @"blurScore";
  v2[17] = @"isLeftEyeClosed";
  v2[18] = @"isRightEyeClosed";
  v2[19] = @"nameSource";
  v2[20] = @"adjustmentVersion";
  v2[21] = @"poseYaw";
  v2[22] = @"faceAlgorithmVersion";
  v2[23] = @"clusterSequenceNumber";
  v2[24] = @"qualityMeasure";
  v2[25] = @"quality";
  v2[26] = @"vuObservationID";
  v2[27] = @"ageType";
  v2[28] = @"genderType";
  v2[29] = @"eyesState";
  v2[30] = @"smileType";
  v2[31] = @"facialHairType";
  v2[32] = @"hairColorType";
  v2[33] = @"glassesType";
  v2[34] = @"eyeMakeupType";
  v2[35] = @"lipMakeupType";
  v2[36] = @"faceExpressionType";
  v2[37] = @"headgearType";
  v2[38] = @"hairType";
  v2[39] = @"poseType";
  v2[40] = @"skintoneType";
  v2[41] = @"ethnicityType";
  v2[42] = @"hasFaceMask";
  v2[43] = @"gazeType";
  v2[44] = @"gazeCenterX";
  v2[45] = @"gazeCenterY";
  v2[46] = @"gazeRectString";
  v2[47] = @"gazeAngle";
  v2[48] = @"gazeConfidence";
  v2[49] = @"startTime";
  v2[50] = @"duration";
  v2[51] = @"personForFace.personUUID";
  v2[52] = @"personForTemporalDetectedFaces.personUUID";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:53];
  uint64_t v1 = (void *)corePropertiesToFetch_array_31977;
  corePropertiesToFetch_array_31977 = v0;
}

+ (id)fetchType
{
  dispatch_queue_t v2 = @"PHFace";
  return @"PHFace";
}

+ (id)identifierCode
{
  return @"080";
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  char v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [@"PHFacePropertySetIdentifier" length];
  if ((v3 & 1) != 0 && v5) {
    [v4 addObject:@"PHFacePropertySetIdentifier"];
  }
  uint64_t v6 = [@"PHFacePropertySetCore" length];
  if ((v3 & 2) != 0 && v6) {
    [v4 addObject:@"PHFacePropertySetCore"];
  }
  uint64_t v7 = [@"PHFacePropertySetClustering" length];
  if ((v3 & 4) != 0 && v7) {
    [v4 addObject:@"PHFacePropertySetClustering"];
  }
  uint64_t v8 = [@"PHFacePropertySetCropping" length];
  if ((v3 & 8) != 0 && v8) {
    [v4 addObject:@"PHFacePropertySetCropping"];
  }
  uint64_t v9 = [@"PHFacePropertySetPersonBuilder" length];
  if ((v3 & 0x10) != 0 && v9) {
    [v4 addObject:@"PHFacePropertySetPersonBuilder"];
  }
  uint64_t v10 = [@"PHFacePropertySetSexAge" length];
  if ((v3 & 0x20) != 0 && v10) {
    [v4 addObject:@"PHFacePropertySetSexAge"];
  }
  uint64_t v11 = [@"PHFacePropertySetAnalytics" length];
  if ((v3 & 0x40) != 0 && v11) {
    [v4 addObject:@"PHFacePropertySetAnalytics"];
  }
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithSet:v4];

  return v12;
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v3 = a3;
  if ([@"PHFacePropertySetIdentifier" length]) {
    unint64_t v4 = [v3 containsObject:@"PHFacePropertySetIdentifier"];
  }
  else {
    unint64_t v4 = 0;
  }
  if ([@"PHFacePropertySetCore" length]
    && [v3 containsObject:@"PHFacePropertySetCore"])
  {
    v4 |= 2uLL;
  }
  if ([@"PHFacePropertySetClustering" length]
    && [v3 containsObject:@"PHFacePropertySetClustering"])
  {
    v4 |= 4uLL;
  }
  if ([@"PHFacePropertySetCropping" length]
    && [v3 containsObject:@"PHFacePropertySetCropping"])
  {
    v4 |= 8uLL;
  }
  if ([@"PHFacePropertySetPersonBuilder" length]
    && [v3 containsObject:@"PHFacePropertySetPersonBuilder"])
  {
    v4 |= 0x10uLL;
  }
  if ([@"PHFacePropertySetSexAge" length]
    && [v3 containsObject:@"PHFacePropertySetSexAge"])
  {
    v4 |= 0x20uLL;
  }
  if ([@"PHFacePropertySetAnalytics" length]
    && [v3 containsObject:@"PHFacePropertySetAnalytics"])
  {
    v4 |= 0x40uLL;
  }
  if (![v3 containsObject:@"PHFacePropertySetIdentifier"]) {
    v4 |= 2uLL;
  }

  return v4;
}

@end