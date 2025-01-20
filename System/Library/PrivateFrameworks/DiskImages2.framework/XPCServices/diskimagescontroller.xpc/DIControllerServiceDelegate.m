@interface DIControllerServiceDelegate
+ (BOOL)sendHandleToClient:(id)a3 clientConnection:(id)a4 outError:(id *)a5;
+ (BOOL)tryAttachWithParams:(id)a3 clientConnection:(id)a4 outError:(id *)a5;
- (BOOL)checkAttachEntitlementWithError:(id *)a3;
- (BOOL)setupNewConnection:(id)a3;
- (id)serviceName;
- (void)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 reply:(id)a4;
- (void)attachWithParams:(id)a3 reply:(id)a4;
- (void)convertWithParams:(id)a3 reply:(id)a4;
- (void)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 reply:(id)a5;
- (void)dupWithStderrHandle:(id)a3 reply:(id)a4;
- (void)embedUserDataWithParams:(id)a3 reply:(id)a4;
- (void)enterSandbox;
- (void)keychainUnlockWithEncryptionUnlocker:(id)a3 reply:(id)a4;
- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4;
- (void)retrieveUserDataWithParams:(id)a3 reply:(id)a4;
- (void)verifyWithParams:(id)a3 reply:(id)a4;
@end

@implementation DIControllerServiceDelegate

- (id)serviceName
{
  return @"com.apple.diskimagescontroller";
}

+ (BOOL)sendHandleToClient:(id)a3 clientConnection:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1000312B4;
  v19 = sub_1000312C4;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000312CC;
  v14[3] = &unk_1001A1BD8;
  v14[4] = &v15;
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003149C;
  v13[3] = &unk_1001A1BD8;
  v13[4] = &v15;
  [v9 attachCompletedWithHandle:v7 reply:v13];
  v10 = (void *)v16[5];
  if (a5 && v10)
  {
    *a5 = v10;
    v10 = (void *)v16[5];
  }
  BOOL v11 = v10 == 0;

  _Block_object_dispose(&v15, 8);
  return v11;
}

+ (BOOL)tryAttachWithParams:(id)a3 clientConnection:(id)a4 outError:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  while (1)
  {
    v10 = [[DIController2IO_XPCHandlerAttach alloc] initWithParams:v6];
    id v41 = 0;
    id v11 = [(DIController2IO_XPCHandlerAttach *)v10 runWithError:&v41];
    id v12 = v41;
    if (v11)
    {
      id v40 = v12;
      unsigned __int8 v13 = +[DIControllerServiceDelegate sendHandleToClient:v11 clientConnection:v7 outError:&v40];
      id v14 = v40;

      id v12 = v14;
      if ((v13 & 1) == 0) {
        break;
      }
    }
    [(DIBaseXPCHandler *)v10 closeConnection];
    if (!v12)
    {

      id v14 = 0;
      BOOL v32 = 1;
      goto LABEL_42;
    }
    if ([v12 code] == (id)155
      || [v12 code] == (id)151
      || [v12 code] == (id)4097
      || [v12 code] == (id)4099)
    {
      uint64_t v15 = v9 + 1;
      if (v9 == 5) {
        goto LABEL_38;
      }
      if (v9)
      {
        int v16 = *__error();
        if (sub_1000D850C())
        {
          uint64_t v17 = sub_1000D848C();
          os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 68158210;
          int v43 = 77;
          __int16 v44 = 2080;
          v45 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
          __int16 v46 = 2114;
          id v47 = v12;
          LODWORD(v35) = 28;
          v34 = buf;
          v18 = (char *)_os_log_send_and_compose_impl();

          if (v18)
          {
            fprintf(__stderrp, "%s\n", v18);
            free(v18);
          }
        }
        else
        {
          v22 = sub_1000D848C();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158210;
            int v43 = 77;
            __int16 v44 = 2080;
            v45 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
            __int16 v46 = 2114;
            id v47 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%.*s: Connection attempt failed: %{public}@, retrying", buf, 0x1Cu);
          }
        }
        *__error() = v16;
        usleep(0x7A120u);
        uint64_t v8 = 0;
        uint64_t v9 = v15;
      }
      else
      {
        int v19 = *__error();
        if (sub_1000D850C())
        {
          id v20 = sub_1000D848C();
          os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68158210;
          int v43 = 77;
          __int16 v44 = 2080;
          v45 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
          __int16 v46 = 2114;
          id v47 = v12;
          LODWORD(v35) = 28;
          v34 = buf;
          v21 = (char *)_os_log_send_and_compose_impl();

          if (v21)
          {
            fprintf(__stderrp, "%s\n", v21);
            free(v21);
          }
        }
        else
        {
          v23 = sub_1000D848C();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68158210;
            int v43 = 77;
            __int16 v44 = 2080;
            v45 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
            __int16 v46 = 2114;
            id v47 = v12;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%.*s: First connection attempt failed: %{public}@, retrying", buf, 0x1Cu);
          }
        }
        *__error() = v19;
        usleep(0x186A0u);
        uint64_t v8 = 0;
        uint64_t v9 = 1;
      }
    }
    else
    {
      if ([v12 code] != (id)168)
      {
LABEL_38:
        id v14 = v12;
        break;
      }
      uint64_t v24 = v8 + 1;
      if (v8 == 34)
      {
        id v14 = +[DIError errorWithEnumValue:159 verboseInfo:@"Timeout waiting for a completion of an ongoing eject"];

        break;
      }
      if (!v8)
      {
        int v25 = *__error();
        if (sub_1000D850C())
        {
          int v37 = v25;
          v36 = sub_1000D848C();
          os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
          v26 = [v6 inputURL];
          v27 = [v26 path];
          *(_DWORD *)buf = 68158211;
          int v43 = 77;
          __int16 v44 = 2080;
          v45 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
          __int16 v46 = 2113;
          id v47 = v27;
          LODWORD(v35) = 28;
          v34 = buf;
          v28 = (char *)_os_log_send_and_compose_impl();

          int v25 = v37;
          if (v28)
          {
            fprintf(__stderrp, "%s\n", v28);
            free(v28);
          }
        }
        else
        {
          v29 = sub_1000D848C();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            int v38 = v25;
            v30 = [v6 inputURL];
            v31 = [v30 path];
            *(_DWORD *)buf = 68158211;
            int v43 = 77;
            __int16 v44 = 2080;
            v45 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
            __int16 v46 = 2113;
            id v47 = v31;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%.*s: Waiting for completion of an ongoing eject of %{private}@", buf, 0x1Cu);

            int v25 = v38;
          }
        }
        *__error() = v25;
      }
      sleep(1u);
      uint64_t v8 = v24;
    }
  }
  if (a5)
  {
    id v14 = v14;
    BOOL v32 = 0;
    *a5 = v14;
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_42:

  return v32;
}

- (BOOL)checkAttachEntitlementWithError:(id *)a3
{
  v4 = +[NSXPCConnection currentConnection];
  v5 = [v4 valueForEntitlement:@"com.apple.diskimages.attach"];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0 && ([v5 BOOLValue] & 1) != 0)
  {
    int v6 = *__error();
    if (sub_1000D850C())
    {
      id v7 = sub_1000D848C();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v14 = 63;
      __int16 v15 = 2080;
      int v16 = "-[DIControllerServiceDelegate checkAttachEntitlementWithError:]";
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }
    else
    {
      id v12 = sub_1000D848C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v14 = 63;
        __int16 v15 = 2080;
        int v16 = "-[DIControllerServiceDelegate checkAttachEntitlementWithError:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Client is entitled to attach disk images", buf, 0x12u);
      }
    }
    *__error() = v6;
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v9 = +[NSString stringWithFormat:@"Missing entitlement: %@", @"com.apple.diskimages.attach"];
    BOOL v10 = +[DIError failWithEnumValue:158 verboseInfo:v9 error:a3];
  }
  return v10;
}

- (void)attachWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  unsigned __int8 v8 = [(DIControllerServiceDelegate *)self checkAttachEntitlementWithError:&v17];
  id v9 = v17;
  if (v8)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = sub_1000312B4;
    v15[4] = sub_1000312C4;
    id v16 = +[NSXPCConnection currentConnection];
    BOOL v10 = [(DIBaseServiceDelegate *)self dispatchQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100032294;
    v11[3] = &unk_1001A1C00;
    id v12 = v6;
    int v14 = v15;
    id v13 = v7;
    dispatch_async(v10, v11);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
}

- (void)dupWithStderrHandle:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  LODWORD(a3) = [a3 fileDescriptor];
  int v6 = fileno(__stderrp);
  if (dup2((int)a3, v6) < 0)
  {
    BOOL v10 = +[DIError errorWithEnumValue:154 verboseInfo:@"Error duplicating stderr"];
  }
  else
  {
    int v7 = *__error();
    if (sub_1000D850C())
    {
      unsigned __int8 v8 = sub_1000D848C();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v13 = 57;
      __int16 v14 = 2080;
      __int16 v15 = "-[DIControllerServiceDelegate dupWithStderrHandle:reply:]";
      id v9 = (char *)_os_log_send_and_compose_impl();

      if (v9)
      {
        fprintf(__stderrp, "%s\n", v9);
        free(v9);
      }
    }
    else
    {
      id v11 = sub_1000D848C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v13 = 57;
        __int16 v14 = 2080;
        __int16 v15 = "-[DIControllerServiceDelegate dupWithStderrHandle:reply:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: stderr duplicated", buf, 0x12u);
      }
    }
    BOOL v10 = 0;
    *__error() = v7;
  }
  v5[2](v5, v10);
}

- (void)convertWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(DIBaseServiceDelegate *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032620;
  v11[3] = &unk_1001A1C28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)verifyWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(DIBaseServiceDelegate *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032820;
  v11[3] = &unk_1001A1C28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)embedUserDataWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(DIBaseServiceDelegate *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032A18;
  v11[3] = &unk_1001A1C28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)retrieveUserDataWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(DIBaseServiceDelegate *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032C10;
  v11[3] = &unk_1001A1C28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)keychainUnlockWithEncryptionUnlocker:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(DIBaseServiceDelegate *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032E34;
  v11[3] = &unk_1001A1C28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(DIBaseServiceDelegate *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100033040;
  v11[3] = &unk_1001A1C28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DIBaseServiceDelegate *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033270;
  block[3] = &unk_1001A1C50;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DIBaseServiceDelegate *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100033480;
  v11[3] = &unk_1001A1C28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (BOOL)setupNewConnection:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DIControllerProtocol];
  [v4 setExportedInterface:v5];

  [v4 setExportedObject:self];
  id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DIController2ClientProtocol];
  [v4 setRemoteObjectInterface:v6];

  [v4 setInterruptionHandler:&stru_1001A1CB8];
  [v4 setInvalidationHandler:&stru_1001A1CD8];

  return 1;
}

- (void)enterSandbox
{
  _set_user_dir_suffix();
  v3.receiver = self;
  v3.super_class = (Class)DIControllerServiceDelegate;
  [(DIBaseServiceDelegate *)&v3 enterSandbox];
}

@end