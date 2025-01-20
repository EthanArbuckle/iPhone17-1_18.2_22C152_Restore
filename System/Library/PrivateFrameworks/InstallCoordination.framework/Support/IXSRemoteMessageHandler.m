@interface IXSRemoteMessageHandler
+ (BOOL)_setHandlerIfNotExistingForIdentifier:(id)a3 messageHandler:(id)a4 withError:(id *)a5;
+ (id)_currentRemoteConnections;
+ (id)_handlerForIdentifier;
+ (id)_handlerForIdentifier:(id)a3 byRemovingEntry:(BOOL)a4;
+ (id)_sharedHandlerAccessQueue;
+ (void)_addToCurrentConnections:(id)a3;
+ (void)_cancelAndRemoveTrackedRemoteConnection:(id)a3;
+ (void)_handleInstallBeginMessage:(id)a3 forRemoteConnection:(id)a4;
+ (void)_handleQueryMessage:(id)a3 forRemoteConnection:(id)a4;
+ (void)_handleRevertStashMessage:(id)a3 forRemoteConnection:(id)a4;
+ (void)_handleUninstallMessage:(id)a3 forRemoteConnection:(id)a4;
+ (void)_removeFromCurrentConnections:(id)a3;
+ (void)_sendInstallError:(id)a3 forRemoteConnection:(id)a4;
+ (void)_sendQueryError:(id)a3 forRemoteConnection:(id)a4;
+ (void)_sendRevertError:(id)a3 forRemoteConnection:(id)a4;
+ (void)_sendUninstallError:(id)a3 forRemoteConnection:(id)a4;
+ (void)handleMessageFromPeer:(id)a3;
- (IXSRemoteConnection)remoteConnection;
- (IXSRemoteInstallAction)remoteInstallAction;
- (id)_initWithConnection:(id)a3 remoteInstallAction:(id)a4;
- (void)remoteInstaller:(id)a3 canceledWithReason:(id)a4;
- (void)remoteInstaller:(id)a3 completedWithInstallResult:(id)a4;
- (void)remoteInstaller:(id)a3 didUpdateProgress:(double)a4 forPhase:(unsigned __int8)a5 overallProgress:(double)a6;
- (void)remoteReverter:(id)a3 canceledWithError:(id)a4;
- (void)remoteReverter:(id)a3 completedWithResult:(id)a4;
- (void)remoteUninstaller:(id)a3 completedWithError:(id)a4;
- (void)setRemoteConnection:(id)a3;
- (void)setRemoteInstallAction:(id)a3;
@end

@implementation IXSRemoteMessageHandler

+ (id)_handlerForIdentifier
{
  if (qword_100026EF8 != -1) {
    dispatch_once(&qword_100026EF8, &stru_1000206D8);
  }
  v2 = (void *)qword_100026EF0;

  return v2;
}

+ (id)_currentRemoteConnections
{
  if (qword_100026F08 != -1) {
    dispatch_once(&qword_100026F08, &stru_1000206F8);
  }
  v2 = (void *)qword_100026F00;

  return v2;
}

+ (void)_addToCurrentConnections:(id)a3
{
  id v4 = a3;
  v5 = [a1 _sharedHandlerAccessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000051A0;
  v7[3] = &unk_100020720;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (void)_removeFromCurrentConnections:(id)a3
{
  id v4 = a3;
  v5 = [a1 _sharedHandlerAccessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000052A8;
  v7[3] = &unk_100020720;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (id)_sharedHandlerAccessQueue
{
  if (qword_100026F18 != -1) {
    dispatch_once(&qword_100026F18, &stru_100020740);
  }
  v2 = (void *)qword_100026F10;

  return v2;
}

+ (BOOL)_setHandlerIfNotExistingForIdentifier:(id)a3 messageHandler:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10000552C;
  v24 = sub_10000553C;
  id v25 = 0;
  v10 = [a1 _sharedHandlerAccessQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005544;
  v15[3] = &unk_100020768;
  id v19 = a1;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v18 = &v20;
  dispatch_sync(v10, v15);

  if (a5) {
    *a5 = (id) v21[5];
  }
  BOOL v13 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)_handlerForIdentifier:(id)a3 byRemovingEntry:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10000552C;
  uint64_t v20 = sub_10000553C;
  id v21 = 0;
  v7 = [a1 _sharedHandlerAccessQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000057C0;
  v11[3] = &unk_100020790;
  BOOL v13 = &v16;
  id v14 = a1;
  id v12 = v6;
  BOOL v15 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

+ (void)_cancelAndRemoveTrackedRemoteConnection:(id)a3
{
  id v4 = a3;
  [v4 cancel];
  [a1 _removeFromCurrentConnections:v4];
}

+ (void)_sendInstallError:(id)a3 forRemoteConnection:(id)a4
{
  id v5 = a4;
  sub_1000078D0(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 sendMessage:v6];
}

+ (void)_handleInstallBeginMessage:(id)a3 forRemoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100008598(v6) == 1)
  {
    id v8 = sub_100008000(v6);
    uint64_t v9 = sub_10000800C(v6);
    id v11 = sub_100007978(v6);
    if (v11 && v8)
    {
      id v12 = sub_10000E748((uint64_t)off_100026DB0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "+[IXSRemoteMessageHandler _handleInstallBeginMessage:forRemoteConnection:]";
        __int16 v27 = 2112;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Handling kIXRemoteRequestTypeInstall with options: %@", buf, 0x16u);
      }

      id v24 = 0;
      BOOL v13 = [[IXSRemoteInstaller alloc] initWithRemoteInstallOptions:v11 xpcAssetStream:v8 assetSize:v9 error:&v24];
      id v14 = v24;
      if (v13)
      {
        uint64_t v22 = v8;
        id v15 = [[IXSRemoteMessageHandler alloc] _initWithConnection:v7 remoteInstallAction:v13];
        [(IXSRemoteInstaller *)v13 setDelegate:v15];
        uint64_t v16 = [(IXSRemoteInstaller *)v13 bundleID];
        id v23 = v14;
        unsigned int v17 = [a1 _setHandlerIfNotExistingForIdentifier:v16 messageHandler:v15 withError:&v23];
        id v18 = v23;

        if (v17)
        {
          [(IXSRemoteInstaller *)v13 beginTransferAndInstall];
          id v14 = v18;
          id v8 = v22;
LABEL_17:

          goto LABEL_18;
        }
        id v14 = v18;
        id v8 = v22;
        if (!v18) {
          goto LABEL_17;
        }
LABEL_14:
        uint64_t v20 = sub_10000E748((uint64_t)off_100026DB0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100013278(v11);
        }

        [a1 _sendInstallError:v14 forRemoteConnection:v7];
        goto LABEL_17;
      }
    }
    else
    {
      sub_100008A20((uint64_t)"+[IXSRemoteMessageHandler _handleInstallBeginMessage:forRemoteConnection:]", 145, @"IXRemoteErrorDomain", 2, 0, 0, @"Failed to create configuration required to install from the incoming message", v10, v21);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v13 = 0;
    }
    id v15 = 0;
    if (!v14) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  id v19 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10001331C();
  }

  [a1 _cancelAndRemoveTrackedRemoteConnection:v7];
LABEL_18:
}

+ (void)_sendUninstallError:(id)a3 forRemoteConnection:(id)a4
{
  id v5 = a4;
  sub_100008144(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 sendMessage:v6];
}

+ (void)_sendQueryError:(id)a3 forRemoteConnection:(id)a4
{
  id v5 = a4;
  sub_100008394(0, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 sendMessage:v6];
}

+ (void)_handleUninstallMessage:(id)a3 forRemoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100008598(v6) == 1)
  {
    id v24 = 0;
    id v25 = 0;
    sub_100008018(v6, &v25, &v24);
    id v8 = v25;
    id v9 = v24;
    id v11 = v9;
    if (v8)
    {
      if (!v9)
      {
        uint64_t v20 = sub_10000E748((uint64_t)off_100026DB0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v27 = "+[IXSRemoteMessageHandler _handleUninstallMessage:forRemoteConnection:]";
          __int16 v28 = 2112;
          id v29 = v8;
          __int16 v30 = 2112;
          uint64_t v31 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Handling kIXRemoteRequestTypeUninstall for bundleID %@, path: %@", buf, 0x20u);
        }

        unsigned int v17 = [[IXSRemoteUninstaller alloc] initWithBundleID:v8];
        id v19 = v8;
        id v18 = [[IXSRemoteMessageHandler alloc] _initWithConnection:v7 remoteInstallAction:v17];
        id v23 = 0;
        unsigned int v21 = [a1 _setHandlerIfNotExistingForIdentifier:v19 messageHandler:v18 withError:&v23];
        id v16 = v23;
        if (v21)
        {
          [(IXSRemoteUninstaller *)v17 setDelegate:v18];
          [(IXSRemoteUninstaller *)v17 beginUninstall];
LABEL_12:

          goto LABEL_13;
        }
LABEL_10:
        if (v16) {
          [a1 _sendUninstallError:v16 forRemoteConnection:v7];
        }
        goto LABEL_12;
      }
      id v12 = @"Uninstall can only be performed by specifiying only bundleID on embedded platforms";
      uint64_t v13 = 225;
      uint64_t v14 = 3;
    }
    else
    {
      id v12 = @"Missing bundleID while performing uninstall on an embedded platform";
      uint64_t v13 = 220;
      uint64_t v14 = 2;
    }
    sub_100008A20((uint64_t)"+[IXSRemoteMessageHandler _handleUninstallMessage:forRemoteConnection:]", v13, @"IXRemoteErrorDomain", v14, 0, 0, v12, v10, v22);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v17 = 0;
    id v18 = 0;
    id v19 = 0;
    goto LABEL_10;
  }
  id v15 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100013390();
  }

  [a1 _cancelAndRemoveTrackedRemoteConnection:v7];
LABEL_13:
}

+ (void)_sendRevertError:(id)a3 forRemoteConnection:(id)a4
{
  id v5 = a4;
  sub_100008650(0, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 sendMessage:v6];
}

+ (void)_handleRevertStashMessage:(id)a3 forRemoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100008598(v6) == 1)
  {
    id v9 = sub_1000085BC(v6);
    if (v9)
    {
      uint64_t v10 = [[IXSRemoteReverter alloc] initWithBundleID:v9];
      id v11 = [[IXSRemoteMessageHandler alloc] _initWithConnection:v7 remoteInstallAction:v10];
      [(IXSRemoteReverter *)v10 setDelegate:v11];
      id v16 = 0;
      unsigned int v12 = [a1 _setHandlerIfNotExistingForIdentifier:v9 messageHandler:v11 withError:&v16];
      id v13 = v16;
      if (v12)
      {
        [(IXSRemoteReverter *)v10 beginRevert];
        goto LABEL_11;
      }
    }
    else
    {
      sub_100008A20((uint64_t)"+[IXSRemoteMessageHandler _handleRevertStashMessage:forRemoteConnection:]", 284, @"IXRemoteErrorDomain", 2, 0, 0, @"bundleID unspecified while requesting to perform revert", v8, v15);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = 0;
      id v11 = 0;
    }
    if (!v13)
    {
LABEL_12:

      goto LABEL_13;
    }
    [a1 _sendRevertError:v13 forRemoteConnection:v7];
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v14 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100013404();
  }

  [a1 _cancelAndRemoveTrackedRemoteConnection:v7];
LABEL_13:
}

+ (void)_handleQueryMessage:(id)a3 forRemoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100008598(v6) == 1)
  {
    id v38 = 0;
    id v39 = 0;
    id v37 = 0;
    sub_1000081F4(v6, &v39, &v38, &v37);
    id v8 = v39;
    unint64_t v9 = (unint64_t)v38;
    unint64_t v10 = (unint64_t)v37;
    unsigned int v12 = (void *)v10;
    if (v8)
    {
      if (!(v9 | v10))
      {
        id v35 = (id)v10;
        id v19 = sub_10000E748((uint64_t)off_100026DB0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [0 path];
          *(_DWORD *)buf = 136315650;
          v41 = "+[IXSRemoteMessageHandler _handleQueryMessage:forRemoteConnection:]";
          __int16 v42 = 2112;
          id v43 = v8;
          __int16 v44 = 2112;
          v45 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: Handling kIXRemoteRequestTypeQuery for bundleID %@, path: %@", buf, 0x20u);
        }
        id v36 = 0;
        id v18 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v36];
        id v17 = v36;
        if (v18)
        {
          id v33 = v8;
          unint64_t v34 = v9;
          v32 = [IXRemoteInstallResult alloc];
          unsigned int v21 = [v18 databaseUUID];
          uint64_t v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v18 sequenceNumber]);
          id v23 = [v18 URL];
          id v24 = [v18 persistentIdentifier];
          id v25 = [(IXRemoteInstallResult *)v32 initWithDBUUID:v21 dbSequenceNumber:v22 URLOfInstalledApp:v23 persistentIdentifier:v24];

          if (v25)
          {
            v26 = sub_100008394(v25, 0);
            [v7 sendMessage:v26];

            unint64_t v9 = v34;
            unsigned int v12 = v35;
            id v8 = v33;
            goto LABEL_11;
          }
          unint64_t v9 = v34;
          unsigned int v12 = v35;
          id v8 = v33;
        }
        else
        {
          __int16 v27 = sub_10000E748((uint64_t)off_100026DB0);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_100013478();
          }

          uint64_t v31 = [0 path];
          uint64_t v29 = sub_100008A20((uint64_t)"+[IXSRemoteMessageHandler _handleQueryMessage:forRemoteConnection:]", 355, @"IXRemoteErrorDomain", 5, v17, 0, @"LaunchServices did not have a record for bundleID %@, path : %@", v28, (uint64_t)v8);

          id v18 = 0;
          id v17 = (id)v29;
          unsigned int v12 = v35;
        }
LABEL_10:
        [a1 _sendQueryError:v17 forRemoteConnection:v7];
LABEL_11:

        goto LABEL_12;
      }
      id v13 = @"Query must be done by bundle ID and may not specify a path or bundle name on embedded platforms";
      uint64_t v14 = 342;
      uint64_t v15 = 3;
    }
    else
    {
      id v13 = @"Missing bundleID while performing query on an embedded platform";
      uint64_t v14 = 339;
      uint64_t v15 = 2;
    }
    sub_100008A20((uint64_t)"+[IXSRemoteMessageHandler _handleQueryMessage:forRemoteConnection:]", v14, @"IXRemoteErrorDomain", v15, 0, 0, v13, v11, v30);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = 0;
    goto LABEL_10;
  }
  id v16 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10001352C();
  }

  [a1 _cancelAndRemoveTrackedRemoteConnection:v7];
LABEL_12:
}

+ (void)handleMessageFromPeer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  [a1 _addToCurrentConnections:v4];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006684;
  v5[3] = &unk_1000207B8;
  objc_copyWeak(v6, &location);
  v6[1] = a1;
  [v4 setEventHandler:v5];
  [v4 activate];
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (id)_initWithConnection:(id)a3 remoteInstallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IXSRemoteMessageHandler;
  id v8 = [(IXSRemoteMessageHandler *)&v11 init];
  unint64_t v9 = v8;
  if (v8)
  {
    [(IXSRemoteMessageHandler *)v8 setRemoteConnection:v6];
    [(IXSRemoteMessageHandler *)v9 setRemoteInstallAction:v7];
  }

  return v9;
}

- (void)remoteInstaller:(id)a3 completedWithInstallResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  id v8 = [v6 bundleID];

  unint64_t v9 = [v7 _handlerForIdentifier:v8 byRemovingEntry:1];
  unint64_t v10 = [v9 remoteConnection];

  if (v10)
  {
    objc_super v11 = sub_1000076B0(v5);
    [v10 sendMessage:v11];
  }
  else
  {
    objc_super v11 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100013734(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)remoteInstaller:(id)a3 canceledWithReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 bundleID];
    int v21 = 136315650;
    uint64_t v22 = "-[IXSRemoteMessageHandler remoteInstaller:canceledWithReason:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to install %@ - getting back to the client : %@", (uint8_t *)&v21, 0x20u);
  }
  unint64_t v9 = objc_opt_class();
  unint64_t v10 = [v5 bundleID];
  objc_super v11 = [v9 _handlerForIdentifier:v10 byRemovingEntry:1];
  uint64_t v12 = [v11 remoteConnection];

  if (v12)
  {
    uint64_t v13 = sub_1000078D0(v6);
    [v12 sendMessage:v13];
  }
  else
  {
    uint64_t v13 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000137AC(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)remoteInstaller:(id)a3 didUpdateProgress:(double)a4 forPhase:(unsigned __int8)a5 overallProgress:(double)a6
{
  unsigned int v7 = a5;
  id v9 = a3;
  unint64_t v10 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10001389C(v9, v10, a6);
  }

  objc_super v11 = objc_opt_class();
  uint64_t v12 = [v9 bundleID];
  uint64_t v13 = [v11 _handlerForIdentifier:v12 byRemovingEntry:0];
  uint64_t v14 = [v13 remoteConnection];

  if (v14)
  {
    uint64_t v15 = sub_100007818(v7, a4, a6);
    [v14 sendMessage:v15];
  }
  else
  {
    uint64_t v15 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100013824(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (void)remoteUninstaller:(id)a3 completedWithError:(id)a4
{
  id v5 = a4;
  id v6 = [a3 bundleID];
  unsigned int v7 = [(id)objc_opt_class() _handlerForIdentifier:v6 byRemovingEntry:1];
  id v8 = [v7 remoteConnection];

  if (v8)
  {
    id v9 = sub_100008144(v5);
    [v8 sendMessage:v9];
  }
  else
  {
    id v9 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100013954(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)remoteReverter:(id)a3 canceledWithError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = objc_opt_class();
  id v8 = [v6 bundleID];

  id v9 = [v7 _handlerForIdentifier:v8 byRemovingEntry:1];
  uint64_t v10 = [v9 remoteConnection];

  if (v10)
  {
    uint64_t v11 = sub_100008650(0, v5);
    [v10 sendMessage:v11];
  }
  else
  {
    uint64_t v11 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000139CC(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)remoteReverter:(id)a3 completedWithResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = objc_opt_class();
  id v8 = [v6 bundleID];

  id v9 = [v7 _handlerForIdentifier:v8 byRemovingEntry:1];
  uint64_t v10 = [v9 remoteConnection];

  if (v10)
  {
    uint64_t v11 = sub_100008650(v5, 0);
    [v10 sendMessage:v11];
  }
  else
  {
    uint64_t v11 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100013A44(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (IXSRemoteConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
}

- (IXSRemoteInstallAction)remoteInstallAction
{
  return self->_remoteInstallAction;
}

- (void)setRemoteInstallAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteInstallAction, 0);

  objc_storeStrong((id *)&self->_remoteConnection, 0);
}

@end