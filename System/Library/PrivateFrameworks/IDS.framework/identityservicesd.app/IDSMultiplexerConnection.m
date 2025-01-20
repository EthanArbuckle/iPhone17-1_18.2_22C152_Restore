@interface IDSMultiplexerConnection
+ (id)multiplexerInstance;
- (BOOL)connectToListener;
- (BOOL)invalidated;
- (BOOL)isQUIC;
- (BOOL)isTCP;
- (BOOL)tryConsumePacketBuffer:(id *)a3;
- (IDSGroupSessionConnectionParameters)multiplexerParams;
- (IDSMultiplexerConnection)init;
- (IDSMultiplexerTransport)transport;
- (NSNumber)localTCPSYN;
- (NSNumber)remoteTCPSYN;
- (NSString)description;
- (NSUUID)clientUUID;
- (NSUUID)nexusInstanceUUID;
- (NSUUID)processUUID;
- (OS_nw_connection)connection;
- (OS_nw_endpoint)localEndpoint;
- (OS_nw_endpoint)remoteEndpoint;
- (OS_nw_parameters)parameters;
- (OS_nw_path)path;
- (channel)osChannel;
- (channel_ring_desc)txRing;
- (id)readHandler;
- (int)pid;
- (unint64_t)context;
- (unsigned)localPort;
- (unsigned)portsSignature;
- (unsigned)remotePort;
- (void)invalidate;
- (void)setClientUUID:(id)a3;
- (void)setConnectToListener:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setIsQUIC:(BOOL)a3;
- (void)setIsTCP:(BOOL)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setLocalPort:(unsigned __int16)a3;
- (void)setLocalTCPSYN:(id)a3;
- (void)setMultiplexerParams:(id)a3;
- (void)setNexusInstanceUUID:(id)a3;
- (void)setOsChannel:(channel *)a3;
- (void)setPacketBufferReadHandler:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPath:(id)a3;
- (void)setPid:(int)a3;
- (void)setPortsSignature:(unsigned int)a3;
- (void)setProcessUUID:(id)a3;
- (void)setRemoteEndpoint:(id)a3;
- (void)setRemotePort:(unsigned __int16)a3;
- (void)setRemoteTCPSYN:(id)a3;
- (void)setTransport:(id)a3;
- (void)setTxRing:(channel_ring_desc *)a3;
- (void)startReadOnTransportThread;
- (void)writePacketBuffer:(id *)a3;
@end

@implementation IDSMultiplexerConnection

+ (id)multiplexerInstance
{
  return 0;
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v4 = [(IDSMultiplexerConnection *)self localPort];
  unsigned int v5 = [(IDSMultiplexerConnection *)self remotePort];
  v6 = [(IDSMultiplexerConnection *)self localEndpoint];
  v7 = [(IDSMultiplexerConnection *)self remoteEndpoint];
  v8 = +[NSString stringWithFormat:@"%p MUXConnection localID %u remoteID %u localEndpoint %@ remoteEndpoint %@", self, v4, v5, v6, v7];

  os_unfair_lock_unlock(p_lock);

  return (NSString *)v8;
}

- (IDSMultiplexerConnection)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSMultiplexerConnection;
  result = [(IDSMultiplexerConnection *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated || (self->_invalidated = 1, !self->_osChannel))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_channel_get_fd();
    os_unfair_lock_unlock(p_lock);
    IDSTransportThreadAddBlock();
  }
}

- (void)writePacketBuffer:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return;
    }
    int v13 = 138412290;
    v14 = self;
    v7 = "writePacketBuffer called but invalidated - %@";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, 0xCu);
    goto LABEL_5;
  }
  if (!self->_osChannel)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v13 = 138412290;
    v14 = self;
    v7 = "writePacketBuffer called but os_channel is nil - %@";
    goto LABEL_4;
  }
  if ([(IDSMultiplexerConnection *)self isQUIC])
  {
    int64_t var2 = a3->var2;
    if (var2 <= 7)
    {
      os_unfair_lock_unlock(p_lock);
      v9 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v10 = a3->var2;
        int v13 = 134217984;
        v14 = (IDSMultiplexerConnection *)v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "connection is udp but packet does not have enough bytes for header %ld", (uint8_t *)&v13, 0xCu);
      }

      return;
    }
    udp6checksum(0, 0, (int8x16_t *)a3->var0, var2);
  }
  os_unfair_lock_unlock(p_lock);
  osChannel = self->_osChannel;
  txRing = self->_txRing;

  sub_100223FFC((uint64_t)osChannel, (uint64_t)txRing, (uint64_t)a3, (uint64_t)self->_flowIDBytes);
}

- (void)setPacketBufferReadHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
    unsigned int v5 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setPacketBufferReadHandler called but invalidated - %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v6 = objc_retainBlock(v4);
    id readHandler = self->_readHandler;
    self->_id readHandler = v6;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)startReadOnTransportThread
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    id v4 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return;
    }
    *(_DWORD *)buf = 138412290;
    int64_t v10 = self;
    unsigned int v5 = "startReadOnTransportThread called but invalidated - %@";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
    goto LABEL_5;
  }
  if (!self->_osChannel)
  {
    os_unfair_lock_unlock(p_lock);
    id v4 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    int64_t v10 = self;
    unsigned int v5 = "startReadOnTransportThread called but os_channel is nil - %@";
    goto LABEL_4;
  }
  os_channel_get_fd();
  os_channel_ring_id();
  os_channel_rx_ring();
  os_channel_ring_id();
  self->_txRing = (channel_ring_desc *)os_channel_tx_ring();
  id v6 = [(IDSMultiplexerConnection *)self clientUUID];
  [v6 getUUIDBytes:self->_flowIDBytes];

  v7 = [(IDSMultiplexerConnection *)self transport];
  LODWORD(v6) = [v7 packetizationHeadroom];

  if (!v6)
  {
    int v8 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100723FCC(v8);
    }
  }
  os_unfair_lock_unlock(p_lock);
  IDSTransportThreadAddBlock();
}

- (BOOL)tryConsumePacketBuffer:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    id v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return 0;
    }
    int v18 = 138412290;
    *(void *)v19 = self;
    v7 = "writePacketBuffer called but invalidated - %@";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v18, 0xCu);
    goto LABEL_5;
  }
  if (!self->_osChannel)
  {
    os_unfair_lock_unlock(p_lock);
    id v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v18 = 138412290;
    *(void *)v19 = self;
    v7 = "writePacketBuffer called but os_channel is nil - %@";
    goto LABEL_4;
  }
  if (a3->var2 > 3)
  {
    unsigned int v11 = __rev16(*(unsigned __int16 *)a3->var0);
    unsigned int v12 = __rev16(*((unsigned __int16 *)a3->var0 + 1));
    int v13 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int localPort = self->_localPort;
      int remotePort = self->_remotePort;
      int64_t var2 = a3->var2;
      int v18 = 67110144;
      *(_DWORD *)v19 = localPort;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = remotePort;
      __int16 v20 = 1024;
      unsigned int v21 = v12;
      __int16 v22 = 1024;
      unsigned int v23 = v11;
      __int16 v24 = 2048;
      int64_t v25 = var2;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "connection local:%u remote:%u tryConsume packet dst:%u src:%u packetBufferLength:%ld", (uint8_t *)&v18, 0x24u);
    }

    if (self->_localPort == v12)
    {
      int v17 = self->_remotePort;
      os_unfair_lock_unlock(p_lock);
      if (!v17 || v17 == v11)
      {
        [(IDSMultiplexerConnection *)self writePacketBuffer:a3];
        return 1;
      }
    }
    else
    {
      os_unfair_lock_unlock(p_lock);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v9 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v10 = a3->var2;
      int v18 = 134217984;
      *(void *)v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cannot retrieve port signature, invalid packetBuffer size: %ld", (uint8_t *)&v18, 0xCu);
    }
  }
  return 0;
}

- (unsigned)localPort
{
  return self->_localPort;
}

- (void)setLocalPort:(unsigned __int16)a3
{
  self->_int localPort = a3;
}

- (unsigned)remotePort
{
  return self->_remotePort;
}

- (void)setRemotePort:(unsigned __int16)a3
{
  self->_int remotePort = a3;
}

- (IDSMultiplexerTransport)transport
{
  return self->transport;
}

- (void)setTransport:(id)a3
{
}

- (unsigned)portsSignature
{
  return self->portsSignature;
}

- (void)setPortsSignature:(unsigned int)a3
{
  self->portsSignature = a3;
}

- (IDSGroupSessionConnectionParameters)multiplexerParams
{
  return self->multiplexerParams;
}

- (void)setMultiplexerParams:(id)a3
{
}

- (unint64_t)context
{
  return self->context;
}

- (void)setContext:(unint64_t)a3
{
  self->context = a3;
}

- (BOOL)connectToListener
{
  return self->connectToListener;
}

- (void)setConnectToListener:(BOOL)a3
{
  self->connectToListener = a3;
}

- (NSNumber)localTCPSYN
{
  return self->localTCPSYN;
}

- (void)setLocalTCPSYN:(id)a3
{
}

- (NSNumber)remoteTCPSYN
{
  return self->remoteTCPSYN;
}

- (void)setRemoteTCPSYN:(id)a3
{
}

- (BOOL)isTCP
{
  return self->isTCP;
}

- (void)setIsTCP:(BOOL)a3
{
  self->isTCP = a3;
}

- (BOOL)isQUIC
{
  return self->isQUIC;
}

- (void)setIsQUIC:(BOOL)a3
{
  self->isQUIC = a3;
}

- (id)readHandler
{
  return self->_readHandler;
}

- (NSUUID)nexusInstanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNexusInstanceUUID:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSUUID)clientUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setClientUUID:(id)a3
{
}

- (OS_nw_path)path
{
  return (OS_nw_path *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPath:(id)a3
{
}

- (OS_nw_parameters)parameters
{
  return (OS_nw_parameters *)objc_getProperty(self, a2, 144, 1);
}

- (void)setParameters:(id)a3
{
}

- (OS_nw_endpoint)localEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLocalEndpoint:(id)a3
{
}

- (OS_nw_endpoint)remoteEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRemoteEndpoint:(id)a3
{
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 168, 1);
}

- (void)setConnection:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSUUID)processUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 176, 1);
}

- (void)setProcessUUID:(id)a3
{
}

- (channel)osChannel
{
  return self->_osChannel;
}

- (void)setOsChannel:(channel *)a3
{
  self->_osChannel = a3;
}

- (channel_ring_desc)txRing
{
  return self->_txRing;
}

- (void)setTxRing:(channel_ring_desc *)a3
{
  self->_txRing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processUUID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
  objc_storeStrong((id *)&self->_nexusInstanceUUID, 0);
  objc_storeStrong((id *)&self->remoteTCPSYN, 0);
  objc_storeStrong((id *)&self->localTCPSYN, 0);
  objc_storeStrong((id *)&self->multiplexerParams, 0);
  objc_storeStrong((id *)&self->transport, 0);

  objc_storeStrong(&self->_readHandler, 0);
}

@end