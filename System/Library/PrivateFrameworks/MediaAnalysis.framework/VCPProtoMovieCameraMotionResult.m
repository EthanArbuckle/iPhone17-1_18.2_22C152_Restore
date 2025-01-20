@interface VCPProtoMovieCameraMotionResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFast;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTimeRange)timeRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)motionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIsFast:(BOOL)a3;
- (void)setMotionType:(int)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieCameraMotionResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, v3);
  uint64_t v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"flags"];
  v5 = (void *)v4;
  if ((v14.start.flags & 1) == 0)
  {
    v6 = 0;
    goto LABEL_30;
  }
  v6 = 0;
  if ((v14.duration.flags & 1) != 0 && !v14.duration.epoch)
  {
    v6 = 0;
    if ((v14.duration.value & 0x8000000000000000) == 0)
    {
      if (v4)
      {
        v6 = objc_alloc_init(VCPProtoMovieCameraMotionResult);
        CMTimeRange v13 = v14;
        v7 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v13];
        [(VCPProtoMovieCameraMotionResult *)v6 setTimeRange:v7];

        unint64_t v8 = [v5 unsignedIntegerValue];
        __int16 v9 = v8;
        [(VCPProtoMovieCameraMotionResult *)v6 setIsFast:(v8 >> 16) & 1];
        unsigned int v10 = v9 & 0xFFC0;
        if (v10 <= 0x3FF)
        {
          if ((v9 & 0xFFC0u) > 0xFF)
          {
            if (v10 == 256)
            {
              uint64_t v11 = 3;
              goto LABEL_29;
            }
            if (v10 == 512)
            {
              uint64_t v11 = 4;
              goto LABEL_29;
            }
          }
          else
          {
            if (v10 == 64)
            {
              uint64_t v11 = 1;
              goto LABEL_29;
            }
            if (v10 == 128)
            {
              uint64_t v11 = 2;
              goto LABEL_29;
            }
          }
        }
        else if ((v9 & 0xFFC0u) <= 0xFFF)
        {
          if (v10 == 1024)
          {
            uint64_t v11 = 5;
            goto LABEL_29;
          }
          if (v10 == 2048)
          {
            uint64_t v11 = 6;
            goto LABEL_29;
          }
        }
        else
        {
          switch(v10)
          {
            case 0x1000u:
              uint64_t v11 = 7;
              goto LABEL_29;
            case 0x2000u:
              uint64_t v11 = 8;
              goto LABEL_29;
            case 0x4000u:
              uint64_t v11 = 9;
LABEL_29:
              [(VCPProtoMovieCameraMotionResult *)v6 setMotionType:v11];
              goto LABEL_30;
          }
        }
        uint64_t v11 = 0;
        goto LABEL_29;
      }
    }
  }
LABEL_30:

  return v6;
}

- (id)exportToLegacyDictionary
{
  if ([(VCPProtoMovieCameraMotionResult *)self isFast]) {
    uint64_t v3 = 0x10000;
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = [(VCPProtoMovieCameraMotionResult *)self motionType] - 1;
  if (v4 > 8) {
    uint64_t v5 = 0x8000;
  }
  else {
    uint64_t v5 = qword_1BC283638[v4];
  }
  v6 = [(VCPProtoMovieCameraMotionResult *)self timeRange];
  v7 = v6;
  if (v6) {
    [v6 timeRangeValue];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  CMTimeRange range = v12;
  CFDictionaryRef v8 = CMTimeRangeCopyAsDictionary(&range, 0);
  __int16 v9 = (void *)[(__CFDictionary *)v8 mutableCopy];

  unsigned int v10 = [NSNumber numberWithUnsignedLongLong:v3 | v5];
  [v9 setObject:v10 forKeyedSubscript:@"flags"];

  return v9;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieCameraMotionResult;
  int v4 = [(VCPProtoMovieCameraMotionResult *)&v8 description];
  uint64_t v5 = [(VCPProtoMovieCameraMotionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    uint64_t v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  v6 = [NSNumber numberWithInt:self->_motionType];
  [v3 setObject:v6 forKey:@"motionType"];

  v7 = [NSNumber numberWithBool:self->_isFast];
  [v3 setObject:v7 forKey:@"isFast"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieCameraMotionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  id v5 = a3;
  [v5 setTimeRange:timeRange];
  *((_DWORD *)v5 + 2) = self->_motionType;
  *((unsigned char *)v5 + 24) = self->_isFast;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_motionType;
  *(unsigned char *)(v5 + 24) = self->_isFast;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 2)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_motionType == *((_DWORD *)v4 + 2))
  {
    if (self->_isFast) {
      BOOL v6 = v4[24] != 0;
    }
    else {
      BOOL v6 = v4[24] == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_motionType) ^ [(VCPProtoTimeRange *)self->_timeRange hash] ^ (2654435761 * self->_isFast);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 2);
  if (timeRange)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoMovieCameraMotionResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v7;
LABEL_7:
  self->_motionType = *((_DWORD *)v4 + 2);
  self->_isFast = *((unsigned char *)v4 + 24);
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (int)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(int)a3
{
  self->_motionType = a3;
}

- (BOOL)isFast
{
  return self->_isFast;
}

- (void)setIsFast:(BOOL)a3
{
  self->_isFast = a3;
}

- (void).cxx_destruct
{
}

@end