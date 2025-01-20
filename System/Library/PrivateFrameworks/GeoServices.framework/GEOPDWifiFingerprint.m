@interface GEOPDWifiFingerprint
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

@implementation GEOPDWifiFingerprint

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDWifiFingerprint;
  v4 = [(GEOPDWifiFingerprint *)&v8 description];
  v5 = [(GEOPDWifiFingerprint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDWifiFingerprint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_10;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
      goto LABEL_4;
    }
    goto LABEL_31;
  }
  int v14 = *(_DWORD *)(a1 + 24);
  if (v14 > 29)
  {
    if (v14 > 49)
    {
      if (v14 == 50)
      {
        v15 = @"STATUS_DEDUPED";
        goto LABEL_30;
      }
      if (v14 == 60)
      {
        v15 = @"VERSION_MISMATCH";
        goto LABEL_30;
      }
    }
    else
    {
      if (v14 == 30)
      {
        v15 = @"NEEDS_REFINEMENT";
        goto LABEL_30;
      }
      if (v14 == 40)
      {
        v15 = @"FAILED_NOT_AUTHORIZED";
        goto LABEL_30;
      }
    }
LABEL_25:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v15 = @"STATUS_SUCCESS";
  switch(v14)
  {
    case 0:
      break;
    case 1:
      v15 = @"STATUS_FAILED";
      break;
    case 2:
      v15 = @"STATUS_INCOMPLETE";
      break;
    case 3:
    case 4:
      goto LABEL_25;
    case 5:
      v15 = @"INVALID_REQUEST";
      break;
    default:
      if (v14 != 20) {
        goto LABEL_25;
      }
      v15 = @"FAILED_NO_RESULT";
      break;
  }
LABEL_30:
  [v4 setObject:v15 forKey:@"status"];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_31:
  uint64_t v16 = *(int *)(a1 + 20);
  if (v16 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E53E43B8[v16];
  }
  if (a2) {
    v18 = @"labelType";
  }
  else {
    v18 = @"label_type";
  }
  [v4 setObject:v17 forKey:v18];

  if (*(unsigned char *)(a1 + 28))
  {
LABEL_5:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    [v4 setObject:v6 forKey:@"confidence"];
  }
LABEL_6:
  v7 = *(void **)(a1 + 8);
  if (v7)
  {
    objc_super v8 = [v7 dictionaryRepresentation];
    v9 = v8;
    if (a2)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __50__GEOPDWifiFingerprint__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v11 = v10;
      id v20 = v11;
      [v9 enumerateKeysAndObjectsUsingBlock:v19];
      id v12 = v11;

      v9 = v12;
    }
    [v4 setObject:v9 forKey:@"Unknown Fields"];
  }
LABEL_10:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDWifiFingerprint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOPDWifiFingerprint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDWifiFingerprintReadAllFrom((uint64_t)self, a3);
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
    *(_DWORD *)(v4 + 20) = self->_labelType;
    *(unsigned char *)(v4 + 28) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 24) = self->_status;
  *(unsigned char *)(v4 + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v4 + 16) = self->_confidence;
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
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_status != *((_DWORD *)v4 + 6)) {
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
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_labelType != *((_DWORD *)v4 + 5)) {
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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_confidence != *((_DWORD *)v4 + 4)) {
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
  uint64_t v2 = 2654435761 * self->_status;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_labelType;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_confidence;
  return v3 ^ v2 ^ v4;
}

- (void).cxx_destruct
{
}

@end