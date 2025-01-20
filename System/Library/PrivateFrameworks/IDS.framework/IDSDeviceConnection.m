@interface IDSDeviceConnection
- (BOOL)updateConnectionWithOptions:(id)a3 error:(id *)a4;
- (NSDictionary)metrics;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (_IDSDeviceConnection)_internal;
- (id)description;
- (id)initSocketWithDevice:(id)a3 options:(id)a4 completionHandler:(id)a5 queue:(id)a6;
- (id)initStreamWithDevice:(id)a3 options:(id)a4 completionHandler:(id)a5 queue:(id)a6;
- (int)socket;
- (unint64_t)mtu;
- (void)close;
- (void)dealloc;
- (void)setStreamPairWithInputStream:(id)a3 outputStream:(id)a4;
@end

@implementation IDSDeviceConnection

- (id)initSocketWithDevice:(id)a3 options:(id)a4 completionHandler:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsNotCurrent];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A424D4();
    }
  }
  if (_IDSRunningInDaemon())
  {
    v17 = +[IDSLogging IDSDeviceConnection];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    v18 = 0;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)IDSDeviceConnection;
    v19 = [(IDSDeviceConnection *)&v32 init];
    if (v19)
    {
      v20 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
      v21 = NSNumber;
      ids_monotonic_time();
      v22 = objc_msgSend(v21, "numberWithDouble:");
      [v20 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F6B110]];

      v23 = +[IDSInternalQueueController sharedInstance];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_191A103B0;
      v26[3] = &unk_1E572D490;
      v27 = v19;
      id v28 = v10;
      id v29 = v20;
      id v31 = v12;
      id v30 = v13;
      id v24 = v20;
      [v23 performBlock:v26];
    }
    self = v19;
    v18 = self;
  }

  return v18;
}

- (id)initStreamWithDevice:(id)a3 options:(id)a4 completionHandler:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsNotCurrent];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A4256C();
    }
  }
  if (_IDSRunningInDaemon())
  {
    v17 = +[IDSLogging IDSDeviceConnection];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    v18 = 0;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)IDSDeviceConnection;
    v19 = [(IDSDeviceConnection *)&v35 init];
    if (v19)
    {
      v20 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
      v21 = NSNumber;
      ids_monotonic_time();
      v22 = objc_msgSend(v21, "numberWithDouble:");
      [v20 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F6B110]];

      if (!v13)
      {
        id v13 = (id)MEMORY[0x1E4F14428];
        id v23 = MEMORY[0x1E4F14428];
      }
      id v24 = (void *)[v12 copy];
      v25 = +[IDSInternalQueueController sharedInstance];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = sub_191A1067C;
      v29[3] = &unk_1E572AE38;
      id v30 = v19;
      id v31 = v10;
      id v32 = v20;
      id v13 = v13;
      id v33 = v13;
      id v34 = v24;
      id v26 = v24;
      id v27 = v20;
      [v25 performBlock:v29];
    }
    self = v19;
    v18 = self;
  }

  return v18;
}

- (BOOL)updateConnectionWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = -86;
  v7 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191A10B14;
  v10[3] = &unk_1E572A418;
  id v12 = &v14;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  id v13 = a4;
  [v7 performBlock:v10 waitUntilDone:1];

  LOBYTE(a4) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)a4;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1919187B0;
  v6[4] = sub_1919185F8;
  v7 = (_IDSDeviceConnection *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191A10C80;
  v5[3] = &unk_1E5728DD0;
  v5[4] = v6;
  [v3 performBlock:v5 waitUntilDone:0];

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSDeviceConnection;
  [(IDSDeviceConnection *)&v4 dealloc];
}

- (id)description
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1919187B0;
  id v11 = sub_1919185F8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191A10DD4;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setStreamPairWithInputStream:(id)a3 outputStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A10F00;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (int)socket
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191A10FFC;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

- (NSInputStream)inputStream
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1919187B0;
  id v11 = sub_1919185F8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191A1115C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSInputStream *)v4;
}

- (NSOutputStream)outputStream
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1919187B0;
  id v11 = sub_1919185F8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191A112D4;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSOutputStream *)v4;
}

- (void)close
{
  v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191A113B4;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (unint64_t)mtu
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191A114A8;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSDictionary)metrics
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_1919187B0;
  id v11 = sub_1919185F8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191A11608;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (_IDSDeviceConnection)_internal
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A42604();
    }
  }
  internal = self->_internal;

  return internal;
}

- (void).cxx_destruct
{
}

@end