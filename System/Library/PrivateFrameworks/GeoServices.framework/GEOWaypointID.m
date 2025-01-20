@interface GEOWaypointID
+ (BOOL)isValid:(id)a3;
+ (Class)formattedAddressLineHintType;
- (BOOL)hasAddressGeocodeAccuracyHint;
- (BOOL)hasAddressHint;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocationHint;
- (BOOL)hasMuid;
- (BOOL)hasPlaceNameHint;
- (BOOL)hasPlaceTypeHint;
- (BOOL)hasResultProviderId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)locationHint;
- (GEOStructuredAddress)addressHint;
- (GEOWaypointID)init;
- (GEOWaypointID)initWithData:(id)a3;
- (GEOWaypointID)initWithDictionary:(id)a3;
- (GEOWaypointID)initWithJSON:(id)a3;
- (NSMutableArray)formattedAddressLineHints;
- (NSString)placeNameHint;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressGeocodeAccuracyHintAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedAddressLineHintAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)placeTypeHintAsString:(int)a3;
- (int)StringAsAddressGeocodeAccuracyHint:(id)a3;
- (int)StringAsPlaceTypeHint:(id)a3;
- (int)addressGeocodeAccuracyHint;
- (int)placeTypeHint;
- (unint64_t)formattedAddressLineHintsCount;
- (unint64_t)hash;
- (unint64_t)muid;
- (unint64_t)resultProviderId;
- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddressHint;
- (void)_readFormattedAddressLineHints;
- (void)_readLocationHint;
- (void)_readPlaceNameHint;
- (void)addFormattedAddressLineHint:(id)a3;
- (void)clearFormattedAddressLineHints;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressGeocodeAccuracyHint:(int)a3;
- (void)setAddressHint:(id)a3;
- (void)setFormattedAddressLineHints:(id)a3;
- (void)setHasAddressGeocodeAccuracyHint:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasPlaceTypeHint:(BOOL)a3;
- (void)setHasResultProviderId:(BOOL)a3;
- (void)setLocationHint:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setPlaceNameHint:(id)a3;
- (void)setPlaceTypeHint:(int)a3;
- (void)setResultProviderId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypointID

- (GEOWaypointID)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointID;
  v2 = [(GEOWaypointID *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWaypointID)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointID;
  v3 = [(GEOWaypointID *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (unint64_t)resultProviderId
{
  return self->_resultProviderId;
}

- (void)setResultProviderId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_resultProviderId = a3;
}

- (void)setHasResultProviderId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasResultProviderId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readLocationHint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointIDReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationHint_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLocationHint
{
  return self->_locationHint != 0;
}

- (GEOLatLng)locationHint
{
  -[GEOWaypointID _readLocationHint]((uint64_t)self);
  locationHint = self->_locationHint;

  return locationHint;
}

- (void)setLocationHint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_locationHint, a3);
}

- (void)_readAddressHint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointIDReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressHint_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAddressHint
{
  return self->_addressHint != 0;
}

- (GEOStructuredAddress)addressHint
{
  -[GEOWaypointID _readAddressHint]((uint64_t)self);
  addressHint = self->_addressHint;

  return addressHint;
}

- (void)setAddressHint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_addressHint, a3);
}

- (void)_readPlaceNameHint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointIDReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceNameHint_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlaceNameHint
{
  return self->_placeNameHint != 0;
}

- (NSString)placeNameHint
{
  -[GEOWaypointID _readPlaceNameHint]((uint64_t)self);
  placeNameHint = self->_placeNameHint;

  return placeNameHint;
}

- (void)setPlaceNameHint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_placeNameHint, a3);
}

- (void)_readFormattedAddressLineHints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointIDReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedAddressLineHints_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)formattedAddressLineHints
{
  -[GEOWaypointID _readFormattedAddressLineHints]((uint64_t)self);
  formattedAddressLineHints = self->_formattedAddressLineHints;

  return formattedAddressLineHints;
}

- (void)setFormattedAddressLineHints:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  formattedAddressLineHints = self->_formattedAddressLineHints;
  self->_formattedAddressLineHints = v4;
}

- (void)clearFormattedAddressLineHints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  formattedAddressLineHints = self->_formattedAddressLineHints;

  [(NSMutableArray *)formattedAddressLineHints removeAllObjects];
}

- (void)addFormattedAddressLineHint:(id)a3
{
  id v4 = a3;
  -[GEOWaypointID _readFormattedAddressLineHints]((uint64_t)self);
  -[GEOWaypointID _addNoFlagsFormattedAddressLineHint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)formattedAddressLineHintsCount
{
  -[GEOWaypointID _readFormattedAddressLineHints]((uint64_t)self);
  formattedAddressLineHints = self->_formattedAddressLineHints;

  return [(NSMutableArray *)formattedAddressLineHints count];
}

- (id)formattedAddressLineHintAtIndex:(unint64_t)a3
{
  -[GEOWaypointID _readFormattedAddressLineHints]((uint64_t)self);
  formattedAddressLineHints = self->_formattedAddressLineHints;

  return (id)[(NSMutableArray *)formattedAddressLineHints objectAtIndex:a3];
}

+ (Class)formattedAddressLineHintType
{
  return (Class)objc_opt_class();
}

- (int)placeTypeHint
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_placeTypeHint;
  }
  else {
    return 0;
  }
}

- (void)setPlaceTypeHint:(int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_placeTypeHint = a3;
}

- (void)setHasPlaceTypeHint:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 520;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPlaceTypeHint
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)placeTypeHintAsString:(int)a3
{
  switch(a3)
  {
    case '#':
      id v4 = @"TIME_ZONE";
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
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      break;
    case '+':
      id v4 = @"SUB_LOCALITY";
      break;
    case ',':
      id v4 = @"OCEAN";
      break;
    case '-':
      id v4 = @"AOI";
      break;
    case '.':
      id v4 = @"INLAND_WATER";
      break;
    case '/':
      id v4 = @"BUSINESS";
      break;
    case '0':
      id v4 = @"ISLAND";
      break;
    case '1':
      id v4 = @"STREET";
      break;
    case '2':
      id v4 = @"ADMIN";
      break;
    case '3':
      id v4 = @"POSTAL";
      break;
    case '6':
      id v4 = @"INTERSECTION";
      break;
    case '7':
      id v4 = @"BUILDING";
      break;
    case '9':
      id v4 = @"ADDRESS";
      break;
    case '=':
      id v4 = @"CONTINENT";
      break;
    case '?':
      id v4 = @"REGION";
      break;
    case '@':
      id v4 = @"DIVISION";
      break;
    case 'A':
      id v4 = @"PHYSICAL_FEATURE";
      break;
    default:
      id v4 = @"UNKNOWN_PLACE_TYPE";
      switch(a3)
      {
        case 0:
          goto LABEL_14;
        case 1:
          id v4 = @"COUNTRY";
          break;
        case 2:
          id v4 = @"ADMINISTRATIVE_AREA";
          break;
        case 3:
          goto LABEL_13;
        case 4:
          id v4 = @"SUB_ADMINISTRATIVE_AREA";
          break;
        default:
          if (a3 != 16) {
            goto LABEL_13;
          }
          id v4 = @"LOCALITY";
          break;
      }
      break;
  }
  return v4;
}

- (int)StringAsPlaceTypeHint:(id)a3
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

- (int)addressGeocodeAccuracyHint
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_addressGeocodeAccuracyHint;
  }
  else {
    return 0;
  }
}

- (void)setAddressGeocodeAccuracyHint:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_addressGeocodeAccuracyHint = a3;
}

- (void)setHasAddressGeocodeAccuracyHint:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasAddressGeocodeAccuracyHint
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)addressGeocodeAccuracyHintAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E72A0[a3];
  }

  return v3;
}

- (int)StringAsAddressGeocodeAccuracyHint:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POINT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERPOLATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APPROXIMATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POSTAL_ZIP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PARCEL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUBPREMISE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointID;
  int v4 = [(GEOWaypointID *)&v8 description];
  id v5 = [(GEOWaypointID *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointID _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 92);
    if (v5)
    {
      objc_super v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      [v4 setObject:v6 forKey:@"muid"];

      __int16 v5 = *(_WORD *)(a1 + 92);
    }
    if ((v5 & 2) != 0)
    {
      id v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      if (a2) {
        objc_super v8 = @"resultProviderId";
      }
      else {
        objc_super v8 = @"result_provider_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 locationHint];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"locationHint";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"location_hint";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 addressHint];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"addressHint";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"address_hint";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [(id)a1 placeNameHint];
    if (v17)
    {
      if (a2) {
        v18 = @"placeNameHint";
      }
      else {
        v18 = @"place_name_hint";
      }
      [v4 setObject:v17 forKey:v18];
    }

    if (*(void *)(a1 + 32))
    {
      v19 = [(id)a1 formattedAddressLineHints];
      if (a2) {
        v20 = @"formattedAddressLineHint";
      }
      else {
        v20 = @"formatted_address_line_hint";
      }
      [v4 setObject:v19 forKey:v20];
    }
    __int16 v21 = *(_WORD *)(a1 + 92);
    if ((v21 & 8) != 0)
    {
      int v22 = *(_DWORD *)(a1 + 88);
      switch(v22)
      {
        case '#':
          v23 = @"TIME_ZONE";
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
LABEL_36:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 88));
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case '+':
          v23 = @"SUB_LOCALITY";
          break;
        case ',':
          v23 = @"OCEAN";
          break;
        case '-':
          v23 = @"AOI";
          break;
        case '.':
          v23 = @"INLAND_WATER";
          break;
        case '/':
          v23 = @"BUSINESS";
          break;
        case '0':
          v23 = @"ISLAND";
          break;
        case '1':
          v23 = @"STREET";
          break;
        case '2':
          v23 = @"ADMIN";
          break;
        case '3':
          v23 = @"POSTAL";
          break;
        case '6':
          v23 = @"INTERSECTION";
          break;
        case '7':
          v23 = @"BUILDING";
          break;
        case '9':
          v23 = @"ADDRESS";
          break;
        case '=':
          v23 = @"CONTINENT";
          break;
        case '?':
          v23 = @"REGION";
          break;
        case '@':
          v23 = @"DIVISION";
          break;
        case 'A':
          v23 = @"PHYSICAL_FEATURE";
          break;
        default:
          v23 = @"UNKNOWN_PLACE_TYPE";
          switch(v22)
          {
            case 0:
              goto LABEL_55;
            case 1:
              v23 = @"COUNTRY";
              break;
            case 2:
              v23 = @"ADMINISTRATIVE_AREA";
              break;
            case 3:
              goto LABEL_36;
            case 4:
              v23 = @"SUB_ADMINISTRATIVE_AREA";
              break;
            default:
              if (v22 != 16) {
                goto LABEL_36;
              }
              v23 = @"LOCALITY";
              break;
          }
          break;
      }
LABEL_55:
      if (a2) {
        v24 = @"placeTypeHint";
      }
      else {
        v24 = @"place_type_hint";
      }
      [v4 setObject:v23 forKey:v24];

      __int16 v21 = *(_WORD *)(a1 + 92);
    }
    if ((v21 & 4) != 0)
    {
      uint64_t v25 = *(int *)(a1 + 84);
      if (v25 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = off_1E53E72A0[v25];
      }
      if (a2) {
        v27 = @"addressGeocodeAccuracyHint";
      }
      else {
        v27 = @"address_geocode_accuracy_hint";
      }
      [v4 setObject:v26 forKey:v27];
    }
    v28 = *(void **)(a1 + 16);
    if (v28)
    {
      v29 = [v28 dictionaryRepresentation];
      v30 = v29;
      if (a2)
      {
        v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __43__GEOWaypointID__dictionaryRepresentation___block_invoke;
        v35[3] = &unk_1E53D8860;
        id v32 = v31;
        id v36 = v32;
        [v30 enumerateKeysAndObjectsUsingBlock:v35];
        id v33 = v32;

        v30 = v33;
      }
      [v4 setObject:v30 forKey:@"Unknown Fields"];
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
  return -[GEOWaypointID _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOWaypointID__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOWaypointID)initWithDictionary:(id)a3
{
  return (GEOWaypointID *)-[GEOWaypointID _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      if (a3) {
        id v7 = @"resultProviderId";
      }
      else {
        id v7 = @"result_provider_id";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setResultProviderId:", objc_msgSend(v8, "unsignedLongLongValue"));
      }

      if (a3) {
        v9 = @"locationHint";
      }
      else {
        v9 = @"location_hint";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v12 = [(GEOLatLng *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOLatLng *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setLocationHint:v12];
      }
      if (a3) {
        v14 = @"addressHint";
      }
      else {
        v14 = @"address_hint";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOStructuredAddress alloc];
        if (a3) {
          uint64_t v17 = [(GEOStructuredAddress *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOStructuredAddress *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setAddressHint:v17];
      }
      if (a3) {
        v19 = @"placeNameHint";
      }
      else {
        v19 = @"place_name_hint";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v21 = (void *)[v20 copy];
        [a1 setPlaceNameHint:v21];
      }
      if (a3) {
        int v22 = @"formattedAddressLineHint";
      }
      else {
        int v22 = @"formatted_address_line_hint";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v41 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v30 = objc_msgSend(v29, "copy", (void)v40);
                [a1 addFormattedAddressLineHint:v30];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v26);
        }
      }
      if (a3) {
        v31 = @"placeTypeHint";
      }
      else {
        v31 = @"place_type_hint";
      }
      id v32 = objc_msgSend(v5, "objectForKeyedSubscript:", v31, (void)v40);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = v32;
        if ([v33 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
        {
          uint64_t v34 = 0;
        }
        else if ([v33 isEqualToString:@"COUNTRY"])
        {
          uint64_t v34 = 1;
        }
        else if ([v33 isEqualToString:@"ADMINISTRATIVE_AREA"])
        {
          uint64_t v34 = 2;
        }
        else if ([v33 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
        {
          uint64_t v34 = 4;
        }
        else if ([v33 isEqualToString:@"LOCALITY"])
        {
          uint64_t v34 = 16;
        }
        else if ([v33 isEqualToString:@"TIME_ZONE"])
        {
          uint64_t v34 = 35;
        }
        else if ([v33 isEqualToString:@"SUB_LOCALITY"])
        {
          uint64_t v34 = 43;
        }
        else if ([v33 isEqualToString:@"OCEAN"])
        {
          uint64_t v34 = 44;
        }
        else if ([v33 isEqualToString:@"AOI"])
        {
          uint64_t v34 = 45;
        }
        else if ([v33 isEqualToString:@"INLAND_WATER"])
        {
          uint64_t v34 = 46;
        }
        else if ([v33 isEqualToString:@"BUSINESS"])
        {
          uint64_t v34 = 47;
        }
        else if ([v33 isEqualToString:@"ISLAND"])
        {
          uint64_t v34 = 48;
        }
        else if ([v33 isEqualToString:@"STREET"])
        {
          uint64_t v34 = 49;
        }
        else if ([v33 isEqualToString:@"ADMIN"])
        {
          uint64_t v34 = 50;
        }
        else if ([v33 isEqualToString:@"POSTAL"])
        {
          uint64_t v34 = 51;
        }
        else if ([v33 isEqualToString:@"INTERSECTION"])
        {
          uint64_t v34 = 54;
        }
        else if ([v33 isEqualToString:@"BUILDING"])
        {
          uint64_t v34 = 55;
        }
        else if ([v33 isEqualToString:@"ADDRESS"])
        {
          uint64_t v34 = 57;
        }
        else if ([v33 isEqualToString:@"CONTINENT"])
        {
          uint64_t v34 = 61;
        }
        else if ([v33 isEqualToString:@"REGION"])
        {
          uint64_t v34 = 63;
        }
        else if ([v33 isEqualToString:@"DIVISION"])
        {
          uint64_t v34 = 64;
        }
        else if ([v33 isEqualToString:@"PHYSICAL_FEATURE"])
        {
          uint64_t v34 = 65;
        }
        else
        {
          uint64_t v34 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_98;
        }
        uint64_t v34 = [v32 intValue];
      }
      [a1 setPlaceTypeHint:v34];
LABEL_98:

      if (a3) {
        v35 = @"addressGeocodeAccuracyHint";
      }
      else {
        v35 = @"address_geocode_accuracy_hint";
      }
      id v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = v36;
        if ([v37 isEqualToString:@"POINT"])
        {
          uint64_t v38 = 0;
        }
        else if ([v37 isEqualToString:@"INTERPOLATION"])
        {
          uint64_t v38 = 1;
        }
        else if ([v37 isEqualToString:@"APPROXIMATE"])
        {
          uint64_t v38 = 2;
        }
        else if ([v37 isEqualToString:@"POSTAL_ZIP"])
        {
          uint64_t v38 = 3;
        }
        else if ([v37 isEqualToString:@"PARCEL"])
        {
          uint64_t v38 = 4;
        }
        else if ([v37 isEqualToString:@"SUBPREMISE"])
        {
          uint64_t v38 = 5;
        }
        else
        {
          uint64_t v38 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_119:

          goto LABEL_120;
        }
        uint64_t v38 = [v36 intValue];
      }
      [a1 setAddressGeocodeAccuracyHint:v38];
      goto LABEL_119;
    }
  }
LABEL_120:

  return a1;
}

- (GEOWaypointID)initWithJSON:(id)a3
{
  return (GEOWaypointID *)-[GEOWaypointID _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3558;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3559;
    }
    GEOWaypointIDReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_locationHint readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointIDIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointIDReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3E0) == 0))
  {
    uint64_t v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWaypointID *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_locationHint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressHint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeNameHint) {
      PBDataWriterWriteStringField();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_formattedAddressLineHints;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    __int16 v11 = (__int16)self->_flags;
    if ((v11 & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 v11 = (__int16)self->_flags;
    }
    if ((v11 & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOWaypointID _readLocationHint]((uint64_t)self);
  locationHint = self->_locationHint;

  return [(GEOLatLng *)locationHint hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOWaypointID *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    v10[6] = self->_muid;
    *((_WORD *)v10 + 46) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v10[8] = self->_resultProviderId;
    *((_WORD *)v10 + 46) |= 2u;
  }
  if (self->_locationHint) {
    objc_msgSend(v10, "setLocationHint:");
  }
  if (self->_addressHint) {
    objc_msgSend(v10, "setAddressHint:");
  }
  if (self->_placeNameHint) {
    objc_msgSend(v10, "setPlaceNameHint:");
  }
  if ([(GEOWaypointID *)self formattedAddressLineHintsCount])
  {
    [v10 clearFormattedAddressLineHints];
    unint64_t v5 = [(GEOWaypointID *)self formattedAddressLineHintsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOWaypointID *)self formattedAddressLineHintAtIndex:i];
        [v10 addFormattedAddressLineHint:v8];
      }
    }
  }
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 8) != 0)
  {
    *((_DWORD *)v10 + 22) = self->_placeTypeHint;
    *((_WORD *)v10 + 46) |= 8u;
    __int16 v9 = (__int16)self->_flags;
  }
  if ((v9 & 4) != 0)
  {
    *((_DWORD *)v10 + 21) = self->_addressGeocodeAccuracyHint;
    *((_WORD *)v10 + 46) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWaypointIDReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWaypointID *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 48) = self->_muid;
    *(_WORD *)(v5 + 92) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 64) = self->_resultProviderId;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  id v10 = [(GEOLatLng *)self->_locationHint copyWithZone:a3];
  __int16 v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(GEOStructuredAddress *)self->_addressHint copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_placeNameHint copyWithZone:a3];
  long long v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v16 = self->_formattedAddressLineHints;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v5 addFormattedAddressLineHint:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  __int16 v21 = (__int16)self->_flags;
  if ((v21 & 8) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_placeTypeHint;
    *(_WORD *)(v5 + 92) |= 8u;
    __int16 v21 = (__int16)self->_flags;
  }
  if ((v21 & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_addressGeocodeAccuracyHint;
    *(_WORD *)(v5 + 92) |= 4u;
  }
  int v22 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v22;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEOWaypointID *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 46);
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_muid != *((void *)v4 + 6)) {
      goto LABEL_29;
    }
  }
  else if (v6)
  {
LABEL_29:
    BOOL v13 = 0;
    goto LABEL_30;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_resultProviderId != *((void *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_29;
  }
  locationHint = self->_locationHint;
  if ((unint64_t)locationHint | *((void *)v4 + 5) && !-[GEOLatLng isEqual:](locationHint, "isEqual:")) {
    goto LABEL_29;
  }
  addressHint = self->_addressHint;
  if ((unint64_t)addressHint | *((void *)v4 + 3))
  {
    if (!-[GEOStructuredAddress isEqual:](addressHint, "isEqual:")) {
      goto LABEL_29;
    }
  }
  placeNameHint = self->_placeNameHint;
  if ((unint64_t)placeNameHint | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](placeNameHint, "isEqual:")) {
      goto LABEL_29;
    }
  }
  formattedAddressLineHints = self->_formattedAddressLineHints;
  if ((unint64_t)formattedAddressLineHints | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](formattedAddressLineHints, "isEqual:")) {
      goto LABEL_29;
    }
  }
  __int16 v11 = (__int16)self->_flags;
  __int16 v12 = *((_WORD *)v4 + 46);
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_placeTypeHint != *((_DWORD *)v4 + 22)) {
      goto LABEL_29;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_29;
  }
  BOOL v13 = (v12 & 4) == 0;
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_addressGeocodeAccuracyHint != *((_DWORD *)v4 + 21)) {
      goto LABEL_29;
    }
    BOOL v13 = 1;
  }
LABEL_30:

  return v13;
}

- (unint64_t)hash
{
  [(GEOWaypointID *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    unint64_t v4 = 2654435761u * self->_muid;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_resultProviderId;
      goto LABEL_6;
    }
  }
  unint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = [(GEOLatLng *)self->_locationHint hash];
  unint64_t v7 = [(GEOStructuredAddress *)self->_addressHint hash];
  NSUInteger v8 = [(NSString *)self->_placeNameHint hash];
  uint64_t v9 = [(NSMutableArray *)self->_formattedAddressLineHints hash];
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_placeTypeHint;
    if ((v10 & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v12 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((v10 & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v12 = 2654435761 * self->_addressGeocodeAccuracyHint;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 46);
  if (v5)
  {
    self->_muid = *((void *)v4 + 6);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v5 = *((_WORD *)v4 + 46);
  }
  if ((v5 & 2) != 0)
  {
    self->_resultProviderId = *((void *)v4 + 8);
    *(_WORD *)&self->_flags |= 2u;
  }
  locationHint = self->_locationHint;
  uint64_t v7 = *((void *)v4 + 5);
  if (locationHint)
  {
    if (v7) {
      -[GEOLatLng mergeFrom:](locationHint, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOWaypointID setLocationHint:](self, "setLocationHint:");
  }
  addressHint = self->_addressHint;
  uint64_t v9 = *((void *)v4 + 3);
  if (addressHint)
  {
    if (v9) {
      -[GEOStructuredAddress mergeFrom:](addressHint, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOWaypointID setAddressHint:](self, "setAddressHint:");
  }
  if (*((void *)v4 + 7)) {
    -[GEOWaypointID setPlaceNameHint:](self, "setPlaceNameHint:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOWaypointID addFormattedAddressLineHint:](self, "addFormattedAddressLineHint:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  __int16 v15 = *((_WORD *)v4 + 46);
  if ((v15 & 8) != 0)
  {
    self->_placeTypeHint = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v15 = *((_WORD *)v4 + 46);
  }
  if ((v15 & 4) != 0)
  {
    self->_addressGeocodeAccuracyHint = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOWaypointIDReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3563);
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
  *(_WORD *)&self->_flags |= 0x210u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOWaypointID *)self readAll:0];
    [(GEOLatLng *)self->_locationHint clearUnknownFields:1];
    addressHint = self->_addressHint;
    [(GEOStructuredAddress *)addressHint clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeNameHint, 0);
  objc_storeStrong((id *)&self->_locationHint, 0);
  objc_storeStrong((id *)&self->_formattedAddressLineHints, 0);
  objc_storeStrong((id *)&self->_addressHint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end