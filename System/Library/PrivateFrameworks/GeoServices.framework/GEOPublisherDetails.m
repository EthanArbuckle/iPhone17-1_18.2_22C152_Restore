@interface GEOPublisherDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)currentlyFollowing;
- (BOOL)hasCurrentlyFollowing;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPublisherDetails)initWithDictionary:(id)a3;
- (GEOPublisherDetails)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)publisherIdAtIndex:(unint64_t)a3;
- (unint64_t)publisherIds;
- (unint64_t)publisherIdsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addPublisherId:(unint64_t)a3;
- (void)clearPublisherIds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCurrentlyFollowing:(BOOL)a3;
- (void)setHasCurrentlyFollowing:(BOOL)a3;
- (void)setPublisherIds:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOPublisherDetails

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPublisherDetails;
  [(GEOPublisherDetails *)&v3 dealloc];
}

- (unint64_t)publisherIdsCount
{
  return self->_publisherIds.count;
}

- (unint64_t)publisherIds
{
  return self->_publisherIds.list;
}

- (void)clearPublisherIds
{
}

- (void)addPublisherId:(unint64_t)a3
{
}

- (unint64_t)publisherIdAtIndex:(unint64_t)a3
{
  p_publisherIds = &self->_publisherIds;
  unint64_t count = self->_publisherIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_publisherIds->list[a3];
}

- (void)setPublisherIds:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (BOOL)currentlyFollowing
{
  return self->_currentlyFollowing;
}

- (void)setCurrentlyFollowing:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_currentlyFollowing = a3;
}

- (void)setHasCurrentlyFollowing:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCurrentlyFollowing
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPublisherDetails;
  v4 = [(GEOPublisherDetails *)&v8 description];
  v5 = [(GEOPublisherDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPublisherDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 16))
    {
      v5 = PBRepeatedUInt64NSArray();
      if (a2) {
        v6 = @"publisherId";
      }
      else {
        v6 = @"publisher_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(unsigned char *)(a1 + 36))
    {
      uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
      if (a2) {
        objc_super v8 = @"currentlyFollowing";
      }
      else {
        objc_super v8 = @"currently_following";
      }
      [v4 setObject:v7 forKey:v8];
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
  return -[GEOPublisherDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPublisherDetails)initWithDictionary:(id)a3
{
  return (GEOPublisherDetails *)-[GEOPublisherDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"publisherId";
      }
      else {
        v6 = @"publisher_id";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addPublisherId:", objc_msgSend(v13, "unsignedLongLongValue", (void)v17));
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v14 = @"currentlyFollowing";
      }
      else {
        v14 = @"currently_following";
      }
      v15 = objc_msgSend(v5, "objectForKeyedSubscript:", v14, (void)v17);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCurrentlyFollowing:", objc_msgSend(v15, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPublisherDetails)initWithJSON:(id)a3
{
  return (GEOPublisherDetails *)-[GEOPublisherDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPublisherDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPublisherDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_publisherIds.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_publisherIds.count);
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v7 = a3;
  [(GEOPublisherDetails *)self readAll:0];
  if ([(GEOPublisherDetails *)self publisherIdsCount])
  {
    [v7 clearPublisherIds];
    unint64_t v4 = [(GEOPublisherDetails *)self publisherIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPublisherId:", -[GEOPublisherDetails publisherIdAtIndex:](self, "publisherIdAtIndex:", i));
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v7[32] = self->_currentlyFollowing;
    v7[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  if (*(unsigned char *)&self->_flags)
  {
    v4[32] = self->_currentlyFollowing;
    v4[36] |= 1u;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_5;
  }
  [(GEOPublisherDetails *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_5;
  }
  BOOL v5 = (v4[36] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[36] & 1) == 0)
    {
LABEL_5:
      BOOL v5 = 0;
      goto LABEL_6;
    }
    if (self->_currentlyFollowing)
    {
      if (!v4[32]) {
        goto LABEL_5;
      }
    }
    else if (v4[32])
    {
      goto LABEL_5;
    }
    BOOL v5 = 1;
  }
LABEL_6:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPublisherDetails *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt64Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_currentlyFollowing;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v7 = (BOOL *)a3;
  [v7 readAll:0];
  uint64_t v4 = [v7 publisherIdsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOPublisherDetails addPublisherId:](self, "addPublisherId:", [v7 publisherIdAtIndex:i]);
  }
  if (v7[36])
  {
    self->_currentlyFollowing = v7[32];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end