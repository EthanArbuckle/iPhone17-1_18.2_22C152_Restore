@interface BWDeferredCaptureController
+ (BOOL)usesCustomProcessingFlow;
- (BWDeferredCaptureController)initWithConfiguration:(id)a3;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)prepare;
- (int)process;
- (void)_addInferences;
- (void)cancelProcessing;
- (void)input:(id)a3 encounteredProcessingError:(int)a4;
@end

@implementation BWDeferredCaptureController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWDeferredCaptureController)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BWDeferredCaptureController;
  return [(BWStillImageProcessorController *)&v4 initWithName:@"DeferredCapture" type:14 configuration:a3];
}

- (void)input:(id)a3 encounteredProcessingError:(int)a4
{
  [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] setErr:*(void *)&a4];
  [(BWDeferredCaptureController *)self cancelProcessing];
}

- (void)cancelProcessing
{
  v3 = [(BWStillImageProcessorController *)self currentRequest];
  uint64_t v4 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] err];
  uint64_t v5 = [(FigCaptureStillImageSettings *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] settings] captureRequestIdentifier];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([+[BWDeferredCaptureContainerManager sharedInstance] lookupCaptureContainer:v5])
    {
      [+[BWDeferredCaptureContainerManager sharedInstance] abortContainer:v6 error:v4];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)BWDeferredCaptureController;
  [(BWStillImageProcessorController *)&v7 cancelProcessing];
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  uint64_t v6 = [(BWStillImageProcessorControllerRequest *)[BWDeferredCaptureControllerRequest alloc] initWithInput:a3 delegate:a4];
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
  v3 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input];
  [(BWDeferredCaptureController *)self _addInferences];
  uint64_t v4 = +[BWDeferredCaptureContainerManager sharedInstance];
  uint64_t v5 = [(FigCaptureStillImageSettings *)[(BWStillImageProcessorControllerInput *)v3 settings] captureRequestIdentifier];
  return [(BWDeferredCaptureContainerManager *)v4 commitContainer:v5];
}

- (void)_addInferences
{
  v32[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input];
  if ([(BWStillImageProcessorControllerInput *)v3 skipInferences])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = (void *)[(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] delegate] processorController:self newInferencesForProcessorInput:v3];
    if (v4)
    {
      uint64_t v5 = [(BWStillImageProcessorControllerInput *)v3 portType];
      v32[0] = @"PersonSemanticsSkin";
      v32[1] = @"PersonSemanticsHair";
      v32[2] = 0x1EFA745A0;
      v32[3] = 0x1EFA6A200;
      v32[4] = 0x1EFA74420;
      uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v32, 5), "arrayByAddingObjectsFromArray:", BWInferenceLowResPersonInstanceMaskKeys());
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v12 = [v4 inferenceBufferForAttachedMediaKey:v11];
            if (v12) {
              -[BWStillImageProcessorControllerInput _addInferenceBuffer:metadata:inferenceAttachedMediaKey:portType:](v3, "_addInferenceBuffer:metadata:inferenceAttachedMediaKey:portType:", v12, [v4 metadataForAttachedMediaKey:v11], v11, v5);
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v8);
      }
      v30[0] = 0x1EFA6A380;
      v30[1] = 0x1EFA6A3A0;
      v30[2] = 0x1EFA6A1A0;
      v30[3] = 0x1EFA6A0A0;
      v30[4] = 0x1EFA6A1C0;
      v13 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * j);
            uint64_t v19 = [v4 inferenceForAttachmentKey:v18];
            if (v19) {
              [(BWStillImageProcessorControllerInput *)v3 _addInference:v19 inferenceAttachmentKey:v18 portType:v5];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v15);
      }
      if ([v4 inferenceAttachedMediaMetadata])
      {
        uint64_t v20 = [v4 inferenceAttachedMediaMetadata];
        -[BWStillImageProcessorControllerInput _addDictionary:tag:](v3, "_addDictionary:tag:", v20, [NSString stringWithFormat:@"InferenceAttachedMediaMeta-%@", v5]);
      }
    }
  }
}

@end