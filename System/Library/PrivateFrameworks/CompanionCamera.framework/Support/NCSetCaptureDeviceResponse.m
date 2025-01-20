@interface NCSetCaptureDeviceResponse
- (BOOL)hasInternalState;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NCCameraStateChangedRequest)internalState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setInternalState:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCSetCaptureDeviceResponse

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasInternalState
{
  return self->_internalState != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCSetCaptureDeviceResponse;
  v3 = [(NCSetCaptureDeviceResponse *)&v7 description];
  v4 = [(NCSetCaptureDeviceResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithBool:self->_success];
    [v3 setObject:v4 forKey:@"success"];
  }
  internalState = self->_internalState;
  if (internalState)
  {
    v6 = [(NCCameraStateChangedRequest *)internalState dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"internalState"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000BE64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_internalState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_success;
    v4[20] |= 1u;
  }
  if (self->_internalState)
  {
    id v5 = v4;
    objc_msgSend(v4, "setInternalState:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 16) = self->_success;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  id v7 = [(NCCameraStateChangedRequest *)self->_internalState copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_success)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    unsigned __int8 v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  internalState = self->_internalState;
  if ((unint64_t)internalState | *((void *)v4 + 1)) {
    unsigned __int8 v5 = -[NCCameraStateChangedRequest isEqual:](internalState, "isEqual:");
  }
  else {
    unsigned __int8 v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_success;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NCCameraStateChangedRequest *)self->_internalState hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4[20])
  {
    self->_success = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  internalState = self->_internalState;
  uint64_t v7 = *((void *)v5 + 1);
  if (internalState)
  {
    if (v7) {
      -[NCCameraStateChangedRequest mergeFrom:](internalState, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[NCSetCaptureDeviceResponse setInternalState:](self, "setInternalState:");
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