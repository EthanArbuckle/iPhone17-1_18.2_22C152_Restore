@interface MSPTransitStorageIncidentEntity
- (BOOL)hasMuid;
- (BOOL)hasNextStopIDs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPTransitStorageIncidentEntity)initWithIncidentEntity:(id)a3;
- (NSSet)nextStopIDs;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (unint64_t)nextStopsMuids;
- (unint64_t)nextStopsMuidsAtIndex:(unint64_t)a3;
- (unint64_t)nextStopsMuidsCount;
- (void)addNextStopsMuids:(unint64_t)a3;
- (void)clearNextStopsMuids;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setNextStopsMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageIncidentEntity

- (MSPTransitStorageIncidentEntity)initWithIncidentEntity:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSPTransitStorageIncidentEntity;
  v5 = [(MSPTransitStorageIncidentEntity *)&v16 init];
  if (v5)
  {
    -[MSPTransitStorageIncidentEntity setMuid:](v5, "setMuid:", [v4 muid]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = objc_msgSend(v4, "nextStopIDs", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[MSPTransitStorageIncidentEntity addNextStopsMuids:](v5, "addNextStopsMuids:", [*(id *)(*((void *)&v12 + 1) + 8 * v10++) unsignedLongLongValue]);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (NSSet)nextStopIDs
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MSPTransitStorageIncidentEntity nextStopsMuidsCount](self, "nextStopsMuidsCount"));
  if ([(MSPTransitStorageIncidentEntity *)self nextStopsMuidsCount])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MSPTransitStorageIncidentEntity nextStopsMuidsAtIndex:](self, "nextStopsMuidsAtIndex:", v4));
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(MSPTransitStorageIncidentEntity *)self nextStopsMuidsCount]);
  }

  return (NSSet *)v3;
}

- (BOOL)hasNextStopIDs
{
  return [(MSPTransitStorageIncidentEntity *)self nextStopsMuidsCount] != 0;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)MSPTransitStorageIncidentEntity;
  [(MSPTransitStorageIncidentEntity *)&v3 dealloc];
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)nextStopsMuidsCount
{
  return self->_nextStopsMuids.count;
}

- (unint64_t)nextStopsMuids
{
  return self->_nextStopsMuids.list;
}

- (void)clearNextStopsMuids
{
}

- (void)addNextStopsMuids:(unint64_t)a3
{
}

- (unint64_t)nextStopsMuidsAtIndex:(unint64_t)a3
{
  p_nextStopsMuids = &self->_nextStopsMuids;
  unint64_t count = self->_nextStopsMuids.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    uint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_nextStopsMuids->list[a3];
}

- (void)setNextStopsMuids:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (NSString)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageIncidentEntity;
  unint64_t v4 = [(MSPTransitStorageIncidentEntity *)&v8 description];
  v5 = [(MSPTransitStorageIncidentEntity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = [NSNumber numberWithUnsignedLongLong:self->_muid];
    [v3 setObject:v4 forKey:@"muid"];
  }
  v5 = PBRepeatedUInt64NSArray();
  [v3 setObject:v5 forKey:@"next_stops_muids"];

  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    uint64_t v7 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageIncidentEntityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_nextStopsMuids.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_nextStopsMuids.count);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[5] = self->_muid;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v8 = v4;
  if ([(MSPTransitStorageIncidentEntity *)self nextStopsMuidsCount])
  {
    [v8 clearNextStopsMuids];
    unint64_t v5 = [(MSPTransitStorageIncidentEntity *)self nextStopsMuidsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addNextStopsMuids:", -[MSPTransitStorageIncidentEntity nextStopsMuidsAtIndex:](self, "nextStopsMuidsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (id *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 40) = self->_muid;
    *(unsigned char *)(v4 + 48) |= 1u;
  }
  PBRepeatedUInt64Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_muid != *((void *)v4 + 5)) {
      goto LABEL_8;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }
  char IsEqual = PBRepeatedUInt64IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v2 = 0;
  }
  return PBRepeatedUInt64Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_muid = v4[5];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v8 = v4;
  uint64_t v5 = [v4 nextStopsMuidsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[MSPTransitStorageIncidentEntity addNextStopsMuids:](self, "addNextStopsMuids:", [v8 nextStopsMuidsAtIndex:i]);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void).cxx_destruct
{
}

@end