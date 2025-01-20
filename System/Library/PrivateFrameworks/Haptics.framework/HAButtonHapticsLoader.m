@interface HAButtonHapticsLoader
+ (id)sharedInstance;
- (BOOL)hapticAssetType:(int64_t)a3 hasAudio:(BOOL *)a4 hasHaptic:(BOOL *)a5 error:(id *)a6;
- (BOOL)loadButtonHapticOfType:(int64_t)a3 atSlot:(int64_t)a4 error:(id *)a5;
- (BOOL)loadButtonHapticOfType:(int64_t)a3 withParameters:(id)a4 atSlot:(int64_t)a5 error:(id *)a6;
- (BOOL)serviceAvailable;
- (float)audioGainForType:(int64_t)a3;
- (float)defaultDownGainForType:(int64_t)a3;
- (float)defaultUpGainForType:(int64_t)a3;
- (float)hapticGainForType:(int64_t)a3;
- (int64_t)maxNumberOfSlots;
- (void)dealloc;
@end

@implementation HAButtonHapticsLoader

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)HAButtonHapticsLoader;
  [(HAButtonHapticsLoader *)&v2 dealloc];
}

+ (id)sharedInstance
{
  if (+[HAButtonHapticsLoader sharedInstance]::onceToken != -1) {
    dispatch_once(&+[HAButtonHapticsLoader sharedInstance]::onceToken, &__block_literal_global);
  }
  objc_super v2 = (void *)gHapticsWaveLoader;
  return v2;
}

void __39__HAButtonHapticsLoader_sharedInstance__block_invoke()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v0 = objc_alloc_init(HAButtonHapticsLoader);
  v1 = (void *)gHapticsWaveLoader;
  gHapticsWaveLoader = (uint64_t)v0;

  gNotificationPort = (uint64_t)IONotificationPortCreate(*MEMORY[0x263F0EC90]);
  CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)gNotificationPort);
  if (!RunLoopSource)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    v9 = &_os_log_internal;
    v10 = "Haptics IONotificationPortGetRunLoopSource returned NULL";
LABEL_20:
    uint32_t v11 = 2;
LABEL_21:
    _os_log_impl(&dword_2217BB000, v9, OS_LOG_TYPE_ERROR, v10, buf, v11);
    return;
  }
  v3 = RunLoopSource;
  Current = CFRunLoopGetCurrent();
  if (!Current)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    v9 = &_os_log_internal;
    v10 = "Haptics CFRunLoopGetCurrent returned NULL";
    goto LABEL_20;
  }
  CFRunLoopAddSource(Current, v3, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  v5 = (IONotificationPort *)gNotificationPort;
  int v12 = 1;
  applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[31],int>((applesauce::CF::TypeRef *)&v14, "Button Haptics Asset Interface", &v12);
  *(void *)buf = &v14;
  uint64_t v17 = 1;
  CFTypeRef CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef((uint64_t)buf);
  if (cf) {
    CFRelease(cf);
  }
  if (v14) {
    CFRelease(v14);
  }
  applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[16],applesauce::CF::DictionaryRef &>((applesauce::CF::TypeRef *)&v14, "IOPropertyMatch", &CFDictionaryRef);
  *(void *)buf = &v14;
  uint64_t v17 = 1;
  CFDictionaryRef v6 = applesauce::CF::details::make_CFDictionaryRef((uint64_t)buf);
  if (cf) {
    CFRelease(cf);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (CFDictionaryRef) {
    CFRelease(CFDictionaryRef);
  }
  v7 = (void *)IOServiceAddMatchingNotification(v5, "IOServiceMatched", v6, (IOServiceMatchingCallback)MatchingNotificationHandler, 0, (io_iterator_t *)&gIOIterator);
  int v8 = (int)v7;
  if (v7)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    v9 = &_os_log_internal;
    v10 = "Haptics IOServiceAddMatchingNotification err %d";
    uint32_t v11 = 8;
    goto LABEL_21;
  }
  MatchingNotificationHandler(v7, gIOIterator);
}

- (BOOL)loadButtonHapticOfType:(int64_t)a3 atSlot:(int64_t)a4 error:(id *)a5
{
  return [(HAButtonHapticsLoader *)self loadButtonHapticOfType:a3 withParameters:0 atSlot:a4 error:a5];
}

- (BOOL)loadButtonHapticOfType:(int64_t)a3 withParameters:(id)a4 atSlot:(int64_t)a5 error:(id *)a6
{
  __int16 v7 = a5;
  uint64_t v53 = *MEMORY[0x263EF8340];
  CFDictionaryRef v9 = (const __CFDictionary *)a4;
  id v10 = (id)*MEMORY[0x263F08410];
  if (a6) {
    *a6 = 0;
  }
  if (gServiceAvailable == 1)
  {
    uint32_t v11 = (_WORD *)_sharedMemoryPtr;
    bzero((void *)_sharedMemoryPtr, _sharedMemorySize);
    *uint32_t v11 = v7;
    v43 = 0;
    int Property = dictForType(a3, &v43);
    if (Property)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
        __int16 v45 = 1024;
        int v46 = 361;
        __int16 v47 = 2080;
        v48 = "result = dictForType(type, typeDictionary)";
        __int16 v49 = 1024;
        int v50 = Property;
        __int16 v51 = 2080;
        v52 = "FAIL";
        _os_log_impl(&dword_2217BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_require_noerr: [%s, %d] (goto %s;)",
          buf,
          0x2Cu);
      }
      unsigned int v32 = 2;
LABEL_42:
      BOOL v33 = v32 == 0;
      if (v32 <= 1) {
        int v34 = 1;
      }
      else {
        int v34 = v32;
      }
      if (v34 != 2) {
        goto LABEL_50;
      }
      goto LABEL_46;
    }
    v13 = v43;
    v42 = v43;
    CFStringRef String = (const __CFString *)getString(v43, @"AudioFilePath");
    if (String)
    {
      CFURLRef v15 = CFURLCreateWithFileSystemPath(0, String, kCFURLPOSIXPathStyle, 0);
      *(double *)&AudioFileID outAudioFile = 0.0;
      int Property = AudioFileOpenURL(v15, kAudioFileReadPermission, 0, &outAudioFile);
      CFRelease(v15);
      if (Property)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
        __int16 v45 = 1024;
        int v46 = 372;
        __int16 v47 = 2080;
        v48 = "result";
        __int16 v49 = 1024;
        int v50 = Property;
        __int16 v51 = 2080;
        v52 = "FAIL";
        v36 = &_os_log_internal;
        goto LABEL_70;
      }
      unint64_t outPropertyData = 0;
      UInt32 ioDataSize = 8;
      int Property = AudioFileGetProperty(outAudioFile, 0x62636E74u, &ioDataSize, &outPropertyData);
      if (Property)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
        __int16 v45 = 1024;
        int v46 = 376;
        __int16 v47 = 2080;
        v48 = "result = AudioFileGetProperty(afid, kAudioFilePropertyAudioDataByteCount, &propSize, &numBytes64)";
        __int16 v49 = 1024;
        int v50 = Property;
        __int16 v51 = 2080;
        v52 = "FAIL";
        v36 = &_os_log_internal;
        goto LABEL_70;
      }
      UInt32 v16 = outPropertyData;
      if (outPropertyData >= 0x800) {
        UInt32 v16 = 2048;
      }
      UInt32 ioNumBytes = v16;
      int Property = AudioFileReadBytes(outAudioFile, 1u, 0, &ioNumBytes, v11 + 1030);
      if (Property)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
        __int16 v45 = 1024;
        int v46 = 379;
        __int16 v47 = 2080;
        v48 = "result = AudioFileReadBytes(afid, true, 0, &numBytes, buttonInfo.audioWaveformBuffer)";
        __int16 v49 = 1024;
        int v50 = Property;
        __int16 v51 = 2080;
        v52 = "FAIL";
        v36 = &_os_log_internal;
        goto LABEL_70;
      }
      UInt32 ioDataSize = 40;
      int Property = AudioFileGetProperty(outAudioFile, 0x64666D74u, &ioDataSize, v37);
      if (Property)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
        __int16 v45 = 1024;
        int v46 = 383;
        __int16 v47 = 2080;
        v48 = "result = AudioFileGetProperty(afid, kAudioFilePropertyDataFormat, &propSize, &fmt)";
        __int16 v49 = 1024;
        int v50 = Property;
        __int16 v51 = 2080;
        v52 = "FAIL";
        v36 = &_os_log_internal;
        goto LABEL_70;
      }
      double v17 = v37[0];
      AudioFileClose(outAudioFile);
      v11[1029] = ioNumBytes >> 1;
    }
    else
    {
      bzero(v11 + 1029, 0x802uLL);
      double v17 = 48000.0;
    }
    CFStringRef v18 = (const __CFString *)getString(v13, @"HapticFilePath");
    if (!v18)
    {
      int Property = 0;
      if (a6) {
        *a6 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v10 code:-50 userInfo:0];
      }
      unsigned int v32 = 1;
      goto LABEL_41;
    }
    CFURLRef v19 = CFURLCreateWithFileSystemPath(0, v18, kCFURLPOSIXPathStyle, 0);
    *(double *)&AudioFileID outAudioFile = 0.0;
    int Property = AudioFileOpenURL(v19, kAudioFileReadPermission, 0, &outAudioFile);
    CFRelease(v19);
    if (Property)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
      __int16 v45 = 1024;
      int v46 = 408;
      __int16 v47 = 2080;
      v48 = "result";
      __int16 v49 = 1024;
      int v50 = Property;
      __int16 v51 = 2080;
      v52 = "FAIL";
      v36 = &_os_log_internal;
    }
    else
    {
      unint64_t outPropertyData = 0;
      UInt32 ioDataSize = 8;
      int Property = AudioFileGetProperty(outAudioFile, 0x62636E74u, &ioDataSize, &outPropertyData);
      if (Property)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
        __int16 v45 = 1024;
        int v46 = 412;
        __int16 v47 = 2080;
        v48 = "result = AudioFileGetProperty(afid, kAudioFilePropertyAudioDataByteCount, &propSize, &numBytes64)";
        __int16 v49 = 1024;
        int v50 = Property;
        __int16 v51 = 2080;
        v52 = "FAIL";
        v36 = &_os_log_internal;
      }
      else
      {
        UInt32 v20 = outPropertyData;
        if (outPropertyData >= 0x800) {
          UInt32 v20 = 2048;
        }
        UInt32 ioNumBytes = v20;
        int Property = AudioFileReadBytes(outAudioFile, 1u, 0, &ioNumBytes, v11 + 5);
        if (!Property)
        {
          UInt32 ioDataSize = 40;
          int Property = AudioFileGetProperty(outAudioFile, 0x64666D74u, &ioDataSize, v37);
          if (!Property)
          {
            double v21 = v37[0];
            AudioFileClose(outAudioFile);
            v11[4] = ioNumBytes >> 1;
            if (v11[1029])
            {
              *(void *)buf = 0x3F847AE147AE147BLL;
              getFloat64(v13, @"AudioPreSilence", (double *)buf);
              __int16 v22 = vcvtmd_s64_f64(*(double *)buf * v17 + 0.5);
            }
            else
            {
              __int16 v22 = 0;
            }
            *(void *)buf = 0x3F847AE147AE147BLL;
            getFloat64(v13, @"HapticPreSilence", (double *)buf);
            double v23 = *(double *)buf;
            v37[0] = 0.01;
            getFloat64(v13, @"PostSilence", v37);
            __int16 v24 = vcvtmd_s64_f64(v23 * v21 + 0.5);
            __int16 v25 = vcvtmd_s64_f64(v37[0] * v21 + 0.5);
            if (v9)
            {
              *(void *)buf = 0;
              if (getFloat64(v9, @"AudioPreSilence", (double *)buf) && v11[1029]) {
                __int16 v22 = vcvtmd_s64_f64(*(double *)buf * v17 + 0.5);
              }
              v37[0] = 0.0;
              int Float64 = getFloat64(v9, @"HapticPreSilence", v37);
              double v27 = v37[0];
              *(double *)&AudioFileID outAudioFile = 0.0;
              int v28 = getFloat64(v9, @"PostSilence", (double *)&outAudioFile);
              __int16 v29 = vcvtmd_s64_f64(v27 * v21 + 0.5);
              if (Float64) {
                __int16 v24 = v29;
              }
              __int16 v30 = vcvtmd_s64_f64(*(double *)&outAudioFile * v21 + 0.5);
              if (v28) {
                __int16 v25 = v30;
              }
            }
            v11[1] = v22;
            v11[2] = v24;
            v11[3] = v25;
            int Property = IOConnectCallStructMethod(gButtonServiceConnection, 0, 0, 0, 0, 0);
            if (Property)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = Property;
                _os_log_impl(&dword_2217BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Haptics IOConnectCallStructMethod UpdateSSHBAsset err %d", buf, 8u);
              }
              id v31 = (id)*MEMORY[0x263F08350];

              unsigned int v32 = 2;
              id v10 = v31;
            }
            else
            {
              unsigned int v32 = 0;
            }
            goto LABEL_41;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
            __int16 v45 = 1024;
            int v46 = 419;
            __int16 v47 = 2080;
            v48 = "result = AudioFileGetProperty(afid, kAudioFilePropertyDataFormat, &propSize, &fmt)";
            __int16 v49 = 1024;
            int v50 = Property;
            __int16 v51 = 2080;
            v52 = "FAIL";
            v36 = &_os_log_internal;
            goto LABEL_70;
          }
LABEL_71:
          unsigned int v32 = 2;
LABEL_41:
          CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v42);
          goto LABEL_42;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
        __int16 v45 = 1024;
        int v46 = 415;
        __int16 v47 = 2080;
        v48 = "result = AudioFileReadBytes(afid, true, 0, &numBytes, buttonInfo.hapticWaveformBuffer)";
        __int16 v49 = 1024;
        int v50 = Property;
        __int16 v51 = 2080;
        v52 = "FAIL";
        v36 = &_os_log_internal;
      }
    }
LABEL_70:
    _os_log_impl(&dword_2217BB000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_require_noerr: [%s, %d] (goto %s;)",
      buf,
      0x2Cu);
    goto LABEL_71;
  }
  int Property = 1936881185;
LABEL_46:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = Property;
    _os_log_impl(&dword_2217BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Haptics loadButtonHapticOfType FAILED %d", buf, 8u);
  }
  BOOL v33 = 0;
  if (a6) {
    *a6 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v10 code:Property userInfo:0];
  }
LABEL_50:

  return v33;
}

- (BOOL)hapticAssetType:(int64_t)a3 hasAudio:(BOOL *)a4 hasHaptic:(BOOL *)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = (id)*MEMORY[0x263F08410];
  if (a6) {
    *a6 = 0;
  }
  CFTypeRef v14 = 0;
  int v11 = dictForType(a3, &v14);
  if (v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "HAButtonHapticsLoader.mm";
      __int16 v16 = 1024;
      int v17 = 527;
      __int16 v18 = 2080;
      CFURLRef v19 = "result = dictForType(type, typeDictionary)";
      __int16 v20 = 1024;
      int v21 = v11;
      __int16 v22 = 2080;
      double v23 = "FAIL";
      _os_log_impl(&dword_2217BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_require_noerr: [%s, %d] (goto %s;)",
        buf,
        0x2Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v11;
      _os_log_impl(&dword_2217BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Haptics loadButtonHapticOfType FAILED %d", buf, 8u);
    }
    if (a6) {
      *a6 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v10 code:v11 userInfo:0];
    }
  }
  else
  {
    int v12 = v14;
    *(void *)buf = v14;
    if (a4) {
      *a4 = getString(v14, @"AudioFilePath") != 0;
    }
    if (a5) {
      *a5 = getString(v12, @"HapticFilePath") != 0;
    }
    CFDictionaryReleaser::~CFDictionaryReleaser((const void **)buf);
  }

  return v11 == 0;
}

- (float)defaultDownGainForType:(int64_t)a3
{
  int v8 = 0;
  int v3 = dictForType(a3, &v8);
  __int16 v7 = v8;
  float v4 = 0.0;
  if (!v3)
  {
    double v6 = 0.0;
    getFloat64(v8, @"DownGain", &v6);
    float v4 = v6;
  }
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v7);
  return v4;
}

- (float)defaultUpGainForType:(int64_t)a3
{
  int v8 = 0;
  int v3 = dictForType(a3, &v8);
  __int16 v7 = v8;
  float v4 = 0.5;
  if (!v3)
  {
    double v6 = 0.0;
    getFloat64(v8, @"UpGain", &v6);
    float v4 = v6;
  }
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v7);
  return v4;
}

- (float)hapticGainForType:(int64_t)a3
{
  int v8 = 0;
  int v3 = dictForType(a3, &v8);
  __int16 v7 = v8;
  float v4 = 0.5;
  if (!v3)
  {
    double v6 = 0.0;
    getFloat64(v8, @"HapticGain", &v6);
    float v4 = v6;
  }
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v7);
  return v4;
}

- (float)audioGainForType:(int64_t)a3
{
  int v8 = 0;
  int v3 = dictForType(a3, &v8);
  __int16 v7 = v8;
  float v4 = 0.5;
  if (!v3)
  {
    double v6 = 0.0;
    getFloat64(v8, @"AudioGain", &v6);
    float v4 = v6;
  }
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v7);
  return v4;
}

- (int64_t)maxNumberOfSlots
{
  return gNumberOfSlots;
}

- (BOOL)serviceAvailable
{
  return gServiceAvailable;
}

@end