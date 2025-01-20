@interface ETPHeader
- (BOOL)hasBaseColor;
- (BOOL)hasIdentifier;
- (BOOL)hasMessageData;
- (BOOL)hasMessageType;
- (BOOL)hasSendDate;
- (BOOL)hasStartDelay;
- (BOOL)hasSupportsPlaybackTimeOffsets;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsPlaybackTimeOffsets;
- (NSData)messageData;
- (NSString)identifier;
- (double)startDelay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageTypeAsString:(int)a3;
- (int)StringAsMessageType:(id)a3;
- (int)messageType;
- (int64_t)sendDate;
- (unint64_t)hash;
- (unsigned)baseColor;
- (void)mergeFrom:(id)a3;
- (void)setBaseColor:(unsigned int)a3;
- (void)setHasBaseColor:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasSendDate:(BOOL)a3;
- (void)setHasStartDelay:(BOOL)a3;
- (void)setHasSupportsPlaybackTimeOffsets:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageData:(id)a3;
- (void)setMessageType:(int)a3;
- (void)setSendDate:(int64_t)a3;
- (void)setStartDelay:(double)a3;
- (void)setSupportsPlaybackTimeOffsets:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ETPHeader

- (int)messageType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_messageType;
  }
  else {
    return 1;
  }
}

- (void)setMessageType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMessageType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if ((a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264DEC6F0[a3 - 1];
  }

  return v3;
}

- (int)StringAsMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Tap"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"QuickTap"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Heartbeat"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Doodle"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ReadReceipt"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Kiss"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Anger"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setSendDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sendDate = a3;
}

- (void)setHasSendDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSendDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMessageData
{
  return self->_messageData != 0;
}

- (void)setBaseColor:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_baseColor = a3;
}

- (void)setHasBaseColor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBaseColor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setSupportsPlaybackTimeOffsets:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_supportsPlaybackTimeOffsets = a3;
}

- (void)setHasSupportsPlaybackTimeOffsets:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsPlaybackTimeOffsets
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setStartDelay:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startDelay = a3;
}

- (void)setHasStartDelay:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDelay
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ETPHeader;
  int v4 = [(ETPHeader *)&v8 description];
  v5 = [(ETPHeader *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    unsigned int v5 = self->_messageType - 1;
    if (v5 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messageType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_264DEC6F0[v5];
    }
    [v3 setObject:v6 forKey:@"messageType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_sendDate];
    [v3 setObject:v7 forKey:@"sendDate"];
  }
  messageData = self->_messageData;
  if (messageData) {
    [v3 setObject:messageData forKey:@"messageData"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_baseColor];
    [v3 setObject:v9 forKey:@"baseColor"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_supportsPlaybackTimeOffsets];
    [v3 setObject:v12 forKey:@"supportsPlaybackTimeOffsets"];

    char v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    v13 = [NSNumber numberWithDouble:self->_startDelay];
    [v3 setObject:v13 forKey:@"startDelay"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ETPHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteSfixed64Field();
  }
  if (self->_messageData) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteFixed32Field();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_messageType;
    *(unsigned char *)(v5 + 56) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_sendDate;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_messageData copyWithZone:a3];
  v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_baseColor;
    *(unsigned char *)(v6 + 56) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  char v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  char v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 52) = self->_supportsPlaybackTimeOffsets;
    *(unsigned char *)(v6 + 56) |= 0x10u;
    char v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_startDelay;
    *(unsigned char *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_messageType != *((_DWORD *)v4 + 12)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_sendDate != *((void *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_35;
  }
  messageData = self->_messageData;
  if ((unint64_t)messageData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](messageData, "isEqual:")) {
      goto LABEL_35;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_baseColor != *((_DWORD *)v4 + 6)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_35;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_35;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
    {
      if (self->_supportsPlaybackTimeOffsets)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_35;
        }
        goto LABEL_31;
      }
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_31;
      }
    }
LABEL_35:
    BOOL v8 = 0;
    goto LABEL_36;
  }
  if ((*((unsigned char *)v4 + 56) & 0x10) != 0) {
    goto LABEL_35;
  }
LABEL_31:
  BOOL v8 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_startDelay != *((double *)v4 + 2)) {
      goto LABEL_35;
    }
    BOOL v8 = 1;
  }
LABEL_36:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_messageType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sendDate;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSData *)self->_messageData hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_baseColor;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v8 = 2654435761 * self->_supportsPlaybackTimeOffsets;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v13 = 0;
    return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v13;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double startDelay = self->_startDelay;
  double v10 = -startDelay;
  if (startDelay >= 0.0) {
    double v10 = self->_startDelay;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 8) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if (v5)
  {
    self->_sendDate = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v7 = v4;
  if (*((void *)v4 + 5))
  {
    -[ETPHeader setMessageData:](self, "setMessageData:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    self->_baseColor = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4))
  {
    -[ETPHeader setIdentifier:](self, "setIdentifier:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 56);
  if ((v6 & 0x10) != 0)
  {
    self->_supportsPlaybackTimeOffsets = *((unsigned char *)v4 + 52);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 56);
  }
  if ((v6 & 2) != 0)
  {
    self->_double startDelay = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int64_t)sendDate
{
  return self->_sendDate;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
}

- (unsigned)baseColor
{
  return self->_baseColor;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)supportsPlaybackTimeOffsets
{
  return self->_supportsPlaybackTimeOffsets;
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end