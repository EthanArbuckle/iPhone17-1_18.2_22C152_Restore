@interface GEORPIncidentField
+ (BOOL)isValid:(id)a3;
- (BOOL)displayIncidentOnMap;
- (BOOL)hasDisplayIncidentOnMap;
- (BOOL)hasSiriType;
- (BOOL)hasTrafficType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPIncidentField)initWithDictionary:(id)a3;
- (GEORPIncidentField)initWithJSON:(id)a3;
- (NSString)siriType;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)trafficTypeAsString:(int)a3;
- (int)StringAsTrafficType:(id)a3;
- (int)trafficType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayIncidentOnMap:(BOOL)a3;
- (void)setHasDisplayIncidentOnMap:(BOOL)a3;
- (void)setHasTrafficType:(BOOL)a3;
- (void)setSiriType:(id)a3;
- (void)setTrafficType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPIncidentField

- (BOOL)hasSiriType
{
  return self->_siriType != 0;
}

- (NSString)siriType
{
  return self->_siriType;
}

- (void)setSiriType:(id)a3
{
}

- (int)trafficType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_trafficType;
  }
  else {
    return 0;
  }
}

- (void)setTrafficType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_trafficType = a3;
}

- (void)setHasTrafficType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTrafficType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)trafficTypeAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53EB2A0[a3];
  }

  return v3;
}

- (int)StringAsTrafficType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROAD_CLOSURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LANE_CLOSURE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEATHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EVENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ACCIDENT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HAZARD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ROADWORKS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RAMP_CLOSURE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TRAFFIC"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WALKING_CLOSURE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MANEUVER_CLOSURE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AREA_ADVISORY"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AREA_CLOSURE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CONGESTION_ZONE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPEED_CHECK"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"NO_THOROUGHFARE_CLOSURE"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)displayIncidentOnMap
{
  return (*(unsigned char *)&self->_flags & 2) == 0 || self->_displayIncidentOnMap;
}

- (void)setDisplayIncidentOnMap:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_displayIncidentOnMap = a3;
}

- (void)setHasDisplayIncidentOnMap:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDisplayIncidentOnMap
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPIncidentField;
  int v4 = [(GEORPIncidentField *)&v8 description];
  v5 = [(GEORPIncidentField *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 siriType];
    if (v5)
    {
      if (a2) {
        v6 = @"siriType";
      }
      else {
        v6 = @"siri_type";
      }
      [v4 setObject:v5 forKey:v6];
    }

    char v7 = *(unsigned char *)(a1 + 24);
    if (v7)
    {
      uint64_t v8 = *(int *)(a1 + 16);
      if (v8 >= 0x12)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53EB2A0[v8];
      }
      if (a2) {
        v10 = @"trafficType";
      }
      else {
        v10 = @"traffic_type";
      }
      [v4 setObject:v9 forKey:v10];

      char v7 = *(unsigned char *)(a1 + 24);
    }
    if ((v7 & 2) != 0)
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
      if (a2) {
        v12 = @"displayIncidentOnMap";
      }
      else {
        v12 = @"display_incident_on_map";
      }
      [v4 setObject:v11 forKey:v12];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPIncidentField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentField)initWithDictionary:(id)a3
{
  return (GEORPIncidentField *)-[GEORPIncidentField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_59;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_59;
  }
  if (a3) {
    v6 = @"siriType";
  }
  else {
    v6 = @"siri_type";
  }
  char v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (void *)[v7 copy];
    [a1 setSiriType:v8];
  }
  if (a3) {
    v9 = @"trafficType";
  }
  else {
    v9 = @"traffic_type";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"ROAD_CLOSURE"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"LANE_CLOSURE"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"WEATHER"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"EVENT"])
    {
      uint64_t v12 = 4;
    }
    else if ([v11 isEqualToString:@"ACCIDENT"])
    {
      uint64_t v12 = 5;
    }
    else if ([v11 isEqualToString:@"HAZARD"])
    {
      uint64_t v12 = 6;
    }
    else if ([v11 isEqualToString:@"ROADWORKS"])
    {
      uint64_t v12 = 7;
    }
    else if ([v11 isEqualToString:@"RAMP_CLOSURE"])
    {
      uint64_t v12 = 8;
    }
    else if ([v11 isEqualToString:@"OTHER"])
    {
      uint64_t v12 = 9;
    }
    else if ([v11 isEqualToString:@"TRAFFIC"])
    {
      uint64_t v12 = 10;
    }
    else if ([v11 isEqualToString:@"WALKING_CLOSURE"])
    {
      uint64_t v12 = 11;
    }
    else if ([v11 isEqualToString:@"MANEUVER_CLOSURE"])
    {
      uint64_t v12 = 12;
    }
    else if ([v11 isEqualToString:@"AREA_ADVISORY"])
    {
      uint64_t v12 = 13;
    }
    else if ([v11 isEqualToString:@"AREA_CLOSURE"])
    {
      uint64_t v12 = 14;
    }
    else if ([v11 isEqualToString:@"CONGESTION_ZONE"])
    {
      uint64_t v12 = 15;
    }
    else if ([v11 isEqualToString:@"SPEED_CHECK"])
    {
      uint64_t v12 = 16;
    }
    else if ([v11 isEqualToString:@"NO_THOROUGHFARE_CLOSURE"])
    {
      uint64_t v12 = 17;
    }
    else
    {
      uint64_t v12 = 0;
    }

    goto LABEL_52;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v10 intValue];
LABEL_52:
    [a1 setTrafficType:v12];
  }

  if (a3) {
    v13 = @"displayIncidentOnMap";
  }
  else {
    v13 = @"display_incident_on_map";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDisplayIncidentOnMap:", objc_msgSend(v14, "BOOLValue"));
  }

LABEL_59:
  return a1;
}

- (GEORPIncidentField)initWithJSON:(id)a3
{
  return (GEORPIncidentField *)-[GEORPIncidentField _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentFieldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_siriType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPIncidentField *)self readAll:0];
  if (self->_siriType) {
    objc_msgSend(v5, "setSiriType:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v5 + 4) = self->_trafficType;
    *((unsigned char *)v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 20) = self->_displayIncidentOnMap;
    *((unsigned char *)v5 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_siriType copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_trafficType;
    *(unsigned char *)(v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 20) = self->_displayIncidentOnMap;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPIncidentField *)self readAll:1];
  [v4 readAll:1];
  siriType = self->_siriType;
  if ((unint64_t)siriType | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](siriType, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_trafficType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_11;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0)
    {
LABEL_11:
      BOOL v6 = 0;
      goto LABEL_12;
    }
    if (self->_displayIncidentOnMap)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }
LABEL_12:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPIncidentField *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_siriType hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_trafficType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_displayIncidentOnMap;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 1)) {
    -[GEORPIncidentField setSiriType:](self, "setSiriType:");
  }
  char v4 = *((unsigned char *)v5 + 24);
  if (v4)
  {
    self->_trafficType = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_displayIncidentOnMap = *((unsigned char *)v5 + 20);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end