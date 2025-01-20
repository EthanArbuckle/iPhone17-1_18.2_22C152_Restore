@interface KCellularLteNbrInterRatCellMeas
+ (Class)measNbrGeranType;
+ (Class)measNbrUtraType;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)measNbrGerans;
- (NSMutableArray)measNbrUtras;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)measNbrGeranAtIndex:(unint64_t)a3;
- (id)measNbrUtraAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)measNbrGeransCount;
- (unint64_t)measNbrUtrasCount;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)addMeasNbrGeran:(id)a3;
- (void)addMeasNbrUtra:(id)a3;
- (void)clearMeasNbrGerans;
- (void)clearMeasNbrUtras;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMeasNbrGerans:(id)a3;
- (void)setMeasNbrUtras:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteNbrInterRatCellMeas

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearMeasNbrUtras
{
}

- (void)addMeasNbrUtra:(id)a3
{
  id v4 = a3;
  measNbrUtras = self->_measNbrUtras;
  id v8 = v4;
  if (!measNbrUtras)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_measNbrUtras;
    self->_measNbrUtras = v6;

    id v4 = v8;
    measNbrUtras = self->_measNbrUtras;
  }
  [(NSMutableArray *)measNbrUtras addObject:v4];
}

- (unint64_t)measNbrUtrasCount
{
  return (unint64_t)[(NSMutableArray *)self->_measNbrUtras count];
}

- (id)measNbrUtraAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_measNbrUtras objectAtIndex:a3];
}

+ (Class)measNbrUtraType
{
  return (Class)objc_opt_class();
}

- (void)clearMeasNbrGerans
{
}

- (void)addMeasNbrGeran:(id)a3
{
  id v4 = a3;
  measNbrGerans = self->_measNbrGerans;
  id v8 = v4;
  if (!measNbrGerans)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_measNbrGerans;
    self->_measNbrGerans = v6;

    id v4 = v8;
    measNbrGerans = self->_measNbrGerans;
  }
  [(NSMutableArray *)measNbrGerans addObject:v4];
}

- (unint64_t)measNbrGeransCount
{
  return (unint64_t)[(NSMutableArray *)self->_measNbrGerans count];
}

- (id)measNbrGeranAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_measNbrGerans objectAtIndex:a3];
}

+ (Class)measNbrGeranType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularLteNbrInterRatCellMeas;
  char v3 = [(KCellularLteNbrInterRatCellMeas *)&v7 description];
  id v4 = [(KCellularLteNbrInterRatCellMeas *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_measNbrUtras count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_measNbrUtras, "count")];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v6 = self->_measNbrUtras;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"meas_nbr_utra"];
  }
  if ([(NSMutableArray *)self->_measNbrGerans count])
  {
    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_measNbrGerans, "count")];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = self->_measNbrGerans;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"meas_nbr_geran"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v19 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v19 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10011D7FC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_measNbrUtras;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_measNbrGerans;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      id v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v13 = v4;
  if ([(KCellularLteNbrInterRatCellMeas *)self measNbrUtrasCount])
  {
    [v13 clearMeasNbrUtras];
    unint64_t v5 = [(KCellularLteNbrInterRatCellMeas *)self measNbrUtrasCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(KCellularLteNbrInterRatCellMeas *)self measNbrUtraAtIndex:i];
        [v13 addMeasNbrUtra:v8];
      }
    }
  }
  if ([(KCellularLteNbrInterRatCellMeas *)self measNbrGeransCount])
  {
    [v13 clearMeasNbrGerans];
    unint64_t v9 = [(KCellularLteNbrInterRatCellMeas *)self measNbrGeransCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        id v12 = [(KCellularLteNbrInterRatCellMeas *)self measNbrGeranAtIndex:j];
        [v13 addMeasNbrGeran:v12];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v13 + 8) = self->_subsId;
    *((unsigned char *)v13 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = self->_measNbrUtras;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v11) copyWithZone:a3];
        [v6 addMeasNbrUtra:v12];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = self->_measNbrGerans;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      long long v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v17) copyWithZone:a3];
        [v6 addMeasNbrGeran:v18];

        long long v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_subsId;
    *((unsigned char *)v6 + 36) |= 2u;
  }
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
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  measNbrUtras = self->_measNbrUtras;
  if ((unint64_t)measNbrUtras | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](measNbrUtras, "isEqual:"))
  {
    goto LABEL_15;
  }
  measNbrGerans = self->_measNbrGerans;
  if ((unint64_t)measNbrGerans | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](measNbrGerans, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_measNbrUtras hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_measNbrGerans hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 36))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v4 + 3);
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(KCellularLteNbrInterRatCellMeas *)self addMeasNbrUtra:*(void *)(*((void *)&v20 + 1) + 8 * (void)v10)];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 2);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[KCellularLteNbrInterRatCellMeas addMeasNbrGeran:](self, "addMeasNbrGeran:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v15), (void)v16);
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if ((*((unsigned char *)v5 + 36) & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)measNbrUtras
{
  return self->_measNbrUtras;
}

- (void)setMeasNbrUtras:(id)a3
{
}

- (NSMutableArray)measNbrGerans
{
  return self->_measNbrGerans;
}

- (void)setMeasNbrGerans:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measNbrUtras, 0);

  objc_storeStrong((id *)&self->_measNbrGerans, 0);
}

@end