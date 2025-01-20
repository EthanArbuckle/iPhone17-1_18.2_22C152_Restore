@interface VCPProtoImageFaceResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasFaceQuality;
- (BOOL)isCloseup;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoBounds)bounds;
- (float)faceQuality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)eyeExpression;
- (int)mouthExpression;
- (int)position;
- (int)yaw;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setEyeExpression:(int)a3;
- (void)setFaceQuality:(float)a3;
- (void)setHasFaceQuality:(BOOL)a3;
- (void)setIsCloseup:(BOOL)a3;
- (void)setMouthExpression:(int)a3;
- (void)setPosition:(int)a3;
- (void)setYaw:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageFaceResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"attributes"];
  v5 = [v3 objectForKeyedSubscript:@"flags"];
  v6 = [v4 objectForKeyedSubscript:@"facePoseYaw"];
  v7 = [v4 objectForKeyedSubscript:@"facePosition"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"faceBounds"];
  v9 = (NSString *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0 || v8 == 0)
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init(VCPProtoImageFaceResult);
    uint64_t v14 = [v5 unsignedIntegerValue];
    unint64_t v15 = v14;
    if ((v14 & 4) != 0) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = (v14 >> 3) & 1;
    }
    [(VCPProtoImageFaceResult *)v13 setEyeExpression:v16];
    [(VCPProtoImageFaceResult *)v13 setMouthExpression:(v15 >> 1) & 1];
    -[VCPProtoImageFaceResult setYaw:](v13, "setYaw:", [v6 intValue]);
    -[VCPProtoImageFaceResult setPosition:](v13, "setPosition:", [v7 intValue]);
    NSRect v22 = NSRectFromString(v9);
    v17 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    [(VCPProtoImageFaceResult *)v13 setBounds:v17];

    [(VCPProtoImageFaceResult *)v13 setIsCloseup:(v15 >> 4) & 1];
    v18 = [v4 objectForKeyedSubscript:@"faceQuality"];

    if (v18)
    {
      v19 = [v4 objectForKeyedSubscript:@"faceQuality"];
      [v19 floatValue];
      -[VCPProtoImageFaceResult setFaceQuality:](v13, "setFaceQuality:");
    }
  }

  return v13;
}

- (id)exportToLegacyDictionary
{
  v17[2] = *MEMORY[0x1E4F143B8];
  int v3 = [(VCPProtoImageFaceResult *)self eyeExpression];
  if (v3 == 1) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = 4 * (v3 == 2);
  }
  if ([(VCPProtoImageFaceResult *)self mouthExpression] == 1) {
    v4 |= 2uLL;
  }
  if ([(VCPProtoImageFaceResult *)self isCloseup]) {
    uint64_t v5 = v4 | 0x10;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoImageFaceResult yaw](self, "yaw"));
  [v6 setObject:v7 forKeyedSubscript:@"facePoseYaw"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoImageFaceResult position](self, "position"));
  [v6 setObject:v8 forKeyedSubscript:@"facePosition"];

  v9 = [(VCPProtoImageFaceResult *)self bounds];
  [v9 rectValue];
  BOOL v10 = NSStringFromRect(v19);
  [v6 setObject:v10 forKeyedSubscript:@"faceBounds"];

  if ([(VCPProtoImageFaceResult *)self hasFaceQuality])
  {
    v11 = NSNumber;
    [(VCPProtoImageFaceResult *)self faceQuality];
    v12 = objc_msgSend(v11, "numberWithFloat:");
    [v6 setObject:v12 forKeyedSubscript:@"faceQuality"];
  }
  v16[0] = @"flags";
  v13 = [NSNumber numberWithUnsignedLongLong:v5];
  v16[1] = @"attributes";
  v17[0] = v13;
  v17[1] = v6;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v14;
}

- (void)setFaceQuality:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_faceQuality = a3;
}

- (void)setHasFaceQuality:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFaceQuality
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageFaceResult;
  uint64_t v4 = [(VCPProtoImageFaceResult *)&v8 description];
  uint64_t v5 = [(VCPProtoImageFaceResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [NSNumber numberWithInt:self->_eyeExpression];
  [v3 setObject:v4 forKey:@"eyeExpression"];

  uint64_t v5 = [NSNumber numberWithInt:self->_mouthExpression];
  [v3 setObject:v5 forKey:@"mouthExpression"];

  v6 = [NSNumber numberWithInt:self->_yaw];
  [v3 setObject:v6 forKey:@"yaw"];

  v7 = [NSNumber numberWithInt:self->_position];
  [v3 setObject:v7 forKey:@"position"];

  bounds = self->_bounds;
  if (bounds)
  {
    v9 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"bounds"];
  }
  BOOL v10 = [NSNumber numberWithBool:self->_isCloseup];
  [v3 setObject:v10 forKey:@"isCloseup"];

  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v11 = self->_faceQuality;
    v12 = [NSNumber numberWithFloat:v11];
    [v3 setObject:v12 forKey:@"faceQuality"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageFaceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[4] = self->_eyeExpression;
  v4[6] = self->_mouthExpression;
  v4[8] = self->_yaw;
  v4[7] = self->_position;
  [v4 setBounds:self->_bounds];
  *((unsigned char *)v4 + 36) = self->_isCloseup;
  if (*(unsigned char *)&self->_has)
  {
    v4[5] = LODWORD(self->_faceQuality);
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_eyeExpression;
  *(_DWORD *)(v5 + 24) = self->_mouthExpression;
  *(_DWORD *)(v5 + 32) = self->_yaw;
  *(_DWORD *)(v5 + 28) = self->_position;
  id v6 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(unsigned char *)(v5 + 36) = self->_isCloseup;
  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 20) = self->_faceQuality;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (self->_eyeExpression != *((_DWORD *)v4 + 4)) {
    goto LABEL_16;
  }
  if (self->_mouthExpression != *((_DWORD *)v4 + 6)) {
    goto LABEL_16;
  }
  if (self->_yaw != *((_DWORD *)v4 + 8)) {
    goto LABEL_16;
  }
  if (self->_position != *((_DWORD *)v4 + 7)) {
    goto LABEL_16;
  }
  bounds = self->_bounds;
  if ((unint64_t)bounds | *((void *)v4 + 1))
  {
    if (!-[VCPProtoBounds isEqual:](bounds, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (self->_isCloseup)
  {
    if (!*((unsigned char *)v4 + 36)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_faceQuality != *((float *)v4 + 5)) {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  uint64_t eyeExpression = self->_eyeExpression;
  uint64_t mouthExpression = self->_mouthExpression;
  uint64_t yaw = self->_yaw;
  uint64_t position = self->_position;
  unint64_t v7 = [(VCPProtoBounds *)self->_bounds hash];
  BOOL isCloseup = self->_isCloseup;
  if (*(unsigned char *)&self->_has)
  {
    float faceQuality = self->_faceQuality;
    float v11 = -faceQuality;
    if (faceQuality >= 0.0) {
      float v11 = self->_faceQuality;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  return (2654435761 * mouthExpression) ^ (2654435761 * eyeExpression) ^ (2654435761 * yaw) ^ (2654435761 * position) ^ v7 ^ (2654435761 * isCloseup) ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t eyeExpression = *((_DWORD *)v4 + 4);
  self->_uint64_t mouthExpression = *((_DWORD *)v4 + 6);
  self->_uint64_t yaw = *((_DWORD *)v4 + 8);
  self->_uint64_t position = *((_DWORD *)v4 + 7);
  bounds = self->_bounds;
  uint64_t v6 = *((void *)v4 + 1);
  if (bounds)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoImageFaceResult setBounds:](self, "setBounds:");
  }
  id v4 = v7;
LABEL_7:
  self->_BOOL isCloseup = *((unsigned char *)v4 + 36);
  if (*((unsigned char *)v4 + 40))
  {
    self->_float faceQuality = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)eyeExpression
{
  return self->_eyeExpression;
}

- (void)setEyeExpression:(int)a3
{
  self->_uint64_t eyeExpression = a3;
}

- (int)mouthExpression
{
  return self->_mouthExpression;
}

- (void)setMouthExpression:(int)a3
{
  self->_uint64_t mouthExpression = a3;
}

- (int)yaw
{
  return self->_yaw;
}

- (void)setYaw:(int)a3
{
  self->_uint64_t yaw = a3;
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_uint64_t position = a3;
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
  self->_BOOL isCloseup = a3;
}

- (float)faceQuality
{
  return self->_faceQuality;
}

- (void).cxx_destruct
{
}

@end