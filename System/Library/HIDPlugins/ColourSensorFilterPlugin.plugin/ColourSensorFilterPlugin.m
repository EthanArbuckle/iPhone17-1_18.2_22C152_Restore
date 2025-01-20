uint64_t ColorSensorPlugIn::filter(uint64_t a1, uint64_t a2)
{
  return ColorSensorPlugIn::filter(a1, a2, 0);
}

uint64_t ColorSensorPlugIn::match()
{
  if (IOHIDServiceConformsTo())
  {
    uint64_t v0 = IOHIDServiceCopyProperty();
    if (v0)
    {
      CFArrayRef v1 = (const __CFArray *)v0;
      CFTypeID TypeID = CFArrayGetTypeID();
      if (TypeID == CFGetTypeID(v1))
      {
        if (CFArrayGetCount(v1) >= 1)
        {
          CFIndex v3 = 0;
          while (1)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, v3);
            CFTypeID v5 = CFStringGetTypeID();
            if (v5 == CFGetTypeID(ValueAtIndex)
              && (CFEqual(@"als,ct709", ValueAtIndex)
               || CFEqual(@"als,ct711", ValueAtIndex)
               || CFEqual(@"als,ct720", ValueAtIndex)
               || CFEqual(@"als,tcs3490", ValueAtIndex)))
            {
              break;
            }
            if (CFArrayGetCount(v1) <= ++v3) {
              goto LABEL_23;
            }
          }
          inited = qword_20108;
          if (!qword_20108)
          {
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              inited = init_default_corebrightness_log();
            }
          }
          if (!os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          int v12 = 136446210;
          CStringPtr = CFStringGetCStringPtr(ValueAtIndex, 0x600u);
          goto LABEL_46;
        }
      }
      else
      {
        CFTypeID v6 = CFStringGetTypeID();
        if (v6 == CFGetTypeID(v1)
          && (CFEqual(@"als,ct709", v1)
           || CFEqual(@"als,ct711", v1)
           || CFEqual(@"als,ct720", v1)
           || CFEqual(@"als,tcs3490", v1)))
        {
          inited = qword_20108;
          if (!qword_20108)
          {
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              inited = init_default_corebrightness_log();
            }
          }
          if (!os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
LABEL_22:
          int v12 = 136446210;
          CStringPtr = CFStringGetCStringPtr((CFStringRef)v1, 0x600u);
LABEL_46:
          _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Matched on: %{public}s\n", (uint8_t *)&v12, 0xCu);
          goto LABEL_47;
        }
      }
LABEL_23:
      CFRelease(v1);
    }
    uint64_t v8 = IOHIDServiceCopyProperty();
    if (v8)
    {
      CFArrayRef v1 = (const __CFArray *)v8;
      CFTypeID v9 = CFStringGetTypeID();
      if (v9 != CFGetTypeID(v1)
        || !CFEqual(@"AppleSPUCT709", v1)
        && !CFEqual(@"AppleSPUCT720", v1)
        && !CFEqual(@"AppleSPUCT721", v1)
        && !CFEqual(@"AppleSPUCT724", v1)
        && !CFEqual(@"AppleSPUCT725", v1)
        && !CFEqual(@"AppleSPUCT726", v1)
        && !CFEqual(@"AppleSPUVD6286", v1)
        && !CFEqual(@"AppleSPUVD6287", v1))
      {
        uint64_t v10 = 0;
LABEL_48:
        CFRelease(v1);
        return v10;
      }
      inited = qword_20108;
      if (!qword_20108)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (!os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
      {
LABEL_47:
        uint64_t v10 = 1000;
        goto LABEL_48;
      }
      goto LABEL_22;
    }
  }
  return 0;
}

uint64_t ColorSensorPlugIn::Release(ColorSensorPlugIn *this)
{
  int v1 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = v1 - 1;
  if (v1 == 1)
  {
    if (*((void *)this + 12)) {
      operator delete[]();
    }
    if (*((void *)this + 11)) {
      operator delete[]();
    }
    if (*((void *)this + 13)) {
      operator delete[]();
    }
    ColorSensorPlugIn::~ColorSensorPlugIn((CFUUIDRef *)this);
    operator delete();
  }
  return (v1 - 1);
}

void ColorSensorPlugIn::~ColorSensorPlugIn(CFUUIDRef *this)
{
}

ColorSensorPlugIn *ColorSensorPlugInFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  v4 = (ColorSensorPlugIn *)CFAllocatorAllocate(kCFAllocatorDefault, 280, 0);
  CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xD1u, 0x14u, 0x8Fu, 0xE3u, 0x60u, 0xF3u, 0x4Bu, 0x3Bu, 0x85u, 5u, 0xE2u, 0x8Cu, 0x1Eu, 0x66u, 0xEBu, 0xC8u);
  ColorSensorPlugIn::ColorSensorPlugIn(v4, v5);
  return v4;
}

void ColorSensorPlugIn::ColorSensorPlugIn(ColorSensorPlugIn *this, CFTypeRef cf)
{
  *(void *)this = &ColorSensorPlugIn::sColorSensorPlugInFtbl;
  *((void *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *((unsigned char *)this + 148) = 0;
  *((unsigned char *)this + 176) = 0;
  *((unsigned char *)this + 208) = 0;
  *((_DWORD *)this + 53) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 11) = 0;
  *(void *)((char *)this + 236) = 1;
  *((unsigned char *)this + 264) = 0;
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
  *((void *)this + 19) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0;
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 23) = 0;
  *((void *)this + 17) = 0;
  *((_DWORD *)this + 36) = 0;
  qword_20108 = (uint64_t)os_log_create("com.apple.CoreBrightness.ColourSensorFilterPlugin", "default");
  mach_timebase_info(&info);
  LODWORD(v4) = info.numer;
  LODWORD(v5) = info.denom;
  *((double *)this + 34) = (double)v4 / (double)v5 * 0.000000001;
}

uint64_t ColorSensorPlugIn::QueryInterface(ColorSensorPlugIn *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 5u, 5u, 0xD7u, 0x8Du, 0x4Fu, 0x4Eu, 0x4Cu, 0x41u, 0xA3u, 0xA6u, 0xC7u, 0xA7u, 0x7Bu, 0x41u, 0xBDu, 0xACu);
  if (CFEqual(v5, v6)
    || (v7 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xC7u, 0x10u, 0x95u, 0x1Du, 0x18u, 0x40u, 0x45u, 0x6Eu, 0x82u, 0xE7u, 0xFCu, 0xA1u, 0xA0u, 0xFAu, 0x7Fu, 0xE4u), CFEqual(v5, v7))|| (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(
               kCFAllocatorSystemDefault,
               0,
               0,
               0,
               0,
               0,
               0,
               0,
               0,
               0xC0u,
               0,
               0,
               0,
               0,
               0,
               0,
               0x46u),
        CFEqual(v5, v8)))
  {
    uint64_t v9 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    uint64_t v9 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v9;
}

void ColorSensorPlugIn::setPropertyForClient(ColorSensorPlugIn *this, CFTypeRef cf1, const void *a3, const void *a4)
{
  if (CFEqual(cf1, @"RGBCOverride"))
  {
    CFTypeID v7 = CFGetTypeID(a3);
    if (v7 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr);
      *((unsigned char *)this + 148) = valuePtr != 0;
      inited = qword_20108;
      if (!qword_20108)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
        sub_1743C();
      }
    }
    else
    {
      CFTypeID v11 = CFGetTypeID(a3);
      if (v11 == CFArrayGetTypeID())
      {
        int Count = CFArrayGetCount((CFArrayRef)a3);
        if (*((_DWORD *)this + 16) == Count)
        {
          *((unsigned char *)this + 148) = 1;
          if (Count >= 1)
          {
            CFIndex v13 = 0;
            uint64_t v14 = Count;
            v15 = (int *)((char *)this + 152);
            do
            {
              CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)a3, v13);
              if (ValueAtIndex)
              {
                CFNumberGetValue(ValueAtIndex, kCFNumberIntType, v15);
                v17 = qword_20108;
                if (!qword_20108)
                {
                  v17 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                    v17 = init_default_corebrightness_log();
                  }
                }
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  int v18 = *v15;
                  int valuePtr = 67109376;
                  LODWORD(v51[0]) = v13;
                  WORD2(v51[0]) = 1024;
                  *(_DWORD *)((char *)v51 + 6) = v18;
                  _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "Override ch[%d]: %d", (uint8_t *)&valuePtr, 0xEu);
                }
              }
              ++v13;
              ++v15;
            }
            while (v14 != v13);
          }
        }
      }
    }
    return;
  }
  if (CFEqual(cf1, @"ChromaticityOverride"))
  {
    CFTypeID v9 = CFGetTypeID(a3);
    if (v9 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr);
      *((unsigned char *)this + 176) = valuePtr != 0;
      uint64_t v10 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v10 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_17274();
      }
    }
    else
    {
      CFTypeID v27 = CFGetTypeID(a3);
      if (v27 == CFArrayGetTypeID())
      {
        int v28 = CFArrayGetCount((CFArrayRef)a3);
        if (v28 >= 2)
        {
          *((unsigned char *)this + 176) = 1;
          CFNumberRef v29 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)a3, 0);
          if (v29)
          {
            CFNumberGetValue(v29, kCFNumberDoubleType, (char *)this + 184);
            v30 = qword_20108;
            if (!qword_20108)
            {
              v30 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v30 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              sub_173D0();
            }
          }
          CFNumberRef v31 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)a3, 1);
          if (v31)
          {
            CFNumberGetValue(v31, kCFNumberDoubleType, (char *)this + 192);
            v32 = qword_20108;
            if (!qword_20108)
            {
              v32 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v32 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
              sub_17364();
            }
          }
          if (v28 < 3)
          {
            *((void *)this + 25) = 0xBFF0000000000000;
          }
          else
          {
            CFNumberRef v33 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)a3, 2);
            if (v33)
            {
              CFNumberGetValue(v33, kCFNumberDoubleType, (char *)this + 200);
              v34 = qword_20108;
              if (!qword_20108)
              {
                v34 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                  v34 = init_default_corebrightness_log();
                }
              }
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                sub_172F8();
              }
            }
          }
        }
      }
    }
    return;
  }
  if (CFEqual(cf1, @"ColorAlgoLambda"))
  {
    CFTypeID v19 = CFGetTypeID(a3);
    if (v19 == CFNumberGetTypeID())
    {
      v20 = (float *)((char *)this + 212);
      CFNumberGetValue((CFNumberRef)a3, kCFNumberFloatType, (char *)this + 212);
      v21 = qword_20108;
      if (!qword_20108)
      {
        v21 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v21 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        double v22 = *v20;
        int valuePtr = 134217984;
        *(double *)v51 = v22;
        v23 = "Setting lambda %f.";
        v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
        uint32_t v26 = 12;
LABEL_86:
        _os_log_impl(&dword_0, v24, v25, v23, (uint8_t *)&valuePtr, v26);
        return;
      }
    }
    return;
  }
  if (!CFEqual(cf1, @"ChannelRatioMitigationType"))
  {
    if (!CFEqual(cf1, @"RebuildHarmonyDB"))
    {
      if (CFEqual(cf1, @"AmbientLightSensorCalibration"))
      {
        CFTypeID TypeID = CFDataGetTypeID();
        if (TypeID == CFGetTypeID(a3))
        {
          ColorSensorPlugIn::processFDRCalibration(this, (CFDataRef)a3, 1);
        }
      }
      return;
    }
    v39 = qword_20108;
    if (!qword_20108)
    {
      v39 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        v39 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      LOWORD(valuePtr) = 0;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Rebuild databases.", (uint8_t *)&valuePtr, 2u);
    }
    uint64_t Property = IOHIDServiceGetProperty();
    if (Property)
    {
      CFBooleanRef v41 = (const __CFBoolean *)Property;
      CFTypeID v42 = CFBooleanGetTypeID();
      if (v42 == CFGetTypeID(v41))
      {
        int Value = CFBooleanGetValue(v41);
        v44 = qword_20108;
        if (!qword_20108)
        {
          v44 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v44 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = "Use";
          if (!Value) {
            v45 = "Don't use";
          }
          int valuePtr = 136315138;
          v51[0] = v45;
          _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "%s sysconfig calibration to calibrate sensor\n", (uint8_t *)&valuePtr, 0xCu);
        }
        if (Value) {
          goto LABEL_80;
        }
      }
    }
    CFBooleanRef v46 = (const __CFBoolean *)IOHIDServiceGetProperty();
    if (v46 && v46 == kCFBooleanTrue)
    {
LABEL_80:
      if (ColorSensorPlugIn::processSysConfigCalibration(this, 0, 0, 1))
      {
LABEL_81:
        v47 = qword_20108;
        if (!qword_20108)
        {
          v47 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v47 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          LOWORD(valuePtr) = 0;
          v23 = "Databases were rebuilt successfully.";
          v24 = v47;
          os_log_type_t v25 = OS_LOG_TYPE_INFO;
          uint32_t v26 = 2;
          goto LABEL_86;
        }
        return;
      }
    }
    else if (ColorSensorPlugIn::loadFDRCalibration((uint64_t)this, 1, (int *)this + 60))
    {
      goto LABEL_81;
    }
    v49 = qword_20108;
    if (!qword_20108)
    {
      v49 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        v49 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_17240();
    }
    return;
  }
  CFTypeID v35 = CFGetTypeID(a3);
  if (v35 == CFNumberGetTypeID())
  {
    v36 = (int *)((char *)this + 220);
    CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, (char *)this + 220);
    v37 = qword_20108;
    if (!qword_20108)
    {
      v37 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        v37 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = *v36;
      int valuePtr = 67109120;
      LODWORD(v51[0]) = v38;
      v23 = "Setting channel ratio mitigation type %d.";
      v24 = v37;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      uint32_t v26 = 8;
      goto LABEL_86;
    }
  }
}

uint64_t ColorSensorPlugIn::filter(uint64_t a1, uint64_t a2, int a3)
{
  if (a2)
  {
    uint64_t Type = IOHIDEventGetType();
    if (Type == 12)
    {
      CFTypeID v7 = (unsigned int *)(a1 + 60);
      __chkstk_darwin(Type);
      CFTypeID v9 = (float *)((char *)&v47[-1] - ((v8 + 15) & 0x7FFFFFFF0));
      float v60 = 0.0;
      unint64_t v59 = 0;
      if (*(unsigned char *)(a1 + 176))
      {
        double v10 = *(double *)(a1 + 192);
        if (v10 > 0.0)
        {
          double v11 = *(double *)(a1 + 184);
          double v12 = *(double *)(a1 + 200);
          if (v12 >= 0.0)
          {
            IOHIDEventSetFloatValue();
            IOHIDEventSetDoubleValue();
          }
          else
          {
            IOHIDEventGetDoubleValue();
            double v12 = v13;
          }
          double v19 = v12 / v10;
          *(float *)&unsigned int v20 = v11 * (v12 / v10);
          *(float *)&unsigned int v21 = v12;
          unint64_t v59 = __PAIR64__(v21, v20);
          float v22 = (1.0 - v11 - v10) * v19;
          float v60 = v22;
          IOHIDEventSetDoubleValue();
          IOHIDEventSetDoubleValue();
LABEL_16:
          IOHIDEventSetDoubleValue();
          IOHIDEventSetIntegerValue();
          goto LABEL_17;
        }
      }
      CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
      if (Children)
      {
        if (CFArrayGetValueAtIndex(Children, 0))
        {
          Dataint Value = IOHIDEventGetDataValue();
          if (DataValue)
          {
            uint64_t v16 = DataValue;
            Integerint Value = IOHIDEventGetIntegerValue();
            memcpy(&v49, (const void *)v16, IntegerValue);
            if (*(unsigned char *)(a1 + 52))
            {
              if (*v7 - 4 > 2)
              {
                inited = qword_20108;
                if (!qword_20108)
                {
                  inited = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                    inited = init_default_corebrightness_log();
                  }
                }
                if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
                  sub_170FC();
                }
                goto LABEL_73;
              }
              if (*v7 == 6) {
                int v18 = 6 - *(_DWORD *)(a1 + 64);
              }
              else {
                int v18 = 0;
              }
              if (*(unsigned char *)(a1 + 216))
              {
                v47[6] = v53;
                v48[0] = *(_OWORD *)v54;
                *(_OWORD *)((char *)v48 + 9) = *(_OWORD *)((char *)&v54[2] + 1);
                v47[2] = v50[1];
                v47[3] = v50[2];
                v47[4] = v51;
                v47[5] = v52;
                v47[0] = v49;
                v47[1] = v50[0];
                if (sub_F9B0((uint64_t)v47, *(_DWORD *)(a1 + 220), *(_DWORD *)(a1 + 224), *(_DWORD *)(a1 + 228)))
                {
                  os_log_type_t v25 = qword_20108;
                  if (!qword_20108)
                  {
                    os_log_type_t v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                      os_log_type_t v25 = init_default_corebrightness_log();
                    }
                  }
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
                    sub_170C8();
                  }
                  IOHIDEventSetFloatValue();
                  unint64_t v59 = 0;
                  float v60 = 0.0;
LABEL_73:
                  *(void *)(a1 + 136) = v59;
                  *(float *)(a1 + 144) = v60;
                  if (BYTE11(v53))
                  {
                    *(void *)(v16 + 108) = v59;
                    *(float *)(v16 + 116) = v60;
                    goto LABEL_17;
                  }
                  IOHIDEventSetDoubleValue();
                  IOHIDEventSetDoubleValue();
                  goto LABEL_16;
                }
              }
              for (uint64_t i = 28; i != 52; i += 4)
              {
                if (*(float *)((char *)&v50[-1] + i) < 0.0) {
                  *(_DWORD *)((char *)&v50[-1] + i) = 0;
                }
              }
              uint64_t v27 = *(unsigned int *)(a1 + 64);
              if (v27)
              {
                uint64_t v28 = 0;
                unsigned int v29 = *v7;
                do
                {
                  if (v29 > v18 + (int)v28) {
                    v9[v28] = *((float *)v50 + v18 + v28 + 3);
                  }
                  ++v28;
                }
                while (v27 != v28);
                if (!*(unsigned char *)(a1 + 148)) {
                  goto LABEL_47;
                }
                v30 = (float *)v50 + v18 + 3;
                CFNumberRef v31 = (unsigned int *)(a1 + 152);
                v32 = v9;
                do
                {
                  unsigned int v33 = *v31++;
                  *v32++ = (float)v33;
                  *v30++ = (float)v33;
                  --v27;
                }
                while (v27);
              }
              else if (!*(unsigned char *)(a1 + 148))
              {
                LODWORD(v27) = 0;
                goto LABEL_47;
              }
              memcpy((void *)v16, &v49, IntegerValue);
              IOHIDEventSetFloatValue();
              IOHIDEventSetFloatValue();
              IOHIDEventSetFloatValue();
              IOHIDEventSetFloatValue();
              LODWORD(v27) = *(_DWORD *)(a1 + 64);
LABEL_47:
              ColorSensorPlugIn::colourCalculationDynamic((ColorSensorPlugIn *)a1, v9, (float *)&v59, v27);
              if ((*(_DWORD *)(a1 + 228) & 0xFFFFFFFE) != 8)
              {
                v34 = qword_20108;
                if (!qword_20108)
                {
                  v34 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                    v34 = init_default_corebrightness_log();
                  }
                }
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                  sub_16F68((float *)&v49, (float *)&v59, v34);
                }
              }
              if (*((float *)&v59 + 1) <= 0.0)
              {
                unint64_t v59 = 0;
                float v60 = 0.0;
              }
              else
              {
                float v35 = *((float *)v50 + 1) / *((float *)&v59 + 1);
                *(float *)&unint64_t v59 = *(float *)&v59 * (float)(*((float *)v50 + 1) / *((float *)&v59 + 1));
                HIDWORD(v59) = DWORD1(v50[0]);
                float v60 = v35 * v60;
              }
              if (BYTE11(v53))
              {
                v36 = qword_20108;
                if (!qword_20108)
                {
                  v36 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                    v36 = init_default_corebrightness_log();
                  }
                }
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67110656;
                  int v56 = DWORD2(v51);
                  __int16 v57 = 2048;
                  *(double *)v58 = *(float *)&v59;
                  *(_WORD *)&v58[8] = 2048;
                  *(double *)&v58[10] = *((float *)&v59 + 1);
                  *(_WORD *)&v58[18] = 2048;
                  *(double *)&v58[20] = v60;
                  *(_WORD *)&v58[28] = 2048;
                  *(double *)&v58[30] = *(float *)&v54[2];
                  *(_WORD *)&v58[38] = 2048;
                  *(double *)&v58[40] = *(float *)&v54[3];
                  *(_WORD *)&v58[48] = 2048;
                  *(double *)&v58[50] = *(float *)&v54[4];
                  _os_log_debug_impl(&dword_0, v36, OS_LOG_TYPE_DEBUG, "[ColorCalc] ts=%u XYZAP=[%f %f %f] XYZAOP=[%f %f %f]", buf, 0x44u);
                }
                uint64_t v38 = 0;
                *(void *)&long long v37 = 67110914;
                long long v46 = v37;
                do
                {
                  if (v38 != 1)
                  {
                    float v39 = *((float *)&v59 + v38);
                    float v40 = *(float *)&v54[v38 + 2];
                    CFBooleanRef v41 = qword_20108;
                    if (!qword_20108)
                    {
                      CFBooleanRef v41 = _COREBRIGHTNESS_LOG_DEFAULT;
                      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                        CFBooleanRef v41 = init_default_corebrightness_log();
                      }
                    }
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                    {
                      double v42 = vabdd_f64(v39, v40);
                      float v43 = *((float *)&v59 + v38);
                      *(_DWORD *)buf = v46;
                      int v56 = v38;
                      double v44 = v43;
                      __int16 v57 = 1024;
                      v45 = "YES";
                      if (v39 * 0.005 < v42) {
                        v45 = "!!NO!!";
                      }
                      *(_DWORD *)v58 = v38;
                      *(_WORD *)&v58[4] = 2048;
                      *(double *)&v58[6] = v44;
                      *(_WORD *)&v58[14] = 2048;
                      *(double *)&v58[16] = v40;
                      *(_WORD *)&v58[24] = 2048;
                      *(double *)&v58[26] = v42;
                      *(_WORD *)&v58[34] = 2048;
                      *(void *)&v58[36] = 0x3FE0000000000000;
                      *(_WORD *)&v58[44] = 2048;
                      *(double *)&v58[46] = v39 * 0.005;
                      *(_WORD *)&v58[54] = 2080;
                      *(void *)&v58[56] = v45;
                      _os_log_debug_impl(&dword_0, v41, OS_LOG_TYPE_DEBUG, "[ColorCalc] diff(XYZAP[%d], XYZAOP[%d]) = diff(%f, %f) = %f treshholdValue(%.2f%%) = %f isBelowTreshhold = %s", buf, 0x4Au);
                    }
                  }
                  ++v38;
                }
                while (v38 != 3);
              }
              goto LABEL_73;
            }
          }
        }
      }
    }
  }
LABEL_17:
  ColorSensorPlugIn::logALSSample(a1, a2, a3);
  return a2;
}

uint64_t ColorSensorPlugIn::colourCalculationDynamic(ColorSensorPlugIn *this, float *a2, float *a3, int a4)
{
  char v4 = 0;
  if (a2 && a3 && a4 >= 1)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (a2[i] != 0.0)
      {
        if (*((unsigned char *)this + 208)) {
          ColorSensorPlugIn::normalizedByEuklidNorm(this, a2, 1, a4);
        }
        operator new[]();
      }
    }
    a3[2] = 0.0;
    *(void *)a3 = 0;
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
      sub_171D8();
    }
    char v4 = 1;
    if (*a3 < 0.0) {
      *a3 = 0.0;
    }
    if (a3[1] < 0.0) {
      a3[1] = 0.0;
    }
    if (a3[2] < 0.0) {
      a3[2] = 0.0;
    }
    uint64_t v8 = qword_20108;
    if (!qword_20108)
    {
      uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v8 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      double v10 = *a3;
      double v11 = a3[1];
      double v12 = a3[2];
      int v13 = 134219264;
      double v14 = v10;
      __int16 v15 = 2048;
      double v16 = v10 / 3.14159265;
      __int16 v17 = 2048;
      double v18 = v11;
      __int16 v19 = 2048;
      double v20 = v11 / 3.14159265;
      __int16 v21 = 2048;
      double v22 = v12;
      __int16 v23 = 2048;
      double v24 = v12 / 3.14159265;
      _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "Color: X=%f(%f) Y=%f(%f) Z=%f(%f) \n", (uint8_t *)&v13, 0x3Eu);
    }
  }
  return v4 & 1;
}

void hybridSolveWithRegularization(uint64_t a1, int a2, const void *a3, const float *__A, float32x4_t *a5, uint64_t a6, float a7)
{
  if (a7 == 0.0)
  {
    hybridSolve(a1, a2, (uint64_t)a3, __A, a5, a6);
  }
  else
  {
    float __C = 0.0;
    uint64_t v14 = (int)a1;
    vDSP_maxv(__A, 1, &__C, (int)a1);
    if (__C >= 100.0)
    {
      v97 = &v89;
      __chkstk_darwin(v15);
      v94 = (float *)((char *)&v89 - v16);
      bzero((char *)&v89 - v16, v17);
      int v98 = a2;
      uint64_t v18 = a1;
      size_t v19 = 4 * a2 * (int)a1;
      double v20 = (float32x4_t *)malloc_type_malloc(v19, 0x100004052888210uLL);
      uint64_t v96 = v18;
      v99 = (float32x4_t *)malloc_type_malloc(12 * v18, 0x100004052888210uLL);
      size_t v21 = 4 * v14;
      double v22 = malloc_type_malloc(4 * v14, 0x100004052888210uLL);
      __int16 v23 = v22;
      if (v20 && v99 && v22)
      {
        memcpy(v20, a5, v19);
        double v24 = v99;
        memcpy(v99, a3, 12 * v18);
        memcpy(v23, __A, v21);
        int v25 = v96;
        int v26 = v96 - 1;
        if ((int)v96 < 1)
        {
          uint64_t v27 = 0;
          int v28 = v98;
        }
        else
        {
          uint64_t v27 = 0;
          int v28 = v98;
          while (*((float *)v23 + v27) < 100.0)
          {
            if (v96 == ++v27)
            {
              uint64_t v27 = v96;
              goto LABEL_27;
            }
          }
        }
        if (v26 > (int)v27)
        {
          uint64_t v29 = v26;
          uint64_t v30 = v26;
          do
          {
            if (*((float *)v23 + v29) < 100.0)
            {
              uint64_t v31 = v28;
              v32 = v20;
              if (v28 >= 1)
              {
                do
                {
                  __int32 v33 = v32->i32[v30];
                  v32->i32[v30] = v32->i32[(int)v27];
                  v32->i32[(int)v27] = v33;
                  v32 = (float32x4_t *)((char *)v32 + v21);
                  --v31;
                }
                while (v31);
              }
              uint64_t v34 = 3;
              float v35 = v24;
              do
              {
                __int32 v36 = v35->i32[v30];
                v35->i32[v30] = v35->i32[(int)v27];
                v35->i32[(int)v27] = v36;
                float v35 = (float32x4_t *)((char *)v35 + v21);
                --v34;
              }
              while (v34);
              int v37 = *((_DWORD *)v23 + v29);
              *((_DWORD *)v23 + v29) = *((_DWORD *)v23 + (int)v27);
              *((_DWORD *)v23 + (int)v27) = v37;
              uint64_t v38 = (int)v27 + 1;
              do
              {
                uint64_t v27 = v38;
                if (v38 >= v29) {
                  break;
                }
                float v39 = *((float *)v23 + v38++);
              }
              while (v39 < 100.0);
            }
            --v29;
            --v30;
          }
          while (v29 > (int)v27);
        }
LABEL_27:
        int v105 = v25 - v27;
        char __uplo = 85;
        __CLPK_integer v40 = v25 - v27 + v28;
        __CLPK_integer __nrhs = 3;
        __CLPK_integer __ldb = v40;
        CFBooleanRef v41 = (__CLPK_integer *)malloc_type_malloc(4 * v40, 0x100004052888210uLL);
        __CLPK_integer __lwork = -1;
        *(void *)__work = 0;
        double v42 = (__CLPK_real *)malloc_type_calloc((v40 * v40), 4uLL, 0x100004052888210uLL);
        float v43 = (__CLPK_real *)malloc_type_calloc(3 * v40, 4uLL, 0x100004052888210uLL);
        if (v105 <= 0) {
          v95 = 0;
        }
        else {
          v95 = (float *)malloc_type_malloc(4 * v105, 0x100004052888210uLL);
        }
        double v44 = 0;
        if (v41)
        {
          BOOL v45 = !v42 || v43 == 0;
          if (!v45 && v95 != 0)
          {
            v91 = v41;
            uint64_t v47 = v40;
            int v48 = v105;
            if (v105 >= 1)
            {
              int v49 = 0;
              uint64_t v50 = v105;
              do
              {
                v42[v49] = 1.0;
                v49 += v47 + 1;
                --v50;
              }
              while (v50);
            }
            uint64_t v92 = a6;
            v93 = v20;
            int v51 = v98;
            int v52 = v96;
            sub_6CA4(v27, v98, v20, v96, (uint64_t)v23, v94);
            v90 = v23;
            if (v51 <= 0)
            {
              v66 = (float *)(int)v27;
              vvsqrtf(v95, (const float *)v23 + (int)v27, &v105);
            }
            else
            {
              uint64_t v53 = 0;
              int v54 = 0;
              uint64_t v55 = v51;
              int v56 = v51 + v52 - v27 + 1;
              int v57 = v48 * v56;
              v58 = v94;
              unint64_t v59 = v95;
              do
              {
                uint64_t v60 = 0;
                int v61 = v54;
                int v62 = v57;
                v63 = &v58[v54];
                do
                {
                  v42[v62] = -v63[v60++];
                  v62 += v47;
                }
                while (v53 + v60 < (unint64_t)v51);
                v42[(v48 + (int)v53) * ((int)v47 + 1)] = v42[(v48 + (int)v53) * ((int)v47 + 1)] - a7;
                ++v53;
                int v54 = v61 + v60;
                v57 += v56;
              }
              while (v53 != v51);
              v94 = (float *)(int)v27;
              vvsqrtf(v59, (const float *)v23 + (int)v27, &v105);
              uint64_t v64 = 0;
              v65 = &v93->f32[(int)v27];
              do
              {
                vDSP_vmul(v65, 1, v59, 1, &v42[((int)v64++ + v105) * (int)v47], 1, v105);
                v65 = (const float *)((char *)v65 + v21);
              }
              while (v55 != v64);
              v66 = v94;
            }
            uint64_t v67 = 3;
            v68 = v43;
            v69 = &v99->f32[(void)v66];
            v70 = v95;
            do
            {
              vDSP_vmul(v69, 1, v70, 1, v68, 1, v105);
              v68 += v47;
              v69 = (const float *)((char *)v69 + v21);
              --v67;
            }
            while (v67);
            int v71 = v98;
            __int16 v23 = v90;
            uint64_t v72 = v92;
            sub_68F0(v27, v98, v99, v96, (uint64_t)v90, (uint64_t)v93, v96, v92);
            uint64_t v73 = 0;
            int v74 = v105;
            uint64_t v75 = v71;
            v76 = (float *)v72;
            do
            {
              uint64_t v77 = v71;
              int v78 = v74;
              v79 = v76;
              if (v71 >= 1)
              {
                do
                {
                  float v80 = *v79;
                  v79 += 4;
                  v43[v78++] = -v80;
                  --v77;
                }
                while (v77);
              }
              ++v73;
              ++v76;
              v74 += v47;
            }
            while (v73 != 3);
            CFBooleanRef v41 = v91;
            ssysv_(&__uplo, &__ldb, &__nrhs, v42, &__ldb, v91, v43, &__ldb, __work, &__lwork, (__CLPK_integer *)&__work[1]);
            __CLPK_integer __lwork = (int)__work[0];
            double v44 = (__CLPK_real *)malloc_type_malloc(4 * (int)__work[0], 0x100004052888210uLL);
            if (v44)
            {
              ssysv_(&__uplo, &__ldb, &__nrhs, v42, &__ldb, v41, v43, &__ldb, v44, &__lwork, (__CLPK_integer *)&__work[1]);
              uint64_t v81 = 0;
              __CLPK_integer v82 = __ldb;
              int v83 = v105;
              int v84 = v98;
              do
              {
                uint64_t v85 = v75;
                int v86 = v83;
                v87 = (_DWORD *)v72;
                if (v84 >= 1)
                {
                  do
                  {
                    _DWORD *v87 = LODWORD(v43[v86]);
                    v87 += 4;
                    ++v86;
                    --v85;
                  }
                  while (v85);
                }
                ++v81;
                v72 += 4;
                v83 += v82;
              }
              while (v81 != 3);
            }
            double v20 = v93;
          }
        }
        if (v41) {
          free(v41);
        }
        if (v42) {
          free(v42);
        }
        v88 = v95;
        if (v43) {
          free(v43);
        }
        if (v88) {
          free(v88);
        }
        if (v44) {
          free(v44);
        }
      }
      if (v20) {
        free(v20);
      }
      if (v99) {
        free(v99);
      }
      if (v23) {
        free(v23);
      }
    }
    else
    {
      specialSolveWithRegularization(a1, a2, a7, (uint64_t)a3, (uint64_t)__A, a5, a6);
    }
  }
}

double hybridSolve(uint64_t a1, int a2, uint64_t a3, const float *a4, float32x4_t *a5, uint64_t a6)
{
  int v12 = (a2 + a2 * a2) / 2;
  uint64_t v13 = __chkstk_darwin(a1);
  uint64_t v15 = (float *)((char *)&v31 - v14);
  sub_68F0(v13, v16, v17, v13, (uint64_t)a4, (uint64_t)a5, v13, a6);
  sub_6CA4(a1, a2, a5, a1, (uint64_t)a4, v15);
  sub_6770(a2, (uint64_t)v15, v18);
  v20.f32[0] = *v15 * 0.0625;
  v21.f32[0] = v15[v12 - 1];
  if (v20.f32[0] <= v21.f32[0])
  {
    if (a2 >= 1)
    {
      unint64_t v23 = 0;
      uint64_t v24 = 1;
      uint64_t v25 = 4;
      int v26 = v15;
      do
      {
        float32x4_t v21 = vld1q_dup_f32(v26++);
        float32x4_t v20 = vdivq_f32(*(float32x4_t *)(a6 + 16 * v23), v21);
        *(float32x4_t *)(a6 + 16 * v23++) = v20;
        if (v23 < a2)
        {
          float32x4_t v20 = vnegq_f32(v20);
          uint64_t v27 = v25;
          uint64_t v28 = a2;
          do
          {
            float v29 = *v26++;
            v21.f32[0] = v29;
            uint64_t v30 = 4 * (v27 & 0xFFFFFFFC);
            float32x4_t v19 = vmlaq_n_f32(*(float32x4_t *)(a6 + v30), v20, v29);
            *(float32x4_t *)(a6 + v30) = v19;
            --v28;
            v27 += 4;
          }
          while (v24 != v28);
        }
        ++v24;
        v25 += 4;
      }
      while (v23 != a2);
    }
    *(void *)&double result = sub_7094(a2, a6, (uint64_t)v15, v20, *(double *)v21.i64, *(float32x2_t *)v19.f32).u64[0];
  }
  else
  {
    generalSolve(a1, a2, a3, a4, (uint64_t)a5);
  }
  return result;
}

BOOL ColorSensorPlugIn::multiplyMatrices(ColorSensorPlugIn *this, float *a2, int a3, unsigned int a4, float *a5, int a6, int a7, float *a8)
{
  if (a4 == a6)
  {
    if (a3)
    {
      int v10 = 0;
      for (int i = 0; i != a3; ++i)
      {
        if (a7)
        {
          for (uint64_t j = 0; j != a7; a8[(i * a7 + j++)] = v13)
          {
            float v13 = 0.0;
            if (a4)
            {
              uint64_t v14 = a4;
              int v15 = v10;
              int v16 = j;
              do
              {
                float v13 = v13 + (float)(a2[v15] * a5[v16]);
                v16 += a7;
                ++v15;
                --v14;
              }
              while (v14);
            }
          }
        }
        v10 += a4;
      }
    }
  }
  else
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_177A8();
    }
  }
  return a4 == a6;
}

void ColorSensorPlugIn::logALSSample(uint64_t a1, uint64_t a2, int a3)
{
  int v5 = *(_DWORD *)(a1 + 228);
  if (v5 == 8)
  {
    if (!a2) {
      return;
    }
  }
  else if (!a2 || v5 != 9)
  {
    return;
  }
  if (IOHIDEventGetType() != 12) {
    return;
  }
  uint64_t TimeStamp = IOHIDEventGetTimeStamp();
  IOHIDEventGetDoubleValue();
  uint64_t v8 = v7;
  IOHIDEventGetDoubleValue();
  double v10 = v9;
  IOHIDEventGetDoubleValue();
  double v12 = v11;
  IOHIDEventGetDoubleValue();
  float v14 = v10 + v12 + v13;
  if (v14 == 0.0)
  {
    double v17 = 0.0;
    double v18 = 0.0;
  }
  else
  {
    double v15 = v14;
    float v16 = v10 / v15;
    *(float *)&double v15 = v12 / v15;
    double v17 = v16;
    double v18 = *(float *)&v15;
  }
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children
    && CFArrayGetValueAtIndex(Children, 0)
    && IOHIDEventGetIntegerValue() == 137
    && (Dataint Value = IOHIDEventGetDataValue()) != 0)
  {
    uint64_t v21 = DataValue;
    *(void *)__str = 0;
    uint64_t v100 = 0;
    int v101 = 0;
    if (*(unsigned char *)(DataValue + 136)) {
      snprintf(__str, 0x14uLL, " filteredLux=%.3f", *(float *)(DataValue + 132));
    }
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = *(double *)(a1 + 272) * (double)(unint64_t)TimeStamp;
      double v24 = *(float *)(v21 + 28);
      double v25 = *(float *)(v21 + 32);
      double v26 = *(float *)(v21 + 36);
      double v27 = *(float *)(v21 + 40);
      double v28 = *(float *)(v21 + 44);
      double v29 = *(float *)(v21 + 52);
      int v30 = *(__int16 *)(v21 + 18);
      uint64_t v31 = "ASYNC";
      if (!*(unsigned char *)(v21 + 82)) {
        uint64_t v31 = "SYNC";
      }
      int v32 = *(unsigned __int16 *)(v21 + 80);
      double v33 = *(float *)(v21 + 24);
      int v34 = *(unsigned __int16 *)(v21 + 6);
      int v35 = *(_DWORD *)(v21 + 83);
      int v36 = *(_DWORD *)(v21 + 87);
      int v37 = *(_DWORD *)(v21 + 91);
      int v38 = *(_DWORD *)(v21 + 95);
      int v39 = *(_DWORD *)(v21 + 99);
      int v40 = *(_DWORD *)v21;
      *(_DWORD *)buf = 134223618;
      double v54 = v23;
      __int16 v55 = 2048;
      uint64_t v56 = v8;
      __int16 v57 = 2080;
      v58 = __str;
      __int16 v59 = 2048;
      double v60 = v17;
      __int16 v61 = 2048;
      double v62 = v18;
      __int16 v63 = 2048;
      double v64 = v24;
      __int16 v65 = 2048;
      double v66 = v25;
      __int16 v67 = 2048;
      double v68 = v26;
      __int16 v69 = 2048;
      double v70 = v27;
      __int16 v71 = 2048;
      double v72 = v28;
      __int16 v73 = 2048;
      double v74 = v29;
      __int16 v75 = 1024;
      int v76 = v30;
      __int16 v77 = 2080;
      int v78 = v31;
      __int16 v79 = 1024;
      int v80 = v32;
      __int16 v81 = 2048;
      double v82 = v33;
      __int16 v83 = 1024;
      int v84 = v34;
      __int16 v85 = 1024;
      int v86 = v35;
      __int16 v87 = 1024;
      int v88 = v36;
      __int16 v89 = 1024;
      int v90 = v37;
      __int16 v91 = 1024;
      int v92 = v38;
      __int16 v93 = 1024;
      int v94 = v39;
      __int16 v95 = 1024;
      int v96 = v40;
      __int16 v97 = 1024;
      int v98 = a3;
      CFBooleanRef v41 = "[ALS] ts=%.3f lux=%.3f%s xy=(%.3f %.3f) chs=[%.0f %.0f %.0f %.0f %.0f] CCT1=%.3f gain=%dx mode=%s subsamples"
            "=%u rawLux=%.3f nits=%u xTalk=[%u %u %u %u %u] status=0x%02X copyEvent=%d";
      double v42 = inited;
      uint32_t v43 = 192;
      goto LABEL_28;
    }
  }
  else
  {
    double v44 = qword_20108;
    if (!qword_20108)
    {
      double v44 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        double v44 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      double v45 = *(double *)(a1 + 272) * (double)(unint64_t)TimeStamp;
      IOHIDEventGetFloatValue();
      double v47 = v46;
      IOHIDEventGetFloatValue();
      double v49 = v48;
      IOHIDEventGetFloatValue();
      double v51 = v50;
      IOHIDEventGetFloatValue();
      *(_DWORD *)buf = 134220032;
      double v54 = v45;
      __int16 v55 = 2048;
      uint64_t v56 = v8;
      __int16 v57 = 2048;
      v58 = *(char **)&v17;
      __int16 v59 = 2048;
      double v60 = v18;
      __int16 v61 = 2048;
      double v62 = v47;
      __int16 v63 = 2048;
      double v64 = v49;
      __int16 v65 = 2048;
      double v66 = v51;
      __int16 v67 = 2048;
      double v68 = v52;
      __int16 v69 = 1024;
      LODWORD(v70) = a3;
      CFBooleanRef v41 = "[ALS] ts=%.3f lux=%.3f xy=(%.3f %.3f) chs=[%.0f %.0f %.0f %.0f N/A] copyEvent=%d";
      double v42 = v44;
      uint32_t v43 = 88;
LABEL_28:
      _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
    }
  }
}

void generalSolve(int a1, int a2, uint64_t a3, const float *a4, uint64_t a5)
{
  LODWORD(__N) = a1;
  double v10 = (float *)malloc_type_malloc(4 * a2 * a1, 0x100004052888210uLL);
  double v11 = (float *)malloc_type_malloc(12 * a1, 0x100004052888210uLL);
  double v12 = (float *)malloc_type_malloc(4 * a1, 0x100004052888210uLL);
  double v13 = v12;
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && v12 != 0)
  {
    vvsqrtf(v12, a4, (const int *)&__N);
    if (a2 >= 1)
    {
      int v16 = 0;
      do
      {
        vDSP_vmul((const float *)(a5 + 4 * (int)__N * v16), 1, v13, 1, &v10[(int)__N * v16], 1, (int)__N);
        ++v16;
      }
      while (a2 != v16);
    }
    for (int i = 0; i != 3; ++i)
      vDSP_vmul((const float *)(a3 + 4 * (int)__N * i), 1, v13, 1, &v11[(int)__N * i], 1, (int)__N);
    sub_7134(__N, a2, (uint64_t)v10, (size_t)v11);
  }
  if (v10) {
    free(v10);
  }
  if (v11) {
    free(v11);
  }
  if (v13) {
    free(v13);
  }
}

float sub_6770(int a1, uint64_t a2, float result)
{
  if (a1 == 5)
  {
    float v20 = sqrtf(*(float *)a2);
    *(float *)a2 = v20;
    _Q0 = vmulq_n_f32(*(float32x4_t *)(a2 + 4), 1.0 / v20);
    __asm { FMLS            S2, S0, V0.S[0] }
    _S4 = _Q0.i32[1];
    __asm { FMLS            S3, S4, V0.S[0] }
    _S5 = _Q0.i32[2];
    __asm { FMLS            S6, S5, V0.S[0] }
    _S16 = _Q0.i32[3];
    __asm { FMLS            S7, S16, V0.S[0] }
    float v33 = sqrtf(_S2);
    float v34 = 1.0 / v33;
    float v35 = _S3 * (float)(1.0 / v33);
    *(float *)(a2 + 20) = v33;
    *(float *)(a2 + 24) = v35;
    float v36 = (float)(1.0 / v33) * _S6;
    float v37 = v34 * _S7;
    __asm
    {
      FMLS            S7, S4, V0.S[1]
      FMLS            S17, S5, V0.S[1]
      FMLS            S4, S16, V0.S[1]
    }
    float v41 = _S7 - (float)(v35 * v35);
    float v42 = _S17 - (float)(v35 * v36);
    float v43 = _S4 - (float)(v35 * v37);
    *(float32x4_t *)(a2 + 4) = _Q0;
    *(float *)(a2 + 28) = v36;
    *(float *)(a2 + 32) = v37;
    float v44 = sqrtf(v41);
    float v45 = v42 * (float)(1.0 / v44);
    *(float *)(a2 + 36) = v44;
    *(float *)(a2 + 40) = v45;
    float v46 = (float)(1.0 / v44) * v43;
    __asm
    {
      FMLS            S18, S5, V0.S[2]
      FMLS            S3, S16, V0.S[2]
    }
    float v49 = _S18 - (float)(v36 * v36);
    float v50 = _S3 - (float)(v36 * v37);
    float v51 = sqrtf(v49 - (float)(v45 * v45));
    *(float *)(a2 + 44) = v46;
    *(float *)(a2 + 48) = v51;
    float v52 = (float)(v50 - (float)(v45 * v46)) / v51;
    *(float *)(a2 + 52) = v52;
    __asm { FMLA            S3, S16, V0.S[3] }
    float v18 = (float)(_S3 + (float)(v46 * v46)) + (float)(v52 * v52);
    uint64_t v19 = 14;
  }
  else
  {
    if (a1 != 4) {
      return result;
    }
    float v3 = sqrtf(*(float *)a2);
    float v4 = 1.0 / v3;
    float v5 = *(float *)(a2 + 4) * (float)(1.0 / v3);
    *(float *)a2 = v3;
    *(float *)(a2 + 4) = v5;
    float v6 = (float)(1.0 / v3) * *(float *)(a2 + 8);
    float v7 = v4 * *(float *)(a2 + 12);
    float v8 = *(float *)(a2 + 16) - (float)(v5 * v5);
    float v9 = *(float *)(a2 + 20) - (float)(v5 * v6);
    float v10 = *(float *)(a2 + 24);
    float v11 = *(float *)(a2 + 28);
    *(float *)(a2 + 8) = v6;
    *(float *)(a2 + 12) = v7;
    float v12 = sqrtf(v8);
    float v13 = v9 * (float)(1.0 / v12);
    *(float *)(a2 + 16) = v12;
    *(float *)(a2 + 20) = v13;
    float v14 = (float)(1.0 / v12) * (float)(v10 - (float)(v5 * v7));
    float v15 = *(float *)(a2 + 32);
    float v16 = sqrtf((float)(v11 - (float)(v6 * v6)) - (float)(v13 * v13));
    *(float *)(a2 + 24) = v14;
    *(float *)(a2 + 28) = v16;
    float v17 = (float)((float)(v15 - (float)(v6 * v7)) - (float)(v13 * v14)) / v16;
    *(float *)(a2 + 32) = v17;
    float v18 = (float)((float)(v14 * v14) + (float)(v7 * v7)) + (float)(v17 * v17);
    uint64_t v19 = 9;
  }
  double result = sqrtf(*(float *)(a2 + 4 * v19) - v18);
  *(float *)(a2 + 4 * v19) = result;
  return result;
}

void sub_68F0(uint64_t a1, int a2, float32x4_t *a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  int v15 = a1;
  uint64_t v16 = (3 * a2);
  __chkstk_darwin(a1);
  float v17 = (float32x2_t *)((unint64_t)(&v63 - 4 * v16) & 0xFFFFFFFFFFFFFFE0);
  bzero(v17, v18);
  if (v15 < 8)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    unint64_t v19 = 0;
    float v20 = a3;
    do
    {
      if (a2 >= 1)
      {
        uint64_t v21 = 0;
        double v22 = (float32x4_t *)(a5 + 4 * v19);
        float32x4_t v24 = *v22;
        float32x4_t v23 = v22[1];
        unint64_t v25 = (unint64_t)(&v63 - 4 * v16) & 0xFFFFFFFFFFFFFFE0;
        do
        {
          uint64_t v26 = 0;
          double v27 = (float32x4_t *)(a6 + 4 * (v19 + v21 * a7));
          float32x4_t v28 = vmulq_f32(v23, v27[1]);
          float32x4_t v29 = vmulq_f32(v24, *v27);
          int v30 = v20;
          do
          {
            uint64_t v31 = (float32x4_t *)(v25 + v26);
            float32x4_t v32 = vmlaq_f32(*(float32x4_t *)(v25 + v26 + 16), v28, v30[1]);
            *uint64_t v31 = vmlaq_f32(*(float32x4_t *)(v25 + v26), v29, *v30);
            v31[1] = v32;
            v26 += 32;
            int v30 = (float32x4_t *)((char *)v30 + 4 * a4);
          }
          while (v26 != 96);
          ++v21;
          v25 += 96;
        }
        while (v21 != a2);
      }
      v19 += 8;
      v20 += 2;
    }
    while (v19 < (v15 - 7));
  }
  if (a2 >= 1)
  {
    uint64_t v33 = 0;
    if ((int)v16 <= 1) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = v16;
    }
    do
    {
      *(float32x4_t *)(((unint64_t)(&v63 - 4 * v16) & 0xFFFFFFFFFFFFFFE0) + 16 * v33) = vaddq_f32(*(float32x4_t *)((char *)&dword_10[8 * v33] + ((unint64_t)(&v63 - 4 * v16) & 0xFFFFFFFFFFFFFFE0)), *(float32x4_t *)(((unint64_t)(&v63 - 4 * v16) & 0xFFFFFFFFFFFFFFE0) + 32 * v33));
      ++v33;
    }
    while (v34 != v33);
  }
  if ((int)v19 < v15 - 3)
  {
    uint64_t v35 = v19;
    float v36 = (float32x4_t *)((char *)a3 + 4 * v19);
    do
    {
      if (a2 >= 1)
      {
        uint64_t v37 = 0;
        float32x4_t v38 = *(float32x4_t *)(a5 + 4 * v35);
        unint64_t v39 = (unint64_t)(&v63 - 4 * v16) & 0xFFFFFFFFFFFFFFE0;
        do
        {
          uint64_t v40 = 0;
          float32x4_t v41 = vmulq_f32(v38, *(float32x4_t *)(a6 + 4 * (v35 + v37 * a7)));
          float v42 = v36;
          do
          {
            *(float32x4_t *)(v39 + v40) = vmlaq_f32(*(float32x4_t *)(v39 + v40), v41, *v42);
            v40 += 16;
            float v42 = (float32x4_t *)((char *)v42 + 4 * a4);
          }
          while (v40 != 48);
          ++v37;
          v39 += 48;
        }
        while (v37 != a2);
      }
      v35 += 4;
      ++v36;
    }
    while (v35 < v15 - 3);
    LODWORD(v19) = v35;
  }
  if (a2 >= 1)
  {
    uint64_t v43 = 0;
    if ((int)v16 <= 1) {
      uint64_t v44 = 1;
    }
    else {
      uint64_t v44 = v16;
    }
    do
    {
      v17[v43] = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)v17[2 * v43].f32, *(int8x16_t *)v17[2 * v43].f32, 8uLL), v17[2 * v43]);
      ++v43;
    }
    while (v44 != v43);
  }
  if ((int)v19 < v15 - 1)
  {
    uint64_t v45 = v19;
    float v46 = (float32x2_t *)&a3->f32[v19];
    do
    {
      if (a2 >= 1)
      {
        uint64_t v47 = 0;
        float32x2_t v48 = *(float32x2_t *)(a5 + 4 * v45);
        unint64_t v49 = (unint64_t)(&v63 - 4 * v16) & 0xFFFFFFFFFFFFFFE0;
        do
        {
          uint64_t v50 = 0;
          float32x2_t v51 = vmul_f32(v48, *(float32x2_t *)(a6 + 4 * (v45 + v47 * a7)));
          float v52 = v46;
          do
          {
            *(float32x2_t *)(v49 + v50) = vmla_f32(*(float32x2_t *)(v49 + v50), v51, *v52);
            v50 += 8;
            float v52 = (float32x2_t *)((char *)v52 + 4 * a4);
          }
          while (v50 != 24);
          ++v47;
          v49 += 24;
        }
        while (v47 != a2);
      }
      v45 += 2;
      ++v46;
    }
    while (v45 < v15 - 1);
    LODWORD(v19) = v45;
  }
  if (a2 >= 1)
  {
    uint64_t v53 = 0;
    uint64_t v54 = a8;
    do
    {
      for (uint64_t i = 0; i != 3; ++i)
        *(float *)(v54 + 4 * i) = vaddv_f32(v17[i]);
      ++v53;
      v54 += 16;
      v17 += 3;
    }
    while (v53 != a2);
    if ((int)v19 < v15)
    {
      uint64_t v56 = 0;
      float v57 = *(float *)(a5 + 4 * v19);
      uint64_t v58 = (int)v19;
      __int16 v59 = &a3->f32[(int)v19];
      do
      {
        uint64_t v60 = 0;
        float v61 = v57 * *(float *)(a6 + 4 * (v58 + v56 * a7));
        double v62 = v59;
        do
        {
          *(float *)(a8 + v60) = *(float *)(a8 + v60) + (float)(*v62 * v61);
          v60 += 4;
          v62 += a4;
        }
        while (v60 != 12);
        ++v56;
        a8 += 16;
      }
      while (v56 != a2);
    }
  }
}

void sub_6CA4(uint64_t a1, int a2, float32x4_t *a3, int a4, uint64_t a5, float *a6)
{
  int v11 = a1;
  int v12 = a2 + a2 * a2;
  if (v12 >= 0) {
    int v13 = a2 + a2 * a2;
  }
  else {
    int v13 = v12 + 1;
  }
  uint64_t v14 = (v13 >> 1);
  __chkstk_darwin(a1);
  int v15 = (float32x2_t *)((unint64_t)(&v72 - 4 * v14) & 0xFFFFFFFFFFFFFFE0);
  bzero(v15, v16);
  if (v11 < 8)
  {
    LODWORD(v17) = 0;
  }
  else
  {
    unint64_t v17 = 0;
    uint64_t v18 = 4 * a4;
    unint64_t v19 = a3;
    do
    {
      if (a2 >= 1)
      {
        uint64_t v20 = 0;
        int v21 = 0;
        double v22 = (float32x4_t *)(a5 + 4 * v17);
        float32x4_t v24 = *v22;
        float32x4_t v23 = v22[1];
        unint64_t v25 = v19;
        do
        {
          uint64_t v26 = 0;
          double v27 = (float32x4_t *)((char *)a3 + 4 * v17 + 4 * v20 * a4);
          float32x4_t v28 = vmulq_f32(v23, v27[1]);
          float32x4_t v29 = vmulq_f32(v24, *v27);
          int v30 = v25;
          do
          {
            uint64_t v31 = (float32x4_t *)&v15[4 * v21 + 4 * v26];
            float32x4_t v32 = vmlaq_f32(v31[1], v30[1], v28);
            *uint64_t v31 = vmlaq_f32(*v31, *v30, v29);
            v31[1] = v32;
            int v30 = (float32x4_t *)((char *)v30 + v18);
            ++v26;
          }
          while (v20 + v26 < a2);
          ++v20;
          unint64_t v25 = (float32x4_t *)((char *)v25 + v18);
          v21 += v26;
        }
        while (v20 != a2);
      }
      v17 += 8;
      v19 += 2;
    }
    while (v17 < (v11 - 7));
  }
  if (v12 >= 2)
  {
    uint64_t v33 = 0;
    do
    {
      *(float32x4_t *)(((unint64_t)(&v72 - 4 * v14) & 0xFFFFFFFFFFFFFFE0) + 16 * v33) = vaddq_f32(*(float32x4_t *)((char *)&dword_10[8 * v33] + ((unint64_t)(&v72 - 4 * v14) & 0xFFFFFFFFFFFFFFE0)), *(float32x4_t *)(((unint64_t)(&v72 - 4 * v14) & 0xFFFFFFFFFFFFFFE0) + 32 * v33));
      ++v33;
    }
    while (v14 != v33);
  }
  if ((int)v17 < v11 - 3)
  {
    uint64_t v34 = v17;
    uint64_t v35 = 4 * a4;
    float v36 = (float32x4_t *)((char *)a3 + 4 * v17);
    do
    {
      if (a2 >= 1)
      {
        uint64_t v37 = 0;
        int v38 = 0;
        float32x4_t v39 = *(float32x4_t *)(a5 + 4 * v34);
        uint64_t v40 = v36;
        do
        {
          uint64_t v41 = 0;
          float32x4_t v42 = vmulq_f32(v39, *(float32x4_t *)((char *)a3 + 4 * v34 + 4 * v37 * a4));
          int v43 = v38;
          uint64_t v44 = &v15[2 * v38];
          uint64_t v45 = v40;
          do
          {
            *(float32x4_t *)v44[2 * v41].f32 = vmlaq_f32(*(float32x4_t *)v44[2 * v41].f32, *v45, v42);
            ++v41;
            uint64_t v45 = (float32x4_t *)((char *)v45 + v35);
          }
          while (v37 + v41 < a2);
          ++v37;
          int v38 = v43 + v41;
          uint64_t v40 = (float32x4_t *)((char *)v40 + v35);
        }
        while (v37 != a2);
      }
      v34 += 4;
      ++v36;
    }
    while (v34 < v11 - 3);
    LODWORD(v17) = v34;
  }
  if (v12 >= 2)
  {
    uint64_t v46 = 0;
    do
    {
      v15[v46] = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)v15[2 * v46].f32, *(int8x16_t *)v15[2 * v46].f32, 8uLL), v15[2 * v46]);
      ++v46;
    }
    while (v14 != v46);
  }
  if ((int)v17 < v11 - 1)
  {
    uint64_t v47 = v17;
    uint64_t v48 = 4 * a4;
    unint64_t v49 = (float32x2_t *)&a3->f32[v17];
    do
    {
      if (a2 >= 1)
      {
        uint64_t v50 = 0;
        int v51 = 0;
        float32x2_t v52 = *(float32x2_t *)(a5 + 4 * v47);
        uint64_t v53 = v49;
        do
        {
          uint64_t v54 = 0;
          float32x2_t v55 = vmul_f32(v52, *(float32x2_t *)&a3->f32[v47 + v50 * a4]);
          int v56 = v51;
          float v57 = &v15[v51];
          uint64_t v58 = v53;
          do
          {
            v57[v54] = vmla_f32(v57[v54], *v58, v55);
            ++v54;
            uint64_t v58 = (float32x2_t *)((char *)v58 + v48);
          }
          while (v50 + v54 < a2);
          ++v50;
          int v51 = v56 + v54;
          uint64_t v53 = (float32x2_t *)((char *)v53 + v48);
        }
        while (v50 != a2);
      }
      v47 += 2;
      ++v49;
    }
    while (v47 < v11 - 1);
    LODWORD(v17) = v47;
  }
  if (v12 >= 2)
  {
    __int16 v59 = a6;
    do
    {
      float32x2_t v60 = *v15++;
      *v59++ = vaddv_f32(v60);
      --v14;
    }
    while (v14);
  }
  if ((int)v17 < v11 && a2 >= 1)
  {
    uint64_t v61 = 0;
    int v62 = 0;
    uint64_t v63 = v17;
    uint64_t v64 = (int)v17;
    uint64_t v65 = 4 * a4;
    double v66 = &a3->f32[(int)v17];
    do
    {
      uint64_t v67 = 0;
      float v68 = a3->f32[v64 + v61 * a4] * *(float *)(a5 + 4 * v63);
      int v69 = v62;
      double v70 = &a6[v62];
      __int16 v71 = v66;
      do
      {
        v70[v67] = v70[v67] + (float)(v68 * *v71);
        ++v67;
        __int16 v71 = (float *)((char *)v71 + v65);
      }
      while (v61 + v67 < (unint64_t)a2);
      ++v61;
      int v62 = v69 + v67;
      double v66 = (float *)((char *)v66 + v65);
    }
    while (v61 != a2);
  }
}

float32x4_t sub_7094(int a1, uint64_t a2, uint64_t a3, float32x4_t result, double a5, float32x2_t a6)
{
  if (a1 >= 1)
  {
    uint64_t v6 = a3 + 4 * ((a1 + a1 * a1) / 2);
    uint64_t v7 = a1 - 1;
    do
    {
      uint64_t v8 = 4 * (int)v7;
      if (v7 < (a1 - 1))
      {
        float v9 = (float32x4_t *)(a2 + 4 * v8);
        double result = *v9;
        int v10 = 4 * a1 - 4;
        uint64_t v11 = a1 - 1;
        do
        {
          __int32 v12 = *(_DWORD *)(v6 - 4);
          v6 -= 4;
          a6.i32[0] = v12;
          double result = vmlsq_lane_f32(result, *(float32x4_t *)(a2 + 4 * v10), a6, 0);
          *float v9 = result;
          --v11;
          v10 -= 4;
        }
        while (v11 > v7);
      }
      __int32 v13 = *(_DWORD *)(v6 - 4);
      v6 -= 4;
      result.i32[0] = v13;
      uint64_t v14 = 4 * v8;
      double result = vdivq_f32(*(float32x4_t *)(a2 + v14), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)result.f32, 0));
      *(float32x4_t *)(a2 + v14) = result;
    }
    while (v7-- > 0);
  }
  return result;
}

void sub_7134(int a1, int a2, uint64_t a3, size_t a4)
{
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v8);
  uint64_t v14 = (char *)&v138 - v11;
  v147 = v10;
  int64_t v148 = v9;
  uint64_t v139 = v15;
  if (v16 >= 1)
  {
    uint64_t v17 = 0;
    do
    {
      v10[v17] = v17;
      ++v17;
    }
    while (v9 != v17);
    if (a2 >= 1)
    {
      int64_t v18 = 0;
      v145 = v10 + 1;
      uint64_t v19 = 1;
      v143 = (float *)a4;
      v140 = (char *)&v138 - v11;
      uint64_t v141 = 4 * a1;
      do
      {
        uint64_t v146 = v19;
        int v20 = 0;
        int v21 = a1 - v18;
        int v22 = v18 - 1;
        float v23 = -1.0;
        int64_t v24 = v18;
        uint64_t v25 = a3 + 4 * v18;
        int64_t v149 = v18;
        uint64_t v150 = v25;
        do
        {
          while (1)
          {
            uint64_t v26 = v10[v24];
            if (v18) {
              break;
            }
            float v31 = cblas_snrm2(a1, (const float *)(a3 + 4 * (int)v26 * a1), 1);
            int64_t v18 = v149;
            uint64_t v25 = v150;
            int v10 = v147;
            int64_t v9 = v148;
            *(float *)&v14[4 * v26] = v31;
            if (v31 > v23)
            {
              float v23 = v31;
              int v20 = v24;
            }
            if (++v24 >= v9) {
              goto LABEL_19;
            }
          }
          float v27 = *(float *)(a3 + 4 * (v22 + (int)v26 * a1));
          float v28 = (float)(*(float *)&v14[4 * v26] * *(float *)&v14[4 * v26]) - (float)(v27 * v27);
          float v29 = *(float *)&v14[4 * *v10];
          if (v28 <= (float)((float)(v29 * v29) * 0.015625))
          {
            float v30 = cblas_snrm2(v21, (const float *)(v25 + 4 * (int)v26 * a1), 1);
            int64_t v18 = v149;
            uint64_t v25 = v150;
            int v10 = v147;
            int64_t v9 = v148;
          }
          else
          {
            float v30 = sqrtf(v28);
          }
          *(float *)&v14[4 * v26] = v30;
          if (v30 > v23)
          {
            float v23 = v30;
            int v20 = v24;
          }
          ++v24;
        }
        while (v24 < v9);
        if (v23 < fabsf(*(float *)&v14[4 * *v10] * 0.00000023842)) {
          goto LABEL_29;
        }
LABEL_19:
        uint64_t v32 = v10[v20];
        v10[v20] = v10[v18];
        v10[v18] = v32;
        int v33 = v32 * a1 + v18;
        float v34 = *(float *)(a3 + 4 * v33);
        float v35 = -v23;
        if (v34 < 0.0) {
          float v35 = v23;
        }
        float v36 = v34 - v35;
        *(float *)(a3 + 4 * v33) = v36;
        float v37 = 1.0 / (float)(v35 * v36);
        *(float *)&v14[4 * v32] = v35;
        uint64_t v144 = (int)v32 * a1;
        uint64_t v142 = v18 + 1;
        uint64_t v38 = v146;
        if (v18 + 1 < (unint64_t)v9)
        {
          float32x4_t v39 = v145;
          uint64_t v40 = (const float *)(v25 + 4 * v144);
          int64_t v41 = v148;
          do
          {
            int v42 = *v39++;
            int v43 = (float *)(v25 + 4 * v42 * a1);
            float v44 = cblas_sdot(v21, v43, 1, v40, 1);
            cblas_saxpy(v21, v37 * v44, v40, 1, v43, 1);
            uint64_t v25 = v150;
            --v41;
          }
          while (v38 != v41);
        }
        size_t v45 = (size_t)v143;
        uint64_t v46 = (const float *)(a3 + 4 * v144 + 4 * v149);
        uint64_t v47 = 3;
        uint64_t v48 = v143;
        uint64_t v49 = v141;
        do
        {
          float v50 = cblas_sdot(v21, v48, 1, v46, 1);
          cblas_saxpy(v21, v37 * v50, v46, 1, v48, 1);
          uint64_t v48 = (float *)((char *)v48 + v49);
          --v47;
        }
        while (v47);
        uint64_t v19 = v146 + 1;
        ++v145;
        v143 = (float *)(v45 + 4);
        int64_t v18 = v142;
        int v10 = v147;
        int64_t v9 = v148;
        uint64_t v14 = v140;
      }
      while (v142 != v148);
      goto LABEL_30;
    }
  }
  int64_t v18 = 0;
LABEL_29:
  if (v18 == a2)
  {
LABEL_30:
    uint64_t v51 = 0;
    size_t v52 = a4 + 4 * (a2 - 2);
    uint64_t v53 = v139;
    do
    {
      if (a2 >= 1)
      {
        uint64_t v54 = v51 * a1;
        size_t v55 = v52;
        uint64_t v56 = a2;
        for (uint64_t i = a2 - 2; ; --i)
        {
          uint64_t v58 = v56--;
          uint64_t v59 = v10[v56];
          *(float *)(a4 + 4 * (v56 + v54)) = *(float *)(a4 + 4 * (v56 + v54)) / *(float *)&v14[4 * v59];
          if (v58 < 2) {
            break;
          }
          uint64_t v60 = 0;
          uint64_t v61 = a3 + 4 * (i + (int)v59 * (uint64_t)a1);
          do
          {
            *(float *)(v55 + 4 * v60) = *(float *)(v55 + 4 * v60)
                                      - (float)(*(float *)(a4 + 4 * (v56 + v54)) * *(float *)(v61 + 4 * v60));
            --v60;
          }
          while (i + v60 + 1 > 0);
          v55 -= 4;
        }
      }
      ++v51;
      v52 += 4 * a1;
    }
    while (v51 != 3);
    for (uint64_t j = 0; j != 3; ++j)
    {
      int64_t v63 = v9;
      uint64_t v64 = v10;
      uint64_t v65 = (int *)a4;
      if (a2 >= 1)
      {
        do
        {
          int v66 = *v65++;
          int v67 = v66;
          uint64_t v68 = *v64++;
          *(_DWORD *)(v53 + 4 * (j + 4 * v68)) = v67;
          --v63;
        }
        while (v63);
      }
      a4 += 4 * a1;
    }
    return;
  }
  if (v18)
  {
    uint64_t v69 = 0;
    unint64_t v70 = v18;
    do
    {
      *(_DWORD *)(a3 + 4 * (v69 + v10[v69] * (uint64_t)a1)) = *(_DWORD *)&v14[4 * v10[v69]];
      ++v69;
    }
    while (v18 != v69);
    int64_t v71 = 0;
    uint64_t v72 = v10 + 1;
    uint64_t v73 = 1;
    v74.i64[0] = 0x8000000080000000;
    v74.i64[1] = 0x8000000080000000;
    int64_t v75 = v9;
    int v76 = v10;
    do
    {
      v12.i64[0] = 0;
      if (v71 < a2)
      {
        int64_t v77 = v75;
        int v78 = v76;
        do
        {
          int v79 = *v78++;
          float v80 = *(float *)(a3 + 4 * ((int)v71 + v79 * a1));
          *(float *)v12.i32 = *(float *)v12.i32 + (float)(v80 * v80);
          --v77;
        }
        while (v77);
      }
      uint64_t v81 = v10[v71];
      int v82 = v71 + v81 * a1;
      v13.i32[0] = *(_DWORD *)(a3 + 4 * v82);
      *(float *)v12.i32 = sqrtf(*(float *)v12.i32);
      int8x16_t v12 = vbslq_s8(v74, v12, v13);
      *(float *)v13.i32 = *(float *)v13.i32 + *(float *)v12.i32;
      *(_DWORD *)(a3 + 4 * v82) = v13.i32[0];
      if (v71 < a2)
      {
        uint64_t v83 = 0;
        float v84 = sqrtf((float)(*(float *)v12.i32 + *(float *)v12.i32) * *(float *)v13.i32);
        do
        {
          int v85 = v71 + v76[v83] * a1;
          *(float *)(a3 + 4 * v85) = *(float *)(a3 + 4 * v85) / v84;
          ++v83;
        }
        while (v75 != v83);
      }
      int64_t v86 = v71 + 1;
      if (v71 + 1 < (unint64_t)v18)
      {
        uint64_t v87 = 1;
        int v88 = v72;
        uint64_t v89 = v73;
        do
        {
          v13.i64[0] = 0;
          if (v89 < a2)
          {
            uint64_t v90 = 0;
            do
            {
              *(float *)v13.i32 = *(float *)v13.i32
                                + (float)(*(float *)(a3 + 4 * (v88[v90] * a1 + (int)v89))
                                        * *(float *)(a3 + 4 * (v88[v90] * a1 + (int)v71)));
              ++v90;
            }
            while ((int)v89 + (int)v90 < a2);
          }
          float v91 = *(float *)v13.i32 * -2.0;
          if (v71 < (unint64_t)v89)
          {
            uint64_t v92 = 0;
            do
            {
              *(float *)(a3 + 4 * (v76[v92] * a1 + (int)v89)) = v91
                                                                * *(float *)(a3 + 4 * (v76[v92] * a1 + (int)v71));
              ++v92;
            }
            while (v87 != v92);
          }
          if (v89 < a2)
          {
            uint64_t v93 = 0;
            do
            {
              *(float *)(a3 + 4 * (v88[v93] * a1 + (int)v89)) = *(float *)(a3 + 4 * (v88[v93] * a1 + (int)v89))
                                                                + (float)(v91
                                                                        * *(float *)(a3
                                                                                   + 4 * (v88[v93] * a1 + (int)v71)));
              ++v93;
            }
            while ((int)v89 + (int)v93 < a2);
          }
          ++v89;
          ++v88;
          ++v87;
        }
        while (v89 != v18);
      }
      *(float *)&v14[4 * v81] = -*(float *)v12.i32;
      ++v73;
      ++v76;
      --v75;
      ++v72;
      ++v71;
    }
    while (v86 != v18);
  }
  else
  {
    unint64_t v70 = 0;
  }
  uint64_t v94 = 0;
  uint64_t v95 = (int)v18;
  uint64_t v144 = a1;
  v143 = (float *)(4 * (~v18 + a2) + 4);
  size_t v96 = a4 + 4;
  uint64_t v97 = 4 * a1;
  uint64_t v98 = 4 * v18 - 4;
  v99 = (char *)v10 + v98;
  size_t v100 = a4 + v98;
  uint64_t v101 = v18;
  uint64_t v102 = a2 + 1 - v18;
  uint64_t v141 = v102;
  uint64_t v142 = v97;
  int64_t v149 = v18;
  do
  {
    if (v18)
    {
      uint64_t v103 = 0;
      uint64_t v104 = v94 * v144;
      int v105 = (float *)v96;
      uint64_t v106 = 1;
      do
      {
        uint64_t v107 = v10[v103];
        uint64_t v108 = v103 + v104;
        *(float *)(a4 + 4 * (v103 + v104)) = *(float *)(a4 + 4 * (v103 + v104)) / *(float *)&v14[4 * v107];
        if (++v103 < v70)
        {
          v109 = (float *)(a3 + 4 * (v106 + (int)v107 * (uint64_t)a1));
          uint64_t v110 = v101;
          v111 = v105;
          do
          {
            float v112 = *v109++;
            float *v111 = *v111 - (float)(*(float *)(a4 + 4 * v108) * v112);
            ++v111;
            --v110;
          }
          while (v106 != v110);
        }
        ++v106;
        ++v105;
      }
      while (v103 != v101);
    }
    if ((int)v18 < a2)
    {
      uint64_t v150 = v94;
      v145 = (int *)v100;
      uint64_t v146 = v96;
      uint64_t v113 = v95;
      bzero((void *)(a4 + 4 * ((int)v18 + (int)v94 * a1)), (size_t)v143);
      size_t v100 = (size_t)v145;
      size_t v96 = v146;
      LODWORD(v18) = v149;
      uint64_t v94 = v150;
      uint64_t v95 = v113;
      uint64_t v102 = v141;
      uint64_t v97 = v142;
      int v10 = v147;
      int64_t v9 = v148;
    }
    uint64_t v114 = v102;
    v115 = (float *)v100;
    v116 = (int *)v99;
    uint64_t v117 = v95;
    if ((int)v18 >= 1)
    {
      do
      {
        int v118 = v117 - 1;
        if ((int)v117 <= a2)
        {
          float v119 = 0.0;
          uint64_t v120 = a2 + 1;
          v121 = v115;
          v122 = v116;
          do
          {
            float v123 = *v121++;
            float v124 = v123;
            int v125 = *v122++;
            float v119 = v119 + (float)(v124 * *(float *)(a3 + 4 * (v118 + v125 * a1)));
            --v120;
          }
          while (v117 != v120);
          if ((int)v117 <= a2)
          {
            uint64_t v126 = 0;
            float v127 = v119 * -2.0;
            do
            {
              v115[v126] = v115[v126] + (float)(v127 * *(float *)(a3 + 4 * (v118 + v116[v126] * a1)));
              ++v126;
            }
            while (v114 != v126);
          }
        }
        --v116;
        --v115;
        ++v114;
      }
      while ((int)v117-- >= 2);
    }
    ++v94;
    v96 += v97;
    v100 += v97;
  }
  while (v94 != 3);
  uint64_t v129 = 0;
  uint64_t v130 = 4 * v144;
  uint64_t v131 = v139;
  do
  {
    int64_t v132 = v9;
    v133 = v10;
    v134 = (int *)a4;
    if (a2 >= 1)
    {
      do
      {
        int v135 = *v134++;
        int v136 = v135;
        uint64_t v137 = *v133++;
        *(_DWORD *)(v131 + 4 * (v129 + 4 * v137)) = v136;
        --v132;
      }
      while (v132);
    }
    ++v129;
    a4 += v130;
  }
  while (v129 != 3);
}

float clamp(float a1, float a2, float a3)
{
  if (a1 <= a3) {
    a3 = a1;
  }
  if (a1 >= a2) {
    return a3;
  }
  else {
    return a2;
  }
}

BOOL float_equal(float a1, float a2)
{
  return vabds_f32(a1, a2) <= (float)(fmaxf(fabsf(a1), fabsf(a2)) * 0.00000011921);
}

float linear_interpolation(float a1, float a2, float a3, float a4, float a5)
{
  return a3 + (float)((float)((float)(a5 - a3) / (float)(a4 - a2)) * (float)(a1 - a2));
}

float *find_bound(float *result, unint64_t a2, float a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  if (!result || !a2) {
    goto LABEL_13;
  }
  if (*result > a3)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 1;
LABEL_13:
    *a4 = v5;
    *a5 = v6;
    return result;
  }
  unint64_t v6 = a2 - 1;
  if (result[a2 - 1] <= a3)
  {
    unint64_t v5 = a2 - 2;
    goto LABEL_13;
  }
  if (a2 >= 2)
  {
    unint64_t v5 = 0;
    while (result[v5] > a3 || result[v5 + 1] <= a3)
    {
      if (v6 == ++v5) {
        return result;
      }
    }
    unint64_t v6 = v5 + 1;
    goto LABEL_13;
  }
  return result;
}

float matrix_element(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(float *)(a1 + 4 * (a3 + a4 * a2));
}

float *two_dimensional_interpolation(float *result, unint64_t a2, float *a3, unint64_t a4, uint64_t a5, float a6, float a7)
{
  if (a4 >= 2 && a2 >= 2 && result && a3 && a5)
  {
    float v9 = result[a2 - 1];
    if (v9 >= a6) {
      float v9 = a6;
    }
    if (*result <= a6) {
      float v10 = v9;
    }
    else {
      float v10 = *result;
    }
    float v11 = a3[a4 - 1];
    if (v11 >= a7) {
      float v11 = a7;
    }
    if (*a3 <= a7) {
      float v12 = v11;
    }
    else {
      float v12 = *a3;
    }
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    find_bound(result, a2, v10, &v16, &v15);
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    return find_bound(a3, a4, v12, &v14, &v13);
  }
  return result;
}

float mach_time_to_nanoseconds(unint64_t a1)
{
  if (qword_20080 != -1) {
    dispatch_once(&qword_20080, &stru_1C528);
  }
  return *(float *)&dword_20000 * (float)a1;
}

void sub_7C60(id a1)
{
  mach_timebase_info(&info);
  *(float *)&dword_20000 = (float)info.numer / (float)info.denom;
}

float mach_time_to_milliseconds(unint64_t a1)
{
  if (qword_20080 != -1) {
    dispatch_once(&qword_20080, &stru_1C528);
  }
  return (float)(*(float *)&dword_20000 * (float)a1) / 1000000.0;
}

float mach_time_to_seconds(unint64_t a1)
{
  if (qword_20080 != -1) {
    dispatch_once(&qword_20080, &stru_1C528);
  }
  return (float)(*(float *)&dword_20000 * (float)a1) / 1000000000.0;
}

float mach_time_now_in_nanoseconds()
{
  uint64_t v0 = mach_absolute_time();
  if (qword_20080 != -1) {
    dispatch_once(&qword_20080, &stru_1C528);
  }
  return *(float *)&dword_20000 * (float)v0;
}

float mach_time_now_in_milliseconds()
{
  uint64_t v0 = mach_absolute_time();
  if (qword_20080 != -1) {
    dispatch_once(&qword_20080, &stru_1C528);
  }
  return (float)(*(float *)&dword_20000 * (float)v0) / 1000000.0;
}

float mach_time_now_in_seconds()
{
  uint64_t v0 = mach_absolute_time();
  if (qword_20080 != -1) {
    dispatch_once(&qword_20080, &stru_1C528);
  }
  return (float)(*(float *)&dword_20000 * (float)v0) / 1000000000.0;
}

unint64_t create_integer_array_from_cfdata(const void *a1, UInt8 **a2)
{
  if (!a1 || (CFTypeID v4 = CFGetTypeID(a1), v4 != CFDataGetTypeID()))
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  unint64_t Length = CFDataGetLength((CFDataRef)a1);
  unint64_t v6 = Length >> 2;
  uint64_t v7 = (UInt8 *)malloc_type_calloc(Length >> 2, 4uLL, 0x100004052888210uLL);
  if (!v7)
  {
LABEL_6:
    unint64_t v6 = 0;
    goto LABEL_7;
  }
  v9.length = Length & 0xFFFFFFFFFFFFFFFCLL;
  v9.location = 0;
  CFDataGetBytes((CFDataRef)a1, v9, v7);
LABEL_7:
  *a2 = v7;
  return v6;
}

CFDataRef get_integer_from_cfdata(const __CFData *result, _DWORD *a2)
{
  *(_DWORD *)buffer = 0;
  if (result)
  {
    CFDataRef v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID() && CFDataGetLength(v3) == 4)
    {
      v7.location = 0;
      v7.length = 4;
      CFDataGetBytes(v3, v7, buffer);
      double result = (const __CFData *)(&dword_0 + 1);
      int v5 = *(_DWORD *)buffer;
    }
    else
    {
      int v5 = 0;
      double result = 0;
    }
  }
  else
  {
    int v5 = 0;
  }
  *a2 = v5;
  return result;
}

BOOL get_uint32_from_cfdata(const void *a1, unsigned int *a2)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFDataGetTypeID()) {
    return 0;
  }
  *(_DWORD *)buffer = 0;
  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  BOOL v6 = Length == 4;
  if (Length == 4)
  {
    v9.location = 0;
    v9.length = 4;
    CFDataGetBytes((CFDataRef)a1, v9, buffer);
    *a2 = *(_DWORD *)buffer;
  }
  return v6;
}

CFDataRef get_float_from_cfdata(const __CFData *result, int *a2)
{
  *(_DWORD *)buffer = 2143289344;
  if (!result) {
    goto LABEL_6;
  }
  CFDataRef v3 = result;
  CFTypeID v4 = CFGetTypeID(result);
  if (v4 != CFDataGetTypeID() || CFDataGetLength(v3) != 4)
  {
    double result = 0;
LABEL_6:
    int v5 = 2143289344;
    goto LABEL_7;
  }
  v7.location = 0;
  v7.length = 4;
  CFDataGetBytes(v3, v7, buffer);
  double result = (const __CFData *)(&dword_0 + 1);
  int v5 = *(_DWORD *)buffer;
LABEL_7:
  *a2 = v5;
  return result;
}

CFTypeRef load_integer_array_from_edt(io_registry_entry_t a1, CFStringRef key, UInt8 **a3)
{
  CFTypeRef result = IORegistryEntrySearchCFProperty(a1, "IOService", key, kCFAllocatorDefault, 3u);
  if (result)
  {
    CFTypeRef v5 = result;
    unint64_t integer_array_from_cfdata = create_integer_array_from_cfdata(result, a3);
    CFRelease(v5);
    return (CFTypeRef)integer_array_from_cfdata;
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

unint64_t load_float_array_from_edt(io_registry_entry_t a1, CFStringRef key, void *a3)
{
  CFTypeRef v4 = IORegistryEntrySearchCFProperty(a1, "IOService", key, kCFAllocatorDefault, 3u);
  if (v4)
  {
    CFTypeRef v5 = v4;
    uint64_t v8 = 0;
    unint64_t v6 = create_integer_array_from_cfdata(v4, &v8);
    *a3 = v8;
    CFRelease(v5);
  }
  else
  {
    unint64_t v6 = 0;
    *a3 = 0;
  }
  return v6;
}

float load_float_from_edt(io_registry_entry_t a1, CFStringRef key)
{
  float v5 = NAN;
  CFDataRef v2 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IOService", key, kCFAllocatorDefault, 3u);
  if (!v2) {
    return NAN;
  }
  CFDataRef v3 = v2;
  get_float_from_cfdata(v2, (int *)&v5);
  CFRelease(v3);
  return v5;
}

CFDataRef load_int_from_edt(io_registry_entry_t a1, CFStringRef key, _DWORD *a3)
{
  CFDataRef result = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IOService", key, kCFAllocatorDefault, 3u);
  if (result)
  {
    CFDataRef v5 = result;
    CFDataRef integer_from_cfdata = get_integer_from_cfdata(result, a3);
    CFRelease(v5);
    return integer_from_cfdata;
  }
  return result;
}

CFTypeRef load_uint_from_edt(io_registry_entry_t a1, CFStringRef key, unsigned int *a3)
{
  CFTypeRef result = IORegistryEntrySearchCFProperty(a1, "IOService", key, kCFAllocatorDefault, 3u);
  if (result)
  {
    CFTypeRef v5 = result;
    BOOL uint32_from_cfdata = get_uint32_from_cfdata(result, a3);
    CFRelease(v5);
    return (CFTypeRef)uint32_from_cfdata;
  }
  return result;
}

float load_fixed_float_from_edt(io_registry_entry_t a1, CFStringRef key)
{
  CFDataRef v2 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IOService", key, kCFAllocatorDefault, 3u);
  if (!v2) {
    return NAN;
  }
  CFDataRef v3 = v2;
  int v6 = 0;
  if (get_integer_from_cfdata(v2, &v6)) {
    float v4 = (float)v6 * 0.000015259;
  }
  else {
    float v4 = NAN;
  }
  CFRelease(v3);
  return v4;
}

double scaleForExponent(int a1)
{
  double result = 1.0;
  if (a1 >= 8)
  {
    if (a1 <= 0xF)
    {
      for (int i = 16; i > a1; --i)
        double result = result * 10.0;
    }
  }
  else
  {
    double v2 = 1.0;
    if (a1 >= 1)
    {
      do
      {
        double v2 = v2 * 10.0;
        --a1;
      }
      while (a1);
    }
    return 1.0 / v2;
  }
  return result;
}

float LuminanceToPerceptual(float a1, float a2, float a3)
{
  float v5 = logf(fmaxf(a1, a2) / a3);
  return (float)(v5 / logf(a3 / a2)) + 1.0;
}

float PerceptualToLuminance(float a1, float a2, float a3)
{
  return powf(a3 / a2, a1 + -1.0) * a3;
}

char *get_int_from_bootarg(const char *a1, _DWORD *a2)
{
  bzero(__s1, 0x400uLL);
  size_t v7 = 1024;
  if (sysctlbyname("kern.bootargs", __s1, &v7, 0, 0)) {
    return 0;
  }
  double result = strstr(__s1, a1);
  if (result)
  {
    float v5 = result;
    size_t v6 = strlen(a1);
    *a2 = strtol(&v5[v6 + 1], 0, 0);
    return (unsigned char *)(&dword_0 + 1);
  }
  return result;
}

uint64_t printUsage(void)
{
  puts("FDRCalibrationTester <calibrationType> <filepath> [-print] [-parse]");
  puts("\nCurrently only supports HmCA 10.0");

  return puts("\nCalibration Types: [HmCA10]");
}

int main(int argc, const char **argv, const char **envp)
{
  int v3 = __chkstk_darwin(*(void *)&argc);
  uint64_t v5 = v4;
  int v6 = v3;
  bzero(&__ptr, 0x2988uLL);
  if (v6 >= 2)
  {
    unsigned __int8 v7 = 0;
    unsigned __int8 v8 = 0;
    signed __int8 v48 = 0;
    char v49 = 0;
    char v50 = 0;
    char v51 = 0;
    int v52 = 0;
    int v53 = 0;
    int v47 = 0;
    LODWORD(v9) = 1;
    do
    {
      float v10 = *(const char **)(v5 + 8 * (int)v9);
      if (!strcmp(v10, "-h") || !strcmp(v10, "--h") || !strcmp(v10, "-help") || !strcmp(v10, "--help"))
      {
        printUsage();
        goto LABEL_17;
      }
      if (!strcmp(v10, "HmCA10"))
      {
        uint64_t v9 = (int)v9 + 1;
        float v11 = fopen(*(const char **)(v5 + 8 * v9), "r");
        int v52 = 1;
        fread(&__ptr, 0x2988uLL, 1uLL, v11);
        fclose(v11);
        char v51 = v75;
        char v50 = v74;
        char v49 = v73;
        signed __int8 v48 = __ptr;
        unsigned __int8 v8 = v76;
        unsigned __int8 v7 = v77;
        printf("%c%c%c%c v%d.%d loaded\n", v75, v74, v73, __ptr, v76, v77);
      }
      else if (!strcmp(v10, "-print"))
      {
        int v47 = 1;
      }
      else
      {
        v53 |= strcmp(v10, "-parse") == 0;
      }
      LODWORD(v9) = v9 + 1;
    }
    while ((int)v9 < v6);
    if (v47 & v52)
    {
      printf("magic:                          %c%c%c%c\n", v51, v50, v49, v48);
      printf("version:                        v%d.%d\n", v8, v7);
      printf("size:                           %d\n", v78);
      printf("cfsn:                           %lld\n", v79);
      printf("\nplacement:                      0x%02X\n", v80);
      printf("\norientation:                      0x%02X\n", v81);
      printf("upstreamPassFatpTest:           0x%02X\n", v82);
      printf("sensor type:           0x%02X\n", v83);
      printf("\nsource:           %d\n", v84);
      printf("algo_version:       %d\n", v85);
      printf("size:               %d\n", v86);
      uint64_t v12 = v87;
      printf("numChannels:        %d\n", v87);
      uint64_t v13 = v88;
      printf("numGains:           %d\n", v88);
      LOWORD(v14) = v89;
      printf("lux_correction:      %f\n", (float)((float)v14 * 0.000061035));
      puts("gain_scaling:");
      if (v12)
      {
        uint64_t v15 = 0;
        unint64_t v16 = &v90;
        do
        {
          printf("\tch%d: ", v15);
          uint64_t v17 = (unsigned __int16 *)v16;
          uint64_t v18 = v13;
          if (v13)
          {
            do
            {
              unsigned int v19 = *v17++;
              printf("%f\t", (float)((float)v19 * 0.000061035));
              --v18;
            }
            while (v18);
          }
          putchar(10);
          ++v15;
          unint64_t v16 = (uint64_t *)((char *)v16 + 18);
        }
        while (v15 != v12);
        printf("darkCounts: ");
        int v20 = (char *)&v91;
        uint64_t v21 = v12;
        do
        {
          int v22 = *v20++;
          printf("%d\t", v22);
          --v21;
        }
        while (v21);
      }
      else
      {
        printf("darkCounts: ");
      }
      putchar(10);
      printf("backlightCounts: ");
      if (v12)
      {
        float v23 = (__int16 *)v92;
        uint64_t v24 = v12;
        do
        {
          int v25 = *v23++;
          printf("%d\t", v25);
          --v24;
        }
        while (v24);
        putchar(10);
        printf("luxCoeff: ");
        uint64_t v26 = (int *)&v93;
        uint64_t v27 = v12;
        do
        {
          int v28 = *v26++;
          printf("%lf\t", (double)v28 * 4.65661287e-10);
          --v27;
        }
        while (v27);
      }
      else
      {
        putchar(10);
        printf("luxCoeff: ");
      }
      putchar(10);
      printf("cctCoeff: ");
      if (v12)
      {
        float v30 = (int *)v94;
        uint64_t v31 = v12;
        do
        {
          int v32 = *v30++;
          printf("%lf\t", (double)v32 * 0.0000610351562);
          --v31;
        }
        while (v31);
        uint64_t v29 = v12;
      }
      else
      {
        uint64_t v29 = 0;
      }
      putchar(10);
      printf("luxCoeff_gain: %d\n", v94[12]);
      printf("luxCoeff_itime: %d\n", v94[13]);
      LODWORD(v33) = v95;
      printf("spectrum_normalization:      %lf\n", (double)v33 * 0.0000152587891);
      printf("wavelength_start_visible:           %d\n", v96);
      printf("wavelength_start_nir:               %d\n", v97);
      printf("wavelength_end:                     %d\n", v98);
      printf("wavelength_step:                    %d\n", v99);
      puts("spectrum:");
      uint64_t v34 = 0;
      float v35 = &v100;
      do
      {
        printf("%d\t", 2 * v34 + 300);
        float v36 = (int *)v35;
        uint64_t v37 = v29;
        if (v12)
        {
          do
          {
            printf("%f\t", (float)((float)*v36 / 737190.0));
            v36 += 401;
            --v37;
          }
          while (v37);
        }
        putchar(10);
        ++v34;
        float v35 = (uint64_t *)((char *)v35 + 4);
      }
      while (v34 != 100);
      putchar(10);
    }
    if (v53 & v52)
    {
      CFTypeRef cf = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&__ptr, 10632);
      CFDataRef theData = 0;
      unsigned int v69 = 0;
      if (cf)
      {
        processFDRCalibrationHmCA10((const __CFData **)&cf, &theData, &v69, 0);
        if (theData)
        {
          BytePtr = CFDataGetBytePtr(theData);
          long long v39 = *((_OWORD *)BytePtr + 11);
          long long v66 = *((_OWORD *)BytePtr + 10);
          long long v67 = v39;
          UInt8 v68 = BytePtr[192];
          long long v40 = *((_OWORD *)BytePtr + 7);
          long long v62 = *((_OWORD *)BytePtr + 6);
          long long v63 = v40;
          long long v41 = *((_OWORD *)BytePtr + 9);
          long long v64 = *((_OWORD *)BytePtr + 8);
          long long v65 = v41;
          long long v42 = *((_OWORD *)BytePtr + 3);
          long long v58 = *((_OWORD *)BytePtr + 2);
          long long v59 = v42;
          long long v43 = *((_OWORD *)BytePtr + 5);
          long long v60 = *((_OWORD *)BytePtr + 4);
          long long v61 = v43;
          long long v44 = *((_OWORD *)BytePtr + 1);
          long long v56 = *(_OWORD *)BytePtr;
          long long v57 = v44;
          CFIndex Length = CFDataGetLength(theData);
          printf("ALSCalibraitonData calibration data length = %ld (nChannels = %d)\n", Length, v69);
          v54[10] = v66;
          v54[11] = v67;
          UInt8 v55 = v68;
          v54[6] = v62;
          _DWORD v54[7] = v63;
          v54[8] = v64;
          v54[9] = v65;
          v54[2] = v58;
          v54[3] = v59;
          v54[4] = v60;
          v54[5] = v61;
          v54[0] = v56;
          v54[1] = v57;
          dumpCalibrationData((float *)v54);
        }
        CFRelease(cf);
      }
    }
  }
LABEL_17:
  exit(0);
}

os_log_t init_default_corebrightness_log()
{
  os_log_t v0 = os_log_create("com.apple.CoreBrightness", "default");
  _COREBRIGHTNESS_LOG_DEFAULT = (uint64_t)v0;
  if (!v0)
  {
    os_log_t v0 = (os_log_t)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_16778();
    }
    _COREBRIGHTNESS_LOG_DEFAULT = (uint64_t)&_os_log_default;
  }
  return v0;
}

uint64_t CBU_IsHarmonySupported()
{
  bzero(__s1, 0x400uLL);
  size_t v2 = 1024;
  if (sysctlbyname("kern.bootargs", __s1, &v2, 0, 0) || !strstr(__s1, "FORCE_HARMONY_SUPPORT")) {
    return 0;
  }
  uint64_t v0 = 1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v4 = "CBU_IsHarmonySupported";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: boot-arg to enforce harmony support", buf, 0xCu);
  }
  return v0;
}

uint64_t CBU_IsNightShiftSupported()
{
  return _MGGetBoolAnswer(@"F1Xz9g1JORibBS9DYPUPrg");
}

BOOL CBU_IsSoftWakeSupported()
{
  return MGGetSInt32Answer() == 6;
}

BOOL CBU_IsWatch()
{
  return MGGetSInt32Answer() == 6;
}

uint64_t CBU_IsSliderCommitTelemetrySupported()
{
  return 0;
}

uint64_t CBU_SyncDisplayStateControlSupported()
{
  if (qword_20090 != -1) {
    dispatch_once(&qword_20090, &stru_1C568);
  }
  return byte_20088;
}

void sub_8F20(id a1)
{
  if (MGGetSInt32Answer() == 6)
  {
    char v1 = 1;
  }
  else
  {
    int v39 = -1820426635;
    long long v38 = xmmword_18920;
    int v37 = -937652876;
    long long v36 = xmmword_18934;
    int v35 = 1874287171;
    long long v34 = xmmword_18678;
    int v33 = -781324731;
    long long v32 = xmmword_1868C;
    int v31 = -609570151;
    long long v30 = xmmword_186A0;
    int v29 = -874769875;
    long long v28 = xmmword_186B4;
    int v27 = 1214880059;
    long long v26 = xmmword_186C8;
    int v25 = 426359977;
    long long v24 = xmmword_186DC;
    int v23 = 1223847566;
    long long v22 = xmmword_186F0;
    int v21 = 185580364;
    long long v20 = xmmword_18704;
    int v19 = -773054213;
    long long v18 = xmmword_18858;
    int v17 = -1204420428;
    long long v16 = xmmword_1886C;
    int v15 = 958549802;
    long long v14 = xmmword_18768;
    int v13 = -12497897;
    long long v12 = xmmword_1877C;
    int v11 = 1377540371;
    long long v10 = xmmword_18790;
    int v9 = -518121279;
    long long v8 = xmmword_187A4;
    char v1 = MGIsDeviceOneOfType();
  }
  byte_20088 = v1;
  Boolean keyExistsAndHasValidFormat = 0;
  AppBooleanint Value = CFPreferencesGetAppBooleanValue(@"SynchronousDisplayStateControl", kCFPreferencesCurrentApplication, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v3 = AppBooleanValue;
    byte_20088 = AppBooleanValue != 0;
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      init_default_corebrightness_log();
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v3;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Synchronous display state control default override -> %i ", buf, 8u);
    }
  }
}

uint64_t CBU_ForceUpdateFrequencyAndFrameSkip()
{
  if (qword_200A0 != -1) {
    dispatch_once(&qword_200A0, &stru_1C5A8);
  }
  return byte_20098;
}

void sub_92AC(id a1)
{
  byte_20098 = MGIsDeviceOneOfType();
}

uint64_t CBU_ForceFrameAfterBrightnessUpdate()
{
  if (qword_200B0 != -1) {
    dispatch_once(&qword_200B0, &stru_1C5E8);
  }
  return byte_200A8;
}

void sub_9388(id a1)
{
  byte_200A8 |= MGIsDeviceOneOfType();
  byte_200A8 |= MGIsDeviceOneOfType();
  byte_200A8 |= MGIsDeviceOneOfType();
  byte_200A8 |= MGIsDeviceOneOfType();
  byte_200A8 |= MGIsDeviceOneOfType();
  byte_200A8 |= MGIsDeviceOneOfType();
  byte_200A8 |= MGIsDeviceOneOfType();
  byte_200A8 |= MGIsDeviceOneOfType();
}

uint64_t CBU_IsSyncBrightnessTransactionsSupported()
{
  return _MGGetBoolAnswer(@"DeviceSupportsFrameSynchronousBrightness");
}

uint64_t CBU_PassContrastEnhancerStrengthThroughSyncDBV()
{
  if (qword_200B8 != -1) {
    dispatch_once(&qword_200B8, &stru_1C628);
  }
  return byte_20004;
}

void sub_9710(id a1)
{
  char v1 = byte_20004;
  if (byte_20004)
  {
    char v2 = MGIsDeviceOneOfType();
    byte_20004 = v2 ^ 1;
    if ((v2 & 1) != 0
      || (char v3 = MGIsDeviceOneOfType(), byte_20004 = v3 ^ 1, (v3 & 1) != 0)
      || (char v4 = MGIsDeviceOneOfType(), byte_20004 = v4 ^ 1, (v4 & 1) != 0))
    {
      char v1 = 0;
    }
    else
    {
      char v1 = MGIsDeviceOneOfType() ^ 1;
    }
  }
  byte_20004 = v1;
}

uint64_t CBU_RampLumaBoostFactorInAOD()
{
  if (qword_200C8 != -1) {
    dispatch_once(&qword_200C8, &stru_1C668);
  }
  return byte_200C0;
}

void sub_9948(id a1)
{
  byte_200C0 = MGIsDeviceOneOfType();
}

uint64_t CBU_ShouldWaitForALS()
{
  return MGIsDeviceOneOfType();
}

BOOL CBU_IsAccessory()
{
  return MGGetSInt32Answer() == 7;
}

BOOL CBU_IsPad()
{
  return MGGetSInt32Answer() == 3;
}

uint64_t CBU_IsR2RSupported()
{
  byte_200D0 = 1;
  if (qword_200D8 != -1) {
    dispatch_once(&qword_200D8, &stru_1C6A8);
  }
  return byte_200D0;
}

void sub_9BD0(id a1)
{
  if (get_int_from_bootarg("als_R2R_supported", &dword_200D4))
  {
    byte_200D0 = dword_200D4 != 0;
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      init_default_corebrightness_log();
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      char v2 = "enabled";
      if (!byte_200D0) {
        char v2 = "disabled";
      }
      int v3 = 136315650;
      char v4 = v2;
      __int16 v5 = 2080;
      int v6 = "als_R2R_supported";
      __int16 v7 = 1024;
      int v8 = dword_200D4;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "R2R support is %s by %s = %d", (uint8_t *)&v3, 0x1Cu);
    }
  }
}

void CBU_GetNightShiftCCTRange(io_registry_entry_t a1, float *a2, float *a3, float *a4, float *a5)
{
  if (a2 && a3 && a4 && a5)
  {
    CFDataRef v10 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IOService", @"blr-cct-min", kCFAllocatorDefault, 3u);
    if (v10)
    {
      CFDataRef v11 = v10;
      CFTypeID TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v11) && (unint64_t)CFDataGetLength(v11) >= 4) {
        *a2 = (float)*(unsigned int *)CFDataGetBytePtr(v11);
      }
      CFRelease(v11);
    }
    CFDataRef v13 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IOService", @"blr-cct-max", kCFAllocatorDefault, 3u);
    if (v13)
    {
      CFDataRef v14 = v13;
      CFTypeID v15 = CFDataGetTypeID();
      if (v15 == CFGetTypeID(v14) && (unint64_t)CFDataGetLength(v14) >= 4) {
        *a4 = (float)*(unsigned int *)CFDataGetBytePtr(v14);
      }
      CFRelease(v14);
    }
    CFDataRef v16 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IOService", @"blr-cct-default", kCFAllocatorDefault, 3u);
    if (v16)
    {
      CFDataRef v17 = v16;
      CFTypeID v18 = CFDataGetTypeID();
      if (v18 == CFGetTypeID(v17) && (unint64_t)CFDataGetLength(v17) >= 4) {
        *a3 = (float)*(unsigned int *)CFDataGetBytePtr(v17);
      }
      CFRelease(v17);
    }
    CFDataRef v19 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IOService", @"blr-cct-warning", kCFAllocatorDefault, 3u);
    if (v19)
    {
      CFDataRef v20 = v19;
      CFTypeID v21 = CFDataGetTypeID();
      if (v21 == CFGetTypeID(v20) && (unint64_t)CFDataGetLength(v20) >= 4) {
        *a5 = (float)*(unsigned int *)CFDataGetBytePtr(v20);
      }
      CFRelease(v20);
    }
  }
}

uint64_t CBU_ShouldNotHandleExistingInternalDisplayAttachment()
{
  if (qword_200E8 != -1) {
    dispatch_once(&qword_200E8, &stru_1C6E8);
  }
  return byte_200E0;
}

void sub_9F7C(id a1)
{
  byte_200E0 = MGIsDeviceOneOfType();
}

uint64_t CBU_DeviceHasGrimaldi()
{
  return _MGGetBoolAnswer(@"RearALSCapability");
}

uint64_t convertMachToNanoSeconds(uint64_t a1)
{
  unsigned int v2 = dword_200F4;
  if (!dword_200F4)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_200F0);
    unsigned int v2 = dword_200F4;
  }
  return dword_200F0 / v2 * a1;
}

uint64_t CBU_ImplicitUserInteractedWithUI()
{
  if (qword_20100 != -1) {
    dispatch_once(&qword_20100, &stru_1C728);
  }
  return byte_200F8;
}

void sub_A0D8(id a1)
{
  byte_200F8 = MGIsDeviceOneOfType();
}

unint64_t readDataFromIOService(io_registry_entry_t a1, CFStringRef key, UInt8 *a3, CFIndex *a4)
{
  CFDataRef v6 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IOService", key, kCFAllocatorDefault, 3u);
  if (!v6) {
    return 0;
  }
  CFDataRef v7 = v6;
  CFTypeID v8 = CFGetTypeID(v6);
  if (v8 == CFDataGetTypeID())
  {
    unint64_t Length = CFDataGetLength(v7);
    unint64_t v10 = Length;
    if (Length >= *a4) {
      v11.length = *a4;
    }
    else {
      v11.length = Length;
    }
    *a4 = v11.length;
    v11.location = 0;
    CFDataGetBytes(v7, v11, a3);
  }
  else
  {
    unint64_t v10 = 0;
  }
  CFRelease(v7);
  return v10;
}

BOOL readExactDataFromIOService(io_registry_entry_t a1, const __CFString *a2, UInt8 *a3, CFIndex a4)
{
  CFIndex v5 = a4;
  return readDataFromIOService(a1, a2, a3, &v5) == a4;
}

void VD6287HmCl::VD6287HmCl(VD6287HmCl *this)
{
  *(void *)this = os_log_create("com.apple.CoreBrightness.ColourSensorFilterPlugin", "VD6287_HmCl");
}

{
  *(void *)this = os_log_create("com.apple.CoreBrightness.ColourSensorFilterPlugin", "VD6287_HmCl");
}

void VD6287HmCl::~VD6287HmCl(void **this)
{
}

{
  os_release(*this);
}

void sub_A29C(void *a1)
{
}

BOOL VD6287HmCl::processHeader(NSObject **a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*a2 >= 2u)
  {
    inited = *a1;
    if (!*a1)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    BOOL result = os_log_type_enabled(inited, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_16830((uint64_t)a2, inited, v10, v11, v12, v13, v14, v15);
      return 0;
    }
  }
  else if (a2[4] == 5 && ((v4 = a2[6], v4 != 9) ? (BOOL v5 = v4 == 7) : (BOOL v5 = 1), v5 && (v6 = a2[5], (v6 | 2) == 2)))
  {
    *(unsigned char *)(a3 + 1) = v4;
    *(unsigned char *)a3 = 5;
    *(unsigned char *)(a3 + 327) = v6;
    unsigned __int8 v7 = a2[7] - v4 + 9;
    *(unsigned char *)(a3 + 2) = v7;
    if (v7 < 0xAu)
    {
      *(_DWORD *)(a3 + 3) = *((_DWORD *)a2 + 2);
      return 1;
    }
    long long v24 = *a1;
    if (!*a1)
    {
      long long v24 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        long long v24 = init_default_corebrightness_log();
      }
    }
    BOOL result = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_167F8(v24, v25, v26, v27, v28, v29, v30, v31);
      return 0;
    }
  }
  else
  {
    CFDataRef v16 = *a1;
    if (!*a1)
    {
      CFDataRef v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        CFDataRef v16 = init_default_corebrightness_log();
      }
    }
    BOOL result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_167C0(v16, v17, v18, v19, v20, v21, v22, v23);
      return 0;
    }
  }
  return result;
}

uint64_t VD6287HmCl::processColor(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 *a8)
{
  float v8 = 128.0;
  LODWORD(a2) = 1.0;
  if (*(unsigned __int8 *)(a6 + 5) <= 1u) {
    float v8 = 1.0;
  }
  LOWORD(a2) = *(_WORD *)(a7 + 5);
  double v9 = (double)*(unint64_t *)&a2 / 100.0;
  *(float *)&double v9 = v9;
  *(_DWORD *)(a8 + 7) = LODWORD(v9);
  LOWORD(v9) = *(_WORD *)(a7 + 7);
  *(float *)&double v9 = (double)*(unint64_t *)&v9 * 0.0000610351562;
  *(_DWORD *)(a8 + 19) = LODWORD(v9);
  uint64_t v10 = *a8;
  if (*a8)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 9 - a8[1];
    uint64_t v13 = a7 + 9;
    uint64_t v14 = a8 + 27;
    do
    {
      uint64_t v15 = &a8[40 * v11];
      *(void *)(v15 + 23) = 0x400000003F800000;
      CFDataRef v16 = v15 + 23;
      *((_DWORD *)v16 + 2) = 1082130432;
      if (v12 <= 8)
      {
        float v17 = *(float *)&v16[4 * v12];
        uint64_t v18 = v12;
        do
        {
          LOWORD(a4) = *(_WORD *)(v13 + 2 * v18);
          a4 = (double)*(unint64_t *)&a4 * 0.0000610351562;
          float v17 = a4 * v17;
          *(float *)&v14[4 * v18++] = v17;
        }
        while (v18 != 9);
      }
      uint64_t v19 = a7 + 2 * v11;
      uint64_t v20 = &a8[4 * v11];
      *(float *)(v20 + 223) = (float)*(__int16 *)(v19 + 99) / v8;
      HIDWORD(a4) = 1058013184;
      float v21 = (double)*(__int16 *)(v19 + 109) * 0.0000610351562;
      *(float *)(v20 + 243) = v21;
      uint64_t v22 = a7 + 4 * v11;
      WORD1(a4) = 14208;
      *(float *)(v20 + 263) = (float)*(int *)(v22 + 119) * 0.000015259;
      *(float *)(v20 + 283) = (float)*(int *)(v22 + 139) * 0.0039062;
      *(float *)(v20 + 307) = (float)*(unsigned int *)(v22 + 163) * 0.000015259;
      ++v11;
      v13 += 18;
      v14 += 40;
    }
    while (v11 != v10);
  }
  *(float *)(a8 + 303) = (float)*(unsigned int *)(a7 + 159) * 0.000015259;
  return 1;
}

uint64_t VD6287HmCl::processOD(double a1, double a2, double a3, uint64_t a4, __int16 *a5, uint64_t a6)
{
  float v6 = (double)*a5 * 0.0000610351562;
  *(float *)(a6 + 328) = v6;
  uint64_t v7 = *(unsigned __int8 *)(a6 + 327);
  if (*(unsigned char *)(a6 + 327))
  {
    uint64_t v8 = 0;
    double v9 = a5 + 3;
    uint64_t v10 = a6 + 344;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = a6 + 40 * v8;
      *(void *)(v12 + 332) = 0x400000003F800000;
      *(_DWORD *)(v12 + 340) = 1082130432;
      float v13 = 4.0;
      do
      {
        LOWORD(a3) = v9[v11];
        a3 = (double)*(unint64_t *)&a3 * 0.0000610351562;
        float v13 = a3 * v13;
        *(float *)(v10 + 4 * v11++) = v13;
      }
      while (v11 != 7);
      *(float *)(a6 + 4 * v8 + 412) = (float)a5[v8 + 19];
      ++v8;
      v9 += 9;
      v10 += 40;
    }
    while (v8 != v7);
  }
  return 1;
}

BOOL VD6287HmCl::processXtalk(NSObject **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = *(unsigned __int8 *)(a3 + 4);
  *(unsigned char *)(a4 + 420) = v5;
  if (v5 == 7)
  {
    uint64_t v6 = 0;
    char v7 = *(unsigned char *)(a4 + 1);
    uint64_t v8 = 467;
    do
    {
      uint64_t v9 = a4 + v6;
      *(_WORD *)(a4 + v6 + 425) = *(_WORD *)(a3 + v6 + 5);
      *(_WORD *)(a4 + v6 + 439) = *(_WORD *)(a3 + v6 + 19);
      *(_WORD *)(a4 + v6 + 453) = *(_WORD *)(a3 + v6 + 33);
      *(unsigned char *)(a4 + v8) = *(unsigned char *)(a3 + v8 - 420) - v7 + 9;
      *(_WORD *)(v9 + 474) = *(_WORD *)(a3 + v6 + 54);
      *(_WORD *)(v9 + 488) = *(_WORD *)(a3 + v6 + 68);
      v6 += 2;
      ++v8;
    }
    while (v6 != 14);
    float v10 = 0.0;
    if (*(unsigned __int8 *)(a2 + 5) > 2u) {
      float v10 = (float)*(char *)(a3 + 83) * 0.0078125;
    }
    *(float *)(a4 + 421) = v10;
  }
  else
  {
    inited = *a1;
    if (!*a1)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_168A0(a4 + 420, inited, v12, v13, v14, v15, v16, v17);
    }
  }
  return v5 == 7;
}

uint64_t VD6287HmCl::processSpectrum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    operator new[]();
  }
  return 1;
}

BOOL VD6287HmCl::processBlob(NSObject **a1, uint64_t a2, uint64_t a3, _DWORD *a4, unsigned __int8 *a5, uint64_t a6)
{
  uint64_t v10 = *a4;
  uint64_t v11 = a3 + v10;
  *a4 = v10 + 4296;
  BOOL result = VD6287HmCl::processHeader(a1, (unsigned __int8 *)(a3 + v10), (uint64_t)a5);
  if (result)
  {
    uint64_t v17 = VD6287HmCl::processColor(v13, v14, v15, v16, result, a2, v11 + 12, a5);
    VD6287HmCl::processSpectrum(v17, v11 + 195, (uint64_t)a5, a6);
    BOOL result = VD6287HmCl::processXtalk(a1, a2, v11 + 4212, (uint64_t)a5);
    if (result)
    {
      a5[1] = 10;
      return 1;
    }
  }
  return result;
}

BOOL VD6287HmCl::processBlobOD(NSObject **a1, uint64_t a2, uint64_t a3, _DWORD *a4, unsigned __int8 *a5, uint64_t a6)
{
  uint64_t v10 = *a4;
  uint64_t v11 = a3 + v10;
  *a4 = v10 + 4340;
  BOOL result = VD6287HmCl::processHeader(a1, (unsigned __int8 *)(a3 + v10), (uint64_t)a5);
  if (result)
  {
    uint64_t v17 = VD6287HmCl::processColor(v13, v14, v15, v16, result, a2, v11 + 12, a5);
    uint64_t v21 = VD6287HmCl::processOD(v18, v19, v20, v17, (__int16 *)(v11 + 195), (uint64_t)a5);
    VD6287HmCl::processSpectrum(v21, v11 + 239, (uint64_t)a5, a6);
    BOOL result = VD6287HmCl::processXtalk(a1, a2, v11 + 4256, (uint64_t)a5);
    if (result)
    {
      a5[1] = 10;
      return 1;
    }
  }
  return result;
}

const __CFData *VD6287HmCl::match(const __CFData *this, const __CFData *a2)
{
  if (this)
  {
    CFDataRef v2 = this;
    if ((unint64_t)CFDataGetLength(this) >= 0x50
      && (BytePtr = CFDataGetBytePtr(v2), *(_DWORD *)BytePtr == 1215120236)
      && BytePtr[4] == 4)
    {
      return (const __CFData *)(BytePtr[5] < 4u);
    }
    else
    {
      return 0;
    }
  }
  return this;
}

uint64_t VD6287HmCl::process(const __CFData *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = os_log_create("com.apple.CoreBrightness.ColourSensorFilterPlugin", "VD6287_HmCl");
  long long v56 = v6;
  if ((VD6287HmCl::match(a1, v7) & 1) == 0)
  {
    inited = v6;
    if (!v6)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_169F4(inited, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_30;
  }
  CFIndex Length = CFDataGetLength(a1);
  if (Length == 8672)
  {
    int v9 = 0;
  }
  else
  {
    if (Length != 8760)
    {
      long long v24 = v6;
      if (!v6)
      {
        long long v24 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          long long v24 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_16910(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      goto LABEL_30;
    }
    int v9 = 1;
  }
  BytePtr = CFDataGetBytePtr(a1);
  if (BytePtr[10] != 2)
  {
    long long v32 = v6;
    if (!v6)
    {
      long long v32 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        long long v32 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_16984((uint64_t)(BytePtr + 10), v32, v33, v34, v35, v36, v37, v38);
    }
LABEL_30:
    uint64_t v39 = 0;
    goto LABEL_31;
  }
  double v19 = v6;
  if (!v6)
  {
    double v19 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      double v19 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = BytePtr[4];
    int v21 = BytePtr[5];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v21;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "HmCl calibration version = v%d.%d", buf, 0xEu);
  }
  int v55 = 80;
  uint64_t v22 = (unsigned __int8 *)(a2 + 502);
  if (v9)
  {
    if (VD6287HmCl::processBlobOD(&v56, (uint64_t)BytePtr, (uint64_t)BytePtr, &v55, v22, 0))
    {
      BOOL v23 = VD6287HmCl::processBlobOD(&v56, (uint64_t)BytePtr, (uint64_t)BytePtr, &v55, (unsigned __int8 *)a2, a3);
LABEL_34:
      uint64_t v39 = v23;
      int v42 = BytePtr[5];
      long long v41 = (unsigned __int8 *)(BytePtr + 5);
      if (!v42 && v23)
      {
        __int16 v61 = *(_WORD *)(a2 + 1002);
        long long v43 = *(_OWORD *)(a2 + 970);
        long long v58 = *(_OWORD *)(a2 + 954);
        long long v59 = v43;
        long long v60 = *(_OWORD *)(a2 + 986);
        long long v44 = *(_OWORD *)(a2 + 938);
        *(_OWORD *)buf = *(_OWORD *)(a2 + 922);
        *(_OWORD *)&buf[16] = v44;
        *(_WORD *)(a2 + 1002) = *(_WORD *)(a2 + 500);
        long long v45 = *(_OWORD *)(a2 + 468);
        *(_OWORD *)(a2 + 954) = *(_OWORD *)(a2 + 452);
        *(_OWORD *)(a2 + 970) = v45;
        *(_OWORD *)(a2 + 986) = *(_OWORD *)(a2 + 484);
        long long v46 = *(_OWORD *)(a2 + 436);
        *(_OWORD *)(a2 + 922) = *(_OWORD *)(a2 + 420);
        *(_OWORD *)(a2 + 938) = v46;
        long long v47 = *(_OWORD *)&buf[16];
        *(_OWORD *)(a2 + 420) = *(_OWORD *)buf;
        *(_OWORD *)(a2 + 436) = v47;
        *(_WORD *)(a2 + 500) = v61;
        long long v48 = v60;
        long long v49 = v58;
        uint64_t v39 = 1;
        *(_OWORD *)(a2 + 468) = v59;
        *(_OWORD *)(a2 + 484) = v48;
        *(_OWORD *)(a2 + 452) = v49;
      }
      goto LABEL_38;
    }
  }
  else if (VD6287HmCl::processBlob(&v56, (uint64_t)BytePtr, (uint64_t)BytePtr, &v55, v22, 0))
  {
    BOOL v23 = VD6287HmCl::processBlob(&v56, (uint64_t)BytePtr, (uint64_t)BytePtr, &v55, (unsigned __int8 *)a2, a3);
    goto LABEL_34;
  }
  uint64_t v39 = 0;
  long long v41 = (unsigned __int8 *)(BytePtr + 5);
LABEL_38:
  char v50 = v6;
  if (!v6)
  {
    char v50 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      char v50 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    double v51 = *(float *)(a2 + 421);
    double v52 = *(float *)(a2 + 923);
    *(_DWORD *)buf = 134218240;
    *(double *)&uint8_t buf[4] = v51;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v52;
    _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "{ \"lux_error_offset_sync\":%f, \"lux_error_offset_async\":%f }", buf, 0x16u);
  }
  int v53 = dword_18A28[*v41 > 1u];
  int v54 = dword_18A30[*v41 > 1u];
  *(_DWORD *)(a2 + 11) = v53;
  *(_DWORD *)(a2 + 15) = v54;
  *(_DWORD *)(a2 + 513) = v53;
  *(_DWORD *)(a2 + 517) = v54;
LABEL_31:
  os_release(v6);
  return v39;
}

void sub_ADF8(_Unwind_Exception *a1)
{
  os_release(v1);
  _Unwind_Resume(a1);
}

void sub_AE4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_AE68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL processFDRCalibrationHmCA10(const __CFData **a1, const __CFData **a2, unsigned int *a3, uint64_t a4)
{
  CFIndex Length = CFDataGetLength(*a1);
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = a4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = Length;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "[0x%llx] FDR calibration data length = %ld\n", buf, 0x16u);
  }
  if (Length == 10632)
  {
    BytePtr = (UInt8 *)CFDataGetBytePtr(*a1);
    if (*(_DWORD *)BytePtr != 1215120193)
    {
      uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v9 = init_default_corebrightness_log();
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_16A2C((char *)BytePtr, a4, v9);
      }
    }
    uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v10 = init_default_corebrightness_log();
    }
    uint64_t v36 = a2;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = BytePtr[4];
      int v12 = BytePtr[5];
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = a4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[0x%llx] HmCA version = v%d.%d\n", buf, 0x18u);
    }
    memset(v62, 0, 124);
    long long v61 = 0u;
    long long v60 = 0u;
    *(_OWORD *)&buf[21] = 0u;
    *(_OWORD *)&buf[5] = 0u;
    buf[0] = BytePtr[5] + 10 * BytePtr[4];
    buf[9] = 1;
    *(_DWORD *)&buf[1] = 2;
    *(_WORD *)&buf[10] = 193;
    *(_WORD *)&buf[12] = *((_WORD *)BytePtr + 15);
    uint64_t v13 = BytePtr[29];
    unsigned __int8 v14 = BytePtr[206] - v13 + 9;
    int v15 = *((unsigned __int16 *)BytePtr + 104);
    *(_WORD *)&buf[14] = *((_WORD *)BytePtr + 104);
    *(_DWORD *)&buf[16] = 6488164;
    strcpy(&buf[20], ">");
    *(_DWORD *)&buf[22] = 16843009 * v14;
    buf[26] = BytePtr[28];
    unint64_t v16 = buf[26];
    *a3 = buf[26];
    buf[27] = v13;
    uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v17 = init_default_corebrightness_log();
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v39 = 134218754;
      uint64_t v40 = a4;
      __int16 v41 = 2080;
      int v42 = "processFDRCalibrationHmCA10";
      __int16 v43 = 1024;
      int v44 = v16;
      __int16 v45 = 1024;
      LODWORD(v46) = v13;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "[0x%llx] %s: nChannels = %d, nGains = %d", v39, 0x22u);
    }
    double v18 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      double v18 = init_default_corebrightness_log();
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v39 = 134218754;
      uint64_t v40 = a4;
      __int16 v41 = 2080;
      int v42 = "processFDRCalibrationHmCA10";
      __int16 v43 = 1024;
      int v44 = v14;
      __int16 v45 = 1024;
      LODWORD(v46) = v15;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "[0x%llx] %s: gain = %d, iTime = %d", v39, 0x22u);
    }
    if (v16)
    {
      unint64_t v19 = 0;
      int v20 = &v62[14];
      int v21 = BytePtr + 32;
      do
      {
        int v22 = (char)BytePtr[v19 + 140];
        BOOL v23 = &buf[25 * v19];
        v23[68] = BytePtr[v19 + 140];
        *(_WORD *)(v23 + 73) = *(_WORD *)&BytePtr[2 * v19 + 146];
        uint64_t v24 = (uint64_t)&BytePtr[4 * v19 + 24];
        float v25 = (float)*(int *)(v24 + 134) * 4.6566e-10;
        uint64_t v26 = (float *)&buf[4 * v19];
        v26[7] = v25;
        float v27 = (float)*(int *)(v24 + 158) * 0.000061035;
        v26[12] = v27;
        uint64_t v28 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v28 = init_default_corebrightness_log();
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = *(__int16 *)&v62[25 * v19];
          *(_DWORD *)uint64_t v39 = 134220290;
          uint64_t v40 = a4;
          __int16 v41 = 2080;
          int v42 = "processFDRCalibrationHmCA10";
          __int16 v43 = 1024;
          int v44 = v19;
          __int16 v45 = 2048;
          double v46 = v25;
          __int16 v47 = 1024;
          int v48 = v19;
          __int16 v49 = 2048;
          double v50 = v27;
          __int16 v51 = 1024;
          int v52 = v19;
          __int16 v53 = 1024;
          int v54 = v29;
          __int16 v55 = 1024;
          int v56 = v19;
          __int16 v57 = 1024;
          int v58 = v22;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "[0x%llx] %s: luxCoeff[%d]=%f, cctCoeff[%d]=%f, offsetCounts[%d]=%d/255 darkCounts[%d] = %d", v39, 0x4Eu);
        }
        *(void *)&v62[25 * v19 + 6] = 0x8000800080008000;
        uint64_t v30 = v13;
        uint64_t v31 = v21;
        long long v32 = v20;
        if (v13)
        {
          do
          {
            __int16 v33 = *(_WORD *)v31;
            v31 += 2;
            *v32++ = v33;
            --v30;
          }
          while (v30);
        }
        ++v19;
        v20 += 25;
        v21 += 18;
      }
      while (v19 < v16);
    }
    CFIndex Length = 10632;
    int *v36 = CFDataCreate(kCFAllocatorDefault, buf, 193);
  }
  else
  {
    uint64_t v34 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v34 = init_default_corebrightness_log();
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_16ADC(a4, Length, v34);
    }
  }
  return Length == 10632;
}

BOOL processFDRSpectrumHmCA10(CFDataRef *a1)
{
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Process FDR calibration spectrum", (uint8_t *)&v6, 2u);
  }
  CFIndex Length = CFDataGetLength(*a1);
  if (Length == 10632)
  {
    CFDataGetBytePtr(*a1);
    operator new[]();
  }
  int v4 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    int v4 = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_16B64(Length, v4);
  }
  return Length == 10632;
}

uint64_t dumpCalibrationData(float *a1)
{
  putchar(10);
  putchar(10);
  printf("CAL DATA STRUCT SIZE: %lu \n", 193);
  puts("Calibration Header -- ");
  printf("alsCalibrationHeader.version = %d\n", *(unsigned __int8 *)a1);
  printf("alsCalibrationHeader.numSensor = %d\n", *((unsigned __int8 *)a1 + 9));
  printf("alsCalibrationHeader.calibrationuint64_t Type = %d\n", *(_DWORD *)((char *)a1 + 1));
  printf("alsCalibrationHeader.size = %d\n", *((unsigned __int16 *)a1 + 5));
  putchar(10);
  puts("Cal Data for Sensor --");
  printf("calibrationFudgeForLux = %d / 1000\n", (1000 * *((unsigned __int16 *)a1 + 6)) >> 14);
  printf("slowModeIntegrationTime = %d\n", *((unsigned __int16 *)a1 + 7));
  printf("fastModeIntegrationTime = %d\n", *((unsigned __int16 *)a1 + 8));
  printf("rapidModeIntegrationTime = %d\n", *((unsigned __int16 *)a1 + 9));
  printf("occlusionModeIntegrationTime = %d\n", *((unsigned __int16 *)a1 + 10));
  printf("slowModeGain = %d\n", *((unsigned __int8 *)a1 + 22));
  printf("fastModeGain = %d\n", *((unsigned __int8 *)a1 + 23));
  printf("rapidModeGain = %d\n", *((unsigned __int8 *)a1 + 24));
  printf("occlusionModeGain = %d\n", *((unsigned __int8 *)a1 + 25));
  printf("numberOfGains=%d \n", *((unsigned __int8 *)a1 + 27));
  if (*((unsigned char *)a1 + 26))
  {
    unint64_t v2 = 0;
    int v3 = (unsigned __int8 *)a1 + 75;
    do
    {
      putchar(10);
      printf("Channel %d --\n", v2);
      int v4 = (unsigned __int8 *)a1 + 25 * v2;
      printf("dark counts = %d\n", (char)v4[68]);
      printf("channel offset counts = %d/1000 \n", 1000 * *(__int16 *)(v4 + 69) / 256);
      printf("backlight leakage high counts = %d \n", *(__int16 *)(v4 + 73));
      if (*((unsigned char *)a1 + 27))
      {
        unint64_t v5 = 0;
        do
        {
          printf("scale factor %d = %d / 1000\n", v5, (1000 * *(unsigned __int16 *)&v3[2 * v5]) >> 14);
          ++v5;
        }
        while (v5 < *((unsigned __int8 *)a1 + 27));
      }
      ++v2;
      v3 += 25;
    }
    while (v2 < *((unsigned __int8 *)a1 + 26));
  }
  printf("Lux coefficients: a1=%d/1000000 a2=%d/1000000 a3=%d/1000000 a4=%d/1000000 a5=%d/1000000\n", (int)(float)(a1[7] * 1000000.0), (int)(float)(a1[8] * 1000000.0), (int)(float)(a1[9] * 1000000.0), (int)(float)(a1[10] * 1000000.0), (int)(float)(a1[11] * 1000000.0));
  return printf("CCT coefficients: a1=%d/1000000 a2=%d/1000000 a3=%d/1000000 a4=%d/1000000 a5=%d/1000000\n", (int)(float)(a1[12] * 1000000.0), (int)(float)(a1[13] * 1000000.0), (int)(float)(a1[14] * 1000000.0), (int)(float)(a1[15] * 1000000.0), (int)(float)(a1[16] * 1000000.0));
}

BOOL convertFDRCalibrationFormatFrom17to10(const __CFData **a1, const __CFData **a2)
{
  unint64_t v2 = (CFDataRef *)__chkstk_darwin(a1);
  int v4 = v3;
  unint64_t v5 = v2;
  CFIndex Length = CFDataGetLength(*v2);
  if (Length == 9962)
  {
    BytePtr = CFDataGetBytePtr(*v5);
    *(_DWORD *)bytes = *(_DWORD *)BytePtr;
    __int16 v25 = *((_WORD *)BytePtr + 2);
    __int16 v26 = 10632;
    unint64_t v27 = ((unint64_t)BytePtr[13] << 56) | ((unint64_t)BytePtr[15] << 48) | ((unint64_t)BytePtr[17] << 40) | ((unint64_t)BytePtr[19] << 32) | ((unint64_t)BytePtr[21] << 24) | ((unint64_t)BytePtr[23] << 16) | ((unint64_t)BytePtr[25] << 8) | BytePtr[27];
    char v28 = 4;
    v29[0] = BytePtr[76];
    v29[1] = BytePtr[77];
    __int16 v30 = 10608;
    UInt8 v31 = BytePtr[80];
    uint64_t v8 = v31;
    uint64_t v9 = BytePtr[81];
    UInt8 v32 = BytePtr[81];
    __int16 v33 = *((_WORD *)BytePtr + 41);
    v34[87] = *((_WORD *)BytePtr + 141);
    v34[88] = *((_WORD *)BytePtr + 142);
    int v35 = *(_DWORD *)(BytePtr + 290);
    __int16 v36 = *((_WORD *)BytePtr + 165);
    __int16 v37 = *((_WORD *)BytePtr + 166);
    __int16 v38 = *((_WORD *)BytePtr + 167);
    UInt8 v39 = BytePtr[336];
    if (v31)
    {
      uint64_t v10 = 0;
      int v11 = BytePtr + 84;
      int v12 = v34;
      uint64_t v13 = BytePtr + 338;
      unsigned __int8 v14 = &v40;
      do
      {
        *((unsigned char *)&v34[54] + v10) = BytePtr[v10 + 216];
        v34[v10 + 57] = *(_WORD *)&BytePtr[2 * v10 + 222];
        uint64_t v15 = (uint64_t)&BytePtr[4 * v10 + 76];
        unint64_t v16 = &v29[4 * v10];
        *(_DWORD *)(v16 + 134) = *(_DWORD *)(v15 + 158);
        *(_DWORD *)(v16 + 158) = *(_DWORD *)(v15 + 182);
        uint64_t v17 = v9;
        double v18 = v12;
        unint64_t v19 = v11;
        if (v9)
        {
          do
          {
            __int16 v20 = *(_WORD *)v19;
            v19 += 2;
            *v18++ = v20;
            --v17;
          }
          while (v17);
        }
        for (uint64_t i = 0; i != 1604; i += 4)
          *(_DWORD *)((char *)v14 + i) = *(_DWORD *)&v13[i];
        ++v10;
        v11 += 18;
        v12 += 9;
        v13 += 1604;
        unsigned __int8 v14 = (uint64_t *)((char *)v14 + 1604);
      }
      while (v10 != v8);
    }
    CFDataRef *v4 = CFDataCreate(kCFAllocatorDefault, bytes, 10632);
  }
  else
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_16BDC(Length, inited);
    }
  }
  return Length == 9962;
}

double specialSolve(uint64_t a1, int a2, uint64_t a3, uint64_t a4, float32x4_t *a5, uint64_t a6)
{
  uint64_t v11 = __chkstk_darwin(a1);
  uint64_t v13 = (float *)((char *)&v29 - v12);
  sub_68F0(v11, v14, v15, v11, a4, (uint64_t)a5, v11, a6);
  sub_6CA4(a1, a2, a5, a1, a4, v13);
  v17.f32[0] = sub_6770(a2, (uint64_t)v13, v16);
  if (a2 >= 1)
  {
    unint64_t v20 = 0;
    uint64_t v21 = 1;
    uint64_t v22 = 4;
    BOOL v23 = v13;
    do
    {
      float32x4_t v18 = vld1q_dup_f32(v23++);
      float32x4_t v17 = vdivq_f32(*(float32x4_t *)(a6 + 16 * v20), v18);
      *(float32x4_t *)(a6 + 16 * v20++) = v17;
      if (v20 < a2)
      {
        float32x4_t v17 = vnegq_f32(v17);
        uint64_t v24 = v22;
        uint64_t v25 = a2;
        do
        {
          float v26 = *v23++;
          v18.f32[0] = v26;
          uint64_t v27 = 4 * (v24 & 0xFFFFFFFC);
          float32x4_t v19 = vmlaq_n_f32(*(float32x4_t *)(a6 + v27), v17, v26);
          *(float32x4_t *)(a6 + v27) = v19;
          --v25;
          v24 += 4;
        }
        while (v21 != v25);
      }
      ++v21;
      v22 += 4;
    }
    while (v20 != a2);
  }
  *(void *)&double result = sub_7094(a2, a6, (uint64_t)v13, v17, *(double *)v18.i64, *(float32x2_t *)v19.f32).u64[0];
  return result;
}

void specialSolveWithRegularization(uint64_t a1, int a2, float a3, uint64_t a4, uint64_t a5, float32x4_t *a6, uint64_t a7)
{
  uint64_t v13 = __chkstk_darwin(a1);
  uint64_t v15 = (float *)((char *)&v33 - v14);
  sub_68F0(v13, v16, v17, v13, a5, (uint64_t)a6, v13, a7);
  sub_6CA4(a1, a2, a6, a1, a5, v15);
  if (a2 <= 0)
  {
    v28.f32[0] = sub_6770(a2, (uint64_t)v15, v18);
  }
  else
  {
    uint64_t v19 = 0;
    int v20 = 0;
    do
    {
      float v21 = v15[v20] + a3;
      v15[v20] = v21;
      int v20 = v20 + a2 - v19++;
    }
    while (a2 != v19);
    sub_6770(a2, (uint64_t)v15, v21);
    unint64_t v23 = 0;
    uint64_t v24 = 1;
    uint64_t v25 = 4;
    float v26 = v15;
    do
    {
      float32x4_t v27 = vld1q_dup_f32(v26++);
      float32x4_t v28 = vdivq_f32(*(float32x4_t *)(a7 + 16 * v23), v27);
      *(float32x4_t *)(a7 + 16 * v23++) = v28;
      if (v23 < a2)
      {
        float32x4_t v28 = vnegq_f32(v28);
        uint64_t v29 = v25;
        uint64_t v30 = a2;
        do
        {
          float v31 = *v26++;
          v27.f32[0] = v31;
          uint64_t v32 = 4 * (v29 & 0xFFFFFFFC);
          float32x4_t v22 = vmlaq_n_f32(*(float32x4_t *)(a7 + v32), v28, v31);
          *(float32x4_t *)(a7 + v32) = v22;
          --v30;
          v29 += 4;
        }
        while (v24 != v30);
      }
      ++v24;
      v25 += 4;
    }
    while (v23 != a2);
  }
  sub_7094(a2, a7, (uint64_t)v15, v28, *(double *)v27.i64, *(float32x2_t *)v22.f32);
}

void generalSolveWithRegularization(int a1, int a2, uint64_t a3, const float *a4, uint64_t a5, _DWORD *a6, float a7)
{
  LODWORD(__N) = a1;
  if (a7 == 0.0)
  {
    generalSolve(a1, a2, a3, a4, a5);
  }
  else
  {
    __CLPK_real __work = 0.0;
    char __uplo = 85;
    int v13 = a2 + a1;
    __CLPK_integer __nrhs = 3;
    __CLPK_integer __ldb = a2 + a1;
    uint64_t v14 = (__CLPK_integer *)malloc_type_malloc(4 * (a2 + a1), 0x100004052888210uLL);
    __CLPK_integer v37 = 0;
    __CLPK_integer __lwork = -1;
    uint64_t v15 = (__CLPK_real *)malloc_type_calloc((v13 * v13), 4uLL, 0x100004052888210uLL);
    int v16 = (__CLPK_real *)malloc_type_calloc(3 * v13, 4uLL, 0x100004052888210uLL);
    float32x4_t v17 = (float *)malloc_type_malloc(4 * a1, 0x100004052888210uLL);
    float v18 = v17;
    __ipiv = v14;
    if (v14)
    {
      if (v15) {
        BOOL v19 = v16 == 0;
      }
      else {
        BOOL v19 = 1;
      }
      BOOL v20 = v19 || v17 == 0;
      float v21 = 0;
      if (!v20)
      {
        if (a1 >= 1)
        {
          int v22 = 0;
          uint64_t v23 = a1;
          do
          {
            v15[v22] = 1.0;
            v22 += v13 + 1;
            --v23;
          }
          while (v23);
        }
        if (a2 <= 0)
        {
          vvsqrtf(v17, a4, (const int *)&__N);
        }
        else
        {
          int v24 = a1 * (v13 + 1);
          uint64_t v25 = v13 - (uint64_t)a1;
          do
          {
            v15[v24] = -a7;
            v24 += v13 + 1;
            --v25;
          }
          while (v25);
          vvsqrtf(v17, a4, (const int *)&__N);
          int v26 = 0;
          do
          {
            vDSP_vmul((const float *)(a5 + 4 * (int)__N * v26), 1, v18, 1, &v15[(v26 + (int)__N) * v13], 1, (int)__N);
            ++v26;
          }
          while (a2 != v26);
        }
        int v27 = 0;
        float32x4_t v28 = v16;
        do
        {
          vDSP_vmul((const float *)(a3 + 4 * (int)__N * v27++), 1, v18, 1, v28, 1, (int)__N);
          v28 += v13;
        }
        while (v27 != 3);
        ssysv_(&__uplo, &__ldb, &__nrhs, v15, &__ldb, __ipiv, v16, &__ldb, &__work, &__lwork, &v37);
        __CLPK_integer __lwork = (int)__work;
        float v21 = (__CLPK_real *)malloc_type_malloc(4 * (int)__work, 0x100004052888210uLL);
        if (v21)
        {
          ssysv_(&__uplo, &__ldb, &__nrhs, v15, &__ldb, __ipiv, v16, &__ldb, v21, &__lwork, &v37);
          uint64_t v29 = 0;
          __CLPK_integer v30 = __ldb;
          int v31 = __N;
          do
          {
            uint64_t v32 = a2;
            int v33 = v31;
            uint64_t v34 = a6;
            if (a2 >= 1)
            {
              do
              {
                _DWORD *v34 = LODWORD(v16[v33]);
                v34 += 4;
                ++v33;
                --v32;
              }
              while (v32);
            }
            ++v29;
            ++a6;
            v31 += v30;
          }
          while (v29 != 3);
        }
      }
    }
    else
    {
      float v21 = 0;
    }
    if (__ipiv) {
      free(__ipiv);
    }
    if (v15) {
      free(v15);
    }
    if (v16) {
      free(v16);
    }
    if (v18) {
      free(v18);
    }
    if (v21) {
      free(v21);
    }
  }
}

uint64_t ColorSensorPlugIn::AddRef(ColorSensorPlugIn *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

uint64_t ColorSensorPlugIn::AddRef(ColorSensorPlugIn *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t ProgressCallback(_DWORD *a1, int a2, float *a3, float *a4)
{
  uint64_t v4 = *(void *)a1;
  *(float *)(*(void *)a1 + 4 * a2) = *a3;
  int v6 = a1[4];
  int v5 = a1[5];
  *(float *)(v4 + 4 * (v6 + a2)) = a3[1];
  *(float *)(v4 + 4 * (a2 + 2 * v6)) = a3[2];
  if (v5)
  {
    uint64_t v7 = __chkstk_darwin();
    uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFF0);
    uint64_t v13 = *(unsigned int *)(v7 + 20);
    if (v13)
    {
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)(v7 + 48);
      double v16 = 0.0;
      do
      {
        double v17 = 0.0;
        if (v10 >= 1)
        {
          uint64_t v18 = 0;
          unsigned int v19 = v14;
          do
          {
            int v20 = *(_DWORD *)(*(void *)(v7 + 40) + 4 * v19);
            if (*(unsigned char *)(v7 + 28) && v18 >= v10 - 196) {
              double v21 = (float)((float)(*(float *)(v7 + 32) * (float)v20) * *(float *)(*(void *)(v7 + 56) + 4 * v14));
            }
            else {
              double v21 = (double)v20;
            }
            double v17 = v17 + v21 * *(float *)(v9 + 4 * v18++);
            v19 += v13;
          }
          while (v10 != v18);
        }
        *(double *)&v12[8 * v14] = v17;
        double v16 = v16 + v17 * *(float *)(v15 + 4 * v14++);
      }
      while (v14 != v13);
    }
    else
    {
      double v16 = 0.0;
    }
    uint64_t v22 = *(int *)(v7 + 24);
    if (v13 != v22)
    {
      uint64_t v23 = (v13 - v22);
      uint64_t v24 = *(int *)(v7 + 16);
      uint64_t v25 = (float *)(*(void *)(v7 + 8) + 4 * v8);
      int v26 = (double *)&v12[8 * v22];
      double v27 = 300.0 / v16;
      do
      {
        double v28 = *v26++;
        float v29 = v27 * v28;
        *uint64_t v25 = v29;
        v25 += v24;
        --v23;
      }
      while (v23);
    }
  }
  return 0;
}

void ColorSensorPlugIn::open(_DWORD *a1, uint64_t a2)
{
  uint64_t Property = (const void *)IOHIDServiceGetProperty();
  if (Property)
  {
    CFStringRef v5 = CFCopyDescription(Property);
    if (v5)
    {
      CFStringRef v6 = v5;
      inited = qword_20108;
      if (!qword_20108)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = CFStringGetCStringPtr(v6, 0x600u);
        _os_log_impl(&dword_0, inited, OS_LOG_TYPE_INFO, "IONameMatched=%{public}s \n", buf, 0xCu);
      }
      CFRelease(v6);
    }
  }
  else
  {
    int v8 = qword_20108;
    if (!qword_20108)
    {
      int v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        int v8 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Unknown IONameMatched\n", buf, 2u);
    }
  }
  *(void *)(a1 + 9) = 0x100000001;
  *((void *)a1 + 3) = a2;
  *((unsigned char *)a1 + 44) = 0;
  a1[12] = 1066192077;
  *((unsigned char *)a1 + 52) = 0;
  *((void *)a1 + 8) = 0;
  *((void *)a1 + 7) = 0;
  a1[28] = 925353388;
  *(void *)(a1 + 55) = 0;
  *((unsigned char *)a1 + 216) = 0;
  *((void *)a1 + 9) = 0;
  a1[20] = 0;
  *((unsigned char *)a1 + 256) = 0;
  a1[65] = 0;
  a1[58] = 0;
  uint64_t v9 = (const void *)MGCopyAnswer();
  int v10 = v9;
  if (v9)
  {
    int v11 = CFEqual(v9, @"Bridge OS");
    *((unsigned char *)a1 + 256) = v11 != 0;
    if (v11)
    {
      uint64_t v12 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Plugin is opening on Bridge OS.", buf, 2u);
      }
    }
    CFRelease(v10);
  }
  uint64_t v13 = (const void *)MGCopyAnswer();
  uint64_t v14 = v13;
  if (v13)
  {
    if (CFEqual(v13, @"1"))
    {
      int v15 = 1;
    }
    else
    {
      if (!CFEqual(v14, @"2")) {
        goto LABEL_28;
      }
      int v15 = 2;
    }
    a1[58] = v15;
LABEL_28:
    double v16 = qword_20108;
    if (!qword_20108)
    {
      double v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        double v16 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = a1[58];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "DeviceColor is %d", buf, 8u);
    }
    CFRelease(v14);
  }
  uint64_t valuePtr = 0;
  CFNumberRef RegistryID = (const __CFNumber *)IOHIDServiceGetRegistryID();
  if (RegistryID) {
    CFNumberGetValue(RegistryID, kCFNumberSInt64Type, &valuePtr);
  }
  if (valuePtr)
  {
    CFDictionaryRef v19 = IORegistryEntryIDMatching(valuePtr);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v19);
    a1[8] = MatchingService;
    if (!MatchingService) {
      goto LABEL_89;
    }
  }
  else
  {
    io_service_t MatchingService = a1[8];
    if (!MatchingService) {
      goto LABEL_89;
    }
  }
  if ((load_uint_from_edt(MatchingService, @"IOHIDOrientationType", a1 + 9) & 1) == 0)
  {
    CFNumberRef v21 = (const __CFNumber *)IOHIDServiceGetProperty();
    CFNumberRef v22 = v21;
    if (v21)
    {
      CFTypeID v23 = CFGetTypeID(v21);
      if (v23 == CFNumberGetTypeID()) {
        CFNumberGetValue(v22, kCFNumberIntType, a1 + 9);
      }
    }
  }
  if ((load_uint_from_edt(a1[8], @"IOHIDPlacementType", a1 + 10) & 1) == 0)
  {
    CFNumberRef v24 = (const __CFNumber *)IOHIDServiceGetProperty();
    CFNumberRef v25 = v24;
    if (v24)
    {
      CFTypeID v26 = CFGetTypeID(v24);
      if (v26 == CFNumberGetTypeID()) {
        CFNumberGetValue(v25, kCFNumberIntType, a1 + 10);
      }
    }
  }
  sub_D388((uint64_t)buf);
  sub_14FBC(&v83[2], (uint64_t)"ALS_", 4);
  std::ostream::operator<<();
  if (qword_20108) {
    os_release((void *)qword_20108);
  }
  std::stringbuf::str();
  if (v80 >= 0) {
    double v27 = __p;
  }
  else {
    double v27 = *(const char **)__p;
  }
  qword_20108 = (uint64_t)os_log_create("com.apple.CoreBrightness.ColourSensorFilterPlugin", v27);
  if (v80 < 0) {
    operator delete(*(void **)__p);
  }
  CFDataRef v28 = (const __CFData *)IORegistryEntrySearchCFProperty(a1[8], "IOService", @"color-algo-override", kCFAllocatorDefault, 3u);
  CFDataRef v29 = v28;
  if (v28)
  {
    if (CFDataGetLength(v28) == 4)
    {
      v87.location = 0;
      v87.length = 1;
      CFDataGetBytes(v29, v87, (UInt8 *)a1 + 45);
      __CLPK_integer v30 = qword_20108;
      if (!qword_20108)
      {
        __CLPK_integer v30 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          __CLPK_integer v30 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v31 = *((unsigned __int8 *)a1 + 45);
        *(_DWORD *)__p = 67109120;
        *(_DWORD *)&__p[4] = v31;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Color algo override version = %hhu from EDT\n", __p, 8u);
      }
    }
    CFRelease(v29);
  }
  CFDataRef v32 = (const __CFData *)IORegistryEntrySearchCFProperty(a1[8], "IOService", @"harmony-db-version", kCFAllocatorDefault, 3u);
  CFDataRef v33 = v32;
  if (v32)
  {
    *(_DWORD *)buffer = 0;
    if (CFDataGetLength(v32) == 4)
    {
      v88.location = 0;
      v88.length = 4;
      CFDataGetBytes(v33, v88, buffer);
      uint64_t v34 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v34 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v34 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__p = 67109120;
        *(_DWORD *)&__p[4] = *(_DWORD *)buffer;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "Harmony light DB version = %u from EDT\n", __p, 8u);
      }
      if ((*(_DWORD *)buffer - 1) > 2)
      {
        if (os_log_type_enabled((os_log_t)qword_20108, OS_LOG_TYPE_FAULT)) {
          sub_16C54();
        }
      }
      else
      {
        a1[59] = *(_DWORD *)buffer;
      }
    }
    CFRelease(v33);
  }
  CFDataRef v35 = (const __CFData *)IORegistryEntrySearchCFProperty(a1[8], "IOService", @"color-algo-lambda", kCFAllocatorDefault, 3u);
  CFDataRef v36 = v35;
  if (v35)
  {
    CFTypeID v37 = CFGetTypeID(v35);
    if (v37 == CFDataGetTypeID())
    {
      *(_DWORD *)buffer = 0;
      if (CFDataGetLength(v36) == 4)
      {
        v89.location = 0;
        v89.length = 4;
        CFDataGetBytes(v36, v89, buffer);
        if (*(_DWORD *)buffer)
        {
          *((float *)a1 + 53) = (float)*(unsigned int *)buffer / 100.0;
          __int16 v38 = qword_20108;
          if (!qword_20108)
          {
            __int16 v38 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              __int16 v38 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            double v39 = *((float *)a1 + 53);
            *(_DWORD *)__p = 134217984;
            *(double *)&__p[4] = v39;
            _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Setting color algo lambda = %f from EDT\n", __p, 0xCu);
          }
          *((unsigned char *)a1 + 208) = 1;
        }
      }
    }
    CFRelease(v36);
  }
  *(void *)&v83[2] = v40;
  if (v86 < 0) {
    operator delete(v85);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
LABEL_89:
  CFNumberRef v41 = (const __CFNumber *)IOHIDServiceGetProperty();
  if (v41)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v41))
    {
      CFNumberGetValue(v41, kCFNumberIntType, a1 + 15);
      int v43 = a1[15];
      if (v43 == 6) {
        int v43 = 5;
      }
      a1[16] = v43;
    }
  }
  CFNumberRef v44 = (const __CFNumber *)IOHIDServiceGetProperty();
  if (v44)
  {
    CFTypeID v45 = CFNumberGetTypeID();
    if (v45 == CFGetTypeID(v44))
    {
      CFNumberGetValue(v44, kCFNumberFloatType, a1 + 53);
      double v46 = qword_20108;
      if (!qword_20108)
      {
        double v46 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          double v46 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        double v47 = *((float *)a1 + 53);
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v47;
        _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "Setting color algo lambda = %f from EDT\n", buf, 0xCu);
      }
      *((unsigned char *)a1 + 208) = 1;
    }
  }
  CFNumberRef v48 = (const __CFNumber *)IOHIDServiceGetProperty();
  if (v48)
  {
    CFTypeID v49 = CFNumberGetTypeID();
    if (v49 == CFGetTypeID(v48))
    {
      CFNumberGetValue(v48, kCFNumberIntType, a1 + 55);
      *((unsigned char *)a1 + 216) = a1[55] != 0;
      double v50 = qword_20108;
      if (!qword_20108)
      {
        double v50 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          double v50 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        int v51 = a1[55];
        if (*((unsigned char *)a1 + 216)) {
          int v52 = "YES";
        }
        else {
          int v52 = "NO";
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v52;
        __int16 v82 = 1024;
        *(_DWORD *)unsigned __int8 v83 = v51;
        _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "Use channel ratio mitigation - %s, type = %d\n", buf, 0x12u);
      }
    }
  }
  a1[61] = 0;
  CFNumberRef v53 = (const __CFNumber *)IOHIDServiceGetProperty();
  if (v53)
  {
    CFTypeID v54 = CFNumberGetTypeID();
    if (v54 == CFGetTypeID(v53))
    {
      CFNumberGetValue(v53, kCFNumberIntType, a1 + 61);
      __int16 v55 = qword_20108;
      if (!qword_20108)
      {
        __int16 v55 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          __int16 v55 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        int v56 = a1[61];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v56;
        _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "ChipID is 0x%x\n", buf, 8u);
      }
    }
  }
  *((void *)a1 + 31) = 0;
  __int16 v57 = (uint64_t *)(a1 + 62);
  CFNumberRef v58 = (const __CFNumber *)IOHIDServiceGetProperty();
  if (v58)
  {
    CFTypeID v59 = CFNumberGetTypeID();
    if (v59 == CFGetTypeID(v58))
    {
      CFNumberGetValue(v58, kCFNumberLongLongType, a1 + 62);
      long long v60 = qword_20108;
      if (!qword_20108)
      {
        long long v60 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          long long v60 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v61 = *v57;
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v61;
LABEL_132:
        _os_log_impl(&dword_0, v60, OS_LOG_TYPE_DEFAULT, "CFSN is 0x%llx\n", buf, 0xCu);
      }
    }
    else
    {
      CFTypeID v62 = CFDataGetTypeID();
      if (v62 == CFGetTypeID(v58))
      {
        v90.location = 0;
        v90.length = 8;
        CFDataGetBytes(v58, v90, (UInt8 *)a1 + 248);
        long long v60 = qword_20108;
        if (!qword_20108)
        {
          long long v60 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            long long v60 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v63 = *v57;
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v63;
          goto LABEL_132;
        }
      }
    }
  }
  a1[57] = 0;
  CFNumberRef v64 = (const __CFNumber *)IOHIDServiceGetProperty();
  if (v64)
  {
    CFTypeID v65 = CFNumberGetTypeID();
    if (v65 == CFGetTypeID(v64))
    {
      CFNumberGetValue(v64, kCFNumberIntType, a1 + 57);
      long long v66 = qword_20108;
      if (!qword_20108)
      {
        long long v66 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          long long v66 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        int v67 = a1[57];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v67;
        _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "Found sensor type = %d\n", buf, 8u);
      }
    }
  }
  CFBooleanRef v68 = (const __CFBoolean *)IOHIDServiceGetProperty();
  if (v68)
  {
    CFTypeID v69 = CFBooleanGetTypeID();
    if (v69 == CFGetTypeID(v68))
    {
      int Value = CFBooleanGetValue(v68);
      LOBYTE(v68) = Value != 0;
      int64_t v71 = qword_20108;
      if (!qword_20108)
      {
        int64_t v71 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          int64_t v71 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        uint64_t v72 = "Don't use";
        if (Value) {
          uint64_t v72 = "Use";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v72;
        _os_log_impl(&dword_0, v71, OS_LOG_TYPE_INFO, "%s sysconfig calibration to calibrate sensor\n", buf, 0xCu);
      }
    }
    else
    {
      LOBYTE(v68) = 0;
    }
  }
  CFBooleanRef v73 = (const __CFBoolean *)IOHIDServiceGetProperty();
  if (v73)
  {
    CFTypeID v74 = CFBooleanGetTypeID();
    if (v74 == CFGetTypeID(v73))
    {
      *((unsigned char *)a1 + 264) = CFBooleanGetValue(v73) != 0;
      char v75 = qword_20108;
      if (!qword_20108)
      {
        char v75 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          char v75 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        if (*((unsigned char *)a1 + 264)) {
          unsigned __int8 v76 = "";
        }
        else {
          unsigned __int8 v76 = "Don't";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v76;
        _os_log_impl(&dword_0, v75, OS_LOG_TYPE_DEFAULT, "%s look for FDR calibration before trying sysconfig\n", buf, 0xCu);
      }
    }
  }
  ColorSensorPlugIn::loadCalibration((ColorSensorPlugIn *)a1, (char)v68, *((unsigned char *)a1 + 264));
}

void sub_D350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_D660((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_D388(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  *(void *)(a1 + 8) = 0;
  CFStringRef v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 24));
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)(a1 + 16) = v7;
  *(void *)(v2 + *(void *)(v7 - 24)) = v6;
  *(void *)a1 = v8;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_D638(_Unwind_Exception *a1)
{
}

uint64_t sub_D660(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
  return a1;
}

void ColorSensorPlugIn::loadCalibration(ColorSensorPlugIn *this, char a2, char a3)
{
  global_queue = dispatch_get_global_queue(2, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  v7[2] = sub_D87C;
  v7[3] = &unk_1C748;
  v7[4] = this;
  char v8 = a2;
  char v9 = a3;
  dispatch_async(global_queue, v7);
}

const char *calibrationLoadingTypeToString(unsigned int a1)
{
  if (a1 > 5) {
    return "Undefined";
  }
  else {
    return (&off_1C7F0)[a1];
  }
}

const char *calibrationResultToString(unsigned int a1)
{
  if (a1 > 3) {
    return "Undefined";
  }
  else {
    return (&off_1C820)[a1];
  }
}

void sub_D87C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v30 = 0;
  if (get_int_from_bootarg("als_default_calibration", &v30)) {
    BOOL v3 = v30 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (*(unsigned char *)(a1 + 41)) {
        unsigned int v4 = 3;
      }
      else {
        unsigned int v4 = 1;
      }
    }
    else
    {
      CFBooleanRef Property = (const __CFBoolean *)IOHIDServiceGetProperty();
      if (Property != kCFBooleanTrue || Property == 0) {
        unsigned int v4 = 2;
      }
      else {
        unsigned int v4 = 4;
      }
    }
  }
  else
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "boot-args are set to use default calibration", buf, 2u);
    }
    unsigned int v4 = 5;
  }
  char v8 = qword_20108;
  if (!qword_20108)
  {
    char v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      char v8 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = (&off_1C7C8)[v4 - 1];
    *(_DWORD *)buf = 136315138;
    CFDataRef v32 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Use %s calibration type", buf, 0xCu);
  }
  switch(v4)
  {
    case 1u:
      uint64_t v10 = 1;
      if (!ColorSensorPlugIn::processSysConfigCalibration((ColorSensorPlugIn *)v2, 1, 1, 1)) {
        goto LABEL_73;
      }
      *(_DWORD *)(v2 + 240) = 1;
      break;
    case 2u:
      uint64_t v12 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Getting FDR calibration...\n", buf, 2u);
      }
      int FDRCalibration = ColorSensorPlugIn::loadFDRCalibration(v2, 0, (int *)(v2 + 240));
      uint64_t v14 = qword_20108;
      if (!FDRCalibration)
      {
        if (!qword_20108)
        {
          uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v14 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          int v17 = "Failed to load FDR calibration.\n";
          goto LABEL_64;
        }
        goto LABEL_73;
      }
      if (!qword_20108)
      {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v14 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v10 = 2;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "FDR Calibration has been loaded successfully", buf, 2u);
      }
      else
      {
        uint64_t v10 = 2;
      }
      break;
    case 3u:
      int v15 = ColorSensorPlugIn::loadFDRCalibration(v2, 1, (int *)(v2 + 240));
      double v16 = qword_20108;
      if (v15)
      {
        if (!qword_20108)
        {
          double v16 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            double v16 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "FDR Calibration has been loaded successfully", buf, 2u);
        }
      }
      else
      {
        if (!qword_20108)
        {
          double v16 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            double v16 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "FDR Calibration not found: trying sysconfig", buf, 2u);
        }
        if (!ColorSensorPlugIn::processSysConfigCalibration((ColorSensorPlugIn *)v2, 1, 1, 1)) {
          goto LABEL_73;
        }
        *(_DWORD *)(v2 + 240) = 1;
      }
      uint64_t v10 = 3;
      break;
    case 4u:
      if (!ColorSensorPlugIn::processSysConfigCalibration((ColorSensorPlugIn *)v2, 1, 0, 1)) {
        goto LABEL_73;
      }
      *(_DWORD *)(v2 + 240) = 1;
      uint64_t v10 = 4;
      break;
    case 5u:
      uint64_t v14 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v14 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v17 = "Use default calibration.\n";
LABEL_64:
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      }
      goto LABEL_73;
    default:
      int v11 = qword_20108;
      if (!qword_20108)
      {
        int v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          int v11 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_16CC8();
      }
LABEL_73:
      uint64_t v18 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v18 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Switching off color adaptation support.\n", buf, 2u);
      }
      *(_DWORD *)buf = 0;
      CFNumberRef v19 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, buf);
      if (v19)
      {
        CFNumberRef v20 = v19;
        IOHIDServiceSetProperty();
        CFRelease(v20);
      }
      *(unsigned char *)(v2 + 52) = 0;
      BOOL v21 = ColorSensorPlugIn::calibrateSensorWithDefaultCalibration(v2, *(_DWORD *)(v2 + 228));
      *(_DWORD *)(v2 + 240) = 3;
      if (v21) {
        uint64_t v10 = 5;
      }
      else {
        uint64_t v10 = 0;
      }
      break;
  }
  CFNumberRef v22 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (const void *)(v2 + 240));
  if (v22)
  {
    CFNumberRef v23 = v22;
    IOHIDServiceSetProperty();
    CFRelease(v23);
  }
  CFNumberRef v24 = qword_20108;
  if (!qword_20108)
  {
    CFNumberRef v24 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      CFNumberRef v24 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    CFNumberRef v25 = (&off_1C7F0)[v10];
    uint64_t v26 = *(int *)(v2 + 240);
    if (v26 > 3) {
      double v27 = "Undefined";
    }
    else {
      double v27 = (&off_1C820)[v26];
    }
    int v28 = *(_DWORD *)(v2 + 228);
    int v29 = *(unsigned __int8 *)(v2 + 52);
    *(_DWORD *)buf = 136315906;
    CFDataRef v32 = v25;
    __int16 v33 = 2080;
    uint64_t v34 = v27;
    __int16 v35 = 1024;
    int v36 = v28;
    __int16 v37 = 1024;
    int v38 = v29;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Calibration type: %s, result: %s, sensor type: %d, color support: %d", buf, 0x22u);
  }
}

uint64_t ColorSensorPlugIn::processSysConfigCalibration(ColorSensorPlugIn *this, BOOL a2, int a3, int a4)
{
  io_registry_entry_t v5 = *((_DWORD *)this + 8);
  if (!v5) {
    return 0;
  }
  CFTypeRef v8 = IORegistryEntrySearchCFProperty(v5, "IOService", @"alsCalibration", kCFAllocatorDefault, 3u);
  CFTypeRef v9 = IORegistryEntrySearchCFProperty(*((_DWORD *)this + 8), "IOService", @"alsAuxCalibration", kCFAllocatorDefault, 3u);
  if (!v8)
  {
    uint64_t v12 = 0;
    goto LABEL_35;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v8)) {
    goto LABEL_33;
  }
  CFTypeRef v73 = v8;
  if ((unint64_t)CFDataGetLength((CFDataRef)v8) <= 7)
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_16CFC((const __CFData *)v8, inited);
    }
    goto LABEL_33;
  }
  v81.location = 0;
  v81.length = 8;
  CFDataGetBytes((CFDataRef)v8, v81, &buffer);
  unint64_t v66 = 8;
  if (v70 != 1)
  {
    int v15 = qword_20108;
    if (!qword_20108)
    {
      int v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        int v15 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_16EC8();
    }
    goto LABEL_33;
  }
  CFIndex Length = CFDataGetLength((CFDataRef)v8);
  uint64_t v14 = qword_20108;
  if (Length < v72)
  {
    if (!qword_20108)
    {
      uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v14 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_16D8C((const __CFData *)v8, (uint64_t)&v72, v14);
    }
    goto LABEL_33;
  }
  if (!qword_20108)
  {
    uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v14 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    buf[0] = 67109632;
    buf[1] = v70;
    LOWORD(buf[2]) = 1024;
    *(_DWORD *)((char *)&buf[2] + 2) = buffer;
    HIWORD(buf[3]) = 1024;
    uint8_t buf[4] = v72;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "supported calibration version %d,%d with size %d\n", (uint8_t *)buf, 0x14u);
  }
  if (!v71) {
    goto LABEL_33;
  }
  int v16 = 0;
  CFIndex v17 = 8;
  while (1)
  {
    v82.location = v17;
    v82.length = 8;
    CFDataGetBytes((CFDataRef)v8, v82, v67);
    if (*((_DWORD *)this + 9) == v67[2]) {
      break;
    }
    v17 += v68;
    if (++v16 >= v71) {
      goto LABEL_33;
    }
  }
  unint64_t v66 = v17;
  CFNumberRef v19 = qword_20108;
  if (!qword_20108)
  {
    CFNumberRef v19 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      CFNumberRef v19 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v20 = *((_DWORD *)this + 9);
    buf[0] = 67109632;
    buf[1] = v20;
    LOWORD(buf[2]) = 1024;
    *(_DWORD *)((char *)&buf[2] + 2) = v67[0];
    HIWORD(buf[3]) = 1024;
    uint8_t buf[4] = v67[3];
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Found calibration for orientation = %d, senzoruint64_t Type = %d, chipuint64_t Type = %d \n", (uint8_t *)buf, 0x14u);
  }
  if (!a3) {
    goto LABEL_68;
  }
  *(void *)CFTypeID v65 = 0;
  int v21 = *((_DWORD *)this + 57);
  if ((v21 - 1) >= 2)
  {
    if (v21 != 7) {
      goto LABEL_68;
    }
    if (ColorSensorPlugIn::processSysConfigSensorCalibrationVD6286((uint64_t)this))
    {
      CFDataRef v40 = *(CFDataRef *)v65;
      goto LABEL_64;
    }
  }
  else
  {
    memset(v80, 0, 140);
    LOBYTE(v80[1]) = v71;
    *(_DWORD *)bytes_1 = 1;
    *(_WORD *)((char *)&v80[1] + 1) = 145;
    v83.location = v17 + 8;
    UInt8 bytes = 1;
    v83.length = 16;
    CFDataGetBytes((CFDataRef)v8, v83, v57);
    unint64_t v66 = v17 + 24;
    v22.i16[0] = *(_WORD *)v57;
    *(_WORD *)((char *)&v80[1] + 3) = vcvts_n_s32_f32((float)v22.u32[0] * 0.0039062, 0xEuLL);
    int v23 = v58;
    *(_WORD *)((char *)&v80[2] + 1) = v58;
    int v24 = v59;
    *(_WORD *)((char *)&v80[2] + 3) = v59;
    int v25 = v60;
    *(_WORD *)((char *)&v80[3] + 1) = v60;
    if (*((unsigned char *)this + 45)) {
      *((unsigned char *)this + 44) = *((unsigned char *)this + 45);
    }
    *((_DWORD *)this + 20) = 1000 * v23;
    *((_DWORD *)this + 18) = 1000 * v25;
    *((_DWORD *)this + 19) = 1000 * v24;
    v22.i32[0] = v61;
    int v26 = vmovl_u8(v22).u16[3];
    *((_DWORD *)this + 15) = v26;
    *((_DWORD *)this + 16) = v26;
    *(_DWORD *)((char *)&v80[3] + 3) = v22.i32[0];
    HIBYTE(v80[4]) = v62;
    if (v62 == 9)
    {
      v85.length = 22 * v26;
      v85.location = v17 + 24;
      CFDataGetBytes((CFDataRef)v8, v85, (UInt8 *)buf);
      uint64_t v42 = *((unsigned int *)this + 15);
      uint64_t v29 = 22 * v42;
      if (v42)
      {
        uint64_t v43 = 0;
        uint64_t v44 = v62;
        CFTypeID v45 = &buf[1];
        double v46 = (char *)&v80[12] + 2;
        do
        {
          double v47 = (char *)buf + 22 * v43;
          CFNumberRef v48 = &bytes_1[24 * v43 - 1];
          v48[49] = *v47;
          LOWORD(v41) = *(_WORD *)(v47 + 1);
          float v41 = (float)LODWORD(v41) / 1000.0;
          *((_WORD *)v48 + 25) = vcvts_n_s32_f32(v41, 8uLL);
          *((_WORD *)v48 + 26) = 0;
          v48[54] = v47[3];
          uint64_t v49 = v44;
          double v50 = v46;
          int v51 = (unsigned __int16 *)v45;
          if (v44)
          {
            do
            {
              unsigned int v52 = *v51++;
              float v41 = (float)v52 * 0.0039062;
              *v50++ = vcvts_n_s32_f32(v41, 0xEuLL);
              --v49;
            }
            while (v49);
          }
          ++v43;
          CFTypeID v45 = (_DWORD *)((char *)v45 + 22);
          v46 += 24;
        }
        while (v43 != v42);
      }
      goto LABEL_63;
    }
    if (v62 == 8)
    {
      v84.length = 20 * v26;
      v84.location = v17 + 24;
      CFDataGetBytes((CFDataRef)v8, v84, (UInt8 *)buf);
      uint64_t v28 = *((unsigned int *)this + 15);
      uint64_t v29 = 20 * v28;
      if (v28)
      {
        uint64_t v30 = 0;
        uint64_t v31 = v62;
        CFDataRef v32 = (unsigned __int16 *)&buf[1];
        __int16 v33 = (char *)&v80[12] + 2;
        do
        {
          uint64_t v34 = &buf[5 * v30];
          __int16 v35 = &bytes_1[24 * v30 - 1];
          v35[49] = *(unsigned char *)v34;
          LOWORD(v27) = *(_WORD *)((char *)v34 + 1);
          float v27 = (float)LODWORD(v27) / 1000.0;
          *((_WORD *)v35 + 25) = vcvts_n_s32_f32(v27, 8uLL);
          *((_WORD *)v35 + 26) = 0;
          v35[54] = *((unsigned char *)v34 + 3);
          uint64_t v36 = v31;
          __int16 v37 = v33;
          int v38 = v32;
          if (v31)
          {
            do
            {
              unsigned int v39 = *v38++;
              float v27 = (float)v39 * 0.0039062;
              *v37++ = vcvts_n_s32_f32(v27, 0xEuLL);
              --v36;
            }
            while (v36);
          }
          ++v30;
          v32 += 10;
          v33 += 24;
        }
        while (v30 != v28);
      }
LABEL_63:
      v86.location = v29 + v17 + 24;
      v86.length = 3240;
      CFDataGetBytes((CFDataRef)v8, v86, (UInt8 *)buf);
      unint64_t v66 = v17;
      *(int32x4_t *)&v80[5] = vcvtq_n_s32_f32(vdivq_f32(vcvtq_f32_s32(*(int32x4_t *)&buf[1]), (float32x4_t)vdupq_n_s32(0x49742400u)), 0x10uLL);
      *(int32x2_t *)&v80[9] = vshl_n_s32(*(int32x2_t *)v75, 0x10uLL);
      *(void *)uint64_t v63 = 145;
      CFDataRef v40 = CFDataCreate(kCFAllocatorDefault, &bytes, 145);
LABEL_64:
      if (v40)
      {
        if (*((void *)this + 3))
        {
          if (!IOHIDServiceSetProperty())
          {
            int v56 = qword_20108;
            if (!qword_20108)
            {
              int v56 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                int v56 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
              sub_16E94();
            }
            CFRelease(v40);
            goto LABEL_33;
          }
          uint64_t v12 = 1;
        }
        else
        {
          uint64_t v12 = 0;
        }
        CFRelease(v40);
LABEL_69:
        if (!a4) {
          goto LABEL_34;
        }
        if (ColorSensorPlugIn::processCachedDB((uint64_t)this, *((_DWORD *)this + 15), *((_DWORD *)this + 59)))
        {
          CFNumberRef v53 = qword_20108;
          if (!qword_20108)
          {
            CFNumberRef v53 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFNumberRef v53 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "Found cached DB\n", (uint8_t *)buf, 2u);
          }
          uint64_t v12 = 1;
          *((unsigned char *)this + 52) = 1;
          goto LABEL_34;
        }
        uint64_t v77 = 0;
        long long v76 = 0u;
        *(_OWORD *)&v75[4] = 0u;
        *(_OWORD *)buf = *(_OWORD *)((char *)this + 88);
        int v54 = *((_DWORD *)this + 15);
        uint8_t buf[4] = *((_DWORD *)this + 14);
        *(_DWORD *)char v75 = v54;
        if (v54 == 5)
        {
          if (*((_DWORD *)this + 57) == 7) {
            uint64_t v12 = ColorSensorPlugIn::processSysConfigSpectrumVD6286((uint64_t)this);
          }
        }
        else if (v54 == 4)
        {
          *(void *)uint64_t v63 = 0;
          uint64_t v64 = 0;
          v87.location = v17 + 8;
          v87.length = 16;
          CFDataGetBytes((CFDataRef)v8, v87, v63);
          if (BYTE4(v64) == 8)
          {
            unsigned int v55 = 20;
LABEL_93:
            unint64_t v66 = v17 + 24 + v55 * (unint64_t)BYTE3(v64);
            if (buffer) {
              operator new();
            }
            operator new();
          }
          if (BYTE4(v64) == 9)
          {
            unsigned int v55 = 22;
            goto LABEL_93;
          }
        }
        sub_14F44(buf);
        goto LABEL_34;
      }
LABEL_68:
      uint64_t v12 = 0;
      goto LABEL_69;
    }
  }
LABEL_33:
  uint64_t v12 = 0;
LABEL_34:
  CFRelease(v8);
LABEL_35:
  if (v9) {
    CFRelease(v9);
  }
  return v12;
}

void sub_EE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
}

uint64_t ColorSensorPlugIn::loadFDRCalibration(uint64_t a1, char a2, int *a3)
{
  inited = qword_20108;
  if (!qword_20108)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_16F34();
  }
  int v18 = 0;
  if (get_int_from_bootarg("als_calibration_overrides", &v18))
  {
    uint64_t v7 = qword_20108;
    if (!qword_20108)
    {
      uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v18;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Calibration overrides set to %d", buf, 8u);
    }
  }
  if (!*(unsigned char *)(a1 + 256))
  {
    CFDataRef v8 = (const __CFData *)ColorSensorPlugIn::copyFDRCalibrationData(a1, @"HmCA", a3, v18);
    if (!v8)
    {
      CFDataRef v8 = (const __CFData *)ColorSensorPlugIn::copyFDRCalibrationData(a1, @"AlsC", a3, v18);
      if (!v8)
      {
        CFDataRef v8 = (const __CFData *)ColorSensorPlugIn::copyFDRCalibrationData(a1, @"HmCl", a3, v18);
        uint64_t v15 = ColorSensorPlugIn::processFDRCalibration((ColorSensorPlugIn *)a1, v8, a2);
        if (!v8) {
          return v15;
        }
        goto LABEL_26;
      }
    }
LABEL_25:
    uint64_t v15 = ColorSensorPlugIn::processFDRCalibration((ColorSensorPlugIn *)a1, v8, a2);
LABEL_26:
    CFRelease(v8);
    return v15;
  }
  CFDataRef v8 = (const __CFData *)ColorSensorPlugIn::copyFDRCalibrationData(a1, @"HmCM", a3, v18);
  if (v8) {
    goto LABEL_25;
  }
  CFDataRef v8 = (const __CFData *)ColorSensorPlugIn::copyFDRCalibrationData(a1, @"HmCA", a3, v18);
  if (v8) {
    goto LABEL_25;
  }
  int v9 = *(_DWORD *)(a1 + 260);
  *(_DWORD *)(a1 + 260) = v9 + 1;
  if (v9 <= 19)
  {
    uint64_t v10 = qword_20108;
    if (!qword_20108)
    {
      uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v10 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = *(_DWORD *)(a1 + 260);
      *(_DWORD *)buf = 67109120;
      int v20 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Retrieving FDR calibration data failed in attempt number %d/20. Try again in 5 sec.\n", buf, 8u);
    }
    uint64_t v12 = mach_absolute_time();
    dispatch_time_t v13 = dispatch_time(v12, 5000000000);
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_14F34;
    block[3] = &unk_1C7A8;
    block[4] = a1;
    block[5] = a3;
    dispatch_after(v13, global_queue, block);
  }
  return ColorSensorPlugIn::processFDRCalibration((ColorSensorPlugIn *)a1, 0, a2);
}

BOOL ColorSensorPlugIn::calibrateSensorWithDefaultCalibration(uint64_t a1, int a2)
{
  inited = qword_20108;
  if (!qword_20108)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a2;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Calibrate sensor with default calibration data. Sensor type = %d", buf, 8u);
  }
  if ((a2 - 1) <= 1)
  {
    unint64_t v5 = 0;
    memset(&buf[5], 0, 140);
    buf[0] = 1;
    buf[9] = 1;
    *(_DWORD *)&buf[1] = 3;
    *(_DWORD *)(a1 + 60) = 4;
    *(void *)&buf[10] = 0x6400FA40000091;
    strcpy(&buf[18], "c");
    *(_DWORD *)(a1 + 80) = 250000;
    *(void *)(a1 + 72) = 0x186A0000182B8;
    if (*(_DWORD *)(a1 + 232) == 2) {
      char v6 = 6;
    }
    else {
      char v6 = 8;
    }
    if (*(_DWORD *)(a1 + 232) == 2) {
      int v7 = 15040;
    }
    else {
      int v7 = 11658;
    }
    if (a2 == 2)
    {
      char v6 = 8;
      int v8 = 9;
    }
    else
    {
      int v8 = 8;
    }
    buf[20] = v6;
    buf[21] = v8;
    buf[22] = v8;
    buf[24] = v8;
    buf[23] = 4;
    size_t v9 = (2 * v8);
    uint64_t v10 = 55;
    *(_DWORD *)&buf[29] = 0;
    *(_DWORD *)&unsigned char buf[37] = v7;
    do
    {
      int v11 = qword_20108;
      if (!qword_20108)
      {
        int v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          int v11 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v13 = *(_DWORD *)&buf[4 * v5 + 25];
        *(_DWORD *)__int16 v35 = 67109376;
        int v36 = v5;
        __int16 v37 = 1024;
        LODWORD(v38) = v13;
        _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "luxCoeff[%d]=%d/65536", v35, 0xEu);
      }
      memset_pattern16(&buf[v10], &unk_18B90, v9);
      v10 += 24;
      BOOL v12 = v5++ >= 3;
    }
    while (!v12);
    CFAllocatorRef v18 = kCFAllocatorDefault;
    CFIndex v19 = 145;
    goto LABEL_45;
  }
  if ((a2 - 5) <= 1)
  {
    unint64_t v14 = 0;
    memset(&buf[48], 0, 145);
    buf[0] = 1;
    buf[9] = 1;
    *(_DWORD *)(a1 + 224) = 0;
    *(void *)&buf[1] = 3;
    *(void *)(a1 + 60) = 0x500000005;
    *(void *)&buf[10] = 0x6400FA400000C1;
    *(_DWORD *)&buf[18] = 4063331;
    *(_DWORD *)(a1 + 80) = 250000;
    *(void *)(a1 + 72) = 0x186A0000182B8;
    *(_DWORD *)&buf[22] = 134809864;
    *(_WORD *)&buf[26] = 2309;
    uint64_t v15 = 75;
    *(_OWORD *)&buf[28] = xmmword_18B80;
    *(_DWORD *)&buf[44] = 1007478532;
    do
    {
      int v16 = qword_20108;
      if (!qword_20108)
      {
        int v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          int v16 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        float v17 = *(float *)&buf[4 * v14 + 28];
        *(_DWORD *)__int16 v35 = 67109376;
        int v36 = v14;
        __int16 v37 = 2048;
        double v38 = v17;
        _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "luxCoeff[%d]=%f", v35, 0x12u);
      }
      memset_pattern16(&buf[v15], &unk_18B90, 0x12uLL);
      v15 += 25;
      BOOL v12 = v14++ >= 4;
    }
    while (!v12);
LABEL_44:
    CFAllocatorRef v18 = kCFAllocatorDefault;
    CFIndex v19 = 193;
    goto LABEL_45;
  }
  if (a2 == 7)
  {
    unint64_t v20 = 0;
    memset(&buf[48], 0, 145);
    buf[0] = 1;
    buf[9] = 1;
    *(_DWORD *)(a1 + 224) = 0;
    *(void *)&buf[1] = 3;
    *(void *)(a1 + 60) = 0x500000005;
    *(void *)&buf[10] = 0x6400FA400000C1;
    *(_DWORD *)&buf[18] = 4063331;
    *(_DWORD *)(a1 + 80) = 250000;
    *(void *)(a1 + 72) = 0x186A0000182B8;
    *(_DWORD *)&buf[22] = 134809864;
    *(_WORD *)&buf[26] = 2309;
    uint64_t v21 = 75;
    *(_OWORD *)&buf[28] = xmmword_18B80;
    *(_DWORD *)&buf[44] = 1007478532;
    do
    {
      uint8x8_t v22 = qword_20108;
      if (!qword_20108)
      {
        uint8x8_t v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint8x8_t v22 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        float v23 = *(float *)&buf[4 * v20 + 28];
        *(_DWORD *)__int16 v35 = 67109376;
        int v36 = v20;
        __int16 v37 = 2048;
        double v38 = v23;
        _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "luxCoeff[%d]=%f", v35, 0x12u);
      }
      memset_pattern16(&buf[v21], &unk_18B90, 0x12uLL);
      v21 += 25;
      BOOL v12 = v20++ >= 4;
    }
    while (!v12);
    goto LABEL_44;
  }
  if ((a2 - 3) > 1) {
    return 0;
  }
  unint64_t v28 = 0;
  uint64_t v34 = 0;
  memset(&buf[52], 0, 160);
  buf[0] = 1;
  buf[9] = 1;
  *(_DWORD *)(a1 + 224) = 0;
  *(void *)&buf[1] = 3;
  *(void *)(a1 + 60) = 0x500000006;
  *(void *)&buf[10] = 0x6400FA400000DCLL;
  *(_DWORD *)&buf[18] = 4063331;
  *(_DWORD *)(a1 + 80) = 250000;
  *(void *)(a1 + 72) = 0x186A0000182B8;
  *(_DWORD *)&buf[22] = 134809864;
  *(_WORD *)&buf[26] = 2310;
  *(_OWORD *)&buf[28] = xmmword_18B70;
  uint64_t v29 = 82;
  *(int32x2_t *)&buf[44] = vdup_n_s32(0x3DB020C5u);
  do
  {
    uint64_t v30 = qword_20108;
    if (!qword_20108)
    {
      uint64_t v30 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v30 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      float v31 = *(float *)&buf[4 * v28 + 28];
      *(_DWORD *)__int16 v35 = 67109376;
      int v36 = v28;
      __int16 v37 = 2048;
      double v38 = v31;
      _os_log_debug_impl(&dword_0, v30, OS_LOG_TYPE_DEBUG, "luxCoeff[%d]=%f", v35, 0x12u);
    }
    memset_pattern16(&buf[v29], &unk_18B90, 0x12uLL);
    v29 += 24;
    BOOL v12 = v28++ >= 5;
  }
  while (!v12);
  CFAllocatorRef v18 = kCFAllocatorDefault;
  CFIndex v19 = 220;
LABEL_45:
  CFDataRef v24 = CFDataCreate(v18, buf, v19);
  if (!v24) {
    return 0;
  }
  uint64_t v25 = *(void *)(a1 + 24);
  BOOL v26 = v25 != 0;
  if (v25)
  {
    if (IOHIDServiceSetProperty())
    {
      BOOL v26 = 1;
    }
    else
    {
      float v27 = qword_20108;
      if (!qword_20108)
      {
        float v27 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          float v27 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_16E94();
      }
      BOOL v26 = 0;
    }
  }
  CFRelease(v24);
  return v26;
}

uint64_t sub_F9B0(uint64_t a1, int a2, int a3, int a4)
{
  if (!a2) {
    return 0;
  }
  int v5 = a4 == 2 ? 60 : 20;
  float v6 = *(float *)(a1 + 20);
  if (v6 >= (float)v5) {
    return 0;
  }
  int v8 = *(unsigned __int8 *)(a1 + 4);
  float v10 = *(float *)(a1 + 28);
  float v9 = *(float *)(a1 + 32);
  float v12 = *(float *)(a1 + 36);
  float v11 = *(float *)(a1 + 40);
  float v13 = *(float *)(a1 + 44);
  float v14 = *(float *)(a1 + 48);
  if (a2 == 2 && v8 == 6)
  {
    float v15 = v14 - v10;
    if (a3 != 2) {
      float v15 = *(float *)(a1 + 48);
    }
    int v8 = 5;
    if (a3 == 1) {
      float v16 = v14 * 0.5;
    }
    else {
      float v16 = v15;
    }
    if (a3 == 1) {
      int v8 = 5;
    }
    goto LABEL_15;
  }
  if (a3 == 1) {
    float v14 = v14 * 0.5;
  }
  if (a2 == 3 && v9 > 0.0 && (float v19 = (float)(v12 + v11) + v13, v19 > 0.0))
  {
    uint64_t v17 = 0;
    if (v6 >= 10.0) {
      return v17;
    }
    float v18 = v19 / (float)(v9 * 3.0);
    if (v18 > 1.2) {
      return v17;
    }
  }
  else
  {
    if (v8 == 4 && v10 > 0.0)
    {
      uint64_t v17 = 0;
      BOOL v20 = v11 < 50.0 || a4 == 2;
      if (!v20 || v11 <= 0.0) {
        return v17;
      }
      float v21 = (float)(v12 / v11) + (float)((float)(v10 / v11) + (float)(v9 / v11));
      float v22 = 3.0;
    }
    else
    {
      if (v8 != 6 || (v10 > 1.0 ? (BOOL v23 = v10 < 180.0) : (BOOL v23 = 0), !v23))
      {
        float v16 = *(float *)(a1 + 44);
        float v13 = *(float *)(a1 + 40);
        float v11 = *(float *)(a1 + 36);
        float v12 = *(float *)(a1 + 32);
        float v9 = *(float *)(a1 + 28);
LABEL_15:
        uint64_t v17 = 0;
        if (v8 != 5 || v16 <= 1.0) {
          return v17;
        }
        if (v6 >= 10.0 || v11 >= 55.0)
        {
          uint64_t v17 = 0;
          if (v6 <= 10.0 || v11 >= 80.0) {
            return v17;
          }
        }
        float v18 = (float)((float)(v13 / v16) + (float)((float)(v11 / v16) + (float)((float)(v12 / v16) + (float)(v9 / v16))))
            * 0.25;
        if (v18 > 1.5) {
          return 0;
        }
        goto LABEL_48;
      }
      float v21 = (float)((float)((float)((float)(v9 / v10) + (float)(v12 / v10)) + (float)(v11 / v10)) + (float)(v13 / v10))
          + (float)(v14 / v10);
      float v22 = 5.0;
    }
    float v18 = v21 / v22;
    if ((float)(v21 / v22) <= 0.5) {
      return 0;
    }
  }
LABEL_48:
  inited = qword_20108;
  if (!qword_20108)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  uint64_t v17 = 1;
  if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
  {
    double v25 = *(float *)(a1 + 20);
    v27[0] = 67109632;
    v27[1] = a2;
    __int16 v28 = 2048;
    double v29 = v25;
    __int16 v30 = 2048;
    double v31 = v18;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_INFO, "ALS spike detected (type = %d). Lux = %f, Channel ratio = %f", (uint8_t *)v27, 0x1Cu);
  }
  return v17;
}

uint64_t ColorSensorPlugIn::filterCopyEvent(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a1 + 228) & 0xFFFFFFFE) == 8)
  {
    ColorSensorPlugIn::filter(a1, a2, 1);
  }
  else
  {
    if (a2)
    {
      if (IOHIDEventGetType() == 12 && *(unsigned char *)(a1 + 52))
      {
        Integerint Value = IOHIDEventGetIntegerValue();
        if (IntegerValue)
        {
          uint64_t v5 = IntegerValue;
          IOHIDEventGetDoubleValue();
          float v7 = v6;
          IOHIDEventGetDoubleValue();
          float v9 = v8;
          IOHIDEventGetDoubleValue();
          float v11 = v10;
        }
        else
        {
          float v7 = *(float *)(a1 + 136);
          float v9 = *(float *)(a1 + 140);
          float v11 = *(float *)(a1 + 144);
          IOHIDEventSetDoubleValue();
          IOHIDEventSetDoubleValue();
          IOHIDEventSetDoubleValue();
          uint64_t v5 = 1;
          IOHIDEventSetIntegerValue();
        }
        if (*(unsigned char *)(a1 + 176))
        {
          double v13 = *(double *)(a1 + 192);
          if (v13 > 0.0)
          {
            double v14 = *(double *)(a1 + 184);
            double v15 = *(double *)(a1 + 200);
            if (v15 >= 0.0)
            {
              IOHIDEventSetFloatValue();
              IOHIDEventSetDoubleValue();
            }
            else
            {
              IOHIDEventGetDoubleValue();
              double v15 = v16;
            }
            double v17 = v15 / v13;
            float v7 = v14 * (v15 / v13);
            float v9 = v15;
            float v11 = (1.0 - v14 - v13) * v17;
            IOHIDEventSetDoubleValue();
            IOHIDEventSetDoubleValue();
            IOHIDEventSetDoubleValue();
            IOHIDEventSetIntegerValue();
          }
        }
        inited = qword_20108;
        if (!qword_20108)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
        {
          int v20 = 134218752;
          double v21 = v7;
          __int16 v22 = 2048;
          double v23 = v9;
          __int16 v24 = 2048;
          double v25 = v11;
          __int16 v26 = 2048;
          uint64_t v27 = v5;
          _os_log_impl(&dword_0, inited, OS_LOG_TYPE_INFO, "Copy event with color = [%f, %f, %f], color space = %ld", (uint8_t *)&v20, 0x2Au);
        }
      }
    }
    else
    {
      float v12 = qword_20108;
      if (!qword_20108)
      {
        float v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          float v12 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1720C();
      }
    }
    ColorSensorPlugIn::logALSSample(a1, a2, 1);
  }
  return a2;
}

uint64_t ColorSensorPlugIn::processFDRCalibration(ColorSensorPlugIn *this, CFDataRef theData, char a3)
{
  CFDataRef theDataa = theData;
  if (!theData) {
    return 0;
  }
  CFIndex Length = CFDataGetLength(theData);
  inited = qword_20108;
  if (!qword_20108)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = Length;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_INFO, "FDR calibration data length = %ld\n", buf, 0xCu);
  }
  CFTypeRef cf = 0;
  if (Length == 10440)
  {
    BytePtr = CFDataGetBytePtr(theDataa);
    CFDataRef v7 = ColorSensorPlugIn::convertNighthawkHmClv1Tov3((uint64_t)BytePtr);
    if (v7)
    {
      CFRelease(theDataa);
      CFDataRef theDataa = v7;
      CFIndex Length = CFDataGetLength(v7);
      double v8 = qword_20108;
      if (!qword_20108)
      {
        double v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          double v8 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = Length;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "FDR calibration data converted from v1 to v3. New size = %ld\n", buf, 0xCu);
      }
    }
    else
    {
      CFIndex Length = 10440;
    }
  }
  if (sub_135C8(theDataa))
  {
    int v10 = sub_13660((uint64_t)this, &theDataa, (CFDataRef *)&cf);
    float v11 = qword_20108;
    if (!qword_20108)
    {
      float v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        float v11 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "AlsC FDR calibration parsed = %d", buf, 8u);
    }
    goto LABEL_57;
  }
  if (Length > 10235)
  {
    if (Length == 10348)
    {
      int v12 = ColorSensorPlugIn::processFDRCalibrationVD6287_HmClv3(this, &theDataa, (const __CFData **)&cf);
      goto LABEL_56;
    }
    if (Length != 10236) {
      goto LABEL_84;
    }
  }
  else if (Length != 5156)
  {
    if (Length == 9962)
    {
      int v12 = ColorSensorPlugIn::processFDRCalibrationHmCAT2(this, &theDataa, (const __CFData **)&cf);
LABEL_56:
      int v10 = v12;
LABEL_57:
      double v13 = 0;
      goto LABEL_58;
    }
LABEL_84:
    if (VD6287HmCl::match(theDataa, v9))
    {
      int v10 = ColorSensorPlugIn::processFDRCalibrationVD6287_HmClv4(this, &theDataa, (const __CFData **)&cf);
      double v13 = 0;
      *((_DWORD *)this + 59) = 3;
    }
    else
    {
      if (!processFDRCalibrationHmCA10(&theDataa, (const __CFData **)&cf, (unsigned int *)this + 15, *((void *)this + 31)))
      {
        int v10 = 0;
        goto LABEL_57;
      }
      double v13 = 0;
      *((_DWORD *)this + 16) = *((_DWORD *)this + 15);
      *((_DWORD *)this + 12) = 1067869798;
      int v10 = 1;
    }
LABEL_58:
    double v25 = cf;
    if (cf) {
      goto LABEL_59;
    }
LABEL_164:
    float v112 = qword_20108;
    if (!qword_20108)
    {
      float v112 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        float v112 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
      sub_174C0();
    }
    return 0;
  }
  double v13 = CFDataGetBytePtr(theDataa);
  double v14 = qword_20108;
  if (!qword_20108)
  {
    double v14 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      double v14 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = v13[4];
    int v16 = v13[5];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v16;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "HmCl version = v%d.%d\n", buf, 0xEu);
  }
  double v17 = qword_20108;
  if (!qword_20108)
  {
    double v17 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      double v17 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = v13[16];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v18;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Device_id = 0x%x\n", buf, 8u);
  }
  float v19 = qword_20108;
  if (!qword_20108)
  {
    float v19 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      float v19 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_17730();
  }
  int v20 = qword_20108;
  if (!qword_20108)
  {
    int v20 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      int v20 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v21 = v13[74];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Chip_type = %d\n", buf, 8u);
  }
  unsigned int v22 = *((_DWORD *)v13 + 3);
  int v23 = *((_DWORD *)this + 61);
  __int16 v24 = qword_20108;
  if (v22 != v23 && bswap32(v22) != v23)
  {
    if (!qword_20108)
    {
      __int16 v24 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        __int16 v24 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_176A4();
    }
    *((unsigned char *)this + 52) = 0;
    return 0;
  }
  if (!qword_20108)
  {
    __int16 v24 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      __int16 v24 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v33 = *((_DWORD *)this + 61);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v33;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Found calibration for chip with ID = 0x%x\n", buf, 8u);
  }
  int v10 = 0;
  unsigned int v34 = v13[16];
  if (v34 <= 0x22)
  {
    if (v34 != 14 && v34 != 19) {
      goto LABEL_58;
    }
    uint64_t v64 = qword_20108;
    if (!qword_20108)
    {
      uint64_t v64 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v64 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
      sub_17620();
    }
    *((_DWORD *)this + 12) = 1067869798;
    buf[0] = 1;
    buf[9] = 1;
    *(_DWORD *)&buf[1] = 2;
    int v65 = v13[74];
    *((_DWORD *)this + 56) = v65;
    *(_DWORD *)&_DWORD buf[5] = v65;
    *(_WORD *)&buf[10] = 193;
    int v66 = v13[80];
    *((_DWORD *)this + 15) = v66;
    *((_DWORD *)this + 16) = v66;
    *(_WORD *)&unsigned char buf[12] = *((_WORD *)v13 + 47);
    *(_WORD *)&buf[14] = *((_WORD *)v13 + 41);
    *(_WORD *)&buf[16] = *((_WORD *)v13 + 42);
    int v67 = *(unsigned __int16 *)&buf[16];
    *(_WORD *)&buf[18] = *((_WORD *)v13 + 43);
    int v68 = *(unsigned __int16 *)&buf[18];
    *(_WORD *)&buf[20] = *((_WORD *)v13 + 44);
    *((_DWORD *)this + 20) = 1000 * *(unsigned __int16 *)&buf[14];
    *((_DWORD *)this + 18) = 1000 * v68;
    *((_DWORD *)this + 19) = 1000 * v67;
    *(_DWORD *)&buf[22] = *(_DWORD *)(v13 + 90);
    buf[26] = v66;
    buf[27] = v13[81];
    if (v66)
    {
      unint64_t v69 = 0;
      unsigned __int8 v70 = v13 + 96;
      unsigned __int8 v71 = v142;
      do
      {
        unsigned __int16 v72 = &v13[v69 + 76];
        UInt8 v73 = v72[152];
        CFTypeID v74 = &buf[25 * v69];
        uint64_t v75 = (uint64_t)&v13[2 * v69 + 76];
        *(_WORD *)(v74 + 69) = *(_WORD *)(v75 + 140);
        long long v76 = (__int16 *)(v74 + 69);
        *((unsigned char *)v76 - 1) = v73;
        v76[1] = *(_WORD *)(v75 + 128);
        v76[2] = *((char *)v72 + 158);
        uint64_t v77 = (uint64_t)&v13[4 * v69 + 76];
        unsigned __int16 v78 = (float *)&buf[4 * v69];
        v78[7] = (float)*(int *)(v77 + 164) * 0.000015259;
        uint64_t v79 = v78 + 7;
        v79[5] = (float)*(int *)(v77 + 188) * 0.0039062;
        char v80 = qword_20108;
        if (!qword_20108)
        {
          char v80 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            char v80 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          double v85 = *v79;
          double v86 = v79[5];
          int v87 = *v76;
          *(_DWORD *)uint64_t v131 = 136316674;
          *(void *)&long long v132 = "processFDRCalibration";
          WORD4(v132) = 1024;
          *(_DWORD *)((char *)&v132 + 10) = v69;
          HIWORD(v132) = 2048;
          *(double *)v133 = v85;
          *(_WORD *)&v133[8] = 1024;
          *(_DWORD *)&v133[10] = v69;
          __int16 v134 = 2048;
          *(double *)int v135 = v86;
          *(_WORD *)&v135[8] = 1024;
          int v136 = v69;
          __int16 v137 = 1024;
          int v138 = v87;
          _os_log_debug_impl(&dword_0, v80, OS_LOG_TYPE_DEBUG, "%s: luxCoeff[%d]=%f, cctCoeff[%d]=%f, offsetCounts[%d]=%d/255", v131, 0x38u);
        }
        uint64_t v81 = buf[27];
        CFRange v82 = v71;
        CFRange v83 = v70;
        if (buf[27])
        {
          do
          {
            __int16 v84 = *(_WORD *)v83;
            v83 += 2;
            *v82++ = v84;
            --v81;
          }
          while (v81);
        }
        ++v69;
        v70 += 18;
        v71 += 25;
      }
      while (v69 < buf[26]);
    }
    double v25 = CFDataCreate(kCFAllocatorDefault, buf, 193);
    goto LABEL_162;
  }
  if (v34 != 35 && v34 != 58)
  {
    if (v34 != 62) {
      goto LABEL_58;
    }
    *((_DWORD *)this + 12) = 1067030938;
    buf[0] = 1;
    buf[9] = 1;
    *(_DWORD *)&buf[1] = 2;
    int v35 = v13[74];
    *((_DWORD *)this + 56) = v35;
    *(_DWORD *)&_DWORD buf[5] = v35;
    *(_WORD *)&buf[10] = 220;
    int v36 = v13[10];
    int v128 = v36 - 1;
    __int16 v37 = &v13[5080 * v36 - 5080];
    int v38 = v37[80];
    *((_DWORD *)this + 15) = v38;
    *((_DWORD *)this + 16) = v38 - 1;
    *(_WORD *)&unsigned char buf[12] = *((_WORD *)v37 + 47);
    *(void *)&buf[14] = *(void *)(v37 + 82);
    uint64_t v39 = *(void *)&buf[14];
    *((_DWORD *)this + 19) = 1000 * *(unsigned __int16 *)&buf[16];
    *((_DWORD *)this + 20) = 1000 * (unsigned __int16)v39;
    *((_DWORD *)this + 18) = 1000 * WORD2(v39);
    *(_DWORD *)&buf[22] = *(_DWORD *)(v37 + 90);
    buf[26] = v38;
    buf[27] = v37[81];
    if (v35) {
      float v40 = 256.0;
    }
    else {
      float v40 = 65536.0;
    }
    if (v38)
    {
      unint64_t v41 = 0;
      uint64_t v42 = (uint64_t)&v13[5080 * v36 - 4984];
      uint64_t v43 = v143;
      do
      {
        uint64_t v44 = (uint64_t)&v13[5080 * v128 + 76];
        char v45 = *(unsigned char *)(v44 + v41 + 152);
        double v46 = &buf[24 * v41];
        unint64_t v47 = v44 + 2 * v41;
        *(_WORD *)(v46 + 77) = *(_WORD *)(v47 + 140);
        CFNumberRef v48 = (__int16 *)(v46 + 77);
        *((unsigned char *)v48 - 1) = v45;
        v48[1] = *(_WORD *)(v47 + 128);
        *((unsigned char *)v48 + 4) = *(unsigned char *)(v44 + v41 + 158);
        unint64_t v49 = v44 + 4 * v41;
        double v50 = (float *)&buf[4 * v41];
        v50[7] = (float)*(int *)(v49 + 164) * 0.000015259;
        int v51 = v50 + 7;
        v50[13] = (float)*(int *)(v49 + 188) / v40;
        unsigned int v52 = v50 + 13;
        CFNumberRef v53 = qword_20108;
        if (!qword_20108)
        {
          CFNumberRef v53 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            CFNumberRef v53 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          double v58 = *v51;
          double v59 = *v52;
          int v60 = *v48;
          *(_DWORD *)uint64_t v131 = 67110400;
          LODWORD(v132) = v41;
          WORD2(v132) = 2048;
          *(double *)((char *)&v132 + 6) = v58;
          HIWORD(v132) = 1024;
          *(_DWORD *)v133 = v41;
          *(_WORD *)&v133[4] = 2048;
          *(double *)&v133[6] = v59;
          __int16 v134 = 1024;
          *(_DWORD *)int v135 = v41;
          *(_WORD *)&v135[4] = 1024;
          *(_DWORD *)&v135[6] = v60;
          _os_log_debug_impl(&dword_0, v53, OS_LOG_TYPE_DEBUG, "luxCoeff[%d]=%f, cctCoeff[%d]=%f, offsetCounts[%d]=%d/255", v131, 0x2Eu);
        }
        uint64_t v54 = buf[27];
        unsigned int v55 = v43;
        int v56 = (__int16 *)v42;
        if (buf[27])
        {
          do
          {
            __int16 v57 = *v56++;
            *v55++ = v57;
            --v54;
          }
          while (v54);
        }
        ++v41;
        v42 += 18;
        v43 += 24;
      }
      while (v41 < buf[26]);
    }
    double v25 = CFDataCreate(kCFAllocatorDefault, buf, 220);
LABEL_162:
    CFTypeRef cf = v25;
    *((_DWORD *)this + 59) = 2;
    goto LABEL_163;
  }
  *((unsigned char *)this + 44) = 4;
  *((unsigned char *)this + 208) = 1;
  *((_DWORD *)this + 53) = 1008981770;
  buf[0] = 1;
  buf[9] = 1;
  *(_DWORD *)&buf[1] = 2;
  *(_WORD *)&buf[10] = 145;
  int v88 = v13[10];
  int v89 = v88 - 1;
  CFRange v90 = &v13[5080 * v88 - 5080];
  int v91 = v90[80];
  *((_DWORD *)this + 15) = v91;
  *((_DWORD *)this + 16) = v91;
  *(_WORD *)&unsigned char buf[12] = *((_WORD *)v90 + 47);
  *(_WORD *)&buf[14] = *((_WORD *)v90 + 41);
  *(_WORD *)&buf[16] = *((_WORD *)v90 + 42);
  int v92 = *(unsigned __int16 *)&buf[16];
  *(_WORD *)&buf[18] = *((_WORD *)v90 + 43);
  int v93 = *(unsigned __int16 *)&buf[18];
  *((_DWORD *)this + 20) = 1000 * *(unsigned __int16 *)&buf[14];
  *((_DWORD *)this + 18) = 1000 * v93;
  *((_DWORD *)this + 19) = 1000 * v92;
  buf[20] = v90[90];
  *(_WORD *)&buf[21] = *(_WORD *)(v90 + 91);
  buf[23] = v91;
  buf[24] = v90[81];
  if (v91)
  {
    unint64_t v94 = 0;
    uint64_t v95 = (uint64_t)&v13[5080 * v88 - 4984];
    unsigned __int16 v96 = (char *)&v140 + 15;
    do
    {
      uint64_t v97 = (uint64_t)&v13[5080 * v89 + 76];
      char v98 = *(unsigned char *)(v97 + v94 + 152);
      unsigned __int8 v99 = &buf[24 * v94];
      unint64_t v100 = v97 + 2 * v94;
      *((_WORD *)v99 + 25) = *(_WORD *)(v100 + 140);
      uint64_t v101 = (__int16 *)(v99 + 50);
      *((unsigned char *)v101 - 1) = v98;
      v101[1] = *(_WORD *)(v100 + 128);
      *((unsigned char *)v101 + 4) = *(unsigned char *)(v97 + v94 + 158);
      uint64_t v102 = &buf[4 * v94];
      *(_DWORD *)(v102 + 25) = *(_DWORD *)(v97 + 4 * v94 + 164);
      uint64_t v103 = (int *)(v102 + 25);
      uint64_t v104 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v104 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v104 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
      {
        int v109 = *v103;
        int v110 = *v101;
        *(_DWORD *)uint64_t v131 = 67109888;
        LODWORD(v132) = v94;
        WORD2(v132) = 1024;
        *(_DWORD *)((char *)&v132 + 6) = v109;
        WORD5(v132) = 1024;
        HIDWORD(v132) = v94;
        *(_WORD *)v133 = 1024;
        *(_DWORD *)&v133[2] = v110;
        _os_log_debug_impl(&dword_0, v104, OS_LOG_TYPE_DEBUG, "luxCoeff[%d]=%d/65536, offsetCounts[%d]=%d/255", v131, 0x1Au);
      }
      uint64_t v105 = buf[24];
      uint64_t v106 = v96;
      uint64_t v107 = (__int16 *)v95;
      if (buf[24])
      {
        do
        {
          __int16 v108 = *v107++;
          *v106++ = v108;
          --v105;
        }
        while (v105);
      }
      ++v94;
      v95 += 18;
      v96 += 24;
    }
    while (v94 < buf[23]);
  }
  *(void *)((char *)&v140 + 1) = *(void *)&v13[5080 * v89 + 264];
  double v25 = CFDataCreate(kCFAllocatorDefault, buf, 145);
  CFTypeRef cf = v25;
LABEL_163:
  int v10 = 1;
  if (!v25) {
    goto LABEL_164;
  }
LABEL_59:
  if (!*((void *)this + 3)) {
    goto LABEL_62;
  }
  if (!IOHIDServiceSetProperty())
  {
    double v29 = qword_20108;
    if (!qword_20108)
    {
      double v29 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        double v29 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_16E94();
    }
    CFRelease(cf);
    return 0;
  }
  double v25 = cf;
LABEL_62:
  CFRelease(v25);
  if (!v10) {
    goto LABEL_207;
  }
  CFIndex v26 = CFDataGetLength(theDataa);
  if (!ColorSensorPlugIn::processCachedDB((uint64_t)this, *((_DWORD *)this + 16), *((_DWORD *)this + 59)))
  {
    __int16 v30 = qword_20108;
    if (!qword_20108)
    {
      __int16 v30 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        __int16 v30 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v31 = "Cached DB not found.";
      CFDataRef v32 = v30;
LABEL_114:
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    }
LABEL_115:
    uint64_t v141 = 0;
    long long v140 = 0u;
    *(_OWORD *)&buf[24] = 0u;
    *(_OWORD *)buf = *(_OWORD *)((char *)this + 88);
    *(_DWORD *)&buf[16] = *((_DWORD *)this + 14);
    if ((*((_DWORD *)this + 56) - 1) > 1)
    {
      int v62 = *((_DWORD *)this + 15);
      int v61 = v62 - *((_DWORD *)this + 16);
    }
    else
    {
      int v61 = 0;
      int v62 = *((_DWORD *)this + 16);
    }
    *(_DWORD *)&buf[20] = v62;
    *(_DWORD *)&buf[24] = v61;
    if (v13)
    {
      *((_DWORD *)this + 17) = 401;
      operator new[]();
    }
    switch(v26)
    {
      case 10632:
        int v63 = processFDRSpectrumHmCA10(&theDataa);
        break;
      case 10348:
        int v63 = ColorSensorPlugIn::processFDRSpectrumVD6287_HmClv3((uint64_t)this, &theDataa);
        break;
      case 9962:
        int v63 = ColorSensorPlugIn::processFDRSpectrumHmCAT2((uint64_t)this, &theDataa);
        break;
      default:
        CFDataRef v111 = VD6287HmCl::match(theDataa, v28);
        if (v111)
        {
          int v63 = ColorSensorPlugIn::processFDRSpectrumVD6287_HmClv4((uint64_t)v111, &theDataa, (uint64_t)buf);
        }
        else
        {
          if (!sub_135C8(theDataa))
          {
LABEL_198:
            sub_14F44(buf);
            goto LABEL_199;
          }
          int v63 = sub_14B20((uint64_t)this, &theDataa, (uint64_t)buf);
        }
        break;
    }
    if (v63)
    {
      int v114 = LDBMParseBigDB((uint64_t)this + 116, (uint64_t)ProgressCallback, (uint64_t)buf, *((_DWORD *)this + 59));
      v115 = qword_20108;
      if (v114)
      {
        if (!qword_20108)
        {
          v115 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v115 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
          sub_175EC();
        }
      }
      else
      {
        if (!qword_20108)
        {
          v115 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v115 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v131 = 0;
          _os_log_impl(&dword_0, v115, OS_LOG_TYPE_DEFAULT, "Parsed big DB\n", v131, 2u);
        }
        if (*((_DWORD *)this + 60) == 1)
        {
          int v116 = LDBMCreateSmallDB((uint64_t)this + 116, *((void *)this + 11), *((void *)this + 12), *((_DWORD *)this + 9), *((unsigned __int8 *)this + 44), *((_DWORD *)this + 16), *((_DWORD *)this + 61));
          uint64_t v117 = qword_20108;
          if (v116)
          {
            if (!qword_20108)
            {
              uint64_t v117 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v117 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
              sub_16E2C();
            }
          }
          else
          {
            if (!qword_20108)
            {
              uint64_t v117 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v117 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v131 = 0;
              _os_log_impl(&dword_0, v117, OS_LOG_TYPE_DEFAULT, "Small DB has been created\n", v131, 2u);
            }
          }
        }
        if ((*((_DWORD *)this + 15) - 4) <= 2) {
          *((unsigned char *)this + 52) = 1;
        }
      }
    }
    goto LABEL_198;
  }
  uint64_t v27 = qword_20108;
  if (*((_DWORD *)this + 60) != 1)
  {
    if (!qword_20108)
    {
      uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v27 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v31 = "Unmatched calibration => do NOT use cached DB";
      CFDataRef v32 = v27;
      goto LABEL_114;
    }
    goto LABEL_115;
  }
  if (!qword_20108)
  {
    uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v27 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Found cached DB and matched calibration.", buf, 2u);
  }
  if (*((_DWORD *)this + 15) - 7) < 0xFFFFFFFD || (a3) {
    goto LABEL_115;
  }
  *((unsigned char *)this + 52) = 1;
LABEL_199:
  if (*((unsigned char *)this + 208) && *((unsigned char *)this + 52))
  {
    int v118 = qword_20108;
    if (!qword_20108)
    {
      int v118 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        int v118 = init_default_corebrightness_log();
      }
    }
    BOOL v119 = os_log_type_enabled(v118, OS_LOG_TYPE_INFO);
    if (v119)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v118, OS_LOG_TYPE_INFO, "RR normalization", buf, 2u);
    }
    ColorSensorPlugIn::normalizedByEuklidNorm((ColorSensorPlugIn *)v119, *((float **)this + 12), *((_DWORD *)this + 14), *((_DWORD *)this + 16));
    operator new[]();
  }
LABEL_207:
  if (*((unsigned char *)this + 52) && *((void *)this + 3) && *((_DWORD *)this + 57) == 8)
  {
    int v120 = *((_DWORD *)this + 59);
    if (v120 == 3)
    {
      CFDataRef v121 = sub_14E58(*((unsigned int *)this + 15));
    }
    else
    {
      if (v120 != 1)
      {
        int v125 = qword_20108;
        if (!qword_20108)
        {
          int v125 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            int v125 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v125, OS_LOG_TYPE_FAULT)) {
          sub_17534();
        }
        goto LABEL_232;
      }
      CFDataRef v121 = sub_14D7C(*((unsigned int *)this + 15));
    }
    CFDataRef v122 = v121;
    if (v121)
    {
      float v123 = qword_20108;
      if (!qword_20108)
      {
        float v123 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          float v123 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v123, OS_LOG_TYPE_INFO, "Sending Harmony DB to AOP", buf, 2u);
      }
      if (!IOHIDServiceSetProperty())
      {
        float v124 = qword_20108;
        if (!qword_20108)
        {
          float v124 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            float v124 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT)) {
          sub_175AC();
        }
      }
      CFRelease(v122);
      return 1;
    }
LABEL_232:
    uint64_t v126 = qword_20108;
    if (!qword_20108)
    {
      uint64_t v126 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v126 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v126, OS_LOG_TYPE_FAULT)) {
      sub_174F4();
    }
  }
  return 1;
}

void sub_115F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  sub_14F44((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t ColorSensorPlugIn::processCachedDB(uint64_t a1, int a2, int a3)
{
  unsigned __int8 v9 = 0;
  if (!LDBMInitialize(*(_DWORD *)(a1 + 36), a1 + 116, &v9, a3, *(float *)(a1 + 48)))
  {
    int v6 = *(_DWORD *)(a1 + 120);
    *(_DWORD *)(a1 + 56) = v6;
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT)
      {
        inited = init_default_corebrightness_log();
        int v6 = *(_DWORD *)(a1 + 56);
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v11 = v6;
      __int16 v12 = 1024;
      int v13 = a2;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "nSources: %u nChannels: %d\n", buf, 0xEu);
    }
    operator new[]();
  }
  uint64_t v5 = qword_20108;
  if (!qword_20108)
  {
    uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v5 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Database not found!\n", buf, 2u);
  }
  return v9;
}

void ColorSensorPlugIn::normalizedByEuklidNorm(ColorSensorPlugIn *this, float *a2, int a3, int a4)
{
  if (a2 && a3 >= 1)
  {
    uint64_t v5 = a2;
    uint64_t v6 = 0;
    uint64_t v7 = 4 * a3;
    uint64_t v8 = a3;
    uint64_t v9 = a4;
    do
    {
      double v10 = 0.0;
      if (a4 >= 1)
      {
        uint64_t v11 = v9;
        __int16 v12 = v5;
        do
        {
          double v10 = v10 + (float)(*v12 * *v12);
          __int16 v12 = (float *)((char *)v12 + v7);
          --v11;
        }
        while (v11);
      }
      double v13 = sqrt(v10);
      if (v13 != 1.0 && v13 != 0.0)
      {
        inited = qword_20108;
        if (!qword_20108)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v19 = v13;
          _os_log_debug_impl(&dword_0, inited, OS_LOG_TYPE_DEBUG, "Normalization - Euklid norm = %f\n", buf, 0xCu);
        }
        if (a4 >= 1)
        {
          uint64_t v15 = v9;
          int v16 = v5;
          do
          {
            float v17 = *v16 / v13;
            *int v16 = v17;
            int v16 = (float *)((char *)v16 + v7);
            --v15;
          }
          while (v15);
        }
      }
      ++v6;
      ++v5;
    }
    while (v6 != v8);
  }
}

BOOL ColorSensorPlugIn::processSysConfigSensorCalibrationVD6286(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  unsigned int v8 = *(unsigned __int16 *)(v5 + 4) >> 2;
  if (v8 <= 0x40E)
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_177DC();
    }
  }
  else
  {
    uint64_t v9 = v5;
    uint64_t v10 = v4;
    uint64_t v11 = v3;
    __int16 v12 = v2;
    double v13 = (_DWORD *)v1;
    int v33 = v6;
    unsigned int v34 = v7;
    memset(v38, 0, sizeof(v38));
    long long v37 = 0u;
    double v14 = qword_20108;
    if (!qword_20108)
    {
      double v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        double v14 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = *(unsigned __int16 *)(v9 + 4);
      *(_DWORD *)buf = 134218240;
      *(void *)float v40 = 4156;
      *(_WORD *)&v40[8] = 1024;
      int v41 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "ALSCalibrationDataVD6286 size: %lu, calibration data %u.", (uint8_t *)buf, 0x12u);
    }
    v50.location = *v11;
    v50.length = 4156;
    CFDataGetBytes(*v12, v50, (UInt8 *)buf);
    BYTE4(v37) = *(unsigned char *)(v10 + 2);
    int v36 = 1;
    *(_WORD *)((char *)&v37 + 5) = 193;
    UInt8 bytes = 1;
    LOWORD(v16) = *(_WORD *)&v40[4];
    *(_WORD *)((char *)&v37 + 7) = vcvts_n_s32_f32((float)v16 * 0.0039062, 0xEuLL);
    *(_DWORD *)((char *)&v37 + 9) = *(_DWORD *)&v40[6];
    int v17 = *(unsigned __int16 *)&v40[8];
    *(_WORD *)((char *)&v37 + 13) = v41;
    int v18 = (unsigned __int16)v41;
    v13[20] = 1000 * *(unsigned __int16 *)&v40[6];
    v13[18] = 1000 * v18;
    v13[19] = 1000 * v17;
    *(_WORD *)&v38[1] = HIWORD(v41);
    v38[3] = v42;
    uint64_t v19 = v43;
    v13[15] = v43;
    v13[16] = v19;
    v38[5] = v19;
    uint64_t v20 = v44;
    v38[6] = v44;
    *(float32x4_t *)&v38[7] = vdivq_f32(vcvtq_f32_s32(v46), (float32x4_t)vdupq_n_s32(0x49742400u));
    HIWORD(v21) = 18804;
    *(float *)&v38[23] = (float)v47 / 1000000.0;
    *(float32x4_t *)&v38[27] = vcvtq_f32_s32(v48);
    *(float *)&v38[43] = (float)v49;
    if (v19)
    {
      uint64_t v22 = 0;
      int v23 = &v38[62];
      __int16 v24 = &v45;
      do
      {
        double v25 = &buf[7 * v22];
        CFIndex v26 = &bytes + 25 * v22;
        v26[68] = *((unsigned char *)v25 + 24);
        LOWORD(v21) = *(_WORD *)((char *)v25 + 25);
        float v21 = (float)LODWORD(v21) / 1000.0;
        *(_WORD *)(v26 + 69) = vcvts_n_s32_f32(v21, 8uLL);
        *(_WORD *)(v26 + 71) = 0;
        *(_WORD *)(v26 + 73) = *((unsigned __int8 *)v25 + 27);
        *(void *)(v26 + 75) = 0x8000800080008000;
        uint64_t v27 = v20;
        CFDataRef v28 = (unsigned __int16 *)v24;
        double v29 = v23;
        if (v20)
        {
          do
          {
            unsigned int v30 = *v28++;
            float v21 = (float)v30 * 0.0039062;
            *v29++ = vcvts_n_s32_f32(v21, 0xEuLL);
            --v27;
          }
          while (v27);
        }
        ++v22;
        v23 += 25;
        __int16 v24 = (int *)((char *)v24 + 14);
      }
      while (v22 != v19);
    }
    *int v33 = 193;
    CFDataRef *v34 = CFDataCreate(kCFAllocatorDefault, &bytes, 193);
  }
  return v8 > 0x40E;
}

void sub_11E84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = LDBMCreateSmallDB(v1 + 116, *(void *)(v1 + 88), *(void *)(v1 + 96), *(_DWORD *)(v1 + 36), *(unsigned __int8 *)(v1 + 44), *(_DWORD *)(v1 + 60), *(_DWORD *)(v1 + 244));
  inited = qword_20108;
  if (v2)
  {
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_16E2C();
    }
  }
  else
  {
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Small DB has been created\n", v4, 2u);
    }
    *(unsigned char *)(v1 + 52) = 1;
  }
}

uint64_t ColorSensorPlugIn::processSysConfigSpectrumVD6286(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  if (*(unsigned __int16 *)(v4 + 4) >> 2 > 0x40Eu)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v3;
    unsigned int v8 = v2;
    uint64_t v9 = v1;
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
    {
      int v11 = *(unsigned __int16 *)(v6 + 4);
      *(_DWORD *)buf = 134218240;
      uint64_t v15 = 4156;
      __int16 v16 = 1024;
      int v17 = v11;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_INFO, "ALSCalibrationDataVD6286 size: %lu, calibration data %u.", buf, 0x12u);
    }
    v20.location = *v7;
    v20.length = 4156;
    CFDataGetBytes(*v8, v20, buf);
    char v12 = v18;
    if (*(unsigned char *)(v9 + 45)) {
      char v12 = *(unsigned char *)(v9 + 45);
    }
    *(unsigned char *)(v9 + 44) = v12;
    *(_DWORD *)(v9 + 68) = v19;
    operator new[]();
  }
  uint64_t v5 = qword_20108;
  if (!qword_20108)
  {
    uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v5 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_177DC();
  }
  return 0;
}

void sub_123EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = LDBMCreateSmallDB(v1 + 116, *(void *)(v1 + 88), *(void *)(v1 + 96), *(_DWORD *)(v1 + 36), *(unsigned __int8 *)(v1 + 44), *(_DWORD *)(v1 + 60), *(_DWORD *)(v1 + 244));
  inited = qword_20108;
  if (v2)
  {
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_16E2C();
    }
  }
  else
  {
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Small DB has been created\n", v4, 2u);
    }
    *(unsigned char *)(v1 + 52) = 1;
  }
}

const void *ColorSensorPlugIn::copyDataFromCalibrationInstances(ColorSensorPlugIn *this, const __CFString *a2, CFArrayRef theArray, int a4, unsigned __int8 *a5, unsigned __int8 *a6, unint64_t *a7)
{
  int Value = 0;
  if (CFArrayGetCount(theArray) > a4)
  {
    CFComparisonResult v15 = CFStringCompare(a2, @"AlsC", 0);
    CFArrayGetValueAtIndex(theArray, a4);
    if (v15)
    {
      int Value = (const void *)AMFDRSealingMapCopyLocalData();
    }
    else
    {
      CFDictionaryRef v16 = (const __CFDictionary *)AMFDRSealingMapCopyLocalDict();
      if (v16)
      {
        CFDictionaryRef v17 = v16;
        int Value = CFDictionaryGetValue(v16, @"AlsC");
        CFRetain(Value);
        CFRelease(v17);
      }
      else
      {
        int Value = 0;
      }
    }
    if (Value)
    {
      if (CFDataGetLength((CFDataRef)Value) == 5112)
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)Value);
        *a5 = BytePtr[18];
        *a6 = BytePtr[17];
        unint64_t v19 = *((void *)this + 31) & 0xFF0000000000FFFFLL;
        *a7 = v19;
        unint64_t v20 = v19 | ((unint64_t)BytePtr[20] << 48);
        *a7 = v20;
        unint64_t v21 = v20 | ((unint64_t)BytePtr[21] << 40);
        *a7 = v21;
        unint64_t v22 = v21 | ((unint64_t)BytePtr[22] << 32);
        *a7 = v22;
        unint64_t v23 = v22 | ((unint64_t)BytePtr[23] << 24);
        *a7 = v23;
        *a7 = v23 | ((unint64_t)BytePtr[24] << 16);
        inited = qword_20108;
        if (!qword_20108)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *((void *)this + 31);
          uint64_t v26 = *a7;
          *(_DWORD *)buf = 134218240;
          uint64_t v30 = v25;
          __int16 v31 = 2048;
          uint64_t v32 = v26;
          _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "[0x%llx] CFSN = 0x%llx", buf, 0x16u);
        }
      }
      else if (CFDataGetLength((CFDataRef)Value) == 10632)
      {
        uint64_t v27 = CFDataGetBytePtr((CFDataRef)Value);
        *a5 = v27[19];
        *a6 = v27[18];
        *a7 = *(void *)(v27 + 10);
      }
    }
  }
  return Value;
}

CFTypeRef ColorSensorPlugIn::copyFDRCalibrationData(uint64_t a1, const __CFString *a2, int *a3, char a4)
{
  CFErrorRef v57 = 0;
  *a3 = 0;
  unsigned int v7 = a4 & 2;
  unsigned int v8 = a4 & 4;
  uint64_t v9 = &dword_20000;
  if ((a4 & 7) != 0)
  {
    int v10 = a4 & 1;
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)double v59 = v10;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = v7 >> 1;
      *(_WORD *)int v60 = 1024;
      *(_DWORD *)&v60[2] = v8 >> 2;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Calibration overrides: skipSealingMapCopy = %d, skipSealingManifestCopy = %d, useUnmatched = %d", buf, 0x14u);
    }
    AMFDRLogSetHandler();
    if (v10)
    {
      char IsR2RSupported = CBU_IsR2RSupported();
      CFArrayRef v13 = 0;
      char v14 = 1;
      int v15 = 3;
      CFDictionaryRef v16 = "not found";
      if (v7)
      {
        CFTypeRef v17 = 0;
        goto LABEL_108;
      }
      CFTypeRef v17 = 0;
      if ((IsR2RSupported & 1) == 0) {
        goto LABEL_108;
      }
      goto LABEL_17;
    }
  }
  else
  {
    AMFDRLogSetHandler();
  }
  CFArrayRef v13 = (const __CFArray *)AMFDRSealingMapCopyMultiInstanceForClass();
  char v18 = CBU_IsR2RSupported();
  if (v7 || (v18 & 1) == 0) {
    goto LABEL_26;
  }
  if (v13)
  {
    if (CFArrayGetCount(v13) > 0) {
      goto LABEL_27;
    }
    CFRelease(v13);
  }
LABEL_17:
  CFArrayRef v13 = (const __CFArray *)AMFDRSealingManifestCopyMultiInstanceForClass();
  unint64_t v19 = qword_20108;
  if (!qword_20108)
  {
    unint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      unint64_t v19 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 248);
    if (v13) {
      int Count = CFArrayGetCount(v13);
    }
    else {
      int Count = 0;
    }
    *(_DWORD *)buf = 134218498;
    *(void *)double v59 = v20;
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)int v60 = Count;
    *(_WORD *)&v60[4] = 2114;
    *(void *)&v60[6] = a2;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "[0x%llx] AMFDRSealingManifestCopyMultiInstanceForClass found %d instances for key %{public}@.", buf, 0x1Cu);
  }
LABEL_26:
  if (!v13)
  {
    CFTypeRef v17 = 0;
    char v14 = 1;
LABEL_106:
    int v15 = 3;
    CFDictionaryRef v16 = "not found";
LABEL_108:
    *a3 = v15;
    goto LABEL_109;
  }
LABEL_27:
  if (CFArrayGetCount(v13) < 1) {
    goto LABEL_68;
  }
  uint64_t v22 = 0;
  unint64_t v23 = 0;
  CFTypeRef v24 = 0;
  while (1)
  {
    *(_WORD *)int v56 = 0;
    CFErrorRef err = 0;
    if (v23) {
      CFRelease(v23);
    }
    unint64_t v23 = ColorSensorPlugIn::copyDataFromCalibrationInstances((ColorSensorPlugIn *)a1, a2, v13, v22, &v56[1], v56, (unint64_t *)&err);
    if (CFArrayGetCount(v13) < 2)
    {
      if (v23)
      {
        if (v24) {
          CFRelease(v24);
        }
        CFTypeRef v17 = CFRetain(v23);
        goto LABEL_101;
      }
      goto LABEL_56;
    }
    CFErrorRef v25 = err;
    uint64_t v26 = *(__CFError **)(a1 + 248);
    if (v8) {
      break;
    }
    if (err == v26)
    {
      uint64_t v39 = *((void *)v9 + 33);
      if (!v39)
      {
        uint64_t v39 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v39 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = *(void *)(a1 + 248);
        *(_DWORD *)buf = 134218498;
        *(void *)double v59 = v40;
        *(_WORD *)&v59[8] = 2114;
        *(void *)int v60 = a2;
        *(_WORD *)&v60[8] = 2048;
        *(void *)&v60[10] = v25;
        int v41 = "[0x%llx] Found matched %{public}@ CFSN 0x%llx";
        char v42 = v39;
        uint32_t v43 = 32;
        goto LABEL_97;
      }
      goto LABEL_98;
    }
    if (CBU_IsR2RSupported() && *(_DWORD *)(a1 + 40) == v56[0])
    {
      uint64_t v27 = *((void *)v9 + 33);
      if (!v27)
      {
        uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v27 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1 + 248);
        double v29 = "doesn't ";
        if (*(_DWORD *)(a1 + 36) == v56[1]) {
          double v29 = "";
        }
        *(_DWORD *)buf = 134218754;
        *(void *)double v59 = v28;
        *(_WORD *)&v59[8] = 2114;
        *(void *)int v60 = a2;
        *(_WORD *)&v60[8] = 2048;
        *(void *)&v60[10] = v25;
        __int16 v61 = 2080;
        int v62 = v29;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "[0x%llx] %{public}@ CFSN 0x%llx - placement match, orientation %smatch", buf, 0x2Au);
      }
      if (v24)
      {
        uint64_t v9 = &dword_20000;
        if (*(_DWORD *)(a1 + 36) == v56[1])
        {
          CFRelease(v24);
          CFTypeRef v24 = CFRetain(v23);
        }
        goto LABEL_56;
      }
      CFTypeRef v24 = CFRetain(v23);
    }
    else
    {
      uint64_t v30 = *((void *)v9 + 33);
      if (!v30)
      {
        uint64_t v30 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v30 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = *(void *)(a1 + 248);
        *(_DWORD *)buf = 134218498;
        *(void *)double v59 = v31;
        *(_WORD *)&v59[8] = 2114;
        *(void *)int v60 = a2;
        *(_WORD *)&v60[8] = 2048;
        *(void *)&v60[10] = v25;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "[0x%llx] %{public}@ CFSN 0x%llx does not match.", buf, 0x20u);
      }
    }
    uint64_t v9 = &dword_20000;
LABEL_56:
    if (CFArrayGetCount(v13) <= ++v22)
    {
      if (v23) {
        CFRelease(v23);
      }
      if (v24)
      {
        *a3 = 2;
        uint64_t v32 = *((void *)v9 + 33);
        if (!v32)
        {
          uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v32 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = *(void *)(a1 + 248);
          *(_DWORD *)buf = 134217984;
          *(void *)double v59 = v33;
          unsigned int v34 = "[0x%llx] Found valid but NOT matching calibration data.";
          goto LABEL_85;
        }
        goto LABEL_86;
      }
LABEL_68:
      if (CBU_IsR2RSupported())
      {
        CFErrorRef err = 0;
        CFArrayGetValueAtIndex(v13, 0);
        AMFDRSealingMapCopyLocalData();
        if (err && CFErrorGetCode(err))
        {
          int v35 = *((void *)v9 + 33);
          if (!v35)
          {
            int v35 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              int v35 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v36 = *(void *)(a1 + 248);
            *(_DWORD *)buf = 134218498;
            *(void *)double v59 = v36;
            *(_WORD *)&v59[8] = 2112;
            *(void *)int v60 = a2;
            *(_WORD *)&v60[8] = 2112;
            *(void *)&v60[10] = err;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "[0x%llx] Looking for non matching calibration data -> AMFDRSealingMapCopyLocalData (index = 0) for key %@ failed with error %@", buf, 0x20u);
          }
        }
        else
        {
          *a3 = 2;
          uint64_t v32 = *((void *)v9 + 33);
          if (!v32)
          {
            uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v32 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = *(void *)(a1 + 248);
            *(_DWORD *)buf = 134217984;
            *(void *)double v59 = v37;
            unsigned int v34 = "[0x%llx] Found valid but NOT matching calibration data at index 0.";
LABEL_85:
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
          }
        }
      }
LABEL_86:
      CFIndex Length = CFStringGetLength(a2);
      CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      operator new[]();
    }
  }
  if (err == v26) {
    goto LABEL_56;
  }
  *a3 = 2;
  unsigned __int8 v44 = *((void *)v9 + 33);
  if (!v44)
  {
    unsigned __int8 v44 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      unsigned __int8 v44 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = *(void *)(a1 + 248);
    *(_DWORD *)buf = 134217984;
    *(void *)double v59 = v45;
    int v41 = "[0x%llx] Found unmatched calibration data.";
    char v42 = v44;
    uint32_t v43 = 12;
LABEL_97:
    _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
  }
LABEL_98:
  if (v24) {
    CFRelease(v24);
  }
  CFTypeRef v17 = CFRetain(v23);
  if (v23) {
LABEL_101:
  }
    CFRelease(v23);
  char v14 = 0;
  if (!v17) {
    goto LABEL_106;
  }
  if (v8)
  {
    CFDictionaryRef v16 = "found";
    int v15 = 2;
    goto LABEL_108;
  }
  CFDictionaryRef v16 = "found";
  if (*a3 != 2)
  {
    int v15 = 1;
    goto LABEL_108;
  }
LABEL_109:
  if (v57 && CFErrorGetCode(v57))
  {
    int32x4_t v46 = *((void *)v9 + 33);
    if (!v46)
    {
      int32x4_t v46 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        int32x4_t v46 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)double v59 = a2;
      *(_WORD *)&v59[8] = 2112;
      *(void *)int v60 = v57;
      int v47 = "AMFDRSealingMapCopyMultiInstanceForClass for key %@ failed with error %@";
      int32x4_t v48 = v46;
      uint32_t v49 = 22;
      goto LABEL_122;
    }
  }
  else if ((v14 & 1) == 0)
  {
    CFRange v50 = *((void *)v9 + 33);
    if (!v50)
    {
      CFRange v50 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        CFRange v50 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)double v59 = a2;
      int v47 = "AMFDRSealingMapCopyMultiInstanceForClass for key %@ succeeded.";
      int32x4_t v48 = v50;
      uint32_t v49 = 12;
LABEL_122:
      _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
    }
  }
  if (v57)
  {
    CFRelease(v57);
    CFErrorRef v57 = 0;
  }
  if ((v14 & 1) == 0) {
    CFRelease(v13);
  }
  int v51 = *((void *)v9 + 33);
  if (!v51)
  {
    int v51 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      int v51 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v52 = *a3;
    if (v52 > 3) {
      CFNumberRef v53 = "Undefined";
    }
    else {
      CFNumberRef v53 = (&off_1C820)[v52];
    }
    *(_DWORD *)buf = 138543874;
    *(void *)double v59 = a2;
    *(_WORD *)&v59[8] = 2080;
    *(void *)int v60 = v16;
    *(_WORD *)&v60[8] = 2080;
    *(void *)&v60[10] = v53;
    _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "FDR calibration %{public}@ data %s (%s).", buf, 0x20u);
  }
  return v17;
}

void sub_1326C()
{
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_17810();
  }
}

CFDataRef ColorSensorPlugIn::convertNighthawkHmClv1Tov3(uint64_t a1)
{
  __chkstk_darwin(a1);
  uint64_t v2 = v1;
  bzero(v34, 0x281CuLL);
  uint64_t v3 = 0;
  *(void *)UInt8 bytes = *(void *)v2;
  int v27 = *(_DWORD *)(v2 + 8);
  uint64_t v28 = *(void *)(v2 + 12);
  int v29 = *(_DWORD *)(v2 + 20);
  *(_OWORD *)&v31[12] = *(_OWORD *)(v2 + 52);
  *(_OWORD *)uint64_t v31 = *(_OWORD *)(v2 + 40);
  long long v4 = *(_OWORD *)(v2 + 24);
  char v5 = 1;
  uint64_t v32 = *(void *)(v2 + 68);
  int v33 = *(_DWORD *)(v2 + 76);
  long long v30 = v4;
  do
  {
    uint64_t v6 = 0;
    uint64_t v7 = v2 + 5180 * v3;
    unsigned int v8 = &bytes[5134 * v3];
    *((_DWORD *)v8 + 20) = *(_DWORD *)(v7 + 80);
    v8[84] = *(unsigned char *)(v7 + 84);
    *(_WORD *)(v8 + 85) = *(_WORD *)(v7 + 85);
    *(_DWORD *)(v8 + 91) = *(_DWORD *)(v7 + 89);
    *(_WORD *)(v8 + 95) = *(_WORD *)(v7 + 93);
    *(_WORD *)(v8 + 97) = *(_WORD *)(v7 + 99);
    *(_WORD *)(v8 + 99) = *(_WORD *)(v7 + 101);
    char v9 = v5;
    *(_DWORD *)(v8 + 87) = -1;
    long long v10 = *(_OWORD *)(v7 + 103);
    long long v11 = *(_OWORD *)(v7 + 119);
    *(_OWORD *)(v8 + 133) = *(_OWORD *)(v7 + 135);
    *(_OWORD *)(v8 + 117) = v11;
    *(_OWORD *)(v8 + 101) = v10;
    long long v12 = *(_OWORD *)(v7 + 151);
    long long v13 = *(_OWORD *)(v7 + 167);
    long long v14 = *(_OWORD *)(v7 + 183);
    *(_OWORD *)(v8 + 193) = *(_OWORD *)(v7 + 195);
    *(_OWORD *)(v8 + 181) = v14;
    *(_OWORD *)(v8 + 165) = v13;
    *(_OWORD *)(v8 + 149) = v12;
    do
    {
      *(_WORD *)&v34[5134 * v3 + 129 + 2 * v6] = *(char *)(v2 + 217 + 5180 * v3 + v6);
      ++v6;
    }
    while (v6 != 6);
    uint64_t v15 = v2 + 5180 * v3;
    CFDictionaryRef v16 = &bytes[5134 * v3];
    *(void *)(v16 + 221) = *(void *)(v15 + 223);
    *(_DWORD *)(v16 + 229) = *(_DWORD *)(v15 + 231);
    *(_OWORD *)(v16 + 233) = *(_OWORD *)(v15 + 235);
    *(void *)(v16 + 249) = *(void *)(v15 + 251);
    *(_OWORD *)(v16 + 257) = *(_OWORD *)(v15 + 259);
    *(void *)(v16 + 273) = *(void *)(v15 + 275);
    *(_DWORD *)(v16 + 281) = *(_DWORD *)(v15 + 283);
    *(void *)(v16 + 301) = *(void *)(v15 + 303);
    *(_OWORD *)(v16 + 285) = *(_OWORD *)(v15 + 287);
    *(_WORD *)(v16 + 309) = *(_WORD *)(v15 + 311);
    *(_DWORD *)(v16 + 311) = *(_DWORD *)(v15 + 313);
    v16[315] = *(unsigned char *)(v15 + 317);
    memcpy(v16 + 318, (const void *)(v15 + 319), 0x12D0uLL);
    LOWORD(v17) = *(unsigned __int8 *)(v15 + 5135) + 1;
    v16[5134] = *(unsigned char *)(v15 + 5135) + 1;
    *(void *)(v16 + 5137) = *(void *)(v15 + 5136);
    uint64_t v18 = *(void *)(v15 + 5144);
    *(void *)(v16 + 5151) = v18;
    *(_WORD *)(v16 + 5149) = v18;
    if ((v17 & 0x100) == 0)
    {
      uint64_t v17 = v17;
      __int16 v19 = *(_WORD *)(v2 + 5180 * v3 + 5153);
      char v20 = *(unsigned char *)(v2 + 5180 * v3 + 5152);
      __int16 v21 = *(_WORD *)(v2 + 5180 * v3 + 5157);
      __int16 v22 = *(_WORD *)(v2 + 5180 * v3 + 5155);
      unint64_t v23 = &v34[5134 * v3 + 5118];
      CFTypeRef v24 = &v34[5134 * v3 + 5097];
      do
      {
        *(_WORD *)((char *)v23 - 35) = v19;
        *v24++ = v20;
        *(v23 - 7) = v21;
        *v23++ = v22;
        --v17;
      }
      while (v17);
    }
    char v5 = 0;
    v34[5134 * v3 + 5132] = *(unsigned char *)(v2 + 5180 * v3 + 5159);
    uint64_t v3 = 1;
  }
  while ((v9 & 1) != 0);
  return CFDataCreate(kCFAllocatorDefault, bytes, 10348);
}

CFDataRef sub_135C8(const __CFData *result)
{
  if (result)
  {
    CFDataRef v1 = result;
    BytePtr = CFDataGetBytePtr(result);
    unint64_t Length = CFDataGetLength(v1);
    double result = 0;
    if (BytePtr)
    {
      if (Length >> 3 >= 0x27F)
      {
        if (*(_DWORD *)BytePtr == 1097626435 && BytePtr[4] == 1 && !BytePtr[5] && BytePtr[16] == 35) {
          return (const __CFData *)(BytePtr[11] == 32);
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

BOOL sub_13660(uint64_t a1, const __CFData **a2, CFDataRef *a3)
{
  char v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  BOOL v5 = sub_1543C(*a2, (uint64_t)&v11);
  if (v5)
  {
    *a3 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&v11, 145);
    *(unsigned char *)(a1 + 44) = 4;
    *(unsigned char *)(a1 + 208) = 1;
    *(_DWORD *)(a1 + 212) = 1008981770;
    int v6 = BYTE7(v12);
    *(_DWORD *)(a1 + 60) = BYTE7(v12);
    *(_DWORD *)(a1 + 64) = v6;
    int v7 = 1000 * HIWORD(v11);
    int v8 = 1000 * WORD1(v12);
    *(_DWORD *)(a1 + 76) = 1000 * (unsigned __int16)v12;
    *(_DWORD *)(a1 + 80) = v7;
    *(_DWORD *)(a1 + 72) = v8;
    *(_DWORD *)(a1 + 48) = 1067869798;
  }
  else
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_17878();
    }
  }
  return v5;
}

uint64_t ColorSensorPlugIn::processFDRCalibrationHmCAT2(ColorSensorPlugIn *this, const __CFData **a2, const __CFData **a3)
{
  CFIndex Length = CFDataGetLength(*a2);
  inited = qword_20108;
  if (!qword_20108)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = Length;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "FDR calibration data length = %ld\n", buf, 0xCu);
  }
  if (Length == 9962)
  {
    BytePtr = CFDataGetBytePtr(*a2);
    char v9 = qword_20108;
    if (!qword_20108)
    {
      char v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        char v9 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = BytePtr[4];
      int v11 = BytePtr[5];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "HmCA version = v%d.%d\n", buf, 0xEu);
    }
    long long v12 = qword_20108;
    if (!qword_20108)
    {
      long long v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        long long v12 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = BytePtr[28];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Device_id = 0x%x\n", buf, 8u);
    }
    *(void *)__str = *((void *)BytePtr + 2);
    char v78 = 0;
    unsigned int v14 = strtoul(__str, 0, 16);
    long long v15 = qword_20108;
    if (!qword_20108)
    {
      long long v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        long long v15 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Chip_id is 0x%08X", buf, 8u);
    }
    unsigned int v16 = bswap32(v14);
    int v17 = *((_DWORD *)this + 61);
    BOOL v18 = v17 == v14 || v16 == v17;
    uint64_t v19 = v18;
    if (v18)
    {
      CFNumberRef v53 = a3;
      memset(&buf[5], 0, 32);
      memset(v76, 0, 124);
      long long v75 = 0u;
      long long v74 = 0u;
      *((_DWORD *)this + 12) = 1067869798;
      buf[0] = 1;
      buf[9] = 1;
      *(_DWORD *)&buf[1] = 2;
      *(_WORD *)&buf[10] = 193;
      unsigned int v20 = BytePtr[80];
      *((_DWORD *)this + 15) = v20;
      *((_DWORD *)this + 16) = v20;
      unsigned __int16 v21 = *((_WORD *)BytePtr + 41);
      *(_WORD *)&unsigned char buf[12] = v21;
      if (BytePtr[5] + 10 * BytePtr[4] <= 0x10)
      {
        unsigned int v26 = BytePtr[81];
        int v23 = 150;
        unsigned __int8 v27 = 6;
      }
      else
      {
        int v22 = *((__int16 *)BytePtr + 142);
        int v23 = *((unsigned __int16 *)BytePtr + 142);
        if (MGGetProductType() == 376943508 && BytePtr[4] == 1 && BytePtr[5] == 7)
        {
          CFTypeRef v24 = BytePtr;
          CFErrorRef v25 = qword_20108;
          if (!qword_20108)
          {
            CFErrorRef v25 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFErrorRef v25 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_178AC(v21, v22, v25);
          }
          *(_WORD *)&unsigned char buf[12] = 19660;
          int v23 = 250;
          BytePtr = v24;
        }
        unsigned int v26 = BytePtr[81];
        unsigned __int8 v27 = BytePtr[282] - v26 + 9;
        unsigned int v20 = BytePtr[80];
      }
      *(_WORD *)&buf[14] = v23;
      *(_DWORD *)&buf[16] = 6488164;
      strcpy(&buf[20], ">");
      *((_DWORD *)this + 20) = 1000 * v23;
      *((void *)this + 9) = 0x186A0000182B8;
      *(_DWORD *)&buf[22] = 16843009 * v27;
      buf[26] = v20;
      buf[27] = v26;
      uint64_t v31 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v31 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v55 = 136315650;
        int v56 = "processFDRCalibrationHmCAT2";
        __int16 v57 = 1024;
        int v58 = v20;
        __int16 v59 = 1024;
        LODWORD(v60) = v26;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "%s: nChannels = %d, nGains = %d", v55, 0x18u);
      }
      unsigned int v52 = v19;
      uint64_t v32 = qword_20108;
      if (!qword_20108)
      {
        uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v32 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v55 = 136315650;
        int v56 = "processFDRCalibrationHmCAT2";
        __int16 v57 = 1024;
        int v58 = v27;
        __int16 v59 = 1024;
        LODWORD(v60) = v23;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%s: gain = %d, iTime = %d", v55, 0x18u);
      }
      if (v20)
      {
        unint64_t v33 = 0;
        unint64_t v54 = v20;
        unsigned int v34 = &v76[14];
        int v35 = BytePtr + 84;
        do
        {
          uint64_t v36 = BytePtr;
          uint64_t v37 = BytePtr + 76;
          int v38 = (char)BytePtr[v33 + 216];
          uint64_t v39 = &buf[25 * v33];
          v39[68] = v38;
          uint64_t v40 = &v37[2 * v33];
          int v41 = *((__int16 *)v40 + 64);
          *(_WORD *)(v39 + 69) = *((_WORD *)v40 + 64);
          *(_WORD *)(v39 + 71) = *((_WORD *)v40 + 58);
          *(_WORD *)(v39 + 73) = *((_WORD *)v40 + 73);
          char v42 = &v37[4 * v33];
          float v43 = (float)*(int *)(v42 + 158) * 4.6566e-10;
          unsigned __int8 v44 = (float *)&buf[4 * v33];
          v44[7] = v43;
          float v45 = (float)*(int *)(v42 + 182) * 0.000061035;
          v44[12] = v45;
          int32x4_t v46 = qword_20108;
          if (!qword_20108)
          {
            int32x4_t v46 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              int32x4_t v46 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)unsigned int v55 = 136317186;
            int v56 = "processFDRCalibrationHmCAT2";
            __int16 v57 = 1024;
            int v58 = v33;
            __int16 v59 = 2048;
            double v60 = v43;
            __int16 v61 = 1024;
            int v62 = v33;
            __int16 v63 = 2048;
            double v64 = v45;
            __int16 v65 = 1024;
            int v66 = v33;
            __int16 v67 = 1024;
            int v68 = v41;
            __int16 v69 = 1024;
            int v70 = v33;
            __int16 v71 = 1024;
            int v72 = v38;
            _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "%s: luxCoeff[%d]=%f, cctCoeff[%d]=%f, offsetCounts[%d]=%d/255 darkCounts[%d] = %d", v55, 0x44u);
          }
          *(void *)&v76[25 * v33 + 6] = 0x8000800080008000;
          uint64_t v47 = v26;
          int32x4_t v48 = v35;
          uint32_t v49 = v34;
          if (v26)
          {
            do
            {
              __int16 v50 = *(_WORD *)v48;
              v48 += 2;
              *(_WORD *)uint32_t v49 = v50;
              v49 += 2;
              --v47;
            }
            while (v47);
          }
          ++v33;
          v34 += 25;
          v35 += 18;
          BytePtr = v36;
        }
        while (v33 < v54);
      }
      *CFNumberRef v53 = CFDataCreate(kCFAllocatorDefault, buf, 193);
      return v52;
    }
    else
    {
      int v29 = qword_20108;
      if (!qword_20108)
      {
        int v29 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          int v29 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v30 = *((_DWORD *)this + 61);
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v14;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v16;
        _os_log_error_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "Chip ID doesn't match - (device chip ID 0x%08X != calibration chip ID 0x%08X and chip_id_reversed 0x%08X)", buf, 0x14u);
      }
    }
  }
  else
  {
    uint64_t v28 = qword_20108;
    if (!qword_20108)
    {
      uint64_t v28 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v28 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1794C();
    }
    return 0;
  }
  return v19;
}

BOOL ColorSensorPlugIn::processFDRCalibrationVD6287_HmClv3(ColorSensorPlugIn *this, const __CFData **a2, const __CFData **a3)
{
  if (CFDataGetLength(*a2) != 10348)
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    BOOL result = os_log_type_enabled(inited, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_17A88();
    return 0;
  }
  BytePtr = CFDataGetBytePtr(*a2);
  int v7 = BytePtr + 10;
  if (BytePtr[10] != 2)
  {
    int32x4_t v46 = qword_20108;
    if (!qword_20108)
    {
      int32x4_t v46 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        int32x4_t v46 = init_default_corebrightness_log();
      }
    }
    BOOL result = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_17A1C();
    return 0;
  }
  int v8 = BytePtr;
  if (BytePtr[80] || BytePtr[5214] != 1)
  {
    uint64_t v47 = qword_20108;
    if (!qword_20108)
    {
      uint64_t v47 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v47 = init_default_corebrightness_log();
      }
    }
    BOOL result = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_179E8();
    return 0;
  }
  if (BytePtr[84] == 5 && BytePtr[5218] == 5 && BytePtr[85] == 7 && BytePtr[5219] == 7)
  {
    char v9 = qword_20108;
    if (!qword_20108)
    {
      char v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        char v9 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v8[4];
      int v11 = v8[5];
      v49[0] = 67109376;
      v49[1] = v10;
      __int16 v50 = 1024;
      int v51 = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "HmCl calibration version = v%d.%d\n", (uint8_t *)v49, 0xEu);
    }
    *(void *)((char *)this + 60) = 0x500000005;
    *((_DWORD *)this + 20) = 50000;
    *((int32x2_t *)this + 9) = vdup_n_s32(0xC350u);
    *((_DWORD *)this + 12) = 1067869798;
    bzero(v49, 0x3ECuLL);
    unint64_t v13 = *v7;
    if (*v7)
    {
      unint64_t v14 = 0;
      long long v15 = (float *)v52;
      unsigned int v16 = v8 + 101;
      int v17 = v8 + 5198;
      BOOL v18 = v8 + 5177;
      uint64_t v19 = v49;
      do
      {
        uint64_t v20 = 0;
        unsigned __int16 v21 = &v8[5134 * v14];
        int v22 = (char *)v49 + 502 * v14;
        *int v22 = v21[84];
        v22[2] = v21[86] + 2;
        *(_DWORD *)(v22 + 3) = *(_DWORD *)(v21 + 87);
        LOWORD(v12) = *(_WORD *)(v21 + 97);
        double v23 = (double)*(unint64_t *)&v12 / 100.0;
        *(float *)&double v23 = v23;
        *(_DWORD *)(v22 + 7) = LODWORD(v23);
        LOWORD(v23) = *(_WORD *)(v21 + 99);
        *(float *)&double v23 = (double)*(unint64_t *)&v23 * 0.0000610351562;
        *(_DWORD *)(v22 + 19) = LODWORD(v23);
        uint64_t v24 = v21[85];
        CFErrorRef v25 = (unsigned __int16 *)v16;
        unsigned int v26 = v15;
        do
        {
          unsigned __int8 v27 = (char *)v49 + 502 * v14 + 40 * v20;
          *(void *)(v27 + 23) = 0x400000003F800000;
          *(_DWORD *)(v27 + 31) = 1082130432;
          if (v24)
          {
            float v28 = 4.0;
            uint64_t v29 = v24;
            int v30 = v25;
            uint64_t v31 = v26;
            do
            {
              unsigned int v32 = *v30++;
              float v28 = (double)v32 * 0.0000610351562 * v28;
              *v31++ = v28;
              --v29;
            }
            while (v29);
          }
          uint64_t v33 = (uint64_t)&v8[5134 * v14 + 80];
          uint64_t v34 = v33 + 2 * v20;
          int v35 = (char *)v49 + 502 * v14 + 4 * v20;
          *(float *)(v35 + 223) = (float)*(__int16 *)(v34 + 129);
          double v12 = (double)*(__int16 *)(v34 + 141) * 0.0000610351562;
          *(float *)&double v12 = v12;
          *(_DWORD *)(v35 + 243) = LODWORD(v12);
          uint64_t v36 = v33 + 4 * v20;
          *(float *)(v35 + 263) = (float)*(int *)(v36 + 153) * 0.000015259;
          *(float *)(v35 + 283) = (float)*(int *)(v36 + 177) * 0.0039062;
          *(float *)(v35 + 307) = (float)*(unsigned int *)(v36 + 205) * 0.000015259;
          ++v20;
          v26 += 10;
          v25 += 9;
        }
        while (v20 != 5);
        uint64_t v37 = &v8[5134 * v14];
        *(float *)&double v12 = (float)*(unsigned int *)(v37 + 281) * 0.000015259;
        int v38 = (char *)v49 + 502 * v14;
        *(_DWORD *)(v38 + 303) = LODWORD(v12);
        unint64_t v39 = v37[5134];
        v38[420] = v39;
        if (v39)
        {
          uint64_t v40 = 0;
          for (unint64_t i = 0; i < v39; ++i)
          {
            char v42 = (char *)v19 + v40;
            *(_WORD *)((char *)v19 + v40 + 425) = *(_WORD *)&v17[v40 - 63];
            float v43 = (char *)v19 + 2 * i;
            *(_WORD *)(v43 + 439) = *(_WORD *)&v17[v40 - 49];
            *(_WORD *)(v43 + 453) = *(_WORD *)&v17[v40 - 35];
            *((unsigned char *)v19 + i + 467) = v18[i] + 2;
            *((_WORD *)v42 + 237) = *(_WORD *)&v17[v40 - 14];
            *((_WORD *)v42 + 244) = *(_WORD *)&v17[v40];
            v40 += 2;
          }
        }
        ++v14;
        long long v15 = (float *)((char *)v15 + 502);
        v16 += 5134;
        uint64_t v19 = (_DWORD *)((char *)v19 + 502);
        v17 += 5134;
        v18 += 5134;
      }
      while (v14 < v13);
    }
    *a3 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v49, 1004);
    *((_DWORD *)this + 57) = 8;
    return 1;
  }
  int32x4_t v48 = qword_20108;
  if (!qword_20108)
  {
    int32x4_t v48 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      int32x4_t v48 = init_default_corebrightness_log();
    }
  }
  BOOL result = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_179B4();
    return 0;
  }
  return result;
}

uint64_t ColorSensorPlugIn::processFDRCalibrationVD6287_HmClv4(ColorSensorPlugIn *this, const __CFData **a2, const __CFData **a3)
{
  bzero(bytes, 0x3ECuLL);
  uint64_t v6 = VD6287HmCl::process(*a2, (uint64_t)bytes, 0);
  if (v6)
  {
    *a3 = CFDataCreate(kCFAllocatorDefault, bytes, 1004);
    *(void *)((char *)this + 60) = 0x500000005;
    *((_DWORD *)this + 20) = 50000;
    *((int32x2_t *)this + 9) = vdup_n_s32(0xC350u);
    *((_DWORD *)this + 12) = 1067869798;
  }
  else
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_17878();
    }
  }
  return v6;
}

BOOL ColorSensorPlugIn::processFDRSpectrumHmCAT2(uint64_t a1, CFDataRef *a2)
{
  inited = qword_20108;
  if (!qword_20108)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Process FDR calibration spectrum", (uint8_t *)&v8, 2u);
  }
  CFIndex Length = CFDataGetLength(*a2);
  if (Length == 9962)
  {
    CFDataGetBytePtr(*a2);
    *(_DWORD *)(a1 + 68) = 401;
    operator new[]();
  }
  uint64_t v6 = qword_20108;
  if (!qword_20108)
  {
    uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v6 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_17B04();
  }
  return Length == 9962;
}

BOOL ColorSensorPlugIn::processFDRSpectrumVD6287_HmClv3(uint64_t a1, CFDataRef *a2)
{
  inited = qword_20108;
  if (!qword_20108)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "Process FDR calibration spectrum", (uint8_t *)&v8, 2u);
  }
  CFIndex Length = CFDataGetLength(*a2);
  if (Length == 10348)
  {
    CFDataGetBytePtr(*a2);
    *(_DWORD *)(a1 + 68) = 401;
    operator new[]();
  }
  uint64_t v6 = qword_20108;
  if (!qword_20108)
  {
    uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v6 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_17B6C();
  }
  return Length == 10348;
}

uint64_t ColorSensorPlugIn::processFDRSpectrumVD6287_HmClv4(uint64_t a1, const __CFData **a2, uint64_t a3)
{
  bzero(v8, 0x3ECuLL);
  uint64_t v5 = VD6287HmCl::process(*a2, (uint64_t)v8, a3);
  if (v5)
  {
    *(unsigned char *)(a3 + 28) = 0;
    *(_DWORD *)(a3 + 32) = 1065353216;
  }
  else
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_17BD4();
    }
  }
  return v5;
}

uint64_t sub_14B20(uint64_t a1, const __CFData **a2, uint64_t a3)
{
  char v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t v4 = sub_15728(*a2, (uint64_t)v7);
  if (v4)
  {
    *(unsigned char *)(a3 + 28) = 0;
    *(_DWORD *)(a3 + 32) = 1065353216;
  }
  else
  {
    inited = qword_20108;
    if (!qword_20108)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_17BD4();
    }
  }
  return v4;
}

void ColorSensorPlugIn::calculateSTD(ColorSensorPlugIn *this, float *a2, float *a3, int a4, int a5)
{
  if (a2 && a3 && a4 && a5 >= 1)
  {
    int v7 = a2;
    uint64_t v8 = 0;
    double v9 = (double)a4;
    uint64_t v10 = a5;
    uint64_t v11 = 4 * a4;
    do
    {
      double v12 = 0.0;
      if (a4 >= 1)
      {
        uint64_t v13 = a4;
        unint64_t v14 = v7;
        do
        {
          float v15 = *v14++;
          double v12 = v12 + v15;
          --v13;
        }
        while (v13);
        float v16 = v12 / v9;
        double v12 = 0.0;
        do
        {
          double v12 = v12 + (float)((float)(*(float *)((char *)v7 + v13) - v16) * (float)(*(float *)((char *)v7 + v13) - v16));
          v13 += 4;
        }
        while (v11 != v13);
      }
      float v17 = v12 / v9;
      a3[v8] = sqrtf(v17);
      inited = qword_20108;
      if (!qword_20108)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
      {
        double v19 = a3[v8];
        *(_DWORD *)buf = 67109376;
        int v21 = v8;
        __int16 v22 = 2048;
        double v23 = v19;
        _os_log_debug_impl(&dword_0, inited, OS_LOG_TYPE_DEBUG, "Standard deviation[%d]: %f\n", buf, 0x12u);
      }
      ++v8;
      v7 += a4;
    }
    while (v8 != v10);
  }
}

CFDataRef sub_14D7C(uint64_t a1)
{
  int v1 = __chkstk_darwin(a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  int v7 = v6;
  int v8 = v1;
  bzero(v12, 0x6E00uLL);
  CFDataRef result = 0;
  UInt8 bytes = v8;
  __int16 v11 = v7;
  if ((v7 * v8) <= 0x1130 && (3 * v7) <= 0xA50)
  {
    memcpy(&v13, v5, 4 * (v7 * v8));
    memcpy(v12, v3, 4 * (3 * v7));
    return CFDataCreate(kCFAllocatorDefault, &bytes, 28163);
  }
  return result;
}

CFDataRef sub_14E58(uint64_t a1)
{
  int v1 = __chkstk_darwin(a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  int v7 = v6;
  int v8 = v1;
  bzero(v12, 0x8360uLL);
  CFDataRef result = 0;
  UInt8 bytes = v8;
  __int16 v11 = v7;
  if ((v7 * v8) >> 3 <= 0x290 && (3 * v7) <= 0xC51)
  {
    memcpy(&v13, v5, 4 * (v7 * v8));
    memcpy(v12, v3, 4 * (3 * v7));
    return CFDataCreate(kCFAllocatorDefault, &bytes, 33635);
  }
  return result;
}

uint64_t sub_14F34(uint64_t a1)
{
  return ColorSensorPlugIn::loadFDRCalibration(*(void *)(a1 + 32), 0, *(void *)(a1 + 40));
}

void *sub_14F44(void *result)
{
  if (result[5]) {
    operator delete[]();
  }
  if (result[6]) {
    operator delete[]();
  }
  if (result[7]) {
    operator delete[]();
  }
  return result;
}

void *sub_14FBC(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v13)
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_15160(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_150F8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x150D8);
}

void sub_1514C(_Unwind_Exception *a1)
{
}

uint64_t sub_15160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      sub_152E8(__p, v12, __c);
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_152CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_152E8(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_15394();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_15394()
{
}

void sub_153AC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_15408(exception, a1);
}

void sub_153F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_15408(std::logic_error *a1, const char *a2)
{
  CFDataRef result = std::logic_error::logic_error(a1, a2);
  return result;
}

BOOL sub_1543C(const __CFData *a1, uint64_t a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  if (!BytePtr) {
    return 0;
  }
  uint64_t v5 = (uint64_t)BytePtr;
  if (!sub_135C8(a1)) {
    return 0;
  }

  return sub_154AC(v5, a2);
}

BOOL sub_154AC(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 36);
  if (v2 == 4)
  {
    unint64_t v4 = 0;
    unint64_t v21 = ((unint64_t)*(unsigned __int8 *)(a1 + 20) << 32) | ((unint64_t)*(unsigned __int8 *)(a1 + 21) << 24) | ((unint64_t)*(unsigned __int8 *)(a1 + 22) << 16) | ((unint64_t)*(unsigned __int8 *)(a1 + 23) << 8) | *(unsigned __int8 *)(a1 + 24);
    *(unsigned char *)a2 = 1;
    *(unsigned char *)(a2 + 9) = 1;
    *(_DWORD *)(a2 + 1) = 2;
    *(_WORD *)(a2 + 10) = 145;
    *(_WORD *)(a2 + 12) = *(_WORD *)(a1 + 50);
    *(_WORD *)(a2 + 14) = *(_WORD *)(a1 + 38);
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 40);
    *(unsigned char *)(a2 + 20) = *(unsigned char *)(a1 + 46);
    *(unsigned char *)(a2 + 21) = *(unsigned char *)(a1 + 47);
    *(unsigned char *)(a2 + 22) = *(unsigned char *)(a1 + 48);
    *(unsigned char *)(a2 + 23) = 4;
    uint64_t v5 = *(unsigned __int8 *)(a1 + 37);
    *(unsigned char *)(a2 + 24) = v5;
    uint64_t v6 = (__int16 *)(a1 + 52);
    size_t v7 = (_WORD *)(a2 + 55);
    uint64_t v22 = a1;
    do
    {
      unint64_t v8 = a1 + 32 + v4;
      int v9 = *(unsigned __int8 *)(v8 + 152);
      uint64_t v10 = a2 + 24 * v4;
      *(unsigned char *)(v10 + 49) = v9;
      uint64_t v11 = a1 + 32 + 2 * v4;
      __int16 v12 = *(_WORD *)(v11 + 140);
      *(_WORD *)(v10 + 50) = v12;
      int v13 = *(__int16 *)(v11 + 128);
      *(_WORD *)(v10 + 52) = *(_WORD *)(v11 + 128);
      int v14 = *(char *)(v8 + 158);
      *(unsigned char *)(v10 + 54) = *(unsigned char *)(v8 + 158);
      int v15 = *(_DWORD *)(a1 + 32 + 4 * v4 + 164);
      *(_DWORD *)(a2 + 4 * v4 + 25) = v15;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219520;
        unint64_t v24 = v21;
        __int16 v25 = 2048;
        unint64_t v26 = v4;
        __int16 v27 = 2048;
        double v28 = (float)((float)v15 * 0.000015259);
        __int16 v29 = 1024;
        int v30 = v9;
        __int16 v31 = 2048;
        double v32 = (double)v12 * 0.00390625;
        __int16 v33 = 1024;
        int v34 = v13;
        __int16 v35 = 1024;
        int v36 = v14;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[0x%llx] channel[%zu]: luxCoeff = %f, darkCounts = %d, offsetCounts = %f, azOffsetCounts = %d, blHighCounts = %d", buf, 0x3Cu);
        uint64_t v5 = *(unsigned __int8 *)(a2 + 24);
      }
      float v16 = v7;
      float v17 = v6;
      for (uint64_t i = v5; i; --i)
      {
        __int16 v19 = *v17++;
        *v16++ = v19;
      }
      ++v4;
      v6 += 9;
      v7 += 12;
      a1 = v22;
    }
    while (v4 < *(unsigned __int8 *)(a2 + 23));
    *(_DWORD *)(a2 + 41) = 4 * *(_DWORD *)(v22 + 220);
    *(_DWORD *)(a2 + 45) = 4 * *(_DWORD *)(v22 + 224);
    int v2 = 4;
  }
  return v2 == 4;
}

uint64_t sub_15728(const __CFData *a1, uint64_t a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  if (!BytePtr) {
    return 0;
  }
  uint64_t v5 = (uint64_t)BytePtr;
  if (!sub_135C8(a1) || !sub_154AC(v5, a2)) {
    return 0;
  }

  return sub_157B0(v5, a2);
}

uint64_t sub_157B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(_WORD *)(a2 + 10) == 145 && *(_DWORD *)(a2 + 1) == 2;
  if (v2 && *(unsigned char *)(a1 + 36) == 4) {
    operator new[]();
  }
  return 0;
}

void sub_15898(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_158D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_158F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t LDBMCreateSmallDB(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7)
{
  ppDb = 0;
  __sprintf_chk(filename, 0, 0x100uLL, "%s_%d%s", "/var/mobile/Library/CoreBrightness/cbrgbc", a4, ".sqlite");
  mkdir("/var/mobile/Library/CoreBrightness", 0x1EDu);
  if (!sqlite3_open_v2(filename, &ppDb, 4194310, 0))
  {
    if (sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL", 0, 0, 0))
    {
      uint64_t v11 = 4;
LABEL_11:
      sqlite3_close(ppDb);
      return v11;
    }
    sqlite3_exec(ppDb, "DROP TABLE Info", 0, 0, 0);
    sqlite3_exec(ppDb, "DROP TABLE RR", 0, 0, 0);
    if (a6 == 4)
    {
      __int16 v12 = ppDb;
      int v13 = "CREATE TABLE RR (R Single, G Single, B Single, C Single)";
    }
    else
    {
      if (a6 != 5)
      {
LABEL_10:
        uint64_t v11 = 3;
        goto LABEL_11;
      }
      __int16 v12 = ppDb;
      int v13 = "CREATE TABLE RR (CH0 Single, CH1 Single, CH2 Single, CH3 Single, CH4 Single)";
    }
    if (!sqlite3_exec(v12, v13, 0, 0, 0))
    {
      if (*(int *)(a1 + 4) < 1)
      {
LABEL_20:
        sqlite3_exec(ppDb, "DROP TABLE XX", 0, 0, 0);
        uint64_t v11 = sqlite3_exec(ppDb, "CREATE TABLE XX (X Single, Y Single, Z Single)", 0, 0, 0);
        if (v11) {
          goto LABEL_11;
        }
        LODWORD(v17) = *(_DWORD *)(a1 + 4);
        if ((int)v17 < 1)
        {
LABEL_25:
          if (a7)
          {
            uint64_t v11 = sqlite3_exec(ppDb, "CREATE TABLE Info (version Single, smallversion Single, sources Long, orientation Long, algo Long, chipID Unsigned Integer)", 0, 0, 0);
            if (v11) {
              goto LABEL_11;
            }
            __sprintf_chk(sql, 0, 0x400uLL, "INSERT INTO Info VALUES (%f, %f, %d, %d, %d, %d)");
          }
          else
          {
            uint64_t v11 = sqlite3_exec(ppDb, "CREATE TABLE Info (version Single, smallversion Single, sources Long, orientation Long, algo Long)", 0, 0, 0);
            if (v11) {
              goto LABEL_11;
            }
            __sprintf_chk(sql, 0, 0x400uLL, "INSERT INTO Info VALUES (%f, %f, %d, %d, %d)");
          }
          uint64_t v16 = sqlite3_exec(ppDb, sql, 0, 0, 0);
        }
        else
        {
          uint64_t v18 = 0;
          while (1)
          {
            __sprintf_chk(sql, 0, 0x400uLL, "INSERT INTO XX VALUES (%f, %f, %f)", *(float *)(a2 + 4 * v18), *(float *)(a2 + 4 * (v18 + (int)v17)), *(float *)(a2 + 4 * (v18 + 2 * (int)v17)));
            uint64_t v16 = sqlite3_exec(ppDb, sql, 0, 0, 0);
            if (v16) {
              break;
            }
            ++v18;
            uint64_t v17 = *(int *)(a1 + 4);
            if (v18 >= v17) {
              goto LABEL_25;
            }
          }
        }
      }
      else
      {
        uint64_t v15 = 0;
        while (1)
        {
          if (a6 == 4) {
            __sprintf_chk(sql, 0, 0x400uLL, "INSERT INTO RR VALUES (%f, %f, %f, %f)");
          }
          else {
            __sprintf_chk(sql, 0, 0x400uLL, "INSERT INTO RR VALUES (%f, %f, %f, %f, %f)");
          }
          uint64_t v16 = sqlite3_exec(ppDb, sql, 0, 0, 0);
          if (v16) {
            break;
          }
          if (++v15 >= *(int *)(a1 + 4)) {
            goto LABEL_20;
          }
        }
      }
      uint64_t v11 = v16;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  unlink(filename);
  return 2;
}

uint64_t LDBMInitialize(int a1, uint64_t a2, unsigned char *a3, int a4, float a5)
{
  ppDb = 0;
  *a3 = 0;
  __sprintf_chk(filename, 0, 0x100uLL, "%s_%d%s", "/var/mobile/Library/CoreBrightness/cbrgbc", a1, ".sqlite");
  if ((a4 - 1) > 2) {
    return 1;
  }
  uint64_t v9 = sqlite3_open_v2((&off_1C840)[a4 - 1], &ppDb, 1, 0);
  if (v9)
  {
    uint64_t v10 = v9;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_17D00(v10);
    }
  }
  else
  {
    *(void *)&long long v14 = 0;
    *((void *)&v14 + 1) = 0xBF800000FFFFFFFFLL;
    int v15 = 0;
    uint64_t v10 = sqlite3_exec(ppDb, "SELECT * FROM Info", (int (__cdecl *)(void *, int, char **, char **))sub_163EC, &v14, 0);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_17C84((uint64_t)&v14);
    }
    sqlite3_close(ppDb);
    if (!v10)
    {
      *(_OWORD *)a2 = v14;
      *(_DWORD *)(a2 + 16) = v15;
      if (!sqlite3_open_v2(filename, &ppDb, 1, 0))
      {
        sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL", 0, 0, 0);
        long long v12 = 0uLL;
        int v13 = 0;
        if (!sqlite3_exec(ppDb, "SELECT * FROM Info", (int (__cdecl *)(void *, int, char **, char **))sub_163EC, &v12, 0))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_17C08((uint64_t)&v12);
          }
          if (*(float *)&v12 == *(float *)&v14 && DWORD1(v12) == DWORD1(v14) && *((float *)&v12 + 3) == a5)
          {
            *a3 = 1;
            *(_OWORD *)a2 = v12;
            *(_DWORD *)(a2 + 16) = v13;
          }
        }
        sqlite3_close(ppDb);
      }
      return 0;
    }
  }
  return v10;
}

uint64_t LDBMParseBigDB(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 - 1) > 2) {
    return 1;
  }
  size_t v7 = (&off_1C840)[a4 - 1];
  ppDb = 0;
  uint64_t v8 = sqlite3_open_v2(v7, &ppDb, 1, 0);
  if (!v8)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    v12[0] = a2;
    v12[1] = a3;
    LODWORD(v14) = *(_DWORD *)(a1 + 4) - 1;
    uint64_t v9 = ppDb;
    __sprintf_chk(sql, 0, 0x40uLL, "SELECT * FROM Spectra", a2, a3, 0);
    unsigned int v10 = sqlite3_exec(v9, sql, (int (__cdecl *)(void *, int, char **, char **))sub_1655C, v12, 0);
    if (HIDWORD(v13) == ((int)v14 + (int)v14 * (int)v14) / 2) {
      uint64_t v8 = v10;
    }
    else {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    sqlite3_close(ppDb);
  }
  return v8;
}

uint64_t LDBMParseSmallDB(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ppDb = 0;
  __sprintf_chk(filename, 0, 0x100uLL, "%s_%d%s", "/var/mobile/Library/CoreBrightness/cbrgbc", a1, ".sqlite");
  uint64_t result = sqlite3_open_v2(filename, &ppDb, 1, 0);
  if (!result)
  {
    sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL", 0, 0, 0);
    uint64_t v8 = a4;
    int v9 = *(_DWORD *)(a2 + 4);
    int v10 = 0;
    uint64_t result = sqlite3_exec(ppDb, "SELECT * FROM RR", (int (__cdecl *)(void *, int, char **, char **))sub_16228, &v8, 0);
    if (!result)
    {
      uint64_t v8 = a3;
      int v9 = *(_DWORD *)(a2 + 4);
      int v10 = 0;
      uint64_t result = sqlite3_exec(ppDb, "SELECT * FROM XX", (int (__cdecl *)(void *, int, char **, char **))sub_16228, &v8, 0);
      if (!result)
      {
        sqlite3_close(ppDb);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_16228(uint64_t a1, int a2, const char **a3, const char **a4)
{
  if (a2 >= 1)
  {
    uint64_t v7 = a2;
    do
    {
      uint64_t v8 = *a4;
      if (*a4 && *a3)
      {
        double v9 = atof(*a3);
        if (!strcmp("R", v8) || !strcmp("X", v8) || !strcmp("CH0", v8))
        {
          int v10 = 0;
        }
        else if (!strcmp("G", v8) || !strcmp("Y", v8) || !strcmp("CH1", v8))
        {
          int v10 = 1;
        }
        else if (!strcmp("B", v8) || !strcmp("Z", v8) || !strcmp("CH2", v8))
        {
          int v10 = 2;
        }
        else if (!strcmp("C", v8))
        {
          int v10 = 3;
        }
        else if (!strcmp("CH3", v8))
        {
          int v10 = 3;
        }
        else
        {
          int v10 = 4;
        }
        float v11 = v9;
        *(float *)(*(void *)a1 + 4 * (*(_DWORD *)(a1 + 12) + *(_DWORD *)(a1 + 8) * v10)) = v11;
      }
      ++a3;
      ++a4;
      --v7;
    }
    while (v7);
  }
  ++*(_DWORD *)(a1 + 12);
  return 0;
}

uint64_t sub_163EC(uint64_t a1, int a2, const char **a3, const char **a4)
{
  if (a2 >= 1)
  {
    uint64_t v7 = a2;
    do
    {
      uint64_t v8 = *a4;
      if (*a4)
      {
        double v9 = *a3;
        if (*a3)
        {
          if (!strcmp(*a4, "version"))
          {
            float v10 = atof(v9);
            *(float *)a1 = v10;
          }
          else if (!strcmp(v8, "sources"))
          {
            *(_DWORD *)(a1 + 4) = atoi(v9);
          }
          else if (strcmp(v8, "columns") && strcmp(v8, "samples"))
          {
            if (!strcmp(v8, "algo"))
            {
              *(_DWORD *)(a1 + 8) = atoi(v9);
            }
            else if (!strcmp(v8, "smallversion"))
            {
              float v11 = atof(v9);
              *(float *)(a1 + 12) = v11;
            }
            else if (!strcmp(v8, "chipID"))
            {
              *(_DWORD *)(a1 + 16) = atoi(v9);
            }
          }
        }
      }
      ++a3;
      ++a4;
      --v7;
    }
    while (v7);
  }
  return 0;
}

uint64_t sub_1655C(uint64_t a1, int a2, const char **a3, const char **a4)
{
  uint64_t v8 = (a2 - 4);
  double v9 = (float *)malloc_type_malloc(4 * (int)v8, 0x100004052888210uLL);
  if (!v9) {
    return 1;
  }
  float v10 = v9;
  if (a2 < 1) {
    goto LABEL_18;
  }
  uint64_t v22 = a1;
  uint64_t v11 = a2;
  uint64_t v12 = 0xFFFFFFFFLL;
  do
  {
    uint64_t v13 = *a4;
    if (*a4)
    {
      uint64_t v14 = *a3;
      if (*a3)
      {
        if (!strcmp("ID", *a4))
        {
          uint64_t v12 = atoi(v14);
        }
        else if (!strcmp("X", v13))
        {
          float v17 = atof(v14);
          *(float *)double v23 = v17;
        }
        else if (!strcmp("Y", v13))
        {
          float v18 = atof(v14);
          *(float *)&v23[1] = v18;
        }
        else if (!strcmp("Z", v13))
        {
          float v19 = atof(v14);
          *(float *)&v23[2] = v19;
        }
        else
        {
          int v15 = atoi(v13 + 1);
          float v16 = atof(v14);
          v10[v15] = v16;
        }
      }
    }
    ++a3;
    ++a4;
    --v11;
  }
  while (v11);
  if ((v12 & 0x80000000) != 0 || (int)v12 > *(_DWORD *)(v22 + 24))
  {
LABEL_18:
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v20 = (*(uint64_t (**)(void, uint64_t, _DWORD *, float *, uint64_t))v22)(*(void *)(v22 + 8), v12, v23, v10, v8);
    *(_DWORD *)(v22 + 20) += v12;
  }
  free(v10);
  return v20;
}

double sub_16764@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 8) = a2;
  return *(float *)a1;
}

void sub_16778()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create CoreBrightness default log", v0, 2u);
}

void sub_167C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_167F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16830(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_168A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16910(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16984(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_AE4C(&dword_0, a2, a3, "Calibration num_blobs=%u, expected=2", a5, a6, a7, a8, 0);
}

void sub_169F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16A2C(char *a1, uint64_t a2, os_log_t log)
{
  int v3 = a1[3];
  int v4 = a1[2];
  int v5 = a1[1];
  int v6 = *a1;
  int v7 = 134219008;
  uint64_t v8 = a2;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 1024;
  int v14 = v5;
  __int16 v15 = 1024;
  int v16 = v6;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[0x%llx] Magic not as expected. Expected 'HmCA', got %c%c%c%c", (uint8_t *)&v7, 0x24u);
}

void sub_16ADC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[0x%llx] FDR calibration data doesn't match with size of HmCA structure (length = %ld)\n", (uint8_t *)&v3, 0x16u);
}

void sub_16B64(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "FDR calibration data doesn't match with size of VD6286 structure (length = %ld)", (uint8_t *)&v2, 0xCu);
}

void sub_16BDC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Trying to convert FDR VD6286 calibration data structure, size mismatch:(length = %ld)", (uint8_t *)&v2, 0xCu);
}

void sub_16C54()
{
  sub_158CC();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Invalid type of light database %u", v1, 8u);
}

void sub_16CC8()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Calibration loading type was not specified.\n", v2, v3, v4, v5, v6);
}

void sub_16CFC(const __CFData *a1, NSObject *a2)
{
  CFDataGetLength(a1);
  sub_1591C();
  uint64_t v4 = 8;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Need at least header size bytes. Actual: %ld, Expected: %ld\n", v3, 0x16u);
}

void sub_16D8C(const __CFData *a1, uint64_t a2, NSObject *a3)
{
  CFDataGetLength(a1);
  sub_15910();
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Insufficient calibration data size. Actual: %ld, Expected: %hu\n", v5, 0x12u);
}

void sub_16E2C()
{
  sub_158CC();
  sub_AE4C(&dword_0, v0, v1, "Failed to create small DB %d\n", v2, v3, v4, v5, v6);
}

void sub_16E94()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Failed to set ALS calibration data.", v2, v3, v4, v5, v6);
}

void sub_16EC8()
{
  sub_158C0();
  sub_AE4C(&dword_0, v0, v1, "unsupported calibration version: %d\n", v2, v3, v4, v5, v6);
}

void sub_16F34()
{
  sub_1588C();
  sub_158F4(&dword_0, v0, v1, "loadFDRCalibration", v2, v3, v4, v5, v6);
}

double sub_16F68(float *a1, float *a2, os_log_t log)
{
  double v3 = a1[5];
  float v4 = *a1;
  int v5 = *((unsigned __int8 *)a1 + 4);
  int v6 = *((unsigned __int8 *)a1 + 5);
  int v7 = *((_DWORD *)a1 + 2);
  int v8 = *((_DWORD *)a1 + 3);
  double v9 = (float)((float)*((int *)a1 + 4) * 0.000015259);
  double v10 = *a2;
  double v11 = a2[1];
  double v12 = a2[2];
  double v13 = a1[7];
  double v14 = a1[8];
  double v15 = a1[9];
  double v16 = a1[10];
  double v17 = a1[11];
  double v18 = a1[12];
  int v20 = 134221824;
  double v21 = v3;
  __int16 v22 = 1024;
  float v23 = v4;
  __int16 v24 = 1024;
  int v25 = v5;
  __int16 v26 = 1024;
  int v27 = v6;
  __int16 v28 = 1024;
  int v29 = v7;
  __int16 v30 = 1024;
  int v31 = v8;
  __int16 v32 = 2048;
  double v33 = v9;
  __int16 v34 = 2048;
  double v35 = v10;
  __int16 v36 = 2048;
  double v37 = v11;
  __int16 v38 = 2048;
  double v39 = v12;
  __int16 v40 = 2048;
  double v41 = v13;
  __int16 v42 = 2048;
  double v43 = v14;
  __int16 v44 = 2048;
  double v45 = v15;
  __int16 v46 = 2048;
  double v47 = v16;
  __int16 v48 = 2048;
  double v49 = v17;
  __int16 v50 = 2048;
  double v51 = v18;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "lux=%f status=%d nChannels=%d orientation=%d integrationTime=%u reportInterval=%u gain=%f XYZ=[%f;%f;%f] Channels=[%"
    "f;%f;%f;%f;%f;%f]",
    (uint8_t *)&v20,
    0x8Eu);
  return result;
}

void sub_170C8()
{
  sub_1588C();
  sub_158F4(&dword_0, v0, v1, "ALS spike is detected -> setting zero lux and zero color.", v2, v3, v4, v5, v6);
}

void sub_170FC()
{
  sub_158C0();
  sub_AE4C(&dword_0, v0, v1, "Unknown number of channels (%d) \n", v2, v3, v4, v5, v6);
}

void sub_17168(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_15898(&dword_0, a1, a3, "Normalization - Max WW = %f \n", a5, a6, a7, a8, 0);
}

void sub_171D8()
{
  sub_1588C();
  sub_158F4(&dword_0, v0, v1, "All channels are zero. Take a shortcut", v2, v3, v4, v5, v6);
}

void sub_1720C()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Event is null", v2, v3, v4, v5, v6);
}

void sub_17240()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Failed to rebuild databases.", v2, v3, v4, v5, v6);
}

void sub_17274()
{
  sub_158B4();
  sub_15898(&dword_0, v0, v1, "Chromaticity (xyY) override turned %s", v2, v3, v4, v5, v6);
}

void sub_172F8()
{
  sub_158B4();
  sub_15898(&dword_0, v0, v1, "Override Y: %.2f", v2, v3, v4, v5, v6);
}

void sub_17364()
{
  sub_158B4();
  sub_15898(&dword_0, v0, v1, "Override y: %.2f", v2, v3, v4, v5, v6);
}

void sub_173D0()
{
  sub_158B4();
  sub_15898(&dword_0, v0, v1, "Override x: %.2f", v2, v3, v4, v5, v6);
}

void sub_1743C()
{
  sub_158B4();
  sub_15898(&dword_0, v0, v1, "RGBC override turned %s", v2, v3, v4, v5, v6);
}

void sub_174C0()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Failed to parse ALS calibration data.", v2, v3, v4, v5, v6);
}

void sub_174F4()
{
  sub_1588C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Error creating calibration.", v1, 2u);
}

void sub_17534()
{
  sub_158C0();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Invalid type DB type %d for AOP color calculation", v1, 8u);
}

void sub_175AC()
{
  sub_1588C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Failed to send the calibration to the ALS driver.", v1, 2u);
}

void sub_175EC()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "failed to parse big DB", v2, v3, v4, v5, v6);
}

void sub_17620()
{
  sub_158B4();
  sub_15898(&dword_0, v0, v1, "Found %s calibration", v2, v3, v4, v5, v6);
}

void sub_176A4()
{
  sub_158C0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "ID in FDR calibration (0x%x) doesn't match with chip ID (0x%x) -> calibration will be skipped.\n", v2, 0xEu);
}

void sub_17730()
{
  sub_158C0();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Chip_id = 0x%08X\n", v1, 8u);
}

void sub_177A8()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "wrong matrix size \n", v2, v3, v4, v5, v6);
}

void sub_177DC()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Calibration data are smaller than ALSCalibrationDataVD6286 structure.", v2, v3, v4, v5, v6);
}

void sub_17810()
{
  sub_15910();
  sub_15898(&dword_0, v0, v1, "%s", v2, v3, v4, v5, v6);
}

void sub_17878()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Parsing of FDR calibration failed", v2, v3, v4, v5, v6);
}

float sub_178AC(unsigned __int16 a1, int a2, os_log_t log)
{
  v4[0] = 67109888;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = 250;
  __int16 v7 = 1024;
  int v8 = a1;
  __int16 v9 = 1024;
  int v10 = 19660;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "WORKAROUND: override iTime (%i -> %i) and fudge (%i -> %i)", (uint8_t *)v4, 0x1Au);
  return result;
}

void sub_1794C()
{
  sub_15910();
  sub_158D8(&dword_0, v0, v1, "FDR calibration data doesn't match with size of HmCA structure (length = %ld)\n", v2, v3, v4, v5, v6);
}

void sub_179B4()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Unexpected num_channels/num_gains!\n", v2, v3, v4, v5, v6);
}

void sub_179E8()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Unexpected calibration blob types!\n", v2, v3, v4, v5, v6);
}

void sub_17A1C()
{
  sub_158C0();
  sub_AE4C(&dword_0, v0, v1, "Calibration num_blobs=%u, expected=2\n", v2, v3, v4, v5, v6);
}

void sub_17A88()
{
  sub_1591C();
  uint64_t v2 = 10348;
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "FDR calibration size - %ld != %lu\n", v1, 0x16u);
}

void sub_17B04()
{
  sub_15910();
  sub_158D8(&dword_0, v0, v1, "FDR calibration data doesn't match with size of VD6286 structure (length = %ld)", v2, v3, v4, v5, v6);
}

void sub_17B6C()
{
  sub_15910();
  sub_158D8(&dword_0, v0, v1, "FDR calibration data doesn't match with size of VD6287 structure (length = %ld)", v2, v3, v4, v5, v6);
}

void sub_17BD4()
{
  sub_1588C();
  sub_AE68(&dword_0, v0, v1, "Parsing of FDR spectrum failed", v2, v3, v4, v5, v6);
}

void sub_17C08(uint64_t a1)
{
  sub_16764(a1, __stack_chk_guard);
  sub_1674C();
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "SMALL: DB version %f - %d samples", v1, 0x12u);
}

void sub_17C84(uint64_t a1)
{
  sub_16764(a1, __stack_chk_guard);
  sub_1674C();
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BIG: DB version %f - %d samples", v1, 0x12u);
}

void sub_17D00(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BIG: Failed to open big DB (float result = %d).", (uint8_t *)v1, 8u);
}

uint64_t AMFDRLogSetHandler()
{
  return _AMFDRLogSetHandler();
}

uint64_t AMFDRSealingManifestCopyMultiInstanceForClass()
{
  return _AMFDRSealingManifestCopyMultiInstanceForClass();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return _AMFDRSealingMapCopyLocalData();
}

uint64_t AMFDRSealingMapCopyLocalDict()
{
  return _AMFDRSealingMapCopyLocalDict();
}

uint64_t AMFDRSealingMapCopyMultiInstanceForClass()
{
  return _AMFDRSealingMapCopyMultiInstanceForClass();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

uint64_t IOHIDEventGetChildren()
{
  return _IOHIDEventGetChildren();
}

uint64_t IOHIDEventGetDataValue()
{
  return _IOHIDEventGetDataValue();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return _IOHIDEventGetDoubleValue();
}

uint64_t IOHIDEventGetFloatValue()
{
  return _IOHIDEventGetFloatValue();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return _IOHIDEventGetTimeStamp();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return _IOHIDEventSetDoubleValue();
}

uint64_t IOHIDEventSetFloatValue()
{
  return _IOHIDEventSetFloatValue();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return _IOHIDEventSetIntegerValue();
}

uint64_t IOHIDServiceConformsTo()
{
  return _IOHIDServiceConformsTo();
}

uint64_t IOHIDServiceCopyProperty()
{
  return _IOHIDServiceCopyProperty();
}

uint64_t IOHIDServiceGetProperty()
{
  return _IOHIDServiceGetProperty();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return _IOHIDServiceGetRegistryID();
}

uint64_t IOHIDServiceSetProperty()
{
  return _IOHIDServiceSetProperty();
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MGIsDeviceOneOfType()
{
  return _MGIsDeviceOneOfType();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
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

double atof(const char *a1)
{
  return _atof(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  return _cblas_sdot(__N, __X, __incX, __Y, __incY);
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  return _cblas_snrm2(__N, __X, __incX);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

float logf(float a1)
{
  return _logf(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int ssysv_(char *__uplo, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__b, __CLPK_integer *__ldb, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return _ssysv_(__uplo, __n, __nrhs, __a, __lda, __ipiv, __b, __ldb, __work, __lwork, __info);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
}