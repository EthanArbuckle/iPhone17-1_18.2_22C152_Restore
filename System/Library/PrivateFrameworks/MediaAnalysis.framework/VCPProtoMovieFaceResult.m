@interface VCPProtoMovieFaceResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasHumanBounds;
- (BOOL)isCloseup;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoBounds)bounds;
- (VCPProtoBounds)humanBounds;
- (VCPProtoTimeRange)timeRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)faceID;
- (int)mouthExpression;
- (int)position;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setFaceID:(int)a3;
- (void)setHumanBounds:(id)a3;
- (void)setIsCloseup:(BOOL)a3;
- (void)setMouthExpression:(int)a3;
- (void)setPosition:(int)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieFaceResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v19, 0, sizeof(v19));
  CMTimeRangeMakeFromDictionary(&v19, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  v5 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"flags"];
  v6 = [v4 objectForKeyedSubscript:@"facePosition"];
  v7 = [v4 objectForKeyedSubscript:@"faceBounds"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"faceId"];
  v9 = (void *)v8;
  if (v19.start.flags)
  {
    v10 = 0;
    if ((v19.duration.flags & 1) != 0 && !v19.duration.epoch)
    {
      v10 = 0;
      if ((v19.duration.value & 0x8000000000000000) == 0 && v5 && v6 && v7 && v8)
      {
        v10 = objc_alloc_init(VCPProtoMovieFaceResult);
        CMTimeRange v18 = v19;
        v12 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v18];
        [(VCPProtoMovieFaceResult *)v10 setTimeRange:v12];

        unint64_t v13 = [v5 unsignedIntegerValue];
        [(VCPProtoMovieFaceResult *)v10 setMouthExpression:(v13 >> 1) & 1];
        -[VCPProtoMovieFaceResult setPosition:](v10, "setPosition:", [v6 intValue]);
        NSRect v21 = NSRectFromString(v7);
        v14 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
        [(VCPProtoMovieFaceResult *)v10 setBounds:v14];

        [(VCPProtoMovieFaceResult *)v10 setIsCloseup:(v13 >> 4) & 1];
        -[VCPProtoMovieFaceResult setFaceID:](v10, "setFaceID:", [v9 unsignedIntValue]);
        v15 = [v4 objectForKeyedSubscript:@"humanBounds"];
        v16 = v15;
        if (v15)
        {
          NSRect v22 = NSRectFromString(v15);
          v17 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
          [(VCPProtoMovieFaceResult *)v10 setHumanBounds:v17];
        }
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)exportToLegacyDictionary
{
  BOOL v3 = [(VCPProtoMovieFaceResult *)self mouthExpression] == 1;
  if ([(VCPProtoMovieFaceResult *)self isCloseup]) {
    uint64_t v4 = (2 * v3) | 0x10;
  }
  else {
    uint64_t v4 = 2 * v3;
  }
  v5 = [(VCPProtoMovieFaceResult *)self timeRange];
  v6 = v5;
  if (v5) {
    [v5 timeRangeValue];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  CMTimeRange range = v18;
  CFDictionaryRef v7 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v8 = (void *)[(__CFDictionary *)v7 mutableCopy];

  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoMovieFaceResult position](self, "position"));
  [v9 setObject:v10 forKeyedSubscript:@"facePosition"];

  v11 = [(VCPProtoMovieFaceResult *)self bounds];
  [v11 rectValue];
  v12 = NSStringFromRect(v21);
  [v9 setObject:v12 forKeyedSubscript:@"faceBounds"];

  unint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoMovieFaceResult faceID](self, "faceID"));
  [v9 setObject:v13 forKeyedSubscript:@"faceId"];

  if ([(VCPProtoMovieFaceResult *)self hasHumanBounds])
  {
    v14 = [(VCPProtoMovieFaceResult *)self humanBounds];
    [v14 rectValue];
    v15 = NSStringFromRect(v22);
    [v9 setObject:v15 forKeyedSubscript:@"humanBounds"];
  }
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v4, *(_OWORD *)&v18.start.value, *(_OWORD *)&v18.start.epoch, *(_OWORD *)&v18.duration.timescale);
  [v8 setObject:v16 forKeyedSubscript:@"flags"];

  [v8 setObject:v9 forKeyedSubscript:@"attributes"];
  return v8;
}

- (BOOL)hasHumanBounds
{
  return self->_humanBounds != 0;
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieFaceResult;
  uint64_t v4 = [(VCPProtoMovieFaceResult *)&v8 description];
  v5 = [(VCPProtoMovieFaceResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  v6 = [NSNumber numberWithInt:self->_mouthExpression];
  [v3 setObject:v6 forKey:@"mouthExpression"];

  CFDictionaryRef v7 = [NSNumber numberWithInt:self->_position];
  [v3 setObject:v7 forKey:@"position"];

  bounds = self->_bounds;
  if (bounds)
  {
    v9 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"bounds"];
  }
  v10 = [NSNumber numberWithBool:self->_isCloseup];
  [v3 setObject:v10 forKey:@"isCloseup"];

  v11 = [NSNumber numberWithInt:self->_faceID];
  [v3 setObject:v11 forKey:@"faceID"];

  humanBounds = self->_humanBounds;
  if (humanBounds)
  {
    unint64_t v13 = [(VCPProtoBounds *)humanBounds dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"humanBounds"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieFaceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteInt32Field();
  if (self->_humanBounds) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setTimeRange:self->_timeRange];
  *((_DWORD *)v5 + 8) = self->_mouthExpression;
  *((_DWORD *)v5 + 9) = self->_position;
  [v5 setBounds:self->_bounds];
  id v4 = v5;
  *((unsigned char *)v5 + 48) = self->_isCloseup;
  *((_DWORD *)v5 + 4) = self->_faceID;
  if (self->_humanBounds)
  {
    objc_msgSend(v5, "setHumanBounds:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  CFDictionaryRef v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 32) = self->_mouthExpression;
  *(_DWORD *)(v5 + 36) = self->_position;
  id v8 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  *(unsigned char *)(v5 + 48) = self->_isCloseup;
  *(_DWORD *)(v5 + 16) = self->_faceID;
  id v10 = [(VCPProtoBounds *)self->_humanBounds copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((void *)v4 + 5))
  {
    if (!-[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (self->_mouthExpression != *((_DWORD *)v4 + 8)) {
    goto LABEL_15;
  }
  if (self->_position != *((_DWORD *)v4 + 9)) {
    goto LABEL_15;
  }
  bounds = self->_bounds;
  if ((unint64_t)bounds | *((void *)v4 + 1))
  {
    if (!-[VCPProtoBounds isEqual:](bounds, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (self->_isCloseup)
  {
    if (!*((unsigned char *)v4 + 48)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v8 = 0;
    goto LABEL_16;
  }
  if (self->_faceID != *((_DWORD *)v4 + 4)) {
    goto LABEL_15;
  }
  humanBounds = self->_humanBounds;
  if ((unint64_t)humanBounds | *((void *)v4 + 3)) {
    char v8 = -[VCPProtoBounds isEqual:](humanBounds, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (2654435761 * self->_mouthExpression) ^ [(VCPProtoTimeRange *)self->_timeRange hash];
  uint64_t v4 = 2654435761 * self->_position;
  unint64_t v5 = v3 ^ v4 ^ [(VCPProtoBounds *)self->_bounds hash];
  uint64_t v6 = (2654435761 * self->_isCloseup) ^ (2654435761 * self->_faceID);
  return v5 ^ v6 ^ [(VCPProtoBounds *)self->_humanBounds hash];
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
    -[VCPProtoMovieFaceResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v11;
LABEL_7:
  self->_mouthExpression = *((_DWORD *)v4 + 8);
  self->_position = *((_DWORD *)v4 + 9);
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
    -[VCPProtoMovieFaceResult setBounds:](self, "setBounds:");
  }
  id v4 = v11;
LABEL_13:
  self->_isCloseup = *((unsigned char *)v4 + 48);
  self->_faceID = *((_DWORD *)v4 + 4);
  humanBounds = self->_humanBounds;
  uint64_t v10 = *((void *)v4 + 3);
  if (humanBounds)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[VCPProtoBounds mergeFrom:](humanBounds, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[VCPProtoMovieFaceResult setHumanBounds:](self, "setHumanBounds:");
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

- (int)mouthExpression
{
  return self->_mouthExpression;
}

- (void)setMouthExpression:(int)a3
{
  self->_mouthExpression = a3;
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (BOOL)isCloseup
{
  return self->_isCloseup;
}

- (void)setIsCloseup:(BOOL)a3
{
  self->_isCloseup = a3;
}

- (int)faceID
{
  return self->_faceID;
}

- (void)setFaceID:(int)a3
{
  self->_faceID = a3;
}

- (VCPProtoBounds)humanBounds
{
  return self->_humanBounds;
}

- (void)setHumanBounds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_humanBounds, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end