@interface GEOCoarseLocationRing
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCoarseLocationPoint)points;
- (GEOCoarseLocationPoint)pointsAtIndex:(unint64_t)a3;
- (GEOCoarseLocationRing)initWithDictionary:(id)a3;
- (GEOCoarseLocationRing)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_reservePoints:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)pointsCount;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)addPoints:(GEOCoarseLocationPoint)a3;
- (void)clearPoints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setPoints:(GEOCoarseLocationPoint *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOCoarseLocationRing

- (void)dealloc
{
  [(GEOCoarseLocationRing *)self clearPoints];
  v3.receiver = self;
  v3.super_class = (Class)GEOCoarseLocationRing;
  [(GEOCoarseLocationRing *)&v3 dealloc];
}

- (unint64_t)pointsCount
{
  return self->_pointsCount;
}

- (GEOCoarseLocationPoint)points
{
  return self->_points;
}

- (uint64_t)_reservePoints:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 24);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (8 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 8), 8 * v9, 0x4AC541B6uLL);
    if (result)
    {
      *(void *)(a1 + 24) = v9;
      *(void *)(a1 + 8) = result;
      bzero((void *)(result + 8 * *(void *)(a1 + 16)), 8 * (v9 - *(void *)(a1 + 16)));
      return 1;
    }
  }
  return result;
}

- (void)clearPoints
{
  self->_pointsSpace = 0;
  self->_pointsCount = 0;
  free(self->_points);
  self->_points = 0;
}

- (void)addPoints:(GEOCoarseLocationPoint)a3
{
  if (-[GEOCoarseLocationRing _reservePoints:]((uint64_t)self, 1uLL)) {
    self->_points[self->_pointsCount++] = a3;
  }
}

- (GEOCoarseLocationPoint)pointsAtIndex:(unint64_t)a3
{
  unint64_t pointsCount = self->_pointsCount;
  if (pointsCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, pointsCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return self->_points[a3];
}

- (void)setPoints:(GEOCoarseLocationPoint *)a3 count:(unint64_t)a4
{
  if (-[GEOCoarseLocationRing _reservePoints:]((uint64_t)self, a4))
  {
    memcpy(self->_points, a3, 8 * a4);
    self->_unint64_t pointsCount = a4;
  }
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCoarseLocationRing;
  unint64_t v4 = [(GEOCoarseLocationRing *)&v8 description];
  unint64_t v5 = [(GEOCoarseLocationRing *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
      objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[2]];
      if (a1[2])
      {
        uint64_t v4 = 0;
        unint64_t v5 = 0;
        do
        {
          unint64_t v6 = _GEOCoarseLocationPointDictionaryRepresentation((unsigned int *)(a1[1] + v4));
          [v3 addObject:v6];

          ++v5;
          v4 += 8;
        }
        while (v5 < a1[2]);
      }
      [v2 setObject:v3 forKey:@"points"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOCoarseLocationRing)initWithDictionary:(id)a3
{
  return (GEOCoarseLocationRing *)-[GEOCoarseLocationRing _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v4 = [v3 objectForKeyedSubscript:@"points"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v14;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v14 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v12 = 0;
                _GEOCoarseLocationPointFromDictionaryRepresentation(v10, &v12);
                [a1 addPoints:v12];
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v7);
        }
      }
    }
  }

  return a1;
}

- (GEOCoarseLocationRing)initWithJSON:(id)a3
{
  return (GEOCoarseLocationRing *)-[GEOCoarseLocationRing _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCoarseLocationRingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCoarseLocationRingReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_pointsCount)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      PBDataWriterPlaceMark();
      PBDataWriterWriteSint32Field();
      PBDataWriterWriteSint32Field();
      PBDataWriterRecallMark();
      ++v6;
      v5 += 8;
    }
    while (v6 < self->_pointsCount);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEOCoarseLocationRing *)self readAll:0];
  if ([(GEOCoarseLocationRing *)self pointsCount])
  {
    [v7 clearPoints];
    unint64_t v4 = [(GEOCoarseLocationRing *)self pointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPoints:", -[GEOCoarseLocationRing pointsAtIndex:](self, "pointsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  unint64_t pointsCount = self->_pointsCount;
  if (pointsCount)
  {
    -[GEOCoarseLocationRing _reservePoints:](v4, pointsCount);
    memcpy(*(void **)(v5 + 8), self->_points, 8 * self->_pointsCount);
    *(void *)(v5 + 16) = self->_pointsCount;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOCoarseLocationRing *)self readAll:1],
        [v4 readAll:1],
        unint64_t pointsCount = self->_pointsCount,
        (const void *)pointsCount == v4[2])
    && memcmp(self->_points, v4[1], 8 * pointsCount) == 0;

  return v6;
}

- (unint64_t)hash
{
  [(GEOCoarseLocationRing *)self readAll:1];

  return PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = [v7 pointsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOCoarseLocationRing addPoints:](self, "addPoints:", [v7 pointsAtIndex:i]);
  }
}

@end