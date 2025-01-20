@interface GEOLogMsgEventCuratedCollectionStats
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventCuratedCollectionStats)initWithDictionary:(id)a3;
- (GEOLogMsgEventCuratedCollectionStats)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)savedCollectionMuids;
- (unint64_t)savedCollectionMuidsAtIndex:(unint64_t)a3;
- (unint64_t)savedCollectionMuidsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addSavedCollectionMuids:(unint64_t)a3;
- (void)clearSavedCollectionMuids;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setSavedCollectionMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventCuratedCollectionStats

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgEventCuratedCollectionStats;
  [(GEOLogMsgEventCuratedCollectionStats *)&v3 dealloc];
}

- (unint64_t)savedCollectionMuidsCount
{
  return self->_savedCollectionMuids.count;
}

- (unint64_t)savedCollectionMuids
{
  return self->_savedCollectionMuids.list;
}

- (void)clearSavedCollectionMuids
{
}

- (void)addSavedCollectionMuids:(unint64_t)a3
{
}

- (unint64_t)savedCollectionMuidsAtIndex:(unint64_t)a3
{
  p_savedCollectionMuids = &self->_savedCollectionMuids;
  unint64_t count = self->_savedCollectionMuids.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_savedCollectionMuids->list[a3];
}

- (void)setSavedCollectionMuids:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventCuratedCollectionStats;
  v4 = [(GEOLogMsgEventCuratedCollectionStats *)&v8 description];
  v5 = [(GEOLogMsgEventCuratedCollectionStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventCuratedCollectionStats _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[2])
    {
      v5 = PBRepeatedUInt64NSArray();
      if (a2) {
        v6 = @"savedCollectionMuids";
      }
      else {
        v6 = @"saved_collection_muids";
      }
      [v4 setObject:v5 forKey:v6];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventCuratedCollectionStats _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventCuratedCollectionStats)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventCuratedCollectionStats *)-[GEOLogMsgEventCuratedCollectionStats _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"savedCollectionMuids";
      }
      else {
        v6 = @"saved_collection_muids";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addSavedCollectionMuids:", objc_msgSend(v13, "unsignedLongLongValue", (void)v15));
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v10);
        }
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventCuratedCollectionStats)initWithJSON:(id)a3
{
  return (GEOLogMsgEventCuratedCollectionStats *)-[GEOLogMsgEventCuratedCollectionStats _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventCuratedCollectionStatsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventCuratedCollectionStatsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  p_savedCollectionMuids = &self->_savedCollectionMuids;
  if (self->_savedCollectionMuids.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v4;
    }
    while (v4 < p_savedCollectionMuids->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEOLogMsgEventCuratedCollectionStats *)self readAll:0];
  if ([(GEOLogMsgEventCuratedCollectionStats *)self savedCollectionMuidsCount])
  {
    [v7 clearSavedCollectionMuids];
    unint64_t v4 = [(GEOLogMsgEventCuratedCollectionStats *)self savedCollectionMuidsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSavedCollectionMuids:", -[GEOLogMsgEventCuratedCollectionStats savedCollectionMuidsAtIndex:](self, "savedCollectionMuidsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    [(GEOLogMsgEventCuratedCollectionStats *)self readAll:1];
    [v4 readAll:1];
    char IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventCuratedCollectionStats *)self readAll:1];

  return PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = [v7 savedCollectionMuidsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOLogMsgEventCuratedCollectionStats addSavedCollectionMuids:](self, "addSavedCollectionMuids:", [v7 savedCollectionMuidsAtIndex:i]);
  }
}

@end