@interface GEOLogMsgEventEVTrip
+ (BOOL)isValid:(id)a3;
+ (Class)chargeLocationDetailsType;
+ (Class)realtimeDodgeballType;
+ (Class)stopAddedDetailsType;
+ (Class)stopRemovedDetailsType;
- (BOOL)chargingStopAddedThroughSar;
- (BOOL)hasChargingStopAddedThroughSar;
- (BOOL)hasMetro;
- (BOOL)hasOriginalTripIncludedChargingStation;
- (BOOL)hasOutOfCharge;
- (BOOL)hasOutOfRangeAlertDisplayed;
- (BOOL)hasTripIncludedPreferredChargingStation;
- (BOOL)isEqual:(id)a3;
- (BOOL)originalTripIncludedChargingStation;
- (BOOL)outOfCharge;
- (BOOL)outOfRangeAlertDisplayed;
- (BOOL)readFrom:(id)a3;
- (BOOL)tripIncludedPreferredChargingStation;
- (GEOLogMsgEventEVTrip)init;
- (GEOLogMsgEventEVTrip)initWithData:(id)a3;
- (GEOLogMsgEventEVTrip)initWithDictionary:(id)a3;
- (GEOLogMsgEventEVTrip)initWithJSON:(id)a3;
- (NSMutableArray)chargeLocationDetails;
- (NSMutableArray)realtimeDodgeballs;
- (NSMutableArray)stopAddedDetails;
- (NSMutableArray)stopRemovedDetails;
- (NSString)metro;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)chargeLocationDetailsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)realtimeDodgeballAtIndex:(unint64_t)a3;
- (id)stopAddedDetailsAtIndex:(unint64_t)a3;
- (id)stopRemovedDetailsAtIndex:(unint64_t)a3;
- (unint64_t)chargeLocationDetailsCount;
- (unint64_t)hash;
- (unint64_t)realtimeDodgeballsCount;
- (unint64_t)stopAddedDetailsCount;
- (unint64_t)stopRemovedDetailsCount;
- (void)_addNoFlagsChargeLocationDetails:(uint64_t)a1;
- (void)_addNoFlagsRealtimeDodgeball:(uint64_t)a1;
- (void)_addNoFlagsStopAddedDetails:(uint64_t)a1;
- (void)_addNoFlagsStopRemovedDetails:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readChargeLocationDetails;
- (void)_readMetro;
- (void)_readRealtimeDodgeballs;
- (void)_readStopAddedDetails;
- (void)_readStopRemovedDetails;
- (void)addChargeLocationDetails:(id)a3;
- (void)addRealtimeDodgeball:(id)a3;
- (void)addStopAddedDetails:(id)a3;
- (void)addStopRemovedDetails:(id)a3;
- (void)clearChargeLocationDetails;
- (void)clearRealtimeDodgeballs;
- (void)clearStopAddedDetails;
- (void)clearStopRemovedDetails;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setChargeLocationDetails:(id)a3;
- (void)setChargingStopAddedThroughSar:(BOOL)a3;
- (void)setHasChargingStopAddedThroughSar:(BOOL)a3;
- (void)setHasOriginalTripIncludedChargingStation:(BOOL)a3;
- (void)setHasOutOfCharge:(BOOL)a3;
- (void)setHasOutOfRangeAlertDisplayed:(BOOL)a3;
- (void)setHasTripIncludedPreferredChargingStation:(BOOL)a3;
- (void)setMetro:(id)a3;
- (void)setOriginalTripIncludedChargingStation:(BOOL)a3;
- (void)setOutOfCharge:(BOOL)a3;
- (void)setOutOfRangeAlertDisplayed:(BOOL)a3;
- (void)setRealtimeDodgeballs:(id)a3;
- (void)setStopAddedDetails:(id)a3;
- (void)setStopRemovedDetails:(id)a3;
- (void)setTripIncludedPreferredChargingStation:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventEVTrip

- (GEOLogMsgEventEVTrip)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventEVTrip;
  v2 = [(GEOLogMsgEventEVTrip *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventEVTrip)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventEVTrip;
  v3 = [(GEOLogMsgEventEVTrip *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)outOfCharge
{
  return self->_outOfCharge;
}

- (void)setOutOfCharge:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_outOfCharge = a3;
}

- (void)setHasOutOfCharge:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1028;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasOutOfCharge
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)outOfRangeAlertDisplayed
{
  return self->_outOfRangeAlertDisplayed;
}

- (void)setOutOfRangeAlertDisplayed:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_outOfRangeAlertDisplayed = a3;
}

- (void)setHasOutOfRangeAlertDisplayed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1032;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasOutOfRangeAlertDisplayed
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readChargeLocationDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChargeLocationDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)chargeLocationDetails
{
  -[GEOLogMsgEventEVTrip _readChargeLocationDetails]((uint64_t)self);
  chargeLocationDetails = self->_chargeLocationDetails;

  return chargeLocationDetails;
}

- (void)setChargeLocationDetails:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  chargeLocationDetails = self->_chargeLocationDetails;
  self->_chargeLocationDetails = v4;
}

- (void)clearChargeLocationDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  chargeLocationDetails = self->_chargeLocationDetails;

  [(NSMutableArray *)chargeLocationDetails removeAllObjects];
}

- (void)addChargeLocationDetails:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventEVTrip _readChargeLocationDetails]((uint64_t)self);
  -[GEOLogMsgEventEVTrip _addNoFlagsChargeLocationDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsChargeLocationDetails:(uint64_t)a1
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

- (unint64_t)chargeLocationDetailsCount
{
  -[GEOLogMsgEventEVTrip _readChargeLocationDetails]((uint64_t)self);
  chargeLocationDetails = self->_chargeLocationDetails;

  return [(NSMutableArray *)chargeLocationDetails count];
}

- (id)chargeLocationDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventEVTrip _readChargeLocationDetails]((uint64_t)self);
  chargeLocationDetails = self->_chargeLocationDetails;

  return (id)[(NSMutableArray *)chargeLocationDetails objectAtIndex:a3];
}

+ (Class)chargeLocationDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readStopAddedDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStopAddedDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)stopAddedDetails
{
  -[GEOLogMsgEventEVTrip _readStopAddedDetails]((uint64_t)self);
  stopAddedDetails = self->_stopAddedDetails;

  return stopAddedDetails;
}

- (void)setStopAddedDetails:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  stopAddedDetails = self->_stopAddedDetails;
  self->_stopAddedDetails = v4;
}

- (void)clearStopAddedDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  stopAddedDetails = self->_stopAddedDetails;

  [(NSMutableArray *)stopAddedDetails removeAllObjects];
}

- (void)addStopAddedDetails:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventEVTrip _readStopAddedDetails]((uint64_t)self);
  -[GEOLogMsgEventEVTrip _addNoFlagsStopAddedDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsStopAddedDetails:(uint64_t)a1
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

- (unint64_t)stopAddedDetailsCount
{
  -[GEOLogMsgEventEVTrip _readStopAddedDetails]((uint64_t)self);
  stopAddedDetails = self->_stopAddedDetails;

  return [(NSMutableArray *)stopAddedDetails count];
}

- (id)stopAddedDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventEVTrip _readStopAddedDetails]((uint64_t)self);
  stopAddedDetails = self->_stopAddedDetails;

  return (id)[(NSMutableArray *)stopAddedDetails objectAtIndex:a3];
}

+ (Class)stopAddedDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readMetro
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetro_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMetro
{
  return self->_metro != 0;
}

- (NSString)metro
{
  -[GEOLogMsgEventEVTrip _readMetro]((uint64_t)self);
  metro = self->_metro;

  return metro;
}

- (void)setMetro:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_metro, a3);
}

- (BOOL)originalTripIncludedChargingStation
{
  return self->_originalTripIncludedChargingStation;
}

- (void)setOriginalTripIncludedChargingStation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_originalTripIncludedChargingStation = a3;
}

- (void)setHasOriginalTripIncludedChargingStation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1026;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasOriginalTripIncludedChargingStation
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)chargingStopAddedThroughSar
{
  return self->_chargingStopAddedThroughSar;
}

- (void)setChargingStopAddedThroughSar:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_chargingStopAddedThroughSar = a3;
}

- (void)setHasChargingStopAddedThroughSar:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasChargingStopAddedThroughSar
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)tripIncludedPreferredChargingStation
{
  return self->_tripIncludedPreferredChargingStation;
}

- (void)setTripIncludedPreferredChargingStation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_tripIncludedPreferredChargingStation = a3;
}

- (void)setHasTripIncludedPreferredChargingStation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1040;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTripIncludedPreferredChargingStation
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readStopRemovedDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStopRemovedDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)stopRemovedDetails
{
  -[GEOLogMsgEventEVTrip _readStopRemovedDetails]((uint64_t)self);
  stopRemovedDetails = self->_stopRemovedDetails;

  return stopRemovedDetails;
}

- (void)setStopRemovedDetails:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  stopRemovedDetails = self->_stopRemovedDetails;
  self->_stopRemovedDetails = v4;
}

- (void)clearStopRemovedDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  stopRemovedDetails = self->_stopRemovedDetails;

  [(NSMutableArray *)stopRemovedDetails removeAllObjects];
}

- (void)addStopRemovedDetails:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventEVTrip _readStopRemovedDetails]((uint64_t)self);
  -[GEOLogMsgEventEVTrip _addNoFlagsStopRemovedDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsStopRemovedDetails:(uint64_t)a1
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

- (unint64_t)stopRemovedDetailsCount
{
  -[GEOLogMsgEventEVTrip _readStopRemovedDetails]((uint64_t)self);
  stopRemovedDetails = self->_stopRemovedDetails;

  return [(NSMutableArray *)stopRemovedDetails count];
}

- (id)stopRemovedDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventEVTrip _readStopRemovedDetails]((uint64_t)self);
  stopRemovedDetails = self->_stopRemovedDetails;

  return (id)[(NSMutableArray *)stopRemovedDetails objectAtIndex:a3];
}

+ (Class)stopRemovedDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readRealtimeDodgeballs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRealtimeDodgeballs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)realtimeDodgeballs
{
  -[GEOLogMsgEventEVTrip _readRealtimeDodgeballs]((uint64_t)self);
  realtimeDodgeballs = self->_realtimeDodgeballs;

  return realtimeDodgeballs;
}

- (void)setRealtimeDodgeballs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  realtimeDodgeballs = self->_realtimeDodgeballs;
  self->_realtimeDodgeballs = v4;
}

- (void)clearRealtimeDodgeballs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  realtimeDodgeballs = self->_realtimeDodgeballs;

  [(NSMutableArray *)realtimeDodgeballs removeAllObjects];
}

- (void)addRealtimeDodgeball:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventEVTrip _readRealtimeDodgeballs]((uint64_t)self);
  -[GEOLogMsgEventEVTrip _addNoFlagsRealtimeDodgeball:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsRealtimeDodgeball:(uint64_t)a1
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

- (unint64_t)realtimeDodgeballsCount
{
  -[GEOLogMsgEventEVTrip _readRealtimeDodgeballs]((uint64_t)self);
  realtimeDodgeballs = self->_realtimeDodgeballs;

  return [(NSMutableArray *)realtimeDodgeballs count];
}

- (id)realtimeDodgeballAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventEVTrip _readRealtimeDodgeballs]((uint64_t)self);
  realtimeDodgeballs = self->_realtimeDodgeballs;

  return (id)[(NSMutableArray *)realtimeDodgeballs objectAtIndex:a3];
}

+ (Class)realtimeDodgeballType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventEVTrip;
  id v4 = [(GEOLogMsgEventEVTrip *)&v8 description];
  id v5 = [(GEOLogMsgEventEVTrip *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventEVTrip _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_81;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 76);
  unint64_t v6 = 0x1E4F28000uLL;
  if ((v5 & 4) != 0)
  {
    id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 70)];
    if (a2) {
      objc_super v8 = @"outOfCharge";
    }
    else {
      objc_super v8 = @"out_of_charge";
    }
    [v4 setObject:v7 forKey:v8];

    __int16 v5 = *(_WORD *)(a1 + 76);
  }
  if ((v5 & 8) != 0)
  {
    v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 71)];
    if (a2) {
      v10 = @"outOfRangeAlertDisplayed";
    }
    else {
      v10 = @"out_of_range_alert_displayed";
    }
    [v4 setObject:v9 forKey:v10];
  }
  if ([*(id *)(a1 + 16) count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v12 = *(id *)(a1 + 16);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v75 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v69 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if (a2) {
            [v17 jsonRepresentation];
          }
          else {
          v18 = [v17 dictionaryRepresentation];
          }
          [v11 addObject:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v68 objects:v75 count:16];
      }
      while (v14);
    }

    if (a2) {
      v19 = @"chargeLocationDetails";
    }
    else {
      v19 = @"charge_location_details";
    }
    [v4 setObject:v11 forKey:v19];

    unint64_t v6 = 0x1E4F28000;
  }
  if ([*(id *)(a1 + 40) count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v21 = *(id *)(a1 + 40);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v65 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          if (a2) {
            [v26 jsonRepresentation];
          }
          else {
          v27 = [v26 dictionaryRepresentation];
          }
          [v20 addObject:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v23);
    }

    if (a2) {
      v28 = @"stopAddedDetails";
    }
    else {
      v28 = @"stop_added_details";
    }
    [v4 setObject:v20 forKey:v28];

    unint64_t v6 = 0x1E4F28000uLL;
  }
  v29 = [(id)a1 metro];
  if (v29) {
    [v4 setObject:v29 forKey:@"metro"];
  }

  __int16 v30 = *(_WORD *)(a1 + 76);
  if ((v30 & 2) == 0)
  {
    if ((v30 & 1) == 0) {
      goto LABEL_46;
    }
LABEL_88:
    v54 = [*(id *)(v6 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 68)];
    if (a2) {
      v55 = @"chargingStopAddedThroughSar";
    }
    else {
      v55 = @"charging_stop_added_through_sar";
    }
    [v4 setObject:v54 forKey:v55];

    if ((*(_WORD *)(a1 + 76) & 0x10) == 0) {
      goto LABEL_51;
    }
    goto LABEL_47;
  }
  v52 = [*(id *)(v6 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 69)];
  if (a2) {
    v53 = @"originalTripIncludedChargingStation";
  }
  else {
    v53 = @"original_trip_included_charging_station";
  }
  [v4 setObject:v52 forKey:v53];

  __int16 v30 = *(_WORD *)(a1 + 76);
  if (v30) {
    goto LABEL_88;
  }
LABEL_46:
  if ((v30 & 0x10) != 0)
  {
LABEL_47:
    v31 = [*(id *)(v6 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 72)];
    if (a2) {
      v32 = @"tripIncludedPreferredChargingStation";
    }
    else {
      v32 = @"trip_included_preferred_charging_station";
    }
    [v4 setObject:v31 forKey:v32];
  }
LABEL_51:
  if ([*(id *)(a1 + 48) count])
  {
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v34 = *(id *)(a1 + 48);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v73 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v61 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v60 + 1) + 8 * k);
          if (a2) {
            [v39 jsonRepresentation];
          }
          else {
          v40 = [v39 dictionaryRepresentation];
          }
          [v33 addObject:v40];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v60 objects:v73 count:16];
      }
      while (v36);
    }

    if (a2) {
      v41 = @"stopRemovedDetails";
    }
    else {
      v41 = @"stop_removed_details";
    }
    [v4 setObject:v33 forKey:v41];
  }
  if ([*(id *)(a1 + 32) count])
  {
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v43 = *(id *)(a1 + 32);
    uint64_t v44 = [v43 countByEnumeratingWithState:&v56 objects:v72 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v57;
      do
      {
        for (uint64_t m = 0; m != v45; ++m)
        {
          if (*(void *)v57 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v56 + 1) + 8 * m);
          if (a2) {
            [v48 jsonRepresentation];
          }
          else {
          v49 = objc_msgSend(v48, "dictionaryRepresentation", (void)v56);
          }
          objc_msgSend(v42, "addObject:", v49, (void)v56);
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v56 objects:v72 count:16];
      }
      while (v45);
    }

    if (a2) {
      v50 = @"realtimeDodgeball";
    }
    else {
      v50 = @"realtime_dodgeball";
    }
    objc_msgSend(v4, "setObject:forKey:", v42, v50, (void)v56);
  }
LABEL_81:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventEVTrip _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventEVTrip)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventEVTrip *)-[GEOLogMsgEventEVTrip _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        unint64_t v6 = @"outOfCharge";
      }
      else {
        unint64_t v6 = @"out_of_charge";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOutOfCharge:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"outOfRangeAlertDisplayed";
      }
      else {
        objc_super v8 = @"out_of_range_alert_displayed";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOutOfRangeAlertDisplayed:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"chargeLocationDetails";
      }
      else {
        v10 = @"charge_location_details";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      id v63 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v76 objects:v83 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v77 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v76 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [GEOChargeLocationDetails alloc];
                if (a3) {
                  uint64_t v19 = [(GEOChargeLocationDetails *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOChargeLocationDetails *)v18 initWithDictionary:v17];
                }
                v20 = (void *)v19;
                [a1 addChargeLocationDetails:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v76 objects:v83 count:16];
          }
          while (v14);
        }

        id v5 = v63;
      }

      if (a3) {
        id v21 = @"stopAddedDetails";
      }
      else {
        id v21 = @"stop_added_details";
      }
      uint64_t v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v82 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v73 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v72 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v29 = [GEOStopAddedDetails alloc];
                if (a3) {
                  uint64_t v30 = [(GEOStopAddedDetails *)v29 initWithJSON:v28];
                }
                else {
                  uint64_t v30 = [(GEOStopAddedDetails *)v29 initWithDictionary:v28];
                }
                v31 = (void *)v30;
                [a1 addStopAddedDetails:v30];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v72 objects:v82 count:16];
          }
          while (v25);
        }

        id v5 = v63;
      }

      v32 = [v5 objectForKeyedSubscript:@"metro"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = (void *)[v32 copy];
        [a1 setMetro:v33];
      }
      if (a3) {
        id v34 = @"originalTripIncludedChargingStation";
      }
      else {
        id v34 = @"original_trip_included_charging_station";
      }
      uint64_t v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOriginalTripIncludedChargingStation:", objc_msgSend(v35, "BOOLValue"));
      }

      if (a3) {
        uint64_t v36 = @"chargingStopAddedThroughSar";
      }
      else {
        uint64_t v36 = @"charging_stop_added_through_sar";
      }
      uint64_t v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setChargingStopAddedThroughSar:", objc_msgSend(v37, "BOOLValue"));
      }

      if (a3) {
        v38 = @"tripIncludedPreferredChargingStation";
      }
      else {
        v38 = @"trip_included_preferred_charging_station";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTripIncludedPreferredChargingStation:", objc_msgSend(v39, "BOOLValue"));
      }

      if (a3) {
        v40 = @"stopRemovedDetails";
      }
      else {
        v40 = @"stop_removed_details";
      }
      v41 = [v5 objectForKeyedSubscript:v40];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v42 = v41;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v68 objects:v81 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v69;
          do
          {
            for (uint64_t k = 0; k != v44; ++k)
            {
              if (*(void *)v69 != v45) {
                objc_enumerationMutation(v42);
              }
              uint64_t v47 = *(void *)(*((void *)&v68 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v48 = [GEODodgeballDetails alloc];
                if (a3) {
                  uint64_t v49 = [(GEODodgeballDetails *)v48 initWithJSON:v47];
                }
                else {
                  uint64_t v49 = [(GEODodgeballDetails *)v48 initWithDictionary:v47];
                }
                v50 = (void *)v49;
                [a1 addStopRemovedDetails:v49];
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v68 objects:v81 count:16];
          }
          while (v44);
        }

        id v5 = v63;
      }

      if (a3) {
        v51 = @"realtimeDodgeball";
      }
      else {
        v51 = @"realtime_dodgeball";
      }
      v52 = [v5 objectForKeyedSubscript:v51];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v53 = v52;
        uint64_t v54 = [v53 countByEnumeratingWithState:&v64 objects:v80 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v65;
          do
          {
            for (uint64_t m = 0; m != v55; ++m)
            {
              if (*(void *)v65 != v56) {
                objc_enumerationMutation(v53);
              }
              uint64_t v58 = *(void *)(*((void *)&v64 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v59 = [GEODodgeballDetails alloc];
                if (a3) {
                  uint64_t v60 = [(GEODodgeballDetails *)v59 initWithJSON:v58];
                }
                else {
                  uint64_t v60 = [(GEODodgeballDetails *)v59 initWithDictionary:v58];
                }
                long long v61 = (void *)v60;
                [a1 addRealtimeDodgeball:v60];
              }
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v64 objects:v80 count:16];
          }
          while (v55);
        }

        id v5 = v63;
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventEVTrip)initWithJSON:(id)a3
{
  return (GEOLogMsgEventEVTrip *)-[GEOLogMsgEventEVTrip _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_3060;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3061;
    }
    GEOLogMsgEventEVTripReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventEVTripCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventEVTripIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventEVTripReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x7E0) == 0))
  {
    uint64_t v24 = self->_reader;
    objc_sync_enter(v24);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v25 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v25];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v24);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventEVTrip *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v7 = self->_chargeLocationDetails;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v8);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v11 = self->_stopAddedDetails;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v12);
    }

    if (self->_metro) {
      PBDataWriterWriteStringField();
    }
    __int16 v15 = (__int16)self->_flags;
    if ((v15 & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 v15 = (__int16)self->_flags;
    }
    if (v15)
    {
      PBDataWriterWriteBOOLField();
      __int16 v15 = (__int16)self->_flags;
    }
    if ((v15 & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v16 = self->_stopRemovedDetails;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v16);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
      }
      while (v17);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v20 = self->_realtimeDodgeballs;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t m = 0; m != v21; ++m)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v20);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
      }
      while (v21);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v22 = (id *)a3;
  [(GEOLogMsgEventEVTrip *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v22 + 1, self->_reader);
  *((_DWORD *)v22 + 14) = self->_readerMarkPos;
  *((_DWORD *)v22 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v22 + 70) = self->_outOfCharge;
    *((_WORD *)v22 + 38) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *((unsigned char *)v22 + 71) = self->_outOfRangeAlertDisplayed;
    *((_WORD *)v22 + 38) |= 8u;
  }
  if ([(GEOLogMsgEventEVTrip *)self chargeLocationDetailsCount])
  {
    [v22 clearChargeLocationDetails];
    unint64_t v5 = [(GEOLogMsgEventEVTrip *)self chargeLocationDetailsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLogMsgEventEVTrip *)self chargeLocationDetailsAtIndex:i];
        [v22 addChargeLocationDetails:v8];
      }
    }
  }
  if ([(GEOLogMsgEventEVTrip *)self stopAddedDetailsCount])
  {
    [v22 clearStopAddedDetails];
    unint64_t v9 = [(GEOLogMsgEventEVTrip *)self stopAddedDetailsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOLogMsgEventEVTrip *)self stopAddedDetailsAtIndex:j];
        [v22 addStopAddedDetails:v12];
      }
    }
  }
  if (self->_metro) {
    objc_msgSend(v22, "setMetro:");
  }
  __int16 v13 = (__int16)self->_flags;
  if ((v13 & 2) == 0)
  {
    if ((v13 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_31:
    *((unsigned char *)v22 + 68) = self->_chargingStopAddedThroughSar;
    *((_WORD *)v22 + 38) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  *((unsigned char *)v22 + 69) = self->_originalTripIncludedChargingStation;
  *((_WORD *)v22 + 38) |= 2u;
  __int16 v13 = (__int16)self->_flags;
  if (v13) {
    goto LABEL_31;
  }
LABEL_17:
  if ((v13 & 0x10) != 0)
  {
LABEL_18:
    *((unsigned char *)v22 + 72) = self->_tripIncludedPreferredChargingStation;
    *((_WORD *)v22 + 38) |= 0x10u;
  }
LABEL_19:
  if ([(GEOLogMsgEventEVTrip *)self stopRemovedDetailsCount])
  {
    [v22 clearStopRemovedDetails];
    unint64_t v14 = [(GEOLogMsgEventEVTrip *)self stopRemovedDetailsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(GEOLogMsgEventEVTrip *)self stopRemovedDetailsAtIndex:k];
        [v22 addStopRemovedDetails:v17];
      }
    }
  }
  if ([(GEOLogMsgEventEVTrip *)self realtimeDodgeballsCount])
  {
    [v22 clearRealtimeDodgeballs];
    unint64_t v18 = [(GEOLogMsgEventEVTrip *)self realtimeDodgeballsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        uint64_t v21 = [(GEOLogMsgEventEVTrip *)self realtimeDodgeballAtIndex:m];
        [v22 addRealtimeDodgeball:v21];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventEVTripReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_41;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventEVTrip *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 70) = self->_outOfCharge;
    *(_WORD *)(v5 + 76) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 71) = self->_outOfRangeAlertDisplayed;
    *(_WORD *)(v5 + 76) |= 8u;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v10 = self->_chargeLocationDetails;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v10);
        }
        unint64_t v14 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addChargeLocationDetails:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v11);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v15 = self->_stopAddedDetails;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v15);
        }
        unint64_t v19 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addStopAddedDetails:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_metro copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v20;

  __int16 v22 = (__int16)self->_flags;
  if ((v22 & 2) == 0)
  {
    if ((v22 & 1) == 0) {
      goto LABEL_25;
    }
LABEL_43:
    *(unsigned char *)(v5 + 68) = self->_chargingStopAddedThroughSar;
    *(_WORD *)(v5 + 76) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  *(unsigned char *)(v5 + 69) = self->_originalTripIncludedChargingStation;
  *(_WORD *)(v5 + 76) |= 2u;
  __int16 v22 = (__int16)self->_flags;
  if (v22) {
    goto LABEL_43;
  }
LABEL_25:
  if ((v22 & 0x10) != 0)
  {
LABEL_26:
    *(unsigned char *)(v5 + 72) = self->_tripIncludedPreferredChargingStation;
    *(_WORD *)(v5 + 76) |= 0x10u;
  }
LABEL_27:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v23 = self->_stopRemovedDetails;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addStopRemovedDetails:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v24);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v8 = self->_realtimeDodgeballs;
  uint64_t v28 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v8);
        }
        long long v31 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * m), "copyWithZone:", a3, (void)v33);
        [(id)v5 addRealtimeDodgeball:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v28);
  }
LABEL_41:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  [(GEOLogMsgEventEVTrip *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_52;
    }
    if (self->_outOfCharge)
    {
      if (!*((unsigned char *)v4 + 70)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 70))
    {
      goto LABEL_52;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_52;
    }
    if (self->_outOfRangeAlertDisplayed)
    {
      if (!*((unsigned char *)v4 + 71)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 71))
    {
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  chargeLocationDetails = self->_chargeLocationDetails;
  if ((unint64_t)chargeLocationDetails | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](chargeLocationDetails, "isEqual:"))
  {
    goto LABEL_52;
  }
  stopAddedDetails = self->_stopAddedDetails;
  if ((unint64_t)stopAddedDetails | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](stopAddedDetails, "isEqual:")) {
      goto LABEL_52;
    }
  }
  metro = self->_metro;
  if ((unint64_t)metro | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](metro, "isEqual:")) {
      goto LABEL_52;
    }
  }
  __int16 v10 = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 38);
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0) {
      goto LABEL_52;
    }
    if (self->_originalTripIncludedChargingStation)
    {
      if (!*((unsigned char *)v4 + 69)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 69))
    {
      goto LABEL_52;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_52;
  }
  if (v10)
  {
    if ((v11 & 1) == 0) {
      goto LABEL_52;
    }
    if (self->_chargingStopAddedThroughSar)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_52;
    }
  }
  else if (v11)
  {
    goto LABEL_52;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) != 0)
    {
      if (self->_tripIncludedPreferredChargingStation)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_52;
        }
        goto LABEL_48;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_48;
      }
    }
LABEL_52:
    char v14 = 0;
    goto LABEL_53;
  }
  if ((v11 & 0x10) != 0) {
    goto LABEL_52;
  }
LABEL_48:
  stopRemovedDetails = self->_stopRemovedDetails;
  if ((unint64_t)stopRemovedDetails | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](stopRemovedDetails, "isEqual:"))
  {
    goto LABEL_52;
  }
  realtimeDodgeballs = self->_realtimeDodgeballs;
  if ((unint64_t)realtimeDodgeballs | *((void *)v4 + 4)) {
    char v14 = -[NSMutableArray isEqual:](realtimeDodgeballs, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_53:

  return v14;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventEVTrip *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_outOfCharge;
    if ((flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((flags & 8) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_outOfRangeAlertDisplayed;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  uint64_t v6 = [(NSMutableArray *)self->_chargeLocationDetails hash];
  uint64_t v7 = [(NSMutableArray *)self->_stopAddedDetails hash];
  NSUInteger v8 = [(NSString *)self->_metro hash];
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 2) == 0)
  {
    uint64_t v10 = 0;
    if (v9) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v11 = 0;
    if ((v9 & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = 2654435761 * self->_originalTripIncludedChargingStation;
  if ((v9 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v11 = 2654435761 * self->_chargingStopAddedThroughSar;
  if ((v9 & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v12 = 2654435761 * self->_tripIncludedPreferredChargingStation;
LABEL_13:
  NSUInteger v13 = v5 ^ v4 ^ v6 ^ v7 ^ v8;
  uint64_t v14 = v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_stopRemovedDetails hash];
  return v13 ^ v14 ^ [(NSMutableArray *)self->_realtimeDodgeballs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 4) != 0)
  {
    self->_outOfCharge = *((unsigned char *)v4 + 70);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v5 = *((_WORD *)v4 + 38);
  }
  if ((v5 & 8) != 0)
  {
    self->_outOfRangeAlertDisplayed = *((unsigned char *)v4 + 71);
    *(_WORD *)&self->_flags |= 8u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        [(GEOLogMsgEventEVTrip *)self addChargeLocationDetails:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v8);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = *((id *)v4 + 5);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEOLogMsgEventEVTrip *)self addStopAddedDetails:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 3)) {
    -[GEOLogMsgEventEVTrip setMetro:](self, "setMetro:");
  }
  __int16 v16 = *((_WORD *)v4 + 38);
  if ((v16 & 2) != 0)
  {
    self->_originalTripIncludedChargingStation = *((unsigned char *)v4 + 69);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v16 = *((_WORD *)v4 + 38);
    if ((v16 & 1) == 0)
    {
LABEL_23:
      if ((v16 & 0x10) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v16 & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_chargingStopAddedThroughSar = *((unsigned char *)v4 + 68);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v4 + 38) & 0x10) != 0)
  {
LABEL_24:
    self->_tripIncludedPreferredChargingStation = *((unsigned char *)v4 + 72);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_25:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v4 + 6);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        [(GEOLogMsgEventEVTrip *)self addStopRemovedDetails:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v4 + 4);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[GEOLogMsgEventEVTrip addRealtimeDodgeball:](self, "addRealtimeDodgeball:", *(void *)(*((void *)&v27 + 1) + 8 * m), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopRemovedDetails, 0);
  objc_storeStrong((id *)&self->_stopAddedDetails, 0);
  objc_storeStrong((id *)&self->_realtimeDodgeballs, 0);
  objc_storeStrong((id *)&self->_metro, 0);
  objc_storeStrong((id *)&self->_chargeLocationDetails, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end