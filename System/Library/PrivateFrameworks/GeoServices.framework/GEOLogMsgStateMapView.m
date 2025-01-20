@interface GEOLogMsgStateMapView
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsAdvancedMap;
- (BOOL)hasIsGlobeProjection;
- (BOOL)hasMapRegion;
- (BOOL)hasMapType;
- (BOOL)hasPitch;
- (BOOL)hasStyleZoomLevel;
- (BOOL)hasViewMode;
- (BOOL)hasWatchProximityRadiusOn;
- (BOOL)hasZoomLevel;
- (BOOL)isAdvancedMap;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGlobeProjection;
- (BOOL)readFrom:(id)a3;
- (BOOL)watchProximityRadiusOn;
- (GEOLogMsgStateMapView)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapView)initWithJSON:(id)a3;
- (GEOMapRegion)mapRegion;
- (double)pitch;
- (double)styleZoomLevel;
- (double)zoomLevel;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapTypeAsString:(int)a3;
- (id)viewModeAsString:(int)a3;
- (int)StringAsMapType:(id)a3;
- (int)StringAsViewMode:(id)a3;
- (int)mapType;
- (int)viewMode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsAdvancedMap:(BOOL)a3;
- (void)setHasIsGlobeProjection:(BOOL)a3;
- (void)setHasMapType:(BOOL)a3;
- (void)setHasPitch:(BOOL)a3;
- (void)setHasStyleZoomLevel:(BOOL)a3;
- (void)setHasViewMode:(BOOL)a3;
- (void)setHasWatchProximityRadiusOn:(BOOL)a3;
- (void)setHasZoomLevel:(BOOL)a3;
- (void)setIsAdvancedMap:(BOOL)a3;
- (void)setIsGlobeProjection:(BOOL)a3;
- (void)setMapRegion:(id)a3;
- (void)setMapType:(int)a3;
- (void)setPitch:(double)a3;
- (void)setStyleZoomLevel:(double)a3;
- (void)setViewMode:(int)a3;
- (void)setWatchProximityRadiusOn:(BOOL)a3;
- (void)setZoomLevel:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapView

- (void)setMapRegion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setZoomLevel:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_zoomLevel = a3;
}

- (void)setStyleZoomLevel:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_styleZoomLevel = a3;
}

- (void)setPitch:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_pitch = a3;
}

- (void)setMapType:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_mapType = a3;
}

- (void)setIsGlobeProjection:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_isGlobeProjection = a3;
}

- (void)setIsAdvancedMap:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_isAdvancedMap = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_mapRegion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x10) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    if ((*(unsigned char *)&self->_flags & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((flags & 0x80) == 0) {
    goto LABEL_11;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
LABEL_11:
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasZoomLevel
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)mapType
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_mapType;
  }
  else {
    return 0;
  }
}

- (void)setHasMapType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMapType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8050[a3];
  }

  return v3;
}

- (int)StringAsMapType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_TRANSIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)styleZoomLevel
{
  return self->_styleZoomLevel;
}

- (void)setHasStyleZoomLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStyleZoomLevel
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setHasPitch:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPitch
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isAdvancedMap
{
  return self->_isAdvancedMap;
}

- (void)setHasIsAdvancedMap:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsAdvancedMap
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)isGlobeProjection
{
  return self->_isGlobeProjection;
}

- (void)setHasIsGlobeProjection:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasIsGlobeProjection
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)viewMode
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_viewMode;
  }
  else {
    return 0;
  }
}

- (void)setViewMode:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_viewMode = a3;
}

- (void)setHasViewMode:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasViewMode
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)viewModeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8078[a3];
  }

  return v3;
}

- (int)StringAsViewMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_TRANSIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_TERRAIN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID_FLYOVER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE_FLYOVER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_DRIVING"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)watchProximityRadiusOn
{
  return self->_watchProximityRadiusOn;
}

- (void)setWatchProximityRadiusOn:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x80u;
  self->_watchProximityRadiusOn = a3;
}

- (void)setHasWatchProximityRadiusOn:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = v3 & 0x80 | *(unsigned char *)&self->_flags & 0x7F;
}

- (BOOL)hasWatchProximityRadiusOn
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapView;
  int v4 = [(GEOLogMsgStateMapView *)&v8 description];
  v5 = [(GEOLogMsgStateMapView *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapView _dictionaryRepresentation:]((uint64_t)self, 0);
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
  v5 = [(id)a1 mapRegion];
  id v6 = v5;
  if (v5)
  {
    if (a2)
    {
      v7 = [v5 jsonRepresentation];
      objc_super v8 = @"mapRegion";
    }
    else
    {
      v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"map_region";
    }
    [v4 setObject:v7 forKey:v8];
  }
  char v9 = *(unsigned char *)(a1 + 52);
  if ((v9 & 4) != 0)
  {
    v10 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v11 = @"zoomLevel";
    }
    else {
      v11 = @"zoom_level";
    }
    [v4 setObject:v10 forKey:v11];

    char v9 = *(unsigned char *)(a1 + 52);
  }
  if ((v9 & 8) != 0)
  {
    uint64_t v12 = *(int *)(a1 + 40);
    if (v12 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E53F8050[v12];
    }
    if (a2) {
      v14 = @"mapType";
    }
    else {
      v14 = @"map_type";
    }
    [v4 setObject:v13 forKey:v14];

    char v9 = *(unsigned char *)(a1 + 52);
  }
  if ((v9 & 2) != 0)
  {
    v15 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v16 = @"styleZoomLevel";
    }
    else {
      v16 = @"style_zoom_level";
    }
    [v4 setObject:v15 forKey:v16];

    char v9 = *(unsigned char *)(a1 + 52);
    if ((v9 & 1) == 0)
    {
LABEL_22:
      if ((v9 & 0x20) == 0) {
        goto LABEL_23;
      }
      goto LABEL_32;
    }
  }
  else if ((v9 & 1) == 0)
  {
    goto LABEL_22;
  }
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  [v4 setObject:v17 forKey:@"pitch"];

  char v9 = *(unsigned char *)(a1 + 52);
  if ((v9 & 0x20) == 0)
  {
LABEL_23:
    if ((v9 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_36;
  }
LABEL_32:
  v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  if (a2) {
    v19 = @"isAdvancedMap";
  }
  else {
    v19 = @"is_advanced_map";
  }
  [v4 setObject:v18 forKey:v19];

  char v9 = *(unsigned char *)(a1 + 52);
  if ((v9 & 0x40) == 0)
  {
LABEL_24:
    if ((v9 & 0x10) == 0) {
      goto LABEL_25;
    }
LABEL_40:
    uint64_t v22 = *(int *)(a1 + 44);
    if (v22 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E53F8078[v22];
    }
    if (a2) {
      v24 = @"viewMode";
    }
    else {
      v24 = @"view_mode";
    }
    [v4 setObject:v23 forKey:v24];

    if ((*(unsigned char *)(a1 + 52) & 0x80) == 0) {
      goto LABEL_51;
    }
    goto LABEL_47;
  }
LABEL_36:
  v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  if (a2) {
    v21 = @"isGlobeProjection";
  }
  else {
    v21 = @"is_globe_projection";
  }
  [v4 setObject:v20 forKey:v21];

  char v9 = *(unsigned char *)(a1 + 52);
  if ((v9 & 0x10) != 0) {
    goto LABEL_40;
  }
LABEL_25:
  if (v9 < 0)
  {
LABEL_47:
    v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 50)];
    if (a2) {
      v26 = @"watchProximityRadiusOn";
    }
    else {
      v26 = @"watch_proximity_radius_on";
    }
    [v4 setObject:v25 forKey:v26];
  }
LABEL_51:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapView _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapView)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapView *)-[GEOLogMsgStateMapView _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_85;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_85;
  }
  if (a3) {
    id v6 = @"mapRegion";
  }
  else {
    id v6 = @"map_region";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v9 = [(GEOMapRegion *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOMapRegion *)v8 initWithDictionary:v7];
    }
    v10 = (void *)v9;
    [a1 setMapRegion:v9];
  }
  if (a3) {
    v11 = @"zoomLevel";
  }
  else {
    v11 = @"zoom_level";
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 doubleValue];
    objc_msgSend(a1, "setZoomLevel:");
  }

  if (a3) {
    v13 = @"mapType";
  }
  else {
    v13 = @"map_type";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"MAP_TYPE_NONE"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"MAP_TYPE_STANDARD"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"MAP_TYPE_SATELLITE"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"MAP_TYPE_HYBRID"])
    {
      uint64_t v16 = 3;
    }
    else if ([v15 isEqualToString:@"MAP_TYPE_TRANSIT"])
    {
      uint64_t v16 = 4;
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
      goto LABEL_35;
    }
    uint64_t v16 = [v14 intValue];
  }
  [a1 setMapType:v16];
LABEL_35:

  if (a3) {
    v17 = @"styleZoomLevel";
  }
  else {
    v17 = @"style_zoom_level";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 doubleValue];
    objc_msgSend(a1, "setStyleZoomLevel:");
  }

  v19 = [v5 objectForKeyedSubscript:@"pitch"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 doubleValue];
    objc_msgSend(a1, "setPitch:");
  }

  if (a3) {
    v20 = @"isAdvancedMap";
  }
  else {
    v20 = @"is_advanced_map";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsAdvancedMap:", objc_msgSend(v21, "BOOLValue"));
  }

  if (a3) {
    uint64_t v22 = @"isGlobeProjection";
  }
  else {
    uint64_t v22 = @"is_globe_projection";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsGlobeProjection:", objc_msgSend(v23, "BOOLValue"));
  }

  if (a3) {
    v24 = @"viewMode";
  }
  else {
    v24 = @"view_mode";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v25;
    if ([v26 isEqualToString:@"MAP_TYPE_NONE"])
    {
      uint64_t v27 = 0;
    }
    else if ([v26 isEqualToString:@"MAP_TYPE_STANDARD"])
    {
      uint64_t v27 = 1;
    }
    else if ([v26 isEqualToString:@"MAP_TYPE_SATELLITE"])
    {
      uint64_t v27 = 2;
    }
    else if ([v26 isEqualToString:@"MAP_TYPE_HYBRID"])
    {
      uint64_t v27 = 3;
    }
    else if ([v26 isEqualToString:@"MAP_TYPE_TRANSIT"])
    {
      uint64_t v27 = 4;
    }
    else if ([v26 isEqualToString:@"MAP_TYPE_TERRAIN"])
    {
      uint64_t v27 = 5;
    }
    else if ([v26 isEqualToString:@"MAP_TYPE_HYBRID_FLYOVER"])
    {
      uint64_t v27 = 6;
    }
    else if ([v26 isEqualToString:@"MAP_TYPE_SATELLITE_FLYOVER"])
    {
      uint64_t v27 = 7;
    }
    else if ([v26 isEqualToString:@"MAP_TYPE_DRIVING"])
    {
      uint64_t v27 = 8;
    }
    else
    {
      uint64_t v27 = 0;
    }

    goto LABEL_78;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v27 = [v25 intValue];
LABEL_78:
    [a1 setViewMode:v27];
  }

  if (a3) {
    v28 = @"watchProximityRadiusOn";
  }
  else {
    v28 = @"watch_proximity_radius_on";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWatchProximityRadiusOn:", objc_msgSend(v29, "BOOLValue"));
  }

LABEL_85:
  return a1;
}

- (GEOLogMsgStateMapView)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapView *)-[GEOLogMsgStateMapView _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapViewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapViewReadAllFrom((uint64_t)self, a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOMapRegion *)self->_mapRegion hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateMapView *)self readAll:0];
  if (self->_mapRegion) {
    objc_msgSend(v5, "setMapRegion:");
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((void *)v5 + 4) = *(void *)&self->_zoomLevel;
    *((unsigned char *)v5 + 52) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 10) = self->_mapType;
  *((unsigned char *)v5 + 52) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)v5 + 3) = *(void *)&self->_styleZoomLevel;
  *((unsigned char *)v5 + 52) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)v5 + 2) = *(void *)&self->_pitch;
  *((unsigned char *)v5 + 52) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v5 + 48) = self->_isAdvancedMap;
  *((unsigned char *)v5 + 52) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x10) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    *((_DWORD *)v5 + 11) = self->_viewMode;
    *((unsigned char *)v5 + 52) |= 0x10u;
    if ((*(unsigned char *)&self->_flags & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  *((unsigned char *)v5 + 49) = self->_isGlobeProjection;
  *((unsigned char *)v5 + 52) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((flags & 0x80) == 0) {
    goto LABEL_11;
  }
LABEL_21:
  *((unsigned char *)v5 + 50) = self->_watchProximityRadiusOn;
  *((unsigned char *)v5 + 52) |= 0x80u;
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(double *)(v5 + 32) = self->_zoomLevel;
    *(unsigned char *)(v5 + 52) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_mapType;
  *(unsigned char *)(v5 + 52) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(double *)(v5 + 24) = self->_styleZoomLevel;
  *(unsigned char *)(v5 + 52) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(double *)(v5 + 16) = self->_pitch;
  *(unsigned char *)(v5 + 52) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(unsigned char *)(v5 + 48) = self->_isAdvancedMap;
  *(unsigned char *)(v5 + 52) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    *(_DWORD *)(v5 + 44) = self->_viewMode;
    *(unsigned char *)(v5 + 52) |= 0x10u;
    if ((*(unsigned char *)&self->_flags & 0x80) == 0) {
      return (id)v5;
    }
LABEL_17:
    *(unsigned char *)(v5 + 50) = self->_watchProximityRadiusOn;
    *(unsigned char *)(v5 + 52) |= 0x80u;
    return (id)v5;
  }
LABEL_15:
  *(unsigned char *)(v5 + 49) = self->_isGlobeProjection;
  *(unsigned char *)(v5 + 52) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if (flags < 0) {
    goto LABEL_17;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEOLogMsgStateMapView *)self readAll:1];
  [v4 readAll:1];
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 1))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[52] & 4) == 0 || self->_zoomLevel != *((double *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((v4[52] & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v4[52] & 8) == 0 || self->_mapType != *((_DWORD *)v4 + 10)) {
      goto LABEL_47;
    }
  }
  else if ((v4[52] & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[52] & 2) == 0 || self->_styleZoomLevel != *((double *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if ((v4[52] & 2) != 0)
  {
    goto LABEL_47;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[52] & 1) == 0 || self->_pitch != *((double *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if (v4[52])
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((v4[52] & 0x20) == 0) {
      goto LABEL_47;
    }
    if (self->_isAdvancedMap)
    {
      if (!v4[48]) {
        goto LABEL_47;
      }
    }
    else if (v4[48])
    {
      goto LABEL_47;
    }
  }
  else if ((v4[52] & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((v4[52] & 0x40) == 0) {
      goto LABEL_47;
    }
    if (self->_isGlobeProjection)
    {
      if (!v4[49]) {
        goto LABEL_47;
      }
    }
    else if (v4[49])
    {
      goto LABEL_47;
    }
  }
  else if ((v4[52] & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v4[52] & 0x10) == 0 || self->_viewMode != *((_DWORD *)v4 + 11)) {
      goto LABEL_47;
    }
  }
  else if ((v4[52] & 0x10) != 0)
  {
    goto LABEL_47;
  }
  BOOL v6 = v4[52] >= 0;
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    if (v4[52] < 0)
    {
      if (self->_watchProximityRadiusOn)
      {
        if (!v4[50]) {
          goto LABEL_47;
        }
      }
      else if (v4[50])
      {
        goto LABEL_47;
      }
      BOOL v6 = 1;
      goto LABEL_48;
    }
LABEL_47:
    BOOL v6 = 0;
  }
LABEL_48:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMapView *)self readAll:1];
  unint64_t v3 = [(GEOMapRegion *)self->_mapRegion hash];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    double zoomLevel = self->_zoomLevel;
    double v7 = -zoomLevel;
    if (zoomLevel >= 0.0) {
      double v7 = self->_zoomLevel;
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
  if ((flags & 8) != 0)
  {
    uint64_t v10 = 2654435761 * self->_mapType;
    if ((flags & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v15 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double styleZoomLevel = self->_styleZoomLevel;
  double v12 = -styleZoomLevel;
  if (styleZoomLevel >= 0.0) {
    double v12 = self->_styleZoomLevel;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_19:
  if (flags)
  {
    double pitch = self->_pitch;
    double v18 = -pitch;
    if (pitch >= 0.0) {
      double v18 = self->_pitch;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    uint64_t v21 = 2654435761 * self->_isAdvancedMap;
    if ((flags & 0x40) != 0)
    {
LABEL_29:
      uint64_t v22 = 2654435761 * self->_isGlobeProjection;
      if ((flags & 0x10) != 0) {
        goto LABEL_30;
      }
LABEL_34:
      uint64_t v23 = 0;
      if (flags < 0) {
        goto LABEL_31;
      }
LABEL_35:
      uint64_t v24 = 0;
      return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v24;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((flags & 0x40) != 0) {
      goto LABEL_29;
    }
  }
  uint64_t v22 = 0;
  if ((flags & 0x10) == 0) {
    goto LABEL_34;
  }
LABEL_30:
  uint64_t v23 = 2654435761 * self->_viewMode;
  if ((flags & 0x80) == 0) {
    goto LABEL_35;
  }
LABEL_31:
  uint64_t v24 = 2654435761 * self->_watchProximityRadiusOn;
  return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  mapRegion = self->_mapRegion;
  uint64_t v5 = *((void *)v7 + 1);
  if (mapRegion)
  {
    if (v5) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLogMsgStateMapView setMapRegion:](self, "setMapRegion:");
  }
  char v6 = *((unsigned char *)v7 + 52);
  if ((v6 & 4) != 0)
  {
    self->_double zoomLevel = *((double *)v7 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v6 = *((unsigned char *)v7 + 52);
    if ((v6 & 8) == 0)
    {
LABEL_8:
      if ((v6 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v7 + 52) & 8) == 0)
  {
    goto LABEL_8;
  }
  self->_mapType = *((_DWORD *)v7 + 10);
  *(unsigned char *)&self->_flags |= 8u;
  char v6 = *((unsigned char *)v7 + 52);
  if ((v6 & 2) == 0)
  {
LABEL_9:
    if ((v6 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double styleZoomLevel = *((double *)v7 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  char v6 = *((unsigned char *)v7 + 52);
  if ((v6 & 1) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double pitch = *((double *)v7 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v6 = *((unsigned char *)v7 + 52);
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_isAdvancedMap = *((unsigned char *)v7 + 48);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v6 = *((unsigned char *)v7 + 52);
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x10) == 0) {
      goto LABEL_13;
    }
LABEL_23:
    self->_viewMode = *((_DWORD *)v7 + 11);
    *(unsigned char *)&self->_flags |= 0x10u;
    if ((*((unsigned char *)v7 + 52) & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_22:
  self->_isGlobeProjection = *((unsigned char *)v7 + 49);
  *(unsigned char *)&self->_flags |= 0x40u;
  char v6 = *((unsigned char *)v7 + 52);
  if ((v6 & 0x10) != 0) {
    goto LABEL_23;
  }
LABEL_13:
  if ((v6 & 0x80) == 0) {
    goto LABEL_14;
  }
LABEL_24:
  self->_watchProximityRadiusOn = *((unsigned char *)v7 + 50);
  *(unsigned char *)&self->_flags |= 0x80u;
LABEL_14:
}

@end