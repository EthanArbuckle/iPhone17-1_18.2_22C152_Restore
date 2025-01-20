uint64_t cVtdPOVleEtmSPBdy(uint64_t a1)
{
  uint64_t result;
  uint64_t (*v3)(uint64_t);
  uint64_t vars8;

  result = CMBaseObjectGetVTable();
  v3 = *(uint64_t (**)(uint64_t))(*(void *)(result + 16) + 8);
  if (v3)
  {
    return v3(a1);
  }
  return result;
}

uint64_t HtERfbh945Re3oy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 24);
  if (!v12) {
    return 4294954514;
  }
  return v12(a1, a2, a3, a4, a5, a6);
}

uint64_t Gnf6vZyAVLNQta0BwK_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 4294954786;
  }
  sub_210B097B8();
  uint64_t v4 = CMDerivedObjectCreate();
  if (v4) {
    return v4;
  }
  else {
    return 4294954785;
  }
}

void sub_210B063A0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  sub_210B08138(DerivedStorage);
}

CFStringRef sub_210B063C8(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = sub_210B087CC(DerivedStorage + 72);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v5 = CFGetRetainCount(a1);
  CFStringRef v6 = CFStringCreateWithFormat(v4, 0, @"[AUCHDCPMonitor(Barney) %p retain count %d]\n%@", a1, v5, v3);
  if (v3) {
    CFRelease(v3);
  }
  return v6;
}

uint64_t sub_210B0644C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B08798(DerivedStorage);
}

uint64_t sub_210B06474()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B087B0(DerivedStorage);
}

uint64_t sub_210B0649C(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, unsigned char *a5, _DWORD *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = sub_210B081A0(DerivedStorage, a2, a3, a4, a5, 0);
  if (a6)
  {
    if (!result) {
      *a6 = ++dword_26ABEB270;
    }
  }
  return result;
}

uint64_t sub_210B06514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B086E4(DerivedStorage, a2, a3);
}

uint64_t sub_210B06554(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  *a3 = 4;
  if (a4) {
    *a4 = ++dword_26776F1F0;
  }
  return 0;
}

uint64_t sub_210B0657C()
{
  return 0;
}

void sub_210B06584(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v5)
  {
    CFStringRef v6 = (const void *)v5;
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    sub_210B076B4(DerivedStorage);
    if (*(void *)(DerivedStorage + 136))
    {
      int v15 = 0;
      v8 = *(void (**)(uint64_t, int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v8) {
        v8(a1, &v15);
      }
      uint64_t block = *a3;
      LODWORD(v17) = *((_DWORD *)a3 + 2);
      CFRetain(v6);
      v9 = *(NSObject **)(DerivedStorage + 32);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 0x40000000;
      v11[2] = sub_210B06A28;
      v11[3] = &unk_26418A300;
      int v12 = v15;
      int v14 = v17;
      uint64_t v13 = block;
      v11[4] = DerivedStorage;
      v11[5] = v6;
      dispatch_async(v9, v11);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v17 = 0x40000000;
    v18 = sub_210B06ACC;
    v19 = &unk_26418A320;
    v20 = v6;
    dispatch_async(global_queue, &block);
  }
}

void sub_210B066E4(uint64_t a1)
{
  cStr = 0;
  CFStringRef v2 = 0;
  if (!sub_210B1563C((uint64_t)&cStr) && cStr)
  {
    CFStringRef v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
    sub_210B0CE88((uint64_t)cStr);
  }
  (*(void (**)(void, void, void, void, void, void, CFStringRef))(*(void *)(a1 + 32) + 120))(*(void *)(*(void *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(*(void *)(a1 + 32) + 72), 0, *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), v2);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B06ACC;
  block[3] = &unk_26418A320;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void sub_210B067D8(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v6 = FigCFWeakReferenceHolderCopyReferencedObject();
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  if (v6)
  {
    sub_210B079D0(DerivedStorage, a1, a2, a3);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_210B06ACC;
    block[3] = &unk_26418A320;
    block[4] = v6;
    dispatch_async(global_queue, block);
  }
}

void sub_210B06890(uint64_t a1)
{
  cStr = 0;
  CFStringRef v2 = 0;
  if (!sub_210B0720C((uint64_t)&cStr) && cStr)
  {
    CFStringRef v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
    sub_210B0724C((uint64_t)cStr);
  }
  (*(void (**)(void, void, void, void, void, void, CFStringRef))(*(void *)(a1 + 32) + 120))(*(void *)(*(void *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(*(void *)(a1 + 32) + 72), 0, 0, *(unsigned int *)(a1 + 52), v2);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B06ACC;
  block[3] = &unk_26418A320;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void sub_210B06984(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void))(*(void *)(a1 + 32) + 136))(*(void *)(*(void *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
  uint64_t v2 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B06ACC;
  block[3] = &unk_26418A320;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_210B06A28(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void))(*(void *)(a1 + 32) + 136))(*(void *)(*(void *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
  uint64_t v2 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B06ACC;
  block[3] = &unk_26418A320;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_210B06ACC(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_210B06ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = 4294951836;
  if (a2 && a1 && a6)
  {
    sub_210B09F48();
    uint64_t v7 = CMDerivedObjectCreate();
    if (v7) {
      return v7;
    }
    else {
      return 4294951835;
    }
  }
  return v6;
}

void sub_210B06D08()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = CMBaseObjectGetDerivedStorage();
  uint64_t v2 = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = *(NSObject **)(v2 + 64);
  if (v3)
  {
    dispatch_source_cancel(v3);
    CFAllocatorRef v4 = *(NSObject **)(v2 + 64);
    if (v4)
    {
      dispatch_release(v4);
      *(void *)(v2 + 64) = 0;
    }
  }
  uint64_t v5 = *(NSObject **)(v2 + 72);
  if (v5)
  {
    dispatch_release(v5);
    *(void *)(v2 + 72) = 0;
  }
  sub_210B0A154(v1);
  uint64_t v6 = *(const void **)(DerivedStorage + 48);
  if (v6)
  {
    CFRelease(v6);
  }
}

CFStringRef sub_210B06DAC(const void *a1)
{
  return sub_210B0A0F4(a1, @"GPO");
}

uint64_t sub_210B06DB8(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0A1C4(DerivedStorage, a2);
}

uint64_t sub_210B06DF0(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0A1E8(DerivedStorage, a2);
}

uint64_t sub_210B06E28(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, unsigned char *a6)
{
  if (!CMBaseObjectGetDerivedStorage()) {
    return 4294951836;
  }
  CMBaseObjectGetDerivedStorage();
  IOMobileFramebufferGetProtectionOptions();
  if (a2) {
    *a2 = 2;
  }
  if (a4) {
    *a4 = 2;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t result = 0;
  if (a6) {
    *a6 = 1;
  }
  return result;
}

void sub_210B06EF4(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void sub_210B06F00()
{
  uint64_t v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    uint64_t v3 = CMBaseObjectGetDerivedStorage();
    CMBaseObjectGetDerivedStorage();
    block[0] = 0;
    IOMobileFramebufferGetProtectionOptions();
    if (*(void *)(v3 + 56))
    {
      *(void *)(v3 + 56) = 0;
      sub_210B09FC0(DerivedStorage, -469794786);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_210B06FF0;
    block[3] = &unk_26418A378;
    block[4] = v1;
    dispatch_async(global_queue, block);
  }
}

void sub_210B06FF0(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t AUCWirelessHDCPSessionManagerGetHDCPCapabilityOfDevice(unsigned char *a1)
{
  uint64_t MatchingIOAVObjectOfType = __IOAVCopyFirstMatchingIOAVObjectOfType();
  if (!MatchingIOAVObjectOfType) {
    return 4294893562;
  }
  uint64_t v3 = (const void *)MatchingIOAVObjectOfType;
  IOAVServiceGetContentProtectionCapabilities();
  *a1 = *MEMORY[0x263EFFB38];
  CFRelease(v3);
  return 0;
}

uint64_t AUCWirelessHDCPSessionManagerGetProtectionBitsOfDisplay(int a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t ProtectionOptions = 4294893563;
  CFTypeRef cf = 0;
  uint64_t v18 = 0;
  uint64_t v5 = (void *)[MEMORY[0x263F15778] displays];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 displayId] == a1)
        {
          if ([v10 deviceName])
          {
            uint64_t v11 = IOMobileFramebufferOpenByName();
            if (v11)
            {
              uint64_t ProtectionOptions = v11;
            }
            else
            {
              uint64_t ProtectionOptions = IOMobileFramebufferGetProtectionOptions();
              if (!ProtectionOptions) {
                *a2 = v18;
              }
            }
          }
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
  if (cf) {
    CFRelease(cf);
  }
  return ProtectionOptions;
}

uint64_t sub_210B07210(int a1, void *a2)
{
  if (a1 != 1) {
    return sub_210B154F8(a1, (uint64_t)a2);
  }
  *a2 = &unk_26776F1B0;
  return 0;
}

uint64_t sub_210B07230(void *a1)
{
  if (a1 == &unk_26776F1B0) {
    return 0;
  }
  else {
    return sub_210B0D254((uint64_t)a1);
  }
}

uint64_t sub_210B07250(void *a1, uint64_t a2, _DWORD *a3)
{
  if (a1 != &unk_26776F1B0) {
    return sub_210B0BD0C((uint64_t)a1, a2, (uint64_t)a3);
  }
  if (a2)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(_DWORD *)a2 = 1346585672;
    *(unsigned char *)(a2 + 4) = 1;
    *(_WORD *)(a2 + 14) = 0;
  }
  *a3 = 16;
  return 0;
}

uint64_t sub_210B07294(void *a1, uint64_t a2, int a3, _DWORD *a4)
{
  if (a1 != &unk_26776F1B0) {
    return sub_210B153B8((uint64_t)a1, a2, a3, (uint64_t)a4);
  }
  *a4 = bswap32(*(_DWORD *)(a2 + 8));
  if (*(unsigned char *)(a2 + 12)) {
    return -43000 - *(unsigned __int8 *)(a2 + 12);
  }
  else {
    return 0;
  }
}

uint64_t sub_210B072CC(uint64_t result, int a2)
{
  if (!result && a2 == 1) {
    return 1;
  }
  if (!result && a2 == 2) {
    return 2;
  }
  if (result == 1 && a2 == 2 || (result - 1) <= 1 && a2 == 1) {
    return 1;
  }
  if (result == 2 && a2 == 2) {
    return 2;
  }
  if (a2) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = result == 0;
  }
  if (v2) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t sub_210B07334(uint64_t result, int a2)
{
  if ((a2 - 2) < 2)
  {
    if (result <= 1) {
      return 1;
    }
    else {
      return result;
    }
  }
  else if (a2 == 4 || a2 == 1)
  {
    return 2;
  }
  return result;
}

uint64_t sub_210B07364(uint64_t result, int a2)
{
  if (a2 == 2)
  {
    if ((int)result <= 2) {
      return 2;
    }
    else {
      return result;
    }
  }
  else if (a2 == 1)
  {
    if ((int)result <= 1) {
      return 1;
    }
    else {
      return result;
    }
  }
  return result;
}

double sub_210B07390(uint64_t a1)
{
  BOOL v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 16);
  if (v3) {
    CFRelease(v3);
  }
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void sub_210B073D0(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v2)
    {
      uint64_t v3 = *(NSObject **)(a1 + 32);
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = sub_210B07464;
      v4[3] = &unk_26418A398;
      v4[4] = a1;
      v4[5] = v2;
      dispatch_async(v3, v4);
    }
  }
}

void sub_210B07464(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 80);
  if (v3)
  {
    unint64_t v4 = *(unsigned int *)(v2 + 76);
    if (v4)
    {
      unint64_t v5 = 0;
      uint64_t v6 = (uint64_t *)(v3 + 16);
      char v7 = 1;
      do
      {
        uint64_t v8 = *v6;
        if (*v6)
        {
          LOBYTE(block[0]) = 0;
          v9 = *(unsigned int (**)(uint64_t, void *))(*(void *)(CMBaseObjectGetVTable() + 16) + 32);
          if (v9 && !v9(v8, block))
          {
            if (v7) {
              BOOL v10 = LOBYTE(block[0]) == 0;
            }
            else {
              BOOL v10 = 1;
            }
            char v7 = !v10;
          }
          unint64_t v4 = *(unsigned int *)(v2 + 76);
        }
        ++v5;
        v6 += 4;
      }
      while (v5 < v4);
      if (!v7) {
        goto LABEL_48;
      }
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  uint64_t v11 = *(void *)(v2 + 96);
  if (!v11) {
    goto LABEL_33;
  }
  unint64_t v12 = *(unsigned int *)(v2 + 88);
  if (!v12) {
    goto LABEL_33;
  }
  unint64_t v13 = 0;
  long long v14 = (uint64_t *)(v11 + 16);
  char v15 = 1;
  do
  {
    uint64_t v16 = *v14;
    if (*v14)
    {
      LOBYTE(block[0]) = 0;
      uint64_t v17 = *(unsigned int (**)(uint64_t, void *))(*(void *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v17 && !v17(v16, block))
      {
        if (v15) {
          BOOL v18 = LOBYTE(block[0]) == 0;
        }
        else {
          BOOL v18 = 1;
        }
        char v15 = !v18;
      }
      unint64_t v12 = *(unsigned int *)(v2 + 88);
    }
    ++v13;
    v14 += 4;
  }
  while (v13 < v12);
  if (v15)
  {
    uint64_t v2 = *(void *)(a1 + 32);
LABEL_33:
    ++*(_DWORD *)(v2 + 48);
    uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    uint64_t v20 = *(void *)(a1 + 32);
    *(void *)(v20 + 40) = UpTimeNanoseconds;
    uint64_t v21 = *(void *)(v20 + 80);
    if (v21 && *(_DWORD *)(v20 + 76))
    {
      unint64_t v22 = 0;
      v23 = (uint64_t *)(v21 + 16);
      do
      {
        uint64_t v24 = *v23;
        if (*v23)
        {
          v25 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16) + 40);
          if (v25) {
            v25(v24);
          }
        }
        ++v22;
        v23 += 4;
      }
      while (v22 < *(unsigned int *)(v20 + 76));
      uint64_t v20 = *(void *)(a1 + 32);
    }
    uint64_t v26 = *(void *)(v20 + 96);
    if (v26 && *(_DWORD *)(v20 + 88))
    {
      unint64_t v27 = 0;
      v28 = (uint64_t *)(v26 + 16);
      do
      {
        uint64_t v29 = *v28;
        if (*v28)
        {
          v30 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16) + 40);
          if (v30) {
            v30(v29);
          }
        }
        ++v27;
        v28 += 4;
      }
      while (v27 < *(unsigned int *)(v20 + 88));
    }
  }
LABEL_48:
  uint64_t v31 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210B08A4C;
  block[3] = &unk_26418A3D8;
  block[4] = v31;
  dispatch_async(global_queue, block);
}

void sub_210B076B4(uint64_t a1)
{
  if (qword_26ABEB220 == -1)
  {
    if (!a1) {
      return;
    }
  }
  else
  {
    dispatch_once(&qword_26ABEB220, &unk_26C314120);
    if (!a1) {
      return;
    }
  }
  uint64_t v2 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    uint64_t v3 = v2;
    if (*(_DWORD *)(a1 + 8) && *(void *)(a1 + 16))
    {
      CFRetain(v2);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_210B0793C;
      block[3] = &unk_26418A398;
      block[4] = a1;
      void block[5] = v3;
      dispatch_async((dispatch_queue_t)qword_26ABEB228, block);
      unint64_t v4 = *(unsigned int *)(a1 + 76);
      if (v4)
      {
        unint64_t v5 = 0;
        int v6 = 0;
        unsigned int v7 = 0;
        uint64_t v8 = 16;
        do
        {
          uint64_t v9 = *(void *)(*(void *)(a1 + 80) + v8);
          if (v9)
          {
            int v16 = 0;
            BOOL v10 = *(void (**)(uint64_t, int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 64);
            if (v10) {
              v10(v9, &v16);
            }
            if ((v16 - 2) < 2)
            {
              if (v7 <= 1) {
                unsigned int v7 = 1;
              }
            }
            else if (v16 == 4 || v16 == 1)
            {
              unsigned int v7 = 2;
            }
            int v15 = 0;
            uint64_t v11 = *(void *)(*(void *)(a1 + 80) + v8);
            unint64_t v12 = *(void (**)(uint64_t, int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 72);
            if (v12) {
              v12(v11, &v15);
            }
            if (v6 <= 1) {
              int v13 = 1;
            }
            else {
              int v13 = v6;
            }
            if (v15 != 1) {
              int v13 = v6;
            }
            if (v15 == 2) {
              int v6 = 2;
            }
            else {
              int v6 = v13;
            }
            unint64_t v4 = *(unsigned int *)(a1 + 76);
          }
          ++v5;
          v8 += 32;
        }
        while (v5 < v4);
      }
      else
      {
        unsigned int v7 = 0;
        int v6 = 0;
      }
      if (v7 != *(_DWORD *)(a1 + 52) || v6 != *(_DWORD *)(a1 + 56))
      {
        *(_DWORD *)(a1 + 52) = v7;
        *(_DWORD *)(a1 + 56) = v6;
        CFRetain(v3);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = sub_210B0797C;
        v14[3] = &unk_26418A3D8;
        v14[4] = v3;
        dispatch_async((dispatch_queue_t)qword_26ABEB228, v14);
      }
    }
    CFRelease(v3);
  }
}

dispatch_queue_t sub_210B07910()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CoreAUC.ConnectionStatusChanged", 0);
  qword_26ABEB228 = (uint64_t)result;
  return result;
}

void sub_210B0793C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

void sub_210B0797C(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  uint64_t v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void sub_210B079D0(void *a1, uint64_t a2, int a3, uint64_t *a4)
{
  int v23 = 0;
  if (a1)
  {
    uint64_t v8 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v8)
    {
      uint64_t v9 = (const void *)v8;
      BOOL v10 = *(void (**)(uint64_t, int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v10) {
        v10(a2, &v23);
      }
      if (a3 > 1023)
      {
        if (a3 == 1024)
        {
          if (a1[20])
          {
            CFRetain(v9);
            uint64_t v11 = a1[4];
            v19[0] = MEMORY[0x263EF8330];
            v19[1] = 3221225472;
            v19[2] = sub_210B07D28;
            v19[3] = &unk_26418A3F8;
            int v20 = v23;
            v19[4] = a1;
            v19[5] = v9;
            unint64_t v12 = v19;
            goto LABEL_21;
          }
        }
        else
        {
          if (a3 != 2048)
          {
            if (a3 != 4096 || !a1[18]) {
              goto LABEL_22;
            }
            uint64_t v13 = *a4;
            CFRetain(v9);
            uint64_t v11 = a1[4];
            v14[0] = MEMORY[0x263EF8330];
            v14[1] = 3221225472;
            v14[2] = sub_210B07E60;
            v14[3] = &unk_26418A418;
            int v15 = v23;
            uint64_t v16 = v13;
            v14[4] = a1;
            void v14[5] = v9;
            unint64_t v12 = v14;
            goto LABEL_21;
          }
          if (a1[19])
          {
            CFRetain(v9);
            uint64_t v11 = a1[4];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = sub_210B07DC4;
            block[3] = &unk_26418A3F8;
            int v18 = v23;
            block[4] = a1;
            void block[5] = v9;
            unint64_t v12 = block;
            goto LABEL_21;
          }
        }
      }
      else
      {
        switch(a3)
        {
          case 1:
            sub_210B073D0((uint64_t)a1);
            break;
          case 2:
            sub_210B076B4((uint64_t)a1);
            break;
          case 4:
            CFRetain(v9);
            uint64_t v11 = a1[4];
            v21[0] = MEMORY[0x263EF8330];
            v21[1] = 3221225472;
            v21[2] = sub_210B07C54;
            v21[3] = &unk_26418A3F8;
            int v22 = v23;
            v21[4] = a1;
            v21[5] = v9;
            unint64_t v12 = v21;
LABEL_21:
            dispatch_async(v11, v12);
            break;
        }
      }
LABEL_22:
      CFRelease(v9);
    }
  }
}

void sub_210B07C54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = 80;
  if ((*(_DWORD *)(a1 + 48) & 0xFF00) == 0x100) {
    uint64_t v3 = 96;
  }
  uint64_t v4 = *(void *)(v2 + v3);
  if (v4)
  {
    sub_210B07390(v4 + (((unint64_t)*(unsigned int *)(a1 + 48) >> 11) & 0x1FFFE0));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  unint64_t v5 = *(void (**)(void, void))(v2 + 128);
  if (v5) {
    v5(*(void *)(v2 + 112), *(unsigned int *)(a1 + 48));
  }
  uint64_t v6 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210B08A4C;
  block[3] = &unk_26418A3D8;
  block[4] = v6;
  dispatch_async(global_queue, block);
}

void sub_210B07D28(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(a1 + 32) + 160))(*(void *)(*(void *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210B08A4C;
  block[3] = &unk_26418A3D8;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_210B07DC4(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(a1 + 32) + 152))(*(void *)(*(void *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210B08A4C;
  block[3] = &unk_26418A3D8;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_210B07E60(uint64_t a1)
{
  (*(void (**)(void, void, void, void))(*(void *)(a1 + 32) + 144))(*(void *)(*(void *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
  uint64_t v2 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210B08A4C;
  block[3] = &unk_26418A3D8;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_210B07F00(uint64_t a1, int a2)
{
  if (a1)
  {
    if (a2 == 1)
    {
      uint64_t v3 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_210B08008;
      block[3] = &unk_26418A3D8;
      block[4] = a1;
      dispatch_sync(v3, block);
      uint64_t v4 = *(NSObject **)(a1 + 32);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_210B080A0;
      v6[3] = &unk_26418A3D8;
      v6[4] = a1;
      dispatch_sync(v4, v6);
    }
    else
    {
      uint64_t v5 = a1 + 72;
      sub_210B08014(a1 + 72);
      sub_210B080AC(v5);
    }
  }
}

void sub_210B08008(uint64_t a1)
{
}

void sub_210B08014(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 8);
    if (v2)
    {
      unint64_t v3 = *(unsigned int *)(a1 + 4);
      if (v3)
      {
        unint64_t v4 = 0;
        uint64_t v5 = *(_OWORD **)(a1 + 8);
        do
        {
          long long v6 = v5[1];
          v7[0] = *v5;
          v7[1] = v6;
          if ((void)v6)
          {
            sub_210B07390((uint64_t)v7);
            unint64_t v3 = *(unsigned int *)(a1 + 4);
          }
          ++v4;
          v5 += 2;
        }
        while (v4 < v3);
        free(v2);
        *(void *)(a1 + 8) = 0;
        *(_DWORD *)(a1 + 4) = 0;
      }
    }
  }
}

void sub_210B080A0(uint64_t a1)
{
}

void sub_210B080AC(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 24);
    if (v2)
    {
      unint64_t v3 = *(unsigned int *)(a1 + 16);
      if (v3)
      {
        unint64_t v4 = 0;
        uint64_t v5 = *(_OWORD **)(a1 + 24);
        do
        {
          long long v6 = v5[1];
          v7[0] = *v5;
          v7[1] = v6;
          if ((void)v6)
          {
            sub_210B07390((uint64_t)v7);
            unint64_t v3 = *(unsigned int *)(a1 + 16);
          }
          ++v4;
          v5 += 2;
        }
        while (v4 < v3);
        free(v2);
        *(void *)(a1 + 24) = 0;
        *(_DWORD *)(a1 + 16) = 0;
      }
    }
  }
}

void sub_210B08138(uint64_t a1)
{
  sub_210B07F00(a1, 0);
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 32) = 0;
  }
  unint64_t v3 = *(NSObject **)(a1 + 64);
  if (v3)
  {
    dispatch_release(v3);
    *(void *)(a1 + 64) = 0;
  }
  if (*(void *)a1)
  {
    CFRelease(*(CFTypeRef *)a1);
    *(void *)a1 = 0;
  }
  unint64_t v4 = *(const void **)(a1 + 168);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 168) = 0;
  }
}

uint64_t sub_210B081A0(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, unsigned char *a5, _DWORD *a6)
{
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v6 = 4294954786;
  int v17 = 0;
  if (a5)
  {
    if (a1)
    {
      if (a3)
      {
        if (a4)
        {
          uint64_t v11 = *(NSObject **)(a1 + 32);
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = sub_210B0831C;
          v13[3] = &unk_26418A440;
          v13[8] = a2;
          v13[9] = a1;
          v13[4] = &v26;
          v13[5] = &v18;
          v13[6] = &v22;
          v13[7] = &v14;
          dispatch_sync(v11, v13);
          *a3 = *((_DWORD *)v27 + 6);
          *a4 = *((_DWORD *)v19 + 6);
          *a5 = *((unsigned char *)v23 + 24);
          uint64_t v6 = 0;
          if (a6) {
            *a6 = *((_DWORD *)v15 + 6);
          }
        }
      }
    }
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v6;
}

uint64_t sub_210B0831C(void *a1)
{
  uint64_t result = a1[8];
  v43 = a1;
  if (result && (uint64_t result = CFArrayGetCount((CFArrayRef)result)) != 0)
  {
    CFArrayRef v3 = (const __CFArray *)a1[8];
    if (v3
      && (uint64_t v4 = a1[9],
          uint64_t v5 = *(void *)(a1[5] + 8),
          uint64_t v6 = *(void *)(a1[6] + 8),
          (uint64_t result = CFArrayGetCount((CFArrayRef)a1[8])) != 0))
    {
      uint64_t v7 = result;
      if (result < 1)
      {
        int v25 = 0;
        int v10 = 4;
        char v11 = 1;
      }
      else
      {
        uint64_t v41 = v5;
        uint64_t v42 = v6;
        CFIndex v8 = 0;
        uint64_t v9 = 0;
        int v10 = 4;
        char v11 = 1;
        do
        {
          char v44 = v11;
          uint64_t v47 = 0;
          char v46 = 0;
          ValueAtIndex = CFArrayGetValueAtIndex(v3, v8);
          CFRetain(ValueAtIndex);
          if (ValueAtIndex)
          {
            unsigned int v45 = v9;
            uint64_t v13 = v7;
            if (*(_DWORD *)(v4 + 76))
            {
              uint64_t v14 = 0;
              unint64_t v15 = 0;
              do
              {
                uint64_t v16 = *(void *)(v4 + 80);
                int v17 = *(const void **)(v16 + v14 + 24);
                if (v17 && CFEqual(v17, ValueAtIndex))
                {
                  HIDWORD(v47) = 0;
                  uint64_t v18 = v16 + v14;
                  uint64_t v19 = *(void *)(v16 + v14 + 16);
                  uint64_t v20 = *(void (**)(uint64_t, char *, char *))(*(void *)(CMBaseObjectGetVTable() + 16) + 48);
                  if (v20) {
                    v20(v19, (char *)&v47 + 4, &v46);
                  }
                  LODWORD(v47) = 0;
                  uint64_t v21 = *(void *)(v18 + 16);
                  uint64_t v22 = *(void (**)(uint64_t, uint64_t *))(*(void *)(CMBaseObjectGetVTable() + 16) + 56);
                  if (v22) {
                    v22(v21, &v47);
                  }
                }
                ++v15;
                v14 += 32;
              }
              while (v15 < *(unsigned int *)(v4 + 76));
            }
            CFRelease(ValueAtIndex);
            uint64_t v7 = v13;
            uint64_t v9 = v45;
          }
          int v23 = 2;
          if (v10 == 2
            || HIDWORD(v47) == 2
            || (int v23 = 3, v10 == 3)
            || HIDWORD(v47) == 3
            || (int v23 = 0, !v10)
            || !HIDWORD(v47)
            || (int v23 = 1, v10 == 1)
            || HIDWORD(v47) == 1)
          {
            uint64_t result = sub_210B072CC(v9, v47);
            uint64_t v9 = result;
            char v11 = 1;
            int v10 = v23;
          }
          else
          {
            uint64_t result = sub_210B072CC(v9, v47);
            uint64_t v9 = result;
            if (v44) {
              BOOL v24 = v46 == 0;
            }
            else {
              BOOL v24 = 1;
            }
            char v11 = !v24;
            int v10 = 4;
          }
          ++v8;
        }
        while (v8 != v7);
        if (v10 == 4) {
          int v25 = v9;
        }
        else {
          int v25 = 0;
        }
        if (v10 == 1) {
          int v25 = v9;
        }
        uint64_t v5 = v41;
        uint64_t v6 = v42;
      }
      *(_DWORD *)(v5 + 24) = v25;
      *(unsigned char *)(v6 + 24) = v11;
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    uint64_t v26 = a1[9];
    uint64_t v27 = *(void *)(a1[6] + 8);
    unint64_t v28 = *(unsigned int *)(v26 + 76);
    if (!v28) {
      goto LABEL_73;
    }
    unint64_t v29 = 0;
    int v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = *(void *)(a1[5] + 8);
    int v10 = 4;
    char v33 = 1;
    uint64_t v34 = 16;
    do
    {
      uint64_t v35 = *(void *)(*(void *)(v26 + 80) + v34);
      if (v35)
      {
        char v46 = 0;
        HIDWORD(v47) = 0;
        v36 = *(void (**)(uint64_t, char *, char *))(*(void *)(CMBaseObjectGetVTable() + 16) + 48);
        if (v36) {
          v36(v35, (char *)&v47 + 4, &v46);
        }
        LODWORD(v47) = 0;
        v37 = *(void (**)(uint64_t, uint64_t *))(*(void *)(CMBaseObjectGetVTable() + 16) + 56);
        if (v37) {
          v37(v35, &v47);
        }
        int v38 = 2;
        if (v10 == 2
          || HIDWORD(v47) == 2
          || (int v38 = 3, v10 == 3)
          || HIDWORD(v47) == 3
          || (int v38 = 0, !v10)
          || !HIDWORD(v47)
          || (int v38 = 1, v10 == 1)
          || HIDWORD(v47) == 1)
        {
          uint64_t result = sub_210B072CC(v31, v47);
          uint64_t v31 = result;
          char v33 = 1;
        }
        else
        {
          uint64_t result = sub_210B072CC(v31, v47);
          uint64_t v31 = result;
          if (v33) {
            BOOL v39 = v46 == 0;
          }
          else {
            BOOL v39 = 1;
          }
          char v33 = !v39;
          int v38 = 4;
        }
        ++v30;
        unint64_t v28 = *(unsigned int *)(v26 + 76);
        int v10 = v38;
      }
      ++v29;
      v34 += 32;
    }
    while (v29 < v28);
    if (v30)
    {
      if (v10 == 4) {
        int v40 = v31;
      }
      else {
        int v40 = 0;
      }
      if (v10 == 1) {
        int v40 = v31;
      }
      *(_DWORD *)(v32 + 24) = v40;
    }
    else
    {
LABEL_73:
      int v10 = 0;
      char v33 = 1;
    }
    *(unsigned char *)(v27 + 24) = v33;
  }
  *(_DWORD *)(*(void *)(v43[4] + 8) + 24) = v10;
  *(_DWORD *)(*(void *)(v43[7] + 8) + 24) = *(_DWORD *)(v43[9] + 48);
  return result;
}

uint64_t sub_210B086E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3)
  {
    CFArrayRef v3 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_210B0876C;
    block[3] = &unk_26418A460;
    block[4] = a2;
    void block[5] = a1;
    void block[6] = a3;
    dispatch_sync(v3, block);
  }
  return 0;
}

void *sub_210B0876C(void *result)
{
  uint64_t v1 = (_DWORD *)result[4];
  if (v1) {
    _DWORD *v1 = *(_DWORD *)(result[5] + 52);
  }
  uint64_t v2 = (_DWORD *)result[6];
  if (v2) {
    *uint64_t v2 = *(_DWORD *)(result[5] + 56);
  }
  return result;
}

uint64_t sub_210B08798(uint64_t a1)
{
  if (a1) {
    ++*(_DWORD *)(a1 + 8);
  }
  return 0;
}

uint64_t sub_210B087B0(uint64_t a1)
{
  if (a1)
  {
    int v1 = *(_DWORD *)(a1 + 8);
    if (v1) {
      *(_DWORD *)(a1 + 8) = v1 - 1;
    }
  }
  return 0;
}

__CFString *sub_210B087CC(uint64_t a1)
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFArrayRef v3 = Mutable;
  if (*(_DWORD *)(a1 + 4))
  {
    uint64_t v4 = 0;
    uint64_t v5 = 16;
    do
    {
      uint64_t v6 = FigBaseObjectCopyDebugDescription();
      unint64_t v7 = v4 + 1;
      if (v6)
      {
        CFIndex v8 = (const void *)v6;
        if (v7 >= *(unsigned int *)(a1 + 4)) {
          CFStringAppendFormat(v3, 0, @"\tUpstreamConnection[%d]: %@", v4, v6);
        }
        else {
          CFStringAppendFormat(v3, 0, @"\tUpstreamConnection[%d]: %@\n", v4, v6);
        }
        CFRelease(v8);
      }
      v5 += 32;
      ++v4;
    }
    while (v7 < *(unsigned int *)(a1 + 4));
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, @"\tno upstream connections");
  }
  return v3;
}

uint64_t sub_210B088B0(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, int a5)
{
  *(void *)a1 = FigCFWeakReferenceHolderCreateWithReferencedObject();
  *(_DWORD *)(a1 + 72) = a5;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  *(_DWORD *)(a1 + 8) = 1;
  if (a4)
  {
    Value = CFDictionaryGetValue(a4, @"StartOnCreation");
    CFDictionaryRef v11 = (const __CFDictionary *)CFDictionaryGetValue(a4, @"DelegateHooks");
    CFDictionaryRef v12 = v11;
    if (Value == (const void *)*MEMORY[0x263EFFB38]) {
      *(_DWORD *)(a1 + 8) = 0;
    }
    if (v11)
    {
      CFTypeID v13 = CFGetTypeID(v11);
      if (v13 == CFDictionaryGetTypeID())
      {
        *(void *)(a1 + 112) = CFDictionaryGetValue(v12, @"DelegateHooks_Refcon");
        *(void *)(a1 + 120) = CFDictionaryGetValue(v12, @"DelegateHooks_DidInitialize");
        *(void *)(a1 + 128) = CFDictionaryGetValue(v12, @"DelegateHooks_WillUninitialize");
        *(void *)(a1 + 136) = CFDictionaryGetValue(v12, @"DelegateHooks_StatusDidChange");
        *(void *)(a1 + 144) = CFDictionaryGetValue(v12, @"DelegateHooks_DidReceiveMessage");
        *(void *)(a1 + 152) = CFDictionaryGetValue(v12, @"DelegateHooks_WillPowerDown");
        *(void *)(a1 + 160) = CFDictionaryGetValue(v12, @"DelegateHooks_DidPowerUp");
      }
    }
  }
  *(void *)(a1 + 48) = 1;
  *(_DWORD *)(a1 + 56) = 0;
  dispatch_queue_t v14 = dispatch_queue_create("com.apple.CoreAUC.monitorQueue", 0);
  *(void *)(a1 + 32) = v14;
  if (!v14) {
    return 4294954785;
  }
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.CoreAUC.upstreamConnectionQueue", 0);
  *(void *)(a1 + 64) = v15;
  if (v15) {
    return 0;
  }
  else {
    return 4294954785;
  }
}

void sub_210B08A4C(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_210B08A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (a8)
  {
    sub_210B0A320();
    uint64_t v9 = CMDerivedObjectCreate();
    if (v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 4294955072;
    }
  }
  else
  {
    uint64_t v11 = 4294955076;
  }
  *a8 = 0;
  return v11;
}

void sub_210B08BC0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = CMBaseObjectGetDerivedStorage();
  sub_210B0ACA0(v1, DerivedStorage + 96);
}

void sub_210B08C08(uint64_t a1, int a2)
{
  uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v6 = CMBaseObjectGetDerivedStorage();
  if (v4)
  {
    sub_210B0A398(a1, a2, v6, DerivedStorage + 96);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_210B08F70;
    block[3] = &unk_26418A480;
    block[4] = v4;
    dispatch_async(global_queue, block);
  }
}

void sub_210B08CCC(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = CMBaseObjectGetDerivedStorage();
  sub_210B0B850(v3, DerivedStorage + 96, a1, (uint64_t)sub_210B08BC0);
}

CFStringRef sub_210B08D24(const void *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(v2, 0, @"[UpstreamConnection(Framebuffer) %p retain count %d]", a1, v3);
}

uint64_t sub_210B08D74()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = CMBaseObjectGetDerivedStorage();
  return sub_210B0ADD8(v1, DerivedStorage + 96);
}

uint64_t sub_210B08DB8(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = (_DWORD *)CMBaseObjectGetDerivedStorage();
  return sub_210B0AF14(DerivedStorage, a2);
}

uint64_t sub_210B08DF0(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0AF40(DerivedStorage, a2);
}

uint64_t sub_210B08E28(uint64_t a1, unsigned char *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0AF9C(DerivedStorage, a2);
}

uint64_t sub_210B08E60()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B034(DerivedStorage);
}

uint64_t sub_210B08E88(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B044(DerivedStorage, a2, a3);
}

uint64_t sub_210B08EC8(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B134(DerivedStorage, a2);
}

uint64_t sub_210B08F00(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B204(DerivedStorage, a2);
}

uint64_t sub_210B08F38(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B2D4(DerivedStorage, a2);
}

void sub_210B08F70(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_210B08F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = 4294951836;
  if (a2 && a1 && a6)
  {
    sub_210B09F48();
    uint64_t v7 = CMDerivedObjectCreate();
    if (v7) {
      return v7;
    }
    else {
      return 4294951835;
    }
  }
  return v6;
}

void sub_210B09128(__CFRunLoopSource *a1, int a2)
{
  if (qword_26ABEB230 != -1) {
    dispatch_once(&qword_26ABEB230, &unk_26C314140);
  }
  FigEventWaitRelative();
  uint64_t v4 = (__CFRunLoop *)qword_26ABEB238;
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE88];
  if (a2)
  {
    CFRunLoopAddSource((CFRunLoopRef)qword_26ABEB238, a1, v5);
    FigEventSet();
  }
  else
  {
    CFRunLoopRemoveSource(v4, a1, v5);
  }
}

void sub_210B091D8()
{
  uint64_t v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v0)
  {
    CFAllocatorRef v2 = *(NSObject **)(DerivedStorage + 16);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 0x40000000;
    v3[2] = sub_210B0971C;
    v3[3] = &unk_26418A520;
    v3[4] = DerivedStorage;
    v3[5] = v0;
    dispatch_async(v2, v3);
  }
}

void sub_210B09268(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void sub_210B09274()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = CMBaseObjectGetDerivedStorage();
  CFAllocatorRef v2 = *(NSObject **)(DerivedStorage + 56);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(DerivedStorage + 56) = 0;
  }
  if (*(void *)(DerivedStorage + 48))
  {
    HDCPRunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetHDCPRunLoopSource();
    sub_210B09128(HDCPRunLoopSource, 0);
    uint64_t HotPlugRunLoopSource = IOMobileFramebufferGetHotPlugRunLoopSource();
    if (HotPlugRunLoopSource)
    {
      CFStringRef v5 = (__CFRunLoopSource *)HotPlugRunLoopSource;
      IOMobileFramebufferDisableHotPlugDetectNotifications();
      sub_210B09128(v5, 0);
    }
    CFRelease(*(CFTypeRef *)(DerivedStorage + 48));
  }
  sub_210B0A154(v1);
}

CFStringRef sub_210B09314(const void *a1)
{
  return sub_210B0A0F4(a1, @"Framebuffer");
}

uint64_t sub_210B09320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage) {
    return 4294951836;
  }
  uint64_t v6 = DerivedStorage;
  dispatch_retain(*(dispatch_object_t *)(DerivedStorage + 56));
  uint64_t v7 = *(void *)(v6 + 48);
  uint64_t v8 = *(void *)(v6 + 56);
  return MEMORY[0x270F3D410](v7, a2, a3, sub_210B0949C, v8);
}

uint64_t sub_210B093A0(uint64_t a1, uint64_t a2, void *a3)
{
  CMBaseObjectGetDerivedStorage();
  if (!a1 || *a3 < 0x10uLL) {
    return 4294951836;
  }
  uint64_t result = IOMobileFramebufferHDCPGetReply();
  if (result)
  {
    uint64_t result = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)a2 = 0x1000150434448;
    *(_DWORD *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 12) = 12;
    *(_WORD *)(a2 + 14) = 0;
    *a3 = 16;
  }
  return result;
}

uint64_t sub_210B0942C(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0A1C4(DerivedStorage, a2);
}

uint64_t sub_210B09464(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0A1E8(DerivedStorage, a2);
}

void sub_210B0949C(uint64_t a1, dispatch_queue_t queue, char a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = sub_210B09524;
  v4[3] = &unk_26418A4A0;
  v4[4] = a1;
  char v5 = a3;
  dispatch_sync(queue, v4);
  dispatch_release(queue);
}

void sub_210B09524(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  dispatch_get_specific("UserClientInstance");
  uint64_t v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v2)
  {
    if (v1) {
      sub_210B09FC0(DerivedStorage, -469794786);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_210B095D4;
    block[3] = &unk_26418A4C0;
    block[4] = v2;
    dispatch_async(global_queue, block);
  }
}

void sub_210B095D4(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_210B095E4()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"com.apple.fig.ThreadCreateKey_AdoptVoucher", (const void *)*MEMORY[0x263EFFB38]);
  qword_26ABEB240 = FigEventCreate();
  qword_26ABEB248 = FigEventCreate();
  FigThreadCreate();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

uint64_t sub_210B096B8(uint64_t a1)
{
  return 0;
}

void sub_210B096DC()
{
  qword_26ABEB238 = (uint64_t)CFRunLoopGetCurrent();
  FigEventSet();
  while (1)
  {
    FigEventWaitRelative();
    CFRunLoopRun();
  }
}

void sub_210B0971C(uint64_t a1)
{
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 32))(*(void *)(a1 + 40), 3825172514, *(void *)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B095D4;
  block[3] = &unk_26418A4C0;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

uint64_t sub_210B097B8()
{
  return qword_26ABEB250;
}

uint64_t sub_210B097F0()
{
  uint64_t ClassID = CMBaseGetClassID();
  return MEMORY[0x270EE8008](&unk_26C314570, ClassID, 1, &qword_26ABEB250);
}

uint64_t AIp6m6e0e4SJ5Ql(uint64_t a1)
{
  uint64_t result = CMBaseObjectGetVTable();
  CFIndex v3 = *(uint64_t (**)(uint64_t))(*(void *)(result + 16) + 16);
  if (v3)
  {
    return v3(a1);
  }
  return result;
}

uint64_t vRThfplNqwR36hfR(uint64_t a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v4 = *(void (**)(uint64_t, char *, uint64_t *))(*(void *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4) {
    v4(a1, (char *)&v6 + 4, &v6);
  }
  if (a2) {
    *a2 = v6;
  }
  return HIDWORD(v6);
}

void tQN5x9ksL4jeZ(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t tpz1bPiDnP0U7Zm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v10 = 0;
  char v11 = 0;
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *, char *, uint64_t))(*(void *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 24);
  if (v8) {
    return v8(a1, a2, a3, &v10, &v11, a4);
  }
  else {
    return 4294954514;
  }
}

uint64_t MbgwT9G43SsdaVw(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v12 = 0;
  int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t))(*(void *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 24);
  if (v10) {
    return v10(a1, a2, a3, a4, &v12, a5);
  }
  else {
    return 4294954514;
  }
}

uint64_t PsZXJ2EK7ifxrtgc()
{
  return 1;
}

uint64_t UeKhmE9GuHm0LgF(uint64_t a1)
{
  int v2 = 0;
  return vRThfplNqwR36hfR(a1, &v2);
}

CFStringRef sub_210B09A18(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"[AUCHDCPMonitor %p]", a1);
}

uint64_t sub_210B09A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  if (a9)
  {
    sub_210B0A320();
    uint64_t v9 = CMDerivedObjectCreate();
    if (v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 4294955072;
    }
  }
  else
  {
    uint64_t v11 = 4294955076;
  }
  *a9 = 0;
  return v11;
}

void sub_210B09BF4()
{
  uint64_t v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v0)
  {
    uint64_t v2 = DerivedStorage;
    uint64_t v3 = *(void *)(DerivedStorage + 24);
    uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16)
                                                                                             + 64);
    if (v4)
    {
      if (!v4(v3, v2 + 48, v2 + 52, v2 + 56, v2 + 60, v2 + 65))
      {
        int v7 = 0;
        uint64_t v6 = *(void *)(v2 + 48);
        LOBYTE(v7) = *(unsigned char *)(v2 + 65);
        (*(void (**)(uint64_t, uint64_t, uint64_t *, void))(v2 + 72))(v0, 2, &v6, *(void *)(v2 + 80));
      }
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B09F38;
  block[3] = &unk_26418A590;
  block[4] = v0;
  dispatch_async(global_queue, block);
}

void sub_210B09CF4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  sub_210B0B850(DerivedStorage, 0, 0, 0);
}

CFStringRef sub_210B09D28(const void *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(v2, 0, @"[UpstreamConnection(GPO) %p retain count %d]", a1, v3);
}

uint64_t sub_210B09D78()
{
  return 0;
}

uint64_t sub_210B09D80(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = (_DWORD *)CMBaseObjectGetDerivedStorage();
  return sub_210B0AF14(DerivedStorage, a2);
}

uint64_t sub_210B09DB8(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0AF40(DerivedStorage, a2);
}

uint64_t sub_210B09DF0(uint64_t a1, unsigned char *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0AF9C(DerivedStorage, a2);
}

uint64_t sub_210B09E28()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B034(DerivedStorage);
}

uint64_t sub_210B09E50(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B044(DerivedStorage, a2, a3);
}

uint64_t sub_210B09E90(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B134(DerivedStorage, a2);
}

uint64_t sub_210B09EC8(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B204(DerivedStorage, a2);
}

uint64_t sub_210B09F00(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_210B0B2D4(DerivedStorage, a2);
}

void sub_210B09F38(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_210B09F48()
{
  return qword_26ABEB260;
}

uint64_t sub_210B09F80()
{
  uint64_t ClassID = CMBaseGetClassID();
  return MEMORY[0x270EE8008](&unk_26C3145B0, ClassID, 1, &qword_26ABEB260);
}

void sub_210B09FC0(uint64_t a1, int a2)
{
  if (a1)
  {
    uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v4)
    {
      char v5 = *(NSObject **)(a1 + 16);
      uint64_t v6 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = sub_210B0A05C;
      block[3] = &unk_26418A5B0;
      block[4] = a1;
      void block[5] = v4;
      int v8 = a2;
      dispatch_group_async(v6, v5, block);
    }
  }
}

void sub_210B0A05C(uint64_t a1)
{
  (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B0A310;
  block[3] = &unk_26418A5D0;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

CFStringRef sub_210B0A0F4(const void *a1, uint64_t a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(v4, 0, @"[UserClient(%@) %p retain count %d]", a2, a1, v5);
}

void sub_210B0A154(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    CFIndex v3 = *(NSObject **)(a1 + 24);
    if (v3)
    {
      dispatch_release(v3);
      *(void *)(a1 + 24) = 0;
    }
  }
  CFAllocatorRef v4 = *(NSObject **)(a1 + 16);
  if (v4)
  {
    dispatch_release(v4);
    *(void *)(a1 + 16) = 0;
  }
  CFIndex v5 = *(const void **)(a1 + 40);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 40) = 0;
  }
  if (*(void *)a1)
  {
    CFRelease(*(CFTypeRef *)a1);
    *(void *)a1 = 0;
  }
}

uint64_t sub_210B0A1C4(uint64_t a1, _DWORD *a2)
{
  if (!a1)
  {
    int v2 = 0;
    if (!a2) {
      return 0;
    }
    goto LABEL_3;
  }
  int v2 = *(_DWORD *)(a1 + 12);
  if (a2) {
LABEL_3:
  }
    *a2 = v2;
  return 0;
}

uint64_t sub_210B0A1E8(uint64_t a1, int *a2)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 12) - 3;
    if (v2 <= 5)
    {
      int v3 = dword_210B15E60[v2];
      if (!a2) {
        return 0;
      }
      goto LABEL_6;
    }
  }
  int v3 = 1;
  if (a2) {
LABEL_6:
  }
    *a2 = v3;
  return 0;
}

uint64_t sub_210B0A224(uint64_t a1, NSObject *a2, uint64_t a3, const void *a4, int a5, uint64_t a6)
{
  if (!a1) {
    return 4294951835;
  }
  uint64_t result = 4294951836;
  if (a2 && a3 && a4 && a6)
  {
    *(void *)a1 = FigCFWeakReferenceHolderCreateWithReferencedObject();
    *(_DWORD *)(a1 + 8) = a5;
    *(void *)(a1 + 16) = a2;
    dispatch_retain(a2);
    dispatch_group_t v12 = dispatch_group_create();
    *(void *)(a1 + 24) = v12;
    if (v12)
    {
      *(void *)(a1 + 32) = a3;
      CFTypeRef v13 = CFRetain(a4);
      uint64_t result = 0;
      *(void *)(a1 + 40) = v13;
    }
    else
    {
      return 4294951835;
    }
  }
  return result;
}

CFStringRef sub_210B0A2D0(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"[AUCHDCPMonitor %p]", a1);
}

void sub_210B0A310(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_210B0A320()
{
  return qword_26ABEB258;
}

uint64_t sub_210B0A358()
{
  uint64_t ClassID = CMBaseGetClassID();
  return MEMORY[0x270EE8008](&unk_26C314590, ClassID, 1, &qword_26ABEB258);
}

void sub_210B0A398(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    goto LABEL_63;
  }
  uint64_t v7 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v7)
  {
    switch(a2)
    {
      case -469794786:
        unint64_t v31 = 0;
        uint64_t v10 = FigCFWeakReferenceHolderCopyReferencedObject();
        if (!v10) {
          goto LABEL_55;
        }
        unint64_t v31 = *(unsigned int *)(a4 + 32);
        uint64_t v11 = *(void *)(a3 + 24);
        uint64_t v12 = *(void *)(a4 + 24);
        CFTypeRef v13 = *(unsigned int (**)(uint64_t, uint64_t, unint64_t *))(*(void *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 24);
        if (!v13 || v13(v11, v12, &v31))
        {
          int v14 = 0;
          int v15 = 0;
          LOBYTE(v16) = 0;
          LOBYTE(v17) = 1;
LABEL_54:
          sub_210B0A8D8(a3, a4, v15, v16, v14, v17);
LABEL_55:
          global_queue = dispatch_get_global_queue(0, 0);
          unint64_t block = MEMORY[0x263EF8330];
          uint64_t v33 = 0x40000000;
          uint64_t v34 = sub_210B0BC74;
          uint64_t v35 = &unk_26418A720;
          uint64_t v36 = v10;
          dispatch_async(global_queue, &block);
          goto LABEL_56;
        }
        uint64_t v30 = 0;
        uint64_t v18 = *(void *)(a3 + 24);
        uint64_t v19 = *(void (**)(uint64_t, uint64_t *))(*(void *)(CMBaseObjectGetVTable() + 16) + 40);
        if (v19)
        {
          v19(v18, &v30);
          int v20 = v30;
        }
        else
        {
          int v20 = 0;
        }
        uint64_t v21 = *(void *)(a4 + 24);
        int v22 = v31;
        int v23 = sub_210B0B9BC(v20, v21, v31);
        if (v23)
        {
          int v24 = v23;
          unsigned int v25 = 0;
        }
        else
        {
          int v24 = sub_210B07294(*(void **)(a4 + 16), v21, v22, (_DWORD *)&v30 + 1);
          unsigned int v25 = HIDWORD(v30);
        }
        if ((*(unsigned char *)(a3 + 69) & 0x10) != 0)
        {
          unint64_t block = __PAIR64__(v25, v24);
          (*(void (**)(uint64_t, uint64_t, unint64_t *, void))(a3 + 72))(v10, 4096, &block, *(void *)(a3 + 80));
          unsigned int v25 = HIDWORD(v30);
        }
        *(_DWORD *)(a4 + 36) = 0;
        if (v24 <= -43102)
        {
          if (v24 == -43103)
          {
            int v14 = 0;
            LOBYTE(v17) = 0;
            int v15 = 100;
            goto LABEL_53;
          }
          if (v24 != -43102) {
            goto LABEL_43;
          }
        }
        else
        {
          if (v24 != -43101)
          {
            if (v24 == -43011)
            {
              FigSignalErrorAt();
              if ((*(unsigned char *)(a3 + 68) & 4) != 0) {
                (*(void (**)(uint64_t, uint64_t, void, void))(a3 + 72))(v10, 4, 0, *(void *)(a3 + 80));
              }
              goto LABEL_55;
            }
            if (!v24)
            {
              if ((v25 & 0x200) != 0) {
                goto LABEL_52;
              }
              if ((v25 & 0x80) == 0)
              {
                int v26 = v25 & 0x28;
                if ((v25 & 0x10) != 0 && v26 == 40)
                {
                  int v14 = 1;
                  if ((v25 & 7) == 2)
                  {
                    if (((v25 >> 2) & 0x2000 | v25 & 0x4000 | (((v25 >> 13) & 1) << 15)) == 0x2000) {
                      int v14 = 2;
                    }
                    else {
                      int v14 = 1;
                    }
                  }
                  int v15 = 1;
                  goto LABEL_46;
                }
                if (v26 != 8)
                {
                  int v14 = 0;
                  if ((v25 & 8) != 0) {
                    int v15 = 2;
                  }
                  else {
                    int v15 = 4;
                  }
                  int v17 = (v25 & 8) >> 3;
                  goto LABEL_53;
                }
LABEL_52:
                int v14 = 0;
                LOBYTE(v17) = 1;
                int v15 = 3;
                goto LABEL_53;
              }
              int v15 = 1;
              int v14 = 2;
LABEL_46:
              LOBYTE(v17) = 1;
              goto LABEL_53;
            }
LABEL_43:
            int v14 = 0;
            LOBYTE(v17) = 1;
            int v15 = 2;
LABEL_53:
            int v16 = (v25 >> 8) & 1;
            goto LABEL_54;
          }
          sub_210B0BA30(a3, a4);
        }
        int v14 = 0;
        int v15 = 0;
        goto LABEL_46;
      case -469794785:
      case -469794782:
        *(void *)(a4 + 8) = 27500000000;
        int v8 = *(NSObject **)a4;
        if (*(void *)a4)
        {
          dispatch_time_t v9 = dispatch_time(0, 1900000000);
          dispatch_source_set_timer(v8, v9, *(void *)(a4 + 8), 0xA3E9AB80uLL);
        }
        goto LABEL_64;
      case -469794784:
        if (*(void *)(a4 + 16))
        {
          dispatch_suspend(*(dispatch_object_t *)a4);
          sub_210B0A894(a4);
          sub_210B0A8D8(a3, a4, 4, 0, 0, 1);
          if ((*(unsigned char *)(a3 + 69) & 8) != 0) {
            (*(void (**)(uint64_t, uint64_t, void, void))(a3 + 72))(v7, 2048, 0, *(void *)(a3 + 80));
          }
        }
        goto LABEL_64;
      case -469794783:
        if (!*(void *)(a4 + 16))
        {
          sub_210B0A8D8(a3, a4, 4, 0, 0, 0);
          *(void *)(a4 + 8) = 27500000000;
          if (*(void *)a4) {
            dispatch_source_set_timer(*(dispatch_source_t *)a4, 0, 0x66720B300uLL, 0xA3E9AB80uLL);
          }
          if (sub_210B0AC1C(a3, a4)) {
            dispatch_resume(*(dispatch_object_t *)a4);
          }
          if ((*(unsigned char *)(a3 + 69) & 4) != 0) {
            (*(void (**)(uint64_t, uint64_t, void, void))(a3 + 72))(v7, 1024, 0, *(void *)(a3 + 80));
          }
        }
        goto LABEL_64;
      default:
        goto LABEL_64;
    }
  }
  if (a2 == -469794786)
  {
LABEL_56:
    unint64_t v28 = *(NSObject **)(a3 + 16);
    if (v28) {
      dispatch_group_leave(v28);
    }
  }
  else
  {
LABEL_63:
    uint64_t v7 = 0;
  }
LABEL_64:
  unint64_t v29 = dispatch_get_global_queue(0, 0);
  unint64_t block = MEMORY[0x263EF8330];
  uint64_t v33 = 0x40000000;
  uint64_t v34 = sub_210B0BC74;
  uint64_t v35 = &unk_26418A720;
  uint64_t v36 = v7;
  dispatch_async(v29, &block);
}

void sub_210B0A894(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    sub_210B07230(v2);
    *(void *)(a1 + 16) = 0;
  }
  int v3 = *(void **)(a1 + 24);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
}

void sub_210B0A8D8(uint64_t a1, uint64_t a2, int a3, char a4, int a5, char a6)
{
  int v48 = 0;
  uint64_t v44 = 0;
  unsigned int v45 = &v44;
  uint64_t v46 = 0x2000000000;
  int v47 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2000000000;
  int v43 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2000000000;
  char v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2000000000;
  int v35 = 0;
  uint64_t v28 = 0;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = 0;
  uint64_t v24 = 0;
  unsigned int v25 = &v24;
  uint64_t v26 = 0x2000000000;
  char v27 = 0;
  uint64_t v12 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v12)
  {
    *((_DWORD *)v45 + 6) = *(_DWORD *)(a1 + 48);
    *((_DWORD *)v41 + 6) = *(_DWORD *)(a1 + 52);
    *((unsigned char *)v37 + 24) = *(unsigned char *)(a1 + 65);
    *((_DWORD *)v33 + 6) = a3;
    *((_DWORD *)v29 + 6) = a5;
    *((unsigned char *)v25 + 24) = a6;
    uint64_t v13 = *(void *)(a1 + 24);
    int v14 = *(void (**)(uint64_t, int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 40);
    if (v14) {
      v14(v13, &v48);
    }
    if (a3 == 100)
    {
      a5 = 0;
      a3 = 0;
      *((_DWORD *)v33 + 6) = 0;
      *((_DWORD *)v29 + 6) = 0;
      *((unsigned char *)v25 + 24) = 0;
      char v15 = 1;
    }
    else
    {
      char v15 = 0;
    }
    if (!*(unsigned char *)a1)
    {
      a3 = 4;
      *((_DWORD *)v33 + 6) = 4;
      a5 = 2;
      *((_DWORD *)v29 + 6) = 2;
      *((unsigned char *)v25 + 24) = 1;
    }
    int v16 = *(NSObject **)(a1 + 40);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 0x40000000;
    v18[2] = sub_210B0BABC;
    v18[3] = &unk_26418A700;
    char v22 = v15;
    v18[10] = a2;
    v18[11] = a1;
    v18[4] = &v32;
    v18[5] = &v44;
    char v23 = a4;
    v18[6] = &v28;
    v18[7] = &v40;
    v18[8] = &v24;
    v18[9] = &v36;
    int v19 = v48;
    int v20 = a3;
    int v21 = a5;
    dispatch_sync(v16, v18);
    if (*(unsigned char *)(a1 + 68)) {
      (*(void (**)(uint64_t, uint64_t, void, void))(a1 + 72))(v12, 1, 0, *(void *)(a1 + 80));
    }
    if ((*((_DWORD *)v33 + 6) != *((_DWORD *)v45 + 6)
       || *((_DWORD *)v29 + 6) != *((_DWORD *)v41 + 6)
       || *((unsigned __int8 *)v25 + 24) != *((unsigned __int8 *)v37 + 24))
      && (*(unsigned char *)(a1 + 68) & 2) != 0)
    {
      (*(void (**)(uint64_t, uint64_t, void, void))(a1 + 72))(v12, 2, 0, *(void *)(a1 + 80));
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B0BC74;
  block[3] = &unk_26418A720;
  block[4] = v12;
  dispatch_async(global_queue, block);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

BOOL sub_210B0AC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0;
  int v3 = 1;
  int v8 = 1;
  uint64_t v4 = *(void *)(a1 + 24);
  CFIndex v5 = *(void (**)(uint64_t, int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v5)
  {
    v5(v4, &v8);
    int v3 = v8;
  }
  int v6 = sub_210B07210(v3, &v9);
  if (!v6) {
    *(void *)(a2 + 16) = v9;
  }
  return v6 == 0;
}

void sub_210B0ACA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    CFIndex v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = sub_210B0AD30;
    v6[3] = &unk_26418A5F0;
    v6[4] = a2;
    void v6[5] = v4;
    dispatch_async(v5, v6);
  }
}

void sub_210B0AD30(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)v2) {
    dispatch_source_set_timer(*(dispatch_source_t *)v2, 0, *(void *)(v2 + 8), 0xA3E9AB80uLL);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B0BC74;
  block[3] = &unk_26418A720;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

uint64_t sub_210B0ADD8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_210B0AE88;
  block[3] = &unk_26418A618;
  void block[5] = a1;
  void block[6] = a2;
  block[4] = &v6;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_210B0AE88(uint64_t a1)
{
  int v4 = 0;
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 24);
  uint64_t v3 = *(void (**)(uint64_t, int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v3 || (v3(v2, &v4), v4 != 5))
  {
    if (sub_210B0AC1C(*(void *)(a1 + 40), *(void *)(a1 + 48))) {
      dispatch_resume(**(dispatch_object_t **)(a1 + 48));
    }
    else {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12223;
    }
  }
}

uint64_t sub_210B0AF14(_DWORD *a1, _DWORD *a2)
{
  if (!a1) {
    return 4294955076;
  }
  if (!a2) {
    return 0;
  }
  uint64_t result = 0;
  *a2 = *a1;
  return result;
}

uint64_t sub_210B0AF40(uint64_t a1, _DWORD *a2)
{
  if (a2)
  {
    *a2 = 0;
    if (a1)
    {
      uint64_t v3 = *(void *)(a1 + 24);
      if (v3)
      {
        int v4 = *(void (**)(uint64_t, _DWORD *))(*(void *)(CMBaseObjectGetVTable() + 16) + 40);
        if (v4) {
          v4(v3, a2);
        }
      }
    }
  }
  return 0;
}

uint64_t sub_210B0AF9C(uint64_t a1, unsigned char *a2)
{
  int v7 = 0;
  if (!a1) {
    return 4294955076;
  }
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    return 4294955074;
  }
  CFIndex v5 = *(void (**)(uint64_t, int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v5)
  {
    v5(v3, &v7);
    if (v7 == 5) {
      return 4294955075;
    }
  }
  uint64_t result = 0;
  if (a2) {
    *a2 = *(unsigned char *)(a1 + 64);
  }
  return result;
}

uint64_t sub_210B0B034(uint64_t a1)
{
  if (a1) {
    *(unsigned char *)(a1 + 64) = 0;
  }
  return 0;
}

uint64_t sub_210B0B044(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  if (a3) {
    *a3 = 0;
  }
  if (a1)
  {
    int v4 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_210B0B110;
    block[3] = &unk_26418A640;
    block[4] = &v7;
    void block[5] = a1;
    void block[6] = a3;
    dispatch_sync(v4, block);
  }
  if (a2) {
    *a2 = *((_DWORD *)v8 + 6);
  }
  _Block_object_dispose(&v7, 8);
  return 0;
}

void *sub_210B0B110(void *result)
{
  uint64_t v1 = result[5];
  *(_DWORD *)(*(void *)(result[4] + 8) + 24) = *(_DWORD *)(v1 + 48);
  uint64_t v2 = (unsigned char *)result[6];
  if (v2) {
    *uint64_t v2 = *(unsigned char *)(v1 + 65);
  }
  return result;
}

uint64_t sub_210B0B134(uint64_t a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  if (a1)
  {
    uint64_t v3 = *(NSObject **)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = sub_210B0B1F0;
    v5[3] = &unk_26418A668;
    v5[4] = &v6;
    v5[5] = a1;
    dispatch_sync(v3, v5);
  }
  if (a2) {
    *a2 = *((_DWORD *)v7 + 6);
  }
  _Block_object_dispose(&v6, 8);
  return 0;
}

uint64_t sub_210B0B1F0(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(*(void *)(result + 40) + 52);
  return result;
}

uint64_t sub_210B0B204(uint64_t a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  if (a1)
  {
    uint64_t v3 = *(NSObject **)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = sub_210B0B2C0;
    v5[3] = &unk_26418A690;
    v5[4] = &v6;
    v5[5] = a1;
    dispatch_sync(v3, v5);
  }
  if (a2) {
    *a2 = *((_DWORD *)v7 + 6);
  }
  _Block_object_dispose(&v6, 8);
  return 0;
}

uint64_t sub_210B0B2C0(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(*(void *)(result + 40) + 56);
  return result;
}

uint64_t sub_210B0B2D4(uint64_t a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  if (a1)
  {
    uint64_t v3 = *(NSObject **)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = sub_210B0B390;
    v5[3] = &unk_26418A6B8;
    v5[4] = &v6;
    v5[5] = a1;
    dispatch_sync(v3, v5);
  }
  if (a2) {
    *a2 = *((_DWORD *)v7 + 6);
  }
  _Block_object_dispose(&v6, 8);
  return 0;
}

uint64_t sub_210B0B390(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(*(void *)(result + 40) + 60);
  return result;
}

uint64_t sub_210B0B3A4(uint64_t a1, uint64_t a2, int a3, int a4, NSObject *a5, int a6, uint64_t a7, const void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (!a1) {
    return 4294951835;
  }
  uint64_t result = 4294951836;
  if (a5 && a7 && a8 && a10)
  {
    *(void *)(a1 + 8) = FigCFWeakReferenceHolderCreateWithReferencedObject();
    *(_DWORD *)a1 = a3;
    *(_DWORD *)(a1 + 4) = a4;
    *(void *)(a1 + 32) = a5;
    dispatch_retain(a5);
    *(_DWORD *)(a1 + 68) = a6;
    *(void *)(a1 + 72) = a7;
    *(void *)(a1 + 80) = CFRetain(a8);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.CoreAUC.statusQueue", 0);
    *(void *)(a1 + 40) = v21;
    if (v21)
    {
      dispatch_group_t v22 = dispatch_group_create();
      *(void *)(a1 + 16) = v22;
      if (v22)
      {
        if (!a2)
        {
LABEL_11:
          uint64_t result = 0;
          *(_OWORD *)(a1 + 48) = xmmword_210B15E80;
          *(unsigned char *)(a1 + 65) = 0;
          if (a11 && a12)
          {
            if (qword_26ABEB268 != -1) {
              dispatch_once(&qword_26ABEB268, &unk_26C314160);
            }
            uint64_t result = dword_26ABEB218;
            if (!dword_26ABEB218)
            {
              CMNotificationCenterGetDefaultLocalCenter();
              return FigNotificationCenterAddWeakListener();
            }
          }
          return result;
        }
        dispatch_source_t v23 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, *(dispatch_queue_t *)(a1 + 32));
        *(void *)a2 = v23;
        if (v23)
        {
          uint64_t v24 = (void *)CFRetain(*(CFTypeRef *)(a1 + 8));
          dispatch_set_context(*(dispatch_object_t *)a2, v24);
          dispatch_set_finalizer_f(*(dispatch_object_t *)a2, (dispatch_function_t)sub_210B0B5DC);
          unsigned int v25 = *(NSObject **)a2;
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 0x40000000;
          handler[2] = sub_210B0B5E8;
          handler[3] = &unk_26418A6D8;
          handler[4] = v24;
          handler[5] = a2;
          handler[6] = a1;
          dispatch_source_set_event_handler(v25, handler);
          *(void *)(a2 + 8) = 27500000000;
          dispatch_source_set_timer(*(dispatch_source_t *)a2, 0, 0x66720B300uLL, 0xA3E9AB80uLL);
          goto LABEL_11;
        }
      }
    }
    return 4294955072;
  }
  return result;
}

void sub_210B0B5DC(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void sub_210B0B5E8(uint64_t a1)
{
  uint64_t v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 40);
    if (!*(void *)(v4 + 16)) {
      goto LABEL_30;
    }
    uint64_t v5 = *(void *)(a1 + 48);
    unsigned int v22 = 0;
    uint64_t v6 = *(void *)(v5 + 24);
    if (!v6) {
      goto LABEL_30;
    }
    uint64_t v7 = *(void (**)(uint64_t, unsigned int *))(*(void *)(CMBaseObjectGetVTable() + 16) + 40);
    if (v7)
    {
      v7(v6, &v22);
      if (v22 <= 8 && ((1 << v22) & 0x1C8) != 0)
      {
        unsigned int v8 = *(_DWORD *)(v4 + 36);
        if (v8 >= 3)
        {
LABEL_18:
          sub_210B0BA30(v5, v4);
          goto LABEL_30;
        }
        if (v8)
        {
          int v9 = v8 + 1;
LABEL_29:
          *(_DWORD *)(v4 + 36) = v9;
          goto LABEL_30;
        }
      }
    }
    int v10 = *(void **)(v4 + 24);
    if (!v10)
    {
      *(_DWORD *)(v4 + 32) = 0;
      sub_210B07250(*(void **)(v4 + 16), 0, (_DWORD *)(v4 + 32));
      unsigned int v11 = *(_DWORD *)(v4 + 32);
      if (v22 == 3)
      {
        v11 *= 2;
        *(_DWORD *)(v4 + 32) = v11;
      }
      if (v11)
      {
        int v10 = malloc_type_malloc(v11, 0x2EB03CA7uLL);
        *(void *)(v4 + 24) = v10;
        if (!v10) {
          goto LABEL_30;
        }
      }
      else
      {
        int v10 = *(void **)(v4 + 24);
        if (!v10) {
          goto LABEL_30;
        }
      }
    }
    LODWORD(block[0]) = *(_DWORD *)(v4 + 32);
    int v12 = sub_210B07250(*(void **)(v4 + 16), (uint64_t)v10, block);
    if (v12 == -43101) {
      goto LABEL_18;
    }
    if (v12 || sub_210B0B9BC(v22, *(void *)(v4 + 24), LODWORD(block[0]))) {
      goto LABEL_30;
    }
    dispatch_group_enter(*(dispatch_group_t *)(v5 + 16));
    uint64_t v13 = *(void *)(v5 + 24);
    uint64_t v14 = *(void *)(v4 + 24);
    uint64_t v15 = LODWORD(block[0]);
    int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v16)
    {
      int v17 = v16(v13, v14, v15);
      if (!v17)
      {
        int v9 = 1;
        goto LABEL_29;
      }
      int v18 = v17;
      dispatch_group_leave(*(dispatch_group_t *)(v5 + 16));
      if (v18 == -536870181)
      {
        uint64_t v19 = *(void *)(v5 + 24);
        int v20 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v20) {
          v20(v19);
        }
      }
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(v5 + 16));
    }
    sub_210B0A8D8(v5, v4, 0, 0, 0, 1);
LABEL_30:
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_210B0BC74;
    block[3] = &unk_26418A720;
    block[4] = v3;
    dispatch_async(global_queue, block);
  }
}

void sub_210B0B850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 && a4)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
  }
  if (a2 && *(void *)a2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)a2);
    if (!*(void *)(a2 + 16)) {
      dispatch_resume(*(dispatch_object_t *)a2);
    }
    if (*(void *)a2)
    {
      dispatch_release(*(dispatch_object_t *)a2);
      *(void *)a2 = 0;
    }
  }
  if (*(void *)(a1 + 16))
  {
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    dispatch_group_wait(*(dispatch_group_t *)(a1 + 16), v6);
    uint64_t v7 = *(NSObject **)(a1 + 16);
    if (v7)
    {
      dispatch_release(v7);
      *(void *)(a1 + 16) = 0;
    }
  }
  unsigned int v8 = *(const void **)(a1 + 24);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(a1 + 24) = 0;
  }
  if (a2) {
    sub_210B0A894(a2);
  }
  int v9 = *(NSObject **)(a1 + 32);
  if (v9)
  {
    dispatch_release(v9);
    *(void *)(a1 + 32) = 0;
  }
  int v10 = *(NSObject **)(a1 + 40);
  if (v10)
  {
    dispatch_release(v10);
    *(void *)(a1 + 40) = 0;
  }
  unsigned int v11 = *(const void **)(a1 + 80);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a1 + 80) = 0;
  }
  int v12 = *(const void **)(a1 + 8);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(a1 + 8) = 0;
  }
  uint64_t v13 = *(const void **)(a1 + 88);
  if (v13)
  {
    CFRelease(v13);
    *(void *)(a1 + 88) = 0;
  }
}

CFStringRef sub_210B0B97C(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"[AUCHDCPMonitor %p]", a1);
}

uint64_t sub_210B0B9BC(int a1, uint64_t a2, unint64_t a3)
{
  if (a3 < 0x10 || a3 - 16 != bswap32(*(unsigned __int16 *)(a2 + 14)) >> 16) {
    return 4294924288;
  }
  if (*(_DWORD *)a2 != 1346585672) {
    return 4294924293;
  }
  if ((a1 - 1) > 7) {
    int v4 = -1;
  }
  else {
    int v4 = dword_210B15E90[a1 - 1];
  }
  if (v4 == *(unsigned __int8 *)(a2 + 4)) {
    return 0;
  }
  else {
    return 4294924294;
  }
}

BOOL sub_210B0BA30(uint64_t a1, uint64_t a2)
{
  sub_210B0A894(a2);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v5) {
    v5(v4);
  }
  *(_DWORD *)(a2 + 36) = 0;
  sub_210B0A8D8(a1, a2, 2, 0, 0, 0);
  return sub_210B0AC1C(a1, a2);
}

void sub_210B0BABC(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) - 1;
  if (v2 > 3) {
    uint64_t v3 = 1900000000;
  }
  else {
    uint64_t v3 = qword_210B15EB0[v2];
  }
  uint64_t v4 = *(void *)(a1 + 80);
  if (*(unsigned char *)(a1 + 108) || v3 != *(void *)(v4 + 8))
  {
    *(void *)(v4 + 8) = v3;
    uint64_t v5 = *(NSObject **)v4;
    if (*(void *)v4)
    {
      if (*(unsigned char *)(a1 + 108)) {
        int64_t v6 = 0;
      }
      else {
        int64_t v6 = v3;
      }
      dispatch_time_t v7 = dispatch_time(0, v6);
      dispatch_source_set_timer(v5, v7, v3, 0xA3E9AB80uLL);
    }
  }
  uint64_t v8 = *(void *)(a1 + 88);
  *(unsigned char *)(v8 + 64) = 1;
  int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if ((v9 | 2) != 2 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) | 2) == 2) {
    goto LABEL_13;
  }
  if (!v9)
  {
    uint64_t v10 = *(void *)(a1 + 80);
    unsigned int v12 = *(_DWORD *)(v10 + 40);
    if (v12 > 2) {
      goto LABEL_14;
    }
LABEL_24:
    *(_DWORD *)(v10 + 40) = v12 + 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
    uint64_t v8 = *(void *)(a1 + 88);
    goto LABEL_15;
  }
  if (v9 == 2)
  {
    if (*(_DWORD *)(a1 + 96) == 8) {
      unsigned int v11 = 10;
    }
    else {
      unsigned int v11 = 1;
    }
    uint64_t v10 = *(void *)(a1 + 80);
    unsigned int v12 = *(_DWORD *)(v10 + 40);
    if (v12 >= v11) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_13:
  uint64_t v10 = *(void *)(a1 + 80);
LABEL_14:
  *(_DWORD *)(v10 + 40) = 0;
LABEL_15:
  *(_DWORD *)(v8 + 48) = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(_DWORD *)(v8 + 56) = *(_DWORD *)(a1 + 100);
  *(_DWORD *)(v8 + 52) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  *(_DWORD *)(v8 + 60) = *(_DWORD *)(a1 + 104);
  *(unsigned char *)(v8 + 65) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void sub_210B0BC74(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_210B0BC84()
{
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t result = CMNotificationCenterAddListener();
  dword_26ABEB218 = result;
  if (!result)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    uint64_t result = CMNotificationCenterRegisterForBarrierSupport();
    dword_26ABEB218 = result;
  }
  return result;
}

uint64_t sub_210B0BCF4()
{
  return CMNotificationCenterPostNotification();
}

uint64_t sub_210B0BD0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v3 = (unint64_t)&v6[5] + (qword_26776F1B8 ^ qword_26776F1E8);
  qword_26776F1E8 = 266878957 * (v3 + 0xF8C5DD1A957CD00);
  qword_26776F1B8 = 266878957 * (v3 ^ 0xF073A22E56A83300);
  v6[0] = qword_26C3146F0;
  v6[1] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v7[0] = 111364217
        * ((((&vars0 - 24) | 0x5D3F2887) - ((&vars0 - 24) & 0x5D3F2887)) ^ 0x17D7BB89)
        - 250794294;
  LOBYTE(v3) = -46 * v3;
  char v4 = byte_210B163E0[byte_210B162E0[v3] ^ 0x44];
  uint64_t v8 = v6;
  ((void (*)(_DWORD *))*(&off_26C3145D0 + (v3 ^ v4) + 7))(v7);
  return v7[1];
}

void sub_210B0BE4C(uint64_t a1)
{
  __asm { BRAA            X8, X17 }
}

void sub_210B0BED8()
{
  *(_DWORD *)(v0 + 4) = -43002;
}

uint64_t sub_210B0CE88(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v1 = (unint64_t)&v5[qword_26776F1D0 + qword_26776F1B8];
  qword_26776F1D0 = (266878957 * v1) ^ 0xF073A22E56A83300;
  qword_26776F1B8 = 266878957 * (v1 ^ 0xF073A22E56A83300);
  unint64_t v2 = 462267737
     * ((-2 - ((~(unint64_t)&v6 | 0xDA0EC6D8DB4E39A5) + ((unint64_t)&v6 | 0x25F1392724B1C65ALL))) ^ 0x873B4B35E92132E2);
  uint64_t v7 = a1;
  unint64_t v8 = v2 ^ (unint64_t)off_26C314610;
  LOBYTE(v1) = -46 * v1;
  char v3 = byte_210B163E0[byte_210B162E0[v1] ^ 0xCC];
  int v6 = 1995507721 - v2;
  ((void (*)(int *))*(&off_26C3145D0 + (v1 ^ v3) + 83))(&v6);
  return v9;
}

void sub_210B0CFE4(uint64_t a1)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_210B0D06C()
{
  uint64_t result = ((uint64_t (*)(uint64_t))*(&off_26C3145D0 + (v0 ^ 0x76F10881)))(v2);
  *(_DWORD *)(v1 + 24) = 0;
  return result;
}

uint64_t sub_210B0D254(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  qword_26776F1C8 = 266878957 * ((unint64_t)&v3[qword_26776F1B8 - qword_26776F1C8] ^ 0xF073A22E56A83300);
  qword_26776F1B8 = qword_26776F1C8;
  unint64_t v1 = 462267737
     * ((((unint64_t)&v4 | 0xA0E8335166F4C700) - (void)&v4 + ((unint64_t)&v4 & 0x5F17CCAE990B38F8)) ^ 0xFDDDBEBC549BCC47);
  int v4 = 1995507721 - v1;
  uint64_t v5 = a1;
  uint64_t v6 = v1 ^ qword_26C3145D8;
  ((void (*)(int *))*(&off_26C3145D0 + unk_210B1624B + 34))(&v4);
  return v7;
}

void sub_210B0D38C(void *a1)
{
  BOOL v4 = a1[5] == 0x22AB66BAB6ADB379 || a1[4] == 0x13F4C241A706B52FLL || a1[2] == 0 || a1[1] == 0;
  __asm { BRAA            X15, X17 }
}

uint64_t sub_210B0D488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, int a3@<W8>)
{
  return (*(uint64_t (**)(void))(a2 + 8 * ((7 * (*(_DWORD *)(a1 + 48) + v3 >= a3 + 1303931972)) ^ (a3 - 31))))();
}

uint64_t sub_210B0D4D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8 * (v6 ^ (104 * (v5 == v4 + 92)))))();
}

uint64_t sub_210B0D4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8 * ((104 * (v5 == ((((v6 + 89) | 0x10) + v4) ^ ((v6 + 9) | 0x60)))) ^ v6)))();
}

uint64_t sub_210B0D52C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, int a3@<W8>)
{
  *(_DWORD *)(v6 - 220) = *(unsigned __int8 *)(v3 + 10);
  unsigned int v7 = *(uint64_t (**)(uint64_t))(a1 + 8 * ((69 * (v5 == ((((a3 - 88) | 9) + 27) ^ (v4 + 132)))) ^ (a3 - 79)));
  *(_DWORD *)(v6 - 216) = *(unsigned __int8 *)(v3 + 11);
  *(void *)(v6 - 144) = a2;
  return v7(717857492);
}

uint64_t sub_210B0D6A0@<X0>(int a1@<W1>, unsigned char *a2@<X8>)
{
  int v5 = a1 - 68;
  int v6 = (*a2 - 15) - (((*a2 - 15) << (a1 - 67)) & 0x18C) - 805742650;
  unsigned int v7 = 173 * (v6 ^ 0x82A77580) - ((346 * (v6 ^ 0x82A77580)) & 0x5027FE70) - 1475084488;
  int v8 = (*(unsigned char *)(v3 - 0x22AB66BAB6ADB377) - 15)
     - ((2 * (*(unsigned __int8 *)(v3 - 0x22AB66BAB6ADB377) - 15)) & 0x18C)
     - 805742650;
  int v9 = ((*(unsigned char *)(v3 - 0x22AB66BAB6ADB378) - 15)
      - ((2 * (*(unsigned __int8 *)(v3 - 0x22AB66BAB6ADB378) - 15)) & 0x18C)
      - 805742650) ^ 0x67EA00ED;
  unsigned int v10 = 173 * (v9 ^ v7 ^ HIWORD(v7)) - ((346 * (v9 ^ v7 ^ HIWORD(v7))) & 0x5027FE70) - 1475084488;
  int v11 = (*(unsigned char *)(v3 - 0x22AB66BAB6ADB376) - 15)
      - ((2 * (*(unsigned __int8 *)(v3 - 0x22AB66BAB6ADB376) - 15)) & 0x18C)
      - 805742650;
  unsigned int v12 = 173 * (v8 ^ 0x67EA00ED ^ v10 ^ HIWORD(v10))
      - ((346 * (v8 ^ 0x67EA00ED ^ v10 ^ HIWORD(v10))) & 0x5027FE70)
      - 1475084488;
  unsigned int v13 = v6 ^ (173 * (v11 ^ v12 ^ HIWORD(v12) ^ 0x67EA00ED)
            - ((346 * (v11 ^ v12 ^ HIWORD(v12) ^ 0x67EA00ED)) & 0x5027FE70)
            - 1475084488) ^ ((173 * (v11 ^ v12 ^ HIWORD(v12) ^ 0x67EA00ED)
                            - ((346 * (v11 ^ v12 ^ HIWORD(v12) ^ 0x67EA00ED)) & 0x5027FE70)
                            - 1475084488) >> 16) ^ 0x67EA00ED;
  unsigned int v14 = 173 * v13 - ((346 * v13) & 0x5027FE70) - 1475084488;
  unsigned int v15 = 173 * (v9 ^ v14 ^ HIWORD(v14)) - ((346 * (v9 ^ v14 ^ HIWORD(v14))) & 0x5027FE70) - 1475084488;
  unsigned int v16 = v11 ^ (173 * (v8 ^ 0x67EA00ED ^ v15 ^ HIWORD(v15))
             - ((346 * (v8 ^ 0x67EA00ED ^ v15 ^ HIWORD(v15))) & 0x5027FE70)
             - 1475084488) ^ ((173 * (v8 ^ 0x67EA00ED ^ v15 ^ HIWORD(v15))
                             - ((346 * (v8 ^ 0x67EA00ED ^ v15 ^ HIWORD(v15))) & 0x5027FE70)
                             - 1475084488) >> 16) ^ 0x5F17F441;
  unsigned int v17 = 51 * (v16 ^ v2) - ((102 * (v16 ^ v2)) & 0xD8099A82) - 335229631;
  *(_DWORD *)(v4 - 136) = v17;
  *(_DWORD *)(v4 - 200) = HIBYTE(v17);
  *(_DWORD *)(v4 - 148) = 2 * v5;
  return (*(&off_26C3145D0 + v5))();
}

void sub_210B0DBB4()
{
}

uint64_t sub_210B0DBC0()
{
  int v1 = *(_DWORD *)(v0 - 148) ^ 0x3E;
  *(_DWORD *)(v0 - 148) = *(_DWORD *)(v0 - 200) ^ 0x70;
  *(_DWORD *)(v0 - 152) = *(_DWORD *)(v0 - 136) ^ 0xFFFFFFDD;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v1))(542721880, 2418844588, 3437665148);
}

void sub_210B0DCE4()
{
}

uint64_t sub_210B0DCF0@<X0>(int a1@<W4>, unsigned int a2@<W8>)
{
  *(_DWORD *)(v4 - 156) = HIWORD(*(_DWORD *)(v4 - 136)) ^ 0xFFFFFF98;
  unsigned int v5 = HIBYTE(a2) ^ 0xFFFFFFD4;
  unsigned int v6 = 51 * (a1 ^ 0x25FFBF9E) - ((102 * (a1 ^ 0x25FFBF9E)) & 0x705F365E) - 1204839633;
  int v7 = (a2 >> 8) ^ 0x28;
  unsigned int v8 = HIWORD(v6) ^ 0xFFFFFFB3;
  int v9 = (v6 >> 8) ^ 7;
  unsigned int v10 = v6 ^ 0xFFFFFFB3;
  int v11 = HIBYTE(v6) ^ 0x24;
  *(_DWORD *)(v4 - 192) = v9;
  *(unsigned char *)(v4 - 119) = v9;
  *(_DWORD *)(v4 - 184) = v10;
  *(_DWORD *)(v4 - 180) = v8;
  *(unsigned char *)(v4 - 130) = v10;
  *(_DWORD *)(v4 - 144) = HIWORD(a2) ^ 0xFFFFFFE3;
  *(unsigned char *)(v4 - 122) = BYTE2(a2) ^ 0xE3;
  *(_WORD *)(v4 - 125) = -27492;
  *(_DWORD *)(v4 - 176) = v11;
  *(_DWORD *)(v4 - 172) = v5;
  *(unsigned char *)(v4 - 111) = v5;
  *(unsigned char *)(v4 - 108) = v8;
  *(unsigned char *)(v4 - 127) = v11;
  *(unsigned char *)(v4 - 116) = 109;
  *(_DWORD *)(v4 - 164) = v7;
  *(_DWORD *)(v4 - 160) = a2 ^ 0x75;
  *(unsigned char *)(v4 - 103) = v7;
  *(unsigned char *)(v4 - 114) = a2 ^ 0x75;
  *(unsigned char *)(v4 - 105) = 27;
  *(unsigned char *)(v4 - 113) = -92;
  return (*(uint64_t (**)(void, uint64_t))(v3 + 8 * v2))(0, 30);
}

void sub_210B0DEF0()
{
}

uint64_t sub_210B0DF00()
{
  *(unsigned char *)(v1 - 125) = -99;
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v0 + 8 * (v2 - 71)))(0, 34953, 30);
}

void sub_210B0E030()
{
}

uint64_t sub_210B0E044()
{
  *(_DWORD *)(v3 - 204) = v1 - v0;
  *(_DWORD *)(v3 - 168) = (102 * (v2 ^ 0x5D4316E3)) & 0xD7272A0A;
  *(_DWORD *)(v3 - 196) = 51 * (v2 ^ 0x5D4316E3) - 342649595;
  *(unsigned char *)(v3 - 125) = -98;
  *(_DWORD *)(v3 - 188) = v4;
  return (*(&off_26C3145D0 + v4 - 1))();
}

void sub_210B0E24C()
{
}

uint64_t sub_210B0E254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  char v25 = BYTE1(*(_DWORD *)(v24 - 136)) ^ 0x51;
  int v26 = *(_DWORD *)(v24 - 172);
  *(_DWORD *)(v24 - 168) = *(_DWORD *)(v24 - 196) - *(_DWORD *)(v24 - 168);
  *(unsigned char *)(v24 - 112) = *(_DWORD *)(v24 - 192);
  *(unsigned char *)(v24 - 121) = *(_DWORD *)(v24 - 152);
  *(unsigned char *)(v24 - 104) = v26;
  *(unsigned char *)(v24 - 109) = 109;
  *(unsigned char *)(v24 - 123) = *(_DWORD *)(v24 - 184);
  *(unsigned char *)(v24 - 129) = *(_DWORD *)(v24 - 156);
  int v27 = *(_DWORD *)(v24 - 164);
  *(unsigned char *)(v24 - 107) = *(_DWORD *)(v24 - 160);
  *(unsigned char *)(v24 - 128) = 27;
  *(unsigned char *)(v24 - 131) = *(_DWORD *)(v24 - 180);
  *(unsigned char *)(v24 - 110) = v25;
  *(unsigned char *)(v24 - 126) = v27;
  *(unsigned char *)(v24 - 120) = *(_DWORD *)(v24 - 176);
  *(unsigned char *)(v24 - 106) = -92;
  *(unsigned char *)(v24 - 117) = -108;
  int v28 = *(_DWORD *)(v24 - 144);
  *(unsigned char *)(v24 - 118) = *(_DWORD *)(v24 - 148);
  *(unsigned char *)(v24 - 115) = v28;
  *(unsigned char *)(v24 - 132) = -100;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + (int)a1))(a1, 46, 11, 2920467299, 2290649225, 30, v24 - 132, 4294967273, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

void sub_210B0E424()
{
}

uint64_t sub_210B0E438(int a1)
{
  *(_DWORD *)(v4 - 208) = v2 - v1;
  *(unsigned char *)(v4 - 132) = -99;
  unsigned int v5 = 51 * (v3 ^ 0x68830549) - ((102 * (v3 ^ 0x68830549)) & 0xB56DCD06) + 1521936003;
  *(_DWORD *)(v4 - 148) = v5;
  *(_DWORD *)(v4 - 144) = v5 >> ((a1 - 11) & 0x68);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0
                                                                                       + (int)((a1 + 1319923701) & 0xB1539068 ^ 0x19)))(187, (a1 + 1319923701) & 0xB1539068 ^ 0xE5273DB4, 1233112907, 3061854389, 2290649225, 30);
}

void sub_210B0E5D8()
{
}

uint64_t sub_210B0E5F0(uint64_t a1, int a2)
{
  int v6 = (a2 + v2) | 3;
  *(_DWORD *)(v4 - 144) ^= 0x7Au;
  *(_DWORD *)(v4 - 152) = *(_DWORD *)(v4 - 148) ^ 0x1F;
  *(_DWORD *)(v4 - 172) = (~((v6 ^ 0x71) * (v3 ^ 0x8D937BD3)) | 0x4A397501) + 51 * (v3 ^ 0x8D937BD3) - 622639744;
  *(unsigned char *)(v4 - 132) = -98;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 8 * v6))(3817008580, 173, 346, 67378900, 33689450, 2138042366);
}

void sub_210B0E774()
{
}

uint64_t sub_210B0E788@<X0>(int a1@<W8>)
{
  *(_DWORD *)(v2 - 156) = HIWORD(*(_DWORD *)(v2 - 148)) ^ 0x2A;
  *(_DWORD *)(v2 - 212) = 51 * (v1 ^ 0x17854762) - ((102 * (v1 ^ 0x17854762)) & 0x7B52D61E) + ((a1 - 5) ^ 0xBDA96B40);
  *(unsigned char *)(v2 - 132) = -97;
  unsigned int v3 = *(_DWORD *)(v2 - 172);
  *(_DWORD *)(v2 - 160) = HIBYTE(v3) ^ 0x46;
  *(_DWORD *)(v2 - 164) = (v3 >> 8) ^ 0xFFFFFFD9;
  return ((uint64_t (*)(uint64_t))*(&off_26C3145D0 + ((a1 - 5) ^ 0x1B)))(33);
}

void sub_210B0E918()
{
}

uint64_t sub_210B0E92C()
{
  int v3 = *(_DWORD *)(v2 - 172);
  int v4 = *(_DWORD *)(v2 - 212);
  *(unsigned char *)(v2 - 118) = HIBYTE(*(_DWORD *)(v2 - 148)) ^ 0xC6;
  *(unsigned char *)(v2 - 129) = *(_DWORD *)(v2 - 156);
  *(unsigned char *)(v2 - 110) = *(_DWORD *)(v2 - 144);
  *(unsigned char *)(v2 - 121) = *(_DWORD *)(v2 - 152);
  *(unsigned char *)(v2 - 115) = BYTE2(v3) ^ 0x7F;
  *(unsigned char *)(v2 - 131) = BYTE2(v4) ^ 0x35;
  *(unsigned char *)(v2 - 123) = v4 ^ 0x93;
  *(unsigned char *)(v2 - 132) = -100;
  unsigned int v6 = 51 * (v1 ^ 0x571B738B) - ((102 * (v1 ^ 0x571B738B)) & 0xA5C537EC) + 1390582774;
  *(unsigned char *)(v2 - 117) = BYTE2(v6) ^ 0x7E;
  *(unsigned char *)(v2 - 126) = *(_DWORD *)(v2 - 164);
  *(unsigned char *)(v2 - 128) = BYTE1(v6) ^ 7;
  *(unsigned char *)(v2 - 109) = (51 * (v1 ^ 0x8B) - ((102 * (v1 ^ 0x8B)) & 0xEC) - 10) ^ 0x6A;
  *(unsigned char *)(v2 - 120) = HIBYTE(v4) ^ 0x21;
  *(unsigned char *)(v2 - 106) = HIBYTE(v6) ^ 0xCE;
  *(unsigned char *)(v2 - 104) = *(_DWORD *)(v2 - 160);
  *(unsigned char *)(v2 - 107) = v3 ^ 0xE3;
  *(unsigned char *)(v2 - 112) = BYTE1(v4) ^ 0xF7;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v0))(187, 243418392, 173);
}

void sub_210B0EB30()
{
}

uint64_t sub_210B0EB48()
{
  *(_DWORD *)(v2 - 144) = 51 * (v1 ^ 0x44777784) - ((102 * (v1 ^ 0x44777784)) & 0xAA049A04) - 721269502;
  *(unsigned char *)(v2 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + (v0 ^ 0x7C)))(1644426787, 173, 346, 1162243656, 2728605442, 4293916659, 998, 1050637);
}

void sub_210B0ECA0()
{
}

uint64_t sub_210B0ECB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  unsigned int v32 = *(_DWORD *)(v31 - 144);
  *(_DWORD *)(v31 - 152) = v32 ^ 0xFFFFFF9E;
  HIDWORD(a29) = 51 * (v30 ^ 0x8B7DE13A) - 1871229785;
  *(_DWORD *)(v31 - 176) = HIDWORD(a29) - ((102 * (v30 ^ 0x8B7DE13A)) & 0x20EE994E);
  *(unsigned char *)(v31 - 132) = -98;
  *(_DWORD *)(v31 - 156) = HIWORD(v32) ^ 0xFFFFFF9E;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + ((167 * ((((v29 + 33826) | 0x52844A31) ^ 0x5284CE79) + 1081657352 - ((2 * ((((v29 + 33826) | 0x52844A31) ^ 0x5284CE79) + 1)) & 0x80F1900E) == 1081657381)) ^ v29)))(346, 982997828, 491498914, 4042322161, 11, 3200090619, 22, 1014, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

void sub_210B0EE9C()
{
}

uint64_t sub_210B0EEA4@<X0>(int a1@<W8>)
{
  unsigned int v3 = *(_DWORD *)(v2 - 176);
  unsigned int v4 = (v1 + 308593138) & 0x9B166FBF;
  *(_DWORD *)(v2 - 160) = HIBYTE(v3) ^ 0xC;
  *(_DWORD *)(v2 - 180) = 51 * (a1 ^ 0x1043699B) - ((102 * (a1 ^ 0x1043699B)) & 0x88397242) - 1004750559;
  *(unsigned char *)(v2 - 132) = -97;
  *(_DWORD *)(v2 - 184) = (*(_DWORD *)(v2 - 144) >> 8) ^ 0xFFFFFFD1;
  *(_DWORD *)(v2 - 164) = (v4 - 64) ^ HIWORD(v3);
  return (*(&off_26C3145D0 + (int)(v4 ^ 0x6D)))();
}

void sub_210B0F040()
{
}

uint64_t sub_210B0F054@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  int v25 = *(_DWORD *)(v24 - 180);
  int v26 = v22 - 24 + v23;
  char v27 = HIBYTE(*(_DWORD *)(v24 - 144)) ^ 0x49;
  int v28 = *(_DWORD *)(v24 - 176);
  *(unsigned char *)(v24 - 112) = v25 ^ 0xBD;
  *(unsigned char *)(v24 - 129) = *(_DWORD *)(v24 - 184);
  unsigned int v29 = 51 * (a1 ^ 0x9E2F59DB) - ((102 * (a1 ^ 0x9E2F59DB)) & 0xF628FBD8) - 82543124;
  *(unsigned char *)(v24 - 131) = BYTE1(v25) ^ 0x25;
  *(unsigned char *)(v24 - 123) = *(_DWORD *)(v24 - 160);
  *(unsigned char *)(v24 - 110) = *(_DWORD *)(v24 - 152);
  *(unsigned char *)(v24 - 120) = BYTE2(v25) ^ 0x80;
  *(unsigned char *)(v24 - 126) = (v26 + 40) ^ v28;
  *(unsigned char *)(v24 - 128) = v29 ^ 0x70;
  *(unsigned char *)(v24 - 117) = BYTE1(v29) ^ 0xE1;
  *(unsigned char *)(v24 - 104) = *(_DWORD *)(v24 - 164);
  *(unsigned char *)(v24 - 118) = *(_DWORD *)(v24 - 156);
  *(unsigned char *)(v24 - 132) = -100;
  *(unsigned char *)(v24 - 115) = BYTE1(v28) ^ 0xD0;
  HIDWORD(v33) = v29;
  unsigned int v30 = ((v29 >> 15) | 0xFFFFFFF9) - (HIWORD(v29) & 3) + 532232595;
  unsigned int v31 = ((v30 & 5) - 1828536161 + (v30 & 0x1A ^ 0x8100403)) ^ 0x9B12C4AE | ((HIWORD(v29) & 0x78 ^ 0xA818B26B)
                                                                          + (HIWORD(v29) & 0x84 ^ 0x10040405)
                                                                          - 2) ^ 0xB81CB67A;
  LODWORD(v33) = v31 - ((2 * v31) & 0x44A5F2F6) - 497878661;
  *(unsigned char *)(v24 - 107) = v27;
  *(unsigned char *)(v24 - 109) = HIBYTE(v25) ^ 0x58;
  *(unsigned char *)(v24 - 106) = (v31 - ((2 * v31) & 0xF6) + 123) ^ 0xE7;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v26))(4283940630, 556, 11026666, 2290649225, 30, 2356836256, 173, 346, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           v33);
}

void sub_210B0F320()
{
}

uint64_t sub_210B0F334()
{
  int v4 = v1 - v0;
  *(unsigned char *)(v3 - 132) = -99;
  unsigned int v5 = 51 * (v2 ^ 0x263D7C0D) + 842822710 - ((102 * (v2 ^ 0x263D7C0D)) & 0x6479051E) + 3673;
  *(_DWORD *)(v3 - 152) = v5;
  *(_DWORD *)(v3 - 160) = v5 >> (v4 - 75);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + (v4 ^ 7)))(2403821612, 4042322161, 11, 3094871519, 22, 958, 1200095777, 2290649225);
}

void sub_210B0F51C()
{
}

uint64_t sub_210B0F524()
{
  unsigned int v3 = HIWORD(*(_DWORD *)(v2 - 152)) ^ 0xFFFFFFA0;
  *(_DWORD *)(v2 - 160) ^= 0xFFFFFFAE;
  *(_DWORD *)(v2 - 156) = v3;
  unsigned int v4 = 51 * (v1 ^ 0xA8336D92) - ((102 * (v1 ^ 0xA8336D92)) & 0x1FF534DC) + 268081774;
  *(_DWORD *)(v2 - 184) = v4;
  *(_DWORD *)(v2 - 164) = HIBYTE(v4) ^ 0xFFFFFF93;
  *(unsigned char *)(v2 - 132) = -98;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v0))(33, 4077, 4097695744, 3090459918, 1545229959, 22151, 1545207808, 3810252254);
}

void sub_210B0F760()
{
}

uint64_t sub_210B0F770()
{
  *(unsigned char *)(v1 - 132) = -97;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v0))(836286099, 54, 3368429321, 173, 346, 3933801108, 1966900554);
}

void sub_210B0F8CC()
{
}

uint64_t sub_210B0F8E0()
{
  unsigned int v5 = *(_DWORD *)(v4 - 184);
  unsigned int v6 = HIWORD(v5);
  char v7 = (v1 - 5) ^ BYTE1(*(_DWORD *)(v4 - 152)) ^ 0x3D;
  __int16 v8 = 51 * (v2 ^ 0x449D) - ((102 * (v2 ^ 0x449D)) & 0xAEA8) + 22356;
  *(unsigned char *)(v4 - 104) = BYTE1(v5) ^ 6;
  *(unsigned char *)(v4 - 118) = v7;
  *(unsigned char *)(v4 - 129) = v0;
  *(unsigned char *)(v4 - 112) = *(_DWORD *)(v4 - 164);
  *(unsigned char *)(v4 - 131) = v3 ^ 0x1D;
  *(unsigned char *)(v4 - 120) = BYTE1(v3) ^ 0xC4;
  *(unsigned char *)(v4 - 109) = BYTE2(v3) ^ 0x91;
  *(unsigned char *)(v4 - 132) = -100;
  *(unsigned char *)(v4 - 117) = v8 ^ 0xC8;
  *(unsigned char *)(v4 - 106) = HIBYTE(v8) ^ 0xCB;
  *(unsigned char *)(v4 - 107) = *(_DWORD *)(v4 - 156);
  *(unsigned char *)(v4 - 126) = *(_DWORD *)(v4 - 160);
  *(unsigned char *)(v4 - 115) = v5 ^ 0xF2;
  *(unsigned char *)(v4 - 128) = HIBYTE(v3) ^ 0xFB;
  char v9 = (((v6 & 0x25 ^ 0xFA) - ((2 * (v6 & 0x25 ^ 0xFA)) & 0xC) - 122) ^ 0x86) & (((~(_BYTE)v6 | 0x25)
                                                                                + ((2 * (v6 & 0x1A ^ (~(_BYTE)v6 | 0x7D))) ^ 0x39)
                                                                                - 99) ^ 0x9C);
  *(unsigned char *)(v4 - 123) = v9 - ((2 * v9) & 0x38) - 100;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0
                                                                                        + ((v1 - 5) ^ 0xB)))(11, 774178868, 1107564505, 3593275373, 2290649225, 30);
}

void sub_210B0FB98()
{
}

uint64_t sub_210B0FBAC()
{
  unsigned int v3 = 51 * (v0 ^ 0x6DEF0EF) - ((102 * (v0 ^ 0x6DEF0EF)) & 0xF53BAC3C) + 2057164318;
  *(_DWORD *)(v2 - 160) = v3 >> ((v1 - 40) ^ 0xF7);
  *(_DWORD *)(v2 - 156) = v3;
  *(unsigned char *)(v2 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + (int)((108 * (((6 - v1) | (v1 - 6)) >= 0)) ^ (v1 + 1316703704) & 0xB1041027)))(22, 238, 270143881, 2290649225, 60, 1927249119, 2367718177, 250797320);
}

void sub_210B0FD8C()
{
}

uint64_t sub_210B0FD9C()
{
  *(_DWORD *)(v2 - 160) ^= 0x4Au;
  *(_DWORD *)(v2 - 188) = 51 * (v1 ^ 0x5EF4F85A) - ((102 * (v1 ^ 0x5EF4F85A)) & 0x5EB8676A) + 794571701;
  *(unsigned char *)(v2 - 132) = -98;
  *(_DWORD *)(v2 - 164) = HIBYTE(*(_DWORD *)(v2 - 156)) ^ 0xFFFFFFE6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v0))(173, 346, 905520786, 452760393, 1142476837, 2290649225, 30);
}

void sub_210B0FF00()
{
}

uint64_t sub_210B0FF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  *(_DWORD *)(v36 - 192) = HIWORD(*(_DWORD *)(v36 - 156)) ^ 1;
  unsigned int v37 = *(_DWORD *)(v36 - 188);
  LODWORD(v39) = v37 ^ 0x29;
  *(_DWORD *)(v36 - 196) = v34 ^ 0x2F ^ (v37 >> 8) ^ 0xFFFFFFB4;
  HIDWORD(v39) = 51 * (v35 ^ 0x770ACFFA) - ((102 * (v35 ^ 0x770ACFFA)) & 0x5E1D8200) + 789496064;
  *(unsigned char *)(v36 - 132) = -97;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v34))(33, 4271029837, 2620387751, ((*(unsigned __int8 *)(v36 - 132) ^ 0x9C)- ((2 * (*(unsigned __int8 *)(v36 - 132) ^ 0x9C)) & 0xF6)+ 804201339) ^ 0x3D6B5175u, 4042322161, 34, 1539079133, 22, a9, a10, a11, a12, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           v39);
}

void sub_210B100D8()
{
}

uint64_t sub_210B100F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,__int16 a36,char a37,char a38,char a39,char a40,char a41)
{
  int v43 = *(_DWORD *)(v42 - 188);
  char v44 = *(_DWORD *)(v42 - 156) ^ 0x82;
  *(unsigned char *)(v42 - 107) = *(_DWORD *)(v42 - 160);
  *(unsigned char *)(v42 - 104) = a35;
  *(unsigned char *)(v42 - 132) = -100;
  *(unsigned char *)(v42 - 118) = v44;
  *(unsigned char *)(v42 - 120) = a41 ^ 0x9C;
  *(unsigned char *)(v42 - 131) = v41 ^ 0x8A ^ HIBYTE(v43) ^ 0xDE;
  *(unsigned char *)(v42 - 126) = *(_DWORD *)(v42 - 192);
  *(unsigned char *)(v42 - 109) = a38 ^ 0x5D;
  *(unsigned char *)(v42 - 115) = *(_DWORD *)(v42 - 164);
  *(unsigned char *)(v42 - 117) = a40 ^ 0xB3;
  *(unsigned char *)(v42 - 112) = BYTE2(v43) ^ 0xC0;
  *(unsigned char *)(v42 - 123) = *(_DWORD *)(v42 - 196);
  *(unsigned char *)(v42 - 128) = a39 ^ 0x92;
  *(unsigned char *)(v42 - 106) = (51 * (a4 ^ 0x48) - ((102 * (a4 ^ 0x48)) & 0x86) + 67) ^ 0xDF;
  return ((uint64_t (*)(uint64_t))*(&off_26C3145D0 + (int)(v41 ^ 0xBA46058A)))(3313430782);
}

uint64_t sub_210B103DC()
{
  *(_DWORD *)(v3 - 160) = 51 * (v2 ^ v0) - ((102 * (v2 ^ v0)) & 0xF743F884) + 2074213442;
  *(unsigned char *)(v3 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v1 - 50))(2290649225, 30, v3 - 132, 156, 116, 2981610810, 3151373375, 173);
}

void sub_210B105CC()
{
}

uint64_t sub_210B105D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(v14 - 192) = 51 * (v13 ^ 0x3EED6C84) - ((102 * (v13 ^ 0x3EED6C84)) & 0x80D3FD6E) - 1066795337;
  *(unsigned char *)(v14 - 132) = -98;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v12))(187, 636, 2290649225, 30, 4258265189, 173, 346, 173012216, a9, a10, a11, a12);
}

void sub_210B10758()
{
}

uint64_t sub_210B1076C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  *(unsigned char *)(v35 - 132) = -97;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * v34))(3212796379, 54, 11, 3313945495, 2290649225, 30, 345743661, 173, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

void sub_210B108C8()
{
}

uint64_t sub_210B108D4@<X0>(char a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,char a29,char a30,char a31)
{
  char v37 = *(_DWORD *)(v36 - 160) ^ 0xDE;
  int v38 = *(_DWORD *)(v36 - 192);
  *(unsigned char *)(v36 - 104) = v31;
  *(unsigned char *)(v36 - 109) = a28 ^ 0xD8;
  *(unsigned char *)(v36 - 123) = v35;
  *(unsigned char *)(v36 - 106) = a31 ^ 0xAA;
  *(unsigned char *)(v36 - 128) = a29 ^ 0x48;
  *(unsigned char *)(v36 - 126) = a1;
  *(unsigned char *)(v36 - 115) = v34;
  *(unsigned char *)(v36 - 107) = v37;
  *(unsigned char *)(v36 - 117) = a30 ^ 0xFA;
  *(unsigned char *)(v36 - 132) = -100;
  *(unsigned char *)(v36 - 131) = v33;
  *(unsigned char *)(v36 - 112) = BYTE1(v38) ^ 0x62;
  *(unsigned char *)(v36 - 120) = HIBYTE(v38) ^ 0x5C;
  return ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v32))(0, 34, 902018255, 173, 2142193898, 1071096949, 3211124377, 50);
}

void sub_210B10A88()
{
}

uint64_t sub_210B10A9C@<X0>(int a1@<W8>)
{
  *(_DWORD *)(v2 - 164) = 51 * (v1 ^ 0x7C1E97CD) - ((102 * (v1 ^ 0x7C1E97CD)) & 0x2AA1F69E) + 357628751;
  *(unsigned char *)(v2 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + a1))(11, 1754236522, 2290649225, 30);
}

void sub_210B10BF0()
{
}

uint64_t sub_210B10C00@<X0>(int a1@<W8>)
{
  int v3 = a1 + 74;
  *(_DWORD *)(v2 - 196) = (~((v3 ^ 0x28) * (v1 ^ 0x40E0228D)) | 0x46DD9991) + 51 * (v1 ^ 0x40E0228D) - 594463944;
  *(unsigned char *)(v2 - 132) = -98;
  return ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v3))(v3 ^ 0x43u, 11, 1405026231, 22);
}

void sub_210B10DA8()
{
}

uint64_t sub_210B10DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  unsigned int v28 = *(_DWORD *)(v27 - 196);
  HIDWORD(a11) = (*(_DWORD *)(v27 - 164) >> 8) ^ 0x67;
  HIDWORD(a9) = HIBYTE(v28) ^ 0x40;
  LODWORD(a10) = v28 ^ 0xFFFFFFAB;
  *(unsigned char *)(v27 - 132) = -97;
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + (int)((21 * (((557960934 - (v26 ^ 0x2141CF5F)) | ((v26 ^ 0x2141CF5Fu) - 557960934)) >> 31)) ^ ((v26 ^ 0x2141CF5F) - 557960890))))(3982681691, -(v26 ^ 0x2141CF5F), 557960933, 557960934, (v26 ^ 0x2141CF5Fu) - 557960851, 2393379318, 406115661, 21, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

void sub_210B10FAC()
{
}

uint64_t sub_210B10FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, char a10, __int16 a11, char a12, int a13, int a14, char a15, __int16 a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,char a40,char a41,char a42)
{
  int v43 = *(_DWORD *)(v42 - 164);
  int v44 = *(_DWORD *)(v42 - 196);
  *(unsigned char *)(v42 - 104) = a17;
  *(unsigned char *)(v42 - 109) = a10;
  *(unsigned char *)(v42 - 115) = a15;
  *(unsigned char *)(v42 - 131) = BYTE1(v44) ^ 0xAF;
  *(unsigned char *)(v42 - 123) = HIBYTE(v43) ^ 0x89;
  *(unsigned char *)(v42 - 126) = v43 ^ 0xD3;
  *(unsigned char *)(v42 - 112) = a12;
  *(unsigned char *)(v42 - 117) = a41 ^ 0xDA;
  *(unsigned char *)(v42 - 120) = BYTE2(v44) ^ 0xD;
  *(unsigned char *)(v42 - 106) = a42 ^ 0x1F;
  *(unsigned char *)(v42 - 132) = -100;
  *(unsigned char *)(v42 - 128) = a40 ^ 0x40;
  return ((uint64_t (*)(uint64_t, void, void))*(&off_26C3145D0 + (((a5 - 99) | 0x4E) ^ 0x2B)))(22, 0, 0);
}

void sub_210B111C4()
{
}

uint64_t sub_210B111DC()
{
  HIDWORD(v4) = 51 * (v2 ^ 0x5D86027C) - 403671499;
  *(unsigned char *)(v1 - 132) = -99;
  LODWORD(v4) = v0 - 111;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + v0 - 88))(80502, 346, 1547071086, 2921019191, 11, 1558879547, 22, 2736087749, v4);
}

void sub_210B11360()
{
}

uint64_t sub_210B11378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  *(unsigned char *)(v9 - 132) = -98;
  return ((uint64_t (*)(void, void, void))*(&off_26C3145D0 + (int)a9))(a9, 0, 0);
}

void sub_210B115F4()
{
}

uint64_t sub_210B1160C(int a1)
{
  HIDWORD(v4) = (102 * (v1 ^ 0x27957438)) & 0xE6C8C57C;
  LODWORD(v4) = 51 * (v1 ^ 0x27957438) - 211524930;
  *(unsigned char *)(v2 - 132) = -97;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26C3145D0 + ((a1 + 24) ^ 0xE)))(34, 293173329, 11, 960493298, 22, 3556, 3334473998, 2290649225, v4);
}

void sub_210B11794()
{
}

uint64_t sub_210B117AC()
{
  int v439 = v438 - v437 - 1847947522;
  unsigned int v3 = v447 - ((v447 << (((v1 - 105) ^ 0x77) - 119)) & 0x58) + 930368300;
  unsigned int v4 = 51 * (v0 ^ 0xCF97AAAF) - ((102 * (v0 ^ 0xCF97AAAF)) & 0x3FD24F7C) - 1612109890;
  int v5 = (((v469 - ((2 * v469) & 0x172)) << 16) + 884539392) ^ 0x34B90000;
  int v6 = (((v512 - ((2 * v512) & 0x4C)) << 8) + 1647257088) ^ 0x622F2600;
  unsigned int v7 = (v6 - ((2 * v6) & 0x767DA400) + 993972848) ^ 0x3B3ED270 | (v5 - ((2 * v5) & 0x61CE0000) - 253278827) ^ 0xF0E74595;
  unsigned int v8 = (v7 - 109409940 + (~(2 * v7) | 0x8D0AED27) + 1) ^ 0xF97A896C | (v509 - ((2 * v509) & 0xFFFFFFFB) + 2122065661) ^ 0x7E7C26FD;
  unsigned int v9 = v8 - ((2 * v8) & 0x1FA826);
  int v10 = (((v449 - ((2 * v449) & 0x1D2)) << 16) + 1391001600) ^ 0x52E90000;
  unsigned int v11 = (((v451 - ((2 * v451) & 0xB6)) << 8) - 509781248) ^ 0xE19D5B00;
  int v12 = (v11 - ((2 * v11) & 0x271C2600) + 328078220) ^ 0x138E138C | (v10 - ((2 * v10) & 0x71280000) + 949232305) ^ 0x389422B1;
  unsigned int v13 = (v12 - ((2 * v12) & 0x78CB6652) + 1013297961) ^ 0x3C65B329 | (v455 - ((2 * v455) & 0xDE) - 1539381393) ^ 0xA43EE76F;
  unsigned int v14 = (((v13 - ((2 * v13) & 0x47474C)) << 8) - 1549556224) ^ 0xA3A3A600;
  unsigned int v15 = (v14 - ((2 * v14) & 0x39B92400) - 1663266200) ^ 0x9CDC9268 | (v457 - ((2 * v457) & 0x9C) + 1046051150) ^ 0x3E59794E;
  unsigned int v16 = v15 - ((2 * v15) & 0x11607E92);
  int v17 = ((v453 - ((2 * v453) & 0x100)) << 20) - 402653184;
  unsigned int v18 = (((v456 - ((2 * v456) & 0x10A)) << 12) - 1505210368) ^ 0xA6485000;
  unsigned int v19 = (((v3 << 28) ^ 0xC0000000) - ((2 * ((v3 << 28) ^ 0xC0000000)) & 0xBFFFFFFF) - 752047130) ^ 0xD32CABE6 | ((v17 ^ 0xE8000000) - ((2 * v17) & 0x7600000) - 2085091860) ^ 0x83B805EC;
  unsigned int v20 = (v19 - ((2 * v19) & 0x83BAC9E4) + 1105028338) ^ 0x41DD64F2;
  int v21 = (v18 - ((2 * v18) & 0x1E60E000) + 1328576725) ^ 0x4F3078D5;
  int v22 = (v20 | v21) - ((2 * (v20 | v21)) & 0x16C97F22) - 1956331631;
  unsigned int v23 = (((v474 - ((2 * v474) & 0xDDDDDDDD)) << 16) - 1326579712) ^ 0xB0EE0000;
  int v24 = (((v467 - ((2 * v467) & 0x1CC)) << 8) + 783279616) ^ 0x2EAFE600;
  unsigned int v25 = (v24 - ((2 * v24) & 0x7FFDDE00) - 1073811650) ^ 0xBFFEEF3E | (v23 - ((2 * v23) & 0x3E5A0000) + 1596826988) ^ 0x5F2DA56C;
  unsigned int v26 = v25 - ((2 * v25) & 0x9698057E);
  unsigned int v27 = (((v450 - ((2 * v450) & 0x1AE)) << 16) - 69795840) ^ 0xFBD70000;
  int v28 = (((v452 - ((2 * v452) & 0x78)) << 8) + 1880177664) ^ 0x70113C00;
  unsigned int v29 = (v27 - ((2 * v27) & 0x17060000) - 1954295074) ^ 0x8B83D2DE | (v28 - ((2 * v28) & 0xA881800) + 1162087652) ^ 0x45440CE4;
  unsigned int v30 = (v29 - ((2 * v29) & 0x333E1B30) + 1503595928) ^ 0x599F0D98 | (v458 - ((2 * v458) & 0xFFFFFFE3) - 2103555087) ^ 0x829E4BF1;
  unsigned int v31 = v30 - ((2 * v30) & 0x680F9E);
  unsigned int v32 = -654471207 * ((v16 + 145768265) ^ 0x8B03F49)
      - ((838541234 * ((v16 + 145768265) ^ 0x8B03F49)) & 0x2BAA1C26)
      + 366284307;
  unsigned int v33 = (((v448 - ((2 * v448) & 0x174)) << 16) - 390463488) ^ 0xE8BA0000;
  int v34 = (((v454 - ((2 * v454) & 0x1E8)) << 8) + 48034816) ^ 0x2DCF400;
  unsigned int v35 = (v34 - ((2 * v34) & 0x2D03E200) + 1451356648) ^ 0x5681F1E8 | ((v33 + 1218146591 + (~(2 * v33) | 0xEEC9FFFF)) | 1) ^ 0x489B711F;
  unsigned int v36 = (v35 - ((2 * v35) & 0x9DFD7E90) - 822165688) ^ 0xCEFEBF48 | (v459 - ((2 * v459) & 0x7C) - 1504094402) ^ 0xA659573E;
  HIDWORD(v37) = (((v3 >> 4) ^ 0x37744B2 | v21) - ((2 * ((v3 >> 4) ^ 0x37744B2 | v21)) & 0x2EE86) + 227139) ^ 0x37743;
  LODWORD(v37) = v22 ^ 0x8B640000;
  int v38 = (v37 >> 18) - ((2 * (v37 >> 18)) & 0x519A0BCA) - 1462958619;
  int v39 = (((v36 - ((2 * v36) & 0x102A2E)) << 8) + 135599872) ^ 0x8151700;
  HIDWORD(v37) = v38 ^ 0x105E5;
  LODWORD(v37) = v38 ^ 0xA8CC0000;
  int v40 = ((v37 >> 18) - ((2 * (v37 >> 18)) & 0xC8E97FD4) + 1685372906) ^ 0x6474BFEA | (v460
                                                                                    - ((2 * v460) & 0x7A)
                                                                                    + 963525949) ^ 0x396E3D3D;
  int v41 = ((v470 - ((2 * v470) & 0x26)) << 16) - 1055719424;
  unsigned int v42 = (((v464 - ((2 * v464) & 0x146)) << 8) - 345005312) ^ 0xEB6FA300;
  unsigned int v43 = ((v41 ^ 0xC1130000) - ((2 * v41) & 0x4880000) + 1111765246) ^ 0x424430FE | ((v42
                                                                                   + 580490535
                                                                                   + (~(2 * v42) | 0xBACCD5FF)) | 1) ^ 0x22999527;
  unsigned int v44 = v43 - ((2 * v43) & 0xE50E5514);
  unsigned int v45 = (v40 - ((2 * v40) & 0xB03621A6) + 1478168787) ^ 0x581B10D3;
  int v46 = -371456631 * v45 - ((330828562 * v45) & 0x236C6682) + 297153345;
  unsigned int v47 = (v39 - ((2 * v39) & 0x297A8000) + 347947111) ^ 0x14BD4067 | (v461 + 1721123744 + (~(2 * v461) | 0xFFFFFEBF) + 1) ^ 0x669643A0;
  unsigned int v48 = v47 - ((2 * v47) & 0x7F7D3A5C);
  int v49 = (v26 + 1263272639) ^ 0x4B4C02BF | (*(_DWORD *)(v2 - 220) - ((2 * *(_DWORD *)(v2 - 220)) & 0x1D2) + 1646308841) ^ 0x6220ADE9;
  int v50 = v49 - ((2 * v49) & 0x7E3BC2);
  unsigned int v51 = ((((v31 << 8) + 872926976) ^ 0x3407CF00)
       - ((2 * (((v31 << 8) + 872926976) ^ 0x3407CF00)) & 0xC37BC800)
       + 1639834823) ^ 0x61BDE4C7 | (v463 - ((2 * v463) & 0x9C) - 64956594) ^ 0xFC20D74E;
  unsigned int v52 = 1062196213 * ((v48 - 1078026962) ^ 0xBFBE9D2E)
      - ((2124392426 * ((v48 - 1078026962) ^ 0xBFBE9D2E)) & 0xD661F56E)
      + 1798372023;
  unsigned int v53 = (((v468 - ((2 * v468) & 0x28)) << 16) - 2028732416) ^ 0x87140000;
  unsigned int v54 = (((v472 - ((2 * v472) & 0x168)) << 8) - 1855998976) ^ 0x915FB400;
  unsigned int v55 = (v53 - ((2 * v53) & 0x24E20000) - 1838023331) ^ 0x9271FD5D | (v54 - ((2 * v54) & 0x4CA4DC00) - 1504547208) ^ 0xA6526E78;
  unsigned int v56 = v465 - ((2 * v465) & 0xFFFFFFF7) - 655732485;
  unsigned int v57 = (v55 - ((2 * v55) & 0x5643D0B0) - 1423841192) ^ 0xAB21E858 | v56 ^ 0xD8EA50FB;
  unsigned int v58 = ((((v9 << 8) - 1881926912) ^ 0x8FD41300)
       - ((2 * (((v9 << 8) - 1881926912) ^ 0x8FD41300)) & 0x37C6E200)
       + 467890628) ^ 0x1BE371C4 | (*(_DWORD *)(v2 - 216) - ((2 * *(_DWORD *)(v2 - 216)) & 0xF4) + 1649096314) ^ 0x624B367A;
  unsigned int v59 = v46 ^ v436;
  unsigned int v60 = (v58 - ((2 * v58) & 0x2856236E) - 1809116745) ^ 0x942B11B7;
  unsigned int v462 = -654471207 * v60 - ((-1308942414 * v60) & 0xA0C7BEB6) + 1348722523;
  unsigned int v61 = (v51 - ((2 * v51) & 0xF066B758) - 130851924) ^ 0xF8335BAC;
  unsigned int v62 = 842553393 * v61 - ((1685106786 * v61) & 0x93CAAF32) - 907716711;
  unsigned int v63 = ((((v50 << 8) + 1058922752) ^ 0x3F1DE100)
       - ((2 * (((v50 << 8) + 1058922752) ^ 0x3F1DE100)) & 0x1994F800)
       - 1932886972) ^ 0x8CCA7C44 | (v483 - ((2 * v483) & 0x80) + 2084678464) ^ 0x7C41AB40;
  int v64 = (((v57 - ((2 * v57) & 0x643A26)) << 8) + 840766208) ^ 0x321D1300;
  unsigned int v65 = (v63 - ((2 * v63) & 0xC62640C0) + 1662197856) ^ 0x63132060;
  unsigned int v66 = -371456631 * v65 - ((-742913262 * v65) & 0xD120B41C) + 1754290702;
  unsigned int v67 = (v64 - ((2 * v64) & 0xFE07CA00) + 2130961814) ^ 0x7F03E596 | (v487 - ((2 * v487) & 0x22222222) + 1395931665) ^ 0x53343A11;
  unsigned int v68 = (v67 - ((2 * v67) & 0xC8215ADE) + 1678814575) ^ 0x6410AD6F;
  unsigned int v69 = 842553393 * v68 - ((1685106786 * v68) & 0xBA1AD750) - 586323032;
  unsigned int v70 = (v44 - 226022774) ^ 0xF2872A8A | (v480 - ((2 * v480) & 0xB6) + 1226989915) ^ 0x4922615B;
  unsigned int v71 = (((v70 - ((2 * v70) & 0x93C174)) << 8) - 908019200) ^ 0xC9E0BA00;
  unsigned int v72 = v71 - ((2 * v71) & 0x33A35C00);
  int v73 = v46 ^ v436 ^ v464;
  int v74 = ((v46 ^ v436 ^ v464) ^ 0x74) - ((2 * (v73 ^ 0x74)) & 0x152);
  unsigned int v75 = (v32 & 4 ^ 0xFFFFFFA7) - 81;
  if ((v32 & 4 & v56) == 0) {
    unsigned int v75 = ((v32 & 4 ^ 0xFFFFFFF7) & 0xFFFFFFF7 | (8 * (((v32 & 4) >> 2) & 1))) + 95;
  }
  int v76 = ((2 * ((HIBYTE(v32) ^ 0x15) & v467)) & 0x194) - ((HIBYTE(v32) ^ 0x15) & v467) - 75;
  unsigned int v466 = (v465 + v75 - 86 - ((2 * (v465 + v75 - 86)) & 0xFFFFFFAC) - 42) ^ v32 & 0xFFFFFFFB ^ v441;
  int v77 = 2 * ((v76 & 0x3B ^ 0x31) + (v76 & 0x44 ^ 0x41)) - 2;
  unsigned int v78 = (HIBYTE(v32) ^ 0xA)
      + v467
      + ((v32 >> 23) & 0x3E ^ 0x2A)
      + (v77 ^ 0xFFFFFF99)
      + ((2 * v77) & 0xFFFFFFDF ^ 0xFFFFFFEF);
  unsigned int v79 = v468 ^ ((v441 ^ v32) >> 8);
  unsigned int v80 = v4 ^ v52;
  int v81 = (v4 ^ v52) ^ v469;
  unsigned int v82 = (v72 - 1714311477) ^ 0x99D1AECB | (v476 - ((2 * v476) & 0x55555555) + 1114953130) ^ 0x4274D5AA;
  unsigned int v83 = (v82 - ((2 * v82) & 0x213B4D5E) - 1868716369) ^ 0x909DA6AF;
  unsigned int v84 = 1062196213 * v83 - ((2124392426 * v83) & 0x8996F13E) + 1154185375;
  unsigned int v85 = (v434 - v435) ^ v62;
  int v86 = (v79 ^ 0xB1) - ((2 * (v79 ^ 0xB1)) & 0x7A);
  int v87 = v85 ^ v470;
  int v88 = (~(2 * (v85 ^ v470 ^ 0x27)) | 0xFE2B) + ((v85 ^ v470) ^ 0x27);
  unsigned int v89 = v499 ^ v69;
  int v90 = v472 ^ (v59 >> 8);
  int v91 = (v78 - ((2 * (_BYTE)v78 + 34) & 0x70) - 119) ^ HIBYTE(v441);
  int v92 = v474 ^ (v85 >> 8);
  int v471 = (v92 ^ 0x35) - ((2 * (v92 ^ 0x35)) & 0x70);
  int v93 = v509 ^ HIWORD(v59);
  int v475 = ((v509 ^ BYTE2(v59)) ^ 0x46) - ((2 * (v93 ^ 0x46)) & 0x4C);
  int v477 = v440 ^ HIWORD(v32) ^ v476;
  int v94 = v480 ^ HIBYTE(v59);
  int v95 = ((((v90 ^ 0x45) - ((2 * (v90 ^ 0x45)) & 0x1F8)) << 8) + 1499724800) ^ 0x5963FC00;
  unsigned int v96 = (v95 - ((2 * v95) & 0x2A4BF400) + 354810374) ^ 0x1525FA06 | ((((v86 << 16) - 1673723904) ^ 0x9C3D0000)
                                                                   - ((2 * (((v86 << 16) - 1673723904) ^ 0x9C3D0000)) & 0x239A0000)
                                                                   - 1848777690) ^ 0x91CDE426;
  unsigned int v97 = v96 - ((2 * v96) & 0x7D35529E);
  int v98 = v483 ^ HIWORD(v80);
  HIDWORD(v99) = v98 ^ 1;
  LODWORD(v99) = (v98 ^ 0xFFFFFFDF) << 24;
  int v100 = (v81 ^ 9) - ((2 * (v81 ^ 9)) & 0x4E);
  unsigned int v101 = (v97 - 23418545) ^ 0xFE9AA94F | ((v466 ^ 0x35) - ((2 * (v466 ^ 0x35)) & 0x44) - 318034398) ^ 0xED0B2E22;
  unsigned int v102 = v101 - ((2 * v101) & 0x110A0C);
  unsigned int v103 = ((((v74 << 8) + 731949312) ^ 0x2BA0A900)
        - ((2 * (((v74 << 8) + 731949312) ^ 0x2BA0A900)) & 0x4C8AAE00)
        - 1505405015) ^ 0xA64557A9 | ((((v88 << 16) + 116064256) ^ 0x6EA0000)
                                    - ((2 * (((v88 << 16) + 116064256) ^ 0x6EA0000)) & 0x6B20000)
                                    + 525931784) ^ 0x1F591508;
  int v500 = v87 ^ v89;
  int v473 = ((v87 ^ v89) ^ 0x53) - ((2 * (v87 ^ v89 ^ 0x53)) & 0x1BE);
  int v104 = (v91 ^ 0x7C) - ((2 * (v91 ^ 0x7C)) & 0xF2);
  unsigned int v105 = (v103 - ((2 * v103) & 0x3B277BD2) + 496221673) ^ 0x1D93BDE9 | ((v94 ^ 0xF6)
                                                                      - ((2 * (v94 ^ 0xF6)) & 0x1B4)
                                                                      - 1694088486) ^ 0x9B0642DA;
  unsigned int v106 = *(_DWORD *)(v2 - 196) ^ v462;
  int v107 = (v99 >> 27) + (~(2 * (v99 >> 27)) | 0xFFFFFFA3) - 81;
  HIDWORD(v99) = v107 ^ 0xE;
  LODWORD(v99) = (v107 ^ 0xFFFFFFBF) << 24;
  int v108 = (((v105 - ((2 * v105) & 0xBFD3CC)) << 8) + 1609164288) ^ 0x5FE9E600;
  int v484 = (v99 >> 29) - ((2 * (v99 >> 29)) & 0x10) - 120;
  unsigned int v109 = (((v102 << 8) + 142935552) ^ 0x8850600) - ((2 * (((v102 << 8) + 142935552) ^ 0x8850600)) & 0xD32CEC00);
  unsigned int v110 = (v108 - ((2 * v108) & 0xB85D6400) + 1546564323) ^ 0x5C2EB2E3 | ((v477 ^ 0x6D)
                                                                       - ((2 * (v477 ^ 0x6D)) & 0xC8)
                                                                       - 931178908) ^ 0xC87F5664;
  unsigned int v111 = v439 ^ v84;
  int v112 = v81 ^ (v439 ^ v84);
  int v113 = v512 ^ (v80 >> 8);
  int v114 = v487 ^ HIBYTE(v80);
  unsigned int v115 = v93 ^ HIWORD(v66) ^ 0xFFFFFFD6;
  unsigned int v116 = *(_DWORD *)(v2 - 164);
  unsigned int v117 = 1062196213 * ((v110 - ((2 * v110) & 0x58418E4A) - 1407138011) ^ 0xAC20C725)
       - ((2124392426 * ((v110 - ((2 * v110) & 0x58418E4A) - 1407138011) ^ 0xAC20C725)) & 0xBFFA1846)
       - 537064413;
  int v118 = v92 ^ (v89 >> 8);
  unsigned int v119 = (HIWORD(v116) ^ 0xFFFFFFA2) + ((v116 >> 15) & 0x1FFE4 ^ 0xFFFFFFA0) + v115;
  int v120 = 2 * ((v115 & (HIWORD(v116) ^ 0x50)) - ((2 * (v115 & (HIWORD(v116) ^ 0x50))) & 0x12)) + 18;
  int v121 = v91 ^ HIBYTE(v106);
  *(_DWORD *)(v2 - 164) = v121;
  unsigned int v122 = (v109 + 1771468480) ^ 0x699676C0 | ((v114 ^ 0xF4) - 2 * ((v114 ^ 0xF4) & 0x3F) - 1189724865) ^ 0xB9163D3F;
  unsigned int v123 = ((v119 + 14) ^ 0x7F) + 2 * (v119 + 14) + (v120 ^ 0xFFFFFFDF) + ((2 * v120) & 0x64 ^ 0xFFFFFFDB) + 1;
  unsigned int v124 = v123 - ((2 * v123 + 104) & 0xFFFFFFCC);
  unsigned int v125 = (v122 - ((2 * v122) & 0x91FF0196) - 922779445) ^ 0xC8FF80CB;
  *(_DWORD *)(v2 - 196) = 842553393 * v125 - ((1685106786 * v125) & 0xC6A34C7C) + 1666295358;
  int v126 = v73 ^ v116 ^ v66;
  unsigned int v127 = v90 ^ ((v116 ^ v66) >> 8);
  unsigned int v128 = v94 ^ ((v116 ^ v66) >> 24);
  int v129 = (v112 ^ 0x68) - ((2 * v112) & 0xA);
  int v130 = ((((v118 ^ 0x18) - ((2 * (v118 ^ 0x18)) & 0xF6)) << 16) + 981139456) ^ 0x3A7B0000;
  int v131 = ((((v121 ^ 0xF0) - ((2 * (v121 ^ 0xF0)) & 0x8C)) << 8) + 1001801216) ^ 0x3BB64600;
  int v132 = (v130 - ((2 * v130) & 0x33BA0000) + 1507665899) ^ 0x59DD27EB | (v131 - ((2 * v131) & 0x7FBD7800) + 1071561852) ^ 0x3FDEBC7C;
  unsigned int v133 = v132 + 1807062635 + (~(2 * v132) | 0xA894D329);
  int v134 = v113 ^ (v111 >> 8);
  int v135 = BYTE2(v85) ^ *(_DWORD *)(v2 - 220);
  unsigned int v136 = ((((v471 << 16) - 1858600960) ^ 0x91380000)
        - ((2 * (((v471 << 16) - 1858600960) ^ 0x91380000)) & 0x5FC80000)
        - 270237285) ^ 0xEFE4819B | ((((v104 << 8) + 2111535360) ^ 0x7DDB7900)
                                   - ((2 * (((v104 << 8) + 2111535360) ^ 0x7DDB7900)) & 0x3D0C3A00)
                                   + 1585847790) ^ 0x5E861DEE;
  unsigned int v137 = v136 - ((2 * v136) & 0x3605669E);
  int v138 = v79 ^ (v106 >> 8);
  *(_DWORD *)(v2 - 220) = v138;
  int v139 = (v138 ^ 0x5D) - ((2 * (v138 ^ 0x5D)) & 0x176);
  unsigned int v140 = ((((v113 ^ 0xDD) - ((2 * (v113 ^ 0xDD)) & 0x106)) << 8) - 680033536) ^ 0xD7778300;
  unsigned int v141 = (v140 - ((2 * v140) & 0x52F53A00) - 1451582173) ^ 0xA97A9D23 | ((((v100 << 16) + 287768576) ^ 0x11270000)
                                                                       - ((2 * (((v100 << 16) + 287768576) ^ 0x11270000)) & 0x1FC0000)
                                                                       + 1090443918) ^ 0x40FEDA8E;
  int v142 = (v135 ^ 0x81) - ((2 * (v135 ^ 0x81)) & 0xBE);
  int v143 = v135 ^ BYTE2(v89);
  unsigned int v144 = (v475 + 103369766) ^ 0x6294C26 | (v141 - ((2 * v141) & 0x4CDF91E6) - 1502623501) ^ 0xA66FC8F3;
  unsigned int v145 = v144 - ((2 * v144) & 0xB6CD20);
  int v146 = *(_DWORD *)(v2 - 216) ^ HIBYTE(v85);
  int v147 = ((((v127 ^ 0xE4) - ((2 * v127) & 0x22)) << 8) + 1604391168) ^ 0x5FA11100;
  unsigned int v148 = (v147 - ((2 * v147) & 0x1C68EE00) + 238319542) ^ 0xE3477B6 | ((((v139 << 16) + 1220214784) ^ 0x48BB0000)
                                                                     - ((2 * (((v139 << 16) + 1220214784) ^ 0x48BB0000)) & 0x647E0000)
                                                                     - 230704576) ^ 0xF23FBA40;
  unsigned int v149 = (v137 - 1694321841) ^ 0x9B02B34F | (v142 - 529927585) ^ 0xE069F25F;
  unsigned int v150 = v117 ^ v442;
  int v151 = (v117 ^ v442) ^ v112;
  int v152 = (((v149 - ((2 * v149) & 0x8B7AB8)) << 8) + 1170037760) ^ 0x45BD5C00;
  unsigned int v153 = ((v484 ^ 0x88) - ((2 * (v484 ^ 0x88)) & 0x18E) + 1133230023) ^ 0x438BB7C7 | (v152 - ((2 * v152) & 0xF3D55C00) - 102060462) ^ 0xF9EAAE52;
  unsigned int v154 = (v153 - ((2 * v153) & 0xC15AB98C) + 1621974214) ^ 0x60AD5CC6;
  unsigned int v155 = 842822710 - 371456631 * v154 - ((1404570386 * v154) & 0x6478E86C);
  int v156 = ((((v126 ^ 0xB5) - ((2 * (v126 ^ 0xB5)) & 0x48)) << 8) + 1711219712) ^ 0x65FF2400;
  unsigned int v157 = (v156 - ((2 * v156) & 0x73052A00) + 2038601191) ^ 0x798295E7 | ((((v473 << 16) - 2082537472) ^ 0x83DF0000)
                                                                       - ((2 * (((v473 << 16) - 2082537472) ^ 0x83DF0000)) & 0x52A40000)
                                                                       - 1454196450) ^ 0xA952B91E;
  int v158 = v106 ^ 0x59 ^ v466;
  unsigned int v159 = (v148 - ((2 * v148) & 0x1EDC2C8) - 2131304092) ^ 0x80F6E164 | ((v106 ^ 0x59 ^ v466)
                                                                      - ((2 * v158) & 0x13A)
                                                                      - 245508707) ^ 0xF15DD59D;
  unsigned int v160 = v159 - ((2 * v159) & 0xA4B5EE);
  unsigned int v161 = (v157 - ((2 * v157) & 0x4676688C) - 482659258) ^ 0xE33B3446 | ((v128 ^ 0x8B)
                                                                      - ((2 * (v128 ^ 0x8B)) & 0x12E)
                                                                      + 1978814103) ^ 0x75F24E97;
  unsigned int v162 = v161 - ((2 * v161) & 0xCBD56A);
  int v163 = (v133 + 1) ^ 0x6BB5966B | ((v143 ^ 0xF) - ((2 * (v143 ^ 0xF)) & 0xD2) + 1966851689) ^ 0x753BC669;
  int v164 = ((((v134 ^ 0x2B) - ((2 * (v134 ^ 0x2B)) & 0x5A)) << 8) + 2052533504) ^ 0x7A572D00;
  unsigned int v165 = (v164 - ((2 * v164) & 0x177D4600) + 1270784936) ^ 0x4BBEA3A8 | ((((v129 << 16) - 301662208) ^ 0xEE050000)
                                                                       - ((2 * (((v129 << 16) - 301662208) ^ 0xEE050000)) & 0x30380000)
                                                                       - 1742945470) ^ 0x981CC342;
  unsigned int v166 = v165 - ((2 * v165) & 0x2A2E5CE);
  int v167 = v477 ^ HIWORD(v106);
  unsigned int v168 = (((v162 << 8) + 1709880576) ^ 0x65EAB500) - ((2 * (((v162 << 8) + 1709880576) ^ 0x65EAB500)) & 0xE2DFD400);
  unsigned int v169 = ((((v145 << 8) - 614035456) ^ 0xDB669000)
        - ((2 * (((v145 << 8) - 614035456) ^ 0xDB669000)) & 0xE2465E00)
        + 1898131269) ^ 0x71232F45 | ((v146 ^ 0x3A) - ((2 * (v146 ^ 0x3A)) & 0x13C) - 857463138) ^ 0xCCE4269E;
  unsigned int v170 = (v169 - ((2 * v169) & 0x893134D2) + 1150851689) ^ 0x44989A69;
  int v171 = -654471207 * v170 - ((838541234 * v170) & 0x3E224092) - 1626267575;
  unsigned int v172 = (((v160 << 8) + 1381693184) ^ 0x525AF700) - ((2 * (((v160 << 8) + 1381693184) ^ 0x525AF700)) & 0xC2C1C000);
  unsigned int v173 = (((v163 - ((2 * v163) & 0x402214)) << 8) - 1609496064) ^ 0xA0110A00;
  unsigned int v174 = v173 - ((2 * v173) & 0xF50F7000);
  int v175 = v114 ^ HIBYTE(v111);
  int v176 = v484 ^ HIWORD(v111);
  int v177 = (v172 + 1633738891) ^ 0x6160E08B | ((v175 ^ 0x21) - ((2 * v175) & 0x98) + 1007146828) ^ 0x3C07D74C;
  int v178 = (v168 + 1903160009) ^ 0x716FEAC9 | ((v167 ^ 0x9F) - ((2 * (v167 ^ 0x9F)) & 0xA4) + 727316306) ^ 0x2B59F752;
  unsigned int v179 = (v178 - ((2 * v178) & 0xC8AA5AAE) - 464179881) ^ 0xE4D52D57;
  int v513 = 1062196213 * v179 - ((245344234 * v179) & 0x886019A) + 71499981;
  unsigned int v180 = (v177 - ((2 * v177) & 0x83E023FC) - 1041231362) ^ 0xC1F011FE;
  unsigned int v181 = 842553393 * v180 - ((611364962 * v180) & 0x3F457E3C) + 530759454;
  unsigned int v182 = v124 - 102;
  int v183 = (((v124 - 102) ^ 0xE6) - ((2 * ((v124 - 102) ^ 0xE6)) & 0x16E) + 649067959) ^ 0x26AFFDB7 | (v166 + 1095856871) ^ 0x415172E7;
  int v481 = v151;
  unsigned int v184 = (v151 ^ 6) - ((2 * v151) & 0xFFFFFFF3);
  unsigned int v185 = (((v183 - ((2 * v183) & 0xEEB99E)) << 8) - 144912640) ^ 0xF75CCF00;
  unsigned int v186 = ((v176 ^ 0x99) - ((2 * (v176 ^ 0x99)) & 0x62) - 1505048527) ^ 0xA64AC831 | (v174 + 2055714862) ^ 0x7A87B82E;
  int v187 = v146 ^ HIBYTE(v89);
  unsigned int v188 = (v185 - ((2 * v185) & 0xCC3C7000) + 1713256624) ^ 0x661E38B0 | ((v187 ^ 0x36)
                                                                       - ((2 * (v187 ^ 0x36)) & 0x64)
                                                                       + 2032259122) ^ 0x7921D032;
  unsigned int v189 = (v186 - ((2 * v186) & 0xB0E84BF6) - 663476741) ^ 0xD87425FB;
  unsigned int v190 = -371456631 * v189 - ((-742913262 * v189) & 0xAE9EBF3A) - 682664035;
  unsigned int v191 = (v188 - ((2 * v188) & 0x55E28876) - 1427028933) ^ 0xAAF1443B;
  unsigned int v192 = -654471207 * v191 - ((-1308942414 * v191) & 0xD8986532) + 1816933017;
  unsigned int v193 = *(_DWORD *)(v2 - 196) ^ v503;
  unsigned int v194 = v155 ^ *(_DWORD *)(v2 - 160);
  unsigned int v195 = v127 ^ (v155 >> 8) ^ 0xFFFFFF90;
  int v196 = BYTE2(v193) ^ v143;
  *(_DWORD *)(v2 - 160) = v193 ^ v500;
  int v197 = ((v193 ^ v500) ^ 0x29) - ((2 * (v193 ^ v500)) & 0x80);
  unsigned int v198 = ((v171 ^ 0x49) & v158) + (~(2 * ((v171 ^ 0x49) & v158)) | 0xFFFFFF9D);
  int v199 = v128 ^ HIBYTE(v194);
  *(_DWORD *)(v2 - 196) = v199;
  int v200 = v182 ^ HIWORD(v194);
  int v501 = v200;
  int v201 = v126 ^ v194;
  int v202 = ((((v201 ^ 0x41) - ((2 * (v201 ^ 0x41)) & 0xA0)) << 8) + 1112494080) ^ 0x424F5000;
  unsigned int v203 = ((((v197 << 16) + 1161822208) ^ 0x45400000)
        - 1346271872
        + (~(2 * (((v197 << 16) + 1161822208) ^ 0x45400000)) | 0xA07DFFFF)
        + 1) ^ 0xAFC18580 | (v202 - ((2 * v202) & 0x4FBED400) + 1742695061) ^ 0x67DF6A95;
  unsigned int v204 = v203 - ((2 * v203) & 0x70187B0);
  unsigned int v478 = ((v195 | v443 ^ 0xFFFFFFFC) - ((2 * (v195 | v443 ^ 0xFFFFFFFC)) & 0xFFFFFFFB) + 125) ^ ((v195 & (v443 ^ 0xFFFFFFFC))
                                                                                               - ((2
                                                                                                 * (v195 & (v443 ^ 0xFFFFFFFC))) & 0x30)
                                                                                               + 24);
  unsigned int v205 = (v171 ^ 0x49 | v158) - ((v171 ^ 0x49 | v158) >> 5 << 6);
  unsigned int v485 = v190;
  int v488 = v134 ^ (v150 >> 8);
  HIDWORD(v99) = v201 ^ v190 ^ 0x1C;
  LODWORD(v99) = (v201 ^ ~v190) << 24;
  int v206 = v118 ^ (v193 >> 8) ^ 0x6A;
  int v207 = ((v118 ^ BYTE1(v193)) ^ 0x6A) - ((2 * v206) & 0x1AA);
  unsigned int v208 = v181;
  unsigned int v209 = (v206 & ((v181 >> 8) ^ 0xFFFFFFBF)) - ((2 * (v206 & ((v181 >> 8) ^ 0xFFFFFFBF))) & 0x4A);
  int v210 = v176 ^ HIWORD(v150);
  int v211 = v175 ^ HIBYTE(v150);
  int v504 = v211;
  int v212 = (v99 >> 30) - ((2 * (v99 >> 30)) & 0xFFFFFFFB) + 125;
  HIDWORD(v99) = v212 ^ 1;
  LODWORD(v99) = (v212 ^ 0x7C) << 24;
  int v213 = (((v184 << 16) + 1324941312) ^ 0x4EF90000) - ((2 * (((v184 << 16) + 1324941312) ^ 0x4EF90000)) & 0x35F40000);
  unsigned int v214 = ((((v488 ^ 0xC7) - ((2 * (v488 ^ 0xC7)) & 0x132)) << 8) - 1296066304) ^ 0xB2BF9900;
  int v215 = (v214 - ((2 * v214) & 0xD6DAC00) + 1186387511) ^ 0x46B6D637 | (v213 + 1526337231) ^ 0x5AFA0ECF;
  unsigned int v216 = *(_DWORD *)(v2 - 192);
  unsigned int v217 = *(_DWORD *)(v2 - 164) ^ ((v171 ^ v216) >> 24);
  *(_DWORD *)(v2 - 216) = v181;
  unsigned int v218 = (v181 >> 8) + (~(v181 >> 7) & 0x7E) + v206;
  int v219 = (v215 - ((2 * v215) & 0x1479F4B0) + 171768408) ^ 0xA3CFA58 | ((v200 ^ 0x7B)
                                                                     - ((2 * (v200 ^ 0x7B)) & 0xF6)
                                                                     + 1489638267) ^ 0x58CA137B;
  int v220 = v219 - ((2 * v219) & 0xE5C2AA);
  unsigned int v221 = *(_DWORD *)(v2 - 220) ^ ((v171 ^ v216) >> 8);
  unsigned int v222 = v167 ^ ((v171 ^ v216) >> 16);
  *(_DWORD *)(v2 - 164) = v222;
  unsigned int v223 = ((v218 + 65) ^ 0xFFFFFFE7)
       + ((2 * (v218 + 65)) & 0xFFFFFFCF)
       + ((2 * v209 + 74) ^ 0xFFFFFF83)
       + ((2 * (2 * v209 + 74)) & 0x6C ^ 0xFFFFFFFB);
  int v224 = (v211 ^ 0xAB) - ((2 * (v211 ^ 0xAB)) & 0x55555555);
  int v225 = (v205 + 96) ^ v216 ^ (v198 - 78);
  unsigned int v226 = ((((v217 ^ 0xAF) - ((2 * (v217 ^ 0xAF)) & 0x170)) << 8) - 433014784) ^ 0xE630B800;
  unsigned int v227 = ((((v207 << 16) + 1893007360) ^ 0x70D50000)
        - ((2 * (((v207 << 16) + 1893007360) ^ 0x70D50000)) & 0x4BA00000)
        + 634416609) ^ 0x25D06DE1 | (v226 - ((2 * v226) & 0x5EBE5A00) - 278975064) ^ 0xEF5F2DA8;
  unsigned int v228 = v227 - ((2 * v227) & 0x52CC58B4);
  int v229 = ((((v221 ^ 0x83) - ((2 * (v221 ^ 0x83)) & 0x152)) << 16) + 1789460480) ^ 0x6AA90000;
  unsigned int v230 = ((((v478 ^ 0x65) - ((2 * (v478 ^ 0x65)) & 0xDA)) << 8) - 1214681856) ^ 0xB7996D00;
  unsigned int v231 = (v229 - ((2 * v229) & 0x7E200000) + 1058061698) ^ 0x3F10BD82 | (v230 - ((2 * v230) & 0x3E4D1C00) - 551121257) ^ 0xDF268E97;
  int v232 = v187 ^ HIBYTE(v193);
  unsigned int v233 = ((((v220 << 8) - 220113664) ^ 0xF2E15500)
        - ((2 * (((v220 << 8) - 220113664) ^ 0xF2E15500)) & 0x577EAC00)
        - 1413523960) ^ 0xABBF5608 | ((v232 ^ 0x63) - ((2 * (v232 ^ 0x63)) & 0x196) + 543159755) ^ 0x205FF5CB;
  int v234 = v196;
  unsigned int v235 = (v228 - 1452921766) ^ 0xA9662C5A | ((v196 ^ 0x38) - ((2 * (v196 ^ 0x38)) & 0xDDDDDDDD) - 2059853074) ^ 0x853922EE;
  unsigned int v236 = (v233 - ((2 * v233) & 0x9A9ACC52) - 850565591) ^ 0xCD4D6629;
  unsigned int v237 = v192 ^ *(_DWORD *)(v2 - 188);
  unsigned int v238 = (v204 + 58770392) ^ 0x380C3D8 | ((v199 ^ 0xC2) - ((2 * (v199 ^ 0xC2)) & 0x130) - 1267211880) ^ 0xB477E198;
  unsigned int v239 = (v231 - ((2 * v231) & 0x53AB12FA) - 1445623427) ^ 0xA9D5897D | ((v225 ^ 0x66)
                                                                       - ((2 * (v225 ^ 0x66)) & 0x14A)
                                                                       - 1118859355) ^ 0xBD4F8FA5;
  unsigned int v240 = (((v238 + (~(2 * v238) | 0xDBB5A1)) << 8) - 1843056640) ^ 0x92252F00;
  unsigned int v241 = v240 - ((2 * v240) & 0xED0D9600);
  int v242 = (((v239 - ((2 * v239) & 0x3D394C)) << 8) + 513582592) ^ 0x1E9CA600;
  unsigned int v243 = (v242 - ((2 * v242) & 0x70333C00) - 1206280680) ^ 0xB8199E18 | (v224 - 1343278678) ^ 0xAFEF31AA;
  int v244 = v481 ^ (v513 ^ v444);
  unsigned int v245 = (((((v235 - ((2 * v235) & 0x5F5DD4)) << 8) + 799992320) ^ 0x2FAEEA00)
        - ((2 * ((((v235 - ((2 * v235) & 0x5F5DD4)) << 8) + 799992320) ^ 0x2FAEEA00)) & 0x8E412A00)
        - 954165996) ^ 0xC7209514 | ((v210 ^ 0x63) - ((2 * (v210 ^ 0x63)) & 0x46) - 1804063197) ^ 0x94782E23;
  int v246 = *(_DWORD *)(v2 - 156);
  *(_DWORD *)(v2 - 188) = ((v99 >> 26) - ((2 * (v99 >> 26)) & 0x14) + 10) ^ v246;
  unsigned int v247 = v485 ^ v246;
  unsigned int v248 = (v243 - ((2 * v243) & 0xBECFA1D8) + 1600639212) ^ 0x5F67D0EC;
  int v249 = 842553393 * v248 - ((1685106786 * v248) & 0x74DF9610) - 1167078648;
  int v250 = (v223 + 1 + ~(2 * ((v223 + 17) & 0x27 ^ (v223 + 1) & 1)) + 119) ^ (v506 >> 8);
  unsigned int v251 = v221 ^ (v237 >> 8) ^ 0xFFFFFF82;
  *(_DWORD *)(v2 - 156) = v251;
  int v252 = ((v221 ^ BYTE1(v237)) ^ 0x82) - ((2 * v251) & 0x8E);
  unsigned int v253 = (v245 - ((2 * v245) & 0xF6578BEA) - 81017355) ^ 0xFB2BC5F5;
  unsigned int v254 = (v241 - 158938121) ^ 0xF686CBF7 | ((v222 ^ 0xE7) - ((2 * (v222 ^ 0xE7)) & 0x70) + 1991705656) ^ 0x76B70438;
  unsigned int v255 = v254 - ((2 * v254) & 0x696BEC04);
  unsigned int v256 = v208 ^ v506;
  int v257 = v234 ^ ((v208 ^ v506) >> 16);
  int v258 = v217 ^ HIBYTE(v237);
  *(_DWORD *)(v2 - 192) = v237;
  *(_DWORD *)(v2 - 220) = v244;
  int v259 = ((((v250 ^ 0xE7) - ((2 * (v250 ^ 0xE7)) & 0x14)) << 16) + 1846149120) ^ 0x6E0A0000;
  unsigned int v260 = (((((v217 ^ HIBYTE(v237)) ^ 0xEC) - ((2 * (v258 ^ 0xEC)) & 0xE4)) << 8) - 48729600) ^ 0xFD187200;
  unsigned int v261 = (v259 - ((2 * v259) & 0x209A0000) + 273502320) ^ 0x104D5070 | (v260 - ((2 * v260) & 0x693A4800) - 1264769866) ^ 0xB49D24B6;
  unsigned int v262 = v249 ^ v445;
  unsigned int v505 = v504 ^ ((v513 ^ v444) >> 24);
  unsigned int v263 = v210 ^ ((v513 ^ v444) >> 16);
  unsigned int v510 = v488 ^ ((v513 ^ v444) >> 8);
  unsigned int v514 = v247;
  int v264 = v478 ^ (v247 >> 8);
  int v265 = (((((v478 ^ BYTE1(v247)) ^ 0xEC) - ((2 * (v264 ^ 0xEC)) & 0x60)) << 8) + 1969041408) ^ 0x755D3000;
  unsigned int v266 = ((((v252 << 16) - 649658368) ^ 0xD9470000)
        - ((2 * (((v252 << 16) - 649658368) ^ 0xD9470000)) & 0x28CE0000)
        - 731401366) ^ 0xD467B36A | (v265 - ((2 * v265) & 0x18239800) - 1944990678) ^ 0x8C11CC2A;
  unsigned int v267 = v266 - ((2 * v266) & 0x724BEDF4);
  int v268 = v232 ^ HIBYTE(v256);
  int v269 = ((((v244 ^ 0x88) - ((2 * v244) & 0xC0)) << 16) + 241172480) ^ 0xE600000;
  int v270 = ((((v510 ^ 0x68) - ((2 * (v510 ^ 0x68)) & 0x11A)) << 8) + 581733632) ^ 0x22AC8D00;
  int v271 = (v270 - ((2 * v270) & 0x5E63BA00) + 1865538849) ^ 0x6F31DD21 | (v269 - ((2 * v269) & 0x4E020000) + 1728151833) ^ 0x67018119;
  int v272 = v271 - ((2 * v271) & 0x36B1323A);
  unsigned int v273 = (v261 - ((2 * v261) & 0x6CA0F008) + 911243268) ^ 0x36507804 | ((v257 ^ 0x94)
                                                                      - ((2 * (v257 ^ 0x94)) & 0x3A)
                                                                      - 1895829987) ^ 0x8EFFEE1D;
  unsigned int v274 = v273 - ((2 * v273) & 0x5EF048);
  int v275 = v237 ^ v225;
  unsigned int v276 = (v267 - 114952454) ^ 0xF925F6FA | (((v237 ^ v225) ^ 0x4A)
                                          - ((2 * (v237 ^ v225 ^ 0x4A)) & 0x12E)
                                          + 576637591) ^ 0x225ECA97;
  int v277 = v501 ^ HIWORD(v247);
  int v278 = ((v501 ^ BYTE2(v247)) ^ 0xA9) - ((2 * v277) & 0x20);
  unsigned int v279 = (1062196213 * ((v255 - 1263143422) ^ 0xB4B5F602)
        - ((2124392426 * ((v255 - 1263143422) ^ 0xB4B5F602)) & 0x7F45E7CC)
        + 1067643878) ^ v446;
  unsigned int v280 = ((((v274 << 8) + 796402688) ^ 0x2F782400)
        - ((2 * (((v274 << 8) + 796402688) ^ 0x2F782400)) & 0xABF46A00)
        + 1442461170) ^ 0x55FA35F2 | ((v263 ^ 0x6D) - ((2 * (v263 ^ 0x6D)) & 0x11E) + 2026723727) ^ 0x78CD598F;
  unsigned int v281 = (v272 - 1688692451) ^ 0x9B58991D | (v278 - 969731824) ^ 0xC6331110;
  unsigned int v282 = v281 - ((2 * v281) & 0x9C314);
  int v283 = (((v276 - ((2 * v276) & 0x74C7EE)) << 8) + 979629824) ^ 0x3A63F700;
  int v284 = (v280 - ((2 * v280) & 0x2B5A661C) + 363672334) ^ 0x15AD330E;
  unsigned int v285 = -371456631 * v284 - ((-742913262 * v284) & 0xE11CEFB8) - 259098660;
  unsigned int v286 = (-371456631 * v253 - ((-742913262 * v253) & 0xA34565CC) + 1369617126) ^ *(_DWORD *)(v2 - 152);
  unsigned int v287 = v250 ^ ((v249 ^ v445) >> 8);
  *(_DWORD *)(v2 - 152) = v287;
  int v288 = (v287 ^ 0x74) - ((2 * (v287 ^ 0x74)) & 0x13C);
  unsigned int v289 = ((((v282 << 8) + 81889792) ^ 0x4E18A00)
        - ((2 * (((v282 << 8) + 81889792) ^ 0x4E18A00)) & 0x45C33800)
        - 1562272726) ^ 0xA2E19C2A | ((v268 ^ 0x53) - ((2 * (v268 ^ 0x53)) & 0x180) - 1099065920) ^ 0xBE7D95C0;
  unsigned int v290 = (v289 - ((2 * v289) & 0x2D4E04EC) - 1767439754) ^ 0x96A70276;
  int v489 = -654471207 * v290 - ((838541234 * v290) & 0x33FE3764) - 1711334478;
  unsigned int v291 = (v283 - ((2 * v283) & 0x777D2800) + 1002345681) ^ 0x3BBE94D1 | ((v505 ^ 0xAB)
                                                                       - ((2 * (v505 ^ 0xAB)) & 0x2E)
                                                                       - 1928865513) ^ 0x8D07D917;
  int v292 = (v291 - ((2 * v291) & 0x7598E8D0) + 986477672) ^ 0x3ACC7468;
  unsigned int v293 = 842553393 * v292 - ((1685106786 * v292) & 0x8A88543A) - 985388515;
  int v294 = ((v249 ^ v445) >> 16) ^ v257;
  unsigned int v295 = -654471207 * v236 - ((838541234 * v236) & 0x6E84BFBE) + 927096799;
  unsigned int v296 = v295 ^ *(_DWORD *)(v2 - 184);
  int v507 = v258 ^ HIBYTE(v296);
  int v297 = ((((v507 ^ 0xD4) - ((2 * v507) & 0x12)) << 8) + 1448806656) ^ 0x565B0900;
  unsigned int v298 = (v297 - ((2 * v297) & 0x38AFE000) + 475525189) ^ 0x1C57F045 | ((((v288 << 16) - 811728896) ^ 0xCF9E0000)
                                                                      - ((2 * (((v288 << 16) - 811728896) ^ 0xCF9E0000)) & 0xBA00000)
                                                                      - 2049916922) ^ 0x85D0C006;
  unsigned int v299 = (v298 - ((2 * v298) & 0x952E5598) - 896062772) ^ 0xCA972ACC | ((v294 ^ 0xF6)
                                                                      - ((2 * (v294 ^ 0xF6)) & 0x12E)
                                                                      - 555139689) ^ 0xDEE93D97;
  int v300 = (((v299 - ((2 * v299) & 0xC40222)) << 8) + 1644237056) ^ 0x62011100;
  int v502 = v263 ^ HIWORD(v279);
  unsigned int v301 = (v300 - ((2 * v300) & 0xFC083C00) - 33284465) ^ 0xFE041E8F | (((v263 ^ BYTE2(v279)) ^ 0x90)
                                                                     - 2
                                                                     * (((v263 ^ BYTE2(v279)) ^ 0x90) & 0x3F)
                                                                     - 1644082369) ^ 0x9E014B3F;
  unsigned int v302 = (v301 - 945739587 + (~(2 * v301) | 0x70BDAE85) + 1) ^ 0xC7A128BD;
  int v486 = v296 ^ v275;
  unsigned __int8 v303 = v489 ^ v296 ^ v275 ^ 0x49;
  unsigned int v304 = ((-119 * v302 - ((18 * v302) & 0xDA) - 19) ^ *(unsigned char *)(v2 - 148)) ^ 0x8392447F;
  unsigned int v305 = (-371456631 * v302 - ((-742913262 * v302) & 0xA268D7DA) + 1362389997) ^ *(_DWORD *)(v2 - 148);
  unsigned int v482 = v305;
  unsigned int v306 = ((v305 & 0xFF00 ^ 0x4900 | 0xEBFFDA34) - (v305 & 0xFF00 ^ 0x4900 | 0x140025CB) + 335553995) ^ 0x927F1A3F;
  unsigned int v307 = (v306 - ((2 * v306) & 0x1DDADAE0) - 1897042576) ^ 0xF76D697B | (v304 - ((2 * v304) & 0x120884A) - 191240923) ^ 0x770BA134;
  unsigned int v308 = v307 - ((2 * v307) & 0x6474B2F0);
  unsigned int v479 = v293;
  int v309 = *(_DWORD *)(v2 - 180) ^ *(_DWORD *)(v2 - 168) ^ v293;
  *(_DWORD *)(v2 - 148) = v309;
  int v310 = BYTE2(v309) ^ v294;
  if ((v303 & !(v491 & 1)) != 0) {
    char v311 = 0;
  }
  else {
    char v311 = (2 * (v491 & 1)) ^ 2;
  }
  int v312 = *(_DWORD *)(v2 - 144);
  unsigned int v313 = v285;
  int v314 = v312 ^ *(_DWORD *)(v2 - 136) ^ v285;
  int v315 = *(_DWORD *)(v2 - 188);
  int v316 = (v312 ^ *(unsigned char *)(v2 - 136) ^ v285 ^ v286 ^ v315);
  *(_DWORD *)(v2 - 136) = v310 == 61;
  BOOL v317 = v316 == 226 && v308 == 0;
  int v318 = v277 ^ HIWORD(v286);
  BOOL v319 = v317 && (v277 ^ BYTE2(v286) ^ BYTE2(v314)) == 191;
  int v320 = v264 ^ (v286 >> 8);
  BOOL v321 = v319 && (v264 ^ BYTE1(v286) ^ BYTE1(v314)) == 43;
  unsigned int v322 = (((2 * (v305 & 0xFF0000 ^ 0xAD0000)) & 0x14C0000) - (v305 & 0xFF0000 ^ 0xAD0000) - 1554391448) ^ 0xEF5D4C78;
  unsigned int v323 = ((2 * v322) & 0xC8FF2420) - v322;
  BOOL v324 = v321 && v323 == 1009488400;
  int v325 = v279 ^ *(_DWORD *)(v2 - 220);
  *(_DWORD *)(v2 - 220) = v325;
  int v326 = (v325 ^ 0x3A) - ((2 * (v325 ^ 0x3A)) & 0x1C);
  int v327 = v510 ^ (v279 >> 8);
  int v328 = (((((v510 ^ BYTE1(v279)) ^ 0xCC) - ((2 * (v327 ^ 0xCC)) & 0x9A)) << 8) + 425020672) ^ 0x19554D00;
  int v329 = (v328 - ((2 * v328) & 0x65406600) + 849359691) ^ 0x32A0334B | ((((v326 << 16) + 34471936) ^ 0x20E0000)
                                                                      - ((2 * (((v326 << 16) + 34471936) ^ 0x20E0000)) & 0x3CD80000)
                                                                      + 510396492) ^ 0x1E6C084C;
  unsigned int v330 = (v329 - ((2 * v329) & 0x4301A2A2) - 1585393327) ^ 0xA180D151 | ((v318 ^ 0x37)
                                                                       - ((2 * (v318 ^ 0x37)) & 0x1C2)
                                                                       + 784432097) ^ 0x2EC17BE1;
  int v331 = (((v330 - ((2 * v330) & 0xED7784)) << 8) + 1992016384) ^ 0x76BBC200;
  int v511 = v268 ^ HIBYTE(v262);
  int v332 = (v331 - ((2 * v331) & 0x28E0F600) + 342915957) ^ 0x14707B75 | ((v511 ^ 0x8E)
                                                                      - ((2 * (v511 ^ 0x8E)) & 0x138)
                                                                      + 917189788) ^ 0x36AB349C;
  int v333 = (v332 - ((2 * v332) & 0x4A3E31A0) + 622794960) ^ 0x251F18D0;
  int v334 = -654471207 * v333 - ((838541234 * v333) & 0x3214C620) + 420111120;
  unsigned int v335 = *(_DWORD *)(v2 - 176);
  char v336 = (((2 * (v335 & 0xFE ^ 0xCC)) | 0xA) - (v335 & 0xFE ^ 0xCC) + 123) ^ 0xE5;
  LOBYTE(v333) = ((v491 & 1) + v303 + v311 - 1 - ((2 * ((v491 & 1) + v303 + v311 - 1)) & 0xD4) + 106) ^ (((2 * v336) & 0xA4) - v336 - 83);
  int v337 = *(_DWORD *)(v2 - 172);
  unsigned __int8 v338 = v333 ^ v337 ^ ((v334 ^ 0x10 | v333 ^ 0xCD) - ((2 * (v334 ^ 0x10 | v333 ^ 0xCD)) & 0x4A) - 91) ^ (((v334 ^ 0x10) & (v333 ^ 0xCD)) + (~(2 * ((v334 ^ 0x10) & (v333 ^ 0xCD))) | 0xDF) - 111);
  int v339 = *(_DWORD *)(v2 - 204);
  int v340 = (v333 ^ v339);
  BOOL v342 = v324 && v340 == 22 && v338 == 135;
  int v343 = *(_DWORD *)(v2 - 160) ^ *(_DWORD *)(v2 - 216) ^ v508;
  int v344 = (v343 ^ 0x37) - ((2 * (v343 ^ 0x37)) & 0xEE);
  int v345 = ((((v315 ^ 0x14) - ((2 * (v315 ^ 0x14)) & 0x1EE)) << 8) + 852621056) ^ 0x32D1F700;
  int v346 = ((((v344 << 16) + 729219072) ^ 0x2B770000)
        - ((2 * (((v344 << 16) + 729219072) ^ 0x2B770000)) & 0x1AC20000)
        + 1298252413) ^ 0x4D61C27D | (v345 - ((2 * v345) & 0x6CE61400) + 913509072) ^ 0x36730AD0;
  char v347 = v262 ^ v343;
  int v348 = ((v262 ^ v343) ^ 0xBE) - ((2 * (v262 ^ v343 ^ 0xBE)) & 0x158);
  int v349 = *(_DWORD *)(v2 - 196) ^ HIBYTE(v514);
  unsigned int v350 = (v346 - ((2 * v346) & 0x2D935484) - 691426750) ^ 0xD6C9AA42 | ((v349 ^ 0x6F)
                                                                      - ((2 * (v349 ^ 0x6F)) & 0x1BE)
                                                                      + 1662209503) ^ 0x63134DDF;
  unsigned int v351 = *(_DWORD *)(v2 - 184);
  int v352 = (((v295 >> 8) ^ 0x5F | *(_DWORD *)(v2 - 156)) - ((2 * ((v295 >> 8) ^ 0x5F | *(_DWORD *)(v2 - 156))) & 0x4E) - 89) ^ (v351 >> 8) ^ ((((v295 >> 8) ^ 0x5F) & *(_DWORD *)(v2 - 156)) - ((2 * (((v295 >> 8) ^ 0x5F) & *(_DWORD *)(v2 - 156))) & 0x1FFFF8C) + 70);
  HIDWORD(v353) = v352 ^ 0x3B;
  LODWORD(v353) = (v352 ^ 0x40) << 24;
  int v354 = (v353 >> 30) - ((2 * (v353 >> 30)) & 0xFFFFFFCC) + 102;
  HIDWORD(v353) = v354 ^ 6;
  LODWORD(v353) = (v354 ^ 0x60) << 24;
  int v355 = (v353 >> 29) + (~(2 * (v353 >> 29)) | 0x6D) + 74;
  HIDWORD(v353) = v355 ^ 9;
  LODWORD(v353) = (v355 ^ 0x40) << 24;
  int v356 = (((v350 - ((2 * v350) & 0x193EA)) << 8) + 13235456) ^ 0xC9F500;
  unsigned int v357 = *(_DWORD *)(v2 - 164) ^ HIWORD(*(_DWORD *)(v2 - 192)) ^ 0xFFFFFFF7;
  unsigned int v358 = (v356 - ((2 * v356) & 0xEFE13C00) + 2012257977) ^ 0x77F09EB9 | (((*(unsigned char *)(v2 - 164) ^ HIWORD(*(_DWORD *)(v2 - 192))) ^ 0xF7)
                                                                       - ((2 * v357) & 0xB4)
                                                                       - 246229926) ^ 0xF152D45A;
  unsigned int v359 = (((((v286 ^ v315) ^ 0x7D) - ((2 * (v286 ^ v315 ^ 0x7D)) & 0x174)) << 8) - 1286096384) ^ 0xB357BA00;
  unsigned int v360 = (v359 - ((2 * v359) & 0x4D995E00) - 422793367) ^ 0xE6CCAF69 | ((((v348 << 16) - 492044288) ^ 0xE2AC0000)
                                                                      - ((2 * (((v348 << 16) - 492044288) ^ 0xE2AC0000)) & 0x5A280000)
                                                                      + 756299769) ^ 0x2D1437F9;
  unsigned int v361 = (v358 - ((2 * v358) & 0xBBFFB902) - 570434431) ^ 0xDDFFDC81;
  int v362 = 1062196213 * v361 - ((513779690 * v361) & 0x1C8C7B54) - 1907999318;
  int v363 = v349 ^ HIBYTE(v286);
  unsigned int v364 = (v360 - ((2 * v360) & 0x322D8E9A) + 1494665037) ^ 0x5916C74D | ((v363 ^ 0xC)
                                                                       - ((2 * (v363 ^ 0xC)) & 0x48)
                                                                       - 66836956) ^ 0xFC042624;
  unsigned int v365 = v364 - ((2 * v364) & 0x5403F6);
  unsigned int v366 = (((HIWORD(v295) ^ 0x42) & v357) - ((2 * ((HIWORD(v295) ^ 0x42) & v357)) & 0x1FFFC) + 126) ^ HIWORD(v351) ^ ((HIWORD(v295) ^ 0x42 | v357) - ((2 * (HIWORD(v295) ^ 0x42 | v357)) & 0xFFFFFFD4) + 106);
  unsigned int v367 = (((v365 << 8) - 1442710784) ^ 0xAA01FB00) - ((2 * (((v365 << 8) - 1442710784) ^ 0xAA01FB00)) & 0x3DE70A00);
  LOBYTE(v351) = v347 ^ v293 ^ 0xA3;
  int v368 = *(_DWORD *)(v2 - 180);
  char v369 = 2 * ((v351 & (v368 ^ 0x21)) - ((2 * (v351 & (v368 ^ 0x21))) & 0x24)) + 36;
  int v370 = v505 ^ HIBYTE(v279);
  char v371 = (v368 ^ 0x1E) + ((2 * (v368 & 0x3F)) ^ 0x42) + v351;
  int v372 = (v353 >> 29) - ((2 * (v353 >> 29)) & 0xFFFFFFAA) + 85;
  int v373 = ((((v372 ^ 0x55) - ((2 * (v372 ^ 0x55)) & 0xB2)) << 16) + 609812480) ^ 0x24590000;
  int v374 = ((((v320 ^ 0xDC) - ((2 * (v320 ^ 0xDC)) & 0xC)) << 8) + 1278412288) ^ 0x4C330600;
  int v375 = (v373 - ((2 * v373) & 0x331C0000) + 428797539) ^ 0x198EEE63 | (v374 - ((2 * v374) & 0x4EE37E00) + 1735507925) ^ 0x6771BFD5;
  unsigned int v376 = (v375 - ((2 * v375) & 0x664BA860) - 1289366480) ^ 0xB325D430 | ((v486 ^ 0xFB)
                                                                       - ((2 * (v486 ^ 0xFB)) & 0x30)
                                                                       + 246752792) ^ 0xEB52618;
  int v377 = (((v376 + (~(2 * v376) | 0x35E3B7)) << 8) + 1695425792) ^ 0x650E2400;
  unsigned int v378 = (v377 - ((2 * v377) & 0x7D535200) - 1096177306) ^ 0xBEA9A966 | ((v370 ^ 0xE2)
                                                                       - ((2 * (v370 ^ 0xE2)) & 0x192)
                                                                       - 1939851319) ^ 0x8C6037C9;
  int v379 = (v378 - ((2 * v378) & 0x783DB9EC) + 1008655606) ^ 0x3C1EDCF6;
  *(_DWORD *)(v2 - 144) = ((v363 ^ ((v313 ^ v312) >> 24)) ^ 0xF6EF7AB2)
                        + ((2 * (v363 ^ ((v313 ^ v312) >> 24) ^ 0x29)) & 0x136)
                        + 152077669;
  unsigned int v380 = (v367 - 1628207743) ^ 0x9EF38581 | ((v366 ^ 0xEE) - ((2 * (v366 ^ 0xEE)) & 0xEE) + 913316471) ^ 0x36701A77;
  unsigned int v381 = (v380 - ((2 * v380) & 0x83D7F174) - 1041499974) ^ 0xC1EBF8BA;
  int v382 = (842553393 * v379 - ((1685106786 * v379) & 0x42E64232) - 1586290407) ^ *(_DWORD *)(v2 - 212);
  char v383 = ((v371 - 63) ^ 0x5F) + ((2 * (v371 - 63)) & 0xBF) + (v369 ^ 0x35) + ((2 * v369) & 0xDD ^ 0xB7);
  int v384 = ((49 * v379 - ((98 * v379) & 0x32) + 25) ^ *(unsigned char *)(v2 - 212)) ^ 0x105C0052;
  unsigned int v385 = (1062196213 * v381 - ((2124392426 * v381) & 0xCEFFF75E) + 1736440751) ^ v494;
  unsigned int v386 = v327 ^ ((v362 ^ v493) >> 8);
  HIDWORD(v353) = v386 ^ (v385 >> 8);
  LODWORD(v353) = (HIDWORD(v353) ^ 0xEC) << 24;
  int v387 = (v353 >> 25) - 8 * ((v353 >> 25) >> 2) + 124;
  HIDWORD(v353) = v387 ^ 0x1C;
  LODWORD(v353) = (v387 ^ 0x60) << 24;
  int v388 = (v353 >> 29) - ((2 * (v353 >> 29)) & 0xFFFFFFEF);
  HIDWORD(v353) = -124 - v388;
  LODWORD(v353) = ((v388 + 119) ^ 0x77777777) << 24;
  int v389 = v334 ^ v337;
  int v390 = (v353 >> 26) - ((2 * (v353 >> 26)) & 0x40);
  unsigned int v391 = ((v389 & 0xFF00 ^ 0x7B00 | 0x9D528BDF) - (v389 & 0xFF00 ^ 0x7B00 | 0x62AD7420) + 1655534624) ^ 0x1C5296DE;
  unsigned int v392 = (((2 * v391) | 0xF36F2708) - v391 - 2042073988) ^ 0xF8B7D385;
  unsigned int v393 = (v384 + (v382 & 0x8E ^ 0xCB83888C) - (v384 & 0x44008E)) ^ 0xDB9B88CA | ((v392 | v389 & 0xFF0000 ^ 0xE90000)
                                                                               - 2
                                                                               * ((v392 | v389 & 0xFF0000 ^ 0xE90000) & 0x50972F57 ^ v392 & 3)
                                                                               - 795398316) ^ 0xD0972F54;
  unsigned int v394 = v393 - ((2 * v393) & 0x396373F8);
  unsigned int v395 = ((v382 & 0xFF0000 ^ 0x640000) + (v382 & 0xB50000 ^ 0x5091EF81) - ((v382 & 0xFF0000 ^ 0x640000) & 0xB50000)) ^ 0x8B89B311;
  unsigned int v396 = ((v395 | 0xF0DC8A7E) - (v395 | 0xF237581) + 253982081) ^ 0x2B5ED6EE | ((-11 * v381
                                                                                                - ((-22 * v381) & 0x5E)
                                                                                                - 81) ^ v494) ^ 0x59;
  unsigned int v397 = v396 - ((2 * v396) & 0x283C493C);
  unsigned int v398 = *(_DWORD *)(v2 - 208);
  int v399 = v335 ^ v339 ^ v489;
  unsigned int v400 = v479 ^ v368;
  unsigned int v401 = v370 ^ ((v362 ^ v493) >> 24) ^ 0x97;
  int v402 = v401 ^ 0x7FEDBBFE;
  int v403 = v511 ^ HIBYTE(v400) ^ 0x8F;
  int v404 = (v366 ^ BYTE2(v399));
  int v405 = (2 * v401) & 0x1FC;
  int v406 = (v372 ^ BYTE1(v399));
  BOOL v407 = v342 && v406 == 110;
  int v408 = v403 ^ 0x777FEEF2;
  int v409 = (2 * v403) & 0x1E4;
  char v410 = v390 + 32;
  BOOL v412 = v407 && (v482 ^ 0xB000000) >> 24 == 0 && (*(_DWORD *)(v2 - 200) ^ 0xEC) == *(_DWORD *)(v2 - 144);
  int v413 = v408 + v409 - 2004872946;
  int v414 = v402 + v405 - 2146286590;
  int v431 = v412
      && (v383 - 111) == (*(_DWORD *)(v2 - 168) ^ 5)
      && v404 == 62
      && v394 == 0
      && (*(_DWORD *)(v2 - 152) ^ BYTE1(*(_DWORD *)(v2 - 148))) == 114
      && (v495 ^ 0xEB) == v413
      && (v496 ^ 0xF8) == ((v507 ^ ((v489 ^ v335) >> 24)) ^ 0x7CFF9F3C)
                        + ((2 * (v507 ^ ((v489 ^ v335) >> 24) ^ 0xDD)) & 0x1C2)
                        - 2097127393
      && ((v493 ^ v497 ^ v362) ^ *(_DWORD *)(v2 - 220)) == 124
      && (v410 ^ v386) == 172
      && (((v382 & 0xFF00 ^ 0xDBB104E9) - 1) ^ 0xD9C665E9 | 0x7DB233F1)
       - (((v382 & 0xFF00 ^ 0xDBB104E9) - 1) ^ 0xD9C665E9 | 0x824DCC0E) == -42513182
      && (v492 ^ ((v362 ^ v398) >> 16) ^ v502) == 53
      && (v386 ^ BYTE1(v398)) == 8
      && v397 == 0
      && (((v382 ^ 0x1CDA4A16 | v389 ^ 0xC3E9266F) ^ 0x6EF7EBEF)
        - 1861741551
        + ((2 * (v382 ^ 0x1CDA4A16 | v389 ^ 0xC3E9266F)) & 0xDDEFD7DE)) >> 24 == 0
      && (((v385 & 0xFF0000 ^ 0xA2BED027) - 1) ^ 0xB380D736)
       - ((2 * (((v385 & 0xFF0000 ^ 0xA2BED027) - 1) ^ 0xB380D736)) & 0x201E0820) == -241369360
      && (v490 ^ 0x48) == v414
      && (v385 ^ 0x35000000) >> 24 == 0;
  if ((*(_DWORD *)(v2 - 136) & v431) != 0) {
    int v432 = 66312069;
  }
  else {
    int v432 = 66312070;
  }
  uint64_t result = v498;
  *(_DWORD *)(v498 + 24) = v432;
  return result;
}

uint64_t sub_210B153B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = qword_26776F1B8 - qword_26776F1D8 - (void)&v11;
  qword_26776F1D8 = 266878957 * v4 - 0xF8C5DD1A957CD00;
  qword_26776F1B8 = 266878957 * (v4 ^ 0xF073A22E56A83300);
  v7[0] = qword_26C314690;
  v7[1] = a1;
  int v8 = a3;
  uint64_t v9 = a2;
  uint64_t v10 = a4;
  unsigned int v13 = v7;
  LOBYTE(v4) = -46 * v4;
  char v5 = byte_210B165E0[byte_210B164E0[v4] ^ 0x9D];
  v12[0] = 111364217
         * ((((2 * (&vars0 - 24)) | 0x3A2C5A84) - (&vars0 - 24) + 1659491006) ^ 0xD7FEBE4C)
         - 250794294;
  ((void (*)(_DWORD *))*(&off_26C3145D0 + (v4 ^ v5) - 91))(v12);
  return v12[1];
}

uint64_t sub_210B154F8(int a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = qword_26776F1B8 - qword_26776F1E0 - (void)&v7;
  qword_26776F1E0 = (266878957 * v2) ^ 0xF073A22E56A83300;
  qword_26776F1B8 = 266878957 * (v2 ^ 0xF073A22E56A83300);
  int v6 = a1;
  v5[0] = qword_26C314608;
  v5[1] = a2;
  uint64_t v9 = v5;
  unsigned __int8 v3 = byte_210B167E0[unk_210B166E0 ^ 0xA3];
  v8[0] = 111364217
        * ((&vars0 - 1403023817 - 2 * ((&vars0 - 24) & 0xAC5F8E4F)) ^ 0xE6B71D41)
        - 250794294;
  ((void (*)(_DWORD *))*(&off_26C3145D0 + v3 - 42))(v8);
  return v8[1];
}

uint64_t sub_210B1563C(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v1 = qword_26776F1C0 ^ (unint64_t)&v5 ^ qword_26776F1B8;
  qword_26776F1C0 = (266878957 * v1) ^ 0xF073A22E56A83300;
  qword_26776F1B8 = 266878957 * (v1 ^ 0xF073A22E56A83300);
  unint64_t v2 = 462267737
     * ((2 * ((unint64_t)&v6 & 0x2333668BA929A930) - (void)&v6 - 0x2333668BA929A937) ^ 0x81F9149964B95D8ELL);
  int v6 = 1995507721 - v2;
  unsigned __int8 v3 = byte_210B15FE0[unk_210B15EE0 ^ 0x34];
  uint64_t v7 = a1;
  uint64_t v8 = v2 ^ qword_26C314660;
  ((void (*)(int *))*(&off_26C3145D0 + v3 - 15))(&v6);
  return v9;
}

unsigned char *sub_210B15798(unsigned char *result, unsigned int a2, unint64_t a3)
{
  unint64_t v3 = -(int)result & 7;
  if (v3 > a3) {
    LODWORD(v3) = a3;
  }
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  unint64_t v4 = a3 - v3;
  if (v4 >= 8)
  {
    uint64_t v5 = 0x101010101010101 * a2;
    unint64_t v6 = ((v4 >> 3) + 7) >> 3;
    switch((v4 >> 3) & 7)
    {
      case 1uLL:
        goto LABEL_20;
      case 2uLL:
        goto LABEL_19;
      case 3uLL:
        goto LABEL_18;
      case 4uLL:
        goto LABEL_17;
      case 5uLL:
        goto LABEL_16;
      case 6uLL:
        goto LABEL_15;
      case 7uLL:
        goto LABEL_14;
      default:
        do
        {
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_14:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_15:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_16:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_17:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_18:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_19:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_20:
          *(void *)uint64_t result = v5;
          result += 8;
          --v6;
        }
        while (v6);
        break;
    }
  }
  switch(v4 & 7)
  {
    case 1uLL:
      goto LABEL_28;
    case 2uLL:
      goto LABEL_27;
    case 3uLL:
      goto LABEL_26;
    case 4uLL:
      goto LABEL_25;
    case 5uLL:
      goto LABEL_24;
    case 6uLL:
      goto LABEL_23;
    case 7uLL:
      *result++ = a2;
LABEL_23:
      *result++ = a2;
LABEL_24:
      *result++ = a2;
LABEL_25:
      *result++ = a2;
LABEL_26:
      *result++ = a2;
LABEL_27:
      *result++ = a2;
LABEL_28:
      *uint64_t result = a2;
      break;
    default:
      return result;
  }
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
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

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

uint64_t CMBaseGetClassID()
{
  return MEMORY[0x270EE79B8]();
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

uint64_t CMNotificationCenterRegisterForBarrierSupport()
{
  return MEMORY[0x270EE7B98]();
}

uint64_t FigBaseObjectCopyDebugDescription()
{
  return MEMORY[0x270EE8010]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x270EE8118]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x270EE8120]();
}

uint64_t FigEventCreate()
{
  return MEMORY[0x270EE8210]();
}

uint64_t FigEventSet()
{
  return MEMORY[0x270EE8218]();
}

uint64_t FigEventWaitRelative()
{
  return MEMORY[0x270EE8220]();
}

uint64_t FigGetUpTimeNanoseconds()
{
  return MEMORY[0x270EE8258]();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return MEMORY[0x270EE8300]();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return MEMORY[0x270EE8308]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

uint64_t FigThreadCreate()
{
  return MEMORY[0x270EE8400]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x270EE8418]();
}

uint64_t IOAVServiceGetContentProtectionCapabilities()
{
  return MEMORY[0x270EF3ED8]();
}

uint64_t IOMobileFramebufferCreateDisplayList()
{
  return MEMORY[0x270F3D3C8]();
}

uint64_t IOMobileFramebufferDisableHotPlugDetectNotifications()
{
  return MEMORY[0x270F3D3D0]();
}

uint64_t IOMobileFramebufferEnableHotPlugDetectNotifications()
{
  return MEMORY[0x270F3D3D8]();
}

uint64_t IOMobileFramebufferGetHDCPAuthenticationProtocol()
{
  return MEMORY[0x270F3D3E8]();
}

uint64_t IOMobileFramebufferGetHDCPRunLoopSource()
{
  return MEMORY[0x270F3D3F0]();
}

uint64_t IOMobileFramebufferGetHotPlugRunLoopSource()
{
  return MEMORY[0x270F3D3F8]();
}

uint64_t IOMobileFramebufferGetProtectionOptions()
{
  return MEMORY[0x270F3D400]();
}

uint64_t IOMobileFramebufferHDCPGetReply()
{
  return MEMORY[0x270F3D408]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x270F3D418]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t __IOAVCopyFirstMatchingIOAVObjectOfType()
{
  return MEMORY[0x270EF4BF8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
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

void objc_enumerationMutation(id obj)
{
}