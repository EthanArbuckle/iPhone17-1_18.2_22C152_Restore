@interface GEOPDSearchEnrichmentCandidateMetadata
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

@implementation GEOPDSearchEnrichmentCandidateMetadata

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchEnrichmentCandidateMetadata;
  v4 = [(GEOPDSearchEnrichmentCandidateMetadata *)&v8 description];
  v5 = [(GEOPDSearchEnrichmentCandidateMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchEnrichmentCandidateMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = v4;
    if (*(void *)(a1 + 16)) {
      objc_msgSend(v4, "setObject:forKey:");
    }
    v6 = *(void **)(a1 + 8);
    if (v6)
    {
      v7 = [v6 dictionaryRepresentation];
      objc_super v8 = v7;
      if (a2)
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __68__GEOPDSearchEnrichmentCandidateMetadata__dictionaryRepresentation___block_invoke;
        v13[3] = &unk_1E53D8860;
        id v10 = v9;
        id v14 = v10;
        [v8 enumerateKeysAndObjectsUsingBlock:v13];
        id v11 = v10;

        objc_super v8 = v11;
      }
      [v5 setObject:v8 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchEnrichmentCandidateMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __68__GEOPDSearchEnrichmentCandidateMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
          break;
        }
        if ((v11 >> 3) == 1)
        {
          PBReaderReadString();
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
          impressionId = self->_impressionId;
          self->_impressionId = v19;
        }
        else
        {
          if (!self->_unknownFields)
          {
            v21 = (PBUnknownFields *)objc_alloc_init(MEMORY[0x1E4F940B0]);
            unknownFields = self->_unknownFields;
            self->_unknownFields = v21;
          }
          if (!PBUnknownFieldAdd()) {
            goto LABEL_26;
          }
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v23 = v4[*v7] == 0;
  }
  else
  {
LABEL_26:
    BOOL v23 = 0;
  }
  objc_sync_exit(v4);

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_impressionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_impressionId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    impressionId = self->_impressionId;
    if ((unint64_t)impressionId | v4[2]) {
      char v6 = -[NSString isEqual:](impressionId, "isEqual:");
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
  return [(NSString *)self->_impressionId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end