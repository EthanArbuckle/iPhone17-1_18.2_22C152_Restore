@interface IDSUDPGlobalLink
- (BOOL)_processStunBindingRequest:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8;
- (BOOL)_processStunBindingResponse:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8;
- (BOOL)_processStunDataIndication:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8 packetBuffer:(id *)a9 fromDeviceUniqueID:(id)a10 cbuuid:(id)a11;
- (BOOL)_processStunEchoRequest:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8;
- (BOOL)_processStunEchoResponse:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8;
- (BOOL)_processStunPacket:(id *)a3 fromDevice:(id)a4 arrivalTime:(double)a5 fromDeviceUniqueID:(id)a6 cbuuid:(id)a7;
- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (BOOL)remoteHostAwake;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (IDSUDPGlobalLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkTypeString;
- (NSString)localPartyID;
- (NSString)remotePartyID;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)_createSimpleConnectionData;
- (void)_forwardPacketBuffer:(id *)a3 fromDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)_handleEchoTimer;
- (void)_sendConnectionCheckRequest;
- (void)_sendNominateRequest;
- (void)_startConnectionEcho:(double)a3;
- (void)_startEchoTimer;
- (void)_stopEchoTimer;
- (void)_updateLinkTransportAddress:(unsigned int)a3 localAddress:(sockaddr *)a4 remoteAddress:(sockaddr *)a5;
- (void)createConnectionData:(id)a3 dataReadyHandler:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)processRemoteConnectionData:(id)a3 completionHandler:(id)a4;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setLocalPartyID:(id)a3;
- (void)setRemotePartyID:(id)a3;
- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6;
@end

@implementation IDSUDPGlobalLink

- (IDSUDPGlobalLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IDSUDPGlobalLink;
  v9 = [(IDSUDPGlobalLink *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cbuuid, a4);
    objc_storeStrong((id *)&v10->_deviceUniqueID, a3);
    v11 = (IDSUDPLink *)[objc_alloc((Class)IDSUDPLink) initWithDeviceUniqueID:v7 cbuuid:v8];
    udpLink = v10->_udpLink;
    v10->_udpLink = v11;

    [(IDSUDPLink *)v10->_udpLink setDelegate:v10];
    v21[0] = 0xAAAAAAAAAAAAAAAALL;
    v21[1] = 0xAAAAAAAAAAAAAAAALL;
    id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10->_cbuuid];
    [v13 getUUIDBytes:v21];

    uint64_t v14 = +[NSData dataWithBytes:v21 length:16];
    keyData = v10->_keyData;
    v10->_keyData = (NSData *)v14;

    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    remoteAddressArray = v10->_remoteAddressArray;
    v10->_remoteAddressArray = v16;

    sub_1000CEA7C((uint64_t)&v10->_sockAddrPairTable, 16);
    sub_1000D0D7C((char *)&v10->_sockAddrPairTable, [(NSData *)v10->_keyData bytes], [(NSData *)v10->_keyData length]);
    v10->_state = 0;
    ids_monotonic_time();
    v10->_previousReportTime = v18;
  }

  return v10;
}

- (void)dealloc
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc UDPGlobalLink %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  sub_1000CEB88(&self->_sockAddrPairTable.iNumPair);
  v4.receiver = self;
  v4.super_class = (Class)IDSUDPGlobalLink;
  [(IDSUDPGlobalLink *)&v4 dealloc];
}

- (void)invalidate
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidate UDPGlobalLink", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  nominateBlocks = self->_nominateBlocks;
  self->_nominateBlocks = 0;

  [(IDSUDPGlobalLink *)self _stopEchoTimer];
  [(IDSUDPLink *)self->_udpLink invalidate];
  self->_isInvalidated = 1;
}

- (void)createConnectionData:(id)a3 dataReadyHandler:(id)a4
{
  v6 = (char *)a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "createConnectionData - localPartyID=%@", buf, 0xCu);
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
  unint64_t state = self->_state;
  if (state)
  {
    if (state > 6) {
      v10 = "UnexpectedState";
    }
    else {
      v10 = (const char *)_IDSLinkStateStrings[state];
    }
    id v13 = +[NSString stringWithFormat:@"invalid link state %s", v10];
    uint64_t v14 = +[NSDictionary dictionaryWithObject:v13 forKey:NSLocalizedDescriptionKey];
    v15 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8002 userInfo:v14];

    v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v17 = self->_state;
      if (v17 > 6) {
        double v18 = "UnexpectedState";
      }
      else {
        double v18 = (const char *)_IDSLinkStateStrings[v17];
      }
      *(_DWORD *)buf = 136315138;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "invalid link state %s", buf, 0xCu);
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
    if (v7)
    {
      v19 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10016A2B0;
      block[3] = &unk_10097E818;
      id v22 = v7;
      id v21 = v15;
      dispatch_async(v19, block);
    }
  }
  else
  {
    [(IDSUDPGlobalLink *)self setLocalPartyID:v6];
    id v11 = [v7 copy];
    id dataReadyHandler = self->_dataReadyHandler;
    self->_id dataReadyHandler = v11;

    [(IDSUDPGlobalLink *)self _createSimpleConnectionData];
    self->_unint64_t state = 2;
  }
}

- (void)processRemoteConnectionData:(id)a3 completionHandler:(id)a4
{
  v76 = self;
  id v75 = a3;
  id v74 = a4;
  v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v101 = v75;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "processRemoteConnectionData %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v64 = v75;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v64 = v75;
        _IDSLogV();
      }
    }
  }
  id v6 = [v74 copy];
  id completionHandler = v76->_completionHandler;
  v76->_id completionHandler = v6;

  if (!v75)
  {
    v16 = +[NSDictionary dictionaryWithObject:@"invalid remote connection data" forKey:NSLocalizedDescriptionKey];
    id v13 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8003 userInfo:v16];

    unint64_t v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "invalid remote connection data", buf, 2u);
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
    if (v76->_completionHandler)
    {
      double v18 = im_primary_queue();
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_10016B440;
      v96[3] = &unk_10097E440;
      v96[4] = v76;
      id v13 = v13;
      id v97 = v13;
      dispatch_async(v18, v96);
    }
    id v11 = @"invalid remote connection data";
    goto LABEL_121;
  }
  unint64_t state = v76->_state;
  if (state != 2)
  {
    if (state > 6) {
      v19 = "UnexpectedState";
    }
    else {
      v19 = (const char *)_IDSLinkStateStrings[state];
    }
    id v11 = +[NSString stringWithFormat:@"invalid link state %s", v19];
    objc_super v20 = +[NSDictionary dictionaryWithObject:v11 forKey:NSLocalizedDescriptionKey];
    id v13 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8002 userInfo:v20];

    id v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v22 = v76->_state;
      if (v22 > 6) {
        v23 = "UnexpectedState";
      }
      else {
        v23 = (const char *)_IDSLinkStateStrings[v22];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)v101 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "invalid link state %s", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      unint64_t v56 = v76->_state;
      v57 = v56 > 6 ? "UnexpectedState" : (char *)_IDSLinkStateStrings[v56];
      id v64 = v57;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        unint64_t v58 = v76->_state;
        if (v58 > 6) {
          v59 = "UnexpectedState";
        }
        else {
          v59 = (const char *)_IDSLinkStateStrings[v58];
        }
        id v64 = (id)v59;
        _IDSLogV();
      }
    }
    if (v76->_completionHandler)
    {
      v63 = im_primary_queue();
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472;
      v94[2] = sub_10016B454;
      v94[3] = &unk_10097E440;
      v94[4] = v76;
      id v13 = v13;
      id v95 = v13;
      dispatch_async(v63, v94);
    }
    goto LABEL_121;
  }
  id v9 = v75;
  v73 = (unsigned __int8 *)[v9 bytes];
  id v10 = [v9 length];
  if ((unint64_t)v10 <= 1)
  {
    id v11 = +[NSString stringWithFormat:@"invalid remote connection data, %uB", v10];
    v12 = +[NSDictionary dictionaryWithObject:v11 forKey:NSLocalizedDescriptionKey];
    id v13 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8003 userInfo:v12];

    uint64_t v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v101 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "invalid remote connection data, %uB", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v64 = v10;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v64 = v10;
          _IDSLogV();
        }
      }
    }
    if (v76->_completionHandler)
    {
      v15 = im_primary_queue();
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_10016B468;
      v92[3] = &unk_10097E440;
      v92[4] = v76;
      id v13 = v13;
      id v93 = v13;
      dispatch_async(v15, v92);
    }
    goto LABEL_121;
  }
  v24 = (void *)*v73;
  if (v24 >= 2)
  {
    id v11 = +[NSString stringWithFormat:@"connection data has unsupported version %d", *v73];
    v25 = +[NSDictionary dictionaryWithObject:v11 forKey:NSLocalizedDescriptionKey];
    id v13 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8004 userInfo:v25];

    v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v101 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "connection data has unsupported version %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v64 = v24;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v64 = v24;
          _IDSLogV();
        }
      }
    }
    if (v76->_completionHandler)
    {
      v27 = im_primary_queue();
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10016B47C;
      v90[3] = &unk_10097E440;
      v90[4] = v76;
      id v13 = v13;
      id v91 = v13;
      dispatch_async(v27, v90);
    }
    goto LABEL_121;
  }
  unsigned int v28 = v73[1];
  id v71 = [(IDSUDPLink *)v76->_udpLink copyCurrentNetworkInterfaces];
  v66[1] = v66;
  __chkstk_darwin(v71, v29);
  v69 = &v64;
  id v64 = (id)0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (v28 < 0x10) {
    goto LABEL_107;
  }
  int v31 = 0;
  int v82 = 0;
  p_sockAddrPairTable = &v76->_sockAddrPairTable;
  uint64_t v68 = v28 >> 4;
  if (v28 >> 4 <= 1) {
    int v32 = 1;
  }
  else {
    int v32 = v28 >> 4;
  }
  int v70 = v32;
  *(void *)&long long v30 = 67109890;
  long long v67 = v30;
  *(void *)&long long v30 = 138412546;
  long long v79 = v30;
  do
  {
    unsigned int v33 = *((unsigned __int16 *)v73 + 3);
    v73 += 6;
    unsigned int v34 = bswap32(*((_DWORD *)v73 - 1));
    unsigned int v35 = bswap32(v33) >> 16;
    int v72 = v31;
    v36 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = IPv4ToString();
      *(_DWORD *)buf = v67;
      *(_DWORD *)v101 = v31 + 1;
      *(_WORD *)&v101[4] = 1024;
      *(_DWORD *)&v101[6] = v68;
      *(_WORD *)v102 = 2080;
      *(void *)&v102[2] = v37;
      __int16 v103 = 1024;
      unsigned int v104 = v35;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "connection data has IPv4 address (%d/%d) [%s:%u]", buf, 0x1Eu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        IPv4ToString();
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          IPv4ToString();
          _IDSLogV();
        }
      }
    }
    v99[0] = 0xAAAAAAAAAAAAAAAALL;
    v99[1] = 0xAAAAAAAAAAAAAAAALL;
    int v89 = 16;
    IPPortToSA4();
    v38 = +[IDSSockAddrWrapper wrapperWithSockAddr:](IDSSockAddrWrapper, "wrapperWithSockAddr:", v99, v64, v65);
    [(NSMutableArray *)v76->_remoteAddressArray addObject:v38];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v39 = v71;
    id v40 = [v39 countByEnumeratingWithState:&v85 objects:v98 count:16];
    if (v40)
    {
      uint64_t v41 = 0;
      uint64_t v42 = *(void *)v86;
      BOOL v44 = HIBYTE(v34) == 10 || (v34 & 0xFFF00000) == -1408237568;
      unsigned int v77 = v34 & 0xFFFF0000;
      int v45 = (v34 & 0xFFFF0000) == 0xC0A80000 || v44;
      int v80 = v45;
      BOOL v81 = v44;
      for (uint64_t i = v42; ; uint64_t i = *(void *)v86)
      {
        if (i != v42) {
          objc_enumerationMutation(v39);
        }
        v47 = *(void **)(*((void *)&v85 + 1) + 8 * v41);
        v48 = [v47 address];
        v49 = (unsigned __int8 *)[v48 sa4];
        unsigned int v50 = bswap32(*((_DWORD *)v49 + 1));
        if (HIBYTE(v50) == 10 || (v50 & 0xFFF00000) == -1408237568)
        {
          if ((v80 & 1) == 0) {
            goto LABEL_83;
          }
        }
        else
        {
          unsigned int v54 = v50 & 0xFFFF0000;
          if (v81)
          {
            if (v54 != -1062731776) {
              goto LABEL_83;
            }
          }
          else if ((v77 == -1062731776) != (v54 == -1062731776))
          {
LABEL_83:
            v55 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v79;
              *(void *)v101 = v48;
              *(_WORD *)&v101[8] = 2112;
              *(void *)v102 = v38;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "skip address pair [%@-%@].", buf, 0x16u);
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
            goto LABEL_89;
          }
        }
        v52 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v79;
          *(void *)v101 = v48;
          *(_WORD *)&v101[8] = 2112;
          *(void *)v102 = v38;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "add address pair [%@-%@]", buf, 0x16u);
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
        int v53 = [v47 index];
        sub_1000CEC70(&p_sockAddrPairTable->iNumPair, v53, v49, (unsigned __int8 *)v99, 1, 0, 0);
        ++v82;
LABEL_89:

        if (++v41 >= (unint64_t)v40)
        {
          id v40 = [v39 countByEnumeratingWithState:&v85 objects:v98 count:16];
          if (!v40) {
            break;
          }
          uint64_t v41 = 0;
        }
      }
    }

    int v31 = v72 + 1;
  }
  while (v72 + 1 != v70);
  if (v82)
  {
    [(IDSUDPGlobalLink *)v76 _sendConnectionCheckRequest];
    id v11 = 0;
    id v13 = 0;
    goto LABEL_116;
  }
LABEL_107:
  v60 = +[NSDictionary dictionaryWithObject:@"No addresss pair is on same network, cannot connect.", NSLocalizedDescriptionKey, v64 forKey];
  id v13 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8005 userInfo:v60];

  v61 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "No addresss pair is on same network, cannot connect.", buf, 2u);
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
  if (v76->_completionHandler)
  {
    v62 = im_primary_queue();
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10016B490;
    v83[3] = &unk_10097E440;
    v83[4] = v76;
    id v13 = v13;
    id v84 = v13;
    dispatch_async(v62, v83);
  }
  id v11 = @"No addresss pair is on same network, cannot connect.";
LABEL_116:

LABEL_121:
}

- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = (void (**)(void))a3;
  unsigned int v35 = v10;
  id v36 = a5;
  if (v10)
  {
    unsigned int v34 = self;
    id v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v12 = @"NO";
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v10;
      if (v8) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[12] = 2112;
      if (v6) {
        CFStringRef v12 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v36;
      LOWORD(v46) = 2112;
      *(void *)((char *)&v46 + 2) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "startConnectionForDevice - deviceID=%@ isInitiator=%@ remotePartyID=%@ stunMICheck=%@", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v14 = v8 ? @"YES" : @"NO";
      v15 = v6 ? @"YES" : @"NO";
      id v32 = v36;
      unsigned int v33 = v15;
      long long v30 = v35;
      int v31 = v14;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v32 = v36;
        unsigned int v33 = v15;
        long long v30 = v35;
        int v31 = v14;
        _IDSLogV();
      }
    }
    self->_useStunMICheck = v6;
    if (!v8)
    {
      [(IDSUDPGlobalLink *)self _sendNominateRequest];
      goto LABEL_49;
    }
    if (v36)
    {
      -[IDSUDPGlobalLink setRemotePartyID:](self, "setRemotePartyID:");
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v16 = self->_nominateBlocks;
      id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v16);
            }
            objc_super v20 = *(void (***)(void))(*((void *)&v38 + 1) + 8 * i);
            id v21 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v22 = objc_retainBlock(v20);
              *(_DWORD *)buf = 134217984;
              *(void *)&uint8_t buf[4] = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "process delayed nomination request block %p.", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                long long v30 = objc_retainBlock(v20);
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  long long v30 = objc_retainBlock(v20);
                  _IDSLogV();
                }
              }
            }
            v20[2](v20);
          }
          id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v52 count:16];
        }
        while (v17);
      }

      nominateBlocks = v34->_nominateBlocks;
      v34->_nominateBlocks = 0;

      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v50 = v24;
      long long v51 = v24;
      long long v48 = v24;
      long long v49 = v24;
      long long v46 = v24;
      long long v47 = v24;
      *(_OWORD *)buf = v24;
      *(_OWORD *)&buf[16] = v24;
      v44[6] = v24;
      v44[7] = v24;
      v44[4] = v24;
      v44[5] = v24;
      v44[3] = v24;
      v44[1] = v24;
      v44[2] = v24;
      v44[0] = v24;
      unsigned int v37 = 0;
      v25 = (char *)[v36 UTF8String];
      int v26 = strlen(v25);
      if (sub_1000CFDEC((uint64_t)&v34->_sockAddrPairTable, v25, v26, &v37, buf, v44))
      {
        v27 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v42 = 136315138;
          v43 = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Nominated connection matches remotePartyID %s.", v42, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            long long v30 = (void (**)(void))v25;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              long long v30 = (void (**)(void))v25;
              _IDSLogV();
            }
          }
        }
        -[IDSUDPGlobalLink _updateLinkTransportAddress:localAddress:remoteAddress:](v34, "_updateLinkTransportAddress:localAddress:remoteAddress:", v37, buf, v44, v30, v31, v32, v33);
      }
      goto LABEL_49;
    }
    uint64_t v29 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "startConnectionForDevice failed due to invalid remotePartyID=%@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
LABEL_47:
        }
          _IDSLogV();
      }
    }
  }
  else
  {
    unsigned int v28 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "startConnectionForDevice failed due to invalid deviceID=%@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          goto LABEL_47;
        }
      }
    }
  }
LABEL_49:
}

- (void)_createSimpleConnectionData
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[29] = v2;
  *(_OWORD *)unsigned int v37 = v2;
  v36[27] = v2;
  v36[28] = v2;
  v36[25] = v2;
  v36[26] = v2;
  v36[23] = v2;
  v36[24] = v2;
  v36[21] = v2;
  v36[22] = v2;
  v36[19] = v2;
  v36[20] = v2;
  v36[17] = v2;
  v36[18] = v2;
  v36[16] = v2;
  *(_OWORD *)&v37[15] = v2;
  v36[15] = v2;
  v36[14] = v2;
  v36[13] = v2;
  v36[12] = v2;
  v36[11] = v2;
  v36[10] = v2;
  v36[9] = v2;
  v36[8] = v2;
  v36[7] = v2;
  v36[6] = v2;
  v36[5] = v2;
  v36[4] = v2;
  v36[3] = v2;
  v36[2] = v2;
  v36[1] = v2;
  v36[0] = v2;
  char v35 = 1;
  id v3 = [(IDSUDPLink *)self->_udpLink newSocketWithIPVersion:0 wantsAWDL:0 wantsWiFi:1 wantsCellular:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    BOOL v6 = (char *)v36 + 1;
    uint64_t v7 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v28 + 1) + 8 * i) address];
        if (v9)
        {
          id v10 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)unsigned int v33 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "add local adress %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v21 = v9;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v21 = v9;
                _IDSLogV();
              }
            }
          }
          id v11 = objc_msgSend(v9, "sa4", v21);
          if ((int)(v6 - &v35 - 513) >= -6)
          {
            CFStringRef v12 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)unsigned int v33 = v6 - &v35;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "connection blob size (%dB) is too big, skip remaining.", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v21 = (void *)(v6 - &v35);
              _IDSLogV();
            }
            goto LABEL_30;
          }
          if ((int)v5 >= 15)
          {
            CFStringRef v13 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)unsigned int v33 = v5;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#IPv4 address (%d) reaches max allowed, skip remaining.", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v21 = (void *)v5;
              _IDSLogV();
            }
LABEL_30:

            goto LABEL_31;
          }
          *(_DWORD *)BOOL v6 = v11[1];
          *((_WORD *)v6 + 2) = *((_WORD *)v11 + 1);
          v6 += 6;
          unint64_t v5 = (v5 + 1);
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v4) {
        continue;
      }
      break;
    }
LABEL_31:

    LOBYTE(v36[0]) = 16 * v5;
    if (v5)
    {
      id v14 = +[NSData dataWithBytes:&v35 length:(int)(v6 - &v35)];
      v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)unsigned int v33 = v5;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v6 - &v35;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "createConnectionData - done (#ipv4: %d, length: %dB).", buf, 0xEu);
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
      if (self->_dataReadyHandler)
      {
        v16 = im_primary_queue();
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10016C328;
        v24[3] = &unk_10097E440;
        v24[4] = self;
        id v17 = &v25;
        id v14 = v14;
        id v25 = v14;
        uint64_t v18 = v24;
LABEL_48:
        dispatch_async(v16, v18);

        goto LABEL_49;
      }
      goto LABEL_49;
    }
  }
  else
  {

    LOBYTE(v36[0]) = 0;
  }
  v19 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "failed to create connection data", buf, 2u);
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
  objc_super v20 = +[NSDictionary dictionaryWithObject:@"failed to create connection data", NSLocalizedDescriptionKey, v21 forKey];
  id v14 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8001 userInfo:v20];

  if (self->_dataReadyHandler)
  {
    v16 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016C310;
    block[3] = &unk_10097E440;
    void block[4] = self;
    id v17 = &v27;
    id v14 = v14;
    id v27 = v14;
    uint64_t v18 = block;
    goto LABEL_48;
  }
LABEL_49:
}

- (void)_sendConnectionCheckRequest
{
  if (self->_isInvalidated)
  {
    long long v2 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Link is invalidated, stop sending connection check request", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_6:
    }
      _IDSLogV();
  }
  else
  {
    ids_monotonic_time();
    double v5 = v4;
    if (self->_connectionRequestStartTime == 0.0)
    {
      self->_connectionRequestStartTime = v4;
      BOOL v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Start connection check.", buf, 2u);
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
    if (sub_1000CFD24((unsigned int *)&self->_sockAddrPairTable))
    {
      uint64_t v7 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection check is done.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_6;
          }
        }
      }
    }
    else if (v5 - self->_connectionRequestStartTime >= 5.0)
    {
      id v10 = +[NSDictionary dictionaryWithObject:@"Connection check is timed out, cannot connect to remote party." forKey:NSLocalizedDescriptionKey];
      id v11 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8005 userInfo:v10];

      CFStringRef v12 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connection check is timed out, cannot connect to remote party.", buf, 2u);
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
      if (self->_completionHandler && !self->_notifyReachableDone)
      {
        self->_notifyReachableDone = 1;
        CFStringRef v13 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10016C838;
        block[3] = &unk_10097E440;
        void block[4] = self;
        id v15 = v11;
        dispatch_async(v13, block);
      }
    }
    else
    {
      ids_monotonic_time();
      double v9 = v8;
      if (qword_100A4A868 != -1) {
        dispatch_once(&qword_100A4A868, &stru_1009840E8);
      }
      sub_1000CF584((uint64_t)&self->_sockAddrPairTable, self->_udpLink, self->_cbuuid, (unint64_t)((double)(unint64_t)qword_100A4A860 + v9 * 4294967300.0) >> 22);
      IDSTransportThreadAddBlockAfter();
    }
  }
}

- (void)_sendNominateRequest
{
  if (self->_isInvalidated)
  {
    long long v2 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Link is invalidated, stop sending nominate request", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_37:
    }
      _IDSLogV();
  }
  else if (self->_localPartyID)
  {
    ids_monotonic_time();
    double v5 = v4;
    if (self->_nominateRequestStartTime == 0.0)
    {
      self->_nominateRequestStartTime = v4;
      BOOL v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Start nominate request.", buf, 2u);
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
    if (sub_1000CFD6C((unint64_t)&self->_sockAddrPairTable))
    {
      uint64_t v7 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Nominate request is done.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_37;
          }
        }
      }
    }
    else if (v5 - self->_nominateRequestStartTime >= 5.0)
    {
      id v14 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Nominate request timed out, cannot connect to remote party.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      id v10 = [(NSString *)self->_localPartyID UTF8String];
      size_t v11 = strlen(v10);
      ids_monotonic_time();
      double v13 = v12;
      if (qword_100A4A868 != -1) {
        dispatch_once(&qword_100A4A868, &stru_1009840E8);
      }
      sub_1000CFEBC((uint64_t)&self->_sockAddrPairTable, self->_udpLink, self->_cbuuid, (uint64_t)v10, v11, (unint64_t)((double)(unint64_t)qword_100A4A860 + v13 * 4294967300.0) >> 22);
      IDSTransportThreadAddBlockAfter();
    }
  }
  else
  {
    double v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      localPartyID = self->_localPartyID;
      *(_DWORD *)buf = 138412290;
      v16 = localPartyID;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_sendNominateRequest failed due to invalid localPartyID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          goto LABEL_37;
        }
      }
    }
  }
}

- (void)_startConnectionEcho:(double)a3
{
  p_sockAddrPairTable = &self->_sockAddrPairTable;
  if (sub_1000CFDAC((unint64_t)&self->_sockAddrPairTable))
  {
    BOOL v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connection echo is done.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
LABEL_17:
        }
          _IDSLogV();
      }
    }
  }
  else
  {
    ids_monotonic_time();
    if (v7 - a3 >= 5.0)
    {
      double v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connection echo timed out.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      ids_monotonic_time();
      if (qword_100A4A868 != -1)
      {
        double v10 = v8;
        dispatch_once(&qword_100A4A868, &stru_1009840E8);
        double v8 = v10;
      }
      sub_1000D057C(&p_sockAddrPairTable->iNumPair, self->_udpLink, self->_cbuuid, (uint64_t)&self->_sourceAddress, (uint64_t)&self->_destinationAddress, (unint64_t)((double)(unint64_t)qword_100A4A860 + v8 * 4294967300.0) >> 22);
      IDSTransportThreadAddBlockAfter();
    }
  }
}

- (unint64_t)headerOverhead
{
  int ss_family = self->_sourceAddress.ss_family;
  unint64_t v3 = 255;
  if (ss_family == 30) {
    unint64_t v3 = 48;
  }
  if (ss_family == 2) {
    return 28;
  }
  else {
    return v3;
  }
}

- (NSString)linkTypeString
{
  return (NSString *)@"UDPGlobal";
}

- (id)copyLinkStatsDict
{
  id v3 = objc_alloc((Class)NSDictionary);
  double v4 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesReceived];
  double v5 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesSent];
  BOOL v6 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsReceived];
  double v7 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsSent];
  id v8 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"bytesReceived", v5, @"bytesSent", v6, @"packetsReceived", v7, @"packetsSent", 0);

  return v8;
}

- (void)_handleEchoTimer
{
  ids_monotonic_time();
  double v4 = v3;
  double v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    echoTimer = self->_echoTimer;
    *(_DWORD *)buf = 134218240;
    size_t v11 = echoTimer;
    __int16 v12 = 2048;
    double v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "echo timer %p fired (%.6f).", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v9 = v4;
      id v8 = self->_echoTimer;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        double v9 = v4;
        id v8 = self->_echoTimer;
        _IDSLogV();
      }
    }
  }
  if (self->_isInvalidated)
  {
    double v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "link is invalidated, stop echo timer.", buf, 2u);
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
    [(IDSUDPGlobalLink *)self _stopEchoTimer];
  }
  sub_1000D0DD4((unsigned int *)&self->_sockAddrPairTable);
  [(IDSUDPGlobalLink *)self _startConnectionEcho:v4];
}

- (void)_startEchoTimer
{
  echoTimer = self->_echoTimer;
  if (echoTimer) {
    dispatch_source_cancel(echoTimer);
  }
  double v4 = im_primary_queue();
  double v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  BOOL v6 = self->_echoTimer;
  self->_echoTimer = v5;

  double v7 = self->_echoTimer;
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v7, v8, 0x2540BE400uLL, 0x5F5E100uLL);
  double v9 = self->_echoTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10016D5C8;
  handler[3] = &unk_10097E4D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_echoTimer);
  double v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    size_t v11 = self->_echoTimer;
    *(_DWORD *)buf = 134217984;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "start echo timer %p.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport();
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_stopEchoTimer
{
  echoTimer = self->_echoTimer;
  if (echoTimer)
  {
    dispatch_source_cancel(echoTimer);
    double v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = self->_echoTimer;
      *(_DWORD *)buf = 134217984;
      dispatch_time_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "stop echo timer %p.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    BOOL v6 = self->_echoTimer;
    self->_echoTimer = 0;
  }
}

- (void)_updateLinkTransportAddress:(unsigned int)a3 localAddress:(sockaddr *)a4 remoteAddress:(sockaddr *)a5
{
  uint64_t v7 = *(void *)&a3;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v30 = v9;
  long long v31 = v9;
  long long v32 = v9;
  long long v33 = v9;
  long long v34 = v9;
  long long v35 = v9;
  long long v36 = v9;
  long long v37 = v9;
  long long v22 = v9;
  long long v23 = v9;
  long long v24 = v9;
  long long v25 = v9;
  long long v26 = v9;
  long long v27 = v9;
  p_sourceAddress = &self->_sourceAddress;
  long long v28 = v9;
  long long v29 = v9;
  if (!IsValidSA() || !IsValidSA())
  {
    self->_sourceInterfaceIndex = v7;
    memcpy(p_sourceAddress, a4, a4->sa_len);
    memcpy(&self->_destinationAddress, a5, a5->sa_len);
    self->_unint64_t state = 4;
    double v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = SAToIPPortString();
      __int16 v40 = 2080;
      uint64_t v41 = SAToIPPortString();
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "add result: src[%s], dst[%s].", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v20 = SAToIPPortString();
        uint64_t v21 = SAToIPPortString();
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v20 = SAToIPPortString();
          uint64_t v21 = SAToIPPortString();
          _IDSLogV();
        }
      }
    }
    +[IDSSockAddrWrapper wrapperWithSockAddr:](IDSSockAddrWrapper, "wrapperWithSockAddr:", &self->_destinationAddress, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
      v36,
    __int16 v12 = v37);
    [(IDSUDPLink *)self->_udpLink setDestinationAddress:v12 localIfIndex:v7 isFixedDestination:0 fromAddress:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self didConnectForDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

    id v15 = IMGetDomainValueForKey();
    v16 = v15;
    if (v15) {
      uint64_t v17 = (uint64_t)[v15 unsignedIntValue];
    }
    else {
      uint64_t v17 = 800;
    }
    [(IDSUDPLink *)self->_udpLink setTrafficClass:v17];
    uint64_t v18 = +[IMLockdownManager sharedInstance];
    unsigned int v19 = [v18 isInternalInstall];

    if (v19) {
      [(IDSUDPGlobalLink *)self _startEchoTimer];
    }

    goto LABEL_24;
  }
  if (sub_10016DC64((uint64_t)p_sourceAddress, (uint64_t)a4)
    || sub_10016DC64((uint64_t)&self->_destinationAddress, (uint64_t)a5))
  {
    self->_sourceInterfaceIndex = v7;
    memcpy(p_sourceAddress, a4, a4->sa_len);
    memcpy(&self->_destinationAddress, a5, a5->sa_len);
    size_t v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = SAToIPPortString();
      __int16 v40 = 2080;
      uint64_t v41 = SAToIPPortString();
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "update result: src[%s], dst[%s].", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v20 = SAToIPPortString();
      uint64_t v21 = SAToIPPortString();
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v20 = SAToIPPortString();
        uint64_t v21 = SAToIPPortString();
        _IDSLogV();
      }
    }
    +[IDSSockAddrWrapper wrapperWithSockAddr:](IDSSockAddrWrapper, "wrapperWithSockAddr:", &self->_destinationAddress, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
      v36,
    __int16 v12 = v37);
    [(IDSUDPLink *)self->_udpLink setDestinationAddress:v12 localIfIndex:v7 isFixedDestination:0 fromAddress:0];
LABEL_24:
  }
}

- (BOOL)_processStunBindingRequest:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8
{
  uint64_t v8 = __chkstk_darwin(self, a2);
  double v10 = v9;
  __int16 v12 = v11;
  __src = v13;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = v8;
  uint64_t v20 = v19;
  long long v85 = &v79;
  id v86 = v17;
  *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v102 = v21;
  long long v103 = v21;
  long long v100 = v21;
  long long v101 = v21;
  long long v98 = v21;
  long long v99 = v21;
  long long v96 = v21;
  long long v97 = v21;
  long long v88 = v21;
  long long v89 = v21;
  long long v90 = v21;
  long long v91 = v21;
  long long v92 = v21;
  long long v93 = v21;
  long long v94 = v21;
  long long v95 = v21;
  long long v22 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = SAToIPPortString();
    uint64_t v24 = SAToIPPortString();
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v15;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "receive binding request %@ for [%s(%u)-%s].", buf, 0x26u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v25 = SAToIPPortString();
      uint64_t v26 = SAToIPPortString();
      uint64_t v81 = v15;
      uint64_t v82 = v26;
      long long v79 = v20;
      uint64_t v80 = v25;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v27 = SAToIPPortString();
        uint64_t v28 = SAToIPPortString();
        uint64_t v81 = v15;
        uint64_t v82 = v28;
        long long v79 = v20;
        uint64_t v80 = v27;
        _IDSLogV();
      }
    }
  }
  memset(buf, 170, 0x5D0uLL);
  memset(__b, 170, sizeof(__b));
  if (![v20 getAttribute:37 attribute:buf]
    || ![v20 getAttribute:6 attribute:__b])
  {
    id v84 = 0;
    goto LABEL_21;
  }
  long long v29 = *(void **)(v18 + 1856);
  if (!v29)
  {
    v59 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v112 = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "process nomination request before Accept, this should NOT happen.", v112, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          goto LABEL_19;
        }
      }
    }
    goto LABEL_94;
  }
  id v84 = (_DWORD *)*(unsigned int *)&buf[8];
  uint64_t v30 = __b[2];
  long long v31 = (const char *)[v29 UTF8String];
  size_t v32 = strlen(v31);
  if ((int)v84 >= 1 && (int)v30 >= 1 && v32 == v30 && !memcmp(&__b[3], v31, v32))
  {
    id v74 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v112 = 136315138;
      *(void *)&v112[4] = &__b[3];
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "receive nominate binding request with remotePartyID %s.", v112, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        long long v79 = &__b[3];
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          long long v79 = &__b[3];
          _IDSLogV();
        }
      }
    }
    sub_1000CEC70((int *)(v18 + 56), v15, (unsigned __int8 *)__src, v12, 5, &__b[3], v30);
    id v75 = (const char *)[*(id *)(v18 + 1856) UTF8String];
    int v76 = strlen(v75);
    if (!memcmp(&__b[3], v75, v76))
    {
      unsigned int v77 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v112 = 67109378;
        *(_DWORD *)&v112[4] = v84;
        *(_WORD *)&v112[8] = 2080;
        *(void *)&v112[10] = v75;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "nominate request with count(%d) matches remoteID %s", v112, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v79 = v84;
          uint64_t v80 = (uint64_t)v75;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            long long v79 = v84;
            uint64_t v80 = (uint64_t)v75;
            _IDSLogV();
          }
        }
      }
      [(id)v18 _updateLinkTransportAddress:v15 localAddress:__src remoteAddress:v12];
    }
LABEL_21:
    uint64_t v34 = _IDSLinkPacketBufferCreate();
    uint64_t v35 = v34;
    if (*(void *)(v18 + 1896) != 4)
    {
      *(_DWORD *)(v34 + 48) = v15;
      memcpy((void *)(v34 + 56), __src, *(unsigned __int8 *)__src);
      memcpy((void *)(v35 + 184), v12, *v12);
      goto LABEL_28;
    }
    int v36 = *(unsigned __int8 *)(v18 + 1689);
    if (v36 == v12[1])
    {
      if (v36 == 30)
      {
        if (*(unsigned __int16 *)(v18 + 1690) == *((unsigned __int16 *)v12 + 1))
        {
          BOOL v37 = *(void *)(v18 + 1696) == *((void *)v12 + 1) && *(void *)(v18 + 1704) == *((void *)v12 + 2);
          goto LABEL_59;
        }
      }
      else if (v36 == 2 && *(unsigned __int16 *)(v18 + 1690) == *((unsigned __int16 *)v12 + 1))
      {
        BOOL v37 = *(_DWORD *)(v18 + 1692) == *((_DWORD *)v12 + 1);
LABEL_59:
        char v61 = v37;
        v62 = (unsigned int *)(v18 + 1552);
        if (*(_DWORD *)(v18 + 1552) != v15 || (v61 & 1) == 0) {
          goto LABEL_66;
        }
LABEL_28:
        memset(v112, 170, sizeof(v112));
        if ([v20 getAttribute:32773 attribute:v112])
        {
          unsigned int v38 = *(unsigned __int16 *)&v112[12];
          ids_monotonic_time();
          uint64_t v40 = bswap32(v38) >> 16;
          if (qword_100A4A868 != -1)
          {
            double v83 = v39;
            dispatch_once(&qword_100A4A868, &stru_1009840E8);
            double v39 = v83;
          }
          unsigned __int16 v41 = ((unint64_t)((double)(unint64_t)qword_100A4A860 + v39 * 4294967300.0) >> 22)
              - ((unint64_t)((double)(unint64_t)qword_100A4A860 + v10 * 4294967300.0) >> 22);
        }
        else
        {
          unsigned __int16 v41 = 0;
          uint64_t v40 = 0;
        }
        id v42 = [objc_alloc((Class)IDSStunMessage) initWithType:257];
        uint64_t v43 = *(void *)v35;
        BOOL v44 = [v20 transactionID];
        uint64_t v45 = *(void *)(v35 + 8);
        long long v79 = *(_DWORD **)(v18 + 1840);
        [v42 stunResponseToBuffer:v43 outputLength:v35 + 16 transactionID:v44 reqCount:v84 echoTime:v40 delay:v41 keyData:v79 remainingLength:v45];

        long long v46 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = SAToIPPortString();
          int v48 = *(_DWORD *)(v35 + 48);
          uint64_t v49 = SAToIPPortString();
          *(_DWORD *)unsigned int v104 = 138413058;
          v105 = (const char *)v42;
          __int16 v106 = 2080;
          uint64_t v107 = v47;
          __int16 v108 = 1024;
          int v109 = v48;
          __int16 v110 = 2080;
          uint64_t v111 = v49;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "send binding response %@ for [%s(%u)-%s].", v104, 0x26u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v50 = SAToIPPortString();
            uint64_t v51 = *(unsigned int *)(v35 + 48);
            uint64_t v52 = SAToIPPortString();
            uint64_t v81 = v51;
            uint64_t v82 = v52;
            long long v79 = v42;
            uint64_t v80 = v50;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              uint64_t v53 = SAToIPPortString();
              uint64_t v54 = *(unsigned int *)(v35 + 48);
              uint64_t v55 = SAToIPPortString();
              uint64_t v81 = v54;
              uint64_t v82 = v55;
              long long v79 = v42;
              uint64_t v80 = v53;
              _IDSLogV();
            }
          }
        }
        unint64_t v56 = (unint64_t)[*(id *)(v18 + 8) sendPacketBuffer:v35 toDeviceUniqueID:*(void *)(v18 + 1888) cbuuid:v86];
        if (v56)
        {
          v57 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            if (v56 > 0xF) {
              unint64_t v58 = "UnexpectedSendResult";
            }
            else {
              unint64_t v58 = (const char *)_IDSLinkSendResultStrings[v56];
            }
            *(_DWORD *)unsigned int v104 = 136315138;
            v105 = v58;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "send binding response failed with %s", v104, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            v60 = v56 > 0xF ? "UnexpectedSendResult" : (char *)_IDSLinkSendResultStrings[v56];
            long long v79 = v60;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              if (v56 > 0xF) {
                v73 = "UnexpectedSendResult";
              }
              else {
                v73 = (const char *)_IDSLinkSendResultStrings[v56];
              }
              long long v79 = v73;
              _IDSLogV();
            }
          }
        }

        goto LABEL_94;
      }
    }
    v62 = (unsigned int *)(v18 + 1552);
LABEL_66:
    v63 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v64 = SAToIPPortString();
      int v65 = *v62;
      uint64_t v66 = SAToIPPortString();
      *(_DWORD *)v112 = 136315650;
      *(void *)&v112[4] = v64;
      *(_WORD *)&v112[12] = 1024;
      *(_DWORD *)&v112[14] = v65;
      *(_WORD *)&v112[18] = 2080;
      *(void *)&v112[20] = v66;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "skip binding response to %s, socket on if_index %d is already connected to %s.", v112, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v67 = SAToIPPortString();
        uint64_t v68 = *v62;
        uint64_t v69 = SAToIPPortString();
        uint64_t v80 = v68;
        uint64_t v81 = v69;
        long long v79 = (_DWORD *)v67;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v70 = SAToIPPortString();
          uint64_t v71 = *v62;
          uint64_t v72 = SAToIPPortString();
          uint64_t v80 = v71;
          uint64_t v81 = v72;
          long long v79 = (_DWORD *)v70;
          _IDSLogV();
        }
      }
    }
    _IDSLinkPacketBufferRelease();
    goto LABEL_94;
  }
  long long v33 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v112 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "receive nomination request with invalid remotePartyID, ignore.", v112, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
LABEL_19:
      }
        _IDSLogV();
    }
  }
LABEL_94:

  return 1;
}

- (BOOL)_processStunBindingResponse:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[6] = v16;
  v36[7] = v16;
  v36[4] = v16;
  v36[5] = v16;
  v36[2] = v16;
  v36[3] = v16;
  v36[0] = v16;
  v36[1] = v16;
  v35[0] = v16;
  v35[1] = v16;
  v35[2] = v16;
  v35[3] = v16;
  v35[4] = v16;
  v35[5] = v16;
  v35[6] = v16;
  v35[7] = v16;
  memset(__b, 170, sizeof(__b));
  double v17 = 0.0;
  if ([v14 getAttribute:32773 attribute:__b])
  {
    __int16 v18 = -256 * LOBYTE(__b[3]) - BYTE1(__b[3]);
    __int16 v19 = -256 * BYTE2(__b[3]) - HIBYTE(__b[3]);
    if (qword_100A4A868 != -1) {
      dispatch_once(&qword_100A4A868, &stru_1009840E8);
    }
    double v17 = (double)(unsigned __int16)(v19
                                   + v18
                                   + ((unint64_t)((double)(unint64_t)qword_100A4A860 + a8 * 4294967300.0) >> 22))
        * 0.0009765625;
  }
  SAToIPPortString();
  SAToIPPortString();
  uint64_t v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v38 = v14;
    __int16 v39 = 2080;
    uint64_t v40 = v36;
    __int16 v41 = 1024;
    int v42 = v11;
    __int16 v43 = 2080;
    BOOL v44 = v35;
    __int16 v45 = 2048;
    double v46 = v17 * 1000.0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "receive binding response %@ for [%s(%u)-%s], RTT(%.3f ms)", buf, 0x30u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v33 = v17 * 1000.0;
      uint64_t v31 = v11;
      size_t v32 = v35;
      id v28 = v14;
      uint64_t v30 = v36;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        double v33 = v17 * 1000.0;
        uint64_t v31 = v11;
        size_t v32 = v35;
        id v28 = v14;
        uint64_t v30 = v36;
        _IDSLogV();
      }
    }
  }
  objc_msgSend(v14, "transactionID", v28, v30, v31, v32, *(void *)&v33);
  id v21 = objc_claimAutoreleasedReturnValue();
  id v22 = [v21 bytes];

  if ([v14 getAttribute:37 attribute:__b])
  {
    uint64_t v23 = __b[2];
    if (__b[2] >= 1)
    {
      sub_1000CF200((unsigned int *)&self->_sockAddrPairTable, (uint64_t)v22, 5);
      uint64_t v24 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Nominated connection(%d) is accepted by remoteParty.", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v29 = v23;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v29 = v23;
            _IDSLogV();
          }
        }
      }
      -[IDSUDPGlobalLink _updateLinkTransportAddress:localAddress:remoteAddress:](self, "_updateLinkTransportAddress:localAddress:remoteAddress:", v11, a6, a7, v29);
    }
  }
  else if (sub_1000CF200((unsigned int *)&self->_sockAddrPairTable, (uint64_t)v22, 3) {
         && self->_completionHandler
  }
         && !self->_notifyReachableDone)
  {
    self->_notifyReachableDone = 1;
    uint64_t v25 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Notifying remote party is reachable for ACCEPT.", buf, 2u);
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
    uint64_t v26 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016EF70;
    block[3] = &unk_10097E4D0;
    void block[4] = self;
    dispatch_async(v26, block);
  }
  return 1;
}

- (BOOL)_processStunEchoRequest:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8
{
  uint64_t v54 = a7;
  uint64_t v55 = a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v56 = a4;
  uint64_t v53 = &keyData;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v71 = v13;
  long long v72 = v13;
  long long v69 = v13;
  long long v70 = v13;
  long long v67 = v13;
  long long v68 = v13;
  long long v65 = v13;
  long long v66 = v13;
  long long v57 = v13;
  long long v58 = v13;
  long long v59 = v13;
  long long v60 = v13;
  long long v61 = v13;
  long long v62 = v13;
  long long v63 = v13;
  long long v64 = v13;
  memset(__b, 170, sizeof(__b));
  if ([v12 getAttribute:37 attribute:__b])
  {
    id v14 = (NSData *)__b[2];
    if ((__b[2] & 0x80000000) != 0)
    {
      id v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "receive echo request with invalid count(%d), ignore.", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          keyData = v14;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            keyData = v14;
            _IDSLogV();
          }
        }
      }
      goto LABEL_44;
    }
  }
  else
  {
    id v14 = 0;
  }
  long long v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = SAToIPPortString();
    uint64_t v18 = SAToIPPortString();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v17;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v9;
    *(_WORD *)&buf[24] = 2080;
    *(void *)&buf[26] = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "receive echo request (count:%04x) for %s(%u)-%s.", buf, 0x22u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v19 = SAToIPPortString();
      uint64_t v20 = SAToIPPortString();
      uint64_t v51 = v9;
      uint64_t v52 = v20;
      keyData = v14;
      uint64_t v50 = v19;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v21 = SAToIPPortString();
        uint64_t v22 = SAToIPPortString();
        uint64_t v51 = v9;
        uint64_t v52 = v22;
        keyData = v14;
        uint64_t v50 = v21;
        _IDSLogV();
      }
    }
  }
  uint64_t v23 = _IDSLinkPacketBufferCreate();
  memset(buf, 170, 0x5D0uLL);
  if ([v12 getAttribute:32773 attribute:buf])
  {
    unsigned int v24 = *(unsigned __int16 *)&buf[12];
    ids_monotonic_time();
    double v26 = v25;
    uint64_t v27 = bswap32(v24) >> 16;
    if (qword_100A4A868 != -1) {
      dispatch_once(&qword_100A4A868, &stru_1009840E8);
    }
    unsigned __int16 v28 = ((unint64_t)((double)(unint64_t)qword_100A4A860 + v26 * 4294967300.0) >> 22)
        - ((unint64_t)((double)(unint64_t)qword_100A4A860 + a8 * 4294967300.0) >> 22);
  }
  else
  {
    unsigned __int16 v28 = 0;
    uint64_t v27 = 0;
  }
  id v29 = [objc_alloc((Class)IDSStunMessage) initWithType:4067];
  uint64_t v30 = *(void *)v23;
  uint64_t v31 = [v12 transactionID];
  uint64_t v32 = *(void *)(v23 + 8);
  keyData = self->_keyData;
  [v29 stunResponseToBuffer:v30 outputLength:v23 + 16 transactionID:v31 reqCount:v14 echoTime:v27 delay:v28 keyData:keyData remainingLength:v32];

  double v33 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = SAToIPPortString();
    int v35 = *(_DWORD *)(v23 + 48);
    uint64_t v36 = SAToIPPortString();
    *(_DWORD *)v73 = 67109890;
    *(_DWORD *)id v74 = v14;
    *(_WORD *)&v74[4] = 2080;
    *(void *)&v74[6] = v34;
    __int16 v75 = 1024;
    int v76 = v35;
    __int16 v77 = 2080;
    uint64_t v78 = v36;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "send echo response (count:%04x) for %s(%u)-%s.", v73, 0x22u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v37 = SAToIPPortString();
      uint64_t v38 = *(unsigned int *)(v23 + 48);
      uint64_t v39 = SAToIPPortString();
      uint64_t v51 = v38;
      uint64_t v52 = v39;
      keyData = v14;
      uint64_t v50 = v37;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v40 = SAToIPPortString();
        uint64_t v41 = *(unsigned int *)(v23 + 48);
        uint64_t v42 = SAToIPPortString();
        uint64_t v51 = v41;
        uint64_t v52 = v42;
        keyData = v14;
        uint64_t v50 = v40;
        _IDSLogV();
      }
    }
  }
  unint64_t v43 = (unint64_t)[(IDSUDPLink *)self->_udpLink sendPacketBuffer:v23 toDeviceUniqueID:self->_deviceUniqueID cbuuid:v56];
  if (v43)
  {
    BOOL v44 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      if (v43 > 0xF) {
        __int16 v45 = "UnexpectedSendResult";
      }
      else {
        __int16 v45 = (const char *)_IDSLinkSendResultStrings[v43];
      }
      *(_DWORD *)v73 = 136315138;
      *(void *)id v74 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "send echo response failed with %s", v73, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      double v46 = v43 > 0xF ? "UnexpectedSendResult" : (char *)_IDSLinkSendResultStrings[v43];
      keyData = (NSData *)v46;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if (v43 > 0xF) {
          uint64_t v47 = "UnexpectedSendResult";
        }
        else {
          uint64_t v47 = (const char *)_IDSLinkSendResultStrings[v43];
        }
        keyData = (NSData *)v47;
        _IDSLogV();
      }
    }
  }

LABEL_44:
  return 1;
}

- (BOOL)_processStunEchoResponse:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34[6] = v14;
  v34[7] = v14;
  v34[4] = v14;
  v34[5] = v14;
  v34[2] = v14;
  v34[3] = v14;
  v34[0] = v14;
  v34[1] = v14;
  v33[0] = v14;
  v33[1] = v14;
  v33[2] = v14;
  v33[3] = v14;
  v33[4] = v14;
  v33[5] = v14;
  v33[6] = v14;
  v33[7] = v14;
  memset(__b, 170, sizeof(__b));
  if ([v12 getAttribute:37 attribute:__b])
  {
    uint64_t v15 = __b[2];
    p_sockAddrPairTable = &self->_sockAddrPairTable;
    int v17 = sub_1000D0DC8((uint64_t)p_sockAddrPairTable);
    if ((int)v15 >= 1 && (int)v15 >= v17)
    {
      if ([v12 getAttribute:32773 attribute:__b])
      {
        __int16 v18 = -256 * LOBYTE(__b[3]) - BYTE1(__b[3]);
        __int16 v19 = -256 * BYTE2(__b[3]) - HIBYTE(__b[3]);
        if (qword_100A4A868 != -1)
        {
          __int16 v32 = -256 * BYTE2(__b[3]) - HIBYTE(__b[3]);
          dispatch_once(&qword_100A4A868, &stru_1009840E8);
          __int16 v19 = v32;
        }
        uint64_t v20 = (int)((double)(unsigned __int16)(v19
                                                           + v18
                                                           + ((unint64_t)((double)(unint64_t)qword_100A4A860
                                                                               + a8 * 4294967300.0) >> 22))
                                * 0.0009765625
                                * 1000.0);
      }
      else
      {
        uint64_t v20 = 0;
      }
      SAToIPPortString();
      SAToIPPortString();
      uint64_t v23 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110146;
        int v36 = v15;
        __int16 v37 = 1024;
        int v38 = v20;
        __int16 v39 = 2080;
        uint64_t v40 = v34;
        __int16 v41 = 1024;
        int v42 = v9;
        __int16 v43 = 2080;
        BOOL v44 = v33;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "receive echo response (count:%04x, rtt:%4d ms) for %s(%u)-%s.", buf, 0x28u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v30 = v9;
          uint64_t v31 = v33;
          uint64_t v28 = v20;
          id v29 = v34;
          uint64_t v27 = v15;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v31 = v33;
            id v29 = v34;
            uint64_t v30 = v9;
            uint64_t v27 = v15;
            uint64_t v28 = v20;
            _IDSLogV();
          }
        }
      }
      objc_msgSend(v12, "transactionID", v27, v28, v29, v30, v31);
      id v24 = objc_claimAutoreleasedReturnValue();
      id v25 = [v24 bytes];

      sub_1000CF200((unsigned int *)p_sockAddrPairTable, (uint64_t)v25, 7);
      goto LABEL_28;
    }
    uint64_t v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "receive old echo response (%d), ignore.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
LABEL_13:
        }
          _IDSLogV();
      }
    }
  }
  else
  {
    uint64_t v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "receive invalid echo resopnse.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_28:

  return 1;
}

- (BOOL)_processStunDataIndication:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8 packetBuffer:(id *)a9 fromDeviceUniqueID:(id)a10 cbuuid:(id)a11
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a10;
  id v18 = a11;
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v41[6] = v19;
  v41[7] = v19;
  v41[4] = v19;
  v41[5] = v19;
  v41[2] = v19;
  v41[3] = v19;
  v41[0] = v19;
  v41[1] = v19;
  v40[7] = v19;
  v40[6] = v19;
  v40[5] = v19;
  v40[4] = v19;
  v40[3] = v19;
  v40[2] = v19;
  v40[1] = v19;
  v40[0] = v19;
  bzero(v38, 0x5D0uLL);
  if (([v15 getAttribute:19 attribute:v38] & 1) == 0)
  {
    uint64_t v23 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "receive invalid data indication.", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_22;
    }
    if (!_IDSShouldLogTransport()) {
      goto LABEL_22;
    }
    _IDSLogTransport();
    if (!_IDSShouldLog()) {
      goto LABEL_22;
    }
LABEL_21:
    _IDSLogV();
LABEL_22:
    BOOL v22 = 0;
    goto LABEL_23;
  }
  if (v39 <= 0)
  {
    id v24 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v39;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "invalid data attr length (%dB).", buf, 8u);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_22;
    }
    if (!_IDSShouldLogTransport()) {
      goto LABEL_22;
    }
    _IDSLogTransport();
    if (!_IDSShouldLog()) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  SAToIPPortString();
  SAToIPPortString();
  IDSLinkPacketBufferAddBufferStart();
  a9->int64_t var2 = v39;
  uint64_t v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int64_t var2 = a9->var2;
    *(_DWORD *)buf = 134218754;
    int64_t v31 = var2;
    __int16 v32 = 2080;
    double v33 = v41;
    __int16 v34 = 1024;
    int v35 = v12;
    __int16 v36 = 2080;
    __int16 v37 = v40;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "receive indication data (%zdB) for [%s(%u)-%s].", buf, 0x26u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v28 = v12;
      id v29 = v40;
      int64_t v26 = a9->var2;
      uint64_t v27 = v41;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v28 = v12;
        id v29 = v40;
        int64_t v26 = a9->var2;
        uint64_t v27 = v41;
        _IDSLogV();
      }
    }
  }
  -[IDSUDPGlobalLink _forwardPacketBuffer:fromDeviceUniqueID:cbuuid:](self, "_forwardPacketBuffer:fromDeviceUniqueID:cbuuid:", a9, v17, v18, v26, v27, v28, v29);
  BOOL v22 = 1;
LABEL_23:

  return v22;
}

- (BOOL)_processStunPacket:(id *)a3 fromDevice:(id)a4 arrivalTime:(double)a5 fromDeviceUniqueID:(id)a6 cbuuid:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [objc_alloc((Class)IDSStunMessage) initWithType:0];
  if (([v15 read:a3->var0 inputLength:SLODWORD(a3->var2)] & 1) == 0)
  {
    id v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "_processStunPacket failed.", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  unsigned __int16 v16 = (unsigned __int16)[v15 type];
  if (!self->_useStunMICheck) {
    goto LABEL_9;
  }
  if ([v15 verifyMessageIntegrityWithKey:self->_keyData inputBuffer:a3->var0 inputLength:LODWORD(a3->var2)])
  {
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "### stun packet type %04x passed MI check.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v42 = v16;
      _IDSLogV();
    }
LABEL_9:
    if (v16 <= 0x100u)
    {
      if (v16 == 1)
      {
        memset(buf, 170, 0x5D0uLL);
        memset(__b, 170, sizeof(__b));
        long long v21 = *(_OWORD *)&a3->var18.__ss_pad2[64];
        long long v77 = *(_OWORD *)&a3->var18.__ss_pad2[48];
        long long v78 = v21;
        long long v22 = *(_OWORD *)&a3->var18.__ss_pad2[96];
        long long v79 = *(_OWORD *)&a3->var18.__ss_pad2[80];
        long long v80 = v22;
        long long v23 = *(_OWORD *)a3->var18.__ss_pad2;
        long long v73 = *(_OWORD *)&a3->var18.ss_len;
        long long v74 = v23;
        long long v24 = *(_OWORD *)&a3->var18.__ss_pad2[32];
        long long v75 = *(_OWORD *)&a3->var18.__ss_pad2[16];
        long long v76 = v24;
        long long v25 = *(_OWORD *)&a3->var19.__ss_pad2[64];
        long long v26 = *(_OWORD *)&a3->var19.__ss_pad2[80];
        long long v69 = *(_OWORD *)&a3->var19.__ss_pad2[48];
        long long v70 = v25;
        long long v27 = *(_OWORD *)&a3->var19.__ss_pad2[96];
        long long v71 = v26;
        long long v72 = v27;
        long long v28 = *(_OWORD *)a3->var19.__ss_pad2;
        long long v65 = *(_OWORD *)&a3->var19.ss_len;
        long long v66 = v28;
        long long v29 = *(_OWORD *)&a3->var19.__ss_pad2[32];
        long long v67 = *(_OWORD *)&a3->var19.__ss_pad2[16];
        long long v68 = v29;
        unsigned int var17 = a3->var17;
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_1001707CC;
        v44[3] = &unk_1009840C8;
        v44[4] = self;
        id v31 = v15;
        id v45 = v31;
        long long v51 = v77;
        long long v52 = v78;
        long long v53 = v79;
        long long v54 = v80;
        long long v47 = v73;
        long long v48 = v74;
        long long v49 = v75;
        long long v50 = v76;
        long long v61 = v71;
        long long v62 = v72;
        long long v60 = v70;
        long long v59 = v69;
        long long v58 = v68;
        long long v57 = v67;
        long long v56 = v66;
        id v46 = v12;
        unsigned int v64 = var17;
        long long v55 = v65;
        double v63 = a5;
        __int16 v32 = objc_retainBlock(v44);
        if ([v31 getAttribute:37 attribute:buf]
          && [v31 getAttribute:6 attribute:__b]
          && !self->_remotePartyID)
        {
          int v35 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v43 = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "delay nomination request before Accept.", v43, 2u);
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
          if (self->_nominateBlocks
            || (__int16 v36 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray),
                __int16 v37 = self->_nominateBlocks,
                self->_nominateBlocks = v36,
                v37,
                self->_nominateBlocks))
          {
            id v38 = objc_msgSend(v32, "copy", v42);
            BOOL v39 = v38 == 0;

            if (!v39)
            {
              nominateBlocks = self->_nominateBlocks;
              id v41 = [v32 copy];
              CFArrayAppendValue((CFMutableArrayRef)nominateBlocks, v41);
            }
          }
        }
        else
        {
          ((void (*)(void *))v32[2])(v32);
        }

        goto LABEL_42;
      }
      if (v16 == 23)
      {
        [(IDSUDPGlobalLink *)self _processStunDataIndication:v15 fromDevice:v12 localIfIndex:a3->var17 localAddress:&a3->var18 remmoteAddress:&a3->var19 arrivalTime:a3 packetBuffer:a5 fromDeviceUniqueID:v13 cbuuid:v14];
        goto LABEL_42;
      }
    }
    else
    {
      switch(v16)
      {
        case 0x101u:
          [(IDSUDPGlobalLink *)self _processStunBindingResponse:v15 fromDevice:v12 localIfIndex:a3->var17 localAddress:&a3->var18 remmoteAddress:&a3->var19 arrivalTime:a5];
          goto LABEL_42;
        case 0xEE3u:
          [(IDSUDPGlobalLink *)self _processStunEchoRequest:v15 fromDevice:v12 localIfIndex:a3->var17 localAddress:&a3->var18 remmoteAddress:&a3->var19 arrivalTime:a5];
          goto LABEL_42;
        case 0xFE3u:
          [(IDSUDPGlobalLink *)self _processStunEchoResponse:v15 fromDevice:v12 localIfIndex:a3->var17 localAddress:&a3->var18 remmoteAddress:&a3->var19 arrivalTime:a5];
LABEL_42:
          BOOL v20 = 1;
          goto LABEL_43;
      }
    }
    double v33 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "_processStunPacket - receive invalid STUN message, type (%04X)", buf, 8u);
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
    goto LABEL_42;
  }
  long long v19 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "failed to verify message intergrity for stun packet type %04x.", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
LABEL_24:
      }
        _IDSLogV();
    }
  }
LABEL_25:
  BOOL v20 = 0;
LABEL_43:

  return v20;
}

- (BOOL)remoteHostAwake
{
  return 1;
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (__rev16(*(unsigned __int16 *)a3->var0) == 57344 || !self->_useStunMICheck)
  {
    int64_t var2 = a3->var2;
    unint64_t v17 = (unint64_t)[(IDSUDPLink *)self->_udpLink sendPacketBuffer:a3 toDeviceUniqueID:v8 cbuuid:v9];
    if (v17) {
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  double v10 = (void *)_IDSLinkPacketBufferCreate();
  id v11 = [objc_alloc((Class)IDSStunMessage) initWithType:23];
  id v12 = (const char **)(v10 + 2);
  [v11 dataIndicationToBuffer:*v10 outputLength:v10 + 2 data:a3->var0 dataLen:LODWORD(a3->var2) keyData:self->_keyData remainingLength:v10[1]];
  id v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v14 = a3->var2;
    id v15 = *v12;
    *(_DWORD *)buf = 134218240;
    int64_t v25 = v14;
    __int16 v26 = 2048;
    long long v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "send stun data indication (new:%zdB old:%zdB).", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      int64_t v22 = a3->var2;
      long long v23 = *v12;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        int64_t v22 = a3->var2;
        long long v23 = *v12;
        _IDSLogV();
      }
    }
  }
  int64_t var2 = v10[2];
  unint64_t v17 = (unint64_t)-[IDSUDPLink sendPacketBuffer:toDeviceUniqueID:cbuuid:](self->_udpLink, "sendPacketBuffer:toDeviceUniqueID:cbuuid:", v10, v8, v9, v22, v23);
  _IDSLinkPacketBufferRelease();

  if (!v17)
  {
LABEL_14:
    int64x2_t v20 = vdupq_n_s64(1uLL);
    v20.i64[0] = var2;
    *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v20);
  }
LABEL_10:
  id v18 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v17 > 0xF) {
      long long v19 = "UnexpectedSendResult";
    }
    else {
      long long v19 = (const char *)_IDSLinkSendResultStrings[v17];
    }
    *(_DWORD *)buf = 134218242;
    int64_t v25 = var2;
    __int16 v26 = 2080;
    long long v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sending a packet (%zdB) = %s", buf, 0x16u);
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

  return v17;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return 12;
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  if (self->_previousReportTime == 0.0)
  {
    id v9 = 0;
  }
  else
  {
    if (a4) {
      uint64_t v6 = 42;
    }
    else {
      uint64_t v6 = 32;
    }
    uint64_t v22 = v6;
    unint64_t state = self->_state;
    if (state > 6) {
      id v8 = "UnexpectedState";
    }
    else {
      id v8 = (const char *)_IDSLinkStateStrings[state];
    }
    long long v21 = v8;
    unint64_t v20 = self->_totalPacketsSent - self->_previousPacketsSent;
    double v10 = formattedBytes();
    id v11 = formattedSpeed();
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    id v13 = formattedBytes();
    unint64_t v14 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    id v15 = formattedBytes();
    unsigned __int16 v16 = formattedSpeed();
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    id v18 = formattedBytes();
    id v9 = +[NSString stringWithFormat:@"%c Global    (%s) Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n", v22, v21, v20, v10, v11, totalPacketsSent, v13, v14, v15, v16, totalPacketsReceived, v18];
  }
  self->_previousReportTime = a3;
  self->_previousBytesSent = self->_totalBytesSent;
  *(_OWORD *)&self->_previousPacketsSent = *(_OWORD *)&self->_totalPacketsSent;
  self->_previousPacketsReceived = self->_totalPacketsReceived;

  return v9;
}

- (void)_forwardPacketBuffer:(id *)a3 fromDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained link:self didReceivePacket:a3 fromDeviceUniqueID:v10 cbuuid:v9];
}

- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4)
  {
    if (a4->var2)
    {
      ids_monotonic_time();
      double v14 = v13;
      int64_t var2 = a4->var2;
      int64x2_t v16 = vdupq_n_s64(1uLL);
      v16.i64[0] = var2;
      *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v16);
      if (*a4->var0 == 15)
      {
        if (var2 < 21)
        {
          uint64_t v22 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v23 = a4->var2;
            *(_DWORD *)buf = 134217984;
            int64_t v28 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "didReceivePacket - unknown packet (%zdB)", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
        }
        else
        {
          uint64_t v17 = bswap32(*(unsigned __int16 *)(a4->var0 + 1)) >> 16;
          if ((v17 & 0xC000) == 0)
          {
            id v18 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
            long long v19 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              int64_t v20 = a4->var2;
              *(_DWORD *)buf = 134218498;
              int64_t v28 = v20;
              __int16 v29 = 1024;
              int v30 = v17;
              __int16 v31 = 2112;
              __int16 v32 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "didReceivePacket - STUN packet (%zdB) [type:%04X %@]", buf, 0x1Cu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              uint64_t v25 = v17;
              __int16 v26 = v18;
              int64_t v24 = a4->var2;
              _IDSLogV();
            }
            -[IDSUDPGlobalLink _processStunPacket:fromDevice:arrivalTime:fromDeviceUniqueID:cbuuid:](self, "_processStunPacket:fromDevice:arrivalTime:fromDeviceUniqueID:cbuuid:", a4, v12, v11, v12, v14, v24, v25, v26);
          }
        }
      }
      else
      {
        [(IDSUDPGlobalLink *)self _forwardPacketBuffer:a4 fromDeviceUniqueID:v11 cbuuid:v12];
      }
      LOBYTE(a4) = 1;
    }
    else
    {
      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 1880, 1);
}

- (void)setCbuuid:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 1888, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (IDSLinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSLinkDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSLinkDelegate)alternateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateDelegate);

  return (IDSLinkDelegate *)WeakRetained;
}

- (void)setAlternateDelegate:(id)a3
{
}

- (NSString)localPartyID
{
  return self->_localPartyID;
}

- (void)setLocalPartyID:(id)a3
{
}

- (NSString)remotePartyID
{
  return self->_remotePartyID;
}

- (void)setRemotePartyID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);
  objc_storeStrong((id *)&self->_echoTimer, 0);
  objc_storeStrong((id *)&self->_nominateBlocks, 0);
  objc_storeStrong((id *)&self->_remotePartyID, 0);
  objc_storeStrong((id *)&self->_localPartyID, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_remoteAddressArray, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_dataReadyHandler, 0);
  objc_destroyWeak((id *)&self->_alternateDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_udpLink, 0);
}

@end