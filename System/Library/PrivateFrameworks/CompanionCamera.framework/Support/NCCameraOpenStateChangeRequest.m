@interface NCCameraOpenStateChangeRequest
- (BOOL)hasInternalState;
- (BOOL)hasOpenState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NCCameraStateChangedRequest)internalState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)openStateAsString:(int)a3;
- (int)StringAsOpenState:(id)a3;
- (int)openState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOpenState:(BOOL)a3;
- (void)setInternalState:(id)a3;
- (void)setOpenState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCCameraOpenStateChangeRequest

- (int)openState
{
  if (*(unsigned char *)&self->_has) {
    return self->_openState;
  }
  else {
    return 2;
  }
}

- (void)setOpenState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_openState = a3;
}

- (void)setHasOpenState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOpenState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)openStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1000304B0[a3];
  }
  return v3;
}

- (int)StringAsOpenState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Open"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Opening"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Closed"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasInternalState
{
  return self->_internalState != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCCameraOpenStateChangeRequest;
  id v3 = [(NCCameraOpenStateChangeRequest *)&v7 description];
  int v4 = [(NCCameraOpenStateChangeRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t openState = self->_openState;
    if (openState >= 3)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_openState];
    }
    else
    {
      v5 = off_1000304B0[openState];
    }
    [v3 setObject:v5 forKey:@"openState"];
  }
  internalState = self->_internalState;
  if (internalState)
  {
    objc_super v7 = [(NCCameraStateChangedRequest *)internalState dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"internalState"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100007ED4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
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
    v4[4] = self->_openState;
    *((unsigned char *)v4 + 20) |= 1u;
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
    *((_DWORD *)v5 + 4) = self->_openState;
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
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_openState != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  internalState = self->_internalState;
  if ((unint64_t)internalState | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NCCameraStateChangedRequest isEqual:](internalState, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_openState;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NCCameraStateChangedRequest *)self->_internalState hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[5])
  {
    self->_uint64_t openState = v4[4];
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
    -[NCCameraOpenStateChangeRequest setInternalState:](self, "setInternalState:");
  }
  _objc_release_x1();
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