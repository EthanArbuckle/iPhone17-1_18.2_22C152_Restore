@interface IDSBTLELink
- (IDSBTLELink)initWithWPLinkManager:(id)a3 withIdentifier:(id)a4;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkID;
- (NSString)linkTypeString;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)_didReceiveData:(id)a3;
- (void)dealloc;
- (void)didReceiveData:(id)a3;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setHasSpaceAvailable:(BOOL)a3;
- (void)start;
@end

@implementation IDSBTLELink

- (IDSBTLELink)initWithWPLinkManager:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IDSBTLELink;
  v9 = [(IDSBTLELink *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wpLinkManager, a3);
    v11 = (NSString *)[v8 copy];
    linkID = v10->_linkID;
    v10->_linkID = v11;

    v13 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v10->_linkID];
    peerID = v10->_peerID;
    v10->_peerID = v13;

    objc_storeStrong((id *)&v10->_cbuuid, v10->_linkID);
    v10->_state = 0;
    if (qword_100A4A688 != -1) {
      dispatch_once(&qword_100A4A688, &stru_100982858);
    }
    v10->_previousReportTime = *(double *)&qword_100A4A690 * (double)mach_continuous_time();
  }

  return v10;
}

- (void)dealloc
{
  if (self->_incomingPacketBuffer) {
    _IDSLinkPacketBufferRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)IDSBTLELink;
  [(IDSBTLELink *)&v3 dealloc];
}

- (void)start
{
  if (self->_state <= 5)
  {
    self->_hasSpaceAvailable = 1;
    self->_state = 4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self didConnectForDeviceUniqueID:0 cbuuid:self->_cbuuid];
  }
}

- (unint64_t)headerOverhead
{
  return 2;
}

- (NSString)linkTypeString
{
  return (NSString *)@"BTLE";
}

- (id)copyLinkStatsDict
{
  id v3 = objc_alloc((Class)NSDictionary);
  v4 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesReceived];
  v5 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesSent];
  v6 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsReceived];
  id v7 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsSent];
  id v8 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"bytesReceived", v5, @"bytesSent", v6, @"packetsReceived", v7, @"packetsSent", 0);

  return v8;
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v9 && ([v9 isEqualToString:self->_cbuuid] & 1) == 0)
  {
    _IDSLinkPacketBufferRelease();
    unint64_t v11 = 10;
  }
  else if (self->_state == 4)
  {
    if (self->_outgoingData)
    {
      _IDSLinkPacketBufferRelease();
      unint64_t v11 = 1;
      self->_shouldSendHasSpaceAvailable = 1;
    }
    else if (a3->var2 <= 0)
    {
      _IDSLinkPacketBufferRelease();
      unint64_t v11 = 15;
    }
    else
    {
      int v12 = *a3->var0;
      if (v12 < 0)
      {
        __int16 v13 = bufferChecksum();
        IDSLinkPacketBufferAddBufferStart();
        *a3->var0 = v12;
        a3->var0[1] = HIBYTE(v13);
        a3->var0[2] = v13;
      }
      if (self->_hasSpaceAvailable)
      {
        int64x2_t v14 = vdupq_n_s64(1uLL);
        v14.i64[0] = a3->var2;
        *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v14);
        self->_hasSpaceAvailable = 0;
        objc_super v16 = +[NSData dataWithBytesNoCopy:a3->var0 length:a3->var2 freeWhenDone:0];
        unint64_t v11 = (unint64_t)[(IDSWPPacketSendingProtocol *)self->_wpLinkManager sendData:v16 peerID:self->_peerID];
      }
      else
      {
        v17 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:a3->var0 length:a3->var2];
        outgoingData = self->_outgoingData;
        self->_outgoingData = v17;

        self->_shouldSendHasSpaceAvailable = 1;
        unint64_t v11 = 13;
      }
      _IDSLinkPacketBufferRelease();
    }
  }
  else
  {
    _IDSLinkPacketBufferRelease();
    unint64_t v11 = 6;
  }

  return v11;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return 12;
}

- (void)setHasSpaceAvailable:(BOOL)a3
{
}

- (void)didReceiveData:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)_didReceiveData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&long long v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "didReceiveData length %luB", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v22 = v5;
    _IDSLogV();
  }
  int64x2_t v7 = vdupq_n_s64(1uLL);
  v7.i64[0] = (uint64_t)v5;
  *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v7);
  if ((unint64_t)objc_msgSend(v4, "length", v22) < 0x7D1)
  {
    if (![v4 length])
    {
      v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received zero-length data - rejecting", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      goto LABEL_44;
    }
    incomingPacketBuffer = self->_incomingPacketBuffer;
    if (!incomingPacketBuffer) {
      incomingPacketBuffer = ($7E5B20AA39B03BD07413883FE2814EDA *)_IDSLinkPacketBufferCreate();
    }
    [v4 getBytes:incomingPacketBuffer->var0 length:v5];
    incomingPacketBuffer->var2 = (int64_t)v5;
    int v11 = *incomingPacketBuffer->var0;
    if (v11 < 0)
    {
      if ((unint64_t)[v4 length] <= 2)
      {
        objc_super v16 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v4 length];
          *(_DWORD *)buf = 134217984;
          *(void *)&long long v28 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received data too small (%lu) - rejecting", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          goto LABEL_11;
        }
        goto LABEL_44;
      }
      unsigned int v18 = *(unsigned __int16 *)(incomingPacketBuffer->var0 + 1);
      uint64_t v19 = bufferChecksum();
      v20 = (void *)__rev16(v18);
      if (v20 != v19)
      {
        v21 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109890;
          LODWORD(v28) = v20;
          WORD2(v28) = 1024;
          *(_DWORD *)((char *)&v28 + 6) = v19;
          WORD5(v28) = 1024;
          HIDWORD(v28) = v5;
          __int16 v29 = 2112;
          id v30 = v4;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Data corruption! Checksum check failed (old:%04x new:%04x) data(%d): %@", buf, 0x1Eu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v25 = v5;
            id v26 = v4;
            id v23 = v20;
            id v24 = (id)v19;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v25 = v5;
              id v26 = v4;
              id v23 = v20;
              id v24 = (id)v19;
              _IDSLogV();
            }
          }
        }
        goto LABEL_42;
      }
      IDSLinkPacketBufferAddBufferStart();
      *incomingPacketBuffer->var0 = v11;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v13 = [WeakRetained link:self didReceivePacket:incomingPacketBuffer fromDeviceUniqueID:0 cbuuid:self->_cbuuid];

    if (v13)
    {
LABEL_43:
      IDSLinkPacketBufferResetBufferStart();
      self->_incomingPacketBuffer = incomingPacketBuffer;
      goto LABEL_44;
    }
    int64x2_t v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      LODWORD(v28) = v5;
      WORD2(v28) = 2112;
      *(void *)((char *)&v28 + 6) = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Data corruption! This data did not decode(%d): %@", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v23 = v5;
        id v24 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          _IDSLogV();
          [(IDSBTLELink *)self _localDetectedCorruption];
          goto LABEL_43;
        }
      }
    }
LABEL_42:
    [(IDSBTLELink *)self _localDetectedCorruption];
    goto LABEL_43;
  }
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 length];
    *(_DWORD *)buf = 134217984;
    *(void *)&long long v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received data too big (%lu) - rejecting", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
LABEL_11:
    [v4 length];
    _IDSLogV();
  }
LABEL_44:
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  if (self->_previousReportTime == 0.0)
  {
    id v9 = 0;
  }
  else
  {
    unint64_t state = self->_state;
    if (a4) {
      uint64_t v7 = 42;
    }
    else {
      uint64_t v7 = 32;
    }
    uint64_t v23 = v7;
    if (state > 6) {
      id v8 = "UnexpectedState";
    }
    else {
      id v8 = (const char *)_IDSLinkStateStrings[state];
    }
    id v22 = v8;
    unint64_t v21 = self->_totalPacketsSent - self->_previousPacketsSent;
    v10 = formattedBytes();
    int v11 = formattedSpeed();
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    unsigned __int8 v13 = formattedBytes();
    unint64_t v14 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    v15 = formattedBytes();
    objc_super v16 = formattedSpeed();
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    unsigned int v18 = formattedBytes();
    id v9 = +[NSString stringWithFormat:@"%c BTLE      (%s) Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n", v23, v22, v21, v10, v11, totalPacketsSent, v13, v14, v15, v16, totalPacketsReceived, v18];
  }
  self->_previousReportTime = a3;
  long long v19 = *(_OWORD *)&self->_totalBytesReceived;
  *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
  *(_OWORD *)&self->_previousBytesReceived = v19;

  return v9;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)linkID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCbuuid:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
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

- (IDSLinkDelegate)alternateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateDelegate);

  return (IDSLinkDelegate *)WeakRetained;
}

- (void)setAlternateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alternateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outgoingData, 0);
  objc_storeStrong((id *)&self->_wpLinkManager, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_linkID, 0);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);

  objc_storeStrong((id *)&self->_cbuuid, 0);
}

@end