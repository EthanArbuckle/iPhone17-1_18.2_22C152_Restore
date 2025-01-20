@interface BWAdaptiveCorrectionPreviewRegistrationTuningParameters
+ (void)initialize;
- (BWAdaptiveCorrectionPreviewRegistrationRegToolBoxConfig)regToolBoxConfig;
- (BWAdaptiveCorrectionPreviewRegistrationTuningParameters)init;
- (BWAdaptiveCorrectionPreviewRegistrationTuningParameters)initWithTuningDictionary:(id)a3;
- (const)adaptiveCorrectionConfigsPtr;
- (double)epipolarWeightFalloffDistance;
- (double)macroDepthWeightFalloffDistance;
- (float)keypointsMinSelectionScore;
- (uint64_t)_setDefaultAdaptiveCorrectionParameters;
- (unsigned)configuredNumKeypoints;
@end

@implementation BWAdaptiveCorrectionPreviewRegistrationTuningParameters

- (BWAdaptiveCorrectionPreviewRegistrationTuningParameters)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWAdaptiveCorrectionPreviewRegistrationTuningParameters;
  v2 = [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_regToolBoxConfig.keypointGridHeight = 0x700000018;
    *(void *)&v2->_regToolBoxConfig.keypointsSearchRadius = 1;
    *(void *)&v2->_keypointsMinSelectionScore = 0x3003FD9999ALL;
    *(_OWORD *)&v2->_epipolarWeightFalloffDistance = xmmword_1A5EFD3F0;
    *(_OWORD *)&v2->_regToolBoxConfig.numPyrLevels = xmmword_1A5EFD3E0;
    -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters _setDefaultAdaptiveCorrectionParameters]((uint64_t)v2);
    v3->_adaptiveCorrectionConfigsPtr = v3->_adaptiveCorrectionConfigs;
  }
  return v3;
}

- (uint64_t)_setDefaultAdaptiveCorrectionParameters
{
  if (result)
  {
    for (uint64_t i = 0; i != 1536; i += 512)
    {
      uint64_t v2 = result + i;
      *(_OWORD *)(v2 + 64) = xmmword_1A5EFD400;
      *(_OWORD *)(v2 + 80) = xmmword_1A5EFD410;
      *(_OWORD *)(v2 + 96) = xmmword_1A5EFD420;
      *(_OWORD *)(v2 + 120) = xmmword_1A5EFD430;
      *(void *)(v2 + 136) = 0x4072C00000000000;
      *(_OWORD *)(v2 + 152) = xmmword_1A5EFD440;
      *(void *)(v2 + 168) = 0x3FB999999999999ALL;
      *(unsigned char *)(v2 + 176) = 1;
      *(void *)(v2 + 184) = 0x3F50624DD2F1A9FCLL;
      if (i) {
        int v3 = 5;
      }
      else {
        int v3 = 10;
      }
      *(_DWORD *)(v2 + 144) = v3;
    }
  }
  return result;
}

+ (void)initialize
{
}

- (BWAdaptiveCorrectionPreviewRegistrationTuningParameters)initWithTuningDictionary:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)BWAdaptiveCorrectionPreviewRegistrationTuningParameters;
  v4 = [(BWAdaptiveCorrectionPreviewRegistrationTuningParameters *)&v27 init];
  objc_super v5 = v4;
  if (v4)
  {
    *(void *)&v4->_regToolBoxConfig.keypointGridHeight = 0x700000018;
    *(void *)&v4->_regToolBoxConfig.keypointsSearchRadius = 1;
    *(void *)&v4->_keypointsMinSelectionScore = 0x3003FD9999ALL;
    *(_OWORD *)&v4->_epipolarWeightFalloffDistance = xmmword_1A5EFD3F0;
    *(_OWORD *)&v4->_regToolBoxConfig.numPyrLevels = xmmword_1A5EFD3E0;
    -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters _setDefaultAdaptiveCorrectionParameters]((uint64_t)v4);
    v5->_regToolBoxConfig.numPyrLevels = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RegTollboxParams"), "objectForKeyedSubscript:", @"numPyrLevels"), "unsignedIntValue");
    v5->_regToolBoxConfig.keypointGridWidth = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RegTollboxParams"), "objectForKeyedSubscript:", @"keypointGridWidth"), "unsignedIntValue");
    v5->_regToolBoxConfig.keypointGridHeight = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RegTollboxParams"), "objectForKeyedSubscript:", @"keypointGridHeight"), "unsignedIntValue");
    v5->_regToolBoxConfig.keypointsTemplateRadius = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RegTollboxParams"), "objectForKeyedSubscript:", @"keypointsTemplateRadius"), "unsignedIntValue");
    v5->_regToolBoxConfig.keypointsSearchRadius = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RegTollboxParams"), "objectForKeyedSubscript:", @"keypointsSearchRadius"), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RegTollboxParams"), "objectForKeyedSubscript:", @"keypointsMinNccScore"), "doubleValue");
    *(float *)&double v6 = v6;
    v5->_regToolBoxConfig.keypointsMinNccScore = *(float *)&v6;
    v5->_regToolBoxConfig.imageWidth = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RegTollboxParams"), "objectForKeyedSubscript:", @"imageWidth"), "unsignedIntValue");
    v5->_regToolBoxConfig.imageHeight = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RegTollboxParams"), "objectForKeyedSubscript:", @"imageHeight"), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"keypointsMinSelectionScore"), "floatValue");
    v5->_keypointsMinSelectionScore = v7;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"epipolarWeightFalloffDistance"), "doubleValue");
    v5->_epipolarWeightFalloffDistance = v8;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"macroDepthWeightFalloffDistance"), "doubleValue");
    uint64_t v9 = 0;
    v5->_macroDepthWeightFalloffDistance = v10;
    p_rangeOCxT = &v5->_adaptiveCorrectionConfigs[0].rangeOCxT;
    do
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"epErrorLimitWidePix_FirstPass"), "doubleValue");
      *((void *)p_rangeOCxT - 4) = v12;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"epErrorLimitWidePix_SecondPass"), "doubleValue");
      *((void *)p_rangeOCxT - 3) = v13;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"rangePFL_T"), "doubleValue");
      *((void *)p_rangeOCxT - 2) = v14;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"rangePFL_W"), "doubleValue");
      *((void *)p_rangeOCxT - 1) = v15;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"rangeOCxT"), "doubleValue");
      *(void *)p_rangeOCxT = v16;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"rangeOCxW"), "doubleValue");
      *((void *)p_rangeOCxT + 1) = v17;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"rangeOCyW"), "doubleValue");
      *((void *)p_rangeOCxT + 3) = v18;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"intermediateMacroDistMM"), "doubleValue");
      *((void *)p_rangeOCxT + 4) = v19;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"extremeMacroDistMM"), "doubleValue");
      *((void *)p_rangeOCxT + 5) = v20;
      *((_DWORD *)p_rangeOCxT + 12) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"minPointsForAdjustment"), "intValue");
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"errorVal_GreaterThanInf"), "doubleValue");
      *((void *)p_rangeOCxT + 7) = v21;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"errorVal_LessThanExtremeMacro"), "doubleValue");
      *((void *)p_rangeOCxT + 8) = v22;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"errorVal_BetweenIntermediate_ExtremeMacro"), "doubleValue");
      *((void *)p_rangeOCxT + 9) = v23;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"runAnalyticalPreconditioning"), "doubleValue");
      *((unsigned char *)p_rangeOCxT + 80) = v24 != 0.0;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AdaptiveCorrectionConfig"), "objectForKeyedSubscript:", objc_msgSend(&unk_1EFB02C00, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", @"spgEpsilon"), "doubleValue");
      *((void *)p_rangeOCxT + 11) = v25;
      ++v9;
      p_rangeOCxT += 64;
    }
    while (v9 != 3);
    v5->_adaptiveCorrectionConfigsPtr = v5->_adaptiveCorrectionConfigs;
  }
  return v5;
}

- (float)keypointsMinSelectionScore
{
  return self->_keypointsMinSelectionScore;
}

- (unsigned)configuredNumKeypoints
{
  return self->_configuredNumKeypoints;
}

- (double)epipolarWeightFalloffDistance
{
  return self->_epipolarWeightFalloffDistance;
}

- (double)macroDepthWeightFalloffDistance
{
  return self->_macroDepthWeightFalloffDistance;
}

- (BWAdaptiveCorrectionPreviewRegistrationRegToolBoxConfig)regToolBoxConfig
{
  long long v3 = *(_OWORD *)&self[1].keypointGridHeight;
  *(_OWORD *)&retstr->numPyrLevels = *(_OWORD *)&self[1].numPyrLevels;
  *(_OWORD *)&retstr->keypointGridHeight = v3;
  return self;
}

- (const)adaptiveCorrectionConfigsPtr
{
  return self->_adaptiveCorrectionConfigsPtr;
}

@end