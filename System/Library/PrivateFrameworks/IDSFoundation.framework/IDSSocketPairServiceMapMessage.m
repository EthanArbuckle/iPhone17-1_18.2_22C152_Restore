@interface IDSSocketPairServiceMapMessage
- (IDSSocketPairServiceMapMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (IDSSocketPairServiceMapMessage)initWithReason:(unsigned __int8)a3 mappedStreamID:(unsigned __int16)a4 serviceName:(id)a5;
- (NSString)serviceName;
- (id)_nonHeaderData;
- (unsigned)command;
- (unsigned)mappedStreamID;
- (unsigned)reason;
@end

@implementation IDSSocketPairServiceMapMessage

- (IDSSocketPairServiceMapMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)IDSSocketPairServiceMapMessage;
  v7 = [(IDSSocketPairMessage *)&v31 initWithCommand:v4 underlyingData:v6];
  if (v7)
  {
    unsigned __int8 v30 = -86;
    v29 = (BOOL *)0xAAAAAAAAAAAAAAAALL;
    unsigned __int16 v28 = -21846;
    unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v26[0] = v8;
    v26[1] = v8;
    id v9 = v6;
    uint64_t v13 = objc_msgSend_bytes(v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_length(v9, v14, v15, v16);
    IDSByteBufferInitForRead((uint64_t)v26, v13, v17);
    while (IDSByteBufferReadField((uint64_t)v26, &v30, &v29, &v28))
    {
      switch(v30)
      {
        case 3u:
          if (v28)
          {
            id v18 = [NSString alloc];
            uint64_t v21 = objc_msgSend_initWithBytes_length_encoding_(v18, v19, (uint64_t)v29, v20, v28, 4);
            v22 = *(void **)&v7->_reason;
            *(void *)&v7->_reason = v21;
          }
          break;
        case 2u:
          if (v28 == 2)
          {
            v23 = v29 + 2;
            *((_WORD *)&v7->super._wasWrittenToConnection + 1) = bswap32(*(unsigned __int16 *)v29) >> 16;
            v29 = v23;
          }
          break;
        case 1u:
          if (v28 == 1) {
            *(&v7->super._wasWrittenToConnection + 1) = *v29;
          }
          break;
        default:
          v24 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v33 = v30;
            _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "IDSSocketPairServiceMapMessage: Unknown field type: %u", buf, 8u);
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
          break;
      }
    }
    IDSByteBufferRelease((uint64_t)v26);
  }

  return v7;
}

- (IDSSocketPairServiceMapMessage)initWithReason:(unsigned __int8)a3 mappedStreamID:(unsigned __int16)a4 serviceName:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSSocketPairServiceMapMessage;
  id v9 = [(IDSSocketPairServiceMapMessage *)&v17 init];
  uint64_t v13 = v9;
  if (v9)
  {
    *(&v9->super._wasWrittenToConnection + 1) = a3;
    *((_WORD *)&v9->super._wasWrittenToConnection + 1) = a4;
    uint64_t v14 = objc_msgSend_copy(v8, v10, v11, v12);
    uint64_t v15 = *(void **)&v13->_reason;
    *(void *)&v13->_reason = v14;
  }
  return v13;
}

- (unsigned)command
{
  return 39;
}

- (id)_nonHeaderData
{
  v3 = _IDSLinkPacketBufferCreate();
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = v4;
  long long v24 = v4;
  IDSByteBufferInitForWriteWithAllocatedSpace((uint64_t)&v23, (uint64_t)v3 + 1297, (uint64_t)v3[1]);
  IDSByteBufferWriteField((uint64_t)&v23, 1, &self->super._wasWrittenToConnection + 1, 1uLL);
  __int16 __src = bswap32(*((unsigned __int16 *)&self->super._wasWrittenToConnection + 1)) >> 16;
  IDSByteBufferWriteField((uint64_t)&v23, 2, &__src, 2uLL);
  objc_msgSend_dataUsingEncoding_(*(void **)&self->_reason, v5, 4, v6);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_bytes(v7, v8, v9, v10);
  unsigned __int16 v15 = objc_msgSend_length(v7, v12, v13, v14);
  IDSByteBufferWriteField((uint64_t)&v23, 3, v11, v15);
  uint64_t v16 = v24 - ((void)v3 + 1297);
  IDSByteBufferRelease((uint64_t)&v23);
  id v17 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_19DAD6FB4;
  v21[3] = &unk_1E5974C60;
  v21[4] = v3;
  v19 = objc_msgSend_initWithBytesNoCopy_length_deallocator_(v17, v18, (uint64_t)v3 + 1297, COERCE_DOUBLE(3221225472), v16, v21);

  return v19;
}

- (unsigned)reason
{
  return *(&self->super._wasWrittenToConnection + 1);
}

- (unsigned)mappedStreamID
{
  return *((_WORD *)&self->super._wasWrittenToConnection + 1);
}

- (NSString)serviceName
{
  return *(NSString **)&self->_reason;
}

- (void).cxx_destruct
{
}

@end