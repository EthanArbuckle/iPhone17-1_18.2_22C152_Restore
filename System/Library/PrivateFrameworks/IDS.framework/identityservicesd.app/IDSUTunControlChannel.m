@interface IDSUTunControlChannel
- (BOOL)avoidMainQueueOverrideToNO;
- (BOOL)checksumEnabled;
- (BOOL)connected;
- (BOOL)connecting;
- (BOOL)didReceiveReestablishmentRequest;
- (BOOL)disableEncryption;
- (BOOL)isDefaultPairedDevicePairedLocally;
- (BOOL)isDefaultPairedDevicePairedRemotely;
- (BOOL)isDefaultPairedDeviceStartingToEncrypt;
- (BOOL)isReadyForEncrypting;
- (BOOL)processFairplayDeviceInfo:(id)a3;
- (BOOL)processFairplayDeviceSessionInfo:(id)a3;
- (BOOL)processFairplayHostSessionInfo:(id)a3;
- (BOOL)processOTRNegotiationMessage:(id)a3;
- (BOOL)processSuspendOTRNegotiationMessage:(id)a3;
- (IDSStallDetector)outgoingStallDetector;
- (IDSUTunControlChannel)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4 receiveHandler:(id)a5;
- (IDSUTunControlChannelIdentityPair)identityPair;
- (NSDictionary)remoteDeviceEncryptionInfo;
- (NSString)deviceUniqueID;
- (double)reestablishmentRequestReceiveTime;
- (id)_utunControlMessageFairplayDeviceInfo;
- (id)_utunControlMessageFairplayDeviceSessionInfo:(char *)a3 grappaDeviceSessionInfoSize:(unsigned int)a4;
- (id)_utunControlMessageFairplayHostSessionInfo:(unsigned __int8)a3 deviceType:(unsigned __int8)a4 protocolVersion:(unsigned int)a5;
- (id)description;
- (void)_callHandlerWithMessage:(id)a3 resetDataConnections:(BOOL)a4 shouldObliterate:(BOOL)a5 decryptionFailed:(BOOL)a6 shouldTriggerCorruptionRecovery:(BOOL)a7;
- (void)_cancelConnectionAndResetDataConnections:(BOOL)a3 shouldObliterate:(BOOL)a4 encryptionFailure:(BOOL)a5 shouldTriggerCorruptionRecovery:(BOOL)a6;
- (void)_checkSendNewMessage;
- (void)_cleanupConnection;
- (void)_clearChannel;
- (void)_destroyFairplayHostSession;
- (void)_handleFairplayAuthenticationFailure;
- (void)cancelConnection;
- (void)dealloc;
- (void)encryptControlChannelForStoredIdentities;
- (void)invalidate;
- (void)readFromConnection;
- (void)resumeOTRNegotiation;
- (void)sendMessage:(id)a3;
- (void)sendOTRNegotiationMessage:(id)a3 negotiationCount:(unsigned int)a4 negotiationData:(id)a5;
- (void)sendPriorityMessage:(id)a3;
- (void)sendSuspendOTRNegotiationMessage:(id)a3;
- (void)setAvoidMainQueueOverrideToNO:(BOOL)a3;
- (void)setChecksumEnabled:(BOOL)a3;
- (void)setConnecting:(BOOL)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setDidReceiveReestablishmentRequest:(BOOL)a3;
- (void)setDisableEncryption:(BOOL)a3;
- (void)setIdentityPair:(id)a3;
- (void)setIsDefaultPairedDevicePairedLocally:(BOOL)a3;
- (void)setIsDefaultPairedDevicePairedRemotely:(BOOL)a3;
- (void)setIsReadyForEncrypting:(BOOL)a3;
- (void)setOutgoingStallDetector:(id)a3;
- (void)setReestablishmentRequestReceiveTime:(double)a3;
- (void)setRemoteDeviceEncryptionInfo:(id)a3;
- (void)simulateDecryptionFailure;
- (void)suspendOTRNegotiation:(id)a3;
- (void)useConnection:(id)a3 withFirstMessage:(id)a4;
- (void)writeToConnection;
@end

@implementation IDSUTunControlChannel

- (id)description
{
  return +[NSString stringWithFormat:@"%p <Control channel: uniqueID[%@] pendingReceive[%d] pendingSend[%d] outgoingMessages[%d] outgoingPriorityMessages[%d] encrypting[%u (pl:%u pr:%u)>", self, self->_deviceUniqueID, [(NSMutableData *)self->_pendingDataReceive length], [(NSMutableData *)self->_pendingDataSend length], [(NSMutableArray *)self->_outgoingMessages count], [(NSMutableArray *)self->_outgoingPriorityMessages count], self->_isReadyForEncrypting, self->_isDefaultPairedDevicePairedLocally, self->_isDefaultPairedDevicePairedRemotely];
}

- (IDSUTunControlChannel)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4 receiveHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)IDSUTunControlChannel;
  v11 = [(IDSUTunControlChannel *)&v32 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    deviceUniqueID = v11->_deviceUniqueID;
    v11->_deviceUniqueID = v12;

    v14 = (NSString *)[v9 copy];
    cbuuid = v11->_cbuuid;
    v11->_cbuuid = v14;

    id v16 = [v10 copy];
    id receiveHandler = v11->_receiveHandler;
    v11->_id receiveHandler = v16;

    v18 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    pendingDataReceive = v11->_pendingDataReceive;
    v11->_pendingDataReceive = v18;

    v20 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    pendingDataSend = v11->_pendingDataSend;
    v11->_pendingDataSend = v20;

    v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    outgoingMessages = v11->_outgoingMessages;
    v11->_outgoingMessages = v22;

    v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    outgoingPriorityMessages = v11->_outgoingPriorityMessages;
    v11->_outgoingPriorityMessages = v24;

    v11->_sd = -1;
    v11->_fairplayAuthState = 0;
    v11->_receiveHandlerBeingCalled = 0;
    id v26 = +[NSString stringWithFormat:@"control channel %@", v11->_deviceUniqueID];
    v27 = (const char *)[v26 UTF8String];
    v28 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
    connectionQueue = v11->_connectionQueue;
    v11->_connectionQueue = (OS_dispatch_queue *)v29;

    if ([v8 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID]) {
      v11->_isDefaultPairedDevice = 1;
    }
  }

  return v11;
}

- (void)_cleanupConnection
{
  if (self->_sd != -1)
  {
    IDSTransportThreadRemoveSocket();
    shutdown(self->_sd, 2);
    self->_sd = -1;
  }
  v3 = self->_connection;
  if (v3)
  {
    self->_nw_connection_t connection = 0;
    nw_connection_t connection = v3;

    nw_connection_cancel(connection);
  }
}

- (void)simulateDecryptionFailure
{
  v3 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "control channel simulating decryption failure ############### - close socket / call receive handler", v4, 2u);
  }

  [(IDSUTunControlChannel *)self _cancelConnectionAndResetDataConnections:1 shouldObliterate:0 encryptionFailure:1 shouldTriggerCorruptionRecovery:0];
}

- (void)encryptControlChannelForStoredIdentities
{
  v3 = [(IDSUTunControlChannel *)self identityPair];

  v4 = +[IDSFoundationLog utunController];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [(IDSUTunControlChannel *)self identityPair];
      v7 = [v6 localFullIdentity];
      id v8 = [(IDSUTunControlChannel *)self identityPair];
      id v9 = [v8 remotePublicIdentity];
      int v14 = 138478083;
      v15 = v7;
      __int16 v16 = 2113;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UTunController control channel asked to encrypt {local: %{private}@, remote: %{private}@}", (uint8_t *)&v14, 0x16u);
    }
    self->_isReadyForEncrypting = 1;
    if (self->_connection) {
      [(IDSUTunControlChannel *)self _cancelConnectionAndResetDataConnections:0 shouldObliterate:0 encryptionFailure:0 shouldTriggerCorruptionRecovery:0];
    }
  }
  else
  {
    if (v5)
    {
      id v10 = [(IDSUTunControlChannel *)self identityPair];
      v11 = [v10 localFullIdentity];
      v12 = [(IDSUTunControlChannel *)self identityPair];
      v13 = [v12 remotePublicIdentity];
      int v14 = 134218240;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UTunController control channel asked to encrypt without keys (local %p remote %p)", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (BOOL)isDefaultPairedDeviceStartingToEncrypt
{
  if (!self->_isDefaultPairedDevice || self->_isReadyForEncrypting) {
    return 0;
  }
  v3 = [(IDSUTunControlChannel *)self identityPair];
  BOOL v2 = v3 != 0;

  return v2;
}

- (void)readFromConnection
{
  if (self->_newSocket)
  {
    self->_newSocket = 0;
    *(_DWORD *)__errnum = -1431655766;
    v91[0] = 4;
    int v3 = getsockopt(self->_sd, 0xFFFF, 4103, __errnum, v91);
    v4 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      deviceUniqueID = self->_deviceUniqueID;
      int sd = self->_sd;
      int v7 = *(_DWORD *)__errnum;
      id v8 = strerror(*(int *)__errnum);
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = deviceUniqueID;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = sd;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v3;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v7;
      *(_WORD *)&buf[30] = 2080;
      *(void *)&buf[32] = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UTunController control channel for [%@] connected for {socket:%d} read (getsockopt=%d error=%d: %s)", buf, 0x28u);
    }

    if (!v3)
    {
      if (*(_DWORD *)__errnum)
      {
        [(IDSUTunControlChannel *)self _cancelConnectionAndResetDataConnections:0 shouldObliterate:0 encryptionFailure:0 shouldTriggerCorruptionRecovery:0];
        return;
      }
    }
  }
  id v9 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = self->_sd;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "control channel receiving control message on {socket:%d} ...", buf, 8u);
  }

  memset(buf, 170, 0x800uLL);
  ssize_t v11 = recv(self->_sd, buf, 0x800uLL, 0);
  if (v11 < 0)
  {
    unsigned int v13 = *__error();
    if (v13 > 0x37 || ((1 << v13) & 0x80000800000010) == 0)
    {
      int v14 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_deviceUniqueID;
        int v16 = self->_sd;
        v17 = strerror(v13);
        *(_DWORD *)__errnum = 138413058;
        *(void *)&__errnum[4] = v15;
        *(_WORD *)&__errnum[12] = 1024;
        *(_DWORD *)&__errnum[14] = v16;
        *(_WORD *)&__errnum[18] = 1024;
        *(_DWORD *)&__errnum[20] = v13;
        *(_WORD *)v97 = 2080;
        *(void *)&v97[2] = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "UTunController control channel for [%@] disconnected on {socket:%d} recv: errno=%d: %s", __errnum, 0x22u);
      }

      [(IDSUTunControlChannel *)self _cancelConnectionAndResetDataConnections:[(IDSUTunControlChannel *)self isDefaultPairedDeviceStartingToEncrypt] ^ 1 shouldObliterate:0 encryptionFailure:0 shouldTriggerCorruptionRecovery:0];
    }
  }
  else
  {
    if (v11)
    {
      [(NSMutableData *)self->_pendingDataReceive appendBytes:buf length:v11];
      ++self->_dataReceivedWithoutMessageCount;
      if ([(NSMutableData *)self->_pendingDataReceive length] < 2)
      {
LABEL_12:
        if (!self->_checksumEnabled && self->_dataReceivedWithoutMessageCount >= 2)
        {
          v12 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__errnum = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "control channel corruption detection heuristic hit - resetting", __errnum, 2u);
          }

          [(IDSUTunControlChannel *)self _cancelConnectionAndResetDataConnections:0 shouldObliterate:0 encryptionFailure:0 shouldTriggerCorruptionRecovery:1];
        }
        return;
      }
      uint64_t v81 = IDSUTunControlChannelRemoteDeviceEncryptionInfo_UNENCRYPTED_Key;
      uint64_t v80 = IDSUTunControlChannelRemoteDeviceEncryptionInfoRemoteTokenURIKey;
      uint64_t v78 = IDSUTunControlChannelRemoteDeviceEncryptionInfoMyURIKey;
      uint64_t v79 = IDSUTunControlChannelRemoteDeviceEncryptionInfoServiceKey;
      uint64_t v77 = IDSUTunControlChannelRemoteDeviceEncryptionInfoMyIdentityKey;
      while (1)
      {
        v22 = (unsigned __int16 *)[(NSMutableData *)self->_pendingDataReceive bytes];
        v23 = (char *)__rev16(*v22);
        if ((char *)[(NSMutableData *)self->_pendingDataReceive length] - 2 < v23) {
          goto LABEL_12;
        }
        self->_dataReceivedWithoutMessageCount = 0;
        v24 = +[NSData dataWithBytes:v22 + 1 length:v23];
        -[NSMutableData replaceBytesInRange:withBytes:length:](self->_pendingDataReceive, "replaceBytesInRange:withBytes:length:", 0, v23 + 2, 0, 0);
        v25 = "disabled";
        if (self->_disableEncryption)
        {
LABEL_29:
          id v26 = v24;
          goto LABEL_30;
        }
        if (self->_isReadyForEncrypting) {
          break;
        }
        v25 = "default paired none";
        if (self->_isDefaultPairedDevice) {
          goto LABEL_29;
        }
        remoteDeviceEncryptionInfo = self->_remoteDeviceEncryptionInfo;
        if (remoteDeviceEncryptionInfo)
        {
          v45 = [(NSDictionary *)remoteDeviceEncryptionInfo objectForKeyedSubscript:v81];
          unsigned __int8 v46 = [v45 BOOLValue];

          v25 = "remote UNENCRYPTED";
          if (v46) {
            goto LABEL_29;
          }
          id v47 = [(NSDictionary *)self->_remoteDeviceEncryptionInfo objectForKeyedSubscript:v80];
          v48 = [(NSDictionary *)self->_remoteDeviceEncryptionInfo objectForKeyedSubscript:v79];
          v49 = [(NSDictionary *)self->_remoteDeviceEncryptionInfo objectForKeyedSubscript:v78];
          v75 = [(NSDictionary *)self->_remoteDeviceEncryptionInfo objectForKeyedSubscript:v77];
          id v95 = 0;
          v76 = [v47 _stripPotentialTokenURIWithToken:&v95];
          id v74 = v95;
          dispatch_semaphore_t v50 = dispatch_semaphore_create(0);
          *(void *)v91 = 0;
          v92 = v91;
          uint64_t v93 = 0x2020000000;
          uint64_t v94 = 0;
          v90[0] = 0;
          v90[1] = v90;
          v90[2] = 0x2020000000;
          v90[3] = 1;
          *(void *)__errnum = 0;
          *(void *)&__errnum[8] = __errnum;
          *(void *)&__errnum[16] = 0x3032000000;
          *(void *)v97 = sub_100143DDC;
          *(void *)&v97[8] = sub_100143DEC;
          *(void *)&v97[16] = 0;
          v51 = +[IDSEncryptionController sharedInstance];
          v52 = +[IDSURI URIWithPrefixedURI:v76];
          v53 = +[IDSURI URIWithPrefixedURI:v49];
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472;
          v85[2] = sub_100143DF4;
          v85[3] = &unk_1009837A8;
          v87 = v91;
          v88 = v90;
          v89 = __errnum;
          v54 = v50;
          v86 = v54;
          LOBYTE(v73) = !self->_avoidMainQueueOverrideToNO;
          LOBYTE(v72) = 0;
          [v51 legacyPublicKeyDecryptData:v24 fromURI:v52 identity:v75 toURI:v53 pushToken:v74 service:v48 priority:300 isRetry:v72 replayKey:0 completionBlock:v85 avoidMainQueue:v73];

          dispatch_semaphore_wait(v54, 0xFFFFFFFFFFFFFFFFLL);
          uint64_t v55 = *((void *)v92 + 3);
          id v26 = *(id *)(*(void *)&__errnum[8] + 40);

          _Block_object_dispose(__errnum, 8);
          _Block_object_dispose(v90, 8);
          _Block_object_dispose(v91, 8);

          v25 = "remote PK";
        }
        else
        {
          if (!self->_deviceUniqueID)
          {
            if (self->_receiveHandlerBeingCalled)
            {
              v68 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__errnum = 0;
                _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "receiveHandler is being called, so ignore this one", __errnum, 2u);
              }
            }
            else
            {
              self->_receiveHandlerBeingCalled = 1;
              v69 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__errnum = 0;
                _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Dispatch receiveHandler", __errnum, 2u);
              }

              v70 = im_primary_queue();
              v83[0] = _NSConcreteStackBlock;
              v83[1] = 3221225472;
              v83[2] = sub_100143EA4;
              v83[3] = &unk_10097E4D0;
              v83[4] = self;
              dispatch_async(v70, v83);
            }
            return;
          }
          v65 = +[IDSEncryptionController sharedInstance];
          v66 = self->_deviceUniqueID;
          id v84 = 0;
          id v26 = [v65 legacyPublicKeyDecryptData:v24 toDeviceID:v66 priority:300 error:&v84];
          id v47 = v84;

          uint64_t v55 = sub_1002DC660(v47);
          v25 = "cloud paired PK";
        }

        if (v55) {
          goto LABEL_66;
        }
LABEL_30:
        v27 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [v24 length];
          NSUInteger v29 = [(NSMutableData *)self->_pendingDataReceive length];
          *(_DWORD *)__errnum = 136316162;
          *(void *)&__errnum[4] = v25;
          *(_WORD *)&__errnum[12] = 2112;
          *(void *)&__errnum[14] = v24;
          *(_WORD *)&__errnum[22] = 2048;
          *(void *)v97 = v28;
          *(_WORD *)&v97[8] = 2112;
          *(void *)&v97[10] = v26;
          *(_WORD *)&v97[18] = 2048;
          *(void *)&v97[20] = v29;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "control channel decrypted (%s) new message (%@, size=%lu  data: %@) (from %lu)", __errnum, 0x34u);
        }

        [(IDSUTunControlChannel *)self _callHandlerWithMessage:v26 resetDataConnections:0 shouldObliterate:0 decryptionFailed:0 shouldTriggerCorruptionRecovery:0];
LABEL_33:

        if ([(NSMutableData *)self->_pendingDataReceive length] <= 1) {
          goto LABEL_12;
        }
      }
      id v30 = [(IDSUTunControlChannel *)self identityPair];
      id v31 = v24;
      if (![v31 length])
      {
        id v40 = objc_alloc_init((Class)NSData);
        BOOL v42 = 1;
        goto LABEL_64;
      }
      objc_super v32 = +[IDSMessageHashStore sharedInstance];
      id v33 = v31;
      if (qword_100A4A7F0 != -1) {
        dispatch_once(&qword_100A4A7F0, &stru_100983880);
      }
      if (off_100A4A7E8)
      {
        v34 = +[IDSRegistrationKeyManager sharedInstance];
        id v35 = [v34 latestCopyMessageProtectionIdentityForDataProtectionClass:2];

        *(void *)__errnum = 0;
        v36 = (void *)off_100A4A7E8(v33, v35, __errnum);
        if (v35) {
          CFRelease(v35);
        }

        if (v36 && ![v32 containsMessageHash:v36])
        {
          [v32 addMessageHash:v36];
          IMTimingStartTimingForKey();
          v37 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__errnum = 138477827;
            *(void *)&__errnum[4] = v30;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "   UTUNControlChannel Decrypting {identityPair: %{private}@}", __errnum, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v71 = v30;
            _IDSLogV();
          }
          v38 = objc_msgSend(v30, "localFullIdentity", v71);
          v39 = [v30 remotePublicIdentity];
          *(void *)v91 = 0;
          id v40 = [v38 verifyAndExposeData:v33 withSigner:v39 error:v91];
          id v41 = *(id *)v91;

          BOOL v42 = v40 != 0;
          if (v40)
          {
            id v43 = v40;
          }
          else
          {
            v67 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__errnum = 138412290;
              *(void *)&__errnum[4] = v41;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "   Public/Private decryption failed with error: %@", __errnum, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v71 = v41;
              _IDSLogV();
            }
          }
          IMTimingStopTimingForKey();

LABEL_63:
LABEL_64:

          id v26 = v40;
          v25 = "default paired PK";
          if (!v42)
          {
            uint64_t v55 = 200;
LABEL_66:
            v57 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              BOOL isDefaultPairedDevice = self->_isDefaultPairedDevice;
              BOOL isReadyForEncrypting = self->_isReadyForEncrypting;
              BOOL isDefaultPairedDevicePairedLocally = self->_isDefaultPairedDevicePairedLocally;
              BOOL isDefaultPairedDevicePairedRemotely = self->_isDefaultPairedDevicePairedRemotely;
              *(_DWORD *)__errnum = 136316418;
              *(void *)&__errnum[4] = v25;
              *(_WORD *)&__errnum[12] = 2048;
              *(void *)&__errnum[14] = v55;
              *(_WORD *)&__errnum[22] = 1024;
              *(_DWORD *)v97 = isDefaultPairedDevice;
              *(_WORD *)&v97[4] = 1024;
              *(_DWORD *)&v97[6] = isReadyForEncrypting;
              *(_WORD *)&v97[10] = 1024;
              *(_DWORD *)&v97[12] = isDefaultPairedDevicePairedLocally;
              *(_WORD *)&v97[16] = 1024;
              *(_DWORD *)&v97[18] = isDefaultPairedDevicePairedRemotely;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "control channel failed to decrypt (%s) of control channel data: %ld (magnet %u encrypting %u, pairedLocally %u pairedRemotely %u)", __errnum, 0x2Eu);
            }

            if (self->_receiveHandlerBeingCalled)
            {
              v62 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__errnum = 0;
                _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "receiveHandler is being called, so ignore this one", __errnum, 2u);
              }
            }
            else
            {
              self->_receiveHandlerBeingCalled = 1;
              v63 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__errnum = 0;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Dispatch receiveHandler", __errnum, 2u);
              }

              v64 = im_primary_queue();
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100143F5C;
              block[3] = &unk_10097E4D0;
              block[4] = self;
              dispatch_async(v64, block);
            }
            goto LABEL_33;
          }
          goto LABEL_30;
        }
      }
      else
      {

        v36 = 0;
      }
      v56 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__errnum = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "IDS message hash found, returning early", __errnum, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      [v32 updateCreationDateForHash:v36];
      id v40 = objc_alloc_init((Class)NSData);
      BOOL v42 = 1;
      goto LABEL_63;
    }
    unsigned int v18 = [(IDSUTunControlChannel *)self isDefaultPairedDeviceStartingToEncrypt];
    v19 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_deviceUniqueID;
      int v21 = self->_sd;
      *(_DWORD *)__errnum = 138412546;
      *(void *)&__errnum[4] = v20;
      *(_WORD *)&__errnum[12] = 1024;
      *(_DWORD *)&__errnum[14] = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "UTunController control channel for [%@] disconnected on {socket:%d} recv: connection closed", __errnum, 0x12u);
    }

    [(IDSUTunControlChannel *)self _cancelConnectionAndResetDataConnections:v18 ^ 1 shouldObliterate:0 encryptionFailure:0 shouldTriggerCorruptionRecovery:0];
  }
}

- (void)writeToConnection
{
  if (self->_newSocket)
  {
    self->_newSocket = 0;
    socklen_t v35 = 4;
    int __errnum = -1431655766;
    int v3 = getsockopt(self->_sd, 0xFFFF, 4103, &__errnum, &v35);
    v4 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      deviceUniqueID = self->_deviceUniqueID;
      int sd = self->_sd;
      int v7 = __errnum;
      id v8 = strerror(__errnum);
      *(_DWORD *)buf = 138544386;
      *(void *)v38 = deviceUniqueID;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = sd;
      *(_WORD *)&v38[14] = 1024;
      *(_DWORD *)&v38[16] = v3;
      *(_WORD *)&v38[20] = 1024;
      *(_DWORD *)&v38[22] = v7;
      *(_WORD *)&v38[26] = 2080;
      *(void *)&v38[28] = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UTunController control channel for [%{public}@] connected for write {socket:%d} (getsockopt=%d error=%d: %s)", buf, 0x28u);
    }

    if (!v3)
    {
      if (__errnum)
      {
        id v9 = self;
        uint64_t v10 = 0;
LABEL_22:
        [(IDSUTunControlChannel *)v9 _cancelConnectionAndResetDataConnections:v10 shouldObliterate:0 encryptionFailure:0 shouldTriggerCorruptionRecovery:0];
        return;
      }
    }
  }
  if (![(NSMutableData *)self->_pendingDataSend length])
  {
    IDSTransportThreadSuspendSocket();
    self->_sendSuspended = 1;
    return;
  }
  ssize_t v11 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = self->_sd;
    NSUInteger v13 = [(NSMutableData *)self->_pendingDataSend length];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v38 = v12;
    *(_WORD *)&v38[4] = 2048;
    *(void *)&v38[6] = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "control channel sending control message on {socket:%d} ... (have %lu)", buf, 0x12u);
  }

  unint64_t v14 = send(self->_sd, [(NSMutableData *)self->_pendingDataSend bytes], [(NSMutableData *)self->_pendingDataSend length], 0);
  if ((v14 & 0x8000000000000000) != 0)
  {
    unsigned int v19 = *__error();
    if (v19 > 0x37 || ((1 << v19) & 0x80000800000010) == 0)
    {
      v20 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = self->_deviceUniqueID;
        int v22 = self->_sd;
        v23 = strerror(v19);
        *(_DWORD *)buf = 138413058;
        *(void *)v38 = v21;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = v22;
        *(_WORD *)&v38[14] = 1024;
        *(_DWORD *)&v38[16] = v19;
        *(_WORD *)&v38[20] = 2080;
        *(void *)&v38[22] = v23;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "UTunController control channel for [%@] disconnected on send {socket:%d}: errno=%d: %s", buf, 0x22u);
      }

      goto LABEL_21;
    }
  }
  else
  {
    unint64_t v15 = v14;
    if (v14 > [(NSMutableData *)self->_pendingDataSend length])
    {
      int v16 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        NSUInteger v17 = [(NSMutableData *)self->_pendingDataSend length];
        int v18 = self->_sd;
        *(_DWORD *)buf = 134218496;
        *(void *)v38 = v15;
        *(_WORD *)&v38[8] = 2048;
        *(void *)&v38[10] = v17;
        *(_WORD *)&v38[18] = 1024;
        *(_DWORD *)&v38[20] = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "control channel unexpected length {bytesSent:%zu} {pendingDataSendLength:%zu} for socket {socket:%d}", buf, 0x1Cu);
      }

LABEL_21:
      uint64_t v10 = [(IDSUTunControlChannel *)self isDefaultPairedDeviceStartingToEncrypt] ^ 1;
      id v9 = self;
      goto LABEL_22;
    }
    if (v15)
    {
      outgoingStallDetector = self->_outgoingStallDetector;
      if (outgoingStallDetector) {
        [(IDSStallDetector *)outgoingStallDetector produceBytes:v15];
      }
      -[NSMutableData replaceBytesInRange:withBytes:length:](self->_pendingDataSend, "replaceBytesInRange:withBytes:length:", 0, v15, 0, 0);
      v25 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = self->_sd;
        NSUInteger v27 = [(NSMutableData *)self->_pendingDataSend length];
        int v28 = self->_sd;
        *(_DWORD *)buf = 134218752;
        *(void *)v38 = v15;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = v26;
        *(_WORD *)&v38[14] = 2048;
        *(void *)&v38[16] = v27;
        *(_WORD *)&v38[24] = 1024;
        *(_DWORD *)&v38[26] = v28;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "control channel sent %ld bytes on {socket:%d} (%lu left) (s:%d)", buf, 0x22u);
      }

      if (![(NSMutableData *)self->_pendingDataSend length])
      {
        if (self->_sendingPriorityMessage)
        {
          self->_sendingPriorityMessage = 0;
        }
        else if ([(NSMutableArray *)self->_outgoingMessages count])
        {
          [(NSMutableArray *)self->_outgoingMessages removeObjectAtIndex:0];
        }
        else
        {
          objc_super v32 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "control channel finished sending bytes but no message to remove", buf, 2u);
          }
        }
        id v33 = [(NSMutableArray *)self->_outgoingMessages count];
        if ((char *)[(NSMutableArray *)self->_outgoingPriorityMessages count] + (void)v33)
        {
          [(IDSUTunControlChannel *)self _checkSendNewMessage];
        }
        else
        {
          IDSTransportThreadSuspendSocket();
          self->_sendSuspended = 1;
          v34 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "control channel finished sending bytes no more message send pending", buf, 2u);
          }
        }
      }
    }
    else
    {
      int v29 = *__error();
      id v30 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = self->_sd;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v38 = v31;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "control channel sent 0 bytes on {socket:%d} - try again later (%d)", buf, 0xEu);
      }
    }
  }
}

- (void)useConnection:(id)a3 withFirstMessage:(id)a4
{
  int v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = self->_connection;
    if (v9)
    {
      canceledConnection = self->_canceledConnection;
      self->_canceledConnection = 0;

      self->_shouldCallbackOnCancel = 0;
      [(IDSUTunControlChannel *)self _cleanupConnection];
    }
    objc_storeStrong((id *)&self->_connection, a3);
    [(NSMutableData *)self->_pendingDataReceive setLength:0];
    [(NSMutableData *)self->_pendingDataSend setLength:0];
    self->_newSocket = 1;
    if ([(IDSUTunControlChannel *)self isDefaultPairedDeviceStartingToEncrypt]) {
      self->_BOOL isReadyForEncrypting = 1;
    }
    self->_sendSuspended = 0;
    nw_connection_set_queue(v7, (dispatch_queue_t)self->_connectionQueue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100144748;
    handler[3] = &unk_1009837F8;
    ssize_t v11 = v7;
    NSUInteger v13 = v11;
    unint64_t v14 = self;
    id v15 = v8;
    nw_connection_set_state_changed_handler(v11, handler);
    nw_connection_start(v11);
  }
  else
  {
    id v9 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "control channel cannot use nil connection", buf, 2u);
    }
  }
}

- (void)_callHandlerWithMessage:(id)a3 resetDataConnections:(BOOL)a4 shouldObliterate:(BOOL)a5 decryptionFailed:(BOOL)a6 shouldTriggerCorruptionRecovery:(BOOL)a7
{
  id receiveHandler = (void (**)(id, id, BOOL, BOOL, BOOL, BOOL))self->_receiveHandler;
  if (receiveHandler) {
    receiveHandler[2](receiveHandler, a3, a4, a5, a6, a7);
  }
}

- (void)_cancelConnectionAndResetDataConnections:(BOOL)a3 shouldObliterate:(BOOL)a4 encryptionFailure:(BOOL)a5 shouldTriggerCorruptionRecovery:(BOOL)a6
{
  ssize_t v11 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    nw_connection_t connection = self->_connection;
    canceledConnection = self->_canceledConnection;
    int v16 = 138412546;
    NSUInteger v17 = connection;
    __int16 v18 = 2112;
    unsigned int v19 = canceledConnection;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "control channel _cancelConnectionAndResetDataConnections _connection %@, _canceledConnection %@", (uint8_t *)&v16, 0x16u);
  }

  unint64_t v14 = self->_connection;
  if (v14)
  {
    self->_shouldCallbackOnCancel = 1;
    objc_storeStrong((id *)&self->_canceledConnection, v14);
    self->_callbackResetDataConnections = a3;
    self->_callbackShouldObliterate = a4;
    self->_callbackEncryptionFailed = a5;
    self->_callbackShouldTriggerCorruptionRecovery = a6;
    [(IDSUTunControlChannel *)self _clearChannel];
    [(IDSUTunControlChannel *)self _cleanupConnection];
  }
  else
  {
    id v15 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100712988(v15);
    }
  }
}

- (void)cancelConnection
{
}

- (BOOL)connected
{
  return self->_sd != -1;
}

- (void)_clearChannel
{
  int v3 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing %@", (uint8_t *)&v7, 0xCu);
  }

  [(NSMutableData *)self->_pendingDataReceive setLength:0];
  [(NSMutableData *)self->_pendingDataSend setLength:0];
  [(NSMutableArray *)self->_outgoingMessages removeAllObjects];
  if (self->_isDefaultPairedDevice)
  {
    v4 = +[IMLockdownManager sharedInstance];
    unsigned int v5 = [v4 isInternalInstall];

    if (v5)
    {
      outgoingStallDetector = self->_outgoingStallDetector;
      if (outgoingStallDetector) {
        [(IDSStallDetector *)outgoingStallDetector reset];
      }
    }
  }
}

- (void)_checkSendNewMessage
{
  if (self->_sd != -1 && ![(NSMutableData *)self->_pendingDataSend length])
  {
    int v3 = (char *)[(NSMutableArray *)self->_outgoingPriorityMessages count];
    if (&v3[(void)[(NSMutableArray *)self->_outgoingMessages count]])
    {
      if (v3)
      {
        v4 = [(NSMutableArray *)self->_outgoingPriorityMessages objectAtIndex:0];
        [(NSMutableArray *)self->_outgoingPriorityMessages removeObjectAtIndex:0];
        self->_BOOL sendingPriorityMessage = 1;
        goto LABEL_9;
      }
      if (!self->_isDefaultPairedDevice
        || self->_isReadyForEncrypting
        || !self->_isDefaultPairedDevicePairedLocally && !self->_isDefaultPairedDevicePairedRemotely)
      {
        v4 = [(NSMutableArray *)self->_outgoingMessages objectAtIndex:0];
LABEL_9:
        unsigned __int16 v5 = (unsigned __int16)[v4 length];
        if (self->_disableEncryption)
        {
          v6 = "disabled";
LABEL_11:
          id v7 = v4;
LABEL_12:
          id v8 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = (uint64_t (*)(uint64_t, uint64_t))[v7 length];
            BOOL sendingPriorityMessage = self->_sendingPriorityMessage;
            *(_DWORD *)buf = 136316418;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v7;
            *(_WORD *)&buf[22] = 2048;
            v75 = v9;
            LOWORD(v76) = 1024;
            *(_DWORD *)((char *)&v76 + 2) = v5;
            HIWORD(v76) = 2112;
            *(void *)uint64_t v77 = v7;
            *(_WORD *)&v77[8] = 1024;
            *(_DWORD *)uint64_t v78 = sendingPriorityMessage;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "control channel encrypted (%s) new message (%p, size=%lu original size=%u  data: %@) (_sendingPriorityMessage: %d)", buf, 0x36u);
          }

          *(_WORD *)buf = -21846;
          unsigned __int16 v11 = (unsigned __int16)[v7 length];
          buf[0] = HIBYTE(v11);
          buf[1] = v11;
          [(NSMutableData *)self->_pendingDataSend appendBytes:buf length:2];
          [(NSMutableData *)self->_pendingDataSend appendData:v7];
          if (self->_sendSuspended)
          {
            self->_BOOL sendSuspended = 0;
            IDSTransportThreadResumeSocket();
          }

LABEL_17:
          return;
        }
        if (!self->_isReadyForEncrypting)
        {
          if (self->_isDefaultPairedDevice)
          {
            v6 = "default paired none";
            goto LABEL_11;
          }
          remoteDeviceEncryptionInfo = self->_remoteDeviceEncryptionInfo;
          if (remoteDeviceEncryptionInfo)
          {
            v36 = [(NSDictionary *)remoteDeviceEncryptionInfo objectForKeyedSubscript:IDSUTunControlChannelRemoteDeviceEncryptionInfo_UNENCRYPTED_Key];
            unsigned __int8 v37 = [v36 BOOLValue];

            if (v37)
            {
              v6 = "remote UNENCRYPTED";
              goto LABEL_11;
            }
            id v59 = [(NSDictionary *)self->_remoteDeviceEncryptionInfo objectForKeyedSubscript:IDSUTunControlChannelRemoteDeviceEncryptionInfoRemoteTokenURIKey];
            v56 = [(NSDictionary *)self->_remoteDeviceEncryptionInfo objectForKeyedSubscript:IDSUTunControlChannelRemoteDeviceEncryptionInfoServiceKey];
            v57 = [(NSDictionary *)self->_remoteDeviceEncryptionInfo objectForKeyedSubscript:IDSUTunControlChannelRemoteDeviceEncryptionInfoMyURIKey];
            uint64_t v55 = [(NSDictionary *)self->_remoteDeviceEncryptionInfo objectForKeyedSubscript:IDSUTunControlChannelRemoteDeviceEncryptionInfoMyIdentityKey];
            id v73 = 0;
            v58 = [v59 _stripPotentialTokenURIWithToken:&v73];
            id v54 = v73;
            dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
            id v69 = 0;
            v70 = &v69;
            uint64_t v71 = 0x2020000000;
            uint64_t v72 = 0;
            v68[0] = 0;
            v68[1] = v68;
            v68[2] = 0x2020000000;
            v68[3] = 1;
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            v75 = sub_100143DDC;
            v76 = sub_100143DEC;
            *(void *)uint64_t v77 = 0;
            id v41 = +[IDSEncryptionController sharedInstance];
            BOOL v42 = +[IDSURI URIWithPrefixedURI:v57];
            id v43 = +[IDSURI URIWithPrefixedURI:v58];
            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472;
            v63[2] = sub_100145F20;
            v63[3] = &unk_100983820;
            v65 = v68;
            v66 = &v69;
            v67 = buf;
            v44 = v40;
            v64 = v44;
            LOBYTE(v53) = !self->_avoidMainQueueOverrideToNO;
            [v41 legacyPublicKeyEncryptData:v4 withEncryptedAttributes:0 fromURI:v42 identity:v55 toURI:v43 pushToken:v54 service:v56 priority:300 completionBlock:v63 avoidMainQueue:v53];

            dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
            uint64_t v25 = (uint64_t)v70[3];
            id v7 = *(id *)(*(void *)&buf[8] + 40);

            _Block_object_dispose(buf, 8);
            _Block_object_dispose(v68, 8);
            _Block_object_dispose(&v69, 8);

            v6 = "remote PK";
          }
          else
          {
            if (!self->_deviceUniqueID)
            {
              v45 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                BOOL isDefaultPairedDevice = self->_isDefaultPairedDevice;
                BOOL isReadyForEncrypting = self->_isReadyForEncrypting;
                BOOL isDefaultPairedDevicePairedLocally = self->_isDefaultPairedDevicePairedLocally;
                BOOL isDefaultPairedDevicePairedRemotely = self->_isDefaultPairedDevicePairedRemotely;
                *(_DWORD *)buf = 136316674;
                *(void *)&uint8_t buf[4] = "none";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v4;
                *(_WORD *)&buf[22] = 2048;
                v75 = 0;
                LOWORD(v76) = 1024;
                *(_DWORD *)((char *)&v76 + 2) = isDefaultPairedDevice;
                HIWORD(v76) = 1024;
                *(_DWORD *)uint64_t v77 = isReadyForEncrypting;
                *(_WORD *)&v77[4] = 1024;
                *(_DWORD *)&v77[6] = isDefaultPairedDevicePairedLocally;
                *(_WORD *)uint64_t v78 = 1024;
                *(_DWORD *)&v78[2] = isDefaultPairedDevicePairedRemotely;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "control channel failed to encrypt (%s) message [%@] error: %ld (magnet %u encrypting %u, pairedLocally %u pairedRemotely %u)", buf, 0x38u);
              }

              dispatch_semaphore_t v50 = im_primary_queue();
              dispatch_async(v50, &stru_100983840);

              v51 = im_primary_queue();
              v61[0] = _NSConcreteStackBlock;
              v61[1] = 3221225472;
              v61[2] = sub_10014601C;
              v61[3] = &unk_10097E4D0;
              v61[4] = self;
              dispatch_async(v51, v61);

              goto LABEL_17;
            }
            v38 = +[IDSEncryptionController sharedInstance];
            deviceUniqueID = self->_deviceUniqueID;
            id v62 = 0;
            id v7 = [v38 legacyPublicKeyEncryptData:v4 withEncryptedAttributes:0 toDeviceID:deviceUniqueID priority:300 error:&v62];
            id v59 = v62;

            uint64_t v25 = sub_1002DC598(v59);
            v6 = "cloud paired PK";
          }

          if (!v25) {
            goto LABEL_12;
          }
LABEL_43:
          int v26 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v27 = self->_isDefaultPairedDevice;
            BOOL v28 = self->_isReadyForEncrypting;
            BOOL v29 = self->_isDefaultPairedDevicePairedLocally;
            BOOL v30 = self->_isDefaultPairedDevicePairedRemotely;
            *(_DWORD *)buf = 136316674;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v4;
            *(_WORD *)&buf[22] = 2048;
            v75 = (uint64_t (*)(uint64_t, uint64_t))v25;
            LOWORD(v76) = 1024;
            *(_DWORD *)((char *)&v76 + 2) = v27;
            HIWORD(v76) = 1024;
            *(_DWORD *)uint64_t v77 = v28;
            *(_WORD *)&v77[4] = 1024;
            *(_DWORD *)&v77[6] = v29;
            *(_WORD *)uint64_t v78 = 1024;
            *(_DWORD *)&v78[2] = v30;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "control channel failed to encrypt (%s) message [%@] error: %ld (magnet %u encrypting %u, pairedLocally %u pairedRemotely %u)", buf, 0x38u);
          }

          self->_BOOL sendingPriorityMessage = 0;
          int v31 = im_primary_queue();
          dispatch_async(v31, &stru_100983860);

          objc_super v32 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1001460F8;
          block[3] = &unk_10097E4D0;
          block[4] = self;
          dispatch_async(v32, block);

          goto LABEL_17;
        }
        id v12 = [(IDSUTunControlChannel *)self identityPair];
        id v13 = v4;
        if (![v13 length])
        {
          int v21 = 0;
          NSUInteger v17 = 0;
          BOOL v19 = 0;
LABEL_39:

          id v7 = v17;
          if (v21) {
            uint64_t v25 = 250;
          }
          else {
            uint64_t v25 = 201;
          }
          v6 = "default paired PK";
          if (v19) {
            goto LABEL_12;
          }
          goto LABEL_43;
        }
        IMTimingStartTimingForKey();
        unint64_t v14 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "   UTUNControlChannel Encrypting {identityPair: %{private}@}", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v52 = v12;
          _IDSLogV();
        }
        id v15 = objc_msgSend(v12, "remotePublicIdentity", v52);
        int v16 = [v12 localFullIdentity];
        id v69 = 0;
        NSUInteger v17 = [v15 signAndProtectData:v13 withSigner:v16 error:&v69];
        id v18 = v69;

        BOOL v19 = v17 != 0;
        if (v17)
        {
          id v20 = v17;
        }
        else
        {
          id v33 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v18;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "   Public/Private encryption failed with error: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v52 = v18;
            _IDSLogV();
          }
          if (v18 && [v18 code] == (id)-25304)
          {
            v34 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              _IDSLogTransport();
            }
            IMLogBacktrace();
            int v21 = 1;
            goto LABEL_29;
          }
        }
        int v21 = 0;
LABEL_29:
        IMTimingStopTimingForKey();

        goto LABEL_39;
      }
      int v22 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int sd = self->_sd;
        BOOL sendSuspended = self->_sendSuspended;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = sd;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = sendSuspended;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "control channel suspending {socket:%d} (%d) awaiting default paired encryption negotiation", buf, 0xEu);
      }

      if (!self->_sendSuspended)
      {
        self->_BOOL sendSuspended = 1;
        IDSTransportThreadSuspendSocket();
      }
    }
  }
}

- (void)sendMessage:(id)a3
{
  if (a3)
  {
    id v4 = [a3 copy];
    [(NSMutableArray *)self->_outgoingMessages addObject:v4];
    [(IDSUTunControlChannel *)self _checkSendNewMessage];
  }
}

- (void)sendPriorityMessage:(id)a3
{
  if (a3)
  {
    id v4 = [a3 copy];
    [(NSMutableArray *)self->_outgoingPriorityMessages addObject:v4];
    [(IDSUTunControlChannel *)self _checkSendNewMessage];
  }
}

- (void)invalidate
{
  [(IDSUTunControlChannel *)self _destroyFairplayDeviceSession];
  [(IDSUTunControlChannel *)self _destroyFairplayHostSession];
  [(IDSUTunControlChannel *)self _cleanupConnection];
  id receiveHandler = self->_receiveHandler;
  if (receiveHandler)
  {
    self->_id receiveHandler = 0;
  }
}

- (void)dealloc
{
  [(IDSUTunControlChannel *)self _cleanupConnection];
  v3.receiver = self;
  v3.super_class = (Class)IDSUTunControlChannel;
  [(IDSUTunControlChannel *)&v3 dealloc];
}

- (id)_utunControlMessageFairplayDeviceInfo
{
  return 0;
}

- (id)_utunControlMessageFairplayHostSessionInfo:(unsigned __int8)a3 deviceType:(unsigned __int8)a4 protocolVersion:(unsigned int)a5
{
  unsigned int v15 = 0;
  uint64_t v14 = 0;
  unsigned int v13 = 0;
  v16[0] = a3;
  v16[1] = a4;
  v16[2] = a5;
  [(IDSUTunControlChannel *)self _destroyFairplayHostSession];
  sub_1005B76B8((uint64_t)v16, (uint64_t)&v15, &v14, (uint64_t)&v13);
  if (v6)
  {
    unsigned int v7 = v6;
    id v8 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "GrappaHostInit failed with error %d.", buf, 8u);
    }

    if (v14) {
      sub_10059D65C(v14);
    }
    [(IDSUTunControlChannel *)self _handleFairplayAuthenticationFailure];
    id v9 = 0;
  }
  else
  {
    self->_grappaHostSessionID = v15;
    uint64_t v10 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v18 = v15;
      __int16 v19 = 1024;
      unsigned int v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "GrappaHostInit succeeded with hostSessionID %08x, hostSessionInfoRequest (%uB)", buf, 0xEu);
    }

    char v12 = 7;
    *(_DWORD *)buf = bswap32(v13);
    id v9 = objc_alloc_init((Class)NSMutableData);
    [v9 appendBytes:&v12 length:1];
    [v9 appendBytes:buf length:4];
    [v9 appendBytes:v14 length:v13];
    if (v14) {
      sub_10059D65C(v14);
    }
  }

  return v9;
}

- (id)_utunControlMessageFairplayDeviceSessionInfo:(char *)a3 grappaDeviceSessionInfoSize:(unsigned int)a4
{
  return 0;
}

- (BOOL)processFairplayHostSessionInfo:(id)a3
{
  return 1;
}

- (BOOL)processFairplayDeviceInfo:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    *(void *)unsigned int v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "got control message: FairplayDeviceInfo %@", (uint8_t *)&v19, 0xCu);
  }

  id v6 = [v4 length];
  id v7 = v4;
  id v8 = (unsigned __int8 *)[v7 bytes];
  if (v6 == (id)7)
  {
    uint64_t v9 = v8[1];
    uint64_t v10 = v8[2];
    unsigned int v11 = bswap32(*(_DWORD *)(v8 + 3));
    char v12 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109632;
      *(_DWORD *)unsigned int v20 = v9;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v11;
      LOWORD(v21) = 1024;
      *(_DWORD *)((char *)&v21 + 2) = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "recv FairplayDeviceInfo:(version=%u, deviceType=%u, protocolVersion=%u)", (uint8_t *)&v19, 0x14u);
    }

    unsigned int v13 = +[IDSDevicePolicyController sharedInstance];
    [v13 startFairplayAuthenticationForDeviceWithCbuuid:self->_cbuuid];

    uint64_t v14 = [(IDSUTunControlChannel *)self _utunControlMessageFairplayHostSessionInfo:v9 deviceType:v11 protocolVersion:v10];
    unsigned int v15 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v14 length];
      int v19 = 134218242;
      *(void *)unsigned int v20 = v16;
      *(_WORD *)&v20[8] = 2112;
      int v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "send FairplayHostSessionInfo (%luB):%@", (uint8_t *)&v19, 0x16u);
    }

    [(IDSUTunControlChannel *)self sendMessage:v14];
  }
  else
  {
    NSUInteger v17 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134217984;
      *(void *)unsigned int v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "UTCMType_FairplayDeviceInfo has invalid data length (%lu)", (uint8_t *)&v19, 0xCu);
    }

    [(IDSUTunControlChannel *)self _handleFairplayAuthenticationFailure];
  }

  return v6 == (id)7;
}

- (BOOL)processFairplayDeviceSessionInfo:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    v26[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "got control message: FairplayDeviceSessionInfo %@", (uint8_t *)&v25, 0xCu);
  }

  id v6 = [v4 length];
  id v7 = v4;
  id v8 = (char *)[v7 bytes];
  if ((unint64_t)v6 <= 4)
  {
    uint64_t v9 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 134217984;
      v26[0] = v6;
      uint64_t v10 = "UTCMType_FairplayHostInfo has invalid data length (%lu)";
      unsigned int v11 = v9;
      uint32_t v12 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v25, v12);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  uint64_t v13 = bswap32(*(_DWORD *)(v8 + 1));
  unsigned __int16 v14 = v13 + 5;
  if (v6 != (id)(unsigned __int16)(v13 + 5))
  {
    uint64_t v9 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 67109376;
      LODWORD(v26[0]) = v6;
      WORD2(v26[0]) = 1024;
      *(_DWORD *)((char *)v26 + 6) = v14;
      uint64_t v10 = "invalid message size for UTCMType_FairplayDeviceSessionInfo (%u != %u)";
      unsigned int v11 = v9;
      uint32_t v12 = 14;
      goto LABEL_15;
    }
LABEL_16:

    [(IDSUTunControlChannel *)self _handleFairplayAuthenticationFailure];
    BOOL v19 = 0;
    goto LABEL_21;
  }
  uint64_t v15 = (uint64_t)(v8 + 5);
  id v16 = +[NSData dataWithBytes:v8 + 5 length:v13];
  NSUInteger v17 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 67109378;
    LODWORD(v26[0]) = v13;
    WORD2(v26[0]) = 2112;
    *(void *)((char *)v26 + 6) = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "recv FairplayDeviceSessionInfo (%uB):%@", (uint8_t *)&v25, 0x12u);
  }

  sub_10059D2B0(self->_grappaHostSessionID, v15, v13);
  BOOL v19 = v18 == 0;
  if (v18)
  {
    int v20 = v18;
    int v21 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 67109120;
      LODWORD(v26[0]) = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "GrappaHostEstablishKey failed with error %d", (uint8_t *)&v25, 8u);
    }

    [(IDSUTunControlChannel *)self _handleFairplayAuthenticationFailure];
  }
  else
  {
    self->_fairplayAuthState = 2;
    int v22 = +[IDSDevicePolicyController sharedInstance];
    [v22 endFairplayAuthenticationForDeviceWithCbuuid:self->_cbuuid];

    v23 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Grappa authentication is complete on host.", (uint8_t *)&v25, 2u);
    }
  }
LABEL_21:

  return v19;
}

- (void)_handleFairplayAuthenticationFailure
{
  objc_super v3 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handle Fairplay authentication failure...", v4, 2u);
  }

  [(IDSUTunControlChannel *)self _cancelConnectionAndResetDataConnections:1 shouldObliterate:1 encryptionFailure:0 shouldTriggerCorruptionRecovery:0];
}

- (void)_destroyFairplayHostSession
{
  if (self->_grappaHostSessionID)
  {
    objc_super v3 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int grappaHostSessionID = self->_grappaHostSessionID;
      v5[0] = 67109120;
      v5[1] = grappaHostSessionID;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_destroyFairplayHostSession %08x", (uint8_t *)v5, 8u);
    }

    sub_10059C844(self->_grappaHostSessionID);
    self->_unsigned int grappaHostSessionID = 0;
  }
}

- (void)sendOTRNegotiationMessage:(id)a3 negotiationCount:(unsigned int)a4 negotiationData:(id)a5
{
  id v8 = a3;
  if (v8 && a5)
  {
    id v9 = a5;
    uint64_t v10 = _IDSLinkPacketBufferCreate();
    *(_WORD *)(v10 + 1297) = 266;
    id v11 = v8;
    uint32_t v12 = (const char *)[v11 UTF8String];
    if (v12)
    {
      uint64_t v13 = v12;
      unsigned int v14 = strlen(v12);
      *(_WORD *)(v10 + 1299) = bswap32(v14) >> 16;
      uint64_t v15 = (unsigned __int16)v14;
      if ((_WORD)v14) {
        memcpy((void *)(v10 + 1301), v13, (unsigned __int16)v14);
      }
    }
    else
    {
      uint64_t v15 = 0;
      *(_WORD *)(v10 + 1299) = 0;
    }
    id v16 = (char *)(v10 + v15);
    uint64_t v17 = v10 + v15 + 1301;
    *(_DWORD *)uint64_t v17 = bswap32(a4);
    unsigned int v18 = [v9 length];
    unsigned __int16 v19 = v18;
    *(_WORD *)(v17 + 4) = bswap32(v18) >> 16;
    v16 += 1307;
    id v20 = v9;
    id v21 = [v20 bytes];

    memcpy(v16, v21, v19);
    int v22 = +[NSData dataWithBytes:v10 + 1297 length:&v16[v19 - 1297 - v10]];
    _IDSLinkPacketBufferRelease();
    v23 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134218498;
      id v25 = [v22 length];
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 1024;
      unsigned int v29 = a4;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "send control message: OTRNegotiationData (%luB) for %@, count:%08x", (uint8_t *)&v24, 0x1Cu);
    }

    [(IDSUTunControlChannel *)self sendMessage:v22];
  }
}

- (BOOL)processOTRNegotiationMessage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_34;
  }
  id v5 = v3;
  id v6 = (unsigned __int8 *)[v5 bytes];
  unsigned __int16 v7 = (unsigned __int16)[v5 length];
  int v8 = v7;
  if (v7 <= 3u)
  {
    id v9 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 67109120;
      int v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "processOTRNegotiationMessage: totalLength: %u, less than 4", (uint8_t *)&v27, 8u);
    }
LABEL_5:

LABEL_34:
    BOOL v24 = 0;
    goto LABEL_35;
  }
  int v10 = v6[1];
  if (v10 != 1)
  {
    id v9 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 67109120;
      int v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "got control message: invalid OTR version number: %d.", (uint8_t *)&v27, 8u);
    }
    goto LABEL_5;
  }
  id v11 = v6 + 2;
  uint64_t v12 = __rev16(*((unsigned __int16 *)v6 + 1));
  unsigned int v13 = v7 - 4;
  if (v12) {
    BOOL v14 = v13 >= v12;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    id v17 = [objc_alloc((Class)NSString) initWithBytes:v6 + 4 length:v12 encoding:4];
    if (!v17)
    {
      id v25 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "control message: OTRNegotiation cannot decode token", (uint8_t *)&v27, 2u);
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
      goto LABEL_34;
    }
    uint64_t v15 = v17;
    id v11 = &v6[v12 + 4];
    unint64_t v16 = (int)(v13 - v12);
  }
  else
  {
    uint64_t v15 = 0;
    unint64_t v16 = v7 - 2;
  }
  if (v16 <= 5)
  {
    unsigned int v18 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 67109376;
      int v28 = v7;
      __int16 v29 = 2048;
      unint64_t v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "processOTRNegotiationMessage: totalLength: %u, dataBytesLeft: %lu", (uint8_t *)&v27, 0x12u);
    }
LABEL_20:

    goto LABEL_34;
  }
  if (&v11[(bswap32(*((unsigned __int16 *)v11 + 2)) >> 16) + 6] > &v6[v7])
  {
    unsigned int v18 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "control message: OTRNegotiation cannot decode negotiation data", (uint8_t *)&v27, 2u);
    }
    goto LABEL_20;
  }
  unsigned int v19 = *(_DWORD *)v11;
  id v20 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
  id v21 = +[IDSFoundationLog utunController];
  uint64_t v22 = bswap32(v19);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 67109634;
    int v28 = v8;
    __int16 v29 = 2112;
    unint64_t v30 = (unint64_t)v15;
    __int16 v31 = 1024;
    int v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "got control message: OTRNegotiationData (%uB) for %@, count:%08x", (uint8_t *)&v27, 0x18u);
  }

  v23 = +[IDSOTRController sharedInstance];
  [v23 processNegotiationData:v20 deviceUniqueID:IDSDeviceDefaultPairedDeviceUniqueID token:v15 negotiationCount:v22];

  BOOL v24 = 1;
LABEL_35:

  return v24;
}

- (void)sendSuspendOTRNegotiationMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _IDSLinkPacketBufferCreate();
    *(_WORD *)(v5 + 1297) = 268;
    id v6 = v4;
    unsigned __int16 v7 = (const char *)[v6 UTF8String];
    if (v7)
    {
      int v8 = v7;
      unsigned int v9 = strlen(v7);
      *(_WORD *)(v5 + 1299) = bswap32(v9) >> 16;
      uint64_t v10 = (unsigned __int16)v9;
      if ((_WORD)v9) {
        memcpy((void *)(v5 + 1301), v8, (unsigned __int16)v9);
      }
    }
    else
    {
      uint64_t v10 = 0;
      *(_WORD *)(v5 + 1299) = 0;
    }
    id v11 = +[NSData dataWithBytes:v5 + 1297 length:v10 + 4];
    _IDSLinkPacketBufferRelease();
    uint64_t v12 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      id v14 = [v11 length];
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "send control message: SuspendOTRNegotiationData (%luB) for %@", (uint8_t *)&v13, 0x16u);
    }

    [(IDSUTunControlChannel *)self sendMessage:v11];
  }
}

- (BOOL)processSuspendOTRNegotiationMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  id v6 = v4;
  unsigned __int16 v7 = (unsigned __int8 *)[v6 bytes];
  unsigned __int16 v8 = (unsigned __int16)[v6 length];
  int v9 = v7[1];
  if (v9 != 1)
  {
    __int16 v15 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109120;
      int v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "got control message: SuspendOTRNegotiationData, invalid OTR version number: %d.", (uint8_t *)&v18, 8u);
    }

    goto LABEL_13;
  }
  int v10 = v8;
  if ((v8 & 0xFFFE) != 2)
  {
    uint64_t v11 = __rev16(*((unsigned __int16 *)v7 + 1));
    if (v11)
    {
      if (v8 - 4 >= (int)v11)
      {
        id v12 = [objc_alloc((Class)NSString) initWithBytes:v7 + 4 length:v11 encoding:4];
        if (v12) {
          goto LABEL_7;
        }
        id v17 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "control message: OTRNegotiation cannot decode token", (uint8_t *)&v18, 2u);
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
LABEL_13:
        BOOL v14 = 0;
        goto LABEL_14;
      }
    }
  }
  id v12 = 0;
LABEL_7:
  int v13 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 67109378;
    int v19 = v10;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "got control message: SuspendOTRNegotiationData (%uB) for %@", (uint8_t *)&v18, 0x12u);
  }

  [(IDSUTunControlChannel *)self suspendOTRNegotiation:v12];
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (void)suspendOTRNegotiation:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSOTRController sharedInstance];
  [v4 suspendSessionNegotiation:v3 askedByPairedDevice:1];
}

- (void)resumeOTRNegotiation
{
  id v2 = +[IDSOTRController sharedInstance];
  [v2 resumeSessionNegotiation];
}

- (BOOL)isReadyForEncrypting
{
  return self->_isReadyForEncrypting;
}

- (void)setIsReadyForEncrypting:(BOOL)a3
{
  self->_BOOL isReadyForEncrypting = a3;
}

- (BOOL)isDefaultPairedDevicePairedLocally
{
  return self->_isDefaultPairedDevicePairedLocally;
}

- (void)setIsDefaultPairedDevicePairedLocally:(BOOL)a3
{
  self->_BOOL isDefaultPairedDevicePairedLocally = a3;
}

- (BOOL)isDefaultPairedDevicePairedRemotely
{
  return self->_isDefaultPairedDevicePairedRemotely;
}

- (void)setIsDefaultPairedDevicePairedRemotely:(BOOL)a3
{
  self->_BOOL isDefaultPairedDevicePairedRemotely = a3;
}

- (BOOL)disableEncryption
{
  return self->_disableEncryption;
}

- (void)setDisableEncryption:(BOOL)a3
{
  self->_disableEncryption = a3;
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (NSDictionary)remoteDeviceEncryptionInfo
{
  return self->_remoteDeviceEncryptionInfo;
}

- (void)setRemoteDeviceEncryptionInfo:(id)a3
{
}

- (BOOL)didReceiveReestablishmentRequest
{
  return self->_didReceiveReestablishmentRequest;
}

- (void)setDidReceiveReestablishmentRequest:(BOOL)a3
{
  self->_didReceiveReestablishmentRequest = a3;
}

- (double)reestablishmentRequestReceiveTime
{
  return self->_reestablishmentRequestReceiveTime;
}

- (void)setReestablishmentRequestReceiveTime:(double)a3
{
  self->_reestablishmentRequestReceiveTime = a3;
}

- (BOOL)checksumEnabled
{
  return self->_checksumEnabled;
}

- (void)setChecksumEnabled:(BOOL)a3
{
  self->_checksumEnabled = a3;
}

- (BOOL)avoidMainQueueOverrideToNO
{
  return self->_avoidMainQueueOverrideToNO;
}

- (void)setAvoidMainQueueOverrideToNO:(BOOL)a3
{
  self->_avoidMainQueueOverrideToNO = a3;
}

- (IDSUTunControlChannelIdentityPair)identityPair
{
  return self->_identityPair;
}

- (void)setIdentityPair:(id)a3
{
}

- (IDSStallDetector)outgoingStallDetector
{
  return self->_outgoingStallDetector;
}

- (void)setOutgoingStallDetector:(id)a3
{
}

- (BOOL)connecting
{
  return self->_connecting;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceEncryptionInfo, 0);
  objc_storeStrong((id *)&self->_canceledConnection, 0);
  objc_storeStrong((id *)&self->_outgoingStallDetector, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_identityPair, 0);
  objc_storeStrong((id *)&self->_outgoingPriorityMessages, 0);
  objc_storeStrong((id *)&self->_outgoingMessages, 0);
  objc_storeStrong((id *)&self->_pendingDataSend, 0);
  objc_storeStrong((id *)&self->_pendingDataReceive, 0);
  objc_storeStrong(&self->_receiveHandler, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);

  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
}

@end