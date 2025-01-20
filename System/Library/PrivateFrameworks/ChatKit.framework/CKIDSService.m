@interface CKIDSService
- (BOOL)sendFile:(id)a3 onService:(id)a4;
- (BOOL)sendProtobufData:(id)a3 type:(unint64_t)a4 service:(id)a5 fireAndForget:(BOOL)a6 includeInactiveDevices:(BOOL)a7;
- (CKIDSService)init;
- (IDSService)classAService;
- (IDSService)classCService;
- (IDSService)tinkerMessagesActivationService;
- (OS_dispatch_queue)queue;
- (void)setClassAService:(id)a3;
- (void)setClassCService:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTinkerMessagesActivationService:(id)a3;
@end

@implementation CKIDSService

- (CKIDSService)init
{
  v16.receiver = self;
  v16.super_class = (Class)CKIDSService;
  v2 = [(CKIDSService *)&v16 init];
  if (v2)
  {
    v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.quickboard.classa"];
    classAService = v2->_classAService;
    v2->_classAService = v3;

    v5 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.messages"];
    classCService = v2->_classCService;
    v2->_classCService = v5;

    v7 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.tinker.messages"];
    tinkerMessagesActivationService = v2->_tinkerMessagesActivationService;
    v2->_tinkerMessagesActivationService = v7;

    v9 = +[NSProcessInfo processInfo];
    v10 = [v9 processName];
    v11 = +[NSString stringWithFormat:@"%@ - IDS queue", v10];

    id v12 = v11;
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;
  }
  return v2;
}

- (BOOL)sendProtobufData:(id)a3 type:(unint64_t)a4 service:(id)a5 fireAndForget:(BOOL)a6 includeInactiveDevices:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  unsigned __int16 v10 = a4;
  id v11 = a3;
  id v43 = a5;
  id v42 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v11 type:v10 isResponse:0];
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_queue_t v13 = v12;
  if (v8) {
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
  }
  v14 = &IDSCopyIDForDevice_ptr;
  if (v7)
  {
    id v15 = v11;
    objc_super v16 = [v43 devices];
    id v17 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v16, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v18 = v16;
    v19 = (char *)[v18 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v19)
    {
      v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = (void *)IDSCopyIDForDevice();
          [v17 addObject:v23];
        }
        v20 = (char *)[v18 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v20);
    }

    id v11 = v15;
  }
  else
  {
    id v17 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v24 = v17;
  id v25 = [v24 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v25)
  {
    id v26 = v25;
    v39 = v13;
    id v40 = v11;
    id v27 = 0;
    id v28 = 0;
    uint64_t v29 = *(void *)v47;
    id obj = v24;
    while (2)
    {
      v30 = 0;
      v31 = v27;
      v32 = v28;
      do
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(obj);
        }
        v33 = v14;
        v34 = [v14[90] setWithObject:*(void *)(*((void *)&v46 + 1) + 8 * (void)v30)];
        id v44 = v32;
        id v45 = v31;
        unsigned int v35 = [v43 sendProtobuf:v42 toDestinations:v34 priority:200 options:0 identifier:&v45 error:&v44];
        id v27 = v45;

        id v28 = v44;
        if (!v35)
        {
          id v24 = obj;

          v37 = [v28 localizedDescription];
          NSLog(@"sendProtobufData failed - %@", v37);
          BOOL v36 = 0;
          goto LABEL_23;
        }
        v30 = (char *)v30 + 1;
        v31 = v27;
        v32 = v28;
        v14 = v33;
      }
      while (v26 != v30);
      id v24 = obj;
      id v26 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v26) {
        continue;
      }
      break;
    }
    BOOL v36 = 1;
    v37 = obj;
LABEL_23:
    dispatch_queue_t v13 = v39;
    id v11 = v40;
  }
  else
  {
    id v28 = 0;
    id v27 = 0;
    BOOL v36 = 1;
    v37 = v24;
  }

  return v36;
}

- (BOOL)sendFile:(id)a3 onService:(id)a4
{
  uint64_t v5 = IDSDefaultPairedDevice;
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = +[NSSet setWithObject:v5];
  id v14 = 0;
  id v15 = 0;
  unsigned __int8 v9 = [v6 sendResourceAtURL:v7 metadata:&__NSDictionary0__struct toDestinations:v8 priority:200 options:0 identifier:&v15 error:&v14];

  id v10 = v15;
  id v11 = v14;

  if ((v9 & 1) == 0 && _IMWillLog())
  {
    dispatch_queue_t v13 = [v11 localizedDescription];
    _IMAlwaysLog();
  }
  return v9;
}

- (IDSService)classAService
{
  return self->_classAService;
}

- (void)setClassAService:(id)a3
{
}

- (IDSService)classCService
{
  return self->_classCService;
}

- (void)setClassCService:(id)a3
{
}

- (IDSService)tinkerMessagesActivationService
{
  return self->_tinkerMessagesActivationService;
}

- (void)setTinkerMessagesActivationService:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tinkerMessagesActivationService, 0);
  objc_storeStrong((id *)&self->_classCService, 0);

  objc_storeStrong((id *)&self->_classAService, 0);
}

@end