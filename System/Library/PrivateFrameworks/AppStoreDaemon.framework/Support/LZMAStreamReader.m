@interface LZMAStreamReader
- (BOOL)hasBytesAvailable;
- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation LZMAStreamReader

- (void)dealloc
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "(LZMAStreamReader) Reader deallocated: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)LZMAStreamReader;
  [(LZMAStreamReader *)&v4 dealloc];
}

- (BOOL)hasBytesAvailable
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100290E9C;
  v5[3] = &unk_100524F38;
  v5[4] = self;
  v5[5] = &v6;
  sub_100010468(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)close
{
  v4.receiver = self;
  v4.super_class = (Class)LZMAStreamReader;
  [(Stream *)&v4 close];
  [(StreamReader *)self->_streamReader close];
  streamReader = self->_streamReader;
  self->_streamReader = 0;
}

- (void)open
{
  [(StreamReader *)self->_streamReader open];
  v3.receiver = self;
  v3.super_class = (Class)LZMAStreamReader;
  [(Stream *)&v3 open];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "(LZMAStreamReader) Upstream event code %lu", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x2020000000;
  unint64_t v16 = a4;
  lock = self->_lock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002912C4;
  v11[3] = &unk_100524F38;
  v11[4] = self;
  v11[5] = &buf;
  sub_100010468(lock, v11);
  if (*(void *)(*((void *)&buf + 1) + 24))
  {
    if ([(Stream *)self streamStatus] < 2 || [(Stream *)self streamStatus] > 5)
    {
      char v9 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)(*((void *)&buf + 1) + 24);
        *(_DWORD *)v12 = 134217984;
        uint64_t v13 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "(LZMAStreamReader) Not forwarding event code %lu", v12, 0xCu);
      }
    }
    else
    {
      char v9 = [(Stream *)self delegate];
      [v9 stream:self handleEvent:*(void *)(*((void *)&buf + 1) + 24)];
    }
  }
  _Block_object_dispose(&buf, 8);
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = -1;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100018058;
  v14 = sub_100017BE8;
  id v15 = 0;
  lock = self->_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002914D4;
  v9[3] = &unk_100525128;
  v9[4] = self;
  v9[5] = &v10;
  v9[7] = a4;
  v9[8] = a3;
  v9[6] = &v16;
  sub_100010468(lock, v9);
  int64_t v7 = v17[3];
  if (a5 && v7 < 0)
  {
    *a5 = (id) v11[5];
    int64_t v7 = v17[3];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_streamReader, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end