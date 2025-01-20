@interface HMXPCEventRouterProtoEventsMessage
+ (Class)cachedEventsType;
+ (Class)eventsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cachedEvents;
- (NSMutableArray)events;
- (id)cachedEventsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventsAtIndex:(unint64_t)a3;
- (unint64_t)cachedEventsCount;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (void)addCachedEvents:(id)a3;
- (void)addEvents:(id)a3;
- (void)clearCachedEvents;
- (void)clearEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCachedEvents:(id)a3;
- (void)setEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMXPCEventRouterProtoEventsMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_cachedEvents, 0);
}

- (void)setCachedEvents:(id)a3
{
}

- (NSMutableArray)cachedEvents
{
  return self->_cachedEvents;
}

- (void)setEvents:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        [(HMXPCEventRouterProtoEventsMessage *)self addEvents:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
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
        -[HMXPCEventRouterProtoEventsMessage addCachedEvents:](self, "addCachedEvents:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_events hash];
  return [(NSMutableArray *)self->_cachedEvents hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((events = self->_events, !((unint64_t)events | v4[2]))
     || -[NSMutableArray isEqual:](events, "isEqual:")))
  {
    cachedEvents = self->_cachedEvents;
    if ((unint64_t)cachedEvents | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](cachedEvents, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_events;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addEvents:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_cachedEvents;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addCachedEvents:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(HMXPCEventRouterProtoEventsMessage *)self eventsCount])
  {
    [v12 clearEvents];
    unint64_t v4 = [(HMXPCEventRouterProtoEventsMessage *)self eventsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMXPCEventRouterProtoEventsMessage *)self eventsAtIndex:i];
        [v12 addEvents:v7];
      }
    }
  }
  if ([(HMXPCEventRouterProtoEventsMessage *)self cachedEventsCount])
  {
    [v12 clearCachedEvents];
    unint64_t v8 = [(HMXPCEventRouterProtoEventsMessage *)self cachedEventsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HMXPCEventRouterProtoEventsMessage *)self cachedEventsAtIndex:j];
        [v12 addCachedEvents:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = self->_events;
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
        PBDataWriterWriteSubmessage();
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
  uint64_t v10 = self->_cachedEvents;
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
  return HMXPCEventRouterProtoEventsMessageReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_events count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unint64_t v5 = self->_events;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"events"];
  }
  if ([(NSMutableArray *)self->_cachedEvents count])
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cachedEvents, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = self->_cachedEvents;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"cachedEvents"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMXPCEventRouterProtoEventsMessage;
  id v4 = [(HMXPCEventRouterProtoEventsMessage *)&v8 description];
  unint64_t v5 = [(HMXPCEventRouterProtoEventsMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)cachedEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cachedEvents objectAtIndex:a3];
}

- (unint64_t)cachedEventsCount
{
  return [(NSMutableArray *)self->_cachedEvents count];
}

- (void)addCachedEvents:(id)a3
{
  id v4 = a3;
  cachedEvents = self->_cachedEvents;
  id v8 = v4;
  if (!cachedEvents)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_cachedEvents;
    self->_cachedEvents = v6;

    id v4 = v8;
    cachedEvents = self->_cachedEvents;
  }
  [(NSMutableArray *)cachedEvents addObject:v4];
}

- (void)clearCachedEvents
{
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_events objectAtIndex:a3];
}

- (unint64_t)eventsCount
{
  return [(NSMutableArray *)self->_events count];
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (void)clearEvents
{
}

+ (Class)cachedEventsType
{
  return (Class)objc_opt_class();
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

@end