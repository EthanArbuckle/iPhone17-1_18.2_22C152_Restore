@interface NCSetCaptureModeResponse
- (BOOL)hasCaptureMode;
- (BOOL)hasInternalState;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NCCameraStateChangedRequest)internalState;
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
- (void)setHasSuccess:(BOOL)a3;
- (void)setInternalState:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCSetCaptureModeResponse

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
    v3 = *(&off_100030CA0 + a3);
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

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasInternalState
{
  return self->_internalState != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCSetCaptureModeResponse;
  char v3 = [(NCSetCaptureModeResponse *)&v7 description];
  int v4 = [(NCSetCaptureModeResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t captureMode = self->_captureMode;
    if captureMode < 0xB && ((0x7ABu >> captureMode))
    {
      v6 = *(&off_100030CA0 + captureMode);
    }
    else
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_captureMode];
    }
    [v3 setObject:v6 forKey:@"captureMode"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_success];
    [v3 setObject:v7 forKey:@"success"];
  }
  internalState = self->_internalState;
  if (internalState)
  {
    v9 = [(NCCameraStateChangedRequest *)internalState dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"internalState"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001BC10((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_internalState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_captureMode;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_success;
    *((unsigned char *)v4 + 28) |= 2u;
  }
  if (self->_internalState)
  {
    id v6 = v4;
    objc_msgSend(v4, "setInternalState:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_captureMode;
    *((unsigned char *)v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 24) = self->_success;
    *((unsigned char *)v5 + 28) |= 2u;
  }
  id v8 = [(NCCameraStateChangedRequest *)self->_internalState copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_captureMode != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    unsigned __int8 v5 = 0;
    goto LABEL_12;
  }
  if ((*((unsigned char *)v4 + 28) & 2) == 0) {
    goto LABEL_11;
  }
  if (!self->_success)
  {
    if (!*((unsigned char *)v4 + 24)) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (!*((unsigned char *)v4 + 24)) {
    goto LABEL_11;
  }
LABEL_17:
  internalState = self->_internalState;
  if ((unint64_t)internalState | *((void *)v4 + 2)) {
    unsigned __int8 v5 = -[NCCameraStateChangedRequest isEqual:](internalState, "isEqual:");
  }
  else {
    unsigned __int8 v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_captureMode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NCCameraStateChangedRequest *)self->_internalState hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_success;
  return v3 ^ v2 ^ [(NCCameraStateChangedRequest *)self->_internalState hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  char v6 = *((unsigned char *)v4 + 28);
  if (v6)
  {
    self->_uint64_t captureMode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 28);
  }
  if ((v6 & 2) != 0)
  {
    self->_success = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
  internalState = self->_internalState;
  uint64_t v8 = v5[2];
  if (internalState)
  {
    if (v8) {
      -[NCCameraStateChangedRequest mergeFrom:](internalState, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NCSetCaptureModeResponse setInternalState:](self, "setInternalState:");
  }
  _objc_release_x1();
}

- (BOOL)success
{
  return self->_success;
}

- (NCCameraStateChangedRequest)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end