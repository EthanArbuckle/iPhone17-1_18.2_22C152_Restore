@interface GEOPDResolvedItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extractedTerm;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)setExtractedTerm:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResolvedItem

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    v4 = (void *)v3[2];
    if (v4)
    {
      v6 = v3;
      -[GEOPDResolvedItem setExtractedTerm:](a1, v4);
      v3 = v6;
    }
    char v5 = *((unsigned char *)v3 + 32);
    if (v5)
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(unsigned char *)(a1 + 32) |= 1u;
      char v5 = *((unsigned char *)v3 + 32);
    }
    if ((v5 & 2) != 0)
    {
      *(_DWORD *)(a1 + 28) = *((_DWORD *)v3 + 7);
      *(unsigned char *)(a1 + 32) |= 2u;
    }
  }
}

- (id)extractedTerm
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setExtractedTerm:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResolvedItem;
  id v4 = [(GEOPDResolvedItem *)&v8 description];
  char v5 = [(GEOPDResolvedItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResolvedItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = v4;
    if (*(void *)(a1 + 16)) {
      objc_msgSend(v4, "setObject:forKey:");
    }
    char v6 = *(unsigned char *)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = *(int *)(a1 + 24);
      if (v7 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53E4028[v7];
      }
      if (a2) {
        v9 = @"resolvedItemType";
      }
      else {
        v9 = @"resolved_item_type";
      }
      [v5 setObject:v8 forKey:v9];

      char v6 = *(unsigned char *)(a1 + 32);
    }
    if ((v6 & 2) != 0)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        v11 = @"resultIndex";
      }
      else {
        v11 = @"result_index";
      }
      [v5 setObject:v10 forKey:v11];
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
        v19[2] = __47__GEOPDResolvedItem__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v5 setObject:v14 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDResolvedItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDResolvedItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_37;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_37;
  }
  if (a3) {
    char v6 = @"extractedTerm";
  }
  else {
    char v6 = @"extracted_term";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    -[GEOPDResolvedItem setExtractedTerm:](a1, v8);
  }
  if (a3) {
    v9 = @"resolvedItemType";
  }
  else {
    v9 = @"resolved_item_type";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
    {
      int v12 = 0;
    }
    else if ([v11 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
    {
      int v12 = 1;
    }
    else if ([v11 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
    {
      int v12 = 2;
    }
    else if ([v11 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
    {
      int v12 = 3;
    }
    else if ([v11 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
    {
      int v12 = 4;
    }
    else if ([v11 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
    {
      int v12 = 5;
    }
    else if ([v11 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
    {
      int v12 = 6;
    }
    else
    {
      int v12 = 0;
    }

    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v12 = [v10 intValue];
LABEL_30:
    *(unsigned char *)(a1 + 32) |= 1u;
    *(_DWORD *)(a1 + 24) = v12;
  }

  if (a3) {
    v13 = @"resultIndex";
  }
  else {
    v13 = @"result_index";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = [v14 unsignedIntValue];
    *(unsigned char *)(a1 + 32) |= 2u;
    *(_DWORD *)(a1 + 28) = v15;
  }

LABEL_37:
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResolvedItemReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_extractedTerm)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_extractedTerm copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_resolvedItemType;
    *(unsigned char *)(v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_resultIndex;
    *(unsigned char *)(v5 + 32) |= 2u;
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
  extractedTerm = self->_extractedTerm;
  if ((unint64_t)extractedTerm | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](extractedTerm, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_resolvedItemType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_resultIndex != *((_DWORD *)v4 + 7)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_extractedTerm hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_resolvedItemType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_resultIndex;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedTerm, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end