@interface PDDPStateChangeParticipants
+ (Class)recipientGroupsType;
+ (Class)recipientPersonIdsType;
- (BOOL)hasRecipientPersonId;
- (BOOL)hasSenderPersonId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)recipientGroups;
- (NSMutableArray)recipientPersonIds;
- (NSString)recipientPersonId;
- (NSString)senderPersonId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recipientGroupsAtIndex:(unint64_t)a3;
- (id)recipientPersonIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)recipientGroupsCount;
- (unint64_t)recipientPersonIdsCount;
- (void)addRecipientGroups:(id)a3;
- (void)addRecipientPersonIds:(id)a3;
- (void)clearRecipientGroups;
- (void)clearRecipientPersonIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRecipientGroups:(id)a3;
- (void)setRecipientPersonId:(id)a3;
- (void)setRecipientPersonIds:(id)a3;
- (void)setSenderPersonId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStateChangeParticipants

- (BOOL)hasSenderPersonId
{
  return self->_senderPersonId != 0;
}

- (void)clearRecipientPersonIds
{
}

- (void)addRecipientPersonIds:(id)a3
{
  id v4 = a3;
  recipientPersonIds = self->_recipientPersonIds;
  id v8 = v4;
  if (!recipientPersonIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_recipientPersonIds;
    self->_recipientPersonIds = v6;

    id v4 = v8;
    recipientPersonIds = self->_recipientPersonIds;
  }
  [(NSMutableArray *)recipientPersonIds addObject:v4];
}

- (unint64_t)recipientPersonIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_recipientPersonIds count];
}

- (id)recipientPersonIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_recipientPersonIds objectAtIndex:a3];
}

+ (Class)recipientPersonIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearRecipientGroups
{
}

- (void)addRecipientGroups:(id)a3
{
  id v4 = a3;
  recipientGroups = self->_recipientGroups;
  id v8 = v4;
  if (!recipientGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_recipientGroups;
    self->_recipientGroups = v6;

    id v4 = v8;
    recipientGroups = self->_recipientGroups;
  }
  [(NSMutableArray *)recipientGroups addObject:v4];
}

- (unint64_t)recipientGroupsCount
{
  return (unint64_t)[(NSMutableArray *)self->_recipientGroups count];
}

- (id)recipientGroupsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_recipientGroups objectAtIndex:a3];
}

+ (Class)recipientGroupsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRecipientPersonId
{
  return self->_recipientPersonId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStateChangeParticipants;
  v3 = [(PDDPStateChangeParticipants *)&v7 description];
  id v4 = [(PDDPStateChangeParticipants *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  senderPersonId = self->_senderPersonId;
  if (senderPersonId) {
    [v3 setObject:senderPersonId forKey:@"sender_person_id"];
  }
  recipientPersonIds = self->_recipientPersonIds;
  if (recipientPersonIds) {
    [v4 setObject:recipientPersonIds forKey:@"recipient_person_ids"];
  }
  if ([(NSMutableArray *)self->_recipientGroups count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_recipientGroups, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = self->_recipientGroups;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"recipient_groups"];
  }
  recipientPersonId = self->_recipientPersonId;
  if (recipientPersonId) {
    [v4 setObject:recipientPersonId forKey:@"recipient_person_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000724CC((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_senderPersonId) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_recipientPersonIds;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_recipientGroups;
  uint64_t v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_recipientPersonId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_senderPersonId) {
    objc_msgSend(v12, "setSenderPersonId:");
  }
  if ([(PDDPStateChangeParticipants *)self recipientPersonIdsCount])
  {
    [v12 clearRecipientPersonIds];
    unint64_t v4 = [(PDDPStateChangeParticipants *)self recipientPersonIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(PDDPStateChangeParticipants *)self recipientPersonIdsAtIndex:i];
        [v12 addRecipientPersonIds:v7];
      }
    }
  }
  if ([(PDDPStateChangeParticipants *)self recipientGroupsCount])
  {
    [v12 clearRecipientGroups];
    unint64_t v8 = [(PDDPStateChangeParticipants *)self recipientGroupsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(PDDPStateChangeParticipants *)self recipientGroupsAtIndex:j];
        [v12 addRecipientGroups:v11];
      }
    }
  }
  if (self->_recipientPersonId) {
    objc_msgSend(v12, "setRecipientPersonId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_senderPersonId copyWithZone:a3];
  id v7 = (void *)v5[4];
  v5[4] = v6;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v8 = self->_recipientPersonIds;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addRecipientPersonIds:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = self->_recipientGroups;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      long long v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v18), "copyWithZone:", a3, (void)v23);
        [v5 addRecipientGroups:v19];

        long long v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  id v20 = [(NSString *)self->_recipientPersonId copyWithZone:a3];
  long long v21 = (void *)v5[2];
  v5[2] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((senderPersonId = self->_senderPersonId, !((unint64_t)senderPersonId | v4[4]))
     || -[NSString isEqual:](senderPersonId, "isEqual:"))
    && ((recipientPersonIds = self->_recipientPersonIds, !((unint64_t)recipientPersonIds | v4[3]))
     || -[NSMutableArray isEqual:](recipientPersonIds, "isEqual:"))
    && ((recipientGroups = self->_recipientGroups, !((unint64_t)recipientGroups | v4[1]))
     || -[NSMutableArray isEqual:](recipientGroups, "isEqual:")))
  {
    recipientPersonId = self->_recipientPersonId;
    if ((unint64_t)recipientPersonId | v4[2]) {
      unsigned __int8 v9 = -[NSString isEqual:](recipientPersonId, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_senderPersonId hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_recipientPersonIds hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_recipientGroups hash];
  return v4 ^ v5 ^ [(NSString *)self->_recipientPersonId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[PDDPStateChangeParticipants setSenderPersonId:](self, "setSenderPersonId:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 3);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PDDPStateChangeParticipants *)self addRecipientPersonIds:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 1);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PDDPStateChangeParticipants addRecipientGroups:](self, "addRecipientGroups:", *(void *)(*((void *)&v15 + 1) + 8 * (void)j), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 2)) {
    -[PDDPStateChangeParticipants setRecipientPersonId:](self, "setRecipientPersonId:");
  }
}

- (NSString)senderPersonId
{
  return self->_senderPersonId;
}

- (void)setSenderPersonId:(id)a3
{
}

- (NSMutableArray)recipientPersonIds
{
  return self->_recipientPersonIds;
}

- (void)setRecipientPersonIds:(id)a3
{
}

- (NSMutableArray)recipientGroups
{
  return self->_recipientGroups;
}

- (void)setRecipientGroups:(id)a3
{
}

- (NSString)recipientPersonId
{
  return self->_recipientPersonId;
}

- (void)setRecipientPersonId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderPersonId, 0);
  objc_storeStrong((id *)&self->_recipientPersonIds, 0);
  objc_storeStrong((id *)&self->_recipientPersonId, 0);

  objc_storeStrong((id *)&self->_recipientGroups, 0);
}

@end