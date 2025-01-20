@interface HMDRemoteEventRouterProtoChangeRegistrationsMessage
+ (Class)topicAdditionsType;
+ (Class)topicFilterAdditionsType;
+ (Class)topicFilterRemovalsType;
+ (Class)topicRemovalsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)topicAdditions;
- (NSMutableArray)topicFilterAdditions;
- (NSMutableArray)topicFilterRemovals;
- (NSMutableArray)topicRemovals;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicAdditionsAtIndex:(unint64_t)a3;
- (id)topicFilterAdditionsAtIndex:(unint64_t)a3;
- (id)topicFilterRemovalsAtIndex:(unint64_t)a3;
- (id)topicRemovalsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topicAdditionsCount;
- (unint64_t)topicFilterAdditionsCount;
- (unint64_t)topicFilterRemovalsCount;
- (unint64_t)topicRemovalsCount;
- (void)addTopicAdditions:(id)a3;
- (void)addTopicFilterAdditions:(id)a3;
- (void)addTopicFilterRemovals:(id)a3;
- (void)addTopicRemovals:(id)a3;
- (void)clearTopicAdditions;
- (void)clearTopicFilterAdditions;
- (void)clearTopicFilterRemovals;
- (void)clearTopicRemovals;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTopicAdditions:(id)a3;
- (void)setTopicFilterAdditions:(id)a3;
- (void)setTopicFilterRemovals:(id)a3;
- (void)setTopicRemovals:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDRemoteEventRouterProtoChangeRegistrationsMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicRemovals, 0);
  objc_storeStrong((id *)&self->_topicFilterRemovals, 0);
  objc_storeStrong((id *)&self->_topicFilterAdditions, 0);
  objc_storeStrong((id *)&self->_topicAdditions, 0);
}

- (void)setTopicRemovals:(id)a3
{
}

- (NSMutableArray)topicRemovals
{
  return self->_topicRemovals;
}

- (void)setTopicAdditions:(id)a3
{
}

- (NSMutableArray)topicAdditions
{
  return self->_topicAdditions;
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
  uint64_t v45 = *MEMORY[0x263EF8340];
  v4 = (id *)a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self addTopicFilterAdditions:*(void *)(*((void *)&v37 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self addTopicFilterRemovals:*(void *)(*((void *)&v33 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v4[1];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self addTopicAdditions:*(void *)(*((void *)&v29 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v4[4];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage addTopicRemovals:](self, "addTopicRemovals:", *(void *)(*((void *)&v25 + 1) + 8 * v24++), (void)v25);
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_topicFilterAdditions hash];
  uint64_t v4 = [(NSMutableArray *)self->_topicFilterRemovals hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_topicAdditions hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_topicRemovals hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((topicFilterAdditions = self->_topicFilterAdditions, !((unint64_t)topicFilterAdditions | v4[2]))
     || -[NSMutableArray isEqual:](topicFilterAdditions, "isEqual:"))
    && ((topicFilterRemovals = self->_topicFilterRemovals, !((unint64_t)topicFilterRemovals | v4[3]))
     || -[NSMutableArray isEqual:](topicFilterRemovals, "isEqual:"))
    && ((topicAdditions = self->_topicAdditions, !((unint64_t)topicAdditions | v4[1]))
     || -[NSMutableArray isEqual:](topicAdditions, "isEqual:")))
  {
    topicRemovals = self->_topicRemovals;
    if ((unint64_t)topicRemovals | v4[4]) {
      char v9 = -[NSMutableArray isEqual:](topicRemovals, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v6 = self->_topicFilterAdditions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addTopicFilterAdditions:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v8);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v12 = self->_topicFilterRemovals;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addTopicFilterRemovals:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v14);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v18 = self->_topicAdditions;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addTopicAdditions:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v20);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v24 = self->_topicRemovals;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v28), "copyWithZone:", a3, (void)v31);
        [v5 addTopicRemovals:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v26);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if ([(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicFilterAdditionsCount])
  {
    [v20 clearTopicFilterAdditions];
    unint64_t v4 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicFilterAdditionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicFilterAdditionsAtIndex:i];
        [v20 addTopicFilterAdditions:v7];
      }
    }
  }
  if ([(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicFilterRemovalsCount])
  {
    [v20 clearTopicFilterRemovals];
    unint64_t v8 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicFilterRemovalsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicFilterRemovalsAtIndex:j];
        [v20 addTopicFilterRemovals:v11];
      }
    }
  }
  if ([(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicAdditionsCount])
  {
    [v20 clearTopicAdditions];
    unint64_t v12 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicAdditionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicAdditionsAtIndex:k];
        [v20 addTopicAdditions:v15];
      }
    }
  }
  if ([(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicRemovalsCount])
  {
    [v20 clearTopicRemovals];
    unint64_t v16 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicRemovalsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self topicRemovalsAtIndex:m];
        [v20 addTopicRemovals:v19];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  unint64_t v5 = self->_topicFilterAdditions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_topicFilterRemovals;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_topicAdditions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = self->_topicRemovals;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMDRemoteEventRouterProtoChangeRegistrationsMessageReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  topicFilterAdditions = self->_topicFilterAdditions;
  if (topicFilterAdditions) {
    [v3 setObject:topicFilterAdditions forKey:@"topicFilterAdditions"];
  }
  topicFilterRemovals = self->_topicFilterRemovals;
  if (topicFilterRemovals) {
    [v4 setObject:topicFilterRemovals forKey:@"topicFilterRemovals"];
  }
  if ([(NSMutableArray *)self->_topicAdditions count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicAdditions, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = self->_topicAdditions;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"topicAdditions"];
  }
  if ([(NSMutableArray *)self->_topicRemovals count])
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicRemovals, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v15 = self->_topicRemovals;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"topicRemovals"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoChangeRegistrationsMessage;
  id v4 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)&v8 description];
  unint64_t v5 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)topicRemovalsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicRemovals objectAtIndex:a3];
}

- (unint64_t)topicRemovalsCount
{
  return [(NSMutableArray *)self->_topicRemovals count];
}

- (void)addTopicRemovals:(id)a3
{
  id v4 = a3;
  topicRemovals = self->_topicRemovals;
  id v8 = v4;
  if (!topicRemovals)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_topicRemovals;
    self->_topicRemovals = v6;

    id v4 = v8;
    topicRemovals = self->_topicRemovals;
  }
  [(NSMutableArray *)topicRemovals addObject:v4];
}

- (void)clearTopicRemovals
{
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
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
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

+ (Class)topicRemovalsType
{
  return (Class)objc_opt_class();
}

+ (Class)topicAdditionsType
{
  return (Class)objc_opt_class();
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