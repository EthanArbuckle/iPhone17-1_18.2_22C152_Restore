@interface CLPWtwCollectionRequest
+ (Class)wtwLocationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPMeta)meta;
- (Class)responseClass;
- (NSMutableArray)wtwLocations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)wtwLocationAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)wtwLocationsCount;
- (unsigned)requestTypeCode;
- (void)addWtwLocation:(id)a3;
- (void)clearWtwLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMeta:(id)a3;
- (void)setWtwLocations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPWtwCollectionRequest

- (void)clearWtwLocations
{
}

- (void)addWtwLocation:(id)a3
{
  id v4 = a3;
  wtwLocations = self->_wtwLocations;
  id v8 = v4;
  if (!wtwLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_wtwLocations;
    self->_wtwLocations = v6;

    id v4 = v8;
    wtwLocations = self->_wtwLocations;
  }
  [(NSMutableArray *)wtwLocations addObject:v4];
}

- (unint64_t)wtwLocationsCount
{
  return [(NSMutableArray *)self->_wtwLocations count];
}

- (id)wtwLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_wtwLocations objectAtIndex:a3];
}

+ (Class)wtwLocationType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPWtwCollectionRequest;
  id v4 = [(CLPWtwCollectionRequest *)&v8 description];
  v5 = [(CLPWtwCollectionRequest *)self dictionaryRepresentation];
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
  if ([(NSMutableArray *)self->_wtwLocations count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_wtwLocations, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_wtwLocations;
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

    [v3 setObject:v6 forKey:@"wtwLocation"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPWtwCollectionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_meta) {
    -[CLPWtwCollectionRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_wtwLocations;
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
  return 104;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setMeta:self->_meta];
  if ([(CLPWtwCollectionRequest *)self wtwLocationsCount])
  {
    [v8 clearWtwLocations];
    unint64_t v4 = [(CLPWtwCollectionRequest *)self wtwLocationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPWtwCollectionRequest *)self wtwLocationAtIndex:i];
        [v8 addWtwLocation:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPMeta *)self->_meta copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_wtwLocations;
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
        [v5 addWtwLocation:v13];

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
    && ((meta = self->_meta, !((unint64_t)meta | v4[1])) || -[CLPMeta isEqual:](meta, "isEqual:")))
  {
    wtwLocations = self->_wtwLocations;
    if ((unint64_t)wtwLocations | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](wtwLocations, "isEqual:");
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
  return [(NSMutableArray *)self->_wtwLocations hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  meta = self->_meta;
  uint64_t v6 = *((void *)v4 + 1);
  if (meta)
  {
    if (v6) {
      -[CLPMeta mergeFrom:](meta, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLPWtwCollectionRequest setMeta:](self, "setMeta:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
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
        -[CLPWtwCollectionRequest addWtwLocation:](self, "addWtwLocation:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

- (NSMutableArray)wtwLocations
{
  return self->_wtwLocations;
}

- (void)setWtwLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wtwLocations, 0);

  objc_storeStrong((id *)&self->_meta, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPWtwCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 35805, "self->_meta != nil");
}

@end