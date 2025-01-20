@interface IDSUDPLink
- (BOOL)_isInterfaceIndexCellular:(int)a3;
- (BOOL)_setTrafficClassOnSocket:(int)a3 trafficClassValue:(int)a4;
- (BOOL)allowsLinkLocal;
- (BOOL)isInvalidated;
- (BOOL)setDestinationAddress:(id)a3 isFixedDestination:(BOOL)a4 fromAddress:(id)a5;
- (BOOL)setDestinationAddress:(id)a3 localIfIndex:(unsigned int)a4 isFixedDestination:(BOOL)a5 fromAddress:(id)a6;
- (BOOL)setDestinationAddressToDeviceIDMap:(id)a3;
- (BOOL)setTrafficClass:(int)a3;
- (BOOL)skipTransportThread;
- (BOOL)useDefaultInterfaceOnly;
- (BOOL)wifiAssistEnabled;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (IDSUDPLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (NSIndexSet)cellularInterfaceIndices;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkTypeString;
- (double)lastDestinationReceived;
- (double)lastDestinationSent;
- (id)_createNetworkInterfaceArrayWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6 allowsLinkLocal:(BOOL)a7 useDefaultInterfaceOnly:(BOOL)a8 defaultPairedDevice:(BOOL)a9;
- (id)copyCurrentNetworkInterfaces;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (id)newSocketWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6;
- (id)newSocketWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6 clientUUID:(unsigned __int8)a7[16];
- (int)_createNewUDPSocketWithIPVersion:(unint64_t)a3 localPort:(unsigned __int16 *)a4 wantsAWDL:(BOOL)a5 clientUUID:(unsigned __int8)a6[16];
- (int)_findSocketForInterfaceIndex:(int)a3;
- (int)cellularSocket;
- (int)socket;
- (unint64_t)_sendBytes:(const void *)a3 length:(unint64_t)a4;
- (unint64_t)_sendBytes:(const void *)a3 length:(unint64_t)a4 destinationAddress:(const sockaddr *)a5;
- (unint64_t)_sendBytesArray:(const void *)a3 lengthArray:(unint64_t *)a4 arraySize:(int)a5 localInterfaceIndex:(int)a6 localAddress:(const sockaddr *)a7 destinationAddress:(const sockaddr *)a8 trafficClass:(unsigned __int16)a9 DSCP:(unsigned __int8)a10;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 destination:(id)a4 toDeviceID:(id)a5;
- (unint64_t)sendPacketBuffer:(id *)a3 sourceInterface:(id)a4 destination:(id)a5 toDeviceID:(id)a6;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (unsigned)cellularPort;
- (unsigned)port;
- (void)_processIncomingCellularPacket;
- (void)_processIncomingPacket;
- (void)_processIncomingPacketOnSocket:(int)a3;
- (void)dealloc;
- (void)invalidate;
- (void)reconnectWithLocalAddress:(id)a3;
- (void)removeSocket;
- (void)setAllowsLinkLocal:(BOOL)a3;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setCellularInterfaceIndices:(id)a3;
- (void)setCellularPort:(unsigned __int16)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setLastDestinationSent:(double)a3;
- (void)setPort:(unsigned __int16)a3;
- (void)setSkipTransportThread:(BOOL)a3;
- (void)setUseDefaultInterfaceOnly:(BOOL)a3;
- (void)setWiFiAssistState:(BOOL)a3;
- (void)setWifiAssistEnabled:(BOOL)a3;
@end

@implementation IDSUDPLink

- (IDSUDPLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSUDPLink;
  v9 = [(IDSUDPLink *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cbuuid, a4);
    objc_storeStrong((id *)&v10->_deviceUniqueID, a3);
    *(void *)&v10->_socket = -1;
    v10->_state = 0;
    v10->_previousReportTime = ids_monotonic_time();
  }

  return v10;
}

- (void)dealloc
{
  if (!self->_isInvalidated)
  {
    BOOL skipTransportThread = self->_skipTransportThread;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_19DB430F8;
    v5[3] = &unk_1E5975A18;
    BOOL v6 = skipTransportThread;
    v5[4] = *(void *)&self->_socket;
    IDSTransportThreadAddBlock(v5);
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSUDPLink;
  [(IDSUDPLink *)&v4 dealloc];
}

- (id)_createNetworkInterfaceArrayWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6 allowsLinkLocal:(BOOL)a7 useDefaultInterfaceOnly:(BOOL)a8 defaultPairedDevice:(BOOL)a9
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v10 = GLUCreateNetworkInterfaceArrayWithOptions(a3, a4, a5, a6, a7, a8, a9, 0, 0);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v32, 0.0, v36, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v10);
        }
        v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        int isCellular = objc_msgSend_isCellular(v19, v13, v14, v15);
        v26 = objc_msgSend_address(v19, v21, v22, v23);
        if (isCellular) {
          uint64_t v28 = objc_msgSend_cellularPort(self, v24, v25, v27);
        }
        else {
          uint64_t v28 = objc_msgSend_port(self, v24, v25, v27);
        }
        objc_msgSend_updateLocalPort_(v26, v29, v28, v30);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v32, v15, v36, 16);
    }
    while (v16);
  }
  return v10;
}

- (void)_processIncomingPacketOnSocket:(int)a3
{
  unsigned int v86 = a3;
  uint64_t v4 = 0;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  do
  {
    BOOL v6 = &v90[v4];
    *((void *)v6 + 6) = 0xAAAAAAAAAAAAAAAALL;
    *((_OWORD *)v6 + 1) = v5;
    *((_OWORD *)v6 + 2) = v5;
    *(_OWORD *)BOOL v6 = v5;
    v4 += 56;
  }
  while (v4 != 560);
  uint64_t v7 = MEMORY[0x1F4188790](self);
  id v8 = (id **)v83;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  for (uint64_t i = 0; i != 20; i += 2)
  {
    v11 = &v76[i + 2];
    void *v11 = 0xAAAAAAAAAAAAAAAALL;
    v11[1] = 0xAAAAAAAAAAAAAAAALL;
  }
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = v64;
  memset(v83, 0, 80);
  bzero(v90, 0x230uLL);
  uint64_t v13 = 0;
  memset(v82, 0, sizeof(v82));
  long long v81 = 0u;
  long long v79 = 0u;
  memset(v80, 0, sizeof(v80));
  memset(v78, 0, sizeof(v78));
  long long v77 = 0u;
  memset(v64, 0, sizeof(v64));
  memset(v66, 0, sizeof(v66));
  long long v67 = 0u;
  memset(v68, 0, sizeof(v68));
  long long v69 = 0u;
  memset(v70, 0, sizeof(v70));
  long long v71 = 0u;
  memset(v72, 0, sizeof(v72));
  long long v73 = 0u;
  memset(v74, 0, sizeof(v74));
  uint64_t v14 = v91;
  long long v75 = 0u;
  memset(v76, 0, sizeof(v76));
  v85 = v83;
  long long v65 = 0u;
  do
  {
    double v15 = _IDSLinkPacketBufferCreate();
    *v8++ = v15;
    uint64_t v16 = (id *)&v76[v13 + 2];
    *uint64_t v16 = *v15;
    v16[1] = v15[1];
    *((void *)v14 - 3) = v15 + 23;
    *((_DWORD *)v14 - 4) = 128;
    *((void *)v14 - 1) = &v76[v13 + 2];
    *(_DWORD *)uint64_t v14 = 1;
    *((void *)v14 + 1) = v12;
    *((_DWORD *)v14 + 4) = 32;
    v13 += 2;
    v14 += 56;
    v12 += 2;
  }
  while (v13 != 20);
  uint64_t v17 = recvmsg_x();
  v20 = v85;
  uint64_t v89 = v17;
  if (v17 < 0)
  {
LABEL_34:
    int v51 = *__error();
    if (*__error() != 35)
    {
      v54 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v52, v53, *(double *)v21.i64);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        sub_19DB81B30();
      }
    }
    if (v51 == 57)
    {
      if (!self->_hasFixedDestination)
      {
        destinationAddress = self->_destinationAddress;
        self->_destinationAddress = 0;

        self->_state = 1;
        objc_msgSend_invalidate(self, v59, v60, v61);
      }
    }
    else if (v51 == 61 && !self->_hasFixedDestination)
    {
      v55 = self->_destinationAddress;
      self->_destinationAddress = 0;

      self->_state = 1;
    }
  }
  else
  {
    p_delegate = (id *)&self->_delegate;
    int64x2_t v21 = vdupq_n_s64(1uLL);
    int64x2_t v87 = v21;
    v84 = &v76[2];
    while (v89)
    {
      for (uint64_t j = 0; j != v89; ++j)
      {
        double v23 = &v90[56 * j];
        unsigned int v25 = *((_DWORD *)v23 + 10);
        v24 = v23 + 40;
        if (v25 < 0xC || (v91[56 * j + 20] & 0x20) != 0)
        {
          objc_msgSend_IDSUDPLink(IDSFoundationLog, v18, v19, *(double *)v21.i64, v64[0], *(void *)&v64[1], *(_OWORD *)((char *)&v64[1] + 8), *((void *)&v64[2] + 1), v65, v66[0], *(_OWORD *)&v66[1], v66[3], v67, v68[0], *(_OWORD *)&v68[1], v68[3], v69, v70[0], *(_OWORD *)&v70[1],
            v70[3],
            v71,
            v72[0],
            *(_OWORD *)&v72[1],
            v72[3],
            v73,
            v74[0],
            *(_OWORD *)&v74[1],
            v74[3],
            v75,
            v76[0],
            *(_OWORD *)&v76[1],
            v76[3],
            v77,
            v78[0],
            *(_OWORD *)&v78[1],
            v78[3],
            v79,
            v80[0],
            *(_OWORD *)&v80[1],
            v80[3],
            v81,
            v82[0],
          v56 = *(_OWORD *)&v82[1]);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
            sub_19DB81BB8(v24, v86, v56);
          }

          goto LABEL_45;
        }
        v26 = &v90[56 * j];
        v29 = (unsigned int *)*((void *)v26 + 4);
        double v27 = v26 + 32;
        uint64_t v28 = v29;
        double v30 = *(int64x2_t **)&v20[8 * j];
        v30[1].i64[0] = v27[2];
        if (v29)
        {
          do
          {
            unsigned int v31 = v28[1];
            if (v31 == 41)
            {
              if (v28[2] == 46)
              {
                v30[3].i16[4] = 7708;
                int64x2_t v21 = *(int64x2_t *)(v28 + 3);
                v30[4] = v21;
                long long v32 = v28 + 7;
                goto LABEL_20;
              }
            }
            else if (!v31 && v28[2] == 26)
            {
              long long v32 = v28 + 3;
              v30[3].i16[4] = 528;
              v30[3].i32[3] = v28[5];
LABEL_20:
              uint64_t v33 = *v32;
              v30[3].i32[0] = v33;
              int isInterfaceIndexCellular = objc_msgSend__isInterfaceIndexCellular_(self, v18, v33, *(double *)v21.i64, *(void *)&v64[0], *((void *)&v64[0] + 1), *(void *)&v64[1], *((void *)&v64[1] + 1), *(void *)&v64[2], *((void *)&v64[2] + 1), (void)v65, *((void *)&v65 + 1), v66[0], v66[1], v66[2], v66[3], (void)v67, *((void *)&v67 + 1), v68[0],
                                           v68[1],
                                           v68[2],
                                           v68[3],
                                           (void)v69,
                                           *((void *)&v69 + 1),
                                           v70[0],
                                           v70[1],
                                           v70[2],
                                           v70[3],
                                           (void)v71,
                                           *((void *)&v71 + 1),
                                           v72[0],
                                           v72[1],
                                           v72[2],
                                           v72[3],
                                           (void)v73,
                                           *((void *)&v73 + 1),
                                           v74[0],
                                           v74[1],
                                           v74[2],
                                           v74[3],
                                           (void)v75,
                                           *((void *)&v75 + 1),
                                           v76[0],
                                           v76[1],
                                           v76[2],
                                           v76[3],
                                           (void)v77,
                                           *((void *)&v77 + 1),
                                           v78[0],
                                           v78[1],
                                           v78[2],
                                           v78[3],
                                           (void)v79,
                                           *((void *)&v79 + 1),
                                           v80[0],
                                           v80[1],
                                           v80[2],
                                           v80[3],
                                           (void)v81,
                                           *((void *)&v81 + 1),
                                           v82[0],
                                           v82[1],
                                           v82[2]);
              uint64_t v35 = 58;
              if (!isInterfaceIndexCellular) {
                uint64_t v35 = 56;
              }
              v30[3].i16[5] = bswap32(*(unsigned __int16 *)((char *)&self->super.isa + v35)) >> 16;
            }
            uint64_t v28 = (unsigned int *)((char *)v28 + ((*v28 + 3) & 0x1FFFFFFFCLL));
          }
          while ((unint64_t)(v28 + 3) <= *v27 + (unint64_t)*v24);
        }
        if (self->_hasFixedDestination && self->_destinationAddressToDeviceIDMap)
        {
          v36 = objc_msgSend_wrapperWithSockAddr_(IDSSockAddrWrapper, v18, (uint64_t)&v30[11].i64[1], *(double *)v21.i64);
          uint64_t v39 = objc_msgSend_objectForKey_(self->_destinationAddressToDeviceIDMap, v37, (uint64_t)v36, v38);
          if (!v39)
          {
            v62 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v40, v41, v42);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              destinationAddressToDeviceIDMap = self->_destinationAddressToDeviceIDMap;
              *(_DWORD *)buf = 136315906;
              v93 = "-[IDSUDPLink _processIncomingPacketOnSocket:]";
              __int16 v94 = 2112;
              v95 = v36;
              __int16 v96 = 1024;
              unsigned int v97 = v86;
              __int16 v98 = 2112;
              v99 = destinationAddressToDeviceIDMap;
              _os_log_error_impl(&dword_19D9BE000, v62, OS_LOG_TYPE_ERROR, "%s found no matching deviceID for %@, socket %d, map = %@", buf, 0x26u);
            }

            goto LABEL_45;
          }
          v43 = (NSString *)v39;
        }
        else
        {
          v43 = self->_cbuuid;
        }
        v44.i64[1] = v87.i64[1];
        v44.i64[0] = v30[1].i64[0];
        *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v44);
        id WeakRetained = objc_loadWeakRetained(p_delegate);
        objc_msgSend_link_didReceivePacket_fromDeviceUniqueID_cbuuid_(WeakRetained, v46, (uint64_t)self, v47, v30, self->_deviceUniqueID, v43);
      }
      if (v89 != 10) {
        break;
      }
      uint64_t v48 = 0;
      v49 = v84;
      do
      {
        v50 = *(void **)&v20[v48];
        IDSLinkPacketBufferResetBufferStart(v50, (const char *)0xF, v19, *(double *)v21.i64);
        void *v49 = *v50;
        v49 += 2;
        v48 += 8;
      }
      while (v48 != 80);
      uint64_t v89 = recvmsg_x();
      if (v89 < 0) {
        goto LABEL_34;
      }
    }
  }
LABEL_45:
  for (uint64_t k = 0; k != 80; k += 8)
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x106, *(void *)&v20[k], *(double *)v21.i64);
}

- (void)_processIncomingPacket
{
}

- (void)_processIncomingCellularPacket
{
}

- (unint64_t)_sendBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int socket = self->_socket;
  if (socket == -1) {
    return 7;
  }
  if (self->_hasFixedDestination)
  {
    uint64_t v10 = objc_msgSend_sa(self->_destinationAddress, a2, (uint64_t)a3, v4);
    return objc_msgSend__sendBytes_length_destinationAddress_(self, v9, (uint64_t)a3, v11, a4, v10);
  }
  else
  {
    if (self->_needToConnect)
    {
      destinationAddress = self->_destinationAddress;
      if (destinationAddress)
      {
        uint64_t v14 = (const sockaddr *)objc_msgSend_sa(destinationAddress, a2, (uint64_t)a3, v4);
        v18 = (unsigned __int8 *)objc_msgSend_sa(self->_destinationAddress, v15, v16, v17);
        if (connect(socket, v14, *v18) < 0)
        {
          int v25 = *__error();
          v29 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v26, v27, v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            uint64_t v39 = self->_destinationAddress;
            int v40 = self->_socket;
            int v43 = 136315906;
            int64x2_t v44 = "-[IDSUDPLink _sendBytes:length:]";
            __int16 v45 = 2112;
            *(void *)v46 = v39;
            *(_WORD *)&v46[8] = 1024;
            *(_DWORD *)&v46[10] = v40;
            __int16 v47 = 1024;
            int v48 = v25;
            _os_log_error_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_ERROR, "%s connect(%@) on socket %d failed errno=%d", (uint8_t *)&v43, 0x22u);
          }
        }
        else
        {
          uint64_t v22 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v19, v20, v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            double v23 = self->_destinationAddress;
            int v24 = self->_socket;
            int v43 = 136315650;
            int64x2_t v44 = "-[IDSUDPLink _sendBytes:length:]";
            __int16 v45 = 2112;
            *(void *)v46 = v23;
            *(_WORD *)&v46[8] = 1024;
            *(_DWORD *)&v46[10] = v24;
            _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_INFO, "%s connect(%@) on socket %d succeeded. Reset _needToConnect", (uint8_t *)&v43, 0x1Cu);
          }

          self->_needToConnect = 0;
        }
      }
    }
    ssize_t v30 = send(self->_socket, a3, a4, 0);
    if (v30 < 0)
    {
      int v33 = *__error();
      unint64_t result = sub_19DB43C84();
      switch(result)
      {
        case 3uLL:
          double v38 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v34, v35, v36);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            int v42 = self->_socket;
            int v43 = 136316162;
            int64x2_t v44 = "-[IDSUDPLink _sendBytes:length:]";
            __int16 v45 = 1024;
            *(_DWORD *)v46 = 309;
            *(_WORD *)&v46[4] = 2048;
            *(void *)&v46[6] = a4;
            __int16 v47 = 1024;
            int v48 = v42;
            __int16 v49 = 1024;
            int v50 = v33;
            _os_log_error_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_ERROR, "%s:%d send(%zu B) on socket %d failed errno=%d", (uint8_t *)&v43, 0x28u);
          }

          self->_hasTemporaryError = 1;
          return 3;
        case 0xBuLL:
          uint64_t v37 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v34, v35, v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            int v41 = self->_socket;
            int v43 = 136316162;
            int64x2_t v44 = "-[IDSUDPLink _sendBytes:length:]";
            __int16 v45 = 1024;
            *(_DWORD *)v46 = 307;
            *(_WORD *)&v46[4] = 2048;
            *(void *)&v46[6] = a4;
            __int16 v47 = 1024;
            int v48 = v41;
            __int16 v49 = 1024;
            int v50 = v33;
            _os_log_error_impl(&dword_19D9BE000, v37, OS_LOG_TYPE_ERROR, "%s:%d send(%zu B) on socket %d failed errno=%d", (uint8_t *)&v43, 0x28u);
          }

          return 11;
        case 6uLL:
          self->_needToConnect = 1;
          break;
      }
    }
    else
    {
      ssize_t v31 = v30;
      unint64_t result = 0;
      self->_hasTemporaryError = 0;
      int64x2_t v32 = vdupq_n_s64(1uLL);
      v32.i64[0] = v31;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v32);
    }
  }
  return result;
}

- (unint64_t)_sendBytes:(const void *)a3 length:(unint64_t)a4 destinationAddress:(const sockaddr *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int socket = self->_socket;
  if (socket == -1) {
    return 7;
  }
  if (self->_destinationAddress && !self->_hasFixedDestination)
  {
    if (a5 && a5->sa_family)
    {
      return 5;
    }
    else
    {
      return objc_msgSend__sendBytes_length_(self, a2, (uint64_t)a3, v5);
    }
  }
  else
  {
    ssize_t v9 = sendto(socket, a3, a4, 0, a5, a5->sa_len);
    if (v9 < 0)
    {
      int v13 = *__error();
      unint64_t result = sub_19DB43C84();
      if (result == 3)
      {
        self->_hasTemporaryError = 1;
      }
      else if (result == 11)
      {
        double v17 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v14, v15, v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = self->_socket;
          int v19 = 136316162;
          uint64_t v20 = "-[IDSUDPLink _sendBytes:length:destinationAddress:]";
          __int16 v21 = 1024;
          int v22 = 339;
          __int16 v23 = 2048;
          unint64_t v24 = a4;
          __int16 v25 = 1024;
          int v26 = v18;
          __int16 v27 = 1024;
          int v28 = v13;
          _os_log_error_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_ERROR, "%s:%d sendto(%zuB) on socket %d failed errno=%d", (uint8_t *)&v19, 0x28u);
        }

        return 11;
      }
    }
    else
    {
      ssize_t v10 = v9;
      unint64_t result = 0;
      self->_hasTemporaryError = 0;
      int64x2_t v12 = vdupq_n_s64(1uLL);
      v12.i64[0] = v10;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v12);
    }
  }
  return result;
}

- (unint64_t)_sendBytesArray:(const void *)a3 lengthArray:(unint64_t *)a4 arraySize:(int)a5 localInterfaceIndex:(int)a6 localAddress:(const sockaddr *)a7 destinationAddress:(const sockaddr *)a8 trafficClass:(unsigned __int16)a9 DSCP:(unsigned __int8)a10
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (self->_socket == -1) {
    return 7;
  }
  if (a7 && a7->sa_family)
  {
    if (self->_destinationAddress)
    {
      if (a8 && a8->sa_family) {
        return 5;
      }
      if (a5 == 1)
      {
        double v16 = *a3;
        unint64_t v17 = *a4;
        return objc_msgSend__sendBytes_length_(self, a2, (uint64_t)v16, v10, v17);
      }
      return 12;
    }
    if (!a8 || !a8->sa_family) {
      return 6;
    }
    if (!a6)
    {
      int v28 = objc_msgSend_IDSUDPLink(IDSFoundationLog, a2, (uint64_t)a3, v10, a4);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_19DB81C50();
      }
      goto LABEL_28;
    }
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v64 = v18;
    long long v65 = v18;
    long long v62 = v18;
    long long v63 = v18;
    long long v60 = v18;
    long long v61 = v18;
    long long v58 = v18;
    long long v59 = v18;
    long long v56 = v18;
    long long v57 = v18;
    *(_OWORD *)&v55[16] = v18;
    *(double *)&long long v27 = MEMORY[0x1F4188790](self);
    long long v54 = v27;
    *(_OWORD *)v55 = v27;
    *(_OWORD *)uint64_t v53 = v27;
    *(_OWORD *)&v53[16] = v27;
    if (a5 > 8)
    {
      objc_msgSend_IDSUDPLink(IDSFoundationLog, v19, (uint64_t)v20, *(double *)&v27, *(void *)v53, *(void *)&v53[8], *(void *)&v53[16], *(void *)&v53[24], v54, *(void *)v55, *(_OWORD *)&v55[8], *(void *)&v55[24], v56, v57, v58, v59, v60, v61, v62,
        v63,
        v64,
      int v28 = v65);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_19DB81CD0();
      }
LABEL_28:

      return 9;
    }
    if (a5 >= 1)
    {
      uint64_t v29 = 0;
      uint64_t v30 = a5;
      ssize_t v31 = (void *)&v58 + 1;
      do
      {
        uint64_t v33 = *v20++;
        uint64_t v32 = v33;
        uint64_t v34 = *v21++;
        *(v31 - 1) = v32;
        *ssize_t v31 = v34;
        v29 += v34;
        v31 += 2;
        --v30;
      }
      while (v30);
    }
    *(void *)&v55[16] = v24;
    *(_DWORD *)&v55[24] = *v24;
    *(void *)&long long v56 = &v58;
    DWORD2(v56) = a5;
    HIDWORD(v57) = 0;
    int v35 = *(unsigned __int8 *)(v23 + 1);
    if (v35 == 2)
    {
      int v37 = 0;
      *(void *)&long long v57 = v53;
      DWORD2(v57) = 64;
      *(void *)&long long v38 = 24;
      *(void *)uint64_t v53 = 24;
      *(_DWORD *)&v53[8] = 26;
      *(_DWORD *)&v53[12] = v22;
      int v42 = 3;
      *(_DWORD *)&v53[16] = *(_DWORD *)(v23 + 4);
      uint64_t v39 = 32;
      uint64_t v36 = 28;
      uint64_t v40 = 36;
      uint64_t v41 = 24;
LABEL_36:
      int v43 = &v53[v41];
      *(_DWORD *)&v53[v36] = v37;
      *(_DWORD *)&v53[v41] = 16;
      *(_DWORD *)&v53[v39] = v42;
      *(_DWORD *)&v53[v40] = v26;
      if (v25)
      {
        *((void *)v43 + 2) = 0xFFFF00000010;
        *((_DWORD *)v43 + 6) = 4230;
        *(_DWORD *)&v53[v41 + 28] = v25;
        int SocketForInterfaceIndex = objc_msgSend__findSocketForInterfaceIndex_(self, v19, v22, COERCE_DOUBLE(0xFFFF00000010), v21, *(void *)v53, *(void *)&v53[8], *(void *)&v53[16], *(void *)&v53[24], (void)v54, *((void *)&v54 + 1), *(void *)v55, *(void *)&v55[8], *(void *)&v55[16], *(void *)&v55[24], (void)v56, *((void *)&v56 + 1), (void)v57, *((void *)&v57 + 1),
                                    v58,
                                    v59,
                                    v60,
                                    v61,
                                    v62,
                                    v63,
                                    v64,
                                    v65);
      }
      else
      {
        DWORD2(v57) = 48;
        int SocketForInterfaceIndex = objc_msgSend__findSocketForInterfaceIndex_(self, v19, v22, *(double *)&v38, v21, *(void *)v53, *(void *)&v53[8], *(void *)&v53[16], *(void *)&v53[24], (void)v54, *((void *)&v54 + 1), *(void *)v55, *(void *)&v55[8], *(void *)&v55[16], *(void *)&v55[24], (void)v56, *((void *)&v56 + 1), (void)v57, *((void *)&v57 + 1),
                                    v58,
                                    v59,
                                    v60,
                                    v61,
                                    v62,
                                    v63,
                                    v64,
                                    v65);
      }
      ssize_t v46 = sendmsg(SocketForInterfaceIndex, (const msghdr *)&v55[16], 0);
      if (v46 < 0)
      {
        __error();
        unint64_t result = sub_19DB43C84();
        if (result == 3)
        {
          self->_hasTemporaryError = 1;
        }
        else if (result == 11)
        {
          v52 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v49, v50, v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_19DB81DEC();
          }

          return 11;
        }
      }
      else
      {
        ssize_t v47 = v46;
        unint64_t result = 0;
        self->_hasTemporaryError = 0;
        int64x2_t v48 = vdupq_n_s64(1uLL);
        v48.i64[0] = v47;
        *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v48);
      }
      return result;
    }
    if (v35 == 30)
    {
      *(void *)&long long v57 = v53;
      DWORD2(v57) = 64;
      *(void *)uint64_t v53 = 0x2900000020;
      *(_DWORD *)&v53[8] = 46;
      *(_DWORD *)&v53[28] = v22;
      uint64_t v36 = 36;
      int v37 = 41;
      long long v38 = *(_OWORD *)(v23 + 8);
      *(_OWORD *)&v53[12] = v38;
      uint64_t v39 = 40;
      uint64_t v40 = 44;
      uint64_t v41 = 32;
      int v42 = 36;
      goto LABEL_36;
    }
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v19, (uint64_t)v20, *(double *)&v27, v21, *(void *)v53, *(void *)&v53[8], *(void *)&v53[16], *(void *)&v53[24], v54, *(void *)v55, *(_OWORD *)&v55[8], *(void *)&v55[24], v56, v57, v58, v59, v60, v61,
      v62,
      v63,
      v64,
    __int16 v45 = v65);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_19DB81D6C();
    }

    return 8;
  }
  else
  {
    if (a5 != 1) {
      return 12;
    }
    uint64_t v14 = *a3;
    unint64_t v15 = *a4;
    return objc_msgSend__sendBytes_length_destinationAddress_(self, a2, (uint64_t)v14, v10, v15, a8, *(void *)&a6);
  }
}

- (int)_createNewUDPSocketWithIPVersion:(unint64_t)a3 localPort:(unsigned __int16 *)a4 wantsAWDL:(BOOL)a5 clientUUID:(unsigned __int8)a6[16]
{
  BOOL v7 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  memset(v53, 0, sizeof(v53));
  if (a3 == 1)
  {
    int v10 = 0;
    *(_WORD *)&v53[0].sa_len = 7708;
    *(sockaddr *)&v53[0].sa_data[6] = *(sockaddr *)MEMORY[0x1E4F148B8];
    *(_WORD *)v53[0].sa_data = bswap32(*a4) >> 16;
    int v9 = 30;
    socklen_t v11 = 28;
  }
  else
  {
    if (a3)
    {
      unint64_t v17 = objc_msgSend_IDSUDPLink(IDSFoundationLog, a2, a3, 0.0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_19DB81E84();
      }
      goto LABEL_12;
    }
    *(_WORD *)&v53[0].sa_len = 528;
    *(_WORD *)v53[0].sa_data = bswap32(*a4) >> 16;
    int v9 = 2;
    int v10 = 1;
    socklen_t v11 = 16;
  }
  int v12 = socket(v9, 2, 17);
  if (v12 == -1)
  {
    long long v18 = __error();
    IDSAssertNonFatalErrnoWithSource(*v18, "UDPLink", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", 513, v19);
    unint64_t v17 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v20, v21, v22);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_19DB81F18();
    }
LABEL_12:

    return -1;
  }
  int v13 = v12;
  IDSCheckFileDescriptorUsageWithSource((uint64_t)"IDSUDPLink.m", 518, 0);
  int v43 = 1;
  int v14 = v13;
  if (v10)
  {
    int v15 = 0;
    int v16 = 26;
  }
  else
  {
    setsockopt(v13, 41, 27, &v43, 4u);
    int v14 = v13;
    int v15 = 41;
    int v16 = 61;
  }
  setsockopt(v14, v15, v16, &v43, 4u);
  if (v7) {
    setsockopt(v13, 0xFFFF, 4356, &v43, 4u);
  }
  setsockopt(v13, 0xFFFF, 4130, &v43, 4u);
  int v42 = 0x80000;
  setsockopt(v13, 0xFFFF, 4098, &v42, 4u);
  int v23 = fcntl(v13, 3, 0);
  if (v23 != -1) {
    fcntl(v13, 4, v23 | 4u);
  }
  if (bind(v13, v53, v11) == -1)
  {
    __error();
    close(v13);
    uint64_t v36 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v33, v34, v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_19DB81FA8();
    }
    goto LABEL_28;
  }
  socklen_t v41 = 128;
  if (getsockname(v13, v53, &v41) == -1)
  {
    __error();
    close(v13);
    uint64_t v36 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v37, v38, v39);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_19DB82024();
    }
LABEL_28:

    return -1;
  }
  *a4 = bswap32(*(unsigned __int16 *)v53[0].sa_data) >> 16;
  if (!uuid_is_null(a6))
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v24;
    *(_OWORD *)&out[16] = v24;
    uuid_unparse(a6, out);
    if (setsockopt(v13, 0xFFFF, 4360, a6, 0x10u))
    {
      int v28 = *__error();
      uint64_t v32 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v29, v30, v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v45 = "-[IDSUDPLink _createNewUDPSocketWithIPVersion:localPort:wantsAWDL:clientUUID:]";
        *(_WORD *)&v45[8] = 1024;
        *(_DWORD *)&v45[10] = 579;
        __int16 v46 = 1024;
        int v47 = v13;
        __int16 v48 = 2080;
        __int16 v49 = out;
        __int16 v50 = 1024;
        int v51 = v28;
        _os_log_error_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_ERROR, "%s:%d setsockopt on socket %d SO_DELEGATED_UUID failed for %s, errno: %d", buf, 0x28u);
      }
    }
    else
    {
      uint64_t v32 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v25, v26, v27);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)__int16 v45 = v13;
        *(_WORD *)&v45[4] = 2080;
        *(void *)&v45[6] = out;
        _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_INFO, "setsockopt on socket %d SO_DELEGATED_UUID for %s", buf, 0x12u);
      }
    }
  }
  return v13;
}

- (BOOL)_isInterfaceIndexCellular:(int)a3
{
  return objc_msgSend_containsIndex_(self->_cellularInterfaceIndices, a2, a3, v3);
}

- (int)_findSocketForInterfaceIndex:(int)a3
{
  int isInterfaceIndexCellular = objc_msgSend__isInterfaceIndexCellular_(self, a2, *(uint64_t *)&a3, v3);
  uint64_t v6 = 8;
  if (isInterfaceIndexCellular) {
    uint64_t v6 = 12;
  }
  return *(_DWORD *)((char *)&self->super.isa + v6);
}

- (BOOL)_setTrafficClassOnSocket:(int)a3 trafficClassValue:(int)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v15 = a4;
  int v7 = setsockopt(a3, 0xFFFF, 4230, &v15, 4u);
  if (v7)
  {
    int v9 = *__error();
    int v13 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v10, v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)unint64_t v17 = "-[IDSUDPLink _setTrafficClassOnSocket:trafficClassValue:]";
      *(_WORD *)&v17[8] = 1024;
      int v18 = 608;
      __int16 v19 = 1024;
      int v20 = v15;
      __int16 v21 = 1024;
      int v22 = a3;
      __int16 v23 = 1024;
      int v24 = v9;
      _os_log_error_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_ERROR, "%s:%d traffic class (%d) failed to set for socket (%d), error (%d).", buf, 0x24u);
    }
  }
  else
  {
    int v13 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v5, v6, v8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)unint64_t v17 = v15;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = a3;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_INFO, "traffic class (%d) is set for socket (%d).", buf, 0xEu);
    }
  }

  return v7 == 0;
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
  return (NSString *)@"InfraWiFi";
}

- (id)copyLinkStatsDict
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v6 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v4, self->_totalBytesReceived, v5);
  int v9 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v7, self->_totalBytesSent, v8);
  double v12 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v10, self->_totalPacketsReceived, v11);
  int v15 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v13, self->_totalPacketsSent, v14);
  int v18 = objc_msgSend_initWithObjectsAndKeys_(v3, v16, (uint64_t)v6, v17, @"bytesReceived", v9, @"bytesSent", v12, @"packetsReceived", v15, @"packetsSent", 0);

  return v18;
}

- (void)removeSocket
{
  int socket = self->_socket;
  if (socket != -1)
  {
    if (!self->_skipTransportThread)
    {
      IDSTransportThreadRemoveSocket(socket);
      int socket = self->_socket;
    }
    close(socket);
    self->_int socket = -1;
  }
  int cellularSocket = self->_cellularSocket;
  if (cellularSocket != -1)
  {
    if (!self->_skipTransportThread)
    {
      IDSTransportThreadRemoveSocket(cellularSocket);
      int cellularSocket = self->_cellularSocket;
    }
    close(cellularSocket);
    self->_int cellularSocket = -1;
  }
}

- (void)invalidate
{
  objc_msgSend_removeSocket(self, a2, v2, v3);
  self->_isInvalidated = 1;
}

- (BOOL)setDestinationAddress:(id)a3 isFixedDestination:(BOOL)a4 fromAddress:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  double v8 = (IDSSockAddrWrapper *)a3;
  id v9 = a5;
  int v13 = v9;
  if (self->_socket == -1)
  {
    self->_state = 0;
    id WeakRetained = objc_msgSend_IDSUDPLink(IDSFoundationLog, v10, v11, v12);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      sub_19DB820A0();
    }
    goto LABEL_13;
  }
  if (v9 && (objc_msgSend_isEqualToWrapper_(v8, v10, (uint64_t)v9, v12) & 1) == 0)
  {
    id WeakRetained = objc_msgSend_IDSUDPLink(IDSFoundationLog, v10, v14, v12);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      sub_19DB82120();
    }
LABEL_13:
    BOOL v25 = 0;
    goto LABEL_25;
  }
  if ((objc_msgSend_isEqual_(v8, v10, (uint64_t)self->_destinationAddress, v12) & 1) == 0 && !a4)
  {
    if (v8)
    {
      int socket = self->_socket;
      __int16 v19 = (const sockaddr *)objc_msgSend_sa(v8, v15, v16, v17);
      __int16 v23 = (unsigned __int8 *)objc_msgSend_sa(v8, v20, v21, v22);
      if (connect(socket, v19, *v23) < 0)
      {
        int v28 = *__error();
        uint64_t v32 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v29, v30, v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          int v44 = self->_socket;
          *(_DWORD *)__int16 v45 = 136316162;
          *(void *)&v45[4] = "-[IDSUDPLink setDestinationAddress:isFixedDestination:fromAddress:]";
          *(_WORD *)&v45[12] = 1024;
          *(_DWORD *)&unsigned char v45[14] = 677;
          __int16 v46 = 2112;
          int v47 = v8;
          __int16 v48 = 1024;
          int v49 = v44;
          __int16 v50 = 1024;
          int v51 = v28;
          _os_log_error_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_ERROR, "%s:%d connect(%@) on socket %d failed errno=%d", v45, 0x28u);
        }

        self->_needToConnect = 1;
      }
      else
      {
        self->_needToConnect = 0;
      }
    }
    else
    {
      uint64_t v26 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v15, v16, v17);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        destinationAddress = self->_destinationAddress;
        *(_DWORD *)__int16 v45 = 138412290;
        *(void *)&v45[4] = destinationAddress;
        _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "dissolving old association with %@", v45, 0xCu);
      }

      *(void *)&v45[8] = 0;
      *(void *)&v45[2] = 0;
      *(_WORD *)__int16 v45 = 16;
      connect(self->_socket, (const sockaddr *)v45, 0x10u);
    }
  }
  uint64_t v33 = (IDSSockAddrWrapper *)objc_msgSend_copy(v8, v15, v16, v17);
  uint64_t v34 = self->_destinationAddress;
  self->_destinationAddress = v33;

  self->_hasFixedDestination = a4;
  double v35 = ids_monotonic_time();
  self->_lastDestinationReceived = v35;
  uint64_t v38 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v36, v37, v35);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    double v39 = self->_destinationAddress;
    *(_DWORD *)__int16 v45 = 136315650;
    *(void *)&v45[4] = "-[IDSUDPLink setDestinationAddress:isFixedDestination:fromAddress:]";
    *(_WORD *)&v45[12] = 1024;
    *(_DWORD *)&unsigned char v45[14] = 696;
    __int16 v46 = 2112;
    int v47 = v39;
    _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "%s:%d new destination set to %@", v45, 0x1Cu);
  }

  unint64_t v40 = 4;
  if (!v8) {
    unint64_t v40 = 1;
  }
  self->_state = v40;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_link_didConnectForDeviceUniqueID_cbuuid_(WeakRetained, v41, (uint64_t)self, v42, self->_deviceUniqueID, self->_cbuuid);
  BOOL v25 = 1;
LABEL_25:

  return v25;
}

- (BOOL)setDestinationAddress:(id)a3 localIfIndex:(unsigned int)a4 isFixedDestination:(BOOL)a5 fromAddress:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unsigned int v27 = a4;
  id v11 = a6;
  int v15 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v12, v13, v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int socket = self->_socket;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v29 = socket;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = a4;
    _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "setting local interface index on socket %d to %u", buf, 0xEu);
  }

  if (setsockopt(self->_socket, 0, 25, &v27, 4u) < 0)
  {
    int v19 = *__error();
    __int16 v23 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v20, v21, v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v26 = self->_socket;
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v29 = "-[IDSUDPLink setDestinationAddress:localIfIndex:isFixedDestination:fromAddress:]";
      *(_WORD *)&v29[8] = 1024;
      int v30 = 720;
      __int16 v31 = 1024;
      unsigned int v32 = v27;
      __int16 v33 = 1024;
      int v34 = v26;
      __int16 v35 = 1024;
      int v36 = v19;
      _os_log_error_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_ERROR, "%s:%d setsockopt(IP_BOUND_IF,%u) on socket %d failed errno=%d", buf, 0x24u);
    }
  }
  char isFixedDestination_fromAddress = objc_msgSend_setDestinationAddress_isFixedDestination_fromAddress_(self, v17, (uint64_t)v10, v18, v7, v11);

  return isFixedDestination_fromAddress;
}

- (BOOL)setDestinationAddressToDeviceIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_destinationAddressToDeviceIDMap, a3);
  id v5 = a3;
  self->_hasFixedDestination = 1;
  self->_state = 4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_link_didConnectForDeviceUniqueID_cbuuid_(WeakRetained, v7, (uint64_t)self, v8, self->_deviceUniqueID, self->_cbuuid);

  return 1;
}

- (void)reconnectWithLocalAddress:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  destinationAddress = self->_destinationAddress;
  if (!destinationAddress || self->_hasFixedDestination) {
    goto LABEL_19;
  }
  int socket = self->_socket;
  id v10 = (const sockaddr *)objc_msgSend_sa(destinationAddress, v4, v5, v7);
  double v14 = (unsigned __int8 *)objc_msgSend_sa(self->_destinationAddress, v11, v12, v13);
  if (connect(socket, v10, *v14) < 0)
  {
    int v36 = *__error();
    unint64_t v40 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v37, v38, v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      socklen_t v41 = self->_destinationAddress;
      int v42 = self->_socket;
      *(_DWORD *)__int16 v45 = 136316162;
      *(void *)&v45[4] = "-[IDSUDPLink reconnectWithLocalAddress:]";
      *(_WORD *)&v45[12] = 1024;
      *(_DWORD *)&unsigned char v45[14] = 742;
      *(_WORD *)&unsigned char v45[18] = 2112;
      *(void *)&v45[20] = v41;
      *(_WORD *)&v45[28] = 1024;
      *(_DWORD *)&v45[30] = v42;
      *(_WORD *)&v45[34] = 1024;
      *(_DWORD *)&v45[36] = v36;
      _os_log_error_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_ERROR, "%s:%d connect(%@) on socket %d failed errno=%d", v45, 0x28u);
    }
    goto LABEL_14;
  }
  *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v49 = v15;
  long long v50 = v15;
  long long v47 = v15;
  long long v48 = v15;
  *(_OWORD *)&v45[32] = v15;
  long long v46 = v15;
  *(_OWORD *)__int16 v45 = v15;
  *(_OWORD *)&v45[16] = v15;
  socklen_t v44 = 128;
  if (getsockname(self->_socket, (sockaddr *)v45, &v44) == -1)
  {
    unint64_t v40 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v16, v17, v18);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_19DB821B8(v40);
    }
LABEL_14:

    self->_needToConnect = 1;
    goto LABEL_19;
  }
  int v19 = [IDSSockAddrWrapper alloc];
  double v22 = objc_msgSend_initWithSockAddr_(v19, v20, (uint64_t)v45, v21);
  int v26 = objc_msgSend_ipString(v6, v23, v24, v25);
  unsigned int v32 = objc_msgSend_ipString(v22, v27, v28, v29);
  if (v26 && !objc_msgSend_isEqualToString_(v26, v30, (uint64_t)v32, v33))
  {
    int v34 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v30, v31, v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_19DB82268();
    }
    BOOL v35 = 1;
  }
  else
  {
    int v34 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v30, v31, v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v43 = 0;
      _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "reconnectWithLocalAddress succeeded", v43, 2u);
    }
    BOOL v35 = 0;
  }

  self->_needToConnect = v35;
LABEL_19:
}

- (id)newSocketWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6 clientUUID:(unsigned __int8)a7[16]
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v14 = 30;
  }
  else {
    int v14 = 2;
  }
  self->_int addressFamily = v14;
  self->_wantsAWDL = a4;
  self->_wantsWiFuint64_t i = a5;
  self->_wantsCellular = a6;
  unsigned int NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID = objc_msgSend__createNewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID_(self, a2, a3, v7, &self->_port, a4, a7);
  self->_int socket = NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID;
  if (NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID == -1)
  {
    BOOL v35 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v16, v17, v18);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_19DB822E8();
    }
    goto LABEL_18;
  }
  if (!self->_skipTransportThread)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_19DB456D4;
    v41[3] = &unk_1E5973BA8;
    v41[4] = self;
    IDSTransportThreadAddSocket(NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID, v41, 0);
  }
  unsigned int v19 = objc_msgSend__createNewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID_(self, v16, a3, v18, &self->_cellularPort, v11, a7);
  self->_int cellularSocket = v19;
  if (v19 == -1)
  {
    objc_msgSend_removeSocket(self, v20, v21, v22);
    BOOL v35 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v36, v37, v38);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_19DB82368();
    }
LABEL_18:

    return 0;
  }
  if (!self->_skipTransportThread)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = sub_19DB456DC;
    v40[3] = &unk_1E5973BA8;
    v40[4] = self;
    IDSTransportThreadAddSocket(v19, v40, 0);
  }
  __int16 v23 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v20, v21, v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int port = self->_port;
    int socket = self->_socket;
    int cellularSocket = self->_cellularSocket;
    int cellularPort = self->_cellularPort;
    *(_DWORD *)buf = 136316162;
    int v43 = "-[IDSUDPLink newSocketWithIPVersion:wantsAWDL:wantsWiFi:wantsCellular:clientUUID:]";
    __int16 v44 = 1024;
    int v45 = socket;
    __int16 v46 = 1024;
    int v47 = port;
    __int16 v48 = 1024;
    int v49 = cellularSocket;
    __int16 v50 = 1024;
    int v51 = cellularPort;
    _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "%s created UDP sockets. default %d port %d cellular %d cellularPort %d", buf, 0x24u);
  }

  BOOL allowsLinkLocal = self->_allowsLinkLocal;
  BOOL useDefaultInterfaceOnly = self->_useDefaultInterfaceOnly;
  char isEqualToString = objc_msgSend_isEqualToString_(self->_cbuuid, v30, @"12345678-7654-DADA-DADA-DADADADADADA", v31);
  objc_msgSend__createNetworkInterfaceArrayWithIPVersion_wantsAWDL_wantsWiFi_wantsCellular_allowsLinkLocal_useDefaultInterfaceOnly_defaultPairedDevice_(self, v32, a3, v33, v11, v10, v9, allowsLinkLocal, useDefaultInterfaceOnly, isEqualToString);
  id result = (id)objc_claimAutoreleasedReturnValue();
  if (!result) {
    self->_state = 1;
  }
  return result;
}

- (id)newSocketWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = 0;
  v8[1] = 0;
  return (id)objc_msgSend_newSocketWithIPVersion_wantsAWDL_wantsWiFi_wantsCellular_clientUUID_(self, a2, a3, v6, a4, a5, a6, v8);
}

- (id)copyCurrentNetworkInterfaces
{
  BOOL v4 = self->_addressFamily != 2;
  BOOL wantsAWDL = self->_wantsAWDL;
  wantsWiFuint64_t i = self->_wantsWiFi;
  BOOL wantsCellular = self->_wantsCellular;
  BOOL allowsLinkLocal = self->_allowsLinkLocal;
  BOOL useDefaultInterfaceOnly = self->_useDefaultInterfaceOnly;
  char isEqualToString = objc_msgSend_isEqualToString_(self->_cbuuid, a2, @"12345678-7654-DADA-DADA-DADADADADADA", v2);
  objc_msgSend__createNetworkInterfaceArrayWithIPVersion_wantsAWDL_wantsWiFi_wantsCellular_allowsLinkLocal_useDefaultInterfaceOnly_defaultPairedDevice_(self, v10, v4, v11, wantsAWDL, wantsWiFi, wantsCellular, allowsLinkLocal, useDefaultInterfaceOnly, isEqualToString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = v9;
  if (v9 && (objc_msgSend_isEqualToString_(v9, v10, (uint64_t)self->_cbuuid, v11) & 1) == 0)
  {
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x333, (uint64_t)a3, v11);
    unint64_t v17 = 10;
  }
  else
  {
    var0 = a3->var0;
    int64_t var2 = a3->var2;
    v21[0] = var0;
    if (a3->var19.ss_family)
    {
      if (a3->var18.ss_family && (uint64_t var17 = a3->var17, var17))
      {
        BYTE2(v19) = a3->var22;
        LOWORD(v19) = a3->var21;
        uint64_t v15 = objc_msgSend__sendBytesArray_lengthArray_arraySize_localInterfaceIndex_localAddress_destinationAddress_trafficClass_DSCP_(self, v10, (uint64_t)v21, v11, &var2, 1, var17, &a3->var18, &a3->var19, v19);
      }
      else
      {
        uint64_t v15 = objc_msgSend__sendBytes_length_destinationAddress_(self, v10, (uint64_t)var0, v11);
      }
    }
    else
    {
      uint64_t v15 = objc_msgSend__sendBytes_length_(self, v10, (uint64_t)var0, v11);
    }
    unint64_t v17 = v15;
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x34F, (uint64_t)a3, v16);
  }

  return v17;
}

- (unint64_t)sendPacketBuffer:(id *)a3 destination:(id)a4 toDeviceID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v13 = v9;
  if (v9 && (objc_msgSend_isEqualToString_(v9, v10, (uint64_t)self->_cbuuid, v12) & 1) == 0)
  {
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x355, (uint64_t)a3, v12);
    unint64_t v19 = 10;
  }
  else
  {
    var0 = a3->var0;
    int64_t var2 = a3->var2;
    uint64_t v16 = objc_msgSend_sa(v8, v10, v11, v12);
    unint64_t v19 = objc_msgSend__sendBytes_length_destinationAddress_(self, v17, (uint64_t)var0, v18, var2, v16);
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x35D, (uint64_t)a3, v20);
  }

  return v19;
}

- (unint64_t)sendPacketBuffer:(id *)a3 sourceInterface:(id)a4 destination:(id)a5 toDeviceID:(id)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = v12;
  if (v12 && (objc_msgSend_isEqualToString_(v12, v13, (uint64_t)self->_cbuuid, v15) & 1) == 0)
  {
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x363, (uint64_t)a3, v15);
    unint64_t v33 = 10;
  }
  else
  {
    var0 = a3->var0;
    int64_t var2 = a3->var2;
    v38[0] = var0;
    uint64_t v18 = objc_msgSend_index(v10, v13, v14, v15);
    double v22 = objc_msgSend_address(v10, v19, v20, v21);
    uint64_t v26 = objc_msgSend_sa(v22, v23, v24, v25);
    uint64_t v30 = objc_msgSend_sa(v11, v27, v28, v29);
    BYTE2(v36) = a3->var22;
    LOWORD(v36) = a3->var21;
    unint64_t v33 = objc_msgSend__sendBytesArray_lengthArray_arraySize_localInterfaceIndex_localAddress_destinationAddress_trafficClass_DSCP_(self, v31, (uint64_t)v38, v32, &var2, 1, v18, v26, v30, v36);

    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x373, (uint64_t)a3, v34);
  }

  return v33;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = v11;
  if (v11 && (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)self->_cbuuid, v13) & 1) == 0)
  {
    if ((int)v7 < 1)
    {
      unint64_t v26 = 10;
    }
    else
    {
      uint64_t v24 = v7;
      unint64_t v26 = 10;
      do
      {
        uint64_t v25 = (uint64_t)*a3++;
        _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x37A, v25, v15);
        --v24;
      }
      while (v24);
    }
  }
  else
  {
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v32[2] = v16;
    v32[3] = v16;
    v32[0] = v16;
    v32[1] = v16;
    v31[2] = v16;
    v31[3] = v16;
    v31[0] = v16;
    v31[1] = v16;
    if ((int)v7 >= 1)
    {
      unint64_t v17 = v31;
      uint64_t v18 = v32;
      unint64_t v19 = a3;
      uint64_t v20 = v7;
      do
      {
        double v21 = *v19++;
        *v18++ = *v21;
        *v17++ = v21[2];
        --v20;
      }
      while (v20);
    }
    double v22 = *a3;
    if (!*((unsigned char *)*a3 + 185) || (*((unsigned char *)v22 + 57) ? (BOOL v23 = *((_DWORD *)v22 + 12) == 0) : (BOOL v23 = 1), v23))
    {
      unint64_t v26 = 12;
    }
    else
    {
      BYTE2(v30) = *((unsigned char *)v22 + 442);
      LOWORD(v30) = *((_WORD *)v22 + 220);
      unint64_t v26 = objc_msgSend__sendBytesArray_lengthArray_arraySize_localInterfaceIndex_localAddress_destinationAddress_trafficClass_DSCP_(self, v12, (uint64_t)v32, -3.72066208e-103, v31, v7, v30);
    }
    if ((int)v7 >= 1)
    {
      uint64_t v27 = v7;
      do
      {
        uint64_t v28 = (uint64_t)*a3++;
        _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x39A, v28, *(double *)&v16);
        --v27;
      }
      while (v27);
    }
  }

  return v26;
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  double previousReportTime = self->_previousReportTime;
  if (previousReportTime == 0.0)
  {
    id v12 = 0;
  }
  else
  {
    double v7 = a3 - previousReportTime;
    unint64_t v8 = self->_totalBytesSent - self->_previousBytesSent;
    unint64_t v9 = self->_totalBytesReceived - self->_previousBytesReceived;
    if (a4) {
      uint64_t v10 = 42;
    }
    else {
      uint64_t v10 = 32;
    }
    uint64_t v37 = v10;
    double v38 = NSString;
    if (self->_hasTemporaryError)
    {
      id v11 = " HostDown";
    }
    else
    {
      unint64_t state = self->_state;
      if (state > 6) {
        id v11 = "UnexpectedState";
      }
      else {
        id v11 = _IDSLinkStateStrings[state];
      }
    }
    int v36 = v11;
    unint64_t v35 = self->_totalPacketsSent - self->_previousPacketsSent;
    uint64_t v14 = formattedBytes(v8, a2, previousReportTime);
    long long v16 = formattedSpeed((unint64_t)((double)(8 * v8) / v7 + 0.5), v15, (double)(8 * v8) / v7 + 0.5);
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    uint64_t v20 = formattedBytes(self->_totalBytesSent, v18, v19);
    unint64_t v21 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    uint64_t v24 = formattedBytes(v9, v22, v23);
    unint64_t v26 = formattedSpeed((unint64_t)((double)(8 * v9) / v7 + 0.5), v25, (double)(8 * v9) / v7 + 0.5);
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    int v30 = formattedBytes(self->_totalBytesReceived, v28, v29);
    id v12 = objc_msgSend_stringWithFormat_(v38, v31, @"%c InfraWiFi (%s) Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n", v32, v37, v36, v35, v14, v16, totalPacketsSent, v20, v21, v24, v26, totalPacketsReceived, v30);
  }
  self->_double previousReportTime = a3;
  long long v33 = *(_OWORD *)&self->_totalBytesReceived;
  *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
  *(_OWORD *)&self->_previousBytesReceived = v33;
  return v12;
}

- (BOOL)setTrafficClass:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  uint64_t socket = self->_socket;
  if (socket == -1)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v7 = objc_msgSend__setTrafficClassOnSocket_trafficClassValue_(self, a2, socket, v3, v4);
    if (v7)
    {
      uint64_t cellularSocket = self->_cellularSocket;
      if (cellularSocket == -1)
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        LOBYTE(v7) = objc_msgSend__setTrafficClassOnSocket_trafficClassValue_(self, v8, cellularSocket, v9, v4);
      }
    }
  }
  return v7;
}

- (void)setWiFiAssistState:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 1;
  if (!a3) {
    uint64_t v5 = 2;
  }
  uint64_t v12 = v5;
  BOOL v11 = a3;
  if (setsockopt(self->_cellularSocket, 0xFFFF, 4387, &v12, 8u) == -1
    || setsockopt(self->_cellularSocket, 0xFFFF, 4373, &v11, 4u) == -1)
  {
    double v9 = objc_msgSend_IDSUDPLink(IDSFoundationLog, v6, v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *__error();
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[IDSUDPLink setWiFiAssistState:]";
      __int16 v15 = 1024;
      int v16 = 983;
      __int16 v17 = 1024;
      int v18 = v10;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d setsockopt failed, errno: %d", buf, 0x18u);
    }
  }
  else
  {
    self->_wifiAssistEnabled = a3;
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCbuuid:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_int port = a3;
}

- (unsigned)cellularPort
{
  return self->_cellularPort;
}

- (void)setCellularPort:(unsigned __int16)a3
{
  self->_int cellularPort = a3;
}

- (int)socket
{
  return self->_socket;
}

- (BOOL)useDefaultInterfaceOnly
{
  return self->_useDefaultInterfaceOnly;
}

- (void)setUseDefaultInterfaceOnly:(BOOL)a3
{
  self->_BOOL useDefaultInterfaceOnly = a3;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (double)lastDestinationSent
{
  return self->_lastDestinationSent;
}

- (void)setLastDestinationSent:(double)a3
{
  self->_lastDestinationSent = a3;
}

- (double)lastDestinationReceived
{
  return self->_lastDestinationReceived;
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

- (BOOL)skipTransportThread
{
  return self->_skipTransportThread;
}

- (void)setSkipTransportThread:(BOOL)a3
{
  self->_BOOL skipTransportThread = a3;
}

- (int)cellularSocket
{
  return self->_cellularSocket;
}

- (BOOL)allowsLinkLocal
{
  return self->_allowsLinkLocal;
}

- (void)setAllowsLinkLocal:(BOOL)a3
{
  self->_BOOL allowsLinkLocal = a3;
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
  objc_storeStrong((id *)&self->_destinationAddressToDeviceIDMap, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
}

@end