@interface AVAssetWriterUnknownHelper
- (AVAssetWriterUnknownHelper)initWithConfigurationState:(id)a3;
- (AVAssetWriterUnknownHelper)initWithURL:(id)a3 fileType:(id)a4;
- (BOOL)_canAddInput:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_canAddInputGroup:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_isDefunct;
- (BOOL)canAddInput:(id)a3;
- (BOOL)canAddInputGroup:(id)a3;
- (int64_t)status;
- (void)addInput:(id)a3;
- (void)addInputGroup:(id)a3;
- (void)cancelWriting;
- (void)setDefaultPropertyValuesToConfigurationState:(id)a3 outputURL:(id)a4 fileType:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDirectoryForTemporaryFiles:(id)a3;
- (void)setInitialMovieFragmentInterval:(id *)a3;
- (void)setInitialMovieFragmentSequenceNumber:(int64_t)a3;
- (void)setInitialSegmentStartTime:(id *)a3;
- (void)setMetadata:(id)a3;
- (void)setMovieFragmentInterval:(id *)a3;
- (void)setMovieTimeScale:(int)a3;
- (void)setOutputFileTypeProfile:(id)a3;
- (void)setOverallDurationHint:(id *)a3;
- (void)setPreferredOutputSegmentInterval:(id *)a3;
- (void)setPreferredRate:(float)a3;
- (void)setPreferredTransform:(CGAffineTransform *)a3;
- (void)setPreferredVolume:(float)a3;
- (void)setProducesCombinableFragments:(BOOL)a3;
- (void)setRequiresInProcessOperation:(BOOL)a3;
- (void)setShouldOptimizeForNetworkUse:(BOOL)a3;
- (void)setSinglePassFileSize:(int64_t)a3;
- (void)setSinglePassMediaDataSize:(int64_t)a3;
- (void)setUsesVirtualCaptureCard:(BOOL)a3;
- (void)startWriting;
@end

@implementation AVAssetWriterUnknownHelper

- (AVAssetWriterUnknownHelper)initWithConfigurationState:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)AVAssetWriterUnknownHelper;
  v5 = -[AVAssetWriterHelper initWithConfigurationState:](&v20, sel_initWithConfigurationState_);
  if (![a3 mediaFileType])
  {
    v7 = v5;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "[configurationState mediaFileType] != nil";
    goto LABEL_10;
  }
  if (![a3 inputs])
  {
    v16 = v5;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "[configurationState inputs] != nil";
    goto LABEL_10;
  }
  if (![a3 inputGroups])
  {
    v17 = v5;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "[configurationState inputGroups] != nil";
    goto LABEL_10;
  }
  if (![a3 metadataItems])
  {
    v18 = v5;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "[configurationState metadataItems] != nil";
LABEL_10:
    v19 = (void *)[v13 exceptionWithName:v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)v15), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  return v5;
}

- (AVAssetWriterUnknownHelper)initWithURL:(id)a3 fileType:(id)a4
{
  v7 = objc_alloc_init(AVAssetWriterConfigurationState);
  [(AVAssetWriterUnknownHelper *)self setDefaultPropertyValuesToConfigurationState:v7 outputURL:a3 fileType:a4];
  return [(AVAssetWriterUnknownHelper *)self initWithConfigurationState:v7];
}

- (void)setDefaultPropertyValuesToConfigurationState:(id)a3 outputURL:(id)a4 fileType:(id)a5
{
  [a3 setURL:a4];
  [a3 setMediaFileType:a5];
  objc_msgSend(a3, "setInputs:", objc_msgSend(MEMORY[0x1E4F1C978], "array"));
  objc_msgSend(a3, "setInputGroups:", objc_msgSend(MEMORY[0x1E4F1C978], "array"));
  long long v12 = *MEMORY[0x1E4F1F9F8];
  long long v11 = v12;
  *(void *)&long long v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v7 = v13;
  [a3 setMovieFragmentInterval:&v12];
  long long v12 = v11;
  *(void *)&long long v13 = v7;
  [a3 setInitialMovieFragmentInterval:&v12];
  [a3 setShouldOptimizeForNetworkUse:0];
  objc_msgSend(a3, "setMetadataItems:", objc_msgSend(MEMORY[0x1E4F1C978], "array"));
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v12 = *MEMORY[0x1E4F1DAB8];
  long long v13 = v8;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [a3 setPreferredTransform:&v12];
  LODWORD(v9) = 1.0;
  [a3 setPreferredVolume:v9];
  LODWORD(v10) = 1.0;
  [a3 setPreferredRate:v10];
  [a3 setSinglePassFileSize:0];
  [a3 setSinglePassMediaDataSize:0];
  long long v12 = v11;
  *(void *)&long long v13 = v7;
  [a3 setPreferredOutputSegmentInterval:&v12];
  long long v12 = v11;
  *(void *)&long long v13 = v7;
  [a3 setInitialSegmentStartTime:&v12];
  [a3 setOutputFileTypeProfile:0];
  [a3 setInitialMovieFragmentSequenceNumber:1];
  [a3 setProducesCombinableFragments:0];
  [a3 setUsesVirtualCaptureCard:0];
  [a3 setRequiresInProcessOperation:0];
}

- (int64_t)status
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setDelegate:a3];
}

- (void)setMovieFragmentInterval:(id *)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(AVAssetWriterConfigurationState *)v4 setMovieFragmentInterval:&v5];
}

- (void)setInitialMovieFragmentInterval:(id *)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(AVAssetWriterConfigurationState *)v4 setInitialMovieFragmentInterval:&v5];
}

- (void)setOverallDurationHint:(id *)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(AVAssetWriterConfigurationState *)v4 setOverallDurationHint:&v5];
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setShouldOptimizeForNetworkUse:v3];
}

- (void)setDirectoryForTemporaryFiles:(id)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setDirectoryForTemporaryFiles:a3];
}

- (void)setMetadata:(id)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setMetadataItems:a3];
}

- (void)setMovieTimeScale:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setMovieTimeScale:v3];
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  long long v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  [(AVAssetWriterConfigurationState *)v4 setPreferredTransform:v6];
}

- (void)setPreferredVolume:(float)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  *(float *)&double v5 = a3;
  [(AVAssetWriterConfigurationState *)v4 setPreferredVolume:v5];
}

- (void)setPreferredRate:(float)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  *(float *)&double v5 = a3;
  [(AVAssetWriterConfigurationState *)v4 setPreferredRate:v5];
}

- (void)setPreferredOutputSegmentInterval:(id *)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(AVAssetWriterConfigurationState *)v4 setPreferredOutputSegmentInterval:&v5];
}

- (void)setInitialSegmentStartTime:(id *)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(AVAssetWriterConfigurationState *)v4 setInitialSegmentStartTime:&v5];
}

- (void)setOutputFileTypeProfile:(id)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setOutputFileTypeProfile:a3];
}

- (void)setInitialMovieFragmentSequenceNumber:(int64_t)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setInitialMovieFragmentSequenceNumber:a3];
}

- (void)setProducesCombinableFragments:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setProducesCombinableFragments:v3];
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(AVAssetWriterHelper *)self isVirtualCaptureCardSupported])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    double v9 = (objc_class *)objc_opt_class();
    v15 = (void *)[v7 exceptionWithName:v8, AVMethodExceptionReasonWithClassAndSelector(v9, a2, @"Cannot use the virtual capture card", v10, v11, v12, v13, v14, v16), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  v6 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v6 setUsesVirtualCaptureCard:v3];
}

- (void)setRequiresInProcessOperation:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setRequiresInProcessOperation:v3];
}

- (void)setSinglePassFileSize:(int64_t)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setSinglePassFileSize:a3];
}

- (void)setSinglePassMediaDataSize:(int64_t)a3
{
  v4 = [(AVAssetWriterHelper *)self configurationState];
  [(AVAssetWriterConfigurationState *)v4 setSinglePassMediaDataSize:a3];
}

- (BOOL)_canAddInput:(id)a3 exceptionReason:(id *)a4
{
  double v9 = 0;
  BOOL v7 = -[AVAssetWriterHelper _canApplyOutputSettings:forMediaType:sourceFormat:exceptionReason:](self, "_canApplyOutputSettings:forMediaType:sourceFormat:exceptionReason:", [a3 _outputSettingsObject], objc_msgSend(a3, "mediaType"), objc_msgSend(a3, "sourceFormatHint"), &v9);
  if (v7) {
    LOBYTE(v7) = -[AVAssetWriterHelper _canApplyTrackReferences:exceptionReason:](self, "_canApplyTrackReferences:exceptionReason:", [a3 _trackReferences], &v9);
  }
  if (a4) {
    *a4 = v9;
  }
  return v7;
}

- (BOOL)canAddInput:(id)a3
{
  return [(AVAssetWriterUnknownHelper *)self _canAddInput:a3 exceptionReason:0];
}

- (void)addInput:(id)a3
{
  uint64_t v18 = 0;
  if (![(AVAssetWriterUnknownHelper *)self _canAddInput:a3 exceptionReason:&v18])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v16 = objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithClassAndSelector(v10, a2, v18, v11, v12, v13, v14, v15, v17), 0);
    objc_exception_throw(v16);
  }
  v6 = [(AVAssetWriterHelper *)self configurationState];
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[AVAssetWriterConfigurationState inputs](v6, "inputs"));
  [v7 addObject:a3];
  [(AVAssetWriterConfigurationState *)v6 setInputs:v7];
  objc_msgSend(a3, "_setWeakReferenceToAssetWriter:", -[AVAssetWriterHelper weakReferenceToAssetWriter](self, "weakReferenceToAssetWriter"));
}

- (BOOL)_canAddInputGroup:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(AVMediaFileType *)[(AVAssetWriterHelper *)self mediaFileType] UTI];
  if (![(NSString *)v7 isEqualToString:@"com.apple.quicktime-movie"]
    && ![(NSString *)v7 isEqualToString:@"com.apple.m4a-audio"]
    && ![(NSString *)v7 isEqualToString:@"com.apple.m4v-video"]
    && ![(NSString *)v7 isEqualToString:@"public.3gpp"]
    && ![(NSString *)v7 isEqualToString:@"public.mpeg-4"])
  {
    uint64_t v11 = (void *)[NSString stringWithFormat:@"The output file type %@ does not support mutually exclusive relationships among tracks.", v7];
LABEL_23:
    BOOL v16 = 0;
    if (a4) {
      goto LABEL_18;
    }
    return v16;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "inputs"));
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "provisionalInputs"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(AVAssetWriterHelper *)self inputGroups];
  uint64_t v11 = (void *)[(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v11)
  {
    BOOL v16 = 1;
    goto LABEL_17;
  }
  uint64_t v12 = (uint64_t)v11;
  uint64_t v13 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(v15, "inputs")), "intersectsSet:", v8))
      {
        uint64_t v18 = NSString;
        v19 = @"At least one AVAssetWriterInput in the given inputGroup is also present in an inputGroup already added.";
LABEL_22:
        uint64_t v11 = objc_msgSend(v18, "stringWithFormat:", v19, v20);
        goto LABEL_23;
      }
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(v15, "provisionalInputs")), "intersectsSet:", v9))
      {
        uint64_t v18 = NSString;
        v19 = @"At least one provisional AVAssetWriterInput in the given inputGroup is also present as a provisional input in an inputGroup already added.";
        goto LABEL_22;
      }
    }
    uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    uint64_t v11 = 0;
    BOOL v16 = 1;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_17:
  if (a4) {
LABEL_18:
  }
    *a4 = v11;
  return v16;
}

- (BOOL)canAddInputGroup:(id)a3
{
  return [(AVAssetWriterUnknownHelper *)self _canAddInputGroup:a3 exceptionReason:0];
}

- (void)addInputGroup:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  if (![(AVAssetWriterUnknownHelper *)self _canAddInputGroup:a3 exceptionReason:&v37])
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    long long v22 = (objc_class *)objc_opt_class();
    v28 = objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, AVMethodExceptionReasonWithClassAndSelector(v22, a2, v37, v23, v24, v25, v26, v27, v29), 0);
    objc_exception_throw(v28);
  }
  ++self->_alternateGroupID;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v6 = (void *)[a3 inputs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "setMarksOutputTrackAsEnabled:", v11 == objc_msgSend(a3, "defaultInput"));
        [v11 _setAlternateGroupID:self->_alternateGroupID];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = objc_msgSend(a3, "provisionalInputs", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        [v17 setMarksOutputTrackAsEnabled:0];
        [v17 _setProvisionalAlternateGroupID:self->_alternateGroupID];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }
  uint64_t v18 = [(AVAssetWriterHelper *)self configurationState];
  v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[AVAssetWriterConfigurationState inputGroups](v18, "inputGroups"));
  [v19 addObject:a3];
  [(AVAssetWriterConfigurationState *)v18 setInputGroups:v19];
}

- (void)startWriting
{
  uint64_t v6 = 0;
  id v3 = [(AVWeakReference *)[(AVAssetWriterHelper *)self weakReferenceToAssetWriter] referencedObject];
  if ((![(AVAssetWriterHelper *)self directoryForTemporaryFiles]
     || AVCanWriteFilesToDirectoryAtURL([(AVAssetWriterHelper *)self directoryForTemporaryFiles], &v6))&& (v4 = [[AVAssetWriterWritingHelper alloc] initWithConfigurationState:[(AVAssetWriterHelper *)self configurationState] assetWriter:v3 error:&v6]) != 0)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
    [v3 _setHelper:v4 ifCurrentHelper:self];
  }
  else
  {
    [(AVAssetWriterHelper *)self transitionToFailedStatusWithError:v6];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = 0;
  }
}

- (void)cancelWriting
{
}

- (BOOL)_isDefunct
{
  return 0;
}

@end