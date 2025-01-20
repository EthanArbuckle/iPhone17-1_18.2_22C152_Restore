@interface IDSGenericConnection
- ($06B915653E2C05AC2325F9D1AF63EDA9)encryptionState;
- (BOOL)checksumFailed;
- (BOOL)didInvalidate;
- (BOOL)encryptionEnabled;
- (BOOL)hasMoreData;
- (BOOL)isCloudEnabled;
- (BOOL)isControlChannel;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isDirectMsgChannel;
- (BOOL)isRealTime;
- (BOOL)shouldSetAllowlistUUIDForStreamingSocket;
- (BOOL)shouldStopBTDatagramLink;
- (BOOL)suspended;
- (IDSConnectionContext)connectionContext;
- (IDSGenericConnection)initWithAddressPair:(id)a3 protocol:(int)a4;
- (IDSGenericConnection)initWithConnectionID:(id)a3 protocol:(int)a4 isCloudEnabled:(BOOL)a5;
- (IDSGenericConnection)initWithConnectionID:(id)a3 protocol:(int)a4 keyMaterialLength:(int)a5 isCloudEnabled:(BOOL)a6;
- (IDSGenericConnectionID)connectionID;
- (IDSHCInfo)compressionInfo;
- (IDSSockAddrWrapperPair)addressPair;
- (IDSStallDetector)outgoingStallDetector;
- (NSError)connectError;
- (NSString)clientID;
- (NSString)idsDeviceConnectionUUID;
- (NSString)localConnectionGUID;
- (NSString)outgoingStallDetectorName;
- (NSString)remoteConnectionGUID;
- (OS_dispatch_queue)completionQueue;
- (OS_nw_connection)serviceConnection;
- (OS_nw_endpoint)defaultPairedDeviceEndpoint;
- (OS_nw_service_connector)serviceConnector;
- (char)localKeyMaterial;
- (double)connectionInitTime;
- (double)connectionSetupStartTime;
- (double)creationTime;
- (double)firstDataPacketReceiveTime;
- (double)firstPacketReceiveTime;
- (double)lastSuccessfulSentTime;
- (id)description;
- (id)flagsString;
- (id)openSocketCompletionHandler;
- (id)readHandler;
- (int)keyMaterialLength;
- (int)protocol;
- (int)sd;
- (int)sdCopy;
- (int)sdNumberNoClose;
- (int)sdOriginal;
- (int)srtpProtocolVersion;
- (int)stateFlags;
- (int64_t)compressionState;
- (int64_t)priority;
- (int64_t)socketTrafficClass;
- (unint64_t)bytesReceived;
- (unint64_t)bytesSent;
- (unint64_t)packetsReceived;
- (unint64_t)packetsSent;
- (unsigned)SSRCRecv;
- (unsigned)SSRCSend;
- (unsigned)dataProtectionClass;
- (unsigned)expectedNextIncomingSequenceNumber;
- (unsigned)expectedNextOutgoingSequenceNumber;
- (unsigned)firstIncomingSYNSequenceNumber;
- (unsigned)seqRecvStart;
- (unsigned)seqSend;
- (unsigned)seqSendStart;
- (unsigned)uint32Key;
- (void)_closeSockets;
- (void)_createStallDetectorWithName:(id)a3;
- (void)_triggerStallDetectionLogsForDetector:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)reportToAWD:(unint64_t)a3 connectionType:(int)a4 error:(int)a5;
- (void)setAddressPair:(id)a3;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setBytesSent:(unint64_t)a3;
- (void)setChecksumFailed:(BOOL)a3;
- (void)setClientID:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setCompressionInfo:(id)a3;
- (void)setCompressionState:(int64_t)a3;
- (void)setConnectError:(id)a3;
- (void)setConnectionContext:(id)a3;
- (void)setConnectionID:(id)a3;
- (void)setConnectionInitTime:(double)a3;
- (void)setConnectionSetupStartTime:(double)a3;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setDefaultPairedDeviceEndpoint:(id)a3;
- (void)setDidInvalidate:(BOOL)a3;
- (void)setEncryptionEnabled:(BOOL)a3;
- (void)setExpectedNextIncomingSequenceNumber:(unsigned int)a3;
- (void)setExpectedNextOutgoingSequenceNumber:(unsigned int)a3;
- (void)setFirstDataPacketReceiveTime:(double)a3;
- (void)setFirstIncomingSYNSequenceNumber:(unsigned int)a3;
- (void)setFirstPacketReceiveTime:(double)a3;
- (void)setHasMoreData:(BOOL)a3;
- (void)setIdsDeviceConnectionUUID:(id)a3;
- (void)setIsCloudEnabled:(BOOL)a3;
- (void)setIsControlChannel:(BOOL)a3;
- (void)setIsDefaultPairedDevice:(BOOL)a3;
- (void)setIsDirectMsgChannel:(BOOL)a3;
- (void)setIsRealTime:(BOOL)a3;
- (void)setKeyMaterialLength:(int)a3;
- (void)setLastSuccessfulSentTime:(double)a3;
- (void)setLocalKeyMaterial:(char *)a3;
- (void)setOpenSocketCompletionHandler:(id)a3;
- (void)setOutgoingStallDetector:(id)a3;
- (void)setOutgoingStallDetectorName:(id)a3;
- (void)setPacketsReceived:(unint64_t)a3;
- (void)setPacketsSent:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setReadHandler:(id)a3;
- (void)setRemoteConnectionGUID:(id)a3;
- (void)setSSRCRecv:(unsigned int)a3;
- (void)setSSRCSend:(unsigned int)a3;
- (void)setSd:(int)a3;
- (void)setSdCopy:(int)a3;
- (void)setSdNumberNoClose:(int)a3;
- (void)setSdOriginal:(int)a3;
- (void)setSeqRecvStart:(unsigned __int16)a3;
- (void)setSeqSend:(unsigned __int16)a3;
- (void)setSeqSendStart:(unsigned __int16)a3;
- (void)setServiceConnection:(id)a3;
- (void)setServiceConnector:(id)a3;
- (void)setShouldSetAllowlistUUIDForStreamingSocket:(BOOL)a3;
- (void)setShouldStopBTDatagramLink:(BOOL)a3;
- (void)setSocketTrafficClass:(int64_t)a3;
- (void)setSrtpProtocolVersion:(int)a3;
- (void)setStateFlags:(int)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setUint32Key:(unsigned int)a3;
@end

@implementation IDSGenericConnection

- (IDSGenericConnection)initWithConnectionID:(id)a3 protocol:(int)a4 isCloudEnabled:(BOOL)a5
{
  id v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IDSGenericConnection;
  v9 = [(IDSGenericConnection *)&v23 init];
  if (v9)
  {
    uint64_t v10 = +[NSString stringGUID];
    v11 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v10;

    id v12 = [v8 copy];
    v13 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = v12;

    *((_DWORD *)v9 + 12) = a4;
    *(void *)(v9 + 52) = -1;
    *((_DWORD *)v9 + 15) = -1;
    if (qword_100A4C8A8 != -1) {
      dispatch_once(&qword_100A4C8A8, &stru_10098A438);
    }
    *((double *)v9 + 13) = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
    v14 = objc_alloc_init(IDSHCInfo);
    v15 = (void *)*((void *)v9 + 18);
    *((void *)v9 + 18) = v14;

    *((void *)v9 + 19) = 0;
    v9[180] = a5;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100A4C8B0);
    v16 = (void *)qword_100A4C820;
    v17 = [*((id *)v9 + 4) service];
    v18 = [v16 objectForKey:v17];

    if (v18)
    {
      *((void *)v9 + 604) = [v18 packetsSent];
      *((void *)v9 + 603) = [v18 packetsReceived];
      *((void *)v9 + 606) = [v18 bytesSent];
      *((void *)v9 + 605) = [v18 bytesReceived];
      v19 = (void *)qword_100A4C820;
      v20 = [*((id *)v9 + 4) service];
      [v19 removeObjectForKey:v20];

      if (![(id)qword_100A4C820 count])
      {
        v21 = (void *)qword_100A4C820;
        qword_100A4C820 = 0;
      }
    }
    if (qword_100A4C8A8 != -1) {
      dispatch_once(&qword_100A4C8A8, &stru_10098A438);
    }
    *((double *)v9 + 607) = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100A4C8B0);
    v9[4956] = 0;
  }
  return (IDSGenericConnection *)v9;
}

- (IDSGenericConnection)initWithConnectionID:(id)a3 protocol:(int)a4 keyMaterialLength:(int)a5 isCloudEnabled:(BOOL)a6
{
  id v10 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IDSGenericConnection;
  v11 = [(IDSGenericConnection *)&v28 init];
  id v12 = v11;
  if (v11)
  {
    *(void *)(v11 + 52) = -1;
    *((_DWORD *)v11 + 15) = -1;
    v13 = malloc_type_malloc(a5, 0xD5D5AB82uLL);
    *((void *)v12 + 599) = v13;
    *((_DWORD *)v12 + 1197) = a5;
    if (!v13)
    {
      v26 = 0;
      goto LABEL_14;
    }
    if (SecRandomCopyBytes(kSecRandomDefault, a5, v13)) {
      sub_10071FAFC();
    }
    uint64_t v14 = +[NSString stringGUID];
    v15 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v14;

    id v16 = [v10 copy];
    v17 = (void *)*((void *)v12 + 4);
    *((void *)v12 + 4) = v16;

    *((_DWORD *)v12 + 12) = a4;
    if (qword_100A4C8A8 != -1) {
      dispatch_once(&qword_100A4C8A8, &stru_10098A438);
    }
    *((double *)v12 + 13) = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
    v18 = objc_alloc_init(IDSHCInfo);
    v19 = (void *)*((void *)v12 + 18);
    *((void *)v12 + 18) = v18;

    *((void *)v12 + 19) = 0;
    *((unsigned char *)v12 + 180) = a6;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100A4C8B0);
    v20 = (void *)qword_100A4C820;
    v21 = [*((id *)v12 + 4) service];
    v22 = [v20 objectForKey:v21];

    if (v22)
    {
      *((void *)v12 + 604) = [v22 packetsSent];
      *((void *)v12 + 603) = [v22 packetsReceived];
      *((void *)v12 + 606) = [v22 bytesSent];
      *((void *)v12 + 605) = [v22 bytesReceived];
      objc_super v23 = (void *)qword_100A4C820;
      v24 = [*((id *)v12 + 4) service];
      [v23 removeObjectForKey:v24];

      if (![(id)qword_100A4C820 count])
      {
        v25 = (void *)qword_100A4C820;
        qword_100A4C820 = 0;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100A4C8B0);
    if (qword_100A4C8A8 != -1) {
      dispatch_once(&qword_100A4C8A8, &stru_10098A438);
    }
    *((double *)v12 + 607) = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
    *((unsigned char *)v12 + 4956) = 0;
  }
  v26 = (IDSGenericConnection *)v12;
LABEL_14:

  return v26;
}

- (id)description
{
  if (self->_protocol == 6)
  {
    unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v63 = v3;
    long long v64 = v3;
    long long v61 = v3;
    long long v62 = v3;
    long long v59 = v3;
    long long v60 = v3;
    long long v57 = v3;
    long long v58 = v3;
    long long v55 = v3;
    long long v56 = v3;
    long long v53 = v3;
    long long v54 = v3;
    long long v51 = v3;
    long long v52 = v3;
    long long v49 = v3;
    long long v50 = v3;
    long long v48 = v3;
    long long v46 = v3;
    long long v47 = v3;
    long long v44 = v3;
    long long v45 = v3;
    v42[2] = v3;
    long long v43 = v3;
    v42[0] = v3;
    v42[1] = v3;
    socklen_t v41 = 408;
    int sdCopy = self->_sdCopy;
    if (sdCopy == -1 && (int sdCopy = self->_sd, sdCopy == -1) || getsockopt(sdCopy, 6, 512, v42, &v41))
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = +[NSString stringWithFormat:@"TCP info (%u) tcpi_snd_nxt:%08x tcpi_rcv_nxt:%08x (connection: in:%08x out:%08x)", LOBYTE(v42[0]), DWORD1(v43), DWORD2(v43), self->_expectedNextIncomingSequenceNumber, self->_expectedNextOutgoingSequenceNumber];
    }
    objc_super v23 = (void *)v5;
  }
  else
  {
    objc_super v23 = 0;
  }
  connectionID = self->_connectionID;
  v39 = [(IDSSockAddrWrapperPair *)self->_addressPair shortDescription];
  long long v38 = *(_OWORD *)&self->_localConnectionGUID;
  int64_t compressionState = self->_compressionState;
  connectError = self->_connectError;
  uint64_t protocol = self->_protocol;
  clientID = self->_clientID;
  uint64_t sd = self->_sd;
  uint64_t v32 = self->_sdCopy;
  uint64_t sdOriginal = self->_sdOriginal;
  unsigned int v30 = [(IDSHCInfo *)self->_compressionInfo localCID];
  v29 = [(IDSHCInfo *)self->_compressionInfo localContext];
  unsigned int v28 = [(IDSHCInfo *)self->_compressionInfo remoteCID];
  v6 = [(IDSHCInfo *)self->_compressionInfo remoteContext];
  v7 = "opened ";
  int stateFlags = self->_stateFlags;
  if ((stateFlags & 1) == 0) {
    v7 = "";
  }
  v26 = v7;
  v27 = v6;
  v9 = "handler-called ";
  if ((stateFlags & 2) == 0) {
    v9 = "";
  }
  v25 = v9;
  id v10 = "control-sent ";
  if ((stateFlags & 4) == 0) {
    id v10 = "";
  }
  v24 = v10;
  if ((stateFlags & 8) != 0) {
    v11 = "control-received ";
  }
  else {
    v11 = "";
  }
  if ((stateFlags & 0x10) != 0) {
    id v12 = "reset-sent ";
  }
  else {
    id v12 = "";
  }
  if ((stateFlags & 0x20) != 0) {
    v13 = "reset-received ";
  }
  else {
    v13 = "";
  }
  if ((stateFlags & 0x40) != 0) {
    uint64_t v14 = "sent-pkt ";
  }
  else {
    uint64_t v14 = "";
  }
  if ((stateFlags & 0x80) != 0) {
    v15 = "received-pkt ";
  }
  else {
    v15 = "";
  }
  if ((stateFlags & 0x100) != 0) {
    id v16 = "received-data ";
  }
  else {
    id v16 = "";
  }
  if ((stateFlags & 0x200) != 0) {
    v17 = "canceled ";
  }
  else {
    v17 = "";
  }
  if (self->_encryptionEnabled) {
    v18 = "encryption-enabled ";
  }
  else {
    v18 = "";
  }
  double creationTime = self->_creationTime;
  id v20 = objc_retainBlock(self->_readHandler);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<IDSGenericConnection: id[%@] ports[%@] localGUID[%@] remoteGUID[%@] clientID[%@] proto[%d] sd[%d,%d,%d] error[%@] comp_state[%d] localContext[%d,%p] remoteContext[%d,%p](%s%s%s%s%s%s%s%s%s%s%s) (CT:%0.6lf) tcp[%@], readHandler: %p>", connectionID, v39, v38, clientID, protocol, sd, v32, sdOriginal, connectError, compressionState, v30, v29, v28, v27, v26, v25,
    v24,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    *(void *)&creationTime,
    v23,
  v21 = v20);

  return v21;
}

- ($06B915653E2C05AC2325F9D1AF63EDA9)encryptionState
{
  return ($06B915653E2C05AC2325F9D1AF63EDA9 *)&self->_encryptionState;
}

- (id)flagsString
{
  int stateFlags = self->_stateFlags;
  long long v3 = "opened ";
  if ((stateFlags & 1) == 0) {
    long long v3 = "";
  }
  v4 = "handler-called ";
  if ((stateFlags & 2) == 0) {
    v4 = "";
  }
  uint64_t v5 = "control-sent ";
  if ((stateFlags & 4) == 0) {
    uint64_t v5 = "";
  }
  v6 = "control-received ";
  if ((stateFlags & 8) == 0) {
    v6 = "";
  }
  v7 = "reset-sent ";
  if ((stateFlags & 0x10) == 0) {
    v7 = "";
  }
  if ((stateFlags & 0x20) != 0) {
    id v8 = "reset-received ";
  }
  else {
    id v8 = "";
  }
  return +[NSString stringWithFormat:@"( %s%s%s%s%s%s)", v3, v4, v5, v6, v7, v8];
}

- (IDSGenericConnection)initWithAddressPair:(id)a3 protocol:(int)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSGenericConnection;
  v7 = [(IDSGenericConnection *)&v15 init];
  if (v7)
  {
    uint64_t v8 = +[NSString stringGUID];
    v9 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v8;

    id v10 = [v6 copy];
    v11 = (void *)*((void *)v7 + 5);
    *((void *)v7 + 5) = v10;

    *((_DWORD *)v7 + 12) = a4;
    *(void *)(v7 + 52) = -1;
    *((_DWORD *)v7 + 15) = -1;
    if (qword_100A4C8A8 != -1) {
      dispatch_once(&qword_100A4C8A8, &stru_10098A438);
    }
    *((double *)v7 + 13) = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
    id v12 = objc_alloc_init(IDSHCInfo);
    v13 = (void *)*((void *)v7 + 18);
    *((void *)v7 + 18) = v12;

    *((void *)v7 + 19) = 0;
    *((_WORD *)v7 + 90) = 257;
    v7[4956] = 0;
  }

  return (IDSGenericConnection *)v7;
}

- (void)setCompletionQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  if (!v4) {
    sub_10071FB28();
  }
  completionQueue = self->_completionQueue;
  self->_completionQueue = v4;

  _objc_release_x1(v4, completionQueue);
}

- (OS_dispatch_queue)completionQueue
{
  completionQueue = self->_completionQueue;
  if (completionQueue)
  {
    long long v3 = completionQueue;
  }
  else
  {
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "problem: %@ is going to use the main queue.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    im_primary_queue();
    long long v3 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_closeSockets
{
  if (self->_serviceConnection)
  {
    long long v3 = [(IDSGenericConnection *)self connectionID];
    v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 serviceConnectorServiceForAccount];
    }
    else
    {
      uint64_t v5 = 0;
    }
    if (self->_serviceConnector && self->_defaultPairedDeviceEndpoint && v5)
    {
      [v5 UTF8String];
      id v13 = v4;
      nw_service_connector_cancel_active_connection();
    }
    else
    {
      id v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        serviceConnector = self->_serviceConnector;
        defaultPairedDeviceEndpoint = self->_defaultPairedDeviceEndpoint;
        *(_DWORD *)buf = 138413058;
        objc_super v15 = self;
        __int16 v16 = 2112;
        v17 = serviceConnector;
        __int16 v18 = 2112;
        v19 = defaultPairedDeviceEndpoint;
        __int16 v20 = 2112;
        v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ cannot cancel service connector for connection._serviceConnector=%@;_defaultPairedDeviceEndpoint=%@;service"
          "ConnectionServiceString=%@",
          buf,
          0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
    nw_connection_cancel((nw_connection_t)self->_serviceConnection);
    serviceConnection = self->_serviceConnection;
    self->_serviceConnection = 0;
  }
  int sd = self->_sd;
  if (sd != -1)
  {
    close(sd);
    self->_int sd = -1;
  }
  int sdCopy = self->_sdCopy;
  if (sdCopy != -1)
  {
    close(sdCopy);
    self->_int sdCopy = -1;
  }
  int sdOriginal = self->_sdOriginal;
  if (sdOriginal != -1)
  {
    close(sdOriginal);
    self->_int sdOriginal = -1;
  }
}

- (void)dealloc
{
  if (![(IDSGenericConnection *)self didInvalidate])
  {
    long long v3 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_10071FB40(v3);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSGenericConnection;
  [(IDSGenericConnection *)&v4 dealloc];
}

- (void)invalidate
{
  if (![(IDSGenericConnection *)self didInvalidate])
  {
    [(IDSGenericConnection *)self setDidInvalidate:1];
    long long v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating IDSGenericConnection %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v24 = self;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v24 = self;
          _IDSLogV();
        }
      }
    }
    if (self->_shouldStopBTDatagramLink)
    {
      objc_super v4 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [(IDSGenericConnectionID *)self->_connectionID service];
        *(_DWORD *)buf = 138412290;
        v29 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "genericConnection for %@ using BT datagram link - stop", buf, 0xCu);
      }
      IDSTransportThreadAddBlock();
    }
    if (self->_connectionID)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_100A4C8B0);
      id v6 = (void *)qword_100A4C820;
      if (!qword_100A4C820)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        uint64_t v8 = (void *)qword_100A4C820;
        qword_100A4C820 = (uint64_t)Mutable;

        id v6 = (void *)qword_100A4C820;
      }
      v9 = [(IDSGenericConnectionID *)self->_connectionID service];
      id v10 = [v6 objectForKey:v9];

      if (!v10)
      {
        id v10 = objc_alloc_init(IDSServiceStatistics);
        v11 = (void *)qword_100A4C820;
        id v12 = [(IDSGenericConnectionID *)self->_connectionID service];
        [v11 setObject:v10 forKey:v12];
      }
      [(IDSServiceStatistics *)v10 setPacketsSent:(char *)[(IDSServiceStatistics *)v10 packetsSent] + self->_packetsSent];
      [(IDSServiceStatistics *)v10 setPacketsReceived:(char *)[(IDSServiceStatistics *)v10 packetsReceived] + self->_packetsReceived];
      [(IDSServiceStatistics *)v10 setBytesSent:(char *)[(IDSServiceStatistics *)v10 bytesSent] + self->_bytesSent];
      [(IDSServiceStatistics *)v10 setBytesReceived:(char *)[(IDSServiceStatistics *)v10 bytesReceived] + self->_bytesReceived];
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100A4C8B0);
    }
    rsize_t keyMaterialLength = self->_keyMaterialLength;
    if (keyMaterialLength)
    {
      memset_s(self->_localKeyMaterial, keyMaterialLength, 0, self->_keyMaterialLength);
      free(self->_localKeyMaterial);
      sub_100221340((uint64_t)&self->_encryptionState);
      self->_localKeyMaterial = 0;
      self->_rsize_t keyMaterialLength = 0;
    }
    if (self->_openSocketCompletionHandler)
    {
      uint64_t v14 = [(IDSGenericConnection *)self description];
      objc_super v15 = +[NSString stringWithFormat:@"Cleanup: %@", v14];

      __int16 v16 = +[NSDictionary dictionaryWithObject:v15 forKey:NSLocalizedDescriptionKey];
      v17 = +[NSError errorWithDomain:@"IDSUTun" code:5101 userInfo:v16];

      id v18 = objc_retainBlock(self->_openSocketCompletionHandler);
      id openSocketCompletionHandler = self->_openSocketCompletionHandler;
      self->_id openSocketCompletionHandler = 0;

      __int16 v20 = [(IDSGenericConnection *)self completionQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100354208;
      block[3] = &unk_10097E818;
      id v26 = v17;
      id v27 = v18;
      id v21 = v17;
      id v22 = v18;
      dispatch_async(v20, block);
    }
    [(IDSGenericConnection *)self _closeSockets];
    [(IDSHCInfo *)self->_compressionInfo invalidate];
    completionQueue = self->_completionQueue;
    self->_completionQueue = 0;
  }
}

- (void)reportToAWD:(unint64_t)a3 connectionType:(int)a4 error:(int)a5
{
  if (!self->_sentAWDReport)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a4;
    v9 = +[IDSAWDLogging sharedInstance];
    if (v5)
    {
      id v10 = +[NSNumber numberWithInt:v6];
      v11 = +[NSNumber numberWithInt:v5];
      [v9 IDSGenericConnectionForLink:a3 connectionSetupStartTime:&off_1009D1DE8 firstPacketReceiveTime:&off_1009D1DE8 connectionType:v10 success:0 errorCode:v11];
    }
    else
    {
      id v10 = +[NSNumber numberWithDouble:self->_connectionSetupStartTime];
      v11 = +[NSNumber numberWithDouble:self->_firstPacketReceiveTime];
      id v12 = +[NSNumber numberWithInt:v6];
      [v9 IDSGenericConnectionForLink:a3 connectionSetupStartTime:v10 firstPacketReceiveTime:v11 connectionType:v12 success:1 errorCode:&off_1009D1DE8];
    }
    self->_sentAWDReport = 1;
  }
}

- (void)_triggerStallDetectionLogsForDetector:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_100A4C8A8 != -1) {
    dispatch_once(&qword_100A4C8A8, &stru_10098A438);
  }
  uint64_t v8 = mach_continuous_time();
  double v9 = *(double *)&qword_100A4C830;
  id v10 = v6;
  [v10 UTF8String];
  if (IMGetDomainBoolForKey())
  {
    IDSNetworkingLogDump();
    v11 = +[NSString stringWithFormat:@"%p %@ Stall detected [%@].", self, v10, v7];
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v19 = v11;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v19 = v11;
          _IDSLogV();
        }
      }
    }
    id v13 = +[NSString stringWithFormat:@"IDS detected the single UTun socket stall. Please file a bug \"Transport|all\", and attach a sysdiagnose and the contents of /Library/Logs/CrashReporter from both devices.", v19];
    IDSInternalAlertSimple();

    goto LABEL_27;
  }
  double v14 = v9 * (double)v8;
  double v15 = *(double *)&qword_100A4C828;
  if (*(double *)&qword_100A4C828 != 0.0) {
    goto LABEL_15;
  }
  if (arc4random() <= 0x33333333)
  {
    double v15 = *(double *)&qword_100A4C828;
LABEL_15:
    CFStringRef v16 = @"%p %@ Stall detected [%@] - netdiagnose & simulate crash";
    if (v15 != 0.0 && v14 - v15 <= 172800.0)
    {
      v11 = 0;
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  CFStringRef v16 = @"%p %@ Stall detected [%@] - only netdiagnose";
LABEL_18:
  qword_100A4C828 = *(void *)&v14;
  IDSNetworkingLogDump();
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, self, v10, v7);
  if (v11)
  {
    double lastStallDetectLogTime = self->_lastStallDetectLogTime;
    if (lastStallDetectLogTime == 0.0 || v14 - lastStallDetectLogTime > 4.0)
    {
      self->_double lastStallDetectLogTime = v14;
      id v18 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
  }
LABEL_27:
}

- (void)_createStallDetectorWithName:(id)a3
{
  id v4 = a3;
  outgoingStallDetector = self->_outgoingStallDetector;
  if (outgoingStallDetector)
  {
    [(IDSStallDetector *)outgoingStallDetector reset];
    self->_double lastStallDetectLogTime = 0.0;
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003549D0;
    v14[3] = &unk_100989E30;
    v14[4] = self;
    id v6 = v4;
    id v15 = v6;
    id v7 = objc_retainBlock(v14);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100354A90;
    v12[3] = &unk_100989E30;
    v12[4] = self;
    id v8 = v6;
    id v13 = v8;
    double v9 = objc_retainBlock(v12);
    id v10 = +[IDSStallDetector newDetectorWithName:v8 stallDetectedBlock:v7 stallWarningBlock:v9];
    [v10 setByteMovementDelayThreshold:30.0];
    [v10 setVerboseLogging:1];
    objc_storeStrong((id *)&self->_outgoingStallDetector, v10);
    v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v17 = self;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%p Created the stall detector %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (NSString)localConnectionGUID
{
  return self->_localConnectionGUID;
}

- (NSString)remoteConnectionGUID
{
  return self->_remoteConnectionGUID;
}

- (void)setRemoteConnectionGUID:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (IDSGenericConnectionID)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
}

- (IDSSockAddrWrapperPair)addressPair
{
  return self->_addressPair;
}

- (void)setAddressPair:(id)a3
{
}

- (int)protocol
{
  return self->_protocol;
}

- (int)sd
{
  return self->_sd;
}

- (void)setSd:(int)a3
{
  self->_int sd = a3;
}

- (int)sdCopy
{
  return self->_sdCopy;
}

- (void)setSdCopy:(int)a3
{
  self->_int sdCopy = a3;
}

- (int)sdOriginal
{
  return self->_sdOriginal;
}

- (void)setSdOriginal:(int)a3
{
  self->_int sdOriginal = a3;
}

- (int)sdNumberNoClose
{
  return self->_sdNumberNoClose;
}

- (void)setSdNumberNoClose:(int)a3
{
  self->_sdNumberNoClose = a3;
}

- (NSError)connectError
{
  return self->_connectError;
}

- (void)setConnectError:(id)a3
{
}

- (id)openSocketCompletionHandler
{
  return self->_openSocketCompletionHandler;
}

- (void)setOpenSocketCompletionHandler:(id)a3
{
}

- (unsigned)firstIncomingSYNSequenceNumber
{
  return self->_firstIncomingSYNSequenceNumber;
}

- (void)setFirstIncomingSYNSequenceNumber:(unsigned int)a3
{
  self->_firstIncomingSYNSequenceNumber = a3;
}

- (unsigned)expectedNextOutgoingSequenceNumber
{
  return self->_expectedNextOutgoingSequenceNumber;
}

- (void)setExpectedNextOutgoingSequenceNumber:(unsigned int)a3
{
  self->_expectedNextOutgoingSequenceNumber = a3;
}

- (unsigned)expectedNextIncomingSequenceNumber
{
  return self->_expectedNextIncomingSequenceNumber;
}

- (void)setExpectedNextIncomingSequenceNumber:(unsigned int)a3
{
  self->_expectedNextIncomingSequenceNumber = a3;
}

- (int)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(int)a3
{
  self->_int stateFlags = a3;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)socketTrafficClass
{
  return self->_socketTrafficClass;
}

- (void)setSocketTrafficClass:(int64_t)a3
{
  self->_socketTrafficClass = a3;
}

- (BOOL)hasMoreData
{
  return self->_hasMoreData;
}

- (void)setHasMoreData:(BOOL)a3
{
  self->_hasMoreData = a3;
}

- (double)lastSuccessfulSentTime
{
  return self->_lastSuccessfulSentTime;
}

- (void)setLastSuccessfulSentTime:(double)a3
{
  self->_lastSuccessfulSentTime = a3;
}

- (IDSHCInfo)compressionInfo
{
  return self->_compressionInfo;
}

- (void)setCompressionInfo:(id)a3
{
}

- (int64_t)compressionState
{
  return self->_compressionState;
}

- (void)setCompressionState:(int64_t)a3
{
  self->_int64_t compressionState = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (unsigned)uint32Key
{
  return self->_uint32Key;
}

- (void)setUint32Key:(unsigned int)a3
{
  self->_uint32Key = a3;
}

- (BOOL)isCloudEnabled
{
  return self->_isCloudEnabled;
}

- (void)setIsCloudEnabled:(BOOL)a3
{
  self->_isCloudEnabled = a3;
}

- (BOOL)isControlChannel
{
  return self->_isControlChannel;
}

- (void)setIsControlChannel:(BOOL)a3
{
  self->_isControlChannel = a3;
}

- (BOOL)isDefaultPairedDevice
{
  return self->_isDefaultPairedDevice;
}

- (void)setIsDefaultPairedDevice:(BOOL)a3
{
  self->_isDefaultPairedDevice = a3;
}

- (BOOL)isRealTime
{
  return self->_isRealTime;
}

- (void)setIsRealTime:(BOOL)a3
{
  self->_isRealTime = a3;
}

- (BOOL)shouldStopBTDatagramLink
{
  return self->_shouldStopBTDatagramLink;
}

- (void)setShouldStopBTDatagramLink:(BOOL)a3
{
  self->_shouldStopBTDatagramLink = a3;
}

- (BOOL)encryptionEnabled
{
  return self->_encryptionEnabled;
}

- (void)setEncryptionEnabled:(BOOL)a3
{
  self->_encryptionEnabled = a3;
}

- (int)keyMaterialLength
{
  return self->_keyMaterialLength;
}

- (void)setKeyMaterialLength:(int)a3
{
  self->_rsize_t keyMaterialLength = a3;
}

- (char)localKeyMaterial
{
  return self->_localKeyMaterial;
}

- (void)setLocalKeyMaterial:(char *)a3
{
  self->_localKeyMaterial = a3;
}

- (unsigned)SSRCSend
{
  return self->_SSRCSend;
}

- (void)setSSRCSend:(unsigned int)a3
{
  self->_SSRCSend = a3;
}

- (unsigned)SSRCRecv
{
  return self->_SSRCRecv;
}

- (void)setSSRCRecv:(unsigned int)a3
{
  self->_SSRCRecv = a3;
}

- (unsigned)seqSendStart
{
  return self->_seqSendStart;
}

- (void)setSeqSendStart:(unsigned __int16)a3
{
  self->_seqSendStart = a3;
}

- (unsigned)seqRecvStart
{
  return self->_seqRecvStart;
}

- (void)setSeqRecvStart:(unsigned __int16)a3
{
  self->_seqRecvStart = a3;
}

- (unsigned)seqSend
{
  return self->_seqSend;
}

- (void)setSeqSend:(unsigned __int16)a3
{
  self->_seqSend = a3;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (void)setPacketsReceived:(unint64_t)a3
{
  self->_packetsReceived = a3;
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (void)setPacketsSent:(unint64_t)a3
{
  self->_packetsSent = a3;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (void)setBytesSent:(unint64_t)a3
{
  self->_bytesSent = a3;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(unint64_t)a3
{
  self->_bytesReceived = a3;
}

- (int)srtpProtocolVersion
{
  return self->_srtpProtocolVersion;
}

- (void)setSrtpProtocolVersion:(int)a3
{
  self->_srtpProtocolVersion = a3;
}

- (BOOL)checksumFailed
{
  return self->_checksumFailed;
}

- (void)setChecksumFailed:(BOOL)a3
{
  self->_checksumFailed = a3;
}

- (double)connectionInitTime
{
  return self->_connectionInitTime;
}

- (void)setConnectionInitTime:(double)a3
{
  self->_connectionInitTime = a3;
}

- (double)firstDataPacketReceiveTime
{
  return self->_firstDataPacketReceiveTime;
}

- (void)setFirstDataPacketReceiveTime:(double)a3
{
  self->_firstDataPacketReceiveTime = a3;
}

- (NSString)idsDeviceConnectionUUID
{
  return self->_idsDeviceConnectionUUID;
}

- (void)setIdsDeviceConnectionUUID:(id)a3
{
}

- (double)connectionSetupStartTime
{
  return self->_connectionSetupStartTime;
}

- (void)setConnectionSetupStartTime:(double)a3
{
  self->_connectionSetupStartTime = a3;
}

- (double)firstPacketReceiveTime
{
  return self->_firstPacketReceiveTime;
}

- (void)setFirstPacketReceiveTime:(double)a3
{
  self->_firstPacketReceiveTime = a3;
}

- (IDSConnectionContext)connectionContext
{
  return self->_connectionContext;
}

- (void)setConnectionContext:(id)a3
{
}

- (id)readHandler
{
  return self->_readHandler;
}

- (void)setReadHandler:(id)a3
{
}

- (BOOL)shouldSetAllowlistUUIDForStreamingSocket
{
  return self->_shouldSetAllowlistUUIDForStreamingSocket;
}

- (void)setShouldSetAllowlistUUIDForStreamingSocket:(BOOL)a3
{
  self->_shouldSetAllowlistUUIDForStreamingSocket = a3;
}

- (OS_nw_connection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
}

- (OS_nw_service_connector)serviceConnector
{
  return self->_serviceConnector;
}

- (void)setServiceConnector:(id)a3
{
}

- (OS_nw_endpoint)defaultPairedDeviceEndpoint
{
  return self->_defaultPairedDeviceEndpoint;
}

- (void)setDefaultPairedDeviceEndpoint:(id)a3
{
}

- (NSString)outgoingStallDetectorName
{
  return self->_outgoingStallDetectorName;
}

- (void)setOutgoingStallDetectorName:(id)a3
{
}

- (IDSStallDetector)outgoingStallDetector
{
  return self->_outgoingStallDetector;
}

- (void)setOutgoingStallDetector:(id)a3
{
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (BOOL)isDirectMsgChannel
{
  return self->_isDirectMsgChannel;
}

- (void)setIsDirectMsgChannel:(BOOL)a3
{
  self->_isDirectMsgChannel = a3;
}

- (BOOL)didInvalidate
{
  return self->_didInvalidate;
}

- (void)setDidInvalidate:(BOOL)a3
{
  self->_didInvalidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readHandler, 0);
  objc_storeStrong((id *)&self->_connectionContext, 0);
  objc_storeStrong((id *)&self->_outgoingStallDetector, 0);
  objc_storeStrong((id *)&self->_outgoingStallDetectorName, 0);
  objc_storeStrong((id *)&self->_defaultPairedDeviceEndpoint, 0);
  objc_storeStrong((id *)&self->_serviceConnector, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_idsDeviceConnectionUUID, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_compressionInfo, 0);
  objc_storeStrong(&self->_openSocketCompletionHandler, 0);
  objc_storeStrong((id *)&self->_connectError, 0);
  objc_storeStrong((id *)&self->_addressPair, 0);
  objc_storeStrong((id *)&self->_connectionID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_remoteConnectionGUID, 0);

  objc_storeStrong((id *)&self->_localConnectionGUID, 0);
}

@end