@interface SRCompressedOutputStream
+ (void)initialize;
- (BOOL)hasSpaceAvailable;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)dealloc;
- (void)open;
@end

@implementation SRCompressedOutputStream

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_100016BA0 = (uint64_t)os_log_create("com.apple.SensorKit", "CompressedOutputStream");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 72);
    objc_setProperty_nonatomic(self, v3, 0, 80);
  }
  v4.receiver = self;
  v4.super_class = (Class)SRCompressedOutputStream;
  [(SRCompressedOutputStream *)&v4 dealloc];
}

- (void)open
{
  p_compression_stream = &self->_compression_stream;
  if (compression_stream_init((compression_stream *)&self->_compression_stream, COMPRESSION_STREAM_ENCODE, (compression_algorithm)self->_algorithm) == COMPRESSION_STATUS_ERROR)
  {
    objc_super v4 = qword_100016BA0;
    if (os_log_type_enabled((os_log_t)qword_100016BA0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error initializing stream", v5, 2u);
    }
  }
  else
  {
    self->_streamStatus = 2;
    p_compression_stream->dst_ptr = (char *)[sub_100007510(self) mutableBytes];
    p_compression_stream->dst_size = self->_bufferSize;
  }
}

- (void)close
{
  unint64_t bufferSize = self->_bufferSize;
  p_compression_stream = (compression_stream *)&self->_compression_stream;
  unint64_t dst_size = self->_compression_stream.dst_size;
  if (bufferSize != dst_size)
  {
    sub_1000077B0((uint64_t)self, bufferSize - dst_size);
    v6 = (uint8_t *)[sub_100007510(self) mutableBytes];
    unint64_t v7 = self->_bufferSize;
    p_compression_stream->dst_ptr = v6;
    p_compression_stream->unint64_t dst_size = v7;
  }
  compression_status v8 = compression_stream_process(p_compression_stream, 1);
  if (v8 == COMPRESSION_STATUS_END)
  {
    unint64_t v12 = self->_bufferSize;
    size_t v13 = p_compression_stream->dst_size;
    if (v12 > v13) {
      sub_1000077B0((uint64_t)self, v12 - v13);
    }
  }
  else if (v8)
  {
    if (v8 == COMPRESSION_STATUS_ERROR)
    {
      v9 = qword_100016BA0;
      if (os_log_type_enabled((os_log_t)qword_100016BA0, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = 0;
        v10 = "Error finalizing stream";
        v11 = (uint8_t *)&v17;
LABEL_13:
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
      }
    }
  }
  else
  {
    v9 = qword_100016BA0;
    if (os_log_type_enabled((os_log_t)qword_100016BA0, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = 0;
      v10 = "Error finalizing stream, expecting COMPRESSION_STATUS_END but got COMPRESSION_STATUS_OK";
      v11 = (uint8_t *)&v16;
      goto LABEL_13;
    }
  }
  compression_stream_destroy(p_compression_stream);
  [(NSFileHandle *)self->_outputFileHandle closeFile];
  objc_setProperty_nonatomic(self, v14, 0, 72);
  self->_streamStatus = 6;
  objc_setProperty_nonatomic(self, v15, 0, 80);
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  unint64_t v4 = a4;
  p_compression_stream = (compression_stream *)&self->_compression_stream;
  self->_compression_stream.src_ptr = (char *)a3;
  self->_compression_stream.src_size = a4;
  if (!a4) {
    return v4;
  }
  while (1)
  {
    while (1)
    {
      compression_status v7 = compression_stream_process(p_compression_stream, 0);
      if (v7) {
        break;
      }
      if (!p_compression_stream->src_size) {
        return v4;
      }
      if (!p_compression_stream->dst_size)
      {
        if (!sub_1000077B0((uint64_t)self, self->_bufferSize)) {
          return -1;
        }
        v9 = (uint8_t *)[sub_100007510(self) mutableBytes];
        unint64_t bufferSize = self->_bufferSize;
        p_compression_stream->dst_ptr = v9;
        p_compression_stream->unint64_t dst_size = bufferSize;
        goto LABEL_13;
      }
    }
    if (v7 == COMPRESSION_STATUS_END)
    {
      compression_status v8 = qword_100016BA0;
      if (os_log_type_enabled((os_log_t)qword_100016BA0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error compressing data. Got COMPRESSION_STATUS_END before finalizing the stream", buf, 2u);
      }
      goto LABEL_13;
    }
    if (v7 == COMPRESSION_STATUS_ERROR) {
      break;
    }
LABEL_13:
    if (!p_compression_stream->src_size) {
      return v4;
    }
  }
  v11 = qword_100016BA0;
  if (os_log_type_enabled((os_log_t)qword_100016BA0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)SEL v14 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error compressing data", v14, 2u);
  }
  compression_stream_destroy(p_compression_stream);
  return -1;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (unint64_t)streamStatus
{
  return self->_streamStatus;
}

@end