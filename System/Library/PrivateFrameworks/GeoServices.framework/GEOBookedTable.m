@interface GEOBookedTable
+ (BOOL)isValid:(id)a3;
- (BOOL)bookedUsingMaps;
- (BOOL)called;
- (BOOL)cancelled;
- (BOOL)hasAppId;
- (BOOL)hasBookedUsingMaps;
- (BOOL)hasCalled;
- (BOOL)hasCancelled;
- (BOOL)hasIsAsync;
- (BOOL)hasMuid;
- (BOOL)hasRouted;
- (BOOL)hasShared;
- (BOOL)hasTappedCancelReservation;
- (BOOL)hasTappedChangeReservation;
- (BOOL)hasTappedProactiveTrayItem;
- (BOOL)hasViewedDetailsFromPlacecard;
- (BOOL)hasViewedInPlacecard;
- (BOOL)hasViewedInProactiveTray;
- (BOOL)isAsync;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)routed;
- (BOOL)shared;
- (BOOL)tappedCancelReservation;
- (BOOL)tappedChangeReservation;
- (BOOL)tappedProactiveTrayItem;
- (BOOL)viewedDetailsFromPlacecard;
- (BOOL)viewedInPlacecard;
- (BOOL)viewedInProactiveTray;
- (GEOBookedTable)initWithDictionary:(id)a3;
- (GEOBookedTable)initWithJSON:(id)a3;
- (NSString)appId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppId:(id)a3;
- (void)setBookedUsingMaps:(BOOL)a3;
- (void)setCalled:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setHasBookedUsingMaps:(BOOL)a3;
- (void)setHasCalled:(BOOL)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasIsAsync:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasRouted:(BOOL)a3;
- (void)setHasShared:(BOOL)a3;
- (void)setHasTappedCancelReservation:(BOOL)a3;
- (void)setHasTappedChangeReservation:(BOOL)a3;
- (void)setHasTappedProactiveTrayItem:(BOOL)a3;
- (void)setHasViewedDetailsFromPlacecard:(BOOL)a3;
- (void)setHasViewedInPlacecard:(BOOL)a3;
- (void)setHasViewedInProactiveTray:(BOOL)a3;
- (void)setIsAsync:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setRouted:(BOOL)a3;
- (void)setShared:(BOOL)a3;
- (void)setTappedCancelReservation:(BOOL)a3;
- (void)setTappedChangeReservation:(BOOL)a3;
- (void)setTappedProactiveTrayItem:(BOOL)a3;
- (void)setViewedDetailsFromPlacecard:(BOOL)a3;
- (void)setViewedInPlacecard:(BOOL)a3;
- (void)setViewedInProactiveTray:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOBookedTable

- (BOOL)bookedUsingMaps
{
  return self->_bookedUsingMaps;
}

- (void)setBookedUsingMaps:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_bookedUsingMaps = a3;
}

- (void)setHasBookedUsingMaps:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
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
  *(_WORD *)&self->_flags |= 8u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasCancelled
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)viewedInProactiveTray
{
  return self->_viewedInProactiveTray;
}

- (void)setViewedInProactiveTray:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_viewedInProactiveTray = a3;
}

- (void)setHasViewedInProactiveTray:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasViewedInProactiveTray
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (BOOL)tappedProactiveTrayItem
{
  return self->_tappedProactiveTrayItem;
}

- (void)setTappedProactiveTrayItem:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_tappedProactiveTrayItem = a3;
}

- (void)setHasTappedProactiveTrayItem:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasTappedProactiveTrayItem
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (BOOL)viewedInPlacecard
{
  return self->_viewedInPlacecard;
}

- (void)setViewedInPlacecard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_viewedInPlacecard = a3;
}

- (void)setHasViewedInPlacecard:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasViewedInPlacecard
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (BOOL)viewedDetailsFromPlacecard
{
  return self->_viewedDetailsFromPlacecard;
}

- (void)setViewedDetailsFromPlacecard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_viewedDetailsFromPlacecard = a3;
}

- (void)setHasViewedDetailsFromPlacecard:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasViewedDetailsFromPlacecard
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (BOOL)isAsync
{
  return self->_isAsync;
}

- (void)setIsAsync:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_isAsync = a3;
}

- (void)setHasIsAsync:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasIsAsync
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)called
{
  return self->_called;
}

- (void)setCalled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_called = a3;
}

- (void)setHasCalled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasCalled
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)routed
{
  return self->_routed;
}

- (void)setRouted:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_routed = a3;
}

- (void)setHasRouted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRouted
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)tappedChangeReservation
{
  return self->_tappedChangeReservation;
}

- (void)setTappedChangeReservation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_tappedChangeReservation = a3;
}

- (void)setHasTappedChangeReservation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasTappedChangeReservation
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (BOOL)tappedCancelReservation
{
  return self->_tappedCancelReservation;
}

- (void)setTappedCancelReservation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_tappedCancelReservation = a3;
}

- (void)setHasTappedCancelReservation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasTappedCancelReservation
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_shared = a3;
}

- (void)setHasShared:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasShared
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBookedTable;
  v4 = [(GEOBookedTable *)&v8 description];
  v5 = [(GEOBookedTable *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBookedTable _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_59;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 36);
  if ((v5 & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
    if (a2) {
      v7 = @"bookedUsingMaps";
    }
    else {
      v7 = @"booked_using_maps";
    }
    [v4 setObject:v6 forKey:v7];

    __int16 v5 = *(_WORD *)(a1 + 36);
  }
  if ((v5 & 8) != 0)
  {
    v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 26)];
    [v4 setObject:v13 forKey:@"cancelled"];

    __int16 v5 = *(_WORD *)(a1 + 36);
    if ((v5 & 0x1000) == 0)
    {
LABEL_9:
      if ((v5 & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x1000) == 0)
  {
    goto LABEL_9;
  }
  v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 35)];
  if (a2) {
    v15 = @"viewedInProactiveTray";
  }
  else {
    v15 = @"viewed_in_proactive_tray";
  }
  [v4 setObject:v14 forKey:v15];

  __int16 v5 = *(_WORD *)(a1 + 36);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_34:
  v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  if (a2) {
    v17 = @"tappedProactiveTrayItem";
  }
  else {
    v17 = @"tapped_proactive_tray_item";
  }
  [v4 setObject:v16 forKey:v17];

  __int16 v5 = *(_WORD *)(a1 + 36);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_38:
  v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 34)];
  if (a2) {
    v19 = @"viewedInPlacecard";
  }
  else {
    v19 = @"viewed_in_placecard";
  }
  [v4 setObject:v18 forKey:v19];

  __int16 v5 = *(_WORD *)(a1 + 36);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
LABEL_42:
  v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 33)];
  if (a2) {
    v21 = @"viewedDetailsFromPlacecard";
  }
  else {
    v21 = @"viewed_details_from_placecard";
  }
  [v4 setObject:v20 forKey:v21];

  if ((*(_WORD *)(a1 + 36) & 0x10) != 0)
  {
LABEL_13:
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 27)];
    if (a2) {
      v9 = @"isAsync";
    }
    else {
      v9 = @"is_async";
    }
    [v4 setObject:v8 forKey:v9];
  }
LABEL_17:
  v10 = [(id)a1 appId];
  if (v10)
  {
    if (a2) {
      v11 = @"appId";
    }
    else {
      v11 = @"app_id";
    }
    [v4 setObject:v10 forKey:v11];
  }

  __int16 v12 = *(_WORD *)(a1 + 36);
  if (v12)
  {
    v22 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    [v4 setObject:v22 forKey:@"muid"];

    __int16 v12 = *(_WORD *)(a1 + 36);
    if ((v12 & 4) == 0)
    {
LABEL_24:
      if ((v12 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_49;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_24;
  }
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
  [v4 setObject:v23 forKey:@"called"];

  __int16 v12 = *(_WORD *)(a1 + 36);
  if ((v12 & 0x20) == 0)
  {
LABEL_25:
    if ((v12 & 0x100) == 0) {
      goto LABEL_26;
    }
    goto LABEL_50;
  }
LABEL_49:
  v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
  [v4 setObject:v24 forKey:@"routed"];

  __int16 v12 = *(_WORD *)(a1 + 36);
  if ((v12 & 0x100) == 0)
  {
LABEL_26:
    if ((v12 & 0x80) == 0) {
      goto LABEL_27;
    }
LABEL_54:
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 30)];
    if (a2) {
      v28 = @"tappedCancelReservation";
    }
    else {
      v28 = @"tapped_cancel_reservation";
    }
    [v4 setObject:v27 forKey:v28];

    if ((*(_WORD *)(a1 + 36) & 0x40) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_50:
  v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 31)];
  if (a2) {
    v26 = @"tappedChangeReservation";
  }
  else {
    v26 = @"tapped_change_reservation";
  }
  [v4 setObject:v25 forKey:v26];

  __int16 v12 = *(_WORD *)(a1 + 36);
  if ((v12 & 0x80) != 0) {
    goto LABEL_54;
  }
LABEL_27:
  if ((v12 & 0x40) != 0)
  {
LABEL_58:
    v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 29)];
    [v4 setObject:v29 forKey:@"shared"];
  }
LABEL_59:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOBookedTable _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOBookedTable)initWithDictionary:(id)a3
{
  return (GEOBookedTable *)-[GEOBookedTable _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"bookedUsingMaps";
      }
      else {
        v6 = @"booked_using_maps";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
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
        v9 = @"viewedInProactiveTray";
      }
      else {
        v9 = @"viewed_in_proactive_tray";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setViewedInProactiveTray:", objc_msgSend(v10, "BOOLValue"));
      }

      if (a3) {
        v11 = @"tappedProactiveTrayItem";
      }
      else {
        v11 = @"tapped_proactive_tray_item";
      }
      __int16 v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTappedProactiveTrayItem:", objc_msgSend(v12, "BOOLValue"));
      }

      if (a3) {
        v13 = @"viewedInPlacecard";
      }
      else {
        v13 = @"viewed_in_placecard";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setViewedInPlacecard:", objc_msgSend(v14, "BOOLValue"));
      }

      if (a3) {
        v15 = @"viewedDetailsFromPlacecard";
      }
      else {
        v15 = @"viewed_details_from_placecard";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setViewedDetailsFromPlacecard:", objc_msgSend(v16, "BOOLValue"));
      }

      if (a3) {
        v17 = @"isAsync";
      }
      else {
        v17 = @"is_async";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsAsync:", objc_msgSend(v18, "BOOLValue"));
      }

      if (a3) {
        v19 = @"appId";
      }
      else {
        v19 = @"app_id";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setAppId:v21];
      }
      v22 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v22, "unsignedLongLongValue"));
      }

      v23 = [v5 objectForKeyedSubscript:@"called"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCalled:", objc_msgSend(v23, "BOOLValue"));
      }

      v24 = [v5 objectForKeyedSubscript:@"routed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRouted:", objc_msgSend(v24, "BOOLValue"));
      }

      if (a3) {
        v25 = @"tappedChangeReservation";
      }
      else {
        v25 = @"tapped_change_reservation";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTappedChangeReservation:", objc_msgSend(v26, "BOOLValue"));
      }

      if (a3) {
        v27 = @"tappedCancelReservation";
      }
      else {
        v27 = @"tapped_cancel_reservation";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTappedCancelReservation:", objc_msgSend(v28, "BOOLValue"));
      }

      v29 = [v5 objectForKeyedSubscript:@"shared"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShared:", objc_msgSend(v29, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOBookedTable)initWithJSON:(id)a3
{
  return (GEOBookedTable *)-[GEOBookedTable _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOBookedTableIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOBookedTableReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_4:
    if ((flags & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_5:
    if ((flags & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_appId) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_flags;
  if (v5)
  {
    PBDataWriterWriteUint64Field();
    __int16 v5 = (__int16)self->_flags;
    if ((v5 & 4) == 0)
    {
LABEL_13:
      if ((v5 & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_flags;
  if ((v5 & 0x20) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_flags;
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_flags;
  if ((v5 & 0x80) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 0x40) != 0) {
LABEL_17:
  }
    PBDataWriterWriteBOOLField();
LABEL_18:
}

- (void)copyTo:(id)a3
{
  v7 = a3;
  [(GEOBookedTable *)self readAll:0];
  v4 = v7;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v7[24] = self->_bookedUsingMaps;
    *((_WORD *)v7 + 18) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v7[26] = self->_cancelled;
  *((_WORD *)v7 + 18) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_4:
    if ((flags & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  v7[35] = self->_viewedInProactiveTray;
  *((_WORD *)v7 + 18) |= 0x1000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_5:
    if ((flags & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v7[32] = self->_tappedProactiveTrayItem;
  *((_WORD *)v7 + 18) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v7[34] = self->_viewedInPlacecard;
  *((_WORD *)v7 + 18) |= 0x800u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_26:
  v7[33] = self->_viewedDetailsFromPlacecard;
  *((_WORD *)v7 + 18) |= 0x400u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    v7[27] = self->_isAsync;
    *((_WORD *)v7 + 18) |= 0x10u;
  }
LABEL_9:
  if (self->_appId)
  {
    objc_msgSend(v7, "setAppId:");
    v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if (v6)
  {
    v4[2] = self->_muid;
    *((_WORD *)v4 + 18) |= 1u;
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v4 + 25) = self->_called;
  *((_WORD *)v4 + 18) |= 4u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x20) == 0)
  {
LABEL_14:
    if ((v6 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)v4 + 28) = self->_routed;
  *((_WORD *)v4 + 18) |= 0x20u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x100) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((unsigned char *)v4 + 31) = self->_tappedChangeReservation;
  *((_WORD *)v4 + 18) |= 0x100u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_32:
  *((unsigned char *)v4 + 30) = self->_tappedCancelReservation;
  *((_WORD *)v4 + 18) |= 0x80u;
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
LABEL_17:
    *((unsigned char *)v4 + 29) = self->_shared;
    *((_WORD *)v4 + 18) |= 0x40u;
  }
LABEL_18:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_bookedUsingMaps;
    *(_WORD *)(v5 + 36) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 26) = self->_cancelled;
  *(_WORD *)(v5 + 36) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_4:
    if ((flags & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(unsigned char *)(v5 + 35) = self->_viewedInProactiveTray;
  *(_WORD *)(v5 + 36) |= 0x1000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_5:
    if ((flags & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(unsigned char *)(v5 + 32) = self->_tappedProactiveTrayItem;
  *(_WORD *)(v5 + 36) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(unsigned char *)(v5 + 34) = self->_viewedInPlacecard;
  *(_WORD *)(v5 + 36) |= 0x800u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_22:
  *(unsigned char *)(v5 + 33) = self->_viewedDetailsFromPlacecard;
  *(_WORD *)(v5 + 36) |= 0x400u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 27) = self->_isAsync;
    *(_WORD *)(v5 + 36) |= 0x10u;
  }
LABEL_9:
  uint64_t v8 = [(NSString *)self->_appId copyWithZone:a3];
  v9 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v8;

  __int16 v10 = (__int16)self->_flags;
  if (v10)
  {
    *(void *)(v6 + 16) = self->_muid;
    *(_WORD *)(v6 + 36) |= 1u;
    __int16 v10 = (__int16)self->_flags;
    if ((v10 & 4) == 0)
    {
LABEL_11:
      if ((v10 & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
  }
  else if ((v10 & 4) == 0)
  {
    goto LABEL_11;
  }
  *(unsigned char *)(v6 + 25) = self->_called;
  *(_WORD *)(v6 + 36) |= 4u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x20) == 0)
  {
LABEL_12:
    if ((v10 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(v6 + 28) = self->_routed;
  *(_WORD *)(v6 + 36) |= 0x20u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x100) == 0)
  {
LABEL_13:
    if ((v10 & 0x80) == 0) {
      goto LABEL_14;
    }
LABEL_28:
    *(unsigned char *)(v6 + 30) = self->_tappedCancelReservation;
    *(_WORD *)(v6 + 36) |= 0x80u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_15;
  }
LABEL_27:
  *(unsigned char *)(v6 + 31) = self->_tappedChangeReservation;
  *(_WORD *)(v6 + 36) |= 0x100u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x80) != 0) {
    goto LABEL_28;
  }
LABEL_14:
  if ((v10 & 0x40) != 0)
  {
LABEL_15:
    *(unsigned char *)(v6 + 29) = self->_shared;
    *(_WORD *)(v6 + 36) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_101;
  }
  [(GEOBookedTable *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 18);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_101;
    }
    if (self->_bookedUsingMaps)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_101;
    }
    if (self->_cancelled)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_101;
  }
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x1000) == 0) {
      goto LABEL_101;
    }
    if (self->_viewedInProactiveTray)
    {
      if (!*((unsigned char *)v4 + 35)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 35))
    {
      goto LABEL_101;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x1000) != 0)
  {
    goto LABEL_101;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x200) == 0) {
      goto LABEL_101;
    }
    if (self->_tappedProactiveTrayItem)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_101;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x200) != 0)
  {
    goto LABEL_101;
  }
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x800) == 0) {
      goto LABEL_101;
    }
    if (self->_viewedInPlacecard)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_101;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x800) != 0)
  {
    goto LABEL_101;
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x400) == 0) {
      goto LABEL_101;
    }
    if (self->_viewedDetailsFromPlacecard)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_101;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x400) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_101;
    }
    if (self->_isAsync)
    {
      if (!*((unsigned char *)v4 + 27)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 27))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_101;
  }
  appId = self->_appId;
  if ((unint64_t)appId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appId, "isEqual:")) {
      goto LABEL_101;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 18);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_muid != *((void *)v4 + 2)) {
      goto LABEL_101;
    }
  }
  else if (v6)
  {
    goto LABEL_101;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_101;
    }
    if (self->_called)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_101;
    }
    if (self->_routed)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0) {
      goto LABEL_101;
    }
    if (self->_tappedChangeReservation)
    {
      if (!*((unsigned char *)v4 + 31)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 31))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_101;
    }
    if (self->_tappedCancelReservation)
    {
      if (!*((unsigned char *)v4 + 30)) {
        goto LABEL_101;
      }
    }
    else if (*((unsigned char *)v4 + 30))
    {
      goto LABEL_101;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_101;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_shared)
      {
        if (!*((unsigned char *)v4 + 29)) {
          goto LABEL_101;
        }
      }
      else if (*((unsigned char *)v4 + 29))
      {
        goto LABEL_101;
      }
      BOOL v8 = 1;
      goto LABEL_102;
    }
LABEL_101:
    BOOL v8 = 0;
    goto LABEL_102;
  }
  BOOL v8 = (v6 & 0x40) == 0;
LABEL_102:

  return v8;
}

- (unint64_t)hash
{
  [(GEOBookedTable *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_bookedUsingMaps;
    if ((flags & 8) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_cancelled;
      if ((*(_WORD *)&self->_flags & 0x1000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_viewedInProactiveTray;
    if ((*(_WORD *)&self->_flags & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_tappedProactiveTrayItem;
    if ((*(_WORD *)&self->_flags & 0x800) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_viewedInPlacecard;
    if ((*(_WORD *)&self->_flags & 0x400) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_flags & 0x400) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_viewedDetailsFromPlacecard;
  if ((flags & 0x10) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_isAsync;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
LABEL_16:
  NSUInteger v11 = [(NSString *)self->_appId hash];
  __int16 v12 = (__int16)self->_flags;
  if (v12)
  {
    unint64_t v13 = 2654435761u * self->_muid;
    if ((v12 & 4) != 0)
    {
LABEL_18:
      uint64_t v14 = 2654435761 * self->_called;
      if ((v12 & 0x20) != 0) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }
  }
  else
  {
    unint64_t v13 = 0;
    if ((v12 & 4) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 0x20) != 0)
  {
LABEL_19:
    uint64_t v15 = 2654435761 * self->_routed;
    if ((*(_WORD *)&self->_flags & 0x100) != 0) {
      goto LABEL_20;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_20:
    uint64_t v16 = 2654435761 * self->_tappedChangeReservation;
    if ((v12 & 0x80) != 0) {
      goto LABEL_21;
    }
LABEL_27:
    uint64_t v17 = 0;
    if ((v12 & 0x40) != 0) {
      goto LABEL_22;
    }
LABEL_28:
    uint64_t v18 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11;
  }
LABEL_26:
  uint64_t v16 = 0;
  if ((v12 & 0x80) == 0) {
    goto LABEL_27;
  }
LABEL_21:
  uint64_t v17 = 2654435761 * self->_tappedCancelReservation;
  if ((v12 & 0x40) == 0) {
    goto LABEL_28;
  }
LABEL_22:
  uint64_t v18 = 2654435761 * self->_shared;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v7 = (BOOL *)a3;
  [v7 readAll:0];
  uint64_t v4 = v7;
  __int16 v5 = *((_WORD *)v7 + 18);
  if ((v5 & 2) != 0)
  {
    self->_bookedUsingMaps = v7[24];
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v7 + 18);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_cancelled = v7[26];
  *(_WORD *)&self->_flags |= 8u;
  __int16 v5 = *((_WORD *)v7 + 18);
  if ((v5 & 0x1000) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_viewedInProactiveTray = v7[35];
  *(_WORD *)&self->_flags |= 0x1000u;
  __int16 v5 = *((_WORD *)v7 + 18);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_tappedProactiveTrayItem = v7[32];
  *(_WORD *)&self->_flags |= 0x200u;
  __int16 v5 = *((_WORD *)v7 + 18);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_viewedInPlacecard = v7[34];
  *(_WORD *)&self->_flags |= 0x800u;
  __int16 v5 = *((_WORD *)v7 + 18);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_26:
  self->_viewedDetailsFromPlacecard = v7[33];
  *(_WORD *)&self->_flags |= 0x400u;
  if ((*((_WORD *)v7 + 18) & 0x10) != 0)
  {
LABEL_8:
    self->_isAsync = v7[27];
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_9:
  if (*((void *)v7 + 1))
  {
    -[GEOBookedTable setAppId:](self, "setAppId:");
    uint64_t v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 18);
  if (v6)
  {
    self->_muid = *((void *)v4 + 2);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v6 = *((_WORD *)v4 + 18);
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_called = v4[25];
  *(_WORD *)&self->_flags |= 4u;
  __int16 v6 = *((_WORD *)v4 + 18);
  if ((v6 & 0x20) == 0)
  {
LABEL_14:
    if ((v6 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_routed = v4[28];
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 18);
  if ((v6 & 0x100) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_tappedChangeReservation = v4[31];
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v6 = *((_WORD *)v4 + 18);
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_32:
  self->_tappedCancelReservation = v4[30];
  *(_WORD *)&self->_flags |= 0x80u;
  if ((*((_WORD *)v4 + 18) & 0x40) != 0)
  {
LABEL_17:
    self->_shared = v4[29];
    *(_WORD *)&self->_flags |= 0x40u;
  }
LABEL_18:
}

- (void).cxx_destruct
{
}

@end