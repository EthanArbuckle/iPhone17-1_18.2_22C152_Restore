@interface IMReachability
+ (id)reachabilityWithHostName:(id)a3;
+ (id)reachabilityWithLocalAddress:(id)a3 remoteAddress:(id)a4;
+ (id)reachabilityWithRemoteAddress:(id)a3;
- (BOOL)connectionRequired;
- (BOOL)gettingFlags;
- (IMReachability)initWithLocalSocketAddress:(id)a3 remoteSocketAddress:(id)a4 delegate:(id)a5;
- (IMReachability)initWithRemoteHost:(id)a3 delegate:(id)a4;
- (IMReachabilityDelegate)delegate;
- (NSString)reachabilityDescription;
- (OS_dispatch_queue)_queue;
- (id)_initWithReachabilityRef:(__SCNetworkReachability *)a3 description:(id)a4 delegate:(id)a5;
- (id)description;
- (unint64_t)flags;
- (void)_forceGetFlagsIfNecessary;
- (void)_handleCallbackForSCNetworkReachability:(__SCNetworkReachability *)a3;
- (void)dealloc;
- (void)reachabilityRef;
- (void)setDelegate:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setGettingFlags:(BOOL)a3;
- (void)setReachabilityDescription:(id)a3;
- (void)setReachabilityRef:(void *)a3;
- (void)set_queue:(id)a3;
@end

@implementation IMReachability

+ (id)reachabilityWithHostName:(id)a3
{
  id v3 = a3;
  v4 = [IMReachability alloc];
  v6 = objc_msgSend_initWithRemoteHost_delegate_(v4, v5, (uint64_t)v3, 0);

  return v6;
}

+ (id)reachabilityWithRemoteAddress:(id)a3
{
  id v3 = a3;
  v4 = [IMReachability alloc];
  v6 = objc_msgSend_initWithLocalSocketAddress_remoteSocketAddress_delegate_(v4, v5, 0, (uint64_t)v3, 0);

  return v6;
}

+ (id)reachabilityWithLocalAddress:(id)a3 remoteAddress:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [IMReachability alloc];
  v9 = objc_msgSend_initWithLocalSocketAddress_remoteSocketAddress_delegate_(v7, v8, (uint64_t)v6, (uint64_t)v5, 0);

  return v9;
}

- (id)_initWithReachabilityRef:(__SCNetworkReachability *)a3 description:(id)a4 delegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    v28.receiver = self;
    v28.super_class = (Class)IMReachability;
    self = [(IMReachability *)&v28 init];
    if (self)
    {
      if (v9)
      {
        context.version = 0;
        context.info = objc_msgSend_weakRefWithObject_(MEMORY[0x1E4F59E30], v10, (uint64_t)self, v11);
        context.retain = j__CFRetain;
        context.release = j__CFRelease;
        context.copyDescription = 0;
        if (SCNetworkReachabilitySetCallback(a3, (SCNetworkReachabilityCallBack)sub_1918BDACC, &context))
        {
          v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          objc_msgSend_stringWithFormat_(NSString, v13, @"com.apple.IMReachability.%p", v14, self);
          id v15 = objc_claimAutoreleasedReturnValue();
          v19 = (const char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
          v20 = (OS_dispatch_queue *)dispatch_queue_create(v19, v12);
          queue = self->_queue;
          self->_queue = v20;
        }
        if (!SCNetworkReachabilitySetDispatchQueue(a3, (dispatch_queue_t)self->_queue))
        {
          SCNetworkReachabilitySetCallback(a3, 0, 0);
          a3 = 0;
          goto LABEL_9;
        }
      }
      self->_reachabilityRef = (void *)CFRetain(a3);
      objc_storeWeak((id *)&self->_delegate, v9);
      v22 = im_primary_queue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1918BDB80;
      block[3] = &unk_1E5722FD8;
      v25 = self;
      v26 = a3;
      dispatch_async(v22, block);
    }
    self = self;
    a3 = (__SCNetworkReachability *)self;
  }
LABEL_9:

  return a3;
}

- (IMReachability)initWithRemoteHost:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  SCNetworkReachabilityRef v13 = SCNetworkReachabilityCreateWithName(0, v12);
  id v15 = objc_msgSend__initWithReachabilityRef_description_delegate_(self, v14, (uint64_t)v13, (uint64_t)v8, v7);

  v16 = v15;
  if (v13) {
    CFRelease(v13);
  }

  return v16;
}

- (IMReachability)initWithLocalSocketAddress:(id)a3 remoteSocketAddress:(id)a4 delegate:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = (__CFString *)IMStringForSocketAddress(v8);
    if (v9)
    {
LABEL_3:
      v12 = (__CFString *)IMStringForSocketAddress(v9);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  v12 = 0;
LABEL_6:
  if (!v11) {
    uint64_t v11 = @"*";
  }
  if (v12) {
    SCNetworkReachabilityRef v13 = v12;
  }
  else {
    SCNetworkReachabilityRef v13 = @"*";
  }
  id v14 = [NSString alloc];
  uint64_t v17 = objc_msgSend_initWithFormat_(v14, v15, @"%@ -> %@", v16, v11, v13);
  long long v34 = xmmword_1918E7890;
  id v18 = v8;
  uint64_t v22 = objc_msgSend_bytes(v18, v19, v20, v21);
  if (v22) {
    v23 = (const sockaddr *)v22;
  }
  else {
    v23 = (const sockaddr *)&v34;
  }
  if (v9)
  {
    id v24 = v9;
    objc_super v28 = (const sockaddr *)objc_msgSend_bytes(v24, v25, v26, v27);
    SCNetworkReachabilityRef v29 = SCNetworkReachabilityCreateWithAddressPair(0, v23, v28);
  }
  else
  {
    SCNetworkReachabilityRef v29 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v23);
  }
  SCNetworkReachabilityRef v31 = v29;
  v32 = (IMReachability *)(id)objc_msgSend__initWithReachabilityRef_description_delegate_(self, v30, (uint64_t)v29, (uint64_t)v17, v10);
  if (v31) {
    CFRelease(v31);
  }

  return v32;
}

- (void)dealloc
{
  reachabilityRef = (const __SCNetworkReachability *)self->_reachabilityRef;
  if (reachabilityRef)
  {
    SCNetworkReachabilitySetDispatchQueue(reachabilityRef, 0);
    v4 = self->_reachabilityRef;
    if (v4)
    {
      CFRelease(v4);
      self->_reachabilityRef = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)IMReachability;
  [(IMReachability *)&v5 dealloc];
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<IMReachability:%p> (%@)", v2, self, self->_description);
}

- (void)_handleCallbackForSCNetworkReachability:(__SCNetworkReachability *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(void *)flags = 0xAAAAAAAAAAAAAAAALL;
  if (SCNetworkReachabilityGetFlags(a3, flags))
  {
    unint64_t v5 = self->_flags;
    if (v5 == *(void *)flags)
    {
      id v6 = OSLogHandleForIDSCategory("IMReachability");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = self->_flags;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 138412802;
        id v18 = self;
        __int16 v19 = 1024;
        *(_DWORD *)uint64_t v20 = v7;
        *(_WORD *)&v20[4] = 2112;
        *(void *)&v20[6] = WeakRetained;
        _os_log_impl(&dword_191892000, v6, OS_LOG_TYPE_DEFAULT, "%@: reachability flags did not change %08x  (Delegate: %@)", buf, 0x1Cu);
      }
    }
    else
    {
      self->_flags = *(void *)flags;
      id v10 = OSLogHandleForIDSCategory("IMReachability");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->_flags;
        id v12 = objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 138413058;
        id v18 = self;
        __int16 v19 = 1024;
        *(_DWORD *)uint64_t v20 = v5;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v11;
        *(_WORD *)&v20[10] = 2112;
        *(void *)&v20[12] = v12;
        _os_log_impl(&dword_191892000, v10, OS_LOG_TYPE_DEFAULT, "%@: reachabilityDidChange %08x -> %08x  (Delegate: %@)", buf, 0x22u);
      }
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_reachabilityDidChange_(v13, v14, (uint64_t)self, v15);
    }
  }
  else
  {
    id v9 = OSLogHandleForIDSCategory("IMReachability");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = self;
      __int16 v19 = 2048;
      *(void *)uint64_t v20 = a3;
      _os_log_impl(&dword_191892000, v9, OS_LOG_TYPE_DEFAULT, "%@: Failed to get flags for reachability: %p", buf, 0x16u);
    }
  }
}

- (void)_forceGetFlagsIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_gettingFlags && !self->_flags && self->_reachabilityRef)
  {
    self->_gettingFlags = 1;
    id v3 = OSLogHandleForIDSCategory("IMReachability");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      int v7 = self;
      _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "%@: Forcing reachability query", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend__handleCallbackForSCNetworkReachability_(self, v4, (uint64_t)self->_reachabilityRef, v5);
    self->_gettingFlags = 0;
  }
}

- (unint64_t)flags
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained) {
    objc_msgSend__forceGetFlagsIfNecessary(self, v4, v5, v6);
  }
  return self->_flags;
}

- (BOOL)connectionRequired
{
  objc_msgSend__forceGetFlagsIfNecessary(self, a2, v2, v3);
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (IMReachabilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMReachabilityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)gettingFlags
{
  return self->_gettingFlags;
}

- (void)setGettingFlags:(BOOL)a3
{
  self->_gettingFlags = a3;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)reachabilityDescription
{
  return self->_description;
}

- (void)setReachabilityDescription:(id)a3
{
}

- (void)reachabilityRef
{
  return self->_reachabilityRef;
}

- (void)setReachabilityRef:(void *)a3
{
  self->_reachabilityRef = a3;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

- (void)set_queue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end