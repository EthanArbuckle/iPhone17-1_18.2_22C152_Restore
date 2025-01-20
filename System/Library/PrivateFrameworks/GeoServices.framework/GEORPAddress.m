@interface GEORPAddress
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressObject;
- (BOOL)hasAddressString;
- (BOOL)hasGeoAddress;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddress)geoAddress;
- (GEOPDAddressObject)addressObject;
- (GEORPAddress)init;
- (GEORPAddress)initWithData:(id)a3;
- (GEORPAddress)initWithDictionary:(id)a3;
- (GEORPAddress)initWithJSON:(id)a3;
- (NSString)addressString;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddressObject;
- (void)_readAddressString;
- (void)_readGeoAddress;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressObject:(id)a3;
- (void)setAddressString:(id)a3;
- (void)setGeoAddress:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPAddress

- (GEORPAddress)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPAddress;
  v2 = [(GEORPAddress *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAddress)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPAddress;
  v3 = [(GEORPAddress *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readGeoAddress
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
        GEORPAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasGeoAddress
{
  return self->_geoAddress != 0;
}

- (GEOAddress)geoAddress
{
  -[GEORPAddress _readGeoAddress]((uint64_t)self);
  geoAddress = self->_geoAddress;

  return geoAddress;
}

- (void)setGeoAddress:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_geoAddress, a3);
}

- (void)_readAddressString
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
        GEORPAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressString
{
  return self->_addressString != 0;
}

- (NSString)addressString
{
  -[GEORPAddress _readAddressString]((uint64_t)self);
  addressString = self->_addressString;

  return addressString;
}

- (void)setAddressString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_addressString, a3);
}

- (void)_readAddressObject
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
        GEORPAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressObject_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressObject
{
  return self->_addressObject != 0;
}

- (GEOPDAddressObject)addressObject
{
  -[GEORPAddress _readAddressObject]((uint64_t)self);
  addressObject = self->_addressObject;

  return addressObject;
}

- (void)setAddressObject:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_addressObject, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPAddress;
  v4 = [(GEORPAddress *)&v8 description];
  v5 = [(GEORPAddress *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAddress _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 geoAddress];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"geoAddress";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"geo_address";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 addressString];
    if (v9)
    {
      if (a2) {
        v10 = @"addressString";
      }
      else {
        v10 = @"address_string";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [a1 addressObject];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"addressObject";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"address_object";
      }
      [v4 setObject:v13 forKey:v14];
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
  return -[GEORPAddress _dictionaryRepresentation:](self, 1);
}

- (GEORPAddress)initWithDictionary:(id)a3
{
  return (GEORPAddress *)-[GEORPAddress _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"geoAddress";
      }
      else {
        objc_super v6 = @"geo_address";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOAddress alloc];
        if (a3) {
          uint64_t v9 = [(GEOAddress *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOAddress *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setGeoAddress:v9];
      }
      if (a3) {
        v11 = @"addressString";
      }
      else {
        v11 = @"address_string";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setAddressString:v13];
      }
      if (a3) {
        v14 = @"addressObject";
      }
      else {
        v14 = @"address_object";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOPDAddressObject alloc];
        if (v16) {
          v17 = -[GEOPDAddressObject _initWithDictionary:isJSON:](v16, v15, a3);
        }
        else {
          v17 = 0;
        }
        [a1 setAddressObject:v17];
      }
    }
  }

  return a1;
}

- (GEORPAddress)initWithJSON:(id)a3
{
  return (GEORPAddress *)-[GEORPAddress _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_51;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_51;
    }
    GEORPAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOAddress *)self->_geoAddress readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPAddressIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPAddress *)self readAll:0];
    if (self->_geoAddress) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressString) {
      PBDataWriterWriteStringField();
    }
    if (self->_addressObject) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPAddress *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_geoAddress) {
    objc_msgSend(v5, "setGeoAddress:");
  }
  if (self->_addressString) {
    objc_msgSend(v5, "setAddressString:");
  }
  v4 = v5;
  if (self->_addressObject)
  {
    objc_msgSend(v5, "setAddressObject:");
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
    [(GEORPAddress *)self readAll:0];
    id v8 = [(GEOAddress *)self->_geoAddress copyWithZone:a3];
    uint64_t v9 = (void *)v5[4];
    v5[4] = v8;

    uint64_t v10 = [(NSString *)self->_addressString copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    id v12 = [(GEOPDAddressObject *)self->_addressObject copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPAddressReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPAddress *)self readAll:1],
         [v4 readAll:1],
         geoAddress = self->_geoAddress,
         !((unint64_t)geoAddress | v4[4]))
     || -[GEOAddress isEqual:](geoAddress, "isEqual:"))
    && ((addressString = self->_addressString, !((unint64_t)addressString | v4[3]))
     || -[NSString isEqual:](addressString, "isEqual:")))
  {
    addressObject = self->_addressObject;
    if ((unint64_t)addressObject | v4[2]) {
      char v8 = -[GEOPDAddressObject isEqual:](addressObject, "isEqual:");
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
  [(GEORPAddress *)self readAll:1];
  unint64_t v3 = [(GEOAddress *)self->_geoAddress hash];
  NSUInteger v4 = [(NSString *)self->_addressString hash] ^ v3;
  return v4 ^ [(GEOPDAddressObject *)self->_addressObject hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v9 = a3;
  [v9 readAll:0];
  geoAddress = self->_geoAddress;
  uint64_t v5 = v9[4];
  if (geoAddress)
  {
    if (v5) {
      -[GEOAddress mergeFrom:](geoAddress, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPAddress setGeoAddress:](self, "setGeoAddress:");
  }
  if (v9[3]) {
    -[GEORPAddress setAddressString:](self, "setAddressString:");
  }
  addressObject = self->_addressObject;
  uint64_t v7 = v9[2];
  if (addressObject)
  {
    if (v7)
    {
      char v8 = *(void **)(v7 + 16);
      if (v8) {
        -[GEOPDAddressObject setAddressObject:]((uint64_t)addressObject, v8);
      }
    }
  }
  else if (v7)
  {
    -[GEORPAddress setAddressObject:](self, "setAddressObject:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoAddress, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_addressObject, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end