@interface VCPProtoMoviePetsResult
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
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMoviePetsResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"attributes"];
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, (CFDictionaryRef)v3);
  v5 = [v4 objectForKeyedSubscript:@"petsBounds"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"petsConfidence"];
  v7 = (void *)v6;
  if (v14.start.flags)
  {
    v8 = 0;
    if ((v14.duration.flags & 1) != 0 && !v14.duration.epoch)
    {
      v8 = 0;
      if ((v14.duration.value & 0x8000000000000000) == 0 && v5 && v6 != 0)
      {
        v8 = objc_alloc_init(VCPProtoMoviePetsResult);
        CMTimeRange v13 = v14;
        v10 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v13];
        [(VCPProtoMoviePetsResult *)v8 setTimeRange:v10];

        NSRect v16 = NSRectFromString(v5);
        v11 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
        [(VCPProtoMoviePetsResult *)v8 setBounds:v11];

        [v7 floatValue];
        -[VCPProtoMoviePetsResult setConfidence:](v8, "setConfidence:");
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(VCPProtoMoviePetsResult *)self timeRange];
  v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CMTimeRange range = v13;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  v15[0] = @"petsBounds";
  v7 = [(VCPProtoMoviePetsResult *)self bounds];
  [v7 rectValue];
  v8 = NSStringFromRect(v18);
  v16[0] = v8;
  v15[1] = @"petsConfidence";
  v9 = NSNumber;
  [(VCPProtoMoviePetsResult *)self confidence];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v6 setObject:v11 forKeyedSubscript:@"attributes"];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMoviePetsResult;
  v4 = [(VCPProtoMoviePetsResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoMoviePetsResult *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    uint64_t v6 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"timeRange"];
  }
  bounds = self->_bounds;
  if (bounds)
  {
    objc_super v8 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"bounds"];
  }
  *(float *)&double v4 = self->_confidence;
  v9 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"confidence"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMoviePetsResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  CFDictionaryRef v5 = (float *)a3;
  [v5 setTimeRange:timeRange];
  [v5 setBounds:self->_bounds];
  v5[4] = self->_confidence;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  *(float *)(v5 + 16) = self->_confidence;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 3)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && ((bounds = self->_bounds, !((unint64_t)bounds | *((void *)v4 + 1)))
     || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && self->_confidence == *((float *)v4 + 4);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  unint64_t v4 = [(VCPProtoBounds *)self->_bounds hash];
  float confidence = self->_confidence;
  float v6 = -confidence;
  if (confidence >= 0.0) {
    float v6 = self->_confidence;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  float v9 = fmodf(v7, 1.8447e19);
  unint64_t v10 = 2654435761u * (unint64_t)v9;
  unint64_t v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0) {
    unint64_t v11 = 2654435761u * (unint64_t)v9;
  }
  unint64_t v12 = v10 - (unint64_t)fabsf(v8);
  if (v8 >= 0.0) {
    unint64_t v12 = v11;
  }
  return v4 ^ v3 ^ v12;
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
    -[VCPProtoMoviePetsResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v9;
LABEL_7:
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
    -[VCPProtoMoviePetsResult setBounds:](self, "setBounds:");
  }
  id v4 = v9;
LABEL_13:
  self->_float confidence = *((float *)v4 + 4);
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end