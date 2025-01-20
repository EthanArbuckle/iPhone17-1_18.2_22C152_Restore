@interface ATXAnchorModelPBActionKeyMetadata
- (ATXAnchorModelPBLaunchHistoryMetadata)actionKeyLaunchHistory;
- (BOOL)hasActionKeyLaunchHistory;
- (BOOL)hasActionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionKeyLaunchHistory:(id)a3;
- (void)setActionType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBActionKeyMetadata

- (BOOL)hasActionType
{
  return self->_actionType != 0;
}

- (BOOL)hasActionKeyLaunchHistory
{
  return self->_actionKeyLaunchHistory != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXAnchorModelPBActionKeyMetadata;
  v4 = [(ATXAnchorModelPBActionKeyMetadata *)&v8 description];
  v5 = [(ATXAnchorModelPBActionKeyMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  actionType = self->_actionType;
  if (actionType) {
    [v3 setObject:actionType forKey:@"actionType"];
  }
  actionKeyLaunchHistory = self->_actionKeyLaunchHistory;
  if (actionKeyLaunchHistory)
  {
    v7 = [(ATXAnchorModelPBLaunchHistoryMetadata *)actionKeyLaunchHistory dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"actionKeyLaunchHistory"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBActionKeyMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_actionType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionKeyLaunchHistory)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_actionType)
  {
    objc_msgSend(v4, "setActionType:");
    id v4 = v5;
  }
  if (self->_actionKeyLaunchHistory)
  {
    objc_msgSend(v5, "setActionKeyLaunchHistory:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_actionType copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_actionKeyLaunchHistory copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((actionType = self->_actionType, !((unint64_t)actionType | v4[2]))
     || -[NSString isEqual:](actionType, "isEqual:")))
  {
    actionKeyLaunchHistory = self->_actionKeyLaunchHistory;
    if ((unint64_t)actionKeyLaunchHistory | v4[1]) {
      char v7 = -[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](actionKeyLaunchHistory, "isEqual:");
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_actionType hash];
  return [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_actionKeyLaunchHistory hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[2])
  {
    -[ATXAnchorModelPBActionKeyMetadata setActionType:](self, "setActionType:");
    id v4 = v7;
  }
  actionKeyLaunchHistory = self->_actionKeyLaunchHistory;
  uint64_t v6 = v4[1];
  if (actionKeyLaunchHistory)
  {
    if (!v6) {
      goto LABEL_9;
    }
    actionKeyLaunchHistory = (ATXAnchorModelPBLaunchHistoryMetadata *)-[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](actionKeyLaunchHistory, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    actionKeyLaunchHistory = (ATXAnchorModelPBLaunchHistoryMetadata *)-[ATXAnchorModelPBActionKeyMetadata setActionKeyLaunchHistory:](self, "setActionKeyLaunchHistory:");
  }
  id v4 = v7;
LABEL_9:
  MEMORY[0x1F41817F8](actionKeyLaunchHistory, v4);
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
}

- (ATXAnchorModelPBLaunchHistoryMetadata)actionKeyLaunchHistory
{
  return self->_actionKeyLaunchHistory;
}

- (void)setActionKeyLaunchHistory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_actionKeyLaunchHistory, 0);
}

@end