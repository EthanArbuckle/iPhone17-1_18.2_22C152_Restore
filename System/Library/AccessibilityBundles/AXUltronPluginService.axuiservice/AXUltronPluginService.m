void sub_38B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_38D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateDisplayOnState];
    id WeakRetained = v2;
  }
}

void sub_3E18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 120));
  _Unwind_Resume(a1);
}

void sub_3EAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorUltronSupport];
}

void sub_3EEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorSoundRecognitionSupport];
}

void sub_3F2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorSoundRecognitionSupport];
}

void sub_3F6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorSoundRecognitionSupport];
}

id _monitorVoiceTriggersSupport(uint64_t a1, void *a2)
{
  return [a2 _monitorVoiceTriggersSupport];
}

void sub_3FB4(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void sub_403C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_4050(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorVoiceTriggersSupport];
}

void sub_4090(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorVoiceTriggersSupport];
}

void sub_40D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorVoiceTriggersSupport];
}

void sub_5330(uint64_t a1)
{
  id v2 = +[AXSDKShotController sharedInstance];
  [v2 kickoffTrainingForDetector:*(void *)(a1 + 32)];
}

void sub_5500(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_5520(id a1)
{
  return a1;
}

void sub_5538(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_5560(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_5580()
{
  return 0;
}

void sub_5594(uint64_t a1, void *a2, NSObject *a3)
{
  v5 = +[NSNumber numberWithInt:a1];
  uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:*a2];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Display status ambiguous: notify_get_state status %@ != NOTIFY_STATUS_OK and state == %@", (uint8_t *)&v7, 0x16u);
}

void sub_5668(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Fail to register for screen state change", v1, 2u);
}

void sub_56AC()
{
  sub_5554();
  sub_5538(&dword_0, v0, v1, "Received message: Monitoring ultron support", v2, v3, v4, v5, v6);
}

void sub_56E0()
{
  sub_5554();
  sub_5538(&dword_0, v0, v1, "Received message: Monitoring sound recognition support", v2, v3, v4, v5, v6);
}

void sub_5714()
{
  sub_5554();
  sub_5538(&dword_0, v0, v1, "Received message: Monitoring voice trigger support", v2, v3, v4, v5, v6);
}

void sub_5748()
{
  v0 = objc_opt_class();
  id v1 = sub_5520(v0);
  sub_5500(&dword_0, v2, v3, "[%@]: Turning OFF Sound Detection b/c feature is OFF in settings.", v4, v5, v6, v7, v8);
}

void sub_57C8()
{
  v0 = objc_opt_class();
  id v1 = sub_5520(v0);
  sub_5500(&dword_0, v2, v3, "[%@]: Pausing Sound Detection.", v4, v5, v6, v7, v8);
}

void sub_5848()
{
  v0 = objc_opt_class();
  id v1 = sub_5520(v0);
  sub_5500(&dword_0, v2, v3, "[%@]: Running Sound Detection.", v4, v5, v6, v7, v8);
}

void sub_58C8()
{
  uint64_t v2 = [(id)sub_5580() identifier];
  _DWORD *v1 = 138412290;
  void *v0 = v2;
  sub_5560(&dword_0, v3, v4, "Unable to remove custom detector with identifier: %@");
}

void sub_5924()
{
  uint64_t v2 = [(id)sub_5580() identifier];
  _DWORD *v1 = 138412290;
  void *v0 = v2;
  sub_5560(&dword_0, v3, v4, "Unable to add custom detector with identifier: %@");
}

void sub_5980()
{
  sub_5554();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Unable to kick off training. Detector ID is nil", v1, 2u);
}

void sub_59C0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to kick off training. Detector ID: %@ does not exist", (uint8_t *)&v2, 0xCu);
}

void sub_5A38(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Handle Message %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AXDeviceSupportsOnDeviceEyeTracking()
{
  return _AXDeviceSupportsOnDeviceEyeTracking();
}

uint64_t AXIsInternalInstall()
{
  return _AXIsInternalInstall();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXLogSoundActions()
{
  return _AXLogSoundActions();
}

uint64_t AXLogUltron()
{
  return _AXLogUltron();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXSDSoundDetectionRequestNotificationAuthorization()
{
  return _AXSDSoundDetectionRequestNotificationAuthorization();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return __AXSAssistiveTouchEnabled();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return __AXSAssistiveTouchScannerEnabled();
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend__deviceSupportsVoiceTriggersWhileDisplayOff(void *a1, const char *a2, ...)
{
  return [a1 _deviceSupportsVoiceTriggersWhileDisplayOff];
}

id objc_msgSend__monitorSoundRecognitionSupport(void *a1, const char *a2, ...)
{
  return [a1 _monitorSoundRecognitionSupport];
}

id objc_msgSend__monitorUltronSupport(void *a1, const char *a2, ...)
{
  return [a1 _monitorUltronSupport];
}

id objc_msgSend__monitorVoiceTriggersSupport(void *a1, const char *a2, ...)
{
  return [a1 _monitorVoiceTriggersSupport];
}

id objc_msgSend__queryIsDisplayOn(void *a1, const char *a2, ...)
{
  return [a1 _queryIsDisplayOn];
}

id objc_msgSend__registerForSoundActionEvents(void *a1, const char *a2, ...)
{
  return [a1 _registerForSoundActionEvents];
}

id objc_msgSend__registerForSpringboardNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForSpringboardNotifications];
}

id objc_msgSend__shouldActivateVoiceTriggerSupportForSwitchControl(void *a1, const char *a2, ...)
{
  return [a1 _shouldActivateVoiceTriggerSupportForSwitchControl];
}

id objc_msgSend__shouldActivateVoiceTriggerSupportForSystem(void *a1, const char *a2, ...)
{
  return [a1 _shouldActivateVoiceTriggerSupportForSystem];
}

id objc_msgSend__shouldActivateVoiceTriggerSupportForVoiceOver(void *a1, const char *a2, ...)
{
  return [a1 _shouldActivateVoiceTriggerSupportForVoiceOver];
}

id objc_msgSend__shouldActiveVoiceTriggerSupportForAssistiveTouch(void *a1, const char *a2, ...)
{
  return [a1 _shouldActiveVoiceTriggerSupportForAssistiveTouch];
}

id objc_msgSend__stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoring];
}

id objc_msgSend__unregisterForSoundActionEvents(void *a1, const char *a2, ...)
{
  return [a1 _unregisterForSoundActionEvents];
}

id objc_msgSend__updateDisplayOnState(void *a1, const char *a2, ...)
{
  return [a1 _updateDisplayOnState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assistiveTouchActionsBySoundAction(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchActionsBySoundAction];
}

id objc_msgSend_assistiveTouchMouseOnDeviceEyeTrackingEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseOnDeviceEyeTrackingEnabled];
}

id objc_msgSend_assistiveTouchSwitches(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchSwitches];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return [a1 batteryState];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCustomDetectors(void *a1, const char *a2, ...)
{
  return [a1 currentCustomDetectors];
}

id objc_msgSend_currentDetectionTypes(void *a1, const char *a2, ...)
{
  return [a1 currentDetectionTypes];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_displayOnMonitor(void *a1, const char *a2, ...)
{
  return [a1 displayOnMonitor];
}

id objc_msgSend_enabledKShotDetectorIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 enabledKShotDetectorIdentifiers];
}

id objc_msgSend_enabledSoundDetectionTypes(void *a1, const char *a2, ...)
{
  return [a1 enabledSoundDetectionTypes];
}

id objc_msgSend_enrollForDataCollection(void *a1, const char *a2, ...)
{
  return [a1 enrollForDataCollection];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isBatteryMonitoringEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBatteryMonitoringEnabled];
}

id objc_msgSend_isDisplayOn(void *a1, const char *a2, ...)
{
  return [a1 isDisplayOn];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notifyToken(void *a1, const char *a2, ...)
{
  return [a1 notifyToken];
}

id objc_msgSend_removeAllListenTypes(void *a1, const char *a2, ...)
{
  return [a1 removeAllListenTypes];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_soundDetectionState(void *a1, const char *a2, ...)
{
  return [a1 soundDetectionState];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_stopListening(void *a1, const char *a2, ...)
{
  return [a1 stopListening];
}

id objc_msgSend_ultronSupportEnabled(void *a1, const char *a2, ...)
{
  return [a1 ultronSupportEnabled];
}

id objc_msgSend_unenrollFromDataCollection(void *a1, const char *a2, ...)
{
  return [a1 unenrollFromDataCollection];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          [v2 unenrollFromDataCollection];
    }
  }
}

- (int)serviceTypeForClientWithIdentifier:(id)a3
{
  return 1;
}

- (VOSCommandManager)commandManager
{
  return self->_commandManager;
}

- (void)setCommandManager:(id)a3
{
}

- (AXPluginDisplayOnMonitor)displayOnMonitor
{
  return self->_displayOnMonitor;
}

- (void)setDisplayOnMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayOnMonitor, 0);
  objc_storeStrong((id *)&self->_commandManager, 0);
}

@end