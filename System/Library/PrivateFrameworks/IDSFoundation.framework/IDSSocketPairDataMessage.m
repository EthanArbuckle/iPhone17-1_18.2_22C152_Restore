@interface IDSSocketPairDataMessage
- (BOOL)compressed;
- (BOOL)didWakeHint;
- (BOOL)expectsPeerResponse;
- (BOOL)wantsAppAck;
- (IDSSocketPairDataMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (IDSSocketPairDataMessage)initWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 expectsPeerResponse:(BOOL)a5 wantsAppAck:(BOOL)a6 compressed:(BOOL)a7 didWakeHint:(BOOL)a8 peerResponseIdentifier:(id)a9 messageUUID:(id)a10 data:(id)a11 expiryDate:(id)a12;
- (NSData)data;
- (NSDate)expiryDate;
- (NSString)messageUUID;
- (NSString)peerResponseIdentifier;
- (id)_nonHeaderData;
- (unsigned)command;
- (unsigned)sequenceNumber;
- (unsigned)streamID;
- (void)setCompressed:(BOOL)a3;
- (void)setDidWakeHint:(BOOL)a3;
- (void)setExpiryDate:(id)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setStreamID:(unsigned __int16)a3;
@end

@implementation IDSSocketPairDataMessage

- (IDSSocketPairDataMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v83.receiver = self;
  v83.super_class = (Class)IDSSocketPairDataMessage;
  v8 = [(IDSSocketPairMessage *)&v83 initWithCommand:v4 underlyingData:v6];
  if (!v8)
  {
LABEL_26:
    v35 = v8;
    goto LABEL_27;
  }
  unsigned int v82 = -1431655766;
  objc_msgSend_getBytes_range_(v6, v7, (uint64_t)&v82, v9, 0, 4);
  unsigned int v82 = bswap32(v82);
  unsigned __int16 v81 = -21846;
  objc_msgSend_getBytes_range_(v6, v10, (uint64_t)&v81, v11, 4, 2);
  unsigned __int16 v81 = bswap32(v81) >> 16;
  char v80 = -86;
  objc_msgSend_getBytes_range_(v6, v12, (uint64_t)&v80, v13, 6, 1);
  unsigned int v79 = -1431655766;
  objc_msgSend_getBytes_range_(v6, v14, (uint64_t)&v79, v15, 7, 4);
  unsigned int v19 = v79;
  uint64_t v20 = bswap32(v79);
  unsigned int v79 = v20;
  if (!v19)
  {
    uint64_t v36 = 11;
LABEL_14:
    *(_DWORD *)buf = -1431655766;
    objc_msgSend_getBytes_range_(v6, v16, (uint64_t)buf, v18, v36, 4);
    int v47 = *(_DWORD *)buf;
    *(_DWORD *)buf = bswap32(*(unsigned int *)buf);
    uint64_t v48 = v36 + 4;
    if (v47)
    {
      v49 = objc_msgSend_subdataWithRange_(v6, v44, v48, v46);
      uint64_t v50 = *(unsigned int *)buf;
      id v51 = [NSString alloc];
      uint64_t v54 = objc_msgSend_initWithData_encoding_(v51, v52, (uint64_t)v49, v53, 4);
      messageUUID = v8->_messageUUID;
      v8->_messageUUID = (NSString *)v54;

      v48 += v50;
    }
    char v56 = v80;
    if ((v80 & 0x10) != 0)
    {
      unsigned int v78 = -1431655766;
      objc_msgSend_getBytes_range_(v6, v44, (uint64_t)&v78, v46, v48, 4);
      unsigned int v57 = v78;
      unsigned int v78 = bswap32(v78);
      v48 += 4;
      if (v57)
      {
        v58 = objc_msgSend_subdataWithRange_(v6, v44, v48, v46);
        uint64_t v59 = v78;
        id v60 = [NSString alloc];
        v63 = objc_msgSend_initWithData_encoding_(v60, v61, (uint64_t)v58, v62, 4);
        objc_msgSend_setTopic_(v8, v64, (uint64_t)v63, v65);

        v48 += v59;
      }
      char v56 = v80;
    }
    v8->_payloadOffset = v48;
    unsigned int v78 = -1431655766;
    if ((v56 & 8) != 0) {
      uint64_t v66 = -4;
    }
    else {
      uint64_t v66 = 0;
    }
    uint64_t v68 = v66 + objc_msgSend_length(v6, v44, v45, v46) - v8->_payloadOffset;
    v8->_payloadLength = v68;
    char v70 = v80;
    if ((v80 & 8) != 0)
    {
      objc_msgSend_getBytes_range_(v6, v67, (uint64_t)&v78, v69, v68 + v48, 4);
      unsigned int v78 = bswap32(v78);
      id v71 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      LODWORD(v72) = v78;
      uint64_t v75 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v71, v73, v74, (double)v72);
      expiryDate = v8->_expiryDate;
      v8->_expiryDate = (NSDate *)v75;

      char v70 = v80;
    }
    *(_DWORD *)(&v8->super._wasWrittenToConnection + 2) = v82;
    LOWORD(v8->_sequenceNumber) = v81;
    v8->_expectsPeerResponse = v70 & 1;
    v8->_compressed = (v70 & 2) != 0;
    v8->_wantsAppAck = (v70 & 4) != 0;
    v8->_didWakeHint = (v70 & 0x20) != 0;
    goto LABEL_26;
  }
  if (v20 + 11 <= (unint64_t)objc_msgSend_length(v6, v16, v17, v18))
  {
    v37 = objc_msgSend_subdataWithRange_(v6, v21, 11, v22, v79);
    uint64_t v38 = v79;
    id v39 = [NSString alloc];
    uint64_t v42 = objc_msgSend_initWithData_encoding_(v39, v40, (uint64_t)v37, v41, 4);
    peerResponseIdentifier = v8->_peerResponseIdentifier;
    v8->_peerResponseIdentifier = (NSString *)v42;

    uint64_t v36 = v38 + 11;
    goto LABEL_14;
  }
  v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v27 = v79;
    int v28 = objc_msgSend_length(v6, v24, v25, v26);
    *(_DWORD *)buf = 67109632;
    int v85 = 11;
    __int16 v86 = 1024;
    unsigned int v87 = v27;
    __int16 v88 = 1024;
    int v89 = v28;
    _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "Response identifier length is bigger than packet size, offset %u identifier length %u packet length %u\n", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      objc_msgSend_length(v6, v29, v30, v31);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      objc_msgSend_length(v6, v32, v33, v34);
      IMLogString();
    }
  }
  v35 = 0;
LABEL_27:

  return v35;
}

- (IDSSocketPairDataMessage)initWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 expectsPeerResponse:(BOOL)a5 wantsAppAck:(BOOL)a6 compressed:(BOOL)a7 didWakeHint:(BOOL)a8 peerResponseIdentifier:(id)a9 messageUUID:(id)a10 data:(id)a11 expiryDate:(id)a12
{
  id v25 = a9;
  id v24 = a10;
  id v16 = a11;
  id v17 = a12;
  v26.receiver = self;
  v26.super_class = (Class)IDSSocketPairDataMessage;
  double v18 = [(IDSSocketPairDataMessage *)&v26 init];
  unsigned int v19 = v18;
  if (v18)
  {
    *(_DWORD *)(&v18->super._wasWrittenToConnection + 2) = a3;
    LOWORD(v18->_sequenceNumber) = a4;
    objc_storeStrong((id *)&v18->_data, a11);
    v19->_expectsPeerResponse = a5;
    v19->_compressed = a7;
    v19->_wantsAppAck = a6;
    v19->_didWakeHint = a8;
    objc_storeStrong((id *)&v19->_peerResponseIdentifier, a9);
    objc_storeStrong((id *)&v19->_messageUUID, a10);
    objc_storeStrong((id *)&v19->_expiryDate, a12);
  }

  return v19;
}

- (unsigned)command
{
  return 0;
}

- (NSData)data
{
  data = self->_data;
  if (data)
  {
    v5 = data;
  }
  else
  {
    v7 = objc_msgSend__existingUnderlyingData(self, a2, v2, v3);
    objc_msgSend_subdataWithRangeNoCopy_(v7, v8, self->_payloadOffset, v9, self->_payloadLength);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_nonHeaderData
{
  v5 = objc_msgSend_data(MEMORY[0x1E4F1CA58], a2, v2, v3);
  unsigned int v82 = bswap32(objc_msgSend_sequenceNumber(self, v6, v7, v8));
  objc_msgSend_appendBytes_length_(v5, v9, (uint64_t)&v82, v10, 4);
  __int16 v81 = __rev16(objc_msgSend_streamID(self, v11, v12, v13));
  objc_msgSend_appendBytes_length_(v5, v14, (uint64_t)&v81, v15, 2);
  char expectsPeerResponse = self->_expectsPeerResponse;
  char v80 = expectsPeerResponse;
  if (self->_compressed)
  {
    expectsPeerResponse |= 2u;
    char v80 = expectsPeerResponse;
  }
  if (self->_wantsAppAck)
  {
    expectsPeerResponse |= 4u;
    char v80 = expectsPeerResponse;
  }
  if (self->_expiryDate)
  {
    expectsPeerResponse |= 8u;
    char v80 = expectsPeerResponse;
  }
  uint64_t v20 = objc_msgSend_topic(self, v16, v17, v18);
  if (v20)
  {
    id v24 = (void *)v20;
    int v25 = objc_msgSend_useDynamicServiceName(self, v21, v22, v23);

    if (v25)
    {
      expectsPeerResponse |= 0x10u;
      char v80 = expectsPeerResponse;
    }
  }
  if (self->_didWakeHint) {
    char v80 = expectsPeerResponse | 0x20;
  }
  objc_msgSend_appendBytes_length_(v5, v21, (uint64_t)&v80, v23, 1);
  int v28 = objc_msgSend_dataUsingEncoding_(self->_peerResponseIdentifier, v26, 4, v27);
  unsigned int v79 = bswap32(objc_msgSend_length(v28, v29, v30, v31));
  objc_msgSend_appendBytes_length_(v5, v32, (uint64_t)&v79, v33, 4);
  if (v79) {
    objc_msgSend_appendData_(v5, v34, (uint64_t)v28, v35);
  }
  uint64_t v36 = objc_msgSend_dataUsingEncoding_(self->_messageUUID, v34, 4, v35);
  unsigned int v78 = bswap32(objc_msgSend_length(v36, v37, v38, v39));
  objc_msgSend_appendBytes_length_(v5, v40, (uint64_t)&v78, v41, 4);
  if (v78) {
    objc_msgSend_appendData_(v5, v42, (uint64_t)v36, v44);
  }
  uint64_t v45 = objc_msgSend_topic(self, v42, v43, v44);
  if (v45)
  {
    v49 = (void *)v45;
    int v50 = objc_msgSend_useDynamicServiceName(self, v46, v47, v48);

    if (v50)
    {
      id v51 = objc_msgSend_topic(self, v46, v47, v48);
      uint64_t v54 = objc_msgSend_dataUsingEncoding_(v51, v52, 4, v53);

      unsigned int v77 = bswap32(objc_msgSend_length(v54, v55, v56, v57));
      objc_msgSend_appendBytes_length_(v5, v58, (uint64_t)&v77, v59, 4);
      if (v77) {
        objc_msgSend_appendData_(v5, v60, (uint64_t)v54, v61);
      }
    }
  }
  double v62 = objc_msgSend_data(self, v46, v47, v48);
  uint64_t v66 = objc_msgSend_length(v62, v63, v64, v65);

  if (v66)
  {
    char v70 = objc_msgSend_data(self, v67, v68, v69);
    objc_msgSend_appendData_(v5, v71, (uint64_t)v70, v72);
  }
  expiryDate = self->_expiryDate;
  if (expiryDate)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(expiryDate, v67, v68, v69);
    unsigned int v77 = bswap32(v74);
    objc_msgSend_appendBytes_length_(v5, v75, (uint64_t)&v77, v74, 4);
  }

  return v5;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (BOOL)expectsPeerResponse
{
  return self->_expectsPeerResponse;
}

- (NSString)peerResponseIdentifier
{
  return self->_peerResponseIdentifier;
}

- (BOOL)wantsAppAck
{
  return self->_wantsAppAck;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
}

- (BOOL)didWakeHint
{
  return self->_didWakeHint;
}

- (void)setDidWakeHint:(BOOL)a3
{
  self->_didWakeHint = a3;
}

- (unsigned)streamID
{
  return self->_sequenceNumber;
}

- (void)setStreamID:(unsigned __int16)a3
{
  LOWORD(self->_sequenceNumber) = a3;
}

- (unsigned)sequenceNumber
{
  return *(_DWORD *)(&self->super._wasWrittenToConnection + 2);
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_DWORD *)(&self->super._wasWrittenToConnection + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end