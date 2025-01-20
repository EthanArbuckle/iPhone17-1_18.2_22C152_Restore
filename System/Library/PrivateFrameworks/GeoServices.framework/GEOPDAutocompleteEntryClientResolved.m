@interface GEOPDAutocompleteEntryClientResolved
+ (BOOL)isValid:(id)a3;
- (BOOL)hasResolvedItemType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteEntryClientResolved)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntryClientResolved)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resolvedItemTypeAsString:(int)a3;
- (int)StringAsResolvedItemType:(id)a3;
- (int)resolvedItemType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasResolvedItemType:(BOOL)a3;
- (void)setResolvedItemType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntryClientResolved

- (int)resolvedItemType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_resolvedItemType;
  }
  else {
    return 0;
  }
}

- (void)setResolvedItemType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_resolvedItemType = a3;
}

- (void)setHasResolvedItemType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasResolvedItemType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)resolvedItemTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DD700[a3];
  }

  return v3;
}

- (int)StringAsResolvedItemType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
  {
    int v4 = 6;
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
  v8.super_class = (Class)GEOPDAutocompleteEntryClientResolved;
  int v4 = [(GEOPDAutocompleteEntryClientResolved *)&v8 description];
  v5 = [(GEOPDAutocompleteEntryClientResolved *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryClientResolved _dictionaryRepresentation:]((uint64_t)self, 0);
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
      if (v5 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DD700[v5];
      }
      if (a2) {
        v7 = @"resolvedItemType";
      }
      else {
        v7 = @"resolved_item_type";
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
        v15[2] = __66__GEOPDAutocompleteEntryClientResolved__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDAutocompleteEntryClientResolved _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPDAutocompleteEntryClientResolved__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryClientResolved)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryClientResolved *)-[GEOPDAutocompleteEntryClientResolved _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"resolvedItemType";
      }
      else {
        v6 = @"resolved_item_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
        {
          uint64_t v9 = 6;
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
LABEL_26:

          goto LABEL_27;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setResolvedItemType:v9];
      goto LABEL_26;
    }
  }
LABEL_27:

  return a1;
}

- (GEOPDAutocompleteEntryClientResolved)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryClientResolved *)-[GEOPDAutocompleteEntryClientResolved _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryClientResolvedIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryClientResolvedReadAllFrom((uint64_t)self, a3);
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
  [(GEOPDAutocompleteEntryClientResolved *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[4] = self->_resolvedItemType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 16) = self->_resolvedItemType;
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
  [(GEOPDAutocompleteEntryClientResolved *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_resolvedItemType == *((_DWORD *)v4 + 4))
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
    return 2654435761 * self->_resolvedItemType;
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
    self->_resolvedItemType = v4[4];
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
    [(GEOPDAutocompleteEntryClientResolved *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end