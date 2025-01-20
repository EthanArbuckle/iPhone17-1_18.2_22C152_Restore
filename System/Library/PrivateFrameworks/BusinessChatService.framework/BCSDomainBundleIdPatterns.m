@interface BCSDomainBundleIdPatterns
+ (Class)bundleIdPatternsType;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bundleIdPatterns;
- (NSString)domain;
- (id)bundleIdPatternsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bundleIdPatternsCount;
- (unint64_t)hash;
- (void)addBundleIdPatterns:(id)a3;
- (void)clearBundleIdPatterns;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdPatterns:(id)a3;
- (void)setDomain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSDomainBundleIdPatterns

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)clearBundleIdPatterns
{
}

- (void)addBundleIdPatterns:(id)a3
{
  id v4 = a3;
  bundleIdPatterns = self->_bundleIdPatterns;
  id v8 = v4;
  if (!bundleIdPatterns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_bundleIdPatterns;
    self->_bundleIdPatterns = v6;

    id v4 = v8;
    bundleIdPatterns = self->_bundleIdPatterns;
  }
  [(NSMutableArray *)bundleIdPatterns addObject:v4];
}

- (unint64_t)bundleIdPatternsCount
{
  return [(NSMutableArray *)self->_bundleIdPatterns count];
}

- (id)bundleIdPatternsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bundleIdPatterns objectAtIndex:a3];
}

+ (Class)bundleIdPatternsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSDomainBundleIdPatterns;
  id v4 = [(BCSDomainBundleIdPatterns *)&v8 description];
  v5 = [(BCSDomainBundleIdPatterns *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if ([(NSMutableArray *)self->_bundleIdPatterns count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_bundleIdPatterns, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_bundleIdPatterns;
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

    [v4 setObject:v6 forKey:@"bundle_id_patterns"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  v5 = (int *)MEMORY[0x263F62288];
  v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v8 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      if ((v11 >> 3) == 2) {
        break;
      }
      if ((v11 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        domain = (BCSBundleIdPatterns *)self->_domain;
        self->_domain = v18;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    domain = objc_alloc_init(BCSBundleIdPatterns);
    [(BCSDomainBundleIdPatterns *)self addBundleIdPatterns:domain];
    if (!PBReaderPlaceMark() || !BCSBundleIdPatternsReadFrom(domain, (uint64_t)a3))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_bundleIdPatterns;
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
  if (self->_domain) {
    objc_msgSend(v8, "setDomain:");
  }
  if ([(BCSDomainBundleIdPatterns *)self bundleIdPatternsCount])
  {
    [v8 clearBundleIdPatterns];
    unint64_t v4 = [(BCSDomainBundleIdPatterns *)self bundleIdPatternsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BCSDomainBundleIdPatterns *)self bundleIdPatternsAtIndex:i];
        [v8 addBundleIdPatterns:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_bundleIdPatterns;
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
        [v5 addBundleIdPatterns:v13];

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
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:")))
  {
    bundleIdPatterns = self->_bundleIdPatterns;
    if ((unint64_t)bundleIdPatterns | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](bundleIdPatterns, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_domain hash];
  return [(NSMutableArray *)self->_bundleIdPatterns hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[BCSDomainBundleIdPatterns setDomain:](self, "setDomain:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[BCSDomainBundleIdPatterns addBundleIdPatterns:](self, "addBundleIdPatterns:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSMutableArray)bundleIdPatterns
{
  return self->_bundleIdPatterns;
}

- (void)setBundleIdPatterns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_bundleIdPatterns, 0);
}

@end