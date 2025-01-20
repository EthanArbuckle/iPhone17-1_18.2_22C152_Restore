@interface ATXAnchorModelPBActionMetadata
+ (Class)actionUUIDMetadataType;
- (ATXAnchorModelPBActionKeyMetadata)actionKeyMetadata;
- (ATXAnchorModelPBAppLaunchMetadata)appLaunchMetadata;
- (BOOL)hasActionKeyMetadata;
- (BOOL)hasActionType;
- (BOOL)hasAppLaunchMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)actionUUIDMetadatas;
- (id)actionTypeAsString:(int)a3;
- (id)actionUUIDMetadataAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsActionType:(id)a3;
- (int)actionType;
- (unint64_t)actionUUIDMetadatasCount;
- (unint64_t)hash;
- (void)addActionUUIDMetadata:(id)a3;
- (void)clearActionUUIDMetadatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionKeyMetadata:(id)a3;
- (void)setActionType:(int)a3;
- (void)setActionUUIDMetadatas:(id)a3;
- (void)setAppLaunchMetadata:(id)a3;
- (void)setHasActionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBActionMetadata

- (int)actionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_actionType;
  }
  else {
    return 0;
  }
}

- (void)setActionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68B6968[a3];
  }
  return v3;
}

- (int)StringAsActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANCHOR_ACTION_TYPE_OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANCHOR_ACTION_TYPE_INTENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANCHOR_ACTION_TYPE_NSUA"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAppLaunchMetadata
{
  return self->_appLaunchMetadata != 0;
}

- (BOOL)hasActionKeyMetadata
{
  return self->_actionKeyMetadata != 0;
}

- (void)clearActionUUIDMetadatas
{
}

- (void)addActionUUIDMetadata:(id)a3
{
  id v4 = a3;
  actionUUIDMetadatas = self->_actionUUIDMetadatas;
  id v8 = v4;
  if (!actionUUIDMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_actionUUIDMetadatas;
    self->_actionUUIDMetadatas = v6;

    id v4 = v8;
    actionUUIDMetadatas = self->_actionUUIDMetadatas;
  }
  [(NSMutableArray *)actionUUIDMetadatas addObject:v4];
}

- (unint64_t)actionUUIDMetadatasCount
{
  return [(NSMutableArray *)self->_actionUUIDMetadatas count];
}

- (id)actionUUIDMetadataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_actionUUIDMetadatas objectAtIndex:a3];
}

+ (Class)actionUUIDMetadataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXAnchorModelPBActionMetadata;
  id v4 = [(ATXAnchorModelPBActionMetadata *)&v8 description];
  v5 = [(ATXAnchorModelPBActionMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t actionType = self->_actionType;
    if (actionType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_actionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E68B6968[actionType];
    }
    [v3 setObject:v5 forKey:@"actionType"];
  }
  appLaunchMetadata = self->_appLaunchMetadata;
  if (appLaunchMetadata)
  {
    v7 = [(ATXAnchorModelPBAppLaunchMetadata *)appLaunchMetadata dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"appLaunchMetadata"];
  }
  actionKeyMetadata = self->_actionKeyMetadata;
  if (actionKeyMetadata)
  {
    v9 = [(ATXAnchorModelPBActionKeyMetadata *)actionKeyMetadata dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"actionKeyMetadata"];
  }
  if ([(NSMutableArray *)self->_actionUUIDMetadatas count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_actionUUIDMetadatas, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_actionUUIDMetadatas;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"actionUUIDMetadata"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBActionMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_appLaunchMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_actionKeyMetadata) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_actionUUIDMetadatas;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_actionType;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v9 = v4;
  if (self->_appLaunchMetadata) {
    objc_msgSend(v4, "setAppLaunchMetadata:");
  }
  if (self->_actionKeyMetadata) {
    objc_msgSend(v9, "setActionKeyMetadata:");
  }
  if ([(ATXAnchorModelPBActionMetadata *)self actionUUIDMetadatasCount])
  {
    [v9 clearActionUUIDMetadatas];
    unint64_t v5 = [(ATXAnchorModelPBActionMetadata *)self actionUUIDMetadatasCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXAnchorModelPBActionMetadata *)self actionUUIDMetadataAtIndex:i];
        [v9 addActionUUIDMetadata:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_actionType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v7 = [(ATXAnchorModelPBAppLaunchMetadata *)self->_appLaunchMetadata copyWithZone:a3];
  uint64_t v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(ATXAnchorModelPBActionKeyMetadata *)self->_actionKeyMetadata copyWithZone:a3];
  long long v10 = (void *)v6[1];
  v6[1] = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_actionUUIDMetadatas;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (void)v18);
        [v6 addActionUUIDMetadata:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_actionType != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  appLaunchMetadata = self->_appLaunchMetadata;
  if ((unint64_t)appLaunchMetadata | *((void *)v4 + 4)
    && !-[ATXAnchorModelPBAppLaunchMetadata isEqual:](appLaunchMetadata, "isEqual:"))
  {
    goto LABEL_13;
  }
  actionKeyMetadata = self->_actionKeyMetadata;
  if ((unint64_t)actionKeyMetadata | *((void *)v4 + 1))
  {
    if (!-[ATXAnchorModelPBActionKeyMetadata isEqual:](actionKeyMetadata, "isEqual:")) {
      goto LABEL_13;
    }
  }
  actionUUIDMetadatas = self->_actionUUIDMetadatas;
  if ((unint64_t)actionUUIDMetadatas | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](actionUUIDMetadatas, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_actionType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ATXAnchorModelPBAppLaunchMetadata *)self->_appLaunchMetadata hash] ^ v3;
  unint64_t v5 = [(ATXAnchorModelPBActionKeyMetadata *)self->_actionKeyMetadata hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_actionUUIDMetadatas hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[10])
  {
    self->_uint64_t actionType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  appLaunchMetadata = self->_appLaunchMetadata;
  uint64_t v7 = *((void *)v5 + 4);
  if (appLaunchMetadata)
  {
    if (v7) {
      -[ATXAnchorModelPBAppLaunchMetadata mergeFrom:](appLaunchMetadata, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[ATXAnchorModelPBActionMetadata setAppLaunchMetadata:](self, "setAppLaunchMetadata:");
  }
  actionKeyMetadata = self->_actionKeyMetadata;
  uint64_t v9 = *((void *)v5 + 1);
  if (actionKeyMetadata)
  {
    if (v9) {
      -[ATXAnchorModelPBActionKeyMetadata mergeFrom:](actionKeyMetadata, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[ATXAnchorModelPBActionMetadata setActionKeyMetadata:](self, "setActionKeyMetadata:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v5 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ATXAnchorModelPBActionMetadata addActionUUIDMetadata:](self, "addActionUUIDMetadata:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (ATXAnchorModelPBAppLaunchMetadata)appLaunchMetadata
{
  return self->_appLaunchMetadata;
}

- (void)setAppLaunchMetadata:(id)a3
{
}

- (ATXAnchorModelPBActionKeyMetadata)actionKeyMetadata
{
  return self->_actionKeyMetadata;
}

- (void)setActionKeyMetadata:(id)a3
{
}

- (NSMutableArray)actionUUIDMetadatas
{
  return self->_actionUUIDMetadatas;
}

- (void)setActionUUIDMetadatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchMetadata, 0);
  objc_storeStrong((id *)&self->_actionUUIDMetadatas, 0);
  objc_storeStrong((id *)&self->_actionKeyMetadata, 0);
}

@end