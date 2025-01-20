void sub_100002C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002C54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002C64(uint64_t a1)
{
}

void sub_100002C6C(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  v5 = [a3 serialNumber];
  if ([v5 isEqualToString:a1[4]])
  {
    unsigned __int8 v6 = [v8 isEqualToString:a1[5]];

    v7 = v8;
    if (v6) {
      goto LABEL_6;
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v8];
  }
  else
  {
  }
  v7 = v8;
LABEL_6:
}

void sub_100003090(id a1)
{
  qword_100042CC8 = objc_alloc_init(FMDAutomationHelperFactory);

  _objc_release_x1();
}

id sub_100003338()
{
  if (qword_100042CD8 != -1) {
    dispatch_once(&qword_100042CD8, &stru_1000346A8);
  }
  v0 = (void *)qword_100042CE0;

  return v0;
}

void sub_10000338C(id a1)
{
  qword_100042CE0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "magSafe");

  _objc_release_x1();
}

NSError *__cdecl sub_1000033D0(id a1, SEL a2, id a3)
{
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = a3;
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v5 = +[NSBundle mainBundle];
  unsigned __int8 v6 = [v5 bundleIdentifier];
  v7 = +[NSError errorWithDomain:v6 code:0 userInfo:v4];

  return (NSError *)v7;
}

void sub_1000047BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_100003338();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v48 = v7;
    __int16 v49 = 2112;
    id v50 = v8;
    __int16 v51 = 2112;
    id v52 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: download task completed with %@ %@ %@", buf, 0x20u);
  }

  v11 = *(void **)(a1 + 32);
  id v46 = 0;
  unsigned __int8 v12 = [v11 isValidReponse:v8 validationError:&v46];
  id v13 = v46;
  if (!v13)
  {
    if ((v12 & 1) == 0)
    {
      v35 = sub_100003338();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10001E988(a1, v8, v35);
      }

      uint64_t v21 = *(void *)(a1 + 64);
      uint64_t v22 = 0;
      goto LABEL_23;
    }
    id v23 = v8;
    if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || [v23 statusCode] != (id)200)
    {
      (*(void (**)(void, void, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 0, v9);
      goto LABEL_24;
    }
    v24 = [*(id *)(a1 + 48) stringByDeletingLastPathComponent];
    v25 = sub_100003338();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: dir location = %@", buf, 0xCu);
    }

    if (([*(id *)(a1 + 56) fileExistsAtPath:v24] & 1) == 0)
    {
      v26 = *(void **)(a1 + 56);
      id v45 = 0;
      unsigned __int8 v27 = [v26 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:&v45];
      id v28 = v45;
      id v29 = v28;
      if ((v27 & 1) == 0)
      {
        v36 = sub_100003338();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10001E918(v36, v37, v38, v39, v40, v41, v42, v43);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        goto LABEL_30;
      }
    }
    v30 = *(void **)(a1 + 56);
    v31 = +[NSURL fileURLWithPath:*(void *)(a1 + 48)];
    id v44 = 0;
    [v30 moveItemAtURL:v7 toURL:v31 error:&v44];
    id v29 = v44;

    v32 = sub_100003338();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v29;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: copy completed with error %@", buf, 0xCu);
    }

    uint64_t v33 = *(void *)(a1 + 64);
    if (v29)
    {
      v34 = +[NSError fm_genericError];
      (*(void (**)(uint64_t, void, void *))(v33 + 16))(v33, 0, v34);
    }
    else
    {
      (*(void (**)(void, void, void))(v33 + 16))(*(void *)(a1 + 64), *(void *)(a1 + 48), 0);
    }
LABEL_30:

    goto LABEL_24;
  }
  v14 = sub_100003338();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10001EA60((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
  }

  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v22 = 1;
LABEL_23:
  id v23 = +[NSError errorWithDomain:@"com.apple.icloud.findmydevice.RemoteAsset" code:v22 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v21 + 16))(v21, 0, v23);
LABEL_24:
}

void sub_100004D70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004EF4(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = sub_100003338();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10001EACC();
  }
}

void sub_1000050D8(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = sub_100003338();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10001EACC();
  }
}

id sub_100005368(uint64_t a1)
{
  v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "did not get accessory showing attach screen", v4, 2u);
  }

  return [*(id *)(a1 + 32) progressFlowWithState:1];
}

id sub_1000053E0(uint64_t a1)
{
  v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "did not get accessory ending setup", v4, 2u);
  }

  return [*(id *)(a1 + 32) setupEnded];
}

void sub_100005864(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentedCard];
  if (v2
    && (id v3 = (void *)v2,
        [*(id *)(a1 + 32) presentedCard],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isBeingPresented],
        v4,
        v3,
        v5))
  {
    unsigned __int8 v6 = [*(id *)(a1 + 32) presentedCard];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005980;
    v8[3] = &unk_100034760;
    v8[4] = *(void *)(a1 + 32);
    [v6 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    [*(id *)(a1 + 32) setPresentedCard:0];
    id v7 = [*(id *)(a1 + 32) remoteVCProxy];
    [v7 deactivate];
  }
}

void sub_100005980(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentedCard:0];
  id v2 = [*(id *)(a1 + 32) remoteVCProxy];
  [v2 deactivate];
}

void sub_100006024(uint64_t a1)
{
  id v2 = dispatch_group_create();
  id v3 = +[FMDAccessoryTypeValidator sharedInstance];
  v4 = [*(id *)(a1 + 32) accessoryType];
  if ([v3 isAllowedAccessoryWithType:v4])
  {
    unsigned int v5 = [*(id *)(a1 + 32) isMF4i];

    if (v5)
    {
      [*(id *)(a1 + 32) getPairingStatus];
      if ([*(id *)(a1 + 32) isNVMSetup])
      {
        if (([*(id *)(a1 + 32) keysAvailable] & 1) == 0)
        {
          dispatch_group_enter(v2);
          unsigned __int8 v6 = *(void **)(a1 + 32);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100006598;
          v44[3] = &unk_100034788;
          id v45 = v6;
          id v7 = v2;
          id v46 = v7;
          +[FMDPairingCheckHelper pairingCheckForAccessory:v45 completion:v44];
          dispatch_time_t v8 = dispatch_time(0, 10000000000);
          if (dispatch_group_wait(v7, v8))
          {
            uint64_t v9 = sub_100003338();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              sub_10001EBD0();
            }
          }
        }
      }
    }
  }
  else
  {
  }
  if (([*(id *)(a1 + 32) isNVMSetup] & 1) == 0)
  {
    uint64_t v19 = [FMDRemoteAsset alloc];
    uint64_t v20 = [*(id *)(a1 + 32) accessoryType];
    uint64_t v21 = [*(id *)(a1 + 32) style];
    id v13 = [(FMDRemoteAsset *)v19 initWithAccessoryType:v20 style:v21 type:0];

    dispatch_group_enter(v2);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000066CC;
    v42[3] = &unk_1000347B0;
    uint64_t v22 = v2;
    uint64_t v43 = v22;
    [(FMDRemoteAsset *)v13 fetchAssetWithCompletion:v42];
    id v23 = [FMDRemoteAsset alloc];
    v24 = [*(id *)(a1 + 32) accessoryType];
    v25 = [*(id *)(a1 + 32) style];
    v26 = [(FMDRemoteAsset *)v23 initWithAccessoryType:v24 style:v25 type:1];

    dispatch_group_enter(v22);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000067A8;
    v40[3] = &unk_1000347B0;
    unsigned __int8 v27 = v22;
    uint64_t v41 = v27;
    [(FMDRemoteAsset *)v26 fetchAssetWithCompletion:v40];
    dispatch_time_t v28 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v27, v28))
    {
      id v29 = sub_100003338();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10001EB9C();
      }
    }
    unsigned int v30 = [*(id *)(a1 + 40) isRestrictedSKU];
    v31 = [FMDRemoteAsset alloc];
    v32 = [*(id *)(a1 + 32) accessoryType];
    uint64_t v33 = [*(id *)(a1 + 32) style];
    if (v30)
    {
      v34 = [(FMDRemoteAsset *)v31 initWithAccessoryType:v32 style:v33 type:3];

      v35 = &stru_1000347F0;
    }
    else
    {
      v34 = [(FMDRemoteAsset *)v31 initWithAccessoryType:v32 style:v33 type:2];

      v35 = &stru_100034810;
    }
    [(FMDRemoteAsset *)v34 fetchAssetWithCompletion:v35];

    v14 = v43;
    goto LABEL_28;
  }
  if ([*(id *)(a1 + 32) isNVMSetup]
    && ([*(id *)(a1 + 32) keysAvailable] & 1) == 0)
  {
    id v10 = [FMDRemoteAsset alloc];
    v11 = [*(id *)(a1 + 32) accessoryType];
    unsigned __int8 v12 = [*(id *)(a1 + 32) style];
    id v13 = [(FMDRemoteAsset *)v10 initWithAccessoryType:v11 style:v12 type:3];

    v14 = [(FMDRemoteAsset *)v13 getStoredAssetLocation];
    if (!v14)
    {
      uint64_t v15 = dispatch_group_create();
      dispatch_group_enter(v15);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100006A24;
      v38[3] = &unk_1000347B0;
      uint64_t v16 = v15;
      uint64_t v39 = v16;
      [(FMDRemoteAsset *)v13 fetchAssetWithCompletion:v38];
      dispatch_time_t v17 = dispatch_time(0, 3000000000);
      if (dispatch_group_wait(v16, v17))
      {
        uint64_t v18 = sub_100003338();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10001EB9C();
        }
      }
    }
LABEL_28:
  }
  [*(id *)(a1 + 40) setPhysicalAccessory:*(void *)(a1 + 32)];
  v36 = *(void **)(a1 + 40);
  uint64_t v37 = [v36 physicalAccessory];
  [v36 prepareForSetupFlowFor:v37];
}

void sub_100006598(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "pairingCheckForAccessory completed with error = %@ lostModeInfo = %@", (uint8_t *)&v10, 0x16u);
  }

  if (!v5 && v6)
  {
    dispatch_time_t v8 = [v6 objectForKeyedSubscript:@"ownerNumber"];
    [*(id *)(a1 + 32) setPhoneNumber:v8];

    uint64_t v9 = [v6 objectForKeyedSubscript:@"email"];
    [*(id *)(a1 + 32) setEmail:v9];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000066CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remoteAsset pairing video fetched with path %@ error %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000067A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remoteAsset pairing video adjustments fetched with path %@ error %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100006884(id a1, NSString *a2, NSError *a3)
{
  v4 = a2;
  id v5 = a3;
  id v6 = sub_100003338();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    int v8 = v4;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "remoteAsset fetched with path %@ error %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_100006954(id a1, NSString *a2, NSError *a3)
{
  v4 = a2;
  id v5 = a3;
  id v6 = sub_100003338();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    int v8 = v4;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "remoteAsset map image fetched with path %@ error %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_100006A24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remoteAsset fetched with path %@ error %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100007338(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accessory removed with error %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000076CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000076F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007704(uint64_t a1)
{
}

void sub_10000770C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accessory set name completed with error %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000077E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accessory added with error %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000079CC(uint64_t a1)
{
  switch(*(void *)(a1 + 40))
  {
    case 1:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardAttachAccessory];
      goto LABEL_17;
    case 2:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardAlreadyAttached];
      goto LABEL_17;
    case 3:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardUnsupportedAccessory];
      goto LABEL_17;
    case 4:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardLockedFindMyNotPaired];
      goto LABEL_17;
    case 5:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardUnlockedStartFlow];
      goto LABEL_17;
    case 6:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardSetupFindmy];
      goto LABEL_17;
    case 7:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardSetupComplete];
      goto LABEL_17;
    case 8:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardSetupError];
      goto LABEL_17;
    case 9:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardNonOwnerLockedDevice];
      goto LABEL_17;
    case 0xALL:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardNonOwnerUnlocked];
      goto LABEL_17;
    case 0xBLL:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardNoAccount];
      goto LABEL_17;
    case 0xCLL:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardUpgradeAccountSecurity];
      goto LABEL_17;
    case 0xDLL:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardUpgradeAccountSecurityError];
      goto LABEL_17;
    case 0xELL:
      uint64_t v2 = [*(id *)(a1 + 32) proxCardSpinner];
LABEL_17:
      id v3 = (void *)v2;
      break;
    default:
      id v3 = 0;
      break;
  }
  [*(id *)(a1 + 32) setProxCardState:*(void *)(a1 + 40)];
  v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) presentedCard];
    int v13 = 138412546;
    v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDMagSafeSetupRemoteUIViewController: nextCard = %@ %@", (uint8_t *)&v13, 0x16u);
  }
  id v6 = [*(id *)(a1 + 32) presentedCard];

  if (v6)
  {
    if (!v3)
    {
      __int16 v12 = [*(id *)(a1 + 32) presentedCard];
      [v12 dismissViewControllerAnimated:1 completion:0];

      goto LABEL_30;
    }
    id v7 = sub_100003338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDMagSafeSetupRemoteUIViewController: pushing view cotroler %@", (uint8_t *)&v13, 0xCu);
    }

    int v8 = [*(id *)(a1 + 32) presentedCard];
    id v9 = [v8 navigationController];
    [v9 pushViewController:v3 animated:1];
  }
  else
  {
    __int16 v10 = *(void **)(a1 + 32);
    if (!v3)
    {
      [v10 setupEnded];
      goto LABEL_30;
    }
    id v11 = [v10 presentProxCardFlowWithDelegate:*(void *)(a1 + 32) initialViewController:v3];
  }
  [*(id *)(a1 + 32) setPresentedCard:v3];
LABEL_30:
}

void sub_100008114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008140(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = sub_100010114();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "add to FindMy button tapped", v3, 2u);
  }

  [WeakRetained continueWithAccountValidationFlow];
}

void sub_1000082D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) physicalAccessory];
  id v3 = objc_alloc_init((Class)FMDPairingLockRegisterRequestInfo);
  v4 = [v2 serialNumber];
  [v3 setSerialNumber:v4];

  uint64_t v5 = [v2 accessoryType];
  [v3 setAccessoryType:v5];

  id v6 = dispatch_group_create();
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v3 serialNumber];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Doing register to server for accessory with serial number = %@", (uint8_t *)&buf, 0xCu);
  }
  dispatch_group_enter(v6);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v116 = 0x3032000000;
  v117 = sub_1000076F4;
  v118 = sub_100007704;
  id v119 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = sub_1000076F4;
  v107 = sub_100007704;
  id v108 = 0;
  id v9 = +[FMDFMIPManager sharedInstance];
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_1000091DC;
  v99[3] = &unk_100034900;
  v101 = &v103;
  p_long long buf = &buf;
  __int16 v10 = v6;
  v100 = v10;
  [v9 registerDeviceForPairingLock:v3 completion:v99];

  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  intptr_t v12 = dispatch_group_wait(v10, v11);
  if (!v104[5] && !v12)
  {
    int v13 = *(void **)(*((void *)&buf + 1) + 40);
    if (v13)
    {
      v14 = [v13 pairingToken];
      if (v14)
      {
        __int16 v15 = [*(id *)(*((void *)&buf + 1) + 40) serialNumber];
        BOOL v16 = v15 == 0;

        if (!v16)
        {
          dispatch_time_t v17 = sub_100003338();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v109) = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "provisioning keys to mulder", (uint8_t *)&v109, 2u);
          }

          dispatch_group_enter(v10);
          v96[0] = _NSConcreteStackBlock;
          v96[1] = 3221225472;
          v96[2] = sub_1000092F0;
          v96[3] = &unk_100034888;
          v98 = &v103;
          uint64_t v18 = v10;
          v97 = v18;
          [v2 setupKeysWithCompletion:v96];
          dispatch_time_t v19 = dispatch_time(0, 5000000000);
          intptr_t v20 = dispatch_group_wait(v18, v19);
          if (v104[5] || v20)
          {
            v47 = sub_100003338();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              sub_10001EDC4();
            }

            uint64_t v48 = *(void *)(a1 + 40);
            if (v104[5])
            {
              (*(void (**)(uint64_t))(v48 + 16))(v48);
LABEL_83:
              id v46 = v97;
              goto LABEL_84;
            }
            __int16 v51 = +[NSError fm_timeoutError];
            (*(void (**)(uint64_t, void *))(v48 + 16))(v48, v51);
LABEL_82:

            goto LABEL_83;
          }
          id v94 = 0;
          id v95 = 0;
          +[FMDCryptoUtil generatePublicPrivateKeyPair:&v95 privateKey:&v94];
          id v21 = v95;
          id v79 = v94;
          uint64_t v22 = sub_100003338();
          v78 = v21;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            [v21 fm_hexString];
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            v24 = [v79 fm_hexString];
            sub_10001EE60(v23, v24, v114, v22);
          }

          v25 = sub_100003338();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v109) = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "setting up pairing data", (uint8_t *)&v109, 2u);
          }

          v26 = objc_alloc_init(FMDRemoteUnlockPairingData);
          unsigned __int8 v27 = [*(id *)(*((void *)&buf + 1) + 40) pairingToken];
          dispatch_time_t v28 = +[NSData dataWithHexString:v27];
          [(FMDRemoteUnlockPairingData *)v26 setPairingCheckToken:v28];

          [(FMDRemoteUnlockPairingData *)v26 setLostModePrivateKey:v79];
          id v29 = sub_100003338();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v30 = [(FMDRemoteUnlockPairingData *)v26 pairingCheckToken];
            LODWORD(v109) = 138412290;
            *(void *)((char *)&v109 + 4) = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "data size = %@", (uint8_t *)&v109, 0xCu);
          }
          dispatch_group_enter(v18);
          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472;
          v91[2] = sub_1000093CC;
          v91[3] = &unk_100034888;
          v93 = &v103;
          v31 = v18;
          v92 = v31;
          [v2 setPairingData:v26 withCompletion:v91];
          dispatch_time_t v32 = dispatch_time(0, 5000000000);
          intptr_t v33 = dispatch_group_wait(v31, v32);
          if (v104[5] || v33)
          {
            __int16 v49 = sub_100003338();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
              sub_10001EDC4();
            }

            uint64_t v50 = *(void *)(a1 + 40);
            if (v104[5])
            {
              (*(void (**)(uint64_t))(v50 + 16))(v50);
            }
            else
            {
              v54 = +[NSError fm_timeoutError];
              (*(void (**)(uint64_t, void *))(v50 + 16))(v50, v54);
            }
            goto LABEL_81;
          }
          v34 = sub_100003338();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v109) = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "getting user private key", (uint8_t *)&v109, 2u);
          }

          dispatch_group_enter(v31);
          *(void *)&long long v109 = 0;
          *((void *)&v109 + 1) = &v109;
          uint64_t v110 = 0x3032000000;
          v111 = sub_1000076F4;
          v112 = sub_100007704;
          id v113 = 0;
          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472;
          v87[2] = sub_1000094A8;
          v87[3] = &unk_100034928;
          v89 = &v103;
          v90 = &v109;
          v35 = v31;
          v88 = v35;
          [v2 copyUserPrivateKeyWithCompletion:v87];
          dispatch_time_t v36 = dispatch_time(0, 5000000000);
          intptr_t v37 = dispatch_group_wait(v35, v36);
          if (v104[5] || v37)
          {
            id v52 = sub_100003338();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
              sub_10001EDC4();
            }

            uint64_t v53 = *(void *)(a1 + 40);
            if (v104[5])
            {
              (*(void (**)(uint64_t))(v53 + 16))(v53);
LABEL_80:

              _Block_object_dispose(&v109, 8);
LABEL_81:

              __int16 v51 = v78;
              goto LABEL_82;
            }
            v55 = +[NSError fm_timeoutError];
            (*(void (**)(uint64_t, void *))(v53 + 16))(v53, v55);
LABEL_79:

            goto LABEL_80;
          }
          if (v78 && *(void *)(*((void *)&v109 + 1) + 40))
          {
            uint64_t v38 = objc_alloc_init((Class)FMDPairingLockUpdateRequestInfo);
            uint64_t v39 = [*(id *)(*((void *)&buf + 1) + 40) pairingToken];
            [v38 setPairingCheckToken:v39];

            uint64_t v40 = [v78 fm_hexString];
            [v38 setLostModePubKey:v40];

            uint64_t v41 = *(void *)(*((void *)&v109 + 1) + 40);
            if (v41)
            {
              uint64_t v42 = [*(id *)(*((void *)&v109 + 1) + 40) fm_hexString];
            }
            else
            {
              uint64_t v42 = 0;
            }
            [v38 setUserPrivateKey:v42];
            if (v41) {

            }
            v56 = [v2 serialNumber];
            [v38 setSerialNumber:v56];

            v57 = +[NSDate date];
            v58 = [NSString stringWithFormat:@"%lld" fm_epoch];
            [v38 setTimeStamp:v58];

            v59 = +[FMDFMIPManager sharedInstance];
            [v59 updatePairingLockInfo:v38 completion:&stru_100034948];
          }
          else
          {
            uint64_t v38 = sub_100003338();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              sub_10001EE2C();
            }
          }

          v60 = sub_100003338();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "setting the device name", v86, 2u);
          }

          v55 = [*(id *)(a1 + 32) _computeName];
          dispatch_group_enter(v35);
          v83[0] = _NSConcreteStackBlock;
          v83[1] = 3221225472;
          v83[2] = sub_10000965C;
          v83[3] = &unk_100034888;
          v85 = &v103;
          v61 = v35;
          v84 = v61;
          [v2 setName:v55 withCompletion:v83];
          dispatch_time_t v62 = dispatch_time(0, 5000000000);
          intptr_t v63 = dispatch_group_wait(v61, v62);
          if (v104[5] || v63)
          {
            v73 = sub_100003338();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
              sub_10001EDC4();
            }

            uint64_t v74 = *(void *)(a1 + 40);
            if (v104[5])
            {
              (*(void (**)(uint64_t))(v74 + 16))(v74);
LABEL_78:

              goto LABEL_79;
            }
            v67 = +[NSError fm_timeoutError];
            (*(void (**)(uint64_t, FMDMagSafeAccessory *))(v74 + 16))(v74, v67);
          }
          else
          {
            v64 = sub_100003338();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v86 = 0;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "adding device to data store", v86, 2u);
            }

            dispatch_group_enter(v61);
            v65 = [FMDMagSafeAccessory alloc];
            v66 = [*(id *)(a1 + 32) physicalAccessory];
            v67 = [(FMDMagSafeAccessory *)v65 initWithPhysicalAccessory:v66 fmEnabled:1];

            [*(id *)(a1 + 32) setMagSafeAccessory:v67];
            v68 = +[FMDMagSafeDataStore sharedInstance];
            v80[0] = _NSConcreteStackBlock;
            v80[1] = 3221225472;
            v80[2] = sub_100009734;
            v80[3] = &unk_100034888;
            v82 = &v103;
            v69 = v61;
            v81 = v69;
            [v68 addAccessory:v67 withCompletion:v80];

            dispatch_time_t v70 = dispatch_time(0, 5000000000);
            intptr_t v71 = dispatch_group_wait(v69, v70);
            if (v104[5] || v71)
            {
              v75 = sub_100003338();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                sub_10001EDC4();
              }

              uint64_t v76 = *(void *)(a1 + 40);
              if (v104[5])
              {
                (*(void (**)(uint64_t))(v76 + 16))(v76);
              }
              else
              {
                v77 = +[NSError fm_timeoutError];
                (*(void (**)(uint64_t, void *))(v76 + 16))(v76, v77);
              }
            }
            else
            {
              v72 = sub_100003338();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v86 = 0;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Find My setup completed", v86, 2u);
              }

              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
            }
          }
          goto LABEL_78;
        }
      }
    }
    uint64_t v45 = *(void *)(a1 + 40);
    id v46 = +[NSError errorWithMessage:@"Invalid register response"];
    (*(void (**)(uint64_t, void *))(v45 + 16))(v45, v46);
LABEL_84:

    goto LABEL_85;
  }
  uint64_t v43 = sub_100003338();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
    sub_10001EDC4();
  }

  uint64_t v44 = *(void *)(a1 + 40);
  if (!v104[5])
  {
    id v46 = +[NSError fm_timeoutError];
    (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v46);
    goto LABEL_84;
  }
  (*(void (**)(void))(v44 + 16))(*(void *)(a1 + 40));
LABEL_85:

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&buf, 8);
}

void sub_100009140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose((const void *)(v55 - 256), 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000091DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "registerDeviceForPairingLock completed with error = %@ %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  intptr_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000092F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setupKeysWithCompletion completed with error = %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000093CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setPairingData completed with error = %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000094A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  id v10 = sub_100003338();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setName completed with error = %@", (uint8_t *)&v11, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000095B0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100003338();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "pairingKeyUpdated with error = %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000965C(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setName completed with error = %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100009734(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "add to data store completed with error = %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100009D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009D58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];

  uint64_t v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "operation cancelled", v3, 2u);
  }
}

void sub_10000A060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A08C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];

  uint64_t v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "operation cancelled", v3, 2u);
  }
}

void sub_10000A394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A3C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];

  uint64_t v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "operation cancelled", v3, 2u);
  }
}

void sub_10000A5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A60C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v2 = (unint64_t)[*(id *)(a1 + 32) accountState];
  if (v2 <= 3) {
    [WeakRetained progressFlowWithState:qword_100025D78[v2]];
  }
}

void sub_10000A7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A7D4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000AC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AC60(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] view];
  [v4 setUserInteractionEnabled:0];

  id v5 = a1[4];
  int v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADDING" value:&stru_100036130 table:0];
  [v5 showActivityIndicatorWithStatus:v7];

  if (([a1[5] isFindMyAppInstalled] & 1) == 0) {
    [a1[5] triggerFindMyAppInstallation];
  }
  id v8 = a1[5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000ADA0;
  v9[3] = &unk_1000349E8;
  objc_copyWeak(&v10, a1 + 6);
  [v8 enableFindMyWithCompletion:v9];
  objc_destroyWeak(&v10);
}

void sub_10000AD8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000ADA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    int v6 = sub_100003338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001EFC0();
    }

    [WeakRetained progressFlowWithState:8];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000AEAC;
    v7[3] = &unk_1000349E8;
    objc_copyWeak(&v8, v4);
    [WeakRetained setUpFindMyWithCompletion:v7];
    objc_destroyWeak(&v8);
  }
}

void sub_10000AE98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AEAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3)
  {
    int v6 = sub_100003338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001F068();
    }

    [v5 progressFlowWithState:8];
  }
  else
  {
    [WeakRetained postNotification:@"com.apple.icloud.findmydeviced.findkit.magSafe.added"];
    id v7 = sub_100003338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10001F028();
    }

    dispatch_time_t v8 = dispatch_time(0, 8000000000);
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AFFC;
    block[3] = &unk_100034760;
    block[4] = v5;
    dispatch_after(v8, v9, block);
  }
}

id sub_10000AFFC(uint64_t a1)
{
  unint64_t v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10001F0D0();
  }

  return [*(id *)(a1 + 32) progressFlowWithState:7];
}

void sub_10000BA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BAE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained progressFlowWithState:0];

  id v3 = [*(id *)(a1 + 32) physicalAccessory];
  id v4 = [v3 serialNumber];
  id v5 = +[NSString stringWithFormat:@"fmip1://device/device?sn=%@", v4];

  int v6 = +[LSApplicationWorkspace defaultWorkspace];
  id v7 = +[NSURL URLWithString:v5];
  uint64_t v9 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  id v10 = &__kCFBooleanTrue;
  dispatch_time_t v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v6 openSensitiveURL:v7 withOptions:v8];
}

void sub_10000BC2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];
}

void sub_10000BFF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_10000C030(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained progressFlowWithState:0];

  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = +[NSString stringWithFormat:@"mailto:%@", *(void *)(a1 + 32)];
    id v4 = +[NSURLComponents componentsWithString:v3];
  }
  else
  {
    id v4 = +[NSURLComponents componentsWithString:@"sms://open"];
    id v3 = +[NSURLQueryItem queryItemWithName:@"address" value:*(void *)(a1 + 32)];
    id v12 = v3;
    id v5 = +[NSArray arrayWithObjects:&v12 count:1];
    [v4 setQueryItems:v5];
  }
  int v6 = +[NSError fm_genericError];
  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  dispatch_time_t v8 = [v4 URL];
  id v11 = v6;
  [v7 openURL:v8 withOptions:0 error:&v11];
  id v9 = v11;

  if (v9)
  {
    id v10 = sub_100003338();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001F110();
    }
  }
}

void sub_10000C204(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];

  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v2 = +[NSURL URLWithString:@"https://support.apple.com/kb/HT210982"];
  [v3 openURL:v2 withOptions:0];
}

void sub_10000C520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C54C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];
}

void sub_10000C6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C6D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];

  uint64_t v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "waiting to be implemented", v3, 2u);
  }
}

void sub_10000CB8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CBB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  dispatch_time_t v8 = sub_10000CCBC;
  id v9 = &unk_100034A60;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  uint64_t v10 = *(void *)(a1 + 32);
  SBSRequestPasscodeUnlockUI();
  id v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "waiting for unlock", v5, 2u);
  }

  objc_destroyWeak(&v11);
}

void sub_10000CCA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000CCBC(uint64_t a1, int a2)
{
  id v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SBSRequestPasscodeUnlockUI unlocked = %d", (uint8_t *)v8, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && ([*(id *)(a1 + 32) isLocked] & 1) == 0)
  {
    uint64_t v7 = sub_100003338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "device unlocked", (uint8_t *)v8, 2u);
    }

    [WeakRetained continueWithAccountValidationFlow];
  }
  else
  {
    [WeakRetained progressFlowWithState:0];
    int v6 = sub_100003338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device locked", (uint8_t *)v8, 2u);
    }
  }
}

void sub_10000D094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D0BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  dispatch_time_t v8 = sub_10000D1C0;
  id v9 = &unk_100034A88;
  uint64_t v10 = *(void *)(a1 + 32);
  objc_copyWeak(&v11, (id *)(a1 + 40));
  SBSRequestPasscodeUnlockUI();
  id v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "waiting for unlock", v5, 2u);
  }

  objc_destroyWeak(&v11);
}

void sub_10000D1A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000D1C0(uint64_t a1, int a2)
{
  id v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SBSRequestPasscodeUnlockUI unlocked = %d", (uint8_t *)v8, 8u);
  }

  if (a2 && ([*(id *)(a1 + 32) isLocked] & 1) == 0)
  {
    uint64_t v7 = sub_100003338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "device unlocked", (uint8_t *)v8, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained progressFlowWithState:10];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    [v5 progressFlowWithState:0];

    id WeakRetained = sub_100003338();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "device locked", (uint8_t *)v8, 2u);
    }
  }
}

void sub_10000D8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D8CC(uint64_t a1)
{
  uint64_t v2 = +[NSError fm_genericError];
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  id v4 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
  uint64_t v12 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  id v13 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v11 = v2;
  [v3 openSensitiveURL:v4 withOptions:v5 error:&v11];
  id v6 = v11;

  if (v6)
  {
    uint64_t v7 = sub_100003338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001F110();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];

  id v9 = sub_100003338();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "operation cancelled", v10, 2u);
  }
}

void sub_10000DD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000DD48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained upgradeAccountButtonPressedOn:*(void *)(a1 + 32)];
}

void sub_10000DFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E008(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progressFlowWithState:0];

  uint64_t v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "operation cancelled", v3, 2u);
  }
}

void sub_10000E81C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000E838(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_ALERT_SET_UP_WALLET_LATER_TITLE" value:&stru_100036130 table:0];

    uint64_t v7 = +[NSBundle mainBundle];
    dispatch_time_t v8 = [v7 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_ALERT_SET_UP_WALLET_LATER_MESSAGE" value:&stru_100036130 table:0];

    id v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_ALERT_SET_UP_WALLET_LATER_CONFIRM" value:&stru_100036130 table:0];

    id v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"MAGSAFE_PAIRING_UPSELL_ALERT_SET_UP_WALLET_LATER_CANCEL" value:&stru_100036130 table:0];

    id v13 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000EAA8;
    v16[3] = &unk_100034AF8;
    v16[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v17, (id *)(a1 + 40));
    int v14 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v16];
    [v13 addAction:v14];
    id v15 = +[UIAlertAction actionWithTitle:v12 style:1 handler:0];
    [v13 addAction:v15];

    [v13 setPreferredAction:v14];
    [WeakRetained presentViewController:v13 animated:1 completion:0];

    objc_destroyWeak(&v17);
  }
}

void sub_10000EA90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000EAA8(uint64_t a1)
{
  [*(id *)(a1 + 32) storeAccessoryAsNotFindmyEnabled:&stru_100034AD0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

void sub_10000EB1C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100003338();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10001F178();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "storeAccessoryAsNotFindmyEnabled completed with success", v5, 2u);
  }
}

void sub_10000F5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F5D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = sub_100003338();
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001F36C(v4);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Installation of Find My started successfully.", buf, 2u);
    }

    id v10 = 0;
    dispatch_time_t v8 = +[IXAppInstallCoordinator existingCoordinatorForAppWithBundleID:@"com.apple.findmy" error:&v10];
    uint64_t v7 = v10;
    if (v7)
    {
      id v9 = sub_100003338();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001F2E8(v7);
      }
    }
    else
    {
      [WeakRetained setAppInstallCoordinator:v8];
    }
  }
}

void sub_10000FA88(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) physicalAccessory];
  id v3 = [v2 serialNumber];
  id v4 = +[FMDExtHelper deviceIDFromAddress:v3];

  [*(id *)(a1 + 32) _removeAccessoryToDataStoreWithID:v4];
  [*(id *)(a1 + 32) launchSettingsAppUpgradeFlow];
  [*(id *)(a1 + 32) progressFlowWithState:0];
}

void sub_100010090(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000100B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000100CC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000100F4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100010114()
{
  if (qword_100042CF8 != -1) {
    dispatch_once(&qword_100042CF8, &stru_100034B78);
  }
  v0 = (void *)qword_100042D00;

  return v0;
}

void sub_100010168(id a1)
{
  qword_100042D00 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");

  _objc_release_x1();
}

id sub_1000101AC()
{
  if (qword_100042D08 != -1) {
    dispatch_once(&qword_100042D08, &stru_100034B98);
  }
  v0 = (void *)qword_100042D10;

  return v0;
}

void sub_100010200(id a1)
{
  qword_100042D10 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");

  _objc_release_x1();
}

id sub_100010244()
{
  if (qword_100042D18 != -1) {
    dispatch_once(&qword_100042D18, &stru_100034BB8);
  }
  v0 = (void *)qword_100042D20;

  return v0;
}

void sub_100010298(id a1)
{
  qword_100042D20 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");

  _objc_release_x1();
}

id sub_1000102DC()
{
  if (qword_100042D28 != -1) {
    dispatch_once(&qword_100042D28, &stru_100034BD8);
  }
  v0 = (void *)qword_100042D30;

  return v0;
}

void sub_100010330(id a1)
{
  qword_100042D30 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");

  _objc_release_x1();
}

id sub_100010374()
{
  if (qword_100042D38 != -1) {
    dispatch_once(&qword_100042D38, &stru_100034BF8);
  }
  v0 = (void *)qword_100042D40;

  return v0;
}

void sub_1000103C8(id a1)
{
  qword_100042D40 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");

  _objc_release_x1();
}

id sub_10001040C()
{
  if (qword_100042D48 != -1) {
    dispatch_once(&qword_100042D48, &stru_100034C18);
  }
  v0 = (void *)qword_100042D50;

  return v0;
}

void sub_100010460(id a1)
{
  qword_100042D50 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");

  _objc_release_x1();
}

id sub_1000104A4()
{
  if (qword_100042D58 != -1) {
    dispatch_once(&qword_100042D58, &stru_100034C38);
  }
  v0 = (void *)qword_100042D60;

  return v0;
}

void sub_1000104F8(id a1)
{
  qword_100042D60 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");

  _objc_release_x1();
}

id sub_10001053C()
{
  if (qword_100042D68 != -1) {
    dispatch_once(&qword_100042D68, &stru_100034C58);
  }
  v0 = (void *)qword_100042D70;

  return v0;
}

void sub_100010590(id a1)
{
  qword_100042D70 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");

  _objc_release_x1();
}

id sub_1000105D4()
{
  if (qword_100042D78 != -1) {
    dispatch_once(&qword_100042D78, &stru_100034C78);
  }
  v0 = (void *)qword_100042D80;

  return v0;
}

void sub_100010628(id a1)
{
  qword_100042D80 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");

  _objc_release_x1();
}

id sub_10001066C()
{
  if (qword_100042D88 != -1) {
    dispatch_once(&qword_100042D88, &stru_100034C98);
  }
  v0 = (void *)qword_100042D90;

  return v0;
}

void sub_1000106C0(id a1)
{
  qword_100042D90 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");

  _objc_release_x1();
}

id sub_100010704()
{
  if (qword_100042D98 != -1) {
    dispatch_once(&qword_100042D98, &stru_100034CB8);
  }
  v0 = (void *)qword_100042DA0;

  return v0;
}

void sub_100010758(id a1)
{
  qword_100042DA0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");

  _objc_release_x1();
}

id sub_10001079C()
{
  if (qword_100042DA8 != -1) {
    dispatch_once(&qword_100042DA8, &stru_100034CD8);
  }
  v0 = (void *)qword_100042DB0;

  return v0;
}

void sub_1000107F0(id a1)
{
  qword_100042DB0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");

  _objc_release_x1();
}

id sub_100010834()
{
  if (qword_100042DB8 != -1) {
    dispatch_once(&qword_100042DB8, &stru_100034CF8);
  }
  v0 = (void *)qword_100042DC0;

  return v0;
}

void sub_100010888(id a1)
{
  qword_100042DC0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");

  _objc_release_x1();
}

id sub_1000108CC()
{
  if (qword_100042DC8 != -1) {
    dispatch_once(&qword_100042DC8, &stru_100034D18);
  }
  v0 = (void *)qword_100042DD0;

  return v0;
}

void sub_100010920(id a1)
{
  qword_100042DD0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");

  _objc_release_x1();
}

id sub_100010964()
{
  if (qword_100042DD8 != -1) {
    dispatch_once(&qword_100042DD8, &stru_100034D38);
  }
  v0 = (void *)qword_100042DE0;

  return v0;
}

void sub_1000109B8(id a1)
{
  qword_100042DE0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");

  _objc_release_x1();
}

id sub_1000109FC()
{
  if (qword_100042DE8 != -1) {
    dispatch_once(&qword_100042DE8, &stru_100034D58);
  }
  v0 = (void *)qword_100042DF0;

  return v0;
}

void sub_100010A50(id a1)
{
  if (+[FMPreferencesUtil BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"])
  {
    qword_100042DF0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    _objc_release_x1();
  }
}

void sub_100011650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011678(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011688(uint64_t a1)
{
}

void sub_100011690(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  dispatch_time_t v8 = sub_100003338();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA getAccessoryUserName completed with error %@ %@", (uint8_t *)&v9, 0x16u);
  }

  if (!v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100011A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011AB4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100003338();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA getPairingStatus completed with error %@ %lu", (uint8_t *)&v8, 0x16u);
  }

  if (!v5) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100011F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011F84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#CA setPublicNVMKeyValues completed with error %@", (uint8_t *)&v6, 0xCu);
  }

  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setPairingData:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100012238(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CA getPublicNVMKeyValues completed with error %@ %@", buf, 0x16u);
  }

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init((Class)NSMutableData);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      uint64_t v21 = a1;
      uint64_t v22 = 0;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v15 = [v14 description:v21, v22, v23];
          __int16 v16 = [v5 objectForKeyedSubscript:v15];

          if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            id v17 = sub_100003338();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10001F458((uint64_t)v14, (uint64_t)v16, v17);
            }

            a1 = v21;
            id v6 = v22;
            goto LABEL_18;
          }
          [v8 appendData:v16];
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        a1 = v21;
        id v6 = v22;
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    uint64_t v18 = [[FMDRemoteUnlockPairingData alloc] initWithData:v8];
    [*(id *)(a1 + 40) setPairingData:v18];

    uint64_t v19 = *(void *)(a1 + 48);
    intptr_t v20 = [*(id *)(a1 + 40) pairingData];
    (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v20, 0);
  }
}

void sub_1000126A0(id *a1)
{
  uint64_t v2 = [a1[4] connectionInfo];
  id v3 = a1[5];
  uint64_t v4 = [a1[4] endPointUUID];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000127AC;
  v5[3] = &unk_100034DD0;
  objc_copyWeak(&v8, a1 + 7);
  id v6 = a1[5];
  id v7 = a1[6];
  [v2 setAccessoryUserName:v3 forEndpoint:v4 withReply:v5];

  objc_destroyWeak(&v8);
}

void sub_100012798(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000127AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#CA set name completed with error %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (!v3) {
    [WeakRetained setName:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100012AAC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_100012AC8(id *a1)
{
  uint64_t v2 = [a1[4] connectionInfo];
  id v3 = [a1[4] endPointUUID];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012BB4;
  v4[3] = &unk_100034E48;
  objc_copyWeak(&v6, a1 + 6);
  id v5 = a1[5];
  [v2 provisionAccessoryForFindMy:v3 withReply:v4];

  objc_destroyWeak(&v6);
}

void sub_100012BA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100012BB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#CA set keys completed with error %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (!v3)
  {
    [WeakRetained setIsNVMSetup:1];
    [v6 setKeysAvailable:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012E84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_100012EB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "### #CA completed with error %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (!v3)
  {
    [WeakRetained setIsNVMSetup:0];
    [v6 setKeysAvailable:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000130B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CA beginVendorKeyErase completed with accessoryNonce %@  error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000132FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#CA continueVendorKeyErase completed with error %@", (uint8_t *)&v5, 0xCu);
  }

  if (!v3)
  {
    [*(id *)(a1 + 32) setIsNVMSetup:0];
    [*(id *)(a1 + 32) setKeysAvailable:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000134F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CA copyUserPrivateKey completed with key = %@ error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000136F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CA beginUserKeyErase completed with accessoryNonce %@  error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013934(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#CA continueUserKeyErase completed with error %@", (uint8_t *)&v5, 0xCu);
  }

  if (!v3)
  {
    [*(id *)(a1 + 32) setIsNVMSetup:0];
    [*(id *)(a1 + 32) setKeysAvailable:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100013B2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#CA cancelUserKeyErase completed with error %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_100013D0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#CA cancelVendorKeyErase completed with error %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_1000141EC(id a1)
{
  id v2 = +[FMSystemInfo sharedInstance];
  unsigned int v1 = [v2 isInternalBuild];
  if (v1) {
    LOBYTE(v1) = +[FMPreferencesUtil BOOLForKey:@"EnableMagSafeMocking" inDomain:kFMDNotBackedUpPrefDomain];
  }
  byte_100042DF8 = v1;
}

void sub_1000142DC(id a1)
{
  unsigned int v1 = +[FMDAutomationHelperFactory sharedFactory];
  id v2 = (objc_class *)[v1 automationHelperClassWithName:@"FMDAutomationACCConnectionInfo"];

  qword_100042E08 = (uint64_t)objc_alloc_init(v2);

  _objc_release_x1();
}

void sub_1000146BC(uint64_t a1)
{
  id v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v13 = 136315906;
    int v14 = "-[FMDCoreAccessoryManager accessoryConnectionAttached:type:info:properties:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@ %@", (uint8_t *)&v13, 0x2Au);
  }

  int v6 = [*(id *)(a1 + 56) cache];
  unsigned int v7 = [v6 isCachedAccessoryWithUUID:*(void *)(a1 + 32)];

  if (v7)
  {
    int v8 = [*(id *)(a1 + 56) cache];
    id v9 = [v8 getAccessoryWithUUID:*(void *)(a1 + 32)];
  }
  else
  {
    __int16 v10 = [FMDMagSafeRawInfo alloc];
    int v8 = [*(id *)(a1 + 56) connectionInfo];
    id v9 = [(FMDMagSafeRawInfo *)v10 initWithConnectionInfo:v8];
  }
  id v11 = v9;

  [(FMDMagSafeRawInfo *)v11 updateWithProperties:*(void *)(a1 + 48)];
  [(FMDMagSafeRawInfo *)v11 updateWithAccessoryInfo:*(void *)(a1 + 40)];
  [(FMDMagSafeRawInfo *)v11 setConnectionUUID:*(void *)(a1 + 32)];
  uint64_t v12 = [*(id *)(a1 + 56) cache];
  [v12 saveAccessory:v11 withUUID:*(void *)(a1 + 32)];
}

void sub_100014968(uint64_t a1)
{
  id v2 = sub_100003338();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 136315650;
    *(void *)uint64_t v20 = "-[FMDCoreAccessoryManager accessoryEndpointAttached:transportType:protocol:properties:forConnection:]_block_invoke";
    *(_WORD *)&v20[8] = 2112;
    *(void *)&v20[10] = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@", buf, 0x20u);
  }

  uint64_t v5 = [*(id *)(a1 + 48) cache];
  int v6 = [v5 getAccessoryWithUUID:*(void *)(a1 + 32)];

  [v6 updateWithProperties:*(void *)(a1 + 40)];
  [v6 setEndPointUUID:*(void *)(a1 + 56)];
  [v6 setProtocol:*(unsigned int *)(a1 + 64)];
  [v6 setTransportType:*(unsigned int *)(a1 + 68)];
  unsigned int v7 = [*(id *)(a1 + 48) cache];
  [v7 accessoryDidUpdateWithUUID:*(void *)(a1 + 32)];

  int v8 = sub_100003338();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(a1 + 64);
    CFStringRef v10 = @"eACCEndpoint_Protocol_MFi4Auth";
    if (v9 != 14) {
      CFStringRef v10 = @"unexpected";
    }
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)uint64_t v20 = v9;
    *(_WORD *)&v20[4] = 2112;
    *(void *)&v20[6] = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA protocol =  %u %@", buf, 0x12u);
  }

  id v11 = sub_100003338();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = *(_DWORD *)(a1 + 68);
    CFStringRef v13 = @"eACCEndpoint_TransportType_NFC";
    if (v12 != 13) {
      CFStringRef v13 = @"unexpected";
    }
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)uint64_t v20 = v12;
    *(_WORD *)&v20[4] = 2112;
    *(void *)&v20[6] = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#CA transportType =  %u %@", buf, 0x12u);
  }

  if (![v6 isMF4i] || objc_msgSend(v6, "authPassed"))
  {
    int v14 = dispatch_get_global_queue(0, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100014C90;
    v17[3] = &unk_100034838;
    v17[4] = *(void *)(a1 + 48);
    id v18 = v6;
    dispatch_async(v14, v17);
  }
  __int16 v15 = sub_100003338();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [*(id *)(a1 + 48) accessoryRawInfo];
    *(_DWORD *)long long buf = 138412290;
    *(void *)uint64_t v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "dict = %@", buf, 0xCu);
  }
}

void sub_100014C90(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  id v2 = [*(id *)(a1 + 40) serialNumber];
  [v3 accessoryDidConnect:v2];
}

void sub_100014E40(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cache];
  id v3 = [v2 getAccessoryWithUUID:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 serialNumber];

  uint64_t v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA current magsafe accessory disconnected  %@", buf, 0xCu);
  }

  int v6 = dispatch_get_global_queue(0, 0);
  int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100014FC0;
  int v12 = &unk_100034838;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v4;
  id v7 = v4;
  dispatch_async(v6, &v9);

  int v8 = [*(id *)(a1 + 32) cache:v9, v10, v11, v12, v13];
  [v8 deleteAccessoryWithUUID:*(void *)(a1 + 40)];
}

void sub_100014FC0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryDidDisconnect:*(void *)(a1 + 40)];
}

void sub_100015344(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cache];
  id v3 = [v2 getAccessoryWithUUID:*(void *)(a1 + 40)];

  if (v3)
  {
    if ([v3 isMF4i])
    {
      if (([v3 authPassed] & 1) == 0)
      {
        [v3 updateWithProperties:*(void *)(a1 + 48)];
        uint64_t v4 = [*(id *)(a1 + 32) cache];
        [v4 accessoryDidUpdateWithUUID:*(void *)(a1 + 40)];

        if ([v3 authPassed])
        {
          v11[0] = 0;
          v11[1] = v11;
          v11[2] = 0x3042000000;
          v11[3] = sub_100015508;
          v11[4] = sub_100015514;
          objc_initWeak(&v12, *(id *)(a1 + 32));
          uint64_t v5 = [*(id *)(a1 + 32) connectionInfo];
          uint64_t v6 = *(void *)(a1 + 40);
          v7[0] = _NSConcreteStackBlock;
          v7[1] = 3221225472;
          v7[2] = sub_10001551C;
          v7[3] = &unk_1000359A8;
          id v8 = v3;
          uint64_t v10 = v11;
          id v9 = *(id *)(a1 + 40);
          [v5 accessoryInfoForConnection:v6 withReply:v7];

          _Block_object_dispose(v11, 8);
          objc_destroyWeak(&v12);
        }
      }
    }
  }
}

void sub_1000154E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_100015508(uint64_t a1, uint64_t a2)
{
}

void sub_100015514(uint64_t a1)
{
}

void sub_10001551C(uint64_t a1)
{
  [*(id *)(a1 + 32) updateWithAccessoryInfo:];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  id v3 = [WeakRetained cache];
  [v3 accessoryDidUpdateWithUUID:*(void *)(a1 + 40)];

  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015608;
  v5[3] = &unk_100035980;
  uint64_t v7 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);
}

void sub_100015608(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v2 = [WeakRetained delegate];
  id v3 = [*(id *)(a1 + 32) serialNumber];
  [v2 accessoryDidConnect:v3];
}

uint64_t start(int a1, char **a2)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100016148(id a1)
{
  qword_100042E18 = objc_opt_new();

  _objc_release_x1();
}

id sub_1000177A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAuxiliaryViewsAlpha:1.0];
}

uint64_t sub_1000177B0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100018C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018D24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100018D34(uint64_t a1)
{
}

void sub_100018D3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "getPairingDataWithCompletion completed with error = %@ %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100018E50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "beginUserKeyEraseWithCompletion return with accessoryNonce = %@ error = %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100018F64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "getAuthNonceWithCompletion return with accessoryNonce = %@ error = %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100019078(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  uint64_t v8 = sub_100003338();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) phoneNumber];
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) serverNonce];
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) signature];
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) statusCode];
    int v13 = 138413058;
    int v14 = v9;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "got pairingCheckResponseInfo %@ %@ %@ %@", (uint8_t *)&v13, 0x2Au);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100019210(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100019270(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000192D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "continueUserKeyErase return with serverNounce = %@ error = %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000193BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "vendorKeyErase return with serverNonce = %@ error = %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100019D68(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v12 = 138412802;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lost Mode key roll time updated for %@ to %@ with error = %@", (uint8_t *)&v12, 0x20u);
  }

  if (!v3)
  {
    id v7 = +[NSMutableArray arrayWithArray:a1[6]];
    [v7 removeObject:a1[4]];
    id v8 = +[FMDMagSafeDataStore sharedInstance];
    int v9 = [v8 readLostModeAccessoriesListVersion];

    uint64_t v10 = +[FMDMagSafeDataStore sharedInstance];
    id v11 = [v10 writeLostModeInfo:v7 version:v9];
  }
}

void sub_100019EB8(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100003338();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "pairingKeyUpdated with error = %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10001A18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10001A1B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = sub_100003338();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setName completed with error = %@", (uint8_t *)&v11, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001A4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001A4E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setPairingData completed with error = %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001A940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10001A97C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "registerDeviceForPairingLock completed with error = %@ %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001ACB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10001ACE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "getPairingDataWithCompletion completed with error = %@ %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001B054(id a1)
{
  qword_100042E28 = objc_alloc_init(FMDMagSafeDataStore);

  _objc_release_x1();
}

id sub_10001B2F0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _writeAccessoriesToDisk:&__NSDictionary0__struct];
  return [*(id *)(a1 + 32) writeLostModeInfo:&__NSArray0__struct version:&stru_100036130];
}

void sub_10001B420(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSMutableDictionary);
  id v3 = [*(id *)(a1 + 32) readAllAccessoriesFromDisk];
  id v4 = [v2 initWithDictionary:v3];

  id v5 = *(void **)(a1 + 40);
  id v6 = [v5 accessoryIdentifier];
  [v4 setObject:v5 forKeyedSubscript:v6];

  id v7 = [*(id *)(a1 + 32) _writeAccessoriesToDisk:v4];
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001B554;
  v11[3] = &unk_100035B50;
  id v9 = *(id *)(a1 + 48);
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  dispatch_async(v8, v11);
}

uint64_t sub_10001B554(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001B640(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSMutableDictionary);
  id v3 = [*(id *)(a1 + 32) readAllAccessoriesFromDisk];
  id v4 = [v2 initWithDictionary:v3];

  [v4 removeObjectForKey:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) _writeAccessoriesToDisk:v4];
  id v6 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B758;
  v9[3] = &unk_100035B50;
  id v7 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t sub_10001B758(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001B844(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSMutableDictionary);
  uint64_t v26 = a1;
  id v3 = [*(id *)(a1 + 32) readAllAccessoriesFromDisk];
  id v4 = [v2 initWithDictionary:v3];

  long long v35 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  id v5 = [v4 allValues];
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v6)
  {
    id v7 = v6;
    long long v25 = v4;
    id v8 = 0;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v12 = [v11 serialNumbers];
        id v13 = [v12 objectForKeyedSubscript:@"systemSerialNumber"];
        unsigned int v14 = [v13 isEqualToString:*(void *)(v26 + 40)];

        if (v14)
        {
          uint64_t v15 = [v11 accessoryIdentifier];

          id v8 = (void *)v15;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v7);

    id v4 = v25;
    if (v8)
    {
      __int16 v16 = sub_1000104A4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(v26 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v37 = v17;
        __int16 v38 = 2112;
        uint64_t v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMDMagSafeDataSource: removing accessory with serialNumber %@ accessoryId = %@", buf, 0x16u);
      }

      [v25 removeObjectForKey:v8];
      id v18 = [*(id *)(v26 + 32) _writeAccessoriesToDisk:v25];
      __int16 v19 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001BBF0;
      block[3] = &unk_100035B50;
      id v20 = *(id *)(v26 + 48);
      id v30 = v18;
      id v31 = v20;
      id v21 = v18;
      dispatch_async(v19, block);

      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v22 = sub_1000104A4();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(v26 + 40);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "FMDMagSafeDataSource: No magsafe accessory with serialNumber %@ found", buf, 0xCu);
  }

  long long v24 = dispatch_get_global_queue(0, 0);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001BC04;
  v27[3] = &unk_100035BA0;
  id v28 = *(id *)(v26 + 48);
  dispatch_async(v24, v27);

  id v8 = v28;
LABEL_18:
}

uint64_t sub_10001BBF0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10001BC04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C3EC(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSMutableDictionary);
  id v3 = [*(id *)(a1 + 32) readAllAccessoriesFromDisk];
  id v4 = [v2 initWithDictionary:v3];

  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = v5;
  if (v5)
  {
    [v5 setLastLostModeKeyRollTime:*(void *)(a1 + 48)];
    uint64_t v7 = [*(id *)(a1 + 32) _writeAccessoriesToDisk:v4];
  }
  else
  {
    id v8 = sub_100010114();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001FB04(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v7 = +[NSError fm_genericError];
  }
  __int16 v16 = (void *)v7;
  uint64_t v17 = dispatch_get_global_queue(0, 0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001C564;
  v20[3] = &unk_100035B50;
  id v18 = *(id *)(a1 + 56);
  id v21 = v16;
  id v22 = v18;
  id v19 = v16;
  dispatch_async(v17, v20);
}

uint64_t sub_10001C564(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_10001C664(id a1)
{
  unsigned int v1 = NSStringFromSelector("pairingCheckToken");
  v7[0] = v1;
  id v2 = NSStringFromSelector("lostModePrivateKey");
  v7[1] = v2;
  id v3 = NSStringFromSelector("phoneNumber");
  v7[2] = v3;
  id v4 = NSStringFromSelector("keysUpdated");
  v7[3] = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:v7 count:4];
  id v6 = (void *)qword_100042E38;
  qword_100042E38 = v5;
}

void sub_10001E3DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id *sub_10001E6E0(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = a4;
    uint64_t v5 = result;
    id v6 = (unsigned __int8 *)(a2 + a3);
    do
    {
      unsigned int v7 = *v6++;
      uint64_t result = [v5[4] appendFormat:@"%02lx" v7];
      --v4;
    }
    while (v4);
  }
  return result;
}

void sub_10001E744(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_10001E7BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#PARSING invalid or no pattern in maskInfo %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001E834(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#PARSING invalid or no mask in maskInfo %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001E8AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004D70((void *)&_mh_execute_header, a2, a3, "FMDRemoteAsset: Invalid cached asset removing failed with error = : %@", a5, a6, a7, a8, 2u);
}

void sub_10001E918(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004D70((void *)&_mh_execute_header, a1, a3, "FMDRemoteAsset: createDirectoryAtPath failed with error = %@", a5, a6, a7, a8, 2u);
}

void sub_10001E988(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 40) absoluteString];
  id v6 = [a2 URL];
  unsigned int v7 = [v6 absoluteString];
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "FMDRemoteAsset: asset validation failed. requestURL = %@, responseURL = %@", (uint8_t *)&v8, 0x16u);
}

void sub_10001EA60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001EACC()
{
  sub_1000100DC();
  sub_100004D70((void *)&_mh_execute_header, v0, v1, "failed to ger remoteVCProxy with error %@", v2, v3, v4, v5, v6);
}

void sub_10001EB34()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "accessoryDidConnect: got connection call for the same accessory", v2, v3, v4, v5, v6);
}

void sub_10001EB68()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "accessoryDidConnect: another accessory Connected", v2, v3, v4, v5, v6);
}

void sub_10001EB9C()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "timeout while trying to get image", v2, v3, v4, v5, v6);
}

void sub_10001EBD0()
{
  sub_1000100DC();
  sub_100004D70((void *)&_mh_execute_header, v0, v1, "pairingCheckForAccessory timeout with error %ld", v2, v3, v4, v5, v6);
}

void sub_10001EC38(void *a1, NSObject *a2)
{
  [a1 magSafeState];
  sub_1000100DC();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "not starting magSafe flow setup with state = %lu", v3, 0xCu);
}

void sub_10001ECC0()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "unexpected state FMDMagSafeStateUnknown", v2, v3, v4, v5, v6);
}

void sub_10001ECF4()
{
  sub_1000100CC(__stack_chk_guard);
  sub_100010078();
  sub_100010090((void *)&_mh_execute_header, v0, v1, "Failed to set name with error = %@ waitError = %ld");
}

void sub_10001ED5C()
{
  sub_1000100CC(__stack_chk_guard);
  sub_100010078();
  sub_100010090((void *)&_mh_execute_header, v0, v1, "Failed to add device with error = %@ waitError = %ld");
}

void sub_10001EDC4()
{
  sub_1000100CC(__stack_chk_guard);
  sub_100010078();
  sub_100010090((void *)&_mh_execute_header, v0, v1, "Find My setup failed with error = %@ %ld");
}

void sub_10001EE2C()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "#CA unable to get user privateKey", v2, v3, v4, v5, v6);
}

void sub_10001EE60(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "setting up pairing data %@ %@", buf, 0x16u);
}

void sub_10001EED4()
{
  sub_1000100DC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "user %@! %@!", v2, 0x16u);
}

void sub_10001EF58()
{
  sub_1000100DC();
  sub_100004D70((void *)&_mh_execute_header, v0, v1, "isFindMyEnabled timeout with error %ld", v2, v3, v4, v5, v6);
}

void sub_10001EFC0()
{
  sub_1000100DC();
  sub_100004D70((void *)&_mh_execute_header, v0, v1, "enable findmy completed with error = %@", v2, v3, v4, v5, v6);
}

void sub_10001F028()
{
  sub_1000100E8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "waiting for device to show up in the app", v1, 2u);
}

void sub_10001F068()
{
  sub_1000100DC();
  sub_100004D70((void *)&_mh_execute_header, v0, v1, "setup findmy completed with error = %@", v2, v3, v4, v5, v6);
}

void sub_10001F0D0()
{
  sub_1000100E8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "wait finished", v1, 2u);
}

void sub_10001F110()
{
  sub_1000100DC();
  sub_100004D70((void *)&_mh_execute_header, v0, v1, "Failed to open url with error = %@", v2, v3, v4, v5, v6);
}

void sub_10001F178()
{
  sub_1000100DC();
  sub_100004D70((void *)&_mh_execute_header, v0, v1, "storeAccessoryAsNotFindmyEnabled completed with error = %@", v2, v3, v4, v5, v6);
}

void sub_10001F1E0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unlock state is %i", (uint8_t *)v2, 8u);
}

void sub_10001F258(int *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = 138412546;
  CFStringRef v4 = @"FMFAllowed";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching %@: %d", (uint8_t *)&v3, 0x12u);
}

void sub_10001F2E8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000100DC();
  sub_1000100F4((void *)&_mh_execute_header, v2, v3, "#Failed to fetch install coordinator for Find My error: %@", v4, v5, v6, v7, v8);
}

void sub_10001F36C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000100DC();
  sub_1000100F4((void *)&_mh_execute_header, v2, v3, "#Installation of Find My failed. error: %@", v4, v5, v6, v7, v8);
}

void sub_10001F3F0()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "failed to get altDSID", v2, v3, v4, v5, v6);
}

void sub_10001F424()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "failed to get authKitaccount", v2, v3, v4, v5, v6);
}

void sub_10001F458(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "no data or corrupted data found at key = %@ data = %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001F4E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "keys already setup", v1, 2u);
}

void sub_10001F524()
{
  sub_1000100CC(__stack_chk_guard);
  sub_100010078();
  sub_100010090((void *)&_mh_execute_header, v0, v1, "Find My pairing check failed with error = %@ %ld");
}

void sub_10001F58C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "cancelErase api time out with error = %ld", (uint8_t *)&v2, 0xCu);
}

void sub_10001F604(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "got unexpected lostModeInfo = %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001F67C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 serialNumber];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to update pairing data for %@", (uint8_t *)&v4, 0xCu);
}

void sub_10001F714(void *a1, void *a2, NSObject *a3)
{
  __int16 v5 = [a1 fm_hexString];
  uint64_t v6 = [a2 fm_hexString];
  int v7 = 138412546;
  uint8_t v8 = v5;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "setting up pairing data %@ %@", (uint8_t *)&v7, 0x16u);
}

void sub_10001F7D8(void *a1, NSObject *a2)
{
  int v4 = [a1 pairingCheckToken];
  __int16 v5 = [v4 fm_hexString];
  uint64_t v6 = [a1 phoneNumber];
  int v7 = [v6 fm_hexString];
  uint8_t v8 = [a1 keysUpdated];
  __int16 v9 = [v8 fm_hexString];
  __int16 v10 = [a1 lostModePrivateKey];
  uint64_t v11 = [v10 fm_hexString];
  int v12 = 138413058;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  __int16 v18 = 2112;
  id v19 = v11;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "pairingCheckToken = %@\nphoneNumber = %@\nkeysUpdated = %@\nlostModePrivateKey = %@", (uint8_t *)&v12, 0x2Au);
}

void sub_10001F92C(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid registerResponse = %@ %@", buf, 0x16u);
}

void sub_10001F99C()
{
  sub_1000100CC(__stack_chk_guard);
  sub_100010078();
  sub_100010090((void *)&_mh_execute_header, v0, v1, "fetching pairingData failed with errror = %@ timeout error =  %ld");
}

void sub_10001FA04(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)objc_opt_class() defaultStorageLocation];
  sub_1000100DC();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "read magSafe data store from %@", v4, 0xCu);
}

void sub_10001FA9C()
{
  sub_1000100DC();
  sub_100004D70((void *)&_mh_execute_header, v0, v1, "Could not read magSafe accessories list from disk %@", v2, v3, v4, v5, v6);
}

void sub_10001FB04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FB74(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to decode corrupted data = %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001FBEC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "encoded data = %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001FC64()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "Unable to encode obect", v2, v3, v4, v5, v6);
}

void sub_10001FC98()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "Unable to decode data", v2, v3, v4, v5, v6);
}

void sub_10001FCCC()
{
  sub_1000100E8();
  sub_1000100B0((void *)&_mh_execute_header, v0, v1, "FMDRemoteUnlockPairingData: Unable to decode data", v2, v3, v4, v5, v6);
}

void sub_10001FD00(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004D70((void *)&_mh_execute_header, a2, a3, "### decryption failed with error = %@", a5, a6, a7, a8, 2u);
}

void sub_10001FD6C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "### algorithm is not supported", v1, 2u);
}

void sub_10001FDB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004D70((void *)&_mh_execute_header, a2, a3, "### error encoding message = %@", a5, a6, a7, a8, 2u);
}

void sub_10001FE1C(void *a1)
{
  uint64_t v2 = [a1 userInfo];
  uint64_t v3 = [a1 localizedDescription];
  sub_10001E418();
  sub_10001E3DC((void *)&_mh_execute_header, v4, v5, "### error = %@, %@", v6, v7, v8, v9, v10);
}

void sub_10001FEC0(void *a1, __SecKey *a2)
{
  [a1 length];
  SecKeyGetBlockSize(a2);
  sub_10001E3FC();
  sub_10001E3DC((void *)&_mh_execute_header, v3, v4, "### message size two big %lu >= %lu", v5, v6, v7, v8, v9);
}

void sub_10001FF50(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Hex strings should have an even number of digits (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_10001FFC8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "MAC address should be 6 bytes (%@)", (uint8_t *)&v2, 0xCu);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithEllipseInRect(rect, transform);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return _SBSRequestPasscodeUnlockUI();
}

uint64_t SFAdjustmentFiltersForAssetTypeAndURL()
{
  return _SFAdjustmentFiltersForAssetTypeAndURL();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return _SecKeyCreateDecryptedData(key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return _SecKeyCreateEncryptedData(key, algorithm, plaintext, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return _SecKeyCreateRandomKey(parameters, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return _SecKeyCreateWithData(keyData, attributes, error);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return _SecKeyGetBlockSize(key);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return _SecKeyIsAlgorithmSupported(key, operation, algorithm);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return _strtouq(__str, __endptr, __base);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return [a1 MIMEType];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__computeName(void *a1, const char *a2, ...)
{
  return [a1 _computeName];
}

id objc_msgSend__setupLayers(void *a1, const char *a2, ...)
{
  return [a1 _setupLayers];
}

id objc_msgSend__updateAppearance(void *a1, const char *a2, ...)
{
  return [a1 _updateAppearance];
}

id objc_msgSend__updateDynamicLayers(void *a1, const char *a2, ...)
{
  return [a1 _updateDynamicLayers];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessoriesRawInfo(void *a1, const char *a2, ...)
{
  return [a1 accessoriesRawInfo];
}

id objc_msgSend_accessoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accessoryIdentifier];
}

id objc_msgSend_accessoryRawInfo(void *a1, const char *a2, ...)
{
  return [a1 accessoryRawInfo];
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return [a1 accessoryType];
}

id objc_msgSend_accountState(void *a1, const char *a2, ...)
{
  return [a1 accountState];
}

id objc_msgSend_additionalInfo(void *a1, const char *a2, ...)
{
  return [a1 additionalInfo];
}

id objc_msgSend_adjustmentsURL(void *a1, const char *a2, ...)
{
  return [a1 adjustmentsURL];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowedAccessoryTypes(void *a1, const char *a2, ...)
{
  return [a1 allowedAccessoryTypes];
}

id objc_msgSend_annotation(void *a1, const char *a2, ...)
{
  return [a1 annotation];
}

id objc_msgSend_appInstallCoordinator(void *a1, const char *a2, ...)
{
  return [a1 appInstallCoordinator];
}

id objc_msgSend_assetStorageLocation(void *a1, const char *a2, ...)
{
  return [a1 assetStorageLocation];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return [a1 assetURL];
}

id objc_msgSend_authPassed(void *a1, const char *a2, ...)
{
  return [a1 authPassed];
}

id objc_msgSend_authStatus(void *a1, const char *a2, ...)
{
  return [a1 authStatus];
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return [a1 automationHelperBundle];
}

id objc_msgSend_auxiliaryViews(void *a1, const char *a2, ...)
{
  return [a1 auxiliaryViews];
}

id objc_msgSend_balloonImage(void *a1, const char *a2, ...)
{
  return [a1 balloonImage];
}

id objc_msgSend_balloonLayer(void *a1, const char *a2, ...)
{
  return [a1 balloonLayer];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_caAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 caAccessoryManager];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_connectionInfo(void *a1, const char *a2, ...)
{
  return [a1 connectionInfo];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_continueWithAccountValidationFlow(void *a1, const char *a2, ...)
{
  return [a1 continueWithAccountValidationFlow];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 currentTraitCollection];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataArchiver(void *a1, const char *a2, ...)
{
  return [a1 dataArchiver];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStorageLocation(void *a1, const char *a2, ...)
{
  return [a1 defaultStorageLocation];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceAnnotation(void *a1, const char *a2, ...)
{
  return [a1 deviceAnnotation];
}

id objc_msgSend_deviceDiscoveryId(void *a1, const char *a2, ...)
{
  return [a1 deviceDiscoveryId];
}

id objc_msgSend_deviceImage(void *a1, const char *a2, ...)
{
  return [a1 deviceImage];
}

id objc_msgSend_deviceLockState(void *a1, const char *a2, ...)
{
  return [a1 deviceLockState];
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return [a1 email];
}

id objc_msgSend_endPointUUID(void *a1, const char *a2, ...)
{
  return [a1 endPointUUID];
}

id objc_msgSend_eraseKeyType(void *a1, const char *a2, ...)
{
  return [a1 eraseKeyType];
}

id objc_msgSend_findMyEnabled(void *a1, const char *a2, ...)
{
  return [a1 findMyEnabled];
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 firmwareVersion];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getPairingStatus(void *a1, const char *a2, ...)
{
  return [a1 getPairingStatus];
}

id objc_msgSend_getStoredAssetLocation(void *a1, const char *a2, ...)
{
  return [a1 getStoredAssetLocation];
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return [a1 hasAttemptedLoad];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_infoAvailable(void *a1, const char *a2, ...)
{
  return [a1 infoAvailable];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isAutomationActive(void *a1, const char *a2, ...)
{
  return [a1 isAutomationActive];
}

id objc_msgSend_isBeingPresented(void *a1, const char *a2, ...)
{
  return [a1 isBeingPresented];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isFindMyAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isFindMyAppInstalled];
}

id objc_msgSend_isFindMyEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFindMyEnabled];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isMF4i(void *a1, const char *a2, ...)
{
  return [a1 isMF4i];
}

id objc_msgSend_isNVMSetup(void *a1, const char *a2, ...)
{
  return [a1 isNVMSetup];
}

id objc_msgSend_isPlayable(void *a1, const char *a2, ...)
{
  return [a1 isPlayable];
}

id objc_msgSend_isRestrictedSKU(void *a1, const char *a2, ...)
{
  return [a1 isRestrictedSKU];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return [a1 keys];
}

id objc_msgSend_keysAvailable(void *a1, const char *a2, ...)
{
  return [a1 keysAvailable];
}

id objc_msgSend_keysUpdated(void *a1, const char *a2, ...)
{
  return [a1 keysUpdated];
}

id objc_msgSend_lastLostModeKeyRollTime(void *a1, const char *a2, ...)
{
  return [a1 lastLostModeKeyRollTime];
}

id objc_msgSend_launchContext(void *a1, const char *a2, ...)
{
  return [a1 launchContext];
}

id objc_msgSend_launchSettingsAppUpgradeFlow(void *a1, const char *a2, ...)
{
  return [a1 launchSettingsAppUpgradeFlow];
}

id objc_msgSend_launchedFromFindMyApp(void *a1, const char *a2, ...)
{
  return [a1 launchedFromFindMyApp];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_lostModeDataArchiver(void *a1, const char *a2, ...)
{
  return [a1 lostModeDataArchiver];
}

id objc_msgSend_lostModeInfo(void *a1, const char *a2, ...)
{
  return [a1 lostModeInfo];
}

id objc_msgSend_lostModePrivateKey(void *a1, const char *a2, ...)
{
  return [a1 lostModePrivateKey];
}

id objc_msgSend_lostModeStorageLocation(void *a1, const char *a2, ...)
{
  return [a1 lostModeStorageLocation];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_magSafeAccessory(void *a1, const char *a2, ...)
{
  return [a1 magSafeAccessory];
}

id objc_msgSend_magSafeState(void *a1, const char *a2, ...)
{
  return [a1 magSafeState];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return [a1 mainContentGuide];
}

id objc_msgSend_mapDeviceImagePath(void *a1, const char *a2, ...)
{
  return [a1 mapDeviceImagePath];
}

id objc_msgSend_mapView(void *a1, const char *a2, ...)
{
  return [a1 mapView];
}

id objc_msgSend_mimeTypeProvider(void *a1, const char *a2, ...)
{
  return [a1 mimeTypeProvider];
}

id objc_msgSend_movieDimensions(void *a1, const char *a2, ...)
{
  return [a1 movieDimensions];
}

id objc_msgSend_movieView(void *a1, const char *a2, ...)
{
  return [a1 movieView];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_otherData(void *a1, const char *a2, ...)
{
  return [a1 otherData];
}

id objc_msgSend_pairingCheckToken(void *a1, const char *a2, ...)
{
  return [a1 pairingCheckToken];
}

id objc_msgSend_pairingData(void *a1, const char *a2, ...)
{
  return [a1 pairingData];
}

id objc_msgSend_pairingToken(void *a1, const char *a2, ...)
{
  return [a1 pairingToken];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_physicalAccessory(void *a1, const char *a2, ...)
{
  return [a1 physicalAccessory];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_preferredMIMEType(void *a1, const char *a2, ...)
{
  return [a1 preferredMIMEType];
}

id objc_msgSend_presentedCard(void *a1, const char *a2, ...)
{
  return [a1 presentedCard];
}

id objc_msgSend_presentingAccessorySerialNumber(void *a1, const char *a2, ...)
{
  return [a1 presentingAccessorySerialNumber];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_productHeight(void *a1, const char *a2, ...)
{
  return [a1 productHeight];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_proxCardAlreadyAttached(void *a1, const char *a2, ...)
{
  return [a1 proxCardAlreadyAttached];
}

id objc_msgSend_proxCardAttachAccessory(void *a1, const char *a2, ...)
{
  return [a1 proxCardAttachAccessory];
}

id objc_msgSend_proxCardLockedFindMyNotPaired(void *a1, const char *a2, ...)
{
  return [a1 proxCardLockedFindMyNotPaired];
}

id objc_msgSend_proxCardNoAccount(void *a1, const char *a2, ...)
{
  return [a1 proxCardNoAccount];
}

id objc_msgSend_proxCardNonOwnerLockedDevice(void *a1, const char *a2, ...)
{
  return [a1 proxCardNonOwnerLockedDevice];
}

id objc_msgSend_proxCardNonOwnerUnlocked(void *a1, const char *a2, ...)
{
  return [a1 proxCardNonOwnerUnlocked];
}

id objc_msgSend_proxCardSetupComplete(void *a1, const char *a2, ...)
{
  return [a1 proxCardSetupComplete];
}

id objc_msgSend_proxCardSetupError(void *a1, const char *a2, ...)
{
  return [a1 proxCardSetupError];
}

id objc_msgSend_proxCardSetupFindmy(void *a1, const char *a2, ...)
{
  return [a1 proxCardSetupFindmy];
}

id objc_msgSend_proxCardSpinner(void *a1, const char *a2, ...)
{
  return [a1 proxCardSpinner];
}

id objc_msgSend_proxCardUnlockedStartFlow(void *a1, const char *a2, ...)
{
  return [a1 proxCardUnlockedStartFlow];
}

id objc_msgSend_proxCardUnsupportedAccessory(void *a1, const char *a2, ...)
{
  return [a1 proxCardUnsupportedAccessory];
}

id objc_msgSend_proxCardUpgradeAccountSecurity(void *a1, const char *a2, ...)
{
  return [a1 proxCardUpgradeAccountSecurity];
}

id objc_msgSend_proxCardUpgradeAccountSecurityError(void *a1, const char *a2, ...)
{
  return [a1 proxCardUpgradeAccountSecurityError];
}

id objc_msgSend_rawAccessoryType(void *a1, const char *a2, ...)
{
  return [a1 rawAccessoryType];
}

id objc_msgSend_readAllAccessoriesFromDisk(void *a1, const char *a2, ...)
{
  return [a1 readAllAccessoriesFromDisk];
}

id objc_msgSend_readLostModeAccessoriesList(void *a1, const char *a2, ...)
{
  return [a1 readLostModeAccessoriesList];
}

id objc_msgSend_readLostModeAccessoriesListVersion(void *a1, const char *a2, ...)
{
  return [a1 readLostModeAccessoriesListVersion];
}

id objc_msgSend_remoteVCProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteVCProxy];
}

id objc_msgSend_requestURL(void *a1, const char *a2, ...)
{
  return [a1 requestURL];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serialNumbers(void *a1, const char *a2, ...)
{
  return [a1 serialNumbers];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_serverNonce(void *a1, const char *a2, ...)
{
  return [a1 serverNonce];
}

id objc_msgSend_setupEnded(void *a1, const char *a2, ...)
{
  return [a1 setupEnded];
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return [a1 sharedFactory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_showAttachScreenTimer(void *a1, const char *a2, ...)
{
  return [a1 showAttachScreenTimer];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray3Color];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return [a1 systemPinkColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_titleTextView(void *a1, const char *a2, ...)
{
  return [a1 titleTextView];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_triggerFindMyAppInstallation(void *a1, const char *a2, ...)
{
  return [a1 triggerFindMyAppInstallation];
}

id objc_msgSend_updateAdjustments(void *a1, const char *a2, ...)
{
  return [a1 updateAdjustments];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useEraseKeyType(void *a1, const char *a2, ...)
{
  return [a1 useEraseKeyType];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_userLocationAnnotation(void *a1, const char *a2, ...)
{
  return [a1 userLocationAnnotation];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_writeLostModeInfo_version_(void *a1, const char *a2, ...)
{
  return [a1 writeLostModeInfo:version:];
}