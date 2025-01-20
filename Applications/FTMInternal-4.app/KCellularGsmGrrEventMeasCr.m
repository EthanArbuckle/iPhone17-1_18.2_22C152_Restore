@interface KCellularGsmGrrEventMeasCr
+ (Class)gsmNcellMeasType;
+ (Class)lteNcellMeasType;
+ (Class)umtsNcellMeasType;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)gsmNcellMeas;
- (NSMutableArray)lteNcellMeas;
- (NSMutableArray)umtsNcellMeas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gsmNcellMeasAtIndex:(unint64_t)a3;
- (id)lteNcellMeasAtIndex:(unint64_t)a3;
- (id)umtsNcellMeasAtIndex:(unint64_t)a3;
- (unint64_t)gsmNcellMeasCount;
- (unint64_t)hash;
- (unint64_t)lteNcellMeasCount;
- (unint64_t)timestamp;
- (unint64_t)umtsNcellMeasCount;
- (unsigned)subsId;
- (void)addGsmNcellMeas:(id)a3;
- (void)addLteNcellMeas:(id)a3;
- (void)addUmtsNcellMeas:(id)a3;
- (void)clearGsmNcellMeas;
- (void)clearLteNcellMeas;
- (void)clearUmtsNcellMeas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGsmNcellMeas:(id)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLteNcellMeas:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUmtsNcellMeas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularGsmGrrEventMeasCr

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

- (void)clearGsmNcellMeas
{
}

- (void)addGsmNcellMeas:(id)a3
{
  id v4 = a3;
  gsmNcellMeas = self->_gsmNcellMeas;
  id v8 = v4;
  if (!gsmNcellMeas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_gsmNcellMeas;
    self->_gsmNcellMeas = v6;

    id v4 = v8;
    gsmNcellMeas = self->_gsmNcellMeas;
  }
  [(NSMutableArray *)gsmNcellMeas addObject:v4];
}

- (unint64_t)gsmNcellMeasCount
{
  return (unint64_t)[(NSMutableArray *)self->_gsmNcellMeas count];
}

- (id)gsmNcellMeasAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_gsmNcellMeas objectAtIndex:a3];
}

+ (Class)gsmNcellMeasType
{
  return (Class)objc_opt_class();
}

- (void)clearUmtsNcellMeas
{
}

- (void)addUmtsNcellMeas:(id)a3
{
  id v4 = a3;
  umtsNcellMeas = self->_umtsNcellMeas;
  id v8 = v4;
  if (!umtsNcellMeas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_umtsNcellMeas;
    self->_umtsNcellMeas = v6;

    id v4 = v8;
    umtsNcellMeas = self->_umtsNcellMeas;
  }
  [(NSMutableArray *)umtsNcellMeas addObject:v4];
}

- (unint64_t)umtsNcellMeasCount
{
  return (unint64_t)[(NSMutableArray *)self->_umtsNcellMeas count];
}

- (id)umtsNcellMeasAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_umtsNcellMeas objectAtIndex:a3];
}

+ (Class)umtsNcellMeasType
{
  return (Class)objc_opt_class();
}

- (void)clearLteNcellMeas
{
}

- (void)addLteNcellMeas:(id)a3
{
  id v4 = a3;
  lteNcellMeas = self->_lteNcellMeas;
  id v8 = v4;
  if (!lteNcellMeas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_lteNcellMeas;
    self->_lteNcellMeas = v6;

    id v4 = v8;
    lteNcellMeas = self->_lteNcellMeas;
  }
  [(NSMutableArray *)lteNcellMeas addObject:v4];
}

- (unint64_t)lteNcellMeasCount
{
  return (unint64_t)[(NSMutableArray *)self->_lteNcellMeas count];
}

- (id)lteNcellMeasAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_lteNcellMeas objectAtIndex:a3];
}

+ (Class)lteNcellMeasType
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
  v7.super_class = (Class)KCellularGsmGrrEventMeasCr;
  char v3 = [(KCellularGsmGrrEventMeasCr *)&v7 description];
  id v4 = [(KCellularGsmGrrEventMeasCr *)self dictionaryRepresentation];
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
  if ([(NSMutableArray *)self->_gsmNcellMeas count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_gsmNcellMeas, "count")];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v6 = self->_gsmNcellMeas;
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

    [v3 setObject:v5 forKey:@"gsm_ncell_meas"];
  }
  if ([(NSMutableArray *)self->_umtsNcellMeas count])
  {
    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_umtsNcellMeas, "count")];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v13 = self->_umtsNcellMeas;
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

    [v3 setObject:v12 forKey:@"umts_ncell_meas"];
  }
  if ([(NSMutableArray *)self->_lteNcellMeas count])
  {
    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_lteNcellMeas, "count")];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v20 = self->_lteNcellMeas;
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

    [v3 setObject:v19 forKey:@"lte_ncell_meas"];
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
  return sub_100150378((uint64_t)self, (uint64_t)a3);
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
  id v5 = self->_gsmNcellMeas;
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
  v10 = self->_umtsNcellMeas;
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
  id v15 = self->_lteNcellMeas;
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
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v17 = v4;
  if ([(KCellularGsmGrrEventMeasCr *)self gsmNcellMeasCount])
  {
    [v17 clearGsmNcellMeas];
    unint64_t v5 = [(KCellularGsmGrrEventMeasCr *)self gsmNcellMeasCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(KCellularGsmGrrEventMeasCr *)self gsmNcellMeasAtIndex:i];
        [v17 addGsmNcellMeas:v8];
      }
    }
  }
  if ([(KCellularGsmGrrEventMeasCr *)self umtsNcellMeasCount])
  {
    [v17 clearUmtsNcellMeas];
    unint64_t v9 = [(KCellularGsmGrrEventMeasCr *)self umtsNcellMeasCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        id v12 = [(KCellularGsmGrrEventMeasCr *)self umtsNcellMeasAtIndex:j];
        [v17 addUmtsNcellMeas:v12];
      }
    }
  }
  if ([(KCellularGsmGrrEventMeasCr *)self lteNcellMeasCount])
  {
    [v17 clearLteNcellMeas];
    unint64_t v13 = [(KCellularGsmGrrEventMeasCr *)self lteNcellMeasCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(KCellularGsmGrrEventMeasCr *)self lteNcellMeasAtIndex:k];
        [v17 addLteNcellMeas:v16];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v17 + 8) = self->_subsId;
    *((unsigned char *)v17 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = self->_gsmNcellMeas;
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
        [v6 addGsmNcellMeas:v12];

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
  unint64_t v13 = self->_umtsNcellMeas;
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
        [v6 addUmtsNcellMeas:v18];

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
  id v19 = self->_lteNcellMeas;
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
        id v24 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v23) copyWithZone:a3];
        [v6 addLteNcellMeas:v24];

        long long v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_subsId;
    *((unsigned char *)v6 + 48) |= 2u;
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
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  gsmNcellMeas = self->_gsmNcellMeas;
  if ((unint64_t)gsmNcellMeas | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](gsmNcellMeas, "isEqual:"))
  {
    goto LABEL_17;
  }
  umtsNcellMeas = self->_umtsNcellMeas;
  if ((unint64_t)umtsNcellMeas | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](umtsNcellMeas, "isEqual:")) {
      goto LABEL_17;
    }
  }
  lteNcellMeas = self->_lteNcellMeas;
  if ((unint64_t)lteNcellMeas | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](lteNcellMeas, "isEqual:")) {
      goto LABEL_17;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
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
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_gsmNcellMeas hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_umtsNcellMeas hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_lteNcellMeas hash];
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
  if (*((unsigned char *)v4 + 48))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v4 + 2);
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
        [(KCellularGsmGrrEventMeasCr *)self addGsmNcellMeas:*(void *)(*((void *)&v29 + 1) + 8 * (void)v10)];
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
  id v11 = *((id *)v5 + 5);
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
        [(KCellularGsmGrrEventMeasCr *)self addUmtsNcellMeas:*(void *)(*((void *)&v25 + 1) + 8 * (void)v15)];
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
        -[KCellularGsmGrrEventMeasCr addLteNcellMeas:](self, "addLteNcellMeas:", *(void *)(*((void *)&v21 + 1) + 8 * (void)v20), (void)v21);
        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }

  if ((*((unsigned char *)v5 + 48) & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)gsmNcellMeas
{
  return self->_gsmNcellMeas;
}

- (void)setGsmNcellMeas:(id)a3
{
}

- (NSMutableArray)umtsNcellMeas
{
  return self->_umtsNcellMeas;
}

- (void)setUmtsNcellMeas:(id)a3
{
}

- (NSMutableArray)lteNcellMeas
{
  return self->_lteNcellMeas;
}

- (void)setLteNcellMeas:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_umtsNcellMeas, 0);
  objc_storeStrong((id *)&self->_lteNcellMeas, 0);

  objc_storeStrong((id *)&self->_gsmNcellMeas, 0);
}

@end