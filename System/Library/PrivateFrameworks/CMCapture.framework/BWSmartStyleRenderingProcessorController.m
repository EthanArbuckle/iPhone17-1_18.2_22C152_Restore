@interface BWSmartStyleRenderingProcessorController
+ ($2825F4736939C4A6D3AD43837233062D)linearYUVIntermediateThumbnailDimensionsForStills;
+ (BOOL)usesCustomProcessingFlow;
+ (id)pixelBufferAttributesForSmallLightMap:(int)a3;
+ (id)pixelBufferAttributesWithCapacityForLearntCoefficients:(int)a3;
- ($2825F4736939C4A6D3AD43837233062D)linearYUVIntermediateThumbnailDimensions;
- (BWSmartStyleRenderingProcessorController)initWithConfiguration:(id)a3;
- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(void *)a4 additionalMetadata:(CFTypeRef *)a5 formatDescriptionInOut:;
- (double)_getDenormalizedFinalCropRectfromMetadata:(__CVBuffer *)a3 pixelBuffer:;
- (id)metalImageBufferProcessor;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)prepare;
- (int)process;
- (uint64_t)_loadSetupAndPrepareSmartStyleRenderingProcessor:(uint64_t)result;
- (uint64_t)_newLearningCoefficientsPixelBufferWithName:(uint64_t)result;
- (uint64_t)_newPixelBufferWithDimensions:(uint64_t)a3 pixelFormat:(uint64_t)a4 name:;
- (uint64_t)_newSmallLightMapPixelBufferWithName:(uint64_t)result;
- (uint64_t)_populateInputLinearPixelBufferColorManagementMetadata:(uint64_t)a1;
- (uint64_t)_setupConfigurationAndClasses:(uint64_t)a3 version:;
- (uint64_t)_tuningParameterVariantForCaptureType:(uint64_t)a3 captureFlags:;
- (void)dealloc;
- (void)updateSmartStyleProcessorConfigurationIfNeededForApplyOnly:(BOOL)a3;
@end

@implementation BWSmartStyleRenderingProcessorController

- (void)updateSmartStyleProcessorConfigurationIfNeededForApplyOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "linearSystemOrder");
  if (v3)
  {
    if (!v5) {
      return;
    }
    uint64_t v6 = [(id)objc_opt_class() getDefaultProcessorConfigurationForStreaming];
  }
  else
  {
    if (v5 == 1) {
      return;
    }
    uint64_t v6 = [(id)objc_opt_class() getDefaultProcessorConfigurationForStills];
  }
  uint64_t v7 = v6;
  smartStyleProcessor = self->_smartStyleProcessor;
  [(CMISmartStyleProcessor *)smartStyleProcessor setConfiguration:v7];
}

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

+ (id)pixelBufferAttributesWithCapacityForLearntCoefficients:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = BWStandardProcessorNameForBundleBaseName(@"CMI", @"SmartStyle", *(uint64_t *)&a3);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(BWLoadProcessorBundle(@"SmartStyle", v3), "classNamed:", v4), "getDefaultProcessorConfigurationForStills");
  return (id)[v5 pixelBufferAttributesWithCapacityForLearntCoefficients];
}

+ (id)pixelBufferAttributesForSmallLightMap:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = BWStandardProcessorNameForBundleBaseName(@"CMI", @"SmartStyle", *(uint64_t *)&a3);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(BWLoadProcessorBundle(@"SmartStyle", v3), "classNamed:", v4), "getDefaultProcessorConfigurationForStills");
  return (id)[v5 pixelBufferAttributesForSmallLightMap];
}

- (BWSmartStyleRenderingProcessorController)initWithConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWSmartStyleRenderingProcessorController;
  uint64_t v4 = [(BWStillImageProcessorController *)&v8 initWithName:@"SmartStyle" type:16 configuration:a3];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1A6272C70]();
    v4->_inferencesNotAvailableForSmartStyleRendering = [a3 inferencesNotAvailableForSmartStyleRendering];
    int v6 = -[BWSmartStyleRenderingProcessorController _loadSetupAndPrepareSmartStyleRenderingProcessor:]((uint64_t)v4, a3);
    v4->_reversibilityEnabled = [a3 reversibilityEnabled];
    if (v6)
    {

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareSmartStyleRenderingProcessor:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __93__BWSmartStyleRenderingProcessorController__loadSetupAndPrepareSmartStyleRenderingProcessor___block_invoke;
    v4[3] = &unk_1E5C26228;
    v4[4] = a2;
    result = BWLoadCreateAndSetupMetalImageBufferProcessor(@"SmartStyle", [a2 version], @"CMI", @"SmartStyle", objc_msgSend(a2, "version"), (uint64_t)&unk_1EFB6FEA8, 0, objc_msgSend(a2, "sensorConfigurationsByPortType"), objc_msgSend(a2, "metalCommandQueue"), (uint64_t)v4, (void *)(result + 56));
    if (!result)
    {
      result = -[BWSmartStyleRenderingProcessorController _setupConfigurationAndClasses:version:](v3, *(void **)(v3 + 56), [a2 version]);
      if (!result)
      {
        [*(id *)(v3 + 56) setUseLiveMetalAllocations:1];
        return 0;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  [(BWSmartStyleRenderingProcessorController *)self reset];

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  smartStyleLinearThumbnailFormatDescription = self->_smartStyleLinearThumbnailFormatDescription;
  if (smartStyleLinearThumbnailFormatDescription) {
    CFRelease(smartStyleLinearThumbnailFormatDescription);
  }
  smartStyleStyledThumbnailFormatDescription = self->_smartStyleStyledThumbnailFormatDescription;
  if (smartStyleStyledThumbnailFormatDescription) {
    CFRelease(smartStyleStyledThumbnailFormatDescription);
  }
  smallLightMapFormatDescription = self->_smallLightMapFormatDescription;
  if (smallLightMapFormatDescription) {
    CFRelease(smallLightMapFormatDescription);
  }
  coefficientsFormatDescription = self->_coefficientsFormatDescription;
  if (coefficientsFormatDescription) {
    CFRelease(coefficientsFormatDescription);
  }
  reverseCoefficientsFormatDescription = self->_reverseCoefficientsFormatDescription;
  if (reverseCoefficientsFormatDescription) {
    CFRelease(reverseCoefficientsFormatDescription);
  }
  personSegmentationFormatDescription = self->_personSegmentationFormatDescription;
  if (personSegmentationFormatDescription) {
    CFRelease(personSegmentationFormatDescription);
  }
  skinSegmentationFormatDescription = self->_skinSegmentationFormatDescription;
  if (skinSegmentationFormatDescription) {
    CFRelease(skinSegmentationFormatDescription);
  }
  skySegmentationFormatDescription = self->_skySegmentationFormatDescription;
  if (skySegmentationFormatDescription) {
    CFRelease(skySegmentationFormatDescription);
  }
  v12.receiver = self;
  v12.super_class = (Class)BWSmartStyleRenderingProcessorController;
  [(BWStillImageProcessorController *)&v12 dealloc];
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  int v6 = [(BWStillImageProcessorControllerRequest *)[BWSmartStyleRenderingProcessorControllerRequest alloc] initWithInput:a3 delegate:a4];
  if (v6) {
    int v7 = 0;
  }
  else {
    int v7 = -12786;
  }
  if (a5) {
    *a5 = v7;
  }
  return v6;
}

- (int)prepare
{
  int v3 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor prepareToProcess:13];
  if (!v3) {
    [(BWStillImageProcessorController *)self currentRequest];
  }
  return v3;
}

- (int)process
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  uint64_t v177 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v172 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v173 = [MEMORY[0x1E4F1CA60] dictionary];
  v186 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  double v5 = v4;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  double v7 = v6;
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  double v9 = v8;
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  double v11 = v10;
  if (dword_1EB4C5590)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v13 = [(BWStillImageProcessorController *)self currentRequest];
  v14 = v13;
  if (!v13)
  {
    int v190 = 0;
    v178 = 0;
    cf = 0;
    v29 = 0;
    v183 = 0;
    v180 = 0;
    v37 = 0;
    v191 = 0;
    id v187 = 0;
    id v17 = 0;
    goto LABEL_130;
  }
  int v176 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v13 input] applyOnly];
  int v15 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] captureSettings] captureType];
  uint64_t v16 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] captureStreamSettings] captureFlags];
  if ((BWStillImageProcessingFlagsForSampleBuffer((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame]) & 0x100000) != 0)
  {
    v178 = 0;
    cf = 0;
    v29 = 0;
    v182 = 0;
    v183 = 0;
    v180 = 0;
    v37 = 0;
    v191 = 0;
    v192 = 0;
    id v187 = 0;
    id v17 = 0;
    v42 = 0;
    uint64_t v99 = 0;
    int v190 = 1;
    goto LABEL_102;
  }
  id v17 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
  if (!v17)
  {
    uint64_t v165 = v2;
    LODWORD(v163) = 0;
    FigDebugAssert3();
    int v190 = 0;
    v178 = 0;
    cf = 0;
    v29 = 0;
    v182 = 0;
    v183 = 0;
    v180 = 0;
    v37 = 0;
    v191 = 0;
    v192 = 0;
    id v187 = 0;
    v42 = 0;
    uint64_t v99 = 4294954514;
    goto LABEL_102;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame]);
  if (!ImageBuffer) {
    goto LABEL_127;
  }
  v19 = ImageBuffer;
  v20 = (const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame];
  kedouble y = (const __CFString *)*MEMORY[0x1E4F53070];
  CFTypeRef v21 = CMGetAttachment(v20, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v21) {
    goto LABEL_127;
  }
  v22 = (void *)v21;
  uint64_t v23 = -[BWSmartStyleRenderingProcessorController _tuningParameterVariantForCaptureType:captureFlags:]((uint64_t)self, v15, v16);
  [v186 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F53528]];
  v205.origin.double x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v22, v19);
  double x = v205.origin.x;
  double y = v205.origin.y;
  double width = v205.size.width;
  double height = v205.size.height;
  if (CGRectIsNull(v205))
  {
LABEL_127:
    int v190 = 0;
    v178 = 0;
    cf = 0;
LABEL_129:
    v29 = 0;
    v183 = 0;
    v180 = 0;
    v37 = 0;
    v191 = 0;
    id v187 = 0;
LABEL_130:
    v182 = 0;
    v42 = 0;
    v192 = 0;
    goto LABEL_64;
  }
  uint64_t v28 = BWStillImageBufferTypeToShortString(46);
  v29 = (__CVBuffer *)-[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:]((uint64_t)self, (int)v5 | ((unint64_t)(int)v7 << 32), 1111970369, v28);
  if (!v29)
  {
    int v190 = 0;
    v178 = 0;
    cf = 0;
LABEL_140:
    v182 = 0;
    v183 = 0;
    v180 = 0;
    v37 = 0;
    v191 = 0;
    v192 = 0;
    id v187 = 0;
LABEL_156:
    v42 = 0;
LABEL_157:
    uint64_t v99 = 4294954510;
    goto LABEL_102;
  }
  uint64_t v30 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "downScalePixelBuffer:toPixelBuffer:inputROI:", v19, v29, x, y, width, height);
  cf = v29;
  if (v30)
  {
    uint64_t v99 = v30;
    int v190 = 0;
    v178 = 0;
    v29 = 0;
    v182 = 0;
    v183 = 0;
    v180 = 0;
    v37 = 0;
    v191 = 0;
    v192 = 0;
LABEL_143:
    id v187 = 0;
    v42 = 0;
    goto LABEL_102;
  }
  uint64_t v31 = [(FigCaptureStillImageSettings *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] settings] smartStyle];
  if (!v31
    || (v175 = [[BWStillImageSmartStyle alloc] initWithSmartStyle:v31]) == 0)
  {
    int v190 = 0;
    v178 = 0;
    goto LABEL_129;
  }
  objc_msgSend(v17, "setSemanticStyleSceneType:", objc_msgSend(-[BWStillImageCaptureSettings metadata](-[BWStillImageProcessorControllerInput captureSettings](-[BWStillImageProcessorControllerRequest input](v14, "input"), "captureSettings"), "metadata"), "semanticStyleSceneType"));
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(-[BWStillImageCaptureSettings metadata](-[BWStillImageProcessorControllerInput captureSettings](-[BWStillImageProcessorControllerRequest input](v14, "input"), "captureSettings"), "metadata"), "semanticStyleSceneType"));
  [v22 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F534B0]];
  unsigned int v33 = CVPixelBufferGetWidth(v19);
  uint64_t v34 = [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v14 delegate] processorController:self newOutputPixelBufferForProcessorInput:[(BWStillImageProcessorControllerRequest *)v14 input] type:1 dimensions:v33 | ((unint64_t)CVPixelBufferGetHeight(v19) << 32)];
  if (!v34)
  {
    int v190 = 0;
    v178 = 0;
    v29 = 0;
    goto LABEL_140;
  }
  v192 = (__CVBuffer *)v34;
  if (BWIsSmartStyleAllowedForAdjustedImage([(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] stillImageSettings]))
  {
    uint64_t v35 = BWStillImageBufferTypeToShortString(42);
    uint64_t v36 = -[BWSmartStyleRenderingProcessorController _newLearningCoefficientsPixelBufferWithName:]((uint64_t)self, v35);
    if (!v36)
    {
      int v190 = 0;
      v178 = 0;
      v29 = 0;
      v183 = 0;
      v180 = 0;
      v37 = 0;
      v191 = 0;
LABEL_155:
      id v187 = 0;
      v182 = 0;
      goto LABEL_156;
    }
  }
  else
  {
    uint64_t v36 = 0;
  }
  v191 = (__CVBuffer *)v36;
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA74720);
  v188 = v22;
  if (AttachedMedia)
  {
    v39 = AttachedMedia;
    CVImageBufferRef v40 = CMSampleBufferGetImageBuffer(AttachedMedia);
    if (v40)
    {
      v41 = v40;
      v42 = (void *)CMGetAttachment(v39, key, 0);
      if (!v42)
      {
        int v190 = 0;
        v178 = 0;
        v29 = 0;
        v182 = 0;
        v183 = 0;
        v180 = 0;
        v37 = 0;
        id v187 = 0;
        goto LABEL_64;
      }
      double v181 = v11;
      double v184 = v9;
      double v43 = height;
      double v44 = width;
      double v45 = y;
      double v46 = x;
      v206.origin.double x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v42, v41);
      double v47 = v206.origin.x;
      double v48 = v206.origin.y;
      double v49 = v206.size.width;
      double v50 = v206.size.height;
      if (!CGRectIsNull(v206))
      {
        unint64_t v51 = psn_pixelBufferDimensions(v41);
        v211.size.double width = (double)(int)v51;
        v211.size.double height = (double)SHIDWORD(v51);
        v211.origin.double x = 0.0;
        v211.origin.double y = 0.0;
        v207.origin.double x = v47;
        v207.origin.double y = v48;
        v207.size.double width = v49;
        v207.size.double height = v50;
        CGRectEqualToRect(v207, v211);
        objc_msgSend(v17, "setInputLinearCropRect:", v47, v48, v49, v50);
        double x = v46;
        double y = v45;
        double width = v44;
        double height = v43;
        double v11 = v181;
        double v9 = v184;
        goto LABEL_25;
      }
    }
LABEL_131:
    int v190 = 0;
    v178 = 0;
LABEL_146:
    v29 = 0;
    v183 = 0;
    v180 = 0;
LABEL_147:
    v37 = 0;
    id v187 = 0;
    v182 = 0;
    goto LABEL_63;
  }
  v52 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA748E0);
  if (!v52) {
    goto LABEL_131;
  }
  v42 = v22;
  v41 = CMSampleBufferGetImageBuffer(v52);
  if (!v41) {
    goto LABEL_131;
  }
LABEL_25:
  uint64_t v53 = -[BWSmartStyleRenderingProcessorController _populateInputLinearPixelBufferColorManagementMetadata:]((uint64_t)self, v41);
  if (v53)
  {
    uint64_t v99 = v53;
    int v190 = 0;
    v178 = 0;
    v29 = 0;
    v182 = 0;
    v183 = 0;
    v180 = 0;
    goto LABEL_142;
  }
  uint64_t v54 = BWStillImageBufferTypeToShortString(47);
  uint64_t v55 = -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:]((uint64_t)self, (int)v9 | ((unint64_t)(int)v11 << 32), 2019963440, v54);
  if (!v55)
  {
    int v190 = 0;
    v178 = 0;
LABEL_152:
    v29 = 0;
    v183 = 0;
    v180 = 0;
LABEL_154:
    v37 = 0;
    goto LABEL_155;
  }
  v56 = (__CVBuffer *)v55;
  [v17 setInputLinearPixelBuffer:v41];
  [v17 setOutputCodedLinearThumbnailPixelBuffer:v56];
  [v17 setOutputCodedLinearThumbnailMetadata:v177];
  uint64_t v174 = (uint64_t)v42;
  v178 = v56;
  if (v176)
  {
    rect.origin.double x = 0.0;
    rect.origin.double y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    *(CGSize *)v185 = _Q0;
    rect.size = _Q0;
    v62 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA74840);
    v63 = v192;
    if (v62)
    {
      CVImageBufferRef v64 = CMSampleBufferGetImageBuffer(v62);
      if (v64)
      {
        CVImageBufferRef v65 = v64;
        CFDictionaryRef v66 = (const __CFDictionary *)[v188 objectForKeyedSubscript:*MEMORY[0x1E4F534F8]];
        if (v66 && !CGRectMakeWithDictionaryRepresentation(v66, &rect))
        {
          uint64_t v165 = v2;
          LODWORD(v163) = 0;
          FigDebugAssert3();
          rect.origin.double x = 0.0;
          rect.origin.double y = 0.0;
          rect.size = *(CGSize *)v185;
        }
        objc_msgSend(v17, "setInputUnstyledPixelBuffer:", v19, v163, v165);
        [v17 setInputMetadataDict:v188];
        [v17 setInputLinearMetadataDict:v42];
        objc_msgSend(v17, "setInputUnstyledCropRect:", x, y, width, height);
        [v17 setInputUnstyledThumbnailPixelBuffer:v29];
        [v17 setOutputStyledPixelBuffer:v192];
        objc_msgSend(v17, "setOutputStyledCropRect:", x, y, width, height);
        [v17 setInputStyleCoefficientsPixelBuffer:v65];
        objc_msgSend(v17, "setPrimaryCaptureRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        v67 = 0;
        v180 = 0;
        v182 = 0;
        uint64_t v68 = 20;
        goto LABEL_68;
      }
    }
    int v190 = 0;
    goto LABEL_146;
  }
  uint64_t v69 = BWStillImageBufferTypeToShortString(44);
  uint64_t v70 = -[BWSmartStyleRenderingProcessorController _newSmallLightMapPixelBufferWithName:]((uint64_t)self, v69);
  if (!v70)
  {
    int v190 = 0;
    goto LABEL_152;
  }
  v180 = (__CVBuffer *)v70;
  uint64_t v71 = BWStillImageBufferTypeToShortString(45);
  uint64_t v72 = -[BWSmartStyleRenderingProcessorController _newSmallLightMapPixelBufferWithName:]((uint64_t)self, v71);
  if (!v72)
  {
    int v190 = 0;
    v29 = 0;
    v183 = 0;
    goto LABEL_154;
  }
  v183 = (__CVBuffer *)v72;
  uint64_t v73 = [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v14 delegate] processorController:self newInferencesForProcessorInput:[(BWStillImageProcessorControllerRequest *)v14 input]];
  if (!v73)
  {
    int v190 = 0;
    v29 = 0;
    goto LABEL_147;
  }
  v182 = (void *)v73;
  v74 = (double *)MEMORY[0x1E4F1DB20];
  uint64_t v75 = *MEMORY[0x1E4F534E0];
  v76 = (void *)[v188 objectForKeyedSubscript:*MEMORY[0x1E4F534E0]];
  uint64_t v77 = *MEMORY[0x1E4F55E58];
  if ([v76 objectForKeyedSubscript:*MEMORY[0x1E4F55E58]]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v188, "objectForKeyedSubscript:", v75), "objectForKeyedSubscript:", v77), "floatValue");
  }
  else {
    float v78 = BWSmartStylePersonMasksValidHint(v188);
  }
  double v79 = *v74;
  double v80 = v74[1];
  double v82 = v74[2];
  double v81 = v74[3];
  float v171 = v78;
  objc_msgSend((id)objc_msgSend(v188, "objectForKeyedSubscript:", v75), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), v77);
  v83 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA74420);
  if (v83)
  {
    v84 = v83;
    v85 = CMSampleBufferGetImageBuffer(v83);
    if (v85)
    {
      v86 = (void *)CMGetAttachment(v84, key, 0);
      goto LABEL_45;
    }
LABEL_47:
    v170.size.double width = v82;
    v170.size.double height = v81;
    v170.origin.double x = v79;
    v170.origin.double y = v80;
    goto LABEL_48;
  }
  v85 = (__CVBuffer *)[v182 inferenceBufferForAttachedMediaKey:0x1EFA74420];
  if (!v85) {
    goto LABEL_47;
  }
  v86 = (void *)[v182 metadataForAttachedMediaKey:0x1EFA74420];
LABEL_45:
  v208.origin.double x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v86, v85);
  CGRect v170 = v208;
  if (CGRectIsNull(v208)) {
    goto LABEL_62;
  }
LABEL_48:
  v87 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], @"PersonSemanticsSkin");
  if (!v87)
  {
    uint64_t v92 = [v182 inferenceBufferForAttachedMediaKey:@"PersonSemanticsSkin"];
    if (v92)
    {
      v93 = (__CVBuffer *)v92;
      v91 = (void *)[v182 metadataForAttachedMediaKey:@"PersonSemanticsSkin"];
      v90 = v93;
      goto LABEL_53;
    }
LABEL_55:
    v168 = 0;
    v169.size.double width = v82;
    v169.size.double height = v81;
    v169.origin.double x = v79;
    v169.origin.double y = v80;
    goto LABEL_56;
  }
  v88 = v87;
  CVImageBufferRef v89 = CMSampleBufferGetImageBuffer(v87);
  if (!v89) {
    goto LABEL_55;
  }
  v90 = v89;
  v91 = (void *)CMGetAttachment(v88, key, 0);
LABEL_53:
  v209.origin.double x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v91, v90);
  CGRect v169 = v209;
  if (CGRectIsNull(v209))
  {
LABEL_62:
    int v190 = 0;
    v29 = 0;
    v37 = 0;
    id v187 = 0;
LABEL_63:
    v42 = 0;
LABEL_64:
    uint64_t v99 = 4294954516;
    goto LABEL_102;
  }
  v168 = v90;
LABEL_56:
  v94 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA745A0);
  if (!v94)
  {
    v96 = (__CVBuffer *)[v182 inferenceBufferForAttachedMediaKey:0x1EFA745A0];
    if (!v96)
    {
      uint64_t v166 = v23;
      v100 = v19;
      double v167 = height;
      uint64_t v97 = v174;
      goto LABEL_67;
    }
    v98 = (void *)[v182 metadataForAttachedMediaKey:0x1EFA745A0];
    uint64_t v97 = v174;
    goto LABEL_61;
  }
  v95 = v94;
  v96 = CMSampleBufferGetImageBuffer(v94);
  uint64_t v97 = v174;
  if (v96)
  {
    v98 = (void *)CMGetAttachment(v95, key, 0);
LABEL_61:
    v210.origin.double x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v98, v96);
    double v79 = v210.origin.x;
    double v80 = v210.origin.y;
    double v82 = v210.size.width;
    double v81 = v210.size.height;
    if (CGRectIsNull(v210)) {
      goto LABEL_62;
    }
  }
  uint64_t v166 = v23;
  v100 = v19;
  double v167 = height;
LABEL_67:
  [v17 setInputSmartStyle:objc_alloc_init(self->_smartStyleClass)];
  objc_msgSend((id)objc_msgSend(v17, "inputSmartStyle"), "setCastType:", -[BWStillImageSmartStyle cast](v175, "cast"));
  [(BWStillImageSmartStyle *)v175 intensity];
  int v102 = v101;
  v103 = (void *)[v17 inputSmartStyle];
  LODWORD(v104) = v102;
  [v103 setCastIntensity:v104];
  [(BWStillImageSmartStyle *)v175 toneBias];
  int v106 = v105;
  v107 = (void *)[v17 inputSmartStyle];
  LODWORD(v108) = v106;
  [v107 setToneBias:v108];
  [(BWStillImageSmartStyle *)v175 colorBias];
  int v110 = v109;
  v111 = (void *)[v17 inputSmartStyle];
  LODWORD(v112) = v110;
  [v111 setColorBias:v112];
  v19 = v100;
  [v17 setInputUnstyledPixelBuffer:v100];
  double height = v167;
  objc_msgSend(v17, "setInputUnstyledCropRect:", x, y, width, v167);
  [v17 setInputMetadataDict:v188];
  [v17 setInputLinearMetadataDict:v97];
  [v17 setInputLinearPixelBuffer:v41];
  [v17 setInputPersonMaskPixelBuffer:v85];
  objc_msgSend(v17, "setInputPersonMaskCropRect:", v170.origin.x, v170.origin.y, v170.size.width, v170.size.height);
  [v17 setInputSkinMaskPixelBuffer:v168];
  objc_msgSend(v17, "setInputSkinMaskCropRect:", v169.origin.x, v169.origin.y, v169.size.width, v169.size.height);
  [v17 setInputSkyMaskPixelBuffer:v96];
  objc_msgSend(v17, "setInputSkyMaskCropRect:", v79, v80, v82, v81);
  [v17 setInputTuningType:v166];
  *(float *)&double v113 = v171;
  [v17 setPersonMasksValidHint:v113];
  v63 = v192;
  [v17 setOutputStyledPixelBuffer:v192];
  objc_msgSend(v17, "setOutputStyledCropRect:", x, y, width, v167);
  [v17 setOutputLearnedStyleCoefficientsPixelBuffer:v191];
  [v17 setOutputImageStatistics:v172];
  [v17 setOutputImageStatisticsExtended:v173];
  [v17 setOutputSmallLightMapPixelBuffer:v180];
  v67 = v183;
  [v17 setOutputSmallLinearLightMapPixelBuffer:v183];
  uint64_t v68 = 29;
LABEL_68:
  v183 = v67;
  [(CMISmartStyleProcessor *)self->_smartStyleProcessor setInputOutput:v17];
  uint64_t v114 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor prepareToProcess:v68];
  if (v114) {
    goto LABEL_132;
  }
  uint64_t v99 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor process];
  if (dword_1EB4C5590)
  {
    v115 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v63 = v192;
  }
  if (v99) {
    goto LABEL_133;
  }
  uint64_t v114 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor finishProcessing];
  if (v114)
  {
LABEL_132:
    uint64_t v99 = v114;
LABEL_133:
    int v190 = 0;
    v29 = 0;
LABEL_142:
    v37 = 0;
    goto LABEL_143;
  }
  v42 = (void *)-[BWSmartStyleRenderingProcessorController _newOutputSampleBufferFromSampleBuffer:pixelBuffer:additionalMetadata:formatDescriptionInOut:](self, (opaqueCMSampleBuffer *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], v63, v186, (CFTypeRef *)&self->_outputFormatDescription);
  if (!v42)
  {
    int v190 = 0;
    v29 = 0;
    v37 = 0;
    id v187 = 0;
    uint64_t v99 = 4294950489;
    goto LABEL_102;
  }
  uint64_t v201 = *MEMORY[0x1E4F533D0];
  v202 = &unk_1EFB05A48;
  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA74760, v19, (CFTypeRef *)&self->_outputFormatDescription, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v202 forKeys:&v201 count:1], 0, 1);
  int v116 = BWStillImageProcessingFlagsForSampleBuffer(v42);
  __int16 v117 = v116;
  BWStillImageSetProcessingFlagsForSampleBuffer(v42, v116 | 0x200000);
  v29 = 0;
  if ((v117 & 0x1000) != 0 || !self->_reversibilityEnabled)
  {
    v37 = 0;
    id v146 = 0;
LABEL_97:
    v145 = v191;
    goto LABEL_98;
  }
  if (![(FigCaptureStillImageSettings *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] settings] smartStyleReversibilitySupported])
  {
    v29 = 0;
    v37 = 0;
    id v146 = 0;
    goto LABEL_97;
  }
  id v187 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
  -[CMISmartStyleProcessor setConfiguration:](self->_smartStyleProcessor, "setConfiguration:", [(id)objc_opt_class() getDefaultProcessorConfigurationForStills]);
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  uint64_t v119 = (int)v118;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  uint64_t v121 = (int)v120;
  CFRelease(cf);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v19);
  uint64_t v123 = BWStillImageBufferTypeToShortString(46);
  uint64_t v124 = v119 | (v121 << 32);
  uint64_t v125 = -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:]((uint64_t)self, v124, PixelFormatType, v123);
  if (!v125)
  {
    int v190 = 0;
    cf = 0;
    v29 = 0;
LABEL_163:
    v37 = 0;
    goto LABEL_157;
  }
  v126 = (__CVBuffer *)v125;
  uint64_t v127 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "downScalePixelBuffer:toPixelBuffer:inputROI:", v19, v125, x, y, width, height);
  cf = v126;
  if (v127)
  {
    uint64_t v99 = v127;
    int v190 = 0;
    v29 = 0;
LABEL_165:
    v37 = 0;
    goto LABEL_102;
  }
  uint64_t v128 = CVPixelBufferGetPixelFormatType(v63);
  v29 = (__CVBuffer *)-[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:]((uint64_t)self, v124, v128, @"SmartStyleOutputStyledThumbnail");
  if (!v29)
  {
    int v190 = 0;
    goto LABEL_163;
  }
  uint64_t v129 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "downScalePixelBuffer:toPixelBuffer:inputROI:", v63, v29, x, y, width, height);
  if (v129)
  {
    uint64_t v99 = v129;
    int v190 = 0;
    goto LABEL_165;
  }
  [v187 setInputUnstyledThumbnailPixelBuffer:v29];
  [v187 setInputLearningTargetThumbnailPixelBuffer:v126];
  [v187 setOutputSmallLightMapPixelBuffer:0];
  [v187 setOutputSmallLinearLightMapPixelBuffer:0];
  uint64_t v130 = BWStillImageBufferTypeToShortString(43);
  v37 = (__CVBuffer *)-[BWSmartStyleRenderingProcessorController _newLearningCoefficientsPixelBufferWithName:]((uint64_t)self, v130);
  if (!v37)
  {
    int v190 = 0;
    goto LABEL_157;
  }
  [v187 setOutputLearnedStyleCoefficientsPixelBuffer:v37];
  [(CMISmartStyleProcessor *)self->_smartStyleProcessor setInputOutput:v187];
  uint64_t v131 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor prepareToProcess:1];
  if (v131
    || (uint64_t v131 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor process], v131)
    || (uint64_t v131 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor finishProcessing], v131)
    || (uint64_t v131 = [(CMISmartStyleProcessor *)self->_smartStyleProcessor resetState], v131))
  {
    uint64_t v99 = v131;
    int v190 = 0;
    goto LABEL_102;
  }
  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA74740, v178, (CFTypeRef *)&self->_smartStyleLinearThumbnailFormatDescription, v174, 0, 0);
  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA74780, v29, (CFTypeRef *)&self->_smartStyleStyledThumbnailFormatDescription, 0, 0, 1);
  v132 = (void *)CMGetAttachment(v42, key, 0);
  [v132 setObject:v177 forKeyedSubscript:*MEMORY[0x1E4F53508]];
  [v132 setObject:v172 forKeyedSubscript:*MEMORY[0x1E4F534D8]];
  uint64_t v133 = *MEMORY[0x1E4F534E0];
  [v132 setObject:v173 forKeyedSubscript:*MEMORY[0x1E4F534E0]];
  v134 = (void *)[v188 objectForKeyedSubscript:v133];
  objc_msgSend((id)objc_msgSend(v132, "objectForKeyedSubscript:", v133), "setObject:forKeyedSubscript:", objc_msgSend(v134, "objectForKeyedSubscript:", *MEMORY[0x1E4F55E58]), *MEMORY[0x1E4F55E58]);
  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA747C0, v37, (CFTypeRef *)&self->_reverseCoefficientsFormatDescription, 0, 0, 1);
  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA747E0, v180, (CFTypeRef *)&self->_smallLightMapFormatDescription, 0, 0, 1);
  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA74800, v183, (CFTypeRef *)&self->_smallLightMapFormatDescription, 0, 0, 1);
  if (!v176) {
    goto LABEL_94;
  }
  v135 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], @"HumanFullBodiesMask");
  if (!v135) {
    goto LABEL_159;
  }
  CVImageBufferRef v136 = CMSampleBufferGetImageBuffer(v135);
  if (!v136) {
    goto LABEL_159;
  }
  v137 = v136;
  uint64_t v199 = *MEMORY[0x1E4F55AB0];
  uint64_t v200 = [NSNumber numberWithUnsignedInt:0x10000];
  uint64_t v138 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v200 forKeys:&v199 count:1];
  uint64_t v197 = *MEMORY[0x1E4F55B80];
  uint64_t v198 = v138;
  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA74420, v137, (CFTypeRef *)&self->_personSegmentationFormatDescription, 0, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v197 count:1], 1);
  uint64_t v195 = *MEMORY[0x1E4F55BC0];
  uint64_t v196 = [NSNumber numberWithUnsignedInt:0x10000];
  uint64_t v139 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v196 forKeys:&v195 count:1];
  uint64_t v193 = *MEMORY[0x1E4F55B88];
  uint64_t v194 = v139;
  v140 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
  v141 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], @"HumanSkinsMask");
  if (!v141
    || (v142 = CMSampleBufferGetImageBuffer(v141)) == 0
    || (BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, @"PersonSemanticsSkin", v142, (CFTypeRef *)&self->_skinSegmentationFormatDescription, 0, v140, 1), (v143 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA74700)) == 0)|| (v144 = CMSampleBufferGetImageBuffer(v143)) == 0)
  {
LABEL_159:
    int v190 = 0;
    goto LABEL_64;
  }
  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA745A0, v144, (CFTypeRef *)&self->_skySegmentationFormatDescription, 0, v140, 1);
LABEL_94:
  v145 = v191;
  id v146 = v187;
LABEL_98:
  id v187 = v146;
  if (v145)
  {
    BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v42, 0x1EFA747A0, v145, (CFTypeRef *)&self->_coefficientsFormatDescription, 0, 0, 1);
    int v190 = 0;
  }
  else
  {
    int v190 = 0;
    v191 = 0;
  }
  uint64_t v99 = 0;
LABEL_102:
  BWSampleBufferRemoveAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA74840);
  BWSampleBufferRemoveAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA748E0);
  BWSampleBufferRemoveAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame], 0x1EFA74720);
  BWSampleBufferRemoveAttachedMedia(v42, 0x1EFA74840);
  BWSampleBufferRemoveAttachedMedia(v42, 0x1EFA74720);
  BWSampleBufferRemoveAttachedMedia(v42, 0x1EFA748E0);
  BWSampleBufferRemoveAttachedMedia(v42, @"HumanFullBodiesMask");
  BWSampleBufferRemoveAttachedMedia(v42, @"HumanSkinsMask");
  BWSampleBufferRemoveAttachedMedia(v42, 0x1EFA74700);
  if (v99)
  {
    uint64_t v147 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
    uint64_t v148 = [NSString stringWithFormat:@"[Photographic Styles] %@ Rendering failed with err:%d", v147, v99];
    FigCapturePromptOpenTapToRadar(@"Photographic Styles Rendering Failed. Please file a radar.", v148, [NSString stringWithFormat:@"Photographic Styles rendering failed with err:%d, for captureID:%lld while I was... {Please embellish with any details about the scene, subject, or other such information}", v99, -[FigCaptureStillImageSettings settingsID](-[BWStillImageProcessorControllerInput settings](-[BWStillImageProcessorControllerRequest input](v14, "input"), "settings"), "settingsID")], 3, 6, 6, 0.0);
    v149 = (const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame];
    int v150 = 0x800000;
LABEL_106:
    BWStillImageSetProcessingFlagsForSampleBuffer(v149, v150);
    uint64_t v151 = [(BWStillImageProcessorControllerRequest *)v14 delegate];
    uint64_t v152 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame];
    uint64_t v153 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputBufferType];
    uint64_t v154 = [(BWStillImageProcessorControllerRequest *)v14 input];
    v155 = (void *)v151;
    v156 = self;
    v157 = (void *)v152;
    uint64_t v158 = v153;
    goto LABEL_107;
  }
  if (v190)
  {
    v149 = (const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputFrame];
    int v150 = 0x2000000;
    goto LABEL_106;
  }
  uint64_t v160 = [(BWStillImageProcessorControllerRequest *)v14 delegate];
  uint64_t v161 = [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v14 input] inputBufferType];
  uint64_t v154 = [(BWStillImageProcessorControllerRequest *)v14 input];
  v155 = (void *)v160;
  v156 = self;
  v157 = v42;
  uint64_t v158 = v161;
LABEL_107:
  [v155 processorController:v156 didFinishProcessingSampleBuffer:v157 type:v158 processorInput:v154 err:0];

  if (v42) {
    CFRelease(v42);
  }
  if (v192) {
    CFRelease(v192);
  }
  if (v178) {
    CFRelease(v178);
  }
  if (v37) {
    CFRelease(v37);
  }
  if (v191) {
    CFRelease(v191);
  }
  if (v180) {
    CFRelease(v180);
  }
  if (v183) {
    CFRelease(v183);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v29) {
    CFRelease(v29);
  }

  return 0;
}

- (uint64_t)_tuningParameterVariantForCaptureType:(uint64_t)a3 captureFlags:
{
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F55E70];
    switch(a2)
    {
      case 1:
      case 7:
        uint64_t v3 = MEMORY[0x1E4F55EA0];
        break;
      case 2:
        uint64_t v3 = MEMORY[0x1E4F55E88];
        break;
      case 10:
        uint64_t v3 = MEMORY[0x1E4F55E90];
        break;
      case 11:
        uint64_t v3 = MEMORY[0x1E4F55E78];
        if ((a3 & 0x800000000) == 0) {
          uint64_t v3 = MEMORY[0x1E4F55E90];
        }
        break;
      case 12:
        uint64_t v3 = MEMORY[0x1E4F55E68];
        break;
      default:
        break;
    }
    if ((~a3 & 0x100000080) == 0) {
      uint64_t v3 = MEMORY[0x1E4F55E80];
    }
    return *(void *)v3;
  }
  return result;
}

- (double)_getDenormalizedFinalCropRectfromMetadata:(__CVBuffer *)a3 pixelBuffer:
{
  if (!a1) {
    return 0.0;
  }
  double x = *MEMORY[0x1E4F1DB20];
  if (a2)
  {
    if (a3)
    {
      double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      int v15 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F53538]];
      objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F535F8]), "doubleValue");
      FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(Width, Height, FinalCropRect, v8, v10, v12, v16);
      double x = v18.origin.x;
      if (CGRectIsNull(v18)) {
        FigDebugAssert3();
      }
    }
  }
  return x;
}

- (uint64_t)_newPixelBufferWithDimensions:(uint64_t)a3 pixelFormat:(uint64_t)a4 name:
{
  if (!a1) {
    return 0;
  }
  id v4 = +[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:](BWOnDemandPixelBufferAllocator, "onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:", a2, a3, a4, +[BWMemoryPool sharedMemoryPool]);
  if (!v4)
  {
    FigDebugAssert3();
    return 0;
  }
  return [v4 newPixelBuffer];
}

- (uint64_t)_newLearningCoefficientsPixelBufferWithName:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStills"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D70]), "intValue");
    unsigned int v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "intValue");
    unint64_t v7 = v6 | (unint64_t)(objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue") << 32);
    return -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:](v3, v7, v5, a2);
  }
  return result;
}

- (uint64_t)_populateInputLinearPixelBufferColorManagementMetadata:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (pixelBuffer)
  {
    CVPixelBufferGetPixelFormatType(pixelBuffer);
    __int16 v3 = CMIGetPixelFormatInfo();
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F24A90];
    if (CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24A90], 0))
    {
      if ((v3 & 0x100) == 0)
      {
LABEL_9:
        CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F24BC8];
        if (!CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24BC8], 0)) {
          CVBufferSetAttachment(pixelBuffer, v6, (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
        }
        return 0;
      }
    }
    else
    {
      CVBufferSetAttachment(pixelBuffer, v4, (CFTypeRef)*MEMORY[0x1E4F24AC0], kCVAttachmentMode_ShouldPropagate);
      if ((v3 & 0x100) == 0) {
        goto LABEL_9;
      }
    }
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F24C18];
    if (!CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24C18], 0)) {
      CVBufferSetAttachment(pixelBuffer, v5, (CFTypeRef)*MEMORY[0x1E4F24C40], kCVAttachmentMode_ShouldPropagate);
    }
    goto LABEL_9;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (uint64_t)_newSmallLightMapPixelBufferWithName:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    CFStringRef v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStills"), "pixelBufferAttributesForSmallLightMap");
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D70]), "intValue");
    unsigned int v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "intValue");
    unint64_t v7 = v6 | (unint64_t)(objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue") << 32);
    return -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:](v3, v7, v5, a2);
  }
  return result;
}

- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(void *)a4 additionalMetadata:(CFTypeRef *)a5 formatDescriptionInOut:
{
  if (result)
  {
    unsigned int v6 = 0;
    CMAttachmentBearerRef target = 0;
    int v7 = -12780;
    if (a2 && a3)
    {
      int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a5, (CMSampleBufferRef *)&target);
      if (CopyWithNewPixelBuffer)
      {
        int v7 = CopyWithNewPixelBuffer;
        unsigned int v6 = 0;
      }
      else
      {
        CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F53070];
        unsigned int v6 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
        if ([a4 count]) {
          [v6 addEntriesFromDictionary:a4];
        }
        CMSetAttachment(target, v10, v6, 1u);
        BWSampleBufferPropagateAttachedMedia(a2, target);
        int v7 = 0;
      }
    }

    result = target;
    if (v7)
    {
      if (target)
      {
        CFRelease(target);
        return 0;
      }
    }
  }
  return result;
}

- (id)metalImageBufferProcessor
{
  return self->_smartStyleProcessor;
}

- ($2825F4736939C4A6D3AD43837233062D)linearYUVIntermediateThumbnailDimensions
{
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  uint64_t v4 = (int)v3;
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  return ($2825F4736939C4A6D3AD43837233062D)(v4 | ((unint64_t)(int)v5 << 32));
}

+ ($2825F4736939C4A6D3AD43837233062D)linearYUVIntermediateThumbnailDimensionsForStills
{
  [MEMORY[0x1E4F55F08] intermediateStyleRendererThumbnailSizeForUseCase:1];
  return ($2825F4736939C4A6D3AD43837233062D)((int)v2 | ((unint64_t)(int)v3 << 32));
}

uint64_t __93__BWSmartStyleRenderingProcessorController__loadSetupAndPrepareSmartStyleRenderingProcessor___block_invoke(uint64_t a1, void *a2)
{
  double v3 = NSString;
  int v4 = [*(id *)(a1 + 32) deferredPhotoProcessorEnabled];
  double v5 = @"Still";
  if (v4) {
    double v5 = @"Still-Deferred";
  }
  [a2 setInstanceLabel:objc_msgSend(v3, "stringWithFormat:", @"%@", v5)];
  return 0;
}

- (uint64_t)_setupConfigurationAndClasses:(uint64_t)a3 version:
{
  if (result)
  {
    uint64_t v5 = result;
    int v6 = *(unsigned __int8 *)(result + 153);
    int v7 = objc_opt_class();
    if (v6) {
      uint64_t v8 = [v7 getDefaultProcessorConfigurationForStreaming];
    }
    else {
      uint64_t v8 = [v7 getDefaultProcessorConfigurationForStills];
    }
    [a2 setConfiguration:v8];
    if ([a2 configuration]
      && ([a2 setShouldFlushCVMTLTextureCacheAfterProcessing:1],
          Class v9 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleV%d", a3)), (*(void *)(v5 + 136) = v9) != 0)&& (v10 = NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorInputOutputV%d", a3)), (*(void *)(v5 + 144) = v10) != 0))
    {
      return 0;
    }
    else
    {
      return 4294954510;
    }
  }
  return result;
}

@end