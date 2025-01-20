@interface CRKCurrentPlatformIPAddressProvider
+ (id)makePathMonitorWithPrimitives:(id)a3;
- (CRKCurrentPlatformIPAddressProvider)init;
- (CRKCurrentPlatformIPAddressProvider)initWithNetworkPrimitives:(id)a3;
- (CRKNetworkPathMonitor)pathMonitor;
- (NSString)IPAddress;
- (id)currentIPAddress;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIPAddress:(id)a3;
@end

@implementation CRKCurrentPlatformIPAddressProvider

- (void)dealloc
{
  [(CRKNetworkPathMonitor *)self->_pathMonitor removeObserver:self forKeyPath:@"path" context:@"ObservationContext"];
  v3.receiver = self;
  v3.super_class = (Class)CRKCurrentPlatformIPAddressProvider;
  [(CRKCurrentPlatformIPAddressProvider *)&v3 dealloc];
}

- (CRKCurrentPlatformIPAddressProvider)init
{
  objc_super v3 = objc_opt_new();
  v4 = [(CRKCurrentPlatformIPAddressProvider *)self initWithNetworkPrimitives:v3];

  return v4;
}

- (CRKCurrentPlatformIPAddressProvider)initWithNetworkPrimitives:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKCurrentPlatformIPAddressProvider;
  v5 = [(CRKCurrentPlatformIPAddressProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() makePathMonitorWithPrimitives:v4];
    pathMonitor = v5->_pathMonitor;
    v5->_pathMonitor = (CRKNetworkPathMonitor *)v6;

    [(CRKNetworkPathMonitor *)v5->_pathMonitor resume];
    [(CRKNetworkPathMonitor *)v5->_pathMonitor addObserver:v5 forKeyPath:@"path" options:4 context:@"ObservationContext"];
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 != @"ObservationContext")
  {
    v13.receiver = self;
    v13.super_class = (Class)CRKCurrentPlatformIPAddressProvider;
    -[CRKCurrentPlatformIPAddressProvider observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
    return;
  }
  v8 = [(CRKCurrentPlatformIPAddressProvider *)self IPAddress];
  if (v8
    || ([(CRKCurrentPlatformIPAddressProvider *)self currentIPAddress],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v9 = [(CRKCurrentPlatformIPAddressProvider *)self IPAddress];
    v10 = [(CRKCurrentPlatformIPAddressProvider *)self currentIPAddress];
    char v11 = [v9 isEqual:v10];

    if (v8)
    {

      if (v11) {
        return;
      }
    }
    else
    {

      if (v11) {
        return;
      }
    }
    id v12 = [(CRKCurrentPlatformIPAddressProvider *)self currentIPAddress];
    [(CRKCurrentPlatformIPAddressProvider *)self setIPAddress:v12];
  }
}

+ (id)makePathMonitorWithPrimitives:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  v5 = [v3 standardUserDefaults];
  char v6 = [v5 BOOLForKey:@"CRKPreferEthernet"];

  if (v6) {
    [v4 ethernetNetworkPathMonitor];
  }
  else {
  v7 = [v4 wifiNetworkPathMonitor];
  }

  return v7;
}

- (id)currentIPAddress
{
  v2 = [(CRKCurrentPlatformIPAddressProvider *)self pathMonitor];
  objc_super v3 = [v2 path];

  if ([v3 isSatisfied])
  {
    id v4 = [v3 interfaces];
    v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_30];
    char v6 = objc_msgSend(v5, "crk_firstMatching:", &__block_literal_global_12_0);

    v7 = [v6 ipv4Endpoint];
    v8 = [v7 IPAddress];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __55__CRKCurrentPlatformIPAddressProvider_currentIPAddress__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  char v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __55__CRKCurrentPlatformIPAddressProvider_currentIPAddress__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 ipv4Endpoint];
  objc_super v3 = [v2 IPAddress];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)IPAddress
{
  return self->_IPAddress;
}

- (void)setIPAddress:(id)a3
{
}

- (CRKNetworkPathMonitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMonitor, 0);

  objc_storeStrong((id *)&self->_IPAddress, 0);
}

@end