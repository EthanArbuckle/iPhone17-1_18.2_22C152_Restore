@interface HDCodableWorkoutSessionSyncTransaction
- (BOOL)hasArbitraryData;
- (BOOL)hasConfiguration;
- (BOOL)hasGlobalState;
- (BOOL)hasSessionUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableWorkoutSessionConfiguration)configuration;
- (HDCodableWorkoutSessionGlobalState)globalState;
- (NSData)arbitraryData;
- (NSData)sessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArbitraryData:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setGlobalState:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutSessionSyncTransaction

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (BOOL)hasGlobalState
{
  return self->_globalState != 0;
}

- (BOOL)hasArbitraryData
{
  return self->_arbitraryData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutSessionSyncTransaction;
  v4 = [(HDCodableWorkoutSessionSyncTransaction *)&v8 description];
  v5 = [(HDCodableWorkoutSessionSyncTransaction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  sessionUUID = self->_sessionUUID;
  if (sessionUUID) {
    [v3 setObject:sessionUUID forKey:@"sessionUUID"];
  }
  configuration = self->_configuration;
  if (configuration)
  {
    v7 = [(HDCodableWorkoutSessionConfiguration *)configuration dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"configuration"];
  }
  globalState = self->_globalState;
  if (globalState)
  {
    v9 = [(HDCodableWorkoutSessionGlobalState *)globalState dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"globalState"];
  }
  arbitraryData = self->_arbitraryData;
  if (arbitraryData) {
    [v4 setObject:arbitraryData forKey:@"arbitraryData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutSessionSyncTransactionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sessionUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_configuration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_globalState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_arbitraryData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sessionUUID)
  {
    objc_msgSend(v4, "setSessionUUID:");
    id v4 = v5;
  }
  if (self->_configuration)
  {
    objc_msgSend(v5, "setConfiguration:");
    id v4 = v5;
  }
  if (self->_globalState)
  {
    objc_msgSend(v5, "setGlobalState:");
    id v4 = v5;
  }
  if (self->_arbitraryData)
  {
    objc_msgSend(v5, "setArbitraryData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_sessionUUID copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(HDCodableWorkoutSessionConfiguration *)self->_configuration copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(HDCodableWorkoutSessionGlobalState *)self->_globalState copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSData *)self->_arbitraryData copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sessionUUID = self->_sessionUUID, !((unint64_t)sessionUUID | v4[4]))
     || -[NSData isEqual:](sessionUUID, "isEqual:"))
    && ((configuration = self->_configuration, !((unint64_t)configuration | v4[2]))
     || -[HDCodableWorkoutSessionConfiguration isEqual:](configuration, "isEqual:"))
    && ((globalState = self->_globalState, !((unint64_t)globalState | v4[3]))
     || -[HDCodableWorkoutSessionGlobalState isEqual:](globalState, "isEqual:")))
  {
    arbitraryData = self->_arbitraryData;
    if ((unint64_t)arbitraryData | v4[1]) {
      char v9 = -[NSData isEqual:](arbitraryData, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_sessionUUID hash];
  unint64_t v4 = [(HDCodableWorkoutSessionConfiguration *)self->_configuration hash] ^ v3;
  unint64_t v5 = [(HDCodableWorkoutSessionGlobalState *)self->_globalState hash];
  return v4 ^ v5 ^ [(NSData *)self->_arbitraryData hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  char v9 = v4;
  if (v4[4])
  {
    -[HDCodableWorkoutSessionSyncTransaction setSessionUUID:](self, "setSessionUUID:");
    unint64_t v4 = v9;
  }
  configuration = self->_configuration;
  uint64_t v6 = v4[2];
  if (configuration)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableWorkoutSessionConfiguration mergeFrom:](configuration, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableWorkoutSessionSyncTransaction setConfiguration:](self, "setConfiguration:");
  }
  unint64_t v4 = v9;
LABEL_9:
  globalState = self->_globalState;
  uint64_t v8 = v4[3];
  if (globalState)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[HDCodableWorkoutSessionGlobalState mergeFrom:](globalState, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[HDCodableWorkoutSessionSyncTransaction setGlobalState:](self, "setGlobalState:");
  }
  unint64_t v4 = v9;
LABEL_15:
  if (v4[1])
  {
    -[HDCodableWorkoutSessionSyncTransaction setArbitraryData:](self, "setArbitraryData:");
    unint64_t v4 = v9;
  }
}

- (NSData)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (HDCodableWorkoutSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (HDCodableWorkoutSessionGlobalState)globalState
{
  return self->_globalState;
}

- (void)setGlobalState:(id)a3
{
}

- (NSData)arbitraryData
{
  return self->_arbitraryData;
}

- (void)setArbitraryData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_globalState, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_arbitraryData, 0);
}

@end