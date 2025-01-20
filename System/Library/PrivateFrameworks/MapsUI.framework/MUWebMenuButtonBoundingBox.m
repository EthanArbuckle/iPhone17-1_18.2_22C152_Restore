@interface MUWebMenuButtonBoundingBox
- (BOOL)hasHeight;
- (BOOL)hasWidth;
- (BOOL)hasXCoordinate;
- (BOOL)hasYCoordinate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)height;
- (float)width;
- (float)xCoordinate;
- (float)yCoordinate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHasXCoordinate:(BOOL)a3;
- (void)setHasYCoordinate:(BOOL)a3;
- (void)setHeight:(float)a3;
- (void)setWidth:(float)a3;
- (void)setXCoordinate:(float)a3;
- (void)setYCoordinate:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUWebMenuButtonBoundingBox

- (void)setXCoordinate:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_xCoordinate = a3;
}

- (void)setHasXCoordinate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasXCoordinate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setYCoordinate:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_yCoordinate = a3;
}

- (void)setHasYCoordinate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasYCoordinate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHeight:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWidth:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUWebMenuButtonBoundingBox;
  v4 = [(MUWebMenuButtonBoundingBox *)&v8 description];
  v5 = [(MUWebMenuButtonBoundingBox *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_xCoordinate;
    objc_super v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"xCoordinate"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_yCoordinate;
  v9 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"yCoordinate"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *(float *)&double v4 = self->_height;
  v10 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"height"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    *(float *)&double v4 = self->_width;
    v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"width"];
  }
LABEL_6:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUWebMenuButtonBoundingBoxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteFloatField();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = LODWORD(self->_xCoordinate);
    *((unsigned char *)v4 + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = LODWORD(self->_yCoordinate);
  *((unsigned char *)v4 + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[2] = LODWORD(self->_height);
  *((unsigned char *)v4 + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v4[3] = LODWORD(self->_width);
    *((unsigned char *)v4 + 24) |= 2u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = LODWORD(self->_xCoordinate);
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = LODWORD(self->_yCoordinate);
  *((unsigned char *)result + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 2) = LODWORD(self->_height);
  *((unsigned char *)result + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 3) = LODWORD(self->_width);
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_xCoordinate != *((float *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_yCoordinate != *((float *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_height != *((float *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_width != *((float *)v4 + 3)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    float xCoordinate = self->_xCoordinate;
    float v6 = -xCoordinate;
    if (xCoordinate >= 0.0) {
      float v6 = self->_xCoordinate;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 8) != 0)
  {
    float yCoordinate = self->_yCoordinate;
    float v11 = -yCoordinate;
    if (yCoordinate >= 0.0) {
      float v11 = self->_yCoordinate;
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
  if (has)
  {
    float height = self->_height;
    float v16 = -height;
    if (height >= 0.0) {
      float v16 = self->_height;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 2) != 0)
  {
    float width = self->_width;
    float v21 = -width;
    if (width >= 0.0) {
      float v21 = self->_width;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_float xCoordinate = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_float yCoordinate = *((float *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_float height = *((float *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_5:
    self->_float width = *((float *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
}

- (float)xCoordinate
{
  return self->_xCoordinate;
}

- (float)yCoordinate
{
  return self->_yCoordinate;
}

- (float)height
{
  return self->_height;
}

- (float)width
{
  return self->_width;
}

@end