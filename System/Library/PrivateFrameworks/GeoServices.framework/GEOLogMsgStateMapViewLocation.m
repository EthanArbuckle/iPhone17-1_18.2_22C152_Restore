@interface GEOLogMsgStateMapViewLocation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsCurrentLocationInViewport;
- (BOOL)hasLocationBucket;
- (BOOL)hasTouristInfo;
- (BOOL)isCurrentLocationInViewport;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateMapViewLocation)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapViewLocation)initWithJSON:(id)a3;
- (GEOTouristInfo)touristInfo;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)locationBucketAsString:(int)a3;
- (int)StringAsLocationBucket:(id)a3;
- (int)locationBucket;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsCurrentLocationInViewport:(BOOL)a3;
- (void)setHasLocationBucket:(BOOL)a3;
- (void)setIsCurrentLocationInViewport:(BOOL)a3;
- (void)setLocationBucket:(int)a3;
- (void)setTouristInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapViewLocation

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
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
  if (self->_touristInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (int)locationBucket
{
  if (*(unsigned char *)&self->_flags) {
    return self->_locationBucket;
  }
  else {
    return 0;
  }
}

- (void)setLocationBucket:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_locationBucket = a3;
}

- (void)setHasLocationBucket:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLocationBucket
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)locationBucketAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F80C0[a3];
  }

  return v3;
}

- (int)StringAsLocationBucket:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_BUCKET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEAR_BUCKET"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAR_BUCKET"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isCurrentLocationInViewport
{
  return self->_isCurrentLocationInViewport;
}

- (void)setIsCurrentLocationInViewport:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isCurrentLocationInViewport = a3;
}

- (void)setHasIsCurrentLocationInViewport:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsCurrentLocationInViewport
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasTouristInfo
{
  return self->_touristInfo != 0;
}

- (GEOTouristInfo)touristInfo
{
  return self->_touristInfo;
}

- (void)setTouristInfo:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapViewLocation;
  int v4 = [(GEOLogMsgStateMapViewLocation *)&v8 description];
  v5 = [(GEOLogMsgStateMapViewLocation *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapViewLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 16);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F80C0[v6];
      }
      if (a2) {
        objc_super v8 = @"locationBucket";
      }
      else {
        objc_super v8 = @"location_bucket";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
      if (a2) {
        v10 = @"isCurrentLocationInViewport";
      }
      else {
        v10 = @"is_current_location_in_viewport";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 touristInfo];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"touristInfo";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"tourist_info";
      }
      [v4 setObject:v13 forKey:v14];
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
  return -[GEOLogMsgStateMapViewLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapViewLocation)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapViewLocation *)-[GEOLogMsgStateMapViewLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_32;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_32;
  }
  if (a3) {
    uint64_t v6 = @"locationBucket";
  }
  else {
    uint64_t v6 = @"location_bucket";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_BUCKET"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"NEAR_BUCKET"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"FAR_BUCKET"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_17:
    [a1 setLocationBucket:v9];
  }

  if (a3) {
    v10 = @"isCurrentLocationInViewport";
  }
  else {
    v10 = @"is_current_location_in_viewport";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsCurrentLocationInViewport:", objc_msgSend(v11, "BOOLValue"));
  }

  if (a3) {
    v12 = @"touristInfo";
  }
  else {
    v12 = @"tourist_info";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOTouristInfo alloc];
    if (a3) {
      uint64_t v15 = [(GEOTouristInfo *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOTouristInfo *)v14 initWithDictionary:v13];
    }
    v16 = (void *)v15;
    [a1 setTouristInfo:v15];
  }
LABEL_32:

  return a1;
}

- (GEOLogMsgStateMapViewLocation)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapViewLocation *)-[GEOLogMsgStateMapViewLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapViewLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapViewLocationReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOLogMsgStateMapViewLocation *)self readAll:0];
  int v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 4) = self->_locationBucket;
    *((unsigned char *)v6 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v6 + 20) = self->_isCurrentLocationInViewport;
    *((unsigned char *)v6 + 24) |= 2u;
  }
  if (self->_touristInfo)
  {
    objc_msgSend(v6, "setTouristInfo:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_locationBucket;
    *(unsigned char *)(v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 20) = self->_isCurrentLocationInViewport;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  id v8 = [(GEOTouristInfo *)self->_touristInfo copyWithZone:a3];
  uint64_t v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOLogMsgStateMapViewLocation *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_locationBucket != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    char v5 = 0;
    goto LABEL_12;
  }
  if ((*((unsigned char *)v4 + 24) & 2) == 0) {
    goto LABEL_11;
  }
  if (!self->_isCurrentLocationInViewport)
  {
    if (!*((unsigned char *)v4 + 20)) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (!*((unsigned char *)v4 + 20)) {
    goto LABEL_11;
  }
LABEL_17:
  touristInfo = self->_touristInfo;
  if ((unint64_t)touristInfo | *((void *)v4 + 1)) {
    char v5 = -[GEOTouristInfo isEqual:](touristInfo, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMapViewLocation *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_locationBucket;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(GEOTouristInfo *)self->_touristInfo hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_isCurrentLocationInViewport;
  return v4 ^ v3 ^ [(GEOTouristInfo *)self->_touristInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 24);
  if (v5)
  {
    self->_locationBucket = *((_DWORD *)v8 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v8 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_isCurrentLocationInViewport = *((unsigned char *)v8 + 20);
    *(unsigned char *)&self->_flags |= 2u;
  }
  touristInfo = self->_touristInfo;
  uint64_t v7 = *((void *)v8 + 1);
  if (touristInfo)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOTouristInfo mergeFrom:](touristInfo, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOLogMsgStateMapViewLocation setTouristInfo:](self, "setTouristInfo:");
  }
  uint64_t v4 = v8;
LABEL_11:
}

@end