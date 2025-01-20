@interface GEOPDSearchZeroKeywordCategorySuggestionParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)setSignificantLocation:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchZeroKeywordCategorySuggestionParameters

- (void)setSignificantLocation:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchZeroKeywordCategorySuggestionParameters;
  id v4 = [(GEOPDSearchZeroKeywordCategorySuggestionParameters *)&v8 description];
  v5 = [(GEOPDSearchZeroKeywordCategorySuggestionParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchZeroKeywordCategorySuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_23;
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 44))
  {
    v5 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    if (a2) {
      v6 = @"requestLocalTimestamp";
    }
    else {
      v6 = @"request_local_timestamp";
    }
    [v4 setObject:v5 forKey:v6];
  }
  id v7 = *(id *)(a1 + 24);
  objc_super v8 = v7;
  if (v7)
  {
    if (a2)
    {
      v9 = [v7 jsonRepresentation];
      v10 = @"significantLocation";
    }
    else
    {
      v9 = [v7 dictionaryRepresentation];
      v10 = @"significant_location";
    }
    [v4 setObject:v9 forKey:v10];
  }
  char v11 = *(unsigned char *)(a1 + 44);
  if ((v11 & 2) != 0)
  {
    v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
    if (a2) {
      v22 = @"maxNumCategoriesPerEntry";
    }
    else {
      v22 = @"max_num_categories_per_entry";
    }
    [v4 setObject:v21 forKey:v22];

    char v11 = *(unsigned char *)(a1 + 44);
    if ((v11 & 4) == 0)
    {
LABEL_14:
      if ((v11 & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)(a1 + 44) & 4) == 0)
  {
    goto LABEL_14;
  }
  uint64_t v23 = *(int *)(a1 + 36);
  if (v23 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 36));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_1E53DD198[v23];
  }
  if (a2) {
    v25 = @"userPreferredTransportType";
  }
  else {
    v25 = @"user_preferred_transport_type";
  }
  [v4 setObject:v24 forKey:v25];

  if ((*(unsigned char *)(a1 + 44) & 8) != 0)
  {
LABEL_15:
    v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    if (a2) {
      v13 = @"shouldMatchNoQueryStateSuggestions";
    }
    else {
      v13 = @"should_match_no_query_state_suggestions";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_19:
  v14 = *(void **)(a1 + 8);
  if (v14)
  {
    v15 = [v14 dictionaryRepresentation];
    v16 = v15;
    if (a2)
    {
      v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __80__GEOPDSearchZeroKeywordCategorySuggestionParameters__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E53D8860;
      id v18 = v17;
      id v27 = v18;
      [v16 enumerateKeysAndObjectsUsingBlock:v26];
      id v19 = v18;

      v16 = v19;
    }
    [v4 setObject:v16 forKey:@"Unknown Fields"];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchZeroKeywordCategorySuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __80__GEOPDSearchZeroKeywordCategorySuggestionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDSearchZeroKeywordCategorySuggestionParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_significantLocation) {
    PBDataWriterWriteSubmessage();
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 16) = self->_requestLocalTimestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  id v7 = [(GEOLatLng *)self->_significantLocation copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 36) = self->_userPreferredTransportType;
    *(unsigned char *)(v6 + 44) |= 4u;
    if ((*(unsigned char *)&self->_flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 32) = self->_maxNumCategoriesPerEntry;
  *(unsigned char *)(v6 + 44) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((flags & 8) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 40) = self->_shouldMatchNoQueryStateSuggestions;
    *(unsigned char *)(v6 + 44) |= 8u;
  }
LABEL_7:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 44);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_requestLocalTimestamp != *((double *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_22;
  }
  significantLocation = self->_significantLocation;
  if ((unint64_t)significantLocation | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](significantLocation, "isEqual:")) {
      goto LABEL_22;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_maxNumCategoriesPerEntry != *((_DWORD *)v4 + 8)) {
      goto LABEL_22;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_userPreferredTransportType != *((_DWORD *)v4 + 9)) {
      goto LABEL_22;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_22;
  }
  BOOL v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_shouldMatchNoQueryStateSuggestions)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_22;
        }
      }
      else if (*((unsigned char *)v4 + 40))
      {
        goto LABEL_22;
      }
      BOOL v8 = 1;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v8 = 0;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags)
  {
    double requestLocalTimestamp = self->_requestLocalTimestamp;
    double v5 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0) {
      double v5 = self->_requestLocalTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(GEOLatLng *)self->_significantLocation hash];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_maxNumCategoriesPerEntry;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_userPreferredTransportType;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_shouldMatchNoQueryStateSuggestions;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantLocation, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end