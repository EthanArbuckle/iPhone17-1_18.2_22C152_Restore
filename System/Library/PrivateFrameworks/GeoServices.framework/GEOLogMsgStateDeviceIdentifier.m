@interface GEOLogMsgStateDeviceIdentifier
+ (BOOL)isValid:(id)a3;
- (BOOL)deviceDarkMode;
- (BOOL)hasDeviceDarkMode;
- (BOOL)hasDeviceHwIdentifier;
- (BOOL)hasDeviceOsVersion;
- (BOOL)hasIsInternalInstall;
- (BOOL)hasIsInternalTool;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalInstall;
- (BOOL)isInternalTool;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateDeviceIdentifier)init;
- (GEOLogMsgStateDeviceIdentifier)initWithData:(id)a3;
- (GEOLogMsgStateDeviceIdentifier)initWithDictionary:(id)a3;
- (GEOLogMsgStateDeviceIdentifier)initWithJSON:(id)a3;
- (NSString)deviceHwIdentifier;
- (NSString)deviceOsVersion;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDeviceHwIdentifier;
- (void)_readDeviceOsVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDeviceDarkMode:(BOOL)a3;
- (void)setDeviceHwIdentifier:(id)a3;
- (void)setDeviceOsVersion:(id)a3;
- (void)setHasDeviceDarkMode:(BOOL)a3;
- (void)setHasIsInternalInstall:(BOOL)a3;
- (void)setHasIsInternalTool:(BOOL)a3;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setIsInternalTool:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateDeviceIdentifier

- (void)setIsInternalInstall:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_isInternalInstall = a3;
}

- (void)setIsInternalTool:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_isInternalTool = a3;
}

- (void)setDeviceHwIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_deviceHwIdentifier, a3);
}

- (void)setDeviceOsVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_deviceOsVersion, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateDeviceIdentifier *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_deviceOsVersion copyWithZone:a3];
    v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    uint64_t v11 = [(NSString *)self->_deviceHwIdentifier copyWithZone:a3];
    v12 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v11;

    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(unsigned char *)(v5 + 46) = self->_isInternalTool;
      *(unsigned char *)(v5 + 48) |= 4u;
      char flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0) {
          return (id)v5;
        }
LABEL_8:
        *(unsigned char *)(v5 + 44) = self->_deviceDarkMode;
        *(unsigned char *)(v5 + 48) |= 1u;
        return (id)v5;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      goto LABEL_7;
    }
    *(unsigned char *)(v5 + 45) = self->_isInternalInstall;
    *(unsigned char *)(v5 + 48) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStateDeviceIdentifierReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x38) == 0)
    {
      v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_15;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateDeviceIdentifier *)self readAll:0];
  if (self->_deviceOsVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceHwIdentifier) {
    PBDataWriterWriteStringField();
  }
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_12;
  }
LABEL_9:
  if (flags) {
LABEL_13:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_7066;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_7067;
    }
    GEOLogMsgStateDeviceIdentifierReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOLogMsgStateDeviceIdentifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateDeviceIdentifier;
  v2 = [(GEOLogMsgStateDeviceIdentifier *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOsVersion, 0);
  objc_storeStrong((id *)&self->_deviceHwIdentifier, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOLogMsgStateDeviceIdentifier)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateDeviceIdentifier;
  BOOL v3 = [(GEOLogMsgStateDeviceIdentifier *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readDeviceOsVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceOsVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceOsVersion
{
  return self->_deviceOsVersion != 0;
}

- (NSString)deviceOsVersion
{
  -[GEOLogMsgStateDeviceIdentifier _readDeviceOsVersion]((uint64_t)self);
  deviceOsVersion = self->_deviceOsVersion;

  return deviceOsVersion;
}

- (void)_readDeviceHwIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceHwIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceHwIdentifier
{
  return self->_deviceHwIdentifier != 0;
}

- (NSString)deviceHwIdentifier
{
  -[GEOLogMsgStateDeviceIdentifier _readDeviceHwIdentifier]((uint64_t)self);
  deviceHwIdentifier = self->_deviceHwIdentifier;

  return deviceHwIdentifier;
}

- (BOOL)isInternalTool
{
  return self->_isInternalTool;
}

- (void)setHasIsInternalTool:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsInternalTool
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setHasIsInternalInstall:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsInternalInstall
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)deviceDarkMode
{
  return self->_deviceDarkMode;
}

- (void)setDeviceDarkMode:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_deviceDarkMode = a3;
}

- (void)setHasDeviceDarkMode:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasDeviceDarkMode
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateDeviceIdentifier;
  v4 = [(GEOLogMsgStateDeviceIdentifier *)&v8 description];
  uint64_t v5 = [(GEOLogMsgStateDeviceIdentifier *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDeviceIdentifier _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_28;
  }
  [a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [a1 deviceOsVersion];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"deviceOsVersion";
    }
    else {
      objc_super v6 = @"device_os_version";
    }
    [v4 setObject:v5 forKey:v6];
  }

  objc_super v7 = [a1 deviceHwIdentifier];
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"deviceHwIdentifier";
    }
    else {
      objc_super v8 = @"device_hw_identifier";
    }
    [v4 setObject:v7 forKey:v8];
  }

  unsigned __int8 v9 = a1[48];
  if ((v9 & 4) == 0)
  {
    if ((a1[48] & 2) == 0) {
      goto LABEL_14;
    }
LABEL_20:
    v12 = [NSNumber numberWithBool:a1[45]];
    if (a2) {
      v13 = @"isInternalInstall";
    }
    else {
      v13 = @"is_internal_install";
    }
    [v4 setObject:v12 forKey:v13];

    if ((a1[48] & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
  v10 = [NSNumber numberWithBool:a1[46]];
  if (a2) {
    uint64_t v11 = @"isInternalTool";
  }
  else {
    uint64_t v11 = @"is_internal_tool";
  }
  [v4 setObject:v10 forKey:v11];

  unsigned __int8 v9 = a1[48];
  if ((v9 & 2) != 0) {
    goto LABEL_20;
  }
LABEL_14:
  if (v9)
  {
LABEL_24:
    v14 = [NSNumber numberWithBool:a1[44]];
    if (a2) {
      v15 = @"deviceDarkMode";
    }
    else {
      v15 = @"device_dark_mode";
    }
    [v4 setObject:v14 forKey:v15];
  }
LABEL_28:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateDeviceIdentifier _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateDeviceIdentifier)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDeviceIdentifier *)-[GEOLogMsgStateDeviceIdentifier _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"deviceOsVersion";
      }
      else {
        objc_super v6 = @"device_os_version";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setDeviceOsVersion:v8];
      }
      if (a3) {
        unsigned __int8 v9 = @"deviceHwIdentifier";
      }
      else {
        unsigned __int8 v9 = @"device_hw_identifier";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = (void *)[v10 copy];
        [a1 setDeviceHwIdentifier:v11];
      }
      if (a3) {
        v12 = @"isInternalTool";
      }
      else {
        v12 = @"is_internal_tool";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsInternalTool:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        v14 = @"isInternalInstall";
      }
      else {
        v14 = @"is_internal_install";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsInternalInstall:", objc_msgSend(v15, "BOOLValue"));
      }

      if (a3) {
        v16 = @"deviceDarkMode";
      }
      else {
        v16 = @"device_dark_mode";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDeviceDarkMode:", objc_msgSend(v17, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateDeviceIdentifier)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDeviceIdentifier *)-[GEOLogMsgStateDeviceIdentifier _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDeviceIdentifierIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDeviceIdentifierReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgStateDeviceIdentifier *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_deviceOsVersion) {
    objc_msgSend(v5, "setDeviceOsVersion:");
  }
  if (self->_deviceHwIdentifier) {
    objc_msgSend(v5, "setDeviceHwIdentifier:");
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v5 + 46) = self->_isInternalTool;
    *((unsigned char *)v5 + 48) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v5 + 45) = self->_isInternalInstall;
  *((unsigned char *)v5 + 48) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_8:
    *((unsigned char *)v5 + 44) = self->_deviceDarkMode;
    *((unsigned char *)v5 + 48) |= 1u;
  }
LABEL_9:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOLogMsgStateDeviceIdentifier *)self readAll:1];
  [v4 readAll:1];
  deviceOsVersion = self->_deviceOsVersion;
  if ((unint64_t)deviceOsVersion | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceOsVersion, "isEqual:")) {
      goto LABEL_24;
    }
  }
  deviceHwIdentifier = self->_deviceHwIdentifier;
  if ((unint64_t)deviceHwIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceHwIdentifier, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0) {
      goto LABEL_24;
    }
    if (self->_isInternalTool)
    {
      if (!*((unsigned char *)v4 + 46)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 46))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0) {
      goto LABEL_24;
    }
    if (self->_isInternalInstall)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 48))
    {
      if (self->_deviceDarkMode)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_24;
        }
      }
      else if (*((unsigned char *)v4 + 44))
      {
        goto LABEL_24;
      }
      BOOL v7 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v7 = 0;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateDeviceIdentifier *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_deviceOsVersion hash];
  NSUInteger v4 = [(NSString *)self->_deviceHwIdentifier hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_isInternalTool;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_isInternalInstall;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_deviceDarkMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if (v6[3])
  {
    -[GEOLogMsgStateDeviceIdentifier setDeviceOsVersion:](self, "setDeviceOsVersion:");
    NSUInteger v4 = v6;
  }
  if (v4[2])
  {
    -[GEOLogMsgStateDeviceIdentifier setDeviceHwIdentifier:](self, "setDeviceHwIdentifier:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_isInternalTool = *((unsigned char *)v4 + 46);
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((v4[6] & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_isInternalInstall = *((unsigned char *)v4 + 45);
  *(unsigned char *)&self->_flags |= 2u;
  if (v4[6])
  {
LABEL_8:
    self->_deviceDarkMode = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_9:
}

@end