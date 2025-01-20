@interface GEOPDClientRankingFeatureTypeSource
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDClientRankingFeatureTypeSource

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureTypeSource;
  v4 = [(GEOPDClientRankingFeatureTypeSource *)&v8 description];
  v5 = [(GEOPDClientRankingFeatureTypeSource *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureTypeSource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 20);
      if (v6 >= 0xF)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53DD888[v6];
      }
      if (a2) {
        objc_super v8 = @"suggestionType";
      }
      else {
        objc_super v8 = @"suggestion_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      uint64_t v9 = *(int *)(a1 + 16);
      if (v9 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53DD900[v9];
      }
      if (a2) {
        v11 = @"serverEntryType";
      }
      else {
        v11 = @"server_entry_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __65__GEOPDClientRankingFeatureTypeSource__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOPDClientRankingFeatureTypeSource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __65__GEOPDClientRankingFeatureTypeSource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"suggestionType";
    }
    else {
      v7 = @"suggestion_type";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ([v9 isEqualToString:@"AC_TYPE_UNKNOWN"])
      {
        int v10 = 0;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_COREROUTINE"])
      {
        int v10 = 1;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MESSAGES"])
      {
        int v10 = 2;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MAIL"])
      {
        int v10 = 3;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_QUERY"])
      {
        int v10 = 4;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS"])
      {
        int v10 = 5;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_PLACE"])
      {
        int v10 = 6;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_CONTACTS"])
      {
        int v10 = 7;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_FAVORITE"])
      {
        int v10 = 8;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_SERVER"])
      {
        int v10 = 9;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT"])
      {
        int v10 = 10;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_USER_LOCATION"])
      {
        int v10 = 11;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_PARKED_CAR"])
      {
        int v10 = 12;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_MARKED_LOCATION"])
      {
        int v10 = 13;
      }
      else if ([v9 isEqualToString:@"AC_TYPE_CLIENT_PROACTIVE"])
      {
        int v10 = 14;
      }
      else
      {
        int v10 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_41;
      }
      int v10 = [v8 intValue];
    }
    *(unsigned char *)(v6 + 24) |= 2u;
    *(_DWORD *)(v6 + 20) = v10;
LABEL_41:

    if (a3) {
      v11 = @"serverEntryType";
    }
    else {
      v11 = @"server_entry_type";
    }
    v12 = [v5 objectForKeyedSubscript:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      if ([v13 isEqualToString:@"QUERY"])
      {
        int v14 = 0;
      }
      else if ([v13 isEqualToString:@"BUSINESS"])
      {
        int v14 = 1;
      }
      else if ([v13 isEqualToString:@"ADDRESS"])
      {
        int v14 = 2;
      }
      else if ([v13 isEqualToString:@"CATEGORY"])
      {
        int v14 = 3;
      }
      else if ([v13 isEqualToString:@"BRAND_PROFILE"])
      {
        int v14 = 4;
      }
      else if ([v13 isEqualToString:@"OFFLINE_AREA"])
      {
        int v14 = 5;
      }
      else if ([v13 isEqualToString:@"CLIENT_RESOLVED"])
      {
        int v14 = 6;
      }
      else if ([v13 isEqualToString:@"DIRECTION_INTENT"])
      {
        int v14 = 7;
      }
      else if ([v13 isEqualToString:@"COLLECTION"])
      {
        int v14 = 8;
      }
      else if ([v13 isEqualToString:@"PUBLISHER"])
      {
        int v14 = 9;
      }
      else
      {
        int v14 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_70:

        goto LABEL_71;
      }
      int v14 = [v12 intValue];
    }
    *(unsigned char *)(v6 + 24) |= 1u;
    *(_DWORD *)(v6 + 16) = v14;
    goto LABEL_70;
  }
LABEL_71:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureTypeSourceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_suggestionType;
    *(unsigned char *)(v4 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_serverEntryType;
    *(unsigned char *)(v4 + 24) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_suggestionType != *((_DWORD *)v4 + 5)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_serverEntryType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_suggestionType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_serverEntryType;
  return v3 ^ v2;
}

- (void).cxx_destruct
{
}

@end