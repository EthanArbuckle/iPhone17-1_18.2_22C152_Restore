@interface GEOElevationSegmentDescription
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEndOffsetM;
- (BOOL)hasFormattedDescription;
- (BOOL)hasStartOffsetM;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOElevationSegmentDescription)initWithDictionary:(id)a3;
- (GEOElevationSegmentDescription)initWithJSON:(id)a3;
- (GEOFormattedString)formattedDescription;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)endOffsetM;
- (unsigned)startOffsetM;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndOffsetM:(unsigned int)a3;
- (void)setFormattedDescription:(id)a3;
- (void)setHasEndOffsetM:(BOOL)a3;
- (void)setHasStartOffsetM:(BOOL)a3;
- (void)setStartOffsetM:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOElevationSegmentDescription

- (unsigned)startOffsetM
{
  return self->_startOffsetM;
}

- (void)setStartOffsetM:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_startOffsetM = a3;
}

- (void)setHasStartOffsetM:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStartOffsetM
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)endOffsetM
{
  return self->_endOffsetM;
}

- (void)setEndOffsetM:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_endOffsetM = a3;
}

- (void)setHasEndOffsetM:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEndOffsetM
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasFormattedDescription
{
  return self->_formattedDescription != 0;
}

- (GEOFormattedString)formattedDescription
{
  return self->_formattedDescription;
}

- (void)setFormattedDescription:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOElevationSegmentDescription;
  v4 = [(GEOElevationSegmentDescription *)&v8 description];
  v5 = [(GEOElevationSegmentDescription *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOElevationSegmentDescription _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        v7 = @"startOffsetM";
      }
      else {
        v7 = @"start_offset_m";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v9 = @"endOffsetM";
      }
      else {
        v9 = @"end_offset_m";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 formattedDescription];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"formattedDescription";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"formatted_description";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __60__GEOElevationSegmentDescription__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOElevationSegmentDescription _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOElevationSegmentDescription__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOElevationSegmentDescription)initWithDictionary:(id)a3
{
  return (GEOElevationSegmentDescription *)-[GEOElevationSegmentDescription _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"startOffsetM";
      }
      else {
        v6 = @"start_offset_m";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStartOffsetM:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"endOffsetM";
      }
      else {
        objc_super v8 = @"end_offset_m";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEndOffsetM:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"formattedDescription";
      }
      else {
        id v10 = @"formatted_description";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v13 = [(GEOFormattedString *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOFormattedString *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setFormattedDescription:v13];
      }
    }
  }

  return a1;
}

- (GEOElevationSegmentDescription)initWithJSON:(id)a3
{
  return (GEOElevationSegmentDescription *)-[GEOElevationSegmentDescription _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOElevationSegmentDescriptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOElevationSegmentDescriptionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_formattedDescription)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOElevationSegmentDescription *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_startOffsetM;
    *((unsigned char *)v6 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v6 + 6) = self->_endOffsetM;
    *((unsigned char *)v6 + 32) |= 1u;
  }
  if (self->_formattedDescription)
  {
    objc_msgSend(v6, "setFormattedDescription:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_startOffsetM;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_endOffsetM;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(GEOFormattedString *)self->_formattedDescription copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOElevationSegmentDescription *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_startOffsetM != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_endOffsetM != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  formattedDescription = self->_formattedDescription;
  if ((unint64_t)formattedDescription | *((void *)v4 + 2)) {
    char v6 = -[GEOFormattedString isEqual:](formattedDescription, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOElevationSegmentDescription *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_startOffsetM;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(GEOFormattedString *)self->_formattedDescription hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_endOffsetM;
  return v4 ^ v3 ^ [(GEOFormattedString *)self->_formattedDescription hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = (unsigned int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 32);
  if ((v5 & 2) != 0)
  {
    self->_startOffsetM = v8[7];
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v8 + 32);
  }
  if (v5)
  {
    self->_endOffsetM = v8[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  formattedDescription = self->_formattedDescription;
  uint64_t v7 = *((void *)v8 + 2);
  if (formattedDescription)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOFormattedString mergeFrom:](formattedDescription, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOElevationSegmentDescription setFormattedDescription:](self, "setFormattedDescription:");
  }
  uint64_t v4 = v8;
LABEL_11:
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
    [(GEOElevationSegmentDescription *)self readAll:0];
    formattedDescription = self->_formattedDescription;
    [(GEOFormattedString *)formattedDescription clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedDescription, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end