@interface IDSSocketPairResourceTransferSender
- (BOOL)isDone;
- (BOOL)readNextBytes:(id *)a3 byteOffset:(unint64_t *)a4;
- (BOOL)resumeResourceTransfers;
- (BOOL)sentFirstMessage;
- (IDSSocketPairResourceTransferSender)initWithResourceAtPath:(id)a3 metadata:(id)a4 sequenceNumber:(unsigned int)a5 streamID:(unsigned __int16)a6 expectsPeerResponse:(BOOL)a7 wantsAppAck:(BOOL)a8 compressPayload:(BOOL)a9 compressed:(BOOL)a10 didWakeHint:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 expiryDate:(id)a14;
- (NSString)messageUUID;
- (id)description;
- (id)nextMessage;
- (id)nextMessage_old;
- (id)readNextBytes;
- (unint64_t)nextByte;
- (unint64_t)totalBytes;
- (unsigned)command;
- (unsigned)maxChunkSize;
- (unsigned)sequenceNumber;
- (unsigned)streamID;
- (void)closeFileAndMarkDone;
- (void)dealloc;
- (void)reset;
- (void)setMaxChunkSize:(unsigned int)a3;
- (void)setNextByte:(unint64_t)a3;
- (void)setResumeResourceTransfers:(BOOL)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setStreamID:(unsigned __int16)a3;
@end

@implementation IDSSocketPairResourceTransferSender

- (IDSSocketPairResourceTransferSender)initWithResourceAtPath:(id)a3 metadata:(id)a4 sequenceNumber:(unsigned int)a5 streamID:(unsigned __int16)a6 expectsPeerResponse:(BOOL)a7 wantsAppAck:(BOOL)a8 compressPayload:(BOOL)a9 compressed:(BOOL)a10 didWakeHint:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 expiryDate:(id)a14
{
  BOOL v45 = a7;
  BOOL v46 = a8;
  int v44 = a6;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v47 = a4;
  id v48 = a12;
  id v18 = a13;
  id v19 = a14;
  v50.receiver = self;
  v50.super_class = (Class)IDSSocketPairResourceTransferSender;
  v20 = [(IDSSocketPairResourceTransferSender *)&v50 init];
  if (v20)
  {
    v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138414594;
      unint64_t v52 = (unint64_t)v17;
      __int16 v53 = 2112;
      id v54 = v47;
      if (v45) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      __int16 v55 = 2048;
      if (v46) {
        v23 = @"YES";
      }
      else {
        v23 = @"NO";
      }
      uint64_t v56 = a5;
      __int16 v57 = 1024;
      if (a10) {
        v24 = @"YES";
      }
      else {
        v24 = @"NO";
      }
      int v58 = v44;
      __int16 v59 = 2112;
      v60 = v22;
      __int16 v61 = 2112;
      v62 = v23;
      __int16 v63 = 2112;
      v64 = v24;
      __int16 v65 = 2112;
      id v66 = v48;
      __int16 v67 = 2112;
      id v68 = v18;
      __int16 v69 = 2112;
      id v70 = v19;
      _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: created with path %@  metadata %@ sequenceNumber %lu streamID %u expectsPeerResponse %@ wantsAppAck %@ compressed %@ peerResponseIdentifier %@ messageUUID %@ expiryDate %@", buf, 0x62u);
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
    objc_storeStrong((id *)&v20->_resourcePath, a3);
    objc_storeStrong((id *)&v20->_metadata, a4);
    v28 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v25, v26, v27);
    id v49 = 0;
    uint64_t v31 = objc_msgSend_attributesOfItemAtPath_error_(v28, v29, (uint64_t)v17, v30, &v49);
    id v42 = v49;
    resourceAttributes = v20->_resourceAttributes;
    v20->_resourceAttributes = (NSDictionary *)v31;

    v36 = v20->_resourceAttributes;
    if (v36)
    {
      unint64_t v37 = objc_msgSend_fileSize(v36, v33, v34, v35);
      v20->_unint64_t totalBytes = v37;
      if (!v37) {
        goto LABEL_35;
      }
      if (!HIBYTE(v37))
      {
LABEL_36:
        v20->_sequenceNumber = a5;
        v20->_streamID = v44;
        v20->_expectsPeerResponse = v45;
        v20->_wantsAppAck = v46;
        v20->_compressPayload = a9;
        v20->_compressed = a10;
        v20->_didWakeHint = a11;
        objc_storeStrong((id *)&v20->_peerResponseIdentifier, a12);
        objc_storeStrong((id *)&v20->_messageUUID, a13);
        v20->_maxChunkSize = 4000;
        v20->_fileDescriptor = -1;
        objc_storeStrong((id *)&v20->_expiryDate, a14);

        goto LABEL_37;
      }
      v38 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t totalBytes = v20->_totalBytes;
        *(_DWORD *)buf = 134217984;
        unint64_t v52 = totalBytes;
        _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: file too big %llu", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_35;
      }
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (!IMShouldLog())
      {
LABEL_35:
        v20->_done = 1;
        goto LABEL_36;
      }
    }
    else
    {
      v40 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v52 = (unint64_t)v42;
        _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: unable to read file attributes %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_35;
      }
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (!IMShouldLog()) {
        goto LABEL_35;
      }
    }
    IMLogString();
    goto LABEL_35;
  }
LABEL_37:

  return v20;
}

- (id)description
{
  v3 = @"YES";
  if (self->_resourceAttributes) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (self->_metadata) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (!self->_sentFirstMessage) {
    v3 = @"NO";
  }
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"IDSSocketPairResourceTransferSender: path: %@  attributes: %@  metadata: %@  sentFirstMessage: %@  nextbyte: %llu  totalbytes: %llu  messageUUID: %@  filedescriptor: %d expiryDate: %@", v2, self->_resourcePath, v4, v5, v3, self->_nextByte, self->_totalBytes, self->_messageUUID, self->_fileDescriptor, self->_expiryDate);
}

- (unsigned)command
{
  return 53;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    resourcePath = self->_resourcePath;
    resourceAttributes = self->_resourceAttributes;
    int fileDescriptor = self->_fileDescriptor;
    messageUUID = self->_messageUUID;
    *(_DWORD *)buf = 138413058;
    v15 = resourcePath;
    __int16 v16 = 2112;
    id v17 = resourceAttributes;
    __int16 v18 = 1024;
    int v19 = fileDescriptor;
    __int16 v20 = 2112;
    v21 = messageUUID;
    _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: done with %@ attributes %@ fd %d messageUUID %@", buf, 0x26u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v11 = self->_fileDescriptor;
      v12 = self->_messageUUID;
      v9 = self->_resourcePath;
      v10 = self->_resourceAttributes;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v11 = self->_fileDescriptor;
      v12 = self->_messageUUID;
      v9 = self->_resourcePath;
      v10 = self->_resourceAttributes;
      IMLogString();
    }
  }
  int v8 = self->_fileDescriptor;
  if (v8 != -1) {
    close(v8);
  }
  v13.receiver = self;
  v13.super_class = (Class)IDSSocketPairResourceTransferSender;
  [(IDSSocketPairResourceTransferSender *)&v13 dealloc];
}

- (void)closeFileAndMarkDone
{
  self->_int fileDescriptor = -1;
  self->_done = 1;
}

- (BOOL)readNextBytes:(id *)a3 byteOffset:(unint64_t *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (self->_done)
  {
    v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: already done reading", buf, 2u);
    }

    int v5 = os_log_shim_legacy_logging_enabled();
    if (v5)
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      int v5 = IMShouldLog();
      if (v5)
      {
LABEL_8:
        IMLogString();
LABEL_63:
        LOBYTE(v5) = 0;
      }
    }
  }
  else if (self->_fileDescriptor == -1)
  {
    v29 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: file not open", buf, 2u);
    }

    int v5 = os_log_shim_legacy_logging_enabled();
    if (v5)
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      int v5 = IMShouldLog();
      if (v5) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    unint64_t nextByte = self->_nextByte;
    unint64_t totalBytes = self->_totalBytes;
    BOOL v9 = totalBytes >= nextByte;
    unint64_t v10 = totalBytes - nextByte;
    if (v10 == 0 || !v9)
    {
      double v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: no more bytes to read - should not happen", buf, 2u);
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
      objc_msgSend_closeFileAndMarkDone(self, v32, v33, v34);
      goto LABEL_63;
    }
    if (v10 >= self->_maxChunkSize) {
      size_t maxChunkSize = self->_maxChunkSize;
    }
    else {
      size_t maxChunkSize = v10;
    }
    if (self->_resumeResourceTransfers) {
      size_t v14 = maxChunkSize;
    }
    else {
      size_t v14 = maxChunkSize + 8;
    }
    v15 = malloc_type_malloc(v14, 0x87493E0uLL);
    if (!v15)
    {
      double v35 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v48 = maxChunkSize + 8;
        _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: malloc failed for %llu", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          unint64_t v45 = maxChunkSize + 8;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          unint64_t v45 = maxChunkSize + 8;
          IMLogString();
        }
      }
      objc_msgSend_closeFileAndMarkDone(self, v36, v37, v38, v45);
      goto LABEL_63;
    }
    __int16 v16 = v15;
    id v17 = v15;
    if (!self->_resumeResourceTransfers)
    {
      void *v15 = bswap64(self->_nextByte);
      __int16 v16 = v15 + 1;
    }
    ssize_t v18 = read(self->_fileDescriptor, v16, maxChunkSize);
    if (v18 <= 0)
    {
      int v39 = *__error();
      v40 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v48) = v39;
        _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: unable to read file (errno: %d)", buf, 8u);
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
      free(v17);
      objc_msgSend_closeFileAndMarkDone(self, v41, v42, v43);
      goto LABEL_63;
    }
    ssize_t v21 = v18;
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v19, (uint64_t)v17, v20, v14, 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = self->_nextByte;
    unint64_t v22 = self->_nextByte + v21;
    self->_unint64_t nextByte = v22;
    if (v22 == self->_totalBytes)
    {
      v23 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v24 = self->_totalBytes;
        resourcePath = self->_resourcePath;
        *(_DWORD *)buf = 134218242;
        unint64_t v48 = v24;
        __int16 v49 = 2112;
        objc_super v50 = resourcePath;
        _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: read all %llu bytes from file %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          unint64_t v45 = self->_totalBytes;
          BOOL v46 = self->_resourcePath;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          unint64_t v45 = self->_totalBytes;
          BOOL v46 = self->_resourcePath;
          IMLogString();
        }
      }
      objc_msgSend_closeFileAndMarkDone(self, v26, v27, v28, v45, v46);
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)readNextBytes
{
  id v8 = 0;
  uint64_t v9 = 0;
  int v3 = objc_msgSend_readNextBytes_byteOffset_(self, a2, (uint64_t)&v8, v2, &v9);
  id v4 = v8;
  int v5 = v4;
  id v6 = 0;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

- (id)nextMessage_old
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (!self->_sentFirstMessage)
  {
    int fileDescriptor = self->_fileDescriptor;
    if (fileDescriptor != -1) {
      close(fileDescriptor);
    }
    v15 = (const char *)objc_msgSend_fileSystemRepresentation(self->_resourcePath, a2, v2, v3);
    int v16 = open(v15, 0);
    self->_int fileDescriptor = v16;
    if (v16 == -1)
    {
      uint64_t v28 = *__error();
      v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v81) = v28;
        _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: unable to open file for read (errno %d)", buf, 8u);
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
      IDSAssertNonFatalErrnoWithSource(v28, "IDSSocketPairResourceTransferSender open() failed", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSSocketPairMessage.m", 2464, v30);
      objc_msgSend_closeFileAndMarkDone(self, v31, v32, v33);
      goto LABEL_54;
    }
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v17, v18, v19);
    unint64_t v22 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (self->_totalBytes)
    {
      uint64_t v26 = objc_msgSend_readNextBytes(self, v20, v21, v23);
      if (!v26)
      {
        objc_msgSend_closeFileAndMarkDone(self, v24, v25, v27);
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
    double v34 = self->_resourcePath;
    if (v34)
    {
      CFDictionarySetValue(v22, @"ids-message-resource-transfer-url", v34);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB7F20C();
    }

    metadata = self->_metadata;
    if (metadata) {
      CFDictionarySetValue(v22, @"ids-message-resource-transfer-metadata", metadata);
    }
    if (v26) {
      CFDictionarySetValue(v22, @"ids-message-resource-transfer-data", v26);
    }
    double v38 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v35, self->_totalBytes, v36);
    if (v38)
    {
      CFDictionarySetValue(v22, @"ids-message-resource-transfer-total-bytes", v38);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB7F184();
    }

    int v39 = NSNumber;
    objc_msgSend_timeIntervalSinceReferenceDate(self->_expiryDate, v40, v41, v42);
    BOOL v46 = objc_msgSend_numberWithDouble_(v39, v43, v44, v45);
    if (v46) {
      CFDictionarySetValue(v22, @"ids-message-resource-transfer-expiry-date", v46);
    }

    v7 = JWEncodeDictionary();
    if (v7)
    {
      self->_sentFirstMessage = 1;

      goto LABEL_42;
    }
    v73 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      resourcePath = self->_resourcePath;
      *(_DWORD *)buf = 138412290;
      v81 = resourcePath;
      _os_log_impl(&dword_19D9BE000, v73, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: failed to create first message from %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v79 = self->_resourcePath;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v79 = self->_resourcePath;
        IMLogString();
      }
    }
    objc_msgSend_closeFileAndMarkDone(self, v75, v76, v77, v79);

LABEL_53:
LABEL_54:
    v60 = 0;
    goto LABEL_55;
  }
  v7 = objc_msgSend_readNextBytes(self, a2, v2, v3);
  if (!v7)
  {
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = self->_resourcePath;
      *(_DWORD *)buf = 138412290;
      v81 = v10;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: failed to create data message from %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v79 = self->_resourcePath;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v79 = self->_resourcePath;
        IMLogString();
      }
    }
    objc_msgSend_closeFileAndMarkDone(self, v11, v12, v13, v79);
    goto LABEL_54;
  }
LABEL_42:
  id v47 = objc_msgSend__CUTCopyGzippedData(v7, v5, v6, v8);
  unint64_t v51 = objc_msgSend_length(v47, v48, v49, v50);
  unint64_t v55 = objc_msgSend_length(v7, v52, v53, v54);
  if (v51 < v55)
  {
    id v56 = v47;

    v7 = v56;
  }
  __int16 v57 = [IDSSocketPairResourceTransferMessage alloc];
  v60 = objc_msgSend_initWithSequenceNumber_streamID_expectsPeerResponse_wantsAppAck_compressed_didWakeHint_peerResponseIdentifier_messageUUID_data_expiryDate_(v57, v58, self->_sequenceNumber, v59, self->_streamID, self->_expectsPeerResponse, self->_wantsAppAck, v51 < v55, self->_didWakeHint, self->_peerResponseIdentifier, self->_messageUUID, v7, 0);
  v64 = objc_msgSend_topic(self, v61, v62, v63);
  objc_msgSend_setTopic_(v60, v65, (uint64_t)v64, v66);

  id v70 = objc_msgSend_context(self, v67, v68, v69);
  objc_msgSend_setContext_(v60, v71, (uint64_t)v70, v72);

LABEL_55:
  return v60;
}

- (id)nextMessage
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (!self->_resumeResourceTransfers)
  {
    int v16 = objc_msgSend_nextMessage_old(self, a2, v2, v3);
    goto LABEL_61;
  }
  v7 = objc_msgSend_data(MEMORY[0x1E4F1CA58], a2, v2, v3);
  if (!self->_sentFirstMessage)
  {
    int fileDescriptor = self->_fileDescriptor;
    if (fileDescriptor != -1) {
      close(fileDescriptor);
    }
    uint64_t v18 = (const char *)objc_msgSend_fileSystemRepresentation(self->_resourcePath, v5, v6, v8);
    int v19 = open(v18, 0);
    self->_int fileDescriptor = v19;
    if (v19 == -1)
    {
      uint64_t v36 = *__error();
      uint64_t v37 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v100) = v36;
        _os_log_impl(&dword_19D9BE000, v37, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: unable to open file for read (errno %d)", buf, 8u);
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
      IDSAssertNonFatalErrnoWithSource(v36, "IDSSocketPairResourceTransferSender open() failed", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSSocketPairMessage.m", 2554, v38);
      objc_msgSend_closeFileAndMarkDone(self, v39, v40, v41);
      goto LABEL_59;
    }
    unint64_t v24 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22);
    uint64_t v98 = 0;
    if (self->_totalBytes)
    {
      id v97 = 0;
      int v26 = objc_msgSend_readNextBytes_byteOffset_(self, v23, (uint64_t)&v97, v25, &v98);
      id v29 = v97;
      if (!v26)
      {
LABEL_58:
        objc_msgSend_closeFileAndMarkDone(self, v27, v28, v30, v95);

        goto LABEL_59;
      }
    }
    else
    {
      id v29 = 0;
    }
    double v42 = self->_resourcePath;
    if (v42)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v24, @"ids-message-resource-transfer-url", v42);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB7F20C();
    }

    metadata = self->_metadata;
    if (metadata) {
      CFDictionarySetValue((CFMutableDictionaryRef)v24, @"ids-message-resource-transfer-metadata", metadata);
    }
    if (v29) {
      CFDictionarySetValue((CFMutableDictionaryRef)v24, @"ids-message-resource-transfer-data", v29);
    }
    BOOL v46 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v43, self->_totalBytes, v44);
    if (v46)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v24, @"ids-message-resource-transfer-total-bytes", v46);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB7F184();
    }

    id v47 = NSNumber;
    objc_msgSend_timeIntervalSinceReferenceDate(self->_expiryDate, v48, v49, v50);
    double v54 = objc_msgSend_numberWithDouble_(v47, v51, v52, v53);
    if (v54) {
      CFDictionarySetValue((CFMutableDictionaryRef)v24, @"ids-message-resource-transfer-expiry-date", v54);
    }

    JWEncodeDictionary();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      buf[0] = 1;
      objc_msgSend_appendBytes_length_(v7, v55, (uint64_t)buf, v56, 1);
      self->_sentFirstMessage = 1;

      goto LABEL_45;
    }
    v92 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      resourcePath = self->_resourcePath;
      *(_DWORD *)buf = 138412290;
      v100 = resourcePath;
      _os_log_impl(&dword_19D9BE000, v92, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: failed to create first message from %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v95 = self->_resourcePath;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v95 = self->_resourcePath;
        IMLogString();
      }
    }
    goto LABEL_58;
  }
  uint64_t v98 = 0;
  id v96 = 0;
  char v9 = objc_msgSend_readNextBytes_byteOffset_(self, v5, (uint64_t)&v96, v8, &v98);
  id v11 = v96;
  if (v9)
  {
    buf[1] = BYTE6(v98);
    buf[2] = BYTE5(v98);
    buf[3] = BYTE4(v98);
    LOBYTE(v100) = BYTE3(v98);
    BYTE1(v100) = BYTE2(v98);
    BYTE2(v100) = BYTE1(v98);
    BYTE3(v100) = v98;
    buf[0] = 0;
    objc_msgSend_appendBytes_length_(v7, v10, (uint64_t)buf, v12, 8);
LABEL_45:
    if (self->_compressPayload)
    {
      __int16 v57 = objc_msgSend__CUTCopyGzippedData(v11, v13, v14, v15);
      unint64_t v61 = objc_msgSend_length(v57, v58, v59, v60);
      unint64_t v65 = objc_msgSend_length(v11, v62, v63, v64);
      BOOL v66 = v61 >= v65;
      BOOL v67 = v61 < v65;
      if (!v66)
      {
        id v68 = v57;

        id v11 = v68;
      }
    }
    else
    {
      BOOL v67 = 0;
    }
    objc_msgSend_appendData_(v7, v13, (uint64_t)v11, v15);
    double v69 = [IDSSocketPairResourceTransferMessage alloc];
    int v16 = objc_msgSend_initWithSequenceNumber_streamID_expectsPeerResponse_wantsAppAck_compressed_didWakeHint_peerResponseIdentifier_messageUUID_data_expiryDate_(v69, v70, self->_sequenceNumber, v71, self->_streamID, self->_expectsPeerResponse, self->_wantsAppAck, v67, self->_didWakeHint, self->_peerResponseIdentifier, self->_messageUUID, v7, 0);
    v75 = objc_msgSend_topic(self, v72, v73, v74);
    objc_msgSend_setTopic_(v16, v76, (uint64_t)v75, v77);

    objc_msgSend_setStreamID_(v16, v78, self->_streamID, v79);
    uint64_t v83 = objc_msgSend_useDynamicServiceName(self, v80, v81, v82);
    objc_msgSend_setUseDynamicServiceName_(v16, v84, v83, v85);
    v89 = objc_msgSend_context(self, v86, v87, v88);
    objc_msgSend_setContext_(v16, v90, (uint64_t)v89, v91);

    goto LABEL_60;
  }
  uint64_t v31 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = self->_resourcePath;
    *(_DWORD *)buf = 138412290;
    v100 = v32;
    _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: failed to create data message from %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v95 = self->_resourcePath;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v95 = self->_resourcePath;
      IMLogString();
    }
  }
  objc_msgSend_closeFileAndMarkDone(self, v33, v34, v35, v95);

LABEL_59:
  int v16 = 0;
LABEL_60:

LABEL_61:
  return v16;
}

- (void)reset
{
  self->_sentFirstMessage = 0;
  self->_unint64_t nextByte = 0;
  self->_done = 0;
  int fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor != -1)
  {
    close(fileDescriptor);
    self->_int fileDescriptor = -1;
  }
}

- (BOOL)sentFirstMessage
{
  return self->_sentFirstMessage;
}

- (BOOL)isDone
{
  return self->_done;
}

- (unsigned)maxChunkSize
{
  return self->_maxChunkSize;
}

- (void)setMaxChunkSize:(unsigned int)a3
{
  self->_size_t maxChunkSize = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (BOOL)resumeResourceTransfers
{
  return self->_resumeResourceTransfers;
}

- (void)setResumeResourceTransfers:(BOOL)a3
{
  self->_resumeResourceTransfers = a3;
}

- (unint64_t)nextByte
{
  return self->_nextByte;
}

- (void)setNextByte:(unint64_t)a3
{
  self->_unint64_t nextByte = a3;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceAttributes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end