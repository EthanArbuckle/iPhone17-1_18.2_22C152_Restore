@interface GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters;
  v4 = [(GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters *)&v8 description];
  id v5 = [(GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_14;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 4) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v16 = @"maxCategories";
    }
    else {
      v16 = @"max_categories";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(a1 + 32) & 8) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
  if (a2) {
    v18 = @"maxResultsPerCategory";
  }
  else {
    v18 = @"max_results_per_category";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_25:
  v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
  if (a2) {
    v20 = @"blurredHourOfDay";
  }
  else {
    v20 = @"blurred_hour_of_day";
  }
  [v4 setObject:v19 forKey:v20];

  if ((*(unsigned char *)(a1 + 32) & 2) != 0)
  {
LABEL_6:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
    if (a2) {
      v7 = @"dayOfWeek";
    }
    else {
      v7 = @"day_of_week";
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
      v21[2] = __89__GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __89__GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchZeroKeywordWithSearchResultsSuggestionParametersReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v4 + 24) = self->_maxCategories;
    *(unsigned char *)(v4 + 32) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v4 + 16) = self->_blurredHourOfDay;
      *(unsigned char *)(v4 + 32) |= 1u;
      if ((*(unsigned char *)&self->_flags & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 28) = self->_maxResultsPerCategory;
  *(unsigned char *)(v4 + 32) |= 8u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 2) != 0)
  {
LABEL_5:
    *(_DWORD *)(v4 + 20) = self->_dayOfWeek;
    *(unsigned char *)(v4 + 32) |= 2u;
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
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_maxCategories != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_maxResultsPerCategory != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_blurredHourOfDay != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_maxCategories;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_maxResultsPerCategory;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_blurredHourOfDay;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_dayOfWeek;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void).cxx_destruct
{
}

@end