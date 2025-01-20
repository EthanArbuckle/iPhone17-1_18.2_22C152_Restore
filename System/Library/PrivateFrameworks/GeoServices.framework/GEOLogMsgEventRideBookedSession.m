@interface GEOLogMsgEventRideBookedSession
+ (BOOL)isValid:(id)a3;
+ (Class)intentResponseFailureType;
- (BOOL)bookedUsingMaps;
- (BOOL)cancelled;
- (BOOL)contactedDriver;
- (BOOL)hasBookedUsingMaps;
- (BOOL)hasCancelled;
- (BOOL)hasContactedDriver;
- (BOOL)hasInvalidVehicleLocation;
- (BOOL)hasMissingVehicleLocation;
- (BOOL)hasRideAppId;
- (BOOL)hasRideAppVersion;
- (BOOL)hasRideBookedSessionId;
- (BOOL)hasStatusIssue;
- (BOOL)hasTappedProactiveTrayItem;
- (BOOL)hasViewedDetails;
- (BOOL)hasViewedInProactiveTray;
- (BOOL)invalidVehicleLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)missingVehicleLocation;
- (BOOL)readFrom:(id)a3;
- (BOOL)tappedProactiveTrayItem;
- (BOOL)viewedDetails;
- (BOOL)viewedInProactiveTray;
- (GEOLogMsgEventRideBookedSession)init;
- (GEOLogMsgEventRideBookedSession)initWithData:(id)a3;
- (GEOLogMsgEventRideBookedSession)initWithDictionary:(id)a3;
- (GEOLogMsgEventRideBookedSession)initWithJSON:(id)a3;
- (NSMutableArray)intentResponseFailures;
- (NSString)rideAppId;
- (NSString)rideAppVersion;
- (NSString)rideBookedSessionId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intentResponseFailureAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)statusIssueAsString:(int)a3;
- (int)StringAsStatusIssue:(id)a3;
- (int)statusIssue;
- (unint64_t)hash;
- (unint64_t)intentResponseFailuresCount;
- (void)_addNoFlagsIntentResponseFailure:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIntentResponseFailures;
- (void)_readRideAppId;
- (void)_readRideAppVersion;
- (void)_readRideBookedSessionId;
- (void)addIntentResponseFailure:(id)a3;
- (void)clearIntentResponseFailures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBookedUsingMaps:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setContactedDriver:(BOOL)a3;
- (void)setHasBookedUsingMaps:(BOOL)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasContactedDriver:(BOOL)a3;
- (void)setHasInvalidVehicleLocation:(BOOL)a3;
- (void)setHasMissingVehicleLocation:(BOOL)a3;
- (void)setHasStatusIssue:(BOOL)a3;
- (void)setHasTappedProactiveTrayItem:(BOOL)a3;
- (void)setHasViewedDetails:(BOOL)a3;
- (void)setHasViewedInProactiveTray:(BOOL)a3;
- (void)setIntentResponseFailures:(id)a3;
- (void)setInvalidVehicleLocation:(BOOL)a3;
- (void)setMissingVehicleLocation:(BOOL)a3;
- (void)setRideAppId:(id)a3;
- (void)setRideAppVersion:(id)a3;
- (void)setRideBookedSessionId:(id)a3;
- (void)setStatusIssue:(int)a3;
- (void)setTappedProactiveTrayItem:(BOOL)a3;
- (void)setViewedDetails:(BOOL)a3;
- (void)setViewedInProactiveTray:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventRideBookedSession

- (GEOLogMsgEventRideBookedSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventRideBookedSession;
  v2 = [(GEOLogMsgEventRideBookedSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventRideBookedSession)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventRideBookedSession;
  v3 = [(GEOLogMsgEventRideBookedSession *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)bookedUsingMaps
{
  return self->_bookedUsingMaps;
}

- (void)setBookedUsingMaps:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_bookedUsingMaps = a3;
}

- (void)setHasBookedUsingMaps:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBookedUsingMaps
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasCancelled
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)contactedDriver
{
  return self->_contactedDriver;
}

- (void)setContactedDriver:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_contactedDriver = a3;
}

- (void)setHasContactedDriver:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8200;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasContactedDriver
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)viewedInProactiveTray
{
  return self->_viewedInProactiveTray;
}

- (void)setViewedInProactiveTray:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  self->_viewedInProactiveTray = a3;
}

- (void)setHasViewedInProactiveTray:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8448;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasViewedInProactiveTray
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (BOOL)tappedProactiveTrayItem
{
  return self->_tappedProactiveTrayItem;
}

- (void)setTappedProactiveTrayItem:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_tappedProactiveTrayItem = a3;
}

- (void)setHasTappedProactiveTrayItem:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8256;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasTappedProactiveTrayItem
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)viewedDetails
{
  return self->_viewedDetails;
}

- (void)setViewedDetails:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  self->_viewedDetails = a3;
}

- (void)setHasViewedDetails:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8320;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasViewedDetails
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readRideAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 72) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookedSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideAppId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRideAppId
{
  return self->_rideAppId != 0;
}

- (NSString)rideAppId
{
  -[GEOLogMsgEventRideBookedSession _readRideAppId]((uint64_t)self);
  rideAppId = self->_rideAppId;

  return rideAppId;
}

- (void)setRideAppId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_rideAppId, a3);
}

- (void)_readRideBookedSessionId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 72) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookedSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideBookedSessionId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRideBookedSessionId
{
  return self->_rideBookedSessionId != 0;
}

- (NSString)rideBookedSessionId
{
  -[GEOLogMsgEventRideBookedSession _readRideBookedSessionId]((uint64_t)self);
  rideBookedSessionId = self->_rideBookedSessionId;

  return rideBookedSessionId;
}

- (void)setRideBookedSessionId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_rideBookedSessionId, a3);
}

- (void)_readRideAppVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 72) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookedSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRideAppVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRideAppVersion
{
  return self->_rideAppVersion != 0;
}

- (NSString)rideAppVersion
{
  -[GEOLogMsgEventRideBookedSession _readRideAppVersion]((uint64_t)self);
  rideAppVersion = self->_rideAppVersion;

  return rideAppVersion;
}

- (void)setRideAppVersion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2800u;
  objc_storeStrong((id *)&self->_rideAppVersion, a3);
}

- (BOOL)invalidVehicleLocation
{
  return self->_invalidVehicleLocation;
}

- (void)setInvalidVehicleLocation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_invalidVehicleLocation = a3;
}

- (void)setHasInvalidVehicleLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8208;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasInvalidVehicleLocation
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)missingVehicleLocation
{
  return self->_missingVehicleLocation;
}

- (void)setMissingVehicleLocation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_missingVehicleLocation = a3;
}

- (void)setHasMissingVehicleLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8224;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasMissingVehicleLocation
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (int)statusIssue
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_statusIssue;
  }
  else {
    return 0;
  }
}

- (void)setStatusIssue:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_statusIssue = a3;
}

- (void)setHasStatusIssue:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasStatusIssue
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)statusIssueAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53F6E28[a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 72) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookedSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIntentResponseFailures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)intentResponseFailures
{
  -[GEOLogMsgEventRideBookedSession _readIntentResponseFailures]((uint64_t)self);
  intentResponseFailures = self->_intentResponseFailures;

  return intentResponseFailures;
}

- (void)setIntentResponseFailures:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  intentResponseFailures = self->_intentResponseFailures;
  self->_intentResponseFailures = v4;
}

- (void)clearIntentResponseFailures
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  intentResponseFailures = self->_intentResponseFailures;

  [(NSMutableArray *)intentResponseFailures removeAllObjects];
}

- (void)addIntentResponseFailure:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventRideBookedSession _readIntentResponseFailures]((uint64_t)self);
  -[GEOLogMsgEventRideBookedSession _addNoFlagsIntentResponseFailure:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsIntentResponseFailure:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)intentResponseFailuresCount
{
  -[GEOLogMsgEventRideBookedSession _readIntentResponseFailures]((uint64_t)self);
  intentResponseFailures = self->_intentResponseFailures;

  return [(NSMutableArray *)intentResponseFailures count];
}

- (id)intentResponseFailureAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventRideBookedSession _readIntentResponseFailures]((uint64_t)self);
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
  v8.super_class = (Class)GEOLogMsgEventRideBookedSession;
  id v4 = [(GEOLogMsgEventRideBookedSession *)&v8 description];
  id v5 = [(GEOLogMsgEventRideBookedSession *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventRideBookedSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_79;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 2) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
    if (a2) {
      v16 = @"bookedUsingMaps";
    }
    else {
      v16 = @"booked_using_maps";
    }
    [v4 setObject:v15 forKey:v16];

    __int16 v5 = *(_WORD *)(a1 + 72);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_36;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  [v4 setObject:v17 forKey:@"cancelled"];

  __int16 v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_36:
  v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 66)];
  if (a2) {
    v19 = @"contactedDriver";
  }
  else {
    v19 = @"contacted_driver";
  }
  [v4 setObject:v18 forKey:v19];

  __int16 v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_40:
  v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 71)];
  if (a2) {
    v21 = @"viewedInProactiveTray";
  }
  else {
    v21 = @"viewed_in_proactive_tray";
  }
  [v4 setObject:v20 forKey:v21];

  __int16 v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_44:
  v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 69)];
  if (a2) {
    v23 = @"tappedProactiveTrayItem";
  }
  else {
    v23 = @"tapped_proactive_tray_item";
  }
  [v4 setObject:v22 forKey:v23];

  if ((*(_WORD *)(a1 + 72) & 0x80) != 0)
  {
LABEL_8:
    objc_super v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 70)];
    if (a2) {
      id v7 = @"viewedDetails";
    }
    else {
      id v7 = @"viewed_details";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_12:
  objc_super v8 = [(id)a1 rideAppId];
  if (v8)
  {
    if (a2) {
      v9 = @"rideAppId";
    }
    else {
      v9 = @"ride_app_id";
    }
    [v4 setObject:v8 forKey:v9];
  }

  v10 = [(id)a1 rideBookedSessionId];
  if (v10)
  {
    if (a2) {
      v11 = @"rideBookedSessionId";
    }
    else {
      v11 = @"ride_booked_session_id";
    }
    [v4 setObject:v10 forKey:v11];
  }

  v12 = [(id)a1 rideAppVersion];
  if (v12)
  {
    if (a2) {
      v13 = @"rideAppVersion";
    }
    else {
      v13 = @"ride_app_version";
    }
    [v4 setObject:v12 forKey:v13];
  }

  __int16 v14 = *(_WORD *)(a1 + 72);
  if ((v14 & 0x10) != 0)
  {
    v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 67)];
    if (a2) {
      v25 = @"invalidVehicleLocation";
    }
    else {
      v25 = @"invalid_vehicle_location";
    }
    [v4 setObject:v24 forKey:v25];

    __int16 v14 = *(_WORD *)(a1 + 72);
    if ((v14 & 0x20) == 0)
    {
LABEL_29:
      if ((v14 & 1) == 0) {
        goto LABEL_64;
      }
      goto LABEL_57;
    }
  }
  else if ((v14 & 0x20) == 0)
  {
    goto LABEL_29;
  }
  v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
  if (a2) {
    v27 = @"missingVehicleLocation";
  }
  else {
    v27 = @"missing_vehicle_location";
  }
  [v4 setObject:v26 forKey:v27];

  if (*(_WORD *)(a1 + 72))
  {
LABEL_57:
    uint64_t v28 = *(int *)(a1 + 60);
    if (v28 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E53F6E28[v28];
    }
    if (a2) {
      v30 = @"statusIssue";
    }
    else {
      v30 = @"status_issue";
    }
    [v4 setObject:v29 forKey:v30];
  }
LABEL_64:
  if ([*(id *)(a1 + 16) count])
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v32 = *(id *)(a1 + 16);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v42 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (a2) {
            [v37 jsonRepresentation];
          }
          else {
          v38 = [v37 dictionaryRepresentation];
          }
          [v31 addObject:v38];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v34);
    }

    if (a2) {
      v39 = @"intentResponseFailure";
    }
    else {
      v39 = @"intent_response_failure";
    }
    [v4 setObject:v31 forKey:v39];
  }
LABEL_79:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventRideBookedSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventRideBookedSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventRideBookedSession *)-[GEOLogMsgEventRideBookedSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_90;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_90;
  }
  if (a3) {
    objc_super v6 = @"bookedUsingMaps";
  }
  else {
    objc_super v6 = @"booked_using_maps";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBookedUsingMaps:", objc_msgSend(v7, "BOOLValue"));
  }

  objc_super v8 = [v5 objectForKeyedSubscript:@"cancelled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCancelled:", objc_msgSend(v8, "BOOLValue"));
  }

  if (a3) {
    v9 = @"contactedDriver";
  }
  else {
    v9 = @"contacted_driver";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setContactedDriver:", objc_msgSend(v10, "BOOLValue"));
  }

  if (a3) {
    v11 = @"viewedInProactiveTray";
  }
  else {
    v11 = @"viewed_in_proactive_tray";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setViewedInProactiveTray:", objc_msgSend(v12, "BOOLValue"));
  }

  if (a3) {
    v13 = @"tappedProactiveTrayItem";
  }
  else {
    v13 = @"tapped_proactive_tray_item";
  }
  __int16 v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTappedProactiveTrayItem:", objc_msgSend(v14, "BOOLValue"));
  }

  if (a3) {
    v15 = @"viewedDetails";
  }
  else {
    v15 = @"viewed_details";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setViewedDetails:", objc_msgSend(v16, "BOOLValue"));
  }

  if (a3) {
    v17 = @"rideAppId";
  }
  else {
    v17 = @"ride_app_id";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (void *)[v18 copy];
    [a1 setRideAppId:v19];
  }
  if (a3) {
    v20 = @"rideBookedSessionId";
  }
  else {
    v20 = @"ride_booked_session_id";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (void *)[v21 copy];
    [a1 setRideBookedSessionId:v22];
  }
  if (a3) {
    v23 = @"rideAppVersion";
  }
  else {
    v23 = @"ride_app_version";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = (void *)[v24 copy];
    [a1 setRideAppVersion:v25];
  }
  if (a3) {
    v26 = @"invalidVehicleLocation";
  }
  else {
    v26 = @"invalid_vehicle_location";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setInvalidVehicleLocation:", objc_msgSend(v27, "BOOLValue"));
  }

  if (a3) {
    uint64_t v28 = @"missingVehicleLocation";
  }
  else {
    uint64_t v28 = @"missing_vehicle_location";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMissingVehicleLocation:", objc_msgSend(v29, "BOOLValue"));
  }

  if (a3) {
    v30 = @"statusIssue";
  }
  else {
    v30 = @"status_issue";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v31;
    if ([v32 isEqualToString:@"RBSI_NOT_SET"])
    {
      uint64_t v33 = 0;
    }
    else if ([v32 isEqualToString:@"RBSI_MISSING_RIDE_OPTION_NAME"])
    {
      uint64_t v33 = 1;
    }
    else if ([v32 isEqualToString:@"RBSI_MISSING_RIDE_IDENTIFIER"])
    {
      uint64_t v33 = 2;
    }
    else if ([v32 isEqualToString:@"RBSI_MISSING_RIDE_ETA"])
    {
      uint64_t v33 = 3;
    }
    else
    {
      uint64_t v33 = 0;
    }

    goto LABEL_71;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v33 = [v31 intValue];
LABEL_71:
    [a1 setStatusIssue:v33];
  }

  if (a3) {
    uint64_t v34 = @"intentResponseFailure";
  }
  else {
    uint64_t v34 = @"intent_response_failure";
  }
  uint64_t v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v46 = v35;
    id v36 = v35;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v48 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v42 = [GEORideBookingIntentResponseFailure alloc];
            if (a3) {
              uint64_t v43 = [(GEORideBookingIntentResponseFailure *)v42 initWithJSON:v41];
            }
            else {
              uint64_t v43 = [(GEORideBookingIntentResponseFailure *)v42 initWithDictionary:v41];
            }
            long long v44 = (void *)v43;
            [a1 addIntentResponseFailure:v43];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v38);
    }

    uint64_t v35 = v46;
  }

LABEL_90:
  return a1;
}

- (GEOLogMsgEventRideBookedSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventRideBookedSession *)-[GEOLogMsgEventRideBookedSession _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_86;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_86;
    }
    GEOLogMsgEventRideBookedSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventRideBookedSessionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventRideBookedSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventRideBookedSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3E00) == 0)
    {
      v12 = self->_reader;
      objc_sync_enter(v12);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v13];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_38;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventRideBookedSession *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_30;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 0x80) != 0) {
LABEL_9:
  }
    PBDataWriterWriteBOOLField();
LABEL_10:
  if (self->_rideAppId) {
    PBDataWriterWriteStringField();
  }
  if (self->_rideBookedSessionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_rideAppVersion) {
    PBDataWriterWriteStringField();
  }
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 0x10) == 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_18;
    }
LABEL_35:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 0x20) != 0) {
    goto LABEL_35;
  }
LABEL_18:
  if (v7) {
LABEL_19:
  }
    PBDataWriterWriteInt32Field();
LABEL_20:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v8 = self->_intentResponseFailures;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

LABEL_38:
}

- (void)copyTo:(id)a3
{
  v11 = (id *)a3;
  [(GEOLogMsgEventRideBookedSession *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 12) = self->_readerMarkPos;
  *((_DWORD *)v11 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v11;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v11 + 64) = self->_bookedUsingMaps;
    *((_WORD *)v11 + 36) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v11 + 65) = self->_cancelled;
  *((_WORD *)v11 + 36) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((unsigned char *)v11 + 66) = self->_contactedDriver;
  *((_WORD *)v11 + 36) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((unsigned char *)v11 + 71) = self->_viewedInProactiveTray;
  *((_WORD *)v11 + 36) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_29:
  *((unsigned char *)v11 + 69) = self->_tappedProactiveTrayItem;
  *((_WORD *)v11 + 36) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_7:
    *((unsigned char *)v11 + 70) = self->_viewedDetails;
    *((_WORD *)v11 + 36) |= 0x80u;
  }
LABEL_8:
  if (self->_rideAppId)
  {
    objc_msgSend(v11, "setRideAppId:");
    id v4 = v11;
  }
  if (self->_rideBookedSessionId)
  {
    objc_msgSend(v11, "setRideBookedSessionId:");
    id v4 = v11;
  }
  if (self->_rideAppVersion)
  {
    objc_msgSend(v11, "setRideAppVersion:");
    id v4 = v11;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x10) == 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
LABEL_32:
    *((unsigned char *)v4 + 68) = self->_missingVehicleLocation;
    *((_WORD *)v4 + 36) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  *((unsigned char *)v4 + 67) = self->_invalidVehicleLocation;
  *((_WORD *)v4 + 36) |= 0x10u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x20) != 0) {
    goto LABEL_32;
  }
LABEL_16:
  if (v6)
  {
LABEL_17:
    *((_DWORD *)v4 + 15) = self->_statusIssue;
    *((_WORD *)v4 + 36) |= 1u;
  }
LABEL_18:
  if ([(GEOLogMsgEventRideBookedSession *)self intentResponseFailuresCount])
  {
    [v11 clearIntentResponseFailures];
    unint64_t v7 = [(GEOLogMsgEventRideBookedSession *)self intentResponseFailuresCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(GEOLogMsgEventRideBookedSession *)self intentResponseFailureAtIndex:i];
        [v11 addIntentResponseFailure:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventRideBookedSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventRideBookedSession *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_bookedUsingMaps;
    *(_WORD *)(v5 + 72) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 65) = self->_cancelled;
  *(_WORD *)(v5 + 72) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(v5 + 66) = self->_contactedDriver;
  *(_WORD *)(v5 + 72) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_9:
    if ((flags & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(unsigned char *)(v5 + 71) = self->_viewedInProactiveTray;
  *(_WORD *)(v5 + 72) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_28:
  *(unsigned char *)(v5 + 69) = self->_tappedProactiveTrayItem;
  *(_WORD *)(v5 + 72) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_11:
    *(unsigned char *)(v5 + 70) = self->_viewedDetails;
    *(_WORD *)(v5 + 72) |= 0x80u;
  }
LABEL_12:
  uint64_t v10 = [(NSString *)self->_rideAppId copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_rideBookedSessionId copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_rideAppVersion copyWithZone:a3];
  long long v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  __int16 v16 = (__int16)self->_flags;
  if ((v16 & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 67) = self->_invalidVehicleLocation;
    *(_WORD *)(v5 + 72) |= 0x10u;
    __int16 v16 = (__int16)self->_flags;
    if ((v16 & 0x20) == 0)
    {
LABEL_14:
      if ((v16 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_14;
  }
  *(unsigned char *)(v5 + 68) = self->_missingVehicleLocation;
  *(_WORD *)(v5 + 72) |= 0x20u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_15:
    *(_DWORD *)(v5 + 60) = self->_statusIssue;
    *(_WORD *)(v5 + 72) |= 1u;
  }
LABEL_16:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v8 = self->_intentResponseFailures;
  uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v8);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v5 addIntentResponseFailure:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  [(GEOLogMsgEventRideBookedSession *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 36);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_79;
    }
    if (self->_bookedUsingMaps)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_79;
    }
    if (self->_cancelled)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_79;
    }
    if (self->_contactedDriver)
    {
      if (!*((unsigned char *)v4 + 66)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 66))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x100) == 0) {
      goto LABEL_79;
    }
    if (self->_viewedInProactiveTray)
    {
      if (!*((unsigned char *)v4 + 71)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 71))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_79;
    }
    if (self->_tappedProactiveTrayItem)
    {
      if (!*((unsigned char *)v4 + 69)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 69))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_79;
    }
    if (self->_viewedDetails)
    {
      if (!*((unsigned char *)v4 + 70)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 70))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  rideAppId = self->_rideAppId;
  if ((unint64_t)rideAppId | *((void *)v4 + 3) && !-[NSString isEqual:](rideAppId, "isEqual:")) {
    goto LABEL_79;
  }
  rideBookedSessionId = self->_rideBookedSessionId;
  if ((unint64_t)rideBookedSessionId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](rideBookedSessionId, "isEqual:")) {
      goto LABEL_79;
    }
  }
  rideAppVersion = self->_rideAppVersion;
  if ((unint64_t)rideAppVersion | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](rideAppVersion, "isEqual:")) {
      goto LABEL_79;
    }
  }
  __int16 v10 = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 36);
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0) {
      goto LABEL_79;
    }
    if (self->_invalidVehicleLocation)
    {
      if (!*((unsigned char *)v4 + 67)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 67))
    {
      goto LABEL_79;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) != 0)
    {
      if (self->_missingVehicleLocation)
      {
        if (!*((unsigned char *)v4 + 68)) {
          goto LABEL_79;
        }
        goto LABEL_72;
      }
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_72;
      }
    }
LABEL_79:
    char v13 = 0;
    goto LABEL_80;
  }
  if ((v11 & 0x20) != 0) {
    goto LABEL_79;
  }
LABEL_72:
  if (v10)
  {
    if ((v11 & 1) == 0 || self->_statusIssue != *((_DWORD *)v4 + 15)) {
      goto LABEL_79;
    }
  }
  else if (v11)
  {
    goto LABEL_79;
  }
  intentResponseFailures = self->_intentResponseFailures;
  if ((unint64_t)intentResponseFailures | *((void *)v4 + 2)) {
    char v13 = -[NSMutableArray isEqual:](intentResponseFailures, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_80:

  return v13;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventRideBookedSession *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v18 = 2654435761 * self->_bookedUsingMaps;
    if ((flags & 4) != 0)
    {
LABEL_3:
      uint64_t v16 = 2654435761 * self->_cancelled;
      if ((flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = 0;
  if ((flags & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_contactedDriver;
    if ((*(_WORD *)&self->_flags & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_viewedInProactiveTray;
    if ((flags & 0x40) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((flags & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((flags & 0x40) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_tappedProactiveTrayItem;
  if ((flags & 0x80) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_viewedDetails;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
LABEL_14:
  NSUInteger v8 = [(NSString *)self->_rideAppId hash];
  NSUInteger v9 = [(NSString *)self->_rideBookedSessionId hash];
  NSUInteger v10 = [(NSString *)self->_rideAppVersion hash];
  __int16 v11 = (__int16)self->_flags;
  if ((v11 & 0x10) == 0)
  {
    uint64_t v12 = 0;
    if ((v11 & 0x20) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v13 = 0;
    if (v11) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v14 = 0;
    return v17 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ [(NSMutableArray *)self->_intentResponseFailures hash];
  }
  uint64_t v12 = 2654435761 * self->_invalidVehicleLocation;
  if ((v11 & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v13 = 2654435761 * self->_missingVehicleLocation;
  if ((v11 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v14 = 2654435761 * self->_statusIssue;
  return v17 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ [(NSMutableArray *)self->_intentResponseFailures hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_bookedUsingMaps = *((unsigned char *)v4 + 64);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_cancelled = *((unsigned char *)v4 + 65);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_contactedDriver = *((unsigned char *)v4 + 66);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_viewedInProactiveTray = *((unsigned char *)v4 + 71);
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_30:
  self->_tappedProactiveTrayItem = *((unsigned char *)v4 + 69);
  *(_WORD *)&self->_flags |= 0x40u;
  if ((*((_WORD *)v4 + 36) & 0x80) != 0)
  {
LABEL_7:
    self->_viewedDetails = *((unsigned char *)v4 + 70);
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_8:
  if (*((void *)v4 + 3)) {
    -[GEOLogMsgEventRideBookedSession setRideAppId:](self, "setRideAppId:");
  }
  if (*((void *)v4 + 5)) {
    -[GEOLogMsgEventRideBookedSession setRideBookedSessionId:](self, "setRideBookedSessionId:");
  }
  if (*((void *)v4 + 4)) {
    -[GEOLogMsgEventRideBookedSession setRideAppVersion:](self, "setRideAppVersion:");
  }
  __int16 v6 = *((_WORD *)v4 + 36);
  if ((v6 & 0x10) != 0)
  {
    self->_invalidVehicleLocation = *((unsigned char *)v4 + 67);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v6 = *((_WORD *)v4 + 36);
    if ((v6 & 0x20) == 0)
    {
LABEL_16:
      if ((v6 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  self->_missingVehicleLocation = *((unsigned char *)v4 + 68);
  *(_WORD *)&self->_flags |= 0x20u;
  if (*((_WORD *)v4 + 36))
  {
LABEL_17:
    self->_statusIssue = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_18:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOLogMsgEventRideBookedSession addIntentResponseFailure:](self, "addIntentResponseFailure:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideBookedSessionId, 0);
  objc_storeStrong((id *)&self->_rideAppVersion, 0);
  objc_storeStrong((id *)&self->_rideAppId, 0);
  objc_storeStrong((id *)&self->_intentResponseFailures, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end