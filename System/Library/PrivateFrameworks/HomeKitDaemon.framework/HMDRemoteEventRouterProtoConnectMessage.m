@interface HMDRemoteEventRouterProtoConnectMessage
+ (Class)topicAdditionsType;
+ (Class)topicFilterAdditionsType;
- (BOOL)hasConnectEvent;
- (BOOL)hasRouterVersion;
- (BOOL)hasUnregisterEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMEProtoEventInfo)connectEvent;
- (HMEProtoEventInfo)unregisterEvent;
- (NSMutableArray)topicAdditions;
- (NSMutableArray)topicFilterAdditions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicAdditionsAtIndex:(unint64_t)a3;
- (id)topicFilterAdditionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topicAdditionsCount;
- (unint64_t)topicFilterAdditionsCount;
- (unsigned)routerVersion;
- (void)addTopicAdditions:(id)a3;
- (void)addTopicFilterAdditions:(id)a3;
- (void)clearTopicAdditions;
- (void)clearTopicFilterAdditions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectEvent:(id)a3;
- (void)setHasRouterVersion:(BOOL)a3;
- (void)setRouterVersion:(unsigned int)a3;
- (void)setTopicAdditions:(id)a3;
- (void)setTopicFilterAdditions:(id)a3;
- (void)setUnregisterEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDRemoteEventRouterProtoConnectMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unregisterEvent, 0);
  objc_storeStrong((id *)&self->_topicFilterAdditions, 0);
  objc_storeStrong((id *)&self->_topicAdditions, 0);
  objc_storeStrong((id *)&self->_connectEvent, 0);
}

- (void)setTopicAdditions:(id)a3
{
}

- (NSMutableArray)topicAdditions
{
  return self->_topicAdditions;
}

- (void)setTopicFilterAdditions:(id)a3
{
}

- (NSMutableArray)topicFilterAdditions
{
  return self->_topicFilterAdditions;
}

- (void)setUnregisterEvent:(id)a3
{
}

- (HMEProtoEventInfo)unregisterEvent
{
  return self->_unregisterEvent;
}

- (void)setConnectEvent:(id)a3
{
}

- (HMEProtoEventInfo)connectEvent
{
  return self->_connectEvent;
}

- (unsigned)routerVersion
{
  return self->_routerVersion;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v5 = v4;
  if (v4[12])
  {
    self->_routerVersion = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  connectEvent = self->_connectEvent;
  uint64_t v7 = *((void *)v5 + 1);
  if (connectEvent)
  {
    if (v7) {
      -[HMEProtoEventInfo mergeFrom:](connectEvent, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[HMDRemoteEventRouterProtoConnectMessage setConnectEvent:](self, "setConnectEvent:");
  }
  unregisterEvent = self->_unregisterEvent;
  uint64_t v9 = *((void *)v5 + 5);
  if (unregisterEvent)
  {
    if (v9) {
      -[HMEProtoEventInfo mergeFrom:](unregisterEvent, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[HMDRemoteEventRouterProtoConnectMessage setUnregisterEvent:](self, "setUnregisterEvent:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v5 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(HMDRemoteEventRouterProtoConnectMessage *)self addTopicFilterAdditions:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v5 + 3);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[HMDRemoteEventRouterProtoConnectMessage addTopicAdditions:](self, "addTopicAdditions:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_routerVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(HMEProtoEventInfo *)self->_connectEvent hash] ^ v3;
  uint64_t v5 = [(HMEProtoEventInfo *)self->_unregisterEvent hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_topicFilterAdditions hash];
  return v6 ^ [(NSMutableArray *)self->_topicAdditions hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_routerVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  connectEvent = self->_connectEvent;
  if ((unint64_t)connectEvent | *((void *)v4 + 1)
    && !-[HMEProtoEventInfo isEqual:](connectEvent, "isEqual:"))
  {
    goto LABEL_15;
  }
  unregisterEvent = self->_unregisterEvent;
  if ((unint64_t)unregisterEvent | *((void *)v4 + 5))
  {
    if (!-[HMEProtoEventInfo isEqual:](unregisterEvent, "isEqual:")) {
      goto LABEL_15;
    }
  }
  topicFilterAdditions = self->_topicFilterAdditions;
  if ((unint64_t)topicFilterAdditions | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](topicFilterAdditions, "isEqual:")) {
      goto LABEL_15;
    }
  }
  topicAdditions = self->_topicAdditions;
  if ((unint64_t)topicAdditions | *((void *)v4 + 3)) {
    char v9 = -[NSMutableArray isEqual:](topicAdditions, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_routerVersion;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(HMEProtoEventInfo *)self->_connectEvent copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(HMEProtoEventInfo *)self->_unregisterEvent copyWithZone:a3];
  id v10 = (void *)v6[5];
  v6[5] = v9;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = self->_topicFilterAdditions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v15) copyWithZone:a3];
        [v6 addTopicFilterAdditions:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = self->_topicAdditions;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (void)v24);
        [v6 addTopicAdditions:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_routerVersion;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v13 = v4;
  if (self->_connectEvent) {
    objc_msgSend(v4, "setConnectEvent:");
  }
  if (self->_unregisterEvent) {
    objc_msgSend(v13, "setUnregisterEvent:");
  }
  if ([(HMDRemoteEventRouterProtoConnectMessage *)self topicFilterAdditionsCount])
  {
    [v13 clearTopicFilterAdditions];
    unint64_t v5 = [(HMDRemoteEventRouterProtoConnectMessage *)self topicFilterAdditionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        v8 = [(HMDRemoteEventRouterProtoConnectMessage *)self topicFilterAdditionsAtIndex:i];
        [v13 addTopicFilterAdditions:v8];
      }
    }
  }
  if ([(HMDRemoteEventRouterProtoConnectMessage *)self topicAdditionsCount])
  {
    [v13 clearTopicAdditions];
    unint64_t v9 = [(HMDRemoteEventRouterProtoConnectMessage *)self topicAdditionsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(HMDRemoteEventRouterProtoConnectMessage *)self topicAdditionsAtIndex:j];
        [v13 addTopicAdditions:v12];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_connectEvent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_unregisterEvent) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_topicFilterAdditions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v10 = self->_topicAdditions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMDRemoteEventRouterProtoConnectMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_routerVersion];
    [v3 setObject:v4 forKey:@"routerVersion"];
  }
  connectEvent = self->_connectEvent;
  if (connectEvent)
  {
    uint64_t v6 = [(HMEProtoEventInfo *)connectEvent dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"connectEvent"];
  }
  unregisterEvent = self->_unregisterEvent;
  if (unregisterEvent)
  {
    uint64_t v8 = [(HMEProtoEventInfo *)unregisterEvent dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"unregisterEvent"];
  }
  topicFilterAdditions = self->_topicFilterAdditions;
  if (topicFilterAdditions) {
    [v3 setObject:topicFilterAdditions forKey:@"topicFilterAdditions"];
  }
  if ([(NSMutableArray *)self->_topicAdditions count])
  {
    unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicAdditions, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = self->_topicAdditions;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"topicAdditions"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoConnectMessage;
  id v4 = [(HMDRemoteEventRouterProtoConnectMessage *)&v8 description];
  unint64_t v5 = [(HMDRemoteEventRouterProtoConnectMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)topicAdditionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicAdditions objectAtIndex:a3];
}

- (unint64_t)topicAdditionsCount
{
  return [(NSMutableArray *)self->_topicAdditions count];
}

- (void)addTopicAdditions:(id)a3
{
  id v4 = a3;
  topicAdditions = self->_topicAdditions;
  id v8 = v4;
  if (!topicAdditions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_topicAdditions;
    self->_topicAdditions = v6;

    id v4 = v8;
    topicAdditions = self->_topicAdditions;
  }
  [(NSMutableArray *)topicAdditions addObject:v4];
}

- (void)clearTopicAdditions
{
}

- (id)topicFilterAdditionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicFilterAdditions objectAtIndex:a3];
}

- (unint64_t)topicFilterAdditionsCount
{
  return [(NSMutableArray *)self->_topicFilterAdditions count];
}

- (void)addTopicFilterAdditions:(id)a3
{
  id v4 = a3;
  topicFilterAdditions = self->_topicFilterAdditions;
  id v8 = v4;
  if (!topicFilterAdditions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_topicFilterAdditions;
    self->_topicFilterAdditions = v6;

    id v4 = v8;
    topicFilterAdditions = self->_topicFilterAdditions;
  }
  [(NSMutableArray *)topicFilterAdditions addObject:v4];
}

- (void)clearTopicFilterAdditions
{
}

- (BOOL)hasUnregisterEvent
{
  return self->_unregisterEvent != 0;
}

- (BOOL)hasConnectEvent
{
  return self->_connectEvent != 0;
}

- (BOOL)hasRouterVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRouterVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRouterVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_routerVersion = a3;
}

+ (Class)topicAdditionsType
{
  return (Class)objc_opt_class();
}

+ (Class)topicFilterAdditionsType
{
  return (Class)objc_opt_class();
}

@end