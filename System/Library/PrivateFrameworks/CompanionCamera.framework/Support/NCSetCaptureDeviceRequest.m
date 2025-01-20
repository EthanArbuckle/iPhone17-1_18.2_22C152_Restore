@interface NCSetCaptureDeviceRequest
- (BOOL)hasCaptureDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)captureDeviceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCaptureDevice:(id)a3;
- (int)captureDevice;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCaptureDevice:(int)a3;
- (void)setHasCaptureDevice:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCSetCaptureDeviceRequest

- (int)captureDevice
{
  if (*(unsigned char *)&self->_has) {
    return self->_captureDevice;
  }
  else {
    return 0;
  }
}

- (void)setCaptureDevice:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_captureDevice = a3;
}

- (void)setHasCaptureDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaptureDevice
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)captureDeviceAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"Front";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"Back";
  }
  return v4;
}

- (int)StringAsCaptureDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Back"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Front"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCSetCaptureDeviceRequest;
  id v3 = [(NCSetCaptureDeviceRequest *)&v7 description];
  int v4 = [(NCSetCaptureDeviceRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int captureDevice = self->_captureDevice;
    if (captureDevice)
    {
      if (captureDevice == 1)
      {
        v5 = @"Front";
      }
      else
      {
        v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_captureDevice];
      }
    }
    else
    {
      v5 = @"Back";
    }
    [v3 setObject:v5 forKey:@"captureDevice"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000087BC((uint64_t)self, (uint64_t)a3);
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
    *((_DWORD *)a3 + 2) = self->_captureDevice;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_captureDevice;
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_captureDevice == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_captureDevice;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_int captureDevice = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end