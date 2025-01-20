@interface GEOPDPlaceQuestionnaireLookupParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)addPlaceInfo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceQuestionnaireLookupParameters

- (void)addPlaceInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceQuestionnaireLookupParameters;
  v4 = [(GEOPDPlaceQuestionnaireLookupParameters *)&v8 description];
  id v5 = [(GEOPDPlaceQuestionnaireLookupParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceQuestionnaireLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 8) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = *(id *)(a1 + 8);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v15);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v15);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"placeInfo";
      }
      else {
        v13 = @"place_info";
      }
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v15);
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
  return -[GEOPDPlaceQuestionnaireLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1 && (uint64_t v41 = [a1 init]) != 0)
  {
    if (a3) {
      id v5 = @"placeInfo";
    }
    else {
      id v5 = @"place_info";
    }
    id v6 = [v4 objectForKeyedSubscript:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = v6;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v6;
      uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v44;
        if (a3) {
          v10 = @"mapsId";
        }
        else {
          v10 = @"maps_id";
        }
        v11 = @"mapsCategoryId";
        if (!a3) {
          v11 = @"maps_category_id";
        }
        v39 = v11;
        v40 = v10;
        v12 = @"country_code";
        if (a3) {
          v12 = @"countryCode";
        }
        v38 = v12;
        if (a3) {
          v13 = @"hasRichData";
        }
        else {
          v13 = @"has_rich_data";
        }
        v37 = v13;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v44 != v9) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v16 = [GEOPDPlaceQuestionnairePlaceInfo alloc];
              if (v16)
              {
                long long v17 = v16;
                id v18 = v15;
                uint64_t v19 = [(GEOPDPlaceQuestionnairePlaceInfo *)v17 init];
                if (v19)
                {
                  uint64_t v20 = [v18 objectForKeyedSubscript:v40];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v21 = [GEOPDMapsIdentifier alloc];
                    if (a3) {
                      v22 = [(GEOPDMapsIdentifier *)v21 initWithJSON:v20];
                    }
                    else {
                      v22 = [(GEOPDMapsIdentifier *)v21 initWithDictionary:v20];
                    }
                    v23 = v22;
                    v24 = v22;
                    *(unsigned char *)(v19 + 56) |= 8u;
                    *(unsigned char *)(v19 + 56) |= 0x10u;
                    objc_storeStrong((id *)(v19 + 32), v23);
                  }
                  v25 = [v18 objectForKeyedSubscript:v39];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v26 = (void *)[v25 copy];
                    id v27 = v26;
                    *(unsigned char *)(v19 + 56) |= 4u;
                    *(unsigned char *)(v19 + 56) |= 0x10u;
                    objc_storeStrong((id *)(v19 + 24), v26);
                  }
                  v28 = [v18 objectForKeyedSubscript:v38];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v29 = (void *)[v28 copy];
                    id v30 = v29;
                    *(unsigned char *)(v19 + 56) |= 2u;
                    *(unsigned char *)(v19 + 56) |= 0x10u;
                    objc_storeStrong((id *)(v19 + 16), v29);
                  }
                  v31 = [v18 objectForKeyedSubscript:v37];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    char v32 = [v31 BOOLValue];
                    *(unsigned char *)(v19 + 56) |= 0x10u;
                    *(unsigned char *)(v19 + 56) |= 1u;
                    *(unsigned char *)(v19 + 52) = v32;
                  }
                }
              }
              else
              {
                uint64_t v19 = 0;
              }
              -[GEOPDPlaceQuestionnaireLookupParameters addPlaceInfo:](v41, (void *)v19);
            }
            ++v14;
          }
          while (v8 != v14);
          uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
          uint64_t v8 = v33;
        }
        while (v33);
      }

      id v6 = v35;
    }
  }
  else
  {
    uint64_t v41 = 0;
  }

  return v41;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceQuestionnaireLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_placeInfos;
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
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (v8)
        {
          -[GEOPDPlaceQuestionnairePlaceInfo _readMapsId](*(void *)(*((void *)&v11 + 1) + 8 * v7));
          if (objc_msgSend(*(id *)(v8 + 32), "hasGreenTeaWithValue:", a2, (void)v11))
          {
            uint64_t v9 = 1;
            goto LABEL_13;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_placeInfos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        -[GEOPDPlaceQuestionnaireLookupParameters addPlaceInfo:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    placeInfos = self->_placeInfos;
    if ((unint64_t)placeInfos | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](placeInfos, "isEqual:");
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
  return [(NSMutableArray *)self->_placeInfos hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a2 + 8);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[GEOPDPlaceQuestionnaireLookupParameters addPlaceInfo:](a1, *(void **)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void).cxx_destruct
{
}

@end