@interface GEOPDPlaceSummaryFormat
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEndIndex;
- (BOOL)hasFormatType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStartIndex;
- (BOOL)hasTapPlaceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemIdentifier)tappableEntryIdentifier;
- (GEOPDMapsIdentifier)tapPlaceId;
- (GEOPDPlaceSummaryFormat)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryFormat)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formatTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsFormatType:(id)a3;
- (int)formatType;
- (unint64_t)hash;
- (unsigned)endIndex;
- (unsigned)startIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndIndex:(unsigned int)a3;
- (void)setFormatType:(int)a3;
- (void)setHasEndIndex:(BOOL)a3;
- (void)setHasFormatType:(BOOL)a3;
- (void)setHasStartIndex:(BOOL)a3;
- (void)setStartIndex:(unsigned int)a3;
- (void)setTapPlaceId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryFormat

- (GEOMapItemIdentifier)tappableEntryIdentifier
{
  v3 = [(GEOPDPlaceSummaryFormat *)self tapPlaceId];

  if (v3)
  {
    v4 = [GEOMapItemIdentifier alloc];
    v5 = [(GEOPDPlaceSummaryFormat *)self tapPlaceId];
    v6 = [(GEOMapItemIdentifier *)v4 initWithMapsIdentifier:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)formatType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_formatType;
  }
  else {
    return 0;
  }
}

- (void)setFormatType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_formatType = a3;
}

- (void)setHasFormatType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasFormatType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)formatTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E61F8[a3];
  }

  return v3;
}

- (int)StringAsFormatType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_BOLD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_ITALICS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_startIndex = a3;
}

- (void)setHasStartIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStartIndex
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_endIndex = a3;
}

- (void)setHasEndIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEndIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasTapPlaceId
{
  return self->_tapPlaceId != 0;
}

- (GEOPDMapsIdentifier)tapPlaceId
{
  return self->_tapPlaceId;
}

- (void)setTapPlaceId:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryFormat;
  int v4 = [(GEOPDPlaceSummaryFormat *)&v8 description];
  v5 = [(GEOPDPlaceSummaryFormat *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryFormat _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 20);
      if (v6 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53E61F8[v6];
      }
      if (a2) {
        objc_super v8 = @"formatType";
      }
      else {
        objc_super v8 = @"format_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if ((v5 & 4) != 0)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v10 = @"startIndex";
      }
      else {
        v10 = @"start_index";
      }
      [v4 setObject:v9 forKey:v10];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if (v5)
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v12 = @"endIndex";
      }
      else {
        v12 = @"end_index";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 tapPlaceId];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"tapPlaceId";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"tap_place_id";
      }
      [v4 setObject:v15 forKey:v16];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryFormat _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryFormat)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryFormat *)-[GEOPDPlaceSummaryFormat _initWithDictionary:isJSON:](self, a3, 0);
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
  if (a3) {
    uint64_t v6 = @"formatType";
  }
  else {
    uint64_t v6 = @"format_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_BOLD"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_ITALICS"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_21:
    [a1 setFormatType:v9];
  }

  if (a3) {
    v10 = @"startIndex";
  }
  else {
    v10 = @"start_index";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStartIndex:", objc_msgSend(v11, "unsignedIntValue"));
  }

  if (a3) {
    v12 = @"endIndex";
  }
  else {
    v12 = @"end_index";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndIndex:", objc_msgSend(v13, "unsignedIntValue"));
  }

  if (a3) {
    v14 = @"tapPlaceId";
  }
  else {
    v14 = @"tap_place_id";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      uint64_t v17 = [(GEOPDMapsIdentifier *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEOPDMapsIdentifier *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setTapPlaceId:v17];
  }
LABEL_41:

  return a1;
}

- (GEOPDPlaceSummaryFormat)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryFormat *)-[GEOPDPlaceSummaryFormat _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryFormatIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryFormatReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
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
  if (self->_tapPlaceId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOPDMapsIdentifier *)self->_tapPlaceId hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOPDPlaceSummaryFormat *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_formatType;
    *((unsigned char *)v6 + 28) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 6) = self->_startIndex;
  *((unsigned char *)v6 + 28) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *((_DWORD *)v6 + 4) = self->_endIndex;
    *((unsigned char *)v6 + 28) |= 1u;
  }
LABEL_5:
  if (self->_tapPlaceId)
  {
    objc_msgSend(v6, "setTapPlaceId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 24) = self->_startIndex;
    *(unsigned char *)(v5 + 28) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 20) = self->_formatType;
  *(unsigned char *)(v5 + 28) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_endIndex;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
LABEL_5:
  id v8 = [(GEOPDMapsIdentifier *)self->_tapPlaceId copyWithZone:a3];
  uint64_t v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOPDPlaceSummaryFormat *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_formatType != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_startIndex != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_endIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_19;
  }
  tapPlaceId = self->_tapPlaceId;
  if ((unint64_t)tapPlaceId | *((void *)v4 + 1)) {
    char v6 = -[GEOPDMapsIdentifier isEqual:](tapPlaceId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryFormat *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(GEOPDMapsIdentifier *)self->_tapPlaceId hash];
  }
  uint64_t v3 = 2654435761 * self->_formatType;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_startIndex;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_endIndex;
  return v4 ^ v3 ^ v5 ^ [(GEOPDMapsIdentifier *)self->_tapPlaceId hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 28);
  if ((v5 & 2) != 0)
  {
    self->_formatType = *((_DWORD *)v8 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v8 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v8 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_startIndex = *((_DWORD *)v8 + 6);
  *(unsigned char *)&self->_flags |= 4u;
  if (*((unsigned char *)v8 + 28))
  {
LABEL_4:
    self->_endIndex = *((_DWORD *)v8 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
  tapPlaceId = self->_tapPlaceId;
  uint64_t v7 = *((void *)v8 + 1);
  if (tapPlaceId)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOPDMapsIdentifier mergeFrom:](tapPlaceId, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOPDPlaceSummaryFormat setTapPlaceId:](self, "setTapPlaceId:");
  }
  uint64_t v4 = v8;
LABEL_14:
}

- (void).cxx_destruct
{
}

@end