@interface PDDPStateChange
+ (Class)stateChangePayloadsType;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasObjectId;
- (BOOL)hasTargetClassId;
- (BOOL)hasTargetEntityName;
- (BOOL)hasTargetObjectId;
- (BOOL)hasTargetOwnerPersonId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)stateChangePayloads;
- (NSString)objectId;
- (NSString)targetClassId;
- (NSString)targetEntityName;
- (NSString)targetObjectId;
- (NSString)targetOwnerPersonId;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateChangePayloadsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)stateChangePayloadsCount;
- (void)addStateChangePayloads:(id)a3;
- (void)clearStateChangePayloads;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setStateChangePayloads:(id)a3;
- (void)setTargetClassId:(id)a3;
- (void)setTargetEntityName:(id)a3;
- (void)setTargetObjectId:(id)a3;
- (void)setTargetOwnerPersonId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStateChange

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasTargetObjectId
{
  return self->_targetObjectId != 0;
}

- (BOOL)hasTargetEntityName
{
  return self->_targetEntityName != 0;
}

- (BOOL)hasTargetClassId
{
  return self->_targetClassId != 0;
}

- (BOOL)hasTargetOwnerPersonId
{
  return self->_targetOwnerPersonId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (void)clearStateChangePayloads
{
}

- (void)addStateChangePayloads:(id)a3
{
  id v4 = a3;
  stateChangePayloads = self->_stateChangePayloads;
  id v8 = v4;
  if (!stateChangePayloads)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_stateChangePayloads;
    self->_stateChangePayloads = v6;

    id v4 = v8;
    stateChangePayloads = self->_stateChangePayloads;
  }
  [(NSMutableArray *)stateChangePayloads addObject:v4];
}

- (unint64_t)stateChangePayloadsCount
{
  return (unint64_t)[(NSMutableArray *)self->_stateChangePayloads count];
}

- (id)stateChangePayloadsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_stateChangePayloads objectAtIndex:a3];
}

+ (Class)stateChangePayloadsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStateChange;
  v3 = [(PDDPStateChange *)&v7 description];
  id v4 = [(PDDPStateChange *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  targetObjectId = self->_targetObjectId;
  if (targetObjectId) {
    [v4 setObject:targetObjectId forKey:@"target_object_id"];
  }
  targetEntityName = self->_targetEntityName;
  if (targetEntityName) {
    [v4 setObject:targetEntityName forKey:@"target_entity_name"];
  }
  targetClassId = self->_targetClassId;
  if (targetClassId) {
    [v4 setObject:targetClassId forKey:@"target_class_id"];
  }
  targetOwnerPersonId = self->_targetOwnerPersonId;
  if (targetOwnerPersonId) {
    [v4 setObject:targetOwnerPersonId forKey:@"target_owner_person_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v11 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v13 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"date_last_modified"];
  }
  if ([(NSMutableArray *)self->_stateChangePayloads count])
  {
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_stateChangePayloads, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_stateChangePayloads;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"state_change_payloads"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100163D6C((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_targetObjectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_targetEntityName) {
    PBDataWriterWriteStringField();
  }
  if (self->_targetClassId) {
    PBDataWriterWriteStringField();
  }
  if (self->_targetOwnerPersonId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_stateChangePayloads;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_objectId) {
    objc_msgSend(v8, "setObjectId:");
  }
  if (self->_targetObjectId) {
    objc_msgSend(v8, "setTargetObjectId:");
  }
  if (self->_targetEntityName) {
    objc_msgSend(v8, "setTargetEntityName:");
  }
  if (self->_targetClassId) {
    objc_msgSend(v8, "setTargetClassId:");
  }
  if (self->_targetOwnerPersonId) {
    objc_msgSend(v8, "setTargetOwnerPersonId:");
  }
  if (self->_dateCreated) {
    objc_msgSend(v8, "setDateCreated:");
  }
  if (self->_dateLastModified) {
    objc_msgSend(v8, "setDateLastModified:");
  }
  if ([(PDDPStateChange *)self stateChangePayloadsCount])
  {
    [v8 clearStateChangePayloads];
    unint64_t v4 = [(PDDPStateChange *)self stateChangePayloadsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PDDPStateChange *)self stateChangePayloadsAtIndex:i];
        [v8 addStateChangePayloads:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_targetObjectId copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(NSString *)self->_targetEntityName copyWithZone:a3];
  long long v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = [(NSString *)self->_targetClassId copyWithZone:a3];
  long long v13 = (void *)v5[5];
  v5[5] = v12;

  id v14 = [(NSString *)self->_targetOwnerPersonId copyWithZone:a3];
  v15 = (void *)v5[8];
  v5[8] = v14;

  id v16 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  id v17 = (void *)v5[1];
  v5[1] = v16;

  id v18 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v19 = (void *)v5[2];
  v5[2] = v18;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = self->_stateChangePayloads;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      long long v24 = 0;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v24), "copyWithZone:", a3, (void)v27);
        [v5 addStateChangePayloads:v25];

        long long v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((objectId = self->_objectId, !((unint64_t)objectId | v4[3]))
     || -[NSString isEqual:](objectId, "isEqual:"))
    && ((targetObjectId = self->_targetObjectId, !((unint64_t)targetObjectId | v4[7]))
     || -[NSString isEqual:](targetObjectId, "isEqual:"))
    && ((targetEntityName = self->_targetEntityName, !((unint64_t)targetEntityName | v4[6]))
     || -[NSString isEqual:](targetEntityName, "isEqual:"))
    && ((targetClassId = self->_targetClassId, !((unint64_t)targetClassId | v4[5]))
     || -[NSString isEqual:](targetClassId, "isEqual:"))
    && ((targetOwnerPersonId = self->_targetOwnerPersonId, !((unint64_t)targetOwnerPersonId | v4[8]))
     || -[NSString isEqual:](targetOwnerPersonId, "isEqual:"))
    && ((dateCreated = self->_dateCreated, !((unint64_t)dateCreated | v4[1]))
     || -[PDDPDate isEqual:](dateCreated, "isEqual:"))
    && ((dateLastModified = self->_dateLastModified, !((unint64_t)dateLastModified | v4[2]))
     || -[PDDPDate isEqual:](dateLastModified, "isEqual:")))
  {
    stateChangePayloads = self->_stateChangePayloads;
    if ((unint64_t)stateChangePayloads | v4[4]) {
      unsigned __int8 v13 = -[NSMutableArray isEqual:](stateChangePayloads, "isEqual:");
    }
    else {
      unsigned __int8 v13 = 1;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  unint64_t v4 = [(NSString *)self->_targetObjectId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_targetEntityName hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_targetClassId hash];
  NSUInteger v7 = [(NSString *)self->_targetOwnerPersonId hash];
  unint64_t v8 = v7 ^ [(PDDPDate *)self->_dateCreated hash];
  unint64_t v9 = v6 ^ v8 ^ [(PDDPDate *)self->_dateLastModified hash];
  return v9 ^ (unint64_t)[(NSMutableArray *)self->_stateChangePayloads hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[PDDPStateChange setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v4 + 7)) {
    -[PDDPStateChange setTargetObjectId:](self, "setTargetObjectId:");
  }
  if (*((void *)v4 + 6)) {
    -[PDDPStateChange setTargetEntityName:](self, "setTargetEntityName:");
  }
  if (*((void *)v4 + 5)) {
    -[PDDPStateChange setTargetClassId:](self, "setTargetClassId:");
  }
  if (*((void *)v4 + 8)) {
    -[PDDPStateChange setTargetOwnerPersonId:](self, "setTargetOwnerPersonId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 1);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPStateChange setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 2);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPStateChange setDateLastModified:](self, "setDateLastModified:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 4);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[PDDPStateChange addStateChangePayloads:](self, "addStateChangePayloads:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)targetObjectId
{
  return self->_targetObjectId;
}

- (void)setTargetObjectId:(id)a3
{
}

- (NSString)targetEntityName
{
  return self->_targetEntityName;
}

- (void)setTargetEntityName:(id)a3
{
}

- (NSString)targetClassId
{
  return self->_targetClassId;
}

- (void)setTargetClassId:(id)a3
{
}

- (NSString)targetOwnerPersonId
{
  return self->_targetOwnerPersonId;
}

- (void)setTargetOwnerPersonId:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (NSMutableArray)stateChangePayloads
{
  return self->_stateChangePayloads;
}

- (void)setStateChangePayloads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetOwnerPersonId, 0);
  objc_storeStrong((id *)&self->_targetObjectId, 0);
  objc_storeStrong((id *)&self->_targetEntityName, 0);
  objc_storeStrong((id *)&self->_targetClassId, 0);
  objc_storeStrong((id *)&self->_stateChangePayloads, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end