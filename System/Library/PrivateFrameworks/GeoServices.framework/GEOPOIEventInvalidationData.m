@interface GEOPOIEventInvalidationData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)cacheInvalidationData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)setCacheInvalidationData:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPOIEventInvalidationData

- (id)cacheInvalidationData
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCacheInvalidationData:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPOIEventInvalidationData;
  id v4 = [(GEOPOIEventInvalidationData *)&v8 description];
  v5 = [(GEOPOIEventInvalidationData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPOIEventInvalidationData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = *(id *)(a1 + 8);
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"cacheInvalidationData"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"cache_invalidation_data"];
      }
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
  return -[GEOPOIEventInvalidationData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    id v5 = (int *)MEMORY[0x1E4F940E8];
    v6 = (int *)MEMORY[0x1E4F940E0];
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
          if (v10++ >= 9)
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
        if ((v11 >> 3) == 1)
        {
          PBReaderReadData();
          v18 = (NSData *)objc_claimAutoreleasedReturnValue();
          cacheInvalidationData = self->_cacheInvalidationData;
          self->_cacheInvalidationData = v18;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_24;
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v20 = v4[*v7] == 0;
  }
  else
  {
LABEL_24:
    BOOL v20 = 0;
  }
  objc_sync_exit(v4);

  return v20;
}

- (void)writeTo:(id)a3
{
  if (self->_cacheInvalidationData) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_cacheInvalidationData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    cacheInvalidationData = self->_cacheInvalidationData;
    if ((unint64_t)cacheInvalidationData | v4[1]) {
      char v6 = -[NSData isEqual:](cacheInvalidationData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_cacheInvalidationData hash];
}

- (void).cxx_destruct
{
}

@end