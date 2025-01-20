@interface IDSSocketPairFragmentedMessage
+ (id)createMessageFragmentsFromOriginalMessage:(id)a3 withFragmentedMessageID:(unsigned int)a4 fragmentSize:(unsigned int)a5;
+ (id)createOriginalMessageFromFragmentedMessages:(id)a3;
- (IDSSocketPairFragmentedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (IDSSocketPairFragmentedMessage)initWithData:(id)a3 withFragmentedMessageID:(unsigned int)a4 fragmentIndex:(unsigned int)a5 totalFragmentCount:(unsigned int)a6;
- (NSData)data;
- (id)_nonHeaderData;
- (id)description;
- (unsigned)command;
- (unsigned)fragmentIndex;
- (unsigned)fragmentedMessageID;
- (unsigned)totalFragmentCount;
@end

@implementation IDSSocketPairFragmentedMessage

- (IDSSocketPairFragmentedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSSocketPairFragmentedMessage;
  v7 = [(IDSSocketPairMessage *)&v14 initWithCommand:v4 underlyingData:v6];
  if (v7)
  {
    id v8 = v6;
    v12 = (unsigned int *)objc_msgSend_bytes(v8, v9, v10, v11);
    v7->_fragmentedMessageID = bswap32(*v12);
    v7->_fragmentIndex = bswap32(v12[1]);
    v7->_totalFragmentCount = bswap32(v12[2]);
    v7->_offset = 12;
  }

  return v7;
}

- (IDSSocketPairFragmentedMessage)initWithData:(id)a3 withFragmentedMessageID:(unsigned int)a4 fragmentIndex:(unsigned int)a5 totalFragmentCount:(unsigned int)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSSocketPairFragmentedMessage;
  v12 = [(IDSSocketPairFragmentedMessage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_fragmentedMessageID = a4;
    v12->_fragmentIndex = a5;
    v12->_totalFragmentCount = a6;
    objc_storeStrong((id *)&v12->_data, a3);
  }

  return v13;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"fragmentedMessage: ID: %u, index: %u, total: %u", v2, self->_fragmentedMessageID, self->_fragmentIndex, self->_totalFragmentCount);
}

- (unsigned)command
{
  return 21;
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
    v7 = objc_msgSend_underlyingData(self, a2, v2, v3);
    unint64_t offset = self->_offset;
    v12 = objc_msgSend__existingUnderlyingData(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_length(v12, v13, v14, v15);
    objc_msgSend_subdataWithRangeNoCopy_(v7, v17, offset, v18, v16 - self->_offset);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_nonHeaderData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  unsigned int v15 = bswap32(self->_fragmentedMessageID);
  objc_msgSend_appendBytes_length_(v3, v4, (uint64_t)&v15, v5, 4);
  unsigned int v14 = bswap32(self->_fragmentIndex);
  objc_msgSend_appendBytes_length_(v3, v6, (uint64_t)&v14, v7, 4);
  unsigned int v13 = bswap32(self->_totalFragmentCount);
  objc_msgSend_appendBytes_length_(v3, v8, (uint64_t)&v13, v9, 4);
  objc_msgSend_appendData_(v3, v10, (uint64_t)self->_data, v11);
  return v3;
}

+ (id)createOriginalMessageFromFragmentedMessages:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_count(v3, v4, v5, v6);
  if (!v7)
  {
    v61 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v65 = 0;
      _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "createOriginalMessageFromFragmentedMessages: have %u pieces, nothing created", buf, 8u);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_30;
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (!IMShouldLog()) {
      goto LABEL_30;
    }
LABEL_29:
    IMLogString();
LABEL_30:
    v40 = 0;
    goto LABEL_40;
  }
  unsigned int v10 = v7;
  double v11 = objc_msgSend_objectAtIndex_(v3, v8, 0, v9);
  unsigned int v15 = objc_msgSend_totalFragmentCount(v11, v12, v13, v14);

  if (!v15) {
    goto LABEL_16;
  }
  uint64_t v18 = 0;
  LODWORD(v19) = 0;
  uint64_t v20 = v15;
  do
  {
    v21 = objc_msgSend_objectAtIndex_(v3, v16, v18, v17);
    v25 = objc_msgSend_data(v21, v22, v23, v24);
    uint64_t v19 = v19 + objc_msgSend_length(v25, v26, v27, v28);

    ++v18;
  }
  while (v15 != v18);
  if (!v19)
  {
LABEL_16:
    v60 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v65 = v10;
      __int16 v66 = 1024;
      unsigned int v67 = v15;
      _os_log_impl(&dword_19D9BE000, v60, OS_LOG_TYPE_DEFAULT, "FragmentedMessage: have %u pieces, %u expected, 0 length", buf, 0xEu);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_30;
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (!IMShouldLog()) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  v30 = objc_msgSend_dataWithCapacity_(MEMORY[0x1E4F1CA58], v16, v19, v17);
  if (v30)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      v33 = objc_msgSend_objectAtIndex_(v3, v29, i, v31);
      v37 = objc_msgSend_data(v33, v34, v35, v36);
      objc_msgSend_appendData_(v30, v38, (uint64_t)v37, v39);
    }
    v40 = objc_msgSend_messageWithData_(IDSSocketPairMessage, v29, (uint64_t)v30, v31);
    v41 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      unsigned int v65 = objc_msgSend_command(v40, v42, v43, v44);
      __int16 v66 = 1024;
      unsigned int v67 = objc_msgSend_length(v30, v45, v46, v47);
      __int16 v68 = 1024;
      unsigned int v69 = v10;
      _os_log_impl(&dword_19D9BE000, v41, OS_LOG_TYPE_DEFAULT, "createOriginalMessageFromFragmentedMessages: made cmd %u length %u from %u pieces", buf, 0x14u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        objc_msgSend_command(v40, v48, v49, v50);
        objc_msgSend_length(v30, v51, v52, v53);
        MarcoLog();
      }
      if (IMShouldLog())
      {
        objc_msgSend_command(v40, v54, v55, v56);
        objc_msgSend_length(v30, v57, v58, v59);
        IMLogString();
      }
    }
  }
  else
  {
    v62 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      unsigned int v65 = v19;
      __int16 v66 = 1024;
      unsigned int v67 = v10;
      __int16 v68 = 1024;
      unsigned int v69 = v15;
      _os_log_impl(&dword_19D9BE000, v62, OS_LOG_TYPE_DEFAULT, "FragmentedMessage: can't create NSMutableData of %u length (have %u pieces, %u expected)", buf, 0x14u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    v40 = 0;
  }

LABEL_40:
  return v40;
}

+ (id)createMessageFragmentsFromOriginalMessage:(id)a3 withFragmentedMessageID:(unsigned int)a4 fragmentSize:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  uint64_t v9 = a5 - objc_msgSend_headerDataSize(IDSSocketPairMessage, v6, v7, v8) - 12;
  unsigned int v13 = objc_msgSend_length(v46, v10, v11, v12);
  unsigned int v14 = v13 / v9;
  uint64_t v15 = v13 % v9;
  if (v15) {
    uint64_t v16 = v14 + 1;
  }
  else {
    uint64_t v16 = v14;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v43 = v14 + 1;
  v21 = objc_msgSend_initWithCapacity_(v17, v18, v43, v19);
  unsigned int v44 = v13;
  if (v9 > v13)
  {
    uint64_t v23 = 0;
    if (!v15) {
      goto LABEL_13;
    }
LABEL_12:
    v33 = objc_msgSend_subdataWithRangeNoCopy_(v46, v20, (v23 * v9), v22, v15);
    v34 = [IDSSocketPairFragmentedMessage alloc];
    v37 = objc_msgSend_initWithData_withFragmentedMessageID_fragmentIndex_totalFragmentCount_(v34, v35, (uint64_t)v33, v36, v5, v23, v43);
    objc_msgSend_addObject_(v21, v38, (uint64_t)v37, v39);

    goto LABEL_13;
  }
  uint64_t v42 = v13 % v9;
  unsigned int v24 = 0;
  uint64_t v25 = 0;
  if (v14 <= 1) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = v14;
  }
  do
  {
    v26 = objc_msgSend_subdataWithRangeNoCopy_(v46, v20, v24, v22, v9);
    uint64_t v27 = [IDSSocketPairFragmentedMessage alloc];
    v30 = objc_msgSend_initWithData_withFragmentedMessageID_fragmentIndex_totalFragmentCount_(v27, v28, (uint64_t)v26, v29, v5, v25, v16);
    objc_msgSend_addObject_(v21, v31, (uint64_t)v30, v32);

    ++v25;
    v24 += v9;
  }
  while (v23 != v25);
  uint64_t v15 = v42;
  if (v42) {
    goto LABEL_12;
  }
LABEL_13:
  v40 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v48 = v16;
    __int16 v49 = 1024;
    unsigned int v50 = v44;
    __int16 v51 = 1024;
    unsigned int v52 = a5;
    _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "createMessageFragmentsFromOriginalMessage: made %u pieces from %u length at %u per fragment", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
      IMLogString();
    }
  }

  return v21;
}

- (unsigned)fragmentedMessageID
{
  return self->_fragmentedMessageID;
}

- (unsigned)fragmentIndex
{
  return self->_fragmentIndex;
}

- (unsigned)totalFragmentCount
{
  return self->_totalFragmentCount;
}

- (void).cxx_destruct
{
}

@end