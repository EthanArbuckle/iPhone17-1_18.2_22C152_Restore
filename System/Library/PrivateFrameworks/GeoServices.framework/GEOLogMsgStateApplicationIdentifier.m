@interface GEOLogMsgStateApplicationIdentifier
+ (BOOL)isValid:(id)a3;
- (BOOL)appDarkMode;
- (BOOL)hasAppDarkMode;
- (BOOL)hasAppIdentifier;
- (BOOL)hasAppMajorVersion;
- (BOOL)hasAppMinorVersion;
- (BOOL)hasAppType;
- (BOOL)hasProcessName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateApplicationIdentifier)init;
- (GEOLogMsgStateApplicationIdentifier)initWithData:(id)a3;
- (GEOLogMsgStateApplicationIdentifier)initWithDictionary:(id)a3;
- (GEOLogMsgStateApplicationIdentifier)initWithJSON:(id)a3;
- (NSString)appIdentifier;
- (NSString)appMajorVersion;
- (NSString)appMinorVersion;
- (NSString)processName;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAppType:(id)a3;
- (int)appType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAppIdentifier;
- (void)_readAppMajorVersion;
- (void)_readAppMinorVersion;
- (void)_readProcessName;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAppDarkMode:(BOOL)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAppMajorVersion:(id)a3;
- (void)setAppMinorVersion:(id)a3;
- (void)setAppType:(int)a3;
- (void)setHasAppDarkMode:(BOOL)a3;
- (void)setHasAppType:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateApplicationIdentifier

- (void)setAppType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_appType = a3;
}

- (void)setAppIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7C) == 0))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateApplicationIdentifier *)self readAll:0];
    if (self->_appIdentifier) {
      PBDataWriterWriteStringField();
    }
    if (self->_appMajorVersion) {
      PBDataWriterWriteStringField();
    }
    if (self->_appMinorVersion) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_processName) {
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
      v8 = (int *)&readAll__recursiveTag_6624;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_6625;
    }
    GEOLogMsgStateApplicationIdentifierReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOLogMsgStateApplicationIdentifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateApplicationIdentifier;
  v2 = [(GEOLogMsgStateApplicationIdentifier *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (NSString)appIdentifier
{
  -[GEOLogMsgStateApplicationIdentifier _readAppIdentifier]((uint64_t)self);
  appIdentifier = self->_appIdentifier;

  return appIdentifier;
}

- (void)_readAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateApplicationIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppIdentifier_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOLogMsgStateApplicationIdentifier)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateApplicationIdentifier;
  id v3 = [(GEOLogMsgStateApplicationIdentifier *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (void)_readAppMajorVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateApplicationIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppMajorVersion_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAppMajorVersion
{
  return self->_appMajorVersion != 0;
}

- (NSString)appMajorVersion
{
  -[GEOLogMsgStateApplicationIdentifier _readAppMajorVersion]((uint64_t)self);
  appMajorVersion = self->_appMajorVersion;

  return appMajorVersion;
}

- (void)setAppMajorVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_appMajorVersion, a3);
}

- (void)_readAppMinorVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateApplicationIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppMinorVersion_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAppMinorVersion
{
  return self->_appMinorVersion != 0;
}

- (NSString)appMinorVersion
{
  -[GEOLogMsgStateApplicationIdentifier _readAppMinorVersion]((uint64_t)self);
  appMinorVersion = self->_appMinorVersion;

  return appMinorVersion;
}

- (void)setAppMinorVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_appMinorVersion, a3);
}

- (BOOL)appDarkMode
{
  return self->_appDarkMode;
}

- (void)setAppDarkMode:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_appDarkMode = a3;
}

- (void)setHasAppDarkMode:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAppDarkMode
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readProcessName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateApplicationIdentifierReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProcessName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (NSString)processName
{
  -[GEOLogMsgStateApplicationIdentifier _readProcessName]((uint64_t)self);
  processName = self->_processName;

  return processName;
}

- (void)setProcessName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_processName, a3);
}

- (int)appType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_appType;
  }
  else {
    return 0;
  }
}

- (void)setHasAppType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasAppType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)appTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8478[a3];
  }

  return v3;
}

- (int)StringAsAppType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FIRST_PARTY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SECOND_PARTY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"THIRD_PARTY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DAEMONS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"END_SENTINEL"])
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
  v8.super_class = (Class)GEOLogMsgStateApplicationIdentifier;
  int v4 = [(GEOLogMsgStateApplicationIdentifier *)&v8 description];
  v5 = [(GEOLogMsgStateApplicationIdentifier *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateApplicationIdentifier _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 appIdentifier];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"appIdentifier";
      }
      else {
        objc_super v6 = @"app_identifier";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 appMajorVersion];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"appMajorVersion";
      }
      else {
        objc_super v8 = @"app_major_version";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 appMinorVersion];
    if (v9)
    {
      if (a2) {
        v10 = @"appMinorVersion";
      }
      else {
        v10 = @"app_minor_version";
      }
      [v4 setObject:v9 forKey:v10];
    }

    if ((*(unsigned char *)(a1 + 68) & 2) != 0)
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
      if (a2) {
        v12 = @"appDarkMode";
      }
      else {
        v12 = @"app_dark_mode";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 processName];
    if (v13)
    {
      if (a2) {
        v14 = @"processName";
      }
      else {
        v14 = @"process_name";
      }
      [v4 setObject:v13 forKey:v14];
    }

    if (*(unsigned char *)(a1 + 68))
    {
      uint64_t v15 = *(int *)(a1 + 60);
      if (v15 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53F8478[v15];
      }
      if (a2) {
        v17 = @"appType";
      }
      else {
        v17 = @"app_type";
      }
      [v4 setObject:v16 forKey:v17];
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
  return -[GEOLogMsgStateApplicationIdentifier _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateApplicationIdentifier)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateApplicationIdentifier *)-[GEOLogMsgStateApplicationIdentifier _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"appIdentifier";
      }
      else {
        objc_super v6 = @"app_identifier";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setAppIdentifier:v8];
      }
      if (a3) {
        v9 = @"appMajorVersion";
      }
      else {
        v9 = @"app_major_version";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setAppMajorVersion:v11];
      }
      if (a3) {
        v12 = @"appMinorVersion";
      }
      else {
        v12 = @"app_minor_version";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setAppMinorVersion:v14];
      }
      if (a3) {
        uint64_t v15 = @"appDarkMode";
      }
      else {
        uint64_t v15 = @"app_dark_mode";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAppDarkMode:", objc_msgSend(v16, "BOOLValue"));
      }

      if (a3) {
        v17 = @"processName";
      }
      else {
        v17 = @"process_name";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = (void *)[v18 copy];
        [a1 setProcessName:v19];
      }
      if (a3) {
        v20 = @"appType";
      }
      else {
        v20 = @"app_type";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v21;
        if ([v22 isEqualToString:@"FIRST_PARTY"])
        {
          uint64_t v23 = 0;
        }
        else if ([v22 isEqualToString:@"SECOND_PARTY"])
        {
          uint64_t v23 = 1;
        }
        else if ([v22 isEqualToString:@"THIRD_PARTY"])
        {
          uint64_t v23 = 2;
        }
        else if ([v22 isEqualToString:@"DAEMONS"])
        {
          uint64_t v23 = 3;
        }
        else if ([v22 isEqualToString:@"END_SENTINEL"])
        {
          uint64_t v23 = 4;
        }
        else
        {
          uint64_t v23 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_47:

          goto LABEL_48;
        }
        uint64_t v23 = [v21 intValue];
      }
      [a1 setAppType:v23];
      goto LABEL_47;
    }
  }
LABEL_48:

  return a1;
}

- (GEOLogMsgStateApplicationIdentifier)initWithJSON:(id)a3
{
  return (GEOLogMsgStateApplicationIdentifier *)-[GEOLogMsgStateApplicationIdentifier _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateApplicationIdentifierIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateApplicationIdentifierReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgStateApplicationIdentifier *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_appIdentifier) {
    objc_msgSend(v5, "setAppIdentifier:");
  }
  if (self->_appMajorVersion) {
    objc_msgSend(v5, "setAppMajorVersion:");
  }
  int v4 = v5;
  if (self->_appMinorVersion)
  {
    objc_msgSend(v5, "setAppMinorVersion:");
    int v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_appDarkMode;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  if (self->_processName)
  {
    objc_msgSend(v5, "setProcessName:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 15) = self->_appType;
    *((unsigned char *)v4 + 68) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgStateApplicationIdentifierReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateApplicationIdentifier *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_appMajorVersion copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_appMinorVersion copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_appDarkMode;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v15 = [(NSString *)self->_processName copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_appType;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOLogMsgStateApplicationIdentifier *)self readAll:1];
  [v4 readAll:1];
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:")) {
      goto LABEL_23;
    }
  }
  appMajorVersion = self->_appMajorVersion;
  if ((unint64_t)appMajorVersion | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appMajorVersion, "isEqual:")) {
      goto LABEL_23;
    }
  }
  appMinorVersion = self->_appMinorVersion;
  if ((unint64_t)appMinorVersion | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](appMinorVersion, "isEqual:")) {
      goto LABEL_23;
    }
  }
  char flags = (char)self->_flags;
  char v9 = *((unsigned char *)v4 + 68);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0) {
      goto LABEL_23;
    }
    if (self->_appDarkMode)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_23;
  }
  processName = self->_processName;
  if (!((unint64_t)processName | *((void *)v4 + 5))) {
    goto LABEL_19;
  }
  if (!-[NSString isEqual:](processName, "isEqual:"))
  {
LABEL_23:
    BOOL v11 = 0;
    goto LABEL_24;
  }
  char flags = (char)self->_flags;
  char v9 = *((unsigned char *)v4 + 68);
LABEL_19:
  BOOL v11 = (v9 & 1) == 0;
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_appType != *((_DWORD *)v4 + 15)) {
      goto LABEL_23;
    }
    BOOL v11 = 1;
  }
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateApplicationIdentifier *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_appIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_appMajorVersion hash];
  NSUInteger v5 = [(NSString *)self->_appMinorVersion hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_appDarkMode;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_processName hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_appType;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[2])
  {
    -[GEOLogMsgStateApplicationIdentifier setAppIdentifier:](self, "setAppIdentifier:");
    NSUInteger v4 = v5;
  }
  if (v4[3])
  {
    -[GEOLogMsgStateApplicationIdentifier setAppMajorVersion:](self, "setAppMajorVersion:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    -[GEOLogMsgStateApplicationIdentifier setAppMinorVersion:](self, "setAppMinorVersion:");
    NSUInteger v4 = v5;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_appDarkMode = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (v4[5])
  {
    -[GEOLogMsgStateApplicationIdentifier setProcessName:](self, "setProcessName:");
    NSUInteger v4 = v5;
  }
  if (*((unsigned char *)v4 + 68))
  {
    self->_appType = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_appMinorVersion, 0);
  objc_storeStrong((id *)&self->_appMajorVersion, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end