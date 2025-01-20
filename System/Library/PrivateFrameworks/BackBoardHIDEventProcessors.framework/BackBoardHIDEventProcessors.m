id BKLogMotionEvents()
{
  void *v0;
  uint64_t vars8;

  if (BKLogMotionEvents_onceToken != -1) {
    dispatch_once(&BKLogMotionEvents_onceToken, &__block_literal_global_33);
  }
  v0 = (void *)BKLogMotionEvents___logObj;
  return v0;
}

id BKLogHID()
{
  if (BKLogHID_onceToken != -1) {
    dispatch_once(&BKLogHID_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)BKLogHID___logObj;
  return v0;
}

id BKLogBootUI()
{
  if (BKLogBootUI_onceToken != -1) {
    dispatch_once(&BKLogBootUI_onceToken, &__block_literal_global_225);
  }
  v0 = (void *)BKLogBootUI___logObj;
  return v0;
}

uint64_t __BKLogBootUI_block_invoke()
{
  BKLogBootUI___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "BootUI");
  return MEMORY[0x270F9A758]();
}

id BKLogButton()
{
  if (BKLogButton_onceToken != -1) {
    dispatch_once(&BKLogButton_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)BKLogButton___logObj;
  return v0;
}

uint64_t __BKLogButton_block_invoke()
{
  BKLogButton___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "Button");
  return MEMORY[0x270F9A758]();
}

id BKLogDisplayAnnotations()
{
  if (BKLogDisplayAnnotations_onceToken != -1) {
    dispatch_once(&BKLogDisplayAnnotations_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)BKLogDisplayAnnotations___logObj;
  return v0;
}

uint64_t __BKLogDisplayAnnotations_block_invoke()
{
  BKLogDisplayAnnotations___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "DisplayAnnotations");
  return MEMORY[0x270F9A758]();
}

id BKLogDisplayMonitor()
{
  if (BKLogDisplayMonitor_onceToken != -1) {
    dispatch_once(&BKLogDisplayMonitor_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)BKLogDisplayMonitor___logObj;
  return v0;
}

uint64_t __BKLogDisplayMonitor_block_invoke()
{
  BKLogDisplayMonitor___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "DisplayMonitor");
  return MEMORY[0x270F9A758]();
}

id BKLogGenericGesture()
{
  if (BKLogGenericGesture_onceToken != -1) {
    dispatch_once(&BKLogGenericGesture_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)BKLogGenericGesture___logObj;
  return v0;
}

uint64_t __BKLogGenericGesture_block_invoke()
{
  BKLogGenericGesture___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "GenericGesture");
  return MEMORY[0x270F9A758]();
}

uint64_t __BKLogHID_block_invoke()
{
  BKLogHID___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "HID");
  return MEMORY[0x270F9A758]();
}

id BKLogIdleTimer()
{
  if (BKLogIdleTimer_onceToken != -1) {
    dispatch_once(&BKLogIdleTimer_onceToken, &__block_literal_global_18);
  }
  v0 = (void *)BKLogIdleTimer___logObj;
  return v0;
}

uint64_t __BKLogIdleTimer_block_invoke()
{
  BKLogIdleTimer___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "IdleTimer");
  return MEMORY[0x270F9A758]();
}

id BKLogRenderOverlay()
{
  if (BKLogRenderOverlay_onceToken != -1) {
    dispatch_once(&BKLogRenderOverlay_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)BKLogRenderOverlay___logObj;
  return v0;
}

uint64_t __BKLogRenderOverlay_block_invoke()
{
  BKLogRenderOverlay___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "RenderOverlay");
  return MEMORY[0x270F9A758]();
}

id BKLogHapticFeedback()
{
  if (BKLogHapticFeedback_onceToken != -1) {
    dispatch_once(&BKLogHapticFeedback_onceToken, &__block_literal_global_24);
  }
  v0 = (void *)BKLogHapticFeedback___logObj;
  return v0;
}

uint64_t __BKLogHapticFeedback_block_invoke()
{
  BKLogHapticFeedback___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "HapticFeedback");
  return MEMORY[0x270F9A758]();
}

id BKLogAccelerometer()
{
  if (BKLogAccelerometer_onceToken != -1) {
    dispatch_once(&BKLogAccelerometer_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)BKLogAccelerometer___logObj;
  return v0;
}

uint64_t __BKLogAccelerometer_block_invoke()
{
  BKLogAccelerometer___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "Accelerometer");
  return MEMORY[0x270F9A758]();
}

id BKLogKeyPresses()
{
  if (BKLogKeyPresses_onceToken != -1) {
    dispatch_once(&BKLogKeyPresses_onceToken, &__block_literal_global_30);
  }
  v0 = (void *)BKLogKeyPresses___logObj;
  return v0;
}

uint64_t __BKLogKeyPresses_block_invoke()
{
  BKLogKeyPresses___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "KeyPresses");
  return MEMORY[0x270F9A758]();
}

uint64_t __BKLogMotionEvents_block_invoke()
{
  BKLogMotionEvents___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "MotionEvents");
  return MEMORY[0x270F9A758]();
}

id BKLogSendHIDEvent()
{
  if (BKLogSendHIDEvent_onceToken != -1) {
    dispatch_once(&BKLogSendHIDEvent_onceToken, &__block_literal_global_36);
  }
  v0 = (void *)BKLogSendHIDEvent___logObj;
  return v0;
}

uint64_t __BKLogSendHIDEvent_block_invoke()
{
  BKLogSendHIDEvent___logObj = (uint64_t)os_log_create((const char *)*MEMORY[0x263F297C0], "SendHIDEvent");
  return MEMORY[0x270F9A758]();
}

uint64_t BKSHIDEventGetConciseDescription()
{
  return MEMORY[0x270F10480]();
}

uint64_t BKSHIDEventSetAttributes()
{
  return MEMORY[0x270F104A8]();
}

uint64_t BKSHIDEventSetSimpleDeliveryInfo()
{
  return MEMORY[0x270F104C0]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x270EF4228]();
}

uint64_t IOHIDEventCreateGenericGestureEvent()
{
  return MEMORY[0x270EF4278]();
}

uint64_t IOHIDEventGetEvent()
{
  return MEMORY[0x270EF4328]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x270EF4340]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x270EF4358]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x270EF4368]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x270EF43D8]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x270EF43F0]();
}

uint64_t _BKHIDNoteUserEventOccurredOnDisplay()
{
  return MEMORY[0x270F10430]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}