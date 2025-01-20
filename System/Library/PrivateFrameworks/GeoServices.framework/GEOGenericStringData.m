@interface GEOGenericStringData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPrivacyFilterType;
- (BOOL)hasStringSubstituteType;
- (BOOL)hasTokenSubstitute;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOGenericStringData)initWithDictionary:(id)a3;
- (GEOGenericStringData)initWithJSON:(id)a3;
- (NSString)tokenSubstitute;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)privacyFilterTypeAsString:(int)a3;
- (id)stringSubstituteTypeAsString:(int)a3;
- (int)StringAsPrivacyFilterType:(id)a3;
- (int)StringAsStringSubstituteType:(id)a3;
- (int)privacyFilterType;
- (int)stringSubstituteType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPrivacyFilterType:(BOOL)a3;
- (void)setHasStringSubstituteType:(BOOL)a3;
- (void)setPrivacyFilterType:(int)a3;
- (void)setStringSubstituteType:(int)a3;
- (void)setTokenSubstitute:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOGenericStringData

- (BOOL)hasTokenSubstitute
{
  return self->_tokenSubstitute != 0;
}

- (NSString)tokenSubstitute
{
  return self->_tokenSubstitute;
}

- (void)setTokenSubstitute:(id)a3
{
}

- (int)stringSubstituteType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_stringSubstituteType;
  }
  else {
    return 0;
  }
}

- (void)setStringSubstituteType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_stringSubstituteType = a3;
}

- (void)setHasStringSubstituteType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStringSubstituteType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)stringSubstituteTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E01C0[a3];
  }

  return v3;
}

- (int)StringAsStringSubstituteType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TEXT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTACT_NAME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"POI_NAME"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ADDRESS_LABEL"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)privacyFilterType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_privacyFilterType;
  }
  else {
    return 1;
  }
}

- (void)setPrivacyFilterType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_privacyFilterType = a3;
}

- (void)setHasPrivacyFilterType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPrivacyFilterType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)privacyFilterTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E01F0[a3];
  }

  return v3;
}

- (int)StringAsPrivacyFilterType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PRIVACY_FILTER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRIVACY_FILTER_PUBLIC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRIVACY_FILTER_AMBIGUOUS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PRIVACY_FILTER_PRIVATE"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)GEOGenericStringData;
  int v4 = [(GEOGenericStringData *)&v8 description];
  v5 = [(GEOGenericStringData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGenericStringData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 tokenSubstitute];
    if (v5)
    {
      if (a2) {
        v6 = @"tokenSubstitute";
      }
      else {
        v6 = @"token_substitute";
      }
      [v4 setObject:v5 forKey:v6];
    }

    char v7 = *(unsigned char *)(a1 + 32);
    if ((v7 & 2) != 0)
    {
      uint64_t v8 = *(int *)(a1 + 28);
      if (v8 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53E01C0[v8];
      }
      if (a2) {
        v10 = @"stringSubstituteType";
      }
      else {
        v10 = @"string_substitute_type";
      }
      [v4 setObject:v9 forKey:v10];

      char v7 = *(unsigned char *)(a1 + 32);
    }
    if (v7)
    {
      uint64_t v11 = *(int *)(a1 + 24);
      if (v11 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E53E01F0[v11];
      }
      if (a2) {
        v13 = @"privacyFilterType";
      }
      else {
        v13 = @"privacy_filter_type";
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
        v21[2] = __50__GEOGenericStringData__dictionaryRepresentation___block_invoke;
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
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGenericStringData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOGenericStringData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOGenericStringData)initWithDictionary:(id)a3
{
  return (GEOGenericStringData *)-[GEOGenericStringData _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"tokenSubstitute";
      }
      else {
        v6 = @"token_substitute";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = (void *)[v7 copy];
        [a1 setTokenSubstitute:v8];
      }
      if (a3) {
        v9 = @"stringSubstituteType";
      }
      else {
        v9 = @"string_substitute_type";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v12 = 0;
        }
        else if ([v11 isEqualToString:@"TEXT"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"ADDRESS"])
        {
          uint64_t v12 = 2;
        }
        else if ([v11 isEqualToString:@"CONTACT_NAME"])
        {
          uint64_t v12 = 3;
        }
        else if ([v11 isEqualToString:@"POI_NAME"])
        {
          uint64_t v12 = 4;
        }
        else if ([v11 isEqualToString:@"ADDRESS_LABEL"])
        {
          uint64_t v12 = 5;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_29;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setStringSubstituteType:v12];
LABEL_29:

      if (a3) {
        v13 = @"privacyFilterType";
      }
      else {
        v13 = @"privacy_filter_type";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"PRIVACY_FILTER_UNKNOWN"])
        {
          uint64_t v16 = 0;
        }
        else if ([v15 isEqualToString:@"PRIVACY_FILTER_PUBLIC"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"PRIVACY_FILTER_AMBIGUOUS"])
        {
          uint64_t v16 = 2;
        }
        else if ([v15 isEqualToString:@"PRIVACY_FILTER_PRIVATE"])
        {
          uint64_t v16 = 3;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_46:

          goto LABEL_47;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setPrivacyFilterType:v16];
      goto LABEL_46;
    }
  }
LABEL_47:

  return a1;
}

- (GEOGenericStringData)initWithJSON:(id)a3
{
  return (GEOGenericStringData *)-[GEOGenericStringData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGenericStringDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGenericStringDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_tokenSubstitute)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOGenericStringData *)self readAll:0];
  if (self->_tokenSubstitute) {
    objc_msgSend(v5, "setTokenSubstitute:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_stringSubstituteType;
    *((unsigned char *)v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v5 + 6) = self->_privacyFilterType;
    *((unsigned char *)v5 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tokenSubstitute copyWithZone:a3];
  char v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_stringSubstituteType;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_privacyFilterType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOGenericStringData *)self readAll:1];
  [v4 readAll:1];
  tokenSubstitute = self->_tokenSubstitute;
  if ((unint64_t)tokenSubstitute | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](tokenSubstitute, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_stringSubstituteType != *((_DWORD *)v4 + 7)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_privacyFilterType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOGenericStringData *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_tokenSubstitute hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_stringSubstituteType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_privacyFilterType;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  if (*((void *)v5 + 2)) {
    -[GEOGenericStringData setTokenSubstitute:](self, "setTokenSubstitute:");
  }
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) != 0)
  {
    self->_stringSubstituteType = v5[7];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 32);
  }
  if (v4)
  {
    self->_privacyFilterType = v5[6];
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
    [(GEOGenericStringData *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSubstitute, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end