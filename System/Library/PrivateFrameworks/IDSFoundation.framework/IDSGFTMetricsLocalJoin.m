@interface IDSGFTMetricsLocalJoin
- (BOOL)didJoin;
- (void)allocbindResponseForProtocolStack:(id)a3;
- (void)allocbindResponseFromInterface:(id)a3;
- (void)avcReceiveMKMTime:(double)a3 forMKI:(id)a4 isGeneratedLocally:(BOOL)a5;
- (void)clientChannelConnected;
- (void)connectQRServer;
- (void)didConnectUnderlyingE2ELink;
- (void)didConnectUnderlyingRelayLink;
- (void)didCreateMKM:(id)a3;
- (void)didSendJoin;
- (void)firstIncomingPacketTime:(double)a3 forMKI:(id)a4;
- (void)firstOutgoingPacketTime:(double)a3 forMKI:(id)a4;
- (void)globalLinkStart;
- (void)hasConvergence;
- (void)hasGoaway;
- (void)hasRealloc;
- (void)hasSentCompoundPacket;
- (void)join;
- (void)linkConnectedUsingFakeTLS;
- (void)linkConnectedUsingHTTP2;
- (void)linkConnectedUsingQUIC;
- (void)linkConnectedUsingTCPSTUN;
- (void)linkConnectedWithH2FallbackEnabled:(BOOL)a3;
- (void)participantIdChanged;
- (void)participantIdUnknown;
- (void)quicAllocbindRequest;
- (void)quicAllocbindResponse;
- (void)selectedLocalInterface:(id)a3;
- (void)sendAllocationRequest;
- (void)sendMKMToAVC:(id)a3 isGeneratedLocally:(BOOL)a4;
- (void)serverShortMKICacheMiss;
- (void)setDidJoin:(BOOL)a3;
- (void)stunAllocbindRequest;
- (void)stunAllocbindResponse;
- (void)tcpAllocbindRequest;
- (void)tcpAllocbindResponse;
- (void)useGecko;
- (void)willSendAllocbindRequestThroughInterface:(id)a3;
- (void)willSendJoin;
@end

@implementation IDSGFTMetricsLocalJoin

- (void)willSendJoin
{
  objc_msgSend_event_(self, a2, @"wsj", v2);
}

- (void)didSendJoin
{
  objc_msgSend_event_(self, a2, @"dsj", v2);
}

- (void)join
{
  objc_msgSend_event_(self, a2, @"lj", v2);
  self->_didJoin = 1;
}

- (void)sendAllocationRequest
{
  objc_msgSend_event_(self, a2, @"alloc", v2);
}

- (void)connectQRServer
{
  objc_msgSend_event_(self, a2, @"cqr", v2);
}

- (void)participantIdChanged
{
  objc_msgSend_event_(self, a2, @"pid-new", v2);
}

- (void)participantIdUnknown
{
  objc_msgSend_event_(self, a2, @"pid-unknown", v2);
}

- (void)serverShortMKICacheMiss
{
  objc_msgSend_event_(self, a2, @"server-shortmki-cache-miss", v2);
}

- (void)selectedLocalInterface:(id)a3
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"slif-%@", v3, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);
}

- (void)globalLinkStart
{
  objc_msgSend_event_(self, a2, @"gls", v2);
}

- (void)useGecko
{
  objc_msgSend_event_(self, a2, @"gecko", v2);
}

- (void)willSendAllocbindRequestThroughInterface:(id)a3
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"will-abreq-lif-%@", v3, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);
}

- (void)stunAllocbindRequest
{
  objc_msgSend_event_(self, a2, @"abreq-stun", v2);
}

- (void)stunAllocbindResponse
{
  objc_msgSend_event_(self, a2, @"abrsp-stun", v2);
}

- (void)tcpAllocbindRequest
{
  objc_msgSend_event_(self, a2, @"abreq-tcp", v2);
}

- (void)tcpAllocbindResponse
{
  objc_msgSend_event_(self, a2, @"abrsp-tcp", v2);
}

- (void)quicAllocbindRequest
{
  objc_msgSend_event_(self, a2, @"abreq-quic", v2);
}

- (void)quicAllocbindResponse
{
  objc_msgSend_event_(self, a2, @"abrsp-quic", v2);
}

- (void)allocbindResponseFromInterface:(id)a3
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"abrsp-lif-%@", v3, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);
}

- (void)allocbindResponseForProtocolStack:(id)a3
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"abrsp-%@", v3, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);
}

- (void)clientChannelConnected
{
  objc_msgSend_event_(self, a2, @"cc", v2);
}

- (void)didConnectUnderlyingRelayLink
{
  objc_msgSend_event_(self, a2, @"cl-relay", v2);
}

- (void)didConnectUnderlyingE2ELink
{
  objc_msgSend_event_(self, a2, @"cl-e2e", v2);
}

- (void)linkConnectedUsingQUIC
{
  objc_msgSend_event_(self, a2, @"cl-quic", v2);
}

- (void)linkConnectedUsingHTTP2
{
  objc_msgSend_event_(self, a2, @"cl-h2", v2);
}

- (void)linkConnectedUsingTCPSTUN
{
  objc_msgSend_event_(self, a2, @"cl-tcp", v2);
}

- (void)linkConnectedUsingFakeTLS
{
  objc_msgSend_event_(self, a2, @"cl-tls", v2);
}

- (void)linkConnectedWithH2FallbackEnabled:(BOOL)a3
{
  if (a3) {
    objc_msgSend_event_(self, a2, @"cl-h2e", v3);
  }
  else {
    objc_msgSend_event_(self, a2, @"cl-h2ne", v3);
  }
}

- (void)didCreateMKM:(id)a3
{
  objc_msgSend_event_(self, a2, @"mkm-c", v3);
}

- (void)sendMKMToAVC:(id)a3 isGeneratedLocally:(BOOL)a4
{
  if (a4) {
    objc_msgSend_event_(self, a2, @"lmkm-avc", v4);
  }
  else {
    objc_msgSend_event_(self, a2, @"rmkm-avc", v4);
  }
}

- (void)firstIncomingPacketTime:(double)a3 forMKI:(id)a4
{
}

- (void)firstOutgoingPacketTime:(double)a3 forMKI:(id)a4
{
}

- (void)avcReceiveMKMTime:(double)a3 forMKI:(id)a4 isGeneratedLocally:(BOOL)a5
{
  if (a5) {
    v5 = @"lmkm-avc-rcv";
  }
  else {
    v5 = @"rmkm-avc-rcv";
  }
  MEMORY[0x1F4181798](self, sel_event_time_, v5, a3);
}

- (void)hasSentCompoundPacket
{
  objc_msgSend_event_(self, a2, @"compound-ul", v2);
}

- (void)hasConvergence
{
  objc_msgSend_event_(self, a2, @"convergence", v2);
}

- (void)hasRealloc
{
  objc_msgSend_event_(self, a2, @"realloc", v2);
}

- (void)hasGoaway
{
  objc_msgSend_event_(self, a2, @"goaway", v2);
}

- (BOOL)didJoin
{
  return self->_didJoin;
}

- (void)setDidJoin:(BOOL)a3
{
  self->_didJoin = a3;
}

@end