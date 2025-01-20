@interface IDSRapportDeliveryController
+ (id)sharedInstance;
- (IDSRapportDeliveryController)init;
- (IDSRapportDeliveryController)initWithRapportClient:(id)a3;
- (IDSRapportDeliveryControllerDelegate)delegate;
- (IDSRapportDeliveryControllerRapportClient)rapportClient;
- (unsigned)_nextMessageID;
- (void)dealloc;
- (void)rapportClient:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5;
- (void)sendMessage:(id)a3 messageID:(id)a4 topic:(id)a5 command:(id)a6 destinationIDs:(id)a7 completionBlock:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setRapportClient:(id)a3;
@end

@implementation IDSRapportDeliveryController

+ (id)sharedInstance
{
  if (qword_100A4A698 != -1) {
    dispatch_once(&qword_100A4A698, &stru_100982878);
  }
  v2 = (void *)qword_100A4A6A0;

  return v2;
}

- (IDSRapportDeliveryController)initWithRapportClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSRapportDeliveryController;
  v6 = [(IDSRapportDeliveryController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_messageID = 0;
    objc_storeStrong((id *)&v6->_rapportClient, a3);
    [(IDSRapportClient *)v7->_rapportClient addDelegate:v7];
  }

  return v7;
}

- (IDSRapportDeliveryController)init
{
  v3 = +[IDSRapportClient sharedInstance];
  v4 = [(IDSRapportDeliveryController *)self initWithRapportClient:v3];

  return v4;
}

- (void)dealloc
{
  [(IDSRapportClient *)self->_rapportClient removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)IDSRapportDeliveryController;
  [(IDSRapportDeliveryController *)&v3 dealloc];
}

- (void)sendMessage:(id)a3 messageID:(id)a4 topic:(id)a5 command:(id)a6 destinationIDs:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = +[IDSFoundationLog bonjourDeliveryController];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
    *(_DWORD *)buf = 138544130;
    id v56 = v15;
    __int16 v57 = 2114;
    id v58 = v16;
    __int16 v59 = 2114;
    v60 = v21;
    __int16 v61 = 2114;
    id v62 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Bonjour request to send local message {guid: %{public}@, topic: %{public}@, deviceIDs.count: %{public}@ command: %{public}@}", buf, 0x2Au);
  }
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1001112BC;
  v53[3] = &unk_1009828A0;
  id v54 = v19;
  id v38 = v19;
  v22 = objc_retainBlock(v53);
  v23 = +[NSSet setWithArray:v18];
  [v23 allObjects];
  v24 = v37 = v18;

  id v25 = objc_alloc((Class)CUTAsyncReducer);
  id v26 = objc_alloc_init((Class)NSMutableArray);
  id v27 = [v25 initWithInput:v24 initialValue:v26];

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1001112D4;
  v46[3] = &unk_1009828C8;
  id v28 = v15;
  id v47 = v28;
  id v29 = v16;
  id v48 = v29;
  id v49 = v17;
  id v50 = v14;
  v51 = self;
  v30 = v22;
  id v52 = v30;
  id v31 = v14;
  id v32 = v17;
  [v27 setReducerBlock:v46];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001116F8;
  v40[3] = &unk_1009828F0;
  v40[4] = self;
  id v41 = v28;
  id v42 = v29;
  id v43 = v24;
  id v44 = v30;
  SEL v45 = a2;
  v33 = v30;
  id v34 = v24;
  id v35 = v29;
  id v36 = v28;
  [v27 reduceWithCompletion:v40];
}

- (unsigned)_nextMessageID
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_messageID, 1u);
}

- (void)rapportClient:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  objc_super v9 = [v8 objectForKeyedSubscript:@"id"];
  v10 = [v8 objectForKeyedSubscript:@"t"];
  v11 = [v8 objectForKeyedSubscript:@"c"];
  v12 = [v8 objectForKeyedSubscript:@"p"];

  v13 = +[IDSFoundationLog bonjourDeliveryController];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138544131;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2113;
    id v20 = v7;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Bonjour received message {guid: %{public}@, topic: %{public}@, deviceID: %{private}@, command: %{public}@}", (uint8_t *)&v15, 0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deliveryController:self didReceiveMessage:v12 topic:v10 command:v11 deviceID:v7 messageID:v9];
}

- (IDSRapportDeliveryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSRapportDeliveryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSRapportDeliveryControllerRapportClient)rapportClient
{
  return (IDSRapportDeliveryControllerRapportClient *)self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportClient, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end