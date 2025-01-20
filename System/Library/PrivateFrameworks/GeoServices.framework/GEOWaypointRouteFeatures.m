@interface GEOWaypointRouteFeatures
+ (BOOL)isValid:(id)a3;
- (BOOL)avoidsHighways;
- (BOOL)avoidsTolls;
- (BOOL)avoidsTraffic;
- (BOOL)hasAvoidsHighways;
- (BOOL)hasAvoidsTolls;
- (BOOL)hasAvoidsTraffic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWaypointRouteFeatures)initWithDictionary:(id)a3;
- (GEOWaypointRouteFeatures)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvoidsHighways:(BOOL)a3;
- (void)setAvoidsTolls:(BOOL)a3;
- (void)setAvoidsTraffic:(BOOL)a3;
- (void)setHasAvoidsHighways:(BOOL)a3;
- (void)setHasAvoidsTolls:(BOOL)a3;
- (void)setHasAvoidsTraffic:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypointRouteFeatures

- (BOOL)avoidsTolls
{
  return self->_avoidsTolls;
}

- (void)setAvoidsTolls:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_avoidsTolls = a3;
}

- (void)setHasAvoidsTolls:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvoidsTolls
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)avoidsHighways
{
  return self->_avoidsHighways;
}

- (void)setAvoidsHighways:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_avoidsHighways = a3;
}

- (void)setHasAvoidsHighways:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAvoidsHighways
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)avoidsTraffic
{
  return self->_avoidsTraffic;
}

- (void)setAvoidsTraffic:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_avoidsTraffic = a3;
}

- (void)setHasAvoidsTraffic:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAvoidsTraffic
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointRouteFeatures;
  v4 = [(GEOWaypointRouteFeatures *)&v8 description];
  v5 = [(GEOWaypointRouteFeatures *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointRouteFeatures _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_13;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
    if (a2) {
      v16 = @"avoidsTolls";
    }
    else {
      v16 = @"avoids_tolls";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)(a1 + 20) & 1) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
  if (a2) {
    v18 = @"avoidsHighways";
  }
  else {
    v18 = @"avoids_highways";
  }
  [v4 setObject:v17 forKey:v18];

  if ((*(unsigned char *)(a1 + 20) & 4) != 0)
  {
LABEL_5:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 18)];
    if (a2) {
      v7 = @"avoidsTraffic";
    }
    else {
      v7 = @"avoids_traffic";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __54__GEOWaypointRouteFeatures__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v12 = v11;
      id v20 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v19];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_13:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointRouteFeatures _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOWaypointRouteFeatures__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOWaypointRouteFeatures)initWithDictionary:(id)a3
{
  return (GEOWaypointRouteFeatures *)-[GEOWaypointRouteFeatures _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"avoidsTolls";
      }
      else {
        v6 = @"avoids_tolls";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidsTolls:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"avoidsHighways";
      }
      else {
        objc_super v8 = @"avoids_highways";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidsHighways:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        id v10 = @"avoidsTraffic";
      }
      else {
        id v10 = @"avoids_traffic";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidsTraffic:", objc_msgSend(v11, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOWaypointRouteFeatures)initWithJSON:(id)a3
{
  return (GEOWaypointRouteFeatures *)-[GEOWaypointRouteFeatures _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointRouteFeaturesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointRouteFeaturesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOWaypointRouteFeatures *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[17] = self->_avoidsTolls;
    v5[20] |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[16] = self->_avoidsHighways;
  v5[20] |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    v5[18] = self->_avoidsTraffic;
    v5[20] |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v4 + 16) = self->_avoidsHighways;
    *(unsigned char *)(v4 + 20) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v4 + 17) = self->_avoidsTolls;
  *(unsigned char *)(v4 + 20) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v4 + 18) = self->_avoidsTraffic;
    *(unsigned char *)(v4 + 20) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOWaypointRouteFeatures *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0) {
      goto LABEL_20;
    }
    if (self->_avoidsTolls)
    {
      if (!v4[17]) {
        goto LABEL_20;
      }
    }
    else if (v4[17])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[20] & 2) != 0)
  {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[20] & 1) == 0) {
      goto LABEL_20;
    }
    if (self->_avoidsHighways)
    {
      if (!v4[16]) {
        goto LABEL_20;
      }
    }
    else if (v4[16])
    {
      goto LABEL_20;
    }
  }
  else if (v4[20])
  {
    goto LABEL_20;
  }
  BOOL v5 = (v4[20] & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[20] & 4) != 0)
    {
      if (self->_avoidsTraffic)
      {
        if (!v4[18]) {
          goto LABEL_20;
        }
      }
      else if (v4[18])
      {
        goto LABEL_20;
      }
      BOOL v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v5 = 0;
  }
LABEL_21:

  return v5;
}

- (unint64_t)hash
{
  [(GEOWaypointRouteFeatures *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_avoidsTolls;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_avoidsHighways;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_avoidsTraffic;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[20];
  if ((v4 & 2) != 0)
  {
    self->_avoidsTolls = v5[17];
    *(unsigned char *)&self->_flags |= 2u;
    BOOL v4 = v5[20];
    if (!v4)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v5[20])
  {
    goto LABEL_3;
  }
  self->_avoidsHighways = v5[16];
  *(unsigned char *)&self->_flags |= 1u;
  if ((v5[20] & 4) != 0)
  {
LABEL_4:
    self->_avoidsTraffic = v5[18];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOWaypointRouteFeatures *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end