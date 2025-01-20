@interface HMAccessoryInfoProtoWifiNetworkInfoEvent
- (BOOL)hasMacAddress;
- (BOOL)hasNetworkBSSID;
- (BOOL)hasNetworkGatewayIPAddress;
- (BOOL)hasNetworkGatewayMacAddress;
- (BOOL)hasNetworkRSSI;
- (BOOL)hasNetworkSSID;
- (BOOL)hasRequiresPassword;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresPassword;
- (NSString)macAddress;
- (NSString)networkBSSID;
- (NSString)networkGatewayIPAddress;
- (NSString)networkGatewayMacAddress;
- (NSString)networkSSID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)networkRSSI;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNetworkRSSI:(BOOL)a3;
- (void)setHasRequiresPassword:(BOOL)a3;
- (void)setMacAddress:(id)a3;
- (void)setNetworkBSSID:(id)a3;
- (void)setNetworkGatewayIPAddress:(id)a3;
- (void)setNetworkGatewayMacAddress:(id)a3;
- (void)setNetworkRSSI:(int)a3;
- (void)setNetworkSSID:(id)a3;
- (void)setRequiresPassword:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoWifiNetworkInfoEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSSID, 0);
  objc_storeStrong((id *)&self->_networkGatewayMacAddress, 0);
  objc_storeStrong((id *)&self->_networkGatewayIPAddress, 0);
  objc_storeStrong((id *)&self->_networkBSSID, 0);

  objc_storeStrong((id *)&self->_macAddress, 0);
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (int)networkRSSI
{
  return self->_networkRSSI;
}

- (void)setNetworkGatewayMacAddress:(id)a3
{
}

- (NSString)networkGatewayMacAddress
{
  return self->_networkGatewayMacAddress;
}

- (void)setNetworkBSSID:(id)a3
{
}

- (NSString)networkBSSID
{
  return self->_networkBSSID;
}

- (void)setNetworkGatewayIPAddress:(id)a3
{
}

- (NSString)networkGatewayIPAddress
{
  return self->_networkGatewayIPAddress;
}

- (void)setNetworkSSID:(id)a3
{
}

- (NSString)networkSSID
{
  return self->_networkSSID;
}

- (void)setMacAddress:(id)a3
{
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setMacAddress:](self, "setMacAddress:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkSSID:](self, "setNetworkSSID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkGatewayIPAddress:](self, "setNetworkGatewayIPAddress:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkBSSID:](self, "setNetworkBSSID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent setNetworkGatewayMacAddress:](self, "setNetworkGatewayMacAddress:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if (v5)
  {
    self->_networkRSSI = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 60);
  }
  if ((v5 & 2) != 0)
  {
    self->_requiresPassword = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_macAddress hash];
  NSUInteger v4 = [(NSString *)self->_networkSSID hash];
  NSUInteger v5 = [(NSString *)self->_networkGatewayIPAddress hash];
  NSUInteger v6 = [(NSString *)self->_networkBSSID hash];
  NSUInteger v7 = [(NSString *)self->_networkGatewayMacAddress hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_networkRSSI;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_requiresPassword;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](macAddress, "isEqual:")) {
      goto LABEL_19;
    }
  }
  networkSSID = self->_networkSSID;
  if ((unint64_t)networkSSID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](networkSSID, "isEqual:")) {
      goto LABEL_19;
    }
  }
  networkGatewayIPAddress = self->_networkGatewayIPAddress;
  if ((unint64_t)networkGatewayIPAddress | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](networkGatewayIPAddress, "isEqual:")) {
      goto LABEL_19;
    }
  }
  networkBSSID = self->_networkBSSID;
  if ((unint64_t)networkBSSID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](networkBSSID, "isEqual:")) {
      goto LABEL_19;
    }
  }
  networkGatewayMacAddress = self->_networkGatewayMacAddress;
  if ((unint64_t)networkGatewayMacAddress | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](networkGatewayMacAddress, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_networkRSSI != *((_DWORD *)v4 + 10)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_19;
  }
  BOOL v10 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0)
    {
LABEL_19:
      BOOL v10 = 0;
      goto LABEL_20;
    }
    if (self->_requiresPassword)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_19;
    }
    BOOL v10 = 1;
  }
LABEL_20:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_macAddress copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_networkSSID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_networkGatewayIPAddress copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_networkBSSID copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_networkGatewayMacAddress copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 40) = self->_networkRSSI;
    *(unsigned char *)(v5 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_requiresPassword;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_macAddress)
  {
    objc_msgSend(v4, "setMacAddress:");
    id v4 = v6;
  }
  if (self->_networkSSID)
  {
    objc_msgSend(v6, "setNetworkSSID:");
    id v4 = v6;
  }
  if (self->_networkGatewayIPAddress)
  {
    objc_msgSend(v6, "setNetworkGatewayIPAddress:");
    id v4 = v6;
  }
  if (self->_networkBSSID)
  {
    objc_msgSend(v6, "setNetworkBSSID:");
    id v4 = v6;
  }
  if (self->_networkGatewayMacAddress)
  {
    objc_msgSend(v6, "setNetworkGatewayMacAddress:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 10) = self->_networkRSSI;
    *((unsigned char *)v4 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_requiresPassword;
    *((unsigned char *)v4 + 60) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_macAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_networkSSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_networkGatewayIPAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_networkBSSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_networkGatewayMacAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
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
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoWifiNetworkInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  macAddress = self->_macAddress;
  if (macAddress) {
    [v3 setObject:macAddress forKey:@"macAddress"];
  }
  networkSSID = self->_networkSSID;
  if (networkSSID) {
    [v4 setObject:networkSSID forKey:@"networkSSID"];
  }
  networkGatewayIPAddress = self->_networkGatewayIPAddress;
  if (networkGatewayIPAddress) {
    [v4 setObject:networkGatewayIPAddress forKey:@"networkGatewayIPAddress"];
  }
  networkBSSID = self->_networkBSSID;
  if (networkBSSID) {
    [v4 setObject:networkBSSID forKey:@"networkBSSID"];
  }
  networkGatewayMacAddress = self->_networkGatewayMacAddress;
  if (networkGatewayMacAddress) {
    [v4 setObject:networkGatewayMacAddress forKey:@"networkGatewayMacAddress"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithInt:self->_networkRSSI];
    [v4 setObject:v11 forKey:@"networkRSSI"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v12 = [NSNumber numberWithBool:self->_requiresPassword];
    [v4 setObject:v12 forKey:@"requiresPassword"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoWifiNetworkInfoEvent;
  id v4 = [(HMAccessoryInfoProtoWifiNetworkInfoEvent *)&v8 description];
  uint64_t v5 = [(HMAccessoryInfoProtoWifiNetworkInfoEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRequiresPassword
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasRequiresPassword:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setRequiresPassword:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requiresPassword = a3;
}

- (BOOL)hasNetworkRSSI
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNetworkRSSI:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setNetworkRSSI:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_networkRSSI = a3;
}

- (BOOL)hasNetworkGatewayMacAddress
{
  return self->_networkGatewayMacAddress != 0;
}

- (BOOL)hasNetworkBSSID
{
  return self->_networkBSSID != 0;
}

- (BOOL)hasNetworkGatewayIPAddress
{
  return self->_networkGatewayIPAddress != 0;
}

- (BOOL)hasNetworkSSID
{
  return self->_networkSSID != 0;
}

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

@end