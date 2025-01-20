void sub_225AD4890(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_225AD4A68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_225AD4EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_225AD59A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

uint64_t BRIsInternalInstall()
{
  if (BRIsInternalInstall___onceToken != -1) {
    dispatch_once(&BRIsInternalInstall___onceToken, &__block_literal_global_0);
  }
  return BRIsInternalInstall___internalInstall;
}

uint64_t __BRIsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  BRIsInternalInstall___internalInstall = result;
  return result;
}

uint64_t BRAutomation()
{
  if (BRIsInternalInstall___onceToken != -1) {
    dispatch_once(&BRIsInternalInstall___onceToken, &__block_literal_global_0);
  }
  if (!BRIsInternalInstall___internalInstall) {
    return 0;
  }
  if (CFPreferencesGetAppBooleanValue(@"_ShowInternalAutomationUI", @"com.apple.nanobuddy.automationhelper", 0))
  {
    return 1;
  }
  uint64_t result = CFPreferencesGetAppBooleanValue(@"PairingAutomationDevice", @"com.apple.nanobuddy", 0);
  if (result) {
    return 1;
  }
  return result;
}

id BRGetCurrentMetricIDFromMetricDir()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v0 = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric";
  v1 = [MEMORY[0x263F08850] defaultManager];
  if ([v1 fileExistsAtPath:v0])
  {
    uint64_t v2 = [v1 contentsOfDirectoryAtPath:v0 error:0];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      v5 = 0;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v2);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v8 containsString:@"pairing_metric"])
          {
            id v9 = v8;

            v5 = v9;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id BRGetAllMetricKeysAndValues()
{
  v20[2] = *MEMORY[0x263EF8340];
  v0 = objc_opt_new();
  v1 = NSString;
  v20[0] = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric";
  uint64_t v2 = BRGetCurrentMetricIDFromMetricDir();
  v20[1] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  uint64_t v4 = [v1 pathWithComponents:v3];

  v5 = NSURL;
  uint64_t v6 = NSString;
  v19[0] = v4;
  v19[1] = @"BridgePairingMetricDetails.plist";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v8 = [v6 pathWithComponents:v7];
  id v9 = [v5 fileURLWithPath:v8];

  v10 = NSURL;
  long long v11 = NSString;
  v18[0] = v4;
  v18[1] = @"NRPairingMetricDetails.plist";
  long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  long long v13 = [v11 pathWithComponents:v12];
  long long v14 = [v10 fileURLWithPath:v13];

  v15 = [NSDictionary dictionaryWithContentsOfURL:v9];
  uint64_t v16 = [NSDictionary dictionaryWithContentsOfURL:v14];
  if (v15) {
    [v0 addEntriesFromDictionary:v15];
  }
  if (v16) {
    [v0 addEntriesFromDictionary:v16];
  }

  return v0;
}

uint64_t BRStaleOrNoPairingMetric()
{
  v15[2] = *MEMORY[0x263EF8340];
  v0 = BRGetCurrentMetricIDFromMetricDir();

  if (!v0) {
    return 1;
  }
  v1 = NSString;
  v15[0] = @"/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric";
  uint64_t v2 = BRGetCurrentMetricIDFromMetricDir();
  v15[1] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  uint64_t v4 = [v1 pathWithComponents:v3];

  v5 = NSURL;
  uint64_t v6 = NSString;
  v14[0] = v4;
  v14[1] = @"NRPairingMetricDetails.plist";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v8 = [v6 pathWithComponents:v7];
  id v9 = [v5 fileURLWithPath:v8];

  v10 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:v9];
  long long v11 = [v10 objectForKey:@"MetricSubmitted"];

  BOOL v12 = v11 != 0;
  return v12;
}

uint64_t BRSignInPairingTimeEventForAccountType(void *a1, int a2, int a3)
{
  id v5 = a1;
  if ([v5 isEqualToString:@"iCloud"])
  {
    BOOL v6 = a3 == 0;
    uint64_t v7 = 22;
    if (a3) {
      uint64_t v7 = 23;
    }
    uint64_t v8 = 20;
  }
  else if ([v5 isEqualToString:@"iTunes"])
  {
    BOOL v6 = a3 == 0;
    uint64_t v7 = 27;
    if (a3) {
      uint64_t v7 = 28;
    }
    uint64_t v8 = 25;
  }
  else if ([v5 isEqualToString:@"iMessage"])
  {
    BOOL v6 = a3 == 0;
    uint64_t v7 = 32;
    if (a3) {
      uint64_t v7 = 33;
    }
    uint64_t v8 = 30;
  }
  else
  {
    if (![v5 isEqualToString:@"FaceTime"])
    {
      uint64_t v9 = 49;
      goto LABEL_22;
    }
    BOOL v6 = a3 == 0;
    uint64_t v7 = 37;
    if (a3) {
      uint64_t v7 = 38;
    }
    uint64_t v8 = 35;
  }
  if (!v6) {
    ++v8;
  }
  if (a2) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v7;
  }
LABEL_22:

  return v9;
}

uint64_t BRSignInFailureErrorForAccountType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iCloud"])
  {
    uint64_t v2 = 45;
  }
  else if ([v1 isEqualToString:@"iTunes"])
  {
    uint64_t v2 = 46;
  }
  else if ([v1 isEqualToString:@"iMessage"])
  {
    uint64_t v2 = 47;
  }
  else if ([v1 isEqualToString:@"FaceTime"])
  {
    uint64_t v2 = 48;
  }
  else
  {
    uint64_t v2 = 49;
  }

  return v2;
}

__CFString *BRPairingTimeEventToString(uint64_t a1)
{
  uint64_t v3 = @"UnrecognizedBRPairingTimeEventType";
  uint64_t v4 = kScannedWatchCode;
  switch(a1)
  {
    case 0:
      uint64_t v4 = kNRPairingFailure;
      goto LABEL_78;
    case 1:
      uint64_t v4 = kUserBackedOutAfterNRPairingSuccess;
      goto LABEL_78;
    case 2:
      uint64_t v4 = kNRPairingSuccess;
      goto LABEL_78;
    case 3:
      uint64_t v4 = kGizmoBuild;
      goto LABEL_78;
    case 4:
      uint64_t v4 = kGizmoHW;
      goto LABEL_78;
    case 5:
      uint64_t v4 = kNRSubreason;
      goto LABEL_78;
    case 6:
      goto LABEL_78;
    case 7:
      uint64_t v4 = kUHPPair;
      goto LABEL_78;
    case 8:
      uint64_t v4 = kBeginNRHPPairing;
      goto LABEL_78;
    case 9:
      uint64_t v4 = kFireLockOn;
      goto LABEL_78;
    case 10:
      uint64_t v4 = kSelectedLeftWrist;
      goto LABEL_78;
    case 11:
      uint64_t v4 = kSelectedRestoreChoice;
      goto LABEL_78;
    case 12:
      uint64_t v4 = kStartedActivation;
      goto LABEL_78;
    case 13:
      uint64_t v4 = kWatchActivated;
      goto LABEL_78;
    case 14:
      uint64_t v4 = kTermsPresented;
      goto LABEL_78;
    case 15:
      uint64_t v4 = kPairingEndedBeforeNRPairing;
      goto LABEL_78;
    case 16:
      uint64_t v4 = kEndToEndPairingComplete;
      goto LABEL_78;
    case 17:
      uint64_t v4 = kEndToEndPairingTimed;
      goto LABEL_78;
    case 18:
      uint64_t v4 = kWatchActivationTimed;
      goto LABEL_78;
    case 19:
      uint64_t v4 = kStartSilentSignIn;
      goto LABEL_78;
    case 20:
      uint64_t v4 = kiCloudSilentSignInSuccess;
      goto LABEL_78;
    case 21:
      uint64_t v4 = kiCloudSilentSignTimed;
      goto LABEL_78;
    case 22:
      uint64_t v4 = kiCloudPasswordSignInSuccess;
      goto LABEL_78;
    case 23:
      uint64_t v4 = kiCloudPasswordSignInTimed;
      goto LABEL_78;
    case 24:
      uint64_t v4 = kiCloudPasswordSignInSkipped;
      goto LABEL_78;
    case 25:
      uint64_t v4 = kiTunesSilentSignInSuccess;
      goto LABEL_78;
    case 26:
      uint64_t v4 = kiTunesSilentSignInTimed;
      goto LABEL_78;
    case 27:
      uint64_t v4 = kiTunesPasswordSignInSuccess;
      goto LABEL_78;
    case 28:
      uint64_t v4 = kiTunesPasswordSignInTimed;
      goto LABEL_78;
    case 29:
      uint64_t v4 = kiTunesPasswordSignInSkipped;
      goto LABEL_78;
    case 30:
      uint64_t v4 = kiMessageSilentSignInSuccess;
      goto LABEL_78;
    case 31:
      uint64_t v4 = kiMessageSilentSignInTimed;
      goto LABEL_78;
    case 32:
      uint64_t v4 = kiMessagePasswordSignInSuccess;
      goto LABEL_78;
    case 33:
      uint64_t v4 = kiMessagePasswordSignInTimed;
      goto LABEL_78;
    case 34:
      uint64_t v4 = kiMessagePasswordSignInSkipped;
      goto LABEL_78;
    case 35:
      uint64_t v4 = kFaceTimeSilentSignInSuccess;
      goto LABEL_78;
    case 36:
      uint64_t v4 = kFaceTimeSilentSignInTimed;
      goto LABEL_78;
    case 37:
      uint64_t v4 = kFaceTimePasswordSignInSuccess;
      goto LABEL_78;
    case 38:
      uint64_t v4 = kFaceTimePasswordSignInTimed;
      goto LABEL_78;
    case 39:
      uint64_t v4 = kFaceTimePasswordSignInSkipped;
      goto LABEL_78;
    case 40:
      uint64_t v4 = kSilentSignInSuccess;
      goto LABEL_78;
    case 41:
      uint64_t v4 = kLastControllerAction;
      goto LABEL_78;
    case 42:
      uint64_t v4 = kSignInSuccessful;
      goto LABEL_78;
    case 43:
      uint64_t v4 = kSignInTimed;
      goto LABEL_78;
    case 44:
      uint64_t v4 = kSilentSignInTimed;
      goto LABEL_78;
    case 45:
      uint64_t v4 = kiCloudSignInFailureError;
      goto LABEL_78;
    case 46:
      uint64_t v4 = kiTunesSignInFailureError;
      goto LABEL_78;
    case 47:
      uint64_t v4 = kiMessageSignInFailureError;
      goto LABEL_78;
    case 48:
      uint64_t v4 = kFaceTimeSignInFailureError;
      goto LABEL_78;
    case 49:
      uint64_t v4 = kUnexpectedEvent;
      goto LABEL_78;
    case 50:
      uint64_t v4 = kAutomationFlow;
      goto LABEL_78;
    case 51:
      uint64_t v4 = kAlreadyPairedWatchCount;
      goto LABEL_78;
    case 52:
      uint64_t v4 = kArchivedWatchCount;
      goto LABEL_78;
    case 53:
      uint64_t v4 = kAlreadyTinkerPairedWatchCount;
      goto LABEL_78;
    case 54:
      uint64_t v4 = kTinkerPairing;
      goto LABEL_78;
    case 55:
      uint64_t v4 = kUserBackedOutInSUPane;
      goto LABEL_78;
    case 56:
      uint64_t v4 = kUserBackedOutInSUChoice;
      goto LABEL_78;
    case 57:
      uint64_t v4 = kSelectedUpdateChoice;
      goto LABEL_78;
    case 58:
      uint64_t v4 = kInitiatedSUInstall;
      goto LABEL_78;
    case 59:
      uint64_t v4 = kNoSUFound;
      goto LABEL_78;
    case 60:
      uint64_t v4 = kSUScanErrorCode;
      goto LABEL_78;
    case 61:
      uint64_t v4 = kForcedSU;
      goto LABEL_78;
    case 62:
      uint64_t v4 = BRStartedCDPEnrollment;
      goto LABEL_78;
    case 63:
      uint64_t v4 = BRCDPEnrollmentSuccess;
      goto LABEL_78;
    case 64:
      uint64_t v4 = BRCDPEnrollmentTimed;
      goto LABEL_78;
    case 65:
      uint64_t v4 = BRTinkerSignInErrorCode;
      goto LABEL_78;
    case 66:
      uint64_t v4 = BRTinkerSignInErrorDomain;
      goto LABEL_78;
    case 67:
      uint64_t v4 = BRBridgeAppTerminated;
      goto LABEL_78;
    case 68:
      uint64_t v4 = kIPEComplete;
      goto LABEL_78;
    case 69:
      uint64_t v4 = kInitialSyncBegan;
      goto LABEL_78;
    case 70:
      uint64_t v4 = kUnsupportedCompanionSoftware;
      goto LABEL_78;
    case 71:
      uint64_t v4 = kUnsupportedTinkerHardware;
      goto LABEL_78;
    case 72:
      uint64_t v4 = kCancelledEnterPinPane;
      goto LABEL_78;
    case 74:
      uint64_t v4 = kYorktownEnrolledWatchesCount;
      goto LABEL_78;
    case 75:
      uint64_t v4 = kYorktownEnrollmentSuccess;
      goto LABEL_78;
    case 76:
      uint64_t v4 = kYorktownEnrollmentFailureErrorCode;
      goto LABEL_78;
    case 77:
      uint64_t v4 = kYorktownEnrollmentRetryCount;
LABEL_78:
      uint64_t v3 = *v4;
      break;
    default:
      break;
  }
  return v3;
}

void ___utilityQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("BRReportingSession.queue", v2);
  uint64_t v1 = (void *)_utilityQueue_queue;
  _utilityQueue_queue = (uint64_t)v0;
}

id br_metriccollection_log()
{
  if (br_metriccollection_log_onceToken != -1) {
    dispatch_once(&br_metriccollection_log_onceToken, &__block_literal_global_2);
  }
  dispatch_queue_t v0 = (void *)br_metriccollection_log___logger;

  return v0;
}

uint64_t __br_metriccollection_log_block_invoke()
{
  br_metriccollection_log___logger = (uint64_t)os_log_create("com.apple.BridgeReporting", "metriccollection");

  return MEMORY[0x270F9A758]();
}

void sub_225AD8CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}