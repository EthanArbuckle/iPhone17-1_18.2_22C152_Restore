@interface BMPBNowPlayingOutputDevice
- (BOOL)hasOutputDeviceId;
- (BOOL)hasOutputDeviceSubType;
- (BOOL)hasOutputDeviceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)outputDeviceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outputDeviceSubTypeAsString:(int)a3;
- (id)outputDeviceTypeAsString:(int)a3;
- (int)StringAsOutputDeviceSubType:(id)a3;
- (int)StringAsOutputDeviceType:(id)a3;
- (int)outputDeviceSubType;
- (int)outputDeviceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOutputDeviceSubType:(BOOL)a3;
- (void)setHasOutputDeviceType:(BOOL)a3;
- (void)setOutputDeviceId:(id)a3;
- (void)setOutputDeviceSubType:(int)a3;
- (void)setOutputDeviceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBNowPlayingOutputDevice

- (int)outputDeviceType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_outputDeviceType;
  }
  else {
    return 0;
  }
}

- (void)setOutputDeviceType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_outputDeviceType = a3;
}

- (void)setHasOutputDeviceType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOutputDeviceType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)outputDeviceTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D8718[a3];
  }

  return v3;
}

- (int)StringAsOutputDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AirPlay"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Bluetooth"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CarPlay"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BuiltIn"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Wired"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)outputDeviceSubType
{
  if (*(unsigned char *)&self->_has) {
    return self->_outputDeviceSubType;
  }
  else {
    return 0;
  }
}

- (void)setOutputDeviceSubType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_outputDeviceSubType = a3;
}

- (void)setHasOutputDeviceSubType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOutputDeviceSubType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)outputDeviceSubTypeAsString:(int)a3
{
  if (a3 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55D8748[a3];
  }

  return v3;
}

- (int)StringAsOutputDeviceSubType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Standard"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Speaker"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Headphones"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Headset"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Receiver"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LineOut"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"USB"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DisplayPort"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HDMI"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LowEnergy"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SPDIF"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"HomePod"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AppleTV"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Vehicle"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"AirPlayCluster"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SetTopBox"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"TVStick"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"Mac"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"iOS"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasOutputDeviceId
{
  return self->_outputDeviceId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBNowPlayingOutputDevice;
  int v4 = [(BMPBNowPlayingOutputDevice *)&v8 description];
  v5 = [(BMPBNowPlayingOutputDevice *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t outputDeviceType = self->_outputDeviceType;
    if (outputDeviceType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_outputDeviceType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E55D8718[outputDeviceType];
    }
    [v3 setObject:v6 forKey:@"outputDeviceType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t outputDeviceSubType = self->_outputDeviceSubType;
    if (outputDeviceSubType >= 0x15)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_outputDeviceSubType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E55D8748[outputDeviceSubType];
    }
    [v3 setObject:v8 forKey:@"outputDeviceSubType"];
  }
  outputDeviceId = self->_outputDeviceId;
  if (outputDeviceId) {
    [v3 setObject:outputDeviceId forKey:@"outputDeviceId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNowPlayingOutputDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_outputDeviceId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_outputDeviceType;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_outputDeviceSubType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_outputDeviceId)
  {
    id v6 = v4;
    objc_msgSend(v4, "setOutputDeviceId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_outputDeviceType;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_outputDeviceSubType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_outputDeviceId copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_outputDeviceType != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_outputDeviceSubType != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  outputDeviceId = self->_outputDeviceId;
  if ((unint64_t)outputDeviceId | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](outputDeviceId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_outputDeviceType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_outputDeviceId hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_outputDeviceSubType;
  return v3 ^ v2 ^ [(NSString *)self->_outputDeviceId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t outputDeviceType = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_uint64_t outputDeviceSubType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[BMPBNowPlayingOutputDevice setOutputDeviceId:](self, "setOutputDeviceId:");
    id v4 = v6;
  }
}

- (NSString)outputDeviceId
{
  return self->_outputDeviceId;
}

- (void)setOutputDeviceId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end