@interface ACXSocket
- (ACXSocket)initWithIDSDeviceConnection:(id)a3 boostingMessageContext:(id)a4 streamName:(id)a5 creationTime:(id)a6 readEventHandler:(id)a7;
- (ACXSocket)initWithSocket:(int)a3 streamName:(id)a4 creationTime:(id)a5 readEventHandler:(id)a6;
- (BOOL)invalidated;
- (BOOL)readSourceIsRunning;
- (BOOL)wifiAsserted;
- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (BOOL)writeDictionary:(id)a3 error:(id *)a4;
- (BOOL)writePingWithError:(id *)a3;
- (BOOL)writeShutdownMessageWithError:(id *)a3;
- (IDSDeviceConnection)deviceConnection;
- (NSDate)creationTime;
- (NSDictionary)errorInfoDict;
- (NSString)streamName;
- (OS_dispatch_queue)socketQueue;
- (OS_dispatch_source)socketReadSource;
- (id)boostingMessageContext;
- (id)eventHandler;
- (id)readDataOrDictionaryWithError:(id *)a3;
- (id)readDataWithError:(id *)a3;
- (id)readDictionaryWithError:(id *)a3;
- (int)socketFD;
- (void)_setUpSocketReadSource;
- (void)invalidate;
- (void)noteWifiAsserted:(BOOL)a3;
- (void)resumeReadSource;
- (void)setInvalidated:(BOOL)a3;
- (void)setReadSourceIsRunning:(BOOL)a3;
- (void)suspendReadSource;
@end

@implementation ACXSocket

- (ACXSocket)initWithSocket:(int)a3 streamName:(id)a4 creationTime:(id)a5 readEventHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ACXSocket;
  v14 = [(ACXSocket *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_socketFD = a3;
    id v16 = objc_retainBlock(v13);
    id eventHandler = v15->_eventHandler;
    v15->_id eventHandler = v16;

    objc_storeStrong((id *)&v15->_streamName, a4);
    objc_storeStrong((id *)&v15->_creationTime, a5);
    [(ACXSocket *)v15 _setUpSocketReadSource];
  }

  return v15;
}

- (ACXSocket)initWithIDSDeviceConnection:(id)a3 boostingMessageContext:(id)a4 streamName:(id)a5 creationTime:(id)a6 readEventHandler:(id)a7
{
  id v13 = a3;
  id v21 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ACXSocket;
  v17 = [(ACXSocket *)&v22 init];
  if (v17)
  {
    v17->_socketFD = [v13 socket];
    id v18 = objc_retainBlock(v16);
    id eventHandler = v17->_eventHandler;
    v17->_id eventHandler = v18;

    objc_storeStrong((id *)&v17->_deviceConnection, a3);
    objc_storeStrong(&v17->_boostingMessageContext, a4);
    objc_storeStrong((id *)&v17->_streamName, a5);
    objc_storeStrong((id *)&v17->_creationTime, a6);
    [(ACXSocket *)v17 _setUpSocketReadSource];
  }

  return v17;
}

- (void)resumeReadSource
{
  if ([(ACXSocket *)self readSourceIsRunning]) {
    sub_10005BB5C();
  }
  [(ACXSocket *)self setReadSourceIsRunning:1];
  v3 = [(ACXSocket *)self socketReadSource];
  dispatch_resume(v3);
}

- (void)suspendReadSource
{
  if (![(ACXSocket *)self readSourceIsRunning]) {
    sub_10005BB88();
  }
  [(ACXSocket *)self setReadSourceIsRunning:0];
  v3 = [(ACXSocket *)self socketReadSource];
  dispatch_suspend(v3);
}

- (void)noteWifiAsserted:(BOOL)a3
{
  self->_wifiAsserted = a3;
}

- (void)invalidate
{
  if (![(ACXSocket *)self invalidated])
  {
    [(ACXSocket *)self setInvalidated:1];
    if (shutdown([(ACXSocket *)self socketFD], 2)
      && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
    {
      uint64_t v3 = [(ACXSocket *)self socketFD];
      v4 = __error();
      uint64_t v6 = v3;
      v7 = strerror(*v4);
      MOLogWrite();
    }
    if (![(ACXSocket *)self readSourceIsRunning])
    {
      v5 = [(ACXSocket *)self socketReadSource];
      dispatch_resume(v5);
    }
    v8 = [(ACXSocket *)self socketReadSource];
    dispatch_source_cancel(v8);
  }
}

- (void)_setUpSocketReadSource
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AppConduit.SocketReadQ", v3);
  socketQueue = self->_socketQueue;
  self->_socketQueue = v4;

  uintptr_t v6 = [(ACXSocket *)self socketFD];
  v7 = [(ACXSocket *)self socketQueue];
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v6, 0, v7);
  socketReadSource = self->_socketReadSource;
  self->_socketReadSource = v8;

  v10 = self->_socketReadSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002F46C;
  handler[3] = &unk_10008CD30;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  id v11 = self->_socketReadSource;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F4FC;
  v12[3] = &unk_10008CD30;
  v12[4] = self;
  dispatch_source_set_cancel_handler(v11, v12);
  [(ACXSocket *)self setReadSourceIsRunning:0];
}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (!a4) {
    return 1;
  }
  unint64_t v6 = a4;
  while (1)
  {
    v9 = (char *)(v6 >= 0x40000 ? 0x40000 : v6);
    char v11 = 2;
    int v12 = (int)v9;
    if (!sub_10002F640(self, &v11, (char *)5, (char **)a5)
      || (sub_10002F640(self, (char *)a3, v9, (char **)a5) & 1) == 0)
    {
      break;
    }
    a3 = &v9[(void)a3];
    v6 -= (unint64_t)v9;
    if (!v6) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  id v8 = [v6 length];

  return [(ACXSocket *)self writeBytes:v7 length:v8 error:a4];
}

- (BOOL)writeDictionary:(id)a3 error:(id *)a4
{
  memset(v19, 0, 5);
  id v18 = 0;
  id v6 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:&v18];
  id v7 = (char *)v18;
  if (v6)
  {
    if ((unint64_t)[v6 length] <= 0x40000)
    {
      LOBYTE(v19[0]) = 1;
      *(_DWORD *)((char *)v19 + 1) = [v6 length];
      v17 = v7;
      int v13 = sub_10002F640(self, (char *)v19, (char *)5, &v17);
      id v8 = v17;

      if (!v13)
      {
        char v12 = 0;
        id v7 = v8;
        if (!a4) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }
      id v14 = (char *)[v6 bytes];
      id v16 = v8;
      char v12 = sub_10002F640(self, v14, (char *)*(_DWORD *)((char *)v19 + 1), &v16);
      id v7 = v16;
    }
    else
    {
      id v8 = [(ACXSocket *)self errorInfoDict];
      id v9 = [v6 length];
      uint64_t v11 = sub_100007710((uint64_t)"-[ACXSocket writeDictionary:error:]", 230, @"ACXErrorDomain", 16, 0, v8, @"Dictionary was too big to send (was %lu bytes)", v10, (uint64_t)v9);

      char v12 = 0;
      id v7 = (char *)v11;
    }

    if (!a4) {
      goto LABEL_13;
    }
  }
  else
  {
    char v12 = 0;
    if (!a4) {
      goto LABEL_13;
    }
  }
LABEL_11:
  if ((v12 & 1) == 0) {
    *a4 = v7;
  }
LABEL_13:

  return v12;
}

- (BOOL)writePingWithError:(id *)a3
{
  char v10 = 0;
  int v9 = 3;
  id v8 = 0;
  char v4 = sub_10002F640(self, (char *)&v9, (char *)5, &v8);
  v5 = v8;
  id v6 = v5;
  if (a3 && (v4 & 1) == 0) {
    *a3 = v5;
  }

  return v4;
}

- (BOOL)writeShutdownMessageWithError:(id *)a3
{
  char v10 = 0;
  int v9 = 4;
  id v8 = 0;
  char v4 = sub_10002F640(self, (char *)&v9, (char *)5, &v8);
  v5 = v8;
  id v6 = v5;
  if (a3 && (v4 & 1) == 0) {
    *a3 = v5;
  }

  return v4;
}

- (id)readDataWithError:(id *)a3
{
  v5 = -[ACXSocket readDataOrDictionaryWithError:](self, "readDataOrDictionaryWithError:");
  if (v5)
  {
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      id v8 = v6;
      goto LABEL_11;
    }
    int v9 = [(ACXSocket *)self errorInfoDict];
    uint64_t v11 = sub_100007710((uint64_t)"-[ACXSocket readDataWithError:]", 346, @"ACXErrorDomain", 14, 0, v9, @"Expected to read data but got dictionary.", v10, v13);

    if (a3) {
      *a3 = v11;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (id)readDictionaryWithError:(id *)a3
{
  v5 = -[ACXSocket readDataOrDictionaryWithError:](self, "readDataOrDictionaryWithError:");
  if (v5)
  {
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      id v8 = v6;
      goto LABEL_11;
    }
    int v9 = [(ACXSocket *)self errorInfoDict];
    uint64_t v11 = sub_100007710((uint64_t)"-[ACXSocket readDictionaryWithError:]", 360, @"ACXErrorDomain", 14, 0, v9, @"Expected to read dictionary but got data.", v10, v13);

    if (a3) {
      *a3 = v11;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (id)readDataOrDictionaryWithError:(id *)a3
{
  id v29 = 0;
  v5 = (unsigned __int8 *)sub_1000300D8(self, (char *)5, &v29);
  id v6 = v29;
  if (!v5)
  {
    int v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    if (!a3) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  while (1)
  {
    int v7 = *v5;
    if (v7 != 3) {
      break;
    }
    if (*(_DWORD *)(v5 + 1))
    {
      char v12 = [(ACXSocket *)self errorInfoDict];
      sub_100007710((uint64_t)"-[ACXSocket readDataOrDictionaryWithError:]", 386, @"ACXErrorDomain", 15, 0, v12, @"Got ping packet with non-zero (%u) length", v18, *(unsigned int *)(v5 + 1));
      uint64_t v19 = LABEL_18:;

      int v9 = 0;
      uint64_t v10 = 0;
      goto LABEL_19;
    }
    free(v5);
    id v29 = v6;
    v5 = (unsigned __int8 *)sub_1000300D8(self, (char *)5, &v29);
    id v8 = v29;

    id v6 = v8;
    if (!v5)
    {
      int v9 = 0;
      goto LABEL_6;
    }
  }
  if (v7 == 4)
  {
    if (*(_DWORD *)(v5 + 1))
    {
      char v12 = [(ACXSocket *)self errorInfoDict];
      sub_100007710((uint64_t)"-[ACXSocket readDataOrDictionaryWithError:]", 397, @"ACXErrorDomain", 15, 0, v12, @"Got shutdown packet with non-zero (%u) length", v13, *(unsigned int *)(v5 + 1));
      goto LABEL_18;
    }
    free(v5);
    uint64_t v19 = sub_100007574((uint64_t)"-[ACXSocket readDataOrDictionaryWithError:]", 404, @"ACXErrorDomain", 4, @"Got shutdown packet", v20, v21, v22, v26);

    int v9 = 0;
    uint64_t v10 = 0;
    v5 = 0;
LABEL_19:
    uint64_t v11 = 0;
    id v6 = (id)v19;
    if (a3) {
      goto LABEL_24;
    }
    goto LABEL_26;
  }
  id v14 = (char *)*(unsigned int *)(v5 + 1);
  id v28 = v6;
  uint64_t v11 = sub_1000300D8(self, v14, &v28);
  id v8 = v28;

  if (!v11)
  {
    int v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  int v15 = *v5;
  if (v15 == 2)
  {
    int v9 = +[NSData dataWithBytesNoCopy:v11 length:*(unsigned int *)(v5 + 1) freeWhenDone:1];
LABEL_6:
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    goto LABEL_23;
  }
  if (v15 == 1)
  {
    uint64_t v10 = +[NSData dataWithBytesNoCopy:v11 length:*(unsigned int *)(v5 + 1) freeWhenDone:0];
    id v27 = 0;
    int v9 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:&v27];
    id v6 = v27;

    if (v9) {
      goto LABEL_26;
    }
    id v16 = [(ACXSocket *)self errorInfoDict];
    sub_100007710((uint64_t)"-[ACXSocket readDataOrDictionaryWithError:]", 418, @"ACXErrorDomain", 15, v6, v16, @"Failed to deserialize dictionary from data: %@", v17, (uint64_t)v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    int v9 = 0;
LABEL_23:
    id v6 = v8;
    if (!a3) {
      goto LABEL_26;
    }
LABEL_24:
    if (!v9)
    {
      id v6 = v6;
      *a3 = v6;
    }
    goto LABEL_26;
  }
  v24 = [(ACXSocket *)self errorInfoDict];
  sub_100007710((uint64_t)"-[ACXSocket readDataOrDictionaryWithError:]", 424, @"ACXErrorDomain", 14, 0, v24, @"Got unknown message type %hhu (length %u)", v25, *v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  int v9 = 0;
  uint64_t v10 = 0;
  if (a3) {
    goto LABEL_24;
  }
LABEL_26:
  free(v5);
  free(v11);

  return v9;
}

- (NSDictionary)errorInfoDict
{
  uint64_t v3 = [(ACXSocket *)self streamName];
  char v4 = [(ACXSocket *)self creationTime];
  if (!v4)
  {
    char v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:0.0];
  }
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"Unknown";
  }
  v9[0] = @"ConnectionIdentifier";
  v9[1] = @"ConnectionCreationDate";
  v10[0] = v5;
  v10[1] = v4;
  v9[2] = @"WifiAsserted";
  id v6 = +[NSNumber numberWithBool:[(ACXSocket *)self wifiAsserted]];
  v10[2] = v6;
  int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return (NSDictionary *)v7;
}

- (int)socketFD
{
  return self->_socketFD;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (IDSDeviceConnection)deviceConnection
{
  return self->_deviceConnection;
}

- (id)boostingMessageContext
{
  return self->_boostingMessageContext;
}

- (OS_dispatch_queue)socketQueue
{
  return self->_socketQueue;
}

- (OS_dispatch_source)socketReadSource
{
  return self->_socketReadSource;
}

- (BOOL)readSourceIsRunning
{
  return self->_readSourceIsRunning;
}

- (void)setReadSourceIsRunning:(BOOL)a3
{
  self->_readSourceIsRunning = a3;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

- (BOOL)wifiAsserted
{
  return self->_wifiAsserted;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationTime, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_socketReadSource, 0);
  objc_storeStrong((id *)&self->_socketQueue, 0);
  objc_storeStrong(&self->_boostingMessageContext, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);

  objc_storeStrong(&self->_eventHandler, 0);
}

@end