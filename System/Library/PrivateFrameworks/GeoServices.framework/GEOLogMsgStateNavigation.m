@interface GEOLogMsgStateNavigation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDistanceToDestination;
- (BOOL)hasLineType;
- (BOOL)hasNavCameraState;
- (BOOL)hasNavState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateNavigation)initWithDictionary:(id)a3;
- (GEOLogMsgStateNavigation)initWithJSON:(id)a3;
- (GEONavCameraState)navCameraState;
- (double)distanceToDestination;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)lineTypeAsString:(int)a3;
- (id)navStateAsString:(int)a3;
- (int)StringAsLineType:(id)a3;
- (int)StringAsNavState:(id)a3;
- (int)lineType;
- (int)navState;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistanceToDestination:(double)a3;
- (void)setHasDistanceToDestination:(BOOL)a3;
- (void)setHasLineType:(BOOL)a3;
- (void)setHasNavState:(BOOL)a3;
- (void)setLineType:(int)a3;
- (void)setNavCameraState:(id)a3;
- (void)setNavState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateNavigation

- (int)lineType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_lineType;
  }
  else {
    return 0;
  }
}

- (void)setLineType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_lineType = a3;
}

- (void)setHasLineType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLineType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)lineTypeAsString:(int)a3
{
  if (a3 >= 0x1C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8118[a3];
  }

  return v3;
}

- (int)StringAsLineType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_LINE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PEDESTRIAN_PATH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRIVATE_PATH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MINOR_ROAD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOCAL_ROAD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCAL_MAJOR_ROAD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_ROAD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HIGHWAY"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MAJOR_HIGHWAY"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FREEWAY_CONTROLLED"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FREEWAY_UNCONTROLLED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"WATER"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_BORDER"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"PARKING_STRUCTURE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"PEDESTRIAN_ROAD"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TRANSIT_TRANSFER"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"PEDESTRIAN_OVERPASS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"PEDESTRIAN_OVERPASS_STEPS"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PEDESTRIAN_OVERPASS_RAMP"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"PEDESTRIAN_UNDERPASS"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"PEDESTRIAN_UNDERPASS_STEPS"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"PEDESTRIAN_UNDERPASS_RAMP"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"SERVICE_ROAD"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"GATE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"PARKING_LOT_ROAD"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"TRANSIT_STATION_GRAPH"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"HIDDEN"])
  {
    int v4 = 27;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)navState
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_navState;
  }
  else {
    return 0;
  }
}

- (void)setNavState:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_navState = a3;
}

- (void)setHasNavState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNavState
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)navStateAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F81F8[a3];
  }

  return v3;
}

- (int)StringAsNavState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_NAVIGATING"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PROCEEDING_TO_ROUTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ON_ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"OFF_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BAD_ROUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RECALCULATING"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"END_OF_ROUTE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"END_OF_SEGMENT"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)distanceToDestination
{
  return self->_distanceToDestination;
}

- (void)setDistanceToDestination:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_distanceToDestination = a3;
}

- (void)setHasDistanceToDestination:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDistanceToDestination
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasNavCameraState
{
  return self->_navCameraState != 0;
}

- (GEONavCameraState)navCameraState
{
  return self->_navCameraState;
}

- (void)setNavCameraState:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateNavigation;
  int v4 = [(GEOLogMsgStateNavigation *)&v8 description];
  v5 = [(GEOLogMsgStateNavigation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateNavigation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_17;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 32) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_25:
    uint64_t v16 = *(int *)(a1 + 28);
    if (v16 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E53F81F8[v16];
    }
    if (a2) {
      v18 = @"navState";
    }
    else {
      v18 = @"nav_state";
    }
    [v4 setObject:v17 forKey:v18];

    if ((*(unsigned char *)(a1 + 32) & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  uint64_t v12 = *(int *)(a1 + 24);
  if (v12 >= 0x1C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E53F8118[v12];
  }
  if (a2) {
    v15 = @"lineType";
  }
  else {
    v15 = @"line_type";
  }
  [v4 setObject:v13 forKey:v15];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 4) != 0) {
    goto LABEL_25;
  }
LABEL_4:
  if (v5)
  {
LABEL_5:
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    if (a2) {
      v7 = @"distanceToDestination";
    }
    else {
      v7 = @"distance_to_destination";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = [(id)a1 navCameraState];
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"navCameraState";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"nav_camera_state";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_17:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateNavigation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateNavigation)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateNavigation *)-[GEOLogMsgStateNavigation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_107;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_107;
  }
  if (a3) {
    v6 = @"lineType";
  }
  else {
    v6 = @"line_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_LINE_TYPE"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"PEDESTRIAN_PATH"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"PRIVATE_PATH"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"MINOR_ROAD"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"LOCAL_ROAD"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"LOCAL_MAJOR_ROAD"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"CONNECTOR_ROAD"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"HIGHWAY"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"MAJOR_HIGHWAY"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"FREEWAY_CONTROLLED"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"FREEWAY_UNCONTROLLED"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"FERRY"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"WATER"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"SPUTNIK_BORDER"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"PARKING_STRUCTURE"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"PEDESTRIAN_ROAD"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"TRANSIT_TRANSFER"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"PEDESTRIAN_OVERPASS"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"PEDESTRIAN_OVERPASS_STEPS"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"PEDESTRIAN_OVERPASS_RAMP"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"PEDESTRIAN_UNDERPASS"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"PEDESTRIAN_UNDERPASS_STEPS"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"PEDESTRIAN_UNDERPASS_RAMP"])
    {
      uint64_t v9 = 22;
    }
    else if ([v8 isEqualToString:@"SERVICE_ROAD"])
    {
      uint64_t v9 = 23;
    }
    else if ([v8 isEqualToString:@"GATE"])
    {
      uint64_t v9 = 24;
    }
    else if ([v8 isEqualToString:@"PARKING_LOT_ROAD"])
    {
      uint64_t v9 = 25;
    }
    else if ([v8 isEqualToString:@"TRANSIT_STATION_GRAPH"])
    {
      uint64_t v9 = 26;
    }
    else if ([v8 isEqualToString:@"HIDDEN"])
    {
      uint64_t v9 = 27;
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
      goto LABEL_68;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setLineType:v9];
LABEL_68:

  if (a3) {
    v10 = @"navState";
  }
  else {
    v10 = @"nav_state";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"NOT_NAVIGATING"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"PROCEEDING_TO_ROUTE"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"ON_ROUTE"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"OFF_ROUTE"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"BAD_ROUTE"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"RECALCULATING"])
    {
      uint64_t v13 = 5;
    }
    else if ([v12 isEqualToString:@"END_OF_ROUTE"])
    {
      uint64_t v13 = 6;
    }
    else if ([v12 isEqualToString:@"END_OF_SEGMENT"])
    {
      uint64_t v13 = 7;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_92;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_92:
    [a1 setNavState:v13];
  }

  if (a3) {
    v14 = @"distanceToDestination";
  }
  else {
    v14 = @"distance_to_destination";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 doubleValue];
    objc_msgSend(a1, "setDistanceToDestination:");
  }

  if (a3) {
    uint64_t v16 = @"navCameraState";
  }
  else {
    uint64_t v16 = @"nav_camera_state";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEONavCameraState alloc];
    if (a3) {
      uint64_t v19 = [(GEONavCameraState *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEONavCameraState *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [a1 setNavCameraState:v19];
  }
LABEL_107:

  return a1;
}

- (GEOLogMsgStateNavigation)initWithJSON:(id)a3
{
  return (GEOLogMsgStateNavigation *)-[GEOLogMsgStateNavigation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateNavigationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateNavigationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_navCameraState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOLogMsgStateNavigation *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_lineType;
    *((unsigned char *)v6 + 32) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 7) = self->_navState;
  *((unsigned char *)v6 + 32) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *((void *)v6 + 1) = *(void *)&self->_distanceToDestination;
    *((unsigned char *)v6 + 32) |= 1u;
  }
LABEL_5:
  if (self->_navCameraState)
  {
    objc_msgSend(v6, "setNavCameraState:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_navState;
    *(unsigned char *)(v5 + 32) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_lineType;
  *(unsigned char *)(v5 + 32) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_distanceToDestination;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
LABEL_5:
  id v8 = [(GEONavCameraState *)self->_navCameraState copyWithZone:a3];
  uint64_t v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOLogMsgStateNavigation *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_lineType != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_navState != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_distanceToDestination != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  navCameraState = self->_navCameraState;
  if ((unint64_t)navCameraState | *((void *)v4 + 2)) {
    char v6 = -[GEONavCameraState isEqual:](navCameraState, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateNavigation *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(GEONavCameraState *)self->_navCameraState hash];
  }
  uint64_t v3 = 2654435761 * self->_lineType;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_navState;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double distanceToDestination = self->_distanceToDestination;
  double v6 = -distanceToDestination;
  if (distanceToDestination >= 0.0) {
    double v6 = self->_distanceToDestination;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ [(GEONavCameraState *)self->_navCameraState hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 32);
  if ((v5 & 2) != 0)
  {
    self->_lineType = *((_DWORD *)v8 + 6);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v8 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v8 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_navState = *((_DWORD *)v8 + 7);
  *(unsigned char *)&self->_flags |= 4u;
  if (*((unsigned char *)v8 + 32))
  {
LABEL_4:
    self->_double distanceToDestination = *((double *)v8 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
  navCameraState = self->_navCameraState;
  uint64_t v7 = *((void *)v8 + 2);
  if (navCameraState)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEONavCameraState mergeFrom:](navCameraState, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOLogMsgStateNavigation setNavCameraState:](self, "setNavCameraState:");
  }
  uint64_t v4 = v8;
LABEL_14:
}

- (void).cxx_destruct
{
}

@end