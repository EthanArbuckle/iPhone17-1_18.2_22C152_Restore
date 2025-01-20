uint64_t sub_1000052EC(uint64_t a1, int a2)
{
  NSObject *v4;
  CFStringRef v5;
  int v7;
  CFStringRef v8;

  v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"declined";
    if (a2) {
      v5 = @"accepted";
    }
    v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth confirmation prompt answered: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005488(uint64_t a1, int a2)
{
  v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth contacts sync prompt answered: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000563C(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Bluetooth failed prompt answered", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000057DC(uint64_t a1, int a2)
{
  v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "allow while locked prompt answered: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005990(uint64_t a1, int a2)
{
  v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connect prompt answered: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005B44(uint64_t a1, int a2)
{
  v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "use wireless prompt answered: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005CE8(uint64_t a1, int a2)
{
  v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "enhanced integration prompt answered: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005E9C(uint64_t a1, int a2)
{
  v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connect prompt answered: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006050(uint64_t a1, int a2)
{
  v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "use wireless prompt answered: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000620C(uint64_t a1, char a2)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if ((a2 & 1) == 0)
  {
    CFStringRef v5 = *(void **)(a1 + 32);
    return [v5 _dismissFromGenericFlow];
  }
  return result;
}

uint64_t sub_100006328(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "asset ready prompt confirmed", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000646C(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "asset ready soon prompt confirmed", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000065DC(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006690;
  block[3] = &unk_100010318;
  id v6 = a2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v3;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100006690(void *a1)
{
  if (a1[4])
  {
    v2 = (void *)a1[5];
    return [v2 _presentPromptViewController:];
  }
  else
  {
    id v4 = CARSetupLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PassKit didn't want to present car key setup", v5, 2u);
    }

    return (id)(*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

uint64_t start(int a1, char **a2)
{
  CFStringRef v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_1000073BC(id a1, SBUIRemoteAlertButtonAction *a2, BOOL *a3)
{
}

void sub_1000074E0(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present Bluetooth confirmation prompt", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007624;
    v8[3] = &unk_1000102A0;
    id v9 = *(id *)(a1 + 56);
    [v4 promptDirector:v5 wantsToPresentBluetoothConfirmationPromptForVehicleName:v6 numericCode:v7 responseHandler:v8];
  }
}

uint64_t sub_100007624(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth confirmation prompt received response: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_1000077A0(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present Bluetooth contacts sync prompt", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000078D0;
    v6[3] = &unk_1000102A0;
    id v7 = *(id *)(a1 + 40);
    [v4 promptDirector:v5 wantsToPresentBluetoothContactsSyncPromptWithResponseHandler:v6];
  }
}

uint64_t sub_1000078D0(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth contacts sync prompt received response: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100007A80(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present Bluetooth failed prompt", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007BC4;
    v8[3] = &unk_1000102C8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v4 promptDirector:v5 wantsToPresentBluetoothFailedPromptForVehicleName:v7 isTimeout:v6 responseHandler:v8];
  }
}

uint64_t sub_100007BC4(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Bluetooth failed prompt received response", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100007CBC(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present waiting prompt", v6, 2u);
  }

  id v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    [v4 promptDirectorWantsToPresentWaiting:v5];
  }
}

void sub_100007E54(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present allow while locked prompt", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007F88;
    v7[3] = &unk_1000102A0;
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    [v4 promptDirector:v5 wantsToPresentAllowWhileLockedPromptForVehicleName:v6 responseHandler:v7];
  }
}

uint64_t sub_100007F88(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "allow while locked prompt received response: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_10000811C(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present connect prompt", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008260;
    v8[3] = &unk_1000102A0;
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    [v4 promptDirector:v5 wantsToPresentConnectPromptWithBluetoothOnlyOption:v6 wirelessEnablement:v7 responseHandler:v8];
  }
}

uint64_t sub_100008260(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connect prompt received response: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_1000083F0(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present use wireless prompt", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008534;
    v8[3] = &unk_1000102A0;
    id v9 = *(id *)(a1 + 40);
    [v4 promptDirector:v5 wantsToPresentUseWirelessPromptWithWirelessEnablement:v6 declineVariant:v7 responseHandler:v8];
  }
}

uint64_t sub_100008534(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "use wireless prompt received response: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_1000086DC(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present enhanced integration prompt for vehicle name: %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) director];
  CFStringRef v5 = [v4 presenter];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [*(id *)(a1 + 40) director];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008850;
    v8[3] = &unk_1000102A0;
    id v9 = *(id *)(a1 + 48);
    [v5 promptDirector:v6 wantsToPresentEnhancedIntegrationPromptForVehicleName:v7 responseHandler:v8];
  }
}

uint64_t sub_100008850(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "enhanced integration prompt received response: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_1000089E4(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present connect prompt", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008B28;
    v8[3] = &unk_1000102A0;
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    [v4 promptDirector:v5 wantsToPresentAssetSupportingConnectPromptWithBluetoothOnlyOption:v6 wirelessEnablement:v7 responseHandler:v8];
  }
}

uint64_t sub_100008B28(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connect prompt received response: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100008CB8(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present use wireless prompt", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) director];
  id v4 = [v3 presenter];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) director];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008DFC;
    v8[3] = &unk_1000102A0;
    id v9 = *(id *)(a1 + 40);
    [v4 promptDirector:v5 wantsToPresentAssetSupportingUseWirelessPromptWithWirelessEnablement:v6 declineVariant:v7 responseHandler:v8];
  }
}

uint64_t sub_100008DFC(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"declined";
    if (a2) {
      CFStringRef v5 = @"accepted";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "use wireless prompt received response: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100008FA4(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present asset progress prompt for vehicle name: %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) director];
  CFStringRef v5 = [v4 _remoteAssetProgress];

  [*(id *)(a1 + 40) setProgress:v5];
  uint64_t v6 = [*(id *)(a1 + 40) director];
  int v7 = [v6 presenter];

  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v8 = [*(id *)(a1 + 40) director];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009154;
    v11[3] = &unk_1000102A0;
    id v12 = *(id *)(a1 + 48);
    [v7 promptDirector:v8 wantsToPresentAssetProgressPromptForVehicleName:v9 progressReporter:v10 cancelHandler:v11];
  }
}

uint64_t sub_100009154(uint64_t a1, uint64_t a2)
{
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "asset progress prompt was canceled", v6, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_1000092AC(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present asset ready prompt for vehicle name: %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) director];
  CFStringRef v5 = [v4 presenter];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [*(id *)(a1 + 40) director];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000942C;
    v8[3] = &unk_1000102C8;
    id v9 = *(id *)(a1 + 48);
    [v5 promptDirector:v6 wantsToPresentAssetReadyPromptForVehicleName:v7 confirmationHandler:v8];
  }
  [*(id *)(a1 + 40) setProgress:0];
}

uint64_t sub_10000942C(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "asset ready prompt was confirmed", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100009574(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present asset ready soon prompt for vehicle name: %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) director];
  CFStringRef v5 = [v4 presenter];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [*(id *)(a1 + 40) director];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000096E8;
    v8[3] = &unk_1000102C8;
    id v9 = *(id *)(a1 + 48);
    [v5 promptDirector:v6 wantsToPresentAssetReadySoonPromptForVehicleName:v7 confirmationHandler:v8];
  }
}

uint64_t sub_1000096E8(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "asset ready soon prompt was confirmed", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100009850(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "present setup car keys prompt for vehicle name: %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) director];
  CFStringRef v5 = [v4 presenter];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [*(id *)(a1 + 40) director];
    uint64_t v7 = *(void *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000099D0;
    v9[3] = &unk_1000102C8;
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v5 promptDirector:v6 wantsToPresentSetupCarKeysPromptForVehicleName:v7 carKeyInfo:v8 cancelHandler:v9];
  }
}

uint64_t sub_1000099D0(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "setup car keys prompt was canceled", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100009C6C(id a1, CRSetupPromptDirectorService *a2)
{
}

void sub_100009C7C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  CFStringRef v5 = CARSetupLogForCategory();
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000A838();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10000A878();
  }
}

void sub_100009D7C(id a1, CRSetupPromptDirectorService *a2)
{
}

void sub_100009D8C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  CFStringRef v5 = CARSetupLogForCategory();
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000A8E0();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10000A920();
  }
}

void sub_100009FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009FF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A000(uint64_t a1)
{
}

uint64_t sub_10000A008(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 presenterRequestsAssetProgressWithCompletion:&stru_100010578];

  return _objc_release_x1();
}

void sub_10000A05C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  CFStringRef v5 = CARSetupLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "asset progress completed: success: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10000A30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A33C(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10000A988();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A3FC;
  block[3] = &unk_1000105C8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
}

void sub_10000A3FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionReset];
}

void sub_10000A43C(uint64_t a1)
{
  v2 = CARSetupLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10000A9C8();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A4FC;
  block[3] = &unk_1000105C8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
}

void sub_10000A4FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_10000A5C0(id a1, NSError *a2)
{
  v2 = a2;
  BOOL v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000AA08();
  }
}

void sub_10000A69C(id a1, NSError *a2)
{
  v2 = a2;
  BOOL v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000AA08();
  }
}

void sub_10000A77C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000A7B0(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "CARSetupContainerViewController viewDidLoad", v1, 2u);
}

void sub_10000A7F4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "CARSetupContainerViewController viewDidAppear:", v1, 2u);
}

void sub_10000A838()
{
  sub_10000A798();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "presenterDidDismiss, director replied", v1, 2u);
}

void sub_10000A878()
{
  sub_10000A7A4();
  sub_10000A77C((void *)&_mh_execute_header, v0, v1, "presenterDidDismiss, director replied with error: %@", v2, v3, v4, v5, v6);
}

void sub_10000A8E0()
{
  sub_10000A798();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "presenterIsReady, director replied", v1, 2u);
}

void sub_10000A920()
{
  sub_10000A7A4();
  sub_10000A77C((void *)&_mh_execute_header, v0, v1, "presenterIsReady, director replied with error: %@", v2, v3, v4, v5, v6);
}

void sub_10000A988()
{
  sub_10000A798();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "CarKit setup prompt director service was interrupted", v1, 2u);
}

void sub_10000A9C8()
{
  sub_10000A798();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "CarKit setup prompt director service was invalidated", v1, 2u);
}

void sub_10000AA08()
{
  sub_10000A7A4();
  sub_10000A77C((void *)&_mh_execute_header, v0, v1, "error calling CarKit setup prompt service: %@", v2, v3, v4, v5, v6);
}

uint64_t CARSetupLogForCategory()
{
  return _CARSetupLogForCategory();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__handleConnectionReset(void *a1, const char *a2, ...)
{
  return [a1 _handleConnectionReset];
}

id objc_msgSend__presenterIsReady(void *a1, const char *a2, ...)
{
  return [a1 _presenterIsReady];
}

id objc_msgSend__remoteAssetProgress(void *a1, const char *a2, ...)
{
  return [a1 _remoteAssetProgress];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__setupConnection(void *a1, const char *a2, ...)
{
  return [a1 _setupConnection];
}

id objc_msgSend__setupPromptPresenter(void *a1, const char *a2, ...)
{
  return [a1 _setupPromptPresenter];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_director(void *a1, const char *a2, ...)
{
  return [a1 director];
}

id objc_msgSend_genericNavigationController(void *a1, const char *a2, ...)
{
  return [a1 genericNavigationController];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_presenter(void *a1, const char *a2, ...)
{
  return [a1 presenter];
}

id objc_msgSend_presenterDidDismiss(void *a1, const char *a2, ...)
{
  return [a1 presenterDidDismiss];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_promptDirector(void *a1, const char *a2, ...)
{
  return [a1 promptDirector];
}

id objc_msgSend_proxNavigationController(void *a1, const char *a2, ...)
{
  return [a1 proxNavigationController];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_waitingPrompt(void *a1, const char *a2, ...)
{
  return [a1 waitingPrompt];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}