@interface BUZipInflateReadChannel
+ (void)test_setMaxBufferSize:(unint64_t)a3;
- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7;
- (BOOL)validateCRC;
- (BUStreamReadChannel)readChannel;
- (BUZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6;
- (unint64_t)outBufferSize;
- (unint64_t)remainingUncompressedSize;
- (unsigned)CRC;
- (void)close;
- (void)dealloc;
- (void)handleFailureWithHandler:(id)a3 error:(id)a4;
- (void)prepareBuffer;
- (void)readWithHandler:(id)a3;
- (void)setCRC:(unsigned int)a3;
- (void)setOutBufferSize:(unint64_t)a3;
- (void)setReadChannel:(id)a3;
- (void)setRemainingUncompressedSize:(unint64_t)a3;
- (void)setValidateCRC:(BOOL)a3;
@end

@implementation BUZipInflateReadChannel

+ (void)test_setMaxBufferSize:(unint64_t)a3
{
  unint64_t v3 = 0xFFFFFFFFLL;
  if (a3 < 0xFFFFFFFF) {
    unint64_t v3 = a3;
  }
  if (!a3) {
    unint64_t v3 = 0x40000;
  }
  qword_267D29850 = v3;
}

- (BUZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6
{
  id v11 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BUZipInflateReadChannel;
  v12 = [(BUZipInflateReadChannel *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readChannel, a3);
    v13->_stream.next_in = 0;
    v13->_remainingUncompressedSize = a4;
    v13->_CRC = a5;
    v13->_validateCRC = a6;
    v13->_stream.avail_in = 0;
    v13->_stream.avail_out = 0;
    v13->_stream.next_out = 0;
    v13->_stream.zfree = 0;
    v13->_stream.opaque = 0;
    v13->_stream.zalloc = 0;
    if (inflateInit2_(&v13->_stream, -15, "1.2.12", 112))
    {
      v14 = BUZipLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2B6C(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      v13 = 0;
    }
  }

  return v13;
}

- (void)dealloc
{
  objc_msgSend_close(self, a2, v2);
  inflateEnd(&self->_stream);
  free(self->_outBuffer);
  v4.receiver = self;
  v4.super_class = (Class)BUZipInflateReadChannel;
  [(BUZipInflateReadChannel *)&v4 dealloc];
}

- (void)prepareBuffer
{
  uint64_t v4 = objc_msgSend_remainingUncompressedSize(self, a2, v2);
  unint64_t v7 = qword_267D29850;
  if (v4)
  {
    unint64_t v8 = objc_msgSend_remainingUncompressedSize(self, v5, v6);
    if (v7 >= v8) {
      unint64_t v7 = v8;
    }
  }
  self->_outBufferSize = v7;
  v9 = (char *)malloc_type_malloc(v7, 0xE1F45118uLL);
  self->_outBuffer = v9;
  self->_stream.avail_out = self->_outBufferSize;
  self->_stream.next_out = (Bytef *)v9;
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 1;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 0;
  int v15 = crc32(0, 0, 0);
  readChannel = self->_readChannel;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E1EE0D0;
  v8[3] = &unk_26449E5F0;
  v10 = v20;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v11 = v16;
  v12 = v18;
  v13 = v14;
  objc_msgSend_readWithHandler_(readChannel, v7, (uint64_t)v8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  v12 = a3;
  id v13 = a7;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = sub_21E1EE3CC;
  applier[3] = &unk_26449E618;
  v39 = &v42;
  v40 = a4;
  applier[4] = self;
  v41 = a5;
  id v14 = v13;
  id v38 = v14;
  dispatch_data_apply(v12, applier);
  int v17 = objc_msgSend_validateCRC(self, v15, v16);
  int v19 = *((unsigned __int8 *)v43 + 24);
  if (!v17) {
    goto LABEL_10;
  }
  if (!*((unsigned char *)v43 + 24)) {
    goto LABEL_20;
  }
  if (v8)
  {
    if (!a5)
    {
LABEL_9:
      int v19 = 1;
LABEL_10:
      if (v19 && v8)
      {
        if (*a4 != 1)
        {
          char v21 = BUZipLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_21E1F2BA4(v21, v22, v23, v24, v25, v26, v27, v28);
          }
LABEL_19:

          *((unsigned char *)v43 + 24) = 0;
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (v19)
      {
LABEL_16:
        BOOL v20 = 1;
        goto LABEL_21;
      }
LABEL_20:
      objc_msgSend_handleFailureWithHandler_error_(self, v18, (uint64_t)v14, 0);
      BOOL v20 = *((unsigned char *)v43 + 24) != 0;
      goto LABEL_21;
    }
LABEL_8:
    if (self->_CRC != *a5)
    {
      char v21 = BUZipLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2BDC(v21, v29, v30, v31, v32, v33, v34, v35);
      }
      goto LABEL_19;
    }
    goto LABEL_9;
  }
  BOOL v20 = 1;
  if (a5 && *a4 == 1) {
    goto LABEL_8;
  }
LABEL_21:

  _Block_object_dispose(&v42, 8);
  return v20;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  if (a4)
  {
    v5 = (void (*)(void))*((void *)a3 + 2);
    id v9 = a3;
    v5();
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    id v7 = a3;
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(v6, v8, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void))a3 + 2))(v7, 1, 0);
  }
}

- (void)close
{
  id v4 = objc_msgSend_readChannel(self, a2, v2);
  objc_msgSend_close(v4, v5, v6);

  MEMORY[0x270F9A6D0](self, sel_setReadChannel_, 0);
}

- (BUStreamReadChannel)readChannel
{
  return self->_readChannel;
}

- (void)setReadChannel:(id)a3
{
}

- (unint64_t)remainingUncompressedSize
{
  return self->_remainingUncompressedSize;
}

- (void)setRemainingUncompressedSize:(unint64_t)a3
{
  self->_remainingUncompressedSize = a3;
}

- (unsigned)CRC
{
  return self->_CRC;
}

- (void)setCRC:(unsigned int)a3
{
  self->_CRC = a3;
}

- (BOOL)validateCRC
{
  return self->_validateCRC;
}

- (void)setValidateCRC:(BOOL)a3
{
  self->_validateCRC = a3;
}

- (unint64_t)outBufferSize
{
  return self->_outBufferSize;
}

- (void)setOutBufferSize:(unint64_t)a3
{
  self->_outBufferSize = a3;
}

- (void).cxx_destruct
{
}

@end