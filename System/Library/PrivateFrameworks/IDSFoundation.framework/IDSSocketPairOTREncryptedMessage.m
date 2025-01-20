@interface IDSSocketPairOTREncryptedMessage
- (BOOL)encrypted;
- (BOOL)fileXfer;
- (IDSSocketPairOTREncryptedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (IDSSocketPairOTREncryptedMessage)initWithVersion:(unsigned __int8)a3 encrypted:(BOOL)a4 streamID:(unsigned __int16)a5 priority:(unsigned __int16)a6 sequenceNumber:(unsigned int)a7 fileXfer:(BOOL)a8 data:(id)a9;
- (NSData)data;
- (id)_nonHeaderData;
- (id)description;
- (unsigned)command;
- (unsigned)priority;
- (unsigned)sequenceNumber;
- (unsigned)streamID;
- (unsigned)versionNumber;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setStreamID:(unsigned __int16)a3;
@end

@implementation IDSSocketPairOTREncryptedMessage

- (IDSSocketPairOTREncryptedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)IDSSocketPairOTREncryptedMessage;
  v7 = [(IDSSocketPairMessage *)&v26 initWithCommand:v4 underlyingData:v6];
  v10 = v7;
  if (v7)
  {
    v7->_offset = 0;
    unsigned __int8 v25 = 0;
    unsigned __int16 v24 = 0;
    unsigned __int16 v23 = 0;
    unsigned int v22 = 0;
    char v21 = 0;
    objc_msgSend_getBytes_range_(v6, v8, (uint64_t)&v25, v9, 0, 1);
    unsigned int v11 = v25;
    v10->_versionNumber = v25 & 0x7F;
    v10->_encrypted = v11 >> 7;
    ++v10->_offset;
    objc_msgSend_getBytes_range_(v6, v12, (uint64_t)&v21, v13);
    v10->_fileXfer = v21 != 0;
    ++v10->_offset;
    objc_msgSend_getBytes_range_(v6, v14, (uint64_t)&v24, v15);
    unsigned __int16 v24 = bswap32(v24) >> 16;
    v10->_streamID = v24;
    v10->_offset += 2;
    objc_msgSend_getBytes_range_(v6, v16, (uint64_t)&v23, v17);
    unsigned __int16 v23 = bswap32(v23) >> 16;
    v10->_priority = v23;
    v10->_offset += 2;
    objc_msgSend_getBytes_range_(v6, v18, (uint64_t)&v22, v19);
    v10->_sequenceNumber = bswap32(v22);
    v10->_offset += 4;
  }

  return v10;
}

- (IDSSocketPairOTREncryptedMessage)initWithVersion:(unsigned __int8)a3 encrypted:(BOOL)a4 streamID:(unsigned __int16)a5 priority:(unsigned __int16)a6 sequenceNumber:(unsigned int)a7 fileXfer:(BOOL)a8 data:(id)a9
{
  id v16 = a9;
  v20.receiver = self;
  v20.super_class = (Class)IDSSocketPairOTREncryptedMessage;
  double v17 = [(IDSSocketPairOTREncryptedMessage *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a9);
    v18->_versionNumber = a3;
    v18->_encrypted = a4;
    v18->_fileXfer = a8;
    v18->_streamID = a5;
    v18->_priority = a6;
    v18->_sequenceNumber = a7;
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"OTREncryptedMessage: version %u streamID %u priority %u sequenceNumber %u fileXfer %u", v2, self->_versionNumber, self->_streamID, self->_priority, self->_sequenceNumber, self->_fileXfer);
}

- (unsigned)command
{
  return 23;
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
  id v6 = v3;
  unsigned __int8 versionNumber = self->_versionNumber;
  char v31 = versionNumber;
  if (self->_encrypted) {
    char v31 = versionNumber | 0x80;
  }
  objc_msgSend_appendBytes_length_(v3, v4, (uint64_t)&v31, v5, 1);
  objc_msgSend_appendBytes_length_(v6, v8, (uint64_t)&self->_fileXfer, v9, 1);
  __int16 v32 = bswap32(self->_streamID) >> 16;
  objc_msgSend_appendBytes_length_(v6, v10, (uint64_t)&v32, v11, 2);
  __int16 v32 = bswap32(self->_priority) >> 16;
  objc_msgSend_appendBytes_length_(v6, v12, (uint64_t)&v32, v13, 2);
  unsigned int v33 = bswap32(self->_sequenceNumber);
  objc_msgSend_appendBytes_length_(v6, v14, (uint64_t)&v33, v15, 4);
  double v19 = objc_msgSend_data(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_length(v19, v20, v21, v22);

  if (v23)
  {
    v27 = objc_msgSend_data(self, v24, v25, v26);
    objc_msgSend_appendData_(v6, v28, (uint64_t)v27, v29);
  }
  return v6;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (unsigned)versionNumber
{
  return self->_versionNumber;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (BOOL)fileXfer
{
  return self->_fileXfer;
}

- (void).cxx_destruct
{
}

@end