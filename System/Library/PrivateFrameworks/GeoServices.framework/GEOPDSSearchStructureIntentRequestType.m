@interface GEOPDSSearchStructureIntentRequestType
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSSearchStructureIntentRequestType

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchStructureIntentRequestType;
  v4 = [(GEOPDSSearchStructureIntentRequestType *)&v8 description];
  v5 = [(GEOPDSSearchStructureIntentRequestType *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchStructureIntentRequestType _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      int v6 = *(_DWORD *)(a1 + 20);
      if (v6)
      {
        if (v6 == 1)
        {
          v7 = @"SEARCH_STRUCTURE_TYPE_UNSTRUCTURED";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 20));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v7 = @"SEARCH_STRUCTURE_TYPE_UNKNOWN";
      }
      if (a2) {
        objc_super v8 = @"structureType";
      }
      else {
        objc_super v8 = @"structure_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      uint64_t v9 = *(int *)(a1 + 16);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53DDA90[v9];
      }
      if (a2) {
        v11 = @"intentType";
      }
      else {
        v11 = @"intent_type";
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
        v19[2] = __68__GEOPDSSearchStructureIntentRequestType__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDSSearchStructureIntentRequestType _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __68__GEOPDSSearchStructureIntentRequestType__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        int v6 = @"structureType";
      }
      else {
        int v6 = @"structure_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"SEARCH_STRUCTURE_TYPE_UNKNOWN"]) {
          int v9 = 0;
        }
        else {
          int v9 = [v8 isEqualToString:@"SEARCH_STRUCTURE_TYPE_UNSTRUCTURED"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_14;
        }
        int v9 = [v7 intValue];
      }
      *(unsigned char *)(a1 + 24) |= 2u;
      *(_DWORD *)(a1 + 20) = v9;
LABEL_14:

      if (a3) {
        id v10 = @"intentType";
      }
      else {
        id v10 = @"intent_type";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"SEARCH_INTENT_TYPE_UNKNOWN"])
        {
          int v13 = 0;
        }
        else if ([v12 isEqualToString:@"SEARCH_INTENT_TYPE_POI_ONLY"])
        {
          int v13 = 1;
        }
        else if ([v12 isEqualToString:@"SEARCH_INTENT_TYPE_GEO_CODING_ONLY"])
        {
          int v13 = 2;
        }
        else if ([v12 isEqualToString:@"SEARCH_INTENT_TYPE_ANY"])
        {
          int v13 = 3;
        }
        else
        {
          int v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        int v13 = [v11 intValue];
      }
      *(unsigned char *)(a1 + 24) |= 1u;
      *(_DWORD *)(a1 + 16) = v13;
      goto LABEL_31;
    }
  }
LABEL_32:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchStructureIntentRequestTypeReadAllFrom((uint64_t)self, a3);
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
    *(_DWORD *)(v4 + 20) = self->_structureType;
    *(unsigned char *)(v4 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_intentType;
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
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_structureType != *((_DWORD *)v4 + 5)) {
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_intentType != *((_DWORD *)v4 + 4)) {
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
    uint64_t v2 = 2654435761 * self->_structureType;
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
  uint64_t v3 = 2654435761 * self->_intentType;
  return v3 ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    char v4 = v3[24];
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 20) = *((_DWORD *)v3 + 5);
      *(unsigned char *)(a1 + 24) |= 2u;
      char v4 = v3[24];
    }
    if (v4)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(unsigned char *)(a1 + 24) |= 1u;
    }
  }
}

- (void).cxx_destruct
{
}

@end