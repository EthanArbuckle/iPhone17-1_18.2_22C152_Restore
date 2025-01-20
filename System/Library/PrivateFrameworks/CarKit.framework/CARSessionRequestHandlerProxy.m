@interface CARSessionRequestHandlerProxy
- (CARSessionRequestHandling)requestHandler;
- (void)service_cancelRequestsWithReply:(id)a3;
- (void)service_prepareForRemovingWiFiUUID:(id)a3 reply:(id)a4;
- (void)service_startAdvertisingCarPlayControlForUSBWithReply:(id)a3;
- (void)service_startAdvertisingCarPlayControlForWiFiUUID:(id)a3 reply:(id)a4;
- (void)service_startSessionWithHost:(id)a3 requestIdentifier:(id)a4 reply:(id)a5;
- (void)service_stoppedSessionWithHostIdentifier:(id)a3 reply:(id)a4;
- (void)setRequestHandler:(id)a3;
@end

@implementation CARSessionRequestHandlerProxy

- (void)service_startSessionWithHost:(id)a3 requestIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = CarGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_INFO, "Received start session request for host %@, requestID: %@", (uint8_t *)&v17, 0x16u);
  }

  v12 = [(CARSessionRequestHandlerProxy *)self requestHandler];
  char v13 = objc_opt_respondsToSelector();

  v14 = [(CARSessionRequestHandlerProxy *)self requestHandler];
  v15 = v14;
  if (v13)
  {
    [v14 startSessionWithHost:v8 requestIdentifier:v9 completion:v10];
LABEL_7:

    goto LABEL_8;
  }
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v15 = [(CARSessionRequestHandlerProxy *)self requestHandler];
    [v15 startSessionWithHost:v8 completion:v10];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)service_stoppedSessionWithHostIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_INFO, "Received stop session request for host ID %@", (uint8_t *)&v12, 0xCu);
  }

  id v9 = [(CARSessionRequestHandlerProxy *)self requestHandler];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(CARSessionRequestHandlerProxy *)self requestHandler];
    [v11 stoppedSessionForHostIdentifier:v6];
  }
  v7[2](v7, 1, 0);
}

- (void)service_startAdvertisingCarPlayControlForWiFiUUID:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_INFO, "Received startAdvertisingCarPlayControl for Wi-Fi UUID: %@", (uint8_t *)&v12, 0xCu);
  }

  id v9 = [(CARSessionRequestHandlerProxy *)self requestHandler];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(CARSessionRequestHandlerProxy *)self requestHandler];
    [v11 startAdvertisingCarPlayControlForWiFiUUID:v6];
  }
  v7[2](v7, 1, 0);
}

- (void)service_startAdvertisingCarPlayControlForUSBWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Received startAdvertisingCarPlayControl for USB", v9, 2u);
  }

  id v6 = [(CARSessionRequestHandlerProxy *)self requestHandler];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CARSessionRequestHandlerProxy *)self requestHandler];
    [v8 startAdvertisingCarPlayControlForUSB];
  }
  v4[2](v4, 1, 0);
}

- (void)service_prepareForRemovingWiFiUUID:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_INFO, "Received prepareForRemovingWiFiUUID: %@", (uint8_t *)&v12, 0xCu);
  }

  id v9 = [(CARSessionRequestHandlerProxy *)self requestHandler];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(CARSessionRequestHandlerProxy *)self requestHandler];
    [v11 prepareForRemovingWiFiUUID:v6 completion:v7];
  }
}

- (void)service_cancelRequestsWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Received cancelRequests", v9, 2u);
  }

  id v6 = [(CARSessionRequestHandlerProxy *)self requestHandler];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CARSessionRequestHandlerProxy *)self requestHandler];
    [v8 cancelRequests];
  }
  v4[2](v4, 1, 0);
}

- (CARSessionRequestHandling)requestHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestHandler);
  return (CARSessionRequestHandling *)WeakRetained;
}

- (void)setRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end