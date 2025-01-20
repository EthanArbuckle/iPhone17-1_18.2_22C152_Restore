@interface BWRedEyeReductionController
+ (id)_newRedEyeRepairSessionWithMetalCommandQueue:(uint64_t)a1;
+ (void)initialize;
+ (void)prewarm;
- (BOOL)_receivedRequiredFramesForRequest:(uint64_t)a1;
- (BWRedEyeReductionController)initWithConfiguration:(id)a3;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4;
- (uint64_t)_clearRequest:(uint64_t)result;
- (uint64_t)_configureRedEyeReductionSessionWithConfiguration:(uint64_t)a1;
- (uint64_t)_processRedEyeReductionWhenNecessaryForRequest:(int)a3 skipProcessing:;
- (uint64_t)_serviceRequests;
- (unint64_t)type;
- (void)_propagateSensorInterfaceRawFromAuxImage:(const void *)a3 toPrimaryImage:;
- (void)_requestForInput:(uint64_t)a1;
- (void)cancelProcessing;
- (void)dealloc;
- (void)didReceiveAllFramesForInput:(id)a3;
- (void)didReceiveFrameForInput:(id)a3;
@end

@implementation BWRedEyeReductionController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWRedEyeReductionController)initWithConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BWRedEyeReductionController;
  v4 = [(BWRedEyeReductionController *)&v7 init];
  v5 = v4;
  if (v4
    && -[BWRedEyeReductionController _configureRedEyeReductionSessionWithConfiguration:]((uint64_t)v4, a3))
  {

    return 0;
  }
  return v5;
}

- (uint64_t)_configureRedEyeReductionSessionWithConfiguration:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a2, "sensorConfigurationsByPortType"), "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = objc_msgSend(a2, "sensorConfigurationsByPortType", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = *MEMORY[0x1E4F52DE0];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v11 isEqualToString:v9] & 1) == 0)
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11), "sensorIDDictionary"), "objectForKeyedSubscript:", @"RedEyeReductionParameters"), v11);
            if (![v4 objectForKeyedSubscript:v11])
            {
              uint64_t v2 = 4294954516;
              goto LABEL_15;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    *(void *)(v2 + 56) = v4;
    id v12 = +[BWRedEyeReductionController _newRedEyeRepairSessionWithMetalCommandQueue:]((uint64_t)BWRedEyeReductionController, [a2 metalCommandQueue]);
    *(void *)(v2 + 64) = v12;
    if (v12
      && [v12 prepareRepair]
      && (id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]), (*(void *)(v2 + 80) = v13) != 0))
    {
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = FigSignalErrorAt();
    }
LABEL_15:
  }
  return v2;
}

+ (id)_newRedEyeRepairSessionWithMetalCommandQueue:(uint64_t)a1
{
  v12[3] = *MEMORY[0x1E4F143B8];
  self;
  v3 = (void *)MEMORY[0x1E4F1E018];
  v11[0] = *MEMORY[0x1E4F1E248];
  uint64_t v4 = [NSNumber numberWithInt:*MEMORY[0x1E4F1E300]];
  uint64_t v5 = *MEMORY[0x1E4F1E1E0];
  v12[0] = v4;
  v12[1] = MEMORY[0x1E4F1CC28];
  v11[1] = v5;
  v11[2] = @"kCIContextIOSurfaceMemoryPoolID";
  v12[2] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  uint64_t v6 = objc_msgSend(v3, "contextWithMTLCommandQueue:options:", a2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1E038]);
    id v9 = v8;
    if (v8) {
      [v8 setContext:v7];
    }
    else {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    return 0;
  }
  return v9;
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWRedEyeReductionController;
  [(BWStillImageProcessorController *)&v4 dealloc];
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  uint64_t v7 = [[BWRedEyeReductionRequest alloc] initWithInput:a3 delegate:a4];
  [(BWRedEyeReductionRequest *)v7 setMode:0];
  [a3 setInputDelegate:self];
  [a3 setProcessorControllerDelegate:a4];
  [(NSMutableArray *)self->_requestQueue addObject:v7];

  -[BWRedEyeReductionController _serviceRequests]((uint64_t)self);
  return 0;
}

- (uint64_t)_serviceRequests
{
  if (result)
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 80) firstObject];
    if (result)
    {
      uint64_t v2 = (void *)result;
      do
      {
        if (!objc_msgSend((id)objc_msgSend(v2, "input"), "primaryImage"))
        {
          result = objc_msgSend((id)objc_msgSend(v2, "input"), "auxImage");
          if (!result) {
            break;
          }
        }
        -[BWRedEyeReductionController _processRedEyeReductionWhenNecessaryForRequest:skipProcessing:](v1, v2, 0);
        result = [*(id *)(v1 + 80) firstObject];
        BOOL v3 = result == (void)v2;
        uint64_t v2 = (void *)result;
      }
      while (!v3);
    }
  }
  return result;
}

- (void)cancelProcessing
{
  for (uint64_t i = self->_requestQueue; [(NSMutableArray *)i count]; uint64_t i = self->_requestQueue)
    -[BWRedEyeReductionController _processRedEyeReductionWhenNecessaryForRequest:skipProcessing:]((uint64_t)self, (void *)[(NSMutableArray *)self->_requestQueue firstObject], 1);
}

- (uint64_t)_processRedEyeReductionWhenNecessaryForRequest:(int)a3 skipProcessing:
{
  v43[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (void *)[a2 input];
    uint64_t v7 = (void *)[v6 primaryImage];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F53070];
    id v9 = (void *)CMGetAttachment(v7, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v10 = [v6 auxImage];
    if ((a3 & 1) == 0)
    {
      v11 = (void *)v10;
      if (v7 && ![a2 mode])
      {
        CFStringRef v39 = v8;
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v7);
        uint64_t v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
        if (!v13
          || (v14 = v13, (uint64_t v15 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F53248]]) == 0)
          || (uint64_t v37 = v15,
              CVImageBufferRef v38 = ImageBuffer,
              (uint64_t v36 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F540F8]]) == 0)
          || (unint64_t v16 = objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "sceneFlags"),
              (uint64_t ModelSpecificName = FigCaptureGetModelSpecificName()) == 0))
        {
          unsigned int v27 = FigSignalErrorAt();
          uint64_t v28 = 1;
          CFStringRef v8 = v39;
          goto LABEL_27;
        }
        uint64_t v18 = ModelSpecificName;
        v40 = v11;
        v41 = v9;
        uint64_t v19 = [*(id *)(v5 + 56) objectForKeyedSubscript:v14];
        int v35 = a3;
        if (v19)
        {
          uint64_t v42 = v14;
          v43[0] = v19;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
        }
        else
        {
          uint64_t v20 = 0;
        }
        uint64_t v21 = [v6 faceObservations];
        v22 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v23 = [NSNumber numberWithBool:(v16 >> 5) & 1];
        if (objc_msgSend(*(id *)(v5 + 64), "setPrimary:observations:metadata:", v38, v21, objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x1E4F1DFE8], v37, *MEMORY[0x1E4F1DFC8], v14, *MEMORY[0x1E4F1DFD8], v36, *MEMORY[0x1E4F1DFD0], v18, *MEMORY[0x1E4F1DFC0], v20, *MEMORY[0x1E4F1DFE0],
                               0)))
          uint64_t v24 = 2;
        else {
          uint64_t v24 = 1;
        }
        [a2 setMode:v24];
        CFStringRef v8 = v39;
        v11 = v40;
        a3 = v35;
        id v9 = v41;
        if (dword_1E96B6AC8)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v11 = v40;
          id v9 = v41;
        }
      }
      if (-[BWRedEyeReductionController _receivedRequiredFramesForRequest:](v5, a2))
      {
        int v26 = [a2 mode];
        if (v26 == 1)
        {
          if ([v6 requiresSensorInterfaceRawPropagation]) {
            -[BWRedEyeReductionController _propagateSensorInterfaceRawFromAuxImage:toPrimaryImage:](v5, v11, v7);
          }
        }
        else if (v26 == 2)
        {
          if ([v6 requiresSensorInterfaceRawPropagation]) {
            -[BWRedEyeReductionController _propagateSensorInterfaceRawFromAuxImage:toPrimaryImage:](v5, v11, v7);
          }
          if ([*(id *)(v5 + 64) repairPrimaryWithSecondary:CMSampleBufferGetImageBuffer((CMSampleBufferRef)v11)])
          {
            unsigned int v27 = 0;
            uint64_t v28 = 3;
          }
          else
          {
            unsigned int v27 = FigSignalErrorAt();
            uint64_t v28 = 2;
          }
LABEL_27:
          if (!-[BWRedEyeReductionController _receivedRequiredFramesForRequest:](v5, a2) && !v27 && !a3)
          {
            result = [a2 mode];
            if (result == 2) {
              return objc_msgSend((id)objc_msgSend(a2, "delegate"), "processorController:willProcessRedEyeReductionForProcessorInput:", v5, v6);
            }
            return result;
          }
          if (v27)
          {
            if (!v7) {
              goto LABEL_38;
            }
          }
          else if (!v7 || (a3 & 1) == 0)
          {
LABEL_38:
            if (((v7 == 0) & a3) != 0) {
              uint64_t v29 = 4294954516;
            }
            else {
              uint64_t v29 = v27;
            }
            uint64_t v30 = 17;
            goto LABEL_42;
          }
          uint64_t v29 = 0;
          uint64_t v30 = 18;
LABEL_42:
          v31 = objc_msgSend(v9, "mutableCopy", v33, v34);
          uint64_t v32 = [NSNumber numberWithInt:v28];
          [v31 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F53448]];
          CMSetAttachment(v7, v8, v31, 1u);

          objc_msgSend((id)objc_msgSend(a2, "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v5, v7, v30, v6, v29);
          return -[BWRedEyeReductionController _clearRequest:](v5, a2);
        }
      }
    }
    unsigned int v27 = 0;
    uint64_t v28 = 1;
    goto LABEL_27;
  }
  return result;
}

- (unint64_t)type
{
  return 4;
}

+ (void)prewarm
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F55F60] metalDevice];
  if (v2 && (uint64_t v3 = [v2 newCommandQueue]) != 0)
  {
    id v6 = (id)v3;
    id v4 = +[BWRedEyeReductionController _newRedEyeRepairSessionWithMetalCommandQueue:]((uint64_t)BWRedEyeReductionController, v3);
    uint64_t v5 = v4;
    if (!v4 || ([v4 prewarm] & 1) == 0) {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v5 = 0;
    id v6 = 0;
  }
}

- (void)didReceiveFrameForInput:(id)a3
{
  id v4 = -[BWRedEyeReductionController _requestForInput:]((uint64_t)self, (uint64_t)a3);
  if (self && v4 && v4 == (void *)[(NSMutableArray *)self->_requestQueue firstObject])
  {
    -[BWRedEyeReductionController _serviceRequests]((uint64_t)self);
  }
}

- (void)_requestForInput:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    FigDebugAssert3();
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = *(void **)(a1 + 80);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_5:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(v3);
    }
    CFStringRef v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
    if ([v8 input] == a2) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_5;
      }
      return 0;
    }
  }
}

- (void)didReceiveAllFramesForInput:(id)a3
{
  uint64_t v5 = -[BWRedEyeReductionController _requestForInput:]((uint64_t)self, (uint64_t)a3);
  if (![a3 primaryImage] || !objc_msgSend(a3, "auxImage") && objc_msgSend(v5, "mode") != 1) {
    -[BWRedEyeReductionController _processRedEyeReductionWhenNecessaryForRequest:skipProcessing:]((uint64_t)self, v5, 1);
  }
  uint64_t v6 = (void *)[a3 processorControllerDelegate];
  [v6 processorController:self didFinishProcessingInput:a3 err:0];
}

- (uint64_t)_clearRequest:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    result = [*(id *)(result + 80) containsObject:a2];
    if (result)
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "input"), "stillImageSettings"), "captureSettings"), "captureFlags") & 8) != 0&& objc_msgSend(a2, "mode") == 1)
      {
        objc_msgSend(v3, "didReceiveAllFramesForInput:", objc_msgSend(a2, "input"));
      }
      uint64_t v4 = (void *)v3[10];
      return [v4 removeObject:a2];
    }
  }
  return result;
}

- (BOOL)_receivedRequiredFramesForRequest:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = (void *)[a2 input];
  int v4 = [a2 mode];
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      if (![v3 requiresSensorInterfaceRawPropagation]) {
        return 1;
      }
    }
    else if (v4)
    {
      return v5;
    }
  }
  return [v3 primaryImage] && objc_msgSend(v3, "auxImage") != 0;
}

- (void)_propagateSensorInterfaceRawFromAuxImage:(const void *)a3 toPrimaryImage:
{
  if (a1)
  {
    uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(a2, 0x1EFA74360);
    if (AttachedMedia)
    {
      BWSampleBufferSetAttachedMedia(a3, 0x1EFA74360, AttachedMedia);
    }
  }
}

@end