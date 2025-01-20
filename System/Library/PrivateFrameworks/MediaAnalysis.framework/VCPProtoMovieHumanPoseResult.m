@interface VCPProtoMovieHumanPoseResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoBounds)bounds;
- (VCPProtoTimeRange)timeRange;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)flags;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setFlags:(int)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieHumanPoseResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v15, 0, sizeof(v15));
  CMTimeRangeMakeFromDictionary(&v15, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  v5 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"flags"];
  v6 = [v4 objectForKeyedSubscript:@"humanConfidence"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"humanBounds"];
  v8 = (NSString *)v7;
  if (v15.start.flags)
  {
    v9 = 0;
    if ((v15.duration.flags & 1) != 0 && !v15.duration.epoch)
    {
      v9 = 0;
      if ((v15.duration.value & 0x8000000000000000) == 0 && v6 && v7 && v5)
      {
        uint64_t v10 = [v5 unsignedIntegerValue];
        v9 = objc_alloc_init(VCPProtoMovieHumanPoseResult);
        CMTimeRange v14 = v15;
        v11 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v14];
        [(VCPProtoMovieHumanPoseResult *)v9 setTimeRange:v11];

        [v6 floatValue];
        -[VCPProtoMovieHumanPoseResult setConfidence:](v9, "setConfidence:");
        NSRect v17 = NSRectFromString(v8);
        v12 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
        [(VCPProtoMovieHumanPoseResult *)v9 setBounds:v12];

        [(VCPProtoMovieHumanPoseResult *)v9 setFlags:v10];
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)exportToLegacyDictionary
{
  v17[2] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = [(VCPProtoMovieHumanPoseResult *)self timeRange];
  v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  CMTimeRange range = v14;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoMovieHumanPoseResult flags](self, "flags"));
  [v6 setObject:v7 forKeyedSubscript:@"flags"];

  v16[0] = @"humanConfidence";
  v8 = NSNumber;
  [(VCPProtoMovieHumanPoseResult *)self confidence];
  v9 = objc_msgSend(v8, "numberWithFloat:");
  v17[0] = v9;
  v16[1] = @"humanBounds";
  uint64_t v10 = [(VCPProtoMovieHumanPoseResult *)self bounds];
  [v10 rectValue];
  v11 = NSStringFromRect(v19);
  v17[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v6 setObject:v12 forKeyedSubscript:@"attributes"];

  return v6;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieHumanPoseResult;
  v4 = [(VCPProtoMovieHumanPoseResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoMovieHumanPoseResult *)self dictionaryRepresentation];
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
  *(float *)&double v4 = self->_confidence;
  uint64_t v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"confidence"];

  bounds = self->_bounds;
  if (bounds)
  {
    v9 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"bounds"];
  }
  uint64_t v10 = [NSNumber numberWithInt:self->_flags];
  [v3 setObject:v10 forKey:@"flags"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieHumanPoseResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  id v5 = a3;
  [v5 setTimeRange:timeRange];
  *((_DWORD *)v5 + 4) = LODWORD(self->_confidence);
  [v5 setBounds:self->_bounds];
  *((_DWORD *)v5 + 5) = self->_flags;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(float *)(v5 + 16) = self->_confidence;
  id v8 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  *(_DWORD *)(v5 + 20) = self->_flags;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 3)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_confidence == *((float *)v4 + 4)
    && ((bounds = self->_bounds, !((unint64_t)bounds | *((void *)v4 + 1)))
     || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && self->_flags == *((_DWORD *)v4 + 5);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  float confidence = self->_confidence;
  float v5 = -confidence;
  if (confidence >= 0.0) {
    float v5 = self->_confidence;
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
  return v12 ^ v3 ^ [(VCPProtoBounds *)self->_bounds hash] ^ (2654435761 * self->_flags);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
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
    -[VCPProtoMovieHumanPoseResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v9;
LABEL_7:
  self->_float confidence = *((float *)v4 + 4);
  bounds = self->_bounds;
  uint64_t v8 = *((void *)v4 + 1);
  if (bounds)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoMovieHumanPoseResult setBounds:](self, "setBounds:");
  }
  id v4 = v9;
LABEL_13:
  self->_flags = *((_DWORD *)v4 + 5);
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end