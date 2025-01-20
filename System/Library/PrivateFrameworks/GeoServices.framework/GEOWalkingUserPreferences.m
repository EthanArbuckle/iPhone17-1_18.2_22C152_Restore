@interface GEOWalkingUserPreferences
+ (BOOL)isValid:(id)a3;
- (BOOL)avoidBusyRoads;
- (BOOL)avoidHills;
- (BOOL)avoidStairs;
- (BOOL)hasAvoidBusyRoads;
- (BOOL)hasAvoidHills;
- (BOOL)hasAvoidStairs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWalkingUserPreferences)initWithDictionary:(id)a3;
- (GEOWalkingUserPreferences)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvoidBusyRoads:(BOOL)a3;
- (void)setAvoidHills:(BOOL)a3;
- (void)setAvoidStairs:(BOOL)a3;
- (void)setHasAvoidBusyRoads:(BOOL)a3;
- (void)setHasAvoidHills:(BOOL)a3;
- (void)setHasAvoidStairs:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWalkingUserPreferences

- (void)setAvoidStairs:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_avoidStairs = a3;
}

- (void)setAvoidHills:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_avoidHills = a3;
}

- (void)setAvoidBusyRoads:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_avoidBusyRoads = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_flags) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (BOOL)avoidStairs
{
  return self->_avoidStairs;
}

- (void)setHasAvoidStairs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAvoidStairs
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (void)setHasAvoidHills:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvoidHills
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (void)setHasAvoidBusyRoads:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAvoidBusyRoads
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWalkingUserPreferences;
  v4 = [(GEOWalkingUserPreferences *)&v8 description];
  id v5 = [(GEOWalkingUserPreferences *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWalkingUserPreferences _dictionaryRepresentation:]((uint64_t)self, 0);
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
  if ((v5 & 4) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 18)];
    if (a2) {
      v16 = @"avoidStairs";
    }
    else {
      v16 = @"avoid_stairs";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)(a1 + 20) & 2) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
  if (a2) {
    v18 = @"avoidHills";
  }
  else {
    v18 = @"avoid_hills";
  }
  [v4 setObject:v17 forKey:v18];

  if (*(unsigned char *)(a1 + 20))
  {
LABEL_5:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
    if (a2) {
      v7 = @"avoidBusyRoads";
    }
    else {
      v7 = @"avoid_busy_roads";
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
      v19[2] = __55__GEOWalkingUserPreferences__dictionaryRepresentation___block_invoke;
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
  return -[GEOWalkingUserPreferences _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOWalkingUserPreferences__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWalkingUserPreferences)initWithDictionary:(id)a3
{
  return (GEOWalkingUserPreferences *)-[GEOCyclingUserPreferences _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOWalkingUserPreferences)initWithJSON:(id)a3
{
  return (GEOWalkingUserPreferences *)-[GEOCyclingUserPreferences _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWalkingUserPreferencesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWalkingUserPreferencesReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOWalkingUserPreferences *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[18] = self->_avoidStairs;
    v5[20] |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[17] = self->_avoidHills;
  v5[20] |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    v5[16] = self->_avoidBusyRoads;
    v5[20] |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v4 + 17) = self->_avoidHills;
    *(unsigned char *)(v4 + 20) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v4 + 18) = self->_avoidStairs;
  *(unsigned char *)(v4 + 20) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(unsigned char *)(v4 + 16) = self->_avoidBusyRoads;
    *(unsigned char *)(v4 + 20) |= 1u;
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
  [(GEOWalkingUserPreferences *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[20] & 4) == 0) {
      goto LABEL_20;
    }
    if (self->_avoidStairs)
    {
      if (!v4[18]) {
        goto LABEL_20;
      }
    }
    else if (v4[18])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[20] & 4) != 0)
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0) {
      goto LABEL_20;
    }
    if (self->_avoidHills)
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
  BOOL v5 = (v4[20] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (v4[20])
    {
      if (self->_avoidBusyRoads)
      {
        if (!v4[16]) {
          goto LABEL_20;
        }
      }
      else if (v4[16])
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
  [(GEOWalkingUserPreferences *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
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
  uint64_t v3 = 2654435761 * self->_avoidStairs;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_avoidHills;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_avoidBusyRoads;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[20];
  if ((v4 & 4) != 0)
  {
    self->_avoidStairs = v5[18];
    *(unsigned char *)&self->_flags |= 4u;
    BOOL v4 = v5[20];
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if (!v4) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[20] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_avoidHills = v5[17];
  *(unsigned char *)&self->_flags |= 2u;
  if (v5[20])
  {
LABEL_4:
    self->_avoidBusyRoads = v5[16];
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOWalkingUserPreferences *)self readAll:0];
  }
}

@end