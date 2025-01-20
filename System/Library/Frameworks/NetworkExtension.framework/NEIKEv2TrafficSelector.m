@interface NEIKEv2TrafficSelector
+ (id)copyAllIPv4;
+ (id)copyAllIPv6;
+ (id)copyConstrainedTrafficSelectorsForRequest:(void *)a3 reply:;
- (NEIKEv2TrafficSelector)init;
- (NWAddressEndpoint)endAddress;
- (NWAddressEndpoint)startAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)type;
- (unsigned)endPort;
- (unsigned)ipProtocol;
- (unsigned)startPort;
- (void)setEndAddress:(id)a3;
- (void)setEndPort:(unsigned __int16)a3;
- (void)setIpProtocol:(unsigned __int8)a3;
- (void)setStartAddress:(id)a3;
- (void)setStartPort:(unsigned __int16)a3;
@end

@implementation NEIKEv2TrafficSelector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endAddress, 0);

  objc_storeStrong((id *)&self->_startAddress, 0);
}

- (void)setIpProtocol:(unsigned __int8)a3
{
  self->_ipProtocol = a3;
}

- (unsigned)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setEndPort:(unsigned __int16)a3
{
  self->_endPort = a3;
}

- (unsigned)endPort
{
  return self->_endPort;
}

- (void)setStartPort:(unsigned __int16)a3
{
  self->_startPort = a3;
}

- (unsigned)startPort
{
  return self->_startPort;
}

- (void)setEndAddress:(id)a3
{
}

- (NWAddressEndpoint)endAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStartAddress:(id)a3
{
}

- (NWAddressEndpoint)startAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NEIKEv2TrafficSelector *)self startAddress];
  v6 = (void *)[v5 copy];
  [v4 setStartAddress:v6];

  v7 = [(NEIKEv2TrafficSelector *)self endAddress];
  v8 = (void *)[v7 copy];
  [v4 setEndAddress:v8];

  objc_msgSend(v4, "setStartPort:", -[NEIKEv2TrafficSelector startPort](self, "startPort"));
  objc_msgSend(v4, "setEndPort:", -[NEIKEv2TrafficSelector endPort](self, "endPort"));
  objc_msgSend(v4, "setIpProtocol:", -[NEIKEv2TrafficSelector ipProtocol](self, "ipProtocol"));
  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(NEIKEv2TrafficSelector *)self startAddress];
  v5 = [v4 hostname];
  unsigned int v6 = [(NEIKEv2TrafficSelector *)self startPort];
  v7 = [(NEIKEv2TrafficSelector *)self endAddress];
  v8 = [v7 hostname];
  v9 = (void *)[v3 initWithFormat:@"%@ : %u -> %@ : %u (%u)", v5, v6, v8, -[NEIKEv2TrafficSelector endPort](self, "endPort"), -[NEIKEv2TrafficSelector ipProtocol](self, "ipProtocol")];

  return v9;
}

- (NEIKEv2TrafficSelector)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2TrafficSelector;
  v2 = [(NEIKEv2TrafficSelector *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    unsigned int v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

+ (id)copyAllIPv4
{
  v2 = objc_alloc_init(NEIKEv2TrafficSelector);
  id v3 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"0.0.0.0" port:@"0"];
  [(NEIKEv2TrafficSelector *)v2 setStartAddress:v3];

  v4 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"255.255.255.255" port:@"0"];
  [(NEIKEv2TrafficSelector *)v2 setEndAddress:v4];

  [(NEIKEv2TrafficSelector *)v2 setStartPort:0];
  [(NEIKEv2TrafficSelector *)v2 setEndPort:0xFFFFLL];
  [(NEIKEv2TrafficSelector *)v2 setIpProtocol:0];
  return v2;
}

+ (id)copyAllIPv6
{
  v2 = objc_alloc_init(NEIKEv2TrafficSelector);
  id v3 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"::" port:@"0"];
  [(NEIKEv2TrafficSelector *)v2 setStartAddress:v3];

  v4 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff" port:@"0"];
  [(NEIKEv2TrafficSelector *)v2 setEndAddress:v4];

  [(NEIKEv2TrafficSelector *)v2 setStartPort:0];
  [(NEIKEv2TrafficSelector *)v2 setEndPort:0xFFFFLL];
  [(NEIKEv2TrafficSelector *)v2 setIpProtocol:0];
  return v2;
}

- (uint64_t)type
{
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = [(id)result startAddress];
    if (v2)
    {
      id v3 = (void *)v2;
      uint64_t v4 = [v1 endAddress];
      if (v4)
      {
        v5 = (void *)v4;
        unsigned int v6 = [v1 startAddress];
        uint64_t v7 = [v6 addressFamily];
        objc_super v8 = [v1 endAddress];
        uint64_t v9 = [v8 addressFamily];

        if (v7 == v9)
        {
          v10 = [v1 startAddress];
          uint64_t v11 = [v10 addressFamily];

          if (v11 == 2) {
            return 7;
          }
          v12 = [v1 startAddress];
          uint64_t v13 = [v12 addressFamily];

          if (v13 == 30) {
            return 8;
          }
        }
      }
      else
      {
      }
    }
    return 0;
  }
  return result;
}

+ (id)copyConstrainedTrafficSelectorsForRequest:(void *)a3 reply:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  if (!a2)
  {
    uint64_t v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      id v5 = 0;
      goto LABEL_4;
    }
    int v9 = 136315138;
    v10 = "+[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]";
    objc_super v8 = "%s called with null request";
LABEL_10:
    _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_8;
  }
  if (!v4)
  {
    uint64_t v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v9 = 136315138;
    v10 = "+[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]";
    objc_super v8 = "%s called with null reply";
    goto LABEL_10;
  }
  id v5 = v4;
LABEL_4:

  return v5;
}

@end