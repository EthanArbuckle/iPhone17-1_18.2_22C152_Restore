@interface ATXPBPredictionDeviceStateContext
- (BOOL)hasInAirplaneMode;
- (BOOL)hasOnWifi;
- (BOOL)hasWifiSSID;
- (BOOL)inAirplaneMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)onWifi;
- (BOOL)readFrom:(id)a3;
- (NSString)wifiSSID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInAirplaneMode:(BOOL)a3;
- (void)setHasOnWifi:(BOOL)a3;
- (void)setInAirplaneMode:(BOOL)a3;
- (void)setOnWifi:(BOOL)a3;
- (void)setWifiSSID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBPredictionDeviceStateContext

- (void)setOnWifi:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_onWifi = a3;
}

- (void)setHasOnWifi:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOnWifi
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasWifiSSID
{
  return self->_wifiSSID != 0;
}

- (void)setInAirplaneMode:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_inAirplaneMode = a3;
}

- (void)setHasInAirplaneMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInAirplaneMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBPredictionDeviceStateContext;
  v4 = [(ATXPBPredictionDeviceStateContext *)&v8 description];
  v5 = [(ATXPBPredictionDeviceStateContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_onWifi];
    [v3 setObject:v4 forKey:@"onWifi"];
  }
  wifiSSID = self->_wifiSSID;
  if (wifiSSID) {
    [v3 setObject:wifiSSID forKey:@"wifiSSID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_inAirplaneMode];
    [v3 setObject:v6 forKey:@"inAirplaneMode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionDeviceStateContextReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_wifiSSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[17] = self->_onWifi;
    v4[20] |= 2u;
  }
  if (self->_wifiSSID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setWifiSSID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_inAirplaneMode;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 17) = self->_onWifi;
    *(unsigned char *)(v5 + 20) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_wifiSSID copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v6 + 16) = self->_inAirplaneMode;
    *(unsigned char *)(v6 + 20) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0) {
      goto LABEL_15;
    }
    if (self->_onWifi)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_15;
  }
  wifiSSID = self->_wifiSSID;
  if ((unint64_t)wifiSSID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](wifiSSID, "isEqual:")) {
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_inAirplaneMode)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_15;
        }
      }
      else if (*((unsigned char *)v4 + 16))
      {
        goto LABEL_15;
      }
      BOOL v7 = 1;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v7 = 0;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_onWifi;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_wifiSSID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_inAirplaneMode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[20] & 2) != 0)
  {
    self->_onWifi = v4[17];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[ATXPBPredictionDeviceStateContext setWifiSSID:](self, "setWifiSSID:");
    NSUInteger v4 = v5;
  }
  if (v4[20])
  {
    self->_inAirplaneMode = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)onWifi
{
  return self->_onWifi;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
}

- (BOOL)inAirplaneMode
{
  return self->_inAirplaneMode;
}

- (void).cxx_destruct
{
}

@end