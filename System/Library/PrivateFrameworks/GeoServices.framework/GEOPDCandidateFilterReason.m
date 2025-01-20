@interface GEOPDCandidateFilterReason
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

@implementation GEOPDCandidateFilterReason

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCandidateFilterReason;
  v4 = [(GEOPDCandidateFilterReason *)&v8 description];
  v5 = [(GEOPDCandidateFilterReason *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCandidateFilterReason _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v6 = *(unsigned char *)(a1 + 32);
    if (v6)
    {
      unsigned int v7 = *(_DWORD *)(a1 + 24) - 15300;
      if (v7 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53E5BC0[v7];
      }
      if (a2) {
        v9 = @"reasonType";
      }
      else {
        v9 = @"reason_type";
      }
      [v4 setObject:v8 forKey:v9];

      char v6 = *(unsigned char *)(a1 + 32);
    }
    if ((v6 & 2) != 0)
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 28);
      v10 = [NSNumber numberWithFloat:v5];
      if (a2) {
        v11 = @"viewportExpansionFactor";
      }
      else {
        v11 = @"viewport_expansion_factor";
      }
      [v4 setObject:v10 forKey:v11];
    }
    id v12 = *(id *)(a1 + 16);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"sortMetadata";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"sort_metadata";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __56__GEOPDCandidateFilterReason__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOPDCandidateFilterReason _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDCandidateFilterReason__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unsigned int v7 = *(void **)(a1 + 32);
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
    char v6 = (int *)MEMORY[0x1E4F940E0];
    unsigned int v7 = (int *)MEMORY[0x1E4F940C8];
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
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_48;
          }
          v27 = objc_alloc_init(GEOPDResultRefinementMetadata);
          if (!GEOPDResultRefinementMetadataReadAllFrom((uint64_t)v27, v4, 0))
          {

            goto LABEL_48;
          }
          PBReaderRecallMark();
          sortMetadata = self->_sortMetadata;
          self->_sortMetadata = v27;
        }
        else if (v19 == 2)
        {
          *(unsigned char *)&self->_flags |= 2u;
          uint64_t v29 = *v5;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFFBLL && v30 + 4 <= *(void *)&v4[*v6])
          {
            float v31 = *(float *)(*(void *)&v4[*v8] + v30);
            *(void *)&v4[v29] = v30 + 4;
          }
          else
          {
            v4[*v7] = 1;
            float v31 = 0.0;
          }
          self->_viewportExpansionFactor = v31;
        }
        else if (v19 == 1)
        {
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
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
              LODWORD(v22) = 0;
              goto LABEL_42;
            }
          }
          v4[*v7] = 1;
LABEL_40:
          if (v4[*v7]) {
            LODWORD(v22) = 0;
          }
LABEL_42:
          self->_reasonType = v22;
        }
        else
        {
          if (!self->_unknownFields)
          {
            v32 = (PBUnknownFields *)objc_alloc_init(MEMORY[0x1E4F940B0]);
            unknownFields = self->_unknownFields;
            self->_unknownFields = v32;
          }
          if (!PBUnknownFieldAdd()) {
            goto LABEL_48;
          }
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v34 = v4[*v7] == 0;
  }
  else
  {
LABEL_48:
    BOOL v34 = 0;
  }
  objc_sync_exit(v4);

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
  if (self->_sortMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_reasonType;
    *(unsigned char *)(v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 28) = self->_viewportExpansionFactor;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  id v8 = [(GEOPDResultRefinementMetadata *)self->_sortMetadata copyWithZone:a3];
  char v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_reasonType != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_viewportExpansionFactor != *((float *)v4 + 7)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  sortMetadata = self->_sortMetadata;
  if ((unint64_t)sortMetadata | *((void *)v4 + 2)) {
    char v6 = -[GEOPDResultRefinementMetadata isEqual:](sortMetadata, "isEqual:");
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
    uint64_t v3 = 2654435761 * self->_reasonType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(GEOPDResultRefinementMetadata *)self->_sortMetadata hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float viewportExpansionFactor = self->_viewportExpansionFactor;
  double v5 = viewportExpansionFactor;
  if (viewportExpansionFactor < 0.0) {
    double v5 = -viewportExpansionFactor;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ [(GEOPDResultRefinementMetadata *)self->_sortMetadata hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortMetadata, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end