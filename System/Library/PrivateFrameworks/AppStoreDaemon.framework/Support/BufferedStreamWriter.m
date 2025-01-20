@interface BufferedStreamWriter
- (BOOL)hasSpaceAvailable;
- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
- (void)expectedContentLength:(unint64_t)a3;
@end

@implementation BufferedStreamWriter

- (void)dealloc
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "(BufferedStream) Writer deallocated: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)BufferedStreamWriter;
  [(BufferedStreamWriter *)&v4 dealloc];
}

- (BOOL)hasSpaceAvailable
{
  bufferedStream = self->_bufferedStream;
  if (!bufferedStream) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = bufferedStream->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100203C5C;
  v6[3] = &unk_100521988;
  v6[4] = bufferedStream;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)close
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(block[0]) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "(BufferedStream) Writer closed", (uint8_t *)block, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)BufferedStreamWriter;
  [(Stream *)&v6 close];
  bufferedStream = self->_bufferedStream;
  if (bufferedStream)
  {
    queue = bufferedStream->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100204464;
    block[3] = &unk_100521388;
    block[4] = bufferedStream;
    dispatch_sync(queue, block);
  }
}

- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  bufferedStream = self->_bufferedStream;
  if (!bufferedStream) {
    return 0;
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if (a4)
  {
    queue = bufferedStream->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002045A8;
    block[3] = &unk_100521B58;
    void block[6] = a4;
    block[7] = a3;
    block[4] = bufferedStream;
    block[5] = &v10;
    block[8] = a5;
    dispatch_sync(queue, block);
    int64_t v7 = v11[3];
  }
  else
  {
    int64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)expectedContentLength:(unint64_t)a3
{
  bufferedStream = self->_bufferedStream;
  if (bufferedStream)
  {
    queue = bufferedStream->_queue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100204080;
    v5[3] = &unk_100521B80;
    v5[4] = bufferedStream;
    v5[5] = a3;
    dispatch_sync(queue, v5);
  }
}

- (void).cxx_destruct
{
}

@end