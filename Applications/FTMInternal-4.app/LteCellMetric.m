@interface LteCellMetric
+ (Class)cellType;
- (BOOL)hasActivatedMetric;
- (BOOL)hasConfiguredMetric;
- (BOOL)hasEvent;
- (BOOL)hasTotalMetric;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CellMetric)activatedMetric;
- (CellMetric)configuredMetric;
- (CellMetric)totalMetric;
- (NSMutableArray)cells;
- (id)cellAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)cellsCount;
- (unint64_t)hash;
- (unsigned)event;
- (void)addCell:(id)a3;
- (void)clearCells;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivatedMetric:(id)a3;
- (void)setCells:(id)a3;
- (void)setConfiguredMetric:(id)a3;
- (void)setEvent:(unsigned int)a3;
- (void)setHasEvent:(BOOL)a3;
- (void)setTotalMetric:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LteCellMetric

- (void)setEvent:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_event = a3;
}

- (void)setHasEvent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEvent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearCells
{
}

- (void)addCell:(id)a3
{
  id v4 = a3;
  cells = self->_cells;
  id v8 = v4;
  if (!cells)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_cells;
    self->_cells = v6;

    id v4 = v8;
    cells = self->_cells;
  }
  [(NSMutableArray *)cells addObject:v4];
}

- (unint64_t)cellsCount
{
  return (unint64_t)[(NSMutableArray *)self->_cells count];
}

- (id)cellAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_cells objectAtIndex:a3];
}

+ (Class)cellType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTotalMetric
{
  return self->_totalMetric != 0;
}

- (BOOL)hasConfiguredMetric
{
  return self->_configuredMetric != 0;
}

- (BOOL)hasActivatedMetric
{
  return self->_activatedMetric != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)LteCellMetric;
  v3 = [(LteCellMetric *)&v7 description];
  id v4 = [(LteCellMetric *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedInt:self->_event];
    [v3 setObject:v4 forKey:@"event"];
  }
  if ([(NSMutableArray *)self->_cells count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_cells, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = self->_cells;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [(*(id *)(*((void *)&v19 + 1) + 8 * i)) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"cell"];
  }
  totalMetric = self->_totalMetric;
  if (totalMetric)
  {
    v13 = [(CellMetric *)totalMetric dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"total_metric"];
  }
  configuredMetric = self->_configuredMetric;
  if (configuredMetric)
  {
    v15 = [(CellMetric *)configuredMetric dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"configured_metric"];
  }
  activatedMetric = self->_activatedMetric;
  if (activatedMetric)
  {
    v17 = [(CellMetric *)activatedMetric dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"activated_metric"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100097224((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_cells;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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

  if (self->_totalMetric) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_configuredMetric) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activatedMetric) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_event;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v10 = v4;
  if ([(LteCellMetric *)self cellsCount])
  {
    [v10 clearCells];
    unint64_t v5 = [(LteCellMetric *)self cellsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(LteCellMetric *)self cellAtIndex:i];
        [v10 addCell:v8];
      }
    }
  }
  if (self->_totalMetric) {
    [v10 setTotalMetric:];
  }
  uint64_t v9 = v10;
  if (self->_configuredMetric)
  {
    [v10 setConfiguredMetric:];
    uint64_t v9 = v10;
  }
  if (self->_activatedMetric)
  {
    [v10 setActivatedMetric:];
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 8) = self->_event;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = self->_cells;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v11) copyWithZone:a3];
        [v6 addCell:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  id v13 = [(CellMetric *)self->_totalMetric copyWithZone:a3];
  v14 = (void *)v6[5];
  v6[5] = v13;

  id v15 = [(CellMetric *)self->_configuredMetric copyWithZone:a3];
  v16 = (void *)v6[3];
  v6[3] = v15;

  id v17 = [(CellMetric *)self->_activatedMetric copyWithZone:a3];
  v18 = (void *)v6[1];
  v6[1] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_event != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  cells = self->_cells;
  if ((unint64_t)cells | *((void *)v4 + 2) && !-[NSMutableArray isEqual:](cells, "isEqual:")) {
    goto LABEL_15;
  }
  totalMetric = self->_totalMetric;
  if ((unint64_t)totalMetric | *((void *)v4 + 5))
  {
    if (!-[CellMetric isEqual:](totalMetric, "isEqual:")) {
      goto LABEL_15;
    }
  }
  configuredMetric = self->_configuredMetric;
  if ((unint64_t)configuredMetric | *((void *)v4 + 3))
  {
    if (!-[CellMetric isEqual:](configuredMetric, "isEqual:")) {
      goto LABEL_15;
    }
  }
  activatedMetric = self->_activatedMetric;
  if ((unint64_t)activatedMetric | *((void *)v4 + 1)) {
    unsigned __int8 v9 = -[CellMetric isEqual:](activatedMetric, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_event;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_cells hash] ^ v3;
  unint64_t v5 = [(CellMetric *)self->_totalMetric hash];
  unint64_t v6 = v4 ^ v5 ^ [(CellMetric *)self->_configuredMetric hash];
  return v6 ^ [(CellMetric *)self->_activatedMetric hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 48))
  {
    self->_event = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = *((id *)v4 + 2);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        -[LteCellMetric addCell:](self, "addCell:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  totalMetric = self->_totalMetric;
  uint64_t v12 = v5[5];
  if (totalMetric)
  {
    if (v12) {
      -[CellMetric mergeFrom:](totalMetric, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[LteCellMetric setTotalMetric:](self, "setTotalMetric:");
  }
  configuredMetric = self->_configuredMetric;
  uint64_t v14 = v5[3];
  if (configuredMetric)
  {
    if (v14) {
      -[CellMetric mergeFrom:](configuredMetric, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[LteCellMetric setConfiguredMetric:](self, "setConfiguredMetric:");
  }
  activatedMetric = self->_activatedMetric;
  uint64_t v16 = v5[1];
  if (activatedMetric)
  {
    if (v16) {
      -[CellMetric mergeFrom:](activatedMetric, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[LteCellMetric setActivatedMetric:](self, "setActivatedMetric:");
  }
}

- (unsigned)event
{
  return self->_event;
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
}

- (CellMetric)totalMetric
{
  return self->_totalMetric;
}

- (void)setTotalMetric:(id)a3
{
}

- (CellMetric)configuredMetric
{
  return self->_configuredMetric;
}

- (void)setConfiguredMetric:(id)a3
{
}

- (CellMetric)activatedMetric
{
  return self->_activatedMetric;
}

- (void)setActivatedMetric:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalMetric, 0);
  objc_storeStrong((id *)&self->_configuredMetric, 0);
  objc_storeStrong((id *)&self->_cells, 0);

  objc_storeStrong((id *)&self->_activatedMetric, 0);
}

@end