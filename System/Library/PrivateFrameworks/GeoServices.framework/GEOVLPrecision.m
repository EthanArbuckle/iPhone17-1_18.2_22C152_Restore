@interface GEOVLPrecision
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLPrecision)initWithDictionary:(id)a3;
- (GEOVLPrecision)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)precisionsCount;
- (unsigned)precisions;
- (unsigned)precisionsAtIndex:(unint64_t)a3;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)addPrecisions:(unsigned int)a3;
- (void)clearPrecisions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setPrecisions:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLPrecision

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLPrecision;
  [(GEOVLPrecision *)&v3 dealloc];
}

- (unint64_t)precisionsCount
{
  return self->_precisions.count;
}

- (unsigned)precisions
{
  return self->_precisions.list;
}

- (void)clearPrecisions
{
}

- (void)addPrecisions:(unsigned int)a3
{
}

- (unsigned)precisionsAtIndex:(unint64_t)a3
{
  p_precisions = &self->_precisions;
  unint64_t count = self->_precisions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_precisions->list[a3];
}

- (void)setPrecisions:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLPrecision;
  v4 = [(GEOVLPrecision *)&v8 description];
  v5 = [(GEOVLPrecision *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[2])
    {
      objc_super v3 = PBRepeatedUInt32NSArray();
      [v2 setObject:v3 forKey:@"precisions"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOVLPrecision)initWithDictionary:(id)a3
{
  return (GEOVLPrecision *)-[GEOVLPrecision _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"precisions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v14 = 0u;
        long long v15 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v13;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v13 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addPrecisions:", objc_msgSend(v10, "unsignedIntValue", (void)v12));
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          }
          while (v7);
        }
      }
    }
  }

  return a1;
}

- (GEOVLPrecision)initWithJSON:(id)a3
{
  return (GEOVLPrecision *)-[GEOVLPrecision _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLPrecisionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLPrecisionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  p_precisions = &self->_precisions;
  if (self->_precisions.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < p_precisions->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEOVLPrecision *)self readAll:0];
  if ([(GEOVLPrecision *)self precisionsCount])
  {
    [v7 clearPrecisions];
    unint64_t v4 = [(GEOVLPrecision *)self precisionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPrecisions:", -[GEOVLPrecision precisionsAtIndex:](self, "precisionsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    [(GEOVLPrecision *)self readAll:1];
    [v4 readAll:1];
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOVLPrecision *)self readAll:1];

  return PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = [v7 precisionsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOVLPrecision addPrecisions:](self, "addPrecisions:", [v7 precisionsAtIndex:i]);
  }
}

@end