@interface GEORPFeedbackRouteStep
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDirectionsResponseWaypointIndex;
- (BOOL)hasRouteLegIndex;
- (BOOL)hasRouteStepImageId;
- (BOOL)hasStepId;
- (BOOL)hasUserPhotoId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackRouteStep)init;
- (GEORPFeedbackRouteStep)initWithData:(id)a3;
- (GEORPFeedbackRouteStep)initWithDictionary:(id)a3;
- (GEORPFeedbackRouteStep)initWithJSON:(id)a3;
- (NSString)routeStepImageId;
- (NSString)userPhotoId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)directionsResponseWaypointIndex;
- (int)routeLegIndex;
- (unint64_t)hash;
- (unsigned)stepId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readRouteStepImageId;
- (void)_readUserPhotoId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDirectionsResponseWaypointIndex:(int)a3;
- (void)setHasDirectionsResponseWaypointIndex:(BOOL)a3;
- (void)setHasRouteLegIndex:(BOOL)a3;
- (void)setHasStepId:(BOOL)a3;
- (void)setRouteLegIndex:(int)a3;
- (void)setRouteStepImageId:(id)a3;
- (void)setStepId:(unsigned int)a3;
- (void)setUserPhotoId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackRouteStep

- (GEORPFeedbackRouteStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackRouteStep;
  v2 = [(GEORPFeedbackRouteStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackRouteStep)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackRouteStep;
  v3 = [(GEORPFeedbackRouteStep *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)directionsResponseWaypointIndex
{
  return self->_directionsResponseWaypointIndex;
}

- (void)setDirectionsResponseWaypointIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_directionsResponseWaypointIndex = a3;
}

- (void)setHasDirectionsResponseWaypointIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasDirectionsResponseWaypointIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)routeLegIndex
{
  return self->_routeLegIndex;
}

- (void)setRouteLegIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_routeLegIndex = a3;
}

- (void)setHasRouteLegIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRouteLegIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)stepId
{
  return self->_stepId;
}

- (void)setStepId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_stepId = a3;
}

- (void)setHasStepId:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStepId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readRouteStepImageId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRouteStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteStepImageId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasRouteStepImageId
{
  return self->_routeStepImageId != 0;
}

- (NSString)routeStepImageId
{
  -[GEORPFeedbackRouteStep _readRouteStepImageId]((uint64_t)self);
  routeStepImageId = self->_routeStepImageId;

  return routeStepImageId;
}

- (void)setRouteStepImageId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_routeStepImageId, a3);
}

- (void)_readUserPhotoId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRouteStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserPhotoId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasUserPhotoId
{
  return self->_userPhotoId != 0;
}

- (NSString)userPhotoId
{
  -[GEORPFeedbackRouteStep _readUserPhotoId]((uint64_t)self);
  userPhotoId = self->_userPhotoId;

  return userPhotoId;
}

- (void)setUserPhotoId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_userPhotoId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackRouteStep;
  v4 = [(GEORPFeedbackRouteStep *)&v8 description];
  v5 = [(GEORPFeedbackRouteStep *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackRouteStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_20;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 56) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_27:
    v15 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    if (a2) {
      v16 = @"routeLegIndex";
    }
    else {
      v16 = @"route_leg_index";
    }
    [v4 setObject:v15 forKey:v16];

    if ((*(unsigned char *)(a1 + 56) & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  if (a2) {
    v14 = @"directionsResponseWaypointIndex";
  }
  else {
    v14 = @"directions_response_waypoint_index";
  }
  [v4 setObject:v13 forKey:v14];

  char v5 = *(unsigned char *)(a1 + 56);
  if ((v5 & 2) != 0) {
    goto LABEL_27;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
    if (a2) {
      objc_super v7 = @"stepId";
    }
    else {
      objc_super v7 = @"step_id";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = [(id)a1 routeStepImageId];
  if (v8)
  {
    if (a2) {
      v9 = @"routeStepImageId";
    }
    else {
      v9 = @"route_step_image_id";
    }
    [v4 setObject:v8 forKey:v9];
  }

  v10 = [(id)a1 userPhotoId];
  if (v10)
  {
    if (a2) {
      v11 = @"userPhotoId";
    }
    else {
      v11 = @"user_photo_id";
    }
    [v4 setObject:v10 forKey:v11];
  }

LABEL_20:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackRouteStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackRouteStep)initWithDictionary:(id)a3
{
  return (GEORPFeedbackRouteStep *)-[GEORPFeedbackRouteStep _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"directionsResponseWaypointIndex";
      }
      else {
        objc_super v6 = @"directions_response_waypoint_index";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDirectionsResponseWaypointIndex:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        objc_super v8 = @"routeLegIndex";
      }
      else {
        objc_super v8 = @"route_leg_index";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRouteLegIndex:", objc_msgSend(v9, "intValue"));
      }

      if (a3) {
        v10 = @"stepId";
      }
      else {
        v10 = @"step_id";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStepId:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        v12 = @"routeStepImageId";
      }
      else {
        v12 = @"route_step_image_id";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setRouteStepImageId:v14];
      }
      if (a3) {
        v15 = @"userPhotoId";
      }
      else {
        v15 = @"user_photo_id";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[v16 copy];
        [a1 setUserPhotoId:v17];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackRouteStep)initWithJSON:(id)a3
{
  return (GEORPFeedbackRouteStep *)-[GEORPFeedbackRouteStep _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_864;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_865;
    }
    GEORPFeedbackRouteStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackRouteStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackRouteStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x38) == 0)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_15;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackRouteStep *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
LABEL_12:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_12;
  }
LABEL_5:
  if ((flags & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_routeStepImageId) {
    PBDataWriterWriteStringField();
  }
  if (self->_userPhotoId) {
    PBDataWriterWriteStringField();
  }
LABEL_15:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORPFeedbackRouteStep *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 8) = self->_readerMarkPos;
  *((_DWORD *)v6 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 11) = self->_directionsResponseWaypointIndex;
    *((unsigned char *)v6 + 56) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 12) = self->_routeLegIndex;
  *((unsigned char *)v6 + 56) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 13) = self->_stepId;
    *((unsigned char *)v6 + 56) |= 4u;
  }
LABEL_5:
  if (self->_routeStepImageId)
  {
    objc_msgSend(v6, "setRouteStepImageId:");
    v4 = v6;
  }
  if (self->_userPhotoId)
  {
    objc_msgSend(v6, "setUserPhotoId:");
    v4 = v6;
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
    [(GEORPFeedbackRouteStep *)self readAll:0];
    char flags = (char)self->_flags;
    if (flags)
    {
      *(_DWORD *)(v5 + 44) = self->_directionsResponseWaypointIndex;
      *(unsigned char *)(v5 + 56) |= 1u;
      char flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_7:
        if ((flags & 4) == 0)
        {
LABEL_9:
          uint64_t v10 = [(NSString *)self->_routeStepImageId copyWithZone:a3];
          v11 = *(void **)(v5 + 16);
          *(void *)(v5 + 16) = v10;

          uint64_t v12 = [(NSString *)self->_userPhotoId copyWithZone:a3];
          id v8 = *(id *)(v5 + 24);
          *(void *)(v5 + 24) = v12;
          goto LABEL_10;
        }
LABEL_8:
        *(_DWORD *)(v5 + 52) = self->_stepId;
        *(unsigned char *)(v5 + 56) |= 4u;
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 48) = self->_routeLegIndex;
    *(unsigned char *)(v5 + 56) |= 2u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackRouteStepReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEORPFeedbackRouteStep *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_directionsResponseWaypointIndex != *((_DWORD *)v4 + 11)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_routeLegIndex != *((_DWORD *)v4 + 12)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_stepId != *((_DWORD *)v4 + 13)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_21;
  }
  routeStepImageId = self->_routeStepImageId;
  if ((unint64_t)routeStepImageId | *((void *)v4 + 2)
    && !-[NSString isEqual:](routeStepImageId, "isEqual:"))
  {
    goto LABEL_21;
  }
  userPhotoId = self->_userPhotoId;
  if ((unint64_t)userPhotoId | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](userPhotoId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPFeedbackRouteStep *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_directionsResponseWaypointIndex;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_routeLegIndex;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_stepId;
LABEL_8:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_routeStepImageId hash];
  return v6 ^ [(NSString *)self->_userPhotoId hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  uint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 56);
  if (v5)
  {
    self->_directionsResponseWaypointIndex = *((_DWORD *)v6 + 11);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v6 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v6 + 56) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_routeLegIndex = *((_DWORD *)v6 + 12);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v6 + 56) & 4) != 0)
  {
LABEL_4:
    self->_stepId = *((_DWORD *)v6 + 13);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
  if (*((void *)v6 + 2))
  {
    [(GEORPFeedbackRouteStep *)self setRouteStepImageId:"setRouteStepImageId:"];
    uint64_t v4 = v6;
  }
  if (v4[3])
  {
    -[GEORPFeedbackRouteStep setUserPhotoId:](self, "setUserPhotoId:");
    uint64_t v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPhotoId, 0);
  objc_storeStrong((id *)&self->_routeStepImageId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end