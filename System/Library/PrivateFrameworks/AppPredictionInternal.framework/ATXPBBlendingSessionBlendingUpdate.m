@interface ATXPBBlendingSessionBlendingUpdate
+ (Class)clientModelUpdateType;
- (ATXPBBlendingSessionDeviceContext)deviceContext;
- (ATXPBBlendingSessionUICache)uiCache;
- (BOOL)hasBlendingABGroup;
- (BOOL)hasBlendingUpdateUUID;
- (BOOL)hasConsumerSubType;
- (BOOL)hasDeviceContext;
- (BOOL)hasUiCache;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)clientModelUpdates;
- (NSString)blendingABGroup;
- (NSString)blendingUpdateUUID;
- (NSString)consumerSubType;
- (id)clientModelUpdateAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)clientModelUpdatesCount;
- (unint64_t)hash;
- (void)addClientModelUpdate:(id)a3;
- (void)clearClientModelUpdates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBlendingABGroup:(id)a3;
- (void)setBlendingUpdateUUID:(id)a3;
- (void)setClientModelUpdates:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setDeviceContext:(id)a3;
- (void)setUiCache:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBBlendingSessionBlendingUpdate

- (BOOL)hasBlendingUpdateUUID
{
  return self->_blendingUpdateUUID != 0;
}

- (BOOL)hasBlendingABGroup
{
  return self->_blendingABGroup != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasDeviceContext
{
  return self->_deviceContext != 0;
}

- (void)clearClientModelUpdates
{
}

- (void)addClientModelUpdate:(id)a3
{
  id v4 = a3;
  clientModelUpdates = self->_clientModelUpdates;
  id v8 = v4;
  if (!clientModelUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clientModelUpdates;
    self->_clientModelUpdates = v6;

    id v4 = v8;
    clientModelUpdates = self->_clientModelUpdates;
  }
  [(NSMutableArray *)clientModelUpdates addObject:v4];
}

- (unint64_t)clientModelUpdatesCount
{
  return [(NSMutableArray *)self->_clientModelUpdates count];
}

- (id)clientModelUpdateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clientModelUpdates objectAtIndex:a3];
}

+ (Class)clientModelUpdateType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUiCache
{
  return self->_uiCache != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBBlendingSessionBlendingUpdate;
  id v4 = [(ATXPBBlendingSessionBlendingUpdate *)&v8 description];
  v5 = [(ATXPBBlendingSessionBlendingUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  blendingUpdateUUID = self->_blendingUpdateUUID;
  if (blendingUpdateUUID) {
    [v3 setObject:blendingUpdateUUID forKey:@"blendingUpdateUUID"];
  }
  blendingABGroup = self->_blendingABGroup;
  if (blendingABGroup) {
    [v4 setObject:blendingABGroup forKey:@"blendingABGroup"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v4 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  deviceContext = self->_deviceContext;
  if (deviceContext)
  {
    v9 = [(ATXPBBlendingSessionDeviceContext *)deviceContext dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"deviceContext"];
  }
  if ([(NSMutableArray *)self->_clientModelUpdates count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_clientModelUpdates, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v11 = self->_clientModelUpdates;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"clientModelUpdate"];
  }
  uiCache = self->_uiCache;
  if (uiCache)
  {
    v18 = [(ATXPBBlendingSessionUICache *)uiCache dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"uiCache"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionBlendingUpdateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_blendingUpdateUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_blendingABGroup) {
    PBDataWriterWriteStringField();
  }
  if (self->_consumerSubType) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceContext) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_clientModelUpdates;
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

  if (self->_uiCache) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_blendingUpdateUUID) {
    objc_msgSend(v8, "setBlendingUpdateUUID:");
  }
  if (self->_blendingABGroup) {
    objc_msgSend(v8, "setBlendingABGroup:");
  }
  if (self->_consumerSubType) {
    objc_msgSend(v8, "setConsumerSubType:");
  }
  if (self->_deviceContext) {
    objc_msgSend(v8, "setDeviceContext:");
  }
  if ([(ATXPBBlendingSessionBlendingUpdate *)self clientModelUpdatesCount])
  {
    [v8 clearClientModelUpdates];
    unint64_t v4 = [(ATXPBBlendingSessionBlendingUpdate *)self clientModelUpdatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBBlendingSessionBlendingUpdate *)self clientModelUpdateAtIndex:i];
        [v8 addClientModelUpdate:v7];
      }
    }
  }
  if (self->_uiCache) {
    objc_msgSend(v8, "setUiCache:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_blendingUpdateUUID copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_blendingABGroup copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  long long v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(ATXPBBlendingSessionDeviceContext *)self->_deviceContext copyWithZone:a3];
  long long v13 = (void *)v5[5];
  v5[5] = v12;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = self->_clientModelUpdates;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (void)v23);
        [v5 addClientModelUpdate:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  id v20 = [(ATXPBBlendingSessionUICache *)self->_uiCache copyWithZone:a3];
  long long v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((blendingUpdateUUID = self->_blendingUpdateUUID, !((unint64_t)blendingUpdateUUID | v4[2]))
     || -[NSString isEqual:](blendingUpdateUUID, "isEqual:"))
    && ((blendingABGroup = self->_blendingABGroup, !((unint64_t)blendingABGroup | v4[1]))
     || -[NSString isEqual:](blendingABGroup, "isEqual:"))
    && ((consumerSubType = self->_consumerSubType, !((unint64_t)consumerSubType | v4[4]))
     || -[NSString isEqual:](consumerSubType, "isEqual:"))
    && ((deviceContext = self->_deviceContext, !((unint64_t)deviceContext | v4[5]))
     || -[ATXPBBlendingSessionDeviceContext isEqual:](deviceContext, "isEqual:"))
    && ((clientModelUpdates = self->_clientModelUpdates, !((unint64_t)clientModelUpdates | v4[3]))
     || -[NSMutableArray isEqual:](clientModelUpdates, "isEqual:")))
  {
    uiCache = self->_uiCache;
    if ((unint64_t)uiCache | v4[6]) {
      char v11 = -[ATXPBBlendingSessionUICache isEqual:](uiCache, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_blendingUpdateUUID hash];
  NSUInteger v4 = [(NSString *)self->_blendingABGroup hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_consumerSubType hash];
  unint64_t v6 = v4 ^ v5 ^ [(ATXPBBlendingSessionDeviceContext *)self->_deviceContext hash];
  uint64_t v7 = [(NSMutableArray *)self->_clientModelUpdates hash];
  return v6 ^ v7 ^ [(ATXPBBlendingSessionUICache *)self->_uiCache hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[ATXPBBlendingSessionBlendingUpdate setBlendingUpdateUUID:](self, "setBlendingUpdateUUID:");
  }
  if (*((void *)v4 + 1)) {
    -[ATXPBBlendingSessionBlendingUpdate setBlendingABGroup:](self, "setBlendingABGroup:");
  }
  if (*((void *)v4 + 4)) {
    -[ATXPBBlendingSessionBlendingUpdate setConsumerSubType:](self, "setConsumerSubType:");
  }
  deviceContext = self->_deviceContext;
  uint64_t v6 = *((void *)v4 + 5);
  if (deviceContext)
  {
    if (v6) {
      -[ATXPBBlendingSessionDeviceContext mergeFrom:](deviceContext, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ATXPBBlendingSessionBlendingUpdate setDeviceContext:](self, "setDeviceContext:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[ATXPBBlendingSessionBlendingUpdate addClientModelUpdate:](self, "addClientModelUpdate:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  uiCache = self->_uiCache;
  uint64_t v13 = *((void *)v4 + 6);
  if (uiCache)
  {
    if (v13) {
      -[ATXPBBlendingSessionUICache mergeFrom:](uiCache, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[ATXPBBlendingSessionBlendingUpdate setUiCache:](self, "setUiCache:");
  }
}

- (NSString)blendingUpdateUUID
{
  return self->_blendingUpdateUUID;
}

- (void)setBlendingUpdateUUID:(id)a3
{
}

- (NSString)blendingABGroup
{
  return self->_blendingABGroup;
}

- (void)setBlendingABGroup:(id)a3
{
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (ATXPBBlendingSessionDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
}

- (NSMutableArray)clientModelUpdates
{
  return self->_clientModelUpdates;
}

- (void)setClientModelUpdates:(id)a3
{
}

- (ATXPBBlendingSessionUICache)uiCache
{
  return self->_uiCache;
}

- (void)setUiCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiCache, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelUpdates, 0);
  objc_storeStrong((id *)&self->_blendingUpdateUUID, 0);
  objc_storeStrong((id *)&self->_blendingABGroup, 0);
}

@end