@interface HMXPCEventRouterProtoChangeRegistrationsMessage
+ (Class)topicFilterAdditionsType;
+ (Class)topicFilterRemovalsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)topicFilterAdditions;
- (NSMutableArray)topicFilterRemovals;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicFilterAdditionsAtIndex:(unint64_t)a3;
- (id)topicFilterRemovalsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topicFilterAdditionsCount;
- (unint64_t)topicFilterRemovalsCount;
- (void)addTopicFilterAdditions:(id)a3;
- (void)addTopicFilterRemovals:(id)a3;
- (void)clearTopicFilterAdditions;
- (void)clearTopicFilterRemovals;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTopicFilterAdditions:(id)a3;
- (void)setTopicFilterRemovals:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMXPCEventRouterProtoChangeRegistrationsMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicFilterRemovals, 0);

  objc_storeStrong((id *)&self->_topicFilterAdditions, 0);
}

- (void)setTopicFilterRemovals:(id)a3
{
}

- (NSMutableArray)topicFilterRemovals
{
  return self->_topicFilterRemovals;
}

- (void)setTopicFilterAdditions:(id)a3
{
}

- (NSMutableArray)topicFilterAdditions
{
  return self->_topicFilterAdditions;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[1];
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
        [(HMXPCEventRouterProtoChangeRegistrationsMessage *)self addTopicFilterAdditions:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
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
  id v10 = v4[2];
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
        -[HMXPCEventRouterProtoChangeRegistrationsMessage addTopicFilterRemovals:](self, "addTopicFilterRemovals:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_topicFilterAdditions hash];
  return [(NSMutableArray *)self->_topicFilterRemovals hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((topicFilterAdditions = self->_topicFilterAdditions, !((unint64_t)topicFilterAdditions | v4[1]))
     || -[NSMutableArray isEqual:](topicFilterAdditions, "isEqual:")))
  {
    topicFilterRemovals = self->_topicFilterRemovals;
    if ((unint64_t)topicFilterRemovals | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](topicFilterRemovals, "isEqual:");
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
  uint64_t v6 = self->_topicFilterAdditions;
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
        [v5 addTopicFilterAdditions:v11];

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
  uint64_t v12 = self->_topicFilterRemovals;
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
        [v5 addTopicFilterRemovals:v17];

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
  if ([(HMXPCEventRouterProtoChangeRegistrationsMessage *)self topicFilterAdditionsCount])
  {
    [v12 clearTopicFilterAdditions];
    unint64_t v4 = [(HMXPCEventRouterProtoChangeRegistrationsMessage *)self topicFilterAdditionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMXPCEventRouterProtoChangeRegistrationsMessage *)self topicFilterAdditionsAtIndex:i];
        [v12 addTopicFilterAdditions:v7];
      }
    }
  }
  if ([(HMXPCEventRouterProtoChangeRegistrationsMessage *)self topicFilterRemovalsCount])
  {
    [v12 clearTopicFilterRemovals];
    unint64_t v8 = [(HMXPCEventRouterProtoChangeRegistrationsMessage *)self topicFilterRemovalsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HMXPCEventRouterProtoChangeRegistrationsMessage *)self topicFilterRemovalsAtIndex:j];
        [v12 addTopicFilterRemovals:v11];
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
  uint64_t v10 = self->_topicFilterRemovals;
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
        PBDataWriterWriteStringField();
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
  return HMXPCEventRouterProtoChangeRegistrationsMessageReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  topicFilterAdditions = self->_topicFilterAdditions;
  if (topicFilterAdditions) {
    [v3 setObject:topicFilterAdditions forKey:@"topicFilterAdditions"];
  }
  topicFilterRemovals = self->_topicFilterRemovals;
  if (topicFilterRemovals) {
    [v4 setObject:topicFilterRemovals forKey:@"topicFilterRemovals"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMXPCEventRouterProtoChangeRegistrationsMessage;
  id v4 = [(HMXPCEventRouterProtoChangeRegistrationsMessage *)&v8 description];
  unint64_t v5 = [(HMXPCEventRouterProtoChangeRegistrationsMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)topicFilterRemovalsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicFilterRemovals objectAtIndex:a3];
}

- (unint64_t)topicFilterRemovalsCount
{
  return [(NSMutableArray *)self->_topicFilterRemovals count];
}

- (void)addTopicFilterRemovals:(id)a3
{
  id v4 = a3;
  topicFilterRemovals = self->_topicFilterRemovals;
  id v8 = v4;
  if (!topicFilterRemovals)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_topicFilterRemovals;
    self->_topicFilterRemovals = v6;

    id v4 = v8;
    topicFilterRemovals = self->_topicFilterRemovals;
  }
  [(NSMutableArray *)topicFilterRemovals addObject:v4];
}

- (void)clearTopicFilterRemovals
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
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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

+ (Class)topicFilterRemovalsType
{
  return (Class)objc_opt_class();
}

+ (Class)topicFilterAdditionsType
{
  return (Class)objc_opt_class();
}

@end