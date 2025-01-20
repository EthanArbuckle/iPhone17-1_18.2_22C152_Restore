@interface AVMomentCaptureMovie
+ (AVMomentCaptureMovie)movieWithResolvedSettings:(id)a3 outputFileURL:(id)a4 movieMetadata:(id)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings;
- (NSArray)movieMetadata;
- (NSURL)debugMetadataSidecarFileURL;
- (NSURL)outputFileURL;
- (__CVBuffer)previewPixelBuffer;
- (id)_initWithResolvedSettings:(id)a3 outputFileURL:(id)a4 movieMetadata:(id)a5;
- (id)debugDescription;
- (id)description;
- (void)_setDebugMetadataSidecarFileURL:(id)a3;
- (void)_setDuration:(id *)a3;
- (void)_setPreviewPixelBuffer:(__CVBuffer *)a3;
- (void)dealloc;
@end

@implementation AVMomentCaptureMovie

+ (AVMomentCaptureMovie)movieWithResolvedSettings:(id)a3 outputFileURL:(id)a4 movieMetadata:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) _initWithResolvedSettings:a3 outputFileURL:a4 movieMetadata:a5];

  return (AVMomentCaptureMovie *)v5;
}

- (id)_initWithResolvedSettings:(id)a3 outputFileURL:(id)a4 movieMetadata:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)AVMomentCaptureMovie;
  v8 = [(AVMomentCaptureMovie *)&v21 init];
  if (v8)
  {
    v8->_resolvedSettings = (AVMomentCaptureMovieRecordingResolvedSettings *)a3;
    v8->_outputFileURL = (NSURL *)a4;
    v8->_movieMetadata = (NSArray *)a5;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = [a5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      uint64_t v12 = *MEMORY[0x1E4F47CD0];
      uint64_t v13 = *MEMORY[0x1E4F47CC0];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(a5);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v15, "key"), "isEqual:", v12))
          {
            v8->_overCaptureGroupIdentifier = (NSString *)(id)[v15 value];
          }
          else if (objc_msgSend((id)objc_msgSend(v15, "key"), "isEqual:", v13))
          {
            v8->_hasOverCapture = objc_msgSend((id)objc_msgSend(v15, "value"), "intValue") != 0;
          }
        }
        uint64_t v10 = [a5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
  }
  return v8;
}

- (void)dealloc
{
  previewPixelBuffer = self->_previewPixelBuffer;
  if (previewPixelBuffer) {
    CFRelease(previewPixelBuffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVMomentCaptureMovie;
  [(AVMomentCaptureMovie *)&v4 dealloc];
}

- (id)debugDescription
{
  v3 = NSString;
  int64_t v4 = [(AVMomentCaptureMovieRecordingResolvedSettings *)self->_resolvedSettings uniqueID];
  v5 = [(NSURL *)self->_outputFileURL lastPathComponent];
  v6 = [(NSURL *)self->_debugMetadataSidecarFileURL lastPathComponent];
  CMTime time = (CMTime)self->_duration;
  return (id)[v3 stringWithFormat:@"[%lld] url:%@ sidecar:%@ dur:%.3f preview:%p socgroup:%@ soc:%d", v4, v5, v6, CMTimeGetSeconds(&time), self->_previewPixelBuffer, self->_overCaptureGroupIdentifier, self->_hasOverCapture];
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVMomentCaptureMovie debugDescription](self, "debugDescription")];
}

- (void)_setDebugMetadataSidecarFileURL:(id)a3
{
  self->_debugMetadataSidecarFileURL = (NSURL *)a3;
}

- (void)_setPreviewPixelBuffer:(__CVBuffer *)a3
{
  previewPixelBuffer = self->_previewPixelBuffer;
  self->_previewPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (previewPixelBuffer)
  {
    CFRelease(previewPixelBuffer);
  }
}

- (void)_setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings
{
  return self->_resolvedSettings;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (NSURL)debugMetadataSidecarFileURL
{
  return self->_debugMetadataSidecarFileURL;
}

- (__CVBuffer)previewPixelBuffer
{
  return self->_previewPixelBuffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (NSArray)movieMetadata
{
  return self->_movieMetadata;
}

@end