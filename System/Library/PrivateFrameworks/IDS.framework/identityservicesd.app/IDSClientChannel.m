@interface IDSClientChannel
- (BOOL)clientReady;
- (BOOL)closed;
- (BOOL)connectWithTransportThread;
- (BOOL)hasMetadata;
- (BOOL)readDatagram:(const void *)a3 datagramSize:(unsigned int *)a4 metaData:(const void *)a5 metadataSize:(unsigned int *)a6;
- (BOOL)verboseFunctionalLogging;
- (BOOL)verbosePerformanceLogging;
- (BOOL)writable;
- (BOOL)writeBuffer:(char *)a3 bufferSize:(unsigned int)a4 metaData:(const void *)a5 metadataSize:(unsigned int)a6 moreComing:(BOOL)a7;
- (BOOL)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 metaData:(const void *)a5 metadataSize:(unsigned int)a6;
- (BOOL)writePacketBuffer:(id *)a3 metaData:(const void *)a4 metadataSize:(unsigned int)a5 moreComing:(BOOL)a6;
- (IDSClientChannel)initWithDestination:(id)a3;
- (NSMutableArray)cachedDataForClient;
- (NSString)destination;
- (NSUUID)uuid;
- (id)description;
- (id)packetBufferHandler;
- (id)readHandler;
- (id)writeHandler;
- (int)excessiveCachingCount;
- (int)excessiveCachingReportCounter;
- (int64_t)transportType;
- (unint64_t)clientUniquePID;
- (void)connectWithProtocoHandler;
- (void)dealloc;
- (void)invalidate;
- (void)osChannelInfoLog;
- (void)setCachedDataForClient:(id)a3;
- (void)setClientReady:(BOOL)a3;
- (void)setExcessiveCachingCount:(int)a3;
- (void)setExcessiveCachingReportCounter:(int)a3;
- (void)setPacketBufferHandler:(id)a3;
- (void)setReadHandler:(id)a3;
- (void)setUUID:(id)a3;
- (void)setVerboseFunctionalLogging:(BOOL)a3;
- (void)setVerbosePerformanceLogging:(BOOL)a3;
- (void)setWriteHandler:(id)a3;
@end

@implementation IDSClientChannel

- (IDSClientChannel)initWithDestination:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSClientChannel;
  v5 = [(IDSClientChannel *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    destination = v5->_destination;
    v5->_destination = v6;
  }
  return v5;
}

- (id)description
{
  destination = self->_destination;
  uuid = self->_uuid;
  id v5 = objc_retainBlock(self->_readHandler);
  id v6 = objc_retainBlock(self->_packetBufferHandler);
  id v7 = objc_retainBlock(self->_writeHandler);
  id v8 = objc_retainBlock(self->_connectHandler);
  objc_super v9 = v8;
  if (self->_hasMetadata) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  v11 = +[NSString stringWithFormat:@"IDSClientChannel %p destination %@ uuid %@ readHandler %p packetBufferHandler %p writeHandler %p connectHandler %p hasMetadata %@", self, destination, uuid, v5, v6, v7, v8, v10];

  return v11;
}

- (void)dealloc
{
  if (self->_osChannelAttributes)
  {
    os_channel_attr_destroy();
    self->_osChannelAttributes = 0;
  }
  free(self->_clientProtocol);
  path = self->_path;
  self->_path = 0;

  v4.receiver = self;
  v4.super_class = (Class)IDSClientChannel;
  [(IDSClientChannel *)&v4 dealloc];
}

- (BOOL)readDatagram:(const void *)a3 datagramSize:(unsigned int *)a4 metaData:(const void *)a5 metadataSize:(unsigned int *)a6
{
  return 1;
}

- (BOOL)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 metaData:(const void *)a5 metadataSize:(unsigned int)a6
{
  if (self->_clientReady)
  {
    if (!self->_nwChannel)
    {
      v11 = +[IDSFoundationLog ClientChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v29 = a4;
        __int16 v30 = 2048;
        uint64_t v31 = a6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "writeDatagram: attempt to send client data %lu metadata %lu but no channel", buf, 0x16u);
      }

      return 0;
    }
    if (self->_closed)
    {
      objc_super v9 = +[IDSFoundationLog ClientChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        CFStringRef v10 = "writeDatagram: channel closed";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    uint64_t protocol_handler = nw_channel_get_protocol_handler();
    if (self->_verboseFunctionalLogging)
    {
      v17 = +[IDSFoundationLog ClientChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(protocol_handler + 56);
        *(_DWORD *)buf = 134218752;
        uint64_t v29 = a4;
        __int16 v30 = 2048;
        uint64_t v31 = a6;
        __int16 v32 = 2048;
        uint64_t v33 = protocol_handler;
        __int16 v34 = 2048;
        uint64_t v35 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "writeDatagram: have data %lu metadata %lu to send to client protocol %p context %p", buf, 0x2Au);
      }
    }
    v27[0] = 0xAAAAAAAAAAAAAAAALL;
    v27[1] = 0xAAAAAAAAAAAAAAAALL;
    if (!(*(unsigned int (**)(uint64_t, nw_protocol *, uint64_t, uint64_t, uint64_t, void *))(*(void *)(protocol_handler + 24) + 88))(protocol_handler, self->_clientProtocol, 1, 0xFFFFFFFFLL, 1, v27))return 0; {
    v19 = nw_frame_array_first();
    }
    v20 = (_WORD *)nw_frame_unclaimed_bytes();
    BOOL hasMetadata = self->_hasMetadata;
    unsigned int v22 = a6 + 2;
    if (!self->_hasMetadata) {
      unsigned int v22 = 0;
    }
    BOOL v12 = v22 + a4 == 0;
    if (v22 + a4)
    {
      v25 = +[IDSFoundationLog ClientChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v29 = a4;
        __int16 v30 = 2048;
        uint64_t v31 = a6;
        __int16 v32 = 2048;
        uint64_t v33 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "writeDatagram: have data %lu metadata %lu to send to client but not enough bytes (%lu) in frame", buf, 0x20u);
      }

      nw_frame_array_foreach();
      goto LABEL_36;
    }
    v23 = v20;
    if (hasMetadata)
    {
      _WORD *v20 = bswap32(a6) >> 16;
      if (a6) {
        memcpy(v20 + 1, a5, a6);
      }
      if (!a4) {
        goto LABEL_35;
      }
      v20 = (_WORD *)((char *)v23 + a6 + 2);
      size_t v24 = a4;
    }
    else
    {
      if (!a4)
      {
LABEL_35:
        nw_frame_claim();
        nw_frame_collapse();
        nw_frame_unclaim();
        (*(void (**)(uint64_t, void *))(*(void *)(protocol_handler + 24) + 96))(protocol_handler, v27);
LABEL_36:

        return v12;
      }
      size_t v24 = a4;
    }
    memcpy(v20, a3, v24);
    goto LABEL_35;
  }
  objc_super v9 = +[IDSFoundationLog ClientChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    CFStringRef v10 = "writeDatagram: client not ready yet - return NO for caller to cache";
    goto LABEL_8;
  }
LABEL_9:

  return 0;
}

- (BOOL)writePacketBuffer:(id *)a3 metaData:(const void *)a4 metadataSize:(unsigned int)a5 moreComing:(BOOL)a6
{
  if (!self->_clientReady)
  {
    v13 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "writePacketBuffer: client not ready yet - return NO for caller to cache";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_11:

    return 0;
  }
  if (a3)
  {
    var0 = a3->var0;
    unsigned int var2 = a3->var2;
  }
  else
  {
    var0 = 0;
    unsigned int var2 = 0;
  }
  if (self->_closed)
  {
    v13 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "writePacketBuffer: channel closed";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (var2 | a5)
  {
    if (os_channel_available_slot_count())
    {
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v64 = v16;
      long long v65 = v16;
      *(_OWORD *)buf = v16;
      *(_OWORD *)&buf[16] = v16;
      os_channel_get_next_slot();
      if (self->_hasMetadata) {
        unsigned int v17 = a5 + 2;
      }
      else {
        unsigned int v17 = 0;
      }
      unsigned int v18 = v17 + var2;
      if (!(v17 + var2))
      {
        v27 = +[IDSFoundationLog ClientChannel];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          BOOL hasMetadata = self->_hasMetadata;
          *(_DWORD *)v50 = 138412802;
          if (hasMetadata) {
            CFStringRef v29 = @"YES";
          }
          else {
            CFStringRef v29 = @"NO";
          }
          CFStringRef v51 = v29;
          __int16 v52 = 1024;
          *(_DWORD *)v53 = a5;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = var2;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "writePacketBuffer: Ignoring a zero-byte message. BOOL hasMetadata = %@, metadataSize = %u, datagramSize = %u", v50, 0x18u);
        }

        return 1;
      }
      if (v18 > *(unsigned __int16 *)&buf[2])
      {
        v19 = +[IDSFoundationLog ClientChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v50 = 134218496;
          CFStringRef v51 = (const __CFString *)var2;
          __int16 v52 = 2048;
          *(void *)v53 = a5;
          *(_WORD *)&v53[8] = 2048;
          uint64_t v54 = *(unsigned __int16 *)&buf[2];
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "writePacketBuffer: have data %lu metadata %lu to send to client but not enough bytes %lu in slot", v50, 0x20u);
        }

        return 1;
      }
      if (!self->_verboseFunctionalLogging)
      {
LABEL_57:
        *(_WORD *)buf = 0;
        *(_WORD *)&buf[2] = v18;
        uint64_t v40 = *(void *)&buf[16];
        if (self->_hasMetadata)
        {
          **(_WORD **)&buf[16] = bswap32(a5) >> 16;
          if (a5) {
            memcpy((void *)(v40 + 2), a4, a5);
          }
          if (!var2) {
            goto LABEL_64;
          }
          v41 = (void *)(v40 + a5 + 2);
          size_t v42 = var2;
        }
        else
        {
          size_t v42 = var2;
          v41 = *(void **)&buf[16];
        }
        memcpy(v41, var0, v42);
LABEL_64:
        uuid_copy(*(unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)&buf[24], self->_flowID);
        os_channel_set_slot_properties();
        int v43 = os_channel_advance_slot();
        if (v43)
        {
          int v44 = v43;
          [(IDSClientChannel *)self osChannelInfoLog];
          v45 = +[IDSFoundationLog ClientChannel];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v50 = 67109120;
            LODWORD(v51) = v44;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "writePacketBuffer: advance_slot failed for write %d", v50, 8u);
          }
        }
        if (a6)
        {
          self->_osChannelNeedSync = 1;
        }
        else
        {
          int v46 = os_channel_sync();
          if (v46)
          {
            int v47 = v46;
            [(IDSClientChannel *)self osChannelInfoLog];
            v48 = +[IDSFoundationLog ClientChannel];
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v50 = 67109120;
              LODWORD(v51) = v47;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "writePacketBuffer: os_channel_sync for TX failed %d", v50, 8u);
            }
          }
          self->_osChannelNeedSync = 0;
        }
        return 1;
      }
      log = +[IDSFoundationLog ClientChannel];
      BOOL v30 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      if (var2)
      {
        if (v30)
        {
          if (a3)
          {
            int v31 = *(unsigned __int8 *)a3->var0;
            int v32 = *((unsigned __int8 *)a3->var0 + 1);
            int v33 = *((unsigned __int8 *)a3->var0 + 2);
            int v34 = *((unsigned __int8 *)a3->var0 + 3);
          }
          else
          {
            int v33 = 0;
            int v31 = 0;
            int v32 = 0;
            int v34 = 0;
          }
          *(_DWORD *)v50 = 134219520;
          CFStringRef v51 = (const __CFString *)var2;
          __int16 v52 = 2048;
          *(void *)v53 = a5;
          *(_WORD *)&v53[8] = 2048;
          uint64_t v54 = *(unsigned __int16 *)&buf[2];
          __int16 v55 = 1024;
          int v56 = v31;
          __int16 v57 = 1024;
          int v58 = v32;
          __int16 v59 = 1024;
          int v60 = v33;
          __int16 v61 = 1024;
          int v62 = v34;
          v39 = "writePacketBuffer: have data %lu metadata %lu bytes %lu in slot, data [%02x%02x%02x%02x ...]";
          goto LABEL_55;
        }
      }
      else if (v30)
      {
        int v35 = *(unsigned __int8 *)a4;
        int v36 = *((unsigned __int8 *)a4 + 1);
        int v37 = *((unsigned __int8 *)a4 + 2);
        int v38 = *((unsigned __int8 *)a4 + 3);
        *(_DWORD *)v50 = 134219520;
        CFStringRef v51 = 0;
        __int16 v52 = 2048;
        *(void *)v53 = a5;
        *(_WORD *)&v53[8] = 2048;
        uint64_t v54 = *(unsigned __int16 *)&buf[2];
        __int16 v55 = 1024;
        int v56 = v35;
        __int16 v57 = 1024;
        int v58 = v36;
        __int16 v59 = 1024;
        int v60 = v37;
        __int16 v61 = 1024;
        int v62 = v38;
        v39 = "writePacketBuffer: have data %lu metadata %lu bytes %lu in slot, metadata [%02x%02x%02x%02x ...]";
LABEL_55:
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, v39, v50, 0x38u);
      }

      goto LABEL_57;
    }
    [(IDSClientChannel *)self osChannelInfoLog];
    size_t v24 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = var2;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a5;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "writePacketBuffer: have data %lu metadata %lu to send to client but no slots", buf, 0x16u);
    }

    if (!self->_osChannelNeedSync) {
      return 0;
    }
    int v25 = os_channel_sync();
    if (v25)
    {
      int v26 = v25;
      v23 = +[IDSFoundationLog ClientChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v26;
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  v20 = +[IDSFoundationLog ClientChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "writePacketBuffer: have no data to send to client", buf, 2u);
  }

  BOOL result = 0;
  if (self->_osChannelNeedSync && !a6)
  {
    int v21 = os_channel_sync();
    if (v21)
    {
      int v22 = v21;
      [(IDSClientChannel *)self osChannelInfoLog];
      v23 = +[IDSFoundationLog ClientChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v22;
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "writePacketBuffer: os_channel_sync for TX failed %d", buf, 8u);
      }
LABEL_38:
    }
LABEL_39:
    BOOL result = 0;
    self->_osChannelNeedSync = 0;
  }
  return result;
}

- (BOOL)writeBuffer:(char *)a3 bufferSize:(unsigned int)a4 metaData:(const void *)a5 metadataSize:(unsigned int)a6 moreComing:(BOOL)a7
{
  if (!self->_clientReady)
  {
    CFStringRef v10 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "writeBuffer: client not ready yet - return NO for caller to cache";
      goto LABEL_10;
    }
LABEL_11:

    return 0;
  }
  if (a3) {
    size_t v9 = a4;
  }
  else {
    size_t v9 = 0;
  }
  if (self->_closed)
  {
    CFStringRef v10 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "writeBuffer: channel closed";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v9 | a6)
  {
    if (os_channel_available_slot_count())
    {
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v61 = v16;
      long long v62 = v16;
      *(_OWORD *)buf = v16;
      *(_OWORD *)&buf[16] = v16;
      os_channel_get_next_slot();
      if (self->_hasMetadata) {
        unsigned int v17 = a6 + 2;
      }
      else {
        unsigned int v17 = 0;
      }
      __int16 v18 = v17 + v9;
      if (v17 + v9 > *(unsigned __int16 *)&buf[2])
      {
        v19 = +[IDSFoundationLog ClientChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v46 = 134218496;
          size_t v47 = v9;
          __int16 v48 = 2048;
          uint64_t v49 = a6;
          __int16 v50 = 2048;
          uint64_t v51 = *(unsigned __int16 *)&buf[2];
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "writeBuffer: have data %lu metadata %lu to send to client but not enough bytes %lu in slot", (uint8_t *)&v46, 0x20u);
        }

        return 1;
      }
      if (!self->_verboseFunctionalLogging)
      {
LABEL_50:
        *(_WORD *)buf = 0;
        *(_WORD *)&buf[2] = v18;
        uint64_t v38 = *(void *)&buf[16];
        if (self->_hasMetadata)
        {
          **(_WORD **)&buf[16] = bswap32(a6) >> 16;
          if (a6) {
            memcpy((void *)(v38 + 2), a5, a6);
          }
          if (!v9) {
            goto LABEL_57;
          }
          v39 = (void *)(v38 + a6 + 2);
        }
        else
        {
          v39 = *(void **)&buf[16];
        }
        memcpy(v39, a3, v9);
LABEL_57:
        uuid_copy(*(unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)&buf[24], self->_flowID);
        os_channel_set_slot_properties();
        int v40 = os_channel_advance_slot();
        if (v40)
        {
          int v41 = v40;
          [(IDSClientChannel *)self osChannelInfoLog];
          size_t v42 = +[IDSFoundationLog ClientChannel];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            int v46 = 67109120;
            LODWORD(v47) = v41;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "writeBuffer: advance_slot failed for write %d", (uint8_t *)&v46, 8u);
          }
        }
        if (a7)
        {
          self->_osChannelNeedSync = 1;
        }
        else
        {
          int v43 = os_channel_sync();
          if (v43)
          {
            int v44 = v43;
            [(IDSClientChannel *)self osChannelInfoLog];
            v45 = +[IDSFoundationLog ClientChannel];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              int v46 = 67109120;
              LODWORD(v47) = v44;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "writeBuffer: os_channel_sync for TX failed %d", (uint8_t *)&v46, 8u);
            }
          }
          self->_osChannelNeedSync = 0;
        }
        return 1;
      }
      v27 = +[IDSFoundationLog ClientChannel];
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v28)
        {
          if (a3)
          {
            int v29 = *a3;
            int v30 = a3[1];
            int v31 = a3[2];
            int v32 = a3[3];
          }
          else
          {
            int v31 = 0;
            int v29 = 0;
            int v30 = 0;
            int v32 = 0;
          }
          int v46 = 134219520;
          size_t v47 = v9;
          __int16 v48 = 2048;
          uint64_t v49 = a6;
          __int16 v50 = 2048;
          uint64_t v51 = *(unsigned __int16 *)&buf[2];
          __int16 v52 = 1024;
          int v53 = v29;
          __int16 v54 = 1024;
          int v55 = v30;
          __int16 v56 = 1024;
          int v57 = v31;
          __int16 v58 = 1024;
          int v59 = v32;
          int v37 = "writeBuffer: have data %lu metadata %lu bytes %lu in slot, data [%02x%02x%02x%02x ...]";
          goto LABEL_48;
        }
      }
      else if (v28)
      {
        int v33 = *(unsigned __int8 *)a5;
        int v34 = *((unsigned __int8 *)a5 + 1);
        int v35 = *((unsigned __int8 *)a5 + 2);
        int v36 = *((unsigned __int8 *)a5 + 3);
        int v46 = 134219520;
        size_t v47 = 0;
        __int16 v48 = 2048;
        uint64_t v49 = a6;
        __int16 v50 = 2048;
        uint64_t v51 = *(unsigned __int16 *)&buf[2];
        __int16 v52 = 1024;
        int v53 = v33;
        __int16 v54 = 1024;
        int v55 = v34;
        __int16 v56 = 1024;
        int v57 = v35;
        __int16 v58 = 1024;
        int v59 = v36;
        int v37 = "writeBuffer: have data %lu metadata %lu bytes %lu in slot, metadata [%02x%02x%02x%02x ...]";
LABEL_48:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v46, 0x38u);
      }

      goto LABEL_50;
    }
    [(IDSClientChannel *)self osChannelInfoLog];
    size_t v24 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "writeBuffer: have data %lu metadata %lu to send to client but no slots", buf, 0x16u);
    }

    if (!self->_osChannelNeedSync) {
      return 0;
    }
    int v25 = os_channel_sync();
    if (v25)
    {
      int v26 = v25;
      v23 = +[IDSFoundationLog ClientChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v26;
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  v20 = +[IDSFoundationLog ClientChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "writeBuffer: have no data to send to client", buf, 2u);
  }

  BOOL result = 0;
  if (self->_osChannelNeedSync && !a7)
  {
    int v21 = os_channel_sync();
    if (v21)
    {
      int v22 = v21;
      [(IDSClientChannel *)self osChannelInfoLog];
      v23 = +[IDSFoundationLog ClientChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v22;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "writeBuffer: os_channel_sync for TX failed %d", buf, 8u);
      }
LABEL_37:
    }
LABEL_38:
    BOOL result = 0;
    self->_osChannelNeedSync = 0;
  }
  return result;
}

- (void)setWriteHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_clientReady)
  {
    id v6 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "setWriteHandler: client not ready yet - will not set writeHandler";
      id v8 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (self->_closed)
  {
    id v6 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      id v7 = "setWriteHandler: channel closed";
      id v8 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (self->_osChannel)
  {
    if (v4)
    {
      id v9 = [v4 copy];
      id writeHandler = self->_writeHandler;
      self->_id writeHandler = v9;

      os_channel_get_fd();
      IDSTransportThreadResumeSocket();
    }
    else
    {
      id v11 = self->_writeHandler;
      self->_id writeHandler = 0;

      os_channel_get_fd();
      IDSTransportThreadSuspendSocket();
    }
  }
LABEL_9:
}

- (BOOL)writable
{
  return 1;
}

- (BOOL)connectWithTransportThread
{
  if (self->_closed)
  {
    v2 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "connectWithTransportThread: channel closed", v6, 2u);
    }

    return 0;
  }
  else
  {
    id v4 = self;
    id v5 = +[IDSClientChannelManager sharedInstance];
    LOBYTE(v4) = [v5 connectTransportThreadForClient:v4];

    return (char)v4;
  }
}

- (void)connectWithProtocoHandler
{
  if (self->_closed)
  {
    v2 = +[IDSFoundationLog ClientChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "connectWithProtocoHandler: channel closed", buf, 2u);
    }
  }
  else
  {
    id v4 = +[IDSClientChannelManager sharedInstance];
    [v4 connectProtocolHandlerForClient:self];
  }
}

- (void)invalidate
{
  id writeHandler = self->_writeHandler;
  self->_id writeHandler = 0;

  id readHandler = self->_readHandler;
  self->_id readHandler = 0;

  self->_closed = 1;
}

- (void)osChannelInfoLog
{
  if (!self->_osChannel)
  {
    id v11 = +[IDSFoundationLog ClientChannel];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v13) = 0;
    id v6 = "osChannelInfoLog: _osChannel is NULL.";
    id v7 = v11;
    uint32_t v8 = 2;
    goto LABEL_13;
  }
  os_channel_ring_id();
  uint64_t v2 = os_channel_rx_ring();
  os_channel_ring_id();
  uint64_t v3 = os_channel_tx_ring();
  uint64_t v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v11 = +[IDSFoundationLog ClientChannel];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v13 = 134218240;
    *(void *)v14 = v2;
    *(_WORD *)&v14[8] = 2048;
    uint64_t v15 = v4;
    id v6 = "osChannelInfoLog: os_channel ring is NULL (_osChannelRXRing %p, _osChannelTXRing %p)";
    id v7 = v11;
    uint32_t v8 = 22;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
    goto LABEL_14;
  }
  int v9 = os_channel_available_slot_count();
  int v10 = os_channel_available_slot_count();
  id v11 = +[IDSFoundationLog ClientChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109376;
    *(_DWORD *)v14 = v9;
    *(_WORD *)&v14[4] = 1024;
    *(_DWORD *)&v14[6] = v10;
    id v6 = "osChannelInfoLog: os_channel rx slot count %u tx slot count %u";
    id v7 = v11;
    uint32_t v8 = 14;
    goto LABEL_13;
  }
LABEL_14:
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUUID:(id)a3
{
}

- (id)readHandler
{
  return self->_readHandler;
}

- (void)setReadHandler:(id)a3
{
}

- (id)writeHandler
{
  return self->_writeHandler;
}

- (BOOL)hasMetadata
{
  return self->_hasMetadata;
}

- (int)excessiveCachingReportCounter
{
  return self->_excessiveCachingReportCounter;
}

- (void)setExcessiveCachingReportCounter:(int)a3
{
  self->_excessiveCachingReportCounter = a3;
}

- (int)excessiveCachingCount
{
  return self->_excessiveCachingCount;
}

- (void)setExcessiveCachingCount:(int)a3
{
  self->_excessiveCachingCount = a3;
}

- (BOOL)clientReady
{
  return self->_clientReady;
}

- (void)setClientReady:(BOOL)a3
{
  self->_clientReady = a3;
}

- (NSString)destination
{
  return self->_destination;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (BOOL)closed
{
  return self->_closed;
}

- (BOOL)verboseFunctionalLogging
{
  return self->_verboseFunctionalLogging;
}

- (void)setVerboseFunctionalLogging:(BOOL)a3
{
  self->_verboseFunctionalLogging = a3;
}

- (BOOL)verbosePerformanceLogging
{
  return self->_verbosePerformanceLogging;
}

- (void)setVerbosePerformanceLogging:(BOOL)a3
{
  self->_verbosePerformanceLogging = a3;
}

- (id)packetBufferHandler
{
  return self->_packetBufferHandler;
}

- (void)setPacketBufferHandler:(id)a3
{
}

- (NSMutableArray)cachedDataForClient
{
  return self->_cachedDataForClient;
}

- (void)setCachedDataForClient:(id)a3
{
}

- (unint64_t)clientUniquePID
{
  return self->_clientUniquePID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDataForClient, 0);
  objc_storeStrong(&self->_packetBufferHandler, 0);
  objc_storeStrong(&self->_readHandler, 0);
  objc_storeStrong(&self->_writeHandler, 0);
  objc_storeStrong(&self->_connectHandler, 0);
  objc_storeStrong((id *)&self->_nwChannel, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end