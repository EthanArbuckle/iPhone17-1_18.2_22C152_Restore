uint64_t SBLayoutSupportsSideLayoutRole()
{
  if (qword_1D990 != -1) {
    dispatch_once(&qword_1D990, &stru_18560);
  }
  return byte_1D988;
}

void sub_3D18(id a1)
{
  if (MGGetBoolAnswer()) {
    char v1 = 1;
  }
  else {
    char v1 = MGGetBoolAnswer();
  }
  byte_1D988 = v1;
}

double SBLayoutDefaultSideLayoutElementWidth(uint64_t a1)
{
  int v5 = __sb__runningInSpringBoard();
  char v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_10;
    }
  }
  else
  {
    char v1 = +[UIDevice currentDevice];
    if ([v1 userInterfaceIdiom] != (char *)&dword_0 + 1 || SBFEffectiveHomeButtonType() != 2)
    {

      goto LABEL_10;
    }
  }
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = +[UIScreen mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v10 = SBDisplayMetrics[41];
  BOOL v12 = v11 >= v10;
  if (v11 >= v10)
  {
    int v13 = __sb__runningInSpringBoard();
    char v14 = v13;
    if (v13)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_25;
      }
    }
    else
    {
      v3 = +[UIDevice currentDevice];
      if ([v3 userInterfaceIdiom] != (char *)&dword_0 + 1)
      {
        BOOL v12 = 1;
LABEL_24:

        goto LABEL_25;
      }
    }
    int v15 = __sb__runningInSpringBoard();
    char v16 = v15;
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v19 = +[UIScreen mainScreen];
      [v19 _referenceBounds];
    }
    BSSizeRoundForScale();
    BOOL v12 = v17 < SBDisplayMetrics[33];
    if ((v16 & 1) == 0) {

    }
    if ((v14 & 1) == 0) {
      goto LABEL_24;
    }
  }
LABEL_25:
  if ((v8 & 1) == 0) {

  }
  if (v6)
  {
    if (v12) {
      goto LABEL_31;
    }
LABEL_10:
    *(void *)&double result = SBPhoneOnPadFallbackLaunchSize().n128_u64[0];
    return result;
  }

  if (!v12) {
    goto LABEL_10;
  }
LABEL_31:
  if ((unint64_t)(a1 - 1) >= 2) {
    v18 = &SBDisplayMetrics[4];
  }
  else {
    v18 = SBDisplayMetrics;
  }
  return *v18;
}

__n128 SBPhoneOnPadFallbackLaunchSize()
{
  int v2 = __sb__runningInSpringBoard();
  char v3 = v2;
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return *(__n128 *)&SBDisplayMetrics;
    }
LABEL_5:
    int v5 = __sb__runningInSpringBoard();
    char v6 = v5;
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      char v1 = +[UIScreen mainScreen];
      [v1 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v7 >= *((double *)&SBDisplayMetrics + 33))
    {
      __n128 result = *((__n128 *)&SBDisplayMetrics + 2);
      if (v6) {
        goto LABEL_14;
      }
    }
    else
    {
      __n128 result = *(__n128 *)&SBDisplayMetrics;
      if (v6)
      {
LABEL_14:
        if (v3) {
          return result;
        }
        goto LABEL_15;
      }
    }
    __n128 v8 = result;

    __n128 result = v8;
    goto LABEL_14;
  }
  v0 = +[UIDevice currentDevice];
  if ([v0 userInterfaceIdiom] == (char *)&dword_0 + 1) {
    goto LABEL_5;
  }
  __n128 result = *(__n128 *)&SBDisplayMetrics;
LABEL_15:
  __n128 v9 = result;

  return v9;
}

void sub_50DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id SBLogStartup()
{
  if (qword_200F8 != -1) {
    dispatch_once(&qword_200F8, &stru_18580);
  }
  v0 = (void *)qword_200F0;

  return v0;
}

void sub_515C(id a1)
{
  qword_200F0 = (uint64_t)os_log_create(SBLoggingSubsystem, "Startup");

  _objc_release_x1();
}

id SBLogAccessory()
{
  if (qword_20108 != -1) {
    dispatch_once(&qword_20108, &stru_185A0);
  }
  v0 = (void *)qword_20100;

  return v0;
}

void sub_51F8(id a1)
{
  qword_20100 = (uint64_t)os_log_create(SBLoggingSubsystem, "Accessory");

  _objc_release_x1();
}

id SBLogAppResize()
{
  if (qword_1D9A0 != -1) {
    dispatch_once(&qword_1D9A0, &stru_185C0);
  }
  v0 = (void *)qword_1D998;

  return v0;
}

void sub_5294(id a1)
{
  qword_1D998 = (uint64_t)os_log_create(SBLoggingSubsystem, "AppResize");

  _objc_release_x1();
}

id SBLogCharging()
{
  if (qword_20118 != -1) {
    dispatch_once(&qword_20118, &stru_185E0);
  }
  v0 = (void *)qword_20110;

  return v0;
}

void sub_5330(id a1)
{
  qword_20110 = (uint64_t)os_log_create(SBLoggingSubsystem, "Charging");

  _objc_release_x1();
}

id SBLogSceneResize()
{
  if (qword_1D9B0 != -1) {
    dispatch_once(&qword_1D9B0, &stru_18600);
  }
  v0 = (void *)qword_1D9A8;

  return v0;
}

void sub_53CC(id a1)
{
  qword_1D9A8 = (uint64_t)os_log_create(SBLoggingSubsystem, "SceneResize");

  _objc_release_x1();
}

id SBLogScreenTime()
{
  if (qword_20128 != -1) {
    dispatch_once(&qword_20128, &stru_18620);
  }
  v0 = (void *)qword_20120;

  return v0;
}

void sub_5468(id a1)
{
  qword_20120 = (uint64_t)os_log_create(SBLoggingSubsystem, "ScreenTime");

  _objc_release_x1();
}

id SBLogLockScreenHint()
{
  if (qword_1D9C0 != -1) {
    dispatch_once(&qword_1D9C0, &stru_18640);
  }
  v0 = (void *)qword_1D9B8;

  return v0;
}

void sub_5504(id a1)
{
  qword_1D9B8 = (uint64_t)os_log_create(SBLoggingSubsystem, "LockScreenHint");

  _objc_release_x1();
}

id SBLogIcon()
{
  if (qword_20138 != -1) {
    dispatch_once(&qword_20138, &stru_18660);
  }
  v0 = (void *)qword_20130;

  return v0;
}

void sub_55A0(id a1)
{
  qword_20130 = (uint64_t)os_log_create(SBLoggingSubsystem, "Icon");

  _objc_release_x1();
}

id SBLogAlarm()
{
  if (qword_20148 != -1) {
    dispatch_once(&qword_20148, &stru_18680);
  }
  v0 = (void *)qword_20140;

  return v0;
}

void sub_563C(id a1)
{
  qword_20140 = (uint64_t)os_log_create(SBLoggingSubsystem, "Alarm");

  _objc_release_x1();
}

id SBLogDock()
{
  if (qword_20158 != -1) {
    dispatch_once(&qword_20158, &stru_186A0);
  }
  v0 = (void *)qword_20150;

  return v0;
}

void sub_56D8(id a1)
{
  qword_20150 = (uint64_t)os_log_create(SBLoggingSubsystem, "Dock");

  _objc_release_x1();
}

id SBLogBanner()
{
  if (qword_1D9D0 != -1) {
    dispatch_once(&qword_1D9D0, &stru_186C0);
  }
  v0 = (void *)qword_1D9C8;

  return v0;
}

void sub_5774(id a1)
{
  qword_1D9C8 = (uint64_t)os_log_create(SBLoggingSubsystem, "Banner");

  _objc_release_x1();
}

id SBLogSound()
{
  if (qword_20168 != -1) {
    dispatch_once(&qword_20168, &stru_186E0);
  }
  v0 = (void *)qword_20160;

  return v0;
}

void sub_5810(id a1)
{
  qword_20160 = (uint64_t)os_log_create(SBLoggingSubsystem, "Sound");

  _objc_release_x1();
}

id SBLogUserSession()
{
  if (qword_20178 != -1) {
    dispatch_once(&qword_20178, &stru_18700);
  }
  v0 = (void *)qword_20170;

  return v0;
}

void sub_58AC(id a1)
{
  qword_20170 = (uint64_t)os_log_create(SBLoggingSubsystem, "UserSession");

  _objc_release_x1();
}

id SBLogBacklight()
{
  if (qword_20188 != -1) {
    dispatch_once(&qword_20188, &stru_18720);
  }
  v0 = (void *)qword_20180;

  return v0;
}

void sub_5948(id a1)
{
  qword_20180 = (uint64_t)os_log_create(SBLoggingSubsystem, "Backlight");

  _objc_release_x1();
}

id SBLogAlertItems()
{
  if (qword_20198 != -1) {
    dispatch_once(&qword_20198, &stru_18740);
  }
  v0 = (void *)qword_20190;

  return v0;
}

void sub_59E4(id a1)
{
  qword_20190 = (uint64_t)os_log_create(SBLoggingSubsystem, "AlertItems");

  _objc_release_x1();
}

id SBLogAlertItemStack()
{
  if (qword_201A8 != -1) {
    dispatch_once(&qword_201A8, &stru_18760);
  }
  v0 = (void *)qword_201A0;

  return v0;
}

void sub_5A80(id a1)
{
  qword_201A0 = (uint64_t)os_log_create(SBLoggingSubsystem, "AlertItemStack");

  _objc_release_x1();
}

id SBLogLiftToWake()
{
  if (qword_201B8 != -1) {
    dispatch_once(&qword_201B8, &stru_18780);
  }
  v0 = (void *)qword_201B0;

  return v0;
}

void sub_5B1C(id a1)
{
  qword_201B0 = (uint64_t)os_log_create(SBLoggingSubsystem, "LiftToWake");

  _objc_release_x1();
}

id SBLogProximitySensor()
{
  if (qword_201C8 != -1) {
    dispatch_once(&qword_201C8, &stru_187A0);
  }
  v0 = (void *)qword_201C0;

  return v0;
}

void sub_5BB8(id a1)
{
  qword_201C0 = (uint64_t)os_log_create(SBLoggingSubsystem, "ProximitySensor");

  _objc_release_x1();
}

id SBLogThermal()
{
  if (qword_201D8 != -1) {
    dispatch_once(&qword_201D8, &stru_187C0);
  }
  v0 = (void *)qword_201D0;

  return v0;
}

void sub_5C54(id a1)
{
  qword_201D0 = (uint64_t)os_log_create(SBLoggingSubsystem, "Thermal");

  _objc_release_x1();
}

id SBLogHomeAffordance()
{
  if (qword_201E8 != -1) {
    dispatch_once(&qword_201E8, &stru_187E0);
  }
  v0 = (void *)qword_201E0;

  return v0;
}

void sub_5CF0(id a1)
{
  qword_201E0 = (uint64_t)os_log_create(SBLoggingSubsystem, "HomeAffordance");

  _objc_release_x1();
}

id SBLogTopAffordance()
{
  if (qword_201F8 != -1) {
    dispatch_once(&qword_201F8, &stru_18800);
  }
  v0 = (void *)qword_201F0;

  return v0;
}

void sub_5D8C(id a1)
{
  qword_201F0 = (uint64_t)os_log_create(SBLoggingSubsystem, "TopAffordance");

  _objc_release_x1();
}

id SBLogAffordancePresenceController()
{
  if (qword_20208 != -1) {
    dispatch_once(&qword_20208, &stru_18820);
  }
  v0 = (void *)qword_20200;

  return v0;
}

void sub_5E28(id a1)
{
  qword_20200 = (uint64_t)os_log_create(SBLoggingSubsystem, "AffordancePresenceController");

  _objc_release_x1();
}

id SBLogContinuity()
{
  if (qword_20218 != -1) {
    dispatch_once(&qword_20218, &stru_18840);
  }
  v0 = (void *)qword_20210;

  return v0;
}

void sub_5EC4(id a1)
{
  qword_20210 = (uint64_t)os_log_create(SBLoggingSubsystem, "Continuity");

  _objc_release_x1();
}

id SBLogTelemetrySignposts()
{
  if (qword_20228 != -1) {
    dispatch_once(&qword_20228, &stru_18860);
  }
  v0 = (void *)qword_20220;

  return v0;
}

void sub_5F60(id a1)
{
  qword_20220 = (uint64_t)os_log_create(SBLoggingSubsystem, "TelemetrySignposts");

  _objc_release_x1();
}

id SBLogDataReset()
{
  if (qword_1D9E0 != -1) {
    dispatch_once(&qword_1D9E0, &stru_18880);
  }
  v0 = (void *)qword_1D9D8;

  return v0;
}

void sub_5FFC(id a1)
{
  qword_1D9D8 = (uint64_t)os_log_create(SBLoggingSubsystem, "DataReset");

  _objc_release_x1();
}

id SBLogUIController()
{
  if (qword_20238 != -1) {
    dispatch_once(&qword_20238, &stru_188A0);
  }
  v0 = (void *)qword_20230;

  return v0;
}

void sub_6098(id a1)
{
  qword_20230 = (uint64_t)os_log_create(SBLoggingSubsystem, "UIController");

  _objc_release_x1();
}

id SBLogAppSwitcher()
{
  if (qword_20248 != -1) {
    dispatch_once(&qword_20248, &stru_188C0);
  }
  v0 = (void *)qword_20240;

  return v0;
}

void sub_6134(id a1)
{
  qword_20240 = (uint64_t)os_log_create(SBLoggingSubsystem, "AppSwitcher");

  _objc_release_x1();
}

id SBLogAudioControl()
{
  if (qword_20258 != -1) {
    dispatch_once(&qword_20258, &stru_188E0);
  }
  v0 = (void *)qword_20250;

  return v0;
}

void sub_61D0(id a1)
{
  qword_20250 = (uint64_t)os_log_create(SBLoggingSubsystem, "AudioControl");

  _objc_release_x1();
}

id SBLogSwitcherSnapshotCache()
{
  if (qword_20268 != -1) {
    dispatch_once(&qword_20268, &stru_18900);
  }
  v0 = (void *)qword_20260;

  return v0;
}

void sub_626C(id a1)
{
  qword_20260 = (uint64_t)os_log_create(SBLoggingSubsystem, "SwitcherSnapshotCache");

  _objc_release_x1();
}

id SBLogIconController()
{
  if (qword_20278 != -1) {
    dispatch_once(&qword_20278, &stru_18920);
  }
  v0 = (void *)qword_20270;

  return v0;
}

void sub_6308(id a1)
{
  qword_20270 = (uint64_t)os_log_create(SBLoggingSubsystem, "IconController");

  _objc_release_x1();
}

id SBLogElasticHUD()
{
  if (qword_20288 != -1) {
    dispatch_once(&qword_20288, &stru_18940);
  }
  v0 = (void *)qword_20280;

  return v0;
}

void sub_63A4(id a1)
{
  qword_20280 = (uint64_t)os_log_create(SBLoggingSubsystem, "ElasticHUD");

  _objc_release_x1();
}

id SBLogBrightnessHUD()
{
  if (qword_1D9F0 != -1) {
    dispatch_once(&qword_1D9F0, &stru_18960);
  }
  v0 = (void *)qword_1D9E8;

  return v0;
}

void sub_6440(id a1)
{
  qword_1D9E8 = (uint64_t)os_log_create(SBLoggingSubsystem, "BrightnessHUD");

  _objc_release_x1();
}

id SBLogVolumeHUD()
{
  if (qword_20298 != -1) {
    dispatch_once(&qword_20298, &stru_18980);
  }
  v0 = (void *)qword_20290;

  return v0;
}

void sub_64DC(id a1)
{
  qword_20290 = (uint64_t)os_log_create(SBLoggingSubsystem, "VolumeHUD");

  _objc_release_x1();
}

id SBLogRingerHUD()
{
  if (qword_202A8 != -1) {
    dispatch_once(&qword_202A8, &stru_189A0);
  }
  v0 = (void *)qword_202A0;

  return v0;
}

void sub_6578(id a1)
{
  qword_202A0 = (uint64_t)os_log_create(SBLoggingSubsystem, "RingerHUD");

  _objc_release_x1();
}

id SBLogFlashlightHUD()
{
  if (qword_202B8 != -1) {
    dispatch_once(&qword_202B8, &stru_189C0);
  }
  v0 = (void *)qword_202B0;

  return v0;
}

void sub_6614(id a1)
{
  qword_202B0 = (uint64_t)os_log_create(SBLoggingSubsystem, "FlashlightHUD");

  _objc_release_x1();
}

id SBLogAppStatusBars()
{
  if (qword_202C8 != -1) {
    dispatch_once(&qword_202C8, &stru_189E0);
  }
  v0 = (void *)qword_202C0;

  return v0;
}

void sub_66B0(id a1)
{
  qword_202C0 = (uint64_t)os_log_create(SBLoggingSubsystem, "AppStatusBars");

  _objc_release_x1();
}

id SBLogAVSystemControllerCache()
{
  if (qword_202D8 != -1) {
    dispatch_once(&qword_202D8, &stru_18A00);
  }
  v0 = (void *)qword_202D0;

  return v0;
}

void sub_674C(id a1)
{
  qword_202D0 = (uint64_t)os_log_create(SBLoggingSubsystem, "AVSystemControllerCache");

  _objc_release_x1();
}

id SBLogGreen()
{
  if (qword_202E8 != -1) {
    dispatch_once(&qword_202E8, &stru_18A20);
  }
  v0 = (void *)qword_202E0;

  return v0;
}

void sub_67E8(id a1)
{
  qword_202E0 = (uint64_t)os_log_create(SBLoggingSubsystem, "Green");

  _objc_release_x1();
}

id SBLogChrono()
{
  if (qword_202F8 != -1) {
    dispatch_once(&qword_202F8, &stru_18A40);
  }
  v0 = (void *)qword_202F0;

  return v0;
}

void sub_6884(id a1)
{
  qword_202F0 = (uint64_t)os_log_create(SBLoggingSubsystem, "Chrono");

  _objc_release_x1();
}

id SBLogChronoVerbose()
{
  if (qword_20308 != -1) {
    dispatch_once(&qword_20308, &stru_18A60);
  }
  v0 = (void *)qword_20300;

  return v0;
}

void sub_6920(id a1)
{
  qword_20300 = (uint64_t)os_log_create(SBLoggingSubsystem, "ChronoVerbose");

  _objc_release_x1();
}

id SBLogProactiveHome()
{
  if (qword_20318 != -1) {
    dispatch_once(&qword_20318, &stru_18A80);
  }
  v0 = (void *)qword_20310;

  return v0;
}

void sub_69BC(id a1)
{
  qword_20310 = (uint64_t)os_log_create(SBLoggingSubsystem, "ProactiveHome");

  _objc_release_x1();
}

id SBLogProactiveAppLibrary()
{
  if (qword_20328 != -1) {
    dispatch_once(&qword_20328, &stru_18AA0);
  }
  v0 = (void *)qword_20320;

  return v0;
}

void sub_6A58(id a1)
{
  qword_20320 = (uint64_t)os_log_create(SBLoggingSubsystem, "ProactiveAppLibrary");

  _objc_release_x1();
}

id SBLogClassicMode()
{
  if (qword_20338 != -1) {
    dispatch_once(&qword_20338, &stru_18AC0);
  }
  v0 = (void *)qword_20330;

  return v0;
}

void sub_6AF4(id a1)
{
  qword_20330 = (uint64_t)os_log_create(SBLoggingSubsystem, "ClassicMode");

  _objc_release_x1();
}

id SBLogHUD()
{
  if (qword_20348 != -1) {
    dispatch_once(&qword_20348, &stru_18AE0);
  }
  v0 = (void *)qword_20340;

  return v0;
}

void sub_6B90(id a1)
{
  qword_20340 = (uint64_t)os_log_create(SBLoggingSubsystem, "HUD");

  _objc_release_x1();
}

id SBLogWebClip()
{
  if (qword_1DA00 != -1) {
    dispatch_once(&qword_1DA00, &stru_18B00);
  }
  v0 = (void *)qword_1D9F8;

  return v0;
}

void sub_6C2C(id a1)
{
  qword_1D9F8 = (uint64_t)os_log_create(SBLoggingSubsystem, "WebClip");

  _objc_release_x1();
}

id SBLogPencilSqueeze()
{
  if (qword_1DA10 != -1) {
    dispatch_once(&qword_1DA10, &stru_18B20);
  }
  v0 = (void *)qword_1DA08;

  return v0;
}

void sub_6CC8(id a1)
{
  qword_1DA08 = (uint64_t)os_log_create(SBLoggingSubsystem, "PencilSqueeze");

  _objc_release_x1();
}

id SBLogPointer()
{
  if (qword_20358 != -1) {
    dispatch_once(&qword_20358, &stru_18B40);
  }
  v0 = (void *)qword_20350;

  return v0;
}

void sub_6D64(id a1)
{
  qword_20350 = (uint64_t)os_log_create(SBLoggingSubsystem, "Pointer");

  _objc_release_x1();
}

id SBLogHIDKeyboardEvents()
{
  if (qword_20368 != -1) {
    dispatch_once(&qword_20368, &stru_18B60);
  }
  v0 = (void *)qword_20360;

  return v0;
}

void sub_6E00(id a1)
{
  qword_20360 = (uint64_t)os_log_create(SBLoggingSubsystem, "HIDKeyboardEvents");

  _objc_release_x1();
}

id SBLogSmartCover()
{
  if (qword_1DA20 != -1) {
    dispatch_once(&qword_1DA20, &stru_18B80);
  }
  v0 = (void *)qword_1DA18;

  return v0;
}

void sub_6E9C(id a1)
{
  qword_1DA18 = (uint64_t)os_log_create(SBLoggingSubsystem, "SmartCover");

  _objc_release_x1();
}

id SBLogInteractiveScreenshot()
{
  if (qword_1DA30 != -1) {
    dispatch_once(&qword_1DA30, &stru_18BA0);
  }
  v0 = (void *)qword_1DA28;

  return v0;
}

void sub_6F38(id a1)
{
  qword_1DA28 = (uint64_t)os_log_create(SBLoggingSubsystem, "InteractiveScreenshot");

  _objc_release_x1();
}

id SBLogPPT()
{
  if (qword_1DA40 != -1) {
    dispatch_once(&qword_1DA40, &stru_18BC0);
  }
  v0 = (void *)qword_1DA38;

  return v0;
}

void sub_6FD4(id a1)
{
  qword_1DA38 = (uint64_t)os_log_create(SBLoggingSubsystem, "PPT");

  _objc_release_x1();
}

id SBLogDodging()
{
  if (qword_1DA50 != -1) {
    dispatch_once(&qword_1DA50, &stru_18BE0);
  }
  v0 = (void *)qword_1DA48;

  return v0;
}

void sub_7070(id a1)
{
  qword_1DA48 = (uint64_t)os_log_create(SBLoggingSubsystem, "Dodging");

  _objc_release_x1();
}

id SBLogShelfLiveContent()
{
  if (qword_20378 != -1) {
    dispatch_once(&qword_20378, &stru_18C00);
  }
  v0 = (void *)qword_20370;

  return v0;
}

void sub_710C(id a1)
{
  qword_20370 = (uint64_t)os_log_create(SBLoggingSubsystem, "ShelfLiveContent");

  _objc_release_x1();
}

id SBLogLegibility()
{
  if (qword_1DA60 != -1) {
    dispatch_once(&qword_1DA60, &stru_18C20);
  }
  v0 = (void *)qword_1DA58;

  return v0;
}

void sub_71A8(id a1)
{
  qword_1DA58 = (uint64_t)os_log_create(SBLoggingSubsystem, "Legibility");

  _objc_release_x1();
}

id SBLogWorkspace()
{
  if (qword_20388 != -1) {
    dispatch_once(&qword_20388, &stru_18C40);
  }
  v0 = (void *)qword_20380;

  return v0;
}

void sub_7244(id a1)
{
  qword_20380 = (uint64_t)os_log_create(SBLoggingSubsystem, "Workspace");

  _objc_release_x1();
}

id SBLogTransaction()
{
  if (qword_20398 != -1) {
    dispatch_once(&qword_20398, &stru_18C60);
  }
  v0 = (void *)qword_20390;

  return v0;
}

void sub_72E0(id a1)
{
  qword_20390 = (uint64_t)os_log_create(SBLoggingSubsystem, "Transaction");

  _objc_release_x1();
}

id SBLogTransactionVerbose()
{
  if (qword_203A8 != -1) {
    dispatch_once(&qword_203A8, &stru_18C80);
  }
  v0 = (void *)qword_203A0;

  return v0;
}

void sub_737C(id a1)
{
  qword_203A0 = (uint64_t)os_log_create(SBLoggingSubsystem, "TransactionVerbose");

  _objc_release_x1();
}

id SBLogCameraActivation()
{
  if (qword_1DA70 != -1) {
    dispatch_once(&qword_1DA70, &stru_18CA0);
  }
  v0 = (void *)qword_1DA68;

  return v0;
}

void sub_7418(id a1)
{
  qword_1DA68 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraActivation");

  _objc_release_x1();
}

id SBLogSiri()
{
  if (qword_203B8 != -1) {
    dispatch_once(&qword_203B8, &stru_18CC0);
  }
  v0 = (void *)qword_203B0;

  return v0;
}

void sub_74B4(id a1)
{
  qword_203B0 = (uint64_t)os_log_create(SBLoggingSubsystem, "Siri");

  _objc_release_x1();
}

id SBLogActivity()
{
  if (qword_203C8 != -1) {
    dispatch_once(&qword_203C8, &stru_18CE0);
  }
  v0 = (void *)qword_203C0;

  return v0;
}

void sub_7550(id a1)
{
  qword_203C0 = (uint64_t)os_log_create(SBLoggingSubsystem, "Activity");

  _objc_release_x1();
}

id SBLogShellSceneKit()
{
  if (qword_1DA80 != -1) {
    dispatch_once(&qword_1DA80, &stru_18D00);
  }
  v0 = (void *)qword_1DA78;

  return v0;
}

void sub_75EC(id a1)
{
  qword_1DA78 = (uint64_t)os_log_create(SBLoggingSubsystem, "ShellSceneKit");

  _objc_release_x1();
}

id SBLogVideoOut()
{
  if (qword_203D8 != -1) {
    dispatch_once(&qword_203D8, &stru_18D20);
  }
  v0 = (void *)qword_203D0;

  return v0;
}

void sub_7688(id a1)
{
  qword_203D0 = (uint64_t)os_log_create(SBLoggingSubsystem, "VideoOut");

  _objc_release_x1();
}

id SBLogStreamBuddy()
{
  if (qword_1DA90 != -1) {
    dispatch_once(&qword_1DA90, &stru_18D40);
  }
  v0 = (void *)qword_1DA88;

  return v0;
}

void sub_7724(id a1)
{
  qword_1DA88 = (uint64_t)os_log_create(SBLoggingSubsystem, "StreamBuddy");

  _objc_release_x1();
}

id SBLogScreenLongevityController()
{
  if (qword_1DAA0 != -1) {
    dispatch_once(&qword_1DAA0, &stru_18D60);
  }
  v0 = (void *)qword_1DA98;

  return v0;
}

void sub_77C0(id a1)
{
  qword_1DA98 = (uint64_t)os_log_create(SBLoggingSubsystem, "ScreenLongevityController");

  _objc_release_x1();
}

id SBLogAppLibrary()
{
  if (qword_203E8 != -1) {
    dispatch_once(&qword_203E8, &stru_18D80);
  }
  v0 = (void *)qword_203E0;

  return v0;
}

void sub_785C(id a1)
{
  qword_203E0 = (uint64_t)os_log_create(FBSApplicationLibraryLoggingSubsystem, "sb.default");

  _objc_release_x1();
}

id SBLogAppPlaceholder()
{
  if (qword_203F8 != -1) {
    dispatch_once(&qword_203F8, &stru_18DA0);
  }
  v0 = (void *)qword_203F0;

  return v0;
}

void sub_78F8(id a1)
{
  qword_203F0 = (uint64_t)os_log_create(FBSApplicationLibraryLoggingSubsystem, "sb.placeholder");

  _objc_release_x1();
}

id SBLogIconStyle()
{
  if (qword_20408 != -1) {
    dispatch_once(&qword_20408, &stru_18DC0);
  }
  v0 = (void *)qword_20400;

  return v0;
}

void sub_7994(id a1)
{
  qword_20400 = (uint64_t)os_log_create(SBLoggingSubsystem, "IconStyle");

  _objc_release_x1();
}

id SBLogShellScene()
{
  if (qword_20418 != -1) {
    dispatch_once(&qword_20418, &stru_18DE0);
  }
  v0 = (void *)qword_20410;

  return v0;
}

void sub_7A30(id a1)
{
  qword_20410 = (uint64_t)os_log_create(SBLoggingSubsystem, "ShellScene");

  _objc_release_x1();
}

id SBLogSystemGesture()
{
  if (qword_20428 != -1) {
    dispatch_once(&qword_20428, &stru_18E00);
  }
  v0 = (void *)qword_20420;

  return v0;
}

void sub_7ACC(id a1)
{
  qword_20420 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGesture");

  _objc_release_x1();
}

id SBLogSystemGestureDetail()
{
  if (qword_20438 != -1) {
    dispatch_once(&qword_20438, &stru_18E20);
  }
  v0 = (void *)qword_20430;

  return v0;
}

void sub_7B68(id a1)
{
  qword_20430 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGestureDetail");

  _objc_release_x1();
}

id SBLogSystemGestureControlCenter()
{
  if (qword_20448 != -1) {
    dispatch_once(&qword_20448, &stru_18E40);
  }
  v0 = (void *)qword_20440;

  return v0;
}

void sub_7C04(id a1)
{
  qword_20440 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGestureControlCenter");

  _objc_release_x1();
}

id SBLogSystemGestureCoverSheet()
{
  if (qword_20458 != -1) {
    dispatch_once(&qword_20458, &stru_18E60);
  }
  v0 = (void *)qword_20450;

  return v0;
}

void sub_7CA0(id a1)
{
  qword_20450 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGestureCoverSheet");

  _objc_release_x1();
}

id SBLogSystemGestureBannerDismiss()
{
  if (qword_1DAB0 != -1) {
    dispatch_once(&qword_1DAB0, &stru_18E80);
  }
  v0 = (void *)qword_1DAA8;

  return v0;
}

void sub_7D3C(id a1)
{
  qword_1DAA8 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGestureBannerDismiss");

  _objc_release_x1();
}

id SBLogSystemGestureScrunch()
{
  if (qword_1DAC0 != -1) {
    dispatch_once(&qword_1DAC0, &stru_18EA0);
  }
  v0 = (void *)qword_1DAB8;

  return v0;
}

void sub_7DD8(id a1)
{
  qword_1DAB8 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGestureScrunch");

  _objc_release_x1();
}

id SBLogSystemGestureAppSwitcher()
{
  if (qword_20468 != -1) {
    dispatch_once(&qword_20468, &stru_18EC0);
  }
  v0 = (void *)qword_20460;

  return v0;
}

void sub_7E74(id a1)
{
  qword_20460 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGestureAppSwitcher");

  _objc_release_x1();
}

id SBLogSystemGestureSwitchApp()
{
  if (qword_1DAD0 != -1) {
    dispatch_once(&qword_1DAD0, &stru_18EE0);
  }
  v0 = (void *)qword_1DAC8;

  return v0;
}

void sub_7F10(id a1)
{
  qword_1DAC8 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGestureSwitchApp");

  _objc_release_x1();
}

id SBLogSystemGestureHome()
{
  if (qword_20478 != -1) {
    dispatch_once(&qword_20478, &stru_18F00);
  }
  v0 = (void *)qword_20470;

  return v0;
}

void sub_7FAC(id a1)
{
  qword_20470 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGestureHome");

  _objc_release_x1();
}

id SBLogSystemGesturePencilSqueeze()
{
  if (qword_1DAE0 != -1) {
    dispatch_once(&qword_1DAE0, &stru_18F20);
  }
  v0 = (void *)qword_1DAD8;

  return v0;
}

void sub_8048(id a1)
{
  qword_1DAD8 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemGesturePencilSqueeze");

  _objc_release_x1();
}

id SBLogAppSwitcherDrag()
{
  if (qword_1DAF0 != -1) {
    dispatch_once(&qword_1DAF0, &stru_18F40);
  }
  v0 = (void *)qword_1DAE8;

  return v0;
}

void sub_80E4(id a1)
{
  qword_1DAE8 = (uint64_t)os_log_create(SBLoggingSubsystem, "AppSwitcherDrag");

  _objc_release_x1();
}

id SBLogWidgetDiscoverability()
{
  if (qword_20488 != -1) {
    dispatch_once(&qword_20488, &stru_18F60);
  }
  v0 = (void *)qword_20480;

  return v0;
}

void sub_8180(id a1)
{
  qword_20480 = (uint64_t)os_log_create(SBLoggingSubsystem, "WidgetDiscoverability");

  _objc_release_x1();
}

id SBLogWidgetIntent()
{
  if (qword_20498 != -1) {
    dispatch_once(&qword_20498, &stru_18F80);
  }
  v0 = (void *)qword_20490;

  return v0;
}

void sub_821C(id a1)
{
  qword_20490 = (uint64_t)os_log_create(SBLoggingSubsystem, "WidgetIntent");

  _objc_release_x1();
}

id SBLogSystemActionCoaching()
{
  if (qword_1DB00 != -1) {
    dispatch_once(&qword_1DB00, &stru_18FA0);
  }
  v0 = (void *)qword_1DAF8;

  return v0;
}

void sub_82B8(id a1)
{
  qword_1DAF8 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemActionCoaching");

  _objc_release_x1();
}

id SBLogSystemActionControl()
{
  if (qword_204A8 != -1) {
    dispatch_once(&qword_204A8, &stru_18FC0);
  }
  v0 = (void *)qword_204A0;

  return v0;
}

void sub_8354(id a1)
{
  qword_204A0 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemActionControl");

  _objc_release_x1();
}

id SBLogSystemActionDataSource()
{
  if (qword_204B8 != -1) {
    dispatch_once(&qword_204B8, &stru_18FE0);
  }
  v0 = (void *)qword_204B0;

  return v0;
}

void sub_83F0(id a1)
{
  qword_204B0 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemActionDataSource");

  _objc_release_x1();
}

id SBLogSystemActionExecution()
{
  if (qword_1DB10 != -1) {
    dispatch_once(&qword_1DB10, &stru_19000);
  }
  v0 = (void *)qword_1DB08;

  return v0;
}

void sub_848C(id a1)
{
  qword_1DB08 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemActionExecution");

  _objc_release_x1();
}

id SBLogSystemActionPreviewing()
{
  if (qword_1DB20 != -1) {
    dispatch_once(&qword_1DB20, &stru_19020);
  }
  v0 = (void *)qword_1DB18;

  return v0;
}

void sub_8528(id a1)
{
  qword_1DB18 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemActionPreviewing");

  _objc_release_x1();
}

id SBLogSystemActionSuppression()
{
  if (qword_204C8 != -1) {
    dispatch_once(&qword_204C8, &stru_19040);
  }
  v0 = (void *)qword_204C0;

  return v0;
}

void sub_85C4(id a1)
{
  qword_204C0 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemActionSuppression");

  _objc_release_x1();
}

id SBLogSystemApertureController()
{
  if (qword_204D8 != -1) {
    dispatch_once(&qword_204D8, &stru_19060);
  }
  v0 = (void *)qword_204D0;

  return v0;
}

void sub_8660(id a1)
{
  qword_204D0 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemApertureController");

  _objc_release_x1();
}

id SBLogSystemApertureContainer()
{
  if (qword_204E8 != -1) {
    dispatch_once(&qword_204E8, &stru_19080);
  }
  v0 = (void *)qword_204E0;

  return v0;
}

void sub_86FC(id a1)
{
  qword_204E0 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemApertureContainer");

  _objc_release_x1();
}

id SBLogSystemApertureNotice()
{
  if (qword_204F8 != -1) {
    dispatch_once(&qword_204F8, &stru_190A0);
  }
  v0 = (void *)qword_204F0;

  return v0;
}

void sub_8798(id a1)
{
  qword_204F0 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemApertureNotice");

  _objc_release_x1();
}

id SBLogSystemAperturePills()
{
  if (qword_20508 != -1) {
    dispatch_once(&qword_20508, &stru_190C0);
  }
  v0 = (void *)qword_20500;

  return v0;
}

void sub_8834(id a1)
{
  qword_20500 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePills");

  _objc_release_x1();
}

id SBLogSystemApertureLocalElement()
{
  if (qword_1DB30 != -1) {
    dispatch_once(&qword_1DB30, &stru_190E0);
  }
  v0 = (void *)qword_1DB28;

  return v0;
}

void sub_88D0(id a1)
{
  qword_1DB28 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemApertureLocalElement");

  _objc_release_x1();
}

id SBLogSystemApertureLockElement()
{
  if (qword_20518 != -1) {
    dispatch_once(&qword_20518, &stru_19100);
  }
  v0 = (void *)qword_20510;

  return v0;
}

void sub_896C(id a1)
{
  qword_20510 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemApertureLockElement");

  _objc_release_x1();
}

id SBLogSystemApertureMediation()
{
  if (qword_20528 != -1) {
    dispatch_once(&qword_20528, &stru_19120);
  }
  v0 = (void *)qword_20520;

  return v0;
}

void sub_8A08(id a1)
{
  qword_20520 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemApertureMediation");

  _objc_release_x1();
}

id SBLogSystemApertureOrientation()
{
  if (qword_20538 != -1) {
    dispatch_once(&qword_20538, &stru_19140);
  }
  v0 = (void *)qword_20530;

  return v0;
}

void sub_8AA4(id a1)
{
  qword_20530 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemApertureOrientation");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStack()
{
  if (qword_20548 != -1) {
    dispatch_once(&qword_20548, &stru_19160);
  }
  v0 = (void *)qword_20540;

  return v0;
}

void sub_8B40(id a1)
{
  qword_20540 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStack");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackMutation()
{
  if (qword_20558 != -1) {
    dispatch_once(&qword_20558, &stru_19180);
  }
  v0 = (void *)qword_20550;

  return v0;
}

void sub_8BDC(id a1)
{
  qword_20550 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackMutation");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackSettling()
{
  if (qword_20568 != -1) {
    dispatch_once(&qword_20568, &stru_191A0);
  }
  v0 = (void *)qword_20560;

  return v0;
}

void sub_8C78(id a1)
{
  qword_20560 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackSettling");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackElements()
{
  if (qword_20578 != -1) {
    dispatch_once(&qword_20578, &stru_191C0);
  }
  v0 = (void *)qword_20570;

  return v0;
}

void sub_8D14(id a1)
{
  qword_20570 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackElements");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackRenderingCloning()
{
  if (qword_20588 != -1) {
    dispatch_once(&qword_20588, &stru_191E0);
  }
  v0 = (void *)qword_20580;

  return v0;
}

void sub_8DB0(id a1)
{
  qword_20580 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackRenderingCloning");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackMitosis()
{
  if (qword_1DB40 != -1) {
    dispatch_once(&qword_1DB40, &stru_19200);
  }
  v0 = (void *)qword_1DB38;

  return v0;
}

void sub_8E4C(id a1)
{
  qword_1DB38 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackMitosis");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackSequencedBehaviors()
{
  if (qword_20598 != -1) {
    dispatch_once(&qword_20598, &stru_19220);
  }
  v0 = (void *)qword_20590;

  return v0;
}

void sub_8EE8(id a1)
{
  qword_20590 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackSequencedBehaviors");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackGestures()
{
  if (qword_205A8 != -1) {
    dispatch_once(&qword_205A8, &stru_19240);
  }
  v0 = (void *)qword_205A0;

  return v0;
}

void sub_8F84(id a1)
{
  qword_205A0 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackGestures");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackPruning()
{
  if (qword_205B8 != -1) {
    dispatch_once(&qword_205B8, &stru_19260);
  }
  v0 = (void *)qword_205B0;

  return v0;
}

void sub_9020(id a1)
{
  qword_205B0 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackPruning");

  _objc_release_x1();
}

id SBLogSystemAperturePreferencesStackDynamicsAnimations()
{
  if (qword_1DB50 != -1) {
    dispatch_once(&qword_1DB50, &stru_19280);
  }
  v0 = (void *)qword_1DB48;

  return v0;
}

void sub_90BC(id a1)
{
  qword_1DB48 = (uint64_t)os_log_create(SBLoggingSubsystem, "SystemAperturePreferencesStackDynamicsAnimations");

  _objc_release_x1();
}

id SBLogCoverGesture()
{
  if (qword_1DB60 != -1) {
    dispatch_once(&qword_1DB60, &stru_192A0);
  }
  v0 = (void *)qword_1DB58;

  return v0;
}

void sub_9158(id a1)
{
  qword_1DB58 = (uint64_t)os_log_create(SBLoggingSubsystem, "CoverGesture");

  _objc_release_x1();
}

id SBLogButtonsHome()
{
  if (qword_205C8 != -1) {
    dispatch_once(&qword_205C8, &stru_192C0);
  }
  v0 = (void *)qword_205C0;

  return v0;
}

void sub_91F4(id a1)
{
  qword_205C0 = (uint64_t)os_log_create(SBButtonLoggingSubsystem, "Home");

  _objc_release_x1();
}

id SBLogButtonsLock()
{
  if (qword_205D8 != -1) {
    dispatch_once(&qword_205D8, &stru_192E0);
  }
  v0 = (void *)qword_205D0;

  return v0;
}

void sub_928C(id a1)
{
  qword_205D0 = (uint64_t)os_log_create(SBButtonLoggingSubsystem, "Lock");

  _objc_release_x1();
}

id SBLogButtonsVolume()
{
  if (qword_205E8 != -1) {
    dispatch_once(&qword_205E8, &stru_19300);
  }
  v0 = (void *)qword_205E0;

  return v0;
}

void sub_9324(id a1)
{
  qword_205E0 = (uint64_t)os_log_create(SBButtonLoggingSubsystem, "Volume");

  _objc_release_x1();
}

id SBLogButtonsRinger()
{
  if (qword_205F8 != -1) {
    dispatch_once(&qword_205F8, &stru_19320);
  }
  v0 = (void *)qword_205F0;

  return v0;
}

void sub_93BC(id a1)
{
  qword_205F0 = (uint64_t)os_log_create(SBButtonLoggingSubsystem, "Ringer");

  _objc_release_x1();
}

id SBLogButtonsCombo()
{
  if (qword_20608 != -1) {
    dispatch_once(&qword_20608, &stru_19340);
  }
  v0 = (void *)qword_20600;

  return v0;
}

void sub_9454(id a1)
{
  qword_20600 = (uint64_t)os_log_create(SBButtonLoggingSubsystem, "Combo");

  _objc_release_x1();
}

id SBLogButtonsInteraction()
{
  if (qword_20618 != -1) {
    dispatch_once(&qword_20618, &stru_19360);
  }
  v0 = (void *)qword_20610;

  return v0;
}

void sub_94EC(id a1)
{
  qword_20610 = (uint64_t)os_log_create(SBButtonLoggingSubsystem, "Interaction");

  _objc_release_x1();
}

id SBLogButtonsCamera()
{
  if (qword_20628 != -1) {
    dispatch_once(&qword_20628, &stru_19380);
  }
  v0 = (void *)qword_20620;

  return v0;
}

void sub_9584(id a1)
{
  qword_20620 = (uint64_t)os_log_create(SBButtonLoggingSubsystem, "Camera");

  _objc_release_x1();
}

id SBLogButtonsCapture()
{
  if (qword_20638 != -1) {
    dispatch_once(&qword_20638, &stru_193A0);
  }
  v0 = (void *)qword_20630;

  return v0;
}

void sub_961C(id a1)
{
  qword_20630 = (uint64_t)os_log_create(SBButtonLoggingSubsystem, "Capture");

  _objc_release_x1();
}

id SBLogStationaryMotionDetector()
{
  if (qword_1DB70 != -1) {
    dispatch_once(&qword_1DB70, &stru_193C0);
  }
  v0 = (void *)qword_1DB68;

  return v0;
}

void sub_96B4(id a1)
{
  qword_1DB68 = (uint64_t)os_log_create(SBLoggingSubsystem, "StationaryMotionDetector");

  _objc_release_x1();
}

id SBLogButtonHintingUI()
{
  if (qword_20648 != -1) {
    dispatch_once(&qword_20648, &stru_193E0);
  }
  v0 = (void *)qword_20640;

  return v0;
}

void sub_9750(id a1)
{
  qword_20640 = (uint64_t)os_log_create(SBLoggingSubsystem, "ButtonHintingUI");

  _objc_release_x1();
}

id SBLogCameraCaptureLaunch()
{
  if (qword_1DB80 != -1) {
    dispatch_once(&qword_1DB80, &stru_19400);
  }
  v0 = (void *)qword_1DB78;

  return v0;
}

void sub_97EC(id a1)
{
  qword_1DB78 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraCaptureLaunch");

  _objc_release_x1();
}

id SBLogCameraCaptureSuppression()
{
  if (qword_1DB90 != -1) {
    dispatch_once(&qword_1DB90, &stru_19420);
  }
  v0 = (void *)qword_1DB88;

  return v0;
}

void sub_9888(id a1)
{
  qword_1DB88 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraCaptureSuppression");

  _objc_release_x1();
}

id SBLogCameraCaptureButtonScanMode()
{
  if (qword_1DBA0 != -1) {
    dispatch_once(&qword_1DBA0, &stru_19440);
  }
  v0 = (void *)qword_1DB98;

  return v0;
}

void sub_9924(id a1)
{
  qword_1DB98 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraCaptureButtonScanMode");

  _objc_release_x1();
}

id SBLogCameraCaptureOverlay()
{
  if (qword_20658 != -1) {
    dispatch_once(&qword_20658, &stru_19460);
  }
  v0 = (void *)qword_20650;

  return v0;
}

void sub_99C0(id a1)
{
  qword_20650 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraCaptureOverlay");

  _objc_release_x1();
}

id SBLogCameraCaptureLaunchAnimation()
{
  if (qword_1DBB0 != -1) {
    dispatch_once(&qword_1DBB0, &stru_19480);
  }
  v0 = (void *)qword_1DBA8;

  return v0;
}

void sub_9A5C(id a1)
{
  qword_1DBA8 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraCaptureLaunchAnimation");

  _objc_release_x1();
}

id SBLogCameraCaptureRestriction()
{
  if (qword_1DBC0 != -1) {
    dispatch_once(&qword_1DBC0, &stru_194A0);
  }
  v0 = (void *)qword_1DBB8;

  return v0;
}

void sub_9AF8(id a1)
{
  qword_1DBB8 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraCaptureRestriction");

  _objc_release_x1();
}

id SBLogCameraCaptureStudyLogs()
{
  if (qword_1DBD0 != -1) {
    dispatch_once(&qword_1DBD0, &stru_194C0);
  }
  v0 = (void *)qword_1DBC8;

  return v0;
}

void sub_9B94(id a1)
{
  qword_1DBC8 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraCaptureStudyLogs");

  _objc_release_x1();
}

id SBLogCameraCaptureSessionLogs()
{
  if (qword_1DBE0 != -1) {
    dispatch_once(&qword_1DBE0, &stru_194E0);
  }
  v0 = (void *)qword_1DBD8;

  return v0;
}

void sub_9C30(id a1)
{
  qword_1DBD8 = (uint64_t)os_log_create(SBLoggingSubsystem, "CameraCaptureSessionLogs");

  _objc_release_x1();
}

id SBLogAmbientPresentation()
{
  if (qword_20668 != -1) {
    dispatch_once(&qword_20668, &stru_19500);
  }
  v0 = (void *)qword_20660;

  return v0;
}

void sub_9CCC(id a1)
{
  qword_20660 = (uint64_t)os_log_create(SBLoggingSubsystem, "AmbientPresentation");

  _objc_release_x1();
}

id SBLogAmbientChargerConnection()
{
  if (qword_1DBF0 != -1) {
    dispatch_once(&qword_1DBF0, &stru_19520);
  }
  v0 = (void *)qword_1DBE8;

  return v0;
}

void sub_9D68(id a1)
{
  qword_1DBE8 = (uint64_t)os_log_create(SBLoggingSubsystem, "AmbientChargerConnection");

  _objc_release_x1();
}

id SBLogAmbientIdleTimer()
{
  if (qword_20678 != -1) {
    dispatch_once(&qword_20678, &stru_19540);
  }
  v0 = (void *)qword_20670;

  return v0;
}

void sub_9E04(id a1)
{
  qword_20670 = (uint64_t)os_log_create(SBLoggingSubsystem, "AmbientIdleTimer");

  _objc_release_x1();
}

id SBLogAmbientAuthentication()
{
  if (qword_20688 != -1) {
    dispatch_once(&qword_20688, &stru_19560);
  }
  v0 = (void *)qword_20680;

  return v0;
}

void sub_9EA0(id a1)
{
  qword_20680 = (uint64_t)os_log_create(SBLoggingSubsystem, "AmbientAuthentication");

  _objc_release_x1();
}

id SBLogAmbientDeviceState()
{
  if (qword_20698 != -1) {
    dispatch_once(&qword_20698, &stru_19580);
  }
  v0 = (void *)qword_20690;

  return v0;
}

void sub_9F3C(id a1)
{
  qword_20690 = (uint64_t)os_log_create(SBLoggingSubsystem, "AmbientDeviceState");

  _objc_release_x1();
}

id SBLogBiome()
{
  if (qword_1DC00 != -1) {
    dispatch_once(&qword_1DC00, &stru_195A0);
  }
  v0 = (void *)qword_1DBF8;

  return v0;
}

void sub_9FD8(id a1)
{
  qword_1DBF8 = (uint64_t)os_log_create(SBLoggingSubsystem, "Biome");

  _objc_release_x1();
}

id SBLogContinuityDisplay()
{
  if (qword_1DC10 != -1) {
    dispatch_once(&qword_1DC10, &stru_195C0);
  }
  v0 = (void *)qword_1DC08;

  return v0;
}

void sub_A074(id a1)
{
  qword_1DC08 = (uint64_t)os_log_create(SBLoggingSubsystem, "ContinuityDisplay");

  _objc_release_x1();
}

id SBLogContinuitySession()
{
  if (qword_206A8 != -1) {
    dispatch_once(&qword_206A8, &stru_195E0);
  }
  v0 = (void *)qword_206A0;

  return v0;
}

void sub_A110(id a1)
{
  qword_206A0 = (uint64_t)os_log_create(SBLoggingSubsystem, "ContinuitySession");

  _objc_release_x1();
}

id SBLogAppProtection()
{
  if (qword_206B8 != -1) {
    dispatch_once(&qword_206B8, &stru_19600);
  }
  v0 = (void *)qword_206B0;

  return v0;
}

void sub_A1AC(id a1)
{
  qword_206B0 = (uint64_t)os_log_create(SBLoggingSubsystem, "AppProtection");

  _objc_release_x1();
}

id SBLogCaptureApplication()
{
  if (qword_1DC20 != -1) {
    dispatch_once(&qword_1DC20, &stru_19620);
  }
  v0 = (void *)qword_1DC18;

  return v0;
}

void sub_A248(id a1)
{
  qword_1DC18 = (uint64_t)os_log_create(SBLoggingSubsystem, "CaptureApplication");

  _objc_release_x1();
}

id SBLogCaptureViewfinderMonitor()
{
  if (qword_206C8 != -1) {
    dispatch_once(&qword_206C8, &stru_19640);
  }
  v0 = (void *)qword_206C0;

  return v0;
}

void sub_A2E4(id a1)
{
  qword_206C0 = (uint64_t)os_log_create(SBLoggingSubsystem, "CaptureViewfinderMonitor");

  _objc_release_x1();
}

id SBLogPrototyping()
{
  if (qword_1DC30 != -1) {
    dispatch_once(&qword_1DC30, &stru_19660);
  }
  v0 = (void *)qword_1DC28;

  return v0;
}

void sub_A380(id a1)
{
  qword_1DC28 = (uint64_t)os_log_create(SBLoggingSubsystem, "Prototyping");

  _objc_release_x1();
}

id SBLogSceneRelevancy()
{
  if (qword_1DC40 != -1) {
    dispatch_once(&qword_1DC40, &stru_19680);
  }
  v0 = (void *)qword_1DC38;

  return v0;
}

void sub_A41C(id a1)
{
  qword_1DC38 = (uint64_t)os_log_create(SBLoggingSubsystem, "SceneRelevancy");

  _objc_release_x1();
}

void sub_AE48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_AE6C(uint64_t a1, void *a2)
{
  id v16 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BSDispatchQueueAssertMain();
  v4 = [WeakRetained _cachedSceneDataStores];
  id v5 = [v4 objectForKey:*(void *)(a1 + 32)];

  if (v5 == v16)
  {
    if (!WeakRetained) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    char v14 = [WeakRetained _cachedSceneDataStores];
    int v15 = [v14 objectForKey:*(void *)(a1 + 32)];
    [v10 handleFailureInMethod:v11, v12, @"FBSApplicationDataStore+SceneStorage.m", 128, @"Expected store (%p) for identifier: %@, but instead had store: (%p)", v16, v13, v15 object file lineNumber description];

    if (!WeakRetained) {
      goto LABEL_6;
    }
  }
  char v6 = [v16 _data];
  id v7 = [v6 count];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    __n128 v9 = [v16 _data];
    [WeakRetained _modifyPersistentSceneData:1 identifier:v8 data:v9];
  }
  else
  {
    [WeakRetained _modifyPersistentSceneData:0 identifier:v8 data:0];
  }
LABEL_6:
}

void sub_B99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

intptr_t sub_B9D4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)FBSDisplayMonitor);
  char v3 = [v2 mainConfiguration];
  [v3 pointScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;

  [v2 invalidate];
  id v5 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v5);
}

void sub_C198(_Unwind_Exception *a1)
{
}

void sub_C1B4(id a1, NSURL *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = a2;
  id v5 = [(NSURL *)v4 pathExtension];
  char v6 = [v5 lowercaseString];

  if ([v6 isEqualToString:@"plist"])
  {
    id v18 = 0;
    id v7 = +[NSData dataWithContentsOfURL:v4 options:0 error:&v18];
    id v8 = v18;
    if (v7)
    {
      __n128 v9 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 objectForKeyedSubscript:@"applicationShortcutItems"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v12 = [v9 objectForKeyedSubscript:@"applicationShortcutItems"];
          if ((unint64_t)[v12 count] > 0xA)
          {
            uint64_t v13 = [v9 mutableCopy];
            char v14 = objc_msgSend(v12, "subarrayWithRange:", 0, 10);
            [v13 setObject:v14 forKeyedSubscript:@"applicationShortcutItems"];

            __n128 v9 = v13;
          }
          int v15 = [(NSURL *)v4 lastPathComponent];
          id v16 = [v15 stringByDeletingPathExtension];

          double v17 = +[FBSApplicationDataStore storeForApplication:v16];
          [v17 setArchivedObject:v9 forKey:@"SBApplicationShortcutItems"];
        }
      }
    }
    else
    {
      __n128 v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1082C((uint64_t)v8, v4, v9);
      }
    }
  }
}

void sub_CE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_CE80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_CE90(uint64_t a1)
{
}

void sub_CE98(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10D90();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_CF1C(id a1, SBDataMigratorCleanuppableDataStore *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = a2;
  if (objc_opt_respondsToSelector()) {
    [(SBDataMigratorCleanuppableDataStore *)v4 performSelector:"cleanup"];
  }
}

void sub_D0E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_D108(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_D124(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sub_D79C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveQueue_save");
}

id sub_DCC8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveQueue_save");
}

void sub_E274(id a1)
{
  byte_1DC48 = MGGetBoolAnswer();
}

void sub_E330(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_ED94(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performGridSizeClassMigration:a2];
}

id sub_EED8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performNewsWidgetRestoration:a2];
}

void sub_F4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_F508(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v9 = kSBIconStateCustomIconElementTypeKey;
    uint64_t v10 = [v8 objectForKey:kSBIconStateCustomIconElementTypeKey];
    unsigned int v11 = [v10 isEqualToString:kSBIconStateCustomIconElementTypeWidget];

    if (v11)
    {
      uint64_t v12 = [v8 objectForKey:kSBIconStateIconBundleIdentifier];
      uint64_t v13 = [*(id *)(a1 + 32) _defaultTodayListWidgetBundleIdentifiersExceptForNews];
      char v14 = [v13 objectAtIndexedSubscript:a3];
      unsigned int v15 = [v12 isEqualToString:v14];

      id v16 = [v8 objectForKey:kSBIconStateGridSizeClassIdentifier];
      double v17 = [*(id *)(a1 + 32) _defaultTodayListWidgetGridSizeExceptForNews];
      id v18 = [v17 objectAtIndexedSubscript:a3];
      unsigned __int8 v19 = [v16 isEqualToString:v18];

      if (v15 && (v19 & 1) != 0) {
        goto LABEL_22;
      }
      v20 = SBLogCommon();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      __int16 v36 = 0;
      v21 = "[NewsIconStateMigration] Cannot restore News widget - today list widget icon ordering differs from default today list.";
      v22 = (uint8_t *)&v36;
    }
    else
    {
      v24 = [v8 objectForKey:v9];
      if ([v24 isEqualToString:kSBIconStateCustomIconElementTypeBatteries])
      {
        v25 = [v8 objectForKey:kSBIconStateGridSizeClassIdentifier];
        v26 = [*(id *)(a1 + 32) _defaultTodayListWidgetGridSizeExceptForNews];
        v27 = [v26 objectAtIndexedSubscript:a3];
        unsigned __int8 v28 = [v25 isEqualToString:v27];

        if (v28) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      v29 = [v8 objectForKey:kSBIconStateCustomIconElementKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [v8 objectForKey:kSBIconStateGridSizeClassIdentifier];
        v31 = [*(id *)(a1 + 32) _defaultTodayListWidgetGridSizeExceptForNews];
        v32 = [v31 objectAtIndexedSubscript:a3];
        unsigned __int8 v33 = [v30 isEqualToString:v32];

        if (v33) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      v20 = SBLogCommon();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        *a4 = 1;
LABEL_22:

        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      v21 = "[NewsIconStateMigration] Cannot restore News widget - non-default element type in today list.";
      v22 = buf;
    }
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    goto LABEL_21;
  }
  v23 = SBLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] Cannot restore News widget - widget icon is not a dictionary representation.", v34, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  *a4 = 1;
LABEL_23:
}

intptr_t sub_10260(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_105E8(void *a1)
{
  char v1 = [a1 localizedDescription];
  sub_50FC();
  sub_50DC(&dword_0, v2, v3, "[CalendarWidgetMigrator] Error saving migrated desired icon state: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1066C(void *a1)
{
  char v1 = [a1 localizedDescription];
  sub_50FC();
  sub_50DC(&dword_0, v2, v3, "[CalendarWidgetMigrator] Error loading desired icon state: %{public}@", v4, v5, v6, v7, v8);
}

void sub_106F0(void *a1)
{
  char v1 = [a1 localizedDescription];
  sub_50FC();
  sub_50DC(&dword_0, v2, v3, "[CalendarWidgetMigrator] Error saving migrated current icon state: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10774(void *a1)
{
  char v1 = [a1 localizedDescription];
  sub_50FC();
  sub_50DC(&dword_0, v2, v3, "[CalendarWidgetMigrator] Error loading current icon state: %{public}@", v4, v5, v6, v7, v8);
}

void sub_107F8()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "Unable to save new migrator last build version.", v2, v3, v4, v5, v6);
}

void sub_1082C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 lastPathComponent];
  uint8_t v6 = [v5 stringByDeletingPathExtension];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Error: %@ migrating dynamic quick actions for app %@", (uint8_t *)&v7, 0x16u);
}

void sub_108F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10960()
{
  sub_50FC();
  sub_D108(&dword_0, v0, v1, "[informPaperBoardOfMigration] restoredBackupBuildVersionString: %@", v2, v3, v4, v5, v6);
}

void sub_109C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10A38()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "[performPosterBoardMigration] skipping posterboard migration (ephemeral multiuser)", v2, v3, v4, v5, v6);
}

void sub_10A6C()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "[performPosterBoardMigration] posterboard migrations complete", v2, v3, v4, v5, v6);
}

void sub_10AA0()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "[performPosterBoardMigration] marking tint color migration complete", v2, v3, v4, v5, v6);
}

void sub_10AD4()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "[performPosterBoardMigration] tint color migration failed; migration error prevented completion",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10B08()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "[performPosterBoardMigration] running posterboard migration (if needed)", v2, v3, v4, v5, v6);
}

void sub_10B3C()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "[performPosterBoardMigration] tint style migration is has occured; will not do again.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10B70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10BE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10C58()
{
  sub_50FC();
  sub_D108(&dword_0, v0, v1, "[performPosterBoardMigration] tint color migrating to %{public}@", v2, v3, v4, v5, v6);
}

void sub_10CC0()
{
  sub_50FC();
  sub_D108(&dword_0, v0, v1, "[performPosterBoardMigration] home screen icon style migration migrating to %{public}@", v2, v3, v4, v5, v6);
}

void sub_10D28()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "[performPosterBoardMigration] tint style migration is necessary!", v2, v3, v4, v5, v6);
}

void sub_10D5C()
{
  sub_D0FC();
  sub_D0E0(&dword_0, v0, v1, "[performPosterBoardMigration] checking if tint style migration is necessary...", v2, v3, v4, v5, v6);
}

void sub_10D90()
{
  sub_50FC();
  sub_D108(&dword_0, v0, v1, "[performPosterBoardMigration] finished posterboard migration: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10DF8(void *a1)
{
  uint64_t v1 = [a1 bundleIdentifier];
  sub_E318();
  sub_E330(&dword_0, v2, v3, "%{public}@: Ignoring request to save shortcut items because existing shortcuts could not be read from disk: %@", v4, v5, v6, v7, v8);
}

void sub_10E88(void *a1)
{
  uint64_t v1 = [a1 bundleIdentifier];
  sub_E318();
  sub_E330(&dword_0, v2, v3, "%{public}@: Unexpected data from store: %@", v4, v5, v6, v7, v8);
}

void sub_10F18(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 bundleIdentifier];
  int v6 = 138543874;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  __int16 v10 = 2048;
  uint64_t v11 = 10;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%{public}@: SBApplicationShortcutStore has too many app shortcuts (%ld); discarding all shortcuts after first %ld.",
    (uint8_t *)&v6,
    0x20u);
}

void sub_10FD4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%@: SBApplicationShortcutStore suppressing truncation for some reason.", (uint8_t *)&v4, 0xCu);
}

void sub_1106C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[NewsIconStateMigration] Migrated news widget(s) in desired icon state.", v1, 2u);
}

void sub_110B0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_50FC();
  sub_50DC(&dword_0, v2, v3, "[NewsIconStateMigration] Error saving migrated desired icon state: %{public}@", v4, v5, v6, v7, v8);
}

void sub_11134(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_50FC();
  sub_50DC(&dword_0, v2, v3, "[NewsIconStateMigration] Error loading desired icon state: %{public}@", v4, v5, v6, v7, v8);
}

void sub_111B8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_50FC();
  sub_50DC(&dword_0, v2, v3, "[NewsIconStateMigration] Error saving migrated current icon state: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1123C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_50FC();
  sub_50DC(&dword_0, v2, v3, "[NewsIconStateMigration] Error loading current icon state: %{public}@", v4, v5, v6, v7, v8);
}

uint64_t BSCGFloatEpsilon()
{
  return _BSCGFloatEpsilon();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return _BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
}

uint64_t BSDeserializeCFValueFromXPCDictionaryWithKey()
{
  return _BSDeserializeCFValueFromXPCDictionaryWithKey();
}

uint64_t BSDispatchMain()
{
  return _BSDispatchMain();
}

uint64_t BSDispatchQueueAssertMain()
{
  return _BSDispatchQueueAssertMain();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return _BSDispatchQueueCreateSerial();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return _BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
}

uint64_t BSSerializeCFValueToXPCDictionaryWithKey()
{
  return _BSSerializeCFValueToXPCDictionaryWithKey();
}

uint64_t BSSizeRoundForScale()
{
  return _BSSizeRoundForScale();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SBFEffectiveDeviceClass()
{
  return _SBFEffectiveDeviceClass();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return _SBFEffectiveHomeButtonType();
}

uint64_t SBLogAppShortcuts()
{
  return _SBLogAppShortcuts();
}

uint64_t SBLogCommon()
{
  return _SBLogCommon();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return ___sb__mainScreenReferenceBounds();
}

uint64_t __sb__runningInSpringBoard()
{
  return ___sb__runningInSpringBoard();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

void objc_storeStrong(id *location, id obj)
{
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

id objc_msgSend_BSColor(void *a1, const char *a2, ...)
{
  return [a1 BSColor];
}

id objc_msgSend_CADisplay(void *a1, const char *a2, ...)
{
  return [a1 CADisplay];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__cachedSceneDataStores(void *a1, const char *a2, ...)
{
  return [a1 _cachedSceneDataStores];
}

id objc_msgSend__data(void *a1, const char *a2, ...)
{
  return [a1 _data];
}

id objc_msgSend__defaultTodayListWidgetBundleIdentifiersExceptForNews(void *a1, const char *a2, ...)
{
  return [a1 _defaultTodayListWidgetBundleIdentifiersExceptForNews];
}

id objc_msgSend__defaultTodayListWidgetGridSizeExceptForNews(void *a1, const char *a2, ...)
{
  return [a1 _defaultTodayListWidgetGridSizeExceptForNews];
}

id objc_msgSend__fetchPersistedSceneDataStores(void *a1, const char *a2, ...)
{
  return [a1 _fetchPersistedSceneDataStores];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__invokeChangeHandler(void *a1, const char *a2, ...)
{
  return [a1 _invokeChangeHandler];
}

id objc_msgSend__needsTigrisDataStoreMigration(void *a1, const char *a2, ...)
{
  return [a1 _needsTigrisDataStoreMigration];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return [a1 _referenceBounds];
}

id objc_msgSend__removeAllPersistentSceneData(void *a1, const char *a2, ...)
{
  return [a1 _removeAllPersistentSceneData];
}

id objc_msgSend__saveNewLastBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 _saveNewLastBuildVersion];
}

id objc_msgSend__store(void *a1, const char *a2, ...)
{
  return [a1 _store];
}

id objc_msgSend_allInstalledApplications(void *a1, const char *a2, ...)
{
  return [a1 allInstalledApplications];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allSplashBoardApplications(void *a1, const char *a2, ...)
{
  return [a1 allSplashBoardApplications];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_applicationsWithAvailableStores(void *a1, const char *a2, ...)
{
  return [a1 applicationsWithAvailableStores];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_availableModes(void *a1, const char *a2, ...)
{
  return [a1 availableModes];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return [a1 currentMode];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_dataStores(void *a1, const char *a2, ...)
{
  return [a1 dataStores];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteAllSnapshots(void *a1, const char *a2, ...)
{
  return [a1 deleteAllSnapshots];
}

id objc_msgSend_deleteAllSnapshotsIfScreenSizeChanged(void *a1, const char *a2, ...)
{
  return [a1 deleteAllSnapshotsIfScreenSizeChanged];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didMigrateBackupFromDifferentDevice(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBackupFromDifferentDevice];
}

id objc_msgSend_homeButtonType(void *a1, const char *a2, ...)
{
  return [a1 homeButtonType];
}

id objc_msgSend_informPaperBoardOfMigration(void *a1, const char *a2, ...)
{
  return [a1 informPaperBoardOfMigration];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isEphemeralMultiUser];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastSystemBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 lastSystemBuildVersion];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainConfiguration(void *a1, const char *a2, ...)
{
  return [a1 mainConfiguration];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return [a1 mainDisplay];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_majorBuildLetterString(void *a1, const char *a2, ...)
{
  return [a1 majorBuildLetterString];
}

id objc_msgSend_majorBuildNumber(void *a1, const char *a2, ...)
{
  return [a1 majorBuildNumber];
}

id objc_msgSend_migrateIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 migrateIfNecessary];
}

id objc_msgSend_minorBuildNumber(void *a1, const char *a2, ...)
{
  return [a1 minorBuildNumber];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return [a1 naturalSize];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_performALSMigration(void *a1, const char *a2, ...)
{
  return [a1 performALSMigration];
}

id objc_msgSend_performBadgingDisabledMigration(void *a1, const char *a2, ...)
{
  return [a1 performBadgingDisabledMigration];
}

id objc_msgSend_performBatteryPercentageSettingMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performBatteryPercentageSettingMigrationIfNecessary];
}

id objc_msgSend_performCalendarWidgetIconMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performCalendarWidgetIconMigrationIfNecessary];
}

id objc_msgSend_performDynamicVolumeButtonsMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performDynamicVolumeButtonsMigrationIfNecessary];
}

id objc_msgSend_performIconSizeMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performIconSizeMigrationIfNecessary];
}

id objc_msgSend_performLiftToWakeDefaultsResetIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performLiftToWakeDefaultsResetIfNecessary];
}

id objc_msgSend_performNewsWidgetIconMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performNewsWidgetIconMigrationIfNecessary];
}

id objc_msgSend_performPinnedWidgetsDefaultsResetIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performPinnedWidgetsDefaultsResetIfNecessary];
}

id objc_msgSend_performPosterBoardMigration(void *a1, const char *a2, ...)
{
  return [a1 performPosterBoardMigration];
}

id objc_msgSend_performShortcutStoreMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performShortcutStoreMigrationIfNecessary];
}

id objc_msgSend_performSplashBoardLaunchImagesMigration(void *a1, const char *a2, ...)
{
  return [a1 performSplashBoardLaunchImagesMigration];
}

id objc_msgSend_performTigrisDataStoreMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performTigrisDataStoreMigrationIfNecessary];
}

id objc_msgSend_pointScale(void *a1, const char *a2, ...)
{
  return [a1 pointScale];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preferredMode(void *a1, const char *a2, ...)
{
  return [a1 preferredMode];
}

id objc_msgSend_preferredScale(void *a1, const char *a2, ...)
{
  return [a1 preferredScale];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_restoredBackupBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 restoredBackupBuildVersion];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_splashBoardSystemApplications(void *a1, const char *a2, ...)
{
  return [a1 splashBoardSystemApplications];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringRepresentation(void *a1, const char *a2, ...)
{
  return [a1 stringRepresentation];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeDefaults(void *a1, const char *a2, ...)
{
  return [a1 synchronizeDefaults];
}

id objc_msgSend_systemAppsNeedingMigrationLaunchImages(void *a1, const char *a2, ...)
{
  return [a1 systemAppsNeedingMigrationLaunchImages];
}

id objc_msgSend_truncateIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 truncateIfNecessary];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return [a1 userType];
}

id objc_msgSend_warmUpIcons(void *a1, const char *a2, ...)
{
  return [a1 warmUpIcons];
}