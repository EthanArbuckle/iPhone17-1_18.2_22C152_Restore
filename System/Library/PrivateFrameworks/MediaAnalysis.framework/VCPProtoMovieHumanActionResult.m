@interface VCPProtoMovieHumanActionResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasBounds;
- (BOOL)hasFaceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)faceId;
- (VCPProtoBounds)bounds;
- (VCPProtoTimeRange)timeRange;
- (float)absoluteScore;
- (float)humanScore;
- (float)relativeScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteScore:(float)a3;
- (void)setBounds:(id)a3;
- (void)setFaceId:(id)a3;
- (void)setHumanScore:(float)a3;
- (void)setRelativeScore:(float)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieHumanActionResult

- (BOOL)hasFaceId
{
  return self->_faceId != 0;
}

- (BOOL)hasBounds
{
  return self->_bounds != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieHumanActionResult;
  v4 = [(VCPProtoMovieHumanActionResult *)&v8 description];
  v5 = [(VCPProtoMovieHumanActionResult *)self dictionaryRepresentation];
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
  *(float *)&double v4 = self->_absoluteScore;
  v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"absoluteScore"];

  *(float *)&double v8 = self->_relativeScore;
  v9 = [NSNumber numberWithFloat:v8];
  [v3 setObject:v9 forKey:@"relativeScore"];

  *(float *)&double v10 = self->_humanScore;
  v11 = [NSNumber numberWithFloat:v10];
  [v3 setObject:v11 forKey:@"humanScore"];

  faceId = self->_faceId;
  if (faceId) {
    [v3 setObject:faceId forKey:@"faceId"];
  }
  bounds = self->_bounds;
  if (bounds)
  {
    v14 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"bounds"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieHumanActionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  if (self->_faceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_bounds) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  v5 = (float *)a3;
  [v5 setTimeRange:self->_timeRange];
  id v4 = v5;
  v5[2] = self->_absoluteScore;
  v5[9] = self->_relativeScore;
  v5[8] = self->_humanScore;
  if (self->_faceId)
  {
    objc_msgSend(v5, "setFaceId:");
    id v4 = v5;
  }
  if (self->_bounds)
  {
    objc_msgSend(v5, "setBounds:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(float *)(v5 + 8) = self->_absoluteScore;
  *(float *)(v5 + 36) = self->_relativeScore;
  *(float *)(v5 + 32) = self->_humanScore;
  uint64_t v8 = [(NSString *)self->_faceId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[5]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_absoluteScore == *((float *)v4 + 2)
    && self->_relativeScore == *((float *)v4 + 9)
    && self->_humanScore == *((float *)v4 + 8)
    && ((faceId = self->_faceId, !((unint64_t)faceId | v4[3]))
     || -[NSString isEqual:](faceId, "isEqual:")))
  {
    bounds = self->_bounds;
    if ((unint64_t)bounds | v4[2]) {
      char v8 = -[VCPProtoBounds isEqual:](bounds, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  float absoluteScore = self->_absoluteScore;
  float v5 = -absoluteScore;
  if (absoluteScore >= 0.0) {
    float v5 = self->_absoluteScore;
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
  float relativeScore = self->_relativeScore;
  float v14 = -relativeScore;
  if (relativeScore >= 0.0) {
    float v14 = self->_relativeScore;
  }
  float v15 = floorf(v14 + 0.5);
  float v16 = (float)(v14 - v15) * 1.8447e19;
  float v17 = fmodf(v15, 1.8447e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabsf(v16);
  if (v16 < 0.0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v19;
  }
  float humanScore = self->_humanScore;
  float v23 = -humanScore;
  if (humanScore >= 0.0) {
    float v23 = self->_humanScore;
  }
  float v24 = floorf(v23 + 0.5);
  float v25 = (float)(v23 - v24) * 1.8447e19;
  float v26 = fmodf(v24, 1.8447e19);
  unint64_t v27 = 2654435761u * (unint64_t)v26;
  unint64_t v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0) {
    unint64_t v28 = 2654435761u * (unint64_t)v26;
  }
  unint64_t v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 >= 0.0) {
    unint64_t v29 = v28;
  }
  unint64_t v30 = v12 ^ v3 ^ v21 ^ v29;
  NSUInteger v31 = [(NSString *)self->_faceId hash];
  return v30 ^ v31 ^ [(VCPProtoBounds *)self->_bounds hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 5);
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
    -[VCPProtoMovieHumanActionResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v9;
LABEL_7:
  self->_float absoluteScore = *((float *)v4 + 2);
  self->_float relativeScore = *((float *)v4 + 9);
  self->_float humanScore = *((float *)v4 + 8);
  if (*((void *)v4 + 3))
  {
    -[VCPProtoMovieHumanActionResult setFaceId:](self, "setFaceId:");
    id v4 = v9;
  }
  bounds = self->_bounds;
  uint64_t v8 = *((void *)v4 + 2);
  if (bounds)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[VCPProtoMovieHumanActionResult setBounds:](self, "setBounds:");
  }
  id v4 = v9;
LABEL_15:
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (float)absoluteScore
{
  return self->_absoluteScore;
}

- (void)setAbsoluteScore:(float)a3
{
  self->_float absoluteScore = a3;
}

- (float)relativeScore
{
  return self->_relativeScore;
}

- (void)setRelativeScore:(float)a3
{
  self->_float relativeScore = a3;
}

- (float)humanScore
{
  return self->_humanScore;
}

- (void)setHumanScore:(float)a3
{
  self->_float humanScore = a3;
}

- (NSString)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(id)a3
{
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_faceId, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v16, 0, sizeof(v16));
  CMTimeRangeMakeFromDictionary(&v16, v3);
  id v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  float v5 = [v4 objectForKeyedSubscript:@"absoluteScore"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"relativeScore"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"humanScore"];
  uint64_t v8 = (void *)v7;
  if (v16.start.flags)
  {
    id v9 = 0;
    if ((v16.duration.flags & 1) != 0 && !v16.duration.epoch)
    {
      id v9 = 0;
      if ((v16.duration.value & 0x8000000000000000) == 0 && v5 && v6 && v7)
      {
        unint64_t v10 = [v4 objectForKeyedSubscript:@"humanBounds"];
        unint64_t v11 = [v4 objectForKeyedSubscript:@"faceIdentifier"];
        id v9 = objc_alloc_init(VCPProtoMovieHumanActionResult);
        CMTimeRange v15 = v16;
        unint64_t v12 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v15];
        [(VCPProtoMovieHumanActionResult *)v9 setTimeRange:v12];

        [v5 floatValue];
        -[VCPProtoMovieHumanActionResult setAbsoluteScore:](v9, "setAbsoluteScore:");
        [v6 floatValue];
        -[VCPProtoMovieHumanActionResult setRelativeScore:](v9, "setRelativeScore:");
        [v8 floatValue];
        -[VCPProtoMovieHumanActionResult setHumanScore:](v9, "setHumanScore:");
        if (v10)
        {
          NSRect v18 = NSRectFromString(v10);
          v13 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
          [(VCPProtoMovieHumanActionResult *)v9 setBounds:v13];
        }
        if (v11) {
          [(VCPProtoMovieHumanActionResult *)v9 setFaceId:v11];
        }
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = [(VCPProtoMovieHumanActionResult *)self timeRange];
  id v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  CMTimeRange range = v18;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = NSNumber;
  [(VCPProtoMovieHumanActionResult *)self absoluteScore];
  id v9 = objc_msgSend(v8, "numberWithFloat:");
  [v7 setObject:v9 forKeyedSubscript:@"absoluteScore"];

  unint64_t v10 = NSNumber;
  [(VCPProtoMovieHumanActionResult *)self relativeScore];
  unint64_t v11 = objc_msgSend(v10, "numberWithFloat:");
  [v7 setObject:v11 forKeyedSubscript:@"relativeScore"];

  unint64_t v12 = NSNumber;
  [(VCPProtoMovieHumanActionResult *)self humanScore];
  v13 = objc_msgSend(v12, "numberWithFloat:");
  [v7 setObject:v13 forKeyedSubscript:@"humanScore"];

  if ([(VCPProtoMovieHumanActionResult *)self hasFaceId])
  {
    float v14 = [(VCPProtoMovieHumanActionResult *)self faceId];
    [v7 setObject:v14 forKeyedSubscript:@"faceIdentifier"];
  }
  if ([(VCPProtoMovieHumanActionResult *)self hasBounds])
  {
    CMTimeRange v15 = [(VCPProtoMovieHumanActionResult *)self bounds];
    [v15 rectValue];
    CMTimeRange v16 = NSStringFromRect(v21);
    [v7 setObject:v16 forKeyedSubscript:@"humanBounds"];
  }
  [v6 setObject:v7 forKeyedSubscript:@"attributes"];

  return v6;
}

@end