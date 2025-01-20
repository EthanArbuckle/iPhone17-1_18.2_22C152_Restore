@interface ATXPBMinimalAction
- (BOOL)hasActionType;
- (BOOL)hasBundleId;
- (BOOL)hasParamHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionType;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)paramHash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionType:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasParamHash:(BOOL)a3;
- (void)setParamHash:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBMinimalAction

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasActionType
{
  return self->_actionType != 0;
}

- (void)setParamHash:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_paramHash = a3;
}

- (void)setHasParamHash:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParamHash
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBMinimalAction;
  v4 = [(ATXPBMinimalAction *)&v8 description];
  v5 = [(ATXPBMinimalAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  actionType = self->_actionType;
  if (actionType) {
    [v4 setObject:actionType forKey:@"actionType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_paramHash];
    [v4 setObject:v7 forKey:@"paramHash"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBMinimalActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFixed64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v5;
  }
  if (self->_actionType)
  {
    objc_msgSend(v5, "setActionType:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_paramHash;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_actionType copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_paramHash;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  actionType = self->_actionType;
  if ((unint64_t)actionType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionType, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_paramHash == *((void *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_actionType hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_paramHash;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  unint64_t v5 = v4;
  if (v4[3])
  {
    -[ATXPBMinimalAction setBundleId:](self, "setBundleId:");
    NSUInteger v4 = v5;
  }
  if (v4[2])
  {
    -[ATXPBMinimalAction setActionType:](self, "setActionType:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    self->_paramHash = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
}

- (unint64_t)paramHash
{
  return self->_paramHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

@end