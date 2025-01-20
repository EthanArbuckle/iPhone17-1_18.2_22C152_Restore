@interface GEOPDAutocompleteResultSortPriorityMapping
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteResultSortPriorityMapping

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteResultSortPriorityMapping;
  v4 = [(GEOPDAutocompleteResultSortPriorityMapping *)&v8 description];
  v5 = [(GEOPDAutocompleteResultSortPriorityMapping *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteResultSortPriorityMapping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_28;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 4) != 0)
  {
    v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v7 = @"sortPriority";
    }
    else {
      v7 = @"sort_priority";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 2) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v8 = *(int *)(a1 + 20);
  if (v8 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E53DC898[v8];
  }
  if (a2) {
    v10 = @"resultType";
  }
  else {
    v10 = @"result_type";
  }
  [v4 setObject:v9 forKey:v10];

  if (*(unsigned char *)(a1 + 28))
  {
LABEL_17:
    uint64_t v11 = *(int *)(a1 + 16);
    if (v11 >= 0x1E)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53DC8F0[v11];
    }
    if (a2) {
      v13 = @"resultSubtype";
    }
    else {
      v13 = @"result_subtype";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_24:
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
      v21[2] = __72__GEOPDAutocompleteResultSortPriorityMapping__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v18 = v17;
      id v22 = v18;
      [v16 enumerateKeysAndObjectsUsingBlock:v21];
      id v19 = v18;

      v16 = v19;
    }
    [v4 setObject:v16 forKey:@"Unknown Fields"];
  }
LABEL_28:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteResultSortPriorityMapping _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __72__GEOPDAutocompleteResultSortPriorityMapping__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteResultSortPriorityMappingReadAllFrom((uint64_t)self, a3);
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
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
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
    *(_DWORD *)(v4 + 20) = self->_resultType;
    *(unsigned char *)(v4 + 28) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 24) = self->_sortPriority;
  *(unsigned char *)(v4 + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v4 + 16) = self->_resultSubtype;
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
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_sortPriority != *((_DWORD *)v4 + 6)) {
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
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_resultType != *((_DWORD *)v4 + 5)) {
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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_resultSubtype != *((_DWORD *)v4 + 4)) {
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
  uint64_t v2 = 2654435761 * self->_sortPriority;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_resultType;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_resultSubtype;
  return v3 ^ v2 ^ v4;
}

- (void).cxx_destruct
{
}

@end