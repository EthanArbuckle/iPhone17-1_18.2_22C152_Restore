@interface GEOLogMsgStateDeviceBase
+ (BOOL)isValid:(id)a3;
- (BOOL)deviceInVehicle;
- (BOOL)hasDeviceBatteryState;
- (BOOL)hasDeviceInVehicle;
- (BOOL)hasDeviceInterfaceOrientation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateDeviceBase)initWithDictionary:(id)a3;
- (GEOLogMsgStateDeviceBase)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceBatteryStateAsString:(int)a3;
- (id)deviceInterfaceOrientationAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsDeviceBatteryState:(id)a3;
- (int)StringAsDeviceInterfaceOrientation:(id)a3;
- (int)deviceBatteryState;
- (int)deviceInterfaceOrientation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceBatteryState:(int)a3;
- (void)setDeviceInVehicle:(BOOL)a3;
- (void)setDeviceInterfaceOrientation:(int)a3;
- (void)setHasDeviceBatteryState:(BOOL)a3;
- (void)setHasDeviceInVehicle:(BOOL)a3;
- (void)setHasDeviceInterfaceOrientation:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateDeviceBase

- (int)deviceInterfaceOrientation
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_deviceInterfaceOrientation;
  }
  else {
    return 0;
  }
}

- (void)setDeviceInterfaceOrientation:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_deviceInterfaceOrientation = a3;
}

- (void)setHasDeviceInterfaceOrientation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDeviceInterfaceOrientation
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)deviceInterfaceOrientationAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7DA0[a3];
  }

  return v3;
}

- (int)StringAsDeviceInterfaceOrientation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEVICE_ORIENTATION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEVICE_ORIENTATION_PORTRAIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEVICE_ORIENTATION_PORTRAIT_UPSIDE_DOWN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEVICE_ORIENTATION_LANDSCAPE_LEFT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DEVICE_ORIENTATION_LANDSCAPE_RIGHT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)deviceBatteryState
{
  if (*(unsigned char *)&self->_flags) {
    return self->_deviceBatteryState;
  }
  else {
    return 0;
  }
}

- (void)setDeviceBatteryState:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_deviceBatteryState = a3;
}

- (void)setHasDeviceBatteryState:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDeviceBatteryState
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)deviceBatteryStateAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F7DC8[a3];
  }

  return v3;
}

- (int)StringAsDeviceBatteryState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEVICE_BATTERY_STATE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEVICE_BATTERY_STATE_UNPLUGGED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEVICE_BATTERY_STATE_CHARGING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEVICE_BATTERY_STATE_FULL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)deviceInVehicle
{
  return self->_deviceInVehicle;
}

- (void)setDeviceInVehicle:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_deviceInVehicle = a3;
}

- (void)setHasDeviceInVehicle:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDeviceInVehicle
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateDeviceBase;
  int v4 = [(GEOLogMsgStateDeviceBase *)&v8 description];
  v5 = [(GEOLogMsgStateDeviceBase *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDeviceBase _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_24;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
      goto LABEL_4;
    }
LABEL_13:
    uint64_t v9 = *(int *)(a1 + 8);
    if (v9 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53F7DC8[v9];
    }
    if (a2) {
      v11 = @"deviceBatteryState";
    }
    else {
      v11 = @"device_battery_state";
    }
    [v4 setObject:v10 forKey:v11];

    if ((*(unsigned char *)(a1 + 20) & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  uint64_t v6 = *(int *)(a1 + 12);
  if (v6 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E53F7DA0[v6];
  }
  if (a2) {
    objc_super v8 = @"deviceInterfaceOrientation";
  }
  else {
    objc_super v8 = @"device_interface_orientation";
  }
  [v4 setObject:v7 forKey:v8];

  char v5 = *(unsigned char *)(a1 + 20);
  if (v5) {
    goto LABEL_13;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_20:
    v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
    if (a2) {
      v13 = @"deviceInVehicle";
    }
    else {
      v13 = @"device_in_vehicle";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateDeviceBase _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateDeviceBase)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDeviceBase *)-[GEOLogMsgStateDeviceBase _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_45;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_45;
  }
  if (a3) {
    uint64_t v6 = @"deviceInterfaceOrientation";
  }
  else {
    uint64_t v6 = @"device_interface_orientation";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"DEVICE_ORIENTATION_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"DEVICE_ORIENTATION_PORTRAIT"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"DEVICE_ORIENTATION_PORTRAIT_UPSIDE_DOWN"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"DEVICE_ORIENTATION_LANDSCAPE_LEFT"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"DEVICE_ORIENTATION_LANDSCAPE_RIGHT"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setDeviceInterfaceOrientation:v9];
LABEL_22:

  if (a3) {
    v10 = @"deviceBatteryState";
  }
  else {
    v10 = @"device_battery_state";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"DEVICE_BATTERY_STATE_UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"DEVICE_BATTERY_STATE_UNPLUGGED"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"DEVICE_BATTERY_STATE_CHARGING"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"DEVICE_BATTERY_STATE_FULL"])
    {
      uint64_t v13 = 3;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_38:
    [a1 setDeviceBatteryState:v13];
  }

  if (a3) {
    v14 = @"deviceInVehicle";
  }
  else {
    v14 = @"device_in_vehicle";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDeviceInVehicle:", objc_msgSend(v15, "BOOLValue"));
  }

LABEL_45:
  return a1;
}

- (GEOLogMsgStateDeviceBase)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDeviceBase *)-[GEOLogMsgStateDeviceBase _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDeviceBaseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDeviceBaseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateDeviceBase *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_deviceInterfaceOrientation;
    *((unsigned char *)v5 + 20) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_deviceBatteryState;
  *((unsigned char *)v5 + 20) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 16) = self->_deviceInVehicle;
    *((unsigned char *)v5 + 20) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_deviceInterfaceOrientation;
    *((unsigned char *)result + 20) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_deviceBatteryState;
  *((unsigned char *)result + 20) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 16) = self->_deviceInVehicle;
  *((unsigned char *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOLogMsgStateDeviceBase *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_deviceInterfaceOrientation != *((_DWORD *)v4 + 3)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_deviceBatteryState != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_14;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0)
    {
LABEL_14:
      BOOL v5 = 0;
      goto LABEL_15;
    }
    if (self->_deviceInVehicle)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateDeviceBase *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_deviceInterfaceOrientation;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_deviceBatteryState;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_deviceInVehicle;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 2) != 0)
  {
    self->_deviceInterfaceOrientation = *((_DWORD *)v5 + 3);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 20);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 20) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_deviceBatteryState = *((_DWORD *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 20) & 4) != 0)
  {
LABEL_4:
    self->_deviceInVehicle = *((unsigned char *)v5 + 16);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
}

@end