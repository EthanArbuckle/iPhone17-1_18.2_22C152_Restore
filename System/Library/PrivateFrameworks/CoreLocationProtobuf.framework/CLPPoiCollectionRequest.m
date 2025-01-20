@interface CLPPoiCollectionRequest
+ (Class)harvestsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPMeta)meta;
- (Class)responseClass;
- (NSMutableArray)harvests;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)harvestsAtIndex:(unint64_t)a3;
- (unint64_t)harvestsCount;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)addHarvests:(id)a3;
- (void)clearHarvests;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHarvests:(id)a3;
- (void)setMeta:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPoiCollectionRequest

- (void)clearHarvests
{
}

- (void)addHarvests:(id)a3
{
  id v4 = a3;
  harvests = self->_harvests;
  id v8 = v4;
  if (!harvests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_harvests;
    self->_harvests = v6;

    id v4 = v8;
    harvests = self->_harvests;
  }
  [(NSMutableArray *)harvests addObject:v4];
}

- (unint64_t)harvestsCount
{
  return [(NSMutableArray *)self->_harvests count];
}

- (id)harvestsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_harvests objectAtIndex:a3];
}

+ (Class)harvestsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPPoiCollectionRequest;
  id v4 = [(CLPPoiCollectionRequest *)&v8 description];
  v5 = [(CLPPoiCollectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  meta = self->_meta;
  if (meta)
  {
    v5 = [(CLPMeta *)meta dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"meta"];
  }
  if ([(NSMutableArray *)self->_harvests count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_harvests, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_harvests;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"harvests"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPoiCollectionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_meta) {
    -[CLPPoiCollectionRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_harvests;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unsigned)requestTypeCode
{
  return 108;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setMeta:self->_meta];
  if ([(CLPPoiCollectionRequest *)self harvestsCount])
  {
    [v8 clearHarvests];
    unint64_t v4 = [(CLPPoiCollectionRequest *)self harvestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPPoiCollectionRequest *)self harvestsAtIndex:i];
        [v8 addHarvests:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPMeta *)self->_meta copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_harvests;
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
        [v5 addHarvests:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((meta = self->_meta, !((unint64_t)meta | v4[2])) || -[CLPMeta isEqual:](meta, "isEqual:")))
  {
    harvests = self->_harvests;
    if ((unint64_t)harvests | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](harvests, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPMeta *)self->_meta hash];
  return [(NSMutableArray *)self->_harvests hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  meta = self->_meta;
  uint64_t v6 = *((void *)v4 + 2);
  if (meta)
  {
    if (v6) {
      -[CLPMeta mergeFrom:](meta, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLPPoiCollectionRequest setMeta:](self, "setMeta:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CLPPoiCollectionRequest addHarvests:](self, "addHarvests:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

- (NSMutableArray)harvests
{
  return self->_harvests;
}

- (void)setHarvests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meta, 0);

  objc_storeStrong((id *)&self->_harvests, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPoiCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 30490, "self->_meta != nil");
}

@end