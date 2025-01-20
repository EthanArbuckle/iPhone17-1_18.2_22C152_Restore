@interface GEORPSearchFeedbackCorrections
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrectionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPSearchFeedbackCorrections)initWithDictionary:(id)a3;
- (GEORPSearchFeedbackCorrections)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctionTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCorrectionType:(id)a3;
- (int)correctionType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCorrectionType:(int)a3;
- (void)setHasCorrectionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPSearchFeedbackCorrections

- (int)correctionType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_correctionType;
  }
  else {
    return 0;
  }
}

- (void)setCorrectionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCorrectionType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DBD78[a3];
  }

  return v3;
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SEARCH_CORRECTION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_POI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_POI_CATEGORY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_ADDRESS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_LOCALITY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_OTHER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SEARCH_CORRECTION_TYPE_UNEXPECTED_RESULT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SEARCH_CORRECTION_TYPE_OTHER"])
  {
    int v4 = 7;
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
  v8.super_class = (Class)GEORPSearchFeedbackCorrections;
  int v4 = [(GEORPSearchFeedbackCorrections *)&v8 description];
  v5 = [(GEORPSearchFeedbackCorrections *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSearchFeedbackCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if (v5 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DBD78[v5];
      }
      if (a2) {
        v7 = @"correctionType";
      }
      else {
        v7 = @"correction_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __60__GEORPSearchFeedbackCorrections__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
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
  return -[GEORPSearchFeedbackCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEORPSearchFeedbackCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPSearchFeedbackCorrections)initWithDictionary:(id)a3
{
  return (GEORPSearchFeedbackCorrections *)-[GEORPSearchFeedbackCorrections _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"correctionType";
      }
      else {
        v6 = @"correction_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"SEARCH_CORRECTION_TYPE_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_POI"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_POI_CATEGORY"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_ADDRESS"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_LOCALITY"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"SEARCH_AC_CORRECTION_TYPE_OTHER"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"SEARCH_CORRECTION_TYPE_UNEXPECTED_RESULT"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"SEARCH_CORRECTION_TYPE_OTHER"])
        {
          uint64_t v9 = 7;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setCorrectionType:v9];
      goto LABEL_28;
    }
  }
LABEL_29:

  return a1;
}

- (GEORPSearchFeedbackCorrections)initWithJSON:(id)a3
{
  return (GEORPSearchFeedbackCorrections *)-[GEORPSearchFeedbackCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSearchFeedbackCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSearchFeedbackCorrectionsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPSearchFeedbackCorrections *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[4] = self->_correctionType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 16) = self->_correctionType;
    *(unsigned char *)(v4 + 20) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEORPSearchFeedbackCorrections *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_correctionType == *((_DWORD *)v4 + 4))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_correctionType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  [v4 readAll:0];
  if (v4[5])
  {
    self->_correctionType = v4[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
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
    [(GEORPSearchFeedbackCorrections *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end