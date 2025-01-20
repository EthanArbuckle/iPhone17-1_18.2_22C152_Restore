@interface IDSDataChannelLinkContext
- (BOOL)directConnectionReady;
- (BOOL)hasReceivedPacket;
- (BOOL)hasSentPacket;
- (BOOL)isQUICPod;
- (BOOL)isVirtualRelayLink;
- (BOOL)serverIsDegraded;
- (IDSDataChannelLinkContext)initWithAttributes:(id *)a3 maxBitrate:(unsigned int)a4 relayServerProvider:(int64_t)a5 relaySessionToken:(id)a6 relaySessionKey:(id)a7 hbhEncryptionkey:(id)a8 hbhDecryptionkey:(id)a9 relayProtocolStackDescription:(id)a10 qrExperiments:(id)a11 estimatedPerPacketConstantOverhead:(unsigned __int16)a12;
- (IDSDataChannelLinkContext)initWithDummyInformation;
- (NSData)hbhDecryptionkey;
- (NSData)hbhEncryptionkey;
- (NSData)relaySessionKey;
- (NSData)relaySessionToken;
- (NSDictionary)qrExperiments;
- (NSString)channelDataBaseProtocolStackDescription;
- (NSString)localInterfaceName;
- (NSString)relayProtocolStackDescription;
- (NSUUID)QRSessionID;
- (NSUUID)linkUUID;
- (_IDSDataChannelLinkConnections)connections;
- (char)delegatedLinkID;
- (char)linkID;
- (double)lastPacketReceivedTime;
- (double)lastPacketReportedTime;
- (double)lastPacketSentTime;
- (id)_connection;
- (id)description;
- (int64_t)connectionType;
- (int64_t)dataPathType;
- (int64_t)relayServerProvider;
- (int64_t)remoteConnectionType;
- (unsigned)RATType;
- (unsigned)channelNumber;
- (unsigned)estimatedPerPacketConstantOverhead;
- (unsigned)localDataSoMask;
- (unsigned)localLinkFlags;
- (unsigned)localRelayLinkID;
- (unsigned)maxBitrate;
- (unsigned)maxMTU;
- (unsigned)networkType;
- (unsigned)remoteDataSoMask;
- (unsigned)remoteLinkFlags;
- (unsigned)remoteNetworkType;
- (unsigned)remoteRATType;
- (unsigned)remoteRelayLinkID;
- (unsigned)totalPacketsReceivedOnLink;
- (unsigned)totalPacketsSentOnLink;
- (void)setDelegateLinkID:(unsigned __int8)a3;
- (void)setDirectConnectionReady:(BOOL)a3;
- (void)setHasReceivedPacket:(BOOL)a3;
- (void)setHasSentPacket:(BOOL)a3;
- (void)setIsVirtualRelayLink:(BOOL)a3;
- (void)setLastPacketReceivedTime:(double)a3;
- (void)setLastPacketReportedTime:(double)a3;
- (void)setLastPacketSentTime:(double)a3;
- (void)setMTU:(unsigned __int16)a3;
- (void)setMaxBitrate:(unsigned int)a3;
- (void)setQrExperiments:(id)a3;
- (void)setRATType:(unsigned int)a3;
- (void)setTotalPacketsReceivedOnLink:(unsigned int)a3;
- (void)setTotalPacketsSentOnLink:(unsigned int)a3;
@end

@implementation IDSDataChannelLinkContext

- (IDSDataChannelLinkContext)initWithDummyInformation
{
  if (_IDSRunningInDaemon())
  {
    v3 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    goto LABEL_5;
  }
  v18.receiver = self;
  v18.super_class = (Class)IDSDataChannelLinkContext;
  self = [(IDSDataChannelLinkContext *)&v18 init];
  if (!self)
  {
LABEL_9:
    self = self;
    v4 = self;
    goto LABEL_10;
  }
  v5 = objc_alloc_init(_IDSDataChannelLinkContext);
  internal = self->_internal;
  self->_internal = v5;

  v7 = self->_internal;
  if (v7)
  {
    v7->_linkID = 0;
    self->_internal->_maxMTU = 1450;
    self->_internal->_networkType = 1;
    self->_internal->_connectionType = 0;
    self->_internal->_RATType = 0;
    self->_internal->_remoteNetworkType = 1;
    self->_internal->_remoteConnectionType = 0;
    self->_internal->_remoteRATType = 0;
    self->_internal->_maxBitrate = 100000;
    self->_internal->_localLinkFlags = 0;
    self->_internal->_remoteLinkFlags = 0;
    self->_internal->_localDataSoMask = 0;
    self->_internal->_remoteDataSoMask = 0;
    self->_internal->_localRelayLinkID = 4;
    self->_internal->_remoteRelayLinkID = 6;
    self->_internal->_channelNumber = 96;
    objc_msgSend(MEMORY[0x1E4F1C9B8], "__imDataWithRandomBytes:", 32);
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_internal->_hbhEncryptionkey, v8);
    v9 = self->_internal;
    hbhDecryptionkey = v9->_hbhDecryptionkey;
    v9->_hbhDecryptionkey = v8;
    v11 = v8;

    v12 = objc_alloc_init(_IDSDataChannelLinkConnection);
    [(_IDSDataChannelLinkConnection *)v12 setType:@"udp"];
    [(_IDSDataChannelLinkConnection *)v12 setAllowOutgoing:1];
    [(_IDSDataChannelLinkConnection *)v12 setClientNWConnectionID:5];
    [(_IDSDataChannelLinkConnection *)v12 setNwConnectionID:4];
    [(_IDSDataChannelLinkConnection *)v12 setIsQUICPod:0];
    [(_IDSDataChannelLinkConnection *)v12 setProtocolStack:@"ip.udp.demux"];
    v13 = objc_alloc_init(_IDSDataChannelLinkConnection);
    [(_IDSDataChannelLinkConnection *)v13 setType:@"qpod"];
    [(_IDSDataChannelLinkConnection *)v13 setAllowOutgoing:1];
    [(_IDSDataChannelLinkConnection *)v13 setClientNWConnectionID:5];
    [(_IDSDataChannelLinkConnection *)v13 setNwConnectionID:4];
    [(_IDSDataChannelLinkConnection *)v13 setIsQUICPod:1];
    [(_IDSDataChannelLinkConnection *)v13 setProtocolStack:@"ip.udp.demux.qpod"];
    v14 = objc_alloc_init(_IDSDataChannelLinkConnections);
    v15 = self->_internal;
    connections = v15->_connections;
    v15->_connections = v14;

    [(_IDSDataChannelLinkConnections *)self->_internal->_connections setUdp:v12];
    [(_IDSDataChannelLinkConnections *)self->_internal->_connections setQpod:v13];

    goto LABEL_9;
  }
LABEL_5:
  v4 = 0;
LABEL_10:

  return v4;
}

- (IDSDataChannelLinkContext)initWithAttributes:(id *)a3 maxBitrate:(unsigned int)a4 relayServerProvider:(int64_t)a5 relaySessionToken:(id)a6 relaySessionKey:(id)a7 hbhEncryptionkey:(id)a8 hbhDecryptionkey:(id)a9 relayProtocolStackDescription:(id)a10 qrExperiments:(id)a11 estimatedPerPacketConstantOverhead:(unsigned __int16)a12
{
  id v40 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v42 = a10;
  id v41 = a11;
  v43.receiver = self;
  v43.super_class = (Class)IDSDataChannelLinkContext;
  v20 = [(IDSDataChannelLinkContext *)&v43 init];
  if (v20)
  {
    v21 = objc_alloc_init(_IDSDataChannelLinkContext);
    internal = v20->_internal;
    v20->_internal = v21;

    v23 = v20->_internal;
    if (!v23)
    {
      v36 = 0;
      goto LABEL_6;
    }
    v23->_linkID = a3->var2;
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3];
    v25 = v20->_internal;
    linkUUID = v25->_linkUUID;
    v25->_linkUUID = (NSUUID *)v24;

    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3->var1];
    v28 = v20->_internal;
    QRSessionID = v28->_QRSessionID;
    v28->_QRSessionID = (NSUUID *)v27;

    v20->_internal->_networkType = a3->var3;
    v20->_internal->_connectionType = a3->var4;
    v20->_internal->_RATType = a3->var5;
    v20->_internal->_maxMTU = a3->var15;
    v20->_internal->_relayServerProvider = a5;
    objc_storeStrong((id *)&v20->_internal->_relaySessionToken, a6);
    objc_storeStrong((id *)&v20->_internal->_relaySessionKey, a7);
    v20->_internal->_serverIsDegraded = a3->var9 != 0;
    v20->_internal->_localLinkFlags |= a3->var10 & 1;
    v20->_internal->_localLinkFlags |= a3->var10 & 2;
    v20->_internal->_localLinkFlags |= a3->var10 & 4;
    v20->_internal->_localLinkFlags |= a3->var10 & 8;
    v20->_internal->_localLinkFlags |= a3->var10 & 0x10;
    v20->_internal->_localLinkFlags |= a3->var10 & 0x20;
    v20->_internal->_localLinkFlags |= a3->var10 & 0x40;
    v20->_internal->_localLinkFlags |= a3->var10 & 0x80;
    v20->_internal->_maxBitrate = a4;
    v20->_internal->_localDataSoMask = a3->var12;
    v20->_internal->_isVirtualRelayLink = a3->var18;
    a3->var21[15] = 0;
    uint64_t v30 = [NSString stringWithCString:a3->var21 encoding:4];
    v31 = v20->_internal;
    localInterfaceName = v31->_localInterfaceName;
    v31->_localInterfaceName = (NSString *)v30;

    objc_storeStrong((id *)&v20->_internal->_relayProtocolStackDescription, a10);
    objc_storeStrong((id *)&v20->_internal->_qrExperiments, a11);
    v20->_internal->_remoteNetworkType = a3->var6;
    v20->_internal->_remoteConnectionType = a3->var7;
    v20->_internal->_remoteRATType = a3->var8;
    v20->_internal->_remoteLinkFlags |= a3->var11 & 1;
    v20->_internal->_remoteLinkFlags |= a3->var11 & 2;
    v20->_internal->_remoteLinkFlags |= a3->var11 & 4;
    v20->_internal->_remoteLinkFlags |= a3->var11 & 8;
    v20->_internal->_remoteLinkFlags |= a3->var11 & 0x10;
    v20->_internal->_remoteLinkFlags |= a3->var11 & 0x20;
    v20->_internal->_remoteLinkFlags |= a3->var11 & 0x40;
    v20->_internal->_remoteLinkFlags |= a3->var11 & 0x80;
    v20->_internal->_remoteDataSoMask = a3->var13;
    v20->_internal->_delegatedLinkID = a3->var20;
    v20->_internal->_localRelayLinkID = a3->var16;
    v20->_internal->_remoteRelayLinkID = a3->var17;
    v20->_internal->_channelNumber = a3->var14;
    objc_storeStrong((id *)&v20->_internal->_hbhEncryptionkey, a8);
    objc_storeStrong((id *)&v20->_internal->_hbhDecryptionkey, a9);
    v33 = objc_alloc_init(_IDSDataChannelLinkConnections);
    v34 = v20->_internal;
    connections = v34->_connections;
    v34->_connections = v33;

    v20->_internal->_estimatedPerPacketConstantOverhead = a12;
  }
  v36 = v20;
LABEL_6:

  return v36;
}

- (id)description
{
  return [(_IDSDataChannelLinkContext *)self->_internal description];
}

- (char)linkID
{
  return self->_internal->_linkID;
}

- (NSUUID)linkUUID
{
  return self->_internal->_linkUUID;
}

- (NSUUID)QRSessionID
{
  return self->_internal->_QRSessionID;
}

- (unsigned)networkType
{
  return self->_internal->_networkType;
}

- (int64_t)connectionType
{
  return self->_internal->_connectionType;
}

- (unsigned)RATType
{
  return self->_internal->_RATType;
}

- (unsigned)maxMTU
{
  return self->_internal->_maxMTU;
}

- (unsigned)maxBitrate
{
  return self->_internal->_maxBitrate;
}

- (unsigned)remoteNetworkType
{
  return self->_internal->_remoteNetworkType;
}

- (int64_t)remoteConnectionType
{
  return self->_internal->_remoteConnectionType;
}

- (unsigned)remoteRATType
{
  return self->_internal->_remoteRATType;
}

- (int64_t)relayServerProvider
{
  return self->_internal->_relayServerProvider;
}

- (NSData)relaySessionToken
{
  return self->_internal->_relaySessionToken;
}

- (NSData)relaySessionKey
{
  return self->_internal->_relaySessionKey;
}

- (BOOL)serverIsDegraded
{
  return self->_internal->_serverIsDegraded;
}

- (void)setRATType:(unsigned int)a3
{
  self->_internal->_RATType = a3;
}

- (void)setMTU:(unsigned __int16)a3
{
  self->_internal->_maxMTU = a3;
}

- (void)setMaxBitrate:(unsigned int)a3
{
  self->_internal->_maxBitrate = a3;
}

- (unsigned)remoteLinkFlags
{
  return self->_internal->_remoteLinkFlags;
}

- (unsigned)localLinkFlags
{
  return self->_internal->_localLinkFlags;
}

- (unsigned)localDataSoMask
{
  return self->_internal->_localDataSoMask;
}

- (unsigned)remoteDataSoMask
{
  return self->_internal->_remoteDataSoMask;
}

- (BOOL)isVirtualRelayLink
{
  return self->_internal->_isVirtualRelayLink;
}

- (NSString)localInterfaceName
{
  return self->_internal->_localInterfaceName;
}

- (BOOL)isQUICPod
{
  v2 = [(_IDSDataChannelLinkConnections *)self->_internal->_connections qpod];
  v3 = v2;
  BOOL v4 = v2 && ([v2 allowOutgoing] & 1) != 0;

  return v4;
}

- (NSString)relayProtocolStackDescription
{
  return self->_internal->_relayProtocolStackDescription;
}

- (_IDSDataChannelLinkConnections)connections
{
  return self->_internal->_connections;
}

- (id)_connection
{
  BOOL v3 = [(IDSDataChannelLinkContext *)self isQUICPod];
  connections = self->_internal->_connections;
  if (v3) {
    [(_IDSDataChannelLinkConnections *)connections qpod];
  }
  else {
  v5 = [(_IDSDataChannelLinkConnections *)connections udp];
  }

  return v5;
}

- (NSString)channelDataBaseProtocolStackDescription
{
  v2 = [(IDSDataChannelLinkContext *)self _connection];
  BOOL v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 protocolStack];
  }
  else
  {
    BOOL v4 = @"(unknown)";
  }

  return (NSString *)v4;
}

- (NSDictionary)qrExperiments
{
  return self->_internal->_qrExperiments;
}

- (void)setQrExperiments:(id)a3
{
}

- (unsigned)channelNumber
{
  return self->_internal->_channelNumber;
}

- (NSData)hbhEncryptionkey
{
  return self->_internal->_hbhEncryptionkey;
}

- (NSData)hbhDecryptionkey
{
  return self->_internal->_hbhDecryptionkey;
}

- (char)delegatedLinkID
{
  return self->_internal->_delegatedLinkID;
}

- (unsigned)localRelayLinkID
{
  return self->_internal->_localRelayLinkID;
}

- (unsigned)remoteRelayLinkID
{
  return self->_internal->_remoteRelayLinkID;
}

- (BOOL)directConnectionReady
{
  return self->_internal->_directConnectionIsReady;
}

- (void)setDirectConnectionReady:(BOOL)a3
{
  self->_internal->_directConnectionIsReady = a3;
}

- (void)setIsVirtualRelayLink:(BOOL)a3
{
  self->_internal->_isVirtualRelayLink = a3;
}

- (void)setDelegateLinkID:(unsigned __int8)a3
{
  self->_internal->_delegatedLinkID = a3;
}

- (unsigned)estimatedPerPacketConstantOverhead
{
  return self->_internal->_estimatedPerPacketConstantOverhead;
}

- (int64_t)dataPathType
{
  return self->_dataPathType;
}

- (unsigned)totalPacketsSentOnLink
{
  return self->_totalPacketsSentOnLink;
}

- (void)setTotalPacketsSentOnLink:(unsigned int)a3
{
  self->_totalPacketsSentOnLink = a3;
}

- (unsigned)totalPacketsReceivedOnLink
{
  return self->_totalPacketsReceivedOnLink;
}

- (void)setTotalPacketsReceivedOnLink:(unsigned int)a3
{
  self->_totalPacketsReceivedOnLink = a3;
}

- (BOOL)hasReceivedPacket
{
  return self->_hasReceivedPacket;
}

- (void)setHasReceivedPacket:(BOOL)a3
{
  self->_hasReceivedPacket = a3;
}

- (double)lastPacketReceivedTime
{
  return self->_lastPacketReceivedTime;
}

- (void)setLastPacketReceivedTime:(double)a3
{
  self->_lastPacketReceivedTime = a3;
}

- (double)lastPacketSentTime
{
  return self->_lastPacketSentTime;
}

- (void)setLastPacketSentTime:(double)a3
{
  self->_lastPacketSentTime = a3;
}

- (double)lastPacketReportedTime
{
  return self->_lastPacketReportedTime;
}

- (void)setLastPacketReportedTime:(double)a3
{
  self->_lastPacketReportedTime = a3;
}

- (BOOL)hasSentPacket
{
  return self->_hasSentPacket;
}

- (void)setHasSentPacket:(BOOL)a3
{
  self->_hasSentPacket = a3;
}

- (void).cxx_destruct
{
}

@end