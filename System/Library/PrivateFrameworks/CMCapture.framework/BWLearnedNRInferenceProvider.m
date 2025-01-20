@interface BWLearnedNRInferenceProvider
+ (int32x2_t)numTilesForFullImageSize:(unsigned int)a3 tileSize:(unsigned int)a4 tileOverlap:;
+ (void)initialize;
- (BOOL)_verifyOutputFormatForRequirement:(BOOL)result;
- (BWLearnedNRInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4;
- (__CFString)_networkName;
- (id)outputRequirementsToProduceForInputSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:;
- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5;
- (int)purgeIntermediateResources;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:;
- (uint64_t)_maxTileOverlap;
- (uint64_t)_tileOverlapForGain:(float)a3 value:;
- (uint64_t)_tileOverlapForMetadata:(uint64_t)result;
- (uint64_t)_tuningParametersForPortType:(uint64_t)result;
- (uint64_t)_verifyInputFormat;
- (unint64_t)computeTileParametersForPosition:(double)a3;
- (void)dealloc;
@end

@implementation BWLearnedNRInferenceProvider

+ (void)initialize
{
}

- (BWLearnedNRInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4
{
  v4 = self;
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_13;
  }
  self->_configuration = (BWLearnedNRInferenceConfiguration *)a3;
  v7 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:&__block_literal_global_32];
  if (!v7
    || (v8 = v7,
        v22[0] = v7,
        v20.receiver = v4,
        v20.super_class = (Class)BWLearnedNRInferenceProvider,
        v9 = -[BWTiledEspressoInferenceProvider initWithConfiguration:inputVideoRequirements:outputVideoRequirements:resourceProvider:](&v20, sel_initWithConfiguration_inputVideoRequirements_outputVideoRequirements_resourceProvider_, a3, [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1], objc_msgSend(a3, "outputVideoRequirements"), a4), (v4 = v9) == 0))
  {
    FigSignalErrorAt();
LABEL_13:

    return 0;
  }
  v9->_inputVideoRequirement = &v8->super;
  v9->_outputVideoRequirements = (NSArray *)(id)[a3 outputVideoRequirements];
  v4->_outputFormatDescriptionByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = objc_msgSend(a3, "outputVideoRequirements", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_outputFormatDescriptionByAttachedMediaKey, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "videoFormat"), "underlyingVideoFormat"), "formatDescription"), objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "attachedMediaKey"));
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }
  return v4;
}

id __71__BWLearnedNRInferenceProvider_initWithConfiguration_resourceProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 pixelFormat];
  LOWORD(v5) = [a2 width];
  HIWORD(v5) = [a2 height];
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:v3 size:v5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWLearnedNRInferenceProvider;
  [(BWTiledEspressoInferenceProvider *)&v3 dealloc];
}

- (int)type
{
  return [(BWInferenceConfiguration *)self->_configuration inferenceType];
}

- (uint64_t)_tuningParametersForPortType:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ([*(id *)(result + 136) inferenceType] == 171) {
      v4 = @"QuadraLearnedNRParameters";
    }
    else {
      v4 = @"LearnedNRParameters";
    }
    unsigned int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 136), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", a2), "sensorIDDictionary"), "objectForKeyedSubscript:", @"NRFParameters");
    return [v5 objectForKeyedSubscript:v4];
  }
  return result;
}

- (uint64_t)_tileOverlapForGain:(float)a3 value:
{
  if (result)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [a2 count];
      uint64_t v7 = v6;
      if (int)v6 < 1 || (v6)
      {
        fig_log_get_emitter();
        uint64_t v17 = v3;
        LODWORD(v16) = 0;
        FigDebugAssert3();
      }
      objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 0, v16, v17), "floatValue");
      if (v8 >= a3)
      {
        uint64_t v11 = 1;
      }
      else
      {
        uint64_t v9 = ((v7 << 32) - 0x200000000) >> 32;
        objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v9), "floatValue");
        if (v10 > a3)
        {
          uint64_t v11 = -1;
          while (v11 + 1 < v9)
          {
            objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:"), "floatValue");
            float v13 = v12;
            objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v11 + 3), "floatValue");
            v11 += 2;
            if (v13 <= a3 && v14 > a3) {
              goto LABEL_19;
            }
          }
          return 64;
        }
        uint64_t v11 = ((v7 << 32) - 0x100000000) >> 32;
      }
LABEL_19:
      a2 = (void *)[a2 objectAtIndexedSubscript:v11];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return 64;
      }
    }
    return [a2 unsignedIntValue];
  }
  return result;
}

- (uint64_t)_tileOverlapForMetadata:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    FigCaptureComputeImageGainFromMetadata();
    v4 = objc_msgSend((id)-[BWLearnedNRInferenceProvider _tuningParametersForPortType:](v3, objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), "objectForKeyedSubscript:", @"TileOverlap");
    return -[BWLearnedNRInferenceProvider _tileOverlapForGain:value:](v3, v4, 1.0);
  }
  return result;
}

- (uint64_t)_maxTileOverlap
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 136), "sensorConfigurationsByPortType", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 64;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v12;
  LODWORD(v6) = 64;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      float v8 = objc_msgSend((id)-[BWLearnedNRInferenceProvider _tuningParametersForPortType:](a1, *(void *)(*((void *)&v11 + 1) + 8 * i)), "objectForKeyedSubscript:", @"TileOverlap");
      unsigned int v9 = -[BWLearnedNRInferenceProvider _tileOverlapForGain:value:](a1, v8, 3.4028e38);
      if (v6 <= v9) {
        uint64_t v6 = v9;
      }
      else {
        uint64_t v6 = v6;
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v4);
  return v6;
}

- (unint64_t)computeTileParametersForPosition:(double)a3
{
  if (result)
  {
    unsigned int v10 = *(_DWORD *)(result + 160);
    double v11 = COERCE_DOUBLE(vdup_n_s32(v10 >> 1));
    if (*(unsigned __int16 *)(result + 154) - 1 == HIWORD(a2))
    {
      v12.i32[1] = *(unsigned __int16 *)(result + 200) - *(unsigned __int16 *)(result + 158) + 4;
      uint64_t v13 = LODWORD(v11) | 0x400000000;
      int v14 = 4;
    }
    else
    {
      v12.i32[1] = (*(unsigned __int16 *)(result + 158) - v10) * HIWORD(a2) - 4;
      uint64_t v13 = LODWORD(v11) | 0x400000000;
      int v14 = HIDWORD(v11);
    }
    a8.i32[0] = 0;
    a9.i32[0] = 0;
    v9.i32[0] = HIWORD(a2);
    int8x8_t v15 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)vand_s8(a8, (int8x8_t)0xFFFF0000FFFFLL)), 0), (int8x8_t)v13, *(int8x8_t *)&v11);
    int v16 = *(unsigned __int16 *)(result + 156);
    HIDWORD(v11) = v12.i32[1];
    v12.i32[0] = *(unsigned __int16 *)(result + 192) - v16 + 4;
    v17.i32[1] = v14;
    if ((unsigned __int16)a2 != *(unsigned __int16 *)(result + 152) - 1)
    {
      LODWORD(v11) = (v16 - v10) * a2 - 4;
      *(double *)&int32x2_t v12 = v11;
    }
    v17.i32[0] = (unsigned __int16)a2;
    v18.i32[1] = v15.i32[1];
    v18.i32[0] = 4;
    int8x8_t v19 = vbsl_s8((int8x8_t)*(_OWORD *)&vmovl_s16((int16x4_t)vceq_s32(v17, a9)), v18, v15);
    HIWORD(v22) = v19.i16[2];
    LOWORD(v22) = v19.i16[0];
    int32x2_t v20 = vadd_s32(v12, vmovn_s64(*(int64x2_t *)(result + 168)));
    HIWORD(v21) = v20.i16[2];
    LOWORD(v21) = v20.i16[0];
    return v21 | ((unint64_t)v22 << 32);
  }
  return result;
}

- (id)outputRequirementsToProduceForInputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v6 = [(BWLearnedNRInferenceConfiguration *)self->_configuration outputAttachedMediaKeyForInputDimensions:BWPixelBufferDimensionsFromSampleBuffer(a3)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  uint64_t v8 = [(NSArray *)outputVideoRequirements countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(outputVideoRequirements);
        }
        int32x2_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "attachedMediaKey"), "isEqualToString:", v6)) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [(NSArray *)outputVideoRequirements countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return v5;
}

- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4
{
  p_renderROI = &self->_renderROI;
  size_t width = self->_renderROI.size.width;
  if (width >= CVPixelBufferGetWidth(a3))
  {
    size_t height = p_renderROI->size.height;
    if (height >= CVPixelBufferGetHeight(a3)) {
      return 0;
    }
  }
  metalStage = self->_metalStage;
  return [(LearnedNRMetalStage *)metalStage clearBuffer:a3];
}

- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:
{
  uint64_t v6 = v5;
  unsigned int v7 = a5;
  if ([a3 count] != 1) {
    goto LABEL_16;
  }
  unint64_t v18 = -[BWLearnedNRInferenceProvider computeTileParametersForPosition:]((unint64_t)self, v7, v11, v12, v13, v14, v15, v16, v17);
  if (!self) {
    goto LABEL_13;
  }
  unint64_t v19 = v18;
  int v20 = [(BWInferenceConfiguration *)self->_configuration inferenceType] == 171 ? 3 : 1;
  if ((v20 & (v19 | WORD1(v19))) != 0) {
    goto LABEL_13;
  }
  uint64_t v21 = [a4 objectForKeyedSubscript:@"PrimaryFormat"];
  uint64_t v22 = [a3 objectForKeyedSubscript:@"input"];
  if (!v22)
  {
LABEL_16:
    FigSignalErrorAt();
    return 0;
  }
  metalStage = self->_metalStage;
  if (self->_isInputFormatRaw)
  {
    if ([(LearnedNRMetalStage *)metalStage createRawTile:v22 fromInputRaw:v21 tileStart:v19 cmdBuffer:v6])goto LABEL_13; {
    return 0;
    }
  }
  if (![(LearnedNRMetalStage *)metalStage createRawTile:v22 fromInputYuv:v21 tileStart:v19 cmdBuffer:v6])return 0; {
LABEL_13:
  }
  return FigSignalErrorAt();
}

- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:
{
  unint64_t v20 = -[BWLearnedNRInferenceProvider computeTileParametersForPosition:]((unint64_t)self, a9, v9, v10, v11, v12, v13, v14, v15);
  if (self)
  {
    unint64_t v22 = v20;
    __int32 v23 = v21;
    int v25 = [(BWInferenceConfiguration *)self->_configuration inferenceType] == 171 ? 3 : 1;
    if ((v25 & (v22 | WORD1(v22))) == 0)
    {
      v24.i16[0] = *(_WORD *)self->_tileSize;
      v24.i16[2] = *(_WORD *)&self->_tileSize[2];
      int32x2_t v39 = v24;
      uint64_t v26 = [a5 objectForKeyedSubscript:@"output"];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = [a8 objectForKeyedSubscript:@"PrimaryFormat"];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = [a6 objectForKeyedSubscript:objc_msgSend(NSString, "stringWithFormat:", @"intermediateLumaTile_%i", -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType"))];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = [a6 objectForKeyedSubscript:objc_msgSend(NSString, "stringWithFormat:", @"intermediateDeltaTile_%i", -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType"))];
            if (v32)
            {
              uint64_t v35 = v32;
              v33.i32[0] = v23;
              v34.i32[0] = HIDWORD(v22);
              int32x2_t v36 = vsub_s32(v39, (int32x2_t)*(_OWORD *)&vaddl_u16(v34, v33));
              metalStage = self->_metalStage;
              HIWORD(v42) = HIWORD(v22) + WORD1(v22);
              LOWORD(v42) = WORD2(v22) + v22;
              HIWORD(v41) = v36.i16[2];
              LOWORD(v41) = v36.i16[0];
              if (self->_isInputFormatRaw)
              {
                int result = -[LearnedNRMetalStage writeRgbTile:toYuvBuffer:intermediateLumaBuffer:intermediateDeltaBuffer:origRawInputBuffer:srcStart:dstStart:size:cmdBuffer:](metalStage, "writeRgbTile:toYuvBuffer:intermediateLumaBuffer:intermediateDeltaBuffer:origRawInputBuffer:srcStart:dstStart:size:cmdBuffer:", v27, a4, v31, v35, v29, __PAIR64__(v41, v42), v44);
                if (!result) {
                  return result;
                }
              }
              else
              {
                int result = -[LearnedNRMetalStage writeRgbTile:toYuvBuffer:intermediateLumaBuffer:intermediateDeltaBuffer:origYuvInputBuffer:srcStart:dstStart:size:cmdBuffer:](metalStage, "writeRgbTile:toYuvBuffer:intermediateLumaBuffer:intermediateDeltaBuffer:origYuvInputBuffer:srcStart:dstStart:size:cmdBuffer:", v27, a4, v31, v35, v29, __PAIR64__(v41, v42), v44);
                if (!result) {
                  return result;
                }
              }
            }
          }
        }
      }
    }
  }
  return FigSignalErrorAt();
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  CFTypeRef v21 = 0;
  CFTypeRef cf = 0;
  uint64_t v9 = [a3 attachedMediaKey];
  uint64_t v10 = [a4 pixelBufferForRequirement:a3];
  if (v10)
  {
    double v11 = (__CVBuffer *)v10;
    CFTypeRef v12 = (CFTypeRef)[(NSMutableDictionary *)self->_outputFormatDescriptionByAttachedMediaKey objectForKeyedSubscript:v9];
    if (v12) {
      CFTypeRef v12 = CFRetain(v12);
    }
    CFTypeRef v21 = v12;
    int v13 = BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a5, v11, 0, &v21, (CMSampleBufferRef *)&cf);
    if (v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      [(NSMutableDictionary *)self->_outputFormatDescriptionByAttachedMediaKey setObject:v21 forKeyedSubscript:v9];
      BWCMSampleBufferCopyReattachAndReturnMutableMetadata(cf);
      BWSampleBufferSetAttachedMedia(a5, v9, (uint64_t)cf);
      int8x8_t v14 = (void *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      CGFloat x = (double)self->_renderROI.origin.x;
      CGFloat y = (double)self->_renderROI.origin.y;
      CGFloat width = (double)self->_renderROI.size.width;
      CGFloat height = (double)self->_renderROI.size.height;
      unint64_t v19 = psn_pixelBufferDimensions(v11);
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v14, v19, v19, x, y, width, height, x, y, width, height);
    }
  }
  else
  {
    int v13 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v21) {
    CFRelease(v21);
  }
  return v13;
}

- (int)purgeIntermediateResources
{
  return 0;
}

+ (int32x2_t)numTilesForFullImageSize:(unsigned int)a3 tileSize:(unsigned int)a4 tileOverlap:
{
  self;
  v7.i32[0] = (unsigned __int16)a2;
  v7.i32[1] = vshl_u32((uint32x2_t)vdup_n_s32(a2), (uint32x2_t)0xFFFFFFF0FFFF0001).i32[1];
  v8.i32[0] = (unsigned __int16)a3;
  v8.i32[1] = vshl_u32((uint32x2_t)vdup_n_s32(a3), (uint32x2_t)0xFFFFFFF0FFFF0001).i32[1];
  int32x2_t v9 = vdup_n_s32(a4);
  return vcvt_s32_f32(vrndp_f32(vdiv_f32(vcvt_f32_u32((uint32x2_t)vadd_s32(vsub_s32(v7, v9), (int32x2_t)0x800000008)), vcvt_f32_u32((uint32x2_t)vsub_s32(v8, v9)))));
}

- (uint64_t)_verifyInputFormat
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 104), "videoFormat"), "pixelFormat");
  int result = 0;
  if (v2 <= 792229423)
  {
    if (v2 <= 758670895)
    {
      BOOL v3 = v2 == 641230384 || v2 == 641234480;
      int v4 = 645424688;
    }
    else if (v2 > 762865199)
    {
      BOOL v3 = v2 == 762865200;
      int v4 = 792225328;
    }
    else
    {
      BOOL v3 = v2 == 758670896;
      int v4 = 758674992;
    }
LABEL_20:
    if (!v3 && v2 != v4) {
      return result;
    }
LABEL_25:
    *(unsigned char *)(v1 + 216) = 0;
    return [*(id *)(v1 + 136) inferenceType] != 171;
  }
  if (v2 > 2019963439)
  {
    if (v2 > 2084075055)
    {
      BOOL v3 = v2 == 2084075056;
      int v4 = 2088265264;
    }
    else
    {
      BOOL v3 = v2 == 2019963440;
      int v4 = 2084070960;
    }
    goto LABEL_20;
  }
  if (v2 <= 875704437)
  {
    BOOL v3 = v2 == 792229424;
    int v4 = 796419632;
    goto LABEL_20;
  }
  if (v2 == 875704438) {
    goto LABEL_25;
  }
  if (v2 == 1651926376)
  {
    int result = 1;
    *(unsigned char *)(v1 + 216) = 1;
  }
  return result;
}

- (BOOL)_verifyOutputFormatForRequirement:(BOOL)result
{
  if (result)
  {
    uint64_t v2 = result;
    int v3 = objc_msgSend((id)objc_msgSend(a2, "videoFormat"), "pixelFormat");
    if (!*(unsigned char *)(v2 + 216)) {
      return v3 == objc_msgSend((id)objc_msgSend(*(id *)(v2 + 104), "videoFormat"), "pixelFormat");
    }
    int result = 1;
    if (v3 <= 795371055)
    {
      if (v3 == 644376112) {
        return result;
      }
      int v4 = 761816624;
      goto LABEL_10;
    }
    if (v3 != 795371056 && v3 != 1751527984)
    {
      int v4 = 2087216688;
LABEL_10:
      if (v3 != v4) {
        return 0;
      }
    }
  }
  return result;
}

- (__CFString)_networkName
{
  if (result)
  {
    if ([(id)result[4].info inferenceType] == 171)
    {
      return @"learnednoisereduction-quadra-v1";
    }
    else
    {
      id v1 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:@"learnednoisereduction-v3" embedPlatformOrDeviceID:1];
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v1, "path")))return @"learnednoisereduction-v3"; {
      else
      }
        return @"learnednoisereduction-v2";
    }
  }
  return result;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (![+[FigCaptureCameraParameters sharedInstance] commonNRFParameters])goto LABEL_39; {
  uint64_t v5 = [+[FigCaptureCameraParameters sharedInstance] nrfVersion];
  }
  if (!v5) {
    goto LABEL_39;
  }
  uint64_t v6 = BWLoadProcessorBundle(@"NRF", v5);
  if (!v6) {
    goto LABEL_39;
  }
  uint64_t v7 = [v6 classNamed:@"LearnedNRMetalStage"];
  if (!v7) {
    goto LABEL_39;
  }
  id v54 = a3;
  v55 = (objc_class *)v7;
  int32x2_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int32x2_t v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v10 = [(BWLearnedNRInferenceConfiguration *)self->_configuration sensorConfigurationsByPortType];
  uint64_t v11 = [(NSDictionary *)v10 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v67;
LABEL_7:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v67 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v66 + 1) + 8 * v14);
      id v16 = [(NSDictionary *)[(BWLearnedNRInferenceConfiguration *)self->_configuration sensorConfigurationsByPortType] objectForKeyedSubscript:v15];
      if (![v16 cameraInfo]) {
        goto LABEL_39;
      }
      objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v16, "cameraInfo"), v15);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", -[BWLearnedNRInferenceProvider _tuningParametersForPortType:]((uint64_t)self, v15), v15);
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSDictionary *)v10 countByEnumeratingWithState:&v66 objects:v75 count:16];
        if (v12) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
  int32x2_t v17 = (LearnedNRMetalStage *)objc_msgSend([v55 alloc], "initWithCommandQueue:cameraInfo:tuningParameters:isQuadra:", -[BWTiledEspressoInferenceConfiguration metalCommandQueue](self->_configuration, "metalCommandQueue"), v8, v9, -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType") == 171);
  self->_metalStage = v17;
  if (!v17) {
    goto LABEL_39;
  }
  [(LearnedNRMetalStage *)self->_metalStage setDeviceGeneration:[+[FigCaptureCameraParameters sharedInstance] deviceGeneration]];
  if (!-[BWLearnedNRInferenceProvider _verifyInputFormat]((uint64_t)self)) {
    return -31711;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  uint64_t v19 = [(NSArray *)outputVideoRequirements countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v63;
LABEL_17:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v63 != v21) {
        objc_enumerationMutation(outputVideoRequirements);
      }
      if (!-[BWLearnedNRInferenceProvider _verifyOutputFormatForRequirement:]((BOOL)self, *(void **)(*((void *)&v62 + 1) + 8 * v22)))return -31711; {
      if (v20 == ++v22)
      }
      {
        uint64_t v20 = [(NSArray *)outputVideoRequirements countByEnumeratingWithState:&v62 objects:v74 count:16];
        if (v20) {
          goto LABEL_17;
        }
        break;
      }
    }
  }
  __int32 v23 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", -[BWLearnedNRInferenceProvider _networkName]((__CFString *)self), 1);
  if (!v23
    || (int32x2_t v24 = v23,
        (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", -[objc_class path](v23, "path")) & 1) == 0))
  {
LABEL_39:
    FigSignalErrorAt();
    return 0;
  }
  int v25 = self->_outputVideoRequirements;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v70 objects:v76 count:16];
  Class v56 = v24;
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = 0;
    uint64_t v29 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v71 != v29) {
          objc_enumerationMutation(v25);
        }
        uint64_t v31 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        uint64_t v32 = objc_msgSend((id)objc_msgSend(v31, "videoFormat"), "width");
        unint64_t v33 = objc_msgSend((id)objc_msgSend(v31, "videoFormat"), "height") * v32;
        uint64_t v34 = objc_msgSend((id)objc_msgSend(v28, "videoFormat"), "width");
        if (v33 > objc_msgSend((id)objc_msgSend(v28, "videoFormat"), "height") * v34) {
          uint64_t v28 = v31;
        }
      }
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v70 objects:v76 count:16];
    }
    while (v27);
  }
  else
  {
    uint64_t v28 = 0;
  }
  self->_renderROI.origin.CGFloat y = 0;
  self->_renderROI.origin.z = 0;
  self->_renderROI.origin.CGFloat x = 0;
  unint64_t v35 = objc_msgSend((id)objc_msgSend(v28, "videoFormat"), "width");
  unint64_t v36 = objc_msgSend((id)objc_msgSend(v28, "videoFormat"), "height");
  self->_renderROI.size.CGFloat width = v35;
  self->_renderROI.size.CGFloat height = v36;
  self->_renderROI.size.depth = 0;
  *(_DWORD *)self->_tileSize = 48235296;
  unsigned int v37 = -[BWLearnedNRInferenceProvider _maxTileOverlap]((uint64_t)self);
  self->_tileOverlap = v37;
  int32x2_t v38 = vmovn_s64(*(int64x2_t *)&self->_renderROI.size.width);
  HIWORD(v59) = v38.i16[2];
  LOWORD(v59) = v38.i16[0];
  int32x2_t v39 = +[BWLearnedNRInferenceProvider numTilesForFullImageSize:tileSize:tileOverlap:]((uint64_t)BWLearnedNRInferenceProvider, v59, *(_DWORD *)self->_tileSize, v37);
  *(_WORD *)self->_numTiles = v39.i16[0];
  *(_WORD *)&self->_numTiles[2] = v39.i16[2];
  LOWORD(v58) = *(_WORD *)self->_tileSize >> 1;
  HIWORD(v58) = (5 * *(unsigned __int16 *)&self->_tileSize[2]) >> 1;
  id v40 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1278226536 size:v58];
  uint64_t v53 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v40, @"input", 0);
  LOWORD(v57) = *(_WORD *)self->_tileSize;
  HIWORD(v57) = 3 * *(_WORD *)&self->_tileSize[2];
  id v41 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1278226536 size:v57];
  uint64_t v52 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v41, @"output", 0);
  unsigned int v42 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v43 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1278226536 size:*(unsigned int *)self->_tileSize];
  uint64_t v44 = [BWInferenceVideoRequirement alloc];
  [v42 addObject:-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](v44, "initWithAttachedMediaKey:videoFormat:", objc_msgSend(NSString, "stringWithFormat:", @"intermediateLumaTile_%i", -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType")), v43)];
  id v45 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1278226536 size:*(unsigned int *)self->_tileSize];
  v46 = [BWInferenceVideoRequirement alloc];
  [v42 addObject:-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](v46, "initWithAttachedMediaKey:videoFormat:", objc_msgSend(NSString, "stringWithFormat:", @"intermediateDeltaTile_%i", -[BWInferenceConfiguration inferenceType](self->_configuration, "inferenceType")), v45)];
  uint64_t v47 = [(BWLearnedNRInferenceProvider *)self type];
  uint64_t v48 = *(unsigned int *)self->_numTiles;
  v61.receiver = self;
  v61.super_class = (Class)BWLearnedNRInferenceProvider;
  int v49 = [(BWTiledEspressoInferenceProvider *)&v61 loadNetworkWithURL:v56 configName:0 inferenceType:v47 maxTileCount:v48 inputFormatsByBindingName:v53 outputFormatsByBindingName:v52 additionalVideoRequirements:v42];
  if (v49) {
    return v49;
  }
  v60.receiver = self;
  v60.super_class = (Class)BWLearnedNRInferenceProvider;
  int v50 = [(BWTiledEspressoInferenceProvider *)&v60 prepareForSubmissionWithWorkQueue:v54];
  if (v50)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {

    self->_preparedOutputVideoRequirement = (BWInferenceVideoRequirement *)v28;
  }
  return v50;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (![(LearnedNRMetalStage *)self->_metalStage updateParametersFromMetadata:v13 lscSampleBuffer:BWSampleBufferGetAttachedMedia(a3, 0x1EFA74640)]&& (CFDictionaryRef v14 = (const __CFDictionary *)CMGetAttachment(a3, @"LearnedNRRegionOfInterest", 0)) != 0&& (v15 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16), rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20], rect.size = v15, CGRectMakeWithDictionaryRepresentation(v14, &rect)))
  {
    int v16 = [(BWInferenceConfiguration *)self->_configuration inferenceType];
    if (v16 == 171) {
      unsigned int v18 = 4;
    }
    else {
      unsigned int v18 = 2;
    }
    *(float *)v17.i32 = (float)v18;
    if (v16 == 171) {
      unsigned int v19 = 2;
    }
    else {
      unsigned int v19 = 1;
    }
    self->_renderROI.origin.z = 0;
    float32x2_t v20 = (float32x2_t)vdup_lane_s32(v17, 0);
    uint32x2_t v21 = (uint32x2_t)vdup_n_s32(v19);
    uint32x2_t v22 = vshl_u32(vcvt_u32_f32(vrndm_f32(vdiv_f32(vcvt_f32_f64((float64x2_t)rect.origin), v20))), v21);
    *(void *)&long long v23 = v22.u32[0];
    *((void *)&v23 + 1) = v22.u32[1];
    uint64x2_t v31 = vsubl_u32(vshl_u32(vcvt_u32_f32(vrndp_f32(vdiv_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)rect.origin, (float64x2_t)rect.size)), v20))), v21), v22);
    *(_OWORD *)&self->_renderROI.origin.CGFloat x = v23;
    *(uint64x2_t *)&self->_renderROI.size.CGFloat width = v31;
    self->_renderROI.size.depth = 0;
    unint64_t v24 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_preparedOutputVideoRequirement videoFormat] width];
    if (v32 <= v24)
    {
      unint64_t height = self->_renderROI.size.height;
      if (height <= [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_preparedOutputVideoRequirement videoFormat] height])
      {
        unsigned int v26 = -[BWLearnedNRInferenceProvider _tileOverlapForMetadata:]((uint64_t)self, v13);
        self->_tileOverlap = v26;
        int32x2_t v27 = vmovn_s64(*(int64x2_t *)&self->_renderROI.size.width);
        HIWORD(v34) = v27.i16[2];
        LOWORD(v34) = v27.i16[0];
        int32x2_t v28 = +[BWLearnedNRInferenceProvider numTilesForFullImageSize:tileSize:tileOverlap:]((uint64_t)BWLearnedNRInferenceProvider, v34, *(_DWORD *)self->_tileSize, v26);
        HIWORD(v33) = v28.i16[2];
        LOWORD(v33) = v28.i16[0];
        *(_WORD *)&self->_numTiles[2] = v28.i16[2];
        *(_WORD *)self->_numTiles = v28.i16[0];
        v37.receiver = self;
        v37.super_class = (Class)BWLearnedNRInferenceProvider;
        long long v35 = *(_OWORD *)&a5->var0;
        int64_t var3 = a5->var3;
        return [(BWTiledEspressoInferenceProvider *)&v37 submitForSampleBuffer:a3 usingStorage:a4 withSubmissionTime:&v35 workQueue:a6 completionHandler:a7 currentTileCount:v33];
      }
    }
    int v29 = -31710;
  }
  else
  {
    int v29 = FigSignalErrorAt();
  }
  if (a7) {
    (*((void (**)(id, uint64_t, BWLearnedNRInferenceProvider *))a7 + 2))(a7, 4294935586, self);
  }
  return v29;
}

@end