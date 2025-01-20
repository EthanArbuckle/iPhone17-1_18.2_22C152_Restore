@interface GEOPDAmenityValue
+ (BOOL)isValid:(id)a3;
+ (Class)nameType;
- (BOOL)amenityPresent;
- (BOOL)hasAmenityId;
- (BOOL)hasAmenityPresent;
- (BOOL)hasAmenityType;
- (BOOL)hasSymbolImageName;
- (BOOL)hasVendorId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAmenityValue)init;
- (GEOPDAmenityValue)initWithData:(id)a3;
- (GEOPDAmenityValue)initWithDictionary:(id)a3;
- (GEOPDAmenityValue)initWithJSON:(id)a3;
- (NSMutableArray)names;
- (NSString)amenityId;
- (NSString)symbolImageName;
- (NSString)vendorId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)amenityTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayTitle;
- (id)jsonRepresentation;
- (id)nameAtIndex:(unint64_t)a3;
- (int)StringAsAmenityType:(id)a3;
- (int)amenityType;
- (unint64_t)hash;
- (unint64_t)namesCount;
- (void)_addNoFlagsName:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAmenityId;
- (void)_readNames;
- (void)_readSymbolImageName;
- (void)_readVendorId;
- (void)addName:(id)a3;
- (void)clearNames;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAmenityId:(id)a3;
- (void)setAmenityPresent:(BOOL)a3;
- (void)setAmenityType:(int)a3;
- (void)setHasAmenityPresent:(BOOL)a3;
- (void)setHasAmenityType:(BOOL)a3;
- (void)setNames:(id)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setVendorId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAmenityValue

- (id)displayTitle
{
  v2 = [(GEOPDAmenityValue *)self names];
  v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (GEOPDAmenityValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAmenityValue;
  v2 = [(GEOPDAmenityValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAmenityValue)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAmenityValue;
  v3 = [(GEOPDAmenityValue *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)amenityType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_amenityType;
  }
  else {
    return 0;
  }
}

- (void)setAmenityType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_amenityType = a3;
}

- (void)setHasAmenityType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasAmenityType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)amenityTypeAsString:(int)a3
{
  if (a3 >= 0x3F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E34A0[a3];
  }

  return v3;
}

- (int)StringAsAmenityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACCEPTS_CREDIT_CARDS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WHEELCHAIR_ACCESSIBLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GOOD_FOR_KIDS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HAS_DELIVERY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ALLOWS_PETS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OPEN_24_HOURS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HAS_FITNESS_CENTER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"HAS_FREE_BREAKFAST"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HAS_SPA"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"HAS_SWIMMING_POOL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HAS_WIFI"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"HAS_FREE_WIFI"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"HAS_FREE_INTERNET"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"HAS_SHUTTLE_BUS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"HAS_AIRPORT_TRANSPORTATION"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"HAS_PARKING"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"HAS_PARKING_GARAGE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"HAS_FREE_PARKING"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SMOKING_ALLOWED"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TAKES_RESERVATIONS"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ACCEPTS_APPLE_PAY"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"HAS_GENDER_NEUTRAL_RESTROOM"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"HAS_TAKE_OUT"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"BY_APPOINTMENT_ONLY"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"GOOD_FOR_GROUPS"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"HAS_SCENIC_VIEW"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"HAS_OUTDOOR_SEATING"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"HAS_WATERFRONT"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"HAS_BEACHFRONT"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ALLOWS_DOGS"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"HAS_DRIVE_THROUGH"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"HAS_FULL_BAR"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"HAS_VEGETARIAN_OPTIONS"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"HAS_VEGAN_OPTIONS"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"HAS_GLUTENFREE_OPTIONS"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"HAS_SOY_FREE_OPTIONS"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"HAS_HALAL_OPTIONS"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"HAS_DAIRY_FREE_OPTIONS"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"HAS_MEETING_ROOMS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"NON_SMOKING_THROUGHOUT"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"HAS_NON_SMOKING_ROOMS"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"HAS_FAMILY_ROOMS"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"HAS_BAR_LOUNGE"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"HAS_RESTAURANT"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"HAS_LAUNDRY_SERVICE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"HAS_LARGE_TABLES"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"HAS_PRIVATE_ROOMS"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"HAS_HIGH_CHAIRS"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"HAS_SELF_ORDERING_ONLINE"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"HAS_ONLINE_QUEUING"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"HAS_SEATING_FOR_COUPLES"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"HAS_CHILDREN_DISCOUNT"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"HAS_IMAX"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"DEVICE_TRADE_IN_FOR_CREDIT"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"FREE_TODAY_AT_APPLE_SESSIONS"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"SMALL_BUSINESS_SOLUTIONS"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"HARDWARE_REPAIRS_AND_SUPPORT"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"GENIUS_BAR_WALK_INS"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"APPLE_AUTHORIZED_SERVICE_PROVIDER"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"OFFERS_SAME_DAY_IPHONE_SCREEN_REPAIR"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"WALK_IN_REPAIRS"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"APPLE_AUTHORIZED_DROPOFF_LOCATION"])
  {
    int v4 = 62;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)amenityPresent
{
  return self->_amenityPresent;
}

- (void)setAmenityPresent:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_amenityPresent = a3;
}

- (void)setHasAmenityPresent:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAmenityPresent
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readVendorId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAmenityValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVendorId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasVendorId
{
  return self->_vendorId != 0;
}

- (NSString)vendorId
{
  -[GEOPDAmenityValue _readVendorId]((uint64_t)self);
  vendorId = self->_vendorId;

  return vendorId;
}

- (void)setVendorId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_vendorId, a3);
}

- (void)_readAmenityId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAmenityValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAmenityId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAmenityId
{
  return self->_amenityId != 0;
}

- (NSString)amenityId
{
  -[GEOPDAmenityValue _readAmenityId]((uint64_t)self);
  amenityId = self->_amenityId;

  return amenityId;
}

- (void)setAmenityId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_amenityId, a3);
}

- (void)_readNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAmenityValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNames_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)names
{
  -[GEOPDAmenityValue _readNames]((uint64_t)self);
  names = self->_names;

  return names;
}

- (void)setNames:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  names = self->_names;
  self->_names = v4;
}

- (void)clearNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  names = self->_names;

  [(NSMutableArray *)names removeAllObjects];
}

- (void)addName:(id)a3
{
  id v4 = a3;
  -[GEOPDAmenityValue _readNames]((uint64_t)self);
  -[GEOPDAmenityValue _addNoFlagsName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsName:(uint64_t)a1
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

- (unint64_t)namesCount
{
  -[GEOPDAmenityValue _readNames]((uint64_t)self);
  names = self->_names;

  return [(NSMutableArray *)names count];
}

- (id)nameAtIndex:(unint64_t)a3
{
  -[GEOPDAmenityValue _readNames]((uint64_t)self);
  names = self->_names;

  return (id)[(NSMutableArray *)names objectAtIndex:a3];
}

+ (Class)nameType
{
  return (Class)objc_opt_class();
}

- (void)_readSymbolImageName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAmenityValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSymbolImageName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSymbolImageName
{
  return self->_symbolImageName != 0;
}

- (NSString)symbolImageName
{
  -[GEOPDAmenityValue _readSymbolImageName]((uint64_t)self);
  symbolImageName = self->_symbolImageName;

  return symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_symbolImageName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAmenityValue;
  id v4 = [(GEOPDAmenityValue *)&v8 description];
  id v5 = [(GEOPDAmenityValue *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAmenityValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 76);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 68);
      if (v6 >= 0x3F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = off_1E53E34A0[v6];
      }
      if (a2) {
        objc_super v8 = @"amenityType";
      }
      else {
        objc_super v8 = @"amenity_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 76);
    }
    if ((v5 & 2) != 0)
    {
      v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
      if (a2) {
        v10 = @"amenityPresent";
      }
      else {
        v10 = @"amenity_present";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 vendorId];
    if (v11)
    {
      if (a2) {
        v12 = @"vendorId";
      }
      else {
        v12 = @"vendor_id";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = [(id)a1 amenityId];
    if (v13)
    {
      if (a2) {
        v14 = @"amenityId";
      }
      else {
        v14 = @"amenity_id";
      }
      [v4 setObject:v13 forKey:v14];
    }

    if ([*(id *)(a1 + 32) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v15 addObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v18);
      }

      [v4 setObject:v15 forKey:@"name"];
    }
    v23 = [(id)a1 symbolImageName];
    if (v23)
    {
      if (a2) {
        v24 = @"symbolImageName";
      }
      else {
        v24 = @"symbol_image_name";
      }
      [v4 setObject:v23 forKey:v24];
    }

    v25 = *(void **)(a1 + 16);
    if (v25)
    {
      v26 = [v25 dictionaryRepresentation];
      v27 = v26;
      if (a2)
      {
        v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __47__GEOPDAmenityValue__dictionaryRepresentation___block_invoke;
        v32[3] = &unk_1E53D8860;
        id v29 = v28;
        id v33 = v29;
        [v27 enumerateKeysAndObjectsUsingBlock:v32];
        id v30 = v29;

        v27 = v30;
      }
      [v4 setObject:v27 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAmenityValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDAmenityValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAmenityValue)initWithDictionary:(id)a3
{
  return (GEOPDAmenityValue *)-[GEOPDAmenityValue _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_173;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_173;
  }
  if (a3) {
    uint64_t v6 = @"amenityType";
  }
  else {
    uint64_t v6 = @"amenity_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"ACCEPTS_CREDIT_CARDS"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"WHEELCHAIR_ACCESSIBLE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"GOOD_FOR_KIDS"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"HAS_DELIVERY"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"ALLOWS_PETS"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"OPEN_24_HOURS"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"HAS_FITNESS_CENTER"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"HAS_FREE_BREAKFAST"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"HAS_SPA"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"HAS_SWIMMING_POOL"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"HAS_WIFI"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"HAS_FREE_WIFI"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"HAS_FREE_INTERNET"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"HAS_SHUTTLE_BUS"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"HAS_AIRPORT_TRANSPORTATION"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"HAS_PARKING"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"HAS_PARKING_GARAGE"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"HAS_FREE_PARKING"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"SMOKING_ALLOWED"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"TAKES_RESERVATIONS"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"ACCEPTS_APPLE_PAY"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"HAS_GENDER_NEUTRAL_RESTROOM"])
    {
      uint64_t v9 = 22;
    }
    else if ([v8 isEqualToString:@"HAS_TAKE_OUT"])
    {
      uint64_t v9 = 23;
    }
    else if ([v8 isEqualToString:@"BY_APPOINTMENT_ONLY"])
    {
      uint64_t v9 = 24;
    }
    else if ([v8 isEqualToString:@"GOOD_FOR_GROUPS"])
    {
      uint64_t v9 = 25;
    }
    else if ([v8 isEqualToString:@"HAS_SCENIC_VIEW"])
    {
      uint64_t v9 = 26;
    }
    else if ([v8 isEqualToString:@"HAS_OUTDOOR_SEATING"])
    {
      uint64_t v9 = 27;
    }
    else if ([v8 isEqualToString:@"HAS_WATERFRONT"])
    {
      uint64_t v9 = 28;
    }
    else if ([v8 isEqualToString:@"HAS_BEACHFRONT"])
    {
      uint64_t v9 = 29;
    }
    else if ([v8 isEqualToString:@"ALLOWS_DOGS"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"HAS_DRIVE_THROUGH"])
    {
      uint64_t v9 = 31;
    }
    else if ([v8 isEqualToString:@"HAS_FULL_BAR"])
    {
      uint64_t v9 = 32;
    }
    else if ([v8 isEqualToString:@"HAS_VEGETARIAN_OPTIONS"])
    {
      uint64_t v9 = 33;
    }
    else if ([v8 isEqualToString:@"HAS_VEGAN_OPTIONS"])
    {
      uint64_t v9 = 34;
    }
    else if ([v8 isEqualToString:@"HAS_GLUTENFREE_OPTIONS"])
    {
      uint64_t v9 = 35;
    }
    else if ([v8 isEqualToString:@"HAS_SOY_FREE_OPTIONS"])
    {
      uint64_t v9 = 36;
    }
    else if ([v8 isEqualToString:@"HAS_HALAL_OPTIONS"])
    {
      uint64_t v9 = 37;
    }
    else if ([v8 isEqualToString:@"HAS_DAIRY_FREE_OPTIONS"])
    {
      uint64_t v9 = 38;
    }
    else if ([v8 isEqualToString:@"HAS_MEETING_ROOMS"])
    {
      uint64_t v9 = 39;
    }
    else if ([v8 isEqualToString:@"NON_SMOKING_THROUGHOUT"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"HAS_NON_SMOKING_ROOMS"])
    {
      uint64_t v9 = 41;
    }
    else if ([v8 isEqualToString:@"HAS_FAMILY_ROOMS"])
    {
      uint64_t v9 = 42;
    }
    else if ([v8 isEqualToString:@"HAS_BAR_LOUNGE"])
    {
      uint64_t v9 = 43;
    }
    else if ([v8 isEqualToString:@"HAS_RESTAURANT"])
    {
      uint64_t v9 = 44;
    }
    else if ([v8 isEqualToString:@"HAS_LAUNDRY_SERVICE"])
    {
      uint64_t v9 = 45;
    }
    else if ([v8 isEqualToString:@"HAS_LARGE_TABLES"])
    {
      uint64_t v9 = 46;
    }
    else if ([v8 isEqualToString:@"HAS_PRIVATE_ROOMS"])
    {
      uint64_t v9 = 47;
    }
    else if ([v8 isEqualToString:@"HAS_HIGH_CHAIRS"])
    {
      uint64_t v9 = 48;
    }
    else if ([v8 isEqualToString:@"HAS_SELF_ORDERING_ONLINE"])
    {
      uint64_t v9 = 49;
    }
    else if ([v8 isEqualToString:@"HAS_ONLINE_QUEUING"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"HAS_SEATING_FOR_COUPLES"])
    {
      uint64_t v9 = 51;
    }
    else if ([v8 isEqualToString:@"HAS_CHILDREN_DISCOUNT"])
    {
      uint64_t v9 = 52;
    }
    else if ([v8 isEqualToString:@"HAS_IMAX"])
    {
      uint64_t v9 = 53;
    }
    else if ([v8 isEqualToString:@"DEVICE_TRADE_IN_FOR_CREDIT"])
    {
      uint64_t v9 = 54;
    }
    else if ([v8 isEqualToString:@"FREE_TODAY_AT_APPLE_SESSIONS"])
    {
      uint64_t v9 = 55;
    }
    else if ([v8 isEqualToString:@"SMALL_BUSINESS_SOLUTIONS"])
    {
      uint64_t v9 = 56;
    }
    else if ([v8 isEqualToString:@"HARDWARE_REPAIRS_AND_SUPPORT"])
    {
      uint64_t v9 = 57;
    }
    else if ([v8 isEqualToString:@"GENIUS_BAR_WALK_INS"])
    {
      uint64_t v9 = 58;
    }
    else if ([v8 isEqualToString:@"APPLE_AUTHORIZED_SERVICE_PROVIDER"])
    {
      uint64_t v9 = 59;
    }
    else if ([v8 isEqualToString:@"OFFERS_SAME_DAY_IPHONE_SCREEN_REPAIR"])
    {
      uint64_t v9 = 60;
    }
    else if ([v8 isEqualToString:@"WALK_IN_REPAIRS"])
    {
      uint64_t v9 = 61;
    }
    else if ([v8 isEqualToString:@"APPLE_AUTHORIZED_DROPOFF_LOCATION"])
    {
      uint64_t v9 = 62;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_137;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_137:
    [a1 setAmenityType:v9];
  }

  if (a3) {
    id v10 = @"amenityPresent";
  }
  else {
    id v10 = @"amenity_present";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAmenityPresent:", objc_msgSend(v11, "BOOLValue"));
  }

  if (a3) {
    v12 = @"vendorId";
  }
  else {
    v12 = @"vendor_id";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = (void *)[v13 copy];
    [a1 setVendorId:v14];
  }
  if (a3) {
    v15 = @"amenityId";
  }
  else {
    v15 = @"amenity_id";
  }
  id v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = (void *)[v16 copy];
    [a1 setAmenityId:v17];
  }
  uint64_t v18 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v5;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v25 = [GEOLocalizedString alloc];
            if (a3) {
              uint64_t v26 = [(GEOLocalizedString *)v25 initWithJSON:v24];
            }
            else {
              uint64_t v26 = [(GEOLocalizedString *)v25 initWithDictionary:v24];
            }
            v27 = (void *)v26;
            [a1 addName:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v21);
    }

    id v5 = v32;
  }

  if (a3) {
    v28 = @"symbolImageName";
  }
  else {
    v28 = @"symbol_image_name";
  }
  id v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = (void *)[v29 copy];
    [a1 setSymbolImageName:v30];
  }
LABEL_173:

  return a1;
}

- (GEOPDAmenityValue)initWithJSON:(id)a3
{
  return (GEOPDAmenityValue *)-[GEOPDAmenityValue _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_416_0;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_417_0;
    }
    GEOPDAmenityValueReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDAmenityValueCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAmenityValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAmenityValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDAmenityValue *)self readAll:0];
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_vendorId) {
      PBDataWriterWriteStringField();
    }
    if (self->_amenityId) {
      PBDataWriterWriteStringField();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_names;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if (self->_symbolImageName) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOPDAmenityValue *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 14) = self->_readerMarkPos;
  *((_DWORD *)v9 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v9 + 17) = self->_amenityType;
    *((unsigned char *)v9 + 76) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v9 + 72) = self->_amenityPresent;
    *((unsigned char *)v9 + 76) |= 2u;
  }
  if (self->_vendorId) {
    objc_msgSend(v9, "setVendorId:");
  }
  if (self->_amenityId) {
    objc_msgSend(v9, "setAmenityId:");
  }
  if ([(GEOPDAmenityValue *)self namesCount])
  {
    [v9 clearNames];
    unint64_t v5 = [(GEOPDAmenityValue *)self namesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOPDAmenityValue *)self nameAtIndex:i];
        [v9 addName:v8];
      }
    }
  }
  if (self->_symbolImageName) {
    objc_msgSend(v9, "setSymbolImageName:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAmenityValueReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAmenityValue *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 68) = self->_amenityType;
    *(unsigned char *)(v5 + 76) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_amenityPresent;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v10 = [(NSString *)self->_vendorId copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_amenityId copyWithZone:a3];
  long long v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v14 = self->_names;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        [(id)v5 addName:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(NSString *)self->_symbolImageName copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  uint64_t v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOPDAmenityValue *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_amenityType != *((_DWORD *)v4 + 17)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) != 0)
    {
      if (self->_amenityPresent)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_23;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_15;
      }
    }
LABEL_23:
    char v9 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 76) & 2) != 0) {
    goto LABEL_23;
  }
LABEL_15:
  vendorId = self->_vendorId;
  if ((unint64_t)vendorId | *((void *)v4 + 6) && !-[NSString isEqual:](vendorId, "isEqual:")) {
    goto LABEL_23;
  }
  amenityId = self->_amenityId;
  if ((unint64_t)amenityId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](amenityId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  names = self->_names;
  if ((unint64_t)names | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](names, "isEqual:")) {
      goto LABEL_23;
    }
  }
  symbolImageName = self->_symbolImageName;
  if ((unint64_t)symbolImageName | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](symbolImageName, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  [(GEOPDAmenityValue *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_amenityType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_amenityPresent;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_vendorId hash];
  NSUInteger v6 = [(NSString *)self->_amenityId hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSMutableArray *)self->_names hash];
  return v7 ^ [(NSString *)self->_symbolImageName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 76);
  if (v5)
  {
    self->_amenityType = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 76);
  }
  if ((v5 & 2) != 0)
  {
    self->_amenityPresent = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 6)) {
    -[GEOPDAmenityValue setVendorId:](self, "setVendorId:");
  }
  if (*((void *)v4 + 3)) {
    -[GEOPDAmenityValue setAmenityId:](self, "setAmenityId:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOPDAmenityValue addName:](self, "addName:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 5)) {
    -[GEOPDAmenityValue setSymbolImageName:](self, "setSymbolImageName:");
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
      char v5 = reader;
      objc_sync_enter(v5);
      GEOPDAmenityValueReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_421);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAmenityValue *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_names;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_amenityId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end