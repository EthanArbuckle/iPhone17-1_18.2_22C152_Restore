@interface IDSSocketPairMessage
+ (id)messageWithCommand:(unsigned __int8)a3 data:(id)a4;
+ (id)messageWithData:(id)a3;
+ (id)messageWithHeaderData:(id)a3 data:(id)a4;
+ (unsigned)dataLengthFromHeaderData:(id)a3;
+ (unsigned)headerDataSize;
- (BOOL)cancelled;
- (BOOL)useDynamicServiceName;
- (BOOL)wasWrittenToConnection;
- (IDSSocketPairMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4;
- (NSData)underlyingData;
- (NSObject)context;
- (NSString)topic;
- (id)_existingUnderlyingData;
- (id)_nonHeaderData;
- (unint64_t)underlyingDataLength;
- (unsigned)command;
- (void)setCancelled:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setTopic:(id)a3;
- (void)setUseDynamicServiceName:(BOOL)a3;
- (void)setWasWrittenToConnection:(BOOL)a3;
@end

@implementation IDSSocketPairMessage

+ (unsigned)headerDataSize
{
  return 5;
}

+ (unsigned)dataLengthFromHeaderData:(id)a3
{
  unsigned int v11 = 0;
  id v3 = a3;
  uint64_t v7 = objc_msgSend_length(v3, v4, v5, v6);
  objc_msgSend_getBytes_range_(v3, v8, (uint64_t)&v11, v9, v7 - 4, 4);

  return bswap32(v11);
}

+ (id)messageWithData:(id)a3
{
  unsigned __int8 v26 = -86;
  id v4 = a3;
  objc_msgSend_getBytes_range_(v4, v5, (uint64_t)&v26, v6, 0, 1);
  uint64_t v10 = objc_msgSend_headerDataSize(a1, v7, v8, v9);
  uint64_t v14 = objc_msgSend_length(v4, v11, v12, v13);
  unsigned int v18 = objc_msgSend_headerDataSize(a1, v15, v16, v17);
  v21 = objc_msgSend_subdataWithRangeNoCopy_(v4, v19, v10, v20, v14 - v18);

  v24 = objc_msgSend_messageWithCommand_data_(a1, v22, v26, v23, v21);

  return v24;
}

+ (id)messageWithHeaderData:(id)a3 data:(id)a4
{
  unsigned __int8 v13 = -86;
  id v6 = a4;
  objc_msgSend_getBytes_range_(a3, v7, (uint64_t)&v13, v8, 0, 1);
  unsigned int v11 = objc_msgSend_messageWithCommand_data_(a1, v9, v13, v10, v6);

  return v11;
}

+ (id)messageWithCommand:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v4 > 0x34
    || ((0x1FFEFFFFFFFFFFuLL >> v4) & 1) == 0
    || (id v6 = objc_alloc(*off_1E5974C80[(char)v4]),
        (double v9 = objc_msgSend_initWithCommand_underlyingData_(v6, v7, v4, v8, v5)) == 0))
  {
    double v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v4;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "Got unhandled socket pair command %d", buf, 8u);
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
    double v9 = 0;
  }

  return v9;
}

- (IDSSocketPairMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IDSSocketPairMessage;
  double v8 = [(IDSSocketPairMessage *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_underlyingData, a4);
    v9->_command = a3;
  }

  return v9;
}

- (id)_nonHeaderData
{
  return 0;
}

- (unint64_t)underlyingDataLength
{
  uint64_t v4 = objc_msgSend_underlyingData(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_length(v4, v5, v6, v7);

  return v8;
}

- (id)_existingUnderlyingData
{
  return self->_underlyingData;
}

- (NSData)underlyingData
{
  p_underlyingData = &self->_underlyingData;
  underlyingData = self->_underlyingData;
  if (underlyingData)
  {
    uint64_t v4 = underlyingData;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    id v7 = v6;
    char v27 = objc_msgSend_command(self, v8, v9, v10);
    objc_msgSend_appendBytes_length_(v7, v11, (uint64_t)&v27, v12, 1);
    uint64_t v16 = objc_msgSend__nonHeaderData(self, v13, v14, v15);
    unsigned int v20 = objc_msgSend_length(v16, v17, v18, v19);
    unsigned int v26 = bswap32(v20);
    objc_msgSend_appendBytes_length_(v7, v21, (uint64_t)&v26, v22, 4);
    if (v20) {
      objc_msgSend_appendData_(v7, v23, (uint64_t)v16, v24);
    }
    objc_storeStrong((id *)p_underlyingData, v6);
    uint64_t v4 = *p_underlyingData;
  }
  return v4;
}

- (unsigned)command
{
  return self->_command;
}

- (NSObject)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (BOOL)useDynamicServiceName
{
  return self->_useDynamicServiceName;
}

- (void)setUseDynamicServiceName:(BOOL)a3
{
  self->_useDynamicServiceName = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)wasWrittenToConnection
{
  return self->_wasWrittenToConnection;
}

- (void)setWasWrittenToConnection:(BOOL)a3
{
  self->_wasWrittenToConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_underlyingData, 0);
}

@end