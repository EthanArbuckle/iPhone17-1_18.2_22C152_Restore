@interface GEOPDSSearchAutoRedoThreshold
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSSearchAutoRedoThreshold

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchAutoRedoThreshold;
  v4 = [(GEOPDSSearchAutoRedoThreshold *)&v8 description];
  v5 = [(GEOPDSSearchAutoRedoThreshold *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchAutoRedoThreshold _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_14;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 44);
  if ((v5 & 8) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    if (a2) {
      v16 = @"numberOfVisiblePoisThreshold";
    }
    else {
      v16 = @"number_of_visible_pois_threshold";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(a1 + 44) & 4) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v18 = @"zoomOutPercentThreshold";
  }
  else {
    v18 = @"zoom_out_percent_threshold";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_25:
  v19 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v20 = @"zoomInPercentThreshold";
  }
  else {
    v20 = @"zoom_in_percent_threshold";
  }
  [v4 setObject:v19 forKey:v20];

  if (*(unsigned char *)(a1 + 44))
  {
LABEL_6:
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    if (a2) {
      v7 = @"panDeltaThresholdInMeters";
    }
    else {
      v7 = @"pan_delta_threshold_in_meters";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_10:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __59__GEOPDSSearchAutoRedoThreshold__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v12 = v11;
      id v22 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v21];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_14:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSSearchAutoRedoThreshold _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDSSearchAutoRedoThreshold__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"numberOfVisiblePoisThreshold";
      }
      else {
        v6 = @"number_of_visible_pois_threshold";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v8 = [v7 unsignedIntValue];
        *(unsigned char *)(a1 + 44) |= 8u;
        *(_DWORD *)(a1 + 40) = v8;
      }

      if (a3) {
        v9 = @"zoomOutPercentThreshold";
      }
      else {
        v9 = @"zoom_out_percent_threshold";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 doubleValue];
        *(unsigned char *)(a1 + 44) |= 4u;
        *(void *)(a1 + 32) = v11;
      }

      if (a3) {
        id v12 = @"zoomInPercentThreshold";
      }
      else {
        id v12 = @"zoom_in_percent_threshold";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        *(unsigned char *)(a1 + 44) |= 2u;
        *(void *)(a1 + 24) = v14;
      }

      if (a3) {
        v15 = @"panDeltaThresholdInMeters";
      }
      else {
        v15 = @"pan_delta_threshold_in_meters";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v16 doubleValue];
        *(unsigned char *)(a1 + 44) |= 1u;
        *(void *)(a1 + 16) = v17;
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchAutoRedoThresholdReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_numberOfVisiblePoisThreshold;
    *(unsigned char *)(v4 + 44) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(double *)(v4 + 24) = self->_zoomInPercentThreshold;
      *(unsigned char *)(v4 + 44) |= 2u;
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 32) = self->_zoomOutPercentThreshold;
  *(unsigned char *)(v4 + 44) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (flags)
  {
LABEL_5:
    *(double *)(v4 + 16) = self->_panDeltaThresholdInMeters;
    *(unsigned char *)(v4 + 44) |= 1u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_numberOfVisiblePoisThreshold != *((_DWORD *)v4 + 10)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_zoomOutPercentThreshold != *((double *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_zoomInPercentThreshold != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_panDeltaThresholdInMeters != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_numberOfVisiblePoisThreshold;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double zoomOutPercentThreshold = self->_zoomOutPercentThreshold;
  double v6 = -zoomOutPercentThreshold;
  if (zoomOutPercentThreshold >= 0.0) {
    double v6 = self->_zoomOutPercentThreshold;
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
LABEL_11:
  if ((flags & 2) != 0)
  {
    double zoomInPercentThreshold = self->_zoomInPercentThreshold;
    double v12 = -zoomInPercentThreshold;
    if (zoomInPercentThreshold >= 0.0) {
      double v12 = self->_zoomInPercentThreshold;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if (flags)
  {
    double panDeltaThresholdInMeters = self->_panDeltaThresholdInMeters;
    double v17 = -panDeltaThresholdInMeters;
    if (panDeltaThresholdInMeters >= 0.0) {
      double v17 = self->_panDeltaThresholdInMeters;
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
  return v9 ^ v4 ^ v10 ^ v15;
}

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (!a1) {
    goto LABEL_7;
  }
  char v4 = v3[44];
  if ((v4 & 8) == 0)
  {
    if ((v3[44] & 4) == 0) {
      goto LABEL_4;
    }
LABEL_11:
    *(void *)(a1 + 32) = *((void *)v3 + 4);
    *(unsigned char *)(a1 + 44) |= 4u;
    char v4 = v3[44];
    if ((v4 & 2) == 0)
    {
LABEL_5:
      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
  *(unsigned char *)(a1 + 44) |= 8u;
  char v4 = v3[44];
  if ((v4 & 4) != 0) {
    goto LABEL_11;
  }
LABEL_4:
  if ((v4 & 2) == 0) {
    goto LABEL_5;
  }
LABEL_12:
  *(void *)(a1 + 24) = *((void *)v3 + 3);
  *(unsigned char *)(a1 + 44) |= 2u;
  if (v3[44])
  {
LABEL_6:
    *(void *)(a1 + 16) = *((void *)v3 + 2);
    *(unsigned char *)(a1 + 44) |= 1u;
  }
LABEL_7:
}

- (void).cxx_destruct
{
}

@end