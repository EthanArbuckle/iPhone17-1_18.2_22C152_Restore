@interface CLFindMyAccessoryRangingManager
- (CLFindMyAccessoryRangingManager)init;
- (CLFindMyAccessoryRangingManager)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (CLFindMyAccessoryRangingManagerDelegate)delegate;
- (id).cxx_construct;
- (void)connectToDevice:(id)a3;
- (void)disconnectFromDevice:(id)a3;
- (void)fetchFirmwareVersionFromDevice:(id)a3;
- (void)handleInterruption;
- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)initRoseWithParameters:(id)a3 onDevice:(id)a4;
- (void)prepareForStartRangingOnDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRoseRangingParameters:(id)a3 onDevice:(id)a4;
- (void)startEventCounterOnDevice:(id)a3;
- (void)startRangingWithParameters:(id)a3 onDevice:(id)a4;
- (void)stopEventCounterOnDevice:(id)a3;
- (void)stopRangingOnDevice:(id)a3;
- (void)stopRoseWithParameters:(id)a3 onDevice:(id)a4;
@end

@implementation CLFindMyAccessoryRangingManager

- (CLFindMyAccessoryRangingManager)init
{
  return 0;
}

- (CLFindMyAccessoryRangingManager)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLFindMyAccessoryRangingManager;
  v6 = [(CLFindMyAccessoryRangingManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, a3);
    if (a4)
    {
      v7->_delegateQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
    else
    {
      v7->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.findMyAccessoryRangingManager.privateQueue", 0);
    }
    operator new();
  }
  return 0;
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005780);
  }
  v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = CLConnectionMessage::name(*var0);
    if (*(char *)(v5 + 23) >= 0) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = *(void *)v5;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_ERROR, "Got Reply: message: %s", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005780);
    }
    CLConnectionMessage::name(*var0);
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLFindMyAccessoryRangingManager handleMessage:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
}

- (void)handleInterruption
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005780);
  }
  v3 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_ERROR, "Connection to locationd interrupted!!", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005780);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLFindMyAccessoryRangingManager handleInterruption]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8 = @"Connection to locationd interrupted!";
  uint64_t v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v5 forDevice:0];
}

- (void)connectToDevice:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Feature Not Supported";
  uint64_t v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v5 forDevice:0];
}

- (void)disconnectFromDevice:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Feature Not Supported";
  uint64_t v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v5 forDevice:0];
}

- (void)initRoseWithParameters:(id)a3 onDevice:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Feature Not Supported";
  uint64_t v6 = objc_msgSend(v5, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v6 forDevice:0];
}

- (void)stopRoseWithParameters:(id)a3 onDevice:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Feature Not Supported";
  uint64_t v6 = objc_msgSend(v5, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v6 forDevice:0];
}

- (void)setRoseRangingParameters:(id)a3 onDevice:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Feature Not Supported";
  uint64_t v6 = objc_msgSend(v5, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v6 forDevice:0];
}

- (void)prepareForStartRangingOnDevice:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Feature Not Supported";
  id v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v5 forDevice:0];
}

- (void)startRangingWithParameters:(id)a3 onDevice:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Feature Not Supported";
  uint64_t v6 = objc_msgSend(v5, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v6 forDevice:0];
}

- (void)stopRangingOnDevice:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Feature Not Supported";
  id v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v5 forDevice:0];
}

- (void)startEventCounterOnDevice:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Feature Not Supported";
  id v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v5 forDevice:0];
}

- (void)stopEventCounterOnDevice:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Feature Not Supported";
  id v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v5 forDevice:0];
}

- (void)fetchFirmwareVersionFromDevice:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Feature Not Supported";
  id v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryRangingManager:self didFailWithError:v5 forDevice:0];
}

- (CLFindMyAccessoryRangingManagerDelegate)delegate
{
  return (CLFindMyAccessoryRangingManagerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  sub_19073DD74((uint64_t *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end