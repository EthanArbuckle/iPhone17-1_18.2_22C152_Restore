@interface AVHUDStringGenerator
+ (id)descriptionStringForBitRate:(double)a3;
+ (id)descriptionStringForFormatOfTrack:(id)a3;
+ (id)descriptionStringForTracksOfPlayerItem:(id)a3;
+ (id)descriptionStringForVideoRangeOfFormatDescription:(opaqueCMFormatDescription *)a3;
- (AVPlayer)player;
- (BOOL)captureCompleteURI;
- (BOOL)spatialDiagnostics;
- (NSNumber)audioSpatializationMode;
- (NSNumber)displayResolutionHeight;
- (NSNumber)displayResolutionWidth;
- (NSString)formattedDisplayString;
- (int64_t)prevStallCount;
- (int64_t)prevVariantIdx;
- (int64_t)totalStallCount;
- (void)dealloc;
- (void)setCaptureCompleteURI:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPrevStallCount:(int64_t)a3;
- (void)setPrevVariantIdx:(int64_t)a3;
- (void)setSpatialDiagnostics:(BOOL)a3;
- (void)setTotalStallCount:(int64_t)a3;
- (void)update;
- (void)updateFromPlayer;
- (void)updateFromPlayerItem;
@end

@implementation AVHUDStringGenerator

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVHUDStringGenerator;
  [(AVHUDStringGenerator *)&v3 dealloc];
}

+ (id)descriptionStringForFormatOfTrack:(id)a3
{
  v4 = 0;
  if ([a3 statusOfValueForKey:@"formatDescriptions" error:0] == 2)
  {
    v5 = (void *)[a3 formatDescriptions];
    if (v5)
    {
      v6 = v5;
      uint64_t v7 = [v5 count];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = 0;
        key = (void *)*MEMORY[0x1E4F215E8];
        while (1)
        {
          v10 = (const opaqueCMFormatDescription *)[v6 objectAtIndex:v9];
          CMMediaType MediaType = CMFormatDescriptionGetMediaType(v10);
          unsigned int v22 = 0;
          unsigned int v22 = bswap32(CMFormatDescriptionGetMediaSubType(v10));
          uint64_t v12 = 0;
          if ([a3 statusOfValueForKey:@"languageCode" error:0] == 2) {
            uint64_t v12 = [a3 languageCode];
          }
          v13 = @"video format desc ";
          if (MediaType != 1986618469)
          {
            v13 = @"audio format desc ";
            if (MediaType != 1936684398) {
              break;
            }
          }
          v14 = (void *)[MEMORY[0x1E4F28E78] stringWithString:v13];
          v4 = v14;
          if (v12) {
            [v14 appendFormat:@"(%@) ", v12];
          }
          if (v8 != 1) {
            objc_msgSend(v4, "appendFormat:", @"%d ", v9 + 1);
          }
          objc_msgSend(v4, "appendFormat:", @"- codec:%.4s ", &v22);
          if (MediaType == 1986618469)
          {
            [v4 appendFormat:@"video-range:%@", +[AVHUDStringGenerator descriptionStringForVideoRangeOfFormatDescription:](AVHUDStringGenerator, "descriptionStringForVideoRangeOfFormatDescription:", v10)];
            CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(v10);
            if (Extensions)
            {
              Value = CFDictionaryGetValue(Extensions, key);
              if (Value)
              {
                v17 = Value;
                if (runningAnInternalBuild_onceToken != -1) {
                  dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
                }
                if (runningAnInternalBuild_internalBuild) {
                  [v4 appendFormat:@", bit-depth:%@", v17];
                }
              }
            }
          }
          else
          {
            RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(v10);
            if (RichestDecodableFormat)
            {
              p_mSampleRate = &RichestDecodableFormat->mASBD.mSampleRate;
              [v4 appendFormat:@", channels:%u", RichestDecodableFormat->mASBD.mChannelsPerFrame];
              [v4 appendFormat:@", sample-rate:%uHz", *p_mSampleRate];
            }
          }
          [v4 appendString:@"\n"];
          if (v8 == ++v9) {
            return v4;
          }
        }
      }
    }
    return 0;
  }
  return v4;
}

+ (id)descriptionStringForBitRate:(double)a3
{
  double v3 = a3 / 1000.0;
  if (a3 / 1000.0 <= 1.0)
  {
    v4 = @"bps";
  }
  else
  {
    a3 = v3 / 1000.0;
    if (v3 / 1000.0 <= 1.0)
    {
      v4 = @"kbps";
      a3 = v3;
    }
    else
    {
      v4 = @"Mbps";
    }
  }
  return (id)[NSString stringWithFormat:@"%0.2f%@", *(void *)&a3, v4];
}

+ (id)descriptionStringForVideoRangeOfFormatDescription:(opaqueCMFormatDescription *)a3
{
  unsigned int v3 = CMVideoFormatDescriptionGetVideoDynamicRange() - 1;
  if (v3 > 8) {
    return @"Unknown";
  }
  else {
    return off_1E57B76D0[v3];
  }
}

+ (id)descriptionStringForTracksOfPlayerItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F28E78] string];
  [v4 setString:@"average bitrate "];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = (void *)[a3 tracks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = (void *)[v10 assetTrack];
        if ([v10 isEnabled])
        {
          if ([v11 statusOfValueForKey:@"mediaType" error:0] == 2
            && [v11 statusOfValueForKey:@"estimatedDataRate" error:0] == 2)
          {
            uint64_t v12 = (void *)[v11 mediaType];
            char v13 = [v12 isEqualToString:@"vide"];
            v14 = @"video:";
            if ((v13 & 1) != 0
              || (int v15 = [v12 isEqualToString:@"soun"], v14 = @"audio:", v15))
            {
              [v4 appendFormat:v14];
              [v11 estimatedDataRate];
              v17 = @" -";
              if (v16 > 0.0) {
                v17 = +[AVHUDStringGenerator descriptionStringForBitRate:v16];
              }
              [v4 appendFormat:@"%@  ", v17];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  return v4;
}

- (void)updateFromPlayer
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  p_player = &self->_player;
  v4 = (void *)[objc_loadWeak((id *)&self->_player) _copyPerformanceDataForCurrentItem];
  if (!self->_spatialDiagnostics) {
    goto LABEL_8;
  }
  if (runningAnInternalBuild_onceToken != -1) {
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
  }
  if (runningAnInternalBuild_internalBuild)
  {
    if (v4)
    {
      v5 = (objc_class *)[v4 objectForKey:*MEMORY[0x1E4F33E70]];
      if (v5)
      {
        uint64_t v6 = 16;
LABEL_32:
        *(Class *)((char *)&self->super.isa + v6) = v5;
      }
    }
  }
  else
  {
LABEL_8:
    id v32 = 0;
    CGSize v24 = (CGSize)*MEMORY[0x1E4F1DB30];
    long long v31 = *MEMORY[0x1E4F1DB30];
    id v30 = 0;
    if ([objc_loadWeak((id *)p_player) _getDisplayVideoRange:&v32 displaySize:&v31 refreshRate:&v30])
    {
      HIDWORD(v7) = HIDWORD(v31);
      *(float *)&double v7 = *((double *)&v31 + 1);
      self->_displayResolutionHeight = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v7), "copy");
      HIDWORD(v8) = DWORD1(v31);
      *(float *)&double v8 = *(double *)&v31;
      self->_displayResolutionWidth = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v8), "copy");
      self->_refreshRate = (NSNumber *)[v30 copy];
      self->_videoRange = (NSString *)[v32 copy];
    }
    if (v4)
    {
      CFDictionaryRef v9 = (const __CFDictionary *)[v4 objectForKey:*MEMORY[0x1E4F33E78]];
      if (v9)
      {
        CGSize size = v24;
        CGSizeMakeWithDictionaryRepresentation(v9, &size);
        HIDWORD(v10) = HIDWORD(size.height);
        *(float *)&double v10 = size.height;
        self->_videoApproximateDisplaySizeHeight = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v10), "copy");
        HIDWORD(v11) = HIDWORD(size.width);
        *(float *)&double v11 = size.width;
        self->_videoApproximateDisplaySizeWidth = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v11), "copy");
      }
      if (runningAnInternalBuild_onceToken != -1) {
        dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
      }
      if (runningAnInternalBuild_internalBuild)
      {
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E4F33E80]), "firstObject");
        if (v12)
        {
          char v13 = v12;
          v14 = (void *)[v12 objectForKey:*MEMORY[0x1E4F34C18]];
          int v15 = (void *)[v13 objectForKey:*MEMORY[0x1E4F34BE0]];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v26;
            uint64_t v19 = *MEMORY[0x1E4F34BE8];
LABEL_19:
            uint64_t v20 = 0;
            while (1)
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * v20);
              long long v22 = objc_msgSend(v21, "objectForKey:", v19, v24);
              if (v22)
              {
                if (![v22 intValue]) {
                  break;
                }
              }
              if (v17 == ++v20)
              {
                uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
                if (v17) {
                  goto LABEL_19;
                }
                goto LABEL_29;
              }
            }
            if (!v21) {
              goto LABEL_29;
            }
            v23 = (void *)[v21 objectForKey:*MEMORY[0x1E4F34C20]];
          }
          else
          {
LABEL_29:
            v23 = 0;
          }
          self->_decoderFrameDrops = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v14, "intValue", v24)), "copy");
          if (v23)
          {
            v5 = (objc_class *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v23, "intValue")), "copy");
            uint64_t v6 = 216;
            goto LABEL_32;
          }
        }
      }
    }
  }
}

- (void)updateFromPlayerItem
{
  v2 = self;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  p_player = &self->_player;
  v4 = (void *)[objc_loadWeak((id *)&self->_player) currentItem];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "accessLog"), "events"), "lastObject");
    if (runningAnInternalBuild_onceToken != -1) {
      dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
    }
    if (runningAnInternalBuild_internalBuild)
    {
      if ([v6 URI])
      {
        BOOL captureCompleteURI = v2->_captureCompleteURI;
        double v8 = (void *)[v6 URI];
        if (!captureCompleteURI) {
          double v8 = objc_msgSend((id)objc_msgSend(v8, "componentsSeparatedByString:", @"?"), "objectAtIndex:", 0);
        }
      }
      else
      {
        double v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "asset"), "_absoluteURL"), "absoluteString");
      }
      v2->_playerItemURL = (NSString *)[v8 copy];
      if (objc_msgSend((id)objc_msgSend(v5, "asset"), "statusOfValueForKey:error:", @"streaming", 0) == 2)
      {
        if (objc_msgSend((id)objc_msgSend(v5, "asset"), "_isStreaming"))
        {
          CFDictionaryRef v9 = @"streaming (HLS)";
        }
        else
        {
          double v10 = objc_msgSend((id)objc_msgSend(v5, "asset"), "_absoluteURL");
          uint64_t v11 = [v10 scheme];
          if (v10)
          {
            uint64_t v12 = (void *)v11;
            if ([v10 isFileURL])
            {
              CFDictionaryRef v9 = @"local file";
            }
            else
            {
              CFDictionaryRef v9 = @"progressive download (CRABS)";
              if (([v12 isEqualToString:@"http"] & 1) == 0
                && ![v12 isEqualToString:@"https"])
              {
                CFDictionaryRef v9 = @"custom-loaded";
              }
            }
          }
          else
          {
            CFDictionaryRef v9 = @"unknown";
          }
        }
        v2->_assetType = &v9->isa;
      }
      if ([v6 playbackSessionID]) {
        v2->_sessionID = (NSString *)objc_msgSend((id)objc_msgSend(v6, "playbackSessionID"), "copy");
      }
      v2->_configurationGroup = (NSString *)objc_msgSend((id)objc_msgSend(v5, "configurationGroup"), "copy");
      if (v6) {
        v2->_totalFrameDrops = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", objc_msgSend(v6, "numberOfDroppedVideoFrames")), "copy");
      }
      char v13 = objc_msgSend((id)objc_msgSend(v5, "loadedTimeRanges"), "firstObject");
      if (v13)
      {
        memset(v70, 0, sizeof(v70));
        long long v69 = 0u;
        [v13 CMTimeRangeValue];
        [v5 currentTime];
        double Seconds = CMTimeGetSeconds(&time);
        *(_OWORD *)&v67.value = v69;
        v67.epoch = *(void *)&v70[0];
        double v15 = CMTimeGetSeconds(&v67);
        CMTime v67 = *(CMTime *)((char *)v70 + 8);
        double v16 = CMTimeGetSeconds(&v67);
        v2->_bufferedVideoPlayed = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", Seconds - v15), "copy");
        v2->_bufferedVideoRemaining = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v15 + v16 - Seconds), "copy");
      }
    }
    double v18 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v5, "asset"), "statusOfValueForKey:error:", @"tracks", 0);
    float v21 = 0.0;
    float v22 = 0.0;
    double v23 = v18;
    double v24 = v17;
    if (v19 == 2)
    {
      v60 = v6;
      v61 = p_player;
      v62 = v2;
      long long v25 = (void *)[MEMORY[0x1E4F28E78] string];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v26 = (void *)[v5 tracks];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v64;
        double v23 = v18;
        double v24 = v17;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v64 != v29) {
              objc_enumerationMutation(v26);
            }
            long long v31 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            if ([v31 isEnabled])
            {
              id v32 = +[AVHUDStringGenerator descriptionStringForFormatOfTrack:](AVHUDStringGenerator, "descriptionStringForFormatOfTrack:", [v31 assetTrack]);
              if (v32) {
                [v25 appendString:v32];
              }
              v33 = (void *)[v31 assetTrack];
              if ([v33 statusOfValueForKey:@"mediaType" error:0] == 2
                && [v33 statusOfValueForKey:@"nominalFrameRate" error:0] == 2
                && [v33 statusOfValueForKey:@"naturalSize" error:0] == 2
                && objc_msgSend((id)objc_msgSend(v33, "mediaType"), "isEqualToString:", @"vide"))
              {
                [v31 currentVideoFrameRate];
                float v21 = v34;
                [v33 nominalFrameRate];
                float v22 = v35;
                [v33 naturalSize];
                double v23 = v36;
                double v24 = v37;
              }
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v71 count:16];
        }
        while (v28);
      }
      else
      {
        double v23 = v18;
        double v24 = v17;
      }
      uint64_t v19 = 2;
      v2 = v62;
      if ([v25 length]) {
        v62->_trackFormatDescriptions = (NSString *)[v25 copy];
      }
      uint64_t v6 = v60;
      p_player = v61;
    }
    if (v18 == v23 && v17 == v24)
    {
      [v5 presentationSize];
      double v23 = v20;
      double v24 = v38;
    }
    *(float *)&double v20 = v24;
    v2->_presentationSizeHeight = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v20), "copy");
    *(float *)&double v39 = v23;
    v2->_presentationSizeWidth = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v39), "copy");
    if (v21 >= 0.5)
    {
      *(float *)&double v40 = v21;
      v2->_currentFrameRate = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v40), "copy");
    }
    if (v22 >= 0.5)
    {
      *(float *)&double v40 = v22;
      v2->_nominalFrameRate = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v40), "copy");
    }
    if (!v6) {
      goto LABEL_71;
    }
    v41 = (void *)MEMORY[0x1E4F28ED0];
    [v6 observedBitrate];
    v2->_networkBandiwdth = (NSNumber *)objc_msgSend((id)objc_msgSend(v41, "numberWithDouble:"), "copy");
    [v6 averageVideoBitrate];
    if (v42 <= 0.0 || ([v6 averageAudioBitrate], v43 <= 0.0))
    {
      if (v19 != 2) {
        goto LABEL_61;
      }
      id v46 = +[AVHUDStringGenerator descriptionStringForTracksOfPlayerItem:v5];
      uint64_t v47 = 168;
    }
    else
    {
      v44 = (void *)MEMORY[0x1E4F28ED0];
      [v6 averageVideoBitrate];
      v2->_averageVideoBitrate = (NSNumber *)objc_msgSend((id)objc_msgSend(v44, "numberWithDouble:"), "copy");
      v45 = (void *)MEMORY[0x1E4F28ED0];
      [v6 averageAudioBitrate];
      id v46 = (id)objc_msgSend(v45, "numberWithDouble:");
      uint64_t v47 = 160;
    }
    *(Class *)((char *)&v2->super.isa + v47) = (Class)[v46 copy];
LABEL_61:
    [v6 indicatedBitrate];
    if (v48 > 0.0 || ([v6 indicatedAverageBitrate], v49 > 0.0))
    {
      [v6 indicatedBitrate];
      if (v50 > 0.0)
      {
        v51 = (void *)MEMORY[0x1E4F28ED0];
        [v6 indicatedBitrate];
        *(float *)&double v52 = v52;
        v2->_peakIndicatedBitrate = (NSNumber *)objc_msgSend((id)objc_msgSend(v51, "numberWithFloat:", v52), "copy");
      }
      [v6 indicatedAverageBitrate];
      if (v53 > 0.0)
      {
        v54 = (void *)MEMORY[0x1E4F28ED0];
        [v6 indicatedAverageBitrate];
        *(float *)&double v55 = v55;
        v2->_averageIndicatedBitrate = (NSNumber *)objc_msgSend((id)objc_msgSend(v54, "numberWithFloat:", v55), "copy");
      }
    }
    uint64_t v56 = [v5 variantIndex];
    uint64_t v57 = v56;
    if (v2->_prevVariantIdx != v56)
    {
      v2->_prevVariantIdx = v56;
      v2->_prevStallCount = 0;
    }
    v2->_totalStallCount += [v6 numberOfStalls] - v2->_prevStallCount;
    v2->_prevStallCount = [v6 numberOfStalls];
    v2->_totalStalls = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", v2->_totalStallCount), "copy");
    v2->_variantIndex = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", v57), "copy");
    if (v2->_startupTime == 0.0)
    {
      [v6 startupTime];
      v2->_startupTime = v58;
    }
LABEL_71:
    v59 = (void *)[objc_loadWeak((id *)p_player) _ancillaryPerformanceInformationForDisplay];
    if (v59) {
      v2->_customPerfInfo = (NSString *)[v59 copy];
    }
  }
}

- (void)update
{
  [(AVHUDStringGenerator *)self updateFromPlayer];
  [(AVHUDStringGenerator *)self updateFromPlayerItem];
}

- (NSString)formattedDisplayString
{
  unsigned int v3 = (void *)[MEMORY[0x1E4F28E78] string];
  if (!self->_spatialDiagnostics) {
    goto LABEL_73;
  }
  if (runningAnInternalBuild_onceToken != -1) {
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
  }
  if (runningAnInternalBuild_internalBuild)
  {
    audioSpatializationMode = self->_audioSpatializationMode;
    if (audioSpatializationMode)
    {
      switch([(NSNumber *)audioSpatializationMode integerValue])
      {
        case 0:
        case 1:
          v5 = @"[ M-Ch ]";
          break;
        case 2:
          v5 = @"[ 2-Ch ]";
          break;
        case 3:
          v5 = @"[ S-Ch ]";
          break;
        default:
          goto LABEL_66;
      }
    }
    else
    {
LABEL_66:
      v5 = @"[ ?-Ch ]";
    }
    [v3 appendString:v5];
  }
  else
  {
LABEL_73:
    if (self->_playerItemURL) {
      [v3 appendFormat:@"%@\n", self->_playerItemURL];
    }
    if (self->_assetType) {
      [v3 appendFormat:@"asset type:%@\n", self->_assetType];
    }
    if (self->_sessionID) {
      [v3 appendFormat:@"session-id:%@\n", self->_sessionID];
    }
    if (self->_configurationGroup) {
      [v3 appendFormat:@"configurationGroup: %@\n", self->_configurationGroup];
    }
    if (self->_trackFormatDescriptions) {
      [v3 appendFormat:@"%@", self->_trackFormatDescriptions];
    }
    displayResolutionWidth = self->_displayResolutionWidth;
    if (displayResolutionWidth && self->_displayResolutionHeight)
    {
      double v7 = NSString;
      [(NSNumber *)displayResolutionWidth floatValue];
      double v9 = v8;
      [(NSNumber *)self->_displayResolutionHeight floatValue];
      [v3 appendString:objc_msgSend(v7, "stringWithFormat:", @"display resolution:%0.0f x %0.0f", *(void *)&v9, v10)];
    }
    refreshRate = self->_refreshRate;
    if (refreshRate)
    {
      [(NSNumber *)refreshRate doubleValue];
      [v3 appendFormat:@", refresh-rate:%0.2fHz", v12];
    }
    if (self->_videoRange) {
      [v3 appendFormat:@", video-range:%@\n", self->_videoRange];
    }
    videoApproximateDisplaySizeWidth = self->_videoApproximateDisplaySizeWidth;
    if (videoApproximateDisplaySizeWidth && self->_videoApproximateDisplaySizeHeight)
    {
      [(NSNumber *)videoApproximateDisplaySizeWidth floatValue];
      double v15 = v14;
      [(NSNumber *)self->_videoApproximateDisplaySizeHeight floatValue];
      objc_msgSend(v3, "appendFormat:", @"video approximate-display-size:%0.0f x %0.0f  ", *(void *)&v15, v16);
    }
    else
    {
      objc_msgSend(v3, "appendFormat:", @"video approximate-display-size:-  ", v41, v42);
    }
    presentationSizeWidth = self->_presentationSizeWidth;
    if (presentationSizeWidth && self->_presentationSizeHeight)
    {
      double v18 = NSString;
      [(NSNumber *)presentationSizeWidth floatValue];
      double v20 = v19;
      [(NSNumber *)self->_presentationSizeHeight floatValue];
      [v3 appendString:objc_msgSend(v18, "stringWithFormat:", @"natural-size:%0.0f x %0.0f\n", *(void *)&v20, v21)];
    }
    currentFrameRate = self->_currentFrameRate;
    if (currentFrameRate)
    {
      [(NSNumber *)currentFrameRate floatValue];
      objc_msgSend(v3, "appendFormat:", @"current frame rate:%0.2f\n", v23);
    }
    nominalFrameRate = self->_nominalFrameRate;
    if (nominalFrameRate)
    {
      [(NSNumber *)nominalFrameRate floatValue];
      objc_msgSend(v3, "appendFormat:", @"nominal frame rate:%0.2f\n", v25);
    }
    networkBandiwdth = self->_networkBandiwdth;
    if (networkBandiwdth)
    {
      [(NSNumber *)networkBandiwdth floatValue];
      [v3 appendFormat:@"network bandwidth:%@\n", +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v27)];
    }
    if (self->_averageAudioBitrate && self->_averageVideoBitrate)
    {
      [v3 appendString:@"average bitrate "];
      [(NSNumber *)self->_averageVideoBitrate floatValue];
      [v3 appendFormat:@"video:%@  ", +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v28)];
      [(NSNumber *)self->_averageAudioBitrate floatValue];
      [v3 appendFormat:@"audio:%@\n", +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v29)];
    }
    else if (self->_assetTrackInfo)
    {
      objc_msgSend(v3, "appendString:");
      [v3 appendString:@"\n"];
    }
    if (self->_peakIndicatedBitrate || self->_averageIndicatedBitrate)
    {
      [v3 appendString:@"indicated bitrate "];
      peakIndicatedBitrate = self->_peakIndicatedBitrate;
      if (peakIndicatedBitrate)
      {
        [(NSNumber *)peakIndicatedBitrate floatValue];
        [v3 appendFormat:@"peak:%@  ", +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v31)];
      }
      averageIndicatedBitrate = self->_averageIndicatedBitrate;
      if (averageIndicatedBitrate)
      {
        [(NSNumber *)averageIndicatedBitrate floatValue];
        [v3 appendFormat:@"average:%@  ", +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v33)];
      }
      [v3 appendString:@"\n"];
    }
    if (self->_variantIndex)
    {
      totalStalls = self->_totalStalls;
      if (totalStalls) {
        objc_msgSend(v3, "appendFormat:", @"stalls total:%ld  current-variant:%ld\n", -[NSNumber longValue](totalStalls, "longValue"), -[NSNumber longValue](self->_variantIndex, "longValue"));
      }
    }
    if (self->_totalFrameDrops)
    {
      [v3 appendFormat:@"frame drops "];
      objc_msgSend(v3, "appendFormat:", @"total:%ld  ", -[NSNumber longValue](self->_totalFrameDrops, "longValue"));
      decoderFrameDrops = self->_decoderFrameDrops;
      if (decoderFrameDrops) {
        objc_msgSend(v3, "appendFormat:", @"decode:%d  ", -[NSNumber intValue](decoderFrameDrops, "intValue"));
      }
      imageQueueFrameDrops = self->_imageQueueFrameDrops;
      if (imageQueueFrameDrops) {
        objc_msgSend(v3, "appendFormat:", @"imageQ:%d", -[NSNumber intValue](imageQueueFrameDrops, "intValue"));
      }
      [v3 appendString:@"\n"];
    }
    bufferedVideoPlayed = self->_bufferedVideoPlayed;
    if (bufferedVideoPlayed && self->_bufferedVideoRemaining)
    {
      [(NSNumber *)bufferedVideoPlayed doubleValue];
      objc_msgSend(v3, "appendFormat:", @"buffered video before:%0.1fs  ", v38);
      [(NSNumber *)self->_bufferedVideoRemaining doubleValue];
      objc_msgSend(v3, "appendFormat:", @"after:%0.1fs\n", v39);
    }
    if (self->_customPerfInfo) {
      [v3 appendFormat:@"%@\n", self->_customPerfInfo];
    }
    if (self->_startupTime > 0.0) {
      objc_msgSend(v3, "appendFormat:", @"startupTime:%fs", *(void *)&self->_startupTime);
    }
  }
  return (NSString *)v3;
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_loadWeak((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
}

- (BOOL)spatialDiagnostics
{
  return self->_spatialDiagnostics;
}

- (void)setSpatialDiagnostics:(BOOL)a3
{
  self->_spatialDiagnostics = a3;
}

- (BOOL)captureCompleteURI
{
  return self->_captureCompleteURI;
}

- (void)setCaptureCompleteURI:(BOOL)a3
{
  self->_BOOL captureCompleteURI = a3;
}

- (int64_t)prevVariantIdx
{
  return self->_prevVariantIdx;
}

- (void)setPrevVariantIdx:(int64_t)a3
{
  self->_prevVariantIdx = a3;
}

- (int64_t)prevStallCount
{
  return self->_prevStallCount;
}

- (void)setPrevStallCount:(int64_t)a3
{
  self->_prevStallCount = a3;
}

- (int64_t)totalStallCount
{
  return self->_totalStallCount;
}

- (void)setTotalStallCount:(int64_t)a3
{
  self->_totalStallCount = a3;
}

- (NSNumber)displayResolutionWidth
{
  return self->_displayResolutionWidth;
}

- (NSNumber)displayResolutionHeight
{
  return self->_displayResolutionHeight;
}

- (NSNumber)audioSpatializationMode
{
  return self->_audioSpatializationMode;
}

- (void).cxx_destruct
{
}

@end