@interface GEOLogMsgStateDeviceConnection
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCellularDataState;
- (BOOL)hasDeviceCarrierName;
- (BOOL)hasDeviceCountryCode;
- (BOOL)hasDeviceNetworkConnectivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateDeviceConnection)init;
- (GEOLogMsgStateDeviceConnection)initWithData:(id)a3;
- (GEOLogMsgStateDeviceConnection)initWithDictionary:(id)a3;
- (GEOLogMsgStateDeviceConnection)initWithJSON:(id)a3;
- (NSString)deviceCarrierName;
- (NSString)deviceCountryCode;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)cellularDataStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceNetworkConnectivityAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCellularDataState:(id)a3;
- (int)StringAsDeviceNetworkConnectivity:(id)a3;
- (int)cellularDataState;
- (int)deviceNetworkConnectivity;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDeviceCarrierName;
- (void)_readDeviceCountryCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCellularDataState:(int)a3;
- (void)setDeviceCarrierName:(id)a3;
- (void)setDeviceCountryCode:(id)a3;
- (void)setDeviceNetworkConnectivity:(int)a3;
- (void)setHasCellularDataState:(BOOL)a3;
- (void)setHasDeviceNetworkConnectivity:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateDeviceConnection

- (void)setDeviceNetworkConnectivity:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_deviceNetworkConnectivity = a3;
}

- (void)setDeviceCountryCode:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (GEOLogMsgStateDeviceConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateDeviceConnection;
  v2 = [(GEOLogMsgStateDeviceConnection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_deviceCarrierName, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateDeviceConnection *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_deviceCountryCode) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceCarrierName) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_6994;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_6995;
    }
    GEOLogMsgStateDeviceConnectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOLogMsgStateDeviceConnection *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_deviceNetworkConnectivity != *((_DWORD *)v4 + 12)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  deviceCountryCode = self->_deviceCountryCode;
  if ((unint64_t)deviceCountryCode | *((void *)v4 + 3)
    && !-[NSString isEqual:](deviceCountryCode, "isEqual:"))
  {
    goto LABEL_15;
  }
  deviceCarrierName = self->_deviceCarrierName;
  if ((unint64_t)deviceCarrierName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceCarrierName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_cellularDataState != *((_DWORD *)v4 + 11)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"deviceNetworkConnectivity";
      }
      else {
        objc_super v6 = @"device_network_connectivity";
      }
      BOOL v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"DEVICE_NETWORK_CONNECTIVITY_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"DEVICE_NETWORK_CONNECTIVITY_NOT_CONNECTED"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"DEVICE_NETWORK_CONNECTIVITY_CELLULAR"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"DEVICE_NETWORK_CONNECTIVITY_WIFI"])
        {
          uint64_t v9 = 3;
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
          goto LABEL_20;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setDeviceNetworkConnectivity:v9];
LABEL_20:

      if (a3) {
        v10 = @"deviceCountryCode";
      }
      else {
        v10 = @"device_country_code";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setDeviceCountryCode:v12];
      }
      if (a3) {
        v13 = @"deviceCarrierName";
      }
      else {
        v13 = @"device_carrier_name";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setDeviceCarrierName:v15];
      }
      if (a3) {
        v16 = @"cellularDataState";
      }
      else {
        v16 = @"cellular_data_state";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        if ([v18 isEqualToString:@"CELLULAR_DATA_STATE_UNKNOWN"])
        {
          uint64_t v19 = 0;
        }
        else if ([v18 isEqualToString:@"CELLULAR_DATA_STATE_ALLOWED"])
        {
          uint64_t v19 = 1;
        }
        else if ([v18 isEqualToString:@"CELLULAR_DATA_STATE_DISABLED_FOR_MAPS"])
        {
          uint64_t v19 = 2;
        }
        else if ([v18 isEqualToString:@"CELLULAR_DATA_STATE_DISABLED_GLOBALLY"])
        {
          uint64_t v19 = 3;
        }
        else if ([v18 isEqualToString:@"CELLULAR_DATA_STATE_NOT_SUPPORTED"])
        {
          uint64_t v19 = 4;
        }
        else
        {
          uint64_t v19 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_49:

          goto LABEL_50;
        }
        uint64_t v19 = [v17 intValue];
      }
      [a1 setCellularDataState:v19];
      goto LABEL_49;
    }
  }
LABEL_50:

  return a1;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateDeviceConnection *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_deviceNetworkConnectivity;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_deviceCountryCode hash];
  NSUInteger v5 = [(NSString *)self->_deviceCarrierName hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_cellularDataState;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    BOOL v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgStateDeviceConnectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateDeviceConnection *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_deviceNetworkConnectivity;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_deviceCountryCode copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_deviceCarrierName copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_cellularDataState;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (GEOLogMsgStateDeviceConnection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateDeviceConnection;
  uint64_t v3 = [(GEOLogMsgStateDeviceConnection *)&v7 initWithData:a3];
  NSUInteger v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (int)deviceNetworkConnectivity
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_deviceNetworkConnectivity;
  }
  else {
    return 0;
  }
}

- (void)setHasDeviceNetworkConnectivity:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDeviceNetworkConnectivity
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)deviceNetworkConnectivityAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7DE8[a3];
  }

  return v3;
}

- (int)StringAsDeviceNetworkConnectivity:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEVICE_NETWORK_CONNECTIVITY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEVICE_NETWORK_CONNECTIVITY_NOT_CONNECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEVICE_NETWORK_CONNECTIVITY_CELLULAR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEVICE_NETWORK_CONNECTIVITY_WIFI"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDeviceCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 52) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceConnectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceCountryCode_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceCountryCode
{
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOLogMsgStateDeviceConnection _readDeviceCountryCode]((uint64_t)self);
  deviceCountryCode = self->_deviceCountryCode;

  return deviceCountryCode;
}

- (void)_readDeviceCarrierName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceConnectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceCarrierName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceCarrierName
{
  return self->_deviceCarrierName != 0;
}

- (NSString)deviceCarrierName
{
  -[GEOLogMsgStateDeviceConnection _readDeviceCarrierName]((uint64_t)self);
  deviceCarrierName = self->_deviceCarrierName;

  return deviceCarrierName;
}

- (void)setDeviceCarrierName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_deviceCarrierName, a3);
}

- (int)cellularDataState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_cellularDataState;
  }
  else {
    return 0;
  }
}

- (void)setCellularDataState:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_cellularDataState = a3;
}

- (void)setHasCellularDataState:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasCellularDataState
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)cellularDataStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F7E08[a3];
  }

  return v3;
}

- (int)StringAsCellularDataState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CELLULAR_DATA_STATE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CELLULAR_DATA_STATE_ALLOWED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CELLULAR_DATA_STATE_DISABLED_FOR_MAPS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CELLULAR_DATA_STATE_DISABLED_GLOBALLY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CELLULAR_DATA_STATE_NOT_SUPPORTED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateDeviceConnection;
  int v4 = [(GEOLogMsgStateDeviceConnection *)&v8 description];
  uint64_t v5 = [(GEOLogMsgStateDeviceConnection *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDeviceConnection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 52) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 48);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 48));
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = off_1E53F7DE8[v5];
      }
      if (a2) {
        objc_super v7 = @"deviceNetworkConnectivity";
      }
      else {
        objc_super v7 = @"device_network_connectivity";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 deviceCountryCode];
    if (v8)
    {
      if (a2) {
        uint64_t v9 = @"deviceCountryCode";
      }
      else {
        uint64_t v9 = @"device_country_code";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = [(id)a1 deviceCarrierName];
    if (v10)
    {
      if (a2) {
        uint64_t v11 = @"deviceCarrierName";
      }
      else {
        uint64_t v11 = @"device_carrier_name";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if (*(unsigned char *)(a1 + 52))
    {
      uint64_t v12 = *(int *)(a1 + 44);
      if (v12 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53F7E08[v12];
      }
      if (a2) {
        v14 = @"cellularDataState";
      }
      else {
        v14 = @"cellular_data_state";
      }
      [v4 setObject:v13 forKey:v14];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateDeviceConnection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateDeviceConnection)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDeviceConnection *)-[GEOLogMsgStateDeviceConnection _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgStateDeviceConnection)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDeviceConnection *)-[GEOLogMsgStateDeviceConnection _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDeviceConnectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDeviceConnectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEOLogMsgStateDeviceConnection *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_deviceNetworkConnectivity;
    *((unsigned char *)v4 + 52) |= 2u;
  }
  if (self->_deviceCountryCode) {
    objc_msgSend(v4, "setDeviceCountryCode:");
  }
  if (self->_deviceCarrierName) {
    objc_msgSend(v4, "setDeviceCarrierName:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 11) = self->_cellularDataState;
    *((unsigned char *)v4 + 52) |= 1u;
  }
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  int v4 = v5;
  if ((v5[13] & 2) != 0)
  {
    self->_deviceNetworkConnectivity = v5[12];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v5 + 3))
  {
    -[GEOLogMsgStateDeviceConnection setDeviceCountryCode:](self, "setDeviceCountryCode:");
    int v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[GEOLogMsgStateDeviceConnection setDeviceCarrierName:](self, "setDeviceCarrierName:");
    int v4 = v5;
  }
  if (v4[13])
  {
    self->_cellularDataState = v4[11];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end