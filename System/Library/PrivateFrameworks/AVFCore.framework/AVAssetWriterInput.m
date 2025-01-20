@interface AVAssetWriterInput
+ (AVAssetWriterInput)assetWriterInputWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings;
+ (AVAssetWriterInput)assetWriterInputWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings sourceFormatHint:(CMFormatDescriptionRef)sourceFormatHint;
+ (void)initialize;
- (AVAssetWriterInput)init;
- (AVAssetWriterInput)initWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings;
- (AVAssetWriterInput)initWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings sourceFormatHint:(CMFormatDescriptionRef)sourceFormatHint;
- (AVAssetWriterInputHelper)_helper;
- (AVAssetWriterInputMediaDataLocation)mediaDataLocation;
- (AVAssetWriterInputPassDescription)currentPassDescription;
- (AVMediaType)mediaType;
- (AVOutputSettings)_outputSettingsObject;
- (AVWeakReference)_weakReferenceToAssetWriter;
- (BOOL)_appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4;
- (BOOL)_appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4;
- (BOOL)_isAttachedToAdaptor;
- (BOOL)_markAsFinishedCalled;
- (BOOL)_prepareForWritingWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaFileType:(id)a4 error:(id *)a5;
- (BOOL)_prepareToFinishWritingReturningError:(id *)a3;
- (BOOL)appendSampleBuffer:(CMSampleBufferRef)sampleBuffer;
- (BOOL)canAddTrackAssociationWithTrackOfInput:(AVAssetWriterInput *)input type:(NSString *)trackAssociationType;
- (BOOL)canPerformMultiplePasses;
- (BOOL)expectsMediaDataInRealTime;
- (BOOL)isReadyForMoreMediaData;
- (BOOL)marksOutputTrackAsEnabled;
- (BOOL)maximizePowerEfficiency;
- (BOOL)performsMultiPassEncodingIfSupported;
- (BOOL)writesMediaDataToBeginningOfFile;
- (CGAffineTransform)transform;
- (CGSize)naturalSize;
- (CMFormatDescriptionRef)sourceFormatHint;
- (CMTime)preferredMediaChunkDuration;
- (CMTimeScale)mediaTimeScale;
- (NSArray)metadata;
- (NSDictionary)_sourcePixelBufferAttributes;
- (NSDictionary)_trackReferences;
- (NSDictionary)outputSettings;
- (NSInteger)preferredMediaChunkAlignment;
- (NSString)description;
- (NSString)extendedLanguageTag;
- (NSString)languageCode;
- (NSURL)sampleReferenceBaseURL;
- (__CVPixelBufferPool)_pixelBufferPool;
- (float)preferredVolume;
- (id)_attachedAdaptor;
- (id)associatedInputsWithTrackAssociationType:(id)a3;
- (id)availableTrackAssociationTypes;
- (int)outputTrackID;
- (int64_t)_appendCaption:(id)a3 error:(id *)a4;
- (int64_t)_appendCaptionGroup:(id)a3 error:(id *)a4;
- (int64_t)_appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (int64_t)_status;
- (int64_t)layer;
- (int64_t)numberOfAppendFailures;
- (int64_t)preferredMediaChunkSize;
- (signed)_alternateGroupID;
- (signed)_provisionalAlternateGroupID;
- (void)_didStartInitialSession;
- (void)_prepareToEndSession;
- (void)_setAlternateGroupID:(signed __int16)a3;
- (void)_setAttachedAdaptor:(id)a3;
- (void)_setHelper:(id)a3;
- (void)_setProvisionalAlternateGroupID:(signed __int16)a3;
- (void)_setSourcePixelBufferAttributes:(id)a3;
- (void)_setWeakReferenceToAssetWriter:(id)a3;
- (void)_tellAssetWriterToTransitionToFailedStatusWithError:(id)a3;
- (void)_transitionToTerminalStatus:(int64_t)a3;
- (void)addCallbackToCancelDuringDeallocation:(id)a3;
- (void)addTrackAssociationWithTrackOfInput:(AVAssetWriterInput *)input type:(NSString *)trackAssociationType;
- (void)dealloc;
- (void)declareKeyPathDependenciesWithRegistry:(id)a3;
- (void)markAsFinished;
- (void)markCurrentPassAsFinished;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestMediaDataWhenReadyOnQueue:(dispatch_queue_t)queue usingBlock:(void *)block;
- (void)respondToEachPassDescriptionOnQueue:(dispatch_queue_t)queue usingBlock:(dispatch_block_t)block;
- (void)setExpectsMediaDataInRealTime:(BOOL)expectsMediaDataInRealTime;
- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag;
- (void)setLanguageCode:(NSString *)languageCode;
- (void)setLayer:(int64_t)a3;
- (void)setMarksOutputTrackAsEnabled:(BOOL)marksOutputTrackAsEnabled;
- (void)setMaximizePowerEfficiency:(BOOL)a3;
- (void)setMediaDataLocation:(AVAssetWriterInputMediaDataLocation)mediaDataLocation;
- (void)setMediaTimeScale:(CMTimeScale)mediaTimeScale;
- (void)setMetadata:(NSArray *)metadata;
- (void)setNaturalSize:(CGSize)naturalSize;
- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)performsMultiPassEncodingIfSupported;
- (void)setPreferredMediaChunkAlignment:(NSInteger)preferredMediaChunkAlignment;
- (void)setPreferredMediaChunkDuration:(CMTime *)preferredMediaChunkDuration;
- (void)setPreferredMediaChunkSize:(int64_t)a3;
- (void)setPreferredVolume:(float)preferredVolume;
- (void)setSampleReferenceBaseURL:(NSURL *)sampleReferenceBaseURL;
- (void)setTransform:(CGAffineTransform *)transform;
- (void)setWritesMediaDataToBeginningOfFile:(BOOL)a3;
- (void)stopRequestingMediaData;
@end

@implementation AVAssetWriterInput

+ (void)initialize
{
}

+ (AVAssetWriterInput)assetWriterInputWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings
{
  v4 = (void *)[objc_alloc((Class)a1) initWithMediaType:mediaType outputSettings:outputSettings];
  return (AVAssetWriterInput *)v4;
}

+ (AVAssetWriterInput)assetWriterInputWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings sourceFormatHint:(CMFormatDescriptionRef)sourceFormatHint
{
  v5 = (void *)[objc_alloc((Class)a1) initWithMediaType:mediaType outputSettings:outputSettings sourceFormatHint:sourceFormatHint];
  return (AVAssetWriterInput *)v5;
}

- (AVAssetWriterInput)init
{
  return [(AVAssetWriterInput *)self initWithMediaType:0 outputSettings:0];
}

- (AVAssetWriterInput)initWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings
{
  return [(AVAssetWriterInput *)self initWithMediaType:mediaType outputSettings:outputSettings sourceFormatHint:0];
}

- (AVAssetWriterInput)initWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings sourceFormatHint:(CMFormatDescriptionRef)sourceFormatHint
{
  v59.receiver = self;
  v59.super_class = (Class)AVAssetWriterInput;
  v9 = [(AVAssetWriterInput *)&v59 init];
  v10 = v9;
  if (!mediaType)
  {
    v37 = v9;
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v56 = "mediaType != nil";
    v26 = @"invalid parameter not satisfying: %s";
    goto LABEL_25;
  }
  if (v9)
  {
    v11 = objc_alloc_init(AVAssetWriterInputInternal);
    v10->_internal = v11;
    if (!v11) {
      goto LABEL_22;
    }
    CFRetain(v11);
    if (sourceFormatHint)
    {
      CMMediaType v12 = CMFormatDescriptionGetMediaType(sourceFormatHint);
      if (([(id)AVMediaTypeFromCMMediaType() isEqualToString:mediaType] & 1) == 0)
      {
        v41 = v10;
        v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        v44 = (objc_class *)objc_opt_class();
        uint64_t v38 = AVMethodExceptionReasonWithClassAndSelector(v44, a2, @"The media type of sourceFormatHint must match mediaType", v45, v46, v47, v48, v49, (uint64_t)v56);
        v39 = v42;
        uint64_t v40 = v43;
LABEL_26:
        objc_exception_throw((id)[v39 exceptionWithName:v40 reason:v38 userInfo:0]);
      }
      if (v12 == 1986618469)
      {
        CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(sourceFormatHint);
        if (Dimensions.width < 1 || Dimensions.height <= 0)
        {
          v55 = v10;
          v24 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v25 = *MEMORY[0x1E4F1C3C8];
          v26 = @"Width and height of video format hint must be positive";
          goto LABEL_25;
        }
      }
    }
    if (outputSettings)
    {
      v58 = 0;
      id v14 = +[AVOutputSettings _outputSettingsWithOutputSettingsDictionary:outputSettings mediaType:mediaType exceptionReason:&v58];
      if (!v14)
      {
        v50 = v10;
        v24 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v25 = *MEMORY[0x1E4F1C3C8];
        v26 = v58;
        goto LABEL_25;
      }
      v15 = v14;
      if ((objc_msgSend((id)objc_msgSend(v14, "compatibleMediaTypes"), "containsObject:", mediaType) & 1) == 0)
      {
        v51 = v10;
        v24 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v25 = *MEMORY[0x1E4F1C3C8];
        v26 = @"Output settings must match supplied media type";
        goto LABEL_25;
      }
      v57 = 0;
      char v16 = [v15 canFullySpecifyOutputFormatReturningReason:&v57];
      if (!sourceFormatHint && (v16 & 1) == 0)
      {
        v52 = v10;
        v24 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v25 = *MEMORY[0x1E4F1C3C8];
        v26 = v57;
        goto LABEL_25;
      }
      id v17 = [(NSDictionary *)outputSettings objectForKey:@"AVVideoScalingModeKey"];
      if (v17 && [v17 isEqualToString:@"AVVideoScalingModeFit"])
      {
        v54 = v10;
        v24 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v25 = *MEMORY[0x1E4F1C3C8];
        v26 = @"AVAssetWriterInput does not currently support AVVideoScalingModeFit";
        goto LABEL_25;
      }
      if ([(NSDictionary *)outputSettings objectForKey:*MEMORY[0x1E4F15260]])
      {
        v53 = v10;
        v24 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v25 = *MEMORY[0x1E4F1C3C8];
        v26 = @"AVAssetWriterInput does not support AVSampleRateConverterAudioQualityKey";
        goto LABEL_25;
      }
      if ([(NSDictionary *)outputSettings objectForKey:@"AVVideoDecompressionPropertiesKey"])
      {
        v18 = v10;
        v24 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v25 = *MEMORY[0x1E4F1C3C8];
        v26 = @"AVAssetWriterInput does not support AVVideoDecompressionPropertiesKey";
LABEL_25:
        uint64_t v38 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v10, a2, (uint64_t)v26, v19, v20, v21, v22, v23, (uint64_t)v56);
        v39 = v24;
        uint64_t v40 = v25;
        goto LABEL_26;
      }
    }
    else
    {
      v15 = 0;
    }
    v10->_internal->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v10];
    v10->_internal->keyPathDependencyManager = [[AVKeyPathDependencyManager alloc] initWithDependencyHost:v10];
    v27 = NSString;
    v28 = (objc_class *)objc_opt_class();
    v29 = (const char *)[(id)objc_msgSend(v27 stringWithFormat:@"<%@: %p> helper queue", NSStringFromClass(v28), v10), "UTF8String"];
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10->_internal->helperQueue = (OS_dispatch_queue *)dispatch_queue_create(v29, v30);
    v10->_internal->numberOfAppendFailures = 0;
    v10->_internal->markAsFinishedCalled = 0;
    v31 = NSString;
    v32 = (objc_class *)objc_opt_class();
    v33 = (const char *)[(id)objc_msgSend(v31 stringWithFormat:@"<%@: %p> \"number of append failures\" read/write queue", NSStringFromClass(v32), v10), "UTF8String"];
    v10->_internal->appendFailureReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v33);
    v10->_internal->helper = (AVAssetWriterInputHelper *)[[AVAssetWriterInputUnknownHelper alloc] initWithMediaType:mediaType outputSettings:v15 sourceFormatHint:sourceFormatHint];
    internal = v10->_internal;
    helper = internal->helper;
    if (helper)
    {
      [(AVAssetWriterInputHelper *)helper setWeakReferenceToAssetWriterInput:internal->weakReference];
      [(AVKeyPathDependencyManager *)v10->_internal->keyPathDependencyManager dependencyHostIsFullyInitialized];
    }
    else
    {
LABEL_22:

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    [(AVKeyPathDependencyManager *)internal->keyPathDependencyManager cancelAllCallbacks];

    v4 = self->_internal;
    if (v4->passDescriptionResponder)
    {
      [(AVAssetWriterInput *)self removeObserver:self forKeyPath:@"currentPassDescription" context:@"AVAssetWriterInputCurrentPassDescriptionChangeContext"];
      v4 = self->_internal;
    }

    v5 = self->_internal;
    helperQueue = v5->helperQueue;
    if (helperQueue) {
      dispatch_release(helperQueue);
    }
    appendFailureReadWriteQueue = v5->appendFailureReadWriteQueue;
    if (appendFailureReadWriteQueue) {
      dispatch_release(appendFailureReadWriteQueue);
    }
    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterInput;
  [(AVAssetWriterInput *)&v8 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, mediaType = %@, outputSettings = %@>", NSStringFromClass(v4), self, -[AVAssetWriterInput mediaType](self, "mediaType"), -[AVAssetWriterInput outputSettings](self, "outputSettings")];
}

- (AVAssetWriterInputHelper)_helper
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  uint64_t v11 = 0;
  helperQueue = self->_internal->helperQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__AVAssetWriterInput__helper__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(helperQueue, v5);
  v3 = (AVAssetWriterInputHelper *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __29__AVAssetWriterInput__helper__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVWeakReference)_weakReferenceToAssetWriter
{
  return self->_internal->weakReferenceToAssetWriter;
}

- (void)_setWeakReferenceToAssetWriter:(id)a3
{
  id v5 = a3;

  self->_internal->weakReferenceToAssetWriter = (AVWeakReference *)a3;
}

- (void)_tellAssetWriterToTransitionToFailedStatusWithError:(id)a3
{
  id v4 = [(AVWeakReference *)[(AVAssetWriterInput *)self _weakReferenceToAssetWriter] referencedObject];
  [v4 _transitionToFailedStatusWithError:a3];
}

- (int64_t)_status
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 status];
}

- (void)_setHelper:(id)a3
{
  helperQueue = self->_internal->helperQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__AVAssetWriterInput__setHelper___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(helperQueue, v4);
}

void *__33__AVAssetWriterInput__setHelper___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 16);
  if (v2 != result)
  {
    [result setWeakReferenceToAssetWriterInput:0];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 16) = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 8);
    id v5 = *(void **)(v4 + 16);
    return (void *)[v5 setWeakReferenceToAssetWriterInput:v6];
  }
  return result;
}

- (AVMediaType)mediaType
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 mediaType];
}

- (AVOutputSettings)_outputSettingsObject
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 outputSettings];
}

- (NSDictionary)outputSettings
{
  v2 = [(AVAssetWriterInput *)self _outputSettingsObject];
  return [(AVOutputSettings *)v2 outputSettingsDictionary];
}

- (CMFormatDescriptionRef)sourceFormatHint
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 sourceFormatHint];
}

- (int)outputTrackID
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 trackID];
}

- (NSArray)metadata
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 metadata];
}

- (void)setMetadata:(NSArray *)metadata
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setMetadata:metadata];
}

- (CGAffineTransform)transform
{
  id result = [(AVAssetWriterInput *)self _helper];
  if (result)
  {
    return (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (void)setTransform:(CGAffineTransform *)transform
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  long long v5 = *(_OWORD *)&transform->c;
  v6[0] = *(_OWORD *)&transform->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&transform->tx;
  [(AVAssetWriterInputHelper *)v4 setTransform:v6];
}

- (CMTimeScale)mediaTimeScale
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 mediaTimeScale];
}

- (void)setMediaTimeScale:(CMTimeScale)mediaTimeScale
{
  if (mediaTimeScale < 0)
  {
    v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"mediaTimeScale >= 0"), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  uint64_t v8 = *(void *)&mediaTimeScale;
  v9 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v9 setMediaTimeScale:v8];
}

- (CGSize)naturalSize
{
  v2 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v2 naturalSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setNaturalSize:(CGSize)naturalSize
{
  if (naturalSize.width < 0.0 || (double height = naturalSize.height, naturalSize.height < 0.0))
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"naturalSize.width >= 0.0 && naturalSize.height >= 0.0"), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  double width = naturalSize.width;
  v10 = [(AVAssetWriterInput *)self _helper];
  -[AVAssetWriterInputHelper setNaturalSize:](v10, "setNaturalSize:", width, height);
}

- (NSString)languageCode
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 languageCode];
}

- (void)setLanguageCode:(NSString *)languageCode
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setLanguageCode:languageCode];
}

- (NSString)extendedLanguageTag
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 extendedLanguageTag];
}

- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setExtendedLanguageTag:extendedLanguageTag];
}

- (BOOL)marksOutputTrackAsEnabled
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 marksOutputTrackAsEnabled];
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)marksOutputTrackAsEnabled
{
  BOOL v3 = marksOutputTrackAsEnabled;
  if ([(AVAssetWriterInputHelper *)[(AVAssetWriterInput *)self _helper] alternateGroupID])
  {
    CMMediaType v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot set marksOutputTrackAsEnabled of the receiver in an input group", v6, v7, v8, v9, v10, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  uint64_t v11 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v11 setMarksOutputTrackAsEnabled:v3];
}

- (float)preferredVolume
{
  v2 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v2 preferredVolume];
  return result;
}

- (void)setPreferredVolume:(float)preferredVolume
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  *(float *)&double v5 = preferredVolume;
  [(AVAssetWriterInputHelper *)v4 setPreferredVolume:v5];
}

- (int64_t)layer
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 layer];
}

- (void)setLayer:(int64_t)a3
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setLayer:a3];
}

- (signed)_alternateGroupID
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 alternateGroupID];
}

- (void)_setAlternateGroupID:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setAlternateGroupID:v3];
}

- (signed)_provisionalAlternateGroupID
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 provisionalAlternateGroupID];
}

- (void)_setProvisionalAlternateGroupID:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setProvisionalAlternateGroupID:v3];
}

- (NSDictionary)_trackReferences
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 trackReferences];
}

- (CMTime)preferredMediaChunkDuration
{
  float result = [(AVAssetWriterInput *)self _helper];
  if (result)
  {
    return (CMTime *)[(CMTime *)result preferredMediaChunkDuration];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (void)setPreferredMediaChunkDuration:(CMTime *)preferredMediaChunkDuration
{
  if ((preferredMediaChunkDuration->flags & 1) != 0 && (preferredMediaChunkDuration->flags & 0x1D) != 1)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    CMMediaType v12 = @"media chunk duration must be numeric.  See CMTIME_IS_NUMERIC";
    goto LABEL_7;
  }
  if (preferredMediaChunkDuration->value < 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    CMMediaType v12 = @"media chunk duration must be a positive value";
LABEL_7:
    uint64_t v13 = objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v12, v3, v4, v5, v6, v7, v14), 0);
    objc_exception_throw(v13);
  }
  uint64_t v9 = [(AVAssetWriterInput *)self _helper];
  long long v14 = *(_OWORD *)&preferredMediaChunkDuration->value;
  CMTimeEpoch epoch = preferredMediaChunkDuration->epoch;
  [(AVAssetWriterInputHelper *)v9 setPreferredMediaChunkDuration:&v14];
}

- (NSInteger)preferredMediaChunkAlignment
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 preferredMediaChunkAlignment];
}

- (void)setPreferredMediaChunkAlignment:(NSInteger)preferredMediaChunkAlignment
{
  if (preferredMediaChunkAlignment < 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVAssetWriterInput.m", 1605, @"Invalid parameter not satisfying: %@", @"preferredMediaChunkAlignment >= 0");
  }
  uint64_t v5 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v5 setPreferredMediaChunkAlignment:preferredMediaChunkAlignment];
}

- (int64_t)preferredMediaChunkSize
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 preferredMediaChunkSize];
}

- (void)setPreferredMediaChunkSize:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"preferredMediaChunkSize >= 0"), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  uint64_t v9 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v9 setPreferredMediaChunkSize:a3];
}

- (BOOL)writesMediaDataToBeginningOfFile
{
  v2 = [(AVAssetWriterInput *)self mediaDataLocation];
  return [(NSString *)v2 isEqualToString:@"AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved"];
}

- (void)setWritesMediaDataToBeginningOfFile:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = @"AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved";
  }
  else {
    uint64_t v3 = @"AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData";
  }
  [(AVAssetWriterInput *)self setMediaDataLocation:v3];
}

- (AVAssetWriterInputMediaDataLocation)mediaDataLocation
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 mediaDataLocation];
}

- (void)setMediaDataLocation:(AVAssetWriterInputMediaDataLocation)mediaDataLocation
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setMediaDataLocation:mediaDataLocation];
}

- (NSURL)sampleReferenceBaseURL
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 sampleReferenceBaseURL];
}

- (void)setSampleReferenceBaseURL:(NSURL *)sampleReferenceBaseURL
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setSampleReferenceBaseURL:sampleReferenceBaseURL];
}

- (__CVPixelBufferPool)_pixelBufferPool
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 pixelBufferPool];
}

- (NSDictionary)_sourcePixelBufferAttributes
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 sourcePixelBufferAttributes];
}

- (void)_setSourcePixelBufferAttributes:(id)a3
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setSourcePixelBufferAttributes:a3];
}

- (id)_attachedAdaptor
{
  return [(AVWeakReference *)self->_internal->weakReferenceToAttachedAdaptor referencedObject];
}

- (BOOL)_isAttachedToAdaptor
{
  return [(AVWeakReference *)self->_internal->weakReferenceToAttachedAdaptor referencedObject] != 0;
}

- (void)_setAttachedAdaptor:(id)a3
{
  self->_internal->weakReferenceToAttachedAdaptor = [[AVWeakReference alloc] initWithReferencedObject:a3];
}

- (BOOL)_prepareForWritingWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaFileType:(id)a4 error:(id *)a5
{
  id v17 = 0;
  uint64_t v9 = [(AVAssetWriterInputHelper *)[(AVAssetWriterInput *)self _helper] outputSettings];
  uint64_t v10 = v9;
  if (!v9
    || (LODWORD(v11) = [(AVOutputSettings *)v9 encoderIsAvailableOnCurrentSystemReturningError:&v17], v11))
  {
    uint64_t v11 = +[AVFigAssetWriterTrack assetWriterTrackWithFigAssetWriter:mediaType:mediaFileType:formatSpecification:sourcePixelBufferAttributes:multiPass:attachedAdaptor:error:](AVFigAssetWriterTrack, "assetWriterTrackWithFigAssetWriter:mediaType:mediaFileType:formatSpecification:sourcePixelBufferAttributes:multiPass:attachedAdaptor:error:", a3, [(AVAssetWriterInput *)self mediaType], a4, +[AVFormatSpecification formatSpecificationWithOutputSettings:v10 sourceFormatDescription:[(AVAssetWriterInput *)self sourceFormatHint]], [(AVAssetWriterInput *)self _sourcePixelBufferAttributes], [(AVAssetWriterInput *)self performsMultiPassEncodingIfSupported], [(AVAssetWriterInput *)self _attachedAdaptor], &v17);
    if (v11)
    {
      CMMediaType v12 = v11;
      uint64_t v13 = [(AVAssetWriterInputHelper *)[(AVAssetWriterInput *)self _helper] configurationState];
      if ([(AVAssetWriterInput *)self expectsMediaDataInRealTime]
        && [(NSString *)[(AVAssetWriterInput *)self mediaType] isEqualToString:@"soun"])
      {
        CMTimeMake(&v16, 1, 2);
        [(AVAssetWriterInputWritingHelper *)v12 setSampleBufferCoalescingInterval:&v16];
      }
      uint64_t v11 = [[AVAssetWriterInputWritingHelper alloc] initWithConfigurationState:v13 assetWriterTrack:v12 error:&v17];
      if (v11)
      {
        long long v14 = v11;
        [(AVAssetWriterInput *)self _setHelper:v11];

        LOBYTE(v11) = [(AVAssetWriterInputHelper *)[(AVAssetWriterInput *)self _helper] status] == 1;
      }
    }
  }
  if (a5 && (v11 & 1) == 0) {
    *a5 = v17;
  }
  return (char)v11;
}

- (void)_didStartInitialSession
{
  v2 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v2 didStartInitialSession];
}

- (void)_prepareToEndSession
{
  v2 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v2 prepareToEndSession];
}

- (BOOL)_prepareToFinishWritingReturningError:(id *)a3
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v4 prepareToFinishWritingReturningError:a3];
}

- (void)_transitionToTerminalStatus:(int64_t)a3
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 transitionToAndReturnTerminalHelperWithTerminalStatus:a3];
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  [a3 valueForKey:@"canPerformMultiplePasses", AVTwoPartKeyPathMake(@"helper", @"canPerformMultiplePasses") dependsOnValueAtKeyPath];
  [a3 valueForKey:@"currentPassDescription", AVTwoPartKeyPathMake(@"helper", @"currentPassDescription") dependsOnValueAtKeyPath];
  [a3 valueForKey:@"readyForMoreMediaData", AVTwoPartKeyPathMake(@"helper", @"readyForMoreMediaData") dependsOnValueAtKeyPath];
  [a3 valueForKey:@"status", AVTwoPartKeyPathMake(@"helper", @"status") dependsOnValueAtKeyPath];
  uint64_t v4 = AVTwoPartKeyPathMake(@"helper", @"pixelBufferPool");
  [a3 valueForKey:@"pixelBufferPool" dependsOnValueAtKeyPath:v4];
}

- (BOOL)isReadyForMoreMediaData
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 isReadyForMoreMediaData];
}

- (BOOL)expectsMediaDataInRealTime
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 expectsMediaDataInRealTime];
}

- (void)setExpectsMediaDataInRealTime:(BOOL)expectsMediaDataInRealTime
{
  BOOL v3 = expectsMediaDataInRealTime;
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setExpectsMediaDataInRealTime:v3];
}

- (BOOL)maximizePowerEfficiency
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 maximizePowerEfficiency];
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setMaximizePowerEfficiency:v3];
}

- (BOOL)performsMultiPassEncodingIfSupported
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 performsMultiPassEncodingIfSupported];
}

- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)performsMultiPassEncodingIfSupported
{
  BOOL v3 = performsMultiPassEncodingIfSupported;
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v4 setPerformsMultiPassEncodingIfSupported:v3];
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
}

- (BOOL)canPerformMultiplePasses
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 canPerformMultiplePasses];
}

- (AVAssetWriterInputPassDescription)currentPassDescription
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 currentPassDescription];
}

- (void)respondToEachPassDescriptionOnQueue:(dispatch_queue_t)queue usingBlock:(dispatch_block_t)block
{
  if (!queue)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = "queue != NULL";
LABEL_10:
    uint64_t v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)block, v4, v5, v6, v7, (uint64_t)v20);
    goto LABEL_14;
  }
  if (!block)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = "block != nil";
    goto LABEL_10;
  }
  CMMediaType v12 = [(AVAssetWriterInput *)self _helper];
  v24 = 0;
  if (![(AVAssetWriterInputHelper *)v12 canStartRespondingToEachPassDescriptionReturningReason:&v24])
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    uint64_t v22 = v24;
LABEL_13:
    uint64_t v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v22, v13, v14, v15, v16, v17, v23);
LABEL_14:
    objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v21 userInfo:0]);
  }
  if (self->_internal->passDescriptionResponder)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    uint64_t v22 = @"cannot be called more than once.";
    goto LABEL_13;
  }
  self->_internal->passDescriptionResponder = [[AVAssetWriterInputPassDescriptionResponder alloc] initWithCallbackQueue:queue block:block];
  [(AVAssetWriterInput *)self addObserver:self forKeyPath:@"currentPassDescription" options:0 context:@"AVAssetWriterInputCurrentPassDescriptionChangeContext"];
  if ([(AVAssetWriterInputHelper *)v12 shouldRespondToInitialPassDescription]) {
    [(AVAssetWriterInputPassDescriptionResponder *)self->_internal->passDescriptionResponder respondToNewPassDescription:[(AVAssetWriterInput *)self currentPassDescription]];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"AVAssetWriterInputCurrentPassDescriptionChangeContext")
  {
    passDescriptionResponder = self->_internal->passDescriptionResponder;
    uint64_t v7 = [(AVAssetWriterInput *)self currentPassDescription];
    [(AVAssetWriterInputPassDescriptionResponder *)passDescriptionResponder respondToNewPassDescription:v7];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVAssetWriterInput;
    -[AVAssetWriterInput observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)requestMediaDataWhenReadyOnQueue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  if (!queue)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = "queue != NULL";
    goto LABEL_8;
  }
  if (!block)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = "block != nil";
LABEL_8:
    uint64_t v14 = (void *)[v11 exceptionWithName:v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)block, v4, v5, v6, v7, (uint64_t)v13), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  uint64_t v10 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v10 requestMediaDataWhenReadyOnQueue:queue usingBlock:block];
}

- (void)stopRequestingMediaData
{
  v2 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v2 stopRequestingMediaData];
}

- (int64_t)_appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v6 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v6 appendSampleBuffer:a3 error:a4];
}

- (BOOL)appendSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
  if (!sampleBuffer)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    uint64_t v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"sampleBuffer != NULL");
    v27 = v24;
    uint64_t v28 = v25;
    goto LABEL_14;
  }
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (FormatDescription)
  {
    uint64_t v12 = FormatDescription;
    uint64_t v13 = [(AVAssetWriterInput *)self mediaType];
    uint64_t MediaType = CMFormatDescriptionGetMediaType(v12);
    uint64_t v15 = (void *)AVMediaTypeFromCMMediaType(MediaType);
    if (([v15 isEqualToString:v13] & 1) == 0
      && (![v15 isEqualToString:@"vide"]
       || ![(NSString *)v13 isEqualToString:@"auxv"]))
    {
      v29 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v30 = *MEMORY[0x1E4F1C3C8];
      uint64_t v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Media type of sample buffer must match receiver's media type (\"%@\")", v16, v17, v18, v19, v20, (uint64_t)v13);
      v27 = v29;
LABEL_13:
      uint64_t v28 = v30;
LABEL_14:
      objc_exception_throw((id)[v27 exceptionWithName:v28 reason:v26 userInfo:0]);
    }
  }
  id v40 = 0;
  int64_t v21 = [(AVAssetWriterInput *)self _appendSampleBuffer:sampleBuffer error:&v40];
  if (v21 == 1)
  {
    if ([v40 code] != -11999)
    {
      [(AVAssetWriterInput *)self _tellAssetWriterToTransitionToFailedStatusWithError:v40];
      appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__AVAssetWriterInput_appendSampleBuffer___block_invoke;
      block[3] = &unk_1E57B1E80;
      block[4] = self;
      av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, block);
      return v21 == 0;
    }
    v31 = objc_msgSend((id)objc_msgSend(v40, "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
    v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = [v31 name];
    uint64_t v33 = [v31 reason];
    uint64_t v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot append sample buffer: %@", v34, v35, v36, v37, v38, v33);
    v27 = v32;
    goto LABEL_13;
  }
  return v21 == 0;
}

uint64_t __41__AVAssetWriterInput_appendSampleBuffer___block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)_appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  uint64_t v7 = [(AVAssetWriterInput *)self _helper];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  BOOL v8 = [(AVAssetWriterInputHelper *)v7 appendPixelBuffer:a3 withPresentationTime:&v12];
  if (!v8)
  {
    appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__AVAssetWriterInput__appendPixelBuffer_withPresentationTime___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, block);
  }
  return v8;
}

uint64_t __62__AVAssetWriterInput__appendPixelBuffer_withPresentationTime___block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)_appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  uint64_t v7 = [(AVAssetWriterInput *)self _helper];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  BOOL v8 = [(AVAssetWriterInputHelper *)v7 appendTaggedPixelBufferGroup:a3 withPresentationTime:&v12];
  if (!v8)
  {
    appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__AVAssetWriterInput__appendTaggedPixelBufferGroup_withPresentationTime___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, block);
  }
  return v8;
}

uint64_t __73__AVAssetWriterInput__appendTaggedPixelBufferGroup_withPresentationTime___block_invoke(uint64_t result)
{
  return result;
}

- (int64_t)_appendCaption:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  int64_t v6 = [(AVAssetWriterInputHelper *)[(AVAssetWriterInput *)self _helper] appendCaption:a3 error:&v10];
  if (v6 == 1)
  {
    [(AVAssetWriterInput *)self _tellAssetWriterToTransitionToFailedStatusWithError:v10];
    if (a4) {
      *a4 = v10;
    }
    appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__AVAssetWriterInput__appendCaption_error___block_invoke;
    v9[3] = &unk_1E57B1E80;
    v9[4] = self;
    av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, v9);
  }
  return v6;
}

uint64_t __43__AVAssetWriterInput__appendCaption_error___block_invoke(uint64_t result)
{
  return result;
}

- (int64_t)_appendCaptionGroup:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  int64_t v6 = [(AVAssetWriterInputHelper *)[(AVAssetWriterInput *)self _helper] appendCaptionGroup:a3 error:&v10];
  if (v6 == 1)
  {
    [(AVAssetWriterInput *)self _tellAssetWriterToTransitionToFailedStatusWithError:v10];
    if (a4) {
      *a4 = v10;
    }
    appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__AVAssetWriterInput__appendCaptionGroup_error___block_invoke;
    v9[3] = &unk_1E57B1E80;
    v9[4] = self;
    av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, v9);
  }
  return v6;
}

uint64_t __48__AVAssetWriterInput__appendCaptionGroup_error___block_invoke(uint64_t result)
{
  return result;
}

- (int64_t)numberOfAppendFailures
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVAssetWriterInput_numberOfAppendFailures__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(appendFailureReadWriteQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVAssetWriterInput_numberOfAppendFailures__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 56);
  return result;
}

- (void)markAsFinished
{
  appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVAssetWriterInput_markAsFinished__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(appendFailureReadWriteQueue, block);
  passDescriptionResponder = self->_internal->passDescriptionResponder;
  if (passDescriptionResponder) {
    [(AVAssetWriterInputPassDescriptionResponder *)passDescriptionResponder stopRespondingToPassDescriptions];
  }
  [(AVAssetWriterInputHelper *)[(AVAssetWriterInput *)self _helper] markAsFinished];
}

uint64_t __36__AVAssetWriterInput_markAsFinished__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 64) = 1;
  return result;
}

- (BOOL)_markAsFinishedCalled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVAssetWriterInput__markAsFinishedCalled__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(appendFailureReadWriteQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVAssetWriterInput__markAsFinishedCalled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 64);
  return result;
}

- (void)markCurrentPassAsFinished
{
  v2 = [(AVAssetWriterInput *)self _helper];
  [(AVAssetWriterInputHelper *)v2 markCurrentPassAsFinished];
}

- (BOOL)canAddTrackAssociationWithTrackOfInput:(AVAssetWriterInput *)input type:(NSString *)trackAssociationType
{
  if (!input)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = "input != nil";
    goto LABEL_8;
  }
  if (!trackAssociationType)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = "trackAssociationType != nil";
LABEL_8:
    uint64_t v15 = (void *)[v12 exceptionWithName:v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)trackAssociationType, v4, v5, v6, v7, (uint64_t)v14), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  uint64_t v10 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v10 canAddTrackAssociationWithTrackOfInput:input type:trackAssociationType];
}

- (void)addTrackAssociationWithTrackOfInput:(AVAssetWriterInput *)input type:(NSString *)trackAssociationType
{
  if (!input)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = "input != nil";
    goto LABEL_8;
  }
  if (!trackAssociationType)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = "trackAssociationType != nil";
LABEL_8:
    uint64_t v14 = (void *)[v11 exceptionWithName:v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)trackAssociationType, v4, v5, v6, v7, (uint64_t)v13), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  [(AVAssetWriterInput *)self willChangeValueForKey:@"trackReferences"];
  [(AVAssetWriterInputHelper *)[(AVAssetWriterInput *)self _helper] addTrackAssociationWithTrackOfInput:input type:trackAssociationType];
  [(AVAssetWriterInput *)self didChangeValueForKey:@"trackReferences"];
}

- (id)availableTrackAssociationTypes
{
  v2 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v2 availableTrackAssociationTypes];
}

- (id)associatedInputsWithTrackAssociationType:(id)a3
{
  uint64_t v4 = [(AVAssetWriterInput *)self _helper];
  return [(AVAssetWriterInputHelper *)v4 associatedInputsWithTrackAssociationType:a3];
}

@end