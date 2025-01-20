@interface GEOPDCartoIconZoom
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCartoIconZoom

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCartoIconZoom;
  v4 = [(GEOPDCartoIconZoom *)&v8 description];
  v5 = [(GEOPDCartoIconZoom *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCartoIconZoom _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_41;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v6 = *(unsigned char *)(a1 + 40);
  if ((v6 & 4) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 24);
    v7 = [NSNumber numberWithFloat:v5];
    if (a2) {
      objc_super v8 = @"minZoom";
    }
    else {
      objc_super v8 = @"min_zoom";
    }
    [v4 setObject:v7 forKey:v8];

    char v6 = *(unsigned char *)(a1 + 40);
  }
  if ((v6 & 2) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 20);
    v9 = [NSNumber numberWithFloat:v5];
    if (a2) {
      v10 = @"maxZoom";
    }
    else {
      v10 = @"max_zoom";
    }
    [v4 setObject:v9 forKey:v10];

    char v6 = *(unsigned char *)(a1 + 40);
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 36);
  v11 = [NSNumber numberWithFloat:v5];
  if (a2) {
    v12 = @"popLowestMinZoom";
  }
  else {
    v12 = @"pop_lowest_min_zoom";
  }
  [v4 setObject:v11 forKey:v12];

  char v6 = *(unsigned char *)(a1 + 40);
  if ((v6 & 8) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0) {
      goto LABEL_11;
    }
LABEL_25:
    LODWORD(v5) = *(_DWORD *)(a1 + 32);
    v15 = [NSNumber numberWithFloat:v5];
    if (a2) {
      v16 = @"popHighestMinZoom";
    }
    else {
      v16 = @"pop_highest_min_zoom";
    }
    [v4 setObject:v15 forKey:v16];

    if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_29;
  }
LABEL_21:
  LODWORD(v5) = *(_DWORD *)(a1 + 28);
  v13 = [NSNumber numberWithFloat:v5];
  if (a2) {
    v14 = @"popDefaultMinZoom";
  }
  else {
    v14 = @"pop_default_min_zoom";
  }
  [v4 setObject:v13 forKey:v14];

  char v6 = *(unsigned char *)(a1 + 40);
  if ((v6 & 0x10) != 0) {
    goto LABEL_25;
  }
LABEL_11:
  if ((v6 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_29:
  unsigned int v17 = *(_DWORD *)(a1 + 16) + 9;
  if (v17 < 0xD && ((0x1FC1u >> v17) & 1) != 0)
  {
    v18 = off_1E53DCB40[v17];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a2) {
    v19 = @"cartoSignificance";
  }
  else {
    v19 = @"carto_significance";
  }
  [v4 setObject:v18 forKey:v19];

LABEL_37:
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    v21 = [v20 dictionaryRepresentation];
    v22 = v21;
    if (a2)
    {
      v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __48__GEOPDCartoIconZoom__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E53D8860;
      id v24 = v23;
      id v28 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v27];
      id v25 = v24;

      v22 = v25;
    }
    [v4 setObject:v22 forKey:@"Unknown Fields"];
  }
LABEL_41:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCartoIconZoom _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDCartoIconZoom__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"minZoom";
    }
    else {
      v7 = @"min_zoom";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      *(unsigned char *)(v6 + 40) |= 4u;
      *(_DWORD *)(v6 + 24) = v9;
    }

    if (a3) {
      id v10 = @"maxZoom";
    }
    else {
      id v10 = @"max_zoom";
    }
    v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      *(unsigned char *)(v6 + 40) |= 2u;
      *(_DWORD *)(v6 + 20) = v12;
    }

    if (a3) {
      v13 = @"popLowestMinZoom";
    }
    else {
      v13 = @"pop_lowest_min_zoom";
    }
    v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      *(unsigned char *)(v6 + 40) |= 0x20u;
      *(_DWORD *)(v6 + 36) = v15;
    }

    if (a3) {
      v16 = @"popDefaultMinZoom";
    }
    else {
      v16 = @"pop_default_min_zoom";
    }
    unsigned int v17 = [v5 objectForKeyedSubscript:v16];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      *(unsigned char *)(v6 + 40) |= 8u;
      *(_DWORD *)(v6 + 28) = v18;
    }

    if (a3) {
      v19 = @"popHighestMinZoom";
    }
    else {
      v19 = @"pop_highest_min_zoom";
    }
    v20 = [v5 objectForKeyedSubscript:v19];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      *(unsigned char *)(v6 + 40) |= 0x10u;
      *(_DWORD *)(v6 + 32) = v21;
    }

    if (a3) {
      v22 = @"cartoSignificance";
    }
    else {
      v22 = @"carto_significance";
    }
    v23 = [v5 objectForKeyedSubscript:v22];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v23;
      if ([v24 isEqualToString:@"SIGNIFICANCE_DEFAULT"])
      {
        int v25 = -9;
      }
      else if ([v24 isEqualToString:@"SIGNIFICANCE_EXTRA_EXTRA_LOW"])
      {
        int v25 = -3;
      }
      else if ([v24 isEqualToString:@"SIGNIFICANCE_EXTRA_LOW"])
      {
        int v25 = -2;
      }
      else if ([v24 isEqualToString:@"SIGNIFICANCE_LOW"])
      {
        int v25 = -1;
      }
      else if ([v24 isEqualToString:@"SIGNIFICANCE_MEDIUM"])
      {
        int v25 = 0;
      }
      else if ([v24 isEqualToString:@"SIGNIFICANCE_HIGH"])
      {
        int v25 = 1;
      }
      else if ([v24 isEqualToString:@"SIGNIFICANCE_EXTRA_HIGH"])
      {
        int v25 = 2;
      }
      else if ([v24 isEqualToString:@"SIGNIFICANCE_EXTRA_EXTRA_HIGH"])
      {
        int v25 = 3;
      }
      else
      {
        int v25 = -9;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_52:

        goto LABEL_53;
      }
      int v25 = [v23 intValue];
    }
    *(unsigned char *)(v6 + 40) |= 1u;
    *(_DWORD *)(v6 + 16) = v25;
    goto LABEL_52;
  }
LABEL_53:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCartoIconZoomReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteFloatField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteFloatField();
  if (*(unsigned char *)&self->_flags) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(float *)(v4 + 24) = self->_minZoom;
    *(unsigned char *)(v4 + 40) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 20) = self->_maxZoom;
  *(unsigned char *)(v4 + 40) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(float *)(v4 + 36) = self->_popLowestMinZoom;
  *(unsigned char *)(v4 + 40) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(float *)(v4 + 32) = self->_popHighestMinZoom;
    *(unsigned char *)(v4 + 40) |= 0x10u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(float *)(v4 + 28) = self->_popDefaultMinZoom;
  *(unsigned char *)(v4 + 40) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if (flags)
  {
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_cartoSignificance;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
LABEL_8:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_minZoom != *((float *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_maxZoom != *((float *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) == 0 || self->_popLowestMinZoom != *((float *)v4 + 9)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_popDefaultMinZoom != *((float *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_popHighestMinZoom != *((float *)v4 + 8)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_cartoSignificance != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    float minZoom = self->_minZoom;
    double v6 = minZoom;
    if (minZoom < 0.0) {
      double v6 = -minZoom;
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
  if ((flags & 2) != 0)
  {
    float maxZoom = self->_maxZoom;
    double v11 = maxZoom;
    if (maxZoom < 0.0) {
      double v11 = -maxZoom;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    float popLowestMinZoom = self->_popLowestMinZoom;
    double v16 = popLowestMinZoom;
    if (popLowestMinZoom < 0.0) {
      double v16 = -popLowestMinZoom;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((flags & 8) != 0)
  {
    float popDefaultMinZoom = self->_popDefaultMinZoom;
    double v21 = popDefaultMinZoom;
    if (popDefaultMinZoom < 0.0) {
      double v21 = -popDefaultMinZoom;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    float popHighestMinZoom = self->_popHighestMinZoom;
    double v26 = popHighestMinZoom;
    if (popHighestMinZoom < 0.0) {
      double v26 = -popHighestMinZoom;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if (flags) {
    uint64_t v29 = 2654435761 * self->_cartoSignificance;
  }
  else {
    uint64_t v29 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29;
}

- (void).cxx_destruct
{
}

@end