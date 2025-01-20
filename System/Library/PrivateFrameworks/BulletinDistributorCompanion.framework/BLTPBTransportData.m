@interface BLTPBTransportData
+ (id)transportDataWithSequenceNumberManager:(id)a3;
- (BOOL)hasIsInitialSequenceNumber;
- (BOOL)hasMd5;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSessionIdentifier;
- (BOOL)hasSessionState;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialSequenceNumber;
- (BOOL)readFrom:(id)a3;
- (NSData)md5;
- (NSData)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sessionUUID;
- (int64_t)setSequenceNumberOnManager:(id)a3;
- (unint64_t)backwardsCompatibleSessionState;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (unsigned)sessionState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsInitialSequenceNumber:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSessionState:(BOOL)a3;
- (void)setIsInitialSequenceNumber:(BOOL)a3;
- (void)setMd5:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSessionState:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBTransportData

+ (id)transportDataWithSequenceNumberManager:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 nextSendSequenceNumber];
  if (v4)
  {
    v5 = objc_alloc_init(BLTPBTransportData);
    -[BLTPBTransportData setSequenceNumber:](v5, "setSequenceNumber:", [v4 unsignedLongLongValue]);
    uint64_t v6 = [v3 sessionState];
    if (v6)
    {
      uint64_t v7 = v6;
      [(BLTPBTransportData *)v5 setSessionState:v6];
      if (v7 == 1) {
        [(BLTPBTransportData *)v5 setIsInitialSequenceNumber:1];
      }
    }
    v18[0] = 0;
    v18[1] = 0;
    v8 = [v3 currentSessionIdentifier];
    [v8 getUUIDBytes:v18];

    v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v18 length:16];
    [(BLTPBTransportData *)v5 setSessionIdentifier:v9];
  }
  else
  {
    v10 = blt_ids_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[BLTPBTransportData(SequenceNumberManager) transportDataWithSequenceNumberManager:]((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);
    }

    v5 = 0;
  }

  return v5;
}

- (id)sessionUUID
{
  if ([(BLTPBTransportData *)self hasSessionIdentifier])
  {
    id v3 = objc_alloc(MEMORY[0x263F08C38]);
    id v4 = [(BLTPBTransportData *)self sessionIdentifier];
    v5 = objc_msgSend(v3, "initWithUUIDBytes:", objc_msgSend(v4, "bytes"));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)backwardsCompatibleSessionState
{
  if ([(BLTPBTransportData *)self hasSessionState])
  {
    LODWORD(result) = [(BLTPBTransportData *)self sessionState];
    return result;
  }
  if ([(BLTPBTransportData *)self hasIsInitialSequenceNumber])
  {
    LODWORD(result) = [(BLTPBTransportData *)self isInitialSequenceNumber];
    return result;
  }
  return 0;
}

- (int64_t)setSequenceNumberOnManager:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BLTPBTransportData *)self sequenceNumber];
  uint64_t v6 = [(BLTPBTransportData *)self sessionUUID];
  int64_t v7 = objc_msgSend(v4, "setRecvSequenceNumber:recvSessionIdentifier:force:", v5, v6, -[BLTPBTransportData backwardsCompatibleSessionState](self, "backwardsCompatibleSessionState") == 1);

  return v7;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsInitialSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isInitialSequenceNumber = a3;
}

- (void)setHasIsInitialSequenceNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsInitialSequenceNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (void)setSessionState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sessionState = a3;
}

- (void)setHasSessionState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasMd5
{
  return self->_md5 != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBTransportData;
  id v4 = [(BLTPBTransportData *)&v8 description];
  unint64_t v5 = [(BLTPBTransportData *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    unint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_sequenceNumber];
    [v3 setObject:v5 forKey:@"sequenceNumber"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v6 = [NSNumber numberWithBool:self->_isInitialSequenceNumber];
    [v3 setObject:v6 forKey:@"isInitialSequenceNumber"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v3 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_sessionState];
    [v3 setObject:v8 forKey:@"sessionState"];
  }
  md5 = self->_md5;
  if (md5) {
    [v3 setObject:md5 forKey:@"md5"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBTransportDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_sessionIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_md5)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_sequenceNumber;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_isInitialSequenceNumber;
    *((unsigned char *)v4 + 40) |= 4u;
  }
  id v6 = v4;
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v4, "setSessionIdentifier:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_sessionState;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_md5)
  {
    objc_msgSend(v6, "setMd5:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_sequenceNumber;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 36) = self->_isInitialSequenceNumber;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
  uint64_t v8 = [(NSData *)self->_sessionIdentifier copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_sessionState;
    *(unsigned char *)(v6 + 40) |= 2u;
  }
  uint64_t v10 = [(NSData *)self->_md5 copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_sequenceNumber != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0) {
      goto LABEL_25;
    }
    if (self->_isInitialSequenceNumber)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_25;
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (!((unint64_t)sessionIdentifier | *((void *)v4 + 3))) {
    goto LABEL_18;
  }
  if (!-[NSData isEqual:](sessionIdentifier, "isEqual:"))
  {
LABEL_25:
    char v8 = 0;
    goto LABEL_26;
  }
  char has = (char)self->_has;
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_sessionState != *((_DWORD *)v4 + 8)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_25;
  }
  md5 = self->_md5;
  if ((unint64_t)md5 | *((void *)v4 + 2)) {
    char v8 = -[NSData isEqual:](md5, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_sequenceNumber;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isInitialSequenceNumber;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSData *)self->_sessionIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_sessionState;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ [(NSData *)self->_md5 hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_sequenceNumber = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_isInitialSequenceNumber = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[BLTPBTransportData setSessionIdentifier:](self, "setSessionIdentifier:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_sessionState = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    -[BLTPBTransportData setMd5:](self, "setMd5:");
    id v4 = v6;
  }
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (BOOL)isInitialSequenceNumber
{
  return self->_isInitialSequenceNumber;
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

- (NSData)md5
{
  return self->_md5;
}

- (void)setMd5:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_md5, 0);
}

@end