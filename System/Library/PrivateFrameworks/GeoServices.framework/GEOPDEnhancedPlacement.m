@interface GEOPDEnhancedPlacement
+ (GEOPDEnhancedPlacement)enhancedPlacementWithPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)buildingIdAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDEnhancedPlacement

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDEnhancedPlacement;
  [(GEOPDEnhancedPlacement *)&v3 dealloc];
}

+ (GEOPDEnhancedPlacement)enhancedPlacementWithPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__GEOPDEnhancedPlacement_PlaceDataExtras__enhancedPlacementWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E1740;
  v6[4] = &v7;
  [v3 enumerateComponentOfType:88 enumerationOptions:1 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDEnhancedPlacement *)v4;
}

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_buildingIds.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_buildingIds.count);
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_6:
      if ((flags & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_6;
  }
  PBDataWriterWriteFloatField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteFloatField();
    id v4 = v7;
  }
LABEL_8:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

void __74__GEOPDEnhancedPlacement_PlaceDataExtras__enhancedPlacementWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v5 = -[GEOPDComponent values](a2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (v10 && *(void *)(v10 + 168))
        {
          uint64_t v11 = -[GEOPDComponentValue enhancedPlacement]((id *)v10);
          uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
          v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (uint64_t)buildingIdAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = *(void *)(result + 24);
    if (v4 <= a2)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      uint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 16) + 8 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDEnhancedPlacement;
  unint64_t v4 = [(GEOPDEnhancedPlacement *)&v8 description];
  unint64_t v5 = [(GEOPDEnhancedPlacement *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEnhancedPlacement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    unint64_t v4 = 0;
    goto LABEL_18;
  }
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(a1 + 24))
  {
    uint64_t v6 = PBRepeatedUInt64NSArray();
    if (a2) {
      uint64_t v7 = @"buildingId";
    }
    else {
      uint64_t v7 = @"building_id";
    }
    [v4 setObject:v6 forKey:v7];
  }
  char v8 = *(unsigned char *)(a1 + 56);
  if (v8)
  {
    v18 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v4 setObject:v18 forKey:@"elevation"];

    char v8 = *(unsigned char *)(a1 + 56);
    if ((v8 & 4) == 0)
    {
LABEL_9:
      if ((v8 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)(a1 + 56) & 4) == 0)
  {
    goto LABEL_9;
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  uint64_t v19 = [NSNumber numberWithFloat:v5];
  if (a2) {
    v20 = @"buildingHeight";
  }
  else {
    v20 = @"building_height";
  }
  [v4 setObject:v19 forKey:v20];

  if ((*(unsigned char *)(a1 + 56) & 2) != 0)
  {
LABEL_10:
    LODWORD(v5) = *(_DWORD *)(a1 + 48);
    uint64_t v9 = [NSNumber numberWithFloat:v5];
    if (a2) {
      uint64_t v10 = @"buildingFaceAzimuth";
    }
    else {
      uint64_t v10 = @"building_face_azimuth";
    }
    [v4 setObject:v9 forKey:v10];
  }
LABEL_14:
  uint64_t v11 = *(void **)(a1 + 8);
  if (v11)
  {
    uint64_t v12 = [v11 dictionaryRepresentation];
    v13 = v12;
    if (a2)
    {
      long long v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __52__GEOPDEnhancedPlacement__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v15 = v14;
      id v22 = v15;
      [v13 enumerateKeysAndObjectsUsingBlock:v21];
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
  return -[GEOPDEnhancedPlacement _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPDEnhancedPlacement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    char v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    char v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDEnhancedPlacementReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(float *)(v4 + 52) = self->_buildingHeight;
    *(unsigned char *)(v4 + 56) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v4 + 40) = self->_elevation;
  *(unsigned char *)(v4 + 56) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(float *)(v4 + 48) = self->_buildingFaceAzimuth;
    *(unsigned char *)(v4 + 56) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedUInt64IsEqual()) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_elevation != *((double *)v4 + 5)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    BOOL v5 = 0;
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_buildingHeight != *((float *)v4 + 13)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_buildingFaceAzimuth != *((float *)v4 + 12)) {
      goto LABEL_17;
    }
    BOOL v5 = 1;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt64Hash();
  char flags = (char)self->_flags;
  if (flags)
  {
    double elevation = self->_elevation;
    double v7 = -elevation;
    if (elevation >= 0.0) {
      double v7 = self->_elevation;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 4) != 0)
  {
    float buildingHeight = self->_buildingHeight;
    double v12 = buildingHeight;
    if (buildingHeight < 0.0) {
      double v12 = -buildingHeight;
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
  if ((flags & 2) != 0)
  {
    float buildingFaceAzimuth = self->_buildingFaceAzimuth;
    double v17 = buildingFaceAzimuth;
    if (buildingFaceAzimuth < 0.0) {
      double v17 = -buildingFaceAzimuth;
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
  return v5 ^ v3 ^ v10 ^ v15;
}

@end