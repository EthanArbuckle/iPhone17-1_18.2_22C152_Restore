@interface GEOPDResultRefinementMetadataSort
+ (BOOL)isValid:(id)a3;
- (BOOL)enableServerOverriddenPositioning;
- (BOOL)hasCustomSortFunctionIdentifier;
- (BOOL)hasEnableServerOverriddenPositioning;
- (BOOL)hasSelectionFromQuery;
- (BOOL)hasSelectionFromQuerySequenceNumber;
- (BOOL)hasServerOverriddenPosition;
- (BOOL)hasSortType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)selectionFromQuery;
- (GEOPDResultRefinementMetadataSort)initWithDictionary:(id)a3;
- (GEOPDResultRefinementMetadataSort)initWithJSON:(id)a3;
- (NSString)customSortFunctionIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sortTypeAsString:(int)a3;
- (int)StringAsSortType:(id)a3;
- (int)sortType;
- (unint64_t)hash;
- (unsigned)selectionFromQuerySequenceNumber;
- (unsigned)serverOverriddenPosition;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCustomSortFunctionIdentifier:(id)a3;
- (void)setEnableServerOverriddenPositioning:(BOOL)a3;
- (void)setHasEnableServerOverriddenPositioning:(BOOL)a3;
- (void)setHasSelectionFromQuery:(BOOL)a3;
- (void)setHasSelectionFromQuerySequenceNumber:(BOOL)a3;
- (void)setHasServerOverriddenPosition:(BOOL)a3;
- (void)setHasSortType:(BOOL)a3;
- (void)setSelectionFromQuery:(BOOL)a3;
- (void)setSelectionFromQuerySequenceNumber:(unsigned int)a3;
- (void)setServerOverriddenPosition:(unsigned int)a3;
- (void)setSortType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementMetadataSort

- (int)sortType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_sortType;
  }
  else {
    return 0;
  }
}

- (void)setSortType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_sortType = a3;
}

- (void)setHasSortType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSortType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)sortTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E5CB8[a3];
  }

  return v3;
}

- (int)StringAsSortType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESULT_REFINEMENT_SORT_TYPE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_SORT_TYPE_RATINGS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_SORT_TYPE_DISTANCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_SORT_TYPE_CUSTOM"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCustomSortFunctionIdentifier
{
  return self->_customSortFunctionIdentifier != 0;
}

- (NSString)customSortFunctionIdentifier
{
  return self->_customSortFunctionIdentifier;
}

- (void)setCustomSortFunctionIdentifier:(id)a3
{
}

- (unsigned)selectionFromQuerySequenceNumber
{
  return self->_selectionFromQuerySequenceNumber;
}

- (void)setSelectionFromQuerySequenceNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_selectionFromQuerySequenceNumber = a3;
}

- (void)setHasSelectionFromQuerySequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSelectionFromQuerySequenceNumber
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)selectionFromQuery
{
  return self->_selectionFromQuery;
}

- (void)setSelectionFromQuery:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_selectionFromQuery = a3;
}

- (void)setHasSelectionFromQuery:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSelectionFromQuery
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)serverOverriddenPosition
{
  return self->_serverOverriddenPosition;
}

- (void)setServerOverriddenPosition:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_serverOverriddenPosition = a3;
}

- (void)setHasServerOverriddenPosition:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasServerOverriddenPosition
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)enableServerOverriddenPositioning
{
  return self->_enableServerOverriddenPositioning;
}

- (void)setEnableServerOverriddenPositioning:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_enableServerOverriddenPositioning = a3;
}

- (void)setHasEnableServerOverriddenPositioning:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasEnableServerOverriddenPositioning
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementMetadataSort;
  int v4 = [(GEOPDResultRefinementMetadataSort *)&v8 description];
  v5 = [(GEOPDResultRefinementMetadataSort *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMetadataSort _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_27;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 40) & 4) != 0)
  {
    uint64_t v5 = *(int *)(a1 + 32);
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E53E5CB8[v5];
    }
    if (a2) {
      v7 = @"sortType";
    }
    else {
      v7 = @"sort_type";
    }
    [v4 setObject:v6 forKey:v7];
  }
  objc_super v8 = [(id)a1 customSortFunctionIdentifier];
  if (v8)
  {
    if (a2) {
      v9 = @"customSortFunctionIdentifier";
    }
    else {
      v9 = @"custom_sort_function_identifier";
    }
    [v4 setObject:v8 forKey:v9];
  }

  char v10 = *(unsigned char *)(a1 + 40);
  if (v10)
  {
    v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v21 = @"selectionFromQuerySequenceNumber";
    }
    else {
      v21 = @"selection_from_query_sequence_number";
    }
    [v4 setObject:v20 forKey:v21];

    char v10 = *(unsigned char *)(a1 + 40);
    if ((v10 & 0x10) == 0)
    {
LABEL_17:
      if ((v10 & 2) == 0) {
        goto LABEL_18;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)(a1 + 40) & 0x10) == 0)
  {
    goto LABEL_17;
  }
  v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 37)];
  if (a2) {
    v23 = @"selectionFromQuery";
  }
  else {
    v23 = @"selection_from_query";
  }
  [v4 setObject:v22 forKey:v23];

  char v10 = *(unsigned char *)(a1 + 40);
  if ((v10 & 2) == 0)
  {
LABEL_18:
    if ((v10 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_38:
  v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
  if (a2) {
    v25 = @"serverOverriddenPosition";
  }
  else {
    v25 = @"server_overridden_position";
  }
  [v4 setObject:v24 forKey:v25];

  if ((*(unsigned char *)(a1 + 40) & 8) != 0)
  {
LABEL_19:
    v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 36)];
    if (a2) {
      v12 = @"enableServerOverriddenPositioning";
    }
    else {
      v12 = @"enable_server_overridden_positioning";
    }
    [v4 setObject:v11 forKey:v12];
  }
LABEL_23:
  v13 = *(void **)(a1 + 8);
  if (v13)
  {
    v14 = [v13 dictionaryRepresentation];
    v15 = v14;
    if (a2)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __63__GEOPDResultRefinementMetadataSort__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E53D8860;
      id v17 = v16;
      id v27 = v17;
      [v15 enumerateKeysAndObjectsUsingBlock:v26];
      id v18 = v17;

      v15 = v18;
    }
    [v4 setObject:v15 forKey:@"Unknown Fields"];
  }
LABEL_27:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementMetadataSort _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOPDResultRefinementMetadataSort__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDResultRefinementMetadataSort)initWithDictionary:(id)a3
{
  return (GEOPDResultRefinementMetadataSort *)-[GEOPDResultRefinementMetadataSort _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_46;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_46;
  }
  if (a3) {
    v6 = @"sortType";
  }
  else {
    v6 = @"sort_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"RESULT_REFINEMENT_SORT_TYPE_DEFAULT"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"RESULT_REFINEMENT_SORT_TYPE_RATINGS"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"RESULT_REFINEMENT_SORT_TYPE_DISTANCE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"RESULT_REFINEMENT_SORT_TYPE_CUSTOM"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_19:
    [a1 setSortType:v9];
  }

  if (a3) {
    id v10 = @"customSortFunctionIdentifier";
  }
  else {
    id v10 = @"custom_sort_function_identifier";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setCustomSortFunctionIdentifier:v12];
  }
  if (a3) {
    v13 = @"selectionFromQuerySequenceNumber";
  }
  else {
    v13 = @"selection_from_query_sequence_number";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSelectionFromQuerySequenceNumber:", objc_msgSend(v14, "unsignedIntValue"));
  }

  if (a3) {
    v15 = @"selectionFromQuery";
  }
  else {
    v15 = @"selection_from_query";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSelectionFromQuery:", objc_msgSend(v16, "BOOLValue"));
  }

  if (a3) {
    id v17 = @"serverOverriddenPosition";
  }
  else {
    id v17 = @"server_overridden_position";
  }
  id v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setServerOverriddenPosition:", objc_msgSend(v18, "unsignedIntValue"));
  }

  if (a3) {
    v19 = @"enableServerOverriddenPositioning";
  }
  else {
    v19 = @"enable_server_overridden_positioning";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnableServerOverriddenPositioning:", objc_msgSend(v20, "BOOLValue"));
  }

LABEL_46:
  return a1;
}

- (GEOPDResultRefinementMetadataSort)initWithJSON:(id)a3
{
  return (GEOPDResultRefinementMetadataSort *)-[GEOPDResultRefinementMetadataSort _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDResultRefinementMetadataSortIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementMetadataSortReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_customSortFunctionIdentifier) {
    PBDataWriterWriteStringField();
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_9:
  }
    PBDataWriterWriteBOOLField();
LABEL_10:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  v6 = a3;
  [(GEOPDResultRefinementMetadataSort *)self readAll:0];
  int v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v6[8] = self->_sortType;
    *((unsigned char *)v6 + 40) |= 4u;
  }
  if (self->_customSortFunctionIdentifier)
  {
    objc_msgSend(v6, "setCustomSortFunctionIdentifier:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v4[6] = self->_selectionFromQuerySequenceNumber;
    *((unsigned char *)v4 + 40) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 37) = self->_selectionFromQuery;
  *((unsigned char *)v4 + 40) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  v4[7] = self->_serverOverriddenPosition;
  *((unsigned char *)v4 + 40) |= 2u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_9:
    *((unsigned char *)v4 + 36) = self->_enableServerOverriddenPositioning;
    *((unsigned char *)v4 + 40) |= 8u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_sortType;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_customSortFunctionIdentifier copyWithZone:a3];
  id v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v6 + 24) = self->_selectionFromQuerySequenceNumber;
    *(unsigned char *)(v6 + 40) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(_DWORD *)(v6 + 28) = self->_serverOverriddenPosition;
      *(unsigned char *)(v6 + 40) |= 2u;
      if ((*(unsigned char *)&self->_flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 37) = self->_selectionFromQuery;
  *(unsigned char *)(v6 + 40) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    *(unsigned char *)(v6 + 36) = self->_enableServerOverriddenPositioning;
    *(unsigned char *)(v6 + 40) |= 8u;
  }
LABEL_8:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  [(GEOPDResultRefinementMetadataSort *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 40);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_sortType != *((_DWORD *)v4 + 8)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_30;
  }
  customSortFunctionIdentifier = self->_customSortFunctionIdentifier;
  if ((unint64_t)customSortFunctionIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](customSortFunctionIdentifier, "isEqual:")) {
      goto LABEL_30;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 40);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_selectionFromQuerySequenceNumber != *((_DWORD *)v4 + 6)) {
      goto LABEL_30;
    }
  }
  else if (v6)
  {
    goto LABEL_30;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_30;
    }
    if (self->_selectionFromQuery)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_30;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_serverOverriddenPosition != *((_DWORD *)v4 + 7)) {
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_30;
  }
  BOOL v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_enableServerOverriddenPositioning)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_30;
        }
      }
      else if (*((unsigned char *)v4 + 36))
      {
        goto LABEL_30;
      }
      BOOL v8 = 1;
      goto LABEL_31;
    }
LABEL_30:
    BOOL v8 = 0;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDResultRefinementMetadataSort *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_sortType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_customSortFunctionIdentifier hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_selectionFromQuerySequenceNumber;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_selectionFromQuery;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_serverOverriddenPosition;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_enableServerOverriddenPositioning;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = (int *)a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if ((v6[10] & 4) != 0)
  {
    self->_sortType = v6[8];
    *(unsigned char *)&self->_flags |= 4u;
  }
  if (*((void *)v6 + 2))
  {
    -[GEOPDResultRefinementMetadataSort setCustomSortFunctionIdentifier:](self, "setCustomSortFunctionIdentifier:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_selectionFromQuerySequenceNumber = v4[6];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 0x10) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((v4[10] & 0x10) == 0)
  {
    goto LABEL_7;
  }
  self->_selectionFromQuery = *((unsigned char *)v4 + 37);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  self->_serverOverriddenPosition = v4[7];
  *(unsigned char *)&self->_flags |= 2u;
  if ((v4[10] & 8) != 0)
  {
LABEL_9:
    self->_enableServerOverriddenPositioning = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_flags |= 8u;
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
    [(GEOPDResultRefinementMetadataSort *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSortFunctionIdentifier, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end