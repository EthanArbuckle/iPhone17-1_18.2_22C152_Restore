@interface DTXConnection
+ (id)connectionToAddress:(id)a3;
+ (void)initialize;
+ (void)observeDecompressionExceptionLogging:(id)a3;
+ (void)registerTransport:(Class)a3 forScheme:(id)a4;
- (BOOL)_addHandler:(id)a3 forMessage:(unsigned int)a4 channel:(id)a5;
- (BOOL)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5 error:(id *)a6;
- (BOOL)remoteTracer;
- (BOOL)sendMessage:(id)a3 fromChannel:(id)a4 sendMode:(int)a5 syncWithReply:(BOOL)a6 replyHandler:(id)a7;
- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4;
- (BOOL)tracer;
- (DTXChannel)defaultChannel;
- (DTXConnection)initWithTransport:(id)a3;
- (NSString)description;
- (NSString)label;
- (double)preflightSynchronouslyWithTimeout:(double)a3;
- (id)_makeProxyChannelWithRemoteInterface:(id)a3 remoteInterfaceName:(id)a4 exportedInterface:(id)a5 exportedInterfaceName:(id)a6;
- (id)_sendHeartbeatAsyncWithTimeout:(double)a3;
- (id)_testing_remoteCapabilityVersions;
- (id)localCapabilities;
- (id)makeChannelWithIdentifier:(id)a3;
- (id)makeProxyChannelWithRemoteInterface:(id)a3 exportedInterface:(id)a4;
- (id)publishedAddresses;
- (id)remoteCapabilityVersions;
- (int)atomicConnectionNumber;
- (int)remoteCapabilityVersion:(id)a3;
- (unint64_t)maximumEnqueueSize;
- (void)_cancelInternal:(id)a3;
- (void)_channelCanceled:(unsigned int)a3;
- (void)_handleMessageParseException:(id)a3 forChannelCode:(unsigned int)a4 messageID:(unsigned int)a5 fragmentCount:(unsigned int)a6 withPayloadBytes:(const void *)a7 ofLength:(unint64_t)a8;
- (void)_handleMissingRemoteCapabilities;
- (void)_handleProxyRequestForInterface:(id)a3 interfaceName:(id)a4 peerInterface:(id)a5 peerInterfaceName:(id)a6 handler:(id)a7;
- (void)_notifyCompressionHint:(unsigned int)a3 forChannelCode:(unsigned int)a4;
- (void)_notifyOfPublishedCapabilities:(id)a3;
- (void)_receiveQueueSetCompressionHint:(unsigned int)a3 onChannel:(id)a4;
- (void)_requestChannelWithCode:(unsigned int)a3 identifier:(id)a4;
- (void)_routeMessage:(id)a3;
- (void)_scheduleMessage:(id)a3 toChannel:(id)a4;
- (void)_setTracerState:(unsigned int)a3;
- (void)_setupWireProtocols;
- (void)_unregisterChannel:(id)a3;
- (void)cancel;
- (void)cancelWithSerializedTransport:(id)a3;
- (void)dealloc;
- (void)handleProxyRequestForInterface:(id)a3 peerInterface:(id)a4 handler:(id)a5;
- (void)overridePermittedBlockCompressors:(id)a3;
- (void)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5;
- (void)publishServicesInImagePath:(id)a3;
- (void)registerCapabilityOverrideBlock:(id)a3;
- (void)registerDisconnectHandler:(id)a3;
- (void)replaceCompressorForCompression:(id)a3;
- (void)replaceCompressorForDecompression:(id)a3;
- (void)resume;
- (void)sendControlAsync:(id)a3 replyHandler:(id)a4;
- (void)sendControlSync:(id)a3 replyHandler:(id)a4;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)sendMessageSync:(id)a3 replyHandler:(id)a4;
- (void)setChannelHandler:(id)a3;
- (void)setCompressionHint:(int)a3 forChannel:(id)a4;
- (void)setDispatchTarget:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaximumEnqueueSize:(unint64_t)a3;
- (void)setMessageHandler:(id)a3;
- (void)setRemoteTracer:(BOOL)a3;
- (void)setTracer:(BOOL)a3;
- (void)suspend;
@end

@implementation DTXConnection

+ (void)initialize
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    dispatch_queue_t v2 = dispatch_queue_create("connection transport registry guard", 0);
    v3 = (void *)qword_26AD828C0;
    qword_26AD828C0 = (uint64_t)v2;

    uint64_t v4 = objc_opt_new();
    v5 = (void *)qword_26AD828D8;
    qword_26AD828D8 = v4;

    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate:v6];
    qword_26AD828A0 = v8;
    os_log_t v9 = os_log_create("com.apple.dt.DTXConnectionServices", "DTXConnection");
    v10 = (void *)qword_26AD828D0;
    qword_26AD828D0 = (uint64_t)v9;

    os_log_t v11 = os_log_create("com.apple.dt.DTXConnectionServices", "Capabilities");
    v12 = (void *)qword_26AD828A8;
    qword_26AD828A8 = (uint64_t)v11;

    uint64_t v13 = objc_opt_new();
    v14 = (void *)qword_26AD82898;
    qword_26AD82898 = v13;

    [qword_26AD82898 setErrorStatus:v15];
    [qword_26AD82898 makeImmutable:v16 withTransitionContext:v17];
    pthread_key_create((pthread_key_t *)&qword_26AD828B0, 0);
    v20 = [MEMORY[0x263EFFA40] objectForKey:v18];
    byte_26AD828E0 = [v20 DTXConnectionTracer];

    if (byte_26AD828E0)
    {
      v22 = NSString;
      v23 = getprogname();
      uint64_t v24 = getpid();
      v26 = [v22 stringWithFormat:@"%s[%d].DTXConnection.XXXXXX.log", v23, v24];
      v27 = NSTemporaryDirectory();
      [v27 stringByAppendingPathComponent:v28];
      id v29 = objc_claimAutoreleasedReturnValue();
      v32 = (const char *)[v29 fileSystemRepresentationWithPath:v30];

      v33 = strdup(v32);
      int v34 = mkstemps(v33, 4);
      qword_2683E3570 = (uint64_t)fdopen(v34, "we");
      setlinebuf((FILE *)qword_2683E3570);
      v35 = (void *)qword_26AD828D0;
      if (os_log_type_enabled((os_log_t)qword_26AD828D0, OS_LOG_TYPE_ERROR))
      {
        v36 = v35;
        *(_DWORD *)buf = 136315650;
        v38 = getprogname();
        __int16 v39 = 1024;
        pid_t v40 = getpid();
        __int16 v41 = 2080;
        v42 = v33;
        _os_log_impl(&_dtx_internal_logger, v36, OS_LOG_TYPE_ERROR, "%s[%d]: Global DTXConnection log enabled - also written to '%s'", buf, 0x1Cu);
      }
      free(v33);
    }
  }
}

+ (void)registerTransport:(Class)a3 forScheme:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    uint64_t v7 = qword_26AD828C0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_22AF3E7DC;
    v8[3] = &unk_264883D20;
    Class v10 = a3;
    id v9 = v5;
    dispatch_sync(v7, v8);
  }
}

- (void)publishServicesInImagePath:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a3;
  uint64_t v7 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v8 = qword_26AD828A8;
    if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v7;
      _os_log_impl(&_dtx_internal_logger, v8, OS_LOG_TYPE_INFO, "registering capabilities in image: %{public}@", buf, 0xCu);
    }
    id v9 = v7;
    v12 = (char *)[v9 UTF8String];
    uint64_t v13 = (objc_class *)objc_opt_class();
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_22AF3EEA4;
    v34[3] = &unk_264883D48;
    v34[4] = self;
    sub_22AF3EBEC(v12, sel_registerCapabilities_, v13, v34);
    v14 = v9;
    uint64_t v17 = (char *)[v14 UTF8String];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    uint64_t v31 = sub_22AF3EF90;
    v32 = &unk_264883D48;
    v33 = self;
    id v29 = v30;
    objc_getProtocol("DTTapServiceDelegate");
    v18 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (!v18) {
      goto LABEL_25;
    }
    uint64_t v19 = sub_22AF46754(v17);
    unsigned int outCount = 0;
    v20 = objc_copyClassNamesForImage(v19, &outCount);
    v21 = qword_26AD828A8;
    if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_DEBUG))
    {
      v22 = "<nil image?>";
      if (v17) {
        v22 = v17;
      }
      *(_DWORD *)buf = 136315394;
      v37 = v22;
      __int16 v38 = 1024;
      unsigned int v39 = outCount;
      _os_log_impl(&_dtx_internal_logger, v21, OS_LOG_TYPE_DEBUG, "scanning image %s (%u classes)", buf, 0x12u);
    }
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        uint64_t v24 = qword_26AD828A8;
        if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_DEBUG))
        {
          v25 = v20[i];
          if (!v25) {
            v25 = "<nil className>";
          }
          *(_DWORD *)buf = 136315138;
          v37 = v25;
          _os_log_impl(&_dtx_internal_logger, v24, OS_LOG_TYPE_DEBUG, "checking class %s", buf, 0xCu);
        }
        v26 = v20[i];
        if (v26)
        {
          Class = objc_getClass(v26);
          if (class_conformsToProtocol(Class, v18))
          {
            v28 = qword_26AD828A8;
            if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&_dtx_internal_logger, v28, OS_LOG_TYPE_DEBUG, "protocol matched for class, calling block", buf, 2u);
            }
            v31((uint64_t)v29, Class);
          }
        }
      }
    }
    else if (!v20)
    {
LABEL_25:

      goto LABEL_26;
    }
    free(v20);
    goto LABEL_25;
  }
LABEL_26:
}

- (void)setCompressionHint:(int)a3 forChannel:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF3F18C;
  block[3] = &unk_264883D70;
  block[4] = self;
  int v16 = v4;
  id v8 = v6;
  id v15 = v8;
  dispatch_sync(handler_queue, block);
  if (v8) {
    uint64_t v11 = [v8 _channelCodeWithChannel:v9];
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = [DTXMessage _notifyCompressionHint:v4 forChannelCode:v11];
  [self sendMessage:v13 fromChannel:v12 sendMode:2 syncWithReply:0 replyHandler:0];
}

+ (id)connectionToAddress:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = v4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  uint64_t v27 = 0;
  id v9 = [v6 v7:v8];
  uint64_t v10 = qword_26AD828C0;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = sub_22AF46868;
  v21 = &unk_264883C08;
  v23 = &v24;
  id v11 = v9;
  id v22 = v11;
  dispatch_sync(v10, &v18);
  id v12 = objc_alloc((Class)v25[3]);
  v14 = [v12 initWithRemoteAddress:v13 address:v6 port:v18 interface:v19 protocol:v20 options:v21];

  _Block_object_dispose(&v24, 8);
  int v16 = [v5 initWithTransport:v15 transportType:v14];

  return v16;
}

- (void)_handleMessageParseException:(id)a3 forChannelCode:(unsigned int)a4 messageID:(unsigned int)a5 fragmentCount:(unsigned int)a6 withPayloadBytes:(const void *)a7 ofLength:(unint64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  v99[6] = *MEMORY[0x263EF8340];
  id v13 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v97[0]) = v12;
    WORD2(v97[0]) = 2048;
    *(void *)((char *)v97 + 6) = a8;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "exception handler called for message parsing: channel code:%u, payload length:%llu", buf, 0x12u);
  }
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
LABEL_38:
  }
    objc_exception_throw(v13);
  v99[0] = &unk_26DE40DE0;
  v98[0] = @"Version";
  v98[1] = @"ChannelCode";
  id v15 = [NSNumber numberWithUnsignedInt:v14];
  v99[1] = v15;
  v98[2] = @"MessageID";
  uint64_t v17 = [NSNumber numberWithUnsignedInt:v16];
  v99[2] = v17;
  v98[3] = @"FragmentCount";
  uint64_t v19 = [NSNumber numberWithUnsignedInt:v18];
  v99[3] = v19;
  v98[4] = @"SerializedDataRawLength";
  v21 = [NSNumber numberWithUnsignedLongLong:v20];
  v99[4] = v21;
  v98[5] = @"SerializedDataBase64";
  v23 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v22 length:(uint64_t)a7 freeWhenDone:a8];
  v25 = [v23 base64EncodedStringWithOptions:0];
  v99[5] = v25;
  uint64_t v27 = [NSDictionary dictionaryWithObjects:v26 forKeys:v99 count:6];

  id v91 = 0;
  id v29 = [MEMORY[0x263F08900] dataWithJSONObject:v28 options:v27 error:&v91];
  id v30 = v91;
  v33 = v30;
  if (!v29 || v30)
  {
    v64 = &_os_log_internal;
    id v65 = &_os_log_internal;
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    if (v33)
    {
      [v33 localizedDescriptionWithLocale:v66 arguments:v67];
      v64 = objc_claimAutoreleasedReturnValue();
      v70 = (const char *)[v64 UTF8String];
    }
    else
    {
      v70 = "{no error available}";
    }
    *(_DWORD *)buf = 136315138;
    v97[0] = v70;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to serialize log content to JSON: %s", buf, 0xCu);
    if (!v33) {
      goto LABEL_37;
    }
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  int v34 = [MEMORY[0x263F08850] v31:v32];
  id v90 = 0;
  v36 = [v34 URLForDirectory:v35 inDomain:5 appropriateForURL:v34 create:0 error:&v90];
  id v37 = v90;

  if (v37)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      [v37 localizedDescriptionWithLocale:v71];
      id v73 = objc_claimAutoreleasedReturnValue();
      uint64_t v76 = [v73 UTF8String];
      *(_DWORD *)buf = 136315138;
      v97[0] = v76;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to get ~/Library NSURL, nowhere to write to failure log: %s", buf, 0xCu);
    }
    goto LABEL_38;
  }
  uint64_t v39 = [NSURL URLWithString:@"Logs/DTXConnection" relativeToURL:v38];
  if (!v39)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    v77 = &_os_log_internal;
    v78 = "failed to build DTXConnection log dir URL, nowhere to write to failure log";
    v79 = buf;
    uint32_t v80 = 2;
LABEL_33:
    _os_log_impl(&_dtx_internal_logger, v77, OS_LOG_TYPE_ERROR, v78, v79, v80);
    goto LABEL_38;
  }
  v42 = (void *)v39;
  uint64_t v43 = [MEMORY[0x263F08850] performSelector:v40 withObject:v41];
  id v89 = 0;
  int v45 = [v43 createDirectoryAtURL:v44 withIntermediateDirectories:(uint64_t)v42 attributes:0 error:&v89];
  id v46 = v89;

  if (!v45 || v46)
  {
    v64 = &_os_log_internal;
    id v81 = &_os_log_internal;
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    if (v46)
    {
      [v46 localizedDescriptionWithLocale:v82];
      v64 = objc_claimAutoreleasedReturnValue();
      v84 = (const char *)[v64 UTF8String];
    }
    else
    {
      v84 = "<no error returned>";
    }
    *(_DWORD *)buf = 136315138;
    v97[0] = v84;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to create DTXConnection log dir, nowhere to write to failure log: %s", buf, 0xCu);
    if (!v46) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  [v42 v47:v48];
  id v49 = objc_claimAutoreleasedReturnValue();
  v52 = (const char *)[v49 UTF8String];
  pid_t v53 = getpid();
  snprintf((char *)buf, 0x400uLL, "%s/FailedDecompression-%d-XXXXXX.log", v52, v53);

  int v54 = mkstemps((char *)buf, 4);
  if (v54 == -1)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    v85 = __error();
    v86 = strerror(*v85);
    *(_DWORD *)v92 = 136315394;
    v93 = buf;
    __int16 v94 = 2080;
    v95 = v86;
    v77 = &_os_log_internal;
    v78 = "failed to create file '%s': %s";
    v79 = v92;
    uint32_t v80 = 22;
    goto LABEL_33;
  }
  int v55 = v54;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v92 = 136315138;
    v93 = buf;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_INFO, "writing failed decompression log to '%s'", v92, 0xCu);
  }
  id v56 = [NSString alloc];
  id v58 = [v56 initWithData:v57 encoding:4];
  v61 = (const char *)[v58 UTF8String];
  dprintf(v55, "%s", v61);

  if ((v55 & 0x80000000) == 0 && close(v55) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v62 = __error();
    v63 = strerror(*v62);
    *(_DWORD *)v92 = 136315394;
    v93 = buf;
    __int16 v94 = 2080;
    v95 = v63;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to close file '%s': %s", v92, 0x16u);
  }
  if (!qword_2683E3578 || (*(unsigned int (**)(void))(qword_2683E3578 + 16))()) {
    goto LABEL_38;
  }
}

- (void)_setupWireProtocols
{
  p_incomingParser = (id *)&self->_incomingParser;
  id v5 = [self->_incomingParser parsingComplete:a2 with:v2];
  id v6 = *p_incomingParser;
  id *p_incomingParser = 0;

  outgoingTransmitter = self->_outgoingTransmitter;
  self->_outgoingTransmitter = 0;

  uint64_t v10 = [self->_controlTransport v8:v9];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_22AF3FBAC;
  v28 = sub_22AF3FBBC;
  id v29 = 0;
  uint64_t v11 = [DTXMessageParser alloc];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_22AF3FBC4;
  v20[3] = &unk_264883DC0;
  id v12 = v10;
  id v21 = v12;
  id v22 = self;
  v23 = &v24;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_22AF3FD18;
  v19[3] = &unk_264883DE8;
  v19[4] = self;
  uint64_t v14 = [v11 initWithMessageHandler:v13 andParseExceptionHandler:v20];
  id v15 = (void *)v25[5];
  v25[5] = v14;

  objc_storeStrong(p_incomingParser, (id)v25[5]);
  int v16 = (DTXMessageTransmitter *)objc_opt_new();
  uint64_t v17 = self->_outgoingTransmitter;
  self->_outgoingTransmitter = v16;

  [self->_outgoingTransmitter setSuggestedFragmentSize:0x10000];
  _Block_object_dispose(&v24, 8);
}

- (DTXConnection)initWithTransport:(id)a3
{
  id v5 = a3;
  v67.receiver = self;
  v67.super_class = (Class)DTXConnection;
  id v6 = [(DTXConnection *)&v67 init];
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_controlTransport, a3);
      uint64_t v10 = [v5 permittedBlockCompressionTypes:v8, v9];
      uint64_t v11 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v10;

      uint64_t v14 = [*(void **)(v7 + 32) v12:v13];
      id v15 = *(void **)(v7 + 144);
      *(void *)(v7 + 144) = v14;

      uint64_t v16 = objc_opt_new();
      uint64_t v17 = *(void **)(v7 + 88);
      *(void *)(v7 + 88) = v16;

      uint64_t v18 = objc_opt_new();
      uint64_t v19 = *(void **)(v7 + 96);
      *(void *)(v7 + 96) = v18;

      uint64_t v20 = objc_opt_new();
      id v21 = *(void **)(v7 + 72);
      *(void *)(v7 + 72) = v20;

      uint64_t v22 = objc_opt_new();
      v23 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v22;

      uint64_t v24 = objc_opt_new();
      v25 = *(void **)(v7 + 136);
      *(void *)(v7 + 136) = v24;

      dispatch_queue_t v26 = dispatch_queue_create("connection control queue", 0);
      uint64_t v27 = *(void **)(v7 + 24);
      *(void *)(v7 + 24) = v26;

      dispatch_queue_t v28 = dispatch_queue_create_with_target_V2("connection data queue", 0, *(dispatch_queue_t *)(v7 + 24));
      id v29 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = v28;

      dispatch_queue_t v30 = dispatch_queue_create("connection handler queue", 0);
      uint64_t v31 = *(void **)(v7 + 56);
      *(void *)(v7 + 56) = v30;

      uint64_t v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v33 = dispatch_queue_create_with_target_V2("connection receive queue", v32, *(dispatch_queue_t *)(v7 + 56));
      int v34 = *(void **)(v7 + 48);
      *(void *)(v7 + 48) = v33;

      dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
      v36 = *(void **)(v7 + 152);
      *(void *)(v7 + 152) = v35;

      uint64_t v37 = objc_opt_new();
      __int16 v38 = *(void **)(v7 + 104);
      *(void *)(v7 + 104) = v37;

      uint64_t v39 = objc_opt_new();
      uint64_t v40 = *(void **)(v7 + 112);
      *(void *)(v7 + 112) = v39;

      *(_DWORD *)(v7 + 188) = atomic_fetch_add(dword_26AD82880, 1u) + 1;
      [v7 performSelector:v41 withObject:v42];
      int v45 = byte_26AD828E0;
      *(unsigned char *)(v7 + 184) = byte_26AD828E0;
      if (v45) {
        *(void *)(v7 + 200) = 0x80000;
      }
      id v46 = [MEMORY[0x263EFFA40] objectForKey:v43];
      int v48 = [v46 integerForKey:v47];
      if (v48) {
        int v50 = v48;
      }
      else {
        int v50 = 3;
      }
      *(_DWORD *)(v7 + 216) = v50;
      uint64_t v51 = [v46 integerForKey:v49];
      uint64_t v52 = 0x4000;
      if (v51) {
        uint64_t v52 = v51;
      }
      *(void *)(v7 + 224) = v52;
      *(_DWORD *)(v7 + 212) = 1;
      *(_DWORD *)(v7 + 64) = 1;
      pid_t v53 = [DTXChannel alloc];
      uint64_t v55 = [v53 initWithConnection:v54 channelIdentifier:v7 label:0];
      id v56 = *(void **)(v7 + 176);
      *(void *)(v7 + 176) = v55;

      [*(void **)(v7 + 72) setObject:*(void *)(v7 + 176) forKeyedSubscript:v57];
      uint64_t BlockCompressor = [DTXBlockCompressorFactory createBlockCompressor:v58 withOptions:v59];
      v61 = *(void **)(v7 + 232);
      *(void *)(v7 + 232) = BlockCompressor;

      if ([v5 supportedDirections:v62, v63] == 2) {
        *(_DWORD *)(v7 + 208) = 2;
      }
      [v7 setupWireProtocols:v64, v65];
    }
    else
    {
      id v46 = v6;
      uint64_t v7 = 0;
    }
  }
  return (DTXConnection *)v7;
}

- (void)dealloc
{
  firstMessageSem = self->_firstMessageSem;
  if (firstMessageSem && self->_remoteCapabilityVersions) {
    dispatch_semaphore_wait(firstMessageSem, 0xFFFFFFFFFFFFFFFFLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXConnection;
  [(DTXConnection *)&v4 dealloc];
}

- (id)publishedAddresses
{
  return (id)((uint64_t (*)(DTXTransport *, char *))MEMORY[0x270F9A6D0])(self->_controlTransport, sel_localAddresses);
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  return [NSString stringWithFormat:@"<%s %p : x%d>", Name, self, self->_connectionIndex];
}

- (void)setMaximumEnqueueSize:(unint64_t)a3
{
  if (*MEMORY[0x263EF8AF8] <= a3)
  {
    unint64_t v4 = a3;
    [self->_resourceTracker setTotalSize:a2];
  }
  else
  {
    unint64_t v4 = *MEMORY[0x263EF8AF8];
    [self->_resourceTracker setTotalSize:*MEMORY[0x263EF8AF8]];
  }
  [self->_resourceTracker setMaxChunkSize:v5];
  [self->_controlTransport setControlTransport:v6];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 setTotalSize:v8];
}

- (unint64_t)maximumEnqueueSize
{
  return ((uint64_t (*)(DTXResourceTracker *, char *))MEMORY[0x270F9A6D0])(self->_resourceTracker, sel_totalSize);
}

- (void)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v13 = 0;
  char v5 = [self publishCapability:a2 withVersion:a3 forClass:a4 error:&v13];
  id v6 = v13;
  uint64_t v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      uint64_t v8 = (void *)qword_26AD828D0;
      if (os_log_type_enabled((os_log_t)qword_26AD828D0, OS_LOG_TYPE_ERROR))
      {
        id v9 = v8;
        id v12 = [v7 localizedDescriptionWithLocale:v10 value:v11];
        *(_DWORD *)buf = 138543362;
        id v15 = v12;
        _os_log_impl(&_dtx_internal_logger, v9, OS_LOG_TYPE_ERROR, "Failed to publish capability: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5 error:(id *)a6
{
  v36[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v29 = 0;
  dispatch_queue_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_22AF3FBAC;
  dispatch_queue_t v33 = sub_22AF3FBBC;
  id v34 = 0;
  handler_queue = self->_handler_queue;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_22AF40448;
  v23 = &unk_264883E10;
  uint64_t v24 = self;
  dispatch_queue_t v26 = &v29;
  int v28 = a4;
  id v12 = v10;
  id v25 = v12;
  Class v27 = a5;
  dispatch_sync(handler_queue, &v20);
  uint64_t v14 = v30[5];
  if (a6 && v14)
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    v36[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v13 forKeys:(uint64_t)v36 count:v20, v21, v22, v23, v24];
    [NSException raise:@"DTXConnection" format:@"%@ (%d)", @"DTXConnection", 2];
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = v30[5];
  }
  BOOL v18 = v14 == 0;

  _Block_object_dispose(&v29, 8);
  return v18;
}

- (id)localCapabilities
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_22AF3FBAC;
  id v10 = sub_22AF3FBBC;
  id v11 = 0;
  handler_queue = self->_handler_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF4085C;
  v5[3] = &unk_264883C08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(handler_queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_sendHeartbeatAsyncWithTimeout:(double)a3
{
  char v5 = objc_opt_new();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  uint64_t v6 = kDTXHeartbeatMessage;
  defaultChannel = self->_defaultChannel;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_22AF409DC;
  v13[3] = &unk_264883E38;
  double v16 = a3;
  id v15 = v17;
  v13[4] = self;
  id v8 = v5;
  id v14 = v8;
  [self sendMessage:v9 fromChannel:v6 sendMode:2 syncWithReply:0 replyHandler:v13];
  id v10 = v14;
  id v11 = v8;

  _Block_object_dispose(v17, 8);

  return v11;
}

- (double)preflightSynchronouslyWithTimeout:(double)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v8 = [self sendHeartbeatAsyncWithTimeout:v6 timeout:v7 completion:a3];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_22AF40CBC;
  v13[3] = &unk_264883E60;
  id v15 = &v16;
  id v9 = v5;
  id v14 = v9;
  [v8 handleCompletion:v10 withError:v13];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  double v11 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void)_handleMissingRemoteCapabilities
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  receive_queue = self->_receive_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF40E00;
  v5[3] = &unk_2648839B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(receive_queue, v5);
  if (*((unsigned char *)v7 + 24))
  {
    [self sendMessage:v4 fromChannel:self->_defaultChannel sendMode:2 syncWithReply:0 replyHandler:0];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_firstMessageSem, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_firstMessageSem);
  }
  _Block_object_dispose(&v6, 8);
}

- (int)remoteCapabilityVersion:(id)a3
{
  id v6 = a3;
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  if (!remoteCapabilityVersions)
  {
    [self _handleMissingRemoteCapabilities:v4 withTransitionContext:v5];
    remoteCapabilityVersions = self->_remoteCapabilityVersions;
  }
  [MEMORY[0x263EFF9D0] setValue:v4 forKey:v5];
  uint64_t v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (remoteCapabilityVersions == v8
    || (self->_remoteCapabilityVersions[v9],
        (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v14 = 0x80000000;
  }
  else
  {
    id v13 = v10;
    int v14 = [v10 performSelector:v11 withObject:v12];
  }
  return v14;
}

- (void)registerCapabilityOverrideBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    handler_queue = self->_handler_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_22AF40FC0;
    v7[3] = &unk_264883940;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(handler_queue, v7);
  }
}

- (id)remoteCapabilityVersions
{
  if (!self->_remoteCapabilityVersions) {
    [self _handleMissingRemoteCapabilities:a2 withError:v2];
  }
  id v4 = objc_opt_new();
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  [MEMORY[0x263EFF9D0] setValue:v6 forKey:v7];
  id v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (remoteCapabilityVersions != v8) {
    [v4 addEntriesFromDictionary:v9];
  }
  id v10 = objc_opt_new();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22AF41190;
  v15[3] = &unk_264883E88;
  id v16 = v10;
  id v11 = v10;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];
  [v4 removeObjectsForKeys:v13];

  return v4;
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_outgoing_control_queue);
  receive_queue = self->_receive_queue;

  dispatch_suspend(receive_queue);
}

- (void)resume
{
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF412A8;
  block[3] = &unk_264883A58;
  block[4] = self;
  dispatch_sync(handler_queue, block);
}

- (void)setMessageHandler:(id)a3
{
}

- (void)setDispatchTarget:(id)a3
{
}

- (void)setChannelHandler:(id)a3
{
  id v4 = a3;
  handler_queue = self->_handler_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22AF41780;
  v7[3] = &unk_264883940;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(handler_queue, v7);
}

- (void)registerDisconnectHandler:(id)a3
{
}

- (void)cancel
{
}

- (void)cancelWithSerializedTransport:(id)a3
{
  uint64_t v5 = (const char *)a3;
  char v9 = (char *)v5;
  if (v5)
  {
    [self _cancelInternal_:v5 withTransitionContext:v5];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:v8 object:a2 file:@"DTXConnection.m" lineNumber:881 description:@"Invalid parameter not satisfying: %@", @"transportCallback != nil"];

    [self cancelInternal:0];
  }
}

- (void)_cancelInternal:(id)a3
{
  id v4 = a3;
  receive_queue = self->_receive_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22AF4191C;
  v7[3] = &unk_264883940;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(receive_queue, v7);
}

- (void)sendControlAsync:(id)a3 replyHandler:(id)a4
{
}

- (void)sendControlSync:(id)a3 replyHandler:(id)a4
{
}

- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4
{
  return MEMORY[0x270F9A6D0](self->_defaultChannel, sel_sendMessageAsync_replyHandler_, a3);
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
}

- (void)sendMessageSync:(id)a3 replyHandler:(id)a4
{
}

- (BOOL)sendMessage:(id)a3 fromChannel:(id)a4 sendMode:(int)a5 syncWithReply:(BOOL)a6 replyHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v16 = a7;
  BOOL v17 = 0;
  if (v12 && (id)kDTXInterruptionMessage != v12)
  {
    unint64_t v18 = [v12 _serializedLength:v14 withTransitionContext:v15];
    unint64_t v21 = v18;
    unint64_t logMessageCallstackSizeThreshold = self->_logMessageCallstackSizeThreshold;
    if (logMessageCallstackSizeThreshold
      && v18 > logMessageCallstackSizeThreshold
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      v23 = [MEMORY[0x263F08B88] callStackSymbols:v19 withSymbols:v20];
      [v23 componentsJoinedByString:@"\n"];
      id v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      double v93 = (double)v21 * 0.000000953674316;
      __int16 v94 = 2080;
      uint64_t v95 = [v25 UTF8String];
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_INFO, "large message (%.2lf MB) from:\n%s", buf, 0x16u);
    }
    if (v21 >= self->_compressionMinSizeThreshold && self->_remoteCompressionCapabilityVersion >= 1)
    {
      uint64_t compressionTypeForUnspecified = [v13 compressionTypeHint:v19 for:v20];
      if (compressionTypeForUnspecified <= 1) {
        uint64_t compressionTypeForUnspecified = self->_compressionTypeForUnspecified;
      }
      if (compressionTypeForUnspecified != 2)
      {
        permittedBlockCompressors = self->_permittedBlockCompressors;
        if (permittedBlockCompressors)
        {
          dispatch_queue_t v30 = [NSNumber numberWithUnsignedInt:compressionTypeForUnspecified];
          int v32 = [permittedBlockCompressors containsObject:v31];

          if (v32)
          {
            int remoteCompressionCapabilityVersion = self->_remoteCompressionCapabilityVersion;
            if (remoteCompressionCapabilityVersion >= 2) {
              int remoteCompressionCapabilityVersion = 2;
            }
            [v12 compressWithCompressor:v19 usingType:(uint64_t)self->_compressor forCompatibilityWithVersion:compressionTypeForUnspecified remoteCompressionCapabilityVersion:remoteCompressionCapabilityVersion];
          }
        }
      }
    }
    BOOL v81 = v8;
    if ((id)kDTXAckBarrierMessage == v12)
    {
      id v34 = [DTXMessage messageWithName:v19 arguments:v20];

      [v34 performSelectorOnMainThread:@selector(makeBarrier:) withObject:v35 waitUntilDone:v36];
      id v12 = v34;
    }
    [v12 _makeImmutable:v19 withTransitionContext:v20];
    uint64_t v39 = [v12 objc_msgSend_serializedLength:v37 with:v38];
    uint64_t v41 = v39;
    if (v12 == (id)kDTXBarrierMessage) {
      uint64_t v42 = 0;
    }
    else {
      uint64_t v42 = v39;
    }
    if (a5)
    {
      uint64_t v43 = 0;
      unsigned int v44 = [self->_resourceTracker size];
    }
    else
    {
      uint64_t v43 = v42;
      unsigned int v44 = [self->_resourceTracker _acquireSize:v40 withSize:v42];
    }
    if (v44)
    {
      unsigned int v47 = v44;
      uint32_t v80 = v13;
      if ([v12 _conversationIndex:v45 withConversationIdentifier:v46])
      {
        if ([v12 v48:v49])
        {
          uint64_t v52 = 0;
          unsigned int v53 = [v80 _channelCode:v50];
        }
        else
        {
          unsigned int v47 = [v12 v50:v51];
          uint64_t v52 = [v12 _conversationIndex:v57 withConversationID:v58] << 32;
          unsigned int v53 = [v12 _channelCode:v59];
        }
      }
      else
      {
        id v56 = v13;
        uint64_t v52 = 0;
        unsigned int v53 = [v56 _channelCode:v48 with:v49];
      }
      uint64_t v61 = v53;
      uint64_t v62 = 0x100000000;
      v79 = v16;
      if (!v16 && ![v12 _isDispatch:v54 withTransitionContext:v55]) {
        uint64_t v62 = 0;
      }
      uint64_t v63 = v62 | v61;
      if (a5 == 1) {
        dispatch_semaphore_t v64 = dispatch_semaphore_create(0);
      }
      else {
        dispatch_semaphore_t v64 = 0;
      }
      BOOL v66 = v12 == (id)kDTXBarrierMessage || v12 == (id)kDTXHeartbeatMessage;
      v82[0] = MEMORY[0x263EF8330];
      v82[1] = 3221225472;
      v82[2] = sub_22AF423D0;
      v82[3] = &unk_264883FC8;
      v82[4] = self;
      uint64_t v86 = v41;
      BOOL v90 = a5 == 2;
      BOOL v91 = v66;
      id v12 = v12;
      uint64_t v67 = v52 | v47;
      id v83 = v12;
      uint64_t v88 = v67;
      uint64_t v89 = v63;
      id v13 = v80;
      id v68 = v80;
      id v84 = v68;
      uint64_t v87 = v43;
      uint64_t v69 = v64;
      v85 = v69;
      v71 = (void (**)(void, void))MEMORY[0x230F36B10](v82);
      if (self->_tracer)
      {
        uint64_t v72 = [v12 descriptionWithRoutingInformation:v70 routingInformation:v67 routingContext:v63];
        sub_22AF41470("  sent  ", self, v68, v72);
      }
      if (v81 && v62)
      {
        pthread_getspecific(qword_26AD828B0);
        id v75 = (id)objc_claimAutoreleasedReturnValue();
        id v16 = v79;
        if (v75 == v68 && v12 != (id)kDTXBarrierMessage) {
          [MEMORY[0x263EFF940] DTXConnectionException:@"API misuse: client attempted to synchronously send a message and wait for response while already executing in channel's asynchronous handler context."];
        }
        if (v75)
        {
          [self->_incomingResourceTracker _suspendLimits:v73];
          sub_22AF42910(v79, v71);
          [self->_incomingResourceTracker resumeLimits:v76 with:v77];
        }
        else
        {
          sub_22AF42910(v79, v71);
        }

        if (!v69) {
          goto LABEL_55;
        }
      }
      else
      {
        id v16 = v79;
        ((void (**)(void, void *))v71)[2](v71, v79);
        if (!v69)
        {
LABEL_55:

          BOOL v17 = 0;
          goto LABEL_56;
        }
      }
      dispatch_semaphore_wait(v69, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_55;
    }
    BOOL v17 = 1;
  }
LABEL_56:

  return v17;
}

- (BOOL)_addHandler:(id)a3 forMessage:(unsigned int)a4 channel:(id)a5
{
  id v8 = a3;
  char v9 = (DTXChannel *)a5;
  id v12 = v9;
  if (v8)
  {
    if (!v9) {
      id v12 = self->_defaultChannel;
    }
    uint64_t v27 = 0;
    int v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 1;
    uint64_t v13 = [v12 _channelCode:v10 withTransitionContext:v11];
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:a4 | (unint64_t)(v13 << 32)];
    handler_queue = self->_handler_queue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_22AF42C18;
    v20[3] = &unk_264883FF0;
    void v20[4] = self;
    uint64_t v24 = &v27;
    int v25 = v13;
    id v12 = v12;
    unint64_t v21 = v12;
    id v22 = v15;
    id v23 = v8;
    unsigned int v26 = a4;
    id v17 = v15;
    dispatch_sync(handler_queue, v20);
    BOOL v18 = *((unsigned char *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (void)_routeMessage:(id)a3
{
  id v4 = a3;
  id v26 = v4;
  if ((id)kDTXInterruptionMessage == v4)
  {
    [self _cancel:v5 withTransitionContext:v6];
  }
  else
  {
    char v7 = [v4 _conversationIndex:v5];
    unsigned int v10 = [v26 channelCode:v8];
    if (v7)
    {
      LODWORD(v12) = v10;
      [NSNumber numberWithInt:v11];
    }
    else
    {
      uint64_t v12 = -v10;
      [NSNumber numberWithInt:v11];
    int v14 = };
    if (v12)
    {
      [self->_channelsByCode objectForKey:v13];
      uint64_t v15 = (DTXChannel *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = self->_defaultChannel;
    }
    id v17 = v15;
    if (!v15)
    {
      [self->_unconfiguredChannelsByCode objectForKey:v16];
      BOOL v18 = (DTXChannel *)objc_claimAutoreleasedReturnValue();
      id v17 = v18;
      if (v18)
      {
        [v18 resume:v16 withError:v19];
        [self->_unconfiguredChannelsByCode removeObjectForKey:v20];
        [self->_channelsByCode setObject:v21 forKey:(uint64_t)v17];
      }
    }
    [self _scheduleMessage:v16 toChannel:v26];
    if (!self->_remoteCapabilityVersions)
    {
      uint64_t v24 = [NSDictionary dictionaryWithDictionary:v22];
      [self _notifyOfPublishedCapabilities:v25 withTransitionContext:v24];
    }
  }
}

- (void)_scheduleMessage:(id)a3 toChannel:(id)a4
{
  v97[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v9 = (DTXChannel *)a4;
  if (self->_tracer)
  {
    unsigned int v10 = [v6 descriptionWithLocale:v7 indent:v8];
    sub_22AF41470("received", self, v9, v10);
  }
  if (v9)
  {
    if ([v6 isBarrier:v7 withTransitionContext:v8])
    {
      incomingResourceTracker = self->_incomingResourceTracker;
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = sub_22AF43458;
      v92[3] = &unk_264883A30;
      uint8_t v92[4] = self;
      double v93 = v9;
      [v93 scheduleMessage:v14 tracker:incomingResourceTracker withHandler:v92];
    }
    else if ([v6 _isDispatch:v11 withTransitionContext:v12])
    {
      uint64_t v35 = (void *)MEMORY[0x230F368A0]();
      if (self->_defaultChannel == v9 && [v6 shouldInvokeWithTarget:self])
      {
        uint64_t v36 = pthread_getspecific(qword_26AD828B0);
        pthread_setspecific(qword_26AD828B0, self->_defaultChannel);
        [v6 invokeWithTarget:v37 replyChannel:v9 validator:0];
        pthread_setspecific(qword_26AD828B0, v36);
        uint64_t v38 = self->_incomingResourceTracker;
        uint64_t v41 = [v6 v39:v40];
        [v38 releaseSize:v42 with:v41];
      }
      else
      {
        [v9 scheduleMessage:v34 tracker:v6 withHandler:self->_incomingResourceTracker];
      }
    }
    else if ([v6 _conversationIndex:v32 withTransitionContext:v33])
    {
      char v45 = [v6 _conversationIndex:v43];
      unsigned int v48 = [v6 channelCode:v46];
      if (v45) {
        uint64_t v51 = v48;
      }
      else {
        uint64_t v51 = -v48;
      }
      uint64_t v52 = NSNumber;
      unsigned int v53 = [v6 v49:v50];
      uint64_t v55 = [v52 numberWithUnsignedLongLong:v53 | (unint64_t)(v51 << 32)];
      uint64_t v59 = [self->_handlersByIdentifier objectForKey:v56];
      if (v59)
      {
        [v9 scheduleMessage:v57 tracker:v6 withHandler:self->_incomingResourceTracker completion:v59];
        [self->_handlersByIdentifier removeObjectForKey:v60];
      }
      else
      {
        if ([v6 _callOutQueue_willDestroyWithTransitionContext:v57 completion:v58])
        {
          uint64_t v69 = [MEMORY[0x263EFF940] _DTXMissingReplyBlockException:@"Peer was not expecting a reply for the provided message and dropped it"];
          v70 = (void *)MEMORY[0x263F087E8];
          uint64_t v94 = *MEMORY[0x263F08320];
          id v73 = [v69 descriptionWithLocale:v71 indent:v72];
          uint64_t v95 = v73;
          id v75 = [NSDictionary dictionaryWithObjects:v74 forKeys:(id[]){v95} count:1];
          uint64_t v77 = [v70 _errorWithDomain:v76 code:1 userInfo:v75];
          v79 = [v6 newReplyWithError:v77];

          [self sendMessage:v80 fromChannel:v9 sendMode:2 syncWithReply:0 replyHandler:0];
        }
        BOOL v81 = self->_incomingResourceTracker;
        uint64_t v82 = [v6 v67:v68];
        [v81 releaseSize:v83 withSize:v82];
      }
    }
    else
    {
      if (!v6)
      {
        uint64_t v61 = [self->_handlersByIdentifier mutableCopyWithZone:v43];
        handlersByIdentifier = self->_handlersByIdentifier;
        uint64_t v84 = MEMORY[0x263EF8330];
        uint64_t v85 = 3221225472;
        uint64_t v86 = sub_22AF434B8;
        uint64_t v87 = &unk_264884018;
        uint64_t v88 = v9;
        uint64_t v63 = v61;
        uint64_t v89 = v63;
        BOOL v90 = self;
        id v91 = 0;
        [handlersByIdentifier enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    v64 = key;
    v84 = obj;
}];
        uint64_t v65 = self->_handlersByIdentifier;
        self->_handlersByIdentifier = v63;
        BOOL v66 = v63;
      }
      [v9 scheduleMessage:v43 tracker:v6 withHandler:^(id<MTLDevice> _Nonnull) {
    return self->_incomingResourceTracker;
}];
    }
  }
  else
  {
    if ([v6 respondsToSelector:v7])
    {
      id v17 = [MEMORY[0x263EFF940] _DTXMissingChannelException:@"Unable to invoke message sent to invalid channel"];
      BOOL v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v96 = *MEMORY[0x263F08320];
      unint64_t v21 = [v17 descriptionWithLocale:v19 indent:v20];
      v97[0] = v21;
      uint64_t v23 = [NSDictionary dictionaryWithObjects:v22 forKeys:@[v97]];
      int v25 = [v18 errorWithDomain:v24 code:1 userInfo:v23];
      uint64_t v27 = [v6 newReplyWithError:v25];

      [self sendMessage:v28 fromChannel:(uint64_t)v27 sendMode:2 syncWithReply:0 replyHandler:0];
    }
    uint64_t v29 = self->_incomingResourceTracker;
    uint64_t v30 = [v6 v15:v16];
    [v29 releaseSize:v31];
  }
}

- (id)makeChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_22AF3FBAC;
  uint64_t v31 = sub_22AF3FBBC;
  id v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF437F0;
  block[3] = &unk_264884040;
  unint64_t v21 = &v23;
  id v22 = &v27;
  block[4] = self;
  id v6 = v4;
  id v20 = v6;
  dispatch_sync(handler_queue, block);
  uint64_t v8 = [DTXMessage _requestChannelWithCode:*((unsigned int *)v24 + 6) identifier:v6];
  id v9 = (id)v28[5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_22AF438B8;
  v16[3] = &unk_264883A30;
  id v10 = v6;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  [self sendMessage:v12 fromChannel:(uint64_t)v8 sendMode:2 syncWithReply:0 replyHandler:v16];
  [v28[5] setCompressionTypeHint:v13 hint:self->_newChannelCompressionHint];
  id v14 = (id)v28[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (void)setRemoteTracer:(BOOL)a3
{
  self->_remoteTracer = a3;
  [DTXMessage _setTracerState:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [self sendMessage:v4 fromChannel:v5 sendMode:2 syncWithReply:0 replyHandler:];
}

- (void)_unregisterChannel:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4)
  {
    uint64_t v8 = [v4 _channelCodeWithChannelCode:v5];
    id v10 = [DTXMessage _channelCanceled_:v8];
    [self sendMessage:v11 fromChannel:(uint64_t)v10 sendMode:2 syncWithReply:0 replyHandler:0];
    [self sendMessage:v12 fromChannel:0 sendMode:2 syncWithReply:0 replyHandler:0];
    receive_queue = self->_receive_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22AF43B30;
    block[3] = &unk_264884068;
    id v15 = v7;
    uint64_t v16 = self;
    dispatch_async(receive_queue, block);
  }
}

- (void)_requestChannelWithCode:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = (void *)MEMORY[0x230F368A0]();
  uint64_t v8 = -a3;
  id v9 = [DTXChannel alloc];
  id v11 = [v9 initWithConnection:v10 channelIdentifier:(uint64_t)self label:v8];
  [v11 performSelector:v12 withObject:v13];
  [v11 setCompressionTypeHint:self->_newChannelCompressionHint];
  uint64_t v16 = [NSNumber numberWithInt:v15];
  [self->_unconfiguredChannelsByCode setObject:v17 forKey:(uint64_t)v11];
  uint64_t v52 = (void *)MEMORY[0x230F36B10](self->_channelHandler);
  uint64_t v19 = [v6 componentsSeparatedByString:v18];
  if ([v19 count:v20 with:v21] == 3
    && [v19 objectAtIndex:v22],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = [v23 isEqualToString:v24],
        v23,
        isEqualToString))
  {
    uint64_t v27 = [v19 objectAtIndex:v26];
    sub_22AF4694C(v27);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v30 = [v19 objectAtIndex:2];
    sub_22AF4694C(v30);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    int v32 = 1;
  }
  else
  {
    id v28 = 0;
    id v31 = 0;
    int v32 = 0;
  }

  id v33 = v28;
  id v34 = v31;
  if (v32)
  {
    uint64_t v51 = v16;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v69 = 0x3032000000;
    v70 = sub_22AF3FBAC;
    v71 = sub_22AF3FBBC;
    id v72 = 0;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v35 = self->_protocolHandlers;
    uint64_t v38 = [v35 countByEnumeratingWithState:v36 objects:&v61 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v62;
      while (2)
      {
        uint64_t v40 = v7;
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v62 != v39) {
            objc_enumerationMutation(v35);
          }
          uint64_t v42 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          if ([v42 matchesPublishedProtocolName:v37 peerProtocolName:(uint64_t)v34])
          {
            objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v42);
            char v7 = v40;
            goto LABEL_18;
          }
        }
        uint64_t v38 = [v35 countByEnumeratingWithState:v37 objects:(id *)&v61 count:16];
        char v7 = v40;
        if (v38) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    uint64_t v16 = v51;
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = sub_22AF440D0;
      v58[3] = &unk_2648839B8;
      id v59 = v11;
      p_long long buf = &buf;
      [v59 _scheduleBlock_:v44 withBlock:v58];
    }
    else
    {
      unsigned int v48 = qword_26AD828D0;
      if (os_log_type_enabled((os_log_t)qword_26AD828D0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v65 = 138543362;
        id v66 = v6;
        _os_log_impl(&_dtx_internal_logger, v48, OS_LOG_TYPE_ERROR, "Protocol handler unavailable for specified channel: %{public}@", v65, 0xCu);
      }
      [v11 cancel:v49 withTransitionContext:v50 completion:v51];
    }
    _Block_object_dispose(&buf, 8);
  }
  else if (v52)
  {
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = sub_22AF441A8;
    v53[3] = &unk_264884090;
    id v57 = v52;
    id v54 = v11;
    id v55 = v6;
    id v56 = self;
    [v54 _scheduleBlock_:v43 withBlock:(void (^)(void))v53];
  }
  else
  {
    char v45 = qword_26AD828D0;
    if (os_log_type_enabled((os_log_t)qword_26AD828D0, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&_dtx_internal_logger, v45, OS_LOG_TYPE_ERROR, "No channel handler specified; channel canceled. %{public}@",
        (uint8_t *)&buf,
        0xCu);
    }
    [v11 cancel:v46 with:v47];
  }
}

- (void)_notifyOfPublishedCapabilities:(id)a3
{
  p_remoteCapabilityVersions = &self->_remoteCapabilityVersions;
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  id v6 = [a3 mutableCopyWithZone:a2];
  char v7 = v6;
  uint64_t v8 = p_remoteCapabilityVersions[1];
  if (v8)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_22AF44318;
    v17[3] = &unk_2648840B8;
    id v18 = v6;
    [v8 enumerateObjectsUsingBlock:v9];
    capabilityOverrideBlocks = self->_capabilityOverrideBlocks;
    self->_capabilityOverrideBlocks = 0;
  }
  objc_storeStrong((id *)p_remoteCapabilityVersions, v7);
  uint64_t v12 = [*p_remoteCapabilityVersions objectForKeyedSubscript:@"com.apple.private.DTXBlockCompression"];
  id v15 = v12;
  if (v12) {
    int v16 = [v12 v13:v14];
  }
  else {
    int v16 = 0x80000000;
  }
  self->_int remoteCompressionCapabilityVersion = v16;
  if (!remoteCapabilityVersions) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_firstMessageSem);
  }
}

- (void)_channelCanceled:(unsigned int)a3
{
  [NSNumber numberWithInt:-a3];
  p_channelsByCode = (void **)&self->_channelsByCode;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [self->_channelsByCode objectForKey:v5];
  if (v6)
  {
    uint64_t v8 = (void *)v6;
    [self scheduleMessage:v7 toChannel:0];
  }
  else
  {
    p_channelsByCode = (void **)&self->_unconfiguredChannelsByCode;
    id v10 = [self->_unconfiguredChannelsByCode objectForKey:v7];
    if (!v10) {
      goto LABEL_6;
    }
    uint64_t v8 = v10;
    [v10 resumeWithCompletion:v11];
    [self scheduleMessage:v13 toChannel:0];
  }
  [p_channelsByCode removeObjectForKey:v9];

LABEL_6:
}

- (void)_setTracerState:(unsigned int)a3
{
  self->_tracer = a3 != 0;
}

- (void)_receiveQueueSetCompressionHint:(unsigned int)a3 onChannel:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a4)
  {
    sub_22AF44518(a4, *(uint64_t *)&a3);
  }
  else
  {
    channelsByCode = self->_channelsByCode;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = sub_22AF469B4;
    uint64_t v12 = &unk_264884260;
    unsigned int v13 = a3;
    [channelsByCode enumerateKeysAndObjectsUsingBlock:a2, (uint64_t)&v9];
    unconfiguredChannelsByCode = self->_unconfiguredChannelsByCode;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = sub_22AF469B4;
    uint64_t v12 = &unk_264884260;
    unsigned int v13 = v4;
    [unconfiguredChannelsByCode enumerateKeysAndObjectsUsingBlock:v8, (uint64_t)&v9];
    sub_22AF44518(self->_defaultChannel, v4);
    self->_newChannelCompressionHint = v4;
  }
}

- (void)_notifyCompressionHint:(unsigned int)a3 forChannelCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 - 11 > 0xFFFFFFF5)
  {
    if (a4)
    {
      uint64_t v6 = [NSNumber numberWithInt:-a4];
      uint64_t v8 = [self->_channelsByCode objectForKey:v7];
      if (!v8)
      {
        uint64_t v8 = [self->_unconfiguredChannelsByCode objectForKey:v9];
      }
      id v11 = (const char *)v8;

      uint64_t v10 = v11;
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v12 = (char *)v10;
    [self receiveQueueSetCompressionHint:v10 onChannel:v4];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 67109376;
    int v14 = v4;
    __int16 v15 = 1024;
    int v16 = 10;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "attempted to set the compression type hint to an unknown compression method: specified=%u, max valid=%u", buf, 0xEu);
  }
}

- (void)setTracer:(BOOL)a3
{
  if (byte_26AD828E0) {
    a3 = 1;
  }
  self->_tracer = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)tracer
{
  return self->_tracer;
}

- (BOOL)remoteTracer
{
  return self->_remoteTracer;
}

- (int)atomicConnectionNumber
{
  return self->_connectionIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressor, 0);
  objc_storeStrong(&self->_channelHandler, 0);
  objc_storeStrong((id *)&self->_defaultChannel, 0);
  objc_storeStrong((id *)&self->_outgoingTransmitter, 0);
  objc_storeStrong((id *)&self->_incomingParser, 0);
  objc_storeStrong((id *)&self->_firstMessageSem, 0);
  objc_storeStrong((id *)&self->_incomingResourceTracker, 0);
  objc_storeStrong((id *)&self->_resourceTracker, 0);
  objc_storeStrong((id *)&self->_capabilityOverrideBlocks, 0);
  objc_storeStrong((id *)&self->_remoteCapabilityVersions, 0);
  objc_storeStrong((id *)&self->_localCapabilityClasses, 0);
  objc_storeStrong((id *)&self->_localCapabilityVersions, 0);
  objc_storeStrong((id *)&self->_protocolHandlers, 0);
  objc_storeStrong((id *)&self->_handlersByIdentifier, 0);
  objc_storeStrong((id *)&self->_unconfiguredChannelsByCode, 0);
  objc_storeStrong((id *)&self->_channelsByCode, 0);
  objc_storeStrong((id *)&self->_handler_queue, 0);
  objc_storeStrong((id *)&self->_receive_queue, 0);
  objc_storeStrong((id *)&self->_permittedBlockCompressors, 0);
  objc_storeStrong((id *)&self->_controlTransport, 0);
  objc_storeStrong((id *)&self->_outgoing_control_queue, 0);
  objc_storeStrong((id *)&self->_outgoing_message_queue, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)handleProxyRequestForInterface:(id)a3 peerInterface:(id)a4 handler:(id)a5
{
  proto = (Protocol *)a3;
  uint64_t v8 = (Protocol *)a4;
  id v9 = a5;
  id v11 = NSStringFromProtocol(proto);
  if (v8)
  {
    uint64_t v12 = NSStringFromProtocol(v8);
    [self _handleProxyRequestForInterface:v13 interfaceName:v11 peerInterface:v8 peerInterfaceName:v12 handler:v9];
  }
  else
  {
    [self _handleProxyRequestForInterface:v10 interfaceName:proto peerInterface:v11 peerInterfaceName:0 handler:v9];
  }
}

- (void)_handleProxyRequestForInterface:(id)a3 interfaceName:(id)a4 peerInterface:(id)a5 peerInterfaceName:(id)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v19 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    int v26 = [MEMORY[0x263F08690] currentHandler:v17 with:v18];
    [v26 _DTXConnection_DTXConnection_handleFailureInMethod_object_file_lineNumber_description_:v27:a2:self:@"DTXConnection.m":1597:@"Invalid parameter not satisfying: %@", @"publishedProtocol != NULL"];

    if (v14) {
      goto LABEL_3;
    }
  }
  id v28 = [MEMORY[0x263F08690] currentHandler:v17 with:v18];
  [v28 _DTXConnection_DTXConnection_m_1598_Invalid_parameter_not_satisfying__publishedProtocolName_!=_nil_:a2:self];

LABEL_3:
  if ((v15 == 0) != (v16 == 0))
  {
    uint64_t v30 = [MEMORY[0x263F08690] _currentHandler:v17 with:v18];
    [v30 _DTXConnection_DTXConnection_m_1599_Invalid_parameter_not_satisfying__peerProtocol__peerProtocolName__nil_:a2];

    if (v19) {
      goto LABEL_5;
    }
LABEL_9:
    int v32 = [MEMORY[0x263F08690] currentHandler:v17 with:v18];
    [v32 _DTXConnection_DTXConnection_m_1600_Invalid_parameter_not_satisfying__handler__NULL_:a2];

    goto LABEL_5;
  }
  if (!v19) {
    goto LABEL_9;
  }
LABEL_5:
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF44BC8;
  block[3] = &unk_2648840E0;
  id v35 = v13;
  id v36 = v14;
  id v37 = v15;
  id v38 = v16;
  uint64_t v39 = self;
  id v40 = v19;
  id v21 = v19;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v13;
  dispatch_sync(handler_queue, block);
}

- (id)makeProxyChannelWithRemoteInterface:(id)a3 exportedInterface:(id)a4
{
  uint64_t v6 = (Protocol *)a3;
  char v7 = (Protocol *)a4;
  id v9 = NSStringFromProtocol(v6);
  if (v7)
  {
    uint64_t v10 = NSStringFromProtocol(v7);
    uint64_t v12 = [self _makeProxyChannelWithRemoteInterface:v11 remoteInterfaceName:v6 exportedInterface:v9 exportedInterfaceName:v7];
  }
  else
  {
    uint64_t v12 = [self _makeProxyChannelWithRemoteInterface:v8 remoteInterfaceName:v6 exportedInterface:v9 exportedInterfaceName:nil];
  }

  return v12;
}

- (id)_makeProxyChannelWithRemoteInterface:(id)a3 remoteInterfaceName:(id)a4 exportedInterface:(id)a5 exportedInterfaceName:(id)a6
{
  id v11 = a3;
  uint64_t v12 = (__CFString *)a4;
  id v13 = a5;
  id v16 = (__CFString *)a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    int v26 = [MEMORY[0x263F08690] currentHandler:v14 with:v15];
    [v26 _DTXConnection_DTXConnection_m_1628_Invalid_parameter_not_satisfying__remoteProtocol_NULL_:a2];

    if (v12) {
      goto LABEL_3;
    }
  }
  id v28 = [MEMORY[0x263F08690] currentHandler:v14 with:v15];
  [v28 _DTXConnection_DTXConnection_m_1629_Invalid_parameter_not_satisfying__remoteProtocolName__nil_:a2];

LABEL_3:
  if ((v13 == 0) != (v16 == 0))
  {
    uint64_t v30 = [MEMORY[0x263F08690] _currentHandler:v14 with:v15];
    [v30 _DTXConnection_DTXConnection_m_1630_Invalid_parameter_not_satisfying__exportedInterface__exportedInterfaceName__:a2 description:@"(exportedInterface == NULL) == (exportedInterfaceName == nil)"]
  }
  uint64_t v17 = @"*";
  if (v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = @"*";
  }
  if (v12) {
    uint64_t v17 = v12;
  }
  id v19 = [NSString stringWithFormat:@"%@:%@:%@", @"dtxproxy", v18, v17];
  id v21 = [self _makeChannelWithIdentifier:v20 identifier:v19];
  id v22 = [DTXProxyChannel alloc];
  id v24 = [v22 initWithChannel:v23 remoteProtocol:v11 localProtocol:v13];

  return v24;
}

+ (void)observeDecompressionExceptionLogging:(id)a3
{
  uint64_t v3 = MEMORY[0x230F36B10](a3, a2);
  uint64_t v4 = (void *)qword_2683E3578;
  qword_2683E3578 = v3;
}

- (id)_testing_remoteCapabilityVersions
{
  return self->_remoteCapabilityVersions;
}

- (void)overridePermittedBlockCompressors:(id)a3
{
}

- (void)replaceCompressorForCompression:(id)a3
{
}

- (void)replaceCompressorForDecompression:(id)a3
{
  incomingParser = self->_incomingParser;
  if (incomingParser) {
    MEMORY[0x270F9A6D0](incomingParser, sel_replaceCompressor_, a3);
  }
}

- (DTXChannel)defaultChannel
{
  return self->_defaultChannel;
}

@end