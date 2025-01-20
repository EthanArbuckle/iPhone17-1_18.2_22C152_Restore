@interface MTRPluginPBMHeader
+ (id)headerWithSessionID:(id)a3 homeID:(id)a4 messageType:(int)a5;
+ (id)messageTypeAsString:(unsigned int)a3;
+ (id)onewayHeaderWithSessionID:(id)a3 homeID:(id)a4 messageType:(int)a5;
+ (id)requestHeaderWithSessionID:(id)a3 homeID:(id)a4 messageType:(int)a5;
- (BOOL)hasHomeID;
- (BOOL)hasMessageDirection;
- (BOOL)hasMessageID;
- (BOOL)hasMessageType;
- (BOOL)hasProtocol;
- (BOOL)hasSchema;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMUUID)homeID;
- (MTRPluginPBMUUID)messageID;
- (MTRPluginPBMUUID)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageDirectionAsString:(int)a3;
- (id)protocolAsString:(int)a3;
- (id)responseHeaderForRequestHeader;
- (id)schemaAsString:(int)a3;
- (id)shortDescription;
- (id)versionAsString:(int)a3;
- (int)StringAsMessageDirection:(id)a3;
- (int)StringAsProtocol:(id)a3;
- (int)StringAsSchema:(id)a3;
- (int)StringAsVersion:(id)a3;
- (int)messageDirection;
- (int)protocol;
- (int)schema;
- (int)version;
- (unint64_t)hash;
- (unsigned)messageType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMessageDirection:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasProtocol:(BOOL)a3;
- (void)setHasSchema:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHomeID:(id)a3;
- (void)setMessageDirection:(int)a3;
- (void)setMessageID:(id)a3;
- (void)setMessageType:(unsigned int)a3;
- (void)setProtocol:(int)a3;
- (void)setSchema:(int)a3;
- (void)setSessionID:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMHeader

- (int)version
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_version;
  }
  else {
    return 1;
  }
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)versionAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"VERSION_V1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsVersion:(id)a3
{
  return 1;
}

- (int)schema
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_schema;
  }
  else {
    return 1;
  }
}

- (void)setSchema:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_schema = a3;
}

- (void)setHasSchema:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSchema
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)schemaAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"SCHEMA_V1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsSchema:(id)a3
{
  return 1;
}

- (int)protocol
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_protocol;
  }
  else {
    return 1;
  }
}

- (void)setProtocol:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_protocol = a3;
}

- (void)setHasProtocol:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProtocol
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)protocolAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"MATTER_V1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsProtocol:(id)a3
{
  return 1;
}

- (void)setMessageType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)messageDirection
{
  if (*(unsigned char *)&self->_has) {
    return self->_messageDirection;
  }
  else {
    return 1;
  }
}

- (void)setMessageDirection:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_messageDirection = a3;
}

- (void)setHasMessageDirection:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageDirection
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)messageDirectionAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2653E6B60[a3 - 1];
  }
  return v3;
}

- (int)StringAsMessageDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Oneway"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Request"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Response"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasMessageID
{
  return self->_messageID != 0;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasHomeID
{
  return self->_homeID != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMHeader;
  int v4 = [(MTRPluginPBMHeader *)&v8 description];
  v5 = [(MTRPluginPBMHeader *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if (self->_version == 1)
    {
      v5 = @"VERSION_V1";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_version);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  if (self->_schema == 1)
  {
    v6 = @"SCHEMA_V1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_schema);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v3 setObject:v6 forKey:@"schema"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_15:
  if (self->_protocol == 1)
  {
    v7 = @"MATTER_V1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_protocol);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v3 setObject:v7 forKey:@"protocol"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }
LABEL_19:
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_messageType];
  [v3 setObject:v8 forKey:@"messageType"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  unsigned int v9 = self->_messageDirection - 1;
  if (v9 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messageDirection);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_2653E6B60[v9];
  }
  [v3 setObject:v10 forKey:@"messageDirection"];

LABEL_24:
  messageID = self->_messageID;
  if (messageID)
  {
    v12 = [(MTRPluginPBMUUID *)messageID dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"messageID"];
  }
  sessionID = self->_sessionID;
  if (sessionID)
  {
    v14 = [(MTRPluginPBMUUID *)sessionID dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"sessionID"];
  }
  homeID = self->_homeID;
  if (homeID)
  {
    v16 = [(MTRPluginPBMUUID *)homeID dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"homeID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
  if (self->_messageID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sessionID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_homeID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[14] = self->_version;
    *((unsigned char *)v4 + 60) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_schema;
  *((unsigned char *)v4 + 60) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[9] = self->_protocol;
  *((unsigned char *)v4 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  v4[8] = self->_messageType;
  *((unsigned char *)v4 + 60) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v4[4] = self->_messageDirection;
    *((unsigned char *)v4 + 60) |= 1u;
  }
LABEL_7:
  id v6 = v4;
  if (self->_messageID)
  {
    objc_msgSend(v4, "setMessageID:");
    id v4 = v6;
  }
  if (self->_sessionID)
  {
    objc_msgSend(v6, "setSessionID:");
    id v4 = v6;
  }
  if (self->_homeID)
  {
    objc_msgSend(v6, "setHomeID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_version;
    *(unsigned char *)(v5 + 60) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_schema;
  *(unsigned char *)(v5 + 60) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v5 + 32) = self->_messageType;
    *(unsigned char *)(v5 + 60) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 36) = self->_protocol;
  *(unsigned char *)(v5 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_messageDirection;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
LABEL_7:
  id v8 = [(MTRPluginPBMUUID *)self->_messageID copyWithZone:a3];
  unsigned int v9 = (void *)v6[3];
  v6[3] = v8;

  id v10 = [(MTRPluginPBMUUID *)self->_sessionID copyWithZone:a3];
  v11 = (void *)v6[6];
  v6[6] = v10;

  id v12 = [(MTRPluginPBMUUID *)self->_homeID copyWithZone:a3];
  v13 = (void *)v6[1];
  v6[1] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_version != *((_DWORD *)v4 + 14)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
LABEL_33:
    char v8 = 0;
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_schema != *((_DWORD *)v4 + 10)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_protocol != *((_DWORD *)v4 + 9)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_messageType != *((_DWORD *)v4 + 8)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_messageDirection != *((_DWORD *)v4 + 4)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_33;
  }
  messageID = self->_messageID;
  if ((unint64_t)messageID | *((void *)v4 + 3) && !-[MTRPluginPBMUUID isEqual:](messageID, "isEqual:")) {
    goto LABEL_33;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 6))
  {
    if (!-[MTRPluginPBMUUID isEqual:](sessionID, "isEqual:")) {
      goto LABEL_33;
    }
  }
  homeID = self->_homeID;
  if ((unint64_t)homeID | *((void *)v4 + 1)) {
    char v8 = -[MTRPluginPBMUUID isEqual:](homeID, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_34:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_schema;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_protocol;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_messageType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_messageDirection;
LABEL_12:
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(MTRPluginPBMUUID *)self->_messageID hash];
  unint64_t v9 = [(MTRPluginPBMUUID *)self->_sessionID hash];
  return v8 ^ v9 ^ [(MTRPluginPBMUUID *)self->_homeID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 0x10) != 0)
  {
    self->_version = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 60);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_schema = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 8u;
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_protocol = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_messageType = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 60))
  {
LABEL_6:
    self->_messageDirection = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  messageID = self->_messageID;
  uint64_t v8 = v5[3];
  v13 = v5;
  if (messageID)
  {
    if (!v8) {
      goto LABEL_18;
    }
    -[MTRPluginPBMUUID mergeFrom:](messageID, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_18;
    }
    -[MTRPluginPBMHeader setMessageID:](self, "setMessageID:");
  }
  uint64_t v5 = v13;
LABEL_18:
  sessionID = self->_sessionID;
  uint64_t v10 = v5[6];
  if (sessionID)
  {
    if (!v10) {
      goto LABEL_24;
    }
    -[MTRPluginPBMUUID mergeFrom:](sessionID, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_24;
    }
    -[MTRPluginPBMHeader setSessionID:](self, "setSessionID:");
  }
  uint64_t v5 = v13;
LABEL_24:
  homeID = self->_homeID;
  uint64_t v12 = v5[1];
  if (homeID)
  {
    if (v12) {
      -[MTRPluginPBMUUID mergeFrom:](homeID, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[MTRPluginPBMHeader setHomeID:](self, "setHomeID:");
  }
  MEMORY[0x270F9A758]();
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (MTRPluginPBMUUID)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (MTRPluginPBMUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (MTRPluginPBMUUID)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
}

+ (id)headerWithSessionID:(id)a3 homeID:(id)a4 messageType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = objc_alloc_init(MTRPluginPBMHeader);
  [(MTRPluginPBMHeader *)v9 setVersion:1];
  [(MTRPluginPBMHeader *)v9 setSchema:1];
  [(MTRPluginPBMHeader *)v9 setProtocol:1];
  uint64_t v10 = [MTRPluginPBMUUID alloc];
  v11 = [MEMORY[0x263F08C38] UUID];
  uint64_t v12 = [(MTRPluginPBMUUID *)v10 initWithUUID:v11];
  [(MTRPluginPBMHeader *)v9 setMessageID:v12];

  v13 = [[MTRPluginPBMUUID alloc] initWithUUID:v8];
  [(MTRPluginPBMHeader *)v9 setSessionID:v13];

  v14 = [[MTRPluginPBMUUID alloc] initWithUUID:v7];
  [(MTRPluginPBMHeader *)v9 setHomeID:v14];

  [(MTRPluginPBMHeader *)v9 setMessageType:v5];
  return v9;
}

+ (id)requestHeaderWithSessionID:(id)a3 homeID:(id)a4 messageType:(int)a5
{
  uint64_t v5 = [a1 headerWithSessionID:a3 homeID:a4 messageType:*(void *)&a5];
  [v5 setMessageDirection:2];
  return v5;
}

+ (id)onewayHeaderWithSessionID:(id)a3 homeID:(id)a4 messageType:(int)a5
{
  uint64_t v5 = [a1 headerWithSessionID:a3 homeID:a4 messageType:*(void *)&a5];
  [v5 setMessageDirection:1];
  return v5;
}

- (id)responseHeaderForRequestHeader
{
  v2 = (void *)[(MTRPluginPBMHeader *)self copy];
  [v2 setMessageDirection:3];
  return v2;
}

- (BOOL)isValid
{
  BOOL v3 = [(MTRPluginPBMHeader *)self hasVersion];
  int v4 = [(MTRPluginPBMHeader *)self hasSchema] + v3;
  BOOL v5 = [(MTRPluginPBMHeader *)self hasProtocol];
  int v6 = v4 + v5 + [(MTRPluginPBMHeader *)self hasMessageType];
  return v6 + [(MTRPluginPBMHeader *)self hasMessageDirection] == 5;
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  int v4 = [(MTRPluginPBMHeader *)self messageID];
  BOOL v5 = [v4 uuid];
  uint64_t v6 = [(MTRPluginPBMHeader *)self messageType];
  id v7 = +[MTRPluginPBMHeader messageTypeAsString:[(MTRPluginPBMHeader *)self messageType]];
  id v8 = [(MTRPluginPBMHeader *)self sessionID];
  unint64_t v9 = [v8 uuid];
  uint64_t v10 = [(MTRPluginPBMHeader *)self homeID];
  v11 = [v10 uuid];
  uint64_t v12 = [(MTRPluginPBMHeader *)self messageDirection];
  if ((v12 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_2653E6BA0[(int)v12 - 1];
  }
  v14 = [v3 stringWithFormat:@"<MTRPluginPBMHeader: mid: %@, type: %u (%@), sid: %@, hid: %@, direction: %@>", v5, v6, v7, v9, v11, v13];

  return v14;
}

+ (id)messageTypeAsString:(unsigned int)a3
{
  if (a3 <= 0x3E7)
  {
    unsigned int v4 = a3 - 1;
    if (a3 - 1 >= 9 || ((0x187u >> v4) & 1) == 0)
    {
      BOOL v3 = NSString;
      goto LABEL_8;
    }
    BOOL v5 = off_2653E6BB8[v4];
  }
  else
  {
    if (a3 - 1000 >= 0x11 || ((0x1FFFBu >> (a3 + 24)) & 1) == 0)
    {
      BOOL v3 = NSString;
LABEL_8:
      objc_msgSend(v3, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    BOOL v5 = off_2653E6C00[a3 - 1000];
  }
LABEL_9:
  return v5;
}

@end