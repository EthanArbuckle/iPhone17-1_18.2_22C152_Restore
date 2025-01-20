@interface GEOPDSInferredInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSInferredInfo)init;
- (GEOPDSInferredInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsOperand:(uint64_t)a1;
- (void)addOperand:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setInferredValue:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSInferredInfo

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    -[GEOPDSInferredInfo readAll:]((uint64_t)v3, 0);
    if (*((unsigned char *)v4 + 60))
    {
      *(_DWORD *)(a1 + 52) = *((_DWORD *)v4 + 13);
      *(unsigned char *)(a1 + 60) |= 1u;
    }
    uint64_t v5 = *(void *)(a1 + 24);
    v6 = (void *)*((void *)v4 + 3);
    if (v5)
    {
      if (v6)
      {
        v7 = v6;
        v8 = v7;
        char v9 = v7[36];
        if (v9)
        {
          *(_DWORD *)(v5 + 24) = *((_DWORD *)v7 + 6);
          *(unsigned char *)(v5 + 36) |= 1u;
          char v9 = v7[36];
        }
        if ((v9 & 2) != 0)
        {
          *(_DWORD *)(v5 + 28) = *((_DWORD *)v7 + 7);
          *(unsigned char *)(v5 + 36) |= 2u;
        }
        uint64_t v10 = *(void *)(v5 + 16);
        v11 = (void *)*((void *)v7 + 2);
        if (v10)
        {
          if (v11)
          {
            v12 = v11;
            char v13 = v12[24];
            if (v13)
            {
              *(_DWORD *)(v10 + 16) = *((_DWORD *)v12 + 4);
              *(unsigned char *)(v10 + 24) |= 1u;
              char v13 = v12[24];
            }
            if ((v13 & 2) != 0)
            {
              *(_DWORD *)(v10 + 20) = *((_DWORD *)v12 + 5);
              *(unsigned char *)(v10 + 24) |= 2u;
            }
          }
        }
        else if (v11)
        {
          -[GEOPDSInferredValue setAttribute:](v5, v11);
        }
        if ((v8[36] & 4) != 0)
        {
          *(unsigned char *)(v5 + 32) = v8[32];
          *(unsigned char *)(v5 + 36) |= 4u;
        }
      }
    }
    else if (v6)
    {
      -[GEOPDSInferredInfo setInferredValue:](a1, v6);
    }
    if ((*((unsigned char *)v4 + 60) & 2) != 0)
    {
      *(_DWORD *)(a1 + 56) = *((_DWORD *)v4 + 14);
      *(unsigned char *)(a1 + 60) |= 2u;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = *((id *)v4 + 4);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          -[GEOPDSInferredInfo addOperand:](a1, *(void **)(*((void *)&v19 + 1) + 8 * i));
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (GEOPDSInferredInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSInferredInfo;
  v2 = [(GEOPDSInferredInfo *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDSInferredInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSInferredInfo;
  id v3 = [(GEOPDSInferredInfo *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)setInferredValue:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 8u;
  *(unsigned char *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)addOperand:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSInferredInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOperands_tags_0);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSInferredInfo _addNoFlagsOperand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsOperand:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSInferredInfo;
  id v4 = [(GEOPDSInferredInfo *)&v8 description];
  id v5 = [(GEOPDSInferredInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSInferredInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSInferredInfo readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DD9B0[v5];
      }
      if (a2) {
        id v7 = @"inferredType";
      }
      else {
        id v7 = @"inferred_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSInferredInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInferredValue_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v10 = *(id *)(a1 + 24);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        char v13 = @"inferredValue";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        char v13 = @"inferred_value";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      uint64_t v14 = *(int *)(a1 + 56);
      if (v14 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v15 = off_1E53DD9D0[v14];
      }
      [v4 setObject:v15 forKey:@"operator"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v17);
            }
            long long v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            long long v22 = [v21 dictionaryRepresentation];
            }
            [v16 addObject:v22];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v18);
      }

      [v4 setObject:v16 forKey:@"operand"];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      uint64_t v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __48__GEOPDSInferredInfo__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;
      }
      else
      {
        id v28 = v24;
      }
      [v4 setObject:v28 forKey:@"Unknown Fields"];
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
  return -[GEOPDSInferredInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_239;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_240;
      }
      GEOPDSInferredInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSInferredInfoCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __48__GEOPDSInferredInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_113;
  }
  if (a3) {
    id v7 = @"inferredType";
  }
  else {
    id v7 = @"inferred_type";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"INFERRED_TYPE_UNKNOWN"])
    {
      int v10 = 0;
    }
    else if ([v9 isEqualToString:@"INFERRED_TYPE_PRICE_RANGE"])
    {
      int v10 = 1;
    }
    else if ([v9 isEqualToString:@"INFERRED_TYPE_TRADING_HOURS"])
    {
      int v10 = 2;
    }
    else if ([v9 isEqualToString:@"INFERRED_TYPE_ATTRIBUTE"])
    {
      int v10 = 3;
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    int v10 = [v8 intValue];
  }
  *(unsigned char *)(v6 + 60) |= 0x20u;
  *(unsigned char *)(v6 + 60) |= 1u;
  *(_DWORD *)(v6 + 52) = v10;
LABEL_19:

  if (a3) {
    v11 = @"inferredValue";
  }
  else {
    v11 = @"inferred_value";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v13 = [GEOPDSInferredValue alloc];
    if (!v13)
    {
LABEL_84:
      -[GEOPDSInferredInfo setInferredValue:](v6, v13);

      goto LABEL_85;
    }
    id v14 = v12;
    char v13 = [(GEOPDSInferredValue *)v13 init];
    if (!v13)
    {
LABEL_83:

      goto LABEL_84;
    }
    if (a3) {
      uint64_t v15 = @"priceRange";
    }
    else {
      uint64_t v15 = @"price_range";
    }
    uint64_t v16 = [v14 objectForKeyedSubscript:v15];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
      if ([v17 isEqualToString:@"PRICE_RANGE_UNKNOWN"])
      {
        int v18 = 0;
      }
      else if ([v17 isEqualToString:@"PRICE_RANGE_INEXPENSIVE"])
      {
        int v18 = 1;
      }
      else if ([v17 isEqualToString:@"PRICE_RANGE_MODERATE"])
      {
        int v18 = 2;
      }
      else if ([v17 isEqualToString:@"PRICE_RANGE_EXPENSIVE"])
      {
        int v18 = 3;
      }
      else if ([v17 isEqualToString:@"PRICE_RANGE_VERY_EXPENSIVE"])
      {
        int v18 = 4;
      }
      else
      {
        int v18 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_44;
      }
      int v18 = [v16 intValue];
    }
    *(unsigned char *)&v13->_flags |= 1u;
    v13->_priceRange = v18;
LABEL_44:

    if (a3) {
      uint64_t v19 = @"tradingHours";
    }
    else {
      uint64_t v19 = @"trading_hours";
    }
    long long v20 = [v14 objectForKeyedSubscript:v19];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v20;
      if ([v21 isEqualToString:@"TRADING_HOURS_UNKNOWN"])
      {
        int v22 = 0;
      }
      else if ([v21 isEqualToString:@"TRADING_HOURS_OPEN_24_HOURS"])
      {
        int v22 = 1;
      }
      else if ([v21 isEqualToString:@"TRADING_HOURS_OPEN_LATE"])
      {
        int v22 = 2;
      }
      else if ([v21 isEqualToString:@"TRADING_HOURS_OPEN_NOW"])
      {
        int v22 = 3;
      }
      else
      {
        int v22 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_61:

        v23 = [v14 objectForKeyedSubscript:@"attribute"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v50 = v14;
          uint64_t v24 = [GEOPDSRawAttribute alloc];
          if (v24)
          {
            id v25 = v23;
            uint64_t v24 = [(GEOPDSRawAttribute *)v24 init];
            if (v24)
            {
              if (a3) {
                v26 = @"beginIndex";
              }
              else {
                v26 = @"begin_index";
              }
              id v27 = objc_msgSend(v25, "objectForKeyedSubscript:", v26, v25);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v28 = [v27 unsignedIntValue];
                *(unsigned char *)&v24->_flags |= 1u;
                v24->_beginIndex = v28;
              }

              if (a3) {
                v29 = @"endIndex";
              }
              else {
                v29 = @"end_index";
              }
              v30 = [v49 objectForKeyedSubscript:v29];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v31 = [v30 unsignedIntValue];
                *(unsigned char *)&v24->_flags |= 2u;
                v24->_endIndex = v31;
              }

              id v25 = v49;
            }
          }
          -[GEOPDSInferredValue setAttribute:]((uint64_t)v13, v24);

          id v14 = v50;
        }

        if (a3) {
          long long v32 = @"negateInferredValue";
        }
        else {
          long long v32 = @"negate_inferred_value";
        }
        long long v33 = [v14 objectForKeyedSubscript:v32];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v34 = [v33 BOOLValue];
          *(unsigned char *)&v13->_flags |= 4u;
          v13->_negateInferredValue = v34;
        }

        goto LABEL_83;
      }
      int v22 = [v20 intValue];
    }
    *(unsigned char *)&v13->_flags |= 2u;
    v13->_tradingHours = v22;
    goto LABEL_61;
  }
LABEL_85:

  long long v35 = [v5 objectForKeyedSubscript:@"operator"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = v35;
    if ([v36 isEqualToString:@"INFERRED_INFO_OPERATOR_NONE"])
    {
      int v37 = 0;
    }
    else if ([v36 isEqualToString:@"INFERRED_INFO_OPERATOR_AND"])
    {
      int v37 = 1;
    }
    else if ([v36 isEqualToString:@"INFERRED_INFO_OPERATOR_OR"])
    {
      int v37 = 2;
    }
    else
    {
      int v37 = 0;
    }

    goto LABEL_96;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v37 = [v35 intValue];
LABEL_96:
    *(unsigned char *)(v6 + 60) |= 0x20u;
    *(unsigned char *)(v6 + 60) |= 2u;
    *(_DWORD *)(v6 + 56) = v37;
  }

  v38 = [v5 objectForKeyedSubscript:@"operand"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v51 = v5;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v39 = v38;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v53;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v53 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v52 + 1) + 8 * v43);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v45 = [GEOPDSInferredInfo alloc];
            if (v45) {
              v46 = (void *)-[GEOPDSInferredInfo _initWithDictionary:isJSON:](v45, v44, a3);
            }
            else {
              v46 = 0;
            }
            -[GEOPDSInferredInfo addOperand:](v6, v46);
          }
          ++v43;
        }
        while (v41 != v43);
        uint64_t v47 = [v39 countByEnumeratingWithState:&v52 objects:v56 count:16];
        uint64_t v41 = v47;
      }
      while (v47);
    }

    id v5 = v51;
  }

LABEL_113:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSInferredInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSInferredInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    int v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSInferredInfo readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_inferredValue) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_operands;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
      GEOPDSInferredInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSInferredInfo readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_inferredType;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v9 = [(GEOPDSInferredValue *)self->_inferredValue copyWithZone:a3];
  int v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_operatorValue;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_operands;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        -[GEOPDSInferredInfo addOperand:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  uint64_t v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  -[GEOPDSInferredInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSInferredInfo readAll:]((uint64_t)v4, 1);
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 60);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_inferredType != *((_DWORD *)v4 + 13)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_17;
  }
  inferredValue = self->_inferredValue;
  if ((unint64_t)inferredValue | *((void *)v4 + 3))
  {
    if (!-[GEOPDSInferredValue isEqual:](inferredValue, "isEqual:"))
    {
LABEL_17:
      char v9 = 0;
      goto LABEL_18;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_operatorValue != *((_DWORD *)v4 + 14)) {
      goto LABEL_17;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_17;
  }
  operands = self->_operands;
  if ((unint64_t)operands | *((void *)v4 + 4)) {
    char v9 = -[NSMutableArray isEqual:](operands, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSInferredInfo readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_inferredType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDSInferredValue *)self->_inferredValue hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_operatorValue;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_operands hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    *(unsigned char *)(a1 + 60) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    unint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSInferredInfo readAll:](a1, 0);
      uint64_t v5 = *(void *)(a1 + 24);
      if (v5)
      {
        char v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;

        uint64_t v7 = *(void *)(v5 + 16);
        if (v7)
        {
          id v8 = *(void **)(v7 + 8);
          *(void *)(v7 + 8) = 0;
        }
      }
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            -[GEOPDSInferredInfo clearUnknownFields:](*(void *)(*((void *)&v14 + 1) + 8 * v13++), 1);
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operands, 0);
  objc_storeStrong((id *)&self->_inferredValue, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end