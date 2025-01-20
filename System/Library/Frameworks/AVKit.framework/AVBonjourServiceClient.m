@interface AVBonjourServiceClient
+ (id)dictionaryFromTXTRecordData:(id)a3;
- (AVBonjourServiceClient)initWithNetServiceType:(id)a3;
- (AVBonjourServiceClientDelegate)delegate;
- (BOOL)_isServiceForCurrentAirPlayDevice:(id)a3;
- (NSNetServiceBrowser)netServiceBrowser;
- (NSString)description;
- (NSString)serviceType;
- (id)airTransportSenderForNetService:(id)a3;
- (id)identifierForNetService:(id)a3;
- (void)_updatedAirPlayPairedDeviceAsync;
- (void)airplayDeviceRef;
- (void)beginDiscovery;
- (void)dealloc;
- (void)endDiscovery;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceDidResolveAddress:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)netServiceWillResolve:(id)a3;
- (void)setAirplayDeviceRef:(void *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AVBonjourServiceClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_observeMRDeviceInfoDidChange, 0);
  objc_storeStrong(&self->_observeAirPlayVideoActiveDidChange, 0);
  objc_storeStrong((id *)&self->_netServiceIdentifierToChannel, 0);
  objc_storeStrong((id *)&self->_monitoringServices, 0);
  objc_storeStrong((id *)&self->_resolvingServices, 0);

  objc_storeStrong((id *)&self->_resolvedServices, 0);
}

- (void)airplayDeviceRef
{
  return self->_airplayDeviceRef;
}

- (NSNetServiceBrowser)netServiceBrowser
{
  return self->_netServiceBrowser;
}

- (void)setDelegate:(id)a3
{
}

- (AVBonjourServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVBonjourServiceClientDelegate *)WeakRetained;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  v4 = _avairlog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "didUpdateTXTRecordData", v5, 2u);
  }
}

- (void)netServiceDidStop:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _avairlog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 name];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "didStop resolution request %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28758]];
  v9 = _avairlog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "didNotResolve %@", buf, 0xCu);
  }

  if ([v8 integerValue] == -72007)
  {
    v10 = _avairlog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "didNotResolve %@ due to timeout!", buf, 0xCu);
    }

    dispatch_time_t v11 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__AVBonjourServiceClient_netService_didNotResolve___block_invoke;
    block[3] = &unk_1E5FC4698;
    id v13 = v6;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(NSMutableSet *)self->_resolvingServices removeObject:v6];
  }
}

uint64_t __51__AVBonjourServiceClient_netService_didNotResolve___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resolveWithTimeout:30.0];
}

- (void)netServiceDidResolveAddress:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  v5 = _avairlog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "didResolveAddress %@", (uint8_t *)&v18, 0xCu);
  }

  id v6 = objc_opt_class();
  id v7 = [v4 TXTRecordData];
  uint64_t v8 = [v6 dictionaryFromTXTRecordData:v7];

  v9 = [v8 objectForKeyedSubscript:@"receiverPairingIdentity"];
  v10 = _avairlog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    v19 = "-[AVBonjourServiceClient netServiceDidResolveAddress:]";
    __int16 v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s localAirPlayReceiverPairingIdentity = %@", (uint8_t *)&v18, 0x16u);
  }

  [(NSMutableSet *)self->_resolvedServices addObject:v4];
  [(NSMutableSet *)self->_resolvingServices removeObject:v4];
  dispatch_time_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"AVBonjourServiceClientDidResolveNetServiceNotification" object:v4];

  if ([(AVBonjourServiceClient *)self _isServiceForCurrentAirPlayDevice:v4])
  {
    v12 = _avairlog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "Found netService for the current AirPlay device; posting .DidResolveAirPlayDeviceNetServiceNotification..",
        (uint8_t *)&v18,
        2u);
    }

    id v13 = [(AVBonjourServiceClient *)self airTransportSenderForNetService:v4];
    v14 = [(AVBonjourServiceClient *)self delegate];

    if (!v14)
    {
      id v15 = _avairlog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "delegate has not been set!", (uint8_t *)&v18, 2u);
      }
    }
    uint64_t v16 = [(AVBonjourServiceClient *)self delegate];
    [v16 didConnectToBonjourService:v4 channel:v13];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:@"AVBonjourServiceClientDidResolveAirPlayDeviceNetServiceNotification" object:self];
  }
}

- (void)netServiceWillResolve:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _avairlog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "willResolve %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = _avairlog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "didRemoveService %@", (uint8_t *)&v9, 0xCu);
  }

  [v6 stopMonitoring];
  [v6 setDelegate:0];
  uint64_t v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v6 removeFromRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

  [(NSMutableSet *)self->_monitoringServices removeObject:v6];
  [(NSMutableSet *)self->_resolvingServices removeObject:v6];
  [(NSMutableSet *)self->_resolvedServices removeObject:v6];
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = _avairlog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "didFindService %@", (uint8_t *)&v9, 0xCu);
  }

  [v6 setDelegate:self];
  [(NSMutableSet *)self->_resolvingServices addObject:v6];
  uint64_t v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v6 scheduleInRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

  [v6 startMonitoring];
  [(NSMutableSet *)self->_monitoringServices addObject:v6];
  [v6 resolveWithTimeout:10.0];
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  int v5 = _avairlog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "didNotSearch (errorDict = %{public}@)", (uint8_t *)&v6, 0xCu);
  }
}

- (id)airTransportSenderForNetService:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(AVBonjourServiceClient *)self identifierForNetService:v4];
  int v6 = [(NSMutableDictionary *)self->_netServiceIdentifierToChannel objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v12 = 0;
    id v13 = 0;
    if ([v4 getInputStream:&v13 outputStream:&v12])
    {
      uint64_t v8 = +[AVAirTransport channelWithInput:v13 output:v12];
      [(NSMutableDictionary *)self->_netServiceIdentifierToChannel setObject:v8 forKeyedSubscript:v5];
      int v9 = _avairlog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v15 = "-[AVBonjourServiceClient airTransportSenderForNetService:]";
        __int16 v16 = 2112;
        id v17 = v4;
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ ===> %@", buf, 0x20u);
      }

      id v7 = v8;
    }
    else
    {
      id v10 = _avairlog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v15 = "-[AVBonjourServiceClient airTransportSenderForNetService:]";
        _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s failed to get the input/output streams!", buf, 0xCu);
      }

      id v7 = 0;
    }
  }

  return v7;
}

- (id)identifierForNetService:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 hostName];
  int v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"?host?";
  }
  uint64_t v8 = [v4 port];

  int v9 = [v3 stringWithFormat:@"<%@:%ld>", v7, v8];

  return v9;
}

- (BOOL)_isServiceForCurrentAirPlayDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AVBonjourServiceClient *)self airplayDeviceRef];
  uint64_t v5 = (void *)MRPairedDeviceCopyDeviceUID();
  int v6 = [v4 TXTRecordData];

  id v7 = +[AVBonjourServiceClient dictionaryFromTXTRecordData:v6];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"receiverPairingIdentity"];
  int v9 = _avairlog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    id v13 = "-[AVBonjourServiceClient _isServiceForCurrentAirPlayDevice:]";
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s current device UID = %{public}@; service identifier = %{public}@",
      (uint8_t *)&v12,
      0x20u);
  }

  char v10 = [v5 isEqualToString:v8];
  return v10;
}

- (void)_updatedAirPlayPairedDeviceAsync
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = _avairlog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v9 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]";
    __int16 v10 = 2048;
    uint64_t v11 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %p getting device info...", buf, 0x16u);
  }

  MRMediaRemoteSetWantsOriginChangeNotifications();
  id v4 = MEMORY[0x1E4F14428];
  v5[1] = (id)MEMORY[0x1E4F143A8];
  v5[2] = (id)3221225472;
  v5[3] = __58__AVBonjourServiceClient__updatedAirPlayPairedDeviceAsync__block_invoke;
  v5[4] = &unk_1E5FC22E8;
  objc_copyWeak(&v6, &location);
  MRMediaRemoteGetActiveOrigin();

  MRMediaRemoteGetLocalOrigin();
  objc_copyWeak(v5, &location);
  MRMediaRemoteGetDeviceInfo();

  objc_destroyWeak(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__AVBonjourServiceClient__updatedAirPlayPairedDeviceAsync__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = _avairlog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"SUCCESS";
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
    __int16 v12 = 2112;
    if (!a2) {
      id v7 = @"FAIL";
    }
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = a3;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s getActiveOrigin: %@, %@", buf, 0x20u);
  }

  id v8 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v9, (id *)(a1 + 32));
  MRMediaRemoteGetDeviceInfo();

  objc_destroyWeak(&v9);
}

void __58__AVBonjourServiceClient__updatedAirPlayPairedDeviceAsync__block_invoke_35(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = _avairlog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (v7)
    {
      int v20 = 138543362;
      v21 = a3;
      __int16 v14 = "_updateAirPlayPairedDeviceAsync failed; error = %{public}@";
LABEL_13:
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0xCu);
    }
LABEL_14:

    ValueAtIndex = 0;
    goto LABEL_22;
  }
  if (v7)
  {
    int v20 = 136315138;
    v21 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s have device info and device. Getting more information...", (uint8_t *)&v20, 0xCu);
  }

  CFArrayRef v8 = (const __CFArray *)MRPairedDeviceCopyGroupedDevices();
  if (!v8)
  {
    id v6 = _avairlog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = a2;
      __int16 v14 = "_updateAirPlayPairedDeviceAsync: no grouped devices: localDevice = %@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  CFArrayRef v9 = v8;
  if (CFArrayGetCount(v8) == 1)
  {
    ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v9, 0);
    uint64_t v11 = MEMORY[0x1B3E95BE0]();
    __int16 v12 = _avairlog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 == 4)
    {
      if (v13)
      {
        int v20 = 138412290;
        v21 = ValueAtIndex;
        _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "AppleTV pairedDeviceRef = %@", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_21;
    }
    if (v13)
    {
      int v20 = 138412290;
      v21 = ValueAtIndex;
      uint64_t v15 = "_updateAirPlayPairedDeviceAsync: first grouped device is not AppleTV (%@)";
      uint64_t v16 = v12;
      uint32_t v17 = 12;
      goto LABEL_19;
    }
  }
  else
  {
    __int16 v12 = _avairlog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      uint64_t v15 = "_updateAirPlayPairedDeviceAsync: grouped devices count != 1";
      uint64_t v16 = v12;
      uint32_t v17 = 2;
LABEL_19:
      _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
    }
  }
  ValueAtIndex = 0;
LABEL_21:

  CFRelease(v9);
LABEL_22:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAirplayDeviceRef:ValueAtIndex];
  v19 = _avairlog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    v21 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
    _os_log_impl(&dword_1B05B7000, v19, OS_LOG_TYPE_DEFAULT, "%s done.", (uint8_t *)&v20, 0xCu);
  }
}

void __58__AVBonjourServiceClient__updatedAirPlayPairedDeviceAsync__block_invoke_32(uint64_t a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return;
  }
  id v4 = _avairlog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint32_t v17 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s have [active] device info. Getting more information...", (uint8_t *)&v16, 0xCu);
  }

  CFArrayRef v5 = (const __CFArray *)MRPairedDeviceCopyGroupedDevices();
  if (!v5)
  {
    id WeakRetained = _avairlog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint32_t v17 = a2;
      _os_log_impl(&dword_1B05B7000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[active] no grouped devices; activeDevice = %@",
        (uint8_t *)&v16,
        0xCu);
    }
    goto LABEL_15;
  }
  CFArrayRef v6 = v5;
  if (CFArrayGetCount(v5) != 1)
  {
    CFArrayRef v9 = _avairlog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      BOOL v13 = "[active] grouped devices count != 1";
      __int16 v14 = v9;
      uint32_t v15 = 2;
LABEL_20:
      _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
    }
LABEL_21:

    CFRelease(v6);
    return;
  }
  ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v6, 0);
  uint64_t v8 = MEMORY[0x1B3E95BE0]();
  CFArrayRef v9 = _avairlog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 != 4)
  {
    if (v10)
    {
      int v16 = 138412290;
      uint32_t v17 = ValueAtIndex;
      BOOL v13 = "[active] first grouped device is not AppleTV (%@)";
      __int16 v14 = v9;
      uint32_t v15 = 12;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v10)
  {
    int v16 = 138412290;
    uint32_t v17 = ValueAtIndex;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "[active] AppleTV pairedDeviceRef = %@", (uint8_t *)&v16, 0xCu);
  }

  CFRelease(v6);
  if (ValueAtIndex)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setAirplayDeviceRef:ValueAtIndex];
    __int16 v12 = _avairlog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      uint32_t v17 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
      _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s [active] done.", (uint8_t *)&v16, 0xCu);
    }

LABEL_15:
  }
}

- (void)setAirplayDeviceRef:(void *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  airplayDeviceRef = self->_airplayDeviceRef;
  if (airplayDeviceRef != a3)
  {
    if (a3) {
      CFRetain(a3);
    }
    self->_airplayDeviceRef = a3;
    if (airplayDeviceRef) {
      CFRelease(airplayDeviceRef);
    }
    CFArrayRef v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"AVExternalDeviceAControllerirPlayDeviceRefDidChangeNotification" object:self];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v7 = self->_resolvedServices;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if ([(AVBonjourServiceClient *)self _isServiceForCurrentAirPlayDevice:v12])
          {
            BOOL v13 = _avairlog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v19 = 0;
              _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "Found service for the current AirPlay device! Posting AVBonjourServiceClientDidResolveAirPlayDeviceNetServiceNotification..", v19, 2u);
            }

            __int16 v14 = [(AVBonjourServiceClient *)self airTransportSenderForNetService:v12];
            uint32_t v15 = [(AVBonjourServiceClient *)self delegate];

            if (!v15)
            {
              int v16 = _avairlog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v19 = 0;
                _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "delegate has not been set!", v19, 2u);
              }
            }
            uint32_t v17 = [(AVBonjourServiceClient *)self delegate];
            [v17 didConnectToBonjourService:v12 channel:v14];

            uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v18 postNotificationName:@"AVBonjourServiceClientDidResolveAirPlayDeviceNetServiceNotification" object:self];
          }
        }
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
  }
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(AVBonjourServiceClient *)self serviceType];
  CFArrayRef v5 = [(AVBonjourServiceClient *)self delegate];
  CFArrayRef v6 = (objc_class *)objc_opt_class();
  BOOL v7 = NSStringFromClass(v6);
  uint64_t v8 = [(AVBonjourServiceClient *)self delegate];
  uint64_t v9 = [v3 stringWithFormat:@"<AVBonjourServiceClient %p (%@); delegate <%@ %p>>", self, v4, v7, v8];

  return (NSString *)v9;
}

- (void)endDiscovery
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_discovering)
  {
    id v3 = _avairlog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serviceType = self->_serviceType;
      int v5 = 138543362;
      CFArrayRef v6 = serviceType;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "Stopping discovery for %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [(NSNetServiceBrowser *)self->_netServiceBrowser stop];
    self->_discovering = 0;
  }
}

- (void)beginDiscovery
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_discovering)
  {
    id v3 = _avairlog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serviceType = self->_serviceType;
      int v5 = 138543362;
      CFArrayRef v6 = serviceType;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "Beginning discovery for %{public}@...", (uint8_t *)&v5, 0xCu);
    }

    [(NSNetServiceBrowser *)self->_netServiceBrowser searchForServicesOfType:self->_serviceType inDomain:@"local"];
    self->_discovering = 1;
  }
}

- (void)dealloc
{
  [(AVBonjourServiceClient *)self endDiscovery];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_observeAirPlayVideoActiveDidChange];

  v4.receiver = self;
  v4.super_class = (Class)AVBonjourServiceClient;
  [(AVBonjourServiceClient *)&v4 dealloc];
}

- (AVBonjourServiceClient)initWithNetServiceType:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AVBonjourServiceClient;
  int v5 = [(AVBonjourServiceClient *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceType = v5->_serviceType;
    v5->_serviceType = (NSString *)v6;

    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    resolvingServices = v5->_resolvingServices;
    v5->_resolvingServices = v8;

    uint64_t v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    resolvedServices = v5->_resolvedServices;
    v5->_resolvedServices = v10;

    uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    monitoringServices = v5->_monitoringServices;
    v5->_monitoringServices = v12;

    __int16 v14 = (NSNetServiceBrowser *)objc_alloc_init(MEMORY[0x1E4F28E98]);
    netServiceBrowser = v5->_netServiceBrowser;
    v5->_netServiceBrowser = v14;

    [(NSNetServiceBrowser *)v5->_netServiceBrowser setIncludesPeerToPeer:1];
    [(NSNetServiceBrowser *)v5->_netServiceBrowser setDelegate:v5];
    int v16 = v5->_netServiceBrowser;
    uint32_t v17 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(NSNetServiceBrowser *)v16 scheduleInRunLoop:v17 forMode:*MEMORY[0x1E4F1C4B0]];

    uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    netServiceIdentifierToChannel = v5->_netServiceIdentifierToChannel;
    v5->_netServiceIdentifierToChannel = v18;

    objc_initWeak(&location, v5);
    long long v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v21 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v22 = *MEMORY[0x1E4F15A38];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __49__AVBonjourServiceClient_initWithNetServiceType___block_invoke;
    v31[3] = &unk_1E5FC3168;
    objc_copyWeak(&v32, &location);
    uint64_t v23 = [v20 addObserverForName:v22 object:0 queue:v21 usingBlock:v31];
    id observeAirPlayVideoActiveDidChange = v5->_observeAirPlayVideoActiveDidChange;
    v5->_id observeAirPlayVideoActiveDidChange = (id)v23;

    uint64_t v25 = *MEMORY[0x1E4F77160];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__AVBonjourServiceClient_initWithNetServiceType___block_invoke_16;
    v29[3] = &unk_1E5FC3168;
    objc_copyWeak(&v30, &location);
    uint64_t v26 = [v20 addObserverForName:v25 object:0 queue:v21 usingBlock:v29];
    id observeMRDeviceInfoDidChange = v5->_observeMRDeviceInfoDidChange;
    v5->_id observeMRDeviceInfoDidChange = (id)v26;

    [(AVBonjourServiceClient *)v5 _updatedAirPlayPairedDeviceAsync];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __49__AVBonjourServiceClient_initWithNetServiceType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = _avairlog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[AVBonjourServiceClient initWithNetServiceType:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s AVExternalPlaybackMonitorAirPlayVideoActiveDidChangeNotification received; note = %{public}@",
      (uint8_t *)&v6,
      0x16u);
  }

  [WeakRetained _updatedAirPlayPairedDeviceAsync];
}

void __49__AVBonjourServiceClient_initWithNetServiceType___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = _avairlog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[AVBonjourServiceClient initWithNetServiceType:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s kMRDeviceInfoDidChangeNotification received; note = %{public}@",
      (uint8_t *)&v6,
      0x16u);
  }

  [WeakRetained _updatedAirPlayPairedDeviceAsync];
}

+ (id)dictionaryFromTXTRecordData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E90] dictionaryFromTXTRecordData:a3];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
          [v4 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end