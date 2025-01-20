@interface VCPProtoMovieHighlightResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasColorNormalizationBlob;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)colorNormalizationBlob;
- (VCPProtoBounds)playbackCrop;
- (VCPProtoTimeRange)timeRange;
- (VCPProtoVideoKeyFrame)keyFrame;
- (float)curationScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setColorNormalizationBlob:(id)a3;
- (void)setCurationScore:(float)a3;
- (void)setKeyFrame:(id)a3;
- (void)setPlaybackCrop:(id)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieHighlightResult

- (BOOL)hasColorNormalizationBlob
{
  return self->_colorNormalizationBlob != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieHighlightResult;
  v4 = [(VCPProtoMovieHighlightResult *)&v8 description];
  v5 = [(VCPProtoMovieHighlightResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v6 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"timeRange"];
  }
  *(float *)&double v4 = self->_curationScore;
  v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"curationScore"];

  keyFrame = self->_keyFrame;
  if (keyFrame)
  {
    v9 = [(VCPProtoVideoKeyFrame *)keyFrame dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"keyFrame"];
  }
  playbackCrop = self->_playbackCrop;
  if (playbackCrop)
  {
    v11 = [(VCPProtoBounds *)playbackCrop dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"playbackCrop"];
  }
  colorNormalizationBlob = self->_colorNormalizationBlob;
  if (colorNormalizationBlob) {
    [v3 setObject:colorNormalizationBlob forKey:@"colorNormalizationBlob"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieHighlightResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  if (self->_colorNormalizationBlob) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = (float *)a3;
  [v4 setTimeRange:self->_timeRange];
  v4[4] = self->_curationScore;
  [v4 setKeyFrame:self->_keyFrame];
  [v4 setPlaybackCrop:self->_playbackCrop];
  if (self->_colorNormalizationBlob) {
    objc_msgSend(v4, "setColorNormalizationBlob:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(float *)(v5 + 16) = self->_curationScore;
  id v8 = [(VCPProtoVideoKeyFrame *)self->_keyFrame copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(VCPProtoBounds *)self->_playbackCrop copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSData *)self->_colorNormalizationBlob copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[5]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_curationScore == *((float *)v4 + 4)
    && ((keyFrame = self->_keyFrame, !((unint64_t)keyFrame | v4[3]))
     || -[VCPProtoVideoKeyFrame isEqual:](keyFrame, "isEqual:"))
    && ((playbackCrop = self->_playbackCrop, !((unint64_t)playbackCrop | v4[4]))
     || -[VCPProtoBounds isEqual:](playbackCrop, "isEqual:")))
  {
    colorNormalizationBlob = self->_colorNormalizationBlob;
    if ((unint64_t)colorNormalizationBlob | v4[1]) {
      char v9 = -[NSData isEqual:](colorNormalizationBlob, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  float curationScore = self->_curationScore;
  float v5 = -curationScore;
  if (curationScore >= 0.0) {
    float v5 = self->_curationScore;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  float v8 = fmodf(v6, 1.8447e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  unint64_t v13 = v3 ^ [(VCPProtoVideoKeyFrame *)self->_keyFrame hash];
  unint64_t v14 = v13 ^ [(VCPProtoBounds *)self->_playbackCrop hash];
  return v12 ^ v14 ^ [(NSData *)self->_colorNormalizationBlob hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 5);
  id v11 = v4;
  if (timeRange)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoMovieHighlightResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v11;
LABEL_7:
  self->_float curationScore = *((float *)v4 + 4);
  keyFrame = self->_keyFrame;
  uint64_t v8 = *((void *)v4 + 3);
  if (keyFrame)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoVideoKeyFrame mergeFrom:](keyFrame, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoMovieHighlightResult setKeyFrame:](self, "setKeyFrame:");
  }
  id v4 = v11;
LABEL_13:
  playbackCrop = self->_playbackCrop;
  uint64_t v10 = *((void *)v4 + 4);
  if (playbackCrop)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[VCPProtoBounds mergeFrom:](playbackCrop, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[VCPProtoMovieHighlightResult setPlaybackCrop:](self, "setPlaybackCrop:");
  }
  id v4 = v11;
LABEL_19:
  if (*((void *)v4 + 1))
  {
    -[VCPProtoMovieHighlightResult setColorNormalizationBlob:](self, "setColorNormalizationBlob:");
    id v4 = v11;
  }
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (float)curationScore
{
  return self->_curationScore;
}

- (void)setCurationScore:(float)a3
{
  self->_float curationScore = a3;
}

- (VCPProtoVideoKeyFrame)keyFrame
{
  return self->_keyFrame;
}

- (void)setKeyFrame:(id)a3
{
}

- (VCPProtoBounds)playbackCrop
{
  return self->_playbackCrop;
}

- (void)setPlaybackCrop:(id)a3
{
}

- (NSData)colorNormalizationBlob
{
  return self->_colorNormalizationBlob;
}

- (void)setColorNormalizationBlob:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_playbackCrop, 0);
  objc_storeStrong((id *)&self->_keyFrame, 0);
  objc_storeStrong((id *)&self->_colorNormalizationBlob, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v23, 0, sizeof(v23));
  CMTimeRangeMakeFromDictionary(&v23, v3);
  uint64_t v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"quality"];
  float v5 = (void *)v4;
  if ((v23.start.flags & 1) == 0)
  {
    uint64_t v6 = 0;
    goto LABEL_3;
  }
  uint64_t v6 = 0;
  if ((v23.duration.flags & 1) != 0 && !v23.duration.epoch)
  {
    uint64_t v6 = 0;
    if ((v23.duration.value & 0x8000000000000000) == 0)
    {
      if (v4)
      {
        uint64_t v8 = objc_alloc_init(VCPProtoMovieHighlightResult);
        CMTimeRange v22 = v23;
        unint64_t v9 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v22];
        [(VCPProtoMovieHighlightResult *)v8 setTimeRange:v9];

        [v5 floatValue];
        -[VCPProtoMovieHighlightResult setCurationScore:](v8, "setCurationScore:");
        uint64_t v10 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
        id v11 = v10;
        if (v10)
        {
          unint64_t v12 = [v10 objectForKeyedSubscript:@"bestPlaybackCrop"];
          uint64_t v6 = (VCPProtoMovieHighlightResult *)v12;
          if (!v12)
          {
LABEL_19:

            goto LABEL_3;
          }
          NSRect v25 = NSRectFromString(v12);
          unint64_t v13 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
          [(VCPProtoMovieHighlightResult *)v8 setPlaybackCrop:v13];

          unint64_t v14 = [v11 objectForKeyedSubscript:@"colorNormalizationData"];
          if (v14) {
            [(VCPProtoMovieHighlightResult *)v8 setColorNormalizationBlob:v14];
          }
          v15 = objc_alloc_init(VCPProtoVideoKeyFrame);
          memset(&v21, 0, sizeof(v21));
          CFDictionaryRef v16 = [v11 objectForKeyedSubscript:@"keyFrameTime"];
          CMTimeMakeFromDictionary(&v21, v16);

          v17 = [v11 objectForKeyedSubscript:@"keyFrameScore"];
          v18 = v17;
          if ((v21.flags & 1) == 0 || !v17)
          {

            uint64_t v6 = 0;
            goto LABEL_19;
          }
          CMTime v20 = v21;
          v19 = +[VCPProtoTime timeWithCMTime:&v20];
          [(VCPProtoVideoKeyFrame *)v15 setTimestamp:v19];

          [v18 floatValue];
          -[VCPProtoVideoKeyFrame setCurationScore:](v15, "setCurationScore:");
          [(VCPProtoMovieHighlightResult *)v8 setKeyFrame:v15];
        }
        uint64_t v6 = v8;
        goto LABEL_19;
      }
    }
  }
LABEL_3:

  return v6;
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = [(VCPProtoMovieHighlightResult *)self timeRange];
  uint64_t v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }
  CMTimeRange range = v23;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  float v7 = NSNumber;
  [(VCPProtoMovieHighlightResult *)self curationScore];
  uint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
  [v6 setObject:v8 forKeyedSubscript:@"quality"];

  unint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [(VCPProtoMovieHighlightResult *)self playbackCrop];
  [v10 rectValue];
  id v11 = NSStringFromRect(v26);
  [v9 setObject:v11 forKeyedSubscript:@"bestPlaybackCrop"];

  if ([(VCPProtoMovieHighlightResult *)self hasColorNormalizationBlob])
  {
    unint64_t v12 = [(VCPProtoMovieHighlightResult *)self colorNormalizationBlob];
    [v9 setObject:v12 forKeyedSubscript:@"colorNormalizationData"];
  }
  unint64_t v13 = [(VCPProtoMovieHighlightResult *)self keyFrame];
  unint64_t v14 = v13;
  if (v13)
  {
    v15 = [v13 timestamp];
    CFDictionaryRef v16 = v15;
    if (v15)
    {
      [v15 timeValue];
    }
    else
    {
      long long v21 = 0uLL;
      CMTimeEpoch v22 = 0;
    }
    *(_OWORD *)&range.start.value = v21;
    range.start.epoch = v22;
    CFDictionaryRef v17 = CMTimeCopyAsDictionary(&range.start, 0);
    [v9 setObject:v17 forKeyedSubscript:@"keyFrameTime"];

    v18 = NSNumber;
    [v14 curationScore];
    v19 = objc_msgSend(v18, "numberWithFloat:");
    [v9 setObject:v19 forKeyedSubscript:@"keyFrameScore"];
  }
  [v6 setObject:v9 forKeyedSubscript:@"attributes"];

  return v6;
}

@end