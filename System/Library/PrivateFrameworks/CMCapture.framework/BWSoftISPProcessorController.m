@interface BWSoftISPProcessorController
+ (BOOL)usesCustomProcessingFlow;
- (BOOL)_faceDetectionEnabledForFrame:(BOOL)result processingMode:(CMAttachmentBearerRef)target captureType:(int)a3 captureFlags:(int)a4;
- (BOOL)_gnuEnabledForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:;
- (BOOL)_opcEnabledForFrame:(uint64_t)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:;
- (BOOL)_rnfEnabledForFrame:(int)a3 processingMode:(char)a4 captureFlags:;
- (BOOL)_sfhrEnabledForFrame:(unsigned int)a3 processingMode:(int)a4 captureType:(uint64_t)a5 captureFlags:(char)a6 captureFrameFlags:(uint64_t)a7 tuningType:;
- (BWSoftISPProcessorController)initWithConfiguration:(id)a3;
- (__CVBuffer)newOutputAuxiliaryPixelBufferForUniqueID:(unint64_t)a3 pixelFormat:(unsigned int)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (__CVBuffer)newOutputPixelBufferForUniqueID:(unint64_t)a3 pixelFormat:(unsigned int)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (double)_awbRegionOfInterestWithinSensorCropRectForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:;
- (double)_outputBufferRectWithinSensorCropRectForFrame:(void *)a1;
- (id)_addFrame:(id *)result;
- (id)_lossyCompressionLevelByPipelineType;
- (id)_prepareDescriptorByPipelineTypeForResolutionFlavors:(id)result;
- (id)externalMemoryDescriptorForResolutionFlavors:(id)a3;
- (id)metalImageBufferProcessor;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)prepare;
- (int)process;
- (uint64_t)_awbModeForFrame:(int)a3 processingMode:(int)a4 captureType:(unint64_t)a5 captureFlags:(unint64_t)a6 captureFrameFlags:;
- (uint64_t)_awbPurgeResourcesForFrameCount:(unint64_t)a3 captureFlags:;
- (uint64_t)_loadSetupAndPrepareSoftISPProcessor;
- (uint64_t)_pipelineTypeForCaptureType:(uint64_t)a3 captureFlags:(int)a4 processingMode:(int)a5 gdcEnabled:(int)a6 isQuadra:;
- (uint64_t)_rawMBNREnabledForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:;
- (uint64_t)_tuningTypeForFrame:(int)a3 processingMode:(int)a4 captureType:(uint64_t)a5 captureFlags:(char)a6 captureFrameFlags:;
- (unint64_t)_hrEnabledForFrame:(unsigned int)a3 processingMode:(unint64_t)a4 captureFlags:(char)a5 captureFrameFlags:;
- (unint64_t)_ltmModeForFrame:(int)a3 processingMode:(int)a4 captureType:(unint64_t)a5 captureFlags:(char)a6 captureFrameFlags:;
- (unsigned)outputPixelFormatForCaptureType:(int)a3 captureFlags:(unint64_t)a4 processingMode:(int)a5;
- (unsigned)outputPixelFormatForCaptureType:(int)a3 captureFlags:(unint64_t)a4 processingMode:(int)a5 isQuadra:(BOOL)a6;
- (unsigned)outputPixelFormatForCaptureType:(int)a3 processingMode:(int)a4;
- (unsigned)outputPixelFormatForInput:(id)a3;
- (void)_allowUnclampedOutputsForFrame:(int)a3 processingMode:;
- (void)_auxiliaryTypesForFrame:(int)a3 captureType:(int)a4 captureFlags:(int)a5 deliverDeferredPhotoProxyImage:;
- (void)dealloc;
- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4;
- (void)outputFrameEnqueued:(id)a3;
- (void)reset;
@end

@implementation BWSoftISPProcessorController

- (id)_prepareDescriptorByPipelineTypeForResolutionFlavors:(id)result
{
  if (result)
  {
    v3 = result;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = (void *)[v3 configuration];
    if ([a2 containsObject:&unk_1EFAFE760])
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v3, "configuration"), "inputDimensions");
      unint64_t v7 = v6 & 0xFFFFFFFF00000000;
      uint64_t v8 = v6;
    }
    else
    {
      unint64_t v7 = 0;
      uint64_t v8 = 0;
    }
    if (objc_msgSend(a2, "containsObject:", &unk_1EFAFE778, v4))
    {
      v9 = (void *)BWDimensionsWithQSubResolutionFlavor((void *)[v5 inputDimensionsByQSubResolutionFlavorByPortType], 1);
      uint64_t v10 = FigCaptureLargestDimensionsFromDimensionsArray(v9);
      unint64_t v11 = v10 & 0xFFFFFFFF00000000;
      uint64_t v12 = v10;
    }
    else
    {
      uint64_t v12 = 0;
      unint64_t v11 = 0;
    }
    if ([a2 containsObject:&unk_1EFAFE790])
    {
      v13 = (void *)BWDimensionsWithQSubResolutionFlavor((void *)[v5 inputDimensionsByQSubResolutionFlavorByPortType], 2);
      unint64_t v14 = FigCaptureLargestDimensionsFromDimensionsArray(v13);
      int v15 = v14;
      unint64_t v16 = HIDWORD(v14);
    }
    else
    {
      int v15 = 0;
      unint64_t v16 = 0;
    }
    v30 = (void *)[MEMORY[0x1E4F1CA48] array];
    v17 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = v8 | v7;
    if (FigCaptureVideoDimensionsAreValid(v8 | v7))
    {
      [v30 addObject:FigCaptureDictionaryRepresentationForDimensions(v8 | v7)];
      [v17 addObject:FigCaptureDictionaryRepresentationForDimensions(v8 | v7)];
    }
    if (FigCaptureVideoDimensionsAreValid(v11 | v12) && !FigCaptureVideoDimensionsAreEqual(v18, v11 | v12))
    {
      [v30 addObject:FigCaptureDictionaryRepresentationForDimensions(v11 | v12)];
      [v17 addObject:FigCaptureDictionaryRepresentationForDimensions(v11 | v12)];
    }
    if (FigCaptureVideoDimensionsAreValid(v15 | (v16 << 32))) {
      [v30 addObject:FigCaptureDictionaryRepresentationForDimensions(v15 | (v16 << 32))];
    }
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v3, "configuration"), "sensorRawPixelFormat");
    if ([v5 standardYUVProcessingEnabled])
    {
      uint64_t v20 = FigCaptureLargestDimensionsFromDimensionsArray(v17);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v20, v19), &unk_1EFAFE7A8);
      if ([v5 gdcEnabled]) {
        objc_msgSend(v29, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v20, v19), &unk_1EFAFE7C0);
      }
    }
    if ([v5 rawNightModeEnabled])
    {
      uint64_t v21 = FigCaptureLargestDimensionsFromDimensionsArray(v17);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v21, v19), &unk_1EFAFE7D8);
    }
    if (([v5 deepFusionEnabled] & 1) != 0 || objc_msgSend(v5, "learnedNREnabled"))
    {
      uint64_t v22 = FigCaptureLargestDimensionsFromDimensionsArray(v17);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v22, v19), &unk_1EFAFE7F0);
      if ([v5 quadraProcessingEnabled])
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "configuration"), "outputDimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1EFAFE790)&& !objc_msgSend(v5, "qBinProcessingMode"))
        {
          v17 = v30;
        }
        uint64_t v23 = FigCaptureLargestDimensionsFromDimensionsArray(v17);
        objc_msgSend(v29, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v23, v19), &unk_1EFAFE808);
      }
    }
    if ([v5 qBinProcessingMode])
    {
      if (v15 >= 0) {
        int v24 = v15;
      }
      else {
        int v24 = v15 + 1;
      }
      uint64_t v25 = (v24 >> 1);
      if ((v16 & 0x80000000) == 0) {
        int v26 = v16;
      }
      else {
        int v26 = v16 + 1;
      }
      uint64_t v27 = (v26 >> 1);
      if ([v5 qBinProcessingMode]) {
        objc_msgSend(v29, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v25 | (v27 << 32), v19), &unk_1EFAFE820);
      }
      if (([v5 qBinProcessingMode] & 2) != 0) {
        objc_msgSend(v29, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v25 | (v27 << 32), v19), &unk_1EFAFE838);
      }
    }
    if ([v5 linearRGBForDisparityEnabled]) {
      objc_msgSend(v29, "setObject:forKeyedSubscript:", sipc_prepareDescriptor(v18, v19), &unk_1EFAFE850);
    }
    v28 = (void *)[v29 copy];

    return v28;
  }
  return result;
}

- (uint64_t)_loadSetupAndPrepareSoftISPProcessor
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v1 = a1;
  v2 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  if (a1[7]) {
    return 0;
  }
  v3 = (void *)[a1 configuration];
  id v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v35 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v37 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v36 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[FigCaptureCameraParameters commonNRFParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "commonNRFParameters"), @"NRFParameters");
  [v4 setObject:v6 forKeyedSubscript:@"Common"];
  v38 = v4;
  [v4 setObject:v5 forKeyedSubscript:@"DefaultSensorIDs"];
  int v7 = [+[FigCaptureCameraParameters sharedInstance] nrfVersion];
  if (!v7)
  {
    FigDebugAssert3();
    goto LABEL_30;
  }
  unsigned int v31 = v7;
  v32 = v1;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)[v3 sensorConfigurationsByPortType];
  uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v34 = *(void *)v40;
    uint64_t v10 = MEMORY[0x1E4F1CC08];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v13 = objc_msgSend((id)objc_msgSend(v3, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v12);
        uint64_t v14 = [v13 sensorIDString];
        int v15 = v3;
        objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[FigCaptureCameraParameters sensorIDFromSensorIDString:](FigCaptureCameraParameters, "sensorIDFromSensorIDString:", v14)), v12);
        [v5 setObject:v14 forKeyedSubscript:v12];
        uint64_t v16 = objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"SoftISPTuning");
        if (v16) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = v10;
        }
        uint64_t v18 = objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", @"ModuleConfig");
        if (v18) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = v10;
        }
        v44[1] = v19;
        uint64_t v45 = v14;
        v43[0] = @"SoftISPTuning";
        v43[1] = @"ModuleConfig";
        v44[0] = v17;
        v3 = v15;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
        objc_msgSend(v38, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1), v12);
        objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(v13, "cameraInfo"), v12);
        objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(v13, "moduleCalibration"), v12);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v9);
  }
  if (![v38 count])
  {
    uint64_t v28 = 4294954516;
    v1 = v32;
    v2 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    goto LABEL_34;
  }
  uint64_t v20 = BWLoadProcessorBundle(@"NRF", v31);
  v1 = v32;
  v2 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  if (!v20) {
    goto LABEL_30;
  }
  uint64_t v21 = v20;
  id v22 = objc_alloc_init((Class)[v20 classNamed:@"SoftISPProcessor"]);
  v32[7] = v22;
  if (!v22) {
    goto LABEL_30;
  }
  uint64_t v23 = BWAllStillImageQSubResolutionFlavors();
  int v24 = objc_msgSend(-[BWSoftISPProcessorController _prepareDescriptorByPipelineTypeForResolutionFlavors:](v32, v23), "allKeys");
  if (![v24 count])
  {
    uint64_t v28 = 4294954516;
    goto LABEL_34;
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v32[7], "setDeviceGeneration:", -[FigCaptureCameraParameters deviceGeneration](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deviceGeneration"));
  }
  [v32[7] setCameraInfoByPortType:v36];
  [v32[7] setModuleCalibrationByPortType:v37];
  [v32[7] setTuningParameters:v38];
  objc_msgSend(v32[7], "setMetalCommandQueue:", objc_msgSend(v3, "metalCommandQueue"));
  [v32[7] setSupportedPipelineTypes:v24];
  [v32[7] setOutputCompressionLevelByPipeline:-[BWSoftISPProcessorController _lossyCompressionLevelByPipelineType](v32)];
  uint64_t v25 = [v32[7] setup];
  if (v25)
  {
    uint64_t v28 = v25;
    goto LABEL_34;
  }
  id v26 = objc_alloc_init((Class)[v21 classNamed:@"SoftISPPrepareDescriptor"]);
  v32[8] = v26;
  if (!v26)
  {
LABEL_30:
    uint64_t v28 = 4294954510;
LABEL_34:

    *(id *)((char *)v1 + v2[778]) = 0;
    v29 = &OBJC_IVAR___BWSoftISPProcessorController__prepareDescriptor;

    uint64_t v27 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v32[8], "setInputPixelFormat:", objc_msgSend(v3, "sensorRawPixelFormat"));
  objc_msgSend(v32[8], "setMaximumWidth:", (int)objc_msgSend(v3, "inputDimensions"));
  objc_msgSend(v32[8], "setMaximumHeight:", objc_msgSend(v3, "inputDimensions") >> 32);
  [v32[8] setStageConfigMode:1];
  uint64_t v27 = [v35 copy];
  uint64_t v28 = 0;
  v29 = &OBJC_IVAR___BWSoftISPProcessorController__sensorIDByPortType;
LABEL_26:
  *(id *)((char *)v1 + *v29) = (id)v27;
  return v28;
}

- (unsigned)outputPixelFormatForCaptureType:(int)a3 processingMode:(int)a4
{
  return [(BWSoftISPProcessorController *)self outputPixelFormatForCaptureType:*(void *)&a3 captureFlags:0 processingMode:*(void *)&a4 isQuadra:0];
}

- (unsigned)outputPixelFormatForCaptureType:(int)a3 captureFlags:(unint64_t)a4 processingMode:(int)a5 isQuadra:(BOOL)a6
{
  uint64_t v7 = -[BWSoftISPProcessorController _pipelineTypeForCaptureType:captureFlags:processingMode:gdcEnabled:isQuadra:]((uint64_t)self, a3, a4, a5, 0, a6);
  processor = self->_processor;
  uint64_t v9 = [(BWStillImageProcessorControllerConfiguration *)[(BWStillImageProcessorController *)self configuration] sensorRawPixelFormat];
  return [(SoftISPProcessor *)processor outputPixelFormatForPipeline:v7 inputPixelFormat:v9];
}

- (uint64_t)_pipelineTypeForCaptureType:(uint64_t)a3 captureFlags:(int)a4 processingMode:(int)a5 gdcEnabled:(int)a6 isQuadra:
{
  if (result)
  {
    switch(a4)
    {
      case 0:
        unsigned int v6 = 0;
        BOOL v7 = 1;
        switch(a2)
        {
          case 1:
            if (a5) {
              unsigned int v6 = 19;
            }
            else {
              unsigned int v6 = 16;
            }
            BOOL v7 = (a3 & 0x80) == 0;
            if ((a3 & 0x80) != 0) {
              unsigned int v6 = 0;
            }
            goto LABEL_21;
          case 2:
          case 7:
          case 10:
            goto LABEL_4;
          case 11:
            if (a5) {
              unsigned int v6 = 19;
            }
            else {
              unsigned int v6 = 16;
            }
            if ((a3 & 0x800000000) != 0) {
              unsigned int v6 = 26;
            }
            goto LABEL_9;
          case 12:
            if (a5) {
              goto LABEL_40;
            }
            BOOL v8 = a6 == 0;
            unsigned int v6 = 20;
            int v9 = 24;
            break;
          default:
            goto LABEL_21;
        }
        goto LABEL_5;
      case 1:
LABEL_4:
        BOOL v8 = a5 == 0;
        unsigned int v6 = 16;
        int v9 = 19;
LABEL_5:
        if (!v8) {
          unsigned int v6 = v9;
        }
        goto LABEL_9;
      case 2:
        if (a5) {
          goto LABEL_40;
        }
        BOOL v7 = 1;
        unsigned int v6 = 16;
        goto LABEL_21;
      case 3:
        if (a5)
        {
LABEL_40:
          result = 0;
        }
        else
        {
          BOOL v7 = 1;
          unsigned int v6 = 21;
LABEL_21:
          int v10 = v7 | a5;
          if (a6) {
            unsigned int v11 = 24;
          }
          else {
            unsigned int v11 = 20;
          }
          if (v10) {
            result = v6;
          }
          else {
            result = v11;
          }
        }
        break;
      case 4:
        result = 0;
        if (!a6 || (a5 & 1) != 0) {
          return result;
        }
        BOOL v7 = 1;
        unsigned int v6 = 51;
        goto LABEL_21;
      case 5:
        result = 0;
        if (!a6 || (a5 & 1) != 0) {
          return result;
        }
        BOOL v7 = 1;
        unsigned int v6 = 52;
        goto LABEL_21;
      case 6:
        unsigned int v6 = 0;
        BOOL v7 = 0;
        goto LABEL_21;
      default:
        unsigned int v6 = 0;
LABEL_9:
        BOOL v7 = 1;
        goto LABEL_21;
    }
  }
  return result;
}

- (BWSoftISPProcessorController)initWithConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWSoftISPProcessorController;
  id v4 = [(BWStillImageProcessorController *)&v8 initWithName:@"SoftISP" type:12 configuration:a3];
  if (v4)
  {
    if (!FigCaptureVideoDimensionsAreValid([a3 inputDimensions])
      || ![a3 sensorRawPixelFormat]
      || (v5 = (void *)MEMORY[0x1A6272C70](),
          int SetupAndPrepareSoft = -[BWSoftISPProcessorController _loadSetupAndPrepareSoftISPProcessor]((id *)&v4->super.super.isa),
          SetupAndPrepareSoft))
    {

      return 0;
    }
  }
  return v4;
}

- (id)_lossyCompressionLevelByPipelineType
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v3 = BWAllStillImageQSubResolutionFlavors();
    id v4 = objc_msgSend(-[BWSoftISPProcessorController _prepareDescriptorByPipelineTypeForResolutionFlavors:](v1, v3), "allKeys", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          switch([v9 intValue])
          {
            case 0x10u:
            case 0x13u:
              int v12 = objc_msgSend((id)objc_msgSend(v1, "configuration"), "lossyCompressionLevel");
              if ((v12 - 1) < 3) {
                uint64_t v13 = (v12 + 1);
              }
              else {
                uint64_t v13 = 0;
              }
              unsigned int v11 = (void *)[NSNumber numberWithUnsignedInt:v13];
              int v10 = v2;
              break;
            default:
              int v10 = v2;
              unsigned int v11 = &unk_1EFAFE868;
              break;
          }
          [v10 setObject:v11 forKeyedSubscript:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    return (id)[v2 copy];
  }
  return result;
}

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (void)dealloc
{
  [(BWSoftISPProcessorController *)self reset];

  inputFormatDescription = self->_inputFormatDescription;
  if (inputFormatDescription) {
    CFRelease(inputFormatDescription);
  }
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  lscFormatDescription = self->_lscFormatDescription;
  if (lscFormatDescription) {
    CFRelease(lscFormatDescription);
  }
  flashLSCFormatDescription = self->_flashLSCFormatDescription;
  if (flashLSCFormatDescription) {
    CFRelease(flashLSCFormatDescription);
  }
  auxSashimiRawFormatDescription = self->_auxSashimiRawFormatDescription;
  if (auxSashimiRawFormatDescription) {
    CFRelease(auxSashimiRawFormatDescription);
  }
  auxFocusPixelH0FormatDescription = self->_auxFocusPixelH0FormatDescription;
  if (auxFocusPixelH0FormatDescription) {
    CFRelease(auxFocusPixelH0FormatDescription);
  }
  auxFocusPixelH1FormatDescription = self->_auxFocusPixelH1FormatDescription;
  if (auxFocusPixelH1FormatDescription) {
    CFRelease(auxFocusPixelH1FormatDescription);
  }

  v10.receiver = self;
  v10.super_class = (Class)BWSoftISPProcessorController;
  [(BWStillImageProcessorController *)&v10 dealloc];
}

- (unsigned)outputPixelFormatForCaptureType:(int)a3 captureFlags:(unint64_t)a4 processingMode:(int)a5
{
  return [(BWSoftISPProcessorController *)self outputPixelFormatForCaptureType:*(void *)&a3 captureFlags:a4 processingMode:*(void *)&a5 isQuadra:0];
}

- (unsigned)outputPixelFormatForInput:(id)a3
{
  uint64_t v5 = (const void *)[a3 frame];
  BOOL v6 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureFlags");
  uint64_t v9 = [a3 processingMode];
  return [(BWSoftISPProcessorController *)self outputPixelFormatForCaptureType:v7 captureFlags:v8 processingMode:v9 isQuadra:v6];
}

- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4
{
  if (a4)
  {
    BOOL v7 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1;
    uint64_t v8 = -[BWSoftISPProcessorController _pipelineTypeForCaptureType:captureFlags:processingMode:gdcEnabled:isQuadra:]((uint64_t)self, objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType"), objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureFlags"), objc_msgSend(a3, "processingMode"), objc_msgSend(a3, "gdcEnabled"), v7);
    -[SoftISPPrepareDescriptor setSensorID:](self->_prepareDescriptor, "setSensorID:", (unsigned __int16)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_sensorIDByPortType, "objectForKeyedSubscript:", objc_msgSend(a3, "portType")), "unsignedIntValue"));
    [(SoftISPPrepareDescriptor *)self->_prepareDescriptor setInputPixelFormat:[(BWStillImageProcessorControllerConfiguration *)[(BWStillImageProcessorController *)self configuration] sensorRawPixelFormat]];
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    [(SoftISPPrepareDescriptor *)self->_prepareDescriptor setMaximumWidth:CVPixelBufferGetWidth(ImageBuffer)];
    [(SoftISPPrepareDescriptor *)self->_prepareDescriptor setMaximumHeight:CVPixelBufferGetHeight(ImageBuffer)];
    if (-[BWStillImageProcessorControllerConfiguration cmiResourceEnabled](-[BWStillImageProcessorController configuration](self, "configuration"), "cmiResourceEnabled"))BOOL v10 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType") == 12; {
    else
    }
      BOOL v10 = 0;
    [(SoftISPPrepareDescriptor *)self->_prepareDescriptor setCmiResourceEnabled:v10];
    unsigned int v11 = (id *)[(SoftISPProcessor *)self->_processor prepareToProcess:v8 prepareDescriptor:self->_prepareDescriptor];
    if (!v11)
    {
      [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] delegate];
      if (objc_opt_respondsToSelector()) {
        [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] delegate] processorController:self willAddSampleBuffer:a4 processorInput:a3];
      }
      unsigned int v11 = -[BWSoftISPProcessorController _addFrame:]((id *)&self->super.super.isa, a4);
    }
    uint64_t v12 = (uint64_t)v11;
  }
  else
  {
    uint64_t v12 = 4294954516;
  }
  [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] setErr:v12];
  [(BWStillImageProcessorController *)self currentRequestChanged];
}

- (id)_addFrame:(id *)result
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3 = result;
    id v4 = (void *)[result currentRequest];
    int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "input"), "captureSettings"), "captureType");
    unint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "input"), "captureStreamSettings"), "captureFlags");
    BOOL v7 = BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
    v51 = v4;
    unsigned int v8 = objc_msgSend((id)objc_msgSend(v4, "input"), "processingMode");
    uint64_t v9 = -[BWSoftISPProcessorController _tuningTypeForFrame:processingMode:captureType:captureFlags:captureFrameFlags:]((uint64_t)v3, a2, v8, v5, v6, (char)v7);
    BOOL v41 = -[BWSoftISPProcessorController _rnfEnabledForFrame:processingMode:captureFlags:]((BOOL)v3, a2, v8, v6);
    unint64_t v10 = -[BWSoftISPProcessorController _hrEnabledForFrame:processingMode:captureFlags:captureFrameFlags:]((unint64_t)v3, a2, v8, v6, (char)v7);
    BOOL v42 = (v10 & 1) == 0
       && -[BWSoftISPProcessorController _sfhrEnabledForFrame:processingMode:captureType:captureFlags:captureFrameFlags:tuningType:]((uint64_t)v3, a2, v8, v5, v6, (char)v7, v9);
    unsigned int v43 = -[BWSoftISPProcessorController _rawMBNREnabledForFrame:processingMode:captureFlags:tuningType:]((uint64_t)v3, a2, v8, v6, v9);
    unsigned int v45 = -[BWSoftISPProcessorController _awbModeForFrame:processingMode:captureType:captureFlags:captureFrameFlags:]((uint64_t)v3, a2, v8, v5, v6, (unint64_t)v7);
    unsigned int v44 = -[BWSoftISPProcessorController _awbPurgeResourcesForFrameCount:captureFlags:]((uint64_t)v3, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "input"), "captureSettings"), "frameStatisticsByPortType"), "frameCount"), v6);
    double v11 = -[BWSoftISPProcessorController _awbRegionOfInterestWithinSensorCropRectForFrame:processingMode:captureFlags:](v3, (CMSampleBufferRef)a2, v8, v6);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    unint64_t v18 = -[BWSoftISPProcessorController _ltmModeForFrame:processingMode:captureType:captureFlags:captureFrameFlags:]((unint64_t)v3, a2, v8, v5, v6, (char)v7);
    BOOL v46 = -[BWSoftISPProcessorController _faceDetectionEnabledForFrame:processingMode:captureType:captureFlags:]((BOOL)v3, a2, v8, v5);
    BOOL v20 = v5 == 11 && v8 != 1;
    BOOL v47 = v20;
    BOOL v48 = -[BWSoftISPProcessorController _gnuEnabledForFrame:processingMode:captureFlags:tuningType:]((uint64_t)v3, a2, v8, v6, v9);
    BOOL v49 = -[BWSoftISPProcessorController _opcEnabledForFrame:processingMode:captureFlags:tuningType:]((BOOL)v3, a2, v21, v22, v9);
    int v24 = -[BWSoftISPProcessorController _allowUnclampedOutputsForFrame:processingMode:](v3, v23, v8);
    double v25 = -[BWSoftISPProcessorController _outputBufferRectWithinSensorCropRectForFrame:](v3, a2);
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    v50 = -[BWSoftISPProcessorController _auxiliaryTypesForFrame:captureType:captureFlags:deliverDeferredPhotoProxyImage:](v3, a2, v5, v6, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "input"), "captureSettings"), "deliverDeferredPhotoProxyImage"));
    v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"PDC");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", (v6 >> 15) & 1), @"CAR");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v41), @"RNF");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v10), @"HR");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v24), @"AllowUnclampedOutputs");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v42 & (v24 ^ 1)), @"SFHR");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v43), @"RawMBNR");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v8 == 2), @"Aux");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v45), @"AWBMode");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v44), @"AWBPurgeResources");
    v53.origin.x = v11;
    v53.origin.y = v13;
    v53.size.width = v15;
    v53.size.height = v17;
    if (!CGRectIsNull(v53))
    {
      v54.origin.x = v11;
      v54.origin.y = v13;
      v54.size.width = v15;
      v54.size.height = v17;
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v54);
      [v32 setObject:CFAutorelease(DictionaryRepresentation) forKeyedSubscript:@"AWBRegionOfInterestRectWithinSensorCropRect"];
    }
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v18), @"LTMMode");
    uint64_t v34 = NSNumber;
    unsigned int v35 = objc_msgSend((id)objc_msgSend(v3, "configuration"), "ltmHDRCurvesEnabled");
    if (v18) {
      uint64_t v36 = v35;
    }
    else {
      uint64_t v36 = 0;
    }
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(v34, "numberWithInt:", v36), @"LTMHDRCurves");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v46), @"VSN");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v47), @"SSC");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v48), @"GNU");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v49), @"OPC");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9), @"TuningType");
    v55.origin.x = v25;
    v55.origin.y = v27;
    v55.size.width = v29;
    v55.size.height = v31;
    CFDictionaryRef v37 = CGRectCreateDictionaryRepresentation(v55);
    [v32 setObject:CFAutorelease(v37) forKeyedSubscript:@"OutputBufferRectWithinSensorCropRect"];
    [v32 setObject:v50 forKeyedSubscript:@"SoftISPAuxiliaryType"];
    if (dword_1EB4C5590)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return (id *)objc_msgSend(v3[7], "addFrame:uniqueID:processingOptions:", a2, objc_msgSend(v51, "uniqueID", v39, v40), v32);
  }
  return result;
}

- (uint64_t)_tuningTypeForFrame:(int)a3 processingMode:(int)a4 captureType:(uint64_t)a5 captureFlags:(char)a6 captureFrameFlags:
{
  if (result)
  {
    unint64_t v10 = (void *)result;
    double v11 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    int v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
    if (v12 == 1)
    {
      objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
      BOOL v14 = v13 > 1.0;
    }
    else
    {
      BOOL v14 = 0;
    }
    switch(a3)
    {
      case 0:
      case 5:
        if ((a5 & 0x80) != 0) {
          goto LABEL_17;
        }
        goto LABEL_10;
      case 1:
      case 2:
      case 3:
        if (v14) {
          return 100;
        }
        else {
          return 1;
        }
      case 4:
        if ((a5 & 0x200000000) != 0) {
          unsigned int v16 = 142;
        }
        else {
          unsigned int v16 = 22;
        }
        if ((a6 & 8) == 0) {
          unsigned int v16 = 0;
        }
        if ((a5 & 0x200000000) != 0) {
          int v19 = 141;
        }
        else {
          int v19 = 21;
        }
        if ((a6 & 4) != 0) {
          unsigned int v16 = v19;
        }
        if ((a5 & 0x200000000) != 0) {
          unsigned int v18 = 140;
        }
        else {
          unsigned int v18 = 20;
        }
LABEL_52:
        BOOL v17 = (a6 & 2) == 0;
        goto LABEL_53;
      case 6:
LABEL_17:
        if (v14) {
          unsigned int v16 = 100;
        }
        else {
          unsigned int v16 = 1;
        }
        BOOL v17 = (a5 & 0x100000000) == 0;
        unsigned int v18 = 190;
        goto LABEL_53;
      default:
LABEL_10:
        result = 0;
        switch(a4)
        {
          case 1:
          case 7:
            if (v14) {
              unsigned int v15 = 100;
            }
            else {
              unsigned int v15 = 1;
            }
            if ((a5 & 0x100000000) != 0) {
              return 100;
            }
            else {
              return v15;
            }
          case 2:
            if (objc_msgSend((id)objc_msgSend(v10, "configuration"), "documentScanningEnabled")
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorEnabled"))
            {
              if (v14) {
                return 172;
              }
              else {
                return 171;
              }
            }
            unsigned int v18 = 180;
            if (v14) {
              unsigned int v16 = 180;
            }
            else {
              unsigned int v16 = 170;
            }
            BOOL v17 = (a5 & 0x100000000) == 0;
            break;
          case 10:
            if (v14) {
              unsigned int v16 = 103;
            }
            else {
              unsigned int v16 = 4;
            }
            if ((a6 & 8) == 0) {
              unsigned int v16 = 0;
            }
            if (v14) {
              int v20 = 102;
            }
            else {
              int v20 = 3;
            }
            if ((a6 & 4) != 0) {
              unsigned int v16 = v20;
            }
            if (v14) {
              unsigned int v18 = 101;
            }
            else {
              unsigned int v18 = 2;
            }
            goto LABEL_52;
          case 11:
            if (v14) {
              unsigned int v16 = 110;
            }
            else {
              unsigned int v16 = 10;
            }
            if (v14) {
              unsigned int v18 = 160;
            }
            else {
              unsigned int v18 = 150;
            }
            BOOL v17 = (a5 & 0x800000000) == 0;
            break;
          case 12:
            if ((a5 & 0x200000000) != 0)
            {
              if (v12 == 1) {
                return 143;
              }
              if ((a6 & 2) != 0) {
                return 140;
              }
              if ((a6 & 4) != 0) {
                return 141;
              }
              if ((a6 & 8) != 0) {
                return 142;
              }
              return 0;
            }
            if ((a6 & 2) != 0)
            {
              if (v14) {
                unsigned int v16 = 120;
              }
              else {
                unsigned int v16 = 20;
              }
              BOOL v17 = (a5 & 0x100000000) == 0;
              unsigned int v18 = 130;
            }
            else if ((a6 & 4) != 0)
            {
              if (v14) {
                unsigned int v16 = 121;
              }
              else {
                unsigned int v16 = 21;
              }
              BOOL v17 = (a5 & 0x100000000) == 0;
              unsigned int v18 = 131;
            }
            else
            {
              if ((a6 & 8) == 0) {
                return 0;
              }
              if (v14) {
                unsigned int v16 = 122;
              }
              else {
                unsigned int v16 = 22;
              }
              BOOL v17 = (a5 & 0x100000000) == 0;
              unsigned int v18 = 132;
            }
            break;
          default:
            return result;
        }
LABEL_53:
        if (v17) {
          result = v16;
        }
        else {
          result = v18;
        }
        break;
    }
  }
  return result;
}

- (BOOL)_rnfEnabledForFrame:(int)a3 processingMode:(char)a4 captureFlags:
{
  if (result)
  {
    int v6 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
    result = v6 != 1;
    if (a3 == 6)
    {
      return 0;
    }
    else if (!a3)
    {
      return (a4 & 0x80) == 0 && v6 != 1;
    }
  }
  return result;
}

- (unint64_t)_hrEnabledForFrame:(unsigned int)a3 processingMode:(unint64_t)a4 captureFlags:(char)a5 captureFrameFlags:
{
  if (result)
  {
    uint64_t v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F541A8]), "BOOLValue")) {
      return 0;
    }
    CFTypeRef v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530F0], 0);
    CFTypeRef v11 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53068], 0);
    CFTypeRef v12 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53108], 0);
    if (!v10 && (!v11 || v12 == 0)) {
      return 0;
    }
    result = 0;
    if (a3 <= 6)
    {
      if (((1 << a3) & 0x62) == 0)
      {
        if (((1 << a3) & 0x11) == 0) {
          return result;
        }
        int v14 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
        if (a5 & 8 | a4 & 0x100000) {
          return (a4 >> 33) & (v14 == 1);
        }
      }
      return 1;
    }
  }
  return result;
}

- (BOOL)_sfhrEnabledForFrame:(unsigned int)a3 processingMode:(int)a4 captureType:(uint64_t)a5 captureFlags:(char)a6 captureFrameFlags:(uint64_t)a7 tuningType:
{
  if (!a1) {
    return 0;
  }
  float v13 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  unsigned int v14 = objc_msgSend((id)objc_msgSend((id)a1, "configuration"), "sfhrSupportEnabled");
  int v15 = objc_msgSend((id)objc_msgSend((id)a1, "configuration"), "lowlightSFHRSupportEnabled");
  uint64_t v16 = 0;
  if ((a5 & 0x1000000) != 0) {
    return v16;
  }
  int v17 = v15;
  if (!(v14 | v15)) {
    return v16;
  }
  int v18 = [*(id *)(a1 + 56) tuningFlagForProcessingOption:@"SFHR" tuningType:a7 metadata:v13];
  if (!v18)
  {
    if ((a5 & 0x100000) == 0)
    {
      uint64_t v16 = 0;
      if (a3 > 6 || ((1 << a3) & 0x73) == 0) {
        return v16;
      }
      if ((a6 & 8) != 0 || (v14 & (a5 >> 3) | v17) != 1) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorEnabled") ^ 1;
      }
      goto LABEL_6;
    }
    if ((a6 & 4) != 0)
    {
      uint64_t v16 = 0;
      if (a3 <= 6 && ((1 << a3) & 0x51) != 0)
      {
        if (a4 == 12 || a4 == 10 || a5 == 0x4000000000) {
          uint64_t v16 = v14;
        }
        else {
          uint64_t v16 = 0;
        }
      }
      goto LABEL_6;
    }
    return 0;
  }
  uint64_t v16 = v18 == 1;
LABEL_6:
  if (!a3 && a4 == 11)
  {
    int v19 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F531E0]), "intValue");
    int v20 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
    if (v19 == 1 && v20 == 1) {
      *(unsigned char *)(a1 + 172) = v16;
    }
    else {
      return *(unsigned char *)(a1 + 172) != 0;
    }
  }
  return v16;
}

- (uint64_t)_rawMBNREnabledForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:
{
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    int v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
    result = [*(id *)(v8 + 56) tuningFlagForProcessingOption:@"RawMBNR" tuningType:a5 metadata:v9];
    if (result != 1)
    {
      if (result == 2) {
        return 0;
      }
      if ((a3 - 1) >= 5)
      {
        if (a3 || (a4 & 0x80) != 0) {
          return 0;
        }
        return (a4 & 0x200000000) == 0 || v10 != 1;
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

- (uint64_t)_awbModeForFrame:(int)a3 processingMode:(int)a4 captureType:(unint64_t)a5 captureFlags:(unint64_t)a6 captureFrameFlags:
{
  if (result)
  {
    uint64_t v11 = result;
    CFTypeRef v12 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    char v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53C68]), "BOOLValue");
    if (a4 != 11 && (v13 & 1) != 0)
    {
      return 0;
    }
    else
    {
      result = 0;
      switch(a3)
      {
        case 0:
        case 4:
          if (a4 == 11)
          {
            int v14 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F531E0]), "intValue");
            int v15 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
            if (v14 == 1 && v15 == 1)
            {
              if ((a5 & 0x800000000) != 0) {
                result = 3;
              }
              else {
                result = 2;
              }
            }
            else
            {
              [v12 addEntriesFromDictionary:*(void *)(v11 + 144)];
              result = BWIsLastAdaptiveBracketingFrame(target);
              if (result)
              {

                result = 0;
                *(void *)(v11 + 144) = 0;
              }
            }
          }
          else if (a4 == 2)
          {
            result = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53CA0]), "BOOLValue") ^ 1;
          }
          else
          {
            uint64_t v17 = (a6 >> 4) & 1;
            if (a4 == 1) {
              LODWORD(v17) = 1;
            }
            if ((a5 & 0x8000000000) != 0) {
              result = v17;
            }
            else {
              result = 0;
            }
          }
          break;
        case 1:
        case 5:
          result = (a5 >> 39) & 1;
          break;
        case 2:
          result = 1;
          break;
        case 6:
          result = (a5 >> 38) & 1;
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

- (uint64_t)_awbPurgeResourcesForFrameCount:(unint64_t)a3 captureFlags:
{
  if (result)
  {
    uint64_t v5 = result;
    if (objc_msgSend((id)objc_msgSend((id)result, "configuration"), "stillImageProcessingMode")) {
      return 0;
    }
    int v6 = BWStillImageAutoWhiteBalanceReflowMaximumFrameCount();
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      unsigned int v7 = v6;
      result = 0;
      char v8 = (a3 >> 39) & (v7 > a2);
      if (*(unsigned char *)(v5 + 136)) {
        char v8 = 1;
      }
      *(unsigned char *)(v5 + 136) = v8;
      if (v7 <= a2)
      {
        if (*(unsigned char *)(v5 + 136))
        {
          *(unsigned char *)(v5 + 136) = 0;
          return 1;
        }
      }
    }
  }
  return result;
}

- (double)_awbRegionOfInterestWithinSensorCropRectForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v8 = MEMORY[0x1E4F1DB20];
  long long v15 = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)uint64_t v16 = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)&v16[16] = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  psn_pixelBufferDimensions(ImageBuffer);
  int v10 = (void *)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (a3 == 6 && (a4 & 0x4000000000) != 0)
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a1, "currentRequest"), "input");
    if ((objc_msgSend((id)objc_msgSend(v11, "portType"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v11, "captureSettings"), "masterPortType")) & 1) == 0)FigCFDictionaryGetCGRectIfPresent(); {
  }
    }
  if (CGRectIsNull(*(CGRect *)v16)) {
    return *(double *)v8;
  }
  uint64_t v12 = *MEMORY[0x1E4F54148];
  if ([v10 objectForKeyedSubscript:*MEMORY[0x1E4F54148]]) {
    double v13 = (double)(int)objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v12), "intValue");
  }
  else {
    double v13 = 1.0;
  }
  FigCFDictionaryGetCGRectIfPresent();
  return v13 * (*(double *)&v15 + *(double *)v16);
}

- (unint64_t)_ltmModeForFrame:(int)a3 processingMode:(int)a4 captureType:(unint64_t)a5 captureFlags:(char)a6 captureFrameFlags:
{
  if (!result) {
    return result;
  }
  uint64_t v11 = result;
  uint64_t v12 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  int v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
  if ((a3 - 2) < 2) {
    return 0;
  }
  int v14 = v13;
  if (a3 != 4 && a3) {
    return 1;
  }
  result = 1;
  if (a4 > 10)
  {
    if (a4 == 12)
    {
LABEL_21:
      if ((a6 & 0x14) == 0) {
        return (a5 >> 33) & (v14 == 1);
      }
      return result;
    }
    if (a4 != 11) {
      return result;
    }
    int v15 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F531E0]), "intValue");
    int v16 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
    if (v15 == 1 && v16 == 1) {
      return 2;
    }
    objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "doubleValue");
    double v19 = v18;
    FigCaptureComputeImageGainFromMetadata();
    if (vabdd_f64(v19, *(double *)(v11 + 160)) < 0.0001 && vabds_f32(0.0, *(float *)(v11 + 168)) < 0.0001) {
      [v12 addEntriesFromDictionary:*(void *)(v11 + 152)];
    }
    if (BWIsLastAdaptiveBracketingFrame(target))
    {

      *(void *)(v11 + 152) = 0;
      *(void *)(v11 + 160) = 0;
      *(_DWORD *)(v11 + 168) = 0;
      *(unsigned char *)(v11 + 172) = 0;
    }
    return 0;
  }
  if (a4 != 2)
  {
    if (a4 != 10) {
      return result;
    }
    goto LABEL_21;
  }
  if (!objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53CA0]), "BOOLValue")) {
    return 1;
  }
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v11, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorEnabled");
  if (result) {
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v11, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorFallbackPhotoDeliveryEnabled");
  }
  return result;
}

- (BOOL)_faceDetectionEnabledForFrame:(BOOL)result processingMode:(CMAttachmentBearerRef)target captureType:(int)a3 captureFlags:(int)a4
{
  if (result)
  {
    int v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    result = 0;
    if (!a3 && a4 == 11)
    {
      int v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F531E0]), "intValue");
      int v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
      return v7 == 1 && v8 < 7;
    }
  }
  return result;
}

- (BOOL)_gnuEnabledForFrame:(int)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:
{
  if (!a1) {
    return 0;
  }
  uint64_t v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  int v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
  BOOL v11 = v10 != 1;
  int v12 = [*(id *)(a1 + 56) tuningFlagForProcessingOption:@"GNU" tuningType:a5 metadata:v9];
  if (v12) {
    return v12 == 1;
  }
  switch(a3)
  {
    case 0:
      BOOL v11 = (a4 & 0x800000080) == 0 && v10 != 1;
      break;
    case 1:
    case 2:
    case 3:
    case 5:
      return v11;
    case 4:
      return 1;
    default:
      return 0;
  }
  return v11;
}

- (BOOL)_opcEnabledForFrame:(uint64_t)a3 processingMode:(uint64_t)a4 captureFlags:(uint64_t)a5 tuningType:
{
  if (result) {
    return objc_msgSend(*(id *)(result + 56), "tuningFlagForProcessingOption:tuningType:metadata:", @"OPC", a5, CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0)) == 1;
  }
  return result;
}

- (void)_allowUnclampedOutputsForFrame:(int)a3 processingMode:
{
  if (result)
  {
    LODWORD(result) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "constantColorEnabled");
    if (a3 == 2) {
      return 0;
    }
    else {
      return (void *)result;
    }
  }
  return result;
}

- (double)_outputBufferRectWithinSensorCropRectForFrame:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  id v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  uint64_t v6 = *MEMORY[0x1E4F54148];
  if ([v4 objectForKeyedSubscript:*MEMORY[0x1E4F54148]]) {
    int v7 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v6), "intValue");
  }
  else {
    int v7 = 1;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  unint64_t v9 = psn_pixelBufferDimensions(ImageBuffer);
  unint64_t v10 = objc_msgSend((id)objc_msgSend(a1, "configuration"), "outputDimensions");
  int v11 = v10;
  unint64_t v12 = HIDWORD(v10);
  if (v7 == 1)
  {
    unint64_t v13 = FigCaptureDimensionsFromDictionaryRepresentation(objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "inputDimensionsByQSubResolutionFlavorByPortType"), "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", &unk_1EFAFE790));
    unint64_t v14 = FigCaptureDimensionsFromDictionaryRepresentation(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "outputDimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1EFAFE790));
    if (FigCaptureVideoDimensionsAreEqual(v9, v13))
    {
      LODWORD(v12) = HIDWORD(v14);
      int v11 = v14;
    }
    unint64_t v15 = FigCaptureDimensionsFromDictionaryRepresentation(objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "inputDimensionsByQSubResolutionFlavorByPortType"), "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", &unk_1EFAFE778));
    unint64_t v16 = FigCaptureDimensionsFromDictionaryRepresentation(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "configuration"), "outputDimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1EFAFE778));
    if (((int)v15 > (int)objc_msgSend((id)objc_msgSend(a1, "configuration"), "inputDimensions")
       || SHIDWORD(v15) > (int)((unint64_t)objc_msgSend((id)objc_msgSend(a1, "configuration"), "inputDimensions") >> 32))
      && FigCaptureVideoDimensionsAreEqual(v9, v15))
    {
      unint64_t v12 = HIDWORD(v16);
      int v11 = v16;
    }
  }
  long long v48 = *MEMORY[0x1E4F1DB20];
  long long v49 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v50 = *MEMORY[0x1E4F1DB20];
  FigCFDictionaryGetCGRectIfPresent();
  if (FigCFDictionaryGetCGRectIfPresent())
  {
    double v17 = *((double *)&v48 + 1);
    double v18 = *(double *)&v48;
    double v20 = *((double *)&v49 + 1);
    double v19 = *(double *)&v49;
  }
  else
  {
    double v19 = (double)(int)v9;
    double v20 = (double)SHIDWORD(v9);
    double v17 = 0.0;
    double v18 = 0.0;
  }
  double v21 = (*(double *)&v50 + v18) * (double)v7;
  double v22 = (*((double *)&v50 + 1) + v17) * (double)v7;
  double v23 = v19 * (double)v7;
  double v24 = v20 * (double)v7;
  int v25 = v11 * v7;
  int v26 = v12 * v7;
  v51.origin.x = v21;
  v51.origin.y = v22;
  v51.size.width = v23;
  v51.size.height = v24;
  double MidX = CGRectGetMidX(v51);
  if (v25 >= 0) {
    int v28 = v25;
  }
  else {
    int v28 = v25 + 1;
  }
  int v29 = (int)(MidX - (double)(v28 >> 1));
  v52.origin.x = v21;
  v52.origin.y = v22;
  v52.size.width = v23;
  v52.size.height = v24;
  double MidY = CGRectGetMidY(v52);
  if (v26 >= 0) {
    int v31 = v26;
  }
  else {
    int v31 = v26 + 1;
  }
  double v32 = (double)(int)(MidY - (double)(v31 >> 1));
  objc_msgSend((id)objc_msgSend(a1, "configuration"), "sensorCenterOffset");
  CGFloat v35 = v34;
  CGFloat v36 = v33;
  double v47 = (double)v29;
  if (v34 != *MEMORY[0x1E4F1DAD8] || v33 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    v53.origin.x = (double)v29;
    v53.origin.y = v32;
    v53.size.width = (double)v25;
    v53.size.height = (double)v26;
    CGRectOffset(v53, v35, v36);
    FigCaptureMetadataUtilitiesRoundDenormalizedRectToRawSensorCFABoundary(v4);
    CGFloat v38 = v37;
    double v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    v54.origin.x = v21;
    v54.origin.y = v22;
    v54.size.width = v23;
    CGFloat v45 = v40;
    v54.size.height = v24;
    v55.origin.x = v38;
    v55.origin.y = v45;
    v55.size.width = v42;
    v55.size.height = v44;
    if (CGRectContainsRect(v54, v55)) {
      return v38;
    }
  }
  return v47;
}

- (void)_auxiliaryTypesForFrame:(int)a3 captureType:(int)a4 captureFlags:(int)a5 deliverDeferredPhotoProxyImage:
{
  if (!a1) {
    return 0;
  }
  unint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  int v11 = v10;
  if (a3 != 12)
  {
    if (a3 == 11)
    {
      unint64_t v12 = &unk_1EFAFE898;
LABEL_11:
      [v10 addObject:v12];
      goto LABEL_12;
    }
    if (a3 != 10 || (a4 & 0x100000) == 0) {
      goto LABEL_12;
    }
LABEL_10:
    unint64_t v12 = &unk_1EFAFE880;
    goto LABEL_11;
  }
  if ((a4 & 0x100000) != 0 && a5) {
    goto LABEL_10;
  }
LABEL_12:
  if (!objc_msgSend((id)objc_msgSend(a1, "configuration"), "auxiliaryTypesForFocusPixelDisparityEnabled")) {
    goto LABEL_19;
  }
  unint64_t v13 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (((unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a2) & 0x14) == 0)
  {
    int v14 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F53F10]), "BOOLValue") ^ 1;
    if ((a4 & 0x800) == 0) {
      goto LABEL_19;
    }
LABEL_17:
    if ((v14 & 1) == 0) {
      [v11 addObjectsFromArray:&unk_1EFB02DF8];
    }
    goto LABEL_19;
  }
  LOBYTE(v14) = 0;
  if ((a4 & 0x800) != 0) {
    goto LABEL_17;
  }
LABEL_19:
  if (![v11 count]) {
    [v11 addObject:&unk_1EFAFE868];
  }
  return v11;
}

- (void)reset
{
  [(SoftISPProcessor *)self->_processor resetState];
  processor = self->_processor;
  [(SoftISPProcessor *)processor setDelegate:0];
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  uint64_t v6 = [[BWSoftISPProcessorControllerRequest alloc] initWithInput:a3 delegate:a4];
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
  v3 = [(BWStillImageProcessorController *)self currentRequest];
  [(SoftISPProcessor *)self->_processor setDelegate:self];
  id v4 = [(BWStillImageProcessorControllerRequest *)v3 input];
  if ([(BWStillImageProcessorControllerInput *)v4 frame]) {
    [(BWStillImageProcessorControllerInputUpdatesDelegate *)[(BWStillImageProcessorControllerInput *)v4 delegate] input:v4 addFrame:[(BWStillImageProcessorControllerInput *)v4 frame]];
  }
  return 0;
}

- (int)process
{
  return [(SoftISPProcessor *)self->_processor process];
}

- (id)metalImageBufferProcessor
{
  return self->_processor;
}

- (id)externalMemoryDescriptorForResolutionFlavors:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"PrepareDescriptorByPipelineType";
  v7[0] = -[BWSoftISPProcessorController _prepareDescriptorByPipelineTypeForResolutionFlavors:](self, a3);
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  return (id)-[SoftISPProcessor externalMemoryDescriptorForConfiguration:](self->_processor, "externalMemoryDescriptorForConfiguration:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F55EB8]), "initWithMaxInputDimensions:inputPixelFormat:maxOutputDimensions:cmiResourceEnabled:processorSpecificOptions:", 0, 0, 0, -[BWStillImageProcessorControllerConfiguration cmiResourceEnabled](-[BWStillImageProcessorController configuration](self, "configuration"), "cmiResourceEnabled"), v4));
}

- (__CVBuffer)newOutputPixelBufferForUniqueID:(unint64_t)a3 pixelFormat:(unsigned int)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  unint64_t v9 = [(BWStillImageProcessorController *)self currentRequest];
  unint64_t v10 = [(BWStillImageProcessorControllerRequest *)v9 delegate];
  uint64_t v11 = [(BWStillImageProcessorControllerRequest *)v9 input];
  return (__CVBuffer *)[(BWStillImageProcessorControllerDelegate *)v10 processorController:self newOutputPixelBufferForProcessorInput:v11 type:1 dimensions:v7 | ((unint64_t)v6 << 32)];
}

- (__CVBuffer)newOutputAuxiliaryPixelBufferForUniqueID:(unint64_t)a3 pixelFormat:(unsigned int)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  uint64_t v8 = *(void *)&a4;
  unint64_t v10 = [(BWStillImageProcessorController *)self currentRequest];
  uint64_t v11 = [(BWStillImageProcessorControllerRequest *)v10 delegate];
  uint64_t v12 = [(BWStillImageProcessorControllerRequest *)v10 input];
  return (__CVBuffer *)[(BWStillImageProcessorControllerDelegate *)v11 processorController:self newOutputPixelBufferForProcessorInput:v12 type:28 attachedMediaKey:0 pixelFormat:v8 dimensions:v7 | ((unint64_t)v6 << 32)];
}

- (void)outputFrameEnqueued:(id)a3
{
  CMSampleBufferRef sbuf = 0;
  uint64_t v5 = [(BWStillImageProcessorController *)self currentRequest];
  if objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "processingOptions"), "objectForKeyedSubscript:", @"HR"), "BOOLValue")&& (unsigned int v6 = objc_msgSend(a3, "metadata"), (objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F541A8]), "BOOLValue"))|| (-[BWStillImageProcessorControllerRequest setErr:](v5, "setErr:", BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)-[BWStillImageProcessorControllerInput frame](-[BWStillImageProcessorControllerRequest input](v5, "input"), "frame"), (__CVBuffer *)objc_msgSend(a3, "pixelBuffer"), (CFTypeRef *)&self->_outputFormatDescription, &sbuf)), -[BWStillImageProcessorControllerRequest err](v5, "err")))
  {
    uint64_t v8 = 0;
  }
  else
  {
    if ([a3 resource])
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
      CVBufferSetAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E4F52DD0], (CFTypeRef)[a3 resource], kCVAttachmentMode_ShouldPropagate);
    }
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "metadata"), "mutableCopy");
    int v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F531E0]), "intValue");
    if (v9 >= 1)
    {
      int v10 = v9;
      int v11 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
      if (v10 == 1 && v11 == 1)
      {
        uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        BWCopyWhiteBalanceMetadata(v8, v12);

        self->_digitalFlashAWBMetadata = v12;
        unint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        BWCopyLTMMetadata(v8, v13);

        self->_digitalFlashLTMMetadata = v13;
        objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "doubleValue");
        self->_digitalFlashLTMExposureTime = v14;
        FigCaptureComputeImageGainFromMetadata();
      }
    }
    CMSetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], v8, 1u);
    unint64_t v15 = (const void *)[a3 getAuxiliaryPixelBufferForAuxiliaryType:1];
    if (v15) {
      CMSetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53018], v15, 1u);
    }
    unint64_t v16 = (__CVBuffer *)[a3 getAuxiliaryPixelBufferForAuxiliaryType:3];
    if (v16) {
      BWSampleBufferSetAttachedMediaFromPixelBuffer(sbuf, 0x1EFA74380, v16, (CFTypeRef *)&self->_auxSashimiRawFormatDescription, 0, 0, 1);
    }
    double v17 = (__CVBuffer *)[a3 getAuxiliaryPixelBufferForAuxiliaryType:4];
    if (v17) {
      BWSampleBufferSetAttachedMediaFromPixelBuffer(sbuf, 0x1EFA743E0, v17, (CFTypeRef *)&self->_auxFocusPixelH0FormatDescription, 0, 0, 1);
    }
    double v18 = (__CVBuffer *)[a3 getAuxiliaryPixelBufferForAuxiliaryType:5];
    if (v18) {
      BWSampleBufferSetAttachedMediaFromPixelBuffer(sbuf, 0x1EFA74400, v18, (CFTypeRef *)&self->_auxFocusPixelH1FormatDescription, 0, 0, 1);
    }
    if ([a3 lscPixelBuffer]
      && !BWSampleBufferSetAttachedMediaFromPixelBuffer(sbuf, 0x1EFA74640, (__CVBuffer *)[a3 lscPixelBuffer], (CFTypeRef *)&self->_lscFormatDescription, 0, 0, 1)&& objc_msgSend((id)objc_msgSend(a3, "lscParameters"), "count"))
    {
      AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(sbuf, 0x1EFA74640);
      double v20 = (const void *)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", objc_msgSend(a3, "lscParameters"));
      CMSetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53058], v20, 1u);
      CMSetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53050], AttachedMedia, 1u);
    }
    if ([a3 flashLSCPixelBuffer]) {
      BWSampleBufferSetAttachedMediaFromPixelBuffer(sbuf, 0x1EFA74660, (__CVBuffer *)[a3 flashLSCPixelBuffer], (CFTypeRef *)&self->_flashLSCFormatDescription, 0, 0, 1);
    }
    int v21 = [(SoftISPProcessor *)self->_processor pipelineType];
    if (self && v21 == 19)
    {
      [v8 setObject:&unk_1EFAFE748 forKeyedSubscript:*MEMORY[0x1E4F53328]];
      [v8 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F533E8]];
    }
    unint64_t v22 = psn_pixelBufferDimensions((__CVBuffer *)[a3 pixelBuffer]);
    CGSize size = (CGSize)*MEMORY[0x1E4F1DB30];
    CFDictionaryRef v23 = (const __CFDictionary *)CMGetAttachment(sbuf, @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0);
    if (v23 && CGSizeMakeWithDictionaryRepresentation(v23, &size))
    {
      v33.double width = (double)(int)v22;
      v33.double height = (double)SHIDWORD(v22);
      CFDictionaryRef v24 = CGSizeCreateDictionaryRepresentation(v33);
      CMSetAttachment(sbuf, @"OriginalCameraIntrinsicMatrixReferenceDimensions", v24, 1u);
      long long v29 = *MEMORY[0x1E4F1DB20];
      CGSize v30 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      [a3 processingOptions];
      if (FigCFDictionaryGetCGRectIfPresent())
      {
        double v26 = *((double *)&v29 + 1);
        double v25 = *(double *)&v29;
        double height = v30.height;
        double width = v30.width;
      }
      else
      {
        double width = size.width;
        double height = size.height;
        long long v29 = 0uLL;
        CGSize v30 = size;
        double v26 = 0.0;
        double v25 = 0.0;
      }
      BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(sbuf, @"OriginalCameraIntrinsicMatrix", 0, 0, v25, v26, width, height, 0.0, 0.0, (double)(int)v22, (double)SHIDWORD(v22));
    }
    [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v5 input] setFrame:0];
    [(BWStillImageProcessorControllerRequest *)v5 setOutputFrame:sbuf];
  }
  if (sbuf) {
    CFRelease(sbuf);
  }
}

@end