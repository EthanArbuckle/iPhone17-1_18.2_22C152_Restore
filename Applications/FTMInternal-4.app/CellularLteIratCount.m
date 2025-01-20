@interface CellularLteIratCount
+ (Class)ctolReselCountType;
+ (Class)fromLteHoCountType;
+ (Class)fromLteRedirCountType;
+ (Class)fromLteReselCountType;
+ (Class)wtolRedirCountType;
- (BOOL)hasDurationSeconds;
- (BOOL)hasTimestamp;
- (BOOL)hasWtolHoCount;
- (BOOL)hasWtolReselCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HoFromUtranCount)wtolHoCount;
- (NSMutableArray)ctolReselCounts;
- (NSMutableArray)fromLteHoCounts;
- (NSMutableArray)fromLteRedirCounts;
- (NSMutableArray)fromLteReselCounts;
- (NSMutableArray)wtolRedirCounts;
- (ReselFromUtranCount)wtolReselCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)ctolReselCountAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fromLteHoCountAtIndex:(unint64_t)a3;
- (id)fromLteRedirCountAtIndex:(unint64_t)a3;
- (id)fromLteReselCountAtIndex:(unint64_t)a3;
- (id)wtolRedirCountAtIndex:(unint64_t)a3;
- (unint64_t)ctolReselCountsCount;
- (unint64_t)fromLteHoCountsCount;
- (unint64_t)fromLteRedirCountsCount;
- (unint64_t)fromLteReselCountsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)wtolRedirCountsCount;
- (unsigned)durationSeconds;
- (void)addCtolReselCount:(id)a3;
- (void)addFromLteHoCount:(id)a3;
- (void)addFromLteRedirCount:(id)a3;
- (void)addFromLteReselCount:(id)a3;
- (void)addWtolRedirCount:(id)a3;
- (void)clearCtolReselCounts;
- (void)clearFromLteHoCounts;
- (void)clearFromLteRedirCounts;
- (void)clearFromLteReselCounts;
- (void)clearWtolRedirCounts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCtolReselCounts:(id)a3;
- (void)setDurationSeconds:(unsigned int)a3;
- (void)setFromLteHoCounts:(id)a3;
- (void)setFromLteRedirCounts:(id)a3;
- (void)setFromLteReselCounts:(id)a3;
- (void)setHasDurationSeconds:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWtolHoCount:(id)a3;
- (void)setWtolRedirCounts:(id)a3;
- (void)setWtolReselCount:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteIratCount

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

- (void)setDurationSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearFromLteHoCounts
{
}

- (void)addFromLteHoCount:(id)a3
{
  id v4 = a3;
  fromLteHoCounts = self->_fromLteHoCounts;
  id v8 = v4;
  if (!fromLteHoCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_fromLteHoCounts;
    self->_fromLteHoCounts = v6;

    id v4 = v8;
    fromLteHoCounts = self->_fromLteHoCounts;
  }
  [(NSMutableArray *)fromLteHoCounts addObject:v4];
}

- (unint64_t)fromLteHoCountsCount
{
  return (unint64_t)[(NSMutableArray *)self->_fromLteHoCounts count];
}

- (id)fromLteHoCountAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_fromLteHoCounts objectAtIndex:a3];
}

+ (Class)fromLteHoCountType
{
  return (Class)objc_opt_class();
}

- (void)clearFromLteReselCounts
{
}

- (void)addFromLteReselCount:(id)a3
{
  id v4 = a3;
  fromLteReselCounts = self->_fromLteReselCounts;
  id v8 = v4;
  if (!fromLteReselCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_fromLteReselCounts;
    self->_fromLteReselCounts = v6;

    id v4 = v8;
    fromLteReselCounts = self->_fromLteReselCounts;
  }
  [(NSMutableArray *)fromLteReselCounts addObject:v4];
}

- (unint64_t)fromLteReselCountsCount
{
  return (unint64_t)[(NSMutableArray *)self->_fromLteReselCounts count];
}

- (id)fromLteReselCountAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_fromLteReselCounts objectAtIndex:a3];
}

+ (Class)fromLteReselCountType
{
  return (Class)objc_opt_class();
}

- (void)clearFromLteRedirCounts
{
}

- (void)addFromLteRedirCount:(id)a3
{
  id v4 = a3;
  fromLteRedirCounts = self->_fromLteRedirCounts;
  id v8 = v4;
  if (!fromLteRedirCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_fromLteRedirCounts;
    self->_fromLteRedirCounts = v6;

    id v4 = v8;
    fromLteRedirCounts = self->_fromLteRedirCounts;
  }
  [(NSMutableArray *)fromLteRedirCounts addObject:v4];
}

- (unint64_t)fromLteRedirCountsCount
{
  return (unint64_t)[(NSMutableArray *)self->_fromLteRedirCounts count];
}

- (id)fromLteRedirCountAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_fromLteRedirCounts objectAtIndex:a3];
}

+ (Class)fromLteRedirCountType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasWtolHoCount
{
  return self->_wtolHoCount != 0;
}

- (BOOL)hasWtolReselCount
{
  return self->_wtolReselCount != 0;
}

- (void)clearWtolRedirCounts
{
}

- (void)addWtolRedirCount:(id)a3
{
  id v4 = a3;
  wtolRedirCounts = self->_wtolRedirCounts;
  id v8 = v4;
  if (!wtolRedirCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_wtolRedirCounts;
    self->_wtolRedirCounts = v6;

    id v4 = v8;
    wtolRedirCounts = self->_wtolRedirCounts;
  }
  [(NSMutableArray *)wtolRedirCounts addObject:v4];
}

- (unint64_t)wtolRedirCountsCount
{
  return (unint64_t)[(NSMutableArray *)self->_wtolRedirCounts count];
}

- (id)wtolRedirCountAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_wtolRedirCounts objectAtIndex:a3];
}

+ (Class)wtolRedirCountType
{
  return (Class)objc_opt_class();
}

- (void)clearCtolReselCounts
{
}

- (void)addCtolReselCount:(id)a3
{
  id v4 = a3;
  ctolReselCounts = self->_ctolReselCounts;
  id v8 = v4;
  if (!ctolReselCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_ctolReselCounts;
    self->_ctolReselCounts = v6;

    id v4 = v8;
    ctolReselCounts = self->_ctolReselCounts;
  }
  [(NSMutableArray *)ctolReselCounts addObject:v4];
}

- (unint64_t)ctolReselCountsCount
{
  return (unint64_t)[(NSMutableArray *)self->_ctolReselCounts count];
}

- (id)ctolReselCountAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_ctolReselCounts objectAtIndex:a3];
}

+ (Class)ctolReselCountType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteIratCount;
  char v3 = [(CellularLteIratCount *)&v7 description];
  id v4 = [(CellularLteIratCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_durationSeconds];
    [v3 setObject:v6 forKey:@"duration_seconds"];
  }
  if ([(NSMutableArray *)self->_fromLteHoCounts count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_fromLteHoCounts, "count")];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v8 = self->_fromLteHoCounts;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v64;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v64 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v63 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"from_lte_ho_count"];
  }
  if ([(NSMutableArray *)self->_fromLteReselCounts count])
  {
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_fromLteReselCounts, "count")];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v15 = self->_fromLteReselCounts;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v60;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v60 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"from_lte_resel_count"];
  }
  if ([(NSMutableArray *)self->_fromLteRedirCounts count])
  {
    id v21 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_fromLteRedirCounts, "count")];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v22 = self->_fromLteRedirCounts;
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v56;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v56 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v55 objects:v69 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"from_lte_redir_count"];
  }
  wtolHoCount = self->_wtolHoCount;
  if (wtolHoCount)
  {
    v29 = [(HoFromUtranCount *)wtolHoCount dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"wtol_ho_count"];
  }
  wtolReselCount = self->_wtolReselCount;
  if (wtolReselCount)
  {
    v31 = [(ReselFromUtranCount *)wtolReselCount dictionaryRepresentation];
    [v3 setObject:v31 forKey:@"wtol_resel_count"];
  }
  if ([(NSMutableArray *)self->_wtolRedirCounts count])
  {
    id v32 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_wtolRedirCounts, "count")];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v33 = self->_wtolRedirCounts;
    id v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v52;
      do
      {
        for (m = 0; m != v35; m = (char *)m + 1)
        {
          if (*(void *)v52 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)m) dictionaryRepresentation];
          [v32 addObject:v38];
        }
        id v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v51 objects:v68 count:16];
      }
      while (v35);
    }

    [v3 setObject:v32 forKey:@"wtol_redir_count"];
  }
  if ([(NSMutableArray *)self->_ctolReselCounts count])
  {
    id v39 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_ctolReselCounts, "count")];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v40 = self->_ctolReselCounts;
    id v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v47 objects:v67 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v48;
      do
      {
        for (n = 0; n != v42; n = (char *)n + 1)
        {
          if (*(void *)v48 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)n) dictionaryRepresentation];
          [v39 addObject:v45];
        }
        id v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v47 objects:v67 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"ctol_resel_count"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10011B87C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v6 = self->_fromLteHoCounts;
  id v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v8);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v11 = self->_fromLteReselCounts;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v13);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = self->_fromLteRedirCounts;
  id v17 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v18);
  }

  if (self->_wtolHoCount) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_wtolReselCount) {
    PBDataWriterWriteSubmessage();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = self->_wtolRedirCounts;
  v22 = (char *)[(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      id v23 = (char *)[(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v23);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v26 = self->_ctolReselCounts;
  v27 = (char *)[(NSMutableArray *)v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v27)
  {
    v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
      }
      v28 = (char *)[(NSMutableArray *)v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v28);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 80) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_durationSeconds;
    *((unsigned char *)v4 + 80) |= 2u;
  }
  id v26 = v4;
  if ([(CellularLteIratCount *)self fromLteHoCountsCount])
  {
    [v26 clearFromLteHoCounts];
    unint64_t v6 = [(CellularLteIratCount *)self fromLteHoCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularLteIratCount *)self fromLteHoCountAtIndex:i];
        [v26 addFromLteHoCount:v9];
      }
    }
  }
  if ([(CellularLteIratCount *)self fromLteReselCountsCount])
  {
    [v26 clearFromLteReselCounts];
    unint64_t v10 = [(CellularLteIratCount *)self fromLteReselCountsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        v13 = [(CellularLteIratCount *)self fromLteReselCountAtIndex:j];
        [v26 addFromLteReselCount:v13];
      }
    }
  }
  if ([(CellularLteIratCount *)self fromLteRedirCountsCount])
  {
    [v26 clearFromLteRedirCounts];
    unint64_t v14 = [(CellularLteIratCount *)self fromLteRedirCountsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        id v17 = [(CellularLteIratCount *)self fromLteRedirCountAtIndex:k];
        [v26 addFromLteRedirCount:v17];
      }
    }
  }
  if (self->_wtolHoCount) {
    [v26 setWtolHoCount:];
  }
  if (self->_wtolReselCount) {
    [v26 setWtolReselCount:];
  }
  if ([(CellularLteIratCount *)self wtolRedirCountsCount])
  {
    [v26 clearWtolRedirCounts];
    unint64_t v18 = [(CellularLteIratCount *)self wtolRedirCountsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        id v21 = [(CellularLteIratCount *)self wtolRedirCountAtIndex:m];
        [v26 addWtolRedirCount:v21];
      }
    }
  }
  if ([(CellularLteIratCount *)self ctolReselCountsCount])
  {
    [v26 clearCtolReselCounts];
    unint64_t v22 = [(CellularLteIratCount *)self ctolReselCountsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
      {
        uint64_t v25 = [(CellularLteIratCount *)self ctolReselCountAtIndex:n];
        [v26 addCtolReselCount:v25];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 80) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_durationSeconds;
    *((unsigned char *)v5 + 80) |= 2u;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v8 = self->_fromLteHoCounts;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v59 + 1) + 8 * i) copyWithZone:a3];
        [v6 addFromLteHoCount:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v10);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  unint64_t v14 = self->_fromLteReselCounts;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v56 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addFromLteReselCount:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v16);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v20 = self->_fromLteRedirCounts;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v22; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)k) copyWithZone:a3];
        [v6 addFromLteRedirCount:v25];
      }
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v22);
  }

  id v26 = [(HoFromUtranCount *)self->_wtolHoCount copyWithZone:a3];
  v27 = (void *)v6[7];
  v6[7] = v26;

  id v28 = [(ReselFromUtranCount *)self->_wtolReselCount copyWithZone:a3];
  uint64_t v29 = (void *)v6[9];
  v6[9] = v28;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v30 = self->_wtolRedirCounts;
  id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v47 objects:v64 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v48;
    do
    {
      for (uint64_t m = 0; m != v32; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v48 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)m) copyWithZone:a3];
        [v6 addWtolRedirCount:v35];
      }
      id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v47 objects:v64 count:16];
    }
    while (v32);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v36 = self->_ctolReselCounts;
  id v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v63 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t n = 0; n != v38; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v36);
        }
        id v41 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)n) copyWithZone:a3];
        [v6 addCtolReselCount:v41];
      }
      id v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v63 count:16];
    }
    while (v38);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_26:
    unsigned __int8 v12 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_26;
  }
  fromLteHoCounts = self->_fromLteHoCounts;
  if ((unint64_t)fromLteHoCounts | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](fromLteHoCounts, "isEqual:"))
  {
    goto LABEL_26;
  }
  fromLteReselCounts = self->_fromLteReselCounts;
  if ((unint64_t)fromLteReselCounts | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](fromLteReselCounts, "isEqual:")) {
      goto LABEL_26;
    }
  }
  fromLteRedirCounts = self->_fromLteRedirCounts;
  if ((unint64_t)fromLteRedirCounts | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](fromLteRedirCounts, "isEqual:")) {
      goto LABEL_26;
    }
  }
  wtolHoCount = self->_wtolHoCount;
  if ((unint64_t)wtolHoCount | *((void *)v4 + 7))
  {
    if (!-[HoFromUtranCount isEqual:](wtolHoCount, "isEqual:")) {
      goto LABEL_26;
    }
  }
  wtolReselCount = self->_wtolReselCount;
  if ((unint64_t)wtolReselCount | *((void *)v4 + 9))
  {
    if (!-[ReselFromUtranCount isEqual:](wtolReselCount, "isEqual:")) {
      goto LABEL_26;
    }
  }
  wtolRedirCounts = self->_wtolRedirCounts;
  if ((unint64_t)wtolRedirCounts | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](wtolRedirCounts, "isEqual:")) {
      goto LABEL_26;
    }
  }
  ctolReselCounts = self->_ctolReselCounts;
  if ((unint64_t)ctolReselCounts | *((void *)v4 + 2)) {
    unsigned __int8 v12 = -[NSMutableArray isEqual:](ctolReselCounts, "isEqual:");
  }
  else {
    unsigned __int8 v12 = 1;
  }
LABEL_27:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_durationSeconds;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ (unint64_t)[(NSMutableArray *)self->_fromLteHoCounts hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_fromLteReselCounts hash];
  unint64_t v7 = v5 ^ v6 ^ (unint64_t)[(NSMutableArray *)self->_fromLteRedirCounts hash];
  unint64_t v8 = [(HoFromUtranCount *)self->_wtolHoCount hash];
  unint64_t v9 = v8 ^ [(ReselFromUtranCount *)self->_wtolReselCount hash];
  unint64_t v10 = v7 ^ v9 ^ (unint64_t)[(NSMutableArray *)self->_wtolRedirCounts hash];
  return v10 ^ (unint64_t)[(NSMutableArray *)self->_ctolReselCounts hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (id *)v4;
  char v6 = *((unsigned char *)v4 + 80);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 80);
  }
  if ((v6 & 2) != 0)
  {
    self->_durationSeconds = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = *((id *)v4 + 4);
  id v8 = [v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CellularLteIratCount *)self addFromLteHoCount:*(void *)(*((void *)&v52 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v9);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = v5[6];
  id v13 = [v12 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CellularLteIratCount *)self addFromLteReselCount:*(void *)(*((void *)&v48 + 1) + 8 * (void)j)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v14);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v17 = v5[5];
  id v18 = [v17 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v19; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v17);
        }
        [(CellularLteIratCount *)self addFromLteRedirCount:*(void *)(*((void *)&v44 + 1) + 8 * (void)k)];
      }
      id v19 = [v17 countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v19);
  }

  wtolHoCount = self->_wtolHoCount;
  id v23 = v5[7];
  if (wtolHoCount)
  {
    if (v23) {
      -[HoFromUtranCount mergeFrom:](wtolHoCount, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[CellularLteIratCount setWtolHoCount:](self, "setWtolHoCount:");
  }
  wtolReselCount = self->_wtolReselCount;
  id v25 = v5[9];
  if (wtolReselCount)
  {
    if (v25) {
      -[ReselFromUtranCount mergeFrom:](wtolReselCount, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[CellularLteIratCount setWtolReselCount:](self, "setWtolReselCount:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = v5[8];
  id v27 = [v26 countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t m = 0; m != v28; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v26);
        }
        [(CellularLteIratCount *)self addWtolRedirCount:*(void *)(*((void *)&v40 + 1) + 8 * (void)m)];
      }
      id v28 = [v26 countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v28);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v31 = v5[2];
  id v32 = [v31 countByEnumeratingWithState:&v36 objects:v56 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v37;
    do
    {
      for (uint64_t n = 0; n != v33; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(v31);
        }
        -[CellularLteIratCount addCtolReselCount:](self, "addCtolReselCount:", *(void *)(*((void *)&v36 + 1) + 8 * (void)n), (void)v36);
      }
      id v33 = [v31 countByEnumeratingWithState:&v36 objects:v56 count:16];
    }
    while (v33);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (NSMutableArray)fromLteHoCounts
{
  return self->_fromLteHoCounts;
}

- (void)setFromLteHoCounts:(id)a3
{
}

- (NSMutableArray)fromLteReselCounts
{
  return self->_fromLteReselCounts;
}

- (void)setFromLteReselCounts:(id)a3
{
}

- (NSMutableArray)fromLteRedirCounts
{
  return self->_fromLteRedirCounts;
}

- (void)setFromLteRedirCounts:(id)a3
{
}

- (HoFromUtranCount)wtolHoCount
{
  return self->_wtolHoCount;
}

- (void)setWtolHoCount:(id)a3
{
}

- (ReselFromUtranCount)wtolReselCount
{
  return self->_wtolReselCount;
}

- (void)setWtolReselCount:(id)a3
{
}

- (NSMutableArray)wtolRedirCounts
{
  return self->_wtolRedirCounts;
}

- (void)setWtolRedirCounts:(id)a3
{
}

- (NSMutableArray)ctolReselCounts
{
  return self->_ctolReselCounts;
}

- (void)setCtolReselCounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wtolReselCount, 0);
  objc_storeStrong((id *)&self->_wtolRedirCounts, 0);
  objc_storeStrong((id *)&self->_wtolHoCount, 0);
  objc_storeStrong((id *)&self->_fromLteReselCounts, 0);
  objc_storeStrong((id *)&self->_fromLteRedirCounts, 0);
  objc_storeStrong((id *)&self->_fromLteHoCounts, 0);

  objc_storeStrong((id *)&self->_ctolReselCounts, 0);
}

@end