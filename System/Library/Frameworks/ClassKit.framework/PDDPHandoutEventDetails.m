@interface PDDPHandoutEventDetails
+ (Class)attachmentDetailsType;
+ (Class)recipientIdsType;
- (BOOL)hasClassId;
- (BOOL)hasDueDate;
- (BOOL)hasHandoutId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)attachmentDetails;
- (NSMutableArray)recipientIds;
- (NSString)classId;
- (NSString)handoutId;
- (PDDPDate)dueDate;
- (id)attachmentDetailsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recipientIdsAtIndex:(unint64_t)a3;
- (unint64_t)attachmentDetailsCount;
- (unint64_t)hash;
- (unint64_t)recipientIdsCount;
- (void)addAttachmentDetails:(id)a3;
- (void)addRecipientIds:(id)a3;
- (void)clearAttachmentDetails;
- (void)clearRecipientIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentDetails:(id)a3;
- (void)setClassId:(id)a3;
- (void)setDueDate:(id)a3;
- (void)setHandoutId:(id)a3;
- (void)setRecipientIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPHandoutEventDetails

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasHandoutId
{
  return self->_handoutId != 0;
}

- (void)clearAttachmentDetails
{
}

- (void)addAttachmentDetails:(id)a3
{
  id v4 = a3;
  attachmentDetails = self->_attachmentDetails;
  id v8 = v4;
  if (!attachmentDetails)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_attachmentDetails;
    self->_attachmentDetails = v6;

    id v4 = v8;
    attachmentDetails = self->_attachmentDetails;
  }
  [(NSMutableArray *)attachmentDetails addObject:v4];
}

- (unint64_t)attachmentDetailsCount
{
  return (unint64_t)[(NSMutableArray *)self->_attachmentDetails count];
}

- (id)attachmentDetailsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_attachmentDetails objectAtIndex:a3];
}

+ (Class)attachmentDetailsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDueDate
{
  return self->_dueDate != 0;
}

- (void)clearRecipientIds
{
}

- (void)addRecipientIds:(id)a3
{
  id v4 = a3;
  recipientIds = self->_recipientIds;
  id v8 = v4;
  if (!recipientIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_recipientIds;
    self->_recipientIds = v6;

    id v4 = v8;
    recipientIds = self->_recipientIds;
  }
  [(NSMutableArray *)recipientIds addObject:v4];
}

- (unint64_t)recipientIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_recipientIds count];
}

- (id)recipientIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_recipientIds objectAtIndex:a3];
}

+ (Class)recipientIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPHandoutEventDetails;
  v3 = [(PDDPHandoutEventDetails *)&v7 description];
  id v4 = [(PDDPHandoutEventDetails *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  classId = self->_classId;
  if (classId) {
    [v3 setObject:classId forKey:@"class_id"];
  }
  handoutId = self->_handoutId;
  if (handoutId) {
    [v4 setObject:handoutId forKey:@"handout_id"];
  }
  if ([(NSMutableArray *)self->_attachmentDetails count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_attachmentDetails, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = self->_attachmentDetails;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"attachment_details"];
  }
  dueDate = self->_dueDate;
  if (dueDate)
  {
    v15 = [(PDDPDate *)dueDate dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"due_date"];
  }
  recipientIds = self->_recipientIds;
  if (recipientIds) {
    [v4 setObject:recipientIds forKey:@"recipient_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B9D1C((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_classId) {
    PBDataWriterWriteStringField();
  }
  if (self->_handoutId) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_attachmentDetails;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_dueDate) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_recipientIds;
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
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_classId) {
    objc_msgSend(v12, "setClassId:");
  }
  if (self->_handoutId) {
    objc_msgSend(v12, "setHandoutId:");
  }
  if ([(PDDPHandoutEventDetails *)self attachmentDetailsCount])
  {
    [v12 clearAttachmentDetails];
    unint64_t v4 = [(PDDPHandoutEventDetails *)self attachmentDetailsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(PDDPHandoutEventDetails *)self attachmentDetailsAtIndex:i];
        [v12 addAttachmentDetails:v7];
      }
    }
  }
  if (self->_dueDate) {
    objc_msgSend(v12, "setDueDate:");
  }
  if ([(PDDPHandoutEventDetails *)self recipientIdsCount])
  {
    [v12 clearRecipientIds];
    unint64_t v8 = [(PDDPHandoutEventDetails *)self recipientIdsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(PDDPHandoutEventDetails *)self recipientIdsAtIndex:j];
        [v12 addRecipientIds:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_classId copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_handoutId copyWithZone:a3];
  unint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = self->_attachmentDetails;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v14) copyWithZone:a3];
        [v5 addAttachmentDetails:v15];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  id v16 = [(PDDPDate *)self->_dueDate copyWithZone:a3];
  long long v17 = (void *)v5[3];
  v5[3] = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_recipientIds;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      long long v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)v22), "copyWithZone:", a3, (void)v25);
        [v5 addRecipientIds:v23];

        long long v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((classId = self->_classId, !((unint64_t)classId | v4[2]))
     || -[NSString isEqual:](classId, "isEqual:"))
    && ((handoutId = self->_handoutId, !((unint64_t)handoutId | v4[4]))
     || -[NSString isEqual:](handoutId, "isEqual:"))
    && ((attachmentDetails = self->_attachmentDetails, !((unint64_t)attachmentDetails | v4[1]))
     || -[NSMutableArray isEqual:](attachmentDetails, "isEqual:"))
    && ((dueDate = self->_dueDate, !((unint64_t)dueDate | v4[3])) || -[PDDPDate isEqual:](dueDate, "isEqual:")))
  {
    recipientIds = self->_recipientIds;
    if ((unint64_t)recipientIds | v4[5]) {
      unsigned __int8 v10 = -[NSMutableArray isEqual:](recipientIds, "isEqual:");
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_classId hash];
  unint64_t v4 = [(NSString *)self->_handoutId hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_attachmentDetails hash];
  unint64_t v6 = v4 ^ v5 ^ [(PDDPDate *)self->_dueDate hash];
  return v6 ^ (unint64_t)[(NSMutableArray *)self->_recipientIds hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[PDDPHandoutEventDetails setClassId:](self, "setClassId:");
  }
  if (*((void *)v4 + 4)) {
    [(PDDPHandoutEventDetails *)self setHandoutId:"setHandoutId:"];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PDDPHandoutEventDetails *)self addAttachmentDetails:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  dueDate = self->_dueDate;
  uint64_t v11 = *((void *)v4 + 3);
  if (dueDate)
  {
    if (v11) {
      -[PDDPDate mergeFrom:](dueDate, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PDDPHandoutEventDetails setDueDate:](self, "setDueDate:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 5);
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[PDDPHandoutEventDetails addRecipientIds:](self, "addRecipientIds:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j), (void)v17);
      }
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (NSString)handoutId
{
  return self->_handoutId;
}

- (void)setHandoutId:(id)a3
{
}

- (NSMutableArray)attachmentDetails
{
  return self->_attachmentDetails;
}

- (void)setAttachmentDetails:(id)a3
{
}

- (PDDPDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
}

- (NSMutableArray)recipientIds
{
  return self->_recipientIds;
}

- (void)setRecipientIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientIds, 0);
  objc_storeStrong((id *)&self->_handoutId, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_classId, 0);

  objc_storeStrong((id *)&self->_attachmentDetails, 0);
}

@end