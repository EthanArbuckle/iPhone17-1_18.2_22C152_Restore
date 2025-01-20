@interface BWDeferredProcessorController
+ (BOOL)usesCustomProcessingFlow;
- (BWDeferredProcessorController)initWithConfiguration:(id)a3;
- (id)_getOriginalCameraIntrinsicsForPortType:(id)result;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)prepare;
- (int)process;
- (uint64_t)_sensorRawSampleBufferWithBuffer:(void *)a3 metadata:(const void *)a4 rawThumbnailsBuffer:(const void *)a5 mainRawThumbnailBuffer:(const void *)a6 sifrRawThumbnailBuffer:(const void *)a7 dngDictionary:(uint64_t)a8 captureFrameFlags:(void *)a9 stillImageSettings:(CMSampleBufferRef *)a10 sampleBufferOut:;
- (void)_handleDidDetermineReferenceFrameWithSortedIntermediates:(void *)result;
- (void)_sortedIntermediates;
- (void)dealloc;
@end

@implementation BWDeferredProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWDeferredProcessorController)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BWDeferredProcessorController;
  return [(BWStillImageProcessorController *)&v4 initWithName:@"DeferredProcessor" type:5 configuration:a3];
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWDeferredProcessorController;
  [(BWStillImageProcessorController *)&v4 dealloc];
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  v6 = [(BWStillImageProcessorControllerRequest *)[BWDeferredProcessorControllerRequest alloc] initWithInput:a3 delegate:a4];
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
  return 0;
}

- (int)process
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  unsigned int v101 = 0;
  v73 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input];
  v3 = (void *)[(BWStillImageProcessorControllerInput *)v73 container];
  v74 = self;
  v72 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] delegate];
  if (objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "captureType") != 12
    && (objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "captureFlags") & 0x80) == 0)
  {
    unsigned int v101 = -12780;
    goto LABEL_91;
  }
  context = (void *)MEMORY[0x1A6272C70]();
  objc_super v4 = -[BWDeferredProcessorController _sortedIntermediates](self);
  uint64_t v71 = [NSString stringWithFormat:@"InferenceAttachedMediaMeta-%@", -[BWStillImageProcessorControllerInput portType](v73, "portType")];
  -[BWDeferredProcessorController _handleDidDetermineReferenceFrameWithSortedIntermediates:](self, v4);
  v5 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v97 objects:v102 count:16];
  if (!v6) {
    goto LABEL_90;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v98;
  uint64_t v70 = *MEMORY[0x1E4F533D0];
  uint64_t v78 = *MEMORY[0x1E4F530F0];
  uint64_t v77 = *MEMORY[0x1E4F53068];
  v9 = &off_1E96B5000;
  uint64_t v76 = *MEMORY[0x1E4F53108];
  CFStringRef key = (const __CFString *)*MEMORY[0x1E4F55B90];
  uint64_t v64 = *MEMORY[0x1E4F54128];
  v85 = v3;
  uint64_t v86 = *(void *)v98;
  v75 = v4;
  while (2)
  {
    uint64_t v10 = 0;
    uint64_t v87 = v7;
    do
    {
      if (*(void *)v98 != v8) {
        objc_enumerationMutation(v4);
      }
      v11 = *(void **)(*((void *)&v97 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1A6272C70]();
      unsigned int v96 = 0;
      v13 = (void *)[v11 tag];
      char v14 = [v13 hasPrefix:v9[468]];
      uint64_t v15 = (uint64_t)v13;
      if (v14) {
        goto LABEL_23;
      }
      char v16 = [v13 hasPrefix:BWDeferredIntermediateTagSourceNodePixelBufferAttributes];
      uint64_t v15 = (uint64_t)v13;
      if (v16) {
        goto LABEL_23;
      }
      char v17 = [v13 hasPrefix:BWDeferredIntermediateTagReferenceFrameMetadataByPortTypePrefix];
      uint64_t v15 = (uint64_t)v13;
      if (v17) {
        goto LABEL_23;
      }
      char v18 = [v13 hasPrefix:BWDeferredIntermediateTagSyntheticReferenceFrameMetadataByPortTypePrefix];
      uint64_t v15 = (uint64_t)v13;
      if (v18) {
        goto LABEL_23;
      }
      char v19 = [v13 hasPrefix:BWDeferredIntermediateTagWhiteBalanceMetadataByPortTypePrefix];
      uint64_t v15 = (uint64_t)v13;
      if (v19) {
        goto LABEL_23;
      }
      char v20 = [v13 hasPrefix:BWDeferredIntermediateTagDNGDictionaryPrefix];
      uint64_t v15 = (uint64_t)v13;
      if (v20) {
        goto LABEL_23;
      }
      char v21 = [v13 hasPrefix:BWDeferredIntermediateTagSampleBufferOriginalCameraIntrinsicsPrefix];
      uint64_t v15 = (uint64_t)v13;
      if (v21) {
        goto LABEL_23;
      }
      char v22 = [v13 hasPrefix:BWDeferredIntermediateTagDepthMetadata];
      uint64_t v15 = (uint64_t)v13;
      if (v22) {
        goto LABEL_23;
      }
      char v23 = [v13 hasPrefix:BWDeferredIntermediateTagStereoPhotoDepthMetadata];
      uint64_t v15 = (uint64_t)v13;
      if (v23) {
        goto LABEL_23;
      }
      char v24 = [v13 hasPrefix:BWDeferredIntermediateTagDepthData];
      uint64_t v15 = (uint64_t)v13;
      if (v24) {
        goto LABEL_23;
      }
      if ([v11 isMemberOfClass:objc_opt_class()]
        && ([v11 bufferType] == 2001
         || [v11 bufferType] == 19
         || [v11 bufferType] == 37))
      {
        [v5 addObject:v13];
        uint64_t v15 = [v11 metadataTag];
LABEL_23:
        [v5 addObject:v15];
      }
      if ([v5 containsObject:v13]) {
        goto LABEL_88;
      }
      if ([v11 isMemberOfClass:objc_opt_class()])
      {
        unsigned int v95 = 0;
        unsigned int v94 = 0;
        uint64_t v79 = [v11 bufferType];
        uint64_t v84 = [v11 captureFrameFlags];
        uint64_t v25 = [v3 copyBufferForTag:v13 err:&v95];
        if ([v11 metadataTag])
        {
          v26 = objc_msgSend(v3, "copyMetadataForTag:err:", objc_msgSend(v11, "metadataTag"), &v94);
          v27 = (void *)[v26 mutableCopy];

          objc_msgSend(v5, "addObject:", objc_msgSend(v11, "metadataTag"));
        }
        else
        {
          v27 = 0;
        }
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v90 = __40__BWDeferredProcessorController_process__block_invoke;
        v91 = &unk_1E5C2BF38;
        v92 = v3;
        v93 = v5;
        uint64_t v36 = [v11 rawThumbnailsBufferTag];
        uint64_t v37 = [v11 rawThumbnailsMetadataTag];
        v38 = (void *)((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))v90)(v89, v36, v37, v78);
        uint64_t v39 = [v11 mainRawThumbnailBufferTag];
        uint64_t v40 = [v11 mainRawThumbnailMetadataTag];
        v41 = (void *)((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))v90)(v89, v39, v40, v77);
        uint64_t v42 = [v11 sifrRawThumbnailBufferTag];
        uint64_t v43 = [v11 sifrRawThumbnailMetadataTag];
        v44 = (void *)((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))v90)(v89, v42, v43, v76);
        if (v95)
        {
          unsigned int v101 = v95;
          v45 = (__CVBuffer *)v25;
        }
        else
        {
          v45 = (__CVBuffer *)v25;
          if (v94)
          {
            unsigned int v101 = v94;
          }
          else if (!v101)
          {
            if ((objc_msgSend((id)objc_msgSend(v85, "captureSettings"), "captureFlags") & 4) != 0)
            {
              v68 = 0;
              uint64_t v53 = v84;
              int v67 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v85, "captureSettings"), "masterPortType"), "isEqualToString:", objc_msgSend(v11, "portType"));
              if (v67)
              {
                uint64_t v54 = v79;
                if ((v84 & 0x10) != 0)
                {
                  uint64_t v69 = [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagDNGDictionaryPrefix, -[BWStillImageProcessorControllerInput portType](v73, "portType")];
                  if (objc_msgSend(v85, "hasTag:")) {
                    v68 = (void *)[v85 copyDictionaryForTag:v69 err:&v101];
                  }
                  else {
                    v68 = 0;
                  }
                  uint64_t v66 = [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagSyntheticReferenceFrameMetadataByPortTypePrefix, -[BWStillImageProcessorControllerInput portType](v73, "portType")];
                  if (objc_msgSend(v85, "hasTag:"))
                  {
                    v55 = (void *)[v85 copyDictionaryForTag:v66 err:&v101];
                    [v27 setObject:v55 forKeyedSubscript:@"SyntheticReference"];
                  }
                  uint64_t v54 = v79;
                  uint64_t v53 = v84;
                }
              }
              else
              {
                uint64_t v54 = v79;
              }
              if (v54 == 1)
              {
                uint64_t v80 = [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagWhiteBalanceMetadataByPortTypePrefix, objc_msgSend(v11, "portType")];
                if (objc_msgSend(v85, "hasTag:"))
                {
                  v81 = (void *)[v85 copyDictionaryForTag:v80 err:&v101];
                  [v27 addEntriesFromDictionary:v81];
                }
                CMAttachmentBearerRef target = 0;
                unsigned int v101 = -[BWDeferredProcessorController _sensorRawSampleBufferWithBuffer:metadata:rawThumbnailsBuffer:mainRawThumbnailBuffer:sifrRawThumbnailBuffer:dngDictionary:captureFrameFlags:stillImageSettings:sampleBufferOut:]((uint64_t)v74, v45, v27, v38, v41, v44, v68, v53, [(BWStillImageProcessorControllerInput *)v73 stillImageSettings], (CMSampleBufferRef *)&target);
                if (target) {
                  char v56 = v67;
                }
                else {
                  char v56 = 1;
                }
                v57 = v85;
                if ((v56 & 1) == 0)
                {
                  uint64_t v82 = [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagStereoPhotoDepthMetadata, -[BWStillImageProcessorControllerInput portType](v73, "portType")];
                  int v58 = objc_msgSend(v85, "hasTag:");
                  v57 = v85;
                  if (v58)
                  {
                    v83 = (void *)[v85 copyDictionaryForTag:v82 err:&v101];
                    v59 = (const void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v83];
                    CMSetAttachment(target, key, v59, 1u);

                    v57 = v85;
                  }
                }
                if (objc_msgSend((id)objc_msgSend(v57, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
                {
                  if ((v84 & 0x10) != 0)
                  {
                    CFDictionaryRef v60 = (const __CFDictionary *)-[BWDeferredProcessorController _getOriginalCameraIntrinsicsForPortType:](v74, [v27 objectForKeyedSubscript:v64]);
                    if ([(__CFDictionary *)v60 count]) {
                      CMSetAttachments(target, v60, 1u);
                    }
                  }
                }
                [(BWStillImageProcessorControllerDelegate *)v72 processorController:v74 didFinishProcessingSampleBuffer:target type:1 processorInput:v73 err:v101];
                if (target) {
                  CFRelease(target);
                }
              }
              else
              {
                LODWORD(v62) = v101;
                [(BWStillImageProcessorControllerDelegate *)v72 processorController:v74 didFinishProcessingBuffer:v45 metadata:v27 type:v54 captureFrameFlags:v53 processorInput:v73 err:v62];
              }
            }
            else
            {
              LODWORD(v62) = v101;
              [(BWStillImageProcessorControllerDelegate *)v72 processorController:v74 didFinishProcessingBuffer:v25 metadata:v27 type:v79 captureFrameFlags:v84 processorInput:v73 err:v62];
            }
          }
        }
        CVPixelBufferRelease(v45);
        [v11 releaseBuffer];

        CVPixelBufferRelease((CVPixelBufferRef)v38);
        CVPixelBufferRelease((CVPixelBufferRef)v41);
        CVPixelBufferRelease((CVPixelBufferRef)v44);
        if (v101)
        {
          v3 = v85;
          goto LABEL_90;
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "tag"));
        v3 = v85;
        uint64_t v8 = v86;
        objc_super v4 = v75;
        goto LABEL_86;
      }
      if ([v11 isMemberOfClass:objc_opt_class()])
      {
        uint64_t v28 = [v11 inferenceAttachedMediaKey];
        v29 = (__CVBuffer *)[v11 fetchAndRetain:&v96];
        if ([v11 metadataTag])
        {
          v30 = objc_msgSend(v3, "copyMetadataForTag:err:", objc_msgSend(v11, "metadataTag"), &v96);
          v31 = (void *)[v30 mutableCopy];

          uint64_t v8 = v86;
          objc_msgSend(v5, "addObject:", objc_msgSend(v11, "metadataTag"));
        }
        else
        {
          v31 = 0;
        }
        if (objc_msgSend((id)objc_msgSend(v3, "settings"), "deferredPhotoFinalHeight")
          && objc_msgSend((id)objc_msgSend(v3, "settings"), "deferredPhotoProxyHeight"))
        {
          float v47 = (float)objc_msgSend((id)objc_msgSend(v3, "settings"), "deferredPhotoFinalHeight");
          float v48 = v47 / (float)objc_msgSend((id)objc_msgSend(v3, "settings"), "deferredPhotoProxyHeight");
          v49 = NSNumber;
          [(BWStillImageProcessorControllerConfiguration *)[(BWStillImageProcessorController *)v74 configuration] inferenceMainImageDownscalingFactor];
          *(float *)&double v51 = v48 * v50;
          v52 = v49;
          uint64_t v8 = v86;
          objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(v52, "numberWithFloat:", v51), v70);
        }
        [(BWStillImageProcessorControllerDelegate *)v72 processorController:v74 didFinishProcessingInferenceBuffer:v29 metadata:v31 inferenceAttachedMediaKey:v28 processorInput:v73 err:v96];
        CVPixelBufferRelease(v29);

        [v11 releaseBuffer];
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "tag"));
LABEL_86:
        uint64_t v7 = v87;
        goto LABEL_87;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        v32 = (void *)[v11 performSelector:sel_inferenceAttachmentKey];
        if (([v32 isEqual:0x1EFA6A3A0] & 1) != 0
          || [v32 isEqual:0x1EFA6A380])
        {
          v33 = (void *)MEMORY[0x1E4F1CAD0];
          goto LABEL_36;
        }
        if (([v32 isEqual:0x1EFA6A1A0] & 1) != 0
          || [v32 isEqual:0x1EFA6A0A0])
        {
          v33 = (void *)MEMORY[0x1E4F1CAD0];
          getVNFaceObservationClass();
LABEL_36:
          uint64_t v34 = [v33 setWithObject:objc_opt_class()];
        }
        else
        {
          uint64_t v34 = 0;
        }
        v35 = (void *)[v11 fetchWithCustomClassesAndRetain:v34 err:&v96];
        [(BWStillImageProcessorControllerDelegate *)v72 processorController:v74 didFinishProcessingInference:v35 inferenceAttachmentKey:v32 processorInput:v73 err:v96];

        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "tag"));
LABEL_87:
        v9 = &off_1E96B5000;
        goto LABEL_88;
      }
      if ([v11 isMemberOfClass:objc_opt_class()]
        && objc_msgSend((id)objc_msgSend(v11, "tag"), "isEqualToString:", v71))
      {
        v46 = (void *)[v3 copyDictionaryForTag:v71 err:&v101];
        [(BWStillImageProcessorControllerDelegate *)v72 processorController:v74 didFinishProcessingInferenceAttachedMediaMetadata:v46 processorInput:v73];
      }
LABEL_88:
      ++v10;
    }
    while (v7 != v10);
    uint64_t v7 = [v4 countByEnumeratingWithState:&v97 objects:v102 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_90:
LABEL_91:
  [v3 releaseIntermediates];
  [(BWStillImageProcessorControllerInput *)v73 setProcessorController:0];
  return v101;
}

- (void)_sortedIntermediates
{
  if (!result) {
    return result;
  }
  v1 = result;
  v2 = objc_msgSend((id)objc_msgSend(result, "currentRequest"), "input");
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "container"), "captureSettings"), "captureFlags") & 4) == 0) {
    goto LABEL_3;
  }
  char v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "container"), "captureSettings"), "captureFlags");
  v5 = (void *)[v2 container];
  if ((v4 & 0x80) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType") == 12)
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v1, "configuration"), "ultraHighResolutionSensorRawDimensions");
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "container", MEMORY[0x1E4F143A8], 3221225472, __53__BWDeferredProcessorController__sortedIntermediates__block_invoke_2, &unk_1E5C2BF80, v2, v6), "intermediates"), "sortedArrayUsingComparator:", &v8);
    }
LABEL_3:
    v3 = (void *)[v2 container];
    return (void *)[v3 intermediates];
  }
  uint64_t v7 = (void *)[v5 intermediates];
  return (void *)[v7 sortedArrayUsingComparator:&__block_literal_global_105];
}

- (void)_handleDidDetermineReferenceFrameWithSortedIntermediates:(void *)result
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  v3 = result;
  unsigned int v66 = 0;
  CMSampleBufferRef v65 = 0;
  char v4 = objc_msgSend((id)objc_msgSend(result, "currentRequest"), "input");
  v5 = (void *)[v4 container];
  unint64_t v6 = 0x1E4F29000uLL;
  v52 = v3;
  if ((objc_msgSend((id)objc_msgSend(v4, "captureStreamSettings"), "captureFlags") & 4) == 0)
  {
    uint64_t v7 = (void *)[v5 copyDictionaryForTag:objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagReferenceFrameMetadataByPortTypePrefix, objc_msgSend(v4, "portType")), &v66 err];
    uint64_t v8 = 0;
    if (v7)
    {
LABEL_4:
      double v51 = v7;
      id v9 = (id)[v7 mutableCopy];
      uint64_t v10 = [*(id *)(v6 + 24) stringWithFormat:@"%@-%@", BWDeferredIntermediateTagWhiteBalanceMetadataByPortTypePrefix, objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "masterPortType")];
      if ([v5 hasTag:v10])
      {
        v11 = (void *)[v5 copyDictionaryForTag:v10 err:&v66];
        [v9 addEntriesFromDictionary:v11];
      }
      id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v13 = *MEMORY[0x1E4F53070];
      uint64_t v68 = *MEMORY[0x1E4F53070];
      id v69 = v9;
      char v14 = objc_msgSend(v12, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "stillImageSettings"), "processingSettings"), "photoManifest"), @"PhotoManifest");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v5, "captureSettings"), @"BWStillImageCaptureSettings");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType")), @"StillImageCaptureType");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v5, "settings"), @"StillImageSettings");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v4, "stillImageSettings"), @"StillSettings");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v8), @"StillImageCaptureFrameFlags");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "slaveLensFNumbers"), 0x1EFA73D80);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "slaveFocalLengths"), 0x1EFA73D60);
      uint64_t v15 = NSNumber;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "totalZoomFactor");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v15, "numberWithFloat:"), 0x1EFA40A00);
      char v16 = NSNumber;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "uiZoomFactor");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v16, "numberWithFloat:"), 0x1EFA73BE0);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "deviceType")), 0x1EFA737C0);
      int v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "photoManifest"), "photoDescriptors"), "objectAtIndexedSubscript:", 0), "processingFlags");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v17 & 0xFD5FFFFF), @"StillImageProcessingFlags");
      uint64_t v18 = [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagDNGDictionaryPrefix, objc_msgSend(v4, "portType")];
      if ([v5 hasTag:v18])
      {
        char v19 = (void *)[v5 copyDictionaryForTag:v18 err:&v66];
        [v14 setObject:v19 forKeyedSubscript:0x1EFA740A0];
      }
      id v20 = -[BWDeferredProcessorController _getOriginalCameraIntrinsicsForPortType:](v3, [v4 portType]);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v58 != v23) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", *(void *)(*((void *)&v57 + 1) + 8 * i)), *(void *)(*((void *)&v57 + 1) + 8 * i));
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v57 objects:v67 count:16];
        }
        while (v22);
      }
      memset(&v56, 0, sizeof(v56));
      uint64_t v25 = (void *)[v14 objectForKeyedSubscript:v13];
      CMTimeMakeFromDictionary(&v56, (CFDictionaryRef)[v25 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
      *(_OWORD *)&v55.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
      *(_OWORD *)&v55.decodeTimeStamp.value = v26;
      CMTimeEpoch v27 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
      *(_OWORD *)&v55.duration.value = *MEMORY[0x1E4F1FA70];
      v55.duration.epoch = v28;
      v55.decodeTimeStamp.epoch = v27;
      v55.presentationTimeStamp = v56;
      unsigned int v66 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &v55, 0, 0, &v65);
      CMSetAttachments(v65, (CFDictionaryRef)v14, 1u);
      uint64_t v7 = v51;
      if (objc_msgSend(v5, "hasBufferForType:portType:", 19, objc_msgSend(v4, "portType")))
      {
        id v54 = 0;
        v29 = (__CVBuffer *)objc_msgSend(v5, "copyBufferForType:portType:metadata:err:", 19, objc_msgSend(v4, "portType"), &v54, &v66);
        if (!v66)
        {
          CFTypeRef cf = 0;
          BWSampleBufferSetAttachedMediaFromPixelBuffer(v65, 0x1EFA4EB60, v29, &cf, (uint64_t)v54, 0, 1);
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          if (dword_1EB4C5590)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        if (v29) {
          CFRelease(v29);
        }
      }
      uint64_t v34 = v52;
      if (objc_msgSend(v5, "hasBufferForType:portType:", 2001, objc_msgSend(v4, "portType", sampleTimingArray, v49)))
      {
        id v54 = 0;
        v35 = (__CVBuffer *)objc_msgSend(v5, "copyBufferForType:portType:metadata:err:", 2001, objc_msgSend(v4, "portType"), &v54, &v66);
        if (!v66)
        {
          CFTypeRef cf = 0;
          BWSampleBufferSetAttachedMediaFromPixelBuffer(v65, @"Depth", v35, &cf, (uint64_t)v54, 0, 0);
          AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v65, @"Depth");
          uint64_t v37 = [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagDepthMetadata, objc_msgSend(v4, "portType")];
          if ([v5 hasTag:v37])
          {
            v38 = (void *)[v5 copyDictionaryForTag:v37 err:&v66];
            uint64_t v39 = (const void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v38];
            CMSetAttachment(v65, (CFStringRef)*MEMORY[0x1E4F55B40], v39, 1u);
          }
          uint64_t v40 = [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagDepthData, objc_msgSend(v4, "portType")];
          if ([v5 hasTag:v40])
          {
            v41 = (void *)[v5 copyDictionaryForTag:v40 err:&v66];
            uint64_t v42 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v41];
            CMSetAttachment(AttachedMedia, @"DepthPixelBufferType", (CFTypeRef)[v42 objectForKeyedSubscript:@"DepthPixelBufferType"], 1u);
            [v42 setObject:0 forKeyedSubscript:@"DepthPixelBufferType"];
            CMSetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F52FE8], v42, 1u);
          }
          uint64_t v7 = v51;
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          if (dword_1EB4C5590)
          {
            uint64_t v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t v34 = v52;
          }
        }
        if (v35) {
          CFRelease(v35);
        }
      }
      v44 = objc_msgSend((id)objc_msgSend(v34, "currentRequest", sampleTimingArraya, v50), "delegate");
      CMSampleBufferRef v45 = v65;
      uint64_t v46 = objc_msgSend((id)objc_msgSend(v34, "currentRequest"), "input");
      [v44 processorController:v34 didDetermineReferenceFrame:v45 processorInput:v46 err:v66];
      goto LABEL_51;
    }
    goto LABEL_33;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  char v14 = (void *)[a2 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v14)
  {
    uint64_t v31 = *(void *)v62;
LABEL_23:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v62 != v31) {
        objc_enumerationMutation(a2);
      }
      v33 = *(void **)(*((void *)&v61 + 1) + 8 * v32);
      if ([v33 isMemberOfClass:objc_opt_class()])
      {
        if (([v33 captureFrameFlags] & 0x10) != 0
          && objc_msgSend((id)objc_msgSend(v33, "portType"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "masterPortType")))
        {
          break;
        }
      }
      if (v14 == (void *)++v32)
      {
        char v14 = (void *)[a2 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v14) {
          goto LABEL_23;
        }
        goto LABEL_31;
      }
    }
    uint64_t v7 = objc_msgSend(v5, "copyDictionaryForTag:err:", objc_msgSend(v33, "metadataTag"), &v66);
    uint64_t v8 = [v33 captureFrameFlags];
    v3 = v52;
    unint64_t v6 = 0x1E4F29000;
    if (v7) {
      goto LABEL_4;
    }
LABEL_33:
    char v14 = 0;
    goto LABEL_51;
  }
LABEL_31:
  uint64_t v7 = 0;
LABEL_51:
  if (v65) {
    CFRelease(v65);
  }

  return (void *)v66;
}

__CVBuffer *__40__BWDeferredProcessorController_process__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v12 = 0;
  if (!a2) {
    return 0;
  }
  unint64_t v6 = (__CVBuffer *)[*(id *)(a1 + 32) copyBufferForTag:a2 err:&v12];
  [*(id *)(a1 + 40) addObject:a2];
  if (v12)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3 && v6)
  {
    uint64_t v8 = (void *)[*(id *)(a1 + 32) copyMetadataForTag:a3 err:&v12];
    id v9 = (void *)[v8 mutableCopy];
    [*(id *)(a1 + 40) addObject:a3];
    if (v9)
    {
      CVBufferSetAttachment(v6, (CFStringRef)*MEMORY[0x1E4F53070], v9, kCVAttachmentMode_ShouldPropagate);
    }
    else
    {
      uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v6;
}

- (uint64_t)_sensorRawSampleBufferWithBuffer:(void *)a3 metadata:(const void *)a4 rawThumbnailsBuffer:(const void *)a5 mainRawThumbnailBuffer:(const void *)a6 sifrRawThumbnailBuffer:(const void *)a7 dngDictionary:(uint64_t)a8 captureFrameFlags:(void *)a9 stillImageSettings:(CMSampleBufferRef *)a10 sampleBufferOut:
{
  if (!a1) {
    return 0;
  }
  v30[0] = 0;
  uint64_t v11 = 4294954516;
  if (a2 && a3 && a9 && a10)
  {
    memset(&v29, 0, sizeof(v29));
    CMTimeMakeFromDictionary(&v29, (CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
    if ((a8 & 0x4000000000000000) != 0)
    {
      sampleTimingArray.duration = v29;
      uint64_t v11 = BWSampleBufferCreateFromPixelBuffer(a2, (uint64_t)&sampleTimingArray, (CFTypeRef *)(a1 + 56), v30);
    }
    else
    {
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1F9F8];
      sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      sampleTimingArray.presentationTimeStamp = v29;
      sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
      uint64_t v11 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, v30);
      id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      char v19 = objc_msgSend(v18, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F52F90], 0);
      int v20 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F541A8]), "BOOLValue");
      uint64_t v21 = (CFStringRef *)MEMORY[0x1E4F53100];
      if (!v20) {
        uint64_t v21 = (CFStringRef *)MEMORY[0x1E4F530E0];
      }
      CMSetAttachment(v30[0], *v21, v19, 1u);
    }
    if (!v11)
    {
      CMSetAttachment(v30[0], (CFStringRef)*MEMORY[0x1E4F53070], a3, 1u);
      CMSetAttachment(v30[0], @"StillSettings", a9, 1u);
      CMSetAttachment(v30[0], @"StillImageSettings", (CFTypeRef)[a9 requestedSettings], 1u);
      CMSetAttachment(v30[0], @"BWStillImageCaptureSettings", (CFTypeRef)[a9 captureSettings], 1u);
      CMSetAttachment(v30[0], @"StillImageCaptureType", (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "captureType")), 1u);
      CMSetAttachment(v30[0], @"PhotoManifest", (CFTypeRef)objc_msgSend((id)objc_msgSend(a9, "processingSettings"), "photoManifest"), 1u);
      CMSetAttachment(v30[0], @"StillImageCaptureFrameFlags", (CFTypeRef)[NSNumber numberWithUnsignedLongLong:a8], 1u);
      CMSetAttachment(v30[0], @"ExifSlaveLensFNumbers", (CFTypeRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "slaveLensFNumbers"), 1u);
      CMSetAttachment(v30[0], @"ExifSlaveFocalLengths", (CFTypeRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "slaveFocalLengths"), 1u);
      CMSampleBufferRef v22 = v30[0];
      uint64_t v23 = NSNumber;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "totalZoomFactor");
      CMSetAttachment(v22, @"TotalZoomFactor", (CFTypeRef)objc_msgSend(v23, "numberWithFloat:"), 1u);
      CMSampleBufferRef v24 = v30[0];
      uint64_t v25 = NSNumber;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "uiZoomFactor");
      CMSetAttachment(v24, @"UIZoomFactor", (CFTypeRef)objc_msgSend(v25, "numberWithFloat:"), 1u);
      CMSetAttachment(v30[0], @"CaptureDeviceType", (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "deviceType")), 1u);
      if (a4) {
        CMSetAttachment(v30[0], (CFStringRef)*MEMORY[0x1E4F530F0], a4, 1u);
      }
      if (a5) {
        CMSetAttachment(v30[0], (CFStringRef)*MEMORY[0x1E4F53068], a5, 1u);
      }
      if (a6) {
        CMSetAttachment(v30[0], (CFStringRef)*MEMORY[0x1E4F53108], a6, 1u);
      }
      if (a7) {
        CMSetAttachment(v30[0], @"RawDNGDictionary", a7, 1u);
      }
      uint64_t v11 = 0;
      *a10 = v30[0];
    }
  }
  return v11;
}

- (id)_getOriginalCameraIntrinsicsForPortType:(id)result
{
  if (result)
  {
    if (a2)
    {
      v2 = result;
      uint64_t v3 = [NSString stringWithFormat:@"%@-%@", BWDeferredIntermediateTagSampleBufferOriginalCameraIntrinsicsPrefix, a2];
      char v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "currentRequest"), "input"), "container");
      if ([v4 hasTag:v3])
      {
        int v6 = 0;
        v5 = (void *)[v4 copyDictionaryForTag:v3 err:&v6];
        return v5;
      }
    }
    else
    {
      FigDebugAssert3();
    }
    v5 = 0;
    return v5;
  }
  return result;
}

uint64_t __53__BWDeferredProcessorController__sortedIntermediates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if ([a2 isMemberOfClass:objc_opt_class()]) {
    return FigCapturePixelFormatIsVersatileRaw([a2 pixelFormat]);
  }
  if ([a3 isMemberOfClass:objc_opt_class()]) {
    return FigCapturePixelFormatIsVersatileRaw([a3 pixelFormat]) << 63 >> 63;
  }
  return 0;
}

uint64_t __53__BWDeferredProcessorController__sortedIntermediates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (![a2 isMemberOfClass:objc_opt_class()]
    || ![a3 isMemberOfClass:objc_opt_class()])
  {
    if ([a2 isMemberOfClass:objc_opt_class()]) {
      return -1;
    }
    return ([a3 isMemberOfClass:objc_opt_class()] & 1) != 0;
  }
  int IsVersatileRaw = FigCapturePixelFormatIsVersatileRaw([a2 pixelFormat]);
  int v7 = FigCapturePixelFormatIsVersatileRaw([a3 pixelFormat]);
  char v8 = [a2 captureFrameFlags];
  char v9 = [a3 captureFrameFlags];
  uint64_t v10 = [a2 bufferType];
  uint64_t v11 = [a3 bufferType];
  if (!IsVersatileRaw || !v7)
  {
    if (IsVersatileRaw) {
      uint64_t result = -1;
    }
    else {
      uint64_t result = 1;
    }
    if ((IsVersatileRaw | v7)) {
      return result;
    }
    return 0;
  }
  uint64_t v12 = v11;
  if (v10 == v11)
  {
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "container"), "captureSettings"), "captureFlags") & 0x200000000) == 0)
    {
      if ((v8 & 4) == 0)
      {
        if ((v9 & 4) != 0) {
          return 1;
        }
        if ((v8 & 8) == 0)
        {
          if ((v9 & 8) != 0) {
            return 1;
          }
          if ((v8 & 0x10) == 0)
          {
            if ((v9 & 0x10) != 0) {
              return 1;
            }
            if ((v8 & 2) == 0)
            {
              if ((v9 & 2) == 0)
              {
LABEL_42:
                if (v10 == 37) {
                  return -1;
                }
                else {
                  return v12 == 37;
                }
              }
              return 1;
            }
          }
        }
      }
      return -1;
    }
    char v14 = (void *)[a2 attributes];
    uint64_t v15 = *MEMORY[0x1E4F24E10];
    unsigned int v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "intValue");
    int v17 = (void *)[a2 attributes];
    uint64_t v18 = *MEMORY[0x1E4F24D08];
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue");
    LODWORD(v15) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKeyedSubscript:", v15), "intValue");
    uint64_t v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKeyedSubscript:", v18), "intValue");
    BOOL v21 = FigCaptureVideoDimensionsAreEqual(v16 | (unint64_t)(v19 << 32), *(void *)(a1 + 40));
    BOOL v22 = FigCaptureVideoDimensionsAreEqual(v15 | (unint64_t)(v20 << 32), *(void *)(a1 + 40));
    if (v21) {
      uint64_t result = -1;
    }
    else {
      uint64_t result = 1;
    }
    if (!v21 && !v22)
    {
      if ((v8 & 4) == 0)
      {
        if ((v9 & 4) != 0) {
          return 1;
        }
        if ((v8 & 8) == 0)
        {
          if ((v9 & 8) != 0) {
            return 1;
          }
          if ((v8 & 0x10) == 0)
          {
            if ((v9 & 0x10) != 0) {
              return 1;
            }
            if ((v8 & 0x12) != 2)
            {
              if ((v9 & 0x12) != 2) {
                goto LABEL_42;
              }
              return 1;
            }
          }
        }
      }
      return -1;
    }
  }
  else if (v10 == 1)
  {
    return -1;
  }
  else
  {
    return 1;
  }
  return result;
}

@end