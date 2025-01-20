@interface AVAssetWriterConfigurationState
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialMovieFragmentInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialSegmentStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredOutputSegmentInterval;
- (AVAssetWriterDelegate)delegate;
- (AVMediaFileType)mediaFileType;
- (BOOL)producesCombinableFragments;
- (BOOL)requiresInProcessOperation;
- (BOOL)shouldOptimizeForNetworkUse;
- (BOOL)usesVirtualCaptureCard;
- (CGAffineTransform)preferredTransform;
- (NSArray)inputGroups;
- (NSArray)inputs;
- (NSArray)metadataItems;
- (NSString)outputFileTypeProfile;
- (NSURL)URL;
- (NSURL)directoryForTemporaryFiles;
- (float)preferredRate;
- (float)preferredVolume;
- (int)movieTimeScale;
- (int64_t)initialMovieFragmentSequenceNumber;
- (int64_t)singlePassFileSize;
- (int64_t)singlePassMediaDataSize;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDirectoryForTemporaryFiles:(id)a3;
- (void)setInitialMovieFragmentInterval:(id *)a3;
- (void)setInitialMovieFragmentSequenceNumber:(int64_t)a3;
- (void)setInitialSegmentStartTime:(id *)a3;
- (void)setInputGroups:(id)a3;
- (void)setInputs:(id)a3;
- (void)setMediaFileType:(id)a3;
- (void)setMetadataItems:(id)a3;
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
- (void)setURL:(id)a3;
- (void)setUsesVirtualCaptureCard:(BOOL)a3;
@end

@implementation AVAssetWriterConfigurationState

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterConfigurationState;
  [(AVAssetWriterConfigurationState *)&v3 dealloc];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (AVAssetWriterDelegate)delegate
{
  return (AVAssetWriterDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AVMediaFileType)mediaFileType
{
  return self->_mediaFileType;
}

- (void)setMediaFileType:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_movieFragmentInterval.epoch = a3->var3;
  *(_OWORD *)&self->_movieFragmentInterval.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialMovieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setInitialMovieFragmentInterval:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_initialMovieFragmentInterval.epoch = a3->var3;
  *(_OWORD *)&self->_initialMovieFragmentInterval.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setOverallDurationHint:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_overallDurationHint.epoch = a3->var3;
  *(_OWORD *)&self->_overallDurationHint.value = v3;
}

- (BOOL)shouldOptimizeForNetworkUse
{
  return self->_shouldOptimizeForNetworkUse;
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)a3
{
  self->_shouldOptimizeForNetworkUse = a3;
}

- (NSURL)directoryForTemporaryFiles
{
  return self->_directoryForTemporaryFiles;
}

- (void)setDirectoryForTemporaryFiles:(id)a3
{
}

- (NSArray)metadataItems
{
  return self->_metadataItems;
}

- (void)setMetadataItems:(id)a3
{
}

- (int)movieTimeScale
{
  return self->_movieTimeScale;
}

- (void)setMovieTimeScale:(int)a3
{
  self->_movieTimeScale = a3;
}

- (CGAffineTransform)preferredTransform
{
  long long v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].d;
  return self;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_preferredTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_preferredTransform.c = v4;
  *(_OWORD *)&self->_preferredTransform.a = v3;
}

- (float)preferredVolume
{
  return self->_preferredVolume;
}

- (void)setPreferredVolume:(float)a3
{
  self->_preferredVolume = a3;
}

- (float)preferredRate
{
  return self->_preferredRate;
}

- (void)setPreferredRate:(float)a3
{
  self->_preferredRate = a3;
}

- (int64_t)singlePassFileSize
{
  return self->_singlePassFileSize;
}

- (void)setSinglePassFileSize:(int64_t)a3
{
  self->_singlePassFileSize = a3;
}

- (int64_t)singlePassMediaDataSize
{
  return self->_singlePassMediaDataSize;
}

- (void)setSinglePassMediaDataSize:(int64_t)a3
{
  self->_singlePassMediaDataSize = a3;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSArray)inputGroups
{
  return self->_inputGroups;
}

- (void)setInputGroups:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredOutputSegmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (void)setPreferredOutputSegmentInterval:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_preferredOutputSegmentInterval.epoch = a3->var3;
  *(_OWORD *)&self->_preferredOutputSegmentInterval.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialSegmentStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 248);
  return self;
}

- (void)setInitialSegmentStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_initialSegmentStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_initialSegmentStartTime.value = v3;
}

- (NSString)outputFileTypeProfile
{
  return self->_outputFileTypeProfile;
}

- (void)setOutputFileTypeProfile:(id)a3
{
}

- (int64_t)initialMovieFragmentSequenceNumber
{
  return self->_initialMovieFragmentSequenceNumber;
}

- (void)setInitialMovieFragmentSequenceNumber:(int64_t)a3
{
  self->_initialMovieFragmentSequenceNumber = a3;
}

- (BOOL)producesCombinableFragments
{
  return self->_producesCombinableFragments;
}

- (void)setProducesCombinableFragments:(BOOL)a3
{
  self->_producesCombinableFragments = a3;
}

- (BOOL)usesVirtualCaptureCard
{
  return self->_usesVirtualCaptureCard;
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
{
  self->_usesVirtualCaptureCard = a3;
}

- (BOOL)requiresInProcessOperation
{
  return self->_requiresInProcessOperation;
}

- (void)setRequiresInProcessOperation:(BOOL)a3
{
  self->_requiresInProcessOperation = a3;
}

- (void).cxx_destruct
{
}

@end