@interface HMPBActionSet
+ (Class)actionsType;
- (BOOL)hasActionSetType;
- (BOOL)hasHomeUUID;
- (BOOL)hasName;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)homeUUID;
- (NSData)uuid;
- (NSMutableArray)actions;
- (NSString)actionSetType;
- (NSString)name;
- (id)actionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)actionsCount;
- (unint64_t)hash;
- (void)addActions:(id)a3;
- (void)clearActions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionSetType:(id)a3;
- (void)setActions:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBActionSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_actionSetType, 0);
}

- (void)setHomeUUID:(id)a3
{
}

- (NSData)homeUUID
{
  return self->_homeUUID;
}

- (void)setUuid:(id)a3
{
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setActionSetType:(id)a3
{
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (void)setActions:(id)a3
{
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[HMPBActionSet setName:](self, "setName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HMPBActionSet addActions:](self, "addActions:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 1)) {
    -[HMPBActionSet setActionSetType:](self, "setActionSetType:");
  }
  if (*((void *)v4 + 5)) {
    -[HMPBActionSet setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 3)) {
    -[HMPBActionSet setHomeUUID:](self, "setHomeUUID:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  uint64_t v4 = [(NSMutableArray *)self->_actions hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_actionSetType hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_uuid hash];
  return v6 ^ [(NSData *)self->_homeUUID hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[4])) || -[NSString isEqual:](name, "isEqual:"))
    && ((actions = self->_actions, !((unint64_t)actions | v4[2]))
     || -[NSMutableArray isEqual:](actions, "isEqual:"))
    && ((actionSetType = self->_actionSetType, !((unint64_t)actionSetType | v4[1]))
     || -[NSString isEqual:](actionSetType, "isEqual:"))
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[5])) || -[NSData isEqual:](uuid, "isEqual:")))
  {
    homeUUID = self->_homeUUID;
    if ((unint64_t)homeUUID | v4[3]) {
      char v10 = -[NSData isEqual:](homeUUID, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_actions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v12), "copyWithZone:", a3, (void)v21);
        [v5 addActions:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_actionSetType copyWithZone:a3];
  uint64_t v15 = (void *)v5[1];
  v5[1] = v14;

  uint64_t v16 = [(NSData *)self->_uuid copyWithZone:a3];
  v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSData *)self->_homeUUID copyWithZone:a3];
  v19 = (void *)v5[3];
  v5[3] = v18;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_name) {
    objc_msgSend(v9, "setName:");
  }
  if ([(HMPBActionSet *)self actionsCount])
  {
    [v9 clearActions];
    unint64_t v4 = [(HMPBActionSet *)self actionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMPBActionSet *)self actionsAtIndex:i];
        [v9 addActions:v7];
      }
    }
  }
  if (self->_actionSetType) {
    objc_msgSend(v9, "setActionSetType:");
  }
  uint64_t v8 = v9;
  if (self->_uuid)
  {
    objc_msgSend(v9, "setUuid:");
    uint64_t v8 = v9;
  }
  if (self->_homeUUID)
  {
    objc_msgSend(v9, "setHomeUUID:");
    uint64_t v8 = v9;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_actions;
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

  if (self->_actionSetType) {
    PBDataWriterWriteStringField();
  }
  if (self->_uuid) {
    PBDataWriterWriteDataField();
  }
  if (self->_homeUUID) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBActionSetReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if ([(NSMutableArray *)self->_actions count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_actions, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = self->_actions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"actions"];
  }
  actionSetType = self->_actionSetType;
  if (actionSetType) {
    [v4 setObject:actionSetType forKey:@"actionSetType"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v4 setObject:uuid forKey:@"uuid"];
  }
  homeUUID = self->_homeUUID;
  if (homeUUID) {
    [v4 setObject:homeUUID forKey:@"homeUUID"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBActionSet;
  id v4 = [(HMPBActionSet *)&v8 description];
  unint64_t v5 = [(HMPBActionSet *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasHomeUUID
{
  return self->_homeUUID != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasActionSetType
{
  return self->_actionSetType != 0;
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_actions objectAtIndex:a3];
}

- (unint64_t)actionsCount
{
  return [(NSMutableArray *)self->_actions count];
}

- (void)addActions:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v8 = v4;
  if (!actions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_actions;
    self->_actions = v6;

    id v4 = v8;
    actions = self->_actions;
  }
  [(NSMutableArray *)actions addObject:v4];
}

- (void)clearActions
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

+ (Class)actionsType
{
  return (Class)objc_opt_class();
}

@end