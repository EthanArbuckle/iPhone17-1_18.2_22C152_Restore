@interface GEOPDSearchStructuredAttribute
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchStructuredAttribute)init;
- (GEOPDSearchStructuredAttribute)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsNestedAttribute:(uint64_t)a1;
- (void)addNestedAttribute:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchStructuredAttribute

- (GEOPDSearchStructuredAttribute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchStructuredAttribute;
  v2 = [(GEOPDSearchStructuredAttribute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchStructuredAttribute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchStructuredAttribute;
  v3 = [(GEOPDSearchStructuredAttribute *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addNestedAttribute:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchStructuredAttributeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNestedAttributes_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    -[GEOPDSearchStructuredAttribute _addNoFlagsNestedAttribute:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 48) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(unsigned char *)(a1 + 48) |= 8u;
  }
}

- (void)_addNoFlagsNestedAttribute:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchStructuredAttribute;
  v4 = [(GEOPDSearchStructuredAttribute *)&v8 description];
  id v5 = [(GEOPDSearchStructuredAttribute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchStructuredAttribute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchStructuredAttribute readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchStructuredAttributeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttribute_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v7 = *(id *)(a1 + 16);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"attribute"];
    }
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v10 = *(int *)(a1 + 44);
      if (v10 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53E2A98[v10];
      }
      [v4 setObject:v11 forKey:@"operator"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = *(id *)(a1 + 24);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v12 addObject:v18];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"nestedAttribute";
      }
      else {
        v19 = @"nested_attribute";
      }
      [v4 setObject:v12 forKey:v19];
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
  return -[GEOPDSearchStructuredAttribute _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_2414;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_2415;
      }
      GEOPDSearchStructuredAttributeReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchStructuredAttributeCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_98;
  }
  id v7 = [v5 objectForKeyedSubscript:@"attribute"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOPDSearchAttribute alloc];
    if (!v8)
    {
LABEL_66:
      v39 = v8;
      *(unsigned char *)(v6 + 48) |= 2u;
      *(unsigned char *)(v6 + 48) |= 8u;
      objc_storeStrong((id *)(v6 + 16), v8);

      goto LABEL_67;
    }
    id v9 = v7;
    objc_super v8 = [(GEOPDSearchAttribute *)v8 init];
    if (!v8)
    {
LABEL_65:

      goto LABEL_66;
    }
    uint64_t v10 = [v9 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      id v12 = v11;
      *(_WORD *)&v8->_flags |= 0x40u;
      *(_WORD *)&v8->_flags |= 0x100u;
      objc_storeStrong((id *)&v8->_name, v11);
    }
    if (a3) {
      id v13 = @"attributeId";
    }
    else {
      id v13 = @"attribute_id";
    }
    uint64_t v14 = [v9 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = (void *)[v14 copy];
      id v16 = v15;
      *(_WORD *)&v8->_flags |= 0x10u;
      *(_WORD *)&v8->_flags |= 0x100u;
      objc_storeStrong((id *)&v8->_attributeId, v15);
    }
    if (a3) {
      v17 = @"tokenSet";
    }
    else {
      v17 = @"token_set";
    }
    v18 = [v9 objectForKeyedSubscript:v17];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [GEOPDSearchTokenSet alloc];
      if (v19) {
        v20 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v19, v18, a3);
      }
      else {
        v20 = 0;
      }
      id v21 = v20;
      *(_WORD *)&v8->_flags |= 0x80u;
      *(_WORD *)&v8->_flags |= 0x100u;
      objc_storeStrong((id *)&v8->_tokenSet, v20);
    }
    if (a3) {
      long long v22 = @"attributeValue";
    }
    else {
      long long v22 = @"attribute_value";
    }
    long long v23 = [v9 objectForKeyedSubscript:v22];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v24 = (void *)[v23 copy];
      id v25 = v24;
      *(_WORD *)&v8->_flags |= 0x20u;
      *(_WORD *)&v8->_flags |= 0x100u;
      objc_storeStrong((id *)&v8->_attributeValue, v24);
    }
    if (a3) {
      uint64_t v26 = @"isOptionalAttribute";
    }
    else {
      uint64_t v26 = @"is_optional_attribute";
    }
    v27 = [v9 objectForKeyedSubscript:v26];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v28 = [v27 BOOLValue];
      *(_WORD *)&v8->_flags |= 0x100u;
      *(_WORD *)&v8->_flags |= 2u;
      v8->_isOptionalAttribute = v28;
    }

    if (a3) {
      v29 = @"negateAttribute";
    }
    else {
      v29 = @"negate_attribute";
    }
    v30 = [v9 objectForKeyedSubscript:v29];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v31 = [v30 BOOLValue];
      *(_WORD *)&v8->_flags |= 0x100u;
      *(_WORD *)&v8->_flags |= 8u;
      v8->_negateAttribute = v31;
    }

    if (a3) {
      v32 = @"rankingOrder";
    }
    else {
      v32 = @"ranking_order";
    }
    v33 = [v9 objectForKeyedSubscript:v32];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = v33;
      if ([v34 isEqualToString:@"RELEVANCE"])
      {
        int v35 = 0;
      }
      else if ([v34 isEqualToString:@"RATING"])
      {
        int v35 = 1;
      }
      else if ([v34 isEqualToString:@"DISTANCE"])
      {
        int v35 = 2;
      }
      else if ([v34 isEqualToString:@"RANKER_DISABLED"])
      {
        int v35 = 3;
      }
      else if ([v34 isEqualToString:@"PRICE_RANGE_ASCENDING"])
      {
        int v35 = 4;
      }
      else if ([v34 isEqualToString:@"PRICE_RANGE_DESCENDING"])
      {
        int v35 = 5;
      }
      else if ([v34 isEqualToString:@"DISTANCE_TO_DEVICE_LOCATION"])
      {
        int v35 = 6;
      }
      else if ([v34 isEqualToString:@"VENDOR_RATING"])
      {
        int v35 = 7;
      }
      else
      {
        int v35 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_59:

        if (a3) {
          v36 = @"isOptionalKeyword";
        }
        else {
          v36 = @"is_optional_keyword";
        }
        v37 = [v9 objectForKeyedSubscript:v36];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v38 = [v37 BOOLValue];
          *(_WORD *)&v8->_flags |= 0x100u;
          *(_WORD *)&v8->_flags |= 4u;
          v8->_isOptionalKeyword = v38;
        }

        goto LABEL_65;
      }
      int v35 = [v33 intValue];
    }
    *(_WORD *)&v8->_flags |= 0x100u;
    *(_WORD *)&v8->_flags |= 1u;
    v8->_rankingOrder = v35;
    goto LABEL_59;
  }
LABEL_67:

  v40 = [v5 objectForKeyedSubscript:@"operator"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v40;
    if ([v41 isEqualToString:@"STRUCTURED_ATTRIBUTE_OPERATOR_NONE"])
    {
      int v42 = 0;
    }
    else if ([v41 isEqualToString:@"STRUCTURED_ATTRIBUTE_OPERATOR_AND"])
    {
      int v42 = 1;
    }
    else if ([v41 isEqualToString:@"STRUCTURED_ATTRIBUTE_OPERATOR_OR"])
    {
      int v42 = 2;
    }
    else
    {
      int v42 = 0;
    }

    goto LABEL_78;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v42 = [v40 intValue];
LABEL_78:
    *(unsigned char *)(v6 + 48) |= 8u;
    *(unsigned char *)(v6 + 48) |= 1u;
    *(_DWORD *)(v6 + 44) = v42;
  }

  if (a3) {
    v43 = @"nestedAttribute";
  }
  else {
    v43 = @"nested_attribute";
  }
  v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v55 = v5;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v45 = v44;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v57;
      do
      {
        uint64_t v49 = 0;
        do
        {
          if (*(void *)v57 != v48) {
            objc_enumerationMutation(v45);
          }
          uint64_t v50 = *(void *)(*((void *)&v56 + 1) + 8 * v49);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v51 = [GEOPDSearchStructuredAttribute alloc];
            if (v51) {
              v52 = (void *)-[GEOPDSearchStructuredAttribute _initWithDictionary:isJSON:](v51, v50, a3);
            }
            else {
              v52 = 0;
            }
            -[GEOPDSearchStructuredAttribute addNestedAttribute:](v6, v52);
          }
          ++v49;
        }
        while (v47 != v49);
        uint64_t v53 = [v45 countByEnumeratingWithState:&v56 objects:v60 count:16];
        uint64_t v47 = v53;
      }
      while (v53);
    }

    id v5 = v55;
  }

LABEL_98:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchStructuredAttributeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchStructuredAttributeIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
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
    -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)self, 0);
    if (self->_attribute) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_nestedAttributes;
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
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchStructuredAttributeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDSearchAttribute *)self->_attribute copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_operatorValue;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_nestedAttributes;
  uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        -[GEOPDSearchStructuredAttribute addNestedAttribute:](v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)self, 1);
  -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)v4, 1);
  attribute = self->_attribute;
  if ((unint64_t)attribute | *((void *)v4 + 2))
  {
    if (!-[GEOPDSearchAttribute isEqual:](attribute, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_operatorValue != *((_DWORD *)v4 + 11)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  nestedAttributes = self->_nestedAttributes;
  if ((unint64_t)nestedAttributes | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](nestedAttributes, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDSearchAttribute *)self->_attribute hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_operatorValue;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(NSMutableArray *)self->_nestedAttributes hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedAttributes, 0);
  objc_storeStrong((id *)&self->_attribute, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end