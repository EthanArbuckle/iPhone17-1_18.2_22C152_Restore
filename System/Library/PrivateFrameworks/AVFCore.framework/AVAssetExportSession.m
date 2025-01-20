@interface AVAssetExportSession
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDurationForPreset:(SEL)a3 properties:(id)a4;
+ (AVAssetExportSession)exportSessionWithAsset:(AVAsset *)asset presetName:(NSString *)presetName;
+ (NSArray)allExportPresets;
+ (NSArray)exportPresetsCompatibleWithAsset:(AVAsset *)asset;
+ (id)keyPathsForValuesAffectingEstimatedOutputFileLength;
+ (int64_t)estimatedOutputFileLengthForPreset:(id)a3 duration:(id *)a4 properties:(id)a5;
+ (void)determineCompatibilityOfExportPreset:(NSString *)presetName withAsset:(AVAsset *)asset outputFileType:(AVFileType)outputFileType completionHandler:(void *)handler;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minVideoFrameDuration;
- (AVAsset)asset;
- (AVAssetExportSession)init;
- (AVAssetExportSession)initWithAsset:(AVAsset *)asset presetName:(NSString *)presetName;
- (AVAssetExportSessionStatus)status;
- (AVAssetTrackGroupOutputHandling)audioTrackGroupHandling;
- (AVAudioMix)audioMix;
- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (AVFileType)outputFileType;
- (AVMetadataItemFilter)metadataItemFilter;
- (AVVideoComposition)videoComposition;
- (BOOL)allowsAppleOnlySWAV1Decode;
- (BOOL)allowsParallelizedExport;
- (BOOL)canPerformMultiplePassesOverSourceMediaData;
- (BOOL)isDefunct;
- (BOOL)maximizePowerEfficiency;
- (BOOL)preserveSyncFrames;
- (BOOL)shouldOptimizeForNetworkUse;
- (CMTime)maxDuration;
- (CMTimeRange)timeRange;
- (NSArray)metadata;
- (NSArray)supportedFileTypes;
- (NSError)error;
- (NSString)presetName;
- (NSURL)directoryForTemporaryFiles;
- (NSURL)outputURL;
- (float)progress;
- (id)customVideoCompositor;
- (id)description;
- (id)videoFrameRateConversionAlgorithm;
- (uint64_t)estimatedOutputFileLength;
- (uint64_t)fileLengthLimit;
- (void)AVExportSessionExportAsynchronouslyCompletionHandler;
- (void)cancelExport;
- (void)dealloc;
- (void)determineCompatibleFileTypesWithCompletionHandler:(void *)handler;
- (void)estimateMaximumDurationWithCompletionHandler:(void *)handler;
- (void)estimateOutputFileLengthWithCompletionHandler:(void *)handler;
- (void)exportAsynchronouslyWithCompletionHandler:(void *)handler;
- (void)setAllowsAppleOnlySWAV1Decode:(BOOL)a3;
- (void)setAllowsParallelizedExport:(BOOL)allowsParallelizedExport;
- (void)setAudioMix:(AVAudioMix *)audioMix;
- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (void)setAudioTrackGroupHandling:(AVAssetTrackGroupOutputHandling)audioTrackGroupHandling;
- (void)setCanPerformMultiplePassesOverSourceMediaData:(BOOL)canPerformMultiplePassesOverSourceMediaData;
- (void)setDirectoryForTemporaryFiles:(NSURL *)directoryForTemporaryFiles;
- (void)setFileLengthLimit:(uint64_t)fileLengthLimit;
- (void)setMaximizePowerEfficiency:(BOOL)a3;
- (void)setMetadata:(NSArray *)metadata;
- (void)setMetadataItemFilter:(AVMetadataItemFilter *)metadataItemFilter;
- (void)setMinVideoFrameDuration:(id *)a3;
- (void)setOutputFileType:(AVFileType)outputFileType;
- (void)setOutputURL:(NSURL *)outputURL;
- (void)setPreserveSyncFrames:(BOOL)a3;
- (void)setShouldOptimizeForNetworkUse:(BOOL)shouldOptimizeForNetworkUse;
- (void)setTimeRange:(CMTimeRange *)timeRange;
- (void)setVideoComposition:(AVVideoComposition *)videoComposition;
- (void)setVideoFrameRateConversionAlgorithm:(id)a3;
@end

@implementation AVAssetExportSession

+ (NSArray)allExportPresets
{
  return (NSArray *)MEMORY[0x1F40ED218](a1, a2);
}

+ (NSArray)exportPresetsCompatibleWithAsset:(AVAsset *)asset
{
  if ([(AVAsset *)asset _figAsset])
  {
    return (NSArray *)MEMORY[0x1F40ED210]();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v3 array];
  }
}

+ (void)determineCompatibilityOfExportPreset:(NSString *)presetName withAsset:(AVAsset *)asset outputFileType:(AVFileType)outputFileType completionHandler:(void *)handler
{
  if (!handler)
  {
    v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"handler cannot be nil", (uint64_t)asset, (uint64_t)outputFileType, 0, v6, v7, v17), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  v11 = [(AVAsset *)asset _figAsset];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = [handler copy];
    objc_opt_class();
    uint64_t v14 = objc_opt_isKindOfClass() & 1;
    MEMORY[0x1F40ED1E8](presetName, v12, v14, outputFileType, AVExportSessionDetermineCompatibilityOfExportPresetCompletionHandler, v13);
  }
  else
  {
    v15 = (void (*)(void *, void))*((void *)handler + 2);
    v15(handler, 0);
  }
}

+ (AVAssetExportSession)exportSessionWithAsset:(AVAsset *)asset presetName:(NSString *)presetName
{
  v4 = (void *)[objc_alloc((Class)a1) initWithAsset:asset presetName:presetName];
  return (AVAssetExportSession *)v4;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDurationForPreset:(SEL)a3 properties:(id)a4
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1F40ED228](a4, a5);
}

- (void)estimateMaximumDurationWithCompletionHandler:(void *)handler
{
  if (!handler)
  {
    v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"completionHandler is nil", v3, v4, v5, v6, v7, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  figExportSession = self->_exportSession->figExportSession;
  uint64_t v9 = [handler copy];
  MEMORY[0x1F40ED1F8](figExportSession, AVExportSessionEstimateMaximumDurationCompletionHandler, v9);
}

+ (int64_t)estimatedOutputFileLengthForPreset:(id)a3 duration:(id *)a4 properties:(id)a5
{
  if (FigAssetExportSessionGetEstimatedOutputFileLength()) {
    return 0;
  }
  else {
    return 0;
  }
}

- (void)estimateOutputFileLengthWithCompletionHandler:(void *)handler
{
  if (!handler)
  {
    v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"handler cannot be nil", v3, v4, v5, v6, v7, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  figExportSession = self->_exportSession->figExportSession;
  uint64_t v9 = [handler copy];
  MEMORY[0x1F40ED200](figExportSession, AVExportSessionEstimateOutputFileLengthCompletionHandler, v9);
}

- (AVAssetExportSession)init
{
  return [(AVAssetExportSession *)self initWithAsset:0 presetName:0];
}

- (AVAssetExportSession)initWithAsset:(AVAsset *)asset presetName:(NSString *)presetName
{
  v9.receiver = self;
  v9.super_class = (Class)AVAssetExportSession;
  uint64_t v6 = [(AVAssetExportSession *)&v9 init];
  if (v6)
  {
    if (asset
      && presetName
      && ([(NSString *)presetName isEqualToString:@"AVAssetExportPresetPassthrough"]
       || FigExportSettingsForExportPreset())
      && (uint64_t v7 = objc_alloc_init(AVAssetExportSessionInternal), (v6->_exportSession = v7) != 0)
      && (v7->videoComposition = 0, [(AVAsset *)asset _figAsset])
      && (objc_opt_class(),
          objc_opt_isKindOfClass(),
          [(AVAsset *)asset _hasResourceLoaderDelegate],
          !FigAssetExportSessionCreateWithAsset()))
    {
      v6->_exportSession->asset = asset;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  exportSession = self->_exportSession;
  if (exportSession)
  {
    figExportSession = exportSession->figExportSession;
    if (figExportSession)
    {
      CFRelease(figExportSession);
      exportSession = self->_exportSession;
    }

    uint64_t v5 = self->_exportSession;
    figVideoCompositor = v5->figVideoCompositor;
    if (figVideoCompositor)
    {
      CFRelease(figVideoCompositor);
      uint64_t v5 = self->_exportSession;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)AVAssetExportSession;
  [(AVAssetExportSession *)&v7 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, asset = %@, presetName = %@, outputFileType = %@", NSStringFromClass(v4), self, self->_exportSession->asset, -[AVAssetExportSession presetName](self, "presetName"), -[AVAssetExportSession outputFileType](self, "outputFileType")];
}

- (AVAsset)asset
{
  return self->_exportSession->asset;
}

- (NSString)presetName
{
  return (NSString *)0;
}

- (NSArray)supportedFileTypes
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (void)determineCompatibleFileTypesWithCompletionHandler:(void *)handler
{
  if (!handler)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"handler cannot be nil", v3, v4, v5, v6, v7, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  uint64_t v9 = [handler copy];
  figExportSession = self->_exportSession->figExportSession;
  MEMORY[0x1F40ED1F0](figExportSession, AVExportSessionDetermineCompatibilityOfFileTypesCompletionHandler, v9);
}

- (AVFileType)outputFileType
{
  return (AVFileType)0;
}

- (void)setOutputFileType:(AVFileType)outputFileType
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = @"Cannot alter output file type attribute on an AVAssetExportSession after an export has started.";
    goto LABEL_8;
  }
  if (!outputFileType)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = @"Cannot set outputFileType to nil";
    goto LABEL_8;
  }
  if (FigAssetExportSessionSetProperty() == -16972)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = @"Invalid output file type";
LABEL_8:
    uint64_t v14 = objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
}

- (NSURL)outputURL
{
  return (NSURL *)0;
}

- (void)setOutputURL:(NSURL *)outputURL
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = @"Cannot alter output URL attribute on an AVAssetExportSession after an export has started.";
    goto LABEL_8;
  }
  if (!outputURL)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = @"Cannot set outputURL to nil";
LABEL_8:
    uint64_t v14 = objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  FigAssetExportSessionSetProperty();
}

- (AVAssetExportSessionStatus)status
{
  return 0;
}

- (NSError)error
{
  return 0;
}

- (float)progress
{
  return 0.0;
}

- (void)AVExportSessionExportAsynchronouslyCompletionHandler
{
  exportSession = self->_exportSession;
  handler = (void (**)(void, void))exportSession->handler;
  if (handler)
  {
    exportSession->handler = 0;
    ((void (**)(void, SEL))handler)[2](handler, a2);
  }
}

- (void)exportAsynchronouslyWithCompletionHandler:(void *)handler
{
  if ([(AVAssetExportSession *)self status] >= AVAssetExportSessionStatusWaiting)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    v19 = @"Cannot call exportAsynchronouslyWithCompletionHandler: more than once.";
    goto LABEL_18;
  }
  if (![(AVAssetExportSession *)self outputURL])
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    v19 = @"outputURL cannot be nil";
    goto LABEL_18;
  }
  CFTypeRef cf = 0;
  uint64_t v22 = 0;
  uint64_t v11 = self;
  FigAssetExportSessionCopyProperty();
  customVideoCompositorSession = self->_exportSession->customVideoCompositorSession;
  if (customVideoCompositorSession)
  {
    BOOL v13 = [(AVCustomVideoCompositorSession *)customVideoCompositorSession commitCustomVideoCompositorPropertiesAndReturnError:&v22];
    uint64_t v14 = v22;
    if (!v13) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (!v14)
  {
    if (handler)
    {
      uint64_t v15 = self;
      self->_exportSession->handler = (id)[handler copy];
    }
    int v16 = FigAssetExportSessionExportAsynchronously();
    if (v16 == -16972)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v18 = *MEMORY[0x1E4F1C3B8];
      v19 = @"Invalid output file type";
    }
    else
    {
      if (v16 != -16974) {
        goto LABEL_13;
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v18 = *MEMORY[0x1E4F1C3B8];
      v19 = @"outputFileType cannot be nil";
    }
LABEL_18:
    v20 = objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v19, v6, v7, v8, v9, v10, (uint64_t)cf), 0);
    objc_exception_throw(v20);
  }
LABEL_9:
  FigAssetExportSessionSetProperty();
  if (handler) {
    (*((void (**)(void *))handler + 2))(handler);
  }
LABEL_13:
}

- (void)cancelExport
{
}

- (CMTimeRange)timeRange
{
  uint64_t v4 = MEMORY[0x1E4F1FA30];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  *(_OWORD *)&retstr->start.value = *MEMORY[0x1E4F1FA30];
  *(_OWORD *)&retstr->start.epoch = v5;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)(v4 + 32);
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter time range attribute on an AVAssetExportSession after an export has started.", v6, v7, v8, v9, v10, v15.start.value), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v12 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&v15.start.value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&v15.start.epoch = v12;
  *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
  CFDictionaryRef v13 = CMTimeRangeCopyAsDictionary(&v15, v11);
  FigAssetExportSessionSetProperty();
  if (v13) {
    CFRelease(v13);
  }
}

- (CMTime)maxDuration
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (void)setMinVideoFrameDuration:(id *)a3
{
  if ([(AVAssetExportSession *)self status])
  {
    CFDictionaryRef v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    CMTimeRange v15 = @"Cannot alter min frame duration attribute on an AVAssetExportSession after an export has started.";
    goto LABEL_10;
  }
  if ((a3->var2 & 0x1D) != 1)
  {
    CFDictionaryRef v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    CMTimeRange v15 = @"Cannot set non-numeric min video frame duration.";
    goto LABEL_10;
  }
  CMTime time1 = (CMTime)*a3;
  CMTime v17 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &v17) <= 0)
  {
    CFDictionaryRef v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    CMTimeRange v15 = @"Min video frame duration must be greater than zero.";
LABEL_10:
    int v16 = objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v15, v6, v7, v8, v9, v10, v17.value), 0);
    objc_exception_throw(v16);
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime time1 = (CMTime)*a3;
  CFDictionaryRef v12 = CMTimeCopyAsDictionary(&time1, v11);
  FigAssetExportSessionSetProperty();
  if (v12) {
    CFRelease(v12);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minVideoFrameDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (void)setVideoFrameRateConversionAlgorithm:(id)a3
{
  if ([(AVAssetExportSession *)self status])
  {
    CFAllocatorRef v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    CFDictionaryRef v13 = @"Cannot alter max frame duration attribute on an AVAssetExportSession after an export has started.";
    goto LABEL_11;
  }
  if (([a3 isEqualToString:@"AVVideoFrameRateConversionAlgorithmFast"] & 1) == 0
    && ([a3 isEqualToString:@"AVVideoFrameRateConversionAlgorithmPrecise"] & 1) == 0)
  {
    CFAllocatorRef v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    CFDictionaryRef v13 = @"Invalid frame rate conversion algorithm.";
LABEL_11:
    uint64_t v14 = objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  if (![a3 isEqualToString:@"AVVideoFrameRateConversionAlgorithmFast"]) {
    [a3 isEqualToString:@"AVVideoFrameRateConversionAlgorithmPrecise"];
  }
  FigAssetExportSessionSetProperty();
}

- (id)videoFrameRateConversionAlgorithm
{
  return 0;
}

- (void)setPreserveSyncFrames:(BOOL)a3
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter preserve sync frame attribute on an AVAssetExportSession after an export has started.", v5, v6, v7, v8, v9, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)preserveSyncFrames
{
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E4F1CFD0] == v3;
}

+ (id)keyPathsForValuesAffectingEstimatedOutputFileLength
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"timeRange", 0);
}

- (uint64_t)estimatedOutputFileLength
{
  return 0;
}

- (NSArray)metadata
{
  return self->_exportSession->metadata;
}

- (void)setMetadata:(NSArray *)metadata
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter metadata attribute on an AVAssetExportSession after an export has started.", v6, v7, v8, v9, v10, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if (metadata)
  {
    id v14 = 0;
    metadata = +[AVMetadataItem _metadataArrayWithSmartDeferredLoadingForMetataArray:metadata error:&v14];
    if (!metadata && [v14 code] == -11999) {
      objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v14, "userInfo"), "objectForKey:", @"AVErrorExceptionKey"));
    }
  }
  +[AVMetadataItem _figMetadataPropertyFromMetadataItems:metadata];
  if (!FigAssetExportSessionSetProperty())
  {
    uint64_t v11 = self->_exportSession->metadata;
    if (v11 != metadata)
    {

      self->_exportSession->metadata = (NSArray *)[(NSArray *)metadata copy];
    }
  }
}

- (AVMetadataItemFilter)metadataItemFilter
{
  return self->_exportSession->metadataItemFilter;
}

- (void)setMetadataItemFilter:(AVMetadataItemFilter *)metadataItemFilter
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter metadataItemFilter attribute on an AVAssetExportSession after an export has started.", v6, v7, v8, v9, v10, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  [(AVMetadataItemFilter *)metadataItemFilter whitelist];
  if (!FigAssetExportSessionSetProperty())
  {
    uint64_t v11 = self->_exportSession->metadataItemFilter;
    if (v11 != metadataItemFilter)
    {

      self->_exportSession->metadataItemFilter = metadataItemFilter;
    }
  }
}

- (uint64_t)fileLengthLimit
{
  return 0;
}

- (void)setFileLengthLimit:(uint64_t)fileLengthLimit
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter output file length limit attribute on an AVAssetExportSession after an export has started.", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  [MEMORY[0x1E4F28ED0] numberWithLongLong:fileLengthLimit];
  FigAssetExportSessionSetProperty();
}

- (BOOL)maximizePowerEfficiency
{
  CFTypeRef cf = (CFTypeRef)*MEMORY[0x1E4F1CFC8];
  FigAssetExportSessionCopyProperty();
  CFTypeRef v2 = (CFTypeRef)*MEMORY[0x1E4F1CFD0];
  if (cf) {
    CFRelease(cf);
  }
  return v2 == cf;
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  FigAssetExportSessionCopyProperty();
  if (FigCFEqual())
  {
    CFTypeRef v2 = (AVAudioTimePitchAlgorithm *)&AVAudioTimePitchAlgorithmSpectral;
    return *v2;
  }
  if (FigCFEqual())
  {
    CFTypeRef v2 = (AVAudioTimePitchAlgorithm *)&AVAudioTimePitchAlgorithmTimeDomain;
    return *v2;
  }
  if (FigCFEqual())
  {
    CFTypeRef v2 = (AVAudioTimePitchAlgorithm *)&AVAudioTimePitchAlgorithmVarispeed;
    return *v2;
  }
  if (FigCFEqual()) {
    return (AVAudioTimePitchAlgorithm)@"LowQualityZeroLatency";
  }
  else {
    return 0;
  }
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    uint64_t v14 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter audio time pitch algorithm attribute on an AVAssetExportSession after an export has started.", v6, v7, v8, v9, v10, v25);
    uint64_t v15 = v12;
    uint64_t v16 = v13;
    goto LABEL_8;
  }
  valid = (void *)AVGetValidAudioTimePitchAlgorithms();
  if (([valid containsObject:audioTimePitchAlgorithm] & 1) == 0)
  {
    CMTime v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    uint64_t v19 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", @", ");
    uint64_t v14 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"audioTimePitchAlgorithm must be one of: %@", v20, v21, v22, v23, v24, v19);
    uint64_t v15 = v17;
    uint64_t v16 = v18;
LABEL_8:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v14 userInfo:0]);
  }
  AVAssetExportSessionGetFigRemakerAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(audioTimePitchAlgorithm);
  FigAssetExportSessionSetProperty();
}

- (AVAudioMix)audioMix
{
  return self->_exportSession->audioMix;
}

- (void)setAudioMix:(AVAudioMix *)audioMix
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(AVAssetExportSession *)self status])
  {
    v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3B8];
    v28 = @"Cannot alter audio mix attribute on an AVAssetExportSession after an export has started.";
    v29 = (objc_class *)self;
    v30 = a2;
LABEL_18:
    v31 = objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, AVMethodExceptionReasonWithObjectAndSelector(v29, v30, (uint64_t)v28, v6, v7, v8, v9, v10, v32), 0);
    objc_exception_throw(v31);
  }
  if (self->_exportSession->audioMix != audioMix)
  {
    uint64_t v11 = [(AVAudioMix *)audioMix inputParameters];
    CFIndex v12 = [(NSArray *)v11 count];
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v14 = (const CFDictionaryValueCallBacks *)FigAssetExportSessionProperty_GetAudioMix_CFDictionaryValueCallBacks();
    theDict = CFDictionaryCreateMutable(v13, v12, 0, v14);
    if (theDict)
    {
      SEL v33 = a2;
      v34 = audioMix;
      v35 = self;
      valid = (void *)AVGetValidAudioTimePitchAlgorithms();
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v16 = v11;
      uint64_t v17 = [(NSArray *)v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (!v17) {
        goto LABEL_15;
      }
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      while (1)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v22 = (void *)[v21 audioTimePitchAlgorithm];
          if (v22 && ([valid containsObject:v22] & 1) == 0)
          {
            v26 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v27 = *MEMORY[0x1E4F1C3C8];
            uint64_t v32 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", @", ");
            v28 = @"audioTimePitchAlgorithm must be one of: %@";
            v29 = (objc_class *)v35;
            v30 = v33;
            goto LABEL_18;
          }
          uint64_t v23 = CFAllocatorAllocate(v13, 32, 0);
          if (v23)
          {
            uint64_t v24 = v23;
            int v25 = [v21 trackID];
            *(_DWORD *)uint64_t v24 = 0;
            v24[2] = [v21 audioTapProcessor];
            v24[1] = AVAssetExportSessionGetFigRemakerAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(v22);
            v24[3] = [v21 _audioVolumeCurve];
            CFDictionaryAddValue(theDict, (const void *)v25, v24);
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (!v18)
        {
LABEL_15:
          FigAssetExportSessionSetProperty();
          CFRelease(theDict);

          v35->_exportSession->audioMix = (AVAudioMix *)[(AVAudioMix *)v34 copy];
          return;
        }
      }
    }
  }
}

- (AVAssetTrackGroupOutputHandling)audioTrackGroupHandling
{
  if (FigAssetExportSessionCopyProperty()) {
    return 0;
  }
  else {
    return [0 unsignedIntegerValue];
  }
}

- (void)setAudioTrackGroupHandling:(AVAssetTrackGroupOutputHandling)audioTrackGroupHandling
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter output audioTrackGroupHandling attribute on an AVAssetExportSession after an export has started.", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:audioTrackGroupHandling];
  FigAssetExportSessionSetProperty();
  self->_exportSession->audioTrackGroupHandling = audioTrackGroupHandling;
}

- (AVVideoComposition)videoComposition
{
  return self->_exportSession->videoComposition;
}

- (void)setVideoComposition:(AVVideoComposition *)videoComposition
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3B8];
    uint64_t v23 = @"Cannot alter video composition attribute on an AVAssetExportSession after an export has started.";
    goto LABEL_19;
  }
  if (self->_exportSession->videoComposition == videoComposition) {
    return;
  }
  if (videoComposition)
  {
    *(void *)&long long v28 = 0;
    if (![(AVVideoComposition *)videoComposition _isValidReturningExceptionReason:&v28])
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      uint64_t v24 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@", v11, v12, v13, v14, v15, v28);
      goto LABEL_20;
    }
    if ([(AVVideoComposition *)videoComposition instructions])
    {
      [(AVVideoComposition *)videoComposition renderScale];
      if (v16 == 1.0) {
        goto LABEL_7;
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      uint64_t v23 = @"renderScale must be 1.0 when used with AVAssetExportSession.";
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      uint64_t v23 = @"video composition must have composition instructions";
    }
LABEL_19:
    uint64_t v24 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v23, v6, v7, v8, v9, v10, v25);
LABEL_20:
    objc_exception_throw((id)[v21 exceptionWithName:v22 reason:v24 userInfo:0]);
  }
LABEL_7:
  id v17 = (id)[(AVVideoComposition *)videoComposition copy];
  v48 = 0;
  CFTypeRef v49 = 0;
  [v17 _copyFigVideoCompositor:&v49 andSession:&v48 recyclingSession:self->_exportSession->customVideoCompositorSession forFigRemaker:1 error:0];
  long long v31 = 0u;
  long long v32 = 0u;
  if (v17)
  {
    [v17 frameDuration];
  }
  else
  {
    *(_OWORD *)CFTypeRef cf = 0uLL;
    uint64_t v27 = 0;
  }
  long long v28 = *(_OWORD *)cf;
  uint64_t v29 = v27;
  uint64_t v30 = [v17 _serializableInstructions];
  LOBYTE(v31) = [v17 _hasLayerAsAuxiliaryTrack];
  *((void *)&v31 + 1) = [v17 _auxiliaryTrackLayer];
  *(void *)&long long v32 = v49;
  BYTE8(v32) = [v17 _hasPostProcessingLayers];
  uint64_t v33 = [v17 _postProcessingRootLayer];
  uint64_t v34 = [v17 _postProcessingVideoLayers];
  [v17 renderSize];
  uint64_t v35 = v18;
  uint64_t v36 = v19;
  uint64_t v37 = [v17 colorPrimaries];
  uint64_t v38 = [v17 colorYCbCrMatrix];
  uint64_t v39 = [v17 colorTransferFunction];
  int v40 = [v17 _auxiliaryTrackID];
  int v41 = [v17 sourceTrackIDForFrameTiming];
  uint64_t v42 = avAssetExportSession_IsVideoCompositionValidForAssetWithTimeRange;
  v43 = avAssetExportSession_VideoCompositionOutputColorPropertiesWithCustomCompositor;
  v44 = avAssetExportSession_CustomVideoCompositorSessionGetAndClearClientError;
  uint64_t v45 = [v17 sourceSampleDataTrackIDs];
  v46 = AVVideoCompositionSerializeSourceTrackWindows((void *)[v17 sourceVideoTrackWindowsForTrackIDs]);
  v47 = AVVideoCompositionSerializeSourceTrackWindows((void *)[v17 sourceSampleDataTrackWindowsForTrackIDs]);
  FigAssetExportSessionVideoCompositionCreate();
  if (v49) {
    CFRelease(v49);
  }
  if (!FigAssetExportSessionSetProperty())
  {

    self->_exportSession->videoComposition = (AVVideoComposition *)v17;
    uint64_t v20 = self->_exportSession->customVideoCompositorSession;
    self->_exportSession->customVideoCompositorSession = v48;
  }
}

- (id)customVideoCompositor
{
  return [(AVCustomVideoCompositorSession *)self->_exportSession->customVideoCompositorSession customVideoCompositor];
}

- (BOOL)shouldOptimizeForNetworkUse
{
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E4F1CFD0] == v3;
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)shouldOptimizeForNetworkUse
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter optimize for network use attribute on an AVAssetExportSession after an export has started.", v5, v6, v7, v8, v9, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)allowsParallelizedExport
{
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E4F1CFD0] == v3;
}

- (void)setAllowsParallelizedExport:(BOOL)allowsParallelizedExport
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter export parallelization attribute on an AVAssetExportSession after an export has started.", v5, v6, v7, v8, v9, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)allowsAppleOnlySWAV1Decode
{
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E4F1CFD0] == v3;
}

- (void)setAllowsAppleOnlySWAV1Decode:(BOOL)a3
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter decodeSWAV1 attribute on an AVAssetExportSession after an export has started.", v5, v6, v7, v8, v9, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)canPerformMultiplePassesOverSourceMediaData
{
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E4F1CFD0] == v3;
}

- (void)setCanPerformMultiplePassesOverSourceMediaData:(BOOL)canPerformMultiplePassesOverSourceMediaData
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter canPerformMultiplePassesOverSourceMediaData attribute on an AVAssetExportSession after an export has started.", v5, v6, v7, v8, v9, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (NSURL)directoryForTemporaryFiles
{
  return (NSURL *)0;
}

- (void)setDirectoryForTemporaryFiles:(NSURL *)directoryForTemporaryFiles
{
  if ([(AVAssetExportSession *)self status])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot alter directoryForTemporaryFiles attribute on an AVAssetExportSession after an export has started.", v5, v6, v7, v8, v9, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)isDefunct
{
  unsigned __int8 v9 = 0;
  figExportSession = self->_exportSession->figExportSession;
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = (unsigned int (*)(OpaqueFigAssetExportSession *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(figExportSession, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

@end