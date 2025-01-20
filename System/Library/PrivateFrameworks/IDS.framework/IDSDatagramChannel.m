@interface IDSDatagramChannel
- ($19A98EDAC2850B6C557AE4D7AD493570)_makeDirectPacketBufferFromDatagram:(const void *)a3 datagramSize:(unsigned int)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 datagramInfo:(id)a7 datagramOptions:(id *)a8 linkContext:(id)a9;
- ($19A98EDAC2850B6C557AE4D7AD493570)_makePacketBufferFromDatagram:(const void *)a3 datagramSize:(unsigned int)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 datagramInfo:(id)a7 datagramOptions:(id *)a8;
- ($F113CFA26FA97A821AAEB04A6CDF9B12)_setWiFiAssist:(BOOL)a3;
- (BOOL)isDaemonConnection:(id)a3;
- (BOOL)processDatagram:(const char *)a3 datagramSize:(unint64_t)a4 readHandler:(id)a5 readHandlerWithOptions:(id)a6;
- (IDSDataChannelLinkContext)defaultLink;
- (IDSDatagramChannel)initWithDestination:(id)a3 options:(id)a4;
- (IDSDatagramChannel)initWithSocketDescriptor:(int)a3;
- (NSArray)connectedLinks;
- (id)_connectionInfoForDictionary:(id)a3;
- (id)_createIfNecessaryDirectConnectionForLinkID:(char)a3 linkContext:(id)a4 connection:(id)a5;
- (id)_directConnectionsForLinkID:(char)a3;
- (id)_directOrDaemonConnectionForLinkID:(char)a3;
- (id)_extractparticipantIDToHashedIDMappingFromData:(id)a3;
- (id)_linkContextWithID:(unsigned __int8)a3;
- (id)_linkContextsCopy;
- (id)_underlyingLinkContextForLinkID:(char)a3;
- (id)cachedMetadata;
- (id)connectionForLinkID:(char)a3;
- (id)createIfNecessaryDirectConnectionForLinkID:(char)a3 linkContext:(id)a4;
- (id)description;
- (id)getContext;
- (id)getDispatchDataForPacketBuffer:(id *)a3;
- (id)getIDSDataChannelsQueue;
- (id)getNwProtocolMetaDataForTrafficClass:(unsigned __int16)a3;
- (id)getQueue;
- (int)underlyingFileDescriptor;
- (unint64_t)_logChecksum:(const void *)a3 length:(unint64_t)a4;
- (unint64_t)_translateParticipantID:(unint64_t)a3 forLinkID:(char)a4;
- (void)_addConnections:(id)a3 toLinkContext:(id)a4;
- (void)_buildPacketBufferMetaData:(id *)a3;
- (void)_didReceivePacketOfSize:(unint64_t)a3 linkType:(char)a4 linkContext:(id)a5 connectionInfo:(id)a6;
- (void)_dumpLinkContextConnectionsInfo;
- (void)_logFinalStats;
- (void)_logPendingSendingStats:(unint64_t)a3;
- (void)_logReceivingStats:(unint64_t)a3;
- (void)_logSendingStats:(unint64_t)a3;
- (void)_processIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 linkID:(char)a5 DSCP:(unsigned __int8)a6 linkContext:(id)a7 connectionInfo:(id)a8;
- (void)_processIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 linkID:(char)a5 linkContext:(id)a6;
- (void)_readFromDirectConnection:(id)a3 linkID:(char)a4 linkContext:(id)a5 connectionInfo:(id)a6;
- (void)_removeDirectConnection:(id)a3;
- (void)_removeLinkContextWithID:(unsigned __int8)a3;
- (void)_reportDictionary:(id)a3 forKey:(unsigned __int8)a4;
- (void)_reportFirstIncomingPacketTimeForMKI:(id)a3 time:(id)a4 participantID:(id)a5;
- (void)_reportFirstOutgoingPacketTimeForMKI:(id)a3 time:(id)a4 participantID:(id)a5;
- (void)_reportLinkMetricsForLinkContext:(id)a3;
- (void)_reportMKIArrival:(id)a3 time:(id)a4 isLocallyGenerated:(BOOL)a5;
- (void)_sendSequenceNumberMetadataToDaemon:(unint64_t)a3;
- (void)_sendStatsRequestViaDaemon;
- (void)_setDirectConnections:(id)a3 forLinkID:(char)a4;
- (void)_setLinkContext:(id)a3 forLinkID:(unsigned __int8)a4;
- (void)_startStatsTimer;
- (void)_stopStatsTimer;
- (void)_writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7;
- (void)_writeToDirectConnection:(id)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 currentDatagramCount:(unsigned __int8)a6 totalDatagramCount:(unsigned __int8)a7 datagramInfo:(id)a8 datagramOptions:(id *)a9 completionHandler:(id)a10;
- (void)_writeToNWConnection:(id)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 currentDatagramCount:(unsigned __int8)a6 totalDatagramCount:(unsigned __int8)a7 datagramInfo:(id)a8 datagramOptions:(id *)a9 completionHandler:(id)a10;
- (void)_writeToNWConnectionArrayOfDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8;
- (void)_writeToOSChannelDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8;
- (void)_writeToSocket:(int)a3 datagrams:(const void *)a4 datagramSizes:(unsigned int *)a5 datagramInfo:(id *)a6 datagramOptions:(id *)a7 datagramCount:(int)a8 completionHandler:(id)a9;
- (void)addDirectConnectionForLinkID:(char)a3 linkContext:(id)a4;
- (void)addNewIDSDataChannelLinkWithAttributes:(char *)a3 linkAttributesLength:(unsigned __int16)a4;
- (void)close;
- (void)dealloc;
- (void)flushLinkProbingStatusWithOptions:(id)a3;
- (void)generateMetadataWithDatagramInfo:(id)a3 options:(id *)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 byteBuffer:(id *)a7;
- (void)handleIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 datagramOptions:(id *)a6;
- (void)invalidate;
- (void)invalidateDirectConnections;
- (void)osChannelInfoLog;
- (void)processMetadataForDatagram:(const char *)a3 size:(unint64_t)a4 datagramInfo:(id *)a5 options:(id *)a6;
- (void)queryStatusWithOptions:(id)a3;
- (void)readDatagramWithCompletionHandler:(id)a3;
- (void)readDatagramsWithCompletionHandler:(id)a3;
- (void)readFromNWConnection:(id)a3 maximumDatagrams:(unsigned int)a4 readHandler:(id)a5 readHandlerWithOptions:(id)a6;
- (void)readFromOSChannel:(channel *)a3 ring:(channel_ring_desc *)a4 maximumDatagrams:(unsigned int)a5 readHandler:(id)a6 readHandlerWithOptions:(id)a7;
- (void)readFromSocketDescriptorWithReadHandler:(id)a3 readHandlerWithOptions:(id)a4;
- (void)readyToRead;
- (void)removeDirectConnectionsForLinkID:(char)a3;
- (void)removeIDSDataChannelLinkContext:(char)a3 linkUUID:(id)a4 reason:(unsigned __int8)a5;
- (void)reportEvent:(id)a3 forLinkID:(unsigned __int8)a4;
- (void)reportFirstIncomingPacketTimeForMKI:(id)a3 participantID:(id)a4;
- (void)reportFirstOutgoingPacketTimeForMKI:(id)a3 participantID:(id)a4;
- (void)reportLastPacketReceivedTime:(double)a3 lastPacketSentTime:(double)a4 linkID:(unsigned __int8)a5;
- (void)reportMKIArrival:(id)a3 isLocallyGenerated:(BOOL)a4;
- (void)requestSessionInfoWithOptions:(id)a3;
- (void)requestStatsWithOptions:(id)a3;
- (void)scheduleRead;
- (void)selectDefaultLink:(char)a3;
- (void)sendEventConnectedWithDummyLinkInfo;
- (void)sendMediaEncryptionInfoWithMKM:(id)a3 MKS:(id)a4 MKI:(id)a5 participantID:(unint64_t)a6 isLocallyGenerated:(BOOL)a7 shortKILength:(unsigned __int8)a8 encryptionSequenceNumber:(unint64_t)a9;
- (void)sendMediaMembershipChangedInfo:(unsigned __int8)a3;
- (void)sendMetadata;
- (void)setChannelPreferences:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setHasMetadata:(BOOL)a3;
- (void)setLinkIDToParticipantMap:(id)a3;
- (void)setPreferredDataPathType:(int64_t)a3;
- (void)setReadHandler:(id)a3;
- (void)setReadHandlerWithOptions:(id)a3;
- (void)setUPlusOneMode:(BOOL)a3 isInitiator:(BOOL)a4;
- (void)setWiFiAssist:(BOOL)a3;
- (void)setWriteCompletionHandler:(id)a3;
- (void)start;
- (void)startActiveProbingWithOptions:(id)a3;
- (void)startInternal;
- (void)startMKMRecoveryForParticipantIDs:(id)a3;
- (void)stopActiveProbingWithOptions:(id)a3;
- (void)writeArrayOfDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6;
- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8;
@end

@implementation IDSDatagramChannel

- (void)_startStatsTimer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_statsTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_internal->_queue);
    statsTimer = self->_statsTimer;
    self->_statsTimer = v3;

    v5 = self->_statsTimer;
    dispatch_time_t v6 = dispatch_time(0, 4000000000);
    dispatch_source_set_timer(v5, v6, 0xEE6B2800uLL, 0x5F5E100uLL);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = self->_statsTimer;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = sub_1919F01F0;
    v13 = &unk_1E57295B8;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v7, &v10);
    dispatch_resume((dispatch_object_t)self->_statsTimer);
    v8 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_statsTimer;
      *(_DWORD *)buf = 134217984;
      v17 = v9;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "start stats timer %p.", buf, 0xCu);
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)_stopStatsTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  statsTimer = self->_statsTimer;
  if (statsTimer)
  {
    dispatch_source_cancel(statsTimer);
    v4 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_statsTimer;
      int v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "stop stats timer %p.", (uint8_t *)&v7, 0xCu);
    }

    dispatch_time_t v6 = self->_statsTimer;
    self->_statsTimer = 0;
  }
}

- (id)_directConnectionsForLinkID:(char)a3
{
  int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  dispatch_time_t v6 = self->_internal->_directConnectionsByLinkID[a3];
  if (!v6)
  {
    dispatch_time_t v6 = objc_alloc_init(IDSDataChannelsDirectConnections);
    objc_storeStrong((id *)&self->_internal->_directConnectionsByLinkID[v5], v6);
    int v7 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "LinkID %d associated with direct connection %@", (uint8_t *)v9, 0x12u);
    }
  }

  return v6;
}

- (void)_setDirectConnections:(id)a3 forLinkID:(char)a4
{
  int v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v4 < 0)
  {
    v8 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      __int16 v10 = "-[IDSDatagramChannel(DirectConnections) _setDirectConnections:forLinkID:]";
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "%s: Invalid LinkID %d", (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_internal->_directConnectionsByLinkID[v4], a3);
  }
}

- (id)_directOrDaemonConnectionForLinkID:(char)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = -[IDSDatagramChannel _underlyingLinkContextForLinkID:](self, "_underlyingLinkContextForLinkID:");
  dispatch_time_t v6 = [(IDSDatagramChannel *)self _directConnectionsForLinkID:v3];
  if ([v5 isQUICPod]
    && ([v6 qpodConnection], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    uint64_t v8 = [v6 qpodConnection];
  }
  else
  {
    uint64_t v8 = [v6 udpConnection];
  }
  int v9 = (OS_nw_connection *)v8;
  if (!v8 || (char v10 = [v5 directConnectionReady], connection = v9, (v10 & 1) == 0)) {
    connection = self->_internal->_connection;
  }
  int v12 = connection;

  return v12;
}

- (void)_removeDirectConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v6 = 0;
    *(void *)&long long v5 = 67109378;
    long long v14 = v5;
    while (1)
    {
      id v7 = self->_internal->_directConnectionsByLinkID[v6];
      uint64_t v8 = [(IDSDataChannelsDirectConnections *)v7 udpConnection];
      if ((id)v8 == v4) {
        break;
      }
      int v9 = (void *)v8;
      id v10 = [(IDSDataChannelsDirectConnections *)v7 qpodConnection];

      if (v10 == v4) {
        goto LABEL_7;
      }
LABEL_10:

      if (++v6 == 256) {
        goto LABEL_11;
      }
    }

LABEL_7:
    __int16 v11 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v14;
      int v16 = v6;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "LinkID %d unassociated with direct connection %@", buf, 0x12u);
    }

    directConnectionsByLinkID = self->_internal->_directConnectionsByLinkID;
    uint64_t v13 = directConnectionsByLinkID[v6];
    directConnectionsByLinkID[v6] = 0;

    goto LABEL_10;
  }
LABEL_11:
}

- (id)_underlyingLinkContextForLinkID:(char)a3
{
  id v4 = [(IDSDatagramChannel *)self _linkContextWithID:a3];
  if ([v4 isVirtualRelayLink])
  {
    long long v5 = -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", [v4 delegatedLinkID]);
    objc_msgSend(v4, "setDirectConnectionReady:", objc_msgSend(v5, "directConnectionReady"));
  }

  return v4;
}

- (void)_dumpLinkContextConnectionsInfo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  ids_monotonic_time();
  if (v3 - *(double *)&qword_1E92DE458 > 5.0)
  {
    qword_1E92DE458 = *(void *)&v3;
    id v4 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Dumping link contexts and direct connections", buf, 2u);
    }

    uint64_t v5 = 0;
    *(void *)&long long v6 = 134218498;
    long long v11 = v6;
    do
    {
      id v7 = -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", v5, v11);
      uint64_t v8 = [v7 description];

      uint64_t v9 = [(IDSDataChannelsDirectConnections *)self->_internal->_directConnectionsByLinkID[v5] description];
      if (v8 | v9)
      {
        id v10 = +[IDSLogging IDSDataChannels];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          uint64_t v13 = self;
          __int16 v14 = 2112;
          uint64_t v15 = v9;
          __int16 v16 = 2112;
          uint64_t v17 = v8;
          _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "<%p> -- connection %@ link context %@", buf, 0x20u);
        }
      }
      ++v5;
    }
    while (v5 != 256);
  }
}

- (void)invalidateDirectConnections
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(IDSDatagramChannel *)self _stopStatsTimer];
  uint64_t v3 = 0;
  *(void *)&long long v4 = 138412290;
  long long v26 = v4;
  do
  {
    -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", v3, v26);
    uint64_t v5 = (IDSDataChannelsDirectConnections *)objc_claimAutoreleasedReturnValue();
    long long v6 = v5;
    if (v5 && ([(IDSDataChannelsDirectConnections *)v5 isVirtualRelayLink] & 1) == 0)
    {
      id v7 = self->_internal->_directConnectionsByLinkID[v3];
      uint64_t v8 = [(IDSDataChannelsDirectConnections *)v7 udpConnection];

      if (v8)
      {
        uint64_t v9 = [(IDSDataChannelsDirectConnections *)v7 udpConnection];
        [(IDSDatagramChannel *)self _removeDirectConnection:v9];

        id v10 = [(IDSDataChannelsDirectConnections *)v7 udpConnection];
        nw_connection_cancel(v10);
      }
      else
      {
        id v10 = +[IDSLogging IDSDataChannels];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v29 = v6;
          _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Found empty udp connection for link context %@", buf, 0xCu);
        }
      }

      long long v11 = [(IDSDataChannelsDirectConnections *)v7 qpodConnection];

      if (v11)
      {
        int v12 = [(IDSDataChannelsDirectConnections *)v7 qpodConnection];
        [(IDSDatagramChannel *)self _removeDirectConnection:v12];

        uint64_t v13 = [(IDSDataChannelsDirectConnections *)v7 qpodConnection];
        nw_connection_cancel(v13);
      }
      else
      {
        uint64_t v13 = +[IDSLogging IDSDataChannels];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v29 = v6;
          _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Found empty udp connection for link context %@", buf, 0xCu);
        }
      }
    }
    ++v3;
  }
  while (v3 != 256);
  uint64_t v15 = 0;
  *(void *)&long long v14 = 138412546;
  long long v27 = v14;
  do
  {
    if (self->_internal->_directConnectionsByLinkID[v15])
    {
      __int16 v16 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = self->_internal->_directConnectionsByLinkID[v15];
        uint64_t v18 = [(IDSDatagramChannel *)self _linkContextWithID:v15];
        *(_DWORD *)buf = v27;
        v29 = v17;
        __int16 v30 = 2112;
        v31 = v18;
        _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Cleaning up left over connection %@ for link context %@", buf, 0x16u);
      }
      uint64_t v19 = self->_internal->_directConnectionsByLinkID[v15];
      v20 = [(IDSDataChannelsDirectConnections *)v19 udpConnection];

      if (v20)
      {
        v21 = [(IDSDataChannelsDirectConnections *)v19 udpConnection];
        nw_connection_cancel(v21);
      }
      v22 = [(IDSDataChannelsDirectConnections *)v19 qpodConnection];

      if (v22)
      {
        v23 = [(IDSDataChannelsDirectConnections *)v19 qpodConnection];
        nw_connection_cancel(v23);
      }
      directConnectionsByLinkID = self->_internal->_directConnectionsByLinkID;
      v25 = directConnectionsByLinkID[v15];
      directConnectionsByLinkID[v15] = 0;
    }
    -[IDSDatagramChannel _removeLinkContextWithID:](self, "_removeLinkContextWithID:", v15++, v27);
  }
  while (v15 != 256);
}

- (unint64_t)_translateParticipantID:(unint64_t)a3 forLinkID:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&self->_internal->_linkIDToParticipantMapLock);
  linkIDToParticipantMap = self->_internal->_linkIDToParticipantMap;
  uint64_t v8 = [NSNumber numberWithChar:v4];
  uint64_t v9 = [(NSMutableDictionary *)linkIDToParticipantMap objectForKeyedSubscript:v8];

  id v10 = [NSNumber numberWithUnsignedLongLong:a3];
  long long v11 = [v9 objectForKey:v10];

  if (v11)
  {
    unint64_t v12 = [v11 unsignedLongLongValue];
  }
  else
  {
    uint64_t v13 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218498;
      unint64_t v16 = a3;
      __int16 v17 = 1024;
      int v18 = v4;
      __int16 v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, " Warning ! Could not find mappedParticipant:%llu in linkID %d dictionary:%@", (uint8_t *)&v15, 0x1Cu);
    }

    unint64_t v12 = 0;
  }
  os_unfair_lock_unlock(&self->_internal->_linkIDToParticipantMapLock);

  return v12;
}

- (void)_didReceivePacketOfSize:(unint64_t)a3 linkType:(char)a4 linkContext:(id)a5 connectionInfo:(id)a6
{
  int v7 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (([v10 hasReceivedPacket] & 1) == 0)
  {
    [v10 setHasReceivedPacket:1];
    -[IDSDatagramChannel reportEvent:forLinkID:](self, "reportEvent:forLinkID:", *MEMORY[0x1E4F6AF58], [v10 linkID]);
  }
  ids_monotonic_time();
  objc_msgSend(v10, "setLastPacketReceivedTime:");
  [(IDSDatagramChannel *)self _reportLinkMetricsForLinkContext:v10];
  char v12 = [v10 isVirtualRelayLink];
  uint64_t v13 = +[IDSLogging IDSDataChannels];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v15 = [v10 linkID];
      int v16 = [v10 delegatedLinkID];
      __int16 v17 = [v11 type];
      int v20 = 134219266;
      unint64_t v21 = a3;
      __int16 v22 = 1024;
      int v23 = v7;
      __int16 v24 = 1024;
      int v25 = v15;
      __int16 v26 = 1024;
      *(_DWORD *)long long v27 = v16;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v17;
      *(_WORD *)&v27[14] = 2048;
      *(void *)&v27[16] = [v11 clientNWConnectionID];
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "DCR %zdB (%c %d/%d — %@ [C%llu])", (uint8_t *)&v20, 0x32u);
    }
  }
  else if (v14)
  {
    int v18 = [v10 linkID];
    __int16 v19 = [v11 type];
    int v20 = 134219010;
    unint64_t v21 = a3;
    __int16 v22 = 1024;
    int v23 = v7;
    __int16 v24 = 1024;
    int v25 = v18;
    __int16 v26 = 2112;
    *(void *)long long v27 = v19;
    *(_WORD *)&v27[8] = 2048;
    *(void *)&v27[10] = [v11 clientNWConnectionID];
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "DCR %zdB (%c %d — %@ [C%llu])", (uint8_t *)&v20, 0x2Cu);
  }
}

- (void)_reportLinkMetricsForLinkContext:(id)a3
{
  id v10 = a3;
  ids_monotonic_time();
  double v5 = v4;
  [v10 lastPacketReportedTime];
  if (v5 - v6 > 5.0)
  {
    [v10 lastPacketReceivedTime];
    double v8 = v7;
    [v10 lastPacketSentTime];
    -[IDSDatagramChannel reportLastPacketReceivedTime:lastPacketSentTime:linkID:](self, "reportLastPacketReceivedTime:lastPacketSentTime:linkID:", [v10 linkID], v8, v9);
    [v10 setLastPacketReportedTime:v5];
  }
}

- (void)_processIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 linkID:(char)a5 linkContext:(id)a6
{
  uint64_t v6 = a5;
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = objc_alloc_init(_IDSDataChannelLinkConnection);
  [(IDSDatagramChannel *)self _processIncomingDatagram:a3 datagramSize:v7 linkID:v6 DSCP:0 linkContext:v10 connectionInfo:v11];
}

- (void)_processIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 linkID:(char)a5 DSCP:(unsigned __int8)a6 linkContext:(id)a7 connectionInfo:(id)a8
{
  uint64_t v9 = a6;
  uint64_t v11 = *(void *)&a4;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = a8;
  int v16 = v14;
  id v63 = v15;
  uint64_t v17 = v11;
  [(IDSDatagramChannel *)self _logReceivingStats:v11];
  if (![v14 RATType]
    || (int v18 = [v14 RATType], v11 < 4)
    || v18 == 9
    || *(_DWORD *)a3 != -272716322)
  {
    if ([v14 connectionType] == 1)
    {
      uint64_t v84 = 0;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      *(_OWORD *)buf = 0u;
      [(IDSDatagramChannel *)self _didReceivePacketOfSize:v11 linkType:80 linkContext:v14 connectionInfo:v63];
      -[IDSDatagramChannel handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:](self, "handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:", a3, v11, a5 | (unint64_t)(v9 << 32), 0, buf);
      goto LABEL_78;
    }
    bzero(&buf[8], 0x510uLL);
    *(void *)buf = a3;
    *(void *)&long long v78 = v11;
    unsigned __int8 v86 = v9;
    if ([v63 isQUICPod] && objc_msgSend(v14, "connectionType") != 1) {
      int v20 = StunUtilProcessIncomingChannelDataWithoutChannelHeader();
    }
    else {
      int v20 = StunUtilProcessIncomingChannelData();
    }
    if (v20)
    {
      if (v89)
      {
        int v21 = [v14 localRelayLinkID];
        uint64_t v22 = v90 | (v21 << 16);
        localRemoteRelayLinkIDToVirtualLinkIDMap = self->_internal->_localRemoteRelayLinkIDToVirtualLinkIDMap;
        __int16 v24 = [NSNumber numberWithUnsignedInt:v22];
        int v25 = [(NSMutableDictionary *)localRemoteRelayLinkIDToVirtualLinkIDMap objectForKeyedSubscript:v24];

        if (v25)
        {
          a5 = [v25 unsignedShortValue];
        }
        else
        {
          char v61 = a5;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v27 = [(IDSDatagramChannel *)self connectedLinks];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v64 objects:v76 count:16];
          if (v28)
          {
            id v58 = v14;
            uint64_t v29 = *(void *)v65;
            while (2)
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                v31 = v25;
                if (*(void *)v65 != v29) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v32 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                int v33 = [v32 localRelayLinkID];
                if (([v32 remoteRelayLinkID] | (v33 << 16)) == v22)
                {
                  int v16 = v58;
                  int v25 = v31;
                  v34 = objc_msgSend(NSNumber, "numberWithChar:", objc_msgSend(v32, "linkID"));
                  v35 = self->_internal->_localRemoteRelayLinkIDToVirtualLinkIDMap;
                  v36 = [NSNumber numberWithUnsignedInt:v22];
                  [(NSMutableDictionary *)v35 setObject:v34 forKeyedSubscript:v36];

                  a5 = [v32 linkID];
                  goto LABEL_33;
                }
                int v25 = v31;
              }
              uint64_t v28 = [v27 countByEnumeratingWithState:&v64 objects:v76 count:16];
              if (v28) {
                continue;
              }
              break;
            }
            int v16 = v58;
          }
          a5 = v61;
LABEL_33:
        }
      }
      __int16 v26 = [(IDSDatagramChannel *)self _linkContextWithID:a5];
      char v37 = a5;
      if ([v26 isVirtualRelayLink]) {
        char v37 = [v26 delegatedLinkID];
      }
      [v26 setTotalPacketsReceivedOnLink:[v26 totalPacketsReceivedOnLink] + 1];
      [(IDSDatagramChannel *)self _didReceivePacketOfSize:v17 linkType:82 linkContext:v26 connectionInfo:v63];
      int v38 = v87;
      if (v87 <= 1) {
        int v38 = 1;
      }
      if (v38 >= 1)
      {
        v57 = v26;
        v59 = v16;
        uint64_t v39 = 0;
        uint64_t v62 = a5;
        uint64_t v40 = 96 * v38;
        unsigned int v60 = v37;
        while (1)
        {
          v41 = &buf[v39];
          uint64_t v75 = 0;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          *(_OWORD *)v68 = 0u;
          uint64_t v42 = v85;
          uint64_t v43 = v86;
          int v44 = *(_DWORD *)&v91[v39];
          if (v44)
          {
            *(_DWORD *)v68 = 1;
            *(void *)&v68[8] = [(IDSDatagramChannel *)self _translateParticipantID:*((void *)v41 + 61) forLinkID:v60];
          }
          if ((v44 & 0x10) != 0)
          {
            *(_DWORD *)v68 |= 0x10u;
            LOWORD(v69) = *(_WORD *)&v88[v39 + 42];
            if ((v44 & 8) == 0)
            {
LABEL_45:
              if ((v44 & 2) == 0) {
                goto LABEL_51;
              }
              goto LABEL_49;
            }
          }
          else if ((v44 & 8) == 0)
          {
            goto LABEL_45;
          }
          *(_DWORD *)v68 |= 8u;
          BYTE2(v69) = v88[v39 + 40];
          if ((v44 & 2) == 0) {
            goto LABEL_51;
          }
LABEL_49:
          *(_DWORD *)v68 |= 2u;
          uint64_t v45 = *(unsigned int *)&v88[v39 + 4];
          BYTE3(v69) = *(_DWORD *)&v88[v39 + 4];
          if ((int)v45 >= 1) {
            memcpy((char *)&v69 + 4, v41 + 464, 2 * v45);
          }
LABEL_51:
          if ((v44 & 0x20) != 0)
          {
            *(_DWORD *)v68 |= 0x20u;
            BYTE12(v70) = v88[v39 + 44];
          }
          if ((v44 & 0x40) != 0)
          {
            *(_DWORD *)v68 |= 0x40u;
            HIWORD(v70) = *(_WORD *)&v88[v39 + 48];
            WORD4(v71) = *(_WORD *)&v88[v39 + 58];
            *(void *)&long long v71 = *(void *)&v88[v39 + 50];
          }
          if (v92 > 0.0)
          {
            *(double *)&long long v72 = v92;
            if ((v44 & 4) == 0)
            {
LABEL_57:
              if ((v44 & 0x80) == 0) {
                goto LABEL_58;
              }
              goto LABEL_65;
            }
          }
          else if ((v44 & 4) == 0)
          {
            goto LABEL_57;
          }
          *(_DWORD *)v68 |= 4u;
          if ((v44 & 0x80) == 0)
          {
LABEL_58:
            if ((v44 & 0x100) == 0) {
              goto LABEL_59;
            }
            goto LABEL_66;
          }
LABEL_65:
          *(_DWORD *)v68 |= 0x80u;
          if ((v44 & 0x100) == 0)
          {
LABEL_59:
            if ((v44 & 0x10000) == 0) {
              goto LABEL_60;
            }
            goto LABEL_67;
          }
LABEL_66:
          *(_DWORD *)v68 |= 0x100u;
          if ((v44 & 0x10000) == 0)
          {
LABEL_60:
            if ((v44 & 0x20000) == 0) {
              goto LABEL_61;
            }
            goto LABEL_68;
          }
LABEL_67:
          *(_DWORD *)v68 |= 0x10000u;
          LOBYTE(v75) = 1;
          if ((v44 & 0x20000) == 0)
          {
LABEL_61:
            if ((v44 & 0x400) != 0) {
              goto LABEL_71;
            }
            goto LABEL_69;
          }
LABEL_68:
          *(_DWORD *)v68 |= 0x20000u;
          BYTE1(v75) = 1;
          if ((v44 & 0x400) != 0)
          {
LABEL_71:
            *(_DWORD *)v68 |= 0x400u;
            LOBYTE(v73) = 1;
            __int16 v26 = v57;
            [v57 hbhDecryptionkey];
            v46 = int v16 = v59;
            v47 = IDSHBHDecryptDataWithKey();

            if (v47)
            {
              id v48 = v47;
              -[IDSDatagramChannel handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:](self, "handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:", [v48 bytes], objc_msgSend(v48, "length"), (v43 << 32) | (v42 << 16) | v62, 0, v68);
            }
            else
            {
              v49 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                sub_191A413A0(v49, v50, v51, v52, v53, v54, v55, v56);
              }
            }
            break;
          }
LABEL_69:
          -[IDSDatagramChannel handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:](self, "handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:", *((void *)v41 + 56), *(unsigned __int16 *)&v88[v39], (v43 << 32) | (v42 << 16) | v62, 0, v68, v92, v57);
          v39 += 96;
          if (v40 == v39)
          {
            __int16 v26 = v57;
            int v16 = v59;
            break;
          }
        }
      }
    }
    else
    {
      __int16 v26 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v68 = 0;
        _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "Error in _processIncomingDatagram: StunUtilProcessIncomingChannelData returned false.", v68, 2u);
      }
    }

    goto LABEL_78;
  }
  if (self->_internal->_verboseFunctionalLogging)
  {
    __int16 v19 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "received baseband notification packet.", buf, 2u);
    }
  }
  uint64_t v84 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  *(_OWORD *)buf = 0u;
  -[IDSDatagramChannel handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:](self, "handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:", a3, v11, a5, 0, buf);
LABEL_78:
}

- (id)createIfNecessaryDirectConnectionForLinkID:(char)a3 linkContext:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(IDSDatagramChannel *)self _directConnectionsForLinkID:v4];
    [(IDSDatagramChannel *)self _setLinkContext:v6 forLinkID:v4];
    double v8 = [v7 qpodConnection];

    if (v8)
    {
      uint64_t v9 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v7 qpodConnection];
        int v20 = 138412290;
        int v21 = v10;
        _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID child qpod connection already created previously: %@", (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = [v6 connections];
      char v12 = [v11 qpod];
      uint64_t v13 = [(IDSDatagramChannel *)self _createIfNecessaryDirectConnectionForLinkID:v4 linkContext:v6 connection:v12];

      [v7 setQpodConnection:v13];
    }
    id v14 = [v7 udpConnection];

    if (v14)
    {
      id v15 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [v7 udpConnection];
        int v20 = 138412290;
        int v21 = v16;
        _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID child udp connection already created previously: %@", (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = [v6 connections];
      int v18 = [v17 udp];
      id v15 = [(IDSDatagramChannel *)self _createIfNecessaryDirectConnectionForLinkID:v4 linkContext:v6 connection:v18];

      [v7 setUdpConnection:v15];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_createIfNecessaryDirectConnectionForLinkID:(char)a3 linkContext:(id)a4 connection:(id)a5
{
  int v6 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v9)
  {
    int v16 = 0;
    goto LABEL_34;
  }
  uint64_t v11 = [v9 childConnectionID];
  if (v6 <= 0)
  {
    uint64_t v17 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID: linkID has to be greater than 0.", buf, 2u);
    }

    int v16 = 0;
    goto LABEL_33;
  }

  *(void *)uu = 0;
  uint64_t v38 = 0;
  if (v11)
  {
    [v11 getUUIDBytes:uu];
    int is_null = uuid_is_null(uu);
    uint64_t v13 = +[IDSLogging IDSDataChannels];
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (!is_null)
    {
      if (v14)
      {
        *(_DWORD *)buf = 67109634;
        if ([v8 connectionType] == 1) {
          int v18 = 80;
        }
        else {
          int v18 = 82;
        }
        *(_DWORD *)v34 = v18;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = v11;
        __int16 v35 = 2112;
        id v36 = v8;
        _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID create connection (%c) with client ID %@ for linkContext %@", buf, 0x1Cu);
      }

      __int16 v19 = nw_connection_create_with_client_id();
      uint64_t v13 = v19;
      if (v19)
      {
        int v20 = nw_connection_copy_current_path(v19);
        if (v20 && (nw_path_uses_nexus() & 1) == 0)
        {
          int v21 = +[IDSLogging IDSDataChannels];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v34 = v20;
            _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID: nexus is not supported for path :%@.", buf, 0xCu);
          }
          int v16 = 0;
        }
        else
        {
          int v21 = nw_connection_copy_parameters(v13);
          __int16 v26 = nw_parameters_copy_default_protocol_stack(v21);
          uint64_t v22 = nw_protocol_stack_copy_internet_protocol(v26);
          nw_ip_options_set_disable_fragmentation(v22, 0);
          nw_connection_set_queue(v13, (dispatch_queue_t)self->_internal->_queue);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = sub_1919F2194;
          handler[3] = &unk_1E572CFC0;
          int v23 = v13;
          uint64_t v28 = v23;
          id v29 = v8;
          __int16 v30 = self;
          char v32 = v6;
          id v24 = v10;
          id v31 = v24;
          nw_connection_set_state_changed_handler(v23, handler);
          [v24 setClientNWConnectionID:nw_connection_get_id()];
          nw_connection_start(v23);
          int v16 = v23;
        }
      }
      else
      {
        int v20 = +[IDSLogging IDSDataChannels];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID failed to create child connection", buf, 2u);
        }
        int v16 = 0;
      }

      goto LABEL_32;
    }
    if (v14)
    {
      *(_WORD *)buf = 0;
      id v15 = "addDirectConnectionForLinkID missing child connection ID - skip for now.";
LABEL_13:
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
  }
  else
  {
    uint64_t v13 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v15 = "addDirectConnectionForLinkID missing child connection ID - skip for now";
      goto LABEL_13;
    }
  }
  int v16 = 0;
LABEL_32:

LABEL_33:
LABEL_34:

  return v16;
}

- (void)addDirectConnectionForLinkID:(char)a3 linkContext:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = +[IDSLogging IDSDataChannels];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    BOOL v14 = self;
    __int16 v15 = 1024;
    *(_DWORD *)int v16 = v4;
    *(_WORD *)&v16[4] = 2112;
    *(void *)&v16[6] = v6;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "<%p> addDirectConnectionForLinkID linkID: %d %@", (uint8_t *)&v13, 0x1Cu);
  }

  [(IDSDatagramChannel *)self _startStatsTimer];
  uint64_t v8 = v4;
  if ([v6 isVirtualRelayLink]) {
    uint64_t v8 = [v6 delegatedLinkID];
  }
  if ([v6 isVirtualRelayLink])
  {
    id v9 = [(IDSDatagramChannel *)self _underlyingLinkContextForLinkID:v8];
  }
  else
  {
    id v9 = v6;
  }
  id v10 = v9;
  uint64_t v11 = [(IDSDatagramChannel *)self createIfNecessaryDirectConnectionForLinkID:v8 linkContext:v9];
  if ([v6 isVirtualRelayLink])
  {
    char v12 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218754;
      BOOL v14 = self;
      __int16 v15 = 2112;
      *(void *)int v16 = v11;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = v8;
      __int16 v17 = 1024;
      int v18 = v4;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "<%p> addDirectConnectionForLinkID - associating connection %@ from linkID %d with virtual linkID %d", (uint8_t *)&v13, 0x22u);
    }

    [(IDSDatagramChannel *)self _setLinkContext:v6 forLinkID:v4];
    [(IDSDatagramChannel *)self _setDirectConnections:v11 forLinkID:v4];
  }
}

- (void)removeDirectConnectionsForLinkID:(char)a3
{
  uint64_t v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = +[IDSLogging IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218240;
    __int16 v17 = self;
    __int16 v18 = 1024;
    int v19 = v3;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "<%p> removeDirectConnectionForLinkID linkID: %d", (uint8_t *)&v16, 0x12u);
  }

  id v6 = [(IDSDatagramChannel *)self _directConnectionsForLinkID:v3];
  directConnectionsByLinkID = self->_internal->_directConnectionsByLinkID;
  uint64_t v8 = directConnectionsByLinkID[(int)v3];
  directConnectionsByLinkID[(int)v3] = 0;

  id v9 = [(IDSDatagramChannel *)self _underlyingLinkContextForLinkID:v3];
  if (([v9 isVirtualRelayLink] & 1) == 0 && v6)
  {
    id v10 = [v6 udpConnection];

    if (v10)
    {
      uint64_t v11 = [v6 udpConnection];
      [(IDSDatagramChannel *)self _removeDirectConnection:v11];

      char v12 = [v6 udpConnection];
      nw_connection_cancel(v12);
    }
    int v13 = [v6 qpodConnection];

    if (v13)
    {
      BOOL v14 = [v6 qpodConnection];
      [(IDSDatagramChannel *)self _removeDirectConnection:v14];

      __int16 v15 = [v6 qpodConnection];
      nw_connection_cancel(v15);
    }
    id v6 = 0;
  }
}

- (BOOL)isDaemonConnection:(id)a3
{
  return self->_internal->_connection == a3;
}

- (id)connectionForLinkID:(char)a3
{
  internal = self->_internal;
  if (internal->_preferredDataPathType == 1)
  {
    double v5 = [(IDSDatagramChannel *)self _directOrDaemonConnectionForLinkID:a3];
    if (v5) {
      goto LABEL_5;
    }
    internal = self->_internal;
  }
  double v5 = internal->_connection;
LABEL_5:

  return v5;
}

- (void)_readFromDirectConnection:(id)a3 linkID:(char)a4 linkContext:(id)a5 connectionInfo:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (self->_internal->_isInvalidated)
  {
    char v12 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v17 = self;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Direct connection is invalidated. Skipping <%@> direct read.", buf, 0xCu);
    }
  }
  else
  {
    id v13 = v10;
    id v14 = v9;
    id v15 = v11;
    nw_connection_receive_multiple();
  }
}

- ($19A98EDAC2850B6C557AE4D7AD493570)_makeDirectPacketBufferFromDatagram:(const void *)a3 datagramSize:(unsigned int)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 datagramInfo:(id)a7 datagramOptions:(id *)a8 linkContext:(id)a9
{
  uint64_t v9 = *(void *)&a7.var0;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a9;
  id v14 = ($19A98EDAC2850B6C557AE4D7AD493570 *)_IDSLinkPacketBufferCreate();
  uint64_t v51 = v14;
  if (v14->var1 < a4)
  {
    id v15 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = a4;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "_makeDirectPacketBufferFromDatagram: datagramSize is %u, and exceeds IDSLinkPacketBuffer limit", buf, 8u);
    }

    _IDSLinkPacketBufferRelease();
    goto LABEL_47;
  }
  uint64_t v16 = (char)v9;
  size_t v17 = a4;
  if (!a4)
  {
    uint64_t v18 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "_makeDirectPacketBufferFromDatagram: datagramSize has no data", buf, 2u);
    }
  }
  memcpy(v14->var0, a3, v17);
  v14->int64_t var2 = v17;
  if ((int)v16 < 1)
  {
    id v29 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = (char)v9;
      _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEFAULT, "_makeDirectPacketBufferFromDatagram: wrong linkID %d.", buf, 8u);
    }

    goto LABEL_47;
  }
  v14->var25 = v9;
  if (WORD1(v9)) {
    v14->var21 = WORD1(v9);
  }
  if (BYTE4(v9)) {
    v14->var22 = BYTE4(v9);
  }
  if ([v13 connectionType] != 1)
  {
    if (!a8)
    {
LABEL_39:
      [v13 connectionType];
      [v13 channelNumber];
      int v24 = StunUtilPrepareOutgoingChannelData();
      if (self->_internal->_verboseFunctionalLogging)
      {
        int v25 = v24;
        __int16 v26 = +[IDSLogging IDSDataChannels];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int64_t var2 = v51->var2;
          int v28 = [v13 channelNumber];
          *(_DWORD *)buf = 134218496;
          int64_t v53 = var2;
          __int16 v54 = 1024;
          int v55 = v25;
          __int16 v56 = 1024;
          int v57 = v28;
          _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "QuickRelayHeaderDebug _makeDirectPacketBufferFromDatagram: packetBufferSize is %zd, result:%d, channel number:%d", buf, 0x18u);
        }
      }
      id v14 = v51;
      goto LABEL_48;
    }
    unsigned int var0 = a8->var0;
    if (a8->var0)
    {
      v14->var24[0].var20 |= 1u;
      if ([v13 isVirtualRelayLink]) {
        uint64_t v16 = [v13 delegatedLinkID];
      }
      v14->var24[0].uint64_t var4 = [(IDSDatagramChannel *)self _translateParticipantID:a8->var1 forLinkID:v16];
      unsigned int var0 = a8->var0;
    }
    if ((var0 & 2) != 0)
    {
      v14->var24[0].var20 |= 2u;
      uint64_t var4 = a8->var4;
      v14->var24[0].int64_t var2 = var4;
      if ((int)var4 >= 1)
      {
        var5 = a8->var5;
        var3 = v14->var24[0].var3;
        do
        {
          unsigned __int16 v23 = *var5++;
          *var3++ = v23;
          --var4;
        }
        while (var4);
      }
    }
    if ((var0 & 0x10) != 0)
    {
      v14->var24[0].var20 |= 0x10u;
      v14->var24[0].var6 = a8->var2;
      if ((var0 & 0x40) == 0)
      {
LABEL_26:
        if ((var0 & 8) == 0) {
          goto LABEL_27;
        }
        goto LABEL_51;
      }
    }
    else if ((var0 & 0x40) == 0)
    {
      goto LABEL_26;
    }
    v14->var24[0].var20 |= 0x40u;
    v14->var24[0].var10 = a8->var7;
    if ((var0 & 8) == 0)
    {
LABEL_27:
      if ((var0 & 0x20) == 0) {
        goto LABEL_28;
      }
      goto LABEL_52;
    }
LABEL_51:
    v14->var24[0].var20 |= 8u;
    v14->var24[0].var5 = a8->var3;
    if ((var0 & 0x20) == 0)
    {
LABEL_28:
      if ((var0 & 4) == 0) {
        goto LABEL_29;
      }
      goto LABEL_53;
    }
LABEL_52:
    v14->var24[0].var20 |= 0x20u;
    v14->var24[0].var7 = a8->var6;
    if ((var0 & 4) == 0)
    {
LABEL_29:
      if ((var0 & 0x400) == 0) {
        goto LABEL_30;
      }
      goto LABEL_54;
    }
LABEL_53:
    v14->var24[0].var20 |= 4u;
    v14->var24[0].var8 = 1;
    if ((var0 & 0x400) == 0)
    {
LABEL_30:
      if ((var0 & 0x100) == 0) {
        goto LABEL_31;
      }
      goto LABEL_63;
    }
LABEL_54:
    v14->var24[0].var20 |= 0x400u;
    v14->var24[0].var13 = 1;
    id v31 = [v13 hbhEncryptionkey];
    char v32 = IDSHBHEncryptDataWithKey();

    if (v32)
    {
      unint64_t var1 = v14->var1;
      if (var1 >= [v32 length])
      {
        v14->int64_t var2 = [v32 length];
        v49 = v14->var0;
        id v50 = v32;
        memcpy(v49, (const void *)[v50 bytes], v14->var2);

        unsigned int var0 = a8->var0;
        if ((a8->var0 & 0x100) == 0)
        {
LABEL_31:
          if ((var0 & 0x80) == 0) {
            goto LABEL_32;
          }
          goto LABEL_64;
        }
LABEL_63:
        v14->var24[0].var20 |= 0x100u;
        v14->var24[0].var12 = 1;
        if ((var0 & 0x80) == 0)
        {
LABEL_32:
          if ((var0 & 0x10000) == 0) {
            goto LABEL_33;
          }
          goto LABEL_65;
        }
LABEL_64:
        v14->var24[0].var20 |= 0x80u;
        v14->var24[0].var9 = 1;
        if ((var0 & 0x10000) == 0)
        {
LABEL_33:
          if ((var0 & 0x20000) == 0)
          {
LABEL_35:
            if ([v13 isVirtualRelayLink])
            {
              v14->var24[0].var20 |= 0x800u;
              v14->var24[0].var14 = 1;
              v14->var24[0].var15[0] = [v13 remoteRelayLinkID];
            }
            if ((a8->var0 & 0x8000) != 0) {
              [(IDSDatagramChannel *)self _sendSequenceNumberMetadataToDaemon:a8->var12];
            }
            goto LABEL_39;
          }
LABEL_34:
          v14->var24[0].var20 |= 0x20000u;
          v14->var24[0].var18 = 1;
          goto LABEL_35;
        }
LABEL_65:
        v14->var24[0].var20 |= 0x10000u;
        v14->var24[0].var17 = 1;
        if ((var0 & 0x20000) == 0) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
      v34 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_191A41410(v34, v35, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      v34 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_191A413D8(v34, v42, v43, v44, v45, v46, v47, v48);
      }
    }

    _IDSLinkPacketBufferRelease();
LABEL_47:
    id v14 = 0;
  }
LABEL_48:

  return v14;
}

- (void)_sendStatsRequestViaDaemon
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_readLock = &self->_internal->_readLock;
  os_unfair_lock_lock(p_readLock);
  if (!self->_internal->_isInvalidated)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    double v5 = [MEMORY[0x1E4F6B5A8] serializeSessionInfoMetadata:Mutable];
    id v6 = v5;
    if (v5)
    {
      if ((unint64_t)[v5 length] <= 0x1000)
      {
        id v8 = v6;
        [v8 bytes];
        uint64_t v9 = (void *)_IDSLinkPacketBufferCreate();
        unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v13 = v10;
        long long v14 = v10;
        IDSByteBufferInitForWriteWithAllocatedSpace();
        objc_msgSend(v8, "length", v13);
        IDSByteBufferWriteField();
        _DWORD v9[2] = v14 - *v9;
        IDSByteBufferRelease();
        [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v9];
        os_unfair_lock_lock(&self->_internal->_writeLock);
        sendingMetadata = self->_internal->_sendingMetadata;
        char v12 = [MEMORY[0x1E4F29238] valueWithPointer:v9];
        [(NSMutableArray *)sendingMetadata addObject:v12];

        [(IDSDatagramChannel *)self sendMetadata];
        os_unfair_lock_unlock(&self->_internal->_writeLock);
        goto LABEL_11;
      }
      uint64_t v7 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v13) = 134217984;
        *(void *)((char *)&v13 + 4) = [v6 length];
        _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "_sendStatsRequestViaDaemon: serialized metadata size: %lu, greater than max allowed sent size, return", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      uint64_t v7 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "_sendStatsRequestViaDaemon: invalid stats data, return", (uint8_t *)&v13, 2u);
      }
    }

LABEL_11:
  }
  os_unfair_lock_unlock(p_readLock);
}

- (void)_sendSequenceNumberMetadataToDaemon:(unint64_t)a3
{
  uint64_t v4 = (void *)_IDSLinkPacketBufferCreate();
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v8 = v5;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  IDSByteBufferWriteField();
  v4[2] = 0xAAAAAAAAAAAAAAAALL - *v4;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v4, v8);
  os_unfair_lock_assert_owner(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithPointer:v4];
  [(NSMutableArray *)sendingMetadata addObject:v7];

  [(IDSDatagramChannel *)self sendMetadata];
}

- (void)_writeToDirectConnection:(id)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 currentDatagramCount:(unsigned __int8)a6 totalDatagramCount:(unsigned __int8)a7 datagramInfo:(id)a8 datagramOptions:(id *)a9 completionHandler:(id)a10
{
  uint64_t v10 = a7;
  uint64_t v11 = a6;
  uint64_t v12 = *(void *)&a5;
  id v40 = a3;
  uint64_t v39 = (void *)[a10 copy];
  unint64_t v15 = (void *)[self->_internal->_writeHandler copy];
  uint64_t v16 = [(IDSDatagramChannel *)self _underlyingLinkContextForLinkID:a8.var0];
  size_t v17 = -[IDSDatagramChannel _makeDirectPacketBufferFromDatagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:linkContext:](self, "_makeDirectPacketBufferFromDatagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:linkContext:", a4, v12, v11, v10, *(void *)&a8.var0, *(unsigned __int16 *)&a8.var4, a9, v16);
  uint64_t v18 = [v16 connectionType];
  uint64_t v38 = v16;
  unsigned __int8 v19 = [v16 isQUICPod];
  if (v17)
  {
    unsigned __int8 v20 = v19;
    uint64_t v37 = v15;
    if ((v19 & (v18 != 1)) != 0) {
      uint64_t v21 = 4;
    }
    else {
      uint64_t v21 = 0;
    }
    dispatch_data_t v22 = sub_191982E44((uint64_t *)v17, v21);
    unsigned __int16 v23 = (id)*MEMORY[0x1E4F38C58];
    int v24 = v23;
    if ((a9->var0 & 0x40000) != 0
      || (a9->var0 & 0x200) != 0
      || (*(_DWORD *)&a8.var0 & 0xFFFF0000) != 0
      || (*(void *)&a8.var0 & 0xFF00000000) != 0)
    {
      int v25 = nw_content_context_create("IDSDC packet metadata");

      unsigned int var0 = a9->var0;
      if ((a9->var0 & 0x40000) != 0)
      {
        nw_content_context_set_packet_id();
        unsigned int var0 = a9->var0;
      }
      if ((var0 & 0x200) != 0) {
        nw_content_context_set_expiration_milliseconds(v25, a9->var10);
      }
      long long v27 = sub_1919F39E4(a8.var1, a8.var2);
      if (v27) {
        nw_content_context_set_metadata_for_protocol(v25, v27);
      }
    }
    else
    {
      int v25 = v23;
    }
    int v28 = v40;
    id v29 = v38;
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = sub_1919F3B30;
    completion[3] = &unk_1E572D010;
    int v49 = v12;
    id v42 = v38;
    uint64_t v43 = self;
    char v50 = a8.var0;
    unsigned __int8 v51 = v20;
    uint64_t v48 = v17;
    uint64_t v44 = v40;
    dispatch_data_t v45 = v22;
    dispatch_data_t v30 = v22;
    id v31 = v39;
    id v46 = v39;
    unint64_t v15 = v37;
    id v47 = v37;
    char v32 = v30;
    nw_connection_send(v44, v32, v25, 1, completion);
  }
  else
  {
    id v33 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v34 = objc_msgSend(v33, "initWithObjectsAndKeys:", @"Not enough packet buffer space", *MEMORY[0x1E4F28568], 0);
    id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v36 = (void *)[v35 initWithDomain:*MEMORY[0x1E4F6ACF0] code:6 userInfo:v34];
    id v31 = v39;
    sub_19198300C(v39, v15, v36, v12);

    int v28 = v40;
    id v29 = v38;
  }
}

- (void)setLinkIDToParticipantMap:(id)a3
{
  uint64_t v4 = [a3 mutableCopy];
  internal = self->_internal;
  linkIDToParticipantMap = internal->_linkIDToParticipantMap;
  internal->_linkIDToParticipantMap = (NSMutableDictionary *)v4;

  MEMORY[0x1F41817F8](v4, linkIDToParticipantMap);
}

- (id)getNwProtocolMetaDataForTrafficClass:(unsigned __int16)a3
{
  return sub_1919F39E4(a3, 0);
}

- (id)getContext
{
  return self->_internal->_context;
}

- (id)getQueue
{
  return self->_internal->_queue;
}

- (id)getDispatchDataForPacketBuffer:(id *)a3
{
  dispatch_data_t v3 = sub_191982E44((uint64_t *)a3, 0);

  return v3;
}

- (id)getIDSDataChannelsQueue
{
  if (qword_1E92DFC00 != -1) {
    dispatch_once(&qword_1E92DFC00, &unk_1EE246868);
  }
  v0 = (void *)qword_1E92DFC08;

  return v0;
}

- (NSArray)connectedLinks
{
  os_unfair_lock_lock(&self->_internal->_linkContextsLock);
  dispatch_data_t v3 = [(NSMutableDictionary *)self->_internal->_linkContexts allValues];
  os_unfair_lock_unlock(&self->_internal->_linkContextsLock);

  return (NSArray *)v3;
}

- (id)_linkContextsCopy
{
  os_unfair_lock_lock(&self->_internal->_linkContextsLock);
  dispatch_data_t v3 = (void *)[(NSMutableDictionary *)self->_internal->_linkContexts copy];
  os_unfair_lock_unlock(&self->_internal->_linkContextsLock);

  return v3;
}

- (void)_removeLinkContextWithID:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  p_linkContextsLock = &self->_internal->_linkContextsLock;
  os_unfair_lock_lock(p_linkContextsLock);
  linkContexts = self->_internal->_linkContexts;
  uint64_t v7 = [NSNumber numberWithUnsignedChar:v3];
  [(NSMutableDictionary *)linkContexts removeObjectForKey:v7];

  os_unfair_lock_unlock(p_linkContextsLock);
}

- (void)_setLinkContext:(id)a3 forLinkID:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_linkContextsLock = &self->_internal->_linkContextsLock;
  os_unfair_lock_lock(p_linkContextsLock);
  linkContexts = self->_internal->_linkContexts;
  uint64_t v9 = [NSNumber numberWithUnsignedChar:v4];
  [(NSMutableDictionary *)linkContexts setObject:v6 forKey:v9];

  uint64_t v10 = +[IDSLogging IDSDataChannels];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v4;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "LinkID %d associated with LinkContext %@", (uint8_t *)v11, 0x12u);
  }

  os_unfair_lock_unlock(p_linkContextsLock);
}

- (id)_linkContextWithID:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  p_linkContextsLock = &self->_internal->_linkContextsLock;
  os_unfair_lock_lock(p_linkContextsLock);
  linkContexts = self->_internal->_linkContexts;
  uint64_t v7 = [NSNumber numberWithUnsignedChar:v3];
  long long v8 = [(NSMutableDictionary *)linkContexts objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_linkContextsLock);

  return v8;
}

- (IDSDataChannelLinkContext)defaultLink
{
  p_linkContextsLock = &self->_internal->_linkContextsLock;
  os_unfair_lock_lock(p_linkContextsLock);
  internal = self->_internal;
  linkContexts = internal->_linkContexts;
  id v6 = [NSNumber numberWithChar:internal->_defaultLinkID];
  uint64_t v7 = [(NSMutableDictionary *)linkContexts objectForKey:v6];

  if (v7 || self->_internal->_socketDescriptor < 1) {
    long long v8 = v7;
  }
  else {
    long long v8 = [[IDSDataChannelLinkContext alloc] initWithDummyInformation];
  }
  uint64_t v9 = v8;

  os_unfair_lock_unlock(p_linkContextsLock);

  return v9;
}

- (IDSDatagramChannel)initWithSocketDescriptor:(int)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v5 = _IDSRunningInDaemon();
  id v6 = +[IDSLogging IDSDataChannels];
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    goto LABEL_5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int v24 = self;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Creating with socket %d", buf, 0x12u);
  }

  v22.receiver = self;
  v22.super_class = (Class)IDSDatagramChannel;
  self = [(IDSDatagramChannel *)&v22 init];
  if (!self)
  {
LABEL_11:
    self = self;
    long long v8 = self;
    goto LABEL_12;
  }
  uint64_t v9 = objc_alloc_init(_IDSDatagramChannel);
  internal = self->_internal;
  self->_internal = v9;

  uint64_t v11 = self->_internal;
  if (v11)
  {
    v11->_socketDescriptor = a3;
    __int16 v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = self->_internal;
    linkContexts = v13->_linkContexts;
    v13->_linkContexts = v12;

    self->_internal->_connected = 1;
    self->_internal->_operationMode = 0;
    uint64_t v15 = IDSRealTimeContext();
    uint64_t v16 = self->_internal;
    context = v16->_context;
    v16->_context = (OS_nw_context *)v15;

    uint64_t v18 = -[IDSDatagramChannel getIDSDataChannelsQueue]_0();
    unsigned __int8 v19 = self->_internal;
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v18;

    goto LABEL_11;
  }
LABEL_5:
  long long v8 = 0;
LABEL_12:

  return v8;
}

- (IDSDatagramChannel)initWithDestination:(id)a3 options:(id)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = _IDSRunningInDaemon();
  uint64_t v9 = +[IDSLogging IDSDataChannels];
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A41A20();
    }

    goto LABEL_78;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Creating with destination %@", buf, 0x16u);
  }

  v101.receiver = self;
  v101.super_class = (Class)IDSDatagramChannel;
  self = [(IDSDatagramChannel *)&v101 init];
  if (self)
  {
    uint64_t v11 = objc_alloc_init(_IDSDatagramChannel);
    internal = self->_internal;
    self->_internal = v11;

    if (!self->_internal)
    {
LABEL_78:
      unsigned __int8 v86 = 0;
      goto LABEL_79;
    }
    self->_internal->_osChannelFD = -1;
    p_internal = &self->_internal;
    self->_internal->_socketDescriptor = -1;
    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    linkContexts = self->_internal->_linkContexts;
    (*p_internal)->_linkContexts = v14;

    (*p_internal)->_linkContextsLock._os_unfair_lock_opaque = 0;
    (*p_internal)->_linkIDToParticipantMapLock._os_unfair_lock_opaque = 0;
    uint64_t v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sendingMetadata = self->_internal->_sendingMetadata;
    (*p_internal)->_sendingMetadata = v16;

    (*p_internal)->_hasMetadata = 1;
    v98 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6AD98]];
    if (v98)
    {
      self->_internal->_int64_t operationMode = [v98 integerValue];
      if (self->_internal->_operationMode < 2uLL) {
        goto LABEL_15;
      }
      uint64_t v18 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int64_t operationMode = self->_internal->_operationMode;
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = operationMode;
        _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "<%p> Invalid operation mode value %ld - defaulting to IDSDatagramChannelOperationModeFileDescriptor", buf, 0x16u);
      }
    }
    self->_internal->_int64_t operationMode = 0;
LABEL_15:
    uint64_t v20 = IDSRealTimeContext();
    uint64_t v21 = self->_internal;
    context = v21->_context;
    v21->_context = (OS_nw_context *)v20;

    -[IDSDatagramChannel getIDSDataChannelsQueue]_0();
    unsigned __int16 v23 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    queue = self->_internal->_queue;
    self->_internal->_queue = v23;

    uint64_t v25 = *MEMORY[0x1E4F6AD90];
    int v26 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6AD90]];

    if (v26)
    {
      uint64_t v27 = [v7 objectForKeyedSubscript:v25];
      int v28 = self->_internal;
      id v29 = v28->_context;
      v28->_context = (OS_nw_context *)v27;

      dispatch_data_t v30 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = self->_internal->_context;
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "<%p> Got IDSDatagramChannelNWContextKey %@ from client.", buf, 0x16u);
      }
    }
    v97 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6ADA0]];
    if (v97)
    {
      self->_internal->_int64_t preferredDataPathType = [v97 integerValue];
      if (self->_internal->_preferredDataPathType < 2uLL)
      {
LABEL_25:
        v34 = self->_internal;
        if (!v34->_operationMode && v34->_preferredDataPathType == 1)
        {
          id v35 = +[IDSLogging IDSDataChannels];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl(&dword_19190B000, v35, OS_LOG_TYPE_DEFAULT, "<%p> Shared direct data path not compatible with file descriptor mode - defaulting to IDSDatagramChannelDataPathThroughIDSDaemon", buf, 0xCu);
          }

          self->_internal->_int64_t preferredDataPathType = 0;
        }
        uint64_t v36 = +[IDSLogging IDSDataChannels];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = self->_internal;
          uint64_t v38 = @"Dispatch";
          int64_t v40 = v37->_operationMode;
          int64_t preferredDataPathType = v37->_preferredDataPathType;
          if (!v40) {
            uint64_t v38 = @"FileDescriptor";
          }
          uint64_t v41 = @"Direct";
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = self;
          if (!preferredDataPathType) {
            uint64_t v41 = @"Daemon";
          }
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v38;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v40;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v41;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = preferredDataPathType;
          _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "<%p> Operation mode %@ (%d) preferred datapath %@ (%d)", buf, 0x2Cu);
        }

        id v42 = nw_parameters_create();
        nw_parameters_set_indefinite();
        xpc_object_t xarray = xpc_array_create(0, 0);
        xpc_object_t v99 = xpc_array_create(0, 0);
        id v43 = [NSString stringWithFormat:@"%@%u", *MEMORY[0x1E4F6B100], getuid()];
        xpc_array_set_string(xarray, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v43 UTF8String]);

        xpc_array_set_string(v99, 0xFFFFFFFFFFFFFFFFLL, (const char *)[(id)*MEMORY[0x1E4F6B0F8] UTF8String]);
        nw_parameters_set_data_mode();
        nw_parameters_set_required_netagent_classes();
        nw_parameters_set_context();
        if (self->_internal->_preferredDataPathType == 1)
        {
          pid_t v44 = getpid();
          memset(buf, 0, 56);
          if (!proc_pidinfo(v44, 17, 1uLL, buf, 56))
          {
            int v89 = *__error();
            unsigned __int16 v90 = +[IDSLogging IDSDataChannels];
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v109 = 67109376;
              *(_DWORD *)&v109[4] = v44;
              LOWORD(v110) = 1024;
              *(_DWORD *)((char *)&v110 + 2) = v89;
              _os_log_impl(&dword_19190B000, v90, OS_LOG_TYPE_DEFAULT, "proc_pidinfo for pid %d failed (errno: %d)", v109, 0xEu);
            }

            goto LABEL_77;
          }
          uint64_t v45 = *(void *)&buf[16];
          id v46 = +[IDSLogging IDSDataChannels];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v109 = 67109376;
            *(_DWORD *)&v109[4] = v44;
            LOWORD(v110) = 2048;
            *(void *)((char *)&v110 + 2) = v45;
            _os_log_impl(&dword_19190B000, v46, OS_LOG_TYPE_DEFAULT, "proc_pidinfo for pid %d returned client unique PID %llu", v109, 0x12u);
          }

          objc_msgSend(NSString, "stringWithFormat:", @"%llu", v45);
          id v47 = objc_claimAutoreleasedReturnValue();
          [v47 UTF8String];
          nw_parameters_set_account_id();
        }
        uint64_t v48 = [MEMORY[0x1E4F1CA60] dictionary];
        char v50 = &self->_internal;
        int v49 = self->_internal;
        MKIArrivalTime = v49->_MKIArrivalTime;
        v49->_MKIArrivalTime = (NSMutableDictionary *)v48;

        uint64_t v52 = [MEMORY[0x1E4F1CA60] dictionary];
        firstPacketArrivalTimeForMKI = self->_internal->_firstPacketArrivalTimeForMKI;
        (*v50)->_firstPacketArrivalTimeForMKI = (NSMutableDictionary *)v52;

        uint64_t v54 = [MEMORY[0x1E4F1CA60] dictionary];
        probingDict = self->_internal->_probingDict;
        (*v50)->_probingDict = (NSMutableDictionary *)v54;

        (*v50)->_writeLock._os_unfair_lock_opaque = 0;
        (*v50)->_readLock._os_unfair_lock_opaque = 0;
        int64_t v56 = self->_internal->_operationMode;
        if (v56 == 1)
        {
          if (v26)
          {
            long long v79 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
            long long v80 = dispatch_queue_attr_make_initially_inactive(v79);
            dispatch_queue_t v81 = dispatch_queue_create("IDSDataChannelsRealTimeQueue", v80);
            long long v82 = self->_internal;
            long long v83 = v82->_queue;
            v82->_queue = (OS_dispatch_queue *)v81;

            nw_queue_context_target_dispatch_queue();
            dispatch_activate((dispatch_object_t)self->_internal->_queue);
          }
          host = nw_endpoint_create_host((const char *)[v6 UTF8String], "2");
          nw_connection_t v84 = nw_connection_create(host, v42);
          unsigned __int16 v85 = self->_internal;
          connection = v85->_connection;
          v85->_connection = (OS_nw_connection *)v84;
          goto LABEL_60;
        }
        if (v56)
        {
          unsigned int v87 = +[IDSLogging IDSDataChannels];
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v88 = self->_internal->_operationMode;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v88;
            _os_log_impl(&dword_19190B000, v87, OS_LOG_TYPE_DEFAULT, "invalid operation mode %d", buf, 8u);
          }

          [(IDSDatagramChannel *)self close];
          goto LABEL_77;
        }
        dispatch_semaphore_t v57 = dispatch_semaphore_create(0);
        host = nw_endpoint_create_host((const char *)[v6 UTF8String], "3");
        *(void *)v109 = 0;
        *(void *)&long long v110 = v109;
        *((void *)&v110 + 1) = 0x2020000000;
        char v111 = 0;
        uuid_clear(self->_internal->_nexus_instance);
        uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
        unsigned int v60 = self->_internal;
        pathEvaluator = v60->_pathEvaluator;
        v60->_pathEvaluator = (OS_nw_path_evaluator *)evaluator_for_endpoint;

        uint64_t v62 = (void *)nw_path_evaluator_copy_path();
        v96 = self;
        connection = v57;
        if (nw_path_evaluator_set_update_handler())
        {
          if (nw_path_uses_nexus())
          {
            if (nw_path_request_nexus())
            {
              double v64 = sub_1919FC4A8();
              dispatch_time_t v65 = dispatch_time(0, 12000000000);
              dispatch_semaphore_wait(connection, v65);
              long long v66 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                log = v66;
                v95 = v62;
                int v67 = *(unsigned __int8 *)(v110 + 24);
                v68 = self->_internal;
                BOOL connected = v68->_connected;
                long long v71 = v68->_pathEvaluator;
                osChannel = v68->_osChannel;
                double v72 = sub_1919FC4A8();
                *(_DWORD *)buf = 138414338;
                long long v73 = @"YES";
                long long v74 = self->_internal;
                if (connected) {
                  uint64_t v75 = @"YES";
                }
                else {
                  uint64_t v75 = @"NO";
                }
                if (!v67) {
                  long long v73 = @"NO";
                }
                int64_t v76 = v74->_operationMode;
                int64_t v77 = v74->_preferredDataPathType;
                *(void *)&uint8_t buf[4] = v73;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v75;
                *(_WORD *)&buf[22] = 2048;
                *(void *)&buf[24] = v71;
                *(_WORD *)&buf[32] = 2112;
                *(void *)&buf[34] = host;
                *(_WORD *)&buf[42] = 2112;
                *(void *)&buf[44] = v42;
                *(_WORD *)&buf[52] = 2048;
                *(void *)&buf[54] = osChannel;
                __int16 v103 = 2048;
                double v104 = v72 - v64;
                __int16 v105 = 1024;
                int v106 = v76;
                __int16 v107 = 1024;
                int v108 = v77;
                long long v66 = log;
                _os_log_impl(&dword_19190B000, log, OS_LOG_TYPE_DEFAULT, "osChannel create success %@ (connected: %@) for pathEvaluator %p with endpoint %@ parameters %@ osChannel %p creationTime %0.6lf operationMode %d preferredDataPathType %d", buf, 0x54u);
                uint64_t v62 = v95;
              }

              if (*(unsigned char *)(v110 + 24))
              {
                long long v78 = self->_internal;
                if (v78->_pathEvaluator)
                {
                  if (v78->_osChannel)
                  {

                    _Block_object_dispose(v109, 8);
LABEL_60:

                    goto LABEL_61;
                  }
                }
              }
              [(IDSDatagramChannel *)v96 close];
              goto LABEL_76;
            }
            v91 = +[IDSTransportLog IDSDataChannels];
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              double v92 = "nw_path_request_nexus returned no";
              goto LABEL_74;
            }
LABEL_75:

            nw_path_evaluator_cancel();
LABEL_76:

            _Block_object_dispose(v109, 8);
LABEL_77:

            goto LABEL_78;
          }
          v91 = +[IDSTransportLog IDSDataChannels];
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_75;
          }
          *(_WORD *)buf = 0;
          double v92 = "nw_path_uses_nexus returned no";
        }
        else
        {
          v91 = +[IDSTransportLog IDSDataChannels];
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_75;
          }
          *(_WORD *)buf = 0;
          double v92 = "nw_path_evaluator_set_update_handler failed";
        }
LABEL_74:
        _os_log_impl(&dword_19190B000, v91, OS_LOG_TYPE_DEFAULT, v92, buf, 2u);
        goto LABEL_75;
      }
      char v32 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v33 = self->_internal->_operationMode;
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v33;
        _os_log_impl(&dword_19190B000, v32, OS_LOG_TYPE_DEFAULT, "<%p> Invalid preferred data path value %ld - defaulting to IDSDatagramChannelDataPathThroughIDSDaemon", buf, 0x16u);
      }
    }
    self->_internal->_int64_t preferredDataPathType = 0;
    goto LABEL_25;
  }
LABEL_61:
  self = self;
  unsigned __int8 v86 = self;
LABEL_79:

  return v86;
}

- (id)cachedMetadata
{
  return self->_internal->_sendingMetadata;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "-dealloc called for %@", buf, 0xCu);
  }

  IDSLinkPacketBufferCleanup();
  [(IDSDatagramChannel *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)IDSDatagramChannel;
  [(IDSDatagramChannel *)&v4 dealloc];
}

- (id)description
{
  internal = self->_internal;
  if (internal->_isInvalidated)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<%p> IDSDataChannels has been invalidated", self, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    uint64_t v3 = @"YES";
    if (internal->_connected) {
      objc_super v4 = @"YES";
    }
    else {
      objc_super v4 = @"NO";
    }
    id eventHandler = internal->_eventHandler;
    id readHandler = internal->_readHandler;
    id readHandlerWithOptions = internal->_readHandlerWithOptions;
    if (internal->_pathEvaluator)
    {
      if (!internal->_startCalled) {
        uint64_t v3 = @"NO";
      }
      [NSString stringWithFormat:@"<%p> channelFD %d connected %@ eventHandler %p readHandler %p withOptions %p auto %@", self, internal->_osChannelFD, v4, eventHandler, readHandler, readHandlerWithOptions, v3];
    }
    else
    {
      [NSString stringWithFormat:@"<%p> socket %d connected %@ eventHandler %p readHandler %p withOptions %p", self, internal->_socketDescriptor, v4, eventHandler, readHandler, readHandlerWithOptions, v15];
    }
  int v8 = };

  return v8;
}

- (unint64_t)_logChecksum:(const void *)a3 length:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  unint64_t result = crc32_z(0, (const Bytef *)a3, a4);
  if (!result || result % 0xB3) {
    return 0;
  }
  return result;
}

- (void)_logPendingSendingStats:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DFC18 != -1) {
    dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
  }
  double v5 = *(double *)&qword_1E92DFC20 * (double)mach_continuous_time();
  self->_internal->_pendingOutgoingBytes += a3;
  ++self->_internal->_pendingOutgoingPackets;
  internal = self->_internal;
  double lastPendingOutgoingStatReport = internal->_lastPendingOutgoingStatReport;
  if (lastPendingOutgoingStatReport == 0.0)
  {
    int v8 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2048;
      double v16 = *(double *)&a3;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "<%@> pending outgoing the first data packet (size: %lu)", (uint8_t *)&v13, 0x16u);
    }

    self->_internal->_double lastPendingOutgoingStatReport = v5;
  }
  else
  {
    double v9 = v5 - lastPendingOutgoingStatReport;
    if (v5 - lastPendingOutgoingStatReport > 3.0)
    {
      unint64_t pendingOutgoingBytes = internal->_pendingOutgoingBytes;
      unint64_t pendingOutgoingPackets = internal->_pendingOutgoingPackets;
      internal->_double lastPendingOutgoingStatReport = v5;
      self->_internal->_unint64_t pendingOutgoingBytes = 0;
      self->_internal->_unint64_t pendingOutgoingPackets = 0;
      uint64_t v12 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412802;
        uint64_t v14 = self;
        __int16 v15 = 2048;
        double v16 = (double)pendingOutgoingBytes / v9;
        __int16 v17 = 2048;
        double v18 = (double)pendingOutgoingPackets / v9;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "<%@> pending outgoing %f bytes/s %f packets/s", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (void)_logSendingStats:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DFC18 != -1) {
    dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
  }
  double v5 = *(double *)&qword_1E92DFC20 * (double)mach_continuous_time();
  self->_internal->_outgoingBytes += a3;
  ++self->_internal->_outgoingPackets;
  internal = self->_internal;
  double lastOutgoingStatReport = internal->_lastOutgoingStatReport;
  if (lastOutgoingStatReport == 0.0)
  {
    int v8 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2048;
      double v16 = *(double *)&a3;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "<%@> sent the first data packet (size: %lu)", (uint8_t *)&v13, 0x16u);
    }

    self->_internal->_double lastOutgoingStatReport = v5;
  }
  else
  {
    double v9 = v5 - lastOutgoingStatReport;
    if (v5 - lastOutgoingStatReport > 3.0)
    {
      unint64_t outgoingBytes = internal->_outgoingBytes;
      unint64_t outgoingPackets = internal->_outgoingPackets;
      internal->_double lastOutgoingStatReport = v5;
      self->_internal->_unint64_t outgoingBytes = 0;
      self->_internal->_unint64_t outgoingPackets = 0;
      uint64_t v12 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412802;
        uint64_t v14 = self;
        __int16 v15 = 2048;
        double v16 = (double)outgoingBytes / v9;
        __int16 v17 = 2048;
        double v18 = (double)outgoingPackets / v9;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "<%@> TX %f bytes/s %f packets/s", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (void)_logReceivingStats:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DFC18 != -1) {
    dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
  }
  double v5 = *(double *)&qword_1E92DFC20 * (double)mach_continuous_time();
  self->_internal->_incomingBytes += a3;
  ++self->_internal->_incomingPackets;
  internal = self->_internal;
  double lastIncomingStatReport = internal->_lastIncomingStatReport;
  if (lastIncomingStatReport == 0.0)
  {
    int v8 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2048;
      double v16 = *(double *)&a3;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "<%@> received the first data packet (size: %lu)", (uint8_t *)&v13, 0x16u);
    }

    self->_internal->_double lastIncomingStatReport = v5;
  }
  else
  {
    double v9 = v5 - lastIncomingStatReport;
    if (v5 - lastIncomingStatReport > 3.0)
    {
      unint64_t incomingBytes = internal->_incomingBytes;
      unint64_t incomingPackets = internal->_incomingPackets;
      internal->_double lastIncomingStatReport = v5;
      self->_internal->_unint64_t incomingBytes = 0;
      self->_internal->_unint64_t incomingPackets = 0;
      uint64_t v12 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412802;
        uint64_t v14 = self;
        __int16 v15 = 2048;
        double v16 = (double)incomingBytes / v9;
        __int16 v17 = 2048;
        double v18 = (double)incomingPackets / v9;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "<%@> RX %f bytes/s %f packets/s", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (void)_logFinalStats
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DFC18 != -1) {
    dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
  }
  double v3 = *(double *)&qword_1E92DFC20 * (double)mach_continuous_time();
  internal = self->_internal;
  double v5 = v3 - internal->_lastPendingOutgoingStatReport;
  if (v5 > 0.0)
  {
    unint64_t pendingOutgoingBytes = internal->_pendingOutgoingBytes;
    unint64_t pendingOutgoingPackets = internal->_pendingOutgoingPackets;
    int v8 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412802;
      double v18 = self;
      __int16 v19 = 2048;
      double v20 = (double)pendingOutgoingBytes / v5;
      __int16 v21 = 2048;
      double v22 = (double)pendingOutgoingPackets / v5;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "<%@> pending outgoing [Final] %f bytes/s %f packets/s", (uint8_t *)&v17, 0x20u);
    }

    internal = self->_internal;
  }
  double v9 = v3 - internal->_lastOutgoingStatReport;
  if (v9 > 0.0)
  {
    unint64_t outgoingBytes = internal->_outgoingBytes;
    unint64_t outgoingPackets = internal->_outgoingPackets;
    uint64_t v12 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412802;
      double v18 = self;
      __int16 v19 = 2048;
      double v20 = (double)outgoingBytes / v9;
      __int16 v21 = 2048;
      double v22 = (double)outgoingPackets / v9;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "<%@> TX [Final] %f bytes/s %f packets/s", (uint8_t *)&v17, 0x20u);
    }

    internal = self->_internal;
  }
  double v13 = v3 - internal->_lastIncomingStatReport;
  if (v13 > 0.0)
  {
    unint64_t incomingBytes = internal->_incomingBytes;
    unint64_t incomingPackets = internal->_incomingPackets;
    double v16 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412802;
      double v18 = self;
      __int16 v19 = 2048;
      double v20 = (double)incomingBytes / v13;
      __int16 v21 = 2048;
      double v22 = (double)incomingPackets / v13;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "<%@> RX [Final] %f bytes/s %f packets/s", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (int)underlyingFileDescriptor
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v3 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "-underlyingFileDescriptor called for %@", (uint8_t *)&v7, 0xCu);
  }

  internal = self->_internal;
  if (internal->_operationMode) {
    sub_191A41AB0();
  }
  uint64_t v5 = 120;
  if (!internal->_pathEvaluator) {
    uint64_t v5 = 12;
  }
  return *(_DWORD *)((char *)&internal->super.isa + v5);
}

- (void)sendEventConnectedWithDummyLinkInfo
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (internal->_socketDescriptor >= 1 && internal->_connected)
  {
    os_unfair_lock_lock(&internal->_writeLock);
    objc_super v4 = self->_internal;
    if (v4->_sentFirstReadLinkInfo)
    {
      os_unfair_lock_unlock(&v4->_writeLock);
    }
    else
    {
      uint64_t v5 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v16 = self;
        _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "<%@> first read, will send dummy link information", buf, 0xCu);
      }

      id v6 = self->_internal;
      if (v6->_eventHandler)
      {
        int v7 = [[IDSDataChannelLinkContext alloc] initWithDummyInformation];
        int v8 = +[IDSTransportLog IDSDataChannels];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          double v16 = (IDSDatagramChannel *)v7;
          _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "<%@> dummy link information", buf, 0xCu);
        }

        id eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
        v13[1] = @"connected-link";
        v14[0] = &unk_1EE28B400;
        uint64_t v12 = v7;
        v13[0] = @"event-type";
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
        v14[1] = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
        eventHandler[2](eventHandler, v11);

        self->_internal->_sentFirstReadLinkInfo = 1;
        id v6 = self->_internal;
      }
      os_unfair_lock_unlock(&v6->_writeLock);
    }
  }
}

- (void)removeIDSDataChannelLinkContext:(char)a3 linkUUID:(id)a4 reason:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (self->_internal->_isInvalidated)
  {
    uint64_t v9 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "removeIDSDataChannelLinkContext: connection already closed", buf, 2u);
    }
  }
  else
  {
    uint64_t v9 = [(IDSDatagramChannel *)self _linkContextsCopy];
    uint64_t v10 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      int v28 = self;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 2112;
      char v32 = v9;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "<%@>  removeIDSDataChannelLinkContext:%u, linkContexts %@", buf, 0x1Cu);
    }

    uint64_t v11 = [(IDSDatagramChannel *)self _linkContextWithID:v6];
    uint64_t v12 = +[IDSTransportLog IDSDataChannels];
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138413058;
        int v28 = self;
        __int16 v29 = 1024;
        int v30 = v6;
        __int16 v31 = 2112;
        char v32 = v9;
        __int16 v33 = 1024;
        int v34 = v5;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventDisconnected, linkID %u, linkContexts %@, reason: %d", buf, 0x22u);
      }

      internal = self->_internal;
      id eventHandler = (void (**)(id, void *))internal->_eventHandler;
      if (eventHandler)
      {
        v26[0] = &unk_1EE28B3E8;
        v25[0] = @"event-type";
        v25[1] = @"disconnected-link";
        int v24 = v11;
        __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        v26[1] = v21;
        v25[2] = @"disconnected-link-ids";
        double v20 = objc_msgSend(NSNumber, "numberWithChar:", objc_msgSend(v11, "linkID"));
        uint64_t v23 = v20;
        double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
        v26[2] = v16;
        v25[3] = @"disconnected-link-uuids";
        id v22 = v8;
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        v26[3] = v17;
        v25[4] = @"disconnected-reason";
        double v18 = [NSNumber numberWithUnsignedChar:v5];
        v26[4] = v18;
        __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];
        eventHandler[2](eventHandler, v19);

        internal = self->_internal;
      }
      if (internal->_preferredDataPathType == 1) {
        [(IDSDatagramChannel *)self removeDirectConnectionsForLinkID:v6];
      }
      [(IDSDatagramChannel *)self _removeLinkContextWithID:v6];
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412802;
        int v28 = self;
        __int16 v29 = 1024;
        int v30 = v6;
        __int16 v31 = 2112;
        char v32 = v9;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "<%@> Can't find the linkContext of linkID %u, linkContexts %@", buf, 0x1Cu);
      }
    }
  }
}

- (void)addNewIDSDataChannelLinkWithAttributes:(char *)a3 linkAttributesLength:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  int v165 = -1431655766;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v163 = v5;
  long long v164 = v5;
  long long v161 = v5;
  long long v162 = v5;
  long long v159 = v5;
  long long v160 = v5;
  if (a4 <= 0x63u)
  {
    log = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_19190B000, log, OS_LOG_TYPE_DEFAULT, "invalid link attribute size (%u), too small.", buf, 8u);
    }
    goto LABEL_107;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)&v162 + 13];
  long long v9 = *((_OWORD *)a3 + 5);
  long long v163 = *((_OWORD *)a3 + 4);
  long long v164 = v9;
  int v165 = *((_DWORD *)a3 + 24);
  long long v10 = *((_OWORD *)a3 + 1);
  long long v159 = *(_OWORD *)a3;
  long long v160 = v10;
  long long v11 = *((_OWORD *)a3 + 3);
  uint64_t v12 = a3 + 100;
  unsigned int v13 = v4 - 100;
  long long v161 = *((_OWORD *)a3 + 2);
  long long v162 = v11;
  if ((v4 - 100) < 2)
  {
    v123 = 0;
    v124 = 0;
    log = 0;
    v120 = 0;
    double v16 = 0;
    v114 = 0;
    goto LABEL_29;
  }
  uint64_t v14 = 0;
  uint64_t v15 = __rev16(*((unsigned __int16 *)a3 + 50));
  if (v15)
  {
    v120 = 0;
    if (v4 - 102 >= v15)
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 + 102 length:v15];
      uint64_t v12 = &a3[v15 + 102];
      v120 = (void *)v14;
      if (v14)
      {
        uint64_t v14 = JWDecodeDictionary();
      }
      if ((v4 - 102 - v15) < 2)
      {
        v123 = 0;
        v124 = 0;
        log = 0;
        v114 = 0;
        double v16 = (void *)v14;
        goto LABEL_29;
      }
      unsigned int v13 = v4 - 102 - v15;
    }
  }
  else
  {
    v120 = 0;
  }
  uint64_t v115 = v14;
  log = 0;
  uint64_t v17 = __rev16(*(unsigned __int16 *)v12);
  if (v17 && (unsigned int v18 = v13 - 2 - v17, (int)(v13 - 2) >= (int)v17))
  {
    [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 + 2 length:v17];
    log = v12 += v17 + 2;
    if (log)
    {
      v123 = (void *)[[NSString alloc] initWithData:log encoding:4];
    }
    else
    {
      log = 0;
      v123 = 0;
    }
  }
  else
  {
    unsigned int v18 = v13;
    v123 = 0;
  }
  if (v18 < 2)
  {
    v114 = 0;
    v124 = 0;
  }
  else
  {
    __int16 v19 = self;
    uint64_t v20 = __rev16(*(unsigned __int16 *)v12);
    if (v20
      && (int)(v18 - 2) >= (int)v20
      && ([MEMORY[0x1E4F1C9B8] dataWithBytes:v12 + 2 length:v20],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          v12 += v20 + 2,
          v21))
    {
      v114 = (void *)v21;
      v124 = JWDecodeDictionary();
    }
    else
    {
      v114 = 0;
      v124 = 0;
    }
    self = v19;
  }
  double v16 = (void *)v115;
LABEL_29:
  if (BYTE2(v161) - 2 > 3) {
    goto LABEL_36;
  }
  id v22 = &a3[v4];
  if (v12 + 3 > v22)
  {
    if (BYTE12(v162))
    {
      uint64_t v23 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v161;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = BYTE13(v163);
        _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, "This is a virtual relay link(%u). Copying over attributes from delegated link(%u)", buf, 0xEu);
      }

      int v24 = [(IDSDatagramChannel *)self _linkContextWithID:BYTE13(v163)];
      uint64_t v25 = v24;
      if (v24)
      {
        uint64_t v118 = [v24 relayServerProvider];
        int v26 = [v25 relaySessionToken];
        v122 = (void *)[v26 copy];

        uint64_t v27 = [v25 relaySessionKey];
        v121 = (void *)[v27 copy];

        int v28 = [v25 hbhEncryptionkey];
        __int16 v29 = (void *)[v28 copy];

        int v30 = [v25 hbhDecryptionkey];
        uint64_t v31 = [v30 copy];
      }
      else
      {
        uint64_t v31 = 0;
        __int16 v29 = 0;
        v121 = 0;
        v122 = 0;
        uint64_t v118 = 0;
      }
      uint64_t v58 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = v16;
        int v60 = [v122 length];
        int v61 = [v121 length];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v118;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v60;
        double v16 = v59;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&uint8_t buf[16] = v61;
        _os_log_impl(&dword_19190B000, v58, OS_LOG_TYPE_DEFAULT, "Copied relay server provider:%d, session token:%dB, session key:%dB", buf, 0x14u);
      }

      int64_t v53 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_19190B000, v53, OS_LOG_TYPE_DEFAULT, "Copied hbhEncryptionkey:%@ and hbhDecryptionkey:%@", buf, 0x16u);
      }
LABEL_74:

      goto LABEL_75;
    }
LABEL_36:
    uint64_t v31 = 0;
    __int16 v29 = 0;
    v121 = 0;
    v122 = 0;
    uint64_t v118 = 0;
    goto LABEL_75;
  }
  char v32 = v12 + 1;
  uint64_t v118 = *v12;
  unsigned int v33 = v22 - (v12 + 1);
  if ((v33 & 0xFFFFFFFE) != 0)
  {
    v122 = 0;
    uint64_t v34 = __rev16(*(unsigned __int16 *)(v12 + 1));
    if (v34)
    {
      unsigned int v35 = v33 - 2 - v34;
      if ((int)(v33 - 2) >= (int)v34)
      {
        v122 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 + 3 length:v34];
        char v32 = &v12[v34 + 3];
        unsigned int v33 = v35;
      }
    }
  }
  else
  {
    v122 = 0;
  }
  int v36 = v33 - 2;
  if (v33 < 2)
  {
    __int16 v29 = 0;
    v121 = 0;
    goto LABEL_52;
  }
  v121 = 0;
  uint64_t v37 = __rev16(*(unsigned __int16 *)v32);
  if (v37)
  {
    unsigned int v38 = v36 - v37;
    if (v36 >= (int)v37)
    {
      uint64_t v39 = (unsigned __int16 *)(v32 + 2);
      v121 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v32 + 2 length:v37];
      int v36 = v38 - 2;
      if (v38 < 2)
      {
        __int16 v29 = 0;
        goto LABEL_52;
      }
      char v32 = (char *)v39 + v37;
      unsigned int v33 = v38;
    }
  }
  __int16 v29 = 0;
  uint64_t v40 = __rev16(*(unsigned __int16 *)v32);
  if (!v40)
  {
LABEL_110:
    unsigned int v99 = *(unsigned __int16 *)v32;
    v98 = (unsigned __int16 *)(v32 + 2);
    signed int v100 = __rev16(v99);
    if (v100 && (int)(v33 - 2) >= v100)
    {
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v98);
      goto LABEL_53;
    }
LABEL_52:
    uint64_t v31 = 0;
    goto LABEL_53;
  }
  unsigned int v41 = v36 - v40;
  if (v36 < (int)v40)
  {
    __int16 v29 = 0;
    goto LABEL_110;
  }
  id v42 = (unsigned __int16 *)(v32 + 2);
  uint64_t v43 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v32 + 2 length:v40];
  if (v41 >= 2)
  {
    char v32 = (char *)v42 + v40;
    unsigned int v33 = v41;
    __int16 v29 = (void *)v43;
    goto LABEL_110;
  }
  uint64_t v31 = 0;
  __int16 v29 = (void *)v43;
LABEL_53:
  pid_t v44 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&uint8_t buf[4] = v118;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = [v122 length];
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&uint8_t buf[16] = [v121 length];
    _os_log_impl(&dword_19190B000, v44, OS_LOG_TYPE_DEFAULT, "Got relay server provider:%d, session token:%dB, session key:%dB", buf, 0x14u);
  }

  uint64_t v45 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v31;
    _os_log_impl(&dword_19190B000, v45, OS_LOG_TYPE_DEFAULT, "Got hbhEncryptionkey:%@ and hbhDecryptionkey:%@", buf, 0x16u);
  }

  if (IMGetDomainBoolForKey())
  {
    id v46 = v8;
    id v47 = (void *)v31;
    v116 = v16;
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", 2 * objc_msgSend(v29, "length"));
    id v48 = v29;
    uint64_t v49 = [v48 bytes];
    if ([v48 length])
    {
      unint64_t v50 = 0;
      do
        objc_msgSend(v25, "appendFormat:", @"%02x", *(unsigned __int8 *)(v49 + v50++));
      while (v50 < [v48 length]);
    }
    id v51 = v48;
    uint64_t v52 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_19190B000, v52, OS_LOG_TYPE_DEFAULT, "Full hbhEncryptionkey: %@", buf, 0xCu);
    }

    int64_t v53 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", 2 * objc_msgSend(v47, "length"));
    id v54 = v47;
    uint64_t v55 = [v54 bytes];
    if ([v54 length])
    {
      unint64_t v56 = 0;
      do
        [v53 appendFormat:@"%02x", *(unsigned __int8 *)(v55 + v56++)];
      while (v56 < [v54 length]);
    }
    dispatch_semaphore_t v57 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v53;
      _os_log_impl(&dword_19190B000, v57, OS_LOG_TYPE_DEFAULT, "Full hbhDecryptionkey: %@", buf, 0xCu);
    }

    double v16 = v116;
    __int16 v29 = v51;
    uint64_t v31 = (uint64_t)v54;
    id v8 = v46;
    goto LABEL_74;
  }
LABEL_75:
  uint64_t v62 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    id v63 = v8;
    uint64_t v64 = v31;
    dispatch_time_t v65 = v29;
    int v66 = v161;
    int v67 = v16;
    int v68 = BYTE1(v161);
    v117 = v67;
    uint64_t v112 = v63;
    int v102 = WORD3(v162);
    int v103 = BYTE2(v161);
    int v104 = BYTE3(v161);
    int v105 = WORD4(v161);
    int v109 = BYTE6(v161);
    int v110 = WORD5(v161);
    long long v69 = @"YES";
    int v70 = HIDWORD(v161);
    int v106 = v162;
    int v107 = BYTE5(v161);
    if (!BYTE12(v162)) {
      long long v69 = @"NO";
    }
    int v108 = v69;
    int v111 = WORD2(v162);
    long long v71 = [(IDSDatagramChannel *)self _linkContextsCopy];
    *(_DWORD *)buf = 138416898;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v66;
    __int16 v29 = v65;
    uint64_t v31 = v64;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v68;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v102;
    double v16 = v117;
    *(_WORD *)&buf[30] = 1024;
    *(_DWORD *)v132 = v103;
    id v8 = v112;
    *(_WORD *)&v132[4] = 1024;
    *(_DWORD *)&v132[6] = v104;
    __int16 v133 = 1024;
    int v134 = v105;
    __int16 v135 = 1024;
    int v136 = v70;
    __int16 v137 = 1024;
    int v138 = v107;
    __int16 v139 = 1024;
    int v140 = v109;
    __int16 v141 = 1024;
    int v142 = v110;
    __int16 v143 = 1024;
    int v144 = v106;
    __int16 v145 = 2112;
    v146 = v108;
    __int16 v147 = 2112;
    v148 = v112;
    __int16 v149 = 1024;
    int v150 = v111;
    __int16 v151 = 2112;
    v152 = v123;
    __int16 v153 = 2112;
    v154 = v117;
    __int16 v155 = 2112;
    v156 = v124;
    __int16 v157 = 2112;
    v158 = v71;
    _os_log_impl(&dword_19190B000, v62, OS_LOG_TYPE_DEFAULT, "<%@> got connectedLinkID %d (link family:%u) (mtu:%u) (l-conn:%u) (l-RAT:%u) (l-flags:0x%x) (l-dataSoMask: %u) (r-conn:%u) (r-RAT:%u) (r-flags:0x%x) (r-datasoMask:%u) isVirtualRelayLink: %@, childConnectionID: %@, channelNumber: %04X, relayProtocolStack: %@, connections: %@, qrExperiments: %@, (Current LinkContexts %@", buf, 0x90u);
  }
  double v72 = [IDSDataChannelLinkContext alloc];
  LOWORD(v101) = HIWORD(v164);
  long long v73 = (void *)v31;
  uint64_t v74 = v118;
  v119 = v29;
  uint64_t v75 = [(IDSDataChannelLinkContext *)v72 initWithAttributes:&v159 maxBitrate:0xFFFFFFFFLL relayServerProvider:v74 relaySessionToken:v122 relaySessionKey:v121 hbhEncryptionkey:v29 hbhDecryptionkey:v31 relayProtocolStackDescription:v123 qrExperiments:v124 estimatedPerPacketConstantOverhead:v101];
  if (v16) {
    [(IDSDatagramChannel *)self _addConnections:v16 toLinkContext:v75];
  }
  int64_t v76 = v16;
  [(IDSDatagramChannel *)self _setLinkContext:v75 forLinkID:v161];
  if ([(IDSDataChannelLinkContext *)v75 RATType] && [(IDSDataChannelLinkContext *)v75 RATType] != 9) {
    objc_storeStrong((id *)&self->_internal->_cellularLink, v75);
  }
  unsigned int v77 = BYTE2(v161) - 5;
  long long v78 = [(IDSDataChannelLinkContext *)v75 connections];
  long long v79 = [v78 udp];

  long long v80 = [(IDSDataChannelLinkContext *)v75 connections];
  dispatch_queue_t v81 = [v80 qpod];

  if (v77 > 0xFFFFFFFD || self->_internal->_preferredDataPathType != 1) {
    goto LABEL_101;
  }
  v113 = v8;
  if (v81)
  {
    long long v82 = [v81 childConnectionID];
    memset(buf, 170, 16);
    [v82 getUUIDBytes:buf];
    BOOL v83 = uuid_is_null(buf) != 0;

    if (!v79) {
      goto LABEL_94;
    }
  }
  else
  {
    BOOL v83 = 0;
    if (!v79)
    {
LABEL_94:
      if ([(IDSDataChannelLinkContext *)v75 isVirtualRelayLink])
      {
        [(IDSDatagramChannel *)self reportEvent:*MEMORY[0x1E4F6AF40] forLinkID:[(IDSDataChannelLinkContext *)v75 linkID]];
        [(IDSDatagramChannel *)self addDirectConnectionForLinkID:[(IDSDataChannelLinkContext *)v75 linkID] linkContext:v75];
      }
      unsigned __int8 v86 = (void *)_IDSLinkPacketBufferCreate();
      *(void *)v132 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v87 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v87 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v87;
      *(_OWORD *)&uint8_t buf[16] = v87;
      IDSByteBufferInitForWriteWithAllocatedSpace();
      unsigned __int8 v126 = [(IDSDataChannelLinkContext *)v75 linkID];
      IDSByteBufferWriteField();
      v86[2] = *(void *)&buf[16] - *v86;
      IDSByteBufferRelease();
      int64_t v88 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v129 = 67109120;
        int v130 = v126;
        _os_log_impl(&dword_19190B000, v88, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID: request child connectionID for linkID %d", v129, 8u);
      }

      [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v86];
      os_unfair_lock_lock(&self->_internal->_writeLock);
      sendingMetadata = self->_internal->_sendingMetadata;
      unsigned __int16 v90 = [MEMORY[0x1E4F29238] valueWithPointer:v86];
      [(NSMutableArray *)sendingMetadata addObject:v90];

      [(IDSDatagramChannel *)self sendMetadata];
      os_unfair_lock_unlock(&self->_internal->_writeLock);
      goto LABEL_100;
    }
  }
  nw_connection_t v84 = [v79 childConnectionID];
  memset(buf, 170, 16);
  [v84 getUUIDBytes:buf];
  if (uuid_is_null(buf)) {
    int v85 = 1;
  }
  else {
    int v85 = v83;
  }

  if (v85 == 1) {
    goto LABEL_94;
  }
  [(IDSDatagramChannel *)self reportEvent:*MEMORY[0x1E4F6AF40] forLinkID:[(IDSDataChannelLinkContext *)v75 linkID]];
  [(IDSDatagramChannel *)self addDirectConnectionForLinkID:[(IDSDataChannelLinkContext *)v75 linkID] linkContext:v75];
LABEL_100:
  id v8 = v113;
LABEL_101:
  if (!self->_internal->_waitForPreConnectionDataForConnected)
  {
    v91 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      [(IDSDatagramChannel *)self _linkContextsCopy];
      v93 = double v92 = v8;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v93;
      _os_log_impl(&dword_19190B000, v91, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventConnected, current link contexts %@", buf, 0x16u);

      id v8 = v92;
    }

    id eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
    if (eventHandler)
    {
      v127[0] = @"event-type";
      v127[1] = @"connected-link";
      v128[0] = &unk_1EE28B400;
      v95 = [(IDSDatagramChannel *)self connectedLinks];
      v128[1] = v95;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:2];
      v97 = v96 = v8;
      eventHandler[2](eventHandler, v97);

      id v8 = v96;
    }
  }

LABEL_107:
}

- (void)selectDefaultLink:(char)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_internal->_defaultLinkID = a3;
  long long v5 = [(IDSDatagramChannel *)self _linkContextWithID:a3];
  uint64_t v6 = v5;
  if (!v5)
  {
    id v8 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v3;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "can't find link %d for the default", buf, 8u);
    }
    goto LABEL_6;
  }
  id eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
  if (eventHandler)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithChar:", objc_msgSend(v5, "linkID", @"event-type", @"default-link", @"default-link-id", &unk_1EE28B418, v5));
    _DWORD v11[2] = v8;
    long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:3];
    eventHandler[2](eventHandler, v9);

LABEL_6:
  }
}

- (void)sendMediaEncryptionInfoWithMKM:(id)a3 MKS:(id)a4 MKI:(id)a5 participantID:(unint64_t)a6 isLocallyGenerated:(BOOL)a7 shortKILength:(unsigned __int8)a8 encryptionSequenceNumber:(unint64_t)a9
{
  uint64_t v9 = a8;
  uint64_t v10 = a7;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  unsigned int v18 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v34 = a6;
    unsigned int v35 = self;
    id v19 = v15;
    unsigned int v33 = v10;
    if (v10) {
      uint64_t v20 = @"YES";
    }
    else {
      uint64_t v20 = @"NO";
    }
    uint64_t v21 = v9;
    if (a9 == -1)
    {
      id v22 = @"none";
    }
    else
    {
      id v22 = [NSNumber numberWithUnsignedLongLong:a9];
    }
    uint64_t v23 = [NSNumber numberWithUnsignedLongLong:v34];
    int v24 = [NSNumber numberWithUnsignedChar:v21];
    *(_DWORD *)buf = 138414083;
    *(void *)&uint8_t buf[4] = v35;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v19;
    __int16 v41 = 2113;
    id v42 = v16;
    __int16 v43 = 2113;
    id v44 = v17;
    __int16 v45 = 2113;
    id v46 = v20;
    __int16 v47 = 2113;
    id v48 = v22;
    __int16 v49 = 2113;
    unint64_t v50 = v23;
    __int16 v51 = 2113;
    uint64_t v52 = v24;
    _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "<%@> sendMediaEncryptionEventInfo MKM:%{private}@, MKS:%{private}@, MKI:%{private}@ locally generated:%{private}@ encryptionSequenceNumber:%{private}@, participantID:%{private}@, shortKILength:%{private}@", buf, 0x52u);

    if (a9 != -1) {
    id v15 = v19;
    }
    self = v35;
    uint64_t v9 = v21;
    uint64_t v10 = v33;
    a6 = v34;
  }

  memset(buf, 170, 16);
  [v17 getUUIDBytes:buf];
  [(IDSDatagramChannel *)self reportMKIArrival:v17 isLocallyGenerated:v10];
  if (self->_internal->_eventHandler)
  {
    uint64_t v25 = *MEMORY[0x1E4F6B240];
    if (a9 == -1)
    {
      v38[0] = @"event-type";
      v38[1] = v25;
      v39[0] = &unk_1EE28B430;
      v39[1] = v15;
      uint64_t v32 = *MEMORY[0x1E4F6B238];
      v38[2] = *MEMORY[0x1E4F6B248];
      v38[3] = v32;
      v39[2] = v16;
      v39[3] = v17;
      v38[4] = *MEMORY[0x1E4F6B258];
      uint64_t v27 = [NSNumber numberWithUnsignedLongLong:a6];
      v39[4] = v27;
      v38[5] = *MEMORY[0x1E4F6B230];
      int v28 = [NSNumber numberWithBool:v10];
      v39[5] = v28;
      v38[6] = *MEMORY[0x1E4F6B260];
      __int16 v29 = [NSNumber numberWithUnsignedChar:v9];
      v39[6] = v29;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:7];
    }
    else
    {
      v36[0] = @"event-type";
      v36[1] = v25;
      v37[0] = &unk_1EE28B430;
      v37[1] = v15;
      uint64_t v26 = *MEMORY[0x1E4F6B238];
      v36[2] = *MEMORY[0x1E4F6B248];
      v36[3] = v26;
      v37[2] = v16;
      v37[3] = v17;
      v36[4] = *MEMORY[0x1E4F6B258];
      uint64_t v27 = [NSNumber numberWithUnsignedLongLong:a6];
      v37[4] = v27;
      v36[5] = *MEMORY[0x1E4F6B230];
      int v28 = [NSNumber numberWithBool:v10];
      v37[5] = v28;
      v36[6] = *MEMORY[0x1E4F6B250];
      __int16 v29 = [NSNumber numberWithUnsignedLongLong:a9];
      v37[6] = v29;
      v36[7] = *MEMORY[0x1E4F6B260];
      int v30 = [NSNumber numberWithUnsignedChar:v9];
      v37[7] = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:8];
    }
    (*((void (**)(void))self->_internal->_eventHandler + 2))();
  }
}

- (void)sendMediaMembershipChangedInfo:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v5 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 1024;
    int v14 = v3;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "<%@> sendMediaMembershipChangedInfo membershipChanged:%u", buf, 0x12u);
  }

  id eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
  if (eventHandler)
  {
    int v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", v3, @"event-type", @"membership-changed-reason-key", &unk_1EE28B448);
    v10[1] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:2];
    eventHandler[2](eventHandler, v8);
  }
}

- (void)processMetadataForDatagram:(const char *)a3 size:(unint64_t)a4 datagramInfo:(id *)a5 options:(id *)a6
{
  v370[2] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v331 = -86;
  v330 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unsigned __int16 v329 = -21846;
  unint64_t v328 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v326 = v7;
  long long v327 = v7;
  if (a4 > 2)
  {
    uint64_t v12 = __rev16(*(unsigned __int16 *)a3);
    if (v12 + 2 <= a4)
    {
      *(_WORD *)&a5->uint64_t var4 = 0;
      *(void *)&a5->unsigned int var0 = 0;
      *(void *)&a6->var14 = 0;
      *(_OWORD *)&a6->var11 = 0u;
      *(_OWORD *)a6->var13 = 0u;
      *(_OWORD *)&a6->var8.unsigned int var0 = 0u;
      *(_OWORD *)&a6->double var9 = 0u;
      *(_OWORD *)&a6->int64_t var2 = 0u;
      *(_OWORD *)&a6->var5[6] = 0u;
      *(_OWORD *)&a6->unsigned int var0 = 0u;
      IDSByteBufferInitForRead();
      if (IDSByteBufferReadField())
      {
        uint64_t v307 = 0;
        uint64_t v308 = 0;
        uint64_t v310 = 0;
        unint64_t v311 = 0;
        uint64_t v302 = 0;
        LOWORD(v303) = 0;
        char v305 = 0;
        uint64_t v306 = 0;
        unsigned int v298 = 0;
        uint64_t v299 = 0;
        v304 = 0;
        v315 = 0;
        v316 = 0;
        v313 = 0;
        v314 = 0;
        uint64_t v301 = 0;
        uint64_t v309 = 0;
        int v312 = 0;
        uint64_t v297 = *MEMORY[0x1E4F28588];
        uint64_t v296 = *MEMORY[0x1E4F6ACF0];
        key = (void *)*MEMORY[0x1E4F6AD88];
        v294 = (void *)*MEMORY[0x1E4F6AD30];
        v293 = (void *)*MEMORY[0x1E4F6AD38];
        v292 = (void *)*MEMORY[0x1E4F6AD40];
        v291 = (void *)*MEMORY[0x1E4F6AD58];
        unint64_t v300 = -1;
        while (1)
        {
          switch(v331)
          {
            case 1u:
              if (v329 != 1)
              {
                unsigned int v18 = +[IDSLogging IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = v329;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v331;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PacketLinkID should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
                }
                goto LABEL_488;
              }
              int v14 = (char)*v330;
              LOBYTE(v310) = *v330;
              if (self->_internal->_verboseFunctionalLogging)
              {
                uint64_t v15 = +[IDSLogging IDSDataChannels];
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v14;
                  _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "got PacketLinkID %d", buf, 8u);
                }
              }
              LOBYTE(v307) = 1;
              goto LABEL_550;
            case 2u:
              [(IDSDatagramChannel *)self addNewIDSDataChannelLinkWithAttributes:v330 linkAttributesLength:v329];
              goto LABEL_550;
            case 3u:
              if (v329 != 18)
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v360 = 18;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  *(_WORD *)&v360[10] = 1024;
                  *(_DWORD *)&v360[12] = v331;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkDisconnected should be %d byte, not %u bytes, field: %u", buf, 0x14u);
                }
                goto LABEL_488;
              }
              int v111 = v330;
              uint64_t v112 = (char)*v330++;
              uint64_t v113 = *v330;
              v330 = v111 + 2;
              id v114 = objc_alloc(MEMORY[0x1E4F29128]);
              uint64_t v115 = (void *)[v114 initWithUUIDBytes:v330];
              v116 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
              {
                v117 = [v115 UUIDString];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v360 = v112;
                *(_WORD *)&v360[4] = 2112;
                *(void *)&v360[6] = v117;
                *(_WORD *)&v360[14] = 1024;
                *(_DWORD *)&v360[16] = v113;
                _os_log_impl(&dword_19190B000, v116, OS_LOG_TYPE_DEFAULT, "got disconnectedLinkID %d, linkUUID %@, reason: %d", buf, 0x18u);
              }
              [(IDSDatagramChannel *)self removeIDSDataChannelLinkContext:v112 linkUUID:v115 reason:v113];

              goto LABEL_550;
            case 4u:
              if (v329 != 1)
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = v329;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v331;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DefaultLinkID should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
                }
                goto LABEL_488;
              }
              uint64_t v118 = (char)*v330;
              v119 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v118;
                _os_log_impl(&dword_19190B000, v119, OS_LOG_TYPE_DEFAULT, "got defaultLinkID %d", buf, 8u);
              }

              [(IDSDatagramChannel *)self selectDefaultLink:v118];
              goto LABEL_550;
            case 5u:
              if (v329 != 1)
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = v329;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v331;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RATChanged should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
                }
                goto LABEL_488;
              }
              uint64_t v140 = *v330;
              __int16 v141 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v140;
                _os_log_impl(&dword_19190B000, v141, OS_LOG_TYPE_DEFAULT, "got ratType %u", buf, 8u);
              }

              cellularLink = self->_internal->_cellularLink;
              if (cellularLink)
              {
                [(IDSDataChannelLinkContext *)cellularLink setRATType:v140];
              }
              else
              {
                v248 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19190B000, v248, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RATChanged requires the cellular link. something is wrong...", buf, 2u);
                }
              }
              id eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
              if (eventHandler)
              {
                v369[0] = @"event-type";
                v369[1] = @"rat-changed";
                v370[0] = &unk_1EE28B460;
                v250 = [NSNumber numberWithUnsignedChar:v140];
                v370[1] = v250;
                v251 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v370 forKeys:v369 count:2];
                eventHandler[2](eventHandler, v251);
              }
              goto LABEL_550;
            case 6u:
            case 7u:
            case 8u:
            case 9u:
            case 0xCu:
            case 0x12u:
            case 0x13u:
            case 0x15u:
            case 0x19u:
            case 0x1Au:
            case 0x1Bu:
            case 0x1Cu:
            case 0x1Du:
            case 0x29u:
            case 0x2Au:
            case 0x2Cu:
            case 0x35u:
            case 0x38u:
            case 0x39u:
            case 0x3Au:
            case 0x3Bu:
            case 0x40u:
            case 0x41u:
            case 0x42u:
            case 0x44u:
            case 0x4Du:
            case 0x4Eu:
            case 0x4Fu:
            case 0x50u:
            case 0x51u:
              goto LABEL_22;
            case 0xAu:
              if (v329 == 1)
              {
                unsigned int v298 = *v330;
                v97 = +[IDSLogging IDSDataChannels];
                if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v298;
                  _os_log_impl(&dword_19190B000, v97, OS_LOG_TYPE_DEFAULT, "got preConnectionDataSize %u", buf, 8u);
                }
                goto LABEL_173;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataSizeKey should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0xBu:
              if (v299)
              {
                if (v329 >= v298)
                {
                  uint64_t v219 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v298];

                  internal = self->_internal;
                  v221 = (void (**)(id, void *))internal->_eventHandler;
                  if (v221)
                  {
                    v367[0] = @"event-type";
                    v367[1] = @"preconnection-data-key";
                    v368[0] = &unk_1EE28B478;
                    v368[1] = v219;
                    v222 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v368 forKeys:v367 count:2];
                    v221[2](v221, v222);

                    internal = self->_internal;
                  }
                  internal->_receivedPreConnectionData = 1;
                  self->_internal->_waitForPreConnectionDataForConnected = 0;
                  v223 = +[IDSLogging IDSDataChannels];
                  if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19190B000, v223, OS_LOG_TYPE_DEFAULT, "got preConnectionData, called IDSDataChannelEventPreConnectionData event", buf, 2u);
                  }

                  v224 = [(IDSDatagramChannel *)self connectedLinks];
                  BOOL v225 = [v224 count] == 0;

                  if (!v225)
                  {
                    v226 = +[IDSTransportLog IDSDataChannels];
                    if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
                    {
                      v227 = [(IDSDatagramChannel *)self _linkContextsCopy];
                      *(_DWORD *)buf = 138412546;
                      *(void *)v360 = self;
                      *(_WORD *)&v360[8] = 2112;
                      *(void *)&v360[10] = v227;
                      _os_log_impl(&dword_19190B000, v226, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventConnected, current link contexts %@", buf, 0x16u);
                    }
                    v228 = (void (**)(id, void *))self->_internal->_eventHandler;
                    if (v228)
                    {
                      v365[0] = @"event-type";
                      v365[1] = @"connected-link";
                      v366[0] = &unk_1EE28B400;
                      v229 = [(IDSDatagramChannel *)self connectedLinks];
                      v366[1] = v229;
                      v230 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v366 forKeys:v365 count:2];
                      v228[2](v228, v230);
                    }
                  }
                  LOBYTE(v299) = 1;
                  v304 = v219;
                }
                else
                {
                  v97 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v360 = v298;
                    *(_WORD *)&v360[4] = 1024;
                    *(_DWORD *)&v360[6] = v329;
                    _os_log_impl(&dword_19190B000, v97, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataKey got wrong size (%u > %u)", buf, 0xEu);
                  }
LABEL_173:

                  LOBYTE(v299) = 1;
                }
              }
              else
              {
                v216 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19190B000, v216, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataKey should know its size", buf, 2u);
                }

                LOBYTE(v299) = 0;
              }
              goto LABEL_550;
            case 0xDu:
              if (v329 == 12)
              {
                __int16 v143 = v330;
                unsigned int v144 = *(_DWORD *)v330;
                v330 += 4;
                unsigned int v145 = *(_DWORD *)v330;
                unsigned int v146 = *((_DWORD *)v143 + 2);
                v330 = v143 + 12;
                __int16 v147 = [(IDSDatagramChannel *)self connectedLinks];
                BOOL v148 = [v147 count] == 0;

                if (!v148)
                {
                  __int16 v149 = +[IDSTransportLog IDSDataChannels];
                  uint64_t v150 = bswap32(v144);
                  uint64_t v151 = bswap32(v145);
                  uint64_t v152 = bswap32(v146);
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138413058;
                    *(void *)v360 = self;
                    *(_WORD *)&v360[8] = 1024;
                    *(_DWORD *)&v360[10] = v150;
                    *(_WORD *)&v360[14] = 1024;
                    *(_DWORD *)&v360[16] = v151;
                    *(_WORD *)&v360[20] = 1024;
                    *(_DWORD *)&v360[22] = v152;
                    _os_log_impl(&dword_19190B000, v149, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventRSSI (%u, %u, %u)", buf, 0x1Eu);
                  }

                  __int16 v153 = (void (**)(id, void *))self->_internal->_eventHandler;
                  if (v153)
                  {
                    v363[0] = @"event-type";
                    v363[1] = @"rssi-key";
                    v364[0] = &unk_1EE28B490;
                    v154 = [NSNumber numberWithUnsignedInt:v150];
                    v362[0] = v154;
                    __int16 v155 = [NSNumber numberWithUnsignedInt:v151];
                    v362[1] = v155;
                    v156 = [NSNumber numberWithUnsignedInt:v152];
                    v362[2] = v156;
                    __int16 v157 = [MEMORY[0x1E4F1C978] arrayWithObjects:v362 count:3];
                    v364[1] = v157;
                    v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v364 forKeys:v363 count:2];
                    v153[2](v153, v158);
                  }
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 12;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_QueryRSSI should be %u, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0xEu:
              if (v329 == 2)
              {
                LODWORD(v302) = __rev16(*(unsigned __int16 *)v330);
                v330 += 2;
                if (self->_internal->_verboseFunctionalLogging)
                {
                  int v85 = +[IDSLogging IDSDataChannels];
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v302;
                    _os_log_impl(&dword_19190B000, v85, OS_LOG_TYPE_DEFAULT, "got trafficClass %u", buf, 8u);
                  }
                }
                BYTE4(v307) = 1;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_TrafficClassKey should be %d bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0xFu:
              if (v329 == 4)
              {
                int v98 = *v330;
                int v99 = v330[1];
                int v100 = v330[2];
                unsigned int v101 = v330[3];
                v330 += 4;
                int v102 = [(IDSDatagramChannel *)self _linkContextWithID:v310];
                int v103 = v102;
                if (v102)
                {
                  [v102 setMaxBitrate:(v98 << 24) | (v99 << 16) | (v100 << 8) | v101];
                  int v104 = [(IDSDatagramChannel *)self connectedLinks];
                  BOOL v105 = [v104 count] == 0;

                  if (!v105)
                  {
                    int v106 = +[IDSTransportLog IDSDataChannels];
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      int v107 = [(IDSDatagramChannel *)self _linkContextsCopy];
                      *(_DWORD *)buf = 138412546;
                      *(void *)v360 = self;
                      *(_WORD *)&v360[8] = 2112;
                      *(void *)&v360[10] = v107;
                      _os_log_impl(&dword_19190B000, v106, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventConnected, current link contexts %@", buf, 0x16u);
                    }
                    int v108 = (void (**)(id, void *))self->_internal->_eventHandler;
                    if (v108)
                    {
                      v356[0] = &unk_1EE28B400;
                      v355[0] = @"event-type";
                      v355[1] = @"connected-link";
                      int v109 = [(IDSDatagramChannel *)self connectedLinks];
                      v356[1] = v109;
                      int v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v356 forKeys:v355 count:2];
                      v108[2](v108, v110);

                      goto LABEL_457;
                    }
                  }
                }
                else
                {
                  int v109 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                  {
                    v243 = [(IDSDatagramChannel *)self _linkContextsCopy];
                    *(_DWORD *)buf = 138412802;
                    *(void *)v360 = self;
                    *(_WORD *)&v360[8] = 1024;
                    *(_DWORD *)&v360[10] = (char)v310;
                    *(_WORD *)&v360[14] = 2112;
                    *(void *)&v360[16] = v243;
                    _os_log_impl(&dword_19190B000, v109, OS_LOG_TYPE_DEFAULT, "<%@> Can't find the linkContext of linkID %u, linkContexts %@", buf, 0x1Cu);
                  }
LABEL_457:
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 4;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_MaxBitrateKey should be %u, not %u bytes, field: %u", buf, 0x14u);
              }
LABEL_488:

              goto LABEL_550;
            case 0x10u:
              if (v329 == 2)
              {
                unsigned int v86 = *(unsigned __int16 *)v330;
                v330 += 2;
                long long v87 = +[IDSLogging IDSDataChannels];
                uint64_t v88 = __rev16(v86);
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v88;
                  _os_log_impl(&dword_19190B000, v87, OS_LOG_TYPE_DEFAULT, "got MTU %u", buf, 8u);
                }

                int v89 = self->_internal->_cellularLink;
                if (v89)
                {
                  [(IDSDataChannelLinkContext *)v89 setMTU:v88];
                }
                else
                {
                  v244 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19190B000, v244, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CellularMTUChanged requires the cellular link. something is wrong...", buf, 2u);
                  }
                }
                v245 = (void (**)(id, void *))self->_internal->_eventHandler;
                if (v245)
                {
                  v354[0] = &unk_1EE28B4C0;
                  v353[0] = @"event-type";
                  v353[1] = @"mtu-changed";
                  v246 = [NSNumber numberWithUnsignedShort:v88];
                  v354[1] = v246;
                  v247 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v354 forKeys:v353 count:2];
                  v245[2](v245, v247);
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CellularMTUChanged should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x11u:
              if (v329 >= 8u)
              {
                v120 = [MEMORY[0x1E4F1CA60] dictionary];
                if (v329 >= 8u)
                {
                  LOWORD(v121) = 0;
                  do
                  {
                    v122 = v330;
                    unsigned int v123 = *(_DWORD *)v330;
                    v330 += 4;
                    uint64_t v124 = bswap32(*(_DWORD *)v330);
                    v330 = v122 + 8;
                    v125 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v124, v283);
                    unsigned __int8 v126 = [NSNumber numberWithUnsignedInt:bswap32(v123)];
                    [v120 setObject:v125 forKey:v126];

                    int v121 = (unsigned __int16)(v121 + 8);
                  }
                  while (v121 <= v329 - 8);
                }
                if (self->_internal->_eventHandler)
                {
                  v127 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v360 = v120;
                    _os_log_impl(&dword_19190B000, v127, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_InfoReportKey report %@", buf, 0xCu);
                  }

                  v128 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v351[0] = @"event-type";
                  v351[1] = @"info-report-events-key";
                  v352[0] = &unk_1EE28B4D8;
                  v352[1] = v120;
                  v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v352 forKeys:v351 count:2];
                  v128[2](v128, v129);
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_InfoReportKey should be bigger than %u bytes.", buf, 8u);
              }
              goto LABEL_488;
            case 0x14u:
              if (v329 == 1)
              {
                HIDWORD(v302) = *v330++;
                if (self->_internal->_verboseFunctionalLogging)
                {
                  v176 = +[IDSLogging IDSDataChannels];
                  if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = HIDWORD(v302);
                    _os_log_impl(&dword_19190B000, v176, OS_LOG_TYPE_DEFAULT, "got DSCP %u", buf, 8u);
                  }
                }
                LOBYTE(v308) = 1;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 1;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DSCPKey should be %d bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x16u:
              if (v329 == 8)
              {
                a6->double var9 = *(double *)v330;
                if (!self->_internal->_verboseFunctionalLogging) {
                  goto LABEL_550;
                }
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  double var9 = a6->var9;
                  *(_DWORD *)buf = 134217984;
                  *(double *)v360 = var9;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "got arrivalTime %f", buf, 0xCu);
                }
              }
              else
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v360 = 8;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  *(_WORD *)&v360[10] = 1024;
                  *(_DWORD *)&v360[12] = v331;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PacketArrivalTime should be %d bytes, not %u bytes, field: %u", buf, 0x14u);
                }
              }
              goto LABEL_488;
            case 0x17u:
              if (v329 == 1)
              {
                HIDWORD(v310) = *v330;
                if (!self->_internal->_verboseFunctionalLogging) {
                  goto LABEL_550;
                }
                unsigned int v18 = +[IDSLogging IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = HIDWORD(v310);
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "got Channel Priority %u", buf, 8u);
                }
              }
              else
              {
                unsigned int v18 = +[IDSLogging IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = v329;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v331;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PriorityKey should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
                }
              }
              goto LABEL_488;
            case 0x18u:
              if (v329 == 8)
              {
                unint64_t v311 = bswap64(*(void *)v330);
                v330 += 8;
                if (self->_internal->_verboseFunctionalLogging)
                {
                  int v130 = +[IDSLogging IDSDataChannels];
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)v360 = v311;
                    _os_log_impl(&dword_19190B000, v130, OS_LOG_TYPE_DEFAULT, "got Participant ID %llu", buf, 0xCu);
                  }
                }
                if (!v311)
                {
                  v131 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)v360 = 0;
                    _os_log_impl(&dword_19190B000, v131, OS_LOG_TYPE_DEFAULT, "error: we received Participant ID %llu", buf, 0xCu);
                  }

                  unint64_t v311 = 0;
                }
                char v305 = 1;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantID should be 8 byte, not %u bytes, field: %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x1Eu:
              uint64_t v177 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v329];

              v178 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v360 = v177;
                *(_WORD *)&v360[8] = 1024;
                *(_DWORD *)&v360[10] = v329;
                _os_log_impl(&dword_19190B000, v178, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionMKMKey got MKM %@ size %u", buf, 0x12u);
              }

              v316 = (void *)v177;
              goto LABEL_550;
            case 0x1Fu:
              uint64_t v171 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v329];

              v172 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v360 = v171;
                *(_WORD *)&v360[8] = 1024;
                *(_DWORD *)&v360[10] = v329;
                _os_log_impl(&dword_19190B000, v172, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionMKSKey got MKS %@ size %u", buf, 0x12u);
              }

              v315 = (void *)v171;
              goto LABEL_550;
            case 0x20u:
              id v179 = objc_alloc(MEMORY[0x1E4F29128]);
              uint64_t v180 = [v179 initWithUUIDBytes:v330];

              v181 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v360 = v180;
                *(_WORD *)&v360[8] = 1024;
                *(_DWORD *)&v360[10] = v329;
                _os_log_impl(&dword_19190B000, v181, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionMKIKey got MKI %@ size %u", buf, 0x12u);
              }

              v314 = (void *)v180;
              goto LABEL_550;
            case 0x21u:
              if (v329 == 1)
              {
                BYTE4(v301) = *v330;
                BYTE4(v309) = 1;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionMembershipChangedKey should be 1 byte, not %u", buf, 8u);
              }
              goto LABEL_488;
            case 0x22u:
              if (v329 == 1)
              {
                if (self->_internal->_eventHandler)
                {
                  id v63 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19190B000, v63, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionReinitiated - IDSDSession is reinitiated", buf, 2u);
                  }

                  uint64_t v64 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v349 = @"event-type";
                  v350 = &unk_1EE28B4F0;
                  dispatch_time_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v350 forKeys:&v349 count:1];
                  v64[2](v64, v65);
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionReinitiated should be 1 byte, not %d", buf, 8u);
              }
              goto LABEL_488;
            case 0x23u:
              if (v329 != 1) {
                goto LABEL_550;
              }
              unsigned int v184 = (char)*v330;
              if (v184 >= 0xD)
              {
                v185 = +[IDSLogging IDSDataChannels];
                if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v184;
                  _os_log_impl(&dword_19190B000, v185, OS_LOG_TYPE_DEFAULT, "got invalid streamIDCount %d", buf, 8u);
                }

                a6->uint64_t var4 = 0;
                goto LABEL_550;
              }
              if (!*v330) {
                goto LABEL_550;
              }
              a6->uint64_t var4 = v184;
              if (!self->_internal->_verboseFunctionalLogging) {
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v184;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "got streamIDCount %d", buf, 8u);
              }
              goto LABEL_488;
            case 0x24u:
              if (a6->var4 < 1) {
                goto LABEL_550;
              }
              uint64_t v77 = 2 * a6->var4;
              if (v329 == v77)
              {
                uint64_t var4 = a6->var4;
                a6->var0 |= 2u;
                long long v79 = v330;
                var5 = a6->var5;
                do
                {
                  unsigned int v81 = *(unsigned __int16 *)v79;
                  v79 += 2;
                  *var5++ = bswap32(v81) >> 16;
                  v330 = v79;
                  --var4;
                }
                while (var4);
                if (self->_internal->_verboseFunctionalLogging)
                {
                  long long v82 = +[IDSLogging IDSDataChannels];
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  {
                    BOOL v83 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v330[-v77] length:v77];
                    *(_DWORD *)buf = 138412290;
                    *(void *)v360 = v83;
                    _os_log_impl(&dword_19190B000, v82, OS_LOG_TYPE_DEFAULT, "got streamID bytes:%@", buf, 0xCu);
                  }
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v77;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StreamIDsKey: size mismatch (%u != %u), ignore.", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x25u:
              if (v329 == 1)
              {
                if (self->_internal->_verboseFunctionalLogging)
                {
                  v182 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19190B000, v182, OS_LOG_TYPE_DEFAULT, "got CT(packet counting) option", buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                    _IDSLogV();
                  }
                }
                BYTE4(v306) = 1;
                goto LABEL_550;
              }
              v217 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_19190B000, v217, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CountPacketKey  should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                goto LABEL_379;
              }
              goto LABEL_550;
            case 0x26u:
              if (v329 == 2)
              {
                uint64_t v303 = __rev16(*(unsigned __int16 *)v330);
                v330 += 2;
                if (self->_internal->_verboseFunctionalLogging)
                {
                  v183 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v303;
                    _os_log_impl(&dword_19190B000, v183, OS_LOG_TYPE_DEFAULT, "got probeGroupID %u", buf, 8u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    uint64_t v283 = v303;
                    _IDSLogV();
                  }
                }
                LOBYTE(v306) = 1;
                goto LABEL_550;
              }
              v218 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_19190B000, v218, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ProbeGroupIDKey should be 2 bytes, not %u bytes, field: %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                goto LABEL_379;
              }
              goto LABEL_550;
            case 0x27u:
              uint64_t v40 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v329];
              if (v40)
              {
                long long v159 = (void *)MEMORY[0x1E4F28DC0];
                long long v160 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v161 = objc_opt_class();
                uint64_t v162 = objc_opt_class();
                uint64_t v163 = objc_opt_class();
                uint64_t v164 = objc_opt_class();
                uint64_t v165 = objc_opt_class();
                uint64_t v166 = objc_msgSend(v160, "setWithObjects:", v161, v162, v163, v164, v165, objc_opt_class(), 0);
                id v325 = 0;
                v167 = [v159 _strictlyUnarchivedObjectOfClasses:v166 fromData:v40 error:&v325];
                unint64_t v50 = v325;

                if (v167)
                {
                  if (self->_internal->_eventHandler)
                  {
                    v168 = +[IDSTransportLog IDSDataChannels];
                    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v360 = v167;
                      _os_log_impl(&dword_19190B000, v168, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoKey - %@", buf, 0xCu);
                    }

                    v169 = (void (**)(id, NSObject *))self->_internal->_eventHandler;
                    v347[0] = @"event-type";
                    v347[1] = @"session-info-response-key";
                    v348[0] = &unk_1EE28B508;
                    v348[1] = v167;
                    v170 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v348 forKeys:v347 count:2];
                    v169[2](v169, v170);
                    goto LABEL_541;
                  }
                }
                else
                {
                  v170 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)v360 = v40;
                    *(_WORD *)&v360[8] = 2112;
                    *(void *)&v360[10] = v50;
                    _os_log_impl(&dword_19190B000, v170, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoKey - Couldn't decode NSData %@ (error: %@)", buf, 0x16u);
                  }
                  v167 = 0;
LABEL_541:
                }
                goto LABEL_549;
              }
              unint64_t v50 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19190B000, v50, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoKey - Couldn't get NSData from fieldBytes", buf, 2u);
              }
              goto LABEL_549;
            case 0x28u:
              int v66 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v329];
              if (v66)
              {
                int v67 = (void *)MEMORY[0x1E4F28DC0];
                int v68 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v69 = objc_opt_class();
                uint64_t v70 = objc_opt_class();
                uint64_t v71 = objc_opt_class();
                double v72 = objc_msgSend(v68, "setWithObjects:", v69, v70, v71, objc_opt_class(), 0);
                long long v73 = [v67 _strictlyUnarchivedObjectOfClasses:v72 fromData:v66 error:0];

                if (v73)
                {
                  if (!self->_internal->_eventHandler) {
                    goto LABEL_532;
                  }
                  uint64_t v74 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v360 = v73;
                    _os_log_impl(&dword_19190B000, v74, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsKey - %@", buf, 0xCu);
                  }

                  uint64_t v75 = (void (**)(id, NSObject *))self->_internal->_eventHandler;
                  v343[0] = @"event-type";
                  v343[1] = @"stat-response-key";
                  v344[0] = &unk_1EE28B520;
                  v344[1] = v73;
                  int64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v344 forKeys:v343 count:2];
                  v75[2](v75, v76);
                }
                else
                {
                  int64_t v76 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v360 = v66;
                    _os_log_impl(&dword_19190B000, v76, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsKey - Couldn't decode NSData %@", buf, 0xCu);
                  }
                  long long v73 = 0;
                }
              }
              else
              {
                long long v73 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19190B000, v73, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsKey - Couldn't get NSData from fieldBytes", buf, 2u);
                }
              }
LABEL_532:

              goto LABEL_550;
            case 0x2Bu:
              if (v329 == 1)
              {
                id v54 = a6;
                a6->var6 = *v330;
                unsigned int v55 = a6->var0 | 0x20;
                goto LABEL_193;
              }
              v215 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_19190B000, v215, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GenerationCounterLSBKey should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
LABEL_379:
                uint64_t v283 = v329;
                uint64_t v284 = v331;
                _IDSLogV();
              }
              goto LABEL_550;
            case 0x2Du:
              if (v329 == 2)
              {
                a6->var7 = bswap32(*(unsigned __int16 *)v330) >> 16;
                BYTE4(v308) = 1;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsID should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x2Eu:
              if (v329 == 2)
              {
                a6->var8.unsigned int var0 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsServerTimeStamp should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x2Fu:
              if (v329 == 2)
              {
                a6->var8.unint64_t var1 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsServerPacketInterval should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x30u:
              if (v329 == 2)
              {
                a6->var8.int64_t var2 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsTotalServerPacketReceived should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x31u:
              if (v329 == 2)
              {
                a6->var8.var3 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsTotalServerPacketSent should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x32u:
              if (v329 == 2)
              {
                a6->var8.uint64_t var4 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsUplinkBandwidth should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x33u:
              if (v329 == 1)
              {
                id v54 = a6;
                unsigned int v55 = a6->var0 | 0x80;
                goto LABEL_193;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_OptOutPriorityFilter should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x34u:
              if (v329 == 1)
              {
                id v54 = a6;
                unsigned int v55 = a6->var0 | 0x100;
                goto LABEL_193;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_TransitionPacketFlag should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x36u:
              if (v329 == 4)
              {
                int v27 = *v330;
                int v28 = v330[1];
                int v29 = v330[2];
                int v30 = v330[3];
                v330 += 4;
                if (self->_internal->_eventHandler)
                {
                  uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"IDS couldn't receive the response for the session info request.", v297, 0);
                  int v32 = (v27 << 24) | (v28 << 16) | (v29 << 8) | v30;
                  unsigned int v33 = v32 - 1;
                  unsigned int v34 = v32 + 8;
                  if (v33 >= 5) {
                    uint64_t v35 = 14;
                  }
                  else {
                    uint64_t v35 = v34;
                  }
                  int v36 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v35;
                    _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoResponseErrorKey errorCode %u", buf, 8u);
                  }

                  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v296 code:v35 userInfo:v31];
                  unsigned int v38 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v345[0] = @"event-type";
                  v345[1] = @"error-key";
                  v346[0] = &unk_1EE28B508;
                  v346[1] = v37;
                  uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v346 forKeys:v345 count:2];
                  v38[2](v38, v39);
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 4;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoResponseErrorKey should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x37u:
              if (v329 == 1)
              {
                BYTE4(v299) = *v330 != 0;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionLocallyGeneratedInfoKey should be 1 byte, not %u", buf, 8u);
              }
              goto LABEL_488;
            case 0x3Cu:
              uint64_t v173 = v329;
              if (v329)
              {
                v174 = v330;
                int v175 = *v330;
                if (*v330)
                {
                  if (v329 > 1u)
                  {
                    if (v329 == 2)
                    {
                      unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey - no valid linkID", buf, 2u);
                      }
                      goto LABEL_488;
                    }
                    uint64_t v252 = (char)v330[2];
                    if (v329 < 7u)
                    {
                      unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid timestamp", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    if (v329 < 9u)
                    {
                      unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid reorderedPackets", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    if (v329 < 0xBu)
                    {
                      unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid probingRequests", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    if (v329 < 0xDu)
                    {
                      unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid probingResponses", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    if (v329 < 0xFu)
                    {
                      unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid offsetAndRTTCount", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    unsigned int v288 = *(unsigned __int16 *)(v330 + 7);
                    unsigned int v289 = *(_DWORD *)(v330 + 3);
                    unsigned int v287 = *(unsigned __int16 *)(v330 + 9);
                    int v285 = v330[1];
                    unsigned int v286 = *(unsigned __int16 *)(v330 + 11);
                    unsigned int v253 = *(unsigned __int16 *)(v330 + 13);
                    id v290 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    if (v253)
                    {
                      int v254 = 0;
                      unint64_t v255 = (unint64_t)&v174[v173];
                      unsigned int v256 = __rev16(v253);
                      unint64_t v257 = (unint64_t)(v174 + 19);
                      while (v257 - 2 <= v255)
                      {
                        if (v257 > v255)
                        {
                          v262 = +[IDSTransportLog IDSDataChannels];
                          if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 67109376;
                            *(_DWORD *)v360 = v252;
                            *(_WORD *)&v360[4] = 1024;
                            *(_DWORD *)&v360[6] = v254;
                            v263 = "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid rtt, i: %d";
LABEL_499:
                            _os_log_impl(&dword_19190B000, v262, OS_LOG_TYPE_DEFAULT, v263, buf, 0xEu);
                          }
                          goto LABEL_500;
                        }
                        unsigned int v258 = *(unsigned __int16 *)(v257 - 2);
                        v259 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v257 - 4)) >> 16];
                        v361[0] = v259;
                        v260 = [NSNumber numberWithUnsignedShort:bswap32(v258) >> 16];
                        v361[1] = v260;
                        v261 = [MEMORY[0x1E4F1C978] arrayWithObjects:v361 count:2];
                        [v290 addObject:v261];

                        ++v254;
                        v257 += 4;
                        if (v256 == v254) {
                          goto LABEL_501;
                        }
                      }
                      v262 = +[IDSTransportLog IDSDataChannels];
                      if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109376;
                        *(_DWORD *)v360 = v252;
                        *(_WORD *)&v360[4] = 1024;
                        *(_DWORD *)&v360[6] = v254;
                        v263 = "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid requestOffset, i: %d";
                        goto LABEL_499;
                      }
LABEL_500:
                    }
LABEL_501:
                    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                    v265 = [NSNumber numberWithUnsignedInt:bswap32(v289)];
                    if (v265)
                    {
                      CFDictionarySetValue(Mutable, key, v265);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v360 = key;
                      *(_WORD *)&v360[8] = 2080;
                      *(void *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_19190B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    v266 = [NSNumber numberWithUnsignedShort:bswap32(v288) >> 16];
                    if (v266)
                    {
                      CFDictionarySetValue(Mutable, v294, v266);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v360 = v294;
                      *(_WORD *)&v360[8] = 2080;
                      *(void *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_19190B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    v267 = [NSNumber numberWithUnsignedShort:bswap32(v287) >> 16];
                    if (v267)
                    {
                      CFDictionarySetValue(Mutable, v293, v267);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v360 = v293;
                      *(_WORD *)&v360[8] = 2080;
                      *(void *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_19190B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    v268 = [NSNumber numberWithUnsignedShort:bswap32(v286) >> 16];
                    if (v268)
                    {
                      CFDictionarySetValue(Mutable, v292, v268);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v360 = v292;
                      *(_WORD *)&v360[8] = 2080;
                      *(void *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_19190B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    id v269 = v290;
                    if (v269)
                    {
                      CFDictionarySetValue(Mutable, v291, v269);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v360 = v291;
                      *(_WORD *)&v360[8] = 2080;
                      *(void *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_19190B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    probingDict = self->_internal->_probingDict;
                    v271 = [NSNumber numberWithChar:v252];
                    [(NSMutableDictionary *)probingDict setObject:Mutable forKey:v271];

                    if (v285 == v175)
                    {
                      v272 = self->_internal;
                      if (v272->_eventHandler)
                      {
                        v273 = (void *)[(NSMutableDictionary *)v272->_probingDict copy];
                        v274 = +[IDSTransportLog IDSDataChannels];
                        if (os_log_type_enabled(v274, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v275 = [v273 count];
                          v276 = [v273 allKeys];
                          *(_DWORD *)buf = 134218498;
                          *(void *)v360 = v275;
                          *(_WORD *)&v360[8] = 2112;
                          *(void *)&v360[10] = v276;
                          *(_WORD *)&v360[18] = 2112;
                          *(void *)&v360[20] = v273;
                          _os_log_impl(&dword_19190B000, v274, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ProbingRequestOffsetKey - total size: %lu, all keys: %@, output: %@", buf, 0x20u);
                        }
                        v277 = (void (**)(id, void *))self->_internal->_eventHandler;
                        v357[0] = @"event-type";
                        v357[1] = @"probing-response-key";
                        v358[0] = &unk_1EE28B4A8;
                        v358[1] = v273;
                        v278 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v358 forKeys:v357 count:2];
                        v277[2](v277, v278);

                        v272 = self->_internal;
                      }
                      [(NSMutableDictionary *)v272->_probingDict removeAllObjects];
                    }

                    goto LABEL_550;
                  }
                  unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey - no valid currentLinkIDCount", buf, 2u);
                  }
                }
                else
                {
                  unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey - invalid totalLinkIDs: 0", buf, 2u);
                  }
                }
              }
              else
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey - invalid fieldBytesSize: 0", buf, 2u);
                }
              }
              goto LABEL_488;
            case 0x3Du:
              if (v329 == 4)
              {
                unsigned int v56 = *(_DWORD *)v330;
                v330 += 4;
                dispatch_semaphore_t v57 = +[IDSTransportLog IDSDataChannels];
                uint64_t v58 = bswap32(v56);
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v58;
                  _os_log_impl(&dword_19190B000, v57, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SoMaskChanged got SoMask: %u", buf, 8u);
                }

                if (self->_internal->_eventHandler)
                {
                  v59 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v58;
                    _os_log_impl(&dword_19190B000, v59, OS_LOG_TYPE_DEFAULT, "send event to client about kClientChannelMetadataType_SoMaskChanged, SoMask: %u", buf, 8u);
                  }

                  int v60 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v338[0] = &unk_1EE28B568;
                  v337[0] = @"event-type";
                  v337[1] = @"somask-changed";
                  int v61 = [NSNumber numberWithUnsignedInt:v58];
                  v338[1] = v61;
                  uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v338 forKeys:v337 count:2];
                  v60[2](v60, v62);
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 4;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SoMaskChanged should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x3Eu:
              if (v329 == 2)
              {
                unsigned int v90 = *(unsigned __int16 *)v330;
                v330 += 2;
                v91 = +[IDSTransportLog IDSDataChannels];
                uint64_t v92 = __rev16(v90);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v92;
                  _os_log_impl(&dword_19190B000, v91, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_nwPathWiFiFlagsChanged got wifiLocalAttributes: %u", buf, 8u);
                }

                if (self->_internal->_eventHandler)
                {
                  id v93 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v92;
                    _os_log_impl(&dword_19190B000, v93, OS_LOG_TYPE_DEFAULT, "send event to client about kClientChannelMetadataType_nwPathWiFiFlagsChanged, wifiLocalAttributes: %u", buf, 8u);
                  }

                  uint64_t v94 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v342[0] = &unk_1EE28B538;
                  v341[0] = @"event-type";
                  v341[1] = @"wifi-local-attributes-changed-key";
                  v95 = [NSNumber numberWithUnsignedShort:v92];
                  v342[1] = v95;
                  v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v342 forKeys:v341 count:2];
                  v94[2](v94, v96);
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_nwPathWiFiFlagsChanged should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x3Fu:
              if (v329 == 2)
              {
                unsigned int v132 = *(unsigned __int16 *)v330;
                v330 += 2;
                __int16 v133 = +[IDSTransportLog IDSDataChannels];
                uint64_t v134 = __rev16(v132);
                if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v134;
                  _os_log_impl(&dword_19190B000, v133, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_nwPathCellularFlagsChanged got cellularLocalAttributes: %u", buf, 8u);
                }

                if (self->_internal->_eventHandler)
                {
                  __int16 v135 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v134;
                    _os_log_impl(&dword_19190B000, v135, OS_LOG_TYPE_DEFAULT, "send event to client about kClientChannelMetadataType_nwPathCellularFlagsChanged, cellularLocalAttributes: %u", buf, 8u);
                  }

                  int v136 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v340[0] = &unk_1EE28B550;
                  v339[0] = @"event-type";
                  v339[1] = @"cellular-local-attributes-changed-key";
                  __int16 v137 = [NSNumber numberWithUnsignedShort:v134];
                  v340[1] = v137;
                  int v138 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v340 forKeys:v339 count:2];
                  v136[2](v136, v138);
                }
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_nwPathCellularFlagsChanged should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x43u:
              if (v329 == 1)
              {
                LOBYTE(v309) = *v330 != 0;
                goto LABEL_550;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 1;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_NeedsHBHEncryption should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x45u:
              if (v329 == 8)
              {
                unint64_t v84 = *(void *)v330;
                v330 += 8;
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                unint64_t v300 = bswap64(v84);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)v360 = v300;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionSequenceNumber got %llu (*Client <- IDSD)", buf, 0xCu);
                }
              }
              else
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v360 = 8;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  *(_WORD *)&v360[10] = 1024;
                  *(_DWORD *)&v360[12] = v331;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionSequenceNumber should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
                }
              }
              goto LABEL_488;
            case 0x46u:
              CFMutableDictionaryRef v201 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              v202 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v329];
              if (v202)
              {
                v203 = (void *)MEMORY[0x1E4F28DC0];
                v204 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v205 = objc_opt_class();
                uint64_t v206 = objc_opt_class();
                uint64_t v207 = objc_opt_class();
                uint64_t v208 = objc_opt_class();
                uint64_t v209 = objc_opt_class();
                v210 = objc_msgSend(v204, "setWithObjects:", v205, v206, v207, v208, v209, objc_opt_class(), 0);
                id v324 = 0;
                v211 = [v203 _strictlyUnarchivedObjectOfClasses:v210 fromData:v202 error:&v324];
                v212 = v324;

                if (v211)
                {
                  v213 = (__CFDictionary *)[v211 mutableCopy];

                  CFDictionarySetValue(v213, @"event-type", &unk_1EE28B580);
                  if (self->_internal->_eventHandler)
                  {
                    v214 = +[IDSTransportLog IDSDataChannels];
                    if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v360 = v213;
                      _os_log_impl(&dword_19190B000, v214, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkSuggestion - %@", buf, 0xCu);
                    }

                    (*((void (**)(void))self->_internal->_eventHandler + 2))();
                  }
                  CFMutableDictionaryRef v201 = v213;
                }
                else
                {
                  v279 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)v360 = v202;
                    *(_WORD *)&v360[8] = 2112;
                    *(void *)&v360[10] = v212;
                    _os_log_impl(&dword_19190B000, v279, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkSuggestion - Couldn't decode NSData %@ (error: %@)", buf, 0x16u);
                  }

                  v211 = 0;
                }
              }
              else
              {
                v212 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19190B000, v212, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkSuggestion - Couldn't get NSData from fieldBytes", buf, 2u);
                }
              }

              goto LABEL_550;
            case 0x47u:
              if (v329 == 1)
              {
                id v54 = a6;
                a6->var14 = *v330 != 0;
                unsigned int v55 = a6->var0 | 0x10000;
                goto LABEL_193;
              }
              unsigned int v18 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 1;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RetransmittedPacket should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x48u:
              if (v329 != 1)
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = 1;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_NonRetransmittablePacket should be %u byte, not %u", buf, 0xEu);
                }
                goto LABEL_488;
              }
              id v54 = a6;
              a6->var15 = *v330 != 0;
              unsigned int v55 = a6->var0 | 0x20000;
LABEL_193:
              v54->unsigned int var0 = v55;
              goto LABEL_550;
            case 0x49u:
              uint64_t v40 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v329];
              if (v40)
              {
                __int16 v41 = (void *)MEMORY[0x1E4F28DC0];
                id v42 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v43 = objc_opt_class();
                uint64_t v44 = objc_opt_class();
                uint64_t v45 = objc_opt_class();
                uint64_t v46 = objc_opt_class();
                uint64_t v47 = objc_opt_class();
                id v48 = objc_msgSend(v42, "setWithObjects:", v43, v44, v45, v46, v47, objc_opt_class(), 0);
                id v323 = 0;
                __int16 v49 = [v41 _strictlyUnarchivedObjectOfClasses:v48 fromData:v40 error:&v323];
                unint64_t v50 = v323;

                if (v49)
                {
                  if (self->_internal->_eventHandler)
                  {
                    __int16 v51 = +[IDSTransportLog IDSDataChannels];
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v360 = v49;
                      _os_log_impl(&dword_19190B000, v51, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EventReportingBlob - %@", buf, 0xCu);
                    }

                    uint64_t v52 = (void (**)(id, NSObject *))self->_internal->_eventHandler;
                    v335[0] = @"event-type";
                    v335[1] = @"reporting-blob-key";
                    v336[0] = &unk_1EE28B598;
                    v336[1] = v49;
                    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v336 forKeys:v335 count:2];
                    v52[2](v52, v53);
                    goto LABEL_547;
                  }
                }
                else
                {
                  uint64_t v53 = +[IDSTransportLog IDSDataChannels];
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)v360 = v40;
                    *(_WORD *)&v360[8] = 2112;
                    *(void *)&v360[10] = v50;
                    _os_log_impl(&dword_19190B000, v53, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EventReportingBlob - Couldn't decode NSData %@ (error: %@)", buf, 0x16u);
                  }
                  __int16 v49 = 0;
LABEL_547:
                }
                goto LABEL_549;
              }
              unint64_t v50 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19190B000, v50, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EventReportingBlob - Couldn't get NSData from fieldBytes", buf, 2u);
              }
LABEL_549:

LABEL_550:
              if ((IDSByteBufferReadField() & 1) == 0) {
                goto LABEL_553;
              }
              break;
            case 0x4Au:
              id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v329];
              if (!v19)
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantMappingReplacment - Couldn't get NSData from fieldBytes", buf, 2u);
                }
                goto LABEL_488;
              }
              os_unfair_lock_lock(&self->_internal->_linkIDToParticipantMapLock);
              if (!self->_internal->_linkIDToParticipantMap)
              {
                CFMutableDictionaryRef v20 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                uint64_t v21 = self->_internal;
                linkIDToParticipantMap = v21->_linkIDToParticipantMap;
                v21->_linkIDToParticipantMap = (NSMutableDictionary *)v20;
              }
              uint64_t v23 = -[IDSDatagramChannel _extractparticipantIDToHashedIDMappingFromData:](self, "_extractparticipantIDToHashedIDMappingFromData:", v19, v283, v284);
              int v24 = +[IDSTransportLog IDSDataChannels];
              BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
              if (v23)
              {
                if (v25)
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v360 = (char)v310;
                  *(_WORD *)&v360[4] = 2112;
                  *(void *)&v360[6] = v23;
                  _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "linkID %d, got kClientChannelMetadataType_ParticipantMappingReplacment: %@", buf, 0x12u);
                }

                uint64_t v26 = self->_internal->_linkIDToParticipantMap;
                int v24 = [NSNumber numberWithChar:(char)v310];
                [(NSMutableDictionary *)v26 setObject:v23 forKeyedSubscript:v24];
              }
              else if (v25)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantMappingReplacment - Couldn't decode NSData.", buf, 2u);
              }

              os_unfair_lock_unlock(&self->_internal->_linkIDToParticipantMapLock);
LABEL_439:
              v188 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v330, v329, v283);
              if (v188)
              {
                os_unfair_lock_lock(&self->_internal->_linkIDToParticipantMapLock);
                if (!self->_internal->_linkIDToParticipantMap)
                {
                  CFMutableDictionaryRef v231 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                  v232 = self->_internal;
                  v233 = v232->_linkIDToParticipantMap;
                  v232->_linkIDToParticipantMap = (NSMutableDictionary *)v231;
                }
                v190 = [(IDSDatagramChannel *)self _extractparticipantIDToHashedIDMappingFromData:v188];
                v234 = +[IDSTransportLog IDSDataChannels];
                BOOL v235 = os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT);
                if (v190)
                {
                  uint64_t v236 = (char)v310;
                  if (v235)
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v360 = (char)v310;
                    *(_WORD *)&v360[4] = 2112;
                    *(void *)&v360[6] = v190;
                    _os_log_impl(&dword_19190B000, v234, OS_LOG_TYPE_DEFAULT, "linkID %d, got kClientChannelMetadataType_ParticipantMappingUpdate: %@", buf, 0x12u);
                  }

                  v237 = self->_internal->_linkIDToParticipantMap;
                  v238 = [NSNumber numberWithChar:v236];
                  v239 = [(NSMutableDictionary *)v237 objectForKeyedSubscript:v238];
                  v234 = [v239 mutableCopy];

                  [v234 addEntriesFromDictionary:v190];
                  id v240 = [v234 copy];
                  v241 = self->_internal->_linkIDToParticipantMap;
                  v242 = [NSNumber numberWithChar:v236];
                  [(NSMutableDictionary *)v241 setObject:v240 forKeyedSubscript:v242];
                }
                else if (v235)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19190B000, v234, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantMappingUpdate - Couldn't decode NSData.", buf, 2u);
                }

                os_unfair_lock_unlock(&self->_internal->_linkIDToParticipantMapLock);
              }
              else
              {
                v190 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19190B000, v190, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantMappingUpdate - Couldn't get NSData from fieldBytes", buf, 2u);
                }
              }
              goto LABEL_261;
            case 0x4Bu:
              goto LABEL_439;
            case 0x4Cu:
              if (v329 < 2u)
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = 18;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ChildConnectionID should be %u bytes, not %u bytes", buf, 0xEu);
                }
                goto LABEL_488;
              }
              v186 = v330 + 1;
              signed __int8 v187 = *v330;
              v188 = [(IDSDatagramChannel *)self _linkContextWithID:*v330];
              v189 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v186 length:v329 - 1];
              v190 = JWDecodeDictionary();

              [(IDSDatagramChannel *)self _addConnections:v190 toLinkContext:v188];
              if (v190)
              {
                v191 = +[IDSTransportLog IDSDataChannels];
                uint64_t v192 = v187;
                if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                {
                  int v193 = [v188 isQUICPod];
                  v194 = @"NO";
                  *(_DWORD *)buf = 138412802;
                  *(void *)v360 = v190;
                  if (v193) {
                    v194 = @"YES";
                  }
                  *(_WORD *)&v360[8] = 1024;
                  *(_DWORD *)&v360[10] = v192;
                  *(_WORD *)&v360[14] = 2112;
                  *(void *)&v360[16] = v194;
                  _os_log_impl(&dword_19190B000, v191, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID: received child connections %@ for linkID %d, isQUICPod %@", buf, 0x1Cu);
                }

                [(IDSDatagramChannel *)self addDirectConnectionForLinkID:v192 linkContext:v188];
                if (([v188 isVirtualRelayLink] & 1) == 0)
                {
                  long long v321 = 0u;
                  long long v322 = 0u;
                  long long v319 = 0u;
                  long long v320 = 0u;
                  v195 = [(IDSDatagramChannel *)self connectedLinks];
                  uint64_t v196 = [v195 countByEnumeratingWithState:&v319 objects:v334 count:16];
                  if (v196)
                  {
                    uint64_t v197 = *(void *)v320;
                    do
                    {
                      for (uint64_t i = 0; i != v196; ++i)
                      {
                        if (*(void *)v320 != v197) {
                          objc_enumerationMutation(v195);
                        }
                        v199 = *(void **)(*((void *)&v319 + 1) + 8 * i);
                        int v200 = objc_msgSend(v199, "delegatedLinkID", v283);
                        if (v200 == [v188 linkID]) {
                          -[IDSDatagramChannel addDirectConnectionForLinkID:linkContext:](self, "addDirectConnectionForLinkID:linkContext:", [v199 linkID], v199);
                        }
                      }
                      uint64_t v196 = [v195 countByEnumeratingWithState:&v319 objects:v334 count:16];
                    }
                    while (v196);
                  }
                }
              }
LABEL_261:

              goto LABEL_550;
            case 0x52u:
              if (v329 == 1)
              {
                LODWORD(v301) = *v330;
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v301;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionShortKILengthKey got shortKILength %u", buf, 8u);
                }
              }
              else
              {
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v329;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionShortKILengthKey should be 1 byte, not %u", buf, 8u);
                }
              }
              goto LABEL_488;
            default:
              if (v331 == 253)
              {
                if (v329 == 1)
                {
                  int v312 = *v330;
                  goto LABEL_550;
                }
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v329;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DebugDataTransferTypeKey should be 1 byte, not %u", buf, 8u);
                }
                goto LABEL_488;
              }
              if (v331 != 254)
              {
LABEL_22:
                unsigned int v18 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v331;
                  _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "Unknown metadata type: %u", buf, 8u);
                }
                goto LABEL_488;
              }
              uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v330 length:v329];

              id v17 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DebugDataTransferKey got data size %u", buf, 8u);
              }

              v313 = (void *)v16;
              goto LABEL_550;
          }
        }
      }
      uint64_t v308 = 0;
      uint64_t v309 = 0;
      v313 = 0;
      v314 = 0;
      int v312 = 0;
      uint64_t v301 = 0;
      uint64_t v302 = 0;
      v315 = 0;
      v316 = 0;
      BYTE4(v299) = 0;
      LOWORD(v303) = 0;
      v304 = 0;
      uint64_t v306 = 0;
      uint64_t v307 = 0;
      uint64_t v310 = 0;
      unint64_t v311 = 0;
      char v305 = 0;
      unint64_t v300 = -1;
LABEL_553:
      IDSByteBufferRelease();
      if (v316 && v315 && self->_internal->_eventHandler) {
        [(IDSDatagramChannel *)self sendMediaEncryptionInfoWithMKM:v316 MKS:v315 MKI:v314 participantID:v311 isLocallyGenerated:BYTE4(v299) & 1 shortKILength:v301 encryptionSequenceNumber:v300];
      }
      if ((v309 & 0x100000000) != 0) {
        [(IDSDatagramChannel *)self sendMediaMembershipChangedInfo:BYTE4(v301)];
      }
      v280 = v313;
      if (v307) {
        a5->unsigned int var0 = v310;
      }
      if ((v307 & 0x100000000) != 0) {
        a5->unint64_t var1 = v302;
      }
      if (v308) {
        a5->int64_t var2 = BYTE4(v302);
      }
      if (v305)
      {
        a6->var0 |= 1u;
        a6->unint64_t var1 = v311;
      }
      if (v306)
      {
        a6->var0 |= 0x10u;
        a6->int64_t var2 = v303;
      }
      if ((v306 & 0x100000000) != 0) {
        a6->var0 |= 4u;
      }
      if (HIDWORD(v310))
      {
        a6->var0 |= 8u;
        a6->var3 = BYTE4(v310);
      }
      if ((v308 & 0x100000000) != 0) {
        a6->var0 |= 0x40u;
      }
      if (v309)
      {
        a6->var11 = 1;
        a6->var0 |= 0x400u;
      }
      if (v312)
      {
        if (v313)
        {
          v281 = (void (**)(id, void *))self->_internal->_eventHandler;
          if (v281)
          {
            if (v312 == 2)
            {
              v332[0] = @"event-type";
              v332[1] = @"debug-data-type-key";
              v333[0] = &unk_1EE28B5B0;
              v333[1] = &unk_1EE28B5C8;
              v332[2] = @"debug-data-key";
              v333[2] = v313;
              v282 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v333 forKeys:v332 count:3];
              v281[2](v281, v282);

              v280 = v313;
            }
          }
        }
      }

      id v8 = v304;
    }
    else
    {
      id v8 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v360 = 2;
        *(_WORD *)&v360[4] = 2048;
        *(void *)&v360[6] = v12;
        *(_WORD *)&v360[14] = 2048;
        *(void *)&v360[16] = a4;
        uint64_t v9 = "processMetadataForDatagram %d + metadataSize(%zd) > datagramSize(%zd) - returning";
        uint64_t v10 = v8;
        uint32_t v11 = 28;
        goto LABEL_7;
      }
    }
  }
  else
  {
    id v8 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v360 = a4;
      uint64_t v9 = "processMetadataForDatagram datagramSize(%zd) <= kIDSClientChannelMetadataLengthSize - returning";
      uint64_t v10 = v8;
      uint32_t v11 = 12;
LABEL_7:
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
}

- (void)_addConnections:(id)a3 toLinkContext:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F6AF70];
    id v8 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F6AF70]];
    uint64_t v9 = *MEMORY[0x1E4F6AF78];
    uint64_t v10 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F6AF78]];
    uint32_t v11 = [(IDSDatagramChannel *)self _connectionInfoForDictionary:v10];
    uint64_t v12 = [(IDSDatagramChannel *)self _connectionInfoForDictionary:v8];
    p_linkContextsLock = &self->_internal->_linkContextsLock;
    os_unfair_lock_lock(p_linkContextsLock);
    if (v12)
    {
      [v12 setIsQUICPod:1];
      [v12 setType:v7];
      int v14 = [v6 connections];
      [v14 setQpod:v12];
    }
    if (v11)
    {
      [v11 setIsQUICPod:0];
      [v11 setType:v9];
      uint64_t v15 = [v6 connections];
      [v15 setUdp:v11];
    }
    os_unfair_lock_unlock(p_linkContextsLock);
  }
}

- (id)_connectionInfoForDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    int v4 = objc_alloc_init(_IDSDataChannelLinkConnection);
    long long v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6AF28]];
    id v6 = v5;
    if (v5 && [v5 length] == 16)
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v6, "bytes"));
      [(_IDSDataChannelLinkConnection *)v4 setChildConnectionID:v7];
    }
    id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6AF38]];
    [(_IDSDataChannelLinkConnection *)v4 setProtocolStack:v8];
    uint64_t v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6AF30]];
    [(_IDSDataChannelLinkConnection *)v4 setNwConnectionToken:v9];
    uint64_t v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6AF20]];
    -[_IDSDataChannelLinkConnection setAllowOutgoing:](v4, "setAllowOutgoing:", [v10 BOOLValue]);
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)_extractparticipantIDToHashedIDMappingFromData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v11 = 0;
    goto LABEL_11;
  }
  int v4 = (void *)MEMORY[0x1E4F28DC0];
  long long v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v18 = 0;
  id v8 = [v4 _strictlyUnarchivedObjectOfClasses:v7 fromData:v3 error:&v18];
  uint64_t v9 = v18;

  if (v9) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = 0;
LABEL_7:
    uint64_t v12 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      CFMutableDictionaryRef v20 = v9;
      __int16 v21 = 2112;
      id v22 = v13;
      id v14 = v13;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "_extractDictionaryFromData - Couldn't decode NSData, error:%@, extractedDataType:%@", buf, 0x16u);
    }
    id v11 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_191A047AC;
  v16[3] = &unk_1E572D1F0;
  id v17 = v10;
  uint64_t v9 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v16];
  id v11 = [v9 copy];
  uint64_t v12 = v17;
LABEL_10:

LABEL_11:

  return v11;
}

- (BOOL)processDatagram:(const char *)a3 datagramSize:(unint64_t)a4 readHandler:(id)a5 readHandlerWithOptions:(id)a6
{
  v75[15] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  unsigned __int16 v44 = -21846;
  unint64_t v43 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v75[8] = xmmword_191A52540;
  memset(&v75[10], 170, 40);
  memset(v75, 170, 64);
  if (a4 < 2)
  {
    LODWORD(v13) = 0;
    LODWORD(v12) = 0;
    goto LABEL_10;
  }
  uint64_t v12 = __rev16(*(unsigned __int16 *)a3);
  unint64_t v13 = (v12 + 2);
  if (a4 < v13)
  {
LABEL_10:
    id v17 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v18 = v12;
      id v48 = self;
      __int16 v49 = 2048;
      unint64_t v13 = v13;
      unint64_t v50 = a4;
      __int16 v51 = 2048;
      uint64_t v52 = v12;
      __int16 v53 = 2048;
      uint64_t v54 = v13;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "<%@> read sanity check failed: datagramSize %ld metadataSize %ld dataOffset %ld", buf, 0x2Au);
    }
    else
    {
      uint64_t v18 = v12;
      unint64_t v13 = v13;
    }

    id v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"read sanity check failed: datagramSize %ld metadataSize %ld dataOffset %ld", a4, v18, v13);
    id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    __int16 v21 = objc_msgSend(v20, "initWithObjectsAndKeys:", v19, *MEMORY[0x1E4F28568], 0);
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = (void *)[v22 initWithDomain:*MEMORY[0x1E4F6ACF0] code:3 userInfo:v21];
    if (v10) {
      (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v23);
    }
    else {
      (*((void (**)(id, void, void, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, 0, 0, v23);
    }
    id eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
    if (eventHandler)
    {
      v45[0] = @"event-type";
      v45[1] = @"connected-link";
      v46[0] = &unk_1EE28B3E8;
      BOOL v25 = [(IDSDatagramChannel *)self connectedLinks];
      v46[1] = v25;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
      eventHandler[2](eventHandler, v26);
    }
    [(IDSDatagramChannel *)self close];

    BOOL v27 = 0;
    goto LABEL_19;
  }
  [(IDSDatagramChannel *)self processMetadataForDatagram:a3 size:a4 datagramInfo:&v43 options:v75];
  id v14 = (unsigned __int8 *)&a3[v13];
  unint64_t v15 = a4 - v13;
  if (a4 == v13)
  {
    if ((v75[0] & 0x40) != 0)
    {
      id v16 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v48) = HIWORD(v75[5]);
        _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "readFromNWConnection: _internal->_connection: Only has statsID: %x", buf, 8u);
      }

      if (v10) {
        (*((void (**)(id, unsigned __int8 *, void, unint64_t, void, void))v10 + 2))(v10, v14, 0, v43, v44, 0);
      }
      else {
        (*((void (**)(id, unsigned __int8 *, void, unint64_t, void, void *, void))v11 + 2))(v11, v14, 0, v43, v44, v75, 0);
      }
    }
  }
  else
  {
    [(IDSDatagramChannel *)self _logReceivingStats:a4 - v13];
    if (v10) {
      (*((void (**)(id, unsigned __int8 *, unint64_t, unint64_t, void, void))v10 + 2))(v10, v14, a4 - v13, v43, v44, 0);
    }
    else {
      (*((void (**)(id, unsigned __int8 *, unint64_t, unint64_t, void, void *, void))v11
    }
       + 2))(v11, v14, a4 - v13, v43, v44, v75, 0);
  }
  if (!self->_internal->_verboseFunctionalLogging)
  {
    BOOL v27 = 1;
    goto LABEL_20;
  }
  id v19 = +[IDSLogging IDSDataChannels];
  BOOL v29 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v15 < 0xA)
  {
    if (v29)
    {
      *(_DWORD *)buf = 138413058;
      id v48 = self;
      __int16 v49 = 2048;
      unint64_t v50 = v15;
      __int16 v51 = 2048;
      uint64_t v52 = v12;
      __int16 v53 = 2048;
      uint64_t v54 = (v12 + 2);
      uint64_t v40 = "<%@> read details: datagramSize %ld metadataSize %ld dataOffset %ld";
      __int16 v41 = v19;
      uint32_t v42 = 42;
      goto LABEL_33;
    }
  }
  else if (v29)
  {
    int v30 = *v14;
    int v31 = v14[1];
    int v32 = v14[2];
    int v33 = v14[3];
    int v34 = v14[4];
    int v35 = v14[5];
    int v36 = v14[6];
    int v37 = v14[7];
    int v38 = v14[8];
    int v39 = v14[9];
    *(_DWORD *)buf = 138415618;
    id v48 = self;
    __int16 v49 = 2048;
    unint64_t v50 = v15;
    __int16 v51 = 2048;
    uint64_t v52 = v12;
    __int16 v53 = 2048;
    uint64_t v54 = (v12 + 2);
    __int16 v55 = 1024;
    int v56 = v30;
    __int16 v57 = 1024;
    int v58 = v31;
    __int16 v59 = 1024;
    int v60 = v32;
    __int16 v61 = 1024;
    int v62 = v33;
    __int16 v63 = 1024;
    int v64 = v34;
    __int16 v65 = 1024;
    int v66 = v35;
    __int16 v67 = 1024;
    int v68 = v36;
    __int16 v69 = 1024;
    int v70 = v37;
    __int16 v71 = 1024;
    int v72 = v38;
    __int16 v73 = 1024;
    int v74 = v39;
    uint64_t v40 = "<%@> read details: datagramSize %ld metadataSize %ld dataOffset %ld [%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x ...]";
    __int16 v41 = v19;
    uint32_t v42 = 102;
LABEL_33:
    _os_log_impl(&dword_19190B000, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
  }
  BOOL v27 = 1;
LABEL_19:

LABEL_20:
  return v27;
}

- (void)handleIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 datagramOptions:(id *)a6
{
  unsigned __int16 v7 = *(_WORD *)&a5.var4;
  uint64_t v8 = *(void *)&a5.var0;
  uint64_t v9 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v12 = [(IDSDatagramChannel *)self _logChecksum:a3 length:a4];
  if (v12)
  {
    unint64_t v13 = v12;
    id v14 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 67109376;
      v18[1] = v9;
      __int16 v19 = 2048;
      unint64_t v20 = v13;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Recv datagram checksum %uB/%lu", (uint8_t *)v18, 0x12u);
    }
  }
  internal = self->_internal;
  id readHandler = internal->_readHandler;
  if (readHandler)
  {
    (*((void (**)(id, const char *, uint64_t, uint64_t, void, void))readHandler + 2))(readHandler, a3, v9, v8, v7, 0);
  }
  else
  {
    id readHandlerWithOptions = internal->_readHandlerWithOptions;
    if (readHandlerWithOptions) {
      (*((void (**)(id, const char *, uint64_t, uint64_t, void, $57805C60A28E07DC53EB6A497EB1EEF4 *, void))readHandlerWithOptions
    }
       + 2))(readHandlerWithOptions, a3, v9, v8, v7, a6, 0);
  }
}

- (void)readFromNWConnection:(id)a3 maximumDatagrams:(unsigned int)a4 readHandler:(id)a5 readHandlerWithOptions:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  unint64_t v10 = (unint64_t)a5;
  unint64_t v11 = (unint64_t)a6;
  if (v10 | v11)
  {
    unint64_t v12 = (void *)[(id)v10 copy];
    unint64_t v13 = (void *)[(id)v11 copy];
    unint64_t v20 = v12;
    id v21 = (id)v10;
    id v22 = (id)v11;
    id v19 = v9;
    id v14 = v13;
    id v15 = v12;
    nw_connection_read_multiple();
  }
  else
  {
    os_unfair_lock_lock(&self->_internal->_readLock);
    internal = self->_internal;
    id eventHandler = (void (**)(id, void *))internal->_eventHandler;
    if (eventHandler)
    {
      uint64_t v23 = @"event-type";
      v24[0] = &unk_1EE28B5E0;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      eventHandler[2](eventHandler, v18);

      internal = self->_internal;
    }
    os_unfair_lock_unlock(&internal->_readLock);
  }
}

- (void)readFromOSChannel:(channel *)a3 ring:(channel_ring_desc *)a4 maximumDatagrams:(unsigned int)a5 readHandler:(id)a6 readHandlerWithOptions:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v13 = (void (**)(void))a6;
  id v28 = a7;
  p_readLock = &self->_internal->_readLock;
  os_unfair_lock_lock(p_readLock);
  BOOL v29 = v13;
  lock = p_readLock;
  if (self->_internal->_isInvalidated)
  {
    id v15 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v16 = "invalidating - not reading more";
LABEL_4:
      id v17 = v15;
      uint32_t v18 = 2;
LABEL_5:
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
LABEL_6:

    goto LABEL_7;
  }
  if (!a4)
  {
    id v15 = +[IDSTransportLog IDSDataChannels];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    id v16 = "os_channel not yet ready to read";
    goto LABEL_4;
  }
  unsigned int v19 = os_channel_available_slot_count();
  if (!v19)
  {
    [(IDSDatagramChannel *)self osChannelInfoLog];
    id v15 = +[IDSTransportLog IDSDataChannels];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    id v16 = "os_channel_available_slot_count gave no slots to read";
    goto LABEL_4;
  }
  if (v19 >= a5) {
    unsigned int v20 = a5;
  }
  else {
    unsigned int v20 = v19;
  }
  if (!v20)
  {
LABEL_29:
    int v24 = os_channel_advance_slot();
    if (v24)
    {
      [(IDSDatagramChannel *)self osChannelInfoLog];
      BOOL v25 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v24;
        _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "os_channel_advance_slot failed for read %d", buf, 8u);
      }
    }
    int v26 = os_channel_sync();
    if (!v26) {
      goto LABEL_7;
    }
    [(IDSDatagramChannel *)self osChannelInfoLog];
    id v15 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v26;
      id v16 = "os_channel_sync for RX failed %d";
      id v17 = v15;
      uint32_t v18 = 8;
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  int v21 = 0;
  BOOL v22 = 1;
  while (1)
  {
    *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v32 = v23;
    long long v33 = v23;
    *(_OWORD *)buf = v23;
    long long v31 = v23;
    os_channel_get_next_slot();
    if (!self->_internal->_hasMetadata)
    {
      [(IDSDatagramChannel *)self _logReceivingStats:*(unsigned __int16 *)&buf[2]];
      if (v29)
      {
        v8 &= 0xFFFFFFFFFFFF0000;
        v29[2]();
      }
      else
      {
        v7 &= 0xFFFFFFFFFFFF0000;
        (*((void (**)(id, void, void, void, uint64_t, void, void))v28 + 2))(v28, v31, *(unsigned __int16 *)&buf[2], 0, v7, 0, 0);
      }
      goto LABEL_21;
    }
    if (![(IDSDatagramChannel *)self processDatagram:(void)v31 datagramSize:*(unsigned __int16 *)&buf[2] readHandler:v29 readHandlerWithOptions:v28])break; {
LABEL_21:
    }
    BOOL v22 = ++v21 < v20;
    if (v20 == v21) {
      goto LABEL_29;
    }
  }
  if (!v22) {
    goto LABEL_29;
  }
LABEL_7:
  os_unfair_lock_unlock(lock);
}

- (void)readFromSocketDescriptorWithReadHandler:(id)a3 readHandlerWithOptions:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_readLock = &self->_internal->_readLock;
  os_unfair_lock_lock(p_readLock);
  internal = self->_internal;
  if (internal->_socketDescriptor == -1)
  {
    id eventHandler = (void (**)(id, void *))internal->_eventHandler;
    if (eventHandler)
    {
      int v35 = @"event-type";
      v36[0] = &unk_1EE28B5E0;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      eventHandler[2](eventHandler, v15);
    }
  }
  else
  {
    [(IDSDatagramChannel *)self sendEventConnectedWithDummyLinkInfo];
    memset(__b, 170, sizeof(__b));
    ssize_t v10 = read(self->_internal->_socketDescriptor, __b, 0x7D0uLL);
    ssize_t v11 = v10;
    if (v10)
    {
      if (v10 == -1)
      {
        unsigned int v12 = *__error();
        if (v12 <= 0x24 && ((1 << v12) & 0x1800000010) != 0)
        {
          unint64_t v13 = +[IDSLogging IDSDataChannels];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            long long v31 = self;
            __int16 v32 = 1024;
            LODWORD(v33[0]) = v12;
            _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "<%@> read nonfatal failure errno %d", buf, 0x12u);
          }
        }
        else
        {
          int v21 = +[IDSLogging IDSDataChannels];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v22 = (void *)MEMORY[0x192FE03B0](self->_internal->_eventHandler);
            *(_DWORD *)buf = 138412802;
            long long v31 = self;
            __int16 v32 = 1024;
            LODWORD(v33[0]) = v12;
            WORD2(v33[0]) = 2048;
            *(void *)((char *)v33 + 6) = v22;
            _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "<%@> read failed errno %d calling event handler %p", buf, 0x1Cu);
          }
          long long v23 = (void (**)(id, void *))self->_internal->_eventHandler;
          if (v23)
          {
            v28[0] = @"event-type";
            v28[1] = @"connected-link";
            v29[0] = &unk_1EE28B3E8;
            int v24 = [(IDSDatagramChannel *)self connectedLinks];
            v29[1] = v24;
            BOOL v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
            v23[2](v23, v25);
          }
          [(IDSDatagramChannel *)self close];
        }
      }
      else
      {
        [(IDSDatagramChannel *)self _logReceivingStats:v10];
        if (v6) {
          (*((void (**)(id, unsigned char *, ssize_t, void, void, void))v6 + 2))(v6, __b, v11, 0, 0, 0);
        }
        else {
          (*((void (**)(id, unsigned char *, ssize_t, void, void, void, void))v7 + 2))(v7, __b, v11, 0, 0, 0, 0);
        }
      }
    }
    else
    {
      id v16 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = (void *)MEMORY[0x192FE03B0](self->_internal->_eventHandler);
        *(_DWORD *)buf = 138412546;
        long long v31 = self;
        __int16 v32 = 2048;
        v33[0] = v17;
        _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "<%@> read returned 0 bytes calling event handler %p", buf, 0x16u);
      }
      uint32_t v18 = (void (**)(id, void *))self->_internal->_eventHandler;
      if (v18)
      {
        unsigned int v19 = [(IDSDatagramChannel *)self connectedLinks];
        v27[1] = v19;
        unsigned int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:2];
        v18[2](v18, v20);
      }
      [(IDSDatagramChannel *)self close];
    }
  }
  os_unfair_lock_unlock(p_readLock);
}

- (void)readDatagramWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internal = self->_internal;
  id v7 = v4;
  if (internal->_pathEvaluator)
  {
    [(IDSDatagramChannel *)self readFromOSChannel:internal->_osChannel ring:internal->_osChannelRXRing maximumDatagrams:1 readHandler:v4 readHandlerWithOptions:0];
  }
  else
  {
    connection = internal->_connection;
    if (connection) {
      [(IDSDatagramChannel *)self readFromNWConnection:connection maximumDatagrams:1 readHandler:v4 readHandlerWithOptions:0];
    }
    else {
      [(IDSDatagramChannel *)self readFromSocketDescriptorWithReadHandler:v4 readHandlerWithOptions:0];
    }
  }
}

- (void)readDatagramsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internal = self->_internal;
  id v7 = v4;
  if (internal->_pathEvaluator)
  {
    [(IDSDatagramChannel *)self readFromOSChannel:internal->_osChannel ring:internal->_osChannelRXRing maximumDatagrams:256 readHandler:0 readHandlerWithOptions:v4];
  }
  else
  {
    connection = internal->_connection;
    if (connection) {
      [(IDSDatagramChannel *)self readFromNWConnection:connection maximumDatagrams:256 readHandler:0 readHandlerWithOptions:v4];
    }
    else {
      [(IDSDatagramChannel *)self readFromSocketDescriptorWithReadHandler:0 readHandlerWithOptions:v4];
    }
  }
}

- (void)close
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  id v3 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v32 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "-close called for %@", buf, 0xCu);
  }

  self->_internal->_BOOL connected = 0;
  internal = self->_internal;
  connection = internal->_connection;
  if (connection)
  {
    nw_connection_cancel(connection);
    id v6 = self->_internal;
    id v7 = v6->_connection;
    v6->_connection = 0;

    [(IDSDatagramChannel *)self invalidateDirectConnections];
    internal = self->_internal;
  }
  int socketDescriptor = internal->_socketDescriptor;
  if (socketDescriptor != -1)
  {
    close(socketDescriptor);
    self->_internal->_int socketDescriptor = -1;
  }
  [(IDSDatagramChannel *)self _logFinalStats];
  id v9 = self->_internal;
  if (v9->_pathEvaluator)
  {
    nw_path_evaluator_cancel();
    ssize_t v10 = self->_internal;
    int osChannelFD = v10->_osChannelFD;
    osChannel = v10->_osChannel;
    v10->_int osChannelFD = -1;
    self->_internal->_osChannel = 0;
    if (self->_internal->_startCalled)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = sub_191A0606C;
      BOOL v27 = &unk_1E572D238;
      int v29 = osChannelFD;
      id v28 = osChannel;
      IDSTransportThreadAddBlock();
    }
    else if (osChannel)
    {
      os_channel_destroy();
    }
    unint64_t v13 = self->_internal;
    pathEvaluator = v13->_pathEvaluator;
    v13->_pathEvaluator = 0;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = self->_internal->_sendingMetadata;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19), "pointerValue", (void)v20);
          _IDSLinkPacketBufferRelease();
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v17);
    }

    [(NSMutableArray *)self->_internal->_sendingMetadata removeAllObjects];
    id v9 = self->_internal;
  }
  os_unfair_lock_unlock(&v9->_writeLock);
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&self->_internal->_readLock);
  id v3 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    unint64_t v13 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "-invalidate called for %@", (uint8_t *)&v12, 0xCu);
  }

  [(IDSDatagramChannel *)self close];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  internal = self->_internal;
  preConnectionData = internal->_preConnectionData;
  if (preConnectionData)
  {
    internal->_preConnectionData = 0;

    internal = self->_internal;
  }
  id eventHandler = internal->_eventHandler;
  if (eventHandler)
  {
    internal->_id eventHandler = 0;

    internal = self->_internal;
  }
  id readHandler = internal->_readHandler;
  if (readHandler)
  {
    internal->_id readHandler = 0;

    internal = self->_internal;
  }
  id readHandlerWithOptions = internal->_readHandlerWithOptions;
  if (readHandlerWithOptions)
  {
    internal->_id readHandlerWithOptions = 0;

    internal = self->_internal;
  }
  id writeHandler = internal->_writeHandler;
  if (writeHandler)
  {
    internal->_id writeHandler = 0;

    internal = self->_internal;
  }
  os_unfair_lock_lock(&internal->_linkContextsLock);
  ssize_t v10 = self->_internal;
  linkContexts = v10->_linkContexts;
  if (linkContexts)
  {
    v10->_linkContexts = 0;

    ssize_t v10 = self->_internal;
  }
  os_unfair_lock_unlock(&v10->_linkContextsLock);
  IDSLinkPacketBufferCleanup();
  self->_internal->_isInvalidated = 1;
  os_unfair_lock_unlock(&self->_internal->_writeLock);
  os_unfair_lock_unlock(&self->_internal->_readLock);
}

- (void)setHasMetadata:(BOOL)a3
{
  self->_internal->_hasMetadata = a3;
}

- (void)startInternal
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (internal->_pathEvaluator)
  {
    queue = internal->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_191A06488;
    block[3] = &unk_1E5729000;
    block[4] = self;
    dispatch_async(queue, block);
    return;
  }
  if (!internal->_connection)
  {
    if (internal->_socketDescriptor == -1)
    {
      long long v5 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = self;
        _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "<%@> cannot start datagram channel with no socket and no connection", buf, 0xCu);
      }
    }
    else
    {
      long long v5 = nw_parameters_create();
      nw_parameters_set_data_mode();
      nw_parameters_set_context();
      uint64_t v6 = nw_connection_create_with_connected_socket_and_parameters();
      id v7 = self->_internal;
      connection = v7->_connection;
      v7->_connection = (OS_nw_connection *)v6;

      id v9 = self->_internal;
      if (v9->_connection)
      {
        v9->_int64_t operationMode = 1;

        goto LABEL_5;
      }
      ssize_t v10 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int socketDescriptor = self->_internal->_socketDescriptor;
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = self;
        __int16 v15 = 1024;
        int v16 = socketDescriptor;
        _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "<%@> nw_connection_create_with_connected_socket failed. socketDescriptor %d might be invalid.", buf, 0x12u);
      }
    }
    return;
  }
LABEL_5:

  [(IDSDatagramChannel *)self start];
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (*(_OWORD *)&internal->_readHandler == 0) {
    sub_191A41ADC();
  }
  if (!internal->_eventHandler) {
    sub_191A41B08();
  }
  id v4 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "-start called for %@", buf, 0xCu);
  }

  self->_internal->_startCalled = 1;
  long long v5 = self->_internal;
  if (v5->_operationMode != 1) {
    sub_191A41B34();
  }
  nw_connection_set_queue((nw_connection_t)v5->_connection, (dispatch_queue_t)v5->_queue);
  connection = self->_internal->_connection;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_191A06918;
  handler[3] = &unk_1E572D260;
  void handler[4] = self;
  nw_connection_set_state_changed_handler(connection, handler);
  nw_connection_start((nw_connection_t)self->_internal->_connection);
}

- (void)_writeToOSChannelDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v11 = a8;
  if (self->_internal->_operationMode) {
    sub_191A41B60();
  }
  int v12 = v11;
  unsigned int v13 = os_channel_available_slot_count();
  uint64_t v14 = (void *)[self->_internal->_writeHandler copy];
  if (v13 < a7)
  {
    int v15 = os_channel_sync();
    if (v15)
    {
      int v16 = v15;
      [(IDSDatagramChannel *)self osChannelInfoLog];
      uint64_t v17 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = v16;
        _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "os_channel_sync for TX failed %d", buf, 8u);
      }
    }
    unsigned int v18 = os_channel_available_slot_count();
    if (!v18)
    {
      [(IDSDatagramChannel *)self osChannelInfoLog];
      uint64_t v19 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "have data to send to daemon but no slots in tx ring", buf, 2u);
      }
    }
    if (v18 < a7)
    {
      long long v20 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        size_t v67 = a7;
        __int16 v68 = 2048;
        *(void *)__int16 v69 = v18;
        _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "have %lu datagrams to send to daemon but only %lu slots", buf, 0x16u);
      }

      id v48 = objc_msgSend([NSString alloc], "initWithFormat:", @"have %lu datagrams to send to daemon but only %lu slots", a7, v18);
      id v53 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      unint64_t v50 = objc_msgSend(v53, "initWithObjectsAndKeys:", v48, *MEMORY[0x1E4F28568], 0);
      id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
      __int16 v55 = (void *)[v54 initWithDomain:*MEMORY[0x1E4F6ACF0] code:5 userInfo:v50];
      sub_19198300C(v12, v14, v55, 0);

      goto LABEL_47;
    }
  }
  int v56 = v14;
  __int16 v57 = v12;
  if (a7 < 1)
  {
    uint64_t v22 = 0;
LABEL_38:
    int v44 = os_channel_sync();
    uint64_t v14 = v56;
    int v12 = v57;
    if (v44)
    {
      int v45 = v44;
      [(IDSDatagramChannel *)self osChannelInfoLog];
      uint64_t v46 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = v45;
        _os_log_impl(&dword_19190B000, v46, OS_LOG_TYPE_DEFAULT, "os_channel_sync for TX failed %d", buf, 8u);
      }
    }
    sub_19198300C(v57, v56, 0, v22);
    goto LABEL_48;
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v58 = a7;
  p_uint64_t var4 = &a5->var4;
  char v59 = a7;
  while (1)
  {
    unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__src = v24;
    long long v64 = v24;
    IDSByteBufferInitForWrite();
    a5 = ($C835DF2C905B2D2BE81B7C33CDF61FEE *)((unint64_t)a5 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)p_var4);
    -[IDSDatagramChannel generateMetadataWithDatagramInfo:options:currentDatagramCount:totalDatagramCount:byteBuffer:](self, "generateMetadataWithDatagramInfo:options:currentDatagramCount:totalDatagramCount:byteBuffer:", *((void *)p_var4 - 1), a5, a6[v21], v21, a7, __src);
    unsigned int v25 = v64 - LODWORD(__src[0]);
    os_channel_get_next_slot();
    size_t v26 = a4[v21];
    if (v26 + (unsigned __int16)v25 + 2 > 0xAAAA) {
      break;
    }
    BOOL v27 = (unsigned __int8 *)a3[v21];
    if (self->_internal->_hasMetadata)
    {
      MEMORY[0xAAAAAAAAAAAAAAAA] = bswap32(v25) >> 16;
      if ((_WORD)v25) {
        memcpy((void *)0xAAAAAAAAAAAAAAACLL, __src[0], (unsigned __int16)v25);
      }
      if (!v26) {
        goto LABEL_24;
      }
      id v28 = (void *)((unsigned __int16)v25 - 0x5555555555555554);
    }
    else
    {
      id v28 = (void *)0xAAAAAAAAAAAAAAAALL;
    }
    memcpy(v28, v27, v26);
LABEL_24:
    os_channel_set_slot_properties();
    int v29 = os_channel_advance_slot();
    if (v29)
    {
      int v30 = v29;
      [(IDSDatagramChannel *)self osChannelInfoLog];
      long long v31 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = v30;
        _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "advance_slot failed for write %d", buf, 8u);
      }
    }
    [(IDSDatagramChannel *)self _logSendingStats:v26];
    if (self->_internal->_verboseFunctionalLogging)
    {
      __int16 v32 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        size_t v67 = (size_t)self;
        __int16 v68 = 1024;
        *(_DWORD *)__int16 v69 = v21;
        *(_WORD *)&v69[4] = 2048;
        *(void *)&v69[6] = v26;
        *(_WORD *)&v69[14] = 2048;
        *(void *)&v69[16] = (unsigned __int16)v25;
        _os_log_impl(&dword_19190B000, v32, OS_LOG_TYPE_DEFAULT, "<%@> write details: datagramSize[%d] %ld metadataSize %ld", buf, 0x26u);
      }

      if (v26 >= 0xA)
      {
        uint64_t v33 = +[IDSLogging IDSDataChannels];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = *v27;
          int v35 = v27[1];
          int v36 = v27[2];
          int v37 = v27[3];
          int v38 = v27[4];
          int v39 = v27[5];
          int v40 = v27[6];
          int v41 = v27[7];
          int v42 = v27[8];
          int v43 = v27[9];
          *(_DWORD *)buf = 138414850;
          size_t v67 = (size_t)self;
          __int16 v68 = 1024;
          *(_DWORD *)__int16 v69 = v34;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)&v69[6] = v35;
          *(_WORD *)&v69[10] = 1024;
          *(_DWORD *)&v69[12] = v36;
          *(_WORD *)&v69[16] = 1024;
          *(_DWORD *)&v69[18] = v37;
          *(_WORD *)&v69[22] = 1024;
          int v70 = v38;
          __int16 v71 = 1024;
          int v72 = v39;
          __int16 v73 = 1024;
          int v74 = v40;
          __int16 v75 = 1024;
          int v76 = v41;
          __int16 v77 = 1024;
          int v78 = v42;
          __int16 v79 = 1024;
          int v80 = v43;
          _os_log_impl(&dword_19190B000, v33, OS_LOG_TYPE_DEFAULT, "<%@> write details: datagramContents %02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", buf, 0x48u);
        }
      }
    }
    p_var4 += 10;
    v22 += v26;
    IDSByteBufferRelease();
    ++v21;
    LOBYTE(a7) = v59;
    if (v58 == v21) {
      goto LABEL_38;
    }
  }
  uint64_t v47 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    size_t v67 = v26;
    __int16 v68 = 2048;
    *(void *)__int16 v69 = (unsigned __int16)v25;
    *(_WORD *)&v69[8] = 2048;
    *(void *)&v69[10] = 43690;
    _os_log_impl(&dword_19190B000, v47, OS_LOG_TYPE_DEFAULT, "have data %lu metadata %lu to send to daemon but not enough bytes %lu in slot", buf, 0x20u);
  }

  id v48 = objc_msgSend([NSString alloc], "initWithFormat:", @"have data %lu to send to daemon but not enough bytes %lu in slot", v26 + (unsigned __int16)v25 + 2, 43690);
  id v49 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  unint64_t v50 = objc_msgSend(v49, "initWithObjectsAndKeys:", v48, *MEMORY[0x1E4F28568], 0);
  id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v52 = (void *)[v51 initWithDomain:*MEMORY[0x1E4F6ACF0] code:5 userInfo:v50];
  uint64_t v14 = v56;
  int v12 = v57;
  sub_19198300C(v57, v56, v52, v22);

LABEL_47:
LABEL_48:
}

- ($19A98EDAC2850B6C557AE4D7AD493570)_makePacketBufferFromDatagram:(const void *)a3 datagramSize:(unsigned int)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 datagramInfo:(id)a7 datagramOptions:(id *)a8
{
  unsigned __int16 v8 = *(_WORD *)&a7.var4;
  uint64_t v9 = *(void *)&a7.var0;
  uint64_t v10 = a6;
  uint64_t v11 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v15 = ($19A98EDAC2850B6C557AE4D7AD493570 *)_IDSLinkPacketBufferCreate();
  unsigned int var0 = v15->var0;
  IDSLinkPacketBufferAddBufferStart();
  IDSByteBufferInitForWriteWithAllocatedSpace();
  -[IDSDatagramChannel generateMetadataWithDatagramInfo:options:currentDatagramCount:totalDatagramCount:byteBuffer:](self, "generateMetadataWithDatagramInfo:options:currentDatagramCount:totalDatagramCount:byteBuffer:", v9, v8, a8, v11, v10, var0);
  uint64_t v17 = *((void *)var0 + 2) - *(void *)var0;
  v15->int64_t var2 = (unsigned __int16)(*((_WORD *)var0 + 8) - *(_WORD *)var0);
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v15];
  uint64_t v18 = (unsigned __int16)(v17 + 2);
  if (v15->var1 - v18 >= a4)
  {
    memcpy(&v15->var0[v18], a3, a4);
    v15->var2 += a4;
  }
  else
  {
    uint64_t v19 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = v15->var1 - v18;
      int v22 = 134218496;
      uint64_t v23 = v20;
      __int16 v24 = 1024;
      unsigned int v25 = a4;
      __int16 v26 = 1024;
      int v27 = (unsigned __int16)v17;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Not enough packet buffer space. Space left %lu datagram size %u metadata size %u", (uint8_t *)&v22, 0x18u);
    }

    return 0;
  }
  return v15;
}

- (void)_writeToNWConnection:(id)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 currentDatagramCount:(unsigned __int8)a6 totalDatagramCount:(unsigned __int8)a7 datagramInfo:(id)a8 datagramOptions:(id *)a9 completionHandler:(id)a10
{
  uint64_t v10 = a7;
  uint64_t v11 = a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v33 = a3;
  id v34 = a10;
  if (qword_1E92DFC18 != -1) {
    dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
  }
  uint64_t v15 = mach_continuous_time();
  double v16 = *(double *)&qword_1E92DFC20;
  uint64_t v17 = v33;
  if ([(IDSDatagramChannel *)self isDaemonConnection:v33])
  {
    __int16 v32 = (void *)[v34 copy];
    long long v31 = (void *)[self->_internal->_writeHandler copy];
    if (self->_internal->_hasMetadata)
    {
      uint64_t v18 = -[IDSDatagramChannel _makePacketBufferFromDatagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:](self, "_makePacketBufferFromDatagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:", a4, v12, v11, v10, *(void *)&a8.var0, *(unsigned __int16 *)&a8.var4, a9);
      if (!v18)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v28 = objc_msgSend(v27, "initWithObjectsAndKeys:", @"Not enough packet buffer space", *MEMORY[0x1E4F28568], 0);
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        int v30 = (void *)[v29 initWithDomain:*MEMORY[0x1E4F6ACF0] code:6 userInfo:v28];
        uint64_t v23 = v31;
        int v22 = v32;
        sub_19198300C(v32, v31, v30, v12);

        uint64_t v17 = v33;
LABEL_13:

        uint64_t v20 = v34;
        goto LABEL_14;
      }
      dispatch_data_t v19 = sub_191982E44((uint64_t *)v18, 0);
    }
    else
    {
      dispatch_data_t v19 = dispatch_data_create(a4, v12, 0, 0);
    }
    uint64_t v21 = v19;
    uint64_t v23 = v31;
    int v22 = v32;
    uint64_t v17 = v33;
    double v24 = v16 * (double)v15;
    if (qword_1E92DFC18 != -1) {
      dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
    }
    double v25 = *(double *)&qword_1E92DFC20 * (double)mach_continuous_time();
    __int16 v26 = *MEMORY[0x1E4F38C58];
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = sub_191A078A4;
    completion[3] = &unk_1E572D288;
    void completion[4] = self;
    $C835DF2C905B2D2BE81B7C33CDF61FEE v41 = a8;
    id v36 = v32;
    double v38 = v25;
    double v39 = v24;
    int v40 = v12;
    id v37 = v31;
    nw_connection_send(v33, v21, v26, 1, completion);

    goto LABEL_13;
  }
  uint64_t v20 = v34;
  -[IDSDatagramChannel _writeToDirectConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:](self, "_writeToDirectConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:", v33, a4, v12, v11, v10, *(void *)&a8.var0, *(unsigned __int16 *)&a8.var4, a9, v34);
LABEL_14:
}

- (void)_writeToNWConnectionArrayOfDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  internal = self->_internal;
  if (internal->_operationMode != 1) {
    sub_191A41B8C();
  }
  double v16 = v14;
  uint64_t v17 = (a7 - 1);
  if (a7 == 1)
  {
    uint64_t v18 = [(IDSDatagramChannel *)self connectionForLinkID:a5->var0];
    -[IDSDatagramChannel _writeToNWConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:](self, "_writeToNWConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:", v18, *a3, *a4, 0, 1, *(void *)&a5->var0, *(unsigned __int16 *)&a5->var4, *a6, v16);
  }
  else if (a7 < 2)
  {
    double v24 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v40 = self;
      __int16 v41 = 1024;
      int v42 = a7;
      _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "<%@> _writeToNWConnectionArrayOfDatagrams given %d datagrams, which is < 1", buf, 0x12u);
    }
  }
  else if (internal->_preferredDataPathType == 1)
  {
    dispatch_data_t v19 = a5 + 1;
    uint64_t v20 = a7 - 1;
    while (1)
    {
      int var0 = v19->var0;
      ++v19;
      if (var0 != a5->var0) {
        break;
      }
      if (!--v20) {
        goto LABEL_9;
      }
    }
    uint64_t v25 = 0;
    int v30 = a4;
    __int16 v26 = a3;
    id v27 = a6;
    do
    {
      uint64_t v28 = [(IDSDatagramChannel *)self connectionForLinkID:a5->var0];
      if (v17 == v25) {
        id v29 = v16;
      }
      else {
        id v29 = 0;
      }
      a6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)((unint64_t)a6 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)&a5->var4);
      -[IDSDatagramChannel _writeToNWConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:](self, "_writeToNWConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:", v28, v26[v25], v30[v25], v25, a7, *(void *)&a5->var0, a6, v27[v25], v29);

      ++v25;
      ++a5;
    }
    while (v17 + 1 != v25);
  }
  else
  {
LABEL_9:
    int v22 = [(IDSDatagramChannel *)self connectionForLinkID:a5->var0];
    batch_block[0] = MEMORY[0x1E4F143A8];
    batch_block[1] = 3221225472;
    batch_block[2] = sub_191A07E28;
    batch_block[3] = &unk_1E572D2B0;
    int v38 = a7;
    batch_block[4] = self;
    id v32 = v22;
    id v34 = a3;
    int v35 = a4;
    id v36 = a5;
    id v37 = a6;
    id v33 = v16;
    uint64_t v23 = v22;
    nw_connection_batch(v23, batch_block);
  }
}

- (void)_writeToSocket:(int)a3 datagrams:(const void *)a4 datagramSizes:(unsigned int *)a5 datagramInfo:(id *)a6 datagramOptions:(id *)a7 datagramCount:(int)a8 completionHandler:(id)a9
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v13 = a9;
  uint64_t v14 = [self->_internal->_writeHandler copy];
  uint64_t v15 = (void *)v14;
  if (a8 < 1)
  {
    uint64_t v16 = 0;
    uint64_t v25 = 0;
    goto LABEL_32;
  }
  double v39 = (void *)v14;
  id v40 = v13;
  uint64_t v16 = 0;
  uint64_t v17 = a8;
  while (1)
  {
    unsigned int v19 = *a5++;
    uint64_t v18 = v19;
    ssize_t v20 = write(self->_internal->_socketDescriptor, *a4, v19);
    v16 += v20;
    if (v20 == v19)
    {
      [(IDSDatagramChannel *)self _logSendingStats:v18];
      goto LABEL_14;
    }
    ssize_t v21 = v20;
    if (v20 >= 1)
    {
      __int16 v26 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        int v42 = self;
        __int16 v43 = 1024;
        int v44 = v21;
        __int16 v45 = 1024;
        int v46 = v18;
        _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "<%@> write failed to send all bytes %d < %d", buf, 0x18u);
      }
      uint64_t v15 = v39;
      id v13 = v40;

      uint64_t v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to send all bytes (%d < %d)", v21, v18);
      goto LABEL_30;
    }
    if (!v20) {
      break;
    }
    uint64_t v22 = *__error();
    if (v22 > 0x37 || ((1 << v22) & 0x80000800000010) == 0)
    {
      id v33 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        int v42 = self;
        __int16 v43 = 1024;
        int v44 = v22;
        _os_log_impl(&dword_19190B000, v33, OS_LOG_TYPE_DEFAULT, "<%@> write failed errno %d", buf, 0x12u);
      }

      int socketDescriptor = self->_internal->_socketDescriptor;
      uint64_t v15 = v39;
      id v13 = v40;
      if (socketDescriptor != -1)
      {
        close(socketDescriptor);
        self->_internal->_int socketDescriptor = -1;
      }
      uint64_t v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to send (errno %d)", v22, v38);
LABEL_30:
      long long v31 = (void *)v27;
      id v35 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v36 = objc_msgSend(v35, "initWithObjectsAndKeys:", v31, *MEMORY[0x1E4F28568], 0);
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v25 = (void *)[v37 initWithDomain:*MEMORY[0x1E4F6ACF0] code:6 userInfo:v36];

      goto LABEL_31;
    }
    double v24 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v42 = self;
      __int16 v43 = 1024;
      int v44 = v22;
      _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "<%@> write nonfatal failure errno %d", buf, 0x12u);
    }

LABEL_14:
    ++a4;
    if (!--v17)
    {
      uint64_t v25 = 0;
      uint64_t v15 = v39;
      id v13 = v40;
      goto LABEL_32;
    }
  }
  uint64_t v28 = +[IDSLogging IDSDataChannels];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v42 = self;
    _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "<%@> write returned 0 - connection terminated", buf, 0xCu);
  }

  int v29 = self->_internal->_socketDescriptor;
  uint64_t v15 = v39;
  id v13 = v40;
  if (v29 != -1)
  {
    close(v29);
    self->_internal->_int socketDescriptor = -1;
  }
  id v30 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  long long v31 = objc_msgSend(v30, "initWithObjectsAndKeys:", @"Connection terminated", *MEMORY[0x1E4F28568], 0);
  id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v25 = (void *)[v32 initWithDomain:*MEMORY[0x1E4F6ACF0] code:6 userInfo:v31];
LABEL_31:

LABEL_32:
  sub_19198300C(v13, v15, v25, v16);
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
}

- (void)writeArrayOfDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v47 = a8;
  os_unfair_lock_lock(&self->_internal->_writeLock);
  unsigned int v46 = a7;
  if (a7 >= 1)
  {
    uint64_t v10 = a7;
    uint64_t v11 = a3;
    uint64_t v12 = a4;
    do
    {
      [(IDSDatagramChannel *)self _logPendingSendingStats:*v12];
      unint64_t v13 = [(IDSDatagramChannel *)self _logChecksum:*v11 length:*v12];
      if (v13)
      {
        unint64_t v14 = v13;
        uint64_t v15 = +[IDSLogging IDSDataChannels];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v16 = *v12;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[8] = 2048;
          *(void *)&buf[10] = v14;
          _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Send datagram checksum %uB/%lu", buf, 0x12u);
        }
      }
      ++v11;
      ++v12;
      --v10;
    }
    while (v10);
  }
  internal = self->_internal;
  if (internal->_isInvalidated)
  {
    os_unfair_lock_unlock(&internal->_writeLock);
    uint64_t v18 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "writeDatagrams: connection already closed", buf, 2u);
    }
    unsigned int v19 = v47;
    goto LABEL_12;
  }
  uint64_t v18 = [internal->_writeHandler copy];
  ssize_t v20 = self->_internal;
  if (v20->_connected)
  {
    if (v46 - 2 <= 6 && !v20->_hasSentCompoundPacket)
    {
      v20->_hasSentCompoundPacket = 1;
      ssize_t v21 = (void *)_IDSLinkPacketBufferCreate();
      unint64_t v49 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v22;
      *(_OWORD *)&uint8_t buf[16] = v22;
      IDSByteBufferInitForWriteWithAllocatedSpace();
      IDSByteBufferWriteField();
      v21[2] = *(void *)&buf[16] - *v21;
      IDSByteBufferRelease();
      [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v21];
      sendingMetadata = self->_internal->_sendingMetadata;
      double v24 = [MEMORY[0x1E4F29238] valueWithPointer:v21];
      [(NSMutableArray *)sendingMetadata addObject:v24];

      [(IDSDatagramChannel *)self sendMetadata];
      unsigned int v19 = v47;
LABEL_25:
      id v34 = self->_internal;
      if (v34->_operationMode)
      {
        [(IDSDatagramChannel *)self _writeToNWConnectionArrayOfDatagrams:a3 datagramSizes:a4 datagramInfo:a5 datagramOptions:a6 datagramCount:v46 completionHandler:v19];
      }
      else
      {
        uint64_t socketDescriptor = v34->_socketDescriptor;
        if (socketDescriptor == -1) {
          [(IDSDatagramChannel *)self _writeToOSChannelDatagrams:a3 datagramSizes:a4 datagramInfo:a5 datagramOptions:a6 datagramCount:v46 completionHandler:v19];
        }
        else {
          [(IDSDatagramChannel *)self _writeToSocket:socketDescriptor datagrams:a3 datagramSizes:a4 datagramInfo:a5 datagramOptions:a6 datagramCount:v46 completionHandler:v19];
        }
      }
      os_unfair_lock_unlock(&self->_internal->_writeLock);
      goto LABEL_12;
    }
    [(IDSDatagramChannel *)self sendMetadata];
    unsigned int v19 = v47;
    if ((int)v46 <= 0)
    {
      id v36 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "have no datagram to send to daemon", buf, 2u);
      }

      id v32 = [NSString alloc];
      id v33 = @"no datagram to send";
    }
    else
    {
      if (v46 < 9) {
        goto LABEL_25;
      }
      long long v31 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = 8;
        _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "we can't send more than %d datagrams using the compound channel", buf, 8u);
      }

      id v32 = [NSString alloc];
      id v33 = @"exceeded the maximum datagram count";
    }
    id v37 = (void *)[v32 initWithFormat:v33];
    id v38 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    double v39 = objc_msgSend(v38, "initWithObjectsAndKeys:", v37, *MEMORY[0x1E4F28568], 0);
    id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
    __int16 v41 = (void *)[v40 initWithDomain:*MEMORY[0x1E4F6ACF0] code:1 userInfo:v39];
    sub_19198300C(v47, v18, v41, 0);
    os_unfair_lock_unlock(&self->_internal->_writeLock);

    goto LABEL_12;
  }
  os_unfair_lock_unlock(&v20->_writeLock);
  uint64_t v25 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "writeDatagrams: not connected", buf, 2u);
  }

  __int16 v26 = (void *)[[NSString alloc] initWithFormat:@"not connected"];
  id v27 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v28 = objc_msgSend(v27, "initWithObjectsAndKeys:", v26, *MEMORY[0x1E4F28568], 0);
  id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v30 = (void *)[v29 initWithDomain:*MEMORY[0x1E4F6ACF0] code:6 userInfo:v28];
  unsigned int v19 = v47;
  sub_19198300C(v47, v18, v30, 0);

LABEL_12:
}

- (void)_writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  $C835DF2C905B2D2BE81B7C33CDF61FEE v10 = a5;
  uint64_t v9 = a3;
  unsigned int v8 = a4;
  id v7 = a6;
  [(IDSDatagramChannel *)self writeArrayOfDatagrams:&v9 datagramSizes:&v8 datagramInfo:&v10 datagramOptions:&v7 datagramCount:1 completionHandler:a7];
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6
{
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
}

- (void)setEventHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    $C835DF2C905B2D2BE81B7C33CDF61FEE v10 = self;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "-setEventHandler called for %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [v4 copy];
  internal = self->_internal;
  id eventHandler = internal->_eventHandler;
  internal->_id eventHandler = (id)v6;
}

- (void)setReadHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    $C835DF2C905B2D2BE81B7C33CDF61FEE v10 = self;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "-setReadHandler called for %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [v4 copy];
  internal = self->_internal;
  id readHandler = internal->_readHandler;
  internal->_id readHandler = (id)v6;
}

- (void)setReadHandlerWithOptions:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    $C835DF2C905B2D2BE81B7C33CDF61FEE v10 = self;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "-setReadHandlerWithOptions called for %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [v4 copy];
  internal = self->_internal;
  id readHandlerWithOptions = internal->_readHandlerWithOptions;
  internal->_id readHandlerWithOptions = (id)v6;
}

- (void)setWriteCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    $C835DF2C905B2D2BE81B7C33CDF61FEE v10 = self;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "-setWriteCompletionHandler called for %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [v4 copy];
  internal = self->_internal;
  id writeHandler = internal->_writeHandler;
  internal->_id writeHandler = (id)v6;
}

- (void)readyToRead
{
  internal = self->_internal;
  if (internal->_operationMode) {
    sub_191A41C10();
  }
  id readHandler = internal->_readHandler;
  if (!internal->_readHandlerWithOptions)
  {
    if (!readHandler) {
      sub_191A41BB8();
    }
    if (internal->_eventHandler) {
      goto LABEL_10;
    }
LABEL_14:
    sub_191A41BE4();
  }
  if (!internal->_eventHandler) {
    goto LABEL_14;
  }
  if (!readHandler)
  {
    MEMORY[0x1F4181798](self, sel_readDatagramsWithCompletionHandler_);
    return;
  }
LABEL_10:

  MEMORY[0x1F4181798](self, sel_readDatagramWithCompletionHandler_);
}

- (void)scheduleRead
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (internal->_readHandler)
  {
    MEMORY[0x1F4181798](self, sel_readDatagramWithCompletionHandler_);
  }
  else if (internal->_readHandlerWithOptions)
  {
    MEMORY[0x1F4181798](self, sel_readDatagramsWithCompletionHandler_);
  }
  else
  {
    id v4 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = self;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "<%@> does not have readHandler!", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)sendMetadata
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (internal->_hasMetadata)
  {
    uint64_t v4 = [(NSMutableArray *)internal->_sendingMetadata count];
    if (v4)
    {
      unint64_t v5 = v4;
      uint64_t v6 = self->_internal;
      if (v6->_pathEvaluator)
      {
        unsigned int v7 = os_channel_available_slot_count();
        if (v7)
        {
          if (v5 <= v7)
          {
            unint64_t v9 = v5;
          }
          else
          {
            unint64_t v9 = v7;
            $C835DF2C905B2D2BE81B7C33CDF61FEE v10 = +[IDSTransportLog IDSDataChannels];
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218496;
              *(void *)&uint8_t buf[4] = v5;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v9;
              *(_WORD *)&unsigned char buf[22] = 2048;
              *(void *)&buf[24] = v9;
              _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "have metadata %lu to send to daemon but only %lu slots - sending just %lu", buf, 0x20u);
            }
          }
          uint64_t v21 = 0;
          *(void *)&long long v8 = 138412546;
          long long v36 = v8;
          while (1)
          {
            long long v22 = -[NSMutableArray objectAtIndex:](self->_internal->_sendingMetadata, "objectAtIndex:", v21, v36);
            uint64_t v23 = [v22 pointerValue];

            *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v43 = v24;
            long long v44 = v24;
            *(_OWORD *)buf = v24;
            *(_OWORD *)&uint8_t buf[16] = v24;
            os_channel_get_next_slot();
            int64_t v25 = *(void *)(v23 + 16);
            if (v25 <= *(unsigned __int16 *)&buf[2])
            {
              *(_WORD *)buf = 0;
              *(_WORD *)&buf[2] = v25;
              memcpy(*(void **)&buf[16], *(const void **)v23, v25);
              os_channel_set_slot_properties();
              int v28 = os_channel_advance_slot();
              if (v28)
              {
                int v29 = v28;
                [(IDSDatagramChannel *)self osChannelInfoLog];
                id v30 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)id v38 = 67109120;
                  LODWORD(v39) = v29;
                  _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "advance_slot failed for metadata write %d", v38, 8u);
                }
              }
              if (!self->_internal->_verboseFunctionalLogging) {
                goto LABEL_35;
              }
              __int16 v26 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v31 = *(void *)(v23 + 16);
                *(_DWORD *)id v38 = v36;
                double v39 = self;
                __int16 v40 = 2048;
                uint64_t v41 = v31;
                _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "<%@> write details: metadataSize %ld", v38, 0x16u);
              }
            }
            else
            {
              __int16 v26 = +[IDSTransportLog IDSDataChannels];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                id v27 = *(IDSDatagramChannel **)(v23 + 16);
                *(_DWORD *)id v38 = 134218240;
                double v39 = v27;
                __int16 v40 = 2048;
                uint64_t v41 = *(unsigned __int16 *)&buf[2];
                _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "have metadata %lu to send to daemon but not enough bytes %lu in slot", v38, 0x16u);
              }
            }

LABEL_35:
            _IDSLinkPacketBufferRelease();
            if (v9 == ++v21)
            {
              int v32 = os_channel_sync();
              if (v32)
              {
                int v33 = v32;
                [(IDSDatagramChannel *)self osChannelInfoLog];
                id v34 = +[IDSTransportLog IDSDataChannels];
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v33;
                  _os_log_impl(&dword_19190B000, v34, OS_LOG_TYPE_DEFAULT, "os_channel_sync for TX failed %d", buf, 8u);
                }
              }
              goto LABEL_43;
            }
          }
        }
        [(IDSDatagramChannel *)self osChannelInfoLog];
        ssize_t v20 = +[IDSTransportLog IDSDataChannels];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v5;
          _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "have metadata %lu to send to daemon but no slots", buf, 0xCu);
        }
      }
      else
      {
        if (!v6->_connection)
        {
          LODWORD(v9) = 0;
          goto LABEL_43;
        }
        if (v6->_connected)
        {
          uint64_t v11 = 0;
          uint64_t v12 = *MEMORY[0x1E4F38C58];
          do
          {
            unint64_t v13 = [(NSMutableArray *)self->_internal->_sendingMetadata objectAtIndex:v11];
            unint64_t v14 = (uint64_t *)[v13 pointerValue];

            uint64_t v15 = sub_191982E44(v14, 0);
            unsigned int v16 = self->_internal;
            if (v16->_verboseFunctionalLogging)
            {
              uint64_t v17 = +[IDSLogging IDSDataChannels];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v18 = v14[2];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = self;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v18;
                _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "<%@> write details: metadataSize %ld", buf, 0x16u);
              }

              unsigned int v16 = self->_internal;
            }
            connection = v16->_connection;
            completion[0] = MEMORY[0x1E4F143A8];
            completion[1] = 3221225472;
            completion[2] = sub_191A093F4;
            completion[3] = &unk_1E572D2D8;
            void completion[4] = self;
            nw_connection_send(connection, v15, v12, 1, completion);

            ++v11;
          }
          while (v5 != v11);
          LODWORD(v9) = v5;
LABEL_43:
          -[NSMutableArray removeObjectsInRange:](self->_internal->_sendingMetadata, "removeObjectsInRange:", 0, v9);
        }
        else
        {
          id v35 = +[IDSLogging IDSDataChannels];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl(&dword_19190B000, v35, OS_LOG_TYPE_DEFAULT, "<%@> sendMetadata: not connected yet - tearing down or waiting for -start", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void)_buildPacketBufferMetaData:(id *)a3
{
  int64_t var2 = a3->var2;
  IDSLinkPacketBufferAddBufferStart();
  *a3->int var0 = BYTE1(var2);
  a3->var0[1] = var2;
}

- (void)setChannelPreferences:(id)a3
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v140 = 0;
  char v139 = -1;
  char v138 = 0;
  unint64_t v5 = +[IDSLogging IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "<%@> setChannelPreferences dictionary: %@", buf, 0x16u);
  }

  uint64_t v6 = [v4 objectForKey:@"preference-pre-connection-data"];

  if (v6)
  {
    internal = self->_internal;
    if (!internal->_receivedPreConnectionData) {
      internal->_waitForPreConnectionDataForConnected = 1;
    }
    long long v8 = [v4 objectForKey:@"preference-pre-connection-data"];
    unint64_t v9 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_internal->_waitForPreConnectionDataForConnected) {
        $C835DF2C905B2D2BE81B7C33CDF61FEE v10 = @"YES";
      }
      else {
        $C835DF2C905B2D2BE81B7C33CDF61FEE v10 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&unsigned char buf[22] = 2112;
      *(void *)&buf[24] = v10;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferencePreConnectionDataKey - %@, _waitForPreConnectionDataForConnected? %@", buf, 0x20u);
    }

    uint64_t v11 = self->_internal;
    if (!v11->_connected)
    {
      preConnectionData = v11->_preConnectionData;
      if (preConnectionData)
      {
        v11->_preConnectionData = 0;
      }
      uint64_t v13 = [v8 copy];
      unint64_t v14 = self->_internal;
      uint64_t v15 = v14->_preConnectionData;
      v14->_preConnectionData = (NSData *)v13;

      unsigned int v16 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "<%@> client channel connection is not ready. Wait to send preConnectionData", buf, 0xCu);
      }

      uint64_t v17 = 0;
      uint64_t v18 = 0;
      id v19 = 0;
      goto LABEL_134;
    }
  }
  else
  {
    long long v8 = 0;
  }
  ssize_t v20 = [v4 objectForKey:@"preference-needs-encryption-info"];
  if (v20)
  {
    BOOL v21 = 1;
  }
  else
  {
    long long v22 = [v4 objectForKey:@"preference-needs-force-update-encryption-info"];
    BOOL v21 = v22 != 0;
  }
  if (v6) {
    int v23 = 1;
  }
  else {
    int v23 = v21;
  }
  long long v24 = [v4 objectForKey:@"preference-default-link-selection"];

  if (v24)
  {
    int64_t v25 = [v4 objectForKey:@"preference-default-link-selection"];
    char v140 = [v25 intValue];

    __int16 v26 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v140;
      _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceDefaultLinkSelectionKey - linkID:%d", buf, 0x12u);
    }

    int v23 = 1;
  }
  id v27 = [v4 objectForKey:@"preference-baseband-registration"];

  int v28 = (void *)MEMORY[0x1E4F6AD18];
  if (v27)
  {
    int v29 = [v4 objectForKey:@"preference-baseband-registration"];
    id v30 = v28;
    uint64_t v31 = [v29 objectForKey:*v28];
    int v32 = [v31 intValue];

    int v33 = [v29 objectForKey:@"baseband-registration-key"];
    LODWORD(v136) = [v33 unsignedIntValue];

    id v34 = [v29 objectForKey:@"baseband-notification-operation-key"];
    int v35 = [v34 unsignedIntValue];

    long long v36 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = (char)v32;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v136;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v35;
      _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceBasebandRegistrationKey - linkID:%d, reg_key:%u registerOperation:%u", buf, 0x1Eu);
    }

    int v23 = 1;
  }
  else
  {
    id v30 = (void *)MEMORY[0x1E4F6AD18];
    LODWORD(v136) = 0;
    int v32 = 0;
    int v35 = 0;
  }
  LODWORD(v133) = v35;
  id v37 = [v4 objectForKey:@"preference-baseband-queue-flush"];

  if (v37)
  {
    id v38 = [v4 objectForKey:@"preference-baseband-queue-flush"];
    double v39 = [v38 objectForKey:*v30];
    LODWORD(v134) = [v39 intValue];

    __int16 v40 = [v38 objectForKey:@"preference-baseband-queue-flush-payload"];
    uint64_t v41 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v40;
      _os_log_impl(&dword_19190B000, v41, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceBasebandQueueFlushKey - %@", buf, 0x16u);
    }

    int v23 = 1;
  }
  else
  {
    __int16 v40 = 0;
    LODWORD(v134) = 0;
  }
  int v42 = [v4 objectForKey:@"preference-discard-link-ids"];

  if (v42)
  {
    uint64_t v132 = [v4 objectForKey:@"preference-discard-link-ids"];
    long long v43 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v132;
      _os_log_impl(&dword_19190B000, v43, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceDiscardLinkIDsKey - %@", buf, 0x16u);
    }

    int v23 = 1;
  }
  else
  {
    uint64_t v132 = 0;
  }
  LODWORD(v135) = v32;
  long long v44 = [v4 objectForKey:@"preference-update-qos"];

  id v137 = v40;
  if (v44)
  {
    uint64_t v45 = [v4 objectForKey:@"preference-update-qos"];
    unsigned int v46 = [v45 objectForKey:*v30];
    int v131 = [v46 intValue];

    id v47 = [v45 objectForKey:@"preference-update-qos-is-good"];
    unsigned __int8 v48 = [v47 unsignedIntValue];
    int v49 = v48;

    uint64_t v50 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = @"YES";
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      if (!v48) {
        id v51 = @"NO";
      }
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = (char)v131;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v51;
      _os_log_impl(&dword_19190B000, v50, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceUpdateQualityOfServiceKey - LinkID: %d, %@", buf, 0x1Cu);
    }

    int v23 = 1;
  }
  else
  {
    int v49 = 0;
    int v131 = 0;
  }
  uint64_t v52 = [v4 objectForKey:@"preference-query-information"];

  if (v52)
  {
    id v53 = [v4 objectForKey:@"preference-query-information"];
    unsigned __int8 v54 = [v53 unsignedIntValue];
    int v55 = v54;
    char v139 = v54;

    int v56 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v55;
      _os_log_impl(&dword_19190B000, v56, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceQueryInformationKey - queryType: %d", buf, 0x12u);
    }

    int v23 = 1;
  }
  else
  {
    int v55 = 255;
  }
  int v128 = v55;
  __int16 v57 = [v4 objectForKey:@"preference-max-bitrate"];

  if (v57)
  {
    uint64_t v58 = [v4 objectForKey:@"preference-max-bitrate"];
    char v59 = [v58 objectForKey:*v30];
    int v60 = [v59 intValue];

    __int16 v61 = [v58 objectForKey:@"max-bitrate-key"];
    int v130 = [v61 unsignedIntValue];

    int v62 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v130;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = (char)v60;
      _os_log_impl(&dword_19190B000, v62, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceSetMaxBitrateKey - maxBitrate: %u for LinkID: %d", buf, 0x18u);
    }

    int v23 = 1;
  }
  else
  {
    int v60 = 0;
    int v130 = 100000;
  }
  __int16 v63 = [v4 objectForKey:@"debug-data-type-key"];

  if (v63)
  {
    long long v64 = [v4 objectForKey:@"debug-data-type-key"];
    char v138 = [v64 intValue];

    uint64_t v129 = [v4 objectForKey:@"debug-data-key"];
    int v23 = 1;
  }
  else
  {
    uint64_t v129 = 0;
  }
  unint64_t v65 = [v4 objectForKey:@"preference-remote-device-version-key"];

  if (v65)
  {
    int v126 = v49;
    int v66 = [v4 objectForKey:@"preference-remote-device-version-key"];
    unsigned int v67 = [v66 intValue];

    __int16 v68 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v67;
      _os_log_impl(&dword_19190B000, v68, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceRemoteDeviceVersionKey - remoteDeviceVersion: %u", buf, 0x12u);
    }
  }
  else
  {
    if (!v23)
    {
      id v19 = v137;
      uint64_t v18 = (void *)v132;
      uint64_t v17 = (void *)v129;
      goto LABEL_134;
    }
    int v126 = v49;
    unsigned int v67 = 0;
  }
  uint64_t v69 = _IDSLinkPacketBufferCreate();
  unint64_t v149 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v70 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v70 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v70;
  *(_OWORD *)&uint8_t buf[16] = v70;
  v127 = (void *)v69;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  __int16 v71 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v72 = [v71 isInternalInstall];

  if (v72 && (byte_1E92DFC10 & 1) == 0)
  {
    byte_1E92DFC10 = 1;
    pid_t v73 = getpid();
    LODWORD(v146) = bswap32(v73);
    int v74 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412546;
      int v142 = self;
      __int16 v143 = 1024;
      *(_DWORD *)unsigned int v144 = v73;
      _os_log_impl(&dword_19190B000, v74, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_ProcessIDKey - %d", v141, 0x12u);
    }

    IDSByteBufferWriteField();
  }
  if (v140) {
    IDSByteBufferWriteField();
  }
  if (v67)
  {
    __int16 v75 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412546;
      int v142 = self;
      __int16 v143 = 1024;
      *(_DWORD *)unsigned int v144 = v67;
      _os_log_impl(&dword_19190B000, v75, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_RemoteDeviceVersionKey remoteDeviceVersion: %u", v141, 0x12u);
    }

    *(_DWORD *)__int16 v141 = bswap32(v67);
    IDSByteBufferWriteField();
  }
  if (v136)
  {
    v141[0] = v135;
    v141[1] = v133;
    v141[2] = BYTE3(v136);
    v141[3] = BYTE2(v136);
    LOBYTE(v142) = BYTE1(v136);
    BYTE1(v142) = v136;
    IDSByteBufferWriteField();
  }
  id v19 = v137;
  uint64_t v18 = (void *)v132;
  if (v137)
  {
    LOBYTE(v146) = 0;
    unint64_t v76 = [v137 count];
    char v77 = -1;
    if (v76 < 0xFF) {
      char v77 = v76;
    }
    LOBYTE(v146) = v77;
    int v78 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412546;
      int v142 = self;
      __int16 v143 = 1024;
      *(_DWORD *)unsigned int v144 = v146;
      _os_log_impl(&dword_19190B000, v78, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_BasebandQueueFlushPayloadSizeKey %u", v141, 0x12u);
    }

    uint64_t v79 = IDSByteBufferWriteField();
    MEMORY[0x1F4188790](v79);
    uint64_t v81 = (char *)&v120 - v80;
    memset((char *)&v120 - v80, 170, v82);
    *uint64_t v81 = v134;
    if ((_BYTE)v146)
    {
      int v121 = &v120;
      int v122 = v60;
      unsigned int v123 = v8;
      uint64_t v124 = self;
      id v125 = v4;
      unint64_t v83 = 0;
      v120 = v81;
      unint64_t v84 = v81 + 1;
      uint64_t v136 = *MEMORY[0x1E4F6AD70];
      uint64_t v135 = *MEMORY[0x1E4F6AD78];
      uint64_t v134 = *MEMORY[0x1E4F6AD68];
      uint64_t v133 = *MEMORY[0x1E4F6AD80];
      uint64_t v85 = *MEMORY[0x1E4F6AD60];
      do
      {
        unsigned int v86 = objc_msgSend(v19, "objectAtIndexedSubscript:", v83, v120, v121);
        long long v87 = [v86 objectForKey:v136];
        char v88 = [v87 intValue];

        int v89 = [v86 objectForKey:v135];
        int v90 = [v89 intValue];

        v91 = [v86 objectForKey:v134];
        char v92 = [v91 intValue];

        id v93 = [v86 objectForKey:v133];
        __int16 v94 = [v93 intValue];

        v95 = [v86 objectForKey:v85];
        __int16 v96 = [v95 intValue];

        *unint64_t v84 = v88;
        v84[1] = HIBYTE(v90);
        v84[2] = BYTE2(v90);
        v84[3] = BYTE1(v90);
        v84[4] = v90;
        id v19 = v137;
        v84[5] = v92;
        v84[6] = HIBYTE(v94);
        v84[7] = v94;
        v84[8] = HIBYTE(v96);
        v84[9] = v96;
        v84 += 10;

        ++v83;
      }
      while (v83 < v146);
      id v4 = v125;
      self = v124;
      long long v8 = v123;
      uint64_t v18 = (void *)v132;
      LOBYTE(v60) = v122;
    }
    IDSByteBufferWriteField();
  }
  v97 = v8;
  char v98 = v60;
  if (v18)
  {
    __int16 v147 = 0;
    uint64_t v146 = 0;
    if ([v18 count])
    {
      uint64_t v99 = 0;
      while (v99 != 10)
      {
        int v100 = [v18 objectAtIndex:v99];
        *((unsigned char *)&v146 + v99) = [v100 intValue];

        if ([v18 count] <= (unint64_t)++v99) {
          goto LABEL_102;
        }
      }
      unsigned int v101 = +[IDSLogging IDSDataChannels];
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v141 = 138412546;
        int v142 = self;
        __int16 v143 = 1024;
        *(_DWORD *)unsigned int v144 = 10;
        _os_log_impl(&dword_19190B000, v101, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_DiscardLinkIDsKey the maximum of links is %d", v141, 0x12u);
      }
    }
LABEL_102:
    IDSByteBufferWriteField();
  }
  if (v97)
  {
    unsigned __int8 v102 = [v97 length];
    LOBYTE(v146) = v102;
    int v103 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412546;
      int v142 = self;
      __int16 v143 = 1024;
      *(_DWORD *)unsigned int v144 = v102;
      _os_log_impl(&dword_19190B000, v103, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_PreConnectionDataSizeKey %u", v141, 0x12u);
    }

    IDSByteBufferWriteField();
    int v104 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412546;
      int v142 = self;
      __int16 v143 = 2112;
      *(void *)unsigned int v144 = v97;
      _os_log_impl(&dword_19190B000, v104, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_PreConnectionDataKey %@", v141, 0x16u);
    }

    [v97 bytes];
    IDSByteBufferWriteField();
  }
  char v105 = v131;
  if ((_BYTE)v131)
  {
    LOBYTE(v146) = v131;
    int v106 = v126;
    BYTE1(v146) = v126;
    int v107 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      int v108 = @"YES";
      *(_DWORD *)__int16 v141 = 138412802;
      int v142 = self;
      if (!v106) {
        int v108 = @"NO";
      }
      __int16 v143 = 2112;
      *(void *)unsigned int v144 = v108;
      *(_WORD *)&v144[8] = 1024;
      int v145 = v105;
      _os_log_impl(&dword_19190B000, v107, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_UpdateQoSIsGoodKey IsGood:%@ LinkID:%d", v141, 0x1Cu);
    }

    IDSByteBufferWriteField();
  }
  int v109 = v130;
  if (!v128)
  {
    IDSByteBufferWriteField();
    int v110 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412290;
      int v142 = self;
      _os_log_impl(&dword_19190B000, v110, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_QueryRSSI", v141, 0xCu);
    }

    IDSByteBufferWriteField();
  }
  if (v109 != 100000)
  {
    LOBYTE(v146) = v98;
    BYTE1(v146) = HIBYTE(v109);
    BYTE2(v146) = BYTE2(v109);
    BYTE3(v146) = BYTE1(v109);
    BYTE4(v146) = v109;
    int v111 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412802;
      int v142 = self;
      __int16 v143 = 1024;
      *(_DWORD *)unsigned int v144 = v109;
      *(_WORD *)&v144[4] = 1024;
      *(_DWORD *)&v144[6] = v98;
      _os_log_impl(&dword_19190B000, v111, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_MaxBitrateKey maxBitrate:%u LinkID:%d", v141, 0x18u);
    }

    IDSByteBufferWriteField();
  }
  uint64_t v112 = [v4 objectForKey:@"preference-needs-encryption-info"];

  uint64_t v17 = (void *)v129;
  long long v8 = v97;
  if (v112)
  {
    LOBYTE(v146) = 1;
    uint64_t v113 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412290;
      int v142 = self;
      _os_log_impl(&dword_19190B000, v113, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceNeedsEncryptionInfoKey - we'll request the encryption info", v141, 0xCu);
    }

    IDSByteBufferWriteField();
  }
  id v114 = [v4 objectForKey:@"preference-needs-force-update-encryption-info"];

  if (v114)
  {
    uint64_t v115 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v141 = 138412290;
      int v142 = self;
      _os_log_impl(&dword_19190B000, v115, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_ForceUpdateEncryptionInfoKey - we'll update the encryption info.", v141, 0xCu);
    }

    v141[0] = 1;
    IDSByteBufferWriteField();
  }
  if (v17)
  {
    IDSByteBufferWriteField();
    id v116 = v17;
    [v116 bytes];
    [v116 length];
    IDSByteBufferWriteField();
  }
  v117 = v127;
  void v127[2] = *(void *)&buf[16] - *v127;
  IDSByteBufferRelease();
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v117];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  v119 = [MEMORY[0x1E4F29238] valueWithPointer:v117];
  [(NSMutableArray *)sendingMetadata addObject:v119];

  [(IDSDatagramChannel *)self sendMetadata];
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_134:
}

- ($F113CFA26FA97A821AAEB04A6CDF9B12)_setWiFiAssist:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "<%@>: setWiFiAssist: %@", buf, 0x16u);
  }

  unsigned int v7 = ($F113CFA26FA97A821AAEB04A6CDF9B12 *)_IDSLinkPacketBufferCreate();
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v8;
  *(_OWORD *)&uint8_t buf[16] = v8;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  IDSByteBufferWriteField();
  if ((char *)*(void *)&buf[16] > v7->var0) {
    v7->int64_t var2 = *(void *)&buf[16] - (unint64_t)v7->var0;
  }
  IDSByteBufferRelease();
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v7];
  return v7;
}

- (void)setWiFiAssist:(BOOL)a3
{
  id v4 = [(IDSDatagramChannel *)self _setWiFiAssist:a3];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithPointer:v4];
  [(NSMutableArray *)sendingMetadata addObject:v6];

  [(IDSDatagramChannel *)self sendMetadata];
  p_writeLock = &self->_internal->_writeLock;

  os_unfair_lock_unlock(p_writeLock);
}

- (void)startActiveProbingWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F6B5A8] serializeSessionInfoMetadata:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    unsigned int v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      long long v8 = "<%@>: startActiveProbingWithOptions: invalid probing Data, return";
      unint64_t v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)[v5 length] > 0x1000)
  {
    unsigned int v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v6 length];
      long long v8 = "<%@>: startActiveProbingWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      unint64_t v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v11 = v6;
  [v11 bytes];
  uint64_t v12 = (void *)_IDSLinkPacketBufferCreate();
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&uint8_t buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  unint64_t v14 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = [v11 length];
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: startActiveProbingWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  [v11 length];
  IDSByteBufferWriteField();
  v12[2] = *(void *)&buf[16] - *v12;
  IDSByteBufferRelease();
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v12];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  unsigned int v16 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
  [(NSMutableArray *)sendingMetadata addObject:v16];

  [(IDSDatagramChannel *)self sendMetadata];
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:
}

- (void)stopActiveProbingWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F6B5A8] serializeSessionInfoMetadata:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    unsigned int v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      long long v8 = "<%@>: stopActiveProbingWithOptions: invalid probing Data, return";
      unint64_t v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)[v5 length] > 0x1000)
  {
    unsigned int v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v6 length];
      long long v8 = "<%@>: stopActiveProbingWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      unint64_t v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v11 = v6;
  [v11 bytes];
  uint64_t v12 = (void *)_IDSLinkPacketBufferCreate();
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&uint8_t buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  unint64_t v14 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = [v11 length];
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: stopActiveProbingWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  [v11 length];
  IDSByteBufferWriteField();
  v12[2] = *(void *)&buf[16] - *v12;
  IDSByteBufferRelease();
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v12];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  unsigned int v16 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
  [(NSMutableArray *)sendingMetadata addObject:v16];

  [(IDSDatagramChannel *)self sendMetadata];
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F6B5A8] serializeSessionInfoMetadata:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    unsigned int v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      long long v8 = "<%@>: flushLinkProbingStatusWithOptions: invalid probing options, return";
      unint64_t v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)[v5 length] > 0x1000)
  {
    unsigned int v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v6 length];
      long long v8 = "<%@>: flushLinkProbingStatusWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      unint64_t v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v11 = v6;
  [v11 bytes];
  uint64_t v12 = (void *)_IDSLinkPacketBufferCreate();
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&uint8_t buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  unint64_t v14 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = [v11 length];
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: flushLinkProbingStatusWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  [v11 length];
  IDSByteBufferWriteField();
  v12[2] = *(void *)&buf[16] - *v12;
  IDSByteBufferRelease();
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v12];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  unsigned int v16 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
  [(NSMutableArray *)sendingMetadata addObject:v16];

  [(IDSDatagramChannel *)self sendMetadata];
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:
}

- (void)queryStatusWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F6B5A8] serializeSessionInfoMetadata:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    unsigned int v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      long long v8 = "<%@>: queryStatusWithOptions: invalid query options, return";
      unint64_t v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)[v5 length] > 0x1000)
  {
    unsigned int v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v6 length];
      long long v8 = "<%@>: queryStatusWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      unint64_t v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v11 = v6;
  [v11 bytes];
  uint64_t v12 = (void *)_IDSLinkPacketBufferCreate();
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&uint8_t buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  unint64_t v14 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = [v11 length];
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: queryStatusWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  [v11 length];
  IDSByteBufferWriteField();
  v12[2] = *(void *)&buf[16] - *v12;
  IDSByteBufferRelease();
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v12];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  unsigned int v16 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
  [(NSMutableArray *)sendingMetadata addObject:v16];

  [(IDSDatagramChannel *)self sendMetadata];
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:
}

- (void)setUPlusOneMode:(BOOL)a3 isInitiator:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = (void *)_IDSLinkPacketBufferCreate();
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v14 = v8;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  unint64_t v9 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v10 = @"NO";
    if (v5) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    unsigned int v16 = self;
    uint64_t v18 = v11;
    __int16 v17 = 2112;
    if (v4) {
      uint32_t v10 = @"YES";
    }
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "<%@>: setUPlusOneMode: %@ isInitiator: %@", buf, 0x20u);
  }

  buf[0] = v5;
  buf[1] = v4;
  IDSByteBufferWriteField();
  if (*v7 < 0xAAAAAAAAAAAAAAAALL) {
    v7[2] = 0xAAAAAAAAAAAAAAAALL - *v7;
  }
  IDSByteBufferRelease();
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v7];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  long long v13 = [MEMORY[0x1E4F29238] valueWithPointer:v7];
  [(NSMutableArray *)sendingMetadata addObject:v13];

  [(IDSDatagramChannel *)self sendMetadata];
  os_unfair_lock_unlock(&self->_internal->_writeLock);
}

- (void)startMKMRecoveryForParticipantIDs:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    __int16 v27 = 2112;
    uint64_t v28 = (uint64_t)v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "<%@>: startMKMRecoveryForParticipantIDs: %@", buf, 0x16u);
  }

  if ([v4 count])
  {
    uint64_t v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
          *(void *)buf = [v12 unsignedLongLongValue];
          [v6 appendBytes:buf length:8];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v33 count:16];
      }
      while (v9);
    }

    if ((unint64_t)[v6 length] <= 0x1000)
    {
      uint64_t v6 = v6;
      [v6 bytes];
      uint64_t v15 = (void *)_IDSLinkPacketBufferCreate();
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v21 = v16;
      IDSByteBufferInitForWriteWithAllocatedSpace();
      __int16 v17 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v6 length];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = self;
        __int16 v27 = 2112;
        uint64_t v28 = (uint64_t)v7;
        __int16 v29 = 2112;
        id v30 = v6;
        __int16 v31 = 2048;
        uint64_t v32 = v18;
        _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "<%@>: startMKMRecoveryForParticipantIDs: %@, %@ size: %lu", buf, 0x2Au);
      }

      [v6 length];
      IDSByteBufferWriteField();
      v15[2] = 0xAAAAAAAAAAAAAAAALL - *v15;
      IDSByteBufferRelease();
      [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v15];
      os_unfair_lock_lock(&self->_internal->_writeLock);
      sendingMetadata = self->_internal->_sendingMetadata;
      id v20 = [MEMORY[0x1E4F29238] valueWithPointer:v15];
      [(NSMutableArray *)sendingMetadata addObject:v20];

      [(IDSDatagramChannel *)self sendMetadata];
      os_unfair_lock_unlock(&self->_internal->_writeLock);
    }
    else
    {
      long long v13 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v6 length];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        __int16 v27 = 2048;
        uint64_t v28 = v14;
        _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "<%@>: startMKMRecoveryForParticipantIDs: metadata size: %lu, greater than max allowed sent size, return", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v6 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "<%@>: startMKMRecoveryForParticipantIDs: invalid participantIDs size", buf, 0xCu);
    }
  }
}

- (void)requestSessionInfoWithOptions:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F6B5A8] serializeSessionInfoMetadata:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    if ((unint64_t)[v5 length] <= 0x1000)
    {
      id v18 = v6;
      [v18 bytes];
      __int16 v19 = (void *)_IDSLinkPacketBufferCreate();
      IDSByteBufferInitForWriteWithAllocatedSpace();
      id v20 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412803;
        long long v24 = self;
        __int16 v25 = 2113;
        id v26 = v4;
        __int16 v27 = 2048;
        uint64_t v28 = [v18 length];
        _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "%@: requestSessionInfoWithOptions: %{private}@ size: %lu", buf, 0x20u);
      }

      [v18 length];
      IDSByteBufferWriteField();
      v19[2] = 0xAAAAAAAAAAAAAAAALL - *v19;
      IDSByteBufferRelease();
      [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v19];
      os_unfair_lock_lock(&self->_internal->_writeLock);
      sendingMetadata = self->_internal->_sendingMetadata;
      long long v22 = [MEMORY[0x1E4F29238] valueWithPointer:v19];
      [(NSMutableArray *)sendingMetadata addObject:v22];

      [(IDSDatagramChannel *)self sendMetadata];
      os_unfair_lock_unlock(&self->_internal->_writeLock);
    }
    else if (self->_internal->_eventHandler)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", @"The serialized metadata was greater than the max slot size allowed to send over the channel", *MEMORY[0x1E4F28588], 0);
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v10 = (void *)[v9 initWithDomain:*MEMORY[0x1E4F6ACF0] code:8 userInfo:v8];
      id eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
      v29[0] = @"event-type";
      v29[1] = @"error-key";
      v30[0] = &unk_1EE28B508;
      v30[1] = v10;
      uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
      long long v13 = v30;
      uint64_t v14 = v29;
LABEL_7:
      __int16 v17 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:2];
      eventHandler[2](eventHandler, v17);
    }
  }
  else if (self->_internal->_eventHandler)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v8 = objc_msgSend(v15, "initWithObjectsAndKeys:", @"Could not serialize provided metadata.", *MEMORY[0x1E4F28588], 0);
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = (void *)[v16 initWithDomain:*MEMORY[0x1E4F6ACF0] code:8 userInfo:v8];
    id eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
    v31[0] = @"event-type";
    v31[1] = @"error-key";
    v32[0] = &unk_1EE28B508;
    v32[1] = v10;
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    long long v13 = v32;
    uint64_t v14 = v31;
    goto LABEL_7;
  }
}

- (void)requestStatsWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F6B5A8] serializeSessionInfoMetadata:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    id v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      uint64_t v8 = "<%@>: requestStatsWithOptions: invalid stats data, return";
      id v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)[v5 length] > 0x1000)
  {
    id v7 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = [v6 length];
      uint64_t v8 = "<%@>: requestStatsWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      id v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v11 = v6;
  [v11 bytes];
  uint64_t v12 = (void *)_IDSLinkPacketBufferCreate();
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&uint8_t buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  uint64_t v14 = +[IDSTransportLog IDSDataChannels];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = [v11 length];
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: requestStatsWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  [v11 length];
  IDSByteBufferWriteField();
  v12[2] = *(void *)&buf[16] - *v12;
  IDSByteBufferRelease();
  [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v12];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  id v16 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
  [(NSMutableArray *)sendingMetadata addObject:v16];

  [(IDSDatagramChannel *)self sendMetadata];
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:
}

- (void)_reportDictionary:(id)a3 forKey:(unsigned __int8)a4
{
  id v6 = a3;
  id v7 = (void *)_IDSLinkPacketBufferCreate();
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v14 = v8;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  id v9 = JWEncodeDictionary();

  if (objc_msgSend(v9, "length", v14) <= (unint64_t)(v7[1] - 3))
  {
    id v11 = v9;
    [v11 bytes];
    [v11 length];
    IDSByteBufferWriteField();
    v7[2] = 0xAAAAAAAAAAAAAAAALL - *v7;
    IDSByteBufferRelease();
    [(IDSDatagramChannel *)self _buildPacketBufferMetaData:v7];
    os_unfair_lock_lock(&self->_internal->_writeLock);
    sendingMetadata = self->_internal->_sendingMetadata;
    long long v13 = [MEMORY[0x1E4F29238] valueWithPointer:v7];
    [(NSMutableArray *)sendingMetadata addObject:v13];

    [(IDSDatagramChannel *)self sendMetadata];
    os_unfair_lock_unlock(&self->_internal->_writeLock);
  }
  else
  {
    uint32_t v10 = +[IDSLogging IDSDataChannels];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A41C3C(a4, v10);
    }
  }
}

- (void)reportMKIArrival:(id)a3 isLocallyGenerated:(BOOL)a4
{
  id v6 = a3;
  id v7 = NSNumber;
  if (qword_1E92DFC18 != -1) {
    dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
  }
  long long v8 = [v7 numberWithDouble:*(double *)&qword_1E92DFC20 * (double)mach_continuous_time()];
  id v9 = dispatch_get_global_queue(-32768, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_191A0C6D0;
  v12[3] = &unk_1E5729770;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  BOOL v15 = a4;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(v9, v12);
}

- (void)_reportMKIArrival:(id)a3 time:(id)a4 isLocallyGenerated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [a3 UUIDString];
  id v10 = +[IDSLogging IDSDataChannels];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "%@: reportMKIArrival: mki %@ at %@", buf, 0x20u);
  }

  id v11 = objc_msgSend(NSNumber, "numberWithBool:", v5, *MEMORY[0x1E4F6AD20], *MEMORY[0x1E4F6AD28], *MEMORY[0x1E4F6AD00], v8, v9);
  void v14[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:3];

  [(IDSDatagramChannel *)self _reportDictionary:v12 forKey:80];
}

- (void)reportFirstIncomingPacketTimeForMKI:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSNumber;
  if (qword_1E92DFC18 != -1) {
    dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
  }
  id v9 = [v8 numberWithDouble:*(double *)&qword_1E92DFC20 * (double)mach_continuous_time()];
  id v10 = dispatch_get_global_queue(-32768, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = sub_191A0C9AC;
  void v14[3] = &unk_1E5729680;
  v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  dispatch_async(v10, v14);
}

- (void)_reportFirstIncomingPacketTimeForMKI:(id)a3 time:(id)a4 participantID:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 UUIDString];
  id v11 = +[IDSLogging IDSDataChannels];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v17 = self;
    __int16 v18 = 2112;
    __int16 v19 = v10;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = [v9 unsignedLongLongValue];
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "%@: reportFirstIncomingPacketTimeForMKI: first incoming packet for mki %@ at %@ for participantID: %llu", buf, 0x2Au);
  }

  uint64_t v12 = *MEMORY[0x1E4F6AD28];
  v14[0] = *MEMORY[0x1E4F6AD48];
  v14[1] = v12;
  v15[0] = v8;
  v15[1] = v10;
  void v14[2] = *MEMORY[0x1E4F6AD50];
  v15[2] = v9;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  [(IDSDatagramChannel *)self _reportDictionary:v13 forKey:78];
}

- (void)reportFirstOutgoingPacketTimeForMKI:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSNumber;
  if (qword_1E92DFC18 != -1) {
    dispatch_once(&qword_1E92DFC18, &unk_1EE2470C8);
  }
  id v9 = [v8 numberWithDouble:*(double *)&qword_1E92DFC20 * (double)mach_continuous_time()];
  id v10 = dispatch_get_global_queue(-32768, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = sub_191A0CC88;
  void v14[3] = &unk_1E5729680;
  v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  dispatch_async(v10, v14);
}

- (void)_reportFirstOutgoingPacketTimeForMKI:(id)a3 time:(id)a4 participantID:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 UUIDString];
  id v11 = +[IDSLogging IDSDataChannels];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v17 = self;
    __int16 v18 = 2112;
    __int16 v19 = v10;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = [v9 unsignedLongLongValue];
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "%@: reportFirstOutgoingPacketTimeForMKI: first outgoing packet for mki %@ at %@ for participantID: %llu", buf, 0x2Au);
  }

  uint64_t v12 = *MEMORY[0x1E4F6AD28];
  v14[0] = *MEMORY[0x1E4F6AD48];
  v14[1] = v12;
  v15[0] = v8;
  v15[1] = v10;
  void v14[2] = *MEMORY[0x1E4F6AD50];
  v15[2] = v9;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  [(IDSDatagramChannel *)self _reportDictionary:v13 forKey:79];
}

- (void)reportEvent:(id)a3 forLinkID:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  _DWORD v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F6AD18];
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedChar:v4];
  v10[1] = *MEMORY[0x1E4F6ACF8];
  v11[0] = v8;
  v11[1] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(IDSDatagramChannel *)self _reportDictionary:v9 forKey:81];
}

- (void)reportLastPacketReceivedTime:(double)a3 lastPacketSentTime:(double)a4 linkID:(unsigned __int8)a5
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F6AD18];
  id v8 = [NSNumber numberWithUnsignedChar:a5];
  v13[0] = v8;
  v12[1] = *MEMORY[0x1E4F6AD08];
  id v9 = [NSNumber numberWithDouble:a3];
  v13[1] = v9;
  v12[2] = *MEMORY[0x1E4F6AD10];
  id v10 = [NSNumber numberWithDouble:a4];
  void v13[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  [(IDSDatagramChannel *)self _reportDictionary:v11 forKey:83];
}

- (void)generateMetadataWithDatagramInfo:(id)a3 options:(id *)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 byteBuffer:(id *)a7
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4 || a3.var0)
  {
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    if (a4)
    {
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 8) != 0)
      {
        IDSByteBufferWriteField();
        unsigned int var0 = a4->var0;
        if ((a4->var0 & 1) == 0)
        {
LABEL_6:
          if ((var0 & 0x10) == 0) {
            goto LABEL_7;
          }
          goto LABEL_11;
        }
      }
      else if ((var0 & 1) == 0)
      {
        goto LABEL_6;
      }
      *(void *)buf = bswap64(a4->var1);
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 0x10) == 0)
      {
LABEL_7:
        if ((var0 & 2) == 0) {
          goto LABEL_19;
        }
        goto LABEL_12;
      }
LABEL_11:
      *(_WORD *)buf = bswap32(a4->var2) >> 16;
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 2) == 0) {
        goto LABEL_19;
      }
LABEL_12:
      p_uint64_t var4 = &a4->var4;
      if (a4->var4 >= 1)
      {
        if (a4->var4 >= 0xDu) {
          *p_uint64_t var4 = 12;
        }
        IDSByteBufferWriteField();
        memset(buf, 170, sizeof(buf));
        if (*p_var4 >= 1)
        {
          uint64_t v10 = *p_var4;
          var5 = a4->var5;
          uint64_t v12 = buf;
          do
          {
            unsigned int v13 = *var5++;
            *(_WORD *)uint64_t v12 = bswap32(v13) >> 16;
            v12 += 2;
            --v10;
          }
          while (v10);
        }
        IDSByteBufferWriteField();
        unsigned int var0 = a4->var0;
      }
LABEL_19:
      if ((var0 & 4) != 0)
      {
        buf[0] = 1;
        IDSByteBufferWriteField();
        unsigned int var0 = a4->var0;
        if ((a4->var0 & 0x40) == 0)
        {
LABEL_21:
          if ((var0 & 0x80) == 0) {
            goto LABEL_22;
          }
          goto LABEL_33;
        }
      }
      else if ((var0 & 0x40) == 0)
      {
        goto LABEL_21;
      }
      *(_WORD *)buf = bswap32(a4->var7) >> 16;
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 0x80) == 0)
      {
LABEL_22:
        if ((var0 & 0x100) == 0) {
          goto LABEL_23;
        }
        goto LABEL_34;
      }
LABEL_33:
      buf[0] = 1;
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 0x100) == 0)
      {
LABEL_23:
        if ((var0 & 0x40000) == 0) {
          goto LABEL_24;
        }
        goto LABEL_35;
      }
LABEL_34:
      buf[0] = 1;
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 0x40000) == 0)
      {
LABEL_24:
        if ((var0 & 0x200) == 0) {
          goto LABEL_25;
        }
        goto LABEL_36;
      }
LABEL_35:
      *(_OWORD *)buf = *(_OWORD *)a4->var13;
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 0x200) == 0)
      {
LABEL_25:
        if ((var0 & 0x400) == 0) {
          goto LABEL_26;
        }
        goto LABEL_37;
      }
LABEL_36:
      *(void *)buf = bswap64(a4->var10);
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 0x400) == 0)
      {
LABEL_26:
        if ((var0 & 0x8000) == 0) {
          goto LABEL_27;
        }
        goto LABEL_38;
      }
LABEL_37:
      buf[0] = 1;
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 0x8000) == 0)
      {
LABEL_27:
        if ((var0 & 0x10000) == 0) {
          goto LABEL_28;
        }
        goto LABEL_41;
      }
LABEL_38:
      id v14 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t var12 = a4->var12;
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = var12;
        _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "storing encryption sequence number: %llu (*Client -> IDSD)", buf, 0xCu);
      }

      *(void *)buf = bswap64(a4->var12);
      IDSByteBufferWriteField();
      unsigned int var0 = a4->var0;
      if ((a4->var0 & 0x10000) == 0)
      {
LABEL_28:
        if ((var0 & 0x20000) == 0) {
          return;
        }
        goto LABEL_29;
      }
LABEL_41:
      buf[0] = 1;
      IDSByteBufferWriteField();
      if ((a4->var0 & 0x20000) == 0) {
        return;
      }
LABEL_29:
      buf[0] = 1;
      IDSByteBufferWriteField();
    }
  }
}

- (void)osChannelInfoLog
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (internal)
  {
    if (internal->_osChannelRXRing && internal->_osChannelTXRing)
    {
      int v4 = os_channel_available_slot_count();
      int v5 = os_channel_available_slot_count();
      id v6 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 67109376;
        *(_DWORD *)unsigned int v13 = v4;
        *(_WORD *)&void v13[4] = 1024;
        *(_DWORD *)&v13[6] = v5;
        id v7 = "osChannelInfoLog: os_channel rx slot count %u tx slot count %u";
        id v8 = v6;
        uint32_t v9 = 14;
LABEL_10:
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
      }
    }
    else
    {
      id v6 = +[IDSTransportLog IDSDataChannels];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        osChannelTXRing = self->_internal->_osChannelTXRing;
        osChannelRXRing = self->_internal->_osChannelRXRing;
        int v12 = 134218240;
        *(void *)unsigned int v13 = osChannelRXRing;
        *(_WORD *)&v13[8] = 2048;
        id v14 = osChannelTXRing;
        id v7 = "osChannelInfoLog: os_channel ring is NULL (_osChannelRXRing %p, _osChannelTXRing %p)";
        id v8 = v6;
        uint32_t v9 = 22;
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v6 = +[IDSTransportLog IDSDataChannels];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      id v7 = "osChannelInfoLog: _internal is NULL.";
      id v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_10;
    }
  }
}

- (void)setPreferredDataPathType:(int64_t)a3
{
  self->_internal->_int64_t preferredDataPathType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsTimer, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end