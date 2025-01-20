@interface ADLocalRequestProvider
+ (id)sharedProvider;
- (ADLocalRequestProvider)init;
- (id)_bundle;
- (void)_getLocalRequestWithType:(int64_t)a3 bundle:(id)a4 languageCode:(id)a5 outputVoiceInfo:(id)a6 completion:(id)a7;
- (void)getLocalRequestWithType:(int64_t)a3 completion:(id)a4;
@end

@implementation ADLocalRequestProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_getLocalRequestWithType:(int64_t)a3 bundle:(id)a4 languageCode:(id)a5 outputVoiceInfo:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(id, id))a7;
  v15 = SiriCoreUUIDStringCreate();
  id v16 = objc_alloc_init((Class)SARequestCompleted);
  v17 = SiriCoreUUIDStringCreate();
  [v16 setAceId:v17];

  [v16 setRefId:v15];
  if (a3 != 1) {
    goto LABEL_6;
  }
  v18 = +[AFLocalization sharedInstance];
  id v19 = [v13 gender];
  uint64_t v20 = [v13 languageCode];
  v21 = (void *)v20;
  id v22 = v20 ? (id)v20 : v12;
  v32 = [v18 localizedStringForKey:@"ASSISTANT_SERVICES_LOCAL_MUSIC_SUBSCRIPTION_LEASE" gender:v19 table:0 bundle:v11 languageCode:v22];

  id v23 = objc_alloc_init((Class)SAResultCallback);
  v24 = SiriCoreUUIDStringCreate();
  [v23 setAceId:v24];

  [v23 setRefId:v15];
  id v36 = v16;
  v25 = +[NSArray arrayWithObjects:&v36 count:1];
  [v23 setCommands:v25];

  id v26 = v11;
  id v27 = objc_alloc_init((Class)SAUISayIt);
  v28 = SiriCoreUUIDStringCreate();
  [v27 setAceId:v28];

  [v27 setRefId:v15];
  [v27 setMessage:v32];
  id v35 = v23;
  v29 = +[NSArray arrayWithObjects:&v35 count:1];
  [v27 setCallbacks:v29];

  id v34 = v27;
  v30 = +[NSArray arrayWithObjects:&v34 count:1];

  id v11 = v26;
  if (!v30)
  {
LABEL_6:
    id v33 = v16;
    v30 = +[NSArray arrayWithObjects:&v33 count:1];
  }
  id v31 = objc_alloc_init((Class)SAStartLocalRequest);
  [v31 setAceId:v15];
  [v31 setClientBoundCommands:v30];
  v14[2](v14, v31);
}

- (id)_bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = self->_bundle;
    self->_bundle = v4;

    bundle = self->_bundle;
  }
  return bundle;
}

- (void)getLocalRequestWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001476E8;
  block[3] = &unk_10050C148;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (ADLocalRequestProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADLocalRequestProvider;
  v2 = [(ADLocalRequestProvider *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.local-request-provider", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)sharedProvider
{
  if (qword_100585CA8 != -1) {
    dispatch_once(&qword_100585CA8, &stru_100503788);
  }
  v2 = (void *)qword_100585CB0;
  return v2;
}

@end