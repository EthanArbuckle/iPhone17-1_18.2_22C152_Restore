@interface BCSBundleIdPatterns
+ (Class)urlPatternsType;
- (BOOL)hasBundleId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)urlPatterns;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)urlPatternsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)urlPatternsCount;
- (void)addUrlPatterns:(id)a3;
- (void)clearUrlPatterns;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setUrlPatterns:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSBundleIdPatterns

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)clearUrlPatterns
{
}

- (void)addUrlPatterns:(id)a3
{
  id v4 = a3;
  urlPatterns = self->_urlPatterns;
  id v8 = v4;
  if (!urlPatterns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_urlPatterns;
    self->_urlPatterns = v6;

    id v4 = v8;
    urlPatterns = self->_urlPatterns;
  }
  [(NSMutableArray *)urlPatterns addObject:v4];
}

- (unint64_t)urlPatternsCount
{
  return [(NSMutableArray *)self->_urlPatterns count];
}

- (id)urlPatternsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_urlPatterns objectAtIndex:a3];
}

+ (Class)urlPatternsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSBundleIdPatterns;
  id v4 = [(BCSBundleIdPatterns *)&v8 description];
  v5 = [(BCSBundleIdPatterns *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundle_id"];
  }
  if ([(NSMutableArray *)self->_urlPatterns count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_urlPatterns, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_urlPatterns;
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

    [v4 setObject:v6 forKey:@"url_patterns"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSBundleIdPatternsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_urlPatterns;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_bundleId) {
    objc_msgSend(v8, "setBundleId:");
  }
  if ([(BCSBundleIdPatterns *)self urlPatternsCount])
  {
    [v8 clearUrlPatterns];
    unint64_t v4 = [(BCSBundleIdPatterns *)self urlPatternsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BCSBundleIdPatterns *)self urlPatternsAtIndex:i];
        [v8 addUrlPatterns:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_urlPatterns;
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
        [v5 addUrlPatterns:v13];

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
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[1]))
     || -[NSString isEqual:](bundleId, "isEqual:")))
  {
    urlPatterns = self->_urlPatterns;
    if ((unint64_t)urlPatterns | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](urlPatterns, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  return [(NSMutableArray *)self->_urlPatterns hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[BCSBundleIdPatterns setBundleId:](self, "setBundleId:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[BCSBundleIdPatterns addUrlPatterns:](self, "addUrlPatterns:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSMutableArray)urlPatterns
{
  return self->_urlPatterns;
}

- (void)setUrlPatterns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlPatterns, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end