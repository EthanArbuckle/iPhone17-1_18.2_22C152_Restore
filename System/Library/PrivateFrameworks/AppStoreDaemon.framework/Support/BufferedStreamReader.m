@interface BufferedStreamReader
- (BOOL)hasBytesAvailable;
- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
@end

@implementation BufferedStreamReader

- (void)dealloc
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "(BufferedStream) Reader deallocated: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)BufferedStreamReader;
  [(BufferedStreamReader *)&v4 dealloc];
}

- (BOOL)hasBytesAvailable
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
  v6[2] = sub_100203C40;
  v6[3] = &unk_100521988;
  v6[4] = bufferedStream;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5
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
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100203E44;
    v9[3] = &unk_100521B30;
    v9[4] = bufferedStream;
    v9[5] = &v10;
    v9[6] = a4;
    v9[7] = a3;
    dispatch_sync(queue, v9);
    int64_t v7 = v11[3];
  }
  else
  {
    int64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)close
{
  bufferedStream = self->_bufferedStream;
  self->_bufferedStream = 0;

  v4.receiver = self;
  v4.super_class = (Class)BufferedStreamReader;
  [(Stream *)&v4 close];
}

- (void).cxx_destruct
{
}

@end