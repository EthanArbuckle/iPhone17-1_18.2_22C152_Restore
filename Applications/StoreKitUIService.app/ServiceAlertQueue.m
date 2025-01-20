@interface ServiceAlertQueue
+ (id)defaultQueue;
- (ServiceAlertQueue)init;
- (void)getNextAlertForClassName:(id)a3 completionBlock:(id)a4;
@end

@implementation ServiceAlertQueue

- (ServiceAlertQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)ServiceAlertQueue;
  v2 = [(ServiceAlertQueue *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)SSXPCConnection);
    v4 = (SSXPCConnection *)[v3 initWithServiceName:SSXPCPrivateServiceName];
    connection = v2->_connection;
    v2->_connection = v4;
  }
  return v2;
}

+ (id)defaultQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000294B4;
  block[3] = &unk_10004D5A8;
  block[4] = a1;
  if (qword_100067418 != -1) {
    dispatch_once(&qword_100067418, block);
  }
  v2 = (void *)qword_100067410;

  return v2;
}

- (void)getNextAlertForClassName:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)SSXPCCreateMessageDictionary();
  SSXPCDictionarySetCFObject();

  v9 = objc_alloc_init(ServiceAlertProxy);
  v10 = [(ServiceAlertProxy *)v9 receiverEndpoint];
  xpc_dictionary_set_value(v8, "2", v10);

  connection = self->_connection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100029618;
  v14[3] = &unk_10004DCF8;
  v15 = v9;
  id v16 = v6;
  id v12 = v6;
  v13 = v9;
  [(SSXPCConnection *)connection sendMessage:v8 withReply:v14];
}

- (void).cxx_destruct
{
}

@end