@interface GEOPDPlaceSummaryLayoutUnit
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddress;
- (BOOL)hasAlternativeUnit;
- (BOOL)hasArpRatings;
- (BOOL)hasCategory;
- (BOOL)hasContainment;
- (BOOL)hasCuratedGuides;
- (BOOL)hasDetourTime;
- (BOOL)hasDistance;
- (BOOL)hasEvChargersNumber;
- (BOOL)hasFactoid;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHighlightExtra;
- (BOOL)hasHighlightMain;
- (BOOL)hasHikeRouteDuration;
- (BOOL)hasHikeRouteElevationGainLoss;
- (BOOL)hasHikeRouteLength;
- (BOOL)hasHikeRouteType;
- (BOOL)hasHikingDifficulty;
- (BOOL)hasHikingTrailLength;
- (BOOL)hasHours;
- (BOOL)hasInUserLibrary;
- (BOOL)hasLayoutPriority;
- (BOOL)hasName;
- (BOOL)hasNumPlacesInGuide;
- (BOOL)hasPhotoCarousel;
- (BOOL)hasPrice;
- (BOOL)hasPublisherDescription;
- (BOOL)hasPublisherNameForGuide;
- (BOOL)hasRatings;
- (BOOL)hasRealTimeEvChargerAvailability;
- (BOOL)hasRecent;
- (BOOL)hasSecondaryName;
- (BOOL)hasServerOverride;
- (BOOL)hasString;
- (BOOL)hasTransitShields;
- (BOOL)hasType;
- (BOOL)hasUgcUserSubmittedRecommendations;
- (BOOL)hasUserGeneratedGuides;
- (BOOL)hasUserNote;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutUnit)alternativeUnit;
- (GEOPDPlaceSummaryLayoutUnit)init;
- (GEOPDPlaceSummaryLayoutUnit)initWithData:(id)a3;
- (GEOPDPlaceSummaryLayoutUnit)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnit)initWithJSON:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitAddress)address;
- (GEOPDPlaceSummaryLayoutUnitArpRatings)arpRatings;
- (GEOPDPlaceSummaryLayoutUnitCategory)category;
- (GEOPDPlaceSummaryLayoutUnitContainment)containment;
- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)curatedGuides;
- (GEOPDPlaceSummaryLayoutUnitDetourTime)detourTime;
- (GEOPDPlaceSummaryLayoutUnitDistance)distance;
- (GEOPDPlaceSummaryLayoutUnitEVChargersNumber)evChargersNumber;
- (GEOPDPlaceSummaryLayoutUnitFactoid)factoid;
- (GEOPDPlaceSummaryLayoutUnitHighlightExtra)highlightExtra;
- (GEOPDPlaceSummaryLayoutUnitHighlightMain)highlightMain;
- (GEOPDPlaceSummaryLayoutUnitHikeRouteDuration)hikeRouteDuration;
- (GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss)hikeRouteElevationGainLoss;
- (GEOPDPlaceSummaryLayoutUnitHikeRouteLength)hikeRouteLength;
- (GEOPDPlaceSummaryLayoutUnitHikeRouteType)hikeRouteType;
- (GEOPDPlaceSummaryLayoutUnitHikingDifficulty)hikingDifficulty;
- (GEOPDPlaceSummaryLayoutUnitHikingTrailLength)hikingTrailLength;
- (GEOPDPlaceSummaryLayoutUnitHours)hours;
- (GEOPDPlaceSummaryLayoutUnitInUserLibrary)inUserLibrary;
- (GEOPDPlaceSummaryLayoutUnitName)name;
- (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide)numPlacesInGuide;
- (GEOPDPlaceSummaryLayoutUnitPhotoCarousel)photoCarousel;
- (GEOPDPlaceSummaryLayoutUnitPrice)price;
- (GEOPDPlaceSummaryLayoutUnitPublisherDescription)publisherDescription;
- (GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide)publisherNameForGuide;
- (GEOPDPlaceSummaryLayoutUnitRatings)ratings;
- (GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability)realTimeEvChargerAvailability;
- (GEOPDPlaceSummaryLayoutUnitRecent)recent;
- (GEOPDPlaceSummaryLayoutUnitSecondaryName)secondaryName;
- (GEOPDPlaceSummaryLayoutUnitServerOverride)serverOverride;
- (GEOPDPlaceSummaryLayoutUnitString)string;
- (GEOPDPlaceSummaryLayoutUnitTransitShields)transitShields;
- (GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations)ugcUserSubmittedRecommendations;
- (GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides)userGeneratedGuides;
- (GEOPDPlaceSummaryLayoutUnitUserNote)userNote;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)layoutPriority;
- (int)type;
- (unint64_t)hash;
- (void)_readAddress;
- (void)_readAlternativeUnit;
- (void)_readArpRatings;
- (void)_readCategory;
- (void)_readContainment;
- (void)_readCuratedGuides;
- (void)_readDetourTime;
- (void)_readDistance;
- (void)_readEvChargersNumber;
- (void)_readFactoid;
- (void)_readHighlightExtra;
- (void)_readHighlightMain;
- (void)_readHikeRouteDuration;
- (void)_readHikeRouteElevationGainLoss;
- (void)_readHikeRouteLength;
- (void)_readHikeRouteType;
- (void)_readHikingDifficulty;
- (void)_readHikingTrailLength;
- (void)_readHours;
- (void)_readInUserLibrary;
- (void)_readName;
- (void)_readNumPlacesInGuide;
- (void)_readPhotoCarousel;
- (void)_readPrice;
- (void)_readPublisherDescription;
- (void)_readPublisherNameForGuide;
- (void)_readRatings;
- (void)_readRealTimeEvChargerAvailability;
- (void)_readRecent;
- (void)_readSecondaryName;
- (void)_readServerOverride;
- (void)_readString;
- (void)_readTransitShields;
- (void)_readUgcUserSubmittedRecommendations;
- (void)_readUserGeneratedGuides;
- (void)_readUserNote;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setAlternativeUnit:(id)a3;
- (void)setArpRatings:(id)a3;
- (void)setCategory:(id)a3;
- (void)setContainment:(id)a3;
- (void)setCuratedGuides:(id)a3;
- (void)setDetourTime:(id)a3;
- (void)setDistance:(id)a3;
- (void)setEvChargersNumber:(id)a3;
- (void)setFactoid:(id)a3;
- (void)setHasLayoutPriority:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHighlightExtra:(id)a3;
- (void)setHighlightMain:(id)a3;
- (void)setHikeRouteDuration:(id)a3;
- (void)setHikeRouteElevationGainLoss:(id)a3;
- (void)setHikeRouteLength:(id)a3;
- (void)setHikeRouteType:(id)a3;
- (void)setHikingDifficulty:(id)a3;
- (void)setHikingTrailLength:(id)a3;
- (void)setHours:(id)a3;
- (void)setInUserLibrary:(id)a3;
- (void)setLayoutPriority:(int)a3;
- (void)setName:(id)a3;
- (void)setNumPlacesInGuide:(id)a3;
- (void)setPhotoCarousel:(id)a3;
- (void)setPrice:(id)a3;
- (void)setPublisherDescription:(id)a3;
- (void)setPublisherNameForGuide:(id)a3;
- (void)setRatings:(id)a3;
- (void)setRealTimeEvChargerAvailability:(id)a3;
- (void)setRecent:(id)a3;
- (void)setSecondaryName:(id)a3;
- (void)setServerOverride:(id)a3;
- (void)setString:(id)a3;
- (void)setTransitShields:(id)a3;
- (void)setType:(int)a3;
- (void)setUgcUserSubmittedRecommendations:(id)a3;
- (void)setUserGeneratedGuides:(id)a3;
- (void)setUserNote:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnit

- (GEOPDPlaceSummaryLayoutUnit)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutUnit;
  v2 = [(GEOPDPlaceSummaryLayoutUnit *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutUnit)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutUnit;
  v3 = [(GEOPDPlaceSummaryLayoutUnit *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $DCB87D87C041D9304E9B2281701D2ADF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(void *)&self->_flags |= 0x4000000002uLL;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (a3) {
    uint64_t v3 = 0x4000000002;
  }
  self->_$DCB87D87C041D9304E9B2281701D2ADF flags = ($DCB87D87C041D9304E9B2281701D2ADF)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x24)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E62B8[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NAME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CATEGORY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISTANCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PRICE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HOURS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RATINGS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TRANSIT_SHIELDS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"USER_GENERATED_GUIDES"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CURATED_GUIDES"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"EV_CHARGERS_NUMBER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"UGC_USER_SUBMITTED_RECOMMENDATIONS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"STRING"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SERVER_OVERRIDE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CONTAINMENT"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RECENT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"HIGHLIGHT_MAIN"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"HIGHLIGHT_EXTRA"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_NAME_FOR_GUIDE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"NUM_PLACES_IN_GUIDE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_DESCRIPTION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SECONDARY_NAME"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FACTOID"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ARP_RATINGS"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"REAL_TIME_EV_CHARGER_AVAILABILITY"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"DETOUR_TIME"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"HIKING_DIFFICULTY"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"HIKING_TRAIL_LENGTH"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"PHOTO_CAROUSEL"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"IN_USER_LIBRARY"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"USER_NOTE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_TYPE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_DURATION"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_LENGTH"])
  {
    int v4 = 35;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 326) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_13);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (GEOPDPlaceSummaryLayoutUnitName)name
{
  -[GEOPDPlaceSummaryLayoutUnit _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(void *)&self->_flags |= 0x4000400000uLL;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 324) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategory_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (GEOPDPlaceSummaryLayoutUnitCategory)category
{
  -[GEOPDPlaceSummaryLayoutUnit _readCategory]((uint64_t)self);
  category = self->_category;

  return category;
}

- (void)setCategory:(id)a3
{
  *(void *)&self->_flags |= 0x4000000020uLL;
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)_readDistance
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 325) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDistance_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasDistance
{
  return self->_distance != 0;
}

- (GEOPDPlaceSummaryLayoutUnitDistance)distance
{
  -[GEOPDPlaceSummaryLayoutUnit _readDistance]((uint64_t)self);
  distance = self->_distance;

  return distance;
}

- (void)setDistance:(id)a3
{
  *(void *)&self->_flags |= 0x4000000200uLL;
  objc_storeStrong((id *)&self->_distance, a3);
}

- (void)_readPrice
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 327) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrice_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasPrice
{
  return self->_price != 0;
}

- (GEOPDPlaceSummaryLayoutUnitPrice)price
{
  -[GEOPDPlaceSummaryLayoutUnit _readPrice]((uint64_t)self);
  price = self->_price;

  return price;
}

- (void)setPrice:(id)a3
{
  *(void *)&self->_flags |= 0x4002000000uLL;
  objc_storeStrong((id *)&self->_price, a3);
}

- (void)_readHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 326) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHours_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHours
{
  return self->_hours != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHours)hours
{
  -[GEOPDPlaceSummaryLayoutUnit _readHours]((uint64_t)self);
  hours = self->_hours;

  return hours;
}

- (void)setHours:(id)a3
{
  *(void *)&self->_flags |= 0x4000100000uLL;
  objc_storeStrong((id *)&self->_hours, a3);
}

- (void)_readAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 324) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (GEOPDPlaceSummaryLayoutUnitAddress)address
{
  -[GEOPDPlaceSummaryLayoutUnit _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)setAddress:(id)a3
{
  *(void *)&self->_flags |= 0x4000000004uLL;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readRatings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 327) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRatings_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasRatings
{
  return self->_ratings != 0;
}

- (GEOPDPlaceSummaryLayoutUnitRatings)ratings
{
  -[GEOPDPlaceSummaryLayoutUnit _readRatings]((uint64_t)self);
  ratings = self->_ratings;

  return ratings;
}

- (void)setRatings:(id)a3
{
  *(void *)&self->_flags |= 0x4010000000uLL;
  objc_storeStrong((id *)&self->_ratings, a3);
}

- (void)_readTransitShields
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 328) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitShields_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasTransitShields
{
  return self->_transitShields != 0;
}

- (GEOPDPlaceSummaryLayoutUnitTransitShields)transitShields
{
  -[GEOPDPlaceSummaryLayoutUnit _readTransitShields]((uint64_t)self);
  transitShields = self->_transitShields;

  return transitShields;
}

- (void)setTransitShields:(id)a3
{
  *(void *)&self->_flags |= 0x4400000000uLL;
  objc_storeStrong((id *)&self->_transitShields, a3);
}

- (void)_readUserGeneratedGuides
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 328) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserGeneratedGuides_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasUserGeneratedGuides
{
  return self->_userGeneratedGuides != 0;
}

- (GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides)userGeneratedGuides
{
  -[GEOPDPlaceSummaryLayoutUnit _readUserGeneratedGuides]((uint64_t)self);
  userGeneratedGuides = self->_userGeneratedGuides;

  return userGeneratedGuides;
}

- (void)setUserGeneratedGuides:(id)a3
{
  *(void *)&self->_flags |= 0x5000000000uLL;
  objc_storeStrong((id *)&self->_userGeneratedGuides, a3);
}

- (void)_readCuratedGuides
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 324) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCuratedGuides_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasCuratedGuides
{
  return self->_curatedGuides != 0;
}

- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)curatedGuides
{
  -[GEOPDPlaceSummaryLayoutUnit _readCuratedGuides]((uint64_t)self);
  curatedGuides = self->_curatedGuides;

  return curatedGuides;
}

- (void)setCuratedGuides:(id)a3
{
  *(void *)&self->_flags |= 0x4000000080uLL;
  objc_storeStrong((id *)&self->_curatedGuides, a3);
}

- (void)_readEvChargersNumber
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 325) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargersNumber_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasEvChargersNumber
{
  return self->_evChargersNumber != 0;
}

- (GEOPDPlaceSummaryLayoutUnitEVChargersNumber)evChargersNumber
{
  -[GEOPDPlaceSummaryLayoutUnit _readEvChargersNumber]((uint64_t)self);
  evChargersNumber = self->_evChargersNumber;

  return evChargersNumber;
}

- (void)setEvChargersNumber:(id)a3
{
  *(void *)&self->_flags |= 0x4000000400uLL;
  objc_storeStrong((id *)&self->_evChargersNumber, a3);
}

- (void)_readUgcUserSubmittedRecommendations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 328) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUgcUserSubmittedRecommendations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasUgcUserSubmittedRecommendations
{
  return self->_ugcUserSubmittedRecommendations != 0;
}

- (GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations)ugcUserSubmittedRecommendations
{
  -[GEOPDPlaceSummaryLayoutUnit _readUgcUserSubmittedRecommendations]((uint64_t)self);
  ugcUserSubmittedRecommendations = self->_ugcUserSubmittedRecommendations;

  return ugcUserSubmittedRecommendations;
}

- (void)setUgcUserSubmittedRecommendations:(id)a3
{
  *(void *)&self->_flags |= 0x4800000000uLL;
  objc_storeStrong((id *)&self->_ugcUserSubmittedRecommendations, a3);
}

- (void)_readString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 328) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasString
{
  return self->_string != 0;
}

- (GEOPDPlaceSummaryLayoutUnitString)string
{
  -[GEOPDPlaceSummaryLayoutUnit _readString]((uint64_t)self);
  string = self->_string;

  return string;
}

- (void)setString:(id)a3
{
  *(void *)&self->_flags |= 0x4200000000uLL;
  objc_storeStrong((id *)&self->_string, a3);
}

- (void)_readServerOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 328) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServerOverride_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasServerOverride
{
  return self->_serverOverride != 0;
}

- (GEOPDPlaceSummaryLayoutUnitServerOverride)serverOverride
{
  -[GEOPDPlaceSummaryLayoutUnit _readServerOverride]((uint64_t)self);
  serverOverride = self->_serverOverride;

  return serverOverride;
}

- (void)setServerOverride:(id)a3
{
  *(void *)&self->_flags |= 0x4100000000uLL;
  objc_storeStrong((id *)&self->_serverOverride, a3);
}

- (void)_readContainment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 324) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasContainment
{
  return self->_containment != 0;
}

- (GEOPDPlaceSummaryLayoutUnitContainment)containment
{
  -[GEOPDPlaceSummaryLayoutUnit _readContainment]((uint64_t)self);
  containment = self->_containment;

  return containment;
}

- (void)setContainment:(id)a3
{
  *(void *)&self->_flags |= 0x4000000040uLL;
  objc_storeStrong((id *)&self->_containment, a3);
}

- (void)_readRecent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 327) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRecent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasRecent
{
  return self->_recent != 0;
}

- (GEOPDPlaceSummaryLayoutUnitRecent)recent
{
  -[GEOPDPlaceSummaryLayoutUnit _readRecent]((uint64_t)self);
  recent = self->_recent;

  return recent;
}

- (void)setRecent:(id)a3
{
  *(void *)&self->_flags |= 0x4040000000uLL;
  objc_storeStrong((id *)&self->_recent, a3);
}

- (void)_readHighlightMain
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 325) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHighlightMain_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHighlightMain
{
  return self->_highlightMain != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHighlightMain)highlightMain
{
  -[GEOPDPlaceSummaryLayoutUnit _readHighlightMain]((uint64_t)self);
  highlightMain = self->_highlightMain;

  return highlightMain;
}

- (void)setHighlightMain:(id)a3
{
  *(void *)&self->_flags |= 0x4000002000uLL;
  objc_storeStrong((id *)&self->_highlightMain, a3);
}

- (void)_readHighlightExtra
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 325) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHighlightExtra_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHighlightExtra
{
  return self->_highlightExtra != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHighlightExtra)highlightExtra
{
  -[GEOPDPlaceSummaryLayoutUnit _readHighlightExtra]((uint64_t)self);
  highlightExtra = self->_highlightExtra;

  return highlightExtra;
}

- (void)setHighlightExtra:(id)a3
{
  *(void *)&self->_flags |= 0x4000001000uLL;
  objc_storeStrong((id *)&self->_highlightExtra, a3);
}

- (void)_readPublisherNameForGuide
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 327) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherNameForGuide_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasPublisherNameForGuide
{
  return self->_publisherNameForGuide != 0;
}

- (GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide)publisherNameForGuide
{
  -[GEOPDPlaceSummaryLayoutUnit _readPublisherNameForGuide]((uint64_t)self);
  publisherNameForGuide = self->_publisherNameForGuide;

  return publisherNameForGuide;
}

- (void)setPublisherNameForGuide:(id)a3
{
  *(void *)&self->_flags |= 0x4008000000uLL;
  objc_storeStrong((id *)&self->_publisherNameForGuide, a3);
}

- (void)_readNumPlacesInGuide
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 326) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNumPlacesInGuide_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasNumPlacesInGuide
{
  return self->_numPlacesInGuide != 0;
}

- (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide)numPlacesInGuide
{
  -[GEOPDPlaceSummaryLayoutUnit _readNumPlacesInGuide]((uint64_t)self);
  numPlacesInGuide = self->_numPlacesInGuide;

  return numPlacesInGuide;
}

- (void)setNumPlacesInGuide:(id)a3
{
  *(void *)&self->_flags |= 0x4000800000uLL;
  objc_storeStrong((id *)&self->_numPlacesInGuide, a3);
}

- (void)_readPublisherDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 327) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasPublisherDescription
{
  return self->_publisherDescription != 0;
}

- (GEOPDPlaceSummaryLayoutUnitPublisherDescription)publisherDescription
{
  -[GEOPDPlaceSummaryLayoutUnit _readPublisherDescription]((uint64_t)self);
  publisherDescription = self->_publisherDescription;

  return publisherDescription;
}

- (void)setPublisherDescription:(id)a3
{
  *(void *)&self->_flags |= 0x4004000000uLL;
  objc_storeStrong((id *)&self->_publisherDescription, a3);
}

- (void)_readSecondaryName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 327) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasSecondaryName
{
  return self->_secondaryName != 0;
}

- (GEOPDPlaceSummaryLayoutUnitSecondaryName)secondaryName
{
  -[GEOPDPlaceSummaryLayoutUnit _readSecondaryName]((uint64_t)self);
  secondaryName = self->_secondaryName;

  return secondaryName;
}

- (void)setSecondaryName:(id)a3
{
  *(void *)&self->_flags |= 0x4080000000uLL;
  objc_storeStrong((id *)&self->_secondaryName, a3);
}

- (void)_readFactoid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 325) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFactoid_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasFactoid
{
  return self->_factoid != 0;
}

- (GEOPDPlaceSummaryLayoutUnitFactoid)factoid
{
  -[GEOPDPlaceSummaryLayoutUnit _readFactoid]((uint64_t)self);
  factoid = self->_factoid;

  return factoid;
}

- (void)setFactoid:(id)a3
{
  *(void *)&self->_flags |= 0x4000000800uLL;
  objc_storeStrong((id *)&self->_factoid, a3);
}

- (void)_readArpRatings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 324) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArpRatings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasArpRatings
{
  return self->_arpRatings != 0;
}

- (GEOPDPlaceSummaryLayoutUnitArpRatings)arpRatings
{
  -[GEOPDPlaceSummaryLayoutUnit _readArpRatings]((uint64_t)self);
  arpRatings = self->_arpRatings;

  return arpRatings;
}

- (void)setArpRatings:(id)a3
{
  *(void *)&self->_flags |= 0x4000000010uLL;
  objc_storeStrong((id *)&self->_arpRatings, a3);
}

- (void)_readRealTimeEvChargerAvailability
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 327) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRealTimeEvChargerAvailability_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasRealTimeEvChargerAvailability
{
  return self->_realTimeEvChargerAvailability != 0;
}

- (GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability)realTimeEvChargerAvailability
{
  -[GEOPDPlaceSummaryLayoutUnit _readRealTimeEvChargerAvailability]((uint64_t)self);
  realTimeEvChargerAvailability = self->_realTimeEvChargerAvailability;

  return realTimeEvChargerAvailability;
}

- (void)setRealTimeEvChargerAvailability:(id)a3
{
  *(void *)&self->_flags |= 0x4020000000uLL;
  objc_storeStrong((id *)&self->_realTimeEvChargerAvailability, a3);
}

- (void)_readDetourTime
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 325) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetourTime_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasDetourTime
{
  return self->_detourTime != 0;
}

- (GEOPDPlaceSummaryLayoutUnitDetourTime)detourTime
{
  -[GEOPDPlaceSummaryLayoutUnit _readDetourTime]((uint64_t)self);
  detourTime = self->_detourTime;

  return detourTime;
}

- (void)setDetourTime:(id)a3
{
  *(void *)&self->_flags |= 0x4000000100uLL;
  objc_storeStrong((id *)&self->_detourTime, a3);
}

- (void)_readHikingDifficulty
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 326) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHikingDifficulty_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikingDifficulty
{
  return self->_hikingDifficulty != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikingDifficulty)hikingDifficulty
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikingDifficulty]((uint64_t)self);
  hikingDifficulty = self->_hikingDifficulty;

  return hikingDifficulty;
}

- (void)setHikingDifficulty:(id)a3
{
  *(void *)&self->_flags |= 0x4000040000uLL;
  objc_storeStrong((id *)&self->_hikingDifficulty, a3);
}

- (void)_readHikingTrailLength
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 326) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHikingTrailLength_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikingTrailLength
{
  return self->_hikingTrailLength != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikingTrailLength)hikingTrailLength
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikingTrailLength]((uint64_t)self);
  hikingTrailLength = self->_hikingTrailLength;

  return hikingTrailLength;
}

- (void)setHikingTrailLength:(id)a3
{
  *(void *)&self->_flags |= 0x4000080000uLL;
  objc_storeStrong((id *)&self->_hikingTrailLength, a3);
}

- (void)_readPhotoCarousel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 327) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoCarousel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasPhotoCarousel
{
  return self->_photoCarousel != 0;
}

- (GEOPDPlaceSummaryLayoutUnitPhotoCarousel)photoCarousel
{
  -[GEOPDPlaceSummaryLayoutUnit _readPhotoCarousel]((uint64_t)self);
  photoCarousel = self->_photoCarousel;

  return photoCarousel;
}

- (void)setPhotoCarousel:(id)a3
{
  *(void *)&self->_flags |= 0x4001000000uLL;
  objc_storeStrong((id *)&self->_photoCarousel, a3);
}

- (void)_readUserNote
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 328) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserNote_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasUserNote
{
  return self->_userNote != 0;
}

- (GEOPDPlaceSummaryLayoutUnitUserNote)userNote
{
  -[GEOPDPlaceSummaryLayoutUnit _readUserNote]((uint64_t)self);
  userNote = self->_userNote;

  return userNote;
}

- (void)setUserNote:(id)a3
{
  *(void *)&self->_flags |= 0x6000000000uLL;
  objc_storeStrong((id *)&self->_userNote, a3);
}

- (void)_readInUserLibrary
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 326) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInUserLibrary_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasInUserLibrary
{
  return self->_inUserLibrary != 0;
}

- (GEOPDPlaceSummaryLayoutUnitInUserLibrary)inUserLibrary
{
  -[GEOPDPlaceSummaryLayoutUnit _readInUserLibrary]((uint64_t)self);
  inUserLibrary = self->_inUserLibrary;

  return inUserLibrary;
}

- (void)setInUserLibrary:(id)a3
{
  *(void *)&self->_flags |= 0x4000200000uLL;
  objc_storeStrong((id *)&self->_inUserLibrary, a3);
}

- (void)_readHikeRouteElevationGainLoss
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 325) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHikeRouteElevationGainLoss_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikeRouteElevationGainLoss
{
  return self->_hikeRouteElevationGainLoss != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss)hikeRouteElevationGainLoss
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteElevationGainLoss]((uint64_t)self);
  hikeRouteElevationGainLoss = self->_hikeRouteElevationGainLoss;

  return hikeRouteElevationGainLoss;
}

- (void)setHikeRouteElevationGainLoss:(id)a3
{
  *(void *)&self->_flags |= 0x4000008000uLL;
  objc_storeStrong((id *)&self->_hikeRouteElevationGainLoss, a3);
}

- (void)_readHikeRouteType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 326) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHikeRouteType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikeRouteType
{
  return self->_hikeRouteType != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteType)hikeRouteType
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteType]((uint64_t)self);
  hikeRouteType = self->_hikeRouteType;

  return hikeRouteType;
}

- (void)setHikeRouteType:(id)a3
{
  *(void *)&self->_flags |= 0x4000020000uLL;
  objc_storeStrong((id *)&self->_hikeRouteType, a3);
}

- (void)_readHikeRouteDuration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 325) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHikeRouteDuration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikeRouteDuration
{
  return self->_hikeRouteDuration != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteDuration)hikeRouteDuration
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteDuration]((uint64_t)self);
  hikeRouteDuration = self->_hikeRouteDuration;

  return hikeRouteDuration;
}

- (void)setHikeRouteDuration:(id)a3
{
  *(void *)&self->_flags |= 0x4000004000uLL;
  objc_storeStrong((id *)&self->_hikeRouteDuration, a3);
}

- (void)_readHikeRouteLength
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 326) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHikeRouteLength_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikeRouteLength
{
  return self->_hikeRouteLength != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteLength)hikeRouteLength
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteLength]((uint64_t)self);
  hikeRouteLength = self->_hikeRouteLength;

  return hikeRouteLength;
}

- (void)setHikeRouteLength:(id)a3
{
  *(void *)&self->_flags |= 0x4000010000uLL;
  objc_storeStrong((id *)&self->_hikeRouteLength, a3);
}

- (int)layoutPriority
{
  return self->_layoutPriority;
}

- (void)setLayoutPriority:(int)a3
{
  *(void *)&self->_flags |= 0x4000000001uLL;
  self->_layoutPriority = a3;
}

- (void)setHasLayoutPriority:(BOOL)a3
{
  self->_$DCB87D87C041D9304E9B2281701D2ADF flags = ($DCB87D87C041D9304E9B2281701D2ADF)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x4000000000);
}

- (BOOL)hasLayoutPriority
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readAlternativeUnit
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(unsigned char *)(a1 + 324) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternativeUnit_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasAlternativeUnit
{
  return self->_alternativeUnit != 0;
}

- (GEOPDPlaceSummaryLayoutUnit)alternativeUnit
{
  -[GEOPDPlaceSummaryLayoutUnit _readAlternativeUnit]((uint64_t)self);
  alternativeUnit = self->_alternativeUnit;

  return alternativeUnit;
}

- (void)setAlternativeUnit:(id)a3
{
  *(void *)&self->_flags |= 0x4000000008uLL;
  objc_storeStrong((id *)&self->_alternativeUnit, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnit;
  int v4 = [(GEOPDPlaceSummaryLayoutUnit *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnit *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnit _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 324) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 320);
      if (v5 >= 0x24)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 320));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E62B8[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    objc_super v7 = [(id)a1 name];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      id v9 = [v7 dictionaryRepresentation];
      }

      [v4 setObject:v9 forKey:@"name"];
    }

    v10 = [(id)a1 category];
    v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      id v12 = [v10 dictionaryRepresentation];
      }

      [v4 setObject:v12 forKey:@"category"];
    }

    v13 = [(id)a1 distance];
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      id v15 = [v13 dictionaryRepresentation];
      }

      [v4 setObject:v15 forKey:@"distance"];
    }

    v16 = [(id)a1 price];
    v17 = v16;
    if (v16)
    {
      if (a2) {
        [v16 jsonRepresentation];
      }
      else {
      id v18 = [v16 dictionaryRepresentation];
      }

      [v4 setObject:v18 forKey:@"price"];
    }

    v19 = [(id)a1 hours];
    v20 = v19;
    if (v19)
    {
      if (a2) {
        [v19 jsonRepresentation];
      }
      else {
      id v21 = [v19 dictionaryRepresentation];
      }

      [v4 setObject:v21 forKey:@"hours"];
    }

    v22 = [(id)a1 address];
    v23 = v22;
    if (v22)
    {
      if (a2) {
        [v22 jsonRepresentation];
      }
      else {
      id v24 = [v22 dictionaryRepresentation];
      }

      [v4 setObject:v24 forKey:@"address"];
    }

    v25 = [(id)a1 ratings];
    v26 = v25;
    if (v25)
    {
      if (a2) {
        [v25 jsonRepresentation];
      }
      else {
      id v27 = [v25 dictionaryRepresentation];
      }

      [v4 setObject:v27 forKey:@"ratings"];
    }

    v28 = [(id)a1 transitShields];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"transitShields";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"transit_shields";
      }
      id v32 = v30;

      [v4 setObject:v32 forKey:v31];
    }

    v33 = [(id)a1 userGeneratedGuides];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 jsonRepresentation];
        v36 = @"userGeneratedGuides";
      }
      else
      {
        v35 = [v33 dictionaryRepresentation];
        v36 = @"user_generated_guides";
      }
      id v37 = v35;

      [v4 setObject:v37 forKey:v36];
    }

    v38 = [(id)a1 curatedGuides];
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"curatedGuides";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"curated_guides";
      }
      id v42 = v40;

      [v4 setObject:v42 forKey:v41];
    }

    v43 = [(id)a1 evChargersNumber];
    v44 = v43;
    if (v43)
    {
      if (a2)
      {
        v45 = [v43 jsonRepresentation];
        v46 = @"evChargersNumber";
      }
      else
      {
        v45 = [v43 dictionaryRepresentation];
        v46 = @"ev_chargers_number";
      }
      id v47 = v45;

      [v4 setObject:v47 forKey:v46];
    }

    v48 = [(id)a1 ugcUserSubmittedRecommendations];
    v49 = v48;
    if (v48)
    {
      if (a2)
      {
        v50 = [v48 jsonRepresentation];
        v51 = @"ugcUserSubmittedRecommendations";
      }
      else
      {
        v50 = [v48 dictionaryRepresentation];
        v51 = @"ugc_user_submitted_recommendations";
      }
      id v52 = v50;

      [v4 setObject:v52 forKey:v51];
    }

    v53 = [(id)a1 string];
    v54 = v53;
    if (v53)
    {
      if (a2) {
        [v53 jsonRepresentation];
      }
      else {
      id v55 = [v53 dictionaryRepresentation];
      }

      [v4 setObject:v55 forKey:@"string"];
    }

    v56 = [(id)a1 serverOverride];
    v57 = v56;
    if (v56)
    {
      if (a2)
      {
        v58 = [v56 jsonRepresentation];
        v59 = @"serverOverride";
      }
      else
      {
        v58 = [v56 dictionaryRepresentation];
        v59 = @"server_override";
      }
      id v60 = v58;

      [v4 setObject:v60 forKey:v59];
    }

    v61 = [(id)a1 containment];
    v62 = v61;
    if (v61)
    {
      if (a2) {
        [v61 jsonRepresentation];
      }
      else {
      id v63 = [v61 dictionaryRepresentation];
      }

      [v4 setObject:v63 forKey:@"containment"];
    }

    v64 = [(id)a1 recent];
    v65 = v64;
    if (v64)
    {
      if (a2) {
        [v64 jsonRepresentation];
      }
      else {
      id v66 = [v64 dictionaryRepresentation];
      }

      [v4 setObject:v66 forKey:@"recent"];
    }

    v67 = [(id)a1 highlightMain];
    v68 = v67;
    if (v67)
    {
      if (a2)
      {
        v69 = [v67 jsonRepresentation];
        v70 = @"highlightMain";
      }
      else
      {
        v69 = [v67 dictionaryRepresentation];
        v70 = @"highlight_main";
      }
      id v71 = v69;

      [v4 setObject:v71 forKey:v70];
    }

    v72 = [(id)a1 highlightExtra];
    v73 = v72;
    if (v72)
    {
      if (a2)
      {
        v74 = [v72 jsonRepresentation];
        v75 = @"highlightExtra";
      }
      else
      {
        v74 = [v72 dictionaryRepresentation];
        v75 = @"highlight_extra";
      }
      id v76 = v74;

      [v4 setObject:v76 forKey:v75];
    }

    v77 = [(id)a1 publisherNameForGuide];
    v78 = v77;
    if (v77)
    {
      if (a2)
      {
        v79 = [v77 jsonRepresentation];
        v80 = @"publisherNameForGuide";
      }
      else
      {
        v79 = [v77 dictionaryRepresentation];
        v80 = @"publisher_name_for_guide";
      }
      id v81 = v79;

      [v4 setObject:v81 forKey:v80];
    }

    v82 = [(id)a1 numPlacesInGuide];
    v83 = v82;
    if (v82)
    {
      if (a2)
      {
        v84 = [v82 jsonRepresentation];
        v85 = @"numPlacesInGuide";
      }
      else
      {
        v84 = [v82 dictionaryRepresentation];
        v85 = @"num_places_in_guide";
      }
      id v86 = v84;

      [v4 setObject:v86 forKey:v85];
    }

    v87 = [(id)a1 publisherDescription];
    v88 = v87;
    if (v87)
    {
      if (a2)
      {
        v89 = [v87 jsonRepresentation];
        v90 = @"publisherDescription";
      }
      else
      {
        v89 = [v87 dictionaryRepresentation];
        v90 = @"publisher_description";
      }
      id v91 = v89;

      [v4 setObject:v91 forKey:v90];
    }

    v92 = [(id)a1 secondaryName];
    v93 = v92;
    if (v92)
    {
      if (a2)
      {
        v94 = [v92 jsonRepresentation];
        v95 = @"secondaryName";
      }
      else
      {
        v94 = [v92 dictionaryRepresentation];
        v95 = @"secondary_name";
      }
      id v96 = v94;

      [v4 setObject:v96 forKey:v95];
    }

    v97 = [(id)a1 factoid];
    v98 = v97;
    if (v97)
    {
      if (a2) {
        [v97 jsonRepresentation];
      }
      else {
      id v99 = [v97 dictionaryRepresentation];
      }

      [v4 setObject:v99 forKey:@"factoid"];
    }

    v100 = [(id)a1 arpRatings];
    v101 = v100;
    if (v100)
    {
      if (a2)
      {
        v102 = [v100 jsonRepresentation];
        v103 = @"arpRatings";
      }
      else
      {
        v102 = [v100 dictionaryRepresentation];
        v103 = @"arp_ratings";
      }
      id v104 = v102;

      [v4 setObject:v104 forKey:v103];
    }

    v105 = [(id)a1 realTimeEvChargerAvailability];
    v106 = v105;
    if (v105)
    {
      if (a2)
      {
        v107 = [v105 jsonRepresentation];
        v108 = @"realTimeEvChargerAvailability";
      }
      else
      {
        v107 = [v105 dictionaryRepresentation];
        v108 = @"real_time_ev_charger_availability";
      }
      id v109 = v107;

      [v4 setObject:v109 forKey:v108];
    }

    v110 = [(id)a1 detourTime];
    v111 = v110;
    if (v110)
    {
      if (a2)
      {
        v112 = [v110 jsonRepresentation];
        v113 = @"detourTime";
      }
      else
      {
        v112 = [v110 dictionaryRepresentation];
        v113 = @"detour_time";
      }
      id v114 = v112;

      [v4 setObject:v114 forKey:v113];
    }

    v115 = [(id)a1 hikingDifficulty];
    v116 = v115;
    if (v115)
    {
      if (a2)
      {
        v117 = [v115 jsonRepresentation];
        v118 = @"hikingDifficulty";
      }
      else
      {
        v117 = [v115 dictionaryRepresentation];
        v118 = @"hiking_difficulty";
      }
      id v119 = v117;

      [v4 setObject:v119 forKey:v118];
    }

    v120 = [(id)a1 hikingTrailLength];
    v121 = v120;
    if (v120)
    {
      if (a2)
      {
        v122 = [v120 jsonRepresentation];
        v123 = @"hikingTrailLength";
      }
      else
      {
        v122 = [v120 dictionaryRepresentation];
        v123 = @"hiking_trail_length";
      }
      id v124 = v122;

      [v4 setObject:v124 forKey:v123];
    }

    v125 = [(id)a1 photoCarousel];
    v126 = v125;
    if (v125)
    {
      if (a2)
      {
        v127 = [v125 jsonRepresentation];
        v128 = @"photoCarousel";
      }
      else
      {
        v127 = [v125 dictionaryRepresentation];
        v128 = @"photo_carousel";
      }
      id v129 = v127;

      [v4 setObject:v129 forKey:v128];
    }

    v130 = [(id)a1 userNote];
    v131 = v130;
    if (v130)
    {
      if (a2)
      {
        v132 = [v130 jsonRepresentation];
        v133 = @"userNote";
      }
      else
      {
        v132 = [v130 dictionaryRepresentation];
        v133 = @"user_note";
      }
      id v134 = v132;

      [v4 setObject:v134 forKey:v133];
    }

    v135 = [(id)a1 inUserLibrary];
    v136 = v135;
    if (v135)
    {
      if (a2)
      {
        v137 = [v135 jsonRepresentation];
        v138 = @"inUserLibrary";
      }
      else
      {
        v137 = [v135 dictionaryRepresentation];
        v138 = @"in_user_library";
      }
      id v139 = v137;

      [v4 setObject:v139 forKey:v138];
    }

    v140 = [(id)a1 hikeRouteElevationGainLoss];
    v141 = v140;
    if (v140)
    {
      if (a2)
      {
        v142 = [v140 jsonRepresentation];
        v143 = @"hikeRouteElevationGainLoss";
      }
      else
      {
        v142 = [v140 dictionaryRepresentation];
        v143 = @"hike_route_elevation_gain_loss";
      }
      id v144 = v142;

      [v4 setObject:v144 forKey:v143];
    }

    v145 = [(id)a1 hikeRouteType];
    v146 = v145;
    if (v145)
    {
      if (a2)
      {
        v147 = [v145 jsonRepresentation];
        v148 = @"hikeRouteType";
      }
      else
      {
        v147 = [v145 dictionaryRepresentation];
        v148 = @"hike_route_type";
      }
      id v149 = v147;

      [v4 setObject:v149 forKey:v148];
    }

    v150 = [(id)a1 hikeRouteDuration];
    v151 = v150;
    if (v150)
    {
      if (a2)
      {
        v152 = [v150 jsonRepresentation];
        v153 = @"hikeRouteDuration";
      }
      else
      {
        v152 = [v150 dictionaryRepresentation];
        v153 = @"hike_route_duration";
      }
      id v154 = v152;

      [v4 setObject:v154 forKey:v153];
    }

    v155 = [(id)a1 hikeRouteLength];
    v156 = v155;
    if (v155)
    {
      if (a2)
      {
        v157 = [v155 jsonRepresentation];
        v158 = @"hikeRouteLength";
      }
      else
      {
        v157 = [v155 dictionaryRepresentation];
        v158 = @"hike_route_length";
      }
      id v159 = v157;

      [v4 setObject:v159 forKey:v158];
    }

    if (*(unsigned char *)(a1 + 324))
    {
      v160 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 316)];
      if (a2) {
        v161 = @"layoutPriority";
      }
      else {
        v161 = @"layout_priority";
      }
      [v4 setObject:v160 forKey:v161];
    }
    v162 = [(id)a1 alternativeUnit];
    v163 = v162;
    if (v162)
    {
      if (a2)
      {
        v164 = [v162 jsonRepresentation];
        v165 = @"alternativeUnit";
      }
      else
      {
        v164 = [v162 dictionaryRepresentation];
        v165 = @"alternative_unit";
      }
      id v166 = v164;

      [v4 setObject:v166 forKey:v165];
    }

    id v167 = v4;
  }
  else
  {
    id v167 = 0;
  }

  return v167;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnit _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnit)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnit *)-[GEOPDPlaceSummaryLayoutUnit _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_342;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_342;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"NAME"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"CATEGORY"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"DISTANCE"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"PRICE"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"HOURS"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"ADDRESS"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"RATINGS"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"TRANSIT_SHIELDS"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"USER_GENERATED_GUIDES"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"CURATED_GUIDES"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"EV_CHARGERS_NUMBER"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"UGC_USER_SUBMITTED_RECOMMENDATIONS"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"STRING"])
    {
      uint64_t v8 = 13;
    }
    else if ([v7 isEqualToString:@"SERVER_OVERRIDE"])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:@"CONTAINMENT"])
    {
      uint64_t v8 = 15;
    }
    else if ([v7 isEqualToString:@"RECENT"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"HIGHLIGHT_MAIN"])
    {
      uint64_t v8 = 17;
    }
    else if ([v7 isEqualToString:@"HIGHLIGHT_EXTRA"])
    {
      uint64_t v8 = 18;
    }
    else if ([v7 isEqualToString:@"PUBLISHER_NAME_FOR_GUIDE"])
    {
      uint64_t v8 = 19;
    }
    else if ([v7 isEqualToString:@"NUM_PLACES_IN_GUIDE"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"PUBLISHER_DESCRIPTION"])
    {
      uint64_t v8 = 21;
    }
    else if ([v7 isEqualToString:@"SECONDARY_NAME"])
    {
      uint64_t v8 = 22;
    }
    else if ([v7 isEqualToString:@"FACTOID"])
    {
      uint64_t v8 = 23;
    }
    else if ([v7 isEqualToString:@"ARP_RATINGS"])
    {
      uint64_t v8 = 24;
    }
    else if ([v7 isEqualToString:@"REAL_TIME_EV_CHARGER_AVAILABILITY"])
    {
      uint64_t v8 = 25;
    }
    else if ([v7 isEqualToString:@"DETOUR_TIME"])
    {
      uint64_t v8 = 26;
    }
    else if ([v7 isEqualToString:@"HIKING_DIFFICULTY"])
    {
      uint64_t v8 = 27;
    }
    else if ([v7 isEqualToString:@"HIKING_TRAIL_LENGTH"])
    {
      uint64_t v8 = 28;
    }
    else if ([v7 isEqualToString:@"PHOTO_CAROUSEL"])
    {
      uint64_t v8 = 29;
    }
    else if ([v7 isEqualToString:@"IN_USER_LIBRARY"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"USER_NOTE"])
    {
      uint64_t v8 = 31;
    }
    else if ([v7 isEqualToString:@"HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS"])
    {
      uint64_t v8 = 32;
    }
    else if ([v7 isEqualToString:@"HIKE_ROUTE_TYPE"])
    {
      uint64_t v8 = 33;
    }
    else if ([v7 isEqualToString:@"HIKE_ROUTE_DURATION"])
    {
      uint64_t v8 = 34;
    }
    else if ([v7 isEqualToString:@"HIKE_ROUTE_LENGTH"])
    {
      uint64_t v8 = 35;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_80;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_80:
    [a1 setType:v8];
  }

  id v9 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEOPDPlaceSummaryLayoutUnitName alloc];
    if (a3) {
      uint64_t v11 = [(GEOPDPlaceSummaryLayoutUnitName *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOPDPlaceSummaryLayoutUnitName *)v10 initWithDictionary:v9];
    }
    id v12 = (void *)v11;
    [a1 setName:v11];
  }
  v13 = [v5 objectForKeyedSubscript:@"category"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOPDPlaceSummaryLayoutUnitCategory alloc];
    if (a3) {
      uint64_t v15 = [(GEOPDPlaceSummaryLayoutUnitCategory *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOPDPlaceSummaryLayoutUnitCategory *)v14 initWithDictionary:v13];
    }
    v16 = (void *)v15;
    [a1 setCategory:v15];
  }
  v17 = [v5 objectForKeyedSubscript:@"distance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = [GEOPDPlaceSummaryLayoutUnitDistance alloc];
    if (a3) {
      uint64_t v19 = [(GEOPDPlaceSummaryLayoutUnitDistance *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOPDPlaceSummaryLayoutUnitDistance *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [a1 setDistance:v19];
  }
  id v21 = [v5 objectForKeyedSubscript:@"price"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [GEOPDPlaceSummaryLayoutUnitPrice alloc];
    if (a3) {
      uint64_t v23 = [(GEOPDPlaceSummaryLayoutUnitPrice *)v22 initWithJSON:v21];
    }
    else {
      uint64_t v23 = [(GEOPDPlaceSummaryLayoutUnitPrice *)v22 initWithDictionary:v21];
    }
    id v24 = (void *)v23;
    [a1 setPrice:v23];
  }
  v25 = [v5 objectForKeyedSubscript:@"hours"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [GEOPDPlaceSummaryLayoutUnitHours alloc];
    if (a3) {
      uint64_t v27 = [(GEOPDPlaceSummaryLayoutUnitHours *)v26 initWithJSON:v25];
    }
    else {
      uint64_t v27 = [(GEOPDPlaceSummaryLayoutUnitHours *)v26 initWithDictionary:v25];
    }
    v28 = (void *)v27;
    [a1 setHours:v27];
  }
  v29 = [v5 objectForKeyedSubscript:@"address"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOPDPlaceSummaryLayoutUnitAddress alloc];
    if (a3) {
      uint64_t v31 = [(GEOPDPlaceSummaryLayoutUnitAddress *)v30 initWithJSON:v29];
    }
    else {
      uint64_t v31 = [(GEOPDPlaceSummaryLayoutUnitAddress *)v30 initWithDictionary:v29];
    }
    id v32 = (void *)v31;
    [a1 setAddress:v31];
  }
  v33 = [v5 objectForKeyedSubscript:@"ratings"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = [GEOPDPlaceSummaryLayoutUnitRatings alloc];
    if (a3) {
      uint64_t v35 = [(GEOPDPlaceSummaryLayoutUnitRatings *)v34 initWithJSON:v33];
    }
    else {
      uint64_t v35 = [(GEOPDPlaceSummaryLayoutUnitRatings *)v34 initWithDictionary:v33];
    }
    v36 = (void *)v35;
    [a1 setRatings:v35];
  }
  if (a3) {
    id v37 = @"transitShields";
  }
  else {
    id v37 = @"transit_shields";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v39 = [GEOPDPlaceSummaryLayoutUnitTransitShields alloc];
    if (a3) {
      uint64_t v40 = [(GEOPDPlaceSummaryLayoutUnitTransitShields *)v39 initWithJSON:v38];
    }
    else {
      uint64_t v40 = [(GEOPDPlaceSummaryLayoutUnitTransitShields *)v39 initWithDictionary:v38];
    }
    v41 = (void *)v40;
    [a1 setTransitShields:v40];
  }
  if (a3) {
    id v42 = @"userGeneratedGuides";
  }
  else {
    id v42 = @"user_generated_guides";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = [GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides alloc];
    if (a3) {
      uint64_t v45 = [(GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides *)v44 initWithJSON:v43];
    }
    else {
      uint64_t v45 = [(GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides *)v44 initWithDictionary:v43];
    }
    v46 = (void *)v45;
    [a1 setUserGeneratedGuides:v45];
  }
  if (a3) {
    id v47 = @"curatedGuides";
  }
  else {
    id v47 = @"curated_guides";
  }
  v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = [GEOPDPlaceSummaryLayoutUnitCuratedGuides alloc];
    if (a3) {
      uint64_t v50 = [(GEOPDPlaceSummaryLayoutUnitCuratedGuides *)v49 initWithJSON:v48];
    }
    else {
      uint64_t v50 = [(GEOPDPlaceSummaryLayoutUnitCuratedGuides *)v49 initWithDictionary:v48];
    }
    v51 = (void *)v50;
    [a1 setCuratedGuides:v50];
  }
  if (a3) {
    id v52 = @"evChargersNumber";
  }
  else {
    id v52 = @"ev_chargers_number";
  }
  v53 = [v5 objectForKeyedSubscript:v52];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = [GEOPDPlaceSummaryLayoutUnitEVChargersNumber alloc];
    if (a3) {
      uint64_t v55 = [(GEOPDPlaceSummaryLayoutUnitEVChargersNumber *)v54 initWithJSON:v53];
    }
    else {
      uint64_t v55 = [(GEOPDPlaceSummaryLayoutUnitEVChargersNumber *)v54 initWithDictionary:v53];
    }
    v56 = (void *)v55;
    [a1 setEvChargersNumber:v55];
  }
  if (a3) {
    v57 = @"ugcUserSubmittedRecommendations";
  }
  else {
    v57 = @"ugc_user_submitted_recommendations";
  }
  v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v59 = [GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations alloc];
    if (a3) {
      uint64_t v60 = [(GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations *)v59 initWithJSON:v58];
    }
    else {
      uint64_t v60 = [(GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations *)v59 initWithDictionary:v58];
    }
    v61 = (void *)v60;
    [a1 setUgcUserSubmittedRecommendations:v60];
  }
  v62 = [v5 objectForKeyedSubscript:@"string"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v63 = [GEOPDPlaceSummaryLayoutUnitString alloc];
    if (a3) {
      uint64_t v64 = [(GEOPDPlaceSummaryLayoutUnitString *)v63 initWithJSON:v62];
    }
    else {
      uint64_t v64 = [(GEOPDPlaceSummaryLayoutUnitString *)v63 initWithDictionary:v62];
    }
    v65 = (void *)v64;
    [a1 setString:v64];
  }
  if (a3) {
    id v66 = @"serverOverride";
  }
  else {
    id v66 = @"server_override";
  }
  v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v68 = [GEOPDPlaceSummaryLayoutUnitServerOverride alloc];
    if (a3) {
      uint64_t v69 = [(GEOPDPlaceSummaryLayoutUnitServerOverride *)v68 initWithJSON:v67];
    }
    else {
      uint64_t v69 = [(GEOPDPlaceSummaryLayoutUnitServerOverride *)v68 initWithDictionary:v67];
    }
    v70 = (void *)v69;
    [a1 setServerOverride:v69];
  }
  id v71 = [v5 objectForKeyedSubscript:@"containment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v72 = [GEOPDPlaceSummaryLayoutUnitContainment alloc];
    if (a3) {
      uint64_t v73 = [(GEOPDPlaceSummaryLayoutUnitContainment *)v72 initWithJSON:v71];
    }
    else {
      uint64_t v73 = [(GEOPDPlaceSummaryLayoutUnitContainment *)v72 initWithDictionary:v71];
    }
    v74 = (void *)v73;
    [a1 setContainment:v73];
  }
  v75 = [v5 objectForKeyedSubscript:@"recent"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v76 = [GEOPDPlaceSummaryLayoutUnitRecent alloc];
    if (a3) {
      uint64_t v77 = [(GEOPDPlaceSummaryLayoutUnitRecent *)v76 initWithJSON:v75];
    }
    else {
      uint64_t v77 = [(GEOPDPlaceSummaryLayoutUnitRecent *)v76 initWithDictionary:v75];
    }
    v78 = (void *)v77;
    [a1 setRecent:v77];
  }
  if (a3) {
    v79 = @"highlightMain";
  }
  else {
    v79 = @"highlight_main";
  }
  v80 = [v5 objectForKeyedSubscript:v79];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v81 = [GEOPDPlaceSummaryLayoutUnitHighlightMain alloc];
    if (a3) {
      uint64_t v82 = [(GEOPDPlaceSummaryLayoutUnitHighlightMain *)v81 initWithJSON:v80];
    }
    else {
      uint64_t v82 = [(GEOPDPlaceSummaryLayoutUnitHighlightMain *)v81 initWithDictionary:v80];
    }
    v83 = (void *)v82;
    [a1 setHighlightMain:v82];
  }
  if (a3) {
    v84 = @"highlightExtra";
  }
  else {
    v84 = @"highlight_extra";
  }
  v85 = [v5 objectForKeyedSubscript:v84];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v86 = [GEOPDPlaceSummaryLayoutUnitHighlightExtra alloc];
    if (a3) {
      uint64_t v87 = [(GEOPDPlaceSummaryLayoutUnitHighlightExtra *)v86 initWithJSON:v85];
    }
    else {
      uint64_t v87 = [(GEOPDPlaceSummaryLayoutUnitHighlightExtra *)v86 initWithDictionary:v85];
    }
    v88 = (void *)v87;
    [a1 setHighlightExtra:v87];
  }
  if (a3) {
    v89 = @"publisherNameForGuide";
  }
  else {
    v89 = @"publisher_name_for_guide";
  }
  v90 = [v5 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v91 = [GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide alloc];
    if (a3) {
      uint64_t v92 = [(GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide *)v91 initWithJSON:v90];
    }
    else {
      uint64_t v92 = [(GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide *)v91 initWithDictionary:v90];
    }
    v93 = (void *)v92;
    [a1 setPublisherNameForGuide:v92];
  }
  if (a3) {
    v94 = @"numPlacesInGuide";
  }
  else {
    v94 = @"num_places_in_guide";
  }
  v95 = [v5 objectForKeyedSubscript:v94];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v96 = [GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide alloc];
    if (a3) {
      uint64_t v97 = [(GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)v96 initWithJSON:v95];
    }
    else {
      uint64_t v97 = [(GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)v96 initWithDictionary:v95];
    }
    v98 = (void *)v97;
    [a1 setNumPlacesInGuide:v97];
  }
  if (a3) {
    id v99 = @"publisherDescription";
  }
  else {
    id v99 = @"publisher_description";
  }
  v100 = [v5 objectForKeyedSubscript:v99];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v101 = [GEOPDPlaceSummaryLayoutUnitPublisherDescription alloc];
    if (a3) {
      uint64_t v102 = [(GEOPDPlaceSummaryLayoutUnitPublisherDescription *)v101 initWithJSON:v100];
    }
    else {
      uint64_t v102 = [(GEOPDPlaceSummaryLayoutUnitPublisherDescription *)v101 initWithDictionary:v100];
    }
    v103 = (void *)v102;
    [a1 setPublisherDescription:v102];
  }
  if (a3) {
    id v104 = @"secondaryName";
  }
  else {
    id v104 = @"secondary_name";
  }
  v105 = [v5 objectForKeyedSubscript:v104];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v106 = [GEOPDPlaceSummaryLayoutUnitSecondaryName alloc];
    if (a3) {
      uint64_t v107 = [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)v106 initWithJSON:v105];
    }
    else {
      uint64_t v107 = [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)v106 initWithDictionary:v105];
    }
    v108 = (void *)v107;
    [a1 setSecondaryName:v107];
  }
  id v109 = [v5 objectForKeyedSubscript:@"factoid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v110 = [GEOPDPlaceSummaryLayoutUnitFactoid alloc];
    if (a3) {
      uint64_t v111 = [(GEOPDPlaceSummaryLayoutUnitFactoid *)v110 initWithJSON:v109];
    }
    else {
      uint64_t v111 = [(GEOPDPlaceSummaryLayoutUnitFactoid *)v110 initWithDictionary:v109];
    }
    v112 = (void *)v111;
    [a1 setFactoid:v111];
  }
  if (a3) {
    v113 = @"arpRatings";
  }
  else {
    v113 = @"arp_ratings";
  }
  id v114 = [v5 objectForKeyedSubscript:v113];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v115 = [GEOPDPlaceSummaryLayoutUnitArpRatings alloc];
    if (a3) {
      uint64_t v116 = [(GEOPDPlaceSummaryLayoutUnitArpRatings *)v115 initWithJSON:v114];
    }
    else {
      uint64_t v116 = [(GEOPDPlaceSummaryLayoutUnitArpRatings *)v115 initWithDictionary:v114];
    }
    v117 = (void *)v116;
    [a1 setArpRatings:v116];
  }
  if (a3) {
    v118 = @"realTimeEvChargerAvailability";
  }
  else {
    v118 = @"real_time_ev_charger_availability";
  }
  id v119 = [v5 objectForKeyedSubscript:v118];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v120 = [GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability alloc];
    if (a3) {
      uint64_t v121 = [(GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability *)v120 initWithJSON:v119];
    }
    else {
      uint64_t v121 = [(GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability *)v120 initWithDictionary:v119];
    }
    v122 = (void *)v121;
    [a1 setRealTimeEvChargerAvailability:v121];
  }
  if (a3) {
    v123 = @"detourTime";
  }
  else {
    v123 = @"detour_time";
  }
  id v124 = [v5 objectForKeyedSubscript:v123];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v125 = [GEOPDPlaceSummaryLayoutUnitDetourTime alloc];
    if (a3) {
      uint64_t v126 = [(GEOPDPlaceSummaryLayoutUnitDetourTime *)v125 initWithJSON:v124];
    }
    else {
      uint64_t v126 = [(GEOPDPlaceSummaryLayoutUnitDetourTime *)v125 initWithDictionary:v124];
    }
    v127 = (void *)v126;
    [a1 setDetourTime:v126];
  }
  if (a3) {
    v128 = @"hikingDifficulty";
  }
  else {
    v128 = @"hiking_difficulty";
  }
  id v129 = [v5 objectForKeyedSubscript:v128];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v130 = [GEOPDPlaceSummaryLayoutUnitHikingDifficulty alloc];
    if (a3) {
      uint64_t v131 = [(GEOPDPlaceSummaryLayoutUnitHikingDifficulty *)v130 initWithJSON:v129];
    }
    else {
      uint64_t v131 = [(GEOPDPlaceSummaryLayoutUnitHikingDifficulty *)v130 initWithDictionary:v129];
    }
    v132 = (void *)v131;
    [a1 setHikingDifficulty:v131];
  }
  if (a3) {
    v133 = @"hikingTrailLength";
  }
  else {
    v133 = @"hiking_trail_length";
  }
  id v134 = [v5 objectForKeyedSubscript:v133];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v135 = [GEOPDPlaceSummaryLayoutUnitHikingTrailLength alloc];
    if (a3) {
      uint64_t v136 = [(GEOPDPlaceSummaryLayoutUnitHikingTrailLength *)v135 initWithJSON:v134];
    }
    else {
      uint64_t v136 = [(GEOPDPlaceSummaryLayoutUnitHikingTrailLength *)v135 initWithDictionary:v134];
    }
    v137 = (void *)v136;
    [a1 setHikingTrailLength:v136];
  }
  if (a3) {
    v138 = @"photoCarousel";
  }
  else {
    v138 = @"photo_carousel";
  }
  id v139 = [v5 objectForKeyedSubscript:v138];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v140 = [GEOPDPlaceSummaryLayoutUnitPhotoCarousel alloc];
    if (a3) {
      uint64_t v141 = [(GEOPDPlaceSummaryLayoutUnitPhotoCarousel *)v140 initWithJSON:v139];
    }
    else {
      uint64_t v141 = [(GEOPDPlaceSummaryLayoutUnitPhotoCarousel *)v140 initWithDictionary:v139];
    }
    v142 = (void *)v141;
    [a1 setPhotoCarousel:v141];
  }
  if (a3) {
    v143 = @"userNote";
  }
  else {
    v143 = @"user_note";
  }
  id v144 = [v5 objectForKeyedSubscript:v143];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v145 = [GEOPDPlaceSummaryLayoutUnitUserNote alloc];
    if (a3) {
      uint64_t v146 = [(GEOPDPlaceSummaryLayoutUnitUserNote *)v145 initWithJSON:v144];
    }
    else {
      uint64_t v146 = [(GEOPDPlaceSummaryLayoutUnitUserNote *)v145 initWithDictionary:v144];
    }
    v147 = (void *)v146;
    [a1 setUserNote:v146];
  }
  if (a3) {
    v148 = @"inUserLibrary";
  }
  else {
    v148 = @"in_user_library";
  }
  id v149 = [v5 objectForKeyedSubscript:v148];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v150 = [GEOPDPlaceSummaryLayoutUnitInUserLibrary alloc];
    if (a3) {
      uint64_t v151 = [(GEOPDPlaceSummaryLayoutUnitInUserLibrary *)v150 initWithJSON:v149];
    }
    else {
      uint64_t v151 = [(GEOPDPlaceSummaryLayoutUnitInUserLibrary *)v150 initWithDictionary:v149];
    }
    v152 = (void *)v151;
    [a1 setInUserLibrary:v151];
  }
  if (a3) {
    v153 = @"hikeRouteElevationGainLoss";
  }
  else {
    v153 = @"hike_route_elevation_gain_loss";
  }
  id v154 = [v5 objectForKeyedSubscript:v153];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v155 = [GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss alloc];
    if (a3) {
      uint64_t v156 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *)v155 initWithJSON:v154];
    }
    else {
      uint64_t v156 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *)v155 initWithDictionary:v154];
    }
    v157 = (void *)v156;
    [a1 setHikeRouteElevationGainLoss:v156];
  }
  if (a3) {
    v158 = @"hikeRouteType";
  }
  else {
    v158 = @"hike_route_type";
  }
  id v159 = [v5 objectForKeyedSubscript:v158];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v160 = [GEOPDPlaceSummaryLayoutUnitHikeRouteType alloc];
    if (a3) {
      uint64_t v161 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteType *)v160 initWithJSON:v159];
    }
    else {
      uint64_t v161 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteType *)v160 initWithDictionary:v159];
    }
    v162 = (void *)v161;
    [a1 setHikeRouteType:v161];
  }
  if (a3) {
    v163 = @"hikeRouteDuration";
  }
  else {
    v163 = @"hike_route_duration";
  }
  v164 = [v5 objectForKeyedSubscript:v163];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v165 = [GEOPDPlaceSummaryLayoutUnitHikeRouteDuration alloc];
    if (a3) {
      uint64_t v166 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteDuration *)v165 initWithJSON:v164];
    }
    else {
      uint64_t v166 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteDuration *)v165 initWithDictionary:v164];
    }
    id v167 = (void *)v166;
    [a1 setHikeRouteDuration:v166];
  }
  if (a3) {
    v168 = @"hikeRouteLength";
  }
  else {
    v168 = @"hike_route_length";
  }
  v169 = [v5 objectForKeyedSubscript:v168];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v170 = [GEOPDPlaceSummaryLayoutUnitHikeRouteLength alloc];
    if (a3) {
      uint64_t v171 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteLength *)v170 initWithJSON:v169];
    }
    else {
      uint64_t v171 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteLength *)v170 initWithDictionary:v169];
    }
    v172 = (void *)v171;
    [a1 setHikeRouteLength:v171];
  }
  if (a3) {
    v173 = @"layoutPriority";
  }
  else {
    v173 = @"layout_priority";
  }
  v174 = [v5 objectForKeyedSubscript:v173];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLayoutPriority:", objc_msgSend(v174, "intValue"));
  }

  if (a3) {
    v175 = @"alternativeUnit";
  }
  else {
    v175 = @"alternative_unit";
  }
  v176 = [v5 objectForKeyedSubscript:v175];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v177 = [GEOPDPlaceSummaryLayoutUnit alloc];
    if (a3) {
      uint64_t v178 = [(GEOPDPlaceSummaryLayoutUnit *)v177 initWithJSON:v176];
    }
    else {
      uint64_t v178 = [(GEOPDPlaceSummaryLayoutUnit *)v177 initWithDictionary:v176];
    }
    v179 = (void *)v178;
    [a1 setAlternativeUnit:v178];
  }
  a1 = a1;

LABEL_342:
  return a1;
}

- (GEOPDPlaceSummaryLayoutUnit)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnit *)-[GEOPDPlaceSummaryLayoutUnit _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_615;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_616;
    }
    GEOPDPlaceSummaryLayoutUnitReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceSummaryLayoutUnitCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceSummaryLayoutUnitIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDPlaceSummaryLayoutUnit *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_name) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_category) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_distance) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_price) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hours) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_address) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_ratings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitShields) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_userGeneratedGuides) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_curatedGuides) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_evChargersNumber) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_ugcUserSubmittedRecommendations) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_string) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_serverOverride) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_containment) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_recent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_highlightMain) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_highlightExtra) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_publisherNameForGuide) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_numPlacesInGuide) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_publisherDescription) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_secondaryName) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_factoid) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_arpRatings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_realTimeEvChargerAvailability) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_detourTime) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hikingDifficulty) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hikingTrailLength) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_photoCarousel) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_userNote) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_inUserLibrary) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hikeRouteElevationGainLoss) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hikeRouteType) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hikeRouteDuration) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_hikeRouteLength) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_alternativeUnit) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDPlaceSummaryLayoutUnit _readAlternativeUnit]((uint64_t)self);
  if ([(GEOPDPlaceSummaryLayoutUnit *)self->_alternativeUnit hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDPlaceSummaryLayoutUnit _readString]((uint64_t)self);
  string = self->_string;

  return [(GEOPDPlaceSummaryLayoutUnitString *)string hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (char *)a3;
  [(GEOPDPlaceSummaryLayoutUnit *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v5 + 1, self->_reader);
  *((_DWORD *)v5 + 76) = self->_readerMarkPos;
  *((_DWORD *)v5 + 77) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 80) = self->_type;
    *(void *)(v5 + 324) |= 2uLL;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    int v4 = v5;
  }
  if (self->_category)
  {
    objc_msgSend(v5, "setCategory:");
    int v4 = v5;
  }
  if (self->_distance)
  {
    objc_msgSend(v5, "setDistance:");
    int v4 = v5;
  }
  if (self->_price)
  {
    objc_msgSend(v5, "setPrice:");
    int v4 = v5;
  }
  if (self->_hours)
  {
    objc_msgSend(v5, "setHours:");
    int v4 = v5;
  }
  if (self->_address)
  {
    objc_msgSend(v5, "setAddress:");
    int v4 = v5;
  }
  if (self->_ratings)
  {
    objc_msgSend(v5, "setRatings:");
    int v4 = v5;
  }
  if (self->_transitShields)
  {
    objc_msgSend(v5, "setTransitShields:");
    int v4 = v5;
  }
  if (self->_userGeneratedGuides)
  {
    objc_msgSend(v5, "setUserGeneratedGuides:");
    int v4 = v5;
  }
  if (self->_curatedGuides)
  {
    objc_msgSend(v5, "setCuratedGuides:");
    int v4 = v5;
  }
  if (self->_evChargersNumber)
  {
    objc_msgSend(v5, "setEvChargersNumber:");
    int v4 = v5;
  }
  if (self->_ugcUserSubmittedRecommendations)
  {
    objc_msgSend(v5, "setUgcUserSubmittedRecommendations:");
    int v4 = v5;
  }
  if (self->_string)
  {
    objc_msgSend(v5, "setString:");
    int v4 = v5;
  }
  if (self->_serverOverride)
  {
    objc_msgSend(v5, "setServerOverride:");
    int v4 = v5;
  }
  if (self->_containment)
  {
    objc_msgSend(v5, "setContainment:");
    int v4 = v5;
  }
  if (self->_recent)
  {
    objc_msgSend(v5, "setRecent:");
    int v4 = v5;
  }
  if (self->_highlightMain)
  {
    objc_msgSend(v5, "setHighlightMain:");
    int v4 = v5;
  }
  if (self->_highlightExtra)
  {
    objc_msgSend(v5, "setHighlightExtra:");
    int v4 = v5;
  }
  if (self->_publisherNameForGuide)
  {
    objc_msgSend(v5, "setPublisherNameForGuide:");
    int v4 = v5;
  }
  if (self->_numPlacesInGuide)
  {
    objc_msgSend(v5, "setNumPlacesInGuide:");
    int v4 = v5;
  }
  if (self->_publisherDescription)
  {
    objc_msgSend(v5, "setPublisherDescription:");
    int v4 = v5;
  }
  if (self->_secondaryName)
  {
    objc_msgSend(v5, "setSecondaryName:");
    int v4 = v5;
  }
  if (self->_factoid)
  {
    objc_msgSend(v5, "setFactoid:");
    int v4 = v5;
  }
  if (self->_arpRatings)
  {
    objc_msgSend(v5, "setArpRatings:");
    int v4 = v5;
  }
  if (self->_realTimeEvChargerAvailability)
  {
    objc_msgSend(v5, "setRealTimeEvChargerAvailability:");
    int v4 = v5;
  }
  if (self->_detourTime)
  {
    objc_msgSend(v5, "setDetourTime:");
    int v4 = v5;
  }
  if (self->_hikingDifficulty)
  {
    objc_msgSend(v5, "setHikingDifficulty:");
    int v4 = v5;
  }
  if (self->_hikingTrailLength)
  {
    objc_msgSend(v5, "setHikingTrailLength:");
    int v4 = v5;
  }
  if (self->_photoCarousel)
  {
    objc_msgSend(v5, "setPhotoCarousel:");
    int v4 = v5;
  }
  if (self->_userNote)
  {
    objc_msgSend(v5, "setUserNote:");
    int v4 = v5;
  }
  if (self->_inUserLibrary)
  {
    objc_msgSend(v5, "setInUserLibrary:");
    int v4 = v5;
  }
  if (self->_hikeRouteElevationGainLoss)
  {
    objc_msgSend(v5, "setHikeRouteElevationGainLoss:");
    int v4 = v5;
  }
  if (self->_hikeRouteType)
  {
    objc_msgSend(v5, "setHikeRouteType:");
    int v4 = v5;
  }
  if (self->_hikeRouteDuration)
  {
    objc_msgSend(v5, "setHikeRouteDuration:");
    int v4 = v5;
  }
  if (self->_hikeRouteLength)
  {
    objc_msgSend(v5, "setHikeRouteLength:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 79) = self->_layoutPriority;
    *(void *)(v4 + 324) |= 1uLL;
  }
  if (self->_alternativeUnit)
  {
    objc_msgSend(v5, "setAlternativeUnit:");
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
    if ((*((unsigned char *)&self->_flags + 4) & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceSummaryLayoutUnitReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceSummaryLayoutUnit *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 320) = self->_type;
    *(void *)(v5 + 324) |= 2uLL;
  }
  id v9 = [(GEOPDPlaceSummaryLayoutUnitName *)self->_name copyWithZone:a3];
  v10 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v9;

  id v11 = [(GEOPDPlaceSummaryLayoutUnitCategory *)self->_category copyWithZone:a3];
  id v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOPDPlaceSummaryLayoutUnitDistance *)self->_distance copyWithZone:a3];
  v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  id v15 = [(GEOPDPlaceSummaryLayoutUnitPrice *)self->_price copyWithZone:a3];
  v16 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v15;

  id v17 = [(GEOPDPlaceSummaryLayoutUnitHours *)self->_hours copyWithZone:a3];
  id v18 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v17;

  id v19 = [(GEOPDPlaceSummaryLayoutUnitAddress *)self->_address copyWithZone:a3];
  v20 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v19;

  id v21 = [(GEOPDPlaceSummaryLayoutUnitRatings *)self->_ratings copyWithZone:a3];
  v22 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v21;

  id v23 = [(GEOPDPlaceSummaryLayoutUnitTransitShields *)self->_transitShields copyWithZone:a3];
  id v24 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v23;

  id v25 = [(GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides *)self->_userGeneratedGuides copyWithZone:a3];
  v26 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v25;

  id v27 = [(GEOPDPlaceSummaryLayoutUnitCuratedGuides *)self->_curatedGuides copyWithZone:a3];
  v28 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v27;

  id v29 = [(GEOPDPlaceSummaryLayoutUnitEVChargersNumber *)self->_evChargersNumber copyWithZone:a3];
  v30 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v29;

  id v31 = [(GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations *)self->_ugcUserSubmittedRecommendations copyWithZone:a3];
  id v32 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v31;

  id v33 = [(GEOPDPlaceSummaryLayoutUnitString *)self->_string copyWithZone:a3];
  v34 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v33;

  id v35 = [(GEOPDPlaceSummaryLayoutUnitServerOverride *)self->_serverOverride copyWithZone:a3];
  v36 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v35;

  id v37 = [(GEOPDPlaceSummaryLayoutUnitContainment *)self->_containment copyWithZone:a3];
  v38 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v37;

  id v39 = [(GEOPDPlaceSummaryLayoutUnitRecent *)self->_recent copyWithZone:a3];
  uint64_t v40 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v39;

  id v41 = [(GEOPDPlaceSummaryLayoutUnitHighlightMain *)self->_highlightMain copyWithZone:a3];
  id v42 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v41;

  id v43 = [(GEOPDPlaceSummaryLayoutUnitHighlightExtra *)self->_highlightExtra copyWithZone:a3];
  v44 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v43;

  id v45 = [(GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide *)self->_publisherNameForGuide copyWithZone:a3];
  v46 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v45;

  id v47 = [(GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)self->_numPlacesInGuide copyWithZone:a3];
  v48 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v47;

  id v49 = [(GEOPDPlaceSummaryLayoutUnitPublisherDescription *)self->_publisherDescription copyWithZone:a3];
  uint64_t v50 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v49;

  id v51 = [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)self->_secondaryName copyWithZone:a3];
  id v52 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v51;

  id v53 = [(GEOPDPlaceSummaryLayoutUnitFactoid *)self->_factoid copyWithZone:a3];
  v54 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v53;

  id v55 = [(GEOPDPlaceSummaryLayoutUnitArpRatings *)self->_arpRatings copyWithZone:a3];
  v56 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v55;

  id v57 = [(GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability *)self->_realTimeEvChargerAvailability copyWithZone:a3];
  v58 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v57;

  id v59 = [(GEOPDPlaceSummaryLayoutUnitDetourTime *)self->_detourTime copyWithZone:a3];
  uint64_t v60 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v59;

  id v61 = [(GEOPDPlaceSummaryLayoutUnitHikingDifficulty *)self->_hikingDifficulty copyWithZone:a3];
  v62 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v61;

  id v63 = [(GEOPDPlaceSummaryLayoutUnitHikingTrailLength *)self->_hikingTrailLength copyWithZone:a3];
  uint64_t v64 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v63;

  id v65 = [(GEOPDPlaceSummaryLayoutUnitPhotoCarousel *)self->_photoCarousel copyWithZone:a3];
  id v66 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v65;

  id v67 = [(GEOPDPlaceSummaryLayoutUnitUserNote *)self->_userNote copyWithZone:a3];
  v68 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v67;

  id v69 = [(GEOPDPlaceSummaryLayoutUnitInUserLibrary *)self->_inUserLibrary copyWithZone:a3];
  v70 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v69;

  id v71 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *)self->_hikeRouteElevationGainLoss copyWithZone:a3];
  v72 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v71;

  id v73 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteType *)self->_hikeRouteType copyWithZone:a3];
  v74 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v73;

  id v75 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteDuration *)self->_hikeRouteDuration copyWithZone:a3];
  id v76 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v75;

  id v77 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteLength *)self->_hikeRouteLength copyWithZone:a3];
  v78 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v77;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 316) = self->_layoutPriority;
    *(void *)(v5 + 324) |= 1uLL;
  }
  id v79 = [(GEOPDPlaceSummaryLayoutUnit *)self->_alternativeUnit copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v79;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_84;
  }
  [(GEOPDPlaceSummaryLayoutUnit *)self readAll:1];
  [v4 readAll:1];
  uint64_t v5 = *(void *)(v4 + 324);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_type != *((_DWORD *)v4 + 80)) {
      goto LABEL_84;
    }
  }
  else if ((v5 & 2) != 0)
  {
LABEL_84:
    char v43 = 0;
    goto LABEL_85;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 22) && !-[GEOPDPlaceSummaryLayoutUnitName isEqual:](name, "isEqual:")) {
    goto LABEL_84;
  }
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 5))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitCategory isEqual:](category, "isEqual:")) {
      goto LABEL_84;
    }
  }
  distance = self->_distance;
  if ((unint64_t)distance | *((void *)v4 + 9))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitDistance isEqual:](distance, "isEqual:")) {
      goto LABEL_84;
    }
  }
  price = self->_price;
  if ((unint64_t)price | *((void *)v4 + 25))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitPrice isEqual:](price, "isEqual:")) {
      goto LABEL_84;
    }
  }
  hours = self->_hours;
  if ((unint64_t)hours | *((void *)v4 + 20))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHours isEqual:](hours, "isEqual:")) {
      goto LABEL_84;
    }
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 2))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitAddress isEqual:](address, "isEqual:")) {
      goto LABEL_84;
    }
  }
  ratings = self->_ratings;
  if ((unint64_t)ratings | *((void *)v4 + 28))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitRatings isEqual:](ratings, "isEqual:")) {
      goto LABEL_84;
    }
  }
  transitShields = self->_transitShields;
  if ((unint64_t)transitShields | *((void *)v4 + 34))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitTransitShields isEqual:](transitShields, "isEqual:")) {
      goto LABEL_84;
    }
  }
  userGeneratedGuides = self->_userGeneratedGuides;
  if ((unint64_t)userGeneratedGuides | *((void *)v4 + 36))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides isEqual:](userGeneratedGuides, "isEqual:")) {
      goto LABEL_84;
    }
  }
  curatedGuides = self->_curatedGuides;
  if ((unint64_t)curatedGuides | *((void *)v4 + 7))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitCuratedGuides isEqual:](curatedGuides, "isEqual:")) {
      goto LABEL_84;
    }
  }
  evChargersNumber = self->_evChargersNumber;
  if ((unint64_t)evChargersNumber | *((void *)v4 + 10))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitEVChargersNumber isEqual:](evChargersNumber, "isEqual:")) {
      goto LABEL_84;
    }
  }
  ugcUserSubmittedRecommendations = self->_ugcUserSubmittedRecommendations;
  if ((unint64_t)ugcUserSubmittedRecommendations | *((void *)v4 + 35))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations isEqual:](ugcUserSubmittedRecommendations, "isEqual:"))goto LABEL_84; {
  }
    }
  string = self->_string;
  if ((unint64_t)string | *((void *)v4 + 33))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitString isEqual:](string, "isEqual:")) {
      goto LABEL_84;
    }
  }
  serverOverride = self->_serverOverride;
  if ((unint64_t)serverOverride | *((void *)v4 + 32))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitServerOverride isEqual:](serverOverride, "isEqual:")) {
      goto LABEL_84;
    }
  }
  containment = self->_containment;
  if ((unint64_t)containment | *((void *)v4 + 6))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitContainment isEqual:](containment, "isEqual:")) {
      goto LABEL_84;
    }
  }
  recent = self->_recent;
  if ((unint64_t)recent | *((void *)v4 + 30))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitRecent isEqual:](recent, "isEqual:")) {
      goto LABEL_84;
    }
  }
  highlightMain = self->_highlightMain;
  if ((unint64_t)highlightMain | *((void *)v4 + 13))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHighlightMain isEqual:](highlightMain, "isEqual:")) {
      goto LABEL_84;
    }
  }
  highlightExtra = self->_highlightExtra;
  if ((unint64_t)highlightExtra | *((void *)v4 + 12))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHighlightExtra isEqual:](highlightExtra, "isEqual:")) {
      goto LABEL_84;
    }
  }
  publisherNameForGuide = self->_publisherNameForGuide;
  if ((unint64_t)publisherNameForGuide | *((void *)v4 + 27))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide isEqual:](publisherNameForGuide, "isEqual:")) {
      goto LABEL_84;
    }
  }
  numPlacesInGuide = self->_numPlacesInGuide;
  if ((unint64_t)numPlacesInGuide | *((void *)v4 + 23))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide isEqual:](numPlacesInGuide, "isEqual:")) {
      goto LABEL_84;
    }
  }
  publisherDescription = self->_publisherDescription;
  if ((unint64_t)publisherDescription | *((void *)v4 + 26))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitPublisherDescription isEqual:](publisherDescription, "isEqual:")) {
      goto LABEL_84;
    }
  }
  secondaryName = self->_secondaryName;
  if ((unint64_t)secondaryName | *((void *)v4 + 31))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitSecondaryName isEqual:](secondaryName, "isEqual:")) {
      goto LABEL_84;
    }
  }
  factoid = self->_factoid;
  if ((unint64_t)factoid | *((void *)v4 + 11))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitFactoid isEqual:](factoid, "isEqual:")) {
      goto LABEL_84;
    }
  }
  arpRatings = self->_arpRatings;
  if ((unint64_t)arpRatings | *((void *)v4 + 4))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitArpRatings isEqual:](arpRatings, "isEqual:")) {
      goto LABEL_84;
    }
  }
  realTimeEvChargerAvailability = self->_realTimeEvChargerAvailability;
  if ((unint64_t)realTimeEvChargerAvailability | *((void *)v4 + 29))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability isEqual:](realTimeEvChargerAvailability, "isEqual:"))goto LABEL_84; {
  }
    }
  detourTime = self->_detourTime;
  if ((unint64_t)detourTime | *((void *)v4 + 8))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitDetourTime isEqual:](detourTime, "isEqual:")) {
      goto LABEL_84;
    }
  }
  hikingDifficulty = self->_hikingDifficulty;
  if ((unint64_t)hikingDifficulty | *((void *)v4 + 18))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikingDifficulty isEqual:](hikingDifficulty, "isEqual:")) {
      goto LABEL_84;
    }
  }
  hikingTrailLength = self->_hikingTrailLength;
  if ((unint64_t)hikingTrailLength | *((void *)v4 + 19))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikingTrailLength isEqual:](hikingTrailLength, "isEqual:")) {
      goto LABEL_84;
    }
  }
  photoCarousel = self->_photoCarousel;
  if ((unint64_t)photoCarousel | *((void *)v4 + 24))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitPhotoCarousel isEqual:](photoCarousel, "isEqual:")) {
      goto LABEL_84;
    }
  }
  userNote = self->_userNote;
  if ((unint64_t)userNote | *((void *)v4 + 37))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitUserNote isEqual:](userNote, "isEqual:")) {
      goto LABEL_84;
    }
  }
  inUserLibrary = self->_inUserLibrary;
  if ((unint64_t)inUserLibrary | *((void *)v4 + 21))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitInUserLibrary isEqual:](inUserLibrary, "isEqual:")) {
      goto LABEL_84;
    }
  }
  hikeRouteElevationGainLoss = self->_hikeRouteElevationGainLoss;
  if ((unint64_t)hikeRouteElevationGainLoss | *((void *)v4 + 15))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss isEqual:](hikeRouteElevationGainLoss, "isEqual:"))goto LABEL_84; {
  }
    }
  hikeRouteType = self->_hikeRouteType;
  if ((unint64_t)hikeRouteType | *((void *)v4 + 17))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikeRouteType isEqual:](hikeRouteType, "isEqual:")) {
      goto LABEL_84;
    }
  }
  hikeRouteDuration = self->_hikeRouteDuration;
  if ((unint64_t)hikeRouteDuration | *((void *)v4 + 14))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikeRouteDuration isEqual:](hikeRouteDuration, "isEqual:")) {
      goto LABEL_84;
    }
  }
  hikeRouteLength = self->_hikeRouteLength;
  if ((unint64_t)hikeRouteLength | *((void *)v4 + 16))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikeRouteLength isEqual:](hikeRouteLength, "isEqual:")) {
      goto LABEL_84;
    }
  }
  uint64_t v41 = *(void *)(v4 + 324);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v41 & 1) == 0 || self->_layoutPriority != *((_DWORD *)v4 + 79)) {
      goto LABEL_84;
    }
  }
  else if (v41)
  {
    goto LABEL_84;
  }
  alternativeUnit = self->_alternativeUnit;
  if ((unint64_t)alternativeUnit | *((void *)v4 + 3)) {
    char v43 = -[GEOPDPlaceSummaryLayoutUnit isEqual:](alternativeUnit, "isEqual:");
  }
  else {
    char v43 = 1;
  }
LABEL_85:

  return v43;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryLayoutUnit *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v40 = 2654435761 * self->_type;
  }
  else {
    uint64_t v40 = 0;
  }
  unint64_t v39 = [(GEOPDPlaceSummaryLayoutUnitName *)self->_name hash];
  unint64_t v38 = [(GEOPDPlaceSummaryLayoutUnitCategory *)self->_category hash];
  unint64_t v37 = [(GEOPDPlaceSummaryLayoutUnitDistance *)self->_distance hash];
  unint64_t v36 = [(GEOPDPlaceSummaryLayoutUnitPrice *)self->_price hash];
  unint64_t v35 = [(GEOPDPlaceSummaryLayoutUnitHours *)self->_hours hash];
  unint64_t v34 = [(GEOPDPlaceSummaryLayoutUnitAddress *)self->_address hash];
  unint64_t v33 = [(GEOPDPlaceSummaryLayoutUnitRatings *)self->_ratings hash];
  unint64_t v32 = [(GEOPDPlaceSummaryLayoutUnitTransitShields *)self->_transitShields hash];
  unint64_t v31 = [(GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides *)self->_userGeneratedGuides hash];
  unint64_t v30 = [(GEOPDPlaceSummaryLayoutUnitCuratedGuides *)self->_curatedGuides hash];
  unint64_t v29 = [(GEOPDPlaceSummaryLayoutUnitEVChargersNumber *)self->_evChargersNumber hash];
  unint64_t v28 = [(GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations *)self->_ugcUserSubmittedRecommendations hash];
  unint64_t v27 = [(GEOPDPlaceSummaryLayoutUnitString *)self->_string hash];
  unint64_t v26 = [(GEOPDPlaceSummaryLayoutUnitServerOverride *)self->_serverOverride hash];
  unint64_t v25 = [(GEOPDPlaceSummaryLayoutUnitContainment *)self->_containment hash];
  unint64_t v24 = [(GEOPDPlaceSummaryLayoutUnitRecent *)self->_recent hash];
  unint64_t v23 = [(GEOPDPlaceSummaryLayoutUnitHighlightMain *)self->_highlightMain hash];
  unint64_t v22 = [(GEOPDPlaceSummaryLayoutUnitHighlightExtra *)self->_highlightExtra hash];
  unint64_t v21 = [(GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide *)self->_publisherNameForGuide hash];
  unint64_t v20 = [(GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *)self->_numPlacesInGuide hash];
  unint64_t v19 = [(GEOPDPlaceSummaryLayoutUnitPublisherDescription *)self->_publisherDescription hash];
  unint64_t v18 = [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)self->_secondaryName hash];
  unint64_t v17 = [(GEOPDPlaceSummaryLayoutUnitFactoid *)self->_factoid hash];
  unint64_t v16 = [(GEOPDPlaceSummaryLayoutUnitArpRatings *)self->_arpRatings hash];
  unint64_t v15 = [(GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability *)self->_realTimeEvChargerAvailability hash];
  unint64_t v14 = [(GEOPDPlaceSummaryLayoutUnitDetourTime *)self->_detourTime hash];
  unint64_t v3 = [(GEOPDPlaceSummaryLayoutUnitHikingDifficulty *)self->_hikingDifficulty hash];
  unint64_t v4 = [(GEOPDPlaceSummaryLayoutUnitHikingTrailLength *)self->_hikingTrailLength hash];
  unint64_t v5 = [(GEOPDPlaceSummaryLayoutUnitPhotoCarousel *)self->_photoCarousel hash];
  unint64_t v6 = [(GEOPDPlaceSummaryLayoutUnitUserNote *)self->_userNote hash];
  unint64_t v7 = [(GEOPDPlaceSummaryLayoutUnitInUserLibrary *)self->_inUserLibrary hash];
  unint64_t v8 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *)self->_hikeRouteElevationGainLoss hash];
  unint64_t v9 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteType *)self->_hikeRouteType hash];
  unint64_t v10 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteDuration *)self->_hikeRouteDuration hash];
  unint64_t v11 = [(GEOPDPlaceSummaryLayoutUnitHikeRouteLength *)self->_hikeRouteLength hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v12 = 2654435761 * self->_layoutPriority;
  }
  else {
    uint64_t v12 = 0;
  }
  return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(GEOPDPlaceSummaryLayoutUnit *)self->_alternativeUnit hash];
}

- (void)mergeFrom:(id)a3
{
  id v77 = (int *)a3;
  [v77 readAll:0];
  unint64_t v4 = v77;
  if ((v77[81] & 2) != 0)
  {
    self->_type = v77[80];
    *(void *)&self->_flags |= 2uLL;
  }
  name = self->_name;
  uint64_t v6 = *((void *)v77 + 22);
  if (name)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDPlaceSummaryLayoutUnitName mergeFrom:](name, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDPlaceSummaryLayoutUnit setName:](self, "setName:");
  }
  unint64_t v4 = v77;
LABEL_9:
  category = self->_category;
  uint64_t v8 = *((void *)v4 + 5);
  if (category)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDPlaceSummaryLayoutUnitCategory mergeFrom:](category, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDPlaceSummaryLayoutUnit setCategory:](self, "setCategory:");
  }
  unint64_t v4 = v77;
LABEL_15:
  distance = self->_distance;
  uint64_t v10 = *((void *)v4 + 9);
  if (distance)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDPlaceSummaryLayoutUnitDistance mergeFrom:](distance, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDPlaceSummaryLayoutUnit setDistance:](self, "setDistance:");
  }
  unint64_t v4 = v77;
LABEL_21:
  price = self->_price;
  uint64_t v12 = *((void *)v4 + 25);
  if (price)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDPlaceSummaryLayoutUnitPrice mergeFrom:](price, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDPlaceSummaryLayoutUnit setPrice:](self, "setPrice:");
  }
  unint64_t v4 = v77;
LABEL_27:
  hours = self->_hours;
  uint64_t v14 = *((void *)v4 + 20);
  if (hours)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOPDPlaceSummaryLayoutUnitHours mergeFrom:](hours, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOPDPlaceSummaryLayoutUnit setHours:](self, "setHours:");
  }
  unint64_t v4 = v77;
LABEL_33:
  address = self->_address;
  uint64_t v16 = *((void *)v4 + 2);
  if (address)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOPDPlaceSummaryLayoutUnitAddress mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOPDPlaceSummaryLayoutUnit setAddress:](self, "setAddress:");
  }
  unint64_t v4 = v77;
LABEL_39:
  ratings = self->_ratings;
  uint64_t v18 = *((void *)v4 + 28);
  if (ratings)
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEOPDPlaceSummaryLayoutUnitRatings mergeFrom:](ratings, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEOPDPlaceSummaryLayoutUnit setRatings:](self, "setRatings:");
  }
  unint64_t v4 = v77;
LABEL_45:
  transitShields = self->_transitShields;
  uint64_t v20 = *((void *)v4 + 34);
  if (transitShields)
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[GEOPDPlaceSummaryLayoutUnitTransitShields mergeFrom:](transitShields, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[GEOPDPlaceSummaryLayoutUnit setTransitShields:](self, "setTransitShields:");
  }
  unint64_t v4 = v77;
LABEL_51:
  userGeneratedGuides = self->_userGeneratedGuides;
  uint64_t v22 = *((void *)v4 + 36);
  if (userGeneratedGuides)
  {
    if (!v22) {
      goto LABEL_57;
    }
    -[GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides mergeFrom:](userGeneratedGuides, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_57;
    }
    -[GEOPDPlaceSummaryLayoutUnit setUserGeneratedGuides:](self, "setUserGeneratedGuides:");
  }
  unint64_t v4 = v77;
LABEL_57:
  curatedGuides = self->_curatedGuides;
  uint64_t v24 = *((void *)v4 + 7);
  if (curatedGuides)
  {
    if (!v24) {
      goto LABEL_63;
    }
    -[GEOPDPlaceSummaryLayoutUnitCuratedGuides mergeFrom:](curatedGuides, "mergeFrom:");
  }
  else
  {
    if (!v24) {
      goto LABEL_63;
    }
    -[GEOPDPlaceSummaryLayoutUnit setCuratedGuides:](self, "setCuratedGuides:");
  }
  unint64_t v4 = v77;
LABEL_63:
  evChargersNumber = self->_evChargersNumber;
  uint64_t v26 = *((void *)v4 + 10);
  if (evChargersNumber)
  {
    if (!v26) {
      goto LABEL_69;
    }
    -[GEOPDPlaceSummaryLayoutUnitEVChargersNumber mergeFrom:](evChargersNumber, "mergeFrom:");
  }
  else
  {
    if (!v26) {
      goto LABEL_69;
    }
    -[GEOPDPlaceSummaryLayoutUnit setEvChargersNumber:](self, "setEvChargersNumber:");
  }
  unint64_t v4 = v77;
LABEL_69:
  ugcUserSubmittedRecommendations = self->_ugcUserSubmittedRecommendations;
  uint64_t v28 = *((void *)v4 + 35);
  if (ugcUserSubmittedRecommendations)
  {
    if (!v28) {
      goto LABEL_75;
    }
    -[GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations mergeFrom:](ugcUserSubmittedRecommendations, "mergeFrom:");
  }
  else
  {
    if (!v28) {
      goto LABEL_75;
    }
    -[GEOPDPlaceSummaryLayoutUnit setUgcUserSubmittedRecommendations:](self, "setUgcUserSubmittedRecommendations:");
  }
  unint64_t v4 = v77;
LABEL_75:
  string = self->_string;
  uint64_t v30 = *((void *)v4 + 33);
  if (string)
  {
    if (!v30) {
      goto LABEL_81;
    }
    -[GEOPDPlaceSummaryLayoutUnitString mergeFrom:](string, "mergeFrom:");
  }
  else
  {
    if (!v30) {
      goto LABEL_81;
    }
    -[GEOPDPlaceSummaryLayoutUnit setString:](self, "setString:");
  }
  unint64_t v4 = v77;
LABEL_81:
  serverOverride = self->_serverOverride;
  uint64_t v32 = *((void *)v4 + 32);
  if (serverOverride)
  {
    if (!v32) {
      goto LABEL_87;
    }
    -[GEOPDPlaceSummaryLayoutUnitServerOverride mergeFrom:](serverOverride, "mergeFrom:");
  }
  else
  {
    if (!v32) {
      goto LABEL_87;
    }
    -[GEOPDPlaceSummaryLayoutUnit setServerOverride:](self, "setServerOverride:");
  }
  unint64_t v4 = v77;
LABEL_87:
  containment = self->_containment;
  uint64_t v34 = *((void *)v4 + 6);
  if (containment)
  {
    if (!v34) {
      goto LABEL_93;
    }
    -[GEOPDPlaceSummaryLayoutUnitContainment mergeFrom:](containment, "mergeFrom:");
  }
  else
  {
    if (!v34) {
      goto LABEL_93;
    }
    -[GEOPDPlaceSummaryLayoutUnit setContainment:](self, "setContainment:");
  }
  unint64_t v4 = v77;
LABEL_93:
  recent = self->_recent;
  uint64_t v36 = *((void *)v4 + 30);
  if (recent)
  {
    if (!v36) {
      goto LABEL_99;
    }
    -[GEOPDPlaceSummaryLayoutUnitRecent mergeFrom:](recent, "mergeFrom:");
  }
  else
  {
    if (!v36) {
      goto LABEL_99;
    }
    -[GEOPDPlaceSummaryLayoutUnit setRecent:](self, "setRecent:");
  }
  unint64_t v4 = v77;
LABEL_99:
  highlightMain = self->_highlightMain;
  uint64_t v38 = *((void *)v4 + 13);
  if (highlightMain)
  {
    if (!v38) {
      goto LABEL_105;
    }
    -[GEOPDPlaceSummaryLayoutUnitHighlightMain mergeFrom:](highlightMain, "mergeFrom:");
  }
  else
  {
    if (!v38) {
      goto LABEL_105;
    }
    -[GEOPDPlaceSummaryLayoutUnit setHighlightMain:](self, "setHighlightMain:");
  }
  unint64_t v4 = v77;
LABEL_105:
  highlightExtra = self->_highlightExtra;
  uint64_t v40 = *((void *)v4 + 12);
  if (highlightExtra)
  {
    if (!v40) {
      goto LABEL_111;
    }
    -[GEOPDPlaceSummaryLayoutUnitHighlightExtra mergeFrom:](highlightExtra, "mergeFrom:");
  }
  else
  {
    if (!v40) {
      goto LABEL_111;
    }
    -[GEOPDPlaceSummaryLayoutUnit setHighlightExtra:](self, "setHighlightExtra:");
  }
  unint64_t v4 = v77;
LABEL_111:
  publisherNameForGuide = self->_publisherNameForGuide;
  uint64_t v42 = *((void *)v4 + 27);
  if (publisherNameForGuide)
  {
    if (!v42) {
      goto LABEL_117;
    }
    -[GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide mergeFrom:](publisherNameForGuide, "mergeFrom:");
  }
  else
  {
    if (!v42) {
      goto LABEL_117;
    }
    -[GEOPDPlaceSummaryLayoutUnit setPublisherNameForGuide:](self, "setPublisherNameForGuide:");
  }
  unint64_t v4 = v77;
LABEL_117:
  numPlacesInGuide = self->_numPlacesInGuide;
  uint64_t v44 = *((void *)v4 + 23);
  if (numPlacesInGuide)
  {
    if (!v44) {
      goto LABEL_123;
    }
    -[GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide mergeFrom:](numPlacesInGuide, "mergeFrom:");
  }
  else
  {
    if (!v44) {
      goto LABEL_123;
    }
    -[GEOPDPlaceSummaryLayoutUnit setNumPlacesInGuide:](self, "setNumPlacesInGuide:");
  }
  unint64_t v4 = v77;
LABEL_123:
  publisherDescription = self->_publisherDescription;
  uint64_t v46 = *((void *)v4 + 26);
  if (publisherDescription)
  {
    if (!v46) {
      goto LABEL_129;
    }
    -[GEOPDPlaceSummaryLayoutUnitPublisherDescription mergeFrom:](publisherDescription, "mergeFrom:");
  }
  else
  {
    if (!v46) {
      goto LABEL_129;
    }
    -[GEOPDPlaceSummaryLayoutUnit setPublisherDescription:](self, "setPublisherDescription:");
  }
  unint64_t v4 = v77;
LABEL_129:
  secondaryName = self->_secondaryName;
  uint64_t v48 = *((void *)v4 + 31);
  if (secondaryName)
  {
    if (!v48) {
      goto LABEL_135;
    }
    -[GEOPDPlaceSummaryLayoutUnitSecondaryName mergeFrom:](secondaryName, "mergeFrom:");
  }
  else
  {
    if (!v48) {
      goto LABEL_135;
    }
    -[GEOPDPlaceSummaryLayoutUnit setSecondaryName:](self, "setSecondaryName:");
  }
  unint64_t v4 = v77;
LABEL_135:
  factoid = self->_factoid;
  uint64_t v50 = *((void *)v4 + 11);
  if (factoid)
  {
    if (!v50) {
      goto LABEL_141;
    }
    -[GEOPDPlaceSummaryLayoutUnitFactoid mergeFrom:](factoid, "mergeFrom:");
  }
  else
  {
    if (!v50) {
      goto LABEL_141;
    }
    -[GEOPDPlaceSummaryLayoutUnit setFactoid:](self, "setFactoid:");
  }
  unint64_t v4 = v77;
LABEL_141:
  arpRatings = self->_arpRatings;
  uint64_t v52 = *((void *)v4 + 4);
  if (arpRatings)
  {
    if (!v52) {
      goto LABEL_147;
    }
    -[GEOPDPlaceSummaryLayoutUnitArpRatings mergeFrom:](arpRatings, "mergeFrom:");
  }
  else
  {
    if (!v52) {
      goto LABEL_147;
    }
    -[GEOPDPlaceSummaryLayoutUnit setArpRatings:](self, "setArpRatings:");
  }
  unint64_t v4 = v77;
LABEL_147:
  realTimeEvChargerAvailability = self->_realTimeEvChargerAvailability;
  uint64_t v54 = *((void *)v4 + 29);
  if (realTimeEvChargerAvailability)
  {
    if (!v54) {
      goto LABEL_153;
    }
    -[GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability mergeFrom:](realTimeEvChargerAvailability, "mergeFrom:");
  }
  else
  {
    if (!v54) {
      goto LABEL_153;
    }
    -[GEOPDPlaceSummaryLayoutUnit setRealTimeEvChargerAvailability:](self, "setRealTimeEvChargerAvailability:");
  }
  unint64_t v4 = v77;
LABEL_153:
  detourTime = self->_detourTime;
  uint64_t v56 = *((void *)v4 + 8);
  if (detourTime)
  {
    if (!v56) {
      goto LABEL_159;
    }
    -[GEOPDPlaceSummaryLayoutUnitDetourTime mergeFrom:](detourTime, "mergeFrom:");
  }
  else
  {
    if (!v56) {
      goto LABEL_159;
    }
    -[GEOPDPlaceSummaryLayoutUnit setDetourTime:](self, "setDetourTime:");
  }
  unint64_t v4 = v77;
LABEL_159:
  hikingDifficulty = self->_hikingDifficulty;
  uint64_t v58 = *((void *)v4 + 18);
  if (hikingDifficulty)
  {
    if (!v58) {
      goto LABEL_165;
    }
    -[GEOPDPlaceSummaryLayoutUnitHikingDifficulty mergeFrom:](hikingDifficulty, "mergeFrom:");
  }
  else
  {
    if (!v58) {
      goto LABEL_165;
    }
    -[GEOPDPlaceSummaryLayoutUnit setHikingDifficulty:](self, "setHikingDifficulty:");
  }
  unint64_t v4 = v77;
LABEL_165:
  hikingTrailLength = self->_hikingTrailLength;
  uint64_t v60 = *((void *)v4 + 19);
  if (hikingTrailLength)
  {
    if (!v60) {
      goto LABEL_171;
    }
    -[GEOPDPlaceSummaryLayoutUnitHikingTrailLength mergeFrom:](hikingTrailLength, "mergeFrom:");
  }
  else
  {
    if (!v60) {
      goto LABEL_171;
    }
    -[GEOPDPlaceSummaryLayoutUnit setHikingTrailLength:](self, "setHikingTrailLength:");
  }
  unint64_t v4 = v77;
LABEL_171:
  photoCarousel = self->_photoCarousel;
  uint64_t v62 = *((void *)v4 + 24);
  if (photoCarousel)
  {
    if (!v62) {
      goto LABEL_177;
    }
    -[GEOPDPlaceSummaryLayoutUnitPhotoCarousel mergeFrom:](photoCarousel, "mergeFrom:");
  }
  else
  {
    if (!v62) {
      goto LABEL_177;
    }
    -[GEOPDPlaceSummaryLayoutUnit setPhotoCarousel:](self, "setPhotoCarousel:");
  }
  unint64_t v4 = v77;
LABEL_177:
  userNote = self->_userNote;
  uint64_t v64 = *((void *)v4 + 37);
  if (userNote)
  {
    if (!v64) {
      goto LABEL_183;
    }
    -[GEOPDPlaceSummaryLayoutUnitUserNote mergeFrom:](userNote, "mergeFrom:");
  }
  else
  {
    if (!v64) {
      goto LABEL_183;
    }
    -[GEOPDPlaceSummaryLayoutUnit setUserNote:](self, "setUserNote:");
  }
  unint64_t v4 = v77;
LABEL_183:
  inUserLibrary = self->_inUserLibrary;
  uint64_t v66 = *((void *)v4 + 21);
  if (inUserLibrary)
  {
    if (!v66) {
      goto LABEL_189;
    }
    -[GEOPDPlaceSummaryLayoutUnitInUserLibrary mergeFrom:](inUserLibrary, "mergeFrom:");
  }
  else
  {
    if (!v66) {
      goto LABEL_189;
    }
    -[GEOPDPlaceSummaryLayoutUnit setInUserLibrary:](self, "setInUserLibrary:");
  }
  unint64_t v4 = v77;
LABEL_189:
  hikeRouteElevationGainLoss = self->_hikeRouteElevationGainLoss;
  uint64_t v68 = *((void *)v4 + 15);
  if (hikeRouteElevationGainLoss)
  {
    if (!v68) {
      goto LABEL_195;
    }
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss mergeFrom:](hikeRouteElevationGainLoss, "mergeFrom:");
  }
  else
  {
    if (!v68) {
      goto LABEL_195;
    }
    [(GEOPDPlaceSummaryLayoutUnit *)self setHikeRouteElevationGainLoss:"setHikeRouteElevationGainLoss:"];
  }
  unint64_t v4 = v77;
LABEL_195:
  hikeRouteType = self->_hikeRouteType;
  uint64_t v70 = *((void *)v4 + 17);
  if (hikeRouteType)
  {
    if (!v70) {
      goto LABEL_201;
    }
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteType mergeFrom:](hikeRouteType, "mergeFrom:");
  }
  else
  {
    if (!v70) {
      goto LABEL_201;
    }
    [(GEOPDPlaceSummaryLayoutUnit *)self setHikeRouteType:"setHikeRouteType:"];
  }
  unint64_t v4 = v77;
LABEL_201:
  hikeRouteDuration = self->_hikeRouteDuration;
  uint64_t v72 = *((void *)v4 + 14);
  if (hikeRouteDuration)
  {
    if (!v72) {
      goto LABEL_207;
    }
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteDuration mergeFrom:](hikeRouteDuration, "mergeFrom:");
  }
  else
  {
    if (!v72) {
      goto LABEL_207;
    }
    [(GEOPDPlaceSummaryLayoutUnit *)self setHikeRouteDuration:"setHikeRouteDuration:"];
  }
  unint64_t v4 = v77;
LABEL_207:
  hikeRouteLength = self->_hikeRouteLength;
  uint64_t v74 = *((void *)v4 + 16);
  if (hikeRouteLength)
  {
    if (!v74) {
      goto LABEL_213;
    }
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteLength mergeFrom:](hikeRouteLength, "mergeFrom:");
  }
  else
  {
    if (!v74) {
      goto LABEL_213;
    }
    [(GEOPDPlaceSummaryLayoutUnit *)self setHikeRouteLength:"setHikeRouteLength:"];
  }
  unint64_t v4 = v77;
LABEL_213:
  if (v4[81])
  {
    self->_layoutPriority = v4[79];
    *(void *)&self->_flags |= 1uLL;
  }
  alternativeUnit = self->_alternativeUnit;
  uint64_t v76 = *((void *)v4 + 3);
  if (alternativeUnit)
  {
    if (!v76) {
      goto LABEL_221;
    }
    -[GEOPDPlaceSummaryLayoutUnit mergeFrom:](alternativeUnit, "mergeFrom:");
  }
  else
  {
    if (!v76) {
      goto LABEL_221;
    }
    -[GEOPDPlaceSummaryLayoutUnit setAlternativeUnit:](self, "setAlternativeUnit:");
  }
  unint64_t v4 = v77;
LABEL_221:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNote, 0);
  objc_storeStrong((id *)&self->_userGeneratedGuides, 0);
  objc_storeStrong((id *)&self->_ugcUserSubmittedRecommendations, 0);
  objc_storeStrong((id *)&self->_transitShields, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_serverOverride, 0);
  objc_storeStrong((id *)&self->_secondaryName, 0);
  objc_storeStrong((id *)&self->_recent, 0);
  objc_storeStrong((id *)&self->_realTimeEvChargerAvailability, 0);
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_publisherNameForGuide, 0);
  objc_storeStrong((id *)&self->_publisherDescription, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_photoCarousel, 0);
  objc_storeStrong((id *)&self->_numPlacesInGuide, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_inUserLibrary, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_hikingTrailLength, 0);
  objc_storeStrong((id *)&self->_hikingDifficulty, 0);
  objc_storeStrong((id *)&self->_hikeRouteType, 0);
  objc_storeStrong((id *)&self->_hikeRouteLength, 0);
  objc_storeStrong((id *)&self->_hikeRouteElevationGainLoss, 0);
  objc_storeStrong((id *)&self->_hikeRouteDuration, 0);
  objc_storeStrong((id *)&self->_highlightMain, 0);
  objc_storeStrong((id *)&self->_highlightExtra, 0);
  objc_storeStrong((id *)&self->_factoid, 0);
  objc_storeStrong((id *)&self->_evChargersNumber, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_detourTime, 0);
  objc_storeStrong((id *)&self->_curatedGuides, 0);
  objc_storeStrong((id *)&self->_containment, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_arpRatings, 0);
  objc_storeStrong((id *)&self->_alternativeUnit, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end