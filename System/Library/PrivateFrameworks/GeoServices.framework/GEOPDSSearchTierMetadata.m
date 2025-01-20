@interface GEOPDSSearchTierMetadata
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

@implementation GEOPDSSearchTierMetadata

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchTierMetadata;
  v4 = [(GEOPDSSearchTierMetadata *)&v8 description];
  v5 = [(GEOPDSSearchTierMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchTierMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 4) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 24);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53DDAB0[v6];
      }
      if (a2) {
        objc_super v8 = @"tierType";
      }
      else {
        objc_super v8 = @"tier_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if ((v5 & 2) != 0)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v10 = @"startIndex";
      }
      else {
        v10 = @"start_index";
      }
      [v4 setObject:v9 forKey:v10];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if (v5)
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v12 = @"endIndex";
      }
      else {
        v12 = @"end_index";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __54__GEOPDSSearchTierMetadata__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOPDSSearchTierMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDSSearchTierMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_29;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_29;
  }
  if (a3) {
    uint64_t v6 = @"tierType";
  }
  else {
    uint64_t v6 = @"tier_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"SEARCH_TIER_METADATA_UNKNOWN"])
    {
      int v9 = 0;
    }
    else if ([v8 isEqualToString:@"SEARCH_TIER_METADATA_PRIMARY"])
    {
      int v9 = 1;
    }
    else if ([v8 isEqualToString:@"SEARCH_TIER_METADATA_AUXILIARY"])
    {
      int v9 = 2;
    }
    else
    {
      int v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = [v7 intValue];
LABEL_17:
    *(unsigned char *)(a1 + 28) |= 4u;
    *(_DWORD *)(a1 + 24) = v9;
  }

  if (a3) {
    id v10 = @"startIndex";
  }
  else {
    id v10 = @"start_index";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v12 = [v11 unsignedIntValue];
    *(unsigned char *)(a1 + 28) |= 2u;
    *(_DWORD *)(a1 + 20) = v12;
  }

  if (a3) {
    v13 = @"endIndex";
  }
  else {
    v13 = @"end_index";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = [v14 unsignedIntValue];
    *(unsigned char *)(a1 + 28) |= 1u;
    *(_DWORD *)(a1 + 16) = v15;
  }

LABEL_29:
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchTierMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v4 + 20) = self->_startIndex;
    *(unsigned char *)(v4 + 28) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 24) = self->_tierType;
  *(unsigned char *)(v4 + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v4 + 16) = self->_endIndex;
    *(unsigned char *)(v4 + 28) |= 1u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_tierType != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_startIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_endIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_tierType;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_startIndex;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_endIndex;
  return v3 ^ v2 ^ v4;
}

- (void).cxx_destruct
{
}

@end