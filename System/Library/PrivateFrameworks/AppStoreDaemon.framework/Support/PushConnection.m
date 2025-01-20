@interface PushConnection
- (NSString)description;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
@end

@implementation PushConnection

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  v6 = sub_100369370([PushRawMessage alloc], v5);

  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v12 = 138543618;
    *(void *)&v12[4] = objc_opt_class();
    *(_WORD *)&v12[12] = 2114;
    *(void *)&v12[14] = v6;
    id v8 = *(id *)&v12[4];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received incoming message: %{public}@", v12, 0x16u);
  }
  if (v6)
  {
    uint64_t v9 = v6[1];
    if (v9 == 2)
    {
      uint64_t v10 = 56;
      goto LABEL_10;
    }
    if (v9 == 1)
    {
      uint64_t v10 = 48;
LABEL_10:
      sub_10026A314(*(uint64_t *)((char *)&self->super.isa + v10), v6);
      goto LABEL_11;
    }
  }
  if (self)
  {
LABEL_11:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    goto LABEL_12;
  }
  id WeakRetained = 0;
LABEL_12:
  objc_msgSend(WeakRetained, "pushConnection:didReceiveRawMessage:", self, v6, *(_OWORD *)v12, *(void *)&v12[16]);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v6 = (NSData *)a4;
  appStoreMessageHistory = self->_appStoreMessageHistory;
  if (appStoreMessageHistory) {
    objc_setProperty_atomic_copy(appStoreMessageHistory, v5, v6, 32);
  }
  id v8 = objc_alloc_init(_TtC9appstored6LogKey);
  currentToken = self->_currentToken;
  uint64_t v10 = ASDLogHandleForCategory();
  v11 = v10;
  if (currentToken && currentToken == v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = objc_opt_class();
      id v13 = v12;
      v14 = sub_10025C1EC(v6);
      environment = self->_environment;
      int v20 = 138544130;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v8;
      __int16 v24 = 2114;
      v25 = v14;
      __int16 v26 = 2114;
      v27 = environment;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Skipping re-registering of active token: %{public}@ for environment: %{public}@", (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      id v17 = v16;
      v18 = sub_10025C1EC(v6);
      v19 = self->_environment;
      int v20 = 138544130;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v8;
      __int16 v24 = 2114;
      v25 = v18;
      __int16 v26 = 2114;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%@] Received new public token: %{public}@ for environment: %{public}@", (uint8_t *)&v20, 0x2Au);
    }
    sub_100207940((uint64_t)self, 0, 0, self->_environment, 0, v8);
    sub_100207940((uint64_t)self, 0, 0, self->_environment, 1, v8);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_opt_class();
    id v12 = v11;
    id v13 = sub_10025C1EC(v8);
    environment = self->_environment;
    int v19 = 138544130;
    int v20 = v11;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    __int16 v26 = environment;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Received new token: %{public}@ for topic: %{public}@ environment: %{public}@", (uint8_t *)&v19, 0x2Au);
  }
  uint64_t v16 = sub_10036944C((uint64_t)PushRawMessage, v9);
  if (v16 == 2)
  {
    testFlightMessageHistory = self->_testFlightMessageHistory;
    if (testFlightMessageHistory) {
      objc_setProperty_atomic_copy(testFlightMessageHistory, v15, v8, 32);
    }
  }
  else if (!self)
  {
    id WeakRetained = 0;
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
LABEL_8:
  [WeakRetained pushConnection:self didReceiveToken:v8 forTopic:v16];
}

- (NSString)description
{
  environment = self->_environment;
  v3 = [(APSConnection *)self->_connection publicToken];
  v4 = sub_10025C2E4(v3);
  id v5 = +[NSString stringWithFormat:@"%@/%@", environment, v4];

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_testFlightMessageHistory, 0);
  objc_storeStrong((id *)&self->_appStoreMessageHistory, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end