@interface HMPBMatterCommandAction
+ (Class)commandsType;
- (BOOL)enforceExecutionOrder;
- (BOOL)hasActionUUID;
- (BOOL)hasEnforceExecutionOrder;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)actionUUID;
- (NSMutableArray)commands;
- (id)commandsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)commandsCount;
- (unint64_t)hash;
- (void)addCommands:(id)a3;
- (void)clearCommands;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionUUID:(id)a3;
- (void)setCommands:(id)a3;
- (void)setEnforceExecutionOrder:(BOOL)a3;
- (void)setHasEnforceExecutionOrder:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBMatterCommandAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);

  objc_storeStrong((id *)&self->_actionUUID, 0);
}

- (BOOL)enforceExecutionOrder
{
  return self->_enforceExecutionOrder;
}

- (void)setCommands:(id)a3
{
}

- (NSMutableArray)commands
{
  return self->_commands;
}

- (void)setActionUUID:(id)a3
{
}

- (NSData)actionUUID
{
  return self->_actionUUID;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[HMPBMatterCommandAction setActionUUID:](self, "setActionUUID:");
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
        -[HMPBMatterCommandAction addCommands:](self, "addCommands:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 28))
  {
    self->_enforceExecutionOrder = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_actionUUID hash];
  uint64_t v4 = [(NSMutableArray *)self->_commands hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_enforceExecutionOrder;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  actionUUID = self->_actionUUID;
  if ((unint64_t)actionUUID | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](actionUUID, "isEqual:")) {
      goto LABEL_8;
    }
  }
  commands = self->_commands;
  if ((unint64_t)commands | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](commands, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_enforceExecutionOrder)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_actionUUID copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_commands;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [(id)v5 addCommands:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_enforceExecutionOrder;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  if (self->_actionUUID) {
    objc_msgSend(v8, "setActionUUID:");
  }
  if ([(HMPBMatterCommandAction *)self commandsCount])
  {
    [v8 clearCommands];
    unint64_t v4 = [(HMPBMatterCommandAction *)self commandsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        BOOL v7 = [(HMPBMatterCommandAction *)self commandsAtIndex:i];
        [v8 addCommands:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[24] = self->_enforceExecutionOrder;
    v8[28] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_actionUUID) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_commands;
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
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBMatterCommandActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  actionUUID = self->_actionUUID;
  if (actionUUID) {
    [v3 setObject:actionUUID forKey:@"actionUUID"];
  }
  if ([(NSMutableArray *)self->_commands count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_commands, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_commands;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"commands"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v13 = [NSNumber numberWithBool:self->_enforceExecutionOrder];
    [v4 setObject:v13 forKey:@"enforceExecutionOrder"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBMatterCommandAction;
  id v4 = [(HMPBMatterCommandAction *)&v8 description];
  unint64_t v5 = [(HMPBMatterCommandAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEnforceExecutionOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEnforceExecutionOrder:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEnforceExecutionOrder:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_enforceExecutionOrder = a3;
}

- (id)commandsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_commands objectAtIndex:a3];
}

- (unint64_t)commandsCount
{
  return [(NSMutableArray *)self->_commands count];
}

- (void)addCommands:(id)a3
{
  id v4 = a3;
  commands = self->_commands;
  id v8 = v4;
  if (!commands)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_commands;
    self->_commands = v6;

    id v4 = v8;
    commands = self->_commands;
  }
  [(NSMutableArray *)commands addObject:v4];
}

- (void)clearCommands
{
}

- (BOOL)hasActionUUID
{
  return self->_actionUUID != 0;
}

+ (Class)commandsType
{
  return (Class)objc_opt_class();
}

@end