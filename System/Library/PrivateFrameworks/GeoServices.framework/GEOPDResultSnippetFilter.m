@interface GEOPDResultSnippetFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultSnippetFilter

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDResultSnippetFilter;
  [(GEOPDResultSnippetFilter *)&v3 dealloc];
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ PBRepeatedInt32Hash();
  }
  uint64_t v2 = 2654435761 * self->_maxChildPlaces;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_supportChildItems;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_maxChildItems;
  return v3 ^ v2 ^ v4 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v7 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_5:
  if (self->_supportedChildActions.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < self->_supportedChildActions.count);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultSnippetFilter;
  id v4 = [(GEOPDResultSnippetFilter *)&v8 description];
  v5 = [(GEOPDResultSnippetFilter *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultSnippetFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_24;
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 52);
  if ((v5 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 52) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_31:
    v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    if (a2) {
      v24 = @"supportChildItems";
    }
    else {
      v24 = @"support_child_items";
    }
    [v4 setObject:v23 forKey:v24];

    if ((*(unsigned char *)(a1 + 52) & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  v21 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  if (a2) {
    v22 = @"maxChildPlaces";
  }
  else {
    v22 = @"max_child_places";
  }
  [v4 setObject:v21 forKey:v22];

  char v5 = *(unsigned char *)(a1 + 52);
  if ((v5 & 4) != 0) {
    goto LABEL_31;
  }
LABEL_4:
  if (v5)
  {
LABEL_5:
    unint64_t v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    if (a2) {
      id v7 = @"maxChildItems";
    }
    else {
      id v7 = @"max_child_items";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  if (*(void *)(a1 + 24))
  {
    objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v9 = (void *)(a1 + 16);
    if (*(void *)(a1 + 24))
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = *(int *)(*v9 + 4 * v10);
        if (v11 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = off_1E53E4060[v11];
        }
        [v8 addObject:v12];

        ++v10;
        v9 = (void *)(a1 + 16);
      }
      while (v10 < *(void *)(a1 + 24));
    }
    if (a2) {
      v13 = @"supportedChildAction";
    }
    else {
      v13 = @"supported_child_action";
    }
    [v4 setObject:v8 forKey:v13];
  }
  v14 = *(void **)(a1 + 8);
  if (v14)
  {
    v15 = [v14 dictionaryRepresentation];
    v16 = v15;
    if (a2)
    {
      v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __54__GEOPDResultSnippetFilter__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v18 = v17;
      id v26 = v18;
      [v16 enumerateKeysAndObjectsUsingBlock:v25];
      id v19 = v18;

      v16 = v19;
    }
    [v4 setObject:v16 forKey:@"Unknown Fields"];
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultSnippetFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDResultSnippetFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDResultSnippetFilterReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (id *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v4 + 48) = self->_supportChildItems;
    *(unsigned char *)(v4 + 52) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 44) = self->_maxChildPlaces;
  *(unsigned char *)(v4 + 52) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v4 + 40) = self->_maxChildItems;
    *(unsigned char *)(v4 + 52) |= 1u;
  }
LABEL_5:
  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_maxChildPlaces != *((_DWORD *)v4 + 11)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) != 0)
    {
      if (self->_supportChildItems)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_21;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_15;
      }
    }
LABEL_21:
    char IsEqual = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 52) & 4) != 0) {
    goto LABEL_21;
  }
LABEL_15:
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_maxChildItems != *((_DWORD *)v4 + 10)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_21;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_22:

  return IsEqual;
}

@end