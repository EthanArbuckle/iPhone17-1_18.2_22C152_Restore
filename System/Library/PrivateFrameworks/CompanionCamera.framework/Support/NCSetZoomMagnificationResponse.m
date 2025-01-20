@interface NCSetZoomMagnificationResponse
- (BOOL)hasZoomMagnificationAmount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)zoomMagnificationAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasZoomMagnificationAmount:(BOOL)a3;
- (void)setZoomMagnificationAmount:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCSetZoomMagnificationResponse

- (void)setZoomMagnificationAmount:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_zoomMagnificationAmount = a3;
}

- (void)setHasZoomMagnificationAmount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasZoomMagnificationAmount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCSetZoomMagnificationResponse;
  v3 = [(NCSetZoomMagnificationResponse *)&v7 description];
  v4 = [(NCSetZoomMagnificationResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_zoomMagnificationAmount;
    v5 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v5 forKey:@"zoomMagnificationAmount"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000092AC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = LODWORD(self->_zoomMagnificationAmount);
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_zoomMagnificationAmount);
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_zoomMagnificationAmount == *((float *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return 0;
  }
  float zoomMagnificationAmount = self->_zoomMagnificationAmount;
  float v4 = -zoomMagnificationAmount;
  if (zoomMagnificationAmount >= 0.0) {
    float v4 = self->_zoomMagnificationAmount;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  unint64_t result = 2654435761u * (unint64_t)fmodf(v5, 1.8447e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      result += (unint64_t)v6;
    }
  }
  else
  {
    result -= (unint64_t)fabsf(v6);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_float zoomMagnificationAmount = *((float *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (float)zoomMagnificationAmount
{
  return self->_zoomMagnificationAmount;
}

@end