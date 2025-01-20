@interface GEORPAddressFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddress;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPersonalizedMaps;
- (BOOL)hasPlace;
- (BOOL)hasPlaceRequest;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlace)place;
- (GEOPDPlaceRequest)placeRequest;
- (GEORPAddressCorrections)address;
- (GEORPAddressFeedback)init;
- (GEORPAddressFeedback)initWithData:(id)a3;
- (GEORPAddressFeedback)initWithDictionary:(id)a3;
- (GEORPAddressFeedback)initWithJSON:(id)a3;
- (GEORPPersonalizedMapsContext)personalizedMaps;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddress;
- (void)_readPersonalizedMaps;
- (void)_readPlace;
- (void)_readPlaceRequest;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPersonalizedMaps:(id)a3;
- (void)setPlace:(id)a3;
- (void)setPlaceRequest:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPAddressFeedback

- (GEORPAddressFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPAddressFeedback;
  v2 = [(GEORPAddressFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAddressFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPAddressFeedback;
  v3 = [(GEORPAddressFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAddressFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (GEORPAddressCorrections)address
{
  -[GEORPAddressFeedback _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)setAddress:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAddressFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPAddressFeedback _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DB8B8[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ADDRESS_CORRECTION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ADDRESS_CORRECTION_TYPE_ADD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADDRESS_CORRECTION_TYPE_EDIT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPersonalizedMaps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAddressFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPersonalizedMaps_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPersonalizedMaps
{
  return self->_personalizedMaps != 0;
}

- (GEORPPersonalizedMapsContext)personalizedMaps
{
  -[GEORPAddressFeedback _readPersonalizedMaps]((uint64_t)self);
  personalizedMaps = self->_personalizedMaps;

  return personalizedMaps;
}

- (void)setPersonalizedMaps:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_personalizedMaps, a3);
}

- (void)_readPlaceRequest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAddressFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequest_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceRequest
{
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPAddressFeedback _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPAddressFeedback;
  int v4 = [(GEORPAddressFeedback *)&v8 description];
  v5 = [(GEORPAddressFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAddressFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 address];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"address"];
    }
    objc_super v8 = [(id)a1 place];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"place"];
    }
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v11 = *(int *)(a1 + 68);
      if (v11 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E53DB8B8[v11];
      }
      [v4 setObject:v12 forKey:@"type"];
    }
    v13 = [(id)a1 personalizedMaps];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"personalizedMaps";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"personalized_maps";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [(id)a1 placeRequest];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"placeRequest";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"place_request";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __50__GEORPAddressFeedback__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEORPAddressFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEORPAddressFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPAddressFeedback)initWithDictionary:(id)a3
{
  return (GEORPAddressFeedback *)-[GEORPAddressFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_42;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_42;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"address"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [GEORPAddressCorrections alloc];
    if (a3) {
      uint64_t v8 = [(GEORPAddressCorrections *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEORPAddressCorrections *)v7 initWithDictionary:v6];
    }
    v9 = (void *)v8;
    [a1 setAddress:v8];
  }
  id v10 = [v5 objectForKeyedSubscript:@"place"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [GEOPDPlace alloc];
    if (a3) {
      uint64_t v12 = [(GEOPDPlace *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEOPDPlace *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setPlace:v12];
  }
  v14 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"ADDRESS_CORRECTION_TYPE_UNKNOWN"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"ADDRESS_CORRECTION_TYPE_ADD"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"ADDRESS_CORRECTION_TYPE_EDIT"])
    {
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v16 = 0;
    }

    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_24:
    [a1 setType:v16];
  }

  if (a3) {
    v17 = @"personalizedMaps";
  }
  else {
    v17 = @"personalized_maps";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEORPPersonalizedMapsContext alloc];
    if (a3) {
      uint64_t v20 = [(GEORPPersonalizedMapsContext *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEORPPersonalizedMapsContext *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setPersonalizedMaps:v20];
  }
  if (a3) {
    v22 = @"placeRequest";
  }
  else {
    v22 = @"place_request";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [GEOPDPlaceRequest alloc];
    if (a3) {
      uint64_t v25 = [(GEOPDPlaceRequest *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOPDPlaceRequest *)v24 initWithDictionary:v23];
    }
    id v26 = (void *)v25;
    [a1 setPlaceRequest:v25];
  }
LABEL_42:

  return a1;
}

- (GEORPAddressFeedback)initWithJSON:(id)a3
{
  return (GEORPAddressFeedback *)-[GEORPAddressFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_232;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_233;
    }
    GEORPAddressFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPAddressFeedbackCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAddressFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAddressFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPAddressFeedbackIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPAddressFeedback *)self readAll:0];
    if (self->_address) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_place)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_personalizedMaps)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeRequest)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPAddressFeedback _readAddress]((uint64_t)self);
  if ([(GEORPAddressCorrections *)self->_address hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPAddressFeedback _readPlace]((uint64_t)self);
  if ([(GEOPDPlace *)self->_place hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPAddressFeedback _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return [(GEOPDPlaceRequest *)placeRequest hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPAddressFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_address) {
    objc_msgSend(v5, "setAddress:");
  }
  if (self->_place) {
    objc_msgSend(v5, "setPlace:");
  }
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 17) = self->_type;
    *((unsigned char *)v5 + 72) |= 1u;
  }
  if (self->_personalizedMaps)
  {
    objc_msgSend(v5, "setPersonalizedMaps:");
    int v4 = v5;
  }
  if (self->_placeRequest)
  {
    objc_msgSend(v5, "setPlaceRequest:");
    int v4 = v5;
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
      GEORPAddressFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPAddressFeedback *)self readAll:0];
  id v9 = [(GEORPAddressCorrections *)self->_address copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDPlace *)self->_place copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_type;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v13 = [(GEORPPersonalizedMapsContext *)self->_personalizedMaps copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  id v15 = [(GEOPDPlaceRequest *)self->_placeRequest copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEORPAddressFeedback *)self readAll:1];
  [v4 readAll:1];
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 3))
  {
    if (!-[GEORPAddressCorrections isEqual:](address, "isEqual:")) {
      goto LABEL_15;
    }
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 6))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_type != *((_DWORD *)v4 + 17)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  personalizedMaps = self->_personalizedMaps;
  if ((unint64_t)personalizedMaps | *((void *)v4 + 4)
    && !-[GEORPPersonalizedMapsContext isEqual:](personalizedMaps, "isEqual:"))
  {
    goto LABEL_15;
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((void *)v4 + 5)) {
    char v9 = -[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPAddressFeedback *)self readAll:1];
  unint64_t v3 = [(GEORPAddressCorrections *)self->_address hash];
  unint64_t v4 = [(GEOPDPlace *)self->_place hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(GEORPPersonalizedMapsContext *)self->_personalizedMaps hash];
  return v6 ^ [(GEOPDPlaceRequest *)self->_placeRequest hash];
}

- (void)mergeFrom:(id)a3
{
  id v13 = a3;
  [v13 readAll:0];
  unint64_t v4 = v13;
  address = self->_address;
  uint64_t v6 = v13[3];
  if (address)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPAddressCorrections mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPAddressFeedback setAddress:](self, "setAddress:");
  }
  unint64_t v4 = v13;
LABEL_7:
  place = self->_place;
  uint64_t v8 = v4[6];
  if (place)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEORPAddressFeedback setPlace:](self, "setPlace:");
  }
  unint64_t v4 = v13;
LABEL_13:
  if (v4[9])
  {
    self->_type = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
  }
  personalizedMaps = self->_personalizedMaps;
  uint64_t v10 = v4[4];
  if (personalizedMaps)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEORPPersonalizedMapsContext mergeFrom:](personalizedMaps, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEORPAddressFeedback setPersonalizedMaps:](self, "setPersonalizedMaps:");
  }
  unint64_t v4 = v13;
LABEL_21:
  placeRequest = self->_placeRequest;
  uint64_t v12 = v4[5];
  if (placeRequest)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEORPAddressFeedback setPlaceRequest:](self, "setPlaceRequest:");
  }
  unint64_t v4 = v13;
LABEL_27:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPAddressFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_237);
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
  *(unsigned char *)&self->_flags |= 0x42u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPAddressFeedback *)self readAll:0];
    [(GEORPAddressCorrections *)self->_address clearUnknownFields:1];
    [(GEOPDPlace *)self->_place clearUnknownFields:1];
    [(GEORPPersonalizedMapsContext *)self->_personalizedMaps clearUnknownFields:1];
    placeRequest = self->_placeRequest;
    [(GEOPDPlaceRequest *)placeRequest clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_personalizedMaps, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end