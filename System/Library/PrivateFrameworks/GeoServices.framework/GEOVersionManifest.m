@interface GEOVersionManifest
+ (BOOL)isValid:(id)a3;
+ (Class)serviceVersionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVersionManifest)initWithDictionary:(id)a3;
- (GEOVersionManifest)initWithJSON:(id)a3;
- (NSMutableArray)serviceVersions;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)serviceVersionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)serviceVersionsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addServiceVersion:(id)a3;
- (void)clearServiceVersions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setServiceVersions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVersionManifest

- (NSMutableArray)serviceVersions
{
  return self->_serviceVersions;
}

- (void)addServiceVersion:(id)a3
{
  id v4 = a3;
  serviceVersions = self->_serviceVersions;
  id v8 = v4;
  if (!serviceVersions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_serviceVersions;
    self->_serviceVersions = v6;

    id v4 = v8;
    serviceVersions = self->_serviceVersions;
  }
  [(NSMutableArray *)serviceVersions addObject:v4];
}

- (void)setServiceVersions:(id)a3
{
}

- (void)clearServiceVersions
{
}

- (unint64_t)serviceVersionsCount
{
  return [(NSMutableArray *)self->_serviceVersions count];
}

- (id)serviceVersionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_serviceVersions objectAtIndex:a3];
}

+ (Class)serviceVersionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVersionManifest;
  id v4 = [(GEOVersionManifest *)&v8 description];
  v5 = [(GEOVersionManifest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVersionManifest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
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
            v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"serviceVersion";
      }
      else {
        v13 = @"service_version";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __48__GEOVersionManifest__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
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
  return -[GEOVersionManifest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOVersionManifest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOVersionManifest)initWithDictionary:(id)a3
{
  return (GEOVersionManifest *)-[GEOVersionManifest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        uint64_t v7 = @"serviceVersion";
      }
      else {
        uint64_t v7 = @"service_version";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = v8;
        id v34 = v5;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v42;
          if (a3) {
            v13 = @"versionDomain";
          }
          else {
            v13 = @"version_domain";
          }
          v14 = @"minimum_version";
          if (a3) {
            v14 = @"minimumVersion";
          }
          v37 = v14;
          v38 = v13;
          id v35 = v9;
          v36 = v6;
          uint64_t v39 = *(void *)v42;
          do
          {
            uint64_t v15 = 0;
            uint64_t v40 = v11;
            do
            {
              if (*(void *)v42 != v12) {
                objc_enumerationMutation(v9);
              }
              v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = [GEOServiceVersion alloc];
                if (v17)
                {
                  id v18 = v17;
                  id v19 = v16;
                  uint64_t v20 = [(GEOServiceVersion *)v18 init];
                  if (v20)
                  {
                    v21 = [v19 objectForKeyedSubscript:v38];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v47 = 0u;
                      long long v48 = 0u;
                      long long v45 = 0u;
                      long long v46 = 0u;
                      id v22 = v21;
                      uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v50 count:16];
                      if (v23)
                      {
                        uint64_t v24 = v23;
                        uint64_t v25 = *(void *)v46;
                        do
                        {
                          for (uint64_t i = 0; i != v24; ++i)
                          {
                            if (*(void *)v46 != v25) {
                              objc_enumerationMutation(v22);
                            }
                            v27 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              uint64_t v28 = (void *)[v27 copy];
                              -[GEOServiceVersion addVersionDomain:](v20, v28);
                            }
                          }
                          uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v50 count:16];
                        }
                        while (v24);
                      }

                      id v9 = v35;
                      id v6 = v36;
                    }

                    v29 = [v19 objectForKeyedSubscript:v37];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v30 = [v29 unsignedIntValue];
                      *(unsigned char *)(v20 + 28) |= 1u;
                      *(_DWORD *)(v20 + 24) = v30;
                    }

                    uint64_t v12 = v39;
                  }

                  uint64_t v11 = v40;
                }
                else
                {
                  uint64_t v20 = 0;
                }
                objc_msgSend(v6, "addServiceVersion:", v20, v33, v34);
              }
              ++v15;
            }
            while (v15 != v11);
            uint64_t v31 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
            uint64_t v11 = v31;
          }
          while (v31);
        }

        uint64_t v8 = v33;
        id v5 = v34;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (GEOVersionManifest)initWithJSON:(id)a3
{
  return (GEOVersionManifest *)-[GEOVersionManifest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVersionManifestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVersionManifestReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_serviceVersions;
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

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOVersionManifest *)self readAll:0];
  if ([(GEOVersionManifest *)self serviceVersionsCount])
  {
    [v8 clearServiceVersions];
    unint64_t v4 = [(GEOVersionManifest *)self serviceVersionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOVersionManifest *)self serviceVersionAtIndex:i];
        [v8 addServiceVersion:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_serviceVersions;
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
        [v5 addServiceVersion:v11];

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
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOVersionManifest *)self readAll:1];
    [v4 readAll:1];
    serviceVersions = self->_serviceVersions;
    if ((unint64_t)serviceVersions | v4[2]) {
      char v5 = -[NSMutableArray isEqual:](serviceVersions, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOVersionManifest *)self readAll:1];
  serviceVersions = self->_serviceVersions;

  return [(NSMutableArray *)serviceVersions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[GEOVersionManifest addServiceVersion:](self, "addServiceVersion:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOVersionManifest *)self readAll:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_serviceVersions;
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
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          if (v11)
          {
            long long v12 = *(void **)(v11 + 8);
            *(void *)(v11 + 8) = 0;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceVersions, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end