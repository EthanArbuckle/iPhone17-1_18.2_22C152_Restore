@interface NCStartCaptureRequest
- (BOOL)hasCaptureMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)captureModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCaptureMode:(id)a3;
- (int)captureMode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCaptureMode:(int)a3;
- (void)setHasCaptureMode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCStartCaptureRequest

- (int)captureMode
{
  if (*(unsigned char *)&self->_has) {
    return self->_captureMode;
  }
  else {
    return 0;
  }
}

- (void)setCaptureMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_captureMode = a3;
}

- (void)setHasCaptureMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaptureMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)captureModeAsString:(int)a3
{
  if a3 < 0xB && ((0x7ABu >> a3))
  {
    v3 = off_1000304C8[a3];
  }
  else
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v3;
}

- (int)StringAsCaptureMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Photo"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Square"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Timelapse"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Portrait"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Slomo"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Panorama"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Cinematic"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCStartCaptureRequest;
  id v3 = [(NCStartCaptureRequest *)&v7 description];
  int v4 = [(NCStartCaptureRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t captureMode = self->_captureMode;
    if captureMode < 0xB && ((0x7ABu >> captureMode))
    {
      v5 = off_1000304C8[captureMode];
    }
    else
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_captureMode];
    }
    [v3 setObject:v5 forKey:@"captureMode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000AAE8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_captureMode;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_captureMode;
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_captureMode == *((_DWORD *)v4 + 2))
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
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_captureMode;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t captureMode = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end