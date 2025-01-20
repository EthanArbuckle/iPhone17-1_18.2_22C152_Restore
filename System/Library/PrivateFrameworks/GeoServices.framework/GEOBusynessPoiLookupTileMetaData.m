@interface GEOBusynessPoiLookupTileMetaData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOBusynessPoiLookupTileMetaData

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBusynessPoiLookupTileMetaData;
  v4 = [(GEOBusynessPoiLookupTileMetaData *)&v8 description];
  v5 = [(GEOBusynessPoiLookupTileMetaData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = *(unsigned char *)(a1 + 28);
    if (v3)
    {
      v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
      [v2 setObject:v4 forKey:@"tileId"];

      char v3 = *(unsigned char *)(a1 + 28);
    }
    if ((v3 & 2) != 0)
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      [v2 setObject:v5 forKey:@"poiCount"];
    }
    uint64_t v6 = *(void *)(a1 + 16);
    if (v6) {
      [v2 setObject:v6 forKey:@"version"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E4F940E8];
    uint64_t v6 = (int *)MEMORY[0x1E4F940E0];
    v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      objc_super v8 = (int *)MEMORY[0x1E4F940B8];
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
          BOOL v16 = v10++ >= 9;
          if (v16)
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
          break;
        }
        unint64_t v19 = v11 >> 3;
        if ((v11 >> 3) == 3)
        {
          PBReaderReadString();
          v27 = (NSString *)objc_claimAutoreleasedReturnValue();
          version = self->_version;
          self->_version = v27;
        }
        else if (v19 == 2)
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(unsigned char *)&self->_flags |= 2u;
          while (1)
          {
            uint64_t v32 = *v5;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v6]) {
              break;
            }
            char v35 = *(unsigned char *)(*(void *)&v4[*v8] + v33);
            *(void *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if ((v35 & 0x80) == 0) {
              goto LABEL_44;
            }
            v29 += 7;
            BOOL v16 = v30++ >= 9;
            if (v16)
            {
              LODWORD(v31) = 0;
              goto LABEL_46;
            }
          }
          v4[*v7] = 1;
LABEL_44:
          if (v4[*v7]) {
            LODWORD(v31) = 0;
          }
LABEL_46:
          self->_poiCount = v31;
        }
        else if (v19 == 1)
        {
          char v20 = 0;
          unsigned int v21 = 0;
          unint64_t v22 = 0;
          *(unsigned char *)&self->_flags |= 1u;
          while (1)
          {
            uint64_t v23 = *v5;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v6]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v8] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_40;
            }
            v20 += 7;
            BOOL v16 = v21++ >= 9;
            if (v16)
            {
              unint64_t v22 = 0;
              goto LABEL_42;
            }
          }
          v4[*v7] = 1;
LABEL_40:
          if (v4[*v7]) {
            unint64_t v22 = 0;
          }
LABEL_42:
          self->_tileId = v22;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_49;
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v36 = v4[*v7] == 0;
  }
  else
  {
LABEL_49:
    BOOL v36 = 0;
  }
  objc_sync_exit(v4);

  return v36;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 8) = self->_tileId;
    *(unsigned char *)(v5 + 28) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_poiCount;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_version copyWithZone:a3];
  char v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_tileId != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_poiCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](version, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v2 = 2654435761u * self->_tileId;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_version hash];
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_poiCount;
  return v3 ^ v2 ^ [(NSString *)self->_version hash];
}

- (void).cxx_destruct
{
}

@end