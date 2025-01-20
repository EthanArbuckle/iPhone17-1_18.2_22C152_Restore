@interface TFDevice
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFDevice

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TFDevice;
  v3 = [(TFDevice *)&v7 description];
  v4 = [(TFDevice *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t devicePlatform = self->_devicePlatform;
    if (devicePlatform >= 4)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_devicePlatform];
    }
    else
    {
      v6 = *(&off_10052B970 + devicePlatform);
    }
    [v3 setObject:v6 forKey:@"devicePlatform"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t deviceFamily = self->_deviceFamily;
    if (deviceFamily >= 7)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_deviceFamily];
    }
    else
    {
      v8 = *(&off_10052B990 + deviceFamily);
    }
    [v3 setObject:v8 forKey:@"deviceFamily"];
  }
  model = self->_model;
  if (model) {
    [v3 setObject:model forKey:@"model"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v3 setObject:osVersion forKey:@"osVersion"];
  }
  architecture = self->_architecture;
  if (architecture) {
    [v3 setObject:architecture forKey:@"architecture"];
  }
  display = self->_display;
  if (display)
  {
    v13 = [(TFDisplay *)display dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"display"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  timezone = self->_timezone;
  if (timezone) {
    [v3 setObject:timezone forKey:@"timezone"];
  }
  carrier = self->_carrier;
  if (carrier) {
    [v3 setObject:carrier forKey:@"carrier"];
  }
  cellularNetworkType = self->_cellularNetworkType;
  if (cellularNetworkType) {
    [v3 setObject:cellularNetworkType forKey:@"cellularNetworkType"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t connection = self->_connection;
    if (connection >= 4)
    {
      v19 = +[NSString stringWithFormat:@"(unknown: %i)", self->_connection];
    }
    else
    {
      v19 = *(&off_10052B9C8 + connection);
    }
    [v3 setObject:v19 forKey:@"connection"];
  }
  disk = self->_disk;
  if (disk)
  {
    v21 = [(TFMemoryUsage *)disk dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"disk"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v22 = +[NSNumber numberWithUnsignedInt:self->_batteryPercentage];
    [v3 setObject:v22 forKey:@"batteryPercentage"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1003AD568((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_osVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_architecture)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_display)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_timezone)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_carrier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_cellularNetworkType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_disk)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_23:
      if ((has & 8) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_model copyWithZone:a3];
  objc_super v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = [(NSString *)self->_osVersion copyWithZone:a3];
  v9 = (void *)v5[11];
  v5[11] = v8;

  id v10 = [(NSString *)self->_architecture copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(TFDisplay *)self->_display copyWithZone:a3];
  v13 = (void *)v5[8];
  v5[8] = v12;

  id v14 = [(NSString *)self->_locale copyWithZone:a3];
  v15 = (void *)v5[9];
  v5[9] = v14;

  id v16 = [(NSString *)self->_timezone copyWithZone:a3];
  v17 = (void *)v5[12];
  v5[12] = v16;

  id v18 = [(NSString *)self->_carrier copyWithZone:a3];
  v19 = (void *)v5[3];
  v5[3] = v18;

  id v20 = [(NSString *)self->_cellularNetworkType copyWithZone:a3];
  v21 = (void *)v5[4];
  v5[4] = v20;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_connection;
    *((unsigned char *)v5 + 104) |= 2u;
  }
  id v22 = [(TFMemoryUsage *)self->_disk copyWithZone:a3];
  v23 = (void *)v5[7];
  v5[7] = v22;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((_DWORD *)v5 + 11) = self->_deviceFamily;
    *((unsigned char *)v5 + 104) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v5;
    }
    goto LABEL_6;
  }
  *((_DWORD *)v5 + 4) = self->_batteryPercentage;
  *((unsigned char *)v5 + 104) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 12) = self->_devicePlatform;
    *((unsigned char *)v5 + 104) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  model = self->_model;
  if ((unint64_t)model | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](model, "isEqual:")) {
      goto LABEL_40;
    }
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:")) {
      goto LABEL_40;
    }
  }
  architecture = self->_architecture;
  if ((unint64_t)architecture | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](architecture, "isEqual:")) {
      goto LABEL_40;
    }
  }
  display = self->_display;
  if ((unint64_t)display | *((void *)v4 + 8))
  {
    if (!-[TFDisplay isEqual:](display, "isEqual:")) {
      goto LABEL_40;
    }
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_40;
    }
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](timezone, "isEqual:")) {
      goto LABEL_40;
    }
  }
  carrier = self->_carrier;
  if ((unint64_t)carrier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](carrier, "isEqual:")) {
      goto LABEL_40;
    }
  }
  cellularNetworkType = self->_cellularNetworkType;
  if ((unint64_t)cellularNetworkType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](cellularNetworkType, "isEqual:")) {
      goto LABEL_40;
    }
  }
  char has = (char)self->_has;
  char v14 = *((unsigned char *)v4 + 104);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 2) == 0 || self->_connection != *((_DWORD *)v4 + 10)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
    goto LABEL_40;
  }
  disk = self->_disk;
  if ((unint64_t)disk | *((void *)v4 + 7))
  {
    if (!-[TFMemoryUsage isEqual:](disk, "isEqual:"))
    {
LABEL_40:
      BOOL v16 = 0;
      goto LABEL_41;
    }
    char has = (char)self->_has;
    char v14 = *((unsigned char *)v4 + 104);
  }
  if (has)
  {
    if ((v14 & 1) == 0 || self->_batteryPercentage != *((_DWORD *)v4 + 4)) {
      goto LABEL_40;
    }
  }
  else if (v14)
  {
    goto LABEL_40;
  }
  if ((has & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_deviceFamily != *((_DWORD *)v4 + 11)) {
      goto LABEL_40;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_40;
  }
  BOOL v16 = (v14 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_devicePlatform != *((_DWORD *)v4 + 12)) {
      goto LABEL_40;
    }
    BOOL v16 = 1;
  }
LABEL_41:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v16 = [(NSString *)self->_model hash];
  NSUInteger v3 = [(NSString *)self->_osVersion hash];
  NSUInteger v4 = [(NSString *)self->_architecture hash];
  unint64_t v5 = [(TFDisplay *)self->_display hash];
  NSUInteger v6 = [(NSString *)self->_locale hash];
  NSUInteger v7 = [(NSString *)self->_timezone hash];
  NSUInteger v8 = [(NSString *)self->_carrier hash];
  NSUInteger v9 = [(NSString *)self->_cellularNetworkType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_connection;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = [(TFMemoryUsage *)self->_disk hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v14 = 0;
    return v3 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
  uint64_t v12 = 2654435761 * self->_batteryPercentage;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v13 = 2654435761 * self->_deviceFamily;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v14 = 2654435761 * self->_devicePlatform;
  return v3 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_disk, 0);
  objc_storeStrong((id *)&self->_cellularNetworkType, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_architecture, 0);
}

@end