@interface GEOPDMapsIdentifierPlaceLookupParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMapsIdentifierPlaceLookupParameters)initWithIdentifiers:(id)a3 resultProviderID:(int)a4;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapsIds;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)addMapsId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMapsIdentifierPlaceLookupParameters

- (id)mapsIds
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addMapsId:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDMapsIdentifierPlaceLookupParameters;
  v4 = [(GEOPDMapsIdentifierPlaceLookupParameters *)&v8 description];
  id v5 = [(GEOPDMapsIdentifierPlaceLookupParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsIdentifierPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 32))
    {
      id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v6 = @"resultProviderId";
      }
      else {
        v6 = @"result_provider_id";
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
        v15 = @"mapsId";
      }
      else {
        v15 = @"maps_id";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if ((*(unsigned char *)(a1 + 32) & 2) != 0)
    {
      v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
      if (a2) {
        v17 = @"enablePartialClientization";
      }
      else {
        v17 = @"enable_partial_clientization";
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
        v25[2] = __70__GEOPDMapsIdentifierPlaceLookupParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDMapsIdentifierPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __70__GEOPDMapsIdentifierPlaceLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDMapsIdentifierPlaceLookupParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_mapsIds;
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

  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "hasGreenTeaWithValue:", a2, (void)v10))
        {
          uint64_t v8 = 1;
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_resultProviderId;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_mapsIds;
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
        -[GEOPDMapsIdentifierPlaceLookupParameters addMapsId:](v6, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v6 + 28) = self->_enablePartialClientization;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 6)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_12;
  }
  mapsIds = self->_mapsIds;
  if ((unint64_t)mapsIds | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](mapsIds, "isEqual:")) {
      goto LABEL_12;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 32);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_enablePartialClientization)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)v4 + 28))
      {
        goto LABEL_12;
      }
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_resultProviderId;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_mapsIds hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_enablePartialClientization;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsIds, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOPDMapsIdentifierPlaceLookupParameters)initWithIdentifiers:(id)a3 resultProviderID:(int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOPDMapsIdentifierPlaceLookupParameters;
  uint64_t v7 = [(GEOPDMapsIdentifierPlaceLookupParameters *)&v21 init];
  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "mapsIdentifier", (void)v17);
          -[GEOPDMapsIdentifierPlaceLookupParameters addMapsId:]((uint64_t)v7, v13);

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    if (a4
      || (+[GEOMapService sharedService],
          long long v14 = objc_claimAutoreleasedReturnValue(),
          a4 = [v14 localSearchProviderID],
          v14,
          a4))
    {
      *(unsigned char *)&v7->_flags |= 1u;
      v7->_resultProviderId = a4;
    }
    long long v15 = v7;
  }

  return v7;
}

@end