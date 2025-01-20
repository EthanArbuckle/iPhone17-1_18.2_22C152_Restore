@interface CIDualRedEyeRepairTuning
+ (id)defaultRepairParameters;
+ (id)defaultSessionParameters;
+ (id)repairParametersForTuning:(unint64_t)a3;
+ (id)sessionParametersForTuning:(unint64_t)a3;
- (CIDualRedEyeRepairTuning)initWithTuning:(unint64_t)a3;
- (NSDictionary)repairTuning;
- (NSDictionary)sessionTuning;
- (unint64_t)tuningFromCameraModel:(id)a3 portType:(id)a4;
- (void)dealloc;
- (void)setRepairTuning:(id)a3;
- (void)setSessionTuning:(id)a3;
- (void)setTuningParametersByPortType:(id)a3 withCameraMetadata:(id)a4;
- (void)updateWithCaptureSetup:(id)a3 portType:(id)a4;
@end

@implementation CIDualRedEyeRepairTuning

- (CIDualRedEyeRepairTuning)initWithTuning:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CIDualRedEyeRepairTuning;
  v4 = [(CIDualRedEyeRepairTuning *)&v6 init];
  if (v4)
  {
    [(CIDualRedEyeRepairTuning *)v4 setRepairTuning:+[CIDualRedEyeRepairTuning repairParametersForTuning:a3]];
    [(CIDualRedEyeRepairTuning *)v4 setSessionTuning:+[CIDualRedEyeRepairTuning sessionParametersForTuning:a3]];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CIDualRedEyeRepairTuning;
  [(CIDualRedEyeRepairTuning *)&v3 dealloc];
}

- (unint64_t)tuningFromCameraModel:(id)a3 portType:(id)a4
{
  if ([a3 isEqualToString:@"N841"]) {
    return 4;
  }
  if (([a3 isEqualToString:@"D321"] & 1) != 0
    || ([a3 isEqualToString:@"D331"] & 1) != 0
    || [a3 isEqualToString:@"D331p"])
  {
    if ([a4 isEqualToString:@"PortTypeBackTelephoto"]) {
      return 3;
    }
    else {
      return 1;
    }
  }
  else if (([a3 isEqualToString:@"D421"] & 1) != 0 {
         || ([a3 isEqualToString:@"D431"] & 1) != 0
  }
         || [a3 isEqualToString:@"N104"])
  {
    return 5;
  }
  else
  {
    return 0;
  }
}

- (void)setTuningParametersByPortType:(id)a3 withCameraMetadata:(id)a4
{
  uint64_t v7 = [a4 objectForKey:@"Tuning"];
  uint64_t v8 = [a4 objectForKey:@"DeviceModelName"];
  uint64_t v9 = [a4 objectForKeyedSubscript:@"DeviceModelName"];
  uint64_t v10 = [a4 objectForKeyedSubscript:@"PortType"];
  if (v7)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"Tuning"), "unsignedIntegerValue");
    if (v8 == 999) {
      return;
    }
  }
  else if (v8)
  {
    uint64_t v8 = [(CIDualRedEyeRepairTuning *)self tuningFromCameraModel:v9 portType:v10];
  }
  [(CIDualRedEyeRepairTuning *)self setRepairTuning:+[CIDualRedEyeRepairTuning repairParametersForTuning:v8]];
  [(CIDualRedEyeRepairTuning *)self setSessionTuning:+[CIDualRedEyeRepairTuning sessionParametersForTuning:v8]];
  if (a3
    || (a3 = (id)[a4 objectForKeyedSubscript:@"TuningParametersByPortType"]) != 0
    || (a3 = (id)[a4 objectForKeyedSubscript:@"RedEye"]) != 0)
  {
    [(CIDualRedEyeRepairTuning *)self updateWithCaptureSetup:a3 portType:v10];
  }
}

+ (id)defaultSessionParameters
{
  v4[15] = *MEMORY[0x1E4F143B8];
  {
    v3[0] = @"kMinPrimaryDimension";
    v3[1] = @"kMinLandmarkConfidenceThreshold";
    v4[0] = &unk_1EE4AA7F0;
    v4[1] = &unk_1EE4A8720;
    v3[2] = @"kMaxFaceJunkinessThreshold";
    v3[3] = @"kMinLandmarkArea";
    v4[2] = &unk_1EE4A8730;
    v4[3] = &unk_1EE4AA808;
    v3[4] = @"kMinIsotropy";
    v3[5] = @"kMaxFaceCount";
    v4[4] = &unk_1EE4A8740;
    v4[5] = &unk_1EE4AA820;
    v3[6] = @"kSessionTuningOutsetROILong";
    v3[7] = @"kSessionTuningOutsetROIShort";
    v4[6] = &unk_1EE4A8740;
    v4[7] = &unk_1EE4A8750;
    v3[8] = @"kRenderFullRect";
    v3[9] = @"kMinLaplacianVariance";
    v4[8] = MEMORY[0x1E4F1CC38];
    v4[9] = &unk_1EE4A8760;
    v3[10] = @"kRegionOutset";
    v3[11] = @"kUseFaceSegmentation";
    v4[10] = &unk_1EE4AA838;
    v4[11] = MEMORY[0x1E4F1CC28];
    v3[12] = @"kUseFaceSegmentationMask";
    v3[13] = @"kForceFaceSegmentationPupils";
    v4[12] = MEMORY[0x1E4F1CC28];
    v4[13] = MEMORY[0x1E4F1CC28];
    v3[14] = @"kAutoFlashOverrideSNRThreshold";
    v4[14] = &unk_1EE4AA838;
    +[CIDualRedEyeRepairTuning defaultSessionParameters]::parms = (uint64_t)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:15];
  }
  return (id)+[CIDualRedEyeRepairTuning defaultSessionParameters]::parms;
}

+ (id)defaultRepairParameters
{
  {
    +[CIDualRedEyeRepairTuning defaultRepairParameters]::parms = &unk_1EE4AB180;
  }
  return (id)+[CIDualRedEyeRepairTuning defaultRepairParameters]::parms;
}

+ (id)repairParametersForTuning:(unint64_t)a3
{
  id v4 = (id)objc_msgSend(+[CIDualRedEyeRepairTuning defaultRepairParameters](CIDualRedEyeRepairTuning, "defaultRepairParameters"), "mutableCopy");
  switch(a3)
  {
    case 1uLL:
      if (CI_LOG_DUALRED())
      {
        v5 = ci_logger_api();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.4(v5, v6, v7, v8, v9, v10, v11, v12);
        }
      }
      return v4;
    case 2uLL:
      if (CI_LOG_DUALRED())
      {
        v21 = ci_logger_api();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.5(v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }
      return v4;
    case 3uLL:
      if (CI_LOG_DUALRED())
      {
        v29 = ci_logger_api();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.6(v29, v30, v31, v32, v33, v34, v35, v36);
        }
      }
      [v4 setObject:&unk_1EE4A88D0 forKeyedSubscript:@"inputCenterSpecRad"];
      [v4 setObject:&unk_1EE4AA880 forKeyedSubscript:@"inputCentroidGamma"];
      [v4 setObject:&unk_1EE4A87D0 forKeyedSubscript:@"inputCentroidRadius"];
      [v4 setObject:&unk_1EE4A8770 forKeyedSubscript:@"inputClosingDilation"];
      [v4 setObject:&unk_1EE4A8740 forKeyedSubscript:@"inputClosingErosion"];
      [v4 setObject:&unk_1EE4A8820 forKeyedSubscript:@"inputDetectRed"];
      [v4 setObject:&unk_1EE4A8810 forKeyedSubscript:@"inputDetectWhite"];
      [v4 setObject:&unk_1EE4A87D0 forKeyedSubscript:@"inputFSmooth"];
      [v4 setObject:&unk_1EE4A8770 forKeyedSubscript:@"inputGlintThreshold"];
      [v4 setObject:&unk_1EE4A88E0 forKeyedSubscript:@"inputIntersect"];
      [v4 setObject:&unk_1EE4A88F0 forKeyedSubscript:@"inputMaxInterDispersion"];
      [v4 setObject:&unk_1EE4A8750 forKeyedSubscript:@"inputRadiusRepair"];
      [v4 setObject:&unk_1EE4A8900 forKeyedSubscript:@"inputRefilterRange"];
      [v4 setObject:&unk_1EE4A8910 forKeyedSubscript:@"inputRefilterSpace"];
      [v4 setObject:&unk_1EE4A87D0 forKeyedSubscript:@"inputRepairChroma"];
      [v4 setObject:&unk_1EE4A87D0 forKeyedSubscript:@"inputRepairDarken"];
      [v4 setObject:&unk_1EE4A8790 forKeyedSubscript:@"inputRepairDither"];
      [v4 setObject:&unk_1EE4A8920 forKeyedSubscript:@"inputScale"];
      [v4 setObject:&unk_1EE4A8740 forKeyedSubscript:@"inputSkinThreshold"];
      [v4 setObject:&unk_1EE4A87F0 forKeyedSubscript:@"inputSpecArea"];
      [v4 setObject:&unk_1EE4A8930 forKeyedSubscript:@"inputSpecAreaScale"];
      [v4 setObject:&unk_1EE4AA898 forKeyedSubscript:@"inputSpecIntensity"];
      [v4 setObject:&unk_1EE4A8720 forKeyedSubscript:@"inputSpecMax"];
      [v4 setObject:&unk_1EE4A8890 forKeyedSubscript:@"inputSpecMin"];
      [v4 setObject:&unk_1EE4A8770 forKeyedSubscript:@"inputSpecular"];
      [v4 setObject:&unk_1EE4AA8B0 forKeyedSubscript:@"inputTargetClosing"];
      v37 = &unk_1EE4A8940;
      v38 = @"inputWhiteCutoff";
      goto LABEL_24;
    case 4uLL:
      if (CI_LOG_DUALRED())
      {
        v39 = ci_logger_api();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.7(v39, v40, v41, v42, v43, v44, v45, v46);
        }
      }
      [v4 setObject:&unk_1EE4A8720 forKeyedSubscript:@"inputMidSpectrumWhiteOffsetsX"];
      [v4 setObject:&unk_1EE4A8740 forKeyedSubscript:@"inputMidSpectrumWhiteOffsetsY"];
      [v4 setObject:&unk_1EE4A8820 forKeyedSubscript:@"inputCentroidRadiusSmall"];
      [v4 setObject:&unk_1EE4A8840 forKeyedSubscript:@"inputIntersect"];
      [v4 setObject:&unk_1EE4A8950 forKeyedSubscript:@"inputSkinThresholdMed"];
      v37 = &unk_1EE4A8730;
      v38 = @"inputScleraThreshold";
      goto LABEL_24;
    case 5uLL:
      if (CI_LOG_DUALRED())
      {
        v47 = ci_logger_api();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning repairParametersForTuning:](v47, v48, v49, v50, v51, v52, v53, v54);
        }
      }
      [v4 setObject:&unk_1EE4A8810 forKeyedSubscript:@"inputAbortDensityLo"];
      [v4 setObject:&unk_1EE4A8960 forKeyedSubscript:@"inputAbortDensityDiff"];
      [v4 setObject:&unk_1EE4A8970 forKeyedSubscript:@"inputRadiusDensity"];
      [v4 setObject:&unk_1EE4A8770 forKeyedSubscript:@"inputInterPeakMin"];
      [v4 setObject:&unk_1EE4A8770 forKeyedSubscript:@"inputCircularity"];
      [v4 setObject:&unk_1EE4AA850 forKeyedSubscript:@"inputSkinThreshold"];
      [v4 setObject:&unk_1EE4AA850 forKeyedSubscript:@"inputSkinThresholdMed"];
      [v4 setObject:&unk_1EE4A8770 forKeyedSubscript:@"inputMinInterDispersion"];
      [v4 setObject:&unk_1EE4A8980 forKeyedSubscript:@"inputMaxInterDispersion"];
      [v4 setObject:&unk_1EE4A8770 forKeyedSubscript:@"inputMinMaskDiff"];
      [v4 setObject:&unk_1EE4A8990 forKeyedSubscript:@"inputIntersect"];
      [v4 setObject:&unk_1EE4A89A0 forKeyedSubscript:@"inputCentroidRadius"];
      [v4 setObject:&unk_1EE4A8790 forKeyedSubscript:@"inputSearchLong"];
      [v4 setObject:&unk_1EE4A8750 forKeyedSubscript:@"inputSearchShort"];
      [v4 setObject:&unk_1EE4A89B0 forKeyedSubscript:@"inputFlooding"];
      [v4 setObject:&unk_1EE4A8720 forKeyedSubscript:@"inputSpecularCutoff"];
      [v4 setObject:&unk_1EE4A87F0 forKeyedSubscript:@"inputClipMin"];
      [v4 setObject:&unk_1EE4A8740 forKeyedSubscript:@"inputMidSpectrumWhiteOffsetsX"];
      [v4 setObject:&unk_1EE4A8720 forKeyedSubscript:@"inputMidSpectrumWhiteOffsetsY"];
      [v4 setObject:&unk_1EE4A8780 forKeyedSubscript:@"inputSpecIntensity"];
      [v4 setObject:&unk_1EE4A87F0 forKeyedSubscript:@"inputSpecArea"];
      v37 = &unk_1EE4A89C0;
      v38 = @"inputSpecular";
LABEL_24:
      [v4 setObject:v37 forKeyedSubscript:v38];
      break;
    default:
      if (a3 == 999)
      {
        if (CI_LOG_DUALRED())
        {
          v13 = ci_logger_api();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            +[CIDualRedEyeRepairTuning repairParametersForTuning:](v13, v14, v15, v16, v17, v18, v19, v20);
          }
        }
      }
      else if (CI_LOG_DUALRED())
      {
        v56 = ci_logger_api();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning repairParametersForTuning:](v56, v57, v58, v59, v60, v61, v62, v63);
        }
      }
      break;
  }
  return v4;
}

+ (id)sessionParametersForTuning:(unint64_t)a3
{
  id v4 = (id)objc_msgSend(+[CIDualRedEyeRepairTuning defaultSessionParameters](CIDualRedEyeRepairTuning, "defaultSessionParameters"), "mutableCopy");
  v5 = v4;
  switch(a3)
  {
    case 1uLL:
      if (CI_LOG_DUALRED())
      {
        uint64_t v6 = ci_logger_api();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:](v6, v7, v8, v9, v10, v11, v12, v13);
        }
      }
      return v5;
    case 2uLL:
      if (CI_LOG_DUALRED())
      {
        uint64_t v22 = ci_logger_api();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:](v22, v23, v24, v25, v26, v27, v28, v29);
        }
      }
      uint64_t v30 = &unk_1EE4A89D0;
      uint64_t v31 = @"kMinLaplacianVariance";
      goto LABEL_16;
    case 3uLL:
      if (CI_LOG_DUALRED())
      {
        uint64_t v32 = ci_logger_api();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:].cold.4(v32, v33, v34, v35, v36, v37, v38, v39);
        }
      }
      [v5 setObject:&unk_1EE4A89D0 forKeyedSubscript:@"kMinLaplacianVariance"];
      uint64_t v30 = &unk_1EE4A8750;
      uint64_t v31 = @"kRegionOutset";
LABEL_16:
      uint64_t v40 = v5;
      goto LABEL_21;
    case 4uLL:
      if (CI_LOG_DUALRED())
      {
        uint64_t v41 = ci_logger_api();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:].cold.5(v41, v42, v43, v44, v45, v46, v47, v48);
        }
      }
      return v5;
    case 5uLL:
      [v4 setObject:&unk_1EE4AA850 forKeyedSubscript:@"kMaxFaceJunkinessThreshold"];
      [v5 setObject:&unk_1EE4AA838 forKeyedSubscript:@"kMinLaplacianVariance"];
      uint64_t v49 = (void *)MEMORY[0x1E4F1CC38];
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kUseFaceSegmentation"];
      uint64_t v31 = @"kUseFaceSegmentationMask";
      uint64_t v40 = v5;
      uint64_t v30 = v49;
LABEL_21:
      [v40 setObject:v30 forKeyedSubscript:v31];
      break;
    default:
      if (CI_LOG_DUALRED())
      {
        uint64_t v14 = ci_logger_api();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:](v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }
      break;
  }
  return v5;
}

- (void)updateWithCaptureSetup:(id)a3 portType:(id)a4
{
  id v7 = updatedTuningFromSetup([(CIDualRedEyeRepairTuning *)self sessionTuning], (NSDictionary *)a3, (NSString *)a4, &cfstr_K.isa, &cfstr_Session.isa);
  if (v7)
  {
    [(CIDualRedEyeRepairTuning *)self setSessionTuning:v7];
  }
  else if (CI_LOG_DUALRED())
  {
    uint64_t v8 = ci_logger_api();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairTuning updateWithCaptureSetup:portType:]();
    }
  }
  id v9 = updatedTuningFromSetup([(CIDualRedEyeRepairTuning *)self repairTuning], (NSDictionary *)a3, (NSString *)a4, &cfstr_Input.isa, &cfstr_Repair_0.isa);
  if (v9)
  {
    [(CIDualRedEyeRepairTuning *)self setRepairTuning:v9];
  }
  else if (CI_LOG_DUALRED())
  {
    uint64_t v10 = ci_logger_api();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CIDualRedEyeRepairTuning updateWithCaptureSetup:portType:]();
    }
  }
}

- (NSDictionary)repairTuning
{
  return self->repairTuning;
}

- (void)setRepairTuning:(id)a3
{
}

- (NSDictionary)sessionTuning
{
  return self->sessionTuning;
}

- (void)setSessionTuning:(id)a3
{
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithCaptureSetup:portType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(&dword_193671000, v0, OS_LOG_TYPE_ERROR, "%{public}s No CaptureSetup repair tuning for port type %@\n", (uint8_t *)v1, 0x16u);
}

- (void)updateWithCaptureSetup:portType:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(&dword_193671000, v0, OS_LOG_TYPE_ERROR, "%{public}s No CaptureSetup session tuning for port type %@\n", (uint8_t *)v1, 0x16u);
}

@end