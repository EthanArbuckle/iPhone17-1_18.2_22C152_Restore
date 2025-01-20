@interface IDSTCPLink
- (BOOL)disconnect:(sockaddr_in *)a3 remoteAddress:(sockaddr_in *)a4;
- (BOOL)isSSL;
- (BOOL)wifiAssistEnabled;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (IDSTCPConnection_)_getIDSTCPConnection:(id *)a3;
- (IDSTCPLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4 isSSL:(BOOL)a5 getPacketLength:(id)a6;
- (NSIndexSet)cellularInterfaceIndices;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkTypeString;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (int64_t)getPacketLength:(id *)a3 isChannelData:(BOOL *)a4;
- (sockaddr)connect:(int)a3 localAddress:(sockaddr *)a4 portRange:(unsigned __int16)a5 remoteAddress:(sockaddr *)a6 clientUUID:(unsigned __int8)a7[16] completionHandler:(id)a8;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)dealloc;
- (void)invalidate;
- (void)processIncomingPacket:(id *)a3;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setCellularInterfaceIndices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setWiFiAssistState:(BOOL)a3;
- (void)setWifiAssistEnabled:(BOOL)a3;
@end

@implementation IDSTCPLink

- (IDSTCPLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4 isSSL:(BOOL)a5 getPacketLength:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IDSTCPLink;
  v14 = [(IDSTCPLink *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_cbuuid, a4);
    objc_storeStrong((id *)&v15->_deviceUniqueID, a3);
    v15->_isSSL = a5;
    uint64_t v16 = _Block_copy(v13);
    id getPacketLength = v15->_getPacketLength;
    v15->_id getPacketLength = (id)v16;

    v15->_previousReportTime = ids_monotonic_time();
    v15->_addressFamily = 2;
  }

  return v15;
}

- (void)dealloc
{
  v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "IDSTCPLink dealloc", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"TCPLink", @"IDS", @"IDSTCPLink dealloc");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"IDSTCPLink dealloc");
      }
    }
  }
  objc_msgSend_invalidate(self, v4, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)IDSTCPLink;
  [(IDSTCPLink *)&v7 dealloc];
}

- (void)invalidate
{
  v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "invalidate", v9, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"TCPLink", @"IDS", @"invalidate");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"invalidate");
      }
    }
  }
  conns = self->_conns;
  if (conns)
  {
    do
    {
      var11 = conns->var11;
      int v6 = conns->var2 - 1;
      conns->var2 = v6;
      if (!v6) {
        sub_19DA12A50((unsigned int *)conns);
      }
      conns = var11;
    }
    while (var11);
  }
  self->_conns = 0;
  id getPacketLength = self->_getPacketLength;
  if (getPacketLength)
  {
    _Block_release(getPacketLength);
    id v8 = self->_getPacketLength;
    self->_id getPacketLength = 0;
  }
}

- (unint64_t)headerOverhead
{
  int addressFamily = self->_addressFamily;
  unint64_t v3 = 255;
  if (addressFamily == 30) {
    unint64_t v3 = 48;
  }
  if (addressFamily == 2) {
    return 28;
  }
  else {
    return v3;
  }
}

- (NSString)linkTypeString
{
  return (NSString *)@"TCP";
}

- (id)copyLinkStatsDict
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  int v6 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v4, self->_counters._totalBytesReceived, v5);
  v9 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v7, self->_counters._totalBytesSent, v8);
  id v12 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v10, self->_counters._totalPacketsReceived, v11);
  v15 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v13, self->_counters._totalPacketsSent, v14);
  v18 = objc_msgSend_initWithObjectsAndKeys_(v3, v16, (uint64_t)v6, v17, @"bytesReceived", v9, @"bytesSent", v12, @"packetsReceived", v15, @"packetsSent", 0);

  return v18;
}

- (int64_t)getPacketLength:(id *)a3 isChannelData:(BOOL *)a4
{
  return (*((uint64_t (**)(void))self->_getPacketLength + 2))();
}

- (IDSTCPConnection_)_getIDSTCPConnection:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_var18 = &a3->var18;
  p_var19 = &a3->var19;
  conns = self->_conns;
  if (conns)
  {
    while (!IsSameSA((uint64_t)&conns->var5, (uint64_t)p_var18) || !IsSameSA((uint64_t)&conns->var6, (uint64_t)p_var19))
    {
      conns = conns->var11;
      if (!conns) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v27 = v6;
    long long v28 = v6;
    long long v25 = v6;
    long long v26 = v6;
    long long v23 = v6;
    long long v24 = v6;
    *(_OWORD *)__str = v6;
    long long v22 = v6;
    *(_OWORD *)id v13 = v6;
    long long v14 = v6;
    long long v15 = v6;
    long long v16 = v6;
    long long v17 = v6;
    long long v18 = v6;
    long long v19 = v6;
    long long v20 = v6;
    SAToIPPortString(__str, 0x80uLL, (uint64_t)p_var18);
    SAToIPPortString(v13, 0x80uLL, (uint64_t)p_var19);
    objc_super v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = __str;
      __int16 v11 = 2080;
      id v12 = v13;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "no connection from %s to %s", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"TCPLink", @"IDS", @"no connection from %s to %s");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"no connection from %s to %s");
        }
      }
    }
    return 0;
  }
  return conns;
}

- (sockaddr)connect:(int)a3 localAddress:(sockaddr *)a4 portRange:(unsigned __int16)a5 remoteAddress:(sockaddr *)a6 clientUUID:(unsigned __int8)a7[16] completionHandler:(id)a8
{
  int v10 = a5;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  if (self->_getPacketLength)
  {
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v87 = v15;
    long long v88 = v15;
    long long v85 = v15;
    long long v86 = v15;
    long long v83 = v15;
    long long v84 = v15;
    *(_OWORD *)__str = v15;
    long long v82 = v15;
    long long v79 = v15;
    long long v80 = v15;
    long long v77 = v15;
    long long v78 = v15;
    long long v75 = v15;
    long long v76 = v15;
    *(_OWORD *)v73 = v15;
    long long v74 = v15;
    v68 = self;
    id aBlock = v14;
    int v71 = 1;
    long long v16 = (char *)malloc_type_calloc(1uLL, 0x150uLL, 0x10A0040BEA2227EuLL);
    id v67 = v14;
    if (v16
      && (long long v17 = sub_19DAD72C4(0x4000, 0), (*((void *)v16 + 2) = v17) != 0)
      && (long long v18 = _IDSLinkPacketBufferCreate(), (*((void *)v16 + 35) = v18) != 0))
    {
      if (a4->sa_family == 30) {
        int v19 = 30;
      }
      else {
        int v19 = 2;
      }
      int v20 = socket(v19, 1, 0);
      *(_DWORD *)long long v16 = v20;
      if (v20 < 0)
      {
        uint64_t v35 = *__error();
        IDSAssertNonFatalErrnoWithSource(v35, "TCPLink", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSTCPLink.m", 355, v36);
        v37 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v93 = 67109120;
          *(_DWORD *)&v93[4] = v35;
          _os_log_impl(&dword_19D9BE000, v37, OS_LOG_TYPE_DEFAULT, "socket failed: %d", v93, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"TCPLink", @"IDS", @"socket failed: %d");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"socket failed: %d");
            }
          }
        }
      }
      else
      {
        uu = a7;
        IDSCheckFileDescriptorUsageWithSource((uint64_t)"IDSTCPLink.m", 360, 0);
        v21 = (sockaddr *)(v16 + 24);
        __memcpy_chk();
        *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v97 = v22;
        long long v98 = v22;
        long long v95 = v22;
        long long v96 = v22;
        *(_OWORD *)&v93[32] = v22;
        long long v94 = v22;
        *(_OWORD *)v93 = v22;
        *(_OWORD *)&v93[16] = v22;
        if (v16[25] == 30)
        {
          *(_DWORD *)buf = 1;
          setsockopt(*(_DWORD *)v16, 41, 27, buf, 4u);
        }
        p_counters = &self->_counters;
        unsigned int v23 = *((unsigned __int16 *)v16 + 13);
        int v24 = v10 + 1;
LABEL_12:
        int v25 = 0;
        unsigned int v26 = bswap32(v23) >> 16;
        while (1)
        {
          socklen_t v27 = v16[24];
          socklen_t v72 = v27;
          *((_WORD *)v16 + 13) = bswap32(v26 + v25) >> 16;
          if (!bind(*(_DWORD *)v16, (const sockaddr *)(v16 + 24), v27)) {
            break;
          }
          SAToIPPortString(v93, 0x80uLL, (uint64_t)(v16 + 24));
          uint64_t v28 = *__error();
          uint64_t v29 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v90 = v93;
            __int16 v91 = 1024;
            int v92 = v28;
            _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "failed to bind to %s, errno: %d", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v62 = v93;
              uint64_t v63 = v28;
              _IDSLogTransport(@"TCPLink", @"IDS", @"failed to bind to %s, errno: %d");
              if (_IDSShouldLog())
              {
                v62 = v93;
                uint64_t v63 = v28;
                _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"failed to bind to %s, errno: %d");
              }
            }
          }
          if (!(_WORD)v23) {
            goto LABEL_106;
          }
          if (v24 == ++v25)
          {
            unsigned int v23 = 0;
            *((_WORD *)v16 + 13) = 0;
            goto LABEL_12;
          }
        }
        if (!(_WORD)v23 && getsockname(*(_DWORD *)v16, (sockaddr *)(v16 + 24), &v72) < 0)
        {
          int v52 = *__error();
          v53 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v90) = v52;
            _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "getsockname failed: %d", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"TCPLink", @"IDS", @"getsockname failed: %d");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"getsockname failed: %d");
              }
            }
          }
LABEL_106:
          int v54 = *__error();
          v55 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v93 = 67109120;
            *(_DWORD *)&v93[4] = v54;
            _os_log_impl(&dword_19D9BE000, v55, OS_LOG_TYPE_DEFAULT, "bind failed: %d", v93, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"TCPLink", @"IDS", @"bind failed: %d");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"bind failed: %d");
              }
            }
          }
          goto LABEL_30;
        }
        SAToIPPortString(v93, 0x80uLL, (uint64_t)(v16 + 24));
        v38 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v90 = v93;
          _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "bind to %s", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v62 = v93;
            _IDSLogTransport(@"TCPLink", @"IDS", @"bind to %s");
            if (_IDSShouldLog())
            {
              v62 = v93;
              _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"bind to %s");
            }
          }
        }
        if (setsockopt(*(_DWORD *)v16, 0xFFFF, 4130, &v71, 4u) < 0)
        {
          v42 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v93 = 0;
            _os_log_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_DEFAULT, "failed to turn on SO_NOSIGPIPE", v93, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"TCPLink", @"IDS", @"failed to turn on SO_NOSIGPIPE");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"failed to turn on SO_NOSIGPIPE");
              }
            }
          }
        }
        if (aBlock) {
          *((void *)v16 + 41) = _Block_copy(aBlock);
        }
        *((_DWORD *)v16 + 2) = 1;
        *((void *)v16 + 40) = v68;
        *((void *)v16 + 37) = p_counters;
        *((_DWORD *)v16 + 3) = objc_msgSend_isSSL(v68, v39, v40, v41, v62, v63);
        __memcpy_chk();
        *((_DWORD *)v16 + 76) = a3;
        v43 = (_DWORD *)*((void *)v16 + 35);
        v43[12] = a3;
        memcpy(v43 + 14, v16 + 24, v16[24]);
        memcpy(v43 + 46, a6, a6->sa_len);
        if (!uuid_is_null(uu))
        {
          *(void *)&v93[29] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v49 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)v93 = v49;
          *(_OWORD *)&v93[16] = v49;
          uuid_unparse(uu, v93);
          if (setsockopt(*(_DWORD *)v16, 0xFFFF, 4360, uu, 0x10u))
          {
            uint64_t v50 = *__error();
            v51 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v90 = v93;
              __int16 v91 = 1024;
              int v92 = v50;
              _os_log_impl(&dword_19D9BE000, v51, OS_LOG_TYPE_DEFAULT, "setsockopt SO_DELEGATED_UUID failed for %s, errno: %d", buf, 0x12u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v64 = v50;
                _IDSLogTransport(@"TCPLink", @"IDS", @"setsockopt SO_DELEGATED_UUID failed for %s, errno: %d");
                if (_IDSShouldLog())
                {
                  uint64_t v64 = v50;
                  _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"setsockopt SO_DELEGATED_UUID failed for %s, errno: %d");
                }
              }
            }
          }
          else
          {
            v60 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v90 = v93;
              _os_log_impl(&dword_19D9BE000, v60, OS_LOG_TYPE_DEFAULT, "setsockopt SO_DELEGATED_UUID for %s", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"TCPLink", @"IDS", @"setsockopt SO_DELEGATED_UUID for %s");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"setsockopt SO_DELEGATED_UUID for %s");
                }
              }
            }
          }
        }
        int v44 = fcntl(*(_DWORD *)v16, 3, 0, v64);
        if (v44 < 0 || fcntl(*(_DWORD *)v16, 4, v44 | 4u) < 0)
        {
          int v47 = *__error();
          v48 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v93 = 67109120;
            *(_DWORD *)&v93[4] = v47;
            _os_log_impl(&dword_19D9BE000, v48, OS_LOG_TYPE_DEFAULT, "fcntl failed: %d", v93, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"TCPLink", @"IDS", @"fcntl failed: %d");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"fcntl failed: %d");
              }
            }
          }
        }
        else
        {
          if ((connect(*(_DWORD *)v16, a6, a6->sa_len) & 0x80000000) == 0)
          {
            v45 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v93 = 0;
              _os_log_impl(&dword_19D9BE000, v45, OS_LOG_TYPE_DEFAULT, "asynchronous connect succeeded synchronously", v93, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"TCPLink", @"IDS", @"asynchronous connect succeeded synchronously");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"asynchronous connect succeeded synchronously");
                }
              }
            }
            sub_19DA12FD4((uint64_t)v16);
LABEL_80:

            SAToIPPortString(__str, 0x80uLL, (uint64_t)(v16 + 24));
            SAToIPPortString(v73, 0x80uLL, (uint64_t)(v16 + 152));
            v46 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v93 = 136315394;
              *(void *)&v93[4] = __str;
              *(_WORD *)&v93[12] = 2080;
              *(void *)&v93[14] = v73;
              _os_log_impl(&dword_19D9BE000, v46, OS_LOG_TYPE_DEFAULT, "opening TCP connection from %s to %s", v93, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"TCPLink", @"IDS", @"opening TCP connection from %s to %s");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"opening TCP connection from %s to %s");
                }
              }
            }
            v32 = v67;
            *((void *)v16 + 39) = v68->_conns;
            v68->_conns = (IDSTCPConnection_ *)v16;
            goto LABEL_45;
          }
          int v56 = *__error();
          if (v56 == 36)
          {
            unsigned int v57 = *(_DWORD *)v16;
            v70[0] = MEMORY[0x1E4F143A8];
            v70[1] = 3221225472;
            v70[2] = sub_19DA12CF0;
            v70[3] = &unk_1E5970A28;
            v70[4] = v16;
            IDSTransportThreadAddSocket(v57, 0, v70);
            v58 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              int v59 = *(_DWORD *)v16;
              *(_DWORD *)v93 = 67109120;
              *(_DWORD *)&v93[4] = v59;
              _os_log_impl(&dword_19D9BE000, v58, OS_LOG_TYPE_DEFAULT, "connect in progress for fd: %d", v93, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"TCPLink", @"IDS", @"connect in progress for fd: %d");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"connect in progress for fd: %d");
                }
              }
            }
            goto LABEL_80;
          }
          v61 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v93 = 67109120;
            *(_DWORD *)&v93[4] = v56;
            _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "connect failed: %d", v93, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"TCPLink", @"IDS", @"connect failed: %d");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"connect failed: %d");
              }
            }
          }
        }
      }
    }
    else
    {
      v30 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v93 = 0;
        _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "out of memory", v93, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"TCPLink", @"IDS", @"out of memory");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"out of memory");
          }
        }
      }
      if (!v16) {
        goto LABEL_31;
      }
    }
LABEL_30:
    sub_19DA12A50((unsigned int *)v16);
LABEL_31:

    v31 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v93 = 0;
      _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "failed to create connection", v93, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"TCPLink", @"IDS", @"failed to create connection");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"failed to create connection");
        }
      }
    }
    v21 = 0;
    v32 = v67;
    goto LABEL_45;
  }
  v33 = OSLogHandleForTransportCategory();
  v32 = v14;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v93 = 0;
    _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "link invalidated", v93, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"TCPLink", @"IDS", @"link invalidated");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"link invalidated");
      }
    }
  }
  v21 = 0;
LABEL_45:

  return v21;
}

- (BOOL)disconnect:(sockaddr_in *)a3 remoteAddress:(sockaddr_in *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!self->_getPacketLength)
  {
    id v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v20 = 0;
      _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "link invalidated", v20, 2u);
    }

    int v13 = os_log_shim_legacy_logging_enabled();
    if (!v13) {
      return v13;
    }
    int v13 = _IDSShouldLogTransport();
    if (!v13) {
      return v13;
    }
    _IDSLogTransport(@"TCPLink", @"IDS", @"link invalidated");
    int v13 = _IDSShouldLog();
    if (!v13) {
      return v13;
    }
    _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"link invalidated");
LABEL_26:
    LOBYTE(v13) = 0;
    return v13;
  }
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v26 = v4;
  long long v27 = v4;
  long long v24 = v4;
  long long v25 = v4;
  long long v22 = v4;
  long long v23 = v4;
  *(_OWORD *)int v20 = v4;
  long long v21 = v4;
  conns = self->_conns;
  p_conns = &self->_conns;
  long long v6 = conns;
  if (!conns)
  {
LABEL_14:
    SAToIPPortString((char *)v20, 0x80uLL, (uint64_t)a4);
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v19 = v20;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "no connection for %s", buf, 0xCu);
    }

    int v13 = os_log_shim_legacy_logging_enabled();
    if (!v13) {
      return v13;
    }
    int v13 = _IDSShouldLogTransport();
    if (!v13) {
      return v13;
    }
    _IDSLogTransport(@"TCPLink", @"IDS", @"no connection for %s");
    int v13 = _IDSShouldLog();
    if (!v13) {
      return v13;
    }
    _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"no connection for %s");
    goto LABEL_26;
  }
  double v8 = 0;
  while (1)
  {
    v9 = v6;
    if (*(void *)&v6->var5.ss_len == *(void *)&a3->sin_len
      && v6->var5.__ss_align == *(void *)a3->sin_zero
      && *(void *)&v6->var6.ss_len == *(void *)&a4->sin_len
      && v6->var6.__ss_align == *(void *)a4->sin_zero)
    {
      break;
    }
    long long v6 = v6->var11;
    double v8 = v9;
    if (!v6) {
      goto LABEL_14;
    }
  }
  if (v8) {
    p_var11 = &v8->var11;
  }
  else {
    p_var11 = p_conns;
  }
  *p_var11 = v6->var11;
  int v16 = v6->var2 - 1;
  v6->var2 = v16;
  if (!v16) {
    sub_19DA12A50((unsigned int *)v6);
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (void)processIncomingPacket:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_link_didReceivePacket_fromDeviceUniqueID_cbuuid_(WeakRetained, v5, (uint64_t)self, v6, a3, self->_deviceUniqueID, self->_cbuuid);
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  objc_super v7 = a3;
  return objc_msgSend_sendPacketBufferArray_arraySize_toDeviceUniqueID_cbuuid_(self, a2, (uint64_t)&v7, v5, 1, a4, a5);
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v14 = v11;
  if (!self->_getPacketLength)
  {
    long long v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_DEFAULT, "link invalidated", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"TCPLink", @"IDS", @"link invalidated");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"link invalidated");
        }
      }
    }
    unint64_t v20 = 6;
    goto LABEL_28;
  }
  if (v11 && (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)self->_cbuuid, v13) & 1) == 0)
  {
    long long v23 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      cbuuid = self->_cbuuid;
      *(_DWORD *)buf = 138412546;
      v33 = v14;
      __int16 v34 = 2112;
      uint64_t v35 = cbuuid;
      _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "wrong device: %@ %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"TCPLink", @"IDS", @"wrong device: %@ %@");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"wrong device: %@ %@");
        }
      }
    }
    unint64_t v20 = 10;
    goto LABEL_28;
  }
  if (a4 < 1)
  {
    unint64_t v20 = 11;
    goto LABEL_43;
  }
  uint64_t IDSTCPConnection = objc_msgSend__getIDSTCPConnection_(self, v12, (uint64_t)*a3, v13);
  if (!IDSTCPConnection)
  {
    unint64_t v20 = 11;
    goto LABEL_41;
  }
  uint64_t v18 = IDSTCPConnection;
  if ((*(_DWORD *)IDSTCPConnection & 0x80000000) == 0)
  {
    if (*(void *)(IDSTCPConnection + 288))
    {
      int v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "drop packet", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        _IDSLogTransport(@"TCPLink", @"IDS", @"drop packet");
        unint64_t v20 = 0;
        if ((_IDSShouldLog() & 1) == 0) {
          goto LABEL_41;
        }
        long long v21 = @"drop packet";
LABEL_38:
        _IDSLogV(0, @"IDSFoundation", @"TCPLink", v21);
        goto LABEL_41;
      }
      unint64_t v20 = 0;
      goto LABEL_41;
    }
    if (*(_DWORD *)(IDSTCPConnection + 12))
    {
      uint64_t v28 = a4;
      uint64_t v29 = a3;
      do
      {
        uint64_t v30 = (uint64_t)*v29++;
        unsigned int v31 = bswap32(*(unsigned __int16 *)(v30 + 16) + 3) >> 16;
        IDSLinkPacketBufferAddBufferStart((void *)v30, (const char *)0xFFFFFFF8, v16, v17);
        **(void **)uint64_t v30 = 66327;
        *(_WORD *)(*(void *)v30 + 3) = v31;
        --v28;
      }
      while (v28);
    }
    unint64_t v20 = sub_19DA11DF4(v18);
    if (v20 == 14)
    {
      if (*(unsigned char *)(v18 + 4)) {
        unint64_t v20 = 14;
      }
      else {
        unint64_t v20 = 0;
      }
    }
LABEL_28:
    if (a4 <= 0) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
  long long v25 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v25, OS_LOG_TYPE_DEFAULT, "connection closed", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(@"TCPLink", @"IDS", @"connection closed");
    unint64_t v20 = 6;
    if ((_IDSShouldLog() & 1) == 0) {
      goto LABEL_41;
    }
    long long v21 = @"connection closed";
    goto LABEL_38;
  }
  unint64_t v20 = 6;
LABEL_41:
  uint64_t v26 = a4;
  do
  {
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSTCPLink.m", (const char *)0x40E, (uint64_t)*a3++, v17);
    --v26;
  }
  while (v26);
LABEL_43:

  return v20;
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  double previousReportTime = self->_previousReportTime;
  if (previousReportTime == 0.0)
  {
    uint64_t v30 = 0;
  }
  else
  {
    double v7 = a3 - previousReportTime;
    unint64_t v8 = self->_counters._totalBytesSent - self->_previousCounters._totalBytesSent;
    unint64_t v9 = self->_counters._totalBytesReceived - self->_previousCounters._totalBytesReceived;
    unint64_t v34 = self->_counters._totalPacketsSent - self->_previousCounters._totalPacketsSent;
    uint64_t v35 = NSString;
    BOOL v33 = a4;
    id v10 = formattedBytes(v8, a2, previousReportTime);
    id v12 = formattedSpeed((unint64_t)((double)(8 * v8) / v7 + 0.5), v11, (double)(8 * v8) / v7 + 0.5);
    unint64_t totalPacketsSent = self->_counters._totalPacketsSent;
    uint64_t v16 = formattedBytes(self->_counters._totalBytesSent, v14, v15);
    unint64_t v17 = self->_counters._totalPacketsReceived - self->_previousCounters._totalPacketsReceived;
    unint64_t v20 = formattedBytes(v9, v18, v19);
    long long v22 = formattedSpeed((unint64_t)((double)(8 * v9) / v7 + 0.5), v21, (double)(8 * v9) / v7 + 0.5);
    unint64_t totalPacketsReceived = self->_counters._totalPacketsReceived;
    long long v27 = formattedBytes(self->_counters._totalBytesReceived, v24, v25);
    uint64_t v29 = 32;
    if (v33) {
      uint64_t v29 = 42;
    }
    uint64_t v30 = objc_msgSend_stringWithFormat_(v35, v26, @"%c Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n", v28, v29, v34, v10, v12, totalPacketsSent, v16, v17, v20, v22, totalPacketsReceived, v27);
  }
  self->_double previousReportTime = a3;
  long long v31 = *(_OWORD *)&self->_counters._totalBytesReceived;
  *(_OWORD *)&self->_previousCounters._totalBytesSent = *(_OWORD *)&self->_counters._totalBytesSent;
  *(_OWORD *)&self->_previousCounters._totalBytesReceived = v31;
  return v30;
}

- (void)setWiFiAssistState:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  conns = self->_conns;
  if (conns)
  {
    BOOL v4 = a3;
    if (a3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    uint64_t v7 = 136315650;
    do
    {
      if (objc_msgSend_containsIndex_(self->_cellularInterfaceIndices, a2, conns->var10, *(double *)&v7, v12, v13, v14))
      {
        int var0 = conns->var0;
        uint64_t v15 = v6;
        BOOL v16 = v4;
        int v9 = setsockopt(var0, 0xFFFF, 4387, &v15, 8u);
        if (!v9) {
          int v9 = setsockopt(var0, 0xFFFF, 4373, &v16, 4u);
        }
        if (v9 == -1)
        {
          id v10 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = *__error();
            *(_DWORD *)buf = 136315650;
            uint64_t v18 = "-[IDSTCPLink setWiFiAssistState:]";
            __int16 v19 = 1024;
            int v20 = 1087;
            __int16 v21 = 1024;
            int v22 = v11;
            _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d setsockopt failed %d", buf, 0x18u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            uint64_t v13 = 1087;
            uint64_t v14 = *__error();
            id v12 = "-[IDSTCPLink setWiFiAssistState:]";
            _IDSLogTransport(@"TCPLink", @"IDS", @"%s:%d setsockopt failed %d");
            if (_IDSShouldLog())
            {
              uint64_t v13 = 1087;
              uint64_t v14 = *__error();
              id v12 = "-[IDSTCPLink setWiFiAssistState:]";
              _IDSLogV(0, @"IDSFoundation", @"TCPLink", @"%s:%d setsockopt failed %d");
            }
          }
        }
        else
        {
          self->_wifiAssistEnabled = v4;
        }
      }
      conns = conns->var11;
    }
    while (conns);
  }
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCbuuid:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (IDSLinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IDSLinkDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSSL
{
  return self->_isSSL;
}

- (unint64_t)state
{
  return self->_state;
}

- (IDSLinkDelegate)alternateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateDelegate);
  return (IDSLinkDelegate *)WeakRetained;
}

- (void)setAlternateDelegate:(id)a3
{
}

- (NSIndexSet)cellularInterfaceIndices
{
  return self->_cellularInterfaceIndices;
}

- (void)setCellularInterfaceIndices:(id)a3
{
}

- (BOOL)wifiAssistEnabled
{
  return self->_wifiAssistEnabled;
}

- (void)setWifiAssistEnabled:(BOOL)a3
{
  self->_wifiAssistEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularInterfaceIndices, 0);
  objc_destroyWeak((id *)&self->_alternateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);
  objc_storeStrong(&self->_getPacketLength, 0);
}

@end