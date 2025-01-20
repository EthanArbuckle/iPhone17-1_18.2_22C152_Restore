@interface GEOPeer
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isForServerIdentifier:(id)a3;
- (BOOL)isForServerType:(unint64_t)a3;
- (BOOL)isLocationd;
- (BOOL)preloading;
- (BOOL)preloadingExclusively;
- (GEOApplicationAuditToken)auditToken;
- (GEOPeer)initWithConnection:(id)a3 daemon:(id)a4;
- (GEOXPCConnection)connection;
- (NSString)bundleIdentifier;
- (NSString)debugIdentifier;
- (NSString)offlineCohortId;
- (NSString)peerID;
- (NSString)serverIdentifier;
- (id)description;
- (id)valueForEntitlement:(id)a3;
- (unint64_t)serverType;
- (void)_handleEvent:(id)a3;
- (void)_updateConnectionDebugIdentifier;
- (void)dealloc;
- (void)setDebugIdentifier:(id)a3;
- (void)setPreloading:(BOOL)a3;
- (void)setPreloadingExclusively:(BOOL)a3;
- (void)setServerIdentifier:(id)a3;
@end

@implementation GEOPeer

- (NSString)peerID
{
  return self->_peerID;
}

- (GEOXPCConnection)connection
{
  return self->_connection;
}

- (NSString)offlineCohortId
{
  v2 = [(GEOPeer *)self auditToken];
  v3 = [v2 offlineCohortId];

  return (NSString *)v3;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(GEOPeer *)self auditToken];
  v6 = [v5 valueForEntitlement:v4];

  return v6;
}

void __37__GEOPeer_initWithConnection_daemon___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleEvent:v3];
}

- (void)_handleEvent:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C1203C0]();
  uint64_t v6 = MEMORY[0x18C1213B0](v4);
  if (v6 != MEMORY[0x1E4F145A8])
  {
    uint64_t v7 = MEMORY[0x1E4F14590];
    if (v6 != MEMORY[0x1E4F14590])
    {
      v8 = (GEOPeer *)MEMORY[0x18C121170](v4);
      v9 = GEOGetGEODaemonLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        free(v8);
        goto LABEL_68;
      }
      *(_DWORD *)buf = 138412546;
      v91 = self;
      __int16 v92 = 2080;
      v93 = v8;
      v10 = "Unexpected message from peer %@: %s";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_5:
      _os_log_impl(&dword_188D96000, v11, v12, v10, buf, 0x16u);
      goto LABEL_6;
    }
    v22 = [(GEOPeer *)self serverIdentifier];
    uint64_t v23 = [v22 length];

    if (!v23)
    {
      string = xpc_dictionary_get_string(v4, "peer_server_identifier");
      v37 = xpc_dictionary_get_string(v4, "peer_debug_identifier");
      if (!string || !*string)
      {
        v8 = (GEOPeer *)MEMORY[0x18C121170](v4);
        v9 = GEOGetGEODaemonLog();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          goto LABEL_6;
        }
        *(_DWORD *)buf = 138412546;
        v91 = self;
        __int16 v92 = 2080;
        v93 = v8;
        v10 = "Peer %@ didn't say hello before sending: %s";
        v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_FAULT;
        goto LABEL_5;
      }
      v38 = v37;
      v39 = [NSString stringWithUTF8String:string];
      [(GEOPeer *)self setServerIdentifier:v39];

      if (v38)
      {
        v40 = [NSString stringWithUTF8String:v38];
        [(GEOPeer *)self setDebugIdentifier:v40];
      }
      id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_daemon);
      [WeakRetained peerDidConnect:self];
LABEL_67:

      goto LABEL_68;
    }
    id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_daemon);
    id v25 = v4;
    v26 = self;
    if (!WeakRetained)
    {
LABEL_66:

      goto LABEL_67;
    }
    if (MEMORY[0x18C1213B0](v25) != v7 || (v41 = xpc_dictionary_get_string(v25, "message")) == 0)
    {
      id v27 = 0;
      id v28 = 0;
      int v29 = 0;
      goto LABEL_53;
    }
    v42 = [NSString stringWithUTF8String:v41];
    v43 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
    uint64_t v44 = [v43 invertedSet];

    v45 = [v42 componentsSeparatedByString:@"."];
    v88 = (void *)v44;
    if ([v45 count] != 2) {
      goto LABEL_51;
    }
    v46 = [v45 objectAtIndexedSubscript:0];
    uint64_t v47 = [v46 rangeOfCharacterFromSet:v44];

    if (v47 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v48 = [v45 objectAtIndexedSubscript:0];
      uint64_t v49 = [v48 length];

      if (v49)
      {
        v50 = [v45 objectAtIndexedSubscript:1];
        uint64_t v51 = [v50 rangeOfCharacterFromSet:v88];

        if (v51 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v52 = [v45 objectAtIndexedSubscript:1];
          uint64_t v53 = [v52 length];

          if (v53)
          {
            id v27 = [v45 firstObject];
            id v28 = [v45 lastObject];
            int v29 = 1;
LABEL_52:

LABEL_53:
            v57 = (GEOPeer *)v27;
            v58 = (char *)v28;
            if (v29 && -[GEOPeer length](v57, "length") && [v58 length])
            {
              if ([(GEOPeer *)v26 isForServerIdentifier:v57])
              {
                v59 = [WeakRetained[1] objectForKey:v57];
                int v60 = objc_msgSend((id)objc_msgSend(v59, "serverClass"), "wantsPerMessageSignposts");
                int v61 = v60;
                v89 = v59;
                if (v60)
                {
                  int v84 = v60;
                  v62 = GEOGetGEODaemonLog();
                  os_signpost_id_t v63 = os_signpost_id_generate(v62);

                  v64 = GEOGetGEODaemonLog();
                  v65 = v64;
                  os_signpost_id_t spid = v63;
                  if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
                  {
                    v66 = [(GEOPeer *)v26 bundleIdentifier];
                    *(_DWORD *)buf = 138412802;
                    v91 = v66;
                    __int16 v92 = 2112;
                    v93 = v57;
                    __int16 v94 = 2112;
                    v95 = v58;
                    _os_signpost_emit_with_name_impl(&dword_188D96000, v65, OS_SIGNPOST_INTERVAL_BEGIN, v63, "HandleRequest", "type=message,peer=%@,message=%@.%@", buf, 0x20u);
                  }
                  v59 = v89;
                  int v61 = v84;
                }
                else
                {
                  os_signpost_id_t spid = -1;
                }
                v70 = GEOGetGEODaemonLog();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                {
                  v71 = [(GEOPeer *)v26 peerID];
                  *(_DWORD *)buf = 138543874;
                  v91 = v71;
                  __int16 v92 = 2114;
                  v93 = v57;
                  __int16 v94 = 2114;
                  v95 = v58;
                  _os_log_impl(&dword_188D96000, v70, OS_LOG_TYPE_DEBUG, "peerID %{public}@ sent messaageName %{public}@.%{public}@", buf, 0x20u);

                  v59 = v89;
                }

                if (v59)
                {
                  v72 = [v59 server];

                  if (!v72) {
                    [v59 startServerWithDaemon:WeakRetained];
                  }
                  uint64_t v73 = xpc_dictionary_get_value(v25, "progress_observer_endpoint");
                  v85 = (void *)v73;
                  if (v73)
                  {
                    v74 = objc_msgSend(MEMORY[0x1E4F28F90], "_geo_mirroredProgressFromReportingXPCEndpoint:totalUnitCount:", v73, 1);
                    [v74 becomeCurrentWithPendingUnitCount:1];
                  }
                  else
                  {
                    v74 = 0;
                  }
                  v78 = [v59 server];
                  char v79 = [v78 handleIncomingMessage:v58 withObject:v25 fromPeer:v26 signpostId:spid];

                  if ((v79 & 1) == 0)
                  {
                    v80 = (void *)MEMORY[0x18C121170](v25);
                    v81 = GEOGetGEODaemonLog();
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
                    {
                      NSStringFromSelector(sel_handleIncomingMessage_fromPeer_);
                      os_signpost_id_t spida = (os_signpost_id_t)v80;
                      v82 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v91 = v82;
                      __int16 v92 = 2080;
                      v93 = (GEOPeer *)spida;
                      _os_log_impl(&dword_188D96000, v81, OS_LOG_TYPE_FAULT, "%@: Unhandled message: %s", buf, 0x16u);

                      v80 = (void *)spida;
                    }

                    free(v80);
                  }
                  [v74 resignCurrent];

                  v59 = v89;
                }
                else
                {
                  if (v61)
                  {
                    v75 = GEOGetGEODaemonLog();
                    v76 = v75;
                    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                    {
                      v77 = [(GEOPeer *)v26 bundleIdentifier];
                      *(_DWORD *)buf = 138412802;
                      v91 = v77;
                      __int16 v92 = 2112;
                      v93 = v57;
                      __int16 v94 = 2112;
                      v95 = v58;
                      _os_signpost_emit_with_name_impl(&dword_188D96000, v76, OS_SIGNPOST_INTERVAL_END, spid, "HandleRequest", "type=message,peer=%@,message=%@.%@", buf, 0x20u);
                    }
                    v59 = v89;
                  }
                  v74 = GEOGetGEODaemonLog();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v91 = v57;
                    __int16 v92 = 2112;
                    v93 = (GEOPeer *)v58;
                    _os_log_impl(&dword_188D96000, v74, OS_LOG_TYPE_FAULT, "No handler is registered for message %@.%@", buf, 0x16u);
                  }
                }
              }
              else
              {
                v69 = GEOGetGEODaemonLog();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v91 = v57;
                  __int16 v92 = 2112;
                  v93 = v26;
                  _os_log_impl(&dword_188D96000, v69, OS_LOG_TYPE_FAULT, "Got message for server \"%@\" from peer not associated with it: %@", buf, 0x16u);
                }
              }
            }
            else
            {
              v67 = (GEOPeer *)MEMORY[0x18C121170](v25);
              v68 = GEOGetGEODaemonLog();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v91 = v26;
                __int16 v92 = 2080;
                v93 = v67;
                _os_log_impl(&dword_188D96000, v68, OS_LOG_TYPE_ERROR, "Received unparsable message from %@: %s", buf, 0x16u);
              }

              free(v67);
            }

            goto LABEL_66;
          }
          v54 = GEOGetGEODaemonLog();
          if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            goto LABEL_50;
          }
          v55 = [v45 firstObject];
          *(_DWORD *)buf = 138412290;
          v91 = v55;
          v56 = "Message name (%@) is empty. Ignoring.";
          goto LABEL_49;
        }
        v54 = GEOGetGEODaemonLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v55 = [v45 objectAtIndexedSubscript:1];
          *(_DWORD *)buf = 138412290;
          v91 = v55;
          v56 = "Message name (%@) contains invalid characters. Ignoring.";
          goto LABEL_49;
        }
LABEL_50:

LABEL_51:
        id v27 = 0;
        id v28 = 0;
        int v29 = 0;
        goto LABEL_52;
      }
      v54 = GEOGetGEODaemonLog();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      v55 = [v45 firstObject];
      *(_DWORD *)buf = 138412290;
      v91 = v55;
      v56 = "Service name (%@) is empty. Ignoring.";
    }
    else
    {
      v54 = GEOGetGEODaemonLog();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      v55 = [v45 firstObject];
      *(_DWORD *)buf = 138412290;
      v91 = v55;
      v56 = "Service name (%@) contains invalid characters. Ignoring.";
    }
LABEL_49:
    _os_log_impl(&dword_188D96000, v54, OS_LOG_TYPE_ERROR, v56, buf, 0xCu);

    goto LABEL_50;
  }
  v13 = GEOGetGEODaemonLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  v15 = GEOGetGEODaemonLog();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = [(GEOPeer *)self bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v91 = v17;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "HandleRequest", "type=error,peer=%@", buf, 0xCu);
  }
  if (v4 == (id)MEMORY[0x1E4F14520] || v4 == (id)MEMORY[0x1E4F14528])
  {
    v30 = GEOGetGEODaemonLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
      *(_DWORD *)buf = 138412546;
      v91 = self;
      __int16 v92 = 2080;
      v93 = (GEOPeer *)v31;
      _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_DEBUG, "Lost connection with peer %@: %s.", buf, 0x16u);
    }

    v19 = objc_loadWeakRetained((id *)&self->_daemon);
    [v19 peerDidDisconnect:self];
    v21 = "interrupted";
  }
  else
  {
    id v18 = (id)MEMORY[0x1E4F14550];
    v19 = GEOGetGEODaemonLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (v4 != v18)
    {
      if (v20)
      {
        v83 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
        *(_DWORD *)buf = 138412546;
        v91 = self;
        __int16 v92 = 2080;
        v93 = (GEOPeer *)v83;
        _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "Unexpected connection error for peer %@: %s", buf, 0x16u);
      }

      abort();
    }
    if (v20)
    {
      *(_DWORD *)buf = 138412290;
      v91 = self;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "Termination imminent for peer %@", buf, 0xCu);
    }
    v21 = "terminating";
  }

  v32 = GEOGetGEODaemonLog();
  v33 = v32;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    v34 = [(GEOPeer *)self bundleIdentifier];
    v35 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
    *(_DWORD *)buf = 138412802;
    v91 = v34;
    __int16 v92 = 2080;
    v93 = (GEOPeer *)v21;
    __int16 v94 = 2080;
    v95 = v35;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v33, OS_SIGNPOST_INTERVAL_END, v14, "HandleRequest", "type=error,peer=%@,errorType=%s,message=%s", buf, 0x20u);
  }
LABEL_68:
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (NSString)bundleIdentifier
{
  v2 = [(GEOPeer *)self auditToken];
  id v3 = [v2 bundleId];

  return (NSString *)v3;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)_updateConnectionDebugIdentifier
{
  if (self->_serverIdentifier && self->_debugIdentifier)
  {
    id v3 = NSString;
    id v9 = [(GEOPeer *)self bundleIdentifier];
    [v3 stringWithFormat:@"%@:%@:%@", v9, self->_serverIdentifier, self->_debugIdentifier];
  }
  else
  {
    id v4 = NSString;
    uint64_t v5 = [(GEOPeer *)self bundleIdentifier];
    serverIdentifier = self->_serverIdentifier;
    if (!serverIdentifier) {
      serverIdentifier = self->_debugIdentifier;
    }
    id v9 = (id)v5;
    [v4 stringWithFormat:@"%@:%@", v5, serverIdentifier, v8];
  uint64_t v7 = };
  [(GEOXPCConnection *)self->_connection setDebugIdentifier:v7];
}

- (void)setServerIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  serverIdentifier = self->_serverIdentifier;
  self->_serverIdentifier = v4;

  self->_serverType = GEOXPCServerTypeForIdentifier();

  [(GEOPeer *)self _updateConnectionDebugIdentifier];
}

- (void)setDebugIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  debugIdentifier = self->_debugIdentifier;
  self->_debugIdentifier = v4;

  [(GEOPeer *)self _updateConnectionDebugIdentifier];
}

- (BOOL)isForServerType:(unint64_t)a3
{
  return ![(GEOPeer *)self serverType] || [(GEOPeer *)self serverType] == a3;
}

- (unint64_t)serverType
{
  return self->_serverType;
}

- (BOOL)isForServerIdentifier:(id)a3
{
  uint64_t v4 = GEOXPCServerTypeForIdentifier();

  return [(GEOPeer *)self isForServerType:v4];
}

- (BOOL)preloading
{
  return self->_preloading;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GEOPeer *)self auditToken];
  char v6 = [v5 hasEntitlement:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_preloadingTransaction, 0);
  objc_storeStrong((id *)&self->_peerTransaction, 0);
  objc_storeStrong((id *)&self->_entitlementValueCache, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

- (void)dealloc
{
  [(GEOXPCConnection *)self->_connection close];
  v3.receiver = self;
  v3.super_class = (Class)GEOPeer;
  [(GEOPeer *)&v3 dealloc];
}

- (GEOPeer)initWithConnection:(id)a3 daemon:(id)a4
{
  char v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)GEOPeer;
  uint64_t v8 = [(GEOPeer *)&v30 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_daemon, v7);
    v10 = [[GEOApplicationAuditToken alloc] initWithXPCConnection:v6];
    auditToken = v9->_auditToken;
    v9->_auditToken = v10;

    os_log_type_t v12 = [GEOXPCConnection alloc];
    v13 = [(GEOPeer *)v9 bundleIdentifier];
    uint64_t v14 = [(GEOXPCConnection *)v12 initWithClientConnection:v6 debugIdentifier:v13];
    connection = v9->_connection;
    v9->_connection = (GEOXPCConnection *)v14;

    unint64_t v16 = atomic_fetch_add_explicit(&initWithConnection_daemon___peerCounter, 1uLL, memory_order_relaxed) + 1;
    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%qd", v16);
    peerID = v9->_peerID;
    v9->_peerID = (NSString *)v17;

    if (GEOConfigGetBOOL(GeoServicesConfig_TransactionsForPeers, (uint64_t)off_1E9113E08))
    {
      id v19 = [(GEOPeer *)v9 bundleIdentifier];
      unint64_t v25 = v16;
      uint64_t v26 = [v19 UTF8String];
      uint64_t v20 = _GEOCreateTransaction();
      peerTransaction = v9->_peerTransaction;
      v9->_peerTransaction = v20;
    }
    v22 = objc_msgSend(v7, "serverQueue", v25, v26);
    xpc_connection_set_target_queue(v6, v22);

    objc_initWeak(&location, v9);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37__GEOPeer_initWithConnection_daemon___block_invoke;
    handler[3] = &unk_1E53DF960;
    objc_copyWeak(&v28, &location);
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(v6);
    uint64_t v23 = v9;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v12.receiver = self;
  v12.super_class = (Class)GEOPeer;
  id v4 = [(GEOPeer *)&v12 description];
  uint64_t v5 = [(GEOPeer *)self peerID];
  char v6 = [(GEOPeer *)self bundleIdentifier];
  id v7 = [(GEOPeer *)self serverIdentifier];
  uint64_t v8 = [(GEOPeer *)self debugIdentifier];
  id v9 = [v3 stringWithFormat:@"%@{peerId: %@ bundleId: %@ serverId: %@ debugId: %@", v4, v5, v6, v7, v8];

  v10 = [(GEOPeer *)self offlineCohortId];
  [v9 appendFormat:@" offlineCohortId: %@", v10];

  objc_msgSend(v9, "appendFormat:", @" connection: %p}", self->_connection);

  return v9;
}

- (BOOL)isLocationd
{
  v2 = [(GEOPeer *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"locationd"];

  return v3;
}

- (void)setPreloading:(BOOL)a3
{
  if (self->_preloading != a3)
  {
    self->_preloading = a3;
    if (GEOConfigGetBOOL(GeoServicesConfig_TransactionsForPreloaders, (uint64_t)off_1E9113E18))
    {
      if (self->_preloading)
      {
        id v7 = [(GEOPeer *)self peerID];
        [v7 UTF8String];
        id v4 = _GEOCreateTransaction();
        preloadingTransaction = self->_preloadingTransaction;
        self->_preloadingTransaction = v4;

        char v6 = v7;
      }
      else
      {
        char v6 = self->_preloadingTransaction;
        self->_preloadingTransaction = 0;
      }
    }
  }
}

- (BOOL)preloadingExclusively
{
  return self->_preloadingExclusively;
}

- (void)setPreloadingExclusively:(BOOL)a3
{
  self->_preloadingExclusively = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

@end