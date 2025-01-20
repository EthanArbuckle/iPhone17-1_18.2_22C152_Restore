@interface IDSCapsuleParser
- (BOOL)_parseHeader;
- (IDSCapsuleParser)initWithQueue:(id)a3;
- (OS_nw_connection)connection;
- (void)_readCapsuleWithExistingData:(id)a3 completionHandler:(id)a4;
- (void)_readHeader:(id)a3 completionHandler:(id)a4;
- (void)_readWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)readCapsuleWithCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation IDSCapsuleParser

- (IDSCapsuleParser)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSCapsuleParser;
  v6 = [(IDSCapsuleParser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (BOOL)_parseHeader
{
  self->_currentCapsuleHeaderLength = 0;
  headerBuffer = self->_headerBuffer;
  __int16 headerBufferSize = self->_headerBufferSize;
  unsigned __int8 v11 = -86;
  p_currentCapsuleType = (uint64_t *)&self->_currentCapsuleType;
  int v4 = sub_19DB47B08((_DWORD **)&headerBuffer, &headerBufferSize, &self->_currentCapsuleType, &v11);
  if (v4)
  {
    self->_currentCapsuleHeaderLength += v11;
    p_currentCapsuleLength = (uint64_t *)&self->_currentCapsuleLength;
    int v4 = sub_19DB47B08((_DWORD **)&headerBuffer, &headerBufferSize, &self->_currentCapsuleLength, &v11);
    if (v4)
    {
      self->_currentCapsuleHeaderLength += v11;
      self->___int16 headerBufferSize = 0;
      objc_super v9 = objc_msgSend_IDSNWLink(IDSFoundationLog, v6, v7, v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_19DB823E8(p_currentCapsuleType, p_currentCapsuleLength, v9);
      }

      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IDSCapsuleParser;
  [(IDSCapsuleParser *)&v2 dealloc];
}

- (void)_readHeader:(id)a3 completionHandler:(id)a4
{
  v6 = a3;
  objc_super v9 = (void (**)(id, unint64_t, dispatch_data_t, uint64_t, OS_nw_error *))a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v10 = 0x2020000000;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  if (v6
    && (applier[0] = MEMORY[0x1E4F143A8],
        applier[1] = 3221225472,
        applier[2] = sub_19DB47EF8,
        applier[3] = &unk_1E5975A40,
        applier[4] = self,
        applier[5] = &v26,
        dispatch_data_apply(v6, applier),
        *((unsigned char *)v27 + 24)))
  {
    pendingData = self->_pendingData;
    if (!pendingData) {
      __assert_rtn("-[IDSCapsuleParser _readHeader:completionHandler:]", "IDSCapsuleParser.m", 122, "_pendingData");
    }
    size_t currentCapsuleHeaderLength = self->_currentCapsuleHeaderLength;
    size_t size = dispatch_data_get_size((dispatch_data_t)self->_pendingData);
    size_t v14 = size - currentCapsuleHeaderLength;
    if (size < currentCapsuleHeaderLength) {
      __assert_rtn("-[IDSCapsuleParser _readHeader:completionHandler:]", "IDSCapsuleParser.m", 125, "pendingSize >= headerSize");
    }
    size_t currentCapsuleLength = self->_currentCapsuleLength;
    if (v14 >= currentCapsuleLength)
    {
      dispatch_data_t subrange = dispatch_data_create_subrange(pendingData, currentCapsuleHeaderLength, currentCapsuleLength);
      unint64_t v19 = self->_currentCapsuleLength;
      v20 = self->_pendingData;
      if (v14 == v19)
      {
        v21 = 0;
      }
      else
      {
        v21 = (OS_dispatch_data *)dispatch_data_create_subrange(v20, v19 + currentCapsuleHeaderLength, v14 - v19);
        v20 = self->_pendingData;
      }
      self->_pendingData = v21;

      if (self->_pendingData) {
        pendingError = 0;
      }
      else {
        pendingError = self->_pendingError;
      }
      v9[2](v9, self->_currentCapsuleType, subrange, 1, pendingError);
    }
    else
    {
      dispatch_data_t subrange = dispatch_data_create_subrange(pendingData, currentCapsuleHeaderLength, v14);
      self->_state = 1;
      self->_waitingBodySize = self->_currentCapsuleLength - v14;
      v17 = self->_pendingData;
      self->_pendingData = 0;

      v9[2](v9, self->_currentCapsuleType, subrange, 0, self->_pendingError);
    }
  }
  else if (self->_pendingError)
  {
    ((void (*)(void (**)(id, unint64_t, dispatch_data_t, uint64_t, OS_nw_error *), void, void, BOOL))v9[2])(v9, 0, 0, self->_headerBufferSize == 0);
  }
  else
  {
    v18 = objc_msgSend_connection(self, v7, v8, *(double *)&v10);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_19DB47F7C;
    v23[3] = &unk_1E5975A68;
    v23[4] = self;
    v24 = v9;
    nw_connection_receive(v18, 1u, 0x100000u, v23);
  }
  _Block_object_dispose(&v26, 8);
}

- (void)_readWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  unint64_t state = self->_state;
  if (state == 1)
  {
    if (!self->_waitingBodySize) {
      sub_19DB824A4();
    }
    if (self->_pendingData) {
      sub_19DB8256C();
    }
    if (self->_pendingError)
    {
      (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
    }
    else
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v5, v6, v7);
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
        sub_19DB824D0(self, v10, v11, v12);
      }

      v16 = objc_msgSend_connection(self, v13, v14, v15);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_19DB482BC;
      v17[3] = &unk_1E5975A68;
      v17[4] = self;
      id v18 = v8;
      nw_connection_receive(v16, 1u, 0x100000u, v17);
    }
  }
  else if (!state)
  {
    if (self->_waitingBodySize) {
      sub_19DB82478();
    }
    objc_msgSend__readHeader_completionHandler_(self, v5, (uint64_t)self->_pendingData, v7, v4);
  }
}

- (void)_readCapsuleWithExistingData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19DB485D0;
  v12[3] = &unk_1E5975A90;
  uint64_t v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  objc_msgSend__readWithCompletionHandler_(self, v10, (uint64_t)v12, v11);
}

- (void)readCapsuleWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_state) {
    sub_19DB82608();
  }
  if (self->_processingReadCall) {
    sub_19DB825DC();
  }
  id v5 = v4;
  self->_processingReadCall = 1;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19DB487B8;
  v10[3] = &unk_1E59706C8;
  v10[4] = self;
  id v11 = v4;
  id v7 = queue;
  id v8 = v5;
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v10);
  dispatch_async(v7, v9);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (OS_nw_connection *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_pendingData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end