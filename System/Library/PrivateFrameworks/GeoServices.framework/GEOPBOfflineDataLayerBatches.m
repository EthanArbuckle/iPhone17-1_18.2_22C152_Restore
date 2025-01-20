@interface GEOPBOfflineDataLayerBatches
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)batchReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)addBatchReference:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineDataLayerBatches

- (id)batchReferences
{
  if (a1)
  {
    a1 = (id *)a1[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addBatchReference:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineDataLayerBatches;
  v4 = [(GEOPBOfflineDataLayerBatches *)&v8 description];
  id v5 = [(GEOPBOfflineDataLayerBatches *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataLayerBatches _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 40))
    {
      id v5 = _GEOPBOfflineDataLayerVersionDictionaryRepresentation((int *)(a1 + 8));
      if (a2) {
        v6 = @"layerVersion";
      }
      else {
        v6 = @"layer_version";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 32) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v17);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"batchReference";
      }
      else {
        v15 = @"batch_reference";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v15, (void)v17);
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
  return -[GEOPBOfflineDataLayerBatches _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineDataLayerBatchesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v14 = 0;
    PBDataWriterPlaceMark();
    GEOPBOfflineDataLayerVersionWriteTo((uint64_t)&self->_layerVersion);
    PBDataWriterRecallMark();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_batchReferences;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v7 = *(void *)&self->_layerVersion._has;
    *(_OWORD *)(v5 + 8) = *(_OWORD *)&self->_layerVersion._layer;
    *(void *)(v5 + 24) = v7;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_batchReferences;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        -[GEOPBOfflineDataLayerBatches addBatchReference:]((uint64_t)v6, v13);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 40))
    {
      BOOL v5 = *(void *)&self->_layerVersion._layer == *((void *)v4 + 1)
        && self->_layerVersion._version == *((void *)v4 + 2);
      if (v5 && *(void *)&self->_layerVersion._has == *((void *)v4 + 3)) {
        goto LABEL_15;
      }
    }
LABEL_13:
    char v7 = 0;
    goto LABEL_14;
  }
  if (*((unsigned char *)v4 + 40)) {
    goto LABEL_13;
  }
LABEL_15:
  batchReferences = self->_batchReferences;
  if ((unint64_t)batchReferences | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](batchReferences, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = PBHashBytes();
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSMutableArray *)self->_batchReferences hash] ^ v3;
}

- (void).cxx_destruct
{
}

@end