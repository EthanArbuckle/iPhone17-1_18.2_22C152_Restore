@interface NWLinkConnection
- (BOOL)hasDisconnected;
- (BOOL)hasFailed;
- (BOOL)hasQUICStarted;
- (BOOL)hasRequiredInterface;
- (BOOL)ignoreCancel;
- (BOOL)isConnected;
- (BOOL)isH2Connection;
- (BOOL)isQUICPod;
- (BOOL)peelOffNewConnection;
- (BOOL)shouldTreatNextTryAsFirstTry;
- (BOOL)supportsNAT64;
- (IDSCapsuleParser)capsuleParser;
- (NSMutableSet)children;
- (NSString)name;
- (NSString)protocolStackDescription;
- (NSString)sessionID;
- (NWLinkConnection)initWithBaseNWLinkConnection:(id)a3 type:(unint64_t)a4;
- (NWLinkConnection)initWithType:(unint64_t)a3 interfaceIndex:(unsigned int)a4 localEndpoint:(id)a5 remoteEndpoint:(id)a6;
- (NWLinkConnection)initWithType:(unint64_t)a3 interfaceIndex:(unsigned int)a4 localEndpoint:(id)a5 remoteEndpoint:(id)a6 isH2Connection:(BOOL)a7;
- (NWLinkConnection)parent;
- (OS_nw_connection)connection;
- (OS_nw_content_context)contentContext;
- (OS_nw_endpoint)cachedH2LocalEndpoint;
- (OS_nw_endpoint)localEndpoint;
- (OS_nw_endpoint)remoteEndpoint;
- (OS_nw_parameters)quicPodParamaters;
- (double)scheduledDisconnectTime;
- (unint64_t)connectionID;
- (unint64_t)disconnectionState;
- (unint64_t)state;
- (unint64_t)transactionID;
- (unint64_t)type;
- (unsigned)channelNumber;
- (unsigned)interfaceIndex;
- (unsigned)localQUICConnectionID;
- (unsigned)messageType;
- (void)setCapsuleParser:(id)a3;
- (void)setChannelNumber:(unsigned __int16)a3;
- (void)setChildren:(id)a3;
- (void)setConnection:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setDisconnectionState:(unint64_t)a3;
- (void)setHasQUICStarted:(BOOL)a3;
- (void)setHasRequiredInterface:(BOOL)a3;
- (void)setIgnoreCancel:(BOOL)a3;
- (void)setIsH2Connection:(BOOL)a3;
- (void)setIsQUICPod:(BOOL)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setLocalQUICConnectionID:(unsigned int)a3;
- (void)setMessageType:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setParent:(id)a3;
- (void)setPeelOffNewConnection:(BOOL)a3;
- (void)setProtocolStackDescription:(id)a3;
- (void)setQuicPodParamaters:(id)a3;
- (void)setScheduledDisconnectTime:(double)a3;
- (void)setSessionID:(id)a3;
- (void)setShouldTreatNextTryAsFirstTry:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setSupportsNAT64:(BOOL)a3;
- (void)setTransactionID:(unint64_t)a3;
@end

@implementation NWLinkConnection

- (NWLinkConnection)initWithType:(unint64_t)a3 interfaceIndex:(unsigned int)a4 localEndpoint:(id)a5 remoteEndpoint:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NWLinkConnection;
  v13 = [(NWLinkConnection *)&v18 init];
  v14 = v13;
  if (v13)
  {
    if (!v13->_children)
    {
      v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      children = v14->_children;
      v14->_children = v15;
    }
    v14->_type = a3;
    v14->_interfaceIndex = a4;
    objc_storeStrong((id *)&v14->_localEndpoint, a5);
    objc_storeStrong((id *)&v14->_remoteEndpoint, a6);
    v14->_state = 0;
  }

  return v14;
}

- (NWLinkConnection)initWithType:(unint64_t)a3 interfaceIndex:(unsigned int)a4 localEndpoint:(id)a5 remoteEndpoint:(id)a6 isH2Connection:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)NWLinkConnection;
  v15 = [(NWLinkConnection *)&v21 init];
  v16 = v15;
  if (v15)
  {
    if (!v15->_children)
    {
      v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      children = v16->_children;
      v16->_children = v17;
    }
    v16->_type = a3;
    v16->_interfaceIndex = a4;
    uint64_t v19 = 80;
    if (v7) {
      uint64_t v19 = 88;
    }
    objc_storeStrong((id *)((char *)&v16->super.isa + v19), a5);
    objc_storeStrong((id *)&v16->_remoteEndpoint, a6);
    v16->_isH2Connection = v7;
    v16->_state = 0;
  }

  return v16;
}

- (NWLinkConnection)initWithBaseNWLinkConnection:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)NWLinkConnection;
  BOOL v7 = [(NWLinkConnection *)&v39 init];
  id v11 = v7;
  if (v7)
  {
    if (!v7->_children)
    {
      id v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      children = v11->_children;
      v11->_children = v12;
    }
    v11->_type = a4;
    v11->_interfaceIndex = objc_msgSend_interfaceIndex(v6, v8, v9, v10);
    uint64_t v17 = objc_msgSend_localEndpoint(v6, v14, v15, v16);
    localEndpoint = v11->_localEndpoint;
    v11->_localEndpoint = (OS_nw_endpoint *)v17;

    uint64_t v22 = objc_msgSend_remoteEndpoint(v6, v19, v20, v21);
    remoteEndpoint = v11->_remoteEndpoint;
    v11->_remoteEndpoint = (OS_nw_endpoint *)v22;

    v11->_supportsNAT64 = objc_msgSend_supportsNAT64(v6, v24, v25, v26);
    uint64_t v30 = objc_msgSend_sessionID(v6, v27, v28, v29);
    sessionID = v11->_sessionID;
    v11->_sessionID = (NSString *)v30;

    v11->_isH2Connection = objc_msgSend_isH2Connection(v6, v32, v33, v34);
    v11->_hasRequiredInterface = objc_msgSend_hasRequiredInterface(v6, v35, v36, v37);
    v11->_state = 0;
  }

  return v11;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
  id v5 = a3;
  unint64_t id = nw_connection_get_id();

  self->_connectionID = id;
}

- (BOOL)isConnected
{
  return self->_state == 1;
}

- (BOOL)hasDisconnected
{
  return self->_state - 3 < 2;
}

- (BOOL)hasFailed
{
  return self->_state == 4;
}

- (NWLinkConnection)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (NWLinkConnection *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSMutableSet)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isH2Connection
{
  return self->_isH2Connection;
}

- (void)setIsH2Connection:(BOOL)a3
{
  self->_isH2Connection = a3;
}

- (unint64_t)connectionID
{
  return self->_connectionID;
}

- (BOOL)hasRequiredInterface
{
  return self->_hasRequiredInterface;
}

- (void)setHasRequiredInterface:(BOOL)a3
{
  self->_hasRequiredInterface = a3;
}

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (OS_nw_endpoint)cachedH2LocalEndpoint
{
  return self->_cachedH2LocalEndpoint;
}

- (OS_nw_endpoint)remoteEndpoint
{
  return self->_remoteEndpoint;
}

- (BOOL)supportsNAT64
{
  return self->_supportsNAT64;
}

- (void)setSupportsNAT64:(BOOL)a3
{
  self->_supportsNAT64 = a3;
}

- (BOOL)peelOffNewConnection
{
  return self->_peelOffNewConnection;
}

- (void)setPeelOffNewConnection:(BOOL)a3
{
  self->_peelOffNewConnection = a3;
}

- (unint64_t)disconnectionState
{
  return self->_disconnectionState;
}

- (void)setDisconnectionState:(unint64_t)a3
{
  self->_disconnectionState = a3;
}

- (BOOL)ignoreCancel
{
  return self->_ignoreCancel;
}

- (void)setIgnoreCancel:(BOOL)a3
{
  self->_ignoreCancel = a3;
}

- (double)scheduledDisconnectTime
{
  return self->_scheduledDisconnectTime;
}

- (void)setScheduledDisconnectTime:(double)a3
{
  self->_scheduledDisconnectTime = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unint64_t)a3
{
  self->_transactionID = a3;
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unsigned int)a3
{
  self->_messageType = a3;
}

- (IDSCapsuleParser)capsuleParser
{
  return self->_capsuleParser;
}

- (void)setCapsuleParser:(id)a3
{
}

- (BOOL)hasQUICStarted
{
  return self->_hasQUICStarted;
}

- (void)setHasQUICStarted:(BOOL)a3
{
  self->_hasQUICStarted = a3;
}

- (unsigned)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unsigned __int16)a3
{
  self->_channelNumber = a3;
}

- (BOOL)isQUICPod
{
  return self->_isQUICPod;
}

- (void)setIsQUICPod:(BOOL)a3
{
  self->_isQUICPod = a3;
}

- (unsigned)localQUICConnectionID
{
  return self->_localQUICConnectionID;
}

- (void)setLocalQUICConnectionID:(unsigned int)a3
{
  self->_localQUICConnectionID = a3;
}

- (OS_nw_parameters)quicPodParamaters
{
  return self->_quicPodParamaters;
}

- (void)setQuicPodParamaters:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)protocolStackDescription
{
  return self->_protocolStackDescription;
}

- (void)setProtocolStackDescription:(id)a3
{
}

- (OS_nw_content_context)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (BOOL)shouldTreatNextTryAsFirstTry
{
  return self->_shouldTreatNextTryAsFirstTry;
}

- (void)setShouldTreatNextTryAsFirstTry:(BOOL)a3
{
  self->_shouldTreatNextTryAsFirstTry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_protocolStackDescription, 0);
  objc_storeStrong((id *)&self->_quicPodParamaters, 0);
  objc_storeStrong((id *)&self->_capsuleParser, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_cachedH2LocalEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end