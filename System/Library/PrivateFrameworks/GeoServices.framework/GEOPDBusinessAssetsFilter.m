@interface GEOPDBusinessAssetsFilter
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

@implementation GEOPDBusinessAssetsFilter

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBusinessAssetsFilter;
  v4 = [(GEOPDBusinessAssetsFilter *)&v8 description];
  v5 = [(GEOPDBusinessAssetsFilter *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBusinessAssetsFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = [v5 dictionaryRepresentation];
      v7 = v6;
      if (a2)
      {
        objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __55__GEOPDBusinessAssetsFilter__dictionaryRepresentation___block_invoke;
        v12[3] = &unk_1E53D8860;
        id v9 = v8;
        id v13 = v9;
        [v7 enumerateKeysAndObjectsUsingBlock:v12];
        id v10 = v9;

        v7 = v10;
      }
      [v4 setObject:v7 forKey:@"Unknown Fields"];
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
  return -[GEOPDBusinessAssetsFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDBusinessAssetsFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  v4 = (unsigned __int8 *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    id v5 = (int *)MEMORY[0x1E4F940E8];
    v6 = (int *)MEMORY[0x1E4F940E0];
    v7 = (int *)MEMORY[0x1E4F940C8];
    objc_super v8 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      int v9 = v4[*v7];
      if (*(void *)&v4[*v5] >= *(void *)&v4[*v6]) {
        break;
      }
      if (v4[*v7])
      {
        int v9 = 1;
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v5;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v6]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v8] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        if (v11++ >= 9)
        {
          char v18 = 0;
          int v9 = v4[*v7];
          goto LABEL_16;
        }
      }
      v4[*v7] = 1;
LABEL_13:
      int v9 = v4[*v7];
      if (v4[*v7]) {
        char v18 = 0;
      }
      else {
        char v18 = v12;
      }
LABEL_16:
      if (v9) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = (v18 & 7) == 4;
      }
      if (v19) {
        break;
      }
      if (!self->_unknownFields)
      {
        v20 = (PBUnknownFields *)objc_alloc_init(MEMORY[0x1E4F940B0]);
        unknownFields = self->_unknownFields;
        self->_unknownFields = v20;
      }
      if ((PBUnknownFieldAdd() & 1) == 0) {
        goto LABEL_23;
      }
    }
    BOOL v22 = v9 == 0;
  }
  else
  {
LABEL_23:
    BOOL v22 = 0;
  }
  objc_sync_exit(v4);

  return v22;
}

- (void)writeTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_unknownFields);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (void).cxx_destruct
{
}

@end