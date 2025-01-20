@interface VCPProtoKeypoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)confidence;
- (float)x;
- (float)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoKeypoint

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoKeypoint;
  v4 = [(VCPProtoKeypoint *)&v8 description];
  v5 = [(VCPProtoKeypoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_x;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"x"];

  *(float *)&double v6 = self->_y;
  v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"y"];

  *(float *)&double v8 = self->_confidence;
  v9 = [NSNumber numberWithFloat:v8];
  [v3 setObject:v9 forKey:@"confidence"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoKeypointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_x);
  *((_DWORD *)a3 + 4) = LODWORD(self->_y);
  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->_x);
  *((_DWORD *)result + 4) = LODWORD(self->_y);
  *((_DWORD *)result + 2) = LODWORD(self->_confidence);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (float *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_x == v4[3]
    && self->_y == v4[4]
    && self->_confidence == v4[2];

  return v5;
}

- (unint64_t)hash
{
  float x = self->_x;
  float v4 = -x;
  if (x >= 0.0) {
    float v4 = self->_x;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  float y = self->_y;
  float v13 = -y;
  if (y >= 0.0) {
    float v13 = self->_y;
  }
  float v14 = floorf(v13 + 0.5);
  float v15 = (float)(v13 - v14) * 1.8447e19;
  float v16 = fmodf(v14, 1.8447e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  float confidence = self->_confidence;
  float v22 = -confidence;
  if (confidence >= 0.0) {
    float v22 = self->_confidence;
  }
  float v23 = floorf(v22 + 0.5);
  float v24 = (float)(v22 - v23) * 1.8447e19;
  float v25 = fmodf(v23, 1.8447e19);
  unint64_t v26 = 2654435761u * (unint64_t)v25;
  unint64_t v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0) {
    unint64_t v27 = 2654435761u * (unint64_t)v25;
  }
  unint64_t v28 = v26 - (unint64_t)fabsf(v24);
  if (v24 >= 0.0) {
    unint64_t v28 = v27;
  }
  return v20 ^ v11 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  self->_float x = *((float *)a3 + 3);
  self->_float y = *((float *)a3 + 4);
  self->_float confidence = *((float *)a3 + 2);
}

- (float)x
{
  return self->_x;
}

- (void)setX:(float)a3
{
  self->_float x = a3;
}

- (float)y
{
  return self->_y;
}

- (void)setY:(float)a3
{
  self->_float y = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

@end