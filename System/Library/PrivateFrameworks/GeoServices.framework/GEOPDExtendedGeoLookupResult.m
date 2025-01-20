@interface GEOPDExtendedGeoLookupResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)setDataSourceId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDExtendedGeoLookupResult

- (void)setDataSourceId:(uint64_t)a1
{
  id v4 = a2;
  objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDExtendedGeoLookupResult;
  id v4 = [(GEOPDExtendedGeoLookupResult *)&v8 description];
  v5 = [(GEOPDExtendedGeoLookupResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExtendedGeoLookupResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 32) & 2) != 0)
    {
      v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
      if (a2) {
        v6 = @"primaryFeatureMatched";
      }
      else {
        v6 = @"primary_feature_matched";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 16)) {
      objc_msgSend(v4, "setObject:forKey:");
    }
    if (*(unsigned char *)(a1 + 32))
    {
      uint64_t v7 = *(int *)(a1 + 24);
      if (v7 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53DCAB0[v7];
      }
      [v4 setObject:v8 forKey:@"status"];
    }
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__GEOPDExtendedGeoLookupResult__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDExtendedGeoLookupResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOPDExtendedGeoLookupResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDExtendedGeoLookupResultReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_dataSourceId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 28) = self->_primaryFeatureMatched;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_dataSourceId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v6 + 24) = self->_status;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0) {
      goto LABEL_17;
    }
    if (self->_primaryFeatureMatched)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_17;
  }
  dataSourceId = self->_dataSourceId;
  if (!((unint64_t)dataSourceId | *((void *)v4 + 2))) {
    goto LABEL_13;
  }
  if (!-[NSString isEqual:](dataSourceId, "isEqual:"))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
LABEL_13:
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_status != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_primaryFeatureMatched;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_dataSourceId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_status;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end