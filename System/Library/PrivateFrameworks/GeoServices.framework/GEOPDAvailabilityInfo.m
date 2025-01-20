@interface GEOPDAvailabilityInfo
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

@implementation GEOPDAvailabilityInfo

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAvailabilityInfo;
  v4 = [(GEOPDAvailabilityInfo *)&v8 description];
  v5 = [(GEOPDAvailabilityInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAvailabilityInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_22;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if (v5)
  {
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v7 = @"availableNum";
    }
    else {
      v7 = @"available_num";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_18;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  if (a2) {
    v9 = @"totalNum";
  }
  else {
    v9 = @"total_num";
  }
  [v4 setObject:v8 forKey:v9];

  if ((*(unsigned char *)(a1 + 28) & 2) != 0)
  {
LABEL_14:
    uint64_t v10 = *(int *)(a1 + 20);
    if (v10 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E53E36E0[v10];
    }
    [v4 setObject:v11 forKey:@"status"];
  }
LABEL_18:
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
      v19[2] = __51__GEOPDAvailabilityInfo__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v16 = v15;
      id v20 = v16;
      [v14 enumerateKeysAndObjectsUsingBlock:v19];
      id v17 = v16;

      v14 = v17;
    }
    [v4 setObject:v14 forKey:@"Unknown Fields"];
  }
LABEL_22:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAvailabilityInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDAvailabilityInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"availableNum";
    }
    else {
      v7 = @"available_num";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [v8 unsignedIntValue];
      *(unsigned char *)(v6 + 28) |= 1u;
      *(_DWORD *)(v6 + 16) = v9;
    }

    if (a3) {
      id v10 = @"totalNum";
    }
    else {
      id v10 = @"total_num";
    }
    v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = [v11 unsignedIntValue];
      *(unsigned char *)(v6 + 28) |= 4u;
      *(_DWORD *)(v6 + 24) = v12;
    }

    v13 = [v5 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      if ([v14 isEqualToString:@"NO_STATUS"])
      {
        int v15 = 0;
      }
      else if ([v14 isEqualToString:@"PLUGS_AVAILABLE"])
      {
        int v15 = 1;
      }
      else if ([v14 isEqualToString:@"NO_PLUGS_AVAILABLE"])
      {
        int v15 = 2;
      }
      else
      {
        int v15 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      int v15 = [v13 intValue];
    }
    *(unsigned char *)(v6 + 28) |= 2u;
    *(_DWORD *)(v6 + 20) = v15;
    goto LABEL_24;
  }
LABEL_25:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAvailabilityInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
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
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v4 + 24) = self->_totalNum;
    *(unsigned char *)(v4 + 28) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 16) = self->_availableNum;
  *(unsigned char *)(v4 + 28) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 20) = self->_status;
    *(unsigned char *)(v4 + 28) |= 2u;
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
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_availableNum != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_totalNum != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_status != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_availableNum;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_totalNum;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_status;
  return v3 ^ v2 ^ v4;
}

- (void).cxx_destruct
{
}

@end