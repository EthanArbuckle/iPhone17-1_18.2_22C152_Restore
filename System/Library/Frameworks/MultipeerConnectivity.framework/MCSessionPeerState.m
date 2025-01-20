@interface MCSessionPeerState
- (BOOL)connectPeerCalled;
- (MCPeerID)peerID;
- (MCSessionPeerState)initWithPeer:(id)a3;
- (NSData)nearbyConnectionData;
- (NSMutableDictionary)incomingStreams;
- (NSMutableDictionary)outgoingStreamRequests;
- (NSMutableDictionary)outgoingStreams;
- (id)description;
- (int64_t)certificateDecision;
- (int64_t)state;
- (unsigned)newStreamID;
- (unsigned)newStreamOpenRequestID;
- (void)dealloc;
- (void)setCertificateDecision:(int64_t)a3;
- (void)setConnectPeerCalled:(BOOL)a3;
- (void)setIncomingStreams:(id)a3;
- (void)setNearbyConnectionData:(id)a3;
- (void)setOutgoingStreamRequests:(id)a3;
- (void)setOutgoingStreams:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation MCSessionPeerState

- (MCSessionPeerState)initWithPeer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCSessionPeerState;
  v4 = [(MCSessionPeerState *)&v6 init];
  if (v4)
  {
    v4->_peerID = (MCPeerID *)[a3 copy];
    v4->_state = 0;
    v4->_certificateDecision = 0;
    v4->_incomingStreams = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4->_outgoingStreams = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4->_outgoingStreamRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MCSessionPeerState;
  [(MCSessionPeerState *)&v3 dealloc];
}

- (unsigned)newStreamID
{
  objc_sync_enter(self);
  unsigned int newStreamID = self->_newStreamID;
  self->_unsigned int newStreamID = newStreamID + 1;
  unsigned int v4 = newStreamID & 0x7FFFFFFF;
  objc_sync_exit(self);
  return v4;
}

- (unsigned)newStreamOpenRequestID
{
  objc_sync_enter(self);
  unsigned int newStreamOpenRequestID = self->_newStreamOpenRequestID;
  self->_unsigned int newStreamOpenRequestID = newStreamOpenRequestID + 1;
  unsigned int v4 = newStreamOpenRequestID & 0x7FFFFFFF;
  objc_sync_exit(self);
  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = [(MCPeerID *)[(MCSessionPeerState *)self peerID] displayNameAndPID];
  id v5 = +[MCSession stringForSessionState:[(MCSessionPeerState *)self state]];
  unint64_t v6 = [(MCSessionPeerState *)self certificateDecision];
  if (v6 > 3) {
    v7 = @"?";
  }
  else {
    v7 = (__CFString *)*((void *)&off_264338200 + v6);
  }
  if ([(MCSessionPeerState *)self connectPeerCalled]) {
    v8 = "yes";
  }
  else {
    v8 = "no";
  }
  return (id)[v3 stringWithFormat:@"Peer:%@ State:%@ CertDecision:%@ ConnectPeerCalled:%s OstreamRequests:%d Ostreams:%d Istreams:%d.", v4, v5, v7, v8, -[NSMutableDictionary count](-[MCSessionPeerState outgoingStreamRequests](self, "outgoingStreamRequests"), "count"), -[NSMutableDictionary count](-[MCSessionPeerState outgoingStreams](self, "outgoingStreams"), "count"), -[NSMutableDictionary count](-[MCSessionPeerState incomingStreams](self, "incomingStreams"), "count")];
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableDictionary)outgoingStreamRequests
{
  return self->_outgoingStreamRequests;
}

- (void)setOutgoingStreamRequests:(id)a3
{
}

- (NSMutableDictionary)incomingStreams
{
  return self->_incomingStreams;
}

- (void)setIncomingStreams:(id)a3
{
}

- (NSMutableDictionary)outgoingStreams
{
  return self->_outgoingStreams;
}

- (void)setOutgoingStreams:(id)a3
{
}

- (NSData)nearbyConnectionData
{
  return self->_nearbyConnectionData;
}

- (void)setNearbyConnectionData:(id)a3
{
}

- (BOOL)connectPeerCalled
{
  return self->_connectPeerCalled;
}

- (void)setConnectPeerCalled:(BOOL)a3
{
  self->_connectPeerCalled = a3;
}

- (int64_t)certificateDecision
{
  return self->_certificateDecision;
}

- (void)setCertificateDecision:(int64_t)a3
{
  self->_certificateDecision = a3;
}

@end