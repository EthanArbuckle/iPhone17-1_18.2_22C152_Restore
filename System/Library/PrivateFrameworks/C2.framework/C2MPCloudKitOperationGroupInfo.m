@interface C2MPCloudKitOperationGroupInfo
- (BOOL)hasOperationGroupId;
- (BOOL)hasOperationGroupName;
- (BOOL)hasOperationGroupTriggered;
- (BOOL)isEqual:(id)a3;
- (BOOL)operationGroupTriggered;
- (BOOL)readFrom:(id)a3;
- (NSString)operationGroupId;
- (NSString)operationGroupName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOperationGroupTriggered:(BOOL)a3;
- (void)setOperationGroupId:(id)a3;
- (void)setOperationGroupName:(id)a3;
- (void)setOperationGroupTriggered:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation C2MPCloudKitOperationGroupInfo

- (void)setOperationGroupTriggered:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_operationGroupTriggered = a3;
}

- (void)setOperationGroupName:(id)a3
{
}

- (void)setOperationGroupId:(id)a3
{
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  operationGroupId = self->_operationGroupId;
  if (operationGroupId) {
    [v3 setObject:operationGroupId forKey:@"operation_group_id"];
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName) {
    [v4 setObject:operationGroupName forKey:@"operation_group_name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_operationGroupTriggered];
    [v4 setObject:v7 forKey:@"operation_group_triggered"];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_operationGroupId, 0);
}

- (BOOL)hasOperationGroupId
{
  return self->_operationGroupId != 0;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0;
}

- (void)setHasOperationGroupTriggered:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperationGroupTriggered
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)C2MPCloudKitOperationGroupInfo;
  v4 = [(C2MPCloudKitOperationGroupInfo *)&v8 description];
  v5 = [(C2MPCloudKitOperationGroupInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPCloudKitOperationGroupInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_operationGroupId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_operationGroupName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_operationGroupId)
  {
    objc_msgSend(v4, "setOperationGroupId:");
    id v4 = v5;
  }
  if (self->_operationGroupName)
  {
    objc_msgSend(v5, "setOperationGroupName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_operationGroupTriggered;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_operationGroupId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_operationGroupName copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_operationGroupTriggered;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  operationGroupId = self->_operationGroupId;
  if ((unint64_t)operationGroupId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](operationGroupId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  operationGroupName = self->_operationGroupName;
  if ((unint64_t)operationGroupName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](operationGroupName, "isEqual:")) {
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
    if (self->_operationGroupTriggered)
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_operationGroupId hash];
  NSUInteger v4 = [(NSString *)self->_operationGroupName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_operationGroupTriggered;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[C2MPCloudKitOperationGroupInfo setOperationGroupId:](self, "setOperationGroupId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[C2MPCloudKitOperationGroupInfo setOperationGroupName:](self, "setOperationGroupName:");
    NSUInteger v4 = v5;
  }
  if (v4[28])
  {
    self->_operationGroupTriggered = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)operationGroupId
{
  return self->_operationGroupId;
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (BOOL)operationGroupTriggered
{
  return self->_operationGroupTriggered;
}

@end