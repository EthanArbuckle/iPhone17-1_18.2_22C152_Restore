@interface GEOMapItemHandle
+ (BOOL)isValid:(id)a3;
+ (id)handleDataForMapItem:(id)a3;
+ (id)handleForMapItem:(id)a3;
- (BOOL)hasClientAttributes;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHandleType;
- (BOOL)hasPlaceRefinementParameters;
- (BOOL)hasPlaceRequestData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemClientAttributes)clientAttributes;
- (GEOMapItemHandle)init;
- (GEOMapItemHandle)initWithData:(id)a3;
- (GEOMapItemHandle)initWithDictionary:(id)a3;
- (GEOMapItemHandle)initWithJSON:(id)a3;
- (GEOMapItemInitialRequestData)placeRequestData;
- (GEOPDPlaceRefinementParameters)placeRefinementParameters;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)handleTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsHandleType:(id)a3;
- (int)handleType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientAttributes;
- (void)_readPlaceRefinementParameters;
- (void)_readPlaceRequestData;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientAttributes:(id)a3;
- (void)setHandleType:(int)a3;
- (void)setHasHandleType:(BOOL)a3;
- (void)setPlaceRefinementParameters:(id)a3;
- (void)setPlaceRequestData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapItemHandle

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemHandleReadAllFrom((uint64_t)self, a3, 0);
}

+ (id)handleDataForMapItem:(id)a3
{
  v3 = +[GEOMapItemHandle handleForMapItem:a3];
  v4 = [v3 data];

  return v4;
}

+ (id)handleForMapItem:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_11;
  }
  v4 = objc_alloc_init(GEOMapItemHandle);
  v5 = [[GEOPDPlaceRequest alloc] initWithMapItemToRefine:v3 traits:0];
  [(GEOMapItemHandle *)v4 setHandleType:1];
  v6 = [(GEOPDPlaceRequest *)v5 placeRequestParameters];
  v7 = -[GEOPDPlaceRequestParameters placeRefinementParameters](v6);
  [(GEOMapItemHandle *)v4 setPlaceRefinementParameters:v7];

  v8 = [v3 _clientAttributes];
  [(GEOMapItemHandle *)v4 setClientAttributes:v8];

  v9 = [(GEOMapItemHandle *)v4 placeRefinementParameters];
  -[GEOPDPlaceRefinementParameters setAddressObjectHint:]((uint64_t)v9, 0);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v3 placeData];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_8;
    }
    v10 = [v3 _placeData];
  }
  v11 = v10;
  v12 = [v10 requestData];

LABEL_8:
  if ((([v12 requestType] - 2) & 0xFFFFFFFD) == 0) {
    [(GEOMapItemHandle *)v4 setPlaceRequestData:v12];
  }

LABEL_11:

  return v4;
}

- (GEOPDPlaceRefinementParameters)placeRefinementParameters
{
  -[GEOMapItemHandle _readPlaceRefinementParameters]((uint64_t)self);
  placeRefinementParameters = self->_placeRefinementParameters;

  return placeRefinementParameters;
}

- (void)_readPlaceRefinementParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRefinementParameters_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)setPlaceRefinementParameters:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_placeRefinementParameters, a3);
}

- (void)setHandleType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_handleType = a3;
}

- (void)setClientAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_clientAttributes, a3);
}

- (GEOMapItemHandle)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemHandle;
  v2 = [(GEOMapItemHandle *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapItemHandle)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemHandle;
  id v3 = [(GEOMapItemHandle *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)handleType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_handleType;
  }
  else {
    return 0;
  }
}

- (GEOMapItemClientAttributes)clientAttributes
{
  -[GEOMapItemHandle _readClientAttributes]((uint64_t)self);
  clientAttributes = self->_clientAttributes;

  return clientAttributes;
}

- (void)_readClientAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientAttributes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)setPlaceRequestData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_placeRequestData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeRequestData, 0);
  objc_storeStrong((id *)&self->_placeRefinementParameters, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (unint64_t)hash
{
  [(GEOMapItemHandle *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_handleType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDPlaceRefinementParameters *)self->_placeRefinementParameters hash] ^ v3;
  unint64_t v5 = [(GEOMapItemInitialRequestData *)self->_placeRequestData hash];
  return v4 ^ v5 ^ [(GEOMapItemClientAttributes *)self->_clientAttributes hash];
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMapItemHandleIsDirty((uint64_t)self) & 1) == 0)
  {
    unint64_t v5 = self->_reader;
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
    [(GEOMapItemHandle *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_placeRefinementParameters) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeRequestData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientAttributes) {
      PBDataWriterWriteSubmessage();
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
      v8 = (int *)&readAll__recursiveTag_61;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_61;
    }
    GEOMapItemHandleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOMapItemHandleCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)setHasHandleType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasHandleType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)handleTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      unint64_t v4 = @"PLACE_REFINEMENT_PARAMETERS_TYPE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unint64_t v4 = @"UNKNOWN_TYPE";
  }
  return v4;
}

- (int)StringAsHandleType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"PLACE_REFINEMENT_PARAMETERS_TYPE"];
  }

  return v4;
}

- (BOOL)hasPlaceRefinementParameters
{
  return self->_placeRefinementParameters != 0;
}

- (void)_readPlaceRequestData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemHandleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequestData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPlaceRequestData
{
  return self->_placeRequestData != 0;
}

- (GEOMapItemInitialRequestData)placeRequestData
{
  -[GEOMapItemHandle _readPlaceRequestData]((uint64_t)self);
  placeRequestData = self->_placeRequestData;

  return placeRequestData;
}

- (BOOL)hasClientAttributes
{
  return self->_clientAttributes != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemHandle;
  int v4 = [(GEOMapItemHandle *)&v8 description];
  unint64_t v5 = [(GEOMapItemHandle *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemHandle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      int v5 = *(_DWORD *)(a1 + 52);
      if (v5)
      {
        if (v5 == 1)
        {
          objc_super v6 = @"PLACE_REFINEMENT_PARAMETERS_TYPE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
          objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_super v6 = @"UNKNOWN_TYPE";
      }
      if (a2) {
        id v7 = @"handleType";
      }
      else {
        id v7 = @"handle_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 placeRefinementParameters];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"placeRefinementParameters";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"place_refinement_parameters";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 placeRequestData];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"placeRequestData";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"place_request_data";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 clientAttributes];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"clientAttributes";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"client_attributes";
      }
      [v4 setObject:v18 forKey:v19];
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
  return -[GEOMapItemHandle _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapItemHandle)initWithDictionary:(id)a3
{
  return (GEOMapItemHandle *)-[GEOMapItemHandle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_38;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_38;
  }
  if (a3) {
    objc_super v6 = @"handleType";
  }
  else {
    objc_super v6 = @"handle_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_TYPE"]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [v8 isEqualToString:@"PLACE_REFINEMENT_PARAMETERS_TYPE"];
    }

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_13:
    [a1 setHandleType:v9];
  }

  if (a3) {
    v10 = @"placeRefinementParameters";
  }
  else {
    v10 = @"place_refinement_parameters";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOPDPlaceRefinementParameters alloc];
    if (v12) {
      v13 = (void *)-[GEOPDPlaceRefinementParameters _initWithDictionary:isJSON:]((uint64_t)v12, v11, a3);
    }
    else {
      v13 = 0;
    }
    [a1 setPlaceRefinementParameters:v13];
  }
  if (a3) {
    v14 = @"placeRequestData";
  }
  else {
    v14 = @"place_request_data";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEOMapItemInitialRequestData alloc];
    if (a3) {
      uint64_t v17 = [(GEOMapItemInitialRequestData *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEOMapItemInitialRequestData *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setPlaceRequestData:v17];
  }
  if (a3) {
    v19 = @"clientAttributes";
  }
  else {
    v19 = @"client_attributes";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [GEOMapItemClientAttributes alloc];
    if (a3) {
      uint64_t v22 = [(GEOMapItemClientAttributes *)v21 initWithJSON:v20];
    }
    else {
      uint64_t v22 = [(GEOMapItemClientAttributes *)v21 initWithDictionary:v20];
    }
    v23 = (void *)v22;
    [a1 setClientAttributes:v22];
  }
LABEL_38:

  return a1;
}

- (GEOMapItemHandle)initWithJSON:(id)a3
{
  return (GEOMapItemHandle *)-[GEOMapItemHandle _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemHandleIsValid((char *)a3);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOMapItemHandle _readClientAttributes]((uint64_t)self);
  if ([(GEOMapItemClientAttributes *)self->_clientAttributes hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapItemHandle _readPlaceRefinementParameters]((uint64_t)self);
  if (-[GEOPDPlaceRefinementParameters hasGreenTeaWithValue:]((uint64_t)self->_placeRefinementParameters, v3)) {
    return 1;
  }
  -[GEOMapItemHandle _readPlaceRequestData]((uint64_t)self);
  placeRequestData = self->_placeRequestData;

  return [(GEOMapItemInitialRequestData *)placeRequestData hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOMapItemHandle *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_handleType;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_placeRefinementParameters)
  {
    objc_msgSend(v5, "setPlaceRefinementParameters:");
    int v4 = v5;
  }
  if (self->_placeRequestData)
  {
    objc_msgSend(v5, "setPlaceRequestData:");
    int v4 = v5;
  }
  if (self->_clientAttributes)
  {
    objc_msgSend(v5, "setClientAttributes:");
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapItemHandleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapItemHandle *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_handleType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v9 = [(GEOPDPlaceRefinementParameters *)self->_placeRefinementParameters copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOMapItemInitialRequestData *)self->_placeRequestData copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOMapItemClientAttributes *)self->_clientAttributes copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOMapItemHandle *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_handleType != *((_DWORD *)v4 + 13)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  placeRefinementParameters = self->_placeRefinementParameters;
  if ((unint64_t)placeRefinementParameters | *((void *)v4 + 3)
    && !-[GEOPDPlaceRefinementParameters isEqual:](placeRefinementParameters, "isEqual:"))
  {
    goto LABEL_13;
  }
  placeRequestData = self->_placeRequestData;
  if ((unint64_t)placeRequestData | *((void *)v4 + 4))
  {
    if (!-[GEOMapItemInitialRequestData isEqual:](placeRequestData, "isEqual:")) {
      goto LABEL_13;
    }
  }
  clientAttributes = self->_clientAttributes;
  if ((unint64_t)clientAttributes | *((void *)v4 + 2)) {
    char v8 = -[GEOMapItemClientAttributes isEqual:](clientAttributes, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (void)mergeFrom:(id)a3
{
  id v11 = (int *)a3;
  [v11 readAll:0];
  id v4 = v11;
  if (v11[14])
  {
    self->_handleType = v11[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  placeRefinementParameters = self->_placeRefinementParameters;
  objc_super v6 = (void *)*((void *)v11 + 3);
  if (placeRefinementParameters)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDPlaceRefinementParameters mergeFrom:]((uint64_t)placeRefinementParameters, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    [(GEOMapItemHandle *)self setPlaceRefinementParameters:*((void *)v11 + 3)];
  }
  id v4 = v11;
LABEL_9:
  placeRequestData = self->_placeRequestData;
  uint64_t v8 = *((void *)v4 + 4);
  if (placeRequestData)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOMapItemInitialRequestData mergeFrom:](placeRequestData, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOMapItemHandle setPlaceRequestData:](self, "setPlaceRequestData:");
  }
  id v4 = v11;
LABEL_15:
  clientAttributes = self->_clientAttributes;
  uint64_t v10 = *((void *)v4 + 2);
  if (clientAttributes)
  {
    if (v10) {
      -[GEOMapItemClientAttributes mergeFrom:](clientAttributes, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEOMapItemHandle setClientAttributes:](self, "setClientAttributes:");
  }

  MEMORY[0x1F4181870]();
}

@end