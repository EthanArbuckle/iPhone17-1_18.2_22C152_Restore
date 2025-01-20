@interface SPProtoSockPuppetPlist
+ (Class)objectType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)objects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)objectsCount;
- (void)addObject:(id)a3;
- (void)clearObjects;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setObjects:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoSockPuppetPlist

- (void)clearObjects
{
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  objects = self->_objects;
  id v8 = v4;
  if (!objects)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_objects;
    self->_objects = v6;

    id v4 = v8;
    objects = self->_objects;
  }
  [(NSMutableArray *)objects addObject:v4];
}

- (unint64_t)objectsCount
{
  return (unint64_t)[(NSMutableArray *)self->_objects count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_objects objectAtIndex:a3];
}

+ (Class)objectType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SPProtoSockPuppetPlist;
  v3 = [(SPProtoSockPuppetPlist *)&v7 description];
  id v4 = [(SPProtoSockPuppetPlist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_objects count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_objects, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_objects;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"object"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoSockPuppetPlistReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_objects;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
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

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(SPProtoSockPuppetPlist *)self objectsCount])
  {
    [v8 clearObjects];
    unint64_t v4 = [(SPProtoSockPuppetPlist *)self objectsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(SPProtoSockPuppetPlist *)self objectAtIndex:i];
        [v8 addObject:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_objects;
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
        [v5 addObject:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    objects = self->_objects;
    if ((unint64_t)objects | v4[1]) {
      unsigned __int8 v6 = -[NSMutableArray isEqual:](objects, "isEqual:");
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

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_objects hash];
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
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SPProtoSockPuppetPlist addObject:](self, "addObject:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end