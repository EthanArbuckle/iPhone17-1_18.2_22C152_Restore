@interface GEOPBTransitVehiclePosition
+ (BOOL)isValid:(id)a3;
+ (id)transitVehiclePositionForPlaceData:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)hasArtwork;
- (BOOL)hasBearing;
- (BOOL)hasColor;
- (BOOL)hasDirectionName;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHeadsign;
- (BOOL)hasLatLng;
- (BOOL)hasModeShield;
- (BOOL)hasSpeed;
- (BOOL)hasStyleAttributes;
- (BOOL)hasTime;
- (BOOL)hasTripId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)latLng;
- (GEOPBTransitArtwork)artwork;
- (GEOPBTransitShield)modeShield;
- (GEOPBTransitVehiclePosition)init;
- (GEOPBTransitVehiclePosition)initWithData:(id)a3;
- (GEOPBTransitVehiclePosition)initWithDictionary:(id)a3;
- (GEOPBTransitVehiclePosition)initWithJSON:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (GEOTransitArtworkDataSource)artworkDataSource;
- (NSDate)timestamp;
- (NSString)color;
- (NSString)colorHexString;
- (NSString)description;
- (NSString)direction;
- (NSString)directionName;
- (NSString)headsign;
- (PBUnknownFields)unknownFields;
- (double)heading;
- (float)bearing;
- (float)speed;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)time;
- (unint64_t)tripID;
- (unint64_t)tripId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArtwork;
- (void)_readColor;
- (void)_readDirectionName;
- (void)_readHeadsign;
- (void)_readLatLng;
- (void)_readModeShield;
- (void)_readStyleAttributes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setBearing:(float)a3;
- (void)setColor:(id)a3;
- (void)setDirectionName:(id)a3;
- (void)setHasBearing:(BOOL)a3;
- (void)setHasSpeed:(BOOL)a3;
- (void)setHasTime:(BOOL)a3;
- (void)setHasTripId:(BOOL)a3;
- (void)setHeadsign:(id)a3;
- (void)setLatLng:(id)a3;
- (void)setModeShield:(id)a3;
- (void)setSpeed:(float)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setTime:(unint64_t)a3;
- (void)setTripId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitVehiclePosition

+ (id)transitVehiclePositionForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__GEOPBTransitVehiclePosition_PlaceDataExtras__transitVehiclePositionForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:62 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __83__GEOPBTransitVehiclePosition_PlaceDataExtras__transitVehiclePositionForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitVehiclePosition](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPBTransitVehiclePosition)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitVehiclePosition;
  v2 = [(GEOPBTransitVehiclePosition *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPBTransitVehiclePosition)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitVehiclePosition;
  id v3 = [(GEOPBTransitVehiclePosition *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (unint64_t)tripId
{
  return self->_tripId;
}

- (void)setTripId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_tripId = a3;
}

- (void)setHasTripId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasTripId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readLatLng
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatLng_tags_1160);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasLatLng
{
  return self->_latLng != 0;
}

- (GEOLatLng)latLng
{
  -[GEOPBTransitVehiclePosition _readLatLng]((uint64_t)self);
  latLng = self->_latLng;

  return latLng;
}

- (void)setLatLng:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (float)bearing
{
  return self->_bearing;
}

- (void)setBearing:(float)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_bearing = a3;
}

- (void)setHasBearing:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasBearing
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSpeed
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readDirectionName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDirectionName
{
  return self->_directionName != 0;
}

- (NSString)directionName
{
  -[GEOPBTransitVehiclePosition _readDirectionName]((uint64_t)self);
  directionName = self->_directionName;

  return directionName;
}

- (void)setDirectionName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_directionName, a3);
}

- (void)_readHeadsign
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHeadsign_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasHeadsign
{
  return self->_headsign != 0;
}

- (NSString)headsign
{
  -[GEOPBTransitVehiclePosition _readHeadsign]((uint64_t)self);
  headsign = self->_headsign;

  return headsign;
}

- (void)setHeadsign:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_headsign, a3);
}

- (void)_readModeShield
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModeShield_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasModeShield
{
  return self->_modeShield != 0;
}

- (GEOPBTransitShield)modeShield
{
  -[GEOPBTransitVehiclePosition _readModeShield]((uint64_t)self);
  modeShield = self->_modeShield;

  return modeShield;
}

- (void)setModeShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_modeShield, a3);
}

- (void)_readColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readColor_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (NSString)color
{
  -[GEOPBTransitVehiclePosition _readColor]((uint64_t)self);
  color = self->_color;

  return color;
}

- (void)setColor:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_color, a3);
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_1161);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitVehiclePosition _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitVehiclePositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_1162);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOPBTransitVehiclePosition _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitVehiclePosition;
  id v4 = [(GEOPBTransitVehiclePosition *)&v8 description];
  uint64_t v5 = [(GEOPBTransitVehiclePosition *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitVehiclePosition _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_47;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)(a1 + 116) & 2) != 0)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 88)];
    if (a2) {
      objc_super v6 = @"tripId";
    }
    else {
      objc_super v6 = @"trip_id";
    }
    [v4 setObject:v5 forKey:v6];
  }
  objc_super v7 = [(id)a1 latLng];
  objc_super v8 = v7;
  if (v7)
  {
    if (a2)
    {
      uint64_t v9 = [v7 jsonRepresentation];
      v10 = @"latLng";
    }
    else
    {
      uint64_t v9 = [v7 dictionaryRepresentation];
      v10 = @"lat_lng";
    }
    [v4 setObject:v9 forKey:v10];
  }
  __int16 v12 = *(_WORD *)(a1 + 116);
  if ((v12 & 1) == 0)
  {
    if ((v12 & 4) == 0) {
      goto LABEL_14;
    }
LABEL_27:
    LODWORD(v11) = *(_DWORD *)(a1 + 108);
    v22 = [NSNumber numberWithFloat:v11];
    [v4 setObject:v22 forKey:@"bearing"];

    if ((*(_WORD *)(a1 + 116) & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
  [v4 setObject:v21 forKey:@"time"];

  __int16 v12 = *(_WORD *)(a1 + 116);
  if ((v12 & 4) != 0) {
    goto LABEL_27;
  }
LABEL_14:
  if ((v12 & 8) != 0)
  {
LABEL_15:
    LODWORD(v11) = *(_DWORD *)(a1 + 112);
    v13 = [NSNumber numberWithFloat:v11];
    [v4 setObject:v13 forKey:@"speed"];
  }
LABEL_16:
  v14 = [(id)a1 directionName];
  if (v14)
  {
    if (a2) {
      v15 = @"directionName";
    }
    else {
      v15 = @"direction_name";
    }
    [v4 setObject:v14 forKey:v15];
  }

  v16 = [(id)a1 headsign];
  if (v16) {
    [v4 setObject:v16 forKey:@"headsign"];
  }

  v17 = [(id)a1 modeShield];
  v18 = v17;
  if (v17)
  {
    if (a2)
    {
      v19 = [v17 jsonRepresentation];
      v20 = @"modeShield";
    }
    else
    {
      v19 = [v17 dictionaryRepresentation];
      v20 = @"mode_shield";
    }
    [v4 setObject:v19 forKey:v20];
  }
  v23 = [(id)a1 color];
  if (v23) {
    [v4 setObject:v23 forKey:@"color"];
  }

  v24 = [(id)a1 styleAttributes];
  v25 = v24;
  if (v24)
  {
    if (a2)
    {
      v26 = [v24 jsonRepresentation];
      v27 = @"styleAttributes";
    }
    else
    {
      v26 = [v24 dictionaryRepresentation];
      v27 = @"style_attributes";
    }
    [v4 setObject:v26 forKey:v27];
  }
  v28 = [(id)a1 artwork];
  v29 = v28;
  if (v28)
  {
    if (a2) {
      [v28 jsonRepresentation];
    }
    else {
    v30 = [v28 dictionaryRepresentation];
    }
    [v4 setObject:v30 forKey:@"artwork"];
  }
  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    v32 = [v31 dictionaryRepresentation];
    v33 = v32;
    if (a2)
    {
      v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __57__GEOPBTransitVehiclePosition__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E53D8860;
      id v35 = v34;
      id v39 = v35;
      [v33 enumerateKeysAndObjectsUsingBlock:v38];
      id v36 = v35;

      v33 = v36;
    }
    [v4 setObject:v33 forKey:@"Unknown Fields"];
  }
LABEL_47:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitVehiclePosition _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPBTransitVehiclePosition__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPBTransitVehiclePosition)initWithDictionary:(id)a3
{
  return (GEOPBTransitVehiclePosition *)-[GEOPBTransitVehiclePosition _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"tripId";
      }
      else {
        objc_super v6 = @"trip_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTripId:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"latLng";
      }
      else {
        objc_super v8 = @"lat_lng";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v11 = [(GEOLatLng *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOLatLng *)v10 initWithDictionary:v9];
        }
        __int16 v12 = (void *)v11;
        [a1 setLatLng:v11];
      }
      v13 = [v5 objectForKeyedSubscript:@"time"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTime:", objc_msgSend(v13, "unsignedLongLongValue"));
      }

      v14 = [v5 objectForKeyedSubscript:@"bearing"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v14 floatValue];
        objc_msgSend(a1, "setBearing:");
      }

      v15 = [v5 objectForKeyedSubscript:@"speed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v15 floatValue];
        objc_msgSend(a1, "setSpeed:");
      }

      if (a3) {
        v16 = @"directionName";
      }
      else {
        v16 = @"direction_name";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setDirectionName:v18];
      }
      v19 = [v5 objectForKeyedSubscript:@"headsign"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = (void *)[v19 copy];
        [a1 setHeadsign:v20];
      }
      if (a3) {
        v21 = @"modeShield";
      }
      else {
        v21 = @"mode_shield";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [GEOPBTransitShield alloc];
        if (a3) {
          uint64_t v24 = [(GEOPBTransitShield *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEOPBTransitShield *)v23 initWithDictionary:v22];
        }
        v25 = (void *)v24;
        [a1 setModeShield:v24];
      }
      v26 = [v5 objectForKeyedSubscript:@"color"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = (void *)[v26 copy];
        [a1 setColor:v27];
      }
      if (a3) {
        v28 = @"styleAttributes";
      }
      else {
        v28 = @"style_attributes";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v31 = [(GEOStyleAttributes *)v30 initWithJSON:v29];
        }
        else {
          uint64_t v31 = [(GEOStyleAttributes *)v30 initWithDictionary:v29];
        }
        v32 = (void *)v31;
        [a1 setStyleAttributes:v31];
      }
      v33 = [v5 objectForKeyedSubscript:@"artwork"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v34 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v35 = [(GEOPBTransitArtwork *)v34 initWithJSON:v33];
        }
        else {
          uint64_t v35 = [(GEOPBTransitArtwork *)v34 initWithDictionary:v33];
        }
        id v36 = (void *)v35;
        [a1 setArtwork:v35];
      }
    }
  }

  return a1;
}

- (GEOPBTransitVehiclePosition)initWithJSON:(id)a3
{
  return (GEOPBTransitVehiclePosition *)-[GEOPBTransitVehiclePosition _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1197;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1198;
    }
    GEOPBTransitVehiclePositionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBTransitVehiclePositionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitVehiclePositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitVehiclePositionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitVehiclePositionIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_28;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitVehiclePosition *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  id v5 = v9;
  if (self->_latLng)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v9;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
LABEL_25:
    PBDataWriterWriteFloatField();
    id v5 = v9;
    if ((*(_WORD *)&self->_flags & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  id v5 = v9;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_25;
  }
LABEL_9:
  if ((flags & 8) != 0)
  {
LABEL_10:
    PBDataWriterWriteFloatField();
    id v5 = v9;
  }
LABEL_11:
  if (self->_directionName)
  {
    PBDataWriterWriteStringField();
    id v5 = v9;
  }
  if (self->_headsign)
  {
    PBDataWriterWriteStringField();
    id v5 = v9;
  }
  if (self->_modeShield)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v9;
  }
  if (self->_color)
  {
    PBDataWriterWriteStringField();
    id v5 = v9;
  }
  if (self->_styleAttributes)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v9;
  }
  if (self->_artwork)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
LABEL_28:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPBTransitVehiclePosition _readLatLng]((uint64_t)self);
  latLng = self->_latLng;

  return [(GEOLatLng *)latLng hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOPBTransitVehiclePosition *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 24) = self->_readerMarkPos;
  *((_DWORD *)v6 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v6;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v6[11] = self->_tripId;
    *((_WORD *)v6 + 58) |= 2u;
  }
  if (self->_latLng)
  {
    objc_msgSend(v6, "setLatLng:");
    id v4 = v6;
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    v4[10] = self->_time;
    *((_WORD *)v4 + 58) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 27) = LODWORD(self->_bearing);
  *((_WORD *)v4 + 58) |= 4u;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 28) = LODWORD(self->_speed);
    *((_WORD *)v4 + 58) |= 8u;
  }
LABEL_9:
  if (self->_directionName)
  {
    objc_msgSend(v6, "setDirectionName:");
    id v4 = v6;
  }
  if (self->_headsign)
  {
    objc_msgSend(v6, "setHeadsign:");
    id v4 = v6;
  }
  if (self->_modeShield)
  {
    objc_msgSend(v6, "setModeShield:");
    id v4 = v6;
  }
  if (self->_color)
  {
    objc_msgSend(v6, "setColor:");
    id v4 = v6;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v6, "setStyleAttributes:");
    id v4 = v6;
  }
  if (self->_artwork)
  {
    objc_msgSend(v6, "setArtwork:");
    id v4 = v6;
  }
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
    [(GEOPBTransitVehiclePosition *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      *(void *)(v5 + 88) = self->_tripId;
      *(_WORD *)(v5 + 116) |= 2u;
    }
    id v9 = [(GEOLatLng *)self->_latLng copyWithZone:a3];
    id v10 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v9;

    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      *(void *)(v5 + 80) = self->_time;
      *(_WORD *)(v5 + 116) |= 1u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_9:
        if ((flags & 8) == 0)
        {
LABEL_11:
          uint64_t v12 = [(NSString *)self->_directionName copyWithZone:a3];
          v13 = *(void **)(v5 + 40);
          *(void *)(v5 + 40) = v12;

          uint64_t v14 = [(NSString *)self->_headsign copyWithZone:a3];
          v15 = *(void **)(v5 + 48);
          *(void *)(v5 + 48) = v14;

          id v16 = [(GEOPBTransitShield *)self->_modeShield copyWithZone:a3];
          v17 = *(void **)(v5 + 64);
          *(void *)(v5 + 64) = v16;

          uint64_t v18 = [(NSString *)self->_color copyWithZone:a3];
          v19 = *(void **)(v5 + 32);
          *(void *)(v5 + 32) = v18;

          id v20 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
          v21 = *(void **)(v5 + 72);
          *(void *)(v5 + 72) = v20;

          id v22 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
          v23 = *(void **)(v5 + 24);
          *(void *)(v5 + 24) = v22;

          uint64_t v24 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v24;
          goto LABEL_12;
        }
LABEL_10:
        *(float *)(v5 + 112) = self->_speed;
        *(_WORD *)(v5 + 116) |= 8u;
        goto LABEL_11;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_9;
    }
    *(float *)(v5 + 108) = self->_bearing;
    *(_WORD *)(v5 + 116) |= 4u;
    if ((*(_WORD *)&self->_flags & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPBTransitVehiclePositionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_12:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  [(GEOPBTransitVehiclePosition *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_tripId != *((void *)v4 + 11)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_37;
  }
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:"))
    {
LABEL_37:
      char v14 = 0;
      goto LABEL_38;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 58);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_time != *((void *)v4 + 10)) {
      goto LABEL_37;
    }
  }
  else if (v6)
  {
    goto LABEL_37;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bearing != *((float *)v4 + 27)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_speed != *((float *)v4 + 28)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_37;
  }
  directionName = self->_directionName;
  if ((unint64_t)directionName | *((void *)v4 + 5)
    && !-[NSString isEqual:](directionName, "isEqual:"))
  {
    goto LABEL_37;
  }
  headsign = self->_headsign;
  if ((unint64_t)headsign | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](headsign, "isEqual:")) {
      goto LABEL_37;
    }
  }
  modeShield = self->_modeShield;
  if ((unint64_t)modeShield | *((void *)v4 + 8))
  {
    if (!-[GEOPBTransitShield isEqual:](modeShield, "isEqual:")) {
      goto LABEL_37;
    }
  }
  color = self->_color;
  if ((unint64_t)color | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](color, "isEqual:")) {
      goto LABEL_37;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 9))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_37;
    }
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 3)) {
    char v14 = -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_38:

  return v14;
}

- (unint64_t)hash
{
  [(GEOPBTransitVehiclePosition *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_tripId;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOLatLng *)self->_latLng hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    unint64_t v6 = 2654435761u * self->_time;
    if ((flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v11 = 0;
    goto LABEL_14;
  }
  unint64_t v6 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  float bearing = self->_bearing;
  double v8 = bearing;
  if (bearing < 0.0) {
    double v8 = -bearing;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_14:
  if ((flags & 8) != 0)
  {
    float speed = self->_speed;
    double v14 = speed;
    if (speed < 0.0) {
      double v14 = -speed;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  unint64_t v17 = v4 ^ v3 ^ v6 ^ v11 ^ v12;
  NSUInteger v18 = [(NSString *)self->_directionName hash];
  NSUInteger v19 = v17 ^ v18 ^ [(NSString *)self->_headsign hash];
  unint64_t v20 = [(GEOPBTransitShield *)self->_modeShield hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_color hash];
  unint64_t v22 = v19 ^ v21 ^ [(GEOStyleAttributes *)self->_styleAttributes hash];
  return v22 ^ [(GEOPBTransitArtwork *)self->_artwork hash];
}

- (void)mergeFrom:(id)a3
{
  double v14 = (unint64_t *)a3;
  [v14 readAll:0];
  unint64_t v4 = v14;
  if ((*((_WORD *)v14 + 58) & 2) != 0)
  {
    self->_tripId = v14[11];
    *(_WORD *)&self->_flags |= 2u;
  }
  latLng = self->_latLng;
  unint64_t v6 = v14[7];
  if (latLng)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPBTransitVehiclePosition setLatLng:](self, "setLatLng:");
  }
  unint64_t v4 = v14;
LABEL_9:
  __int16 v7 = *((_WORD *)v4 + 58);
  if (v7)
  {
    self->_time = v4[10];
    *(_WORD *)&self->_flags |= 1u;
    __int16 v7 = *((_WORD *)v4 + 58);
    if ((v7 & 4) == 0)
    {
LABEL_11:
      if ((v7 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_float bearing = *((float *)v4 + 27);
  *(_WORD *)&self->_flags |= 4u;
  if ((*((_WORD *)v4 + 58) & 8) != 0)
  {
LABEL_12:
    self->_float speed = *((float *)v4 + 28);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_13:
  if (v4[5])
  {
    -[GEOPBTransitVehiclePosition setDirectionName:](self, "setDirectionName:");
    unint64_t v4 = v14;
  }
  if (v4[6])
  {
    -[GEOPBTransitVehiclePosition setHeadsign:](self, "setHeadsign:");
    unint64_t v4 = v14;
  }
  modeShield = self->_modeShield;
  unint64_t v9 = v4[8];
  if (modeShield)
  {
    if (!v9) {
      goto LABEL_26;
    }
    -[GEOPBTransitShield mergeFrom:](modeShield, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_26;
    }
    -[GEOPBTransitVehiclePosition setModeShield:](self, "setModeShield:");
  }
  unint64_t v4 = v14;
LABEL_26:
  if (v4[4])
  {
    -[GEOPBTransitVehiclePosition setColor:](self, "setColor:");
    unint64_t v4 = v14;
  }
  styleAttributes = self->_styleAttributes;
  unint64_t v11 = v4[9];
  if (styleAttributes)
  {
    if (!v11) {
      goto LABEL_34;
    }
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_34;
    }
    -[GEOPBTransitVehiclePosition setStyleAttributes:](self, "setStyleAttributes:");
  }
  unint64_t v4 = v14;
LABEL_34:
  artwork = self->_artwork;
  unint64_t v13 = v4[3];
  if (artwork)
  {
    if (!v13) {
      goto LABEL_40;
    }
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_40;
    }
    -[GEOPBTransitVehiclePosition setArtwork:](self, "setArtwork:");
  }
  unint64_t v4 = v14;
LABEL_40:
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitVehiclePositionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1202);
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
  *(_WORD *)&self->_flags |= 0x1010u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitVehiclePosition *)self readAll:0];
    [(GEOLatLng *)self->_latLng clearUnknownFields:1];
    [(GEOPBTransitShield *)self->_modeShield clearUnknownFields:1];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    artwork = self->_artwork;
    [(GEOPBTransitArtwork *)artwork clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_modeShield, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_headsign, 0);
  objc_storeStrong((id *)&self->_directionName, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (unint64_t)tripID
{
  if (![(GEOPBTransitVehiclePosition *)self hasTripId]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [(GEOPBTransitVehiclePosition *)self tripId];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  if ([(GEOPBTransitVehiclePosition *)self hasLatLng])
  {
    BOOL v3 = [(GEOPBTransitVehiclePosition *)self latLng];
    [v3 coordinate];
    unint64_t v5 = v4;
    unint64_t v7 = v6;
  }
  else
  {
    unint64_t v5 = 0xC066800000000000;
    unint64_t v7 = 0xC066800000000000;
  }
  double v8 = *(double *)&v5;
  double v9 = *(double *)&v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (double)heading
{
  BOOL v3 = [(GEOPBTransitVehiclePosition *)self hasBearing];
  double result = -1.0;
  if (v3)
  {
    [(GEOPBTransitVehiclePosition *)self bearing];
    return v5;
  }
  return result;
}

- (NSString)direction
{
  if ([(GEOPBTransitVehiclePosition *)self hasDirectionName])
  {
    BOOL v3 = [(GEOPBTransitVehiclePosition *)self directionName];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSString *)v3;
}

- (NSDate)timestamp
{
  if ([(GEOPBTransitVehiclePosition *)self hasTime])
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOPBTransitVehiclePosition time](self, "time"));
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDate *)v3;
}

- (NSString)colorHexString
{
  if ([(GEOPBTransitVehiclePosition *)self hasColor])
  {
    BOOL v3 = [(GEOPBTransitVehiclePosition *)self color];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSString *)v3;
}

- (GEOTransitArtworkDataSource)artworkDataSource
{
  if ([(GEOPBTransitVehiclePosition *)self hasArtwork])
  {
    BOOL v3 = [(GEOPBTransitVehiclePosition *)self artwork];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (GEOTransitArtworkDataSource *)v3;
}

@end