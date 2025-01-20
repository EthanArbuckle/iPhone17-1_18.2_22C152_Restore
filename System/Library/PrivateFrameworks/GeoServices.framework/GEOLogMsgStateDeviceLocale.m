@interface GEOLogMsgStateDeviceLocale
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDeviceInputLocale;
- (BOOL)hasDeviceOutputLocale;
- (BOOL)hasDeviceSettingsLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateDeviceLocale)init;
- (GEOLogMsgStateDeviceLocale)initWithData:(id)a3;
- (GEOLogMsgStateDeviceLocale)initWithDictionary:(id)a3;
- (GEOLogMsgStateDeviceLocale)initWithJSON:(id)a3;
- (NSString)deviceInputLocale;
- (NSString)deviceOutputLocale;
- (NSString)deviceSettingsLocale;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDeviceInputLocale;
- (void)_readDeviceOutputLocale;
- (void)_readDeviceSettingsLocale;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDeviceInputLocale:(id)a3;
- (void)setDeviceOutputLocale:(id)a3;
- (void)setDeviceSettingsLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateDeviceLocale

- (void)setDeviceSettingsLocale:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_deviceSettingsLocale, a3);
}

- (void)setDeviceOutputLocale:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_deviceOutputLocale, a3);
}

- (void)setDeviceInputLocale:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_deviceInputLocale, a3);
}

- (GEOLogMsgStateDeviceLocale)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateDeviceLocale;
  v2 = [(GEOLogMsgStateDeviceLocale *)&v6 init];
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
  objc_storeStrong((id *)&self->_deviceSettingsLocale, 0);
  objc_storeStrong((id *)&self->_deviceOutputLocale, 0);
  objc_storeStrong((id *)&self->_deviceInputLocale, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
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
    [(GEOLogMsgStateDeviceLocale *)self readAll:0];
    if (self->_deviceSettingsLocale) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceInputLocale) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceOutputLocale) {
      PBDataWriterWriteStringField();
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
      v8 = (int *)&readAll__recursiveTag_7129;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_7130;
    }
    GEOLogMsgStateDeviceLocaleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOLogMsgStateDeviceLocale)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateDeviceLocale;
  BOOL v3 = [(GEOLogMsgStateDeviceLocale *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDeviceSettingsLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceLocaleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSettingsLocale_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDeviceSettingsLocale
{
  return self->_deviceSettingsLocale != 0;
}

- (NSString)deviceSettingsLocale
{
  -[GEOLogMsgStateDeviceLocale _readDeviceSettingsLocale]((uint64_t)self);
  deviceSettingsLocale = self->_deviceSettingsLocale;

  return deviceSettingsLocale;
}

- (void)_readDeviceInputLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceLocaleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceInputLocale_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDeviceInputLocale
{
  return self->_deviceInputLocale != 0;
}

- (NSString)deviceInputLocale
{
  -[GEOLogMsgStateDeviceLocale _readDeviceInputLocale]((uint64_t)self);
  deviceInputLocale = self->_deviceInputLocale;

  return deviceInputLocale;
}

- (void)_readDeviceOutputLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceLocaleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceOutputLocale_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDeviceOutputLocale
{
  return self->_deviceOutputLocale != 0;
}

- (NSString)deviceOutputLocale
{
  -[GEOLogMsgStateDeviceLocale _readDeviceOutputLocale]((uint64_t)self);
  deviceOutputLocale = self->_deviceOutputLocale;

  return deviceOutputLocale;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateDeviceLocale;
  v4 = [(GEOLogMsgStateDeviceLocale *)&v8 description];
  v5 = [(GEOLogMsgStateDeviceLocale *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDeviceLocale _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 deviceSettingsLocale];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"deviceSettingsLocale";
      }
      else {
        objc_super v6 = @"device_settings_locale";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 deviceInputLocale];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"deviceInputLocale";
      }
      else {
        objc_super v8 = @"device_input_locale";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 deviceOutputLocale];
    if (v9)
    {
      if (a2) {
        v10 = @"deviceOutputLocale";
      }
      else {
        v10 = @"device_output_locale";
      }
      [v4 setObject:v9 forKey:v10];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateDeviceLocale _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateDeviceLocale)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDeviceLocale *)-[GEOLogMsgStateDeviceLocale _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"deviceSettingsLocale";
      }
      else {
        objc_super v6 = @"device_settings_locale";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setDeviceSettingsLocale:v8];
      }
      if (a3) {
        v9 = @"deviceInputLocale";
      }
      else {
        v9 = @"device_input_locale";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setDeviceInputLocale:v11];
      }
      if (a3) {
        v12 = @"deviceOutputLocale";
      }
      else {
        v12 = @"device_output_locale";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setDeviceOutputLocale:v14];
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateDeviceLocale)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDeviceLocale *)-[GEOLogMsgStateDeviceLocale _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDeviceLocaleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDeviceLocaleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgStateDeviceLocale *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_deviceSettingsLocale) {
    objc_msgSend(v5, "setDeviceSettingsLocale:");
  }
  if (self->_deviceInputLocale) {
    objc_msgSend(v5, "setDeviceInputLocale:");
  }
  v4 = v5;
  if (self->_deviceOutputLocale)
  {
    objc_msgSend(v5, "setDeviceOutputLocale:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateDeviceLocale *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_deviceSettingsLocale copyWithZone:a3];
    v9 = (void *)v5[4];
    v5[4] = v8;

    uint64_t v10 = [(NSString *)self->_deviceInputLocale copyWithZone:a3];
    v11 = (void *)v5[2];
    v5[2] = v10;

    uint64_t v12 = [(NSString *)self->_deviceOutputLocale copyWithZone:a3];
    objc_super v7 = (PBDataReader *)v5[3];
    v5[3] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStateDeviceLocaleReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLogMsgStateDeviceLocale *)self readAll:1],
         [v4 readAll:1],
         deviceSettingsLocale = self->_deviceSettingsLocale,
         !((unint64_t)deviceSettingsLocale | v4[4]))
     || -[NSString isEqual:](deviceSettingsLocale, "isEqual:"))
    && ((deviceInputLocale = self->_deviceInputLocale, !((unint64_t)deviceInputLocale | v4[2]))
     || -[NSString isEqual:](deviceInputLocale, "isEqual:")))
  {
    deviceOutputLocale = self->_deviceOutputLocale;
    if ((unint64_t)deviceOutputLocale | v4[3]) {
      char v8 = -[NSString isEqual:](deviceOutputLocale, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateDeviceLocale *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_deviceSettingsLocale hash];
  NSUInteger v4 = [(NSString *)self->_deviceInputLocale hash] ^ v3;
  return v4 ^ [(NSString *)self->_deviceOutputLocale hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[4]) {
    -[GEOLogMsgStateDeviceLocale setDeviceSettingsLocale:](self, "setDeviceSettingsLocale:");
  }
  if (v4[2]) {
    -[GEOLogMsgStateDeviceLocale setDeviceInputLocale:](self, "setDeviceInputLocale:");
  }
  if (v4[3]) {
    -[GEOLogMsgStateDeviceLocale setDeviceOutputLocale:](self, "setDeviceOutputLocale:");
  }
}

@end