@interface VCPProtoMovieSummaryResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)autoPlayable;
- (BOOL)hasKeyFrame;
- (BOOL)hasPlaybackCrop;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)setAutoPlayable:(BOOL)a3;
- (void)setCurationScore:(float)a3;
- (void)setKeyFrame:(id)a3;
- (void)setPlaybackCrop:(id)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieSummaryResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v23, 0, sizeof(v23));
  CMTimeRangeMakeFromDictionary(&v23, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"quality"];
  uint64_t v5 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"flags"];
  v6 = (void *)v5;
  if (v23.start.flags)
  {
    v7 = 0;
    if ((v23.duration.flags & 1) != 0 && !v23.duration.epoch)
    {
      v7 = 0;
      if ((v23.duration.value & 0x8000000000000000) == 0 && v5 && v4 != 0)
      {
        v7 = objc_alloc_init(VCPProtoMovieSummaryResult);
        CMTimeRange v22 = v23;
        v9 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v22];
        [(VCPProtoMovieSummaryResult *)v7 setTimeRange:v9];

        [v4 floatValue];
        -[VCPProtoMovieSummaryResult setCurationScore:](v7, "setCurationScore:");
        -[VCPProtoMovieSummaryResult setAutoPlayable:](v7, "setAutoPlayable:", ((unint64_t)[v6 unsignedIntegerValue] >> 19) & 1);
        v10 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
        if (v10)
        {
          v11 = objc_alloc_init(VCPProtoVideoKeyFrame);
          memset(&v21, 0, sizeof(v21));
          CFDictionaryRef v12 = [v10 objectForKeyedSubscript:@"keyFrameTime"];
          CMTimeMakeFromDictionary(&v21, v12);

          uint64_t v13 = [v10 objectForKeyedSubscript:@"keyFrameScore"];
          v14 = (void *)v13;
          if ((v21.flags & 1) != 0 && v13)
          {
            CMTime v20 = v21;
            v15 = +[VCPProtoTime timeWithCMTime:&v20];
            [(VCPProtoVideoKeyFrame *)v11 setTimestamp:v15];

            [v14 floatValue];
            -[VCPProtoVideoKeyFrame setCurationScore:](v11, "setCurationScore:");
            [(VCPProtoMovieSummaryResult *)v7 setKeyFrame:v11];
          }
          v16 = [v10 objectForKeyedSubscript:@"bestPlaybackCrop"];
          v17 = v16;
          if (v16)
          {
            NSRect v25 = NSRectFromString(v16);
            v18 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
            [(VCPProtoMovieSummaryResult *)v7 setPlaybackCrop:v18];
          }
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = [(VCPProtoMovieSummaryResult *)self timeRange];
  v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v24, 0, sizeof(v24));
  }
  CMTimeRange range = v24;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  if ([(VCPProtoMovieSummaryResult *)self autoPlayable]) {
    uint64_t v7 = 0x80000;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [NSNumber numberWithUnsignedLongLong:v7];
  [v6 setObject:v8 forKeyedSubscript:@"flags"];

  v9 = NSNumber;
  [(VCPProtoMovieSummaryResult *)self curationScore];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v6 setObject:v10 forKeyedSubscript:@"quality"];

  uint64_t v11 = [(VCPProtoMovieSummaryResult *)self keyFrame];
  uint64_t v12 = [(VCPProtoMovieSummaryResult *)self playbackCrop];
  if (v11 | v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v11)
    {
      v14 = [(id)v11 timestamp];
      v15 = v14;
      if (v14)
      {
        [v14 timeValue];
      }
      else
      {
        long long v22 = 0uLL;
        CMTimeEpoch v23 = 0;
      }
      *(_OWORD *)&range.start.value = v22;
      range.start.epoch = v23;
      CFDictionaryRef v16 = CMTimeCopyAsDictionary(&range.start, 0);
      [v13 setObject:v16 forKeyedSubscript:@"keyFrameTime"];

      v17 = NSNumber;
      [(id)v11 curationScore];
      v18 = objc_msgSend(v17, "numberWithFloat:");
      [v13 setObject:v18 forKeyedSubscript:@"keyFrameScore"];
    }
    if (v12)
    {
      v19 = [(VCPProtoMovieSummaryResult *)self playbackCrop];
      [v19 rectValue];
      CMTime v20 = NSStringFromRect(v27);
      [v13 setObject:v20 forKeyedSubscript:@"bestPlaybackCrop"];
    }
    [v6 setObject:v13 forKeyedSubscript:@"attributes"];
  }
  return v6;
}

- (BOOL)hasKeyFrame
{
  return self->_keyFrame != 0;
}

- (BOOL)hasPlaybackCrop
{
  return self->_playbackCrop != 0;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieSummaryResult;
  v4 = [(VCPProtoMovieSummaryResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoMovieSummaryResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v6 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"timeRange"];
  }
  *(float *)&double v4 = self->_curationScore;
  uint64_t v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"curationScore"];

  keyFrame = self->_keyFrame;
  if (keyFrame)
  {
    v9 = [(VCPProtoVideoKeyFrame *)keyFrame dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"keyFrame"];
  }
  v10 = [NSNumber numberWithBool:self->_autoPlayable];
  [v3 setObject:v10 forKey:@"autoPlayable"];

  playbackCrop = self->_playbackCrop;
  if (playbackCrop)
  {
    uint64_t v12 = [(VCPProtoBounds *)playbackCrop dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"playbackCrop"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSummaryResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  if (self->_keyFrame) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteBOOLField();
  if (self->_playbackCrop) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  CFDictionaryRef v5 = (float *)a3;
  [v5 setTimeRange:self->_timeRange];
  id v4 = v5;
  v5[2] = self->_curationScore;
  if (self->_keyFrame)
  {
    objc_msgSend(v5, "setKeyFrame:");
    id v4 = v5;
  }
  *((unsigned char *)v4 + 40) = self->_autoPlayable;
  if (self->_playbackCrop)
  {
    objc_msgSend(v5, "setPlaybackCrop:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  *(float *)(v5 + 8) = self->_curationScore;
  id v8 = [(VCPProtoVideoKeyFrame *)self->_keyFrame copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  *(unsigned char *)(v5 + 40) = self->_autoPlayable;
  id v10 = [(VCPProtoBounds *)self->_playbackCrop copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((void *)v4 + 4))
  {
    if (!-[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (self->_curationScore != *((float *)v4 + 2)) {
    goto LABEL_12;
  }
  keyFrame = self->_keyFrame;
  if ((unint64_t)keyFrame | *((void *)v4 + 2))
  {
    if (!-[VCPProtoVideoKeyFrame isEqual:](keyFrame, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (self->_autoPlayable)
  {
    if (*((unsigned char *)v4 + 40)) {
      goto LABEL_9;
    }
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  if (*((unsigned char *)v4 + 40)) {
    goto LABEL_12;
  }
LABEL_9:
  playbackCrop = self->_playbackCrop;
  if ((unint64_t)playbackCrop | *((void *)v4 + 3)) {
    char v8 = -[VCPProtoBounds isEqual:](playbackCrop, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_13:

  return v8;
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
  unint64_t v13 = v3 ^ [(VCPProtoVideoKeyFrame *)self->_keyFrame hash] ^ (2654435761 * self->_autoPlayable);
  return v12 ^ v13 ^ [(VCPProtoBounds *)self->_playbackCrop hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 4);
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
    -[VCPProtoMovieSummaryResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v11;
LABEL_7:
  self->_float curationScore = *((float *)v4 + 2);
  keyFrame = self->_keyFrame;
  uint64_t v8 = *((void *)v4 + 2);
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
    -[VCPProtoMovieSummaryResult setKeyFrame:](self, "setKeyFrame:");
  }
  id v4 = v11;
LABEL_13:
  self->_autoPlayable = *((unsigned char *)v4 + 40);
  playbackCrop = self->_playbackCrop;
  uint64_t v10 = *((void *)v4 + 3);
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
    -[VCPProtoMovieSummaryResult setPlaybackCrop:](self, "setPlaybackCrop:");
  }
  id v4 = v11;
LABEL_19:
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

- (BOOL)autoPlayable
{
  return self->_autoPlayable;
}

- (void)setAutoPlayable:(BOOL)a3
{
  self->_autoPlayable = a3;
}

- (VCPProtoBounds)playbackCrop
{
  return self->_playbackCrop;
}

- (void)setPlaybackCrop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_playbackCrop, 0);
  objc_storeStrong((id *)&self->_keyFrame, 0);
}

@end