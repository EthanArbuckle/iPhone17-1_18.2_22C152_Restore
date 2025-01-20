@interface IDSPeerIDQueryDataSource
- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasQueryResultsForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (IDSIDStatusQueryController)IDStatusQueryController;
- (IDSPeerIDManagerProtocol)peerIDManager;
- (IDSPeerIDQueryDataSource)initWithPeerIDManager:(id)a3;
- (IDSPeerIDQueryDataSource)initWithPeerIDManager:(id)a3 IDStatusQueryController:(id)a4;
- (void)setIDStatusQueryController:(id)a3;
- (void)setPeerIDManager:(id)a3;
@end

@implementation IDSPeerIDQueryDataSource

- (IDSPeerIDQueryDataSource)initWithPeerIDManager:(id)a3
{
  return [(IDSPeerIDQueryDataSource *)self initWithPeerIDManager:a3 IDStatusQueryController:0];
}

- (IDSPeerIDQueryDataSource)initWithPeerIDManager:(id)a3 IDStatusQueryController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IDSPeerIDQueryDataSource;
  v8 = [(IDSPeerIDQueryDataSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_peerIDManager, v6);
    objc_storeStrong((id *)&v9->_IDStatusQueryController, a4);
  }

  return v9;
}

- (IDSIDStatusQueryController)IDStatusQueryController
{
  IDStatusQueryController = self->_IDStatusQueryController;
  if (!IDStatusQueryController)
  {
    v4 = +[IDSIDStatusQueryController sharedInstance];
    v5 = self->_IDStatusQueryController;
    self->_IDStatusQueryController = v4;

    IDStatusQueryController = self->_IDStatusQueryController;
  }

  return IDStatusQueryController;
}

- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [(IDSPeerIDQueryDataSource *)self peerIDManager];
  unsigned __int8 v12 = [v11 hasPeerTokensForURI:v10 fromURI:v9 service:v8];

  return v12;
}

- (BOOL)hasQueryResultsForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(IDSPeerIDQueryDataSource *)self peerIDManager];
  unsigned __int8 v12 = [v11 hasPeerTokensForURI:v8 fromURI:v9 service:v10];

  if ((v12 & 1) == 0)
  {
    v14 = [(IDSPeerIDQueryDataSource *)self IDStatusQueryController];
    v15 = [v8 tokenFreeURI];
    unsigned int v16 = [v14 cachedIDStatusForID:v15 fromURI:v9 fromService:v10 respectExpiry:1];

    if (v16 != 2)
    {
      BOOL v13 = 0;
      goto LABEL_10;
    }
    v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v8 tokenFreeURI];
      *(_DWORD *)buf = 138413058;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      v26 = v18;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Already have cached invalid results {uri: %@, fromURI: %@, strippedURI: %@, service: %@}", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v20 = [v8 tokenFreeURI];
      _IDSLogV();
    }
  }
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (IDSPeerIDManagerProtocol)peerIDManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peerIDManager);

  return (IDSPeerIDManagerProtocol *)WeakRetained;
}

- (void)setPeerIDManager:(id)a3
{
}

- (void)setIDStatusQueryController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IDStatusQueryController, 0);

  objc_destroyWeak((id *)&self->_peerIDManager);
}

@end