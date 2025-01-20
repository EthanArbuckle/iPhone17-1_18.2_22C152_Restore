@interface CLPPoiHarvest
+ (Class)accessPointsType;
+ (Class)locationsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPPoiTriggerEvent)triggerEvent;
- (NSMutableArray)accessPoints;
- (NSMutableArray)locations;
- (id)accessPointsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationsAtIndex:(unint64_t)a3;
- (unint64_t)accessPointsCount;
- (unint64_t)hash;
- (unint64_t)locationsCount;
- (void)addAccessPoints:(id)a3;
- (void)addLocations:(id)a3;
- (void)clearAccessPoints;
- (void)clearLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessPoints:(id)a3;
- (void)setLocations:(id)a3;
- (void)setTriggerEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPoiHarvest

- (void)clearLocations
{
}

- (void)addLocations:(id)a3
{
  id v4 = a3;
  locations = self->_locations;
  id v8 = v4;
  if (!locations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_locations;
    self->_locations = v6;

    id v4 = v8;
    locations = self->_locations;
  }
  [(NSMutableArray *)locations addObject:v4];
}

- (unint64_t)locationsCount
{
  return [(NSMutableArray *)self->_locations count];
}

- (id)locationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_locations objectAtIndex:a3];
}

+ (Class)locationsType
{
  return (Class)objc_opt_class();
}

- (void)clearAccessPoints
{
}

- (void)addAccessPoints:(id)a3
{
  id v4 = a3;
  accessPoints = self->_accessPoints;
  id v8 = v4;
  if (!accessPoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_accessPoints;
    self->_accessPoints = v6;

    id v4 = v8;
    accessPoints = self->_accessPoints;
  }
  [(NSMutableArray *)accessPoints addObject:v4];
}

- (unint64_t)accessPointsCount
{
  return [(NSMutableArray *)self->_accessPoints count];
}

- (id)accessPointsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_accessPoints objectAtIndex:a3];
}

+ (Class)accessPointsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPPoiHarvest;
  id v4 = [(CLPPoiHarvest *)&v8 description];
  v5 = [(CLPPoiHarvest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  triggerEvent = self->_triggerEvent;
  if (triggerEvent)
  {
    v5 = [(CLPPoiTriggerEvent *)triggerEvent dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"triggerEvent"];
  }
  if ([(NSMutableArray *)self->_locations count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v7 = self->_locations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"locations"];
  }
  if ([(NSMutableArray *)self->_accessPoints count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_accessPoints, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_accessPoints;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"accessPoints"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPoiHarvestReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_triggerEvent) {
    -[CLPPoiHarvest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_locations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_accessPoints;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  [v12 setTriggerEvent:self->_triggerEvent];
  if ([(CLPPoiHarvest *)self locationsCount])
  {
    [v12 clearLocations];
    unint64_t v4 = [(CLPPoiHarvest *)self locationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPPoiHarvest *)self locationsAtIndex:i];
        [v12 addLocations:v7];
      }
    }
  }
  if ([(CLPPoiHarvest *)self accessPointsCount])
  {
    [v12 clearAccessPoints];
    unint64_t v8 = [(CLPPoiHarvest *)self accessPointsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(CLPPoiHarvest *)self accessPointsAtIndex:j];
        [v12 addAccessPoints:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPPoiTriggerEvent *)self->_triggerEvent copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_locations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addLocations:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_accessPoints;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addAccessPoints:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((triggerEvent = self->_triggerEvent, !((unint64_t)triggerEvent | v4[3]))
     || -[CLPPoiTriggerEvent isEqual:](triggerEvent, "isEqual:"))
    && ((locations = self->_locations, !((unint64_t)locations | v4[2]))
     || -[NSMutableArray isEqual:](locations, "isEqual:")))
  {
    accessPoints = self->_accessPoints;
    if ((unint64_t)accessPoints | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](accessPoints, "isEqual:");
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
  unint64_t v3 = [(CLPPoiTriggerEvent *)self->_triggerEvent hash];
  uint64_t v4 = [(NSMutableArray *)self->_locations hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_accessPoints hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  triggerEvent = self->_triggerEvent;
  uint64_t v6 = *((void *)v4 + 3);
  if (triggerEvent)
  {
    if (v6) {
      -[CLPPoiTriggerEvent mergeFrom:](triggerEvent, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLPPoiHarvest setTriggerEvent:](self, "setTriggerEvent:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CLPPoiHarvest *)self addLocations:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 1);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[CLPPoiHarvest addAccessPoints:](self, "addAccessPoints:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (CLPPoiTriggerEvent)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(id)a3
{
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerEvent, 0);
  objc_storeStrong((id *)&self->_locations, 0);

  objc_storeStrong((id *)&self->_accessPoints, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPoiHarvest writeTo:]", "CLPCollectionRequest.gen.m", 30899, "self->_triggerEvent != nil");
}

@end