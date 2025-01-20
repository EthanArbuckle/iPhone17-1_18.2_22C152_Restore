@interface ACHCodableEarnedInstanceArray
+ (Class)earnedInstancesType;
- (ACHCodableEarnedInstanceArray)initWithCodableEarnedInstances:(id)a3;
- (ACHCodableEarnedInstanceArray)initWithSerializedData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)earnedInstances;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)earnedInstancesAtIndex:(unint64_t)a3;
- (unint64_t)earnedInstancesCount;
- (unint64_t)hash;
- (void)addEarnedInstances:(id)a3;
- (void)clearEarnedInstances;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEarnedInstances:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACHCodableEarnedInstanceArray

- (ACHCodableEarnedInstanceArray)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[ACHCodableEarnedInstanceArray alloc] initWithData:v5];

  return v6;
}

- (ACHCodableEarnedInstanceArray)initWithCodableEarnedInstances:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ACHCodableEarnedInstanceArray);
  v6 = (void *)[v4 mutableCopy];

  [(ACHCodableEarnedInstanceArray *)v5 setEarnedInstances:v6];
  return v5;
}

- (void)clearEarnedInstances
{
}

- (void)addEarnedInstances:(id)a3
{
  id v4 = a3;
  earnedInstances = self->_earnedInstances;
  id v8 = v4;
  if (!earnedInstances)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_earnedInstances;
    self->_earnedInstances = v6;

    id v4 = v8;
    earnedInstances = self->_earnedInstances;
  }
  [(NSMutableArray *)earnedInstances addObject:v4];
}

- (unint64_t)earnedInstancesCount
{
  return [(NSMutableArray *)self->_earnedInstances count];
}

- (id)earnedInstancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_earnedInstances objectAtIndex:a3];
}

+ (Class)earnedInstancesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACHCodableEarnedInstanceArray;
  id v4 = [(ACHCodableEarnedInstanceArray *)&v8 description];
  id v5 = [(ACHCodableEarnedInstanceArray *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_earnedInstances count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_earnedInstances, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_earnedInstances;
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

    [v3 setObject:v4 forKey:@"earnedInstances"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableEarnedInstanceArrayReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_earnedInstances;
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
  if ([(ACHCodableEarnedInstanceArray *)self earnedInstancesCount])
  {
    [v8 clearEarnedInstances];
    unint64_t v4 = [(ACHCodableEarnedInstanceArray *)self earnedInstancesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ACHCodableEarnedInstanceArray *)self earnedInstancesAtIndex:i];
        [v8 addEarnedInstances:v7];
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
  uint64_t v6 = self->_earnedInstances;
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
        [v5 addEarnedInstances:v11];

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
    earnedInstances = self->_earnedInstances;
    if ((unint64_t)earnedInstances | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](earnedInstances, "isEqual:");
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
  return [(NSMutableArray *)self->_earnedInstances hash];
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
        -[ACHCodableEarnedInstanceArray addEarnedInstances:](self, "addEarnedInstances:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)earnedInstances
{
  return self->_earnedInstances;
}

- (void)setEarnedInstances:(id)a3
{
}

- (void).cxx_destruct
{
}

@end