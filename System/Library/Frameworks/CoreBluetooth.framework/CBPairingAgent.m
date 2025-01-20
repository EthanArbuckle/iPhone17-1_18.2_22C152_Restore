@interface CBPairingAgent
- (BOOL)isPeerCloudPaired:(id)a3;
- (BOOL)isPeerMagicPaired:(id)a3;
- (BOOL)isPeerPaired:(id)a3;
- (BOOL)useOOBMode;
- (CBPairingAgent)initWithParentManager:(id)a3;
- (CBPairingAgentDelegate)delegate;
- (CBPairingAgentParentDelegate)parentManager;
- (id)retrieveOOBDataForPeer:(id)a3;
- (id)retrievePairedPeers;
- (void)dealloc;
- (void)handlePairingCompleted:(id)a3;
- (void)handlePairingMessage:(unsigned __int16)a3 args:(id)a4;
- (void)handlePairingRequested:(id)a3;
- (void)handleUnpaired:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pairPeer:(id)a3;
- (void)pairPeer:(id)a3 options:(id)a4;
- (void)pairPeer:(id)a3 useMITM:(BOOL)a4;
- (void)respondToPairingRequest:(id)a3 type:(int64_t)a4 accept:(BOOL)a5 data:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setOOBPairingEnabled:(BOOL)a3 forPeer:(id)a4;
- (void)setParentManager:(id)a3;
- (void)setUseOOBMode:(BOOL)a3;
- (void)unpairPeer:(id)a3;
- (void)unpairPeer:(id)a3 options:(id)a4;
- (void)updateRegistration;
@end

@implementation CBPairingAgent

- (BOOL)isPeerPaired:(id)a3
{
  return [a3 pairingState] != 0;
}

- (CBPairingAgent)initWithParentManager:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CBPairingAgent;
  v5 = [(CBPairingAgent *)&v25 init];
  v6 = v5;
  if (v5)
  {
    [(CBPairingAgent *)v5 setParentManager:v4];
    v7 = [(CBPairingAgent *)v6 parentManager];
    [v7 sendMsg:8 args:MEMORY[0x1E4F1CC08]];

    v8 = [(CBPairingAgent *)v6 parentManager];
    v9 = [v8 sendSyncMsg:10 args:0];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v20 = v9;
    v10 = [v9 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
          v16 = [(CBPairingAgent *)v6 parentManager];
          v17 = [v16 peerWithInfo:v15];

          v18 = [v15 objectForKeyedSubscript:@"kCBMsgArgPairingState"];
          objc_msgSend(v17, "setPairingState:", objc_msgSend(v18, "integerValue"));

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    [(CBPairingAgent *)v6 addObserver:v6 forKeyPath:@"delegate" options:0 context:objc_opt_class()];
  }

  return v6;
}

- (void)dealloc
{
  [(CBPairingAgent *)self removeObserver:self forKeyPath:@"delegate" context:objc_opt_class()];
  v3.receiver = self;
  v3.super_class = (Class)CBPairingAgent;
  [(CBPairingAgent *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  if (objc_opt_class() == a6)
  {
    int v13 = [v12 isEqualToString:@"delegate"];

    if (v13) {
      [(CBPairingAgent *)self updateRegistration];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CBPairingAgent;
    [(CBPairingAgent *)&v14 observeValueForKeyPath:v12 ofObject:v10 change:v11 context:a6];
  }
}

- (void)updateRegistration
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CBPairingAgent *)self delegate];

  if (v3)
  {
    id v4 = [(CBPairingAgent *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    v6 = [(CBPairingAgent *)self parentManager];
    id v10 = @"kCBMsgArgProgrammaticPairing";
    v7 = [NSNumber numberWithBool:v5 & 1];
    v11[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v6 sendMsg:8 args:v8];
  }
  else
  {
    id v9 = [(CBPairingAgent *)self parentManager];
    [v9 sendMsg:8 args:MEMORY[0x1E4F1CC08]];
  }
}

- (BOOL)isPeerCloudPaired:(id)a3
{
  return [a3 pairingState] == 2;
}

- (BOOL)isPeerMagicPaired:(id)a3
{
  return [a3 pairingState] == 3;
}

- (id)retrievePairedPeers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CBPairingAgent *)self parentManager];
  id v4 = [v3 sendSyncMsg:10 args:0];

  char v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kCBMsgArgDevices", 0);
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
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [(CBPairingAgent *)self parentManager];
        int v13 = [v12 peerWithInfo:v11];

        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)pairPeer:(id)a3
{
}

- (void)pairPeer:(id)a3 useMITM:(BOOL)a4
{
  BOOL v4 = a4;
  v12[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CBPairingAgent.m", 118, @"Invalid parameter not satisfying: %@", @"peer" object file lineNumber description];
  }
  v11[0] = @"kCBMsgArgPairingOptionsUseMITMAuthentication";
  uint64_t v8 = [NSNumber numberWithBool:v4];
  v11[1] = @"kCBMsgArgPairingOptionsDistributeIRK";
  v12[0] = v8;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [(CBPairingAgent *)self pairPeer:v7 options:v9];
}

- (void)pairPeer:(id)a3 options:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v12)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBPairingAgent.m", 125, @"Invalid parameter not satisfying: %@", @"peer" object file lineNumber description];
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
  uint64_t v9 = [v12 identifier];
  [v8 setObject:v9 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  id v10 = [(CBPairingAgent *)self parentManager];
  [v10 sendMsg:11 args:v8];
}

- (void)unpairPeer:(id)a3 options:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v10 = [v6 dictionaryWithDictionary:a4];
  uint64_t v8 = [v7 identifier];

  [v10 setObject:v8 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v9 = [(CBPairingAgent *)self parentManager];
  [v9 sendMsg:13 args:v10];
}

- (void)unpairPeer:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"CBPairingAgent.m", 143, @"Invalid parameter not satisfying: %@", @"peer" object file lineNumber description];

    id v5 = 0;
  }
  [(CBPairingAgent *)self unpairPeer:v5 options:MEMORY[0x1E4F1CC08]];
}

- (void)respondToPairingRequest:(id)a3 type:(int64_t)a4 accept:(BOOL)a5 data:(id)a6
{
  BOOL v7 = a5;
  id v18 = a3;
  id v11 = a6;
  if (!v18)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CBPairingAgent.m", 149, @"Invalid parameter not satisfying: %@", @"peer" object file lineNumber description];
  }
  id v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
  int v13 = [v18 identifier];
  [v12 setObject:v13 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  objc_super v14 = [NSNumber numberWithInteger:a4];
  [v12 setObject:v14 forKeyedSubscript:@"kCBMsgArgPairingType"];

  long long v15 = [NSNumber numberWithBool:v7];
  [v12 setObject:v15 forKeyedSubscript:@"kCBMsgArgPairingAccept"];

  long long v16 = [(CBPairingAgent *)self parentManager];
  [v16 sendMsg:12 args:v12];
}

- (void)setUseOOBMode:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_useOOBMode != a3)
  {
    self->_useOOBMode = a3;
    BOOL v4 = [(CBPairingAgent *)self parentManager];
    BOOL v7 = @"kCBMsgArgUseOOBPairing";
    id v5 = [NSNumber numberWithBool:self->_useOOBMode];
    v8[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 sendMsg:14 args:v6];
  }
}

- (id)retrieveOOBDataForPeer:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CBPairingAgent *)self parentManager];
  v6 = v5;
  if (v4)
  {
    id v12 = @"kCBMsgArgDeviceUUID";
    BOOL v7 = [v4 identifier];
    v13[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v9 = [v6 sendSyncMsg:15 args:v8];
  }
  else
  {
    uint64_t v9 = [v5 sendSyncMsg:15 args:MEMORY[0x1E4F1CC08]];
  }

  id v10 = [v9 objectForKeyedSubscript:@"kCBMsgArgPairingData"];

  return v10;
}

- (void)setOOBPairingEnabled:(BOOL)a3 forPeer:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  v6 = (void *)MEMORY[0x1E4F1CA60];
  BOOL v7 = [NSNumber numberWithBool:v4];
  uint64_t v8 = [v6 dictionaryWithObject:v7 forKey:@"kCBMsgArgUseOOBPairing"];

  if (v11)
  {
    uint64_t v9 = [v11 identifier];
    [v8 setObject:v9 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  }
  id v10 = [(CBPairingAgent *)self parentManager];
  [v10 sendMsg:14 args:v8];
}

- (void)handlePairingRequested:(id)a3
{
  id v4 = a3;
  id v5 = [(CBPairingAgent *)self parentManager];
  id v12 = [v5 peerWithInfo:v4];

  v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgPairingType"];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgPairingPasskey"];

  uint64_t v9 = [(CBPairingAgent *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(CBPairingAgent *)self delegate];
    [v11 pairingAgent:self peerDidRequestPairing:v12 type:v7 passkey:v8];
  }
}

- (void)handlePairingCompleted:(id)a3
{
  id v13 = a3;
  id v4 = [(CBPairingAgent *)self parentManager];
  id v5 = [v4 peerWithInfo:v13];

  v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v13];
  if (v6)
  {
    uint64_t v7 = [(CBPairingAgent *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v9 = [(CBPairingAgent *)self delegate];
    [v9 pairingAgent:self peerDidFailToCompletePairing:v5 error:v6];
  }
  else
  {
    char v10 = [v13 objectForKeyedSubscript:@"kCBMsgArgPairingState"];
    objc_msgSend(v5, "setPairingState:", objc_msgSend(v10, "integerValue"));

    id v11 = [(CBPairingAgent *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v9 = [(CBPairingAgent *)self delegate];
    [v9 pairingAgent:self peerDidCompletePairing:v5];
  }

LABEL_7:
}

- (void)handleUnpaired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CBPairingAgent *)self parentManager];
  id v8 = [(id)v5 peerWithInfo:v4];

  [v8 setPairingState:0];
  v6 = [(CBPairingAgent *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v7 = [(CBPairingAgent *)self delegate];
    [v7 pairingAgent:self peerDidUnpair:v8];
  }
}

- (void)handlePairingMessage:(unsigned __int16)a3 args:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  if ((v4 - 16) < 3)
  {
    objc_msgSend(self, *off_1E5E352B0[(__int16)(v4 - 16)], v6);
LABEL_3:

    return;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  uint64_t v7 = CBLogComponent;
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_3;
  }
  -[CBCentralManager handleMsg:args:](v4, v7);
}

- (CBPairingAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CBPairingAgentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useOOBMode
{
  return self->_useOOBMode;
}

- (CBPairingAgentParentDelegate)parentManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentManager);

  return (CBPairingAgentParentDelegate *)WeakRetained;
}

- (void)setParentManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentManager);

  objc_destroyWeak((id *)&self->_delegate);
}

@end