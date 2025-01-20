@interface GEOPDAutocompleteEntryAddress
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCenter;
- (BOOL)hasDisambiguationRadiusMeters;
- (BOOL)hasDistance;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapsId;
- (BOOL)hasOpaqueGeoId;
- (BOOL)hasPlaceType;
- (BOOL)hasShouldCallPlacesForClientization;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCallPlacesForClientization;
- (GEOLatLng)center;
- (GEOPDAutocompleteEntryAddress)init;
- (GEOPDAutocompleteEntryAddress)initWithData:(id)a3;
- (GEOPDAutocompleteEntryAddress)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntryAddress)initWithJSON:(id)a3;
- (GEOPDMapsIdentifier)mapsId;
- (PBUnknownFields)unknownFields;
- (double)disambiguationRadiusMeters;
- (double)distance;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeTypeAsString:(int)a3;
- (int)StringAsPlaceType:(id)a3;
- (int)placeType;
- (unint64_t)hash;
- (unint64_t)opaqueGeoId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCenter;
- (void)_readMapsId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCenter:(id)a3;
- (void)setDisambiguationRadiusMeters:(double)a3;
- (void)setDistance:(double)a3;
- (void)setHasDisambiguationRadiusMeters:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasOpaqueGeoId:(BOOL)a3;
- (void)setHasPlaceType:(BOOL)a3;
- (void)setHasShouldCallPlacesForClientization:(BOOL)a3;
- (void)setMapsId:(id)a3;
- (void)setOpaqueGeoId:(unint64_t)a3;
- (void)setPlaceType:(int)a3;
- (void)setShouldCallPlacesForClientization:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntryAddress

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_87;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_87;
  }
  v6 = [v5 objectForKeyedSubscript:@"center"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
    }
    v9 = (void *)v8;
    [a1 setCenter:v8];
  }
  if (a3) {
    v10 = @"opaqueGeoId";
  }
  else {
    v10 = @"opaque_geo_id";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOpaqueGeoId:", objc_msgSend(v11, "unsignedLongLongValue"));
  }

  v12 = [v5 objectForKeyedSubscript:@"distance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 doubleValue];
    objc_msgSend(a1, "setDistance:");
  }

  if (a3) {
    v13 = @"placeType";
  }
  else {
    v13 = @"place_type";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"COUNTRY"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"ADMINISTRATIVE_AREA"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
    {
      uint64_t v16 = 4;
    }
    else if ([v15 isEqualToString:@"LOCALITY"])
    {
      uint64_t v16 = 16;
    }
    else if ([v15 isEqualToString:@"TIME_ZONE"])
    {
      uint64_t v16 = 35;
    }
    else if ([v15 isEqualToString:@"SUB_LOCALITY"])
    {
      uint64_t v16 = 43;
    }
    else if ([v15 isEqualToString:@"OCEAN"])
    {
      uint64_t v16 = 44;
    }
    else if ([v15 isEqualToString:@"AOI"])
    {
      uint64_t v16 = 45;
    }
    else if ([v15 isEqualToString:@"INLAND_WATER"])
    {
      uint64_t v16 = 46;
    }
    else if ([v15 isEqualToString:@"BUSINESS"])
    {
      uint64_t v16 = 47;
    }
    else if ([v15 isEqualToString:@"ISLAND"])
    {
      uint64_t v16 = 48;
    }
    else if ([v15 isEqualToString:@"STREET"])
    {
      uint64_t v16 = 49;
    }
    else if ([v15 isEqualToString:@"ADMIN"])
    {
      uint64_t v16 = 50;
    }
    else if ([v15 isEqualToString:@"POSTAL"])
    {
      uint64_t v16 = 51;
    }
    else if ([v15 isEqualToString:@"INTERSECTION"])
    {
      uint64_t v16 = 54;
    }
    else if ([v15 isEqualToString:@"BUILDING"])
    {
      uint64_t v16 = 55;
    }
    else if ([v15 isEqualToString:@"ADDRESS"])
    {
      uint64_t v16 = 57;
    }
    else if ([v15 isEqualToString:@"CONTINENT"])
    {
      uint64_t v16 = 61;
    }
    else if ([v15 isEqualToString:@"REGION"])
    {
      uint64_t v16 = 63;
    }
    else if ([v15 isEqualToString:@"DIVISION"])
    {
      uint64_t v16 = 64;
    }
    else if ([v15 isEqualToString:@"PHYSICAL_FEATURE"])
    {
      uint64_t v16 = 65;
    }
    else
    {
      uint64_t v16 = 0;
    }

    goto LABEL_67;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_67:
    [a1 setPlaceType:v16];
  }

  if (a3) {
    v17 = @"disambiguationRadiusMeters";
  }
  else {
    v17 = @"disambiguation_radius_meters";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 doubleValue];
    objc_msgSend(a1, "setDisambiguationRadiusMeters:");
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
  if (a3) {
    v24 = @"shouldCallPlacesForClientization";
  }
  else {
    v24 = @"should_call_places_for_clientization";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShouldCallPlacesForClientization:", objc_msgSend(v25, "BOOLValue"));
  }

LABEL_87:
  return a1;
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteEntryAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_399);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)setHasPlaceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 264;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_394;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_395;
    }
    GEOPDAutocompleteEntryAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_center readAll:1];
    [(GEOPDMapsIdentifier *)self->_mapsId readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPDAutocompleteEntryAddress)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntryAddress;
  v2 = [(GEOPDAutocompleteEntryAddress *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntryAddress)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntryAddress;
  BOOL v3 = [(GEOPDAutocompleteEntryAddress *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPDAutocompleteEntryAddress _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (void)setCenter:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (unint64_t)opaqueGeoId
{
  return self->_opaqueGeoId;
}

- (void)setOpaqueGeoId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_opaqueGeoId = a3;
}

- (void)setHasOpaqueGeoId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 260;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasOpaqueGeoId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDistance
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)placeType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_placeType;
  }
  else {
    return 0;
  }
}

- (void)setPlaceType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  self->_placeType = a3;
}

- (BOOL)hasPlaceType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)placeTypeAsString:(int)a3
{
  switch(a3)
  {
    case '#':
      v4 = @"TIME_ZONE";
      break;
    case '$':
    case '%':
    case '&':
    case '\'':
    case '(':
    case ')':
    case '*':
    case '4':
    case '5':
    case '8':
    case ':':
    case ';':
    case '<':
    case '>':
LABEL_13:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      break;
    case '+':
      v4 = @"SUB_LOCALITY";
      break;
    case ',':
      v4 = @"OCEAN";
      break;
    case '-':
      v4 = @"AOI";
      break;
    case '.':
      v4 = @"INLAND_WATER";
      break;
    case '/':
      v4 = @"BUSINESS";
      break;
    case '0':
      v4 = @"ISLAND";
      break;
    case '1':
      v4 = @"STREET";
      break;
    case '2':
      v4 = @"ADMIN";
      break;
    case '3':
      v4 = @"POSTAL";
      break;
    case '6':
      v4 = @"INTERSECTION";
      break;
    case '7':
      v4 = @"BUILDING";
      break;
    case '9':
      v4 = @"ADDRESS";
      break;
    case '=':
      v4 = @"CONTINENT";
      break;
    case '?':
      v4 = @"REGION";
      break;
    case '@':
      v4 = @"DIVISION";
      break;
    case 'A':
      v4 = @"PHYSICAL_FEATURE";
      break;
    default:
      v4 = @"UNKNOWN_PLACE_TYPE";
      switch(a3)
      {
        case 0:
          goto LABEL_14;
        case 1:
          v4 = @"COUNTRY";
          break;
        case 2:
          v4 = @"ADMINISTRATIVE_AREA";
          break;
        case 3:
          goto LABEL_13;
        case 4:
          v4 = @"SUB_ADMINISTRATIVE_AREA";
          break;
        default:
          if (a3 != 16) {
            goto LABEL_13;
          }
          v4 = @"LOCALITY";
          break;
      }
      break;
  }
  return v4;
}

- (int)StringAsPlaceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADMINISTRATIVE_AREA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCALITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TIME_ZONE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"SUB_LOCALITY"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"OCEAN"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"AOI"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"INLAND_WATER"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ISLAND"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"STREET"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"ADMIN"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"POSTAL"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"INTERSECTION"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"BUILDING"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"CONTINENT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"REGION"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"DIVISION"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_FEATURE"])
  {
    int v4 = 65;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)disambiguationRadiusMeters
{
  return self->_disambiguationRadiusMeters;
}

- (void)setDisambiguationRadiusMeters:(double)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_disambiguationRadiusMeters = a3;
}

- (void)setHasDisambiguationRadiusMeters:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasDisambiguationRadiusMeters
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasMapsId
{
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEOPDAutocompleteEntryAddress _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return mapsId;
}

- (void)setMapsId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (BOOL)shouldCallPlacesForClientization
{
  return self->_shouldCallPlacesForClientization;
}

- (void)setShouldCallPlacesForClientization:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  self->_shouldCallPlacesForClientization = a3;
}

- (void)setHasShouldCallPlacesForClientization:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 272;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasShouldCallPlacesForClientization
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteEntryAddress;
  int v4 = [(GEOPDAutocompleteEntryAddress *)&v8 description];
  id v5 = [(GEOPDAutocompleteEntryAddress *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_36;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 center];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    objc_super v7 = [v5 dictionaryRepresentation];
    }
    [v4 setObject:v7 forKey:@"center"];
  }
  __int16 v8 = *(_WORD *)(a1 + 84);
  if ((v8 & 4) != 0)
  {
    id v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    if (a2) {
      uint64_t v16 = @"opaqueGeoId";
    }
    else {
      uint64_t v16 = @"opaque_geo_id";
    }
    [v4 setObject:v15 forKey:v16];

    __int16 v8 = *(_WORD *)(a1 + 84);
    if ((v8 & 2) == 0)
    {
LABEL_9:
      if ((v8 & 8) == 0) {
        goto LABEL_10;
      }
LABEL_23:
      int v18 = *(_DWORD *)(a1 + 76);
      switch(v18)
      {
        case '#':
          v19 = @"TIME_ZONE";
          break;
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '4':
        case '5':
        case '8':
        case ':':
        case ';':
        case '<':
        case '>':
LABEL_43:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 76));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case '+':
          v19 = @"SUB_LOCALITY";
          break;
        case ',':
          v19 = @"OCEAN";
          break;
        case '-':
          v19 = @"AOI";
          break;
        case '.':
          v19 = @"INLAND_WATER";
          break;
        case '/':
          v19 = @"BUSINESS";
          break;
        case '0':
          v19 = @"ISLAND";
          break;
        case '1':
          v19 = @"STREET";
          break;
        case '2':
          v19 = @"ADMIN";
          break;
        case '3':
          v19 = @"POSTAL";
          break;
        case '6':
          v19 = @"INTERSECTION";
          break;
        case '7':
          v19 = @"BUILDING";
          break;
        case '9':
          v19 = @"ADDRESS";
          break;
        case '=':
          v19 = @"CONTINENT";
          break;
        case '?':
          v19 = @"REGION";
          break;
        case '@':
          v19 = @"DIVISION";
          break;
        case 'A':
          v19 = @"PHYSICAL_FEATURE";
          break;
        default:
          v19 = @"UNKNOWN_PLACE_TYPE";
          switch(v18)
          {
            case 0:
              goto LABEL_62;
            case 1:
              v19 = @"COUNTRY";
              break;
            case 2:
              v19 = @"ADMINISTRATIVE_AREA";
              break;
            case 3:
              goto LABEL_43;
            case 4:
              v19 = @"SUB_ADMINISTRATIVE_AREA";
              break;
            default:
              if (v18 != 16) {
                goto LABEL_43;
              }
              v19 = @"LOCALITY";
              break;
          }
          break;
      }
LABEL_62:
      if (a2) {
        v29 = @"placeType";
      }
      else {
        v29 = @"place_type";
      }
      [v4 setObject:v19 forKey:v29];

      if ((*(_WORD *)(a1 + 84) & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_9;
  }
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v4 setObject:v17 forKey:@"distance"];

  __int16 v8 = *(_WORD *)(a1 + 84);
  if ((v8 & 8) != 0) {
    goto LABEL_23;
  }
LABEL_10:
  if (v8)
  {
LABEL_11:
    v9 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v10 = @"disambiguationRadiusMeters";
    }
    else {
      v10 = @"disambiguation_radius_meters";
    }
    [v4 setObject:v9 forKey:v10];
  }
LABEL_15:
  v11 = [(id)a1 mapsId];
  v12 = v11;
  if (v11)
  {
    if (a2)
    {
      v13 = [v11 jsonRepresentation];
      v14 = @"mapsId";
    }
    else
    {
      v13 = [v11 dictionaryRepresentation];
      v14 = @"maps_id";
    }
    [v4 setObject:v13 forKey:v14];
  }
  if ((*(_WORD *)(a1 + 84) & 0x10) != 0)
  {
    v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
    if (a2) {
      v21 = @"shouldCallPlacesForClientization";
    }
    else {
      v21 = @"should_call_places_for_clientization";
    }
    [v4 setObject:v20 forKey:v21];
  }
  uint64_t v22 = *(void **)(a1 + 16);
  if (v22)
  {
    v23 = [v22 dictionaryRepresentation];
    v24 = v23;
    if (a2)
    {
      v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __59__GEOPDAutocompleteEntryAddress__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E53D8860;
      id v26 = v25;
      id v31 = v26;
      [v24 enumerateKeysAndObjectsUsingBlock:v30];
      id v27 = v26;

      v24 = v27;
    }
    [v4 setObject:v24 forKey:@"Unknown Fields"];
  }
LABEL_36:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteEntryAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDAutocompleteEntryAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    __int16 v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    __int16 v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDAutocompleteEntryAddress)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryAddress *)-[GEOPDAutocompleteEntryAddress _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDAutocompleteEntryAddress)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryAddress *)-[GEOPDAutocompleteEntryAddress _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1C0) == 0)
    {
      objc_super v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      __int16 v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_20;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteEntryAddress *)self readAll:0];
  if (self->_center) {
    PBDataWriterWriteSubmessage();
  }
  __int16 flags = (__int16)self->_flags;
  id v6 = v9;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v6 = v9;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_8;
      }
LABEL_17:
      PBDataWriterWriteInt32Field();
      id v6 = v9;
      if ((*(_WORD *)&self->_flags & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  id v6 = v9;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if (flags)
  {
LABEL_9:
    PBDataWriterWriteDoubleField();
    id v6 = v9;
  }
LABEL_10:
  if (self->_mapsId)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_20:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDAutocompleteEntryAddress _readCenter]((uint64_t)self);
  if ([(GEOLatLng *)self->_center hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteEntryAddress _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return [(GEOPDMapsIdentifier *)mapsId hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOPDAutocompleteEntryAddress *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_center) {
    objc_msgSend(v6, "setCenter:");
  }
  __int16 flags = (__int16)self->_flags;
  id v5 = v6;
  if ((flags & 4) != 0)
  {
    v6[7] = self->_opaqueGeoId;
    *((_WORD *)v6 + 42) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_5;
  }
  v6[5] = *(id *)&self->_distance;
  *((_WORD *)v6 + 42) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  *((_DWORD *)v6 + 19) = self->_placeType;
  *((_WORD *)v6 + 42) |= 8u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_7:
    v6[4] = *(id *)&self->_disambiguationRadiusMeters;
    *((_WORD *)v6 + 42) |= 1u;
  }
LABEL_8:
  if (self->_mapsId)
  {
    objc_msgSend(v6, "setMapsId:");
    id v5 = v6;
  }
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *((unsigned char *)v5 + 80) = self->_shouldCallPlacesForClientization;
    *((_WORD *)v5 + 42) |= 0x10u;
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteEntryAddressReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_13;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteEntryAddress *)self readAll:0];
  id v9 = [(GEOLatLng *)self->_center copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(void *)(v5 + 56) = self->_opaqueGeoId;
    *(_WORD *)(v5 + 84) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_8;
      }
LABEL_16:
      *(_DWORD *)(v5 + 76) = self->_placeType;
      *(_WORD *)(v5 + 84) |= 8u;
      if ((*(_WORD *)&self->_flags & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v5 + 40) = self->_distance;
  *(_WORD *)(v5 + 84) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if (flags)
  {
LABEL_9:
    *(double *)(v5 + 32) = self->_disambiguationRadiusMeters;
    *(_WORD *)(v5 + 84) |= 1u;
  }
LABEL_10:
  id v12 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_shouldCallPlacesForClientization;
    *(_WORD *)(v5 + 84) |= 0x10u;
  }
  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_13:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEOPDAutocompleteEntryAddress *)self readAll:1];
  [v4 readAll:1];
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_29;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 42);
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_opaqueGeoId != *((void *)v4 + 7)) {
      goto LABEL_29;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_distance != *((double *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_placeType != *((_DWORD *)v4 + 19)) {
      goto LABEL_29;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_29;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_disambiguationRadiusMeters != *((double *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if (v7)
  {
    goto LABEL_29;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 6))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:")) {
      goto LABEL_29;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 42);
  }
  BOOL v9 = (v7 & 0x10) == 0;
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) != 0)
    {
      if (self->_shouldCallPlacesForClientization)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_29;
        }
      }
      else if (*((unsigned char *)v4 + 80))
      {
        goto LABEL_29;
      }
      BOOL v9 = 1;
      goto LABEL_30;
    }
LABEL_29:
    BOOL v9 = 0;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteEntryAddress *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_center hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    unint64_t v5 = 2654435761u * self->_opaqueGeoId;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  unint64_t v5 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double distance = self->_distance;
  double v7 = -distance;
  if (distance >= 0.0) {
    double v7 = self->_distance;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((flags & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_placeType;
    if (flags) {
      goto LABEL_13;
    }
LABEL_18:
    unint64_t v16 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_18;
  }
LABEL_13:
  double disambiguationRadiusMeters = self->_disambiguationRadiusMeters;
  double v13 = -disambiguationRadiusMeters;
  if (disambiguationRadiusMeters >= 0.0) {
    double v13 = self->_disambiguationRadiusMeters;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_21:
  unint64_t v17 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
    uint64_t v18 = 2654435761 * self->_shouldCallPlacesForClientization;
  }
  else {
    uint64_t v18 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v10 = a3;
  [v10 readAll:0];
  id v4 = v10;
  center = self->_center;
  uint64_t v6 = v10[3];
  if (center)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPDAutocompleteEntryAddress setCenter:](self, "setCenter:");
  }
  id v4 = v10;
LABEL_7:
  __int16 v7 = *((_WORD *)v4 + 42);
  if ((v7 & 4) != 0)
  {
    self->_opaqueGeoId = v4[7];
    *(_WORD *)&self->_flags |= 4u;
    __int16 v7 = *((_WORD *)v4 + 42);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_double distance = (double)v4[5];
  *(_WORD *)&self->_flags |= 2u;
  __int16 v7 = *((_WORD *)v4 + 42);
  if ((v7 & 8) == 0)
  {
LABEL_10:
    if ((v7 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_placeType = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_flags |= 8u;
  if (*((_WORD *)v4 + 42))
  {
LABEL_11:
    self->_double disambiguationRadiusMeters = (double)v4[4];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_12:
  mapsId = self->_mapsId;
  uint64_t v9 = v4[6];
  if (mapsId)
  {
    if (!v9) {
      goto LABEL_22;
    }
    -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_22;
    }
    -[GEOPDAutocompleteEntryAddress setMapsId:](self, "setMapsId:");
  }
  id v4 = v10;
LABEL_22:
  if ((*((_WORD *)v4 + 42) & 0x10) != 0)
  {
    self->_shouldCallPlacesForClientization = *((unsigned char *)v4 + 80);
    *(_WORD *)&self->_flags |= 0x10u;
  }
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x120u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteEntryAddress *)self readAll:0];
    [(GEOLatLng *)self->_center clearUnknownFields:1];
    mapsId = self->_mapsId;
    [(GEOPDMapsIdentifier *)mapsId clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end