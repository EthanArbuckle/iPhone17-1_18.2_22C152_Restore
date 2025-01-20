@interface AVCaptureMetadataOutput
+ (id)_metadataConstantValueToName:(id)a3;
+ (void)initialize;
- (AVCaptureMetadataOutput)init;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)emitsEmptyObjectDetectionMetadata;
- (BOOL)isAppClipCodeMetadataObjectTypeAvailable;
- (BOOL)isAppClipCodeMetadataSupported;
- (BOOL)isAttentionDetectionEnabled;
- (BOOL)isAttentionDetectionSupported;
- (BOOL)isFaceTrackingMetadataObjectTypesAvailable;
- (BOOL)isFaceTrackingPlusEnabled;
- (BOOL)isFaceTrackingSupported;
- (BOOL)isFaceTrackingUsingFaceRecognition;
- (BOOL)isHeadMetadataObjectTypesAvailable;
- (BOOL)isHeadMetadataSupported;
- (BOOL)isHumanHandMetadataObjectTypeAvailable;
- (BOOL)isHumanHandMetadataSupported;
- (BOOL)isOfflineVideoStabilizationMotionMetadataObjectTypesAvailable;
- (BOOL)isOfflineVideoStabilizationMotionMetadataSupported;
- (BOOL)isSceneClassificationMetadataObjectTypeAvailable;
- (BOOL)isSceneClassificationMetadataSupported;
- (BOOL)isTextRegionMetadataObjectTypeAvailable;
- (BOOL)isTextRegionMetadataSupported;
- (BOOL)isVideoPreviewHistogramMetadataObjectTypesAvailable;
- (BOOL)isVideoPreviewHistogramMetadataSupported;
- (BOOL)isVisualIntelligenceMetadataObjectTypeAvailable;
- (BOOL)isVisualIntelligenceMetadataSupported;
- (CGRect)rectOfInterest;
- (NSArray)availableMetadataObjectTypes;
- (NSArray)metadataObjectTypes;
- (OS_dispatch_queue)delegateOverrideCallbackQueue;
- (dispatch_queue_t)metadataObjectsCallbackQueue;
- (float)faceTrackingFailureFieldOfViewModifier;
- (float)faceTrackingNetworkFailureThresholdMultiplier;
- (id)_appClipCodesCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_barcodeCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_detectedObjectsCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4 facesArrayOut:(id *)a5 need180DegreeMetadataTransform:(BOOL)a6;
- (id)_eyeReliefResultCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_legacyFaceCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_lumaHistogramDataCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_metadataIdentifiers;
- (id)_offlineVISMotionCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_sceneClassificationCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_textRegionsCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_trackedFacesCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)_visualIntelligenceCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4;
- (id)connectionMediaTypes;
- (id)delegateOverride;
- (id)metadataIdentifiersForMetadataObjectTypes:(id)a3;
- (id)metadataObjectTypesForMetadataIdentifiers:(id)a3;
- (id)metadataObjectsDelegate;
- (int64_t)faceTrackingMaxFaces;
- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3;
- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_updateLocalQueue:(localQueueOpaque *)a3;
- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)setAppClipCodeMetadataObjectTypeAvailable:(BOOL)a3;
- (void)setAttentionDetectionEnabled:(BOOL)a3;
- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4;
- (void)setEmitsEmptyObjectDetectionMetadata:(BOOL)a3;
- (void)setFaceTrackingFailureFieldOfViewModifier:(float)a3;
- (void)setFaceTrackingMaxFaces:(int64_t)a3;
- (void)setFaceTrackingMetadataObjectTypesAvailable:(BOOL)a3;
- (void)setFaceTrackingNetworkFailureThresholdMultiplier:(float)a3;
- (void)setFaceTrackingPlusEnabled:(BOOL)a3;
- (void)setFaceTrackingUsesFaceRecognition:(BOOL)a3;
- (void)setHeadMetadataObjectTypesAvailable:(BOOL)a3;
- (void)setHumanHandMetadataObjectTypeAvailable:(BOOL)a3;
- (void)setMetadataObjectTypes:(NSArray *)metadataObjectTypes;
- (void)setMetadataObjectsDelegate:(id)objectsDelegate queue:(dispatch_queue_t)objectsCallbackQueue;
- (void)setOfflineVideoStabilizationMotionMetadataObjectTypesAvailable:(BOOL)a3;
- (void)setRectOfInterest:(CGRect)rectOfInterest;
- (void)setSceneClassificationMetadataObjectTypeAvailable:(BOOL)a3;
- (void)setTextRegionMetadataObjectTypeAvailable:(BOOL)a3;
- (void)setVideoPreviewHistogramMetadataObjectTypesAvailable:(BOOL)a3;
- (void)setVisualIntelligenceMetadataObjectTypeAvailable:(BOOL)a3;
@end

@implementation AVCaptureMetadataOutput

- (NSArray)metadataObjectTypes
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureMetadataOutputCapturesFacesByDefault")
    && !self->_internal->metadataObjectTypes
    && objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "isFaceDetectionSupported"))
  {
    v7[0] = @"face";
    return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    metadataObjectTypes = self->_internal->metadataObjectTypes;
    if (metadataObjectTypes)
    {
      v5 = (void *)[(NSArray *)metadataObjectTypes copy];
      return (NSArray *)v5;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F1C978];
      return (NSArray *)[v6 array];
    }
  }
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  if (!objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", AVMediaTypeForMetadataObjects()))
  {
    uint64_t v7 = 1;
    goto LABEL_5;
  }
  if ([(NSArray *)[(AVCaptureOutput *)self connections] count])
  {
    uint64_t v7 = 2;
LABEL_5:
    v8 = (void *)AVCaptureOutputConnectionFailureReasonString(v7, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v8;
    return result;
  }
  return 1;
}

- (id)metadataIdentifiersForMetadataObjectTypes:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionaryOnceToken != -1) {
    dispatch_once(&metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionaryOnceToken, &__block_literal_global_149);
  }
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [(id)metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
        internal = self->_internal;
        if (internal->faceTrackingMetadataObjectTypesAvailable && v11 == 0)
        {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sFaceTrackingMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        else
        {
          uint64_t v14 = v11;
        }
        if (internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sOfflineVideoStabilizationMotionMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->videoPreviewHistogramMetadataObjectTypesAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sVideoPreviewHistogramMetadataConstantsToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->appClipCodeObjectTypeAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sAppClipCodeMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->textRegionObjectTypeAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sTextRegionMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->sceneClassificationObjectTypeAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sSceneClassificationMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->visualIntelligenceObjectTypeAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sVisualIntelligenceMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->headObjectTypesAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sHeadMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->humanHandObjectTypeAvailable && v14 == 0) {
          uint64_t v14 = [(id)metadataIdentifiersForMetadataObjectTypes__sHumanHandMetadataConstantToMetadataIdentifierDictionary objectForKeyedSubscript:v10];
        }
        if (v14) {
          objc_msgSend(v5, "addObject:");
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
  return v5;
}

- (CGRect)rectOfInterest
{
  internal = self->_internal;
  double x = internal->rectOfInterest.origin.x;
  double y = internal->rectOfInterest.origin.y;
  double width = internal->rectOfInterest.size.width;
  double height = internal->rectOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isFaceTrackingUsingFaceRecognition
{
  return self->_internal->faceTrackingUsesFaceRecognition;
}

- (BOOL)isFaceTrackingPlusEnabled
{
  return self->_internal->faceTrackingPlusEnabled;
}

- (BOOL)isAttentionDetectionEnabled
{
  return self->_internal->attentionDetectionEnabled;
}

- (float)faceTrackingNetworkFailureThresholdMultiplier
{
  return self->_internal->faceTrackingNetworkFailureThresholdMultiplier;
}

- (int64_t)faceTrackingMaxFaces
{
  return self->_internal->faceTrackingMaxFaces;
}

- (float)faceTrackingFailureFieldOfViewModifier
{
  return self->_internal->faceTrackingFailureFieldOfViewModifier;
}

- (id)_metadataIdentifiers
{
  return [(AVCaptureMetadataOutput *)self metadataIdentifiersForMetadataObjectTypes:self->_internal->metadataObjectTypes];
}

+ (void)initialize
{
}

- (void)setAppClipCodeMetadataObjectTypeAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCaptureMetadataOutput *)self isAppClipCodeMetadataSupported])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (self->_internal->appClipCodeObjectTypeAvailable != v3)
  {
    [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
    self->_internal->appClipCodeObjectTypeAvailable = v3;
    if (!v3)
    {
      v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
      [v5 removeObject:@"com.apple.AppClipCode"];
      uint64_t v6 = [v5 count];
      if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
        [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
      }
    }
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
  }
}

- (BOOL)isHeadMetadataSupported
{
  v2 = [(AVCaptureOutput *)self connectionWithMediaType:AVMediaTypeForMetadataObjects()];
  BOOL v3 = objc_msgSend(-[AVCaptureConnection sourceDevice](v2, "sourceDevice"), "supportedMetadataObjectIdentifiers");
  if ([v3 containsObject:*MEMORY[0x1E4F52778]]) {
    return 1;
  }
  v4 = objc_msgSend(-[AVCaptureConnection sourceDevice](v2, "sourceDevice"), "supportedMetadataObjectIdentifiers");
  if ([v4 containsObject:*MEMORY[0x1E4F52760]]) {
    return 1;
  }
  uint64_t v6 = objc_msgSend(-[AVCaptureConnection sourceDevice](v2, "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v7 = *MEMORY[0x1E4F52768];

  return [v6 containsObject:v7];
}

- (void)setFaceTrackingMetadataObjectTypesAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureMetadataOutput *)self isFaceTrackingSupported])
  {
    if (self->_internal->faceTrackingMetadataObjectTypesAvailable != v3)
    {
      [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
      self->_internal->faceTrackingMetadataObjectTypesAvailable = v3;
      if (!v3)
      {
        v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
        [v5 removeObject:@"trackedFaces"];
        uint64_t v6 = [v5 count];
        if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
          [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
        }
      }
      [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
    }
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (BOOL)isFaceTrackingSupported
{
  v2 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v3 = *MEMORY[0x1E4F218A8];

  return [v2 containsObject:v3];
}

- (void)setVideoPreviewHistogramMetadataObjectTypesAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ![(AVCaptureMetadataOutput *)self isVideoPreviewHistogramMetadataSupported])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (self->_internal->videoPreviewHistogramMetadataObjectTypesAvailable != v3)
  {
    [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
    self->_internal->videoPreviewHistogramMetadataObjectTypesAvailable = v3;
    if (!v3)
    {
      v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
      [v5 removeObject:@"videoPreviewHistogram"];
      uint64_t v6 = [v5 count];
      if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
        [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
      }
    }
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
  }
}

- (BOOL)isVideoPreviewHistogramMetadataSupported
{
  v2 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v3 = *MEMORY[0x1E4F527A8];

  return [v2 containsObject:v3];
}

- (void)setTextRegionMetadataObjectTypeAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCaptureMetadataOutput *)self isTextRegionMetadataSupported])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (self->_internal->textRegionObjectTypeAvailable != v3)
  {
    [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
    self->_internal->textRegionObjectTypeAvailable = v3;
    if (!v3)
    {
      v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
      [v5 removeObject:@"textRegion"];
      uint64_t v6 = [v5 count];
      if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
        [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
      }
    }
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
  }
}

- (BOOL)isTextRegionMetadataSupported
{
  v2 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v3 = *MEMORY[0x1E4F52788];

  return [v2 containsObject:v3];
}

- (BOOL)isAppClipCodeMetadataSupported
{
  v2 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v3 = *MEMORY[0x1E4F52780];

  return [v2 containsObject:v3];
}

- (NSArray)availableMetadataObjectTypes
{
  uint64_t v3 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");

  return (NSArray *)[(AVCaptureMetadataOutput *)self metadataObjectTypesForMetadataIdentifiers:v3];
}

- (void)setMetadataObjectTypes:(NSArray *)metadataObjectTypes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (metadataObjectTypes)
  {
    v5 = [(AVCaptureMetadataOutput *)self availableMetadataObjectTypes];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(NSArray *)metadataObjectTypes countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(metadataObjectTypes);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (![(NSArray *)v5 containsObject:v10])
          {
            v12 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, v10);
            if (AVCaptureShouldThrowForAPIViolations()) {
              objc_exception_throw(v12);
            }
            NSLog(&cfstr_SuppressingExc.isa, v12);
            return;
          }
        }
        uint64_t v7 = [(NSArray *)metadataObjectTypes countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v11 = self->_internal->metadataObjectTypes;
  if (v11 != metadataObjectTypes && ![(NSArray *)v11 isEqualToArray:metadataObjectTypes])
  {

    self->_internal->metadataObjectTypes = (NSArray *)[(NSArray *)metadataObjectTypes copy];
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (id)metadataObjectTypesForMetadataIdentifiers:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionaryOnceToken != -1) {
    dispatch_once(&metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionaryOnceToken, &__block_literal_global_20);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [(id)metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
        internal = self->_internal;
        if (internal->faceTrackingMetadataObjectTypesAvailable && v11 == 0)
        {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sFaceTrackingMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        else
        {
          uint64_t v14 = v11;
        }
        if (internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sOfflineVideoStabilizationMotionMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->videoPreviewHistogramMetadataObjectTypesAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sVideoPreviewHistogramMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->appClipCodeObjectTypeAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sAppClipCodeMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->textRegionObjectTypeAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sTextRegionMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->sceneClassificationObjectTypeAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sSceneClassificationMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->visualIntelligenceObjectTypeAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sVisualIntelligenceMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->headObjectTypesAvailable && v14 == 0)
        {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sHeadMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
          internal = self->_internal;
        }
        if (internal->humanHandObjectTypeAvailable && v14 == 0) {
          uint64_t v14 = [(id)metadataObjectTypesForMetadataIdentifiers__sHumanHandMetadataIdentifierToMetadataConstantDictionary objectForKeyedSubscript:v10];
        }
        if (v14) {
          objc_msgSend(v5, "addObject:");
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
  return v5;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:mdo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:mdo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3 flags:0];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureMetadataOutput;
  [(AVCaptureOutput *)&v7 attachSafelyToFigCaptureSession:a3];
}

- (id)_detectedObjectsCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4 facesArrayOut:(id *)a5 need180DegreeMetadataTransform:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  CFTypeRef v10 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51458], 0);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = (void *)v10;
  v81 = self;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v98 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  CGFloat a = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags v100 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale b_low = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CGFloat c = *(double *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  uint64_t v99 = [v11 countByEnumeratingWithState:&v154 objects:v170 count:16];
  BOOL v80 = v6;
  if (!v99) {
    goto LABEL_107;
  }
  uint64_t v97 = *(void *)v155;
  uint64_t v96 = *MEMORY[0x1E4F52430];
  uint64_t v95 = *MEMORY[0x1E4F52320];
  uint64_t v94 = *MEMORY[0x1E4F522F8];
  uint64_t v89 = *MEMORY[0x1E4F522F0];
  uint64_t v88 = *MEMORY[0x1E4F52300];
  uint64_t v87 = *MEMORY[0x1E4F522D0];
  uint64_t v86 = *MEMORY[0x1E4F522E0];
  uint64_t v85 = *MEMORY[0x1E4F52318];
  uint64_t v84 = *MEMORY[0x1E4F52310];
  uint64_t v83 = *MEMORY[0x1E4F522D8];
  uint64_t v82 = *MEMORY[0x1E4F522E8];
  uint64_t v79 = *MEMORY[0x1E4F52308];
  v93 = v11;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v155 != v97) {
        objc_enumerationMutation(v11);
      }
      uint64_t v14 = *(void **)(*((void *)&v154 + 1) + 8 * v13);
      long long v15 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v96);
      long long v16 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v95);
      if (v15)
      {
        memset(&v108, 0, 24);
        [v15 longLongValue];
        int64_t v17 = FigHostTimeToNanoseconds();
        CMTimeMake((CMTime *)&v108, v17, 1000000000);
        if ((v100 & 1) == 0) {
          goto LABEL_10;
        }
        *(_OWORD *)&time1.CGFloat a = *(_OWORD *)&v108.a;
        time1.CGFloat c = v108.c;
        *(CGFloat *)&time2.value = a;
        time2.timescale = b_low;
        time2.flags = v100;
        *(CGFloat *)&time2.epoch = c;
        int32_t v18 = CMTimeCompare((CMTime *)&time1, &time2);
        CMTimeFlags b_high = v100;
        if (v18 < 0)
        {
LABEL_10:
          CGFloat a = v108.a;
          CMTimeFlags b_high = HIDWORD(v108.b);
          CMTimeScale b_low = LODWORD(v108.b);
          CGFloat c = v108.c;
        }
        CMTimeFlags v100 = b_high;
      }
      uint64_t v101 = v13;
      if ([v14 isEqualToString:v94])
      {
        long long v152 = 0u;
        long long v151 = 0u;
        long long v150 = 0u;
        long long v149 = 0u;
        uint64_t v20 = [v16 countByEnumeratingWithState:&v149 objects:v169 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v150;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v150 != v22) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataFaceObject faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:](AVMetadataFaceObject, "faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:", *(void *)(*((void *)&v149 + 1) + 8 * i), a4, v15));
            }
            uint64_t v21 = [v16 countByEnumeratingWithState:&v149 objects:v169 count:16];
          }
          while (v21);
        }
        [v98 addObject:@"face"];
        uint64_t v11 = v93;
        if (a5) {
          *a5 = v12;
        }
        goto LABEL_95;
      }
      if ([v14 isEqualToString:v89])
      {
        long long v148 = 0u;
        long long v147 = 0u;
        long long v146 = 0u;
        long long v145 = 0u;
        uint64_t v24 = [v16 countByEnumeratingWithState:&v145 objects:v168 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v146;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v146 != v26) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataHumanBodyObject humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataHumanBodyObject, "humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v145 + 1) + 8 * j), a4, v15));
            }
            uint64_t v25 = [v16 countByEnumeratingWithState:&v145 objects:v168 count:16];
          }
          while (v25);
        }
        v28 = v98;
        uint64_t v29 = @"humanBody";
LABEL_94:
        [v28 addObject:v29];
        uint64_t v11 = v93;
        goto LABEL_95;
      }
      if ([v14 isEqualToString:v88])
      {
        long long v144 = 0u;
        long long v143 = 0u;
        long long v142 = 0u;
        long long v141 = 0u;
        uint64_t v30 = [v16 countByEnumeratingWithState:&v141 objects:v167 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v142;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v142 != v32) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataHumanFullBodyObject humanFullBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataHumanFullBodyObject, "humanFullBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v141 + 1) + 8 * k), a4, v15));
            }
            uint64_t v31 = [v16 countByEnumeratingWithState:&v141 objects:v167 count:16];
          }
          while (v31);
        }
        v28 = v98;
        uint64_t v29 = @"humanFullBody";
        goto LABEL_94;
      }
      if ([v14 isEqualToString:v87])
      {
        long long v140 = 0u;
        long long v139 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        uint64_t v34 = [v16 countByEnumeratingWithState:&v137 objects:v166 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v138;
          do
          {
            for (uint64_t m = 0; m != v35; ++m)
            {
              if (*(void *)v138 != v36) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataCatBodyObject catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataCatBodyObject, "catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v137 + 1) + 8 * m), a4, v15));
            }
            uint64_t v35 = [v16 countByEnumeratingWithState:&v137 objects:v166 count:16];
          }
          while (v35);
        }
        v28 = v98;
        uint64_t v29 = @"catBody";
        goto LABEL_94;
      }
      if ([v14 isEqualToString:v86])
      {
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        uint64_t v38 = [v16 countByEnumeratingWithState:&v133 objects:v165 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v134;
          do
          {
            for (uint64_t n = 0; n != v39; ++n)
            {
              if (*(void *)v134 != v40) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataDogBodyObject dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataDogBodyObject, "dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v133 + 1) + 8 * n), a4, v15));
            }
            uint64_t v39 = [v16 countByEnumeratingWithState:&v133 objects:v165 count:16];
          }
          while (v39);
        }
        v28 = v98;
        uint64_t v29 = @"dogBody";
        goto LABEL_94;
      }
      if ([v14 isEqualToString:v85])
      {
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        uint64_t v42 = [v16 countByEnumeratingWithState:&v129 objects:v164 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v130;
          do
          {
            for (iuint64_t i = 0; ii != v43; ++ii)
            {
              if (*(void *)v130 != v44) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataSalientObject salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataSalientObject, "salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v129 + 1) + 8 * ii), a4, v15));
            }
            uint64_t v43 = [v16 countByEnumeratingWithState:&v129 objects:v164 count:16];
          }
          while (v43);
        }
        v28 = v98;
        uint64_t v29 = @"salientObject";
        goto LABEL_94;
      }
      if ([v14 isEqualToString:v84])
      {
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        uint64_t v46 = [v16 countByEnumeratingWithState:&v125 objects:v163 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v126;
          do
          {
            for (juint64_t j = 0; jj != v47; ++jj)
            {
              if (*(void *)v126 != v48) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataHumanHeadObject humanHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataHumanHeadObject, "humanHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v125 + 1) + 8 * jj), a4, v15));
            }
            uint64_t v47 = [v16 countByEnumeratingWithState:&v125 objects:v163 count:16];
          }
          while (v47);
        }
        v28 = v98;
        uint64_t v29 = @"humanHead";
        goto LABEL_94;
      }
      if ([v14 isEqualToString:v83])
      {
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        uint64_t v50 = [v16 countByEnumeratingWithState:&v121 objects:v162 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v122;
          do
          {
            for (kuint64_t k = 0; kk != v51; ++kk)
            {
              if (*(void *)v122 != v52) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataCatHeadObject catHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataCatHeadObject, "catHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v121 + 1) + 8 * kk), a4, v15));
            }
            uint64_t v51 = [v16 countByEnumeratingWithState:&v121 objects:v162 count:16];
          }
          while (v51);
        }
        v28 = v98;
        uint64_t v29 = @"catHead";
        goto LABEL_94;
      }
      if ([v14 isEqualToString:v82])
      {
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        uint64_t v54 = [v16 countByEnumeratingWithState:&v117 objects:v161 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v118;
          do
          {
            for (muint64_t m = 0; mm != v55; ++mm)
            {
              if (*(void *)v118 != v56) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataDogHeadObject dogHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataDogHeadObject, "dogHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v117 + 1) + 8 * mm), a4, v15));
            }
            uint64_t v55 = [v16 countByEnumeratingWithState:&v117 objects:v161 count:16];
          }
          while (v55);
        }
        v28 = v98;
        uint64_t v29 = @"dogHead";
        goto LABEL_94;
      }
      if ([v14 isEqualToString:v79])
      {
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        uint64_t v58 = [v16 countByEnumeratingWithState:&v113 objects:v160 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v90 = *(void *)v114;
          do
          {
            for (nuint64_t n = 0; nn != v59; ++nn)
            {
              if (*(void *)v114 != v90) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v12, "addObject:", +[AVMetadataHumanHandObject humanHandObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:](AVMetadataHumanHandObject, "humanHandObjectWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", *(void *)(*((void *)&v113 + 1) + 8 * nn), a4, v15));
            }
            uint64_t v59 = [v16 countByEnumeratingWithState:&v113 objects:v160 count:16];
          }
          while (v59);
        }
        [v98 addObject:@"humanHand"];
      }
LABEL_95:
      uint64_t v13 = v101 + 1;
    }
    while (v101 + 1 != v99);
    uint64_t v61 = [v11 countByEnumeratingWithState:&v154 objects:v170 count:16];
    uint64_t v99 = v61;
  }
  while (v61);
LABEL_107:
  v62 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51460], 0);
  if (v62)
  {
    v63 = v62;
    if ([v62 intValue])
    {
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      uint64_t v64 = [v12 countByEnumeratingWithState:&v109 objects:v159 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v66 = *(void *)v110;
        do
        {
          for (uint64_t i1 = 0; i1 != v65; ++i1)
          {
            if (*(void *)v110 != v66) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(*(id *)(*((void *)&v109 + 1) + 8 * i1), "setDetectionSource:", (int)objc_msgSend(v63, "intValue"));
          }
          uint64_t v65 = [v12 countByEnumeratingWithState:&v109 objects:v159 count:16];
        }
        while (v65);
      }
    }
  }
  if (v80)
  {
    v68 = (void *)[MEMORY[0x1E4F1CA48] array];
    memset(&v108, 0, sizeof(v108));
    t2.b = 0.0;
    t2.CGFloat c = 0.0;
    t2.CGFloat a = -1.0;
    *(_OWORD *)&t2.d = xmmword_1A1636A80;
    t2.tdouble y = 1.0;
    long long v69 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&time1.CGFloat a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&time1.CGFloat c = v69;
    *(_OWORD *)&time1.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformConcat(&v108, &time1, &t2);
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v70 = [v12 countByEnumeratingWithState:&v102 objects:v158 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v103;
      do
      {
        for (uint64_t i2 = 0; i2 != v71; ++i2)
        {
          if (*(void *)v103 != v72) {
            objc_enumerationMutation(v12);
          }
          uint64_t v74 = [*(id *)(*((void *)&v102 + 1) + 8 * i2) originalMetadataObject];
          CGAffineTransform time1 = v108;
          objc_msgSend(v68, "addObject:", +[AVMetadataObject derivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:](AVMetadataObject, "derivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:", v74, &time1, 0, 180.0));
        }
        uint64_t v71 = [v12 countByEnumeratingWithState:&v102 objects:v158 count:16];
      }
      while (v71);
    }

    id v12 = v68;
  }
  uint64_t v75 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"face", @"humanBody", @"humanFullBody", @"catBody", @"dogBody", @"salientObject", @"humanHead", @"catHead", @"dogHead", @"humanHand", 0);
  v76 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v81->_internal->metadataObjectTypes];
  [v76 intersectSet:v75];
  v108.CGFloat a = a;
  *(void *)&v108.b = __PAIR64__(v100, b_low);
  v108.CGFloat c = c;
  v77 = +[AVMetadataObjectCollection collectionWithTime:&v108 metadataObjectTypes:v98 handledMetadataObjectTypes:v76 metadataObjects:v12];

  return v77;
}

- (AVCaptureMetadataOutput)init
{
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureMetadataOutput;
  v2 = [(AVCaptureOutput *)&v10 initSubclass];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(AVCaptureMetadataOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v3->rectOfInterest.origin.double x = 0.0;
      v3->rectOfInterest.origin.double y = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      v3->rectOfInterest.size = _Q0;
      v2->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (id)_legacyFaceCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51478], 0))
  {
    objc_super v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51470], 0);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v22 = self;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v26;
      uint64_t v13 = *MEMORY[0x1E4F52430];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v7);
          }
          long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v16 = [v15 objectForKeyedSubscript:v13];
          if (!v11) {
            uint64_t v11 = (void *)v16;
          }
          objc_msgSend(v8, "addObject:", +[AVMetadataFaceObject faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:](AVMetadataFaceObject, "faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:", v15, a4, v16));
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
      memset(&v24, 0, sizeof(v24));
      self = v22;
      if (v11)
      {
        [v11 longLongValue];
        int64_t v17 = FigHostTimeToNanoseconds();
        CMTimeMake(&v24, v17, 1000000000);
        previousTwoCMTimesByDetectorType = v22->_internal->previousTwoCMTimesByDetectorType;
        CMTime v23 = v24;
        avcmdo_addCMTimeToHistoryForDetector(previousTwoCMTimesByDetectorType, (long long *)&v23.value, @"AVMetadataDetectorLegacyFaces");
LABEL_16:
        uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithObject:@"face"];
        CMTime v23 = v24;
        v19 = +[AVMetadataObjectCollection collectionWithTime:&v23 metadataObjectTypes:v20 handledMetadataObjectTypes:v20 metadataObjects:v8];

        return v19;
      }
    }
    else
    {
      memset(&v24, 0, sizeof(v24));
    }
    avcmdo_nextTimeForDetector(self->_internal->previousTwoCMTimesByDetectorType, @"AVMetadataDetectorLegacyFaces", (uint64_t)&v24);
    goto LABEL_16;
  }
  return 0;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F518B8]])
    {
      uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F518A8]];
      [(AVCaptureMetadataOutput *)self _updateRemoteQueue:v7];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F518B0]])
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51658]];
      [(AVCaptureMetadataOutput *)self _updateLocalQueue:v8];
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)[MessageReceiver copy]);
}

- (void)setMetadataObjectsDelegate:(id)objectsDelegate queue:(dispatch_queue_t)objectsCallbackQueue
{
  dispatch_queue_t v4 = objectsCallbackQueue;
  if (((objectsCallbackQueue != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    dispatch_queue_t v4 = 0;
  }
  [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"metadataObjectsDelegate"];
  uint64_t v8 = 0;
  if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setClientDelegate:objectsDelegate clientCallbackQueue:v4 exceptionReason:&v8])
  {
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"metadataObjectsDelegate"];
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"metadataObjectsDelegate"];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

void __46__AVCaptureMetadataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  BOOL v6 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v7 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v7)
  {
    uint64_t v8 = v7;
    if (a2 == -16665)
    {
      [*(id *)(v7[2] + 8) releaseRemoteQueueReceiver];
    }
    else if (!a2)
    {
      [v7 _handleRemoteQueueOperation:a3];
    }
  }
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  BOOL v6 = [(AVCaptureOutput *)self connectionWithMediaType:AVMediaTypeForMetadataObjects()];
  id v7 = (id)objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](v6, "inputPorts"), "firstObject"), "input");
  objc_sync_exit(internal);
  if ([(AVCaptureConnection *)v6 isLive]
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v24 = 0;
    BOOL v9 = [(AVCaptureConnection *)v6 sourcesFromFrontFacingCamera];
    [(AVCaptureConnection *)v6 sourcesFromExternalCamera];
    if (v9) {
      uint64_t v10 = FigCaptureCameraRequires180DegreesRotation() ^ 1;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = [(AVCaptureMetadataOutput *)self _detectedObjectsCollectionForSampleBuffer:a3 input:v7 facesArrayOut:&v24 need180DegreeMetadataTransform:v10];
    if (v11) {
      [v8 addObject:v11];
    }
    if (!v24)
    {
      id v12 = [(AVCaptureMetadataOutput *)self _legacyFaceCollectionForSampleBuffer:a3 input:v7];
      if (v12) {
        [v8 addObject:v12];
      }
    }
    id v13 = [(AVCaptureMetadataOutput *)self _trackedFacesCollectionForSampleBuffer:a3 input:v7];
    if (v13) {
      [v8 addObject:v13];
    }
    id v14 = [(AVCaptureMetadataOutput *)self _offlineVISMotionCollectionForSampleBuffer:a3 input:v7];
    if (v14) {
      [v8 addObject:v14];
    }
    id v15 = [(AVCaptureMetadataOutput *)self _eyeReliefResultCollectionForSampleBuffer:a3 input:v7];
    if (v15) {
      [v8 addObject:v15];
    }
    id v16 = [(AVCaptureMetadataOutput *)self _barcodeCollectionForSampleBuffer:a3 input:v7];
    if (v16) {
      [v8 addObject:v16];
    }
    id v17 = [(AVCaptureMetadataOutput *)self _lumaHistogramDataCollectionForSampleBuffer:a3 input:v7];
    if (v17) {
      [v8 addObject:v17];
    }
    id v18 = [(AVCaptureMetadataOutput *)self _appClipCodesCollectionForSampleBuffer:a3 input:v7];
    if (v18) {
      [v8 addObject:v18];
    }
    id v19 = [(AVCaptureMetadataOutput *)self _textRegionsCollectionForSampleBuffer:a3 input:v7];
    if (v19) {
      [v8 addObject:v19];
    }
    id v20 = [(AVCaptureMetadataOutput *)self _sceneClassificationCollectionForSampleBuffer:a3 input:v7];
    if (v20) {
      [v8 addObject:v20];
    }
    id v21 = [(AVCaptureMetadataOutput *)self _visualIntelligenceCollectionForSampleBuffer:a3 input:v7];
    if (v21) {
      [v8 addObject:v21];
    }
    if ([v8 count])
    {
      id v22 = [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper activeDelegate];
      if (objc_opt_respondsToSelector())
      {
        [v22 captureOutput:self didOutputMetadataObjectCollections:v8 fromConnection:v6];
      }
      else if (objc_opt_respondsToSelector())
      {
        CMTime v23 = avcmdo_allMetadataObjectsInCollections(v8);
        [v22 captureOutput:self didOutputMetadataObjects:v23 forMetadataObjectTypes:avcmdo_allMetadataObjectTypesInCollections(v8) fromConnection:v6];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v22 captureOutput:self didOutputMetadataObjects:avcmdo_allMetadataObjectsInCollections(v8) fromConnection:v6];
      }
    }
  }
}

- (id)_visualIntelligenceCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F514C0], 0);
  if (result)
  {
    id v7 = result;
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    CMTime v11 = v12;
    uint64_t v8 = +[AVMetadataVisualIntelligenceObject visualIntelligenceObjectWithVisualIntelligenceDictionary:v7 input:a4 time:&v11];
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"visualIntelligence"];
    v13[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    CMTime v11 = v12;
    return +[AVMetadataObjectCollection collectionWithTime:&v11 metadataObjectTypes:v9 handledMetadataObjectTypes:v9 metadataObjects:v10];
  }
  return result;
}

- (id)_trackedFacesCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F514B0], 0);
  if (result)
  {
    id v7 = result;
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"trackedFaces"];
    CMTime v10 = v11;
    v12[0] = +[AVMetadataTrackedFacesObject trackedFacesWithTime:&v10 faceTrackingDictionary:v7 input:a4];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    CMTime v10 = v11;
    return +[AVMetadataObjectCollection collectionWithTime:&v10 metadataObjectTypes:v8 handledMetadataObjectTypes:v8 metadataObjects:v9];
  }
  return result;
}

- (id)_textRegionsCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  id v19 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F514A8], 0)) {
    return 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = *MEMORY[0x1E4F1F9F8];
  unsigned int v7 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  unsigned int v28 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  uint64_t v8 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F514A0], 0);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[AVMetadataTextRegionObject textRegionObjectWithDictionary:input:](AVMetadataTextRegionObject, "textRegionObjectWithDictionary:input:", *(void *)(*((void *)&v22 + 1) + 8 * v13), a4, v19);
        if (v14)
        {
          id v15 = v14;
          [v6 addObject:v14];
          if ((v7 & 1) == 0)
          {
            [(AVMetadataObject *)v15 time];
            unsigned int v7 = HIDWORD(v20);
            unsigned int v28 = DWORD2(v20);
            uint64_t v27 = v20;
            uint64_t v8 = v21;
            avcmdo_addCMTimeToHistoryForDetector(v19->_internal->previousTwoCMTimesByDetectorType, &v20, @"AVMetadataDetectorTextRegions");
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
  if ((v7 & 1) == 0)
  {
    avcmdo_nextTimeForDetector(v19->_internal->previousTwoCMTimesByDetectorType, @"AVMetadataDetectorTextRegions", (uint64_t)&v20);
    uint64_t v27 = v20;
    unsigned int v7 = HIDWORD(v20);
    unsigned int v28 = DWORD2(v20);
    uint64_t v8 = v21;
  }
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", @"textRegion", v19);
  *(void *)&long long v20 = v27;
  *((void *)&v20 + 1) = __PAIR64__(v7, v28);
  uint64_t v21 = v8;
  id v17 = +[AVMetadataObjectCollection collectionWithTime:&v20 metadataObjectTypes:v16 handledMetadataObjectTypes:v16 metadataObjects:v6];

  return v17;
}

- (id)_sceneClassificationCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51498], 0);
  if (result)
  {
    id v7 = result;
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    CMTime v11 = v12;
    uint64_t v8 = +[AVMetadataSceneClassificationObject sceneClassificationObjectWithConfidences:v7 input:a4 time:&v11];
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"sceneClassification"];
    v13[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    CMTime v11 = v12;
    return +[AVMetadataObjectCollection collectionWithTime:&v11 metadataObjectTypes:v9 handledMetadataObjectTypes:v9 metadataObjects:v10];
  }
  return result;
}

- (id)_offlineVISMotionCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51488], 0);
  if (result)
  {
    id v7 = result;
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"offlineVideoStabilizationMotion"];
    CMTime v10 = v11;
    v12[0] = +[AVMetadataOfflineVideoStabilizationMotionObject offlineVideoStabilizationMotionObjectWithTime:&v10 motionDictionary:v7 input:a4];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    CMTime v10 = v11;
    return +[AVMetadataObjectCollection collectionWithTime:&v10 metadataObjectTypes:v8 handledMetadataObjectTypes:v8 metadataObjects:v9];
  }
  return result;
}

- (id)_lumaHistogramDataCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F514B8], 0);
  if (result)
  {
    id v7 = result;
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    CMTime v11 = v12;
    uint64_t v8 = +[AVMetadataVideoPreviewHistogramObject videoPreviewHistogramObjectWithLumaHistogramData:v7 input:a4 time:&v11];
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"videoPreviewHistogram"];
    v13[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    CMTime v11 = v12;
    return +[AVMetadataObjectCollection collectionWithTime:&v11 metadataObjectTypes:v9 handledMetadataObjectTypes:v9 metadataObjects:v10];
  }
  return result;
}

- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3
{
  if (a3->var0 == 3) {
    [(AVCaptureMetadataOutput *)self _processSampleBuffer:a3->var4.var4.var0];
  }
}

- (id)_eyeReliefResultCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id result = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51468], 0);
  if (result)
  {
    id v7 = result;
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"EyeReliefStatus"];
    int v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F524F0]), "intValue");
    CMTime v11 = v12;
    v13[0] = +[AVMetadataEyeReliefStatusObject eyeReliefStatusObjectWithEyeReliefStatus:v9 input:a4 time:&v11 optionalInfoDict:v7];
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    CMTime v11 = v12;
    return +[AVMetadataObjectCollection collectionWithTime:&v11 metadataObjectTypes:v8 handledMetadataObjectTypes:v8 metadataObjects:v10];
  }
  return result;
}

- (id)_barcodeCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51438], 0)) {
    return 0;
  }
  uint64_t v32 = *MEMORY[0x1E4F1F9F8];
  unsigned int v6 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  unsigned int v33 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51430], 0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = v9;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = +[AVMetadataMachineReadableCodeObject machineReadableCodeObjectWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:*(void *)(*((void *)&v27 + 1) + 8 * i) input:a4];
        uint64_t v16 = v15;
        if ((v6 & 1) == 0)
        {
          if (v15)
          {
            [(AVMetadataObject *)v15 time];
            unsigned int v6 = HIDWORD(v25);
            uint64_t v7 = v26;
          }
          else
          {
            uint64_t v7 = 0;
            unsigned int v6 = 0;
            long long v25 = 0uLL;
            uint64_t v26 = 0;
          }
          uint64_t v32 = v25;
          internal = self->_internal;
          unsigned int v33 = DWORD2(v25);
          previousTwoCMTimesByDetectorType = internal->previousTwoCMTimesByDetectorType;
          HIDWORD(v25) = v6;
          uint64_t v26 = v7;
          avcmdo_addCMTimeToHistoryForDetector(previousTwoCMTimesByDetectorType, &v25, @"AVMetadataDetectorBarcodes");
        }
        [v24 addObject:v16];
        objc_msgSend(v8, "addObject:", -[AVMetadataObject type](v16, "type"));
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }
  if ((v6 & 1) == 0)
  {
    avcmdo_nextTimeForDetector(self->_internal->previousTwoCMTimesByDetectorType, @"AVMetadataDetectorBarcodes", (uint64_t)&v25);
    uint64_t v32 = v25;
    unsigned int v6 = HIDWORD(v25);
    unsigned int v33 = DWORD2(v25);
    uint64_t v7 = v26;
  }
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"org.gs1.UPC-E", @"org.iso.Code39", @"org.iso.Code39Mod43", @"org.gs1.EAN-13", @"org.gs1.EAN-8", @"com.intermec.Code93", @"org.iso.Code128", @"org.iso.PDF417", @"org.iso.QRCode", @"org.iso.Aztec", @"org.ansi.Interleaved2of5", @"org.gs1.ITF14", @"org.iso.DataMatrix", @"Codabar", @"org.gs1.GS1DataBar", @"org.gs1.GS1DataBarExpanded", @"org.gs1.GS1DataBarLimited",
          @"org.iso.MicroQR",
          @"org.iso.MicroPDF417",
          0);
  long long v20 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:self->_internal->metadataObjectTypes];
  [v20 intersectSet:v19];
  *(void *)&long long v25 = v32;
  *((void *)&v25 + 1) = __PAIR64__(v6, v33);
  uint64_t v26 = v7;
  uint64_t v21 = +[AVMetadataObjectCollection collectionWithTime:&v25 metadataObjectTypes:v8 handledMetadataObjectTypes:v20 metadataObjects:v24];

  return v21;
}

- (id)_appClipCodesCollectionForSampleBuffer:(opaqueCMSampleBuffer *)a3 input:(id)a4
{
  uint64_t v19 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51268], 0)) {
    return 0;
  }
  uint64_t v27 = *MEMORY[0x1E4F1F9F8];
  unsigned int v6 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  unsigned int v28 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F51260], 0);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[AVMetadataMachineReadableCodeObject machineReadableCodeObjectWithAppClipCodeDictionary:input:](AVMetadataMachineReadableCodeObject, "machineReadableCodeObjectWithAppClipCodeDictionary:input:", *(void *)(*((void *)&v22 + 1) + 8 * v13), a4, v19);
        if (v14)
        {
          id v15 = v14;
          if ((v6 & 1) == 0)
          {
            [(AVMetadataObject *)v14 time];
            unsigned int v6 = HIDWORD(v20);
            unsigned int v28 = DWORD2(v20);
            uint64_t v27 = v20;
            uint64_t v7 = v21;
            avcmdo_addCMTimeToHistoryForDetector(v19->_internal->previousTwoCMTimesByDetectorType, &v20, @"AVMetadataDetectorAppClipCodes");
          }
          [v8 addObject:v15];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
  if ((v6 & 1) == 0)
  {
    avcmdo_nextTimeForDetector(v19->_internal->previousTwoCMTimesByDetectorType, @"AVMetadataDetectorAppClipCodes", (uint64_t)&v20);
    uint64_t v27 = v20;
    unsigned int v6 = HIDWORD(v20);
    unsigned int v28 = DWORD2(v20);
    uint64_t v7 = v21;
  }
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", @"com.apple.AppClipCode", v19);
  *(void *)&long long v20 = v27;
  *((void *)&v20 + 1) = __PAIR64__(v6, v28);
  uint64_t v21 = v7;
  id v17 = +[AVMetadataObjectCollection collectionWithTime:&v20 metadataObjectTypes:v16 handledMetadataObjectTypes:v16 metadataObjects:v8];

  return v17;
}

id __69__AVCaptureMetadataOutput_metadataObjectTypesForMetadataIdentifiers___block_invoke()
{
  v32[26] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F47CA8];
  v31[0] = *MEMORY[0x1E4F47CA0];
  v31[1] = v0;
  v32[0] = @"face";
  v32[1] = @"humanBody";
  uint64_t v1 = *MEMORY[0x1E4F47C90];
  v31[2] = @"mdta/com.apple.quicktime.detected-human-full-body";
  v31[3] = v1;
  v32[2] = @"humanFullBody";
  v32[3] = @"catBody";
  uint64_t v2 = *MEMORY[0x1E4F47CB0];
  v31[4] = *MEMORY[0x1E4F47C98];
  v31[5] = v2;
  v32[4] = @"dogBody";
  v32[5] = @"salientObject";
  v31[6] = @"mdta/com.apple.quicktime.detected-machine-readable-code.UPCE";
  v31[7] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Code39";
  v32[6] = @"org.gs1.UPC-E";
  v32[7] = @"org.iso.Code39";
  v31[8] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Code39Checksum";
  v31[9] = @"mdta/com.apple.quicktime.detected-machine-readable-code.EAN13";
  v32[8] = @"org.iso.Code39Mod43";
  v32[9] = @"org.gs1.EAN-13";
  v31[10] = @"mdta/com.apple.quicktime.detected-machine-readable-code.EAN8";
  v31[11] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Code93";
  v32[10] = @"org.gs1.EAN-8";
  v32[11] = @"com.intermec.Code93";
  v31[12] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Code128";
  v31[13] = @"mdta/com.apple.quicktime.detected-machine-readable-code.QR";
  v32[12] = @"org.iso.Code128";
  v32[13] = @"org.iso.QRCode";
  v31[14] = @"mdta/com.apple.quicktime.detected-machine-readable-code.PDF417";
  v31[15] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Aztec";
  v32[14] = @"org.iso.PDF417";
  v32[15] = @"org.iso.Aztec";
  v31[16] = @"mdta/com.apple.quicktime.detected-machine-readable-code.DataMatrix";
  v31[17] = @"mdta/com.apple.quicktime.detected-machine-readable-code.I2of5";
  v32[16] = @"org.iso.DataMatrix";
  v32[17] = @"org.ansi.Interleaved2of5";
  v31[18] = @"mdta/com.apple.quicktime.detected-machine-readable-code.ITF14";
  v31[19] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Codabar";
  v32[18] = @"org.gs1.ITF14";
  v32[19] = @"Codabar";
  v31[20] = @"mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBar";
  v31[21] = @"mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBarExpanded";
  v32[20] = @"org.gs1.GS1DataBar";
  v32[21] = @"org.gs1.GS1DataBarExpanded";
  v31[22] = @"mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBarLimited";
  v31[23] = @"mdta/com.apple.quicktime.detected-machine-readable-code.MicroQR";
  v32[22] = @"org.gs1.GS1DataBarLimited";
  v32[23] = @"org.iso.MicroQR";
  v31[24] = @"mdta/com.apple.quicktime.detected-machine-readable-code.MicroPDF417";
  v31[25] = @"mdta/com.apple.quicktime.eye-relief-status";
  v32[24] = @"org.iso.MicroPDF417";
  v32[25] = @"EyeReliefStatus";
  metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:26];
  id v3 = (id)metadataObjectTypesForMetadataIdentifiers__sMetadataIdentifierToMetadataConstantDictionary;
  uint64_t v29 = *MEMORY[0x1E4F218A8];
  long long v30 = @"trackedFaces";
  metadataObjectTypesForMetadataIdentifiers__sFaceTrackingMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  id v4 = (id)metadataObjectTypesForMetadataIdentifiers__sFaceTrackingMetadataIdentifierToMetadataConstantDictionary;
  uint64_t v27 = *MEMORY[0x1E4F21898];
  unsigned int v28 = @"offlineVideoStabilizationMotion";
  metadataObjectTypesForMetadataIdentifiers__sOfflineVideoStabilizationMotionMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v5 = (id)metadataObjectTypesForMetadataIdentifiers__sOfflineVideoStabilizationMotionMetadataIdentifierToMetadataConstantDictionary;
  long long v25 = @"mdta/com.apple.quicktime.video-preview-histogram";
  uint64_t v26 = @"videoPreviewHistogram";
  metadataObjectTypesForMetadataIdentifiers__sVideoPreviewHistogramMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v6 = (id)metadataObjectTypesForMetadataIdentifiers__sVideoPreviewHistogramMetadataIdentifierToMetadataConstantDictionary;
  long long v23 = @"mdta/com.apple.quicktime.detected-machine-readable-code.AppClipCode";
  long long v24 = @"com.apple.AppClipCode";
  metadataObjectTypesForMetadataIdentifiers__sAppClipCodeMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v7 = (id)metadataObjectTypesForMetadataIdentifiers__sAppClipCodeMetadataIdentifierToMetadataConstantDictionary;
  uint64_t v21 = @"mdta/com.apple.quicktime.detected-text-region";
  long long v22 = @"textRegion";
  metadataObjectTypesForMetadataIdentifiers__sTextRegionMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v8 = (id)metadataObjectTypesForMetadataIdentifiers__sTextRegionMetadataIdentifierToMetadataConstantDictionary;
  uint64_t v19 = @"mdta/com.apple.quicktime.scene-classification";
  long long v20 = @"sceneClassification";
  metadataObjectTypesForMetadataIdentifiers__sSceneClassificationMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  id v9 = (id)metadataObjectTypesForMetadataIdentifiers__sSceneClassificationMetadataIdentifierToMetadataConstantDictionary;
  id v17 = @"mdta/com.apple.quicktime.visual-intelligence";
  id v18 = @"visualIntelligence";
  metadataObjectTypesForMetadataIdentifiers__sVisualIntelligenceMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v10 = (id)metadataObjectTypesForMetadataIdentifiers__sVisualIntelligenceMetadataIdentifierToMetadataConstantDictionary;
  v15[0] = @"mdta/com.apple.quicktime.detected-human-head";
  v15[1] = @"mdta/com.apple.quicktime.detected-cat-head";
  v16[0] = @"humanHead";
  v16[1] = @"catHead";
  v15[2] = @"mdta/com.apple.quicktime.detected-dog-head";
  v16[2] = @"dogHead";
  metadataObjectTypesForMetadataIdentifiers__sHeadMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  id v11 = (id)metadataObjectTypesForMetadataIdentifiers__sHeadMetadataIdentifierToMetadataConstantDictionary;
  uint64_t v13 = @"mdta/com.apple.quicktime.detected-human-hand";
  id v14 = @"humanHand";
  metadataObjectTypesForMetadataIdentifiers__sHumanHandMetadataIdentifierToMetadataConstantDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  return (id)metadataObjectTypesForMetadataIdentifiers__sHumanHandMetadataIdentifierToMetadataConstantDictionary;
}

id __69__AVCaptureMetadataOutput_metadataIdentifiersForMetadataObjectTypes___block_invoke()
{
  v34[26] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F47CA0];
  v33[0] = @"face";
  v33[1] = @"humanBody";
  uint64_t v1 = *MEMORY[0x1E4F47CA8];
  v34[0] = v0;
  v34[1] = v1;
  v33[2] = @"humanFullBody";
  v33[3] = @"catBody";
  uint64_t v2 = *MEMORY[0x1E4F47C90];
  v34[2] = @"mdta/com.apple.quicktime.detected-human-full-body";
  v34[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F47C98];
  v33[4] = @"dogBody";
  v33[5] = @"salientObject";
  uint64_t v4 = *MEMORY[0x1E4F47CB0];
  v34[4] = v3;
  v34[5] = v4;
  v33[6] = @"org.gs1.UPC-E";
  v33[7] = @"org.iso.Code39";
  v34[6] = @"mdta/com.apple.quicktime.detected-machine-readable-code.UPCE";
  v34[7] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Code39";
  v33[8] = @"org.iso.Code39Mod43";
  v33[9] = @"org.gs1.EAN-13";
  v34[8] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Code39Checksum";
  v34[9] = @"mdta/com.apple.quicktime.detected-machine-readable-code.EAN13";
  v33[10] = @"org.gs1.EAN-8";
  v33[11] = @"com.intermec.Code93";
  v34[10] = @"mdta/com.apple.quicktime.detected-machine-readable-code.EAN8";
  v34[11] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Code93";
  v33[12] = @"org.iso.Code128";
  v33[13] = @"org.iso.QRCode";
  v34[12] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Code128";
  v34[13] = @"mdta/com.apple.quicktime.detected-machine-readable-code.QR";
  v33[14] = @"org.iso.PDF417";
  v33[15] = @"org.iso.Aztec";
  v34[14] = @"mdta/com.apple.quicktime.detected-machine-readable-code.PDF417";
  v34[15] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Aztec";
  v33[16] = @"org.iso.DataMatrix";
  v33[17] = @"org.ansi.Interleaved2of5";
  v34[16] = @"mdta/com.apple.quicktime.detected-machine-readable-code.DataMatrix";
  v34[17] = @"mdta/com.apple.quicktime.detected-machine-readable-code.I2of5";
  v33[18] = @"org.gs1.ITF14";
  v33[19] = @"Codabar";
  v34[18] = @"mdta/com.apple.quicktime.detected-machine-readable-code.ITF14";
  v34[19] = @"mdta/com.apple.quicktime.detected-machine-readable-code.Codabar";
  v33[20] = @"org.gs1.GS1DataBar";
  v33[21] = @"org.gs1.GS1DataBarExpanded";
  v34[20] = @"mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBar";
  v34[21] = @"mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBarExpanded";
  v33[22] = @"org.gs1.GS1DataBarLimited";
  v33[23] = @"org.iso.MicroQR";
  v34[22] = @"mdta/com.apple.quicktime.detected-machine-readable-code.GS1DataBarLimited";
  v34[23] = @"mdta/com.apple.quicktime.detected-machine-readable-code.MicroQR";
  v33[24] = @"org.iso.MicroPDF417";
  v33[25] = @"EyeReliefStatus";
  v34[24] = @"mdta/com.apple.quicktime.detected-machine-readable-code.MicroPDF417";
  v34[25] = @"mdta/com.apple.quicktime.eye-relief-status";
  metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:26];
  id v5 = (id)metadataIdentifiersForMetadataObjectTypes__sMetadataConstantToMetadataIdentifierDictionary;
  uint64_t v31 = @"trackedFaces";
  uint64_t v32 = *MEMORY[0x1E4F218A8];
  metadataIdentifiersForMetadataObjectTypes__sFaceTrackingMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v6 = (id)metadataIdentifiersForMetadataObjectTypes__sFaceTrackingMetadataConstantToMetadataIdentifierDictionary;
  uint64_t v29 = @"offlineVideoStabilizationMotion";
  uint64_t v30 = *MEMORY[0x1E4F21898];
  metadataIdentifiersForMetadataObjectTypes__sOfflineVideoStabilizationMotionMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  id v7 = (id)metadataIdentifiersForMetadataObjectTypes__sOfflineVideoStabilizationMotionMetadataConstantToMetadataIdentifierDictionary;
  uint64_t v27 = @"videoPreviewHistogram";
  unsigned int v28 = @"mdta/com.apple.quicktime.video-preview-histogram";
  metadataIdentifiersForMetadataObjectTypes__sVideoPreviewHistogramMetadataConstantsToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v8 = (id)metadataIdentifiersForMetadataObjectTypes__sVideoPreviewHistogramMetadataConstantsToMetadataIdentifierDictionary;
  long long v25 = @"com.apple.AppClipCode";
  uint64_t v26 = @"mdta/com.apple.quicktime.detected-machine-readable-code.AppClipCode";
  metadataIdentifiersForMetadataObjectTypes__sAppClipCodeMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v9 = (id)metadataIdentifiersForMetadataObjectTypes__sAppClipCodeMetadataConstantToMetadataIdentifierDictionary;
  long long v23 = @"textRegion";
  long long v24 = @"mdta/com.apple.quicktime.detected-text-region";
  metadataIdentifiersForMetadataObjectTypes__sTextRegionMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v10 = (id)metadataIdentifiersForMetadataObjectTypes__sTextRegionMetadataConstantToMetadataIdentifierDictionary;
  uint64_t v21 = @"sceneClassification";
  long long v22 = @"mdta/com.apple.quicktime.scene-classification";
  metadataIdentifiersForMetadataObjectTypes__sSceneClassificationMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v11 = (id)metadataIdentifiersForMetadataObjectTypes__sSceneClassificationMetadataConstantToMetadataIdentifierDictionary;
  uint64_t v19 = @"visualIntelligence";
  long long v20 = @"mdta/com.apple.quicktime.visual-intelligence";
  metadataIdentifiersForMetadataObjectTypes__sVisualIntelligenceMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  id v12 = (id)metadataIdentifiersForMetadataObjectTypes__sVisualIntelligenceMetadataConstantToMetadataIdentifierDictionary;
  v17[0] = @"humanHead";
  v17[1] = @"catHead";
  v18[0] = @"mdta/com.apple.quicktime.detected-human-head";
  v18[1] = @"mdta/com.apple.quicktime.detected-cat-head";
  v17[2] = @"dogHead";
  v18[2] = @"mdta/com.apple.quicktime.detected-dog-head";
  metadataIdentifiersForMetadataObjectTypes__sHeadMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  id v13 = (id)metadataIdentifiersForMetadataObjectTypes__sHeadMetadataConstantToMetadataIdentifierDictionary;
  id v15 = @"humanHand";
  uint64_t v16 = @"mdta/com.apple.quicktime.detected-human-hand";
  metadataIdentifiersForMetadataObjectTypes__sHumanHandMetadataConstantToMetadataIdentifierDictionardouble y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  return (id)metadataIdentifiersForMetadataObjectTypes__sHumanHandMetadataConstantToMetadataIdentifierDictionary;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureMetadataOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (id)metadataObjectsDelegate
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientDelegate];
}

- (dispatch_queue_t)metadataObjectsCallbackQueue
{
  return (dispatch_queue_t)[(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientCallbackQueue];
}

- (void)setRectOfInterest:(CGRect)rectOfInterest
{
  CGFloat height = rectOfInterest.size.height;
  CGFloat width = rectOfInterest.size.width;
  CGFloat y = rectOfInterest.origin.y;
  CGFloat x = rectOfInterest.origin.x;
  if (!CGRectEqualToRect(self->_internal->rectOfInterest, rectOfInterest))
  {
    internal = self->_internal;
    internal->rectOfInterest.origin.CGFloat x = x;
    internal->rectOfInterest.origin.CGFloat y = y;
    internal->rectOfInterest.size.CGFloat width = width;
    internal->rectOfInterest.size.CGFloat height = height;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = AVMediaTypeForMetadataObjects();
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (BOOL)isFaceTrackingMetadataObjectTypesAvailable
{
  return self->_internal->faceTrackingMetadataObjectTypesAvailable;
}

- (void)setFaceTrackingMaxFaces:(int64_t)a3
{
  if ([(AVCaptureMetadataOutput *)self isFaceTrackingSupported])
  {
    internal = self->_internal;
    if (internal->faceTrackingMaxFaces != a3)
    {
      internal->faceTrackingMaxFaces = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)setFaceTrackingUsesFaceRecognition:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureMetadataOutput *)self isFaceTrackingSupported])
  {
    internal = self->_internal;
    if (internal->faceTrackingUsesFaceRecognition != v3)
    {
      internal->faceTrackingUsesFaceRecognitiouint64_t n = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)setFaceTrackingPlusEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureMetadataOutput *)self isFaceTrackingSupported])
  {
    internal = self->_internal;
    if (internal->faceTrackingPlusEnabled != v3)
    {
      internal->faceTrackingPlusEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)setFaceTrackingNetworkFailureThresholdMultiplier:(float)a3
{
  if ([(AVCaptureMetadataOutput *)self isFaceTrackingSupported])
  {
    internal = self->_internal;
    if (internal->faceTrackingNetworkFailureThresholdMultiplier != a3)
    {
      internal->faceTrackingNetworkFailureThresholdMultiplier = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)setFaceTrackingFailureFieldOfViewModifier:(float)a3
{
  if (![(AVCaptureMetadataOutput *)self isFaceTrackingSupported])
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_8;
  }
  BOOL v5 = a3 >= 0.0;
  if (a3 > 1.0) {
    BOOL v5 = 0;
  }
  if (a3 != -1.0 && !v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
LABEL_8:
    id v8 = (void *)[v6 exceptionWithName:v7 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
    return;
  }
  internal = self->_internal;
  if (internal->faceTrackingFailureFieldOfViewModifier != a3)
  {
    internal->faceTrackingFailureFieldOfViewModifier = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (BOOL)isAttentionDetectionSupported
{
  id v2 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:AVMediaTypeForMetadataObjects()] sourceDevice];

  return [v2 isAttentionDetectionSupported];
}

- (void)setAttentionDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCaptureMetadataOutput *)self isAttentionDetectionSupported])
  {
    id v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->attentionDetectionEnabled != v3)
    {
      internal->attentionDetectionEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isOfflineVideoStabilizationMotionMetadataSupported
{
  id v2 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v3 = *MEMORY[0x1E4F21898];

  return [v2 containsObject:v3];
}

- (BOOL)isOfflineVideoStabilizationMotionMetadataObjectTypesAvailable
{
  return self->_internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable;
}

- (void)setOfflineVideoStabilizationMotionMetadataObjectTypesAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVCaptureMetadataOutput *)self isOfflineVideoStabilizationMotionMetadataSupported])
  {
    if (self->_internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable != v3)
    {
      [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
      self->_internal->offlineVideoStabilizationMotionMetadataObjectTypesAvailable = v3;
      if (!v3)
      {
        BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
        [v5 removeObject:@"offlineVideoStabilizationMotion"];
        uint64_t v6 = [v5 count];
        if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
          [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
        }
      }
      [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
    }
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (BOOL)isVideoPreviewHistogramMetadataObjectTypesAvailable
{
  return self->_internal->videoPreviewHistogramMetadataObjectTypesAvailable;
}

- (BOOL)isAppClipCodeMetadataObjectTypeAvailable
{
  return self->_internal->appClipCodeObjectTypeAvailable;
}

- (BOOL)isTextRegionMetadataObjectTypeAvailable
{
  return self->_internal->textRegionObjectTypeAvailable;
}

- (BOOL)isSceneClassificationMetadataSupported
{
  id v2 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v3 = *MEMORY[0x1E4F527A0];

  return [v2 containsObject:v3];
}

- (BOOL)isSceneClassificationMetadataObjectTypeAvailable
{
  return self->_internal->sceneClassificationObjectTypeAvailable;
}

- (void)setSceneClassificationMetadataObjectTypeAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ![(AVCaptureMetadataOutput *)self isSceneClassificationMetadataSupported])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (self->_internal->sceneClassificationObjectTypeAvailable != v3)
  {
    [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
    self->_internal->sceneClassificationObjectTypeAvailable = v3;
    if (!v3)
    {
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
      [v5 removeObject:@"sceneClassification"];
      uint64_t v6 = [v5 count];
      if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
        [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
      }
    }
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
  }
}

- (BOOL)isVisualIntelligenceMetadataSupported
{
  id v2 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v3 = *MEMORY[0x1E4F527B0];

  return [v2 containsObject:v3];
}

- (BOOL)isVisualIntelligenceMetadataObjectTypeAvailable
{
  return self->_internal->visualIntelligenceObjectTypeAvailable;
}

- (void)setVisualIntelligenceMetadataObjectTypeAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ![(AVCaptureMetadataOutput *)self isVisualIntelligenceMetadataSupported])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (self->_internal->visualIntelligenceObjectTypeAvailable != v3)
  {
    [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
    self->_internal->visualIntelligenceObjectTypeAvailable = v3;
    if (!v3)
    {
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
      [v5 removeObject:@"visualIntelligence"];
      uint64_t v6 = [v5 count];
      if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
        [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
      }
    }
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
  }
}

- (BOOL)isHeadMetadataObjectTypesAvailable
{
  return self->_internal->headObjectTypesAvailable;
}

- (void)setHeadMetadataObjectTypesAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  v8[3] = *MEMORY[0x1E4F143B8];
  if (a3 && ![(AVCaptureMetadataOutput *)self isHeadMetadataSupported])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (self->_internal->headObjectTypesAvailable != v3)
  {
    [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
    self->_internal->headObjectTypesAvailable = v3;
    if (!v3)
    {
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
      v8[0] = @"humanHead";
      v8[1] = @"catHead";
      v8[2] = @"dogHead";
      objc_msgSend(v5, "removeObjectsInArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 3));
      uint64_t v6 = [v5 count];
      if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
        [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
      }
    }
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
  }
}

- (BOOL)isHumanHandMetadataSupported
{
  id v2 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", AVMediaTypeForMetadataObjects()), "sourceDevice"), "supportedMetadataObjectIdentifiers");
  uint64_t v3 = *MEMORY[0x1E4F52770];

  return [v2 containsObject:v3];
}

- (BOOL)isHumanHandMetadataObjectTypeAvailable
{
  return self->_internal->humanHandObjectTypeAvailable;
}

- (void)setHumanHandMetadataObjectTypeAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCaptureMetadataOutput *)self isHumanHandMetadataSupported])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else if (self->_internal->humanHandObjectTypeAvailable != v3)
  {
    [(AVCaptureMetadataOutput *)self willChangeValueForKey:@"availableMetadataObjectTypes"];
    self->_internal->humanHandObjectTypeAvailable = v3;
    if (!v3)
    {
      BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjectTypes];
      [v5 removeObject:@"humanHand"];
      uint64_t v6 = [v5 count];
      if (v6 != [(NSArray *)self->_internal->metadataObjectTypes count]) {
        [(AVCaptureMetadataOutput *)self setMetadataObjectTypes:v5];
      }
    }
    [(AVCaptureMetadataOutput *)self didChangeValueForKey:@"availableMetadataObjectTypes"];
  }
}

- (BOOL)emitsEmptyObjectDetectionMetadata
{
  return self->_internal->emitsEmptyObjectDetectionMetadata;
}

- (void)setEmitsEmptyObjectDetectionMetadata:(BOOL)a3
{
  internal = self->_internal;
  if (internal->emitsEmptyObjectDetectionMetadata != a3)
  {
    internal->emitsEmptyObjectDetectionMetadatCGFloat a = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

+ (id)_metadataConstantValueToName:(id)a3
{
  if (_metadataConstantValueToName__sMetadataConstantToMetadataNameDictionaryOnceToken != -1) {
    dispatch_once(&_metadataConstantValueToName__sMetadataConstantToMetadataNameDictionaryOnceToken, &__block_literal_global_187);
  }
  id result = (id)[(id)_metadataConstantValueToName__sMetadataConstantToMetadataNameDictionary objectForKeyedSubscript:a3];
  if (!result) {
    return (id)[NSString stringWithFormat:@"%@ not mapped! Please file a radar against %s", a3, AVCaptureGetFrameworkRadarComponentName()];
  }
  return result;
}

id __56__AVCaptureMetadataOutput__metadataConstantValueToName___block_invoke()
{
  v2[30] = *MEMORY[0x1E4F143B8];
  v1[0] = @"face";
  v1[1] = @"humanHead";
  v2[0] = @"AVMetadataObjectTypeFace";
  v2[1] = @"AVMetadataObjectTypeHumanHead";
  v1[2] = @"humanBody";
  v1[3] = @"humanFullBody";
  v2[2] = @"AVMetadataObjectTypeHumanBody";
  v2[3] = @"AVMetadataObjectTypeHumanFullBody";
  v1[4] = @"humanHand";
  v1[5] = @"dogHead";
  v2[4] = @"AVMetadataObjectTypeHumanHand";
  v2[5] = @"AVMetadataObjectTypeDogHead";
  v1[6] = @"dogBody";
  v1[7] = @"catHead";
  v2[6] = @"AVMetadataObjectTypeDogBody";
  v2[7] = @"AVMetadataObjectTypeCatHead";
  v1[8] = @"catBody";
  v1[9] = @"salientObject";
  v2[8] = @"AVMetadataObjectTypeCatBody";
  v2[9] = @"AVMetadataObjectTypeSalientObject";
  v1[10] = @"saliencyHeatMap";
  v1[11] = @"trackedFaces";
  v2[10] = @"AVMetadataObjectTypeSaliencyHeatMap";
  v2[11] = @"AVMetadataObjectTypeTrackedFaces";
  v1[12] = @"org.gs1.UPC-E";
  v1[13] = @"org.iso.Code39";
  v2[12] = @"AVMetadataObjectTypeUPCECode";
  v2[13] = @"AVMetadataObjectTypeCode39Code";
  v1[14] = @"org.iso.Code39Mod43";
  v1[15] = @"org.gs1.EAN-13";
  v2[14] = @"AVMetadataObjectTypeCode39Mod43Code";
  v2[15] = @"AVMetadataObjectTypeEAN13Code";
  v1[16] = @"org.gs1.EAN-8";
  v1[17] = @"com.intermec.Code93";
  v2[16] = @"AVMetadataObjectTypeEAN8Code";
  v2[17] = @"AVMetadataObjectTypeCode93Code";
  v1[18] = @"org.iso.Code128";
  v1[19] = @"org.iso.QRCode";
  v2[18] = @"AVMetadataObjectTypeCode128Code";
  v2[19] = @"AVMetadataObjectTypeQRCode";
  v1[20] = @"org.iso.PDF417";
  v1[21] = @"org.iso.Aztec";
  v2[20] = @"AVMetadataObjectTypePDF417Code";
  v2[21] = @"AVMetadataObjectTypeAztecCode";
  v1[22] = @"org.iso.DataMatrix";
  v1[23] = @"org.ansi.Interleaved2of5";
  v2[22] = @"AVMetadataObjectTypeDataMatrixCode";
  v2[23] = @"AVMetadataObjectTypeInterleaved2of5Code";
  v1[24] = @"org.gs1.ITF14";
  v1[25] = @"offlineVideoStabilizationMotion";
  v2[24] = @"AVMetadataObjectTypeITF14Code";
  v2[25] = @"AVMetadataObjectTypeOfflineVideoStabilizationMotion";
  v1[26] = @"videoPreviewHistogram";
  v1[27] = @"com.apple.AppClipCode";
  v2[26] = @"AVMetadataObjectTypeVideoPreviewHistogram";
  v2[27] = @"AVMetadataObjectTypeAppClipCode";
  v1[28] = @"textRegion";
  v1[29] = @"sceneClassification";
  v2[28] = @"AVMetadataObjectTypeTextRegion";
  v2[29] = @"AVMetadataObjectTypeSceneClassification";
  _metadataConstantValueToName__sMetadataConstantToMetadataNameDictionarCGFloat y = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:v1 count:30];
  return (id)_metadataConstantValueToName__sMetadataConstantToMetadataNameDictionary;
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  BOOL v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:mdo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:mdo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3];
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureMetadataOutput;
  [(AVCaptureOutput *)&v6 detachSafelyFromFigCaptureSession:a3];
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  BOOL v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AVCaptureMetadataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E5A730B8;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)[v6 copy]);
}

void __45__AVCaptureMetadataOutput__updateLocalQueue___block_invoke(uint64_t a1, long long *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1A62348E0]();
  id v5 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v5)
  {
    objc_super v6 = v5;
    long long v7 = *a2;
    int v8 = *((_DWORD *)a2 + 4);
    [v5 _handleLocalQueueMessage:&v7];
  }
}

- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3
{
  if (a3->var0 == 3) {
    [(AVCaptureMetadataOutput *)self _processSampleBuffer:*(void *)(&a3->var0 + 1)];
  }
}

- (id)delegateOverride
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverride];
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverrideCallbackQueue];
}

- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4
{
  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    id v7 = 0;
  }
  else {
    id v7 = a4;
  }
  uint64_t v9 = 0;
  if (![(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setDelegateOverride:a3 delegateOverrideCallbackQueue:v7 exceptionReason:&v9])
  {
    int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

@end