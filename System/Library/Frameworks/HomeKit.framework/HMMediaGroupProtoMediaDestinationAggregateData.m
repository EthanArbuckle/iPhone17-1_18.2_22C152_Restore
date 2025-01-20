@interface HMMediaGroupProtoMediaDestinationAggregateData
+ (Class)destinationControllerDataType;
+ (Class)destinationType;
+ (Class)groupType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)destinationControllerDatas;
- (NSMutableArray)destinations;
- (NSMutableArray)groups;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationAtIndex:(unint64_t)a3;
- (id)destinationControllerDataAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)groupAtIndex:(unint64_t)a3;
- (unint64_t)destinationControllerDatasCount;
- (unint64_t)destinationsCount;
- (unint64_t)groupsCount;
- (unint64_t)hash;
- (void)addDestination:(id)a3;
- (void)addDestinationControllerData:(id)a3;
- (void)addGroup:(id)a3;
- (void)clearDestinationControllerDatas;
- (void)clearDestinations;
- (void)clearGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestinationControllerDatas:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setGroups:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMMediaGroupProtoMediaDestinationAggregateData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_destinations, 0);

  objc_storeStrong((id *)&self->_destinationControllerDatas, 0);
}

- (void)setGroups:(id)a3
{
}

- (NSMutableArray)groups
{
  return self->_groups;
}

- (void)setDestinationControllerDatas:(id)a3
{
}

- (NSMutableArray)destinationControllerDatas
{
  return self->_destinationControllerDatas;
}

- (void)setDestinations:(id)a3
{
}

- (NSMutableArray)destinations
{
  return self->_destinations;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HMMediaGroupProtoMediaDestinationAggregateData *)self addDestination:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(HMMediaGroupProtoMediaDestinationAggregateData *)self addDestinationControllerData:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[HMMediaGroupProtoMediaDestinationAggregateData addGroup:](self, "addGroup:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_destinations hash];
  uint64_t v4 = [(NSMutableArray *)self->_destinationControllerDatas hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_groups hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((destinations = self->_destinations, !((unint64_t)destinations | v4[2]))
     || -[NSMutableArray isEqual:](destinations, "isEqual:"))
    && ((destinationControllerDatas = self->_destinationControllerDatas,
         !((unint64_t)destinationControllerDatas | v4[1]))
     || -[NSMutableArray isEqual:](destinationControllerDatas, "isEqual:")))
  {
    groups = self->_groups;
    if ((unint64_t)groups | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](groups, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = self->_destinations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addDestination:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = self->_destinationControllerDatas;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addDestinationControllerData:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_groups;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addGroup:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if ([(HMMediaGroupProtoMediaDestinationAggregateData *)self destinationsCount])
  {
    [v16 clearDestinations];
    unint64_t v4 = [(HMMediaGroupProtoMediaDestinationAggregateData *)self destinationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMMediaGroupProtoMediaDestinationAggregateData *)self destinationAtIndex:i];
        [v16 addDestination:v7];
      }
    }
  }
  if ([(HMMediaGroupProtoMediaDestinationAggregateData *)self destinationControllerDatasCount])
  {
    [v16 clearDestinationControllerDatas];
    unint64_t v8 = [(HMMediaGroupProtoMediaDestinationAggregateData *)self destinationControllerDatasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HMMediaGroupProtoMediaDestinationAggregateData *)self destinationControllerDataAtIndex:j];
        [v16 addDestinationControllerData:v11];
      }
    }
  }
  if ([(HMMediaGroupProtoMediaDestinationAggregateData *)self groupsCount])
  {
    [v16 clearGroups];
    unint64_t v12 = [(HMMediaGroupProtoMediaDestinationAggregateData *)self groupsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(HMMediaGroupProtoMediaDestinationAggregateData *)self groupAtIndex:k];
        [v16 addGroup:v15];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v5 = self->_destinations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_destinationControllerDatas;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_groups;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaDestinationAggregateDataReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_destinations count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_destinations, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    unint64_t v5 = self->_destinations;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"destination"];
  }
  if ([(NSMutableArray *)self->_destinationControllerDatas count])
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_destinationControllerDatas, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v12 = self->_destinationControllerDatas;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v30 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"destinationControllerData"];
  }
  if ([(NSMutableArray *)self->_groups count])
  {
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_groups, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v19 = self->_groups;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "dictionaryRepresentation", (void)v26);
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"group"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaDestinationAggregateData;
  id v4 = [(HMMediaGroupProtoMediaDestinationAggregateData *)&v8 description];
  unint64_t v5 = [(HMMediaGroupProtoMediaDestinationAggregateData *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)groupAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_groups objectAtIndex:a3];
}

- (unint64_t)groupsCount
{
  return [(NSMutableArray *)self->_groups count];
}

- (void)addGroup:(id)a3
{
  id v4 = a3;
  groups = self->_groups;
  id v8 = v4;
  if (!groups)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_groups;
    self->_groups = v6;

    id v4 = v8;
    groups = self->_groups;
  }
  [(NSMutableArray *)groups addObject:v4];
}

- (void)clearGroups
{
}

- (id)destinationControllerDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_destinationControllerDatas objectAtIndex:a3];
}

- (unint64_t)destinationControllerDatasCount
{
  return [(NSMutableArray *)self->_destinationControllerDatas count];
}

- (void)addDestinationControllerData:(id)a3
{
  id v4 = a3;
  destinationControllerDatas = self->_destinationControllerDatas;
  id v8 = v4;
  if (!destinationControllerDatas)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_destinationControllerDatas;
    self->_destinationControllerDatas = v6;

    id v4 = v8;
    destinationControllerDatas = self->_destinationControllerDatas;
  }
  [(NSMutableArray *)destinationControllerDatas addObject:v4];
}

- (void)clearDestinationControllerDatas
{
}

- (id)destinationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_destinations objectAtIndex:a3];
}

- (unint64_t)destinationsCount
{
  return [(NSMutableArray *)self->_destinations count];
}

- (void)addDestination:(id)a3
{
  id v4 = a3;
  destinations = self->_destinations;
  id v8 = v4;
  if (!destinations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_destinations;
    self->_destinations = v6;

    id v4 = v8;
    destinations = self->_destinations;
  }
  [(NSMutableArray *)destinations addObject:v4];
}

- (void)clearDestinations
{
}

+ (Class)groupType
{
  return (Class)objc_opt_class();
}

+ (Class)destinationControllerDataType
{
  return (Class)objc_opt_class();
}

+ (Class)destinationType
{
  return (Class)objc_opt_class();
}

@end