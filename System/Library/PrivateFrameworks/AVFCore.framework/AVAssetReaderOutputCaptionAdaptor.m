@interface AVAssetReaderOutputCaptionAdaptor
+ (AVAssetReaderOutputCaptionAdaptor)assetReaderOutputCaptionAdaptorWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput;
- (AVAssetReaderOutputCaptionAdaptor)initWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput;
- (AVAssetReaderTrackOutput)assetReaderTrackOutput;
- (AVCaptionGroup)nextCaptionGroup;
- (NSArray)captionsNotPresentInPreviousGroupsInCaptionGroup:(AVCaptionGroup *)captionGroup;
- (id)_readSampleBuffersAndReturnAVCaption;
- (id)pairedAVCaptionForFigCaption:(OpaqueFigCaption *)a3;
- (id)validationDelegate;
- (int)addExtractionForOutput:(id)a3 figAssetReader:(OpaqueFigAssetReader *)a4 options:(id)a5 withOutputExtactionID:(int *)a6;
- (void)appendOutputCaptionGroup:(id)a3;
- (void)dealloc;
- (void)setFigCaptionToAVCaptionMapping:(__CFDictionary *)a3;
- (void)setValidationDelegate:(id)validationDelegate;
@end

@implementation AVAssetReaderOutputCaptionAdaptor

+ (AVAssetReaderOutputCaptionAdaptor)assetReaderOutputCaptionAdaptorWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAssetReaderTrackOutput:trackOutput];
  return (AVAssetReaderOutputCaptionAdaptor *)v3;
}

- (AVAssetReaderOutputCaptionAdaptor)initWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput
{
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (!trackOutput)
  {
    v12 = self;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v15, v16, v17, v18, v19, (uint64_t)"trackOutput != nil");
LABEL_12:
    uint64_t v27 = v20;
    v28 = v13;
    uint64_t v29 = v14;
    goto LABEL_16;
  }
  uint64_t v8 = (uint64_t)v7;
  if ((objc_msgSend((id)AVMediaTypesForCaptionEditing(), "containsObject:", -[AVAssetReaderTrackOutput mediaType](trackOutput, "mediaType")) & 1) == 0)
  {
    v21 = self;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot create a new caption adaptor with an unsupported media type", v22, v23, v24, v25, v26, v45);
    goto LABEL_12;
  }
  if ([(AVAssetReaderTrackOutput *)trackOutput _isAttachedToAdaptor])
  {
    v30 = self;
    v31 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v32 = *MEMORY[0x1E4F1C3C8];
    uint64_t v38 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot initialize an instance of %@ with a track output which was used to initialize another instance of %@", v33, v34, v35, v36, v37, v8);
LABEL_15:
    uint64_t v27 = v38;
    v28 = v31;
    uint64_t v29 = v32;
LABEL_16:
    objc_exception_throw((id)[v28 exceptionWithName:v29 reason:v27 userInfo:0]);
  }
  if ([(AVAssetReaderOutput *)trackOutput _status] >= 1)
  {
    v39 = self;
    v31 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v32 = *MEMORY[0x1E4F1C3C8];
    uint64_t v38 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot initialize an instance of %@ with a track output which has already progressed beyond AVAssetReaderStatusUnknown", v40, v41, v42, v43, v44, v8);
    goto LABEL_15;
  }
  v46.receiver = self;
  v46.super_class = (Class)AVAssetReaderOutputCaptionAdaptor;
  v9 = [(AVAssetReaderOutputCaptionAdaptor *)&v46 init];
  if (v9)
  {
    v10 = objc_alloc_init(AVAssetReaderOutputCaptionAdaptorInternal);
    v9->_internal = v10;
    if (!v10
      || (CFRetain(v10),
          v9->_internal->trackOutput = trackOutput,
          [(AVAssetReaderTrackOutput *)v9->_internal->trackOutput _setAttachedAdaptor:v9],
          v9->_internal->avCaptionGroupOutputQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]),
          v9->_internal->figCaptionToAVCaptionMapping = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]), v9->_internal->endOfStream = 0, FigCaptionTimelineGeneratorCreate()))
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    if (v4->figCaptionToAVCaptionMapping)
    {
      CFRelease(v4->figCaptionToAVCaptionMapping);
      v4 = self->_internal;
    }
    if (v4->sbufToCaptionGroupConverter)
    {
      CFRelease(v4->sbufToCaptionGroupConverter);
      v4 = self->_internal;
    }
    CFRelease(v4);
    internal = self->_internal;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVAssetReaderOutputCaptionAdaptor;
  [(AVAssetReaderOutputCaptionAdaptor *)&v5 dealloc];
}

- (int)addExtractionForOutput:(id)a3 figAssetReader:(OpaqueFigAssetReader *)a4 options:(id)a5 withOutputExtactionID:(int *)a6
{
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "track"), "trackID");
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, id, int *))(v11 + 136);
  if (!v12) {
    return -12782;
  }
  return v12(a4, v9, a5, a6);
}

- (AVAssetReaderTrackOutput)assetReaderTrackOutput
{
  return self->_internal->trackOutput;
}

- (id)_readSampleBuffersAndReturnAVCaption
{
  v3 = 0;
  while (![(NSMutableArray *)self->_internal->avCaptionGroupOutputQueue count])
  {
    internal = self->_internal;
    if (internal->endOfStream) {
      break;
    }
    if (v3)
    {
      CFRelease(v3);
      internal = self->_internal;
    }
    v3 = [(AVAssetReaderTrackOutput *)internal->trackOutput _copyNextSampleBufferForAdaptor];
    if (v3)
    {
      if (FigCaptionTimelineGeneratorAddSampleBuffer())
      {
        id v6 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      FigCaptionTimelineGeneratorFinish();
      self->_internal->endOfStream = 1;
    }
  }
  if (![(NSMutableArray *)self->_internal->avCaptionGroupOutputQueue count])
  {
    id v6 = 0;
    if (!v3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v6 = (id)[(NSMutableArray *)self->_internal->avCaptionGroupOutputQueue objectAtIndex:0];
  [(NSMutableArray *)self->_internal->avCaptionGroupOutputQueue removeObjectAtIndex:0];
  if (v3) {
LABEL_14:
  }
    CFRelease(v3);
LABEL_15:
  return v6;
}

- (AVCaptionGroup)nextCaptionGroup
{
  unint64_t v4 = [[(AVAssetReaderOutputCaptionAdaptor *)self assetReaderTrackOutput] _status];
  if (!v4)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot call method until the track output is attached to an asset reader and -startReading has been called on that asset reader", v5, v6, v7, v8, v9, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  if (v4 > 2) {
    return 0;
  }
  return (AVCaptionGroup *)[(AVAssetReaderOutputCaptionAdaptor *)self _readSampleBuffersAndReturnAVCaption];
}

- (NSArray)captionsNotPresentInPreviousGroupsInCaptionGroup:(AVCaptionGroup *)captionGroup
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!captionGroup)
  {
    uint64_t v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"captionGroup != nil"), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  [(AVCaptionGroup *)captionGroup timeRange];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(AVCaptionGroup *)captionGroup captions];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v20 = 0u;
        if (v15) {
          [v15 timeRange];
        }
        *(_OWORD *)&time1.value = v20;
        time1.epoch = v21;
        *(_OWORD *)&time2.value = v27;
        time2.epoch = v28;
        if (!CMTimeCompare(&time1, &time2)) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v12);
  }
  return (NSArray *)v9;
}

- (void)setValidationDelegate:(id)validationDelegate
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v6 = [[AVWeakReference alloc] initWithReferencedObject:validationDelegate];

  self->_internal->validationDelegate = v6;
  objc_sync_exit(internal);
}

- (id)validationDelegate
{
  internal = self->_internal;
  objc_sync_enter(internal);
  id v4 = [(AVWeakReference *)self->_internal->validationDelegate referencedObject];
  objc_sync_exit(internal);
  return v4;
}

- (void)appendOutputCaptionGroup:(id)a3
{
}

- (id)pairedAVCaptionForFigCaption:(OpaqueFigCaption *)a3
{
  return (id)CFDictionaryGetValue(self->_internal->figCaptionToAVCaptionMapping, a3);
}

- (void)setFigCaptionToAVCaptionMapping:(__CFDictionary *)a3
{
  internal = self->_internal;
  figCaptionToAVCaptionMapping = internal->figCaptionToAVCaptionMapping;
  internal->figCaptionToAVCaptionMapping = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (figCaptionToAVCaptionMapping)
  {
    CFRelease(figCaptionToAVCaptionMapping);
  }
}

@end