@interface GEOPDRelatedPlaceModuleConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)addSectionTitle:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDRelatedPlaceModuleConfiguration

- (void)addSectionTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDRelatedPlaceModuleConfiguration;
  v4 = [(GEOPDRelatedPlaceModuleConfiguration *)&v8 description];
  id v5 = [(GEOPDRelatedPlaceModuleConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRelatedPlaceModuleConfiguration _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 32) & 2) != 0)
    {
      id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        v6 = @"relatedPlaceComponentId";
      }
      else {
        v6 = @"related_place_component_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 16) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v8 = *(id *)(a1 + 16);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"sectionTitle";
      }
      else {
        v15 = @"section_title";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if (*(unsigned char *)(a1 + 32))
    {
      v16 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v17 = @"numberOfRows";
      }
      else {
        v17 = @"number_of_rows";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __66__GEOPDRelatedPlaceModuleConfiguration__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOPDRelatedPlaceModuleConfiguration _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPDRelatedPlaceModuleConfiguration__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRelatedPlaceModuleConfigurationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_sectionTitles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_relatedPlaceComponentId;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_sectionTitles;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        -[GEOPDRelatedPlaceModuleConfiguration addSectionTitle:](v6, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v6 + 24) = self->_numberOfRows;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_relatedPlaceComponentId != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  sectionTitles = self->_sectionTitles;
  if ((unint64_t)sectionTitles | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](sectionTitles, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 32);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_numberOfRows != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_relatedPlaceComponentId;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_sectionTitles hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_numberOfRows;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitles, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end