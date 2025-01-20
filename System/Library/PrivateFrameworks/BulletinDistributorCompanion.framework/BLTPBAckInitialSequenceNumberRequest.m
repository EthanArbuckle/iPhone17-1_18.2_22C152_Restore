@interface BLTPBAckInitialSequenceNumberRequest
- (BOOL)assert;
- (BOOL)hasAssert;
- (BOOL)hasSessionIdentifier;
- (BOOL)hasSessionState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)sessionState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssert:(BOOL)a3;
- (void)setHasAssert:(BOOL)a3;
- (void)setHasSessionState:(BOOL)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSessionState:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBAckInitialSequenceNumberRequest

- (void)setAssert:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_assert = a3;
}

- (void)setHasAssert:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAssert
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (void)setSessionState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionState = a3;
}

- (void)setHasSessionState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBAckInitialSequenceNumberRequest;
  v4 = [(BLTPBAckInitialSequenceNumberRequest *)&v8 description];
  v5 = [(BLTPBAckInitialSequenceNumberRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_assert];
    [v3 setObject:v4 forKey:@"assert"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v3 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_sessionState];
    [v3 setObject:v6 forKey:@"sessionState"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBAckInitialSequenceNumberRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[20] = self->_assert;
    v4[24] |= 2u;
  }
  if (self->_sessionIdentifier)
  {
    id v5 = v4;
    objc_msgSend(v4, "setSessionIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_sessionState;
    v4[24] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 20) = self->_assert;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  uint64_t v7 = [(NSData *)self->_sessionIdentifier copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_sessionState;
    *(unsigned char *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0) {
      goto LABEL_17;
    }
    if (self->_assert)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_17;
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (!((unint64_t)sessionIdentifier | *((void *)v4 + 1))) {
    goto LABEL_13;
  }
  if (!-[NSData isEqual:](sessionIdentifier, "isEqual:"))
  {
LABEL_17:
    BOOL v7 = 0;
    goto LABEL_18;
  }
  char has = (char)self->_has;
LABEL_13:
  BOOL v7 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_sessionState != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
    BOOL v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_assert;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_sessionIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_sessionState;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_assert = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[BLTPBAckInitialSequenceNumberRequest setSessionIdentifier:](self, "setSessionIdentifier:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 24))
  {
    self->_sessionState = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)assert
{
  return self->_assert;
}

- (NSData)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (unsigned)sessionState
{
  return self->_sessionState;
}

- (void).cxx_destruct
{
}

@end