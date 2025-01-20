@interface BLTPBProtobufSequenceNumberManager
- (BLTPBProtobufSequenceNumberManager)initWithServiceName:(id)a3 updateSequenceNumbersOnOutOfOrder:(BOOL)a4;
- (BLTPBProtobufSequenceNumberManager)initWithServiceName:(id)a3 updateSequenceNumbersOnOutOfOrder:(BOOL)a4 duplicateCapacity:(unint64_t)a5;
- (BOOL)_isSequenceNumberInOrder:(unint64_t)a3;
- (BOOL)_writeSequenceNumbersToStore;
- (NSString)serviceName;
- (NSUUID)currentSessionIdentifier;
- (NSUUID)recvSessionIdentifier;
- (id)_sequenceNumbersURL;
- (id)nextSendSequenceNumber;
- (int64_t)setRecvSequenceNumber:(unint64_t)a3 recvSessionIdentifier:(id)a4 force:(BOOL)a5;
- (unint64_t)sessionState;
- (void)_readSequenceNumbersFromStoreWithInitialDuplicateCapacity:(unint64_t)a3;
- (void)_writeSequenceNumbersToStore;
- (void)setSessionState:(unint64_t)a3;
@end

@implementation BLTPBProtobufSequenceNumberManager

- (BLTPBProtobufSequenceNumberManager)initWithServiceName:(id)a3 updateSequenceNumbersOnOutOfOrder:(BOOL)a4
{
  return [(BLTPBProtobufSequenceNumberManager *)self initWithServiceName:a3 updateSequenceNumbersOnOutOfOrder:a4 duplicateCapacity:8000];
}

- (BLTPBProtobufSequenceNumberManager)initWithServiceName:(id)a3 updateSequenceNumbersOnOutOfOrder:(BOOL)a4 duplicateCapacity:(unint64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BLTPBProtobufSequenceNumberManager;
  v9 = [(BLTPBProtobufSequenceNumberManager *)&v15 init];
  if (v9)
  {
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    sequenceNumberAccess = v9->_sequenceNumberAccess;
    v9->_sequenceNumberAccess = v10;

    uint64_t v12 = [v8 copy];
    serviceName = v9->_serviceName;
    v9->_serviceName = (NSString *)v12;

    v9->_updateSequenceNumbersOnOutOfOrder = a4;
    [(BLTPBProtobufSequenceNumberManager *)v9 _readSequenceNumbersFromStoreWithInitialDuplicateCapacity:a5];
  }

  return v9;
}

- (int64_t)setRecvSequenceNumber:(unint64_t)a3 recvSessionIdentifier:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  [(NSLock *)self->_sequenceNumberAccess lock];
  if (v5)
  {
    [(BLTCircularBitBuffer *)self->_duplicateEntries clear];
    objc_storeStrong((id *)&self->_recvSessionIdentifier, a4);
    self->_recvSequenceNumber = a3;
LABEL_3:
    [(BLTCircularBitBuffer *)self->_duplicateEntries setBit:1 atIndex:a3];
    int64_t v10 = 0;
    goto LABEL_23;
  }
  recvSessionIdentifier = self->_recvSessionIdentifier;
  if (!recvSessionIdentifier)
  {
    int64_t v10 = 0;
    goto LABEL_13;
  }
  if ([(NSUUID *)recvSessionIdentifier isEqual:v9])
  {
    int64_t v10 = 0;
  }
  else
  {
    int64_t v10 = 1;
    if (!self->_updateSequenceNumbersOnOutOfOrder) {
      goto LABEL_23;
    }
  }
  if (!self->_recvSessionIdentifier)
  {
LABEL_13:
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v9 && self->_updateSequenceNumbersOnOutOfOrder) {
LABEL_14:
  }
    objc_storeStrong((id *)&self->_recvSessionIdentifier, a4);
LABEL_15:
  if ([(BLTPBProtobufSequenceNumberManager *)self _isSequenceNumberInOrder:a3])
  {
    self->_recvSequenceNumber = a3;
    if (v10)
    {
      int64_t v10 = 1;
      goto LABEL_23;
    }
    goto LABEL_3;
  }
  if ([(BLTCircularBitBuffer *)self->_duplicateEntries bitAtIndex:a3] == 1) {
    int64_t v10 = 3;
  }
  else {
    int64_t v10 = 1;
  }
  if (self->_updateSequenceNumbersOnOutOfOrder) {
    self->_recvSequenceNumber = a3;
  }
LABEL_23:
  [(BLTPBProtobufSequenceNumberManager *)self _writeSequenceNumbersToStore];
  [(NSLock *)self->_sequenceNumberAccess unlock];

  return v10;
}

- (id)nextSendSequenceNumber
{
  [(NSLock *)self->_sequenceNumberAccess lock];
  ++self->_sendSequenceNumber;
  if ([(BLTPBProtobufSequenceNumberManager *)self _writeSequenceNumbersToStore])
  {
    v3 = [NSNumber numberWithUnsignedLongLong:self->_sendSequenceNumber];
  }
  else
  {
    v3 = 0;
    --self->_sendSequenceNumber;
  }
  [(NSLock *)self->_sequenceNumberAccess unlock];
  return v3;
}

- (BOOL)_isSequenceNumberInOrder:(unint64_t)a3
{
  unint64_t recvSequenceNumber = self->_recvSequenceNumber;
  BOOL v4 = recvSequenceNumber >= a3;
  uint64_t v5 = recvSequenceNumber - a3;
  return !v4 || v5 < 0;
}

- (id)_sequenceNumbersURL
{
  sequenceNumbersURL = self->_sequenceNumbersURL;
  if (!sequenceNumbersURL)
  {
    BOOL v4 = [(NSString *)self->_serviceName stringByAppendingString:@"-sequencenumbers.plist"];
    BLTFileURLInPairingPath(v4);
    uint64_t v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sequenceNumbersURL;
    self->_sequenceNumbersURL = v5;

    sequenceNumbersURL = self->_sequenceNumbersURL;
  }
  return sequenceNumbersURL;
}

- (void)_readSequenceNumbersFromStoreWithInitialDuplicateCapacity:(unint64_t)a3
{
  id v29 = [(BLTPBProtobufSequenceNumberManager *)self _sequenceNumbersURL];
  if (!v29) {
    goto LABEL_11;
  }
  currentSessionIdentifier = [NSDictionary dictionaryWithContentsOfURL:v29];
  v6 = [currentSessionIdentifier objectForKey:@"send"];
  v7 = [currentSessionIdentifier objectForKey:@"recv"];
  uint64_t v28 = [currentSessionIdentifier objectForKey:@"initial"];
  uint64_t v8 = [currentSessionIdentifier objectForKey:@"sessionState"];
  id v9 = [currentSessionIdentifier objectForKey:@"dupebytes"];
  int64_t v10 = [currentSessionIdentifier objectForKey:@"dupeindex"];
  v11 = [currentSessionIdentifier objectForKey:@"sendSession"];
  uint64_t v12 = [currentSessionIdentifier objectForKey:@"recvSession"];
  v13 = v12;
  if (!v6 || !v7 || !(v28 | v8) || !v9 || !v10 || !v11)
  {

LABEL_11:
    objc_super v15 = [[BLTCircularBitBuffer alloc] initWithCapacity:a3];
    duplicateEntries = self->_duplicateEntries;
    self->_duplicateEntries = v15;

    self->_sessionState = 1;
    v17 = [MEMORY[0x263F08C38] UUID];
    currentSessionIdentifier = self->_currentSessionIdentifier;
    self->_currentSessionIdentifier = v17;
    goto LABEL_12;
  }
  self->_sendSequenceNumber = [v6 unsignedLongLongValue];
  self->_unint64_t recvSequenceNumber = [v7 unsignedLongLongValue];
  v27 = v7;
  if (v8) {
    unint64_t v14 = [(id)v8 unsignedIntegerValue];
  }
  else {
    unint64_t v14 = [(id)v28 BOOLValue];
  }
  self->_sessionState = v14;
  v18 = -[BLTCircularBitBuffer initWithData:andIndex:]([BLTCircularBitBuffer alloc], "initWithData:andIndex:", v9, [v10 unsignedLongLongValue]);
  v19 = self->_duplicateEntries;
  self->_duplicateEntries = v18;

  v20 = (NSUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v11];
  v21 = self->_currentSessionIdentifier;
  self->_currentSessionIdentifier = v20;

  if (v13)
  {
    v22 = (NSUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
    recvSessionIdentifier = self->_recvSessionIdentifier;
    self->_recvSessionIdentifier = v22;
  }
  unint64_t v24 = [(BLTCircularBitBuffer *)self->_duplicateEntries capacity];
  if (v24 != +[BLTCircularBitBuffer actualCapacity:a3])
  {
    v25 = [[BLTCircularBitBuffer alloc] initWithCapacity:a3];
    v26 = self->_duplicateEntries;
    self->_duplicateEntries = v25;
  }
LABEL_12:
}

- (BOOL)_writeSequenceNumbersToStore
{
  v34[6] = *MEMORY[0x263EF8340];
  v3 = [(BLTPBProtobufSequenceNumberManager *)self _sequenceNumbersURL];
  if (v3)
  {
    v33[0] = @"send";
    BOOL v4 = [NSNumber numberWithUnsignedLongLong:self->_sendSequenceNumber];
    v34[0] = v4;
    v33[1] = @"recv";
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_recvSequenceNumber];
    v34[1] = v5;
    v33[2] = @"sessionState";
    v6 = [NSNumber numberWithUnsignedInteger:self->_sessionState];
    v34[2] = v6;
    v33[3] = @"dupeindex";
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BLTCircularBitBuffer beginIndex](self->_duplicateEntries, "beginIndex"));
    v34[3] = v7;
    v33[4] = @"dupebytes";
    uint64_t v8 = [(BLTCircularBitBuffer *)self->_duplicateEntries bitVector];
    v34[4] = v8;
    v33[5] = @"sendSession";
    id v9 = [(NSUUID *)self->_currentSessionIdentifier UUIDString];
    v34[5] = v9;
    int64_t v10 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];
    v11 = (void *)[v10 mutableCopy];

    recvSessionIdentifier = self->_recvSessionIdentifier;
    if (recvSessionIdentifier)
    {
      v13 = [(NSUUID *)recvSessionIdentifier UUIDString];
      [v11 setObject:v13 forKeyedSubscript:@"recvSession"];
    }
    unint64_t v14 = [MEMORY[0x263F08AC0] dataWithPropertyList:v11 format:200 options:0 error:0];
    objc_super v15 = [MEMORY[0x263EFF8F8] data];
    int v16 = [v15 writeToURL:v3 options:0 error:0];

    if (v16
      && [v3 setResourceValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF6B0] error:0]&& (objc_msgSend(v14, "writeToURL:options:error:", v3, 0x10000000, 0) & 1) != 0)
    {
      v17 = blt_ids_log();
      BOOL v18 = 1;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        unint64_t sendSequenceNumber = self->_sendSequenceNumber;
        v20 = [(NSUUID *)self->_currentSessionIdentifier UUIDString];
        unint64_t recvSequenceNumber = self->_recvSequenceNumber;
        v22 = [(NSUUID *)self->_recvSessionIdentifier UUIDString];
        int v25 = 134218754;
        unint64_t v26 = sendSequenceNumber;
        __int16 v27 = 2112;
        uint64_t v28 = v20;
        __int16 v29 = 2048;
        unint64_t v30 = recvSequenceNumber;
        __int16 v31 = 2112;
        v32 = v22;
        BOOL v18 = 1;
        _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_INFO, "Sequence numbers written. Send: %llu session: %@ Recv: %llu session: %@", (uint8_t *)&v25, 0x2Au);
      }
    }
    else
    {
      v23 = [MEMORY[0x263F08850] defaultManager];
      [v23 removeItemAtURL:v3 error:0];

      v17 = blt_ids_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[BLTPBProtobufSequenceNumberManager _writeSequenceNumbersToStore](v17);
      }
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSUUID)currentSessionIdentifier
{
  return self->_currentSessionIdentifier;
}

- (NSUUID)recvSessionIdentifier
{
  return self->_recvSessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recvSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_sequenceNumbersURL, 0);
  objc_storeStrong((id *)&self->_duplicateEntries, 0);
  objc_storeStrong((id *)&self->_sequenceNumberAccess, 0);
}

- (void)_writeSequenceNumbersToStore
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Error storing sequence numbers.", v1, 2u);
}

@end