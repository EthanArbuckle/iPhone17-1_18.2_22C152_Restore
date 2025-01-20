@interface GEOLogMsgEventMapsWidgetsInteractionSession
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDuration;
- (BOOL)hasEndState;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocalDayOfWeek;
- (BOOL)hasLocalHour;
- (BOOL)hasLockedMode;
- (BOOL)hasMapsDestinationsWidget;
- (BOOL)hasMapsNearbyWidget;
- (BOOL)hasMapsTransitWidget;
- (BOOL)hasMapsWidgetType;
- (BOOL)isEqual:(id)a3;
- (BOOL)lockedMode;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventMapsWidgetsInteractionSession)init;
- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithData:(id)a3;
- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithDictionary:(id)a3;
- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithJSON:(id)a3;
- (GEOMapsDestinationsWidget)mapsDestinationsWidget;
- (GEOMapsNearbyWidget)mapsNearbyWidget;
- (GEOMapsTransitWidget)mapsTransitWidget;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endStateAsString:(int)a3;
- (id)jsonRepresentation;
- (id)mapsWidgetTypeAsString:(int)a3;
- (int)StringAsEndState:(id)a3;
- (int)StringAsMapsWidgetType:(id)a3;
- (int)duration;
- (int)endState;
- (int)localDayOfWeek;
- (int)localHour;
- (int)mapsWidgetType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMapsDestinationsWidget;
- (void)_readMapsNearbyWidget;
- (void)_readMapsTransitWidget;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDuration:(int)a3;
- (void)setEndState:(int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEndState:(BOOL)a3;
- (void)setHasLocalDayOfWeek:(BOOL)a3;
- (void)setHasLocalHour:(BOOL)a3;
- (void)setHasLockedMode:(BOOL)a3;
- (void)setHasMapsWidgetType:(BOOL)a3;
- (void)setLocalDayOfWeek:(int)a3;
- (void)setLocalHour:(int)a3;
- (void)setLockedMode:(BOOL)a3;
- (void)setMapsDestinationsWidget:(id)a3;
- (void)setMapsNearbyWidget:(id)a3;
- (void)setMapsTransitWidget:(id)a3;
- (void)setMapsWidgetType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventMapsWidgetsInteractionSession

- (GEOLogMsgEventMapsWidgetsInteractionSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventMapsWidgetsInteractionSession;
  v2 = [(GEOLogMsgEventMapsWidgetsInteractionSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventMapsWidgetsInteractionSession;
  v3 = [(GEOLogMsgEventMapsWidgetsInteractionSession *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)mapsWidgetType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_mapsWidgetType;
  }
  else {
    return 0;
  }
}

- (void)setMapsWidgetType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  self->_mapsWidgetType = a3;
}

- (void)setHasMapsWidgetType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 528;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasMapsWidgetType
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)mapsWidgetTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = *(&off_1E53DB340 + a3);
  }

  return v3;
}

- (int)StringAsMapsWidgetType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAPS_WIDGET_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_TYPE_DESTINATIONS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_TYPE_TRANSIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_TYPE_NEARBY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)endState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_endState;
  }
  else {
    return 0;
  }
}

- (void)setEndState:(int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_endState = a3;
}

- (void)setHasEndState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasEndState
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)endStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = *(&off_1E53DB360 + a3);
  }

  return v3;
}

- (int)StringAsEndState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MPSES_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MPSES_INTERACTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MPSES_ABANDONED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readMapsDestinationsWidget
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapsWidgetsInteractionSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsDestinationsWidget_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsDestinationsWidget
{
  return self->_mapsDestinationsWidget != 0;
}

- (GEOMapsDestinationsWidget)mapsDestinationsWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsDestinationsWidget]((uint64_t)self);
  mapsDestinationsWidget = self->_mapsDestinationsWidget;

  return mapsDestinationsWidget;
}

- (void)setMapsDestinationsWidget:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_mapsDestinationsWidget, a3);
}

- (void)_readMapsTransitWidget
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 76) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapsWidgetsInteractionSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsTransitWidget_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsTransitWidget
{
  return self->_mapsTransitWidget != 0;
}

- (GEOMapsTransitWidget)mapsTransitWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsTransitWidget]((uint64_t)self);
  mapsTransitWidget = self->_mapsTransitWidget;

  return mapsTransitWidget;
}

- (void)setMapsTransitWidget:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_mapsTransitWidget, a3);
}

- (void)_readMapsNearbyWidget
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapsWidgetsInteractionSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsNearbyWidget_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsNearbyWidget
{
  return self->_mapsNearbyWidget != 0;
}

- (GEOMapsNearbyWidget)mapsNearbyWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsNearbyWidget]((uint64_t)self);
  mapsNearbyWidget = self->_mapsNearbyWidget;

  return mapsNearbyWidget;
}

- (void)setMapsNearbyWidget:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_mapsNearbyWidget, a3);
}

- (BOOL)lockedMode
{
  return self->_lockedMode;
}

- (void)setLockedMode:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  self->_lockedMode = a3;
}

- (void)setHasLockedMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 544;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasLockedMode
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (int)localHour
{
  return self->_localHour;
}

- (void)setLocalHour:(int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_localHour = a3;
}

- (void)setHasLocalHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 520;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLocalHour
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)localDayOfWeek
{
  return self->_localDayOfWeek;
}

- (void)setLocalDayOfWeek:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_localDayOfWeek = a3;
}

- (void)setHasLocalDayOfWeek:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLocalDayOfWeek
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventMapsWidgetsInteractionSession;
  int v4 = [(GEOLogMsgEventMapsWidgetsInteractionSession *)&v8 description];
  v5 = [(GEOLogMsgEventMapsWidgetsInteractionSession *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMapsWidgetsInteractionSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_51;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 76);
  if ((v5 & 0x10) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 68);
    if (v6 >= 4)
    {
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
    }
    else
    {
      objc_super v7 = *(&off_1E53DB340 + v6);
    }
    if (a2) {
      objc_super v8 = @"mapsWidgetType";
    }
    else {
      objc_super v8 = @"maps_widget_type";
    }
    [v4 setObject:v7 forKey:v8];

    __int16 v5 = *(_WORD *)(a1 + 76);
  }
  if ((v5 & 2) != 0)
  {
    uint64_t v9 = *(int *)(a1 + 56);
    if (v9 >= 3)
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
    }
    else
    {
      v10 = *(&off_1E53DB360 + v9);
    }
    if (a2) {
      v11 = @"endState";
    }
    else {
      v11 = @"end_state";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v12 = [(id)a1 mapsDestinationsWidget];
  v13 = v12;
  if (v12)
  {
    if (a2)
    {
      v14 = [v12 jsonRepresentation];
      v15 = @"mapsDestinationsWidget";
    }
    else
    {
      v14 = [v12 dictionaryRepresentation];
      v15 = @"maps_destinations_widget";
    }
    [v4 setObject:v14 forKey:v15];
  }
  v16 = [(id)a1 mapsTransitWidget];
  v17 = v16;
  if (v16)
  {
    if (a2)
    {
      v18 = [v16 jsonRepresentation];
      v19 = @"mapsTransitWidget";
    }
    else
    {
      v18 = [v16 dictionaryRepresentation];
      v19 = @"maps_transit_widget";
    }
    [v4 setObject:v18 forKey:v19];
  }
  v20 = [(id)a1 mapsNearbyWidget];
  v21 = v20;
  if (v20)
  {
    if (a2)
    {
      v22 = [v20 jsonRepresentation];
      v23 = @"mapsNearbyWidget";
    }
    else
    {
      v22 = [v20 dictionaryRepresentation];
      v23 = @"maps_nearby_widget";
    }
    [v4 setObject:v22 forKey:v23];
  }
  __int16 v24 = *(_WORD *)(a1 + 76);
  if ((v24 & 0x20) != 0)
  {
    v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
    if (a2) {
      v26 = @"lockedMode";
    }
    else {
      v26 = @"locked_mode";
    }
    [v4 setObject:v25 forKey:v26];

    __int16 v24 = *(_WORD *)(a1 + 76);
    if ((v24 & 8) == 0)
    {
LABEL_35:
      if ((v24 & 4) == 0) {
        goto LABEL_36;
      }
LABEL_46:
      v29 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
      if (a2) {
        v30 = @"localDayOfWeek";
      }
      else {
        v30 = @"local_day_of_week";
      }
      [v4 setObject:v29 forKey:v30];

      if ((*(_WORD *)(a1 + 76) & 1) == 0) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else if ((v24 & 8) == 0)
  {
    goto LABEL_35;
  }
  v27 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  if (a2) {
    v28 = @"localHour";
  }
  else {
    v28 = @"local_hour";
  }
  [v4 setObject:v27 forKey:v28];

  __int16 v24 = *(_WORD *)(a1 + 76);
  if ((v24 & 4) != 0) {
    goto LABEL_46;
  }
LABEL_36:
  if (v24)
  {
LABEL_50:
    v31 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
    [v4 setObject:v31 forKey:@"duration"];
  }
LABEL_51:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventMapsWidgetsInteractionSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMapsWidgetsInteractionSession *)-[GEOLogMsgEventMapsWidgetsInteractionSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_77;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_77;
  }
  if (a3) {
    uint64_t v6 = @"mapsWidgetType";
  }
  else {
    uint64_t v6 = @"maps_widget_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"MAPS_WIDGET_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"MAPS_WIDGET_TYPE_DESTINATIONS"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"MAPS_WIDGET_TYPE_TRANSIT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"MAPS_WIDGET_TYPE_NEARBY"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setMapsWidgetType:v9];
LABEL_20:

  if (a3) {
    v10 = @"endState";
  }
  else {
    v10 = @"end_state";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"MPSES_UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"MPSES_INTERACTED"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"MPSES_ABANDONED"])
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_34:
    [a1 setEndState:v13];
  }

  if (a3) {
    v14 = @"mapsDestinationsWidget";
  }
  else {
    v14 = @"maps_destinations_widget";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEOMapsDestinationsWidget alloc];
    if (a3) {
      uint64_t v17 = [(GEOMapsDestinationsWidget *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEOMapsDestinationsWidget *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setMapsDestinationsWidget:v17];
  }
  if (a3) {
    v19 = @"mapsTransitWidget";
  }
  else {
    v19 = @"maps_transit_widget";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [GEOMapsTransitWidget alloc];
    if (a3) {
      uint64_t v22 = [(GEOMapsTransitWidget *)v21 initWithJSON:v20];
    }
    else {
      uint64_t v22 = [(GEOMapsTransitWidget *)v21 initWithDictionary:v20];
    }
    v23 = (void *)v22;
    [a1 setMapsTransitWidget:v22];
  }
  if (a3) {
    __int16 v24 = @"mapsNearbyWidget";
  }
  else {
    __int16 v24 = @"maps_nearby_widget";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [GEOMapsNearbyWidget alloc];
    if (a3) {
      uint64_t v27 = [(GEOMapsNearbyWidget *)v26 initWithJSON:v25];
    }
    else {
      uint64_t v27 = [(GEOMapsNearbyWidget *)v26 initWithDictionary:v25];
    }
    v28 = (void *)v27;
    [a1 setMapsNearbyWidget:v27];
  }
  if (a3) {
    v29 = @"lockedMode";
  }
  else {
    v29 = @"locked_mode";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLockedMode:", objc_msgSend(v30, "BOOLValue"));
  }

  if (a3) {
    v31 = @"localHour";
  }
  else {
    v31 = @"local_hour";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLocalHour:", objc_msgSend(v32, "intValue"));
  }

  if (a3) {
    v33 = @"localDayOfWeek";
  }
  else {
    v33 = @"local_day_of_week";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLocalDayOfWeek:", objc_msgSend(v34, "intValue"));
  }

  v35 = [v5 objectForKeyedSubscript:@"duration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDuration:", objc_msgSend(v35, "intValue"));
  }

LABEL_77:
  return a1;
}

- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMapsWidgetsInteractionSession *)-[GEOLogMsgEventMapsWidgetsInteractionSession _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_5;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_5;
    }
    GEOLogMsgEventMapsWidgetsInteractionSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOMapsDestinationsWidget *)self->_mapsDestinationsWidget readAll:1];
    [(GEOMapsTransitWidget *)self->_mapsTransitWidget readAll:1];
    [(GEOMapsNearbyWidget *)self->_mapsNearbyWidget readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMapsWidgetsInteractionSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMapsWidgetsInteractionSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3C0) == 0)
    {
      objc_super v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventMapsWidgetsInteractionSession *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_mapsDestinationsWidget) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mapsTransitWidget) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mapsNearbyWidget) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 8) == 0)
    {
LABEL_15:
      if ((v6 & 4) == 0) {
        goto LABEL_16;
      }
LABEL_20:
      PBDataWriterWriteInt32Field();
      if ((*(_WORD *)&self->_flags & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 4) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  if (v6) {
LABEL_21:
  }
    PBDataWriterWriteInt32Field();
LABEL_23:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsNearbyWidget]((uint64_t)self);
  mapsNearbyWidget = self->_mapsNearbyWidget;

  return [(GEOMapsNearbyWidget *)mapsNearbyWidget hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOLogMsgEventMapsWidgetsInteractionSession *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 10) = self->_readerMarkPos;
  *((_DWORD *)v7 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v7;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v7 + 17) = self->_mapsWidgetType;
    *((_WORD *)v7 + 38) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v7 + 14) = self->_endState;
    *((_WORD *)v7 + 38) |= 2u;
  }
  if (self->_mapsDestinationsWidget)
  {
    objc_msgSend(v7, "setMapsDestinationsWidget:");
    int v4 = v7;
  }
  if (self->_mapsTransitWidget)
  {
    objc_msgSend(v7, "setMapsTransitWidget:");
    int v4 = v7;
  }
  if (self->_mapsNearbyWidget)
  {
    objc_msgSend(v7, "setMapsNearbyWidget:");
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x20) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_lockedMode;
    *((_WORD *)v4 + 38) |= 0x20u;
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 16) = self->_localHour;
  *((_WORD *)v4 + 38) |= 8u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 4) == 0)
  {
LABEL_14:
    if ((v6 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_21:
  *((_DWORD *)v4 + 15) = self->_localDayOfWeek;
  *((_WORD *)v4 + 38) |= 4u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_15:
    *((_DWORD *)v4 + 13) = self->_duration;
    *((_WORD *)v4 + 38) |= 1u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventMapsWidgetsInteractionSession *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_mapsWidgetType;
      *(_WORD *)(v5 + 76) |= 0x10u;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 56) = self->_endState;
      *(_WORD *)(v5 + 76) |= 2u;
    }
    id v10 = [(GEOMapsDestinationsWidget *)self->_mapsDestinationsWidget copyWithZone:a3];
    v11 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v10;

    id v12 = [(GEOMapsTransitWidget *)self->_mapsTransitWidget copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    id v14 = [(GEOMapsNearbyWidget *)self->_mapsNearbyWidget copyWithZone:a3];
    v15 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v14;

    __int16 v16 = (__int16)self->_flags;
    if ((v16 & 0x20) != 0)
    {
      *(unsigned char *)(v5 + 72) = self->_lockedMode;
      *(_WORD *)(v5 + 76) |= 0x20u;
      __int16 v16 = (__int16)self->_flags;
      if ((v16 & 8) == 0)
      {
LABEL_11:
        if ((v16 & 4) == 0) {
          goto LABEL_12;
        }
        goto LABEL_17;
      }
    }
    else if ((v16 & 8) == 0)
    {
      goto LABEL_11;
    }
    *(_DWORD *)(v5 + 64) = self->_localHour;
    *(_WORD *)(v5 + 76) |= 8u;
    __int16 v16 = (__int16)self->_flags;
    if ((v16 & 4) == 0)
    {
LABEL_12:
      if ((v16 & 1) == 0) {
        return (id)v5;
      }
LABEL_13:
      *(_DWORD *)(v5 + 52) = self->_duration;
      *(_WORD *)(v5 + 76) |= 1u;
      return (id)v5;
    }
LABEL_17:
    *(_DWORD *)(v5 + 60) = self->_localDayOfWeek;
    *(_WORD *)(v5 + 76) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_13;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventMapsWidgetsInteractionSessionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  [(GEOLogMsgEventMapsWidgetsInteractionSession *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mapsWidgetType != *((_DWORD *)v4 + 17)) {
      goto LABEL_40;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_endState != *((_DWORD *)v4 + 14)) {
      goto LABEL_40;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_40;
  }
  mapsDestinationsWidget = self->_mapsDestinationsWidget;
  if ((unint64_t)mapsDestinationsWidget | *((void *)v4 + 2)
    && !-[GEOMapsDestinationsWidget isEqual:](mapsDestinationsWidget, "isEqual:"))
  {
    goto LABEL_40;
  }
  mapsTransitWidget = self->_mapsTransitWidget;
  if ((unint64_t)mapsTransitWidget | *((void *)v4 + 4))
  {
    if (!-[GEOMapsTransitWidget isEqual:](mapsTransitWidget, "isEqual:")) {
      goto LABEL_40;
    }
  }
  mapsNearbyWidget = self->_mapsNearbyWidget;
  if ((unint64_t)mapsNearbyWidget | *((void *)v4 + 3))
  {
    if (!-[GEOMapsNearbyWidget isEqual:](mapsNearbyWidget, "isEqual:")) {
      goto LABEL_40;
    }
  }
  __int16 v10 = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 38);
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) != 0)
    {
      if (self->_lockedMode)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_40;
        }
        goto LABEL_26;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_26;
      }
    }
LABEL_40:
    BOOL v12 = 0;
    goto LABEL_41;
  }
  if ((v11 & 0x20) != 0) {
    goto LABEL_40;
  }
LABEL_26:
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_localHour != *((_DWORD *)v4 + 16)) {
      goto LABEL_40;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_localDayOfWeek != *((_DWORD *)v4 + 15)) {
      goto LABEL_40;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_40;
  }
  BOOL v12 = (v11 & 1) == 0;
  if (v10)
  {
    if ((v11 & 1) == 0 || self->_duration != *((_DWORD *)v4 + 13)) {
      goto LABEL_40;
    }
    BOOL v12 = 1;
  }
LABEL_41:

  return v12;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventMapsWidgetsInteractionSession *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    uint64_t v4 = 2654435761 * self->_mapsWidgetType;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_endState;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = [(GEOMapsDestinationsWidget *)self->_mapsDestinationsWidget hash];
  unint64_t v7 = [(GEOMapsTransitWidget *)self->_mapsTransitWidget hash];
  unint64_t v8 = [(GEOMapsNearbyWidget *)self->_mapsNearbyWidget hash];
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_lockedMode;
    if ((v9 & 8) != 0)
    {
LABEL_8:
      uint64_t v11 = 2654435761 * self->_localHour;
      if ((v9 & 4) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v12 = 0;
      if (v9) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v13 = 0;
      return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((v9 & 8) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v11 = 0;
  if ((v9 & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v12 = 2654435761 * self->_localDayOfWeek;
  if ((v9 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v13 = 2654435761 * self->_duration;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v13 = (int *)a3;
  [v13 readAll:0];
  uint64_t v4 = v13;
  __int16 v5 = *((_WORD *)v13 + 38);
  if ((v5 & 0x10) != 0)
  {
    self->_mapsWidgetType = v13[17];
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v5 = *((_WORD *)v13 + 38);
  }
  if ((v5 & 2) != 0)
  {
    self->_endState = v13[14];
    *(_WORD *)&self->_flags |= 2u;
  }
  mapsDestinationsWidget = self->_mapsDestinationsWidget;
  uint64_t v7 = *((void *)v13 + 2);
  if (mapsDestinationsWidget)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOMapsDestinationsWidget mergeFrom:](mapsDestinationsWidget, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOLogMsgEventMapsWidgetsInteractionSession setMapsDestinationsWidget:](self, "setMapsDestinationsWidget:");
  }
  uint64_t v4 = v13;
LABEL_11:
  mapsTransitWidget = self->_mapsTransitWidget;
  uint64_t v9 = *((void *)v4 + 4);
  if (mapsTransitWidget)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[GEOMapsTransitWidget mergeFrom:](mapsTransitWidget, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[GEOLogMsgEventMapsWidgetsInteractionSession setMapsTransitWidget:](self, "setMapsTransitWidget:");
  }
  uint64_t v4 = v13;
LABEL_17:
  mapsNearbyWidget = self->_mapsNearbyWidget;
  uint64_t v11 = *((void *)v4 + 3);
  if (mapsNearbyWidget)
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOMapsNearbyWidget mergeFrom:](mapsNearbyWidget, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOLogMsgEventMapsWidgetsInteractionSession setMapsNearbyWidget:](self, "setMapsNearbyWidget:");
  }
  uint64_t v4 = v13;
LABEL_23:
  __int16 v12 = *((_WORD *)v4 + 38);
  if ((v12 & 0x20) != 0)
  {
    self->_lockedMode = *((unsigned char *)v4 + 72);
    *(_WORD *)&self->_flags |= 0x20u;
    __int16 v12 = *((_WORD *)v4 + 38);
    if ((v12 & 8) == 0)
    {
LABEL_25:
      if ((v12 & 4) == 0) {
        goto LABEL_26;
      }
      goto LABEL_33;
    }
  }
  else if ((v12 & 8) == 0)
  {
    goto LABEL_25;
  }
  self->_localHour = v4[16];
  *(_WORD *)&self->_flags |= 8u;
  __int16 v12 = *((_WORD *)v4 + 38);
  if ((v12 & 4) == 0)
  {
LABEL_26:
    if ((v12 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_33:
  self->_localDayOfWeek = v4[15];
  *(_WORD *)&self->_flags |= 4u;
  if (v4[19])
  {
LABEL_27:
    self->_duration = v4[13];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_28:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsTransitWidget, 0);
  objc_storeStrong((id *)&self->_mapsNearbyWidget, 0);
  objc_storeStrong((id *)&self->_mapsDestinationsWidget, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end