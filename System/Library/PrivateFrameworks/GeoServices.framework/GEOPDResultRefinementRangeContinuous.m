@interface GEOPDResultRefinementRangeContinuous
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementRangeContinuous)init;
- (GEOPDResultRefinementRangeContinuous)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementRangeContinuous

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    *(unsigned char *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementRangeContinuous readAll:](a1, 0);
      -[GEOPDResultRefinementRangeElement clearUnknownFields:](*(void *)(a1 + 48), 1);
      uint64_t v5 = *(void *)(a1 + 40);
      -[GEOPDResultRefinementRangeElement clearUnknownFields:](v5, 1);
    }
  }
}

- (GEOPDResultRefinementRangeContinuous)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementRangeContinuous;
  v2 = [(GEOPDResultRefinementRangeContinuous *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementRangeContinuous)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementRangeContinuous;
  v3 = [(GEOPDResultRefinementRangeContinuous *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementRangeContinuous;
  v4 = [(GEOPDResultRefinementRangeContinuous *)&v8 description];
  uint64_t v5 = [(GEOPDResultRefinementRangeContinuous *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementRangeContinuous _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_29;
  }
  -[GEOPDResultRefinementRangeContinuous readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 8);
    if (v5)
    {
      id v6 = v5;
      objc_sync_enter(v6);
      GEOPDResultRefinementRangeContinuousReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readElementMinimum_tags);
      objc_sync_exit(v6);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  id v7 = *(id *)(a1 + 48);
  objc_super v8 = v7;
  if (v7)
  {
    if (a2)
    {
      v9 = [v7 jsonRepresentation];
      v10 = @"elementMinimum";
    }
    else
    {
      v9 = [v7 dictionaryRepresentation];
      v10 = @"element_minimum";
    }
    [v4 setObject:v9 forKey:v10];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      id v12 = v11;
      objc_sync_enter(v12);
      GEOPDResultRefinementRangeContinuousReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readElementMaximum_tags);
      objc_sync_exit(v12);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  id v13 = *(id *)(a1 + 40);
  v14 = v13;
  if (v13)
  {
    if (a2)
    {
      v15 = [v13 jsonRepresentation];
      v16 = @"elementMaximum";
    }
    else
    {
      v15 = [v13 dictionaryRepresentation];
      v16 = @"element_maximum";
    }
    [v4 setObject:v15 forKey:v16];
  }
  char v17 = *(unsigned char *)(a1 + 76);
  if ((v17 & 4) != 0)
  {
    v27 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    [v4 setObject:v27 forKey:@"increment"];

    char v17 = *(unsigned char *)(a1 + 76);
    if ((v17 & 2) == 0)
    {
LABEL_20:
      if ((v17 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)(a1 + 76) & 2) == 0)
  {
    goto LABEL_20;
  }
  v28 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v29 = @"currentMinValue";
  }
  else {
    v29 = @"current_min_value";
  }
  [v4 setObject:v28 forKey:v29];

  if (*(unsigned char *)(a1 + 76))
  {
LABEL_21:
    v18 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v19 = @"currentMaxValue";
    }
    else {
      v19 = @"current_max_value";
    }
    [v4 setObject:v18 forKey:v19];
  }
LABEL_25:
  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    v21 = [v20 dictionaryRepresentation];
    v22 = v21;
    if (a2)
    {
      v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __66__GEOPDResultRefinementRangeContinuous__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E53D8860;
      id v24 = v23;
      id v31 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v30];
      id v25 = v24;

      v22 = v25;
    }
    [v4 setObject:v22 forKey:@"Unknown Fields"];
  }
LABEL_29:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementRangeContinuous _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1056;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1057;
      }
      GEOPDResultRefinementRangeContinuousReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDResultRefinementRangeElement readAll:](*(void *)(a1 + 48), 1);
      -[GEOPDResultRefinementRangeElement readAll:](*(void *)(a1 + 40), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __66__GEOPDResultRefinementRangeContinuous__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementRangeContinuousReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader || _GEOPDResultRefinementRangeContinuousIsDirty((uint64_t)self))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)self, 0);
    if (self->_elementMinimum) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (self->_elementMaximum)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v9;
      char flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_9:
        if ((flags & 1) == 0)
        {
LABEL_11:
          [(PBUnknownFields *)self->_unknownFields writeTo:v5];
          goto LABEL_16;
        }
LABEL_10:
        PBDataWriterWriteDoubleField();
        id v5 = v9;
        goto LABEL_11;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      goto LABEL_9;
    }
    PBDataWriterWriteDoubleField();
    id v5 = v9;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v7 = self->_reader;
  objc_sync_enter(v7);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v9 writeData:v8];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v7);
LABEL_16:
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
    -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)self, 0);
    id v9 = [(GEOPDResultRefinementRangeElement *)self->_elementMinimum copyWithZone:a3];
    id v10 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v9;

    id v11 = [(GEOPDResultRefinementRangeElement *)self->_elementMaximum copyWithZone:a3];
    id v12 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v11;

    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(double *)(v5 + 56) = self->_increment;
      *(unsigned char *)(v5 + 76) |= 4u;
      char flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
        {
LABEL_9:
          v14 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v14;
          goto LABEL_10;
        }
LABEL_8:
        *(double *)(v5 + 24) = self->_currentMaxValue;
        *(unsigned char *)(v5 + 76) |= 1u;
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 32) = self->_currentMinValue;
    *(unsigned char *)(v5 + 76) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDResultRefinementRangeContinuousReadAllFrom(v5, self->_reader, 0);
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
    goto LABEL_20;
  }
  -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)v4, 1);
  elementMinimum = self->_elementMinimum;
  if ((unint64_t)elementMinimum | *((void *)v4 + 6))
  {
    if (!-[GEOPDResultRefinementRangeElement isEqual:](elementMinimum, "isEqual:")) {
      goto LABEL_20;
    }
  }
  elementMaximum = self->_elementMaximum;
  if ((unint64_t)elementMaximum | *((void *)v4 + 5))
  {
    if (!-[GEOPDResultRefinementRangeElement isEqual:](elementMaximum, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_increment != *((double *)v4 + 7)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
LABEL_20:
    BOOL v7 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_currentMinValue != *((double *)v4 + 4)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v7 = (*((unsigned char *)v4 + 76) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_currentMaxValue != *((double *)v4 + 3)) {
      goto LABEL_20;
    }
    BOOL v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDResultRefinementRangeElement *)self->_elementMinimum hash];
  unint64_t v4 = [(GEOPDResultRefinementRangeElement *)self->_elementMaximum hash];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    double increment = self->_increment;
    double v8 = -increment;
    if (increment >= 0.0) {
      double v8 = self->_increment;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((flags & 2) != 0)
  {
    double currentMinValue = self->_currentMinValue;
    double v13 = -currentMinValue;
    if (currentMinValue >= 0.0) {
      double v13 = self->_currentMinValue;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if (flags)
  {
    double currentMaxValue = self->_currentMaxValue;
    double v18 = -currentMaxValue;
    if (currentMaxValue >= 0.0) {
      double v18 = self->_currentMaxValue;
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
  return v4 ^ v3 ^ v6 ^ v11 ^ v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementMinimum, 0);
  objc_storeStrong((id *)&self->_elementMaximum, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end