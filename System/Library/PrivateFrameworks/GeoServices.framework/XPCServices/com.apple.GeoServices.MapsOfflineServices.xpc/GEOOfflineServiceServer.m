@interface GEOOfflineServiceServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)cancelWithRequest:(id)a3;
- (void)requestWithRequest:(id)a3;
@end

@implementation GEOOfflineServiceServer

+ (id)identifier
{
  return @"offlineserver";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  v14 = [v13 UTF8String];
  LOBYTE(v15) = *v14;
  if (*v14)
  {
    unint64_t v16 = 0;
    int v17 = 0;
    do
    {
      v17 += (char)v15;
      if (v16 > 0x30) {
        break;
      }
      int v15 = v14[++v16];
    }
    while (v15);
    if (v17 == 614)
    {
      uint64_t v22 = objc_opt_class();
      v23 = sub_100004AD0(v13, v11, v22, v12);
      v20 = v23;
      if (v23)
      {
        [v23 setSignpostId:a6];
        [(GEOOfflineServiceServer *)self cancelWithRequest:v20];
        goto LABEL_12;
      }
LABEL_15:
      BOOL v21 = 0;
      goto LABEL_13;
    }
    if (v17 == 777)
    {
      uint64_t v18 = objc_opt_class();
      v19 = sub_100004AD0(v13, v11, v18, v12);
      v20 = v19;
      if (v19)
      {
        [v19 setSignpostId:a6];
        [(GEOOfflineServiceServer *)self requestWithRequest:v20];
LABEL_12:
        BOOL v21 = 1;
LABEL_13:

        goto LABEL_14;
      }
      goto LABEL_15;
    }
  }
  BOOL v21 = 0;
LABEL_14:

  return v21;
}

- (void)requestWithRequest:(id)a3
{
  id v4 = a3;
  if (self->_offlineService)
  {
    id v5 = [objc_alloc((Class)GEOOfflineServiceReply) initWithRequest:v4];
    offlineService = self->_offlineService;
    v7 = [v4 request];
    v8 = [v4 requestMetadata];
    qos_class_self();
    global_queue = (void *)geo_get_global_queue();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004E24;
    v11[3] = &unk_1000081E8;
    id v12 = v5;
    id v10 = v5;
    [(MapsOfflineServiceV1 *)offlineService processRequest:v7 requestMetaData:v8 queue:global_queue response:v11];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _offlineService != ((void *)0)", buf, 2u);
  }
}

- (void)cancelWithRequest:(id)a3
{
  id v4 = a3;
  if (!self->_offlineService && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _offlineService != ((void *)0)", v5, 2u);
  }
}

- (void).cxx_destruct
{
}

@end