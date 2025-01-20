@interface _ADPBDeviceStringKeyValueDictionary
+ (Class)pairsType;
+ (id)_ad_keyValueDictionaryWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pairs;
- (id)_ad_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pairsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pairsCount;
- (void)addPairs:(id)a3;
- (void)clearPairs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPairs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceStringKeyValueDictionary

- (void).cxx_destruct
{
}

- (void)setPairs:(id)a3
{
}

- (NSMutableArray)pairs
{
  return self->_pairs;
}

- (void)mergeFrom:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[_ADPBDeviceStringKeyValueDictionary addPairs:](self, "addPairs:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_pairs hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    pairs = self->_pairs;
    if ((unint64_t)pairs | v4[1]) {
      unsigned __int8 v6 = -[NSMutableArray isEqual:](pairs, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int8 v6 = self->_pairs;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v13);
        [v5 addPairs:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(_ADPBDeviceStringKeyValueDictionary *)self pairsCount])
  {
    [v8 clearPairs];
    unint64_t v4 = [(_ADPBDeviceStringKeyValueDictionary *)self pairsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(_ADPBDeviceStringKeyValueDictionary *)self pairsAtIndex:i];
        [v8 addPairs:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_pairs;
  unsigned __int8 v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
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
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_10034E7D4(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_pairs count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_pairs, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unint64_t v5 = self->_pairs;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"pairs"];
  }
  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBDeviceStringKeyValueDictionary;
  v3 = [(_ADPBDeviceStringKeyValueDictionary *)&v7 description];
  id v4 = [(_ADPBDeviceStringKeyValueDictionary *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)pairsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_pairs objectAtIndex:a3];
}

- (unint64_t)pairsCount
{
  return (unint64_t)[(NSMutableArray *)self->_pairs count];
}

- (void)addPairs:(id)a3
{
  id v4 = a3;
  pairs = self->_pairs;
  id v8 = v4;
  if (!pairs)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_pairs;
    self->_pairs = v6;

    id v4 = v8;
    pairs = self->_pairs;
  }
  [(NSMutableArray *)pairs addObject:v4];
}

- (void)clearPairs
{
}

+ (Class)pairsType
{
  return (Class)objc_opt_class();
}

- (id)_ad_dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(_ADPBDeviceStringKeyValueDictionary *)self pairs];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 value];
        if (v10)
        {
          long long v11 = (void *)v10;
          long long v12 = [v9 key];

          if (v12)
          {
            long long v13 = [v9 value];
            long long v14 = [v9 key];
            [v3 setValue:v13 forKey:v14];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  id v15 = [v3 copy];
  return v15;
}

+ (id)_ad_keyValueDictionaryWithDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(_ADPBDeviceStringKeyValueDictionary);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          long long v11 = objc_alloc_init(_ADPBDeviceStringKeyValuePair);
          -[_ADPBDeviceStringKeyValuePair setKey:](v11, "setKey:", v10, (void)v14);
          long long v12 = [v5 objectForKey:v10];
          [(_ADPBDeviceStringKeyValuePair *)v11 setValue:v12];

          [(_ADPBDeviceStringKeyValueDictionary *)v4 addPairs:v11];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end