@interface DEDSharingInbound
- (DEDController)delegate;
- (DEDSharingConnection)connection;
- (DEDSharingInbound)init;
- (DEDSharingInbound)initWithController:(id)a3 sharingConnection:(id)a4;
- (OS_os_log)log;
- (void)handleObject:(id)a3 forSFSession:(id)a4;
- (void)handleObject:(id)a3 forSFSession:(id)a4 forBugSession:(id)a5 callingDevice:(id)a6;
- (void)handleRequest:(id)a3 forSFSession:(id)a4 completion:(id)a5;
- (void)init;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation DEDSharingInbound

- (DEDSharingInbound)init
{
  v8.receiver = self;
  v8.super_class = (Class)DEDSharingInbound;
  v2 = [(DEDSharingInbound *)&v8 init];
  if (v2)
  {
    v3 = +[DEDConfiguration sharedInstance];
    os_log_t v4 = os_log_create((const char *)[v3 loggingSubsystem], "sharing-inbound");
    log = v2->_log;
    v2->_log = (OS_os_log *)v4;

    v6 = [(DEDSharingInbound *)v2 log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingInbound init](v6);
    }
  }
  return v2;
}

- (DEDSharingInbound)initWithController:(id)a3 sharingConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = objc_alloc_init(DEDSharingInbound);

  if (v8)
  {
    [(DEDSharingInbound *)v8 setDelegate:v6];
    [(DEDSharingInbound *)v8 setConnection:v7];
  }

  return v8;
}

- (void)handleObject:(id)a3 forSFSession:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(DEDSharingInbound *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingInbound handleObject:forSFSession:].cold.7();
  }

  v9 = [v6 objectForKeyedSubscript:@"setup"];
  int v10 = [v9 isEqualToString:@"ready_check"];

  if (v10)
  {
    v11 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v6 objectForKeyedSubscript:@"myIdentifier"];
      *(_DWORD *)buf = 138412290;
      v62 = v12;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "received ready_check setup command with identifier [%@]", buf, 0xCu);
    }
    v13 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingInbound handleObject:forSFSession:]();
    }

    v14 = +[DEDDevice currentDeviceWithDaemonInfo];
    v60[0] = @"ready_device";
    v15 = objc_msgSend(v6, "objectForKeyedSubscript:", @"yourIdentifier", @"setup", @"myIdentifier");
    v60[1] = v15;
    v59[2] = @"device";
    v16 = [v14 serialize];
    v60[2] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:3];

    [v7 sendWithFlags:0 object:v17];
  }
  v18 = [v6 objectForKeyedSubscript:@"setup"];
  int v19 = [v18 isEqualToString:@"ready_device"];

  if (v19)
  {
    v20 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v6 objectForKeyedSubscript:@"myIdentifier"];
      *(_DWORD *)buf = 138412290;
      v62 = v21;
      _os_log_impl(&dword_21FE04000, v20, OS_LOG_TYPE_DEFAULT, "received ready_device setup command with identifier [%@]", buf, 0xCu);
    }
    v22 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingInbound handleObject:forSFSession:]();
    }

    v23 = [v6 objectForKeyedSubscript:@"device"];
    v24 = +[DEDDevice deviceWithDictionary:v23];

    v25 = [v6 objectForKeyedSubscript:@"myIdentifier"];
    [v24 setAddress:v25];

    [v24 setTransport:3];
    [v24 setRemoteTransport:3];
    v26 = [v7 peerDevice];
    [v24 setSfDevice:v26];

    v27 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingInbound handleObject:forSFSession:].cold.4(v24, v27);
    }

    v28 = [(DEDSharingInbound *)self connection];
    objc_msgSend(v28, "updateControllerWithDevice:andStatus:", v24, objc_msgSend(v24, "status"));
  }
  v29 = [v6 objectForKeyedSubscript:@"setup"];
  int v30 = [v29 isEqualToString:@"start_session"];

  if (v30)
  {
    v31 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [v6 objectForKeyedSubscript:@"myIdentifier"];
      *(_DWORD *)buf = 138412290;
      v62 = v32;
      _os_log_impl(&dword_21FE04000, v31, OS_LOG_TYPE_DEFAULT, "received start_session setup command with identifier [%@]", buf, 0xCu);
    }
    v33 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingInbound handleObject:forSFSession:]();
    }

    v34 = [v6 objectForKeyedSubscript:@"sessionID"];
    v35 = [v6 objectForKeyedSubscript:@"config"];
    v36 = +[DEDBugSessionConfiguration secureUnarchiveWithData:v35];

    v37 = [v6 objectForKeyedSubscript:@"callingDevice"];
    v38 = +[DEDDevice deviceWithDictionary:v37];

    v39 = [v6 objectForKeyedSubscript:@"targetDevice"];
    v40 = +[DEDDevice deviceWithDictionary:v39];

    [v38 setTransport:3];
    v41 = [v38 identifier];
    [v38 setAddress:v41];

    v42 = [(DEDSharingInbound *)self connection];
    v43 = [v38 identifier];
    [v42 addIncomingSFSession:v7 forIdentifier:v43];

    v44 = [(DEDSharingInbound *)self delegate];
    objc_msgSend(v44, "sharingInbound_startBugSessionWithIdentifier:configuration:caller:target:", v34, v36, v38, v40);
  }
  v45 = [v6 objectForKeyedSubscript:@"setup"];
  int v46 = [v45 isEqualToString:@"did_start_session"];

  if (v46)
  {
    v47 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [v6 objectForKeyedSubscript:@"myIdentifier"];
      *(_DWORD *)buf = 138412290;
      v62 = v48;
      _os_log_impl(&dword_21FE04000, v47, OS_LOG_TYPE_DEFAULT, "received start_session setup command with identifier [%@]", buf, 0xCu);
    }
    v49 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingInbound handleObject:forSFSession:]();
    }

    v50 = [(DEDSharingInbound *)self delegate];
    objc_msgSend(v50, "sharingInbound_didStartBugSessionWithInfo:", v6);
  }
  v51 = [v6 objectForKeyedSubscript:@"session"];

  if (v51)
  {
    v52 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = [v6 objectForKeyedSubscript:@"myIdentifier"];
      *(_DWORD *)buf = 138412290;
      v62 = v53;
      _os_log_impl(&dword_21FE04000, v52, OS_LOG_TYPE_DEFAULT, "received session setup command with identifier [%@]", buf, 0xCu);
    }
    v54 = [(DEDSharingInbound *)self log];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingInbound handleObject:forSFSession:]();
    }

    v55 = [v6 objectForKeyedSubscript:@"sessionID"];
    v56 = [v6 objectForKeyedSubscript:@"callingDevice"];
    v57 = +[DEDDevice deviceWithDictionary:v56];

    [v57 setTransport:3];
    v58 = [v57 identifier];
    [v57 setAddress:v58];

    [(DEDSharingInbound *)self handleObject:v6 forSFSession:v7 forBugSession:v55 callingDevice:v57];
  }
}

- (void)handleObject:(id)a3 forSFSession:(id)a4 forBugSession:(id)a5 callingDevice:(id)a6
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(DEDSharingInbound *)self log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingInbound handleObject:forSFSession:forBugSession:callingDevice:]();
  }

  v15 = [(DEDSharingInbound *)self delegate];

  if (v15)
  {
    v16 = [v10 objectForKeyedSubscript:@"session"];
    v17 = [(DEDSharingInbound *)self connection];
    v18 = [v13 identifier];
    [v17 addIncomingSFSession:v11 forIdentifier:v18];

    int v19 = [(DEDSharingInbound *)self delegate];
    v20 = [v19 sessionForIdentifier:v12];

    if ([v16 isEqualToString:@"ping"])
    {
      [v20 pingWithCallback:0];
LABEL_28:

      goto LABEL_29;
    }
    if ([v16 isEqualToString:@"pong"])
    {
      [v20 pong];
      goto LABEL_28;
    }
    if ([v16 isEqualToString:@"listExtensions"])
    {
      [v20 listDiagnosticExtensionsWithCompletion:0];
      goto LABEL_28;
    }
    if ([v16 isEqualToString:@"startDiagnostic"])
    {
      uint64_t v21 = [v10 objectForKeyedSubscript:@"identifier"];
      v22 = [v10 objectForKeyedSubscript:@"parameters"];
      v60 = (void *)v21;
      v23 = [[DEDExtensionIdentifier alloc] initWithString:v21];
      v24 = [v10 objectForKeyedSubscript:@"deferDate"];
      v25 = [(DEDExtensionIdentifier *)v23 extensionIdentifier];
      if (v24) {
        id v26 = (id)[v20 startDiagnosticExtensionWithIdentifier:v25 parameters:v22 deferRunUntil:v24 completion:0];
      }
      else {
        id v36 = (id)[v20 startDiagnosticExtensionWithIdentifier:v25 parameters:v22 completion:0];
      }

      goto LABEL_28;
    }
    if ([v16 isEqualToString:@"terminateExtension"])
    {
      v27 = [v10 objectForKeyedSubscript:@"identifier"];
      v28 = [v10 objectForKeyedSubscript:@"info"];
      [v20 terminateExtension:v27 withInfo:v28];
    }
    else
    {
      if ([v16 isEqualToString:@"supportsExtensions"])
      {
        v58 = v20;
        id v59 = v13;
        v29 = [MEMORY[0x263EFF980] array];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        int v30 = [v10 objectForKeyedSubscript:@"extensions"];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v62 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = +[DEDExtension extensionWithDictionary:*(void *)(*((void *)&v61 + 1) + 8 * i)];
              [v29 addObject:v35];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v61 objects:v65 count:16];
          }
          while (v32);
        }

        v20 = v58;
        [v58 supportsDiagnostics:v29];

        id v13 = v59;
        goto LABEL_28;
      }
      if (![v16 isEqualToString:@"finishedDiagnostic"])
      {
        if ([v16 isEqualToString:@"getStatus"])
        {
          [v20 getSessionStatusWithCompletion:0];
          goto LABEL_28;
        }
        if ([v16 isEqualToString:@"getState"])
        {
          [v20 getStateWithCompletion:0];
          goto LABEL_28;
        }
        if ([v16 isEqualToString:@"syncStatus"])
        {
          [v20 synchronizeSessionStatusWithCompletion:0];
          goto LABEL_28;
        }
        if ([v16 isEqualToString:@"didGetStatus"])
        {
          v38 = [v10 objectForKeyedSubscript:@"groups"];
          v39 = objc_msgSend(v38, "ded_mapWithBlock:", &__block_literal_global_29);

          v40 = [v10 objectForKeyedSubscript:@"extensions"];
          v41 = objc_msgSend(v40, "ded_mapWithBlock:", &__block_literal_global_117_0);

          [v20 hasCollected:v39 isCollecting:v41];
        }
        else
        {
          if ([v16 isEqualToString:@"didGetState"])
          {
            v42 = [v10 objectForKeyedSubscript:@"state"];
            uint64_t v43 = [v42 integerValue];

            v27 = [v10 objectForKeyedSubscript:@"info"];
            [v20 didGetState:v43 info:v27];
            goto LABEL_16;
          }
          if ([v16 isEqualToString:@"didSyncStatus"])
          {
            v44 = [v10 objectForKeyedSubscript:@"groups"];
            v27 = objc_msgSend(v44, "ded_mapWithBlock:", &__block_literal_global_128);

            v45 = [v10 objectForKeyedSubscript:@"extensions"];
            int v46 = objc_msgSend(v45, "ded_mapWithBlock:", &__block_literal_global_130);

            v47 = [v10 objectForKeyedSubscript:@"identifiers"];
            v48 = objc_msgSend(v47, "ded_mapWithBlock:", &__block_literal_global_135);

            [v20 hasCollected:v27 isCollecting:v46 identifiers:v48];
            goto LABEL_16;
          }
          if (![v16 isEqualToString:@"adoptFiles"])
          {
            if ([v16 isEqualToString:@"didAdoptFiles"])
            {
              v27 = [v10 objectForKey:@"error"];
              [v20 didAdoptFilesWithError:v27];
            }
            else
            {
              if ([v16 isEqualToString:@"uploadProgress"])
              {
                v50 = [v10 objectForKeyedSubscript:@"uploaded"];
                uint64_t v51 = [v50 longLongValue];

                v52 = [v10 objectForKeyedSubscript:@"total"];
                uint64_t v53 = [v52 longLongValue];

                [v20 uploadProgress:v51 total:v53];
                goto LABEL_28;
              }
              if ([v16 isEqualToString:@"compressionProgress"])
              {
                v54 = [v10 objectForKeyedSubscript:@"compressed"];
                uint64_t v55 = [v54 unsignedLongLongValue];

                v56 = [v10 objectForKeyedSubscript:@"total"];
                uint64_t v57 = [v56 unsignedLongLongValue];

                [v20 compressionProgress:v55 total:v57];
                goto LABEL_28;
              }
              if ([v16 isEqualToString:@"commitSession"])
              {
                [v20 commit];
                goto LABEL_28;
              }
              if ([v16 isEqualToString:@"didCommitSession"])
              {
                [v20 didCommit];
                goto LABEL_28;
              }
              if ([v16 isEqualToString:@"cancelSession"])
              {
                [v20 cancel];
                goto LABEL_28;
              }
              if ([v16 isEqualToString:@"didCancelSession"])
              {
                v27 = [(DEDSharingInbound *)self delegate];
                [v27 sharingInbound_didAbortSessionWithID:v12];
              }
              else
              {
                v27 = [(DEDSharingInbound *)self log];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  -[DEDSharingInbound handleObject:forSFSession:forBugSession:callingDevice:]();
                }
              }
            }
            goto LABEL_16;
          }
          v39 = [v10 objectForKeyedSubscript:@"filesForAdopt"];
          v49 = [(DEDSharingInbound *)self log];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            -[DEDSharingInbound handleObject:forSFSession:forBugSession:callingDevice:](v49);
          }

          [v20 adoptFiles:v39 withCompletion:0];
        }

        goto LABEL_28;
      }
      v27 = [v10 objectForKeyedSubscript:@"identifier"];
      v37 = [v10 objectForKeyedSubscript:@"group"];
      v28 = +[DEDAttachmentGroup groupWithDictionary:v37];

      [v20 finishedDiagnosticWithIdentifier:v27 result:v28];
    }

LABEL_16:
    goto LABEL_28;
  }
LABEL_29:
}

DEDAttachmentGroup *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:a2];
}

DEDExtension *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

DEDAttachmentGroup *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[DEDAttachmentGroup groupWithDictionary:a2];
}

DEDExtension *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[DEDExtension extensionWithDictionary:a2];
}

DEDExtensionIdentifier *__75__DEDSharingInbound_handleObject_forSFSession_forBugSession_callingDevice___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[DEDExtensionIdentifier alloc] initWithString:v2];

  return v3;
}

- (void)handleRequest:(id)a3 forSFSession:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __assert_rtn("-[DEDSharingInbound handleRequest:forSFSession:completion:]", "DEDSharingInbound.m", 252, "false");
}

- (DEDController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DEDController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DEDSharingConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (DEDSharingConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "DEDSharingInbound initialized.", v1, 2u);
}

- (void)handleObject:forSFSession:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21FE04000, v0, v1, "payload: %@", v2, v3, v4, v5, v6);
}

- (void)handleObject:(void *)a1 forSFSession:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 name];
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a1 status];
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "checkReadiness callback for %@ (status %ld)", (uint8_t *)&v5, 0x16u);
}

- (void)handleObject:forSFSession:.cold.7()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "%s:%@", (uint8_t *)v1, 0x16u);
}

- (void)handleObject:(os_log_t)log forSFSession:forBugSession:callingDevice:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "adoptFiles not supported via Sharing", v1, 2u);
}

- (void)handleObject:forSFSession:forBugSession:callingDevice:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "Unknown command given [%{public}@]", v1, 0xCu);
}

- (void)handleObject:forSFSession:forBugSession:callingDevice:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "%s bugSession:%@", (uint8_t *)v1, 0x16u);
}

@end