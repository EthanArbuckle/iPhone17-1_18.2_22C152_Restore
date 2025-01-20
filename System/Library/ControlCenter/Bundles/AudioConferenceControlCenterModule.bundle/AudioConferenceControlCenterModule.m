uint64_t sub_421C()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  long long v6;
  long long v7;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = qword_317C0;
  v5 = qword_317C0;
  if (!qword_317C0)
  {
    v6 = *(_OWORD *)off_28A60;
    v7 = *(_OWORD *)&off_28A70;
    v3[3] = _sl_dlopen();
    qword_317C0 = v3[3];
    v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_432C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4344(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_317C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_43D4()
{
  uint64_t v0 = sub_421C();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_4430()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_317C8;
  uint64_t v7 = qword_317C8;
  if (!qword_317C8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_4514;
    v3[3] = &unk_28AB0;
    v3[4] = &v4;
    sub_4514((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_44FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_4514(uint64_t a1)
{
  sub_43D4();
  Class result = objc_getClass("MTMaterialView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_317C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1DD34();
    return (Class)sub_456C();
  }
  return result;
}

id sub_456C()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_317D0;
  uint64_t v7 = qword_317D0;
  if (!qword_317D0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_4650;
    v3[3] = &unk_28AB0;
    v3[4] = &v4;
    sub_4650((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_4638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_4650(uint64_t a1)
{
  sub_43D4();
  Class result = objc_getClass("MTVisualStylingProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_317D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1DD5C();
    return (Class)sub_46A8();
  }
  return result;
}

id sub_46A8()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_317D8;
  uint64_t v7 = qword_317D8;
  if (!qword_317D8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_478C;
    v3[3] = &unk_28AB0;
    v3[4] = &v4;
    sub_478C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_4774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_478C(uint64_t a1)
{
  sub_43D4();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UIView");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_317D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (RPCCAudioSettingsModuleViewController *)sub_1DD84();
    [(RPCCAudioSettingsModuleViewController *)v2 viewDidLoad];
  }
}

id sub_5680(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2 || ![v2 isEqualToString:*(void *)(*(void *)(a1 + 40) + 120)]) {
    return objc_msgSend(*(id *)(a1 + 40), "layoutVideoConferenceSubviews", *(_OWORD *)v24, *(_OWORD *)&v24[16]);
  }
  SEL v3 = [*(id *)(a1 + 48) name];
  unsigned int v4 = [v3 isEqualToString:AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification];

  if (v4)
  {
    uint64_t v5 = AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 160);
    *(void *)(v6 + 160) = v5;

    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 136446466;
      *(void *)&v24[4] = "-[RPCCAudioSettingsModuleViewController handleAVControlCenterNotification:]_block_invoke";
      *(_WORD *)&v24[12] = 1024;
      *(_DWORD *)&v24[14] = 358;
      v8 = " [INFO] %{public}s:%d supportedMicModes didChange";
      uint32_t v9 = 18;
LABEL_14:
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, v24, v9);
    }
  }
  else
  {
    v10 = [*(id *)(a1 + 48) name];
    if ([v10 isEqualToString:AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification])
    {
    }
    else
    {
      v11 = [*(id *)(a1 + 48) name];
      unsigned int v12 = [v11 isEqualToString:AVControlCenterMicrophoneModesModuleMicrophoneModeDidChangeNotification];

      if (!v12)
      {
        v16 = [*(id *)(a1 + 48) name];
        unsigned int v17 = [v16 isEqualToString:AVControlCenterMicrophoneModesModuleVoiceProcessingBypassedDidChangeNotification];

        if (v17)
        {
          int IsVoiceProcessingBypassedForBundleID = AVControlCenterMicrophoneModesModuleIsVoiceProcessingBypassedForBundleID();
          uint64_t v19 = *(void *)(a1 + 40);
          if (*(unsigned __int8 *)(v19 + 176) != IsVoiceProcessingBypassedForBundleID)
          {
            *(unsigned char *)(v19 + 176) = IsVoiceProcessingBypassedForBundleID;
            if (*(unsigned char *)(*(void *)(a1 + 40) + 176)) {
              +[UIColor systemWhiteColor];
            }
            else {
            v20 = +[UIColor systemOrangeColor];
            }
            [*(id *)(*(void *)(a1 + 40) + 32) setTintColor:v20];

            if (*(unsigned char *)(*(void *)(a1 + 40) + 176)) {
              +[UIColor systemWhiteColor];
            }
            else {
            v21 = +[UIColor systemOrangeColor];
            }
            [*(id *)(*(void *)(a1 + 40) + 40) setTintColor:v21];

            [*(id *)(a1 + 40) setModeForBypass];
            if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v22 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 176);
              *(_DWORD *)v24 = 136446722;
              *(void *)&v24[4] = "-[RPCCAudioSettingsModuleViewController handleAVControlCenterNotification:]_block_invoke";
              *(_WORD *)&v24[12] = 1024;
              *(_DWORD *)&v24[14] = 382;
              *(_WORD *)&v24[18] = 1024;
              *(_DWORD *)&v24[20] = v22;
              v8 = " [INFO] %{public}s:%d currentBypassMode=%d";
              uint32_t v9 = 24;
              goto LABEL_14;
            }
          }
        }
        return objc_msgSend(*(id *)(a1 + 40), "layoutVideoConferenceSubviews", *(_OWORD *)v24, *(_OWORD *)&v24[16]);
      }
    }
    uint64_t ActiveMicrophoneModeForBundleID = AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID();
    uint64_t v14 = *(void *)(a1 + 40);
    if (*(void *)(v14 + 168) != ActiveMicrophoneModeForBundleID)
    {
      *(void *)(v14 + 168) = ActiveMicrophoneModeForBundleID;
      [*(id *)(a1 + 40) setCurrentSelectedMode:*(void *)(*(void *)(a1 + 40) + 168)];
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 168);
        *(_DWORD *)v24 = 136446722;
        *(void *)&v24[4] = "-[RPCCAudioSettingsModuleViewController handleAVControlCenterNotification:]_block_invoke";
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = 368;
        *(_WORD *)&v24[18] = 2048;
        *(void *)&v24[20] = v15;
        v8 = " [INFO] %{public}s:%d _currentMicMode=%zu";
        uint32_t v9 = 28;
        goto LABEL_14;
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "layoutVideoConferenceSubviews", *(_OWORD *)v24, *(_OWORD *)&v24[16]);
}

void sub_5FBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_6004()
{
}

uint64_t sub_600C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isSupportedMicMode:0])
  {
    AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID();
    [*(id *)(a1 + 32) disableAutoMicMode];
    [WeakRetained setCurrentSelectedMode:0];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      uint64_t v5 = "-[RPCCAudioSettingsModuleViewController setupAudioFunctionItems]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 469;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user tapped setCurrentSelectedMode=AVMicrophoneModeDefault", (uint8_t *)&v4, 0x12u);
    }
  }

  return 0;
}

uint64_t sub_6138(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isSupportedMicMode:2])
  {
    AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID();
    [*(id *)(a1 + 32) disableAutoMicMode];
    [WeakRetained setCurrentSelectedMode:2];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      uint64_t v5 = "-[RPCCAudioSettingsModuleViewController setupAudioFunctionItems]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 489;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user tapped setCurrentSelectedMode=AVMicrophoneModeVoiceIsolation", (uint8_t *)&v4, 0x12u);
    }
  }

  return 0;
}

uint64_t sub_6264(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isSupportedMicMode:1])
  {
    AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID();
    [*(id *)(a1 + 32) disableAutoMicMode];
    [WeakRetained setCurrentSelectedMode:1];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      uint64_t v5 = "-[RPCCAudioSettingsModuleViewController setupAudioFunctionItems]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 509;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user tapped setCurrentSelectedMode=AVMicrophoneModeMusic", (uint8_t *)&v4, 0x12u);
    }
  }

  return 0;
}

void sub_6390(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  v2 = +[NSArray arrayWithObjects:&v3 count:3];
  [v1 setMenuItems:v2];
}

id sub_6AAC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExpanded]) {
    [*(id *)(a1 + 32) setupAudioFunctionItems];
  }
  v2 = *(void **)(a1 + 32);

  return [v2 layoutVideoConferenceSubviews];
}

uint64_t sub_76A8()
{
  if (!qword_317E0) {
    qword_317E0 = _sl_dlopen();
  }
  return qword_317E0;
}

uint64_t sub_7778()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_317E8;
  uint64_t v6 = qword_317E8;
  if (!qword_317E8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_78B8;
    v2[3] = &unk_28AB0;
    v2[4] = &v3;
    sub_78B8((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_782C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7844()
{
  uint64_t result = _sl_dlopen();
  qword_317E0 = result;
  return result;
}

void *sub_78B8(uint64_t a1)
{
  v2 = (void *)sub_76A8();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "AVControlCenterMicrophoneModesModuleSetAutoEnabledForBundleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_317E8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_7968(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_79D8(id a1)
{
  qword_317F0 = objc_alloc_init(RPFeatureFlagUtility);

  _objc_release_x1();
}

void sub_80E4(void *a1)
{
  id v1 = a1;
  v2 = (void (*)(id))sub_97BC();
  if (v2)
  {
    v2(v1);
  }
  else
  {
    uint64_t v3 = (AudioEffectsManager *)sub_1DDAC();
    [(AudioEffectsManager *)v3 setupMicModeNotifications];
  }
}

id sub_831C()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)qword_31810;
  uint64_t v8 = qword_31810;
  if (!qword_31810)
  {
    id v1 = (void *)sub_98FC();
    v6[3] = (uint64_t)dlsym(v1, "AVControlCenterMicrophoneModesModuleAutoEnabledDidChangeNotification");
    qword_31810 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)sub_1DDAC();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id sub_85B0(uint64_t a1)
{
  id result = *(id *)(a1 + 32);
  if (result)
  {
    id result = [result isEqualToString:*(void *)(*(void *)(a1 + 40) + 16)];
    if (result)
    {
      uint64_t v3 = [*(id *)(a1 + 48) name];
      unsigned int v4 = [v3 isEqualToString:AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification];

      if (v4)
      {
        uint64_t v5 = AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID();
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v7 = *(void **)(v6 + 32);
        *(void *)(v6 + 32) = v5;

        if (__RPLogLevel || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          return objc_msgSend(*(id *)(a1 + 40), "updateVisuals", *(_OWORD *)v25, *(_OWORD *)&v25[16]);
        }
        *(_DWORD *)v25 = 136446466;
        *(void *)&v25[4] = "-[AudioEffectsManager handleAVControlCenterNotification:]_block_invoke";
        *(_WORD *)&v25[12] = 1024;
        *(_DWORD *)&v25[14] = 116;
        uint64_t v8 = " [DEBUG] %{public}s:%d _supportedMicModes didChange";
        uint32_t v9 = 18;
        goto LABEL_14;
      }
      v10 = [*(id *)(a1 + 48) name];
      if ([v10 isEqualToString:AVControlCenterMicrophoneModesModuleMicrophoneModeDidChangeNotification])
      {
      }
      else
      {
        v11 = [*(id *)(a1 + 48) name];
        unsigned int v12 = [v11 isEqualToString:AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification];

        if (!v12)
        {
          v16 = [*(id *)(a1 + 48) name];
          unsigned int v17 = [v16 isEqualToString:AVControlCenterMicrophoneModesModuleVoiceProcessingBypassedDidChangeNotification];

          if (!v17)
          {
            v21 = [*(id *)(a1 + 48) name];
            int v22 = sub_831C();
            unsigned int v23 = [v21 isEqualToString:v22];

            if (v23 && sub_9958() && sub_97BC())
            {
              sub_80E4(*(void **)(*(void *)(a1 + 40) + 16));
              *(unsigned char *)(*(void *)(a1 + 40) + 11) = v24;
            }
            return objc_msgSend(*(id *)(a1 + 40), "updateVisuals", *(_OWORD *)v25, *(_OWORD *)&v25[16]);
          }
          int IsVoiceProcessingBypassedForBundleID = AVControlCenterMicrophoneModesModuleIsVoiceProcessingBypassedForBundleID();
          uint64_t v19 = *(void *)(a1 + 40);
          if (*(unsigned __int8 *)(v19 + 8) == IsVoiceProcessingBypassedForBundleID) {
            return objc_msgSend(*(id *)(a1 + 40), "updateVisuals", *(_OWORD *)v25, *(_OWORD *)&v25[16]);
          }
          *(unsigned char *)(v19 + 8) = IsVoiceProcessingBypassedForBundleID;
          [*(id *)(a1 + 40) updateMicMode:0];
          if (__RPLogLevel || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend(*(id *)(a1 + 40), "updateVisuals", *(_OWORD *)v25, *(_OWORD *)&v25[16]);
          }
          int v20 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 8);
          *(_DWORD *)v25 = 136446722;
          *(void *)&v25[4] = "-[AudioEffectsManager handleAVControlCenterNotification:]_block_invoke";
          *(_WORD *)&v25[12] = 1024;
          *(_DWORD *)&v25[14] = 136;
          *(_WORD *)&v25[18] = 1024;
          *(_DWORD *)&v25[20] = v20;
          uint64_t v8 = " [DEBUG] %{public}s:%d _currentBypassMode=%d";
          uint32_t v9 = 24;
LABEL_14:
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, v25, v9);
          return objc_msgSend(*(id *)(a1 + 40), "updateVisuals", *(_OWORD *)v25, *(_OWORD *)&v25[16]);
        }
      }
      uint64_t ActiveMicrophoneModeForBundleID = AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID();
      uint64_t v14 = *(void *)(a1 + 40);
      if (*(void *)(v14 + 40) == ActiveMicrophoneModeForBundleID) {
        return objc_msgSend(*(id *)(a1 + 40), "updateVisuals", *(_OWORD *)v25, *(_OWORD *)&v25[16]);
      }
      *(void *)(v14 + 40) = ActiveMicrophoneModeForBundleID;
      if (__RPLogLevel || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 40), "updateVisuals", *(_OWORD *)v25, *(_OWORD *)&v25[16]);
      }
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 40);
      *(_DWORD *)v25 = 136446722;
      *(void *)&v25[4] = "-[AudioEffectsManager handleAVControlCenterNotification:]_block_invoke";
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = 124;
      *(_WORD *)&v25[18] = 2048;
      *(void *)&v25[20] = v15;
      uint64_t v8 = " [DEBUG] %{public}s:%d currentMicMode=%zu";
      uint32_t v9 = 28;
      goto LABEL_14;
    }
  }
  return result;
}

uint64_t sub_97BC()
{
  uint64_t v3 = 0;
  unsigned int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_31800;
  uint64_t v6 = qword_31800;
  if (!qword_31800)
  {
    id v1 = (void *)sub_98FC();
    v4[3] = (uint64_t)dlsym(v1, "AVControlCenterMicrophoneModesModuleIsAutoEnabledForBundleID");
    qword_31800 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_9894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_98AC(uint64_t a1)
{
  v2 = (void *)sub_98FC();
  id result = dlsym(v2, "AVControlCenterMicrophoneModesModuleIsAutoEnabledForBundleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_31800 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_98FC()
{
  uint64_t v0 = sub_9958();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_9958()
{
  if (!qword_31808) {
    qword_31808 = _sl_dlopen();
  }
  return qword_31808;
}

uint64_t sub_9A28()
{
  uint64_t result = _sl_dlopen();
  qword_31808 = result;
  return result;
}

void *sub_9A9C(uint64_t a1)
{
  v2 = (void *)sub_98FC();
  uint64_t result = dlsym(v2, "AVControlCenterMicrophoneModesModuleAutoEnabledDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_31810 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_A514(uint64_t a1)
{
  if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    unsigned int v4 = "-[RPCCAudioSettingsModuleBackgroundViewController handleAVControlCenterNotification:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 174;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d _supportedMicModes didChange", (uint8_t *)&v3, 0x12u);
  }
  [*(id *)(a1 + 32) setupSupportedLabel];
  v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];
}

void sub_A5FC(uint64_t a1)
{
  if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    unsigned int v4 = "-[RPCCAudioSettingsModuleBackgroundViewController handleAVControlCenterNotification:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 182;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d auto mic mode enabled changed notification", (uint8_t *)&v3, 0x12u);
  }
  [*(id *)(a1 + 32) updateAutoMicModeState];
  v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];
}

uint64_t sub_B990()
{
  if (!qword_31818) {
    qword_31818 = _sl_dlopen();
  }
  return qword_31818;
}

uint64_t sub_BA60()
{
  uint64_t v3 = 0;
  unsigned int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_31820;
  uint64_t v6 = qword_31820;
  if (!qword_31820)
  {
    id v1 = (void *)sub_BC14();
    v4[3] = (uint64_t)dlsym(v1, "AVControlCenterMicrophoneModesModuleAutoEnabledDidChangeNotification");
    qword_31820 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_BB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_BB50()
{
  uint64_t result = _sl_dlopen();
  qword_31818 = result;
  return result;
}

void *sub_BBC4(uint64_t a1)
{
  v2 = (void *)sub_BC14();
  uint64_t result = dlsym(v2, "AVControlCenterMicrophoneModesModuleAutoEnabledDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_31820 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_BC14()
{
  uint64_t v0 = sub_B990();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_BC70()
{
  uint64_t v3 = 0;
  unsigned int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_31828;
  uint64_t v6 = qword_31828;
  if (!qword_31828)
  {
    id v1 = (void *)sub_BC14();
    v4[3] = (uint64_t)dlsym(v1, "AVControlCenterMicrophoneModesModuleIsAutoSupportedForBundleID");
    qword_31828 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_BD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_BD60(uint64_t a1)
{
  v2 = (void *)sub_BC14();
  uint64_t result = dlsym(v2, "AVControlCenterMicrophoneModesModuleIsAutoSupportedForBundleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_31828 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_BDB0()
{
  uint64_t v3 = 0;
  unsigned int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_31830;
  uint64_t v6 = qword_31830;
  if (!qword_31830)
  {
    id v1 = (void *)sub_BC14();
    v4[3] = (uint64_t)dlsym(v1, "AVControlCenterMicrophoneModesModuleIsAutoEnabledForBundleID");
    qword_31830 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_BE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_BEA0(uint64_t a1)
{
  v2 = (void *)sub_BC14();
  uint64_t result = dlsym(v2, "AVControlCenterMicrophoneModesModuleIsAutoEnabledForBundleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_31830 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_BEF0()
{
  uint64_t v3 = 0;
  unsigned int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_31838;
  uint64_t v6 = qword_31838;
  if (!qword_31838)
  {
    id v1 = (void *)sub_BC14();
    v4[3] = (uint64_t)dlsym(v1, "AVControlCenterMicrophoneModesModuleSetAutoEnabledForBundleID");
    qword_31838 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_BFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_BFE0(uint64_t a1)
{
  v2 = (void *)sub_BC14();
  uint64_t result = dlsym(v2, "AVControlCenterMicrophoneModesModuleSetAutoEnabledForBundleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_31838 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_C678()
{
  uint64_t v0 = sub_1E2C0();
  sub_17EAC(v0, qword_31848);
  sub_169AC(v0, (uint64_t)qword_31848);
  return sub_1E2B0();
}

uint64_t sub_C6FC(uint64_t result)
{
  return result;
}

BOOL sub_C704(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_C718()
{
  Swift::UInt v1 = *v0;
  sub_1E690();
  sub_1E6A0(v1);
  return sub_1E6B0();
}

void sub_C760()
{
  sub_1E6A0(*v0);
}

Swift::Int sub_C78C()
{
  Swift::UInt v1 = *v0;
  sub_1E690();
  sub_1E6A0(v1);
  return sub_1E6B0();
}

unint64_t sub_C7D0@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_167F0(*a1);
  *a2 = result;
  return result;
}

void sub_C7FC(void *a1@<X8>)
{
  *a1 = *v1;
}

CGFloat sub_C808()
{
  return CGSizeZero.width;
}

double sub_C818()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule17AudioSettingsView_controlSize;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_C860(double a1, double a2)
{
  uint64_t v5 = (double *)(v2 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule17AudioSettingsView_controlSize);
  uint64_t result = swift_beginAccess();
  double *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_C8B8())()
{
  return j__swift_endAccess;
}

char *sub_C918(double a1, double a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = [self mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = (char *)objc_msgSend(v5, "initWithFrame:", v8, v10, v12, v14);
  v16 = (double *)&v15[OBJC_IVAR____TtC34AudioConferenceControlCenterModule17AudioSettingsView_controlSize];
  swift_beginAccess();
  double *v16 = a1;
  v16[1] = a2;
  return v15;
}

uint64_t sub_CA74()
{
  return (*(uint64_t (**)(void))((char *)&stru_20.maxprot + (swift_isaMask & *v0)))();
}

id sub_CAA8(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, "initWithFrame:", a1, a2, a3, a4);
}

id sub_CB0C(double a1, double a2, double a3, double a4)
{
  *(CGSize *)&v4[OBJC_IVAR____TtC34AudioConferenceControlCenterModule17AudioSettingsView_controlSize] = CGSizeZero;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for AudioSettingsView();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id sub_CC10(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_CC54(void *a1)
{
  *(CGSize *)&v1[OBJC_IVAR____TtC34AudioConferenceControlCenterModule17AudioSettingsView_controlSize] = CGSizeZero;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AudioSettingsView();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_CD1C()
{
  return sub_14964(type metadata accessor for AudioSettingsView);
}

void *sub_CD34()
{
  return &unk_20EB0;
}

uint64_t sub_CD40()
{
  return 0;
}

uint64_t sub_CD48()
{
  return *v0;
}

uint64_t sub_CD50(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*sub_CD58())()
{
  return nullsub_1;
}

uint64_t sub_CD7C()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_CD84(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*sub_CD8C())()
{
  return nullsub_1;
}

uint64_t sub_CDAC()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t sub_CDB4(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*sub_CDBC())()
{
  return nullsub_1;
}

uint64_t sub_CDDC()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t sub_CDE4(uint64_t result)
{
  *(unsigned char *)(v1 + 3) = result;
  return result;
}

uint64_t (*sub_CDEC())()
{
  return nullsub_1;
}

uint64_t sub_CE0C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_CE3C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*sub_CE74())()
{
  return nullsub_1;
}

uint64_t sub_CE94()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_CEC4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*sub_CEFC())()
{
  return nullsub_1;
}

uint64_t sub_CF1C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_CF4C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*sub_CF84())()
{
  return nullsub_1;
}

id sub_CFA4()
{
  id v0 = [self systemBlueColor];

  return v0;
}

id sub_CFE4()
{
  return *(id *)(v0 + 56);
}

void sub_CFEC(uint64_t a1)
{
  *(void *)(v1 + 56) = a1;
}

uint64_t (*sub_D018())()
{
  return nullsub_1;
}

double sub_D038()
{
  return 20.0;
}

double sub_D040()
{
  return *(double *)(v0 + 64);
}

void sub_D048(double a1)
{
  *(double *)(v1 + 64) = a1;
}

uint64_t (*sub_D050())()
{
  return nullsub_1;
}

double sub_D070()
{
  return *(double *)(v0 + 72);
}

void sub_D078(double a1)
{
  *(double *)(v1 + 72) = a1;
}

uint64_t (*sub_D080())()
{
  return nullsub_1;
}

uint64_t sub_D0A4@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, long long a12, uint64_t a13)
{
  *(unsigned char *)a9 = result;
  *(unsigned char *)(a9 + 1) = a2;
  *(unsigned char *)(a9 + 2) = a3;
  *(unsigned char *)(a9 + 3) = a4;
  *(void *)(a9 + 8) = a5;
  *(void *)(a9 + 16) = a6;
  *(void *)(a9 + 24) = a7;
  *(void *)(a9 + 32) = a8;
  *(_OWORD *)(a9 + 40) = a12;
  *(void *)(a9 + 56) = a13;
  *(double *)(a9 + 64) = a10;
  *(double *)(a9 + 72) = a11;
  return result;
}

BOOL sub_D0D4(_OWORD *a1, long long *a2)
{
  long long v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  long long v3 = a1[4];
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  long long v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  long long v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return sub_16824((double *)v8, (double *)v9);
}

void sub_D130(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void sub_D13C()
{
  qword_31868 = 0x405C400000000000;
}

void sub_D150()
{
  qword_31878 = 0x4024000000000000;
}

void sub_D160()
{
  qword_31888 = 0x4020000000000000;
}

void sub_D170()
{
  qword_31898 = 0x4064600000000000;
}

double sub_D184()
{
  double result = *(double *)sub_18A74();
  qword_318A8 = *(void *)&result;
  return result;
}

void sub_D1A8()
{
  byte_318B8 = 1;
  qword_318C0 = 0xE900000000000073;
}

uint64_t sub_D1C8()
{
  return 0;
}

void *sub_D1D0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_previewView);
  swift_beginAccess();
  long long v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_D220(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_previewView);
  swift_beginAccess();
  long long v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_D274())()
{
  return j_j__swift_endAccess;
}

id sub_D2D0()
{
  id v0 = objc_allocWithZone((Class)UIView);

  return [v0 init];
}

id sub_D308()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_containerView));
}

void sub_D318()
{
  if (qword_318C8 != -1) {
    swift_once();
  }
  sub_D3E0();
}

long long *sub_D394()
{
  if (qword_318C8 != -1) {
    swift_once();
  }
  return &xmmword_31D40;
}

void sub_D3E0()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  NSString v2 = sub_1E330();
  swift_bridgeObjectRelease();
  id v3 = self;
  id v4 = [v3 _systemImageNamed:v2];

  if (!v4)
  {
    NSString v5 = sub_1E330();
    id v4 = [v3 _systemImageNamed:v5];
  }
  swift_bridgeObjectRetain();
  NSString v6 = sub_1E330();
  swift_bridgeObjectRelease();
  id v7 = [v3 _systemImageNamed:v6];

  if (!v7)
  {
    NSString v8 = sub_1E330();
    id v7 = [v3 _systemImageNamed:v8];
  }
  if (v4)
  {
    if (v7)
    {
      type metadata accessor for EffectControl();
      uint64_t v9 = *((void *)v1 + 1);
      uint64_t v10 = *((void *)v1 + 2);
      int v11 = v1[1];
      id v12 = v4;
      swift_bridgeObjectRetain();
      id v13 = v7;
      sub_1A258(v11, v12, v9, v10, 0, 0, v13, 0, 0);
      uint64_t v15 = v14;
      uint64_t v16 = *v1;
      [v14 setTag:v16];
      [*(id *)&v15[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonGlyph] setTag:v16];
      [*(id *)&v15[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron] setTag:v16];
      [*(id *)&v15[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider] setTag:v16];
      unsigned int v17 = v15;
      NSString v18 = sub_1E330();
      [v17 setAccessibilityIdentifier:v18];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_D63C()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_standardButton));
}

void sub_D64C()
{
  if (qword_318D0 != -1) {
    swift_once();
  }
  sub_D3E0();
}

long long *sub_D6C8()
{
  if (qword_318D0 != -1) {
    swift_once();
  }
  return &xmmword_31D90;
}

id sub_D714()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_voiceIsolationButton));
}

void sub_D724()
{
  if (qword_318D8 != -1) {
    swift_once();
  }
  sub_D3E0();
}

long long *sub_D7A0()
{
  if (qword_318D8 != -1) {
    swift_once();
  }
  return &xmmword_31DE0;
}

id sub_D7EC()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_wideSpectrumButton));
}

void sub_D7FC()
{
  if (qword_318E0 != -1) {
    swift_once();
  }
  sub_D3E0();
}

long long *sub_D878()
{
  if (qword_318E0 != -1) {
    swift_once();
  }
  return &xmmword_31E30;
}

id sub_D8C4()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_autoButton));
}

id sub_D8D8()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v1 = self;
  id v2 = [v1 preferredFontForTextStyle:UIFontTextStyleCallout];
  [v2 pointSize];
  double v4 = v3;

  double v5 = 18.0;
  if (v4 <= 18.0) {
    double v5 = v4;
  }
  id v6 = [v1 systemFontOfSize:v5];
  [v0 setFont:v6];

  [v0 setNumberOfLines:0];
  [v0 setLineBreakMode:0];
  [v0 setTextAlignment:1];
  [v0 controlCenterApplyPrimaryContentShadow];
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v0;
}

id sub_DA1C()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_unavailableLabel));
}

uint64_t sub_DA74()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_shouldLoadFromSensor);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_DB08(char a1)
{
  double v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_shouldLoadFromSensor);
  uint64_t result = swift_beginAccess();
  *double v3 = a1;
  return result;
}

uint64_t (*sub_DB54())()
{
  return j_j__swift_endAccess;
}

void *sub_DBFC()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_contentModuleContext);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_DCCC(void *a1)
{
  id v3 = (void **)(v1
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_contentModuleContext);
  swift_beginAccess();
  double v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  sub_E8B8();
}

void (*sub_DD38(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_DD98;
}

void sub_DD98(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_E8B8();
  }
}

id sub_DDCC()
{
  id v0 = objc_allocWithZone((Class)AudioEffectsManager);

  return [v0 init];
}

id sub_DE04()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_audioEffectsManager);
  swift_beginAccess();
  id v2 = *v1;

  return v2;
}

void sub_DE5C(void *a1)
{
}

uint64_t (*sub_DE68())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_DEC4()
{
  sub_16968(&qword_313E8);
  uint64_t v1 = swift_allocObject();
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_autoButton);
  *(_OWORD *)(v1 + 16) = xmmword_20DC0;
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_standardButton);
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  double v4 = *(void **)(v0
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_voiceIsolationButton);
  id v5 = *(void **)(v0
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_wideSpectrumButton);
  *(void *)(v1 + 48) = v4;
  *(void *)(v1 + 56) = v5;
  uint64_t v11 = v1;
  sub_1E3A0();
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  return v11;
}

unint64_t sub_DF78()
{
  unint64_t result = (*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v0)))();
  unint64_t v2 = result;
  if (!(result >> 62))
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (v3) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return (unint64_t)&_swiftEmptyArrayStorage;
  }
  unint64_t result = sub_1E650();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_1E5D0();
      }
      else {
        id v5 = *(id *)(v2 + 8 * i + 32);
      }
      id v6 = v5;
      if ([v5 isHidden])
      {
      }
      else
      {
        sub_1E5F0();
        sub_1E610();
        sub_1E620();
        sub_1E600();
      }
    }
    swift_bridgeObjectRelease();
    return (unint64_t)&_swiftEmptyArrayStorage;
  }
  return result;
}

double sub_E1DC()
{
  if (qword_318A0 != -1) {
    swift_once();
  }
  double v0 = *(double *)&qword_318A8;
  if (qword_31880 != -1) {
    swift_once();
  }
  double v1 = *(double *)&qword_31888;
  if (qword_31870 != -1) {
    swift_once();
  }
  return v0 * 4.0 + v1 * 3.0 + 0.0 + *(double *)&qword_31878 + *(double *)&qword_31878;
}

double sub_E2C4()
{
  return 0.0;
}

double sub_E314()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_compactContinuousCornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

void sub_E464(double a1)
{
  uint64_t v3 = (double *)((char *)v1
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_compactContinuousCornerRadius);
  uint64_t v4 = swift_beginAccess();
  *uint64_t v3 = a1;
  uint64_t v5 = (*(uint64_t (**)(uint64_t))&stru_B8.sectname[swift_isaMask & *v1])(v4);
  if (v5)
  {
    id v6 = (void *)v5;
    double v7 = *v3;
    if (qword_31870 != -1) {
      swift_once();
    }
    [v6 _setContinuousCornerRadius:v7 - *(double *)&qword_31878];
  }
}

void (*sub_E550(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_compactContinuousCornerRadius;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_E5BC;
}

void sub_E5BC(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))&stru_B8.sectname[swift_isaMask & **(void **)(v3 + 24)])(v4);
    if (v5)
    {
      id v6 = (void *)v5;
      double v7 = *(double *)(*(void *)(v3 + 24) + *(void *)(v3 + 32));
      if (qword_31870 != -1) {
        swift_once();
      }
      [v6 _setContinuousCornerRadius:v7 - *(double *)&qword_31878];
    }
  }

  free((void *)v3);
}

id sub_E6A0()
{
  id v0 = objc_allocWithZone((Class)RPCCMTVisualStylingProvider);

  return [v0 init];
}

id sub_E6D8()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_platterStrokeVisualStylingProvider);
  swift_beginAccess();
  unint64_t v2 = *v1;

  return v2;
}

void sub_E730(void *a1)
{
}

void sub_E73C(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a1;
}

uint64_t (*sub_E78C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_E7E8()
{
  return 1;
}

BOOL sub_E7F8()
{
  return ((*(uint64_t (**)(void))((char *)&stru_B8.offset + (swift_isaMask & *v0)))() & 1) == 0;
}

void sub_E8B8()
{
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1E2C0();
  sub_169AC(v1, (uint64_t)qword_31848);
  uint64_t v2 = v0;
  uint64_t v3 = sub_1E2A0();
  os_log_type_t v4 = sub_1E3C0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    uint64_t v7 = (*(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v2)))();
    sub_1E590();
    *id v6 = v7;

    _os_log_impl(&dword_0, v3, v4, "refreshCurrentApplication, context=%@", v5, 0xCu);
    sub_16968((uint64_t *)&unk_31700);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v8 = (void *)(*(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v2)))();
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = v8;
    uint64_t v11 = sub_1E2A0();
    os_log_type_t v12 = sub_1E3C0();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      v30 = (void *)swift_slowAlloc();
      *(_DWORD *)id v13 = 138412290;
      double v14 = v10;
      sub_1E590();
      void *v30 = v9;

      _os_log_impl(&dword_0, v11, v12, "setting module context on audio effects manager %@", v13, 0xCu);
      sub_16968((uint64_t *)&unk_31700);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v11 = v10;
    }

    uint64_t v15 = *(uint64_t (**)(void))&stru_108.segname[swift_isaMask & *v2];
    uint64_t v16 = (void *)v15();
    [v16 updateCurrentApplicationWithContext:v10];

    unsigned int v17 = (void *)v15();
    [v17 updateMicModeStates];

    (*(void (**)(void))&stru_1A8.segname[(swift_isaMask & *v2) - 8])();
    id v18 = [v2 viewIfLoaded];
    if (!v18) {
      goto LABEL_24;
    }
    uint64_t v19 = v18;
    type metadata accessor for AudioSettingsView();
    uint64_t v20 = swift_dynamicCastClass();
    if (v20)
    {
      v21 = (void *)v20;
      double v22 = (*(double (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v2)))();
      if (qword_31860 != -1) {
        swift_once();
      }
      double v23 = *(double *)&qword_31868;
      if (qword_31880 != -1)
      {
        buf = (uint8_t *)qword_31868;
        swift_once();
        double v23 = *(double *)&buf;
      }
      double v24 = v23 + *(double *)&qword_31888;
      if (qword_31890 != -1)
      {
        *(double *)&bufa = v24;
        swift_once();
        double v24 = *(double *)&bufa;
      }
      double v25 = v24 + *(double *)&qword_31898;
      if (qword_31870 != -1)
      {
        *(double *)&bufb = v25;
        swift_once();
        double v25 = *(double *)&bufb;
      }
      (*(void (**)(double, double))((char *)&stru_20.nsects + (swift_isaMask & *v21)))(v25 + *(double *)&qword_31878 + *(double *)&qword_31878, v22);
      id v26 = [v2 view];
      if (v26)
      {
        v27 = v26;
        [v26 invalidateIntrinsicContentSize];

        id v28 = [v2 view];
        if (v28)
        {
          id v29 = v28;
          [v28 setNeedsLayout];

          uint64_t v19 = v29;
          goto LABEL_23;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
LABEL_23:

LABEL_24:
  }
}

void sub_EF00()
{
  uint64_t v1 = *(uint64_t (**)(void))&stru_108.segname[swift_isaMask & *v0];
  uint64_t v2 = (void *)v1();
  uint64_t v3 = *(uint64_t (**)(void))((char *)&stru_B8.offset + (swift_isaMask & *v0));
  [v2 setShouldLoadFromSensor:v3() & 1];

  os_log_type_t v4 = (void *)v1();
  [v4 setDelegate:v0];

  if (v3())
  {
    uint64_t v5 = (*(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v0)))();
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = (void *)v5;
    sub_E8B8();
  }
  else
  {
    id v6 = (void *)v1();
    [v6 setupWithoutSensorData];
  }

LABEL_6:
  uint64_t v7 = (void *)v1();
  [v7 updateMicModeStates];

  id v8 = (void *)v1();
  [v8 setupMicModeNotifications];

  double v9 = (*(double (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v0)))();
  if (qword_31860 != -1) {
    swift_once();
  }
  double v10 = *(double *)&qword_31868;
  if (qword_31880 != -1) {
    swift_once();
  }
  double v11 = v10 + *(double *)&qword_31888;
  if (qword_31890 != -1) {
    swift_once();
  }
  double v12 = v11 + *(double *)&qword_31898;
  if (qword_31870 != -1) {
    swift_once();
  }
  double v13 = v12 + *(double *)&qword_31878 + *(double *)&qword_31878;
  id v14 = objc_allocWithZone((Class)type metadata accessor for AudioSettingsView());
  id v15 = [self mainScreen];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = (char *)objc_msgSend(v14, "initWithFrame:", v17, v19, v21, v23);
  double v25 = (double *)&v24[OBJC_IVAR____TtC34AudioConferenceControlCenterModule17AudioSettingsView_controlSize];
  swift_beginAccess();
  *double v25 = v13;
  v25[1] = v9;
  [v0 setView:v24];

  id v26 = self;
  sub_18868();
  swift_bridgeObjectRetain();
  NSString v27 = sub_1E330();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v29 = [self bundleForClass:ObjCClassFromMetadata];
  id v30 = [v26 _visualStylingProviderForStyleSetNamed:v27 inBundle:v29];

  if (v30) {
    (*(void (**)(id))&stru_158.segname[swift_isaMask & *v0])(v30);
  }
  else {
    __break(1u);
  }
}

void sub_F3B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E2C0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v102 = (char *)&v94 - v7;
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v101 = sub_169AC(v2, (uint64_t)qword_31848);
  id v8 = sub_1E2A0();
  os_log_type_t v9 = sub_1E3C0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  v100 = v6;
  if (v10)
  {
    double v11 = (uint8_t *)swift_slowAlloc();
    CGFloat Width = COERCE_DOUBLE(swift_slowAlloc());
    *(_DWORD *)double v11 = 136315138;
    uint64_t v104 = sub_16198(0x4C64694477656976, 0xED0000292864616FLL, (uint64_t *)&Width);
    sub_1E590();
    _os_log_impl(&dword_0, v8, v9, "%s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  double v12 = (objc_class *)type metadata accessor for AudioSettingsViewController();
  v106.receiver = v1;
  v106.super_class = v12;
  objc_msgSendSuper2(&v106, "viewDidLoad");
  id v13 = [self displayLinkWithTarget:v1 selector:"displayLinkUpdate:"];
  uint64_t v14 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_displayLink;
  id v15 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_displayLink);
  *(void *)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_displayLink) = v13;

  double v16 = *(void **)((char *)v1 + v14);
  if (v16)
  {
    [v16 setPaused:1];
    double v17 = *(void **)((char *)v1 + v14);
    if (v17)
    {
      double v18 = self;
      id v19 = v17;
      id v20 = [v18 currentRunLoop];
      [v19 addToRunLoop:v20 forMode:NSRunLoopCommonModes];
    }
  }
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v22 = [self bundleForClass:ObjCClassFromMetadata];
  id v23 = objc_allocWithZone((Class)BSUICAPackageView);
  NSString v24 = sub_1E330();
  id v25 = [v23 initWithPackageName:v24 inBundle:v22];

  id v26 = &swift_isaMask;
  uint64_t v27 = (*(uint64_t (**)(id))&stru_B8.segname[(swift_isaMask & *v1) - 8])(v25);
  uint64_t v28 = (*(uint64_t (**)(uint64_t))&stru_B8.sectname[swift_isaMask & *v1])(v27);
  if (v28)
  {
    id v29 = (void *)v28;
    uint64_t v30 = v3 + 16;
    v31 = v102;
    v96 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v96(v102, v101, v2);
    id v32 = v29;
    v33 = sub_1E2A0();
    uint64_t v34 = v3;
    os_log_type_t v35 = sub_1E3C0();
    BOOL v36 = os_log_type_enabled(v33, v35);
    v103 = v1;
    uint64_t v98 = v34;
    uint64_t v99 = v2;
    uint64_t v97 = v30;
    if (v36)
    {
      uint64_t v37 = swift_slowAlloc();
      CGFloat Width = COERCE_DOUBLE(swift_slowAlloc());
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v104 = sub_16198(0x4C64694477656976, 0xED0000292864616FLL, (uint64_t *)&Width);
      sub_1E590();
      *(_WORD *)(v37 + 12) = 2080;
      id v38 = [v32 publishedObjectNames];
      if (!v38)
      {
LABEL_43:

        __break(1u);
        goto LABEL_44;
      }
      v39 = v38;
      sub_1E380();

      uint64_t v40 = sub_1E390();
      unint64_t v42 = v41;
      swift_bridgeObjectRelease();
      uint64_t v104 = sub_16198(v40, v42, (uint64_t *)&Width);
      sub_1E590();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v33, v35, "%s waveform published objects %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v43 = *(void (**)(char *, uint64_t))(v98 + 8);
      v43(v102, v99);
      uint64_t v1 = v103;
      id v26 = &swift_isaMask;
    }
    else
    {

      v43 = *(void (**)(char *, uint64_t))(v34 + 8);
      v43(v31, v2);
    }
    v47 = self;
    id v48 = v32;
    id v49 = [v47 systemGrayTintColor];
    [v48 setBackgroundColor:v49];

    id v50 = [v48 layer];
    [v50 setMasksToBounds:1];

    [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
    v51 = *(double (**)(void))((char *)&stru_108.flags + (swift_isaMask & *v1));
    id v32 = v48;
    double v52 = v51();
    if (qword_31870 != -1) {
      swift_once();
    }
    [v32 _setContinuousCornerRadius:v52 - *(double *)&qword_31878];

    id v53 = [v1 view];
    if (v53)
    {
      v54 = v53;
      [v53 addSubview:v32];

      v55 = *(char **)((char *)v1
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_containerView);
      [v55 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v56 = [v1 view];
      if (!v56)
      {
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
      v57 = v56;
      v95 = (uint64_t (*)(char *, uint64_t))v43;
      [v56 addSubview:v55];

      unint64_t v58 = (*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v1)))();
      unint64_t v59 = v58;
      id v94 = v32;
      v102 = v55;
      if (v58 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v60 = sub_1E650();
        if (!v60) {
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v60 = *(void *)((char *)&dword_10 + (v58 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        if (!v60) {
          goto LABEL_32;
        }
      }
      if (v60 >= 1)
      {
        uint64_t v61 = 0;
        v62 = v103;
        do
        {
          if ((v59 & 0xC000000000000001) != 0) {
            v63 = (char *)sub_1E5D0();
          }
          else {
            v63 = (char *)*(id *)(v59 + 8 * v61 + 32);
          }
          v64 = v63;
          if (qword_318A0 != -1) {
            swift_once();
          }
          ++v61;
          objc_msgSend(v64, "_setContinuousCornerRadius:", *(double *)&qword_318A8 * 0.5, v94);
          [v102 addSubview:v64];
          v65 = *(void **)&v64[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonGlyph];
          [v65 addTarget:v62 action:"buttonTappedWithSender:" forControlEvents:64];
          [v65 addTarget:v62 action:"buttonDownWithSender:" forControlEvents:1];
        }
        while (v60 != v61);
LABEL_32:
        swift_bridgeObjectRelease_n();
        v66 = v103;
        sub_11C68();
        v67 = v100;
        uint64_t v68 = v99;
        v96(v100, v101, v99);
        id v26 = v66;
        v69 = sub_1E2A0();
        os_log_type_t v70 = sub_1E3C0();
        if (!os_log_type_enabled(v69, v70))
        {

          v69 = v26;
          goto LABEL_37;
        }
        uint64_t v71 = swift_slowAlloc();
        *(_DWORD *)uint64_t v71 = 134218240;
        id v72 = [v26 view];
        if (v72)
        {
          v73 = v72;
          [v72 frame];
          CGFloat v75 = v74;
          CGFloat v77 = v76;
          CGFloat v79 = v78;
          CGFloat v81 = v80;

          v107.origin.x = v75;
          v107.origin.y = v77;
          v107.size.width = v79;
          v107.size.height = v81;
          CGFloat Width = CGRectGetWidth(v107);
          sub_1E590();

          *(_WORD *)(v71 + 12) = 2048;
          id v82 = [v26 view];
          if (v82)
          {
            v83 = v82;
            [v82 frame];
            CGFloat v85 = v84;
            CGFloat v87 = v86;
            CGFloat v89 = v88;
            CGFloat v91 = v90;

            v108.origin.x = v85;
            v108.origin.y = v87;
            v108.size.width = v89;
            v108.size.height = v91;
            CGFloat Width = CGRectGetHeight(v108);
            sub_1E590();

            _os_log_impl(&dword_0, v69, v70, "view frame width=%f height=%f", (uint8_t *)v71, 0x16u);
            swift_slowDealloc();
            v67 = v100;
LABEL_37:

            uint64_t v92 = v95(v67, v68);
            uint64_t v93 = (*(uint64_t (**)(uint64_t))&stru_1A8.segname[(swift_isaMask & (uint64_t)v26->isa) - 8])(v92);
            if (((*(uint64_t (**)(uint64_t))((char *)&stru_B8.offset + (swift_isaMask & (uint64_t)v26->isa)))(v93) & 1) == 0) {
              [v26 viewWillAppear:1];
            }

            return;
          }
LABEL_45:

          __break(1u);
          return;
        }
LABEL_44:

        __break(1u);
        goto LABEL_45;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_42;
  }
  v44 = sub_1E2A0();
  os_log_type_t v45 = sub_1E3D0();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    CGFloat Width = COERCE_DOUBLE(swift_slowAlloc());
    *(_DWORD *)v46 = 136315138;
    uint64_t v104 = sub_16198(0x4C64694477656976, 0xED0000292864616FLL, (uint64_t *)&Width);
    sub_1E590();
    _os_log_impl(&dword_0, v44, v45, "%s failed to unwrap waveform preview", v46, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
}

void sub_10144(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(uint64_t (**)(void))((char *)&stru_108.offset + (swift_isaMask & *v1));
  unint64_t v5 = v4();
  id v6 = a1;
  id v20 = sub_16A08(v5, v6);
  swift_bridgeObjectRelease();

  if (v20)
  {
    char v7 = sub_E7E8();
    sub_1D0D0(v7 & 1);
  }
  else
  {
    if (qword_31840 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1E2C0();
    sub_169AC(v8, (uint64_t)qword_31848);
    id v9 = v6;
    BOOL v10 = sub_1E2A0();
    os_log_type_t v11 = sub_1E3C0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      v21[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315394;
      sub_16198(0xD000000000000013, 0x80000000000221A0, v21);
      sub_1E590();
      *(_WORD *)(v12 + 12) = 2048;
      [v9 tag];
      sub_1E590();

      _os_log_impl(&dword_0, v10, v11, "AudioSettingsViewController %s Could not find corresponding button for tag %ld", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v13 = v2;
    uint64_t v14 = sub_1E2A0();
    os_log_type_t v15 = sub_1E3C0();
    if (os_log_type_enabled(v14, v15))
    {
      double v16 = (uint8_t *)swift_slowAlloc();
      v21[0] = swift_slowAlloc();
      *(_DWORD *)double v16 = 136315138;
      v4();
      type metadata accessor for EffectControl();
      uint64_t v17 = sub_1E390();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      sub_16198(v17, v19, v21);
      sub_1E590();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v14, v15, "Supported buttons: %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

void sub_10590(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(uint64_t (**)(void))((char *)&stru_108.offset + (swift_isaMask & *v1));
  unint64_t v5 = v4();
  id v6 = a1;
  char v7 = sub_16A08(v5, v6);
  swift_bridgeObjectRelease();

  if (v7)
  {
    id v8 = [v6 tag];
    if ((unint64_t)v8 >= 4) {
      unsigned __int8 v9 = 0;
    }
    else {
      unsigned __int8 v9 = v8;
    }
    if (qword_31840 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1E2C0();
    sub_169AC(v10, (uint64_t)qword_31848);
    os_log_type_t v11 = sub_1E2A0();
    os_log_type_t v12 = sub_1E3C0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      v34[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315394;
      sub_16198(0xD000000000000015, 0x80000000000221C0, v34);
      sub_1E590();
      *(_WORD *)(v13 + 12) = 2048;
      sub_1E590();
      _os_log_impl(&dword_0, v11, v12, "%s setting MicMode %ld", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    if (v9 == 3)
    {
      if ([v7 isSelected])
      {
LABEL_18:
        sub_1D1C8();
        id v25 = (void *)(*(uint64_t (**)(void))&stru_108.segname[swift_isaMask & *v2])();
        [v25 updateMicModeStates];

        return;
      }
      id v14 = v7;
      objc_msgSend(v14, "setSelected:", objc_msgSend(v14, "isSelected") ^ 1);

      char v15 = [v14 isSelected];
      char v16 = sub_CD40();
      char v17 = sub_E7E8();
      id v18 = sub_1C770(v15, v16 & 1, v17 & 1);
      unint64_t v19 = (void *)(*(uint64_t (**)(id))&stru_108.segname[swift_isaMask & *v2])(v18);
      objc_msgSend(v19, "updateAutomaticMicMode:", objc_msgSend(v14, "isSelected"));
    }
    else
    {
      unint64_t v19 = (void *)(*(uint64_t (**)(void))&stru_108.segname[swift_isaMask & *v2])();
      [v19 updateMicMode:v9];
    }

    goto LABEL_18;
  }
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1E2C0();
  sub_169AC(v20, (uint64_t)qword_31848);
  id v21 = v6;
  id v22 = sub_1E2A0();
  os_log_type_t v23 = sub_1E3C0();
  v33 = (void (*)(void))v4;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    v34[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315394;
    sub_16198(0xD000000000000015, 0x80000000000221C0, v34);
    sub_1E590();
    *(_WORD *)(v24 + 12) = 2048;
    [v21 tag];
    sub_1E590();

    _os_log_impl(&dword_0, v22, v23, "AudioSettingsViewController %s Could not find corresponding button for tag %ld", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v26 = v2;
  uint64_t v27 = sub_1E2A0();
  os_log_type_t v28 = sub_1E3C0();
  if (os_log_type_enabled(v27, v28))
  {
    id v29 = (uint8_t *)swift_slowAlloc();
    v34[0] = swift_slowAlloc();
    *(_DWORD *)id v29 = 136315138;
    v33();
    type metadata accessor for EffectControl();
    uint64_t v30 = sub_1E390();
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    sub_16198(v30, v32, v34);
    sub_1E590();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v27, v28, "Supported buttons: %s", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10C98()
{
  uint64_t v1 = v0;
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E2C0();
  sub_169AC(v2, (uint64_t)qword_31848);
  uint64_t v3 = sub_1E2A0();
  os_log_type_t v4 = sub_1E3C0();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    id v60 = (id)swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 136315138;
    sub_16198(0xD000000000000014, 0x80000000000221E0, (uint64_t *)&v60);
    sub_1E590();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v6 = *(uint64_t (**)(void))&stru_108.segname[swift_isaMask & *v1];
  char v7 = (void *)v6();
  id v8 = [v7 displayName];

  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = sub_1E340();
  unint64_t v11 = v10;

  os_log_type_t v12 = (void *)v6();
  id v13 = [v12 supportedModes];

  if (!v13)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    uint64_t v37 = sub_1E2A0();
    os_log_type_t v38 = sub_1E3C0();
    if (!os_log_type_enabled(v37, v38))
    {
LABEL_25:

      return;
    }
    v39 = (uint8_t *)swift_slowAlloc();
    id v60 = (id)swift_slowAlloc();
    *(_DWORD *)v39 = 136315138;
    sub_16198(0xD000000000000014, 0x80000000000221E0, (uint64_t *)&v60);
    sub_1E590();
    _os_log_impl(&dword_0, v37, v38, "%s Unable to unwrap AudioEffectsManager properties", v39, 0xCu);
    swift_arrayDestroy();
LABEL_24:
    swift_slowDealloc();
    swift_slowDealloc();
    goto LABEL_25;
  }
  uint64_t v56 = v9;
  sub_17F10(0, &qword_31408);
  unint64_t v14 = sub_1E380();

  char v15 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_autoButton);
  char v16 = (void *)((uint64_t (*)(id))v6)([v15 setHidden:0]);
  id v17 = [v16 automaticMicModeEnabled];

  [v15 setSelected:v17];
  LOBYTE(v16) = [v15 isSelected];
  LOBYTE(v17) = sub_CD40();
  char v18 = sub_E7E8();
  sub_1C770((char)v16, v17 & 1, v18 & 1);
  unint64_t v19 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_voiceIsolationButton);
  uint64_t v20 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_wideSpectrumButton);
  id v60 = *(id *)((char *)v1
              + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_standardButton);
  id v21 = v60;
  id v22 = v19;
  id v23 = v20;
  sub_119AC(&v60, v14, v1);

  id v60 = v22;
  id v24 = v22;
  sub_119AC(&v60, v14, v1);

  id v60 = v23;
  id v25 = v23;
  sub_119AC(&v60, v14, v1);
  id v57 = v21;

  id v58 = v24;
  id v59 = v25;

  id v26 = (void *)v6();
  id v27 = [v26 currentMicMode];

  (*(void (**)(id))((char *)&stru_1A8.size + (swift_isaMask & *v1)))(v27);
  os_log_type_t v28 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v29 = sub_1E2A0();
  os_log_type_t v30 = sub_1E3C0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    id v60 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315906;
    os_log_type_t type = v30;
    sub_16198(0xD000000000000014, 0x80000000000221E0, (uint64_t *)&v60);
    sub_1E590();
    *(_WORD *)(v31 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_16198(v56, v11, (uint64_t *)&v60);
    sub_1E590();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_1E390();
    unint64_t v34 = v33;
    swift_bridgeObjectRelease();
    sub_16198(v32, v34, (uint64_t *)&v60);
    sub_1E590();
    swift_bridgeObjectRelease_n();
    uint64_t v35 = swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 32) = 2048;
    BOOL v36 = (void *)((uint64_t (*)(uint64_t))v6)(v35);
    [v36 currentMicMode];

    sub_1E590();
    _os_log_impl(&dword_0, v29, type, "%s displayName=%s, supportedModes=%s, currentMicMode=%ld", (uint8_t *)v31, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v40 = v28;
  unint64_t v41 = sub_1E2A0();
  os_log_type_t v42 = sub_1E3C0();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    id v60 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136315650;
    sub_16198(0xD000000000000014, 0x80000000000221E0, (uint64_t *)&v60);
    sub_1E590();
    *(_WORD *)(v43 + 12) = 1024;
    [v57 isEnabled];
    sub_1E590();
    *(_WORD *)(v43 + 18) = 1024;
    [v57 isSelected];
    sub_1E590();

    _os_log_impl(&dword_0, v41, v42, "%s Standard isEnabled=%{BOOL}d isSelected=%{BOOL}d", (uint8_t *)v43, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v44 = v40;
  os_log_type_t v45 = sub_1E2A0();
  os_log_type_t v46 = sub_1E3C0();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = swift_slowAlloc();
    id v60 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 136315650;
    sub_16198(0xD000000000000014, 0x80000000000221E0, (uint64_t *)&v60);
    sub_1E590();
    *(_WORD *)(v47 + 12) = 1024;
    [v58 isEnabled];
    sub_1E590();
    *(_WORD *)(v47 + 18) = 1024;
    [v58 isSelected];
    sub_1E590();

    _os_log_impl(&dword_0, v45, v46, "%s Voice Isolation isEnabled=%{BOOL}d isSelected=%{BOOL}d", (uint8_t *)v47, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v48 = v44;
  id v49 = sub_1E2A0();
  os_log_type_t v50 = sub_1E3C0();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = swift_slowAlloc();
    id v60 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v51 = 136315650;
    sub_16198(0xD000000000000014, 0x80000000000221E0, (uint64_t *)&v60);
    sub_1E590();
    *(_WORD *)(v51 + 12) = 1024;
    [v59 isEnabled];
    sub_1E590();
    *(_WORD *)(v51 + 18) = 1024;
    [v59 isSelected];
    sub_1E590();

    _os_log_impl(&dword_0, v49, v50, "%s Wide Spectrum isEnabled=%{BOOL}d isSelected=%{BOOL}d", (uint8_t *)v51, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  double v52 = v48;
  uint64_t v37 = sub_1E2A0();
  os_log_type_t v53 = sub_1E3C0();
  if (os_log_type_enabled(v37, v53))
  {
    uint64_t v54 = swift_slowAlloc();
    id v60 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 136315650;
    sub_16198(0xD000000000000014, 0x80000000000221E0, (uint64_t *)&v60);
    sub_1E590();
    *(_WORD *)(v54 + 12) = 1024;
    [v15 isEnabled];
    sub_1E590();
    *(_WORD *)(v54 + 18) = 1024;
    [v15 isSelected];
    sub_1E590();

    _os_log_impl(&dword_0, v37, v53, "%s Auto Mic Mode isEnabled=%{BOOL}d isSelected=%{BOOL}d", (uint8_t *)v54, 0x18u);
    swift_arrayDestroy();
    goto LABEL_24;
  }
}

id sub_119AC(id *a1, unint64_t a2, void *a3)
{
  id v5 = *a1;
  [*a1 tag];
  Class isa = sub_1E3B0().super.super.isa;
  char v7 = sub_11AE0((uint64_t)isa, a2);

  id v8 = (void *)(*(uint64_t (**)(void))&stru_108.segname[swift_isaMask & *a3])();
  id v9 = [v8 currentMicMode];

  if (v9 == [v5 tag])
  {
    [v5 setSelected:1];
    unsigned int v10 = [*(id *)((char *)a3+ OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_autoButton) isSelected];
    char v11 = v7 & 1;
    char v12 = 1;
  }
  else
  {
    [v5 setSelected:0];
    char v13 = sub_CD40();
    char v11 = v7 & 1;
    unsigned int v10 = v13 & 1;
    char v12 = 0;
  }
  return sub_1C770(v12, v10, v11);
}

uint64_t sub_11AE0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1E650())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)sub_1E5D0();
LABEL_5:
      id v6 = v5;
      sub_17F10(0, &qword_31408);
      char v7 = sub_1E410();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_1E410();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      sub_1E5D0();
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_1E410();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_11C68()
{
  uint64_t v1 = v0;
  if (qword_318A0 != -1) {
LABEL_36:
  }
    swift_once();
  double v2 = *(double *)&qword_318A8;
  if (qword_31880 != -1) {
    swift_once();
  }
  double v3 = *(double *)&qword_31888;
  uint64_t v4 = (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v1])();
  if (v4)
  {
    id v5 = (void *)v4;
    sub_16968(&qword_313E8);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_20DD0;
    char v7 = *(void **)((char *)v1
                  + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_containerView);
    id v8 = [v7 trailingAnchor];
    id v9 = [v1 view];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = [v9 trailingAnchor];

      if (qword_31870 != -1) {
        swift_once();
      }
      id v12 = [v8 constraintEqualToAnchor:v11 constant:-*(double *)&qword_31878];

      *(void *)(v6 + 32) = v12;
      id v13 = [v7 topAnchor];
      id v14 = [v1 view];
      if (v14)
      {
        char v15 = v14;
        id v16 = [v14 topAnchor];

        id v17 = [v13 constraintEqualToAnchor:v16 constant:*(double *)&qword_31878];
        *(void *)(v6 + 40) = v17;
        id v18 = [v7 leadingAnchor];
        id v19 = [v5 trailingAnchor];
        id v20 = [v18 constraintEqualToAnchor:v19 constant:*(double *)&qword_31878];

        *(void *)(v6 + 48) = v20;
        id v21 = [v7 widthAnchor];
        if (qword_31890 != -1) {
          swift_once();
        }
        id v22 = [v21 constraintEqualToConstant:*(double *)&qword_31898];

        *(void *)(v6 + 56) = v22;
        id v23 = [v7 heightAnchor];
        id v24 = [v5 heightAnchor];
        id v25 = [v23 constraintEqualToAnchor:v24];

        *(void *)(v6 + 64) = v25;
        id v26 = [v5 leadingAnchor];
        id v27 = [v1 view];
        if (v27)
        {
          os_log_type_t v28 = v27;
          id v29 = [v27 leadingAnchor];

          id v30 = [v26 constraintEqualToAnchor:v29 constant:*(double *)&qword_31878];
          *(void *)(v6 + 72) = v30;
          id v31 = [v5 topAnchor];
          id v32 = [v1 view];
          if (v32)
          {
            unint64_t v33 = v32;
            unint64_t v34 = self;
            id v35 = [v33 topAnchor];

            id v36 = [v31 constraintEqualToAnchor:v35 constant:*(double *)&qword_31878];
            *(void *)(v6 + 80) = v36;
            id v37 = [v5 heightAnchor];
            id v38 = [v37 constraintEqualToConstant:v2 * 4.0 + v3 * 3.0];

            *(void *)(v6 + 88) = v38;
            uint64_t v55 = v6;
            sub_1E3A0();
            sub_17F10(0, &qword_31528);
            Class isa = sub_1E370().super.isa;
            swift_bridgeObjectRelease();
            [v34 activateConstraints:isa];

            uint64_t v40 = (swift_isaMask & *v1) + 304;
            unint64_t v41 = *(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v1));
            unint64_t v42 = v41();
            if (v42 >> 62)
            {
              uint64_t v43 = sub_1E650();
              uint64_t v44 = swift_bridgeObjectRelease();
              if (v43 < 0)
              {
                __break(1u);
                goto LABEL_39;
              }
            }
            else
            {
              uint64_t v43 = *(void *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFFF8));
              uint64_t v44 = swift_bridgeObjectRelease();
            }
            unint64_t v45 = ((uint64_t (*)(uint64_t))v41)(v44);
            uint64_t v40 = v45;
            if (!v43)
            {
LABEL_25:

              swift_bridgeObjectRelease();
              return;
            }
            if (!(v45 >> 62))
            {
              uint64_t v46 = *(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFFF8));
              if (v46)
              {
LABEL_18:
                unint64_t v47 = 0;
                uint64_t v48 = v43 - 1;
                while (1)
                {
                  if ((v40 & 0xC000000000000001) != 0)
                  {
                    id v49 = (id)sub_1E5D0();
                  }
                  else
                  {
                    if (v47 >= *(void *)((char *)&dword_10 + (v40 & 0xFFFFFFFFFFFFFF8)))
                    {
                      __break(1u);
                      goto LABEL_36;
                    }
                    id v49 = *(id *)(v40 + 8 * v47 + 32);
                  }
                  os_log_type_t v50 = v49;
                  sub_124CC(v49, v47);

                  if (v48 != v47 && v46 != ++v47) {
                    continue;
                  }
                  goto LABEL_25;
                }
              }
              goto LABEL_25;
            }
LABEL_39:
            uint64_t v46 = sub_1E650();
            if (v46) {
              goto LABEL_18;
            }
            goto LABEL_25;
          }
LABEL_44:
          __break(1u);
          return;
        }
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_43;
  }
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v51 = sub_1E2C0();
  sub_169AC(v51, (uint64_t)qword_31848);
  oslog = sub_1E2A0();
  os_log_type_t v52 = sub_1E3D0();
  if (os_log_type_enabled(oslog, v52))
  {
    os_log_type_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v53 = 136315138;
    sub_16198(0xD000000000000019, 0x80000000000226F0, &v55);
    sub_1E590();
    _os_log_impl(&dword_0, oslog, v52, "%s failed to unwrap waveform preview", v53, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_124CC(void *a1, uint64_t a2)
{
  double v3 = v2;
  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = self;
  sub_16968(&qword_313E8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_20DE0;
  id v7 = [a1 leadingAnchor];
  id v8 = *(void **)((char *)v3
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_containerView);
  id v9 = [v8 leadingAnchor];
  id v10 = [v7 constraintEqualToAnchor:v9];

  *(void *)(v6 + 32) = v10;
  id v11 = [a1 trailingAnchor];
  id v12 = [v8 trailingAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];

  *(void *)(v6 + 40) = v13;
  id v14 = [a1 heightAnchor];
  if (qword_318A0 != -1) {
    swift_once();
  }
  id v15 = [v14 constraintEqualToConstant:*(double *)&qword_318A8];

  *(void *)(v6 + 48) = v15;
  sub_1E3A0();
  sub_17F10(0, &qword_31528);
  Class isa = sub_1E370().super.isa;
  swift_bridgeObjectRelease();
  id v17 = v5;
  [v5 activateConstraints:isa];

  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_20DF0;
  id v19 = [a1 topAnchor];
  if (a2)
  {
    uint64_t v20 = (*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v3)))();
    unint64_t v21 = a2 - 1;
    if (__OFSUB__(a2, 1))
    {
      __break(1u);
    }
    else if ((v20 & 0xC000000000000001) == 0)
    {
      if ((v21 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v21 < *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8)))
      {
        id v22 = *(id *)(v20 + 8 * v21 + 32);
        goto LABEL_9;
      }
      __break(1u);
      goto LABEL_19;
    }
    id v22 = (id)sub_1E5D0();
LABEL_9:
    id v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v20 = (uint64_t)[v23 bottomAnchor];

    if (qword_31880 == -1)
    {
LABEL_10:
      id v24 = [v19 constraintEqualToAnchor:v20 constant:*(double *)&qword_31888];

      goto LABEL_12;
    }
LABEL_19:
    swift_once();
    goto LABEL_10;
  }
  id v25 = [v8 topAnchor];
  id v24 = [v19 constraintEqualToAnchor:v25];

LABEL_12:
  *(void *)(v18 + 32) = v24;
  sub_1E3A0();
  Class v27 = sub_1E370().super.isa;
  swift_bridgeObjectRelease();
  [v17 activateConstraints:v27];
}

void sub_128F8()
{
  uint64_t v1 = v0;
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E2C0();
  sub_169AC(v2, (uint64_t)qword_31848);
  double v3 = sub_1E2A0();
  os_log_type_t v4 = sub_1E3C0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)id v5 = 136315138;
    uint64_t v34 = sub_16198(0xD000000000000018, 0x8000000000022200, &v30);
    sub_1E590();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v6 = (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v1])();
  if (!v6)
  {
    uint64_t v18 = sub_1E2A0();
    os_log_type_t v19 = sub_1E3D0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v34 = sub_16198(0xD000000000000018, 0x8000000000022200, &v30);
      sub_1E590();
      _os_log_impl(&dword_0, v18, v19, "%s failed to unwrap waveform preview", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    goto LABEL_13;
  }
  id v7 = (void *)v6;
  id v8 = v1;
  id v9 = sub_1E2A0();
  os_log_type_t v10 = sub_1E3C0();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)id v11 = 136315138;
    [*(id *)((char *)v8+ OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_containerView) frame];
    uint64_t v30 = v12;
    uint64_t v31 = v13;
    uint64_t v32 = v14;
    uint64_t v33 = v15;
    type metadata accessor for CGRect(0);
    uint64_t v16 = sub_1E350();
    uint64_t v30 = sub_16198(v16, v17, &v34);
    sub_1E590();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v9, v10, "container view frame=%s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v21 = v7;
  uint64_t v18 = sub_1E2A0();
  os_log_type_t v22 = sub_1E3C0();
  if (os_log_type_enabled(v18, v22))
  {
    id v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)id v23 = 136315138;
    [v21 bounds];
    uint64_t v30 = v24;
    uint64_t v31 = v25;
    uint64_t v32 = v26;
    uint64_t v33 = v27;
    type metadata accessor for CGRect(0);
    uint64_t v28 = sub_1E350();
    uint64_t v30 = sub_16198(v28, v29, &v34);
    sub_1E590();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v18, v22, "previewview bounds=%s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

LABEL_13:
    return;
  }
}

void sub_12E98(char a1)
{
  uint64_t v2 = v1;
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for AudioSettingsViewController();
  objc_msgSendSuper2(&v9, "viewWillAppear:", a1 & 1);
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1E2C0();
  sub_169AC(v4, (uint64_t)qword_31848);
  id v5 = sub_1E2A0();
  os_log_type_t v6 = sub_1E3C0();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)id v7 = 136315138;
    sub_16198(0xD000000000000012, 0x8000000000022220, &v8);
    sub_1E590();
    _os_log_impl(&dword_0, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t))((char *)&stru_1A8.offset + (swift_isaMask & *v2)))(1);
  sub_E8B8();
}

id sub_130D4(char a1)
{
  uint64_t v2 = v1;
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1E2C0();
  sub_169AC(v4, (uint64_t)qword_31848);
  id v5 = sub_1E2A0();
  os_log_type_t v6 = sub_1E3C0();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)id v7 = 136315138;
    sub_16198(0xD000000000000015, 0x8000000000022240, &v10);
    sub_1E590();
    _os_log_impl(&dword_0, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(void))((char *)&stru_1A8.offset + (swift_isaMask & *v2)))(0);
  uint64_t v8 = (objc_class *)type metadata accessor for AudioSettingsViewController();
  v11.receiver = v2;
  v11.super_class = v8;
  return objc_msgSendSuper2(&v11, "viewWillDisappear:", a1 & 1);
}

void sub_1330C(unint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1E2C0();
  sub_169AC(v4, (uint64_t)qword_31848);
  id v5 = sub_1E2A0();
  os_log_type_t v6 = sub_1E3C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    *(void *)&long long v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_16198(0xD00000000000001ALL, 0x8000000000022260, (uint64_t *)&v46);
    sub_1E590();
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)&v45[0] = a1;
    sub_1E590();
    _os_log_impl(&dword_0, v5, v6, "%s updating animation state with mode %ld", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v8 = (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v2])();
  if (!v8)
  {
    long long v46 = 0u;
    long long v47 = 0u;
LABEL_16:
    sub_17DA0((uint64_t)&v46, &qword_31410);
LABEL_17:
    uint64_t v18 = sub_1E2A0();
    os_log_type_t v19 = sub_1E3D0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v46 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      *(void *)&v45[0] = sub_16198(0xD00000000000001ALL, 0x8000000000022260, (uint64_t *)&v46);
      sub_1E590();
      _os_log_impl(&dword_0, v18, v19, "%s could not retrieve emitter layer", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    goto LABEL_19;
  }
  objc_super v9 = (void *)v8;
  if (qword_318B0 != -1) {
    swift_once();
  }
  NSString v10 = sub_1E330();
  id v11 = [v9 publishedObjectWithName:v10];

  if (v11)
  {
    sub_1E5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v45, 0, sizeof(v45));
  }
  sub_16B50((uint64_t)v45, (uint64_t)&v46);
  if (!*((void *)&v47 + 1)) {
    goto LABEL_16;
  }
  sub_17F10(0, &qword_31418);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_17;
  }
  id v12 = *(id *)&v45[0];
  uint64_t v13 = sub_1E2A0();
  os_log_type_t v14 = sub_1E3C0();
  unint64_t v44 = a1;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(void *)&long long v46 = v43;
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)&v45[0] = sub_16198(0xD00000000000001ALL, 0x8000000000022260, (uint64_t *)&v46);
    sub_1E590();
    *(_WORD *)(v15 + 12) = 2112;
    *(void *)&v45[0] = v12;
    id v17 = v12;
    sub_1E590();
    void *v16 = v12;

    _os_log_impl(&dword_0, v13, v14, "%s emitterLayer = %@", (uint8_t *)v15, 0x16u);
    sub_16968((uint64_t *)&unk_31700);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v21 = objc_msgSend(v12, "emitterCells", v43);
  if (!v21)
  {
    uint64_t v18 = sub_1E2A0();
    os_log_type_t v30 = sub_1E3D0();
    if (!os_log_type_enabled(v18, v30))
    {

      return;
    }
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)&v45[0] = sub_16198(0xD00000000000001ALL, 0x8000000000022260, (uint64_t *)&v46);
    sub_1E590();
    _os_log_impl(&dword_0, v18, v30, "%s could not retrieve emitter cells", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

LABEL_19:
    return;
  }
  os_log_type_t v22 = v21;
  sub_17F10(0, (unint64_t *)&unk_31420);
  sub_1E380();

  swift_bridgeObjectRetain();
  id v23 = sub_1E2A0();
  os_log_type_t v24 = sub_1E3C0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    *(void *)&long long v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315394;
    *(void *)&v45[0] = sub_16198(0xD00000000000001ALL, 0x8000000000022260, (uint64_t *)&v46);
    sub_1E590();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_1E390();
    id v27 = v12;
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    *(void *)&v45[0] = sub_16198(v26, v29, (uint64_t *)&v46);
    sub_1E590();
    swift_bridgeObjectRelease_n();
    id v12 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v23, v24, "%s emitterCells = %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (v44 > 2)
  {
    CGFloat v33 = 0.03;
    CGFloat v32 = 0.05;
  }
  else
  {
    CGFloat v32 = dbl_21140[v44];
    CGFloat v33 = dbl_21158[v44];
  }
  CGColorRef GenericRGB = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 0.07);
  CGColorRef v35 = CGColorCreateGenericRGB(1.0, 1.0, 1.0, v32);
  CGColorRef v36 = CGColorCreateGenericRGB(1.0, 1.0, 1.0, v33);
  id v37 = GenericRGB;
  NSString v38 = sub_1E330();
  [v12 setValue:v37 forKeyPath:v38];

  v39 = v35;
  NSString v40 = sub_1E330();
  [v12 setValue:v39 forKeyPath:v40];

  unint64_t v41 = v36;
  NSString v42 = sub_1E330();
  [v12 setValue:v41 forKeyPath:v42];
}

void sub_13CF0(char a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v1])();
  if (!v3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
LABEL_19:
    sub_17DA0((uint64_t)&v26, &qword_31410);
    goto LABEL_20;
  }
  uint64_t v4 = (void *)v3;
  if (qword_318B0 != -1) {
    swift_once();
  }
  NSString v5 = sub_1E330();
  id v6 = [v4 publishedObjectWithName:v5];

  if (v6)
  {
    sub_1E5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)os_log_type_t v24 = 0u;
    long long v25 = 0u;
  }
  sub_16B50((uint64_t)v24, (uint64_t)&v26);
  if (!*((void *)&v27 + 1)) {
    goto LABEL_19;
  }
  sub_17F10(0, &qword_31418);
  if (swift_dynamicCast())
  {
    uint64_t v7 = v24[0];
    id v8 = [v24[0] emitterCells];
    if (!v8)
    {
      if (qword_31840 == -1)
      {
LABEL_26:
        uint64_t v18 = sub_1E2C0();
        sub_169AC(v18, (uint64_t)qword_31848);
        os_log_type_t v19 = sub_1E2A0();
        os_log_type_t v20 = sub_1E3D0();
        if (os_log_type_enabled(v19, v20))
        {
          id v21 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v26 = swift_slowAlloc();
          *(_DWORD *)id v21 = 136315138;
          v24[0] = (id)sub_16198(0xD000000000000012, 0x80000000000222E0, (uint64_t *)&v26);
          sub_1E590();
          _os_log_impl(&dword_0, v19, v20, "%s could not retrieve emitter cells", v21, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }

        goto LABEL_24;
      }
LABEL_33:
      swift_once();
      goto LABEL_26;
    }
    objc_super v9 = v8;
    sub_17F10(0, (unint64_t *)&unk_31420);
    unint64_t v10 = sub_1E380();

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_1E650();
      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v11)
      {
LABEL_13:
        if (v11 >= 1)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if ((v10 & 0xC000000000000001) != 0) {
              id v13 = (id)sub_1E5D0();
            }
            else {
              id v13 = *(id *)(v10 + 8 * i + 32);
            }
            os_log_type_t v14 = v13;
            objc_msgSend(v13, "setEnabled:", a1 & 1, v24[0], v24[1], v25);
          }
          goto LABEL_30;
        }
        __break(1u);
        goto LABEL_33;
      }
    }
LABEL_30:
    swift_bridgeObjectRelease_n();
    os_log_type_t v22 = *(void **)((char *)v1
                   + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_displayLink);
    if (v22)
    {
      id v23 = v22;
      [v23 setPaused:(a1 & 1) == 0];
    }
    goto LABEL_24;
  }
LABEL_20:
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1E2C0();
  sub_169AC(v15, (uint64_t)qword_31848);
  uint64_t v7 = sub_1E2A0();
  os_log_type_t v16 = sub_1E3D0();
  if (os_log_type_enabled(v7, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v26 = swift_slowAlloc();
    *(_DWORD *)id v17 = 136315138;
    v24[0] = (id)sub_16198(0xD000000000000012, 0x80000000000222E0, (uint64_t *)&v26);
    sub_1E590();
    _os_log_impl(&dword_0, v7, v16, "%s could not retrieve emitter layer", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
LABEL_24:
}

id sub_14298(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_1E330();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id sub_14310(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_previewView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_displayLink] = 0;
  uint64_t v6 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_containerView;
  id v7 = objc_allocWithZone((Class)UIView);
  id v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  uint64_t v9 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_standardButton;
  if (qword_318C8 != -1) {
    swift_once();
  }
  v23[18] = (objc_super)xmmword_31D60;
  v23[19] = (objc_super)unk_31D70;
  v23[20] = (objc_super)xmmword_31D80;
  v23[16] = (objc_super)xmmword_31D40;
  v23[17] = (objc_super)unk_31D50;
  sub_D3E0();
  *(void *)&v8[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_voiceIsolationButton;
  if (qword_318D0 != -1) {
    swift_once();
  }
  v23[13] = (objc_super)xmmword_31DB0;
  v23[14] = (objc_super)unk_31DC0;
  v23[15] = (objc_super)xmmword_31DD0;
  v23[11] = (objc_super)xmmword_31D90;
  v23[12] = (objc_super)unk_31DA0;
  sub_D3E0();
  *(void *)&v8[v11] = v12;
  uint64_t v13 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_wideSpectrumButton;
  if (qword_318D8 != -1) {
    swift_once();
  }
  v23[8] = (objc_super)xmmword_31E00;
  v23[9] = (objc_super)unk_31E10;
  v23[10] = (objc_super)xmmword_31E20;
  v23[6] = (objc_super)xmmword_31DE0;
  v23[7] = (objc_super)unk_31DF0;
  sub_D3E0();
  *(void *)&v8[v13] = v14;
  uint64_t v15 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_autoButton;
  if (qword_318E0 != -1) {
    swift_once();
  }
  v23[3] = (objc_super)xmmword_31E50;
  v23[4] = (objc_super)unk_31E60;
  v23[5] = (objc_super)xmmword_31E70;
  v23[1] = (objc_super)xmmword_31E30;
  v23[2] = (objc_super)unk_31E40;
  sub_D3E0();
  *(void *)&v8[v15] = v16;
  uint64_t v17 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_unavailableLabel;
  *(void *)&v8[v17] = sub_D8D8();
  v8[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_shouldLoadFromSensor] = 0;
  *(void *)&v8[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_contentModuleContext] = 0;
  uint64_t v18 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_audioEffectsManager;
  *(void *)&v8[v18] = [objc_allocWithZone((Class)AudioEffectsManager) init];
  *(void *)&v8[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_compactContinuousCornerRadius] = 0;
  uint64_t v19 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_platterStrokeVisualStylingProvider;
  *(void *)&v8[v19] = [objc_allocWithZone((Class)RPCCMTVisualStylingProvider) init];

  if (a2)
  {
    NSString v20 = sub_1E330();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v20 = 0;
  }
  v23[0].receiver = v8;
  v23[0].super_class = (Class)type metadata accessor for AudioSettingsViewController();
  id v21 = [(objc_super *)v23 initWithNibName:v20 bundle:a3];

  return v21;
}

id sub_14668(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_previewView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_displayLink] = 0;
  uint64_t v3 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_containerView;
  id v4 = objc_allocWithZone((Class)UIView);
  NSString v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_standardButton;
  if (qword_318C8 != -1) {
    swift_once();
  }
  v19[18] = (objc_super)xmmword_31D60;
  v19[19] = (objc_super)unk_31D70;
  v19[20] = (objc_super)xmmword_31D80;
  v19[16] = (objc_super)xmmword_31D40;
  v19[17] = (objc_super)unk_31D50;
  sub_D3E0();
  *(void *)&v5[v6] = v7;
  uint64_t v8 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_voiceIsolationButton;
  if (qword_318D0 != -1) {
    swift_once();
  }
  v19[13] = (objc_super)xmmword_31DB0;
  v19[14] = (objc_super)unk_31DC0;
  v19[15] = (objc_super)xmmword_31DD0;
  v19[11] = (objc_super)xmmword_31D90;
  v19[12] = (objc_super)unk_31DA0;
  sub_D3E0();
  *(void *)&v5[v8] = v9;
  uint64_t v10 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_wideSpectrumButton;
  if (qword_318D8 != -1) {
    swift_once();
  }
  v19[8] = (objc_super)xmmword_31E00;
  v19[9] = (objc_super)unk_31E10;
  v19[10] = (objc_super)xmmword_31E20;
  v19[6] = (objc_super)xmmword_31DE0;
  v19[7] = (objc_super)unk_31DF0;
  sub_D3E0();
  *(void *)&v5[v10] = v11;
  uint64_t v12 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_autoButton;
  if (qword_318E0 != -1) {
    swift_once();
  }
  v19[3] = (objc_super)xmmword_31E50;
  v19[4] = (objc_super)unk_31E60;
  v19[5] = (objc_super)xmmword_31E70;
  v19[1] = (objc_super)xmmword_31E30;
  v19[2] = (objc_super)unk_31E40;
  sub_D3E0();
  *(void *)&v5[v12] = v13;
  uint64_t v14 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_unavailableLabel;
  *(void *)&v5[v14] = sub_D8D8();
  v5[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_shouldLoadFromSensor] = 0;
  *(void *)&v5[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_contentModuleContext] = 0;
  uint64_t v15 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_audioEffectsManager;
  *(void *)&v5[v15] = [objc_allocWithZone((Class)AudioEffectsManager) init];
  *(void *)&v5[OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_compactContinuousCornerRadius] = 0;
  uint64_t v16 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_platterStrokeVisualStylingProvider;
  *(void *)&v5[v16] = [objc_allocWithZone((Class)RPCCMTVisualStylingProvider) init];

  v19[0].receiver = v5;
  v19[0].super_class = (Class)type metadata accessor for AudioSettingsViewController();
  id v17 = [(objc_super *)v19 initWithCoder:a1];

  return v17;
}

id sub_1494C()
{
  return sub_14964(type metadata accessor for AudioSettingsViewController);
}

id sub_14964(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_14A78()
{
  uint64_t v1 = v0;
  if (qword_31840 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E2C0();
  sub_169AC(v2, (uint64_t)qword_31848);
  objc_super v3 = sub_1E2A0();
  os_log_type_t v4 = sub_1E3C0();
  if (os_log_type_enabled(v3, v4))
  {
    NSString v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)NSString v5 = 136315138;
    sub_16198(0xD000000000000012, 0x8000000000022300, &v8);
    sub_1E590();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t))&stru_1A8.segname[(swift_isaMask & *v1) - 8])(v6);
}

double sub_14C80()
{
  uint64_t v0 = self;
  NSString v1 = sub_1E330();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  uint64_t v3 = sub_1E340();
  uint64_t v5 = v4;

  id v6 = [self systemBlueColor];
  LODWORD(xmmword_31D40) = 66048;
  *((void *)&xmmword_31D40 + 1) = v3;
  unk_31D50 = v5;
  qword_31D58 = 6515053;
  *(void *)&xmmword_31D60 = 0xE300000000000000;
  *((void *)&xmmword_31D60 + 1) = 6515053;
  unk_31D70 = 0xE300000000000000;
  qword_31D78 = (uint64_t)v6;
  double result = 23.0;
  xmmword_31D80 = xmmword_20E00;
  return result;
}

uint64_t sub_14D68@<X0>(uint64_t a1@<X8>)
{
  return sub_150C8(&qword_318C8, (uint64_t)&xmmword_31D40, a1);
}

double sub_14D8C()
{
  uint64_t v0 = self;
  NSString v1 = sub_1E330();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  uint64_t v3 = sub_1E340();
  uint64_t v5 = v4;

  id v6 = [self systemBlueColor];
  LODWORD(xmmword_31D90) = 66050;
  *((void *)&xmmword_31D90 + 1) = v3;
  unk_31DA0 = v5;
  qword_31DA8 = 0xD000000000000012;
  *(void *)&xmmword_31DB0 = 0x8000000000022A10;
  *((void *)&xmmword_31DB0 + 1) = 0xD000000000000012;
  unk_31DC0 = 0x8000000000022A10;
  qword_31DC8 = (uint64_t)v6;
  double result = 27.0;
  xmmword_31DD0 = xmmword_20E10;
  return result;
}

uint64_t sub_14E7C@<X0>(uint64_t a1@<X8>)
{
  return sub_150C8(&qword_318D0, (uint64_t)&xmmword_31D90, a1);
}

double sub_14EA0()
{
  uint64_t v0 = self;
  NSString v1 = sub_1E330();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  uint64_t v3 = sub_1E340();
  uint64_t v5 = v4;

  id v6 = [self systemBlueColor];
  LODWORD(xmmword_31DE0) = 66049;
  *((void *)&xmmword_31DE0 + 1) = v3;
  unk_31DF0 = v5;
  qword_31DF8 = 0xD000000000000010;
  *(void *)&xmmword_31E00 = 0x80000000000229D0;
  *((void *)&xmmword_31E00 + 1) = 0xD000000000000010;
  unk_31E10 = 0x80000000000229D0;
  qword_31E18 = (uint64_t)v6;
  double result = 32.0;
  xmmword_31E20 = xmmword_20E20;
  return result;
}

uint64_t sub_14F90@<X0>(uint64_t a1@<X8>)
{
  return sub_150C8(&qword_318D8, (uint64_t)&xmmword_31DE0, a1);
}

double sub_14FB4()
{
  uint64_t v0 = self;
  NSString v1 = sub_1E330();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  uint64_t v3 = sub_1E340();
  uint64_t v5 = v4;

  id v6 = [self systemBlueColor];
  LODWORD(xmmword_31E30) = 66051;
  *((void *)&xmmword_31E30 + 1) = v3;
  unk_31E40 = v5;
  qword_31E48 = 0x6D726F6665766177;
  *(void *)&xmmword_31E50 = 0xE800000000000000;
  *((void *)&xmmword_31E50 + 1) = 0x6D726F6665766177;
  unk_31E60 = 0xE800000000000000;
  qword_31E68 = (uint64_t)v6;
  double result = 23.0;
  xmmword_31E70 = xmmword_20E00;
  return result;
}

uint64_t sub_150A4@<X0>(uint64_t a1@<X8>)
{
  return sub_150C8(&qword_318E0, (uint64_t)&xmmword_31E30, a1);
}

uint64_t sub_150C8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }

  return sub_17418(a2, a3);
}

void sub_1511C()
{
  qword_318F0 = 0x4031000000000000;
}

void sub_1512C()
{
  qword_31900 = 0x402A000000000000;
}

void sub_1513C()
{
  qword_31910 = 0x4039000000000000;
}

void sub_1514C()
{
  qword_31920 = 0x4024000000000000;
}

void *sub_1515C(int a1)
{
  id v2 = v1;
  int v61 = a1;
  uint64_t v3 = sub_16968(&qword_31430);
  __chkstk_darwin(v3 - 8);
  id v60 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_16968(&qword_31438);
  __chkstk_darwin(v5 - 8);
  id v59 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_16968(&qword_31440);
  __chkstk_darwin(v7 - 8);
  os_log_type_t v53 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1E430();
  uint64_t v9 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E460();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1E540();
  uint64_t v57 = *(void *)(v16 - 8);
  uint64_t v58 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  os_log_type_t v52 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  NSString v20 = (char *)&v50 - v19;
  uint64_t v21 = sub_1E240();
  uint64_t v55 = *(void *)(v21 - 8);
  uint64_t v56 = v21;
  __chkstk_darwin(v21);
  id v23 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E230();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  os_log_type_t v24 = self;
  if (qword_318E8 != -1) {
    swift_once();
  }
  aBlock[0] = [v24 systemFontOfSize:*(double *)&qword_318F0];
  sub_1742C();
  uint64_t v54 = v23;
  sub_1E220();
  sub_1E530();
  swift_bridgeObjectRetain();
  sub_1E520();
  swift_bridgeObjectRetain();
  NSString v25 = sub_1E330();
  swift_bridgeObjectRelease();
  id v26 = [self systemImageNamed:v25];

  sub_1E500();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for UIButton.Configuration.TitleAlignment.leading(_:), v12);
  sub_1E480();
  sub_1E470();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for UIButton.Configuration.CornerStyle.capsule(_:), v51);
  sub_1E440();
  if (qword_31908 != -1) {
    swift_once();
  }
  sub_1E490();
  if (qword_31918 != -1) {
    swift_once();
  }
  sub_1E450();
  if (qword_318F8 != -1) {
    swift_once();
  }
  id v27 = [self configurationWithPointSize:*(double *)&qword_31900];
  sub_1E420();
  sub_17F10(0, &qword_31450);
  uint64_t v29 = v57;
  uint64_t v28 = v58;
  os_log_type_t v30 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  v30(v52, v20, v58);
  uint64_t v31 = (void *)sub_1E550();
  CGFloat v32 = (_OWORD *)swift_allocObject();
  long long v33 = *((_OWORD *)v2 + 3);
  v32[3] = *((_OWORD *)v2 + 2);
  v32[4] = v33;
  v32[5] = *((_OWORD *)v2 + 4);
  long long v34 = *((_OWORD *)v2 + 1);
  v32[1] = *(_OWORD *)v2;
  v32[2] = v34;
  aBlock[4] = sub_174FC;
  aBlock[5] = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_15D90;
  aBlock[3] = &unk_28D48;
  CGColorRef v35 = _Block_copy(aBlock);
  sub_1751C((uint64_t)v2);
  swift_release();
  [v31 setConfigurationUpdateHandler:v35];
  _Block_release(v35);
  uint64_t v36 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v36;
  long long v38 = *(_OWORD *)v2;
  *(_OWORD *)(v37 + 40) = *((_OWORD *)v2 + 1);
  long long v39 = *((_OWORD *)v2 + 3);
  *(_OWORD *)(v37 + 56) = *((_OWORD *)v2 + 2);
  *(_OWORD *)(v37 + 72) = v39;
  *(_OWORD *)(v37 + 88) = *((_OWORD *)v2 + 4);
  *(_OWORD *)(v37 + 24) = v38;
  sub_1751C((uint64_t)v2);
  NSString v40 = v53;
  sub_1E300();
  uint64_t v41 = sub_1E2F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 0, 1, v41);
  sub_1E4E0();
  uint64_t v42 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v42;
  long long v44 = *(_OWORD *)v2;
  *(_OWORD *)(v43 + 40) = *((_OWORD *)v2 + 1);
  long long v45 = *((_OWORD *)v2 + 3);
  *(_OWORD *)(v43 + 56) = *((_OWORD *)v2 + 2);
  *(_OWORD *)(v43 + 72) = v45;
  *(_OWORD *)(v43 + 88) = *((_OWORD *)v2 + 4);
  *(_OWORD *)(v43 + 24) = v44;
  sub_1751C((uint64_t)v2);
  long long v46 = v59;
  sub_1E2E0();
  uint64_t v47 = sub_1E2D0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v46, 0, 1, v47);
  sub_1E4D0();
  uint64_t v48 = v60;
  v30(v60, v20, v28);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v48, 0, 1, v28);
  sub_1E570();
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v31 setContentHorizontalAlignment:4];
  [v31 setSelected:v61 & 1];
  [v31 setTag:*v2];
  (*(void (**)(char *, uint64_t))(v29 + 8))(v20, v28);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
  return v31;
}

uint64_t sub_15A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_160AC(a1, a2, a3, &qword_31540);
}

uint64_t sub_15AA0(uint64_t a1, uint64_t a2)
{
  return sub_16110(a1, a2, &qword_31540);
}

void sub_15AAC()
{
}

void sub_15AD4()
{
}

uint64_t sub_15AF0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_16968(&qword_31430);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = sub_1E540();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E560();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1E530();
    sub_17DA0((uint64_t)v9, &qword_31430);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
  }
  if (([a1 isHighlighted] & 1) != 0 || objc_msgSend(a1, "isSelected"))
  {
    id v14 = *(id *)(a2 + 56);
    sub_1E4C0();
    uint64_t v15 = self;
    uint64_t v16 = &selRef_systemWhiteColor;
  }
  else
  {
    uint64_t v15 = self;
    id v17 = [v15 systemWhiteColor];
    sub_1E4C0();
    uint64_t v16 = &selRef_clearColor;
  }
  id v18 = [v15 *v16];
  sub_1E4B0();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v13, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
  sub_1E570();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_15D90(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_15DF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1E240();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  if (!Strong) {
    return v11(a3, a1, v6);
  }
  uint64_t v12 = (void *)Strong;
  v11((uint64_t)v9, a1, v6);
  uint64_t KeyPath = swift_getKeyPath();
  *(&v18 - 2) = (id)__chkstk_darwin(KeyPath);
  swift_getKeyPath();
  id v14 = self;
  if (qword_318E8 != -1) {
    swift_once();
  }
  id v18 = [v14 systemFontOfSize:*(double *)&qword_318F0];
  sub_1742C();
  sub_1E220();
  uint64_t v15 = swift_getKeyPath();
  *(&v18 - 2) = (id)__chkstk_darwin(v15);
  swift_getKeyPath();
  if ([v12 isSelected]) {
    id v16 = *(id *)(a2 + 56);
  }
  else {
    id v16 = [self systemWhiteColor];
  }
  id v18 = v16;
  sub_17D40();
  sub_1E220();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
}

uint64_t sub_160A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_160AC(a1, a2, a3, &qword_31538);
}

uint64_t sub_160AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_1E320() & 1;
}

uint64_t sub_16104(uint64_t a1, uint64_t a2)
{
  return sub_16110(a1, a2, &qword_31538);
}

uint64_t sub_16110(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1E310();
}

void sub_16154()
{
}

void sub_1617C()
{
}

uint64_t sub_16198(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1626C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_17E4C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_17E4C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_17DFC((uint64_t)v12);
  return v7;
}

uint64_t sub_1626C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1E5A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_16428(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1E5E0();
  if (!v8)
  {
    sub_1E630();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1E670();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_16428(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_164C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_166A0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_166A0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_164C0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_16638(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1E5C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1E630();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1E360();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1E670();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1E630();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_16638(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_16968(&qword_31560);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_166A0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_16968(&qword_31560);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1E670();
  __break(1u);
  return result;
}

unint64_t sub_167F0(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t type metadata accessor for AudioSettingsView()
{
  return self;
}

BOOL sub_16824(double *a1, double *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2
    || !sub_18874(*((unsigned char *)a1 + 1), *((unsigned char *)a2 + 1))
    || ((*((unsigned __int8 *)a1 + 2) ^ *((unsigned __int8 *)a2 + 2)) & 1) != 0
    || ((*((unsigned __int8 *)a1 + 3) ^ *((unsigned __int8 *)a2 + 3)) & 1) != 0)
  {
    return 0;
  }
  if (*((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2)
    || (v5 = sub_1E680(), BOOL result = 0, (v5 & 1) != 0))
  {
    if (*((void *)a1 + 3) == *((void *)a2 + 3) && *((void *)a1 + 4) == *((void *)a2 + 4)
      || (v6 = sub_1E680(), BOOL result = 0, (v6 & 1) != 0))
    {
      if (*((void *)a1 + 5) == *((void *)a2 + 5) && *((void *)a1 + 6) == *((void *)a2 + 6)
        || (v7 = sub_1E680(), BOOL result = 0, (v7 & 1) != 0))
      {
        sub_17F10(0, &qword_31568);
        if ((sub_1E410() & 1) != 0 && a1[8] == a2[8]) {
          return a1[9] == a2[9];
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_16968(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_169AC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for AudioSettingsViewController()
{
  return self;
}

void *sub_16A08(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1E650())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)sub_1E5D0() : *(id *)(a1 + 8 * v5);
      char v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = [v6 tag];
      if (v9 == [a2 tag])
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return 0;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_16B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_16968(&qword_31410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_16BB8()
{
  uint64_t v37 = sub_1E280();
  uint64_t v1 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  unint64_t v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_16968(&qword_31548);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20E30;
  *(void *)(inited + 32) = &off_28C58;
  *(void *)(inited + 40) = &off_28C90;
  *(void *)(inited + 48) = &off_28CC8;
  uint64_t v5 = (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v0])();
  if (!v5)
  {
    long long v39 = 0u;
    long long v40 = 0u;
LABEL_15:
    swift_bridgeObjectRelease();
    sub_17DA0((uint64_t)&v39, &qword_31410);
    goto LABEL_17;
  }
  id v6 = (void *)v5;
  if (qword_318B0 != -1) {
    swift_once();
  }
  NSString v7 = sub_1E330();
  id v8 = [v6 publishedObjectWithName:v7];

  if (v8)
  {
    sub_1E5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v38, 0, sizeof(v38));
  }
  sub_16B50((uint64_t)v38, (uint64_t)&v39);
  if (!*((void *)&v40 + 1)) {
    goto LABEL_15;
  }
  sub_17F10(0, &qword_31418);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    if (qword_31840 == -1) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
  id v36 = *(id *)&v38[0];
  id v9 = [*(id *)&v38[0] emitterCells];
  if (v9)
  {
    uint64_t v10 = v9;
    sub_17F10(0, (unint64_t *)&unk_31420);
    uint64_t v11 = sub_1E380();

    unint64_t v35 = v11 & 0xC000000000000001;
    if ((v11 & 0xC000000000000001) != 0 || *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)) >= 3uLL)
    {
      uint64_t v34 = inited + 32;
      if (*(void *)(inited + 16) >= 3uLL)
      {
        uint64_t v12 = (void (**)(char *, uint64_t))(v1 + 8);
        uint64_t v13 = 4;
        while (1)
        {
          if (v35)
          {
            id v26 = (void *)sub_1E5D0();
            id v27 = (id)sub_1E5D0();
          }
          else
          {
            id v27 = *(id *)(v11 + 8 * v13);
            id v26 = v27;
          }
          id v28 = objc_msgSend(v27, "emitterBehaviors", v34);

          if (v28)
          {
            sub_17F10(0, &qword_31558);
            uint64_t v29 = sub_1E380();
          }
          else
          {
            uint64_t v29 = 0;
          }
          uint64_t v30 = *(void *)(inited + 8 * v13);
          swift_bridgeObjectRetain();
          sub_1E270();
          sub_1E260();
          double v32 = v31;
          (*v12)(v3, v37);
          unint64_t v33 = *(void *)(v30 + 16);
          if (!v33) {
            break;
          }
          sin(v32 * *(double *)(v30 + 32));
          if (v33 == 1) {
            goto LABEL_43;
          }
          if (v33 < 3) {
            goto LABEL_44;
          }
          swift_bridgeObjectRelease();
          if (v29)
          {
            if ((v29 & 0xC000000000000001) != 0)
            {
              id v21 = (id)sub_1E5D0();
            }
            else
            {
              if (*(void *)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFFF8)) < 2uLL) {
                goto LABEL_45;
              }
              id v21 = *(id *)(v29 + 40);
            }
            uint64_t v22 = v21;
            swift_bridgeObjectRelease();
            Class isa = sub_1E290().super.super.isa;
            NSString v24 = sub_1E330();
            [v22 setValue:isa forKeyPath:v24];
          }
          NSString v25 = sub_1E330();
          [v36 reloadValueForKeyPath:v25];

          [v26 setEmitterBehaviors:v28];
          if (++v13 == 7)
          {

            swift_bridgeObjectRelease();
            swift_setDeallocating();
            sub_16968(&qword_31550);
            swift_arrayDestroy();
            return;
          }
        }
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        swift_once();
LABEL_18:
        uint64_t v14 = sub_1E2C0();
        sub_169AC(v14, (uint64_t)qword_31848);
        uint64_t v15 = sub_1E2A0();
        os_log_type_t v16 = sub_1E3D0();
        if (os_log_type_enabled(v15, v16))
        {
          id v17 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v39 = swift_slowAlloc();
          *(_DWORD *)id v17 = 136315138;
          *(void *)&v38[0] = sub_16198(0xD000000000000015, 0x80000000000226D0, (uint64_t *)&v39);
          sub_1E590();
          _os_log_impl(&dword_0, v15, v16, "%s could not retrieve emitter layer", v17, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        goto LABEL_20;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    swift_setDeallocating();
    sub_16968(&qword_31550);
    swift_arrayDestroy();
    if (qword_31840 == -1) {
      goto LABEL_22;
    }
  }
  swift_once();
LABEL_22:
  uint64_t v18 = sub_1E2C0();
  sub_169AC(v18, (uint64_t)qword_31848);
  uint64_t v15 = sub_1E2A0();
  os_log_type_t v19 = sub_1E3D0();
  if (os_log_type_enabled(v15, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)&v38[0] = sub_16198(0xD000000000000015, 0x80000000000226D0, (uint64_t *)&v39);
    sub_1E590();
    _os_log_impl(&dword_0, v15, v19, "%s could not retrieve emitter cells", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

LABEL_20:
    return;
  }
}

uint64_t sub_17418(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for AudioSettingsViewController.EffectType(a2, a1);
}

unint64_t sub_1742C()
{
  unint64_t result = qword_31448;
  if (!qword_31448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31448);
  }
  return result;
}

uint64_t sub_17480()
{
  return 8;
}

uint64_t sub_1748C()
{
  return swift_release();
}

uint64_t sub_17494(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_174A0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_174AC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_174FC(void *a1)
{
  return sub_15AF0(a1, v1 + 16);
}

uint64_t sub_17504(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_17514()
{
  return swift_release();
}

uint64_t sub_1751C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return a1;
}

uint64_t sub_1756C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_175A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_15DF8(a1, v2 + 24, a2);
}

uint64_t sub_175B8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 104, 7);
}

id sub_17610()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    if ([Strong isSelected])
    {

      id v3 = *(void **)(v0 + 80);
      return v3;
    }
    else
    {
      id v6 = [self systemWhiteColor];

      return v6;
    }
  }
  else
  {
    id v5 = [self labelColor];
    return v5;
  }
}

unint64_t sub_17704()
{
  unint64_t result = qword_31458;
  if (!qword_31458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31458);
  }
  return result;
}

unint64_t sub_1775C()
{
  unint64_t result = qword_31460;
  if (!qword_31460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31460);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for MicMode(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MicMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MicMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1791CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_17944(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1794C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MicMode()
{
  return &type metadata for MicMode;
}

uint64_t initializeBufferWithCopyOfBuffer for AudioSettingsViewController.EffectType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for AudioSettingsViewController.EffectType(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 56);
}

uint64_t initializeWithCopy for AudioSettingsViewController.EffectType(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  unsigned int v6 = *(void **)(a2 + 56);
  *(void *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for AudioSettingsViewController.EffectType(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 56);
  uint64_t v5 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v4;
  id v6 = v4;

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

__n128 initializeWithTake for AudioSettingsViewController.EffectType(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for AudioSettingsViewController.EffectType(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);

  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioSettingsViewController.EffectType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSettingsViewController.EffectType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSettingsViewController.EffectType()
{
  return &type metadata for AudioSettingsViewController.EffectType;
}

__n128 sub_17C7C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_17C88(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_17CA8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

__n128 sub_17CE4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_17CF0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_17D10(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

unint64_t sub_17D40()
{
  unint64_t result = qword_31530;
  if (!qword_31530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31530);
  }
  return result;
}

uint64_t sub_17D94()
{
  return 8;
}

uint64_t sub_17DA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_16968(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_17DFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_17E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_17EAC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_17F10(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_17F60(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_17FA8()
{
}

void sub_17FDC()
{
  sub_186AC();
  uint64_t v1 = v0;
  oslog = sub_1E580();
  os_log_type_t v2 = sub_1E3E0();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v10 = v4;
    uint64_t v5 = (id *)&v1[OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext];
    swift_beginAccess();
    id v6 = *v5;
    sub_16968(&qword_31678);
    uint64_t v7 = sub_1E350();
    sub_16198(v7, v8, &v10);
    sub_1E590();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, oslog, v2, "set content module context: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void *sub_181A8()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  os_log_type_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_181F8(void *a1)
{
  id v3 = (void **)(v1
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  sub_17FDC();
}

void (*sub_18264(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_182C4;
}

void sub_182C4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_17FDC();
  }
}

void sub_182F8(void *a1)
{
  id v3 = (void **)(v1
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  sub_17FDC();
}

void *sub_183F0(void *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for AudioSettingsViewController();
  uint64_t v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v5 = v4;
  if (!a1)
  {
    unint64_t v8 = v4;
    goto LABEL_5;
  }
  id v6 = v4;
  if ([a1 environment])
  {
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = 1;
LABEL_6:
  (*(void (**)(uint64_t))((char *)&stru_B8.reloff + (swift_isaMask & *v5)))(v7);
  id v9 = (void **)(v2
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  uint64_t v10 = *v9;
  uint64_t v11 = *(void (**)(void *))&stru_108.sectname[swift_isaMask & *v5];
  id v12 = v10;
  v11(v10);

  return v5;
}

id sub_1857C()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_185B0()
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "init");
}

id sub_18640()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AudioSettingsControlCenterModule()
{
  return self;
}

unint64_t sub_186AC()
{
  unint64_t result = qword_31670;
  if (!qword_31670)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_31670);
  }
  return result;
}

uint64_t sub_186EC()
{
  uint64_t v0 = sub_1E2C0();
  sub_17EAC(v0, qword_31BC8);
  sub_169AC(v0, (uint64_t)qword_31BC8);
  return sub_1E2B0();
}

void sub_18770()
{
  qword_31E80 = 0x6554746365666665;
  *(void *)algn_31E88 = 0xEA00000000007478;
}

uint64_t *sub_18798()
{
  if (qword_31BE0 != -1) {
    swift_once();
  }
  return &qword_31E80;
}

void sub_187E4()
{
  qword_31E90 = 0x6C47746365666665;
  *(void *)algn_31E98 = 0xEB00000000687079;
}

uint64_t *sub_18810()
{
  if (qword_31BE8 != -1) {
    swift_once();
  }
  return &qword_31E90;
}

void *sub_1885C()
{
  return &unk_291B0;
}

void *sub_18868()
{
  return &unk_291C0;
}

BOOL sub_18874(char a1, char a2)
{
  return a1 == a2;
}

void sub_18884(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_188AC(unsigned __int8 a1)
{
  return sub_1E6B0();
}

void sub_188F4()
{
  qword_31EA0 = 0x402A000000000000;
}

uint64_t *sub_18904()
{
  if (qword_31BF0 != -1) {
    swift_once();
  }
  return &qword_31EA0;
}

double sub_18950()
{
  return sub_18E48(&qword_31BF0, (uint64_t)&qword_31EA0);
}

void sub_18974()
{
  qword_31EA8 = 0x4034000000000000;
}

uint64_t *sub_18984()
{
  if (qword_31BF8 != -1) {
    swift_once();
  }
  return &qword_31EA8;
}

double sub_189D0()
{
  return sub_18E48(&qword_31BF8, (uint64_t)&qword_31EA8);
}

void sub_189F4()
{
  qword_31EB0 = 0x4020000000000000;
}

uint64_t *sub_18A04()
{
  if (qword_31C00 != -1) {
    swift_once();
  }
  return &qword_31EB0;
}

double sub_18A50()
{
  return sub_18E48(&qword_31C00, (uint64_t)&qword_31EB0);
}

void *sub_18A74()
{
  return &unk_21230;
}

double sub_18A80()
{
  return 40.0;
}

void *sub_18A8C()
{
  return &unk_291D0;
}

unint64_t sub_18A98()
{
  return 0xD000000000000018;
}

void *sub_18AB4()
{
  return &unk_21238;
}

double sub_18AC0()
{
  return 0.3;
}

void *sub_18AD0()
{
  return &unk_21240;
}

double sub_18ADC()
{
  return 26.0;
}

void *sub_18AE4()
{
  return &unk_21248;
}

double sub_18AF0()
{
  return 1.57079633;
}

void *sub_18AFC()
{
  return &unk_21250;
}

double sub_18B08()
{
  double result = 8.0;
  xmmword_31EC0 = xmmword_211F0;
  *(_OWORD *)&qword_31ED0 = xmmword_21200;
  return result;
}

long long *sub_18B28()
{
  if (qword_31C08 != -1) {
    swift_once();
  }
  return &xmmword_31EC0;
}

double sub_18B74()
{
  if (qword_31C08 != -1) {
    swift_once();
  }
  return *(double *)&xmmword_31EC0;
}

void *sub_18BC8()
{
  return &unk_21258;
}

double sub_18BD4()
{
  return 8.0;
}

void *sub_18BDC()
{
  return &unk_21260;
}

double sub_18BE8()
{
  return 1.5;
}

double sub_18BF0()
{
  if (qword_31C08 != -1) {
    swift_once();
  }
  double result = *((double *)&xmmword_31EC0 + 1) + -2.0;
  *(double *)&qword_31EE0 = *((double *)&xmmword_31EC0 + 1) + -2.0;
  return result;
}

uint64_t *sub_18C4C()
{
  if (qword_31C10 != -1) {
    swift_once();
  }
  return &qword_31EE0;
}

double sub_18C98()
{
  return sub_18E48(&qword_31C10, (uint64_t)&qword_31EE0);
}

void *sub_18CBC()
{
  return &unk_21268;
}

void sub_18CC8()
{
  qword_31EE8 = 0x402E000000000000;
}

uint64_t *sub_18CD8()
{
  if (qword_31C18 != -1) {
    swift_once();
  }
  return &qword_31EE8;
}

double sub_18D24()
{
  return sub_18E48(&qword_31C18, (uint64_t)&qword_31EE8);
}

void sub_18D48()
{
  qword_31EF0 = 0x4024000000000000;
}

uint64_t *sub_18D58()
{
  if (qword_31C20 != -1) {
    swift_once();
  }
  return &qword_31EF0;
}

double sub_18DA4()
{
  return sub_18E48(&qword_31C20, (uint64_t)&qword_31EF0);
}

void sub_18DC8()
{
  qword_31EF8 = 0x402A000000000000;
}

uint64_t *sub_18DD8()
{
  if (qword_31C28 != -1) {
    swift_once();
  }
  return &qword_31EF8;
}

double sub_18E24()
{
  return sub_18E48(qword_31C28, (uint64_t)&qword_31EF8);
}

double sub_18E48(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

void *sub_18E84()
{
  return &unk_21270;
}

double sub_18E90()
{
  return 23.0;
}

void *sub_18E98()
{
  return &unk_21278;
}

double sub_18EA4()
{
  return 18.0;
}

void *sub_18EAC()
{
  return &unk_21280;
}

double sub_18EB8()
{
  return 0.9;
}

void *sub_18EC4()
{
  return &unk_21288;
}

id sub_18ED4()
{
  uint64_t v0 = sub_1E460();
  uint64_t v1 = *(void *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  objc_super v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E540();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  NSString v11 = sub_1E330();
  id v12 = [self _systemImageNamed:v11];

  sub_1E510();
  id v13 = v12;
  sub_1E500();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for UIButton.Configuration.TitleAlignment.leading(_:), v0);
  sub_1E480();
  sub_1E4A0();
  sub_1E470();
  if (qword_31BF8 != -1) {
    swift_once();
  }
  sub_1E490();
  if (qword_31C00 != -1) {
    swift_once();
  }
  sub_1E450();
  if (qword_31BF0 != -1) {
    swift_once();
  }
  id v14 = [self configurationWithPointSize:*(double *)&qword_31EA0];
  sub_1E420();
  sub_17F10(0, &qword_31450);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  id v15 = (id)sub_1E550();
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v16) = 1144750080;
  [v15 setContentHuggingPriority:0 forAxis:v16];
  [v15 setContentHorizontalAlignment:1];
  id v17 = self;
  id v18 = v15;
  id v19 = [v17 clearColor];
  [v18 setBackgroundColor:v19];

  [v18 setContentMode:7];
  [v18 setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
  id v20 = [v18 imageView];

  if (v20)
  {
    [v20 setMaximumContentSizeCategory:UIContentSizeCategoryMedium];

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return v18;
}

id sub_1933C()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonGlyph);
}

void sub_19350()
{
  uint64_t v0 = sub_1E540();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v22 - v5;
  NSString v7 = sub_1E330();
  id v8 = [self _systemImageNamed:v7];

  if (v8)
  {
    id v9 = [v8 imageWithRenderingMode:2];

    id v10 = v9;
    sub_1E510();
    sub_1E500();
    sub_17F10(0, &qword_31450);
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
    id v11 = (id)sub_1E550();
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1144750080;
    [v11 setContentHuggingPriority:0 forAxis:v12];
    id v13 = [self systemLightGrayColor];
    [v11 setTintColor:v13];

    [v11 setHidden:1];
    [v11 setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
    id v14 = [v11 imageView];
    if (v14)
    {
      id v15 = v14;
      [v14 setMaximumContentSizeCategory:UIContentSizeCategoryMedium];
    }
    unsigned int v16 = [v11 _shouldReverseLayoutDirection];
    double v17 = -1.57079633;
    if (v16) {
      double v17 = 1.57079633;
    }
    long long v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v25.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v25.c = v18;
    *(_OWORD *)&v25.CGFloat tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v24, &v25, v17);
    long long v22 = *(_OWORD *)&v24.c;
    long long v23 = *(_OWORD *)&v24.a;
    CGFloat tx = v24.tx;
    CGFloat ty = v24.ty;
    id v21 = [v11 layer];

    *(_OWORD *)&v25.a = v23;
    *(_OWORD *)&v25.c = v22;
    v25.CGFloat tx = tx;
    v25.CGFloat ty = ty;
    [v21 setAffineTransform:&v25];

    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  }
  else
  {
    __break(1u);
  }
}

id sub_1969C()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron);
}

id sub_196B0()
{
  id v0 = [objc_allocWithZone((Class)UILabel) init];
  NSString v1 = sub_1E330();
  [v0 setText:v1];

  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setHidden:1];
  LODWORD(v2) = 1144750080;
  [v0 setContentHuggingPriority:1 forAxis:v2];
  uint64_t v3 = self;
  if (qword_31C20 != -1) {
    swift_once();
  }
  id v4 = [v3 systemFontOfSize:*(double *)&qword_31EF0];
  [v0 setFont:v4];

  return v0;
}

id sub_197E8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow);
}

id sub_197FC()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)UISlider), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setHidden:1];
  [v0 _setSliderStyle:110];
  id v1 = [objc_allocWithZone((Class)_UISliderFluidConfiguration) init];
  if (qword_31C10 != -1) {
    swift_once();
  }
  [v1 setStretchLimit:*(double *)&qword_31EE0];
  [v1 setExpansionFactor:1.5];
  [v0 _setSliderConfiguration:v1];

  return v0;
}

id sub_19910()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider);
}

id sub_19924()
{
  id v0 = [objc_allocWithZone((Class)UILabel) init];
  NSString v1 = sub_1E330();
  [v0 setText:v1];

  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setHidden:1];
  LODWORD(v2) = 1144750080;
  [v0 setContentHuggingPriority:1 forAxis:v2];
  [v0 setNumberOfLines:0];
  [v0 setLineBreakMode:0];
  uint64_t v3 = self;
  if (qword_31C28 != -1) {
    swift_once();
  }
  id v4 = [v3 systemFontOfSize:*(double *)&qword_31EF8];
  [v0 setFont:v4];

  return v0;
}

id sub_19A88()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel);
}

uint64_t sub_19A98()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType);
}

id sub_19AA8()
{
  id result = [self materialViewWithRecipe:4];
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_19AE8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView);
}

unint64_t sub_19AF8()
{
  return sub_19B04((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t sub_19B04(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    double v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_16968((uint64_t *)&unk_317B0);
  double v2 = (void *)sub_1E660();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_1D358((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_19C10()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_19C5C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_categoriesToVisualStylingProviders);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_19CB0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_19D0C()
{
  sub_16968(&qword_313E8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21210;
  *(void *)(v0 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  *(void *)(v0 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  sub_1E3A0();
  return v0;
}

uint64_t sub_19DA8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_19DF4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_requiredVisualStyleCategories);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_19E48())()
{
  return j_j__swift_endAccess;
}

id sub_19EA4()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider));
}

id sub_19EB4()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider));
}

id sub_19EC4()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_sliderStylingProvider));
}

uint64_t sub_19ED4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_isExpanded);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_19F1C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_isExpanded);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_19F68())()
{
  return j__swift_endAccess;
}

uint64_t sub_19FC4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonTitle);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1A01C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonTitle);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A07C())()
{
  return j_j__swift_endAccess;
}

id sub_1A0D8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_effectImageView);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_1A130(void *a1)
{
}

uint64_t (*sub_1A13C())()
{
  return j_j__swift_endAccess;
}

id sub_1A198()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_effectTitleLabel);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_1A1F0(void *a1)
{
}

uint64_t (*sub_1A1FC())()
{
  return j_j__swift_endAccess;
}

void sub_1A258(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v18 = objc_allocWithZone(v9);
  sub_1A2F4(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_1A2F4(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  v64[2] = a8;
  uint64_t v71 = a7;
  v64[1] = a5;
  uint64_t v69 = a3;
  uint64_t v70 = a4;
  v67 = a2;
  int v68 = a1;
  uint64_t v11 = sub_16968(&qword_31430);
  __chkstk_darwin(v11 - 8);
  v66 = (char *)v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonGlyph;
  id v14 = v9;
  id v15 = sub_18ED4();
  v64[3] = v13;
  v65 = v9;
  *(void *)&v9[v13] = v15;
  uint64_t v16 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron;
  sub_19350();
  *(void *)&v14[v16] = v17;
  uint64_t v18 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow;
  id v19 = sub_196B0();
  *(void *)&v14[v18] = v19;
  uint64_t v20 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider;
  id v21 = sub_197FC();
  *(void *)&v14[v20] = v21;
  uint64_t v22 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel;
  *(void *)&v14[v22] = sub_19924();
  id v23 = [self materialViewWithRecipe:4];
  if (!v23)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(void *)&v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView] = v23;
  uint64_t v24 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_categoriesToVisualStylingProviders;
  *(void *)&v14[v24] = sub_19B04((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v25 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_requiredVisualStyleCategories;
  sub_16968(&qword_313E8);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_21210;
  *(void *)(v26 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  *(void *)(v26 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  uint64_t v73 = v26;
  sub_1E3A0();
  *(void *)&v14[v25] = v73;
  v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_isExpanded] = 0;
  v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType] = v68;
  id v27 = &v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonTitle];
  uint64_t v28 = v70;
  uint64_t v29 = v71;
  *(void *)id v27 = v69;
  *((void *)v27 + 1) = v28;
  [v21 setMaximumValueImage:v29];
  id v30 = v19;
  if (a6)
  {
    NSString v31 = sub_1E330();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v31 = 0;
  }
  [v19 setText:v31];

  double v32 = *(void **)&v14[v22];
  id v33 = v32;
  if (a9)
  {
    NSString v34 = sub_1E330();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v34 = 0;
  }
  [v32 setText:v34];

  unint64_t v35 = self;
  NSString v36 = sub_1E330();
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  long long v38 = self;
  id v39 = [v38 bundleForClass:ObjCClassFromMetadata];
  id v40 = [v35 _visualStylingProviderForStyleSetNamed:v36 inBundle:v39];

  if (!v40) {
    goto LABEL_17;
  }
  *(void *)&v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider] = v40;
  NSString v41 = sub_1E330();
  id v42 = [v38 bundleForClass:ObjCClassFromMetadata];
  id v43 = [v35 _visualStylingProviderForStyleSetNamed:v41 inBundle:v42];

  if (!v43)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *(void *)&v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider] = v43;
  id v44 = [v35 _visualStylingProviderForRecipe:101 andCategory:1];
  long long v45 = v67;
  if (!v44)
  {
LABEL_19:
    __break(1u);
    return;
  }
  long long v46 = v29;
  *(void *)&v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_sliderStylingProvider] = v44;
  id v47 = [objc_allocWithZone((Class)UIImageView) initWithImage:v45];
  uint64_t v48 = (id *)&v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_effectImageView];
  *(void *)&v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_effectImageView] = v47;
  id v49 = v47;
  uint64_t v50 = (uint64_t)v66;
  sub_1E560();
  uint64_t v51 = sub_1E540();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v50, 1, v51)
    || (uint64_t v53 = sub_1E4F0()) == 0)
  {
    sub_1A930(v50);
    id v52 = 0;
  }
  else
  {
    uint64_t v54 = (void *)v53;
    sub_1A930(v50);
    id v52 = [v54 symbolConfiguration];
  }
  [v49 setSymbolConfiguration:v52];

  swift_beginAccess();
  [*v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v55 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v56 = (id *)&v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_effectTitleLabel];
  *(void *)&v14[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_effectTitleLabel] = v55;
  [v55 setTranslatesAutoresizingMaskIntoConstraints:0];
  swift_beginAccess();
  id v57 = *v56;
  [v57 setLineBreakMode:4];

  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  int v61 = (objc_class *)type metadata accessor for EffectControl();
  v72.receiver = v14;
  v72.super_class = v61;
  id v62 = objc_msgSendSuper2(&v72, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  id v63 = [v62 layer];
  [v63 setMasksToBounds:1];

  sub_1AAC4();
  sub_1B0F4();
  sub_1ABD4();
}

uint64_t sub_1A930(uint64_t a1)
{
  uint64_t v2 = sub_16968(&qword_31430);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for EffectControl()
{
  return self;
}

id sub_1A9E0()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for EffectControl();
  objc_msgSendSuper2(&v3, "layoutSubviews");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView];
  [v0 _continuousCornerRadius];
  return objc_msgSend(v1, "_setContinuousCornerRadius:");
}

id sub_1AAC4()
{
  if (v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType] != 2)
  {
    uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView];
    id v2 = [v1 layer];
    [v2 setShadowPathIsBounds:1];

    id v3 = [v1 layer];
    LODWORD(v4) = 1036831949;
    [v3 setShadowOpacity:v4];

    id v5 = [v1 layer];
    [v5 setShadowRadius:15.0];
  }
  id v6 = *(void **)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView];
  [v0 _continuousCornerRadius];

  return objc_msgSend(v6, "_setContinuousCornerRadius:");
}

void sub_1ABD4()
{
  uint64_t v1 = *(void **)((char *)v0
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
  [v1 automaticallyUpdateView:*(void *)((char *)v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron) withStyle:2];
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType) == 2) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = 5;
  }
  [*(id *)((char *)v0+ OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:*(void *)((char *)v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView) withStyle:v2];
  [v1 automaticallyUpdateView:*(void *)((char *)v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow) withStyle:0];
  id v3 = [v1 automaticallyUpdateView:*(void *)((char *)v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel) withStyle:0];
  double v4 = (void *)(*(uint64_t (**)(id))((char *)&stru_108.flags + (swift_isaMask & *v0)))(v3);
  [v1 automaticallyUpdateView:v4 withStyle:0];

  id v5 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v0)))();
  [v1 automaticallyUpdateView:v5 withStyle:0];

  sub_1AD70();
}

void sub_1AD70()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider);
  [v2 _setDrawsAsBackdropOverlayWithBlendMode:2];
  id v3 = [*(id *)(v0 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_sliderStylingProvider) _colorForStyle:1];
  id v4 = [self quaternaryLabelColor];
  if (qword_31BC0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1E2C0();
  sub_169AC(v5, (uint64_t)qword_31BC8);
  id v6 = v3;
  id v7 = v4;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = sub_1E2A0();
  os_log_type_t v11 = sub_1E3C0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v21 = v1;
    uint64_t v22 = v2;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412546;
    if (v8)
    {
      id v14 = v8;
      sub_1E590();
    }
    else
    {
      sub_1E590();
      id v3 = 0;
    }
    *uint64_t v13 = v3;

    *(_WORD *)(v12 + 12) = 2112;
    id v23 = v9;
    id v15 = v9;
    sub_1E590();
    v13[1] = v9;

    _os_log_impl(&dword_0, v10, v11, "min color = %@, max color = %@", (uint8_t *)v12, 0x16u);
    sub_16968((uint64_t *)&unk_31700);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v1 = v21;
  }
  else
  {
  }
  objc_msgSend(v2, "setMinimumTrackTintColor:", v8, v21, v22, v23);
  [v2 setMaximumTrackTintColor:v9];
  id v16 = [v2 _maxValueView];
  if (!v16)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  if ([*(id *)(v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView) isHighlighted])uint64_t v18 = 2; {
  else
  }
    uint64_t v18 = 1;
  [v17 _setDrawsAsBackdropOverlayWithBlendMode:v18];

  id v19 = [v2 _maxValueView];
  if (!v19) {
LABEL_16:
  }
    __break(1u);
  uint64_t v20 = v19;
  [v19 setTintColor:v8];
}

uint64_t sub_1B0F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_16968(&qword_31430);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v6 = (char *)&v27 - v5;
  uint64_t v30 = sub_1E540();
  uint64_t v7 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v28 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1E240();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_1E200();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v27 - v16;
  uint64_t v18 = (*(uint64_t (**)(uint64_t))((char *)&stru_158.reloff + (swift_isaMask & *v0)))(v15);
  (*(void (**)(uint64_t))&stru_108.segname[swift_isaMask & *v0])(v18);
  sub_1E230();
  sub_1E210();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  id v19 = self;
  if (qword_31C18 != -1) {
    swift_once();
  }
  id v32 = [v19 systemFontOfSize:*(double *)&qword_31EE8];
  sub_1742C();
  uint64_t v20 = sub_1E1F0();
  uint64_t v21 = (void *)(*(uint64_t (**)(uint64_t))((char *)&stru_108.flags + (swift_isaMask & *v0)))(v20);
  sub_17F10(0, (unint64_t *)&unk_317A0);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v17, v10);
  uint64_t v22 = (void *)sub_1E3F0();
  [v21 setAttributedText:v22];

  if (*((unsigned char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType) == 1) {
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron) setHidden:0];
  }
  sub_1E560();
  uint64_t v23 = v30;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v6, 1, v30) == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
    return sub_1A930((uint64_t)v6);
  }
  else
  {
    uint64_t v25 = v28;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v28, v6, v23);
    sub_1E500();
    uint64_t v26 = v29;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v29, v25, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v23);
    sub_1E570();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v25, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v17, v10);
  }
}

void sub_1B64C(void *a1, char a2)
{
  double v4 = 0.0;
  double v5 = 0.0;
  if (a2)
  {
    if (qword_31C08 != -1) {
      swift_once();
    }
    double v5 = *((double *)&xmmword_31EC0 + 1);
    double v4 = *(double *)&qword_31ED8;
  }
  id v6 = self;
  sub_16968(&qword_313E8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21210;
  id v8 = [a1 leadingAnchor];
  id v9 = [v2 leadingAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9 constant:v5];

  *(void *)(v7 + 32) = v10;
  id v11 = [a1 trailingAnchor];
  id v12 = [v2 trailingAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12 constant:-v4];

  *(void *)(v7 + 40) = v13;
  sub_1E3A0();
  sub_17F10(0, &qword_31528);
  Class isa = sub_1E370().super.isa;
  swift_bridgeObjectRelease();
  [v6 activateConstraints:isa];
}

void sub_1B84C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView];
  [v0 addSubview:v2];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonGlyph];
  id v4 = [v0 addSubview:v3];
  uint64_t v58 = *(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *(void *)v0));
  double v5 = (void *)((uint64_t (*)(id))v58)(v4);
  [v0 addSubview:v5];

  id v59 = *(uint64_t (**)(void))((char *)&stru_108.flags + (swift_isaMask & *(void *)v0));
  id v6 = (void *)v59();
  [v0 addSubview:v6];

  id v61 = *(id *)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron];
  objc_msgSend(v0, "addSubview:");
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  (*(void (**)(void *, void))((char *)&stru_158.offset + (swift_isaMask & *(void *)v0)))(v2, 0);
  uint64_t v7 = self;
  sub_16968(&qword_313E8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_21210;
  id v9 = [v2 topAnchor];
  id v10 = [v1 topAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];

  *(void *)(v8 + 32) = v11;
  id v12 = [v2 bottomAnchor];
  id v13 = [v1 bottomAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];

  *(void *)(v8 + 40) = v14;
  sub_1E3A0();
  sub_17F10(0, &qword_31528);
  Class isa = sub_1E370().super.isa;
  swift_bridgeObjectRelease();
  id v60 = v7;
  [v7 activateConstraints:isa];

  LODWORD(v12) = v1[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType];
  id v16 = [v3 trailingAnchor];
  if (v12 == 1) {
    id v17 = [v61 leadingAnchor];
  }
  else {
    id v17 = [v1 trailingAnchor];
  }
  id v18 = v17;
  id v19 = [v16 constraintEqualToAnchor:v18];

  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_21220;
  id v21 = [v3 topAnchor];
  id v22 = [v1 topAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22];

  *(void *)(v20 + 32) = v23;
  id v24 = [v3 leadingAnchor];
  id v25 = [v1 leadingAnchor];
  id v26 = [v24 constraintEqualToAnchor:v25];

  *(void *)(v20 + 40) = v26;
  id v27 = [v3 heightAnchor];
  id v28 = [v27 constraintEqualToConstant:40.0];

  *(void *)(v20 + 48) = v28;
  *(void *)(v20 + 56) = v19;
  id v57 = v19;
  uint64_t v29 = (void *)v58();
  id v30 = [v29 centerXAnchor];

  id v31 = [v1 leadingAnchor];
  id v32 = [v30 constraintEqualToAnchor:v31 constant:23.0];

  *(void *)(v20 + 64) = v32;
  id v33 = (void *)v58();
  id v34 = [v33 centerYAnchor];

  id v35 = [v3 centerYAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35];

  *(void *)(v20 + 72) = v36;
  uint64_t v37 = (void *)v59();
  id v38 = [v37 leadingAnchor];

  id v39 = (void *)v58();
  id v40 = [v39 centerXAnchor];

  id v41 = [v38 constraintEqualToAnchor:v40 constant:18.0];
  *(void *)(v20 + 80) = v41;
  id v42 = (void *)v59();
  id v43 = [v42 centerYAnchor];

  id v44 = [v3 centerYAnchor];
  id v45 = [v43 constraintEqualToAnchor:v44];

  *(void *)(v20 + 88) = v45;
  id v46 = [v61 centerYAnchor];
  id v47 = [v3 centerYAnchor];
  id v48 = [v46 constraintEqualToAnchor:v47];

  *(void *)(v20 + 96) = v48;
  id v49 = [v61 trailingAnchor];
  id v50 = [v1 trailingAnchor];
  if (qword_31C08 != -1) {
    swift_once();
  }
  id v51 = [v49 constraintEqualToAnchor:v50 constant:-*(double *)&qword_31ED8];

  *(void *)(v20 + 104) = v51;
  id v52 = [v61 widthAnchor];
  id v53 = [v52 constraintEqualToConstant:26.0];

  *(void *)(v20 + 112) = v53;
  id v54 = [v61 heightAnchor];
  id v55 = [v61 widthAnchor];
  id v56 = [v54 constraintEqualToAnchor:v55];

  *(void *)(v20 + 120) = v56;
  sub_1E3A0();
  Class v62 = sub_1E370().super.isa;
  swift_bridgeObjectRelease();
  [v60 activateConstraints:v62];
}

id sub_1C0E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow];
  [v0 addSubview:v2];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider];
  objc_msgSend(v0, "addSubview:");
  id v23 = *(void **)&v0[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel];
  objc_msgSend(v0, "addSubview:");
  id v22 = *(void (**)(void *, uint64_t))((char *)&stru_158.offset + (swift_isaMask & *(void *)v0));
  v22(v2, 1);
  id v4 = self;
  sub_16968(&qword_313E8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_20DF0;
  id v6 = [v2 topAnchor];
  id v7 = [*(id *)&v1[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonGlyph] bottomAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];

  *(void *)(v5 + 32) = v8;
  sub_1E3A0();
  sub_17F10(0, &qword_31528);
  Class isa = sub_1E370().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:isa];

  v22(v3, 1);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_20DF0;
  id v11 = [v3 topAnchor];
  id v12 = [v2 bottomAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];

  id v14 = v4;
  *(void *)(v10 + 32) = v13;
  sub_1E3A0();
  Class v15 = sub_1E370().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:v15];

  v22(v23, 1);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_20DF0;
  id v17 = [v23 topAnchor];
  id v18 = [v3 bottomAnchor];
  if (qword_31C08 != -1) {
    swift_once();
  }
  id v19 = [v17 constraintEqualToAnchor:v18 constant:*(double *)&xmmword_31EC0];

  *(void *)(v16 + 32) = v19;
  sub_1E3A0();
  Class v20 = sub_1E370().super.isa;
  swift_bridgeObjectRelease();
  [v14 activateConstraints:v20];

  [v1 setNeedsLayout];

  return [v1 layoutIfNeeded];
}

void sub_1C510()
{
  uint64_t v1 = v0;
  if (qword_31BC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E2C0();
  sub_169AC(v2, (uint64_t)qword_31BC8);
  uint64_t v3 = sub_1E2A0();
  os_log_type_t v4 = sub_1E3C0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "Chevron Tapped", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = (uint64_t (*)(void *, void))(*(uint64_t (**)(void *))&stru_108.segname[(swift_isaMask & *v1) - 8])(v13);
  *id v7 = !*v7;
  uint64_t v8 = v6(v13, 0);
  if ((*(uint64_t (**)(uint64_t))((char *)&stru_B8.reserved2 + (swift_isaMask & *v1)))(v8)) {
    sub_1C0E8();
  }
  id v9 = self;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  v13[4] = sub_1D688;
  v13[5] = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_1CEE8;
  v13[3] = &unk_29208;
  id v11 = _Block_copy(v13);
  id v12 = v1;
  swift_release();
  [v9 animateWithDuration:v11 animations:0.3];
  _Block_release(v11);
}

id sub_1C770(char a1, int a2, char a3)
{
  if (qword_31BC0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1E2C0();
  sub_169AC(v7, (uint64_t)qword_31BC8);
  uint64_t v8 = v3;
  id v9 = sub_1E2A0();
  os_log_type_t v10 = sub_1E3C0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v38 = v37;
    *(_DWORD *)uint64_t v11 = 136316162;
    sub_16198(0xD000000000000041, 0x8000000000022B00, &v38);
    uint64_t v12 = sub_1E590();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v13 = (*(uint64_t (**)(uint64_t))&stru_108.segname[swift_isaMask & *v8])(v12);
    sub_16198(v13, v14, &v38);
    sub_1E590();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 22) = 1024;
    sub_1E590();
    *(_WORD *)(v11 + 28) = 1024;
    sub_1E590();
    *(_WORD *)(v11 + 34) = 1024;
    sub_1E590();
    _os_log_impl(&dword_0, v9, v10, "%s setting %s highlighted=%{BOOL}d, isAlternateHighlight=%{BOOL}d, isSupported=%{BOOL}d", (uint8_t *)v11, 0x28u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  Class v15 = *(void **)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView);
  objc_msgSend(v15, "setHighlighted:", a1 & 1, v37);
  if (a3)
  {
    if (a1)
    {
      BOOL v16 = *((unsigned __int8 *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType) == 2;
      id v17 = *(void **)((char *)v8
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
      [v17 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron) withStyle:3];
      if ((v16 & a2) != 0) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = 4;
      }
      id v19 = [*(id *)((char *)v8+ OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:v15 withStyle:v18];
      Class v20 = *(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v8));
      id v21 = (void *)((uint64_t (*)(id))v20)(v19);
      id v22 = v21;
      if (v16 & a2)
      {
        [v17 automaticallyUpdateView:v21 withStyle:0];
        uint64_t v23 = 0;
      }
      else
      {
        objc_msgSend(v21, "rpccmt_removeAllVisualStyling");

        id v34 = (void *)v20();
        id v22 = [self systemBlueColor];
        [v34 setTintColor:v22];

        uint64_t v23 = 1;
      }

      id v35 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.flags + (swift_isaMask & *v8)))();
      [v17 automaticallyUpdateView:v35 withStyle:v23];

      [v17 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow) withStyle:1];
      [v17 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel) withStyle:1];
    }
    else
    {
      uint64_t v29 = *(void **)((char *)v8
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
      [v29 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron) withStyle:2];
      if (*((unsigned char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType) == 2) {
        uint64_t v30 = 3;
      }
      else {
        uint64_t v30 = 0;
      }
      id v31 = [*(id *)((char *)v8+ OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:v15 withStyle:v30];
      id v32 = (void *)(*(uint64_t (**)(id))((char *)&stru_108.flags + (swift_isaMask & *v8)))(v31);
      [v29 automaticallyUpdateView:v32 withStyle:0];

      id v33 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v8)))();
      [v29 automaticallyUpdateView:v33 withStyle:0];

      [v29 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow) withStyle:0];
      [v29 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel) withStyle:0];
    }
  }
  else
  {
    id v24 = *(void **)((char *)v8
                   + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
    [v24 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron) withStyle:5];
    if (*((unsigned char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType) == 2) {
      uint64_t v25 = 3;
    }
    else {
      uint64_t v25 = 5;
    }
    id v26 = [*(id *)((char *)v8+ OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:v15 withStyle:v25];
    id v27 = (void *)(*(uint64_t (**)(id))((char *)&stru_108.flags + (swift_isaMask & *v8)))(v26);
    [v24 automaticallyUpdateView:v27 withStyle:5];

    id v28 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v8)))();
    [v24 automaticallyUpdateView:v28 withStyle:5];

    [v24 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow) withStyle:5];
    [v24 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel) withStyle:5];
  }
  sub_1AD70();
  return [v8 setNeedsDisplay];
}

uint64_t sub_1CEE8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_1CF2C()
{
}

id sub_1CF8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EffectControl();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1D0D0(char a1)
{
  uint64_t v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(unsigned char *)(v4 + 24) = a1;
  v7[4] = sub_1D904;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1CEE8;
  v7[3] = &unk_29258;
  uint64_t v5 = _Block_copy(v7);
  id v6 = v1;
  swift_release();
  [v3 animateWithDuration:v5 animations:0.3];
  _Block_release(v5);
}

void sub_1D1C8()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  v5[4] = sub_1DA98;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1CEE8;
  v5[3] = &unk_292A8;
  uint64_t v3 = _Block_copy(v5);
  id v4 = v0;
  swift_release();
  [v1 animateWithDuration:v3 animations:0.3];
  _Block_release(v3);
}

id sub_1D2B8(void *a1)
{
  if ([*(id *)(v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView) isHighlighted])uint64_t v3 = 2; {
  else
  }
    uint64_t v3 = 1;

  return [a1 _setDrawsAsBackdropOverlayWithBlendMode:v3];
}

void *sub_1D318()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider);
  id v2 = v1;
  return v1;
}

unint64_t sub_1D358(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1E400(*(void *)(v2 + 40));

  return sub_1D39C(a1, v4);
}

unint64_t sub_1D39C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_17F10(0, &qword_31408);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1E410();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1E410();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

void sub_1D4B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonGlyph;
  *(void *)&v1[v2] = sub_18ED4();
  uint64_t v3 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron;
  sub_19350();
  *(void *)&v1[v3] = v4;
  uint64_t v5 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow;
  *(void *)&v1[v5] = sub_196B0();
  uint64_t v6 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider;
  *(void *)&v1[v6] = sub_197FC();
  uint64_t v7 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel;
  *(void *)&v1[v7] = sub_19924();
  id v8 = [self materialViewWithRecipe:4];
  if (!v8) {
    __break(1u);
  }
  *(void *)&v1[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView] = v8;
  uint64_t v9 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_categoriesToVisualStylingProviders;
  *(void *)&v1[v9] = sub_19B04((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v10 = OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_requiredVisualStyleCategories;
  sub_16968(&qword_313E8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21210;
  *(void *)(v11 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  *(void *)(v11 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  sub_1E3A0();
  *(void *)&v1[v10] = v11;
  v1[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_isExpanded] = 0;

  sub_1E640();
  __break(1u);
}

uint64_t sub_1D650()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1D688()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v1));
  char v3 = v2();
  uint64_t v4 = *(void **)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow);
  if (v3)
  {
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow) setHidden:0];
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider) setHidden:0];
    id v5 = [*(id *)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel) setHidden:0];
  }
  else
  {
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow) setHidden:1];
    uint64_t v6 = *(void **)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider);
    [v6 setHidden:1];
    uint64_t v7 = *(void **)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel);
    [v7 setHidden:1];
    [v4 removeFromSuperview];
    [v6 removeFromSuperview];
    id v5 = [v7 removeFromSuperview];
  }
  if (((uint64_t (*)(id))v2)(v5)) {
    double v8 = 0.0;
  }
  else {
    double v8 = -1.57079633;
  }
  unsigned int v9 = [v1 _shouldReverseLayoutDirection];
  double v10 = -v8;
  if (!v9) {
    double v10 = v8;
  }
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v19.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v19.c = v11;
  *(_OWORD *)&v19.CGFloat tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformRotate(&v18, &v19, v10);
  long long v16 = *(_OWORD *)&v18.c;
  long long v17 = *(_OWORD *)&v18.a;
  CGFloat tx = v18.tx;
  CGFloat ty = v18.ty;
  id v14 = [*(id *)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron) layer];
  *(_OWORD *)&v19.a = v17;
  *(_OWORD *)&v19.c = v16;
  v19.CGFloat tx = tx;
  v19.CGFloat ty = ty;
  [v14 setAffineTransform:&v19];

  sub_1C770((char)[v1 isSelected], 0, 1);
  return [v1 layoutIfNeeded];
}

uint64_t sub_1D8B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1D8C4()
{
  return swift_release();
}

uint64_t sub_1D8CC()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_1D904()
{
  uint64_t v1 = *(void **)(v0 + 16);
  int v2 = *(unsigned __int8 *)(v0 + 24);
  CGAffineTransformMakeScale(&v8, 0.9, 0.9);
  [v1 setTransform:&v8];
  if (v2 == 1)
  {
    char v3 = *(void **)((char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView);
    id v4 = [v3 isHighlighted];
    if ((v4 & 1) == 0)
    {
      if (*((unsigned char *)v1 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_controlType) == 2) {
        id v4 = [*(id *)((char *)v1+ OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:v3 withStyle:2];
      }
      id v5 = (void *)(*(uint64_t (**)(id))((char *)&stru_108.flags + (swift_isaMask & *v1)))(v4);
      uint64_t v6 = *(void **)((char *)v1
                    + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
      [v6 automaticallyUpdateView:v5 withStyle:0];

      uint64_t v7 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v1)))();
      [v6 automaticallyUpdateView:v7 withStyle:0];
    }
  }
}

id sub_1DA98()
{
  uint64_t v1 = *(void **)(v0 + 16);
  CGAffineTransformMakeScale(&v3, 1.0, 1.0);
  return [v1 setTransform:&v3];
}

unint64_t sub_1DAF8()
{
  unint64_t result = qword_31710;
  if (!qword_31710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31710);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EffectControl.ControlType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EffectControl.ControlType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1DCA8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EffectControl.ControlType()
{
  return &type metadata for EffectControl.ControlType;
}

ValueMetadata *type metadata accessor for EffectControl.Constants()
{
  return &type metadata for EffectControl.Constants;
}

uint64_t sub_1DCF4()
{
  return 8;
}

uint64_t sub_1DD00()
{
  return swift_release();
}

uint64_t sub_1DD08(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_1DD14(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1DD34()
{
  return sub_1DD5C();
}

uint64_t sub_1DD5C()
{
  return sub_1DD84();
}

uint64_t sub_1DD84()
{
  uint64_t v0 = abort_report_np();
  return sub_1DDAC(v0);
}

uint64_t sub_1DDAC()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_1DDD0(v0);
}

void sub_1DDD0(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_7958();
    sub_7944();
    sub_7968(&dword_0, &_os_log_default, v2, " [ERROR] %{public}s:%d setCurrentSelectedMode=AVMicrophoneModeDefault caught exception: %@", v3, v4, v5, v6, 2u);
  }

  objc_end_catch();
}

void sub_1DEA4(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_7958();
    sub_7944();
    sub_7968(&dword_0, &_os_log_default, v2, " [ERROR] %{public}s:%d setCurrentSelectedMode=AVMicrophoneModeVoiceIsolation caught exception: %@", v3, v4, v5, v6, 2u);
  }

  objc_end_catch();
}

void sub_1DF78(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_7958();
    sub_7944();
    sub_7968(&dword_0, &_os_log_default, v2, " [ERROR] %{public}s:%d setCurrentSelectedMode=AVMicrophoneModeMusic caught exception: %@", v3, v4, v5, v6, 2u);
  }

  objc_end_catch();
}

void sub_1E04C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_begin_catch(a1);
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_9AEC();
    int v6 = 219;
    __int16 v7 = 2048;
    uint64_t v8 = a3;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d setCurrentSelectedMode=%ld caught exception: %@", v5, 0x26u);
  }

  objc_end_catch();
}

void sub_1E144()
{
  sub_9AEC();
  int v1 = 271;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d _bundleIdentifer=nil", v0, 0x12u);
}

uint64_t sub_1E1D0()
{
  return AttributeScopes.UIKitAttributes.foregroundColor.getter();
}

uint64_t sub_1E1E0()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t sub_1E1F0()
{
  return AttributedString.subscript.setter();
}

uint64_t sub_1E200()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_1E210()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t sub_1E220()
{
  return AttributeContainer.subscript.setter();
}

uint64_t sub_1E230()
{
  return AttributeContainer.init()();
}

uint64_t sub_1E240()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t sub_1E250()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t sub_1E260()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_1E270()
{
  return Date.init()();
}

uint64_t sub_1E280()
{
  return type metadata accessor for Date();
}

NSNumber sub_1E290()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_1E2A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1E2B0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1E2C0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1E2D0()
{
  return type metadata accessor for UIConfigurationColorTransformer();
}

uint64_t sub_1E2E0()
{
  return UIConfigurationColorTransformer.init(_:)();
}

uint64_t sub_1E2F0()
{
  return type metadata accessor for UIConfigurationTextAttributesTransformer();
}

uint64_t sub_1E300()
{
  return UIConfigurationTextAttributesTransformer.init(_:)();
}

uint64_t sub_1E310()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t sub_1E320()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1E330()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1E340()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1E350()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_1E360()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1E370()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1E380()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1E390()
{
  return Array.description.getter();
}

uint64_t sub_1E3A0()
{
  return specialized Array._endMutation()();
}

NSNumber sub_1E3B0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1E3C0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1E3D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1E3E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1E3F0()
{
  return NSAttributedString.init(_:)();
}

Swift::Int sub_1E400(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1E410()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1E420()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t sub_1E430()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t sub_1E440()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t sub_1E450()
{
  return UIButton.Configuration.imagePadding.setter();
}

uint64_t sub_1E460()
{
  return type metadata accessor for UIButton.Configuration.TitleAlignment();
}

uint64_t sub_1E470()
{
  return UIButton.Configuration.imagePlacement.setter();
}

uint64_t sub_1E480()
{
  return UIButton.Configuration.titleAlignment.setter();
}

uint64_t sub_1E490()
{
  return UIButton.Configuration.imageReservation.setter();
}

uint64_t sub_1E4A0()
{
  return UIButton.Configuration.titleLineBreakMode.setter();
}

uint64_t sub_1E4B0()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t sub_1E4C0()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t sub_1E4D0()
{
  return UIButton.Configuration.imageColorTransformer.setter();
}

uint64_t sub_1E4E0()
{
  return UIButton.Configuration.titleTextAttributesTransformer.setter();
}

uint64_t sub_1E4F0()
{
  return UIButton.Configuration.image.getter();
}

uint64_t sub_1E500()
{
  return UIButton.Configuration.image.setter();
}

uint64_t sub_1E510()
{
  return static UIButton.Configuration.plain()();
}

uint64_t sub_1E520()
{
  return UIButton.Configuration.title.setter();
}

uint64_t sub_1E530()
{
  return static UIButton.Configuration.filled()();
}

uint64_t sub_1E540()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_1E550()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t sub_1E560()
{
  return UIButton.configuration.getter();
}

uint64_t sub_1E570()
{
  return UIButton.configuration.setter();
}

uint64_t sub_1E580()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_1E590()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1E5A0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1E5B0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1E5C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1E5D0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1E5E0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1E5F0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1E600()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1E610()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1E620()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1E630()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1E640()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1E650()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1E660()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1E670()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1E680()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1E690()
{
  return Hasher.init(_seed:)();
}

void sub_1E6A0(Swift::UInt a1)
{
}

Swift::Int sub_1E6B0()
{
  return Hasher._finalize()();
}

uint64_t AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID()
{
  return _AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID();
}

uint64_t AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID()
{
  return _AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID();
}

uint64_t AVControlCenterMicrophoneModesModuleIsVoiceProcessingBypassedForBundleID()
{
  return _AVControlCenterMicrophoneModesModuleIsVoiceProcessingBypassedForBundleID();
}

uint64_t AVControlCenterMicrophoneModesModuleSetAutoEnabledForBundleID()
{
  return _AVControlCenterMicrophoneModesModuleSetAutoEnabledForBundleID();
}

uint64_t AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID()
{
  return _AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID();
}

uint64_t CCUIIsPortrait()
{
  return _CCUIIsPortrait();
}

uint64_t CCUIReferenceScreenBounds()
{
  return _CCUIReferenceScreenBounds();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return _CGColorCreateGenericRGB(red, green, blue, alpha);
}

uint64_t CGFloatIsValid()
{
  return _CGFloatIsValid();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
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

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBSIsSystemApertureAvailable()
{
  return _SBSIsSystemApertureAvailable();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
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

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIPointRoundToViewScale()
{
  return _UIPointRoundToViewScale();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double sin(long double __x)
{
  return _sin(__x);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

id objc_msgSend_CCUIMenuModuleViewHeight(void *a1, const char *a2, ...)
{
  return _[a1 CCUIMenuModuleViewHeight];
}

id objc_msgSend_CCUIMenuModuleViewWidth(void *a1, const char *a2, ...)
{
  return _[a1 CCUIMenuModuleViewWidth];
}

id objc_msgSend__audioIndicatorImage(void *a1, const char *a2, ...)
{
  return _[a1 _audioIndicatorImage];
}

id objc_msgSend__audioOffIndicatorImage(void *a1, const char *a2, ...)
{
  return _[a1 _audioOffIndicatorImage];
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flatImageWithColor:");
}

id objc_msgSend__fontForTitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 _fontForTitleLabel];
}

id objc_msgSend__imageSymbolConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _imageSymbolConfiguration];
}

id objc_msgSend__inscribedRectInBoundingPathByInsettingRect_onEdges_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:");
}

id objc_msgSend__rpLocalizedStringFromFrameworkBundleWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rpLocalizedStringFromFrameworkBundleWithKey:");
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__unexpandedSubtitleFont(void *a1, const char *a2, ...)
{
  return _[a1 _unexpandedSubtitleFont];
}

id objc_msgSend__unexpandedTitleFont(void *a1, const char *a2, ...)
{
  return _[a1 _unexpandedTitleFont];
}

id objc_msgSend__visualStylingForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingForStyle:");
}

id objc_msgSend__visualStylingProviderForRecipe_andCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingProviderForRecipe:andCategory:");
}

id objc_msgSend__visualStylingProviderForStyleSetNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingProviderForStyleSetNamed:inBundle:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_audioDSPAutomaticMicModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 audioDSPAutomaticMicModeEnabled];
}

id objc_msgSend_autoMicModeSupported(void *a1, const char *a2, ...)
{
  return _[a1 autoMicModeSupported];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _[a1 button];
}

id objc_msgSend_buttonView(void *a1, const char *a2, ...)
{
  return _[a1 buttonView];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_configurationWithFont_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:scale:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_controlCenterApplyPrimaryContentShadow(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterApplyPrimaryContentShadow];
}

id objc_msgSend_controlCenterKeyLineOnLightVibrancyEffect(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterKeyLineOnLightVibrancyEffect];
}

id objc_msgSend_controlCenterPrimaryVibrancyEffect(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterPrimaryVibrancyEffect];
}

id objc_msgSend_controlCenterSecondaryVibrancyEffect(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterSecondaryVibrancyEffect];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_descriptionForPackageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForPackageNamed:inBundle:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableAutoMicMode(void *a1, const char *a2, ...)
{
  return _[a1 disableAutoMicMode];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_effectsDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 effectsDidUpdate];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithGlyphImage_highlightColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGlyphImage:highlightColor:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithRecipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipe:");
}

id objc_msgSend_initWithStyle_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:inBundle:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTitle_identifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:identifier:handler:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return _[a1 isExpanded];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSupportedMicMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSupportedMicMode:");
}

id objc_msgSend_layoutVideoConferenceSubviews(void *a1, const char *a2, ...)
{
  return _[a1 layoutVideoConferenceSubviews];
}

id objc_msgSend_loadMenuImages(void *a1, const char *a2, ...)
{
  return _[a1 loadMenuImages];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_materialViewWithRecipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "materialViewWithRecipe:");
}

id objc_msgSend_menuImageWithImage_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuImageWithImage:size:");
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsForTextStyle:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredExpandedContentHeight(void *a1, const char *a2, ...)
{
  return _[a1 preferredExpandedContentHeight];
}

id objc_msgSend_preferredExpandedContentWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredExpandedContentWidth];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_scaledValueForValue_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:compatibleWithTraitCollection:");
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _[a1 semanticContentAttribute];
}

id objc_msgSend_sensorActivityDataEligibleForInactiveMicModeSelection(void *a1, const char *a2, ...)
{
  return _[a1 sensorActivityDataEligibleForInactiveMicModeSelection];
}

id objc_msgSend_sensorActivityDataForActiveSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensorActivityDataForActiveSensorType:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAutomaticMicModeGlyphState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticMicModeGlyphState:");
}

id objc_msgSend_setAutomaticMicModeSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticMicModeSubtitle:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setContentModuleContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentModuleContext:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setCurrentSelectedMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSelectedMode:");
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffect:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGlyphImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlyphImage:");
}

id objc_msgSend_setGlyphState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlyphState:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setIndentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndentation:");
}

id objc_msgSend_setLabelsVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabelsVisible:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuItems:");
}

id objc_msgSend_setMinimumMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumMenuItems:");
}

id objc_msgSend_setModeForBypass(void *a1, const char *a2, ...)
{
  return _[a1 setModeForBypass];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setShouldLoadFromSensor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldLoadFromSensor:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUseTrailingCheckmarkLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseTrailingCheckmarkLayout:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setVisibleMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibleMenuItems:");
}

id objc_msgSend_setupAudioFunctionItems(void *a1, const char *a2, ...)
{
  return _[a1 setupAudioFunctionItems];
}

id objc_msgSend_setupAutomaticMicModeButton(void *a1, const char *a2, ...)
{
  return _[a1 setupAutomaticMicModeButton];
}

id objc_msgSend_setupInitialSelectedMicMode(void *a1, const char *a2, ...)
{
  return _[a1 setupInitialSelectedMicMode];
}

id objc_msgSend_setupInitialStateAndNotifications(void *a1, const char *a2, ...)
{
  return _[a1 setupInitialStateAndNotifications];
}

id objc_msgSend_setupMicModeColorTint(void *a1, const char *a2, ...)
{
  return _[a1 setupMicModeColorTint];
}

id objc_msgSend_setupMicModeInitialState(void *a1, const char *a2, ...)
{
  return _[a1 setupMicModeInitialState];
}

id objc_msgSend_setupMicModeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 setupMicModeNotifications];
}

id objc_msgSend_setupModuleImageView(void *a1, const char *a2, ...)
{
  return _[a1 setupModuleImageView];
}

id objc_msgSend_setupSupportedLabel(void *a1, const char *a2, ...)
{
  return _[a1 setupSupportedLabel];
}

id objc_msgSend_setupTitleLabelViews(void *a1, const char *a2, ...)
{
  return _[a1 setupTitleLabelViews];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemOrangeColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithPreferredContentSizeCategory:");
}

id objc_msgSend_updateAudioImageViewWithMicOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAudioImageViewWithMicOn:");
}

id objc_msgSend_updateAutoMicModeState(void *a1, const char *a2, ...)
{
  return _[a1 updateAutoMicModeState];
}

id objc_msgSend_updateAutomaticMicMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAutomaticMicMode:");
}

id objc_msgSend_updateAutomaticMicModeButtonConstraints(void *a1, const char *a2, ...)
{
  return _[a1 updateAutomaticMicModeButtonConstraints];
}

id objc_msgSend_updateMicMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMicMode:");
}

id objc_msgSend_updateModuleImageView(void *a1, const char *a2, ...)
{
  return _[a1 updateModuleImageView];
}

id objc_msgSend_updateSupportedLabelConstraints(void *a1, const char *a2, ...)
{
  return _[a1 updateSupportedLabelConstraints];
}

id objc_msgSend_updateSupportedLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 updateSupportedLabelFont];
}

id objc_msgSend_updateVisuals(void *a1, const char *a2, ...)
{
  return _[a1 updateVisuals];
}

id objc_msgSend_usedRecently(void *a1, const char *a2, ...)
{
  return _[a1 usedRecently];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirectionForSemanticContentAttribute:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_visualStylingProviderForCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualStylingProviderForCategory:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}