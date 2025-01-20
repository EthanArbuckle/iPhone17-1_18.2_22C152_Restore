@interface GEOAutoCompleteResultInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSuggestionsAcType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAutoCompleteResultInfo)initWithDictionary:(id)a3;
- (GEOAutoCompleteResultInfo)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)suggestionsAcTypeAsString:(int)a3;
- (int)StringAsSuggestionsAcType:(id)a3;
- (int)suggestionsAcType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSuggestionsAcType:(BOOL)a3;
- (void)setSuggestionsAcType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAutoCompleteResultInfo

- (int)suggestionsAcType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_suggestionsAcType;
  }
  else {
    return 0;
  }
}

- (void)setSuggestionsAcType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_suggestionsAcType = a3;
}

- (void)setHasSuggestionsAcType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSuggestionsAcType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)suggestionsAcTypeAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F74A0[a3];
  }

  return v3;
}

- (int)StringAsSuggestionsAcType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AC_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_COREROUTINE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MESSAGES"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MAIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_QUERY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_PLACE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_CONTACTS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_FAVORITE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_SERVER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_USER_LOCATION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_PARKED_CAR"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_MARKED_LOCATION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_PROACTIVE"])
  {
    int v4 = 14;
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
  v8.super_class = (Class)GEOAutoCompleteResultInfo;
  int v4 = [(GEOAutoCompleteResultInfo *)&v8 description];
  v5 = [(GEOAutoCompleteResultInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAutoCompleteResultInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      uint64_t v5 = *(int *)(a1 + 8);
      if (v5 >= 0xF)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F74A0[v5];
      }
      if (a2) {
        v7 = @"suggestionsAcType";
      }
      else {
        v7 = @"suggestions_ac_type";
      }
      [v4 setObject:v6 forKey:v7];
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
  return -[GEOAutoCompleteResultInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAutoCompleteResultInfo)initWithDictionary:(id)a3
{
  return (GEOAutoCompleteResultInfo *)-[GEOAutoCompleteResultInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"suggestionsAcType";
      }
      else {
        v6 = @"suggestions_ac_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"AC_TYPE_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_COREROUTINE"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MESSAGES"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MAIL"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_QUERY"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_PLACE"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_CONTACTS"])
        {
          uint64_t v9 = 7;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_FAVORITE"])
        {
          uint64_t v9 = 8;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_SERVER"])
        {
          uint64_t v9 = 9;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT"])
        {
          uint64_t v9 = 10;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_USER_LOCATION"])
        {
          uint64_t v9 = 11;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_PARKED_CAR"])
        {
          uint64_t v9 = 12;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_MARKED_LOCATION"])
        {
          uint64_t v9 = 13;
        }
        else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_PROACTIVE"])
        {
          uint64_t v9 = 14;
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
LABEL_42:

          goto LABEL_43;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setSuggestionsAcType:v9];
      goto LABEL_42;
    }
  }
LABEL_43:

  return a1;
}

- (GEOAutoCompleteResultInfo)initWithJSON:(id)a3
{
  return (GEOAutoCompleteResultInfo *)-[GEOAutoCompleteResultInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAutoCompleteResultInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAutoCompleteResultInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  [(GEOAutoCompleteResultInfo *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_suggestionsAcType;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_suggestionsAcType;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOAutoCompleteResultInfo *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_suggestionsAcType == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_suggestionsAcType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_suggestionsAcType = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end