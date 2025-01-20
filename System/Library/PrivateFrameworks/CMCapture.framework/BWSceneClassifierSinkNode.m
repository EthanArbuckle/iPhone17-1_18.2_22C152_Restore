@interface BWSceneClassifierSinkNode
+ (void)initialize;
- (BWMRCSceneObserver)mrcSceneObserver;
- (BWSceneClassifierSinkNode)initWithCaptureDevice:(id)a3 version:(id)a4 sinkID:(id)a5;
- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver;
- (id)nodeSubType;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setMrcSceneObserver:(id)a3;
- (void)setSemanticStyleSceneObserver:(id)a3;
@end

@implementation BWSceneClassifierSinkNode

- (BWSceneClassifierSinkNode)initWithCaptureDevice:(id)a3 version:(id)a4 sinkID:(id)a5
{
  uint64_t v5 = *(void *)&a4.var0;
  v11.receiver = self;
  v11.super_class = (Class)BWSceneClassifierSinkNode;
  v7 = [(BWSinkNode *)&v11 initWithSinkID:a5];
  if (v7)
  {
    v8 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7];
    v9 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v8 setFormatRequirements:v9];

    [(BWNode *)v7 addInput:v8];
    v7->_version.patch = WORD2(v5);
    *(_DWORD *)&v7->_version.major = v5;
    [a3 setSmartCameraVersion:v5 & 0xFFFFFFFFFFFFLL];
    v7->_resultLock._os_unfair_lock_opaque = 0;
    v7->_device = (BWFigVideoCaptureDevice *)a3;
    v7->_observerQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v7;
}

- (void)setSemanticStyleSceneObserver:(id)a3
{
  p_foodScene = &self->_foodScene;
  if (a3)
  {
    BWSmartCameraSceneInitialize((uint64_t)p_foodScene, 0.77 > 0.0, 2, 4, (uint64_t)"Food", 0.77, 0.05, 0.75);
    BWSmartCameraSceneInitialize((uint64_t)&self->_indoorScene, 0.4 > 0.0, 2, 4, (uint64_t)"Indoor", 0.4, 0.05, 0.75);
    BWSmartCameraSceneInitialize((uint64_t)&self->_outdoorScene, 0.58 > 0.0, 2, 4, (uint64_t)"Outdoor", 0.58, 0.05, 0.75);
    BWSmartCameraSceneInitialize((uint64_t)&self->_sunsetScene, 0.88 > 0.0, 2, 4, (uint64_t)"Sunset", 0.88, 0.05, 0.75);
    p_weakSemanticStyleSceneObserver = &self->_weakSemanticStyleSceneObserver;

    v7 = [[FigWeakReference alloc] initWithReferencedObject:a3];
  }
  else
  {
    BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(p_foodScene);
    BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_indoorScene.enabled);
    BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_outdoorScene.enabled);
    BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_sunsetScene.enabled);
    p_weakSemanticStyleSceneObserver = &self->_weakSemanticStyleSceneObserver;

    v7 = 0;
  }
  *p_weakSemanticStyleSceneObserver = v7;
}

- (void)setMrcSceneObserver:(id)a3
{
  if (a3) {
    uint64_t v5 = [[FigWeakReference alloc] initWithReferencedObject:a3];
  }
  else {
    uint64_t v5 = 0;
  }
  self->_weakMRCSceneObserver = v5;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSceneClassifierSinkNode;
  [(BWSinkNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"InferenceConsumer";
}

- (BWMRCSceneObserver)mrcSceneObserver
{
  return (BWMRCSceneObserver *)[(FigWeakReference *)self->_weakMRCSceneObserver referencedObject];
}

- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver
{
  return (BWSemanticStyleSceneObserver *)[(FigWeakReference *)self->_weakSemanticStyleSceneObserver referencedObject];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__BWSceneClassifierSinkNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(observerQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)BWSceneClassifierSinkNode;
  [(BWSinkNode *)&v6 didReachEndOfDataForInput:a3];
}

void __55__BWSceneClassifierSinkNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 200) = 0;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  AttachedInferenceResult = (BWInferenceResult *)BWInferenceGetAttachedInferenceResult(a3, 101);
  if (AttachedInferenceResult)
  {
    objc_super v6 = AttachedInferenceResult;
    if (![(NSString *)[(BWInferenceResult *)AttachedInferenceResult preventionReason] isEqualToString:@"BlurryInputBuffer"])
    {
      if ([(NSString *)[(BWInferenceResult *)v6 preventionReason] isEqualToString:@"FilteredInputBuffer"])
      {
        v7 = [BWInferenceResult alloc];
        objc_super v6 = [(BWInferenceResult *)v7 initWithResult:v6 replacementInferences:MEMORY[0x1E4F1CC08] replacementPreventionReason:0];
      }
      os_unfair_lock_lock(&self->_resultLock);

      self->_mostRecentSmartCameraResult = v6;
      os_unfair_lock_unlock(&self->_resultLock);
      if ([(BWInferenceResult *)v6 isValid])
      {
        v8 = [(BWInferenceResult *)v6 inferences];
        v9 = v8;
        if (self->_weakMRCSceneObserver)
        {
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D78]), "floatValue");
          int v11 = v10;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D38]), "floatValue");
          int v13 = v12;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D48]), "floatValue");
          int v15 = v14;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D90]), "floatValue");
          int v17 = v16;
          id v18 = [(FigWeakReference *)self->_weakMRCSceneObserver referencedObject];
          LODWORD(v19) = v11;
          LODWORD(v20) = v13;
          LODWORD(v21) = v15;
          LODWORD(v22) = v17;
          [v18 sceneDidChangeQRConfidence:v19 appClipCodeConfidence:v20 documentConfidence:v21 textConfidence:v22];
        }
        weakSemanticStyleSceneObserver = self->_weakSemanticStyleSceneObserver;
        if (weakSemanticStyleSceneObserver)
        {
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D50]), "floatValue");
          float v25 = v24;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D58]), "floatValue");
          float v27 = v26;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D70]), "floatValue");
          float v29 = v28;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D88]), "floatValue");
          float v31 = v30;
          BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_foodScene, v25);
          BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_indoorScene, v27);
          BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_outdoorScene, v29);
          BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_sunsetScene, v31);
          if (self->_foodScene.confident)
          {
            uint64_t v32 = 1;
          }
          else if (self->_sunsetScene.confident)
          {
            uint64_t v32 = 3;
          }
          else if (self->_indoorScene.confident)
          {
            uint64_t v32 = 0;
          }
          else
          {
            uint64_t v32 = 2 * self->_outdoorScene.confident;
          }
          if (self->_semanticStyleSceneType == v32)
          {
            LOBYTE(weakSemanticStyleSceneObserver) = 0;
          }
          else
          {
            self->_semanticStyleSceneType = v32;
            objc_msgSend(-[FigWeakReference referencedObject](self->_weakSemanticStyleSceneObserver, "referencedObject"), "semanticStyleSceneTypeDidChange:", v32);
            LOBYTE(weakSemanticStyleSceneObserver) = 1;
          }
        }
        else
        {
          LODWORD(v32) = 0;
        }
        observerQueue = self->_observerQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__BWSceneClassifierSinkNode_renderSampleBuffer_forInput___block_invoke;
        block[3] = &unk_1E5C260F8;
        block[4] = self;
        void block[5] = v6;
        char v36 = (char)weakSemanticStyleSceneObserver;
        int v35 = v32;
        dispatch_async(observerQueue, block);
      }
    }
  }
}

uint64_t __57__BWSceneClassifierSinkNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 200) updateSmartCameraStreamPropertiesWithInferenceResult:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 52))
  {
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 200);
    uint64_t v4 = *(unsigned int *)(a1 + 48);
    return [v3 semanticStyleSceneTypeDidChange:v4];
  }
  return result;
}

@end