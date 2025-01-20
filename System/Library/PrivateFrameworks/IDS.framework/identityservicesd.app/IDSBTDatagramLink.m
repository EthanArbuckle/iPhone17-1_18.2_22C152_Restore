@interface IDSBTDatagramLink
- (IDSBTDatagramLink)initWithPipe:(id)a3 withDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkTypeString;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)_processIncomingPacket;
- (void)dealloc;
- (void)invalidate;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)start;
@end

@implementation IDSBTDatagramLink

- (IDSBTDatagramLink)initWithPipe:(id)a3 withDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IDSBTDatagramLink;
  v12 = [(IDSBTDatagramLink *)&v19 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v12->_pipe, a3);
  v14 = (channel *)[v9 channel];
  v13->_channel = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v13->_cbuuid, kIDSDefaultPairedDeviceID);
    objc_storeStrong((id *)&v13->_deviceUniqueID, a4);
LABEL_4:
    v15 = v13;
    goto LABEL_12;
  }
  v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "-init failed due to null channel", (uint8_t *)v18, 2u);
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
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)dealloc
{
  [(IDSBTDatagramLink *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)IDSBTDatagramLink;
  [(IDSBTDatagramLink *)&v3 dealloc];
}

- (void)invalidate
{
  p_channel = &self->_channel;
  if (self->_channel) {
    int fd = os_channel_get_fd();
  }
  else {
    int fd = -1;
  }
  v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    channel = self->_channel;
    rxRing = self->_rxRing;
    txRing = self->_txRing;
    *(_DWORD *)buf = 138413314;
    id v11 = self;
    __int16 v12 = 2048;
    v13 = channel;
    __int16 v14 = 1024;
    int v15 = fd;
    __int16 v16 = 2048;
    v17 = rxRing;
    __int16 v18 = 2048;
    objc_super v19 = txRing;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ -invalidate called. Channel %p fd %d rxRing %p txRing %p", buf, 0x30u);
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
  self->_state = 5;
  if (fd != -1) {
    IDSTransportThreadRemoveSocket();
  }
  _IDSLinkPacketBufferRelease();
  *(_OWORD *)p_channel = 0u;
  *((_OWORD *)p_channel + 1) = 0u;
  pipe = self->_pipe;
  self->_pipe = 0;
}

- (unint64_t)headerOverhead
{
  return -1;
}

- (NSString)linkTypeString
{
  return (NSString *)@"MagnetIso";
}

- (void)start
{
  int fd = os_channel_get_fd();
  os_channel_ring_id();
  self->_rxRing = (channel_ring_desc *)os_channel_rx_ring();
  os_channel_ring_id();
  self->_txRing = (channel_ring_desc *)os_channel_tx_ring();
  v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    channel = self->_channel;
    rxRing = self->_rxRing;
    txRing = self->_txRing;
    *(_DWORD *)buf = 134218752;
    id v9 = channel;
    __int16 v10 = 1024;
    int v11 = fd;
    __int16 v12 = 2048;
    v13 = rxRing;
    __int16 v14 = 2048;
    int v15 = txRing;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "-start called. Channel %p fd %d rxRing %p txRing %p", buf, 0x26u);
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
  IDSTransportThreadAddSocket();
  self->_state = 4;
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_channel)
  {
    if (a3->var2 >= 676)
    {
      __int16 v10 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var2 = a3->var2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = var2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DLW 0/%d (packet size too large for link)", buf, 8u);
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
      _IDSLinkPacketBufferRelease();
LABEL_21:
      unint64_t v12 = 4;
      goto LABEL_43;
    }
    if (os_channel_available_slot_count()
      || (os_channel_sync(), os_channel_available_slot_count()))
    {
      *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v31 = v13;
      long long v32 = v13;
      *(_OWORD *)buf = v13;
      *(_OWORD *)__dst = v13;
      os_channel_get_next_slot();
      int64_t v14 = a3->var2;
      if (v14 > *(unsigned __int16 *)&buf[2])
      {
        int v15 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v16 = a3->var2;
          *(_DWORD *)v25 = 67109376;
          int v26 = v16;
          __int16 v27 = 1024;
          int v28 = *(unsigned __int16 *)&buf[2];
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DLW 0/%d (slot %d too small)", v25, 0xEu);
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
        _IDSLinkPacketBufferRelease();
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      *(_WORD *)&buf[2] = v14;
      memcpy(__dst[0], a3->var0, v14);
      os_channel_set_slot_properties();
      int v17 = os_channel_advance_slot();
      if (v17)
      {
        __int16 v18 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v25 = 67109120;
          int v26 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "advance_slot failed for write %d", v25, 8u);
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
      os_channel_sync();
      objc_super v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v20 = a3->var2;
        *(_DWORD *)v25 = 67109120;
        int v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DLW %d", v25, 8u);
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
      int64x2_t v21 = vdupq_n_s64(1uLL);
      v21.i64[0] = a3->var2;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v21);
      _IDSLinkPacketBufferRelease();
      unint64_t v12 = 0;
    }
    else
    {
      v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v23 = a3->var2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DLW 0/%d (no space)", buf, 8u);
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
      _IDSLinkPacketBufferRelease();
      unint64_t v12 = 14;
    }
  }
  else
  {
    _IDSLinkPacketBufferRelease();
    unint64_t v12 = 6;
  }
LABEL_43:

  return v12;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return 12;
}

- (void)_processIncomingPacket
{
  currentIncomingPacket = self->_currentIncomingPacket;
  if (!currentIncomingPacket)
  {
    currentIncomingPacket = ($7E5B20AA39B03BD07413883FE2814EDA *)_IDSLinkPacketBufferCreate();
    self->_currentIncomingPacket = currentIncomingPacket;
  }
  int v4 = os_channel_available_slot_count();
  if (v4)
  {
    int v5 = v4;
    uint64_t v20 = vdupq_n_s64(1uLL).i64[1];
    while (1)
    {
      *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v27 = v6;
      long long v28 = v6;
      *(_OWORD *)__n = v6;
      *(_OWORD *)__src = v6;
      os_channel_get_next_slot();
      if (currentIncomingPacket->var1 < WORD1(__n[0])) {
        break;
      }
      memcpy(currentIncomingPacket->var0, __src[0], WORD1(__n[0]));
      currentIncomingPacket->int64_t var2 = WORD1(__n[0]);
      v7 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var2 = currentIncomingPacket->var2;
        *(_DWORD *)buf = 67109120;
        int v22 = var2;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DLR %d", buf, 8u);
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
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v10 = [WeakRetained link:self didReceivePacket:currentIncomingPacket fromDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

      if ((v10 & 1) == 0)
      {
        int v11 = +[NSData dataWithBytesNoCopy:currentIncomingPacket->var0 length:currentIncomingPacket->var2 freeWhenDone:0];
        unint64_t v12 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v13 = currentIncomingPacket->var2;
          *(_DWORD *)buf = 67109378;
          int v22 = v13;
          __int16 v23 = 2112;
          v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Magnet corruption? This packet(%dB) did not decode! data %@", buf, 0x12u);
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
      v14.i64[1] = v20;
      v14.i64[0] = SLODWORD(currentIncomingPacket->var2);
      *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(v14, *(int64x2_t *)&self->_totalBytesReceived);
      IDSLinkPacketBufferResetBufferStart();
      if (!--v5) {
        goto LABEL_34;
      }
    }
    int64_t v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t var1 = currentIncomingPacket->var1;
      *(_DWORD *)buf = 67109376;
      int v22 = WORD1(__n[0]);
      __int16 v23 = 1024;
      LODWORD(v24) = var1;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DLR 0/%d (packetBuffer %d too small)", buf, 0xEu);
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
LABEL_34:
    int v18 = os_channel_advance_slot();
    if (v18)
    {
      objc_super v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__n[0]) = 67109120;
        HIDWORD(__n[0]) = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "os_channel_advance_slot failed for read %d", (uint8_t *)__n, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    os_channel_sync();
  }
  else
  {
    int v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__n[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "os_channel_available_slot_count gave no slots to read", (uint8_t *)__n, 2u);
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
    int v22 = v8;
    unint64_t v21 = self->_totalPacketsSent - self->_previousPacketsSent;
    unsigned __int8 v10 = formattedBytes();
    int v11 = formattedSpeed();
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    int64_t v13 = formattedBytes();
    unint64_t v14 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    int v15 = formattedBytes();
    int64_t v16 = formattedSpeed();
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    int v18 = formattedBytes();
    id v9 = +[NSString stringWithFormat:@"%c MagnetIso(%s)  Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n", v23, v22, v21, v10, v11, totalPacketsSent, v13, v14, v15, v16, totalPacketsReceived, v18];
  }
  self->_previousReportTime = a3;
  long long v19 = *(_OWORD *)&self->_totalBytesReceived;
  *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
  *(_OWORD *)&self->_previousBytesReceived = v19;

  return v9;
}

- (id)copyLinkStatsDict
{
  id v3 = objc_alloc((Class)NSDictionary);
  int v4 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesReceived];
  int v5 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesSent];
  long long v6 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsReceived];
  uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsSent];
  id v8 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"bytesReceived", v5, @"bytesSent", v6, @"packetsReceived", v7, @"packetsSent", 0);

  return v8;
}

- (unint64_t)state
{
  return self->_state;
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
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);

  objc_storeStrong((id *)&self->_cbuuid, 0);
}

@end