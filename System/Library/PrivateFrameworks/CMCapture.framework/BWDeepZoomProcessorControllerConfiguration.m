@interface BWDeepZoomProcessorControllerConfiguration
+ (BOOL)doDeepZoomStandardOrLiteForSampleBuffer:(opaqueCMSampleBuffer *)a3 type:(int)a4 sensorConfiguration:(id)a5 intermediateZoomSrcRectOut:(CGRect *)a6 intermediateZoomDstRectOut:(CGRect *)a7;
+ (BOOL)doDeepZoomStandardOrLiteForType:(int)a3 sensorConfiguration:(id)a4 dimensions:(id)a5 metadata:(id)a6 stillImageSettings:(id)a7 intermediateZoomSrcRectOut:(CGRect *)a8 intermediateZoomDstRectOut:(CGRect *)a9;
+ (BOOL)doDeepZoomTransferForSampleBuffer:(opaqueCMSampleBuffer *)a3 sensorConfiguration:(id)a4 intermediateZoomSrcRectOut:(CGRect *)a5;
+ (double)quadraQSubIntermediateZoomRectForDimensions:(void *)a3 metadata:(void *)a4 sensorConfiguration:(void *)a5 stillImageSettings:;
+ (int)deepZoomProcessingModeForType:(int)a3 sensorConfiguration:(id)a4;
- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions;
- (BWVideoFormat)inputFormat;
- (BWVideoFormat)outputFormat;
- (int)mode;
- (int)type;
- (int)version;
- (void)dealloc;
- (void)setInputFormat:(id)a3;
- (void)setMode:(int)a3;
- (void)setOutputFormat:(id)a3;
- (void)setStereoPhotoOutputDimensions:(id)a3;
- (void)setType:(int)a3;
- (void)setVersion:(int)a3;
@end

@implementation BWDeepZoomProcessorControllerConfiguration

- (int)type
{
  return self->_type;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setOutputFormat:(id)a3
{
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (void)setInputFormat:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeepZoomProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

+ (BOOL)doDeepZoomStandardOrLiteForSampleBuffer:(opaqueCMSampleBuffer *)a3 type:(int)a4 sensorConfiguration:(id)a5 intermediateZoomSrcRectOut:(CGRect *)a6 intermediateZoomDstRectOut:(CGRect *)a7
{
  uint64_t v10 = *(void *)&a4;
  if (dzpc_initializeTrace_sInitializeTraceOnceToken != -1) {
    dispatch_once(&dzpc_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_120);
  }
  LOBYTE(ImageBuffer) = 0;
  CGSize v13 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  CGPoint v24 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGSize v25 = v13;
  CGPoint v22 = v24;
  CGSize v23 = v13;
  if (a5)
  {
    if (a3)
    {
      if ((v10 - 3) >= 0xFFFFFFFE)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        if (ImageBuffer)
        {
          ImageBuffer = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          if (ImageBuffer)
          {
            v14 = ImageBuffer;
            ImageBuffer = (void *)CMGetAttachment(a3, @"StillSettings", 0);
            if (ImageBuffer)
            {
              v15 = ImageBuffer;
              unint64_t v16 = BWPixelBufferDimensionsFromSampleBuffer(a3);
              if (a6) {
                v17 = &v24;
              }
              else {
                v17 = 0;
              }
              v18 = &v22;
              if (!a7) {
                v18 = 0;
              }
              LOBYTE(ImageBuffer) = +[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForType:v10 sensorConfiguration:a5 dimensions:v16 metadata:v14 stillImageSettings:v15 intermediateZoomSrcRectOut:v17 intermediateZoomDstRectOut:v18];
            }
          }
        }
      }
    }
  }
  if (a6)
  {
    CGSize v19 = v25;
    a6->origin = v24;
    a6->size = v19;
  }
  if (a7)
  {
    CGSize v20 = v23;
    a7->origin = v22;
    a7->size = v20;
  }
  return (char)ImageBuffer;
}

+ (BOOL)doDeepZoomStandardOrLiteForType:(int)a3 sensorConfiguration:(id)a4 dimensions:(id)a5 metadata:(id)a6 stillImageSettings:(id)a7 intermediateZoomSrcRectOut:(CGRect *)a8 intermediateZoomDstRectOut:(CGRect *)a9
{
  uint64_t v14 = *(void *)&a3;
  v84[2] = *MEMORY[0x1E4F143B8];
  if (dzpc_initializeTrace_sInitializeTraceOnceToken != -1) {
    dispatch_once(&dzpc_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_120);
  }
  LOBYTE(v15) = 0;
  CGPoint v81 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGSize v82 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v80.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v80.size = v82;
  if ((v14 - 3) < 0xFFFFFFFE) {
    goto LABEL_67;
  }
  if (!a4) {
    goto LABEL_67;
  }
  if (!a6) {
    goto LABEL_67;
  }
  long long v71 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  if (!a7) {
    goto LABEL_67;
  }
  v15 = objc_msgSend((id)objc_msgSend(a4, "sensorIDDictionary"), "objectForKeyedSubscript:", @"DeepZoomParameters");
  if (!v15) {
    goto LABEL_67;
  }
  unint64_t v16 = v15;
  LOBYTE(v15) = 0;
  if (!a5.var0) {
    goto LABEL_67;
  }
  if (!a5.var1) {
    goto LABEL_67;
  }
  v15 = (void *)[a7 requestedSettings];
  if (!v15) {
    goto LABEL_67;
  }
  v17 = v15;
  int v77 = +[BWDeepZoomProcessorControllerConfiguration deepZoomProcessingModeForType:v14 sensorConfiguration:a4];
  if (!v77)
  {
    FigDebugAssert3();
    goto LABEL_85;
  }
  long long v78 = *MEMORY[0x1E4F1DB28];
  long long v79 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  FigCFDictionaryGetCGRectIfPresent();
  double v18 = (double)[v17 outputWidth];
  double v19 = v18 / (double)[v17 outputHeight];
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(a5.var0, *(uint64_t *)&a5 >> 32, *(CGFloat *)&v78, *((CGFloat *)&v78 + 1), *(CGFloat *)&v79, *((CGFloat *)&v79 + 1), v19);
  double width = v85.size.width;
  double height = v85.size.height;
  double x = v85.origin.x;
  double y = v85.origin.y;
  if (CGRectIsEmpty(v85))
  {
LABEL_85:
    LOBYTE(v15) = 0;
    goto LABEL_67;
  }
  v83[0] = &unk_1EFB02840;
  v83[1] = &unk_1EFB02858;
  v84[0] = @"Lite";
  v84[1] = @"Standard";
  CGPoint v22 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
  v15 = objc_msgSend(v22, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v14));
  if (!v15) {
    goto LABEL_67;
  }
  v15 = (void *)[v16 objectForKeyedSubscript:v15];
  if (!v15) {
    goto LABEL_67;
  }
  CGSize v23 = v15;
  double v70 = v19;
  objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"RequiredExtraPaddingForGDC"), "floatValue");
  float v25 = v24;
  objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", @"MinScaleFactor"), "floatValue");
  float v27 = v26;
  objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", @"MaxScaleFactor"), "floatValue");
  float v29 = v28;
  double v30 = (double)[v17 outputWidth] / width;
  if (v30 < 1.0) {
    double v30 = 1.0;
  }
  float v31 = v30;
  double rect1 = height;
  double v32 = (double)[v17 outputHeight] / height;
  if (v32 < 1.0) {
    double v32 = 1.0;
  }
  float v33 = v32;
  if ((float)(v31 - v25) >= 1.0) {
    float v34 = v31 - v25;
  }
  else {
    float v34 = 1.0;
  }
  if ((float)(v33 - v25) >= 1.0) {
    float v35 = v33 - v25;
  }
  else {
    float v35 = 1.0;
  }
  if ((objc_msgSend((id)objc_msgSend(a7, "captureSettings"), "captureFlags") & 0x10) != 0
    && [v23 objectForKeyedSubscript:@"QSub"])
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", @"QSub"), "objectForKeyedSubscript:", @"MinScaleFactor"), "floatValue");
    float v27 = v36;
  }
  float v37 = v25 + v29;
  id v76 = a6;
  uint64_t v38 = [a6 objectForKeyedSubscript:*MEMORY[0x1E4F53398]];
  uint64_t v39 = v38;
  BOOL v40 = v34 > 0.0;
  if (v35 <= 0.0) {
    BOOL v40 = 0;
  }
  if (v38) {
    BOOL v40 = 1;
  }
  int v41 = v77 != 2 || v40;
  if (v31 >= v33) {
    float v42 = v33;
  }
  else {
    float v42 = v31;
  }
  if (v42 < v27 && v38 == 0) {
    LODWORD(v15) = 0;
  }
  else {
    LODWORD(v15) = v41;
  }
  if (dword_1E96B6B48)
  {
    int v75 = (int)v15;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    LODWORD(v15) = v75;
  }
  if (v39)
  {
    if (a8 && a9)
    {
      char v45 = (char)v15;
      if (!FigCFDictionaryGetCGRectIfPresent())
      {
        CGPoint v81 = (CGPoint)0;
        __asm { FMOV            V0.2D, #1.0 }
        CGSize v82 = _Q0;
      }
      if (!FigCFDictionaryGetCGRectIfPresent())
      {
        v80.origin = 0uLL;
        __asm { FMOV            V0.2D, #1.0 }
        v80.size = _Q0;
      }
      if (dword_1E96B6B48)
      {
        v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      LOBYTE(v15) = v45;
      goto LABEL_83;
    }
LABEL_67:
    if (!a8) {
      return (char)v15;
    }
    goto LABEL_83;
  }
  if ((v77 - 3) < 3)
  {
LABEL_70:
    char v56 = (char)v15;
    v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    LOBYTE(v15) = v56;
    goto LABEL_67;
  }
  if (v77 == 1)
  {
    if (!dword_1E96B6B48) {
      goto LABEL_67;
    }
    goto LABEL_70;
  }
  if (v77 != 2) {
    goto LABEL_67;
  }
  if (!v15) {
    goto LABEL_67;
  }
  LOBYTE(v15) = 1;
  if (!a8 || !a9) {
    goto LABEL_67;
  }
  if (![v76 objectForKeyedSubscript:*MEMORY[0x1E4F54370]])
  {
    double v52 = x;
    double v53 = y;
    goto LABEL_72;
  }
  double v52 = x;
  double v53 = y;
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
LABEL_72:
    if (v31 < v33) {
      float v31 = v33;
    }
    if (v31 <= v37) {
      float v58 = v34;
    }
    else {
      float v58 = v37;
    }
    if (v31 <= v37) {
      float v59 = v35;
    }
    else {
      float v59 = v37;
    }
    CGFloat v60 = (float)((float)objc_msgSend(v17, "outputWidth", v68, v69) / v58);
    CGFloat v61 = (float)((float)[v17 outputHeight] / v59);
    v88.size.double width = (double)a5.var0;
    v88.size.double height = (double)a5.var1;
    v88.origin.double x = 0.0;
    v88.origin.double y = 0.0;
    v86.origin.double x = v52 - (v60 - width) * 0.5;
    v86.origin.double y = v53 - (v61 - rect1) * 0.5;
    v86.size.double width = v60;
    v86.size.double height = v61;
    CGRect v87 = CGRectIntersection(v86, v88);
    v81.double x = v87.origin.x;
    v81.double y = v87.origin.y;
    v82.double width = v87.size.width;
    v82.double height = v87.size.height;
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(a5.var0, *(uint64_t *)&a5 >> 32, 0.0, 0.0, 1.0, 1.0, v70);
    v80.origin.double x = v62;
    v80.origin.double y = v63;
    v80.size.double width = v64;
    v80.size.double height = v65;
    if (dword_1E96B6B48)
    {
      v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_82;
  }
  int v54 = objc_msgSend((id)objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E4F54168]), "intValue");
  int v55 = objc_msgSend((id)objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E4F54160]), "intValue");
  if (v54 && v55)
  {
    double v52 = x + ((double)v54 - *(double *)&v71) * 0.5;
    double v53 = y + ((double)v55 - *((double *)&v71 + 1)) * 0.5;
    goto LABEL_72;
  }
  FigDebugAssert3();
LABEL_82:
  LOBYTE(v15) = 1;
LABEL_83:
  a8->origin = v81;
  a8->size = v82;
  *a9 = v80;
  return (char)v15;
}

+ (BOOL)doDeepZoomTransferForSampleBuffer:(opaqueCMSampleBuffer *)a3 sensorConfiguration:(id)a4 intermediateZoomSrcRectOut:(CGRect *)a5
{
  if (dzpc_initializeTrace_sInitializeTraceOnceToken != -1) {
    dispatch_once(&dzpc_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_120);
  }
  double v8 = *MEMORY[0x1E4F1DB20];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (a3
    && a4
    && (CFTypeRef v12 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0
    && (CGSize v13 = (void *)v12, (v14 = CMGetAttachment(a3, @"StillSettings", 0)) != 0))
  {
    if (a5)
    {
      v15 = (void *)v14;
      if (objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1)
      {
        unint64_t v16 = BWPixelBufferDimensionsFromSampleBuffer(a3);
        double v8 = +[BWDeepZoomProcessorControllerConfiguration quadraQSubIntermediateZoomRectForDimensions:metadata:sensorConfiguration:stillImageSettings:]((uint64_t)BWDeepZoomProcessorControllerConfiguration, v16, v13, a4, v15);
        CGFloat v9 = v17;
        CGFloat v10 = v18;
        CGFloat v11 = v19;
        BOOL v20 = 1;
        if (!CGRectIsNull(*a5))
        {
          if (dword_1E96B6B48)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            BOOL v20 = 1;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      else
      {
        BOOL v20 = 1;
      }
      goto LABEL_13;
    }
    return 1;
  }
  else
  {
    BOOL v20 = 0;
    BOOL result = 0;
    if (a5)
    {
LABEL_13:
      a5->origin.double x = v8;
      a5->origin.double y = v9;
      BOOL result = v20;
      a5->size.double width = v10;
      a5->size.double height = v11;
    }
  }
  return result;
}

+ (double)quadraQSubIntermediateZoomRectForDimensions:(void *)a3 metadata:(void *)a4 sensorConfiguration:(void *)a5 stillImageSettings:
{
  self;
  double v9 = *MEMORY[0x1E4F1DB20];
  if (a3 && a4 && a5)
  {
    int v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a5, "captureSettings"), "captureFlags") & 0x200000000;
    if (v10 == 1 && v11 != 0)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "sensorIDDictionary"), "objectForKeyedSubscript:", @"DeepZoomParameters"))
      {
        if (a2)
        {
          if (HIDWORD(a2))
          {
            uint64_t v13 = [a5 requestedSettings];
            if (v13)
            {
              CFTypeRef v14 = (void *)v13;
              long long v23 = *MEMORY[0x1E4F1DB28];
              long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
              FigCFDictionaryGetCGRectIfPresent();
              double v15 = (double)[v14 outputWidth];
              double v16 = v15 / (double)[v14 outputHeight];
              FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)a2, a2 >> 32, *(CGFloat *)&v23, *((CGFloat *)&v23 + 1), *(CGFloat *)&v24, *((CGFloat *)&v24 + 1), v16);
              double width = v25.size.width;
              double height = v25.size.height;
              if (!CGRectIsEmpty(v25)
                && width <= (double)[v14 outputWidth]
                && height <= (double)[v14 outputHeight])
              {
                float v19 = (double)(int)a2 / width;
                float v20 = (double)SHIDWORD(a2) / height;
                if (v19 < v20) {
                  float v19 = (double)SHIDWORD(a2) / height;
                }
                if (v19 < 2.0)
                {
                  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)a2, a2 >> 32, 0.125, 0.125, 0.75, 0.75, v16);
                  return v21;
                }
              }
            }
          }
        }
      }
    }
  }
  return v9;
}

+ (int)deepZoomProcessingModeForType:(int)a3 sensorConfiguration:(id)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if ((a3 - 4) < 0xFFFFFFFD || a4 == 0)
  {
    LODWORD(v6) = 0;
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    v6 = objc_msgSend((id)objc_msgSend(a4, "sensorIDDictionary"), "objectForKeyedSubscript:", @"DeepZoomParameters");
    if (v6)
    {
      v7 = v6;
      v10[0] = &unk_1EFB02840;
      v10[1] = &unk_1EFB02858;
      v11[0] = @"Lite";
      v11[1] = @"Standard";
      v10[2] = &unk_1EFB02870;
      v11[2] = @"Transfer";
      double v8 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
      v6 = objc_msgSend(v8, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v5));
      if (v6)
      {
        if (v5 == 3)
        {
          LODWORD(v6) = 3;
        }
        else
        {
          v6 = (void *)[v7 objectForKeyedSubscript:v6];
          if (v6)
          {
            if (objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"UpsamplingDisabled"), "BOOLValue"))LODWORD(v6) = 2; {
            else
            }
              LODWORD(v6) = 1;
          }
        }
      }
    }
  }
  return (int)v6;
}

- (BWVideoFormat)inputFormat
{
  return self->_inputFormat;
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

- (int)version
{
  return self->_version;
}

- (int)mode
{
  return self->_mode;
}

@end