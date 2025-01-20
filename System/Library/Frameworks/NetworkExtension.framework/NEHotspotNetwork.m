@interface NEHotspotNetwork
+ (void)fetchCurrentWithCompletionHandler:(void *)completionHandler;
- (BOOL)didAutoJoin;
- (BOOL)didJustJoin;
- (BOOL)isChosenHelper;
- (BOOL)isSecure;
- (NEHotspotNetworkSecurityType)securityType;
- (NSString)BSSID;
- (NSString)SSID;
- (double)signalStrength;
- (id)description;
- (id)initWithNetwork:(void *)a1;
- (void)dealloc;
- (void)setConfidence:(NEHotspotHelperConfidence)confidence;
- (void)setNetwork:(uint64_t)a1;
- (void)setPassword:(NSString *)password;
- (void)setSecurityType:(int64_t)a3;
@end

@implementation NEHotspotNetwork

- (void)setSecurityType:(int64_t)a3
{
  self->_securityType = a3;
}

- (NEHotspotNetworkSecurityType)securityType
{
  return self->_securityType;
}

- (BOOL)isChosenHelper
{
  return CNNetworkIsChosenPlugin() != 0;
}

- (BOOL)didJustJoin
{
  return CNNetworkWasJustJoined() != 0;
}

- (BOOL)didAutoJoin
{
  return CNNetworkWasAutoJoined() != 0;
}

- (BOOL)isSecure
{
  return CNNetworkIsProtected() != 0;
}

- (void)setPassword:(NSString *)password
{
  if (self) {
    self = (NEHotspotNetwork *)self->_network;
  }
  MEMORY[0x1F410FB00](self, password);
}

- (void)setConfidence:(NEHotspotHelperConfidence)confidence
{
  if (self)
  {
    CNNetworkSetConfidence();
    network = self->_network;
  }
  else
  {
    CNNetworkSetConfidence();
    network = 0;
  }

  MEMORY[0x1F410FAF0](network, confidence != kNEHotspotHelperConfidenceNone);
}

- (double)signalStrength
{
  if (self) {
    self = (NEHotspotNetwork *)self->_network;
  }
  MEMORY[0x1F410FAD8](self, a2);
  return result;
}

- (NSString)BSSID
{
  if (self) {
    self = (NEHotspotNetwork *)self->_network;
  }
  return (NSString *)MEMORY[0x1F410FAC8](self, a2);
}

- (NSString)SSID
{
  if (self) {
    self = (NEHotspotNetwork *)self->_network;
  }
  return (NSString *)MEMORY[0x1F410FAD0](self, a2);
}

- (id)description
{
  if (self) {
    self = (NEHotspotNetwork *)self->_network;
  }
  v2 = (__CFString *)CFCopyDescription(self);

  return v2;
}

- (void)dealloc
{
  if (self)
  {
    network = self->_network;
    if (network) {
      CFRelease(network);
    }
    self->_network = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHotspotNetwork;
  [(NEHotspotNetwork *)&v4 dealloc];
}

+ (void)fetchCurrentWithCompletionHandler:(void *)completionHandler
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v4 = completionHandler;
  if ((NEHelperCopyCurrentNetworkAsync() & 1) == 0)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = a1;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@ internal error", buf, 0xCu);
    }

    v4[2](v4, 0);
  }
}

void __54__NEHotspotNetwork_fetchCurrentWithCompletionHandler___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ((a2 & 1) == 0)
  {
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      *(_DWORD *)v28 = 138412290;
      *(void *)&v28[4] = v24;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@ failed to communicate to helper server for Wi-Fi information request", v28, 0xCu);
    }
  }
  if (a3)
  {
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)v28 = 138412546;
      *(void *)&v28[4] = v23;
      *(_WORD *)&v28[12] = 2048;
      *(void *)&v28[14] = a3;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "%@ nehelper sent invalid result code [%lld] for Wi-Fi information request", v28, 0x16u);
    }

    goto LABEL_9;
  }
  if (!v7 || (a2 & 1) == 0)
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  CFDictionaryRef v10 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v10 && CFGetTypeID(v10) == TypeID)
  {
    Value = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E4F41AB0]);
    v13 = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E4F41AA8]);
    v14 = (void *)CFDictionaryGetValue(v10, @"wifi-security-type");
    if (Value && v13 && (v15 = v14) != 0)
    {
      v16 = (const void *)CNNetworkCreateWithSSIDAndBSSID();
      v17 = [NEHotspotNetwork alloc];
      id v18 = v15;
      if (v17)
      {
        *(void *)v28 = v17;
        *(void *)&v28[8] = NEHotspotNetwork;
        v19 = (NEHotspotNetwork *)objc_msgSendSuper2((objc_super *)v28, sel_init);
        v17 = v19;
        if (v19)
        {
          -[NEHotspotNetwork setNetwork:]((uint64_t)v19, v16);
          unint64_t v20 = [v18 integerValue];
          if (v20 >= 4) {
            uint64_t v21 = 4;
          }
          else {
            uint64_t v21 = v20;
          }
          [(NEHotspotNetwork *)v17 setSecurityType:v21];
        }
      }

      if (v16) {
        CFRelease(v16);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v25 = ne_log_obj();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void *)(a1 + 40);
        *(_DWORD *)v28 = 138412290;
        *(void *)&v28[4] = v27;
        _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "%@ received nil data for Wi-Fi information request", v28, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
LABEL_34:
    CFRelease(v10);
    goto LABEL_10;
  }
  v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = *(void *)(a1 + 40);
    *(_DWORD *)v28 = 138412290;
    *(void *)&v28[4] = v26;
    _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "%@ received unexpected data for Wi-Fi information request", v28, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v10) {
    goto LABEL_34;
  }
LABEL_10:
}

- (void)setNetwork:(uint64_t)a1
{
  if (cf) {
    CFRetain(cf);
  }
  objc_super v4 = *(const void **)(a1 + 8);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 8) = cf;
}

- (id)initWithNetwork:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)NEHotspotNetwork;
  id v3 = objc_msgSendSuper2(&v6, sel_init);
  id v4 = v3;
  if (v3) {
    -[NEHotspotNetwork setNetwork:]((uint64_t)v3, a2);
  }
  return v4;
}

@end