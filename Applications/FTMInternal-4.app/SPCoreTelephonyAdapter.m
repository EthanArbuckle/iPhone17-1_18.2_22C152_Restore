@interface SPCoreTelephonyAdapter
- (CoreTelephonyClient)client;
- (SPCoreTelephonyAdapter)init;
- (SPCoreTelephonyAdapterDelegate)delegate;
- (dispatch_queue_s)get_queue;
- (id)getPDPInfo;
- (id)getTrafficDescriptors;
- (id)setApplicationCategory:(id)a3;
- (void)nrSliceAppStateChanged:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5;
- (void)nrSlicedRunningAppStateChanged:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateDelegate:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5;
@end

@implementation SPCoreTelephonyAdapter

- (SPCoreTelephonyAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPCoreTelephonyAdapter;
  v2 = [(SPCoreTelephonyAdapter *)&v6 init];
  if (v2)
  {
    v3 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:[self get_queue]];
    client = v2->_client;
    v2->_client = v3;
  }
  return v2;
}

- (dispatch_queue_s)get_queue
{
  if (qword_1002DC390 != -1) {
    dispatch_once(&qword_1002DC390, &stru_100287510);
  }
  return (dispatch_queue_s *)qword_1002DC398;
}

- (id)setApplicationCategory:(id)a3
{
  id v4 = a3;
  v5 = qword_1002E3100;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "settings application category to %@", (uint8_t *)&v10, 0xCu);
  }
  objc_super v6 = [(SPCoreTelephonyAdapter *)self client];
  v7 = [v6 setApplicationCategory:v4];

  if (v7)
  {
    v8 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR)) {
      sub_10020D270((uint64_t)v4, (uint64_t)v7, v8);
    }
  }

  return v7;
}

- (void)updateDelegate:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(SPCoreTelephonyAdapter *)self delegate];
  if (v10)
  {
    id v11 = (void *)v10;
    v12 = [(SPCoreTelephonyAdapter *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      +[SPSlicingDescriptor _coreTelephonyContainer:v9];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100081C88;
      v15[3] = &unk_100287538;
      v15[4] = self;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = v8;
      BOOL v18 = a4;
      id v14 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    }
  }
}

- (id)getTrafficDescriptors
{
  v2 = [(SPCoreTelephonyAdapter *)self client];
  id v9 = 0;
  v3 = [v2 getSliceTrafficDescriptors:&v9];
  id v4 = v9;

  if (v4)
  {
    v5 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_ERROR)) {
      sub_10020D2F8((uint64_t)v4, v5);
    }
    objc_super v6 = 0;
  }
  else
  {
    v7 = [v3 trafficDescriptors];
    objc_super v6 = +[SPSlicingDescriptor _coreTelephonyDescritorList:v7];
  }

  return v6;
}

- (id)getPDPInfo
{
  v3 = [(SPCoreTelephonyAdapter *)self client];
  id v18 = 0;
  id v4 = [v3 getCurrentDataSubscriptionContextSync:&v18];
  id v5 = v18;

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v8 = &stru_100296A58;
  }
  else
  {
    id v5 = 0;
    uint64_t v7 = 28;
    id v8 = &stru_100296A58;
    while (1)
    {
      id v9 = v5;
      uint64_t v10 = [(SPCoreTelephonyAdapter *)self client];
      id v17 = v5;
      id v11 = [v10 getConnectionState:v4 connectionType:v7 error:&v17];
      id v5 = v17;

      if (v11)
      {
        if (!v5)
        {
          uint64_t v12 = [v11 interfaceName];
          if (v12)
          {
            char v13 = (void *)v12;
            id v14 = [v11 interfaceName];
            unsigned int v15 = [v14 isEqualToString:&stru_100296A58];

            if (!v15) {
              break;
            }
          }
        }
      }

      uint64_t v7 = (v7 + 1);
      if (v7 == 36) {
        goto LABEL_14;
      }
    }
    id v8 = [v11 interfaceName];
    id v5 = v11;
  }
LABEL_14:

  return v8;
}

- (void)nrSliceAppStateChanged:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = qword_1002E3100;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"false";
    *(_DWORD *)buf = 138412802;
    id v23 = v8;
    __int16 v24 = 2112;
    if (v6) {
      CFStringRef v11 = @"true";
    }
    CFStringRef v25 = v11;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Slicing AppId=%@ state changed status=%@ %@", buf, 0x20u);
  }
  uint64_t v12 = [(SPCoreTelephonyAdapter *)self delegate];
  if (v12
    && (char v13 = (void *)v12,
        [(SPCoreTelephonyAdapter *)self delegate],
        id v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_opt_respondsToSelector(),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    objc_initWeak((id *)buf, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008215C;
    v17[3] = &unk_100287560;
    objc_copyWeak(&v20, (id *)buf);
    id v18 = v8;
    BOOL v21 = v6;
    id v19 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v16 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "there is not delegate set. Ignoring callback", buf, 2u);
    }
  }
}

- (void)nrSlicedRunningAppStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = qword_1002E3100;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Slicing App state changed %@", buf, 0xCu);
  }
  BOOL v6 = +[SPSlicingApplicationContainer _coreTelephonyAppInfoContainer:v4];
  uint64_t v7 = [(SPCoreTelephonyAdapter *)self delegate];
  if (v7
    && (id v8 = (void *)v7,
        [(SPCoreTelephonyAdapter *)self delegate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    objc_initWeak((id *)buf, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000823A4;
    v12[3] = &unk_100287588;
    objc_copyWeak(&v14, (id *)buf);
    id v13 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    CFStringRef v11 = qword_1002E3100;
    if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "there is not delegate set. Ignoring callback", buf, 2u);
    }
  }
}

- (SPCoreTelephonyAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SPCoreTelephonyAdapterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end