@interface WFNetworkInterface
+ (id)activeNetworkInterface;
+ (id)defaultNetworkInterfaces;
+ (id)networkInterfaceWithInterface:(id)a3;
+ (id)wifiNetworkInterfaces;
- (NSString)IPv4Address;
- (NSString)IPv6Address;
- (NSString)interfaceName;
- (WFNetworkInterface)initWithInterface:(id)a3;
- (__WiFiNetwork)currentWiFiNetwork;
- (id)ipAddressForFamily:(unsigned __int8)a3;
@end

@implementation WFNetworkInterface

- (void).cxx_destruct
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (id)ipAddressForFamily:(unsigned __int8)a3
{
  int v3 = a3;
  v13 = 0;
  int v5 = getifaddrs(&v13);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__WFNetworkInterface_ipAddressForFamily___block_invoke;
  v12[3] = &__block_descriptor_40_e5_v8__0l;
  v12[4] = v13;
  v6 = (void (**)(void))_Block_copy(v12);
  v7 = 0;
  if (!v5)
  {
    v8 = v13;
    if (v13)
    {
      while (1)
      {
        if (v8->ifa_addr->sa_family == v3)
        {
          ifa_name = v8->ifa_name;
          id v10 = [(WFNetworkInterface *)self interfaceName];
          LODWORD(ifa_name) = strcmp(ifa_name, (const char *)[v10 UTF8String]);

          if (!ifa_name) {
            break;
          }
        }
        v8 = v8->ifa_next;
        if (!v8)
        {
          v7 = 0;
          goto LABEL_8;
        }
      }
      v7 = WFStringFromIPSocketAddress(&v8->ifa_addr->sa_len);
    }
  }
LABEL_8:
  v6[2](v6);

  return v7;
}

void __41__WFNetworkInterface_ipAddressForFamily___block_invoke()
{
}

- (__WiFiNetwork)currentWiFiNetwork
{
  uint64_t v3 = WiFiManagerClientCreate();
  if (!v3) {
    return 0;
  }
  v4 = (const void *)v3;
  int v5 = [(WFNetworkInterface *)self interfaceName];
  Device = (__WiFiNetwork *)WiFiManagerClientGetDevice();

  if (Device)
  {
    v7 = (__WiFiNetwork *)WiFiDeviceClientCopyCurrentNetwork();
    Device = v7;
    if (v7) {
      CFAutorelease(v7);
    }
  }
  CFRelease(v4);
  return Device;
}

- (NSString)IPv6Address
{
  return (NSString *)[(WFNetworkInterface *)self ipAddressForFamily:30];
}

- (NSString)IPv4Address
{
  return (NSString *)[(WFNetworkInterface *)self ipAddressForFamily:2];
}

- (WFNetworkInterface)initWithInterface:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFNetworkInterface.m", 163, @"Invalid parameter not satisfying: %@", @"interfaceName" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFNetworkInterface;
  v6 = [(WFNetworkInterface *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    interfaceName = v6->_interfaceName;
    v6->_interfaceName = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (id)wifiNetworkInterfaces
{
  v2 = (void *)WiFiManagerClientCreate();
  if (v2)
  {
    uint64_t v3 = (void *)WiFiManagerClientCopyInterfaces();
    CFRelease(v2);
    v2 = objc_msgSend(v3, "if_map:", &__block_literal_global_6);
  }
  return v2;
}

id __43__WFNetworkInterface_wifiNetworkInterfaces__block_invoke()
{
  v0 = WiFiDeviceClientGetInterfaceName();
  v1 = +[WFNetworkInterface networkInterfaceWithInterface:v0];

  return v1;
}

+ (id)defaultNetworkInterfaces
{
  v2 = WFDefaultNetworkInterfaces();
  uint64_t v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_53229);

  return v3;
}

WFNetworkInterface *__46__WFNetworkInterface_defaultNetworkInterfaces__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFNetworkInterface networkInterfaceWithInterface:a2];
}

+ (id)activeNetworkInterface
{
  v2 = WFDefaultNetworkInterfaces();
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    v4 = +[WFNetworkInterface networkInterfaceWithInterface:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)networkInterfaceWithInterface:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithInterface:v4];

  return v5;
}

@end