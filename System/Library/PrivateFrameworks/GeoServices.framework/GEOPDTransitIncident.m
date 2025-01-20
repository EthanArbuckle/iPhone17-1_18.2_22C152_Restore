@interface GEOPDTransitIncident
+ (id)transitIncidentsForPlaceData:(id)a3 hasTransitIncidentComponent:(BOOL *)a4;
+ (id)transitIncidentsTTLExpirationDateForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transitIncidents;
- (unint64_t)hash;
- (void)addTransitIncident:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitIncident

+ (id)transitIncidentsForPlaceData:(id)a3 hasTransitIncidentComponent:(BOOL *)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  if (a4) {
    *a4 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__GEOPDTransitIncident_PlaceDataExtras__transitIncidentsForPlaceData_hasTransitIncidentComponent___block_invoke;
  v10[3] = &unk_1E53E1718;
  v12 = a4;
  id v8 = v7;
  id v11 = v8;
  [v6 enumerateComponentOfType:20 enumerationOptions:1 usingBlock:v10];

  return v8;
}

void __98__GEOPDTransitIncident_PlaceDataExtras__transitIncidentsForPlaceData_hasTransitIncidentComponent___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = *(unsigned char **)(a1 + 40);
  if (v3) {
    unsigned char *v3 = 1;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  -[GEOPDComponent values](a2);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * v6);
        if (v7 && *(void *)(v7 + 664))
        {
          -[GEOPDComponentValue transitIncident]((id *)v7);
          id v8 = (id *)objc_claimAutoreleasedReturnValue();
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          v9 = -[GEOPDTransitIncident transitIncidents](v8);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v18;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v18 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = [[_GEOTransitIncident alloc] initWithIncident:*(void *)(*((void *)&v17 + 1) + 8 * v13)];
                if (v14) {
                  [*(id *)(a1 + 32) addObject:v14];
                }

                ++v13;
              }
              while (v11 != v13);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v11);
          }
        }
        ++v6;
      }
      while (v6 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }
}

+ (id)transitIncidentsTTLExpirationDateForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__37;
  uint64_t v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__GEOPDTransitIncident_PlaceDataExtras__transitIncidentsTTLExpirationDateForPlaceData___block_invoke;
  v6[3] = &unk_1E53E1740;
  v6[4] = &v7;
  [v3 enumerateComponentOfType:20 enumerationOptions:1 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __87__GEOPDTransitIncident_PlaceDataExtras__transitIncidentsTTLExpirationDateForPlaceData___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v17 = a2;
  int v5 = [v17 hasTimestampFirstSeen];
  uint64_t v6 = v17;
  if (v17 && v5 && (*((_WORD *)v17 + 50) & 0x40) != 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v17 timestampFirstSeen];
    LODWORD(v8) = *((_DWORD *)v17 + 21);
    uint64_t v10 = [v7 dateWithTimeIntervalSinceReferenceDate:v9 + (double)v8];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    if (v12)
    {
      uint64_t v13 = [v12 earlierDate:v10];
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      id v16 = v10;
      v15 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v16;
    }

    *a3 = 1;
    uint64_t v6 = v17;
  }
}

- (id)transitIncidents
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addTransitIncident:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitIncident;
  id v4 = [(GEOPDTransitIncident *)&v8 description];
  id v5 = [(GEOPDTransitIncident *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitIncident _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            id v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }

      if (a2) {
        uint64_t v13 = @"transitIncident";
      }
      else {
        uint64_t v13 = @"transit_incident";
      }
      [v4 setObject:v5 forKey:v13];
    }
    uint64_t v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      id v16 = v15;
      if (a2)
      {
        id v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __50__GEOPDTransitIncident__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        id v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDTransitIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOPDTransitIncident__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_transitIncidents;
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

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_transitIncidents;
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
        -[GEOPDTransitIncident addTransitIncident:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    transitIncidents = self->_transitIncidents;
    if ((unint64_t)transitIncidents | v4[2]) {
      char v6 = -[NSMutableArray isEqual:](transitIncidents, "isEqual:");
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
  return [(NSMutableArray *)self->_transitIncidents hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidents, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end