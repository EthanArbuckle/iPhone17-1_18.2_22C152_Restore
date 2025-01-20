@interface CKDProtobufStreamWriter
+ (id)_dataForMessage:(id)a3;
+ (id)uncompressedDataForStreamedObjects:(id)a3;
- (BOOL)_finishStreaming:(id)a3;
- (BOOL)hasInitedCompression;
- (BOOL)haveFinishedCompression;
- (BOOL)haveFinishedStreaming;
- (BOOL)shouldCompress;
- (CKDProtobufStreamWriter)initWithCompression:(BOOL)a3;
- (NSFileHandle)binaryLogFileHandle;
- (id)_compressBodyData:(id)a3 shouldFlush:(BOOL)a4;
- (id)logRequestObjectBlock;
- (id)open;
- (int64_t)_streamNextObject:(id)a3;
- (int64_t)_writeDataToStream:(id)a3;
- (unint64_t)bufferSize;
- (void)_prepareObjectForStreaming:(id)a3;
- (void)_tearDownOutputStream;
- (void)dealloc;
- (void)setBinaryLogFileHandle:(id)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setHasInitedCompression:(BOOL)a3;
- (void)setHaveFinishedCompression:(BOOL)a3;
- (void)setHaveFinishedStreaming:(BOOL)a3;
- (void)setLogRequestObjectBlock:(id)a3;
- (void)setShouldCompress:(BOOL)a3;
- (void)setStreamedObjects:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)tearDown;
@end

@implementation CKDProtobufStreamWriter

- (CKDProtobufStreamWriter)initWithCompression:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)CKDProtobufStreamWriter;
  v4 = [(CKDProtobufStreamWriter *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v4->_curDataPos = 0;
    v4->_shouldCompress = v3;
    if (v3)
    {
      v4->_zlibStream.zalloc = 0;
      v4->_zlibStream.zfree = 0;
      v4->_zlibStream.opaque = 0;
      int v6 = deflateInit2_(&v4->_zlibStream, -1, 8, 31, 8, 0, "1.2.12", 112);
      if (v6)
      {
        int v7 = v6;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v8 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v20 = v7;
          _os_log_error_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_ERROR, "Could not initialize zlib for compression, error %d", buf, 8u);
        }
        v5->_shouldCompress = 0;
      }
      else
      {
        v5->_hasInitedCompression = 1;
      }
    }
    v5->_bufferSize = 1024;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (void)_tearDownOutputStream
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_outputStream)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v3 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      outputStream = v2->_outputStream;
      int v9 = 134217984;
      v10 = outputStream;
      _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Tearing down output stream: %p", (uint8_t *)&v9, 0xCu);
    }
    MEMORY[0x1C87883C0](v2->_outputStream, 0);
    objc_msgSend_setDelegate_(v2->_outputStream, v4, 0);
    objc_msgSend_close(v2->_outputStream, v5, v6);
    int v7 = v2->_outputStream;
    v2->_outputStream = 0;
  }
  if (v2->_hasInitedCompression)
  {
    deflateEnd(&v2->_zlibStream);
    v2->_hasInitedCompression = 0;
  }
  objc_sync_exit(v2);
}

- (void)dealloc
{
  objc_msgSend__tearDownOutputStream(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CKDProtobufStreamWriter;
  [(CKDProtobufStreamWriter *)&v4 dealloc];
}

- (void)tearDown
{
  objc_msgSend_setHaveFinishedStreaming_(self, a2, 1);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E32CA4;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)setStreamedObjects:(id)a3
{
  self->_allObjects = (NSMutableArray *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3);
  MEMORY[0x1F41817F8]();
}

+ (id)uncompressedDataForStreamedObjects:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v20, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = objc_msgSend__dataForMessage_(a1, v9, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        objc_msgSend_appendData_(v5, v14, (uint64_t)v13);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v20, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)open
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)MEMORY[0x1E4F1CAE0];
  id v21 = 0;
  id v22 = 0;
  uint64_t v6 = objc_msgSend_bufferSize(v2, v4, v5);
  objc_msgSend_createBoundInputStream_outputStream_bufferSize_(v3, v7, (uint64_t)&v22, &v21, v6);
  id v8 = v22;
  id v9 = v22;
  id v10 = v21;
  id v11 = v21;
  if (!v9)
  {
    long long v19 = "inputStream != nil";
    int v20 = 146;
    goto LABEL_12;
  }
  uint64_t v12 = v11;
  if (!v11)
  {
    long long v19 = "outputStream != nil";
    int v20 = 147;
LABEL_12:
    __assert_rtn("-[CKDProtobufStreamWriter open]", "CKDProtobufStreamWriter.m", v20, v19);
  }
  objc_storeStrong((id *)&v2->_inputStream, v8);
  objc_storeStrong((id *)&v2->_outputStream, v10);
  objc_msgSend_setDelegate_(v2->_outputStream, v13, (uint64_t)v2);
  MEMORY[0x1C87883C0](v2->_outputStream, v2->_dispatchQueue);
  objc_msgSend_open(v2->_outputStream, v14, v15);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  long long v16 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    outputStream = v2->_outputStream;
    *(_DWORD *)buf = 134217984;
    v24 = outputStream;
    _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Opened outputStream: %p", buf, 0xCu);
  }

  objc_sync_exit(v2);
  return v9;
}

- (id)_compressBodyData:(id)a3 shouldFlush:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v10 = objc_msgSend_data(MEMORY[0x1E4F1CA58], v8, v9);
  bzero(v25, 0x2000uLL);
  id v11 = v7;
  self->_zlibStream.next_in = (Bytef *)objc_msgSend_bytes(v11, v12, v13);
  self->_zlibStream.avail_in = objc_msgSend_length(v11, v14, v15);
  if (v4)
  {
    if (objc_msgSend_haveFinishedCompression(self, v16, v17))
    {
      v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CKDProtobufStreamWriter.m", 172, @"We just tried to finish compression twice");
    }
    objc_msgSend_setHaveFinishedCompression_(self, v18, 1);
    int v20 = 4;
  }
  else
  {
    int v20 = 0;
  }
  do
  {
    self->_zlibStream.avail_out = 0x2000;
    self->_zlibStream.next_out = v25;
    if (deflate(&self->_zlibStream, v20) == -2) {
      __assert_rtn("-[CKDProtobufStreamWriter _compressBodyData:shouldFlush:]", "CKDProtobufStreamWriter.m", 181, "ret != Z_STREAM_ERROR");
    }
    objc_msgSend_appendBytes_length_(v10, v21, (uint64_t)v25, 0x2000 - self->_zlibStream.avail_out);
  }
  while (!self->_zlibStream.avail_out);
  if (self->_zlibStream.avail_in) {
    __assert_rtn("-[CKDProtobufStreamWriter _compressBodyData:shouldFlush:]", "CKDProtobufStreamWriter.m", 185, "_zlibStream.avail_in == 0");
  }

  return v10;
}

- (BOOL)_finishStreaming:(id)a3
{
  if (!objc_msgSend_shouldCompress(self, a2, (uint64_t)a3)) {
    return 1;
  }
  BOOL result = 1;
  if (!self->_haveFlushedZlib)
  {
    self->_haveFlushedZlib = 1;
    objc_msgSend__compressBodyData_shouldFlush_(self, v4, 0, 1);
    uint64_t v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    curData = self->_curData;
    self->_curData = v6;

    self->_curDataPos = 0;
    objc_msgSend__streamNextObject_(self, v8, (uint64_t)self->_outputStream);
    return 0;
  }
  return result;
}

- (int64_t)_writeDataToStream:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(self->_curData, v5, v6)
    && (unint64_t curDataPos = self->_curDataPos, curDataPos < objc_msgSend_length(self->_curData, v7, v8)))
  {
    id v10 = self->_curData;
    uint64_t v13 = objc_msgSend_bytes(v10, v11, v12) + self->_curDataPos;
    uint64_t v16 = objc_msgSend_length(v10, v14, v15);
    uint64_t v18 = objc_msgSend_write_maxLength_(v4, v17, v13, v16 - self->_curDataPos);
    int64_t v19 = v18;
    if (v18 >= 1) {
      self->_curDataPos += v18;
    }
  }
  else
  {
    int64_t v19 = 0;
  }

  return v19;
}

+ (id)_dataForMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend_data(a3, a2, (uint64_t)a3);
  __int16 v12 = 0;
  uint64_t v11 = 0;
  objc_msgSend_length(v3, v4, v5);
  uint64_t v6 = PBDataWriterWriteBareVarint();
  id v7 = objc_opt_new();
  objc_msgSend_appendBytes_length_(v7, v8, (uint64_t)&v11, v6);
  objc_msgSend_appendData_(v7, v9, (uint64_t)v3);

  return v7;
}

- (void)_prepareObjectForStreaming:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend__dataForMessage_(v5, v6, (uint64_t)v4);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = objc_msgSend_logRequestObjectBlock(self, v7, v8);

  if (v9)
  {
    objc_msgSend_logRequestObjectBlock(self, v10, v11);
    __int16 v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v12)[2](v12, v16);
  }
  if (objc_msgSend_shouldCompress(self, v10, v11))
  {
    objc_msgSend__compressBodyData_shouldFlush_(self, v13, (uint64_t)v16, 0);
    v14 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (NSData *)v16;
  }
  curData = self->_curData;
  self->_curData = v14;

  self->_unint64_t curDataPos = 0;
}

- (int64_t)_streamNextObject:(id)a3
{
  id v4 = a3;
  unint64_t curDataPos = self->_curDataPos;
  if (curDataPos >= objc_msgSend_length(self->_curData, v6, v7))
  {
    while (objc_msgSend_count(self->_allObjects, v8, v9))
    {
      __int16 v12 = objc_msgSend_objectAtIndexedSubscript_(self->_allObjects, v11, 0);
      objc_msgSend_removeObjectAtIndex_(self->_allObjects, v13, 0);
      objc_msgSend__prepareObjectForStreaming_(self, v14, (uint64_t)v12);

      curData = self->_curData;
      if (curData && objc_msgSend_length(curData, v8, v9)) {
        goto LABEL_2;
      }
    }
    int64_t v10 = 0;
  }
  else
  {
LABEL_2:
    int64_t v10 = objc_msgSend__writeDataToStream_(self, v8, (uint64_t)v4);
  }

  return v10;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CKDProtobufStreamWriter.m", 269, @"I didn't order this stream, so why is it on my bill?");
  }
  if ((objc_msgSend_haveFinishedStreaming(self, v8, v9) & 1) == 0)
  {
    __int16 v12 = (void *)MEMORY[0x1C8789E70]();
    if (a4 != 16)
    {
      if (a4 == 8)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v17 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = v17;
          objc_msgSend_streamError(v7, v19, v20);
          id v21 = (NSOutputStream *)objc_claimAutoreleasedReturnValue();
          int v26 = 138412290;
          v27 = v21;
          _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "Got a stream error: %@", (uint8_t *)&v26, 0xCu);
        }
        goto LABEL_22;
      }
      if (a4 != 4) {
        goto LABEL_22;
      }
      if (!objc_msgSend_count(self->_allObjects, v10, v11))
      {
        unint64_t curDataPos = self->_curDataPos;
        if (curDataPos >= objc_msgSend_length(self->_curData, v13, v14))
        {
LABEL_11:
          if ((objc_msgSend__finishStreaming_(self, v13, (uint64_t)self->_outputStream) & 1) == 0) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }
      }
      uint64_t Object = objc_msgSend__streamNextObject_(self, v13, (uint64_t)self->_outputStream);
      if ((Object & 0x8000000000000000) == 0)
      {
        if (!Object) {
          goto LABEL_11;
        }
LABEL_22:
        goto LABEL_23;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v22 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        outputStream = self->_outputStream;
        int v26 = 134217984;
        v27 = outputStream;
        _os_log_error_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_ERROR, "Failed to write into the outputStream:%p", (uint8_t *)&v26, 0xCu);
      }
    }
LABEL_21:
    objc_msgSend_tearDown(self, v10, v11);
    goto LABEL_22;
  }
LABEL_23:
}

- (BOOL)shouldCompress
{
  return self->_shouldCompress;
}

- (void)setShouldCompress:(BOOL)a3
{
  self->_shouldCompress = a3;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (id)logRequestObjectBlock
{
  return self->_logRequestObjectBlock;
}

- (void)setLogRequestObjectBlock:(id)a3
{
}

- (NSFileHandle)binaryLogFileHandle
{
  return self->_binaryLogFileHandle;
}

- (void)setBinaryLogFileHandle:(id)a3
{
}

- (BOOL)hasInitedCompression
{
  return self->_hasInitedCompression;
}

- (void)setHasInitedCompression:(BOOL)a3
{
  self->_hasInitedCompression = a3;
}

- (BOOL)haveFinishedCompression
{
  return self->_haveFinishedCompression;
}

- (void)setHaveFinishedCompression:(BOOL)a3
{
  self->_haveFinishedCompression = a3;
}

- (BOOL)haveFinishedStreaming
{
  return self->_haveFinishedStreaming;
}

- (void)setHaveFinishedStreaming:(BOOL)a3
{
  self->_haveFinishedStreaming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryLogFileHandle, 0);
  objc_storeStrong(&self->_logRequestObjectBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_curData, 0);
  objc_storeStrong((id *)&self->_allObjects, 0);
}

@end