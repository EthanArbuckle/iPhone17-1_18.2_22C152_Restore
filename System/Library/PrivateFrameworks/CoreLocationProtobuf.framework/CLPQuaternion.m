@interface CLPQuaternion
- (BOOL)hasW;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)w;
- (float)x;
- (float)y;
- (float)z;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasW:(BOOL)a3;
- (void)setW:(float)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)setZ:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPQuaternion

- (void)setZ:(float)a3
{
  self->_z = a3;
}

- (void)setY:(float)a3
{
  self->_y = a3;
}

- (void)setX:(float)a3
{
  self->_x = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
}

- (void)setW:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_w = a3;
}

- (void)setHasW:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasW
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPQuaternion;
  id v4 = [(CLPQuaternion *)&v8 description];
  v5 = [(CLPQuaternion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_w;
    v5 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v5 forKey:@"w"];
  }
  *(float *)&double v4 = self->_x;
  v6 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v6 forKey:@"x"];

  *(float *)&double v7 = self->_y;
  objc_super v8 = [NSNumber numberWithFloat:v7];
  [v3 setObject:v8 forKey:@"y"];

  *(float *)&double v9 = self->_z;
  v10 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v10 forKey:@"z"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPQuaternionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = LODWORD(self->_w);
    *((unsigned char *)a3 + 24) |= 1u;
  }
  *((_DWORD *)a3 + 3) = LODWORD(self->_x);
  *((_DWORD *)a3 + 4) = LODWORD(self->_y);
  *((_DWORD *)a3 + 5) = LODWORD(self->_z);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_w);
    *((unsigned char *)result + 24) |= 1u;
  }
  *((_DWORD *)result + 3) = LODWORD(self->_x);
  *((_DWORD *)result + 4) = LODWORD(self->_y);
  *((_DWORD *)result + 5) = LODWORD(self->_z);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_w != *((float *)v4 + 2)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_10:
    BOOL v5 = 0;
    goto LABEL_11;
  }
  if (self->_x != *((float *)v4 + 3) || self->_y != *((float *)v4 + 4)) {
    goto LABEL_10;
  }
  BOOL v5 = self->_z == *((float *)v4 + 5);
LABEL_11:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    float w = self->_w;
    float v5 = -w;
    if (w >= 0.0) {
      float v5 = self->_w;
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
      unint64_t v3 = v11;
    }
    else {
      unint64_t v3 = v10;
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  float x = self->_x;
  float v13 = -x;
  if (x >= 0.0) {
    float v13 = self->_x;
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
  float y = self->_y;
  float v22 = -y;
  if (y >= 0.0) {
    float v22 = self->_y;
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
  if (v24 < 0.0) {
    unint64_t v29 = v28;
  }
  else {
    unint64_t v29 = v27;
  }
  float z = self->_z;
  float v31 = -z;
  if (z >= 0.0) {
    float v31 = self->_z;
  }
  float v32 = floorf(v31 + 0.5);
  float v33 = (float)(v31 - v32) * 1.8447e19;
  float v34 = fmodf(v32, 1.8447e19);
  unint64_t v35 = 2654435761u * (unint64_t)v34;
  unint64_t v36 = v35 + (unint64_t)v33;
  if (v33 <= 0.0) {
    unint64_t v36 = 2654435761u * (unint64_t)v34;
  }
  unint64_t v37 = v35 - (unint64_t)fabsf(v33);
  if (v33 >= 0.0) {
    unint64_t v37 = v36;
  }
  return v20 ^ v3 ^ v29 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 24))
  {
    self->_float w = *((float *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  self->_float x = *((float *)a3 + 3);
  self->_float y = *((float *)a3 + 4);
  self->_float z = *((float *)a3 + 5);
}

- (float)w
{
  return self->_w;
}

- (float)x
{
  return self->_x;
}

- (float)y
{
  return self->_y;
}

- (float)z
{
  return self->_z;
}

@end