@interface GEOLogMsgStateRoutingWaypoints
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFinalWaypointId;
- (BOOL)hasOriginalNumberOfStops;
- (BOOL)hasOriginalWaypointId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateRoutingWaypoints)initWithDictionary:(id)a3;
- (GEOLogMsgStateRoutingWaypoints)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)finalWaypointId;
- (unsigned)originalNumberOfStops;
- (unsigned)originalWaypointId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFinalWaypointId:(unsigned int)a3;
- (void)setHasFinalWaypointId:(BOOL)a3;
- (void)setHasOriginalNumberOfStops:(BOOL)a3;
- (void)setHasOriginalWaypointId:(BOOL)a3;
- (void)setOriginalNumberOfStops:(unsigned int)a3;
- (void)setOriginalWaypointId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateRoutingWaypoints

- (unsigned)originalNumberOfStops
{
  return self->_originalNumberOfStops;
}

- (void)setOriginalNumberOfStops:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_originalNumberOfStops = a3;
}

- (void)setHasOriginalNumberOfStops:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOriginalNumberOfStops
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)originalWaypointId
{
  return self->_originalWaypointId;
}

- (void)setOriginalWaypointId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_originalWaypointId = a3;
}

- (void)setHasOriginalWaypointId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasOriginalWaypointId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)finalWaypointId
{
  return self->_finalWaypointId;
}

- (void)setFinalWaypointId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_finalWaypointId = a3;
}

- (void)setHasFinalWaypointId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFinalWaypointId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateRoutingWaypoints;
  v4 = [(GEOLogMsgStateRoutingWaypoints *)&v8 description];
  v5 = [(GEOLogMsgStateRoutingWaypoints *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateRoutingWaypoints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_18;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v9 = @"originalWaypointId";
    }
    else {
      v9 = @"original_waypoint_id";
    }
    [v4 setObject:v8 forKey:v9];

    if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
  if (a2) {
    v7 = @"originalNumberOfStops";
  }
  else {
    v7 = @"original_number_of_stops";
  }
  [v4 setObject:v6 forKey:v7];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 4) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if (v5)
  {
LABEL_14:
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
    if (a2) {
      v11 = @"finalWaypointId";
    }
    else {
      v11 = @"final_waypoint_id";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_18:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateRoutingWaypoints _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateRoutingWaypoints)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateRoutingWaypoints *)-[GEOLogMsgStateRoutingWaypoints _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"originalNumberOfStops";
      }
      else {
        v6 = @"original_number_of_stops";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOriginalNumberOfStops:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"originalWaypointId";
      }
      else {
        objc_super v8 = @"original_waypoint_id";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOriginalWaypointId:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"finalWaypointId";
      }
      else {
        v10 = @"final_waypoint_id";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFinalWaypointId:", objc_msgSend(v11, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateRoutingWaypoints)initWithJSON:(id)a3
{
  return (GEOLogMsgStateRoutingWaypoints *)-[GEOLogMsgStateRoutingWaypoints _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateRoutingWaypointsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateRoutingWaypointsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateRoutingWaypoints *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_originalNumberOfStops;
    *((unsigned char *)v5 + 20) |= 2u;
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
  v5[4] = self->_originalWaypointId;
  *((unsigned char *)v5 + 20) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    v5[2] = self->_finalWaypointId;
    *((unsigned char *)v5 + 20) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_originalNumberOfStops;
    *((unsigned char *)result + 20) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_originalWaypointId;
  *((unsigned char *)result + 20) |= 4u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_finalWaypointId;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOLogMsgStateRoutingWaypoints *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_originalNumberOfStops != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_originalWaypointId != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_finalWaypointId != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateRoutingWaypoints *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_originalNumberOfStops;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_originalWaypointId;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_finalWaypointId;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unsigned int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 2) != 0)
  {
    self->_originalNumberOfStops = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 20);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[5] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_originalWaypointId = v5[4];
  *(unsigned char *)&self->_flags |= 4u;
  if (v5[5])
  {
LABEL_4:
    self->_finalWaypointId = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
}

@end