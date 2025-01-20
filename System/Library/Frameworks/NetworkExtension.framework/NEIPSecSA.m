@interface NEIPSecSA
- (BOOL)isEqual:(id)a3;
- (BOOL)natDetectedOnPeer;
- (BOOL)natKeepaliveEnabled;
- (BOOL)natKeepaliveOffloadEnabled;
- (BOOL)natTraversalEnabled;
- (BOOL)sequencePerTrafficClass;
- (NSData)authenticationKey;
- (NSData)encryptionKey;
- (NSString)boundInterfaceName;
- (NSString)tunnelInterfaceName;
- (NWAddressEndpoint)localAddress;
- (NWAddressEndpoint)remoteAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDictionary;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initInboundSA;
- (id)initInboundSAWithSPI:(unsigned int)a3;
- (id)initOutboundSAWithSPI:(unsigned int)a3;
- (int)authenticationAlgorithm;
- (int)direction;
- (int)encryptionAlgorithm;
- (int)mode;
- (int)protocol;
- (unint64_t)hash;
- (unint64_t)lifetimeSeconds;
- (unint64_t)natKeepaliveIntervalSeconds;
- (unint64_t)natKeepaliveOffloadIntervalSeconds;
- (unsigned)natTraversalPort;
- (unsigned)natTraversalSrcPort;
- (unsigned)replayWindowSize;
- (unsigned)spi;
- (void)dealloc;
- (void)invalidate;
- (void)setAuthenticationAlgorithm:(int)a3;
- (void)setAuthenticationKey:(id)a3;
- (void)setBoundInterfaceName:(id)a3;
- (void)setEncryptionAlgorithm:(int)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setLifetimeSeconds:(unint64_t)a3;
- (void)setLocalAddress:(id)a3;
- (void)setMode:(int)a3;
- (void)setNatDetectedOnPeer:(BOOL)a3;
- (void)setNatKeepaliveEnabled:(BOOL)a3;
- (void)setNatKeepaliveIntervalSeconds:(unint64_t)a3;
- (void)setNatKeepaliveOffloadEnabled:(BOOL)a3;
- (void)setNatKeepaliveOffloadIntervalSeconds:(unint64_t)a3;
- (void)setNatTraversalEnabled:(BOOL)a3;
- (void)setNatTraversalPort:(unsigned __int16)a3;
- (void)setNatTraversalSrcPort:(unsigned __int16)a3;
- (void)setProtocol:(int)a3;
- (void)setRemoteAddress:(id)a3;
- (void)setReplayWindowSize:(unsigned int)a3;
- (void)setSequencePerTrafficClass:(BOOL)a3;
- (void)setTunnelInterfaceName:(id)a3;
@end

@implementation NEIPSecSA

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_tunnelInterfaceName, 0);
  objc_storeStrong((id *)&self->_boundInterfaceName, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);

  objc_storeStrong((id *)&self->_localAddress, 0);
}

- (void)setSequencePerTrafficClass:(BOOL)a3
{
  self->_sequencePerTrafficClass = a3;
}

- (BOOL)sequencePerTrafficClass
{
  return self->_sequencePerTrafficClass;
}

- (void)setNatTraversalSrcPort:(unsigned __int16)a3
{
  self->_natTraversalSrcPort = a3;
}

- (unsigned)natTraversalSrcPort
{
  return self->_natTraversalSrcPort;
}

- (void)setNatTraversalPort:(unsigned __int16)a3
{
  self->_natTraversalPort = a3;
}

- (unsigned)natTraversalPort
{
  return self->_natTraversalPort;
}

- (void)setNatKeepaliveOffloadIntervalSeconds:(unint64_t)a3
{
  self->_natKeepaliveOffloadIntervalSeconds = a3;
}

- (unint64_t)natKeepaliveOffloadIntervalSeconds
{
  return self->_natKeepaliveOffloadIntervalSeconds;
}

- (void)setNatKeepaliveIntervalSeconds:(unint64_t)a3
{
  self->_natKeepaliveIntervalSeconds = a3;
}

- (unint64_t)natKeepaliveIntervalSeconds
{
  return self->_natKeepaliveIntervalSeconds;
}

- (void)setNatKeepaliveOffloadEnabled:(BOOL)a3
{
  self->_natKeepaliveOffloadEnabled = a3;
}

- (BOOL)natKeepaliveOffloadEnabled
{
  return self->_natKeepaliveOffloadEnabled;
}

- (void)setNatKeepaliveEnabled:(BOOL)a3
{
  self->_natKeepaliveEnabled = a3;
}

- (BOOL)natKeepaliveEnabled
{
  return self->_natKeepaliveEnabled;
}

- (void)setNatDetectedOnPeer:(BOOL)a3
{
  self->_natDetectedOnPeer = a3;
}

- (BOOL)natDetectedOnPeer
{
  return self->_natDetectedOnPeer;
}

- (void)setNatTraversalEnabled:(BOOL)a3
{
  self->_natTraversalEnabled = a3;
}

- (BOOL)natTraversalEnabled
{
  return self->_natTraversalEnabled;
}

- (void)setAuthenticationKey:(id)a3
{
}

- (NSData)authenticationKey
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAuthenticationAlgorithm:(int)a3
{
  self->_authenticationAlgorithm = a3;
}

- (int)authenticationAlgorithm
{
  return self->_authenticationAlgorithm;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEncryptionAlgorithm:(int)a3
{
  self->_encryptionAlgorithm = a3;
}

- (int)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setLifetimeSeconds:(unint64_t)a3
{
  self->_lifetimeSeconds = a3;
}

- (unint64_t)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setReplayWindowSize:(unsigned int)a3
{
  self->_replayWindowSize = a3;
}

- (unsigned)replayWindowSize
{
  return self->_replayWindowSize;
}

- (void)setTunnelInterfaceName:(id)a3
{
}

- (NSString)tunnelInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBoundInterfaceName:(id)a3
{
}

- (NSString)boundInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRemoteAddress:(id)a3
{
}

- (NWAddressEndpoint)remoteAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocalAddress:(id)a3
{
}

- (NWAddressEndpoint)localAddress
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProtocol:(int)a3
{
  self->_protocol = a3;
}

- (int)protocol
{
  return self->_protocol;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)mode
{
  return self->_mode;
}

- (int)direction
{
  return self->_direction;
}

- (unsigned)spi
{
  return self->_spi;
}

- (void)dealloc
{
  [(NEIPSecSA *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NEIPSecSA;
  [(NEIPSecSA *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "Invalidate %@", (uint8_t *)&v4, 0xCu);
  }

  [(NEIPSecSA *)self setEncryptionKey:0];
  [(NEIPSecSA *)self setAuthenticationKey:0];
}

- (id)description
{
  return [(NEIPSecSA *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = v7;
  if (self) {
    uint64_t internalSAID = self->_internalSAID;
  }
  else {
    uint64_t internalSAID = 0;
  }
  [v7 appendPrettyInt:internalSAID withName:@"Internal SAID" andIndent:v5 options:a4];
  v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%08X", bswap32(-[NEIPSecSA spi](self, "spi")));
  [v8 appendPrettyObject:v10 withName:@"SPI" andIndent:v5 options:a4];

  unsigned int v11 = [(NEIPSecSA *)self direction];
  if (v11 == 1)
  {
    v12 = @"Outbound";
  }
  else if (v11 == 2)
  {
    v12 = @"Inbound";
  }
  else
  {
    v12 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%lld]", v11);
  }
  [v8 appendPrettyObject:v12 withName:@"Direction" andIndent:v5 options:a4];

  unsigned int v13 = [(NEIPSecSA *)self mode];
  if (v13 == 1)
  {
    v14 = @"Transport";
  }
  else if (v13 == 2)
  {
    v14 = @"Tunnel";
  }
  else
  {
    v14 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%lld]", v13);
  }
  [v8 appendPrettyObject:v14 withName:@"Mode" andIndent:v5 options:a4];

  unsigned int v15 = [(NEIPSecSA *)self protocol];
  if (v15 == 1)
  {
    v16 = @"ESP";
  }
  else if (v15 == 2)
  {
    v16 = @"AH";
  }
  else
  {
    v16 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%lld]", v15);
  }
  [v8 appendPrettyObject:v16 withName:@"Protocol" andIndent:v5 options:a4];

  v17 = [(NEIPSecSA *)self localAddress];
  [v8 appendPrettyObject:v17 withName:@"Local" andIndent:v5 options:a4];

  v18 = [(NEIPSecSA *)self remoteAddress];
  [v8 appendPrettyObject:v18 withName:@"Remote" andIndent:v5 options:a4];

  v19 = [(NEIPSecSA *)self boundInterfaceName];
  [v8 appendPrettyObject:v19 withName:@"Bound Interface" andIndent:v5 options:a4];

  v20 = [(NEIPSecSA *)self tunnelInterfaceName];
  [v8 appendPrettyObject:v20 withName:@"Tunnel Interface" andIndent:v5 options:a4];

  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA replayWindowSize](self, "replayWindowSize"), @"Replay Window Size", v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA lifetimeSeconds](self, "lifetimeSeconds"), @"Lifetime Seconds", v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA encryptionAlgorithm](self, "encryptionAlgorithm"), @"Encryption Algorithm", v5, a4);
  v21 = [(NEIPSecSA *)self encryptionKey];
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", objc_msgSend(v21, "length"), @"Encryption Key Length", v5, a4);

  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA authenticationAlgorithm](self, "authenticationAlgorithm"), @"Authentication Algorithm", v5, a4);
  v22 = [(NEIPSecSA *)self authenticationKey];
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", objc_msgSend(v22, "length"), @"Authentication Key Length", v5, a4);

  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA natTraversalEnabled](self, "natTraversalEnabled"), @"NAT Traversal Enabled", v5, a4);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA natDetectedOnPeer](self, "natDetectedOnPeer"), @"NAT Detected on Peer", v5, a4);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA natKeepaliveEnabled](self, "natKeepaliveEnabled"), @"NAT Keepalive Enabled", v5, a4);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA natKeepaliveOffloadEnabled](self, "natKeepaliveOffloadEnabled"), @"NAT Keepalive Offload Enabled", v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA natKeepaliveIntervalSeconds](self, "natKeepaliveIntervalSeconds"), @"NAT Keepalive Interval Seconds", v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA natKeepaliveOffloadIntervalSeconds](self, "natKeepaliveOffloadIntervalSeconds"), @"NAT Keepalive Offload Interval Seconds", v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA natTraversalPort](self, "natTraversalPort"), @"NAT Traversal Port", v5, a4);
  objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEIPSecSA natTraversalSrcPort](self, "natTraversalSrcPort"), @"NAT Traversal Source Port", v5, a4);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", -[NEIPSecSA sequencePerTrafficClass](self, "sequencePerTrafficClass"), @"Sequence Per Traffic Class", v5, a4);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [(NEIPSecSA *)self direction];
  uint64_t v6 = +[NEIPSecSA allocWithZone:a3];
  uint64_t v7 = [(NEIPSecSA *)self spi];
  if (v5 == 1) {
    uint64_t v8 = [(NEIPSecSA *)v6 initOutboundSAWithSPI:v7];
  }
  else {
    uint64_t v8 = [(NEIPSecSA *)v6 initInboundSAWithSPI:v7];
  }
  v9 = (void *)v8;
  if (!self)
  {
    unsigned int internalSAID = 0;
    if (v8) {
      goto LABEL_6;
    }
LABEL_9:
    [(NEIPSecSA *)self spi];
    goto LABEL_7;
  }
  unsigned int internalSAID = self->_internalSAID;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_6:
  *(_DWORD *)(v8 + 48) = internalSAID;
  *(_DWORD *)(v8 + 20) = [(NEIPSecSA *)self spi];
LABEL_7:
  objc_msgSend(v9, "setMode:", -[NEIPSecSA mode](self, "mode"));
  objc_msgSend(v9, "setProtocol:", -[NEIPSecSA protocol](self, "protocol"));
  unsigned int v11 = [(NEIPSecSA *)self localAddress];
  [v9 setLocalAddress:v11];

  v12 = [(NEIPSecSA *)self remoteAddress];
  [v9 setRemoteAddress:v12];

  unsigned int v13 = [(NEIPSecSA *)self boundInterfaceName];
  v14 = (void *)[v13 copyWithZone:a3];
  [v9 setBoundInterfaceName:v14];

  unsigned int v15 = [(NEIPSecSA *)self tunnelInterfaceName];
  v16 = (void *)[v15 copyWithZone:a3];
  [v9 setTunnelInterfaceName:v16];

  objc_msgSend(v9, "setReplayWindowSize:", -[NEIPSecSA replayWindowSize](self, "replayWindowSize"));
  objc_msgSend(v9, "setLifetimeSeconds:", -[NEIPSecSA lifetimeSeconds](self, "lifetimeSeconds"));
  objc_msgSend(v9, "setEncryptionAlgorithm:", -[NEIPSecSA encryptionAlgorithm](self, "encryptionAlgorithm"));
  v17 = [(NEIPSecSA *)self encryptionKey];
  v18 = (void *)[v17 copyWithZone:a3];
  [v9 setEncryptionKey:v18];

  objc_msgSend(v9, "setAuthenticationAlgorithm:", -[NEIPSecSA authenticationAlgorithm](self, "authenticationAlgorithm"));
  v19 = [(NEIPSecSA *)self authenticationKey];
  v20 = (void *)[v19 copyWithZone:a3];
  [v9 setAuthenticationKey:v20];

  objc_msgSend(v9, "setNatTraversalEnabled:", -[NEIPSecSA natTraversalEnabled](self, "natTraversalEnabled"));
  objc_msgSend(v9, "setNatDetectedOnPeer:", -[NEIPSecSA natDetectedOnPeer](self, "natDetectedOnPeer"));
  objc_msgSend(v9, "setNatKeepaliveEnabled:", -[NEIPSecSA natKeepaliveEnabled](self, "natKeepaliveEnabled"));
  objc_msgSend(v9, "setNatKeepaliveOffloadEnabled:", -[NEIPSecSA natKeepaliveOffloadEnabled](self, "natKeepaliveOffloadEnabled"));
  objc_msgSend(v9, "setNatKeepaliveIntervalSeconds:", -[NEIPSecSA natKeepaliveIntervalSeconds](self, "natKeepaliveIntervalSeconds"));
  objc_msgSend(v9, "setNatKeepaliveOffloadIntervalSeconds:", -[NEIPSecSA natKeepaliveOffloadIntervalSeconds](self, "natKeepaliveOffloadIntervalSeconds"));
  objc_msgSend(v9, "setNatTraversalPort:", -[NEIPSecSA natTraversalPort](self, "natTraversalPort"));
  objc_msgSend(v9, "setNatTraversalSrcPort:", -[NEIPSecSA natTraversalSrcPort](self, "natTraversalSrcPort"));
  objc_msgSend(v9, "setSequencePerTrafficClass:", -[NEIPSecSA sequencePerTrafficClass](self, "sequencePerTrafficClass"));
  return v9;
}

- (unint64_t)hash
{
  return [(NEIPSecSA *)self spi];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int v5 = [v4 spi], v5 == -[NEIPSecSA spi](self, "spi"))
    && (int v6 = [v4 direction], v6 == -[NEIPSecSA direction](self, "direction"))
    && (int v7 = [v4 mode], v7 == -[NEIPSecSA mode](self, "mode")))
  {
    int v8 = [v4 protocol];
    BOOL v9 = v8 == [(NEIPSecSA *)self protocol];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)initInboundSA
{
  v8.receiver = self;
  v8.super_class = (Class)NEIPSecSA;
  v2 = [(NEIPSecSA *)&v8 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_direction = 2;
    id v4 = v2;
  }
  else
  {
    int v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

- (id)initInboundSAWithSPI:(unsigned int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIPSecSA;
  id v4 = [(NEIPSecSA *)&v10 init];
  int v5 = v4;
  if (v4)
  {
    v4->_spi = a3;
    v4->_direction = 2;
    int v6 = v4;
  }
  else
  {
    objc_super v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }
  return v5;
}

- (id)initOutboundSAWithSPI:(unsigned int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIPSecSA;
  id v4 = [(NEIPSecSA *)&v10 init];
  int v5 = v4;
  if (v4)
  {
    v4->_spi = a3;
    v4->_direction = 1;
    int v6 = v4;
  }
  else
  {
    objc_super v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }
  return v5;
}

- (id)createDictionary
{
  if (!a1)
  {
    id v2 = 0;
    goto LABEL_89;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([a1 spi])
  {
    objc_super v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", bswap32(objc_msgSend(a1, "spi")));
    [v2 setObject:v3 forKeyedSubscript:@"SPIValue"];
  }
  id v4 = [a1 localAddress];

  if (v4)
  {
    int v5 = [a1 localAddress];
    int v6 = [v5 hostname];
    [v2 setObject:v6 forKeyedSubscript:@"LocalAddress"];

    int v7 = NSNumber;
    objc_super v8 = [a1 localAddress];
    BOOL v9 = [v8 port];
    objc_super v10 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    [v2 setObject:v10 forKeyedSubscript:@"LocalPort"];
  }
  unsigned int v11 = [a1 remoteAddress];

  if (v11)
  {
    v12 = [a1 remoteAddress];
    unsigned int v13 = [v12 hostname];
    [v2 setObject:v13 forKeyedSubscript:@"RemoteAddress"];

    v14 = NSNumber;
    unsigned int v15 = [a1 remoteAddress];
    v16 = [v15 port];
    v17 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
    [v2 setObject:v17 forKeyedSubscript:@"RemotePort"];
  }
  v18 = [a1 boundInterfaceName];

  if (v18)
  {
    v19 = [a1 boundInterfaceName];
    [v2 setObject:v19 forKeyedSubscript:@"OutgoingInterface"];
  }
  v20 = [a1 tunnelInterfaceName];

  if (v20)
  {
    v21 = [a1 tunnelInterfaceName];
    [v2 setObject:v21 forKeyedSubscript:@"IPSecInterface"];
  }
  if ([a1 mode] == 1)
  {
    v22 = @"Transport";
  }
  else
  {
    if ([a1 mode] != 2) {
      goto LABEL_17;
    }
    v22 = @"Tunnel";
  }
  [v2 setObject:v22 forKeyedSubscript:@"Mode"];
LABEL_17:
  if ([a1 protocol] == 2)
  {
    v23 = @"AH";
  }
  else
  {
    if ([a1 protocol] != 1) {
      goto LABEL_22;
    }
    v23 = @"ESP";
  }
  [v2 setObject:v23 forKeyedSubscript:@"IPSecProtocol"];
LABEL_22:
  if ([a1 encryptionAlgorithm] == 1)
  {
    v24 = @"NULL";
  }
  else if ([a1 encryptionAlgorithm] == 2)
  {
    v24 = @"DES";
  }
  else if ([a1 encryptionAlgorithm] == 3)
  {
    v24 = @"3DES";
  }
  else if ([a1 encryptionAlgorithm] == 4)
  {
    v24 = @"AES-128";
  }
  else if ([a1 encryptionAlgorithm] == 5)
  {
    v24 = @"AES-256";
  }
  else if ([a1 encryptionAlgorithm] == 6)
  {
    v24 = @"AES-128-GCM";
  }
  else if ([a1 encryptionAlgorithm] == 7)
  {
    v24 = @"AES-256-GCM";
  }
  else if ([a1 encryptionAlgorithm] == 8)
  {
    v24 = @"ChaCha20-Poly1305";
  }
  else if ([a1 encryptionAlgorithm] == 9)
  {
    v24 = @"ChaCha20-Poly1305-IIV";
  }
  else if ([a1 encryptionAlgorithm] == 10)
  {
    v24 = @"AES-128-GCM-IIV";
  }
  else if ([a1 encryptionAlgorithm] == 11)
  {
    v24 = @"AES-256-GCM-IIV";
  }
  else if ([a1 encryptionAlgorithm] == 12)
  {
    v24 = @"NULL-With-AES-128-GMAC";
  }
  else
  {
    if ([a1 encryptionAlgorithm] != 13) {
      goto LABEL_49;
    }
    v24 = @"NULL-With-AES-256-GMAC";
  }
  [v2 setObject:v24 forKeyedSubscript:@"EncryptionAlgorithm"];
LABEL_49:
  v25 = [a1 encryptionKey];
  [v2 setObject:v25 forKeyedSubscript:@"EncryptionKey"];

  if ([a1 authenticationAlgorithm] == 1)
  {
    v26 = @"MD5-96";
LABEL_59:
    [v2 setObject:v26 forKeyedSubscript:@"AuthAlgorithm"];
    goto LABEL_60;
  }
  if ([a1 authenticationAlgorithm] == 2)
  {
    v26 = @"SHA1-96";
    goto LABEL_59;
  }
  if ([a1 authenticationAlgorithm] == 3)
  {
    v26 = @"SHA2-256";
    goto LABEL_59;
  }
  if ([a1 authenticationAlgorithm] == 4)
  {
    v26 = @"SHA2-384";
    goto LABEL_59;
  }
  if ([a1 authenticationAlgorithm] == 5)
  {
    v26 = @"SHA2-512";
    goto LABEL_59;
  }
LABEL_60:
  v27 = [a1 authenticationKey];
  [v2 setObject:v27 forKeyedSubscript:@"AuthKey"];

  if ([a1 replayWindowSize])
  {
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "replayWindowSize"));
    [v2 setObject:v28 forKeyedSubscript:@"ReplayWindowSize"];
  }
  if ([a1 lifetimeSeconds])
  {
    v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "lifetimeSeconds"));
    [v2 setObject:v29 forKeyedSubscript:@"LifeTimeinSeconds"];
  }
  int v30 = [a1 natTraversalEnabled];
  uint64_t v31 = *MEMORY[0x1E4F1CFD0];
  uint64_t v32 = *MEMORY[0x1E4F1CFC8];
  if (v30) {
    uint64_t v33 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v33 = *MEMORY[0x1E4F1CFC8];
  }
  [v2 setObject:v33 forKeyedSubscript:@"NATTraversal"];
  if ([a1 natDetectedOnPeer]) {
    uint64_t v34 = v31;
  }
  else {
    uint64_t v34 = v32;
  }
  [v2 setObject:v34 forKeyedSubscript:@"NATTDetectedPeer"];
  if ([a1 natKeepaliveEnabled]) {
    uint64_t v35 = v31;
  }
  else {
    uint64_t v35 = v32;
  }
  [v2 setObject:v35 forKeyedSubscript:@"NATTKeepAlive"];
  if ([a1 natKeepaliveOffloadEnabled]) {
    uint64_t v36 = v31;
  }
  else {
    uint64_t v36 = v32;
  }
  [v2 setObject:v36 forKeyedSubscript:@"NATTKeepAliveOffload"];
  if ([a1 natTraversalPort])
  {
    v37 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(a1, "natTraversalPort"));
    [v2 setObject:v37 forKeyedSubscript:@"NATTPort"];
  }
  if ([a1 natTraversalSrcPort])
  {
    v38 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(a1, "natTraversalSrcPort"));
    [v2 setObject:v38 forKeyedSubscript:@"NATTSourcePort"];
  }
  if ([a1 natKeepaliveIntervalSeconds])
  {
    v39 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "natKeepaliveIntervalSeconds"));
    [v2 setObject:v39 forKeyedSubscript:@"NATTKeepAliveInterval"];
  }
  if ([a1 natKeepaliveOffloadIntervalSeconds])
  {
    v40 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "natKeepaliveOffloadIntervalSeconds"));
    [v2 setObject:v40 forKeyedSubscript:@"NATTKeepAliveOffloadInterval"];
  }
  if ([a1 sequencePerTrafficClass])
  {
    if ([a1 sequencePerTrafficClass]) {
      uint64_t v41 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v41 = MEMORY[0x1E4F1CC28];
    }
    [v2 setObject:v41 forKeyedSubscript:@"sequencePerTrafficClass"];
  }
LABEL_89:

  return v2;
}

@end