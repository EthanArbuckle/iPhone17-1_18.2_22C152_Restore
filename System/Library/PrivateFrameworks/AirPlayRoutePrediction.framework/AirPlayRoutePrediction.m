id getBMBiomeSchedulerClass()
{
  void *v0;
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)getBMBiomeSchedulerClass_softClass;
  v6 = getBMBiomeSchedulerClass_softClass;
  if (!getBMBiomeSchedulerClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMBiomeScheduler");
    getBMBiomeSchedulerClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE4276C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMStreamsClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getBMStreamsClass_softClass;
  uint64_t v6 = getBMStreamsClass_softClass;
  if (!getBMStreamsClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMStreams");
    getBMStreamsClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE42878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMHomeKitClientAccessoryControlStreamClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getBMHomeKitClientAccessoryControlStreamClass_softClass;
  uint64_t v6 = getBMHomeKitClientAccessoryControlStreamClass_softClass;
  if (!getBMHomeKitClientAccessoryControlStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMHomeKitClientAccessoryControlStream");
    getBMHomeKitClientAccessoryControlStreamClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE42984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMHomeKitClientActionSetStreamClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getBMHomeKitClientActionSetStreamClass_softClass;
  uint64_t v6 = getBMHomeKitClientActionSetStreamClass_softClass;
  if (!getBMHomeKitClientActionSetStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMHomeKitClientActionSetStream");
    getBMHomeKitClientActionSetStreamClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE42A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMHomeKitClientMediaAccessoryControlStreamClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getBMHomeKitClientMediaAccessoryControlStreamClass_softClass;
  uint64_t v6 = getBMHomeKitClientMediaAccessoryControlStreamClass_softClass;
  if (!getBMHomeKitClientMediaAccessoryControlStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMHomeKitClientMediaAccessoryControlStream");
    getBMHomeKitClientMediaAccessoryControlStreamClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE42B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeDoorbell()
{
  HMServiceTypeDoorbellSymbolLoc = (void **)getHMServiceTypeDoorbellSymbolLoc();
  if (!HMServiceTypeDoorbellSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeDoorbellSymbolLoc;
  return v1;
}

id getHMServiceTypeMicrophone()
{
  HMServiceTypeMicrophoneSymbolLoc = (void **)getHMServiceTypeMicrophoneSymbolLoc();
  if (!HMServiceTypeMicrophoneSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeMicrophoneSymbolLoc;
  return v1;
}

id getHMServiceTypeSpeaker()
{
  HMServiceTypeSpeakerSymbolLoc = (void **)getHMServiceTypeSpeakerSymbolLoc();
  if (!HMServiceTypeSpeakerSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeSpeakerSymbolLoc;
  return v1;
}

id getAVSystemControllerClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getAVSystemControllerClass_softClass;
  uint64_t v6 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    MediaExperienceLibraryCore();
    v4[3] = (uint64_t)objc_getClass("AVSystemController");
    getAVSystemControllerClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE42D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id ARPHomeControlLog()
{
  if (ARPHomeControlLog_onceToken != -1) {
    dispatch_once(&ARPHomeControlLog_onceToken, &__block_literal_global_4_0);
  }
  v0 = (void *)ARPHomeControlLog_log;
  return v0;
}

id getHMServiceTypeTemperatureSensor()
{
  HMServiceTypeTemperatureSensorSymbolLoc = (void **)getHMServiceTypeTemperatureSensorSymbolLoc();
  if (!HMServiceTypeTemperatureSensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeTemperatureSensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeTemperatureSensorSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeTemperatureSensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeTemperatureSensorSymbolLoc_ptr;
  if (!getHMServiceTypeTemperatureSensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeTemperatureSensor");
    getHMServiceTypeTemperatureSensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE44850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getHMServiceTypeSpeakerSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeSpeakerSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeSpeakerSymbolLoc_ptr;
  if (!getHMServiceTypeSpeakerSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeSpeaker");
    getHMServiceTypeSpeakerSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE44940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeSmokeSensor()
{
  HMServiceTypeSmokeSensorSymbolLoc = (void **)getHMServiceTypeSmokeSensorSymbolLoc();
  if (!HMServiceTypeSmokeSensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeSmokeSensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeSmokeSensorSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeSmokeSensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeSmokeSensorSymbolLoc_ptr;
  if (!getHMServiceTypeSmokeSensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeSmokeSensor");
    getHMServiceTypeSmokeSensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE44A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeOccupancySensor()
{
  HMServiceTypeOccupancySensorSymbolLoc = (void **)getHMServiceTypeOccupancySensorSymbolLoc();
  if (!HMServiceTypeOccupancySensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeOccupancySensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeOccupancySensorSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeOccupancySensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeOccupancySensorSymbolLoc_ptr;
  if (!getHMServiceTypeOccupancySensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeOccupancySensor");
    getHMServiceTypeOccupancySensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE44B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeMotionSensor()
{
  HMServiceTypeMotionSensorSymbolLoc = (void **)getHMServiceTypeMotionSensorSymbolLoc();
  if (!HMServiceTypeMotionSensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeMotionSensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeMotionSensorSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeMotionSensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeMotionSensorSymbolLoc_ptr;
  if (!getHMServiceTypeMotionSensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeMotionSensor");
    getHMServiceTypeMotionSensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE44CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getHMServiceTypeMicrophoneSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeMicrophoneSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeMicrophoneSymbolLoc_ptr;
  if (!getHMServiceTypeMicrophoneSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeMicrophone");
    getHMServiceTypeMicrophoneSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE44D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HomeKitLibrary()
{
  uint64_t v0 = HomeKitLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t HomeKitLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = HomeKitLibraryCore_frameworkLibrary;
  uint64_t v5 = HomeKitLibraryCore_frameworkLibrary;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_2640B4470;
    long long v7 = *(_OWORD *)&off_2640B4480;
    v3[3] = _sl_dlopen();
    HomeKitLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_20BE44F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeLightSensor()
{
  HMServiceTypeLightSensorSymbolLoc = (void **)getHMServiceTypeLightSensorSymbolLoc();
  if (!HMServiceTypeLightSensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeLightSensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeLightSensorSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeLightSensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeLightSensorSymbolLoc_ptr;
  if (!getHMServiceTypeLightSensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeLightSensor");
    getHMServiceTypeLightSensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE45044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeLeakSensor()
{
  HMServiceTypeLeakSensorSymbolLoc = (void **)getHMServiceTypeLeakSensorSymbolLoc();
  if (!HMServiceTypeLeakSensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeLeakSensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeLeakSensorSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeLeakSensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeLeakSensorSymbolLoc_ptr;
  if (!getHMServiceTypeLeakSensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeLeakSensor");
    getHMServiceTypeLeakSensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE45168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeHumiditySensor()
{
  HMServiceTypeHumiditySensorSymbolLoc = (void **)getHMServiceTypeHumiditySensorSymbolLoc();
  if (!HMServiceTypeHumiditySensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeHumiditySensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeHumiditySensorSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeHumiditySensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeHumiditySensorSymbolLoc_ptr;
  if (!getHMServiceTypeHumiditySensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeHumiditySensor");
    getHMServiceTypeHumiditySensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE4528C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getHMServiceTypeDoorbellSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeDoorbellSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeDoorbellSymbolLoc_ptr;
  if (!getHMServiceTypeDoorbellSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeDoorbell");
    getHMServiceTypeDoorbellSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE4537C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeContactSensor()
{
  HMServiceTypeContactSensorSymbolLoc = (void **)getHMServiceTypeContactSensorSymbolLoc();
  if (!HMServiceTypeContactSensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeContactSensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeContactSensorSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeContactSensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeContactSensorSymbolLoc_ptr;
  if (!getHMServiceTypeContactSensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeContactSensor");
    getHMServiceTypeContactSensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE454A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeCarbonMonoxideSensor()
{
  HMServiceTypeCarbonMonoxideSensorSymbolLoc = (void **)getHMServiceTypeCarbonMonoxideSensorSymbolLoc();
  if (!HMServiceTypeCarbonMonoxideSensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeCarbonMonoxideSensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeCarbonMonoxideSensorSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr;
  if (!getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeCarbonMonoxideSensor");
    getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE455C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeCarbonDioxideSensor()
{
  HMServiceTypeCarbonDioxideSensorSymbolLoc = (void **)getHMServiceTypeCarbonDioxideSensorSymbolLoc();
  if (!HMServiceTypeCarbonDioxideSensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeCarbonDioxideSensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeCarbonDioxideSensorSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr;
  if (!getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeCarbonDioxideSensor");
    getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE456E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeAirQualitySensor()
{
  HMServiceTypeAirQualitySensorSymbolLoc = (void **)getHMServiceTypeAirQualitySensorSymbolLoc();
  if (!HMServiceTypeAirQualitySensorSymbolLoc) {
    getHMServiceTypeMicrophone_cold_1();
  }
  id v1 = *HMServiceTypeAirQualitySensorSymbolLoc;
  return v1;
}

uint64_t getHMServiceTypeAirQualitySensorSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getHMServiceTypeAirQualitySensorSymbolLoc_ptr;
  uint64_t v6 = getHMServiceTypeAirQualitySensorSymbolLoc_ptr;
  if (!getHMServiceTypeAirQualitySensorSymbolLoc_ptr)
  {
    id v1 = (void *)HomeKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "HMServiceTypeAirQualitySensor");
    getHMServiceTypeAirQualitySensorSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20BE4580C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ARPLog()
{
  if (ARPLog_onceToken != -1) {
    dispatch_once(&ARPLog_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)ARPLog_log;
  return v0;
}

uint64_t __ARPLog_block_invoke()
{
  ARPLog_log = (uint64_t)os_log_create("com.apple.AirPlayRoutePrediction", "general");
  return MEMORY[0x270F9A758]();
}

uint64_t __ARPHomeControlLog_block_invoke()
{
  ARPHomeControlLog_log = (uint64_t)os_log_create("com.apple.AirPlayRoutePrediction", "homeControl");
  return MEMORY[0x270F9A758]();
}

void sub_20BE46BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BiomeStreamsLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = BiomeStreamsLibraryCore_frameworkLibrary;
  uint64_t v5 = BiomeStreamsLibraryCore_frameworkLibrary;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_2640B44E0;
    long long v7 = *(_OWORD *)&off_2640B44F0;
    v3[3] = _sl_dlopen();
    BiomeStreamsLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_20BE46D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

id ARPFeedbackLog()
{
  if (ARPFeedbackLog_onceToken != -1) {
    dispatch_once(&ARPFeedbackLog_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)ARPFeedbackLog_log;
  return v0;
}

uint64_t __ARPFeedbackLog_block_invoke()
{
  ARPFeedbackLog_log = (uint64_t)os_log_create("com.apple.AirPlayRoutePrediction", "feedback");
  return MEMORY[0x270F9A758]();
}

id ARPExtractLongFormVideoOutputDeviceIDs(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    id v20 = v1;
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v5 = 0;
      uint64_t v19 = v3;
      do
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(v1);
        }
        long long v6 = *(void **)(*((void *)&v25 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v7 = [v1 objectForKeyedSubscript:v6];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v22;
            while (2)
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v22 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v14 = (int)[v6 intValue];
                  int v15 = [v13 intValue];
                  if ([MEMORY[0x263EFA878] longFormVideoManagerCanHaveCurrentSessionWithDestinationOfType:v14 subType:v15])
                  {
                    v16 = [v8 objectForKeyedSubscript:v13];

                    id v1 = v20;
                    goto LABEL_22;
                  }
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          uint64_t v3 = v19;
          id v1 = v20;
          uint64_t v4 = v18;
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v25 objects:v30 count:16];
      v16 = &unk_26C0FF770;
    }
    while (v3);
  }
  else
  {
    v16 = &unk_26C0FF770;
  }
LABEL_22:

  return v16;
}

void sub_20BE498B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BE4A940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BE4BD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_20BE4CCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v12 - 136), 8);
  _Unwind_Resume(a1);
}

double ARPMicroLocationSimilarity(void *a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&UUID_NULL];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        int v15 = [v6 objectForKeyedSubscript:v14];
        [v15 doubleValue];
        double v17 = v16;
        [v15 doubleValue];
        double v19 = v18;
        if (([v14 isEqual:v5] & 1) == 0)
        {
          id v20 = [v4 objectForKeyedSubscript:v14];
          if (v20)
          {
            [v15 doubleValue];
            double v22 = v21;
            [v20 doubleValue];
            double v10 = v10 + v22 * v23;
          }
        }
        double v9 = v9 + v17 * v19;
      }
      uint64_t v11 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v11);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = v4;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    double v8 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = objc_msgSend(v24, "objectForKeyedSubscript:", *(void *)(*((void *)&v34 + 1) + 8 * j), (void)v34);
        [v29 doubleValue];
        double v31 = v30;
        [v29 doubleValue];
        double v8 = v8 + v31 * v32;
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v26);
  }

  return v10 / (sqrt(v9) * sqrt(v8));
}

void sub_20BE4F544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BE4F5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_20BE50688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

__CFString *ARPFeedbackTypeDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"unknown";
  }
  else {
    return *(&off_2640B4450 + a1);
  }
}

void ARPDonateFeedbackForPredictionPresented(void *a1, void *a2)
{
}

void ARPDonateFeedback(unint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x210540040]();
  uint64_t v7 = [MEMORY[0x263F350B8] knowledgeStore];
  ARPDonateFeedbackToKnowledgeStore(a1, v8, v5, v7);
}

void ARPDonateFeedbackForPredictionSuppressed(void *a1, void *a2)
{
}

void ARPDonateFeedbackForRouteSelection(void *a1, void *a2)
{
}

void ARPDonateFeedbackForRoutingFailure(void *a1, void *a2)
{
}

void ARPDonateFeedbackToKnowledgeStore(unint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v28 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  double v10 = ARPFeedbackLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (a1 > 3) {
      uint64_t v11 = @"unknown";
    }
    else {
      uint64_t v11 = *(&off_2640B4450 + a1);
    }
    *(_DWORD *)buf = 138412802;
    long long v39 = v11;
    __int16 v40 = 2112;
    id v41 = v28;
    __int16 v42 = 2112;
    id v43 = v7;
    _os_log_impl(&dword_20BE41000, v10, OS_LOG_TYPE_INFO, "Donating airplay prediction feedback, type: '%@', subtype: %@, outputDeviceIDs: %@", buf, 0x20u);
  }

  if (v7)
  {
    uint64_t v12 = [v7 count];
    if (v28)
    {
      if (v12 && [v28 length])
      {
        unint64_t v13 = a1;
        uint64_t v26 = v8;
        id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v14 = v7;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v32 != v17) {
                objc_enumerationMutation(v14);
              }
              double v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if ([v19 length])
              {
                id v20 = [MEMORY[0x263F34FE0] outputDeviceID];
                v35[0] = v20;
                v36[0] = v19;
                double v21 = [MEMORY[0x263F34FE0] subtype];
                v35[1] = v21;
                v36[1] = v28;
                double v22 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

                double v23 = (void *)MEMORY[0x263F35088];
                id v24 = [MEMORY[0x263F35148] airplayPredictionStream];
                uint64_t v25 = [v23 eventWithStream:v24 startDate:v9 endDate:v9 categoryIntegerValue:v13 metadata:v22];

                [v27 addObject:v25];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }
          while (v16);
        }

        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __ARPDonateFeedbackToKnowledgeStore_block_invoke_2;
        v29[3] = &unk_2640B4430;
        id v8 = v26;
        id v30 = v26;
        [v30 saveObjects:v27 tracker:&__block_literal_global_6 responseQueue:0 withCompletion:v29];
      }
    }
  }
}

uint64_t __ARPDonateFeedbackToKnowledgeStore_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __ARPDonateFeedbackToKnowledgeStore_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(id *)(a1 + 32);
  if (v4)
  {
    id v6 = ARPFeedbackLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __ARPDonateFeedbackToKnowledgeStore_block_invoke_2_cold_1();
    }
  }
}

void ARPCollectAndSendAnalyticsEvents(void *a1, void *a2)
{
  v253[2] = *(id *)MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = _os_activity_create(&dword_20BE41000, "Duet: ARPCollectAndSendAnalyticsEvents", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0;
  state.opaque[0] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  if (AnalyticsIsEventUsed())
  {
    id v6 = v3;
    id v7 = v4;
    id v8 = [MEMORY[0x263F35148] appUsageStream];
    uint64_t v248 = (uint64_t)v8;
    uint64_t v9 = [MEMORY[0x263F35148] nowPlayingStream];
    uint64_t v249 = (uint64_t)v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v248 count:2];

    uint64_t v11 = (void *)MEMORY[0x263F35110];
    uint64_t v12 = [v7 startDate];
    v221 = v7;
    unint64_t v13 = [v7 endDate];
    uint64_t v14 = [v11 predicateForEventsWithStartInDateRangeFromAfter:v12 to:v13];

    v215 = (void *)v14;
    obuint64_t j = (id)v10;
    uint64_t v15 = [MEMORY[0x263F35090] eventQueryWithPredicate:v14 eventStreams:v10 offset:0 limit:0 sortDescriptors:0];
    uint64_t v16 = [NSString stringWithUTF8String:"ARPFeedback.m"];
    uint64_t v17 = objc_msgSend(v16, "stringByAppendingFormat:", @":%d", 46);
    [v15 setClientName:v17];

    [v15 setTracker:&__block_literal_global_215];
    [v15 setGroupByProperties:&unk_26C0FF7A0];
    [v15 setResultType:3];
    v253[0] = 0;
    double v18 = [v6 executeQuery:v15 error:v253];
    id v19 = v253[0];
    id v20 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v183 = v3;
    id v184 = v4;
    if (v19)
    {
      double v21 = v18;
      double v22 = ARPLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ARPCorrelationTask longFormVideoAppBundleIDs]();
      }
    }
    else
    {
      id v212 = v6;
      double v22 = [getAVSystemControllerClass() sharedAVSystemController];
      long long v232 = 0u;
      long long v233 = 0u;
      long long v234 = 0u;
      long long v235 = 0u;
      double v21 = v18;
      id v24 = [v18 valueForKey:@"valueString"];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v232 objects:&state count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v233;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v233 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v232 + 1) + 8 * i);
            if (-[NSObject hasRouteSharingPolicyLongFormVideo:](v22, "hasRouteSharingPolicyLongFormVideo:", v29))[v20 addObject:v29]; {
          }
            }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v232 objects:&state count:16];
        }
        while (v26);
      }

      id v6 = v212;
    }

    id v30 = [v20 allObjects];

    long long v31 = ARPFeedbackLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      ARPCollectAndSendAnalyticsEvents_cold_5();
    }

    id v193 = v6;
    long long v32 = v30;
    id v33 = v221;
    long long v34 = [MEMORY[0x263F35148] appUsageStream];
    v253[0] = v34;
    long long v35 = [MEMORY[0x263F35148] nowPlayingStream];
    v253[1] = v35;
    uint64_t v213 = [MEMORY[0x263EFF8C0] arrayWithObjects:v253 count:2];

    v216 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
    long long v36 = (void *)MEMORY[0x263F35110];
    long long v37 = [MEMORY[0x263F35148] appUsageStream];
    long long v38 = [v37 name];
    uint64_t v39 = [v36 predicateForEventsWithStreamName:v38];

    __int16 v40 = (void *)MEMORY[0x263F35110];
    id v41 = [MEMORY[0x263F35148] nowPlayingStream];
    __int16 v42 = [v41 name];
    uint64_t v43 = [v40 predicateForEventsWithStreamName:v42];

    uint64_t v44 = (void *)MEMORY[0x263F35110];
    v45 = [MEMORY[0x263F350F0] playing];
    uint64_t v46 = [v44 predicateForObjectsWithMetadataKey:v45 andIntegerValue:1];

    v47 = (void *)MEMORY[0x263F08730];
    v204 = (void *)v46;
    context = (void *)v43;
    v252[0] = v43;
    v252[1] = v46;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v252 count:2];
    uint64_t v49 = [v47 andPredicateWithSubpredicates:v48];

    v50 = (void *)MEMORY[0x263F08730];
    v208 = (void *)v39;
    v251[0] = v39;
    v251[1] = v49;
    v202 = (void *)v49;
    v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v251 count:2];
    uint64_t v52 = [v50 orPredicateWithSubpredicates:v51];

    v185 = v32;
    uint64_t v53 = [MEMORY[0x263F35110] predicateForEventsWithStringValueInValues:v32];
    v54 = (void *)MEMORY[0x263F35110];
    v55 = [v33 startDate];
    v210 = v33;
    v56 = [v33 endDate];
    uint64_t v57 = [v54 predicateForEventsWithStartInDateRangeFromAfter:v55 to:v56];

    v58 = (void *)MEMORY[0x263F08730];
    v196 = (void *)v57;
    v198 = (void *)v53;
    uint64_t v248 = v57;
    uint64_t v249 = v52;
    v200 = (void *)v52;
    uint64_t v250 = v53;
    v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v248 count:3];
    uint64_t v60 = [v58 andPredicateWithSubpredicates:v59];

    v61 = (void *)MEMORY[0x263F35090];
    v62 = (void *)v213;
    v247 = v216;
    v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v247 count:1];
    v194 = (void *)v60;
    v64 = [v61 eventQueryWithPredicate:v60 eventStreams:v213 offset:0 limit:0 sortDescriptors:v63];

    v65 = [NSString stringWithUTF8String:"ARPFeedback.m"];
    v66 = objc_msgSend(v65, "stringByAppendingFormat:", @":%d", 91);
    [v64 setClientName:v66];

    [v64 setTracker:&__block_literal_global_221];
    [v64 setResultType:2];
    id v236 = 0;
    v191 = v64;
    v67 = [v193 executeQuery:v64 error:&v236];
    v188 = v67;
    id v190 = v236;
    if (v190)
    {
      v68 = ARPLog();
      id v4 = v184;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
        ARPCollectAndSendAnalyticsEvents_cold_4();
      }

      id v69 = 0;
      double v23 = v185;
      v70 = v204;
      goto LABEL_41;
    }
    id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v232 = 0u;
    long long v233 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    id obja = v67;
    uint64_t v71 = [obja countByEnumeratingWithState:&v232 objects:&state count:16];
    v222 = v69;
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v233;
      do
      {
        for (uint64_t j = 0; j != v72; ++j)
        {
          if (*(void *)v233 != v73) {
            objc_enumerationMutation(obja);
          }
          v75 = *(void **)(*((void *)&v232 + 1) + 8 * j);
          id v76 = objc_alloc(MEMORY[0x263F08798]);
          v77 = [v75 startDate];
          v78 = [v77 dateByAddingTimeInterval:-30.0];
          v79 = [v75 endDate];
          v80 = [v79 dateByAddingTimeInterval:30.0];
          v81 = (void *)[v76 initWithStartDate:v78 endDate:v80];

          id v69 = v222;
          [v222 addObject:v81];
        }
        uint64_t v72 = [obja countByEnumeratingWithState:&v232 objects:&state count:16];
      }
      while (v72);
    }

    if ([v69 count])
    {
      v62 = (void *)v213;
      if ([v69 count] != 1)
      {
        unint64_t v82 = 0;
        do
        {
          v83 = (void *)MEMORY[0x210540040]();
          v84 = [v69 objectAtIndexedSubscript:v82];
          v85 = [v69 objectAtIndexedSubscript:v82 + 1];
          if ([v84 intersectsDateInterval:v85])
          {
            v86 = [v84 startDate];
            v87 = [v85 startDate];
            v88 = [v86 earlierDate:v87];

            v89 = [v84 endDate];
            v90 = [v85 endDate];
            v91 = [v89 laterDate:v90];

            id v69 = v222;
            v92 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v88 endDate:v91];
            [v222 setObject:v92 atIndexedSubscript:v82];
            [v222 removeObjectAtIndex:v82 + 1];
          }
          else
          {
            ++v82;
          }
        }
        while (v82 < [v69 count] - 1);
        id v4 = v184;
        double v23 = v185;
        v70 = v204;
        v62 = (void *)v213;
        goto LABEL_41;
      }
      id v4 = v184;
      double v23 = v185;
    }
    else
    {
      id v4 = v184;
      double v23 = v185;
      v62 = (void *)v213;
    }
    v70 = v204;
LABEL_41:
    v93 = (void *)[v69 copy];

    if ([v93 count])
    {
      v94 = objc_alloc_init(MEMORY[0x263F087A8]);
      [v94 setTimeStyle:3];
      [v94 setDateStyle:1];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        ARPCollectAndSendAnalyticsEvents_cold_3(v93, v94, v31);
      }
      v186 = v94;

      v95 = [MEMORY[0x263F35148] nowPlayingStream];
      v245[0] = v95;
      v96 = [MEMORY[0x263F35148] appUsageStream];
      v245[1] = v96;
      [MEMORY[0x263F35148] microLocationVisitStream];
      v97 = v182 = v93;
      v245[2] = v97;
      v98 = [MEMORY[0x263F35148] airplayPredictionStream];
      v245[3] = v98;
      v181 = [MEMORY[0x263EFF8C0] arrayWithObjects:v245 count:4];

      v180 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
      v99 = (void *)MEMORY[0x263F35110];
      v100 = [MEMORY[0x263F35148] appUsageStream];
      v101 = [v100 name];
      uint64_t v102 = [v99 predicateForEventsWithStreamName:v101];

      v103 = (void *)MEMORY[0x263F35110];
      v104 = [MEMORY[0x263F35148] nowPlayingStream];
      v105 = [v104 name];
      uint64_t v106 = [v103 predicateForEventsWithStreamName:v105];

      v107 = (void *)MEMORY[0x263F35110];
      v108 = [MEMORY[0x263F350F0] playing];
      uint64_t v109 = [v107 predicateForObjectsWithMetadataKey:v108 andIntegerValue:1];

      uint64_t v110 = [MEMORY[0x263F35110] predicateForEventsWithMinimumDuration:30.0];
      v111 = (void *)MEMORY[0x263F08730];
      v177 = (void *)v109;
      v178 = (void *)v106;
      v244[0] = v106;
      v176 = (void *)v110;
      v244[1] = v110;
      v244[2] = v109;
      v112 = [MEMORY[0x263EFF8C0] arrayWithObjects:v244 count:3];
      uint64_t v113 = [v111 andPredicateWithSubpredicates:v112];

      v114 = (void *)MEMORY[0x263F08730];
      v179 = (void *)v102;
      v243[0] = v102;
      v175 = (void *)v113;
      v243[1] = v113;
      v115 = [MEMORY[0x263EFF8C0] arrayWithObjects:v243 count:2];
      uint64_t v116 = [v114 orPredicateWithSubpredicates:v115];

      uint64_t v117 = [MEMORY[0x263F35110] predicateForEventsWithStringValueInValues:v185];
      v118 = (void *)MEMORY[0x263F08730];
      v173 = (void *)v117;
      v174 = (void *)v116;
      v242[0] = v116;
      v242[1] = v117;
      v119 = [MEMORY[0x263EFF8C0] arrayWithObjects:v242 count:2];
      uint64_t v120 = [v118 andPredicateWithSubpredicates:v119];

      v121 = (void *)MEMORY[0x263F35110];
      v122 = [MEMORY[0x263F35148] microLocationVisitStream];
      v123 = [v122 name];
      uint64_t v124 = [v121 predicateForEventsWithStreamName:v123];

      v125 = (void *)MEMORY[0x263F35110];
      v126 = [MEMORY[0x263F35148] airplayPredictionStream];
      v127 = [v126 name];
      v128 = [v125 predicateForEventsWithStreamName:v127];

      v129 = (void *)MEMORY[0x263F08730];
      v171 = (void *)v124;
      v241[0] = v124;
      v241[1] = v128;
      v172 = (void *)v120;
      v241[2] = v120;
      v130 = [MEMORY[0x263EFF8C0] arrayWithObjects:v241 count:3];
      v192 = [v129 orPredicateWithSubpredicates:v130];

      v131 = (void *)MEMORY[0x263F35090];
      v240 = v180;
      v132 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v240 count:1];
      v133 = [v131 eventQueryWithPredicate:0 eventStreams:v181 offset:0 limit:512 sortDescriptors:v132];

      v134 = [NSString stringWithUTF8String:"ARPFeedback.m"];
      v135 = objc_msgSend(v134, "stringByAppendingFormat:", @":%d", 476);
      [v133 setClientName:v135];

      [v133 setTracker:&__block_literal_global_207];
      long long v230 = 0u;
      long long v231 = 0u;
      long long v228 = 0u;
      long long v229 = 0u;
      id v187 = v182;
      uint64_t v195 = [v187 countByEnumeratingWithState:&v228 objects:v239 count:16];
      if (v195)
      {
        objb = 0;
        uint64_t v189 = *(void *)v229;
        do
        {
          uint64_t v136 = 0;
          do
          {
            if (*(void *)v229 != v189) {
              objc_enumerationMutation(v187);
            }
            uint64_t v209 = v136;
            v137 = *(void **)(*((void *)&v228 + 1) + 8 * v136);
            contexta = (void *)MEMORY[0x210540040]();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              v170 = [v186 stringFromDateInterval:v137];
              LODWORD(state.opaque[0]) = 138412290;
              *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v170;
              _os_log_debug_impl(&dword_20BE41000, v31, OS_LOG_TYPE_DEBUG, "Collecting analytics events in interval %@", (uint8_t *)&state, 0xCu);
            }
            v138 = (void *)MEMORY[0x263F35110];
            v139 = [v137 startDate];
            v140 = [v137 endDate];
            uint64_t v141 = [v138 predicateForEventsWithStartAndEndInDateRangeFrom:v139 to:v140];

            v142 = (void *)MEMORY[0x263F08730];
            v205 = (void *)v141;
            v238[0] = v141;
            v238[1] = v192;
            v143 = [MEMORY[0x263EFF8C0] arrayWithObjects:v238 count:2];
            v144 = [v142 andPredicateWithSubpredicates:v143];
            [v133 setPredicate:v144];

            id v227 = 0;
            v217 = [v193 executeQuery:v133 error:&v227];
            id v203 = v227;
            v145 = (void *)MEMORY[0x263F08A98];
            v146 = [MEMORY[0x263F35148] appUsageStream];
            v147 = [v146 name];
            v148 = [v145 predicateWithFormat:@"stream.name == %@", v147];
            v214 = [v217 filteredArrayUsingPredicate:v148];

            v149 = (void *)MEMORY[0x263F08A98];
            v150 = [MEMORY[0x263F35148] nowPlayingStream];
            v151 = [v150 name];
            v152 = [v149 predicateWithFormat:@"stream.name == %@", v151];
            v211 = [v217 filteredArrayUsingPredicate:v152];

            v153 = (void *)MEMORY[0x263F08A98];
            v154 = [MEMORY[0x263F35148] microLocationVisitStream];
            v155 = [v154 name];
            v156 = [v153 predicateWithFormat:@"stream.name == %@", v155];
            uint64_t v157 = [v217 filteredArrayUsingPredicate:v156];

            v158 = (void *)MEMORY[0x263F08A98];
            v159 = [MEMORY[0x263F35148] airplayPredictionStream];
            v160 = [v159 name];
            v161 = [v158 predicateWithFormat:@"stream.name == %@", v160];
            uint64_t v162 = [v217 filteredArrayUsingPredicate:v161];

            v199 = (void *)v162;
            v201 = (void *)v157;
            v163 = +[ARPAnalyticsEvent feedbackEventsFromAppUsageEvents:v214 playingEvents:v211 microLocationEvents:v157 feedbackEvents:v162];
            long long v223 = 0u;
            long long v224 = 0u;
            long long v225 = 0u;
            long long v226 = 0u;
            v197 = v163;
            v164 = [v163 valueForKey:@"analyticsDictionary"];
            uint64_t v165 = [v164 countByEnumeratingWithState:&v223 objects:v237 count:16];
            if (v165)
            {
              uint64_t v166 = v165;
              uint64_t v167 = *(void *)v224;
              do
              {
                for (uint64_t k = 0; k != v166; ++k)
                {
                  if (*(void *)v224 != v167) {
                    objc_enumerationMutation(v164);
                  }
                  uint64_t v169 = *(void *)(*((void *)&v223 + 1) + 8 * k);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                  {
                    LODWORD(state.opaque[0]) = 138412290;
                    *(uint64_t *)((char *)state.opaque + 4) = v169;
                    _os_log_impl(&dword_20BE41000, v31, OS_LOG_TYPE_INFO, "Sending analytics event: %@", (uint8_t *)&state, 0xCu);
                  }

                  AnalyticsSendEvent();
                }
                objb += v166;
                uint64_t v166 = [v164 countByEnumeratingWithState:&v223 objects:v237 count:16];
              }
              while (v166);
            }

            uint64_t v136 = v209 + 1;
          }
          while (v209 + 1 != v195);
          uint64_t v195 = [v187 countByEnumeratingWithState:&v228 objects:v239 count:16];
        }
        while (v195);
      }
      else
      {
        objb = 0;
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        ARPCollectAndSendAnalyticsEvents_cold_2((uint64_t)objb, v31);
      }

      id v4 = v184;
      double v23 = v185;
      v93 = v182;
      long long v31 = v186;
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      ARPCollectAndSendAnalyticsEvents_cold_1(v31);
    }

    id v3 = v183;
    goto LABEL_70;
  }
  double v23 = ARPFeedbackLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_20BE41000, v23, OS_LOG_TYPE_INFO, "Skipping analytics event collection because event is not used", (uint8_t *)&state, 2u);
  }
LABEL_70:
}

uint64_t __ARPCollectAndSendAnalyticsEvents_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __ARPLongFormVideoAppBundleIDs_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __ARPAppUsageAndNowPlayingDateIntervals_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __HomeKitLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  HomeKitLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeMicrophoneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeMicrophone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeMicrophoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeSpeakerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeSpeaker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeSpeakerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeDoorbellSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeDoorbell");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeDoorbellSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeTemperatureSensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeTemperatureSensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeTemperatureSensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeAirQualitySensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeAirQualitySensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeAirQualitySensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeHumiditySensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeHumiditySensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeHumiditySensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeCarbonMonoxideSensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeCarbonMonoxideSensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeContactSensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeContactSensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeContactSensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeLeakSensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeLeakSensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeLeakSensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeLightSensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeLightSensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeLightSensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeMotionSensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeMotionSensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeMotionSensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeOccupancySensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeOccupancySensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeOccupancySensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeSmokeSensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeSmokeSensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeSmokeSensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHMServiceTypeCarbonDioxideSensorSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMServiceTypeCarbonDioxideSensor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiomeStreamsLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  BiomeStreamsLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BiomeStreamsLibrary()
{
  uint64_t v0 = BiomeStreamsLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getBMHomeKitClientAccessoryControlEventClass()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getBMHomeKitClientAccessoryControlEventClass_softClass;
  uint64_t v6 = getBMHomeKitClientAccessoryControlEventClass_softClass;
  if (!getBMHomeKitClientAccessoryControlEventClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMHomeKitClientAccessoryControlEvent");
    getBMHomeKitClientAccessoryControlEventClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE53F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMHomeKitClientAccessoryControlEventClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMHomeKitClientAccessoryControlEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMHomeKitClientAccessoryControlEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getBMHomeKitClientActionSetEventClass()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getBMHomeKitClientActionSetEventClass_softClass;
  uint64_t v6 = getBMHomeKitClientActionSetEventClass_softClass;
  if (!getBMHomeKitClientActionSetEventClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMHomeKitClientActionSetEvent");
    getBMHomeKitClientActionSetEventClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE54064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMHomeKitClientActionSetEventClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMHomeKitClientActionSetEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMHomeKitClientActionSetEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getBMHomeKitClientMediaAccessoryControlEventClass()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getBMHomeKitClientMediaAccessoryControlEventClass_softClass;
  uint64_t v6 = getBMHomeKitClientMediaAccessoryControlEventClass_softClass;
  if (!getBMHomeKitClientMediaAccessoryControlEventClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMHomeKitClientMediaAccessoryControlEvent");
    getBMHomeKitClientMediaAccessoryControlEventClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE541C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMHomeKitClientMediaAccessoryControlEventClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMHomeKitClientMediaAccessoryControlEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMHomeKitClientMediaAccessoryControlEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

Class __getBMHomeKitClientAccessoryControlStreamClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMHomeKitClientAccessoryControlStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMHomeKitClientAccessoryControlStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMHomeKitClientActionSetStreamClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMHomeKitClientActionSetStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMHomeKitClientActionSetStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMHomeKitClientMediaAccessoryControlStreamClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMHomeKitClientMediaAccessoryControlStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMHomeKitClientMediaAccessoryControlStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

Class __getBMBiomeSchedulerClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMBiomeScheduler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMBiomeSchedulerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMStreamsClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMStreamsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getBMDKEventStreamClass()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getBMDKEventStreamClass_softClass;
  uint64_t v6 = getBMDKEventStreamClass_softClass;
  if (!getBMDKEventStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMDKEventStream");
    getBMDKEventStreamClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_20BE544C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMDKEventStreamClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMDKEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMDKEventStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MediaExperienceLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = MediaExperienceLibraryCore_frameworkLibrary;
  uint64_t v5 = MediaExperienceLibraryCore_frameworkLibrary;
  if (!MediaExperienceLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_2640B4500;
    long long v7 = *(_OWORD *)&off_2640B4510;
    v3[3] = _sl_dlopen();
    MediaExperienceLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_20BE54644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MediaExperienceLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  MediaExperienceLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MediaExperienceLibrary()
{
  uint64_t v0 = MediaExperienceLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAVSystemControllerClass_block_invoke(uint64_t a1)
{
  MediaExperienceLibraryCore();
  Class result = objc_getClass("AVSystemController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __ARPDonateFeedbackToKnowledgeStore_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20BE41000, v0, v1, "Error donating airplay prediction feedback: %@", v2, v3, v4, v5, v6);
}

void ARPCollectAndSendAnalyticsEvents_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_20BE41000, log, OS_LOG_TYPE_DEBUG, "No intervals for potential airplay route prediction analytics events", v1, 2u);
}

void ARPCollectAndSendAnalyticsEvents_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20BE41000, a2, OS_LOG_TYPE_DEBUG, "Finished sending %@ analytics events", v4, 0xCu);
}

void ARPCollectAndSendAnalyticsEvents_cold_3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint8_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  long long v7 = [a1 firstObject];
  uint64_t v8 = [v7 startDate];
  uint64_t v9 = [a1 lastObject];
  uint64_t v10 = [v9 endDate];
  uint64_t v11 = [a2 stringFromDate:v8 toDate:v10];
  int v12 = 138412546;
  unint64_t v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v11;
  _os_log_debug_impl(&dword_20BE41000, a3, OS_LOG_TYPE_DEBUG, "Collecting analytics events from %@ date intervals spanning %@", (uint8_t *)&v12, 0x16u);
}

void ARPCollectAndSendAnalyticsEvents_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20BE41000, v0, v1, "Error fetching long form video date intervals from knowledge store: %@", v2, v3, v4, v5, v6);
}

void ARPCollectAndSendAnalyticsEvents_cold_5()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20BE41000, v0, OS_LOG_TYPE_DEBUG, "Collecting analytics events from long form video bundleIDs: %@", v1, 0xCu);
}

void getHMServiceTypeMicrophone_cold_1()
{
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x270F18A30]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D40](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x270EDB7C8](*(void *)&a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}