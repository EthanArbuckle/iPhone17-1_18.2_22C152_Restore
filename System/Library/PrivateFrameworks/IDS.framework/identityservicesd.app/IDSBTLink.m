@interface IDSBTLink
- (BOOL)isLinkSuspended;
- (IDSBTLink)initWithPipe:(id)a3 useSkywalkChannel:(BOOL)a4 withDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkID;
- (NSString)linkTypeString;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (int64_t)_readFromDataChannel:(void *)a3 size:(unint64_t)a4 withFlags:(int)a5 isSynced:(BOOL *)a6;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)_dumpLogs:(double)a3 isDownstream:(BOOL)a4;
- (void)_localDetectedCorruption;
- (void)_processIncomingPacket;
- (void)_processOutgoingPacket;
- (void)_resetMagnetCorruptionMetrics;
- (void)_submitMagnetCorruptionMetricsToAWD;
- (void)dealloc;
- (void)flushBuffer:(unint64_t)a3;
- (void)injectFakePacket:(id *)a3;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)remoteDetectedCorruption;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)start;
- (void)suspendLink:(BOOL)a3;
@end

@implementation IDSBTLink

- (unint64_t)headerOverhead
{
  return 2;
}

- (NSString)linkTypeString
{
  return (NSString *)@"Magnet";
}

- (id)copyLinkStatsDict
{
  id v3 = objc_alloc((Class)NSDictionary);
  v4 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesReceived];
  v5 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesSent];
  v6 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsReceived];
  v7 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsSent];
  id v8 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"bytesReceived", v5, @"bytesSent", v6, @"packetsReceived", v7, @"packetsSent", 0);

  return v8;
}

- (IDSBTLink)initWithPipe:(id)a3 useSkywalkChannel:(BOOL)a4 withDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)IDSBTLink;
  v14 = [(IDSBTLink *)&v35 init];
  v15 = v14;
  if (v14)
  {
    p_pipe = (id *)&v14->_pipe;
    objc_storeStrong((id *)&v14->_pipe, a3);
    *(_DWORD *)buffer = -1;
    if (v8)
    {
      id v17 = [v11 channel];
      v18 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = *p_pipe;
        *(_DWORD *)buf = 134218242;
        *(void *)v37 = v17;
        *(_WORD *)&v37[8] = 2112;
        *(void *)&v37[10] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "retrieved os channel %p from pipe %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v31 = v17;
          id v32 = *p_pipe;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v31 = v17;
            id v32 = *p_pipe;
            _IDSLogV();
          }
        }
      }
      if (v17) {
        goto LABEL_19;
      }
    }
    objc_msgSend(*p_pipe, "output", v31, v32);
    v20 = (__CFWriteStream *)objc_claimAutoreleasedReturnValue();
    CFDataRef v21 = (const __CFData *)CFWriteStreamCopyProperty(v20, kCFStreamPropertySocketNativeHandle);

    if (v21)
    {
      v38.location = 0;
      v38.length = 4;
      CFDataGetBytes(v21, v38, buffer);
      CFRelease(v21);
      v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = *p_pipe;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v37 = *(_DWORD *)buffer;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "retrieved native socket %d from pipe %@", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v33 = *p_pipe;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v33 = *p_pipe;
            _IDSLogV();
          }
        }
      }
      int v24 = fcntl(*(int *)buffer, 3, 0, v33);
      if (v24 != -1 && fcntl(*(int *)buffer, 4, v24 | 4u) != -1)
      {
LABEL_19:
        v15->_dataChannel = (__IDSOSDataChannel *)IDSOSDataChannelCreate();
        v15->_dataChannelPendingTx = 0;
        objc_storeStrong((id *)&v15->_cbuuid, kIDSDefaultPairedDeviceID);
        objc_storeStrong((id *)&v15->_deviceUniqueID, a5);
        v15->_state = 2;
        if (qword_100A4CA40 != -1) {
          dispatch_once(&qword_100A4CA40, &stru_10098CCD8);
        }
        v15->_previousReportTime = *(double *)&qword_100A4CA48 * (double)mach_continuous_time();
        *(_WORD *)&v15->_remoteHostAwake = 1;
        v25 = [v11 peer];
        [v25 addObserver:v15 forKeyPath:@"hostState" options:0 context:0];

        goto LABEL_22;
      }
      v27 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v37 = *(_DWORD *)buffer;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "fcntl failed with socket %d", buf, 8u);
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
    else
    {
      v28 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = *p_pipe;
        *(_DWORD *)buf = 138412290;
        *(void *)v37 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "CFWriteStreamCopyProperty(kCFStreamPropertySocketNativeHandle) failed with pipe %@", buf, 0xCu);
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
    v26 = 0;
    goto LABEL_36;
  }
LABEL_22:
  v26 = v15;
LABEL_36:

  return v26;
}

- (void)dealloc
{
  [(IDSBTLink *)self invalidate];
  if (self->_currentIncomingPacket)
  {
    _IDSLinkPacketBufferRelease();
    self->_currentIncomingPacket = 0;
  }
  if (self->_currentOutgoingPacket)
  {
    _IDSLinkPacketBufferRelease();
    self->_currentOutgoingPacket = 0;
  }
  id v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pipe = self->_pipe;
    *(_DWORD *)buf = 138412290;
    v10 = pipe;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "releasing pipe %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v7 = self->_pipe;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v7 = self->_pipe;
        _IDSLogV();
      }
    }
  }
  v5 = [(CBScalablePipe *)self->_pipe peer];
  [v5 removeObserver:self forKeyPath:@"hostState" context:0];

  v6 = self->_pipe;
  self->_pipe = 0;

  v8.receiver = self;
  v8.super_class = (Class)IDSBTLink;
  [(IDSBTLink *)&v8 dealloc];
}

- (void)_localDetectedCorruption
{
  if (qword_100A4CA40 != -1) {
    dispatch_once(&qword_100A4CA40, &stru_10098CCD8);
  }
  double v3 = *(double *)&qword_100A4CA48 * (double)mach_continuous_time();
  v4 = (void *)_IDSLinkPacketBufferCreate();
  *(unsigned char *)void *v4 = 1;
  *(unsigned char *)(*v4 + 1) = 68;
  uint64_t v5 = v4[1] - 1;
  ++*v4;
  v4[1] = v5;
  v4[2] = 1;
  unint64_t v6 = [(IDSBTLink *)self sendPacketBuffer:v4 toDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];
  if (v6 == 13 || v6 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self hasSpaceAvailable:0 deviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];
  }
  self->_resyncing = 1;
  self->_lastResyncTime = v3;
  if (!self->_magnetCorruptionRecoveryMode)
  {
    self->_lastNewMagnetCorruptionTime = v3;
    self->_magnetCorruptionRecoveryMode = 1;
  }

  [(IDSBTLink *)self _dumpLogs:1 isDownstream:v3];
}

- (void)_dumpLogs:(double)a3 isDownstream:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 200;
  }
  else {
    uint64_t v5 = 208;
  }
  if (a3 - *(double *)((char *)&self->super.isa + v5) > 60.0)
  {
    if (IMGetDomainBoolForKey())
    {
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v13[3] = v8;
      v13[4] = v8;
      v13[1] = v8;
      v13[2] = v8;
      v13[0] = v8;
      snprintf((char *)v13, 0x50uLL, "/bin/cp /dev/uart.log /tmp/uart-%.06f.log", a3);
      IMPerformSystem();
      dispatch_time_t v9 = dispatch_time(0, 5000000000);
      v10 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10040A60C;
      block[3] = &unk_100986EF0;
      BOOL v16 = a4;
      dispatch_after(v9, v10, block);
    }
    if (IMGetDomainBoolForKey())
    {
      id v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DontSubmitDataCorruptionToAggd is set. Not submitting to aggd", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    else
    {
      id v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "submitting aggd metric - MagnetDataCorruption", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      IMSubmitSimpleAggegateMetric();
      IMSubmitSimpleCoreAnalyticsMetric();
    }
    IMSubmitSimpleAWDMetric();
    *(double *)((char *)&self->super.isa + v5) = a3;
  }
}

- (void)_resetMagnetCorruptionMetrics
{
  self->_discardedRawBytes = 0;
  self->_correctRawBytesSinceLastCorruption = 0;
  self->_correctFramesSinceLastCorruption = 0;
}

- (void)_submitMagnetCorruptionMetricsToAWD
{
  if (self->_previousCorruptionsDetected)
  {
    unint64_t v3 = (unint64_t)((self->_lastResyncTime - self->_lastNewMagnetCorruptionTime) * 1000.0);
    v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t correctRawBytesSinceLastCorruption = self->_correctRawBytesSinceLastCorruption;
      unint64_t correctFramesSinceLastCorruption = self->_correctFramesSinceLastCorruption;
      unint64_t discardedRawBytes = self->_discardedRawBytes;
      *(_DWORD *)buf = 134218752;
      unint64_t v15 = correctFramesSinceLastCorruption;
      __int16 v16 = 2048;
      unint64_t v17 = correctRawBytesSinceLastCorruption;
      __int16 v18 = 2048;
      unint64_t v19 = discardedRawBytes;
      __int16 v20 = 2048;
      unint64_t v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "submitting IDSMagnetCorruptionDetailedEvent: unint64_t correctFramesSinceLastCorruption = %lld, correctRawBytesSinceLastCorruption = %lld, discardedRawBytes = %lld, magnetDataCorruptionRecoveryTimeInMs = %lld ms", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    id v8 = objc_alloc((Class)IDSMagnetCorruptionMetric);
    unint64_t v10 = self->_correctFramesSinceLastCorruption;
    p_unint64_t correctFramesSinceLastCorruption = &self->_correctFramesSinceLastCorruption;
    id v11 = [v8 initWithCorrectFramesSinceLastCorruption:v10 correctRawBytesSinceLastCorruption:*(p_correctFramesSinceLastCorruption - 1) discardedRawBytes:*(p_correctFramesSinceLastCorruption - 2) recoveryTimeInMs:v3 linkType:1];
    id v12 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v12 logMetric:v11];

    id v13 = +[IDSAWDLogging sharedInstance];
    [v13 IDSMagnetCorruptionDetailedEvent:*p_correctFramesSinceLastCorruption correctRawBytesSinceLastCorruption:*(p_correctFramesSinceLastCorruption - 1) discardedRawBytes:*(p_correctFramesSinceLastCorruption - 2) recoveryTimeInMs:v3 linkType:1];
  }
  else
  {
    self->_previousCorruptionsDetected = 1;
  }
}

- (void)start
{
  self->_writeSuspended = 0;
}

- (void)remoteDetectedCorruption
{
  unint64_t v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote device detected data corruption", v4, 2u);
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
  if (qword_100A4CA40 != -1) {
    dispatch_once(&qword_100A4CA40, &stru_10098CCD8);
  }
  [(IDSBTLink *)self _dumpLogs:0 isDownstream:*(double *)&qword_100A4CA48 * (double)mach_continuous_time()];
}

- (void)invalidate
{
  if (self->_dataChannel)
  {
    IDSOSDataChannelFd();
    IDSTransportThreadRemoveSocket();
    IDSOSDataChannelDestroy();
    self->_dataChannel = 0;
    self->_dataChannelPendingTx = 0;
  }
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = v9;
  if (v9 && ([v9 isEqualToString:self->_cbuuid] & 1) == 0)
  {
    _IDSLinkPacketBufferRelease();
    unint64_t v11 = 10;
    goto LABEL_10;
  }
  if (!a3->var0)
  {
    _IDSLinkPacketBufferRelease();
    unint64_t v11 = 9;
    goto LABEL_10;
  }
  if (self->_state != 4)
  {
    _IDSLinkPacketBufferRelease();
    unint64_t v11 = 6;
    goto LABEL_10;
  }
  if (self->_currentOutgoingPacket) {
    goto LABEL_6;
  }
  int v13 = *a3->var0;
  if (v13 < 0)
  {
    __int16 v14 = bufferChecksum();
    IDSLinkPacketBufferAddBufferStart();
    *a3->var0 = v13;
    a3->var0[1] = HIBYTE(v14);
    a3->var0[2] = v14;
  }
  int64_t var2 = a3->var2;
  if (var2 > 127)
  {
    unsigned int v17 = (var2 >> 8) | 0xFFFFFF80;
    if (var2 + 2 <= a3->var1)
    {
      IDSLinkPacketBufferAddBufferStart();
      *a3->var0 = v17;
      a3->var0[1] = var2;
    }
    else
    {
      __int16 v18 = ($7E5B20AA39B03BD07413883FE2814EDA *)_IDSLinkPacketBufferCreate();
      *v18->var0 = v17;
      v18->var0[1] = var2;
      memcpy(v18->var0 + 2, a3->var0, var2);
      v18->int64_t var2 = var2 + 2;
      _IDSLinkPacketBufferRelease();
      a3 = v18;
    }
  }
  else
  {
    __int16 v16 = a3->var0--;
    a3->int64_t var2 = var2 + 1;
    *(v16 - 1) = var2;
  }
  a3->var3 = a3->var2;
  a3->var9 = 1;
  uint64_t v19 = IDSOSDataChannelWrite();
  int v20 = *__error();
  unint64_t v21 = +[IDSFoundationLog BTLink];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v22 = a3->var2;
    char var26 = a3->var26;
    if (!var26) {
      char var26 = 42;
    }
    int var27 = a3->var27;
    *(_DWORD *)buf = 67110144;
    int v30 = v19;
    __int16 v31 = 1024;
    int v32 = v22;
    __int16 v33 = 1024;
    int v34 = 45;
    __int16 v35 = 1024;
    int v36 = var26;
    __int16 v37 = 1024;
    int v38 = var27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "LMW %d/%d %c =%c (s:%d)", buf, 0x20u);
  }

  if (!v19)
  {
LABEL_6:
    _IDSLinkPacketBufferRelease();
    unint64_t v11 = 1;
    goto LABEL_10;
  }
  if (v19 < 1)
  {
    v26 = +[IDSFoundationLog BTLink];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      char v27 = a3->var26;
      if (!v27) {
        char v27 = 42;
      }
      int v28 = a3->var27;
      *(_DWORD *)buf = 67109632;
      int v30 = v20;
      __int16 v31 = 1024;
      int v32 = v27;
      __int16 v33 = 1024;
      int v34 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "LMW errno %d =%c (s:%d)", buf, 0x14u);
    }

    if (v20 != 35 && v20 != 55)
    {
      [(IDSBTLink *)self invalidate];
      _IDSLinkPacketBufferRelease();
      unint64_t v11 = 11;
      goto LABEL_10;
    }
  }
  else
  {
    IDSLinkPacketBufferAddBufferStart();
    if (!a3->var2)
    {
      int64x2_t v25 = vdupq_n_s64(1uLL);
      v25.i64[0] = a3->var3;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v25);
      _IDSLinkPacketBufferRelease();
      if ((v13 & 0x20) != 0) {
        kdebug_trace();
      }
      unint64_t v11 = 0;
      goto LABEL_10;
    }
  }
  self->_currentOutgoingPacket = a3;
  if (self->_writeSuspended)
  {
    IDSOSDataChannelFd();
    IDSTransportThreadResumeSocket();
    self->_writeSuspended = 0;
  }
  unint64_t v11 = 13;
LABEL_10:

  return v11;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return 12;
}

- (void)flushBuffer:(unint64_t)a3
{
  if (a3 >= 2) {
    sub_100724540();
  }
  BOOL v3 = a3 == 0;
  p_dataChannelPendingTx = &self->_dataChannelPendingTx;
  dataChannel = self->_dataChannel;

  _IDSOSDataChannelSync(dataChannel, v3, p_dataChannelPendingTx);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(CBScalablePipe *)self->_pipe peer];
  int v13 = v12;
  if (v12)
  {
    if ([v12 hostState])
    {
      id v14 = [v13 hostState];
      BOOL v15 = v14 != (id)1;
      if (v14 == (id)1) {
        CFStringRef v16 = @"asleep";
      }
      else {
        CFStringRef v16 = @"awake";
      }
    }
    else
    {
      BOOL v15 = 1;
      CFStringRef v16 = @"unknown";
    }
  }
  else
  {
    BOOL v15 = 1;
    CFStringRef v16 = @"nil peer";
  }
  unsigned int v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    cbuuid = self->_cbuuid;
    CFStringRef v19 = @"NO";
    *(_DWORD *)buf = 138412802;
    if (v15) {
      CFStringRef v19 = @"YES";
    }
    int v24 = cbuuid;
    __int16 v25 = 2112;
    CFStringRef v26 = v16;
    __int16 v27 = 2112;
    CFStringRef v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BT reports %@ as (%@) interpreting as awake? %@.", buf, 0x20u);
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
  if (self->_remoteHostAwake != v15 || !self->_postedFirstHostStateChange)
  {
    self->_remoteHostAwake = v15;
    self->_postedFirstHostStateChange = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 link:self hostAwakeDidChange:self->_remoteHostAwake deviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];
    }
  }
}

- (int64_t)_readFromDataChannel:(void *)a3 size:(unint64_t)a4 withFlags:(int)a5 isSynced:(BOOL *)a6
{
  return _IDSOSDataChannelRead(self->_dataChannel, a3, a4, *(void *)&a5, a6);
}

- (void)_processIncomingPacket
{
  currentIncomingPacket = self->_currentIncomingPacket;
  if (!currentIncomingPacket) {
    currentIncomingPacket = ($7E5B20AA39B03BD07413883FE2814EDA *)_IDSLinkPacketBufferCreate();
  }
  if (self->_resyncing)
  {
    while (1)
    {
LABEL_4:
      char v91 = -86;
      unint64_t var1 = currentIncomingPacket->var1;
      uint64_t v5 = -[IDSBTLink _readFromDataChannel:size:withFlags:isSynced:](self, "_readFromDataChannel:size:withFlags:isSynced:", currentIncomingPacket->var0, var1, 0, &v91, v78, v79, v80, v81, v82, v83, v84);
      int v6 = *__error();
      v7 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (v91) {
          int v8 = 115;
        }
        else {
          int v8 = 45;
        }
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v93 = v5;
        *(_WORD *)&v93[4] = 1024;
        *(_DWORD *)&v93[6] = var1;
        *(_WORD *)v94 = 1024;
        *(_DWORD *)&v94[2] = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Link manager read %d/%d bytes during resync %c", buf, 0x14u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        uint64_t v9 = 115;
        if (!v91) {
          uint64_t v9 = 45;
        }
        uint64_t v79 = var1;
        uint64_t v80 = v9;
        uint64_t v78 = v5;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          if (v91) {
            uint64_t v10 = 115;
          }
          else {
            uint64_t v10 = 45;
          }
          uint64_t v79 = var1;
          uint64_t v80 = v10;
          uint64_t v78 = v5;
          _IDSLogV();
        }
      }
      self->_discardedRawBytes += v5;
      if (v5 < 0 && v6 != 35) {
        break;
      }
      BOOL v12 = v5 < 0 || v5 < var1;
      if (v12)
      {
        if (v5 < 1)
        {
          v66 = 0;
        }
        else
        {
          v66 = +[NSData dataWithBytesNoCopy:currentIncomingPacket->var0 length:v5 freeWhenDone:0];
        }
        v67 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v93 = v5;
          *(_WORD *)&v93[4] = 1024;
          *(_DWORD *)&v93[6] = var1;
          *(_WORD *)v94 = 2112;
          *(void *)&v94[2] = v66;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Magnet corruption! received %dB with %dB buffer. Resync incoming stream done! content = %@", buf, 0x18u);
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

        self->_resyncing = 0;
        IDSLinkPacketBufferResetBufferStart();
        self->_currentIncomingPacket = currentIncomingPacket;
        if (qword_100A4CA40 != -1) {
          dispatch_once(&qword_100A4CA40, &stru_10098CCD8);
        }
        double v68 = *(double *)&qword_100A4CA48 * (double)mach_continuous_time();
        double lastResyncTime = self->_lastResyncTime;
        self->_double lastResyncTime = v68;
        if (IMGetDomainBoolForKey())
        {
          v70 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v93 = (unint64_t)((v68 - lastResyncTime) * 1000.0);
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "DontSubmitDataCorruptionToAggd is set. Not submitting MagnetDataCorruptionRecoveryTimeInMs = %lld ms to aggd", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
        }
        else
        {
          id v71 = [objc_alloc((Class)IDSMagnetDataCorruptionRecoveryTimeInMsMetric) initWithRecoveryTime:(unint64_t)((v68 - lastResyncTime) * 1000.0)];
          v72 = +[IDSCoreAnalyticsLogger defaultLogger];
          [v72 logMetric:v71];

          v73 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v93 = (unint64_t)((v68 - lastResyncTime) * 1000.0);
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "submitting aggd metric - MagnetDataCorruptionRecoveryTimeInMs = %lld ms", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          IMSubmitSimpleAggegateMetric();
          IMSubmitSimpleAWDMetric();
          IMSubmitSimpleCoreAnalyticsMetric();
        }
        return;
      }
      id v14 = +[NSData dataWithBytesNoCopy:currentIncomingPacket->var0 length:v5 freeWhenDone:0];
      BOOL v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v93 = v5;
        *(_WORD *)&v93[4] = 1024;
        *(_DWORD *)&v93[6] = var1;
        *(_WORD *)v94 = 2112;
        *(void *)&v94[2] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "received %dB with %dB buffer. Continue resyncing incoming stream. content = %@", buf, 0x18u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        uint64_t v79 = var1;
        uint64_t v80 = (uint64_t)v14;
        uint64_t v78 = v5;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v79 = var1;
          uint64_t v80 = (uint64_t)v14;
          uint64_t v78 = v5;
          _IDSLogV();
        }
      }
    }
    v65 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v93 = v5;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)v94 = v6;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Link manager recv(resync) %zd errno %d - closing connection", buf, 0x12u);
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
LABEL_155:
    _IDSLinkPacketBufferRelease();
    self->_currentIncomingPacket = 0;
    [(IDSBTLink *)self invalidate];
    return;
  }
  __dst = &currentIncomingPacket->var38[15];
  uint64_t v87 = vdupq_n_s64(1uLL).i64[1];
  while (1)
  {
    int64_t var2 = currentIncomingPacket->var2;
    unint64_t v86 = currentIncomingPacket->var1 - var2;
    uint64_t v88 = -[IDSBTLink _readFromDataChannel:size:withFlags:isSynced:](self, "_readFromDataChannel:size:withFlags:isSynced:", &currentIncomingPacket->var0[var2], v78, v79, v80, v81, v82, v83, v84);
    unsigned int v17 = __error();
    if (v88 <= 0)
    {
      int v76 = *v17;
      if (v88 && v76 == 35)
      {
        self->_currentIncomingPacket = currentIncomingPacket;
        return;
      }
      v77 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v93 = v88;
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)v94 = v76;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Link manager recv %zd errno %d - closing connection", buf, 0x12u);
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
      goto LABEL_155;
    }
    self->_totalReceivedRawBytes += v88;
    int64_t v18 = currentIncomingPacket->var2 + v88;
    currentIncomingPacket->int64_t var2 = v18;
    if (!v18) {
      goto LABEL_142;
    }
    int v19 = *(unsigned __int8 *)currentIncomingPacket->var0;
    if (*currentIncomingPacket->var0 < 0)
    {
      if (v18 == 1)
      {
LABEL_142:
        int v28 = 2;
        goto LABEL_143;
      }
      uint64_t v22 = *((unsigned __int8 *)currentIncomingPacket->var0 + 1) | ((v19 & 0x7F) << 8);
      int v20 = v22 + 2;
      int v21 = 2;
    }
    else
    {
      int v20 = v19 + 1;
      int v21 = 1;
      uint64_t v22 = *(unsigned __int8 *)currentIncomingPacket->var0;
    }
    if (currentIncomingPacket->var1 >= v20) {
      break;
    }
    int v24 = +[NSData dataWithBytesNoCopy:currentIncomingPacket->var0 length:currentIncomingPacket->var2 freeWhenDone:0];
    __int16 v25 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int totalReceivedRawBytes = self->_totalReceivedRawBytes;
      int64_t v27 = currentIncomingPacket->var2;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v93 = v88;
      *(_WORD *)&v93[4] = 1024;
      *(_DWORD *)&v93[6] = totalReceivedRawBytes;
      *(_WORD *)v94 = 1024;
      *(_DWORD *)&v94[2] = v27;
      *(_WORD *)&v94[6] = 2114;
      *(void *)&v94[8] = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Magnet corruption! Bad packet length found. Initiate resync incoming stream! (last recv %d/%u) data(%d) = %{public}@", buf, 0x1Eu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v80 = currentIncomingPacket->var2;
        v81 = v24;
        uint64_t v78 = v88;
        uint64_t v79 = self->_totalReceivedRawBytes;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v80 = currentIncomingPacket->var2;
          v81 = v24;
          uint64_t v78 = v88;
          uint64_t v79 = self->_totalReceivedRawBytes;
          _IDSLogV();
        }
      }
    }

    IDSLinkPacketBufferResetBufferStart();
    self->_currentIncomingPacket = currentIncomingPacket;
    self->_discardedRawBytes += v88;
    [(IDSBTLink *)self _localDetectedCorruption];
LABEL_109:
    if (v88 != v86) {
      return;
    }
LABEL_110:
    if (self->_resyncing) {
      goto LABEL_4;
    }
  }
  int v28 = v20 - v18;
  if (v20 > (int)v18)
  {
LABEL_143:
    self->_currentIncomingPacket = currentIncomingPacket;
    v74 = +[IDSFoundationLog BTLink];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v75 = self->_totalReceivedRawBytes;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v93 = v28;
      *(_WORD *)&v93[4] = 1024;
      *(_DWORD *)&v93[6] = v88;
      *(_WORD *)v94 = 1024;
      *(_DWORD *)&v94[2] = v75;
      *(_WORD *)&v94[6] = 1024;
      *(_DWORD *)&v94[8] = 115;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "LMR2 0/%d/%d/%u %c", buf, 0x1Au);
    }

    return;
  }
  char context = 0;
  while (1)
  {
    var0 = currentIncomingPacket->var0;
    int64_t v30 = currentIncomingPacket->var2;
    IDSLinkPacketBufferAddBufferStart();
    if ((int)v22 < 1)
    {
      v44 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v93 = v88;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Link manager received zero byte packet (total recv:%d)", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v78 = v88;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v78 = v88;
            _IDSLogV();
          }
        }
      }
    }
    else
    {
      int v31 = *currentIncomingPacket->var0;
      if (v22 >= 3 && v31 < 0)
      {
        unsigned int v32 = *(unsigned __int16 *)(currentIncomingPacket->var0 + 1);
        uint64_t v33 = bufferChecksum();
        int v34 = (void *)__rev16(v32);
        if (v34 != v33)
        {
          v59 = +[NSData dataWithBytesNoCopy:var0 length:(int)v30 freeWhenDone:0];
          v60 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v61 = self->_totalReceivedRawBytes;
            unsigned int v62 = [v59 length];
            *(_DWORD *)buf = 67110658;
            *(_DWORD *)v93 = v22 + v21;
            *(_WORD *)&v93[4] = 1024;
            *(_DWORD *)&v93[6] = v88;
            *(_WORD *)v94 = 1024;
            *(_DWORD *)&v94[2] = v61;
            *(_WORD *)&v94[6] = 1024;
            *(_DWORD *)&v94[8] = v34;
            *(_WORD *)&v94[12] = 1024;
            *(_DWORD *)&v94[14] = v33;
            *(_WORD *)&v94[18] = 1024;
            *(_DWORD *)&v94[20] = v62;
            __int16 v95 = 2112;
            v96 = v59;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Magnet corruption! Link manager received %d byte packet (last recv %d/%u) with bad checksum (old:%04x new %04x). Initiate resync incoming stream! data(%d) %@", buf, 0x30u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              uint64_t v63 = self->_totalReceivedRawBytes;
              id v83 = [v59 length];
              v84 = v59;
              v81 = v34;
              v82 = (void *)v33;
              uint64_t v80 = v63;
              uint64_t v78 = (v22 + v21);
              uint64_t v79 = v88;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                uint64_t v64 = self->_totalReceivedRawBytes;
                id v83 = objc_msgSend(v59, "length", v78, v88, v80, v34, v33, v83, v59);
                v84 = v59;
                v82 = (void *)v33;
                uint64_t v80 = v64;
                v81 = v34;
                uint64_t v78 = (v22 + v21);
                uint64_t v79 = v88;
                _IDSLogV();
              }
            }
          }
          BOOL v53 = v88 == v86;

          IDSLinkPacketBufferResetBufferStart();
          self->_currentIncomingPacket = currentIncomingPacket;
          self->_discardedRawBytes += v88;
          [(IDSBTLink *)self _localDetectedCorruption];
          goto LABEL_105;
        }
        IDSLinkPacketBufferAddBufferStart();
        uint64_t v22 = (v22 - 2);
        *currentIncomingPacket->var0 = v31;
      }
      if ((v31 & 0x20) != 0) {
        kdebug_trace();
      }
      __int16 v35 = +[IDSFoundationLog BTLink];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v36 = self->_totalReceivedRawBytes;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v93 = v22;
        *(_WORD *)&v93[4] = 1024;
        *(_DWORD *)&v93[6] = v88;
        *(_WORD *)v94 = 1024;
        *(_DWORD *)&v94[2] = v36;
        *(_WORD *)&v94[6] = 1024;
        *(_DWORD *)&v94[8] = 115;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "LMR %d/%d/%u %c", buf, 0x1Au);
      }

      uint64_t v37 = currentIncomingPacket->var2;
      currentIncomingPacket->int64_t var2 = v22;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v39 = [WeakRetained link:self didReceivePacket:currentIncomingPacket fromDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

      if ((v39 & 1) == 0)
      {
        v50 = +[NSData dataWithBytesNoCopy:var0 length:(int)v30 freeWhenDone:0];
        v51 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v52 = self->_totalReceivedRawBytes;
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v93 = v22;
          *(_WORD *)&v93[4] = 1024;
          *(_DWORD *)&v93[6] = v88;
          *(_WORD *)v94 = 1024;
          *(_DWORD *)&v94[2] = v52;
          *(_WORD *)&v94[6] = 1024;
          *(_DWORD *)&v94[8] = v30;
          *(_WORD *)&v94[12] = 2112;
          *(void *)&v94[14] = v50;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Magnet corruption! This packet(%dB) (last recv %d/%u) did not decode! data(%d) %@", buf, 0x24u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v81 = (void *)v30;
            v82 = v50;
            uint64_t v80 = self->_totalReceivedRawBytes;
            uint64_t v78 = v22;
            uint64_t v79 = v88;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v81 = (void *)v30;
              v82 = v50;
              uint64_t v80 = self->_totalReceivedRawBytes;
              uint64_t v78 = v22;
              uint64_t v79 = v88;
              _IDSLogV();
            }
          }
        }
        BOOL v53 = v88 == v86;

        IDSLinkPacketBufferResetBufferStart();
        self->_currentIncomingPacket = currentIncomingPacket;
        self->_discardedRawBytes += v88;
        [(IDSBTLink *)self _localDetectedCorruption];
        goto LABEL_105;
      }
      if (self->_magnetCorruptionRecoveryMode)
      {
        [(IDSBTLink *)self _submitMagnetCorruptionMetricsToAWD];
        [(IDSBTLink *)self _resetMagnetCorruptionMetrics];
        self->_magnetCorruptionRecoveryMode = 0;
      }
      v40.i64[1] = v87;
      v40.i64[0] = (int)v22 + LODWORD(currentIncomingPacket->var0) - (int)var0;
      *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v40);
      *(int64x2_t *)&self->_unint64_t correctRawBytesSinceLastCorruption = vaddq_s64(*(int64x2_t *)&self->_correctRawBytesSinceLastCorruption, v40);
      BOOL v41 = v37 == v22;
      BOOL v42 = v37 <= v22;
      int64_t v43 = v37 - v22;
      if (v42)
      {
        if (v41)
        {
          IDSLinkPacketBufferResetBufferStart();
LABEL_108:
          self->_currentIncomingPacket = currentIncomingPacket;
          goto LABEL_109;
        }
        goto LABEL_73;
      }
      IDSLinkPacketBufferAddBufferStart();
      currentIncomingPacket->int64_t var2 = v43;
    }
    char context = 1;
LABEL_73:
    int v45 = currentIncomingPacket->var2;
    if (v45)
    {
      int v46 = *(unsigned __int8 *)currentIncomingPacket->var0;
      if ((*currentIncomingPacket->var0 & 0x80000000) == 0)
      {
        unsigned int v47 = v46 + 1;
        int v21 = 1;
        uint64_t v22 = *(unsigned __int8 *)currentIncomingPacket->var0;
        goto LABEL_79;
      }
      if (v45 != 1) {
        break;
      }
    }
    int v48 = 2;
LABEL_81:
    if (v48 >= 1)
    {
      if (context)
      {
        memmove(__dst, currentIncomingPacket->var0, currentIncomingPacket->var2);
        currentIncomingPacket->var0 = (char *)__dst;
        currentIncomingPacket->unint64_t var1 = 2000;
      }
      goto LABEL_108;
    }
  }
  uint64_t v22 = *((unsigned __int8 *)currentIncomingPacket->var0 + 1) | ((v46 & 0x7F) << 8);
  unsigned int v47 = v22 + 2;
  int v21 = 2;
LABEL_79:
  if (currentIncomingPacket->var1 >= v47)
  {
    int v48 = v47 - v45;
    goto LABEL_81;
  }
  v55 = +[NSData dataWithBytesNoCopy:currentIncomingPacket->var0 length:currentIncomingPacket->var2 freeWhenDone:0];
  v56 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v57 = self->_totalReceivedRawBytes;
    int64_t v58 = currentIncomingPacket->var2;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v93 = v88;
    *(_WORD *)&v93[4] = 1024;
    *(_DWORD *)&v93[6] = v57;
    *(_WORD *)v94 = 1024;
    *(_DWORD *)&v94[2] = v58;
    *(_WORD *)&v94[6] = 2114;
    *(void *)&v94[8] = v55;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Magnet corruption! Bad packet length found. Initiate resync incoming stream! (last recv %d/%u) data(%d) = %{public}@", buf, 0x1Eu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v80 = currentIncomingPacket->var2;
      v81 = v55;
      uint64_t v78 = v88;
      uint64_t v79 = self->_totalReceivedRawBytes;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v80 = currentIncomingPacket->var2;
        v81 = v55;
        uint64_t v78 = v88;
        uint64_t v79 = self->_totalReceivedRawBytes;
        _IDSLogV();
      }
    }
  }
  BOOL v53 = v88 == v86;

  IDSLinkPacketBufferResetBufferStart();
  self->_currentIncomingPacket = currentIncomingPacket;
  self->_discardedRawBytes += v88;
  [(IDSBTLink *)self _localDetectedCorruption];
LABEL_105:
  if (v53) {
    goto LABEL_110;
  }
}

- (void)_processOutgoingPacket
{
  if (self->_state > 3) {
    goto LABEL_18;
  }
  if (!self->_linkSuspended)
  {
    v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      pipe = self->_pipe;
      *(_DWORD *)buf = 138412290;
      *(void *)int v19 = pipe;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ready to write into pipe %@", buf, 0xCu);
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
    self->_state = 4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self didConnectForDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

LABEL_18:
    currentOutgoingPacket = self->_currentOutgoingPacket;
    if (currentOutgoingPacket)
    {
      uint64_t v8 = IDSOSDataChannelWrite();
      int v9 = *__error();
      uint64_t v10 = +[IDSFoundationLog BTLink];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var2 = currentOutgoingPacket->var2;
        char var26 = currentOutgoingPacket->var26;
        if (!var26) {
          char var26 = 42;
        }
        int var27 = currentOutgoingPacket->var27;
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)int v19 = v8;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = var2;
        __int16 v20 = 1024;
        int v21 = 45;
        __int16 v22 = 1024;
        int v23 = var26;
        __int16 v24 = 1024;
        int v25 = var27;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "LMW2 %d/%d %c =%c (s:%d)", buf, 0x20u);
      }

      if (v8 < 1)
      {
        if (v8 < 0)
        {
          unsigned int v17 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)int v19 = v9;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Link manager send2 errno %d", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
            _IDSLogTransport();
          }
          if (v9 != 35 && v9 != 55) {
            [(IDSBTLink *)self invalidate];
          }
        }
        return;
      }
      IDSLinkPacketBufferAddBufferStart();
      if (currentOutgoingPacket->var2) {
        return;
      }
      int64x2_t v14 = vdupq_n_s64(1uLL);
      v14.i64[0] = currentOutgoingPacket->var3;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v14);
      _IDSLinkPacketBufferRelease();
      self->_currentOutgoingPacket = 0;
      kdebug_trace();
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 link:self hasSpaceAvailable:1 deviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

      if (self->_writeSuspended) {
        return;
      }
    }
    else
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 link:self hasSpaceAvailable:1 deviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

      if (self->_writeSuspended) {
        return;
      }
    }
LABEL_28:
    IDSOSDataChannelFd();
    IDSTransportThreadSuspendSocket();
    self->_writeSuspended = 1;
    return;
  }
  BOOL v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ready but already suspended", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport();
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
  self->_state = 3;
  if (!self->_writeSuspended) {
    goto LABEL_28;
  }
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  if (self->_previousReportTime == 0.0)
  {
    int v9 = 0;
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
      uint64_t v8 = "UnexpectedState";
    }
    else {
      uint64_t v8 = (const char *)_IDSLinkStateStrings[state];
    }
    __int16 v22 = v8;
    unint64_t v21 = self->_totalPacketsSent - self->_previousPacketsSent;
    uint64_t v10 = formattedBytes();
    id v11 = formattedSpeed();
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    int v13 = formattedBytes();
    unint64_t v14 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    id v15 = formattedBytes();
    id v16 = formattedSpeed();
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    int64_t v18 = formattedBytes();
    int v9 = +[NSString stringWithFormat:@"%c Magnet    (%s) Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n", v23, v22, v21, v10, v11, totalPacketsSent, v13, v14, v15, v16, totalPacketsReceived, v18];
  }
  self->_previousReportTime = a3;
  long long v19 = *(_OWORD *)&self->_totalBytesReceived;
  *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
  *(_OWORD *)&self->_previousBytesReceived = v19;

  return v9;
}

- (BOOL)isLinkSuspended
{
  return self->_linkSuspended;
}

- (void)suspendLink:(BOOL)a3
{
  if (a3)
  {
    if (!self->_linkSuspended)
    {
      v4 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BTLink is now suspended", buf, 2u);
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
      self->_linkSuspended = 1;
      if (self->_state == 4) {
        self->_unint64_t state = 3;
      }
    }
  }
  else if (self->_linkSuspended)
  {
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BTLink is now resumed", v6, 2u);
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
    self->_linkSuspended = 0;
    if (self->_state == 3) {
      self->_unint64_t state = 4;
    }
    if (self->_writeSuspended)
    {
      IDSOSDataChannelFd();
      IDSTransportThreadResumeSocket();
      self->_writeSuspended = 0;
    }
  }
}

- (void)injectFakePacket:(id *)a3
{
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Custom Test 9 - Packet injected into the BT Layer.", v6, 2u);
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
  self->_currentIncomingPacket = a3;
  [(IDSBTLink *)self _processIncomingPacket];
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

- (NSString)linkID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alternateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_linkID, 0);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);

  objc_storeStrong((id *)&self->_cbuuid, 0);
}

@end