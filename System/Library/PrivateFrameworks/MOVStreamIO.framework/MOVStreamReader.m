@interface MOVStreamReader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstPts;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)getMinFrameDurationForStream:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTimeOfMovie;
- (BOOL)containsAudioStream:(id)a3;
- (BOOL)containsMetadataStream:(id)a3;
- (BOOL)containsStream:(id)a3;
- (BOOL)containsStream:(id)a3 withMediaType:(int64_t)a4;
- (BOOL)containsTimeRangeMetadataStream;
- (BOOL)copyNextStereoFramesForStream:(id)a3 leftBuffer:(__CVBuffer *)a4 rightBuffer:(__CVBuffer *)a5 timestamp:(id *)a6 error:(id *)a7;
- (BOOL)endOfStream;
- (BOOL)getOutputPixelFormatWasGuessedForStream:(id)a3;
- (BOOL)hasFinishedReading;
- (BOOL)hasReachedEndOfMetadataStream:(id)a3;
- (BOOL)hasReachedEndOfStream:(id)a3;
- (BOOL)hasSynthesizedTimeCodeForStream:(id)a3;
- (BOOL)hasTimeCodeForStream:(id)a3;
- (BOOL)isStereoStream:(id)a3;
- (BOOL)isTrack:(id)a3 byIdInTracks:(id)a4;
- (BOOL)l010OutputFormatRAW14L016;
- (BOOL)rawBayerMSBReplication;
- (BOOL)registerOutput:(id)a3;
- (BOOL)resetReader:(id *)a3;
- (BOOL)resetReaderTo:(id *)a3 error:(id *)a4;
- (BOOL)resetReaderWithTimeRange:(id *)a3 error:(id *)a4;
- (BOOL)restrictVideoFramesToEdits;
- (BOOL)saveStream:(id)a3 toFile:(id)a4 error:(id *)a5;
- (BOOL)skipEmptyEditVideoFrame;
- (BOOL)skipSynthesizedTimeCode;
- (CGAffineTransform)transformForStream:(SEL)a3;
- (CGSize)getOutputSizeForStream:(id)a3;
- (CGSize)getSizeForStream:(id)a3;
- (CVSMPTETime)grabNextTimeCodeSampleForStream:(SEL)a3 timestamp:(id)a4 error:(id *)a5;
- (CVSMPTETime)grabNextTimeRangeMetadataSampleOfStream:(SEL)a3 rangeStartTime:(id)a4 rangeEndTime:(unint64_t *)a5 presentationTimeRange:(unint64_t *)a6 error:(id *)a7;
- (CVSMPTETime)grabNextTimeRangeMetadataSampleOfStream:(SEL)a3 startTime:(id)a4 endTime:(unint64_t *)a5 error:(unint64_t *)a6;
- (MOVStreamReader)initWithAsset:(id)a3 delegate:(id)a4 error:(id *)a5;
- (MOVStreamReader)initWithContentsOfFile:(id)a3 delegate:(id)a4 error:(id *)a5;
- (MOVStreamReader)initWithContentsOfURL:(id)a3 delegate:(id)a4 error:(id *)a5;
- (MOVStreamReader)initWithURL:(id)a3 delegate:(id)a4 error:(id *)p_isa;
- (MOVStreamReader)initWithURL:(id)a3 error:(id *)a4;
- (MOVStreamReaderDelegate)delegate;
- (NSString)timeRangeMetadataKey;
- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5;
- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 timeCode:(CVSMPTETime *)a5 tcDropFrame:(BOOL *)a6 error:(id *)a7;
- (__CVBuffer)nextPixelBufferForStream:(id)a3 attachmentsData:(id *)a4 timestamp:(id *)a5 error:(id *)a6;
- (double)duration;
- (double)getFrameRateForStream:(id)a3;
- (id)additionalCompressionPropertiesForStream:(id)a3;
- (id)customTrackMetadataItemsForStream:(id)a3;
- (id)getAllAudioStreams;
- (id)getAllMetadataStreams;
- (id)getAllSceneStreams;
- (id)getAllStreams;
- (id)getAllTimeCodeStreams;
- (id)getMetadataStreamsAssociatedTo:(id)a3;
- (id)getMetadataStreamsAssociatedTo:(id)a3 error:(id *)a4;
- (id)getRelatedStreamForStreamId:(id)a3;
- (id)getRelationSpecifierForStreamId:(id)a3;
- (id)getStreamsRelatedToStream:(id)a3;
- (id)getTimeRangeMetadataStream;
- (id)getUnknownMetadataStreamsAssociatedTo:(id)a3;
- (id)grabNextMetadataItemsOfTrackAssociatedWith:(id)a3 withIdentifier:(id)a4 timeRange:(id *)a5 error:(id *)a6;
- (id)grabNextMetadataOfStream:(id)a3 timeRange:(id *)a4;
- (id)grabNextMetadataOfStream:(id)a3 timeRange:(id *)a4 error:(id *)a5;
- (id)grabNextTimedMetadataGroupOfStream:(id)a3 error:(id *)a4;
- (id)metadataForMovie;
- (id)metadataTrackForStream:(id)a3;
- (id)movstreamIOMetadataForMovie;
- (id)nextAttachmentForStream:(id)a3 error:(id *)a4;
- (id)outputForAudioStream:(id)a3 error:(id *)a4;
- (id)outputForMetadataStream:(id)a3 error:(id *)a4;
- (id)outputForSceneStream:(id)a3 error:(id *)a4;
- (id)outputForTimeCodeStream:(id)a3 error:(id *)a4;
- (id)outputForVideoStream:(id)a3 error:(id *)a4;
- (id)outputsRelatedToOutput:(id)a3 trackAssociation:(id)a4;
- (id)stereoLayersForStream:(id)a3;
- (id)streamIdFromTrackStreamTypeIdentifier:(id)a3;
- (id)timeRangeMetadataForPixelBuffer:(__CVBuffer *)a3;
- (id)timeRangeMetadataKeyHint;
- (id)timestampsForMetadataStream:(id)a3;
- (id)timestampsForStream:(id)a3;
- (id)timestampsForStream:(id)a3 restrictedTimeRange:(id *)a4;
- (id)trackForStream:(id)a3;
- (id)trackMetadataForAudioStream:(id)a3;
- (id)trackMetadataForMetadataStream:(id)a3;
- (id)trackMetadataForSceneStream:(id)a3;
- (id)trackMetadataForStream:(id)a3;
- (id)trackMetadataForStream:(id)a3 withMediaType:(int64_t)a4;
- (id)trackMetadataForTimeCodeStream:(id)a3;
- (id)trackMetadataForVideoStream:(id)a3;
- (int)bufferCacheMode;
- (opaqueCMFormatDescription)timeCodeFormatDescriptionStream:(id)a3;
- (opaqueCMSampleBuffer)grabNextSampleBufferForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5;
- (opaqueCMSampleBuffer)nextSampleBufferForStream:(id)a3 attachmentsData:(id *)a4 timestamp:(id *)a5 error:(id *)a6;
- (unint64_t)trackTypeInfoForStream:(id)a3;
- (unsigned)getOutputPixelFormatForStream:(id)a3;
- (unsigned)pixelFormatForStream:(id)a3;
- (void)clearOutputs;
- (void)dealloc;
- (void)movVersionCheck;
- (void)removePixelBufferPadding:(BOOL)a3 forStream:(id)a4;
- (void)setBufferCacheMode:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setL010OutputFormatRAW14L016:(BOOL)a3;
- (void)setRawBayerMSBReplication:(BOOL)a3;
- (void)setRestrictVideoFramesToEdits:(BOOL)a3;
- (void)setSkipEmptyEditVideoFrame:(BOOL)a3;
- (void)setSkipSynthesizedTimeCode:(BOOL)a3;
- (void)setTimeRangeMetadataKey:(id)a3;
@end

@implementation MOVStreamReader

- (id)streamIdFromTrackStreamTypeIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Depth"])
  {
    v4 = @"FrontDepth";
  }
  else if ([v3 isEqualToString:@"Color"])
  {
    v4 = @"FrontColor";
  }
  else if ([v3 isEqualToString:@"IR"])
  {
    v4 = @"FrontIR";
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (MOVStreamReader)initWithURL:(id)a3 error:(id *)a4
{
  return [(MOVStreamReader *)self initWithURL:a3 delegate:0 error:a4];
}

- (MOVStreamReader)initWithURL:(id)a3 delegate:(id)a4 error:(id *)p_isa
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  +[MIOLog recheckDebugEnabled];
  if (([v8 isFileURL] & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"URL must be a file URL type. (%@)", v8];
    [MEMORY[0x263F087E8] populateReaderError:p_isa message:v20 code:5];
LABEL_10:

    goto LABEL_11;
  }
  v10 = [MEMORY[0x263F08850] defaultManager];
  v11 = [v8 path];
  char v12 = [v10 fileExistsAtPath:v11];

  if ((v12 & 1) == 0)
  {
    v21 = NSString;
    v22 = [v8 path];
    v20 = [v21 stringWithFormat:@"File doesn't exist. (%@)", v22];

    [MEMORY[0x263F087E8] populateReaderError:p_isa message:v20 code:6];
    goto LABEL_10;
  }
  v29.receiver = self;
  v29.super_class = (Class)MOVStreamReader;
  v13 = [(MOVStreamReader *)&v29 init];
  self = v13;
  if (!v13) {
    goto LABEL_17;
  }
  id v14 = objc_storeWeak((id *)&v13->_delegate, v9);

  if (!v9) {
    id v15 = (id)[MEMORY[0x263F087E8] readerWarningWithMessage:@"No MOVStreamReaderDelegate set." code:0];
  }
  v16 = [MEMORY[0x263EFA8D0] URLAssetWithURL:v8 options:0];
  m_asset = self->m_asset;
  self->m_asset = v16;

  [(MOVStreamReader *)self movVersionCheck];
  *(_WORD *)&self->_l010OutputFormatRAW14L016 = 257;
  self->_bufferCacheMode = 0;
  [(MOVStreamReader *)self setSkipEmptyEditVideoFrame:0];
  v18 = [(MOVStreamReader *)self timeRangeMetadataKeyHint];
  if (v18)
  {
    v19 = [(MOVStreamReader *)self timeRangeMetadataKeyHint];
  }
  else
  {
    v19 = @"MidExposureTimeStamp";
  }
  [(MOVStreamReader *)self setTimeRangeMetadataKey:v19];
  if (v18) {

  }
  timeRangeMetadataStream = self->_timeRangeMetadataStream;
  self->_timeRangeMetadataStream = 0;

  long long v27 = *MEMORY[0x263F010E8];
  uint64_t v28 = *(void *)(MEMORY[0x263F010E8] + 16);
  if ([(MOVStreamReader *)self resetReaderTo:&v27 error:p_isa])
  {
LABEL_17:
    self = self;
    p_isa = (id *)&self->super.isa;
    goto LABEL_12;
  }
  if (!p_isa) {
    goto LABEL_12;
  }
  v25 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    id v26 = *p_isa;
    *(_DWORD *)buf = 138543362;
    id v31 = v26;
    _os_log_impl(&dword_21B5ED000, v25, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Cannot initialize reader: %{public}@ ⛔️⛔️⛔️", buf, 0xCu);
  }

LABEL_11:
  p_isa = 0;
LABEL_12:

  return (MOVStreamReader *)p_isa;
}

- (MOVStreamReader)initWithContentsOfFile:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  +[MIOLog recheckDebugEnabled];
  v10 = [NSURL fileURLWithPath:v8];
  if (v10)
  {
    self = [(MOVStreamReader *)self initWithContentsOfURL:v10 delegate:v9 error:a5];
    v11 = self;
  }
  else
  {
    char v12 = [NSString stringWithFormat:@"Invalid file path. (%@)", v8];
    [MEMORY[0x263F087E8] populateReaderError:a5 message:v12 code:5];

    v11 = 0;
  }

  return v11;
}

- (MOVStreamReader)initWithAsset:(id)a3 delegate:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  +[MIOLog recheckDebugEnabled];
  v24.receiver = self;
  v24.super_class = (Class)MOVStreamReader;
  v11 = [(MOVStreamReader *)&v24 init];
  char v12 = v11;
  v13 = v11;
  if (!v11) {
    goto LABEL_10;
  }
  id v14 = objc_storeWeak((id *)&v11->_delegate, v10);

  if (!v10) {
    id v15 = (id)[MEMORY[0x263F087E8] readerWarningWithMessage:@"No MOVStreamReaderDelegate set." code:0];
  }
  [(MOVStreamReader *)v13 setSkipEmptyEditVideoFrame:0];
  objc_storeStrong((id *)&v12->m_asset, a3);
  [(MOVStreamReader *)v13 movVersionCheck];
  *(_WORD *)&v13->_l010OutputFormatRAW14L016 = 256;
  v13->_bufferCacheMode = 0;
  v16 = [(MOVStreamReader *)v13 timeRangeMetadataKeyHint];
  if (v16)
  {
    v17 = [(MOVStreamReader *)v13 timeRangeMetadataKeyHint];
  }
  else
  {
    v17 = @"MidExposureTimeStamp";
  }
  [(MOVStreamReader *)v13 setTimeRangeMetadataKey:v17];
  if (v16) {

  }
  timeRangeMetadataStream = v13->_timeRangeMetadataStream;
  v13->_timeRangeMetadataStream = 0;

  long long v22 = *MEMORY[0x263F010E8];
  uint64_t v23 = *(void *)(MEMORY[0x263F010E8] + 16);
  if (![(MOVStreamReader *)v13 resetReaderTo:&v22 error:a5])
  {
    if (a5)
    {
      v19 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = *a5;
        *(_DWORD *)buf = 138543362;
        id v26 = v20;
        _os_log_impl(&dword_21B5ED000, v19, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Cannot initialize reader: %{public}@ ⛔️⛔️⛔️", buf, 0xCu);
      }

      a5 = 0;
    }
  }
  else
  {
LABEL_10:
    a5 = v13;
  }

  return (MOVStreamReader *)a5;
}

- (MOVStreamReader)initWithContentsOfURL:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  +[MIOLog recheckDebugEnabled];
  if (([v8 isFileURL] & 1) == 0)
  {
    v13 = [NSString stringWithFormat:@"URL must be a file URL type. (%@)", v8];
    [MEMORY[0x263F087E8] populateReaderError:a5 message:v13 code:5];
LABEL_6:
    id v14 = 0;
    goto LABEL_7;
  }
  id v10 = [MEMORY[0x263F08850] defaultManager];
  v11 = [v8 path];
  char v12 = [v10 fileExistsAtPath:v11];

  if ((v12 & 1) == 0)
  {
    id v15 = NSString;
    v16 = [v8 path];
    v13 = [v15 stringWithFormat:@"File doesn't exist. (%@)", v16];

    [MEMORY[0x263F087E8] populateReaderError:a5 message:v13 code:6];
    goto LABEL_6;
  }
  v13 = [MEMORY[0x263EFA8D0] URLAssetWithURL:v8 options:0];
  self = [(MOVStreamReader *)self initWithAsset:v13 delegate:v9 error:a5];
  id v14 = self;
LABEL_7:

  return v14;
}

- (void)dealloc
{
  [(AVAssetReader *)self->m_assetReader cancelReading];
  v3.receiver = self;
  v3.super_class = (Class)MOVStreamReader;
  [(MOVStreamReader *)&v3 dealloc];
}

- (BOOL)resetReader:(id *)a3
{
  long long v4 = *MEMORY[0x263F010E8];
  uint64_t v5 = *(void *)(MEMORY[0x263F010E8] + 16);
  return [(MOVStreamReader *)self resetReaderTo:&v4 error:a3];
}

- (void)clearOutputs
{
  [(NSMutableDictionary *)self->_sampleStreams removeAllObjects];
  objc_super v3 = (NSMutableDictionary *)objc_opt_new();
  sampleStreams = self->_sampleStreams;
  self->_sampleStreams = v3;

  [(NSMutableArray *)self->_orderedVideoStreamIds removeAllObjects];
  uint64_t v5 = (NSMutableArray *)objc_opt_new();
  orderedVideoStreamIds = self->_orderedVideoStreamIds;
  self->_orderedVideoStreamIds = v5;

  [(NSMutableDictionary *)self->_metadataStreams removeAllObjects];
  v7 = (NSMutableDictionary *)objc_opt_new();
  metadataStreams = self->_metadataStreams;
  self->_metadataStreams = v7;

  [(NSMutableArray *)self->_orderedMetadataStreamIds removeAllObjects];
  id v9 = (NSMutableArray *)objc_opt_new();
  orderedMetadataStreamIds = self->_orderedMetadataStreamIds;
  self->_orderedMetadataStreamIds = v9;

  [(NSMutableArray *)self->_orderedAudioStreamIds removeAllObjects];
  v11 = (NSMutableArray *)objc_opt_new();
  orderedAudioStreamIds = self->_orderedAudioStreamIds;
  self->_orderedAudioStreamIds = v11;

  [(NSMutableArray *)self->_orderedSceneStreamIds removeAllObjects];
  v13 = (NSMutableArray *)objc_opt_new();
  orderedSceneStreamIds = self->_orderedSceneStreamIds;
  self->_orderedSceneStreamIds = v13;

  [(NSMutableArray *)self->_orderedTimeCodeStreamIds removeAllObjects];
  self->_orderedTimeCodeStreamIds = (NSMutableArray *)objc_opt_new();

  MEMORY[0x270F9A758]();
}

- (BOOL)registerOutput:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    switch([v4 mediaType])
    {
      case 0:
        orderedVideoStreamIds = self->_orderedVideoStreamIds;
        v7 = [v5 streamId];
        [(NSMutableArray *)orderedVideoStreamIds addObject:v7];

        sampleStreams = self->_sampleStreams;
        id v9 = [v5 streamId];
        [(NSMutableDictionary *)sampleStreams setObject:v5 forKey:v9];
        break;
      case 1:
        orderedAudioStreamIds = self->_orderedAudioStreamIds;
        v13 = [v5 streamId];
        [(NSMutableArray *)orderedAudioStreamIds addObject:v13];

        id v14 = self->_sampleStreams;
        id v9 = [v5 streamId];
        [(NSMutableDictionary *)v14 setObject:v5 forKey:v9];
        break;
      case 2:
        orderedMetadataStreamIds = self->_orderedMetadataStreamIds;
        v16 = [v5 streamId];
        [(NSMutableArray *)orderedMetadataStreamIds addObject:v16];

        metadataStreams = self->_metadataStreams;
        id v9 = [v5 streamId];
        [(NSMutableDictionary *)metadataStreams setObject:v5 forKey:v9];
        break;
      case 3:
        orderedSceneStreamIds = self->_orderedSceneStreamIds;
        v19 = [v5 streamId];
        [(NSMutableArray *)orderedSceneStreamIds addObject:v19];

        id v20 = self->_sampleStreams;
        id v9 = [v5 streamId];
        [(NSMutableDictionary *)v20 setObject:v5 forKey:v9];
        break;
      case 4:
        orderedTimeCodeStreamIds = self->_orderedTimeCodeStreamIds;
        long long v22 = [v5 streamId];
        [(NSMutableArray *)orderedTimeCodeStreamIds addObject:v22];

        uint64_t v23 = self->_sampleStreams;
        id v9 = [v5 streamId];
        [(NSMutableDictionary *)v23 setObject:v5 forKey:v9];
        break;
      default:
        id v10 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v25 = 134217984;
          uint64_t v26 = [v5 mediaType];
          _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_ERROR, "MOVStreamReader registerOutput unknown media type (%ld).", (uint8_t *)&v25, 0xCu);
        }
        goto LABEL_9;
    }

    BOOL v11 = 1;
  }
  else
  {
    id v10 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_ERROR, "MOVStreamReader registerOutput with nil output.", (uint8_t *)&v25, 2u);
    }
LABEL_9:

    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)resetReaderTo:(id *)a3 error:(id *)a4
{
  memset(&v10, 0, sizeof(v10));
  CMTime start = *(CMTime *)a3;
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F010B0];
  CMTimeRangeMake(&v10, &start, &duration);
  CMTimeRange v7 = v10;
  return [(MOVStreamReader *)self resetReaderWithTimeRange:&v7 error:a4];
}

- (BOOL)resetReaderWithTimeRange:(id *)a3 error:(id *)a4
{
  uint64_t v262 = *MEMORY[0x263EF8340];
  if (!self->m_asset)
  {
    [MEMORY[0x263F087E8] populateReaderError:a4 message:@"MOVStreamReader asset is nil" code:25];
    return 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v176 = (__CFString *)CMTimeRangeCopyDescription(v4, &range);
  v6 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v176;
    _os_log_impl(&dword_21B5ED000, v6, OS_LOG_TYPE_INFO, "Set reader to time range: %{public}@", buf, 0xCu);
  }

  if ((a3->var0.var2 & 1) == 0)
  {
    CMTimeRange v7 = @"Time to reset to is invalid";
    id v8 = a4;
LABEL_10:
    [MEMORY[0x263F087E8] populateReaderError:v8 message:v7 code:25];
    BOOL v9 = 0;
    goto LABEL_11;
  }
  id v8 = a4;
  if ((a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    CMTimeRange v7 = @"Time range to reset to is invalid";
    goto LABEL_10;
  }
  m_assetReader = self->m_assetReader;
  if (m_assetReader) {
    [(AVAssetReader *)m_assetReader cancelReading];
  }
  id v12 = objc_alloc(MEMORY[0x263EFA4C0]);
  m_asset = self->m_asset;
  id v249 = 0;
  id v14 = (AVAssetReader *)[v12 initWithAsset:m_asset error:&v249];
  id v173 = v249;
  id v15 = self->m_assetReader;
  self->m_assetReader = v14;

  if (v173)
  {
    if (a4)
    {
      BOOL v9 = 0;
      *a4 = (id)[v173 copy];
    }
    else
    {
      v149 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v173;
        _os_log_impl(&dword_21B5ED000, v149, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: %{public}@ ⛔️⛔️⛔️", buf, 0xCu);
      }

      BOOL v9 = 0;
    }
    goto LABEL_197;
  }
  v16 = self;
  [(MOVStreamReader *)self clearOutputs];
  v193 = objc_opt_new();
  [(AVURLAsset *)self->m_asset tracksWithMediaType:*MEMORY[0x263EF9D40]];
  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v245 objects:v261 count:16];
  if (v17)
  {
    id v177 = *(id *)v246;
    p_delegate = &self->_delegate;
    do
    {
      locatiouint64_t n = (id *)v17;
      for (i = 0; i != location; i = (id *)((char *)i + 1))
      {
        if (*(id *)v246 != v177) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v245 + 1) + 8 * i);
        v21 = [@"Unknown" stringByAppendingFormat:@"-time-code"];
        if ([(NSMutableArray *)v16->_orderedTimeCodeStreamIds count])
        {
          uint64_t v22 = objc_msgSend(v21, "stringByAppendingFormat:", @"-%lu", -[NSMutableArray count](v16->_orderedTimeCodeStreamIds, "count"));

          v21 = (void *)v22;
          v16 = self;
        }
        uint64_t v23 = +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:v16->m_asset forTrack:v20];
        [v193 addObjectsFromArray:v23];
        if (+[MIOLog debugEnabled])
        {
          objc_super v24 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v21;
            _os_log_impl(&dword_21B5ED000, v24, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup time code output for '%{public}@'.", buf, 0xCu);
          }

          v16 = self;
        }
        int v25 = [MOVStreamReaderStreamOutput alloc];
        uint64_t v26 = v16->m_assetReader;
        movVersiouint64_t n = v16->_movVersion;
        id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        id v244 = 0;
        objc_super v29 = [(MOVStreamReaderStreamOutput *)v25 initWithTimeCodeTrack:v20 assetReader:v26 associatedMetadataTracks:v23 version:movVersion unknownStreamId:v21 reader:self delegate:WeakRetained error:&v244];
        id v30 = v244;

        if (v30)
        {
          id v31 = objc_loadWeakRetained((id *)p_delegate);
          if (v31)
          {
            id v32 = objc_loadWeakRetained((id *)p_delegate);
            char v33 = objc_opt_respondsToSelector();

            if (v33)
            {
              v34 = [(MOVStreamReader *)self delegate];
              [v34 reader:self didReceiveWarning:v30];
LABEL_41:
            }
          }
        }
        else
        {
          BOOL v35 = +[MIOLog debugEnabled];
          v36 = self;
          if (v35)
          {
            v37 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v21;
              _os_log_impl(&dword_21B5ED000, v37, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register time code output for '%{public}@'.", buf, 0xCu);
            }

            v36 = self;
          }
          if (![(MOVStreamReader *)v36 registerOutput:v29])
          {
            v34 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v21;
              _os_log_impl(&dword_21B5ED000, v34, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register time code output for '%{public}@', failed.", buf, 0xCu);
            }
            goto LABEL_41;
          }
        }

        v16 = self;
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v245 objects:v261 count:16];
    }
    while (v17);
  }

  v38 = [(AVURLAsset *)self->m_asset tracksWithMediaType:*MEMORY[0x263EF9D48]];

  long long v242 = 0u;
  long long v243 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  id obja = v38;
  uint64_t v39 = [obja countByEnumeratingWithState:&v240 objects:v260 count:16];
  if (!v39) {
    goto LABEL_69;
  }
  id v178 = *(id *)v241;
  locationa = (id *)&self->_delegate;
  do
  {
    for (uint64_t j = 0; j != v39; ++j)
    {
      if (*(id *)v241 != v178) {
        objc_enumerationMutation(obja);
      }
      uint64_t v41 = *(void *)(*((void *)&v240 + 1) + 8 * j);
      v42 = [@"Unknown" stringByAppendingFormat:@"-video"];
      if ([(NSMutableArray *)self->_orderedVideoStreamIds count])
      {
        uint64_t v43 = objc_msgSend(v42, "stringByAppendingFormat:", @"-%lu", -[NSMutableArray count](self->_orderedVideoStreamIds, "count"));

        v42 = (void *)v43;
      }
      v44 = +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:self->m_asset forTrack:v41];
      [v193 addObjectsFromArray:v44];
      if (+[MIOLog debugEnabled])
      {
        v45 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v42;
          _os_log_impl(&dword_21B5ED000, v45, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup video output for '%{public}@'.", buf, 0xCu);
        }
      }
      v46 = [MOVStreamReaderStreamOutput alloc];
      v47 = self->m_assetReader;
      v48 = self->_movVersion;
      uint64_t bufferCacheMode = self->_bufferCacheMode;
      id v50 = objc_loadWeakRetained(locationa);
      id v239 = 0;
      v51 = [(MOVStreamReaderStreamOutput *)v46 initWithVideoTrack:v41 assetReader:v47 associatedMetadataTracks:v44 version:v48 bufferCacheMode:bufferCacheMode unknownStreamId:v42 reader:self delegate:v50 error:&v239];
      id v52 = v239;

      if (v52)
      {
        id v53 = objc_loadWeakRetained(locationa);
        if (v53)
        {
          id v54 = objc_loadWeakRetained(locationa);
          char v55 = objc_opt_respondsToSelector();

          if (v55)
          {
            v56 = [(MOVStreamReader *)self delegate];
            [v56 reader:self didReceiveWarning:v52];
LABEL_66:
          }
        }
      }
      else
      {
        if (+[MIOLog debugEnabled])
        {
          v57 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v42;
            _os_log_impl(&dword_21B5ED000, v57, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register video output for '%{public}@'.", buf, 0xCu);
          }
        }
        if (![(MOVStreamReader *)self registerOutput:v51])
        {
          v56 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v42;
            _os_log_impl(&dword_21B5ED000, v56, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register video output for '%{public}@', failed.", buf, 0xCu);
          }
          goto LABEL_66;
        }
      }
    }
    uint64_t v39 = [obja countByEnumeratingWithState:&v240 objects:v260 count:16];
  }
  while (v39);
LABEL_69:

  v58 = [(AVURLAsset *)self->m_asset tracksWithMediaType:*MEMORY[0x263EF9CE8]];

  long long v237 = 0u;
  long long v238 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  id objb = v58;
  uint64_t v59 = [objb countByEnumeratingWithState:&v235 objects:v259 count:16];
  v60 = self;
  if (!v59) {
    goto LABEL_94;
  }
  id v179 = *(id *)v236;
  v61 = &self->_delegate;
  while (2)
  {
    locationb = (id *)v59;
    v62 = 0;
    while (2)
    {
      if (*(id *)v236 != v179) {
        objc_enumerationMutation(objb);
      }
      uint64_t v63 = *(void *)(*((void *)&v235 + 1) + 8 * (void)v62);
      v64 = [@"Unknown" stringByAppendingFormat:@"-audio"];
      if ([(NSMutableArray *)v60->_orderedAudioStreamIds count])
      {
        uint64_t v65 = objc_msgSend(v64, "stringByAppendingFormat:", @"-%lu", -[NSMutableArray count](v60->_orderedAudioStreamIds, "count"));

        v64 = (void *)v65;
        v60 = self;
      }
      v66 = +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:v60->m_asset forTrack:v63];
      [v193 addObjectsFromArray:v66];
      if (+[MIOLog debugEnabled])
      {
        v67 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v64;
          _os_log_impl(&dword_21B5ED000, v67, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup audio output for '%{public}@'.", buf, 0xCu);
        }

        v60 = self;
      }
      v68 = [MOVStreamReaderStreamOutput alloc];
      v69 = v60->m_assetReader;
      v70 = v60->_movVersion;
      id v71 = objc_loadWeakRetained((id *)v61);
      id v234 = 0;
      v72 = [(MOVStreamReaderStreamOutput *)v68 initWithAudioTrack:v63 assetReader:v69 associatedMetadataTracks:v66 version:v70 unknownStreamId:v64 reader:self delegate:v71 error:&v234];
      id v73 = v234;

      if (v73)
      {
        id v74 = objc_loadWeakRetained((id *)v61);
        if (v74)
        {
          id v75 = objc_loadWeakRetained((id *)v61);
          char v76 = objc_opt_respondsToSelector();

          if (v76)
          {
            v77 = [(MOVStreamReader *)self delegate];
            [v77 reader:self didReceiveWarning:v73];
            goto LABEL_91;
          }
        }
      }
      else
      {
        BOOL v78 = +[MIOLog debugEnabled];
        v79 = self;
        if (v78)
        {
          v80 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v64;
            _os_log_impl(&dword_21B5ED000, v80, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register audio output for '%{public}@'.", buf, 0xCu);
          }

          v79 = self;
        }
        if (![(MOVStreamReader *)v79 registerOutput:v72])
        {
          v77 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v64;
            _os_log_impl(&dword_21B5ED000, v77, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register audio output for '%{public}@', failed.", buf, 0xCu);
          }
LABEL_91:
        }
      }

      v62 = (id *)((char *)v62 + 1);
      v60 = self;
      if (locationb != v62) {
        continue;
      }
      break;
    }
    uint64_t v59 = [objb countByEnumeratingWithState:&v235 objects:v259 count:16];
    if (v59) {
      continue;
    }
    break;
  }
LABEL_94:

  id v172 = (id)*MEMORY[0x263EF9D28];
  v81 = -[AVURLAsset tracksWithMediaType:](self->m_asset, "tracksWithMediaType:");

  long long v232 = 0u;
  long long v233 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  id objc = v81;
  uint64_t v82 = [objc countByEnumeratingWithState:&v230 objects:v258 count:16];
  v83 = self;
  if (!v82) {
    goto LABEL_119;
  }
  id v180 = *(id *)v231;
  v84 = &self->_delegate;
  while (2)
  {
    locationc = (id *)v82;
    v85 = 0;
    while (2)
    {
      if (*(id *)v231 != v180) {
        objc_enumerationMutation(objc);
      }
      uint64_t v86 = *(void *)(*((void *)&v230 + 1) + 8 * (void)v85);
      v87 = [@"Unknown" stringByAppendingFormat:@"-scene"];
      if ([(NSMutableArray *)v83->_orderedSceneStreamIds count])
      {
        uint64_t v88 = objc_msgSend(v87, "stringByAppendingFormat:", @"-%lu", -[NSMutableArray count](v83->_orderedSceneStreamIds, "count"));

        v87 = (void *)v88;
        v83 = self;
      }
      v89 = +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:v83->m_asset forTrack:v86];
      [v193 addObjectsFromArray:v89];
      if (+[MIOLog debugEnabled])
      {
        v90 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v87;
          _os_log_impl(&dword_21B5ED000, v90, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup scene output for '%{public}@'.", buf, 0xCu);
        }

        v83 = self;
      }
      v91 = [MOVStreamReaderStreamOutput alloc];
      v92 = v83->m_assetReader;
      v93 = v83->_movVersion;
      id v94 = objc_loadWeakRetained((id *)v84);
      id v229 = 0;
      v95 = [(MOVStreamReaderStreamOutput *)v91 initWithSceneTrack:v86 assetReader:v92 associatedMetadataTracks:v89 version:v93 unknownStreamId:v87 reader:self delegate:v94 error:&v229];
      id v96 = v229;

      if (v96)
      {
        id v97 = objc_loadWeakRetained((id *)v84);
        if (v97)
        {
          id v98 = objc_loadWeakRetained((id *)v84);
          char v99 = objc_opt_respondsToSelector();

          if (v99)
          {
            v100 = [(MOVStreamReader *)self delegate];
            [v100 reader:self didReceiveWarning:v96];
            goto LABEL_116;
          }
        }
      }
      else
      {
        BOOL v101 = +[MIOLog debugEnabled];
        v102 = self;
        if (v101)
        {
          v103 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v87;
            _os_log_impl(&dword_21B5ED000, v103, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register scene output for '%{public}@'.", buf, 0xCu);
          }

          v102 = self;
        }
        if (![(MOVStreamReader *)v102 registerOutput:v95])
        {
          v100 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v87;
            _os_log_impl(&dword_21B5ED000, v100, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register scene output for '%{public}@', failed.", buf, 0xCu);
          }
LABEL_116:
        }
      }

      v85 = (id *)((char *)v85 + 1);
      v83 = self;
      if (locationc != v85) {
        continue;
      }
      break;
    }
    uint64_t v82 = [objc countByEnumeratingWithState:&v230 objects:v258 count:16];
    if (v82) {
      continue;
    }
    break;
  }
LABEL_119:

  v104 = self;
  [(AVURLAsset *)self->m_asset tracksWithMediaType:*MEMORY[0x263EF9D08]];
  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  v181 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v105 = [v181 countByEnumeratingWithState:&v225 objects:v257 count:16];
  if (v105)
  {
    locationd = *(id **)v226;
    v106 = &self->_delegate;
    while (2)
    {
      for (uint64_t k = 0; k != v105; ++k)
      {
        if (*(id **)v226 != locationd) {
          objc_enumerationMutation(v181);
        }
        uint64_t v108 = *(void *)(*((void *)&v225 + 1) + 8 * k);
        if (([v193 containsObject:v108] & 1) == 0)
        {
          v109 = [@"Unknown" stringByAppendingFormat:@"-metadata"];
          if ([(NSMutableArray *)v104->_orderedMetadataStreamIds count])
          {
            uint64_t v110 = objc_msgSend(v109, "stringByAppendingFormat:", @"-%lu", -[NSMutableArray count](v104->_orderedMetadataStreamIds, "count"));

            v109 = (void *)v110;
            v104 = self;
          }
          if (+[MIOLog debugEnabled])
          {
            v111 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v109;
              _os_log_impl(&dword_21B5ED000, v111, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Setup metadata output for '%{public}@'.", buf, 0xCu);
            }

            v104 = self;
          }
          v112 = [MOVStreamReaderStreamOutput alloc];
          v113 = v104->m_assetReader;
          v114 = v104->_movVersion;
          id v115 = objc_loadWeakRetained((id *)v106);
          id v224 = 0;
          v116 = [(MOVStreamReaderStreamOutput *)v112 initWithMetadataTrack:v108 assetReader:v113 version:v114 unknownStreamId:v109 reader:self delegate:v115 error:&v224];
          id v117 = v224;

          if (v117)
          {
            id v118 = objc_loadWeakRetained((id *)v106);
            if (v118)
            {
              id v119 = objc_loadWeakRetained((id *)v106);
              char v120 = objc_opt_respondsToSelector();

              if (v120)
              {
                v121 = [(MOVStreamReader *)self delegate];
                [v121 reader:self didReceiveWarning:v117];
              }
            }
          }
          else
          {
            BOOL v122 = +[MIOLog debugEnabled];
            v123 = self;
            if (v122)
            {
              v124 = +[MIOLog defaultLog];
              if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v109;
                _os_log_impl(&dword_21B5ED000, v124, OS_LOG_TYPE_DEBUG, "MOVStreamReader: Register metadata output for '%{public}@'.", buf, 0xCu);
              }

              v123 = self;
            }
            if (![(MOVStreamReader *)v123 registerOutput:v116])
            {
              v125 = +[MIOLog defaultLog];
              if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v109;
                _os_log_impl(&dword_21B5ED000, v125, OS_LOG_TYPE_ERROR, "MOVStreamReader: Register metadata output for '%{public}@', failed.", buf, 0xCu);
              }
            }
            if ([(MOVStreamReaderStreamOutput *)v116 isTimeRangeMetadataStream]
              && !self->_timeRangeMetadataSamples)
            {
              long long v150 = *(_OWORD *)&a3->var0.var3;
              v223[0] = *(_OWORD *)&a3->var0.var0;
              v223[1] = v150;
              v223[2] = *(_OWORD *)&a3->var1.var1;
              [(AVAssetReader *)self->m_assetReader setTimeRange:v223];
              if ([(AVAssetReader *)self->m_assetReader startReading])
              {
                v151 = [(MOVStreamReaderStreamOutput *)v116 streamId];
                v152 = [(MOVStreamReader *)self metadataTrackForStream:v151];
                BOOL v153 = v152 == 0;

                if (!v153)
                {
                  locationf = (id *)objc_opt_new();
                  v154 = 0;
                  unint64_t v155 = 0;
                  while (1)
                  {
                    unint64_t v222 = 0;
                    unint64_t v221 = 0;
                    v156 = [(MOVStreamReaderStreamOutput *)v116 streamId];
                    id v218 = v154;
                    [(MOVStreamReader *)self grabNextTimeRangeMetadataSampleOfStream:v156 rangeStartTime:&v222 rangeEndTime:&v221 presentationTimeRange:0 error:&v218];
                    id v157 = v218;

                    uint64_t v219 = *(void *)buf;
                    int v158 = v255;
                    int v220 = *(_DWORD *)&buf[8];
                    uint64_t v159 = v256;

                    v160 = [(MOVStreamReaderStreamOutput *)v116 streamId];
                    BOOL v161 = [(MOVStreamReader *)self hasReachedEndOfMetadataStream:v160];

                    if (v161) {
                      break;
                    }
                    if ((v158 & 1) == 0)
                    {
                      v171 = [(MOVStreamReaderStreamOutput *)v116 streamId];
                      NSLog(&cfstr_TimeCodeThatWa.isa, v171, v157);
LABEL_192:

                      BOOL v9 = 0;
                      goto LABEL_193;
                    }
                    if (v155 >= v222 || v221 <= v222)
                    {
                      v171 = [(MOVStreamReaderStreamOutput *)v116 streamId];
                      NSLog(&cfstr_TimeRangesAreN.isa, v171, v157);
                      goto LABEL_192;
                    }
                    v162 = objc_opt_new();
                    [v162 setStartTime:v222];
                    [v162 setEndTime:v221];
                    uint64_t v214 = v219;
                    int v215 = v220;
                    int v216 = v158;
                    uint64_t v217 = v159;
                    [v162 setTimeCode:&v214];
                    [locationf addObject:v162];
                    unint64_t v155 = v222;

                    v154 = v157;
                  }
                  v165 = (NSArray *)[locationf copy];
                  timeRangeMetadataSamples = self->_timeRangeMetadataSamples;
                  self->_timeRangeMetadataSamples = v165;

                  v167 = [(MOVStreamReaderStreamOutput *)v116 streamId];
                  timeRangeMetadataStreauint64_t m = self->_timeRangeMetadataStream;
                  self->_timeRangeMetadataStreauint64_t m = v167;

                  long long v212 = *MEMORY[0x263F010E8];
                  uint64_t v213 = *(void *)(MEMORY[0x263F010E8] + 16);
                  id v211 = 0;
                  BOOL v9 = [(MOVStreamReader *)self resetReaderTo:&v212 error:&v211];
                  id v169 = v211;
                  if (!v9)
                  {
                    v170 = [(MOVStreamReaderStreamOutput *)v116 streamId];
                    NSLog(&cfstr_CouldNotResetR.isa, v170, v169);
                  }
LABEL_193:

                  goto LABEL_194;
                }
                id v157 = [(MOVStreamReaderStreamOutput *)v116 streamId];
                NSLog(&cfstr_CouldNotCreate_0.isa, v157, 0);
              }
              else
              {
                v163 = NSString;
                v164 = [(AVAssetReader *)self->m_assetReader error];
                id v157 = [v163 stringWithFormat:@"Start Reading (AVAssetReader) Error: %@  Status: %ld", v164, -[AVAssetReader status](self->m_assetReader, "status")];

                [MEMORY[0x263F087E8] populateReaderError:a4 message:v157 code:4];
              }
              BOOL v9 = 0;
LABEL_194:

              locatione = v181;
              goto LABEL_195;
            }
          }

          v104 = self;
        }
      }
      uint64_t v105 = [v181 countByEnumeratingWithState:&v225 objects:v257 count:16];
      if (v105) {
        continue;
      }
      break;
    }
  }

  locatione = dispatch_group_create();
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  v126 = [(NSMutableDictionary *)self->_sampleStreams allValues];
  uint64_t v127 = [v126 countByEnumeratingWithState:&v207 objects:v253 count:16];
  if (v127)
  {
    uint64_t v128 = *(void *)v208;
    uint64_t v129 = *MEMORY[0x263EFA1B0];
    do
    {
      for (uint64_t m = 0; m != v127; ++m)
      {
        if (*(void *)v208 != v128) {
          objc_enumerationMutation(v126);
        }
        v131 = *(void **)(*((void *)&v207 + 1) + 8 * m);
        long long v203 = 0u;
        long long v204 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        v132 = [v131 getAssociatedMetadataStreamOutputs];
        uint64_t v133 = [v132 countByEnumeratingWithState:&v203 objects:v252 count:16];
        if (v133)
        {
          uint64_t v134 = *(void *)v204;
          do
          {
            for (uint64_t n = 0; n != v133; ++n)
            {
              if (*(void *)v204 != v134) {
                objc_enumerationMutation(v132);
              }
              [v131 registerForAssociating:*(void *)(*((void *)&v203 + 1) + 8 * n) trackRelation:v129];
            }
            uint64_t v133 = [v132 countByEnumeratingWithState:&v203 objects:v252 count:16];
          }
          while (v133);
        }
      }
      uint64_t v127 = [v126 countByEnumeratingWithState:&v207 objects:v253 count:16];
    }
    while (v127);
  }

  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  v136 = self;
  v137 = [(NSMutableDictionary *)self->_sampleStreams allValues];
  v138 = v137;
  uint64_t v139 = [v137 countByEnumeratingWithState:&v199 objects:v251 count:16];
  if (v139)
  {
    uint64_t v140 = *(void *)v200;
    uint64_t v141 = *MEMORY[0x263EFA1B8];
    do
    {
      for (uint64_t ii = 0; ii != v139; ++ii)
      {
        if (*(void *)v200 != v140) {
          objc_enumerationMutation(v138);
        }
        v143 = *(void **)(*((void *)&v199 + 1) + 8 * ii);
        if ([v143 mediaType] != 4)
        {
          objc_initWeak((id *)buf, v136);
          dispatch_group_enter(locatione);
          v144 = [v143 assetTrack];
          v196[0] = MEMORY[0x263EF8330];
          v196[1] = 3221225472;
          v196[2] = __50__MOVStreamReader_resetReaderWithTimeRange_error___block_invoke;
          v196[3] = &unk_2643AFA50;
          v196[4] = v143;
          v197 = locatione;
          objc_copyWeak(&v198, (id *)buf);
          [v144 loadAssociatedTracksOfType:v141 completionHandler:v196];

          objc_destroyWeak(&v198);
          objc_destroyWeak((id *)buf);
          v136 = self;
        }
      }
      v137 = v138;
      uint64_t v139 = [v138 countByEnumeratingWithState:&v199 objects:v251 count:16];
    }
    while (v139);
  }

  v145 = locatione;
  dispatch_group_wait(locatione, 0xFFFFFFFFFFFFFFFFLL);
  long long v146 = *(_OWORD *)&a3->var0.var3;
  v195[0] = *(_OWORD *)&a3->var0.var0;
  v195[1] = v146;
  v195[2] = *(_OWORD *)&a3->var1.var1;
  [(AVAssetReader *)self->m_assetReader setTimeRange:v195];
  BOOL v9 = [(AVAssetReader *)self->m_assetReader startReading];
  if (!v9)
  {
    v147 = NSString;
    v148 = [(AVAssetReader *)self->m_assetReader error];
    v109 = [v147 stringWithFormat:@"Start Reading (AVAssetReader) Error: %@  Status: %ld", v148, -[AVAssetReader status](self->m_assetReader, "status")];

    [MEMORY[0x263F087E8] populateReaderError:a4 message:v109 code:4];
LABEL_195:

    v145 = locatione;
  }

LABEL_197:
LABEL_11:

  return v9;
}

void __50__MOVStreamReader_resetReaderWithTimeRange_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v16 = a3;
  if (v16)
  {
    v6 = [*(id *)(a1 + 32) streamId];
    NSLog(&cfstr_CouldNotDeterm.isa, v6, v16);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained && [v5 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      CMTimeRange v7 = [WeakRetained[3] allValues];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v18;
        uint64_t v10 = *MEMORY[0x263EFA1B8];
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ([v12 mediaType] == 4)
            {
              v13 = [v12 assetTrack];
              int v14 = [v5 containsObject:v13];

              if (v14) {
                [v12 registerForAssociating:*(void *)(a1 + 32) trackRelation:v10];
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

- (id)timeRangeMetadataForPixelBuffer:(__CVBuffer *)a3
{
  if (self->_timeRangeMetadataSamples)
  {
    id v5 = [(MOVStreamReader *)self timeRangeMetadataKey];

    v6 = 0;
    if (a3 && v5)
    {
      CMTimeRange v7 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
      uint64_t v8 = [(MOVStreamReader *)self timeRangeMetadataKey];
      uint64_t v9 = [v7 objectForKeyedSubscript:v8];

      if (v9)
      {
        unint64_t v10 = [v9 unsignedLongLongValue];
        int v11 = [(NSArray *)self->_timeRangeMetadataSamples count];
        int v12 = v11 - 1;
        if (v11 >= 1)
        {
          int v13 = 0;
          do
          {
            int v14 = v12 - v13;
            if (v12 < v13) {
              ++v14;
            }
            int v15 = v13 + (v14 >> 1);
            v6 = [(NSArray *)self->_timeRangeMetadataSamples objectAtIndexedSubscript:v15];
            if ([v6 startTime] <= v10)
            {
              if ([v6 endTime] >= v10) {
                goto LABEL_15;
              }
              int v13 = v15 + 1;
            }
            else
            {
              int v12 = v15 - 1;
            }
          }
          while (v13 <= v12);
        }
      }
      v6 = 0;
LABEL_15:
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)saveStream:(id)a3 toFile:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v31 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [(MOVStreamReader *)self trackForStream:v30];
  if (v9
    || ([(MOVStreamReader *)self metadataTrackForStream:v30],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v8 addObject:v9];
    uint64_t v10 = +[MIOMovieMetadataUtility findAllAssociatedMetadataTracksInAsset:self->m_asset forTrack:v9];
    objc_super v29 = (void *)v10;
    if (v10) {
      [v8 addObjectsFromArray:v10];
    }
    id v11 = objc_alloc(MEMORY[0x263EFA798]);
    int v12 = [(AVURLAsset *)self->m_asset URL];
    int v13 = (void *)[v11 initWithURL:v12 options:0 error:a5];

    if (v13)
    {
      [v13 tracks];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            if (![(MOVStreamReader *)self isTrack:v18 byIdInTracks:v8]) {
              [v13 removeTrack:v18];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v15);
      }

      id v19 = objc_alloc(MEMORY[0x263EFA4A8]);
      long long v20 = (void *)[v19 initWithAsset:v13 presetName:*MEMORY[0x263EF95C0]];
      v21 = [NSURL fileURLWithPath:v31];
      [v20 setOutputURL:v21];

      [v20 setOutputFileType:*MEMORY[0x263EF9898]];
      uint64_t v22 = dispatch_group_create();
      dispatch_group_enter(v22);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __43__MOVStreamReader_saveStream_toFile_error___block_invoke;
      v32[3] = &unk_2643AF6E8;
      uint64_t v23 = v22;
      char v33 = v23;
      [v20 exportAsynchronouslyWithCompletionHandler:v32];
      dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
      objc_super v24 = [v20 error];
      BOOL v25 = v24 == 0;

      if (a5) {
        char v26 = v25;
      }
      else {
        char v26 = 1;
      }
      if ((v26 & 1) == 0)
      {
        *a5 = [v20 error];
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    uint64_t v28 = [NSString stringWithFormat:@"File doesn't contain stream '%@'.", v30];
    [MEMORY[0x263F087E8] populateReaderError:a5 message:v28 code:3];

    BOOL v25 = 0;
  }

  return v25;
}

void __43__MOVStreamReader_saveStream_toFile_error___block_invoke(uint64_t a1)
{
}

- (BOOL)isTrack:(id)a3 byIdInTracks:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "trackID", (void)v12);
        if (v10 == [v5 trackID])
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)movVersionCheck
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  objc_super v3 = [(MOVStreamReader *)self movstreamIOMetadataForMovie];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  CFAllocatorRef v4 = +[MIOVersion allVersionedKeysForKey:@"version" modifier:0];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v28;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v28 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = [v3 objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * v7)];
      if (v8) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v8 = 0;
  }

  id v26 = 0;
  uint64_t v9 = [[MIOVersion alloc] initWithVersionString:v8 error:&v26];
  int v10 = (MIOVersion *)v26;
  movVersiouint64_t n = self->_movVersion;
  self->_movVersiouint64_t n = v9;

  if (!self->_movVersion)
  {
    objc_super v24 = [MEMORY[0x263F087E8] readerWarningWithMessage:@"No or invalid MOVStreamIO version information in MOV!" code:22];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 reader:self didReceiveWarning:v24];
      }
    }
    uint64_t v18 = +[MIOVersion versionZero];
    id v19 = self->_movVersion;
    self->_movVersiouint64_t n = v18;
    goto LABEL_22;
  }
  BOOL v25 = v10;
  long long v12 = [[MIOVersion alloc] initWithVersionString:@"3.29.5" error:&v25];
  long long v13 = v25;

  if (v13) {
    __assert_rtn("-[MOVStreamReader movVersionCheck]", "MOVStreamReader.mm", 786, "versionError == nil");
  }
  if ([(MIOVersion *)v12 compareToVersion:self->_movVersion] == -1)
  {
    objc_super v24 = [NSString stringWithFormat:@"MOV created with a newer MOVStreamIO version '%@' (current '%@')!", self->_movVersion, v12];
    id v19 = objc_msgSend(MEMORY[0x263F087E8], "readerWarningWithMessage:code:");
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        id v23 = objc_loadWeakRetained((id *)&self->_delegate);
        [v23 reader:self didReceiveWarning:v19];
      }
    }
    int v10 = v12;
LABEL_22:

    goto LABEL_23;
  }
  int v10 = v12;
LABEL_23:
}

- (BOOL)l010OutputFormatRAW14L016
{
  return self->_l010OutputFormatRAW14L016;
}

- (void)setL010OutputFormatRAW14L016:(BOOL)a3
{
  if (self->_l010OutputFormatRAW14L016 != a3)
  {
    self->_l010OutputFormatRAW14L016 = a3;
    m_assetReader = self->m_assetReader;
    if (m_assetReader)
    {
      [(AVAssetReader *)m_assetReader timeRange];
    }
    else
    {
      long long v6 = 0u;
      long long v7 = 0u;
      long long v5 = 0u;
    }
    long long v8 = v5;
    uint64_t v9 = v6;
    -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v8, 0, v5, v6, v7);
  }
}

- (BOOL)rawBayerMSBReplication
{
  return self->_rawBayerMSBReplication;
}

- (void)setRawBayerMSBReplication:(BOOL)a3
{
  if (self->_rawBayerMSBReplication != a3)
  {
    self->_rawBayerMSBReplicatiouint64_t n = a3;
    m_assetReader = self->m_assetReader;
    if (m_assetReader)
    {
      [(AVAssetReader *)m_assetReader timeRange];
    }
    else
    {
      long long v6 = 0u;
      long long v7 = 0u;
      long long v5 = 0u;
    }
    long long v8 = v5;
    uint64_t v9 = v6;
    -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v8, 0, v5, v6, v7);
  }
}

- (int)bufferCacheMode
{
  return self->_bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  if (self->_bufferCacheMode != a3)
  {
    self->_uint64_t bufferCacheMode = a3;
    m_assetReader = self->m_assetReader;
    if (m_assetReader)
    {
      [(AVAssetReader *)m_assetReader timeRange];
    }
    else
    {
      long long v6 = 0u;
      long long v7 = 0u;
      long long v5 = 0u;
    }
    long long v8 = v5;
    uint64_t v9 = v6;
    -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v8, 0, v5, v6, v7);
  }
}

- (BOOL)skipSynthesizedTimeCode
{
  return self->_skipSynthesizedTimeCode;
}

- (void)setSkipSynthesizedTimeCode:(BOOL)a3
{
  if (self->_skipSynthesizedTimeCode != a3)
  {
    self->_skipSynthesizedTimeCode = a3;
    m_assetReader = self->m_assetReader;
    if (m_assetReader)
    {
      [(AVAssetReader *)m_assetReader timeRange];
    }
    else
    {
      long long v6 = 0u;
      long long v7 = 0u;
      long long v5 = 0u;
    }
    long long v8 = v5;
    uint64_t v9 = v6;
    -[MOVStreamReader resetReaderTo:error:](self, "resetReaderTo:error:", &v8, 0, v5, v6, v7);
  }
}

- (CGAffineTransform)transformForStream:(SEL)a3
{
  id v11 = a4;
  if (-[MOVStreamReader containsStream:](self, "containsStream:"))
  {
    long long v6 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v11];
    long long v7 = v6;
    if (v6)
    {
      [v6 transform];
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F000D0];
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  }

  return result;
}

- (id)metadataForMovie
{
  objc_super v3 = objc_opt_new();
  CFAllocatorRef v4 = [(AVURLAsset *)self->m_asset metadata];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__MOVStreamReader_metadataForMovie__block_invoke;
  v9[3] = &unk_2643AF9F0;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  if ([v5 count]) {
    long long v6 = v5;
  }
  else {
    long long v6 = 0;
  }
  id v7 = v6;

  return v7;
}

void __35__MOVStreamReader_metadataForMovie__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_super v3 = [v5 identifier];
  BOOL v4 = +[MOVStreamIOUtility isMOVStreamIOMovMetadataIdentifier:v3];

  if (!v4) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)movstreamIOMetadataForMovie
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [(AVURLAsset *)self->m_asset metadata];
  v2 = 0;
  uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v3)
  {
    uint64_t v28 = *(void *)v37;
    *(void *)&long long v4 = 138543362;
    long long v26 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        long long v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v7 = +[MIOVersion allVersionedKeysForKey:@"mdta/com.apple.framework.state.MOVStreamIO", 0, v26 modifier];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v42 count:16];
        if (!v8) {
          goto LABEL_30;
        }
        uint64_t v9 = *(void *)v33;
        while (2)
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v33 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            long long v12 = [v6 identifier];
            LODWORD(v11) = [v12 isEqualToString:v11];

            if (v11)
            {
              uint64_t v31 = 0;
              long long v13 = (void *)MEMORY[0x263F08AC0];
              long long v14 = [v6 value];
              LODWORD(v13) = [v13 propertyList:v14 isValidForFormat:100];

              if (v13)
              {
                id v15 = (void *)MEMORY[0x263F08AC0];
                char v16 = [v6 value];
                id v30 = 0;
                uint64_t v17 = [v15 propertyListWithData:v16 options:0 format:&v31 error:&v30];
                id v18 = v30;

                if (v18)
                {
                  if (+[MIOLog debugEnabled])
                  {
                    id v19 = +[MIOLog defaultLog];
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21B5ED000, v19, OS_LOG_TYPE_DEBUG, "MOVStreamIO state metadata is not in PLIST format. Fallback to JSON.", buf, 2u);
                    }
                  }
                  id v20 = (void *)v17;
LABEL_24:

                  char v22 = (void *)MEMORY[0x263F08900];
                  id v23 = [v6 value];
                  id v29 = 0;
                  uint64_t v21 = [v22 JSONObjectWithData:v23 options:1 error:&v29];
                  id v18 = v29;

                  if (v18 && +[MIOLog debugEnabled])
                  {
                    objc_super v24 = +[MIOLog defaultLog];
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v26;
                      id v41 = v18;
                      _os_log_impl(&dword_21B5ED000, v24, OS_LOG_TYPE_DEBUG, "MOVStreamIO state metadata JSON error: %{public}@", buf, 0xCu);
                    }
                  }
LABEL_29:

                  v2 = (void *)v21;
                  goto LABEL_30;
                }
                v2 = (void *)v17;
              }
              id v18 = 0;
              uint64_t v21 = (uint64_t)v2;
              id v20 = 0;
              if (!v21) {
                goto LABEL_24;
              }
              goto LABEL_29;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (v8) {
            continue;
          }
          break;
        }
LABEL_30:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v3);
  }

  return v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTimeOfMovie
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v4 = [(AVURLAsset *)self->m_asset metadata];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v8 identifier];
        int v10 = [v9 isEqualToString:@"mdta/com.apple.framework.mio.session.starttime"];

        if (v10)
        {
          if (v8)
          {
            [v8 valueAsMovSessionStartTime];
          }
          else
          {
            retstr->var0 = 0;
            *(void *)&retstr->var1 = 0;
            retstr->var3 = 0;
          }

          return result;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = MEMORY[0x263F01098];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x263F01098];
  retstr->var3 = *(void *)(v12 + 16);
  return result;
}

- (id)timeRangeMetadataKeyHint
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(AVURLAsset *)self->m_asset metadata];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v7 = [v6 identifier];
        int v8 = [v7 isEqualToString:@"mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"];

        if (v8)
        {
          uint64_t v9 = [v6 valueAsTimeRangeMetadataKeyHint];
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (id)getTimeRangeMetadataStream
{
  if ([(MOVStreamReader *)self containsTimeRangeMetadataStream]) {
    uint64_t v3 = self->_timeRangeMetadataStream;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)getRelatedStreamForStreamId:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsStream:v4])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    uint64_t v6 = [v5 relatedStreamId];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)getRelationSpecifierForStreamId:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsStream:v4])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    uint64_t v6 = [v5 relationSpecifier];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)getStreamsRelatedToStream:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_sampleStreams allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [v10 relatedStreamId];
        int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          long long v13 = [v10 streamId];
          [v5 addObject:v13];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)trackMetadataForStream:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsStream:v4])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    uint64_t v6 = [v5 customTrackMetadata];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)customTrackMetadataItemsForStream:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsStream:v4])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    uint64_t v6 = [v5 customTrackMetadataItems];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)trackMetadataForMetadataStream:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsMetadataStream:v4])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_metadataStreams objectForKey:v4];
    uint64_t v6 = [v5 customTrackMetadata];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasTimeCodeForStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 hasTimeCode];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)hasSynthesizedTimeCodeForStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 timeCodeIsSynthesized];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (opaqueCMFormatDescription)timeCodeFormatDescriptionStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = (opaqueCMFormatDescription *)[v3 timeCodeFormatDescription];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (CGSize)getSizeForStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 assetTrack];
    [v5 naturalSize];
    double width = v6;
    double height = v8;

    int v10 = [v4 assetTrack];
    long long v11 = [v10 formatDescriptions];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      long long v13 = [v4 assetTrack];
      long long v14 = [v13 formatDescriptions];
      long long v15 = [v14 objectAtIndexedSubscript:0];

      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)v15);
      if (Dimensions.width >= 1 && Dimensions.height >= 1)
      {
        double width = (double)Dimensions.width;
        double height = (double)Dimensions.height;
      }
    }
  }
  else
  {
    double width = *MEMORY[0x263F001B0];
    double height = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v17 = width;
  double v18 = height;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)getOutputSizeForStream:(id)a3
{
  id v4 = a3;
  char v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
  if (v5)
  {
    [(MOVStreamReader *)self getSizeForStream:v4];
    double v7 = v6;
    double v9 = v8;
    if (![v5 mediaType])
    {
      id v10 = v5;
      long long v11 = [v10 postProcessor];
      int v12 = [v11 conformsToProtocol:&unk_26CB82328];

      if (v12)
      {
        long long v13 = [v10 postProcessor];
        double v7 = (double)(unint64_t)[v13 adjustedWidthForWidth:(unint64_t)v7];
      }
    }
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
    double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v14 = v7;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (unsigned)getOutputPixelFormatForStream:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsStream:v4])
  {
    char v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    unsigned int v6 = [v5 getOutputPixelFormatForStream];
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (BOOL)getOutputPixelFormatWasGuessedForStream:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsStream:v4])
  {
    char v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    char v6 = [v5 getOutputPixelFormatWasGuessedForStream];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)trackTypeInfoForStream:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsStream:v4])
  {
    char v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    unint64_t v6 = [v5 trackTypeInfo];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)trackForStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 assetTrack];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)metadataTrackForStream:(id)a3
{
  id v4 = a3;
  if ([(MOVStreamReader *)self containsMetadataStream:v4])
  {
    char v5 = [(NSMutableDictionary *)self->_metadataStreams objectForKey:v4];
    unint64_t v6 = [v5 assetTrack];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (double)getFrameRateForStream:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([(MOVStreamReader *)self containsStream:v4])
  {
    unint64_t v6 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    double v7 = [v6 assetTrack];
    [v7 nominalFrameRate];
    double v5 = v8;
  }
  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)getMinFrameDurationForStream:(SEL)a3
{
  id v11 = a4;
  if (-[MOVStreamReader containsStream:](self, "containsStream:"))
  {
    unint64_t v6 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v11];
    double v7 = [v6 assetTrack];
    float v8 = v7;
    if (v7)
    {
      [v7 minFrameDuration];
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F01098];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x263F01098];
    retstr->var3 = *(void *)(v9 + 16);
  }

  return result;
}

- (unsigned)pixelFormatForStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  id v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 pixelFormatForStream];
  }
  else {
    unsigned int v5 = -1;
  }

  return v5;
}

- (void)removePixelBufferPadding:(BOOL)a3 forStream:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (-[MOVStreamReader containsStream:](self, "containsStream:"))
  {
    unint64_t v6 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v7];
    [v6 removePixelBufferPadding:v4];
  }
}

- (double)duration
{
  m_asset = self->m_asset;
  if (m_asset) {
    [(AVURLAsset *)m_asset duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return CMTimeGetSeconds(&time);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstPts
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F01098];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v4 = [(AVURLAsset *)self->m_asset tracks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        float v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        if ((retstr->var2 & 1) == 0) {
          goto LABEL_11;
        }
        if (v8)
        {
          [*(id *)(*((void *)&v15 + 1) + 8 * v7) timeRange];
        }
        else
        {
          long long v12 = 0u;
          long long v13 = 0u;
          long long v11 = 0u;
        }
        *(_OWORD *)&time1.value = v11;
        time1.epoch = v12;
        $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *retstr;
        if (CMTimeCompare(&time1, (CMTime *)&v10) < 0)
        {
LABEL_11:
          if (v8)
          {
            [v8 timeRange];
          }
          else
          {
            long long v12 = 0u;
            long long v13 = 0u;
            long long v11 = 0u;
          }
          *(_OWORD *)&retstr->var0 = v11;
          retstr->var3 = v12;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return result;
}

- (id)timestampsForStream:(id)a3 restrictedTimeRange:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MOVStreamTimestamps alloc];
  float v8 = [(MOVStreamReader *)self trackForStream:v6];
  long long v9 = *(_OWORD *)&a4->var0.var3;
  v12[0] = *(_OWORD *)&a4->var0.var0;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a4->var1.var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(MOVStreamTimestamps *)v7 initWithAssetTrack:v8 restrictedTimeRange:v12];

  return v10;
}

- (id)timestampsForStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MOVStreamTimestamps alloc];
  id v6 = [(MOVStreamReader *)self trackForStream:v4];
  uint64_t v7 = [(MOVStreamTimestamps *)v5 initWithAssetTrack:v6];

  return v7;
}

- (id)timestampsForMetadataStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MOVStreamTimestamps alloc];
  id v6 = [(MOVStreamReader *)self metadataTrackForStream:v4];
  uint64_t v7 = [(MOVStreamTimestamps *)v5 initWithAssetTrack:v6];

  [(MOVStreamTimestamps *)v7 setShouldStartTimestampsAtZero:0];

  return v7;
}

- (BOOL)containsStream:(id)a3 withMediaType:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)a4 >= 5) {
    char v7 = 0;
  }
  else {
    char v7 = [*(id *)((char *)&self->super.isa + *(void *)&a010l010l010l01[8 * a4 + 40]) containsObject:v6];
  }

  return v7;
}

- (BOOL)containsStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)containsMetadataStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metadataStreams objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)containsTimeRangeMetadataStream
{
  return self->_timeRangeMetadataSamples != 0;
}

- (id)getAllStreams
{
  v2 = (void *)[(NSMutableArray *)self->_orderedVideoStreamIds copy];

  return v2;
}

- (id)getAllAudioStreams
{
  v2 = (void *)[(NSMutableArray *)self->_orderedAudioStreamIds copy];

  return v2;
}

- (id)getAllSceneStreams
{
  v2 = (void *)[(NSMutableArray *)self->_orderedSceneStreamIds copy];

  return v2;
}

- (id)getAllTimeCodeStreams
{
  v2 = (void *)[(NSMutableArray *)self->_orderedTimeCodeStreamIds copy];

  return v2;
}

- (id)trackMetadataForAudioStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
  if ([v5 mediaType] == 1)
  {
    id v6 = [(MOVStreamReader *)self trackMetadataForStream:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)trackMetadataForSceneStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
  if ([v5 mediaType] == 3)
  {
    id v6 = [(MOVStreamReader *)self trackMetadataForStream:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)trackMetadataForTimeCodeStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
  if ([v5 mediaType] == 4)
  {
    id v6 = [(MOVStreamReader *)self trackMetadataForStream:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)trackMetadataForVideoStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
  if ([v5 mediaType])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(MOVStreamReader *)self trackMetadataForStream:v4];
  }

  return v6;
}

- (id)trackMetadataForStream:(id)a3 withMediaType:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    char v7 = [(MOVStreamReader *)self trackMetadataForMetadataStream:v6];
  }
  else
  {
    float v8 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v6];
    if ([v8 mediaType] == a4)
    {
      char v7 = [(MOVStreamReader *)self trackMetadataForStream:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)containsAudioStream:(id)a3
{
  return [(NSMutableArray *)self->_orderedAudioStreamIds containsObject:a3];
}

- (id)getAllMetadataStreams
{
  v2 = (void *)[(NSMutableArray *)self->_orderedMetadataStreamIds copy];

  return v2;
}

- (id)getUnknownMetadataStreamsAssociatedTo:(id)a3
{
  uint64_t v3 = [(MOVStreamReader *)self getMetadataStreamsAssociatedTo:a3 error:0];

  return v3;
}

- (id)getMetadataStreamsAssociatedTo:(id)a3
{
  uint64_t v3 = [(MOVStreamReader *)self getMetadataStreamsAssociatedTo:a3 error:0];

  return v3;
}

- (id)getMetadataStreamsAssociatedTo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v6];
  float v8 = v7;
  if (v7)
  {
    long long v9 = [v7 getAssociatedMetadataStreams];
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [NSString stringWithFormat:@"File doesn't contain stream '%@'.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:3];

    long long v9 = 0;
  }

  return v9;
}

- (id)outputForVideoStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x263F087E8] populateReaderError:a4 message:@"Missing stream id." code:7];
    id v10 = 0;
    goto LABEL_10;
  }
  char v7 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v6];
  float v8 = v7;
  if (v7)
  {
    if (![v7 mediaType])
    {
      id v10 = v8;
      goto LABEL_9;
    }
    long long v9 = [NSString stringWithFormat:@"Stream '%@' is not a video stream.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v9 code:7];
  }
  else
  {
    long long v9 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v9 code:7];
  }

  id v10 = 0;
LABEL_9:

LABEL_10:

  return v10;
}

- (id)outputForAudioStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x263F087E8] populateReaderError:a4 message:@"Missing stream id." code:7];
    id v9 = 0;
    goto LABEL_10;
  }
  char v7 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v6];
  float v8 = v7;
  if (!v7)
  {
    id v10 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];
LABEL_8:

    id v9 = 0;
    goto LABEL_9;
  }
  if ([v7 mediaType] != 1)
  {
    id v10 = [NSString stringWithFormat:@"Stream '%@' is not an audio stream.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];
    goto LABEL_8;
  }
  id v9 = v8;
LABEL_9:

LABEL_10:

  return v9;
}

- (id)outputForSceneStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x263F087E8] populateReaderError:a4 message:@"Missing stream id." code:7];
    id v9 = 0;
    goto LABEL_10;
  }
  char v7 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v6];
  float v8 = v7;
  if (!v7)
  {
    id v10 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];
LABEL_8:

    id v9 = 0;
    goto LABEL_9;
  }
  if ([v7 mediaType] != 3)
  {
    id v10 = [NSString stringWithFormat:@"Stream '%@' is not a scene stream.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];
    goto LABEL_8;
  }
  id v9 = v8;
LABEL_9:

LABEL_10:

  return v9;
}

- (id)outputForTimeCodeStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x263F087E8] populateReaderError:a4 message:@"Missing stream id." code:7];
    id v9 = 0;
    goto LABEL_10;
  }
  char v7 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v6];
  float v8 = v7;
  if (!v7)
  {
    id v10 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];
LABEL_8:

    id v9 = 0;
    goto LABEL_9;
  }
  if ([v7 mediaType] != 4)
  {
    id v10 = [NSString stringWithFormat:@"Stream '%@' is not a time code stream.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];
    goto LABEL_8;
  }
  id v9 = v8;
LABEL_9:

LABEL_10:

  return v9;
}

- (id)outputForMetadataStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x263F087E8] populateReaderError:a4 message:@"Missing stream id." code:7];
    id v9 = 0;
    goto LABEL_10;
  }
  char v7 = [(NSMutableDictionary *)self->_metadataStreams objectForKey:v6];
  float v8 = v7;
  if (!v7)
  {
    id v10 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];
LABEL_8:

    id v9 = 0;
    goto LABEL_9;
  }
  if ([v7 mediaType] != 2)
  {
    id v10 = [NSString stringWithFormat:@"Stream '%@' is not a metadata stream.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];
    goto LABEL_8;
  }
  id v9 = v8;
LABEL_9:

LABEL_10:

  return v9;
}

- (id)outputsRelatedToOutput:(id)a3 trackAssociation:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  char v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  float v8 = objc_msgSend(v5, "associatedOutputs", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v13 = [v12 objectAtIndexedSubscript:0];
        double v14 = [v13 nonretainedObjectValue];

        id v15 = [v12 objectAtIndexedSubscript:1];
        if (v15 == v6) {
          [v7 addObject:v14];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  long long v16 = (void *)[v7 copy];

  return v16;
}

- (opaqueCMSampleBuffer)nextSampleBufferForStream:(id)a3 attachmentsData:(id *)a4 timestamp:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  long long v11 = v10;
  if (a5)
  {
    long long v12 = *MEMORY[0x263F01098];
    a5->var3 = *(void *)(MEMORY[0x263F01098] + 16);
    *(_OWORD *)&a5->var0 = v12;
  }
  if (v10)
  {
    long long v13 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v10];
    double v14 = v13;
    if (v13)
    {
      id v15 = (opaqueCMSampleBuffer *)[v13 nextSampleBufferForStreamAttachmentsData:a4 timestamp:a5 error:a6];
    }
    else
    {
      long long v16 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v11];
      [MEMORY[0x263F087E8] populateReaderError:a6 message:v16 code:7];

      id v15 = 0;
    }
  }
  else
  {
    [MEMORY[0x263F087E8] populateReaderError:a6 message:@"Missing stream id for copy next frame." code:7];
    id v15 = 0;
  }

  return v15;
}

- (__CVBuffer)nextPixelBufferForStream:(id)a3 attachmentsData:(id *)a4 timestamp:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  long long v11 = v10;
  if (a5)
  {
    long long v12 = *MEMORY[0x263F01098];
    a5->var3 = *(void *)(MEMORY[0x263F01098] + 16);
    *(_OWORD *)&a5->var0 = v12;
  }
  if (v10)
  {
    long long v13 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v10];
    double v14 = v13;
    if (v13)
    {
      id v15 = (__CVBuffer *)[v13 nextPixelBufferForStreamAttachmentsData:a4 timestamp:a5 error:a6];
    }
    else
    {
      long long v16 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v11];
      [MEMORY[0x263F087E8] populateReaderError:a6 message:v16 code:7];

      id v15 = 0;
    }
  }
  else
  {
    [MEMORY[0x263F087E8] populateReaderError:a6 message:@"Missing stream id for copy next frame." code:7];
    id v15 = 0;
  }

  return v15;
}

- (BOOL)copyNextStereoFramesForStream:(id)a3 leftBuffer:(__CVBuffer *)a4 rightBuffer:(__CVBuffer *)a5 timestamp:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  if (v12)
  {
    long long v13 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v12];
    double v14 = v13;
    if (v13)
    {
      char v15 = [v13 copyNextStereoFrames:a4 rightBuffer:a5 timestamp:a6 error:a7];
    }
    else
    {
      long long v16 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v12];
      [MEMORY[0x263F087E8] populateReaderError:a7 message:v16 code:7];

      char v15 = 0;
    }
  }
  else
  {
    [MEMORY[0x263F087E8] populateReaderError:a7 message:@"Missing stream id for copy next frame." code:7];
    char v15 = 0;
  }

  return v15;
}

- (BOOL)isStereoStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  char v4 = [v3 isStereoVideoStream];

  return v4;
}

- (id)stereoLayersForStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  char v4 = [v3 videoLayerIds];

  return v4;
}

- (id)additionalCompressionPropertiesForStream:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:a3];
  char v4 = [v3 additionalCompressionProperties];

  return v4;
}

- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v8];
    id v10 = v9;
    if (v9)
    {
      if (![v9 isStereoVideoStream])
      {
        long long v11 = (__CVBuffer *)[v10 copyNextFrameForStreamTimestamp:a4 error:a5];
        goto LABEL_10;
      }
      CVPixelBufferRef texture = 0;
      char v15 = 0;
      if ([v10 copyNextStereoFrames:&v15 rightBuffer:&texture timestamp:a4 error:a5])
      {
        CVPixelBufferRelease(texture);
        long long v11 = v15;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      id v12 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v8];
      [MEMORY[0x263F087E8] populateReaderError:a5 message:v12 code:7];
    }
    long long v11 = 0;
    goto LABEL_10;
  }
  [MEMORY[0x263F087E8] populateReaderError:a5 message:@"Missing stream id for copy next frame." code:7];
  long long v11 = 0;
LABEL_11:

  return v11;
}

- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 timeCode:(CVSMPTETime *)a5 tcDropFrame:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  if (v12)
  {
    long long v13 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v12];
    double v14 = v13;
    if (v13)
    {
      char v15 = (__CVBuffer *)[v13 copyNextFrameForStreamTimestamp:a4 timeCode:a5 tcDropFrame:a6 error:a7];
      if (a5 && self->_timeRangeMetadataSamples && self->_timeRangeMetadataKey)
      {
        long long v16 = [(MOVStreamReader *)self timeRangeMetadataForPixelBuffer:v15];
        long long v17 = v16;
        if (v16)
        {
          [v16 timeCode];
          *(_OWORD *)&a5->subframes = v20;
          *(void *)&a5->hours = v21;
        }
        else
        {
          *(void *)&a5->subframes = 0;
          *(void *)&a5->type = 0;
          *(void *)&a5->hours = 0;
        }
      }
    }
    else
    {
      long long v18 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v12];
      [MEMORY[0x263F087E8] populateReaderError:a7 message:v18 code:7];

      char v15 = 0;
    }
  }
  else
  {
    [MEMORY[0x263F087E8] populateReaderError:a7 message:@"Missing stream id for copy next frame." code:7];
    char v15 = 0;
  }

  return v15;
}

- (CVSMPTETime)grabNextTimeCodeSampleForStream:(SEL)a3 timestamp:(id)a4 error:(id *)a5
{
  CGSize result = [(MOVStreamReader *)self grabNextSampleBufferForStream:a4 timestamp:a5 error:a6];
  if (result)
  {
    id v8 = result;
    char v9 = 0;
    *(void *)&retstr->type = 0;
    *(void *)&retstr->hours = 0;
    *(void *)&retstr->subframes = 0;
    +[MOVStreamIOUtility timecode32ForSampleBuffer:result dropFrame:&v9];
    CFRelease(v8);
  }
  else
  {
    *(void *)&retstr->subframes = 0;
    *(void *)&retstr->type = 0;
    *(void *)&retstr->hours = 0;
  }
  return result;
}

- (opaqueCMSampleBuffer)grabNextSampleBufferForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    char v9 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v8];
    id v10 = v9;
    if (v9)
    {
      long long v11 = (opaqueCMSampleBuffer *)[v9 grabNextSampleBufferForStreamTimestamp:a4 error:a5];
    }
    else
    {
      id v12 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v8];
      [MEMORY[0x263F087E8] populateReaderError:a5 message:v12 code:7];

      long long v11 = 0;
    }
  }
  else
  {
    [MEMORY[0x263F087E8] populateReaderError:a5 message:@"Missing stream id for copy next frame." code:7];
    long long v11 = 0;
  }

  return v11;
}

- (CVSMPTETime)grabNextTimeRangeMetadataSampleOfStream:(SEL)a3 startTime:(id)a4 endTime:(unint64_t *)a5 error:(unint64_t *)a6
{
  return [(MOVStreamReader *)self grabNextTimeRangeMetadataSampleOfStream:a4 rangeStartTime:a5 rangeEndTime:a6 presentationTimeRange:0 error:a7];
}

- (CVSMPTETime)grabNextTimeRangeMetadataSampleOfStream:(SEL)a3 rangeStartTime:(id)a4 rangeEndTime:(unint64_t *)a5 presentationTimeRange:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a4;
  if (v14)
  {
    id v39 = v14;
    char v15 = [(NSMutableDictionary *)self->_metadataStreams objectForKey:v14];
    v40 = v15;
    if (v15)
    {
      if ([v15 isTimeRangeMetadataStream])
      {
        long long v38 = [(MOVStreamReader *)self grabNextTimedMetadataGroupOfStream:v14 error:a8];
        if ([v40 endOfStreamReached])
        {
          *(void *)&retstr->subframes = 0;
          *(void *)&retstr->type = 0;
          *(void *)&retstr->hours = 0;
LABEL_40:

          goto LABEL_41;
        }
        [v38 items];
        long long v49 = 0uLL;
        uint64_t v50 = 0;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
        long long v36 = a8;
        long long v37 = retstr;
        if (v17)
        {
          long long v34 = a6;
          long long v35 = a7;
          unint64_t v18 = 0;
          uint64_t v19 = 0;
          int v20 = 0;
          uint64_t v21 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v46 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              objc_super v24 = [v23 identifier];
              int v25 = [@"mdta/com.apple.stream_time_code" isEqualToString:v24];

              if (v25)
              {
                if (v23)
                {
                  [v23 valueAsTimeCode];
                }
                else
                {
                  long long v42 = 0uLL;
                  *(void *)&long long v43 = 0;
                }
                v20 |= 1u;
                long long v49 = v42;
                uint64_t v50 = v43;
              }
              else
              {
                long long v26 = [v23 identifier];
                int v27 = [@"mdta/com.apple.stream_time_range_start" isEqualToString:v26];

                if (v27)
                {
                  uint64_t v28 = [v23 numberValue];
                  unint64_t v18 = [v28 unsignedLongLongValue];

                  v20 |= 2u;
                }
                else
                {
                  id v29 = [v23 identifier];
                  int v30 = [@"mdta/com.apple.stream_time_range_end" isEqualToString:v29];

                  if (v30)
                  {
                    uint64_t v31 = [v23 numberValue];
                    uint64_t v19 = [v31 unsignedLongLongValue];

                    v20 |= 4u;
                  }
                }
              }
            }
            uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
          }
          while (v17);

          if (v20 == 7)
          {
            if (a5) {
              *a5 = v18;
            }
            if (v34) {
              unint64_t *v34 = v19;
            }
            if (v35)
            {
              if (v38)
              {
                [v38 timeRange];
              }
              else
              {
                long long v43 = 0u;
                long long v44 = 0u;
                long long v42 = 0u;
              }
              *(_OWORD *)&v35->var0.var0 = v42;
              *(_OWORD *)&v35->var0.var3 = v43;
              *(_OWORD *)&v35->var1.var1 = v44;
            }
            *(_OWORD *)&v37->subframes = v49;
            *(void *)&v37->hours = v50;
            goto LABEL_39;
          }
        }
        else
        {
        }
        long long v32 = [NSString stringWithFormat:@"The metadata stream '%@' did not contain all metadata items to be time range metadata.", v39];
        [MEMORY[0x263F087E8] populateReaderError:v36 message:v32 code:31];
        *(void *)&v37->subframes = 0;
        *(void *)&v37->type = 0;
        *(void *)&v37->hours = 0;

LABEL_39:
        goto LABEL_40;
      }
      long long v16 = [NSString stringWithFormat:@"The metadata stream '%@' is not indicated as time range metadata.", v14];
      [MEMORY[0x263F087E8] populateReaderError:a8 message:v16 code:31];
    }
    else
    {
      long long v16 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v14];
      [MEMORY[0x263F087E8] populateReaderError:a8 message:v16 code:7];
    }
    *(void *)&retstr->subframes = 0;
    *(void *)&retstr->type = 0;
    *(void *)&retstr->hours = 0;

LABEL_41:
    id v14 = v39;
    goto LABEL_42;
  }
  [MEMORY[0x263F087E8] populateReaderError:a8 message:@"Missing stream id for copy next frame." code:7];
  *(void *)&retstr->subframes = 0;
  *(void *)&retstr->type = 0;
  *(void *)&retstr->hours = 0;
LABEL_42:

  return result;
}

- (id)grabNextMetadataOfStream:(id)a3 timeRange:(id *)a4
{
  char v4 = [(MOVStreamReader *)self grabNextMetadataOfStream:a3 timeRange:a4 error:0];

  return v4;
}

- (id)grabNextMetadataItemsOfTrackAssociatedWith:(id)a3 withIdentifier:(id)a4 timeRange:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    id v12 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v10];
    long long v13 = v12;
    if (v12)
    {
      id v14 = [v12 grabNextMetadataItemsOfTrackAssociatedWithStreamWithIdentifier:v11 timeRange:a5 error:a6];
    }
    else
    {
      char v15 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v10];
      [MEMORY[0x263F087E8] populateReaderError:a6 message:v15 code:7];

      id v14 = 0;
    }
  }
  else
  {
    [MEMORY[0x263F087E8] populateReaderError:a6 message:@"Missing stream id for copy next frame." code:7];
    id v14 = 0;
  }

  return v14;
}

- (id)nextAttachmentForStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    char v9 = [v7 nextAttachmentWithError:a4];
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"File doesn't contain data for requested stream '%@'.", v6];
    [MEMORY[0x263F087E8] populateReaderError:a4 message:v10 code:7];

    char v9 = 0;
  }

  return v9;
}

- (id)grabNextTimedMetadataGroupOfStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    char v7 = [(NSMutableDictionary *)self->_metadataStreams objectForKey:v6];
    id v8 = [v7 grabNextTimedMetadataGroupOfStreamError:a4];
  }
  else
  {
    [MEMORY[0x263F087E8] populateReaderError:a4 message:@"Missing stream id for copy next frame." code:7];
    id v8 = 0;
  }

  return v8;
}

- (id)grabNextMetadataOfStream:(id)a3 timeRange:(id *)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    char v9 = [(NSMutableDictionary *)self->_metadataStreams objectForKey:v8];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 grabNextMetadataOfStreamTimeRange:a4 error:a5];
LABEL_17:

      goto LABEL_18;
    }
    id v12 = [NSString stringWithFormat:@"Cannot grab metadata. Unknown metadata stream '%@'.", v8];
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] readerWarningWithMessage:v12 code:0];
    }
    if (+[MIOLog debugEnabled])
    {
      long long v13 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        long long v16 = v12;
        _os_log_impl(&dword_21B5ED000, v13, OS_LOG_TYPE_DEBUG, "⚠️⚠️⚠️ WARNING [MOVStreamReader]: %{public}@ ⚠️⚠️⚠️", buf, 0xCu);
      }
    }
LABEL_16:
    id v11 = 0;
    goto LABEL_17;
  }
  if (a5)
  {
    *a5 = [MEMORY[0x263F087E8] readerWarningWithMessage:@"Cannot grab metadata. Missing metadata stream id." code:0];
  }
  if (+[MIOLog debugEnabled])
  {
    id v10 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      long long v16 = @"Cannot grab metadata. Missing metadata stream id.";
      _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_DEBUG, "⚠️⚠️⚠️ WARNING [MOVStreamReader]: %{public}@ ⚠️⚠️⚠️", buf, 0xCu);
    }
    goto LABEL_16;
  }
  id v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)endOfStream
{
  return [(AVAssetReader *)self->m_assetReader status] != AVAssetReaderStatusReading;
}

- (BOOL)hasFinishedReading
{
  return [(AVAssetReader *)self->m_assetReader status] != AVAssetReaderStatusReading;
}

- (BOOL)hasReachedEndOfStream:(id)a3
{
  id v4 = a3;
  if (v4 && [(MOVStreamReader *)self containsStream:v4])
  {
    id v5 = [(NSMutableDictionary *)self->_sampleStreams objectForKey:v4];
    char v6 = [v5 endOfStreamReached];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)hasReachedEndOfMetadataStream:(id)a3
{
  id v4 = a3;
  if (v4 && [(MOVStreamReader *)self containsMetadataStream:v4])
  {
    id v5 = [(NSMutableDictionary *)self->_metadataStreams objectForKey:v4];
    char v6 = [v5 endOfStreamReached];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)skipEmptyEditVideoFrame
{
  return self->_skipEmptyEditVideoFrame;
}

- (void)setSkipEmptyEditVideoFrame:(BOOL)a3
{
  self->_skipEmptyEditVideoFrame = a3;
}

- (BOOL)restrictVideoFramesToEdits
{
  return self->_restrictVideoFramesToEdits;
}

- (void)setRestrictVideoFramesToEdits:(BOOL)a3
{
  self->_restrictVideoFramesToEdits = a3;
}

- (NSString)timeRangeMetadataKey
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTimeRangeMetadataKey:(id)a3
{
}

- (MOVStreamReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MOVStreamReaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeRangeMetadataKey, 0);
  objc_storeStrong((id *)&self->_timeRangeMetadataSamples, 0);
  objc_storeStrong((id *)&self->_timeRangeMetadataStream, 0);
  objc_storeStrong((id *)&self->_movVersion, 0);
  objc_storeStrong((id *)&self->_orderedMetadataStreamIds, 0);
  objc_storeStrong((id *)&self->_metadataStreams, 0);
  objc_storeStrong((id *)&self->_orderedTimeCodeStreamIds, 0);
  objc_storeStrong((id *)&self->_orderedSceneStreamIds, 0);
  objc_storeStrong((id *)&self->_orderedAudioStreamIds, 0);
  objc_storeStrong((id *)&self->_orderedVideoStreamIds, 0);
  objc_storeStrong((id *)&self->_sampleStreams, 0);
  objc_storeStrong((id *)&self->m_assetReader, 0);

  objc_storeStrong((id *)&self->m_asset, 0);
}

@end