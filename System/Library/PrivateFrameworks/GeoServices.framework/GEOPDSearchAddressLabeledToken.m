@interface GEOPDSearchAddressLabeledToken
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchAddressLabeledToken)init;
- (GEOPDSearchAddressLabeledToken)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsGeoDecoration:(uint64_t)a1;
- (void)_addNoFlagsUnPaddedDoorNumbers:(uint64_t)a1;
- (void)_readUnPaddedDoorNumbers;
- (void)addGeoDecoration:(uint64_t)a1;
- (void)addUnPaddedDoorNumbers:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchAddressLabeledToken

- (GEOPDSearchAddressLabeledToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchAddressLabeledToken;
  v2 = [(GEOPDSearchAddressLabeledToken *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchAddressLabeledToken)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchAddressLabeledToken;
  v3 = [(GEOPDSearchAddressLabeledToken *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addGeoDecoration:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoDecorations_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchAddressLabeledToken _addNoFlagsGeoDecoration:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 80) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 80) |= 0x40u;
  }
}

- (void)_addNoFlagsGeoDecoration:(uint64_t)a1
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

- (void)_readUnPaddedDoorNumbers
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnPaddedDoorNumbers_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addUnPaddedDoorNumbers:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchAddressLabeledToken _readUnPaddedDoorNumbers](a1);
    -[GEOPDSearchAddressLabeledToken _addNoFlagsUnPaddedDoorNumbers:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 80) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 80) |= 0x40u;
  }
}

- (void)_addNoFlagsUnPaddedDoorNumbers:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchAddressLabeledToken;
  v4 = [(GEOPDSearchAddressLabeledToken *)&v8 description];
  id v5 = [(GEOPDSearchAddressLabeledToken *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchAddressLabeledToken _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchAddressLabeledToken readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
    if (a2) {
      objc_super v6 = @"labelType";
    }
    else {
      objc_super v6 = @"label_type";
    }
    [v4 setObject:v5 forKey:v6];

    if ([*(id *)(a1 + 24) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v8 = *(id *)(a1 + 24);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v37 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = objc_msgSend(v12, "dictionaryRepresentation", (void)v36);
            }
            objc_msgSend(v7, "addObject:", v13, (void)v36);
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"geoDecoration";
      }
      else {
        v14 = @"geo_decoration";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v14, (void)v36);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readToken_tags_2);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v17 = *(id *)(a1 + 48);
    if (v17) {
      [v4 setObject:v17 forKey:@"token"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v18 = *(void **)(a1 + 8);
      if (v18)
      {
        id v19 = v18;
        objc_sync_enter(v19);
        GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabel_tags_2);
        objc_sync_exit(v19);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v20 = *(id *)(a1 + 32);
    if (v20) {
      [v4 setObject:v20 forKey:@"label"];
    }

    if (*(void *)(a1 + 56))
    {
      -[GEOPDSearchAddressLabeledToken _readUnPaddedDoorNumbers](a1);
      id v21 = *(id *)(a1 + 56);
      if (a2) {
        v22 = @"unPaddedDoorNumbers";
      }
      else {
        v22 = @"un_padded_door_numbers";
      }
      [v4 setObject:v21 forKey:v22];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 1) == 0)
    {
      v23 = *(void **)(a1 + 8);
      if (v23)
      {
        id v24 = v23;
        objc_sync_enter(v24);
        GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbbrDecoration_tags);
        objc_sync_exit(v24);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v25 = *(id *)(a1 + 16);
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"abbrDecoration";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"abbr_decoration";
      }
      [v4 setObject:v27 forKey:v28];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v29 = *(void **)(a1 + 8);
      if (v29)
      {
        id v30 = v29;
        objc_sync_enter(v30);
        GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStreetRelaxationDecoration_tags);
        objc_sync_exit(v30);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v31 = *(id *)(a1 + 40);
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"streetRelaxationDecoration";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"street_relaxation_decoration";
      }
      [v4 setObject:v33 forKey:v34];
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
  return -[GEOPDSearchAddressLabeledToken _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_133;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_134;
      }
      GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchAddressLabeledTokenCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"labelType";
    }
    else {
      id v7 = @"label_type";
    }
    id v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [v8 intValue];
      *(unsigned char *)(v6 + 80) |= 0x40u;
      *(_DWORD *)(v6 + 76) = v9;
    }

    if (a3) {
      uint64_t v10 = @"geoDecoration";
    }
    else {
      uint64_t v10 = @"geo_decoration";
    }
    v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    int v47 = a3;
    if (objc_opt_isKindOfClass())
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v53;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v53 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v52 + 1) + 8 * v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [GEOPDSearchStringStringPair alloc];
              if (v18) {
                id v19 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v18, v17);
              }
              else {
                id v19 = 0;
              }
              -[GEOPDSearchAddressLabeledToken addGeoDecoration:](v6, v19);
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v20 = [v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
          uint64_t v14 = v20;
        }
        while (v20);
      }

      a3 = v47;
    }

    id v21 = [v5 objectForKeyedSubscript:@"token"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      id v23 = v22;
      *(unsigned char *)(v6 + 80) |= 0x10u;
      *(unsigned char *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 48), v22);
    }
    id v24 = [v5 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = (void *)[v24 copy];
      id v26 = v25;
      *(unsigned char *)(v6 + 80) |= 4u;
      *(unsigned char *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 32), v25);
    }
    if (a3) {
      v27 = @"unPaddedDoorNumbers";
    }
    else {
      v27 = @"un_padded_door_numbers";
    }
    v28 = [v5 objectForKeyedSubscript:v27];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v49;
        do
        {
          uint64_t v33 = 0;
          do
          {
            if (*(void *)v49 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v48 + 1) + 8 * v33);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v35 = (void *)[v34 copy];
              -[GEOPDSearchAddressLabeledToken addUnPaddedDoorNumbers:](v6, v35);
            }
            ++v33;
          }
          while (v31 != v33);
          uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v31);
      }

      a3 = v47;
    }

    if (a3) {
      long long v36 = @"abbrDecoration";
    }
    else {
      long long v36 = @"abbr_decoration";
    }
    long long v37 = [v5 objectForKeyedSubscript:v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v38 = [GEOPDSearchGeoDecoration alloc];
      if (v38) {
        long long v39 = (void *)-[GEOPDSearchGeoDecoration _initWithDictionary:isJSON:](v38, v37, a3);
      }
      else {
        long long v39 = 0;
      }
      id v40 = v39;
      *(unsigned char *)(v6 + 80) |= 1u;
      *(unsigned char *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 16), v39);
    }
    if (a3) {
      uint64_t v41 = @"streetRelaxationDecoration";
    }
    else {
      uint64_t v41 = @"street_relaxation_decoration";
    }
    v42 = [v5 objectForKeyedSubscript:v41];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [GEOPDSearchGeoDecoration alloc];
      if (v43) {
        v44 = (void *)-[GEOPDSearchGeoDecoration _initWithDictionary:isJSON:](v43, v42, a3);
      }
      else {
        v44 = 0;
      }
      id v45 = v44;
      *(unsigned char *)(v6 + 80) |= 8u;
      *(unsigned char *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 40), v44);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchAddressLabeledTokenReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchAddressLabeledTokenIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)self, 0);
    PBDataWriterWriteInt32Field();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = self->_geoDecorations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    PBDataWriterWriteStringField();
    PBDataWriterWriteStringField();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_unPaddedDoorNumbers;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_abbrDecoration) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_streetRelaxationDecoration) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchAddressLabeledTokenReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)self, 0);
  *(_DWORD *)(v5 + 76) = self->_labelType;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = self->_geoDecorations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchAddressLabeledToken addGeoDecoration:](v5, v12);
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_token copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  uint64_t v15 = [(NSString *)self->_label copyWithZone:a3];
  long long v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v17 = self->_unPaddedDoorNumbers;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v17);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        -[GEOPDSearchAddressLabeledToken addUnPaddedDoorNumbers:](v5, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }

  id v22 = [(GEOPDSearchGeoDecoration *)self->_abbrDecoration copyWithZone:a3];
  long long v23 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v22;

  id v24 = [(GEOPDSearchGeoDecoration *)self->_streetRelaxationDecoration copyWithZone:a3];
  id v25 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)self, 1),
        -[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)v4, 1),
        self->_labelType == *((_DWORD *)v4 + 19))
    && ((geoDecorations = self->_geoDecorations, !((unint64_t)geoDecorations | v4[3]))
     || -[NSMutableArray isEqual:](geoDecorations, "isEqual:"))
    && ((token = self->_token, !((unint64_t)token | v4[6]))
     || -[NSString isEqual:](token, "isEqual:"))
    && ((label = self->_label, !((unint64_t)label | v4[4]))
     || -[NSString isEqual:](label, "isEqual:"))
    && ((unPaddedDoorNumbers = self->_unPaddedDoorNumbers, !((unint64_t)unPaddedDoorNumbers | v4[7]))
     || -[NSMutableArray isEqual:](unPaddedDoorNumbers, "isEqual:"))
    && ((abbrDecoration = self->_abbrDecoration, !((unint64_t)abbrDecoration | v4[2]))
     || -[GEOPDSearchGeoDecoration isEqual:](abbrDecoration, "isEqual:")))
  {
    streetRelaxationDecoration = self->_streetRelaxationDecoration;
    if ((unint64_t)streetRelaxationDecoration | v4[5]) {
      char v11 = -[GEOPDSearchGeoDecoration isEqual:](streetRelaxationDecoration, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)self, 1);
  uint64_t v3 = 2654435761 * self->_labelType;
  uint64_t v4 = [(NSMutableArray *)self->_geoDecorations hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_token hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_label hash];
  uint64_t v7 = v6 ^ [(NSMutableArray *)self->_unPaddedDoorNumbers hash];
  unint64_t v8 = v7 ^ [(GEOPDSearchGeoDecoration *)self->_abbrDecoration hash] ^ v3;
  return v8 ^ [(GEOPDSearchGeoDecoration *)self->_streetRelaxationDecoration hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unPaddedDoorNumbers, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_streetRelaxationDecoration, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_geoDecorations, 0);
  objc_storeStrong((id *)&self->_abbrDecoration, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end