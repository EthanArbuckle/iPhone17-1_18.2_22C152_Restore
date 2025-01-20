@interface GEOLogMsgEventHardStop
+ (BOOL)isValid:(id)a3;
+ (Class)citiesType;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventHardStop)init;
- (GEOLogMsgEventHardStop)initWithData:(id)a3;
- (GEOLogMsgEventHardStop)initWithDictionary:(id)a3;
- (GEOLogMsgEventHardStop)initWithJSON:(id)a3;
- (NSMutableArray)cities;
- (double)score;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)citiesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)citiesCount;
- (unint64_t)digitsCount;
- (unint64_t)hash;
- (unsigned)digits;
- (unsigned)digitsAtIndex:(unint64_t)a3;
- (void)_addNoFlagsCities:(uint64_t)a1;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readCities;
- (void)_readDigits;
- (void)addCities:(id)a3;
- (void)addDigits:(unsigned int)a3;
- (void)clearCities;
- (void)clearDigits;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCities:(id)a3;
- (void)setDigits:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventHardStop

- (GEOLogMsgEventHardStop)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventHardStop;
  v2 = [(GEOLogMsgEventHardStop *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventHardStop)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventHardStop;
  v3 = [(GEOLogMsgEventHardStop *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgEventHardStop;
  [(GEOLogMsgEventHardStop *)&v3 dealloc];
}

- (void)_readDigits
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventHardStopReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDigits_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)digitsCount
{
  return self->_digits.count;
}

- (unsigned)digits
{
  return self->_digits.list;
}

- (void)clearDigits
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt32Clear();
}

- (void)addDigits:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unsigned)digitsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventHardStop _readDigits]((uint64_t)self);
  p_digits = &self->_digits;
  unint64_t count = self->_digits.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_digits->list[a3];
}

- (void)setDigits:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147400](&self->_digits, a3, a4);
}

- (void)_readCities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventHardStopReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)cities
{
  -[GEOLogMsgEventHardStop _readCities]((uint64_t)self);
  cities = self->_cities;

  return cities;
}

- (void)setCities:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  cities = self->_cities;
  self->_cities = v4;
}

- (void)clearCities
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  cities = self->_cities;

  [(NSMutableArray *)cities removeAllObjects];
}

- (void)addCities:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventHardStop _readCities]((uint64_t)self);
  -[GEOLogMsgEventHardStop _addNoFlagsCities:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsCities:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)citiesCount
{
  -[GEOLogMsgEventHardStop _readCities]((uint64_t)self);
  cities = self->_cities;

  return [(NSMutableArray *)cities count];
}

- (id)citiesAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventHardStop _readCities]((uint64_t)self);
  cities = self->_cities;

  return (id)[(NSMutableArray *)cities objectAtIndex:a3];
}

+ (Class)citiesType
{
  return (Class)objc_opt_class();
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventHardStop;
  id v4 = [(GEOLogMsgEventHardStop *)&v8 description];
  id v5 = [(GEOLogMsgEventHardStop *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      id v3 = PBRepeatedUInt32NSArray();
      [v2 setObject:v3 forKey:@"digits"];
    }
    if (*(void *)(a1 + 40))
    {
      id v4 = [(id)a1 cities];
      [v2 setObject:v4 forKey:@"cities"];
    }
    if (*(unsigned char *)(a1 + 68))
    {
      id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      [v2 setObject:v5 forKey:@"score"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOLogMsgEventHardStop)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventHardStop *)-[GEOLogMsgEventHardStop _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"digits"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v26;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v26 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addDigits:", objc_msgSend(v10, "unsignedIntValue"));
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v7);
        }
      }
      v11 = [v3 objectForKeyedSubscript:@"cities"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v22;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v22 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = objc_msgSend(v17, "copy", (void)v21);
                [a1 addCities:v18];
              }
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v14);
        }
      }
      v19 = [v3 objectForKeyedSubscript:@"score"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v19 doubleValue];
        objc_msgSend(a1, "setScore:");
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventHardStop)initWithJSON:(id)a3
{
  return (GEOLogMsgEventHardStop *)-[GEOLogMsgEventHardStop _initWithDictionary:isJSON:](self, a3);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_3263;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3264;
    }
    GEOLogMsgEventHardStopReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventHardStopIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventHardStopReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventHardStop *)self readAll:0];
    if (self->_digits.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_digits.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = self->_cities;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v11 = (id *)a3;
  [(GEOLogMsgEventHardStop *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLogMsgEventHardStop *)self digitsCount])
  {
    [v11 clearDigits];
    unint64_t v4 = [(GEOLogMsgEventHardStop *)self digitsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addDigits:", -[GEOLogMsgEventHardStop digitsAtIndex:](self, "digitsAtIndex:", i));
    }
  }
  if ([(GEOLogMsgEventHardStop *)self citiesCount])
  {
    [v11 clearCities];
    unint64_t v7 = [(GEOLogMsgEventHardStop *)self citiesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        v10 = [(GEOLogMsgEventHardStop *)self citiesAtIndex:j];
        [v11 addCities:v10];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v11[6] = *(id *)&self->_score;
    *((unsigned char *)v11 + 68) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventHardStopReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventHardStop *)self readAll:0];
  PBRepeatedUInt32Copy();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = self->_cities;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v5 addCities:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 48) = self->_score;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOLogMsgEventHardStop *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_9;
  }
  cities = self->_cities;
  if ((unint64_t)cities | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](cities, "isEqual:")) {
      goto LABEL_9;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 68) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) != 0 && self->_score == *((double *)v4 + 6))
    {
      BOOL v6 = 1;
      goto LABEL_10;
    }
LABEL_9:
    BOOL v6 = 0;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventHardStop *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v4 = [(NSMutableArray *)self->_cities hash];
  if (*(unsigned char *)&self->_flags)
  {
    double score = self->_score;
    double v7 = -score;
    if (score >= 0.0) {
      double v7 = self->_score;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 digitsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOLogMsgEventHardStop addDigits:](self, "addDigits:", [v4 digitsAtIndex:i]);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOLogMsgEventHardStop addCities:](self, "addCities:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if (*((unsigned char *)v4 + 68))
  {
    self->_double score = *((double *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cities, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end