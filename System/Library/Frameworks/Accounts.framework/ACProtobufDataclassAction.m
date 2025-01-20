@interface ACProtobufDataclassAction
+ (Class)affectedContainersType;
- (BOOL)destructive;
- (BOOL)hasUndoAlertMessage;
- (BOOL)hasUndoAlertTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)affectedContainers;
- (NSString)undoAlertMessage;
- (NSString)undoAlertTitle;
- (id)affectedContainersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)affectedContainersCount;
- (unint64_t)hash;
- (void)addAffectedContainers:(id)a3;
- (void)clearAffectedContainers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAffectedContainers:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setUndoAlertMessage:(id)a3;
- (void)setUndoAlertTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufDataclassAction

- (void)clearAffectedContainers
{
}

- (void)addAffectedContainers:(id)a3
{
  id v4 = a3;
  affectedContainers = self->_affectedContainers;
  id v8 = v4;
  if (!affectedContainers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_affectedContainers;
    self->_affectedContainers = v6;

    id v4 = v8;
    affectedContainers = self->_affectedContainers;
  }
  [(NSMutableArray *)affectedContainers addObject:v4];
}

- (unint64_t)affectedContainersCount
{
  return [(NSMutableArray *)self->_affectedContainers count];
}

- (id)affectedContainersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_affectedContainers objectAtIndex:a3];
}

+ (Class)affectedContainersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUndoAlertTitle
{
  return self->_undoAlertTitle != 0;
}

- (BOOL)hasUndoAlertMessage
{
  return self->_undoAlertMessage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufDataclassAction;
  id v4 = [(ACProtobufDataclassAction *)&v8 description];
  v5 = [(ACProtobufDataclassAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithInt:self->_type];
  [v3 setObject:v4 forKey:@"type"];

  v5 = [NSNumber numberWithBool:self->_destructive];
  [v3 setObject:v5 forKey:@"destructive"];

  affectedContainers = self->_affectedContainers;
  if (affectedContainers) {
    [v3 setObject:affectedContainers forKey:@"affectedContainers"];
  }
  undoAlertTitle = self->_undoAlertTitle;
  if (undoAlertTitle) {
    [v3 setObject:undoAlertTitle forKey:@"undoAlertTitle"];
  }
  undoAlertMessage = self->_undoAlertMessage;
  if (undoAlertMessage) {
    [v3 setObject:undoAlertMessage forKey:@"undoAlertMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufDataclassActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_affectedContainers;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_undoAlertTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_undoAlertMessage) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[4] = self->_type;
  id v10 = v4;
  *((unsigned char *)v4 + 40) = self->_destructive;
  if ([(ACProtobufDataclassAction *)self affectedContainersCount])
  {
    [v10 clearAffectedContainers];
    unint64_t v5 = [(ACProtobufDataclassAction *)self affectedContainersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ACProtobufDataclassAction *)self affectedContainersAtIndex:i];
        [v10 addAffectedContainers:v8];
      }
    }
  }
  if (self->_undoAlertTitle) {
    objc_msgSend(v10, "setUndoAlertTitle:");
  }
  uint64_t v9 = v10;
  if (self->_undoAlertMessage)
  {
    objc_msgSend(v10, "setUndoAlertMessage:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_type;
  *(unsigned char *)(v5 + 40) = self->_destructive;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v6 = self->_affectedContainers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [(id)v5 addAffectedContainers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_undoAlertTitle copyWithZone:a3];
  long long v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_undoAlertMessage copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_type != *((_DWORD *)v4 + 4)) {
    goto LABEL_13;
  }
  if (self->_destructive)
  {
    if (!*((unsigned char *)v4 + 40)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  affectedContainers = self->_affectedContainers;
  if ((unint64_t)affectedContainers | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](affectedContainers, "isEqual:"))
  {
    goto LABEL_13;
  }
  undoAlertTitle = self->_undoAlertTitle;
  if ((unint64_t)undoAlertTitle | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](undoAlertTitle, "isEqual:")) {
      goto LABEL_13;
    }
  }
  undoAlertMessage = self->_undoAlertMessage;
  if ((unint64_t)undoAlertMessage | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](undoAlertMessage, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_type;
  uint64_t v4 = 2654435761 * self->_destructive;
  uint64_t v5 = v4 ^ [(NSMutableArray *)self->_affectedContainers hash] ^ v3;
  NSUInteger v6 = [(NSString *)self->_undoAlertTitle hash];
  return v5 ^ v6 ^ [(NSString *)self->_undoAlertMessage hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_type = *((_DWORD *)v4 + 4);
  self->_destructive = *((unsigned char *)v4 + 40);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[ACProtobufDataclassAction addAffectedContainers:](self, "addAffectedContainers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 4)) {
    -[ACProtobufDataclassAction setUndoAlertTitle:](self, "setUndoAlertTitle:");
  }
  if (*((void *)v4 + 3)) {
    -[ACProtobufDataclassAction setUndoAlertMessage:](self, "setUndoAlertMessage:");
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (NSMutableArray)affectedContainers
{
  return self->_affectedContainers;
}

- (void)setAffectedContainers:(id)a3
{
}

- (NSString)undoAlertTitle
{
  return self->_undoAlertTitle;
}

- (void)setUndoAlertTitle:(id)a3
{
}

- (NSString)undoAlertMessage
{
  return self->_undoAlertMessage;
}

- (void)setUndoAlertMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoAlertTitle, 0);
  objc_storeStrong((id *)&self->_undoAlertMessage, 0);

  objc_storeStrong((id *)&self->_affectedContainers, 0);
}

@end