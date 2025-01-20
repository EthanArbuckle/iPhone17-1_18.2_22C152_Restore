uint64_t sub_5720(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(void *)(result + 32) + 32) & 0x400) != 0;
  return result;
}

uint64_t sub_57E4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 8) == 1;
  return result;
}

void sub_5A6C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:@"container views"];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

BOOL sub_5E2C(id a1, AXValidationManager *a2)
{
  uint64_t v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"bezierPathWithRect:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"addArcWithCenter: radius: startAngle: endAngle: clockwise:", "v", "{CGPoint=dd}", "d", "d", "d", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"addCurveToPoint: controlPoint1: controlPoint2:", "v", "{CGPoint=dd}", "{CGPoint=dd}", "{CGPoint=dd}", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"addLineToPoint:", "v", "{CGPoint=dd}", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"addQuadCurveToPoint: controlPoint:", "v", "{CGPoint=dd}", "{CGPoint=dd}", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"appendPath:", "v", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"applyTransform:", "v", "{CGAffineTransform=dddddd}", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"copyWithZone:", "@", "^{_NSZone=}", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIBezierPath", @"moveToPoint:", "v", "{CGPoint=dd}", 0 hasInstanceMethod withFullSignature];

  return 1;
}

uint64_t sub_5FC0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [v2 setValidationTargetName:v4];

  [v2 setOverrideProcessName:@"Guided Access (UI Server)"];
  [v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_6064(id a1)
{
}

void sub_6070(id a1)
{
}

id sub_6310(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAXUIServerSceneReady:0];
}

id sub_631C(uint64_t a1)
{
  id v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "AXUIServer scene is ready for overlayActiveContentViewController", v4, 2u);
  }

  return [*(id *)(a1 + 32) setIsAXUIServerSceneReady:1];
}

void sub_7480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 sub_7498(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(v1 + 8);
  *(_OWORD *)(v2 + 44) = *(_OWORD *)(v1 + 20);
  *(__n128 *)(v2 + 32) = result;
  return result;
}

void sub_7520(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_37808();
    }

    id v7 = &dword_4 + 2;
  }
  else
  {
    id v7 = [a2 unsignedIntegerValue];
  }
  [*(id *)(a1 + 32) _presentPasscodeViewControllerForSetup:0 passcodeLength:v7];
}

void sub_7D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 sub_7D98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(v1 + 8);
  *(_OWORD *)(v2 + 44) = *(_OWORD *)(v1 + 20);
  *(__n128 *)(v2 + 32) = result;
  return result;
}

void sub_7FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_8014(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_8024(uint64_t a1)
{
}

void sub_802C(uint64_t a1, id a2)
{
  [a2 CGPath];
  uint64_t v3 = AX_CGPathCopyDataRepresentation();
  if (v3)
  {
    v4 = (const void *)v3;
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v5 addObject:v4];
    CFRelease(v4);
  }
}

uint64_t sub_82A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = 1;
  if (v5 && v6)
  {
    if (*(_DWORD *)(a1 + 40) != 1)
    {
      v9 = [*(id *)(a1 + 32) sessionApplicationIdentifiers];
      char v10 = GAXSessionAppsContainMobilePhoneOrFacetime(v9);

      if (v10) {
        goto LABEL_6;
      }
    }
    v11 = [*(id *)(a1 + 32) sessionApplicationIdentifiers];
    unsigned __int8 v12 = [v11 containsObject:@"com.apple.ContactlessUIService"];

    if (v12)
    {
LABEL_6:
      uint64_t v8 = 0;
    }
    else
    {
      v13 = +[AXBackBoardServer server];
      unsigned int v14 = [v13 isRestrictedForAAC];

      if (v14)
      {
        v15 = GAXLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Incoming call was blocked, but not showing banner.", buf, 2u);
        }
      }
      else
      {
        id v16 = [v5 copy];
        id v19 = [v7 copy];
        id v17 = v19;
        v15 = v16;
        AXPerformBlockAsynchronouslyOnMainThread();
      }
      uint64_t v8 = 1;
    }
  }

  return v8;
}

id sub_8464(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayBlockedIncomingCallWithSourceAddress:*(void *)(a1 + 40) serviceIdentifier:*(void *)(a1 + 48)];
}

void sub_8B14(id a1, int64_t a2, NSError *a3)
{
  uint64_t v3 = a3;
  if (v3)
  {
    v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_3788C();
    }
  }
}

void sub_8C40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_8C5C(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSpringboardClient:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _reestablishSpringboardClient];
}

id sub_94CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentPasscodeViewControllerForUnlock];
}

void sub_94D4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 40) == 1)
  {
    id v6 = [v13 objectForKey:@"alert remaining lockout duration"];
    if (v6)
    {
      id v7 = objc_alloc((Class)NSString);
      uint64_t v8 = GAXLocString(@"USER_LOCKED_OUT_VIA_FAIL");
      v9 = GAXLocalizedNumber((uint64_t)v6);
      id v10 = objc_msgSend(v7, "initWithFormat:", v8, v9);

      v11 = [*(id *)(a1 + 32) _showAlertWithText:v10 asBanner:1 isUrgent:0];
      [*(id *)(a1 + 32) setLockoutAlertIdentifier:v11];
    }
  }
  unsigned __int8 v12 = [*(id *)(a1 + 32) passiveInterestAreaViewController];
  if (v12) {
    objc_msgSend(v12, "setAllowsDimmingInterestAreaPaths:animated:", objc_msgSend(*(id *)(a1 + 32), "allowsTouch"), 1);
  }
}

void sub_9798(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKey:@"passcode length"];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_9944(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:@"passcode is correct"];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, [v3 BOOLValue]);
}

void sub_9C60(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:@"interest area paths for storage"];
  id v8 = (id)v3;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _unarchivedPathMappingWithData:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = [*(id *)(a1 + 40) objectForKey:*(void *)(a1 + 48)];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = *(void **)(a1 + 40);
    if (v4) {
      [v7 setObject:v4 forKey:*(void *)(a1 + 48)];
    }
    else {
      [v7 removeObjectForKey:*(void *)(a1 + 48)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) _applyInterestAreaPathsForStorage:v4 toInterestAreaViewController:*(void *)(a1 + 56) andFadeInterestAreaPathsIn:*(unsigned __int8 *)(a1 + 66) fadeInterestAreaSpecialControlsIn:*(unsigned __int8 *)(a1 + 67) notifyClientOfReplacedInterestAreaPathsDuringSession:*(unsigned __int8 *)(a1 + 68)];
  }
}

void sub_A2E4(uint64_t a1)
{
  uint64_t v2 = GAXLocString(@"APP_SELF_LOCK_UNMANAGED_RESTRICTIONS");
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Using custom MC restrictions: %@", buf, 0xCu);
    }

    id v5 = +[MCProfileConnection sharedConnection];
    uint64_t v6 = *(void *)(a1 + 32);
    id v11 = 0;
    [v5 applySingleAppModeConfiguration:v6 clientType:@"com.apple.accessibility.unmanaged.asam" clientUUID:@"com.apple.accessibility.unmanaged.asam.uuid" localizedClientDescription:v2 outError:&v11];
    id v7 = v11;
  }
  else
  {
    id v5 = +[MCProfileConnection sharedConnection];
    id v8 = [*(id *)(a1 + 40) _unmanagedASAMRestrictionDictionaryForStyle:*(void *)(a1 + 48)];
    id v10 = 0;
    [v5 applyRestrictionDictionary:v8 clientType:@"com.apple.accessibility.unmanaged.asam" clientUUID:@"com.apple.accessibility.unmanaged.asam.uuid" localizedClientDescription:v2 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v10];
    id v7 = v10;
  }
  if (v7)
  {
    v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_378F4();
    }
  }
}

void sub_A4E4(id a1)
{
  uint64_t v1 = +[MCProfileConnection sharedConnection];
  uint64_t v2 = GAXLocString(@"APP_SELF_LOCK_UNMANAGED_RESTRICTIONS");
  id v5 = 0;
  [v1 applyRestrictionDictionary:0 clientType:@"com.apple.accessibility.unmanaged.asam" clientUUID:@"com.apple.accessibility.unmanaged.asam.uuid" localizedClientDescription:v2 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v5];
  id v3 = v5;

  if (v3)
  {
    uint64_t v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_3795C();
    }
  }
}

__n128 sub_AE64(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)(a1 + 40);
  *(_OWORD *)(v1 + 20) = *(_OWORD *)(a1 + 52);
  *(__n128 *)(v1 + 8) = result;
  return result;
}

__n128 sub_AE7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)(a1 + 40);
  *(_OWORD *)(v1 + 20) = *(_OWORD *)(a1 + 52);
  *(__n128 *)(v1 + 8) = result;
  return result;
}

void sub_B034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[AXUIDisplayManager sharedDisplayManager];
  id v5 = [*(id *)(a1 + 32) unmanagedASAMConfirmationViewController];
  [v4 removeContentViewController:v5 withUserInteractionEnabled:1 forService:*(void *)(a1 + 32) context:0 completion:0];

  [*(id *)(a1 + 32) setUnmanagedASAMConfirmationViewController:0];
  uint64_t v6 = *(void *)(a1 + 40);
  CFStringRef v9 = @"result";
  id v7 = +[NSNumber numberWithBool:a2];
  id v10 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v8, 0);
}

__n128 sub_BDF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)(a1 + 40);
  *(_OWORD *)(v1 + 20) = *(_OWORD *)(a1 + 52);
  *(__n128 *)(v1 + 8) = result;
  return result;
}

uint64_t sub_BE10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_BE28(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 80) == 1)
  {
    uint64_t v2 = GAXLocString(@"SESSION_STARTED");
    if ((AXDeviceHasHomeButton() & 1) == 0)
    {
      id v3 = AXLocStringKeyForHomeButtonAndExclusiveModel();
      uint64_t v4 = GAXLocString(v3);

      uint64_t v5 = [v2 stringByAppendingFormat:@"\n\n%@", v4];

      uint64_t v2 = (void *)v5;
    }
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"time restrictions enabled"];
    unsigned int v7 = [v6 BOOLValue];

    if (v7)
    {
      id v8 = GAXLocString(@"TIME_RESTRICTION_APP_TIME_REMAINING_CENTER_BANNER");
      CFStringRef v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"time restriction duration"];
      id v10 = GAXLocalizedStringForTimeDuration((double)(uint64_t)[v9 integerValue] * 60.0);
      id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10);

      uint64_t v12 = [v2 stringByAppendingFormat:@"\n\n%@", v11];

      uint64_t v2 = (void *)v12;
    }
    id v13 = [*(id *)(a1 + 40) _showAlertWithText:v2 asBanner:0 isUrgent:0];
  }
  if ([*(id *)(a1 + 40) allowsTouch])
  {
    uint64_t v14 = [*(id *)(a1 + 40) _archivedInterestAreaPathsInScreenCoordinatesForInterestAreaViewController:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v20 = (id)v14;
  if (*(unsigned char *)(a1 + 84))
  {
    v15 = [*(id *)(a1 + 40) _archiveInterestAreaPathsForStorage:*(void *)(a1 + 56)];
  }
  else
  {
    v15 = 0;
  }
  id v16 = [*(id *)(a1 + 40) statesForAppRestrictions];
  id v17 = objc_opt_new();
  v18 = v17;
  if (v16) {
    [v17 setObject:v16 forKey:@"states for restrictions"];
  }
  if (v15) {
    [v18 setObject:v15 forKey:@"interest area paths for storage"];
  }
  if (v20) {
    [v18 setObject:v20 forKey:@"interest area paths in screen coordinates"];
  }
  if (*(void *)(a1 + 64))
  {
    id v19 = +[NSNumber numberWithBool:1];
    [v18 setObject:v19 forKey:@"requires complete hiding workspace message"];
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t sub_C0FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_C10C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 interestAreaViewController];
    uint64_t v4 = [v3 interestAreaPathsForStorage];
    if (v4)
    {
      uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v10 = [*(id *)(a1 + 40) statesForAppRestrictions];
    id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) interfaceOrientation]);
    id v13 = (id)objc_opt_new();
    [v13 setObject:v11 forKey:@"active interface orientation"];
    if (v10) {
      [v13 setObject:v10 forKey:@"states for restrictions"];
    }
    if (v5) {
      [v13 setObject:v5 forKey:@"interest area paths for storage"];
    }
    uint64_t v12 = +[NSNumber numberWithBool:1];
    [v13 setObject:v12 forKey:@"requires complete hiding workspace message"];

    id v9 = v13;
  }
  else
  {
    [*(id *)(a1 + 40) _rotateDeviceToCurrentOrientation];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v6 = *(void **)(a1 + 40);
      unsigned int v7 = GAXLocString(@"SESSION_ENDED");
      id v8 = [v6 _showAlertWithText:v7 subtitleText:0 iconImage:0 asBanner:0 isUrgent:0 duration:2.1];
    }
    [*(id *)(a1 + 40) setPassiveInterestAreaViewController:0];
    id v9 = 0;
  }
  id v14 = v9;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_C308(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__n128 sub_C498(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)(a1 + 40);
  *(_OWORD *)(v1 + 20) = *(_OWORD *)(a1 + 52);
  *(__n128 *)(v1 + 8) = result;
  return result;
}

id sub_C4B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSessionApplicationIdentifiers:*(void *)(a1 + 40)];
}

id sub_C524(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientOfUpdatedActiveInterfaceOrientation];
}

void sub_CF80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id GAXLocString(void *a1)
{
  id v1 = a1;
  if (qword_6E7C0 != -1) {
    dispatch_once(&qword_6E7C0, &stru_5CED0);
  }
  if ((AXDeviceHasHomeButton() & 1) != 0 || !AXDeviceIsPad())
  {
    uint64_t v4 = 0;
LABEL_10:
    unsigned int v7 = +[NSBundle bundleForClass:qword_6E7B8];
    uint64_t v8 = [v7 localizedStringForKey:v1 value:&stru_5E940 table:@"GuidedAccess"];

    uint64_t v4 = (void *)v8;
    goto LABEL_11;
  }
  uint64_t v2 = +[NSBundle bundleForClass:qword_6E7B8];
  id v3 = [v1 stringByAppendingString:@"_NHB_IPAD"];
  uint64_t v4 = [v2 localizedStringForKey:v3 value:&stru_5E940 table:@"GuidedAccess"];

  if (!v4) {
    goto LABEL_10;
  }
  if ([v4 isEqualToString:v1]) {
    goto LABEL_10;
  }
  uint64_t v5 = [v1 stringByAppendingString:@"_NHB_IPAD"];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6) {
    goto LABEL_10;
  }
LABEL_11:

  return v4;
}

void sub_DF24(id a1)
{
  qword_6E7B8 = AXSafeClassFromString();
}

id GAXLocalizedNumber(uint64_t a1)
{
  return +[NSNumberFormatter localizedStringFromNumber:a1 numberStyle:1];
}

uint64_t GAXIsWidescreenPhone()
{
  if (qword_6E7D0 != -1) {
    dispatch_once(&qword_6E7D0, &stru_5CEF0);
  }
  return byte_6E7C8;
}

void sub_DFA4(id a1)
{
  if (GAXUserInterfaceIdiomIsPhone())
  {
    id v2 = +[UIScreen mainScreen];
    [v2 bounds];
    if (v1 > 480.0) {
      byte_6E7C8 = 1;
    }
  }
}

BOOL GAXUserInterfaceIdiomIsPhone()
{
  v0 = +[UIDevice currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

uint64_t GAXIsMiniPad()
{
  if (qword_6E7E0 != -1) {
    dispatch_once(&qword_6E7E0, &stru_5CF10);
  }
  return byte_6E7D8;
}

void sub_E0A4(id a1)
{
  if (GAXUserInterfaceIdiomIsPad())
  {
    BOOL v1 = (void *)MGCopyAnswer();
    if (v1)
    {
      id v2 = v1;
      CFTypeID v3 = CFGetTypeID(v1);
      if (v3 == CFNumberGetTypeID())
      {
        [v2 floatValue];
        double v5 = v4;
        unsigned int v6 = +[UIScreen mainScreen];
        [v6 scale];
        double v8 = v5 / v7;

        if (v8 > 132.0) {
          byte_6E7D8 = 1;
        }
      }
      CFRelease(v2);
    }
  }
}

BOOL GAXUserInterfaceIdiomIsPad()
{
  v0 = +[UIDevice currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == (char *)&dword_0 + 1;

  return v1;
}

double GAXMainScreenScale()
{
  if (qword_6E7E8 != -1) {
    dispatch_once(&qword_6E7E8, &stru_5CF30);
  }
  return *(double *)&qword_6E108;
}

void sub_E1F0(id a1)
{
  id v2 = +[UIScreen mainScreen];
  [v2 scale];
  qword_6E108 = v1;
}

uint64_t sub_F78C()
{
  return NSRequestConcreteImplementation();
}

id sub_FCE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkPresenceOfOverlayUserInterface];
}

void sub_FEE8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasOverlayUserInterface] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v2 overlayUserInterfaceWasEntirelyRemovedFromViewController:*(void *)(a1 + 32)];
    }
  }
}

void sub_10484(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 _gaxIsSimpleRectangle]);
  [v5 setObject:v7 forKey:v6];
}

void sub_10984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_109B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_109C0(uint64_t a1)
{
}

void sub_109C8(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)])
  {
    double v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      double v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v5 addObject:v9];
  }
}

void sub_10B90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10BA8(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (!a3)
  {
    uint64_t v5 = result;
    __n128 result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    if (*(unsigned char *)(*(void *)(*(void *)(v5 + 40) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t sub_10C0C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_10E9C(uint64_t a1, void *a2, void *a3)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10F8C;
  v10[3] = &unk_5CFF8;
  id v11 = *(id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v6 bezierPathByApplyingTransformation:v10];
  id v9 = [v6 _gaxIsSimpleRectangle];

  [v8 _gaxSetSimpleRectangle:v9];
  [*(id *)(a1 + 32) setObject:v8 forKey:v7];
}

uint64_t sub_10F8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1112C(uint64_t a1, void *a2, void *a3)
{
  id key = a3;
  uint64_t v5 = *(__CFDictionary **)(a1 + 40);
  id v6 = a2;
  CFDictionarySetValue(v5, key, v6);
  id v7 = [*(id *)(a1 + 32) objectForKey:v6];

  if (v7)
  {
    id v8 = key;
    objc_msgSend(v8, "_gaxSetSimpleRectangle:", objc_msgSend(v7, "BOOLValue"));
  }
}

void sub_112C8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (objc_opt_isKindOfClass())
  {
    id v6 = [*(id *)(a1 + 32) objectForKey:v8];
    if (objc_opt_isKindOfClass())
    {
      id v7 = [*(id *)(a1 + 32) objectForKey:v5];
    }
    else
    {
      id v7 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1147C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 bounds];
  NSStringFromCGRect(v5);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendFormat:@"\n\tpath: %@", v3];
}

id sub_122A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

id sub_122B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id *sub_122BC(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] setHidden:1];
  }
  return result;
}

void sub_1249C(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

id sub_124A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateSpecialControlsUsingBlock:&stru_5D120];
}

void sub_124B8(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

id sub_124C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateSpecialControlsUsingBlock:&stru_5D140];
}

void sub_124D4(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

id *sub_124E0(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] _enumerateSpecialControlsUsingBlock:&stru_5D160];
  }
  return result;
}

void sub_124F8(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

void sub_12500(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

id sub_12930(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);

  return [v2 _enumerateSpecialControlsUsingBlock:&stru_5D1A0];
}

void sub_12978(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

void sub_12984(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) clippedViews];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setHidden:1];
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
    [*(id *)(a1 + 32) _enumerateSpecialControlsUsingBlock:&stru_5D1C0];
  }
}

void sub_12A90(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

void sub_12A9C(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

id sub_12AA8(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);

  return [v2 _enumerateSpecialControlsUsingBlock:&stru_5D200];
}

void sub_12AF0(id a1, GAXInterestAreaViewButton *a2, unint64_t a3, BOOL *a4)
{
}

id *sub_12AFC(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] setHidden:1];
  }
  return result;
}

void sub_135FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_13620(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  [v3 removeFromSuperview];
  [*(id *)(a1 + 40) addSubview:v3];
}

id sub_13680(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id *sub_1368C(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] removeFromSuperview];
  }
  return result;
}

uint64_t sub_1369C(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 > a2) {
    *(void *)(v2 + 24) = v3 - 1;
  }
  return result;
}

uint64_t sub_136BC(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 > a2) {
    *(void *)(v2 + 24) = v3 - 1;
  }
  return result;
}

void sub_14270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_14294(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

BOOL sub_143CC(id a1, GAXInterestAreaViewButton *a2)
{
  return [(GAXInterestAreaViewButton *)a2 isCloseButton];
}

void sub_14D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose((const void *)(v62 - 248), 8);
  _Unwind_Resume(a1);
}

void sub_14DB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 40) || *(id *)(a1 + 32) != v3)
  {
    id v4 = v3;
    [v3 removeFromSuperview];
    id v3 = v4;
  }
}

uint64_t sub_14E0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_14E1C(uint64_t a1)
{
}

void sub_14E24(uint64_t a1, id a2, void *a3, id a4, char a5, double a6, __n128 a7)
{
  __n128 v47 = a7;
  id v11 = a3;
  if ([*(id *)(a1 + 32) knobPosition] == a2
    && objc_msgSend(*(id *)(a1 + 32), "associatedInterestAreaPathIndex", *(_OWORD *)&v47) == a4)
  {
    goto LABEL_31;
  }
  if (a5)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) >= *(void *)(*(void *)(*(void *)(a1 + 104)
                                                                                              + 8)
                                                                                  + 24))
      goto LABEL_12;
    do
    {
      uint64_t v12 = [*(id *)(a1 + 56) objectAtIndex:v47.n128_u64[0]];
      id v13 = v12;
      if (v12 == *(void **)(a1 + 32))
      {

        id v13 = 0;
        ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
      unint64_t v15 = *(void *)(v14 + 24);
    }
    while (v15 < *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) && v13 == 0);
    if (!v13)
    {
LABEL_12:
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
      if (!v17)
      {
        uint64_t v18 = [*(id *)(a1 + 48) interestAreaViewCloseButtonImage];
        uint64_t v19 = *(void *)(*(void *)(a1 + 112) + 8);
        id v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
      }
      id v13 = +[GAXInterestAreaViewButton buttonWithImage:](GAXInterestAreaViewButton, "buttonWithImage:", v17, v47.n128_u64[0]);
      [v13 setCloseButton:1];
      [*(id *)(a1 + 56) addObject:v13];
      ++*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
      uint64_t v21 = *(void *)(a1 + 96);
LABEL_27:
      ++*(void *)(*(void *)(v21 + 8) + 24);
      [v13 setUserInteractionEnabled:0];
      goto LABEL_28;
    }
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= *(void *)(*(void *)(*(void *)(a1 + 80)
                                                                                              + 8)
                                                                                  + 24))
      goto LABEL_24;
    do
    {
      v22 = [*(id *)(a1 + 40) objectAtIndex:v47.n128_u64[0]];
      id v13 = v22;
      if (v22 == *(void **)(a1 + 32))
      {

        id v13 = 0;
        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
      unint64_t v15 = *(void *)(v14 + 24);
    }
    while (v15 < *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) && v13 == 0);
    if (!v13)
    {
LABEL_24:
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      if (!v24)
      {
        uint64_t v25 = [*(id *)(a1 + 48) interestAreaViewResizingKnobButtonImage];
        uint64_t v26 = *(void *)(*(void *)(a1 + 88) + 8);
        v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      }
      id v13 = +[GAXInterestAreaViewButton buttonWithImage:](GAXInterestAreaViewButton, "buttonWithImage:", v24, v47.n128_u64[0]);
      [v13 setCloseButton:0];
      [*(id *)(a1 + 40) addObject:v13];
      ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      uint64_t v21 = *(void *)(a1 + 72);
      goto LABEL_27;
    }
  }
  *(void *)(v14 + 24) = v15 + 1;
LABEL_28:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
  {
    [*(id *)(a1 + 64) _scaleFactorForSpecialControls];
    v28 = *(_OWORD **)(*(void *)(a1 + 128) + 8);
    CGAffineTransformMakeScale(&v50, v29, v29);
    long long v31 = *(_OWORD *)&v50.c;
    long long v30 = *(_OWORD *)&v50.tx;
    v28[2] = *(_OWORD *)&v50.a;
    v28[3] = v31;
    v28[4] = v30;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 1;
  }
  [v13 setKnobPosition:a2];
  [v13 setAssociatedInterestAreaPathIndex:a4];
  [v13 setAlpha:*(double *)(a1 + 136)];
  v32 = *(_OWORD **)(*(void *)(a1 + 128) + 8);
  long long v33 = v32[4];
  long long v34 = v32[2];
  v49[1] = v32[3];
  v49[2] = v33;
  v49[0] = v34;
  [v13 setTransform:v49];
  [v11 bounds];
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  objc_msgSend(*(id *)(a1 + 64), "_constrainedFrameForInsetFrame:forInterestAreaPathAtIndex:", a4);
  memset(&v50, 0, sizeof(v50));
  GAX_CGAffineTransformMakeWithSourceAndDestinationFrames((uint64_t)&v50, v36, v38, v40, v42, v43, v44, v45, v46);
  objc_msgSend(v13, "gax_setCenter:alignWithGrid:", 1, vaddq_f64(*(float64x2_t *)&v50.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v50.c, v47.n128_f64[0]), *(float64x2_t *)&v50.a, a6)));
  [*(id *)(a1 + 64) addSubview:v13];

LABEL_31:
}

void sub_151E8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) interestAreaView:v6 visibleKnobPositionsForInterestAreaPathAtIndex:a3];
  id v8 = [*(id *)(a1 + 40) interestAreaView:*(void *)(a1 + 32) shouldAddCloseButtonForInterestAreaPathAtIndex:a3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_152D8;
  v11[3] = &unk_5D330;
  id v9 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = v9;
  uint64_t v14 = a3;
  id v10 = v5;
  [v6 _enumerateSpecialControlPropertiesForInterestAreaPath:v10 visibleKnobPositions:v7 hasCloseButton:v8 usingBlock:v11];
}

uint64_t sub_152D8(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, uint64_t))(a1[5] + 16))(a1[5], a2, a1[4], a1[6], a3);
}

BOOL sub_155A8(id a1, GAXInterestAreaViewButton *a2)
{
  return 1;
}

void sub_15734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1575C(void *a1, void *a2)
{
  id v13 = a2;
  id v4 = [v13 superview];
  id v5 = v4;
  if (v4 != (void *)a1[4])
  {

    goto LABEL_10;
  }
  uint64_t v6 = a1[5];
  if (v6)
  {
    char v7 = (*(uint64_t (**)(uint64_t, id))(v6 + 16))(v6, v13);

    if ((v7 & 1) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  [v13 center];
  AX_CGPointGetDistanceToPoint();
  double v9 = v8;
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void *)(v10 + 40);
  uint64_t v11 = (id *)(v10 + 40);
  if (!v12 || v8 < *(double *)(*(void *)(a1[7] + 8) + 24))
  {
    objc_storeStrong(v11, a2);
    *(double *)(*(void *)(a1[7] + 8) + 24) = v9;
  }
LABEL_10:
}

void sub_15E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_15E94(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

BOOL sub_15EDC(id a1, GAXInterestAreaViewButton *a2)
{
  return [(GAXInterestAreaViewButton *)a2 isCloseButton];
}

void sub_17090(uint64_t a1, id a2)
{
  CGContextAddPath(*(CGContextRef *)(a1 + 32), (CGPathRef)[a2 CGPath]);
  id v3 = *(CGContext **)(a1 + 32);

  CGContextStrokePath(v3);
}

void sub_174C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_174DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_174EC(uint64_t a1)
{
}

void sub_174F4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    double v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v6 addPath:v10 withParentPath:v5];
}

id sub_17AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _addInterestAreaPath:a2 withParent:a3 notifyInterestAreaView:*(unsigned __int8 *)(a1 + 40) notifyDelegate:0];
}

void sub_181E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1820C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id result = objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void sub_1853C(uint64_t a1, void *a2)
{
  id v3 = [a2 equivalentPathForDirection:0];
  [*(id *)(a1 + 32) _beginInterestAreaPathsUpdate];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v4 = *(void **)(a1 + 32);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_18748;
  id v13 = &unk_5D4C0;
  id v5 = v3;
  id v14 = v5;
  unint64_t v15 = &v16;
  [v4 _enumerateInterestAreaPathsUsingBlock:&v10];
  if (*((unsigned char *)v17 + 24))
  {

    id v5 = 0;
  }
  else if (v5 && (objc_msgSend(v5, "isEmpty", v10, v11, v12, v13) & 1) == 0)
  {
    if (v5 != *(id *)(a1 + 40))
    {
      uint64_t v8 = [[GAXPathInterpolator alloc] initWithStartingPath:*(void *)(a1 + 40) endingPath:v5];
      [*(id *)(a1 + 32) setPathInterpolator:v8];
      +[NSDate timeIntervalSinceReferenceDate];
      objc_msgSend(*(id *)(a1 + 32), "setSnapAnimationDidStartTimeInterval:");
      double v9 = +[AXDisplayLinkManager currentDisplayLinkManager];
      [v9 addTarget:*(void *)(a1 + 32) selector:"_displayDidRefresh:"];

      [*(id *)(a1 + 32) _updateBackgroundVisibilityAnimated:0];
      goto LABEL_4;
    }
    [*(id *)(a1 + 32) _updateInterestAreaPathsWithPath:v5 updatedInterestAreaPathAlreadyAdded:0];
  }
  objc_msgSend(*(id *)(a1 + 32), "setFingerPath:", 0, v10, v11, v12, v13);
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v7 = +[NSIndexSet indexSetWithIndex:0];
  [v6 deleteDynamicInterestAreaPathAtIndices:v7];

  [*(id *)(a1 + 32) _updateBackgroundVisibilityAnimated:1];
  [*(id *)(a1 + 32) _didFinishRecordingCurrentSequenceOfTouchEvents];
LABEL_4:
  [*(id *)(a1 + 32) _endInterestAreaPathsUpdate];

  _Block_object_dispose(&v16, 8);
}

void sub_18728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_18748(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id result = [a2 containsPath:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

id sub_18CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareInterestAreaPath:a2 toPath:a3];
}

void sub_197D0(_Unwind_Exception *a1)
{
}

void sub_19890(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v17 = a2;
  id v7 = a3;
  if (*(unsigned char *)(a1 + 64))
  {
    if (!v17) {
      goto LABEL_13;
    }
    id v8 = *(id *)(a1 + 32);
    if (v8 == v17) {
      goto LABEL_13;
    }
  }
  else
  {
    if (!v17) {
      goto LABEL_13;
    }
    id v8 = *(id *)(a1 + 32);
  }
  double v9 = [*(id *)(a1 + 40) styleProvider];
  [v9 marginOfErrorForDecidingToMergeInterestAreaPaths];
  unsigned int v10 = objc_msgSend(v8, "containsPath:withMarginOfError:", v17);

  if (v10)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v11 = objc_opt_new();
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v14 = objc_opt_new();
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v17];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addIndex:a4];
  }
LABEL_13:
}

uint64_t sub_199DC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    if (a3)
    {
      id v12 = v5;
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:a3];
      id v6 = v12;
      if (v5)
      {
        id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        if (!v7)
        {
          uint64_t v8 = objc_opt_new();
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
          unsigned int v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;

          id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        }
        id v5 = [v7 addObject:v12];
        id v6 = v12;
      }
    }
  }

  return _objc_release_x1(v5, v6);
}

id sub_19A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareInterestAreaPath:a2 toPath:a3];
}

uint64_t sub_19B94(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_19D50(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _parentOfInterestAreaPath:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1A04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A068(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10 && *(id *)(a1 + 32) == v5)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 addObject:v10];
  }
}

void sub_1A23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A258(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (*(id *)(a1 + 32) != v10 && objc_msgSend(v10, "intersectsPath:"))
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 addObject:v10];
  }
}

void sub_1A764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A77C(uint64_t a1, unint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > a2)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndex:a2];
    [*(id *)(a1 + 40) removePath:v4];
    [*(id *)(a1 + 32) removeObjectAtIndex:a2];
    --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

double sub_1ABE4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", *(void *)(a1 + 40));
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "convertPoint:toWindow:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_convertPointToSceneReferenceSpace:");
  }
  if (*(unsigned char *)(a1 + 72))
  {
    if ((*(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL) == 2) {
      return *(double *)(a1 + 56) - result;
    }
  }
  return result;
}

id sub_1AEBC(uint64_t a1, double a2, double a3)
{
  if ((*(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    a2 = *(double *)(a1 + 56) - a2;
    a3 = *(double *)(a1 + 64) - a3;
  }
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "_convertPointFromSceneReferenceSpace:", a2, a3);
    objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromWindow:", 0);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "convertPoint:fromView:", v5);
}

void sub_1B180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1B8(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  id v8 = a3;
  if (*(id *)(a1 + 32) != v9
    && objc_msgSend(v9, "containsPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a5 = 1;
  }
}

id sub_1B6A0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id result = [a3 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    return [v7 addIndex:a4];
  }
  return result;
}

void sub_1C790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C7C0(uint64_t a1, double *a2, uint64_t a3, unsigned char *a4)
{
  double v5 = *a2;
  uint64_t v6 = *((void *)a2 + 1);
  double v7 = a2[2];
  if (a3)
  {
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    double v9 = *(double *)(a1 + 56);
    if (v8 <= v9 && v9 < v7)
    {
      float v12 = (v9 - v8) / (v7 - v8);
      double InterpolatedPointInSegmentToPoint = GAX_CGPointGetInterpolatedPointInSegmentToPoint(*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *a2, a2[1], v12);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      *(double *)(v14 + 32) = InterpolatedPointInSegmentToPoint;
      *(void *)(v14 + 40) = v15;
      *a4 = 1;
    }
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  *(double *)(v16 + 32) = v5;
  *(void *)(v16 + 40) = v6;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
}

void sub_1C998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 sub_1C9B0(uint64_t a1, double *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = *((void *)a2 + 2);
    double v7 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(v6 + 8) + 48);
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    uint64_t v16 = sub_1CAC8;
    id v17 = &unk_5D6F0;
    uint64_t v20 = v8;
    uint64_t v21 = v5;
    uint64_t v19 = v6;
    long long v9 = *((_OWORD *)a2 + 1);
    __n128 v22 = *(__n128 *)a2;
    long long v23 = v9;
    long long v24 = *((_OWORD *)a2 + 2);
    id v18 = *(id *)(a1 + 32);
    [v7 enumerateLinePointsContextsUsingBlock:&v14];
    int v10 = *((_DWORD *)a2 + 10);
    if (v10 == 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "closePath", v14, v15, v16, v17);
    }
    else if (v10 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", *a2, a2[1], v14, v15, v16, v17);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", *a2, a2[1]);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  __n128 result = *(__n128 *)a2;
  long long v13 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(v11 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v11 + 64) = v13;
  *(__n128 *)(v11 + 32) = result;
  return result;
}

double *sub_1CAC8(double *result, uint64_t a2)
{
  double v2 = *(double *)(a2 + 16);
  double v3 = result[6];
  if (v3 < v2)
  {
    id v4 = result;
    double v5 = result[7];
    if (v2 < v5)
    {
      float v6 = v2 - v3;
      float v7 = v6 / (v5 - v3);
      double InterpolatedPointInSegmentToPoint = GAX_CGPointGetInterpolatedPointInSegmentToPoint(*(double *)(*(void *)(*((void *)result + 5) + 8) + 32), *(double *)(*(void *)(*((void *)result + 5) + 8) + 40), result[8], result[9], v7);
      long long v9 = (void *)*((void *)v4 + 4);
      return (double *)[v9 addLineToPoint:InterpolatedPointInSegmentToPoint];
    }
  }
  return result;
}

void sub_1D058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 216), 8);
  _Unwind_Resume(a1);
}

__n128 sub_1D0A4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)a2;
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v4 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v4 + 64) = v6;
  *(__n128 *)(v4 + 32) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  *a4 = 1;
  return result;
}

uint64_t sub_1D0D4(double *a1, long long *a2)
{
  double v3 = *(double *)(*(void *)(*((void *)a1 + 4) + 8) + 56);
  long long v4 = a2[5];
  v17[4] = a2[4];
  v17[5] = v4;
  v17[6] = a2[6];
  uint64_t v18 = *((void *)a2 + 14);
  long long v5 = a2[1];
  v17[0] = *a2;
  v17[1] = v5;
  long long v6 = a2[3];
  v17[2] = a2[2];
  v17[3] = v6;
  *(double *)&long long v6 = a1[5];
  double v7 = a1[6];
  double v19 = 0.0;
  double v20 = 0.0;
  uint64_t result = GAXPathLineSegmentGetAdjustedAngleRangeForComparingAngleFormedWithCenter((uint64_t)v17, &v20, &v19, v3, *(double *)&v6, v7);
  if ((v3 - v20) * (v3 - v19) <= 0.0)
  {
    uint64_t Count = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    uint64_t result = _AXCArrayGetUnderlyingArray();
    uint64_t v10 = result + 120 * Count;
    long long v11 = a2[3];
    long long v13 = *a2;
    long long v12 = a2[1];
    *(_OWORD *)(v10 + 32) = a2[2];
    *(_OWORD *)(v10 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v11;
    *(_OWORD *)uint64_t v10 = v13;
    *(_OWORD *)(v10 + 16) = v12;
    long long v15 = a2[5];
    long long v14 = a2[6];
    long long v16 = a2[4];
    *(void *)(v10 + 112) = *((void *)a2 + 14);
    *(_OWORD *)(v10 + 80) = v15;
    *(_OWORD *)(v10 + 96) = v14;
    *(_OWORD *)(v10 + 64) = v16;
  }
  return result;
}

uint64_t sub_1D1CC(uint64_t a1, unsigned int a2, CGPoint *a3, uint64_t a4, uint64_t a5)
{
  CGPoint v16 = CGPointZero;
  if (a2 > 1)
  {
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }
  else
  {
    [*(id *)(a1 + 32) distanceFromStartingPointForPointWithElementIndex:a5];
    CGPoint v16 = *a3;
    [*(id *)(a1 + 40) _pointFromStartingPointAtDistance:*(void *)(a1 + 48) inPath:v8 / *(double *)(a1 + 56) * *(double *)(a1 + 64)];
    CGFloat x = v9;
    CGFloat y = v11;
  }
  uint64_t Count = AXCArrayGetCount();
  _AXCArrayPrepareForInsertingElementAtIndex();
  uint64_t result = _AXCArrayGetUnderlyingArray();
  uint64_t v15 = result + 40 * Count;
  *(_DWORD *)uint64_t v15 = a2;
  *(_DWORD *)(v15 + 4) = 0;
  *(CGPoint *)(v15 + _Block_object_dispose(&STACK[0x2D0], 8) = v16;
  *(CGFloat *)(v15 + 24) = x;
  *(CGFloat *)(v15 + 32) = y;
  return result;
}

int sub_1DB88(id a1, const void *a2, const void *a3)
{
  if (*(double *)a2 >= *(double *)a3) {
    int result = 1;
  }
  else {
    int result = -1;
  }
  if (*(double *)a2 == *(double *)a3)
  {
    double v4 = *((double *)a2 + 1);
    double v5 = *((double *)a3 + 1);
    if (v4 >= v5) {
      int v6 = 1;
    }
    else {
      int v6 = -1;
    }
    if (v4 == v5) {
      return 0;
    }
    else {
      return v6;
    }
  }
  return result;
}

void sub_1DFE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1E030(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1E040(uint64_t a1)
{
}

uint64_t sub_1E048(uint64_t a1, void *a2)
{
  double v3 = [a2 smoothPathForFingerPath:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int v6 = *(id **)(v5 + 40);
    double v3 = (id *)(v5 + 40);
    if (v4 != v6)
    {
      double v8 = v4;
      objc_storeStrong(v3, v4);
      double v4 = v8;
    }
  }

  return _objc_release_x1(v3, v4);
}

void sub_1E0C0(void *a1, void *a2, unsigned char *a3)
{
  id v6 = *(id *)(*(void *)(a1[4] + 8) + 40);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [a2 needsRotatedFingerPathToMinimizeBoundsArea])
  {
    if (!*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1E364;
      v28[3] = &unk_5D820;
      v28[4] = a1[4];
      double v7 = objc_retainBlock(v28);
      +[GAXMathUtilities minimizeFunctionWithBlock:v7 intervalStart:0.0 intervalEnd:1.57079633 precision:0.0174532925];
      *(void *)(*(void *)(a1[6] + 8) + 24) = v8;
      id v9 = [*(id *)(*(void *)(a1[4] + 8) + 40) copy];
      uint64_t v10 = *(void *)(a1[5] + 8);
      double v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      long long v12 = *(void **)(*(void *)(a1[5] + 8) + 40);
      CGAffineTransformMakeRotation(&v27, *(CGFloat *)(*(void *)(a1[6] + 8) + 24));
      [v12 applyTransform:&v27];
    }
    double v13 = *(double *)(*(void *)(a1[6] + 8) + 24);
    if (fabs(v13 + -1.57079633) > 0.174532925 && fabs(v13) > 0.174532925)
    {
      id v14 = *(id *)(*(void *)(a1[5] + 8) + 40);

      id v6 = v14;
    }
  }
  double v26 = 0.0;
  uint64_t v15 = [a2 smoothPathForFingerPath:v6 probabilityOfMatch:&v26];
  if (v15)
  {
    uint64_t v16 = *(void *)(a1[7] + 8);
    uint64_t v18 = *(void **)(v16 + 40);
    id v17 = (id *)(v16 + 40);
    if (v15 != v18 && v26 > *(double *)(*(void *)(a1[8] + 8) + 24))
    {
      if (v6 == *(id *)(*(void *)(a1[5] + 8) + 40))
      {
        id v19 = objc_msgSend(v15, "copy", v26);
        uint64_t v20 = *(void *)(a1[7] + 8);
        uint64_t v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        __n128 v22 = *(void **)(*(void *)(a1[7] + 8) + 40);
        CGAffineTransformMakeRotation(&v24, *(CGFloat *)(*(void *)(a1[6] + 8) + 24));
        CGAffineTransformInvert(&v25, &v24);
        [v22 applyTransform:&v25];
      }
      else
      {
        objc_storeStrong(v17, v15);
      }
      double v23 = v26;
      *(double *)(*(void *)(a1[8] + 8) + 24) = v26;
      if (v23 > 0.95) {
        *a3 = 1;
      }
    }
  }
}

double sub_1E364(uint64_t a1, CGFloat a2)
{
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) copy];
  CGAffineTransformMakeRotation(&v11, a2);
  [v3 applyTransform:&v11];
  [v3 bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  double v8 = CGRectGetWidth(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v9 = v8 * CGRectGetHeight(v13);

  return v9;
}

uint64_t sub_1E410(uint64_t a1, void *a2)
{
  id v3 = [a2 smoothPathForFingerPath:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(id **)(v5 + 40);
    id v3 = (id *)(v5 + 40);
    if (v4 != v6)
    {
      double v8 = v4;
      objc_storeStrong(v3, v4);
      double v4 = v8;
    }
  }

  return _objc_release_x1(v3, v4);
}

void sub_1E7B8(id a1)
{
  qword_6E7F0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit", 1);
}

void sub_1E8A8(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTouchIDActivationStatus:1];
  double v2 = [*(id *)(a1 + 32) touchIDActiveTimer];
  int HasPearl = AXDeviceHasPearl();
  double v4 = 1.5;
  if (HasPearl) {
    double v4 = 3.0;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1E95C;
  v5[3] = &unk_5CD28;
  v5[4] = *(void *)(a1 + 32);
  [v2 afterDelay:v5 processBlock:v4];
}

id sub_1E95C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) delegate];
  [v2 touchIDMonitorTimeDidExpire:*(void *)(a1 + 32)];

  id v3 = *(void **)(a1 + 32);

  return [v3 _updateTouchIDActivationStatus:0];
}

id sub_1EA74(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) touchIDActiveTimer];
  [v2 cancel];

  id v3 = *(void **)(a1 + 32);

  return [v3 _updateTouchIDActivationStatus:0];
}

void sub_1F8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

double sub_1F8CC(uint64_t a1, unsigned int a2, double *a3)
{
  if (a2 <= 1)
  {
    GAX_CGPointGetAngleFormedBySegmentToPoint(*(double *)(a1 + 48), *(double *)(a1 + 56), *a3);
    double v5 = v4;
    __sincos_stret(v4);
    double v6 = vabdd_f64(v5, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / 6.28318531;
    AX_CGPointGetDistanceToPoint();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    double result = *(double *)(v8 + 24) + v7 / *(double *)(a1 + 72) * v6;
    *(double *)(v8 + 24) = result;
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  }
  return result;
}

void sub_1FFD4(id a1, NSError *a2)
{
  double v2 = a2;
  if (v2)
  {
    id v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_37C7C((uint64_t)v2, v3);
    }
  }
}

uint64_t sub_201B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_20428(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2043C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_20450(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  double v4 = [v3 objectForKey:@"GAXIPCPayloadKeyShouldAbortServerModeTransition"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5)
  {
    double v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Transition was aborted by system app.", v10, 2u);
    }

    double v7 = 0;
  }
  else
  {
    double v7 = objc_alloc_init(GAXSpringboardClientStatus);
    uint64_t v8 = [v3 objectForKey:@"GAXIPCPayloadKeyFrontmostAppName"];
    [(GAXSpringboardClientStatus *)v7 setSessionApplicationName:v8];

    double v9 = [v3 objectForKey:@"GAXIPCPayloadKeyFrontmostArchivedAppIcon"];
    [(GAXSpringboardClientStatus *)v7 setArchivedSessionApplicationIcon:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_20A5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    double v6 = AXLogIPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_37D7C((uint64_t)v5, v6);
    }
  }
  else
  {
    double v7 = [a2 payload];
    uint64_t v8 = [v7 objectForKey:@"GAXIPCPayloadKeyNewPasscodeLength"];
    [v8 unsignedIntegerValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_20DB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_20DC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_22088(uint64_t result, unsigned int a2, uint64_t a3)
{
  if (a2 <= 1)
  {
    id v3 = (void *)result;
    double v4 = *(double *)a3;
    uint64_t v5 = *(void *)(a3 + 8);
    GAX_CGPointGetAngleFormedBySegmentToPoint(*(double *)(result + 40), *(double *)(result + 48), *(double *)a3);
    uint64_t v7 = v3[7];
    if (v7)
    {
      uint64_t v8 = (double *)(v3[8] + 16);
      uint64_t v9 = 1;
      while ((v6 - *(v8 - 1)) * (v6 - *v8) > 0.0)
      {
        v8 += 3;
        if (!--v7) {
          goto LABEL_9;
        }
      }
      uint64_t v9 = *((void *)v8 - 2);
    }
    else
    {
      uint64_t v9 = 1;
    }
LABEL_9:
    if (v9 != *(void *)(*(void *)(v3[4] + 8) + 24))
    {
      uint64_t Count = AXCArrayGetCount();
      if (Count)
      {
        uint64_t v11 = Count;
        uint64_t v12 = 0;
        for (unint64_t i = 0; i != v11; ++i)
        {
          if (i >= AXCArrayGetCount())
          {
            AXCArrayGetCount();
            _AXAssert();
          }
          long long v17 = *(_OWORD *)(_AXCArrayGetUnderlyingArray() + v12);
          uint64_t v14 = AXCArrayGetCount();
          _AXCArrayPrepareForInsertingElementAtIndex();
          *(_OWORD *)(_AXCArrayGetUnderlyingArray() + 16 * v14) = v17;
          v12 += 16;
        }
      }
      AXCArrayRemoveAllElements();
      *(void *)(*(void *)(v3[4] + 8) + 24) = v9;
    }
    uint64_t v15 = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    double result = _AXCArrayGetUnderlyingArray();
    uint64_t v16 = (double *)(result + 16 * v15);
    *uint64_t v16 = v4;
    *((void *)v16 + 1) = v5;
  }
  return result;
}

id sub_2301C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) transitionDuration];

  return objc_msgSend(v1, "_updateHostedApplicationViewWithAnimationDuration:targetSize:");
}

void sub_2513C(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateEverythingForLayoutMode:*(unsigned int *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

uint64_t sub_25198(uint64_t a1)
{
  [*(id *)(a1 + 32) _didFinishTransitionWithType:*(unsigned int *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_25320(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) setTransitionInProgress:0];
  uint64_t v12 = [*(id *)(a1 + 32) transitionContextQueue];
  id v3 = [v12 count];
  double v4 = v12;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v12, "ax_dequeueObject");
    double v6 = *(void **)(a1 + 32);
    id v7 = [v5 type];
    uint64_t v8 = [v5 completion];
    [v6 _performOrScheduleTransitionWithType:v7 completion:v8];

    uint64_t v9 = [*(id *)(a1 + 32) transitionContextQueue];
    id v10 = [v9 count];

    if (!v10) {
      [*(id *)(a1 + 32) setTransitionContextQueue:0];
    }

    double v4 = v12;
  }

  return _objc_release_x1(v3, v4);
}

id sub_25640(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_2564C(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = *(double *)(a1 + 48) * 0.5;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_25704;
    v5[3] = &unk_5CD28;
    id v6 = *(id *)(a1 + 32);
    +[UIView animateWithDuration:v5 animations:v3];
  }
  return [*(id *)(a1 + 40) removeFromSuperview];
}

id sub_25704(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id *sub_25918(id *result, unsigned int a2, double *a3)
{
  double v4 = result;
  if (a2 > 1)
  {
    if (a2 == 4)
    {
      id v6 = result[5];
      return (id *)[v6 closePath];
    }
  }
  else
  {
    uint64_t result = (id *)objc_msgSend(result[4], "gax_convertPointToDeviceCoordinates:", *a3, a3[1]);
    if (a2 == 1)
    {
      id v7 = v4[5];
      return (id *)objc_msgSend(v7, "addLineToPoint:");
    }
    else if (!a2)
    {
      id v5 = v4[5];
      return (id *)objc_msgSend(v5, "moveToPoint:");
    }
  }
  return result;
}

void sub_259C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) interestAreaView];
  [v4 contentsBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  CGRect v13 = [v3 allValues];
  if (![v13 count]) {
    goto LABEL_14;
  }
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v18 = v13;
  id v19 = [v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
  CGFloat v49 = v8;
  CGFloat v50 = v6;
  CGFloat v47 = v12;
  CGFloat v48 = v10;
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v52;
    do
    {
      for (unint64_t i = 0; i != v20; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v18);
        }
        NSRect v56 = NSRectFromString((NSString *)*(void *)(*((void *)&v51 + 1) + 8 * i));
        CGFloat v23 = v56.origin.x;
        CGFloat v24 = v56.origin.y;
        CGFloat v25 = v56.size.width;
        CGFloat v26 = v56.size.height;
        v56.origin.double x = x;
        v56.origin.double y = y;
        v56.size.double width = width;
        v56.size.double height = height;
        if (CGRectIsNull(v56))
        {
          double height = v26;
          double width = v25;
          double y = v24;
          double x = v23;
        }
        else
        {
          v57.origin.double x = x;
          v57.origin.double y = y;
          v57.size.double width = width;
          v57.size.double height = height;
          v67.origin.double x = v23;
          v67.origin.double y = v24;
          v67.size.double width = v25;
          v67.size.double height = v26;
          CGRect v58 = CGRectUnion(v57, v67);
          double x = v58.origin.x;
          double y = v58.origin.y;
          double width = v58.size.width;
          double height = v58.size.height;
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v20);
  }

  [*(id *)(a1 + 40) bounds];
  CGFloat v27 = v59.origin.x;
  CGFloat v28 = v59.origin.y;
  CGFloat v29 = v59.size.width;
  CGFloat v30 = v59.size.height;
  double v46 = CGRectGetWidth(v59);
  v60.origin.double x = v27;
  v60.origin.double y = v28;
  v60.size.double width = v29;
  v60.size.double height = v30;
  double v31 = v46 * CGRectGetHeight(v60);
  v61.origin.double x = x;
  v61.origin.double y = y;
  v61.size.double width = width;
  v61.size.double height = height;
  double v32 = CGRectGetWidth(v61);
  v62.origin.double x = x;
  v62.origin.double y = y;
  v62.size.double width = width;
  v62.size.double height = height;
  BOOL v33 = v32 * CGRectGetHeight(v62) * 9.0 <= v31;
  double v8 = v49;
  double v6 = v50;
  double v12 = v47;
  double v10 = v48;
  if (v33) {
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 48), "gax_convertRectFromDeviceCoordinates:", x, y, width, height);
  v68.origin.double x = v50;
  v68.origin.double y = v49;
  v68.size.double width = v48;
  v68.size.double height = v47;
  CGRect v64 = CGRectIntersection(v63, v68);
  long long v34 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v64.origin.x, v64.origin.y, v64.size.width, v64.size.height);
  if (!v34)
  {
LABEL_14:
    double v35 = +[UIBezierPath smoothPathForFingerPath:*(void *)(a1 + 40)];
    long long v34 = objc_msgSend(v35, "bezierPathConstrainedToFrame:", v6, v8, v10, v12);
  }
  CGFloat v36 = [*(id *)(a1 + 56) styleProvider];
  double v37 = v36;
  if (v36)
  {
    [v36 minimumSizeForInterestAreaPath];
    double v39 = v38;
    double v41 = v40;
    [v34 bounds];
    CGFloat v42 = v65.origin.x;
    CGFloat v43 = v65.origin.y;
    CGFloat v44 = v65.size.width;
    CGFloat v45 = v65.size.height;
    if (CGRectGetWidth(v65) < v39
      || (v66.origin.double x = v42, v66.origin.y = v43,
                              v66.size.double width = v44,
                              v66.size.double height = v45,
                              CGRectGetHeight(v66) < v41))
    {

      long long v34 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_27E0C(id a1)
{
  v15[0] = @"GAXFeatureViewIdentifierKey";
  v15[1] = @"GAXFeatureViewIconKey";
  v16[0] = @"GAXProfileAllowsLockButton";
  v16[1] = @"hardwareFeatureViewLockIcon";
  v15[2] = @"GAXFeatureViewLocalizedTextKey";
  uint64_t v1 = AXLocStringKeyForModel();
  uint64_t v2 = AXLocStringKeyForHomeButton();
  v16[2] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  v17[0] = v3;
  v13[0] = @"GAXFeatureViewIdentifierKey";
  v13[1] = @"GAXFeatureViewIconKey";
  v14[0] = @"GAXProfileAllowsVolumeButtons";
  v14[1] = @"hardwareFeatureViewVolumeIcon";
  v13[2] = @"GAXFeatureViewLocalizedTextKey";
  v14[2] = @"HARDWARE_FEATURE_VOLUME";
  double v4 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v17[1] = v4;
  v11[0] = @"GAXFeatureViewIdentifierKey";
  v11[1] = @"GAXFeatureViewIconKey";
  v12[0] = @"GAXProfileAllowsMotion";
  v12[1] = @"systemFeatureViewMotionIcon";
  v11[2] = @"GAXFeatureViewLocalizedTextKey";
  v12[2] = @"SYS_FEATURE_MOTION";
  double v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  v17[2] = v5;
  v9[0] = @"GAXFeatureViewIdentifierKey";
  v9[1] = @"GAXFeatureViewIconKey";
  v10[0] = @"GAXProfileAllowsKeyboardTextInput";
  v10[1] = @"systemFeatureViewKeyboardIcon";
  v9[2] = @"GAXFeatureViewLocalizedTextKey";
  v10[2] = @"SYS_FEATURE_KEYBOARD_TEXT_INPUT";
  double v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  v17[3] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v17 count:4];
  double v8 = (void *)qword_6E800;
  qword_6E800 = v7;
}

void sub_280D0(id a1)
{
  v4[0] = @"GAXFeatureViewIdentifierKey";
  v4[1] = @"GAXFeatureViewIconKey";
  v5[0] = @"GAXProfileAllowsTouch";
  v5[1] = @"systemFeatureViewTouchIcon";
  v4[2] = @"GAXFeatureViewLocalizedTextKey";
  v5[2] = @"SYS_FEATURE_TOUCH";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  double v6 = v1;
  uint64_t v2 = +[NSArray arrayWithObjects:&v6 count:1];
  id v3 = (void *)qword_6E810;
  qword_6E810 = v2;
}

void sub_28354(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 iconForAppRestrictionWithIdentifier:v4];
  double v5 = [*(id *)(a1 + 32) textForAppRestrictionWithIdentifier:v4];
  double v6 = [*(id *)(a1 + 32) detailTextForAppRestrictionWithIdentifier:v4];
  [*(id *)(a1 + 32) appRestrictionStateForIdentifier:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_28538(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 objectForKeyedSubscript:@"GAXFeatureViewIdentifierKey"];
  id v4 = *(void **)(a1 + 32);
  double v5 = [v3 objectForKeyedSubscript:@"GAXFeatureViewIconKey"];
  double v6 = [v4 valueForKey:v5];

  id v7 = [v3 objectForKeyedSubscript:@"GAXFeatureViewLocalizedTextKey"];

  double v8 = GAXLocString(v7);

  [*(id *)(a1 + 40) isFeatureEnabledForIdentifier:v9];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_28748(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 objectForKeyedSubscript:@"GAXFeatureViewIdentifierKey"];
  id v4 = *(void **)(a1 + 32);
  double v5 = [v3 objectForKeyedSubscript:@"GAXFeatureViewIconKey"];
  double v6 = [v4 valueForKey:v5];

  id v7 = [v3 objectForKeyedSubscript:@"GAXFeatureViewLocalizedTextKey"];

  double v8 = GAXLocString(v7);

  [*(id *)(a1 + 40) isFeatureEnabledForIdentifier:v9];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_29618(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) instructionsLabel];
  [v2 setAlpha:v1];
}

void sub_29840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = +[GAXFeatureView systemFeatureViewWithIdentifier:a2 icon:a3 text:a4 initialState:a5 styleProvider:*(void *)(a1 + 32)];
  [v7 setDelegate:*(void *)(a1 + 40)];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 48) addObject:v7];
    double v6 = v7;
  }
}

void sub_29B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v7 = +[GAXFeatureView appFeatureViewWithIdentifier:a2 icon:a3 text:a4 detailText:a5 initialState:a6 styleProvider:*(void *)(a1 + 32)];
  [v7 setDelegate:*(void *)(a1 + 40)];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 48) addObject:v7];
}

void sub_29CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = +[GAXFeatureView hardwareFeatureViewWithIdentifier:a2 icon:a3 text:a4 initialState:a5 styleProvider:*(void *)(a1 + 32)];
  [v6 setDelegate:*(void *)(a1 + 40)];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 48) addObject:v6];
}

void sub_2A074(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) instructionsLabel];
  [v2 setAlpha:v1];
}

void sub_2A250(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) optionsView];
  [v1 layoutIfNeeded];
}

void sub_2A294(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) resetCountDownDurationForDatePicker];
    id v2 = [*(id *)(a1 + 40) optionsView];
    id v4 = [v2 featuresScrollView];

    id v3 = *(void **)(a1 + 32);
    [v3 bounds];
    objc_msgSend(v3, "convertRect:toView:", v4);
    objc_msgSend(v4, "scrollRectToVisible:animated:", 1);
  }
}

id sub_2AF24(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSubview:a2];
}

void sub_2AF30(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc((Class)UIVisualEffectView);
  id v7 = [*(id *)(a1 + 32) featureViewOptionsBlurEffect];
  double v8 = +[UIVibrancyEffect effectForBlurEffect:v7 style:4];
  id v13 = [v6 initWithEffect:v8];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 40) addSubview:v13];
  id v9 = [v13 contentView];
  [v9 addSubview:v5];

  double v10 = [v13 contentView];
  objc_msgSend(v5, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:", 3, 3, v10);
  objc_msgSend(v5, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:", 4, 4, v10);
  objc_msgSend(v5, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:", 5, 5, v10);
  objc_msgSend(v5, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:", 6, 6, v10);

  double v11 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3 + 1];
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:", 4, 3, v11);

  objc_msgSend(v13, "ax_constrainLayoutAttribute:asEqualToConstant:", 8, *(double *)(a1 + 56));
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 5, *(void *)(a1 + 40), *(double *)(a1 + 64));
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 6, *(void *)(a1 + 40), *(double *)(a1 + 72));
  double v12 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:", 3, 4, v12);
}

void sub_2B110(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = v5;
  if (a3)
  {
    if (*(void *)(a1 + 48) != a3) {
      goto LABEL_6;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(double *)(a1 + 64);
    uint64_t v8 = 4;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(double *)(a1 + 56);
    uint64_t v8 = 3;
  }
  objc_msgSend(v5, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", v8, v6, v7);
LABEL_6:
  [*(id *)(a1 + 40) featureViewMinimumHeight];
  objc_msgSend(v9, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToConstant:priority:", 8);
  objc_msgSend(v9, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 5, *(void *)(a1 + 32), *(double *)(a1 + 72));
  objc_msgSend(v9, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 6, *(void *)(a1 + 32), *(double *)(a1 + 80));
}

id sub_2B3E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundDimmingView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) modalView];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 32) modalViewBottomConstraint];
  [v6 setConstant:v5];

  double v7 = *(void **)(a1 + 32);

  return [v7 layoutIfNeeded];
}

void sub_2B484(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) superview];
  id v3 = [*(id *)(a1 + 32) optionsViewPresentationConstraints];
  [v2 removeConstraints:v3];

  [*(id *)(a1 + 32) removeFromSuperview];
  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;

  UIAccessibilityPostNotification(v4, 0);
}

void sub_2B550(id a1, GAXFeatureView *a2, unint64_t a3, BOOL *a4)
{
}

id sub_2B844(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addConstraint:a2];
}

void sub_2B850(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundDimmingView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) modalViewBottomConstraint];
  [v3 setConstant:0.0];

  [*(id *)(a1 + 32) layoutIfNeeded];
  id v7 = [*(id *)(a1 + 32) featuresScrollView];
  UIAccessibilityNotifications v4 = [*(id *)(a1 + 32) featuresContentView];
  [v4 frame];
  objc_msgSend(v7, "setContentSize:", v5, v6);
}

void sub_2B904(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featuresScrollView];
  [v2 flashScrollIndicators];

  LODWORD(v2) = UIAccessibilityLayoutChangedNotification;
  id v3 = [*(id *)(a1 + 32) modalView];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);
}

void sub_2C240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2C258(uint64_t result)
{
  return result;
}

void sub_2C894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_2C8AC(id result, unsigned int a2, double *a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a2 <= 1)
  {
    id v7 = (id *)result;
    double v8 = *a3;
    double v9 = a3[1];
    double v10 = *((double *)result + 6);
    if (v10 == 0.0)
    {
      uint64_t result = objc_msgSend(*((id *)result + 4), "containsPoint:", v8, v9);
    }
    else
    {
      unint64_t v11 = 0;
      double v12 = (double *)v14;
      double v13 = *a3;
      *(double *)uint64_t v14 = v9;
      *(double *)&v14[1] = v8 - v10;
      *(double *)&v14[2] = v9 - v10;
      *(double *)&void v14[3] = v8 + v10;
      *(double *)&v14[4] = v9 - v10;
      *(double *)&v14[5] = v8 + v10;
      *(double *)&v14[6] = v9 + v10;
      *(double *)&v14[7] = v8 - v10;
      *(double *)&v14[8] = v9 + v10;
      do
      {
        uint64_t result = objc_msgSend(v7[4], "containsPoint:", *(v12 - 1), *v12);
        if (v11 > 3) {
          break;
        }
        ++v11;
        v12 += 2;
      }
      while ((result & 1) == 0);
    }
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*((void *)v7[5] + 1) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
      *a6 = 1;
    }
  }
  return result;
}

void sub_2CB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id *sub_2CB5C(id *result, unsigned int a2, double *a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a2 <= 1)
  {
    id v7 = result;
    uint64_t result = (id *)objc_msgSend(result[4], "containsPoint:", *a3, a3[1]);
    if (result)
    {
      *(unsigned char *)(*((void *)v7[5] + 1) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      *a6 = 1;
    }
  }
  return result;
}

id *sub_2CBB0(id *result, unsigned int a2, double *a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a2 <= 1)
  {
    id v7 = result;
    uint64_t result = (id *)objc_msgSend(result[4], "containsPoint:", *a3, a3[1]);
    if (result)
    {
      *(unsigned char *)(*((void *)v7[5] + 1) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      *a6 = 1;
    }
  }
  return result;
}

void sub_2CCC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

double sub_2CCD8(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a2 + 24);
  double v3 = *(double *)(a2 + 72);
  if (v2 * v3 < 0.0)
  {
    double v4 = *(unsigned char *)(a2 + 96) ? *(double *)a2 : (*(double *)(a1 + 48) - *(double *)(a2 + 112)) / *(double *)(a2 + 104);
    if (v4 < *(double *)(a1 + 40))
    {
      if (v2 * 3.14159265 >= 0.0)
      {
        if (v3 * 3.14159265 < 0.0) {
          double v3 = v3 + 6.28318531;
        }
      }
      else
      {
        double v2 = v2 + 6.28318531;
      }
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v3 - v2 + *(double *)(v5 + 24);
  *(double *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = result;
  return result;
}

void sub_2CFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 sub_2D010(uint64_t a1, unsigned int a2, CGPoint *a3)
{
  CGPoint v9 = CGPointZero;
  if (a2 <= 1) {
    CGPoint v9 = *a3;
  }
  uint64_t Count = AXCArrayGetCount();
  _AXCArrayPrepareForInsertingElementAtIndex();
  *(_DWORD *)(_AXCArrayGetUnderlyingArray() + 4 * Count) = a2;
  uint64_t v6 = AXCArrayGetCount();
  _AXCArrayPrepareForInsertingElementAtIndex();
  UnderlyingArradouble y = _AXCArrayGetUnderlyingArray();
  __n128 result = (__n128)v9;
  *(CGPoint *)(UnderlyingArray + 16 * v6) = v9;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double sub_2D1A8(double *a1, double a2, double a3)
{
  AX_CGPointGetDistanceToPoint();
  double v7 = v6 - a1[6];
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  float v8 = v7 / v6;
  double v9 = a1[4];
  double v10 = a1[5];

  return GAX_CGPointGetInterpolatedPointInSegmentToPoint(v9, v10, a2, a3, v8);
}

void *sub_2D2F4(void *result, unsigned int a2, double *a3)
{
  double v4 = result;
  if (a2 >= 2)
  {
    if (a2 == 4)
    {
      float v8 = (void *)result[4];
      return [v8 closePath];
    }
  }
  else
  {
    double v5 = *a3;
    double v6 = a3[1];
    __n128 result = (void *)result[5];
    if (result) {
      __n128 result = (void *)((uint64_t (*)(double, double))result[2])(v5, v6);
    }
    if (a2 == 1)
    {
      double v9 = (void *)v4[4];
      return objc_msgSend(v9, "addLineToPoint:", v5, v6);
    }
    else if (!a2)
    {
      double v7 = (void *)v4[4];
      return objc_msgSend(v7, "moveToPoint:", v5, v6);
    }
  }
  return result;
}

void sub_2D500(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id *sub_2D518(id *result, uint64_t a2, double *a3, uint64_t a4, unint64_t a5)
{
  if ((unint64_t)result[6] <= a5)
  {
    double v6 = result;
    if (a2 > 1)
    {
      uint64_t v12 = *((void *)result[5] + 1);
      if (a2 == 4)
      {
        *(unsigned char *)(v12 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      }
      else if (*(unsigned char *)(v12 + 24))
      {
        *(unsigned char *)(v12 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
      }
    }
    else
    {
      uint64_t v8 = *((void *)result[5] + 1);
      if (*(unsigned char *)(v8 + 24))
      {
        *(unsigned char *)(v8 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
        [result[4] closePath];
      }
      id v9 = v6[4];
      double v10 = *a3;
      double v11 = a3[1];
      return (id *)objc_msgSend(v9, "appendElementOfType:withSinglePoint:", a2, v10, v11);
    }
  }
  return result;
}

id *sub_2D5D0(id *result, uint64_t a2, double *a3, uint64_t a4, unint64_t a5, unsigned char *a6)
{
  double v7 = result;
  id v8 = result[6];
  if ((unint64_t)v8 <= a5)
  {
    if (v8 == (id)a5)
    {
      if (a2 == 1) {
        __n128 result = (id *)[result[4] closePath];
      }
      *a6 = 1;
    }
  }
  else
  {
    uint64_t v9 = *((void *)result[5] + 1);
    if (a2 <= 1)
    {
      if (a5)
      {
        if (*(unsigned char *)(v9 + 24))
        {
          *(unsigned char *)(v9 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
          [result[4] closePath];
        }
      }
      else if (*(unsigned char *)(v9 + 24))
      {
        *(unsigned char *)(v9 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
        id v12 = result[4];
        double v13 = *a3;
        double v14 = a3[1];
        uint64_t v15 = 1;
LABEL_18:
        return (id *)objc_msgSend(v12, "appendElementOfType:withSinglePoint:", v15, v13, v14);
      }
      id v12 = v7[4];
      double v13 = *a3;
      double v14 = a3[1];
      uint64_t v15 = a2;
      goto LABEL_18;
    }
    if (a2 == 4)
    {
      *(unsigned char *)(v9 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    }
    else if (*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    }
  }
  return result;
}

void sub_2D7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2D7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a5;
    *a6 = 1;
  }
  return result;
}

void sub_2DEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

CGFloat sub_2DF4C(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = 0.0;
  double v6 = 0.0;
  if (a2 != a4)
  {
    double v5 = (a5 - a3) / (a4 - a2);
    double v6 = a3 - v5 * a2;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    id v8 = (double *)(*(void *)(a1 + 40) + 32);
    do
    {
      double v9 = *(v8 - 3);
      double v10 = *(v8 - 2);
      double v11 = *(v8 - 1);
      double v12 = *v8;
      if (a2 != a4 && v9 == v11)
      {
        double v16 = v6 + v5 * v9;
        if ((v16 - v10) * (v16 - v12) <= 0.0 && (v9 - a2) * (v9 - a4) <= 0.0 && (v16 - a3) * (v16 - a5) <= 0.0) {
          return v9;
        }
      }
      else if (v10 == v12 && a3 != a5)
      {
        double v15 = a2;
        if (a2 != a4) {
          double v15 = (v10 - v6) / v5;
        }
        if ((v15 - v9) * (v15 - v11) <= 0.0 && (v15 - a2) * (v15 - a4) <= 0.0)
        {
          double v9 = v15;
          if ((v10 - a3) * (v10 - a5) <= 0.0) {
            return v9;
          }
        }
      }
      v8 += 5;
      --v7;
    }
    while (v7);
  }
  return CGPointZero.x;
}

uint64_t sub_2E064(uint64_t a1, double a2)
{
  GAX_CGPointGetAngleFormedBySegmentToPoint(*(double *)(a1 + 32), *(double *)(a1 + 40), a2);
  uint64_t v4 = *(void *)(a1 + 48);
  if (!v4) {
    return 1;
  }
  double v5 = (double *)(*(void *)(a1 + 56) + 16);
  uint64_t result = 1;
  while ((v3 - *(v5 - 1)) * (v3 - *v5) > 0.0)
  {
    v5 += 3;
    if (!--v4) {
      return result;
    }
  }
  return *((void *)v5 - 2);
}

double sub_2E0DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    return CGPointZero.x;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  double v5 = (double *)(v4 + 16);
  uint64_t v6 = *(void *)(a1 + 32);
  while (*((void *)v5 - 2) != a2)
  {
    v5 += 5;
    if (!--v6) {
      return CGPointZero.x;
    }
  }
  for (unint64_t i = (double *)(v4 + 16); *((void *)i - 2) != a3; i += 5)
  {
    if (!--v3) {
      return CGPointZero.x;
    }
  }
  double result = *(v5 - 1);
  if (result != i[1] || *v5 != i[2])
  {
    double result = v5[1];
    if (result != *(i - 1) || v5[2] != *i) {
      return CGPointZero.x;
    }
  }
  return result;
}

BOOL sub_2E17C(CGRect *a1, unsigned int a2, CGPoint *a3)
{
  return a2 <= 1 && CGRectContainsPoint(a1[1], *a3);
}

uint64_t sub_2E19C(uint64_t result, unsigned int a2, double *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = result;
  if (a2 > 1)
  {
    if (a2 == 4)
    {
      uint64_t v10 = *(void *)(*(void *)(result + 64) + 8);
      double x = *(double *)(v10 + 32);
      double y = *(double *)(v10 + 40);
    }
    else
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
    }
  }
  else
  {
    double x = *a3;
    double y = a3[1];
    if (!a2)
    {
      uint64_t v9 = *(void *)(*(void *)(result + 64) + 8);
      *(double *)(v9 + 32) = x;
      *(double *)(v9 + 40) = y;
    }
  }
  uint64_t v11 = *(void *)(*(void *)(result + 72) + 8);
  if (*(double *)(v11 + 32) != x || *(double *)(v11 + 40) != y)
  {
    if (!a5)
    {
      double result = (uint64_t)objc_msgSend(*(id *)(result + 32), "moveToPoint:", x, y);
      goto LABEL_62;
    }
    v46.double x = x;
    v46.double y = y;
    double result = CGRectContainsPoint(*(CGRect *)(result + 112), v46);
    int v13 = result;
    double v14 = CGPointZero.x;
    double v15 = CGPointZero.y;
    if (*(unsigned char *)(*(void *)(*(void *)(v6 + 80) + 8) + 24) && ((result ^ 1) & 1) == 0)
    {
      switch(a2)
      {
        case 4u:
          double result = (uint64_t)[*(id *)(v6 + 32) closePath];
          *(unsigned char *)(*(void *)(*(void *)(v6 + 88) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
          break;
        case 1u:
          double result = (uint64_t)objc_msgSend(*(id *)(v6 + 32), "addLineToPoint:", x, y);
          break;
        case 0u:
          double result = (uint64_t)objc_msgSend(*(id *)(v6 + 32), "moveToPoint:", x, y);
          break;
      }
      goto LABEL_42;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(v6 + 80) + 8) + 24)) {
      char v16 = result;
    }
    else {
      char v16 = 1;
    }
    if (v16)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v6 + 80) + 8) + 24)) {
        int v17 = 1;
      }
      else {
        int v17 = result;
      }
      double v18 = x;
      double v19 = y;
      if (v17 == 1)
      {
        if ((*(unsigned char *)(*(void *)(*(void *)(v6 + 80) + 8) + 24) != 0) | (result ^ 1) & 1)
        {
LABEL_42:
          if (*(unsigned char *)(*(void *)(*(void *)(v6 + 80) + 8) + 24)) {
            int v35 = 0;
          }
          else {
            int v35 = v13;
          }
          if (v35 != 1) {
            goto LABEL_63;
          }
          if (*(void *)(*(void *)(*(void *)(v6 + 104) + 8) + 24))
          {
            uint64_t v36 = 0;
            unint64_t v37 = 0;
            do
            {
              uint64_t v38 = *(void *)(v6 + 144);
              if (v37 >= AXCArrayGetCount())
              {
                uint64_t Count = AXCArrayGetCount();
                unint64_t v45 = v37;
                uint64_t v43 = v38;
                _AXAssert();
              }
              UnderlyingArradouble y = _AXCArrayGetUnderlyingArray();
              objc_msgSend(*(id *)(v6 + 32), "addLineToPoint:", *(double *)(UnderlyingArray + v36 + 8), *(double *)(UnderlyingArray + v36 + 16));
              ++v37;
              v36 += 24;
            }
            while (v37 < *(void *)(*(void *)(*(void *)(v6 + 104) + 8) + 24));
          }
          BOOL v40 = v15 == y && v14 == x;
          if (a2 == 4 && v40)
          {
            double result = (uint64_t)[*(id *)(v6 + 32) closePath];
            *(unsigned char *)(*(void *)(*(void *)(v6 + 88) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
          }
          else
          {
            double result = (uint64_t)objc_msgSend(*(id *)(v6 + 32), "addLineToPoint:", v14, v15, v43, Count, v45);
            if (!v40)
            {
              double v41 = *(void **)(v6 + 32);
              if (a2 == 4)
              {
                double result = (uint64_t)[v41 closePath];
                *(unsigned char *)(*(void *)(*(void *)(v6 + 88) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
              }
              else
              {
                double result = (uint64_t)objc_msgSend(v41, "addLineToPoint:", x, y);
              }
            }
          }
          *(void *)(*(void *)(*(void *)(v6 + 104) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
LABEL_62:
          LOBYTE(v13) = 1;
LABEL_63:
          uint64_t v42 = *(void *)(*(void *)(v6 + 72) + 8);
          *(double *)(v42 + 32) = x;
          *(double *)(v42 + 40) = y;
          *(unsigned char *)(*(void *)(*(void *)(v6 + 80) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v13;
          return result;
        }
        double v18 = (*(double (**)(double, double, double, double))(*(void *)(v6 + 40) + 16))(*(double *)(*(void *)(*(void *)(v6 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(v6 + 72) + 8) + 40), x, y);
        double v19 = v20;
      }
    }
    else
    {
      double v21 = (*(double (**)(double, double, double, double))(*(void *)(v6 + 40) + 16))(*(double *)(*(void *)(*(void *)(v6 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(v6 + 72) + 8) + 40), x, y);
      double v23 = v22;
      objc_msgSend(*(id *)(v6 + 32), "addLineToPoint:");
      *(void *)(*(void *)(*(void *)(v6 + 96) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = (*(uint64_t (**)(double, double))(*(void *)(v6 + 48) + 16))(v21, v23);
      double v18 = x;
      double v19 = y;
    }
    double result = (*(uint64_t (**)(double, double))(*(void *)(v6 + 48) + 16))(v18, v19);
    uint64_t v24 = *(void *)(*(void *)(*(void *)(v6 + 96) + 8) + 24);
    if (v24 == result)
    {
LABEL_41:
      double v14 = v18;
      double v15 = v19;
      goto LABEL_42;
    }
    uint64_t v25 = result;
    uint64_t v26 = *(void *)(*(void *)(*(void *)(v6 + 104) + 8) + 24);
    if (v26)
    {
      uint64_t v27 = *(void *)(v6 + 144);
      unint64_t v28 = v26 - 1;
      if (v26 - 1 >= (unint64_t)AXCArrayGetCount())
      {
        uint64_t Count = AXCArrayGetCount();
        unint64_t v45 = v28;
        uint64_t v43 = v27;
        _AXAssert();
      }
      double result = _AXCArrayGetUnderlyingArray();
      if (*(void *)(result + 24 * v28) == v25)
      {
        uint64_t v29 = -1;
LABEL_40:
        *(void *)(*(void *)(*(void *)(v6 + 104) + 8) + 24) += v29;
        *(void *)(*(void *)(*(void *)(v6 + 96) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v25;
        goto LABEL_41;
      }
      uint64_t v24 = *(void *)(*(void *)(*(void *)(v6 + 96) + 8) + 24);
    }
    double v30 = (*(double (**)(void, uint64_t, uint64_t))(*(void *)(v6 + 56) + 16))(*(void *)(v6 + 56), v24, v25);
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)(*(void *)(*(void *)(v6 + 104) + 8) + 24);
    _AXCArrayPrepareForInsertingElementAtIndex();
    double result = _AXCArrayGetUnderlyingArray();
    long long v34 = (double *)(result + 24 * v33);
    *(void *)long long v34 = v24;
    v34[1] = v30;
    *((void *)v34 + 2) = v32;
    uint64_t v29 = 1;
    goto LABEL_40;
  }
  return result;
}

void sub_2E8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

__n128 sub_2E914(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = *(void *)(a1[5] + 8);
    if (*(double *)a2 != *(double *)(v5 + 32) || *(double *)(a2 + 8) != *(double *)(v5 + 40))
    {
      (*(void (**)(void))(a1[4] + 16))();
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
  }
  uint64_t v7 = *(void *)(a1[5] + 8);
  __n128 result = *(__n128 *)a2;
  long long v9 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v7 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 + 64) = v9;
  *(__n128 *)(v7 + 32) = result;
  return result;
}

void sub_2EB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 sub_2EB88(uint64_t a1, unsigned int a2, __n128 *a3)
{
  if (a2 <= 3)
  {
    uint64_t Count = AXCArrayGetCount();
    _AXCArrayPrepareForInsertingElementAtIndex();
    UnderlyingArradouble y = _AXCArrayGetUnderlyingArray();
    __n128 result = *a3;
    *(__n128 *)(UnderlyingArray + 16 * Count) = *a3;
  }
  return result;
}

int sub_2ED58(id a1, const void *a2, const void *a3)
{
  if (*(double *)a2 >= *(double *)a3) {
    int result = 1;
  }
  else {
    int result = -1;
  }
  if (*(double *)a2 == *(double *)a3)
  {
    double v4 = *((double *)a2 + 1);
    double v5 = *((double *)a3 + 1);
    if (v4 >= v5) {
      int v6 = 1;
    }
    else {
      int v6 = -1;
    }
    if (v4 == v5) {
      return 0;
    }
    else {
      return v6;
    }
  }
  return result;
}

int sub_2EF30(id a1, const void *a2, const void *a3)
{
  if (*(double *)a2 >= *(double *)a3) {
    int result = 1;
  }
  else {
    int result = -1;
  }
  if (*(double *)a2 == *(double *)a3)
  {
    double v4 = *((double *)a2 + 1);
    double v5 = *((double *)a3 + 1);
    if (v4 >= v5) {
      int v6 = 1;
    }
    else {
      int v6 = -1;
    }
    if (v4 == v5) {
      return 0;
    }
    else {
      return v6;
    }
  }
  return result;
}

int sub_2EF60(id a1, const void *a2, const void *a3)
{
  if (*(double *)a2 >= *(double *)a3) {
    int result = 1;
  }
  else {
    int result = -1;
  }
  if (*(double *)a2 == *(double *)a3)
  {
    double v4 = *((double *)a2 + 1);
    double v5 = *((double *)a3 + 1);
    if (v4 >= v5) {
      int v6 = 1;
    }
    else {
      int v6 = -1;
    }
    if (v4 == v5) {
      return 0;
    }
    else {
      return v6;
    }
  }
  return result;
}

void sub_2F2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 176), 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2F2DC(uint64_t a1, uint64_t a2, int a3, char a4, double a5, double a6)
{
  uint64_t v11 = 0;
  if ((a4 & 1) == 0)
  {
    AX_CGPointGetDistanceToPoint();
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v12
                                                                + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  GAX_CGPointGetAngleFormedBySegmentToPoint(*(double *)(a1 + 48), *(double *)(a1 + 56), a5);
  uint64_t v14 = v13;
  uint64_t Count = AXCArrayGetCount();
  _AXCArrayPrepareForInsertingElementAtIndex();
  uint64_t v16 = _AXCArrayGetUnderlyingArray() + 48 * Count;
  *(double *)uint64_t v16 = a5;
  *(double *)(v16 + _Block_object_dispose(&STACK[0x2D0], 8) = a6;
  *(void *)(v16 + 16) = v11;
  *(void *)(v16 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v14;
  *(void *)(v16 + 32) = a2;
  *(_DWORD *)(v16 + 40) = a3;
  *(_DWORD *)(v16 + 44) = 0;
  _AXCArrayPrepareForInsertingElementAtIndex();
  UnderlyingArradouble y = _AXCArrayGetUnderlyingArray();
  uint64_t result = AXCArrayGetCount();
  *(void *)(UnderlyingArray + 8 * a2) = result - 1;
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v19 + 32) = a5;
  *(double *)(v19 + 40) = a6;
  return result;
}

void *sub_2F3F4(void *result, int a2, unint64_t *a3, uint64_t a4, __n128 a5, __n128 a6)
{
  int v6 = result;
  if (a4 != 1)
  {
    if (a4 || a2 != 4) {
      return result;
    }
    uint64_t v7 = *(void *)(result[5] + 8);
    id v8 = *(uint64_t (**)(__n128, __n128))(result[4] + 16);
    a5.n128_u64[0] = *(void *)(v7 + 32);
    a6.n128_u64[0] = *(void *)(v7 + 40);
    goto LABEL_12;
  }
  unint64_t v10 = *a3;
  unint64_t v9 = a3[1];
  if (a2 == 1)
  {
    if (!*(unsigned char *)(*(void *)(result[6] + 8) + 24))
    {
      (*(void (**)(double, double))(result[4] + 16))(*(double *)(*(void *)(result[5] + 8) + 32), *(double *)(*(void *)(result[5] + 8) + 40));
      *(unsigned char *)(*(void *)(v6[6] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    }
    id v8 = *(uint64_t (**)(__n128, __n128))(v6[4] + 16);
    a5.n128_u64[0] = v10;
    a6.n128_u64[0] = v9;
LABEL_12:
    return (void *)v8(a5, a6);
  }
  if (!a2)
  {
    uint64_t v11 = *(void *)(result[5] + 8);
    *(void *)(v11 + 32) = v10;
    *(void *)(v11 + 40) = v9;
    *(unsigned char *)(*(void *)(result[6] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  return result;
}

void sub_2F6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

double *sub_2F738(double *result, double *a2, uint64_t a3, unsigned char *a4)
{
  double v5 = result[8];
  double v6 = result[9];
  BOOL v7 = v5 == *a2 && v6 == a2[1];
  if (v7 || (v5 == a2[6] ? (BOOL v9 = v6 == a2[7]) : (BOOL v9 = 0), v9))
  {
    *a4 = 1;
  }
  else
  {
    unint64_t v10 = result;
    double v26 = 0.0;
    double v27 = 0.0;
    long long v11 = *((_OWORD *)a2 + 5);
    v24[4] = *((_OWORD *)a2 + 4);
    v24[5] = v11;
    v24[6] = *((_OWORD *)a2 + 6);
    uint64_t v25 = *((void *)a2 + 14);
    long long v12 = *((_OWORD *)a2 + 1);
    v24[0] = *(_OWORD *)a2;
    v24[1] = v12;
    long long v13 = *((_OWORD *)a2 + 3);
    v24[2] = *((_OWORD *)a2 + 2);
    v24[3] = v13;
    double v14 = result[10];
    uint64_t result = (double *)GAXPathLineSegmentGetAdjustedAngleRangeForComparingAngleFormedWithCenter((uint64_t)v24, &v27, &v26, v14, result[11], result[12]);
    double v15 = v26;
    double v16 = v27;
    if ((v14 - v26) * (v14 - v27) <= 0.0)
    {
      uint64_t v17 = *(void *)(*((void *)v10 + 4) + 8);
      long long v19 = *((_OWORD *)a2 + 5);
      long long v18 = *((_OWORD *)a2 + 6);
      long long v20 = *((_OWORD *)a2 + 4);
      *(double *)(v17 + 144) = a2[14];
      *(_OWORD *)(v17 + 112) = v19;
      *(_OWORD *)(v17 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v18;
      *(_OWORD *)(v17 + 96) = v20;
      long long v21 = *(_OWORD *)a2;
      long long v22 = *((_OWORD *)a2 + 1);
      long long v23 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(v17 + 64) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(v17 + 80) = v23;
      *(_OWORD *)(v17 + 32) = v21;
      *(_OWORD *)(v17 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v22;
      *(double *)(*(void *)(*((void *)v10 + 5) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v16;
      *(double *)(*(void *)(*((void *)v10 + 6) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v15;
      *(unsigned char *)(*(void *)(*((void *)v10 + 7) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

uint64_t GAXPathLineSegmentGetAdjustedAngleRangeForComparingAngleFormedWithCenter(uint64_t result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6 = *(double *)(result + 24);
  double v7 = *(double *)(result + 72);
  if (v6 * v7 < 0.0)
  {
    double v8 = *(unsigned char *)(result + 96) ? *(double *)result : (a6 - *(double *)(result + 112)) / *(double *)(result + 104);
    if (v8 < a5)
    {
      if (v6 * a4 >= 0.0)
      {
        if (v7 * a4 < 0.0) {
          double v7 = v7 + a4 / fabs(a4) * 6.28318531;
        }
      }
      else
      {
        double v6 = v6 + a4 / fabs(a4) * 6.28318531;
      }
    }
  }
  if (a2) {
    *a2 = v6;
  }
  if (a3) {
    *a3 = v7;
  }
  return result;
}

id sub_2FD04(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) resultHandler];
  v2[2](v2, 1);

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setResultHandler:0];
}

id sub_2FD60(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) resultHandler];
  v2[2](v2, 0);

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setResultHandler:0];
}

id sub_2FDBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

uint64_t sub_308AC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _textColor];
  uint64_t v2 = qword_6E820;
  qword_6E820 = v1;

  return _objc_release_x1(v1, v2);
}

void GAX_CGPointGetAngleFormedBySegmentToPoint(double a1, double a2, double a3)
{
  AX_CGPointGetDistanceToPoint();
  if (v5 != 0.0) {
    acos((a3 - a1) / v5);
  }
}

double GAX_CGPointGetMiddleOfSegmentToPoint(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

double GAX_CGPointGetInterpolatedPointInSegmentToPoint(double a1, double a2, double a3, double a4, float a5)
{
  return a1 + (a3 - a1) * a5;
}

double GAX_CGPointGetProjectionToFrame(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v14.origin.double x = a3;
  v14.origin.double y = a4;
  v14.size.double width = a5;
  v14.size.double height = a6;
  double MinX = CGRectGetMinX(v14);
  if (a1 < MinX) {
    a1 = MinX;
  }
  v15.origin.double x = a3;
  v15.origin.double y = a4;
  v15.size.double width = a5;
  v15.size.double height = a6;
  double MaxX = CGRectGetMaxX(v15);
  if (a1 >= MaxX) {
    a1 = MaxX;
  }
  v16.origin.double x = a3;
  v16.origin.double y = a4;
  v16.size.double width = a5;
  v16.size.double height = a6;
  CGRectGetMinY(v16);
  v17.origin.double x = a3;
  v17.origin.double y = a4;
  v17.size.double width = a5;
  v17.size.double height = a6;
  CGRectGetMaxY(v17);
  return a1;
}

void GAX_CGAffineTransformMakeWithSourceAndDestinationFrames(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, CGFloat a8@<D6>, CGFloat a9@<D7>)
{
  long long v31 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v32 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)a1 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)(a1 + 16) = v31;
  long long v30 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)(a1 + 32) = v30;
  double Width = CGRectGetWidth(*(CGRect *)&a2);
  v36.origin.double x = a2;
  v36.origin.double y = a3;
  v36.size.double width = a4;
  v36.size.double height = a5;
  if (Width * CGRectGetHeight(v36) > 0.0)
  {
    v37.origin.double x = a2;
    v37.origin.double y = a3;
    v37.size.double width = a4;
    v37.size.double height = a5;
    v46.origin.double x = a6;
    v46.origin.double y = a7;
    v46.size.double width = a8;
    v46.size.double height = a9;
    if (!CGRectEqualToRect(v37, v46))
    {
      v38.origin.double x = a2;
      v38.origin.double y = a3;
      v38.size.double width = a4;
      v38.size.double height = a5;
      double MinX = CGRectGetMinX(v38);
      v39.origin.double x = a2;
      v39.origin.double y = a3;
      v39.size.double width = a4;
      v39.size.double height = a5;
      double MinY = CGRectGetMinY(v39);
      v40.origin.double x = a2;
      v40.origin.double y = a3;
      v40.size.double width = a4;
      v40.size.double height = a5;
      double MaxX = CGRectGetMaxX(v40);
      v41.origin.double x = a2;
      v41.origin.double y = a3;
      v41.size.double width = a4;
      v41.size.double height = a5;
      double MaxY = CGRectGetMaxY(v41);
      v42.origin.double x = a6;
      v42.origin.double y = a7;
      v42.size.double width = a8;
      v42.size.double height = a9;
      double v19 = CGRectGetMinX(v42);
      v43.origin.double x = a6;
      v43.origin.double y = a7;
      v43.size.double width = a8;
      v43.size.double height = a9;
      double v20 = CGRectGetMinY(v43);
      v44.origin.double x = a6;
      v44.origin.double y = a7;
      v44.size.double width = a8;
      v44.size.double height = a9;
      double v21 = CGRectGetMaxX(v44);
      v45.origin.double x = a6;
      v45.origin.double y = a7;
      v45.size.double width = a8;
      v45.size.double height = a9;
      CGFloat v22 = CGRectGetMaxY(v45);
      CGFloat v23 = (v21 - v19) / (MaxX - MinX);
      CGFloat v24 = (v22 - v20) / (MaxY - MinY);
      *(_OWORD *)&v35.a = v32;
      *(_OWORD *)&v35.c = v31;
      *(_OWORD *)&v35.tdouble x = v30;
      CGAffineTransformTranslate((CGAffineTransform *)a1, &v35, (v19 + v21 - v23 * (MinX + MaxX)) * 0.5, (v20 + v22 - v24 * (MinY + MaxY)) * 0.5);
      long long v25 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)&v34.a = *(_OWORD *)a1;
      *(_OWORD *)&v34.c = v25;
      *(_OWORD *)&v34.tdouble x = *(_OWORD *)(a1 + 32);
      CGAffineTransformScale(&v35, &v34, v23, v24);
      long long v26 = *(_OWORD *)&v35.c;
      *(_OWORD *)a1 = *(_OWORD *)&v35.a;
      *(_OWORD *)(a1 + 16) = v26;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)&v35.tx;
    }
  }
}

id GAXFallbackValueForProfileKey(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  if (qword_6E840 == -1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_6E840, &stru_5E4B0);
    if (a3)
    {
LABEL_3:
      double v6 = [(id)qword_6E838 objectForKey:v5];
      if (v6) {
        goto LABEL_8;
      }
    }
  }
  double v7 = (void *)qword_6E830;
  double v8 = +[NSNumber numberWithUnsignedInt:a2];
  BOOL v9 = [v7 objectForKey:v8];
  double v6 = [v9 objectForKey:v5];

  if (!v6)
  {
    unint64_t v10 = GAXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_37ED0((uint64_t)v5, v10);
    }

    double v6 = 0;
  }
LABEL_8:

  return v6;
}

void sub_30D88(id a1)
{
  v52[0] = @"GAXProfileAllowsKeyboardTextInput";
  v52[1] = @"GAXProfileAllowsTouch";
  v53[0] = &__kCFBooleanTrue;
  v53[1] = &__kCFBooleanTrue;
  v52[2] = @"GAXProfileAllowsMotion";
  v52[3] = @"GAXProfileAllowsRingerSwitch";
  v53[2] = &__kCFBooleanTrue;
  v53[3] = &__kCFBooleanFalse;
  v52[4] = @"GAXProfileAllowsProximity";
  v52[5] = @"GAXProfileAllowsLockButton";
  v53[4] = &__kCFBooleanFalse;
  v53[5] = &__kCFBooleanFalse;
  v52[6] = @"GAXProfileAllowsVolumeButtons";
  v52[7] = @"GAXProfileAllowsAutolock";
  v53[6] = &__kCFBooleanFalse;
  v53[7] = &__kCFBooleanTrue;
  v52[8] = @"GAXProfileAppTimeoutDuration";
  v52[9] = @"GAXProfileAppTimeoutEnabled";
  v53[8] = &off_61770;
  v53[9] = &__kCFBooleanFalse;
  v52[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  CGRect v41 = +[NSNull null];
  v53[10] = v41;
  v52[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  CGRect v38 = +[NSNull null];
  v53[11] = v38;
  v52[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  CGAffineTransform v35 = +[NSNull null];
  v53[12] = v35;
  v52[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  long long v32 = +[NSNull null];
  v53[13] = v32;
  v52[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  uint64_t v29 = +[NSNull null];
  v53[14] = v29;
  v52[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  uint64_t v1 = +[NSNull null];
  v53[15] = v1;
  v52[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  uint64_t v2 = +[NSNull null];
  v53[16] = v2;
  v52[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  uint64_t v3 = +[NSNull null];
  v53[17] = v3;
  v53[18] = &__kCFBooleanFalse;
  v52[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v52[19] = @"GAXProfileAllowsAXToggleZoom";
  v53[19] = &__kCFBooleanFalse;
  v53[20] = &__kCFBooleanFalse;
  v52[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v52[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v53[21] = &__kCFBooleanFalse;
  v53[22] = &__kCFBooleanFalse;
  v52[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v52[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v53[23] = &__kCFBooleanFalse;
  v52[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  double v4 = +[NSNull null];
  v53[24] = v4;
  v52[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  id v5 = +[NSNull null];
  v53[25] = v5;
  v52[26] = @"GAXProfileStatesForRestrictions";
  double v6 = +[NSNull null];
  v53[26] = v6;
  v52[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  double v7 = +[NSNull null];
  v53[27] = v7;
  v53[28] = &__kCFBooleanFalse;
  v52[28] = @"GAXProfileAllowsHomeButton";
  v52[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v53[29] = &__kCFBooleanTrue;
  v53[30] = &__kCFBooleanTrue;
  v52[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v52[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v53[31] = &__kCFBooleanTrue;
  v53[32] = &__kCFBooleanTrue;
  v52[32] = @"GAXProfileAllowsExit";
  v52[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v53[33] = &__kCFBooleanFalse;
  v53[34] = &__kCFBooleanTrue;
  v52[34] = @"GAXProfileAllowsWebTextDefine";
  v52[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v53[35] = &__kCFBooleanFalse;
  CGRect v43 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:36];

  v50[0] = @"GAXProfileAllowsKeyboardTextInput";
  v50[1] = @"GAXProfileAllowsTouch";
  v51[0] = &__kCFBooleanTrue;
  v51[1] = &__kCFBooleanTrue;
  v50[2] = @"GAXProfileAllowsMotion";
  v50[3] = @"GAXProfileAllowsRingerSwitch";
  v51[2] = &__kCFBooleanTrue;
  v51[3] = &__kCFBooleanTrue;
  v50[4] = @"GAXProfileAllowsProximity";
  v50[5] = @"GAXProfileAllowsLockButton";
  v51[4] = &__kCFBooleanTrue;
  v51[5] = &__kCFBooleanTrue;
  v50[6] = @"GAXProfileAllowsVolumeButtons";
  v50[7] = @"GAXProfileAllowsAutolock";
  v51[6] = &__kCFBooleanTrue;
  v51[7] = &__kCFBooleanTrue;
  v50[8] = @"GAXProfileAppTimeoutDuration";
  v50[9] = @"GAXProfileAppTimeoutEnabled";
  v51[8] = &off_61770;
  v51[9] = &__kCFBooleanFalse;
  v50[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  CGRect v39 = +[NSNull null];
  v51[10] = v39;
  v50[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  CGRect v36 = +[NSNull null];
  v51[11] = v36;
  v50[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  uint64_t v33 = +[NSNull null];
  v51[12] = v33;
  v50[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  long long v30 = +[NSNull null];
  v51[13] = v30;
  v50[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  double v27 = +[NSNull null];
  v51[14] = v27;
  v50[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  double v8 = +[NSNull null];
  v51[15] = v8;
  v50[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  BOOL v9 = +[NSNull null];
  v51[16] = v9;
  v50[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  unint64_t v10 = +[NSNull null];
  v51[17] = v10;
  v51[18] = &__kCFBooleanFalse;
  v50[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v50[19] = @"GAXProfileAllowsAXToggleZoom";
  v51[19] = &__kCFBooleanFalse;
  v51[20] = &__kCFBooleanFalse;
  v50[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v50[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v51[21] = &__kCFBooleanFalse;
  v51[22] = &__kCFBooleanFalse;
  v50[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v50[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v51[23] = &__kCFBooleanFalse;
  v50[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  long long v11 = +[NSNull null];
  v51[24] = v11;
  v50[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  long long v12 = +[NSNull null];
  v51[25] = v12;
  v50[26] = @"GAXProfileStatesForRestrictions";
  long long v13 = +[NSNull null];
  v51[26] = v13;
  v50[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  CGRect v14 = +[NSNull null];
  v51[27] = v14;
  v51[28] = &__kCFBooleanFalse;
  v50[28] = @"GAXProfileAllowsHomeButton";
  v50[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v51[29] = &__kCFBooleanTrue;
  v51[30] = &__kCFBooleanTrue;
  v50[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v50[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v51[31] = &__kCFBooleanTrue;
  v51[32] = &__kCFBooleanFalse;
  v50[32] = @"GAXProfileAllowsExit";
  v50[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v51[33] = &__kCFBooleanTrue;
  v51[34] = &__kCFBooleanTrue;
  v50[34] = @"GAXProfileAllowsWebTextDefine";
  v50[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v51[35] = &__kCFBooleanFalse;
  CGRect v42 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:36];

  v48[0] = @"GAXProfileAllowsKeyboardTextInput";
  v48[1] = @"GAXProfileAllowsTouch";
  v49[0] = &__kCFBooleanTrue;
  v49[1] = &__kCFBooleanTrue;
  v48[2] = @"GAXProfileAllowsMotion";
  v48[3] = @"GAXProfileAllowsRingerSwitch";
  v49[2] = &__kCFBooleanTrue;
  _OWORD v49[3] = &__kCFBooleanTrue;
  v48[4] = @"GAXProfileAllowsProximity";
  v48[5] = @"GAXProfileAllowsLockButton";
  v49[4] = &__kCFBooleanTrue;
  v49[5] = &__kCFBooleanTrue;
  v48[6] = @"GAXProfileAllowsVolumeButtons";
  v48[7] = @"GAXProfileAllowsAutolock";
  v49[6] = &__kCFBooleanTrue;
  v49[7] = &__kCFBooleanTrue;
  v48[8] = @"GAXProfileAppTimeoutDuration";
  v48[9] = @"GAXProfileAppTimeoutEnabled";
  v49[8] = &off_61770;
  v49[9] = &__kCFBooleanFalse;
  v48[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  CGRect v40 = +[NSNull null];
  v49[10] = v40;
  v48[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  CGRect v37 = +[NSNull null];
  v49[11] = v37;
  v48[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  CGAffineTransform v34 = +[NSNull null];
  v49[12] = v34;
  v48[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  long long v31 = +[NSNull null];
  v49[13] = v31;
  v48[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  unint64_t v28 = +[NSNull null];
  v49[14] = v28;
  v48[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  CGRect v15 = +[NSNull null];
  v49[15] = v15;
  v48[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  CGRect v16 = +[NSNull null];
  v49[16] = v16;
  v48[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  CGRect v17 = +[NSNull null];
  v49[17] = v17;
  v49[18] = &__kCFBooleanFalse;
  v48[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v48[19] = @"GAXProfileAllowsAXToggleZoom";
  v49[19] = &__kCFBooleanFalse;
  v49[20] = &__kCFBooleanFalse;
  v48[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v48[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v49[21] = &__kCFBooleanFalse;
  v49[22] = &__kCFBooleanFalse;
  v48[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v48[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v49[23] = &__kCFBooleanFalse;
  v48[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  long long v18 = +[NSNull null];
  v49[24] = v18;
  v48[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  double v19 = +[NSNull null];
  v49[25] = v19;
  v48[26] = @"GAXProfileStatesForRestrictions";
  double v20 = +[NSNull null];
  v49[26] = v20;
  v48[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  double v21 = +[NSNull null];
  v49[27] = v21;
  v49[28] = &__kCFBooleanFalse;
  v48[28] = @"GAXProfileAllowsHomeButton";
  v48[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v49[29] = &__kCFBooleanTrue;
  v49[30] = &__kCFBooleanTrue;
  v48[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v48[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v49[31] = &__kCFBooleanTrue;
  v49[32] = &__kCFBooleanFalse;
  v48[32] = @"GAXProfileAllowsExit";
  v48[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v49[33] = &__kCFBooleanTrue;
  v49[34] = &__kCFBooleanTrue;
  v48[34] = @"GAXProfileAllowsWebTextDefine";
  v48[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v49[35] = &__kCFBooleanFalse;
  CGFloat v22 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:36];

  v46[0] = @"GAXProfileAllowsAutolock";
  v46[1] = @"GAXProfileAllowsLockButton";
  v47[0] = &__kCFBooleanFalse;
  v47[1] = &__kCFBooleanFalse;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  CGFloat v24 = (void *)qword_6E838;
  qword_6E838 = v23;

  v44[0] = &off_616E8;
  v44[1] = &off_61700;
  v45[0] = v43;
  v45[1] = v42;
  v44[2] = &off_61718;
  v45[2] = v22;
  uint64_t v25 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
  long long v26 = (void *)qword_6E830;
  qword_6E830 = v25;
}

id GAXAppIsMobilePhoneOrFacetime(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilephone"]) {
    id v2 = &dword_0 + 1;
  }
  else {
    id v2 = [v1 isEqualToString:@"com.apple.facetime"];
  }

  return v2;
}

uint64_t GAXSessionAppsContainMobilePhoneOrFacetime(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (unint64_t i = 0; i != v3; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isEqualToString:", @"com.apple.mobilephone", (void)v9) & 1) != 0
          || ([v6 isEqualToString:@"com.apple.facetime"] & 1) != 0)
        {
          uint64_t v7 = 1;
          goto LABEL_13;
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v7 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_13:

  return v7;
}

void extractGAXBackboardStateFromMessage(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + _Block_object_dispose(&STACK[0x2D0], 8) = 0;
  *(_DWORD *)(a2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(a2 + 16) = 0;
  id v3 = [a1 payload];
  id v4 = [v3 objectForKey:@"GAXIPCPayloadKeyGAXBackboardState"];

  [v4 getBytes:a2 length:28];
}

id serializeGAXBackboardState(uint64_t a1)
{
  return +[NSData dataWithBytes:a1 length:28];
}

id gaxDebugDescriptionForGAXBackboardState(unsigned int *a1)
{
  id v2 = +[NSMutableString stringWithString:@"GAXBackboardState:\n"];
  objc_msgSend(v2, "appendFormat:", @"  mode: %ld\n", *a1);
  objc_msgSend(v2, "appendFormat:", @"  passcodeWindowContextID: %ld\n", a1[1]);
  objc_msgSend(v2, "appendFormat:", @"  voiceOverItemChooserWindowContextID: %ld\n", a1[2]);
  objc_msgSend(v2, "appendFormat:", @"  tripleClickSheetWindowContextID: %ld\n", a1[3]);
  objc_msgSend(v2, "appendFormat:", @"  shouldBlockAllEvents: %ld\n", a1[6] & 1);
  objc_msgSend(v2, "appendFormat:", @"  restartingAndWasActiveBeforeRestart: %ld\n", ((unint64_t)a1[6] >> 1) & 1);
  objc_msgSend(v2, "appendFormat:", @"  verifyingDeviceUnlockInSAM: %ld\n", ((unint64_t)a1[6] >> 2) & 1);
  objc_msgSend(v2, "appendFormat:", @"  isPasscodeViewVisible: %ld\n", ((unint64_t)a1[6] >> 3) & 1);
  objc_msgSend(v2, "appendFormat:", @"  isRestricted: %ld\n", ((unint64_t)a1[6] >> 4) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchSBMiniAlertIsShowing: %ld\n", ((unint64_t)a1[6] >> 5) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchCallStateIsChanging: %ld\n", ((unint64_t)a1[6] >> 6) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchMakingEmergencyCall: %ld\n", ((unint64_t)a1[6] >> 7) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideIgnoresAllTouchAllowedAppNotFound: %ld\n", ((unint64_t)a1[6] >> 8) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideIgnoresAllTouchVerifyingIntegrity: %ld\n", ((unint64_t)a1[6] >> 9) & 1);
  objc_msgSend(v2, "appendFormat:", @"  profileConfiguration: %ld\n", a1[5]);
  objc_msgSend(v2, "appendFormat:", @"  allowsTouch: %ld\n", ((unint64_t)a1[6] >> 10) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsLockButton: %ld\n", ((unint64_t)a1[6] >> 11) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsAppExit: %ld\n", ((unint64_t)a1[6] >> 12) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsHomeButton: %ld\n", ((unint64_t)a1[6] >> 13) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsVolumeButtons: %ld\n", ((unint64_t)a1[6] >> 14) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsRingerSwitch: %ld\n", ((unint64_t)a1[6] >> 15) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsMotion: %ld\n", ((unint64_t)a1[6] >> 16) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsAutolock: %ld\n", ((unint64_t)a1[6] >> 17) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsKeyboardTextInput: %ld\n", ((unint64_t)a1[6] >> 18) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsProximity: %ld\n", ((unint64_t)a1[6] >> 19) & 1);

  return v2;
}

BOOL GAXSecTaskHasBooleanEntitlement(__SecTask *a1, void *a2)
{
  id v3 = a2;
  CFErrorRef error = 0;
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(a1, v3, &error);
  if (error)
  {
    id v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      long long v11 = a1;
      __int16 v12 = 2112;
      long long v13 = v3;
      __int16 v14 = 2112;
      CFErrorRef v15 = error;
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Unable to check if task %@ has entitlement %@: %@", buf, 0x20u);
    }

    CFRelease(error);
  }
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

id GAXAllowedRemoteUIProcesses()
{
  if (qword_6E850 != -1) {
    dispatch_once(&qword_6E850, &stru_5E528);
  }
  uint64_t v0 = (void *)qword_6E848;

  return v0;
}

void sub_33818(id a1)
{
  v3[0] = @"com.apple.MailCompositionService";
  v3[1] = @"com.apple.mobilesms.compose";
  v3[2] = @"com.apple.MessageCompositionService";
  v3[3] = @"com.apple.social.remoteui.SocialUIService";
  v3[4] = @"com.apple.quicklook.quicklookd";
  v3[5] = @"com.apple.SafariViewService";
  v3[6] = @"com.apple.CoreAuthUI";
  v3[7] = @"com.apple.InCallService";
  v3[8] = @"com.apple.datadetectors.DDActionsService";
  v3[9] = @"com.apple.shortcuts.runtime";
  v3[10] = @"com.apple.SleepLockScreen";
  v3[11] = @"com.apple.ContactlessUIService";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  id v2 = (void *)qword_6E848;
  qword_6E848 = v1;
}

id GAXURLSchemeIsPhoneRelated(void *a1)
{
  uint64_t v1 = [a1 scheme];
  if (([v1 isEqualToString:@"tel"] & 1) != 0
    || ([v1 isEqualToString:@"facetime"] & 1) != 0)
  {
    id v2 = &dword_0 + 1;
  }
  else
  {
    id v2 = [v1 isEqualToString:@"facetime-audio"];
  }

  return v2;
}

id GAXLocalizedStringForTimeDuration(double a1)
{
  id v2 = objc_opt_new();
  [v2 setZeroFormattingBehavior:1];
  [v2 setUnitsStyle:3];
  if (a1 >= 60.0)
  {
    if ((int)a1 % 60 > 30) {
      a1 = a1 + 60.0;
    }
    uint64_t v3 = 96;
  }
  else
  {
    uint64_t v3 = 128;
  }
  [v2 setAllowedUnits:v3];
  CFTypeRef v4 = [v2 stringFromTimeInterval:a1];

  return v4;
}

void sub_36C44(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = objc_msgSend(*(id *)(a1 + 32), "_datePickerWithInitialEnabledState:initialDurationInMinutes:", 1, objc_msgSend(*(id *)(a1 + 32), "durationInMinutes"));
    [*(id *)(a1 + 32) setDatePicker:v2];

    uint64_t v3 = *(void **)(a1 + 32);
    CFTypeRef v4 = [v3 datePicker];
    [v3 addSubview:v4];

    id v5 = [*(id *)(a1 + 32) topShelfContainer];
    CFTypeID v6 = [*(id *)(a1 + 32) datePicker];
    BOOL v7 = _NSDictionaryOfVariableBindings(@"topShelfContainer, datePicker", v5, v6, 0);
    double v8 = +[NSMutableArray array];
    long long v9 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topShelfContainer][datePicker]|" options:0 metrics:&__NSDictionary0__struct views:v7];
    [v8 addObjectsFromArray:v9];

    long long v10 = +[NSLayoutConstraint constraintWithItem:v6 attribute:9 relatedBy:0 toItem:*(void *)(a1 + 32) attribute:9 multiplier:1.0 constant:0.0];
    [v8 addObject:v10];

    [*(id *)(a1 + 32) addConstraints:v8];
    LODWORD(v11) = 1148846080;
    [v6 setContentHuggingPriority:1 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [v6 setContentCompressionResistancePriority:1 forAxis:v12];
    long long v13 = [*(id *)(a1 + 32) detailTextZeroHeightConstraint];

    if (v13)
    {
      __int16 v14 = *(void **)(a1 + 40);
      CFErrorRef v15 = [*(id *)(a1 + 32) detailTextZeroHeightConstraint];
      [v14 removeConstraint:v15];

      [*(id *)(a1 + 32) setDetailTextZeroHeightConstraint:0];
    }
  }
  else
  {
    CGRect v16 = [*(id *)(a1 + 32) datePicker];
    LODWORD(v17) = 1132068864;
    [v16 setContentHuggingPriority:1 forAxis:v17];

    long long v18 = [*(id *)(a1 + 32) datePicker];
    LODWORD(v19) = 1132068864;
    [v18 setContentCompressionResistancePriority:1 forAxis:v19];

    double v20 = [*(id *)(a1 + 32) datePicker];
    [v20 removeFromSuperview];

    [*(id *)(a1 + 32) setDatePicker:0];
    id v5 = +[NSLayoutConstraint constraintWithItem:*(void *)(a1 + 40) attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    LODWORD(v21) = 1148846080;
    [v5 setPriority:v21];
    [*(id *)(a1 + 40) addConstraint:v5];
    [*(id *)(a1 + 32) setDetailTextZeroHeightConstraint:v5];
  }

  if (*(unsigned char *)(a1 + 48)) {
    double v22 = 1.0;
  }
  else {
    double v22 = 0.0;
  }
  id v23 = [*(id *)(a1 + 32) datePicker];
  [v23 setAlpha:v22];
}

uint64_t sub_36F40(uint64_t a1)
{
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_37238(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_3725C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained delegate];

  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_loadWeakRetained(v2);
    id v5 = [v4 datePicker];
    objc_msgSend(v6, "featureView:didChangeTimeRestrictionDuration:timeRestrictionsEnabled:", v4, objc_msgSend(v5, "selectedDurationInMinutes"), objc_msgSend(*(id *)(a1 + 32), "isOn"));
  }
}

uint64_t sub_376F4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_37728()
{
  sub_CF9C();
  sub_CF80(&dword_0, v0, v1, "backboard server could not disconnect from springboard service gracefully: %@", v2, v3, v4, v5, v6);
}

void sub_37790(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No app display name passed for alert text type %d! Falling back to a suboptimal placeholder value.", (uint8_t *)v2, 8u);
}

void sub_37808()
{
  sub_CF9C();
  __int16 v2 = 1024;
  int v3 = 6;
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Couldn't get passcode length: %@. Assuming %u", v1, 0x12u);
}

void sub_3788C()
{
  sub_CF9C();
  sub_CF80(&dword_0, v0, v1, "Error playing tone for incoming blocked call: %{public}@", v2, v3, v4, v5, v6);
}

void sub_378F4()
{
  sub_CF9C();
  sub_CF80(&dword_0, v0, v1, "Could not apply restrictions for unmanaged SAM! %{public}@", v2, v3, v4, v5, v6);
}

void sub_3795C()
{
  sub_CF9C();
  sub_CF80(&dword_0, v0, v1, "Could not remove restrictions for unmanaged SAM! %{public}@", v2, v3, v4, v5, v6);
}

void sub_379C4()
{
  sub_CF9C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Unexpected single app mode style for enabling unmanaged restrictions: %ld", v1, 0xCu);
}

void sub_37A38(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No app display name passed for unmanaged ASAM confirmation! Falling back to a suboptimal placeholder value.", v1, 2u);
}

void sub_37B94(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not dyld open mesa", v1, 2u);
}

void sub_37BD8(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithInt:a1];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error telling mesa to go active: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_37C7C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to push backboard state change to SpringBoard: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_37CF4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Updating GAXSpringboardClient with a nil frontmostAppID", v1, 2u);
}

void sub_37D38(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No appID sent in when launching application", v1, 2u);
}

void sub_37D7C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Couldn't get suggested passcode length from SpringBoard: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_37E8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Attempted to show AAC UI while the device was locked.", v1, 2u);
}

void sub_37ED0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No fallback value was registered for profile key: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AXAssistiveTouchBundle()
{
  return _AXAssistiveTouchBundle();
}

uint64_t AXCArrayCreate()
{
  return _AXCArrayCreate();
}

uint64_t AXCArrayGetCount()
{
  return _AXCArrayGetCount();
}

uint64_t AXCArrayRemoveAllElements()
{
  return _AXCArrayRemoveAllElements();
}

uint64_t AXCArraySort()
{
  return _AXCArraySort();
}

uint64_t AXDeviceGetLocalizedShortModelName()
{
  return _AXDeviceGetLocalizedShortModelName();
}

uint64_t AXDeviceHasHomeButton()
{
  return _AXDeviceHasHomeButton();
}

uint64_t AXDeviceHasPearl()
{
  return _AXDeviceHasPearl();
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXDeviceIsUnlocked()
{
  return _AXDeviceIsUnlocked();
}

uint64_t AXLocStringKeyForExclusiveModel()
{
  return _AXLocStringKeyForExclusiveModel();
}

uint64_t AXLocStringKeyForHomeButton()
{
  return _AXLocStringKeyForHomeButton();
}

uint64_t AXLocStringKeyForHomeButtonAndExclusiveModel()
{
  return _AXLocStringKeyForHomeButtonAndExclusiveModel();
}

uint64_t AXLocStringKeyForModel()
{
  return _AXLocStringKeyForModel();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXLogIPC()
{
  return _AXLogIPC();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

uint64_t AX_CGPathCopyDataRepresentation()
{
  return _AX_CGPathCopyDataRepresentation();
}

uint64_t AX_CGPathEnumerateElementsUsingBlock()
{
  return _AX_CGPathEnumerateElementsUsingBlock();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return _AX_CGPointGetDistanceToPoint();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return _CGAffineTransformInvert(retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return _CGAffineTransformIsIdentity(t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

void CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return _CGPathRetain(path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t GAXLogAppLaunching()
{
  return _GAXLogAppLaunching();
}

uint64_t GAXLogCommon()
{
  return _GAXLogCommon();
}

uint64_t GAXLogTimeRestrictions()
{
  return _GAXLogTimeRestrictions();
}

uint64_t ICFRegisterCallFilterResultBlockWithIdentifier()
{
  return _ICFRegisterCallFilterResultBlockWithIdentifier();
}

uint64_t ICFUnregisterCallFilterResultBlockWithIdentifier()
{
  return _ICFUnregisterCallFilterResultBlockWithIdentifier();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSRect NSRectFromString(NSString *aString)
{
  return _NSRectFromString(aString);
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return _NSStringFromCGPoint(point);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXCArrayGetUnderlyingArray()
{
  return __AXCArrayGetUnderlyingArray();
}

uint64_t _AXCArrayPrepareForInsertingElementAtIndex()
{
  return __AXCArrayPrepareForInsertingElementAtIndex();
}

uint64_t _AXLogWithFacility()
{
  return __AXLogWithFacility();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return __UIContentSizeCategoryCompareToContentSizeCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAXStringForVariables()
{
  return ___UIAXStringForVariables();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
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

void abort(void)
{
}

long double acos(long double __x)
{
  return _acos(__x);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

long double log(long double __x)
{
  return _log(__x);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend__accessibilityViewIsVisible(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityViewIsVisible];
}

id objc_msgSend__allFeatureViews(void *a1, const char *a2, ...)
{
  return [a1 _allFeatureViews];
}

id objc_msgSend__appFeatureViews(void *a1, const char *a2, ...)
{
  return [a1 _appFeatureViews];
}

id objc_msgSend__applicationKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 _applicationKeyWindow];
}

id objc_msgSend__applyInterestAreaPathsForStorage(void *a1, const char *a2, ...)
{
  return [a1 _applyInterestAreaPathsForStorage];
}

id objc_msgSend__axSpringBoardServerInstance(void *a1, const char *a2, ...)
{
  return [a1 _axSpringBoardServerInstance];
}

id objc_msgSend__backgroundStyleForCurrentState(void *a1, const char *a2, ...)
{
  return [a1 _backgroundStyleForCurrentState];
}

id objc_msgSend__beginInterestAreaPathsUpdate(void *a1, const char *a2, ...)
{
  return [a1 _beginInterestAreaPathsUpdate];
}

id objc_msgSend__boundsForConstrainingFingerPath(void *a1, const char *a2, ...)
{
  return [a1 _boundsForConstrainingFingerPath];
}

id objc_msgSend__centerForBackground(void *a1, const char *a2, ...)
{
  return [a1 _centerForBackground];
}

id objc_msgSend__checkPresenceOfOverlayUserInterface(void *a1, const char *a2, ...)
{
  return [a1 _checkPresenceOfOverlayUserInterface];
}

id objc_msgSend__clearPasscodeDismissalTimer(void *a1, const char *a2, ...)
{
  return [a1 _clearPasscodeDismissalTimer];
}

id objc_msgSend__clientMessenger(void *a1, const char *a2, ...)
{
  return [a1 _clientMessenger];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return [a1 _commonInit];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__deviceHasBiometrics(void *a1, const char *a2, ...)
{
  return [a1 _deviceHasBiometrics];
}

id objc_msgSend__didFinishRecordingCurrentSequenceOfTouchEvents(void *a1, const char *a2, ...)
{
  return [a1 _didFinishRecordingCurrentSequenceOfTouchEvents];
}

id objc_msgSend__endInterestAreaPathsUpdate(void *a1, const char *a2, ...)
{
  return [a1 _endInterestAreaPathsUpdate];
}

id objc_msgSend__ensureBackgroundSizeOfBackgroundViewCoveringEverythingIsSet(void *a1, const char *a2, ...)
{
  return [a1 _ensureBackgroundSizeOfBackgroundViewCoveringEverythingIsSet];
}

id objc_msgSend__gaxIsSimpleRectangle(void *a1, const char *a2, ...)
{
  return [a1 _gaxIsSimpleRectangle];
}

id objc_msgSend__gaxPathContext(void *a1, const char *a2, ...)
{
  return [a1 _gaxPathContext];
}

id objc_msgSend__gaxUnderlyingPathDidChange(void *a1, const char *a2, ...)
{
  return [a1 _gaxUnderlyingPathDidChange];
}

id objc_msgSend__graphicsQuality(void *a1, const char *a2, ...)
{
  return [a1 _graphicsQuality];
}

id objc_msgSend__hardwareFeatureViews(void *a1, const char *a2, ...)
{
  return [a1 _hardwareFeatureViews];
}

id objc_msgSend__hasOverlayUserInterface(void *a1, const char *a2, ...)
{
  return [a1 _hasOverlayUserInterface];
}

id objc_msgSend__hideTimeRestrictionsLockoutView(void *a1, const char *a2, ...)
{
  return [a1 _hideTimeRestrictionsLockoutView];
}

id objc_msgSend__instructionsLabelMaximumSize(void *a1, const char *a2, ...)
{
  return [a1 _instructionsLabelMaximumSize];
}

id objc_msgSend__interestAreaPathsDidChange(void *a1, const char *a2, ...)
{
  return [a1 _interestAreaPathsDidChange];
}

id objc_msgSend__isTimeRestrictionLockoutViewShowing(void *a1, const char *a2, ...)
{
  return [a1 _isTimeRestrictionLockoutViewShowing];
}

id objc_msgSend__isUsingAppRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _isUsingAppRestrictions];
}

id objc_msgSend__loadBiometricKit(void *a1, const char *a2, ...)
{
  return [a1 _loadBiometricKit];
}

id objc_msgSend__minimumDelayForShowingAdditionalBannerAlert(void *a1, const char *a2, ...)
{
  return [a1 _minimumDelayForShowingAdditionalBannerAlert];
}

id objc_msgSend__notifyClientOfUpdatedActiveInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 _notifyClientOfUpdatedActiveInterfaceOrientation];
}

id objc_msgSend__numberOfFeatures(void *a1, const char *a2, ...)
{
  return [a1 _numberOfFeatures];
}

id objc_msgSend__numberOfInterestAreaPaths(void *a1, const char *a2, ...)
{
  return [a1 _numberOfInterestAreaPaths];
}

id objc_msgSend__pickerIndexPath(void *a1, const char *a2, ...)
{
  return [a1 _pickerIndexPath];
}

id objc_msgSend__preparedOverlayUserInterfaceViewController(void *a1, const char *a2, ...)
{
  return [a1 _preparedOverlayUserInterfaceViewController];
}

id objc_msgSend__presentPasscodeViewControllerForUnlock(void *a1, const char *a2, ...)
{
  return [a1 _presentPasscodeViewControllerForUnlock];
}

id objc_msgSend__reestablishSpringboardClient(void *a1, const char *a2, ...)
{
  return [a1 _reestablishSpringboardClient];
}

id objc_msgSend__referenceViewForConvertingFromAndToWindowCoordinateSystem(void *a1, const char *a2, ...)
{
  return [a1 _referenceViewForConvertingFromAndToWindowCoordinateSystem];
}

id objc_msgSend__refreshBackgroundStripesPatternColor(void *a1, const char *a2, ...)
{
  return [a1 _refreshBackgroundStripesPatternColor];
}

id objc_msgSend__resetAllSpecialControls(void *a1, const char *a2, ...)
{
  return [a1 _resetAllSpecialControls];
}

id objc_msgSend__restoreTelephony(void *a1, const char *a2, ...)
{
  return [a1 _restoreTelephony];
}

id objc_msgSend__rotateDeviceToCurrentOrientation(void *a1, const char *a2, ...)
{
  return [a1 _rotateDeviceToCurrentOrientation];
}

id objc_msgSend__scaleFactorForSpecialControls(void *a1, const char *a2, ...)
{
  return [a1 _scaleFactorForSpecialControls];
}

id objc_msgSend__setupOverrides(void *a1, const char *a2, ...)
{
  return [a1 _setupOverrides];
}

id objc_msgSend__shouldDispatchLocally(void *a1, const char *a2, ...)
{
  return [a1 _shouldDispatchLocally];
}

id objc_msgSend__subtitleFont(void *a1, const char *a2, ...)
{
  return [a1 _subtitleFont];
}

id objc_msgSend__textColor(void *a1, const char *a2, ...)
{
  return [a1 _textColor];
}

id objc_msgSend__timeRestrictionFeatureViews(void *a1, const char *a2, ...)
{
  return [a1 _timeRestrictionFeatureViews];
}

id objc_msgSend__titleFont(void *a1, const char *a2, ...)
{
  return [a1 _titleFont];
}

id objc_msgSend__transitionDuration(void *a1, const char *a2, ...)
{
  return [a1 _transitionDuration];
}

id objc_msgSend__updateBackgroundViewCenter(void *a1, const char *a2, ...)
{
  return [a1 _updateBackgroundViewCenter];
}

id objc_msgSend__updateHostedApplicationShadowView(void *a1, const char *a2, ...)
{
  return [a1 _updateHostedApplicationShadowView];
}

id objc_msgSend__updateInstructionsLabel(void *a1, const char *a2, ...)
{
  return [a1 _updateInstructionsLabel];
}

id objc_msgSend__updateInterestAreaView(void *a1, const char *a2, ...)
{
  return [a1 _updateInterestAreaView];
}

id objc_msgSend__updateMaskLayer(void *a1, const char *a2, ...)
{
  return [a1 _updateMaskLayer];
}

id objc_msgSend__updateMaskLayerFrame(void *a1, const char *a2, ...)
{
  return [a1 _updateMaskLayerFrame];
}

id objc_msgSend__updateNavigationBar(void *a1, const char *a2, ...)
{
  return [a1 _updateNavigationBar];
}

id objc_msgSend__updateStatusAndNavigationBarBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _updateStatusAndNavigationBarBackgroundView];
}

id objc_msgSend__updateStatusBar(void *a1, const char *a2, ...)
{
  return [a1 _updateStatusBar];
}

id objc_msgSend__updateSystemFeatureView(void *a1, const char *a2, ...)
{
  return [a1 _updateSystemFeatureView];
}

id objc_msgSend__validateOverrides(void *a1, const char *a2, ...)
{
  return [a1 _validateOverrides];
}

id objc_msgSend__viewForPresentingOverlayUserInterface(void *a1, const char *a2, ...)
{
  return [a1 _viewForPresentingOverlayUserInterface];
}

id objc_msgSend__windowsToHost(void *a1, const char *a2, ...)
{
  return [a1 _windowsToHost];
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return [a1 accessibilityFrame];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityTraits(void *a1, const char *a2, ...)
{
  return [a1 accessibilityTraits];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return [a1 accessibilityValue];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return [a1 accessoryView];
}

id objc_msgSend_activeContentViewController(void *a1, const char *a2, ...)
{
  return [a1 activeContentViewController];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_additionalFlags(void *a1, const char *a2, ...)
{
  return [a1 additionalFlags];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowsDimmingInterestAreaPaths(void *a1, const char *a2, ...)
{
  return [a1 allowsDimmingInterestAreaPaths];
}

id objc_msgSend_allowsTouch(void *a1, const char *a2, ...)
{
  return [a1 allowsTouch];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appDisplayName(void *a1, const char *a2, ...)
{
  return [a1 appDisplayName];
}

id objc_msgSend_appFeatureViewDefineIcon(void *a1, const char *a2, ...)
{
  return [a1 appFeatureViewDefineIcon];
}

id objc_msgSend_appRestrictionIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 appRestrictionIdentifiers];
}

id objc_msgSend_appTimeRestrictionDuration(void *a1, const char *a2, ...)
{
  return [a1 appTimeRestrictionDuration];
}

id objc_msgSend_appTimeRestrictionDurationInMinutes(void *a1, const char *a2, ...)
{
  return [a1 appTimeRestrictionDurationInMinutes];
}

id objc_msgSend_appTimeRestrictionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 appTimeRestrictionsEnabled];
}

id objc_msgSend_applicationInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 applicationInterfaceOrientation];
}

id objc_msgSend_applicationViewRoundedCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 applicationViewRoundedCornerRadius];
}

id objc_msgSend_archivedSessionApplicationIcon(void *a1, const char *a2, ...)
{
  return [a1 archivedSessionApplicationIcon];
}

id objc_msgSend_areSpecialControlsVisible(void *a1, const char *a2, ...)
{
  return [a1 areSpecialControlsVisible];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_associatedInterestAreaPathIndex(void *a1, const char *a2, ...)
{
  return [a1 associatedInterestAreaPathIndex];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backgroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 backgroundContainerView];
}

id objc_msgSend_backgroundDimmingView(void *a1, const char *a2, ...)
{
  return [a1 backgroundDimmingView];
}

id objc_msgSend_backgroundPatternScaleFactor(void *a1, const char *a2, ...)
{
  return [a1 backgroundPatternScaleFactor];
}

id objc_msgSend_backgroundShouldCoverEverything(void *a1, const char *a2, ...)
{
  return [a1 backgroundShouldCoverEverything];
}

id objc_msgSend_backgroundSize(void *a1, const char *a2, ...)
{
  return [a1 backgroundSize];
}

id objc_msgSend_backgroundStripesPatternColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundStripesPatternColor];
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return [a1 backgroundStyle];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_backgroundViewCoveringEverything(void *a1, const char *a2, ...)
{
  return [a1 backgroundViewCoveringEverything];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_biometricKit(void *a1, const char *a2, ...)
{
  return [a1 biometricKit];
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

id objc_msgSend_bottomLeftPoint(void *a1, const char *a2, ...)
{
  return [a1 bottomLeftPoint];
}

id objc_msgSend_bottomLeftPointOnPath(void *a1, const char *a2, ...)
{
  return [a1 bottomLeftPointOnPath];
}

id objc_msgSend_bottomRightPoint(void *a1, const char *a2, ...)
{
  return [a1 bottomRightPoint];
}

id objc_msgSend_bottomRightPointOnPath(void *a1, const char *a2, ...)
{
  return [a1 bottomRightPointOnPath];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_boundsCenter(void *a1, const char *a2, ...)
{
  return [a1 boundsCenter];
}

id objc_msgSend_brieflyListenForTouchIDAttempts(void *a1, const char *a2, ...)
{
  return [a1 brieflyListenForTouchIDAttempts];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_buttonBeingDragged(void *a1, const char *a2, ...)
{
  return [a1 buttonBeingDragged];
}

id objc_msgSend_buttonBeingDraggedInitialCenter(void *a1, const char *a2, ...)
{
  return [a1 buttonBeingDraggedInitialCenter];
}

id objc_msgSend_cachedInterestAreaPathsForStorage(void *a1, const char *a2, ...)
{
  return [a1 cachedInterestAreaPathsForStorage];
}

id objc_msgSend_cachedSizeContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 cachedSizeContentSizeCategory];
}

id objc_msgSend_cachedStyleProperties(void *a1, const char *a2, ...)
{
  return [a1 cachedStyleProperties];
}

id objc_msgSend_cachedTableSize(void *a1, const char *a2, ...)
{
  return [a1 cachedTableSize];
}

id objc_msgSend_callAlert(void *a1, const char *a2, ...)
{
  return [a1 callAlert];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelListeningForTouchIDAttempts(void *a1, const char *a2, ...)
{
  return [a1 cancelListeningForTouchIDAttempts];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
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

id objc_msgSend_clippedViews(void *a1, const char *a2, ...)
{
  return [a1 clippedViews];
}

id objc_msgSend_clippingPath(void *a1, const char *a2, ...)
{
  return [a1 clippingPath];
}

id objc_msgSend_closeButtons(void *a1, const char *a2, ...)
{
  return [a1 closeButtons];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return [a1 commonInit];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contentsBounds(void *a1, const char *a2, ...)
{
  return [a1 contentsBounds];
}

id objc_msgSend_contentsCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 contentsCornerRadius];
}

id objc_msgSend_contentsView(void *a1, const char *a2, ...)
{
  return [a1 contentsView];
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return [a1 coordinateSpace];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyBezierPathPointsExcludingControlPoints(void *a1, const char *a2, ...)
{
  return [a1 copyBezierPathPointsExcludingControlPoints];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countDownDuration(void *a1, const char *a2, ...)
{
  return [a1 countDownDuration];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentDisplayLinkManager(void *a1, const char *a2, ...)
{
  return [a1 currentDisplayLinkManager];
}

id objc_msgSend_currentInterpolatedPath(void *a1, const char *a2, ...)
{
  return [a1 currentInterpolatedPath];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentTouch(void *a1, const char *a2, ...)
{
  return [a1 currentTouch];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_datePicker(void *a1, const char *a2, ...)
{
  return [a1 datePicker];
}

id objc_msgSend_defaultAnimationDuration(void *a1, const char *a2, ...)
{
  return [a1 defaultAnimationDuration];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultLabelBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 defaultLabelBackgroundColor];
}

id objc_msgSend_defaultLabelTextColor(void *a1, const char *a2, ...)
{
  return [a1 defaultLabelTextColor];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_detailTextZeroHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 detailTextZeroHeightConstraint];
}

id objc_msgSend_detailTextsForAppRestrictions(void *a1, const char *a2, ...)
{
  return [a1 detailTextsForAppRestrictions];
}

id objc_msgSend_deviceRestrictedAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceRestrictedAlertIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didDismissModalViewController(void *a1, const char *a2, ...)
{
  return [a1 didDismissModalViewController];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return [a1 direction];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_durationInMinutes(void *a1, const char *a2, ...)
{
  return [a1 durationInMinutes];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_endingPath(void *a1, const char *a2, ...)
{
  return [a1 endingPath];
}

id objc_msgSend_eventStealerViewDelegate(void *a1, const char *a2, ...)
{
  return [a1 eventStealerViewDelegate];
}

id objc_msgSend_featureVCOnscreenConstraint(void *a1, const char *a2, ...)
{
  return [a1 featureVCOnscreenConstraint];
}

id objc_msgSend_featureViewAdditionalBottomOffsetForLargeText(void *a1, const char *a2, ...)
{
  return [a1 featureViewAdditionalBottomOffsetForLargeText];
}

id objc_msgSend_featureViewController(void *a1, const char *a2, ...)
{
  return [a1 featureViewController];
}

id objc_msgSend_featureViewControllerHeight(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerHeight];
}

id objc_msgSend_featureViewControllerInstructionsColor(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerInstructionsColor];
}

id objc_msgSend_featureViewControllerInstructionsFont(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerInstructionsFont];
}

id objc_msgSend_featureViewControllerInstructionsHorizontalOffset(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerInstructionsHorizontalOffset];
}

id objc_msgSend_featureViewControllerInstructionsMiniHorizontalOffset(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerInstructionsMiniHorizontalOffset];
}

id objc_msgSend_featureViewControllerMiniHeight(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerMiniHeight];
}

id objc_msgSend_featureViewControllerOptionsButtonFont(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerOptionsButtonFont];
}

id objc_msgSend_featureViewControllerOptionsButtonMiniOffset(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerOptionsButtonMiniOffset];
}

id objc_msgSend_featureViewControllerOptionsButtonOffset(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerOptionsButtonOffset];
}

id objc_msgSend_featureViewControllerOptionsButtonTitleHorizontalPadding(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerOptionsButtonTitleHorizontalPadding];
}

id objc_msgSend_featureViewControllerOptionsCellTextFont(void *a1, const char *a2, ...)
{
  return [a1 featureViewControllerOptionsCellTextFont];
}

id objc_msgSend_featureViewDetailTextFont(void *a1, const char *a2, ...)
{
  return [a1 featureViewDetailTextFont];
}

id objc_msgSend_featureViewFrameEdgeInsets(void *a1, const char *a2, ...)
{
  return [a1 featureViewFrameEdgeInsets];
}

id objc_msgSend_featureViewIconColor(void *a1, const char *a2, ...)
{
  return [a1 featureViewIconColor];
}

id objc_msgSend_featureViewIconLargeTextLayoutTextIndent(void *a1, const char *a2, ...)
{
  return [a1 featureViewIconLargeTextLayoutTextIndent];
}

id objc_msgSend_featureViewIconStandardLayoutWidth(void *a1, const char *a2, ...)
{
  return [a1 featureViewIconStandardLayoutWidth];
}

id objc_msgSend_featureViewMinimumHeight(void *a1, const char *a2, ...)
{
  return [a1 featureViewMinimumHeight];
}

id objc_msgSend_featureViewOptionsBlurEffect(void *a1, const char *a2, ...)
{
  return [a1 featureViewOptionsBlurEffect];
}

id objc_msgSend_featureViewOptionsButtonHeight(void *a1, const char *a2, ...)
{
  return [a1 featureViewOptionsButtonHeight];
}

id objc_msgSend_featureViewOptionsButtonLineColor(void *a1, const char *a2, ...)
{
  return [a1 featureViewOptionsButtonLineColor];
}

id objc_msgSend_featureViewOptionsButtonLineWidth(void *a1, const char *a2, ...)
{
  return [a1 featureViewOptionsButtonLineWidth];
}

id objc_msgSend_featureViewTextFont(void *a1, const char *a2, ...)
{
  return [a1 featureViewTextFont];
}

id objc_msgSend_featureViewTextHorizontalPadding(void *a1, const char *a2, ...)
{
  return [a1 featureViewTextHorizontalPadding];
}

id objc_msgSend_featureViewToggleOffset(void *a1, const char *a2, ...)
{
  return [a1 featureViewToggleOffset];
}

id objc_msgSend_featureViews(void *a1, const char *a2, ...)
{
  return [a1 featureViews];
}

id objc_msgSend_featuresContentView(void *a1, const char *a2, ...)
{
  return [a1 featuresContentView];
}

id objc_msgSend_featuresScrollView(void *a1, const char *a2, ...)
{
  return [a1 featuresScrollView];
}

id objc_msgSend_featuresScrollViewHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 featuresScrollViewHeightConstraint];
}

id objc_msgSend_fingerPath(void *a1, const char *a2, ...)
{
  return [a1 fingerPath];
}

id objc_msgSend_fingerPathView(void *a1, const char *a2, ...)
{
  return [a1 fingerPathView];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fixedCoordinateSpace(void *a1, const char *a2, ...)
{
  return [a1 fixedCoordinateSpace];
}

id objc_msgSend_flashScrollIndicators(void *a1, const char *a2, ...)
{
  return [a1 flashScrollIndicators];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 gestureRecognizers];
}

id objc_msgSend_guidedAccessAllowsUnlockWithTouchID(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessAllowsUnlockWithTouchID];
}

id objc_msgSend_guidedAccessShouldSpeakForTimeRestrictionEvents(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessShouldSpeakForTimeRestrictionEvents];
}

id objc_msgSend_guidedAccessToneIdentifierForTimeRestrictionEvents(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessToneIdentifierForTimeRestrictionEvents];
}

id objc_msgSend_hardwareFeatureViewsParameters(void *a1, const char *a2, ...)
{
  return [a1 hardwareFeatureViewsParameters];
}

id objc_msgSend_hasActiveOrPendingCallOrFaceTime(void *a1, const char *a2, ...)
{
  return [a1 hasActiveOrPendingCallOrFaceTime];
}

id objc_msgSend_hasOverlayUserInterface(void *a1, const char *a2, ...)
{
  return [a1 hasOverlayUserInterface];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hostedApplicationShadowColor(void *a1, const char *a2, ...)
{
  return [a1 hostedApplicationShadowColor];
}

id objc_msgSend_hostedApplicationShadowView(void *a1, const char *a2, ...)
{
  return [a1 hostedApplicationShadowView];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return [a1 iconView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierOfVisibleRegularAlert(void *a1, const char *a2, ...)
{
  return [a1 identifierOfVisibleRegularAlert];
}

id objc_msgSend_identifiersOfBannerAlertsAboutToAppear(void *a1, const char *a2, ...)
{
  return [a1 identifiersOfBannerAlertsAboutToAppear];
}

id objc_msgSend_identifiersOfVisibleBannerAlerts(void *a1, const char *a2, ...)
{
  return [a1 identifiersOfVisibleBannerAlerts];
}

id objc_msgSend_identifiersToPaths(void *a1, const char *a2, ...)
{
  return [a1 identifiersToPaths];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return [a1 imageOrientation];
}

id objc_msgSend_incomingCallAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingCallAlertIdentifier];
}

id objc_msgSend_incomingCallType(void *a1, const char *a2, ...)
{
  return [a1 incomingCallType];
}

id objc_msgSend_indexOfInterestAreaPathBeingDragged(void *a1, const char *a2, ...)
{
  return [a1 indexOfInterestAreaPathBeingDragged];
}

id objc_msgSend_initialPreferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 initialPreferredContentSize];
}

id objc_msgSend_instructionsLabel(void *a1, const char *a2, ...)
{
  return [a1 instructionsLabel];
}

id objc_msgSend_instructionsLabelHorizontalOffset(void *a1, const char *a2, ...)
{
  return [a1 instructionsLabelHorizontalOffset];
}

id objc_msgSend_instructionsLabelWidthConstraint(void *a1, const char *a2, ...)
{
  return [a1 instructionsLabelWidthConstraint];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interestAreaPathMapping(void *a1, const char *a2, ...)
{
  return [a1 interestAreaPathMapping];
}

id objc_msgSend_interestAreaPaths(void *a1, const char *a2, ...)
{
  return [a1 interestAreaPaths];
}

id objc_msgSend_interestAreaPathsForStorage(void *a1, const char *a2, ...)
{
  return [a1 interestAreaPathsForStorage];
}

id objc_msgSend_interestAreaPathsForStorageForRotatingView(void *a1, const char *a2, ...)
{
  return [a1 interestAreaPathsForStorageForRotatingView];
}

id objc_msgSend_interestAreaPathsInScreenCoordinates(void *a1, const char *a2, ...)
{
  return [a1 interestAreaPathsInScreenCoordinates];
}

id objc_msgSend_interestAreaPathsUpdateCount(void *a1, const char *a2, ...)
{
  return [a1 interestAreaPathsUpdateCount];
}

id objc_msgSend_interestAreaView(void *a1, const char *a2, ...)
{
  return [a1 interestAreaView];
}

id objc_msgSend_interestAreaViewBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewBackgroundColor];
}

id objc_msgSend_interestAreaViewBackgroundHatchingTexture(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewBackgroundHatchingTexture];
}

id objc_msgSend_interestAreaViewBackgroundHatchingTextureAlpha(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewBackgroundHatchingTextureAlpha];
}

id objc_msgSend_interestAreaViewBackgroundStripePatternAlpha(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewBackgroundStripePatternAlpha];
}

id objc_msgSend_interestAreaViewCloseButtonImage(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewCloseButtonImage];
}

id objc_msgSend_interestAreaViewController(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewController];
}

id objc_msgSend_interestAreaViewFingerPathLineWidth(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewFingerPathLineWidth];
}

id objc_msgSend_interestAreaViewFingerPathStrokeColor(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewFingerPathStrokeColor];
}

id objc_msgSend_interestAreaViewResizingKnobButtonImage(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewResizingKnobButtonImage];
}

id objc_msgSend_interestAreaViewSnapAnimationDuration(void *a1, const char *a2, ...)
{
  return [a1 interestAreaViewSnapAnimationDuration];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_interpolationPathElementMappings(void *a1, const char *a2, ...)
{
  return [a1 interpolationPathElementMappings];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAXUIServerSceneReady(void *a1, const char *a2, ...)
{
  return [a1 isAXUIServerSceneReady];
}

id objc_msgSend_isCloseButton(void *a1, const char *a2, ...)
{
  return [a1 isCloseButton];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isInWorkspace(void *a1, const char *a2, ...)
{
  return [a1 isInWorkspace];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return [a1 isOn];
}

id objc_msgSend_isOptionsVisible(void *a1, const char *a2, ...)
{
  return [a1 isOptionsVisible];
}

id objc_msgSend_isPasscodeViewVisible(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeViewVisible];
}

id objc_msgSend_isRestrictedForAAC(void *a1, const char *a2, ...)
{
  return [a1 isRestrictedForAAC];
}

id objc_msgSend_isSystemAppFrontmost(void *a1, const char *a2, ...)
{
  return [a1 isSystemAppFrontmost];
}

id objc_msgSend_isTouchEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTouchEnabled];
}

id objc_msgSend_isTouchIDCurrentlyActive(void *a1, const char *a2, ...)
{
  return [a1 isTouchIDCurrentlyActive];
}

id objc_msgSend_isTransitionInProgress(void *a1, const char *a2, ...)
{
  return [a1 isTransitionInProgress];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_knobPosition(void *a1, const char *a2, ...)
{
  return [a1 knobPosition];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastBannerAlertShownTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 lastBannerAlertShownTimeInterval];
}

id objc_msgSend_lastPasscodeViewDismissalReason(void *a1, const char *a2, ...)
{
  return [a1 lastPasscodeViewDismissalReason];
}

id objc_msgSend_lastSeenCGPath(void *a1, const char *a2, ...)
{
  return [a1 lastSeenCGPath];
}

id objc_msgSend_lastTranslationAppliedToPathBeingDragged(void *a1, const char *a2, ...)
{
  return [a1 lastTranslationAppliedToPathBeingDragged];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutMode(void *a1, const char *a2, ...)
{
  return [a1 layoutMode];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linePointsContexts(void *a1, const char *a2, ...)
{
  return [a1 linePointsContexts];
}

id objc_msgSend_linePointsIndicesPerElementIndices(void *a1, const char *a2, ...)
{
  return [a1 linePointsIndicesPerElementIndices];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_lockoutAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 lockoutAlertIdentifier];
}

id objc_msgSend_mainAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 mainAccessQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_managedConfigurationQueue(void *a1, const char *a2, ...)
{
  return [a1 managedConfigurationQueue];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_mapping(void *a1, const char *a2, ...)
{
  return [a1 mapping];
}

id objc_msgSend_marginOfErrorForDecidingToMergeInterestAreaPaths(void *a1, const char *a2, ...)
{
  return [a1 marginOfErrorForDecidingToMergeInterestAreaPaths];
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return [a1 mask];
}

id objc_msgSend_maskView(void *a1, const char *a2, ...)
{
  return [a1 maskView];
}

id objc_msgSend_minimumSizeForInterestAreaPath(void *a1, const char *a2, ...)
{
  return [a1 minimumSizeForInterestAreaPath];
}

id objc_msgSend_modalView(void *a1, const char *a2, ...)
{
  return [a1 modalView];
}

id objc_msgSend_modalViewBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 modalViewBottomConstraint];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_needsRotatedFingerPathToMinimizeBoundsArea(void *a1, const char *a2, ...)
{
  return [a1 needsRotatedFingerPathToMinimizeBoundsArea];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfBannerAlertsShownRecently(void *a1, const char *a2, ...)
{
  return [a1 numberOfBannerAlertsShownRecently];
}

id objc_msgSend_numberOfElements(void *a1, const char *a2, ...)
{
  return [a1 numberOfElements];
}

id objc_msgSend_oldInterestAreaPathsIntersectingWithMovingPath(void *a1, const char *a2, ...)
{
  return [a1 oldInterestAreaPathsIntersectingWithMovingPath];
}

id objc_msgSend_optionsButton(void *a1, const char *a2, ...)
{
  return [a1 optionsButton];
}

id objc_msgSend_optionsButtonOffset(void *a1, const char *a2, ...)
{
  return [a1 optionsButtonOffset];
}

id objc_msgSend_optionsDoneButtonBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 optionsDoneButtonBackgroundColor];
}

id objc_msgSend_optionsDoneButtonBackgroundHighlightedColor(void *a1, const char *a2, ...)
{
  return [a1 optionsDoneButtonBackgroundHighlightedColor];
}

id objc_msgSend_optionsDoneButtonFont(void *a1, const char *a2, ...)
{
  return [a1 optionsDoneButtonFont];
}

id objc_msgSend_optionsDoneButtonHeight(void *a1, const char *a2, ...)
{
  return [a1 optionsDoneButtonHeight];
}

id objc_msgSend_optionsView(void *a1, const char *a2, ...)
{
  return [a1 optionsView];
}

id objc_msgSend_optionsViewBackgroundDimmingColor(void *a1, const char *a2, ...)
{
  return [a1 optionsViewBackgroundDimmingColor];
}

id objc_msgSend_optionsViewController(void *a1, const char *a2, ...)
{
  return [a1 optionsViewController];
}

id objc_msgSend_optionsViewPresentationConstraints(void *a1, const char *a2, ...)
{
  return [a1 optionsViewPresentationConstraints];
}

id objc_msgSend_optionsViewSeparatorHeight(void *a1, const char *a2, ...)
{
  return [a1 optionsViewSeparatorHeight];
}

id objc_msgSend_optionsViewSeparatorHorizontalPadding(void *a1, const char *a2, ...)
{
  return [a1 optionsViewSeparatorHorizontalPadding];
}

id objc_msgSend_optionsViewSeparatorVerticalPadding(void *a1, const char *a2, ...)
{
  return [a1 optionsViewSeparatorVerticalPadding];
}

id objc_msgSend_orderedInterestAreaPaths(void *a1, const char *a2, ...)
{
  return [a1 orderedInterestAreaPaths];
}

id objc_msgSend_outOfBoundsDrawingEnabled(void *a1, const char *a2, ...)
{
  return [a1 outOfBoundsDrawingEnabled];
}

id objc_msgSend_overlayActiveContentViewController(void *a1, const char *a2, ...)
{
  return [a1 overlayActiveContentViewController];
}

id objc_msgSend_overlayUserInterfaceViewController(void *a1, const char *a2, ...)
{
  return [a1 overlayUserInterfaceViewController];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_passcodeDismissalTimer(void *a1, const char *a2, ...)
{
  return [a1 passcodeDismissalTimer];
}

id objc_msgSend_passcodeViewController(void *a1, const char *a2, ...)
{
  return [a1 passcodeViewController];
}

id objc_msgSend_passiveInterestAreaViewController(void *a1, const char *a2, ...)
{
  return [a1 passiveInterestAreaViewController];
}

id objc_msgSend_pathInterpolator(void *a1, const char *a2, ...)
{
  return [a1 pathInterpolator];
}

id objc_msgSend_pathsToIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 pathsToIdentifiers];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_releaseOutlets(void *a1, const char *a2, ...)
{
  return [a1 releaseOutlets];
}

id objc_msgSend_reloadAllAccessoryControls(void *a1, const char *a2, ...)
{
  return [a1 reloadAllAccessoryControls];
}

id objc_msgSend_reloadAllComponents(void *a1, const char *a2, ...)
{
  return [a1 reloadAllComponents];
}

id objc_msgSend_reloadAllInterestAreaPaths(void *a1, const char *a2, ...)
{
  return [a1 reloadAllInterestAreaPaths];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeUnmanagedASAMRestrictions(void *a1, const char *a2, ...)
{
  return [a1 removeUnmanagedASAMRestrictions];
}

id objc_msgSend_resetCountDownDurationForDatePicker(void *a1, const char *a2, ...)
{
  return [a1 resetCountDownDurationForDatePicker];
}

id objc_msgSend_resizingKnobButtons(void *a1, const char *a2, ...)
{
  return [a1 resizingKnobButtons];
}

id objc_msgSend_resultHandler(void *a1, const char *a2, ...)
{
  return [a1 resultHandler];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_savedFrame(void *a1, const char *a2, ...)
{
  return [a1 savedFrame];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return [a1 scrollView];
}

id objc_msgSend_selectedDurationInMinutes(void *a1, const char *a2, ...)
{
  return [a1 selectedDurationInMinutes];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_sessionApplicationIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 sessionApplicationIdentifiers];
}

id objc_msgSend_sessionApplicationName(void *a1, const char *a2, ...)
{
  return [a1 sessionApplicationName];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setNeedsUpdateOfSupportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateOfSupportedInterfaceOrientations];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldAllowEditingInterestAreas(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowEditingInterestAreas];
}

id objc_msgSend_shouldDisplayMiniToolbar(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayMiniToolbar];
}

id objc_msgSend_shouldHideAllAlerts(void *a1, const char *a2, ...)
{
  return [a1 shouldHideAllAlerts];
}

id objc_msgSend_shouldNotifyDelegateOfInterestAreaPathsChange(void *a1, const char *a2, ...)
{
  return [a1 shouldNotifyDelegateOfInterestAreaPathsChange];
}

id objc_msgSend_shouldStealAllEvents(void *a1, const char *a2, ...)
{
  return [a1 shouldStealAllEvents];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_snapAnimationDidStartTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 snapAnimationDidStartTimeInterval];
}

id objc_msgSend_snapAnimationProgress(void *a1, const char *a2, ...)
{
  return [a1 snapAnimationProgress];
}

id objc_msgSend_snapAnimationRawProgress(void *a1, const char *a2, ...)
{
  return [a1 snapAnimationRawProgress];
}

id objc_msgSend_sound(void *a1, const char *a2, ...)
{
  return [a1 sound];
}

id objc_msgSend_speechSynthesizer(void *a1, const char *a2, ...)
{
  return [a1 speechSynthesizer];
}

id objc_msgSend_springboardClient(void *a1, const char *a2, ...)
{
  return [a1 springboardClient];
}

id objc_msgSend_startingPath(void *a1, const char *a2, ...)
{
  return [a1 startingPath];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statesForAppRestrictions(void *a1, const char *a2, ...)
{
  return [a1 statesForAppRestrictions];
}

id objc_msgSend_statusAndNavigationBarBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 statusAndNavigationBarBackgroundView];
}

id objc_msgSend_statusBar(void *a1, const char *a2, ...)
{
  return [a1 statusBar];
}

id objc_msgSend_statusBarHeight(void *a1, const char *a2, ...)
{
  return [a1 statusBarHeight];
}

id objc_msgSend_styleProvider(void *a1, const char *a2, ...)
{
  return [a1 styleProvider];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemFeatureViewsParameters(void *a1, const char *a2, ...)
{
  return [a1 systemFeatureViewsParameters];
}

id objc_msgSend_tableSeparatorLightColor(void *a1, const char *a2, ...)
{
  return [a1 tableSeparatorLightColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textContainerView(void *a1, const char *a2, ...)
{
  return [a1 textContainerView];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textsForAppRestrictions(void *a1, const char *a2, ...)
{
  return [a1 textsForAppRestrictions];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRestrictionLockoutViewController(void *a1, const char *a2, ...)
{
  return [a1 timeRestrictionLockoutViewController];
}

id objc_msgSend_timeRestrictionsDatePicker(void *a1, const char *a2, ...)
{
  return [a1 timeRestrictionsDatePicker];
}

id objc_msgSend_timeRestrictionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 timeRestrictionsEnabled];
}

id objc_msgSend_timeRestrictionsFeatureViewTimerIcon(void *a1, const char *a2, ...)
{
  return [a1 timeRestrictionsFeatureViewTimerIcon];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_toggleSwitch(void *a1, const char *a2, ...)
{
  return [a1 toggleSwitch];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topLeftPoint(void *a1, const char *a2, ...)
{
  return [a1 topLeftPoint];
}

id objc_msgSend_topLeftPointOnPath(void *a1, const char *a2, ...)
{
  return [a1 topLeftPointOnPath];
}

id objc_msgSend_topRightPoint(void *a1, const char *a2, ...)
{
  return [a1 topRightPoint];
}

id objc_msgSend_topRightPointOnPath(void *a1, const char *a2, ...)
{
  return [a1 topRightPointOnPath];
}

id objc_msgSend_topShelfAXElement(void *a1, const char *a2, ...)
{
  return [a1 topShelfAXElement];
}

id objc_msgSend_topShelfContainer(void *a1, const char *a2, ...)
{
  return [a1 topShelfContainer];
}

id objc_msgSend_touchIDActiveTimer(void *a1, const char *a2, ...)
{
  return [a1 touchIDActiveTimer];
}

id objc_msgSend_touchIDManager(void *a1, const char *a2, ...)
{
  return [a1 touchIDManager];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transitionContextQueue(void *a1, const char *a2, ...)
{
  return [a1 transitionContextQueue];
}

id objc_msgSend_transitionDuration(void *a1, const char *a2, ...)
{
  return [a1 transitionDuration];
}

id objc_msgSend_transitionIn(void *a1, const char *a2, ...)
{
  return [a1 transitionIn];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unmanagedASAMConfirmationViewController(void *a1, const char *a2, ...)
{
  return [a1 unmanagedASAMConfirmationViewController];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateConstraintsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintsIfNeeded];
}

id objc_msgSend_updateFeatureMasks(void *a1, const char *a2, ...)
{
  return [a1 updateFeatureMasks];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceServer(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceServer];
}

id objc_msgSend_usesResumeNavigationTitles(void *a1, const char *a2, ...)
{
  return [a1 usesResumeNavigationTitles];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vibration(void *a1, const char *a2, ...)
{
  return [a1 vibration];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewDidUnload(void *a1, const char *a2, ...)
{
  return [a1 viewDidUnload];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_viewWillUnload(void *a1, const char *a2, ...)
{
  return [a1 viewWillUnload];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_willPresentModalViewController(void *a1, const char *a2, ...)
{
  return [a1 willPresentModalViewController];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_workspaceInstructionsLabelEdgeInsets(void *a1, const char *a2, ...)
{
  return [a1 workspaceInstructionsLabelEdgeInsets];
}

id objc_msgSend_workspaceInstructionsLabelFont(void *a1, const char *a2, ...)
{
  return [a1 workspaceInstructionsLabelFont];
}

id objc_msgSend_workspaceInstructionsLabelShouldBeDisplayed(void *a1, const char *a2, ...)
{
  return [a1 workspaceInstructionsLabelShouldBeDisplayed];
}

id objc_msgSend_workspaceNavigationBarButtonTextAttributes(void *a1, const char *a2, ...)
{
  return [a1 workspaceNavigationBarButtonTextAttributes];
}

id objc_msgSend_workspaceNavigationBarDismissButtonMinimumWidth(void *a1, const char *a2, ...)
{
  return [a1 workspaceNavigationBarDismissButtonMinimumWidth];
}

id objc_msgSend_workspaceNavigationBarNeedsMiniMetricsInitialized(void *a1, const char *a2, ...)
{
  return [a1 workspaceNavigationBarNeedsMiniMetricsInitialized];
}

id objc_msgSend_workspaceNavigationBarTitleFont(void *a1, const char *a2, ...)
{
  return [a1 workspaceNavigationBarTitleFont];
}