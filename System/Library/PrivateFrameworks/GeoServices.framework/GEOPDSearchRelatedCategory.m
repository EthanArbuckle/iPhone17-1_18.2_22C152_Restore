@interface GEOPDSearchRelatedCategory
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

@implementation GEOPDSearchRelatedCategory

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchRelatedCategory;
  v4 = [(GEOPDSearchRelatedCategory *)&v8 description];
  v5 = [(GEOPDSearchRelatedCategory *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchRelatedCategory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = v4;
    if (*(void *)(a1 + 16)) {
      objc_msgSend(v4, "setObject:forKey:");
    }
    char v6 = *(unsigned char *)(a1 + 28);
    if ((v6 & 2) != 0)
    {
      uint64_t v7 = *(int *)(a1 + 24);
      if (v7 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53E2938[v7];
      }
      [v5 setObject:v8 forKey:@"type"];

      char v6 = *(unsigned char *)(a1 + 28);
    }
    if (v6)
    {
      v9 = [NSNumber numberWithLongLong:*(void *)(a1 + 8)];
      if (a2) {
        v10 = @"densityScore";
      }
      else {
        v10 = @"density_score";
      }
      [v5 setObject:v9 forKey:v10];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchRelatedCategory _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_25;
  }
  if (a3) {
    uint64_t v7 = @"entityId";
  }
  else {
    uint64_t v7 = @"entity_id";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)[v8 copy];
    id v10 = v9;
    objc_storeStrong((id *)(v6 + 16), v9);
  }
  v11 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"CATEGORY_RELATIONSHIP_TYPE_UNKNOWN"])
    {
      int v13 = 0;
    }
    else if ([v12 isEqualToString:@"CATEGORY_RELATIONSHIP_TYPE_SIMILAR"])
    {
      int v13 = 1;
    }
    else if ([v12 isEqualToString:@"CATEGORY_RELATIONSHIP_TYPE_HAS_BROADER"])
    {
      int v13 = 2;
    }
    else
    {
      int v13 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [v11 intValue];
LABEL_18:
    *(unsigned char *)(v6 + 28) |= 2u;
    *(_DWORD *)(v6 + 24) = v13;
  }

  if (a3) {
    v14 = @"densityScore";
  }
  else {
    v14 = @"density_score";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v15 longLongValue];
    *(unsigned char *)(v6 + 28) |= 1u;
    *(void *)(v6 + 8) = v16;
  }

LABEL_25:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchRelatedCategoryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_entityId)
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
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_entityId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 28) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 8) = self->_densityScore;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  entityId = self->_entityId;
  if ((unint64_t)entityId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](entityId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_densityScore != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_entityId hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
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
  uint64_t v5 = 2654435761 * self->_densityScore;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
}

@end