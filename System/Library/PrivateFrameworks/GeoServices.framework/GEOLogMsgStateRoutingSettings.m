@interface GEOLogMsgStateRoutingSettings
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCyclingPrefs;
- (BOOL)hasDrivingPrefs;
- (BOOL)hasVirtualGarageSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateRoutingSettings)init;
- (GEOLogMsgStateRoutingSettings)initWithData:(id)a3;
- (GEOLogMsgStateRoutingSettings)initWithDictionary:(id)a3;
- (GEOLogMsgStateRoutingSettings)initWithJSON:(id)a3;
- (GEORoutingSettingsCyclingPrefs)cyclingPrefs;
- (GEORoutingSettingsDrivingPrefs)drivingPrefs;
- (GEORoutingSettingsVirtualGarageSetttings)virtualGarageSettings;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCyclingPrefs;
- (void)_readDrivingPrefs;
- (void)_readVirtualGarageSettings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCyclingPrefs:(id)a3;
- (void)setDrivingPrefs:(id)a3;
- (void)setVirtualGarageSettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateRoutingSettings

- (GEOLogMsgStateRoutingSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateRoutingSettings;
  v2 = [(GEOLogMsgStateRoutingSettings *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateRoutingSettings)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateRoutingSettings;
  v3 = [(GEOLogMsgStateRoutingSettings *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVirtualGarageSettings
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
        GEOLogMsgStateRoutingSettingsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVirtualGarageSettings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasVirtualGarageSettings
{
  return self->_virtualGarageSettings != 0;
}

- (GEORoutingSettingsVirtualGarageSetttings)virtualGarageSettings
{
  -[GEOLogMsgStateRoutingSettings _readVirtualGarageSettings]((uint64_t)self);
  virtualGarageSettings = self->_virtualGarageSettings;

  return virtualGarageSettings;
}

- (void)setVirtualGarageSettings:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_virtualGarageSettings, a3);
}

- (void)_readCyclingPrefs
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
        GEOLogMsgStateRoutingSettingsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingPrefs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCyclingPrefs
{
  return self->_cyclingPrefs != 0;
}

- (GEORoutingSettingsCyclingPrefs)cyclingPrefs
{
  -[GEOLogMsgStateRoutingSettings _readCyclingPrefs]((uint64_t)self);
  cyclingPrefs = self->_cyclingPrefs;

  return cyclingPrefs;
}

- (void)setCyclingPrefs:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_cyclingPrefs, a3);
}

- (void)_readDrivingPrefs
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
        GEOLogMsgStateRoutingSettingsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDrivingPrefs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDrivingPrefs
{
  return self->_drivingPrefs != 0;
}

- (GEORoutingSettingsDrivingPrefs)drivingPrefs
{
  -[GEOLogMsgStateRoutingSettings _readDrivingPrefs]((uint64_t)self);
  drivingPrefs = self->_drivingPrefs;

  return drivingPrefs;
}

- (void)setDrivingPrefs:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_drivingPrefs, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateRoutingSettings;
  v4 = [(GEOLogMsgStateRoutingSettings *)&v8 description];
  v5 = [(GEOLogMsgStateRoutingSettings *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateRoutingSettings _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 virtualGarageSettings];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"virtualGarageSettings";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"virtual_garage_settings";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 cyclingPrefs];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"cyclingPrefs";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"cycling_prefs";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 drivingPrefs];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"drivingPrefs";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"driving_prefs";
      }
      [v4 setObject:v15 forKey:v16];
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
  return -[GEOLogMsgStateRoutingSettings _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateRoutingSettings)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateRoutingSettings *)-[GEOLogMsgStateRoutingSettings _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"virtualGarageSettings";
      }
      else {
        objc_super v6 = @"virtual_garage_settings";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORoutingSettingsVirtualGarageSetttings alloc];
        if (a3) {
          uint64_t v9 = [(GEORoutingSettingsVirtualGarageSetttings *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORoutingSettingsVirtualGarageSetttings *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setVirtualGarageSettings:v9];
      }
      if (a3) {
        v11 = @"cyclingPrefs";
      }
      else {
        v11 = @"cycling_prefs";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEORoutingSettingsCyclingPrefs alloc];
        if (a3) {
          uint64_t v14 = [(GEORoutingSettingsCyclingPrefs *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORoutingSettingsCyclingPrefs *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setCyclingPrefs:v14];
      }
      if (a3) {
        v16 = @"drivingPrefs";
      }
      else {
        v16 = @"driving_prefs";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEORoutingSettingsDrivingPrefs alloc];
        if (a3) {
          uint64_t v19 = [(GEORoutingSettingsDrivingPrefs *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEORoutingSettingsDrivingPrefs *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setDrivingPrefs:v19];
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateRoutingSettings)initWithJSON:(id)a3
{
  return (GEOLogMsgStateRoutingSettings *)-[GEOLogMsgStateRoutingSettings _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_9233;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_9234;
    }
    GEOLogMsgStateRoutingSettingsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORoutingSettingsVirtualGarageSetttings *)self->_virtualGarageSettings readAll:1];
    [(GEORoutingSettingsCyclingPrefs *)self->_cyclingPrefs readAll:1];
    [(GEORoutingSettingsDrivingPrefs *)self->_drivingPrefs readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateRoutingSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateRoutingSettingsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
  {
    id v5 = self->_reader;
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
    [(GEOLogMsgStateRoutingSettings *)self readAll:0];
    if (self->_virtualGarageSettings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_cyclingPrefs) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_drivingPrefs) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgStateRoutingSettings *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_virtualGarageSettings) {
    objc_msgSend(v5, "setVirtualGarageSettings:");
  }
  if (self->_cyclingPrefs) {
    objc_msgSend(v5, "setCyclingPrefs:");
  }
  v4 = v5;
  if (self->_drivingPrefs)
  {
    objc_msgSend(v5, "setDrivingPrefs:");
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
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateRoutingSettings *)self readAll:0];
    id v8 = [(GEORoutingSettingsVirtualGarageSetttings *)self->_virtualGarageSettings copyWithZone:a3];
    uint64_t v9 = (void *)v5[4];
    v5[4] = v8;

    id v10 = [(GEORoutingSettingsCyclingPrefs *)self->_cyclingPrefs copyWithZone:a3];
    v11 = (void *)v5[2];
    v5[2] = v10;

    id v12 = [(GEORoutingSettingsDrivingPrefs *)self->_drivingPrefs copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStateRoutingSettingsReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLogMsgStateRoutingSettings *)self readAll:1],
         [v4 readAll:1],
         virtualGarageSettings = self->_virtualGarageSettings,
         !((unint64_t)virtualGarageSettings | v4[4]))
     || -[GEORoutingSettingsVirtualGarageSetttings isEqual:](virtualGarageSettings, "isEqual:"))
    && ((cyclingPrefs = self->_cyclingPrefs, !((unint64_t)cyclingPrefs | v4[2]))
     || -[GEORoutingSettingsCyclingPrefs isEqual:](cyclingPrefs, "isEqual:")))
  {
    drivingPrefs = self->_drivingPrefs;
    if ((unint64_t)drivingPrefs | v4[3]) {
      char v8 = -[GEORoutingSettingsDrivingPrefs isEqual:](drivingPrefs, "isEqual:");
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
  [(GEOLogMsgStateRoutingSettings *)self readAll:1];
  unint64_t v3 = [(GEORoutingSettingsVirtualGarageSetttings *)self->_virtualGarageSettings hash];
  unint64_t v4 = [(GEORoutingSettingsCyclingPrefs *)self->_cyclingPrefs hash] ^ v3;
  return v4 ^ [(GEORoutingSettingsDrivingPrefs *)self->_drivingPrefs hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  virtualGarageSettings = self->_virtualGarageSettings;
  uint64_t v5 = v10[4];
  if (virtualGarageSettings)
  {
    if (v5) {
      -[GEORoutingSettingsVirtualGarageSetttings mergeFrom:](virtualGarageSettings, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLogMsgStateRoutingSettings setVirtualGarageSettings:](self, "setVirtualGarageSettings:");
  }
  cyclingPrefs = self->_cyclingPrefs;
  uint64_t v7 = v10[2];
  if (cyclingPrefs)
  {
    if (v7) {
      -[GEORoutingSettingsCyclingPrefs mergeFrom:](cyclingPrefs, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOLogMsgStateRoutingSettings setCyclingPrefs:](self, "setCyclingPrefs:");
  }
  drivingPrefs = self->_drivingPrefs;
  uint64_t v9 = v10[3];
  if (drivingPrefs)
  {
    if (v9) {
      -[GEORoutingSettingsDrivingPrefs mergeFrom:](drivingPrefs, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOLogMsgStateRoutingSettings setDrivingPrefs:](self, "setDrivingPrefs:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualGarageSettings, 0);
  objc_storeStrong((id *)&self->_drivingPrefs, 0);
  objc_storeStrong((id *)&self->_cyclingPrefs, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end