@interface GEOMapItemCorrectedLocationAttributes
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrectedAddress;
- (BOOL)hasCorrectedAddressSecondaryStreetLine;
- (BOOL)hasCorrectedCoordinate;
- (BOOL)hasCustomLabel;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHasSubmittedRAP;
- (BOOL)hasLastUpdateDate;
- (BOOL)hasSubmittedRAP;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddress)correctedAddress;
- (GEOLatLng)correctedCoordinate;
- (GEOMapItemCorrectedLocationAttributes)init;
- (GEOMapItemCorrectedLocationAttributes)initWithData:(id)a3;
- (GEOMapItemCorrectedLocationAttributes)initWithDictionary:(id)a3;
- (GEOMapItemCorrectedLocationAttributes)initWithJSON:(id)a3;
- (NSString)correctedAddressSecondaryStreetLine;
- (NSString)customLabel;
- (PBUnknownFields)unknownFields;
- (double)lastUpdateDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readCorrectedAddress;
- (void)_readCorrectedAddressSecondaryStreetLine;
- (void)_readCorrectedCoordinate;
- (void)_readCustomLabel;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrectedAddress:(id)a3;
- (void)setCorrectedAddressSecondaryStreetLine:(id)a3;
- (void)setCorrectedCoordinate:(id)a3;
- (void)setCustomLabel:(id)a3;
- (void)setHasHasSubmittedRAP:(BOOL)a3;
- (void)setHasLastUpdateDate:(BOOL)a3;
- (void)setHasSubmittedRAP:(BOOL)a3;
- (void)setLastUpdateDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapItemCorrectedLocationAttributes

- (GEOMapItemCorrectedLocationAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemCorrectedLocationAttributes;
  v2 = [(GEOMapItemCorrectedLocationAttributes *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapItemCorrectedLocationAttributes)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemCorrectedLocationAttributes;
  v3 = [(GEOMapItemCorrectedLocationAttributes *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCorrectedCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemCorrectedLocationAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedCoordinate_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCorrectedCoordinate
{
  return self->_correctedCoordinate != 0;
}

- (GEOLatLng)correctedCoordinate
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedCoordinate]((uint64_t)self);
  correctedCoordinate = self->_correctedCoordinate;

  return correctedCoordinate;
}

- (void)setCorrectedCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_correctedCoordinate, a3);
}

- (void)_readCorrectedAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemCorrectedLocationAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCorrectedAddress
{
  return self->_correctedAddress != 0;
}

- (GEOAddress)correctedAddress
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedAddress]((uint64_t)self);
  correctedAddress = self->_correctedAddress;

  return correctedAddress;
}

- (void)setCorrectedAddress:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_correctedAddress, a3);
}

- (void)_readCorrectedAddressSecondaryStreetLine
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemCorrectedLocationAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedAddressSecondaryStreetLine_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCorrectedAddressSecondaryStreetLine
{
  return self->_correctedAddressSecondaryStreetLine != 0;
}

- (NSString)correctedAddressSecondaryStreetLine
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedAddressSecondaryStreetLine]((uint64_t)self);
  correctedAddressSecondaryStreetLine = self->_correctedAddressSecondaryStreetLine;

  return correctedAddressSecondaryStreetLine;
}

- (void)setCorrectedAddressSecondaryStreetLine:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_correctedAddressSecondaryStreetLine, a3);
}

- (void)_readCustomLabel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemCorrectedLocationAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCustomLabel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCustomLabel
{
  return self->_customLabel != 0;
}

- (NSString)customLabel
{
  -[GEOMapItemCorrectedLocationAttributes _readCustomLabel]((uint64_t)self);
  customLabel = self->_customLabel;

  return customLabel;
}

- (void)setCustomLabel:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_customLabel, a3);
}

- (double)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_lastUpdateDate = a3;
}

- (void)setHasLastUpdateDate:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasLastUpdateDate
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasSubmittedRAP
{
  return self->_hasSubmittedRAP;
}

- (void)setHasSubmittedRAP:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_hasSubmittedRAP = a3;
}

- (void)setHasHasSubmittedRAP:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHasSubmittedRAP
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemCorrectedLocationAttributes;
  v4 = [(GEOMapItemCorrectedLocationAttributes *)&v8 description];
  v5 = [(GEOMapItemCorrectedLocationAttributes *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemCorrectedLocationAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 correctedCoordinate];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"correctedCoordinate"];
    }
    objc_super v8 = [(id)a1 correctedAddress];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"correctedAddress"];
    }
    v11 = [(id)a1 correctedAddressSecondaryStreetLine];
    if (v11) {
      [v4 setObject:v11 forKey:@"correctedAddressSecondaryStreetLine"];
    }

    v12 = [(id)a1 customLabel];
    if (v12) {
      [v4 setObject:v12 forKey:@"customLabel"];
    }

    char v13 = *(unsigned char *)(a1 + 80);
    if (v13)
    {
      v14 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
      [v4 setObject:v14 forKey:@"lastUpdateDate"];

      char v13 = *(unsigned char *)(a1 + 80);
    }
    if ((v13 & 2) != 0)
    {
      v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
      [v4 setObject:v15 forKey:@"hasSubmittedRAP"];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __67__GEOMapItemCorrectedLocationAttributes__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOMapItemCorrectedLocationAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __67__GEOMapItemCorrectedLocationAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOMapItemCorrectedLocationAttributes)initWithDictionary:(id)a3
{
  return (GEOMapItemCorrectedLocationAttributes *)-[GEOMapItemCorrectedLocationAttributes _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"correctedCoordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setCorrectedCoordinate:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"correctedAddress"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOAddress alloc];
        if (a3) {
          uint64_t v12 = [(GEOAddress *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOAddress *)v11 initWithDictionary:v10];
        }
        char v13 = (void *)v12;
        [a1 setCorrectedAddress:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"correctedAddressSecondaryStreetLine"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setCorrectedAddressSecondaryStreetLine:v15];
      }
      v16 = [v5 objectForKeyedSubscript:@"customLabel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[v16 copy];
        [a1 setCustomLabel:v17];
      }
      v18 = [v5 objectForKeyedSubscript:@"lastUpdateDate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 doubleValue];
        objc_msgSend(a1, "setLastUpdateDate:");
      }

      v19 = [v5 objectForKeyedSubscript:@"hasSubmittedRAP"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasSubmittedRAP:", objc_msgSend(v19, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOMapItemCorrectedLocationAttributes)initWithJSON:(id)a3
{
  return (GEOMapItemCorrectedLocationAttributes *)-[GEOMapItemCorrectedLocationAttributes _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_932;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_933;
    }
    GEOMapItemCorrectedLocationAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_correctedCoordinate readAll:1];
    [(GEOAddress *)self->_correctedAddress readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemCorrectedLocationAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemCorrectedLocationAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMapItemCorrectedLocationAttributesIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapItemCorrectedLocationAttributes *)self readAll:0];
    if (self->_correctedCoordinate) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (self->_correctedAddress)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_correctedAddressSecondaryStreetLine)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_customLabel)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedCoordinate]((uint64_t)self);
  correctedCoordinate = self->_correctedCoordinate;

  return [(GEOLatLng *)correctedCoordinate hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOMapItemCorrectedLocationAttributes *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_correctedCoordinate) {
    objc_msgSend(v6, "setCorrectedCoordinate:");
  }
  if (self->_correctedAddress) {
    objc_msgSend(v6, "setCorrectedAddress:");
  }
  v4 = v6;
  if (self->_correctedAddressSecondaryStreetLine)
  {
    objc_msgSend(v6, "setCorrectedAddressSecondaryStreetLine:");
    v4 = v6;
  }
  if (self->_customLabel)
  {
    objc_msgSend(v6, "setCustomLabel:");
    v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v4[7] = *(id *)&self->_lastUpdateDate;
    *((unsigned char *)v4 + 80) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v4 + 76) = self->_hasSubmittedRAP;
    *((unsigned char *)v4 + 80) |= 2u;
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapItemCorrectedLocationAttributesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapItemCorrectedLocationAttributes *)self readAll:0];
  id v9 = [(GEOLatLng *)self->_correctedCoordinate copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(GEOAddress *)self->_correctedAddress copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_correctedAddressSecondaryStreetLine copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_customLabel copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 56) = self->_lastUpdateDate;
    *(unsigned char *)(v5 + 80) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 76) = self->_hasSubmittedRAP;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEOMapItemCorrectedLocationAttributes *)self readAll:1];
  [v4 readAll:1];
  correctedCoordinate = self->_correctedCoordinate;
  if ((unint64_t)correctedCoordinate | *((void *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](correctedCoordinate, "isEqual:")) {
      goto LABEL_17;
    }
  }
  correctedAddress = self->_correctedAddress;
  if ((unint64_t)correctedAddress | *((void *)v4 + 4))
  {
    if (!-[GEOAddress isEqual:](correctedAddress, "isEqual:")) {
      goto LABEL_17;
    }
  }
  correctedAddressSecondaryStreetLine = self->_correctedAddressSecondaryStreetLine;
  if ((unint64_t)correctedAddressSecondaryStreetLine | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](correctedAddressSecondaryStreetLine, "isEqual:")) {
      goto LABEL_17;
    }
  }
  customLabel = self->_customLabel;
  if ((unint64_t)customLabel | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](customLabel, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_lastUpdateDate != *((double *)v4 + 7)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_17;
  }
  BOOL v9 = (*((unsigned char *)v4 + 80) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0)
    {
LABEL_17:
      BOOL v9 = 0;
      goto LABEL_18;
    }
    if (self->_hasSubmittedRAP)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_17;
    }
    BOOL v9 = 1;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  [(GEOMapItemCorrectedLocationAttributes *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_correctedCoordinate hash];
  unint64_t v4 = [(GEOAddress *)self->_correctedAddress hash];
  NSUInteger v5 = [(NSString *)self->_correctedAddressSecondaryStreetLine hash];
  NSUInteger v6 = [(NSString *)self->_customLabel hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double lastUpdateDate = self->_lastUpdateDate;
    double v10 = -lastUpdateDate;
    if (lastUpdateDate >= 0.0) {
      double v10 = self->_lastUpdateDate;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ((flags & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_hasSubmittedRAP;
  }
  else {
    uint64_t v13 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  double v10 = a3;
  [v10 readAll:0];
  unint64_t v4 = v10;
  correctedCoordinate = self->_correctedCoordinate;
  uint64_t v6 = v10[5];
  if (correctedCoordinate)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLatLng mergeFrom:](correctedCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOMapItemCorrectedLocationAttributes setCorrectedCoordinate:](self, "setCorrectedCoordinate:");
  }
  unint64_t v4 = v10;
LABEL_7:
  correctedAddress = self->_correctedAddress;
  uint64_t v8 = v4[4];
  if (correctedAddress)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOAddress mergeFrom:](correctedAddress, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOMapItemCorrectedLocationAttributes setCorrectedAddress:](self, "setCorrectedAddress:");
  }
  unint64_t v4 = v10;
LABEL_13:
  if (v4[3])
  {
    -[GEOMapItemCorrectedLocationAttributes setCorrectedAddressSecondaryStreetLine:](self, "setCorrectedAddressSecondaryStreetLine:");
    unint64_t v4 = v10;
  }
  if (v4[6])
  {
    -[GEOMapItemCorrectedLocationAttributes setCustomLabel:](self, "setCustomLabel:");
    unint64_t v4 = v10;
  }
  char v9 = *((unsigned char *)v4 + 80);
  if (v9)
  {
    self->_double lastUpdateDate = (double)v4[7];
    *(unsigned char *)&self->_flags |= 1u;
    char v9 = *((unsigned char *)v4 + 80);
  }
  if ((v9 & 2) != 0)
  {
    self->_hasSubmittedRAP = *((unsigned char *)v4 + 76);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOMapItemCorrectedLocationAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_937);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMapItemCorrectedLocationAttributes *)self readAll:0];
    [(GEOLatLng *)self->_correctedCoordinate clearUnknownFields:1];
    correctedAddress = self->_correctedAddress;
    [(GEOAddress *)correctedAddress clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_correctedCoordinate, 0);
  objc_storeStrong((id *)&self->_correctedAddress, 0);
  objc_storeStrong((id *)&self->_correctedAddressSecondaryStreetLine, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end