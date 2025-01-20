@interface VPNConnection
+ (id)statusTextForStatus:(unint64_t)a3;
- (BOOL)connected;
- (BOOL)disconnected;
- (BOOL)enabled;
- (BOOL)isPerApp;
- (BOOL)isPrimary;
- (BOOL)isProviderAvailable;
- (BOOL)notDisconnectedOrDisconnecting;
- (BOOL)onDemandUserOverrideDisabled;
- (BOOL)useRSASecurID;
- (NSArray)sessionIPAddresses;
- (NSMutableArray)matchDomains;
- (NSMutableArray)subConnections;
- (NSNumber)lastStopCause;
- (NSNumber)sessionConnectTime;
- (NSString)accountName;
- (NSString)bundleID;
- (NSString)displayName;
- (NSString)password;
- (NSString)server;
- (NSString)sessionRemoteAddress;
- (NSString)sharedSecret;
- (NSUUID)serviceID;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timerSource;
- (VPNConnection)initWithServiceID:(id)a3 options:(id)a4;
- (__CFString)vpnType;
- (id)_fullOptions;
- (id)alertText;
- (id)certificate;
- (id)connectTimeForSubConnection:(unint64_t)a3;
- (id)convertTimeToString:(unint64_t)a3;
- (id)elapsedTimeLocalizedString;
- (id)elapsedTimeLocalizedStringForSubConnection:(unint64_t)a3;
- (id)interfaceTypeForSubConnection:(unint64_t)a3;
- (id)ipAddressesForSubConnection:(unint64_t)a3;
- (id)remoteAddressForSubConnection:(unint64_t)a3;
- (id)statusText;
- (id)tunnelType;
- (id)vpnTypeLocalizedString;
- (int)session_status;
- (int64_t)onDemandAction;
- (unint64_t)elapsedTimeSinceStartTime:(id)a3;
- (unint64_t)grade;
- (unint64_t)status;
- (unint64_t)subConnectionCount;
- (unint64_t)vpnConnectionType;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)session;
- (void)setCertificate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGrade:(unint64_t)a3;
- (void)setIsPerApp:(BOOL)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setIsProviderAvailable:(BOOL)a3;
- (void)setLastStopCause:(id)a3;
- (void)setMatchDomains:(id)a3;
- (void)setOnDemandAction:(int64_t)a3;
- (void)setOnDemandUserOverrideDisabled:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setSession:(void *)a3;
- (void)setSessionConnectTime:(id)a3;
- (void)setSessionIPAddresses:(id)a3;
- (void)setSessionRemoteAddress:(id)a3;
- (void)setSession_status:(int)a3;
- (void)setSharedSecret:(id)a3;
- (void)setSubConnections:(id)a3;
- (void)setTimerSource:(id)a3;
- (void)setUseRSASecurID:(BOOL)a3;
- (void)updateWithOptions:(id)a3;
@end

@implementation VPNConnection

- (VPNConnection)initWithServiceID:(id)a3 options:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)VPNConnection;
  v9 = [(VPNConnection *)&v40 init];
  if (v9)
  {
    objc_initWeak(&location, v9);
    v10 = [v8 objectForKey:@"VPNEnabled"];
    v9->_enabled = [v10 BOOLValue];

    objc_storeStrong((id *)&v9->_serviceID, a3);
    uint64_t v11 = [v8 objectForKey:@"dispName"];
    displayName = v9->_displayName;
    v9->_displayName = (NSString *)v11;

    uint64_t v13 = [v8 objectForKey:@"VPNApplicationBundleID"];
    bundleID = v9->_bundleID;
    v9->_bundleID = (NSString *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("VPNConnection", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v15;

    v17 = [v8 objectForKey:@"VPNGrade"];
    v9->_grade = [v17 unsignedIntegerValue];

    if (v9->_grade == 3)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      subConnections = v9->_subConnections;
      v9->_subConnections = v18;
    }
    if (v9->_queue)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      [(NSUUID *)v9->_serviceID getUUIDBytes:buf];
      v20 = (void *)ne_session_create();
      v9->_session = v20;
      v9->_session_status = 1;
      id v21 = objc_loadWeakRetained(&location);
      updateNEStatus(v21);

      if (v9->_session)
      {
        objc_copyWeak(v38, &location);
        v38[1] = v20;
        ne_session_set_event_handler();
        objc_destroyWeak(v38);
      }
    }
    v22 = [v8 objectForKey:@"VPNType"];
    v9->_vpnConnectionType = [v22 unsignedIntegerValue];

    uint64_t v23 = [v8 objectForKey:@"authorization"];
    accountName = v9->_accountName;
    v9->_accountName = (NSString *)v23;

    uint64_t v25 = [v8 objectForKey:@"server"];
    server = v9->_server;
    v9->_server = (NSString *)v25;

    v27 = [v8 objectForKey:@"securID"];
    v9->_useRSASecurID = [v27 BOOLValue];

    uint64_t v28 = [v8 objectForKey:@"secret"];
    sharedSecret = v9->_sharedSecret;
    v9->_sharedSecret = (NSString *)v28;

    uint64_t v30 = [v8 objectForKey:@"password"];
    password = v9->_password;
    v9->_password = (NSString *)v30;

    uint64_t v32 = [v8 objectForKey:@"VPNCertificate"];
    id certificate = v9->_certificate;
    v9->_id certificate = (id)v32;

    v9->_isProviderAvailable = 1;
    v34 = [v8 objectForKey:@"VPNOnDemandUserOverrideDisabled"];
    v9->_onDemandUserOverrideDisabled = [v34 BOOLValue];

    v35 = [v8 objectForKey:@"VPNIsPerApp"];
    v9->_isPerApp = [v35 BOOLValue];

    objc_destroyWeak(&location);
  }
  v36 = VPNSettingsCopyLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    __int16 v42 = 2112;
    id v43 = v8;
    _os_log_debug_impl(&dword_234C0A000, v36, OS_LOG_TYPE_DEBUG, "New VPN service %@ for service %@, options %@", buf, 0x20u);
  }

  return v9;
}

void __43__VPNConnection_initWithServiceID_options___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    MEMORY[0x270EDA650](v2);
  }
  else if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    updateNEStatus(WeakRetained);
  }
}

- (void)updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"VPNEnabled"];
  self->_enabled = [v5 BOOLValue];

  v6 = [v4 objectForKey:@"dispName"];
  displayName = self->_displayName;
  self->_displayName = v6;

  id v8 = [v4 objectForKey:@"VPNApplicationBundleID"];
  bundleID = self->_bundleID;
  self->_bundleID = v8;

  v10 = [v4 objectForKey:@"authorization"];
  accountName = self->_accountName;
  self->_accountName = v10;

  v12 = [v4 objectForKey:@"server"];
  server = self->_server;
  self->_server = v12;

  v14 = [v4 objectForKey:@"securID"];
  self->_useRSASecurID = [v14 BOOLValue];

  dispatch_queue_t v15 = [v4 objectForKey:@"secret"];
  sharedSecret = self->_sharedSecret;
  self->_sharedSecret = v15;

  v17 = [v4 objectForKey:@"password"];
  password = self->_password;
  self->_password = v17;

  v19 = [v4 objectForKey:@"VPNCertificate"];

  id certificate = self->_certificate;
  self->_id certificate = v19;
}

- (void)dealloc
{
  if ([(VPNConnection *)self session])
  {
    [(VPNConnection *)self session];
    ne_session_cancel();
    [(VPNConnection *)self setSession:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)VPNConnection;
  [(VPNConnection *)&v3 dealloc];
}

- (unint64_t)subConnectionCount
{
  subConnections = self->_subConnections;
  if (subConnections) {
    return [(NSMutableArray *)subConnections count];
  }
  else {
    return 1;
  }
}

- (id)ipAddressesForSubConnection:(unint64_t)a3
{
  subConnections = self->_subConnections;
  if (subConnections)
  {
    if ([(NSMutableArray *)subConnections count] <= a3)
    {
      id v7 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      v6 = [(NSMutableArray *)self->_subConnections objectAtIndexedSubscript:a3];
      id v7 = [v6 objectForKeyedSubscript:kVPNSubConnectionIPAddress];
    }
  }
  else
  {
    id v7 = [(VPNConnection *)self sessionIPAddresses];
  }

  return v7;
}

- (id)remoteAddressForSubConnection:(unint64_t)a3
{
  subConnections = self->_subConnections;
  if (subConnections)
  {
    if ([(NSMutableArray *)subConnections count] <= a3)
    {
      id v7 = &stru_26E7C6230;
    }
    else
    {
      v6 = [(NSMutableArray *)self->_subConnections objectAtIndexedSubscript:a3];
      id v7 = [v6 objectForKeyedSubscript:kVPNSubConnectionRemoteAddress];
    }
  }
  else
  {
    id v7 = [(VPNConnection *)self sessionRemoteAddress];
  }

  return v7;
}

- (id)connectTimeForSubConnection:(unint64_t)a3
{
  subConnections = self->_subConnections;
  if (subConnections)
  {
    if ([(NSMutableArray *)subConnections count] <= a3)
    {
      id v7 = &unk_26E7CB868;
    }
    else
    {
      v6 = [(NSMutableArray *)self->_subConnections objectAtIndexedSubscript:a3];
      id v7 = [v6 objectForKeyedSubscript:kVPNSubConnectionConnectTime];
    }
  }
  else
  {
    id v7 = [(VPNConnection *)self sessionConnectTime];
  }

  return v7;
}

- (id)interfaceTypeForSubConnection:(unint64_t)a3
{
  subConnections = self->_subConnections;
  if (!subConnections || [(NSMutableArray *)subConnections count] <= a3)
  {
    dispatch_queue_t v15 = &stru_26E7C6230;
    goto LABEL_17;
  }
  v6 = [(NSMutableArray *)self->_subConnections objectAtIndexedSubscript:a3];
  id v7 = objc_alloc(MEMORY[0x263F14408]);
  id v8 = [v6 objectForKeyedSubscript:kVPNSubConnectionInterfaceName];
  v9 = (void *)[v7 initWithInterfaceName:v8];

  uint64_t v10 = [v9 type];
  switch(v10)
  {
    case 3:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v13 = v12;
      v14 = @"ETHERNET";
LABEL_15:
      dispatch_queue_t v15 = [v12 localizedStringForKey:v14 value:&stru_26E7C6230 table:@"MobileVPN"];

      goto LABEL_16;
    case 2:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v13 = v12;
      v14 = @"CELLULAR";
      goto LABEL_15;
    case 1:
      if (interfaceTypeForSubConnection__onceToken != -1) {
        dispatch_once(&interfaceTypeForSubConnection__onceToken, &__block_literal_global_50);
      }
      int v11 = interfaceTypeForSubConnection__isWLAN;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v13 = v12;
      if (v11) {
        v14 = @"WLAN";
      }
      else {
        v14 = @"WIFI";
      }
      goto LABEL_15;
  }
  dispatch_queue_t v15 = &stru_26E7C6230;
LABEL_16:

LABEL_17:

  return v15;
}

uint64_t __47__VPNConnection_interfaceTypeForSubConnection___block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  interfaceTypeForSubConnection__isWLAN = result;
  return result;
}

- (id)elapsedTimeLocalizedStringForSubConnection:(unint64_t)a3
{
  id v4 = [(VPNConnection *)self connectTimeForSubConnection:a3];
  unint64_t v5 = [(VPNConnection *)self elapsedTimeSinceStartTime:v4];

  return [(VPNConnection *)self convertTimeToString:v5];
}

- (id)_fullOptions
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v6 = [(VPNConnection *)self vpnConnectionType];
  id v7 = [(VPNConnection *)self accountName];
  if (v6 == 2)
  {
    [v5 setObject:v7 forKey:*MEMORY[0x263F1BD28]];

    id v8 = [(VPNConnection *)self server];
    uint64_t v9 = *MEMORY[0x263F1BD18];
    uint64_t v10 = v5;
  }
  else
  {
    [v4 setObject:v7 forKey:*MEMORY[0x263F1BDB8]];

    id v8 = [(VPNConnection *)self server];
    uint64_t v9 = *MEMORY[0x263F1BDC8];
    uint64_t v10 = v4;
  }
  [v10 setObject:v8 forKey:v9];

  int v11 = [(VPNConnection *)self password];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = [(VPNConnection *)self password];
    if (v6 == 2) {
      v14 = v5;
    }
    else {
      v14 = v4;
    }
    dispatch_queue_t v15 = (void *)MEMORY[0x263F1BD30];
    if (v6 != 2) {
      dispatch_queue_t v15 = (void *)MEMORY[0x263F1BDC0];
    }
    [v14 setValue:v13 forKey:*v15];
  }
  v16 = [(VPNConnection *)self sharedSecret];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    [v5 setObject:*MEMORY[0x263F1BE30] forKey:*MEMORY[0x263F1BD10]];
    v18 = [(VPNConnection *)self sharedSecret];
    [v5 setObject:v18 forKey:*MEMORY[0x263F1BD20]];
  }
  [v3 setObject:v4 forKey:*MEMORY[0x263F1BC78]];
  [v3 setObject:v5 forKey:*MEMORY[0x263F1BE98]];

  return v3;
}

- (id)vpnTypeLocalizedString
{
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"UNKNOWN" value:&stru_26E7C6230 table:@"MobileVPN"];

  if ([(VPNConnection *)self grade] == 7 || [(VPNConnection *)self grade] == 8)
  {
    unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"RELAY" value:&stru_26E7C6230 table:@"MobileVPN"];

    goto LABEL_13;
  }
  id v7 = [(VPNConnection *)self vpnType];
  if (v7)
  {
    id v8 = v7;
    if (CFStringCompare(v7, (CFStringRef)*MEMORY[0x263F1BC80], 0))
    {
      if (CFStringCompare(v8, (CFStringRef)*MEMORY[0x263F1BC68], 0))
      {
        uint64_t v9 = v8;
LABEL_11:

        id v4 = v9;
        goto LABEL_12;
      }
      uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v11 = v10;
      uint64_t v12 = @"L2TP_IPSEC";
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v11 = v10;
      uint64_t v12 = @"PPTP";
    }
    uint64_t v9 = [v10 localizedStringForKey:v12 value:&stru_26E7C6230 table:@"MobileVPN"];

    id v4 = v11;
    goto LABEL_11;
  }
LABEL_12:
  id v6 = v4;
  id v4 = v6;
LABEL_13:

  return v6;
}

- (__CFString)vpnType
{
  unint64_t v2 = [(VPNConnection *)self vpnConnectionType];

  return +[VPNConnectionStore vpnTypeFromConnectionType:v2];
}

- (BOOL)connected
{
  return [(VPNConnection *)self status] == 3;
}

- (BOOL)notDisconnectedOrDisconnecting
{
  return [(VPNConnection *)self status] != 1 && [(VPNConnection *)self status] != 4;
}

- (BOOL)disconnected
{
  return [(VPNConnection *)self status] != 3;
}

- (unint64_t)status
{
  if ([(VPNConnection *)self grade] == 7 || [(VPNConnection *)self grade] == 8)
  {
    if ([(VPNConnection *)self enabled]) {
      return 6;
    }
    else {
      return 5;
    }
  }
  else if ([(VPNConnection *)self grade] == 2 && ![(VPNConnection *)self enabled])
  {
    return 5;
  }
  else
  {
    int v4 = [(VPNConnection *)self session_status];
    if (v4 > 5) {
      return 1;
    }
    else {
      return qword_234C31448[v4];
    }
  }
}

+ (id)statusTextForStatus:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v4 = v3;
      unint64_t v5 = @"CONNECTING";
      break;
    case 3uLL:
      objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v4 = v3;
      unint64_t v5 = @"CONNECTED";
      break;
    case 4uLL:
      objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v4 = v3;
      unint64_t v5 = @"DISCONNECTING";
      break;
    case 5uLL:
      objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v4 = v3;
      unint64_t v5 = @"INACTIVE";
      break;
    case 6uLL:
      objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v4 = v3;
      unint64_t v5 = @"ON";
      break;
    default:
      objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v4 = v3;
      unint64_t v5 = @"NOT_CONNECTED";
      break;
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_26E7C6230 table:@"MobileVPN"];

  return v6;
}

- (id)alertText
{
  objc_super v3 = [(VPNConnection *)self lastStopCause];
  int v4 = [v3 intValue];

  if ([(VPNConnection *)self grade] == 8 || [(VPNConnection *)self grade] == 7)
  {
    switch(v4)
    {
      case 17:
      case 20:
        unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v6 = v5;
        id v7 = @"UNREACHABLE";
        goto LABEL_20;
      case 18:
      case 21:
        unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v6 = v5;
        id v7 = @"SERVER_ERROR";
        goto LABEL_20;
      case 25:
        goto LABEL_19;
      default:
        break;
    }
  }
  if ([(VPNConnection *)self session_status] != 1) {
    goto LABEL_23;
  }
  if (![(VPNConnection *)self isProviderAvailable])
  {
    unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    id v7 = @"MISSING_PROVIDER_ALERT";
LABEL_20:
    v14 = [v5 localizedStringForKey:v7 value:&stru_26E7C6230 table:@"MobileVPN"];

    goto LABEL_24;
  }
  id v8 = [(VPNConnection *)self lastStopCause];

  if (!v8) {
    goto LABEL_23;
  }
  unint64_t v9 = [(VPNConnection *)self vpnConnectionType];
  uint64_t v10 = [(VPNConnection *)self lastStopCause];
  int v11 = [v10 intValue];

  if (v9 == 4)
  {
    if (v11 != 27)
    {
      uint64_t v12 = [(VPNConnection *)self lastStopCause];
      if ([v12 intValue] == 25)
      {
LABEL_18:

LABEL_19:
        unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v6 = v5;
        id v7 = @"CERTIFICATE_ERROR";
        goto LABEL_20;
      }
      uint64_t v13 = [(VPNConnection *)self lastStopCause];
      if ([v13 intValue] == 26)
      {
LABEL_12:

        goto LABEL_18;
      }
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (v11 == 21)
  {
LABEL_16:
    unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    id v7 = @"CERTIFICATE_EXPIRED";
    goto LABEL_20;
  }
  uint64_t v12 = [(VPNConnection *)self lastStopCause];
  if ([v12 intValue] == 13) {
    goto LABEL_18;
  }
  uint64_t v13 = [(VPNConnection *)self lastStopCause];
  if ([v13 intValue] == 20) {
    goto LABEL_12;
  }
LABEL_22:
  dispatch_queue_t v15 = [(VPNConnection *)self lastStopCause];
  int v16 = [v15 intValue];

  if (v16 == 24) {
    goto LABEL_19;
  }
LABEL_23:
  v14 = &stru_26E7C6230;
LABEL_24:

  return v14;
}

- (id)statusText
{
  BOOL v3 = [(VPNConnection *)self grade] == 5 || [(VPNConnection *)self grade] == 6;
  if ([(VPNConnection *)self grade] == 7 || [(VPNConnection *)self grade] == 8)
  {
    BOOL v4 = [(VPNConnection *)self enabled];
    unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v4) {
      id v6 = @"ON";
    }
    else {
      id v6 = @"OFF";
    }
LABEL_9:
    id v7 = v5;
    goto LABEL_10;
  }
  if ([(VPNConnection *)self grade] != 2 || [(VPNConnection *)self enabled])
  {
    switch([(VPNConnection *)self session_status])
    {
      case 0:
        unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v3) {
          goto LABEL_22;
        }
        id v6 = @"INACTIVE";
        break;
      case 2:
      case 4:
        unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v3) {
          id v6 = @"STARTING";
        }
        else {
          id v6 = @"CONNECTING";
        }
        break;
      case 3:
        unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v3) {
          id v6 = @"RUNNING";
        }
        else {
          id v6 = @"CONNECTED";
        }
        break;
      case 5:
        unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v3) {
          id v6 = @"STOPPING";
        }
        else {
          id v6 = @"DISCONNECTING";
        }
        break;
      default:
        unint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v3) {
LABEL_22:
        }
          id v6 = @"INVALID";
        else {
          id v6 = @"NOT_CONNECTED";
        }
        break;
    }
    goto LABEL_9;
  }
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v5 = v7;
  id v6 = @"INACTIVE";
LABEL_10:
  id v8 = [v7 localizedStringForKey:v6 value:&stru_26E7C6230 table:@"MobileVPN"];

  return v8;
}

- (void)connect
{
  +[VPNConnection cancelPreviousPerformRequestsWithTarget:self];
  BOOL v3 = [(VPNConnection *)self session];

  MEMORY[0x270EDA670](v3);
}

- (void)disconnect
{
  unint64_t v2 = [(VPNConnection *)self session];

  MEMORY[0x270EDA680](v2);
}

- (id)elapsedTimeLocalizedString
{
  BOOL v3 = [(VPNConnection *)self sessionConnectTime];
  unint64_t v4 = [(VPNConnection *)self elapsedTimeSinceStartTime:v3];

  return [(VPNConnection *)self convertTimeToString:v4];
}

- (unint64_t)elapsedTimeSinceStartTime:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  [v3 unsignedLongLongValue];
  if (elapsedTimeSinceStartTime__initTimeScale != -1) {
    dispatch_once(&elapsedTimeSinceStartTime__initTimeScale, &__block_literal_global_134);
  }
  unint64_t v4 = (unint64_t)(*(double *)&elapsedTimeSinceStartTime__timeScaleSeconds * (double)mach_absolute_time());
  uint64_t v5 = [v3 unsignedLongLongValue];

  return v4 - v5;
}

double __43__VPNConnection_elapsedTimeSinceStartTime___block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1 / 1000.0 / 1000000.0;
    elapsedTimeSinceStartTime__timeScaleSeconds = *(void *)&result;
  }
  return result;
}

- (id)convertTimeToString:(unint64_t)a3
{
  if (!a3) {
    goto LABEL_18;
  }
  int v3 = a3;
  unint64_t v4 = a3 % 0x3C;
  uint64_t v5 = (a3 / 0x3C)
     - 60 * ((unint64_t)((a3 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1);
  unsigned int v6 = a3 + 3599;
  if ((a3 + 3599) > 0x1C1E || v5)
  {
    if (v6 > 0x1C1E || v5 > 9)
    {
      if (v6 > 0x1C1E || v5 < 0xA)
      {
        uint64_t v13 = ((int)a3 / 3600);
        v14 = NSString;
        dispatch_queue_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v8 = v15;
        if (v3 > 35999) {
          int v16 = @"TIME_HHMS";
        }
        else {
          int v16 = @"TIME_HMS";
        }
        unint64_t v9 = [v15 localizedStringForKey:v16 value:&stru_26E7C6230 table:@"MobileVPN"];
        objc_msgSend(v14, "stringWithFormat:", v9, v13, v5, v4);
        goto LABEL_16;
      }
      uint64_t v10 = NSString;
      int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = v11;
      uint64_t v12 = @"TIME_MMS";
    }
    else
    {
      uint64_t v10 = NSString;
      int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = v11;
      uint64_t v12 = @"TIME_MS";
    }
    unint64_t v9 = [v11 localizedStringForKey:v12 value:&stru_26E7C6230 table:@"MobileVPN"];
    objc_msgSend(v10, "stringWithFormat:", v9, v5, v4, v20);
  }
  else
  {
    id v7 = NSString;
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v9 = [v8 localizedStringForKey:@"TIME_S" value:&stru_26E7C6230 table:@"MobileVPN"];
    objc_msgSend(v7, "stringWithFormat:", v9, v4, v19, v20);
  }
LABEL_16:
  uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ([(__CFString *)v17 length]) {
    goto LABEL_19;
  }

LABEL_18:
  uint64_t v17 = &stru_26E7C6230;
LABEL_19:

  return v17;
}

- (id)tunnelType
{
  if ([(VPNConnection *)self grade] == 1 || ![(VPNConnection *)self grade])
  {
    BOOL v4 = [(VPNConnection *)self isPrimary];
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unsigned int v6 = v5;
    if (v4) {
      id v7 = @"FULL_TUNNEL";
    }
    else {
      id v7 = @"SPLIT_TUNNEL";
    }
    int v3 = [v5 localizedStringForKey:v7 value:&stru_26E7C6230 table:@"MobileVPN"];
  }
  else
  {
    int v3 = &stru_26E7C6230;
  }

  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceID:(id)a3
{
}

- (void)session
{
  return self->_session;
}

- (void)setSession:(void *)a3
{
  self->_session = a3;
}

- (int)session_status
{
  return self->_session_status;
}

- (void)setSession_status:(int)a3
{
  self->_session_status = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTimerSource:(id)a3
{
}

- (unint64_t)grade
{
  return self->_grade;
}

- (void)setGrade:(unint64_t)a3
{
  self->_grade = a3;
}

- (NSArray)sessionIPAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionIPAddresses:(id)a3
{
}

- (NSString)sessionRemoteAddress
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSessionRemoteAddress:(id)a3
{
}

- (NSNumber)sessionConnectTime
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSessionConnectTime:(id)a3
{
}

- (NSNumber)lastStopCause
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastStopCause:(id)a3
{
}

- (NSMutableArray)matchDomains
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMatchDomains:(id)a3
{
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (NSMutableArray)subConnections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSubConnections:(id)a3
{
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (id)certificate
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setCertificate:(id)a3
{
}

- (BOOL)useRSASecurID
{
  return self->_useRSASecurID;
}

- (void)setUseRSASecurID:(BOOL)a3
{
  self->_useRSASecurID = a3;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPassword:(id)a3
{
}

- (NSString)sharedSecret
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSharedSecret:(id)a3
{
}

- (unint64_t)vpnConnectionType
{
  return self->_vpnConnectionType;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (int64_t)onDemandAction
{
  return self->_onDemandAction;
}

- (void)setOnDemandAction:(int64_t)a3
{
  self->_onDemandAction = a3;
}

- (BOOL)isProviderAvailable
{
  return self->_isProviderAvailable;
}

- (void)setIsProviderAvailable:(BOOL)a3
{
  self->_isProviderAvailable = a3;
}

- (BOOL)onDemandUserOverrideDisabled
{
  return self->_onDemandUserOverrideDisabled;
}

- (void)setOnDemandUserOverrideDisabled:(BOOL)a3
{
  self->_onDemandUserOverrideDisabled = a3;
}

- (BOOL)isPerApp
{
  return self->_isPerApp;
}

- (void)setIsPerApp:(BOOL)a3
{
  self->_isPerApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong(&self->_certificate, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_subConnections, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_lastStopCause, 0);
  objc_storeStrong((id *)&self->_sessionConnectTime, 0);
  objc_storeStrong((id *)&self->_sessionRemoteAddress, 0);
  objc_storeStrong((id *)&self->_sessionIPAddresses, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end