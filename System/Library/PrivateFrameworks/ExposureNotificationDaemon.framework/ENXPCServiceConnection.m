@interface ENXPCServiceConnection
+ (id)connectionWithXPCConnection:(id)a3 serviceListener:(id)a4 dispatchQueue:(id)a5;
- (void)activate;
- (void)invalidate;
- (void)xpcConnectionEvent:(id)a3;
- (void)xpcConnectionRequest:(id)a3;
- (void)xpcFileSessionActivate:(id)a3 archive:(BOOL)a4;
- (void)xpcFileSessionInvalidate:(id)a3;
- (void)xpcFileSessionReadTEKBatch:(id)a3;
- (void)xpcSendMessage:(id)a3;
- (void)xpcSendReplyError:(id)a3 request:(id)a4;
@end

@implementation ENXPCServiceConnection

+ (id)connectionWithXPCConnection:(id)a3 serviceListener:(id)a4 dispatchQueue:(id)a5
{
  v7 = (_xpc_connection_s *)a3;
  v8 = (ENXPCServiceListener *)a4;
  v9 = (OS_dispatch_queue *)a5;
  v10 = objc_alloc_init(ENXPCServiceConnection);
  dispatchQueue = v10->_dispatchQueue;
  v10->_dispatchQueue = v9;
  v12 = v9;

  serviceListener = v10->_serviceListener;
  v10->_serviceListener = v8;
  v14 = v8;

  v10->_pid = xpc_connection_get_pid(v7);
  xpcConnection = v10->_xpcConnection;
  v10->_xpcConnection = v7;

  return v10;
}

- (void)activate
{
  xpcConnection = self->_xpcConnection;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __34__ENXPCServiceConnection_activate__block_invoke;
  handler[3] = &unk_1E69ACB68;
  handler[4] = self;
  xpc_connection_set_event_handler(xpcConnection, handler);
  xpc_connection_set_target_queue(self->_xpcConnection, (dispatch_queue_t)self->_dispatchQueue);
  xpc_connection_activate(self->_xpcConnection);
}

uint64_t __34__ENXPCServiceConnection_activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcConnectionEvent:a2];
}

- (void)invalidate
{
  [(ENFileSessionDaemon *)self->_fileSession invalidate];
  fileSession = self->_fileSession;
  self->_fileSession = 0;

  [(ENXPCServiceListener *)self->_serviceListener connectionInvalidated:self];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)xpcConnectionEvent:(id)a3
{
  id v9 = a3;
  uint64_t v4 = MEMORY[0x1D943A770]();
  if (v4 == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = [(ENXPCServiceConnection *)self xpcConnectionRequest:v9];
    goto LABEL_14;
  }
  id v5 = v9;
  if (v9 == (id)MEMORY[0x1E4F14528])
  {
    if (gLogCategory_ENXPCServiceConnection <= 20
      && (gLogCategory_ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
    {
      v8 = CUPrintPID();
      LogPrintF_safe();

      uint64_t v4 = [(ENXPCServiceConnection *)self invalidate];
    }
    else
    {
      uint64_t v4 = [(ENXPCServiceConnection *)self invalidate];
    }
    goto LABEL_14;
  }
  if (gLogCategory__ENXPCServiceConnection <= 90)
  {
    if (gLogCategory__ENXPCServiceConnection != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v9, v4))
    {
      v7 = CUPrintXPC();
      LogPrintF_safe();

LABEL_14:
      id v5 = v9;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)xpcConnectionRequest:(id)a3
{
  id v11 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v11, "smTyp");
  switch(int64)
  {
    case 10:
      id v5 = self;
      id v6 = v11;
      uint64_t v7 = 1;
      goto LABEL_7;
    case 11:
      id v5 = self;
      id v6 = v11;
      uint64_t v7 = 0;
LABEL_7:
      [(ENXPCServiceConnection *)v5 xpcFileSessionActivate:v6 archive:v7];
      break;
    case 12:
      [(ENXPCServiceConnection *)self xpcFileSessionInvalidate:v11];
      break;
    case 13:
      [(ENXPCServiceConnection *)self xpcFileSessionReadTEKBatch:v11];
      break;
    default:
      int64_t v8 = int64;
      if (gLogCategory__ENXPCServiceConnection <= 90
        && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      if (xpc_dictionary_expects_reply())
      {
        int64_t v10 = v8;
        id v9 = ENErrorF();
        -[ENXPCServiceConnection xpcSendReplyError:request:](self, "xpcSendReplyError:request:", v9, v11, v10);
      }
      break;
  }
}

- (void)xpcSendMessage:(id)a3
{
  xpc_object_t message = a3;
  uint64_t v4 = self->_xpcConnection;
  id v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (gLogCategory__ENXPCServiceConnection <= 90 {
         && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (void)xpcSendReplyError:(id)a3 request:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self->_xpcConnection;
  if (v7)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      CUXPCEncodeNSError();
      xpc_connection_send_message(v7, reply);
    }
    else if (gLogCategory__ENXPCServiceConnection <= 90 {
           && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENXPCServiceConnection <= 90 {
         && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (void)xpcFileSessionActivate:(id)a3 archive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v65 = 0;
  v66 = (id *)&v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__0;
  v69 = __Block_byref_object_dispose__0;
  id v70 = 0;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __57__ENXPCServiceConnection_xpcFileSessionActivate_archive___block_invoke;
  v62[3] = &unk_1E69ACB90;
  v64 = &v65;
  v62[4] = self;
  id v7 = v6;
  id v63 = v7;
  int64_t v8 = (void (**)(void))MEMORY[0x1D9439FF0](v62);
  p_fileSession = &self->_fileSession;
  v48 = v8;
  if (self->_fileSession)
  {
    uint64_t v41 = ENErrorF();
    id v42 = v66[5];
    v66[5] = (id)v41;

    goto LABEL_38;
  }
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  int v61 = 0;
  int v61 = xpc_dictionary_dup_fd(v7, "fd");
  if ((v59[3] & 0x80000000) != 0)
  {
    uint64_t v43 = ENErrorF();
    int64_t v10 = (void (**)(void))v66[5];
    v66[5] = (id)v43;
    goto LABEL_37;
  }
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __57__ENXPCServiceConnection_xpcFileSessionActivate_archive___block_invoke_2;
  v57[3] = &unk_1E69ACBB8;
  v57[4] = &v58;
  int64_t v10 = (void (**)(void))MEMORY[0x1D9439FF0](v57);
  id v11 = v66 + 5;
  id obj = v66[5];
  id v56 = 0;
  uint64_t v71 = 0;
  v47 = v10;
  int v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 == 6) {
    uint64_t v13 = v71;
  }
  else {
    uint64_t v13 = 0;
  }
  objc_storeStrong(v11, obj);
  if (v12 != 5)
  {
    v14 = v66 + 5;
    id v54 = v66[5];
    uint64_t v71 = 0;
    int v15 = CUXPCDecodeUInt64RangedEx();
    uint64_t v16 = v15 == 6 ? v71 : 0;
    objc_storeStrong(v14, v54);
    if (v15 != 5)
    {
      v17 = v66;
      id v53 = v66[5];
      int v18 = CUXPCDecodeNSData();
      objc_storeStrong(v17 + 5, v53);
      if (v18)
      {
        v46 = self;
        v19 = objc_alloc_init(ENFileSessionDaemon);
        [(ENFileSessionDaemon *)v19 setBatchSize:v13];
        [(ENFileSessionDaemon *)v19 setFlags:v16];
        uint64_t v20 = *((unsigned int *)v59 + 6);
        if (v4)
        {
          v21 = v66;
          id v52 = v66[5];
          BOOL v22 = [(ENFileSessionDaemon *)v19 activateWithArchiveFD:v20 error:&v52];
          objc_storeStrong(v21 + 5, v52);
          if (!v22) {
            goto LABEL_35;
          }
        }
        else
        {
          v23 = v66;
          id v51 = v66[5];
          BOOL v24 = [(ENFileSessionDaemon *)v19 activateWithFileFD:v20 signatureData:v56 error:&v51];
          objc_storeStrong(v23 + 5, v51);
          if (!v24)
          {
LABEL_35:

            int64_t v10 = v47;
            goto LABEL_36;
          }
        }
        v25 = [(ENFileSessionDaemon *)v19 file];
        uint64_t v26 = [v25 metadata];
        v27 = (void *)v26;
        v28 = (void *)MEMORY[0x1E4F1CC00];
        if (v26) {
          v28 = (void *)v26;
        }
        id v29 = v28;

        v30 = [(ENFileSessionDaemon *)v19 file];
        v31 = [v30 sha256Data];
        v32 = v31;
        if (v31)
        {
          id v33 = v31;
        }
        else
        {
          id v33 = [MEMORY[0x1E4F1C9B0] data];
        }
        v34 = v33;

        id v50 = 0;
        v35 = [(ENFileSessionDaemon *)v19 readSignaturesAndReturnError:&v50];
        id v49 = v50;
        if (!v35
          && gLogCategory__ENXPCServiceConnection <= 90
          && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v45 = v44 = v34;
          LogPrintF_safe();
        }
        objc_storeStrong((id *)p_fileSession, v19);
        *((_DWORD *)v59 + 6) = -1;
        xpc_object_t reply = xpc_dictionary_create_reply(v7);
        if (reply)
        {
          xpc_dictionary_set_cf_object();
          if (v34)
          {
            id v37 = v34;
            id v38 = reply;
            v39 = (const char *)[v37 bytes];
            size_t v40 = [v37 length];
            if (!v39) {
              v39 = "";
            }

            xpc_dictionary_set_data(v38, "fileHash", v39, v40);
          }
          if (v35) {
            xpc_dictionary_set_value(reply, "sigA", v35);
          }
          -[ENXPCServiceConnection xpcSendMessage:](v46, "xpcSendMessage:", reply, v44, v45);
        }
        else if (gLogCategory__ENXPCServiceConnection <= 90 {
               && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF_safe();
        }

        goto LABEL_35;
      }
    }
  }
LABEL_36:

  int64_t v8 = v48;
  v10[2](v10);
LABEL_37:

  _Block_object_dispose(&v58, 8);
LABEL_38:
  v8[2](v8);

  _Block_object_dispose(&v65, 8);
}

uint64_t __57__ENXPCServiceConnection_xpcFileSessionActivate_archive___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENXPCServiceConnection <= 90)
    {
      if (gLogCategory__ENXPCServiceConnection != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        int64_t v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 xpcSendReplyError:v5 request:v7];
  }
  return result;
}

uint64_t __57__ENXPCServiceConnection_xpcFileSessionActivate_archive___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if ((result & 0x80000000) == 0) {
    return close(result);
  }
  return result;
}

- (void)xpcFileSessionInvalidate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__ENXPCServiceConnection_xpcFileSessionInvalidate___block_invoke;
  v12[3] = &unk_1E69ACB90;
  v14 = &v15;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v12);
  uint64_t v7 = self->_fileSession;
  int64_t v8 = v7;
  if (v7)
  {
    [(ENFileSessionDaemon *)v7 invalidate];
    fileSession = self->_fileSession;
    self->_fileSession = 0;

    xpc_object_t reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      [(ENXPCServiceConnection *)self xpcSendMessage:reply];
    }
    else if (gLogCategory__ENXPCServiceConnection <= 90 {
           && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }
  else
  {
    uint64_t v11 = ENErrorF();
    xpc_object_t reply = (xpc_object_t)v16[5];
    v16[5] = v11;
  }

  v6[2](v6);
  _Block_object_dispose(&v15, 8);
}

uint64_t __51__ENXPCServiceConnection_xpcFileSessionInvalidate___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENXPCServiceConnection <= 90)
    {
      if (gLogCategory__ENXPCServiceConnection != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        int64_t v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 xpcSendReplyError:v5 request:v7];
  }
  return result;
}

- (void)xpcFileSessionReadTEKBatch:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__ENXPCServiceConnection_xpcFileSessionReadTEKBatch___block_invoke;
  v21[3] = &unk_1E69ACB90;
  v23 = &v24;
  v21[4] = self;
  id v5 = v4;
  id v22 = v5;
  id v6 = (void (**)(void))MEMORY[0x1D9439FF0](v21);
  uint64_t v7 = self->_fileSession;
  int64_t v8 = v7;
  if (v7)
  {
    id v9 = (id *)(v25 + 5);
    id obj = (id)v25[5];
    int64_t v10 = [(ENFileSessionDaemon *)v7 readTEKBatchAndReturnError:&obj];
    objc_storeStrong(v9, obj);
    if (v10)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      int v12 = reply;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "tekA", v10);
        xpc_dictionary_set_uint64(v12, "invKC", [(ENFileSessionDaemon *)v8 invalidKeyCount]);
        [(ENXPCServiceConnection *)self xpcSendMessage:v12];
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__ENXPCServiceConnection_xpcFileSessionReadTEKBatch___block_invoke_2;
        block[3] = &unk_1E69ACA50;
        block[4] = v8;
        dispatch_async(dispatchQueue, block);
      }
      else if (gLogCategory__ENXPCServiceConnection <= 90 {
             && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v15 = v25;
      uint64_t v16 = (void *)v25[5];
      if (v16)
      {
        id v17 = v16;
        int v12 = (void *)v15[5];
        v15[5] = (uint64_t)v17;
      }
      else
      {
        uint64_t v18 = ENErrorF();
        int v12 = (void *)v25[5];
        v25[5] = v18;
      }
    }
  }
  else
  {
    uint64_t v14 = ENErrorF();
    int64_t v10 = (void *)v25[5];
    v25[5] = v14;
  }

  v6[2](v6);
  _Block_object_dispose(&v24, 8);
}

uint64_t __53__ENXPCServiceConnection_xpcFileSessionReadTEKBatch___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = *(void *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENXPCServiceConnection <= 90)
    {
      if (gLogCategory__ENXPCServiceConnection != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[6], v4))
      {
        int64_t v8 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v2 + 8) + 40);
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    return [v6 xpcSendReplyError:v5 request:v7];
  }
  return result;
}

uint64_t __53__ENXPCServiceConnection_xpcFileSessionReadTEKBatch___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareNextTEKBatchIfNecessary];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_fileSession, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end