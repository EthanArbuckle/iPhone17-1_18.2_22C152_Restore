id BuiltinAudioFactory(uint64_t a1, const void *a2)
{
  NSObject *v3;
  CFUUIDRef v4;
  void *v5;
  id v6;
  uint8_t buf[16];

  v3 = BuiltinLogType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BuiltinAudioFactory factory for AudioServerPlugin", buf, 2u);
  }

  v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
  if (!CFEqual(a2, v4)) {
    return 0;
  }
  v5 = +[BuiltinAudioPlugin sharedPlugin];
  v6 = [v5 driverRef];

  return v6;
}

void *BuiltinLogType()
{
  if (qword_8160 != -1) {
    dispatch_once(&qword_8160, &stru_4208);
  }
  return off_8158;
}

void sub_2B78(id a1)
{
  os_log_t v1 = os_log_create("com.apple.audio.ASDT", "Builtin");
  if (v1) {
    off_8158 = v1;
  }
}

uint64_t sub_2C4C()
{
  qword_8168 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_2E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2EC0()
{
  CFStringRef v0 = (const __CFString *)kASDTConfigKeySubclass;
  CFStringRef v39 = (const __CFString *)kASDTConfigKeyDeviceUID;
  CFStringRef v40 = (const __CFString *)kASDTConfigKeySubclass;
  CFStringRef v41 = (const __CFString *)kASDTConfigKeyDeviceUID;
  CFStringRef v48 = @"ASDTIOA2Device";
  CFStringRef v49 = @"HPMic";
  CFStringRef v1 = (const __CFString *)kASDTConfigKeyDeviceCanBeDefaultInput;
  v2 = (void *)kASDTConfigKeyDeviceCanBeDefaultSystem;
  CFStringRef v42 = (const __CFString *)kASDTConfigKeyDeviceCanBeDefaultInput;
  v43 = (void *)kASDTConfigKeyDeviceCanBeDefaultSystem;
  CFStringRef v50 = (const __CFString *)&__kCFBooleanTrue;
  v51 = &__kCFBooleanTrue;
  v3 = (void *)kASDTIOA2ConfigKeyExclavesInputBufferName;
  uint64_t v4 = kASDTIOA2ConfigKeyExclavesInjectionBufferName;
  v44 = (void *)kASDTIOA2ConfigKeyExclavesInputBufferName;
  uint64_t v45 = kASDTIOA2ConfigKeyExclavesInjectionBufferName;
  CFStringRef v52 = @"com.apple.audio.mic";
  CFStringRef v53 = @"com.apple.inbound_buffer.hpmic_injection";
  uint64_t v5 = kASDTIOA2ConfigKeyIsolatedInputUseCaseID;
  v54 = &off_4438;
  uint64_t v46 = kASDTIOA2ConfigKeyIsolatedInputUseCaseID;
  uint64_t v47 = kASDTConfigKeyDeviceCustomProperties;
  uint64_t v35 = kASDTConfigKeyDeviceCustomProperties;
  v6 = +[ASDTExclavesSensorAutomaticProperty config];
  CFStringRef v60 = v6;
  v7 = +[ASDTExclavesStatusProperty configForMic];
  CFStringRef v61 = v7;
  v8 = +[NSArray arrayWithObjects:&v60 count:2];
  v55 = v8;
  qword_8178 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v40 count:8];

  CFStringRef v48 = @"ASDTIOA2Device";
  CFStringRef v49 = @"HP16Mic";
  CFStringRef v40 = v0;
  CFStringRef v41 = v39;
  CFStringRef v42 = v1;
  v43 = v2;
  CFStringRef v50 = (const __CFString *)&__kCFBooleanFalse;
  v51 = &__kCFBooleanFalse;
  v44 = v3;
  uint64_t v45 = v4;
  CFStringRef v52 = @"com.apple.audio.lpmic";
  CFStringRef v53 = @"com.apple.inbound_buffer.hpmic16_injection";
  uint64_t v46 = v5;
  v54 = &off_4450;
  qword_8180 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v40 count:7];
  CFStringRef v60 = v0;
  CFStringRef v61 = v39;
  CFStringRef v40 = @"ASDTIOPAudioLPMicDevice";
  CFStringRef v41 = (const __CFString *)kASDTIOPAudioConfigLPMicDeviceUID;
  CFStringRef v38 = (const __CFString *)kASDTIOPAudioConfigLPMicDeviceUID;
  CFStringRef v9 = (const __CFString *)kASDTConfigKeyServiceIdentifier;
  CFStringRef v42 = @"lpai";
  CFStringRef v62 = (const __CFString *)kASDTConfigKeyServiceIdentifier;
  v63 = (void *)kASDTConfigKeyDeviceStreams;
  v37 = (void *)kASDTConfigKeyDeviceStreams;
  CFStringRef v56 = v0;
  CFStringRef v57 = (const __CFString *)kASDTConfigKeyServiceIdentifier;
  CFStringRef v65 = @"ASDTIOPAudioLPMicStream";
  CFStringRef v66 = @"adpx";
  v10 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v56 count:2];
  v59 = v10;
  v33 = +[NSArray arrayWithObjects:&v59 count:1];
  v43 = v33;
  uint64_t v64 = v35;
  v11 = +[ASDTIOPAudioLPMicDevice enableListeningPropertyForService:@"lai "];
  CFStringRef v48 = v11;
  v12 = +[ASDTIOPAudioVTActiveChannelMaskProperty configDictForService:@"vtcm"];
  CFStringRef v49 = v12;
  v13 = +[ASDTIOPAudioVTAvailableProperty configDictForService:@"vtcm"];
  CFStringRef v50 = v13;
  v14 = +[ASDTIOPAudioVTConfigurationProperty configDictForService:@"vtcm"];
  v51 = v14;
  v15 = +[ASDTIOPAudioVTEnableProperty configDictForService:@"vtcm"];
  CFStringRef v52 = v15;
  v16 = +[ASDTIOPAudioVTOccurredProperty configDictForService:@"vtcm"];
  CFStringRef v53 = v16;
  v17 = +[NSArray arrayWithObjects:&v48 count:6];
  v44 = v17;
  qword_8188 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v60 count:5];

  CFStringRef v40 = v0;
  CFStringRef v41 = v39;
  CFStringRef v48 = @"ASDTIOPAudioLPMicDevice";
  CFStringRef v49 = v38;
  CFStringRef v50 = @"lpai";
  CFStringRef v42 = v9;
  v43 = v37;
  CFStringRef v65 = v0;
  CFStringRef v66 = v9;
  CFStringRef v60 = @"ASDTIOPAudioLPMicStream";
  CFStringRef v61 = @"adpx";
  v18 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v65 count:2];
  CFStringRef v56 = v18;
  v19 = +[NSArray arrayWithObjects:&v56 count:1];
  v51 = v19;
  qword_8190 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v40 count:4];

  CFStringRef v60 = v0;
  CFStringRef v61 = v39;
  CFStringRef v40 = @"ASDTIOPAudioLPMicDevice";
  CFStringRef v41 = v38;
  CFStringRef v42 = @"lpai";
  CFStringRef v62 = v9;
  v63 = v37;
  CFStringRef v56 = v0;
  CFStringRef v57 = v9;
  CFStringRef v65 = @"ASDTIOPAudioLPMicStream";
  CFStringRef v66 = @"adpx";
  CFStringRef v30 = (const __CFString *)kASDTConfigKeyStreamExclavesBufferName;
  uint64_t v58 = kASDTConfigKeyStreamExclavesBufferName;
  CFStringRef v67 = @"com.apple.audio.lpmic";
  v20 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v56 count:3];
  v59 = v20;
  v34 = +[NSArray arrayWithObjects:&v59 count:1];
  v43 = v34;
  uint64_t v64 = v35;
  v36 = +[ASDTIOPAudioLPMicDevice enableListeningPropertyForService:@"lai "];
  CFStringRef v48 = v36;
  v31 = +[ASDTIOPAudioVTActiveChannelMaskProperty configDictForService:@"vtcm"];
  CFStringRef v49 = v31;
  v21 = +[ASDTIOPAudioVTAvailableProperty configDictForService:@"vtcm"];
  CFStringRef v50 = v21;
  v22 = +[ASDTIOPAudioVTConfigurationProperty configDictForService:@"vtcm"];
  v51 = v22;
  v23 = +[ASDTIOPAudioVTDebugProperty configDictForService:@"vtcm"];
  CFStringRef v52 = v23;
  v24 = +[ASDTIOPAudioVTModelCRCProperty configDictForService:@"vtcm"];
  CFStringRef v53 = v24;
  v25 = +[ASDTIOPAudioVTEnableProperty configDictForService:@"vtcm"];
  v54 = v25;
  v26 = +[ASDTIOPAudioVTOccurredProperty configDictForService:@"vtcm"];
  v55 = v26;
  v27 = +[NSArray arrayWithObjects:&v48 count:8];
  v44 = v27;
  qword_8198 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v60 count:5];

  CFStringRef v40 = v0;
  CFStringRef v41 = v39;
  CFStringRef v48 = @"ASDTIOPAudioLPMicDevice";
  CFStringRef v49 = v38;
  CFStringRef v50 = @"lpai";
  CFStringRef v42 = v9;
  v43 = v37;
  CFStringRef v65 = v0;
  CFStringRef v66 = v9;
  CFStringRef v60 = @"ASDTIOPAudioLPMicStream";
  CFStringRef v61 = @"adpx";
  CFStringRef v67 = v30;
  CFStringRef v62 = @"com.apple.audio.lpmic";
  v28 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v65 count:3];
  CFStringRef v56 = v28;
  v29 = +[NSArray arrayWithObjects:&v56 count:1];
  v51 = v29;
  qword_81A0 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v40 count:4];
}

void sub_3670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ASDT::IORegistry::EntryAtPathExists(ASDT::IORegistry *this, const char *a2)
{
  return ASDT::IORegistry::EntryAtPathExists(this, a2);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_configForMic(void *a1, const char *a2, ...)
{
  return [a1 configForMic];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_driverRef(void *a1, const char *a2, ...)
{
  return [a1 driverRef];
}

id objc_msgSend_exclavesAvailable(void *a1, const char *a2, ...)
{
  return [a1 exclavesAvailable];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_sharedPlugin(void *a1, const char *a2, ...)
{
  return [a1 sharedPlugin];
}