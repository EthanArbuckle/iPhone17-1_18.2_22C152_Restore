@interface BUFileIOChannel
- (BOOL)isClosed;
- (BOOL)isValid;
- (BUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8;
- (BUFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 queue:(id)a5 cleanupHandler:(id)a6;
- (OS_dispatch_io)channel;
- (OS_dispatch_queue)ioQueue;
- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4;
- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForRandomWritingURL:(id)a3 error:(id *)a4;
- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForReadingDescriptor:(int)a3 queue:(id)a4 cleanupHandler:(id)a5;
- (id)initForReadingURL:(id)a3 error:(id *)a4;
- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForStreamWritingURL:(id)a3 error:(id *)a4;
- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)flushWithCompletion:(id)a3;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithHandler:(id)a3;
- (void)setChannel:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setIoQueue:(id)a3;
- (void)setLowWater:(unint64_t)a3;
- (void)truncateToLength:(int64_t)a3 completion:(id)a4;
- (void)writeData:(id)a3 handler:(id)a4;
- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5;
@end

@implementation BUFileIOChannel

- (BUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8
{
  unsigned int v10 = a6;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v17 = a8;
  if (!v14 || (objc_msgSend_isFileURL(v14, v15, v16) & 1) == 0)
  {
    if (a7)
    {
      objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(MEMORY[0x263F087E8], v15, 2, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v39 = MEMORY[0x223C22A70](v17);
    v40 = (void *)v39;
    if (v39) {
      (*(void (**)(uint64_t, uint64_t))(v39 + 16))(v39, 2);
    }

    goto LABEL_17;
  }
  v68.receiver = self;
  v68.super_class = (Class)BUFileIOChannel;
  v19 = [(BUFileIOChannel *)&v68 init];
  if (!v19)
  {
    if (a7)
    {
      objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(MEMORY[0x263F087E8], v18, 12, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v43 = MEMORY[0x223C22A70](v17);
    self = (BUFileIOChannel *)v43;
    if (v43) {
      (*(void (**)(uint64_t, uint64_t))(v43 + 16))(v43, 12);
    }
LABEL_17:
    v41 = 0;
    goto LABEL_18;
  }
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  char v67 = 0;
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = sub_21E1E26C8;
  v63[3] = &unk_26449E0C8;
  v65 = v66;
  id v20 = v17;
  id v64 = v20;
  v59 = (void (**)(void, void))MEMORY[0x223C22A70](v63);
  objc_msgSend_path(v14, v21, v22);
  id v23 = objc_claimAutoreleasedReturnValue();
  v26 = (const char *)objc_msgSend_fileSystemRepresentation(v23, v24, v25);

  if (v26)
  {
    if ((a5 & 0x400) != 0) {
      unlink(v26);
    }
    dispatch_fd_t v29 = open(v26, a5, v10);
    if (v29 < 0)
    {
      v44 = (void *)MEMORY[0x263F087E8];
      v45 = __error();
      v38 = objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v44, v46, *v45, 0);
      v47 = BUZipLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = __error();
        v49 = strerror(*v48);
        sub_21E1F1BE4((uint64_t)v49, buf, (uint64_t)v26, v47);
      }

      v50 = __error();
      v59[2](v59, *v50);
      goto LABEL_26;
    }
    dispatch_queue_t v30 = dispatch_queue_create("BUFileIOChannel.IO", 0);
    ioQueue = v19->_ioQueue;
    v19->_ioQueue = (OS_dispatch_queue *)v30;

    v32 = v19->_ioQueue;
    cleanup_handler[0] = MEMORY[0x263EF8330];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_21E1E273C;
    cleanup_handler[3] = &unk_26449E0F0;
    dispatch_fd_t v62 = v29;
    id v61 = v20;
    dispatch_io_t v33 = dispatch_io_create(a3, v29, v32, cleanup_handler);
    objc_msgSend_setChannel_(v19, v34, (uint64_t)v33);

    v35 = BUZipLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v55 = objc_msgSend_channel(v19, v36, v37);
      v58 = objc_msgSend_path(v14, v56, v57);
      *(_DWORD *)buf = 138413058;
      v70 = v19;
      __int16 v71 = 1024;
      dispatch_fd_t v72 = v29;
      __int16 v73 = 2112;
      v74 = v55;
      __int16 v75 = 2112;
      v76 = v58;
      _os_log_debug_impl(&dword_21E1C7000, v35, OS_LOG_TYPE_DEBUG, "%@: initWithType:URL:oflag:mode:, fd = %d, self.channel = %@, URL = %@", buf, 0x26u);
    }
  }
  v38 = 0;
LABEL_26:
  v51 = objc_msgSend_channel(v19, v27, v28);
  BOOL v52 = v51 == 0;

  if (v52)
  {
    if (a7)
    {
      if (v38)
      {
        *a7 = v38;
      }
      else
      {
        objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(MEMORY[0x263F087E8], v53, 2, 0);
        id v54 = objc_claimAutoreleasedReturnValue();
        *a7 = v54;
      }
    }
    v59[2](v59, 2);

    v19 = 0;
  }
  self = v19;

  _Block_object_dispose(v66, 8);
  v41 = self;
LABEL_18:

  return v41;
}

- (id)initForReadingURL:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initForReadingURL_error_cleanupHandler_, a3);
}

- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initWithType_URL_oflag_mode_error_cleanupHandler_, 1);
}

- (id)initForReadingDescriptor:(int)a3 queue:(id)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initWithType_descriptor_queue_cleanupHandler_, 1);
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initForStreamWritingURL_error_cleanupHandler_, a3);
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initWithType_URL_oflag_mode_error_cleanupHandler_, 0);
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_initForRandomWritingURL_error_cleanupHandler_(self, a2, (uint64_t)a3, a4, 0);
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initWithType_URL_oflag_mode_error_cleanupHandler_, 1);
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_initForRandomReadingWritingURL_error_cleanupHandler_(self, a2, (uint64_t)a3, a4, 0);
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initWithType_URL_oflag_mode_error_cleanupHandler_, 1);
}

- (BUFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 queue:(id)a5 cleanupHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)BUFileIOChannel;
  v12 = [(BUFileIOChannel *)&v31 init];
  if (v12)
  {
    v13 = v12;
    dispatch_queue_t v14 = dispatch_queue_create("BUFileIOChannel.IO", 0);
    ioQueue = v13->_ioQueue;
    v13->_ioQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = v13->_ioQueue;
    cleanup_handler[0] = MEMORY[0x263EF8330];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_21E1E2A88;
    cleanup_handler[3] = &unk_26449E140;
    uint64_t v28 = v11;
    id v27 = v10;
    dispatch_io_t v17 = dispatch_io_create(a3, a4, v16, cleanup_handler);
    objc_msgSend_setChannel_(v13, v18, (uint64_t)v17);

    v21 = objc_msgSend_channel(v13, v19, v20);

    if (!v21)
    {

      v13 = 0;
    }
    uint64_t v22 = v13;

    id v23 = v28;
    v24 = v22;
    goto LABEL_11;
  }
  uint64_t v22 = (BUFileIOChannel *)MEMORY[0x223C22A70](v11);
  if (v22)
  {
    id v23 = v10;
    if (v23)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_21E1E2A74;
      block[3] = &unk_26449D6C8;
      uint64_t v22 = v22;
      dispatch_queue_t v30 = v22;
      dispatch_async(v23, block);
    }
    else
    {
      ((void (*)(BUFileIOChannel *, uint64_t))v22->_ioQueue)(v22, 12);
    }
    v24 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v24 = 0;
LABEL_12:

  return v24;
}

- (void)dealloc
{
  if ((objc_msgSend_isClosed(self, a2, v2) & 1) == 0)
  {
    v6 = objc_msgSend_channel(self, v4, v5);

    if (v6)
    {
      v9 = objc_msgSend_channel(self, v7, v8);
      dispatch_io_close(v9, 0);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BUFileIOChannel;
  [(BUFileIOChannel *)&v10 dealloc];
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v11 = objc_msgSend_channel(self, v9, v10);
  ioQueue = self->_ioQueue;
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = sub_21E1E2D00;
  io_handler[3] = &unk_26449E168;
  id v15 = v8;
  id v13 = v8;
  dispatch_io_read(v11, a3, a4, ioQueue, io_handler);
}

- (void)readWithHandler:(id)a3
{
}

- (void)writeData:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = a3;
  uint64_t v10 = objc_msgSend_channel(self, v8, v9);
  ioQueue = self->_ioQueue;
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = sub_21E1E2E80;
  io_handler[3] = &unk_26449E168;
  id v14 = v6;
  id v12 = v6;
  dispatch_io_write(v10, 0, v7, ioQueue, io_handler);
}

- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = a3;
  id v12 = objc_msgSend_channel(self, v10, v11);
  ioQueue = self->_ioQueue;
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = sub_21E1E3008;
  io_handler[3] = &unk_26449E168;
  id v16 = v8;
  id v14 = v8;
  dispatch_io_write(v12, a4, v9, ioQueue, io_handler);
}

- (void)close
{
  if ((objc_msgSend_isClosed(self, a2, v2) & 1) == 0)
  {
    id v6 = objc_msgSend_channel(self, v4, v5);
    dispatch_io_close(v6, 0);
  }

  objc_msgSend_setClosed_(self, v4, 1);
}

- (void)setLowWater:(unint64_t)a3
{
  v4 = objc_msgSend_channel(self, a2, a3);
  dispatch_io_set_low_water(v4, a3);
}

- (void)addBarrier:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_channel(self, v5, v6);
  dispatch_io_barrier(v7, v4);
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_channel(self, v5, v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E1E3270;
  v9[3] = &unk_26449D858;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_io_barrier(v7, v9);
}

- (void)truncateToLength:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v9 = objc_msgSend_channel(self, v7, v8);
  barrier[0] = MEMORY[0x263EF8330];
  barrier[1] = 3221225472;
  barrier[2] = sub_21E1E33F8;
  barrier[3] = &unk_26449D9B8;
  id v12 = v6;
  int64_t v13 = a3;
  barrier[4] = self;
  id v10 = v6;
  dispatch_io_barrier(v9, barrier);
}

- (BOOL)isValid
{
  if (objc_msgSend_isClosed(self, a2, v2)) {
    return 0;
  }
  v7 = objc_msgSend_channel(self, v4, v5);
  dispatch_fd_t descriptor = dispatch_io_get_descriptor(v7);

  char v9 = 0;
  return read(descriptor, &v9, 0) == 0;
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (void)setIoQueue:(id)a3
{
}

- (OS_dispatch_io)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end