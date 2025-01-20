@interface GEOLogMsgEventRideBookingSession
+ (BOOL)isValid:(id)a3;
+ (Class)errorMessageType;
+ (Class)intentResponseFailureType;
- (BOOL)comparedRideOptions;
- (BOOL)exploredOtherOptions;
- (BOOL)hasComparedRideOptions;
- (BOOL)hasDestinationBlurred;
- (BOOL)hasDistanceToPickupInMeters;
- (BOOL)hasDurationOfSessionInSeconds;
- (BOOL)hasEndState;
- (BOOL)hasEndView;
- (BOOL)hasExploredOtherOptions;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasInstalledApp;
- (BOOL)hasMovedPickupLocation;
- (BOOL)hasNumberOfAvailableExtensions;
- (BOOL)hasOriginBlurred;
- (BOOL)hasPaymentIsApplePay;
- (BOOL)hasRideAppId;
- (BOOL)hasRideAppVersion;
- (BOOL)hasRideBookingSessionId;
- (BOOL)hasRideType;
- (BOOL)hasShowedSurgePricingAlert;
- (BOOL)hasStatusIssue;
- (BOOL)hasSwitchedApp;
- (BOOL)hasTimestamp;
- (BOOL)hasUnavailable;
- (BOOL)installedApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)movedPickupLocation;
- (BOOL)paymentIsApplePay;
- (BOOL)readFrom:(id)a3;
- (BOOL)showedSurgePricingAlert;
- (BOOL)switchedApp;
- (BOOL)unavailable;
- (GEOLatLng)destinationBlurred;
- (GEOLatLng)originBlurred;
- (GEOLogMsgEventRideBookingSession)init;
- (GEOLogMsgEventRideBookingSession)initWithData:(id)a3;
- (GEOLogMsgEventRideBookingSession)initWithDictionary:(id)a3;
- (GEOLogMsgEventRideBookingSession)initWithJSON:(id)a3;
- (NSMutableArray)errorMessages;
- (NSMutableArray)intentResponseFailures;
- (NSString)rideAppId;
- (NSString)rideAppVersion;
- (NSString)rideBookingSessionId;
- (NSString)rideType;
- (double)distanceToPickupInMeters;
- (double)durationOfSessionInSeconds;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endStateAsString:(int)a3;
- (id)endViewAsString:(int)a3;
- (id)errorMessageAtIndex:(unint64_t)a3;
- (id)intentResponseFailureAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)statusIssueAsString:(int)a3;
- (int)StringAsEndState:(id)a3;
- (int)StringAsEndView:(id)a3;
- (int)StringAsStatusIssue:(id)a3;
- (int)endState;
- (int)endView;
- (int)statusIssue;
- (int64_t)timestamp;
- (unint64_t)errorMessagesCount;
- (unint64_t)hash;
- (unint64_t)intentResponseFailuresCount;
- (unsigned)numberOfAvailableExtensions;
- (void)_addNoFlagsErrorMessage:(uint64_t)a1;
- (void)_addNoFlagsIntentResponseFailure:(uint64_t)a1;
- (void)_readDestinationBlurred;
- (void)_readErrorMessages;
- (void)_readIntentResponseFailures;
- (void)_readOriginBlurred;
- (void)_readRideAppId;
- (void)_readRideAppVersion;
- (void)_readRideBookingSessionId;
- (void)_readRideType;
- (void)addErrorMessage:(id)a3;
- (void)addIntentResponseFailure:(id)a3;
- (void)clearErrorMessages;
- (void)clearIntentResponseFailures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setComparedRideOptions:(BOOL)a3;
- (void)setDestinationBlurred:(id)a3;
- (void)setDistanceToPickupInMeters:(double)a3;
- (void)setDurationOfSessionInSeconds:(double)a3;
- (void)setEndState:(int)a3;
- (void)setEndView:(int)a3;
- (void)setErrorMessages:(id)a3;
- (void)setExploredOtherOptions:(BOOL)a3;
- (void)setHasComparedRideOptions:(BOOL)a3;
- (void)setHasDistanceToPickupInMeters:(BOOL)a3;
- (void)setHasDurationOfSessionInSeconds:(BOOL)a3;
- (void)setHasEndState:(BOOL)a3;
- (void)setHasEndView:(BOOL)a3;
- (void)setHasExploredOtherOptions:(BOOL)a3;
- (void)setHasInstalledApp:(BOOL)a3;
- (void)setHasMovedPickupLocation:(BOOL)a3;
- (void)setHasNumberOfAvailableExtensions:(BOOL)a3;
- (void)setHasPaymentIsApplePay:(BOOL)a3;
- (void)setHasShowedSurgePricingAlert:(BOOL)a3;
- (void)setHasStatusIssue:(BOOL)a3;
- (void)setHasSwitchedApp:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUnavailable:(BOOL)a3;
- (void)setInstalledApp:(BOOL)a3;
- (void)setIntentResponseFailures:(id)a3;
- (void)setMovedPickupLocation:(BOOL)a3;
- (void)setNumberOfAvailableExtensions:(unsigned int)a3;
- (void)setOriginBlurred:(id)a3;
- (void)setPaymentIsApplePay:(BOOL)a3;
- (void)setRideAppId:(id)a3;
- (void)setRideAppVersion:(id)a3;
- (void)setRideBookingSessionId:(id)a3;
- (void)setRideType:(id)a3;
- (void)setShowedSurgePricingAlert:(BOOL)a3;
- (void)setStatusIssue:(int)a3;
- (void)setSwitchedApp:(BOOL)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)setUnavailable:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventRideBookingSession

- (GEOLogMsgEventRideBookingSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventRideBookingSession;
  v2 = [(GEOLogMsgEventRideBookingSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventRideBookingSession)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventRideBookingSession;
  v3 = [(GEOLogMsgEventRideBookingSession *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRideBookingSessionId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideBookingSessionId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRideBookingSessionId
{
  return self->_rideBookingSessionId != 0;
}

- (NSString)rideBookingSessionId
{
  -[GEOLogMsgEventRideBookingSession _readRideBookingSessionId]((uint64_t)self);
  rideBookingSessionId = self->_rideBookingSessionId;

  return rideBookingSessionId;
}

- (void)setRideBookingSessionId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA00000u;
  objc_storeStrong((id *)&self->_rideBookingSessionId, a3);
}

- (int)endState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_endState;
  }
  else {
    return 0;
  }
}

- (void)setEndState:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800008u;
  self->_endState = a3;
}

- (void)setHasEndState:(BOOL)a3
{
  if (a3) {
    int v3 = 8388616;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasEndState
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)endStateAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F6DD0[a3];
  }

  return v3;
}

- (int)StringAsEndState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RBES_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RBES_BOOKED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RBES_ABANDONED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RBES_SUSPENDED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RBES_PUNCHED_OUT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RBES_ERROR"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)endView
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_endView;
  }
  else {
    return 0;
  }
}

- (void)setEndView:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800010u;
  self->_endView = a3;
}

- (void)setHasEndView:(BOOL)a3
{
  if (a3) {
    int v3 = 8388624;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasEndView
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)endViewAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F6E00[a3];
  }

  return v3;
}

- (int)StringAsEndView:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RBV_NOT_SET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RBV_RIDE_OPTIONS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RBV_DETAILS_PICKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RBV_CONFIRMATION_REQUESTING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RBV_CONFIRMATION_CONFIRMED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readRideAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideAppId_tags_230);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRideAppId
{
  return self->_rideAppId != 0;
}

- (NSString)rideAppId
{
  -[GEOLogMsgEventRideBookingSession _readRideAppId]((uint64_t)self);
  rideAppId = self->_rideAppId;

  return rideAppId;
}

- (void)setRideAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x880000u;
  objc_storeStrong((id *)&self->_rideAppId, a3);
}

- (void)_readOriginBlurred
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginBlurred_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasOriginBlurred
{
  return self->_originBlurred != 0;
}

- (GEOLatLng)originBlurred
{
  -[GEOLogMsgEventRideBookingSession _readOriginBlurred]((uint64_t)self);
  originBlurred = self->_originBlurred;

  return originBlurred;
}

- (void)setOriginBlurred:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x840000u;
  objc_storeStrong((id *)&self->_originBlurred, a3);
}

- (void)_readDestinationBlurred
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 141) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationBlurred_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasDestinationBlurred
{
  return self->_destinationBlurred != 0;
}

- (GEOLatLng)destinationBlurred
{
  -[GEOLogMsgEventRideBookingSession _readDestinationBlurred]((uint64_t)self);
  destinationBlurred = self->_destinationBlurred;

  return destinationBlurred;
}

- (void)setDestinationBlurred:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x808000u;
  objc_storeStrong((id *)&self->_destinationBlurred, a3);
}

- (BOOL)exploredOtherOptions
{
  return self->_exploredOtherOptions;
}

- (void)setExploredOtherOptions:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800100u;
  self->_exploredOtherOptions = a3;
}

- (void)setHasExploredOtherOptions:(BOOL)a3
{
  if (a3) {
    int v3 = 8388864;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasExploredOtherOptions
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (void)_readRideType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRideType
{
  return self->_rideType != 0;
}

- (NSString)rideType
{
  -[GEOLogMsgEventRideBookingSession _readRideType]((uint64_t)self);
  rideType = self->_rideType;

  return rideType;
}

- (void)setRideType:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC00000u;
  objc_storeStrong((id *)&self->_rideType, a3);
}

- (double)distanceToPickupInMeters
{
  return self->_distanceToPickupInMeters;
}

- (void)setDistanceToPickupInMeters:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x800001u;
  self->_distanceToPickupInMeters = a3;
}

- (void)setHasDistanceToPickupInMeters:(BOOL)a3
{
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x800000);
}

- (BOOL)hasDistanceToPickupInMeters
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)paymentIsApplePay
{
  return self->_paymentIsApplePay;
}

- (void)setPaymentIsApplePay:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800800u;
  self->_paymentIsApplePay = a3;
}

- (void)setHasPaymentIsApplePay:(BOOL)a3
{
  if (a3) {
    int v3 = 8390656;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasPaymentIsApplePay
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (unsigned)numberOfAvailableExtensions
{
  return self->_numberOfAvailableExtensions;
}

- (void)setNumberOfAvailableExtensions:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800020u;
  self->_numberOfAvailableExtensions = a3;
}

- (void)setHasNumberOfAvailableExtensions:(BOOL)a3
{
  if (a3) {
    int v3 = 8388640;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasNumberOfAvailableExtensions
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)switchedApp
{
  return self->_switchedApp;
}

- (void)setSwitchedApp:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x802000u;
  self->_switchedApp = a3;
}

- (void)setHasSwitchedApp:(BOOL)a3
{
  if (a3) {
    int v3 = 8396800;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasSwitchedApp
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)showedSurgePricingAlert
{
  return self->_showedSurgePricingAlert;
}

- (void)setShowedSurgePricingAlert:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x801000u;
  self->_showedSurgePricingAlert = a3;
}

- (void)setHasShowedSurgePricingAlert:(BOOL)a3
{
  if (a3) {
    int v3 = 8392704;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasShowedSurgePricingAlert
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (double)durationOfSessionInSeconds
{
  return self->_durationOfSessionInSeconds;
}

- (void)setDurationOfSessionInSeconds:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x800002u;
  self->_durationOfSessionInSeconds = a3;
}

- (void)setHasDurationOfSessionInSeconds:(BOOL)a3
{
  if (a3) {
    int v3 = 8388610;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDurationOfSessionInSeconds
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)installedApp
{
  return self->_installedApp;
}

- (void)setInstalledApp:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800200u;
  self->_installedApp = a3;
}

- (void)setHasInstalledApp:(BOOL)a3
{
  if (a3) {
    int v3 = 8389120;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasInstalledApp
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x800004u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 8388612;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)unavailable
{
  return self->_unavailable;
}

- (void)setUnavailable:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x804000u;
  self->_unavailable = a3;
}

- (void)setHasUnavailable:(BOOL)a3
{
  if (a3) {
    int v3 = 8404992;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasUnavailable
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)movedPickupLocation
{
  return self->_movedPickupLocation;
}

- (void)setMovedPickupLocation:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800400u;
  self->_movedPickupLocation = a3;
}

- (void)setHasMovedPickupLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 8389632;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasMovedPickupLocation
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readErrorMessages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readErrorMessages_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)errorMessages
{
  -[GEOLogMsgEventRideBookingSession _readErrorMessages]((uint64_t)self);
  errorMessages = self->_errorMessages;

  return errorMessages;
}

- (void)setErrorMessages:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
  errorMessages = self->_errorMessages;
  self->_errorMessages = v4;
}

- (void)clearErrorMessages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
  errorMessages = self->_errorMessages;

  [(NSMutableArray *)errorMessages removeAllObjects];
}

- (void)addErrorMessage:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventRideBookingSession _readErrorMessages]((uint64_t)self);
  -[GEOLogMsgEventRideBookingSession _addNoFlagsErrorMessage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
}

- (void)_addNoFlagsErrorMessage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)errorMessagesCount
{
  -[GEOLogMsgEventRideBookingSession _readErrorMessages]((uint64_t)self);
  errorMessages = self->_errorMessages;

  return [(NSMutableArray *)errorMessages count];
}

- (id)errorMessageAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventRideBookingSession _readErrorMessages]((uint64_t)self);
  errorMessages = self->_errorMessages;

  return (id)[(NSMutableArray *)errorMessages objectAtIndex:a3];
}

+ (Class)errorMessageType
{
  return (Class)objc_opt_class();
}

- (void)_readRideAppVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideAppVersion_tags_231);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRideAppVersion
{
  return self->_rideAppVersion != 0;
}

- (NSString)rideAppVersion
{
  -[GEOLogMsgEventRideBookingSession _readRideAppVersion]((uint64_t)self);
  rideAppVersion = self->_rideAppVersion;

  return rideAppVersion;
}

- (void)setRideAppVersion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x900000u;
  objc_storeStrong((id *)&self->_rideAppVersion, a3);
}

- (BOOL)comparedRideOptions
{
  return self->_comparedRideOptions;
}

- (void)setComparedRideOptions:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800080u;
  self->_comparedRideOptions = a3;
}

- (void)setHasComparedRideOptions:(BOOL)a3
{
  if (a3) {
    int v3 = 8388736;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFF7FFF7F | v3);
}

- (BOOL)hasComparedRideOptions
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)statusIssue
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_statusIssue;
  }
  else {
    return 0;
  }
}

- (void)setStatusIssue:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800040u;
  self->_statusIssue = a3;
}

- (void)setHasStatusIssue:(BOOL)a3
{
  if (a3) {
    int v3 = 8388672;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$150E7F75803E167E6CE7D122FD23A4FB flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasStatusIssue
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)statusIssueAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F6E28[a3];
  }

  return v3;
}

- (int)StringAsStatusIssue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RBSI_NOT_SET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RBSI_MISSING_RIDE_OPTION_NAME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RBSI_MISSING_RIDE_IDENTIFIER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RBSI_MISSING_RIDE_ETA"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readIntentResponseFailures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIntentResponseFailures_tags_232);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)intentResponseFailures
{
  -[GEOLogMsgEventRideBookingSession _readIntentResponseFailures]((uint64_t)self);
  intentResponseFailures = self->_intentResponseFailures;

  return intentResponseFailures;
}

- (void)setIntentResponseFailures:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
  intentResponseFailures = self->_intentResponseFailures;
  self->_intentResponseFailures = v4;
}

- (void)clearIntentResponseFailures
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
  intentResponseFailures = self->_intentResponseFailures;

  [(NSMutableArray *)intentResponseFailures removeAllObjects];
}

- (void)addIntentResponseFailure:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventRideBookingSession _readIntentResponseFailures]((uint64_t)self);
  -[GEOLogMsgEventRideBookingSession _addNoFlagsIntentResponseFailure:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
}

- (void)_addNoFlagsIntentResponseFailure:(uint64_t)a1
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

- (unint64_t)intentResponseFailuresCount
{
  -[GEOLogMsgEventRideBookingSession _readIntentResponseFailures]((uint64_t)self);
  intentResponseFailures = self->_intentResponseFailures;

  return [(NSMutableArray *)intentResponseFailures count];
}

- (id)intentResponseFailureAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventRideBookingSession _readIntentResponseFailures]((uint64_t)self);
  intentResponseFailures = self->_intentResponseFailures;

  return (id)[(NSMutableArray *)intentResponseFailures objectAtIndex:a3];
}

+ (Class)intentResponseFailureType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventRideBookingSession;
  id v4 = [(GEOLogMsgEventRideBookingSession *)&v8 description];
  id v5 = [(GEOLogMsgEventRideBookingSession *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventRideBookingSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_131;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 rideBookingSessionId];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"rideBookingSessionId";
    }
    else {
      objc_super v6 = @"ride_booking_session_id";
    }
    [v4 setObject:v5 forKey:v6];
  }

  int v7 = *(_DWORD *)(a1 + 140);
  if ((v7 & 8) != 0)
  {
    uint64_t v8 = *(int *)(a1 + 116);
    if (v8 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 116));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E53F6DD0[v8];
    }
    if (a2) {
      v10 = @"endState";
    }
    else {
      v10 = @"end_state";
    }
    [v4 setObject:v9 forKey:v10];

    int v7 = *(_DWORD *)(a1 + 140);
  }
  if ((v7 & 0x10) != 0)
  {
    uint64_t v11 = *(int *)(a1 + 120);
    if (v11 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 120));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53F6E00[v11];
    }
    if (a2) {
      v13 = @"endView";
    }
    else {
      v13 = @"end_view";
    }
    [v4 setObject:v12 forKey:v13];
  }
  v14 = [(id)a1 rideAppId];
  if (v14)
  {
    if (a2) {
      v15 = @"rideAppId";
    }
    else {
      v15 = @"ride_app_id";
    }
    [v4 setObject:v14 forKey:v15];
  }

  v16 = [(id)a1 originBlurred];
  v17 = v16;
  if (v16)
  {
    if (a2)
    {
      v18 = [v16 jsonRepresentation];
      v19 = @"originBlurred";
    }
    else
    {
      v18 = [v16 dictionaryRepresentation];
      v19 = @"origin_blurred";
    }
    [v4 setObject:v18 forKey:v19];
  }
  v20 = [(id)a1 destinationBlurred];
  v21 = v20;
  if (v20)
  {
    if (a2)
    {
      v22 = [v20 jsonRepresentation];
      v23 = @"destinationBlurred";
    }
    else
    {
      v22 = [v20 dictionaryRepresentation];
      v23 = @"destination_blurred";
    }
    [v4 setObject:v22 forKey:v23];
  }
  if (*(unsigned char *)(a1 + 141))
  {
    v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 133)];
    if (a2) {
      v25 = @"exploredOtherOptions";
    }
    else {
      v25 = @"explored_other_options";
    }
    [v4 setObject:v24 forKey:v25];
  }
  v26 = [(id)a1 rideType];
  if (v26)
  {
    if (a2) {
      v27 = @"rideType";
    }
    else {
      v27 = @"ride_type";
    }
    [v4 setObject:v26 forKey:v27];
  }

  int v28 = *(_DWORD *)(a1 + 140);
  if (v28)
  {
    v40 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v41 = @"distanceToPickupInMeters";
    }
    else {
      v41 = @"distance_to_pickup_in_meters";
    }
    [v4 setObject:v40 forKey:v41];

    int v28 = *(_DWORD *)(a1 + 140);
    if ((v28 & 0x800) == 0)
    {
LABEL_50:
      if ((v28 & 0x20) == 0) {
        goto LABEL_51;
      }
      goto LABEL_88;
    }
  }
  else if ((v28 & 0x800) == 0)
  {
    goto LABEL_50;
  }
  v42 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 136)];
  if (a2) {
    v43 = @"paymentIsApplePay";
  }
  else {
    v43 = @"payment_is_apple_pay";
  }
  [v4 setObject:v42 forKey:v43];

  int v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x20) == 0)
  {
LABEL_51:
    if ((v28 & 0x2000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_92;
  }
LABEL_88:
  v44 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
  if (a2) {
    v45 = @"numberOfAvailableExtensions";
  }
  else {
    v45 = @"number_of_available_extensions";
  }
  [v4 setObject:v44 forKey:v45];

  int v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x2000) == 0)
  {
LABEL_52:
    if ((v28 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_96;
  }
LABEL_92:
  v46 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 138)];
  if (a2) {
    v47 = @"switchedApp";
  }
  else {
    v47 = @"switched_app";
  }
  [v4 setObject:v46 forKey:v47];

  int v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x1000) == 0)
  {
LABEL_53:
    if ((v28 & 2) == 0) {
      goto LABEL_54;
    }
    goto LABEL_100;
  }
LABEL_96:
  v48 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 137)];
  if (a2) {
    v49 = @"showedSurgePricingAlert";
  }
  else {
    v49 = @"showed_surge_pricing_alert";
  }
  [v4 setObject:v48 forKey:v49];

  int v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 2) == 0)
  {
LABEL_54:
    if ((v28 & 0x200) == 0) {
      goto LABEL_55;
    }
    goto LABEL_104;
  }
LABEL_100:
  v50 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v51 = @"durationOfSessionInSeconds";
  }
  else {
    v51 = @"duration_of_session_in_seconds";
  }
  [v4 setObject:v50 forKey:v51];

  int v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x200) == 0)
  {
LABEL_55:
    if ((v28 & 4) == 0) {
      goto LABEL_56;
    }
    goto LABEL_108;
  }
LABEL_104:
  v52 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 134)];
  if (a2) {
    v53 = @"installedApp";
  }
  else {
    v53 = @"installed_app";
  }
  [v4 setObject:v52 forKey:v53];

  int v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 4) == 0)
  {
LABEL_56:
    if ((v28 & 0x4000) == 0) {
      goto LABEL_57;
    }
LABEL_109:
    v55 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 139)];
    [v4 setObject:v55 forKey:@"unavailable"];

    if ((*(_DWORD *)(a1 + 140) & 0x400) != 0) {
      goto LABEL_58;
    }
    goto LABEL_62;
  }
LABEL_108:
  v54 = [NSNumber numberWithLongLong:*(void *)(a1 + 96)];
  [v4 setObject:v54 forKey:@"timestamp"];

  int v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x4000) != 0) {
    goto LABEL_109;
  }
LABEL_57:
  if ((v28 & 0x400) != 0)
  {
LABEL_58:
    v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 135)];
    if (a2) {
      v30 = @"movedPickupLocation";
    }
    else {
      v30 = @"moved_pickup_location";
    }
    [v4 setObject:v29 forKey:v30];
  }
LABEL_62:
  if (*(void *)(a1 + 40))
  {
    v31 = [(id)a1 errorMessages];
    if (a2) {
      v32 = @"errorMessage";
    }
    else {
      v32 = @"error_message";
    }
    [v4 setObject:v31 forKey:v32];
  }
  v33 = [(id)a1 rideAppVersion];
  if (v33)
  {
    if (a2) {
      v34 = @"rideAppVersion";
    }
    else {
      v34 = @"ride_app_version";
    }
    [v4 setObject:v33 forKey:v34];
  }

  int v35 = *(_DWORD *)(a1 + 140);
  if ((v35 & 0x80) != 0)
  {
    v36 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 132)];
    if (a2) {
      v37 = @"comparedRideOptions";
    }
    else {
      v37 = @"compared_ride_options";
    }
    [v4 setObject:v36 forKey:v37];

    int v35 = *(_DWORD *)(a1 + 140);
  }
  if ((v35 & 0x40) != 0)
  {
    uint64_t v38 = *(int *)(a1 + 128);
    if (v38 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 128));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_1E53F6E28[v38];
    }
    if (a2) {
      v56 = @"statusIssue";
    }
    else {
      v56 = @"status_issue";
    }
    [v4 setObject:v39 forKey:v56];
  }
  if ([*(id *)(a1 + 48) count])
  {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v58 = *(id *)(a1 + 48);
    uint64_t v59 = [v58 countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v68 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          if (a2) {
            [v63 jsonRepresentation];
          }
          else {
          v64 = [v63 dictionaryRepresentation];
          }
          [v57 addObject:v64];
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v67 objects:v71 count:16];
      }
      while (v60);
    }

    if (a2) {
      v65 = @"intentResponseFailure";
    }
    else {
      v65 = @"intent_response_failure";
    }
    [v4 setObject:v57 forKey:v65];
  }
LABEL_131:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventRideBookingSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventRideBookingSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventRideBookingSession *)-[GEOLogMsgEventRideBookingSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1 || (id v6 = (id)[a1 init], v6, !v6))
  {
    id v14 = 0;
    goto LABEL_183;
  }
  if (a3) {
    int v7 = @"rideBookingSessionId";
  }
  else {
    int v7 = @"ride_booking_session_id";
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)[v8 copy];
    [v6 setRideBookingSessionId:v9];
  }
  if (a3) {
    v10 = @"endState";
  }
  else {
    v10 = @"end_state";
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"RBES_UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"RBES_BOOKED"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"RBES_ABANDONED"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"RBES_SUSPENDED"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"RBES_PUNCHED_OUT"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"RBES_ERROR"])
    {
      uint64_t v13 = 5;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_30;
    }
    uint64_t v13 = [v11 intValue];
  }
  [v6 setEndState:v13];
LABEL_30:

  if (a3) {
    v15 = @"endView";
  }
  else {
    v15 = @"end_view";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v16;
    if ([v17 isEqualToString:@"RBV_NOT_SET"])
    {
      uint64_t v18 = 0;
    }
    else if ([v17 isEqualToString:@"RBV_RIDE_OPTIONS"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqualToString:@"RBV_DETAILS_PICKING"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqualToString:@"RBV_CONFIRMATION_REQUESTING"])
    {
      uint64_t v18 = 3;
    }
    else if ([v17 isEqualToString:@"RBV_CONFIRMATION_CONFIRMED"])
    {
      uint64_t v18 = 4;
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_49;
    }
    uint64_t v18 = [v16 intValue];
  }
  [v6 setEndView:v18];
LABEL_49:

  if (a3) {
    v19 = @"rideAppId";
  }
  else {
    v19 = @"ride_app_id";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = (void *)[v20 copy];
    [v6 setRideAppId:v21];
  }
  if (a3) {
    v22 = @"originBlurred";
  }
  else {
    v22 = @"origin_blurred";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v25 = [(GEOLatLng *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOLatLng *)v24 initWithDictionary:v23];
    }
    v26 = (void *)v25;
    [v6 setOriginBlurred:v25];
  }
  if (a3) {
    v27 = @"destinationBlurred";
  }
  else {
    v27 = @"destination_blurred";
  }
  int v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v30 = [(GEOLatLng *)v29 initWithJSON:v28];
    }
    else {
      uint64_t v30 = [(GEOLatLng *)v29 initWithDictionary:v28];
    }
    v31 = (void *)v30;
    [v6 setDestinationBlurred:v30];
  }
  if (a3) {
    v32 = @"exploredOtherOptions";
  }
  else {
    v32 = @"explored_other_options";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setExploredOtherOptions:", objc_msgSend(v33, "BOOLValue"));
  }

  if (a3) {
    v34 = @"rideType";
  }
  else {
    v34 = @"ride_type";
  }
  int v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = (void *)[v35 copy];
    [v6 setRideType:v36];
  }
  if (a3) {
    v37 = @"distanceToPickupInMeters";
  }
  else {
    v37 = @"distance_to_pickup_in_meters";
  }
  uint64_t v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v38 doubleValue];
    objc_msgSend(v6, "setDistanceToPickupInMeters:");
  }

  if (a3) {
    v39 = @"paymentIsApplePay";
  }
  else {
    v39 = @"payment_is_apple_pay";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setPaymentIsApplePay:", objc_msgSend(v40, "BOOLValue"));
  }

  if (a3) {
    v41 = @"numberOfAvailableExtensions";
  }
  else {
    v41 = @"number_of_available_extensions";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setNumberOfAvailableExtensions:", objc_msgSend(v42, "unsignedIntValue"));
  }

  if (a3) {
    v43 = @"switchedApp";
  }
  else {
    v43 = @"switched_app";
  }
  v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSwitchedApp:", objc_msgSend(v44, "BOOLValue"));
  }

  if (a3) {
    v45 = @"showedSurgePricingAlert";
  }
  else {
    v45 = @"showed_surge_pricing_alert";
  }
  v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setShowedSurgePricingAlert:", objc_msgSend(v46, "BOOLValue"));
  }

  if (a3) {
    v47 = @"durationOfSessionInSeconds";
  }
  else {
    v47 = @"duration_of_session_in_seconds";
  }
  v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v48 doubleValue];
    objc_msgSend(v6, "setDurationOfSessionInSeconds:");
  }

  if (a3) {
    v49 = @"installedApp";
  }
  else {
    v49 = @"installed_app";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setInstalledApp:", objc_msgSend(v50, "BOOLValue"));
  }

  v51 = [v5 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setTimestamp:", objc_msgSend(v51, "longLongValue"));
  }

  v52 = [v5 objectForKeyedSubscript:@"unavailable"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setUnavailable:", objc_msgSend(v52, "BOOLValue"));
  }

  if (a3) {
    v53 = @"movedPickupLocation";
  }
  else {
    v53 = @"moved_pickup_location";
  }
  v54 = [v5 objectForKeyedSubscript:v53];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setMovedPickupLocation:", objc_msgSend(v54, "BOOLValue"));
  }

  if (a3) {
    v55 = @"errorMessage";
  }
  else {
    v55 = @"error_message";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  id v85 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v57 = v56;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v90 objects:v95 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v91 != v60) {
            objc_enumerationMutation(v57);
          }
          v62 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v63 = (void *)[v62 copy];
            [v6 addErrorMessage:v63];
          }
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v90 objects:v95 count:16];
      }
      while (v59);
    }

    id v5 = v85;
  }

  if (a3) {
    v64 = @"rideAppVersion";
  }
  else {
    v64 = @"ride_app_version";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v66 = (void *)[v65 copy];
    [v6 setRideAppVersion:v66];
  }
  if (a3) {
    long long v67 = @"comparedRideOptions";
  }
  else {
    long long v67 = @"compared_ride_options";
  }
  long long v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setComparedRideOptions:", objc_msgSend(v68, "BOOLValue"));
  }

  if (a3) {
    long long v69 = @"statusIssue";
  }
  else {
    long long v69 = @"status_issue";
  }
  long long v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v71 = v70;
    if ([v71 isEqualToString:@"RBSI_NOT_SET"])
    {
      uint64_t v72 = 0;
    }
    else if ([v71 isEqualToString:@"RBSI_MISSING_RIDE_OPTION_NAME"])
    {
      uint64_t v72 = 1;
    }
    else if ([v71 isEqualToString:@"RBSI_MISSING_RIDE_IDENTIFIER"])
    {
      uint64_t v72 = 2;
    }
    else if ([v71 isEqualToString:@"RBSI_MISSING_RIDE_ETA"])
    {
      uint64_t v72 = 3;
    }
    else
    {
      uint64_t v72 = 0;
    }

    goto LABEL_164;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v72 = [v70 intValue];
LABEL_164:
    [v6 setStatusIssue:v72];
  }

  if (a3) {
    v73 = @"intentResponseFailure";
  }
  else {
    v73 = @"intent_response_failure";
  }
  v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v75 = v74;
    uint64_t v76 = [v75 countByEnumeratingWithState:&v86 objects:v94 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v77; ++j)
        {
          if (*(void *)v87 != v78) {
            objc_enumerationMutation(v75);
          }
          uint64_t v80 = *(void *)(*((void *)&v86 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v81 = [GEORideBookingIntentResponseFailure alloc];
            if (a3) {
              uint64_t v82 = [(GEORideBookingIntentResponseFailure *)v81 initWithJSON:v80];
            }
            else {
              uint64_t v82 = [(GEORideBookingIntentResponseFailure *)v81 initWithDictionary:v80];
            }
            v83 = (void *)v82;
            [v6 addIntentResponseFailure:v82];
          }
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v86 objects:v94 count:16];
      }
      while (v77);
    }

    id v5 = v85;
  }

  id v14 = v6;
LABEL_183:

  return v14;
}

- (GEOLogMsgEventRideBookingSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventRideBookingSession *)-[GEOLogMsgEventRideBookingSession _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    int v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_342_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_343_0;
    }
    GEOLogMsgEventRideBookingSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventRideBookingSessionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventRideBookingSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventRideBookingSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0xFF8000) == 0)
    {
      id v17 = self->_reader;
      objc_sync_enter(v17);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v18];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v17);
      goto LABEL_62;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventRideBookingSession *)self readAll:0];
  if (self->_rideBookingSessionId) {
    PBDataWriterWriteStringField();
  }
  $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_rideAppId) {
    PBDataWriterWriteStringField();
  }
  if (self->_originBlurred) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_destinationBlurred) {
    PBDataWriterWriteSubmessage();
  }
  if (*((unsigned char *)&self->_flags + 1)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_rideType) {
    PBDataWriterWriteStringField();
  }
  $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
  if (*(unsigned char *)&v7)
  {
    PBDataWriterWriteDoubleField();
    $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
    if ((*(_WORD *)&v7 & 0x800) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v7 & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_53;
    }
  }
  else if ((*(_WORD *)&v7 & 0x800) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x1000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 2) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_28;
    }
LABEL_59:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x400) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_58:
  PBDataWriterWriteInt64Field();
  $150E7F75803E167E6CE7D122FD23A4FB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) != 0) {
    goto LABEL_59;
  }
LABEL_28:
  if ((*(_WORD *)&v7 & 0x400) != 0) {
LABEL_29:
  }
    PBDataWriterWriteBOOLField();
LABEL_30:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self->_errorMessages;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  if (self->_rideAppVersion) {
    PBDataWriterWriteStringField();
  }
  $150E7F75803E167E6CE7D122FD23A4FB v12 = self->_flags;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    $150E7F75803E167E6CE7D122FD23A4FB v12 = self->_flags;
  }
  if ((*(unsigned char *)&v12 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_intentResponseFailures;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

LABEL_62:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOLogMsgEventRideBookingSession _readDestinationBlurred]((uint64_t)self);
  if ([(GEOLatLng *)self->_destinationBlurred hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEventRideBookingSession _readOriginBlurred]((uint64_t)self);
  originBlurred = self->_originBlurred;

  return [(GEOLatLng *)originBlurred hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v16 = (id *)a3;
  [(GEOLogMsgEventRideBookingSession *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 26) = self->_readerMarkPos;
  *((_DWORD *)v16 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_rideBookingSessionId) {
    objc_msgSend(v16, "setRideBookingSessionId:");
  }
  $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  id v5 = v16;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *((_DWORD *)v16 + 29) = self->_endState;
    *((_DWORD *)v16 + 35) |= 8u;
    $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v16 + 30) = self->_endView;
    *((_DWORD *)v16 + 35) |= 0x10u;
  }
  if (self->_rideAppId)
  {
    objc_msgSend(v16, "setRideAppId:");
    id v5 = v16;
  }
  if (self->_originBlurred)
  {
    objc_msgSend(v16, "setOriginBlurred:");
    id v5 = v16;
  }
  if (self->_destinationBlurred)
  {
    objc_msgSend(v16, "setDestinationBlurred:");
    id v5 = v16;
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    *((unsigned char *)v5 + 133) = self->_exploredOtherOptions;
    *((_DWORD *)v5 + 35) |= 0x100u;
  }
  if (self->_rideType)
  {
    objc_msgSend(v16, "setRideType:");
    id v5 = v16;
  }
  $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
  if (*(unsigned char *)&v6)
  {
    v5[3] = *(id *)&self->_distanceToPickupInMeters;
    *((_DWORD *)v5 + 35) |= 1u;
    $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&v6 & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_19;
  }
  *((unsigned char *)v5 + 136) = self->_paymentIsApplePay;
  *((_DWORD *)v5 + 35) |= 0x800u;
  $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v5 + 31) = self->_numberOfAvailableExtensions;
  *((_DWORD *)v5 + 35) |= 0x20u;
  $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((unsigned char *)v5 + 138) = self->_switchedApp;
  *((_DWORD *)v5 + 35) |= 0x2000u;
  $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((unsigned char *)v5 + 137) = self->_showedSurgePricingAlert;
  *((_DWORD *)v5 + 35) |= 0x1000u;
  $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  v5[4] = *(id *)&self->_durationOfSessionInSeconds;
  *((_DWORD *)v5 + 35) |= 2u;
  $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((unsigned char *)v5 + 134) = self->_installedApp;
  *((_DWORD *)v5 + 35) |= 0x200u;
  $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_26;
    }
LABEL_53:
    *((unsigned char *)v5 + 139) = self->_unavailable;
    *((_DWORD *)v5 + 35) |= 0x4000u;
    if ((*(_DWORD *)&self->_flags & 0x400) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_52:
  v5[12] = self->_timestamp;
  *((_DWORD *)v5 + 35) |= 4u;
  $150E7F75803E167E6CE7D122FD23A4FB v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x4000) != 0) {
    goto LABEL_53;
  }
LABEL_26:
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
LABEL_27:
    *((unsigned char *)v5 + 135) = self->_movedPickupLocation;
    *((_DWORD *)v5 + 35) |= 0x400u;
  }
LABEL_28:
  if ([(GEOLogMsgEventRideBookingSession *)self errorMessagesCount])
  {
    [v16 clearErrorMessages];
    unint64_t v7 = [(GEOLogMsgEventRideBookingSession *)self errorMessagesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(GEOLogMsgEventRideBookingSession *)self errorMessageAtIndex:i];
        [v16 addErrorMessage:v10];
      }
    }
  }
  if (self->_rideAppVersion) {
    objc_msgSend(v16, "setRideAppVersion:");
  }
  $150E7F75803E167E6CE7D122FD23A4FB v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 0x80) != 0)
  {
    *((unsigned char *)v16 + 132) = self->_comparedRideOptions;
    *((_DWORD *)v16 + 35) |= 0x80u;
    $150E7F75803E167E6CE7D122FD23A4FB v11 = self->_flags;
  }
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    *((_DWORD *)v16 + 32) = self->_statusIssue;
    *((_DWORD *)v16 + 35) |= 0x40u;
  }
  if ([(GEOLogMsgEventRideBookingSession *)self intentResponseFailuresCount])
  {
    [v16 clearIntentResponseFailures];
    unint64_t v12 = [(GEOLogMsgEventRideBookingSession *)self intentResponseFailuresCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t j = 0; j != v13; ++j)
      {
        uint64_t v15 = [(GEOLogMsgEventRideBookingSession *)self intentResponseFailureAtIndex:j];
        [v16 addIntentResponseFailure:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 0x80) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventRideBookingSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_40;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventRideBookingSession *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_rideBookingSessionId copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_endState;
    *(_DWORD *)(v5 + 140) |= 8u;
    $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_endView;
    *(_DWORD *)(v5 + 140) |= 0x10u;
  }
  uint64_t v12 = [(NSString *)self->_rideAppId copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  id v14 = [(GEOLatLng *)self->_originBlurred copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  id v16 = [(GEOLatLng *)self->_destinationBlurred copyWithZone:a3];
  id v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  if (*((unsigned char *)&self->_flags + 1))
  {
    *(unsigned char *)(v5 + 133) = self->_exploredOtherOptions;
    *(_DWORD *)(v5 + 140) |= 0x100u;
  }
  uint64_t v18 = [(NSString *)self->_rideType copyWithZone:a3];
  long long v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
  if (*(unsigned char *)&v20)
  {
    *(double *)(v5 + 24) = self->_distanceToPickupInMeters;
    *(_DWORD *)(v5 + 140) |= 1u;
    $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
    if ((*(_WORD *)&v20 & 0x800) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v20 & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v20 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  *(unsigned char *)(v5 + 136) = self->_paymentIsApplePay;
  *(_DWORD *)(v5 + 140) |= 0x800u;
  $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
  if ((*(unsigned char *)&v20 & 0x20) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v20 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 124) = self->_numberOfAvailableExtensions;
  *(_DWORD *)(v5 + 140) |= 0x20u;
  $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v20 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(unsigned char *)(v5 + 138) = self->_switchedApp;
  *(_DWORD *)(v5 + 140) |= 0x2000u;
  $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v20 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(unsigned char *)(v5 + 137) = self->_showedSurgePricingAlert;
  *(_DWORD *)(v5 + 140) |= 0x1000u;
  $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
  if ((*(unsigned char *)&v20 & 2) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v20 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(double *)(v5 + 32) = self->_durationOfSessionInSeconds;
  *(_DWORD *)(v5 + 140) |= 2u;
  $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x200) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v20 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(unsigned char *)(v5 + 134) = self->_installedApp;
  *(_DWORD *)(v5 + 140) |= 0x200u;
  $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
  if ((*(unsigned char *)&v20 & 4) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v20 & 0x4000) == 0) {
      goto LABEL_20;
    }
LABEL_49:
    *(unsigned char *)(v5 + 139) = self->_unavailable;
    *(_DWORD *)(v5 + 140) |= 0x4000u;
    if ((*(_DWORD *)&self->_flags & 0x400) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_48:
  *(void *)(v5 + 96) = self->_timestamp;
  *(_DWORD *)(v5 + 140) |= 4u;
  $150E7F75803E167E6CE7D122FD23A4FB v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x4000) != 0) {
    goto LABEL_49;
  }
LABEL_20:
  if ((*(_WORD *)&v20 & 0x400) != 0)
  {
LABEL_21:
    *(unsigned char *)(v5 + 135) = self->_movedPickupLocation;
    *(_DWORD *)(v5 + 140) |= 0x400u;
  }
LABEL_22:
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v21 = self->_errorMessages;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addErrorMessage:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v22);
  }

  uint64_t v26 = [(NSString *)self->_rideAppVersion copyWithZone:a3];
  v27 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v26;

  $150E7F75803E167E6CE7D122FD23A4FB v28 = self->_flags;
  if ((*(unsigned char *)&v28 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 132) = self->_comparedRideOptions;
    *(_DWORD *)(v5 + 140) |= 0x80u;
    $150E7F75803E167E6CE7D122FD23A4FB v28 = self->_flags;
  }
  if ((*(unsigned char *)&v28 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_statusIssue;
    *(_DWORD *)(v5 + 140) |= 0x40u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v8 = self->_intentResponseFailures;
  uint64_t v29 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v8);
        }
        v32 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "copyWithZone:", a3, (void)v34);
        [(id)v5 addIntentResponseFailure:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v29);
  }
LABEL_40:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_118;
  }
  [(GEOLogMsgEventRideBookingSession *)self readAll:1];
  [v4 readAll:1];
  rideBookingSessionId = self->_rideBookingSessionId;
  if ((unint64_t)rideBookingSessionId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](rideBookingSessionId, "isEqual:")) {
      goto LABEL_118;
    }
  }
  $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 35);
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_endState != *((_DWORD *)v4 + 29)) {
      goto LABEL_118;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_118;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_endView != *((_DWORD *)v4 + 30)) {
      goto LABEL_118;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_118;
  }
  rideAppId = self->_rideAppId;
  if ((unint64_t)rideAppId | *((void *)v4 + 8) && !-[NSString isEqual:](rideAppId, "isEqual:")) {
    goto LABEL_118;
  }
  originBlurred = self->_originBlurred;
  if ((unint64_t)originBlurred | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](originBlurred, "isEqual:")) {
      goto LABEL_118;
    }
  }
  destinationBlurred = self->_destinationBlurred;
  if ((unint64_t)destinationBlurred | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](destinationBlurred, "isEqual:")) {
      goto LABEL_118;
    }
  }
  $150E7F75803E167E6CE7D122FD23A4FB v11 = self->_flags;
  int v12 = *((_DWORD *)v4 + 35);
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0) {
      goto LABEL_118;
    }
    if (self->_exploredOtherOptions)
    {
      if (!*((unsigned char *)v4 + 133)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 133))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_118;
  }
  rideType = self->_rideType;
  if ((unint64_t)rideType | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](rideType, "isEqual:")) {
      goto LABEL_118;
    }
    $150E7F75803E167E6CE7D122FD23A4FB v11 = self->_flags;
    int v12 = *((_DWORD *)v4 + 35);
  }
  if (*(unsigned char *)&v11)
  {
    if ((v12 & 1) == 0 || self->_distanceToPickupInMeters != *((double *)v4 + 3)) {
      goto LABEL_118;
    }
  }
  else if (v12)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0) {
      goto LABEL_118;
    }
    if (self->_paymentIsApplePay)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_118;
  }
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_numberOfAvailableExtensions != *((_DWORD *)v4 + 31)) {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0) {
      goto LABEL_118;
    }
    if (self->_switchedApp)
    {
      if (!*((unsigned char *)v4 + 138)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 138))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0) {
      goto LABEL_118;
    }
    if (self->_showedSurgePricingAlert)
    {
      if (!*((unsigned char *)v4 + 137)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 137))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_118;
  }
  if ((*(unsigned char *)&v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_durationOfSessionInSeconds != *((double *)v4 + 4)) {
      goto LABEL_118;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0) {
      goto LABEL_118;
    }
    if (self->_installedApp)
    {
      if (!*((unsigned char *)v4 + 134)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 134))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_118;
  }
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_timestamp != *((void *)v4 + 12)) {
      goto LABEL_118;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0) {
      goto LABEL_118;
    }
    if (self->_unavailable)
    {
      if (!*((unsigned char *)v4 + 139)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 139))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0) {
      goto LABEL_118;
    }
    if (self->_movedPickupLocation)
    {
      if (!*((unsigned char *)v4 + 135)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 135))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_118;
  }
  errorMessages = self->_errorMessages;
  if ((unint64_t)errorMessages | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](errorMessages, "isEqual:"))
  {
    goto LABEL_118;
  }
  rideAppVersion = self->_rideAppVersion;
  if ((unint64_t)rideAppVersion | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](rideAppVersion, "isEqual:")) {
      goto LABEL_118;
    }
  }
  $150E7F75803E167E6CE7D122FD23A4FB v16 = self->_flags;
  int v17 = *((_DWORD *)v4 + 35);
  if ((*(unsigned char *)&v16 & 0x80) != 0)
  {
    if ((v17 & 0x80) != 0)
    {
      if (self->_comparedRideOptions)
      {
        if (!*((unsigned char *)v4 + 132)) {
          goto LABEL_118;
        }
        goto LABEL_111;
      }
      if (!*((unsigned char *)v4 + 132)) {
        goto LABEL_111;
      }
    }
LABEL_118:
    char v19 = 0;
    goto LABEL_119;
  }
  if ((v17 & 0x80) != 0) {
    goto LABEL_118;
  }
LABEL_111:
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_statusIssue != *((_DWORD *)v4 + 32)) {
      goto LABEL_118;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_118;
  }
  intentResponseFailures = self->_intentResponseFailures;
  if ((unint64_t)intentResponseFailures | *((void *)v4 + 6)) {
    char v19 = -[NSMutableArray isEqual:](intentResponseFailures, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_119:

  return v19;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventRideBookingSession *)self readAll:1];
  NSUInteger v37 = [(NSString *)self->_rideBookingSessionId hash];
  $150E7F75803E167E6CE7D122FD23A4FB flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    uint64_t v36 = 2654435761 * self->_endState;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v35 = 2654435761 * self->_endView;
      goto LABEL_6;
    }
  }
  uint64_t v35 = 0;
LABEL_6:
  NSUInteger v34 = [(NSString *)self->_rideAppId hash];
  unint64_t v33 = [(GEOLatLng *)self->_originBlurred hash];
  unint64_t v32 = [(GEOLatLng *)self->_destinationBlurred hash];
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v31 = 2654435761 * self->_exploredOtherOptions;
  }
  else {
    uint64_t v31 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_rideType hash];
  $150E7F75803E167E6CE7D122FD23A4FB v4 = self->_flags;
  if (*(unsigned char *)&v4)
  {
    double distanceToPickupInMeters = self->_distanceToPickupInMeters;
    double v7 = -distanceToPickupInMeters;
    if (distanceToPickupInMeters >= 0.0) {
      double v7 = self->_distanceToPickupInMeters;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
    uint64_t v29 = 2654435761 * self->_paymentIsApplePay;
    if ((*(unsigned char *)&v4 & 0x20) != 0)
    {
LABEL_19:
      uint64_t v28 = 2654435761 * self->_numberOfAvailableExtensions;
      if ((*(_WORD *)&v4 & 0x2000) != 0) {
        goto LABEL_20;
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_19;
    }
  }
  uint64_t v28 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_20:
    uint64_t v27 = 2654435761 * self->_switchedApp;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_21;
    }
LABEL_29:
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_22;
    }
LABEL_30:
    unint64_t v14 = 0;
    goto LABEL_33;
  }
LABEL_28:
  uint64_t v27 = 0;
  if ((*(_WORD *)&v4 & 0x1000) == 0) {
    goto LABEL_29;
  }
LABEL_21:
  uint64_t v25 = 2654435761 * self->_showedSurgePricingAlert;
  if ((*(unsigned char *)&v4 & 2) == 0) {
    goto LABEL_30;
  }
LABEL_22:
  double durationOfSessionInSeconds = self->_durationOfSessionInSeconds;
  double v11 = -durationOfSessionInSeconds;
  if (durationOfSessionInSeconds >= 0.0) {
    double v11 = self->_durationOfSessionInSeconds;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_33:
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    uint64_t v15 = 2654435761 * self->_installedApp;
    if ((*(unsigned char *)&v4 & 4) != 0)
    {
LABEL_35:
      uint64_t v16 = 2654435761 * self->_timestamp;
      if ((*(_WORD *)&v4 & 0x4000) != 0) {
        goto LABEL_36;
      }
LABEL_40:
      uint64_t v17 = 0;
      if ((*(_WORD *)&v4 & 0x400) != 0) {
        goto LABEL_37;
      }
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_35;
    }
  }
  uint64_t v16 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v17 = 2654435761 * self->_unavailable;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_37:
    uint64_t v18 = 2654435761 * self->_movedPickupLocation;
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v18 = 0;
LABEL_42:
  uint64_t v19 = [(NSMutableArray *)self->_errorMessages hash];
  NSUInteger v20 = [(NSString *)self->_rideAppVersion hash];
  $150E7F75803E167E6CE7D122FD23A4FB v21 = self->_flags;
  if ((*(unsigned char *)&v21 & 0x80) != 0)
  {
    uint64_t v22 = 2654435761 * self->_comparedRideOptions;
    if ((*(unsigned char *)&v21 & 0x40) != 0) {
      goto LABEL_44;
    }
LABEL_46:
    uint64_t v23 = 0;
    return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v5 ^ v29 ^ v28 ^ v27 ^ v26 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ [(NSMutableArray *)self->_intentResponseFailures hash];
  }
  uint64_t v22 = 0;
  if ((*(unsigned char *)&v21 & 0x40) == 0) {
    goto LABEL_46;
  }
LABEL_44:
  uint64_t v23 = 2654435761 * self->_statusIssue;
  return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v5 ^ v29 ^ v28 ^ v27 ^ v26 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ [(NSMutableArray *)self->_intentResponseFailures hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 10)) {
    -[GEOLogMsgEventRideBookingSession setRideBookingSessionId:](self, "setRideBookingSessionId:");
  }
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 8) != 0)
  {
    self->_endState = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_flags |= 8u;
    int v5 = *((_DWORD *)v4 + 35);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_endView = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  if (*((void *)v4 + 8)) {
    -[GEOLogMsgEventRideBookingSession setRideAppId:](self, "setRideAppId:");
  }
  originBlurred = self->_originBlurred;
  uint64_t v7 = *((void *)v4 + 7);
  if (originBlurred)
  {
    if (v7) {
      -[GEOLatLng mergeFrom:](originBlurred, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOLogMsgEventRideBookingSession setOriginBlurred:](self, "setOriginBlurred:");
  }
  destinationBlurred = self->_destinationBlurred;
  uint64_t v9 = *((void *)v4 + 2);
  if (destinationBlurred)
  {
    if (v9) {
      -[GEOLatLng mergeFrom:](destinationBlurred, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOLogMsgEventRideBookingSession setDestinationBlurred:](self, "setDestinationBlurred:");
  }
  if (*((unsigned char *)v4 + 141))
  {
    self->_exploredOtherOptions = *((unsigned char *)v4 + 133);
    *(_DWORD *)&self->_flags |= 0x100u;
  }
  if (*((void *)v4 + 11)) {
    -[GEOLogMsgEventRideBookingSession setRideType:](self, "setRideType:");
  }
  int v10 = *((_DWORD *)v4 + 35);
  if (v10)
  {
    self->_double distanceToPickupInMeters = *((double *)v4 + 3);
    *(_DWORD *)&self->_flags |= 1u;
    int v10 = *((_DWORD *)v4 + 35);
    if ((v10 & 0x800) == 0)
    {
LABEL_25:
      if ((v10 & 0x20) == 0) {
        goto LABEL_26;
      }
      goto LABEL_57;
    }
  }
  else if ((v10 & 0x800) == 0)
  {
    goto LABEL_25;
  }
  self->_paymentIsApplePay = *((unsigned char *)v4 + 136);
  *(_DWORD *)&self->_flags |= 0x800u;
  int v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x20) == 0)
  {
LABEL_26:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_numberOfAvailableExtensions = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_flags |= 0x20u;
  int v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x2000) == 0)
  {
LABEL_27:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_switchedApp = *((unsigned char *)v4 + 138);
  *(_DWORD *)&self->_flags |= 0x2000u;
  int v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x1000) == 0)
  {
LABEL_28:
    if ((v10 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_showedSurgePricingAlert = *((unsigned char *)v4 + 137);
  *(_DWORD *)&self->_flags |= 0x1000u;
  int v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 2) == 0)
  {
LABEL_29:
    if ((v10 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_double durationOfSessionInSeconds = *((double *)v4 + 4);
  *(_DWORD *)&self->_flags |= 2u;
  int v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x200) == 0)
  {
LABEL_30:
    if ((v10 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_installedApp = *((unsigned char *)v4 + 134);
  *(_DWORD *)&self->_flags |= 0x200u;
  int v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 4) == 0)
  {
LABEL_31:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_timestamp = *((void *)v4 + 12);
  *(_DWORD *)&self->_flags |= 4u;
  int v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x4000) == 0)
  {
LABEL_32:
    if ((v10 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_63:
  self->_unavailable = *((unsigned char *)v4 + 139);
  *(_DWORD *)&self->_flags |= 0x4000u;
  if ((*((_DWORD *)v4 + 35) & 0x400) != 0)
  {
LABEL_33:
    self->_movedPickupLocation = *((unsigned char *)v4 + 135);
    *(_DWORD *)&self->_flags |= 0x400u;
  }
LABEL_34:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = *((id *)v4 + 5);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEOLogMsgEventRideBookingSession *)self addErrorMessage:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 9)) {
    -[GEOLogMsgEventRideBookingSession setRideAppVersion:](self, "setRideAppVersion:");
  }
  int v16 = *((_DWORD *)v4 + 35);
  if ((v16 & 0x80) != 0)
  {
    self->_comparedRideOptions = *((unsigned char *)v4 + 132);
    *(_DWORD *)&self->_flags |= 0x80u;
    int v16 = *((_DWORD *)v4 + 35);
  }
  if ((v16 & 0x40) != 0)
  {
    self->_statusIssue = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = *((id *)v4 + 6);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[GEOLogMsgEventRideBookingSession addIntentResponseFailure:](self, "addIntentResponseFailure:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideType, 0);
  objc_storeStrong((id *)&self->_rideBookingSessionId, 0);
  objc_storeStrong((id *)&self->_rideAppVersion, 0);
  objc_storeStrong((id *)&self->_rideAppId, 0);
  objc_storeStrong((id *)&self->_originBlurred, 0);
  objc_storeStrong((id *)&self->_intentResponseFailures, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_destinationBlurred, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end