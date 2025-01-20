@interface GEOPDOverallFilterReason
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

@implementation GEOPDOverallFilterReason

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDOverallFilterReason;
  v4 = [(GEOPDOverallFilterReason *)&v8 description];
  v5 = [(GEOPDOverallFilterReason *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDOverallFilterReason _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 20) - 15400;
      if (v6 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 20));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53E5BF0[v6];
      }
      if (a2) {
        objc_super v8 = @"reasonType";
      }
      else {
        objc_super v8 = @"reason_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v10 = @"proxyErrorHttpStatus";
      }
      else {
        v10 = @"proxy_error_http_status";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __54__GEOPDOverallFilterReason__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOPDOverallFilterReason _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDOverallFilterReason__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    id v5 = (int *)MEMORY[0x1E4F940E8];
    unsigned int v6 = (int *)MEMORY[0x1E4F940E0];
    v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      objc_super v8 = (int *)MEMORY[0x1E4F940B8];
      while (1)
      {
        if (v4[*v7]) {
          goto LABEL_49;
        }
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = *v5;
          uint64_t v13 = *(void *)&v4[v12];
          unint64_t v14 = v13 + 1;
          if (v13 == -1 || v14 > *(void *)&v4[*v6]) {
            break;
          }
          char v15 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
          *(void *)&v4[v12] = v14;
          v11 |= (unint64_t)(v15 & 0x7F) << v9;
          if ((v15 & 0x80) == 0) {
            goto LABEL_13;
          }
          v9 += 7;
          if (v10++ >= 9)
          {
            unint64_t v11 = 0;
            int v17 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        int v17 = v4[*v7];
        if (v4[*v7]) {
          unint64_t v11 = 0;
        }
LABEL_15:
        if (v17 || (v11 & 7) == 4) {
          goto LABEL_49;
        }
        if ((v11 >> 3) == 2) {
          break;
        }
        if ((v11 >> 3) == 1)
        {
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)&self->_flags |= 2u;
          while (1)
          {
            uint64_t v22 = *v5;
            uint64_t v23 = *(void *)&v4[v22];
            unint64_t v24 = v23 + 1;
            if (v23 == -1 || v24 > *(void *)&v4[*v6])
            {
              v27 = &OBJC_IVAR___GEOPDOverallFilterReason__reasonType;
              goto LABEL_41;
            }
            char v25 = *(unsigned char *)(*(void *)&v4[*v8] + v23);
            *(void *)&v4[v22] = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0) {
              break;
            }
            v19 += 7;
            BOOL v26 = v20++ > 8;
            if (v26)
            {
              LODWORD(v21) = 0;
              v27 = &OBJC_IVAR___GEOPDOverallFilterReason__reasonType;
              goto LABEL_44;
            }
          }
          v27 = &OBJC_IVAR___GEOPDOverallFilterReason__reasonType;
LABEL_42:
          if (v4[*v7]) {
            LODWORD(v21) = 0;
          }
LABEL_44:
          *(_DWORD *)((char *)&self->super.super.isa + *v27) = v21;
          goto LABEL_45;
        }
        if (!self->_unknownFields)
        {
          v34 = (PBUnknownFields *)objc_alloc_init(MEMORY[0x1E4F940B0]);
          unknownFields = self->_unknownFields;
          self->_unknownFields = v34;
        }
        if ((PBUnknownFieldAdd() & 1) == 0) {
          goto LABEL_50;
        }
LABEL_45:
        if (*(void *)&v4[*v5] >= *(void *)&v4[*v6]) {
          goto LABEL_49;
        }
      }
      char v28 = 0;
      unsigned int v29 = 0;
      uint64_t v21 = 0;
      *(unsigned char *)&self->_flags |= 1u;
      while (1)
      {
        uint64_t v30 = *v5;
        uint64_t v31 = *(void *)&v4[v30];
        unint64_t v32 = v31 + 1;
        if (v31 == -1 || v32 > *(void *)&v4[*v6]) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)&v4[*v8] + v31);
        *(void *)&v4[v30] = v32;
        v21 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
        {
          v27 = &OBJC_IVAR___GEOPDOverallFilterReason__proxyErrorHttpStatus;
          goto LABEL_42;
        }
        v28 += 7;
        BOOL v26 = v29++ > 8;
        if (v26)
        {
          LODWORD(v21) = 0;
          v27 = &OBJC_IVAR___GEOPDOverallFilterReason__proxyErrorHttpStatus;
          goto LABEL_44;
        }
      }
      v27 = &OBJC_IVAR___GEOPDOverallFilterReason__proxyErrorHttpStatus;
LABEL_41:
      v4[*v7] = 1;
      goto LABEL_42;
    }
LABEL_49:
    BOOL v36 = v4[*v7] == 0;
  }
  else
  {
LABEL_50:
    BOOL v36 = 0;
  }
  objc_sync_exit(v4);

  return v36;
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
    PBDataWriterWriteUint32Field();
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
    *(_DWORD *)(v4 + 20) = self->_reasonType;
    *(unsigned char *)(v4 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_proxyErrorHttpStatus;
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
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_reasonType != *((_DWORD *)v4 + 5)) {
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_proxyErrorHttpStatus != *((_DWORD *)v4 + 4)) {
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
    uint64_t v2 = 2654435761 * self->_reasonType;
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
  uint64_t v3 = 2654435761 * self->_proxyErrorHttpStatus;
  return v3 ^ v2;
}

- (void).cxx_destruct
{
}

@end