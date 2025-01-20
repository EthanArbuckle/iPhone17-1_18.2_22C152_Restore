@interface VCPPhotosFace
+ (BOOL)_isColocatingAnimalObservation:(id)a3 withFaceObservations:(id)a4 orTorsoObservations:(id)a5;
+ (double)_calculateIoUBetweenObservation:(id)a3 andObservation:(id)a4;
+ (double)_calculateOverlappingBetweenFaceObservation:(id)a3 andBodyObservation:(id)a4;
+ (id)_animalBodiesOnlyFromAnimalBodyObservations:(id)a3 matchedBody:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:;
+ (id)_animalHeadsBodiesFromAnimalHeadObservations:(id)a3 animalBodyObservations:(id)a4 matchedHead:(void *)a5 matchedBody:(void *)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 processingVersion:(int)a10;
+ (id)_animalHeadsOnlyFromAnimalHeadObservations:(id)a3 matchedHead:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:;
+ (id)_animalImageprintWrapperFromObservation:(id)a3 visionRequests:(id)a4 processingVersion:(int)a5;
+ (id)_filterAnimalObservations:(id)a3 colocatingWithFaceObservations:(id)a4 orHumanObservations:(id)a5;
+ (id)_peopleFacesOnlyFromFaceObservations:(id)a3 matchedFace:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(id)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(int)a11 tooSmallFaceObservations:processingVersion:;
+ (id)_peopleFacesTorsosFromFaceObservations:(id)a3 humanObservations:(id)a4 matchedFace:(void *)a5 matchedTorso:(void *)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(id)a11 tooSmallFaceObservations:(id)a12 processingVersion:(int)a13;
+ (id)_peopleTorsosOnlyFromHumanObservations:(id)a3 matchedTorso:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:;
+ (id)faceFromAnimalHeadObservation:(id)a3 animalBodyObservation:(id)a4 animalLabel:(id)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7 visionRequests:(id)a8 processingVersion:(int)a9;
+ (id)faceFromFaceObservation:(id)a3 humanObservation:(id)a4 sourceWidth:(unint64_t)a5 sourceHeight:(unint64_t)a6 visionRequests:(id)a7 processingVersion:(int)a8 force:(BOOL)a9 andError:(id *)a10;
+ (id)faceFromPHFace:(id)a3 copyOption:(int64_t)a4;
+ (id)faceWithLocalIdentifier:(id)a3;
+ (id)facesFromFaceObservations:(id)a3 humanObservations:(id)a4 animalHeadObservations:(id)a5 animalBodyObservations:(id)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(id)a11 tooSmallFaceObservations:(id)a12 processingVersion:(int)a13 animalResults:(id *)a14;
+ (id)facesFromFaceObservations:(id)a3 humanObservations:(id)a4 animalObservations:(id)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7 visionRequests:(id)a8 blurScorePerFace:(id)a9 exposureScorePerFace:(id)a10 tooSmallFaceObservations:(id)a11 processingVersion:(int)a12;
+ (id)facesFromPHFetchResult:(id)a3 copyOption:(int64_t)a4;
+ (uint64_t)facesFromFaceObservations:(uint64_t)a3 humanObservations:(char)a4 animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:;
- (BOOL)hasFaceMask;
- (BOOL)hasSmile;
- (BOOL)hidden;
- (BOOL)isInTrash;
- (BOOL)isLeftEyeClosed;
- (BOOL)isRightEyeClosed;
- (BOOL)isTooSmall;
- (BOOL)manual;
- (BOOL)setCenterAndSizeFromNormalizedFaceRect:(CGRect)a3;
- (CGRect)gazeRect;
- (CGRect)normalizedBodyRect;
- (CGRect)normalizedFaceRect;
- (NSString)adjustmentVersion;
- (NSString)groupingIdentifier;
- (NSString)localIdentifier;
- (NSString)personLocalIdentifier;
- (VCPPhotosFace)initWithLocalIdentifier:(id)a3;
- (VCPVNImageprintWrapper)imageprintWrapper;
- (double)blurScore;
- (double)bodyCenterX;
- (double)bodyCenterY;
- (double)bodyHeight;
- (double)bodyWidth;
- (double)centerX;
- (double)centerY;
- (double)exposureScore;
- (double)gazeCenterX;
- (double)gazeCenterY;
- (double)poseYaw;
- (double)quality;
- (double)roll;
- (double)size;
- (float)gazeAngle;
- (float)gazeConfidence;
- (id)gist;
- (int)trainingType;
- (int64_t)clusterSequenceNumber;
- (int64_t)nameSource;
- (int64_t)qualityMeasure;
- (int64_t)qualityMeasureWithCountOfFacesOnAsset:(unint64_t)a3;
- (int64_t)sourceHeight;
- (int64_t)sourceWidth;
- (int64_t)vuObservationID;
- (signed)detectionType;
- (unint64_t)algorithmVersion;
- (unsigned)ageType;
- (unsigned)ethnicityType;
- (unsigned)expressionType;
- (unsigned)eyesState;
- (unsigned)facialHairType;
- (unsigned)gazeType;
- (unsigned)glassesType;
- (unsigned)hairColorType;
- (unsigned)hairType;
- (unsigned)headgearType;
- (unsigned)poseType;
- (unsigned)sexType;
- (unsigned)skintoneType;
- (unsigned)smileType;
- (void)replaceCoordinatesAndFeaturesFromDetectedFace:(id)a3;
- (void)setAdjustmentVersion:(id)a3;
- (void)setAgeType:(unsigned __int16)a3;
- (void)setAlgorithmVersion:(unint64_t)a3;
- (void)setBlurScore:(double)a3;
- (void)setBodyCenterX:(double)a3;
- (void)setBodyCenterY:(double)a3;
- (void)setBodyHeight:(double)a3;
- (void)setBodyWidth:(double)a3;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setClusterSequenceNumber:(int64_t)a3;
- (void)setDetectionType:(signed __int16)a3;
- (void)setEthnicityType:(unsigned __int16)a3;
- (void)setExposureScore:(double)a3;
- (void)setExpressionType:(unsigned __int16)a3;
- (void)setEyesState:(unsigned __int16)a3;
- (void)setFacialHairType:(unsigned __int16)a3;
- (void)setGazeAngle:(float)a3;
- (void)setGazeCenterX:(double)a3;
- (void)setGazeCenterY:(double)a3;
- (void)setGazeConfidence:(float)a3;
- (void)setGazeRect:(CGRect)a3;
- (void)setGazeType:(unsigned __int16)a3;
- (void)setGlassesType:(unsigned __int16)a3;
- (void)setGroupingIdentifier:(id)a3;
- (void)setHairColorType:(unsigned __int16)a3;
- (void)setHairType:(unsigned __int16)a3;
- (void)setHasFaceMask:(BOOL)a3;
- (void)setHasSmile:(BOOL)a3;
- (void)setHeadgearType:(unsigned __int16)a3;
- (void)setHidden:(BOOL)a3;
- (void)setImageprintWrapper:(id)a3;
- (void)setIsInTrash:(BOOL)a3;
- (void)setIsLeftEyeClosed:(BOOL)a3;
- (void)setIsRightEyeClosed:(BOOL)a3;
- (void)setIsTooSmall:(BOOL)a3;
- (void)setManual:(BOOL)a3;
- (void)setNameSource:(int64_t)a3;
- (void)setPersonLocalIdentifier:(id)a3;
- (void)setPoseType:(unsigned __int16)a3;
- (void)setPoseYaw:(double)a3;
- (void)setQuality:(double)a3;
- (void)setQualityMeasure:(int64_t)a3;
- (void)setRoll:(double)a3;
- (void)setSexType:(unsigned __int16)a3;
- (void)setSize:(double)a3;
- (void)setSkintoneType:(unsigned __int16)a3;
- (void)setSmileType:(unsigned __int16)a3;
- (void)setSourceHeight:(int64_t)a3;
- (void)setSourceWidth:(int64_t)a3;
- (void)setTrainingType:(int)a3;
- (void)setVuObservationID:(int64_t)a3;
@end

@implementation VCPPhotosFace

- (VCPPhotosFace)initWithLocalIdentifier:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCPPhotosFace;
  v6 = [(VCPPhotosFace *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localIdentifier, a3);
    v7->_sourceWidth = 0;
    v7->_sourceHeight = 0;
    v7->_detectionType = 1;
    *(_OWORD *)&v7->_centerX = 0u;
    *(_OWORD *)&v7->_size = 0u;
    *(_OWORD *)&v7->_bodyCenterY = 0u;
    v7->_bodyHeight = 0.0;
    *(_OWORD *)&v7->_blurScore = xmmword_1BC2810A0;
    *(_OWORD *)&v7->_poseYaw = 0u;
    *(_OWORD *)&v7->_clusterSequenceNumber = 0u;
    v7->_qualityMeasure = 1;
    *(_DWORD *)&v7->_isTooSmall = 0;
    groupingIdentifier = v7->_groupingIdentifier;
    v7->_groupingIdentifier = 0;

    personLocalIdentifier = v7->_personLocalIdentifier;
    v7->_personLocalIdentifier = 0;

    v7->_hasFaceMask = 0;
    *(void *)&v7->_ageType = 0;
    *(void *)&v7->_headgearType = 0;
    *(void *)&v7->_facialHairType = 0;
    *(_DWORD *)&v7->_ethnicityType = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(CGSize *)&v7->_gazeCenterX = _Q0;
    v7->_gazeRect.origin = (CGPoint)_Q0;
    v7->_gazeRect.size = _Q0;
    *(void *)&v7->_gazeAngle = 0xBF800000447A0000;
    *(_OWORD *)&v7->_roll = xmmword_1BC2810B0;
  }

  return v7;
}

+ (id)faceWithLocalIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocalIdentifier:v3];

  return v4;
}

+ (id)faceFromFaceObservation:(id)a3 humanObservation:(id)a4 sourceWidth:(unint64_t)a5 sourceHeight:(unint64_t)a6 visionRequests:(id)a7 processingVersion:(int)a8 force:(BOOL)a9 andError:(id *)a10
{
  uint64_t v10 = *(void *)&a8;
  v207[1] = *MEMORY[0x1E4F143B8];
  unint64_t v15 = (unint64_t)a3;
  unint64_t v16 = (unint64_t)a4;
  id v185 = a7;
  v186 = (void *)v16;
  if (!(v15 | v16))
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v206 = *MEMORY[0x1E4F28568];
    v17 = [NSString stringWithFormat:@"[VCPPhotosFace] Missing faceObservation and humanObservation"];
    v207[0] = v17;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v207 forKeys:&v206 count:1];
    [v34 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v35];
    id v36 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  v17 = +[VCPPhotosFace faceWithLocalIdentifier:0];
  [v17 setSourceWidth:a5];
  [v17 setSourceHeight:a6];
  [v17 setManual:0];
  [v17 setAlgorithmVersion:(int)v10];
  [v17 setDetectionType:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke;
  aBlock[3] = &unk_1E62980E0;
  id v190 = v185;
  v18 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v19 = objc_opt_class();
  v181 = v18[2](v18, v19);
  v20 = [(id)v15 uuid];
  v183 = __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v20, v20, v181);

  v21 = [v183 faceprint];
  if (!v21)
  {
    v184 = 0;
    char v32 = 0;
    goto LABEL_23;
  }
  v184 = v21;
  [v21 confidence];
  float v23 = v22;
  int v24 = _os_feature_enabled_impl();
  float v25 = 0.9;
  if (v24) {
    float v25 = 0.2;
  }
  if (v23 < v25 && !a9)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        [v184 confidence];
        float v28 = v27;
        if (_os_feature_enabled_impl()) {
          uint64_t v29 = 0x3FC99999A0000000;
        }
        else {
          uint64_t v29 = 0x3FECCCCCC0000000;
        }
        double v30 = [v183 description];
        [v183 faceJunkinessIndex];
        *(_DWORD *)buf = 134218754;
        *(double *)v200 = v28;
        *(_WORD *)&v200[8] = 2048;
        uint64_t v201 = v29;
        __int16 v202 = 2112;
        double v203 = v30;
        __int16 v204 = 2048;
        double v205 = v31;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_INFO, "[VCPPhotosFace] faceprint.confidence is too low (%.3f < %.3f) %@ - junkinessIndex: %.3f", buf, 0x2Au);
      }
    }
    char v32 = 0;
    v33 = v184;
    v184 = 0;
LABEL_21:

    goto LABEL_23;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v33 = VCPLogInstance();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      [v184 confidence];
      float v38 = v37;
      v39 = [v183 description];
      [v183 faceJunkinessIndex];
      *(_DWORD *)buf = 134218498;
      *(double *)v200 = v38;
      *(_WORD *)&v200[8] = 2112;
      uint64_t v201 = (uint64_t)v39;
      __int16 v202 = 2048;
      double v203 = v40;
      _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Accepting faceprint with confidence: %.3f %@ - junkinessIndex: %.3f", buf, 0x20u);
    }
    char v32 = 1;
    goto LABEL_21;
  }
  char v32 = 1;
LABEL_23:
  uint64_t v41 = objc_opt_class();
  v180 = v18[2](v18, v41);
  v42 = [v186 uuid];
  v182 = __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v42, v42, v180);

  uint64_t v43 = [v182 torsoprint];
  v44 = (void *)v43;
  if ((unint64_t)v184 | v43)
  {
    v178 = (void *)v43;
    id v188 = 0;
    v177 = (void *)[objc_alloc(MEMORY[0x1E4F45800]) initWithFaceprint:v184 torsoprint:v43];
    uint64_t v45 = [v177 serializeStateAndReturnError:&v188];
    id v46 = v188;
    v179 = v46;
    v176 = (void *)v45;
    if (!v45 || v46)
    {
      if (a10)
      {
        v67 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v195 = *MEMORY[0x1E4F28568];
        v68 = [NSString stringWithFormat:@"[VCPPhotosFace] Unable to serialize faceTorsoprint - %@", v46];
        v196 = v68;
        v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v196 forKeys:&v195 count:1];
        *a10 = [v67 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v69];
      }
    }
    else
    {
      v47 = +[VCPVNImageprintWrapper wrapperWithImageprintType:0 version:v10 andData:v45];
      [v17 setImageprintWrapper:v47];

      v48 = v176;
      [v17 setVuObservationID:0];
      if (v186)
      {
        [v186 boundingBox];
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        CGFloat v54 = v53;
        double v56 = v55;
        [v17 setBodyWidth:v53];
        [v17 setBodyHeight:v56];
        v209.origin.x = v50;
        v209.origin.y = v52;
        v209.size.width = v54;
        v209.size.height = v56;
        [v17 setBodyCenterX:CGRectGetMidX(v209)];
        v210.origin.x = v50;
        v210.origin.y = v52;
        v210.size.width = v54;
        v210.size.height = v56;
        [v17 setBodyCenterY:CGRectGetMidY(v210)];
      }
      if ((v32 & 1) == 0)
      {
        id v36 = v17;
LABEL_41:

        goto LABEL_42;
      }
      [(id)v15 boundingBox];
      uint64_t v58 = v57;
      uint64_t v60 = v59;
      uint64_t v62 = v61;
      uint64_t v64 = v63;
      if (objc_msgSend(v17, "setCenterAndSizeFromNormalizedFaceRect:"))
      {
        v65 = [(id)v15 roll];
        v170 = v65;
        if (v65)
        {
          [v65 doubleValue];
          objc_msgSend(v17, "setRoll:");
        }
        else
        {
          [v17 setRoll:0.0];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v74 = VCPLogInstance();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results for roll information", buf, 2u);
            }
          }
        }
        uint64_t v75 = objc_opt_class();
        v168 = v18[2](v18, v75);
        v76 = [(id)v15 uuid];
        v173 = __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v76, v76, v168);

        v77 = [v173 faceCaptureQuality];
        v169 = v77;
        if (v77)
        {
          [v77 doubleValue];
          objc_msgSend(v17, "setQuality:");
        }
        else
        {
          [v17 setQuality:-1.0];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v78 = VCPLogInstance();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v78, OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results from VNDetectFaceCaptureQualityRequest", buf, 2u);
            }
          }
        }
        v79 = [(id)v15 yaw];
        v167 = v79;
        if (v79)
        {
          [v79 doubleValue];
          objc_msgSend(v17, "setPoseYaw:");
        }
        else
        {
          [v17 setPoseYaw:1.79769313e308];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v80 = VCPLogInstance();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v80, OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results for yaw information", buf, 2u);
            }
          }
        }
        uint64_t v81 = objc_opt_class();
        v165 = v18[2](v18, v81);
        v82 = [(id)v15 uuid];
        v172 = __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v82, v82, v165);

        v83 = [v172 expressionsAndConfidence];
        v166 = v83;
        if (v83)
        {
          v84 = [v83 objectForKeyedSubscript:*MEMORY[0x1E4F45BD8]];
          v85 = v84;
          if (v84)
          {
            [v84 floatValue];
            BOOL v87 = v86 >= 0.4;
          }
          else
          {
            BOOL v87 = 0;
          }
          [v17 setHasSmile:v87];
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 7)
          {
LABEL_72:
            uint64_t v88 = objc_opt_class();
            v164 = v18[2](v18, v88);
            v89 = [(id)v15 uuid];
            v171 = __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v89, v89, v164);

            v90 = [v171 faceAttributes];
            v175 = v90;
            if (v90)
            {
              v91 = [v90 ageCategory];
              v92 = [v91 label];
              v93 = [v92 identifier];
              objc_msgSend(v17, "setAgeType:", +[VCPFaceUtils mad_PHValueFromVNAgeCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNAgeCategoryLabel:", v93));

              v94 = [v175 VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE];
              v95 = [v94 label];
              v96 = [v95 identifier];
              objc_msgSend(v17, "setSexType:", +[VCPFaceUtils mad_PHValueFromVNSexCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNSexCategoryLabel:", v96));

              v97 = [v175 eyesCategory];
              v98 = [v97 label];
              v99 = [v98 identifier];
              objc_msgSend(v17, "setEyesState:", +[VCPFaceUtils mad_PHValueFromVNEyesCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNEyesCategoryLabel:", v99));

              v100 = [v175 smilingCategory];
              v101 = [v100 label];
              v102 = [v101 identifier];
              objc_msgSend(v17, "setSmileType:", +[VCPFaceUtils mad_PHValueFromVNSmilingCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNSmilingCategoryLabel:", v102));

              v103 = [v175 faceHairCategory];
              v104 = [v103 label];
              v105 = [v104 identifier];
              objc_msgSend(v17, "setFacialHairType:", +[VCPFaceUtils mad_PHValueFromVNFaceHairCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNFaceHairCategoryLabel:", v105));

              v106 = [v175 hairColorCategory];
              v107 = [v106 label];
              v108 = [v107 identifier];
              objc_msgSend(v17, "setHairColorType:", +[VCPFaceUtils mad_PHValueFromVNHairColorCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNHairColorCategoryLabel:", v108));

              v109 = [v175 glassesCategory];
              v110 = [v109 label];
              v111 = [v110 identifier];
              objc_msgSend(v17, "setGlassesType:", +[VCPFaceUtils mad_PHValueFromVNGlassesCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNGlassesCategoryLabel:", v111));

              v112 = [v175 VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1];
              v113 = [v112 label];
              v114 = [v113 identifier];
              objc_msgSend(v17, "setExpressionType:", +[VCPFaceUtils mad_PHValueFromVNExpressionCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNExpressionCategoryLabel:", v114));

              v115 = [v175 VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP];
              v116 = [v115 label];
              v117 = [v116 identifier];
              objc_msgSend(v17, "setHeadgearType:", +[VCPFaceUtils mad_PHValueFromVNHeadgearCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNHeadgearCategoryLabel:", v117));

              v118 = [v175 VN2riiZbQrloRhCzYW56f0rk4N3ROe151S];
              v119 = [v118 label];
              v120 = [v119 identifier];
              objc_msgSend(v17, "setHairType:", +[VCPFaceUtils mad_PHValueFromVNFaceHairCategoryV2Label:](VCPFaceUtils, "mad_PHValueFromVNFaceHairCategoryV2Label:", v120));

              v121 = [v175 VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk];
              v122 = [v121 label];
              v123 = [v122 identifier];
              objc_msgSend(v17, "setPoseType:", +[VCPFaceUtils mad_PHValueFromVNPoseCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNPoseCategoryLabel:", v123));

              v124 = [v175 VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq];
              v125 = [v124 label];
              v126 = [v125 identifier];
              objc_msgSend(v17, "setSkintoneType:", +[VCPFaceUtils mad_PHValueFromVNSkintoneCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNSkintoneCategoryLabel:", v126));

              v127 = [v175 VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB];
              v128 = [v127 label];
              v129 = [v128 identifier];
              objc_msgSend(v17, "setEthnicityType:", +[VCPFaceUtils mad_PHValueFromVNEthnicityCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNEthnicityCategoryLabel:", v129));

              BOOL v130 = [v17 eyesState] == 1;
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v131 = VCPLogInstance();
                if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v131, OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results from VNClassifyFaceAttributesRequest", buf, 2u);
                }
              }
              BOOL v130 = 0;
            }
            [v17 setIsLeftEyeClosed:v130];
            [v17 setIsRightEyeClosed:v130];
            uint64_t v132 = objc_opt_class();
            v133 = v18[2](v18, v132);
            v134 = [(id)v15 uuid];
            v174 = __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v134, v134, v133);

            v135 = [v174 gaze];
            BOOL v136 = v135 == 0;

            if (v136)
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v160 = VCPLogInstance();
                if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v160, OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results from VNDetectFaceGazeRequest", buf, 2u);
                }
              }
            }
            else
            {
              v137 = [v174 gaze];
              v138 = [v137 gazeMask];
              [v17 setHasFaceMask:v138 != 0];

              v139 = [v174 gaze];
              objc_msgSend(v17, "setGazeType:", +[VCPFaceUtils mad_PHValueFromVNFaceGazeDirection:](VCPFaceUtils, "mad_PHValueFromVNFaceGazeDirection:", objc_msgSend(v139, "direction")));

              v140 = [v174 gaze];
              [v140 location];
              objc_msgSend(v17, "setGazeCenterX:");

              v141 = [v174 gaze];
              [v141 location];
              [v17 setGazeCenterY:v142];

              v143 = [v174 gaze];
              [v143 locationBounds];
              objc_msgSend(v17, "setGazeRect:");

              v144 = [v174 gaze];
              [v144 horizontalAngle];
              objc_msgSend(v17, "setGazeAngle:");

              if ([v17 hasFaceMask])
              {
                v145 = [v174 gaze];
                v146 = [v145 gazeMask];
                CFTypeRef cf = (CFTypeRef)[v146 pixelBuffer];

                v147 = (__CVBuffer *)cf;
                if (cf)
                {
                  CFRetain(cf);
                  v147 = (__CVBuffer *)cf;
                }
                int Width = CVPixelBufferGetWidth(v147);
                int Height = CVPixelBufferGetHeight((CVPixelBufferRef)cf);
                int BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)cf);
                OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)cf);
                if (PixelFormatType == 1278226534)
                {
                  CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)buf, (CVPixelBufferRef)cf, 1uLL);
                  int v152 = *(_DWORD *)buf;
                  if (*(_DWORD *)buf) {
                    goto LABEL_104;
                  }
                  BaseAddress = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)cf);
                  if (Height < 1)
                  {
                    float v155 = -1.0;
                  }
                  else
                  {
                    uint64_t v154 = 0;
                    float v155 = -1.0;
                    do
                    {
                      if (Width >= 1)
                      {
                        v156 = (float *)&BaseAddress[4 * v154 * ((uint64_t)BytesPerRow >> 2)];
                        int v157 = Width;
                        do
                        {
                          float v158 = *v156++;
                          float v159 = v158;
                          if (v158 > v155) {
                            float v155 = v159;
                          }
                          --v157;
                        }
                        while (v157);
                      }
                      ++v154;
                    }
                    while (v154 != Height);
                  }
                  int v152 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
                  if (v152)
                  {
LABEL_104:
                    if ((int)MediaAnalysisLogLevel() >= 3)
                    {
                      v163 = VCPLogInstance();
                      if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v191 = 67109120;
                        int v192 = v152;
                        _os_log_impl(&dword_1BBEDA000, v163, OS_LOG_TYPE_ERROR, "[VCPPhotosFace] Failed to access gazeMask (%d)", v191, 8u);
                      }
                    }
                  }
                  else
                  {
                    LODWORD(v162) = 1.0;
                    if (v155 < 1.0) {
                      *(float *)&double v162 = v155;
                    }
                    if (v155 <= 0.0) {
                      *(float *)&double v162 = 0.0;
                    }
                    [v17 setGazeConfidence:v162];
                  }
                  CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)buf);
                }
                else if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v161 = VCPLogInstance();
                  if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v200 = PixelFormatType;
                    *(_WORD *)&v200[4] = 1024;
                    *(_DWORD *)&v200[6] = 1278226534;
                    _os_log_impl(&dword_1BBEDA000, v161, OS_LOG_TYPE_ERROR, "[VCPPhotosFace] Unexpected gazeMask pixel format %d (expected: %d)", buf, 0xEu);
                  }
                }
                CF<opaqueCMSampleBuffer *>::~CF(&cf);
              }
            }
            id v36 = v17;

            goto LABEL_40;
          }
          v85 = VCPLogInstance();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v85, OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results from VNDetectFaceExpressionsRequest", buf, 2u);
          }
        }

        goto LABEL_72;
      }
      v70 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v193 = *MEMORY[0x1E4F28568];
      v71 = [NSString stringWithFormat:@"[VCPPhotosFace] Unable to determine normalized face bounding { { %f, %f } { %f, %f } }", v58, v60, v62, v64];
      v194 = v71;
      v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
      *a10 = [v70 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v72];
    }
    id v36 = 0;
LABEL_40:
    v48 = v176;
    goto LABEL_41;
  }
  if (a10)
  {
    v66 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v197 = *MEMORY[0x1E4F28568];
    v178 = (void *)v43;
    v177 = [NSString stringWithFormat:@"[VCPPhotosFace] Invalid faceprint and torsoprint"];
    v198 = v177;
    v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v197 count:1];
    objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
    id v36 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

    v44 = v178;
    goto LABEL_43;
  }
  id v36 = 0;
LABEL_43:

  v35 = v190;
LABEL_44:

  return v36;
}

id __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v6 = v5;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  id v6 = 0;
LABEL_11:

  return v6;
}

id __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a3, "results", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 uuid];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)facesFromFaceObservations:(id)a3 humanObservations:(id)a4 animalObservations:(id)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7 visionRequests:(id)a8 blurScorePerFace:(id)a9 exposureScorePerFace:(id)a10 tooSmallFaceObservations:(id)a11 processingVersion:(int)a12
{
  unint64_t v16 = (unint64_t)a10;
  uint64_t i = (id *)a11;
  uint64_t v266 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v236 = a5;
  id v19 = a8;
  id v235 = a9;
  id v234 = a10;
  id v229 = a11;
  id v230 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __201__VCPPhotosFace_facesFromFaceObservations_humanObservations_animalObservations_sourceWidth_sourceHeight_visionRequests_blurScorePerFace_exposureScorePerFace_tooSmallFaceObservations_processingVersion___block_invoke;
  aBlock[3] = &unk_1E62980E0;
  id v237 = v19;
  id v257 = v237;
  v231 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v255[0] = 0;
  v255[1] = 0;
  v253[1] = 0;
  v254 = (uint64_t *)v255;
  v252 = (uint64_t *)v253;
  v253[0] = 0;
  uint64_t v20 = objc_opt_class();
  v227 = v231[2](v231, v20);
  if (!v227 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Requests do not contain VNDetectFaceRectanglesRequest", buf, 2u);
    }
  }
  if ([v227 revision] != 3737841670)
  {
    unint64_t v58 = 0;
    v247 = 0;
    v248 = 0;
    v249 = 0;
    v240 = (void *)0xBFB999999999999ALL;
    uint64_t v59 = (void *)0xAAAAAAAAAAAAAAABLL;
    while (v58 < [v17 count])
    {
      for (uint64_t i = 0; (unint64_t)i < [v18 count]; uint64_t i = (id *)((char *)i + 1))
      {
        uint64_t v60 = [v17 objectAtIndexedSubscript:v58];
        uint64_t v61 = [v18 objectAtIndexedSubscript:i];
        [a1 _calculateOverlappingBetweenFaceObservation:v60 andBodyObservation:v61];
        double v63 = v62;

        uint64_t v64 = [v17 objectAtIndexedSubscript:v58];
        [v64 boundingBox];
        double v66 = v65;
        v67 = [v17 objectAtIndexedSubscript:v58];
        [v67 boundingBox];
        double v69 = v68;

        v70 = [v17 objectAtIndexedSubscript:v58];
        [v70 boundingBox];
        double v72 = v71;

        v73 = [v18 objectAtIndexedSubscript:i];
        [v73 boundingBox];
        double v75 = v74;
        v76 = [v18 objectAtIndexedSubscript:i];
        [v76 boundingBox];
        double v78 = v77;

        v79 = [v18 objectAtIndexedSubscript:i];
        [v79 boundingBox];
        double v81 = v80;

        float v82 = 1.0 - (v66 + v69);
        float v83 = 1.0 - v72;
        float v84 = 1.0 - (v75 + v78);
        float v85 = 1.0 - v81;
        double v86 = vabds_f32(v82, v84) * -0.1;
        if (v83 < v85) {
          float v83 = 1.0 - v81;
        }
        float v87 = v63 + v86 / (v83 + 0.000001);
        uint64_t v88 = v248;
        if (v248 >= v249)
        {
          unint64_t v89 = 0xAAAAAAAAAAAAAAABLL * (((char *)v248 - (char *)v247) >> 3);
          unint64_t v90 = v89 + 1;
          if (v89 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v249 - (char *)v247) >> 3) > v90) {
            unint64_t v90 = 0x5555555555555556 * (((char *)v249 - (char *)v247) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v249 - (char *)v247) >> 3) >= 0x555555555555555) {
            unint64_t v91 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v91 = v90;
          }
          if (v91) {
            v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<float,unsigned long,unsigned long>>>((uint64_t)&v249, v91);
          }
          else {
            v92 = 0;
          }
          v93 = &v92[8 * (((char *)v248 - (char *)v247) >> 3)];
          *(float *)v93 = v87;
          *((void *)v93 + 1) = v58;
          *((void *)v93 + 2) = i;
          uint64_t v95 = (uint64_t)v247;
          v94 = v248;
          uint64_t v96 = (uint64_t)&v92[24 * v89];
          if (v248 != v247)
          {
            do
            {
              long long v97 = *(_OWORD *)(v94 - 6);
              *(void *)(v96 - 8) = *((void *)v94 - 1);
              *(_OWORD *)(v96 - 24) = v97;
              v96 -= 24;
              v94 -= 6;
            }
            while (v94 != (float *)v95);
            v94 = v247;
          }
          unint64_t v16 = (unint64_t)(v93 + 24);
          v247 = (float *)v96;
          v248 = (float *)(v93 + 24);
          v249 = (float *)&v92[24 * v91];
          if (v94) {
            operator delete(v94);
          }
        }
        else
        {
          float *v248 = v87;
          unint64_t v16 = (unint64_t)(v88 + 6);
          *((void *)v88 + 1) = v58;
          *((void *)v88 + 2) = i;
        }
        v248 = (float *)v16;
      }
      ++v58;
    }
    unint64_t v98 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v248 - (char *)v247) >> 3));
    if (v248 == v247) {
      uint64_t v99 = 0;
    }
    else {
      uint64_t v99 = v98;
    }
    std::__introsort<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *,false>((uint64_t)v247, (unint64_t)v248, v99, 1);
    v100 = v247;
    v101 = v248;
    if (v248 == v247)
    {
      v100 = v248;
      if (v248)
      {
LABEL_125:
        v248 = v100;
        operator delete(v100);
      }
      goto LABEL_126;
    }
    uint64_t v102 = 0;
    while (1)
    {
      v103 = &v100[6 * v102];
      if (*v103 < 0.8) {
        goto LABEL_125;
      }
      unint64_t v16 = *((unint64_t *)v103 + 1);
      unint64_t v104 = *((void *)v103 + 2);
      v105 = v255[0];
      if (!v255[0]) {
        goto LABEL_98;
      }
      v106 = v255;
      do
      {
        v107 = v105;
        v108 = v106;
        unint64_t v109 = v105[4];
        v110 = v105 + 1;
        if (v109 >= v16)
        {
          v110 = v107;
          v106 = (void **)v107;
        }
        v105 = (void *)*v110;
      }
      while (v105);
      if (v106 == v255) {
        goto LABEL_98;
      }
      if (v109 < v16) {
        v107 = v108;
      }
      if (v16 < v107[4])
      {
LABEL_98:
        v111 = v253[0];
        if (!v253[0]) {
          break;
        }
        v112 = v253;
        do
        {
          v113 = v111;
          v114 = v112;
          unint64_t v115 = v111[4];
          v116 = v111 + 1;
          if (v115 >= v104)
          {
            v116 = v113;
            v112 = (void **)v113;
          }
          v111 = (void *)*v116;
        }
        while (v111);
        if (v112 == v253) {
          break;
        }
        if (v115 < v104) {
          v113 = v114;
        }
        if (v104 < v113[4]) {
          break;
        }
      }
LABEL_123:
      if (++v102 >= 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (char *)v100) >> 3))
      {
        if (!v100) {
          goto LABEL_126;
        }
        goto LABEL_125;
      }
    }
    v117 = [v17 objectAtIndexedSubscript:v16];
    v118 = [v18 objectAtIndexedSubscript:v104];
    id v246 = 0;
    LOBYTE(v226) = 0;
    double v119 = [a1 faceFromFaceObservation:v117 humanObservation:v118 sourceWidth:a6 sourceHeight:a7 visionRequests:v237 processingVersion:a12 force:v226 andError:&v246];
    uint64_t i = (id *)v246;

    if (v119 == 0.0 || i)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v122 = VCPLogInstance();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
        {
          *(double *)&unint64_t v16 = [v17 objectAtIndexedSubscript:v16];
          v123 = [v18 objectAtIndexedSubscript:v104];
          *(_DWORD *)buf = 138412802;
          double v259 = *(double *)&v16;
          __int16 v260 = 2112;
          uint64_t v261 = (uint64_t)v123;
          __int16 v262 = 2112;
          v263 = i;
          _os_log_impl(&dword_1BBEDA000, v122, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace from %@ and %@ - %@", buf, 0x20u);
        }
        goto LABEL_121;
      }
    }
    else
    {
      v120 = [v17 objectAtIndexedSubscript:v16];
      objc_msgSend(*(id *)&v119, "setIsTooSmall:", objc_msgSend(v229, "containsObject:", v120));

      if (v235)
      {
        v240 = [v235 objectAtIndexedSubscript:v16];
        [v240 doubleValue];
      }
      else
      {
        double v121 = 1.0;
      }
      [*(id *)&v119 setBlurScore:v121];
      if (v235) {

      }
      if (v234)
      {
        uint64_t v59 = [v234 objectAtIndexedSubscript:v16];
        [v59 doubleValue];
      }
      else
      {
        double v124 = 0.0;
      }
      [*(id *)&v119 setExposureScore:v124];
      if (v234) {

      }
      objc_msgSend(*(id *)&v119, "setQualityMeasure:", objc_msgSend(*(id *)&v119, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v17, "count")));
      v125 = [*(id *)&v119 imageprintWrapper];
      BOOL v126 = v125 == 0;

      if (v126)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v122 = VCPLogInstance();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            *(double *)&unint64_t v16 = [v17 objectAtIndexedSubscript:v16];
            v128 = [v18 objectAtIndexedSubscript:v104];
            *(_DWORD *)buf = 138412802;
            double v259 = v119;
            __int16 v260 = 2112;
            uint64_t v261 = v16;
            __int16 v262 = 2112;
            v263 = v128;
            _os_log_impl(&dword_1BBEDA000, v122, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ and %@ - invalid imageprint", buf, 0x20u);
          }
          goto LABEL_121;
        }
      }
      else
      {
        [v230 addObject:*(void *)&v119];
        std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v254, (unint64_t *)&v247[6 * v102 + 2], (uint64_t *)&v247[6 * v102 + 2]);
        std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v252, (unint64_t *)&v247[6 * v102 + 4], (uint64_t *)&v247[6 * v102 + 4]);
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v122 = VCPLogInstance();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
          {
            *(double *)&unint64_t v16 = [v17 objectAtIndexedSubscript:v16];
            v127 = [v18 objectAtIndexedSubscript:v104];
            *(_DWORD *)buf = 138412802;
            double v259 = v119;
            __int16 v260 = 2112;
            uint64_t v261 = v16;
            __int16 v262 = 2112;
            v263 = v127;
            _os_log_impl(&dword_1BBEDA000, v122, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@ and %@", buf, 0x20u);
          }
LABEL_121:
        }
      }
    }

    v100 = v247;
    v101 = v248;
    goto LABEL_123;
  }
  unint64_t v22 = 0;
  uint64_t i = &v250;
  unint64_t v16 = 2112;
  while (1)
  {
    v247 = (float *)v22;
    if (v22 >= [v17 count]) {
      break;
    }
    float v23 = [v17 objectAtIndexedSubscript:v247];
    int v24 = [v23 groupId];
    BOOL v25 = v24 == 0;

    if (!v25)
    {
      for (unint64_t j = 0; ; unint64_t j = v251 + 1)
      {
        unint64_t v251 = j;
        if (j >= [v18 count]) {
          break;
        }
        float v27 = v253[0];
        if (!v253[0]) {
          goto LABEL_244;
        }
        float v28 = v253;
        do
        {
          uint64_t v29 = v27;
          double v30 = v28;
          unint64_t v31 = v27[4];
          char v32 = v27 + 1;
          if (v31 >= v251)
          {
            char v32 = v29;
            float v28 = (void **)v29;
          }
          float v27 = (void *)*v32;
        }
        while (v27);
        if (v28 == v253) {
          goto LABEL_244;
        }
        if (v31 < v251) {
          uint64_t v29 = v30;
        }
        if (v251 < v29[4])
        {
LABEL_244:
          v33 = [v18 objectAtIndexedSubscript:v251];
          v34 = [v33 groupId];
          BOOL v35 = v34 == 0;

          if (!v35)
          {
            id v36 = [v17 objectAtIndexedSubscript:v247];
            float v37 = [v36 groupId];
            float v38 = [v18 objectAtIndexedSubscript:v251];
            v39 = [v38 groupId];
            char v40 = [v37 isEqual:v39];

            if (v40)
            {
              uint64_t v41 = [v17 objectAtIndexedSubscript:v247];
              v42 = [v18 objectAtIndexedSubscript:v251];
              id v250 = 0;
              LOBYTE(v226) = 0;
              double v43 = [a1 faceFromFaceObservation:v41 humanObservation:v42 sourceWidth:a6 sourceHeight:a7 visionRequests:v237 processingVersion:a12 force:v226 andError:&v250];
              v44 = (id *)v250;

              if (v43 != 0.0 && !v44)
              {
                v48 = [v17 objectAtIndexedSubscript:v247];
                objc_msgSend(*(id *)&v43, "setIsTooSmall:", objc_msgSend(v229, "containsObject:", v48));

                if (v235)
                {
                  v232 = [v235 objectAtIndexedSubscript:v247];
                  [v232 doubleValue];
                }
                else
                {
                  double v49 = 1.0;
                }
                [*(id *)&v43 setBlurScore:v49];
                if (v235) {

                }
                if (v234)
                {
                  v228 = [v234 objectAtIndexedSubscript:v247];
                  [v228 doubleValue];
                }
                else
                {
                  double v50 = 0.0;
                }
                [*(id *)&v43 setExposureScore:v50];
                if (v234) {

                }
                objc_msgSend(*(id *)&v43, "setQualityMeasure:", objc_msgSend(*(id *)&v43, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v17, "count")));
                double v51 = [*(id *)&v43 imageprintWrapper];
                BOOL v52 = v51 == 0;

                if (v52)
                {
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    double v53 = VCPLogInstance();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                    {
                      double v56 = [v17 objectAtIndexedSubscript:v247];
                      uint64_t v57 = [v18 objectAtIndexedSubscript:v251];
                      *(_DWORD *)buf = 138412802;
                      double v259 = v43;
                      __int16 v260 = 2112;
                      uint64_t v261 = (uint64_t)v56;
                      __int16 v262 = 2112;
                      v263 = v57;
                      _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ and %@ - invalid imageprint", buf, 0x20u);
                    }
LABEL_48:
                  }
                }
                else
                {
                  [v230 addObject:*(void *)&v43];
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    double v53 = VCPLogInstance();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                    {
                      CGFloat v54 = [v17 objectAtIndexedSubscript:v247];
                      double v55 = [v18 objectAtIndexedSubscript:v251];
                      *(_DWORD *)buf = 138412802;
                      double v259 = v43;
                      __int16 v260 = 2112;
                      uint64_t v261 = (uint64_t)v54;
                      __int16 v262 = 2112;
                      v263 = v55;
                      _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@ and %@", buf, 0x20u);
                    }
                    goto LABEL_48;
                  }
                }
                std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v254, (unint64_t *)&v247, (uint64_t *)&v247);
                std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v252, &v251, (uint64_t *)&v251);

                break;
              }
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                uint64_t v45 = VCPLogInstance();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  double v46 = [v17 objectAtIndexedSubscript:v247];
                  v47 = [v18 objectAtIndexedSubscript:v251];
                  *(_DWORD *)buf = 138412802;
                  double v259 = v46;
                  __int16 v260 = 2112;
                  uint64_t v261 = (uint64_t)v47;
                  __int16 v262 = 2112;
                  v263 = v44;
                  _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace from %@ and %@ - %@", buf, 0x20u);
                }
              }
            }
          }
        }
      }
    }
    unint64_t v22 = (unint64_t)v247 + 1;
  }
LABEL_126:
  for (unint64_t k = 0; k < [v17 count]; ++k)
  {
    BOOL v130 = v255[0];
    if (!v255[0]) {
      goto LABEL_137;
    }
    v131 = v255;
    do
    {
      uint64_t v132 = v130;
      v133 = v131;
      unint64_t v134 = v130[4];
      v135 = v130 + 1;
      if (v134 >= k)
      {
        v135 = v132;
        v131 = (void **)v132;
      }
      BOOL v130 = (void *)*v135;
    }
    while (v130);
    if (v131 == v255) {
      goto LABEL_137;
    }
    if (v134 < k) {
      uint64_t v132 = v133;
    }
    if (k < v132[4])
    {
LABEL_137:
      BOOL v136 = [v17 objectAtIndexedSubscript:k];
      id v245 = 0;
      LOBYTE(v226) = 0;
      double v137 = [a1 faceFromFaceObservation:v136 humanObservation:0 sourceWidth:a6 sourceHeight:a7 visionRequests:v237 processingVersion:a12 force:v226 andError:&v245];
      id v138 = v245;

      if (v137 == 0.0 || v138)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_160;
        }
        v141 = VCPLogInstance();
        if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
        {
          double v142 = [v17 objectAtIndexedSubscript:k];
          *(_DWORD *)buf = 138412546;
          double v259 = v142;
          __int16 v260 = 2112;
          uint64_t v261 = (uint64_t)v138;
          _os_log_impl(&dword_1BBEDA000, v141, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate face only VCPPhotosFace from %@ - %@", buf, 0x16u);
        }
      }
      else
      {
        v139 = [v17 objectAtIndexedSubscript:k];
        objc_msgSend(*(id *)&v137, "setIsTooSmall:", objc_msgSend(v229, "containsObject:", v139));

        if (v235)
        {
          *(double *)&unint64_t v16 = [v235 objectAtIndexedSubscript:k];
          [(id)v16 doubleValue];
        }
        else
        {
          double v140 = 1.0;
        }
        [*(id *)&v137 setBlurScore:v140];
        if (v235) {

        }
        if (v234)
        {
          uint64_t i = [v234 objectAtIndexedSubscript:k];
          [i doubleValue];
        }
        else
        {
          double v143 = 0.0;
        }
        [*(id *)&v137 setExposureScore:v143];
        if (v234) {

        }
        objc_msgSend(*(id *)&v137, "setQualityMeasure:", objc_msgSend(*(id *)&v137, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v17, "count")));
        v144 = [*(id *)&v137 imageprintWrapper];
        BOOL v145 = v144 == 0;

        if (!v145)
        {
          [v230 addObject:*(void *)&v137];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v141 = VCPLogInstance();
            if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
            {
              v146 = [v17 objectAtIndexedSubscript:k];
              *(_DWORD *)buf = 138412546;
              double v259 = v137;
              __int16 v260 = 2112;
              uint64_t v261 = (uint64_t)v146;
              _os_log_impl(&dword_1BBEDA000, v141, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate face only VCPPhotosFace %@ from %@", buf, 0x16u);
            }
            goto LABEL_159;
          }
LABEL_160:

          continue;
        }
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_160;
        }
        v141 = VCPLogInstance();
        if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
        {
          v147 = [v17 objectAtIndexedSubscript:k];
          *(_DWORD *)buf = 138412546;
          double v259 = v137;
          __int16 v260 = 2112;
          uint64_t v261 = (uint64_t)v147;
          _os_log_impl(&dword_1BBEDA000, v141, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ - invalid imageprint", buf, 0x16u);
        }
      }
LABEL_159:

      goto LABEL_160;
    }
  }
  for (unint64_t m = 0; m < [v18 count]; ++m)
  {
    v149 = v253[0];
    if (!v253[0]) {
      goto LABEL_173;
    }
    v150 = v253;
    do
    {
      v151 = v149;
      int v152 = v150;
      unint64_t v153 = v149[4];
      uint64_t v154 = v149 + 1;
      if (v153 >= m)
      {
        uint64_t v154 = v151;
        v150 = (void **)v151;
      }
      v149 = (void *)*v154;
    }
    while (v149);
    if (v150 == v253) {
      goto LABEL_173;
    }
    if (v153 < m) {
      v151 = v152;
    }
    if (m < v151[4])
    {
LABEL_173:
      v241 = [v18 objectAtIndexedSubscript:m];
      double v155 = +[VCPPhotosFace faceWithLocalIdentifier:0];
      [*(id *)&v155 setSourceWidth:a6];
      [*(id *)&v155 setSourceHeight:a7];
      [*(id *)&v155 setManual:0];
      [*(id *)&v155 setAlgorithmVersion:a12];
      [*(id *)&v155 setDetectionType:1];
      [v241 boundingBox];
      CGFloat v157 = v156;
      CGFloat v159 = v158;
      CGFloat v161 = v160;
      double v163 = v162;
      [*(id *)&v155 setBodyWidth:v160];
      [*(id *)&v155 setBodyHeight:v163];
      v268.origin.x = v157;
      v268.origin.y = v159;
      v268.size.width = v161;
      v268.size.height = v163;
      [*(id *)&v155 setBodyCenterX:CGRectGetMidX(v268)];
      v269.origin.x = v157;
      v269.origin.y = v159;
      v269.size.width = v161;
      v269.size.height = v163;
      [*(id *)&v155 setBodyCenterY:CGRectGetMidY(v269)];
      uint64_t v164 = objc_opt_class();
      v165 = v231[2](v231, v164);
      v166 = [v241 uuid];
      v167 = __201__VCPPhotosFace_facesFromFaceObservations_humanObservations_animalObservations_sourceWidth_sourceHeight_visionRequests_blurScorePerFace_exposureScorePerFace_tooSmallFaceObservations_processingVersion___block_invoke_2((uint64_t)v166, v166, v165);

      v168 = [v167 torsoprint];
      if (v168)
      {
        v169 = [objc_alloc(MEMORY[0x1E4F45800]) initWithFaceprint:0 torsoprint:v168];
        id v244 = 0;
        v170 = [v169 serializeStateAndReturnError:&v244];
        double v233 = COERCE_DOUBLE(v244);
        if (v170)
        {
          uint64_t v171 = +[VCPVNImageprintWrapper wrapperWithImageprintType:0 version:a12 andData:v170];
          [*(id *)&v155 setImageprintWrapper:v171];

          [*(id *)&v155 setVuObservationID:0];
          v172 = [*(id *)&v155 imageprintWrapper];
          LOBYTE(v171) = v172 == 0;

          if ((v171 & 1) == 0)
          {
            [v230 addObject:*(void *)&v155];
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v173 = VCPLogInstance();
              if (os_log_type_enabled(v173, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                double v259 = v155;
                __int16 v260 = 2112;
                uint64_t v261 = (uint64_t)v241;
                v174 = v173;
                os_log_type_t v175 = OS_LOG_TYPE_DEBUG;
                v176 = "[PhotosFace] Generate VCPPhotosFace %@ from %@";
                uint32_t v177 = 22;
                goto LABEL_185;
              }
              goto LABEL_186;
            }
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v173 = VCPLogInstance();
          if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            double v259 = v233;
            v174 = v173;
            os_log_type_t v175 = OS_LOG_TYPE_ERROR;
            v176 = "[PhotosFace] Failed to serialize torsoprint; %@";
            uint32_t v177 = 12;
LABEL_185:
            _os_log_impl(&dword_1BBEDA000, v174, v175, v176, buf, v177);
          }
LABEL_186:
        }
LABEL_188:
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v169 = VCPLogInstance();
        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v169, OS_LOG_TYPE_ERROR, "[PhotosFace] torsoOnlyObservation failed to return a faceprint", buf, 2u);
        }
        goto LABEL_188;
      }

      continue;
    }
  }
  for (unint64_t n = 0; n < [v236 count]; ++n)
  {
    double v179 = [v236 objectAtIndexedSubscript:n];
    if (![a1 _isColocatingAnimalObservation:*(void *)&v179 withFaceObservations:v17 orTorsoObservations:v18])
    {
      *(double *)&v180 = +[VCPPhotosFace faceWithLocalIdentifier:0];
      [v180 setSourceWidth:a6];
      [v180 setSourceHeight:a7];
      [v180 setManual:0];
      [v180 setAlgorithmVersion:a12];
      v181 = [*(id *)&v179 labels];
      v182 = [v181 firstObject];
      v183 = [v182 identifier];

      if ([v183 isEqualToString:@"Dog"])
      {
        uint64_t v184 = 3;
        goto LABEL_201;
      }
      if ([v183 isEqualToString:@"Cat"])
      {
        uint64_t v184 = 4;
LABEL_201:
        [v180 setDetectionType:v184];
        [*(id *)&v179 boundingBox];
        double v186 = v185;
        uint64_t v188 = v187;
        id v190 = v189;
        uint64_t v192 = v191;
        if (-[NSObject setCenterAndSizeFromNormalizedFaceRect:](v180, "setCenterAndSizeFromNormalizedFaceRect:"))
        {
          [*(id *)&v179 boundingBox];
          CGFloat v194 = v193;
          CGFloat v196 = v195;
          CGFloat v198 = v197;
          double v200 = v199;
          [v180 setBodyWidth:v197];
          [v180 setBodyHeight:v200];
          v270.origin.x = v194;
          v270.origin.y = v196;
          v270.size.width = v198;
          v270.size.height = v200;
          [v180 setBodyCenterX:CGRectGetMidX(v270)];
          v271.origin.x = v194;
          v271.origin.y = v196;
          v271.size.width = v198;
          v271.size.height = v200;
          [v180 setBodyCenterY:CGRectGetMidY(v271)];
          uint64_t v201 = [*(id *)&v179 animalprint];
          __int16 v202 = v201;
          if (!v201)
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_232;
            }
            VCPLogInstance();
            *(double *)&__int16 v204 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            if (!os_log_type_enabled(v204, OS_LOG_TYPE_ERROR)) {
              goto LABEL_231;
            }
            *(_WORD *)buf = 0;
            v212 = v204;
            os_log_type_t v213 = OS_LOG_TYPE_ERROR;
            v214 = "[PhotosFace] animalObservation failed to return a faceprint";
            uint32_t v215 = 2;
            goto LABEL_226;
          }
          [v201 confidence];
          if (v203 < 0.4)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              VCPLogInstance();
              *(double *)&__int16 v204 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
              {
                [v202 confidence];
                float v206 = v205;
                v207 = [*(id *)&v179 description];
                *(_DWORD *)buf = 134218498;
                double v259 = v206;
                __int16 v260 = 2048;
                uint64_t v261 = 0x3FD99999A0000000;
                __int16 v262 = 2112;
                v263 = v207;
                _os_log_impl(&dword_1BBEDA000, v204, OS_LOG_TYPE_INFO, "[PhotosFace] animalprint.confidence is too low (%.3f < %.3f) %@", buf, 0x20u);
              }
              goto LABEL_231;
            }
            goto LABEL_232;
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v216 = VCPLogInstance();
            if (os_log_type_enabled(v216, OS_LOG_TYPE_DEBUG))
            {
              [v202 confidence];
              float v218 = v217;
              v219 = [*(id *)&v179 description];
              *(_DWORD *)buf = 134218242;
              double v259 = v218;
              __int16 v260 = 2112;
              uint64_t v261 = (uint64_t)v219;
              _os_log_impl(&dword_1BBEDA000, v216, OS_LOG_TYPE_DEBUG, "[PhotosFace] Accepting animalprint with confidence: %.3f %@", buf, 0x16u);
            }
          }
          id v243 = 0;
          v220 = [v202 serializeStateAndReturnError:&v243];
          *(double *)&__int16 v204 = COERCE_DOUBLE(v243);
          if (v220)
          {
            v221 = +[VCPVNImageprintWrapper wrapperWithImageprintType:1 version:a12 andData:v220];
            [v180 setImageprintWrapper:v221];

            [v180 setVuObservationID:0];
            v222 = [v180 imageprintWrapper];
            BOOL v223 = v222 == 0;

            if (v223) {
              goto LABEL_232;
            }
            [v230 addObject:v180];
            if ((int)MediaAnalysisLogLevel() < 7) {
              goto LABEL_232;
            }
            VCPLogInstance();
            *(double *)&__int16 v204 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            if (!os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_231;
            }
            *(_DWORD *)buf = 138412546;
            double v259 = *(double *)&v180;
            __int16 v260 = 2112;
            uint64_t v261 = *(void *)&v179;
            v212 = v204;
            os_log_type_t v213 = OS_LOG_TYPE_DEBUG;
            v214 = "[PhotosFace] Generate VCPPhotosFace %@ from %@";
            uint32_t v215 = 22;
LABEL_226:
            _os_log_impl(&dword_1BBEDA000, v212, v213, v214, buf, v215);
            goto LABEL_231;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v224 = VCPLogInstance();
            if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              double v259 = *(double *)&v204;
              _os_log_impl(&dword_1BBEDA000, v224, OS_LOG_TYPE_ERROR, "[PhotosFace] Failed to serialize animalprintData; %@",
                buf,
                0xCu);
            }
          }
LABEL_231:

LABEL_232:
LABEL_233:

          goto LABEL_234;
        }
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_233;
        }
        __int16 v202 = VCPLogInstance();
        if (!os_log_type_enabled(v202, OS_LOG_TYPE_ERROR)) {
          goto LABEL_232;
        }
        *(_DWORD *)buf = 134218752;
        double v259 = v186;
        __int16 v260 = 2048;
        uint64_t v261 = v188;
        __int16 v262 = 2048;
        v263 = v190;
        __int16 v264 = 2048;
        uint64_t v265 = v192;
        v208 = v202;
        os_log_type_t v209 = OS_LOG_TYPE_ERROR;
        CGRect v210 = "[PhotosFace] Unable to determine normalized bounding box { { %f, %f } { %f, %f } }";
        uint32_t v211 = 42;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_233;
        }
        __int16 v202 = VCPLogInstance();
        if (!os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_232;
        }
        *(_WORD *)buf = 0;
        v208 = v202;
        os_log_type_t v209 = OS_LOG_TYPE_DEFAULT;
        CGRect v210 = "[PhotosFace] Label must be either Dog or Cat. Ignoring";
        uint32_t v211 = 2;
      }
      _os_log_impl(&dword_1BBEDA000, v208, v209, v210, buf, v211);
      goto LABEL_232;
    }
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_235;
    }
    VCPLogInstance();
    *(double *)&v180 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      double v259 = v179;
      _os_log_impl(&dword_1BBEDA000, v180, OS_LOG_TYPE_DEBUG, "[PhotosFace] Ignoring co-locating animalObservation %@", buf, 0xCu);
    }
LABEL_234:

LABEL_235:
  }

  std::__tree<unsigned long>::destroy((uint64_t)&v252, v253[0]);
  std::__tree<unsigned long>::destroy((uint64_t)&v254, v255[0]);

  return v230;
}

id __201__VCPPhotosFace_facesFromFaceObservations_humanObservations_animalObservations_sourceWidth_sourceHeight_visionRequests_blurScorePerFace_exposureScorePerFace_tooSmallFaceObservations_processingVersion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v6 = v5;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  id v6 = 0;
LABEL_11:

  return v6;
}

id __201__VCPPhotosFace_facesFromFaceObservations_humanObservations_animalObservations_sourceWidth_sourceHeight_visionRequests_blurScorePerFace_exposureScorePerFace_tooSmallFaceObservations_processingVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a3, "results", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 uuid];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)_peopleFacesTorsosFromFaceObservations:(id)a3 humanObservations:(id)a4 matchedFace:(void *)a5 matchedTorso:(void *)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(id)a11 tooSmallFaceObservations:(id)a12 processingVersion:(int)a13
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v66 = a9;
  id v63 = a10;
  id v62 = a11;
  id v59 = a12;
  id v56 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v18 = 0;
  uint64_t v57 = (uint64_t **)a6;
  id v19 = (char *)a6 + 8;
  while (1)
  {
    unint64_t v69 = v18;
    if (v18 >= [v16 count]) {
      break;
    }
    uint64_t v20 = [v16 objectAtIndexedSubscript:v69];
    v21 = [v20 groupId];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      for (unint64_t i = 0; ; unint64_t i = v68 + 1)
      {
        unint64_t v68 = i;
        if (i >= [v17 count]) {
          break;
        }
        int v24 = (void *)*v19;
        if (!*v19) {
          goto LABEL_52;
        }
        BOOL v25 = v19;
        do
        {
          unint64_t v26 = v24[4];
          BOOL v27 = v26 >= v68;
          if (v26 >= v68) {
            float v28 = v24;
          }
          else {
            float v28 = v24 + 1;
          }
          if (v27) {
            BOOL v25 = v24;
          }
          int v24 = (void *)*v28;
        }
        while (*v28);
        if (v25 == v19 || v68 < v25[4])
        {
LABEL_52:
          uint64_t v29 = [v17 objectAtIndexedSubscript:v68];
          double v30 = [v29 groupId];
          BOOL v31 = v30 == 0;

          if (!v31)
          {
            char v32 = [v16 objectAtIndexedSubscript:v69];
            v33 = [v32 groupId];
            v34 = [v17 objectAtIndexedSubscript:v68];
            BOOL v35 = [v34 groupId];
            char v36 = [v33 isEqual:v35];

            if (v36)
            {
              float v37 = [v16 objectAtIndexedSubscript:v69];
              float v38 = [v17 objectAtIndexedSubscript:v68];
              id v67 = 0;
              LOBYTE(v55) = 0;
              v39 = [a1 faceFromFaceObservation:v37 humanObservation:v38 sourceWidth:a7 sourceHeight:a8 visionRequests:v66 processingVersion:a13 force:v55 andError:&v67];
              id v40 = v67;

              if (v39 && !v40)
              {
                v44 = [v16 objectAtIndexedSubscript:v69];
                objc_msgSend(v39, "setIsTooSmall:", objc_msgSend(v59, "containsObject:", v44));

                if (v63)
                {
                  uint64_t v61 = [v63 objectAtIndexedSubscript:v69];
                  [v61 doubleValue];
                }
                else
                {
                  double v45 = 1.0;
                }
                [v39 setBlurScore:v45];
                if (v63) {

                }
                if (v62)
                {
                  uint64_t v60 = [v62 objectAtIndexedSubscript:v69];
                  [v60 doubleValue];
                }
                else
                {
                  double v46 = 0.0;
                }
                [v39 setExposureScore:v46];
                if (v62) {

                }
                objc_msgSend(v39, "setQualityMeasure:", objc_msgSend(v39, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v16, "count")));
                v47 = [v39 imageprintWrapper];
                BOOL v48 = v47 == 0;

                if (v48)
                {
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    double v49 = VCPLogInstance();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                    {
                      BOOL v52 = [v16 objectAtIndexedSubscript:v69];
                      double v53 = [v17 objectAtIndexedSubscript:v68];
                      *(_DWORD *)buf = 138412802;
                      double v71 = v39;
                      __int16 v72 = 2112;
                      v73 = v52;
                      __int16 v74 = 2112;
                      id v75 = v53;
                      _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ and %@ - invalid imageprint", buf, 0x20u);
                    }
LABEL_44:
                  }
                }
                else
                {
                  [v56 addObject:v39];
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    double v49 = VCPLogInstance();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                    {
                      double v50 = [v16 objectAtIndexedSubscript:v69];
                      double v51 = [v17 objectAtIndexedSubscript:v68];
                      *(_DWORD *)buf = 138412802;
                      double v71 = v39;
                      __int16 v72 = 2112;
                      v73 = v50;
                      __int16 v74 = 2112;
                      id v75 = v51;
                      _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@ and %@", buf, 0x20u);
                    }
                    goto LABEL_44;
                  }
                }
                std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)a5, &v69, (uint64_t *)&v69);
                std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(v57, &v68, (uint64_t *)&v68);

                break;
              }
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                uint64_t v41 = VCPLogInstance();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = [v16 objectAtIndexedSubscript:v69];
                  double v43 = [v17 objectAtIndexedSubscript:v68];
                  *(_DWORD *)buf = 138412802;
                  double v71 = v42;
                  __int16 v72 = 2112;
                  v73 = v43;
                  __int16 v74 = 2112;
                  id v75 = v40;
                  _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace from %@ and %@ - %@", buf, 0x20u);
                }
              }
            }
          }
        }
      }
    }
    unint64_t v18 = v69 + 1;
  }

  return v56;
}

+ (id)_peopleFacesOnlyFromFaceObservations:(id)a3 matchedFace:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(id)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(int)a11 tooSmallFaceObservations:processingVersion:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v42 = a7;
  id v43 = a8;
  id v15 = a9;
  id v38 = a10;
  id v37 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v16 = 0;
  p_var1 = &a4->var0.var1;
  while (v16 < [v14 count])
  {
    var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)p_var1->var0.var0;
    if (!p_var1->var0.var0) {
      goto LABEL_14;
    }
    id v19 = p_var1;
    do
    {
      unint64_t v20 = (unint64_t)var0[4].var0.var0;
      BOOL v21 = v20 >= v16;
      if (v20 >= v16) {
        BOOL v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)var0;
      }
      else {
        BOOL v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&var0[1];
      }
      if (v21) {
        id v19 = var0;
      }
      var0 = *v22;
    }
    while (*v22);
    if (v19 == p_var1 || (void *)v16 < v19[4].var0.var0)
    {
LABEL_14:
      float v23 = [v14 objectAtIndexedSubscript:v16];
      id v44 = 0;
      LOBYTE(v36) = 0;
      int v24 = [a1 faceFromFaceObservation:v23 humanObservation:0 sourceWidth:a5 sourceHeight:a6 visionRequests:v42 processingVersion:a11 force:v36 andError:&v44];
      id v25 = v44;

      if (!v24 || v25)
      {
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_37;
        }
        float v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [v14 objectAtIndexedSubscript:v16];
          *(_DWORD *)buf = 138412546;
          double v46 = v29;
          __int16 v47 = 2112;
          id v48 = v25;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate face only VCPPhotosFace from %@ - %@", buf, 0x16u);
        }
      }
      else
      {
        unint64_t v26 = [v14 objectAtIndexedSubscript:v16];
        objc_msgSend(v24, "setIsTooSmall:", objc_msgSend(v38, "containsObject:", v26));

        if (v43)
        {
          a4 = [v43 objectAtIndexedSubscript:v16];
          unk_1F16441D0(a4, "doubleValue");
        }
        else
        {
          double v27 = 1.0;
        }
        [v24 setBlurScore:v27];
        if (v43) {

        }
        if (v15)
        {
          a8 = [v15 objectAtIndexedSubscript:v16];
          [a8 doubleValue];
        }
        else
        {
          double v30 = 0.0;
        }
        [v24 setExposureScore:v30];
        if (v15) {

        }
        objc_msgSend(v24, "setQualityMeasure:", objc_msgSend(v24, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v14, "count")));
        BOOL v31 = [v24 imageprintWrapper];
        BOOL v32 = v31 == 0;

        if (!v32)
        {
          [v37 addObject:v24];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            float v28 = VCPLogInstance();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v33 = [v14 objectAtIndexedSubscript:v16];
              *(_DWORD *)buf = 138412546;
              double v46 = v24;
              __int16 v47 = 2112;
              id v48 = v33;
              _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate face only VCPPhotosFace %@ from %@", buf, 0x16u);
            }
            goto LABEL_36;
          }
LABEL_37:

          goto LABEL_38;
        }
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_37;
        }
        float v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [v14 objectAtIndexedSubscript:v16];
          *(_DWORD *)buf = 138412546;
          double v46 = v24;
          __int16 v47 = 2112;
          id v48 = v34;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ - invalid imageprint", buf, 0x16u);
        }
      }
LABEL_36:

      goto LABEL_37;
    }
LABEL_38:
    ++v16;
  }

  return v37;
}

+ (id)_peopleTorsosOnlyFromHumanObservations:(id)a3 matchedTorso:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:
{
  uint64_t v44 = *(void *)&a8;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v10 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__VCPPhotosFace__peopleTorsosOnlyFromHumanObservations_matchedTorso_sourceWidth_sourceHeight_visionRequests_processingVersion___block_invoke;
  aBlock[3] = &unk_1E62980E0;
  id v42 = v10;
  id v53 = v42;
  __int16 v47 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  id v43 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v11 = 0;
  p_var1 = &a4->var0.var1;
  while (v11 < [v49 count])
  {
    var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)p_var1->var0.var0;
    if (!p_var1->var0.var0) {
      goto LABEL_14;
    }
    long long v13 = p_var1;
    do
    {
      unint64_t v14 = (unint64_t)var0[4].var0.var0;
      BOOL v15 = v14 >= v11;
      if (v14 >= v11) {
        unint64_t v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)var0;
      }
      else {
        unint64_t v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&var0[1];
      }
      if (v15) {
        long long v13 = var0;
      }
      var0 = *v16;
    }
    while (*v16);
    if (v13 == p_var1 || (void *)v11 < v13[4].var0.var0)
    {
LABEL_14:
      id v17 = [v49 objectAtIndexedSubscript:v11];
      unint64_t v18 = +[VCPPhotosFace faceWithLocalIdentifier:0];
      [v18 setSourceWidth:a5];
      [v18 setSourceHeight:a6];
      [v18 setManual:0];
      [v18 setAlgorithmVersion:(int)v44];
      [v18 setDetectionType:1];
      [v17 boundingBox];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      double v26 = v25;
      [v18 setBodyWidth:v23];
      [v18 setBodyHeight:v26];
      v60.origin.x = v20;
      v60.origin.y = v22;
      v60.size.width = v24;
      v60.size.height = v26;
      [v18 setBodyCenterX:CGRectGetMidX(v60)];
      v61.origin.x = v20;
      v61.origin.y = v22;
      v61.size.width = v24;
      v61.size.height = v26;
      [v18 setBodyCenterY:CGRectGetMidY(v61)];
      uint64_t v27 = objc_opt_class();
      float v28 = v47[2](v47, v27);
      uint64_t v29 = [v17 uuid];
      double v30 = __127__VCPPhotosFace__peopleTorsosOnlyFromHumanObservations_matchedTorso_sourceWidth_sourceHeight_visionRequests_processingVersion___block_invoke_2((uint64_t)v29, v29, v28);

      BOOL v31 = [v30 torsoprint];
      if (v31)
      {
        BOOL v32 = [objc_alloc(MEMORY[0x1E4F45800]) initWithFaceprint:0 torsoprint:v31];
        id v51 = 0;
        v33 = [v32 serializeStateAndReturnError:&v51];
        id v48 = v51;
        if (v33)
        {
          uint64_t v34 = +[VCPVNImageprintWrapper wrapperWithImageprintType:0 version:v44 andData:v33];
          [v18 setImageprintWrapper:v34];

          [v18 setVuObservationID:0];
          BOOL v35 = [v18 imageprintWrapper];
          LOBYTE(v34) = v35 == 0;

          if ((v34 & 1) == 0)
          {
            [v43 addObject:v18];
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              uint64_t v36 = VCPLogInstance();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                id v55 = v18;
                __int16 v56 = 2112;
                uint64_t v57 = v17;
                id v37 = v36;
                os_log_type_t v38 = OS_LOG_TYPE_DEBUG;
                v39 = "[PhotosFace] Generate VCPPhotosFace %@ from %@";
                uint32_t v40 = 22;
                goto LABEL_26;
              }
              goto LABEL_27;
            }
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v36 = VCPLogInstance();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v55 = v48;
            id v37 = v36;
            os_log_type_t v38 = OS_LOG_TYPE_ERROR;
            v39 = "[PhotosFace] Failed to serialize torsoprint; %@";
            uint32_t v40 = 12;
LABEL_26:
            _os_log_impl(&dword_1BBEDA000, v37, v38, v39, buf, v40);
          }
LABEL_27:
        }
LABEL_29:
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        BOOL v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "[PhotosFace] torsoOnlyObservation failed to return a faceprint", buf, 2u);
        }
        goto LABEL_29;
      }
    }
    ++v11;
  }

  return v43;
}

id __127__VCPPhotosFace__peopleTorsosOnlyFromHumanObservations_matchedTorso_sourceWidth_sourceHeight_visionRequests_processingVersion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v6 = v5;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  id v6 = 0;
LABEL_11:

  return v6;
}

id __127__VCPPhotosFace__peopleTorsosOnlyFromHumanObservations_matchedTorso_sourceWidth_sourceHeight_visionRequests_processingVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a3, "results", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 uuid];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)_filterAnimalObservations:(id)a3 colocatingWithFaceObservations:(id)a4 orHumanObservations:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [MEMORY[0x1E4F28E60] indexSet];
  unint64_t v12 = 0;
  *(void *)&long long v13 = 138412290;
  long long v17 = v13;
  while (v12 < objc_msgSend(v8, "count", v17))
  {
    long long v14 = [v8 objectAtIndexedSubscript:v12];
    if ([a1 _isColocatingAnimalObservation:v14 withFaceObservations:v9 orTorsoObservations:v10])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        long long v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          double v19 = v14;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Ignoring co-locating animalObservation %@", buf, 0xCu);
        }
      }
      [v11 addIndex:v12];
    }

    ++v12;
  }

  return v11;
}

+ (id)_animalImageprintWrapperFromObservation:(id)a3 visionRequests:(id)a4 processingVersion:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__VCPPhotosFace__animalImageprintWrapperFromObservation_visionRequests_processingVersion___block_invoke;
  aBlock[3] = &unk_1E62980E0;
  id v9 = v8;
  id v32 = v9;
  id v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v11 = objc_opt_class();
  unint64_t v12 = v10[2](v10, v11);
  long long v13 = [v7 uuid];
  long long v14 = __90__VCPPhotosFace__animalImageprintWrapperFromObservation_visionRequests_processingVersion___block_invoke_2((uint64_t)v13, v13, v12);

  long long v15 = [v14 animalprint];
  long long v16 = v15;
  if (!v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      VCPLogInstance();
      *(double *)&uint64_t v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[PhotosFace] observation failed to return an animalprint", buf, 2u);
      }
      goto LABEL_9;
    }
LABEL_10:
    CGFloat v22 = 0;
    goto LABEL_24;
  }
  [v15 confidence];
  if (v17 >= 0.4)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        [v16 confidence];
        float v25 = v24;
        double v26 = [v14 description];
        *(_DWORD *)buf = 134218242;
        double v34 = v25;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v26;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[PhotosFace] Accepting animalprint with confidence: %.3f %@", buf, 0x16u);
      }
    }
    id v30 = 0;
    uint64_t v27 = [v16 serializeStateAndReturnError:&v30];
    *(double *)&uint64_t v18 = COERCE_DOUBLE(v30);
    if (v27)
    {
      CGFloat v22 = +[VCPVNImageprintWrapper wrapperWithImageprintType:1 version:v5 andData:v27];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        float v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          double v34 = *(double *)&v18;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "[PhotosFace] Failed to serialize animalprintData; %@",
            buf,
            0xCu);
        }
      }
      CGFloat v22 = 0;
    }

    goto LABEL_23;
  }
  if ((int)MediaAnalysisLogLevel() < 6) {
    goto LABEL_10;
  }
  VCPLogInstance();
  *(double *)&uint64_t v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    [v16 confidence];
    float v20 = v19;
    double v21 = [v14 description];
    *(_DWORD *)buf = 134218498;
    double v34 = v20;
    __int16 v35 = 2048;
    uint64_t v36 = 0x3FD99999A0000000;
    __int16 v37 = 2112;
    os_log_type_t v38 = v21;
    _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_INFO, "[PhotosFace] animalprint.confidence is too low (%.3f < %.3f) %@", buf, 0x20u);
  }
LABEL_9:
  CGFloat v22 = 0;
LABEL_23:

LABEL_24:
  return v22;
}

id __90__VCPPhotosFace__animalImageprintWrapperFromObservation_visionRequests_processingVersion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v6 = v5;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  id v6 = 0;
LABEL_11:

  return v6;
}

id __90__VCPPhotosFace__animalImageprintWrapperFromObservation_visionRequests_processingVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(a3, "results", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 uuid];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)faceFromAnimalHeadObservation:(id)a3 animalBodyObservation:(id)a4 animalLabel:(id)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7 visionRequests:(id)a8 processingVersion:(int)a9
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  float v19 = +[VCPPhotosFace faceWithLocalIdentifier:0];
  [v19 setSourceWidth:a6];
  [v19 setSourceHeight:a7];
  [v19 setManual:0];
  [v19 setAlgorithmVersion:a9];
  if ([v17 isEqualToString:*MEMORY[0x1E4F45B70]])
  {
    uint64_t v20 = 3;
    goto LABEL_5;
  }
  if ([v17 isEqualToString:*MEMORY[0x1E4F45B68]])
  {
    uint64_t v20 = 4;
LABEL_5:
    [v19 setDetectionType:v20];
    if (v16)
    {
      [v16 boundingBox];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      double v28 = v27;
      [v19 setBodyWidth:v25];
      [v19 setBodyHeight:v28];
      v53.origin.x = v22;
      v53.origin.y = v24;
      v53.size.width = v26;
      v53.size.height = v28;
      [v19 setBodyCenterX:CGRectGetMidX(v53)];
      v54.origin.x = v22;
      v54.origin.y = v24;
      v54.size.width = v26;
      v54.size.height = v28;
      [v19 setBodyCenterY:CGRectGetMidY(v54)];
      uint64_t v29 = [a1 _animalImageprintWrapperFromObservation:v16 visionRequests:v18 processingVersion:a9];
      [v19 setImageprintWrapper:v29];

      [v19 setVuObservationID:0];
    }
    if (!v15) {
      goto LABEL_11;
    }
    [v15 boundingBox];
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    if (objc_msgSend(v19, "setCenterAndSizeFromNormalizedFaceRect:"))
    {
      os_log_type_t v38 = [v19 imageprintWrapper];

      if (!v38)
      {
        uint64_t v39 = [a1 _animalImageprintWrapperFromObservation:v15 visionRequests:v18 processingVersion:a9];
        [v19 setImageprintWrapper:v39];

        [v19 setVuObservationID:0];
      }
LABEL_11:
      id v40 = v19;
      goto LABEL_21;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v41 = VCPLogInstance();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        int v43 = 134218752;
        uint64_t v44 = v31;
        __int16 v45 = 2048;
        uint64_t v46 = v33;
        __int16 v47 = 2048;
        uint64_t v48 = v35;
        __int16 v49 = 2048;
        uint64_t v50 = v37;
        _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_ERROR, "[PhotosFace] Unable to determine normalized bounding box { { %f, %f } { %f, %f } }", (uint8_t *)&v43, 0x2Au);
      }
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v41 = VCPLogInstance();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Label must be either dog or cat. Ignoring", (uint8_t *)&v43, 2u);
    }
    goto LABEL_19;
  }
LABEL_20:
  id v40 = 0;
LABEL_21:

  return v40;
}

+ (id)_animalHeadsBodiesFromAnimalHeadObservations:(id)a3 animalBodyObservations:(id)a4 matchedHead:(void *)a5 matchedBody:(void *)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 processingVersion:(int)a10
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v54 = a9;
  id v50 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v14 = 0;
  id v55 = (uint64_t **)a6;
  id v15 = (char *)a6 + 8;
LABEL_2:
  unint64_t v58 = v14;
  if (v14 < [v12 count])
  {
    for (unint64_t i = 0; ; unint64_t i = v57 + 1)
    {
      unint64_t v57 = i;
      if (i >= [v13 count])
      {
LABEL_35:
        unint64_t v14 = v58 + 1;
        goto LABEL_2;
      }
      id v17 = (void *)*v15;
      if (!*v15) {
        goto LABEL_16;
      }
      id v18 = v15;
      do
      {
        unint64_t v19 = v17[4];
        BOOL v20 = v19 >= v57;
        if (v19 >= v57) {
          double v21 = v17;
        }
        else {
          double v21 = v17 + 1;
        }
        if (v20) {
          id v18 = v17;
        }
        id v17 = (void *)*v21;
      }
      while (*v21);
      if (v18 == v15 || v57 < v18[4])
      {
LABEL_16:
        CGFloat v22 = [v12 objectAtIndexedSubscript:v58];
        double v23 = [v22 groupId];
        if (!v23) {
          goto LABEL_26;
        }
        CGFloat v24 = [v13 objectAtIndexedSubscript:v57];
        double v25 = [v24 groupId];
        BOOL v26 = v25 == 0;

        if (!v26)
        {
          double v27 = [v12 objectAtIndexedSubscript:v58];
          double v28 = [v27 groupId];
          uint64_t v29 = [v13 objectAtIndexedSubscript:v57];
          uint64_t v30 = [v29 groupId];
          char v31 = [v28 isEqual:v30];

          if (v31) {
            break;
          }
        }
      }
LABEL_27:
      ;
    }
    uint64_t v32 = [v12 objectAtIndexedSubscript:v58];
    uint64_t v33 = [v32 labels];
    uint64_t v34 = [v33 firstObject];
    CGFloat v22 = [v34 identifier];

    uint64_t v35 = [v13 objectAtIndexedSubscript:v57];
    uint64_t v36 = [v35 labels];
    uint64_t v37 = [v36 firstObject];
    os_log_type_t v38 = [v37 identifier];

    if ([v22 containsString:v38] & 1) != 0 || (objc_msgSend(v38, "containsString:", v22))
    {
      id v40 = [v12 objectAtIndexedSubscript:v58];
      uint64_t v41 = [v13 objectAtIndexedSubscript:v57];
      LODWORD(v49) = a10;
      id v42 = [a1 faceFromAnimalHeadObservation:v40 animalBodyObservation:v41 animalLabel:v38 sourceWidth:a7 sourceHeight:a8 visionRequests:v54 processingVersion:v49];

      if (v42)
      {
        int v43 = [v42 imageprintWrapper];
        BOOL v44 = v43 == 0;

        if (!v44)
        {
          std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)a5, &v58, (uint64_t *)&v58);
          std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(v55, &v57, (uint64_t *)&v57);
          [v50 addObject:v42];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            __int16 v45 = VCPLogInstance();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v46 = [v12 objectAtIndexedSubscript:v58];
              __int16 v47 = [v13 objectAtIndexedSubscript:v57];
              *(_DWORD *)buf = 138412802;
              CGRect v60 = v42;
              __int16 v61 = 2112;
              id v62 = v46;
              __int16 v63 = 2112;
              uint64_t v64 = v47;
              _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@ and %@", buf, 0x20u);
            }
          }
        }
      }
      std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)a5, &v58, (uint64_t *)&v58);
      std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(v55, &v57, (uint64_t *)&v57);

      goto LABEL_35;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v39 = VCPLogInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        CGRect v60 = v22;
        __int16 v61 = 2112;
        id v62 = v38;
        _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEBUG, "[PhotosFace] headLabel (%@) and bodyLabel (%@) do not match", buf, 0x16u);
      }
    }
LABEL_26:

    goto LABEL_27;
  }

  return v50;
}

+ (id)_animalBodiesOnlyFromAnimalBodyObservations:(id)a3 matchedBody:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v35 = a7;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v14 = 0;
  p_var1 = &a4->var0.var1;
  while (v14 < [v13 count])
  {
    var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)p_var1->var0.var0;
    if (!p_var1->var0.var0) {
      goto LABEL_14;
    }
    id v17 = p_var1;
    do
    {
      unint64_t v18 = (unint64_t)var0[4].var0.var0;
      BOOL v19 = v18 >= v14;
      if (v18 >= v14) {
        BOOL v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)var0;
      }
      else {
        BOOL v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&var0[1];
      }
      if (v19) {
        id v17 = var0;
      }
      var0 = *v20;
    }
    while (*v20);
    if (v17 == p_var1 || (void *)v14 < v17[4].var0.var0)
    {
LABEL_14:
      double v21 = [v13 objectAtIndexedSubscript:v14];
      CGFloat v22 = [v21 labels];
      double v23 = [v22 firstObject];
      CGFloat v24 = [v23 identifier];

      double v25 = [v13 objectAtIndexedSubscript:v14];
      LODWORD(v32) = a8;
      BOOL v26 = [a1 faceFromAnimalHeadObservation:0 animalBodyObservation:v25 animalLabel:v24 sourceWidth:a5 sourceHeight:a6 visionRequests:v35 processingVersion:v32];

      if (v26)
      {
        double v27 = [v26 imageprintWrapper];
        BOOL v28 = v27 == 0;

        if (!v28)
        {
          [v33 addObject:v26];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v29 = VCPLogInstance();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v30 = [v13 objectAtIndexedSubscript:v14];
              *(_DWORD *)buf = 138412546;
              uint64_t v37 = v26;
              __int16 v38 = 2112;
              uint64_t v39 = v30;
              _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@", buf, 0x16u);
            }
          }
        }
      }
    }
    ++v14;
  }

  return v33;
}

+ (id)_animalHeadsOnlyFromAnimalHeadObservations:(id)a3 matchedHead:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v43 = a7;
  id v36 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v11 = 0;
  p_var1 = &a4->var0.var1;
  uint64_t v13 = *MEMORY[0x1E4F45B60];
  uint64_t v38 = *MEMORY[0x1E4F45B58];
  uint64_t v37 = (void *)*MEMORY[0x1E4F45B68];
  unint64_t v14 = (void *)*MEMORY[0x1E4F45B70];
  while (v11 < [v10 count])
  {
    var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)p_var1->var0.var0;
    if (!p_var1->var0.var0) {
      goto LABEL_14;
    }
    id v16 = p_var1;
    do
    {
      unint64_t v17 = (unint64_t)var0[4].var0.var0;
      BOOL v18 = v17 >= v11;
      if (v17 >= v11) {
        BOOL v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)var0;
      }
      else {
        BOOL v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&var0[1];
      }
      if (v18) {
        id v16 = var0;
      }
      var0 = *v19;
    }
    while (*v19);
    if (v16 == p_var1 || (void *)v11 < v16[4].var0.var0)
    {
LABEL_14:
      BOOL v20 = [v10 objectAtIndexedSubscript:v11];
      double v21 = [v20 labels];
      CGFloat v22 = [v21 firstObject];
      double v23 = [v22 identifier];

      char v24 = [v23 isEqualToString:v13];
      double v25 = v14;
      if (v24 & 1) != 0 || (v26 = [v23 isEqualToString:v38], double v25 = v37, (v26))
      {
        double v27 = v25;
        BOOL v28 = [v10 objectAtIndexedSubscript:v11];
        LODWORD(v35) = a8;
        uint64_t v29 = [a1 faceFromAnimalHeadObservation:v28 animalBodyObservation:0 animalLabel:v27 sourceWidth:a5 sourceHeight:a6 visionRequests:v43 processingVersion:v35];

        if (v29)
        {
          uint64_t v30 = [v29 imageprintWrapper];
          BOOL v31 = v30 == 0;

          if (!v31)
          {
            [v36 addObject:v29];
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              uint64_t v32 = VCPLogInstance();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                id v33 = [v10 objectAtIndexedSubscript:v11];
                *(_DWORD *)buf = 138412546;
                __int16 v45 = v29;
                __int16 v46 = 2112;
                __int16 v47 = v33;
                _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@", buf, 0x16u);
              }
            }
          }
        }

        goto LABEL_23;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        double v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEFAULT, "[PhotosFace] headLabel is not dog or cat. Ignoring", buf, 2u);
        }
LABEL_23:
      }
    }
    ++v11;
  }

  return v36;
}

+ (id)facesFromFaceObservations:(id)a3 humanObservations:(id)a4 animalHeadObservations:(id)a5 animalBodyObservations:(id)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(id)a11 tooSmallFaceObservations:(id)a12 processingVersion:(int)a13 animalResults:(id *)a14
{
  v66[4] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v44 = a4;
  id v50 = a5;
  id v48 = a6;
  id v20 = a9;
  id v21 = a10;
  v64[0] = 0;
  v64[1] = 0;
  v62[1] = 0;
  __int16 v63 = v64;
  __int16 v61 = v62;
  v62[0] = 0;
  LODWORD(v36) = a13;
  id v46 = a11;
  id v47 = a12;
  __int16 v45 = v21;
  uint64_t v51 = v20;
  uint64_t v49 = v19;
  id v42 = [a1 _peopleFacesTorsosFromFaceObservations:v19 humanObservations:v44 matchedFace:&v63 matchedTorso:&v61 sourceWidth:a7 sourceHeight:a8 visionRequests:v20 blurScorePerFace:v21 exposureScorePerFace:v46 tooSmallFaceObservations:v47 processingVersion:v36];
  std::set<unsigned long>::set[abi:ne180100](v60, (uint64_t)&v63);
  LODWORD(v35) = a13;
  uint64_t v41 = [a1 _peopleFacesOnlyFromFaceObservations:v19 matchedFace:v60 sourceWidth:a7 sourceHeight:a8 visionRequests:v20 blurScorePerFace:v21 exposureScorePerFace:v46 tooSmallFaceObservations:v47 processingVersion:v35];
  std::__tree<unsigned long>::destroy((uint64_t)v60, (void *)v60[1]);
  std::set<unsigned long>::set[abi:ne180100](v59, (uint64_t)&v61);
  uint64_t v40 = [a1 _peopleTorsosOnlyFromHumanObservations:v44 matchedTorso:v59 sourceWidth:a7 sourceHeight:a8 visionRequests:v20 processingVersion:a13];
  std::__tree<unsigned long>::destroy((uint64_t)v59, (void *)v59[1]);
  uint64_t v37 = [a1 _filterAnimalObservations:v50 colocatingWithFaceObservations:v19 orHumanObservations:v44];
  id v43 = [a1 _filterAnimalObservations:v48 colocatingWithFaceObservations:v19 orHumanObservations:v44];
  CGFloat v22 = [MEMORY[0x1E4F1CA48] arrayWithArray:v50];
  double v23 = [MEMORY[0x1E4F1CA48] arrayWithArray:v48];
  [v22 removeObjectsAtIndexes:v37];
  [v23 removeObjectsAtIndexes:v43];
  unint64_t v57 = 0;
  uint64_t v58 = 0;
  v55[1] = 0;
  __int16 v56 = &v57;
  id v54 = v55;
  v55[0] = 0;
  LODWORD(v34) = a13;
  char v24 = [a1 _animalHeadsBodiesFromAnimalHeadObservations:v22 animalBodyObservations:v23 matchedHead:&v56 matchedBody:&v54 sourceWidth:a7 sourceHeight:a8 visionRequests:v51 processingVersion:v34];
  std::set<unsigned long>::set[abi:ne180100](v53, (uint64_t)&v56);
  uint64_t v39 = [a1 _animalHeadsOnlyFromAnimalHeadObservations:v22 matchedHead:v53 sourceWidth:a7 sourceHeight:a8 visionRequests:v51 processingVersion:a13];
  std::__tree<unsigned long>::destroy((uint64_t)v53, (void *)v53[1]);
  std::set<unsigned long>::set[abi:ne180100](v52, (uint64_t)&v54);
  double v25 = [a1 _animalBodiesOnlyFromAnimalBodyObservations:v23 matchedBody:v52 sourceWidth:a7 sourceHeight:a8 visionRequests:v51 processingVersion:a13];
  std::__tree<unsigned long>::destroy((uint64_t)v52, (void *)v52[1]);
  char v26 = [MEMORY[0x1E4F1CA48] array];
  [v26 addObjectsFromArray:v42];
  [v26 addObjectsFromArray:v41];
  [v26 addObjectsFromArray:v40];
  [v26 addObjectsFromArray:v24];
  [v26 addObjectsFromArray:v39];
  [v26 addObjectsFromArray:v25];
  v65[0] = @"NumberOfPetsGenerated";
  double v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "count") + objc_msgSend(v25, "count"));
  v66[0] = v27;
  v65[1] = @"NumberOfPetsGeneratedWithHeadOnly";
  BOOL v28 = NSNumber;
  uint64_t v29 = [v50 count];
  uint64_t v30 = [v28 numberWithUnsignedLong:v29 - v58];
  v66[1] = v30;
  v65[2] = @"NumberOfPetsGeneratedWithBodyOnly";
  BOOL v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
  v66[2] = v31;
  v65[3] = @"NumberOfPetsGeneratedWithHeadAndBody";
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
  v66[3] = v32;
  *a14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:4];

  std::__tree<unsigned long>::destroy((uint64_t)&v54, v55[0]);
  std::__tree<unsigned long>::destroy((uint64_t)&v56, v57);

  std::__tree<unsigned long>::destroy((uint64_t)&v61, v62[0]);
  std::__tree<unsigned long>::destroy((uint64_t)&v63, v64[0]);

  return v26;
}

+ (id)faceFromPHFace:(id)a3 copyOption:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    long long v8 = [v6 localIdentifier];
    long long v9 = [a1 faceWithLocalIdentifier:v8];

    switch(a4)
    {
      case 0:
        id v10 = [v7 personLocalIdentifier];
        [v9 setPersonLocalIdentifier:v10];

        objc_msgSend(v9, "setDetectionType:", objc_msgSend(v7, "detectionType"));
        objc_msgSend(v9, "setSourceWidth:", objc_msgSend(v7, "sourceWidth"));
        objc_msgSend(v9, "setSourceHeight:", objc_msgSend(v7, "sourceHeight"));
        [v7 centerX];
        objc_msgSend(v9, "setCenterX:");
        [v7 centerY];
        objc_msgSend(v9, "setCenterY:");
        [v7 size];
        objc_msgSend(v9, "setSize:");
        [v7 bodyCenterX];
        objc_msgSend(v9, "setBodyCenterX:");
        [v7 bodyCenterY];
        objc_msgSend(v9, "setBodyCenterY:");
        [v7 bodyWidth];
        objc_msgSend(v9, "setBodyWidth:");
        [v7 bodyHeight];
        objc_msgSend(v9, "setBodyHeight:");
        objc_msgSend(v9, "setHasSmile:", objc_msgSend(v7, "hasSmile"));
        [v7 blurScore];
        objc_msgSend(v9, "setBlurScore:");
        objc_msgSend(v9, "setIsLeftEyeClosed:", objc_msgSend(v7, "isLeftEyeClosed"));
        objc_msgSend(v9, "setIsRightEyeClosed:", objc_msgSend(v7, "isRightEyeClosed"));
        [v7 poseYaw];
        objc_msgSend(v9, "setPoseYaw:");
        objc_msgSend(v9, "setAlgorithmVersion:", objc_msgSend(v7, "faceAlgorithmVersion"));
        objc_msgSend(v9, "setQualityMeasure:", objc_msgSend(v7, "qualityMeasure"));
        [v7 quality];
        objc_msgSend(v9, "setQuality:");
        objc_msgSend(v9, "setHidden:", objc_msgSend(v7, "isHidden"));
        objc_msgSend(v9, "setIsInTrash:", objc_msgSend(v7, "isInTrash"));
        objc_msgSend(v9, "setManual:", objc_msgSend(v7, "manual"));
        unint64_t v11 = [v7 adjustmentVersion];
        [v9 setAdjustmentVersion:v11];

        objc_msgSend(v9, "setNameSource:", objc_msgSend(v7, "nameSource"));
        objc_msgSend(v9, "setTrainingType:", objc_msgSend(v7, "trainingType"));
        objc_msgSend(v9, "setClusterSequenceNumber:", objc_msgSend(v7, "clusterSequenceNumber"));
        objc_msgSend(v9, "setVuObservationID:", objc_msgSend(v7, "vuObservationID"));
        break;
      case 1:
        id v12 = [v7 personLocalIdentifier];
        [v9 setPersonLocalIdentifier:v12];

        objc_msgSend(v9, "setDetectionType:", objc_msgSend(v7, "detectionType"));
        objc_msgSend(v9, "setSourceWidth:", objc_msgSend(v7, "sourceWidth"));
        objc_msgSend(v9, "setSourceHeight:", objc_msgSend(v7, "sourceHeight"));
        [v7 centerX];
        objc_msgSend(v9, "setCenterX:");
        [v7 centerY];
        objc_msgSend(v9, "setCenterY:");
        [v7 size];
        objc_msgSend(v9, "setSize:");
        [v7 bodyCenterX];
        objc_msgSend(v9, "setBodyCenterX:");
        [v7 bodyCenterY];
        objc_msgSend(v9, "setBodyCenterY:");
        [v7 bodyWidth];
        objc_msgSend(v9, "setBodyWidth:");
        [v7 bodyHeight];
        objc_msgSend(v9, "setBodyHeight:");
        objc_msgSend(v9, "setQualityMeasure:", objc_msgSend(v7, "qualityMeasure"));
        [v7 quality];
        objc_msgSend(v9, "setQuality:");
        objc_msgSend(v9, "setClusterSequenceNumber:", objc_msgSend(v7, "clusterSequenceNumber"));
        objc_msgSend(v9, "setVuObservationID:", objc_msgSend(v7, "vuObservationID"));
        objc_msgSend(v9, "setHidden:", objc_msgSend(v7, "isHidden"));
        objc_msgSend(v9, "setIsInTrash:", objc_msgSend(v7, "isInTrash"));
        objc_msgSend(v9, "setManual:", objc_msgSend(v7, "manual"));
        break;
      case 2:
        objc_msgSend(v9, "setDetectionType:", objc_msgSend(v7, "detectionType"));
        objc_msgSend(v9, "setSourceWidth:", objc_msgSend(v7, "sourceWidth"));
        objc_msgSend(v9, "setSourceHeight:", objc_msgSend(v7, "sourceHeight"));
        [v7 centerX];
        objc_msgSend(v9, "setCenterX:");
        [v7 centerY];
        objc_msgSend(v9, "setCenterY:");
        [v7 size];
        objc_msgSend(v9, "setSize:");
        [v7 bodyCenterX];
        objc_msgSend(v9, "setBodyCenterX:");
        [v7 bodyCenterY];
        objc_msgSend(v9, "setBodyCenterY:");
        [v7 bodyWidth];
        objc_msgSend(v9, "setBodyWidth:");
        [v7 bodyHeight];
        objc_msgSend(v9, "setBodyHeight:");
        objc_msgSend(v9, "setHasSmile:", objc_msgSend(v7, "hasSmile"));
        [v7 blurScore];
        objc_msgSend(v9, "setBlurScore:");
        objc_msgSend(v9, "setIsLeftEyeClosed:", objc_msgSend(v7, "isLeftEyeClosed"));
        objc_msgSend(v9, "setIsRightEyeClosed:", objc_msgSend(v7, "isRightEyeClosed"));
        [v7 poseYaw];
        objc_msgSend(v9, "setPoseYaw:");
        objc_msgSend(v9, "setAlgorithmVersion:", objc_msgSend(v7, "faceAlgorithmVersion"));
        objc_msgSend(v9, "setQualityMeasure:", objc_msgSend(v7, "qualityMeasure"));
        [v7 quality];
        objc_msgSend(v9, "setQuality:");
        objc_msgSend(v9, "setHidden:", objc_msgSend(v7, "isHidden"));
        objc_msgSend(v9, "setIsInTrash:", objc_msgSend(v7, "isInTrash"));
        objc_msgSend(v9, "setManual:", objc_msgSend(v7, "manual"));
        uint64_t v13 = [v7 adjustmentVersion];
        [v9 setAdjustmentVersion:v13];

        goto LABEL_7;
      case 3:
LABEL_7:
        objc_msgSend(v9, "setNameSource:", objc_msgSend(v7, "nameSource"));
        objc_msgSend(v9, "setTrainingType:", objc_msgSend(v7, "trainingType"));
        unint64_t v14 = [v7 personLocalIdentifier];
        [v9 setPersonLocalIdentifier:v14];

        objc_msgSend(v9, "setClusterSequenceNumber:", objc_msgSend(v7, "clusterSequenceNumber"));
        objc_msgSend(v9, "setVuObservationID:", objc_msgSend(v7, "vuObservationID"));
        objc_msgSend(v9, "setQualityMeasure:", objc_msgSend(v7, "qualityMeasure"));
        id v15 = [v7 faceClusteringProperties];
        id v16 = [v15 faceprint];
        if (v16)
        {
          BOOL v17 = [v9 detectionType] != 1;
          uint64_t v18 = [v16 faceprintVersion];
          id v19 = [v16 faceprintData];
          id v20 = +[VCPVNImageprintWrapper wrapperWithImageprintType:v17 version:v18 andData:v19];
          [v9 setImageprintWrapper:v20];
        }
        id v21 = [v15 groupingIdentifier];
        [v9 setGroupingIdentifier:v21];

        break;
      default:
        break;
    }
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

+ (id)facesFromPHFetchResult:(id)a3 copyOption:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        unint64_t v11 = objc_msgSend((id)objc_opt_class(), "faceFromPHFace:copyOption:", *(void *)(*((void *)&v13 + 1) + 8 * i), a4, (void)v13);
        if (v11) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v6;
}

- (void)replaceCoordinatesAndFeaturesFromDetectedFace:(id)a3
{
  id v26 = a3;
  self->_sourceint Width = [v26 sourceWidth];
  self->_sourceint Height = [v26 sourceHeight];
  self->_detectionType = [v26 detectionType];
  [v26 centerX];
  self->_centerX = v4;
  [v26 centerY];
  self->_centerY = v5;
  [v26 size];
  self->_size = v6;
  [v26 bodyWidth];
  self->_bodyint Width = v7;
  [v26 bodyHeight];
  self->_bodyint Height = v8;
  [v26 bodyCenterX];
  self->_bodyCenterX = v9;
  [v26 bodyCenterY];
  self->_bodyCenterY = v10;
  self->_hasSmile = [v26 hasSmile];
  [v26 blurScore];
  self->_blurScore = v11;
  [v26 exposureScore];
  self->_exposureScore = v12;
  self->_isLeftEyeClosed = [v26 isLeftEyeClosed];
  self->_isRightEyeClosed = [v26 isRightEyeClosed];
  [v26 poseYaw];
  self->_poseYaw = v13;
  self->_algorithmVersiounint64_t n = [v26 algorithmVersion];
  self->_qualityMeasure = [v26 qualityMeasure];
  self->_isTooSmall = [v26 isTooSmall];
  long long v14 = [v26 groupingIdentifier];
  groupingIdentifier = self->_groupingIdentifier;
  self->_groupingIdentifier = v14;

  self->_ageType = [v26 ageType];
  self->_sexType = [v26 sexType];
  self->_eyesState = [v26 eyesState];
  self->_smileType = [v26 smileType];
  self->_facialHairType = [v26 facialHairType];
  self->_hairColorType = [v26 hairColorType];
  self->_glassesType = [v26 glassesType];
  self->_expressionType = [v26 expressionType];
  self->_headgearType = [v26 headgearType];
  self->_hairType = [v26 hairType];
  self->_poseType = [v26 poseType];
  self->_skintoneType = [v26 skintoneType];
  self->_ethnicityType = [v26 ethnicityType];
  self->_hasFaceMasunint64_t k = [v26 hasFaceMask];
  self->_gazeType = [v26 gazeType];
  [v26 gazeCenterX];
  self->_gazeCenterX = v16;
  [v26 gazeCenterY];
  self->_gazeCenterY = v17;
  [v26 gazeRect];
  self->_gazeRect.origin.x = v18;
  self->_gazeRect.origin.y = v19;
  self->_gazeRect.size.width = v20;
  self->_gazeRect.size.height = v21;
  [v26 gazeAngle];
  self->_gazeAngle = v22;
  [v26 gazeConfidence];
  self->_gazeConfidence = v23;
  [v26 roll];
  self->_roll = v24;
  [v26 quality];
  self->_quality = v25;
}

- (BOOL)setCenterAndSizeFromNormalizedFaceRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  self->_centerX = CGRectGetMidX(a3);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  self->_centerY = CGRectGetMidY(v13);
  sourceint Width = self->_sourceWidth;
  double v9 = 0.0;
  if (sourceWidth)
  {
    sourceint Height = self->_sourceHeight;
    if (sourceHeight)
    {
      double v11 = width * (double)sourceWidth;
      if (v11 < height * (double)sourceHeight) {
        double v11 = height * (double)sourceHeight;
      }
      if (sourceWidth <= sourceHeight) {
        sourceint Width = self->_sourceHeight;
      }
      double v9 = v11 / (double)sourceWidth;
    }
  }
  self->_size = v9;
  return 1;
}

- (CGRect)normalizedFaceRect
{
  double size = self->_size;
  sourceint Width = self->_sourceWidth;
  sourceint Height = self->_sourceHeight;
  if (size <= 1.0) {
    double v5 = self->_size;
  }
  else {
    double v5 = 1.0;
  }
  if (sourceWidth <= sourceHeight) {
    int64_t v6 = self->_sourceHeight;
  }
  else {
    int64_t v6 = self->_sourceWidth;
  }
  double v7 = size * (double)v6;
  double v8 = v7 / (double)sourceHeight;
  double v9 = fmax(self->_centerX - v7 / (double)sourceWidth * 0.5, 0.0);
  double v10 = fmax(self->_centerY - v8 * 0.5, 0.0);
  double v11 = v5;
  result.size.double height = v11;
  result.size.double width = v5;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)normalizedBodyRect
{
  sourceint Width = self->_sourceWidth;
  sourceint Height = self->_sourceHeight;
  double v4 = self->_bodyWidth * (double)sourceWidth;
  if (v4 < self->_bodyHeight * (double)sourceHeight) {
    double v4 = self->_bodyHeight * (double)sourceHeight;
  }
  if (sourceWidth <= sourceHeight) {
    int64_t v5 = self->_sourceHeight;
  }
  else {
    int64_t v5 = self->_sourceWidth;
  }
  double v6 = v4 / (double)v5;
  if (sourceWidth) {
    BOOL v7 = sourceHeight == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    double v6 = 0.0;
  }
  double v8 = v4 / (double)sourceWidth;
  double v9 = v4 / (double)sourceHeight;
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  double v10 = fmax(self->_bodyCenterX - v8 * 0.5, 0.0);
  double v11 = fmax(self->_bodyCenterY - v9 * 0.5, 0.0);
  double v12 = v6;
  result.size.double height = v12;
  result.size.double width = v6;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (id)gist
{
  uint64_t v3 = NSString;
  double v4 = [(VCPPhotosFace *)self localIdentifier];
  if ([(VCPPhotosFace *)self manual]) {
    int64_t v5 = @"-manual";
  }
  else {
    int64_t v5 = &stru_1F15A0D70;
  }
  double v6 = [(VCPPhotosFace *)self personLocalIdentifier];
  if ([(VCPPhotosFace *)self detectionType] == 1) {
    BOOL v7 = @"Human";
  }
  else {
    BOOL v7 = @"Animal";
  }
  double v8 = [(VCPPhotosFace *)self imageprintWrapper];
  uint64_t v9 = [v8 version];
  [(VCPPhotosFace *)self centerX];
  uint64_t v11 = v10;
  [(VCPPhotosFace *)self centerY];
  uint64_t v13 = v12;
  [(VCPPhotosFace *)self size];
  uint64_t v15 = v14;
  [(VCPPhotosFace *)self bodyCenterX];
  uint64_t v17 = v16;
  [(VCPPhotosFace *)self bodyCenterY];
  uint64_t v19 = v18;
  [(VCPPhotosFace *)self bodyWidth];
  uint64_t v21 = v20;
  [(VCPPhotosFace *)self bodyHeight];
  uint64_t v23 = v22;
  [(VCPPhotosFace *)self quality];
  double v25 = [v3 stringWithFormat:@"%@%@ (%@) %@ v%d (%.2f, %.2f, %.2f) (%.2f, %.2f, %.2f, %.2f) quality: %.2f source dimension: %ld*%ld", v4, v5, v6, v7, v9, v11, v13, v15, v17, v19, v21, v23, v24, -[VCPPhotosFace sourceWidth](self, "sourceWidth"), -[VCPPhotosFace sourceHeight](self, "sourceHeight")];

  return v25;
}

+ (double)_calculateOverlappingBetweenFaceObservation:(id)a3 andBodyObservation:(id)a4
{
  id v5 = a4;
  [a3 boundingBox];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 boundingBox];
  v22.origin.CGFloat x = v14;
  v22.origin.CGFloat y = v15;
  v22.size.double width = v16;
  v22.size.double height = v17;
  v20.origin.CGFloat x = v7;
  v20.origin.CGFloat y = v9;
  v20.size.double width = v11;
  v20.size.double height = v13;
  CGRect v21 = CGRectIntersection(v20, v22);
  double v18 = v21.size.width * v21.size.height / (v11 * v13);

  return v18;
}

+ (double)_calculateIoUBetweenObservation:(id)a3 andObservation:(id)a4
{
  id v5 = a4;
  [a3 boundingBox];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 boundingBox];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v26.origin.CGFloat x = v7;
  v26.origin.CGFloat y = v9;
  v26.size.double width = v11;
  v26.size.double height = v13;
  v29.origin.CGFloat x = v15;
  v29.origin.CGFloat y = v17;
  v29.size.double width = v19;
  v29.size.double height = v21;
  CGRect v27 = CGRectIntersection(v26, v29);
  double height = v27.size.height;
  double width = v27.size.width;
  v27.origin.CGFloat x = v7;
  v27.origin.CGFloat y = v9;
  v27.size.double width = v11;
  v27.size.double height = v13;
  v30.origin.CGFloat x = v15;
  v30.origin.CGFloat y = v17;
  v30.size.double width = v19;
  v30.size.double height = v21;
  CGRect v28 = CGRectUnion(v27, v30);
  double v22 = width * height / (v28.size.width * v28.size.height);

  return v22;
}

+ (BOOL)_isColocatingAnimalObservation:(id)a3 withFaceObservations:(id)a4 orTorsoObservations:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * v14);
      [a1 _calculateIoUBetweenObservation:v8 andObservation:v15];
      double v17 = v16;
      if (v16 > 0.699999988) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v43 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if ((int)MediaAnalysisLogLevel() < 7)
    {
      BOOL v25 = 1;
      id v18 = v11;
      goto LABEL_28;
    }
    CGRect v26 = VCPLogInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      double v38 = v17;
      __int16 v39 = 2112;
      id v40 = v8;
      __int16 v41 = 2112;
      uint64_t v42 = v15;
      _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEBUG, "[PhotosFace] IoU %f %@ %@", buf, 0x20u);
    }
    id v18 = v11;
  }
  else
  {
LABEL_9:

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (!v19)
    {
LABEL_17:
      BOOL v25 = 0;
      goto LABEL_28;
    }
    uint64_t v20 = *(void *)v29;
LABEL_11:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v29 != v20) {
        objc_enumerationMutation(v18);
      }
      uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * v21);
      objc_msgSend(a1, "_calculateIoUBetweenObservation:andObservation:", v8, v22, (void)v28);
      double v24 = v23;
      if (v23 > 0.699999988) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v19) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_27;
    }
    CGRect v26 = VCPLogInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      double v38 = v24;
      __int16 v39 = 2112;
      id v40 = v8;
      __int16 v41 = 2112;
      uint64_t v42 = v22;
      _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEBUG, "[PhotosFace] IoU %f %@ %@", buf, 0x20u);
    }
  }

LABEL_27:
  BOOL v25 = 1;
LABEL_28:

  return v25;
}

- (int64_t)qualityMeasureWithCountOfFacesOnAsset:(unint64_t)a3
{
  sourceint Width = self->_sourceWidth;
  if ((int64_t)sourceWidth <= self->_sourceHeight) {
    sourceint Width = self->_sourceHeight;
  }
  float v4 = 0.5;
  if (!self->_isLeftEyeClosed && !self->_isRightEyeClosed) {
    float v4 = 2.0;
  }
  float v5 = 0.25;
  if (sourceWidth >= 0x400)
  {
    float v5 = 1.0;
    if (sourceWidth <= 0xC00) {
      float v5 = (float)((float)sourceWidth * 0.00036621) + -0.125;
    }
  }
  if (a3)
  {
    float size = self->_size;
    BOOL v7 = size > 0.5 || size < 0.1;
    float v8 = (float)(size * 0.5) + 0.75;
    float v9 = 0.8;
    if (v7) {
      float v8 = 0.8;
    }
    if (self->_hasSmile) {
      float v9 = 1.0;
    }
    float v10 = (1.0 - self->_blurScore) * 5.0;
    float v11 = v4 * (float)(v9 * (float)(v5 * (float)(v8 * v10)));
    unint64_t v12 = 3;
    if (a3 < 3) {
      unint64_t v12 = a3;
    }
    float v13 = (float)(PFFaceCountPenalties[v12 - 1] * v11) * 100.0;
  }
  else
  {
    float v13 = 0.0;
  }
  if (v13 < 1.0) {
    return (uint64_t)1.0;
  }
  return (uint64_t)v13;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (void)setPersonLocalIdentifier:(id)a3
{
}

- (int64_t)sourceWidth
{
  return self->_sourceWidth;
}

- (void)setSourceWidth:(int64_t)a3
{
  self->_sourceint Width = a3;
}

- (int64_t)sourceHeight
{
  return self->_sourceHeight;
}

- (void)setSourceHeight:(int64_t)a3
{
  self->_sourceint Height = a3;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(signed __int16)a3
{
  self->_detectionType = a3;
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setCenterX:(double)a3
{
  self->_centerX = a3;
}

- (double)centerY
{
  return self->_centerY;
}

- (void)setCenterY:(double)a3
{
  self->_centerY = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_float size = a3;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (void)setBodyCenterX:(double)a3
{
  self->_bodyCenterX = a3;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (void)setBodyCenterY:(double)a3
{
  self->_bodyCenterY = a3;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (void)setBodyWidth:(double)a3
{
  self->_bodyint Width = a3;
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (void)setBodyHeight:(double)a3
{
  self->_bodyint Height = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hiddeunint64_t n = a3;
}

- (BOOL)isInTrash
{
  return self->_isInTrash;
}

- (void)setIsInTrash:(BOOL)a3
{
  self->_isInTrash = a3;
}

- (BOOL)manual
{
  return self->_manual;
}

- (void)setManual:(BOOL)a3
{
  self->_manual = a3;
}

- (BOOL)isTooSmall
{
  return self->_isTooSmall;
}

- (void)setIsTooSmall:(BOOL)a3
{
  self->_isTooSmall = a3;
}

- (BOOL)hasSmile
{
  return self->_hasSmile;
}

- (void)setHasSmile:(BOOL)a3
{
  self->_hasSmile = a3;
}

- (double)blurScore
{
  return self->_blurScore;
}

- (void)setBlurScore:(double)a3
{
  self->_blurScore = a3;
}

- (double)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(double)a3
{
  self->_exposureScore = a3;
}

- (BOOL)isLeftEyeClosed
{
  return self->_isLeftEyeClosed;
}

- (void)setIsLeftEyeClosed:(BOOL)a3
{
  self->_isLeftEyeClosed = a3;
}

- (BOOL)isRightEyeClosed
{
  return self->_isRightEyeClosed;
}

- (void)setIsRightEyeClosed:(BOOL)a3
{
  self->_isRightEyeClosed = a3;
}

- (NSString)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentVersion:(id)a3
{
}

- (int64_t)nameSource
{
  return self->_nameSource;
}

- (void)setNameSource:(int64_t)a3
{
  self->_nameSource = a3;
}

- (int)trainingType
{
  return self->_trainingType;
}

- (void)setTrainingType:(int)a3
{
  self->_trainingType = a3;
}

- (double)poseYaw
{
  return self->_poseYaw;
}

- (void)setPoseYaw:(double)a3
{
  self->_poseYaw = a3;
}

- (unint64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setAlgorithmVersion:(unint64_t)a3
{
  self->_algorithmVersiounint64_t n = a3;
}

- (int64_t)clusterSequenceNumber
{
  return self->_clusterSequenceNumber;
}

- (void)setClusterSequenceNumber:(int64_t)a3
{
  self->_clusterSequenceNumber = a3;
}

- (int64_t)vuObservationID
{
  return self->_vuObservationID;
}

- (void)setVuObservationID:(int64_t)a3
{
  self->_vuObservationID = a3;
}

- (int64_t)qualityMeasure
{
  return self->_qualityMeasure;
}

- (void)setQualityMeasure:(int64_t)a3
{
  self->_qualityMeasure = a3;
}

- (unsigned)ageType
{
  return self->_ageType;
}

- (void)setAgeType:(unsigned __int16)a3
{
  self->_ageType = a3;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (void)setSexType:(unsigned __int16)a3
{
  self->_sexType = a3;
}

- (unsigned)eyesState
{
  return self->_eyesState;
}

- (void)setEyesState:(unsigned __int16)a3
{
  self->_eyesState = a3;
}

- (unsigned)smileType
{
  return self->_smileType;
}

- (void)setSmileType:(unsigned __int16)a3
{
  self->_smileType = a3;
}

- (unsigned)facialHairType
{
  return self->_facialHairType;
}

- (void)setFacialHairType:(unsigned __int16)a3
{
  self->_facialHairType = a3;
}

- (unsigned)hairColorType
{
  return self->_hairColorType;
}

- (void)setHairColorType:(unsigned __int16)a3
{
  self->_hairColorType = a3;
}

- (unsigned)glassesType
{
  return self->_glassesType;
}

- (void)setGlassesType:(unsigned __int16)a3
{
  self->_glassesType = a3;
}

- (unsigned)expressionType
{
  return self->_expressionType;
}

- (void)setExpressionType:(unsigned __int16)a3
{
  self->_expressionType = a3;
}

- (unsigned)headgearType
{
  return self->_headgearType;
}

- (void)setHeadgearType:(unsigned __int16)a3
{
  self->_headgearType = a3;
}

- (unsigned)hairType
{
  return self->_hairType;
}

- (void)setHairType:(unsigned __int16)a3
{
  self->_hairType = a3;
}

- (unsigned)poseType
{
  return self->_poseType;
}

- (void)setPoseType:(unsigned __int16)a3
{
  self->_poseType = a3;
}

- (unsigned)skintoneType
{
  return self->_skintoneType;
}

- (void)setSkintoneType:(unsigned __int16)a3
{
  self->_skintoneType = a3;
}

- (unsigned)ethnicityType
{
  return self->_ethnicityType;
}

- (void)setEthnicityType:(unsigned __int16)a3
{
  self->_ethnicityType = a3;
}

- (BOOL)hasFaceMask
{
  return self->_hasFaceMask;
}

- (void)setHasFaceMask:(BOOL)a3
{
  self->_hasFaceMasunint64_t k = a3;
}

- (unsigned)gazeType
{
  return self->_gazeType;
}

- (void)setGazeType:(unsigned __int16)a3
{
  self->_gazeType = a3;
}

- (double)gazeCenterX
{
  return self->_gazeCenterX;
}

- (void)setGazeCenterX:(double)a3
{
  self->_gazeCenterX = a3;
}

- (double)gazeCenterY
{
  return self->_gazeCenterY;
}

- (void)setGazeCenterY:(double)a3
{
  self->_gazeCenterY = a3;
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

- (void)setGazeRect:(CGRect)a3
{
  self->_gazeRect = a3;
}

- (float)gazeAngle
{
  return self->_gazeAngle;
}

- (void)setGazeAngle:(float)a3
{
  self->_gazeAngle = a3;
}

- (float)gazeConfidence
{
  return self->_gazeConfidence;
}

- (void)setGazeConfidence:(float)a3
{
  self->_gazeConfidence = a3;
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setGroupingIdentifier:(id)a3
{
}

- (VCPVNImageprintWrapper)imageprintWrapper
{
  return self->_imageprintWrapper;
}

- (void)setImageprintWrapper:(id)a3
{
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

- (double)quality
{
  return self->_quality;
}

- (void)setQuality:(double)a3
{
  self->_qualitdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageprintWrapper, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

+ (uint64_t)facesFromFaceObservations:(uint64_t)a3 humanObservations:(char)a4 animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:
{
  unint64_t v9 = result;
  while (2)
  {
    unint64_t v10 = v9;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v9 = v10;
          uint64_t v11 = a2 - v10;
          unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v10) >> 3);
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                float v46 = *(float *)(a2 - 24);
                float v47 = *(float *)v10;
                if (v46 > *(float *)v10)
                {
                  *(float *)unint64_t v10 = v46;
                  *(float *)(a2 - 24) = v47;
                  uint64_t v48 = *(void *)(v10 + 8);
                  *(void *)(v10 + 8) = *(void *)(a2 - 16);
                  *(void *)(a2 - 16) = v48;
                  uint64_t v49 = *(void *)(v10 + 16);
                  *(void *)(v10 + 16) = *(void *)(a2 - 8);
                  *(void *)(a2 - 8) = v49;
                }
                break;
              case 3uLL:
                CGRect result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v10, v10 + 24, a2 - 24);
                break;
              case 4uLL:
                CGRect result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v10, v10 + 24, v10 + 48, a2 - 24);
                break;
              case 5uLL:
                CGRect result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v10, v10 + 24, v10 + 48, v10 + 72);
                float v50 = *(float *)(a2 - 24);
                float v51 = *(float *)(v10 + 72);
                if (v50 > v51)
                {
                  *(float *)(v10 + 72) = v50;
                  *(float *)(a2 - 24) = v51;
                  uint64_t v52 = *(void *)(v10 + 80);
                  *(void *)(v10 + 80) = *(void *)(a2 - 16);
                  *(void *)(a2 - 16) = v52;
                  uint64_t v53 = *(void *)(v10 + 88);
                  *(void *)(v10 + 88) = *(void *)(a2 - 8);
                  *(void *)(a2 - 8) = v53;
                  float v54 = *(float *)(v10 + 72);
                  float v55 = *(float *)(v10 + 48);
                  if (v54 > v55)
                  {
                    *(float *)(v10 + 48) = v54;
                    *(float *)(v10 + 72) = v55;
                    uint64_t v56 = *(void *)(v10 + 80);
                    uint64_t v57 = *(void *)(v10 + 88);
                    long long v58 = *(_OWORD *)(v10 + 56);
                    *(void *)(v10 + 56) = v56;
                    *(void *)(v10 + 64) = v57;
                    *(_OWORD *)(v10 + 80) = v58;
                    float v59 = *(float *)(v10 + 24);
                    if (v54 > v59)
                    {
                      *(float *)(v10 + 24) = v54;
                      *(float *)(v10 + 48) = v59;
                      long long v60 = *(_OWORD *)(v10 + 32);
                      *(void *)(v10 + 32) = v56;
                      *(void *)(v10 + 40) = v57;
                      *(_OWORD *)(v10 + 56) = v60;
                      float v61 = *(float *)v10;
                      if (v54 > *(float *)v10)
                      {
                        *(float *)unint64_t v10 = v54;
                        *(float *)(v10 + 24) = v61;
                        long long v62 = *(_OWORD *)(v10 + 8);
                        *(void *)(v10 + 8) = v56;
                        *(void *)(v10 + 16) = v57;
                        *(_OWORD *)(v10 + 32) = v62;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v11 <= 575)
          {
            unint64_t v63 = v10 + 24;
            BOOL v65 = v10 == a2 || v63 == a2;
            if (a4)
            {
              if (!v65)
              {
                uint64_t v66 = 0;
                unint64_t v67 = v10;
                do
                {
                  unint64_t v68 = v63;
                  float v69 = *(float *)(v67 + 24);
                  float v70 = *(float *)v67;
                  if (v69 > *(float *)v67)
                  {
                    long long v71 = *(_OWORD *)(v67 + 32);
                    uint64_t v72 = v66;
                    while (1)
                    {
                      uint64_t v73 = v10 + v72;
                      *(float *)(v73 + 24) = v70;
                      uint64_t v74 = *(void *)(v10 + v72 + 16);
                      *(void *)(v73 + 32) = *(void *)(v10 + v72 + 8);
                      *(void *)(v73 + 40) = v74;
                      if (!v72) {
                        break;
                      }
                      float v70 = *(float *)(v73 - 24);
                      v72 -= 24;
                      if (v69 <= v70)
                      {
                        uint64_t v75 = v10 + v72 + 24;
                        goto LABEL_84;
                      }
                    }
                    uint64_t v75 = v10;
LABEL_84:
                    *(float *)uint64_t v75 = v69;
                    *(_OWORD *)(v75 + 8) = v71;
                  }
                  unint64_t v63 = v68 + 24;
                  v66 += 24;
                  unint64_t v67 = v68;
                }
                while (v68 + 24 != a2);
              }
            }
            else if (!v65)
            {
              unint64_t v105 = v10 + 40;
              do
              {
                unint64_t v106 = v63;
                float v107 = *(float *)(v9 + 24);
                float v108 = *(float *)v9;
                if (v107 > *(float *)v9)
                {
                  long long v109 = *(_OWORD *)(v9 + 32);
                  v110 = (float *)v105;
                  do
                  {
                    v111 = v110;
                    *(v110 - 4) = v108;
                    *((void *)v110 - 1) = *((void *)v110 - 4);
                    uint64_t v112 = *((void *)v110 - 3);
                    v110 -= 6;
                    *(void *)v111 = v112;
                    float v108 = *(v111 - 16);
                  }
                  while (v107 > v108);
                  *(v110 - 4) = v107;
                  *(_OWORD *)(v110 - 2) = v109;
                }
                unint64_t v63 = v106 + 24;
                v105 += 24;
                unint64_t v9 = v106;
              }
              while (v106 + 24 != a2);
            }
            return result;
          }
          if (!a3)
          {
            if (v10 != a2)
            {
              int64_t v76 = (v12 - 2) >> 1;
              int64_t v77 = v76;
              do
              {
                int64_t v78 = v77;
                if (v76 >= v77)
                {
                  uint64_t v79 = (2 * v77) | 1;
                  unint64_t v80 = v10 + 24 * v79;
                  if (2 * v78 + 2 < (uint64_t)v12 && *(float *)v80 > *(float *)(v80 + 24))
                  {
                    v80 += 24;
                    uint64_t v79 = 2 * v78 + 2;
                  }
                  unint64_t v81 = v10 + 24 * v78;
                  float v82 = *(float *)v80;
                  float v83 = *(float *)v81;
                  if (*(float *)v80 <= *(float *)v81)
                  {
                    long long v84 = *(_OWORD *)(v81 + 8);
                    do
                    {
                      unint64_t v85 = v81;
                      unint64_t v81 = v80;
                      *(float *)unint64_t v85 = v82;
                      *(void *)(v85 + 8) = *(void *)(v80 + 8);
                      *(void *)(v85 + 16) = *(void *)(v80 + 16);
                      if (v76 < v79) {
                        break;
                      }
                      uint64_t v86 = 2 * v79;
                      uint64_t v79 = (2 * v79) | 1;
                      unint64_t v80 = v10 + 24 * v79;
                      uint64_t v87 = v86 + 2;
                      if (v87 < (uint64_t)v12 && *(float *)v80 > *(float *)(v80 + 24))
                      {
                        v80 += 24;
                        uint64_t v79 = v87;
                      }
                      float v82 = *(float *)v80;
                    }
                    while (*(float *)v80 <= v83);
                    *(float *)unint64_t v81 = v83;
                    *(_OWORD *)(v81 + 8) = v84;
                  }
                }
                int64_t v77 = v78 - 1;
              }
              while (v78);
              int64_t v88 = v11 / 0x18uLL;
              do
              {
                int64_t v89 = 0;
                float v90 = *(float *)v10;
                uint64_t v91 = *(void *)(v10 + 8);
                uint64_t v92 = *(void *)(v10 + 16);
                unint64_t v93 = v10;
                do
                {
                  unint64_t v94 = v93;
                  v93 += 24 * v89 + 24;
                  uint64_t v95 = 2 * v89;
                  CGRect result = (2 * v89) | 1;
                  int64_t v89 = result;
                  uint64_t v96 = v95 + 2;
                  if (v96 < v88)
                  {
                    CGRect result = v93 + 24;
                    if (*(float *)v93 > *(float *)(v93 + 24))
                    {
                      v93 += 24;
                      int64_t v89 = v96;
                    }
                  }
                  *(_DWORD *)unint64_t v94 = *(_DWORD *)v93;
                  *(void *)(v94 + 8) = *(void *)(v93 + 8);
                  *(void *)(v94 + 16) = *(void *)(v93 + 16);
                }
                while (v89 <= (uint64_t)((unint64_t)(v88 - 2) >> 1));
                if (v93 == a2 - 24)
                {
                  *(float *)unint64_t v93 = v90;
                  *(void *)(v93 + 8) = v91;
                  *(void *)(v93 + 16) = v92;
                }
                else
                {
                  *(_DWORD *)unint64_t v93 = *(_DWORD *)(a2 - 24);
                  *(void *)(v93 + 8) = *(void *)(a2 - 16);
                  *(void *)(v93 + 16) = *(void *)(a2 - 8);
                  *(float *)(a2 - 24) = v90;
                  *(void *)(a2 - 16) = v91;
                  *(void *)(a2 - 8) = v92;
                  uint64_t v97 = v93 - v10 + 24;
                  if (v97 >= 25)
                  {
                    unint64_t v98 = (v97 / 0x18uLL - 2) >> 1;
                    unint64_t v99 = v10 + 24 * v98;
                    float v100 = *(float *)v99;
                    float v101 = *(float *)v93;
                    if (*(float *)v99 > *(float *)v93)
                    {
                      long long v102 = *(_OWORD *)(v93 + 8);
                      do
                      {
                        unint64_t v103 = v93;
                        unint64_t v93 = v99;
                        *(float *)unint64_t v103 = v100;
                        *(void *)(v103 + 8) = *(void *)(v99 + 8);
                        *(void *)(v103 + 16) = *(void *)(v99 + 16);
                        if (!v98) {
                          break;
                        }
                        unint64_t v98 = (v98 - 1) >> 1;
                        unint64_t v99 = v10 + 24 * v98;
                        float v100 = *(float *)v99;
                      }
                      while (*(float *)v99 > v101);
                      *(float *)unint64_t v93 = v101;
                      *(_OWORD *)(v93 + 8) = v102;
                    }
                  }
                }
                a2 -= 24;
              }
              while (v88-- > 2);
            }
            return result;
          }
          unint64_t v13 = v12 >> 1;
          uint64_t v14 = v10 + 24 * (v12 >> 1);
          if ((unint64_t)v11 >= 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v9, v9 + 24 * (v12 >> 1), a2 - 24);
            uint64_t v15 = 3 * v13;
            uint64_t v16 = v9 + 24 * v13 - 24;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v9 + 24, v16, a2 - 48);
            uint64_t v17 = v9 + 24 + 8 * v15;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v9 + 48, v17, a2 - 72);
            CGRect result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v16, v14, v17);
            float v18 = *(float *)v9;
            *(_DWORD *)unint64_t v9 = *(_DWORD *)v14;
            *(float *)uint64_t v14 = v18;
            long long v19 = *(_OWORD *)(v9 + 8);
            *(_OWORD *)(v9 + 8) = *(_OWORD *)(v14 + 8);
            *(_OWORD *)(v14 + 8) = v19;
          }
          else
          {
            CGRect result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v9 + 24 * (v12 >> 1), v9, a2 - 24);
          }
          --a3;
          float v20 = *(float *)v9;
          if ((a4 & 1) != 0 || *(float *)(v9 - 24) > v20) {
            break;
          }
          if (v20 <= *(float *)(a2 - 24))
          {
            unint64_t v36 = v9 + 24;
            do
            {
              unint64_t v10 = v36;
              if (v36 >= a2) {
                break;
              }
              v36 += 24;
            }
            while (v20 <= *(float *)v10);
          }
          else
          {
            unint64_t v10 = v9;
            do
            {
              float v35 = *(float *)(v10 + 24);
              v10 += 24;
            }
            while (v20 <= v35);
          }
          unint64_t v37 = a2;
          if (v10 < a2)
          {
            unint64_t v37 = a2;
            do
            {
              float v38 = *(float *)(v37 - 24);
              v37 -= 24;
            }
            while (v20 > v38);
          }
          long long v39 = *(_OWORD *)(v9 + 8);
          if (v10 < v37)
          {
            float v40 = *(float *)v10;
            float v41 = *(float *)v37;
            do
            {
              *(float *)unint64_t v10 = v41;
              *(float *)unint64_t v37 = v40;
              uint64_t v42 = *(void *)(v10 + 8);
              *(void *)(v10 + 8) = *(void *)(v37 + 8);
              *(void *)(v37 + 8) = v42;
              uint64_t v43 = *(void *)(v10 + 16);
              *(void *)(v10 + 16) = *(void *)(v37 + 16);
              *(void *)(v37 + 16) = v43;
              do
              {
                float v44 = *(float *)(v10 + 24);
                v10 += 24;
                float v40 = v44;
              }
              while (v20 <= v44);
              do
              {
                float v45 = *(float *)(v37 - 24);
                v37 -= 24;
                float v41 = v45;
              }
              while (v20 > v45);
            }
            while (v10 < v37);
          }
          BOOL v4 = v10 - 24 >= v9;
          BOOL v5 = v10 - 24 == v9;
          if (v10 - 24 != v9)
          {
            *(_DWORD *)unint64_t v9 = *(_DWORD *)(v10 - 24);
            *(void *)(v9 + 8) = *(void *)(v10 - 16);
            *(void *)(v9 + 16) = *(void *)(v10 - 8);
          }
          a4 = 0;
          *(float *)(v10 - 24) = v20;
          *(_OWORD *)(v10 - 16) = v39;
        }
        uint64_t v21 = 0;
        long long v22 = *(_OWORD *)(v9 + 8);
        do
        {
          float v23 = *(float *)(v9 + v21 + 24);
          v21 += 24;
        }
        while (v23 > v20);
        unint64_t v24 = v9 + v21;
        BOOL v25 = (float *)a2;
        if (v21 == 24)
        {
          BOOL v25 = (float *)a2;
          do
          {
            if (v24 >= (unint64_t)v25) {
              break;
            }
            float v27 = *(v25 - 6);
            v25 -= 6;
          }
          while (v27 <= v20);
        }
        else
        {
          do
          {
            float v26 = *(v25 - 6);
            v25 -= 6;
          }
          while (v26 <= v20);
        }
        if (v24 >= (unint64_t)v25)
        {
          unint64_t v10 = v9 + v21;
        }
        else
        {
          float v28 = *v25;
          unint64_t v10 = v9 + v21;
          long long v29 = v25;
          do
          {
            *(float *)unint64_t v10 = v28;
            *long long v29 = v23;
            uint64_t v30 = *(void *)(v10 + 8);
            *(void *)(v10 + 8) = *((void *)v29 + 1);
            *((void *)v29 + 1) = v30;
            uint64_t v31 = *(void *)(v10 + 16);
            *(void *)(v10 + 16) = *((void *)v29 + 2);
            *((void *)v29 + 2) = v31;
            do
            {
              float v32 = *(float *)(v10 + 24);
              v10 += 24;
              float v23 = v32;
            }
            while (v32 > v20);
            do
            {
              float v33 = *(v29 - 6);
              v29 -= 6;
              float v28 = v33;
            }
            while (v33 <= v20);
          }
          while (v10 < (unint64_t)v29);
        }
        if (v10 - 24 != v9)
        {
          *(_DWORD *)unint64_t v9 = *(_DWORD *)(v10 - 24);
          *(void *)(v9 + 8) = *(void *)(v10 - 16);
          *(void *)(v9 + 16) = *(void *)(v10 - 8);
        }
        *(float *)(v10 - 24) = v20;
        *(_OWORD *)(v10 - 16) = v22;
        if (v24 >= (unint64_t)v25) {
          break;
        }
LABEL_33:
        CGRect result = std::__introsort<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *,false>(v9, v10 - 24, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v34 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v9, v10 - 24);
      CGRect result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v10, a2);
      if (result) {
        break;
      }
      if (!v34) {
        goto LABEL_33;
      }
    }
    a2 = v10 - 24;
    if (!v34) {
      continue;
    }
    return result;
  }
}

@end