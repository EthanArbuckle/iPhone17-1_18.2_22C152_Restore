@interface CDPDManateeStateObserver
- (CDPBroadcaster)broadcaster;
- (CDPDManateeStateObserver)init;
- (CDPDManateeStateObserver)initWithBroadcaster:(id)a3;
- (id)_proxyForContext:(id)a3;
- (void)_checkManateeStatusAndSendAvailabilityNotificationForContext:(id)a3;
- (void)_reportPrimaryAccountManateeAvailability:(BOOL)a3;
- (void)_sendNotification:(const char *)a3 withUserInfo:(id)a4;
- (void)circleStatusChangedForAccountContext:(id)a3;
- (void)circleViewStatusChangedForAccountContext:(id)a3;
- (void)deviceDidUnlock;
- (void)securityLevelChangedForAccountContext:(id)a3;
@end

@implementation CDPDManateeStateObserver

- (CDPDManateeStateObserver)init
{
  v3 = objc_alloc_init(CDPBroadcaster);
  v4 = [(CDPDManateeStateObserver *)self initWithBroadcaster:v3];

  return v4;
}

- (CDPDManateeStateObserver)initWithBroadcaster:(id)a3
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDPDManateeStateObserver;
  v7 = [(CDPDManateeStateObserver *)&v14 init];
  p_isa = (id *)&v7->super.isa;
  if (!v7)
  {
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CDPBroadcaster init](a2);
    }
    goto LABEL_8;
  }

  id v9 = v6;
  if (!v9)
  {
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(CDPBroadcaster *)(uint64_t)p_isa init];
    }
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  v10 = v9;
  objc_storeStrong(p_isa + 1, a3);

  v11 = p_isa;
LABEL_9:

  return v11;
}

- (void)_sendNotification:(const char *)a3 withUserInfo:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  id v9 = [v6 stringWithCString:a3 encoding:4];
  v8 = [(CDPDManateeStateObserver *)self broadcaster];
  [v8 sendNotification:v9 userInfo:v7];
}

- (void)_reportPrimaryAccountManateeAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x263EF8340];
  v5 = _CDPLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)v11 = 0;
      id v7 = "All systems go!!! Manatee available for primary account";
LABEL_6:
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, v7, v11, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)v11 = 0;
    id v7 = "All systems are not go... Manatee not available for primary account";
    goto LABEL_6;
  }

  uint64_t v8 = *MEMORY[0x263F342A0];
  uint64_t v12 = *MEMORY[0x263F342A8];
  id v9 = [NSNumber numberWithBool:v3];
  v13[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [(CDPDManateeStateObserver *)self _sendNotification:v8 withUserInfo:v10];
}

- (void)_checkManateeStatusAndSendAvailabilityNotificationForContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 isSharediPad];
  BOOL v6 = _CDPLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CDPDManateeStateObserver _checkManateeStatusAndSendAvailabilityNotificationForContext:](v7);
    }
    goto LABEL_20;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  id v9 = (void *)MEMORY[0x263F34298];
  if (v8)
  {
    uint64_t v10 = *MEMORY[0x263F34298];
    *(_DWORD *)buf = 136446210;
    uint64_t v25 = v10;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Sending %{public}s to notify clients of potential manatee changes", buf, 0xCu);
  }

  [(CDPDManateeStateObserver *)self _sendNotification:*v9 withUserInfo:0];
  +[CDPBroadcaster broadcastWalrusStateChangeNotification];
  char v11 = [v4 isPrimaryAccount];
  id v7 = _CDPLogSystem();
  BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      v13 = [v4 altDSID];
      *(_DWORD *)buf = 141558274;
      uint64_t v25 = 1752392040;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Checking manatee status for primary account with altDSID %{mask.hash}@", buf, 0x16u);
    }
    id v7 = [(CDPDManateeStateObserver *)self _proxyForContext:v4];
    objc_super v14 = (void *)[objc_alloc(MEMORY[0x263F343C0]) initWithContext:v4 circleProxy:v7];
    id v23 = 0;
    int v15 = [v14 isManateeAvailable:&v23];
    id v16 = v23;
    v17 = v16;
    if (v15)
    {
      v18 = self;
      uint64_t v19 = 1;
    }
    else
    {
      if (objc_msgSend(v16, "cdp_isCDPErrorWithCode:", -5403))
      {
        v21 = _CDPLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v4 altDSID];
          *(_DWORD *)buf = 141558274;
          uint64_t v25 = 1752392040;
          __int16 v26 = 2112;
          v27 = v22;
          _os_log_impl(&dword_218640000, v21, OS_LOG_TYPE_DEFAULT, "We are iCDP eligible for %{mask.hash}@, but Security is not ready, waiting for Security state resolution..", buf, 0x16u);
        }
        goto LABEL_19;
      }
      v18 = self;
      uint64_t v19 = 0;
    }
    [(CDPDManateeStateObserver *)v18 _reportPrimaryAccountManateeAvailability:v19];
LABEL_19:

    goto LABEL_20;
  }
  if (v12)
  {
    v20 = [v4 altDSID];
    *(_DWORD *)buf = 141558274;
    uint64_t v25 = 1752392040;
    __int16 v26 = 2112;
    v27 = v20;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Account for altDSID %{mask.hash}@ is not primary, skipping additonal manatee status check.", buf, 0x16u);
  }
LABEL_20:
}

- (void)securityLevelChangedForAccountContext:(id)a3
{
  id v4 = a3;
  int v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Processing auth status change to calculate manatee availability", buf, 2u);
  }

  [(CDPDManateeStateObserver *)self _checkManateeStatusAndSendAvailabilityNotificationForContext:v4];
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Processed auth status change event", v7, 2u);
  }
}

- (void)circleStatusChangedForAccountContext:(id)a3
{
  id v4 = a3;
  int v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Processing circle status change to calculate manatee availability", buf, 2u);
  }

  [(CDPDManateeStateObserver *)self _checkManateeStatusAndSendAvailabilityNotificationForContext:v4];
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Processed circle state change event", v7, 2u);
  }
}

- (void)circleViewStatusChangedForAccountContext:(id)a3
{
  id v4 = a3;
  int v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Processing circle view change event", buf, 2u);
  }

  [(CDPDManateeStateObserver *)self _checkManateeStatusAndSendAvailabilityNotificationForContext:v4];
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Processed circle view change event", v7, 2u);
  }
}

- (void)deviceDidUnlock
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 altDSID];
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = [v3 isPrimaryAccount];
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Fetching manatee status after device unlock with altDSID=%@, isPrimaryAccount=%{BOOL}d", (uint8_t *)&v9, 0x12u);
  }
  [(CDPDManateeStateObserver *)self _checkManateeStatusAndSendAvailabilityNotificationForContext:v3];
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 altDSID];
    int v8 = [v3 isPrimaryAccount];
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v8;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Fetched manatee status after device unlock with altDSID=%@, isPrimaryAccount=%{BOOL}d", (uint8_t *)&v9, 0x12u);
  }
}

- (id)_proxyForContext:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F34340];
  id v4 = a3;
  int v5 = (void *)[[v3 alloc] initWithContext:v4];

  return v5;
}

- (CDPBroadcaster)broadcaster
{
  return self->_broadcaster;
}

- (void).cxx_destruct
{
}

- (void)_checkManateeStatusAndSendAvailabilityNotificationForContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "CDPDManateeStateObserver: Manatee is not supported on MAID accounts on shared iPad", v1, 2u);
}

@end