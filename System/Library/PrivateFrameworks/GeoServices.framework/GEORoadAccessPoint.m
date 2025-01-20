@interface GEORoadAccessPoint
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCyclingDirection;
- (BOOL)hasDrivingDirection;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsApproximate;
- (BOOL)hasLocation;
- (BOOL)hasParkingDirection;
- (BOOL)hasSignificance;
- (BOOL)hasSource;
- (BOOL)hasTransitDirection;
- (BOOL)hasWalkingDirection;
- (BOOL)isApproximate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)location;
- (GEORoadAccessPoint)initWithDictionary:(id)a3;
- (GEORoadAccessPoint)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cyclingDirectionAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)drivingDirectionAsString:(int)a3;
- (id)jsonRepresentation;
- (id)parkingDirectionAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (id)transitDirectionAsString:(int)a3;
- (id)walkingDirectionAsString:(int)a3;
- (int)StringAsCyclingDirection:(id)a3;
- (int)StringAsDrivingDirection:(id)a3;
- (int)StringAsParkingDirection:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)StringAsTransitDirection:(id)a3;
- (int)StringAsWalkingDirection:(id)a3;
- (int)cyclingDirection;
- (int)drivingDirection;
- (int)parkingDirection;
- (int)source;
- (int)transitDirection;
- (int)walkingDirection;
- (unint64_t)hash;
- (unsigned)significance;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCyclingDirection:(int)a3;
- (void)setDrivingDirection:(int)a3;
- (void)setHasCyclingDirection:(BOOL)a3;
- (void)setHasDrivingDirection:(BOOL)a3;
- (void)setHasIsApproximate:(BOOL)a3;
- (void)setHasParkingDirection:(BOOL)a3;
- (void)setHasSignificance:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasTransitDirection:(BOOL)a3;
- (void)setHasWalkingDirection:(BOOL)a3;
- (void)setIsApproximate:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setParkingDirection:(int)a3;
- (void)setSignificance:(unsigned int)a3;
- (void)setSource:(int)a3;
- (void)setTransitDirection:(int)a3;
- (void)setWalkingDirection:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORoadAccessPoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
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
  $D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
LABEL_5:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  }
LABEL_6:
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&flags & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_13:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_location copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  $D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 52) = self->_isApproximate;
  *(unsigned char *)(v5 + 56) |= 0x80u;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
LABEL_3:
    *(_DWORD *)(v5 + 24) = self->_cyclingDirection;
    *(unsigned char *)(v5 + 56) |= 1u;
    *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  }
LABEL_4:
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_drivingDirection;
    *(unsigned char *)(v5 + 56) |= 2u;
    *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_6:
      if ((*(unsigned char *)&flags & 0x40) == 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 44) = self->_transitDirection;
  *(unsigned char *)(v5 + 56) |= 0x20u;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 48) = self->_walkingDirection;
  *(unsigned char *)(v5 + 56) |= 0x40u;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_9;
    }
LABEL_16:
    *(_DWORD *)(v5 + 36) = self->_significance;
    *(unsigned char *)(v5 + 56) |= 8u;
    if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_15:
  *(_DWORD *)(v5 + 32) = self->_parkingDirection;
  *(unsigned char *)(v5 + 56) |= 4u;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0) {
    goto LABEL_16;
  }
LABEL_9:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 40) = self->_source;
    *(unsigned char *)(v5 + 56) |= 0x10u;
  }
LABEL_11:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

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

- (BOOL)isApproximate
{
  return self->_isApproximate;
}

- (void)setIsApproximate:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x80u;
  self->_isApproximate = a3;
}

- (void)setHasIsApproximate:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$D6763CC4B884D04D31D396FEECC92818 flags = v3 & 0x80 | *(unsigned char *)&self->_flags & 0x7F;
}

- (BOOL)hasIsApproximate
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)cyclingDirection
{
  if (*(unsigned char *)&self->_flags) {
    return self->_cyclingDirection;
  }
  else {
    return 0;
  }
}

- (void)setCyclingDirection:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_cyclingDirection = a3;
}

- (void)setHasCyclingDirection:(BOOL)a3
{
  *(unsigned char *)&self->_$D6763CC4B884D04D31D396FEECC92818 flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCyclingDirection
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)cyclingDirectionAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EBA00[a3];
  }

  return v3;
}

- (int)StringAsCyclingDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ENTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENTRY_EXIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DESTINATION"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)drivingDirection
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_drivingDirection;
  }
  else {
    return 0;
  }
}

- (void)setDrivingDirection:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_drivingDirection = a3;
}

- (void)setHasDrivingDirection:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$D6763CC4B884D04D31D396FEECC92818 flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDrivingDirection
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)drivingDirectionAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EBA00[a3];
  }

  return v3;
}

- (int)StringAsDrivingDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ENTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENTRY_EXIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DESTINATION"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)transitDirection
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    return self->_transitDirection;
  }
  else {
    return 0;
  }
}

- (void)setTransitDirection:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_transitDirection = a3;
}

- (void)setHasTransitDirection:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$D6763CC4B884D04D31D396FEECC92818 flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasTransitDirection
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)transitDirectionAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EBA00[a3];
  }

  return v3;
}

- (int)StringAsTransitDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ENTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENTRY_EXIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DESTINATION"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)walkingDirection
{
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    return self->_walkingDirection;
  }
  else {
    return 0;
  }
}

- (void)setWalkingDirection:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_walkingDirection = a3;
}

- (void)setHasWalkingDirection:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$D6763CC4B884D04D31D396FEECC92818 flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasWalkingDirection
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)walkingDirectionAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EBA00[a3];
  }

  return v3;
}

- (int)StringAsWalkingDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ENTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENTRY_EXIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DESTINATION"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)parkingDirection
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_parkingDirection;
  }
  else {
    return 0;
  }
}

- (void)setParkingDirection:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_parkingDirection = a3;
}

- (void)setHasParkingDirection:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$D6763CC4B884D04D31D396FEECC92818 flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasParkingDirection
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)parkingDirectionAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EBA00[a3];
  }

  return v3;
}

- (int)StringAsParkingDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ENTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENTRY_EXIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DESTINATION"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)significance
{
  return self->_significance;
}

- (void)setSignificance:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_significance = a3;
}

- (void)setHasSignificance:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$D6763CC4B884D04D31D396FEECC92818 flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasSignificance
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)source
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$D6763CC4B884D04D31D396FEECC92818 flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EBA28[a3];
  }

  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BASEMAP_CURATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REVGEO_CALCULATED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GEMINI_CURATED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ACCESS_POINT_SERVICE_CURATED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORoadAccessPoint;
  int v4 = [(GEORoadAccessPoint *)&v8 description];
  uint64_t v5 = [(GEORoadAccessPoint *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoadAccessPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_46;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [(id)a1 location];
  id v6 = v5;
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
  int v8 = *(char *)(a1 + 56);
  if (v8 < 0)
  {
    v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
    [v4 setObject:v9 forKey:@"isApproximate"];

    LOBYTE(v8) = *(unsigned char *)(a1 + 56);
    if ((v8 & 1) == 0)
    {
LABEL_9:
      if ((v8 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((v8 & 1) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v10 = *(int *)(a1 + 24);
  if (v10 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E53EBA00[v10];
  }
  [v4 setObject:v11 forKey:@"cyclingDirection"];

  LOBYTE(v8) = *(unsigned char *)(a1 + 56);
  if ((v8 & 2) == 0)
  {
LABEL_10:
    if ((v8 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v12 = *(int *)(a1 + 28);
  if (v12 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E53EBA00[v12];
  }
  [v4 setObject:v13 forKey:@"drivingDirection"];

  LOBYTE(v8) = *(unsigned char *)(a1 + 56);
  if ((v8 & 0x20) == 0)
  {
LABEL_11:
    if ((v8 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_25:
  uint64_t v14 = *(int *)(a1 + 44);
  if (v14 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E53EBA00[v14];
  }
  [v4 setObject:v15 forKey:@"transitDirection"];

  LOBYTE(v8) = *(unsigned char *)(a1 + 56);
  if ((v8 & 0x40) == 0)
  {
LABEL_12:
    if ((v8 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_29:
  uint64_t v16 = *(int *)(a1 + 48);
  if (v16 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 48));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E53EBA00[v16];
  }
  [v4 setObject:v17 forKey:@"walkingDirection"];

  LOBYTE(v8) = *(unsigned char *)(a1 + 56);
  if ((v8 & 4) == 0)
  {
LABEL_13:
    if ((v8 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_33:
  uint64_t v18 = *(int *)(a1 + 32);
  if (v18 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E53EBA00[v18];
  }
  [v4 setObject:v19 forKey:@"parkingDirection"];

  LOBYTE(v8) = *(unsigned char *)(a1 + 56);
  if ((v8 & 8) == 0)
  {
LABEL_14:
    if ((v8 & 0x10) == 0) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }
LABEL_37:
  v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
  [v4 setObject:v20 forKey:@"significance"];

  if ((*(unsigned char *)(a1 + 56) & 0x10) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  uint64_t v21 = *(int *)(a1 + 40);
  if (v21 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_1E53EBA28[v21];
  }
  [v4 setObject:v22 forKey:@"source"];

LABEL_42:
  v23 = *(void **)(a1 + 8);
  if (v23)
  {
    v24 = [v23 dictionaryRepresentation];
    v25 = v24;
    if (a2)
    {
      v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __48__GEORoadAccessPoint__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E53D8860;
      id v27 = v26;
      id v31 = v27;
      [v25 enumerateKeysAndObjectsUsingBlock:v30];
      id v28 = v27;

      v25 = v28;
    }
    [v4 setObject:v25 forKey:@"Unknown Fields"];
  }
LABEL_46:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoadAccessPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEORoadAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    int v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    int v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORoadAccessPoint)initWithDictionary:(id)a3
{
  return (GEORoadAccessPoint *)-[GEORoadAccessPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"location"];
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
      id v10 = [v5 objectForKeyedSubscript:@"isApproximate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsApproximate:", objc_msgSend(v10, "BOOLValue"));
      }

      v11 = [v5 objectForKeyedSubscript:@"cyclingDirection"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"NONE"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"ENTRY"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"EXIT"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"ENTRY_EXIT"])
        {
          uint64_t v13 = 3;
        }
        else if ([v12 isEqualToString:@"DESTINATION"])
        {
          uint64_t v13 = 4;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setCyclingDirection:v13];
LABEL_26:

      uint64_t v14 = [v5 objectForKeyedSubscript:@"drivingDirection"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"NONE"])
        {
          uint64_t v16 = 0;
        }
        else if ([v15 isEqualToString:@"ENTRY"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"EXIT"])
        {
          uint64_t v16 = 2;
        }
        else if ([v15 isEqualToString:@"ENTRY_EXIT"])
        {
          uint64_t v16 = 3;
        }
        else if ([v15 isEqualToString:@"DESTINATION"])
        {
          uint64_t v16 = 4;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_42;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setDrivingDirection:v16];
LABEL_42:

      v17 = [v5 objectForKeyedSubscript:@"transitDirection"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        if ([v18 isEqualToString:@"NONE"])
        {
          uint64_t v19 = 0;
        }
        else if ([v18 isEqualToString:@"ENTRY"])
        {
          uint64_t v19 = 1;
        }
        else if ([v18 isEqualToString:@"EXIT"])
        {
          uint64_t v19 = 2;
        }
        else if ([v18 isEqualToString:@"ENTRY_EXIT"])
        {
          uint64_t v19 = 3;
        }
        else if ([v18 isEqualToString:@"DESTINATION"])
        {
          uint64_t v19 = 4;
        }
        else
        {
          uint64_t v19 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_58;
        }
        uint64_t v19 = [v17 intValue];
      }
      [a1 setTransitDirection:v19];
LABEL_58:

      v20 = [v5 objectForKeyedSubscript:@"walkingDirection"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
        if ([v21 isEqualToString:@"NONE"])
        {
          uint64_t v22 = 0;
        }
        else if ([v21 isEqualToString:@"ENTRY"])
        {
          uint64_t v22 = 1;
        }
        else if ([v21 isEqualToString:@"EXIT"])
        {
          uint64_t v22 = 2;
        }
        else if ([v21 isEqualToString:@"ENTRY_EXIT"])
        {
          uint64_t v22 = 3;
        }
        else if ([v21 isEqualToString:@"DESTINATION"])
        {
          uint64_t v22 = 4;
        }
        else
        {
          uint64_t v22 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_74;
        }
        uint64_t v22 = [v20 intValue];
      }
      [a1 setWalkingDirection:v22];
LABEL_74:

      v23 = [v5 objectForKeyedSubscript:@"parkingDirection"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v23;
        if ([v24 isEqualToString:@"NONE"])
        {
          uint64_t v25 = 0;
        }
        else if ([v24 isEqualToString:@"ENTRY"])
        {
          uint64_t v25 = 1;
        }
        else if ([v24 isEqualToString:@"EXIT"])
        {
          uint64_t v25 = 2;
        }
        else if ([v24 isEqualToString:@"ENTRY_EXIT"])
        {
          uint64_t v25 = 3;
        }
        else if ([v24 isEqualToString:@"DESTINATION"])
        {
          uint64_t v25 = 4;
        }
        else
        {
          uint64_t v25 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_90;
        }
        uint64_t v25 = [v23 intValue];
      }
      [a1 setParkingDirection:v25];
LABEL_90:

      v26 = [v5 objectForKeyedSubscript:@"significance"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSignificance:", objc_msgSend(v26, "unsignedIntValue"));
      }

      id v27 = [v5 objectForKeyedSubscript:@"source"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v27;
        if ([v28 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v29 = 0;
        }
        else if ([v28 isEqualToString:@"BASEMAP_CURATED"])
        {
          uint64_t v29 = 1;
        }
        else if ([v28 isEqualToString:@"REVGEO_CALCULATED"])
        {
          uint64_t v29 = 2;
        }
        else if ([v28 isEqualToString:@"GEMINI_CURATED"])
        {
          uint64_t v29 = 3;
        }
        else if ([v28 isEqualToString:@"ACCESS_POINT_SERVICE_CURATED"])
        {
          uint64_t v29 = 4;
        }
        else
        {
          uint64_t v29 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_108:

          goto LABEL_109;
        }
        uint64_t v29 = [v27 intValue];
      }
      [a1 setSource:v29];
      goto LABEL_108;
    }
  }
LABEL_109:

  return a1;
}

- (GEORoadAccessPoint)initWithJSON:(id)a3
{
  return (GEORoadAccessPoint *)-[GEORoadAccessPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoadAccessPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoadAccessPointReadAllFrom((uint64_t)self, a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_location hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORoadAccessPoint *)self readAll:0];
  if (self->_location) {
    objc_msgSend(v5, "setLocation:");
  }
  $D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  *((unsigned char *)v5 + 52) = self->_isApproximate;
  *((unsigned char *)v5 + 56) |= 0x80u;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
LABEL_5:
    *((_DWORD *)v5 + 6) = self->_cyclingDirection;
    *((unsigned char *)v5 + 56) |= 1u;
    *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  }
LABEL_6:
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_drivingDirection;
    *((unsigned char *)v5 + 56) |= 2u;
    *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&flags & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    goto LABEL_8;
  }
  *((_DWORD *)v5 + 11) = self->_transitDirection;
  *((unsigned char *)v5 + 56) |= 0x20u;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 12) = self->_walkingDirection;
  *((unsigned char *)v5 + 56) |= 0x40u;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 8) = self->_parkingDirection;
  *((unsigned char *)v5 + 56) |= 4u;
  *(unsigned char *)&$D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_20:
  *((_DWORD *)v5 + 9) = self->_significance;
  *((unsigned char *)v5 + 56) |= 8u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v5 + 10) = self->_source;
    *((unsigned char *)v5 + 56) |= 0x10u;
  }
LABEL_13:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  [(GEORoadAccessPoint *)self readAll:1];
  [v4 readAll:1];
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:")) {
      goto LABEL_46;
    }
  }
  $D6763CC4B884D04D31D396FEECC92818 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x80) == 0) {
      goto LABEL_6;
    }
LABEL_46:
    BOOL v7 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)v4 + 56) & 0x80) == 0) {
    goto LABEL_46;
  }
  if (self->_isApproximate)
  {
    if (!*((unsigned char *)v4 + 52)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_46;
  }
LABEL_6:
  if (*(unsigned char *)&flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_cyclingDirection != *((_DWORD *)v4 + 6)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_drivingDirection != *((_DWORD *)v4 + 7)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_transitDirection != *((_DWORD *)v4 + 11)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x40) == 0 || self->_walkingDirection != *((_DWORD *)v4 + 12)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_parkingDirection != *((_DWORD *)v4 + 8)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_significance != *((_DWORD *)v4 + 9)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_46;
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 0x10) == 0;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_source != *((_DWORD *)v4 + 10)) {
      goto LABEL_46;
    }
    BOOL v7 = 1;
  }
LABEL_47:

  return v7;
}

- (unint64_t)hash
{
  [(GEORoadAccessPoint *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_location hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isApproximate;
    if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
LABEL_3:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 2654435761 * self->_cyclingDirection;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_drivingDirection;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_transitDirection;
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_walkingDirection;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_parkingDirection;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_significance;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_source;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v7 = (char *)a3;
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
    -[GEORoadAccessPoint setLocation:](self, "setLocation:");
  }
  int v6 = v7[56];
  if ((v6 & 0x80000000) == 0)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  self->_isApproximate = v7[52];
  *(unsigned char *)&self->_flags |= 0x80u;
  LOBYTE(v6) = v7[56];
  if (v6)
  {
LABEL_8:
    self->_cyclingDirection = *((_DWORD *)v7 + 6);
    *(unsigned char *)&self->_flags |= 1u;
    LOBYTE(v6) = v7[56];
  }
LABEL_9:
  if ((v6 & 2) != 0)
  {
    self->_drivingDirection = *((_DWORD *)v7 + 7);
    *(unsigned char *)&self->_flags |= 2u;
    LOBYTE(v6) = v7[56];
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  self->_transitDirection = *((_DWORD *)v7 + 11);
  *(unsigned char *)&self->_flags |= 0x20u;
  LOBYTE(v6) = v7[56];
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_walkingDirection = *((_DWORD *)v7 + 12);
  *(unsigned char *)&self->_flags |= 0x40u;
  LOBYTE(v6) = v7[56];
  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_parkingDirection = *((_DWORD *)v7 + 8);
  *(unsigned char *)&self->_flags |= 4u;
  LOBYTE(v6) = v7[56];
  if ((v6 & 8) == 0)
  {
LABEL_14:
    if ((v6 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_23:
  self->_significance = *((_DWORD *)v7 + 9);
  *(unsigned char *)&self->_flags |= 8u;
  if ((v7[56] & 0x10) != 0)
  {
LABEL_15:
    self->_source = *((_DWORD *)v7 + 10);
    *(unsigned char *)&self->_flags |= 0x10u;
  }
LABEL_16:
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
    [(GEORoadAccessPoint *)self readAll:0];
    location = self->_location;
    [(GEOLatLng *)location clearUnknownFields:1];
  }
}

@end