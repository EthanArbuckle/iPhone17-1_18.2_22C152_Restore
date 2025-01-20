@interface GEOLogMsgStateLookAroundView
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHeading;
- (BOOL)hasIsLabelingShown;
- (BOOL)hasLocation;
- (BOOL)hasNumberPoisInView;
- (BOOL)hasZoomLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLabelingShown;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)location;
- (GEOLogMsgStateLookAroundView)initWithDictionary:(id)a3;
- (GEOLogMsgStateLookAroundView)initWithJSON:(id)a3;
- (double)zoomLevel;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)heading;
- (unsigned)numberPoisInView;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeading:(BOOL)a3;
- (void)setHasIsLabelingShown:(BOOL)a3;
- (void)setHasNumberPoisInView:(BOOL)a3;
- (void)setHasZoomLevel:(BOOL)a3;
- (void)setHeading:(unsigned int)a3;
- (void)setIsLabelingShown:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setNumberPoisInView:(unsigned int)a3;
- (void)setZoomLevel:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateLookAroundView

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (unsigned)heading
{
  return self->_heading;
}

- (void)setHeading:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_heading = a3;
}

- (void)setHasHeading:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeading
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_zoomLevel = a3;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasZoomLevel
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)numberPoisInView
{
  return self->_numberPoisInView;
}

- (void)setNumberPoisInView:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_numberPoisInView = a3;
}

- (void)setHasNumberPoisInView:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNumberPoisInView
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)isLabelingShown
{
  return self->_isLabelingShown;
}

- (void)setIsLabelingShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isLabelingShown = a3;
}

- (void)setHasIsLabelingShown:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsLabelingShown
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateLookAroundView;
  v4 = [(GEOLogMsgStateLookAroundView *)&v8 description];
  v5 = [(GEOLogMsgStateLookAroundView *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateLookAroundView _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_25;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 location];
  v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    v7 = [v5 dictionaryRepresentation];
    }
    [v4 setObject:v7 forKey:@"location"];
  }
  char v8 = *(unsigned char *)(a1 + 36);
  if ((v8 & 2) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v9 forKey:@"heading"];

    char v8 = *(unsigned char *)(a1 + 36);
    if ((v8 & 1) == 0)
    {
LABEL_9:
      if ((v8 & 4) == 0) {
        goto LABEL_10;
      }
LABEL_17:
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        v13 = @"numberPoisInView";
      }
      else {
        v13 = @"number_pois_in_view";
      }
      [v4 setObject:v12 forKey:v13];

      if ((*(unsigned char *)(a1 + 36) & 8) == 0) {
        goto LABEL_25;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)(a1 + 36) & 1) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  if (a2) {
    v11 = @"zoomLevel";
  }
  else {
    v11 = @"zoom_level";
  }
  [v4 setObject:v10 forKey:v11];

  char v8 = *(unsigned char *)(a1 + 36);
  if ((v8 & 4) != 0) {
    goto LABEL_17;
  }
LABEL_10:
  if ((v8 & 8) != 0)
  {
LABEL_21:
    v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
    if (a2) {
      v15 = @"isLabelingShown";
    }
    else {
      v15 = @"is_labeling_shown";
    }
    [v4 setObject:v14 forKey:v15];
  }
LABEL_25:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateLookAroundView _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateLookAroundView)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateLookAroundView *)-[GEOLogMsgStateLookAroundView _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOLocation alloc];
        if (a3) {
          uint64_t v8 = [(GEOLocation *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLocation *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setLocation:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"heading"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHeading:", objc_msgSend(v10, "unsignedIntValue"));
      }

      if (a3) {
        v11 = @"zoomLevel";
      }
      else {
        v11 = @"zoom_level";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        objc_msgSend(a1, "setZoomLevel:");
      }

      if (a3) {
        v13 = @"numberPoisInView";
      }
      else {
        v13 = @"number_pois_in_view";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberPoisInView:", objc_msgSend(v14, "unsignedIntValue"));
      }

      if (a3) {
        v15 = @"isLabelingShown";
      }
      else {
        v15 = @"is_labeling_shown";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsLabelingShown:", objc_msgSend(v16, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateLookAroundView)initWithJSON:(id)a3
{
  return (GEOLogMsgStateLookAroundView *)-[GEOLogMsgStateLookAroundView _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateLookAroundViewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateLookAroundViewReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_8:
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLocation *)self->_location hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateLookAroundView *)self readAll:0];
  if (self->_location) {
    objc_msgSend(v5, "setLocation:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_heading;
    *((unsigned char *)v5 + 36) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v5 + 2) = *(void *)&self->_zoomLevel;
  *((unsigned char *)v5 + 36) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v5 + 7) = self->_numberPoisInView;
  *((unsigned char *)v5 + 36) |= 4u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_7:
    *((unsigned char *)v5 + 32) = self->_isLabelingShown;
    *((unsigned char *)v5 + 36) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLocation *)self->_location copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_heading;
    *(unsigned char *)(v5 + 36) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 28) = self->_numberPoisInView;
      *(unsigned char *)(v5 + 36) |= 4u;
      if ((*(unsigned char *)&self->_flags & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_zoomLevel;
  *(unsigned char *)(v5 + 36) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 32) = self->_isLabelingShown;
    *(unsigned char *)(v5 + 36) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOLogMsgStateLookAroundView *)self readAll:1];
  [v4 readAll:1];
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 1))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_heading != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_zoomLevel != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_numberPoisInView != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0)
    {
LABEL_21:
      BOOL v6 = 0;
      goto LABEL_22;
    }
    if (self->_isLabelingShown)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_21;
    }
    BOOL v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateLookAroundView *)self readAll:1];
  unint64_t v3 = [(GEOLocation *)self->_location hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_heading;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double zoomLevel = self->_zoomLevel;
  double v7 = -zoomLevel;
  if (zoomLevel >= 0.0) {
    double v7 = self->_zoomLevel;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((flags & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_numberPoisInView;
    if ((flags & 8) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v12 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_isLabelingShown;
  return v5 ^ v3 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  location = self->_location;
  uint64_t v5 = *((void *)v7 + 1);
  if (location)
  {
    if (v5) {
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLogMsgStateLookAroundView setLocation:](self, "setLocation:");
  }
  char v6 = *((unsigned char *)v7 + 36);
  if ((v6 & 2) != 0)
  {
    self->_heading = *((_DWORD *)v7 + 6);
    *(unsigned char *)&self->_flags |= 2u;
    char v6 = *((unsigned char *)v7 + 36);
    if ((v6 & 1) == 0)
    {
LABEL_8:
      if ((v6 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v7 + 36) & 1) == 0)
  {
    goto LABEL_8;
  }
  self->_double zoomLevel = *((double *)v7 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v6 = *((unsigned char *)v7 + 36);
  if ((v6 & 4) == 0)
  {
LABEL_9:
    if ((v6 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_16:
  self->_numberPoisInView = *((_DWORD *)v7 + 7);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v7 + 36) & 8) != 0)
  {
LABEL_10:
    self->_isLabelingShown = *((unsigned char *)v7 + 32);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_11:
}

- (void).cxx_destruct
{
}

@end