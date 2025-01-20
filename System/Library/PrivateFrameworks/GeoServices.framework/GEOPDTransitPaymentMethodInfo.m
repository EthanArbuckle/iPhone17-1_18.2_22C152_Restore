@interface GEOPDTransitPaymentMethodInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitPaymentMethodInfo)init;
- (GEOPDTransitPaymentMethodInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)paymentMethodSuggestions;
- (id)paymentMethods;
- (unint64_t)hash;
- (void)_addNoFlagsPaymentMethod:(uint64_t)a1;
- (void)_addNoFlagsPaymentMethodSuggestion:(uint64_t)a1;
- (void)_readPaymentMethodSuggestions;
- (void)_readPaymentMethods;
- (void)addPaymentMethod:(uint64_t)a1;
- (void)addPaymentMethodSuggestion:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitPaymentMethodInfo

- (void)_addNoFlagsPaymentMethodSuggestion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readPaymentMethods
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitPaymentMethodInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaymentMethods_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTransitPaymentMethodInfo readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v39 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"paymentMethodSuggestion";
      }
      else {
        v13 = @"payment_method_suggestion";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"paymentMethod";
      }
      else {
        v22 = @"payment_method";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if (*(unsigned char *)(a1 + 60))
    {
      v23 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v24 = @"cachingRadiusMeters";
      }
      else {
        v24 = @"caching_radius_meters";
      }
      [v4 setObject:v23 forKey:v24];
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
        v32[2] = __59__GEOPDTransitPaymentMethodInfo__dictionaryRepresentation___block_invoke;
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

- (void)addPaymentMethodSuggestion:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitPaymentMethodInfo _readPaymentMethodSuggestions](a1);
    -[GEOPDTransitPaymentMethodInfo _addNoFlagsPaymentMethodSuggestion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)self, 1);
  -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)v4, 1);
  paymentMethodSuggestions = self->_paymentMethodSuggestions;
  if ((unint64_t)paymentMethodSuggestions | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](paymentMethodSuggestions, "isEqual:")) {
      goto LABEL_10;
    }
  }
  paymentMethods = self->_paymentMethods;
  if ((unint64_t)paymentMethods | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](paymentMethods, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) != 0 && self->_cachingRadiusMeters == *((double *)v4 + 3))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (GEOPDTransitPaymentMethodInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitPaymentMethodInfo;
  v2 = [(GEOPDTransitPaymentMethodInfo *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDTransitPaymentMethodInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitPaymentMethodInfo;
  id v3 = [(GEOPDTransitPaymentMethodInfo *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readPaymentMethodSuggestions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitPaymentMethodInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaymentMethodSuggestions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)paymentMethodSuggestions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitPaymentMethodInfo _readPaymentMethodSuggestions]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)paymentMethods
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitPaymentMethodInfo _readPaymentMethods]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPaymentMethod:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitPaymentMethodInfo _readPaymentMethods](a1);
    -[GEOPDTransitPaymentMethodInfo _addNoFlagsPaymentMethod:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsPaymentMethod:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDTransitPaymentMethodInfo;
  id v4 = [(GEOPDTransitPaymentMethodInfo *)&v8 description];
  id v5 = [(GEOPDTransitPaymentMethodInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitPaymentMethodInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitPaymentMethodInfo _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_9460;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9461;
      }
      GEOPDTransitPaymentMethodInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTransitPaymentMethodInfoCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __59__GEOPDTransitPaymentMethodInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  return GEOPDTransitPaymentMethodInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v14 = self->_paymentMethods;
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v14);
            }
            if (GEOPBTransitPaymentMethodIsDirty(*(void *)(*((void *)&v28 + 1) + 8 * i)))
            {

              goto LABEL_3;
            }
          }
          uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)self, 0);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_super v6 = self->_paymentMethodSuggestions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v7);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = self->_paymentMethods;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v11; ++k)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v11);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDTransitPaymentMethodInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)self, 0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_paymentMethodSuggestions;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDTransitPaymentMethodInfo addPaymentMethodSuggestion:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_paymentMethods;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        -[GEOPDTransitPaymentMethodInfo addPaymentMethod:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 24) = self->_cachingRadiusMeters;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_22:

  return (id)v5;
}

- (unint64_t)hash
{
  -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_paymentMethodSuggestions hash];
  uint64_t v4 = [(NSMutableArray *)self->_paymentMethods hash];
  if (*(unsigned char *)&self->_flags)
  {
    double cachingRadiusMeters = self->_cachingRadiusMeters;
    double v7 = -cachingRadiusMeters;
    if (cachingRadiusMeters >= 0.0) {
      double v7 = self->_cachingRadiusMeters;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_paymentMethodSuggestions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end