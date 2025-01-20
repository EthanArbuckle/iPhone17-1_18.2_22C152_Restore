@interface HMDRemoteEventRouterProtoFetchEventsMessage
+ (Class)topicsType;
- (BOOL)hasFetchType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)topics;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fetchTypeAsString:(int)a3;
- (id)topicsAtIndex:(unint64_t)a3;
- (int)StringAsFetchType:(id)a3;
- (int)fetchType;
- (unint64_t)hash;
- (unint64_t)topicsCount;
- (void)addTopics:(id)a3;
- (void)clearTopics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFetchType:(int)a3;
- (void)setHasFetchType:(BOOL)a3;
- (void)setTopics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDRemoteEventRouterProtoFetchEventsMessage

- (void).cxx_destruct
{
}

- (void)setTopics:(id)a3
{
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HMDRemoteEventRouterProtoFetchEventsMessage addTopics:](self, "addTopics:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 24))
  {
    self->_fetchType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_topics hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_fetchType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  topics = self->_topics;
  if ((unint64_t)topics | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](topics, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_fetchType == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = self->_topics;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addTopics:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_fetchType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(HMDRemoteEventRouterProtoFetchEventsMessage *)self topicsCount])
  {
    [v8 clearTopics];
    unint64_t v4 = [(HMDRemoteEventRouterProtoFetchEventsMessage *)self topicsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMDRemoteEventRouterProtoFetchEventsMessage *)self topicsAtIndex:i];
        [v8 addTopics:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 2) = self->_fetchType;
    *((unsigned char *)v8 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_topics;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMDRemoteEventRouterProtoFetchEventsMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_topics count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v5 = self->_topics;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"topics"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int fetchType = self->_fetchType;
    if (fetchType)
    {
      if (fetchType == 1)
      {
        long long v12 = @"MultiHop";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fetchType);
        long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      long long v12 = @"SingleHop";
    }
    [v3 setObject:v12 forKey:@"fetchType"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoFetchEventsMessage;
  id v4 = [(HMDRemoteEventRouterProtoFetchEventsMessage *)&v8 description];
  unint64_t v5 = [(HMDRemoteEventRouterProtoFetchEventsMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsFetchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SingleHop"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"MultiHop"];
  }

  return v4;
}

- (id)fetchTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"MultiHop";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"SingleHop";
  }
  return v4;
}

- (BOOL)hasFetchType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasFetchType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setFetchType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int fetchType = a3;
}

- (int)fetchType
{
  if (*(unsigned char *)&self->_has) {
    return self->_fetchType;
  }
  else {
    return 0;
  }
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topics objectAtIndex:a3];
}

- (unint64_t)topicsCount
{
  return [(NSMutableArray *)self->_topics count];
}

- (void)addTopics:(id)a3
{
  id v4 = a3;
  topics = self->_topics;
  id v8 = v4;
  if (!topics)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_topics;
    self->_topics = v6;

    id v4 = v8;
    topics = self->_topics;
  }
  [(NSMutableArray *)topics addObject:v4];
}

- (void)clearTopics
{
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

@end