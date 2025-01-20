@interface IDSSocketPairOTRMessage
- (BOOL)encrypted;
- (BOOL)shouldEncrypt;
- (IDSSocketPairOTRMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (IDSSocketPairOTRMessage)initWithVersion:(unsigned __int8)a3 encrypted:(BOOL)a4 shouldEncrypt:(BOOL)a5 protectionClass:(unsigned __int8)a6 streamID:(unsigned __int16)a7 priority:(unsigned __int16)a8 sequenceNumber:(unsigned int)a9 data:(id)a10;
- (NSData)data;
- (id)_nonHeaderData;
- (id)description;
- (unsigned)command;
- (unsigned)priority;
- (unsigned)protectionClass;
- (unsigned)sequenceNumber;
- (unsigned)streamID;
- (unsigned)versionNumber;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setStreamID:(unsigned __int16)a3;
@end

@implementation IDSSocketPairOTRMessage

- (IDSSocketPairOTRMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IDSSocketPairOTRMessage;
  v7 = [(IDSSocketPairMessage *)&v23 initWithCommand:v4 underlyingData:v6];
  v10 = v7;
  if (v7)
  {
    v7->_offset = 0;
    unsigned __int8 v22 = 0;
    unsigned __int16 v21 = 0;
    unsigned int v20 = 0;
    objc_msgSend_getBytes_range_(v6, v8, (uint64_t)&v22, v9, 0, 1);
    unsigned __int8 v11 = v22;
    v10->_encrypted = v22 >> 7;
    v10->_shouldEncrypt = (v11 & 0x40) != 0;
    v10->_versionNumber = v11 & 0xF;
    ++v10->_offset;
    objc_msgSend_getBytes_range_(v6, v12, (uint64_t)&v22, v13);
    unsigned int v14 = v22;
    v10->_protectionClass = v22 & 3;
    v10->_priority = 100 * (v14 >> 6);
    ++v10->_offset;
    objc_msgSend_getBytes_range_(v6, v15, (uint64_t)&v21, v16);
    unsigned __int16 v21 = bswap32(v21) >> 16;
    v10->_streamID = v21;
    v10->_offset += 2;
    objc_msgSend_getBytes_range_(v6, v17, (uint64_t)&v20, v18);
    v10->_sequenceNumber = bswap32(v20);
    v10->_offset += 4;
  }

  return v10;
}

- (IDSSocketPairOTRMessage)initWithVersion:(unsigned __int8)a3 encrypted:(BOOL)a4 shouldEncrypt:(BOOL)a5 protectionClass:(unsigned __int8)a6 streamID:(unsigned __int16)a7 priority:(unsigned __int16)a8 sequenceNumber:(unsigned int)a9 data:(id)a10
{
  id v17 = a10;
  v21.receiver = self;
  v21.super_class = (Class)IDSSocketPairOTRMessage;
  double v18 = [(IDSSocketPairOTRMessage *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a10);
    v19->_versionNumber = a3;
    v19->_encrypted = a4;
    v19->_shouldEncrypt = a5;
    v19->_protectionClass = a6;
    v19->_streamID = a7;
    v19->_priority = a8;
    v19->_sequenceNumber = a9;
  }

  return v19;
}

- (id)description
{
  v3 = @"YES";
  if (self->_encrypted) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  if (!self->_shouldEncrypt) {
    v3 = @"NO";
  }
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"OTRMessage: encrypted %@ shouldEncrypt %@ version %u streamID %u protectionClass %u priority %u sequenceNumber %u", v2, v4, v3, self->_versionNumber, self->_streamID, self->_protectionClass, self->_priority, self->_sequenceNumber);
}

- (unsigned)command
{
  return 24;
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
  char v29 = versionNumber;
  if (self->_encrypted)
  {
    versionNumber |= 0x80u;
    char v29 = versionNumber;
  }
  if (self->_shouldEncrypt) {
    char v29 = versionNumber | 0x40;
  }
  objc_msgSend_appendBytes_length_(v3, v4, (uint64_t)&v29, v5, 1);
  char v29 = ((5243 * (self->_priority >> 2)) >> 11) & 0xC0 | self->_protectionClass;
  objc_msgSend_appendBytes_length_(v6, v8, (uint64_t)&v29, v9, 1);
  __int16 v30 = bswap32(self->_streamID) >> 16;
  objc_msgSend_appendBytes_length_(v6, v10, (uint64_t)&v30, v11, 2);
  unsigned int v31 = bswap32(self->_sequenceNumber);
  objc_msgSend_appendBytes_length_(v6, v12, (uint64_t)&v31, v13, 4);
  id v17 = objc_msgSend_data(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_length(v17, v18, v19, v20);

  if (v21)
  {
    v25 = objc_msgSend_data(self, v22, v23, v24);
    objc_msgSend_appendData_(v6, v26, (uint64_t)v25, v27);
  }
  return v6;
}

- (unsigned)versionNumber
{
  return self->_versionNumber;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (unsigned)protectionClass
{
  return self->_protectionClass;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
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

- (void).cxx_destruct
{
}

@end