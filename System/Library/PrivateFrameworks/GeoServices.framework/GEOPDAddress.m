@interface GEOPDAddress
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAddress)init;
- (GEOPDAddress)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedAddress;
- (id)spokenNavigationAddress;
- (id)spokenStructuredAddress;
- (uint64_t)knownAccuracy;
- (unint64_t)hash;
- (void)_addNoFlagsLocalizedAddress:(uint64_t)a1;
- (void)_addNoFlagsSpokenNavigationAddress:(uint64_t)a1;
- (void)_addNoFlagsSpokenStructuredAddress:(uint64_t)a1;
- (void)_readLocalizedAddress;
- (void)_readSpokenNavigationAddress;
- (void)_readSpokenStructuredAddress;
- (void)addLocalizedAddress:(uint64_t)a1;
- (void)addSpokenNavigationAddress:(uint64_t)a1;
- (void)addSpokenStructuredAddress:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setLocalizedAddress:(uint64_t)a1;
- (void)setSpokenNavigationAddress:(uint64_t)a1;
- (void)setSpokenStructuredAddress:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAddress

- (void)_readSpokenStructuredAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenStructuredAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)_readSpokenNavigationAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenNavigationAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)spokenStructuredAddress
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAddress _readSpokenStructuredAddress]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)spokenNavigationAddress
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAddress _readSpokenNavigationAddress]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)localizedAddress
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAddress _readLocalizedAddress]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLocalizedAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedAddress_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (uint64_t)knownAccuracy
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if (v2) {
      return *(unsigned int *)(v1 + 60);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)setSpokenStructuredAddress:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setSpokenNavigationAddress:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setLocalizedAddress:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (GEOPDAddress)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAddress;
  char v2 = [(GEOPDAddress *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenStructuredAddress, 0);
  objc_storeStrong((id *)&self->_spokenNavigationAddress, 0);
  objc_storeStrong((id *)&self->_localizedAddress, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDAddress)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAddress;
  id v3 = [(GEOPDAddress *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addLocalizedAddress:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAddress _readLocalizedAddress](a1);
    -[GEOPDAddress _addNoFlagsLocalizedAddress:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsLocalizedAddress:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addSpokenNavigationAddress:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAddress _readSpokenNavigationAddress](a1);
    -[GEOPDAddress _addNoFlagsSpokenNavigationAddress:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsSpokenNavigationAddress:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addSpokenStructuredAddress:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDAddress _readSpokenStructuredAddress](a1);
    -[GEOPDAddress _addNoFlagsSpokenStructuredAddress:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsSpokenStructuredAddress:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAddress;
  id v4 = [(GEOPDAddress *)&v8 description];
  id v5 = [(GEOPDAddress *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDAddress readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v53 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"localizedAddress";
      }
      else {
        v13 = @"localized_address";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v49 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v48 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v57 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"spokenNavigationAddress";
      }
      else {
        v22 = @"spoken_navigation_address";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v24 = *(id *)(a1 + 40);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v45;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v45 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v44 + 1) + 8 * k);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
        }
        while (v26);
      }

      if (a2) {
        v31 = @"spokenStructuredAddress";
      }
      else {
        v31 = @"spoken_structured_address";
      }
      [v4 setObject:v23 forKey:v31];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v32 = *(int *)(a1 + 60);
      if (v32 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = off_1E53E3F08[v32];
      }
      if (a2) {
        v34 = @"knownAccuracy";
      }
      else {
        v34 = @"known_accuracy";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = *(void **)(a1 + 16);
    if (v35)
    {
      v36 = [v35 dictionaryRepresentation];
      v37 = v36;
      if (a2)
      {
        v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __42__GEOPDAddress__dictionaryRepresentation___block_invoke;
        v42[3] = &unk_1E53D8860;
        id v39 = v38;
        id v43 = v39;
        [v37 enumerateKeysAndObjectsUsingBlock:v42];
        id v40 = v39;

        v37 = v40;
      }
      [v4 setObject:v37 forKey:@"Unknown Fields"];
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
  return -[GEOPDAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_179;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_180;
      }
      GEOPDAddressReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDAddressCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __42__GEOPDAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  uint64_t v6 = 8;
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), char flags = (char)self->_flags, (flags & 0x3C) != 0))
  {
LABEL_27:
    os_unfair_lock_unlock(p_readerLock);
    -[GEOPDAddress readAll:]((uint64_t)self, 0);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v20 = self->_localizedAddress;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v20);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v41 objects:v55 count:16];
      }
      while (v21);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v24 = self->_spokenNavigationAddress;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v37 objects:v54 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v24);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v37 objects:v54 count:16];
      }
      while (v25);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v28 = self->_spokenStructuredAddress;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v33 objects:v53 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(v28);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v33 objects:v53 count:16];
      }
      while (v29);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      obuint64_t j = self->_spokenNavigationAddress;
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v50;
        while (2)
        {
          for (uint64_t m = 0; m != v8; ++m)
          {
            if (*(void *)v50 != v9) {
              objc_enumerationMutation(obj);
            }
            if (GEOLocalizedStringIsDirty(*(void *)(*((void *)&v49 + 1) + 8 * m)))
            {
LABEL_26:

              goto LABEL_27;
            }
          }
          uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      char flags = (char)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      obuint64_t j = self->_spokenStructuredAddress;
      uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v46;
        while (2)
        {
          for (uint64_t n = 0; n != v11; ++n)
          {
            if (*(void *)v46 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = p_readerLock;
            uint64_t v15 = v6;
            uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 8 * n);
            if (v16)
            {
              os_unfair_lock_lock_with_options();
              os_unfair_lock_assert_owner((const os_unfair_lock *)(v16 + 48));
              int v17 = *(unsigned char *)(v16 + 52) & 0xE;
              os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 48));
              if (v17)
              {
                p_readerLocuint64_t k = v14;
                goto LABEL_26;
              }
            }
            uint64_t v6 = v15;
            p_readerLocuint64_t k = v14;
          }
          uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v56 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
    id v18 = *(id *)((char *)&self->super.super.isa + v6);
    objc_sync_enter(v18);
    *(void *)(*(char **)((char *)&self->super.super.isa + v6) + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [*(id *)((char *)&self->super.super.isa + v6) seekToOffset:self->_readerMarkPos];
    v19 = [*(id *)((char *)&self->super.super.isa + v6) readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAddressReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAddress readAll:]((uint64_t)self, 0);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v9 = self->_localizedAddress;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDAddress addLocalizedAddress:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v10);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v14 = self->_spokenNavigationAddress;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDAddress addSpokenNavigationAddress:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v19 = self->_spokenStructuredAddress;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (void)v26);
        -[GEOPDAddress addSpokenStructuredAddress:](v5, v23);
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_knownAccuracy;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v24 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v24;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  -[GEOPDAddress readAll:]((uint64_t)self, 1);
  -[GEOPDAddress readAll:]((uint64_t)v4, 1);
  localizedAddress = self->_localizedAddress;
  if ((unint64_t)localizedAddress | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](localizedAddress, "isEqual:")) {
      goto LABEL_12;
    }
  }
  spokenNavigationAddress = self->_spokenNavigationAddress;
  if ((unint64_t)spokenNavigationAddress | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](spokenNavigationAddress, "isEqual:")) {
      goto LABEL_12;
    }
  }
  spokenStructuredAddress = self->_spokenStructuredAddress;
  if ((unint64_t)spokenStructuredAddress | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](spokenStructuredAddress, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) != 0 && self->_knownAccuracy == *((_DWORD *)v4 + 15))
    {
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
  -[GEOPDAddress readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_localizedAddress hash];
  uint64_t v4 = [(NSMutableArray *)self->_spokenNavigationAddress hash];
  uint64_t v5 = [(NSMutableArray *)self->_spokenStructuredAddress hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_knownAccuracy;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

@end