@interface _IDSDataChannelLinkContext
- (id)description;
@end

@implementation _IDSDataChannelLinkContext

- (id)description
{
  uint64_t linkID = self->_linkID;
  v24 = NSString;
  v3 = [(NSUUID *)self->_linkUUID UUIDString];
  v4 = [(NSUUID *)self->_QRSessionID UUIDString];
  unint64_t v5 = self->_connectionType - 1;
  if (v5 > 4) {
    v6 = "---";
  }
  else {
    v6 = off_1E572D2F8[v5];
  }
  v22 = v6;
  uint64_t networkType = self->_networkType;
  uint64_t maxMTU = self->_maxMTU;
  uint64_t estimatedPerPacketConstantOverhead = self->_estimatedPerPacketConstantOverhead;
  uint64_t RATType = self->_RATType;
  uint64_t maxBitrate = self->_maxBitrate;
  uint64_t remoteNetworkType = self->_remoteNetworkType;
  unint64_t v11 = self->_remoteConnectionType - 1;
  if (v11 > 4) {
    v12 = "---";
  }
  else {
    v12 = off_1E572D2F8[v11];
  }
  remoteuint64_t RATType = self->_remoteRATType;
  int64_t relayServerProvider = self->_relayServerProvider;
  NSUInteger v15 = [(NSData *)self->_relaySessionToken length];
  v16 = @"YES";
  if (self->_serverIsDegraded) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  if (!self->_isVirtualRelayLink) {
    v16 = @"NO";
  }
  objc_msgSend(v24, "stringWithFormat:", @"<LinkContext %p> linkID %d (UUID:%@, QRSessionID:%@) networkType %u connectionType %s maxMTU %u estimatedConstantOverhead %u RATType %lu maxBitrate %u (remote networkType %u connectionType %s RATType %lu), relay(provider:%d, token:%dB) serverIsDegraded: %@ localLinkFlags 0x%x remoteLinkFlags 0x%x, localDataSoMask: %u, remoteDataSoMask: %u, virtualRelayLink: %@, delegatedLinkID %d, localInterfaceName: %@, relayProtocolStack: %@ connections: %@, qrExperiments: %@", self, linkID, v3, v4, networkType, v22, maxMTU, estimatedPerPacketConstantOverhead, RATType, maxBitrate, remoteNetworkType, v12, remoteRATType, relayServerProvider, v15, v17,
    self->_localLinkFlags,
    self->_remoteLinkFlags,
    self->_localDataSoMask,
    self->_remoteDataSoMask,
    v16,
    self->_delegatedLinkID,
    self->_localInterfaceName,
    self->_relayProtocolStackDescription,
    self->_connections,
  v18 = self->_qrExperiments);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hbhDecryptionkey, 0);
  objc_storeStrong((id *)&self->_hbhEncryptionkey, 0);
  objc_storeStrong((id *)&self->_qrExperiments, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_relayProtocolStackDescription, 0);
  objc_storeStrong((id *)&self->_localInterfaceName, 0);
  objc_storeStrong((id *)&self->_relaySessionKey, 0);
  objc_storeStrong((id *)&self->_relaySessionToken, 0);
  objc_storeStrong((id *)&self->_QRSessionID, 0);

  objc_storeStrong((id *)&self->_linkUUID, 0);
}

@end