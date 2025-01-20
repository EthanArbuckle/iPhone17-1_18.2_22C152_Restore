@interface GEORPFeedbackLayoutConfigParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCoordinate;
- (BOOL)hasFormType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapRegion;
- (BOOL)hasMapsId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)coordinate;
- (GEOMapRegion)mapRegion;
- (GEOPDMapsIdentifier)mapsId;
- (GEORPFeedbackLayoutConfigParameters)init;
- (GEORPFeedbackLayoutConfigParameters)initWithData:(id)a3;
- (GEORPFeedbackLayoutConfigParameters)initWithDictionary:(id)a3;
- (GEORPFeedbackLayoutConfigParameters)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsFormType:(id)a3;
- (int)formType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCoordinate;
- (void)_readMapRegion;
- (void)_readMapsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCoordinate:(id)a3;
- (void)setFormType:(int)a3;
- (void)setHasFormType:(BOOL)a3;
- (void)setMapRegion:(id)a3;
- (void)setMapsId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackLayoutConfigParameters

- (GEORPFeedbackLayoutConfigParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackLayoutConfigParameters;
  v2 = [(GEORPFeedbackLayoutConfigParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackLayoutConfigParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackLayoutConfigParameters;
  v3 = [(GEORPFeedbackLayoutConfigParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)formType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_formType;
  }
  else {
    return 0;
  }
}

- (void)setFormType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_formType = a3;
}

- (void)setHasFormType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasFormType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)formTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53EB250[a3];
  }

  return v3;
}

- (int)StringAsFormType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_WORKFLOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_ADD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_EDIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_ADDRESS_ADD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_ADDRESS_EDIT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_GROUNDVIEW"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_NEW_INCIDENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_IMAGE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_INCIDENT_VOTING"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readMapRegion
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
        GEORPFeedbackLayoutConfigParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_8);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEORPFeedbackLayoutConfigParameters _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readCoordinate
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
        GEORPFeedbackLayoutConfigParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinate_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEORPFeedbackLayoutConfigParameters _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)_readMapsId
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
        GEORPFeedbackLayoutConfigParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsId
{
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEORPFeedbackLayoutConfigParameters _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return mapsId;
}

- (void)setMapsId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackLayoutConfigParameters;
  int v4 = [(GEORPFeedbackLayoutConfigParameters *)&v8 description];
  v5 = [(GEORPFeedbackLayoutConfigParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackLayoutConfigParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53EB250[v5];
      }
      if (a2) {
        objc_super v7 = @"formType";
      }
      else {
        objc_super v7 = @"form_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 mapRegion];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"mapRegion";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"map_region";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 coordinate];
    v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      v14 = [v12 dictionaryRepresentation];
      }
      [v4 setObject:v14 forKey:@"coordinate"];
    }
    v15 = [(id)a1 mapsId];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"mapsId";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"maps_id";
      }
      [v4 setObject:v17 forKey:v18];
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
  return -[GEORPFeedbackLayoutConfigParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackLayoutConfigParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLayoutConfigParameters *)-[GEORPFeedbackLayoutConfigParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_54;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_54;
  }
  if (a3) {
    objc_super v6 = @"formType";
  }
  else {
    objc_super v6 = @"form_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_WORKFLOW"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_ADD"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_EDIT"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_ADDRESS_ADD"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_ADDRESS_EDIT"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_GROUNDVIEW"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_NEW_INCIDENT"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_IMAGE"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_FORM_INCIDENT_VOTING"])
    {
      uint64_t v9 = 9;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_31:
    [a1 setFormType:v9];
  }

  if (a3) {
    v10 = @"mapRegion";
  }
  else {
    v10 = @"map_region";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v13 = [(GEOMapRegion *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOMapRegion *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setMapRegion:v13];
  }
  v15 = [v5 objectForKeyedSubscript:@"coordinate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v17 = [(GEOLatLng *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEOLatLng *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setCoordinate:v17];
  }
  if (a3) {
    v19 = @"mapsId";
  }
  else {
    v19 = @"maps_id";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      uint64_t v22 = [(GEOPDMapsIdentifier *)v21 initWithJSON:v20];
    }
    else {
      uint64_t v22 = [(GEOPDMapsIdentifier *)v21 initWithDictionary:v20];
    }
    v23 = (void *)v22;
    [a1 setMapsId:v22];
  }
LABEL_54:

  return a1;
}

- (GEORPFeedbackLayoutConfigParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackLayoutConfigParameters *)-[GEORPFeedbackLayoutConfigParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_68;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_68;
    }
    GEORPFeedbackLayoutConfigParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOMapRegion *)self->_mapRegion readAll:1];
    [(GEOLatLng *)self->_coordinate readAll:1];
    [(GEOPDMapsIdentifier *)self->_mapsId readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLayoutConfigParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLayoutConfigParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
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
    [(GEORPFeedbackLayoutConfigParameters *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_coordinate) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackLayoutConfigParameters _readCoordinate]((uint64_t)self);
  if ([(GEOLatLng *)self->_coordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackLayoutConfigParameters _readMapRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_mapRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackLayoutConfigParameters _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return [(GEOPDMapsIdentifier *)mapsId hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackLayoutConfigParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_formType;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_mapRegion)
  {
    objc_msgSend(v5, "setMapRegion:");
    int v4 = v5;
  }
  if (self->_coordinate)
  {
    objc_msgSend(v5, "setCoordinate:");
    int v4 = v5;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v5, "setMapsId:");
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
      GEORPFeedbackLayoutConfigParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackLayoutConfigParameters *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_formType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v9 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOLatLng *)self->_coordinate copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  id v13 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEORPFeedbackLayoutConfigParameters *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_formType != *((_DWORD *)v4 + 13)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 3) && !-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
    goto LABEL_13;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:")) {
      goto LABEL_13;
    }
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 4)) {
    char v8 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPFeedbackLayoutConfigParameters *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_formType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOMapRegion *)self->_mapRegion hash] ^ v3;
  unint64_t v5 = [(GEOLatLng *)self->_coordinate hash];
  return v4 ^ v5 ^ [(GEOPDMapsIdentifier *)self->_mapsId hash];
}

- (void)mergeFrom:(id)a3
{
  id v11 = (int *)a3;
  [v11 readAll:0];
  unint64_t v4 = v11;
  if (v11[14])
  {
    self->_formType = v11[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  mapRegion = self->_mapRegion;
  uint64_t v6 = *((void *)v11 + 3);
  if (mapRegion)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPFeedbackLayoutConfigParameters setMapRegion:](self, "setMapRegion:");
  }
  unint64_t v4 = v11;
LABEL_9:
  coordinate = self->_coordinate;
  uint64_t v8 = *((void *)v4 + 2);
  if (coordinate)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORPFeedbackLayoutConfigParameters setCoordinate:](self, "setCoordinate:");
  }
  unint64_t v4 = v11;
LABEL_15:
  mapsId = self->_mapsId;
  uint64_t v10 = *((void *)v4 + 4);
  if (mapsId)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEORPFeedbackLayoutConfigParameters setMapsId:](self, "setMapsId:");
  }
  unint64_t v4 = v11;
LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end