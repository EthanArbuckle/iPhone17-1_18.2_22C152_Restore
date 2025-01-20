@interface ATXPBAVRouteInfo
- (BOOL)hasDeviceID;
- (BOOL)hasDeviceName;
- (BOOL)hasIsExternalRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternalRoute;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceID;
- (NSString)deviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasIsExternalRoute:(BOOL)a3;
- (void)setIsExternalRoute:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBAVRouteInfo

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (void)setIsExternalRoute:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isExternalRoute = a3;
}

- (void)setHasIsExternalRoute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsExternalRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBAVRouteInfo;
  v4 = [(ATXPBAVRouteInfo *)&v8 description];
  v5 = [(ATXPBAVRouteInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  deviceID = self->_deviceID;
  if (deviceID) {
    [v4 setObject:deviceID forKey:@"deviceID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_isExternalRoute];
    [v4 setObject:v7 forKey:@"isExternalRoute"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBAVRouteInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceID)
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
  id v5 = v4;
  if (self->_deviceName)
  {
    objc_msgSend(v4, "setDeviceName:");
    id v4 = v5;
  }
  if (self->_deviceID)
  {
    objc_msgSend(v5, "setDeviceID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_isExternalRoute;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceName copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_deviceID copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_isExternalRoute;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_8;
    }
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](deviceID, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_isExternalRoute)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceName hash];
  NSUInteger v4 = [(NSString *)self->_deviceID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isExternalRoute;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[ATXPBAVRouteInfo setDeviceName:](self, "setDeviceName:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXPBAVRouteInfo setDeviceID:](self, "setDeviceID:");
    NSUInteger v4 = v5;
  }
  if (v4[28])
  {
    self->_isExternalRoute = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (BOOL)isExternalRoute
{
  return self->_isExternalRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end