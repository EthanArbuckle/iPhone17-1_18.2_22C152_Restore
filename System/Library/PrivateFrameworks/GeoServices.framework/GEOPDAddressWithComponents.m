@interface GEOPDAddressWithComponents
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAddressWithComponents)init;
- (GEOPDAddressWithComponents)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsAdditionalComponent:(uint64_t)a1;
- (void)_addNoFlagsFormattedAddressComponent:(uint64_t)a1;
- (void)_addNoFlagsFormattedAddressLine:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFormattedAddressLines;
- (void)addAdditionalComponent:(uint64_t)a1;
- (void)addFormattedAddressComponent:(uint64_t)a1;
- (void)addFormattedAddressLine:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAddressWithComponents

- (GEOPDAddressWithComponents)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAddressWithComponents;
  v2 = [(GEOPDAddressWithComponents *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAddressWithComponents)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAddressWithComponents;
  v3 = [(GEOPDAddressWithComponents *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFormattedAddressLines
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDAddressWithComponentsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedAddressLines_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)addFormattedAddressLine:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAddressWithComponents _readFormattedAddressLines](a1);
    -[GEOPDAddressWithComponents _addNoFlagsFormattedAddressLine:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsFormattedAddressLine:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addFormattedAddressComponent:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDAddressWithComponentsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedAddressComponents_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDAddressWithComponents _addNoFlagsFormattedAddressComponent:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsFormattedAddressComponent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addAdditionalComponent:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDAddressWithComponentsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalComponents_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDAddressWithComponents _addNoFlagsAdditionalComponent:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsAdditionalComponent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAddressWithComponents;
  v4 = [(GEOPDAddressWithComponents *)&v8 description];
  id v5 = [(GEOPDAddressWithComponents *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAddressWithComponents _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDAddressWithComponents readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 40))
    {
      -[GEOPDAddressWithComponents _readFormattedAddressLines](a1);
      id v5 = *(id *)(a1 + 40);
      if (a2) {
        objc_super v6 = @"formattedAddressLine";
      }
      else {
        objc_super v6 = @"formatted_address_line";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 32) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v39 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"formattedAddressComponent";
      }
      else {
        v15 = @"formatted_address_component";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v17 = *(id *)(a1 + 24);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"additionalComponent";
      }
      else {
        v24 = @"additional_component";
      }
      [v4 setObject:v16 forKey:v24];
    }
    v25 = *(void **)(a1 + 16);
    if (v25)
    {
      v26 = [v25 dictionaryRepresentation];
      v27 = v26;
      if (a2)
      {
        v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __56__GEOPDAddressWithComponents__dictionaryRepresentation___block_invoke;
        v32[3] = &unk_1E53D8860;
        id v29 = v28;
        id v33 = v29;
        [v27 enumerateKeysAndObjectsUsingBlock:v32];
        id v30 = v29;

        v27 = v30;
      }
      [v4 setObject:v27 forKey:@"Unknown Fields"];
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
  return -[GEOPDAddressWithComponents _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_279;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_280;
      }
      GEOPDAddressWithComponentsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDAddressWithComponentsCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __56__GEOPDAddressWithComponents__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"formattedAddressLine";
      }
      else {
        objc_super v6 = @"formatted_address_line";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v47 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = (void *)[v13 copy];
                -[GEOPDAddressWithComponents addFormattedAddressLine:]((uint64_t)a1, v14);
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v15 = @"formattedAddressComponent";
      }
      else {
        v15 = @"formatted_address_component";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v43;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v43 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v42 + 1) + 8 * v21);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [GEOPDAddressComponent alloc];
                if (v23) {
                  v24 = (void *)-[GEOPDAddressComponent _initWithDictionary:isJSON:](v23, v22);
                }
                else {
                  v24 = 0;
                }
                -[GEOPDAddressWithComponents addFormattedAddressComponent:]((uint64_t)a1, v24);
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v25 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
            uint64_t v19 = v25;
          }
          while (v25);
        }
      }
      if (a3) {
        v26 = @"additionalComponent";
      }
      else {
        v26 = @"additional_component";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v28 = v27;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v39;
          do
          {
            uint64_t v32 = 0;
            do
            {
              if (*(void *)v39 != v31) {
                objc_enumerationMutation(v28);
              }
              id v33 = *(void **)(*((void *)&v38 + 1) + 8 * v32);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v34 = [GEOPDAddressComponent alloc];
                if (v34) {
                  long long v35 = (void *)-[GEOPDAddressComponent _initWithDictionary:isJSON:](v34, v33);
                }
                else {
                  long long v35 = 0;
                }
                -[GEOPDAddressWithComponents addAdditionalComponent:]((uint64_t)a1, v35);
              }
              ++v32;
            }
            while (v30 != v32);
            uint64_t v36 = [v28 countByEnumeratingWithState:&v38 objects:v50 count:16];
            uint64_t v30 = v36;
          }
          while (v36);
        }
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAddressWithComponentsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAddressWithComponentsIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAddressWithComponents readAll:]((uint64_t)self, 0);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_formattedAddressLines;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_formattedAddressComponents;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_additionalComponents;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAddressWithComponentsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAddressWithComponents readAll:]((uint64_t)self, 0);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = self->_formattedAddressLines;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * v11) copyWithZone:a3];
        -[GEOPDAddressWithComponents addFormattedAddressLine:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v13 = self->_formattedAddressComponents;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v16) copyWithZone:a3];
        -[GEOPDAddressWithComponents addFormattedAddressComponent:]((uint64_t)v5, v17);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = self->_additionalComponents;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (void)v24);
        -[GEOPDAddressWithComponents addAdditionalComponent:]((uint64_t)v5, v22);

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDAddressWithComponents readAll:]((uint64_t)self, 1),
         -[GEOPDAddressWithComponents readAll:]((uint64_t)v4, 1),
         formattedAddressLines = self->_formattedAddressLines,
         !((unint64_t)formattedAddressLines | v4[5]))
     || -[NSMutableArray isEqual:](formattedAddressLines, "isEqual:"))
    && ((formattedAddressComponents = self->_formattedAddressComponents,
         !((unint64_t)formattedAddressComponents | v4[4]))
     || -[NSMutableArray isEqual:](formattedAddressComponents, "isEqual:")))
  {
    additionalComponents = self->_additionalComponents;
    if ((unint64_t)additionalComponents | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](additionalComponents, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDAddressWithComponents readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_formattedAddressLines hash];
  uint64_t v4 = [(NSMutableArray *)self->_formattedAddressComponents hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_additionalComponents hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    -[GEOPDAddressWithComponents readAll:]((uint64_t)v3, 0);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = v4[5];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          -[GEOPDAddressWithComponents addFormattedAddressLine:](a1, *(void **)(*((void *)&v28 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v4[4];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          -[GEOPDAddressWithComponents addFormattedAddressComponent:](a1, *(void **)(*((void *)&v24 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v12);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v4[3];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          -[GEOPDAddressWithComponents addAdditionalComponent:](a1, *(void **)(*((void *)&v20 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v17);
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 1u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDAddressWithComponents readAll:](a1, 0);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = *(id *)(a1 + 32);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            -[GEOPDAddressComponent clearUnknownFields:](*(void *)(*((void *)&v19 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v7);
      }

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = *(id *)(a1 + 24);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            -[GEOPDAddressComponent clearUnknownFields:](*(void *)(*((void *)&v15 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedAddressLines, 0);
  objc_storeStrong((id *)&self->_formattedAddressComponents, 0);
  objc_storeStrong((id *)&self->_additionalComponents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end