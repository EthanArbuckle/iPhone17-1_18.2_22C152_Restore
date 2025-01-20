@interface IDSSocketPairProtobufMessage
- (BOOL)compressed;
- (BOOL)didWakeHint;
- (BOOL)expectsPeerResponse;
- (BOOL)wantsAppAck;
- (IDSSocketPairProtobufMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (IDSSocketPairProtobufMessage)initWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 expectsPeerResponse:(BOOL)a5 wantsAppAck:(BOOL)a6 compressed:(BOOL)a7 didWakeHint:(BOOL)a8 peerResponseIdentifier:(id)a9 messageUUID:(id)a10 expiryDate:(id)a11 protobuf:(id)a12;
- (NSData)data;
- (NSDate)expiryDate;
- (NSString)messageUUID;
- (NSString)peerResponseIdentifier;
- (id)_nonHeaderData;
- (unsigned)command;
- (unsigned)isResponse;
- (unsigned)sequenceNumber;
- (unsigned)streamID;
- (unsigned)type;
- (void)setCompressed:(BOOL)a3;
- (void)setDidWakeHint:(BOOL)a3;
- (void)setExpiryDate:(id)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setStreamID:(unsigned __int16)a3;
@end

@implementation IDSSocketPairProtobufMessage

- (IDSSocketPairProtobufMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v91.receiver = self;
  v91.super_class = (Class)IDSSocketPairProtobufMessage;
  v7 = [(IDSSocketPairMessage *)&v91 initWithCommand:v4 underlyingData:v6];
  if (!v7)
  {
LABEL_26:
    v36 = v7;
    goto LABEL_27;
  }
  v8 = (void *)MEMORY[0x19F3AEEF0]();
  unsigned int v90 = -1431655766;
  objc_msgSend_getBytes_range_(v6, v9, (uint64_t)&v90, v10, 0, 4);
  unsigned int v90 = bswap32(v90);
  unsigned __int16 v89 = -21846;
  objc_msgSend_getBytes_range_(v6, v11, (uint64_t)&v89, v12, 4, 2);
  unsigned __int16 v89 = bswap32(v89) >> 16;
  char v88 = -86;
  objc_msgSend_getBytes_range_(v6, v13, (uint64_t)&v88, v14, 6, 1);
  unsigned int v87 = -1431655766;
  objc_msgSend_getBytes_range_(v6, v15, (uint64_t)&v87, v16, 7, 4);
  unsigned int v20 = v87;
  uint64_t v21 = bswap32(v87);
  unsigned int v87 = v21;
  if (!v20)
  {
    uint64_t v37 = 11;
LABEL_14:
    *(_DWORD *)buf = -1431655766;
    objc_msgSend_getBytes_range_(v6, v17, (uint64_t)buf, v19, v37, 4);
    int v47 = *(_DWORD *)buf;
    *(_DWORD *)buf = bswap32(*(unsigned int *)buf);
    uint64_t v48 = v37 + 4;
    if (v47)
    {
      v49 = objc_msgSend_subdataWithRange_(v6, v45, v48, v46);
      uint64_t v50 = *(unsigned int *)buf;
      id v51 = [NSString alloc];
      uint64_t v54 = objc_msgSend_initWithData_encoding_(v51, v52, (uint64_t)v49, v53, 4);
      messageUUID = v7->_messageUUID;
      v7->_messageUUID = (NSString *)v54;

      v48 += v50;
    }
    char v56 = v88;
    if ((v88 & 0x10) != 0)
    {
      unsigned int v86 = -1431655766;
      objc_msgSend_getBytes_range_(v6, v45, (uint64_t)&v86, v46, v48, 4);
      unsigned int v57 = v86;
      unsigned int v86 = bswap32(v86);
      v48 += 4;
      if (v57)
      {
        v58 = objc_msgSend_subdataWithRange_(v6, v45, v48, v46);
        uint64_t v59 = v86;
        id v60 = [NSString alloc];
        v63 = objc_msgSend_initWithData_encoding_(v60, v61, (uint64_t)v58, v62, 4);
        objc_msgSend_setTopic_(v7, v64, (uint64_t)v63, v65);

        v48 += v59;
      }
      char v56 = v88;
    }
    v7->_sequenceNumber = v90;
    v7->_streamID = v89;
    v7->_expectsPeerResponse = v56 & 1;
    v7->_compressed = (v56 & 2) != 0;
    v7->_wantsAppAck = (v56 & 4) != 0;
    v7->_didWakeHint = (v56 & 0x20) != 0;
    objc_msgSend_getBytes_range_(v6, v45, (uint64_t)&v7->_type, v46, v48, 2);
    v7->_type = bswap32(v7->_type) >> 16;
    objc_msgSend_getBytes_range_(v6, v66, (uint64_t)&v7->_isResponse, v67, v48 + 2, 2);
    v7->_isResponse = bswap32(v7->_isResponse) >> 16;
    unsigned int v86 = 0;
    objc_msgSend_getBytes_range_(v6, v68, (uint64_t)&v86, v69, v48 + 4, 4);
    unsigned int v85 = -1431655766;
    unsigned int v86 = bswap32(v86);
    unint64_t v73 = v48 + 8;
    v7->_payloadOffset = v73;
    if ((v88 & 8) != 0) {
      uint64_t v74 = -4;
    }
    else {
      uint64_t v74 = 0;
    }
    unint64_t v76 = v74 + objc_msgSend_length(v6, v70, v71, v72) - v7->_payloadOffset;
    v7->_payloadLength = v76;
    if ((v88 & 8) != 0)
    {
      objc_msgSend_getBytes_range_(v6, v75, (uint64_t)&v85, v77, v76 + v73, 4);
      unsigned int v85 = bswap32(v85);
      id v78 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      LODWORD(v79) = v85;
      uint64_t v82 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v78, v80, v81, (double)v79);
      expiryDate = v7->_expiryDate;
      v7->_expiryDate = (NSDate *)v82;
    }
    goto LABEL_26;
  }
  if (v21 + 11 <= (unint64_t)objc_msgSend_length(v6, v17, v18, v19))
  {
    v38 = objc_msgSend_subdataWithRange_(v6, v22, 11, v23, v87);
    uint64_t v39 = v87;
    id v40 = [NSString alloc];
    uint64_t v43 = objc_msgSend_initWithData_encoding_(v40, v41, (uint64_t)v38, v42, 4);
    peerResponseIdentifier = v7->_peerResponseIdentifier;
    v7->_peerResponseIdentifier = (NSString *)v43;

    uint64_t v37 = v39 + 11;
    goto LABEL_14;
  }
  v24 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v28 = v87;
    int v29 = objc_msgSend_length(v6, v25, v26, v27);
    *(_DWORD *)buf = 67109632;
    int v93 = 11;
    __int16 v94 = 1024;
    unsigned int v95 = v28;
    __int16 v96 = 1024;
    int v97 = v29;
    _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "Response identifier length is bigger than packet size, offset %u identifier length %u packet length %u\n", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      objc_msgSend_length(v6, v30, v31, v32);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      objc_msgSend_length(v6, v33, v34, v35);
      IMLogString();
    }
  }
  v36 = 0;
LABEL_27:

  return v36;
}

- (IDSSocketPairProtobufMessage)initWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 expectsPeerResponse:(BOOL)a5 wantsAppAck:(BOOL)a6 compressed:(BOOL)a7 didWakeHint:(BOOL)a8 peerResponseIdentifier:(id)a9 messageUUID:(id)a10 expiryDate:(id)a11 protobuf:(id)a12
{
  id v35 = a9;
  id v16 = a10;
  id v17 = a11;
  id v18 = a12;
  v36.receiver = self;
  v36.super_class = (Class)IDSSocketPairProtobufMessage;
  uint64_t v21 = [(IDSSocketPairProtobufMessage *)&v36 init];
  if (v21)
  {
    v21->_isResponse = objc_msgSend_isResponse(v18, v19, v20, v22);
    v21->_type = objc_msgSend_type(v18, v23, v24, v25);
    uint64_t v29 = objc_msgSend_data(v18, v26, v27, v28);
    data = v21->_data;
    v21->_data = (NSData *)v29;

    v21->_sequenceNumber = a3;
    v21->_streamID = a4;
    v21->_expectsPeerResponse = a5;
    v21->_wantsAppAck = a6;
    v21->_compressed = a7;
    v21->_didWakeHint = a8;
    objc_storeStrong((id *)&v21->_peerResponseIdentifier, a9);
    objc_storeStrong((id *)&v21->_messageUUID, a10);
    objc_storeStrong((id *)&v21->_expiryDate, a11);
  }

  return v21;
}

- (unsigned)command
{
  return 3;
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
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  unsigned int v103 = bswap32(objc_msgSend_sequenceNumber(self, v4, v5, v6));
  objc_msgSend_appendBytes_length_(v3, v7, (uint64_t)&v103, v8, 4);
  __int16 v102 = __rev16(objc_msgSend_streamID(self, v9, v10, v11));
  objc_msgSend_appendBytes_length_(v3, v12, (uint64_t)&v102, v13, 2);
  char expectsPeerResponse = self->_expectsPeerResponse;
  char v101 = expectsPeerResponse;
  if (self->_compressed)
  {
    expectsPeerResponse |= 2u;
    char v101 = expectsPeerResponse;
  }
  if (self->_wantsAppAck)
  {
    expectsPeerResponse |= 4u;
    char v101 = expectsPeerResponse;
  }
  if (self->_expiryDate)
  {
    expectsPeerResponse |= 8u;
    char v101 = expectsPeerResponse;
  }
  uint64_t v18 = objc_msgSend_topic(self, v14, v15, v16);
  if (v18)
  {
    double v22 = (void *)v18;
    int v23 = objc_msgSend_useDynamicServiceName(self, v19, v20, v21);

    if (v23)
    {
      expectsPeerResponse |= 0x10u;
      char v101 = expectsPeerResponse;
    }
  }
  if (self->_didWakeHint) {
    char v101 = expectsPeerResponse | 0x20;
  }
  objc_msgSend_appendBytes_length_(v3, v19, (uint64_t)&v101, v21, 1);
  uint64_t v26 = objc_msgSend_dataUsingEncoding_(self->_peerResponseIdentifier, v24, 4, v25);
  unsigned int v100 = bswap32(objc_msgSend_length(v26, v27, v28, v29));
  objc_msgSend_appendBytes_length_(v3, v30, (uint64_t)&v100, v31, 4);
  if (v100) {
    objc_msgSend_appendData_(v3, v32, (uint64_t)v26, v33);
  }
  uint64_t v34 = objc_msgSend_dataUsingEncoding_(self->_messageUUID, v32, 4, v33);
  unsigned int v99 = bswap32(objc_msgSend_length(v34, v35, v36, v37));
  objc_msgSend_appendBytes_length_(v3, v38, (uint64_t)&v99, v39, 4);
  if (v99) {
    objc_msgSend_appendData_(v3, v40, (uint64_t)v34, v42);
  }
  uint64_t v43 = objc_msgSend_topic(self, v40, v41, v42);
  if (v43)
  {
    int v47 = (void *)v43;
    int v48 = objc_msgSend_useDynamicServiceName(self, v44, v45, v46);

    if (v48)
    {
      v49 = objc_msgSend_topic(self, v44, v45, v46);
      v52 = objc_msgSend_dataUsingEncoding_(v49, v50, 4, v51);

      unsigned int v98 = bswap32(objc_msgSend_length(v52, v53, v54, v55));
      objc_msgSend_appendBytes_length_(v3, v56, (uint64_t)&v98, v57, 4);
      if (v98) {
        objc_msgSend_appendData_(v3, v58, (uint64_t)v52, v59);
      }
    }
  }
  __int16 v97 = __rev16(objc_msgSend_type(self, v44, v45, v46));
  objc_msgSend_appendBytes_length_(v3, v60, (uint64_t)&v97, v61, 2);
  __int16 v96 = __rev16(objc_msgSend_isResponse(self, v62, v63, v64));
  objc_msgSend_appendBytes_length_(v3, v65, (uint64_t)&v96, v66, 2);
  v70 = objc_msgSend_data(self, v67, v68, v69);
  unsigned int v74 = bswap32(objc_msgSend_length(v70, v71, v72, v73));

  unsigned int v98 = v74;
  objc_msgSend_appendBytes_length_(v3, v75, (uint64_t)&v98, v76, 4);
  v80 = objc_msgSend_data(self, v77, v78, v79);
  uint64_t v84 = objc_msgSend_length(v80, v81, v82, v83);

  if (v84)
  {
    char v88 = objc_msgSend_data(self, v85, v86, v87);
    objc_msgSend_appendData_(v3, v89, (uint64_t)v88, v90);
  }
  expiryDate = self->_expiryDate;
  if (expiryDate)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(expiryDate, v85, v86, v87);
    unsigned int v95 = bswap32(v92);
    objc_msgSend_appendBytes_length_(v3, v93, (uint64_t)&v95, v92, 4);
  }

  return v3;
}

- (BOOL)expectsPeerResponse
{
  return self->_expectsPeerResponse;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (BOOL)wantsAppAck
{
  return self->_wantsAppAck;
}

- (NSString)peerResponseIdentifier
{
  return self->_peerResponseIdentifier;
}

- (unsigned)isResponse
{
  return self->_isResponse;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end