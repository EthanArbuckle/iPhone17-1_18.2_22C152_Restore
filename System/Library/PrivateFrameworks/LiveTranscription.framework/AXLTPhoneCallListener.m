@interface AXLTPhoneCallListener
+ (id)sharedInstance;
- (AXLTPhoneCallListener)init;
- (AXLTPhoneCallListenerDelegate)delegate;
- (BOOL)isCallActive;
- (CXCallObserver)callObserver;
- (TUCallCenter)callCenter;
- (int64_t)utilityType;
- (void)_startObserving;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)callStatusChanged:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setCallObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUtilityType:(int64_t)a3;
@end

@implementation AXLTPhoneCallListener

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_phoneCallObserver;
  return v2;
}

uint64_t __39__AXLTPhoneCallListener_sharedInstance__block_invoke()
{
  sharedInstance_phoneCallObserver = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (AXLTPhoneCallListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXLTPhoneCallListener;
  v2 = [(AXLTPhoneCallListener *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXLTPhoneCallListener *)v2 _startObserving];
  }
  return v3;
}

- (void)setUtilityType:(int64_t)a3
{
  if (self->_utilityType != a3)
  {
    self->_utilityType = a3;
    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    if (self->_utilityType)
    {
      [(CXCallObserver *)self->_callObserver setDelegate:0 queue:0];
      callObserver = self->_callObserver;
      self->_callObserver = 0;

      objc_super v5 = [MEMORY[0x263F7E1A0] sharedInstance];
      callCenter = self->_callCenter;
      self->_callCenter = v5;

      [v10 addObserver:self selector:sel_callStatusChanged_ name:*MEMORY[0x263F7E310] object:0];
      [v10 addObserver:self selector:sel_callStatusChanged_ name:*MEMORY[0x263F7E328] object:0];
    }
    else
    {
      v7 = self->_callCenter;
      self->_callCenter = 0;

      [v10 removeObserver:self name:*MEMORY[0x263F7E310] object:0];
      [v10 removeObserver:self name:*MEMORY[0x263F7E328] object:0];
      v8 = (CXCallObserver *)objc_opt_new();
      v9 = self->_callObserver;
      self->_callObserver = v8;

      [(CXCallObserver *)self->_callObserver setDelegate:self queue:0];
    }
  }
}

- (BOOL)isCallActive
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_utilityType)
  {
    v3 = [(TUCallCenter *)self->_callCenter currentCalls];
    if ([v3 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      v12 = [(TUCallCenter *)self->_callCenter currentVideoCalls];
      BOOL v4 = [v12 count] != 0;
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v5 = [(AXLTPhoneCallListener *)self callObserver];
    v6 = [v5 calls];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 hasConnected] && !objc_msgSend(v11, "hasEnded"))
          {

            return 1;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    return 0;
  }
  return v4;
}

- (void)_startObserving
{
  v3 = objc_opt_new();
  [(AXLTPhoneCallListener *)self setCallObserver:v3];

  id v4 = [(AXLTPhoneCallListener *)self callObserver];
  [v4 setDelegate:self queue:0];
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v13 = a4;
  if (([v13 hasConnected] & 1) == 0 && (objc_msgSend(v13, "hasEnded") & 1) == 0)
  {
    uint64_t v9 = [(AXLTPhoneCallListener *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v7 = [(AXLTPhoneCallListener *)self delegate];
    [v7 phoneCallListenerCallDialing:self];
    goto LABEL_13;
  }
  if ([v13 hasConnected] && (objc_msgSend(v13, "hasEnded") & 1) == 0)
  {
    v11 = [(AXLTPhoneCallListener *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v7 = [(AXLTPhoneCallListener *)self delegate];
    uint64_t v8 = [v13 UUID];
    [v7 phoneCallListenerCallConnected:self callID:v8];
    goto LABEL_12;
  }
  if ([v13 hasEnded])
  {
    objc_super v5 = [(AXLTPhoneCallListener *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(AXLTPhoneCallListener *)self delegate];
      uint64_t v8 = [v13 UUID];
      [v7 phoneCallListenerCallEnded:self callID:v8];
LABEL_12:

LABEL_13:
    }
  }
LABEL_14:
}

- (void)callStatusChanged:(id)a3
{
  id v17 = a3;
  id v4 = [v17 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v6 = [v17 object];
  }
  else
  {
    char v6 = 0;
  }
  id v7 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v8 = [v6 callUUID];
  uint64_t v9 = (void *)[v7 initWithUUIDString:v8];

  if ([v6 status] == 4)
  {
    char v10 = [(AXLTPhoneCallListener *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_14;
    }
    char v12 = [(AXLTPhoneCallListener *)self delegate];
    [v12 phoneCallListenerCallDialing:self];
    goto LABEL_13;
  }
  if ([v6 status] == 1)
  {
    id v13 = [(AXLTPhoneCallListener *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_14;
    }
    char v12 = [(AXLTPhoneCallListener *)self delegate];
    [v12 phoneCallListenerCallConnected:self callID:v9];
    goto LABEL_13;
  }
  if ([v6 status] == 6)
  {
    long long v15 = [(AXLTPhoneCallListener *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      char v12 = [(AXLTPhoneCallListener *)self delegate];
      [v12 phoneCallListenerCallEnded:self callID:v9];
LABEL_13:
    }
  }
LABEL_14:
}

- (AXLTPhoneCallListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXLTPhoneCallListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)utilityType
{
  return self->_utilityType;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end