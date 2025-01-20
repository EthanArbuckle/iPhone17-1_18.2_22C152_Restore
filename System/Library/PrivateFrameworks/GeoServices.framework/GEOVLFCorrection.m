@interface GEOVLFCorrection
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAltitudeCorrectionMagnitude;
- (BOOL)hasHeadingCorrectionMagnitude;
- (BOOL)hasLocationCorrectionMagnitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFCorrection)initWithDictionary:(id)a3;
- (GEOVLFCorrection)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)altitudeCorrectionMagnitude;
- (unsigned)headingCorrectionMagnitude;
- (unsigned)locationCorrectionMagnitude;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitudeCorrectionMagnitude:(unsigned int)a3;
- (void)setHasAltitudeCorrectionMagnitude:(BOOL)a3;
- (void)setHasHeadingCorrectionMagnitude:(BOOL)a3;
- (void)setHasLocationCorrectionMagnitude:(BOOL)a3;
- (void)setHeadingCorrectionMagnitude:(unsigned int)a3;
- (void)setLocationCorrectionMagnitude:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFCorrection

- (unsigned)locationCorrectionMagnitude
{
  return self->_locationCorrectionMagnitude;
}

- (void)setLocationCorrectionMagnitude:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_locationCorrectionMagnitude = a3;
}

- (void)setHasLocationCorrectionMagnitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLocationCorrectionMagnitude
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)headingCorrectionMagnitude
{
  return self->_headingCorrectionMagnitude;
}

- (void)setHeadingCorrectionMagnitude:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_headingCorrectionMagnitude = a3;
}

- (void)setHasHeadingCorrectionMagnitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeadingCorrectionMagnitude
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)altitudeCorrectionMagnitude
{
  return self->_altitudeCorrectionMagnitude;
}

- (void)setAltitudeCorrectionMagnitude:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_altitudeCorrectionMagnitude = a3;
}

- (void)setHasAltitudeCorrectionMagnitude:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAltitudeCorrectionMagnitude
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFCorrection;
  v4 = [(GEOVLFCorrection *)&v8 description];
  v5 = [(GEOVLFCorrection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFCorrection _dictionaryRepresentation:]((uint64_t)self, 0);
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
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
    if (a2) {
      v9 = @"headingCorrectionMagnitude";
    }
    else {
      v9 = @"heading_correction_magnitude";
    }
    [v4 setObject:v8 forKey:v9];

    if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
  if (a2) {
    v7 = @"locationCorrectionMagnitude";
  }
  else {
    v7 = @"location_correction_magnitude";
  }
  [v4 setObject:v6 forKey:v7];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if (v5)
  {
LABEL_14:
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
    if (a2) {
      v11 = @"altitudeCorrectionMagnitude";
    }
    else {
      v11 = @"altitude_correction_magnitude";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_18:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFCorrection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFCorrection)initWithDictionary:(id)a3
{
  return (GEOVLFCorrection *)-[GEOVLFCorrection _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"locationCorrectionMagnitude";
      }
      else {
        v6 = @"location_correction_magnitude";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLocationCorrectionMagnitude:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"headingCorrectionMagnitude";
      }
      else {
        objc_super v8 = @"heading_correction_magnitude";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHeadingCorrectionMagnitude:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"altitudeCorrectionMagnitude";
      }
      else {
        v10 = @"altitude_correction_magnitude";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAltitudeCorrectionMagnitude:", objc_msgSend(v11, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOVLFCorrection)initWithJSON:(id)a3
{
  return (GEOVLFCorrection *)-[GEOVLFCorrection _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFCorrectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFCorrectionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
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
  [(GEOVLFCorrection *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_locationCorrectionMagnitude;
    *((unsigned char *)v5 + 20) |= 4u;
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
  v5[3] = self->_headingCorrectionMagnitude;
  *((unsigned char *)v5 + 20) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    v5[2] = self->_altitudeCorrectionMagnitude;
    *((unsigned char *)v5 + 20) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_locationCorrectionMagnitude;
    *((unsigned char *)result + 20) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_headingCorrectionMagnitude;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_altitudeCorrectionMagnitude;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOVLFCorrection *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_locationCorrectionMagnitude != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_headingCorrectionMagnitude != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_altitudeCorrectionMagnitude != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOVLFCorrection *)self readAll:1];
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
  uint64_t v3 = 2654435761 * self->_locationCorrectionMagnitude;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_headingCorrectionMagnitude;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_altitudeCorrectionMagnitude;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unsigned int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 4) != 0)
  {
    self->_locationCorrectionMagnitude = v5[4];
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 20);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[5] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_headingCorrectionMagnitude = v5[3];
  *(unsigned char *)&self->_flags |= 2u;
  if (v5[5])
  {
LABEL_4:
    self->_altitudeCorrectionMagnitude = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
}

@end