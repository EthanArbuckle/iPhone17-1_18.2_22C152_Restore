@interface GEOPBOfflineDataBatchesSizeResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBatchCount;
- (BOOL)hasCompressedSizeBytes;
- (BOOL)hasSizeBytes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBOfflineDataBatchesSizeResponse)initWithDictionary:(id)a3;
- (GEOPBOfflineDataBatchesSizeResponse)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)compressedSizeBytes;
- (unint64_t)hash;
- (unint64_t)sizeBytes;
- (unsigned)batchCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBatchCount:(unsigned int)a3;
- (void)setCompressedSizeBytes:(unint64_t)a3;
- (void)setHasBatchCount:(BOOL)a3;
- (void)setHasCompressedSizeBytes:(BOOL)a3;
- (void)setHasSizeBytes:(BOOL)a3;
- (void)setSizeBytes:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineDataBatchesSizeResponse

- (unsigned)batchCount
{
  return self->_batchCount;
}

- (void)setBatchCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_batchCount = a3;
}

- (void)setHasBatchCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasBatchCount
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unint64_t)sizeBytes
{
  return self->_sizeBytes;
}

- (void)setSizeBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_sizeBytes = a3;
}

- (void)setHasSizeBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSizeBytes
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)compressedSizeBytes
{
  return self->_compressedSizeBytes;
}

- (void)setCompressedSizeBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_compressedSizeBytes = a3;
}

- (void)setHasCompressedSizeBytes:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCompressedSizeBytes
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineDataBatchesSizeResponse;
  v4 = [(GEOPBOfflineDataBatchesSizeResponse *)&v8 description];
  v5 = [(GEOPBOfflineDataBatchesSizeResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataBatchesSizeResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_18;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    if (a2) {
      v9 = @"sizeBytes";
    }
    else {
      v9 = @"size_bytes";
    }
    [v4 setObject:v8 forKey:v9];

    if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  if (a2) {
    v7 = @"batchCount";
  }
  else {
    v7 = @"batch_count";
  }
  [v4 setObject:v6 forKey:v7];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if (v5)
  {
LABEL_14:
    v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v11 = @"compressedSizeBytes";
    }
    else {
      v11 = @"compressed_size_bytes";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_18:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineDataBatchesSizeResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPBOfflineDataBatchesSizeResponse)initWithDictionary:(id)a3
{
  return (GEOPBOfflineDataBatchesSizeResponse *)-[GEOPBOfflineDataBatchesSizeResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"batchCount";
      }
      else {
        v6 = @"batch_count";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBatchCount:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"sizeBytes";
      }
      else {
        objc_super v8 = @"size_bytes";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSizeBytes:", objc_msgSend(v9, "unsignedLongLongValue"));
      }

      if (a3) {
        v10 = @"compressedSizeBytes";
      }
      else {
        v10 = @"compressed_size_bytes";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCompressedSizeBytes:", objc_msgSend(v11, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOPBOfflineDataBatchesSizeResponse)initWithJSON:(id)a3
{
  return (GEOPBOfflineDataBatchesSizeResponse *)-[GEOPBOfflineDataBatchesSizeResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        goto LABEL_48;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        unint64_t v12 = *(void *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        goto LABEL_48;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        if ((v10 & 7) != 0) {
          goto LABEL_50;
        }
        unsigned int v29 = 0;
        while (1)
        {
          uint64_t v30 = *v4;
          unint64_t v31 = *(void *)((char *)a3 + v30);
          if (v31 == -1 || v31 >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_45;
          }
          unint64_t v32 = v31 + 1;
          int v33 = *(char *)(*(void *)((char *)a3 + *v7) + v31);
          *(void *)((char *)a3 + v30) = v32;
          if (v33 < 0)
          {
            BOOL v23 = v29++ > 8;
            if (!v23) {
              continue;
            }
          }
          goto LABEL_47;
        }
      }
      if (v17 == 1)
      {
        if ((v10 & 7) != 0) {
          goto LABEL_50;
        }
        unsigned int v18 = 0;
        while (1)
        {
          uint64_t v19 = *v4;
          unint64_t v20 = *(void *)((char *)a3 + v19);
          if (v20 == -1 || v20 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          unint64_t v21 = v20 + 1;
          int v22 = *(char *)(*(void *)((char *)a3 + *v7) + v20);
          *(void *)((char *)a3 + v19) = v21;
          if (v22 < 0)
          {
            BOOL v23 = v18++ > 8;
            if (!v23) {
              continue;
            }
          }
          goto LABEL_47;
        }
LABEL_45:
        *((unsigned char *)a3 + *v6) = 1;
        goto LABEL_47;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_50:
        BOOL v34 = 0;
        goto LABEL_49;
      }
LABEL_47:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        goto LABEL_48;
      }
    }
    if ((v10 & 7) != 0) {
      goto LABEL_50;
    }
    unsigned int v24 = 0;
    while (1)
    {
      uint64_t v25 = *v4;
      unint64_t v26 = *(void *)((char *)a3 + v25);
      if (v26 == -1 || v26 >= *(void *)((char *)a3 + *v5)) {
        goto LABEL_45;
      }
      unint64_t v27 = v26 + 1;
      int v28 = *(char *)(*(void *)((char *)a3 + *v7) + v26);
      *(void *)((char *)a3 + v25) = v27;
      if (v28 < 0)
      {
        BOOL v23 = v24++ > 8;
        if (!v23) {
          continue;
        }
      }
      goto LABEL_47;
    }
  }
LABEL_48:
  BOOL v34 = *((unsigned char *)a3 + *v6) == 0;
LABEL_49:
  PBReaderRecallMark();
  return v34;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    id v5 = (int *)MEMORY[0x1E4F940E8];
    v6 = (int *)MEMORY[0x1E4F940E0];
    v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      char v8 = (int *)MEMORY[0x1E4F940B8];
      do
      {
        if (v4[*v7]) {
          break;
        }
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = *v5;
          unint64_t v13 = *(void *)&v4[v12];
          if (v13 == -1 || v13 >= *(void *)&v4[*v6]) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
          *(void *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0) {
            goto LABEL_13;
          }
          v9 += 7;
          BOOL v15 = v10++ >= 9;
          if (v15)
          {
            unint64_t v11 = 0;
            int v16 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        int v16 = v4[*v7];
        if (v4[*v7]) {
          unint64_t v11 = 0;
        }
LABEL_15:
        if (v16 || (v11 & 7) == 4) {
          break;
        }
        unint64_t v18 = v11 >> 3;
        if ((v11 >> 3) == 3)
        {
          char v25 = 0;
          unsigned int v26 = 0;
          unint64_t v27 = 0;
          *(unsigned char *)&self->_flags |= 1u;
          while (1)
          {
            uint64_t v28 = *v5;
            unint64_t v29 = *(void *)&v4[v28];
            if (v29 == -1 || v29 >= *(void *)&v4[*v6]) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)&v4[*v8] + v29);
            *(void *)&v4[v28] = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if ((v30 & 0x80) == 0) {
              goto LABEL_50;
            }
            v25 += 7;
            BOOL v15 = v26++ >= 9;
            if (v15)
            {
              unint64_t v27 = 0;
              goto LABEL_52;
            }
          }
          v4[*v7] = 1;
LABEL_50:
          if (v4[*v7]) {
            unint64_t v27 = 0;
          }
LABEL_52:
          uint64_t v36 = 8;
        }
        else
        {
          if (v18 != 2)
          {
            if (v18 == 1)
            {
              char v19 = 0;
              unsigned int v20 = 0;
              uint64_t v21 = 0;
              *(unsigned char *)&self->_flags |= 4u;
              while (1)
              {
                uint64_t v22 = *v5;
                unint64_t v23 = *(void *)&v4[v22];
                if (v23 == -1 || v23 >= *(void *)&v4[*v6]) {
                  break;
                }
                char v24 = *(unsigned char *)(*(void *)&v4[*v8] + v23);
                *(void *)&v4[v22] = v23 + 1;
                v21 |= (unint64_t)(v24 & 0x7F) << v19;
                if ((v24 & 0x80) == 0) {
                  goto LABEL_46;
                }
                v19 += 7;
                BOOL v15 = v20++ >= 9;
                if (v15)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_48;
                }
              }
              v4[*v7] = 1;
LABEL_46:
              if (v4[*v7]) {
                LODWORD(v21) = 0;
              }
LABEL_48:
              self->_batchCount = v21;
            }
            else if (!PBReaderSkipValueWithTag())
            {
              goto LABEL_60;
            }
            continue;
          }
          char v31 = 0;
          unsigned int v32 = 0;
          unint64_t v27 = 0;
          *(unsigned char *)&self->_flags |= 2u;
          while (1)
          {
            uint64_t v33 = *v5;
            unint64_t v34 = *(void *)&v4[v33];
            if (v34 == -1 || v34 >= *(void *)&v4[*v6]) {
              break;
            }
            char v35 = *(unsigned char *)(*(void *)&v4[*v8] + v34);
            *(void *)&v4[v33] = v34 + 1;
            v27 |= (unint64_t)(v35 & 0x7F) << v31;
            if ((v35 & 0x80) == 0) {
              goto LABEL_54;
            }
            v31 += 7;
            BOOL v15 = v32++ >= 9;
            if (v15)
            {
              unint64_t v27 = 0;
              goto LABEL_56;
            }
          }
          v4[*v7] = 1;
LABEL_54:
          if (v4[*v7]) {
            unint64_t v27 = 0;
          }
LABEL_56:
          uint64_t v36 = 16;
        }
        *(Class *)((char *)&self->super.super.isa + v36) = (Class)v27;
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v37 = v4[*v7] == 0;
  }
  else
  {
LABEL_60:
    BOOL v37 = 0;
  }
  objc_sync_exit(v4);

  return v37;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
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
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPBOfflineDataBatchesSizeResponse *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[6] = self->_batchCount;
    *((unsigned char *)v5 + 28) |= 4u;
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
  *((void *)v5 + 2) = self->_sizeBytes;
  *((unsigned char *)v5 + 28) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *((void *)v5 + 1) = self->_compressedSizeBytes;
    *((unsigned char *)v5 + 28) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_batchCount;
    *((unsigned char *)result + 28) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_sizeBytes;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 1) = self->_compressedSizeBytes;
  *((unsigned char *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOPBOfflineDataBatchesSizeResponse *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_batchCount != *((_DWORD *)v4 + 6)) {
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
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_sizeBytes != *((void *)v4 + 2)) {
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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_compressedSizeBytes != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPBOfflineDataBatchesSizeResponse *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_batchCount;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_sizeBytes;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v5 = 2654435761u * self->_compressedSizeBytes;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 4) != 0)
  {
    self->_batchCount = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sizeBytes = *((void *)v5 + 2);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 28))
  {
LABEL_4:
    self->_compressedSizeBytes = *((void *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
}

@end