@interface LTMExtractMetadata
+ (BOOL)extractAWBMetadataFromRawMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4;
+ (BOOL)extractCCMFromMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4;
+ (BOOL)extractFromRawMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4;
+ (BOOL)getTileStatsRegion:(id)a3 validBufferRect:(id)a4 toDriverInput:(sRefDriverInputs *)a5;
+ (BOOL)isLocalCCMEnabled:(sRefDriverInputs *)a3;
+ (int)extractAWBMetadataFromMetadata:(id)a3 validBufferRect:(id)a4 toDriverInput:(sRefDriverInputs *)a5;
+ (void)extractRectanglesFrom:(id)a3 validBufferRect:(id)a4 ltmGeometry:(id)a5;
- (BOOL)extractFrom:(id)a3 toDriverInput:(sRefDriverInputs *)a4 ltmGeometry:(id)a5;
- (LTMExtractMetadata)init;
@end

@implementation LTMExtractMetadata

- (LTMExtractMetadata)init
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)LTMExtractMetadata;
  v2 = [(LTMExtractMetadata *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_forceDisableLTMHazeCorrection = 0;
    *(_DWORD *)&v2->_forceDisableLTMFaceBoost = 0;
    *(_OWORD *)&v2->_faceBiasScaler = xmmword_23FF4EB40;
    v4 = v2;
  }
  else
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v3;
}

- (BOOL)extractFrom:(id)a3 toDriverInput:(sRefDriverInputs *)a4 ltmGeometry:(id)a5
{
  v128[20] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v122 = a5;
  v123 = v8;
  v9 = [v8 inMetaData];
  v125 = [v8 validBufferRect];
  v121 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F600]];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F5F8]];
  v120 = (void *)v10;
  if (v121) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v116 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT);
    goto LABEL_117;
  }
  uint64_t v12 = [v121 unsignedIntValue];
  uint64_t v13 = [v120 unsignedIntValue];
  if (!v125
    || ([v125 objectForKeyedSubscript:@"Width"],
        (v14 = objc_claimAutoreleasedReturnValue()) == 0)
    || ([v125 objectForKeyedSubscript:@"Height"],
        v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    v127[0] = @"X";
    v127[1] = @"Y";
    v128[0] = &unk_26F3F22E0;
    v128[1] = &unk_26F3F22E0;
    v127[2] = @"Width";
    v16 = [NSNumber numberWithUnsignedInt:v12];
    v128[2] = v16;
    v127[3] = @"Height";
    v17 = [NSNumber numberWithUnsignedInt:v13];
    v128[3] = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:4];

    v125 = (void *)v18;
  }
  [v122 inputTextureSize];
  if (v19 == 0.0 || ([v122 inputTextureSize], v20 == 0.0))
  {
    v116 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT);
LABEL_117:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_109:
    BOOL v112 = 0;
    goto LABEL_103;
  }
  v21 = [v125 objectForKeyedSubscript:@"Width"];
  [v21 floatValue];
  float v23 = v22;
  v24 = [v125 objectForKeyedSubscript:@"X"];
  [v24 floatValue];
  float v26 = v25;
  [v122 inputTextureSize];
  double v28 = (float)(v23 + (float)(v26 * 2.0)) / v27;
  *(float *)&double v28 = v28;
  [v122 setInputTextureDownsampleRatio:v28];

  +[LTMExtractMetadata extractRectanglesFrom:v9 validBufferRect:v125 ltmGeometry:v122];
  a4->faceInfo.numFaces = 0;
  a4->faceInfo.rectArray[8] = 0u;
  a4->faceInfo.rectArray[9] = 0u;
  a4->faceInfo.rectArray[6] = 0u;
  a4->faceInfo.rectArray[7] = 0u;
  a4->faceInfo.rectArray[4] = 0u;
  a4->faceInfo.rectArray[5] = 0u;
  a4->faceInfo.rectArray[2] = 0u;
  a4->faceInfo.rectArray[3] = 0u;
  a4->faceInfo.rectArray[0] = 0u;
  a4->faceInfo.rectArray[1] = 0u;
  v29 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F440]];
  v124 = v29;
  if (v29
    && ([v29 objectForKeyedSubscript:*MEMORY[0x263F2F288]],
        (v30 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v119 = v30;
    v31 = [v30 objectForKeyedSubscript:*MEMORY[0x263F2F290]];
    v32 = v31;
    if (v31 && [v31 count])
    {
      unsigned int v33 = [v32 count];
      uint64_t v34 = v33 >= 0xA ? 10 : v33;
      a4->faceInfo.numFaces = v34;
      if (v34)
      {
        uint64_t v35 = 0;
        uint64_t v36 = *MEMORY[0x263F2F620];
        double v37 = (double)v12;
        double v38 = (double)v13;
        p_double height = &a4->faceInfo.rectArray[0].height;
        while (1)
        {
          v40 = [v32 objectAtIndexedSubscript:v35];
          v41 = v40;
          if (!v40)
          {
            v114 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_108;
          }
          CFDictionaryRef v42 = [v40 objectForKeyedSubscript:v36];
          CFDictionaryRef v43 = v42;
          if (!v42 || !CGRectMakeWithDictionaryRepresentation(v42, &rect)) {
            break;
          }
          int v44 = (int)(rect.origin.y * v38);
          double height = rect.size.height;
          unsigned int v46 = (rect.size.width * v37);
          *(p_height - 3) = (int)(rect.origin.x * v37);
          *(p_height - 2) = v44;
          *(p_height - 1) = v46;
          unsigned int *p_height = (height * v38);

          ++v35;
          p_height += 4;
          if (v34 == v35) {
            goto LABEL_24;
          }
        }
        v115 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_108:
        goto LABEL_109;
      }
    }
LABEL_24:

    v47 = v119;
  }
  else
  {
    v47 = 0;
  }
  a4->forceDisableFaceBoost = self->_forceDisableLTMFaceBoost;
  v48 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F6E8]];
  v49 = v48;
  if (!v48) {
    goto LABEL_119;
  }
  a4->gainDigi = [v48 intValue];
  v50 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F558]];

  if (!v50) {
    goto LABEL_119;
  }
  a4->luxLevel = (float)(int)[v50 intValue];
  v51 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F2C0]];

  if (!v51) {
    goto LABEL_119;
  }
  a4->gainAnal.v16 = [v51 unsignedShortValue];
  v52 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F468]];

  if (!v52) {
    goto LABEL_119;
  }
  [v52 doubleValue];
  a4->exposureTime = (v53 * 1000000.0);
  v54 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F700]];

  if (!v54) {
    goto LABEL_119;
  }
  v55 = v54;
  a4->gainDigiSensor.v16 = [v54 unsignedShortValue];
  v56 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F638]];
  if ([v56 BOOLValue])
  {
  }
  else
  {
    char v57 = [v123 isSIFR];

    if ((v57 & 1) == 0)
    {
      a4->bracketingMode = 15;
      v58 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F3D0]];

      if (v58)
      {
        [v58 floatValue];
        BOOL v61 = 0;
        unsigned int v60 = vcvts_n_u32_f32(exp2f(-v64), 8uLL);
      }
      else
      {
        BOOL v61 = 0;
        unsigned int v60 = 256;
      }
      goto LABEL_40;
    }
  }
  a4->bracketingMode = 15;
  v58 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F630]];

  if (v58)
  {
    [v58 floatValue];
    unsigned int v60 = vcvts_n_u32_f32(exp2f(-v59), 8uLL);
    BOOL v61 = 1;
LABEL_40:
    int v63 = 0;
    a4->bracketingExpRatio = v60;
    v62 = v58;
    goto LABEL_41;
  }
  v62 = 0;
  BOOL v61 = 1;
  int v63 = 1;
LABEL_41:
  a4->isSIFRFrame = v61;
  v65 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F4F0]];
  a4->HROn = [v65 BOOLValue];

  if (a4->HROn && !self->_forceDisableHR)
  {
    v67 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F4F8]];

    if (!v67)
    {
LABEL_119:
      v118 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_109;
    }
    unsigned __int16 v66 = [v67 unsignedShortValue];
    v62 = v67;
  }
  else
  {
    unsigned __int16 v66 = 4096;
  }
  a4->hrGainDownRatio = v66;
  v68 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F460]];

  if (!v68) {
    goto LABEL_119;
  }
  [v68 floatValue];
  float v70 = v69;
  if (v61)
  {
    v71 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F630]];
    [v71 floatValue];
    float v73 = v72;

    float v70 = v70 - v73;
  }
  v74 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F3D0]];

  if (v74)
  {
    [v74 floatValue];
    float v70 = v70 - v75;
  }
  a4->expBias = vcvts_n_s32_f32(exp2f(v70), 8uLL);
  v76 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F618]];

  v77 = v76;
  if (v76)
  {
    [v76 floatValue];
    a4->realizedExpBias = vcvts_n_s32_f32(v78, 8uLL);
  }
  else
  {
    int v63 = 1;
  }
  v79 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F470]];

  v80 = v79;
  if (v79)
  {
    [v79 floatValue];
    a4->ev0Ratio = vcvts_n_s32_f32(v81, 8uLL);
  }
  else
  {
    int v63 = 1;
  }
  v82 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  if ([v82 isEqual:*MEMORY[0x263F2EF18]])
  {
    unsigned __int8 v83 = 2;
  }
  else if ([v82 isEqual:*MEMORY[0x263F2EF20]])
  {
    unsigned __int8 v83 = 2;
  }
  else
  {
    unsigned __int8 v83 = 0;
  }
  a4->channel = v83;
  v84 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F4E0]];
  a4->flashStatus = [v84 BOOLValue];

  a4->ltmProcMode = [v123 digitalFlash];
  v85 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F498]];

  v86 = v85;
  if (v85)
  {
    [v85 floatValue];
    a4->faceExpRatioFiltered = v87;
  }
  else
  {
    int v63 = 1;
  }
  if (self->_forceDisableLTMFaceExposureRatio) {
    a4->faceExpRatioFiltered = 1.0;
  }
  if (v63
    && !+[LTMExtractMetadata extractFromRawMetadata:v9 toDriverInput:a4])
  {
    v117 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_109;
  }
  +[LTMExtractMetadata extractCCMFromMetadata:v9 toDriverInput:a4];
  BOOL v88 = +[LTMExtractMetadata isLocalCCMEnabled:a4];
  a4->useSpatialCCM = v88;
  if (v88
    && +[LTMExtractMetadata extractAWBMetadataFromMetadata:v9 validBufferRect:v125 toDriverInput:a4])
  {
    a4->useSpatialCCM = 0;
  }
  a4->overflowDGain = 256;
  a4->hdrRatio = 256;
  a4->panoExpRatio = 0;
  BOOL v89 = 1;
  a4->bLTMSingleFrameMode = 1;
  a4->isHLGMode = 0;
  a4->gammaCurve = 0;
  a4->useHighlightCompression = 0;
  a4->highlightCompressionGain = 1.0;
  if (!v61)
  {
    v90 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F170]];
    [v90 floatValue];
    BOOL v89 = v91 < -1.0;
  }
  if ([v123 isAdaptiveHighlightCompressionEnabled])
  {
    v92 = v123;
    if (!a4->HROn)
    {
      a4->useAdaptiveHighlightCompression = 1;
      goto LABEL_93;
    }
    BOOL forceDisableHR = self->_forceDisableHR;
    a4->useAdaptiveHighlightCompression = 1;
  }
  else
  {
    v92 = v123;
    if (![v123 isHighlightCompressionEnabled] || !a4->HROn) {
      goto LABEL_93;
    }
    BOOL forceDisableHR = self->_forceDisableHR;
    char v94 = self->_forceDisableHR || v89;
    if ((v94 & 1) == 0)
    {
      if (self->_forceHighlightCompressionForEveryFrame) {
        goto LABEL_86;
      }
      goto LABEL_93;
    }
  }
  if (!forceDisableHR)
  {
LABEL_86:
    AuxCompute_CalcExposureRatio(a4);
    if (a4->useAdaptiveHighlightCompression)
    {
      float v96 = v95;
      v92 = v123;
      [v123 adaptiveHCSlope];
      float v98 = 1.8;
      if (!v89) {
        float v98 = 1.0;
      }
      float v99 = fmaxf(v98, fminf(v96 / v97, 4.0));
      if (v99 > 1.0)
      {
        a4->useHighlightCompression = 1;
        a4->highlightCompressionGain = v99;
      }
    }
    else
    {
      a4->useHighlightCompression = 1;
      a4->highlightCompressionGain = 2.0;
      v92 = v123;
    }
  }
LABEL_93:
  a4->hardIspDGain = 1.0;
  float v100 = (float)a4->gainDigi * 0.0039062;
  a4->softIspDGain = v100;
  [v92 ispDGainThreshold];
  if (v100 > v101)
  {
    [v123 ispDGainThreshold];
    a4->hardIspDGain = (float)((float)a4->gainDigi * 0.0039062) / v102;
    a4->softIspDGain = v102;
  }
  AuxCompute_CalcExposureRatio(a4);
  if ((float)(v103 / a4->hardIspDGain) > 80.0)
  {
    float v104 = v103 / 80.0;
    float v105 = (float)((float)a4->gainDigi * 0.0039062) / v104;
    a4->hardIspDGain = v104;
    a4->softIspDGain = v105;
  }
  a4->LTMHazeCorrectionOff = self->_forceDisableLTMHazeCorrection;
  a4->useBt709 = self->_forceUseBt709;
  if ([v123 doAdaptiveFaceBiasScaler])
  {
    LOWORD(v106) = a4->gainAnal.v16;
    LOWORD(v107) = a4->gainDigiSensor.v16;
    float v108 = (float)((float)((float)v106 * 0.0039062) * (float)((float)v107 * 0.0039062))
         * (float)((float)a4->gainDigi * 0.0039062);
    float faceBiasThreshold = self->_faceBiasThreshold;
    float faceBiasScaler = self->_faceBiasScaler;
    if (v108 < faceBiasThreshold)
    {
      float faceBiasThresholdMin = self->_faceBiasThresholdMin;
      if (v108 <= faceBiasThresholdMin) {
        float faceBiasScaler = self->_faceBiasScalerMin;
      }
      else {
        float faceBiasScaler = self->_faceBiasScalerMin
      }
                       + (float)((float)((float)(faceBiasScaler - self->_faceBiasScalerMin)
                                       / (float)(faceBiasThreshold - faceBiasThresholdMin))
                               * (float)(v108 - faceBiasThresholdMin));
    }
  }
  else
  {
    float faceBiasScaler = 0.08;
  }
  *(float *)&a4[1].flashMixPercentage[132] = faceBiasScaler;
  a4->useHazeCorrection = 0;

  BOOL v112 = 1;
LABEL_103:

  return v112;
}

+ (BOOL)isLocalCCMEnabled:(sRefDriverInputs *)a3
{
  return a3->channel == 2 && a3->faceInfo.numFaces != 0;
}

+ (void)extractRectanglesFrom:(id)a3 validBufferRect:(id)a4 ltmGeometry:(id)a5
{
  id v75 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 objectForKeyedSubscript:@"X"];
  unsigned int v10 = [v9 unsignedIntValue];
  [v8 inputTextureDownsampleRatio];
  float v12 = v11;
  uint64_t v13 = [v7 objectForKeyedSubscript:@"Y"];
  unsigned int v14 = [v13 unsignedIntValue];
  [v8 inputTextureDownsampleRatio];
  float v16 = v15;
  v17 = [v7 objectForKeyedSubscript:@"Width"];
  unsigned int v18 = [v17 unsignedIntValue];
  [v8 inputTextureDownsampleRatio];
  float v20 = v19;
  v21 = [v7 objectForKeyedSubscript:@"Height"];
  unsigned int v22 = [v21 unsignedIntValue];
  [v8 inputTextureDownsampleRatio];
  float v24 = v23;

  long long v76 = *MEMORY[0x263F001A0];
  long long v77 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  LODWORD(v21) = FigCFDictionaryGetCGRectIfPresent();
  if (v21 & FigCFDictionaryGetCGRectIfPresent())
  {
    [v8 setDeepZoomOrigin:v76];
    [v8 inputTextureDownsampleRatio];
    float v25 = *((double *)&v77 + 1);
    float v26 = v25 / *((double *)&v77 + 1);
    *(float *)&double v28 = v27 / v26;
    [v8 setInputTextureDownsampleRatio:v28];
  }
  else
  {
    objc_msgSend(v8, "setDeepZoomOrigin:", 0.0, 0.0);
  }
  CFDictionaryRef v29 = [v75 objectForKeyedSubscript:*MEMORY[0x263F2EFB8]];
  CFDictionaryRef v30 = v29;
  double v31 = (float)((float)v10 / v12);
  double v32 = (float)((float)v14 / v16);
  double v33 = (float)((float)v18 / v20);
  double v34 = (float)((float)v22 / v24);
  double v74 = v31;
  double v35 = v32;
  double v36 = v33;
  double v37 = v34;
  if (v29)
  {
    double v35 = v32;
    double v36 = v33;
    double v37 = v34;
    if (CGRectMakeWithDictionaryRepresentation(v29, &rect))
    {
      double v38 = [v75 objectForKeyedSubscript:*MEMORY[0x263F2F600]];
      unsigned int v39 = [v38 unsignedIntValue];

      v40 = [v75 objectForKeyedSubscript:*MEMORY[0x263F2F5F8]];
      unsigned int v41 = [v40 unsignedIntValue];

      double x = rect.origin.x;
      [v8 deepZoomOrigin];
      double v72 = v42;
      [v8 inputTextureDownsampleRatio];
      float v44 = v43;
      double y = rect.origin.y;
      [v8 deepZoomOrigin];
      double v46 = v45;
      [v8 inputTextureDownsampleRatio];
      float v48 = v47;
      double width = rect.size.width;
      [v8 inputTextureDownsampleRatio];
      float v50 = v49;
      double height = rect.size.height;
      [v8 inputTextureDownsampleRatio];
      double v31 = round(-(v72 - x * (double)v39) / v44);
      double v35 = round(-(v46 - y * (double)v41) / v48);
      double v36 = round(width * (double)v39 / v50);
      double v37 = round(height * (double)v41 / v52);
    }
  }
  [v8 inputTextureSize];
  double v54 = v53;
  [v8 inputTextureSize];
  double v56 = v54 / v55;
  *(float *)&double v55 = v36 / v37;
  if (v56 <= *(float *)&v55)
  {
    double v57 = v37 * v56;
    double v58 = v37;
  }
  else
  {
    double v57 = v36;
    double v58 = v36 / v56;
  }
  if (v57 >= 16.0) {
    double v59 = v57;
  }
  else {
    double v59 = 16.0;
  }
  if (v58 >= 16.0) {
    double v60 = v58;
  }
  else {
    double v60 = 16.0;
  }
  BOOL v61 = v37 - v60 > 2.0;
  if (v36 - v59 > 2.0) {
    BOOL v61 = 1;
  }
  if (v57 < 16.0) {
    BOOL v61 = 1;
  }
  if (v58 < 16.0) {
    BOOL v61 = 1;
  }
  if (v61) {
    double v62 = v59;
  }
  else {
    double v62 = v36;
  }
  if (v61) {
    double v63 = v60;
  }
  else {
    double v63 = v37;
  }
  double v64 = round(v62 * 0.5);
  double v65 = round(v63 * 0.5);
  double v66 = v64 + v64;
  double v67 = v65 + v65;
  double v68 = round((v31 + (v36 - (v64 + v64)) * 0.5) * 0.5);
  double v69 = round((v35 + (v37 - (v65 + v65)) * 0.5) * 0.5);
  objc_msgSend(v8, "setCropRect:sourceRect:", v68 + v68, v69 + v69, v66, v67, v74, v32, v33, v34);
}

+ (int)extractAWBMetadataFromMetadata:(id)a3 validBufferRect:(id)a4 toDriverInput:(sRefDriverInputs *)a5
{
  id v7 = a3;
  id v44 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"SpatialCCMOutputMetadata"];
  if (!+[LTMExtractMetadata getTileStatsRegion:v7 validBufferRect:v44 toDriverInput:a5])goto LABEL_28; {
  v9 = (uint64_t *)MEMORY[0x263F2F2E0];
  }
  if (!v8)
  {
    unsigned int v18 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F328]];
    v21 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F320]];
    uint64_t v23 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F310]];
    float v24 = (void *)v23;
    if (v18) {
      BOOL v25 = v21 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (v25 || v23 == 0)
    {
      a5->fdAWBChistMixFactor = 0;
      float v27 = [v7 objectForKeyedSubscript:*v9];
      *(unsigned __int16 *)((char *)&a5->awbGains.b.v16 + 1) = [v27 unsignedShortValue];

      double v28 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];
      *(unsigned __int16 *)((char *)&a5->awbGainsSkinOnly.gb.v16 + 1) = [v28 unsignedShortValue];
    }
    else
    {
      a5->fdAWBChistMixFactor = [v18 unsignedIntValue];
      *(unsigned __int16 *)((char *)&a5->awbGains.b.v16 + 1) = [v21 unsignedShortValue];
      *(unsigned __int16 *)((char *)&a5->awbGainsSkinOnly.gb.v16 + 1) = [v24 unsignedShortValue];
    }

    goto LABEL_20;
  }
  unsigned int v10 = [v8 objectForKeyedSubscript:@"FdAWBChistMixFactor"];
  float v11 = v10;
  if (!v10) {
    goto LABEL_28;
  }
  a5->fdAWBChistMixFactor = [v10 intValue];
  float v12 = [v8 objectForKeyedSubscript:@"AwbColorspace"];

  if (!v12
    || (a5->awbColorspace = [v12 unsignedCharValue],
        [v8 objectForKeyedSubscript:@"IsLEDMainFlashforAWB"],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
LABEL_28:
    unsigned int v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    CFDictionaryRef v30 = v44;
LABEL_34:
    int v39 = -1;
    goto LABEL_27;
  }
  a5->isLEDMainFlashforAWB = [v13 BOOLValue];
  unsigned int v14 = [v8 objectForKeyedSubscript:@"AwbGainsSkinOnly"];
  float v15 = v14;
  if (!v14) {
    goto LABEL_31;
  }
  float v16 = [v14 objectAtIndexedSubscript:0];
  *(unsigned __int16 *)((char *)&a5->awbGains.b.v16 + 1) = [v16 intValue];

  v17 = [v15 objectAtIndexedSubscript:3];
  *(unsigned __int16 *)((char *)&a5->awbGainsSkinOnly.gb.v16 + 1) = [v17 intValue];

  unsigned int v18 = [v8 objectForKeyedSubscript:@"AwbGainsFlashProj"];

  if (!v18)
  {
LABEL_31:
    double v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    CFDictionaryRef v30 = v44;
    goto LABEL_34;
  }
  float v19 = [v18 objectAtIndexedSubscript:0];
  *(unsigned __int16 *)((char *)&a5->awbGainsSkinOnly.b.v16 + 1) = [v19 intValue];

  float v20 = [v18 objectAtIndexedSubscript:3];
  *(unsigned __int16 *)((char *)&a5->awbGainsFlashProj.gb.v16 + 1) = [v20 intValue];

  v21 = [v8 objectForKeyedSubscript:@"FlashProjMixWeighting"];

  if (!v21)
  {
    float v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    CFDictionaryRef v30 = v44;
    goto LABEL_34;
  }
  [v21 floatValue];
  a5->flashProjMixWeighting = v22;
LABEL_20:

  uint64_t v29 = *v9;
  CFDictionaryRef v30 = v44;
  double v31 = [v7 objectForKeyedSubscript:v29];
  *(_WORD *)(&a5->isLEDMainFlashforAWB + 1) = [v31 unsignedShortValue];

  double v32 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];
  *(unsigned __int16 *)((char *)&a5->awbGains.gb.v16 + 1) = [v32 unsignedShortValue];

  bzero(a5->flashMixPercentage, 0x400uLL);
  double v33 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F4B8]];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = [v34 bytes];
    uint64_t v36 = 0;
    flashMixPercentage = a5->flashMixPercentage;
    do
    {
      for (uint64_t i = 0; i != 16; ++i)
        flashMixPercentage[i] = *(_WORD *)(v35 + i * 2);
      ++v36;
      flashMixPercentage += 16;
      v35 += 64;
    }
    while (v36 != 16);
  }
  int v39 = 0;
LABEL_27:

  return v39;
}

+ (BOOL)getTileStatsRegion:(id)a3 validBufferRect:(id)a4 toDriverInput:(sRefDriverInputs *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v48 = v8;
    uint64_t v9 = [v7 objectForKeyedSubscript:@"SpatialCCMOutputMetadata"];
    unsigned int v10 = [v8 objectForKeyedSubscript:@"Width"];
    int v50 = [v10 intValue];

    float v11 = [v8 objectForKeyedSubscript:@"Height"];
    int v49 = [v11 intValue];

    float v12 = [v8 objectForKeyedSubscript:@"X"];
    int v13 = [v12 intValue];

    unsigned int v14 = [v8 objectForKeyedSubscript:@"Y"];
    int v15 = [v14 intValue];

    uint64_t v16 = *MEMORY[0x263F2F600];
    v17 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F600]];
    float v47 = (void *)v9;
    unsigned int width = [v17 unsignedIntValue];

    uint64_t v19 = *MEMORY[0x263F2F5F8];
    float v20 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F5F8]];
    unsigned int height = [v20 unsignedIntValue];

    CFDictionaryRef v22 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F6D8]];
    CFDictionaryRef v23 = v22;
    if (v22 && CGRectMakeWithDictionaryRepresentation(v22, &rect))
    {
      unsigned int width = rect.size.width;
      unsigned int height = rect.size.height;
    }
    CFDictionaryRef v24 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2EFB8]];
    CFDictionaryRef v25 = v24;
    if (v24 && CGRectMakeWithDictionaryRepresentation(v24, &v51))
    {
      float v26 = [v7 objectForKeyedSubscript:v16];
      unsigned int v27 = [v26 unsignedIntValue];

      double v28 = [v7 objectForKeyedSubscript:v19];
      LODWORD(v26) = [v28 unsignedIntValue];

      int v49 = (int)(v51.size.height * (double)v26);
      int v50 = (int)(v51.size.width * (double)v27);
      int v13 = (int)(v51.origin.x * (double)v27);
      int v15 = (int)(v51.origin.y * (double)v26);
    }
    float v29 = sqrtf((float)((float)height * (float)width) / 199580.0);
    if (v29 <= 8.0 || v29 > 12.0)
    {
      if (v29 <= 12.0) {
        int v31 = 8;
      }
      else {
        int v31 = 16;
      }
    }
    else
    {
      int v31 = 12;
    }
    double v32 = (double)(v13 / v31);
    double v33 = (double)(v15 / v31);
    double v34 = (double)(v50 / v31);
    double v35 = (double)(v49 / v31);
    double v36 = v34 * 0.975 * 0.03125;
    if (v36 < 4.0) {
      double v36 = 4.0;
    }
    double v37 = v35 * 0.975 * 0.03125;
    if (v37 < 4.0) {
      double v37 = 4.0;
    }
    unsigned int v38 = v37;
    signed int v39 = (32 * v36 + 96) & 0x1FFF80;
    double v40 = v32 + floor((v34 - (double)v39) * 0.25) * 2.0;
    if (v40 < 0.0) {
      double v40 = 0.0;
    }
    double v41 = (double)v31;
    a5->tileStatsRegionInRaw.double x = (int)(v40 * (double)v31);
    double v42 = (double)((32 * v38 + 96) & 0x1FFF80);
    double v43 = v33 + floor((v35 - v42) * 0.25) * 2.0;
    if (v43 < 0.0) {
      double v43 = 0.0;
    }
    a5->tileStatsRegionInRaw.double y = (int)(v43 * v41);
    double v44 = v32 + v34;
    if (v44 > (double)v39) {
      double v44 = (double)v39;
    }
    a5->tileStatsRegionInRaw.unsigned int width = (v44 * v41);
    double v45 = v33 + v35;
    if (v33 + v35 > v42) {
      double v45 = (double)((32 * v38 + 96) & 0x1FFF80);
    }
    a5->tileStatsRegionInRaw.unsigned int height = (v45 * v41);

    id v8 = v48;
  }

  return v7 != 0;
}

+ (BOOL)extractCCMFromMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F3F0]];
  id v7 = v6;
  if (v6
    && (id v8 = v6, v9 = [v8 bytes], v10 = objc_msgSend(v8, "length"), v9)
    && v10 == 36)
  {
    for (uint64_t i = 0; i != 9; ++i)
      a4->ccm.coeff[i].int64x2_t v16 = vcvts_n_s32_f32(*(float *)(v9 + 4 * i), 0xCuLL);
    BOOL v12 = 1;
  }
  else
  {
    uint64_t v13 = 0;
    int64x2_t v14 = (int64x2_t)xmmword_23FF4E300;
    uint64x2_t v15 = (uint64x2_t)vdupq_n_s64(9uLL);
    int64x2_t v16 = vdupq_n_s64(2uLL);
    do
    {
      if (vmovn_s64((int64x2_t)vcgtq_u64(v15, (uint64x2_t)v14)).u8[0]) {
        a4->ccm.coeff[v13].int64x2_t v16 = (v13 / 3u == v13 % 3u) << 12;
      }
      if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(9uLL), *(uint64x2_t *)&v14)).i32[1]) {
        a4->ccm.coeff[v13 + 1].int64x2_t v16 = ((v13 | 1u) / 3 == (v13 | 1u) % 3) << 12;
      }
      v13 += 2;
      int64x2_t v14 = vaddq_s64(v14, v16);
    }
    while (v13 != 10);
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)extractFromRawMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4
{
  return 0;
}

+ (BOOL)extractAWBMetadataFromRawMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4
{
  return 0;
}

@end