@interface CBPeer
- (BOOL)hasTag:(id)a3;
- (BOOL)isLinkEncrypted;
- (CBManager)manager;
- (CBPeer)initWithInfo:(id)a3 manager:(id)a4;
- (NSUUID)identifier;
- (id)customProperty:(id)a3;
- (id)customPropertyNames;
- (id)getTags;
- (id)peerStateToString:(int64_t)a3;
- (id)sendInternalSyncMsg:(int)a3 args:(id)a4;
- (int64_t)hostState;
- (int64_t)pairingState;
- (int64_t)role;
- (unint64_t)hash;
- (unint64_t)mtuLength;
- (unsigned)connectedTransport;
- (void)handleHostStateUpdated:(id)a3;
- (void)handleLinkEncryptionChanged:(id)a3;
- (void)handleMTUChanged:(id)a3;
- (void)handleMsg:(int)a3 args:(id)a4;
- (void)sendInternalMsg:(int)a3 args:(id)a4;
- (void)setConnectedTransport:(unsigned __int8)a3;
- (void)setCustomProperty:(id)a3 value:(id)a4;
- (void)setHostState:(int64_t)a3;
- (void)setIsLinkEncrypted:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setMtuLength:(unint64_t)a3;
- (void)setPairingState:(int64_t)a3;
- (void)setRole:(int64_t)a3;
- (void)tag:(id)a3;
- (void)untag:(id)a3;
@end

@implementation CBPeer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)pairingState
{
  return self->_pairingState;
}

- (CBManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (CBManager *)WeakRetained;
}

- (CBPeer)initWithInfo:(id)a3 manager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CBPeer;
  v8 = [(CBPeer *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    v10 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v9;

    v11 = [v6 objectForKeyedSubscript:@"kCBMsgArgATTMTU"];
    *((void *)v8 + 3) = [v11 unsignedIntegerValue];

    v12 = [v6 objectForKeyedSubscript:@"kCBMsgArgPairingState"];
    *((void *)v8 + 4) = [v12 integerValue];

    v8[8] = 0;
    *(_OWORD *)(v8 + 40) = xmmword_1ABA905D0;
    objc_storeWeak((id *)v8 + 7, v7);
    v13 = [v6 objectForKeyedSubscript:@"kCBMsgArgConnectionTransport"];
    v8[9] = [v13 unsignedIntegerValue];
  }
  return (CBPeer *)v8;
}

- (void)handleMsg:(int)a3 args:(id)a4
{
  id v6 = a4;
  if ((a3 - 164) < 3)
  {
    objc_msgSend(self, *off_1E5E339D8[a3 - 164], v6);
LABEL_3:

    return;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v7 = CBLogComponent;
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_3;
  }
  -[CBCentralManager handleMsg:args:](a3, v7);
}

- (id)peerStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"unknown";
  }
  else {
    return off_1E5E339F0[a3];
  }
}

- (void)handleMTUChanged:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgATTMTU"];
  -[CBPeer setMtuLength:](self, "setMtuLength:", [v4 unsignedIntegerValue]);
}

- (void)handleHostStateUpdated:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgState"];
  -[CBPeer setHostState:](self, "setHostState:", [v4 integerValue]);
}

- (void)handleLinkEncryptionChanged:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgState"];
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", [v4 BOOLValue]);
}

- (id)sendInternalSyncMsg:(int)a3 args:(id)a4
{
  unsigned __int16 v4 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v7 = [(CBPeer *)self identifier];
  [v6 setObject:v7 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  v8 = [(CBPeer *)self manager];
  uint64_t v9 = [v8 sendSyncMsg:v4 args:v6];

  return v9;
}

- (void)sendInternalMsg:(int)a3 args:(id)a4
{
  unsigned __int16 v4 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v9 = v6;
  id v7 = [(CBPeer *)self identifier];
  [v9 setObject:v7 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained sendMsg:v4 args:v9];
}

- (void)tag:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a3, @"kCBMsgArgName", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CBPeer *)self sendInternalMsg:168 args:v4];
}

- (void)untag:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a3, @"kCBMsgArgName", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CBPeer *)self sendInternalMsg:169 args:v4];
}

- (BOOL)hasTag:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a3, @"kCBMsgArgName", 0);
  v5 = [(CBPeer *)self sendInternalSyncMsg:170 args:v4];

  id v6 = [v5 objectForKeyedSubscript:@"kCBMsgArgData"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)getTags
{
  v2 = [(CBPeer *)self sendInternalSyncMsg:171 args:0];
  v3 = [v2 objectForKeyedSubscript:@"kCBMsgArgData"];

  return v3;
}

- (void)setCustomProperty:(id)a3 value:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a3, @"kCBMsgArgName", a4, @"kCBMsgArgValue", 0);
  [(CBPeer *)self sendInternalMsg:172 args:v5];
}

- (id)customProperty:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a3, @"kCBMsgArgName", 0);
  v5 = [(CBPeer *)self sendInternalSyncMsg:173 args:v4];

  id v6 = [v5 objectForKeyedSubscript:@"kCBMsgArgCustomPropertyValue"];

  return v6;
}

- (id)customPropertyNames
{
  v2 = [(CBPeer *)self sendInternalSyncMsg:174 args:0];
  v3 = [v2 objectForKeyedSubscript:@"kCBMsgArgCustomPropertyNames"];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(CBPeer *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unint64_t)mtuLength
{
  return self->_mtuLength;
}

- (void)setMtuLength:(unint64_t)a3
{
  self->_mtuLength = a3;
}

- (void)setPairingState:(int64_t)a3
{
  self->_pairingState = a3;
}

- (int64_t)hostState
{
  return self->_hostState;
}

- (void)setHostState:(int64_t)a3
{
  self->_hostState = a3;
}

- (BOOL)isLinkEncrypted
{
  return self->_isLinkEncrypted;
}

- (void)setIsLinkEncrypted:(BOOL)a3
{
  self->_isLinkEncrypted = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (void)setManager:(id)a3
{
}

- (unsigned)connectedTransport
{
  return self->_connectedTransport;
}

- (void)setConnectedTransport:(unsigned __int8)a3
{
  self->_connectedTransport = a3;
}

@end