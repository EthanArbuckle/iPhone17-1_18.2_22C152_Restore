@interface FairPlayStreamReader
- (BOOL)hasBytesAvailable;
- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation FairPlayStreamReader

- (void)dealloc
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "(FairPlayStreamReader) Reader deallocated: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FairPlayStreamReader;
  [(FairPlayStreamReader *)&v4 dealloc];
}

- (BOOL)hasBytesAvailable
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100333068;
  v5[3] = &unk_100524F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)open
{
  v3.receiver = self;
  v3.super_class = (Class)FairPlayStreamReader;
  [(Stream *)&v3 open];
  [(StreamReader *)self->_streamReader open];
}

- (void)close
{
  [(StreamReader *)self->_streamReader close];
  streamReader = self->_streamReader;
  self->_streamReader = 0;

  v4.receiver = self;
  v4.super_class = (Class)FairPlayStreamReader;
  [(Stream *)&v4 close];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  dispatchQueue = self->_dispatchQueue;
  unint64_t v14 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100333304;
  block[3] = &unk_100528828;
  block[5] = &v11;
  block[6] = a4;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  if (v12[3])
  {
    uint64_t v8 = [(Stream *)self delegate];
    [v8 stream:self handleEvent:v12[3]];
  }
  else
  {
    uint64_t v8 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)char v9 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "(FairPlayStreamReader) All event codes were filtered", v9, 2u);
    }
  }

  _Block_object_dispose(&v11, 8);
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100018218;
  v18 = sub_100017CC8;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = -1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003335D8;
  block[3] = &unk_100525128;
  block[4] = self;
  block[5] = &v14;
  void block[7] = a3;
  block[8] = a4;
  block[6] = &v10;
  dispatch_sync(dispatchQueue, block);
  int64_t v7 = v11[3];
  if (a5 && v7 < 0)
  {
    *a5 = (id) v15[5];
    int64_t v7 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamReader, 0);
  objc_storeStrong((id *)&self->_scratchBuffer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end