@interface GEOBusinessResolutionRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDeviceLocation;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasShortBusinessName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOBusinessResolutionRequest)init;
- (GEOBusinessResolutionRequest)initWithData:(id)a3;
- (GEOBusinessResolutionRequest)initWithDictionary:(id)a3;
- (GEOBusinessResolutionRequest)initWithJSON:(id)a3;
- (GEOLocation)deviceLocation;
- (NSString)shortBusinessName;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readDeviceLocation;
- (void)_readShortBusinessName;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDeviceLocation:(id)a3;
- (void)setShortBusinessName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOBusinessResolutionRequest

- (void)_readDeviceLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessResolutionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (GEOBusinessResolutionRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOBusinessResolutionRequest;
  v2 = [(GEOBusinessResolutionRequest *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBusinessResolutionRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOBusinessResolutionRequest;
  id v3 = [(GEOBusinessResolutionRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readShortBusinessName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessResolutionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShortBusinessName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasShortBusinessName
{
  return self->_shortBusinessName != 0;
}

- (NSString)shortBusinessName
{
  -[GEOBusinessResolutionRequest _readShortBusinessName]((uint64_t)self);
  shortBusinessName = self->_shortBusinessName;

  return shortBusinessName;
}

- (void)setShortBusinessName:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_shortBusinessName, a3);
}

- (BOOL)hasDeviceLocation
{
  return self->_deviceLocation != 0;
}

- (GEOLocation)deviceLocation
{
  -[GEOBusinessResolutionRequest _readDeviceLocation]((uint64_t)self);
  deviceLocation = self->_deviceLocation;

  return deviceLocation;
}

- (void)setDeviceLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_deviceLocation, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBusinessResolutionRequest;
  v4 = [(GEOBusinessResolutionRequest *)&v8 description];
  v5 = [(GEOBusinessResolutionRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBusinessResolutionRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 shortBusinessName];
    if (v5) {
      [v4 setObject:v5 forKey:@"shortBusinessName"];
    }

    objc_super v6 = [a1 deviceLocation];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"deviceLocation"];
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
  return -[GEOBusinessResolutionRequest _dictionaryRepresentation:](self, 1);
}

- (GEOBusinessResolutionRequest)initWithDictionary:(id)a3
{
  return (GEOBusinessResolutionRequest *)-[GEOBusinessResolutionRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"shortBusinessName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setShortBusinessName:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"deviceLocation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOLocation alloc];
        if (a3) {
          uint64_t v10 = [(GEOLocation *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOLocation *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [a1 setDeviceLocation:v10];
      }
    }
  }

  return a1;
}

- (GEOBusinessResolutionRequest)initWithJSON:(id)a3
{
  return (GEOBusinessResolutionRequest *)-[GEOBusinessResolutionRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_44;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_44;
    }
    GEOBusinessResolutionRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLocation *)self->_deviceLocation readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  objc_super v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    objc_super v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        unint64_t v12 = *(void *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        if (v16 != 2 || !PBReaderPlaceMark() || !GEOLocationIsValid((char *)a3)) {
          goto LABEL_29;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1 && v16 != 2 || (PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_29:
        PBReaderRecallMark();
        return 0;
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v18 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v18;
}

- (BOOL)readFrom:(id)a3
{
  return GEOBusinessResolutionRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 6) == 0
      && ((*(unsigned char *)&self->_flags & 1) == 0 || !GEOLocationIsDirty((os_unfair_lock_s *)self->_deviceLocation)))
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_10;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOBusinessResolutionRequest *)self readAll:0];
  if (self->_shortBusinessName) {
    PBDataWriterWriteStringField();
  }
  id v5 = v8;
  if (self->_deviceLocation)
  {
    PBDataWriterWriteSubmessage();
LABEL_10:
    id v5 = v8;
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  if ([(GEOBusinessResolutionRequest *)self hasDeviceLocation]
    && ([(GEOBusinessResolutionRequest *)self deviceLocation],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int HasSensitiveFields = GEOLocationHasSensitiveFields((uint64_t)v5),
        v5,
        HasSensitiveFields))
  {
    objc_super v7 = [(GEOBusinessResolutionRequest *)self deviceLocation];
    id v8 = (_DWORD *)[v7 copy];

    GEOLocationClearSensitiveFields(v8);
    [(GEOBusinessResolutionRequest *)self setDeviceLocation:v8];
  }
  else
  {
    id v8 = [(GEOBusinessResolutionRequest *)self deviceLocation];
    [v8 clearSensitiveFields:a3];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOBusinessResolutionRequest _readDeviceLocation]((uint64_t)self);
  deviceLocation = self->_deviceLocation;

  return [(GEOLocation *)deviceLocation hasGreenTeaWithValue:v3];
}

- (unsigned)requestTypeCode
{
  return 58;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOBusinessResolutionRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_shortBusinessName) {
    objc_msgSend(v4, "setShortBusinessName:");
  }
  if (self->_deviceLocation) {
    objc_msgSend(v4, "setDeviceLocation:");
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
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOBusinessResolutionRequest *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_shortBusinessName copyWithZone:a3];
    unsigned int v9 = (void *)v5[3];
    v5[3] = v8;

    id v10 = [(GEOLocation *)self->_deviceLocation copyWithZone:a3];
    objc_super v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOBusinessResolutionRequestReadAllFrom((uint64_t)v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOBusinessResolutionRequest *)self readAll:1],
         [v4 readAll:1],
         shortBusinessName = self->_shortBusinessName,
         !((unint64_t)shortBusinessName | v4[3]))
     || -[NSString isEqual:](shortBusinessName, "isEqual:")))
  {
    deviceLocation = self->_deviceLocation;
    if ((unint64_t)deviceLocation | v4[2]) {
      char v7 = -[GEOLocation isEqual:](deviceLocation, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOBusinessResolutionRequest *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_shortBusinessName hash];
  return [(GEOLocation *)self->_deviceLocation hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  objc_super v6 = a3;
  [v6 readAll:0];
  if (v6[3]) {
    -[GEOBusinessResolutionRequest setShortBusinessName:](self, "setShortBusinessName:");
  }
  deviceLocation = self->_deviceLocation;
  uint64_t v5 = v6[2];
  if (deviceLocation)
  {
    if (v5) {
      -[GEOLocation mergeFrom:](deviceLocation, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOBusinessResolutionRequest setDeviceLocation:](self, "setDeviceLocation:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortBusinessName, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end