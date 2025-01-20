@interface GEOPBTransitTriggerRegion
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDelaySeconds;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasSignalStrength;
- (BOOL)hasTransition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)location;
- (GEOPBTransitTriggerRegion)initWithDictionary:(id)a3;
- (GEOPBTransitTriggerRegion)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)signalStrengthAsString:(int)a3;
- (id)transitionAsString:(int)a3;
- (int)StringAsSignalStrength:(id)a3;
- (int)StringAsTransition:(id)a3;
- (int)signalStrength;
- (int)transition;
- (unint64_t)hash;
- (unsigned)delaySeconds;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDelaySeconds:(unsigned int)a3;
- (void)setHasDelaySeconds:(BOOL)a3;
- (void)setHasSignalStrength:(BOOL)a3;
- (void)setHasTransition:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setSignalStrength:(int)a3;
- (void)setTransition:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitTriggerRegion

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)transition
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_transition;
  }
  else {
    return 0;
  }
}

- (void)setTransition:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_transition = a3;
}

- (void)setHasTransition:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransition
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)transitionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E5FA8[a3];
  }

  return v3;
}

- (int)StringAsTransition:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ENTER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXIT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)signalStrength
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_signalStrength;
  }
  else {
    return 0;
  }
}

- (void)setSignalStrength:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_signalStrength = a3;
}

- (void)setHasSignalStrength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSignalStrength
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)signalStrengthAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E5FC0[a3];
  }

  return v3;
}

- (int)StringAsSignalStrength:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SIGNAL_STRENGTH_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SIGNAL_STRENGTH_STRONG"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SIGNAL_STRENGTH_NONE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)delaySeconds
{
  return self->_delaySeconds;
}

- (void)setDelaySeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_delaySeconds = a3;
}

- (void)setHasDelaySeconds:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDelaySeconds
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitTriggerRegion;
  int v4 = [(GEOPBTransitTriggerRegion *)&v8 description];
  v5 = [(GEOPBTransitTriggerRegion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitTriggerRegion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_18;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
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
  if ((v8 & 4) != 0)
  {
    uint64_t v18 = *(int *)(a1 + 32);
    if (v18 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E53E5FA8[v18];
    }
    [v4 setObject:v19 forKey:@"transition"];

    char v8 = *(unsigned char *)(a1 + 36);
    if ((v8 & 2) == 0)
    {
LABEL_9:
      if ((v8 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)(a1 + 36) & 2) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v20 = *(int *)(a1 + 28);
  if (v20 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = off_1E53E5FC0[v20];
  }
  if (a2) {
    v22 = @"signalStrength";
  }
  else {
    v22 = @"signal_strength";
  }
  [v4 setObject:v21 forKey:v22];

  if (*(unsigned char *)(a1 + 36))
  {
LABEL_10:
    v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v10 = @"delaySeconds";
    }
    else {
      v10 = @"delay_seconds";
    }
    [v4 setObject:v9 forKey:v10];
  }
LABEL_14:
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    v12 = [v11 dictionaryRepresentation];
    v13 = v12;
    if (a2)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __55__GEOPBTransitTriggerRegion__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53D8860;
      id v15 = v14;
      id v24 = v15;
      [v13 enumerateKeysAndObjectsUsingBlock:v23];
      id v16 = v15;

      v13 = v16;
    }
    [v4 setObject:v13 forKey:@"Unknown Fields"];
  }
LABEL_18:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitTriggerRegion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPBTransitTriggerRegion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    char v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    char v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPBTransitTriggerRegion)initWithDictionary:(id)a3
{
  return (GEOPBTransitTriggerRegion *)-[GEOPBTransitTriggerRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_41;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_41;
  }
  v6 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
    }
    v9 = (void *)v8;
    [a1 setLocation:v8];
  }
  id v10 = [v5 objectForKeyedSubscript:@"transition"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"ALL"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"ENTER"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"EXIT"])
    {
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    uint64_t v12 = [v10 intValue];
  }
  [a1 setTransition:v12];
LABEL_20:

  if (a3) {
    v13 = @"signalStrength";
  }
  else {
    v13 = @"signal_strength";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"SIGNAL_STRENGTH_UNKNOWN"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"SIGNAL_STRENGTH_STRONG"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"SIGNAL_STRENGTH_NONE"])
    {
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v16 = 0;
    }

    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_34:
    [a1 setSignalStrength:v16];
  }

  if (a3) {
    v17 = @"delaySeconds";
  }
  else {
    v17 = @"delay_seconds";
  }
  uint64_t v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDelaySeconds:", objc_msgSend(v18, "unsignedIntValue"));
  }

LABEL_41:
  return a1;
}

- (GEOPBTransitTriggerRegion)initWithJSON:(id)a3
{
  return (GEOPBTransitTriggerRegion *)-[GEOPBTransitTriggerRegion _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitTriggerRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitTriggerRegionReadAllFrom((uint64_t)self, a3);
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
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_7:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_location hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPBTransitTriggerRegion *)self readAll:0];
  if (self->_location) {
    objc_msgSend(v5, "setLocation:");
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_transition;
    *((unsigned char *)v5 + 36) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 7) = self->_signalStrength;
  *((unsigned char *)v5 + 36) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    *((_DWORD *)v5 + 6) = self->_delaySeconds;
    *((unsigned char *)v5 + 36) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_location copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_signalStrength;
    *(unsigned char *)(v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_transition;
  *(unsigned char *)(v5 + 36) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_delaySeconds;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
LABEL_5:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOPBTransitTriggerRegion *)self readAll:1];
  [v4 readAll:1];
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_transition != *((_DWORD *)v4 + 8)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_signalStrength != *((_DWORD *)v4 + 7)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_delaySeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPBTransitTriggerRegion *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_location hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_transition;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_signalStrength;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_delaySeconds;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  location = self->_location;
  uint64_t v5 = *((void *)v7 + 2);
  if (location)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPBTransitTriggerRegion setLocation:](self, "setLocation:");
  }
  char v6 = *((unsigned char *)v7 + 36);
  if ((v6 & 4) != 0)
  {
    self->_transition = *((_DWORD *)v7 + 8);
    *(unsigned char *)&self->_flags |= 4u;
    char v6 = *((unsigned char *)v7 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_8:
      if ((v6 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)v7 + 36) & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_signalStrength = *((_DWORD *)v7 + 7);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v7 + 36))
  {
LABEL_9:
    self->_delaySeconds = *((_DWORD *)v7 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_10:
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
    [(GEOPBTransitTriggerRegion *)self readAll:0];
    location = self->_location;
    [(GEOLatLng *)location clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end