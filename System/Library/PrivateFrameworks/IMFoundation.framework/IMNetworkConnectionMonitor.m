@interface IMNetworkConnectionMonitor
- (BOOL)_isConnected;
- (BOOL)_isSleeping;
- (BOOL)isImmediatelyReachable;
- (CUTDeferredTaskQueue)performCallbackTask;
- (IMReachability)_hostReachability;
- (IMReachability)_ipReachability;
- (unint64_t)_hostFlags;
- (unint64_t)_ipFlags;
- (void)_clearReachability:(id *)a3 flags:(unint64_t *)a4;
- (void)_doCallbackLater;
- (void)_doCallbackNow;
- (void)_networkManagedUpdated:(id)a3;
- (void)_setup;
- (void)_setupReachability;
- (void)clear;
- (void)dealloc;
- (void)goConnectedWithLocalSocketAddress:(id)a3 remoteSocketAddress:(id)a4;
- (void)goDisconnected;
- (void)reachabilityDidChange:(id)a3;
- (void)set_hostFlags:(unint64_t)a3;
- (void)set_hostReachability:(id)a3;
- (void)set_ipFlags:(unint64_t)a3;
- (void)set_ipReachability:(id)a3;
- (void)set_isConnected:(BOOL)a3;
- (void)set_isSleeping:(BOOL)a3;
- (void)systemDidWake;
- (void)systemWillSleep;
@end

@implementation IMNetworkConnectionMonitor

- (void)dealloc
{
  if (_IMWillLog(@"IMConnectionMonitor")) {
    _IMAlwaysLog(0, @"IMConnectionMonitor", @"-[%@ dealloc]", v5, v6, v7, v8, v9, (char)self);
  }
  v10 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, 0, 0);

  v15 = objc_msgSend_sharedInstance(IMSystemMonitor, v12, v13, v14);
  objc_msgSend__removeEarlyListener_(v15, v16, (uint64_t)self, v17);

  objc_msgSend__clearReachability_flags_(self, v18, (uint64_t)&self->_ipReachability, (uint64_t)&self->_ipFlags);
  objc_msgSend__clearReachability_flags_(self, v19, (uint64_t)&self->_hostReachability, (uint64_t)&self->_hostFlags);
  v20.receiver = self;
  v20.super_class = (Class)IMNetworkConnectionMonitor;
  [(IMNetworkConnectionMonitor *)&v20 dealloc];
}

- (void)_clearReachability:(id *)a3 flags:(unint64_t *)a4
{
  objc_msgSend_setDelegate_(*a3, a2, 0, (uint64_t)a4);
  id v6 = *a3;
  *a3 = 0;

  *a4 = 0;
}

- (void)_doCallbackNow
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = OSLogHandleForIDSCategory("IMConnectionMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ _doCallbackNow]", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend_cancelPendingExecutions(self->_performCallbackTask, v4, v5, v6);
  v10 = objc_msgSend_delegate(self, v7, v8, v9);
  objc_msgSend_connectionMonitorDidUpdate_(v10, v11, (uint64_t)self, v12);
}

- (void)_doCallbackLater
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = OSLogHandleForIDSCategory("IMConnectionMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ _doCallbackLater]", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_cancelPendingExecutions(self->_performCallbackTask, v4, v5, v6);
  objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_performCallbackTask, v7, (uint64_t)self, v8, 0.001);
}

- (void)_setupReachability
{
  p_hostReachability = &self->_hostReachability;
  objc_msgSend__clearReachability_flags_(self, a2, (uint64_t)&self->_hostReachability, (uint64_t)&self->_hostFlags);
  objc_msgSend_remoteHost(self, v4, v5, v6);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_length(v18, v7, v8, v9);
  uint64_t v11 = [IMReachability alloc];
  if (v10) {
    uint64_t v13 = objc_msgSend_initWithRemoteHost_delegate_(v11, v12, (uint64_t)v18, (uint64_t)self);
  }
  else {
    uint64_t v13 = objc_msgSend_initWithLocalSocketAddress_remoteSocketAddress_delegate_(v11, v12, 0, 0, self);
  }
  uint64_t v14 = *p_hostReachability;
  *p_hostReachability = (IMReachability *)v13;

  self->_isConnected = 1;
  objc_msgSend_goDisconnected(self, v15, v16, v17);
}

- (void)reachabilityDidChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (IMReachability *)a3;
  uint64_t v8 = objc_msgSend_flags(v4, v5, v6, v7);
  unint64_t v9 = v8;
  if (self->_hostReachability == v4)
  {
    p_hostFlags = &self->_hostFlags;
    if (self->_hostFlags != v8)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("IMConnectionMonitor");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v13 = *p_hostFlags;
        int v17 = 138412802;
        id v18 = self;
        __int16 v19 = 1024;
        int v20 = v13;
        __int16 v21 = 1024;
        int v22 = v9;
        _os_log_impl(&dword_191892000, v11, OS_LOG_TYPE_DEFAULT, "-[%@ reachabilityDidChange:].  _hostFlags: 0x%06x -> 0x%06x", (uint8_t *)&v17, 0x18u);
      }
      goto LABEL_10;
    }
  }
  if (self->_ipReachability == v4)
  {
    p_hostFlags = &self->_ipFlags;
    if (self->_ipFlags != v8)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("IMConnectionMonitor");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v12 = *p_hostFlags;
        int v17 = 138412802;
        id v18 = self;
        __int16 v19 = 1024;
        int v20 = v12;
        __int16 v21 = 1024;
        int v22 = v9;
        _os_log_impl(&dword_191892000, v11, OS_LOG_TYPE_DEFAULT, "-[%@ reachabilityDidChange:].  _ipFlags: 0x%06x -> 0x%06x", (uint8_t *)&v17, 0x18u);
      }
LABEL_10:

      unint64_t *p_hostFlags = v9;
      objc_msgSend__doCallbackLater(self, v14, v15, v16);
    }
  }
}

- (void)systemWillSleep
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = OSLogHandleForIDSCategory("IMConnectionMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isSleeping = self->_isSleeping;
    int v8 = 138412546;
    unint64_t v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = isSleeping;
    _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ systemWillSleep].  _isSleeping: %d -> 1", (uint8_t *)&v8, 0x12u);
  }

  if (!self->_isSleeping)
  {
    self->_BOOL isSleeping = 1;
    objc_msgSend__doCallbackNow(self, v5, v6, v7);
  }
}

- (void)systemDidWake
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = OSLogHandleForIDSCategory("IMConnectionMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isSleeping = self->_isSleeping;
    int v8 = 138412546;
    unint64_t v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = isSleeping;
    _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ systemDidWake].  _isSleeping: %d -> 0", (uint8_t *)&v8, 0x12u);
  }

  if (self->_isSleeping)
  {
    self->_BOOL isSleeping = 0;
    objc_msgSend__doCallbackLater(self, v5, v6, v7);
  }
}

- (void)_networkManagedUpdated:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("IMConnectionMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    __int16 v10 = self;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "-[%@ _networkManagedUpdated].", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend__doCallbackLater(self, v6, v7, v8);
}

- (void)_setup
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMSystemMonitor, a2, v2, v3);
  objc_msgSend__addEarlyListener_(v5, v6, (uint64_t)self, v7);

  id v11 = (id)objc_msgSend_sharedInstance(IMMobileNetworkManager, v8, v9, v10);
  uint64_t v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
  objc_msgSend_addObserver_selector_name_object_(v15, v16, (uint64_t)self, (uint64_t)sel__networkManagedUpdated_, @"__kIMMobileNetworkManagerDataStatusChangedNotification", 0);

  id v17 = objc_alloc(MEMORY[0x1E4F59DF8]);
  id v18 = im_primary_queue();
  int v20 = (CUTDeferredTaskQueue *)objc_msgSend_initWithCapacity_queue_block_(v17, v19, 1, (uint64_t)v18, &unk_1EE22FBB8);
  performCallbackTask = self->_performCallbackTask;
  self->_performCallbackTask = v20;

  MEMORY[0x1F4181798](self, sel__setupReachability, v22, v23);
}

- (void)goConnectedWithLocalSocketAddress:(id)a3 remoteSocketAddress:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory("IMConnectionMonitor");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isConnected = self->_isConnected;
    int v15 = 138413058;
    uint64_t v16 = self;
    __int16 v17 = 1024;
    BOOL v18 = isConnected;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_191892000, v8, OS_LOG_TYPE_DEFAULT, "-[%@ goConnectedWithLocalSocketAddress]._isConnected: %d -> 1\n    localSocketAddress: %@\n    remoteSocketAddress: %@", (uint8_t *)&v15, 0x26u);
  }

  if (!self->_isConnected)
  {
    self->_BOOL isConnected = 1;
    objc_msgSend__clearReachability_flags_(self, v10, (uint64_t)&self->_ipReachability, (uint64_t)&self->_ipFlags);
    id v11 = [IMReachability alloc];
    uint64_t v13 = (IMReachability *)objc_msgSend_initWithLocalSocketAddress_remoteSocketAddress_delegate_(v11, v12, (uint64_t)v6, (uint64_t)v7, self);
    ipReachability = self->_ipReachability;
    self->_ipReachability = v13;
  }
}

- (void)goDisconnected
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = OSLogHandleForIDSCategory("IMConnectionMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isConnected = self->_isConnected;
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 1024;
    BOOL v9 = isConnected;
    _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ goDisconnected].  _isConnected: %d -> 0", (uint8_t *)&v6, 0x12u);
  }

  if (self->_isConnected)
  {
    self->_BOOL isConnected = 0;
    objc_msgSend__clearReachability_flags_(self, v5, (uint64_t)&self->_ipReachability, (uint64_t)&self->_ipFlags);
  }
}

- (void)clear
{
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], a2, (uint64_t)self, (uint64_t)sel__doCallbackNow, 0);
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v7, v6, (uint64_t)self, 0, 0);
}

- (BOOL)isImmediatelyReachable
{
  uint64_t v2 = self;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unint64_t hostFlags = self->_hostFlags;
  unint64_t ipFlags = self->_ipFlags;
  if ((hostFlags & 2) != 0)
  {
    ipReachability = self->_ipReachability;
    if (ipReachability) {
      int v5 = (ipFlags >> 1) & 1;
    }
    else {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
    ipReachability = self->_ipReachability;
  }
  BOOL v8 = (self->_hostFlags & 0x24) == 4 || (self->_ipFlags & 0x24) == 4;
  if (ipReachability)
  {
    BOOL v9 = OSLogHandleForIDSCategory("IMConnectionMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = v2->_hostFlags;
      unint64_t v11 = v2->_ipFlags;
      BOOL isSleeping = v2->_isSleeping;
      int v32 = 138413826;
      v33 = v2;
      __int16 v34 = 1024;
      int v35 = v5;
      __int16 v36 = 1024;
      int v37 = v10;
      __int16 v38 = 1024;
      int v39 = v11;
      __int16 v40 = 1024;
      BOOL v41 = isSleeping;
      __int16 v42 = 1024;
      unsigned int v43 = v8;
      __int16 v44 = 1024;
      unsigned int v45 = (ipFlags >> 5) & 1;
      _os_log_impl(&dword_191892000, v9, OS_LOG_TYPE_DEFAULT, "-[%@ isImmediatelyReachable] = %d.  Host:0x%06x IP:0x%06x Sleeping:%d ConnectionRequired:%d OnDemand:%d", (uint8_t *)&v32, 0x30u);
    }
  }
  else
  {
    BOOL v9 = OSLogHandleForIDSCategory("IMConnectionMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = v2->_hostFlags;
      BOOL v25 = v2->_isSleeping;
      int v32 = 138413570;
      v33 = v2;
      __int16 v34 = 1024;
      int v35 = v5;
      __int16 v36 = 1024;
      int v37 = v24;
      __int16 v38 = 1024;
      int v39 = v25;
      __int16 v40 = 1024;
      BOOL v41 = v8;
      __int16 v42 = 1024;
      unsigned int v43 = (hostFlags >> 5) & 1;
      _os_log_impl(&dword_191892000, v9, OS_LOG_TYPE_DEFAULT, "-[%@ isImmediatelyReachable] = %d.  Host:0x%06x IP:nil Sleeping:%d ConnectionRequired:%d OnDemand:%d", (uint8_t *)&v32, 0x2Au);
    }
  }

  if (!v5)
  {
    LOBYTE(v2) = 0;
    return (char)v2;
  }
  unint64_t v16 = v2->_hostFlags;
  if (v2->_ipReachability && (v2->_ipFlags & 0x40000) != 0)
  {
    v26 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v13, v14, v15);
    LODWORD(v2) = objc_msgSend_isDataConnectionActive(v26, v27, v28, v29);

    id v22 = OSLogHandleForIDSCategory("IMConnectionMonitor");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v30 = @"NO";
      if (v2) {
        v30 = @"YES";
      }
      int v32 = 138412290;
      v33 = v30;
      _os_log_impl(&dword_191892000, v22, OS_LOG_TYPE_DEFAULT, "  => We're on WWAN for ip reachability, checking data active: %@", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_24;
  }
  hostReachability = v2->_hostReachability;
  LOBYTE(v2) = 1;
  if (hostReachability && (v16 & 0x40000) != 0)
  {
    BOOL v18 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v13, v14, v15);
    LODWORD(v2) = objc_msgSend_isDataConnectionActive(v18, v19, v20, v21);

    id v22 = OSLogHandleForIDSCategory("IMConnectionMonitor");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = @"NO";
      if (v2) {
        uint64_t v23 = @"YES";
      }
      int v32 = 138412290;
      v33 = v23;
      _os_log_impl(&dword_191892000, v22, OS_LOG_TYPE_DEFAULT, "  => We're on WWAN for host reachability, checking data active: %@", (uint8_t *)&v32, 0xCu);
    }
LABEL_24:
  }
  return (char)v2;
}

- (IMReachability)_hostReachability
{
  return self->_hostReachability;
}

- (void)set_hostReachability:(id)a3
{
}

- (IMReachability)_ipReachability
{
  return self->_ipReachability;
}

- (void)set_ipReachability:(id)a3
{
}

- (unint64_t)_hostFlags
{
  return self->_hostFlags;
}

- (void)set_hostFlags:(unint64_t)a3
{
  self->_unint64_t hostFlags = a3;
}

- (unint64_t)_ipFlags
{
  return self->_ipFlags;
}

- (void)set_ipFlags:(unint64_t)a3
{
  self->_unint64_t ipFlags = a3;
}

- (BOOL)_isConnected
{
  return self->_isConnected;
}

- (void)set_isConnected:(BOOL)a3
{
  self->_BOOL isConnected = a3;
}

- (BOOL)_isSleeping
{
  return self->_isSleeping;
}

- (void)set_isSleeping:(BOOL)a3
{
  self->_BOOL isSleeping = a3;
}

- (CUTDeferredTaskQueue)performCallbackTask
{
  return self->_performCallbackTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performCallbackTask, 0);
  objc_storeStrong((id *)&self->_ipReachability, 0);
  objc_storeStrong((id *)&self->_hostReachability, 0);
}

@end