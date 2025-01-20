@interface MOVStreamReaderStreamOutput
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureAttachmentsDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureAttachmentsPts;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureTimeCodePts;
- (AVAssetReader)assetReader;
- (AVAssetReaderOutputMetadataAdaptor)attachmentsAdaptor;
- (AVAssetReaderOutputMetadataAdaptor)metadataTrackMetadataAdaptor;
- (AVAssetReaderTrackOutput)streamOutput;
- (AVAssetTrack)assetTrack;
- (BOOL)addAssociatedMetadataTracks:(id)a3 rawSampleAttachmentsIdentifier:(id)a4 trackKindIdentifier:(id)a5 movVersion:(id)a6 error:(id *)a7;
- (BOOL)alwaysCopiesSampleDataForStream;
- (BOOL)copyNextStereoFrames:(__CVBuffer *)a3 rightBuffer:(__CVBuffer *)a4 timestamp:(id *)a5 error:(id *)a6;
- (BOOL)customMetadataFormat;
- (BOOL)determineStereoLayerIDs:(id)a3;
- (BOOL)endOfStreamReached;
- (BOOL)firstVideoFrameRead;
- (BOOL)formatDescriptionOfTrack:(id)a3 containsKey:(id)a4;
- (BOOL)formatDescriptionOfTrack:(id)a3 containsKeyFromIndentifier:(id)a4;
- (BOOL)getOutputPixelFormatWasGuessedForStream;
- (BOOL)hasTimeCode;
- (BOOL)isEmptySample:(opaqueCMSampleBuffer *)a3;
- (BOOL)isLegacyIMUTrack;
- (BOOL)isMIOStream;
- (BOOL)isSampleInEdit:(opaqueCMSampleBuffer *)a3;
- (BOOL)isStereoVideoStream;
- (BOOL)isTimeRangeMetadataStream;
- (BOOL)pixelFormatWasGuessed;
- (BOOL)shouldDiscardStream:(id)a3 mediaType:(int64_t)a4 track:(id)a5;
- (BOOL)stereoFramesFromSampleBuffer:(opaqueCMSampleBuffer *)a3 outLeft:(__CVBuffer *)a4 outRight:(__CVBuffer *)a5 error:(id *)a6;
- (BOOL)synthesizedTimeCodeIsDropFrame;
- (BOOL)timeCodeIsSynthesized;
- (CGAffineTransform)transform;
- (MIOSEITrackReader)seiTrackReader;
- (MIOVersion)version;
- (MOVStreamPostProcessor)postProcessor;
- (MOVStreamReader)reader;
- (MOVStreamReaderDelegate)delegate;
- (MOVStreamReaderStreamOutput)init;
- (MOVStreamReaderStreamOutput)initWithAudioTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10;
- (MOVStreamReaderStreamOutput)initWithMetadataTrack:(id)a3 assetReader:(id)a4 version:(id)a5 unknownStreamId:(id)a6 reader:(id)a7 delegate:(id)a8 error:(id *)a9;
- (MOVStreamReaderStreamOutput)initWithSceneTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10;
- (MOVStreamReaderStreamOutput)initWithTimeCodeTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10;
- (MOVStreamReaderStreamOutput)initWithVideoTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 bufferCacheMode:(int)a7 unknownStreamId:(id)a8 reader:(id)a9 delegate:(id)a10 error:(id *)a11;
- (NSArray)associatedOutputs;
- (NSArray)futureAttachmentsData;
- (NSArray)videoLayerIds;
- (NSDictionary)additionalCompressionProperties;
- (NSDictionary)associatedMetadataOutputs;
- (NSDictionary)synthesizedTimeCodes;
- (NSString)attachmentsIdentifier;
- (NSString)relatedStreamId;
- (NSString)relationSpecifier;
- (NSString)streamId;
- (NSString)trackKindIdentifier;
- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 error:(id *)a4;
- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 readTimeCode:(BOOL)a4 timeCode:(CVSMPTETime *)a5 tcDropFrame:(BOOL *)a6 error:(id *)a7;
- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 timeCode:(CVSMPTETime *)a4 tcDropFrame:(BOOL *)a5 error:(id *)a6;
- (__CVBuffer)nextPixelBufferForStreamAttachmentsData:(id *)a3 timestamp:(id *)a4 error:(id *)a5;
- (id)attachmentsDataForStreamPts:(id *)a3 duration:(id *)a4;
- (id)customTrackMetadata;
- (id)customTrackMetadataItems;
- (id)decodeAttachmentsData:(id)a3 error:(id *)a4;
- (id)findTimeCodeTrackAssociatedWithTrack:(id)a3;
- (id)findTracksAssociatedWithTimeCodeTrack:(id)a3;
- (id)getAssociatedMetadataStreamOutputForMetadataStreamId:(id)a3;
- (id)getAssociatedMetadataStreamOutputs;
- (id)getAssociatedMetadataStreams;
- (id)grabNextMetadataItemsOfTrackAssociatedWithStreamWithIdentifier:(id)a3 timeRange:(id *)a4 error:(id *)a5;
- (id)grabNextMetadataItemsTimeRange:(id *)a3 error:(id *)a4;
- (id)grabNextMetadataOfStreamTimeRange:(id *)a3 error:(id *)a4;
- (id)grabNextTimedMetadataGroupOfStreamError:(id *)a3;
- (id)nextAttachmentWithError:(id *)a3;
- (id)streamIdFromTrackStreamTypeIdentifier:(id)a3;
- (id)timestamps;
- (id)verifyStreamId:(id)a3 ofType:(int64_t)a4;
- (int)attachmentSerializationMode;
- (int)playbackPixelFormatForTrack:(id)a3 ofStream:(id)a4 delegate:(id)a5;
- (int)playbackPixelFormatForTrack:(id)a3 ofStream:(id)a4 streamEncodingType:(id)a5 inputPixelFormat:(unsigned int)a6 delegate:(id)a7;
- (int64_t)mediaType;
- (opaqueCMFormatDescription)timeCodeFormatDescription;
- (opaqueCMSampleBuffer)futureTimeCodeBuffer;
- (opaqueCMSampleBuffer)grabNextSampleBufferForStreamTimestamp:(id *)a3 error:(id *)a4;
- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 readTimeCode:(BOOL)a4 timecodeSampleBuffer:(opaqueCMSampleBuffer *)a5 timestamp:(id *)a6 error:(id *)a7;
- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 readTimeCode:(BOOL)a4 timestamp:(id *)a5 error:(id *)a6;
- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 timestamp:(id *)a4 error:(id *)a5;
- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsDataArray:(id *)a3 readTimeCode:(BOOL)a4 timecodeSampleBuffer:(opaqueCMSampleBuffer *)a5 timestamp:(id *)a6 error:(id *)a7;
- (opaqueCMSampleBuffer)timeCodeBufferForStream:(id *)a3;
- (unint64_t)trackTypeInfo;
- (unsigned)determinedPixelFormat;
- (unsigned)getOutputPixelFormatForStream;
- (unsigned)originalPixelFormat;
- (unsigned)pixelFormatForStream;
- (void)parseTrackMetadata:(id)a3 version:(id)a4 unknownStreamId:(id)a5;
- (void)registerForAssociating:(id)a3 trackRelation:(id)a4;
- (void)removePixelBufferPadding:(BOOL)a3;
- (void)setAdditionalCompressionProperties:(id)a3;
- (void)setAssetReader:(id)a3;
- (void)setAssetTrack:(id)a3;
- (void)setAssociatedMetadataOutputs:(id)a3;
- (void)setAttachmentSerializationMode:(int)a3;
- (void)setAttachmentsAdaptor:(id)a3;
- (void)setAttachmentsIdentifier:(id)a3;
- (void)setCustomMetadataFormat:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeterminedPixelFormat:(unsigned int)a3;
- (void)setEndOfStreamReached:(BOOL)a3;
- (void)setFirstVideoFrameRead:(BOOL)a3;
- (void)setFutureAttachmentsData:(id)a3;
- (void)setFutureAttachmentsDuration:(id *)a3;
- (void)setFutureAttachmentsPts:(id *)a3;
- (void)setFutureTimeCodeBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setFutureTimeCodePts:(id *)a3;
- (void)setHasTimeCode:(BOOL)a3;
- (void)setIsLegacyIMUTrack:(BOOL)a3;
- (void)setIsMIOStream:(BOOL)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setMetadataTrackMetadataAdaptor:(id)a3;
- (void)setOriginalPixelFormat:(unsigned int)a3;
- (void)setPixelFormatWasGuessed:(BOOL)a3;
- (void)setPostProcessor:(id)a3;
- (void)setReader:(id)a3;
- (void)setRelatedStreamId:(id)a3;
- (void)setRelationSpecifier:(id)a3;
- (void)setSeiTrackReader:(id)a3;
- (void)setStereoVideoStream:(BOOL)a3;
- (void)setStreamId:(id)a3;
- (void)setStreamOutput:(id)a3;
- (void)setSynthesizedTimeCodeIsDropFrame:(BOOL)a3;
- (void)setSynthesizedTimeCodes:(id)a3;
- (void)setTimeRangeMetadataStream:(BOOL)a3;
- (void)setTrackKindIdentifier:(id)a3;
- (void)setTrackTypeInfo:(unint64_t)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setVersion:(id)a3;
- (void)setVideoLayerIds:(id)a3;
- (void)useDefaultMIOLayerIds;
@end

@implementation MOVStreamReaderStreamOutput

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  p_var1 = (CMTime *)&self->var1;
  if ((self->var3 & 0x100000000) == 0)
  {
    v5 = self;
    v6 = [($3CC8671D27C23BF42ADDB32F2B5E48AE *)self assetTrack];
    v7 = v6;
    if (v6)
    {
      [v6 minFrameDuration];

      if (v11.flags)
      {
        v8 = [($3CC8671D27C23BF42ADDB32F2B5E48AE *)v5 assetTrack];
        v9 = v8;
        if (v8) {
          [v8 minFrameDuration];
        }
        else {
          memset(&v11, 0, sizeof(v11));
        }
        goto LABEL_8;
      }
    }
    else
    {
    }
    v9 = [($3CC8671D27C23BF42ADDB32F2B5E48AE *)v5 assetTrack];
    [v9 nominalFrameRate];
    CMTimeMakeWithSeconds(&v11, 1.0 / v10, 16800);
LABEL_8:
    CMTime *p_var1 = v11;
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_var1->value;
  retstr->var3 = p_var1->epoch;
  return self;
}

- (BOOL)timeCodeIsSynthesized
{
  v3 = [(MOVStreamReaderStreamOutput *)self synthesizedTimeCodes];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(MOVStreamReaderStreamOutput *)self->_timeCodeOutput timeCodeIsSynthesized];
  }

  return v4;
}

- (NSArray)associatedOutputs
{
  v2 = (void *)[(NSMutableArray *)self->_associatedOutputs copy];

  return (NSArray *)v2;
}

- (MOVStreamReaderStreamOutput)init
{
  v8.receiver = self;
  v8.super_class = (Class)MOVStreamReaderStreamOutput;
  v2 = [(MOVStreamReaderStreamOutput *)&v8 init];
  v3 = (MOVStreamReaderStreamOutput *)v2;
  if (v2)
  {
    long long v4 = *MEMORY[0x263F01098];
    *((void *)v2 + 3) = *(void *)(MEMORY[0x263F01098] + 16);
    *(_OWORD *)(v2 + 8) = v4;
    [v2 setFirstVideoFrameRead:0];
    uint64_t v5 = objc_opt_new();
    associatedOutputs = v3->_associatedOutputs;
    v3->_associatedOutputs = (NSMutableArray *)v5;
  }
  return v3;
}

- (void)parseTrackMetadata:(id)a3 version:(id)a4 unknownStreamId:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v36 = a4;
  id v37 = a5;
  v9 = [v36 versionedKey:@"mdta/com.apple.track_kind" modifier:0];
  v46 = [v36 versionedKey:@"mdta/com.apple.stream_sample_format" modifier:0];
  v45 = [v36 versionedKey:@"mdta/com.apple.stream_encoded_sample_format" modifier:0];
  v43 = [v36 versionedKey:@"mdta/com.apple.stream_sample_attachments_serialization_mode" modifier:0];
  v41 = [v36 versionedKey:@"mdta/com.apple.stream_type_info" modifier:0];
  v38 = [v36 versionedKey:@"mdta/com.apple.stream_sample_attachments" modifier:0];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  uint64_t v39 = 0;
  if (!v10)
  {

    v47 = 0;
    unsigned int v44 = 0;
    unsigned int v42 = 0;
    unsigned int v40 = 0;
    goto LABEL_28;
  }
  CMTime v11 = 0;
  unsigned int v40 = 0;
  unsigned int v42 = 0;
  unsigned int v44 = 0;
  v47 = 0;
  uint64_t v12 = *(void *)v50;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v50 != v12) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      v15 = [v14 identifier];
      int v16 = [v9 isEqualToString:v15];

      if (v16)
      {
        v17 = [v14 value];
        if (+[MIOLog debugEnabled])
        {
          v18 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v54 = (uint64_t)v17;
            _os_log_impl(&dword_21B5ED000, v18, OS_LOG_TYPE_DEBUG, "Detected %{public}@ stream", buf, 0xCu);
          }
        }
        uint64_t v19 = [(MOVStreamReaderStreamOutput *)self streamIdFromTrackStreamTypeIdentifier:v17];

        CMTime v11 = (void *)v19;
      }
      else
      {
        v20 = [v14 identifier];
        int v21 = [@"mdta/com.apple.trackStreamEncoding" isEqualToString:v20];

        if (v21)
        {
          [v14 value];
          v47 = v17 = v47;
        }
        else
        {
          v22 = [v14 identifier];
          int v23 = [v46 isEqualToString:v22];

          if (v23)
          {
            v17 = [v14 value];
            unsigned int v44 = [v17 intValue];
          }
          else
          {
            v24 = [v14 identifier];
            int v25 = [v45 isEqualToString:v24];

            if (v25)
            {
              v17 = [v14 value];
              unsigned int v42 = [v17 intValue];
            }
            else
            {
              v26 = [v14 identifier];
              int v27 = [v43 isEqualToString:v26];

              if (v27)
              {
                v17 = [v14 value];
                unsigned int v40 = [v17 intValue];
              }
              else
              {
                v28 = [v14 identifier];
                int v29 = [v41 isEqualToString:v28];

                if (!v29) {
                  continue;
                }
                v17 = [v14 value];
                uint64_t v39 = [v17 longValue];
              }
            }
          }
        }
      }
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  }
  while (v10);

  if (v11)
  {
    [(MOVStreamReaderStreamOutput *)self setStreamId:v11];
    [(MOVStreamReaderStreamOutput *)self setIsMIOStream:1];
    goto LABEL_34;
  }
LABEL_28:
  v30 = [(MOVStreamReaderStreamOutput *)self assetTrack];
  v31 = +[MIOMovieMetadataUtility findStreamIdFromQTTagsOfTrack:v30];

  if (v31)
  {
    v32 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = [v31 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v54 = v33;
      _os_log_impl(&dword_21B5ED000, v32, OS_LOG_TYPE_INFO, "QT track name detected: %s", buf, 0xCu);
    }

    [(MOVStreamReaderStreamOutput *)self setStreamId:v31];
  }
  else
  {
    [(MOVStreamReaderStreamOutput *)self setStreamId:v37];
  }

  CMTime v11 = 0;
LABEL_34:
  v34 = [(MOVStreamReaderStreamOutput *)self streamId];
  v35 = [(MOVStreamReaderStreamOutput *)self verifyStreamId:v34 ofType:[(MOVStreamReaderStreamOutput *)self mediaType]];
  [(MOVStreamReaderStreamOutput *)self setStreamId:v35];

  [(MOVStreamReaderStreamOutput *)self setOriginalPixelFormat:v44];
  [(MOVStreamReaderStreamOutput *)self setDeterminedPixelFormat:v42];
  [(MOVStreamReaderStreamOutput *)self setAttachmentSerializationMode:v40];
  [(MOVStreamReaderStreamOutput *)self setRelatedStreamId:0];
  [(MOVStreamReaderStreamOutput *)self setRelationSpecifier:0];
  [(MOVStreamReaderStreamOutput *)self setTrackTypeInfo:v39];
  [(MOVStreamReaderStreamOutput *)self setAttachmentsIdentifier:v38];
  [(MOVStreamReaderStreamOutput *)self setTrackKindIdentifier:v9];
}

- (MOVStreamReaderStreamOutput)initWithAudioTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v38 = a5;
  id v18 = a6;
  id v39 = a7;
  id v19 = a8;
  id v20 = a9;
  int v21 = [(MOVStreamReaderStreamOutput *)self init];
  v22 = v21;
  if (!v21) {
    goto LABEL_7;
  }
  v21->_mediaType = 1;
  [(MOVStreamReaderStreamOutput *)v21 setVersion:v18];
  [(MOVStreamReaderStreamOutput *)v22 setDelegate:v20];
  [(MOVStreamReaderStreamOutput *)v22 setReader:v19];
  [(MOVStreamReaderStreamOutput *)v22 setAssetReader:v17];
  [(MOVStreamReaderStreamOutput *)v22 setAssetTrack:v16];
  int v23 = [v16 metadata];
  [(MOVStreamReaderStreamOutput *)v22 parseTrackMetadata:v23 version:v18 unknownStreamId:v39];
  v24 = [(MOVStreamReaderStreamOutput *)v22 streamId];
  int v25 = [(MOVStreamReaderStreamOutput *)v22 assetTrack];
  BOOL v26 = [(MOVStreamReaderStreamOutput *)v22 shouldDiscardStream:v24 mediaType:1 track:v25];

  if (!v26)
  {
    id v37 = v17;
    v28 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v16 outputSettings:0];
    int v29 = [(MOVStreamReaderStreamOutput *)v22 assetReader];
    int v30 = [v29 canAddOutput:v28];

    if (!v30)
    {
      v35 = [NSString stringWithFormat:@"Can't add audio track (%@) to the AVAssetReader.", v16];
      [MEMORY[0x263F087E8] populateReaderError:a10 message:v35 code:1];

      int v27 = 0;
      id v17 = v37;
      goto LABEL_9;
    }
    v31 = [(MOVStreamReaderStreamOutput *)v22 assetReader];
    [v31 addOutput:v28];

    [(MOVStreamReaderStreamOutput *)v22 setStreamOutput:v28];
    [(MOVStreamReaderStreamOutput *)v22 setPostProcessor:0];
    v32 = [(MOVStreamReaderStreamOutput *)v22 attachmentsIdentifier];
    uint64_t v33 = [(MOVStreamReaderStreamOutput *)v22 trackKindIdentifier];
    BOOL v34 = [(MOVStreamReaderStreamOutput *)v22 addAssociatedMetadataTracks:v38 rawSampleAttachmentsIdentifier:v32 trackKindIdentifier:v33 movVersion:v18 error:a10];

    id v17 = v37;
    if (!v34) {
      goto LABEL_4;
    }
LABEL_7:
    int v27 = v22;
    goto LABEL_9;
  }

LABEL_4:
  int v27 = 0;
LABEL_9:

  return v27;
}

- (MOVStreamReaderStreamOutput)initWithSceneTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v38 = a4;
  id v37 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  int v21 = [(MOVStreamReaderStreamOutput *)self init];
  v22 = v21;
  if (!v21) {
    goto LABEL_10;
  }
  v21->_mediaType = 3;
  [(MOVStreamReaderStreamOutput *)v21 setVersion:v17];
  [(MOVStreamReaderStreamOutput *)v22 setDelegate:v20];
  [(MOVStreamReaderStreamOutput *)v22 setReader:v19];
  [(MOVStreamReaderStreamOutput *)v22 setAssetReader:v38];
  [(MOVStreamReaderStreamOutput *)v22 setAssetTrack:v16];
  int v23 = [v16 metadata];
  [(MOVStreamReaderStreamOutput *)v22 parseTrackMetadata:v23 version:v17 unknownStreamId:v18];
  v24 = [(MOVStreamReaderStreamOutput *)v22 streamId];
  int v25 = [(MOVStreamReaderStreamOutput *)v22 assetTrack];
  BOOL v26 = [(MOVStreamReaderStreamOutput *)v22 shouldDiscardStream:v24 mediaType:3 track:v25];

  if (v26)
  {
LABEL_12:

    BOOL v34 = 0;
    goto LABEL_13;
  }
  id v36 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v16 outputSettings:0];
  int v27 = [(MOVStreamReaderStreamOutput *)v22 assetReader];
  int v28 = [v27 canAddOutput:v36];

  if (!v28)
  {
    int v30 = [NSString stringWithFormat:@"Can't add output for scene track (%@) to the AVAssetReader.", v16];
    [MEMORY[0x263F087E8] populateReaderError:a10 message:v30 code:1];

LABEL_11:
    goto LABEL_12;
  }
  int v29 = [(MOVStreamReaderStreamOutput *)v22 assetReader];
  [v29 addOutput:v36];

  [(MOVStreamReaderStreamOutput *)v22 setStreamOutput:v36];
  if (v16)
  {
    [v16 preferredTransform];
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
  }
  v39[0] = v40;
  v39[1] = v41;
  v39[2] = v42;
  [(MOVStreamReaderStreamOutput *)v22 setTransform:v39];
  v31 = [(MOVStreamReaderStreamOutput *)v22 attachmentsIdentifier];
  v32 = [(MOVStreamReaderStreamOutput *)v22 trackKindIdentifier];
  BOOL v33 = [(MOVStreamReaderStreamOutput *)v22 addAssociatedMetadataTracks:v37 rawSampleAttachmentsIdentifier:v31 trackKindIdentifier:v32 movVersion:v17 error:a10];

  if (!v33) {
    goto LABEL_11;
  }

LABEL_10:
  BOOL v34 = v22;
LABEL_13:

  return v34;
}

- (MOVStreamReaderStreamOutput)initWithMetadataTrack:(id)a3 assetReader:(id)a4 version:(id)a5 unknownStreamId:(id)a6 reader:(id)a7 delegate:(id)a8 error:(id *)a9
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v72 = a3;
  id v66 = a4;
  id v69 = a5;
  id v65 = a6;
  id v67 = a7;
  id v68 = a8;
  v15 = [(MOVStreamReaderStreamOutput *)self init];
  id v16 = v15;
  if (!v15) {
    goto LABEL_66;
  }
  v15->_mediaType = 2;
  [(MOVStreamReaderStreamOutput *)v15 setVersion:v69];
  [(MOVStreamReaderStreamOutput *)v16 setDelegate:v68];
  [(MOVStreamReaderStreamOutput *)v16 setReader:v67];
  [(MOVStreamReaderStreamOutput *)v16 setAssetReader:v66];
  [(MOVStreamReaderStreamOutput *)v16 setAssetTrack:v72];
  v70 = [v69 versionedKey:@"mdta/com.apple.track_kind" modifier:@"metadata"];
  id v17 = [v69 versionedKey:@"mdta/com.apple.stream_time_range_metadata" modifier:0];
  id v18 = [v69 versionedKey:@"mdta/com.apple.stream_sample_attachments" modifier:0];
  v63 = v18;
  id v19 = [v18 componentsSeparatedByString:@"/"];
  v64 = v19;
  if ([v19 count] != 2)
  {
    int v21 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v84 = (uint64_t)v18;
      _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_ERROR, "Invalid 'kRawSampleBufferAttachmentsIdentifier': %@", buf, 0xCu);
    }

LABEL_9:
    [v72 metadata];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v78;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v78 != v23) {
            objc_enumerationMutation(obj);
          }
          int v25 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          BOOL v26 = [v25 identifier];
          int v27 = [@"mdta/com.apple.imuTrackType" isEqualToString:v26];

          if (v27)
          {
            int v28 = [v25 value];
            if (+[MIOLog debugEnabled])
            {
              int v29 = +[MIOLog defaultLog];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v84 = (uint64_t)v28;
                _os_log_impl(&dword_21B5ED000, v29, OS_LOG_TYPE_DEBUG, "Detected %{public}@ IMU data type", buf, 0xCu);
              }
            }
            if ([v28 isEqualToString:@"DeviceMotion"])
            {
              BOOL v34 = @"DeviceMotion";
LABEL_33:

              unsigned int v62 = 1;
              goto LABEL_34;
            }
            if ([v28 isEqualToString:@"RawGyro"])
            {
              BOOL v34 = @"RawGyro";
              goto LABEL_33;
            }
            if ([v28 isEqualToString:@"RawAccel"])
            {
              BOOL v34 = @"RawAccel";
              goto LABEL_33;
            }
            int v30 = [NSString stringWithFormat:@"Unknown IMU data type, ignoring: '%@'", v28];
            id v31 = (id)[MEMORY[0x263F087E8] readerWarningWithMessage:v30 code:0];
          }
          else
          {
            v32 = [v25 identifier];
            int v33 = [v70 isEqualToString:v32];

            if (v33)
            {
              BOOL v34 = [v25 value];
              goto LABEL_29;
            }
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
        BOOL v34 = 0;
        unsigned int v62 = 0;
        if (v22) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v34 = 0;
LABEL_29:
      unsigned int v62 = 0;
    }
LABEL_34:

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v20 = obj;
    uint64_t v35 = [v20 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v74 != v36) {
            objc_enumerationMutation(v20);
          }
          id v38 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          id v39 = [v38 identifier];
          int v40 = [v17 isEqualToString:v39];

          if (v40)
          {
            long long v41 = [v38 numberValue];
            v16->_timeRangeMetadataStream = [v41 BOOLValue];
          }
        }
        uint64_t v35 = [v20 countByEnumeratingWithState:&v73 objects:v81 count:16];
      }
      while (v35);
    }

    long long v42 = +[MIOVersion versionZero];
    v43 = [v42 versionedKey:@"mdta/com.apple.metadata_stream_item" modifier:0];

    if (![(MOVStreamReaderStreamOutput *)v16 formatDescriptionOfTrack:v72 containsKeyFromIndentifier:@"mdta/com.apple.metadata_stream_item"]&& ![(MOVStreamReaderStreamOutput *)v16 formatDescriptionOfTrack:v72 containsKeyFromIndentifier:v43])
    {
      char v44 = v16->_timeRangeMetadataStream ? 1 : v62;
      if ((v44 & 1) == 0) {
        [(MOVStreamReaderStreamOutput *)v16 setCustomMetadataFormat:1];
      }
    }
    if (!v34)
    {
      v45 = [(MOVStreamReaderStreamOutput *)v16 assetTrack];
      BOOL v34 = +[MIOMovieMetadataUtility findStreamIdFromQTTagsOfTrack:v45];

      if (v34)
      {
        v46 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          uint64_t v47 = [(__CFString *)v34 UTF8String];
          *(_DWORD *)buf = 136315138;
          uint64_t v84 = v47;
          _os_log_impl(&dword_21B5ED000, v46, OS_LOG_TYPE_INFO, "QT track name detected: %s", buf, 0xCu);
        }
      }
      else
      {
        if (!v65)
        {
          BOOL v34 = 0;
          goto LABEL_58;
        }
        BOOL v34 = (__CFString *)v65;
      }
    }
    v48 = [(MOVStreamReaderStreamOutput *)v16 assetTrack];
    BOOL v49 = [(MOVStreamReaderStreamOutput *)v16 shouldDiscardStream:v34 mediaType:2 track:v48];

    if (!v49)
    {
      long long v51 = (void *)[objc_alloc(MEMORY[0x263EFA4D8]) initWithTrack:v72 outputSettings:0];
      long long v52 = [(MOVStreamReaderStreamOutput *)v16 assetReader];
      int v53 = [v52 canAddOutput:v51];

      if (v53)
      {
        uint64_t v54 = [(MOVStreamReaderStreamOutput *)v16 assetReader];
        [v54 addOutput:v51];

        [(MOVStreamReaderStreamOutput *)v16 setStreamOutput:v51];
        [(MOVStreamReaderStreamOutput *)v16 setIsLegacyIMUTrack:v62];
        id v55 = objc_alloc(MEMORY[0x263EFA4D0]);
        uint64_t v56 = [(MOVStreamReaderStreamOutput *)v16 streamOutput];
        v57 = (void *)[v55 initWithAssetReaderTrackOutput:v56];
        [(MOVStreamReaderStreamOutput *)v16 setMetadataTrackMetadataAdaptor:v57];

        uint64_t v58 = [(MOVStreamReaderStreamOutput *)v16 verifyStreamId:v34 ofType:2];

        [(MOVStreamReaderStreamOutput *)v16 setStreamId:v58];
        int v50 = 0;
        BOOL v34 = (__CFString *)v58;
      }
      else
      {
        v59 = [NSString stringWithFormat:@"Can't add metadata track (%@) to the AVAssetReader.", v72];
        [MEMORY[0x263F087E8] populateReaderError:a9 message:v59 code:1];

        int v50 = 1;
      }

      goto LABEL_63;
    }
LABEL_58:
    int v50 = 1;
LABEL_63:

    goto LABEL_64;
  }
  id v20 = [v19 lastObject];
  if (!-[MOVStreamReaderStreamOutput formatDescriptionOfTrack:containsKey:](v16, "formatDescriptionOfTrack:containsKey:", v72, v20)|| [v72 totalSampleDataLength])
  {

    goto LABEL_9;
  }
  BOOL v34 = +[MIOLog defaultLog];
  int v50 = 1;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = [v72 trackID];
    _os_log_impl(&dword_21B5ED000, (os_log_t)v34, OS_LOG_TYPE_INFO, "Found empty abandoned associated metadata track (Track id: %d), > ignoring.", buf, 8u);
  }
LABEL_64:

  if (!v50)
  {
LABEL_66:
    v60 = v16;
    goto LABEL_67;
  }
  v60 = 0;
LABEL_67:

  return v60;
}

- (MOVStreamReaderStreamOutput)initWithTimeCodeTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v68 = a3;
  id v65 = a4;
  id v61 = a5;
  id v66 = a6;
  id v62 = a7;
  id v63 = a8;
  id v64 = a9;
  id v16 = [(MOVStreamReaderStreamOutput *)self init];
  id v17 = v16;
  id v67 = v16;
  if (!v16) {
    goto LABEL_21;
  }
  v16->_mediaType = 4;
  [(MOVStreamReaderStreamOutput *)v16 setVersion:v66];
  [(MOVStreamReaderStreamOutput *)v17 setDelegate:v64];
  [(MOVStreamReaderStreamOutput *)v17 setReader:v63];
  [(MOVStreamReaderStreamOutput *)v17 setAssetReader:v65];
  [(MOVStreamReaderStreamOutput *)v17 setAssetTrack:v68];
  v60 = [v68 metadata];
  -[MOVStreamReaderStreamOutput parseTrackMetadata:version:unknownStreamId:](v67, "parseTrackMetadata:version:unknownStreamId:");
  id v18 = [(MOVStreamReaderStreamOutput *)v67 streamId];
  id v19 = [(MOVStreamReaderStreamOutput *)v67 assetTrack];
  BOOL v20 = [(MOVStreamReaderStreamOutput *)v67 shouldDiscardStream:v18 mediaType:4 track:v19];

  if (!v20)
  {
    v59 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v68 outputSettings:0];
    int v21 = [(MOVStreamReaderStreamOutput *)v67 assetReader];
    int v22 = [v21 canAddOutput:v59];

    if (v22)
    {
      uint64_t v23 = [(MOVStreamReaderStreamOutput *)v67 assetReader];
      [v23 addOutput:v59];

      [(MOVStreamReaderStreamOutput *)v67 setStreamOutput:v59];
      if (v68)
      {
        v24 = v67;
        [v68 preferredTransform];
      }
      else
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v74 = 0u;
        v24 = v67;
      }
      v73[0] = v74;
      v73[1] = v75;
      v73[2] = v76;
      [(MOVStreamReaderStreamOutput *)v24 setTransform:v73];
      [(MOVStreamReaderStreamOutput *)v24 setPostProcessor:0];
      BOOL v26 = [(MOVStreamReaderStreamOutput *)v24 attachmentsIdentifier];
      int v27 = [(MOVStreamReaderStreamOutput *)v24 trackKindIdentifier];
      BOOL v28 = [(MOVStreamReaderStreamOutput *)v24 addAssociatedMetadataTracks:v61 rawSampleAttachmentsIdentifier:v26 trackKindIdentifier:v27 movVersion:v66 error:a10];

      if (v28)
      {
        [(MOVStreamReaderStreamOutput *)v67 setHasTimeCode:1];
        uint64_t v58 = [v68 makeSampleCursorAtFirstSampleInDecodeOrder];
        int v29 = [v68 makeSampleCursorAtLastSampleInDecodeOrder];
        if (v58)
        {
          [v58 presentationTimeStamp];
          if (v29)
          {
LABEL_12:
            [v29 presentationTimeStamp];
LABEL_17:
            if (CMTimeCompare(&time1, &time2)
              || ([(MOVStreamReaderStreamOutput *)v67 reader],
                  id v31 = objc_claimAutoreleasedReturnValue(),
                  char v32 = [v31 skipSynthesizedTimeCode],
                  v31,
                  (v32 & 1) != 0))
            {
              int v33 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v68 outputSettings:0];
              if ([v65 canAddOutput:v33])
              {
                [v65 addOutput:v33];
                [(MOVStreamReaderStreamOutput *)v67 setStreamOutput:v33];

                id v17 = v67;
LABEL_21:
                int v30 = v17;
                goto LABEL_22;
              }
              id v57 = v33;
              uint64_t v35 = [NSString stringWithFormat:@"Can't add timecode track output (%@) to the AVAssetReader.", v68];
              [MEMORY[0x263F087E8] populateReaderError:a10 message:v35 code:1];
            }
            else
            {
              id v36 = objc_alloc(MEMORY[0x263EFA4C0]);
              id v37 = [(MOVStreamReaderStreamOutput *)v67 assetReader];
              id v38 = [v37 asset];
              id v70 = 0;
              uint64_t v56 = (void *)[v36 initWithAsset:v38 error:&v70];
              id v57 = v70;

              if (!v57)
              {
                long long v42 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v68 outputSettings:0];
                if ([v56 canAddOutput:v42])
                {
                  [v56 addOutput:v42];
                  if ([v56 startReading])
                  {
                    for (uint64_t i = (opaqueCMSampleBuffer *)[v42 copyNextSampleBuffer];
                          ;
                          uint64_t i = (opaqueCMSampleBuffer *)[v42 copyNextSampleBuffer])
                    {
                      if (!i)
                      {
                        int v50 = NSString;
                        long long v51 = [(MOVStreamReaderStreamOutput *)v67 streamId];
                        long long v52 = [v50 stringWithFormat:@"Can't read timecode sample for creating synthesized timecode for stream %@.  Error: %@", v51, 0];

                        [MEMORY[0x263F087E8] populateReaderError:a10 message:v52 code:1];
                        goto LABEL_37;
                      }
                      if (CMSampleBufferGetNumSamples(i)) {
                        break;
                      }
                      CFRelease(i);
                    }
                    unsigned __int8 v69 = 0;
                    +[MOVStreamIOUtility timecode32ForSampleBuffer:i dropFrame:&v69];
                    [(MOVStreamReaderStreamOutput *)v67 setSynthesizedTimeCodeIsDropFrame:v69];
                    int v53 = NSString;
                    uint64_t v54 = [(MOVStreamReaderStreamOutput *)v67 streamId];
                    id v55 = [v53 stringWithFormat:@"Timecode sample is not valid for creating synthesized timecode for stream %@.  Error: %@", v54, 0];

                    [MEMORY[0x263F087E8] populateReaderError:a10 message:v55 code:1];
                  }
                  else
                  {
                    uint64_t v47 = NSString;
                    v48 = [(MOVStreamReaderStreamOutput *)v67 streamId];
                    BOOL v49 = [v47 stringWithFormat:@"Can't start reader for creating synthesized timecode for stream %@.  Error: %@", v48, 0];

                    [MEMORY[0x263F087E8] populateReaderError:a10 message:v49 code:1];
                  }
                }
                else
                {
                  char v44 = NSString;
                  v45 = [(MOVStreamReaderStreamOutput *)v67 streamId];
                  v46 = [v44 stringWithFormat:@"Can't add input for creating synthesized timecode for stream %@.  Error: %@", v45, 0];

                  [MEMORY[0x263F087E8] populateReaderError:a10 message:v46 code:1];
                }
LABEL_37:

                goto LABEL_27;
              }
              id v39 = NSString;
              int v40 = [(MOVStreamReaderStreamOutput *)v67 streamId];
              long long v41 = [v39 stringWithFormat:@"Can't create reader for making synthesized timecode for stream %@.  Error: %@", v40, v57];

              [MEMORY[0x263F087E8] populateReaderError:a10 message:v41 code:1];
              uint64_t v35 = v56;
            }

LABEL_27:
            goto LABEL_14;
          }
        }
        else
        {
          memset(&time1, 0, sizeof(time1));
          if (v29) {
            goto LABEL_12;
          }
        }
        memset(&time2, 0, sizeof(time2));
        goto LABEL_17;
      }
    }
    else
    {
      int v25 = [NSString stringWithFormat:@"Can't add output for time code track (%@) to the AVAssetReader.", v68];
      [MEMORY[0x263F087E8] populateReaderError:a10 message:v25 code:1];
    }
    goto LABEL_14;
  }

LABEL_14:
  int v30 = 0;
LABEL_22:

  return v30;
}

- (MOVStreamReaderStreamOutput)initWithVideoTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 bufferCacheMode:(int)a7 unknownStreamId:(id)a8 reader:(id)a9 delegate:(id)a10 error:(id *)a11
{
  uint64_t v214 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v171 = a4;
  id v164 = a5;
  id v173 = a6;
  id v168 = a8;
  id v170 = a9;
  id v169 = a10;
  v181 = v17;
  id v18 = [(MOVStreamReaderStreamOutput *)self init];
  id v19 = v18;
  v189 = v18;
  if (!v18)
  {
LABEL_96:
    v110 = v19;
    goto LABEL_97;
  }
  v18->_mediaType = 0;
  [(MOVStreamReaderStreamOutput *)v18 setVersion:v173];
  [(MOVStreamReaderStreamOutput *)v19 setDelegate:v169];
  [(MOVStreamReaderStreamOutput *)v19 setReader:v170];
  [(MOVStreamReaderStreamOutput *)v19 setAssetReader:v171];
  [(MOVStreamReaderStreamOutput *)v19 setAssetTrack:v17];
  v191 = [v173 versionedKey:@"mdta/com.apple.track_kind" modifier:0];
  v186 = [v173 versionedKey:@"mdta/com.apple.stream_sample_format" modifier:0];
  v183 = [v173 versionedKey:@"mdta/com.apple.stream_encoded_sample_format" modifier:0];
  v179 = [v173 versionedKey:@"mdta/com.apple.stream_sample_attachments_serialization_mode" modifier:0];
  v172 = [v173 versionedKey:@"mdta/com.apple.stream_type_info" modifier:0];
  v177 = [v173 versionedKey:@"mdta/com.apple.stream_related_to_stream" modifier:0];
  v174 = [v173 versionedKey:@"mdta/com.apple.stream_relation_specifier" modifier:0];
  v160 = [v173 versionedKey:@"mdta/com.apple.stream_sample_exact_bytes_per_row" modifier:0];
  v158 = [v173 versionedKey:@"mdta/com.apple.stream_sample_attachments" modifier:0];
  v159 = [v173 versionedKey:@"mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar" modifier:0];
  v187 = [v173 versionedKey:@"mdta/com.apple.stream_output_pixel_format_override" modifier:0];
  uint64_t v20 = [v173 versionedKey:@"mdta/com.apple.stream_stereo_video" modifier:0];
  v162 = [v173 versionedKey:@"mdta/com.apple.stream_additional_compression_properties" modifier:0];
  unsigned int v157 = a7;
  v163 = (void *)v20;
  int v21 = [v17 metadata];
  id v22 = v168;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  id obj = v21;
  uint64_t v23 = [obj countByEnumeratingWithState:&v199 objects:v213 count:16];
  uint64_t v161 = 0;
  if (v23)
  {
    unsigned int v176 = 0;
    v165 = 0;
    v166 = 0;
    v175 = 0;
    v178 = 0;
    unsigned int v184 = 0;
    unsigned int v180 = 0;
    unsigned int v182 = 0;
    v188 = 0;
    uint64_t v24 = *(void *)v200;
    char v25 = 1;
    while (1)
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v200 != v24) {
          objc_enumerationMutation(obj);
        }
        int v27 = *(void **)(*((void *)&v199 + 1) + 8 * v26);
        BOOL v28 = [v27 identifier];
        int v29 = [v191 isEqualToString:v28];

        if (v29)
        {
          id v30 = [v27 value];
          if (+[MIOLog debugEnabled])
          {
            id v31 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v30;
              _os_log_impl(&dword_21B5ED000, v31, OS_LOG_TYPE_DEBUG, "Detected %{public}@ stream", buf, 0xCu);
            }
          }
          uint64_t v32 = [(MOVStreamReaderStreamOutput *)v189 streamIdFromTrackStreamTypeIdentifier:v30];

          char v25 = 0;
          id v22 = (id)v32;
          goto LABEL_31;
        }
        int v33 = [v27 identifier];
        int v34 = [@"mdta/com.apple.trackStreamEncoding" isEqualToString:v33];

        if (v34)
        {
          [v27 value];
          v188 = id v30 = v188;
          goto LABEL_31;
        }
        uint64_t v35 = [v27 identifier];
        int v36 = [v187 isEqualToString:v35];

        if (v36)
        {
          id v30 = [v27 value];
          unsigned int v184 = [v30 unsignedIntValue];
          goto LABEL_31;
        }
        id v37 = [v27 identifier];
        int v38 = [v186 isEqualToString:v37];

        if (v38)
        {
          id v30 = [v27 value];
          unsigned int v182 = [v30 intValue];
          goto LABEL_31;
        }
        id v39 = [v27 identifier];
        int v40 = [v183 isEqualToString:v39];

        if (v40)
        {
          id v30 = [v27 value];
          unsigned int v180 = [v30 intValue];
          goto LABEL_31;
        }
        long long v41 = [v27 identifier];
        int v42 = [v179 isEqualToString:v41];

        if (v42)
        {
          id v30 = [v27 value];
          unsigned int v176 = [v30 intValue];
          goto LABEL_31;
        }
        v43 = [v27 identifier];
        int v44 = [v177 isEqualToString:v43];

        if (v44)
        {
          [v27 value];
          v178 = id v30 = v178;
          goto LABEL_31;
        }
        v45 = [v27 identifier];
        int v46 = [v174 isEqualToString:v45];

        if (v46)
        {
          [v27 value];
          v175 = id v30 = v175;
          goto LABEL_31;
        }
        uint64_t v47 = [v27 identifier];
        int v48 = [v172 isEqualToString:v47];

        if (v48)
        {
          id v30 = [v27 value];
          uint64_t v161 = [v30 longValue];
          goto LABEL_31;
        }
        BOOL v49 = [v27 identifier];
        int v50 = [v163 isEqualToString:v49];

        if (v50)
        {
          id v30 = [v27 numberValue];
          v189->_stereoVideoStream = [v30 BOOLValue];
          goto LABEL_31;
        }
        long long v51 = [v27 identifier];
        int v52 = [v162 isEqualToString:v51];

        if (v52)
        {
          int v53 = [v27 value];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v198 = 0;
            v167 = +[MOVStreamIOUtility plistDeserializedObject:v53 error:&v198];
            id v30 = v198;

            if (v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              additionalCompressionProperties = [NSString stringWithFormat:@"Invalid Additional Compression Properties value type for stream '%@': %@.", v22, v30];
              id v63 = (id)[MEMORY[0x263F087E8] readerWarningWithMessage:additionalCompressionProperties code:0];

              v166 = 0;
            }
            else
            {
              uint64_t v54 = v167;
              additionalCompressionProperties = v189->_additionalCompressionProperties;
              v166 = v54;
              v189->_additionalCompressionProperties = v54;
            }

            goto LABEL_31;
          }
          v166 = v53;
        }
        else
        {
          uint64_t v56 = [v27 identifier];
          int v57 = [v160 isEqualToString:v56];

          if (v57)
          {
            uint64_t v58 = [v27 value];

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_49;
            }
            v165 = v58;
          }
          else
          {
            v59 = [v27 identifier];
            int v60 = [v159 isEqualToString:v59];

            if (v60)
            {
              uint64_t v58 = [v27 value];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v197 = 0;
                v165 = +[MOVStreamIOUtility plistDeserializedObject:v58 error:&v197];
                id v30 = v197;

                if (v30)
                {
                  id v61 = [NSString stringWithFormat:@"Invalid ExactBytesPerRow value type for stream '%@': %@.", v22, v30];
                  id v62 = (id)[MEMORY[0x263F087E8] readerWarningWithMessage:v61 code:0];

                  goto LABEL_50;
                }
              }
              else
              {
LABEL_49:
                id v30 = [NSString stringWithFormat:@"Invalid ExactBytesPerRow value type for stream '%@': %@.", v22, v58];
                id v64 = (id)[MEMORY[0x263F087E8] readerWarningWithMessage:v30 code:0];

LABEL_50:
                v165 = 0;
              }
LABEL_31:
            }
          }
        }
        ++v26;
      }
      while (v23 != v26);
      uint64_t v65 = [obj countByEnumeratingWithState:&v199 objects:v213 count:16];
      uint64_t v23 = v65;
      if (!v65) {
        goto LABEL_54;
      }
    }
  }
  unsigned int v176 = 0;
  v165 = 0;
  v166 = 0;
  v175 = 0;
  v178 = 0;
  unsigned int v184 = 0;
  unsigned int v180 = 0;
  unsigned int v182 = 0;
  v188 = 0;
  char v25 = 1;
LABEL_54:

  for (unint64_t i = 0; ; ++i)
  {
    id v67 = [v181 formatDescriptions];
    BOOL v68 = [v67 count] > i;

    if (!v68) {
      break;
    }
    unsigned __int8 v69 = [v181 formatDescriptions];
    id v70 = [v69 objectAtIndexedSubscript:i];

    uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v70);
    if (MediaSubType == 1936484717
      && !+[MOVStreamEncoderConfig isEncoderAvailableOfType:withId:](MOVStreamEncoderConfig, "isEncoderAvailableOfType:withId:", 1936484717, 0)|| +[MOVStreamEncoderConfig isProResCodec:](MOVStreamEncoderConfig, "isProResCodec:", MediaSubType)&& !+[MOVStreamEncoderConfig isEncoderAvailableOfType:MediaSubType withId:0])
    {
      v89 = [NSString stringWithFormat:@"Decoder required for '%@' is not available.", v22];
      [MEMORY[0x263F087E8] populateReaderError:a11 message:v89 code:1];

LABEL_93:
      int v109 = 1;
      goto LABEL_94;
    }
  }
  if (v25)
  {
    id v72 = [v181 formatDescriptions];
    BOOL v73 = [v72 count] == 0;

    if (!v73)
    {
      long long v74 = [v181 formatDescriptions];
      long long v75 = [v74 objectAtIndexedSubscript:0];

      long long v76 = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v75);
      uint64_t v77 = [v76 objectForKey:@"HasLeftStereoEyeView"];
      int v78 = [v77 BOOLValue];

      if (v78) {
        v189->_stereoVideoStream = 1;
      }
      long long v79 = [v76 objectForKey:@"SampleDescriptionExtensionAtoms"];
      long long v80 = [v79 objectForKey:@"hvcC"];
      if (v80)
      {
        v81 = [v79 objectForKey:@"lhvC"];
        BOOL v82 = v81 == 0;

        if (!v82) {
          v189->_stereoVideoStream = 1;
        }
      }
    }
  }
  p_isa = (id *)&v189->super.isa;
  if (v180)
  {
    if (v25)
    {
LABEL_71:
      uint64_t v84 = [p_isa assetTrack];
      id v85 = +[MIOMovieMetadataUtility findStreamIdFromQTTagsOfTrack:v84];

      if (!v85)
      {
        id v95 = (id)[MEMORY[0x263F087E8] readerWarningWithMessage:@"Unknown stream detected." code:0];
        goto LABEL_83;
      }
      v86 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        uint64_t v87 = [v85 UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v87;
        _os_log_impl(&dword_21B5ED000, v86, OS_LOG_TYPE_INFO, "QT track name detected: %s", buf, 0xCu);
      }

      id v85 = v85;
      v88 = v22;
      id v22 = v85;
LABEL_81:

LABEL_83:
      goto LABEL_84;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v189->_delegate);
    unsigned int v180 = [(MOVStreamReaderStreamOutput *)v189 playbackPixelFormatForTrack:v181 ofStream:v22 streamEncodingType:v188 inputPixelFormat:v182 delegate:WeakRetained];

    p_isa = (id *)&v189->super.isa;
    if (v25) {
      goto LABEL_71;
    }
  }
  v91 = p_isa + 17;
  id v92 = objc_loadWeakRetained(p_isa + 17);
  if (v92)
  {
    id v93 = objc_loadWeakRetained(v91);
    char v94 = objc_opt_respondsToSelector();

    if (v94)
    {
      id v85 = objc_loadWeakRetained(v91);
      v88 = [(MOVStreamReaderStreamOutput *)v189 reader];
      unsigned int v180 = [v85 reader:v88 pixelFormatForStream:v22 suggestedFormat:v180];
      goto LABEL_81;
    }
  }
LABEL_84:
  v96 = [(MOVStreamReaderStreamOutput *)v189 assetTrack];
  BOOL v97 = [(MOVStreamReaderStreamOutput *)v189 shouldDiscardStream:v22 mediaType:0 track:v96];

  if (v97) {
    goto LABEL_93;
  }
  v98 = v189;
  if (v180 == -1)
  {
    v106 = [NSString stringWithFormat:@"Undefined pixel format for stream '%@'. Ignoring stream.", v22];
    id v107 = (id)[MEMORY[0x263F087E8] readerWarningWithMessage:v106 code:0];
    v108 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v106;
      _os_log_impl(&dword_21B5ED000, v108, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    goto LABEL_93;
  }
  if (v25) {
    goto LABEL_107;
  }
  id v99 = objc_loadWeakRetained((id *)&v189->_delegate);
  if (v99
    && (id v100 = objc_loadWeakRetained((id *)&v189->_delegate),
        char v101 = objc_opt_respondsToSelector(),
        v100,
        v99,
        (v101 & 1) != 0))
  {
    id v102 = objc_loadWeakRetained((id *)&v189->_delegate);
    v103 = [(MOVStreamReaderStreamOutput *)v189 reader];
    v104 = [(MOVStreamReaderStreamOutput *)v189 customTrackMetadata];
    uint64_t v105 = [v102 reader:v103 overrideBytesPerRowForStream:v22 storedValue:v165 customTrackMetadata:v104 originalPixelFormat:v182 encodedPixelFormat:v180];

    v165 = (void *)v105;
  }
  else
  {
    id v112 = objc_loadWeakRetained((id *)&v189->_delegate);
    if (!v112) {
      goto LABEL_106;
    }
    id v113 = objc_loadWeakRetained((id *)&v189->_delegate);
    char v114 = objc_opt_respondsToSelector();

    if ((v114 & 1) == 0) {
      goto LABEL_106;
    }
    objc_opt_class();
    uint64_t v115 = (objc_opt_isKindOfClass() & 1) != 0 ? [v165 intValue] : 0;
    id v116 = objc_loadWeakRetained((id *)&v189->_delegate);
    v117 = [(MOVStreamReaderStreamOutput *)v189 reader];
    uint64_t v118 = [v116 reader:v117 bytesPerRowForStream:v22 storedValue:v115];

    if (!v118) {
      goto LABEL_106;
    }
    [NSNumber numberWithUnsignedInt:v118];
    v165 = id v102 = v165;
  }

LABEL_106:
  v98 = v189;
LABEL_107:
  long long v211 = 0u;
  long long v212 = 0u;
  *(_OWORD *)buf = 0u;
  v119 = v181;
  if (v181) {
    [v181 preferredTransform];
  }
  if (v180)
  {
    if (v165)
    {
      v208[0] = *MEMORY[0x263F04180];
      v120 = [NSNumber numberWithInt:v180];
      v208[1] = *MEMORY[0x263F040C8];
      v209[0] = v120;
      v209[1] = v165;
      [NSDictionary dictionaryWithObjects:v209 forKeys:v208 count:2];
    }
    else
    {
      uint64_t v206 = *MEMORY[0x263F04180];
      v120 = [NSNumber numberWithInt:v180];
      v207 = v120;
      [NSDictionary dictionaryWithObjects:&v207 forKeys:&v206 count:1];
    v121 = };

    v119 = v181;
    v98 = v189;
  }
  else
  {
    v121 = 0;
  }
  if (v98->_stereoVideoStream)
  {
    if (![(MOVStreamReaderStreamOutput *)v98 determineStereoLayerIDs:v119]) {
      [(MOVStreamReaderStreamOutput *)v98 useDefaultMIOLayerIds];
    }
    v122 = (void *)[v121 mutableCopy];
    v204 = @"RequestedMVHEVCVideoLayerIDs";
    videoLayerIds = v98->_videoLayerIds;
    v123 = [NSDictionary dictionaryWithObjects:&videoLayerIds forKeys:&v204 count:1];
    [v122 setObject:v123 forKey:*MEMORY[0x263EFA3A8]];

    v124 = (void *)[v122 copy];
    v119 = v181;
    v98 = v189;
  }
  else
  {
    v124 = v121;
  }
  v125 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v119 outputSettings:v124];
  objc_msgSend(v125, "setAlwaysCopiesSampleData:", -[MOVStreamReaderStreamOutput alwaysCopiesSampleDataForStream](v98, "alwaysCopiesSampleDataForStream"));
  if (![v171 canAddOutput:v125])
  {
    v134 = [NSString stringWithFormat:@"Can't add video track (%@) to the AVAssetReader.", v119];
    int v109 = 1;
    [MEMORY[0x263F087E8] populateReaderError:a11 message:v134 code:1];
    uint64_t v130 = (uint64_t)v22;
    goto LABEL_152;
  }
  [v171 addOutput:v125];
  if (([v22 isEqualToString:@"RawBayer"] & 1) != 0
    || +[MIOPixelBufferUtility isPixelFormatRawBayer:v182])
  {
    unsigned int v176 = 1;
  }
  if (v184) {
    uint64_t v126 = v184;
  }
  else {
    uint64_t v126 = v182;
  }
  [(MOVStreamReaderStreamOutput *)v189 setStreamOutput:v125];
  v196[0] = *(_OWORD *)buf;
  v196[1] = v211;
  v196[2] = v212;
  [(MOVStreamReaderStreamOutput *)v189 setTransform:v196];
  [(MOVStreamReaderStreamOutput *)v189 setOriginalPixelFormat:v126];
  [(MOVStreamReaderStreamOutput *)v189 setDeterminedPixelFormat:v180];
  [(MOVStreamReaderStreamOutput *)v189 setAttachmentSerializationMode:v176];
  [(MOVStreamReaderStreamOutput *)v189 setRelatedStreamId:v178];
  [(MOVStreamReaderStreamOutput *)v189 setRelationSpecifier:v175];
  [(MOVStreamReaderStreamOutput *)v189 setTrackTypeInfo:v161];
  v127 = +[MOVStreamPostProcessorFactory defaultFactory];
  v128 = [v127 postProcessorFromReader:v170 originalPixelFormat:v126 encodedFormat:v180 encoderType:v188 streamId:v22 bufferCacheMode:v157];
  [(MOVStreamReaderStreamOutput *)v189 setPostProcessor:v128];

  v129 = [(MOVStreamReaderStreamOutput *)v189 postProcessor];
  [v129 setExactBytesPerRow:v165];

  uint64_t v130 = [(MOVStreamReaderStreamOutput *)v189 verifyStreamId:v22 ofType:0];

  [(MOVStreamReaderStreamOutput *)v189 setStreamId:v130];
  if (![(MOVStreamReaderStreamOutput *)v189 addAssociatedMetadataTracks:v164 rawSampleAttachmentsIdentifier:v158 trackKindIdentifier:v191 movVersion:v173 error:a11])
  {
    int v109 = 1;
    goto LABEL_153;
  }
  v131 = [(MOVStreamReaderStreamOutput *)v189 attachmentsAdaptor];
  BOOL v132 = v131 == 0;

  if (v132)
  {
    p_delegate = (id *)&v189->_delegate;
    id v145 = objc_loadWeakRetained((id *)&v189->_delegate);
    if (v145)
    {
      id v146 = objc_loadWeakRetained(p_delegate);
      char v147 = objc_opt_respondsToSelector();

      if (v147)
      {
        id v148 = objc_loadWeakRetained(p_delegate);
        v149 = [(MOVStreamReaderStreamOutput *)v189 reader];
        v150 = [(MOVStreamReaderStreamOutput *)v189 streamId];
        char v151 = [v148 reader:v149 readSEIIfAvailableForStream:v150];

        if (v151)
        {
          [(MOVStreamReaderStreamOutput *)v189 setAttachmentSerializationMode:1];
          v152 = [MIOSEITrackReader alloc];
          v153 = [(MOVStreamReaderStreamOutput *)v189 assetTrack];
          v154 = [(MOVStreamReaderStreamOutput *)v189 assetReader];
          v155 = [(MIOSEITrackReader *)v152 initWithVideoTrack:v153 assetReader:v154];
          [(MOVStreamReaderStreamOutput *)v189 setSeiTrackReader:v155];
        }
      }
    }
  }
  v133 = [(MOVStreamReaderStreamOutput *)v189 assetTrack];
  v134 = [(MOVStreamReaderStreamOutput *)v189 findTimeCodeTrackAssociatedWithTrack:v133];

  if (!v134)
  {
    int v109 = 0;
    goto LABEL_152;
  }
  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  v135 = [(MOVStreamReaderStreamOutput *)v189 reader];
  id v185 = [v135 getAllTimeCodeStreams];

  uint64_t v136 = [v185 countByEnumeratingWithState:&v192 objects:v203 count:16];
  if (!v136)
  {
    int v109 = 0;
    goto LABEL_151;
  }
  uint64_t v137 = *(void *)v193;
  while (2)
  {
    for (uint64_t j = 0; j != v136; ++j)
    {
      if (*(void *)v193 != v137) {
        objc_enumerationMutation(v185);
      }
      uint64_t v139 = *(void *)(*((void *)&v192 + 1) + 8 * j);
      v140 = [(MOVStreamReaderStreamOutput *)v189 reader];
      v141 = [v140 outputForTimeCodeStream:v139 error:a11];

      if (!v141)
      {
        uint64_t v156 = [NSString stringWithFormat:@"Can't find time code track (%@)", v181];
        int v109 = 1;
        [MEMORY[0x263F087E8] populateReaderError:a11 message:v156 code:1];
        v141 = (void *)v156;
LABEL_150:

        goto LABEL_151;
      }
      v142 = [v141 assetTrack];
      BOOL v143 = v142 == v134;

      if (v143)
      {
        objc_storeStrong((id *)&v189->_timeCodeOutput, v141);
        -[MOVStreamReaderStreamOutput setHasTimeCode:](v189, "setHasTimeCode:", [v141 hasTimeCode]);
        int v109 = 0;
        goto LABEL_150;
      }
    }
    uint64_t v136 = [v185 countByEnumeratingWithState:&v192 objects:v203 count:16];
    int v109 = 0;
    if (v136) {
      continue;
    }
    break;
  }
LABEL_151:

LABEL_152:
LABEL_153:

  id v22 = (id)v130;
LABEL_94:

  id v19 = v189;
  if (!v109) {
    goto LABEL_96;
  }
  v110 = 0;
LABEL_97:

  return v110;
}

- (void)registerForAssociating:(id)a3 trackRelation:(id)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v6];
  v10[0] = v8;
  v10[1] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  [(NSMutableArray *)self->_associatedOutputs addObject:v9];
}

- (id)verifyStreamId:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = 1;
  for (unint64_t i = v6; ; unint64_t i = (void *)v11)
  {
    v9 = [(MOVStreamReaderStreamOutput *)self reader];
    int v10 = [v9 containsStream:i withMediaType:a4];

    if (!v10) {
      break;
    }
    uint64_t v11 = objc_msgSend(v6, "stringByAppendingFormat:", @"-%zu", v7);

    ++v7;
  }

  return i;
}

- (void)removePixelBufferPadding:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MOVStreamReaderStreamOutput *)self postProcessor];
  [v4 setRemovePadding:v3];
}

- (BOOL)alwaysCopiesSampleDataForStream
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained) {
    return 0;
  }
  uint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  v9 = [(MOVStreamReaderStreamOutput *)self reader];
  int v10 = [(MOVStreamReaderStreamOutput *)self streamId];
  char v11 = [v8 reader:v9 alwaysCopiesSampleDataForStream:v10];

  return v11;
}

- (id)timestamps
{
  BOOL v3 = [MOVStreamTimestamps alloc];
  id v4 = [(MOVStreamReaderStreamOutput *)self assetTrack];
  uint64_t v5 = [(MOVStreamTimestamps *)v3 initWithAssetTrack:v4];

  [(MOVStreamTimestamps *)v5 setShouldStartTimestampsAtZero:[(MOVStreamReaderStreamOutput *)self mediaType] == 2];

  return v5;
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  timeCodeOutput = self->_timeCodeOutput;
  if (!timeCodeOutput) {
    return 0;
  }
  BOOL v3 = [(MOVStreamReaderStreamOutput *)timeCodeOutput assetTrack];
  id v4 = [v3 formatDescriptions];
  uint64_t v5 = (opaqueCMFormatDescription *)[v4 firstObject];

  return v5;
}

- (id)customTrackMetadata
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [(MOVStreamReaderStreamOutput *)self assetTrack];
  v14 = [v2 metadata];

  BOOL v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v14;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = [v8 identifier];
        if (![v9 rangeOfString:@"mdta/custom."])
        {
          int v10 = [v9 stringByReplacingOccurrencesOfString:@"mdta/custom." withString:&stru_26CB6A778];
          char v11 = [v10 stringByRemovingPercentEncoding];

          uint64_t v12 = [v8 value];
          [v3 setObject:v12 forKey:v11];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)customTrackMetadataItems
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = [(MOVStreamReaderStreamOutput *)self assetTrack];
  BOOL v3 = [v2 metadata];

  id v20 = (id)objc_opt_new();
  id v4 = (void *)*MEMORY[0x263EF9E90];
  uint64_t v5 = objc_msgSend((id)*MEMORY[0x263EF9E90], "stringByAppendingPathComponent:", *MEMORY[0x263EF9F90], v3);
  uint64_t v6 = [v4 stringByAppendingPathComponent:*MEMORY[0x263EF9F98]];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        char v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = [v11 identifier];
        v13 = [v11 identifier];
        char v14 = [v13 isEqualToString:v5];

        if ((v14 & 1) == 0)
        {
          long long v15 = [v11 identifier];
          char v16 = [v15 isEqualToString:v6];

          if ((v16 & 1) == 0)
          {
            if ([v12 rangeOfString:@"mdta/custom."])
            {
              long long v17 = +[MOVStreamIOUtility reservedMIOTrackMetadataKeys];
              char v18 = [v17 containsObject:v12];

              if ((v18 & 1) == 0) {
                [v20 addObject:v11];
              }
            }
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v20;
}

- (id)getAssociatedMetadataStreams
{
  v2 = [(MOVStreamReaderStreamOutput *)self associatedMetadataOutputs];
  BOOL v3 = [v2 allKeys];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)getAssociatedMetadataStreamOutputs
{
  v2 = [(MOVStreamReaderStreamOutput *)self associatedMetadataOutputs];
  BOOL v3 = [v2 allValues];

  return v3;
}

- (id)getAssociatedMetadataStreamOutputForMetadataStreamId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MOVStreamReaderStreamOutput *)self associatedMetadataOutputs];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (unsigned)pixelFormatForStream
{
  unsigned int result = [(MOVStreamReaderStreamOutput *)self originalPixelFormat];
  if (!result)
  {
    return [(MOVStreamReaderStreamOutput *)self determinedPixelFormat];
  }
  return result;
}

- (unsigned)getOutputPixelFormatForStream
{
  BOOL v3 = [(MOVStreamReaderStreamOutput *)self postProcessor];
  int v4 = [v3 processedPixelFormat];

  if (v4)
  {
    uint64_t v5 = [(MOVStreamReaderStreamOutput *)self postProcessor];
    unsigned int v6 = [v5 processedPixelFormat];
  }
  else
  {
    uint64_t v5 = [(MOVStreamReaderStreamOutput *)self streamOutput];
    uint64_t v8 = [v5 outputSettings];
    uint64_t v9 = [v8 objectForKey:*MEMORY[0x263F04180]];
    unsigned int v7 = [v9 intValue];

    if (v7) {
      goto LABEL_5;
    }
    unsigned int v6 = [(MOVStreamReaderStreamOutput *)self determinedPixelFormat];
  }
  unsigned int v7 = v6;
LABEL_5:

  return v7;
}

- (BOOL)getOutputPixelFormatWasGuessedForStream
{
  return self->_pixelFormatWasGuessed;
}

- (void)useDefaultMIOLayerIds
{
  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26CB7D368, &unk_26CB7D380, 0);
  self->_videoLayerIds = (NSArray *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x270F9A758]();
}

- (BOOL)determineStereoLayerIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 formatDescriptions];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    NSLog(&cfstr_NoFormatDescri_0.isa);
    goto LABEL_18;
  }
  unsigned int v7 = [v4 formatDescriptions];
  uint64_t v8 = [v7 objectAtIndexedSubscript:0];

  CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v8);
  if (Extensions)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Extensions, @"SampleDescriptionExtensionAtoms");
    if (Value)
    {
      if (CFDictionaryGetValue(Value, @"hvcC"))
      {
        if (!FigHEVCBridge_GetNALUnitHeaderLengthFromHVCC())
        {
          CFDataRef theData = 0;
          FigHEVCBridge_CopyHEVCSEIPayloadData();
          FigHEVCBridge_GetHEVCParameterSetAtIndex();
          CFDataGetBytePtr(0);
          CFDataGetLength(0);
          if (!FigHEVCBridge_Get3DLayerIDs())
          {
            long long v21 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
            long long v22 = [NSNumber numberWithUnsignedChar:255];
            [v21 addObject:v22];

            long long v23 = [NSNumber numberWithUnsignedChar:255];
            [v21 addObject:v23];

            long long v24 = (NSArray *)[v21 copy];
            videoLayerIds = self->_videoLayerIds;
            self->_videoLayerIds = v24;

            BOOL v14 = 1;
            goto LABEL_19;
          }
        }
      }
    }
  }
  CFDataRef theData = 0;
  uint64_t v11 = CMVideoFormatDescriptionCopyTagCollectionArray((CMVideoFormatDescriptionRef)v8, &theData);
  if (v11)
  {
    NSLog(&cfstr_FailedGettingF.isa, v11);
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
  if (!theData)
  {
    CFIndex Count = 0;
    goto LABEL_17;
  }
  CFIndex Count = CFArrayGetCount(theData);
  if (Count <= 1)
  {
LABEL_17:
    NSLog(&cfstr_FailedGettingM.isa, Count);
    goto LABEL_18;
  }
  v13 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  BOOL v14 = 0;
  CFIndex v15 = 0;
  while (1)
  {
    CFArrayGetValueAtIndex(theData, v15);
    uint64_t TagsWithCategory = FigTagCollectionGetTagsWithCategory();
    if (TagsWithCategory) {
      break;
    }
    long long v17 = [NSNumber numberWithLongLong:FigTagGetSInt64Value()];
    [v13 addObject:v17];

    BOOL v14 = ++v15 >= Count;
    if (Count == v15)
    {
      char v18 = (NSArray *)[v13 copy];
      id v19 = self->_videoLayerIds;
      self->_videoLayerIds = v18;

      goto LABEL_21;
    }
  }
  NSLog(&cfstr_FailedGettingT.isa, TagsWithCategory);
LABEL_21:

LABEL_19:
  return v14;
}

- (BOOL)copyNextStereoFrames:(__CVBuffer *)a3 rightBuffer:(__CVBuffer *)a4 timestamp:(id *)a5 error:(id *)a6
{
  if (!a3) {
    -[MOVStreamReaderStreamOutput copyNextStereoFrames:rightBuffer:timestamp:error:]();
  }
  if (!a4) {
    -[MOVStreamReaderStreamOutput copyNextStereoFrames:rightBuffer:timestamp:error:]();
  }
  uint64_t v11 = (void *)MEMORY[0x21D4924B0](self, a2);
  uint64_t v12 = [(MOVStreamReaderStreamOutput *)self streamOutput];
  v13 = (opaqueCMSampleBuffer *)[v12 copyNextSampleBuffer];

  if (v13)
  {
    BOOL v14 = [(MOVStreamReaderStreamOutput *)self stereoFramesFromSampleBuffer:v13 outLeft:a3 outRight:a4 error:a6];
    if (a5)
    {
      CMSampleBufferGetPresentationTimeStamp(&v27, v13);
      *(CMTime *)a5 = v27;
    }
    CVPixelBufferRetain(*a3);
    CVPixelBufferRetain(*a4);
    CFRelease(v13);
    if (v14)
    {
      CFIndex v15 = [(MOVStreamReaderStreamOutput *)self attachmentsDataForStreamPts:&v27 duration:&v26];
      if ([v15 count])
      {
        char v16 = [v15 objectAtIndexedSubscript:0];
        CFDictionaryRef v17 = [(MOVStreamReaderStreamOutput *)self decodeAttachmentsData:v16 error:a6];

        char v18 = [(MOVStreamReaderStreamOutput *)self postProcessor];
        id v19 = (__CVBuffer *)[v18 processedPixelBufferFrom:*a3 metadata:v17 error:a6];

        CVPixelBufferRelease(*a3);
        if (v17) {
          CVBufferSetAttachments(v19, v17, kCVAttachmentMode_ShouldPropagate);
        }
        *a3 = v19;
      }
      if ((unint64_t)[v15 count] >= 2)
      {
        id v20 = [v15 objectAtIndexedSubscript:1];
        CFDictionaryRef v21 = [(MOVStreamReaderStreamOutput *)self decodeAttachmentsData:v20 error:a6];

        long long v22 = [(MOVStreamReaderStreamOutput *)self postProcessor];
        long long v23 = (__CVBuffer *)[v22 processedPixelBufferFrom:*a4 metadata:v21 error:a6];

        CVPixelBufferRelease(*a4);
        if (v21) {
          CVBufferSetAttachments(v23, v21, kCVAttachmentMode_ShouldPropagate);
        }
        *a4 = v23;
      }
      BOOL v24 = 1;
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    [(MOVStreamReaderStreamOutput *)self setEndOfStreamReached:1];
    if (a6) {
      *a6 = 0;
    }
    BOOL v24 = 0;
    *a3 = 0;
    *a4 = 0;
  }
  return !v13 || v24;
}

- (BOOL)stereoFramesFromSampleBuffer:(opaqueCMSampleBuffer *)a3 outLeft:(__CVBuffer *)a4 outRight:(__CVBuffer *)a5 error:(id *)a6
{
  uint64_t TaggedBufferGroup = FigSampleBufferGetTaggedBufferGroup();
  if (!TaggedBufferGroup)
  {
    CFDictionaryRef v21 = (void *)MEMORY[0x263F087E8];
    long long v22 = @"No tagged buffer group in sample buffer.";
LABEL_18:
    [v21 populateReaderError:a6 message:v22 code:29];
    return 0;
  }
  uint64_t v11 = TaggedBufferGroup;
  if ([(NSArray *)self->_videoLayerIds count] <= 1) {
    -[MOVStreamReaderStreamOutput stereoFramesFromSampleBuffer:outLeft:outRight:error:]();
  }
  uint64_t v12 = [(NSArray *)self->_videoLayerIds objectAtIndexedSubscript:0];
  int v13 = [v12 intValue];

  BOOL v14 = [(NSArray *)self->_videoLayerIds objectAtIndexedSubscript:1];
  int v15 = [v14 intValue];

  if (MEMORY[0x21D491FE0](v11) >= 1)
  {
    uint64_t v16 = 0;
    while (1)
    {
      MEMORY[0x21D491FF0](v11, v16);
      uint64_t TagsWithCategory = FigTagCollectionGetTagsWithCategory();
      if (TagsWithCategory)
      {
        long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"Failed getting video layer tag. Error %d", TagsWithCategory, 0);
        [MEMORY[0x263F087E8] populateReaderError:a6 message:v23 code:29];

        return 0;
      }
      SInt64CFDictionaryRef Value = FigTagGetSInt64Value();
      CVPixelBufferAtIndex = (__CVBuffer *)FigTaggedBufferGroupGetCVPixelBufferAtIndex();
      if (!CVPixelBufferAtIndex) {
        break;
      }
      if (v13 == SInt64Value)
      {
        *a4 = CVPixelBufferAtIndex;
      }
      else if (v15 == SInt64Value)
      {
        *a5 = CVPixelBufferAtIndex;
      }
      else
      {
        NSLog(&cfstr_UnknownVideola.isa, SInt64Value, 0);
      }
      if (++v16 >= MEMORY[0x21D491FE0](v11)) {
        goto LABEL_13;
      }
    }
    CFDictionaryRef v21 = (void *)MEMORY[0x263F087E8];
    long long v22 = @"No pixel buffer for video layer.";
    goto LABEL_18;
  }
LABEL_13:
  if (*a4) {
    return *a5 != 0;
  }
  return 0;
}

- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 error:(id *)a4
{
  return [(MOVStreamReaderStreamOutput *)self copyNextFrameForStreamTimestamp:a3 readTimeCode:0 timeCode:0 tcDropFrame:0 error:a4];
}

- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 timeCode:(CVSMPTETime *)a4 tcDropFrame:(BOOL *)a5 error:(id *)a6
{
  return [(MOVStreamReaderStreamOutput *)self copyNextFrameForStreamTimestamp:a3 readTimeCode:1 timeCode:a4 tcDropFrame:a5 error:a6];
}

- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 readTimeCode:(BOOL)a4 timeCode:(CVSMPTETime *)a5 tcDropFrame:(BOOL *)a6 error:(id *)a7
{
  long long v26 = *MEMORY[0x263F01098];
  int64_t v27 = *(void *)(MEMORY[0x263F01098] + 16);
  uint64_t v28 = 0;
  id v25 = 0;
  uint64_t v12 = -[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsData:readTimeCode:timecodeSampleBuffer:timestamp:error:](self, "nextSampleBufferForStreamAttachmentsData:readTimeCode:timecodeSampleBuffer:timestamp:error:", &v25, a4, &v28, &v26);
  id v13 = v25;
  if (a3)
  {
    *(_OWORD *)&a3->var0 = v26;
    a3->var3 = v27;
  }
  if (v12)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v12);
    CVPixelBufferRetain(ImageBuffer);
    CFRelease(v12);
    CFDictionaryRef v15 = [(MOVStreamReaderStreamOutput *)self decodeAttachmentsData:v13 error:a7];
    uint64_t v16 = [(MOVStreamReaderStreamOutput *)self postProcessor];
    CFDictionaryRef v17 = (__CVBuffer *)[v16 processedPixelBufferFrom:ImageBuffer metadata:v15 error:a7];

    CVPixelBufferRelease(ImageBuffer);
    if (v15) {
      CVBufferSetAttachments(v17, v15, kCVAttachmentMode_ShouldPropagate);
    }
    if (a5)
    {
      if (v28)
      {
        +[MOVStreamIOUtility timecode32ForSampleBuffer:v28 dropFrame:a6];
        *(_OWORD *)&a5->subframes = v23;
        *(void *)&a5->hours = v24;
      }
      else
      {
        timeCodeOutput = self->_timeCodeOutput;
        if (timeCodeOutput)
        {
          id v19 = [(MOVStreamReaderStreamOutput *)timeCodeOutput synthesizedTimeCodes];
          id v20 = [MEMORY[0x263F08D40] value:&v26 withObjCType:"{?=qiIq}"];
          CFDictionaryRef v21 = [v19 objectForKey:v20];

          if (v21)
          {
            [v21 getValue:a5];
            if (a6) {
              *a6 = [(MOVStreamReaderStreamOutput *)self->_timeCodeOutput synthesizedTimeCodeIsDropFrame];
            }
          }
        }
      }
    }
  }
  else
  {
    CFDictionaryRef v17 = 0;
  }

  return v17;
}

- (__CVBuffer)nextPixelBufferForStreamAttachmentsData:(id *)a3 timestamp:(id *)a4 error:(id *)a5
{
  unsigned int v7 = -[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsData:timestamp:error:](self, "nextSampleBufferForStreamAttachmentsData:timestamp:error:", a3, a4);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  ImageBuffer = CMSampleBufferGetImageBuffer(v7);
  CVPixelBufferRetain(ImageBuffer);
  CFRelease(v8);
  int v10 = [(MOVStreamReaderStreamOutput *)self postProcessor];
  uint64_t v11 = (__CVBuffer *)[v10 processedPixelBufferFrom:ImageBuffer metadata:0 error:a5];

  CVPixelBufferRelease(ImageBuffer);
  return v11;
}

- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 timestamp:(id *)a4 error:(id *)a5
{
  return [(MOVStreamReaderStreamOutput *)self nextSampleBufferForStreamAttachmentsData:a3 readTimeCode:0 timecodeSampleBuffer:0 timestamp:a4 error:a5];
}

- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 readTimeCode:(BOOL)a4 timestamp:(id *)a5 error:(id *)a6
{
  return [(MOVStreamReaderStreamOutput *)self nextSampleBufferForStreamAttachmentsData:a3 readTimeCode:a4 timecodeSampleBuffer:0 timestamp:a5 error:a6];
}

- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 readTimeCode:(BOOL)a4 timecodeSampleBuffer:(opaqueCMSampleBuffer *)a5 timestamp:(id *)a6 error:(id *)a7
{
  id v11 = 0;
  uint64_t v8 = [(MOVStreamReaderStreamOutput *)self nextSampleBufferForStreamAttachmentsDataArray:&v11 readTimeCode:a4 timecodeSampleBuffer:a5 timestamp:a6 error:a7];
  id v9 = v11;
  if ([v9 count])
  {
    *a3 = [v9 objectAtIndexedSubscript:0];
  }

  return v8;
}

- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsDataArray:(id *)a3 readTimeCode:(BOOL)a4 timecodeSampleBuffer:(opaqueCMSampleBuffer *)a5 timestamp:(id *)a6 error:(id *)a7
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  if (self->_mediaType != 4)
  {
    BOOL v12 = a4;
    id v13 = (CMTime *)MEMORY[0x263F01098];
    if (a6)
    {
      long long v14 = *MEMORY[0x263F01098];
      a6->var3 = *(void *)(MEMORY[0x263F01098] + 16);
      *(_OWORD *)&a6->var0 = v14;
    }
    CFDictionaryRef v15 = [(MOVStreamReaderStreamOutput *)self streamOutput];
    id v11 = (opaqueCMSampleBuffer *)[v15 copyNextSampleBuffer];

    if (![(MOVStreamReaderStreamOutput *)self firstVideoFrameRead])
    {
      [(MOVStreamReaderStreamOutput *)self setFirstVideoFrameRead:1];
      int v16 = 0;
      if (self->_mediaType || !v11) {
        goto LABEL_15;
      }
      if ([(MOVStreamReaderStreamOutput *)self isEmptySample:v11])
      {
        long long v23 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          streamId = self->_streamId;
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = streamId;
          _os_log_impl(&dword_21B5ED000, v23, OS_LOG_TYPE_INFO, "Empty Edit frame detected for stream '%{public}@'.", buf, 0xCu);
        }

        id v25 = [(MOVStreamReaderStreamOutput *)self reader];
        int v26 = [v25 skipEmptyEditVideoFrame];

        if (!v26)
        {
          int v16 = 1;
LABEL_15:
          CFDictionaryRef v17 = [(MOVStreamReaderStreamOutput *)self reader];
          int v18 = [v17 restrictVideoFramesToEdits];

          if (v11) {
            int v19 = v18;
          }
          else {
            int v19 = 0;
          }
          if (v19 == 1)
          {
            do
            {
              if ([(MOVStreamReaderStreamOutput *)self isSampleInEdit:v11]) {
                break;
              }
              CFRelease(v11);
              id v20 = [(MOVStreamReaderStreamOutput *)self streamOutput];
              id v11 = (opaqueCMSampleBuffer *)[v20 copyNextSampleBuffer];
            }
            while (v11);
          }
          uint64_t v21 = [(MOVStreamReaderStreamOutput *)self attachmentsDataForStreamPts:&v82 duration:&v81];
          CMTime v80 = *v13;
          if (v12)
          {
            for (uint64_t i = [(MOVStreamReaderStreamOutput *)self timeCodeBufferForStream:&v80];
                  i && !CMSampleBufferGetNumSamples(i);
                  uint64_t i = [(MOVStreamReaderStreamOutput *)self timeCodeBufferForStream:&v80])
            {
              CFRelease(i);
            }
          }
          else
          {
            uint64_t i = 0;
          }
          if (v11)
          {
            if (CMSampleBufferGetNumSamples(v11)) {
              char v28 = v16;
            }
            else {
              char v28 = 1;
            }
            if ((v28 & 1) == 0) {
              goto LABEL_42;
            }
          }
          else if (!v16)
          {
            goto LABEL_56;
          }
          [(MOVStreamReaderStreamOutput *)self setFutureAttachmentsData:v21];
          CMTime v79 = v82;
          [(MOVStreamReaderStreamOutput *)self setFutureAttachmentsPts:&v79];
          CMTime v78 = v81;
          [(MOVStreamReaderStreamOutput *)self setFutureAttachmentsDuration:&v78];
          CMTime v77 = v80;
          [(MOVStreamReaderStreamOutput *)self setFutureTimeCodePts:&v77];
          [(MOVStreamReaderStreamOutput *)self setFutureTimeCodeBuffer:i];

          uint64_t i = 0;
          uint64_t v21 = 0;
          if (v11)
          {
LABEL_42:
            memset(&v76, 0, sizeof(v76));
            CMSampleBufferGetPresentationTimeStamp(&v76, v11);
            if (a6) {
              *(CMTime *)a6 = v76;
            }
            int v29 = [(MOVStreamReaderStreamOutput *)self assetTrack];
            [v29 nominalFrameRate];
            float v31 = v30;

            double v32 = 1.0 / v31 * 0.25;
            if (v21)
            {
              int v33 = (CMTime *)MEMORY[0x263F010E8];
              do
              {
                CMTime time = v76;
                double Seconds = CMTimeGetSeconds(&time);
                CMTime v74 = v82;
                if (vabdd_f64(Seconds, CMTimeGetSeconds(&v74)) <= v32) {
                  break;
                }
                CMTime time1 = v76;
                CMTime time2 = v82;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  [(MOVStreamReaderStreamOutput *)self setFutureAttachmentsData:v21];
                  CMTime v71 = v82;
                  [(MOVStreamReaderStreamOutput *)self setFutureAttachmentsPts:&v71];
                  CMTime v70 = v81;
                  [(MOVStreamReaderStreamOutput *)self setFutureAttachmentsDuration:&v70];

                  uint64_t v21 = 0;
                  break;
                }
                memset(&v69, 0, sizeof(v69));
                CMTime lhs = v82;
                [(MOVStreamReaderStreamOutput *)self frameDuration];
                CMTimeAdd(&v69, &lhs, &rhs);
                CMTime v66 = v76;
                CMTime v65 = v69;
                if (CMTimeCompare(&v66, &v65) < 0) {
                  break;
                }
                uint64_t v35 = [(MOVStreamReaderStreamOutput *)self assetReader];
                int v36 = v35;
                if (v35)
                {
                  [v35 timeRange];
                }
                else
                {
                  long long v84 = 0u;
                  long long v85 = 0u;
                  *(_OWORD *)buf = 0u;
                }
                *(_OWORD *)&v64.value = *(_OWORD *)buf;
                v64.epoch = v84;
                CMTime v63 = *v33;
                BOOL v37 = CMTimeCompare(&v64, &v63) == 0;

                if (!v37)
                {
                  CMTime v62 = v82;
                  CMTime v61 = v81;
                  CMTimeAdd((CMTime *)buf, &v62, &v61);
                  *(_OWORD *)&v69.value = *(_OWORD *)buf;
                  v69.epoch = v84;
                  CMTime v60 = v76;
                  *(_OWORD *)&v59.value = *(_OWORD *)buf;
                  v59.epoch = v84;
                  if (CMTimeCompare(&v60, &v59) < 0) {
                    break;
                  }
                }
                uint64_t v38 = [(MOVStreamReaderStreamOutput *)self attachmentsDataForStreamPts:&v82 duration:&v81];

                uint64_t v21 = v38;
              }
              while (v38);
            }
            while (i)
            {
              CMTime v58 = v76;
              double v46 = CMTimeGetSeconds(&v58);
              CMTime v57 = v80;
              if (vabdd_f64(v46, CMTimeGetSeconds(&v57)) <= v32) {
                break;
              }
              CMTime v56 = v76;
              CMTime v55 = v80;
              if (CMTimeCompare(&v56, &v55) < 0)
              {
                [(MOVStreamReaderStreamOutput *)self setFutureTimeCodeBuffer:i];
                CMTime v54 = v80;
                [(MOVStreamReaderStreamOutput *)self setFutureTimeCodePts:&v54];
                uint64_t i = 0;
                break;
              }
              memset(buf, 0, sizeof(buf));
              *(void *)&long long v84 = 0;
              CMTime v53 = v80;
              [(MOVStreamReaderStreamOutput *)self frameDuration];
              CMTimeAdd((CMTime *)buf, &v53, &v52);
              CMTime v51 = v76;
              *(_OWORD *)&v50.value = *(_OWORD *)buf;
              v50.epoch = v84;
              if (CMTimeCompare(&v51, &v50) < 0) {
                break;
              }
              uint64_t i = [(MOVStreamReaderStreamOutput *)self timeCodeBufferForStream:&v80];
            }
            if (a3) {
              *a3 = (id) v21;
            }
            if (a5) {
              *a5 = i;
            }
            goto LABEL_76;
          }
LABEL_56:
          id v39 = [(MOVStreamReaderStreamOutput *)self assetReader];
          BOOL v40 = [v39 status] == 3;

          if (v40)
          {
            long long v41 = [(MOVStreamReaderStreamOutput *)self assetReader];
            int v42 = [v41 error];
            if (!v42) {
              __assert_rtn("-[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsDataArray:readTimeCode:timecodeSampleBuffer:timestamp:error:]", "MOVStreamReaderStreamOutput.mm", 1699, "self.assetReader.error != nil");
            }

            if (a7)
            {
              v43 = [(MOVStreamReaderStreamOutput *)self assetReader];
              int v44 = [v43 error];
              *a7 = (id)[v44 copy];
            }
            id v11 = 0;
          }
          else
          {
            [(MOVStreamReaderStreamOutput *)self setEndOfStreamReached:1];
            while (v21 | (unint64_t)i)
            {
              uint64_t v45 = [(MOVStreamReaderStreamOutput *)self attachmentsDataForStreamPts:0 duration:0];

              uint64_t v21 = v45;
              uint64_t i = [(MOVStreamReaderStreamOutput *)self timeCodeBufferForStream:0];
            }
            id v11 = 0;
            uint64_t v21 = 0;
          }
LABEL_76:

          return v11;
        }
        CFRelease(v11);
        int64_t v27 = [(MOVStreamReaderStreamOutput *)self streamOutput];
        id v11 = (opaqueCMSampleBuffer *)[v27 copyNextSampleBuffer];
      }
    }
    int v16 = 0;
    goto LABEL_15;
  }
  int v10 = -[MOVStreamReaderStreamOutput timeCodeBufferForStream:](self, "timeCodeBufferForStream:", a6, a4);
  if (v10)
  {
    id v11 = v10;
    while (!CMSampleBufferGetTotalSampleSize(v11))
    {
      id v11 = [(MOVStreamReaderStreamOutput *)self timeCodeBufferForStream:a6];
      if (!v11) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    [(MOVStreamReaderStreamOutput *)self setEndOfStreamReached:1];
    id v11 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  return v11;
}

- (opaqueCMSampleBuffer)timeCodeBufferForStream:(id *)a3
{
  id v4 = self;
  if (a3)
  {
    long long v5 = *MEMORY[0x263F01098];
    a3->var3 = *(void *)(MEMORY[0x263F01098] + 16);
    *(_OWORD *)&a3->var0 = v5;
    if ([(MOVStreamReaderStreamOutput *)self futureTimeCodeBuffer])
    {
      [(MOVStreamReaderStreamOutput *)v4 futureTimeCodePts];
      *(CMTime *)a3 = v11;
LABEL_5:
      uint64_t v6 = [(MOVStreamReaderStreamOutput *)v4 futureTimeCodeBuffer];
      [(MOVStreamReaderStreamOutput *)v4 setFutureTimeCodeBuffer:0];
      return v6;
    }
  }
  else if ([(MOVStreamReaderStreamOutput *)self futureTimeCodeBuffer])
  {
    goto LABEL_5;
  }
  if ([(MOVStreamReaderStreamOutput *)v4 mediaType] != 4) {
    id v4 = v4->_timeCodeOutput;
  }
  unsigned int v7 = [(MOVStreamReaderStreamOutput *)v4 streamOutput];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = (opaqueCMSampleBuffer *)[v7 copyNextSampleBuffer];
    uint64_t v6 = v9;
    if (a3 && v9)
    {
      CMSampleBufferGetPresentationTimeStamp(&v11, v9);
      *(CMTime *)a3 = v11;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)attachmentsDataForStreamPts:(id *)a3 duration:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v7 = *MEMORY[0x263F01098];
    a3->var3 = *(void *)(MEMORY[0x263F01098] + 16);
    *(_OWORD *)&a3->var0 = v7;
  }
  uint64_t v8 = [(MOVStreamReaderStreamOutput *)self futureAttachmentsData];

  if (v8)
  {
    if (a3)
    {
      [(MOVStreamReaderStreamOutput *)self futureAttachmentsPts];
      *(_OWORD *)&a3->var0 = v30;
      a3->var3 = *(void *)&v31[0];
    }
    if (a4)
    {
      [(MOVStreamReaderStreamOutput *)self futureAttachmentsDuration];
      *(_OWORD *)&a4->var0 = v30;
      a4->var3 = *(void *)&v31[0];
    }
    id v9 = [(MOVStreamReaderStreamOutput *)self futureAttachmentsData];
    [(MOVStreamReaderStreamOutput *)self setFutureAttachmentsData:0];
  }
  else
  {
    int v10 = [(MOVStreamReaderStreamOutput *)self attachmentsAdaptor];
    CMTime v11 = v10;
    if (v10)
    {
      BOOL v12 = [v10 nextTimedMetadataGroup];
      id v13 = [v12 items];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        if (a3)
        {
          if (v12)
          {
            [v12 timeRange];
          }
          else
          {
            memset(v31, 0, sizeof(v31));
            long long v30 = 0u;
          }
          *(_OWORD *)&a3->var0 = v30;
          a3->var3 = *(void *)&v31[0];
        }
        if (a4)
        {
          if (v12)
          {
            [v12 timeRange];
          }
          else
          {
            memset(v31, 0, sizeof(v31));
            long long v30 = 0u;
          }
          *(_OWORD *)&a4->var0 = *(_OWORD *)((char *)v31 + 8);
          a4->var3 = *((void *)&v31[1] + 1);
        }
        id v9 = objc_opt_new();
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        int v19 = [v12 items];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v27 != v21) {
                objc_enumerationMutation(v19);
              }
              long long v23 = [*(id *)(*((void *)&v26 + 1) + 8 * i) value];
              if (v23) {
                [v9 addObject:v23];
              }
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v36 count:16];
          }
          while (v20);
        }
      }
      else
      {

        id v9 = 0;
      }
    }
    else
    {
      CFDictionaryRef v15 = [(MOVStreamReaderStreamOutput *)self seiTrackReader];
      id v25 = 0;
      id v9 = (void *)[v15 copyNextSEIPts:&v30 deserialize:0 error:&v25];
      id v16 = v25;

      if (v16)
      {
        CFDictionaryRef v17 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = [(MOVStreamReaderStreamOutput *)self streamId];
          *(_DWORD *)buf = 138543618;
          int v33 = v18;
          __int16 v34 = 2114;
          id v35 = v16;
          _os_log_impl(&dword_21B5ED000, v17, OS_LOG_TYPE_ERROR, "Error reading SEI for %{public}@: %{public}@", buf, 0x16u);
        }
        id v9 = 0;
      }
      else if (a3 && v9)
      {
        *(_OWORD *)&a3->var0 = v30;
        a3->var3 = *(void *)&v31[0];
      }
    }
  }

  return v9;
}

- (id)nextAttachmentWithError:(id *)a3
{
  long long v5 = [(MOVStreamReaderStreamOutput *)self attachmentsAdaptor];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v7 = [v5 nextTimedMetadataGroup];
    uint64_t v8 = [v7 items];
    id v9 = [v8 firstObject];

    if (v9)
    {
      int v10 = [v9 value];
      CMTime v11 = [(MOVStreamReaderStreamOutput *)self decodeAttachmentsData:v10 error:a3];
    }
    else
    {
      CMTime v11 = 0;
    }
  }
  else
  {
    CMTime v11 = 0;
  }

  return v11;
}

- (id)decodeAttachmentsData:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    id v9 = 0;
    goto LABEL_23;
  }
  uint64_t v38 = 0;
  int v7 = [(MOVStreamReaderStreamOutput *)self attachmentSerializationMode];
  if (!v7)
  {
    id v35 = 0;
    uint64_t v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:1 error:&v35];
    id v10 = v35;
    if (v10)
    {
      CMTime v11 = v10;
      id v34 = 0;
      BOOL v12 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:&v38 error:&v34];
      id v13 = v34;

      uint64_t v14 = NSString;
      CFDictionaryRef v15 = [(MOVStreamReaderStreamOutput *)self streamId];
      id v16 = [v14 stringWithFormat:@"Wrong attachments serialization mode JSON for stream '%@' (fallback to PLIST).", v15];

      CFDictionaryRef v17 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v42 = v16;
        _os_log_impl(&dword_21B5ED000, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      [(MOVStreamReaderStreamOutput *)self setAttachmentSerializationMode:1];
      id v18 = v12;

      uint64_t v8 = v18;
      goto LABEL_21;
    }
LABEL_11:
    id v18 = 0;
    id v13 = 0;
    goto LABEL_21;
  }
  if (v7 != 1)
  {
    if (v7 != 2)
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown AttachmentSerializationMode = %d for frame metadata!", -[MOVStreamReaderStreamOutput attachmentSerializationMode](self, "attachmentSerializationMode"));
      id v25 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v42 = v24;
        _os_log_impl(&dword_21B5ED000, v25, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      id v18 = 0;
      id v13 = 0;
      uint64_t v8 = 0;
      goto LABEL_21;
    }
    id v39 = @"RawAttachmentData";
    id v40 = v6;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    goto LABEL_11;
  }
  id v37 = 0;
  id v18 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:&v38 error:&v37];
  id v13 = v37;
  if (v13)
  {
    id v36 = 0;
    uint64_t v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:1 error:&v36];
    id v19 = v36;
    uint64_t v20 = NSString;
    if (!v8)
    {
      long long v28 = [v13 localizedDescription];
      long long v29 = [v20 stringWithFormat:@"Metadata PLIST Read error: %@", v28];

      [MEMORY[0x263F087E8] populateReaderError:a4 message:v29 code:8];
      long long v30 = NSString;
      float v31 = [(MOVStreamReaderStreamOutput *)self streamId];
      double v32 = [v30 stringWithFormat:@"No matching serialization mode for stream '%@' (fallback to RAW).", v31];

      int v33 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v42 = v32;
        _os_log_impl(&dword_21B5ED000, v33, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      [(MOVStreamReaderStreamOutput *)self setAttachmentSerializationMode:2];
      id v9 = [(MOVStreamReaderStreamOutput *)self decodeAttachmentsData:v6 error:0];

      id v26 = 0;
      goto LABEL_22;
    }
    uint64_t v21 = [(MOVStreamReaderStreamOutput *)self streamId];
    long long v22 = [v20 stringWithFormat:@"Wrong attachments serialization mode PLIST for stream '%@' (fallback to JSON).", v21];

    long long v23 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v42 = v22;
      _os_log_impl(&dword_21B5ED000, v23, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    [(MOVStreamReaderStreamOutput *)self setAttachmentSerializationMode:0];
  }
  else
  {
    id v18 = v18;
    uint64_t v8 = v18;
  }
LABEL_21:
  id v26 = v8;
  id v9 = v26;
LABEL_22:

LABEL_23:

  return v9;
}

- (opaqueCMSampleBuffer)grabNextSampleBufferForStreamTimestamp:(id *)a3 error:(id *)a4
{
  id v10 = 0;
  id v6 = [(MOVStreamReaderStreamOutput *)self nextSampleBufferForStreamAttachmentsData:&v10 timestamp:a3 error:a4];
  id v7 = v10;
  if (v6)
  {
    CFDictionaryRef v8 = [(MOVStreamReaderStreamOutput *)self decodeAttachmentsData:v7 error:a4];
    if (v8) {
      CMSetAttachments(v6, v8, 1u);
    }
  }
  return v6;
}

- (id)grabNextMetadataItemsTimeRange:(id *)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v5 = [(MOVStreamReaderStreamOutput *)self grabNextTimedMetadataGroupOfStreamError:a4];
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263EFF980];
    CFDictionaryRef v8 = [v5 items];
    id v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = [v6 items];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          [v9 addObject:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    if (a3)
    {
      [v6 timeRange];
      *(_OWORD *)&a3->var0.var0 = v15;
      *(_OWORD *)&a3->var0.var3 = v16;
      *(_OWORD *)&a3->var1.var1 = v17;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)grabNextMetadataItemsOfTrackAssociatedWithStreamWithIdentifier:(id)a3 timeRange:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(MOVStreamReaderStreamOutput *)self associatedMetadataOutputs];
  id v10 = [v9 objectForKey:v8];

  if (v10)
  {
    uint64_t v11 = [v10 grabNextMetadataItemsTimeRange:a4 error:a5];
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"No associated metadata stream found with identifier '%@'.", v8];
    [MEMORY[0x263F087E8] populateReaderError:a5 message:v12 code:7];

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)grabNextTimedMetadataGroupOfStreamError:(id *)a3
{
  long long v5 = [(MOVStreamReaderStreamOutput *)self metadataTrackMetadataAdaptor];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 nextTimedMetadataGroup];
    id v8 = v7;
    if (v7)
    {
      id v8 = v7;
      id v9 = v8;
    }
    else
    {
      uint64_t v12 = [(MOVStreamReaderStreamOutput *)self assetReader];
      uint64_t v13 = [v12 status];

      if (v13 == 3)
      {
        uint64_t v14 = [(MOVStreamReaderStreamOutput *)self assetReader];
        long long v15 = [v14 error];
        if (!v15) {
          __assert_rtn("-[MOVStreamReaderStreamOutput grabNextTimedMetadataGroupOfStreamError:]", "MOVStreamReaderStreamOutput.mm", 2070, "self.assetReader.error != nil");
        }

        if (a3)
        {
          long long v16 = [(MOVStreamReaderStreamOutput *)self assetReader];
          long long v17 = [v16 error];
          *a3 = (id)[v17 copy];
        }
        id v9 = 0;
      }
      else
      {
        [(MOVStreamReaderStreamOutput *)self setEndOfStreamReached:1];
        id v9 = 0;
      }
    }
  }
  else
  {
    id v10 = NSString;
    uint64_t v11 = [(MOVStreamReaderStreamOutput *)self streamId];
    id v8 = [v10 stringWithFormat:@"No AVAssetReaderOutputMetadataAdaptor found for metadata stream: '%@'", v11];

    [MEMORY[0x263F087E8] populateReaderError:a3 message:v8 code:5];
    id v9 = 0;
  }

  return v9;
}

- (id)grabNextMetadataOfStreamTimeRange:(id *)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if ([(MOVStreamReaderStreamOutput *)self mediaType] != 2)
  {
    uint64_t v12 = 0;
    goto LABEL_30;
  }
  int v33 = a3;
  id v6 = [(MOVStreamReaderStreamOutput *)self version];
  id v7 = [v6 versionedKey:@"mdta/com.apple.metadata_stream_item" modifier:0];

  id v8 = [(MOVStreamReaderStreamOutput *)self metadataTrackMetadataAdaptor];
  id v35 = v8;
  if (v8)
  {
    id v9 = [v8 nextTimedMetadataGroup];
    id v34 = v9;
    if (v9)
    {
      id v10 = (void *)MEMORY[0x263EFF980];
      uint64_t v11 = [v9 items];
      uint64_t v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v13 = [v34 items];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v41 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            long long v18 = [v17 identifier];
            int v19 = [v18 isEqualToString:v7];

            if (v19
              || ([v17 identifier],
                  long long v22 = objc_claimAutoreleasedReturnValue(),
                  int v23 = [v22 isEqualToString:@"mdta/com.apple.rawIMUDict"],
                  v22,
                  v23))
            {
              long long v20 = [v17 value];
              long long v21 = (void *)[v20 copy];
              [v12 addObject:v21];
            }
            else
            {
              long long v20 = [v17 value];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v24 = [v17 value];
                uint64_t v25 = [v24 copy];
              }
              else
              {
                uint64_t v24 = +[MOVStreamIOUtility getPlistFriendlyCopyOf:v20];
                uint64_t v25 = [MEMORY[0x263F08AC0] dataWithPropertyList:v24 format:200 options:0 error:a4];
              }
              long long v21 = (void *)v25;

              if (v21) {
                [v12 addObject:v21];
              }
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v14);
      }

      if (v33)
      {
        [v34 timeRange];
        *(_OWORD *)&v33->var0.var0 = v37;
        *(_OWORD *)&v33->var0.var3 = v38;
        *(_OWORD *)&v33->var1.var1 = v39;
      }

      goto LABEL_29;
    }
    id v26 = [(MOVStreamReaderStreamOutput *)self assetReader];
    uint64_t v27 = [v26 status];

    if (v27 == 3)
    {
      long long v28 = [(MOVStreamReaderStreamOutput *)self assetReader];
      long long v29 = [v28 error];
      if (!v29) {
        __assert_rtn("-[MOVStreamReaderStreamOutput grabNextMetadataOfStreamTimeRange:error:]", "MOVStreamReaderStreamOutput.mm", 2136, "self.assetReader.error != nil");
      }

      if (a4)
      {
        long long v30 = [(MOVStreamReaderStreamOutput *)self assetReader];
        float v31 = [v30 error];
        *a4 = (id)[v31 copy];
      }
    }
    else
    {
      [(MOVStreamReaderStreamOutput *)self setEndOfStreamReached:1];
    }
  }
  uint64_t v12 = 0;
LABEL_29:

LABEL_30:

  return v12;
}

- (BOOL)shouldDiscardStream:(id)a3 mediaType:(int64_t)a4 track:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v13 = [(MOVStreamReaderStreamOutput *)self reader];
    char v14 = [v12 reader:v13 shouldDiscardStream:v8 mediaType:a4 track:v9];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)findTimeCodeTrackAssociatedWithTrack:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 asset];
  long long v5 = [v4 tracksWithMediaType:*MEMORY[0x263EF9D40]];

  if ([v5 count])
  {
    id v6 = [v3 associatedTracksOfType:*MEMORY[0x263EFA1B8]];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          char v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v6, "containsObject:", v11, (void)v13))
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)findTracksAssociatedWithTimeCodeTrack:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 asset];
  long long v16 = [v4 tracks];

  long long v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v16;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = *MEMORY[0x263EFA1B8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 associatedTracksOfType:v9];
        int v13 = [v12 containsObject:v3];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  long long v14 = (void *)[v5 copy];

  return v14;
}

- (BOOL)addAssociatedMetadataTracks:(id)a3 rawSampleAttachmentsIdentifier:(id)a4 trackKindIdentifier:(id)a5 movVersion:(id)a6 error:(id *)a7
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v47 = a3;
  id v11 = a5;
  id v50 = a6;
  id v12 = [a4 componentsSeparatedByString:@"/"];
  CMTime v54 = [v12 objectAtIndexedSubscript:1];

  int v48 = objc_opt_new();
  CMTime v55 = self;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v47;
  uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v13)
  {
    uint64_t v52 = *(void *)v63;
LABEL_3:
    uint64_t v53 = v13;
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v63 != v52) {
        objc_enumerationMutation(obj);
      }
      long long v15 = *(void **)(*((void *)&v62 + 1) + 8 * v14);
      long long v16 = [v15 metadata];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v59;
LABEL_8:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v59 != v19) {
            objc_enumerationMutation(v17);
          }
          long long v21 = *(void **)(*((void *)&v58 + 1) + 8 * v20);
          uint64_t v22 = [v21 identifier];
          int v23 = [v22 isEqualToString:v11];

          if (v23) {
            break;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v66 count:16];
            if (v18) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }
        uint64_t v24 = [v21 value];

        uint64_t v25 = (void *)v24;
        if (v24) {
          goto LABEL_17;
        }
      }
      else
      {
LABEL_14:
      }
      uint64_t v25 = +[MOVStreamIOUtility getCustomAssociatedMetadataStreamIdFromTrack:v15];
LABEL_17:
      CMTime v56 = v25;
      if ([v25 isEqualToString:v54])
      {
        id v26 = (id)[objc_alloc(MEMORY[0x263EFA4D8]) initWithTrack:v15 outputSettings:0];
        uint64_t v27 = [(MOVStreamReaderStreamOutput *)v55 assetReader];
        int v28 = [v27 canAddOutput:v26];

        if (v28)
        {
          long long v29 = [(MOVStreamReaderStreamOutput *)v55 assetReader];
          [v29 addOutput:v26];

          long long v30 = (MOVStreamReaderStreamOutput *)[objc_alloc(MEMORY[0x263EFA4D0]) initWithAssetReaderTrackOutput:v26];
          [(MOVStreamReaderStreamOutput *)v55 setAttachmentsAdaptor:v30];
LABEL_25:
          int v43 = 3;
          goto LABEL_29;
        }
        long long v30 = [NSString stringWithFormat:@"Can't add metadata track (%@) to the AVAssetReader.", v15];
        int v43 = 1;
        [MEMORY[0x263F087E8] populateReaderError:a7 message:v30 code:1];
      }
      else
      {
        float v31 = [MOVStreamReaderStreamOutput alloc];
        double v32 = [(MOVStreamReaderStreamOutput *)v55 assetReader];
        int v33 = [(MOVStreamReaderStreamOutput *)v55 reader];
        id v34 = [(MOVStreamReaderStreamOutput *)v55 reader];
        id v35 = [v34 delegate];
        id v57 = 0;
        long long v30 = [(MOVStreamReaderStreamOutput *)v31 initWithMetadataTrack:v15 assetReader:v32 version:v50 unknownStreamId:v56 reader:v33 delegate:v35 error:&v57];
        id v26 = v57;

        if (v26)
        {
          id v36 = [(MOVStreamReaderStreamOutput *)v55 reader];
          long long v37 = [v36 delegate];
          if (v37)
          {
            long long v38 = [(MOVStreamReaderStreamOutput *)v55 reader];
            long long v39 = [v38 delegate];
            char v40 = objc_opt_respondsToSelector();

            if ((v40 & 1) == 0) {
              goto LABEL_25;
            }
            id v36 = [(MOVStreamReaderStreamOutput *)v55 reader];
            long long v41 = [v36 delegate];
            long long v42 = [(MOVStreamReaderStreamOutput *)v55 reader];
            [v41 reader:v42 didReceiveWarning:v26];
          }
          int v43 = 3;
        }
        else
        {
          id v36 = [(MOVStreamReaderStreamOutput *)v30 streamId];
          [v48 setObject:v30 forKey:v36];
          int v43 = 0;
        }
      }
LABEL_29:

      if (v43 != 3 && v43)
      {
        BOOL v45 = 0;
        int v44 = obj;
        goto LABEL_35;
      }
      if (++v14 == v53)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  int v44 = (void *)[v48 copy];
  [(MOVStreamReaderStreamOutput *)v55 setAssociatedMetadataOutputs:v44];
  BOOL v45 = 1;
LABEL_35:

  return v45;
}

- (BOOL)isEmptySample:(opaqueCMSampleBuffer *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(MOVStreamReaderStreamOutput *)self assetTrack];
  long long v5 = [v4 segments];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v9 isEmpty])
        {
          memset(&v18, 0, sizeof(v18));
          CMSampleBufferGetPresentationTimeStamp(&v18, a3);
          if (v9)
          {
            [v9 timeMapping];
          }
          else
          {
            long long v15 = 0u;
            memset(&v16, 0, sizeof(v16));
            long long v13 = 0u;
            long long v14 = 0u;
          }
          CMTimeRange range = v16;
          CMTime v12 = v18;
          if (CMTimeRangeContainsTime(&range, &v12))
          {
            BOOL v10 = 1;
            goto LABEL_15;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)isSampleInEdit:(opaqueCMSampleBuffer *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(MOVStreamReaderStreamOutput *)self assetTrack];
  long long v5 = [v4 segments];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        memset(&v18, 0, sizeof(v18));
        CMSampleBufferGetPresentationTimeStamp(&v18, a3);
        if (v9)
        {
          [v9 timeMapping];
        }
        else
        {
          long long v15 = 0u;
          memset(&v16, 0, sizeof(v16));
          long long v13 = 0u;
          long long v14 = 0u;
        }
        CMTimeRange range = v16;
        CMTime v12 = v18;
        if (CMTimeRangeContainsTime(&range, &v12))
        {
          BOOL v10 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (id)streamIdFromTrackStreamTypeIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Depth"])
  {
    id v4 = @"FrontDepth";
  }
  else if ([v3 isEqualToString:@"Color"])
  {
    id v4 = @"FrontColor";
  }
  else if ([v3 isEqualToString:@"IR"])
  {
    id v4 = @"FrontIR";
  }
  else
  {
    id v4 = (__CFString *)v3;
  }

  return v4;
}

- (int)playbackPixelFormatForTrack:(id)a3 ofStream:(id)a4 streamEncodingType:(id)a5 inputPixelFormat:(unsigned int)a6 delegate:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (![v14 length])
  {
    FourCharCode MediaSubType = [(MOVStreamReaderStreamOutput *)self playbackPixelFormatForTrack:v12 ofStream:v13 delegate:v15];
    goto LABEL_8;
  }
  if (([v14 isEqualToString:@"h264"] & 1) != 0
    || [v14 isEqualToString:@"HEVC"])
  {
    if ([v13 isEqualToString:@"RawBayer"]) {
      a6 = 1278226736;
    }
    else {
      a6 = 875704438;
    }
    goto LABEL_9;
  }
  if ([v14 isEqualToString:@"slim"])
  {
    CMTime v18 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v29 = 0;
    long long v28 = xmmword_21B661460;
    char v19 = [v18 isOperatingSystemAtLeastVersion:&v28];

    if (v19)
    {
      long long v20 = [v12 formatDescriptions];
      long long v21 = [v20 objectAtIndexedSubscript:0];

      CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v21);
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x263F00EB0]);
      unsigned int valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      if (valuePtr < 0xA && ((0x381u >> valuePtr) & 1) != 0)
      {
        a6 = *(_DWORD *)&a010l010l010l01[4 * valuePtr];
      }
      else
      {
        uint64_t v24 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v31 = valuePtr;
          _os_log_impl(&dword_21B5ED000, v24, OS_LOG_TYPE_ERROR, "Got a Depth/IR stream which uses unknown version of SLIM (%d)", buf, 8u);
        }

        a6 = -1;
      }
    }
    else
    {
      a6 = 2037741158;
    }
    goto LABEL_9;
  }
  if (([v14 isEqualToString:@"HEVCMonochrome"] & 1) == 0
    && ![v14 isEqualToString:@"HEVCMonochrom"])
  {
    a6 = 875704438;
    if (![v14 isEqualToString:@"none"]) {
      goto LABEL_9;
    }
    uint64_t v25 = [v12 formatDescriptions];
    id v26 = [v25 objectAtIndexedSubscript:0];

    if (!v26) {
      goto LABEL_9;
    }
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v26);
LABEL_8:
    a6 = MediaSubType;
    goto LABEL_9;
  }
  if (a6 != 875704422 && a6 != 875704438 && a6 != 1278226488) {
    a6 = 1278226736;
  }
LABEL_9:

  return a6;
}

- (BOOL)formatDescriptionOfTrack:(id)a3 containsKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [a3 formatDescriptions];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];

  [(__CFDictionary *)CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v7) objectForKeyedSubscript:@"MetadataKeyTable"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  v17 = long long v19 = 0u;
  uint64_t v8 = [v17 allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKeyedSubscript:@"MetadataKeyValue"];
        id v13 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
        char v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)formatDescriptionOfTrack:(id)a3 containsKeyFromIndentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 componentsSeparatedByString:@"/"];
  if ([v7 count] == 2)
  {
    uint64_t v8 = [v7 lastObject];
    BOOL v9 = [(MOVStreamReaderStreamOutput *)self formatDescriptionOfTrack:v6 containsKey:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (int)playbackPixelFormatForTrack:(id)a3 ofStream:(id)a4 delegate:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v9 isEqualToString:@"FrontColor"] & 1) != 0
    || ([v9 isEqualToString:@"BackColorWide"] & 1) != 0)
  {
    int v11 = 875704438;
    goto LABEL_4;
  }
  int v11 = 875704438;
  if ([v9 isEqualToString:@"BackColorTele"]) {
    goto LABEL_4;
  }
  if (([v9 isEqualToString:@"BackIR"] & 1) != 0
    || ([v9 isEqualToString:@"FrontIR"] & 1) != 0
    || ([v9 isEqualToString:@"FrontDepth"] & 1) != 0
    || ([v9 isEqualToString:@"BackDepth"] & 1) != 0
    || [v9 isEqualToString:@"RawBayer"])
  {
    id v13 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v33 = 0;
    long long v32 = xmmword_21B661460;
    char v14 = [v13 isOperatingSystemAtLeastVersion:&v32];

    if (v14)
    {
      BOOL v15 = [v8 formatDescriptions];
      CMTimeRange v16 = [v15 objectAtIndexedSubscript:0];

      CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v16);
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x263F00EB0]);
      unsigned int valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      if (valuePtr < 0xA && ((0x381u >> valuePtr) & 1) != 0)
      {
        int v11 = *(_DWORD *)&a010l010l010l01[4 * valuePtr];
      }
      else
      {
        long long v19 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v35 = valuePtr;
          _os_log_impl(&dword_21B5ED000, v19, OS_LOG_TYPE_ERROR, "Got a Depth/IR stream which uses unknown version of SLIM (%d)", buf, 8u);
        }

        int v11 = -1;
      }
    }
    else
    {
      int v11 = 2037741158;
    }
    goto LABEL_4;
  }
  self->_pixelFormatWasGuessed = 1;
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v20 = [(MOVStreamReaderStreamOutput *)self reader];
    int v21 = [v10 pixelFormatForUnknownTrackOfReader:v20 streamId:v9];
    goto LABEL_25;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v23 = WeakRetained;
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      long long v20 = [(MOVStreamReaderStreamOutput *)self reader];
      int v21 = [v10 pixelFormatForUnknownTrackOfReader:v20];
LABEL_25:
      int v11 = v21;

      if (v11) {
        goto LABEL_4;
      }
    }
  }
  id v26 = objc_loadWeakRetained((id *)&self->_assetReader);
  uint64_t v27 = [v26 asset];
  id v30 = 0;
  unsigned int v28 = +[MOVStreamIOUtility detectPixelFormatForAsset:videoTrackId:error:](MOVStreamIOUtility, "detectPixelFormatForAsset:videoTrackId:error:", v27, [v8 trackID], &v30);
  id v29 = v30;

  if (!v28) {
    unsigned int v28 = +[MOVStreamIOUtility guessPixelFormatForTrack:v8];
  }
  if (v28) {
    int v11 = v28;
  }
  else {
    int v11 = 875704438;
  }

LABEL_4:
  return v11;
}

- (MOVStreamPostProcessor)postProcessor
{
  return (MOVStreamPostProcessor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPostProcessor:(id)a3
{
}

- (AVAssetReaderTrackOutput)streamOutput
{
  return (AVAssetReaderTrackOutput *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStreamOutput:(id)a3
{
}

- (AVAssetReaderOutputMetadataAdaptor)metadataTrackMetadataAdaptor
{
  return (AVAssetReaderOutputMetadataAdaptor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMetadataTrackMetadataAdaptor:(id)a3
{
}

- (NSDictionary)associatedMetadataOutputs
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssociatedMetadataOutputs:(id)a3
{
}

- (AVAssetReaderOutputMetadataAdaptor)attachmentsAdaptor
{
  return (AVAssetReaderOutputMetadataAdaptor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAttachmentsAdaptor:(id)a3
{
}

- (unsigned)originalPixelFormat
{
  return self->_originalPixelFormat;
}

- (void)setOriginalPixelFormat:(unsigned int)a3
{
  self->_originalPixelFormat = a3;
}

- (unsigned)determinedPixelFormat
{
  return self->_determinedPixelFormat;
}

- (void)setDeterminedPixelFormat:(unsigned int)a3
{
  self->_determinedPixelFormat = a3;
}

- (BOOL)pixelFormatWasGuessed
{
  return self->_pixelFormatWasGuessed;
}

- (void)setPixelFormatWasGuessed:(BOOL)a3
{
  self->_pixelFormatWasGuessed = a3;
}

- (int)attachmentSerializationMode
{
  return self->_attachmentSerializationMode;
}

- (void)setAttachmentSerializationMode:(int)a3
{
  self->_attachmentSerializationMode = a3;
}

- (BOOL)isLegacyIMUTrack
{
  return self->_isLegacyIMUTrack;
}

- (void)setIsLegacyIMUTrack:(BOOL)a3
{
  self->_isLegacyIMUTrack = a3;
}

- (BOOL)customMetadataFormat
{
  return self->_customMetadataFormat;
}

- (void)setCustomMetadataFormat:(BOOL)a3
{
  self->_customMetadataFormat = a3;
}

- (NSArray)futureAttachmentsData
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFutureAttachmentsData:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureAttachmentsPts
{
  objc_copyStruct(retstr, &self->_futureAttachmentsPts, 24, 1, 0);
  return result;
}

- (void)setFutureAttachmentsPts:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureAttachmentsDuration
{
  objc_copyStruct(retstr, &self->_futureAttachmentsDuration, 24, 1, 0);
  return result;
}

- (void)setFutureAttachmentsDuration:(id *)a3
{
}

- (opaqueCMSampleBuffer)futureTimeCodeBuffer
{
  return self->_futureTimeCodeBuffer;
}

- (void)setFutureTimeCodeBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_futureTimeCodeBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureTimeCodePts
{
  objc_copyStruct(retstr, &self->_futureTimeCodePts, 24, 1, 0);
  return result;
}

- (void)setFutureTimeCodePts:(id *)a3
{
}

- (MIOVersion)version
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_version);

  return (MIOVersion *)WeakRetained;
}

- (void)setVersion:(id)a3
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

- (MOVStreamReader)reader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reader);

  return (MOVStreamReader *)WeakRetained;
}

- (void)setReader:(id)a3
{
}

- (AVAssetReader)assetReader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetReader);

  return (AVAssetReader *)WeakRetained;
}

- (void)setAssetReader:(id)a3
{
}

- (NSString)streamId
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStreamId:(id)a3
{
}

- (BOOL)isMIOStream
{
  return self->_isMIOStream;
}

- (void)setIsMIOStream:(BOOL)a3
{
  self->_isMIOStream = a3;
}

- (NSString)attachmentsIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAttachmentsIdentifier:(id)a3
{
}

- (NSString)trackKindIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrackKindIdentifier:(id)a3
{
}

- (AVAssetTrack)assetTrack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetTrack);

  return (AVAssetTrack *)WeakRetained;
}

- (void)setAssetTrack:(id)a3
{
}

- (BOOL)endOfStreamReached
{
  return self->_endOfStreamReached;
}

- (void)setEndOfStreamReached:(BOOL)a3
{
  self->_endOfStreamReached = a3;
}

- (NSString)relatedStreamId
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRelatedStreamId:(id)a3
{
}

- (NSString)relationSpecifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRelationSpecifier:(id)a3
{
}

- (CGAffineTransform)transform
{
  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
}

- (unint64_t)trackTypeInfo
{
  return self->_trackTypeInfo;
}

- (void)setTrackTypeInfo:(unint64_t)a3
{
  self->_trackTypeInfo = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (BOOL)firstVideoFrameRead
{
  return self->_firstVideoFrameRead;
}

- (void)setFirstVideoFrameRead:(BOOL)a3
{
  self->_firstVideoFrameRead = a3;
}

- (BOOL)isStereoVideoStream
{
  return self->_stereoVideoStream;
}

- (void)setStereoVideoStream:(BOOL)a3
{
  self->_stereoVideoStream = a3;
}

- (NSDictionary)additionalCompressionProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAdditionalCompressionProperties:(id)a3
{
}

- (NSArray)videoLayerIds
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setVideoLayerIds:(id)a3
{
}

- (BOOL)hasTimeCode
{
  return self->_hasTimeCode;
}

- (void)setHasTimeCode:(BOOL)a3
{
  self->_hasTimeCode = a3;
}

- (BOOL)isTimeRangeMetadataStream
{
  return self->_timeRangeMetadataStream;
}

- (void)setTimeRangeMetadataStream:(BOOL)a3
{
  self->_timeRangeMetadataStream = a3;
}

- (NSDictionary)synthesizedTimeCodes
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSynthesizedTimeCodes:(id)a3
{
}

- (BOOL)synthesizedTimeCodeIsDropFrame
{
  return self->_synthesizedTimeCodeIsDropFrame;
}

- (void)setSynthesizedTimeCodeIsDropFrame:(BOOL)a3
{
  self->_synthesizedTimeCodeIsDropFrame = a3;
}

- (MIOSEITrackReader)seiTrackReader
{
  return (MIOSEITrackReader *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSeiTrackReader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seiTrackReader, 0);
  objc_storeStrong((id *)&self->_synthesizedTimeCodes, 0);
  objc_storeStrong((id *)&self->_videoLayerIds, 0);
  objc_storeStrong((id *)&self->_additionalCompressionProperties, 0);
  objc_storeStrong((id *)&self->_relationSpecifier, 0);
  objc_storeStrong((id *)&self->_relatedStreamId, 0);
  objc_destroyWeak((id *)&self->_assetTrack);
  objc_storeStrong((id *)&self->_trackKindIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentsIdentifier, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_destroyWeak((id *)&self->_assetReader);
  objc_destroyWeak((id *)&self->_reader);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_version);
  objc_storeStrong((id *)&self->_futureAttachmentsData, 0);
  objc_storeStrong((id *)&self->_attachmentsAdaptor, 0);
  objc_storeStrong((id *)&self->_associatedMetadataOutputs, 0);
  objc_storeStrong((id *)&self->_metadataTrackMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_streamOutput, 0);
  objc_storeStrong((id *)&self->postProcessor, 0);
  objc_storeStrong((id *)&self->_associatedOutputs, 0);

  objc_storeStrong((id *)&self->_timeCodeOutput, 0);
}

- (void)copyNextStereoFrames:rightBuffer:timestamp:error:.cold.1()
{
}

- (void)copyNextStereoFrames:rightBuffer:timestamp:error:.cold.2()
{
}

- (void)stereoFramesFromSampleBuffer:outLeft:outRight:error:.cold.1()
{
}

@end