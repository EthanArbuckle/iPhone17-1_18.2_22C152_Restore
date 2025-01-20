uint64_t manager_CopyProperty(uint64_t a1, const void *a2, const __CFAllocator *a3, uint64_t *a4)
{
  NSObject ***DerivedStorage;
  NSObject ***v8;
  CFTypeRef *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  void *v14;
  NSObject **v15;
  NSObject *v16;
  uint64_t Count;
  const char *v18;
  uint64_t v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x263EF8340];
  DerivedStorage = (NSObject ***)CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)DerivedStorage) {
    return 4294950584;
  }
  v8 = DerivedStorage;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F011F0]))
  {
    v9 = (CFTypeRef *)MEMORY[0x263F01208];
LABEL_4:
    v10 = (uint64_t)CFRetain(*v9);
LABEL_10:
    v12 = v10;
    result = 0;
    *a4 = v12;
    return result;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01200]))
  {
    v11 = 2;
LABEL_7:
    *(void *)v20 = v11;
    v10 = (uint64_t)CFNumberCreate(a3, kCFNumberSInt64Type, v20);
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F011E0]))
  {
    v10 = BluetoothEndpointCollectionCopyAsCFArray(v8[4], (uint64_t)a3);
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F011E8]))
  {
    v14 = (void *)BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
    {
      v15 = v8[4];
      v16 = v14;
      Count = BluetoothEndpointCollectionGetCount(v15);
      v18 = "endpoints present";
      if (!Count) {
        v18 = "no endpoints";
      }
      *(_DWORD *)v20 = 136446210;
      *(void *)&v20[4] = v18;
      _os_log_impl(&dword_227451000, v16, OS_LOG_TYPE_INFO, "We have %{public}s", v20, 0xCu);
    }
    v19 = BluetoothEndpointCollectionGetCount(v8[4]);
    v9 = (CFTypeRef *)MEMORY[0x263EFFB40];
    if (!v19) {
      v9 = (CFTypeRef *)MEMORY[0x263EFFB38];
    }
    goto LABEL_4;
  }
  result = CFEqual(a2, (CFTypeRef)*MEMORY[0x263F011F8]);
  if (result)
  {
    v11 = 7;
    goto LABEL_7;
  }
  return result;
}

uint64_t BluetoothEndpointCollectionGetCount(NSObject **a1)
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  v1 = *a1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __BluetoothEndpointCollectionGetCount_block_invoke;
  v4[3] = &unk_2648084B0;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFIndex __BluetoothEndpointCollectionGetCount_block_invoke(uint64_t a1)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 32));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t BluetoothEndpointCreateWithDescription(const __CFAllocator *a1, const __CFDictionary *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v3 = 4294950576;
  if (a2 && a3)
  {
    uint64_t v7 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFDictionaryRef v42 = a2;
      _os_log_impl(&dword_227451000, v7, OS_LOG_TYPE_DEFAULT, "BluetoothEndpointCreateWithDescription %@", buf, 0xCu);
    }
    FigEndpointGetClassID();
    uint64_t v3 = CMDerivedObjectCreate();
    if (!v3)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (!DerivedStorage) {
        return 4294950575;
      }
      uint64_t v9 = DerivedStorage;
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v11 = dispatch_queue_create("BluetoothEndpointQueue", v10);
      v12 = *(void **)(v9 + 8);
      *(void *)(v9 + 8) = v11;

      if (*(void *)(v9 + 8))
      {
        Value = CFDictionaryGetValue(a2, @"Name");
        *(void *)(v9 + 32) = Value;
        if (!Value) {
          goto LABEL_30;
        }
        CFRetain(Value);
        v14 = CFDictionaryGetValue(a2, @"DeviceID");
        *(void *)(v9 + 40) = v14;
        if (!v14) {
          goto LABEL_30;
        }
        CFRetain(v14);
        v15 = CFDictionaryGetValue(a2, @"ModelID");
        *(void *)(v9 + 48) = v15;
        if (!v15) {
          goto LABEL_30;
        }
        CFRetain(v15);
        if (CFDictionaryGetValue(a2, @"Shareable"))
        {
          CFBooleanRef v16 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"Shareable");
          *(unsigned char *)(v9 + 89) = CFBooleanGetValue(v16);
        }
        CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(a2, @"SupportedFormats");
        if (!CFNumberGetValue(v17, kCFNumberCharType, (void *)(v9 + 88))) {
          goto LABEL_30;
        }
        CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(a2, @"ListeningMode");
        if (!CFNumberGetValue(v18, kCFNumberIntType, (void *)(v9 + 96))) {
          goto LABEL_30;
        }
        CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(a2, @"SupportedListeningModes");
        if (!CFNumberGetValue(v19, kCFNumberIntType, (void *)(v9 + 92))) {
          goto LABEL_30;
        }
        CFBooleanRef v20 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SupportsSpatialAudio");
        if (!v20) {
          goto LABEL_30;
        }
        *(unsigned char *)(v9 + 101) = CFBooleanGetValue(v20);
        CFBooleanRef v21 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SpatialAudioEnabled");
        if (!v21) {
          goto LABEL_30;
        }
        *(unsigned char *)(v9 + 102) = CFBooleanGetValue(v21);
        CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(a2, @"SpatialAudioMode");
        if (!CFNumberGetValue(v22, kCFNumberCharType, (void *)(v9 + 100))) {
          goto LABEL_30;
        }
        CFBooleanRef v23 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SupportsSmartRouting");
        if (!v23) {
          goto LABEL_30;
        }
        *(unsigned char *)(v9 + 104) = CFBooleanGetValue(v23);
        CFBooleanRef v24 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SmartRoutingEnabled");
        if (!v24
          || (*(unsigned char *)(v9 + 105) = CFBooleanGetValue(v24),
              (CFBooleanRef v25 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SupportsConversationDetect")) == 0)
          || (*(unsigned char *)(v9 + 107) = CFBooleanGetValue(v25),
              (CFBooleanRef v26 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"ConversationDetectEnable")) == 0)
          || (*(unsigned char *)(v9 + 108) = CFBooleanGetValue(v26),
              (CFBooleanRef v27 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"IsGenuineAirPods")) == 0))
        {
LABEL_30:
          uint64_t v3 = 4294950576;
LABEL_31:
          v36 = *(const void **)(v9 + 32);
          if (v36) {
            CFRelease(v36);
          }
          v37 = *(const void **)(v9 + 40);
          if (v37) {
            CFRelease(v37);
          }
          v38 = *(const void **)(v9 + 48);
          if (v38) {
            CFRelease(v38);
          }
          v39 = *(const void **)(v9 + 64);
          if (v39) {
            CFRelease(v39);
          }
          v40 = *(void **)v9;
          *(void *)uint64_t v9 = 0;

          return v3;
        }
        *(unsigned char *)(v9 + 106) = CFBooleanGetValue(v27);
        v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v29 = dispatch_queue_create("BluetoothEndpointNotification", v28);
        v30 = *(void **)v9;
        *(void *)uint64_t v9 = v29;

        if (*(void *)v9)
        {
          CFBooleanRef v31 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"Connected");
          int v32 = CFBooleanGetValue(v31);
          endpoint_setConnected(0, v32);
          if (CFDictionaryContainsKey(a2, @"BatteryLevels"))
          {
            CFDictionaryRef v33 = (const __CFDictionary *)CFDictionaryGetValue(a2, @"BatteryLevels");
            CFDictionaryRef Copy = CFDictionaryCreateCopy(a1, v33);
          }
          else
          {
            CFDictionaryRef Copy = CFDictionaryCreate(a1, 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          }
          uint64_t v3 = 0;
          *(void *)(v9 + 64) = Copy;
          *a3 = 0;
          return v3;
        }
      }
      uint64_t v3 = 4294950575;
      goto LABEL_31;
    }
  }
  return v3;
}

void endpoint_setConnected(const void *a1, int a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "connected";
    uint64_t v7 = *(void *)(DerivedStorage + 40);
    if (!a2) {
      v6 = "disconnected";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = v7;
    __int16 v34 = 2080;
    v35 = v6;
    _os_log_impl(&dword_227451000, v5, OS_LOG_TYPE_DEFAULT, "Device with address %@ is %s", buf, 0x16u);
  }
  *(unsigned char *)(DerivedStorage + 56) = a2;
  if (a2)
  {
    CFAllocatorRef v8 = CFGetAllocator(a1);
    Mutable = CFDictionaryCreateMutable(v8, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(Mutable, @"Name", *(const void **)(DerivedStorage + 32));
    char v10 = *(unsigned char *)(DerivedStorage + 88);
    if (v10)
    {
      CFAllocatorRef v11 = CFGetAllocator(a1);
      CFStringRef v12 = CFStringCreateWithFormat(v11, 0, @"%@-%s", *(void *)(DerivedStorage + 40), "tacl");
      CFDictionarySetValue(Mutable, @"DeviceID", v12);
      int v13 = CFGetAllocator(a1);
      BluetoothEndpointStreamAudioCreate(v13, Mutable, (void *)(DerivedStorage + 16));
      CFRelease(v12);
      char v10 = *(unsigned char *)(DerivedStorage + 88);
    }
    if ((v10 & 2) != 0)
    {
      CFAllocatorRef v14 = CFGetAllocator(a1);
      CFStringRef v15 = CFStringCreateWithFormat(v14, 0, @"%@-%s", *(void *)(DerivedStorage + 40), "tsco");
      CFDictionarySetValue(Mutable, @"DeviceID", v15);
      int v16 = CFGetAllocator(a1);
      BluetoothEndpointStreamAudioCreate(v16, Mutable, (void *)(DerivedStorage + 24));
      CFRelease(v15);
    }
    CFRelease(Mutable);
  }
  else
  {
    uint64_t v17 = 0;
    char v18 = 1;
    do
    {
      char v19 = v18;
      uint64_t v20 = DerivedStorage + 8 * v17;
      uint64_t v23 = *(void *)(v20 + 16);
      CFNumberRef v22 = (CFTypeRef *)(v20 + 16);
      uint64_t v21 = v23;
      if (v23)
      {
        uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v24) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = 0;
        }
        CFBooleanRef v26 = *(void (**)(uint64_t))(v25 + 32);
        if (v26) {
          v26(v21);
        }
        if (*v22)
        {
          CFRelease(*v22);
          *CFNumberRef v22 = 0;
        }
      }
      char v18 = 0;
      uint64_t v17 = 1;
    }
    while ((v19 & 1) != 0);
  }
  CFAllocatorRef v27 = CFGetAllocator(a1);
  CFMutableDictionaryRef v28 = CFDictionaryCreateMutable(v27, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  FigCFDictionarySetInt64();
  FigCFDictionarySetInt64();
  CFRetain(a1);
  dispatch_queue_t v29 = *(NSObject **)DerivedStorage;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __endpoint_setConnected_block_invoke;
  block[3] = &__block_descriptor_49_e5_v8__0l;
  char v31 = a2;
  block[4] = a1;
  block[5] = v28;
  dispatch_async(v29, block);
}

uint64_t BluetoothEndpointUpdateWithDescription(const void *a1, const __CFDictionary *a2, unsigned char *a3)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t result = 4294950576;
  if (a1 && a2 && a3)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!DerivedStorage) {
      return 4294950575;
    }
    uint64_t v8 = DerivedStorage;
    Value = CFDictionaryGetValue(a2, @"Name");
    if (!Value) {
      return 4294950576;
    }
    char v10 = Value;
    if (!CFEqual(*(CFTypeRef *)(v8 + 32), Value))
    {
      CFAutorelease(*(CFTypeRef *)(v8 + 32));
      CFAllocatorRef v11 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(v8 + 32);
        *(_DWORD *)buf = 138412546;
        *(void *)v75 = v12;
        *(_WORD *)&v75[8] = 2112;
        v76 = v10;
        _os_log_impl(&dword_227451000, v11, OS_LOG_TYPE_DEFAULT, "Name %@->%@", buf, 0x16u);
      }
      *(void *)(v8 + 32) = v10;
      CFRetain(v10);
      *a3 = 1;
    }
    int v13 = CFDictionaryGetValue(a2, @"DeviceID");
    if (!CFEqual(*(CFTypeRef *)(v8 + 40), v13))
    {
      CFAutorelease(*(CFTypeRef *)(v8 + 40));
      CFAllocatorRef v14 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(v8 + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)v75 = v15;
        *(_WORD *)&v75[8] = 2112;
        v76 = v13;
        _os_log_impl(&dword_227451000, v14, OS_LOG_TYPE_DEFAULT, "DeviceID %@->%@", buf, 0x16u);
      }
      *(void *)(v8 + 40) = v13;
      CFRetain(v13);
      *a3 = 1;
    }
    int v16 = CFDictionaryGetValue(a2, @"ModelID");
    if (!CFEqual(*(CFTypeRef *)(v8 + 48), v16))
    {
      CFAutorelease(*(CFTypeRef *)(v8 + 48));
      uint64_t v17 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(v8 + 48);
        *(_DWORD *)buf = 138412546;
        *(void *)v75 = v18;
        *(_WORD *)&v75[8] = 2112;
        v76 = v16;
        _os_log_impl(&dword_227451000, v17, OS_LOG_TYPE_DEFAULT, "ModelID %@->%@", buf, 0x16u);
      }
      *(void *)(v8 + 48) = v16;
      CFRetain(v16);
      *a3 = 1;
    }
    CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(a2, @"SupportedListeningModes");
    int valuePtr = 0;
    if (CFNumberGetValue(v19, kCFNumberIntType, &valuePtr) && *(_DWORD *)(v8 + 92) != valuePtr)
    {
      uint64_t v20 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = *(_DWORD *)(v8 + 92);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v21;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = valuePtr;
        _os_log_impl(&dword_227451000, v20, OS_LOG_TYPE_DEFAULT, "Supported Listening Modes %d->%d", buf, 0xEu);
      }
      *(_DWORD *)(v8 + 92) = valuePtr;
      *a3 = 1;
    }
    CFBooleanRef v22 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"Connected");
    int v23 = CFBooleanGetValue(v22);
    if (v23 != *(unsigned __int8 *)(v8 + 56))
    {
      int v24 = v23;
      uint64_t v25 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = *(unsigned __int8 *)(v8 + 56);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v26;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v24;
        _os_log_impl(&dword_227451000, v25, OS_LOG_TYPE_DEFAULT, "Connected %d->%d", buf, 0xEu);
      }
      endpoint_setConnected(a1, v24);
      *a3 = 1;
    }
    CFAllocatorRef v27 = CFDictionaryGetValue(a2, @"BatteryLevels");
    if (v27)
    {
      CFMutableDictionaryRef v28 = *(NSObject **)(v8 + 8);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __BluetoothEndpointUpdateWithDescription_block_invoke;
      block[3] = &__block_descriptor_64_e5_v8__0l;
      block[4] = v8;
      block[5] = v27;
      void block[6] = a1;
      block[7] = a3;
      dispatch_sync(v28, block);
    }
    if (CFDictionaryContainsKey(a2, @"Shareable"))
    {
      CFBooleanRef v29 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"Shareable");
      int v30 = CFBooleanGetValue(v29);
      if (*(unsigned __int8 *)(v8 + 89) != v30)
      {
        int v31 = v30;
        int v32 = BluetoothEndpointManagerLogComponent;
        if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = *(unsigned __int8 *)(v8 + 89);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v75 = v33;
          *(_WORD *)&v75[4] = 1024;
          *(_DWORD *)&v75[6] = v31;
          _os_log_impl(&dword_227451000, v32, OS_LOG_TYPE_DEFAULT, "Shareable %d->%d", buf, 0xEu);
        }
        *(unsigned char *)(v8 + 89) = v31;
        *a3 = 1;
      }
    }
    int v71 = 0;
    CFNumberRef v34 = (const __CFNumber *)CFDictionaryGetValue(a2, @"ListeningMode");
    if (CFNumberGetValue(v34, kCFNumberIntType, &v71) && v71 != *(_DWORD *)(v8 + 96))
    {
      v35 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = *(_DWORD *)(v8 + 96);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v36;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v71;
        _os_log_impl(&dword_227451000, v35, OS_LOG_TYPE_DEFAULT, "Listening mode %d->%d", buf, 0xEu);
      }
      *(_DWORD *)(v8 + 96) = v71;
      *a3 = 1;
    }
    CFBooleanRef v37 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SupportsSpatialAudio");
    int v38 = CFBooleanGetValue(v37) != 0;
    if (*(unsigned __int8 *)(v8 + 101) != v38)
    {
      v39 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v40 = *(unsigned __int8 *)(v8 + 101);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v40;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v38;
        _os_log_impl(&dword_227451000, v39, OS_LOG_TYPE_DEFAULT, "Spatial audio Support : %d->%d", buf, 0xEu);
      }
      *(unsigned char *)(v8 + 101) = v38;
      *a3 = 1;
    }
    CFBooleanRef v41 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SpatialAudioEnabled");
    int v42 = CFBooleanGetValue(v41) != 0;
    if (*(unsigned __int8 *)(v8 + 102) != v42)
    {
      uint64_t v43 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = *(unsigned __int8 *)(v8 + 102);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v44;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v42;
        _os_log_impl(&dword_227451000, v43, OS_LOG_TYPE_DEFAULT, "Spatial audio Allowed : %d->%d", buf, 0xEu);
      }
      *(unsigned char *)(v8 + 102) = v42;
      *a3 = 1;
    }
    unsigned __int8 v70 = 0;
    CFNumberRef v45 = (const __CFNumber *)CFDictionaryGetValue(a2, @"SpatialAudioMode");
    if (CFNumberGetValue(v45, kCFNumberCharType, &v70) && v70 != *(unsigned __int8 *)(v8 + 100))
    {
      v46 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v47 = *(unsigned __int8 *)(v8 + 100);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v47;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v70;
        _os_log_impl(&dword_227451000, v46, OS_LOG_TYPE_DEFAULT, "Spatial Audio mode %d->%d", buf, 0xEu);
      }
      *(unsigned char *)(v8 + 100) = v70;
      *a3 = 1;
    }
    CFBooleanRef v48 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SupportsSmartRouting");
    int v49 = CFBooleanGetValue(v48) != 0;
    if (*(unsigned __int8 *)(v8 + 104) != v49)
    {
      v50 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v51 = *(unsigned __int8 *)(v8 + 104);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v51;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v49;
        _os_log_impl(&dword_227451000, v50, OS_LOG_TYPE_DEFAULT, "Support SmartRouting : %d->%d", buf, 0xEu);
      }
      *(unsigned char *)(v8 + 104) = v49;
      *a3 = 1;
    }
    CFBooleanRef v52 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SmartRoutingEnabled");
    int v53 = CFBooleanGetValue(v52) != 0;
    if (*(unsigned __int8 *)(v8 + 105) != v53)
    {
      v54 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v55 = *(unsigned __int8 *)(v8 + 105);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v55;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v53;
        _os_log_impl(&dword_227451000, v54, OS_LOG_TYPE_DEFAULT, "SmartRouting Enabled : %d->%d", buf, 0xEu);
      }
      *(unsigned char *)(v8 + 105) = v53;
      *a3 = 1;
    }
    CFBooleanRef v56 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SupportsConversationDetect");
    int v57 = CFBooleanGetValue(v56) != 0;
    if (*(unsigned __int8 *)(v8 + 107) != v57)
    {
      v58 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v59 = *(unsigned __int8 *)(v8 + 107);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v59;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v57;
        _os_log_impl(&dword_227451000, v58, OS_LOG_TYPE_DEFAULT, "Support Conversation Detect : %d->%d", buf, 0xEu);
      }
      *(unsigned char *)(v8 + 107) = v57;
      *a3 = 1;
    }
    CFBooleanRef v60 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"ConversationDetectEnable");
    int v61 = CFBooleanGetValue(v60) != 0;
    if (*(unsigned __int8 *)(v8 + 108) != v61)
    {
      v62 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v63 = *(unsigned __int8 *)(v8 + 108);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v63;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v61;
        _os_log_impl(&dword_227451000, v62, OS_LOG_TYPE_DEFAULT, "Conversation Detect Enabled : %d->%d", buf, 0xEu);
      }
      *(unsigned char *)(v8 + 108) = v61;
      *a3 = 1;
    }
    CFBooleanRef v64 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"IsGenuineAirPods");
    int v65 = CFBooleanGetValue(v64) != 0;
    if (*(unsigned __int8 *)(v8 + 106) == v65)
    {
      if (!*a3) {
        return 0;
      }
    }
    else
    {
      v66 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v67 = *(unsigned __int8 *)(v8 + 106);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v75 = v67;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v65;
        _os_log_impl(&dword_227451000, v66, OS_LOG_TYPE_DEFAULT, "Is Genuine AirPods : %d->%d", buf, 0xEu);
      }
      *(unsigned char *)(v8 + 106) = v65;
      *a3 = 1;
    }
    CFRetain(a1);
    v68 = *(NSObject **)v8;
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __BluetoothEndpointUpdateWithDescription_block_invoke_58;
    v69[3] = &__block_descriptor_40_e5_v8__0l;
    v69[4] = a1;
    dispatch_async(v68, v69);
    return 0;
  }
  return result;
}

void __BluetoothEndpointUpdateWithDescription_block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  id v3 = *(id *)(a1 + 40);
  v4 = [v2 allKeys];
  uint64_t v5 = [v3 allKeys];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        int v13 = objc_msgSend(v2, "objectForKeyedSubscript:", v12, (void)v19);
        CFAllocatorRef v14 = [v3 objectForKeyedSubscript:v12];
        char v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0)
        {
          CFAutorelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 64));
          int v16 = BluetoothEndpointManagerLogComponent;
          if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 64);
            *(_DWORD *)buf = 138412546;
            uint64_t v24 = v17;
            __int16 v25 = 2112;
            id v26 = v3;
            _os_log_impl(&dword_227451000, v16, OS_LOG_TYPE_DEFAULT, "Battery Levels %@->%@", buf, 0x16u);
          }
          CFAllocatorRef v18 = CFGetAllocator(*(CFTypeRef *)(a1 + 48));
          *(void *)(*(void *)(a1 + 32) + 64) = CFDictionaryCreateCopy(v18, *(CFDictionaryRef *)(a1 + 40));
          **(unsigned char **)(a1 + 56) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void __BluetoothEndpointUpdateWithDescription_block_invoke_58(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  id v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void BluetoothEndpoint_Disassociate(const void *a1)
{
  uint64_t DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  id v3 = *DerivedStorage;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BluetoothEndpoint_Disassociate_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

uint64_t endpoint_Invalidate()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = 0;
  char v2 = 1;
  do
  {
    char v3 = v2;
    uint64_t v4 = DerivedStorage + 8 * v1;
    uint64_t v7 = *(void *)(v4 + 16);
    v6 = (CFTypeRef *)(v4 + 16);
    uint64_t v5 = v7;
    if (v7)
    {
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = *(void (**)(uint64_t))(v9 + 32);
      if (v10) {
        v10(v5);
      }
      if (*v6)
      {
        CFRelease(*v6);
        CFTypeRef *v6 = 0;
      }
    }
    char v2 = 0;
    uint64_t v1 = 1;
  }
  while ((v3 & 1) != 0);
  return 0;
}

void endpoint_Finalize()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(void **)DerivedStorage;
  *(void *)uint64_t DerivedStorage = 0;

  char v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(DerivedStorage + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_227451000, v2, OS_LOG_TYPE_DEFAULT, "Finalize %@", buf, 0xCu);
  }
  uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __endpoint_Finalize_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = DerivedStorage;
  dispatch_sync(v4, block);
  uint64_t v5 = *(void **)(DerivedStorage + 8);
  *(void *)(DerivedStorage + 8) = 0;
}

CFTypeRef endpoint_CopyDebugDescription()
{
  return CFRetain(@"Bluetooth Endpoint");
}

uint64_t endpoint_CopyProperty(uint64_t a1, const void *a2, const __CFAllocator *a3, uint64_t *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01540]))
  {
    *a4 = *MEMORY[0x263F015B8];
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014D8]))
  {
    uint64_t v8 = *(const void **)(DerivedStorage + 40);
    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01508]))
  {
    uint64_t v8 = *(const void **)(DerivedStorage + 48);
LABEL_8:
    uint64_t v8 = CFRetain(v8);
LABEL_9:
    *a4 = (uint64_t)v8;
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01510]))
  {
    uint64_t v8 = *(const void **)(DerivedStorage + 32);
    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01528]))
  {
    uint64_t valuePtr = 2;
    p_uint64_t valuePtr = &valuePtr;
    CFAllocatorRef v12 = a3;
    CFNumberType v13 = kCFNumberSInt64Type;
LABEL_18:
    uint64_t v8 = CFNumberCreate(v12, v13, p_valuePtr);
    goto LABEL_9;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01520]))
  {
    Mutable = CFArrayCreateMutable(a3, 0, MEMORY[0x263EFFF70]);
    uint64_t v15 = 0;
    char v16 = 1;
    do
    {
      char v17 = v16;
      CFAllocatorRef v18 = *(const void **)(DerivedStorage + 8 * v15 + 16);
      if (v18) {
        CFArrayAppendValue(Mutable, v18);
      }
      char v16 = 0;
      uint64_t v15 = 1;
    }
    while ((v17 & 1) != 0);
    *a4 = (uint64_t)Mutable;
    goto LABEL_10;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014E0]) || CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014F0]))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    int v20 = *(unsigned __int8 *)(DerivedStorage + 56);
    goto LABEL_28;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014C8]))
  {
    long long v21 = *(NSObject **)(DerivedStorage + 8);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __endpoint_CopyProperty_block_invoke;
    v23[3] = &__block_descriptor_56_e5_v8__0l;
    v23[4] = DerivedStorage;
    v23[5] = a4;
    v23[6] = a3;
    dispatch_sync(v21, v23);
LABEL_10:
    uint64_t v9 = BluetoothEndpointManagerLogComponent;
    uint64_t result = os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      endpoint_CopyProperty_cold_2((uint64_t)a2, a4, v9);
      return 0;
    }
    return result;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014E8]))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    int v20 = *(unsigned __int8 *)(DerivedStorage + 89);
    goto LABEL_28;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01500]))
  {
    p_uint64_t valuePtr = (uint64_t *)(DerivedStorage + 96);
LABEL_39:
    CFAllocatorRef v12 = a3;
    CFNumberType v13 = kCFNumberIntType;
    goto LABEL_18;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01530]))
  {
    p_uint64_t valuePtr = (uint64_t *)(DerivedStorage + 92);
    goto LABEL_39;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01538]))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    int v20 = *(unsigned __int8 *)(DerivedStorage + 101);
    goto LABEL_28;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014B8]))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    if (*(unsigned char *)(DerivedStorage + 102) != 1) {
      long long v19 = (const void **)MEMORY[0x263EFFB38];
    }
    goto LABEL_30;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014D0]))
  {
    p_uint64_t valuePtr = (uint64_t *)(DerivedStorage + 100);
    CFAllocatorRef v12 = a3;
    CFNumberType v13 = kCFNumberCharType;
    goto LABEL_18;
  }
  if (CFEqual(a2, @"SupportsSmartRouting"))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    int v20 = *(unsigned __int8 *)(DerivedStorage + 104);
    goto LABEL_28;
  }
  if (CFEqual(a2, @"SmartRoutingEnabled"))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    int v20 = *(unsigned __int8 *)(DerivedStorage + 105);
    goto LABEL_28;
  }
  if (CFEqual(a2, @"SupportsConversationDetect"))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    int v20 = *(unsigned __int8 *)(DerivedStorage + 107);
    goto LABEL_28;
  }
  if (CFEqual(a2, @"ConversationDetectEnable"))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    int v20 = *(unsigned __int8 *)(DerivedStorage + 108);
    goto LABEL_28;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014F8]))
  {
    long long v19 = (const void **)MEMORY[0x263EFFB40];
    int v20 = *(unsigned __int8 *)(DerivedStorage + 106);
LABEL_28:
    if (!v20) {
      long long v19 = (const void **)MEMORY[0x263EFFB38];
    }
LABEL_30:
    uint64_t v8 = *v19;
    goto LABEL_8;
  }
  long long v22 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEBUG)) {
    endpoint_CopyProperty_cold_1((uint64_t)a2, v22);
  }
  return 4294954509;
}

uint64_t endpoint_SetProperty(uint64_t a1, const void *a2, const __CFNumber *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F01500]))
  {
    BOOL valuePtr = 0;
    if (CFNumberGetValue(a3, kCFNumberIntType, &valuePtr))
    {
      v6 = +[BluetoothBridge sharedBluetoothBridge];
      uint64_t v7 = [v6 deviceFromIdentifier:DerivedStorage[5]];

      id v8 = objc_alloc_init(MEMORY[0x263EFEF28]);
      [v8 setListeningMode:valuePtr];
      uint64_t v9 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        BOOL v41 = valuePtr;
        __int16 v42 = 2112;
        id v43 = v7;
        _os_log_impl(&dword_227451000, v9, OS_LOG_TYPE_DEFAULT, "Set listening mode to %d for %@", buf, 0x12u);
      }
      id v10 = objc_alloc_init(MEMORY[0x263EFEF18]);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __endpoint_SetProperty_block_invoke;
      v37[3] = &unk_2648083E0;
      id v38 = v10;
      id v11 = v10;
      [v11 modifyDevice:v7 settings:v8 completion:v37];
    }
    else if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    {
      endpoint_SetProperty_cold_2();
    }
    return 0;
  }
  if (CFEqual(a2, @"ConversationDetectEnable"))
  {
    int Value = CFBooleanGetValue(a3);
    CFNumberType v13 = +[BluetoothBridge sharedBluetoothBridge];
    id v14 = [v13 deviceFromIdentifier:DerivedStorage[5]];

    [v14 setIdentifier:DerivedStorage[5]];
    id v15 = objc_alloc_init(MEMORY[0x263EFEF28]);
    id v16 = v15;
    if (Value) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    [v15 setConversationDetectConfig:v17];
    CFAllocatorRef v18 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v41 = Value != 0;
      __int16 v42 = 2112;
      id v43 = v14;
      _os_log_impl(&dword_227451000, v18, OS_LOG_TYPE_DEFAULT, "Set conversationDetect mode to %d for %@", buf, 0x12u);
    }
    id v19 = objc_alloc_init(MEMORY[0x263EFEF18]);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __endpoint_SetProperty_block_invoke_67;
    v35[3] = &unk_2648083E0;
    id v36 = v19;
    id v20 = v19;
    [v20 modifyDevice:v14 settings:v16 completion:v35];
    long long v21 = v36;
    goto LABEL_13;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014B8]))
  {
    CFTypeID v23 = CFGetTypeID(a3);
    if (v23 != CFBooleanGetTypeID()) {
      return 0;
    }
    int v24 = CFBooleanGetValue(a3);
    id v14 = objc_alloc_init(MEMORY[0x263EFEF20]);
    [v14 setIdentifier:DerivedStorage[5]];
    id v16 = objc_alloc_init(MEMORY[0x263EFEF28]);
    [v16 setSpatialAudioAllowed:v24 != 0];
    __int16 v25 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v41 = v24 != 0;
      __int16 v42 = 2112;
      id v43 = v14;
      _os_log_impl(&dword_227451000, v25, OS_LOG_TYPE_DEFAULT, "Set setSpatialAudioAllowed mode to %d for %@", buf, 0x12u);
    }
    id v26 = objc_alloc_init(MEMORY[0x263EFEF18]);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __endpoint_SetProperty_block_invoke_69;
    v33[3] = &unk_2648083E0;
    id v34 = v26;
    id v20 = v26;
    [v20 modifyDevice:v14 settings:v16 completion:v33];
    long long v21 = v34;
LABEL_13:

    return 0;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F014D0]))
  {
    BOOL valuePtr = 0;
    if (!CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr))
    {
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
        endpoint_SetProperty_cold_1();
      }
      return 0;
    }
    id v14 = objc_alloc_init(MEMORY[0x263EFEF20]);
    [v14 setIdentifier:DerivedStorage[5]];
    id v16 = objc_alloc_init(MEMORY[0x263EFEF28]);
    [v16 setSpatialAudioMode:valuePtr];
    CFAllocatorRef v27 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v41 = valuePtr;
      __int16 v42 = 2112;
      id v43 = v14;
      _os_log_impl(&dword_227451000, v27, OS_LOG_TYPE_DEFAULT, "Set setSpatialAudioMode mode to %d for %@", buf, 0x12u);
    }
    id v28 = objc_alloc_init(MEMORY[0x263EFEF18]);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __endpoint_SetProperty_block_invoke_70;
    v31[3] = &unk_2648083E0;
    id v32 = v28;
    id v20 = v28;
    [v20 modifyDevice:v14 settings:v16 completion:v31];
    long long v21 = v32;
    goto LABEL_13;
  }
  if (CFEqual(a2, @"UserPickedRoute"))
  {
    CFTypeID v29 = CFGetTypeID(a3);
    if (v29 == CFBooleanGetTypeID())
    {
      BOOL v30 = CFBooleanGetValue(a3) != 0;
      endpoint_SetUserRouted(DerivedStorage, v30);
    }
    return 0;
  }
  return 4294954509;
}

void endpoint_SetUserRouted(void *a1, int a2)
{
  BOOL v4 = a2 != 0;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFEF20]);
  [v5 setIdentifier:a1[5]];
  id v6 = objc_alloc_init(MEMORY[0x263EFEF28]);
  [v6 setDeviceFlagsMask:0x400000];
  [v6 setDeviceFlagsValue:(unint64_t)v4 << 22];
  uint64_t v7 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = a2;
    _os_log_impl(&dword_227451000, v7, OS_LOG_TYPE_DEFAULT, "Set user routed: %d", buf, 8u);
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFEF18]);
  [v8 setDispatchQueue:*a1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __endpoint_SetUserRouted_block_invoke;
  v10[3] = &unk_264808408;
  char v13 = a2;
  id v11 = v8;
  CFAllocatorRef v12 = a1;
  id v9 = v8;
  [v9 modifyDevice:v5 settings:v6 completion:v10];
}

uint64_t endpoint_Activate(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v10 = *(id *)(DerivedStorage + 40);
  id v11 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(DerivedStorage + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v12;
    _os_log_impl(&dword_227451000, v11, OS_LOG_TYPE_DEFAULT, "Activate %@", buf, 0xCu);
  }
  if (a2 == 2)
  {
    endpoint_SetUserRouted((void *)DerivedStorage, 1);
    *(void *)(DerivedStorage + 80) = 2;
    CFRetain(a1);
    char v13 = +[BluetoothBridge sharedBluetoothBridge];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __endpoint_Activate_block_invoke;
    v16[3] = &__block_descriptor_64_e8_v12__0i8l;
    v16[4] = DerivedStorage;
    v16[5] = a4;
    v16[6] = a1;
    v16[7] = a5;
    [v13 connectToAddress:v10 completionHandler:v16];

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 4294950576;
  }

  return v14;
}

uint64_t endpoint_Deactivate(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  id v8 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = DerivedStorage[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v9;
    _os_log_impl(&dword_227451000, v8, OS_LOG_TYPE_DEFAULT, "Deactivate %@", buf, 0xCu);
  }
  endpoint_SetUserRouted(DerivedStorage, 0);
  if (a3)
  {
    id v11 = DerivedStorage[9];
    id v10 = DerivedStorage[10];
    CFRetain(a1);
    uint64_t v12 = *DerivedStorage;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __endpoint_Deactivate_block_invoke;
    block[3] = &__block_descriptor_72_e5_v8__0l;
    block[4] = a3;
    void block[5] = a1;
    void block[6] = v10;
    block[7] = v11;
    void block[8] = a4;
    dispatch_async(v12, block);
  }
  return 0;
}

void __endpoint_setConnected_block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  CMNotificationCenterGetDefaultLocalCenter();
  if (!v2)
  {
    CMNotificationCenterPostNotification();
    CMNotificationCenterGetDefaultLocalCenter();
  }
  CMNotificationCenterPostNotification();
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  BOOL v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t BluetoothEndpointCollectionCreate(const __CFAllocator *a1, __CFArray *a2, __CFArray *a3, __CFArray *a4, CFMutableArrayRef **a5)
{
  id v10 = (CFMutableArrayRef *)malloc_type_calloc(1uLL, 0x28uLL, 0xA0040B0408BC2uLL);
  if (v10
    && (v11 = dispatch_queue_create("BluetoothEndpointCollectionQueue", 0), (CFMutableArrayRef *v10 = (CFMutableArrayRef)v11) != 0)
    && (Mutable = CFArrayCreateMutable(a1, 0, 0), (void v10[4] = Mutable) != 0))
  {
    uint64_t result = 0;
    v10[1] = a2;
    v10[2] = a3;
    v10[3] = a4;
  }
  else
  {
    BluetoothEndpointCollectionDelete(v10);
    id v10 = 0;
    uint64_t result = 4294954510;
  }
  *a5 = v10;
  return result;
}

void BluetoothEndpointCollectionDelete(CFMutableArrayRef *a1)
{
  if (a1)
  {
    CFArrayRef v2 = a1[4];
    v5.length = CFArrayGetCount(v2);
    v5.location = 0;
    CFArrayApplyFunction(v2, v5, (CFArrayApplierFunction)collection_deleteApplier, a1);
    CFArrayRemoveAllValues(a1[4]);
    *a1 = 0;
    CFMutableArrayRef v3 = a1[4];
    if (v3) {
      CFRelease(v3);
    }
    free(a1);
  }
}

uint64_t BluetoothEndpointCollectionCopyAsCFArray(NSObject **a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  CFArrayRef v2 = *a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __BluetoothEndpointCollectionCopyAsCFArray_block_invoke;
  block[3] = &unk_2648084D8;
  block[4] = &v6;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __BluetoothEndpointCollectionCopyAsCFArray_block_invoke(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 32));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 48), Count, MEMORY[0x263EFFF70]);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    BOOL v3 = Count < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    CFIndex v4 = 0;
    do
    {
      ValueAtIndex = (const void **)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 40) + 32), v4);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *ValueAtIndex);
      ++v4;
    }
    while (Count != v4);
  }
}

uint64_t BluetoothEndpointCollectionUpdateEndpoint(NSObject **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  if (a3)
  {
    BOOL v3 = *a1;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = __BluetoothEndpointCollectionUpdateEndpoint_block_invoke;
    v6[3] = &unk_264808500;
    v6[6] = a2;
    v6[7] = a3;
    v6[4] = &v7;
    v6[5] = a1;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v8 + 6);
  }
  else
  {
    uint64_t v4 = 4294950586;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __BluetoothEndpointCollectionUpdateEndpoint_block_invoke(uint64_t a1)
{
  CFIndex v8 = -1;
  EntryForDescription = (const void **)collection_findEntryForDescription(*(void *)(a1 + 40), *(const __CFDictionary **)(a1 + 48), &v8);
  if (EntryForDescription)
  {
    BluetoothEndpointUpdateWithDescription(*EntryForDescription, *(const __CFDictionary **)(a1 + 48), *(unsigned char **)(a1 + 56));
  }
  else
  {
    CFTypeRef cf = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BluetoothEndpointCreateWithDescription((const __CFAllocator *)*MEMORY[0x263EFFB08], *(const __CFDictionary **)(a1 + 48), &cf);
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      BOOL v3 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
      if (v3)
      {
        uint64_t v4 = v3;
        *BOOL v3 = CFRetain(cf);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1 + 40) + 32), v4);
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void (**)(uint64_t, CFTypeRef, void))(v5 + 8);
        if (v6) {
          v6(v5, cf, *(void *)(v5 + 24));
        }
        **(unsigned char **)(a1 + 56) = 1;
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12786;
      }
      if (cf) {
        CFRelease(cf);
      }
    }
  }
}

const void *collection_findEntryForDescription(uint64_t a1, const __CFDictionary *a2, CFIndex *a3)
{
  CFTypeRef cf = 0;
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 32));
  int Value = CFDictionaryGetValue(a2, @"DeviceID");
  if (Value)
  {
    CFIndex v8 = Value;
    if (Count < 1)
    {
      ValueAtIndex = 0;
      CFIndex v9 = -1;
      if (!a3)
      {
LABEL_19:
        uint64_t v16 = BluetoothEndpointManagerLogComponent;
        if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEBUG)) {
          collection_findEntryForDescription_cold_2((uint64_t)ValueAtIndex, (uint64_t)v8, v16);
        }
        return ValueAtIndex;
      }
    }
    else
    {
      CFIndex v9 = 0;
      uint64_t v10 = *MEMORY[0x263F014D8];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v9);
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
        uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v13) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
        int v15 = *(void (**)(uint64_t, uint64_t, void, CFTypeRef *))(v14 + 48);
        if (v15) {
          v15(CMBaseObject, v10, 0, &cf);
        }
        if (cf && CFEqual(v8, cf)) {
          break;
        }
        if (Count == ++v9)
        {
          ValueAtIndex = 0;
          CFIndex v9 = -1;
          break;
        }
      }
      if (cf) {
        CFRelease(cf);
      }
      if (!a3) {
        goto LABEL_19;
      }
    }
    *a3 = v9;
    goto LABEL_19;
  }
  uint64_t v17 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    collection_findEntryForDescription_cold_1(v17);
  }
  return 0;
}

uint64_t BluetoothEndpointCollectionMarkEndpointForRemoval(NSObject **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  CFIndex v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  if (a3)
  {
    BOOL v3 = *a1;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = __BluetoothEndpointCollectionMarkEndpointForRemoval_block_invoke;
    v6[3] = &unk_264808528;
    v6[4] = &v7;
    v6[5] = a1;
    v6[6] = a2;
    v6[7] = a3;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v8 + 6);
  }
  else
  {
    uint64_t v4 = 4294950586;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __BluetoothEndpointCollectionMarkEndpointForRemoval_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFIndex v6 = -1;
  EntryForDescription = (const void **)collection_findEntryForDescription(*(void *)(a1 + 40), *(const __CFDictionary **)(a1 + 48), &v6);
  if (EntryForDescription)
  {
    BOOL v3 = EntryForDescription;
    uint64_t v4 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"DeviceID");
      *(_DWORD *)buf = 138412290;
      CFIndex v8 = Value;
      _os_log_impl(&dword_227451000, v4, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
    }
    collection_removeEntry(*(void *)(a1 + 40), v3, v6);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
}

void collection_removeEntry(uint64_t a1, const void **a2, CFIndex a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFIndex v6 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEBUG)) {
    collection_removeEntry_cold_1(v6);
  }
  uint64_t v14 = 0;
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = *(void (**)(uint64_t, void, void, const void **))(v9 + 48);
  if (v10)
  {
    v10(CMBaseObject, *MEMORY[0x263F01510], 0, &v14);
    dispatch_queue_t v11 = v14;
    if (v14)
    {
      uint64_t v12 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v11;
        _os_log_impl(&dword_227451000, v12, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
        dispatch_queue_t v11 = v14;
      }
      CFRelease(v11);
    }
  }
  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 32), a3);
  uint64_t v13 = *(void (**)(uint64_t, const void *, void))(a1 + 16);
  if (v13) {
    v13(a1, *a2, *(void *)(a1 + 24));
  }
  collection_destroyCollectionEntry(a2);
}

uint64_t BluetoothEndpointCollectionMarkAllEndpointsForRemoval(NSObject **a1)
{
  uint64_t v1 = *a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __BluetoothEndpointCollectionMarkAllEndpointsForRemoval_block_invoke;
  block[3] = &__block_descriptor_tmp_5;
  block[4] = a1;
  dispatch_sync(v1, block);
  return 0;
}

void __BluetoothEndpointCollectionMarkAllEndpointsForRemoval_block_invoke(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 32) + 32));
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      ValueAtIndex = (const void **)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 32), 0);
      collection_removeEntry(*(void *)(a1 + 32), ValueAtIndex, 0);
      --v3;
    }
    while (v3 > 1);
  }
}

void collection_destroyCollectionEntry(const void **a1)
{
  CFArrayRef v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_227451000, v2, OS_LOG_TYPE_INFO, "Destroy Collection entry", v7, 2u);
  }
  BluetoothEndpoint_Disassociate(*a1);
  unint64_t v3 = *a1;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  CFIndex v6 = *(void (**)(const void *))(v5 + 32);
  if (v6) {
    v6(v3);
  }
  if (*a1) {
    CFRelease(*a1);
  }
  free(a1);
}

uint64_t BluetoothEndpointManagerCreate(const __CFAllocator *a1, void *a2, const __CFDictionary *a3, uint64_t *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a2;
  os_log_t v8 = os_log_create("com.apple.bluetooth", "BTFigE");
  uint64_t v9 = (void *)BluetoothEndpointManagerLogComponent;
  BluetoothEndpointManagerLogComponent = (uint64_t)v8;

  if (a4)
  {
    if (staticManager)
    {
      int v10 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v27 = staticManager;
        _os_log_impl(&dword_227451000, v10, OS_LOG_TYPE_DEFAULT, "BluetoothEndpointManager %p already exists!", buf, 0xCu);
      }
      uint64_t v11 = 0;
      uint64_t v12 = staticManager;
LABEL_6:
      *a4 = v12;
      goto LABEL_15;
    }
    if (!v7)
    {
      id v7 = (id)MEMORY[0x263EF83A0];
      id v13 = MEMORY[0x263EF83A0];
    }
    FigEndpointManagerGetClassID();
    uint64_t v14 = CMDerivedObjectCreate();
    if (v14) {
      goto LABEL_12;
    }
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    dispatch_queue_t v16 = dispatch_queue_create("BluetoothEndpointManager", 0);
    uint64_t v17 = *(void **)(DerivedStorage + 8);
    *(void *)(DerivedStorage + 8) = v16;

    if (*(void *)(DerivedStorage + 8))
    {
      objc_storeStrong((id *)(DerivedStorage + 16), v7);
      *(void *)(DerivedStorage + 24) = CFRetain((CFTypeRef)*MEMORY[0x263F011C0]);
      uint64_t v14 = BluetoothEndpointCollectionCreate(a1, (__CFArray *)manager_endpointAddedCallback, (__CFArray *)manager_endpointRemovedCallback, 0, (CFMutableArrayRef **)(DerivedStorage + 32));
      if (!v14)
      {
        uint64_t v20 = +[BluetoothBridge sharedBluetoothBridge];
        long long v21 = *(void **)(DerivedStorage + 40);
        *(void *)(DerivedStorage + 40) = v20;

        [*(id *)(DerivedStorage + 40) setManager:0];
        if (!a3
          || !CFDictionaryGetValue(a3, @"TargetUserSession")
          || (CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a3, @"TargetUserSession"), CFBooleanGetValue(Value)))
        {
          [*(id *)(DerivedStorage + 40) setTargetUserSession:1];
        }
        CFTypeID v23 = (void *)BluetoothEndpointManagerLogComponent;
        if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = *(void **)(DerivedStorage + 40);
          __int16 v25 = v23;
          *(_DWORD *)buf = 134218240;
          uint64_t v27 = 0;
          __int16 v28 = 1024;
          int v29 = [v24 targetUserSession];
          _os_log_impl(&dword_227451000, v25, OS_LOG_TYPE_DEFAULT, "Created BluetoothEndpointManager %p with TargetUserSession: %d", buf, 0x12u);
        }
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        staticManager = 0;
        goto LABEL_6;
      }
LABEL_12:
      uint64_t v11 = v14;
      goto LABEL_13;
    }
    uint64_t v11 = 4294950585;
  }
  else
  {
    uint64_t v11 = 4294950586;
  }
LABEL_13:
  uint64_t v18 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    BluetoothEndpointManagerCreate_cold_1(v11, v18);
  }
LABEL_15:

  return v11;
}

void manager_endpointAddedCallback(uint64_t a1, uint64_t a2, const void *a3)
{
  CFTypeRef cf = 0;
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  CFAllocatorRef v4 = CFGetAllocator(a3);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  os_log_t v8 = *(void (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(v7 + 48);
  if (v8)
  {
    v8(CMBaseObject, *MEMORY[0x263F014E0], v4, &cf);
    if (cf) {
      CFRelease(cf);
    }
  }
}

void manager_endpointRemovedCallback(int a1, int a2, CFTypeRef cf)
{
  CFTypeRef cfa = 0;
  CFAllocatorRef v3 = CFGetAllocator(cf);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(v6 + 48);
  if (v7) {
    v7(CMBaseObject, *MEMORY[0x263F014E0], v3, &cfa);
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  if (cfa) {
    CFRelease(cfa);
  }
}

void BluetoothEndpointManagerHandleUpdateEvent(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BluetoothEndpointManagerHandleUpdateEvent_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = DerivedStorage;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v5, block);
}

void __BluetoothEndpointManagerHandleUpdateEvent_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v6 = 0;
  int updated = BluetoothEndpointCollectionUpdateEndpoint(*(NSObject ***)(*(void *)(a1 + 32) + 32), *(void *)(a1 + 40), (uint64_t)&v6);
  if (v6)
  {
    int v3 = updated;
    CFAllocatorRef v4 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 1024;
      int v10 = v3;
      _os_log_impl(&dword_227451000, v4, OS_LOG_TYPE_DEFAULT, "Update %@ err:%d", buf, 0x12u);
    }
    if (!v3) {
      manager_postEndpointsChangedNotification(*(const void **)(a1 + 48));
    }
  }
}

void manager_postEndpointsChangedNotification(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a1);
  int v3 = *(NSObject **)(DerivedStorage + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __manager_postEndpointsChangedNotification_block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = DerivedStorage;
  v4[5] = a1;
  dispatch_async(v3, v4);
}

void BluetoothEndpointManagerHandleRemove(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BluetoothEndpointManagerHandleRemove_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = DerivedStorage;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v5, block);
}

void __BluetoothEndpointManagerHandleRemove_block_invoke(uint64_t a1)
{
  char v2 = 0;
  BluetoothEndpointCollectionMarkEndpointForRemoval(*(NSObject ***)(*(void *)(a1 + 32) + 32), *(void *)(a1 + 40), (uint64_t)&v2);
  if (v2) {
    manager_postEndpointsChangedNotification(*(const void **)(a1 + 48));
  }
}

void BluetoothEndpointManagerHandleRemoveAllEvent(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v3 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227451000, v3, OS_LOG_TYPE_DEFAULT, "Handle Remove All Event", buf, 2u);
  }
  CFAllocatorRef v4 = *(NSObject **)(DerivedStorage + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __BluetoothEndpointManagerHandleRemoveAllEvent_block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = DerivedStorage;
  v5[5] = a1;
  dispatch_sync(v4, v5);
}

void __BluetoothEndpointManagerHandleRemoveAllEvent_block_invoke(uint64_t a1)
{
  BluetoothEndpointCollectionMarkAllEndpointsForRemoval(*(NSObject ***)(*(void *)(a1 + 32) + 32));
  char v2 = *(const void **)(a1 + 40);
  manager_postEndpointsChangedNotification(v2);
}

uint64_t manager_Invalidate()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __manager_Invalidate_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  return 0;
}

void manager_Finalize()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v1 = (void *)DerivedStorage[2];
  DerivedStorage[2] = 0;

  manager_Invalidate();
  char v2 = (void *)DerivedStorage[5];
  DerivedStorage[5] = 0;

  int v3 = (const void *)DerivedStorage[3];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[3] = 0;
  }
  CFAllocatorRef v4 = (void *)DerivedStorage[1];
  DerivedStorage[1] = 0;
}

CFTypeRef manager_CopyDebugDescription()
{
  return CFRetain(@"Bluetooth Endpoint Manager");
}

uint64_t manager_SetProperty()
{
  if (*(unsigned char *)CMBaseObjectGetDerivedStorage()) {
    return 4294950584;
  }
  else {
    return 0;
  }
}

uint64_t manager_SetDiscoveryMode(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __manager_SetDiscoveryMode_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a2;
  void block[5] = a1;
  void block[6] = DerivedStorage;
  dispatch_sync(v5, block);
  return 0;
}

void __manager_postEndpointsChangedNotification_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (manager_postEndpointsChangedNotification_previousEndpointsPresent)
  {
LABEL_2:
    if (BluetoothEndpointCollectionGetCount(*(NSObject ***)(*(void *)(a1 + 32) + 32))) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  if (!BluetoothEndpointCollectionGetCount(*(NSObject ***)(*(void *)(a1 + 32) + 32)))
  {
    if (!manager_postEndpointsChangedNotification_previousEndpointsPresent) {
      goto LABEL_8;
    }
    goto LABEL_2;
  }
LABEL_5:
  char v2 = (void *)BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(NSObject ***)(*(void *)(a1 + 32) + 32);
    CFAllocatorRef v4 = v2;
    int v9 = 67109120;
    int Count = BluetoothEndpointCollectionGetCount(v3);
    _os_log_impl(&dword_227451000, v4, OS_LOG_TYPE_DEFAULT, "Posting Endpoints Present Changed Notification #endpoints:%d", (uint8_t *)&v9, 8u);
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  manager_postEndpointsChangedNotification_previousEndpointsPresent ^= 1u;
LABEL_8:
  uint64_t v5 = (void *)BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = *(NSObject ***)(*(void *)(a1 + 32) + 32);
    uint64_t v7 = v5;
    int v8 = BluetoothEndpointCollectionGetCount(v6);
    int v9 = 67109120;
    int Count = v8;
    _os_log_impl(&dword_227451000, v7, OS_LOG_TYPE_DEFAULT, "Posting Available Endpoints Changed Notification #endpoints:%d", (uint8_t *)&v9, 8u);
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void manager_handleEndpointDescriptionChanged(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFRetain(a2);
  CFAllocatorRef v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __manager_handleEndpointDescriptionChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(v4, block);
}

void __manager_handleEndpointDescriptionChanged_block_invoke(uint64_t a1)
{
  manager_postEndpointsChangedNotification(*(const void **)(a1 + 32));
  char v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

uint64_t BluetoothEndpointStreamAudioCreate(int a1, CFTypeRef cf, void *a3)
{
  if (cf)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    uint64_t v7 = 4294950536;
    if (!a3 || v5 != TypeID) {
      return v7;
    }
  }
  else if (!a3)
  {
    return 4294950536;
  }
  FigEndpointStreamGetClassID();
  uint64_t v8 = CMDerivedObjectCreate();
  if (v8) {
    return v8;
  }
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  int v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("BluetoothEndpointStreamQueue", v10);
  DerivedStorage[1] = v11;
  if (!v11) {
    return 4294950575;
  }
  CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, @"Name");
  DerivedStorage[2] = Value;
  if (!Value) {
    return 4294950576;
  }
  CFRetain(Value);
  id v13 = CFDictionaryGetValue((CFDictionaryRef)cf, @"DeviceID");
  DerivedStorage[3] = v13;
  if (!v13) {
    return 4294950576;
  }
  CFRetain(v13);
  dispatch_queue_t v14 = dispatch_queue_create("BluetoothEndpointStreamAudio", 0);
  *uint64_t DerivedStorage = v14;
  if (!v14) {
    return 4294950535;
  }
  uint64_t v7 = 0;
  *a3 = 0;
  return v7;
}

void audioStream_Finalize()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __audioStream_Finalize_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  *(void *)(DerivedStorage + 8) = 0;
}

__CFString *audioStream_CopyDebugDescription(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppendFormat(Mutable, 0, @"<APEndpointStreamAudio %p '%@'>", a1, *(void *)(DerivedStorage + 16));
  return Mutable;
}

uint64_t audioStream_CopyProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  int v14 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a4)
  {
    uint64_t v7 = *(NSObject **)(DerivedStorage + 8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 0x40000000;
    v10[2] = __audioStream_CopyProperty_block_invoke;
    v10[3] = &unk_2648086E0;
    v10[6] = a4;
    v10[7] = DerivedStorage;
    void v10[4] = &v11;
    v10[5] = a2;
    dispatch_sync(v7, v10);
    uint64_t v8 = *((unsigned int *)v12 + 6);
  }
  else
  {
    uint64_t v8 = 4294950536;
    *((_DWORD *)v12 + 6) = -16760;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t audioStream_SetProperty()
{
  return 4294954512;
}

void endpoint_CopyProperty_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_227451000, a2, OS_LOG_TYPE_DEBUG, "Copy property %@ not supported", (uint8_t *)&v2, 0xCu);
}

void endpoint_CopyProperty_cold_2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_227451000, log, OS_LOG_TYPE_DEBUG, "Copy property %@ returns %@", (uint8_t *)&v4, 0x16u);
}

void endpoint_SetProperty_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Error setting spatial mode with a CFType != CFNumber", v2, v3, v4, v5, v6);
}

void endpoint_SetProperty_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Failed to get listening mode property value", v2, v3, v4, v5, v6);
}

void collection_findEntryForDescription_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_227451000, log, OS_LOG_TYPE_ERROR, "Find endpoint for a NULL address?", v1, 2u);
}

void collection_findEntryForDescription_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = "Didn't find an entry";
  if (a1) {
    uint64_t v3 = "Found an existing entry";
  }
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_227451000, log, OS_LOG_TYPE_DEBUG, "%{public}s for %@", (uint8_t *)&v4, 0x16u);
}

void collection_removeEntry_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_227451000, log, OS_LOG_TYPE_DEBUG, "Remove entry", v1, 2u);
}

void BluetoothEndpointManagerCreate_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_227451000, a2, OS_LOG_TYPE_ERROR, "Error creating Bluetooth Endpoint Manager 0x%x", (uint8_t *)v2, 8u);
}

OSStatus AudioObjectAddPropertyListenerBlock(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, dispatch_queue_t inDispatchQueue, AudioObjectPropertyListenerBlock inListener)
{
  return MEMORY[0x270EE4120](*(void *)&inObjectID, inAddress, inDispatchQueue, inListener);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x270EE4128](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioObjectGetPropertyDataSize(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *outDataSize)
{
  return MEMORY[0x270EE4130](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, outDataSize);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetEmpty()
{
  return MEMORY[0x270F23D60]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x270EE79D0]();
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x270EE7B80]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x270EE7B88]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x270EE7B90]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x270EE7BA0]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x270F23FB0]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x270F23FC0]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x270EE80B8]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x270EE81D8]();
}

uint64_t FigEndpointGetClassID()
{
  return MEMORY[0x270EE81E0]();
}

uint64_t FigEndpointManagerGetClassID()
{
  return MEMORY[0x270EE81F0]();
}

uint64_t FigEndpointStreamGetClassID()
{
  return MEMORY[0x270EE8200]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_testcancel(dispatch_block_t block)
{
  return MEMORY[0x270ED92A8](block);
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

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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