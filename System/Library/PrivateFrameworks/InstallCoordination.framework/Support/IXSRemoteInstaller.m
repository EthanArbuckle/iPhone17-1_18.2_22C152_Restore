@interface IXSRemoteInstaller
+ (BOOL)_configurePlaceholderPromiseForCoordinator:(id)a3 remoteInstallOptions:(id)a4;
+ (BOOL)_setInstallOptions:(id)a3 forCoordinator:(id)a4;
+ (BOOL)isInstallProhibited;
+ (id)_coordinatorForEmbeddedAppWithRemoteInstallConfiguration:(id)a3 error:(id *)a4;
+ (id)_coordinatorWithBundleID:(id)a3 forUpdate:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6;
+ (int)_readAssetFromXPCAssetStream:(id)a3 error:(id *)a4;
+ (unint64_t)_autoInstallOverrideForRemoteOverride:(unsigned __int8)a3;
+ (unint64_t)_importanceFromRemoteInstallImportance:(unsigned __int8)a3;
+ (unint64_t)_stashModeForRemoteStashMode:(unsigned __int8)a3;
+ (unsigned)_remoteProgressPhaseForPhase:(unint64_t)a3;
+ (void)_cancelAppAssetPromise:(id)a3 withUnderlyingError:(id)a4;
+ (void)_completeStreamingForExtractor:(id)a3 forReadFD:(int)a4 isMultiUser:(BOOL)a5 completion:(id)a6;
- (BOOL)isMultiUser;
- (IXInitiatingOrUpdatingCoordinator)coordinator;
- (IXRemoteInstallConfiguration)remoteInstallOptions;
- (IXSRemoteInstaller)initWithRemoteInstallOptions:(id)a3 xpcAssetStream:(id)a4 assetSize:(unint64_t)a5 error:(id *)a6;
- (IXSRemoteInstallerDelegate)delegate;
- (NSString)bundleID;
- (OS_xpc_object)xpcAssetStream;
- (unint64_t)assetSize;
- (unsigned)remoteAction;
- (void)_beginTransferAndInstallEmbeddedApp;
- (void)beginTransferAndInstall;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4;
- (void)setAssetSize:(unint64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMultiUser:(BOOL)a3;
- (void)setRemoteInstallOptions:(id)a3;
- (void)setXpcAssetStream:(id)a3;
@end

@implementation IXSRemoteInstaller

+ (id)_coordinatorWithBundleID:(id)a3 forUpdate:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v9];
  v11 = sub_10000E748((uint64_t)off_100026DB0);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      int v16 = 136315394;
      v17 = "+[IXSRemoteInstaller _coordinatorWithBundleID:forUpdate:created:error:]";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Found an app record for app with %@, creating an updating coordinator", (uint8_t *)&v16, 0x16u);
    }
    v13 = (id *)IXUpdatingAppInstallCoordinator_ptr;
  }
  else
  {
    if (v12)
    {
      int v16 = 136315394;
      v17 = "+[IXSRemoteInstaller _coordinatorWithBundleID:forUpdate:created:error:]";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Could not find an app record for app with %@, creating an initiating coordinator", (uint8_t *)&v16, 0x16u);
    }
    v13 = (id *)IXInitiatingAppInstallCoordinator_ptr;
  }

  v14 = [*v13 processScopedCoordinatorForAppWithIdentity:v10 withClientID:20 createIfNotExisting:1 created:a5 error:a6];

  return v14;
}

+ (id)_coordinatorForEmbeddedAppWithRemoteInstallConfiguration:(id)a3 error:(id *)a4
{
  char v24 = 0;
  v5 = [a3 bundleID];
  id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];
  id v23 = 0;
  v7 = [(id)objc_opt_class() _coordinatorWithBundleID:v5 forUpdate:v6 != 0 created:&v24 error:&v23];
  id v8 = v23;
  if (!v7) {
    goto LABEL_9;
  }
  if (v24) {
    goto LABEL_6;
  }
  if ([v7 creatorIdentifier] == (id)20)
  {
    id v10 = sub_100008A20((uint64_t)"+[IXSRemoteInstaller _coordinatorForEmbeddedAppWithRemoteInstallConfiguration:error:]", 98, @"IXRemoteErrorDomain", 5, 0, 0, @"Cancel orphaned coordinator", v9, v20);
    [v7 cancelForReason:v10 client:20 error:0];
    id v22 = v8;
    uint64_t v11 = [(id)objc_opt_class() _coordinatorWithBundleID:v5 forUpdate:v6 != 0 created:&v24 error:&v22];
    id v12 = v22;

    id v8 = v12;
    v7 = v11;
    if (!v11)
    {
LABEL_9:
      v7 = sub_10000E748((uint64_t)off_100026DB0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100014690();
      }
      goto LABEL_11;
    }
  }
  if (!v24)
  {
    v17 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100014704();
    }

    uint64_t v19 = sub_100008A20((uint64_t)"+[IXSRemoteInstaller _coordinatorForEmbeddedAppWithRemoteInstallConfiguration:error:]", 109, @"IXRemoteErrorDomain", 5, 0, 0, @"Failed to create a new coordinator as one already existed : %@", v18, (uint64_t)v7);

    id v8 = (id)v19;
LABEL_11:

    if (a4)
    {
      id v8 = v8;
      v7 = 0;
      *a4 = v8;
    }
    else
    {
      v7 = 0;
    }
    goto LABEL_17;
  }
LABEL_6:
  if (!v6)
  {
    id v21 = v8;
    unsigned __int8 v13 = [v7 setPlaceholderDisposition:2 error:&v21];
    id v14 = v21;

    if (v13)
    {
      id v8 = v14;
    }
    else
    {
      v15 = sub_10000E748((uint64_t)off_100026DB0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100014778();
      }

      id v8 = 0;
    }
  }
LABEL_17:

  return v7;
}

- (IXSRemoteInstaller)initWithRemoteInstallOptions:(id)a3 xpcAssetStream:(id)a4 assetSize:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)IXSRemoteInstaller;
  id v12 = [(IXSRemoteInstaller *)&v34 init];
  unsigned __int8 v13 = v12;
  if (!v12)
  {
    id v24 = 0;
LABEL_19:
    v25 = v13;
    goto LABEL_20;
  }
  [(IXSRemoteInstaller *)v12 setRemoteInstallOptions:v10];
  [(IXSRemoteInstaller *)v13 setXpcAssetStream:v11];
  [(IXSRemoteInstaller *)v13 setAssetSize:a5];
  id v14 = [v10 bundleID];
  [(IXSRemoteInstaller *)v13 setBundleID:v14];

  if ([(id)objc_opt_class() isInstallProhibited])
  {
    v15 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000147EC(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    sub_100008A20((uint64_t)"-[IXSRemoteInstaller initWithRemoteInstallOptions:xpcAssetStream:assetSize:error:]", 149, @"IXRemoteErrorDomain", 9, 0, 0, @"Installation on this device is prohibited by ManagedConfiguration", v23, (uint64_t)v32);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if ([v10 installableType])
  {
    id v24 = 0;
LABEL_18:
    v30 = +[UMUserManager sharedManager];
    -[IXSRemoteInstaller setIsMultiUser:](v13, "setIsMultiUser:", [v30 isMultiUser]);

    goto LABEL_19;
  }
  id v33 = 0;
  v26 = [(id)objc_opt_class() _coordinatorForEmbeddedAppWithRemoteInstallConfiguration:v10 error:&v33];
  id v24 = v33;
  if (v26)
  {
    [v26 setObserver:v13];
    [(IXSRemoteInstaller *)v13 setCoordinator:v26];
    id v32 = 0;
    unsigned __int8 v27 = objc_msgSend(v26, "setImportance:error:", objc_msgSend((id)objc_opt_class(), "_importanceFromRemoteInstallImportance:", objc_msgSend(v10, "importance")), &v32);
    id v28 = v32;
    if ((v27 & 1) == 0)
    {
      v29 = sub_10000E748((uint64_t)off_100026DB0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100014864();
      }
    }
    goto LABEL_18;
  }
LABEL_6:
  if (a6)
  {
    id v24 = v24;
    v25 = 0;
    *a6 = v24;
  }
  else
  {
    v25 = 0;
  }
LABEL_20:

  return v25;
}

+ (unint64_t)_importanceFromRemoteInstallImportance:(unsigned __int8)a3
{
  unint64_t v3 = 1;
  if (a3 == 1) {
    unint64_t v3 = 2;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (unsigned)_remoteProgressPhaseForPhase:(unint64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

+ (unint64_t)_autoInstallOverrideForRemoteOverride:(unsigned __int8)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (unint64_t)_stashModeForRemoteStashMode:(unsigned __int8)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (BOOL)_configurePlaceholderPromiseForCoordinator:(id)a3 remoteInstallOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 bundleID];
  id v8 = +[IXFileManager defaultManager];
  id v9 = objc_alloc((Class)IXPlaceholder);
  id v10 = [v6 localizedName];
  id v62 = 0;
  id v11 = [v9 initAppPlaceholderWithBundleName:v10 bundleID:v7 installType:1 client:20 error:&v62];
  id v12 = v62;

  if (!v11)
  {
    uint64_t v20 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000148D8();
    }

    uint64_t v21 = v5;
    goto LABEL_10;
  }
  v61 = v12;
  unsigned __int8 v13 = [v5 setPlaceholderPromise:v11 error:&v61];
  id v14 = v61;

  if (v13)
  {
    v15 = [v6 iconData];

    if (v15)
    {
      id v16 = objc_alloc((Class)IXPromisedInMemoryData);
      uint64_t v17 = [v6 iconData];
      id v18 = [v16 initWithName:@"Placeholder icon data" client:20 data:v17];

      if (v18)
      {
        v60 = v14;
        unsigned __int8 v19 = [v11 setIconPromise:v18 error:&v60];
        id v12 = v60;

        if ((v19 & 1) == 0)
        {
          v29 = sub_10000E748((uint64_t)off_100026DB0);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_100014DEC();
          }
          goto LABEL_48;
        }
        id v14 = v12;
      }
      else
      {
        v25 = sub_10000E748((uint64_t)off_100026DB0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100014D54(v6, v25);
        }
      }
    }
    v26 = [v6 storeMetadata];

    if (!v26)
    {
LABEL_28:
      v31 = [v6 sinfData];

      if (!v31)
      {
LABEL_31:
        objc_super v34 = [v6 bundleVersion];

        if (!v34)
        {
          id v12 = v14;
          goto LABEL_38;
        }
        id v18 = (id)objc_opt_new();
        v35 = [v6 bundleVersion];
        [v18 setBundleVersion:v35];

        v57 = v14;
        unsigned int v36 = [v11 setPlaceholderAttributes:v18 error:&v57];
        id v12 = v57;

        if (v36)
        {

LABEL_38:
          id v38 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifierOfSystemPlaceholder:v7 error:0];
          uint64_t v23 = v38;
          if (!v38 || ![v38 isPlaceholder]) {
            goto LABEL_55;
          }
          v39 = [v23 URL];
          v40 = [v39 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];

          if ([v8 itemExistsAtURL:v40])
          {
            [v8 diskUsageForURL:v40];
            id v41 = objc_alloc((Class)IXPromisedTransferToPath);
            uint64_t v42 = +[NSString stringWithFormat:@"Entitlements Promise for %@", v7];
            v43 = v40;
            v44 = (void *)v42;
            v54 = v43;
            v45 = objc_msgSend(v41, "initWithName:client:transferPath:diskSpaceNeeded:", v42, 20);

            if (v45)
            {
              [v45 setShouldCopy:1];
              [v45 setComplete:1];
              v56 = v12;
              unsigned __int8 v46 = [v11 setEntitlementsPromise:v45 error:&v56];
              v47 = v56;

              if (v46)
              {
                id v12 = v47;
                v40 = v54;
LABEL_54:

LABEL_55:
                v49 = v12;
                v55 = v12;
                unsigned __int8 v50 = [v11 setConfigurationCompleteWithError:&v55];
                id v12 = v55;

                if (v50)
                {
                  BOOL v24 = 1;
                  goto LABEL_51;
                }
                v51 = sub_10000E748((uint64_t)off_100026DB0);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                  sub_10001494C();
                }

                [v11 cancelForReason:v12 client:20 error:0];
                goto LABEL_50;
              }
              id v12 = sub_10000E748((uint64_t)off_100026DB0);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                sub_100014A54();
              }
            }
            else
            {
              v52 = sub_10000E748((uint64_t)off_100026DB0);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
                sub_1000149C0((uint64_t)v7, v52);
              }

              v47 = sub_100008A20((uint64_t)"+[IXSRemoteInstaller _configurePlaceholderPromiseForCoordinator:remoteInstallOptions:]", 369, IXErrorDomain, 2, 0, 0, @"Failed to create IXPromisedTransferToPath for entitlements for %@", v53, (uint64_t)v7);
            }

            [v11 cancelForReason:v47 client:20 error:0];
            BOOL v24 = 0;
            id v12 = v47;
            goto LABEL_51;
          }
          v45 = sub_10000E748((uint64_t)off_100026DB0);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_100014AC8(v40, v45);
          }
          goto LABEL_54;
        }
        v29 = sub_10000E748((uint64_t)off_100026DB0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100014B60();
        }
        goto LABEL_48;
      }
      id v32 = [v6 sinfData];
      v58 = v14;
      unsigned __int8 v33 = [v11 setSinfData:v32 error:&v58];
      id v12 = v58;

      if (v33)
      {
        id v14 = v12;
        goto LABEL_31;
      }
      v37 = sub_10000E748((uint64_t)off_100026DB0);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100014BD4();
      }

      uint64_t v21 = v11;
LABEL_10:
      [v21 cancelForReason:v12 client:20 error:0];
LABEL_49:
      uint64_t v23 = 0;
LABEL_50:
      BOOL v24 = 0;
      goto LABEL_51;
    }
    unsigned __int8 v27 = [v6 storeMetadata];
    id v18 = +[MIStoreMetadata metadataFromDictionary:v27];

    if (!v18)
    {
      v30 = sub_10000E748((uint64_t)off_100026DB0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100014C48(v6, v30);
      }

      goto LABEL_27;
    }
    v59 = v14;
    unsigned __int8 v28 = [v11 setMetadata:v18 error:&v59];
    id v12 = v59;

    if (v28)
    {
      id v14 = v12;
LABEL_27:

      goto LABEL_28;
    }
    v29 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100014CE0();
    }
LABEL_48:

    [v11 cancelForReason:v12 client:20 error:0];
    goto LABEL_49;
  }
  uint64_t v22 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100014E60();
  }

  [v5 cancelForReason:v14 client:20 error:0];
  uint64_t v23 = 0;
  BOOL v24 = 0;
  id v12 = v14;
LABEL_51:

  return v24;
}

+ (void)_cancelAppAssetPromise:(id)a3 withUnderlyingError:(id)a4
{
  id v5 = off_100026DB0;
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000E748((uint64_t)v5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100014F48(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v17 = sub_100008A20((uint64_t)"+[IXSRemoteInstaller _cancelAppAssetPromise:withUnderlyingError:]", 405, @"IXRemoteErrorDomain", 7, v6, 0, @"Failed to stream the app asset from remote device", v16, v21);

  id v22 = 0;
  unsigned __int8 v18 = [v7 cancelForReason:v17 client:20 error:&v22];

  id v19 = v22;
  if ((v18 & 1) == 0)
  {
    uint64_t v20 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100014ED4();
    }
  }
}

+ (BOOL)_setInstallOptions:(id)a3 forCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)MIInstallOptions);
  [v8 setInstallTargetType:1];
  [v8 setLsInstallType:1];
  uint64_t v9 = [v7 provisioningProfileDatas];
  [v8 setProvisioningProfiles:v9];

  objc_msgSend(v8, "setAutoInstallOverride:", objc_msgSend(a1, "_autoInstallOverrideForRemoteOverride:", objc_msgSend(v7, "pairedAutoInstallOverride")));
  objc_msgSend(v8, "setProvisioningProfileInstallFailureIsFatal:", objc_msgSend(v7, "provisioningProfileInstallFailureIsFatal"));
  objc_msgSend(v8, "setStashMode:", objc_msgSend(a1, "_stashModeForRemoteStashMode:", objc_msgSend(v7, "stashMode")));
  [v8 setAllowLocalProvisioned:1];
  uint64_t v10 = [v7 geoJSONData];
  [v8 setGeoJSONData:v10];

  LODWORD(v10) = [v7 installMode];
  if (v10 == 1) {
    [v8 setDeveloperInstall:1];
  }
  id v14 = 0;
  unsigned __int8 v11 = [v6 setInstallOptions:v8 error:&v14];
  id v12 = v14;
  if ((v11 & 1) == 0) {
    [v6 cancelForReason:v12 client:20 error:0];
  }

  return v11;
}

+ (void)_completeStreamingForExtractor:(id)a3 forReadFD:(int)a4 isMultiUser:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10000FF10;
  v18[4] = sub_10000FF3C;
  id v19 = objc_retainBlock(a6);
  uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned __int8 v11 = dispatch_queue_create("com.apple.RemoteInstallerAssetStreamingWrite", v10);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FF44;
  block[3] = &unk_100020968;
  int v16 = a4;
  id v14 = v9;
  uint64_t v15 = v18;
  BOOL v17 = a5;
  id v12 = v9;
  dispatch_async(v11, block);

  _Block_object_dispose(v18, 8);
}

+ (int)_readAssetFromXPCAssetStream:(id)a3 error:(id *)a4
{
  id v5 = a3;
  *(void *)v29 = -1;
  if (pipe(v29))
  {
    int v6 = *__error();
    id v7 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000151B8(v6);
    }

    v25 = strerror(v6);
    id v9 = @"Failed to create a pipe() to stream the app asset : %s (%d)";
    uint64_t v10 = 544;
  }
  else
  {
    int v12 = v29[0];
    if (v29[0] != -1)
    {
      int v13 = v29[1];
      id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v15 = dispatch_queue_create("com.apple.RemoteInstallerAssetStreamingRead", v14);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100010A88;
      block[3] = &unk_1000209D0;
      id v27 = v5;
      int v28 = v13;
      dispatch_async(v15, block);

      id v11 = 0;
      goto LABEL_10;
    }
    BOOL v17 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100015140(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    id v9 = @"pipe() did not set a valid fd at index 0 in fds array";
    uint64_t v10 = 551;
  }
  sub_100008A20((uint64_t)"+[IXSRemoteInstaller _readAssetFromXPCAssetStream:error:]", v10, @"IXRemoteErrorDomain", 5, 0, 0, v9, v8, (uint64_t)v25);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v11 = v11;
    *a4 = v11;
  }
  int v12 = -1;
LABEL_10:

  return v12;
}

- (void)_beginTransferAndInstallEmbeddedApp
{
  unint64_t v3 = [(IXSRemoteInstaller *)self remoteInstallOptions];
  v4 = [v3 localizedName];
  v29[0] = SZExtractorOptionsDenyInvalidSymlinks;
  v29[1] = SZExtractorOptionsPerformCachedWrites;
  v30[0] = &__kCFBooleanTrue;
  v30[1] = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  int v6 = [(IXSRemoteInstaller *)self coordinator];
  if (![(id)objc_opt_class() _configurePlaceholderPromiseForCoordinator:v6 remoteInstallOptions:v3])
  {
    id v13 = 0;
    id v8 = 0;
LABEL_15:
    id v14 = 0;
    goto LABEL_16;
  }
  id v28 = 0;
  unsigned __int8 v7 = [v6 setInitialODRAssetPromises:&__NSArray0__struct error:&v28];
  id v8 = v28;
  if ((v7 & 1) == 0)
  {
    BOOL v17 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000153BC();
    }

    goto LABEL_14;
  }
  if (![(id)objc_opt_class() _setInstallOptions:v3 forCoordinator:v6])
  {
LABEL_14:
    id v13 = 0;
    goto LABEL_15;
  }
  id v9 = objc_opt_class();
  uint64_t v10 = [(IXSRemoteInstaller *)self xpcAssetStream];
  id v27 = v8;
  unsigned int v11 = [v9 _readAssetFromXPCAssetStream:v10 error:&v27];
  id v12 = v27;

  if ((v11 & 0x80000000) != 0)
  {
    [v6 cancelForReason:v12 client:20 error:0];
    id v13 = 0;
    id v14 = 0;
    id v8 = v12;
    goto LABEL_16;
  }
  unsigned int v21 = v11;
  id v13 = objc_msgSend(objc_alloc((Class)IXPromisedStreamingZipTransfer), "initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:", v4, 20, v5, 0, -[IXSRemoteInstaller assetSize](self, "assetSize"));
  id v14 = [v3 targetLastPathComponent];
  if (!v14)
  {
    id v8 = v12;
LABEL_19:
    uint64_t v18 = v8;
    id v25 = v8;
    unsigned __int8 v19 = [v6 setAppAssetPromise:v13 error:&v25];
    id v8 = v25;

    if (v19)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100010EB0;
      v22[3] = &unk_100020A48;
      v22[4] = self;
      id v13 = v13;
      id v23 = v13;
      unsigned int v24 = v21;
      [v13 preflightWithCompletion:v22];
    }
    else
    {
      uint64_t v20 = sub_10000E748((uint64_t)off_100026DB0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000152C8();
      }
    }
    goto LABEL_16;
  }
  uint64_t v15 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10001533C();
  }

  id v26 = v12;
  unsigned int v16 = [v13 setTargetLastPathComponent:v14 error:&v26];
  id v8 = v26;

  if (v16) {
    goto LABEL_19;
  }
LABEL_16:
}

- (void)beginTransferAndInstall
{
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  id v4 = a3;
  id v5 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100015518();
  }
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  id v10 = [(IXSRemoteInstaller *)self delegate];
  if (v10) {
    objc_msgSend(v10, "remoteInstaller:didUpdateProgress:forPhase:overallProgress:", self, objc_msgSend((id)objc_opt_class(), "_remoteProgressPhaseForPhase:", a5), a4, a6);
  }
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000E748((uint64_t)off_100026DB0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "-[IXSRemoteInstaller coordinatorDidCompleteSuccessfully:forApplicationRecord:]";
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Coordinator completed successfully %@", buf, 0x16u);
  }

  if ([(IXSRemoteInstaller *)self isMultiUser])
  {
    id v9 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 bundleID];
      *(_DWORD *)buf = 136315394;
      id v28 = "-[IXSRemoteInstaller coordinatorDidCompleteSuccessfully:forApplicationRecord:]";
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Resuming sync bubble because the coordinator for %@ completed successfully", buf, 0x16u);
    }
    unsigned int v11 = +[UMUserManager sharedManager];
    [v11 resumeSync];
  }
  id v12 = [(IXSRemoteInstaller *)self delegate];
  if (v12)
  {
    if (v7)
    {
      id v13 = 0;
    }
    else
    {
      id v14 = objc_alloc((Class)LSApplicationRecord);
      uint64_t v15 = [v6 bundleID];
      id v26 = 0;
      id v7 = [v14 initWithBundleIdentifier:v15 allowPlaceholder:0 error:&v26];
      id v13 = v26;

      if (!v7)
      {
        uint64_t v22 = sub_10000E748((uint64_t)off_100026DB0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100015598(v6, v22);
        }

        id v23 = [v6 bundleID];
        uint64_t v25 = sub_100008A20((uint64_t)"-[IXSRemoteInstaller coordinatorDidCompleteSuccessfully:forApplicationRecord:]", 917, @"IXRemoteErrorDomain", 5, v13, 0, @"Install for %@ completed successfully, but LaunchServices did not have a record for it", v24, (uint64_t)v23);

        [v12 remoteInstaller:self canceledWithReason:v25];
        id v7 = 0;
        id v13 = (id)v25;
        goto LABEL_12;
      }
    }
    unsigned int v16 = [IXRemoteInstallResult alloc];
    BOOL v17 = [v7 databaseUUID];
    uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v7 sequenceNumber]);
    unsigned __int8 v19 = [v7 URL];
    uint64_t v20 = [v7 persistentIdentifier];
    unsigned int v21 = [(IXRemoteInstallResult *)v16 initWithDBUUID:v17 dbSequenceNumber:v18 URLOfInstalledApp:v19 persistentIdentifier:v20];

    [v12 remoteInstaller:self completedWithInstallResult:v21];
LABEL_12:
  }
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(IXSRemoteInstaller *)self isMultiUser])
  {
    id v9 = sub_10000E748((uint64_t)off_100026DB0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 bundleID];
      int v13 = 136315394;
      id v14 = "-[IXSRemoteInstaller coordinator:canceledWithReason:client:]";
      __int16 v15 = 2112;
      unsigned int v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Resuming sync bubble because the coordinator for %@ was canceled", (uint8_t *)&v13, 0x16u);
    }
    unsigned int v11 = +[UMUserManager sharedManager];
    [v11 resumeSync];
  }
  id v12 = [(IXSRemoteInstaller *)self delegate];
  [v12 remoteInstaller:self canceledWithReason:v8];
}

- (unsigned)remoteAction
{
  return 1;
}

+ (BOOL)isInstallProhibited
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed] == 2;

  return v3;
}

- (IXSRemoteInstallerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IXSRemoteInstallerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (IXInitiatingOrUpdatingCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (IXRemoteInstallConfiguration)remoteInstallOptions
{
  return self->_remoteInstallOptions;
}

- (void)setRemoteInstallOptions:(id)a3
{
}

- (OS_xpc_object)xpcAssetStream
{
  return self->_xpcAssetStream;
}

- (void)setXpcAssetStream:(id)a3
{
}

- (unint64_t)assetSize
{
  return self->_assetSize;
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (void)setIsMultiUser:(BOOL)a3
{
  self->_isMultiUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcAssetStream, 0);
  objc_storeStrong((id *)&self->_remoteInstallOptions, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end