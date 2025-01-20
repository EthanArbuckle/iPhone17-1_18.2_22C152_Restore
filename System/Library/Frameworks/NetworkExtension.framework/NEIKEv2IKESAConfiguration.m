@interface NEIKEv2IKESAConfiguration
- (BOOL)allowRedirect;
- (BOOL)allowTCPEncapsulation;
- (BOOL)disableSwitchToNATTPorts;
- (BOOL)forceUDPEncapsulation;
- (BOOL)preferInitiatorProposalOrder;
- (BOOL)randomizeLocalPort;
- (BOOL)requestChildlessSA;
- (BOOL)requestPPK;
- (BOOL)serverMode;
- (BOOL)strictNonceSizeChecks;
- (BOOL)useTLSForTCPEncapsulation;
- (NEIKEv2IKESAConfiguration)init;
- (NSArray)customIKESAInitPayloads;
- (NSArray)customIKESAInitVendorPayloads;
- (NSArray)proposals;
- (NSSet)extraSupportedSignatureHashes;
- (NSSet)supportedSecurePasswordMethods;
- (NSString)outgoingInterfaceName;
- (NWAddressEndpoint)redirectedFromServer;
- (NWEndpoint)localEndpoint;
- (NWEndpoint)remoteEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unsigned)headerOverhead;
- (unsigned)maximumPacketSize;
- (unsigned)nonceSize;
- (unsigned)tcpEncapsulationPort;
- (void)setAllowRedirect:(BOOL)a3;
- (void)setAllowTCPEncapsulation:(BOOL)a3;
- (void)setCustomIKESAInitPayloads:(id)a3;
- (void)setCustomIKESAInitVendorPayloads:(id)a3;
- (void)setDisableSwitchToNATTPorts:(BOOL)a3;
- (void)setExtraSupportedSignatureHashes:(id)a3;
- (void)setForceUDPEncapsulation:(BOOL)a3;
- (void)setHeaderOverhead:(unsigned int)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setMaximumPacketSize:(unsigned int)a3;
- (void)setNonceSize:(unsigned int)a3;
- (void)setOutgoingInterfaceName:(id)a3;
- (void)setPreferInitiatorProposalOrder:(BOOL)a3;
- (void)setProposals:(id)a3;
- (void)setRandomizeLocalPort:(BOOL)a3;
- (void)setRedirectedFromServer:(id)a3;
- (void)setRemoteEndpoint:(id)a3;
- (void)setRequestChildlessSA:(BOOL)a3;
- (void)setRequestPPK:(BOOL)a3;
- (void)setServerMode:(BOOL)a3;
- (void)setStrictNonceSizeChecks:(BOOL)a3;
- (void)setSupportedSecurePasswordMethods:(id)a3;
- (void)setTcpEncapsulationPort:(unsigned __int16)a3;
- (void)setUseTLSForTCPEncapsulation:(BOOL)a3;
@end

@implementation NEIKEv2IKESAConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSecurePasswordMethods, 0);
  objc_storeStrong((id *)&self->_extraSupportedSignatureHashes, 0);
  objc_storeStrong((id *)&self->_customIKESAInitVendorPayloads, 0);
  objc_storeStrong((id *)&self->_customIKESAInitPayloads, 0);
  objc_storeStrong((id *)&self->_redirectedFromServer, 0);
  objc_storeStrong((id *)&self->_outgoingInterfaceName, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);

  objc_storeStrong((id *)&self->_proposals, 0);
}

- (void)setSupportedSecurePasswordMethods:(id)a3
{
}

- (NSSet)supportedSecurePasswordMethods
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setExtraSupportedSignatureHashes:(id)a3
{
}

- (NSSet)extraSupportedSignatureHashes
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRequestPPK:(BOOL)a3
{
  self->_requestPPK = a3;
}

- (BOOL)requestPPK
{
  return self->_requestPPK;
}

- (void)setRequestChildlessSA:(BOOL)a3
{
  self->_requestChildlessSA = a3;
}

- (BOOL)requestChildlessSA
{
  return self->_requestChildlessSA;
}

- (void)setHeaderOverhead:(unsigned int)a3
{
  self->_headerOverhead = a3;
}

- (unsigned)headerOverhead
{
  return self->_headerOverhead;
}

- (void)setMaximumPacketSize:(unsigned int)a3
{
  self->_maximumPacketSize = a3;
}

- (unsigned)maximumPacketSize
{
  return self->_maximumPacketSize;
}

- (void)setCustomIKESAInitVendorPayloads:(id)a3
{
}

- (NSArray)customIKESAInitVendorPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCustomIKESAInitPayloads:(id)a3
{
}

- (NSArray)customIKESAInitPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRedirectedFromServer:(id)a3
{
}

- (NWAddressEndpoint)redirectedFromServer
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStrictNonceSizeChecks:(BOOL)a3
{
  self->_strictNonceSizeChecks = a3;
}

- (BOOL)strictNonceSizeChecks
{
  return self->_strictNonceSizeChecks;
}

- (void)setNonceSize:(unsigned int)a3
{
  self->_nonceSize = a3;
}

- (unsigned)nonceSize
{
  return self->_nonceSize;
}

- (void)setTcpEncapsulationPort:(unsigned __int16)a3
{
  self->_tcpEncapsulationPort = a3;
}

- (unsigned)tcpEncapsulationPort
{
  return self->_tcpEncapsulationPort;
}

- (void)setPreferInitiatorProposalOrder:(BOOL)a3
{
  self->_preferInitiatorProposalOrder = a3;
}

- (BOOL)preferInitiatorProposalOrder
{
  return self->_preferInitiatorProposalOrder;
}

- (void)setForceUDPEncapsulation:(BOOL)a3
{
  self->_forceUDPEncapsulation = a3;
}

- (BOOL)forceUDPEncapsulation
{
  return self->_forceUDPEncapsulation;
}

- (void)setUseTLSForTCPEncapsulation:(BOOL)a3
{
  self->_useTLSForTCPEncapsulation = a3;
}

- (BOOL)useTLSForTCPEncapsulation
{
  return self->_useTLSForTCPEncapsulation;
}

- (void)setAllowTCPEncapsulation:(BOOL)a3
{
  self->_allowTCPEncapsulation = a3;
}

- (BOOL)allowTCPEncapsulation
{
  return self->_allowTCPEncapsulation;
}

- (void)setDisableSwitchToNATTPorts:(BOOL)a3
{
  self->_disableSwitchToNATTPorts = a3;
}

- (BOOL)disableSwitchToNATTPorts
{
  return self->_disableSwitchToNATTPorts;
}

- (void)setAllowRedirect:(BOOL)a3
{
  self->_allowRedirect = a3;
}

- (BOOL)allowRedirect
{
  return self->_allowRedirect;
}

- (void)setServerMode:(BOOL)a3
{
  self->_serverMode = a3;
}

- (BOOL)serverMode
{
  return self->_serverMode;
}

- (void)setRandomizeLocalPort:(BOOL)a3
{
  self->_randomizeLocalPort = a3;
}

- (BOOL)randomizeLocalPort
{
  return self->_randomizeLocalPort;
}

- (void)setOutgoingInterfaceName:(id)a3
{
}

- (NSString)outgoingInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteEndpoint:(id)a3
{
}

- (NWEndpoint)remoteEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalEndpoint:(id)a3
{
}

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProposals:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (NSArray *)[a3 copy];
  proposals = self->_proposals;
  self->_proposals = v4;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_proposals;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        ++v9;
        if (v12) {
          *(unsigned char *)(v12 + 8) = v9;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (NSArray)proposals
{
  return self->_proposals;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NEIKEv2IKESAConfiguration *)self localEndpoint];
  v6 = (void *)[v5 copy];
  [v4 setLocalEndpoint:v6];

  uint64_t v7 = [(NEIKEv2IKESAConfiguration *)self remoteEndpoint];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setRemoteEndpoint:v8];

  char v9 = [(NEIKEv2IKESAConfiguration *)self outgoingInterfaceName];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setOutgoingInterfaceName:v10];

  objc_msgSend(v4, "setRandomizeLocalPort:", -[NEIKEv2IKESAConfiguration randomizeLocalPort](self, "randomizeLocalPort"));
  objc_msgSend(v4, "setServerMode:", -[NEIKEv2IKESAConfiguration serverMode](self, "serverMode"));
  objc_msgSend(v4, "setAllowRedirect:", -[NEIKEv2IKESAConfiguration allowRedirect](self, "allowRedirect"));
  objc_msgSend(v4, "setDisableSwitchToNATTPorts:", -[NEIKEv2IKESAConfiguration disableSwitchToNATTPorts](self, "disableSwitchToNATTPorts"));
  objc_msgSend(v4, "setAllowTCPEncapsulation:", -[NEIKEv2IKESAConfiguration allowTCPEncapsulation](self, "allowTCPEncapsulation"));
  objc_msgSend(v4, "setUseTLSForTCPEncapsulation:", -[NEIKEv2IKESAConfiguration useTLSForTCPEncapsulation](self, "useTLSForTCPEncapsulation"));
  objc_msgSend(v4, "setForceUDPEncapsulation:", -[NEIKEv2IKESAConfiguration forceUDPEncapsulation](self, "forceUDPEncapsulation"));
  objc_msgSend(v4, "setPreferInitiatorProposalOrder:", -[NEIKEv2IKESAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"));
  objc_msgSend(v4, "setTcpEncapsulationPort:", -[NEIKEv2IKESAConfiguration tcpEncapsulationPort](self, "tcpEncapsulationPort"));
  objc_msgSend(v4, "setNonceSize:", -[NEIKEv2IKESAConfiguration nonceSize](self, "nonceSize"));
  objc_msgSend(v4, "setStrictNonceSizeChecks:", -[NEIKEv2IKESAConfiguration strictNonceSizeChecks](self, "strictNonceSizeChecks"));
  v11 = [(NEIKEv2IKESAConfiguration *)self redirectedFromServer];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setRedirectedFromServer:v12];

  long long v13 = [(NEIKEv2IKESAConfiguration *)self proposals];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1C978]);
    long long v15 = [(NEIKEv2IKESAConfiguration *)self proposals];
    long long v16 = (void *)[v14 initWithArray:v15 copyItems:1];
    [v4 setProposals:v16];
  }
  v17 = [(NEIKEv2IKESAConfiguration *)self customIKESAInitPayloads];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1C978]);
    v19 = [(NEIKEv2IKESAConfiguration *)self customIKESAInitPayloads];
    v20 = (void *)[v18 initWithArray:v19 copyItems:1];
    [v4 setCustomIKESAInitPayloads:v20];
  }
  v21 = [(NEIKEv2IKESAConfiguration *)self customIKESAInitVendorPayloads];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1C978]);
    v23 = [(NEIKEv2IKESAConfiguration *)self customIKESAInitVendorPayloads];
    v24 = (void *)[v22 initWithArray:v23 copyItems:1];
    [v4 setCustomIKESAInitVendorPayloads:v24];
  }
  objc_msgSend(v4, "setMaximumPacketSize:", -[NEIKEv2IKESAConfiguration maximumPacketSize](self, "maximumPacketSize"));
  objc_msgSend(v4, "setHeaderOverhead:", -[NEIKEv2IKESAConfiguration headerOverhead](self, "headerOverhead"));
  objc_msgSend(v4, "setRequestChildlessSA:", -[NEIKEv2IKESAConfiguration requestChildlessSA](self, "requestChildlessSA"));
  objc_msgSend(v4, "setRequestPPK:", -[NEIKEv2IKESAConfiguration requestPPK](self, "requestPPK"));
  v25 = [(NEIKEv2IKESAConfiguration *)self extraSupportedSignatureHashes];

  if (v25)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v27 = [(NEIKEv2IKESAConfiguration *)self extraSupportedSignatureHashes];
    v28 = (void *)[v26 initWithSet:v27 copyItems:1];
    [v4 setExtraSupportedSignatureHashes:v28];
  }
  v29 = [(NEIKEv2IKESAConfiguration *)self supportedSecurePasswordMethods];

  if (v29)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v31 = [(NEIKEv2IKESAConfiguration *)self supportedSecurePasswordMethods];
    v32 = (void *)[v30 initWithSet:v31 copyItems:1];
    [v4 setSupportedSecurePasswordMethods:v32];
  }
  return v4;
}

- (id)description
{
  return [(NEIKEv2IKESAConfiguration *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  uint64_t v8 = [(NEIKEv2IKESAConfiguration *)self localEndpoint];
  [v7 appendPrettyObject:v8 withName:@"Local Endpoint" andIndent:v5 options:a4];

  char v9 = [(NEIKEv2IKESAConfiguration *)self remoteEndpoint];
  [v7 appendPrettyObject:v9 withName:@"Remote Endpoint" andIndent:v5 options:a4];

  uint64_t v10 = [(NEIKEv2IKESAConfiguration *)self outgoingInterfaceName];
  [v7 appendPrettyObject:v10 withName:@"Outgoing Interface" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration randomizeLocalPort](self, "randomizeLocalPort"), @"Randomize Local Port", v5, a4);
  v11 = [(NEIKEv2IKESAConfiguration *)self proposals];
  [v7 appendPrettyObject:v11 withName:@"Proposals" andIndent:v5 options:a4];

  uint64_t v12 = [(NEIKEv2IKESAConfiguration *)self customIKESAInitPayloads];
  [v7 appendPrettyObject:v12 withName:@"Custom Payloads" andIndent:v5 options:a4];

  long long v13 = [(NEIKEv2IKESAConfiguration *)self customIKESAInitVendorPayloads];
  [v7 appendPrettyObject:v13 withName:@"Vendor Payloads" andIndent:v5 options:a4];

  id v14 = [(NEIKEv2IKESAConfiguration *)self redirectedFromServer];
  [v7 appendPrettyObject:v14 withName:@"Redirected From" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration allowRedirect](self, "allowRedirect"), @"Allow Redirect", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration disableSwitchToNATTPorts](self, "disableSwitchToNATTPorts"), @"Disable NAT Ports", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration forceUDPEncapsulation](self, "forceUDPEncapsulation"), @"Force UDP Encapsulation", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration serverMode](self, "serverMode"), @"Server Mode", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"), @"Prefer Initiator Proposal Order", v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration nonceSize](self, "nonceSize"), @"Nonce Size", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2IKESAConfiguration requestPPK](self, "requestPPK"), @"Request PPK", v5, a4);
  long long v15 = [(NEIKEv2IKESAConfiguration *)self extraSupportedSignatureHashes];
  [v7 appendPrettyObject:v15 withName:@"Extra Supported Signature Hashes" andIndent:v5 options:a4];

  return v7;
}

- (NEIKEv2IKESAConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2IKESAConfiguration;
  v2 = [(NEIKEv2IKESAConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(NEIKEv2IKESAConfiguration *)v2 setNonceSize:16];
    [(NEIKEv2IKESAConfiguration *)v3 setMaximumPacketSize:0];
    [(NEIKEv2IKESAConfiguration *)v3 setHeaderOverhead:0xFFFFFFFFLL];
    v4 = v3;
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

@end