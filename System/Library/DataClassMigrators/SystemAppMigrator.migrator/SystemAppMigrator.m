id sub_1864()
{
  uint64_t path;
  __CFString *v1;
  void *v2;
  NSErrorUserInfoKey v4;
  __CFString *v5;
  uint64_t vars8;

  path = container_error_get_path();
  if (path)
  {
    v1 = +[NSString stringWithFileSystemRepresentation:path];
  }
  else
  {
    v1 = @"Failed to read container error path";
  }
  v4 = NSFilePathErrorKey;
  v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

__CFString *sub_1A98()
{
  v0 = (void *)container_copy_unlocalized_description();
  if (v0)
  {
    v1 = +[NSString stringWithUTF8String:v0];
  }
  else
  {
    v1 = @"<No container description>";
  }
  free(v0);

  return v1;
}

void sub_2B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

uint64_t sub_2BA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2BB0(uint64_t a1)
{
}

uint64_t sub_2BB8(uint64_t a1, uint64_t a2)
{
  id v11 = 0;
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithContainer:a2 error:&v11];
  id v6 = v11;
  id v7 = v11;
  if (v5)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v10 = sub_1A98();
      MOLogWrite();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_2F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2F54(uint64_t a1, uint64_t a2)
{
  return 1;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    id v19 = [v17 mutableCopy];
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  v20 = v19;
  if (v18)
  {
    id v21 = [objc_alloc((Class)NSString) initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  v22 = +[NSString stringWithUTF8String:a1];
  [v20 setObject:v22 forKeyedSubscript:MIFunctionNameErrorKey];

  v23 = +[NSNumber numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:MISourceFileLineErrorKey];

  v24 = +[NSError errorWithDomain:v15 code:a4 userInfo:v20];

  return v24;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  v9 = _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

id _CreateAndLogError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  v9 = _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

id _CreateAndLogErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  id v16 = _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  id v17 = [v16 userInfo];
  id v18 = [v17 objectForKeyedSubscript:NSLocalizedDescriptionKey];

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v19 = [v15 domain];
      [v15 code];
      v20 = [v15 userInfo];
      v22 = [v20 objectForKeyedSubscript:NSLocalizedDescriptionKey];
      MOLogWrite();
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1 = a1;
  v2 = [v1 domain];
  uint64_t v3 = MIInstallerErrorDomain;
  if ([v2 isEqualToString:MIInstallerErrorDomain]
    && [v1 code] == &dword_C)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [v1 domain];
    if ([v5 isEqualToString:v3] && objc_msgSend(v1, "code") == (char *)&dword_8 + 3)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [v1 domain];
      if ([v6 isEqualToString:v3]) {
        BOOL v4 = [v1 code] == (char *)&stru_20.cmd + 3;
      }
      else {
        BOOL v4 = 0;
      }
    }
  }

  return v4;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    v2 = +[NSString stringWithUTF8String:v0];
    free(v1);
  }
  else
  {
    v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }

  return v2;
}

void sub_4A00(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) systemAppInstallGroup];
  dispatch_group_enter(v2);

  id v3 = [*(id *)(a1 + 32) pendingAppInstalls];
  [v3 addObject:*(void *)(a1 + 40)];
}

void sub_4B20(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) systemAppInstallGroup];
  dispatch_group_leave(v2);

  id v3 = [*(id *)(a1 + 32) pendingAppInstalls];
  [v3 removeObject:*(void *)(a1 + 40)];
}

void sub_4CF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_4D10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingAppInstalls];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 40 * (void)[v2 count];
}

void sub_4D74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingAppInstalls];
  id v3 = [v2 count];

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) pendingAppInstalls];
    BOOL v4 = [v6 allObjects];
    id v5 = [v4 componentsJoinedByString:@", "];
    _DMLogFunc();
  }
}

void sub_5018(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 intValue] == 6)
  {
    if (([*(id *)(a1 + 32) setSystemAppState:0 forBundleID:v6] & 1) == 0) {
      _DMLogFunc();
    }
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void sub_5694(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
  unsigned int v7 = [v6 intValue];

  if (v7 != 6)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"UIRequiredDeviceCapabilities"];
    v9 = (void *)v8;
    if (v8 && (uint64_t v14 = v8, _DMLogFunc(), (v10 = (void *)MobileInstallationCheckCapabilitiesMatch()) != 0))
    {
      id v11 = v10;
      v12 = objc_msgSend(v10, "objectForKeyedSubscript:", @"CapabilitiesMatch", v15, v14);
      unsigned __int8 v13 = MIBooleanValue(v12, 0);

      _DMLogFunc();
      if ((v13 & 1) == 0) {
        objc_msgSend(*(id *)(a1 + 40), "markAppAsNotAllowed:", v15, v15, v9, v11);
      }
    }
    else
    {
      _DMLogFunc();
    }
  }
}

void sub_58DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"UIDeviceFamily"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    char v9 = MIIsApplicableToCurrentDeviceFamilyWithError();
    id v10 = 0;
    if ((v9 & 1) == 0)
    {
      _DMLogFunc();
      objc_msgSend(*(id *)(a1 + 32), "markAppAsNotAllowed:", v5, v5, v10);
    }
  }
  else
  {
    _DMLogFunc();
  }
}

void sub_5AC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  unsigned int v8 = [v7 intValue];

  if (v8 != 6)
  {
    char v9 = [v6 objectForKeyedSubscript:@"LSRequiredFeatureFlags"];
    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (v11)
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_5CB4;
      v13[3] = &unk_14790;
      id v12 = v5;
      id v14 = v12;
      id v15 = &v16;
      [v11 enumerateKeysAndObjectsUsingBlock:v13];
      if (*((unsigned char *)v17 + 24))
      {
        _DMLogFunc();
        objc_msgSend(*(id *)(a1 + 40), "markAppAsNotAllowed:", v12, v12);
      }
      else if (!v8 {
             && ([*(id *)(a1 + 40) setSystemAppState:1 forBundleID:v12] & 1) == 0)
      }
      {
        _DMLogFunc();
      }

      _Block_object_dispose(&v16, 8);
    }
  }
}

void sub_5C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5CB4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  id v18 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v18;
  }
  else {
    id v9 = 0;
  }

  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v9 && v11)
  {
    id v12 = [v9 componentsSeparatedByString:@"/"];
    if ([v12 count] == (char *)&dword_0 + 2)
    {
      unsigned __int8 v13 = [v12 objectAtIndexedSubscript:0];
      id v14 = [v12 objectAtIndexedSubscript:1];
      id v15 = v13;
      [v15 UTF8String];
      id v16 = v14;
      [v16 UTF8String];
      int v17 = _os_feature_enabled_impl();
      if (v17 != [v11 BOOLValue])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
    else
    {
      _DMLogFunc();
      id v16 = 0;
      id v15 = 0;
    }
  }
  else
  {
    _DMLogFunc();
  }
}

void sub_61AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = [v7 intValue];

  if (v8 != 1 && v8 != 6)
  {
    id v10 = [v6 objectForKeyedSubscript:@"LSEligibilityPredicatesValidAtEraseInstallDataMigration"];
    unsigned __int8 v11 = MIBooleanValue(v10, 0);

    if ((v11 & 1) != 0 || ([*(id *)(a1 + 40) userDataDisposition] & 1) == 0)
    {
      char v14 = 0;
      LODWORD(v12) = 0;
      if ([*(id *)(a1 + 40) _getLSEligiblityKey:@"LSEligibilityInstallPredicate" appliesTo:&v14 forBundleID:v5 withAppInfo:v6 withEvaluator:*(void *)(a1 + 48)])
      {
        if (v14) {
          LODWORD(v12) = v8 == 0;
        }
        else {
          LODWORD(v12) = 6;
        }
      }
      char v14 = 0;
      unsigned __int8 v13 = [*(id *)(a1 + 40) _getLSEligiblityKey:@"LSEligibilityUninstallPredicate" appliesTo:&v14 forBundleID:v5 withAppInfo:v6 withEvaluator:*(void *)(a1 + 48)];
      if ((v13 & (v14 != 0)) != 0) {
        uint64_t v12 = 6;
      }
      else {
        uint64_t v12 = v12;
      }
      if (v12)
      {
        if (v8 != v12)
        {
          _DMLogFunc();
          if ((objc_msgSend(*(id *)(a1 + 40), "setSystemAppState:forBundleID:", v12, v5, v5, v8, v12) & 1) == 0) {
            _DMLogFunc();
          }
        }
      }
    }
  }
}

void sub_6414(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  unsigned int v7 = [v6 intValue];

  if (!v7)
  {
    id v8 = [v5 objectForKeyedSubscript:@"LSInstallByDefault"];
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10)
    {
      if ((MIBooleanValue(v10, 0) & 1) == 0)
      {
        _DMLogFunc();
        if ((objc_msgSend(*(id *)(a1 + 40), "setSystemAppState:forBundleID:", 6, v11, v11, 0, 6, @"LSInstallByDefault") & 1) == 0)_DMLogFunc(); {
      }
        }
    }
  }
}

void sub_6B68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned int v8 = [v7 applicationIsInstalled:v5];

  if (v8)
  {
    id v9 = +[NSNull null];
    unsigned int v10 = [v6 isEqual:v9];

    if (v10)
    {
      id v29 = v5;
    }
    else
    {
      _DMLogFunc();
      if (objc_msgSend(*(id *)(a1 + 32), "setSystemAppState:forBundleID:", 1, v6, v5, v6))
      {
LABEL_22:
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        id v23 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v5];
        v24 = objc_opt_new();
        [v24 setIgnoreRemovability:1];
        [v24 setIgnoreRestrictions:1];
        [v24 setIgnoreAppProtection:1];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_6EF4;
        v32[3] = &unk_147E0;
        uint64_t v25 = *(void *)(a1 + 32);
        id v33 = v23;
        uint64_t v34 = v25;
        id v35 = v5;
        id v36 = *(id *)(a1 + 40);
        id v26 = v23;
        +[IXAppInstallCoordinator uninstallAppWithIdentity:v26 options:v24 completion:v32];

        goto LABEL_23;
      }
      id v29 = v6;
    }
    _DMLogFunc();
    goto LABEL_22;
  }
  unsigned int v11 = [*(id *)(a1 + 48) containsObject:v5];
  uint64_t v12 = [*(id *)(a1 + 32) startingSystemAppState];
  unsigned __int8 v13 = [v12 objectForKeyedSubscript:v5];

  if (v13)
  {
    char v14 = +[NSNull null];
    unsigned __int8 v15 = [v6 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      id v16 = [*(id *)(a1 + 32) startingSystemAppState];
      int v17 = [v16 objectForKeyedSubscript:v6];

      unsigned int v18 = [v17 intValue];
      id v19 = [v13 intValue];
      if ((v19 & 0xFFFFFFFB) != 2 && v18 == 2) {
        int v21 = 1;
      }
      else {
        int v21 = v11;
      }
      if (v21 == 1)
      {
        id v22 = v19;
        id v30 = v19;
        _DMLogFunc();
        if ((objc_msgSend(*(id *)(a1 + 32), "setSystemAppState:forBundleID:", v22, v6, v30, v5, v6) & 1) == 0)
        {
          id v29 = v6;
          v31 = v13;
          _DMLogFunc();
        }
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "setSystemAppState:forBundleID:", 0, v5, v29, v31) & 1) == 0)
    {
      id v29 = v5;
      _DMLogFunc();
    }
  }

LABEL_23:
  v27 = objc_msgSend(*(id *)(a1 + 32), "itemsToInstall", v29);
  v28 = [v27 objectForKeyedSubscript:v5];

  if (v28) {
    [*(id *)(a1 + 56) addObject:v5];
  }
}

void sub_6EF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (!a2 || v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    _DMLogFunc();
  }
  else if (a2 != 3)
  {
    id v6 = IXStringForUninstallDisposition();
    id v7 = *(id *)(a1 + 32);
    _DMLogFunc();
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "setSystemAppState:forBundleID:", 0, *(void *)(a1 + 48), v6, v7) & 1) == 0)_DMLogFunc(); {
  _DMLogFunc();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_72DC(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  *a4 = 0;
  uint64_t v8 = _CFPreferencesCopyAppValueWithContainer();
  if (v8)
  {
    id v9 = (void *)v8;
    [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v7];
  }
  else
  {
    _DMLogFunc();
  }
}

void sub_7688(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  *a4 = 0;
  id v5 = a3;
  id v6 = a2;
  _DMLogFunc();
  _CFPreferencesSetAppValueWithContainer();
}

void sub_77DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appBundleIDsInstalledSuccessfully];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_7918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7930(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appBundleIDsInstalledSuccessfully];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

uint64_t sub_8860(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return _DMLogFunc();
  }
  return result;
}

void sub_89C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_B430((uint64_t)v3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_A41C(_Unwind_Exception *a1)
{
}

uint64_t sub_A4B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_A4C8(uint64_t a1)
{
}

void sub_A4D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 objectForKeyedSubscript:@"com.apple.MobileInstallation.stagedAppURL"];
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v7 = [(id)v6 unsignedIntegerValue];

  LOBYTE(v6) = objc_msgSend(*(id *)(a1 + 40), "attemptToInstallSystemAppWithBundleID:desiredAppState:stagedAppOrPatchURL:isInstalled:", v5, v7, v8, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "containsObject:", v5));
  if ((v6 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void sub_A59C(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v20];
  unsigned int v7 = [v6 unsignedIntegerValue];

  unsigned int v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containsObject:v20];
  if ((v7 & 0xFFFFFFFB) == 2)
  {
    if (v8)
    {
      _DMLogFunc();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    goto LABEL_25;
  }
  if (v7 > 5 || ((1 << v7) & 0x23) == 0) {
    goto LABEL_25;
  }
  if (v8)
  {
    if ([*(id *)(a1 + 40) isCurrentlyInstalledAppInTrustCacheForBundleID:v20]) {
      goto LABEL_25;
    }
    id v10 = [v5 objectForKeyedSubscript:@"com.apple.MobileInstallation.stagedAppURL"];
    unsigned int v11 = [v10 lastPathComponent];
    unsigned __int8 v12 = [v11 isEqualToString:v20];

    unsigned __int8 v13 = +[MIDaemonConfiguration sharedInstance];
    unsigned int v14 = [v13 codeSigningEnforcementIsDisabled];
    if (v10 && v14 && (v12 & 1) == 0)
    {
      unsigned int v15 = [*(id *)(a1 + 40) appInstalledSuccessfullyWithBundleID:v20];

      if (v15) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    if (![*(id *)(a1 + 40) shouldIgnoreAppsNotInTrustCache])
    {
      _DMLogFunc();
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if ((objc_msgSend(*(id *)(a1 + 40), "demoteAppWithBundleID:desiredAppState:isInstalled:", v20, 5, 1, v20) & 1) == 0)
      {
        id v19 = v20;
        _DMLogFunc();
      }
      int v17 = objc_msgSend(*(id *)(a1 + 40), "appBundleIDsRequestingStoreDownload", v19);
      [v17 addObject:v20];

      goto LABEL_24;
    }
LABEL_20:
    _DMLogFunc();
LABEL_24:

    goto LABEL_25;
  }
  _DMLogFunc();
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if ((objc_msgSend(*(id *)(a1 + 40), "demoteAppWithBundleID:desiredAppState:isInstalled:", v20, 5, 0, v20) & 1) == 0)
  {
    id v18 = v20;
    _DMLogFunc();
  }
  id v16 = objc_msgSend(*(id *)(a1 + 40), "appBundleIDsRequestingStoreDownload", v18);
  [v16 addObject:v20];

LABEL_25:
}

void sub_AB54(id a1)
{
  qword_19820 = (uint64_t)os_log_create("com.apple.installd", "Signpost");

  _objc_release_x1();
}

id MIBooleanValue(void *a1, id a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  id v2 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      id v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      id v3 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v1 count]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v9 = [v2 copy];

  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_AF38;
  v8[3] = &unk_14960;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_AF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_AF38(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass() & 1) == 0 || a1[6] && (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
}

id MIStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
    }
    else
    {
      id v2 = +[NSString stringWithFormat:@"%@", v1];
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (MIArrayContainsOnlyClass(v1))
      {
        id v2 = v1;
LABEL_7:
        id v3 = v2;
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        id v6 = v1;
        id v2 = +[NSArray arrayWithObjects:&v6 count:1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = [v1 allObjects];
        if (MIArrayContainsOnlyClass(v4)) {
          id v3 = v4;
        }
        else {
          id v3 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

void sub_B3E8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "MISystemAppMigrator: Timed out after waiting 45 seconds to cancel all App Store requests", v0, 2u);
}

void sub_B430(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "MISystemAppMigrator: App Store cancel attempt failed: %@", (uint8_t *)&v1, 0xCu);
}

uint64_t DMGetPreviousBuildVersion()
{
  return _DMGetPreviousBuildVersion();
}

uint64_t IXStringForUninstallDisposition()
{
  return _IXStringForUninstallDisposition();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MIErrorStringForMISError()
{
  return _MIErrorStringForMISError();
}

uint64_t MIIsApplicableToCurrentDeviceFamilyWithError()
{
  return _MIIsApplicableToCurrentDeviceFamilyWithError();
}

uint64_t MISValidateSignature()
{
  return _MISValidateSignature();
}

uint64_t MOLogWrite()
{
  return _MOLogWrite();
}

uint64_t MobileInstallationCheckCapabilitiesMatch()
{
  return _MobileInstallationCheckCapabilitiesMatch();
}

uint64_t MobileInstallationLookupSystemAppState()
{
  return _MobileInstallationLookupSystemAppState();
}

uint64_t MobileInstallationSetSystemAppMigrationComplete()
{
  return _MobileInstallationSetSystemAppMigrationComplete();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return __CFPreferencesAppSynchronizeWithContainer();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return __CFPreferencesCopyAppValueWithContainer();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return __CFPreferencesSetAppValueWithContainer();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t _DMLogFunc()
{
  return __DMLogFunc();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

uint64_t container_copy_object()
{
  return _container_copy_object();
}

uint64_t container_copy_unlocalized_description()
{
  return _container_copy_unlocalized_description();
}

uint64_t container_delete_all_container_content()
{
  return _container_delete_all_container_content();
}

uint64_t container_disk_usage()
{
  return _container_disk_usage();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_error_free()
{
  return _container_error_free();
}

uint64_t container_error_get_path()
{
  return _container_error_get_path();
}

uint64_t container_error_get_posix_errno()
{
  return _container_error_get_posix_errno();
}

uint64_t container_error_get_type()
{
  return _container_error_get_type();
}

uint64_t container_free_array_of_containers()
{
  return _container_free_array_of_containers();
}

uint64_t container_free_object()
{
  return _container_free_object();
}

uint64_t container_get_class()
{
  return _container_get_class();
}

uint64_t container_get_error_description()
{
  return _container_get_error_description();
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_get_info_value_for_key()
{
  return _container_get_info_value_for_key();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_get_persona_unique_string()
{
  return _container_get_persona_unique_string();
}

uint64_t container_is_equal()
{
  return _container_is_equal();
}

uint64_t container_is_new()
{
  return _container_is_new();
}

uint64_t container_is_transient()
{
  return _container_is_transient();
}

uint64_t container_operation_delete_array()
{
  return _container_operation_delete_array();
}

uint64_t container_operation_delete_reclaim_disk_space()
{
  return _container_operation_delete_reclaim_disk_space();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_create_from_container()
{
  return _container_query_create_from_container();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_iterate_results_sync()
{
  return _container_query_iterate_results_sync();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_group_identifiers()
{
  return _container_query_set_group_identifiers();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_include_other_owners()
{
  return _container_query_set_include_other_owners();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

uint64_t container_query_set_transient()
{
  return _container_query_set_transient();
}

uint64_t container_recreate_structure()
{
  return _container_recreate_structure();
}

uint64_t container_regenerate_uuid()
{
  return _container_regenerate_uuid();
}

uint64_t container_replace()
{
  return _container_replace();
}

uint64_t container_serialize_copy_deserialized_reference()
{
  return _container_serialize_copy_deserialized_reference();
}

uint64_t container_serialize_copy_serialized_reference()
{
  return _container_serialize_copy_serialized_reference();
}

uint64_t container_set_info_value()
{
  return _container_set_info_value();
}

uint64_t container_subdirectories_for_class()
{
  return _container_subdirectories_for_class();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_eligibility_get_domain_answer()
{
  return _os_eligibility_get_domain_answer();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appBundleIDsInstalledSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 appBundleIDsInstalledSuccessfully];
}

id objc_msgSend_appBundleIDsRequestingStoreDownload(void *a1, const char *a2, ...)
{
  return [a1 appBundleIDsRequestingStoreDownload];
}

id objc_msgSend_appBundleIDsToUninstall(void *a1, const char *a2, ...)
{
  return [a1 appBundleIDsToUninstall];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_capturePreferencesToMigrate(void *a1, const char *a2, ...)
{
  return [a1 capturePreferencesToMigrate];
}

id objc_msgSend_capturedPreferences(void *a1, const char *a2, ...)
{
  return [a1 capturedPreferences];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codeSigningEnforcementIsDisabled(void *a1, const char *a2, ...)
{
  return [a1 codeSigningEnforcementIsDisabled];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_containerClass(void *a1, const char *a2, ...)
{
  return [a1 containerClass];
}

id objc_msgSend_containerURL(void *a1, const char *a2, ...)
{
  return [a1 containerURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentlyInstalledSystemAppBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 currentlyInstalledSystemAppBundleIdentifiers];
}

id objc_msgSend_currentlyInstallingCoordinators(void *a1, const char *a2, ...)
{
  return [a1 currentlyInstallingCoordinators];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_destinationBundleID(void *a1, const char *a2, ...)
{
  return [a1 destinationBundleID];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_didMigrateBackupFromDifferentDevice(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBackupFromDifferentDevice];
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromBackup];
}

id objc_msgSend_didRestoreFromCloudBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromCloudBackup];
}

id objc_msgSend_didUpgrade(void *a1, const char *a2, ...)
{
  return [a1 didUpgrade];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_finalizePreferencesToMigrate(void *a1, const char *a2, ...)
{
  return [a1 finalizePreferencesToMigrate];
}

id objc_msgSend_forceInstallBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 forceInstallBundleIDs];
}

id objc_msgSend_handleAppEligibilityRequirements(void *a1, const char *a2, ...)
{
  return [a1 handleAppEligibilityRequirements];
}

id objc_msgSend_handleAppFeatureFlagRequirements(void *a1, const char *a2, ...)
{
  return [a1 handleAppFeatureFlagRequirements];
}

id objc_msgSend_handleAppsMissingRequiredCapabilities(void *a1, const char *a2, ...)
{
  return [a1 handleAppsMissingRequiredCapabilities];
}

id objc_msgSend_handleAppsNotCompatibleWithDeviceFamily(void *a1, const char *a2, ...)
{
  return [a1 handleAppsNotCompatibleWithDeviceFamily];
}

id objc_msgSend_handleDefaultInstall(void *a1, const char *a2, ...)
{
  return [a1 handleDefaultInstall];
}

id objc_msgSend_handleForceInstalledApps(void *a1, const char *a2, ...)
{
  return [a1 handleForceInstalledApps];
}

id objc_msgSend_handleSpecialAppActivity(void *a1, const char *a2, ...)
{
  return [a1 handleSpecialAppActivity];
}

id objc_msgSend_handleSpecialAppNews(void *a1, const char *a2, ...)
{
  return [a1 handleSpecialAppNews];
}

id objc_msgSend_handleSupersededSystemApps(void *a1, const char *a2, ...)
{
  return [a1 handleSupersededSystemApps];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_ignoreAppsNotInTrustCacheSentinelFileURL(void *a1, const char *a2, ...)
{
  return [a1 ignoreAppsNotInTrustCacheSentinelFileURL];
}

id objc_msgSend_installdPath(void *a1, const char *a2, ...)
{
  return [a1 installdPath];
}

id objc_msgSend_installedAppListQueue(void *a1, const char *a2, ...)
{
  return [a1 installedAppListQueue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isRegulatedForChina(void *a1, const char *a2, ...)
{
  return [a1 isRegulatedForChina];
}

id objc_msgSend_isTransient(void *a1, const char *a2, ...)
{
  return [a1 isTransient];
}

id objc_msgSend_isiPad(void *a1, const char *a2, ...)
{
  return [a1 isiPad];
}

id objc_msgSend_itemsToInstall(void *a1, const char *a2, ...)
{
  return [a1 itemsToInstall];
}

id objc_msgSend_keyMappings(void *a1, const char *a2, ...)
{
  return [a1 keyMappings];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mcmContainer(void *a1, const char *a2, ...)
{
  return [a1 mcmContainer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pendingAppInstallListQueue(void *a1, const char *a2, ...)
{
  return [a1 pendingAppInstallListQueue];
}

id objc_msgSend_pendingAppInstalls(void *a1, const char *a2, ...)
{
  return [a1 pendingAppInstalls];
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 personaUniqueString];
}

id objc_msgSend_preferencesToMigrate(void *a1, const char *a2, ...)
{
  return [a1 preferencesToMigrate];
}

id objc_msgSend_previousBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 previousBuildVersion];
}

id objc_msgSend_primaryPersonaString(void *a1, const char *a2, ...)
{
  return [a1 primaryPersonaString];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removedSystemAppBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 removedSystemAppBundleIDs];
}

id objc_msgSend_restoredBackupBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 restoredBackupBuildVersion];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldIgnoreAppsNotInTrustCache(void *a1, const char *a2, ...)
{
  return [a1 shouldIgnoreAppsNotInTrustCache];
}

id objc_msgSend_sourceBundleID(void *a1, const char *a2, ...)
{
  return [a1 sourceBundleID];
}

id objc_msgSend_stagedSystemAppBundleIDToInfoMap(void *a1, const char *a2, ...)
{
  return [a1 stagedSystemAppBundleIDToInfoMap];
}

id objc_msgSend_stagedSystemAppsDirectory(void *a1, const char *a2, ...)
{
  return [a1 stagedSystemAppsDirectory];
}

id objc_msgSend_startingSystemAppState(void *a1, const char *a2, ...)
{
  return [a1 startingSystemAppState];
}

id objc_msgSend_synchronouslyCancelAllAppStoreRequests(void *a1, const char *a2, ...)
{
  return [a1 synchronouslyCancelAllAppStoreRequests];
}

id objc_msgSend_systemAppInstallGroup(void *a1, const char *a2, ...)
{
  return [a1 systemAppInstallGroup];
}

id objc_msgSend_systemAppPlaceholderBundleIDToInfoMap(void *a1, const char *a2, ...)
{
  return [a1 systemAppPlaceholderBundleIDToInfoMap];
}

id objc_msgSend_systemAppPlaceholdersDirectory(void *a1, const char *a2, ...)
{
  return [a1 systemAppPlaceholdersDirectory];
}

id objc_msgSend_typeForInstallMachinery(void *a1, const char *a2, ...)
{
  return [a1 typeForInstallMachinery];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_waitForSystemAppInstallDispatchGroup(void *a1, const char *a2, ...)
{
  return [a1 waitForSystemAppInstallDispatchGroup];
}