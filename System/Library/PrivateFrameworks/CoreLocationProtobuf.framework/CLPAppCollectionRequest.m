@interface CLPAppCollectionRequest
+ (Class)appLocationType;
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPMeta)meta;
- (Class)responseClass;
- (NSData)signature;
- (NSMutableArray)appLocations;
- (id)appLocationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)appLocationsCount;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)addAppLocation:(id)a3;
- (void)clearAppLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppLocations:(id)a3;
- (void)setMeta:(id)a3;
- (void)setSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPAppCollectionRequest

- (void)clearAppLocations
{
}

- (void)addAppLocation:(id)a3
{
  id v4 = a3;
  appLocations = self->_appLocations;
  id v8 = v4;
  if (!appLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_appLocations;
    self->_appLocations = v6;

    id v4 = v8;
    appLocations = self->_appLocations;
  }
  [(NSMutableArray *)appLocations addObject:v4];
}

- (unint64_t)appLocationsCount
{
  return [(NSMutableArray *)self->_appLocations count];
}

- (id)appLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appLocations objectAtIndex:a3];
}

+ (Class)appLocationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPAppCollectionRequest;
  id v4 = [(CLPAppCollectionRequest *)&v8 description];
  v5 = [(CLPAppCollectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  meta = self->_meta;
  if (meta)
  {
    v5 = [(CLPMeta *)meta dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"meta"];
  }
  if ([(NSMutableArray *)self->_appLocations count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_appLocations, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = self->_appLocations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"appLocation"];
  }
  signature = self->_signature;
  if (signature) {
    [v3 setObject:signature forKey:@"signature"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPAppCollectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_meta) {
    -[CLPAppCollectionRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_appLocations;
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

  if (self->_signature) {
    PBDataWriterWriteDataField();
  }
}

- (unsigned)requestTypeCode
{
  return 102;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setMeta:self->_meta];
  if ([(CLPAppCollectionRequest *)self appLocationsCount])
  {
    [v8 clearAppLocations];
    unint64_t v4 = [(CLPAppCollectionRequest *)self appLocationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPAppCollectionRequest *)self appLocationAtIndex:i];
        [v8 addAppLocation:v7];
      }
    }
  }
  if (self->_signature) {
    objc_msgSend(v8, "setSignature:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPMeta *)self->_meta copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_appLocations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [v5 addAppLocation:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_signature copyWithZone:a3];
  long long v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((meta = self->_meta, !((unint64_t)meta | v4[2])) || -[CLPMeta isEqual:](meta, "isEqual:"))
    && ((appLocations = self->_appLocations, !((unint64_t)appLocations | v4[1]))
     || -[NSMutableArray isEqual:](appLocations, "isEqual:")))
  {
    signature = self->_signature;
    if ((unint64_t)signature | v4[3]) {
      char v8 = -[NSData isEqual:](signature, "isEqual:");
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
  unint64_t v3 = [(CLPMeta *)self->_meta hash];
  uint64_t v4 = [(NSMutableArray *)self->_appLocations hash] ^ v3;
  return v4 ^ [(NSData *)self->_signature hash];
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
    -[CLPAppCollectionRequest setMeta:](self, "setMeta:");
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
        -[CLPAppCollectionRequest addAppLocation:](self, "addAppLocation:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 3)) {
    -[CLPAppCollectionRequest setSignature:](self, "setSignature:");
  }
}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

- (NSMutableArray)appLocations
{
  return self->_appLocations;
}

- (void)setAppLocations:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_meta, 0);

  objc_storeStrong((id *)&self->_appLocations, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPAppCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 987, "self->_meta != nil");
}

@end