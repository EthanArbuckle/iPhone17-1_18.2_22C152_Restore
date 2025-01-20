@interface AVAssetReaderOutputMetadataAdaptor
+ (AVAssetReaderOutputMetadataAdaptor)assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput;
- (AVAssetReaderOutputMetadataAdaptor)init;
- (AVAssetReaderOutputMetadataAdaptor)initWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput;
- (AVAssetReaderTrackOutput)assetReaderTrackOutput;
- (AVTimedMetadataGroup)nextTimedMetadataGroup;
- (int)addExtractionForOutput:(id)a3 figAssetReader:(OpaqueFigAssetReader *)a4 options:(id)a5 withOutputExtactionID:(int *)a6;
- (void)dealloc;
@end

@implementation AVAssetReaderOutputMetadataAdaptor

+ (AVAssetReaderOutputMetadataAdaptor)assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAssetReaderTrackOutput:trackOutput];
  return (AVAssetReaderOutputMetadataAdaptor *)v3;
}

- (AVAssetReaderOutputMetadataAdaptor)init
{
  return [(AVAssetReaderOutputMetadataAdaptor *)self initWithAssetReaderTrackOutput:0];
}

- (AVAssetReaderOutputMetadataAdaptor)initWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput
{
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (!trackOutput)
  {
    v12 = self;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = "trackOutput != nil";
LABEL_12:
    uint64_t v22 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v13, v14, v15, v16, v17, (uint64_t)v20);
    v23 = v18;
    uint64_t v24 = v19;
    goto LABEL_16;
  }
  uint64_t v8 = (uint64_t)v7;
  if ((objc_msgSend(-[AVAssetReaderTrackOutput mediaType](trackOutput, "mediaType"), "isEqualToString:", @"meta") & 1) == 0)
  {
    v21 = self;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = "[[trackOutput mediaType] isEqualToString:AVMediaTypeMetadata]";
    goto LABEL_12;
  }
  if ([(AVAssetReaderTrackOutput *)trackOutput _isAttachedToAdaptor])
  {
    v25 = self;
    v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    uint64_t v33 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot initialize an instance of %@ with a track output which was used to initialize another instance of %@", v28, v29, v30, v31, v32, v8);
LABEL_15:
    uint64_t v22 = v33;
    v23 = v26;
    uint64_t v24 = v27;
LABEL_16:
    objc_exception_throw((id)[v23 exceptionWithName:v24 reason:v22 userInfo:0]);
  }
  if ([(AVAssetReaderOutput *)trackOutput _status] >= 1)
  {
    v34 = self;
    v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    uint64_t v33 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot initialize an instance of %@ with a track output which has already progressed beyond AVAssetReaderStatusUnknown", v35, v36, v37, v38, v39, v8);
    goto LABEL_15;
  }
  v40.receiver = self;
  v40.super_class = (Class)AVAssetReaderOutputMetadataAdaptor;
  v9 = [(AVAssetReaderOutputMetadataAdaptor *)&v40 init];
  if (v9)
  {
    v10 = objc_alloc_init(AVAssetReaderOutputMetadataAdaptorInternal);
    v9->_internal = v10;
    if (v10)
    {
      CFRetain(v10);
      v9->_internal->trackOutput = trackOutput;
      [(AVAssetReaderTrackOutput *)trackOutput _setAttachedAdaptor:v9];
    }
    else
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

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetReaderOutputMetadataAdaptor;
  [(AVAssetReaderOutputMetadataAdaptor *)&v4 dealloc];
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
  v12 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, id, int *))(v11 + 24);
  if (!v12) {
    return -12782;
  }
  return v12(a4, v9, a5, a6);
}

- (AVAssetReaderTrackOutput)assetReaderTrackOutput
{
  return self->_internal->trackOutput;
}

- (AVTimedMetadataGroup)nextTimedMetadataGroup
{
  int64_t v4 = [(AVAssetReaderOutput *)self->_internal->trackOutput _status];
  if (v4 == 1)
  {
    uint64_t v11 = 0;
    do
    {
      if (v11) {
        CFRelease(v11);
      }
      uint64_t v11 = [(AVAssetReaderTrackOutput *)self->_internal->trackOutput _copyNextSampleBufferForAdaptor];
      v12 = [[AVTimedMetadataGroup alloc] initWithSampleBuffer:v11];
      if (v12) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v11 == 0;
      }
    }
    while (!v13);
    uint64_t v10 = v12;
    if (v11) {
      CFRelease(v11);
    }
  }
  else
  {
    if (!v4)
    {
      uint64_t v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot call method until the track output is attached to an asset reader and -startReading has been called on that asset reader", v5, v6, v7, v8, v9, v16), 0 reason userInfo];
      objc_exception_throw(v15);
    }
    return 0;
  }
  return v10;
}

@end