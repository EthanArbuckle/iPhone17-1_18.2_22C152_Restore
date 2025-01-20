@interface AppleEthernetProtocolConfigurator
- (AppleEthernetProtocolConfiguratorDelegate)delegate;
- (NSString)protocol;
- (void)setDelegate:(id)a3;
- (void)setProtocol:(id)a3;
- (void)updateSettingsFromCurrentConfig:(id)a3 toNewConfig:(id)a4 forService:(__SCNetworkService *)a5;
@end

@implementation AppleEthernetProtocolConfigurator

- (void)updateSettingsFromCurrentConfig:(id)a3 toNewConfig:(id)a4 forService:(__SCNetworkService *)a5
{
  id v14 = a3;
  id v8 = a4;
  SCNetworkProtocolRef v9 = SCNetworkServiceCopyProtocol(a5, (CFStringRef)self->_protocol);
  if (v9)
  {
    v10 = v9;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = [WeakRetained getPersistentSettingsForKey:self->_protocol inService:a5];
    CFDictionaryRef v13 = (const __CFDictionary *)[v12 mutableCopy];

    if (v13 || (CFDictionaryRef v13 = (const __CFDictionary *)objc_alloc_init((Class)NSMutableDictionary)) != 0)
    {
      [(AppleEthernetProtocolConfigurator *)self updateSettings:v13 fromCurrentConfig:v14 toNewConfig:v8];
      SCNetworkProtocolSetConfiguration(v10, v13);
    }
    CFRelease(v10);
  }
}

- (AppleEthernetProtocolConfiguratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AppleEthernetProtocolConfiguratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end