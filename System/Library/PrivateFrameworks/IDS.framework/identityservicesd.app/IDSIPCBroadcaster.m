@interface IDSIPCBroadcaster
- (IDSIPCBroadcaster)init;
- (IDSNWBroadcaster)nwBroadcaster;
- (IMRemoteObjectBroadcaster)xpcBroadcaster;
- (id)broadcastProxyForTargets:(id)a3 messageContext:(id)a4 protocol:(id)a5;
- (void)setNwBroadcaster:(id)a3;
- (void)setXpcBroadcaster:(id)a3;
@end

@implementation IDSIPCBroadcaster

- (IDSIPCBroadcaster)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSIPCBroadcaster;
  v2 = [(IDSIPCBroadcaster *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[IMRemoteObjectBroadcaster defaultBroadcaster];
    xpcBroadcaster = v2->_xpcBroadcaster;
    v2->_xpcBroadcaster = (IMRemoteObjectBroadcaster *)v3;

    v5 = objc_alloc_init(IDSNWBroadcaster);
    nwBroadcaster = v2->_nwBroadcaster;
    v2->_nwBroadcaster = v5;
  }
  return v2;
}

- (id)broadcastProxyForTargets:(id)a3 messageContext:(id)a4 protocol:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v18 = [v17 type];
        if (v18 == (id)1)
        {
          v19 = [v17 remoteObject];
          v20 = v11;
        }
        else
        {
          if (v18) {
            continue;
          }
          v19 = [v17 remoteObject];
          v20 = v10;
        }
        [v20 addObject:v19];
      }
      id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  v21 = [IDSIPCBroadcastProxy alloc];
  v22 = [(IDSIPCBroadcaster *)self xpcBroadcaster];
  id v23 = [v10 copy];
  [v22 broadcastProxyForTargets:v23 messageContext:v9 protocol:v30];
  v24 = v29 = v9;
  v25 = [(IDSIPCBroadcaster *)self nwBroadcaster];
  v26 = [v25 broadcastProxyForTargets:v11];
  v27 = [(IDSIPCBroadcastProxy *)v21 initWithProtocol:v30 xpcProxy:v24 nwProxy:v26];

  return v27;
}

- (IMRemoteObjectBroadcaster)xpcBroadcaster
{
  return self->_xpcBroadcaster;
}

- (void)setXpcBroadcaster:(id)a3
{
}

- (IDSNWBroadcaster)nwBroadcaster
{
  return self->_nwBroadcaster;
}

- (void)setNwBroadcaster:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwBroadcaster, 0);

  objc_storeStrong((id *)&self->_xpcBroadcaster, 0);
}

@end