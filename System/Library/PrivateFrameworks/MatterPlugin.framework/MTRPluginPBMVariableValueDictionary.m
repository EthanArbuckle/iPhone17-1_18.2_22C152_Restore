@interface MTRPluginPBMVariableValueDictionary
+ (Class)pairType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMVariableValueDictionary)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (NSMutableArray)pairs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pairAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pairsCount;
- (void)addPair:(id)a3;
- (void)clearPairs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setPairs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMVariableValueDictionary

- (void)clearPairs
{
}

- (void)addPair:(id)a3
{
  id v4 = a3;
  pairs = self->_pairs;
  id v8 = v4;
  if (!pairs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_pairs;
    self->_pairs = v6;

    id v4 = v8;
    pairs = self->_pairs;
  }
  [(NSMutableArray *)pairs addObject:v4];
}

- (unint64_t)pairsCount
{
  return [(NSMutableArray *)self->_pairs count];
}

- (id)pairAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pairs objectAtIndex:a3];
}

+ (Class)pairType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMVariableValueDictionary;
  id v4 = [(MTRPluginPBMVariableValueDictionary *)&v8 description];
  v5 = [(MTRPluginPBMVariableValueDictionary *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_pairs count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_pairs, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_pairs;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"pair"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMVariableValueDictionaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_pairs;
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
  if ([(MTRPluginPBMVariableValueDictionary *)self pairsCount])
  {
    [v8 clearPairs];
    unint64_t v4 = [(MTRPluginPBMVariableValueDictionary *)self pairsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MTRPluginPBMVariableValueDictionary *)self pairAtIndex:i];
        [v8 addPair:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_pairs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addPair:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    pairs = self->_pairs;
    if ((unint64_t)pairs | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](pairs, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_pairs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[MTRPluginPBMVariableValueDictionary addPair:](self, "addPair:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)pairs
{
  return self->_pairs;
}

- (void)setPairs:(id)a3
{
}

- (void).cxx_destruct
{
}

- (MTRPluginPBMVariableValueDictionary)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTRPluginPBMVariableValueDictionary *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    if (!v4
      || ([(MTRPluginPBMVariableValueDictionary *)v5 setDictionary:v4],
          [(MTRPluginPBMVariableValueDictionary *)v6 pairs],
          uint64_t v7 = (MTRPluginPBMVariableValueDictionary *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      uint64_t v7 = v6;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)setDictionary:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  uint64_t v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__MTRPluginPBMVariableValueDictionary_Helpers__setDictionary___block_invoke;
  v8[3] = &unk_2653E6B80;
  id v9 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  [(MTRPluginPBMVariableValueDictionary *)self setPairs:v7];
}

void __62__MTRPluginPBMVariableValueDictionary_Helpers__setDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v8 = [[MTRPluginPBMVariableKeyValuePair alloc] initWithObjectValue:v5 forKey:v6];

  id v7 = v8;
  if (v8)
  {
    [*(id *)(a1 + 32) addObject:v8];
    id v7 = v8;
  }
}

- (NSDictionary)dictionary
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[MTRPluginPBMVariableValueDictionary pairsCount](self, "pairsCount"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(MTRPluginPBMVariableValueDictionary *)self pairs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [v9 value];
        long long v11 = [v10 object];
        long long v12 = [v9 key];
        [v3 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

@end