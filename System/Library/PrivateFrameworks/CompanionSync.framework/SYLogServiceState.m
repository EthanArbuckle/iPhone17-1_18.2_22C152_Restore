@interface SYLogServiceState
+ (Class)transportOptionsType;
- (BOOL)hasEngine;
- (BOOL)hasPeerGenerationID;
- (BOOL)hasPeerID;
- (BOOL)hasServiceType;
- (BOOL)hasSession;
- (BOOL)hasTargetedDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)sessionQueueRunning;
- (NSDictionary)cocoaTransportOptions;
- (NSMutableArray)transportOptions;
- (NSString)name;
- (NSString)peerGenerationID;
- (NSString)peerID;
- (SYLogDeviceState)targetedDevice;
- (SYLogEngineState)engine;
- (SYLogSessionState)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enqueuedSyncTypeAsString:(int)a3;
- (id)serviceTypeAsString:(int)a3;
- (id)transportOptionsAtIndex:(unint64_t)a3;
- (int)StringAsEnqueuedSyncType:(id)a3;
- (int)StringAsServiceType:(id)a3;
- (int)enqueuedSyncType;
- (int)serviceType;
- (unint64_t)hash;
- (unint64_t)transportOptionsCount;
- (void)addTransportOptions:(id)a3;
- (void)clearTransportOptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCocoaTransportOptions:(id)a3;
- (void)setEngine:(id)a3;
- (void)setEnqueuedSyncType:(int)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPeerGenerationID:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setServiceType:(int)a3;
- (void)setSession:(id)a3;
- (void)setSessionQueueRunning:(BOOL)a3;
- (void)setTargetedDevice:(id)a3;
- (void)setTransportOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYLogServiceState

void __59__SYLogServiceState_Convenience__setCocoaTransportOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_opt_new();
  [v8 setKey:v6];

  v7 = [v5 description];

  [v8 setValue:v7];
  [*(id *)(a1 + 32) addTransportOptions:v8];
}

- (void)addTransportOptions:(id)a3
{
  id v4 = a3;
  transportOptions = self->_transportOptions;
  id v8 = v4;
  if (!transportOptions)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_transportOptions;
    self->_transportOptions = v6;

    id v4 = v8;
    transportOptions = self->_transportOptions;
  }
  [(NSMutableArray *)transportOptions addObject:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_name) {
    -[SYLogServiceState writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_engine) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_session) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteBOOLField();
  if (self->_targetedDevice) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteInt32Field();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_transportOptions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_peerID) {
    PBDataWriterWriteStringField();
  }
  if (self->_peerGenerationID) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)setCocoaTransportOptions:(id)a3
{
  id v4 = a3;
  [(SYLogServiceState *)self clearTransportOptions];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__SYLogServiceState_Convenience__setCocoaTransportOptions___block_invoke;
  v5[3] = &unk_264423D70;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

- (void)setTargetedDevice:(id)a3
{
}

- (void)setSessionQueueRunning:(BOOL)a3
{
  self->_sessionQueueRunning = a3;
}

- (void)setSession:(id)a3
{
}

- (void)setServiceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_serviceType = a3;
}

- (void)setPeerID:(id)a3
{
}

- (void)setPeerGenerationID:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setEnqueuedSyncType:(int)a3
{
  self->_enqueuedSyncType = a3;
}

- (void)setEngine:(id)a3
{
}

- (void)clearTransportOptions
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_targetedDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_peerGenerationID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

- (BOOL)hasEngine
{
  return self->_engine != 0;
}

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (BOOL)hasTargetedDevice
{
  return self->_targetedDevice != 0;
}

- (id)enqueuedSyncTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264422B48[a3];
  }
  return v3;
}

- (int)StringAsEnqueuedSyncType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Delta"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Reset"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)transportOptionsCount
{
  return [(NSMutableArray *)self->_transportOptions count];
}

- (id)transportOptionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transportOptions objectAtIndex:a3];
}

+ (Class)transportOptionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

- (BOOL)hasPeerGenerationID
{
  return self->_peerGenerationID != 0;
}

- (int)serviceType
{
  if (*(unsigned char *)&self->_has) {
    return self->_serviceType;
  }
  else {
    return 0;
  }
}

- (void)setHasServiceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServiceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)serviceTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_264422B60[a3];
  }
  return v3;
}

- (int)StringAsServiceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Master"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Slave"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYLogServiceState;
  int v4 = [(SYLogServiceState *)&v8 description];
  id v5 = [(SYLogServiceState *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  engine = self->_engine;
  if (engine)
  {
    uint64_t v7 = [(SYLogEngineState *)engine dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"engine"];
  }
  session = self->_session;
  if (session)
  {
    uint64_t v9 = [(SYLogSessionState *)session dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"session"];
  }
  uint64_t v10 = [NSNumber numberWithBool:self->_sessionQueueRunning];
  [v4 setObject:v10 forKey:@"sessionQueueRunning"];

  targetedDevice = self->_targetedDevice;
  if (targetedDevice)
  {
    long long v12 = [(SYLogDeviceState *)targetedDevice dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"targetedDevice"];
  }
  uint64_t enqueuedSyncType = self->_enqueuedSyncType;
  if (enqueuedSyncType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_enqueuedSyncType);
    long long v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v14 = off_264422B48[enqueuedSyncType];
  }
  [v4 setObject:v14 forKey:@"enqueuedSyncType"];

  if ([(NSMutableArray *)self->_transportOptions count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_transportOptions, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = self->_transportOptions;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"transportOptions"];
  }
  peerID = self->_peerID;
  if (peerID) {
    [v4 setObject:peerID forKey:@"peerID"];
  }
  peerGenerationID = self->_peerGenerationID;
  if (peerGenerationID) {
    [v4 setObject:peerGenerationID forKey:@"peerGenerationID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t serviceType = self->_serviceType;
    if (serviceType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_serviceType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_264422B60[serviceType];
    }
    [v4 setObject:v25 forKey:@"serviceType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogServiceStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  uint64_t v10 = a3;
  [v10 setName:self->_name];
  if (self->_engine) {
    objc_msgSend(v10, "setEngine:");
  }
  if (self->_session) {
    objc_msgSend(v10, "setSession:");
  }
  int v4 = v10;
  v10[80] = self->_sessionQueueRunning;
  if (self->_targetedDevice)
  {
    objc_msgSend(v10, "setTargetedDevice:");
    int v4 = v10;
  }
  *((_DWORD *)v4 + 4) = self->_enqueuedSyncType;
  if ([(SYLogServiceState *)self transportOptionsCount])
  {
    [v10 clearTransportOptions];
    unint64_t v5 = [(SYLogServiceState *)self transportOptionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        objc_super v8 = [(SYLogServiceState *)self transportOptionsAtIndex:i];
        [v10 addTransportOptions:v8];
      }
    }
  }
  if (self->_peerID) {
    objc_msgSend(v10, "setPeerID:");
  }
  uint64_t v9 = v10;
  if (self->_peerGenerationID)
  {
    objc_msgSend(v10, "setPeerGenerationID:");
    uint64_t v9 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 12) = self->_serviceType;
    v9[84] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(SYLogEngineState *)self->_engine copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  id v10 = [(SYLogSessionState *)self->_session copyWithZone:a3];
  long long v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  *(unsigned char *)(v5 + 80) = self->_sessionQueueRunning;
  id v12 = [(SYLogDeviceState *)self->_targetedDevice copyWithZone:a3];
  long long v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  *(_DWORD *)(v5 + 16) = self->_enqueuedSyncType;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v14 = self->_transportOptions;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v18), "copyWithZone:", a3, (void)v25);
        [(id)v5 addTransportOptions:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_peerID copyWithZone:a3];
  v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  uint64_t v22 = [(NSString *)self->_peerGenerationID copyWithZone:a3];
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_serviceType;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_25;
    }
  }
  engine = self->_engine;
  if ((unint64_t)engine | *((void *)v4 + 1))
  {
    if (!-[SYLogEngineState isEqual:](engine, "isEqual:")) {
      goto LABEL_25;
    }
  }
  session = self->_session;
  if ((unint64_t)session | *((void *)v4 + 7))
  {
    if (!-[SYLogSessionState isEqual:](session, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if (self->_sessionQueueRunning)
  {
    if (!*((unsigned char *)v4 + 80)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_25:
    BOOL v12 = 0;
    goto LABEL_26;
  }
  targetedDevice = self->_targetedDevice;
  if ((unint64_t)targetedDevice | *((void *)v4 + 8)
    && !-[SYLogDeviceState isEqual:](targetedDevice, "isEqual:"))
  {
    goto LABEL_25;
  }
  if (self->_enqueuedSyncType != *((_DWORD *)v4 + 4)) {
    goto LABEL_25;
  }
  transportOptions = self->_transportOptions;
  if ((unint64_t)transportOptions | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](transportOptions, "isEqual:")) {
      goto LABEL_25;
    }
  }
  peerID = self->_peerID;
  if ((unint64_t)peerID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](peerID, "isEqual:")) {
      goto LABEL_25;
    }
  }
  peerGenerationID = self->_peerGenerationID;
  if ((unint64_t)peerGenerationID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](peerGenerationID, "isEqual:")) {
      goto LABEL_25;
    }
  }
  BOOL v12 = (*((unsigned char *)v4 + 84) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_serviceType != *((_DWORD *)v4 + 12)) {
      goto LABEL_25;
    }
    BOOL v12 = 1;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(SYLogEngineState *)self->_engine hash];
  unint64_t v5 = [(SYLogSessionState *)self->_session hash];
  BOOL sessionQueueRunning = self->_sessionQueueRunning;
  unint64_t v7 = [(SYLogDeviceState *)self->_targetedDevice hash];
  uint64_t enqueuedSyncType = self->_enqueuedSyncType;
  uint64_t v9 = [(NSMutableArray *)self->_transportOptions hash];
  NSUInteger v10 = [(NSString *)self->_peerID hash];
  NSUInteger v11 = [(NSString *)self->_peerGenerationID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v12 = 2654435761 * self->_serviceType;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ (2654435761 * sessionQueueRunning) ^ (2654435761 * enqueuedSyncType) ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[SYLogServiceState setName:](self, "setName:");
  }
  engine = self->_engine;
  uint64_t v6 = *((void *)v4 + 1);
  if (engine)
  {
    if (v6) {
      -[SYLogEngineState mergeFrom:](engine, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SYLogServiceState setEngine:](self, "setEngine:");
  }
  session = self->_session;
  uint64_t v8 = *((void *)v4 + 7);
  if (session)
  {
    if (v8) {
      -[SYLogSessionState mergeFrom:](session, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SYLogServiceState setSession:](self, "setSession:");
  }
  self->_BOOL sessionQueueRunning = *((unsigned char *)v4 + 80);
  targetedDevice = self->_targetedDevice;
  uint64_t v10 = *((void *)v4 + 8);
  if (targetedDevice)
  {
    if (v10) {
      -[SYLogDeviceState mergeFrom:](targetedDevice, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SYLogServiceState setTargetedDevice:](self, "setTargetedDevice:");
  }
  self->_uint64_t enqueuedSyncType = *((_DWORD *)v4 + 4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *((id *)v4 + 9);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SYLogServiceState addTransportOptions:](self, "addTransportOptions:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 5)) {
    -[SYLogServiceState setPeerID:](self, "setPeerID:");
  }
  if (*((void *)v4 + 4)) {
    -[SYLogServiceState setPeerGenerationID:](self, "setPeerGenerationID:");
  }
  if (*((unsigned char *)v4 + 84))
  {
    self->_uint64_t serviceType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (SYLogEngineState)engine
{
  return self->_engine;
}

- (SYLogSessionState)session
{
  return self->_session;
}

- (BOOL)sessionQueueRunning
{
  return self->_sessionQueueRunning;
}

- (SYLogDeviceState)targetedDevice
{
  return self->_targetedDevice;
}

- (int)enqueuedSyncType
{
  return self->_enqueuedSyncType;
}

- (NSMutableArray)transportOptions
{
  return self->_transportOptions;
}

- (void)setTransportOptions:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (NSString)peerGenerationID
{
  return self->_peerGenerationID;
}

- (NSDictionary)cocoaTransportOptions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v4 = [(SYLogServiceState *)self transportOptions];
  unint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(SYLogServiceState *)self transportOptions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 value];
        uint64_t v13 = [v11 key];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYLogServiceState writeTo:]", "SYLogServiceState.m", 298, "nil != self->_name");
}

@end