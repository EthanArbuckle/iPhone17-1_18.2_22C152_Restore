@interface GEOLogMsgEventTileSetState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDurationInOldState;
- (BOOL)hasNewCoverage;
- (BOOL)hasOldCoverage;
- (BOOL)hasTileSetStateType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventTileSetState)initWithDictionary:(id)a3;
- (GEOLogMsgEventTileSetState)initWithJSON:(id)a3;
- (double)durationInOldState;
- (double)newCoverage;
- (double)oldCoverage;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)tileSetStateTypeAsString:(int)a3;
- (int)StringAsTileSetStateType:(id)a3;
- (int)tileSetStateType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationInOldState:(double)a3;
- (void)setHasDurationInOldState:(BOOL)a3;
- (void)setHasNewCoverage:(BOOL)a3;
- (void)setHasOldCoverage:(BOOL)a3;
- (void)setHasTileSetStateType:(BOOL)a3;
- (void)setNewCoverage:(double)a3;
- (void)setOldCoverage:(double)a3;
- (void)setTileSetStateType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventTileSetState

- (double)durationInOldState
{
  return self->_durationInOldState;
}

- (void)setDurationInOldState:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_durationInOldState = a3;
}

- (void)setHasDurationInOldState:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDurationInOldState
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)tileSetStateType
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_tileSetStateType;
  }
  else {
    return 0;
  }
}

- (void)setTileSetStateType:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_tileSetStateType = a3;
}

- (void)setHasTileSetStateType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTileSetStateType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)tileSetStateTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7CF0[a3];
  }

  return v3;
}

- (int)StringAsTileSetStateType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TILE_SET_STATE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TILE_GRID_COVERAGE_CHANGED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TILE_LOADED_COVERAGE_CHANGED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)oldCoverage
{
  return self->_oldCoverage;
}

- (void)setOldCoverage:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_oldCoverage = a3;
}

- (void)setHasOldCoverage:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasOldCoverage
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)newCoverage
{
  return self->_newCoverage;
}

- (void)setNewCoverage:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_newCoverage = a3;
}

- (void)setHasNewCoverage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNewCoverage
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventTileSetState;
  int v4 = [(GEOLogMsgEventTileSetState *)&v8 description];
  v5 = [(GEOLogMsgEventTileSetState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTileSetState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_26;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 36);
  if (v5)
  {
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    if (a2) {
      v7 = @"durationInOldState";
    }
    else {
      v7 = @"duration_in_old_state";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_18:
      v11 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v12 = @"oldCoverage";
      }
      else {
        v12 = @"old_coverage";
      }
      [v4 setObject:v11 forKey:v12];

      if ((*(unsigned char *)(a1 + 36) & 2) == 0) {
        goto LABEL_26;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)(a1 + 36) & 8) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v8 = *(int *)(a1 + 32);
  if (v8 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E53F7CF0[v8];
  }
  if (a2) {
    v10 = @"tileSetStateType";
  }
  else {
    v10 = @"tile_set_state_type";
  }
  [v4 setObject:v9 forKey:v10];

  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 4) != 0) {
    goto LABEL_18;
  }
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_22:
    v13 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    if (a2) {
      v14 = @"newCoverage";
    }
    else {
      v14 = @"new_coverage";
    }
    [v4 setObject:v13 forKey:v14];
  }
LABEL_26:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventTileSetState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTileSetState)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTileSetState *)-[GEOLogMsgEventTileSetState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_34;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_34;
  }
  if (a3) {
    v6 = @"durationInOldState";
  }
  else {
    v6 = @"duration_in_old_state";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 doubleValue];
    objc_msgSend(a1, "setDurationInOldState:");
  }

  if (a3) {
    uint64_t v8 = @"tileSetStateType";
  }
  else {
    uint64_t v8 = @"tile_set_state_type";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"TILE_SET_STATE_TYPE_UNKNOWN"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"TILE_GRID_COVERAGE_CHANGED"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"TILE_LOADED_COVERAGE_CHANGED"])
    {
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v11 = 0;
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 intValue];
LABEL_22:
    [a1 setTileSetStateType:v11];
  }

  if (a3) {
    v12 = @"oldCoverage";
  }
  else {
    v12 = @"old_coverage";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    objc_msgSend(a1, "setOldCoverage:");
  }

  if (a3) {
    v14 = @"newCoverage";
  }
  else {
    v14 = @"new_coverage";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 doubleValue];
    objc_msgSend(a1, "setNewCoverage:");
  }

LABEL_34:
  return a1;
}

- (GEOLogMsgEventTileSetState)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTileSetState *)-[GEOLogMsgEventTileSetState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTileSetStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTileSetStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventTileSetState *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[1] = *(void *)&self->_durationInOldState;
    *((unsigned char *)v5 + 36) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = self->_tileSetStateType;
  *((unsigned char *)v5 + 36) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[3] = *(void *)&self->_oldCoverage;
  *((unsigned char *)v5 + 36) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_5:
    v5[2] = *(void *)&self->_newCoverage;
    *((unsigned char *)v5 + 36) |= 2u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)result + 1) = *(void *)&self->_durationInOldState;
    *((unsigned char *)result + 36) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_tileSetStateType;
  *((unsigned char *)result + 36) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 3) = *(void *)&self->_oldCoverage;
  *((unsigned char *)result + 36) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 2) = *(void *)&self->_newCoverage;
  *((unsigned char *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOLogMsgEventTileSetState *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_durationInOldState != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_tileSetStateType != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_oldCoverage != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_newCoverage != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventTileSetState *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    double durationInOldState = self->_durationInOldState;
    double v6 = -durationInOldState;
    if (durationInOldState >= 0.0) {
      double v6 = self->_durationInOldState;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((flags & 8) != 0)
  {
    uint64_t v9 = 2654435761 * self->_tileSetStateType;
    if ((flags & 4) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v14 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double oldCoverage = self->_oldCoverage;
  double v11 = -oldCoverage;
  if (oldCoverage >= 0.0) {
    double v11 = self->_oldCoverage;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((flags & 2) != 0)
  {
    double newCoverage = self->_newCoverage;
    double v17 = -newCoverage;
    if (newCoverage >= 0.0) {
      double v17 = self->_newCoverage;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 36);
  if (v4)
  {
    self->_double durationInOldState = *((double *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 36);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_tileSetStateType = *((_DWORD *)v5 + 8);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_double oldCoverage = *((double *)v5 + 3);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v5 + 36) & 2) != 0)
  {
LABEL_5:
    self->_double newCoverage = *((double *)v5 + 2);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_6:
}

@end