@interface GEORPAmenityCorrections
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAmenityCorrections)init;
- (GEORPAmenityCorrections)initWithData:(id)a3;
- (GEORPAmenityCorrections)initWithDictionary:(id)a3;
- (GEORPAmenityCorrections)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)addedAmenitiesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)removedAmenitiesAsString:(int)a3;
- (int)StringAsAddedAmenities:(id)a3;
- (int)StringAsRemovedAmenities:(id)a3;
- (int)addedAmenities;
- (int)addedAmenitiesAtIndex:(unint64_t)a3;
- (int)removedAmenities;
- (int)removedAmenitiesAtIndex:(unint64_t)a3;
- (unint64_t)addedAmenitiesCount;
- (unint64_t)hash;
- (unint64_t)removedAmenitiesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddedAmenities;
- (void)_readRemovedAmenities;
- (void)addAddedAmenities:(int)a3;
- (void)addRemovedAmenities:(int)a3;
- (void)clearAddedAmenities;
- (void)clearRemovedAmenities;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddedAmenities:(int *)a3 count:(unint64_t)a4;
- (void)setRemovedAmenities:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPAmenityCorrections

- (GEORPAmenityCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPAmenityCorrections;
  v2 = [(GEORPAmenityCorrections *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAmenityCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPAmenityCorrections;
  v3 = [(GEORPAmenityCorrections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPAmenityCorrections;
  [(GEORPAmenityCorrections *)&v3 dealloc];
}

- (void)_readAddedAmenities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAmenityCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddedAmenities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)addedAmenitiesCount
{
  return self->_addedAmenities.count;
}

- (int)addedAmenities
{
  return self->_addedAmenities.list;
}

- (void)clearAddedAmenities
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  PBRepeatedInt32Clear();
}

- (void)addAddedAmenities:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (int)addedAmenitiesAtIndex:(unint64_t)a3
{
  -[GEORPAmenityCorrections _readAddedAmenities]((uint64_t)self);
  p_addedAmenities = &self->_addedAmenities;
  unint64_t count = self->_addedAmenities.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_addedAmenities->list[a3];
}

- (void)setAddedAmenities:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  MEMORY[0x1F4147390](&self->_addedAmenities, a3, a4);
}

- (id)addedAmenitiesAsString:(int)a3
{
  if (a3 >= 0x3F)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = (void *)*((void *)&off_1E53EC4B0 + a3);
  }

  return v3;
}

- (int)StringAsAddedAmenities:(id)a3
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

- (void)_readRemovedAmenities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAmenityCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRemovedAmenities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)removedAmenitiesCount
{
  return self->_removedAmenities.count;
}

- (int)removedAmenities
{
  return self->_removedAmenities.list;
}

- (void)clearRemovedAmenities
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  PBRepeatedInt32Clear();
}

- (void)addRemovedAmenities:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (int)removedAmenitiesAtIndex:(unint64_t)a3
{
  -[GEORPAmenityCorrections _readRemovedAmenities]((uint64_t)self);
  p_removedAmenities = &self->_removedAmenities;
  unint64_t count = self->_removedAmenities.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_removedAmenities->list[a3];
}

- (void)setRemovedAmenities:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  MEMORY[0x1F4147390](&self->_removedAmenities, a3, a4);
}

- (id)removedAmenitiesAsString:(int)a3
{
  if (a3 >= 0x3F)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = (void *)*((void *)&off_1E53EC4B0 + a3);
  }

  return v3;
}

- (int)StringAsRemovedAmenities:(id)a3
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPAmenityCorrections;
  int v4 = [(GEORPAmenityCorrections *)&v8 description];
  v5 = [(GEORPAmenityCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAmenityCorrections _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[3])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = a1 + 2;
      if (a1[3])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 0x3F)
          {
            v9 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
          }
          else
          {
            v9 = (void *)*((void *)&off_1E53EC4B0 + v8);
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = a1 + 2;
        }
        while (v7 < a1[3]);
      }
      if (a2) {
        v10 = @"addedAmenities";
      }
      else {
        v10 = @"added_amenities";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if (a1[6])
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v12 = a1 + 5;
      if (a1[6])
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(int *)(*v12 + 4 * v13);
          if (v14 >= 0x3F)
          {
            v15 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
          }
          else
          {
            v15 = (void *)*((void *)&off_1E53EC4B0 + v14);
          }
          [v11 addObject:v15];

          ++v13;
          v12 = a1 + 5;
        }
        while (v13 < a1[6]);
      }
      if (a2) {
        v16 = @"removedAmenities";
      }
      else {
        v16 = @"removed_amenities";
      }
      [v4 setObject:v11 forKey:v16];
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
  return -[GEORPAmenityCorrections _dictionaryRepresentation:](self, 1);
}

- (GEORPAmenityCorrections)initWithDictionary:(id)a3
{
  return (GEORPAmenityCorrections *)-[GEORPAmenityCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        unint64_t v7 = @"addedAmenities";
      }
      else {
        unint64_t v7 = @"added_amenities";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      id v31 = v5;
      if (objc_opt_isKindOfClass())
      {
        int v29 = a3;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v28 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (!v10) {
          goto LABEL_146;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v37;
        while (1)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              if ([v15 isEqualToString:@"UNKNOWN"])
              {
                uint64_t v16 = 0;
              }
              else if ([v15 isEqualToString:@"ACCEPTS_CREDIT_CARDS"])
              {
                uint64_t v16 = 1;
              }
              else if ([v15 isEqualToString:@"WHEELCHAIR_ACCESSIBLE"])
              {
                uint64_t v16 = 2;
              }
              else if ([v15 isEqualToString:@"GOOD_FOR_KIDS"])
              {
                uint64_t v16 = 3;
              }
              else if ([v15 isEqualToString:@"HAS_DELIVERY"])
              {
                uint64_t v16 = 4;
              }
              else if ([v15 isEqualToString:@"ALLOWS_PETS"])
              {
                uint64_t v16 = 5;
              }
              else if ([v15 isEqualToString:@"OPEN_24_HOURS"])
              {
                uint64_t v16 = 6;
              }
              else if ([v15 isEqualToString:@"HAS_FITNESS_CENTER"])
              {
                uint64_t v16 = 7;
              }
              else if ([v15 isEqualToString:@"HAS_FREE_BREAKFAST"])
              {
                uint64_t v16 = 8;
              }
              else if ([v15 isEqualToString:@"HAS_SPA"])
              {
                uint64_t v16 = 9;
              }
              else if ([v15 isEqualToString:@"HAS_SWIMMING_POOL"])
              {
                uint64_t v16 = 10;
              }
              else if ([v15 isEqualToString:@"HAS_WIFI"])
              {
                uint64_t v16 = 11;
              }
              else if ([v15 isEqualToString:@"HAS_FREE_WIFI"])
              {
                uint64_t v16 = 12;
              }
              else if ([v15 isEqualToString:@"HAS_FREE_INTERNET"])
              {
                uint64_t v16 = 13;
              }
              else if ([v15 isEqualToString:@"HAS_SHUTTLE_BUS"])
              {
                uint64_t v16 = 14;
              }
              else if ([v15 isEqualToString:@"HAS_AIRPORT_TRANSPORTATION"])
              {
                uint64_t v16 = 15;
              }
              else if ([v15 isEqualToString:@"HAS_PARKING"])
              {
                uint64_t v16 = 16;
              }
              else if ([v15 isEqualToString:@"HAS_PARKING_GARAGE"])
              {
                uint64_t v16 = 17;
              }
              else if ([v15 isEqualToString:@"HAS_FREE_PARKING"])
              {
                uint64_t v16 = 18;
              }
              else if ([v15 isEqualToString:@"SMOKING_ALLOWED"])
              {
                uint64_t v16 = 19;
              }
              else if ([v15 isEqualToString:@"TAKES_RESERVATIONS"])
              {
                uint64_t v16 = 20;
              }
              else if ([v15 isEqualToString:@"ACCEPTS_APPLE_PAY"])
              {
                uint64_t v16 = 21;
              }
              else if ([v15 isEqualToString:@"HAS_GENDER_NEUTRAL_RESTROOM"])
              {
                uint64_t v16 = 22;
              }
              else if ([v15 isEqualToString:@"HAS_TAKE_OUT"])
              {
                uint64_t v16 = 23;
              }
              else if ([v15 isEqualToString:@"BY_APPOINTMENT_ONLY"])
              {
                uint64_t v16 = 24;
              }
              else if ([v15 isEqualToString:@"GOOD_FOR_GROUPS"])
              {
                uint64_t v16 = 25;
              }
              else if ([v15 isEqualToString:@"HAS_SCENIC_VIEW"])
              {
                uint64_t v16 = 26;
              }
              else if ([v15 isEqualToString:@"HAS_OUTDOOR_SEATING"])
              {
                uint64_t v16 = 27;
              }
              else if ([v15 isEqualToString:@"HAS_WATERFRONT"])
              {
                uint64_t v16 = 28;
              }
              else if ([v15 isEqualToString:@"HAS_BEACHFRONT"])
              {
                uint64_t v16 = 29;
              }
              else if ([v15 isEqualToString:@"ALLOWS_DOGS"])
              {
                uint64_t v16 = 30;
              }
              else if ([v15 isEqualToString:@"HAS_DRIVE_THROUGH"])
              {
                uint64_t v16 = 31;
              }
              else if ([v15 isEqualToString:@"HAS_FULL_BAR"])
              {
                uint64_t v16 = 32;
              }
              else if ([v15 isEqualToString:@"HAS_VEGETARIAN_OPTIONS"])
              {
                uint64_t v16 = 33;
              }
              else if ([v15 isEqualToString:@"HAS_VEGAN_OPTIONS"])
              {
                uint64_t v16 = 34;
              }
              else if ([v15 isEqualToString:@"HAS_GLUTENFREE_OPTIONS"])
              {
                uint64_t v16 = 35;
              }
              else if ([v15 isEqualToString:@"HAS_SOY_FREE_OPTIONS"])
              {
                uint64_t v16 = 36;
              }
              else if ([v15 isEqualToString:@"HAS_HALAL_OPTIONS"])
              {
                uint64_t v16 = 37;
              }
              else if ([v15 isEqualToString:@"HAS_DAIRY_FREE_OPTIONS"])
              {
                uint64_t v16 = 38;
              }
              else if ([v15 isEqualToString:@"HAS_MEETING_ROOMS"])
              {
                uint64_t v16 = 39;
              }
              else if ([v15 isEqualToString:@"NON_SMOKING_THROUGHOUT"])
              {
                uint64_t v16 = 40;
              }
              else if ([v15 isEqualToString:@"HAS_NON_SMOKING_ROOMS"])
              {
                uint64_t v16 = 41;
              }
              else if ([v15 isEqualToString:@"HAS_FAMILY_ROOMS"])
              {
                uint64_t v16 = 42;
              }
              else if ([v15 isEqualToString:@"HAS_BAR_LOUNGE"])
              {
                uint64_t v16 = 43;
              }
              else if ([v15 isEqualToString:@"HAS_RESTAURANT"])
              {
                uint64_t v16 = 44;
              }
              else if ([v15 isEqualToString:@"HAS_LAUNDRY_SERVICE"])
              {
                uint64_t v16 = 45;
              }
              else if ([v15 isEqualToString:@"HAS_LARGE_TABLES"])
              {
                uint64_t v16 = 46;
              }
              else if ([v15 isEqualToString:@"HAS_PRIVATE_ROOMS"])
              {
                uint64_t v16 = 47;
              }
              else if ([v15 isEqualToString:@"HAS_HIGH_CHAIRS"])
              {
                uint64_t v16 = 48;
              }
              else if ([v15 isEqualToString:@"HAS_SELF_ORDERING_ONLINE"])
              {
                uint64_t v16 = 49;
              }
              else if ([v15 isEqualToString:@"HAS_ONLINE_QUEUING"])
              {
                uint64_t v16 = 50;
              }
              else if ([v15 isEqualToString:@"HAS_SEATING_FOR_COUPLES"])
              {
                uint64_t v16 = 51;
              }
              else if ([v15 isEqualToString:@"HAS_CHILDREN_DISCOUNT"])
              {
                uint64_t v16 = 52;
              }
              else if ([v15 isEqualToString:@"HAS_IMAX"])
              {
                uint64_t v16 = 53;
              }
              else if ([v15 isEqualToString:@"DEVICE_TRADE_IN_FOR_CREDIT"])
              {
                uint64_t v16 = 54;
              }
              else if ([v15 isEqualToString:@"FREE_TODAY_AT_APPLE_SESSIONS"])
              {
                uint64_t v16 = 55;
              }
              else if ([v15 isEqualToString:@"SMALL_BUSINESS_SOLUTIONS"])
              {
                uint64_t v16 = 56;
              }
              else if ([v15 isEqualToString:@"HARDWARE_REPAIRS_AND_SUPPORT"])
              {
                uint64_t v16 = 57;
              }
              else if ([v15 isEqualToString:@"GENIUS_BAR_WALK_INS"])
              {
                uint64_t v16 = 58;
              }
              else if ([v15 isEqualToString:@"APPLE_AUTHORIZED_SERVICE_PROVIDER"])
              {
                uint64_t v16 = 59;
              }
              else if ([v15 isEqualToString:@"OFFERS_SAME_DAY_IPHONE_SCREEN_REPAIR"])
              {
                uint64_t v16 = 60;
              }
              else if ([v15 isEqualToString:@"WALK_IN_REPAIRS"])
              {
                uint64_t v16 = 61;
              }
              else if ([v15 isEqualToString:@"APPLE_AUTHORIZED_DROPOFF_LOCATION"])
              {
                uint64_t v16 = 62;
              }
              else
              {
                uint64_t v16 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_144;
              }
              uint64_t v16 = [v14 intValue];
            }
            [v6 addAddedAmenities:v16];
LABEL_144:
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (!v11)
          {
LABEL_146:

            id v5 = v31;
            a3 = v29;
            uint64_t v8 = v28;
            break;
          }
        }
      }

      if (a3) {
        v17 = @"removedAmenities";
      }
      else {
        v17 = @"removed_amenities";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v30 = v18;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (!v20) {
          goto LABEL_290;
        }
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v33;
        while (1)
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v32 + 1) + 8 * v23);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v25 = v24;
              if ([v25 isEqualToString:@"UNKNOWN"])
              {
                uint64_t v26 = 0;
              }
              else if ([v25 isEqualToString:@"ACCEPTS_CREDIT_CARDS"])
              {
                uint64_t v26 = 1;
              }
              else if ([v25 isEqualToString:@"WHEELCHAIR_ACCESSIBLE"])
              {
                uint64_t v26 = 2;
              }
              else if ([v25 isEqualToString:@"GOOD_FOR_KIDS"])
              {
                uint64_t v26 = 3;
              }
              else if ([v25 isEqualToString:@"HAS_DELIVERY"])
              {
                uint64_t v26 = 4;
              }
              else if ([v25 isEqualToString:@"ALLOWS_PETS"])
              {
                uint64_t v26 = 5;
              }
              else if ([v25 isEqualToString:@"OPEN_24_HOURS"])
              {
                uint64_t v26 = 6;
              }
              else if ([v25 isEqualToString:@"HAS_FITNESS_CENTER"])
              {
                uint64_t v26 = 7;
              }
              else if ([v25 isEqualToString:@"HAS_FREE_BREAKFAST"])
              {
                uint64_t v26 = 8;
              }
              else if ([v25 isEqualToString:@"HAS_SPA"])
              {
                uint64_t v26 = 9;
              }
              else if ([v25 isEqualToString:@"HAS_SWIMMING_POOL"])
              {
                uint64_t v26 = 10;
              }
              else if ([v25 isEqualToString:@"HAS_WIFI"])
              {
                uint64_t v26 = 11;
              }
              else if ([v25 isEqualToString:@"HAS_FREE_WIFI"])
              {
                uint64_t v26 = 12;
              }
              else if ([v25 isEqualToString:@"HAS_FREE_INTERNET"])
              {
                uint64_t v26 = 13;
              }
              else if ([v25 isEqualToString:@"HAS_SHUTTLE_BUS"])
              {
                uint64_t v26 = 14;
              }
              else if ([v25 isEqualToString:@"HAS_AIRPORT_TRANSPORTATION"])
              {
                uint64_t v26 = 15;
              }
              else if ([v25 isEqualToString:@"HAS_PARKING"])
              {
                uint64_t v26 = 16;
              }
              else if ([v25 isEqualToString:@"HAS_PARKING_GARAGE"])
              {
                uint64_t v26 = 17;
              }
              else if ([v25 isEqualToString:@"HAS_FREE_PARKING"])
              {
                uint64_t v26 = 18;
              }
              else if ([v25 isEqualToString:@"SMOKING_ALLOWED"])
              {
                uint64_t v26 = 19;
              }
              else if ([v25 isEqualToString:@"TAKES_RESERVATIONS"])
              {
                uint64_t v26 = 20;
              }
              else if ([v25 isEqualToString:@"ACCEPTS_APPLE_PAY"])
              {
                uint64_t v26 = 21;
              }
              else if ([v25 isEqualToString:@"HAS_GENDER_NEUTRAL_RESTROOM"])
              {
                uint64_t v26 = 22;
              }
              else if ([v25 isEqualToString:@"HAS_TAKE_OUT"])
              {
                uint64_t v26 = 23;
              }
              else if ([v25 isEqualToString:@"BY_APPOINTMENT_ONLY"])
              {
                uint64_t v26 = 24;
              }
              else if ([v25 isEqualToString:@"GOOD_FOR_GROUPS"])
              {
                uint64_t v26 = 25;
              }
              else if ([v25 isEqualToString:@"HAS_SCENIC_VIEW"])
              {
                uint64_t v26 = 26;
              }
              else if ([v25 isEqualToString:@"HAS_OUTDOOR_SEATING"])
              {
                uint64_t v26 = 27;
              }
              else if ([v25 isEqualToString:@"HAS_WATERFRONT"])
              {
                uint64_t v26 = 28;
              }
              else if ([v25 isEqualToString:@"HAS_BEACHFRONT"])
              {
                uint64_t v26 = 29;
              }
              else if ([v25 isEqualToString:@"ALLOWS_DOGS"])
              {
                uint64_t v26 = 30;
              }
              else if ([v25 isEqualToString:@"HAS_DRIVE_THROUGH"])
              {
                uint64_t v26 = 31;
              }
              else if ([v25 isEqualToString:@"HAS_FULL_BAR"])
              {
                uint64_t v26 = 32;
              }
              else if ([v25 isEqualToString:@"HAS_VEGETARIAN_OPTIONS"])
              {
                uint64_t v26 = 33;
              }
              else if ([v25 isEqualToString:@"HAS_VEGAN_OPTIONS"])
              {
                uint64_t v26 = 34;
              }
              else if ([v25 isEqualToString:@"HAS_GLUTENFREE_OPTIONS"])
              {
                uint64_t v26 = 35;
              }
              else if ([v25 isEqualToString:@"HAS_SOY_FREE_OPTIONS"])
              {
                uint64_t v26 = 36;
              }
              else if ([v25 isEqualToString:@"HAS_HALAL_OPTIONS"])
              {
                uint64_t v26 = 37;
              }
              else if ([v25 isEqualToString:@"HAS_DAIRY_FREE_OPTIONS"])
              {
                uint64_t v26 = 38;
              }
              else if ([v25 isEqualToString:@"HAS_MEETING_ROOMS"])
              {
                uint64_t v26 = 39;
              }
              else if ([v25 isEqualToString:@"NON_SMOKING_THROUGHOUT"])
              {
                uint64_t v26 = 40;
              }
              else if ([v25 isEqualToString:@"HAS_NON_SMOKING_ROOMS"])
              {
                uint64_t v26 = 41;
              }
              else if ([v25 isEqualToString:@"HAS_FAMILY_ROOMS"])
              {
                uint64_t v26 = 42;
              }
              else if ([v25 isEqualToString:@"HAS_BAR_LOUNGE"])
              {
                uint64_t v26 = 43;
              }
              else if ([v25 isEqualToString:@"HAS_RESTAURANT"])
              {
                uint64_t v26 = 44;
              }
              else if ([v25 isEqualToString:@"HAS_LAUNDRY_SERVICE"])
              {
                uint64_t v26 = 45;
              }
              else if ([v25 isEqualToString:@"HAS_LARGE_TABLES"])
              {
                uint64_t v26 = 46;
              }
              else if ([v25 isEqualToString:@"HAS_PRIVATE_ROOMS"])
              {
                uint64_t v26 = 47;
              }
              else if ([v25 isEqualToString:@"HAS_HIGH_CHAIRS"])
              {
                uint64_t v26 = 48;
              }
              else if ([v25 isEqualToString:@"HAS_SELF_ORDERING_ONLINE"])
              {
                uint64_t v26 = 49;
              }
              else if ([v25 isEqualToString:@"HAS_ONLINE_QUEUING"])
              {
                uint64_t v26 = 50;
              }
              else if ([v25 isEqualToString:@"HAS_SEATING_FOR_COUPLES"])
              {
                uint64_t v26 = 51;
              }
              else if ([v25 isEqualToString:@"HAS_CHILDREN_DISCOUNT"])
              {
                uint64_t v26 = 52;
              }
              else if ([v25 isEqualToString:@"HAS_IMAX"])
              {
                uint64_t v26 = 53;
              }
              else if ([v25 isEqualToString:@"DEVICE_TRADE_IN_FOR_CREDIT"])
              {
                uint64_t v26 = 54;
              }
              else if ([v25 isEqualToString:@"FREE_TODAY_AT_APPLE_SESSIONS"])
              {
                uint64_t v26 = 55;
              }
              else if ([v25 isEqualToString:@"SMALL_BUSINESS_SOLUTIONS"])
              {
                uint64_t v26 = 56;
              }
              else if ([v25 isEqualToString:@"HARDWARE_REPAIRS_AND_SUPPORT"])
              {
                uint64_t v26 = 57;
              }
              else if ([v25 isEqualToString:@"GENIUS_BAR_WALK_INS"])
              {
                uint64_t v26 = 58;
              }
              else if ([v25 isEqualToString:@"APPLE_AUTHORIZED_SERVICE_PROVIDER"])
              {
                uint64_t v26 = 59;
              }
              else if ([v25 isEqualToString:@"OFFERS_SAME_DAY_IPHONE_SCREEN_REPAIR"])
              {
                uint64_t v26 = 60;
              }
              else if ([v25 isEqualToString:@"WALK_IN_REPAIRS"])
              {
                uint64_t v26 = 61;
              }
              else if ([v25 isEqualToString:@"APPLE_AUTHORIZED_DROPOFF_LOCATION"])
              {
                uint64_t v26 = 62;
              }
              else
              {
                uint64_t v26 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_288;
              }
              uint64_t v26 = [v24 intValue];
            }
            [v6 addRemovedAmenities:v26];
LABEL_288:
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (!v21)
          {
LABEL_290:

            v18 = v30;
            id v5 = v31;
            break;
          }
        }
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEORPAmenityCorrections)initWithJSON:(id)a3
{
  return (GEORPAmenityCorrections *)-[GEORPAmenityCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_74;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_74;
    }
    GEORPAmenityCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAmenityCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAmenityCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    id v5 = v11;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPAmenityCorrections *)self readAll:0];
    id v5 = v11;
    if (self->_addedAmenities.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v11;
        ++v6;
      }
      while (v6 < self->_addedAmenities.count);
    }
    p_removedAmenities = &self->_removedAmenities;
    if (p_removedAmenities->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v11;
        ++v8;
      }
      while (v8 < p_removedAmenities->count);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v10 = (id *)a3;
  [(GEORPAmenityCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPAmenityCorrections *)self addedAmenitiesCount])
  {
    [v10 clearAddedAmenities];
    unint64_t v4 = [(GEORPAmenityCorrections *)self addedAmenitiesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v10, "addAddedAmenities:", -[GEORPAmenityCorrections addedAmenitiesAtIndex:](self, "addedAmenitiesAtIndex:", i));
    }
  }
  if ([(GEORPAmenityCorrections *)self removedAmenitiesCount])
  {
    [v10 clearRemovedAmenities];
    unint64_t v7 = [(GEORPAmenityCorrections *)self removedAmenitiesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v10, "addRemovedAmenities:", -[GEORPAmenityCorrections removedAmenitiesAtIndex:](self, "removedAmenitiesAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v6 = reader;
  objc_sync_enter(v6);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPAmenityCorrections *)self readAll:0];
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    return v4;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPAmenityCorrectionsReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORPAmenityCorrections *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual()))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEORPAmenityCorrections *)self readAll:1];
  uint64_t v2 = PBRepeatedInt32Hash();
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  uint64_t v4 = [v10 addedAmenitiesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEORPAmenityCorrections addAddedAmenities:](self, "addAddedAmenities:", [v10 addedAmenitiesAtIndex:i]);
  }
  uint64_t v7 = [v10 removedAmenitiesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[GEORPAmenityCorrections addRemovedAmenities:](self, "addRemovedAmenities:", [v10 removedAmenitiesAtIndex:j]);
  }
}

- (void).cxx_destruct
{
}

@end