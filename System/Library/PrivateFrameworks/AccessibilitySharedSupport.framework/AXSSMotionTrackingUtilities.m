@interface AXSSMotionTrackingUtilities
+ (BOOL)_axss_iAPInterfaceExistsForHIDDeviceService:(unsigned int)a3;
+ (BOOL)axss_HIDDeviceIsMFiAuthenticated:(id)a3;
+ (NSDictionary)axss_frequencyElementMatchingDict;
+ (NSDictionary)axss_statusElementMatchingDict;
+ (NSDictionary)axss_xPositionElementMatchingDict;
+ (NSDictionary)axss_yPositionElementMatchingDict;
@end

@implementation AXSSMotionTrackingUtilities

+ (NSDictionary)axss_xPositionElementMatchingDict
{
  if (axss_xPositionElementMatchingDict_onceToken != -1) {
    dispatch_once(&axss_xPositionElementMatchingDict_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)axss_xPositionElementMatchingDict_s_XPositionElementMatchingDict;

  return (NSDictionary *)v2;
}

void __64__AXSSMotionTrackingUtilities_axss_xPositionElementMatchingDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UsagePage";
  v2[1] = @"Usage";
  v3[0] = &unk_1F0C673C8;
  v3[1] = &unk_1F0C673E0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)axss_xPositionElementMatchingDict_s_XPositionElementMatchingDict;
  axss_xPositionElementMatchingDict_s_XPositionElementMatchingDict = v0;
}

+ (NSDictionary)axss_yPositionElementMatchingDict
{
  if (axss_yPositionElementMatchingDict_onceToken != -1) {
    dispatch_once(&axss_yPositionElementMatchingDict_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)axss_yPositionElementMatchingDict_s_YPositionElementMatchingDict;

  return (NSDictionary *)v2;
}

void __64__AXSSMotionTrackingUtilities_axss_yPositionElementMatchingDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UsagePage";
  v2[1] = @"Usage";
  v3[0] = &unk_1F0C673C8;
  v3[1] = &unk_1F0C673F8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)axss_yPositionElementMatchingDict_s_YPositionElementMatchingDict;
  axss_yPositionElementMatchingDict_s_YPositionElementMatchingDict = v0;
}

+ (NSDictionary)axss_statusElementMatchingDict
{
  if (axss_statusElementMatchingDict_onceToken != -1) {
    dispatch_once(&axss_statusElementMatchingDict_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)axss_statusElementMatchingDict_s_YPositionElementMatchingDict;

  return (NSDictionary *)v2;
}

void __61__AXSSMotionTrackingUtilities_axss_statusElementMatchingDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UsagePage";
  v2[1] = @"Usage";
  v3[0] = &unk_1F0C673C8;
  v3[1] = &unk_1F0C67410;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)axss_statusElementMatchingDict_s_YPositionElementMatchingDict;
  axss_statusElementMatchingDict_s_YPositionElementMatchingDict = v0;
}

+ (NSDictionary)axss_frequencyElementMatchingDict
{
  if (axss_frequencyElementMatchingDict_onceToken != -1) {
    dispatch_once(&axss_frequencyElementMatchingDict_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)axss_frequencyElementMatchingDict_s_YPositionElementMatchingDict;

  return (NSDictionary *)v2;
}

void __64__AXSSMotionTrackingUtilities_axss_frequencyElementMatchingDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UsagePage";
  v2[1] = @"Usage";
  v3[0] = &unk_1F0C673C8;
  v3[1] = &unk_1F0C67428;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)axss_frequencyElementMatchingDict_s_YPositionElementMatchingDict;
  axss_frequencyElementMatchingDict_s_YPositionElementMatchingDict = v0;
}

+ (BOOL)axss_HIDDeviceIsMFiAuthenticated:(id)a3
{
  id v3 = a3;
  v4 = [v3 propertyForKey:@"Authenticated"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 BOOLValue]) {
    char v5 = 1;
  }
  else {
    char v5 = objc_msgSend((id)objc_opt_class(), "_axss_iAPInterfaceExistsForHIDDeviceService:", objc_msgSend(v3, "service"));
  }

  return v5;
}

+ (BOOL)_axss_iAPInterfaceExistsForHIDDeviceService:(unsigned int)a3
{
  kern_return_t v13;
  CFMutableDictionaryRef v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  CFMutableDictionaryRef v21;
  io_iterator_t object;
  io_iterator_t iterator;

  iterator = 0;
  if (MEMORY[0x1B3EC1CD0](*(void *)&a3, "IOService", 3, &iterator))
  {
    id v3 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[AXSSMotionTrackingUtilities _axss_iAPInterfaceExistsForHIDDeviceService:]();
    }

    return 0;
  }
  if (!IOIteratorIsValid(iterator)) {
    MEMORY[0x1B3EC1C90](iterator);
  }
  uint64_t v4 = IOIteratorNext(iterator);
  if (v4)
  {
    do
    {
      BOOLean_t v5 = IOObjectConformsTo(v4, "IOUSBDevice");
      BOOL v6 = v5 == 0;
      if (v5) {
        break;
      }
      IOObjectRelease(v4);
      uint64_t v4 = IOIteratorNext(iterator);
    }
    while (v4);
  }
  else
  {
    BOOL v6 = 1;
  }
  if (iterator) {
    IOObjectRelease(iterator);
  }
  if (v6) {
    return 0;
  }
  object = 0;
  if (MEMORY[0x1B3EC1CD0](v4, "IOService", 1, &object))
  {
    v7 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[AXSSMotionTrackingUtilities _axss_iAPInterfaceExistsForHIDDeviceService:]();
    }

    return 0;
  }
  if (!IOIteratorIsValid(object)) {
    MEMORY[0x1B3EC1C90](object);
  }
  IOObjectRelease(v4);
  io_object_t v10 = IOIteratorNext(object);
  BOOL v8 = v10 != 0;
  if (v10)
  {
    io_registry_entry_t v11 = v10;
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (1)
    {
      v21 = 0;
      v13 = IORegistryEntryCreateCFProperties(v11, &v21, v12, 0);
      IOObjectRelease(v11);
      v14 = v21;
      if (v21)
      {
        if (!v13)
        {
          v15 = [(__CFDictionary *)v21 objectForKeyedSubscript:@"bInterfaceClass"];
          v16 = [v15 unsignedIntValue];

          v17 = [(__CFDictionary *)v14 objectForKeyedSubscript:@"bInterfaceSubClass"];
          v18 = [v17 unsignedIntValue];

          v19 = [(__CFDictionary *)v14 objectForKeyedSubscript:@"bInterfaceProtocol"];
          v20 = [v19 unsignedIntValue];

          if (v16 == 255 && v18 == 240 && !v20) {
            break;
          }
        }
      }

      io_registry_entry_t v11 = IOIteratorNext(object);
      BOOL v8 = v11 != 0;
      if (!v11) {
        goto LABEL_33;
      }
    }
  }
LABEL_33:
  if (object) {
    IOObjectRelease(object);
  }
  return v8;
}

+ (void)_axss_iAPInterfaceExistsForHIDDeviceService:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(&dword_1B3B9D000, v0, OS_LOG_TYPE_ERROR, "%s: cannot create parent iterator: error 0x%08X (%d)", (uint8_t *)v1, 0x18u);
}

@end