@interface StreamingZipStreamConsumer
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation StreamingZipStreamConsumer

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v9) = 134217984;
    *(void *)((char *)&v9 + 4) = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "(SZStreamConsumer) Upstream event code %lu", (uint8_t *)&v9, 0xCu);
  }

  if ((a4 & 3) != 0 && self)
  {
    dispatchQueue = self->_dispatchQueue;
    *(void *)&long long v9 = _NSConcreteStackBlock;
    *((void *)&v9 + 1) = 3221225472;
    v10 = sub_10030879C;
    v11 = &unk_100521388;
    v12 = self;
    dispatch_sync(dispatchQueue, &v9);
  }
  if ((a4 & 0x10) != 0)
  {
    if (self)
    {
      v8 = self->_dispatchQueue;
      *(void *)&long long v9 = _NSConcreteStackBlock;
      *((void *)&v9 + 1) = 3221225472;
      v10 = sub_1003085F4;
      v11 = &unk_100521388;
      v12 = self;
      dispatch_sync(v8, &v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_streamReader, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end