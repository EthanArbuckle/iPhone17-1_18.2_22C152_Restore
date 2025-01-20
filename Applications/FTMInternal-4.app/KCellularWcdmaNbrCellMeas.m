@interface KCellularWcdmaNbrCellMeas
+ (Class)measGsmResultType;
+ (Class)measLteResultType;
+ (Class)measUtraResultType;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)measGsmResults;
- (NSMutableArray)measLteResults;
- (NSMutableArray)measUtraResults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)measGsmResultAtIndex:(unint64_t)a3;
- (id)measLteResultAtIndex:(unint64_t)a3;
- (id)measUtraResultAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)measGsmResultsCount;
- (unint64_t)measLteResultsCount;
- (unint64_t)measUtraResultsCount;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)addMeasGsmResult:(id)a3;
- (void)addMeasLteResult:(id)a3;
- (void)addMeasUtraResult:(id)a3;
- (void)clearMeasGsmResults;
- (void)clearMeasLteResults;
- (void)clearMeasUtraResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMeasGsmResults:(id)a3;
- (void)setMeasLteResults:(id)a3;
- (void)setMeasUtraResults:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularWcdmaNbrCellMeas

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

- (void)clearMeasUtraResults
{
}

- (void)addMeasUtraResult:(id)a3
{
  id v4 = a3;
  measUtraResults = self->_measUtraResults;
  id v8 = v4;
  if (!measUtraResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_measUtraResults;
    self->_measUtraResults = v6;

    id v4 = v8;
    measUtraResults = self->_measUtraResults;
  }
  [(NSMutableArray *)measUtraResults addObject:v4];
}

- (unint64_t)measUtraResultsCount
{
  return (unint64_t)[(NSMutableArray *)self->_measUtraResults count];
}

- (id)measUtraResultAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_measUtraResults objectAtIndex:a3];
}

+ (Class)measUtraResultType
{
  return (Class)objc_opt_class();
}

- (void)clearMeasGsmResults
{
}

- (void)addMeasGsmResult:(id)a3
{
  id v4 = a3;
  measGsmResults = self->_measGsmResults;
  id v8 = v4;
  if (!measGsmResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_measGsmResults;
    self->_measGsmResults = v6;

    id v4 = v8;
    measGsmResults = self->_measGsmResults;
  }
  [(NSMutableArray *)measGsmResults addObject:v4];
}

- (unint64_t)measGsmResultsCount
{
  return (unint64_t)[(NSMutableArray *)self->_measGsmResults count];
}

- (id)measGsmResultAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_measGsmResults objectAtIndex:a3];
}

+ (Class)measGsmResultType
{
  return (Class)objc_opt_class();
}

- (void)clearMeasLteResults
{
}

- (void)addMeasLteResult:(id)a3
{
  id v4 = a3;
  measLteResults = self->_measLteResults;
  id v8 = v4;
  if (!measLteResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_measLteResults;
    self->_measLteResults = v6;

    id v4 = v8;
    measLteResults = self->_measLteResults;
  }
  [(NSMutableArray *)measLteResults addObject:v4];
}

- (unint64_t)measLteResultsCount
{
  return (unint64_t)[(NSMutableArray *)self->_measLteResults count];
}

- (id)measLteResultAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_measLteResults objectAtIndex:a3];
}

+ (Class)measLteResultType
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
  v7.super_class = (Class)KCellularWcdmaNbrCellMeas;
  char v3 = [(KCellularWcdmaNbrCellMeas *)&v7 description];
  id v4 = [(KCellularWcdmaNbrCellMeas *)self dictionaryRepresentation];
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
  if ([(NSMutableArray *)self->_measUtraResults count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_measUtraResults, "count")];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v6 = self->_measUtraResults;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v37;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"meas_utra_result"];
  }
  if ([(NSMutableArray *)self->_measGsmResults count])
  {
    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_measGsmResults, "count")];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v13 = self->_measGsmResults;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"meas_gsm_result"];
  }
  if ([(NSMutableArray *)self->_measLteResults count])
  {
    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_measLteResults, "count")];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v20 = self->_measLteResults;
    id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [k dictionaryRepresentation:v28];
          [v19 addObject:v25];
        }
        id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"meas_lte_result"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v26 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v26 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100060E1C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_measUtraResults;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
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
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_measGsmResults;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      id v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = self->_measLteResults;
  uint64_t v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      id v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
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
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v17 = v4;
  if ([(KCellularWcdmaNbrCellMeas *)self measUtraResultsCount])
  {
    [v17 clearMeasUtraResults];
    unint64_t v5 = [(KCellularWcdmaNbrCellMeas *)self measUtraResultsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(KCellularWcdmaNbrCellMeas *)self measUtraResultAtIndex:i];
        [v17 addMeasUtraResult:v8];
      }
    }
  }
  if ([(KCellularWcdmaNbrCellMeas *)self measGsmResultsCount])
  {
    [v17 clearMeasGsmResults];
    unint64_t v9 = [(KCellularWcdmaNbrCellMeas *)self measGsmResultsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        id v12 = [(KCellularWcdmaNbrCellMeas *)self measGsmResultAtIndex:j];
        [v17 addMeasGsmResult:v12];
      }
    }
  }
  if ([(KCellularWcdmaNbrCellMeas *)self measLteResultsCount])
  {
    [v17 clearMeasLteResults];
    unint64_t v13 = [(KCellularWcdmaNbrCellMeas *)self measLteResultsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(KCellularWcdmaNbrCellMeas *)self measLteResultAtIndex:k];
        [v17 addMeasLteResult:v16];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v17 + 10) = self->_subsId;
    *((unsigned char *)v17 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 44) |= 1u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = self->_measUtraResults;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)v11) copyWithZone:a3];
        [v6 addMeasUtraResult:v12];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v13 = self->_measGsmResults;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)v17) copyWithZone:a3];
        [v6 addMeasGsmResult:v18];

        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = self->_measLteResults;
  id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      long long v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v23) copyWithZone:a3 v26];
        [v6 addMeasLteResult:v24];

        long long v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_subsId;
    *((unsigned char *)v6 + 44) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  measUtraResults = self->_measUtraResults;
  if ((unint64_t)measUtraResults | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](measUtraResults, "isEqual:"))
  {
    goto LABEL_17;
  }
  measGsmResults = self->_measGsmResults;
  if ((unint64_t)measGsmResults | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](measGsmResults, "isEqual:")) {
      goto LABEL_17;
    }
  }
  measLteResults = self->_measLteResults;
  if ((unint64_t)measLteResults | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](measLteResults, "isEqual:")) {
      goto LABEL_17;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_measUtraResults hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_measGsmResults hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_measLteResults hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 44))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v4 + 4);
  id v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(KCellularWcdmaNbrCellMeas *)self addMeasUtraResult:*(void *)(*((void *)&v29 + 1) + 8 * (void)v10)];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v5 + 2);
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(KCellularWcdmaNbrCellMeas *)self addMeasGsmResult:*(void *)(*((void *)&v25 + 1) + 8 * (void)v15)];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v5 + 3);
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[KCellularWcdmaNbrCellMeas addMeasLteResult:](self, "addMeasLteResult:", *(void *)(*((void *)&v21 + 1) + 8 * (void)v20), (void)v21);
        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }

  if ((*((unsigned char *)v5 + 44) & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)measUtraResults
{
  return self->_measUtraResults;
}

- (void)setMeasUtraResults:(id)a3
{
}

- (NSMutableArray)measGsmResults
{
  return self->_measGsmResults;
}

- (void)setMeasGsmResults:(id)a3
{
}

- (NSMutableArray)measLteResults
{
  return self->_measLteResults;
}

- (void)setMeasLteResults:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measUtraResults, 0);
  objc_storeStrong((id *)&self->_measLteResults, 0);

  objc_storeStrong((id *)&self->_measGsmResults, 0);
}

@end