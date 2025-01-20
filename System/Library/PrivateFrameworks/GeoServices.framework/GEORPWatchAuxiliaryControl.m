@interface GEORPWatchAuxiliaryControl
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHardwareIdentifier;
- (BOOL)hasOsBuild;
- (BOOL)hasOsVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPWatchAuxiliaryControl)init;
- (GEORPWatchAuxiliaryControl)initWithData:(id)a3;
- (GEORPWatchAuxiliaryControl)initWithDictionary:(id)a3;
- (GEORPWatchAuxiliaryControl)initWithJSON:(id)a3;
- (NSString)hardwareIdentifier;
- (NSString)osBuild;
- (NSString)osVersion;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readHardwareIdentifier;
- (void)_readOsBuild;
- (void)_readOsVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setOsBuild:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPWatchAuxiliaryControl

- (GEORPWatchAuxiliaryControl)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPWatchAuxiliaryControl;
  v2 = [(GEORPWatchAuxiliaryControl *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPWatchAuxiliaryControl)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPWatchAuxiliaryControl;
  v3 = [(GEORPWatchAuxiliaryControl *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readHardwareIdentifier
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
        GEORPWatchAuxiliaryControlReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHardwareIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasHardwareIdentifier
{
  return self->_hardwareIdentifier != 0;
}

- (NSString)hardwareIdentifier
{
  -[GEORPWatchAuxiliaryControl _readHardwareIdentifier]((uint64_t)self);
  hardwareIdentifier = self->_hardwareIdentifier;

  return hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_hardwareIdentifier, a3);
}

- (void)_readOsVersion
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
        GEORPWatchAuxiliaryControlReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOsVersion_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (NSString)osVersion
{
  -[GEORPWatchAuxiliaryControl _readOsVersion]((uint64_t)self);
  osVersion = self->_osVersion;

  return osVersion;
}

- (void)setOsVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (void)_readOsBuild
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
        GEORPWatchAuxiliaryControlReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOsBuild_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOsBuild
{
  return self->_osBuild != 0;
}

- (NSString)osBuild
{
  -[GEORPWatchAuxiliaryControl _readOsBuild]((uint64_t)self);
  osBuild = self->_osBuild;

  return osBuild;
}

- (void)setOsBuild:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_osBuild, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPWatchAuxiliaryControl;
  v4 = [(GEORPWatchAuxiliaryControl *)&v8 description];
  v5 = [(GEORPWatchAuxiliaryControl *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPWatchAuxiliaryControl _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 hardwareIdentifier];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"hardwareIdentifier";
      }
      else {
        objc_super v6 = @"hardware_identifier";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 osVersion];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"osVersion";
      }
      else {
        objc_super v8 = @"os_version";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 osBuild];
    if (v9)
    {
      if (a2) {
        v10 = @"osBuild";
      }
      else {
        v10 = @"os_build";
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
  return -[GEORPWatchAuxiliaryControl _dictionaryRepresentation:](self, 1);
}

- (GEORPWatchAuxiliaryControl)initWithDictionary:(id)a3
{
  return (GEORPWatchAuxiliaryControl *)-[GEORPWatchAuxiliaryControl _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"hardwareIdentifier";
      }
      else {
        objc_super v6 = @"hardware_identifier";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setHardwareIdentifier:v8];
      }
      if (a3) {
        v9 = @"osVersion";
      }
      else {
        v9 = @"os_version";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setOsVersion:v11];
      }
      if (a3) {
        v12 = @"osBuild";
      }
      else {
        v12 = @"os_build";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setOsBuild:v14];
      }
    }
  }

  return a1;
}

- (GEORPWatchAuxiliaryControl)initWithJSON:(id)a3
{
  return (GEORPWatchAuxiliaryControl *)-[GEORPWatchAuxiliaryControl _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3522;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3523;
    }
    GEORPWatchAuxiliaryControlReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPWatchAuxiliaryControlIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPWatchAuxiliaryControlReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEORPWatchAuxiliaryControl *)self readAll:0];
    if (self->_hardwareIdentifier) {
      PBDataWriterWriteStringField();
    }
    if (self->_osVersion) {
      PBDataWriterWriteStringField();
    }
    if (self->_osBuild) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPWatchAuxiliaryControl *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_hardwareIdentifier) {
    objc_msgSend(v5, "setHardwareIdentifier:");
  }
  if (self->_osVersion) {
    objc_msgSend(v5, "setOsVersion:");
  }
  v4 = v5;
  if (self->_osBuild)
  {
    objc_msgSend(v5, "setOsBuild:");
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
    [(GEORPWatchAuxiliaryControl *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_hardwareIdentifier copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_osVersion copyWithZone:a3];
    v11 = (void *)v5[4];
    v5[4] = v10;

    uint64_t v12 = [(NSString *)self->_osBuild copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPWatchAuxiliaryControlReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPWatchAuxiliaryControl *)self readAll:1],
         [v4 readAll:1],
         hardwareIdentifier = self->_hardwareIdentifier,
         !((unint64_t)hardwareIdentifier | v4[2]))
     || -[NSString isEqual:](hardwareIdentifier, "isEqual:"))
    && ((osVersion = self->_osVersion, !((unint64_t)osVersion | v4[4]))
     || -[NSString isEqual:](osVersion, "isEqual:")))
  {
    osBuild = self->_osBuild;
    if ((unint64_t)osBuild | v4[3]) {
      char v8 = -[NSString isEqual:](osBuild, "isEqual:");
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
  [(GEORPWatchAuxiliaryControl *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_hardwareIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_osVersion hash] ^ v3;
  return v4 ^ [(NSString *)self->_osBuild hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEORPWatchAuxiliaryControl setHardwareIdentifier:](self, "setHardwareIdentifier:");
  }
  if (v4[4]) {
    -[GEORPWatchAuxiliaryControl setOsVersion:](self, "setOsVersion:");
  }
  if (v4[3]) {
    -[GEORPWatchAuxiliaryControl setOsBuild:](self, "setOsBuild:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end