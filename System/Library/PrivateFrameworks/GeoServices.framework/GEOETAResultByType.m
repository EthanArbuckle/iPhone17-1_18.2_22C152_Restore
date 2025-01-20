@interface GEOETAResultByType
+ (BOOL)isValid:(id)a3;
+ (Class)summaryForPredictedDestinationType;
- (BOOL)hasDistance;
- (BOOL)hasExpectedTimeOfDeparture;
- (BOOL)hasHistoricTravelTime;
- (BOOL)hasLicensePlateRestrictionImpact;
- (BOOL)hasRouteTrafficDetail;
- (BOOL)hasShortTrafficSummary;
- (BOOL)hasStaticTravelTime;
- (BOOL)hasStatus;
- (BOOL)hasTransportType;
- (BOOL)hasTravelTimeAggressiveEstimate;
- (BOOL)hasTravelTimeBestEstimate;
- (BOOL)hasTravelTimeConservativeEstimate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOETAResultByType)init;
- (GEOETAResultByType)initWithData:(id)a3;
- (GEOETAResultByType)initWithDictionary:(id)a3;
- (GEOETAResultByType)initWithJSON:(id)a3;
- (GEORouteTrafficDetail)routeTrafficDetail;
- (GEOShortTrafficSummary)shortTrafficSummary;
- (NSMutableArray)summaryForPredictedDestinations;
- (PBUnknownFields)unknownFields;
- (double)expectedTimeOfDeparture;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)licensePlateRestrictionImpactAsString:(int)a3;
- (id)statusAsString:(int)a3;
- (id)summaryForPredictedDestinationAtIndex:(unint64_t)a3;
- (id)transportTypeAsString:(int)a3;
- (int)StringAsLicensePlateRestrictionImpact:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsTransportType:(id)a3;
- (int)licensePlateRestrictionImpact;
- (int)status;
- (int)transportType;
- (unint64_t)hash;
- (unint64_t)summaryForPredictedDestinationsCount;
- (unsigned)distance;
- (unsigned)historicTravelTime;
- (unsigned)staticTravelTime;
- (unsigned)travelTimeAggressiveEstimate;
- (unsigned)travelTimeBestEstimate;
- (unsigned)travelTimeConservativeEstimate;
- (void)_addNoFlagsSummaryForPredictedDestination:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readRouteTrafficDetail;
- (void)_readShortTrafficSummary;
- (void)_readSummaryForPredictedDestinations;
- (void)addSummaryForPredictedDestination:(id)a3;
- (void)clearSummaryForPredictedDestinations;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDistance:(unsigned int)a3;
- (void)setExpectedTimeOfDeparture:(double)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasExpectedTimeOfDeparture:(BOOL)a3;
- (void)setHasHistoricTravelTime:(BOOL)a3;
- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3;
- (void)setHasStaticTravelTime:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3;
- (void)setHasTravelTimeBestEstimate:(BOOL)a3;
- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3;
- (void)setHistoricTravelTime:(unsigned int)a3;
- (void)setLicensePlateRestrictionImpact:(int)a3;
- (void)setRouteTrafficDetail:(id)a3;
- (void)setShortTrafficSummary:(id)a3;
- (void)setStaticTravelTime:(unsigned int)a3;
- (void)setStatus:(int)a3;
- (void)setSummaryForPredictedDestinations:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3;
- (void)setTravelTimeBestEstimate:(unsigned int)a3;
- (void)setTravelTimeConservativeEstimate:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETAResultByType

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (unsigned)travelTimeBestEstimate
{
  return self->_travelTimeBestEstimate;
}

- (NSMutableArray)summaryForPredictedDestinations
{
  -[GEOETAResultByType _readSummaryForPredictedDestinations]((uint64_t)self);
  summaryForPredictedDestinations = self->_summaryForPredictedDestinations;

  return summaryForPredictedDestinations;
}

- (unsigned)historicTravelTime
{
  return self->_historicTravelTime;
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)_readSummaryForPredictedDestinations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 104) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultByTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSummaryForPredictedDestinations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (double)expectedTimeOfDeparture
{
  return self->_expectedTimeOfDeparture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryForPredictedDestinations, 0);
  objc_storeStrong((id *)&self->_shortTrafficSummary, 0);
  objc_storeStrong((id *)&self->_routeTrafficDetail, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOETAResultByType)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETAResultByType;
  v2 = [(GEOETAResultByType *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETAResultByType)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETAResultByType;
  id v3 = [(GEOETAResultByType *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setTransportType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x4040u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16448;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasTransportType
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53F72E8[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x4020u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16416;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    int v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        int v4 = @"STATUS_FAILED";
        break;
      case 2:
        int v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        int v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        int v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      int v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      int v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        int v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    int v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTravelTimeBestEstimate:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4080u;
  self->_travelTimeBestEstimate = a3;
}

- (void)setHasTravelTimeBestEstimate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16512;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasTravelTimeBestEstimate
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)setHistoricTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4004u;
  self->_historicTravelTime = a3;
}

- (void)setHasHistoricTravelTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16388;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasHistoricTravelTime
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setDistance:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4002u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16386;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDistance
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)setExpectedTimeOfDeparture:(double)a3
{
  *(_WORD *)&self->_flags |= 0x4001u;
  self->_expectedTimeOfDeparture = a3;
}

- (void)setHasExpectedTimeOfDeparture:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x4000;
}

- (BOOL)hasExpectedTimeOfDeparture
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (void)setTravelTimeConservativeEstimate:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4200u;
  self->_travelTimeConservativeEstimate = a3;
}

- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16896;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasTravelTimeConservativeEstimate
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (unsigned)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4100u;
  self->_travelTimeAggressiveEstimate = a3;
}

- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16640;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasTravelTimeAggressiveEstimate
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unsigned)staticTravelTime
{
  return self->_staticTravelTime;
}

- (void)setStaticTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4010u;
  self->_staticTravelTime = a3;
}

- (void)setHasStaticTravelTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16400;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasStaticTravelTime
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)setSummaryForPredictedDestinations:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  summaryForPredictedDestinations = self->_summaryForPredictedDestinations;
  self->_summaryForPredictedDestinations = v4;
}

- (void)clearSummaryForPredictedDestinations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  summaryForPredictedDestinations = self->_summaryForPredictedDestinations;

  [(NSMutableArray *)summaryForPredictedDestinations removeAllObjects];
}

- (void)addSummaryForPredictedDestination:(id)a3
{
  id v4 = a3;
  -[GEOETAResultByType _readSummaryForPredictedDestinations]((uint64_t)self);
  -[GEOETAResultByType _addNoFlagsSummaryForPredictedDestination:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsSummaryForPredictedDestination:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)summaryForPredictedDestinationsCount
{
  -[GEOETAResultByType _readSummaryForPredictedDestinations]((uint64_t)self);
  summaryForPredictedDestinations = self->_summaryForPredictedDestinations;

  return [(NSMutableArray *)summaryForPredictedDestinations count];
}

- (id)summaryForPredictedDestinationAtIndex:(unint64_t)a3
{
  -[GEOETAResultByType _readSummaryForPredictedDestinations]((uint64_t)self);
  summaryForPredictedDestinations = self->_summaryForPredictedDestinations;

  return (id)[(NSMutableArray *)summaryForPredictedDestinations objectAtIndex:a3];
}

+ (Class)summaryForPredictedDestinationType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteTrafficDetail
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 104) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultByTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteTrafficDetail_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteTrafficDetail
{
  return self->_routeTrafficDetail != 0;
}

- (GEORouteTrafficDetail)routeTrafficDetail
{
  -[GEOETAResultByType _readRouteTrafficDetail]((uint64_t)self);
  routeTrafficDetail = self->_routeTrafficDetail;

  return routeTrafficDetail;
}

- (void)setRouteTrafficDetail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4800u;
  objc_storeStrong((id *)&self->_routeTrafficDetail, a3);
}

- (void)_readShortTrafficSummary
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 104) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultByTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShortTrafficSummary_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasShortTrafficSummary
{
  return self->_shortTrafficSummary != 0;
}

- (GEOShortTrafficSummary)shortTrafficSummary
{
  -[GEOETAResultByType _readShortTrafficSummary]((uint64_t)self);
  shortTrafficSummary = self->_shortTrafficSummary;

  return shortTrafficSummary;
}

- (void)setShortTrafficSummary:(id)a3
{
  *(_WORD *)&self->_flags |= 0x5000u;
  objc_storeStrong((id *)&self->_shortTrafficSummary, a3);
}

- (int)licensePlateRestrictionImpact
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_licensePlateRestrictionImpact;
  }
  else {
    return 0;
  }
}

- (void)setLicensePlateRestrictionImpact:(int)a3
{
  *(_WORD *)&self->_flags |= 0x4008u;
  self->_licensePlateRestrictionImpact = a3;
}

- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16392;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLicensePlateRestrictionImpact
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)licensePlateRestrictionImpactAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53F7320[a3];
  }

  return v3;
}

- (int)StringAsLicensePlateRestrictionImpact:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
  {
    int v4 = 7;
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
  v8.super_class = (Class)GEOETAResultByType;
  int v4 = [(GEOETAResultByType *)&v8 description];
  id v5 = [(GEOETAResultByType *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETAResultByType _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_87;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 0x40) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 88);
    if (v6 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 88));
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = off_1E53F72E8[v6];
    }
    [v4 setObject:v7 forKey:@"transportType"];

    __int16 v5 = *(_WORD *)(a1 + 104);
  }
  if ((v5 & 0x20) != 0)
  {
    int v8 = *(_DWORD *)(a1 + 84);
    if (v8 <= 29)
    {
      v9 = @"STATUS_SUCCESS";
      switch(v8)
      {
        case 0:
          goto LABEL_25;
        case 1:
          v9 = @"STATUS_FAILED";
          break;
        case 2:
          v9 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_20;
        case 5:
          v9 = @"INVALID_REQUEST";
          break;
        default:
          if (v8 != 20) {
            goto LABEL_20;
          }
          v9 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_25;
    }
    if (v8 > 49)
    {
      if (v8 == 50)
      {
        v9 = @"STATUS_DEDUPED";
        goto LABEL_25;
      }
      if (v8 == 60)
      {
        v9 = @"VERSION_MISMATCH";
        goto LABEL_25;
      }
    }
    else
    {
      if (v8 == 30)
      {
        v9 = @"NEEDS_REFINEMENT";
        goto LABEL_25;
      }
      if (v8 == 40)
      {
        v9 = @"FAILED_NOT_AUTHORIZED";
LABEL_25:
        [v4 setObject:v9 forKey:@"status"];

        __int16 v5 = *(_WORD *)(a1 + 104);
        goto LABEL_26;
      }
    }
LABEL_20:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 84));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_26:
  if ((v5 & 0x80) != 0)
  {
    v25 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    [v4 setObject:v25 forKey:@"travelTimeBestEstimate"];

    __int16 v5 = *(_WORD *)(a1 + 104);
    if ((v5 & 4) == 0)
    {
LABEL_28:
      if ((v5 & 2) == 0) {
        goto LABEL_29;
      }
      goto LABEL_57;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_28;
  }
  v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  [v4 setObject:v26 forKey:@"historicTravelTime"];

  __int16 v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 2) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_58;
  }
LABEL_57:
  v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
  [v4 setObject:v27 forKey:@"distance"];

  __int16 v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 1) == 0)
  {
LABEL_30:
    if ((v5 & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_59;
  }
LABEL_58:
  v28 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  [v4 setObject:v28 forKey:@"expectedTimeOfDeparture"];

  __int16 v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 0x200) == 0)
  {
LABEL_31:
    if ((v5 & 0x100) == 0) {
      goto LABEL_32;
    }
LABEL_63:
    v31 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
    if (a2) {
      v32 = @"travelTimeAggressiveEstimate";
    }
    else {
      v32 = @"travel_time_aggressive_estimate";
    }
    [v4 setObject:v31 forKey:v32];

    if ((*(_WORD *)(a1 + 104) & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
LABEL_59:
  v29 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
  if (a2) {
    v30 = @"travelTimeConservativeEstimate";
  }
  else {
    v30 = @"travel_time_conservative_estimate";
  }
  [v4 setObject:v29 forKey:v30];

  __int16 v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 0x100) != 0) {
    goto LABEL_63;
  }
LABEL_32:
  if ((v5 & 0x10) != 0)
  {
LABEL_33:
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
    if (a2) {
      v11 = @"staticTravelTime";
    }
    else {
      v11 = @"static_travel_time";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_37:
  if ([*(id *)(a1 + 48) count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (a2) {
            [v18 jsonRepresentation];
          }
          else {
          v19 = [v18 dictionaryRepresentation];
          }
          [v12 addObject:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v15);
    }

    if (a2) {
      v20 = @"summaryForPredictedDestination";
    }
    else {
      v20 = @"summary_for_predicted_destination";
    }
    [v4 setObject:v12 forKey:v20];
  }
  v21 = [(id)a1 routeTrafficDetail];
  v22 = v21;
  if (v21)
  {
    if (a2)
    {
      v23 = [v21 jsonRepresentation];
      v24 = @"routeTrafficDetail";
    }
    else
    {
      v23 = [v21 dictionaryRepresentation];
      v24 = @"route_traffic_detail";
    }
    [v4 setObject:v23 forKey:v24];
  }
  v33 = [(id)a1 shortTrafficSummary];
  v34 = v33;
  if (v33)
  {
    if (a2)
    {
      v35 = [v33 jsonRepresentation];
      v36 = @"shortTrafficSummary";
    }
    else
    {
      v35 = [v33 dictionaryRepresentation];
      v36 = @"short_traffic_summary";
    }
    [v4 setObject:v35 forKey:v36];
  }
  if ((*(_WORD *)(a1 + 104) & 8) != 0)
  {
    uint64_t v37 = *(int *)(a1 + 76);
    if (v37 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E53F7320[v37];
    }
    if (a2) {
      v39 = @"licensePlateRestrictionImpact";
    }
    else {
      v39 = @"license_plate_restriction_impact";
    }
    [v4 setObject:v38 forKey:v39];
  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    v41 = [v40 dictionaryRepresentation];
    v42 = v41;
    if (a2)
    {
      v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __48__GEOETAResultByType__dictionaryRepresentation___block_invoke;
      v47[3] = &unk_1E53D8860;
      id v44 = v43;
      id v48 = v44;
      [v42 enumerateKeysAndObjectsUsingBlock:v47];
      id v45 = v44;

      v42 = v45;
    }
    [v4 setObject:v42 forKey:@"Unknown Fields"];
  }
LABEL_87:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETAResultByType _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOETAResultByType__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    int v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    int v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOETAResultByType)initWithDictionary:(id)a3
{
  return (GEOETAResultByType *)-[GEOETAResultByType _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"transportType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        if ([v7 isEqualToString:@"AUTOMOBILE"])
        {
          uint64_t v8 = 0;
        }
        else if ([v7 isEqualToString:@"TRANSIT"])
        {
          uint64_t v8 = 1;
        }
        else if ([v7 isEqualToString:@"WALKING"])
        {
          uint64_t v8 = 2;
        }
        else if ([v7 isEqualToString:@"BICYCLE"])
        {
          uint64_t v8 = 3;
        }
        else if ([v7 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
        {
          uint64_t v8 = 4;
        }
        else if ([v7 isEqualToString:@"FERRY"])
        {
          uint64_t v8 = 5;
        }
        else if ([v7 isEqualToString:@"RIDESHARE"])
        {
          uint64_t v8 = 6;
        }
        else
        {
          uint64_t v8 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_23;
        }
        uint64_t v8 = [v6 intValue];
      }
      [a1 setTransportType:v8];
LABEL_23:

      v9 = [v5 objectForKeyedSubscript:@"status"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 isEqualToString:@"STATUS_SUCCESS"])
        {
          uint64_t v11 = 0;
        }
        else if ([v10 isEqualToString:@"STATUS_FAILED"])
        {
          uint64_t v11 = 1;
        }
        else if ([v10 isEqualToString:@"STATUS_INCOMPLETE"])
        {
          uint64_t v11 = 2;
        }
        else if ([v10 isEqualToString:@"INVALID_REQUEST"])
        {
          uint64_t v11 = 5;
        }
        else if ([v10 isEqualToString:@"FAILED_NO_RESULT"])
        {
          uint64_t v11 = 20;
        }
        else if ([v10 isEqualToString:@"NEEDS_REFINEMENT"])
        {
          uint64_t v11 = 30;
        }
        else if ([v10 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
        {
          uint64_t v11 = 40;
        }
        else if ([v10 isEqualToString:@"STATUS_DEDUPED"])
        {
          uint64_t v11 = 50;
        }
        else if ([v10 isEqualToString:@"VERSION_MISMATCH"])
        {
          uint64_t v11 = 60;
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_47;
        }
        uint64_t v11 = [v9 intValue];
      }
      [a1 setStatus:v11];
LABEL_47:

      v12 = [v5 objectForKeyedSubscript:@"travelTimeBestEstimate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTravelTimeBestEstimate:", objc_msgSend(v12, "unsignedIntValue"));
      }

      id v13 = [v5 objectForKeyedSubscript:@"historicTravelTime"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHistoricTravelTime:", objc_msgSend(v13, "unsignedIntValue"));
      }

      uint64_t v14 = [v5 objectForKeyedSubscript:@"distance"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDistance:", objc_msgSend(v14, "unsignedIntValue"));
      }

      uint64_t v15 = [v5 objectForKeyedSubscript:@"expectedTimeOfDeparture"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v15 doubleValue];
        objc_msgSend(a1, "setExpectedTimeOfDeparture:");
      }

      if (a3) {
        uint64_t v16 = @"travelTimeConservativeEstimate";
      }
      else {
        uint64_t v16 = @"travel_time_conservative_estimate";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTravelTimeConservativeEstimate:", objc_msgSend(v17, "unsignedIntValue"));
      }

      if (a3) {
        v18 = @"travelTimeAggressiveEstimate";
      }
      else {
        v18 = @"travel_time_aggressive_estimate";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTravelTimeAggressiveEstimate:", objc_msgSend(v19, "unsignedIntValue"));
      }

      if (a3) {
        v20 = @"staticTravelTime";
      }
      else {
        v20 = @"static_travel_time";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStaticTravelTime:", objc_msgSend(v21, "unsignedIntValue"));
      }

      if (a3) {
        v22 = @"summaryForPredictedDestination";
      }
      else {
        v22 = @"summary_for_predicted_destination";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v65 = v5;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v67 objects:v75 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v68 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v67 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v30 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v31 = [(GEOFormattedString *)v30 initWithJSON:v29];
                }
                else {
                  uint64_t v31 = [(GEOFormattedString *)v30 initWithDictionary:v29];
                }
                v32 = (void *)v31;
                [a1 addSummaryForPredictedDestination:v31];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v67 objects:v75 count:16];
          }
          while (v26);
        }

        id v5 = v65;
      }

      if (a3) {
        v33 = @"routeTrafficDetail";
      }
      else {
        v33 = @"route_traffic_detail";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = [GEORouteTrafficDetail alloc];
        if (a3) {
          uint64_t v36 = [(GEORouteTrafficDetail *)v35 initWithJSON:v34];
        }
        else {
          uint64_t v36 = [(GEORouteTrafficDetail *)v35 initWithDictionary:v34];
        }
        uint64_t v37 = (void *)v36;
        [a1 setRouteTrafficDetail:v36];
      }
      if (a3) {
        v38 = @"shortTrafficSummary";
      }
      else {
        v38 = @"short_traffic_summary";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [GEOShortTrafficSummary alloc];
        if (v40)
        {
          id v41 = v39;
          v40 = [(GEOShortTrafficSummary *)v40 init];
          if (v40)
          {
            v42 = [v41 objectForKeyedSubscript:@"title"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v63 = v41;
              v64 = v39;
              id v66 = v5;
              long long v73 = 0u;
              long long v74 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              v62 = v42;
              id v43 = v42;
              uint64_t v44 = [v43 countByEnumeratingWithState:&v71 objects:v76 count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)v72;
                do
                {
                  for (uint64_t j = 0; j != v45; ++j)
                  {
                    if (*(void *)v72 != v46) {
                      objc_enumerationMutation(v43);
                    }
                    uint64_t v48 = *(void *)(*((void *)&v71 + 1) + 8 * j);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v49 = [GEOFormattedString alloc];
                      if (a3) {
                        long long v50 = [(GEOFormattedString *)v49 initWithJSON:v48];
                      }
                      else {
                        long long v50 = [(GEOFormattedString *)v49 initWithDictionary:v48];
                      }
                      long long v51 = v50;
                      -[GEOShortTrafficSummary addTitle:]((uint64_t)v40, v50);
                    }
                  }
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v71 objects:v76 count:16];
                }
                while (v45);
              }

              v39 = v64;
              id v5 = v66;
              id v41 = v63;
            }

            long long v52 = [v41 objectForKeyedSubscript:@"detail"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v53 = v41;
              uint64_t v54 = [GEOFormattedString alloc];
              if (a3) {
                v55 = [(GEOFormattedString *)v54 initWithJSON:v52];
              }
              else {
                v55 = [(GEOFormattedString *)v54 initWithDictionary:v52];
              }
              v56 = v55;
              -[GEOShortTrafficSummary setDetail:]((uint64_t)v40, v55);

              id v41 = v53;
            }
          }
        }
        objc_msgSend(a1, "setShortTrafficSummary:", v40, v62, v63, v64);
      }
      if (a3) {
        v57 = @"licensePlateRestrictionImpact";
      }
      else {
        v57 = @"license_plate_restriction_impact";
      }
      v58 = [v5 objectForKeyedSubscript:v57];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v59 = v58;
        if ([v59 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
        {
          uint64_t v60 = 0;
        }
        else if ([v59 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
        {
          uint64_t v60 = 1;
        }
        else if ([v59 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
        {
          uint64_t v60 = 2;
        }
        else if ([v59 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
        {
          uint64_t v60 = 3;
        }
        else if ([v59 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
        {
          uint64_t v60 = 4;
        }
        else if ([v59 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
        {
          uint64_t v60 = 5;
        }
        else if ([v59 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
        {
          uint64_t v60 = 6;
        }
        else if ([v59 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
        {
          uint64_t v60 = 7;
        }
        else
        {
          uint64_t v60 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_148:

          goto LABEL_149;
        }
        uint64_t v60 = [v58 intValue];
      }
      [a1 setLicensePlateRestrictionImpact:v60];
      goto LABEL_148;
    }
  }
LABEL_149:

  return a1;
}

- (GEOETAResultByType)initWithJSON:(id)a3
{
  return (GEOETAResultByType *)-[GEOETAResultByType _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_835;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_836;
    }
    GEOETAResultByTypeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOETAResultByTypeCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETAResultByTypeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETAResultByTypeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETAResultByTypeIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
    goto LABEL_37;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETAResultByType *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_5:
      if ((flags & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_29;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_9:
    if ((flags & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0) {
      goto LABEL_11;
    }
LABEL_34:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0) {
    goto LABEL_34;
  }
LABEL_11:
  if ((flags & 0x10) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_summaryForPredictedDestinations;
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

  if (self->_routeTrafficDetail) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_shortTrafficSummary) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_37:
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOETAResultByType *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 14) = self->_readerMarkPos;
  *((_DWORD *)v10 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    *((_DWORD *)v10 + 22) = self->_transportType;
    *((_WORD *)v10 + 52) |= 0x40u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v10 + 21) = self->_status;
  *((_WORD *)v10 + 52) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v10 + 23) = self->_travelTimeBestEstimate;
  *((_WORD *)v10 + 52) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v10 + 18) = self->_historicTravelTime;
  *((_WORD *)v10 + 52) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v10 + 17) = self->_distance;
  *((_WORD *)v10 + 52) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  v10[3] = *(id *)&self->_expectedTimeOfDeparture;
  *((_WORD *)v10 + 52) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0) {
      goto LABEL_9;
    }
LABEL_31:
    *((_DWORD *)v10 + 24) = self->_travelTimeAggressiveEstimate;
    *((_WORD *)v10 + 52) |= 0x100u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_30:
  *((_DWORD *)v10 + 25) = self->_travelTimeConservativeEstimate;
  *((_WORD *)v10 + 52) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0) {
    goto LABEL_31;
  }
LABEL_9:
  if ((flags & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v10 + 20) = self->_staticTravelTime;
    *((_WORD *)v10 + 52) |= 0x10u;
  }
LABEL_11:
  if ([(GEOETAResultByType *)self summaryForPredictedDestinationsCount])
  {
    [v10 clearSummaryForPredictedDestinations];
    unint64_t v5 = [(GEOETAResultByType *)self summaryForPredictedDestinationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOETAResultByType *)self summaryForPredictedDestinationAtIndex:i];
        [v10 addSummaryForPredictedDestination:v8];
      }
    }
  }
  if (self->_routeTrafficDetail) {
    objc_msgSend(v10, "setRouteTrafficDetail:");
  }
  uint64_t v9 = v10;
  if (self->_shortTrafficSummary)
  {
    objc_msgSend(v10, "setShortTrafficSummary:");
    uint64_t v9 = v10;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v9 + 19) = self->_licensePlateRestrictionImpact;
    *((_WORD *)v9 + 52) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x4000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOETAResultByTypeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_25;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETAResultByType *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_transportType;
    *(_WORD *)(v5 + 104) |= 0x40u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_7:
      if ((flags & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_28;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 84) = self->_status;
  *(_WORD *)(v5 + 104) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 92) = self->_travelTimeBestEstimate;
  *(_WORD *)(v5 + 104) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_9:
    if ((flags & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 72) = self->_historicTravelTime;
  *(_WORD *)(v5 + 104) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_10:
    if ((flags & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 68) = self->_distance;
  *(_WORD *)(v5 + 104) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_11:
    if ((flags & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v5 + 24) = self->_expectedTimeOfDeparture;
  *(_WORD *)(v5 + 104) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_12:
    if ((flags & 0x100) == 0) {
      goto LABEL_13;
    }
LABEL_33:
    *(_DWORD *)(v5 + 96) = self->_travelTimeAggressiveEstimate;
    *(_WORD *)(v5 + 104) |= 0x100u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_32:
  *(_DWORD *)(v5 + 100) = self->_travelTimeConservativeEstimate;
  *(_WORD *)(v5 + 104) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0) {
    goto LABEL_33;
  }
LABEL_13:
  if ((flags & 0x10) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 80) = self->_staticTravelTime;
    *(_WORD *)(v5 + 104) |= 0x10u;
  }
LABEL_15:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = self->_summaryForPredictedDestinations;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [(id)v5 addSummaryForPredictedDestination:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v15 = [(GEORouteTrafficDetail *)self->_routeTrafficDetail copyWithZone:a3];
  long long v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  id v17 = [(GEOShortTrafficSummary *)self->_shortTrafficSummary copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_licensePlateRestrictionImpact;
    *(_WORD *)(v5 + 104) |= 8u;
  }
  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_25:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  [(GEOETAResultByType *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_transportType != *((_DWORD *)v4 + 22)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
LABEL_58:
    BOOL v11 = 0;
    goto LABEL_59;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 21)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_travelTimeBestEstimate != *((_DWORD *)v4 + 23)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 18)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_distance != *((_DWORD *)v4 + 17)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_58;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_expectedTimeOfDeparture != *((double *)v4 + 3)) {
      goto LABEL_58;
    }
  }
  else if (v6)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x200) == 0 || self->_travelTimeConservativeEstimate != *((_DWORD *)v4 + 25)) {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x200) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x100) == 0 || self->_travelTimeAggressiveEstimate != *((_DWORD *)v4 + 24)) {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x100) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_staticTravelTime != *((_DWORD *)v4 + 20)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  summaryForPredictedDestinations = self->_summaryForPredictedDestinations;
  if ((unint64_t)summaryForPredictedDestinations | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](summaryForPredictedDestinations, "isEqual:"))
  {
    goto LABEL_58;
  }
  routeTrafficDetail = self->_routeTrafficDetail;
  if ((unint64_t)routeTrafficDetail | *((void *)v4 + 4))
  {
    if (!-[GEORouteTrafficDetail isEqual:](routeTrafficDetail, "isEqual:")) {
      goto LABEL_58;
    }
  }
  shortTrafficSummary = self->_shortTrafficSummary;
  if ((unint64_t)shortTrafficSummary | *((void *)v4 + 5))
  {
    if (!-[GEOShortTrafficSummary isEqual:](shortTrafficSummary, "isEqual:")) {
      goto LABEL_58;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_licensePlateRestrictionImpact != *((_DWORD *)v4 + 19)) {
      goto LABEL_58;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 8) == 0;
  }
LABEL_59:

  return v11;
}

- (unint64_t)hash
{
  [(GEOETAResultByType *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    uint64_t v21 = 2654435761 * self->_transportType;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_status;
      if ((flags & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_4:
    uint64_t v19 = 2654435761 * self->_travelTimeBestEstimate;
    if ((flags & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v19 = 0;
  if ((flags & 4) != 0)
  {
LABEL_5:
    uint64_t v18 = 2654435761 * self->_historicTravelTime;
    if ((flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v17 = 0;
    if (flags) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v8 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v18 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v17 = 2654435761 * self->_distance;
  if ((flags & 1) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  double expectedTimeOfDeparture = self->_expectedTimeOfDeparture;
  double v5 = -expectedTimeOfDeparture;
  if (expectedTimeOfDeparture >= 0.0) {
    double v5 = self->_expectedTimeOfDeparture;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_19:
  if ((flags & 0x200) == 0)
  {
    uint64_t v9 = 0;
    if ((flags & 0x100) != 0) {
      goto LABEL_21;
    }
LABEL_24:
    uint64_t v10 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  uint64_t v9 = 2654435761 * self->_travelTimeConservativeEstimate;
  if ((flags & 0x100) == 0) {
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v10 = 2654435761 * self->_travelTimeAggressiveEstimate;
  if ((flags & 0x10) != 0)
  {
LABEL_22:
    uint64_t v11 = 2654435761 * self->_staticTravelTime;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v11 = 0;
LABEL_26:
  uint64_t v12 = [(NSMutableArray *)self->_summaryForPredictedDestinations hash];
  unint64_t v13 = [(GEORouteTrafficDetail *)self->_routeTrafficDetail hash];
  unint64_t v14 = [(GEOShortTrafficSummary *)self->_shortTrafficSummary hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v15 = 2654435761 * self->_licensePlateRestrictionImpact;
  }
  else {
    uint64_t v15 = 0;
  }
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x40) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 52);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_status = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_travelTimeBestEstimate = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_flags |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_historicTravelTime = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_distance = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double expectedTimeOfDeparture = *((double *)v4 + 3);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_travelTimeConservativeEstimate = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_flags |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_28:
  self->_travelTimeAggressiveEstimate = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_flags |= 0x100u;
  if ((*((_WORD *)v4 + 52) & 0x10) != 0)
  {
LABEL_10:
    self->_staticTravelTime = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_11:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOETAResultByType addSummaryForPredictedDestination:](self, "addSummaryForPredictedDestination:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v8);
  }

  routeTrafficDetail = self->_routeTrafficDetail;
  uint64_t v12 = *((void *)v4 + 4);
  if (routeTrafficDetail)
  {
    if (v12) {
      -[GEORouteTrafficDetail mergeFrom:](routeTrafficDetail, "mergeFrom:");
    }
  }
  else if (v12)
  {
    [(GEOETAResultByType *)self setRouteTrafficDetail:"setRouteTrafficDetail:"];
  }
  shortTrafficSummary = self->_shortTrafficSummary;
  unint64_t v14 = (void *)*((void *)v4 + 5);
  if (shortTrafficSummary)
  {
    if (v14)
    {
      uint64_t v15 = v14;
      -[GEOShortTrafficSummary readAll:]((uint64_t)v15, 0);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = v15[4];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            -[GEOShortTrafficSummary addTitle:]((uint64_t)shortTrafficSummary, *(void **)(*((void *)&v27 + 1) + 8 * j));
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v18);
      }

      detail = shortTrafficSummary->_detail;
      long long v22 = v15[3];
      if (detail)
      {
        if (v22) {
          -[GEOFormattedString mergeFrom:](detail, "mergeFrom:");
        }
      }
      else if (v22)
      {
        -[GEOShortTrafficSummary setDetail:]((uint64_t)shortTrafficSummary, v15[3]);
      }
    }
  }
  else if (v14)
  {
    -[GEOETAResultByType setShortTrafficSummary:](self, "setShortTrafficSummary:");
  }
  if ((*((_WORD *)v4 + 52) & 8) != 0)
  {
    self->_licensePlateRestrictionImpact = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 8u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x400) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOETAResultByTypeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_840);
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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4400u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETAResultByType *)self readAll:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = self->_summaryForPredictedDestinations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v19);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v9);
    }

    [(GEORouteTrafficDetail *)self->_routeTrafficDetail clearUnknownFields:1];
    shortTrafficSummary = self->_shortTrafficSummary;
    if (shortTrafficSummary)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)&shortTrafficSummary->_flags |= 1u;
      *(unsigned char *)&shortTrafficSummary->_flags |= 8u;
      os_unfair_lock_unlock(&shortTrafficSummary->_readerLock);
      unint64_t v13 = shortTrafficSummary->_unknownFields;
      shortTrafficSummary->_unknownFields = 0;

      -[GEOShortTrafficSummary readAll:]((uint64_t)shortTrafficSummary, 0);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      unint64_t v14 = shortTrafficSummary->_titles;
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18++), "clearUnknownFields:", 1, (void)v19);
          }
          while (v16 != v18);
          uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v16);
      }

      [(GEOFormattedString *)shortTrafficSummary->_detail clearUnknownFields:1];
    }
  }
}

@end