@interface IDSTransportLevelAgentClientInfo
- (IDSGroupSessionConnectionParameters)multiplexerParams;
- (IDSTransportLevelAgentClientInfo)initWithAgentClient:(id)a3 assign:(id)a4 parameters:(id)a5;
- (IDSTransportLevelAgentClientInfo)initWithClientUUID:(id)a3;
- (NSUUID)clientUUID;
- (OS_nw_connection)simConnection;
- (OS_nw_endpoint)endpoint;
- (OS_nw_endpoint)listeningEndpoint;
- (OS_nw_endpoint)localEndpoint;
- (OS_nw_parameters)pathParams;
- (OS_nw_path)path;
- (id)assign;
- (id)description;
- (void)setEndpoint:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setMultiplexerParams:(id)a3;
- (void)setPath:(id)a3;
- (void)setSimConnection:(id)a3;
@end

@implementation IDSTransportLevelAgentClientInfo

- (IDSTransportLevelAgentClientInfo)initWithClientUUID:(id)a3
{
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IDSTransportLevelAgentClientInfo;
  v6 = [(IDSTransportLevelAgentClientInfo *)&v25 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v6->_clientUUID, a3);
  v28[0] = 0xAAAAAAAAAAAAAAAALL;
  v28[1] = 0xAAAAAAAAAAAAAAAALL;
  [v5 getUUIDBytes:v28];
  v8 = nw_path_copy_path_for_client();
  if (!v8)
  {
    v9 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "nw_path_copy_path_for_client failed for client %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  v9 = v8;
  objc_storeStrong((id *)&v7->_path, v8);
  v10 = (void *)nw_path_copy_parameters();
  account_id = (unsigned char *)nw_parameters_get_account_id();
  if (account_id)
  {
    v12 = account_id;
    if (*account_id)
    {
      id v13 = objc_alloc((Class)IDSGroupSessionConnectionParameters);
      v14 = +[NSString stringWithUTF8String:v12];
      v15 = (IDSGroupSessionConnectionParameters *)[v13 initWithStringRepresentation:v14];
      multiplexerParams = v7->_multiplexerParams;
      v7->_multiplexerParams = v15;

      v17 = nw_path_copy_endpoint();
      if (v17)
      {
        v18 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "client endpoint %@", buf, 0xCu);
        }

        v19 = v17;
        endpoint = v7->_endpoint;
        v7->_endpoint = v19;
      }
      else
      {
        nw_endpoint_t v23 = nw_path_copy_effective_local_endpoint(v9);
        endpoint = v7->_listeningEndpoint;
        v7->_listeningEndpoint = (OS_nw_endpoint *)v23;
      }

LABEL_16:
LABEL_17:
      v22 = v7;
      goto LABEL_18;
    }
  }
  v21 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "new client path [%@] missing account_id to specify multiplexer", buf, 0xCu);
  }

  v22 = 0;
LABEL_18:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simConnection, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong(&self->_assign, 0);
  objc_storeStrong((id *)&self->_multiplexerParams, 0);
  objc_storeStrong((id *)&self->_listeningEndpoint, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_pathParams, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_clientUUID, 0);
}

- (IDSTransportLevelAgentClientInfo)initWithAgentClient:(id)a3 assign:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IDSTransportLevelAgentClientInfo;
  v11 = [(IDSTransportLevelAgentClientInfo *)&v23 init];
  if (v11)
  {
    id v12 = objc_retainBlock(v9);
    id assign = v11->_assign;
    v11->_id assign = v12;

    uint64_t v14 = +[NSUUID UUID];
    clientUUID = v11->_clientUUID;
    v11->_clientUUID = (NSUUID *)v14;

    uint64_t v16 = nw_agent_client_copy_path();
    path = v11->_path;
    v11->_path = (OS_nw_path *)v16;

    v18 = (IDSGroupSessionConnectionParameters *)[objc_alloc((Class)IDSGroupSessionConnectionParameters) initWithStringRepresentation:v10];
    multiplexerParams = v11->_multiplexerParams;
    v11->_multiplexerParams = v18;

    uint64_t v20 = nw_agent_client_copy_endpoint();
    endpoint = v11->_endpoint;
    v11->_endpoint = (OS_nw_endpoint *)v20;
  }
  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:@"IDSTAClientInfo uuid %@ params %@ endpoint %@ listeningEndpoint %@ path [%@]", self->_clientUUID, self->_multiplexerParams, self->_endpoint, self->_listeningEndpoint, self->_path];
}

- (void)setPath:(id)a3
{
}

- (void)setMultiplexerParams:(id)a3
{
}

- (NSUUID)clientUUID
{
  return self->_clientUUID;
}

- (OS_nw_path)path
{
  return self->_path;
}

- (OS_nw_parameters)pathParams
{
  return self->_pathParams;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (OS_nw_endpoint)listeningEndpoint
{
  return self->_listeningEndpoint;
}

- (IDSGroupSessionConnectionParameters)multiplexerParams
{
  return self->_multiplexerParams;
}

- (id)assign
{
  return self->_assign;
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (OS_nw_connection)simConnection
{
  return self->_simConnection;
}

- (void)setSimConnection:(id)a3
{
}

@end