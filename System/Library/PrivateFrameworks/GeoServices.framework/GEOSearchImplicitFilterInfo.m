@interface GEOSearchImplicitFilterInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSearchAlongRouteMuid;
- (BOOL)hasSearchImplicitType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSearchImplicitFilterInfo)initWithDictionary:(id)a3;
- (GEOSearchImplicitFilterInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)searchImplicitTypeAsString:(int)a3;
- (int)StringAsSearchImplicitType:(id)a3;
- (int)searchImplicitType;
- (unint64_t)hash;
- (unint64_t)searchAlongRouteMuid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSearchAlongRouteMuid:(BOOL)a3;
- (void)setHasSearchImplicitType:(BOOL)a3;
- (void)setSearchAlongRouteMuid:(unint64_t)a3;
- (void)setSearchImplicitType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSearchImplicitFilterInfo

- (int)searchImplicitType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_searchImplicitType;
  }
  else {
    return 0;
  }
}

- (void)setSearchImplicitType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_searchImplicitType = a3;
}

- (void)setHasSearchImplicitType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSearchImplicitType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)searchImplicitTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E7E00[a3];
  }

  return v3;
}

- (int)StringAsSearchImplicitType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCH_FOR_EVCHARGER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEARCH_AROUND_POI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAILS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SEARCH_BEACHES"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)searchAlongRouteMuid
{
  return self->_searchAlongRouteMuid;
}

- (void)setSearchAlongRouteMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_searchAlongRouteMuid = a3;
}

- (void)setHasSearchAlongRouteMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSearchAlongRouteMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchImplicitFilterInfo;
  int v4 = [(GEOSearchImplicitFilterInfo *)&v8 description];
  v5 = [(GEOSearchImplicitFilterInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchImplicitFilterInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
      uint64_t v6 = *(int *)(a1 + 24);
      if (v6 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53E7E00[v6];
      }
      if (a2) {
        objc_super v8 = @"searchImplicitType";
      }
      else {
        objc_super v8 = @"search_implicit_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v10 = @"searchAlongRouteMuid";
      }
      else {
        v10 = @"search_along_route_muid";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __57__GEOSearchImplicitFilterInfo__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOSearchImplicitFilterInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOSearchImplicitFilterInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSearchImplicitFilterInfo)initWithDictionary:(id)a3
{
  return (GEOSearchImplicitFilterInfo *)-[GEOSearchImplicitFilterInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_28;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_28;
  }
  if (a3) {
    uint64_t v6 = @"searchImplicitType";
  }
  else {
    uint64_t v6 = @"search_implicit_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"SEARCH_FOR_EVCHARGER"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"SEARCH_AROUND_POI"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"SEARCH_TRAILS"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"SEARCH_BEACHES"])
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
    [a1 setSearchImplicitType:v9];
  }

  if (a3) {
    id v10 = @"searchAlongRouteMuid";
  }
  else {
    id v10 = @"search_along_route_muid";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSearchAlongRouteMuid:", objc_msgSend(v11, "unsignedLongLongValue"));
  }

LABEL_28:
  return a1;
}

- (GEOSearchImplicitFilterInfo)initWithJSON:(id)a3
{
  return (GEOSearchImplicitFilterInfo *)-[GEOSearchImplicitFilterInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSearchImplicitFilterInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchImplicitFilterInfoReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteUint64Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOSearchImplicitFilterInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[6] = self->_searchImplicitType;
    *((unsigned char *)v5 + 28) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)v5 + 2) = self->_searchAlongRouteMuid;
    *((unsigned char *)v5 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 24) = self->_searchImplicitType;
    *(unsigned char *)(v4 + 28) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v4 + 16) = self->_searchAlongRouteMuid;
    *(unsigned char *)(v4 + 28) |= 1u;
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
  [(GEOSearchImplicitFilterInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_searchImplicitType != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_searchAlongRouteMuid != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOSearchImplicitFilterInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_searchImplicitType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_searchAlongRouteMuid;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 2) != 0)
  {
    self->_searchImplicitType = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 28);
  }
  if (v4)
  {
    self->_searchAlongRouteMuid = *((void *)v5 + 2);
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
    [(GEOSearchImplicitFilterInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end