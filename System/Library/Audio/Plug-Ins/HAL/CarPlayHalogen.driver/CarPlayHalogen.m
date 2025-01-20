uint64_t sub_3CF4(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5, uint64_t a6, void *a7)
{
  OpaqueCMClock *HostTimeClock;
  uint64_t CMBaseObject;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void, uint64_t, CFTypeRef *);
  uint64_t DerivedStorage;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void, uint64_t, CFTypeRef *);
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, void, uint64_t, uint64_t);
  int v45;
  OpaqueCMClock *v47;
  int v48;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v52;
  CFTypeRef v53;
  CFTypeRef v54;
  CFTypeRef v55;
  unsigned int v56;

  v54 = 0;
  v55 = 0;
  v53 = 0;
  v52 = kCMTimeInvalid;
  if (!a2 || !a3 || !a4 || !a5 || !a7)
  {
    APSLogErrorAt();
    v48 = -16891;
LABEL_92:
    v56 = v48;
    goto LABEL_63;
  }
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v52, HostTimeClock);
  if (!APSGetFBOPropertyInt64())
  {
LABEL_91:
    APSLogErrorAt();
    v48 = -16720;
    goto LABEL_92;
  }
  CMBaseObject = FigEndpointStreamGetCMBaseObject();
  v15 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v16 + 48);
  if (v17) {
    v17(CMBaseObject, kFigEndpointStreamProperty_Type, a1, &v54);
  }
  if (!FigCFEqual())
  {
    APSLogErrorAt();
    v48 = -16760;
    goto LABEL_92;
  }
  FigHALAudioDeviceGetClassID();
  v56 = CMDerivedObjectCreate();
  if (v56) {
    goto LABEL_62;
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)DerivedStorage = a3;
  *(void *)(DerivedStorage + 8) = a2;
  *(void *)(DerivedStorage + 24) = CFRetain(a4);
  *(void *)(DerivedStorage + 32) = CFRetain(a5);
  v19 = sub_8230(a1);
  *(void *)(DerivedStorage + 384) = v19;
  if (!v19)
  {
    APSLogErrorAt();
    v48 = -16890;
    goto LABEL_92;
  }
  v20 = FigEndpointGetCMBaseObject();
  v21 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v21) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  v23 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 48);
  if (v23) {
    v23(v20, kFigEndpointProperty_Name, a1, DerivedStorage + 56);
  }
  if (!*(void *)(DerivedStorage + 56)) {
    goto LABEL_91;
  }
  v24 = FigEndpointGetCMBaseObject();
  v25 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v25) {
    v26 = v25;
  }
  else {
    v26 = 0;
  }
  v27 = *(uint64_t (**)(uint64_t, void, uint64_t, CFTypeRef *))(v26 + 48);
  if (!v27)
  {
    v56 = -12782;
    goto LABEL_62;
  }
  v56 = v27(v24, kFigEndpointProperty_TransportType, a1, &v53);
  if (v56) {
    goto LABEL_62;
  }
  v28 = 1937012580;
  if (!FigCFEqual())
  {
    if (!FigCFEqual())
    {
      v56 = -16720;
      goto LABEL_62;
    }
    v28 = 1937012588;
  }
  *(_DWORD *)(DerivedStorage + 364) = v28;
  *(unsigned char *)(DerivedStorage + 369) = APSGetFBOPropertyInt64() != 0;
  *(unsigned char *)(DerivedStorage + 368) = APSGetFBOPropertyInt64() != 0;
  v29 = FigEndpointStreamGetCMBaseObject();
  v30 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v30) {
    v31 = v30;
  }
  else {
    v31 = 0;
  }
  v32 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 48);
  if (!v32)
  {
    v56 = -12782;
    goto LABEL_62;
  }
  v56 = v32(v29, kFigEndpointStreamProperty_ID, a1, DerivedStorage + 48);
  if (v56) {
    goto LABEL_62;
  }
  v33 = FigEndpointStreamGetCMBaseObject();
  v34 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v34) {
    v35 = v34;
  }
  else {
    v35 = 0;
  }
  v36 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 48);
  if (!v36)
  {
    v56 = -12782;
    goto LABEL_62;
  }
  v56 = v36(v33, kFigEndpointStreamProperty_SubType, a1, DerivedStorage + 40);
  if (v56) {
    goto LABEL_62;
  }
  v37 = FigEndpointStreamGetCMBaseObject();
  v38 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v38) {
    v39 = v38;
  }
  else {
    v39 = 0;
  }
  v40 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 48);
  if (!v40)
  {
    v56 = -12782;
    goto LABEL_62;
  }
  v56 = v40(v37, kAPEndpointStreamCarPlayAudioProperty_CarPlayAudioFormats, a1, DerivedStorage + 64);
  if (v56) {
    goto LABEL_62;
  }
  v41 = FigEndpointStreamGetCMBaseObject();
  v42 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v42) {
    v43 = v42;
  }
  else {
    v43 = 0;
  }
  v44 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 48);
  if (!v44)
  {
    v56 = -12782;
    goto LABEL_62;
  }
  v56 = v44(v41, kAPEndpointStreamCarPlayAudioProperty_AudioZeroTimeStampProvider, a1, DerivedStorage + 80);
  if (v56)
  {
LABEL_62:
    APSLogErrorAt();
    goto LABEL_63;
  }
  v45 = FigCFEqual();
  if (v45)
  {
    *(_DWORD *)(DerivedStorage + 360) = 1937010030;
    v56 = sub_47D0();
    if (v56) {
      goto LABEL_62;
    }
    goto LABEL_75;
  }
  if (FigCFEqual())
  {
    *(_DWORD *)(DerivedStorage + 360) = 1937006956;
    v56 = sub_47D0();
    if (v56) {
      goto LABEL_62;
    }
    goto LABEL_75;
  }
  if (!FigCFEqual())
  {
    v56 = -16760;
    goto LABEL_62;
  }
  *(_DWORD *)(DerivedStorage + 360) = 1937006968;
  v56 = sub_47D0();
  if (v56) {
    goto LABEL_62;
  }
LABEL_75:
  v56 = FigHALAudioObjectMapperAddMapping();
  if (v56) {
    goto LABEL_62;
  }
  if (v45)
  {
    v56 = sub_829C(a1, a2, a3, *(_DWORD *)(DerivedStorage + 16), a5, 1, *(const void **)(DerivedStorage + 384), (void *)(DerivedStorage + 392));
    if (v56) {
      goto LABEL_62;
    }
  }
  v56 = sub_829C(a1, a2, a3, *(_DWORD *)(DerivedStorage + 16), a5, 0, *(const void **)(DerivedStorage + 384), (void *)(DerivedStorage + 400));
  if (v56) {
    goto LABEL_62;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  v56 = FigNotificationCenterAddWeakListener();
  if (v56) {
    goto LABEL_62;
  }
  *(void *)(DerivedStorage + 72) = CFStringCreateF();
  if (v56) {
    goto LABEL_62;
  }
  *a7 = v55;
  v55 = 0;
  if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize()))
  {
    v47 = CMClockGetHostTimeClock();
    CMClockGetTime(&lhs, v47);
    rhs = v52;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeGetSeconds(&time);
    LogPrintF();
  }
LABEL_63:
  if (v53) {
    CFRelease(v53);
  }
  if (v54) {
    CFRelease(v54);
  }
  if (v55) {
    CFRelease(v55);
  }
  return v56;
}

uint64_t sub_47D0()
{
  CMBaseObjectGetDerivedStorage();
  if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t HALDescriptions = APCarPlayAudioFormatsGetHALDescriptions();
  if (HALDescriptions)
  {
    uint64_t v2 = HALDescriptions;
    APSLogErrorAt();
  }
  else
  {
    APSLogErrorAt();
    return 4294895185;
  }
  return v2;
}

uint64_t sub_4BA0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(unsigned char *)(DerivedStorage + 20) = 1;
  if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  uint64_t v1 = *(void *)(DerivedStorage + 400);
  if (v1)
  {
    uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v2) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    v4 = *(void (**)(uint64_t))(v3 + 8);
    if (v4) {
      v4(v1);
    }
    FigHALAudioObjectMapperRemoveMapping();
  }
  uint64_t v5 = *(void *)(DerivedStorage + 392);
  if (v5)
  {
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(void (**)(uint64_t))(v7 + 8);
    if (v8) {
      v8(v5);
    }
    FigHALAudioObjectMapperRemoveMapping();
  }
  uint64_t result = FigHALAudioObjectMapperRemoveMapping();
  *(_DWORD *)(DerivedStorage + 16) = 0;
  return result;
}

void sub_4DB4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterRemoveWeakListener();
  if (*(_DWORD *)(DerivedStorage + 16)) {
    FigHALAudioObjectMapperRemoveMapping();
  }
  uint64_t v1 = *(const void **)(DerivedStorage + 24);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 24) = 0;
  }
  uint64_t v2 = *(const void **)(DerivedStorage + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 32) = 0;
  }
  uint64_t v3 = *(const void **)(DerivedStorage + 80);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(DerivedStorage + 80) = 0;
  }
  v4 = *(const void **)(DerivedStorage + 40);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(DerivedStorage + 40) = 0;
  }
  uint64_t v5 = *(const void **)(DerivedStorage + 48);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(DerivedStorage + 48) = 0;
  }
  uint64_t v6 = *(const void **)(DerivedStorage + 56);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(DerivedStorage + 56) = 0;
  }
  uint64_t v7 = *(const void **)(DerivedStorage + 64);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(DerivedStorage + 64) = 0;
  }
  v8 = *(const void **)(DerivedStorage + 376);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(DerivedStorage + 376) = 0;
  }
  v9 = *(const void **)(DerivedStorage + 384);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(DerivedStorage + 384) = 0;
  }
  v10 = *(const void **)(DerivedStorage + 392);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(DerivedStorage + 392) = 0;
  }
  v11 = *(const void **)(DerivedStorage + 400);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(DerivedStorage + 400) = 0;
  }
  v12 = *(const void **)(DerivedStorage + 72);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(DerivedStorage + 72) = 0;
  }
}

CFStringRef sub_4ED8(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v7 = *(void *)(DerivedStorage + 32);
  uint64_t v6 = *(unsigned int *)(DerivedStorage + 16);
  ASPrintF();
  CFAllocatorRef v3 = CFGetAllocator(a1);
  CFStringRef v4 = CFStringCreateWithFormat(v3, 0, @"%s", "CarAudioStream", v6, v7);
  free(0);
  return v4;
}

uint64_t sub_4F64()
{
  return *(unsigned int *)(CMBaseObjectGetDerivedStorage() + 16);
}

uint64_t sub_4F80(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = 0;
  int v5 = *a2;
  if (*a2 > 1853059618)
  {
    if (v5 <= 1937007733)
    {
      if (v5 <= 1919512166)
      {
        if (v5 > 1869180522)
        {
          if (v5 == 1869180523) {
            return 1;
          }
          int v6 = 1870098020;
        }
        else
        {
          if (v5 == 1853059619) {
            return 1;
          }
          int v6 = 1853059700;
        }
        goto LABEL_57;
      }
      if (v5 <= 1936092275)
      {
        if (v5 == 1919512167) {
          return 1;
        }
        int v6 = 1935763060;
        goto LABEL_57;
      }
      if (v5 == 1936092276 || v5 == 1936879204) {
        return 1;
      }
      unsigned __int16 v7 = 24948;
    }
    else if (v5 > 1937012084)
    {
      if (v5 > 1937138531)
      {
        if (v5 == 1937138532) {
          return *(unsigned __int8 *)(DerivedStorage + 369);
        }
        if (v5 == 1969841184) {
          return 1;
        }
        int v6 = 1953653102;
        goto LABEL_57;
      }
      if (v5 == 1937012085) {
        return 1;
      }
      unsigned __int16 v7 = 30324;
    }
    else if (v5 <= 1937010546)
    {
      if (v5 == 1937007734) {
        return 1;
      }
      unsigned __int16 v7 = 27939;
    }
    else
    {
      if (v5 == 1937010547 || v5 == 1937011572) {
        return 1;
      }
      unsigned __int16 v7 = 29812;
    }
    int v6 = v7 | 0x73740000;
    goto LABEL_57;
  }
  if (v5 <= 1684434035)
  {
    if (v5 <= 1668050794)
    {
      if (v5 > 1668047218)
      {
        if (v5 == 1668047219) {
          return 1;
        }
        int v6 = 1668049764;
      }
      else
      {
        if (v5 == 1634429294) {
          return 1;
        }
        int v6 = 1650682995;
      }
    }
    else if (v5 <= 1668575851)
    {
      if (v5 == 1668050795) {
        return 1;
      }
      int v6 = 1668510818;
    }
    else
    {
      if (v5 == 1668575852 || v5 == 1668641652) {
        return 1;
      }
      int v6 = 1684236338;
    }
LABEL_57:
    if (v5 != v6) {
      return result;
    }
    return 1;
  }
  if (v5 > 1818850925)
  {
    if (v5 <= 1819173228)
    {
      if (v5 == 1818850926) {
        return 1;
      }
      int v6 = 1819107691;
    }
    else
    {
      if (v5 == 1819173229 || v5 == 1819569763) {
        return 1;
      }
      int v6 = 1836411236;
    }
    goto LABEL_57;
  }
  if (v5 > 1718839673)
  {
    if (v5 != 1718839674 && v5 != 1735354734)
    {
      int v6 = 1751737454;
      goto LABEL_57;
    }
    return 1;
  }
  if (v5 == 1684434036) {
    return 1;
  }
  if (v5 == 1718383987) {
    return *(unsigned char *)(DerivedStorage + 368) && *(_DWORD *)(*(void *)(DerivedStorage + 384) + 16) == 1635020133;
  }
  return result;
}

uint64_t sub_52F4(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v4 = *a2;
  if (*a2 == 1718383987)
  {
    return *(unsigned char *)(DerivedStorage + 368) && *(_DWORD *)(*(void *)(DerivedStorage + 384) + 16) == 1635020133;
  }
  else if (v4 == 1937138532)
  {
    return *(unsigned __int8 *)(DerivedStorage + 369);
  }
  else
  {
    return v4 == 1937006964;
  }
}

uint64_t sub_5384(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = 0;
  int v5 = *a2;
  if (*a2 <= 1853059618)
  {
    if (v5 > 1718383986)
    {
      if (v5 > 1818850925)
      {
        if (v5 <= 1819173228)
        {
          if (v5 == 1818850926) {
            return 4;
          }
          int v8 = 1819107691;
        }
        else
        {
          if (v5 == 1819173229) {
            return 8;
          }
          if (v5 == 1819569763) {
            return 4;
          }
          int v8 = 1836411236;
        }
        goto LABEL_45;
      }
      if (v5 <= 1735354733)
      {
        if (v5 != 1718383987)
        {
          int v7 = 1718839674;
          goto LABEL_63;
        }
        return 8;
      }
      if (v5 == 1735354734) {
        return 4;
      }
      int v7 = 1751737454;
    }
    else
    {
      if (v5 > 1668050794)
      {
        if (v5 <= 1668641651)
        {
          if (v5 != 1668050795)
          {
            int v7 = 1668510818;
            goto LABEL_63;
          }
          return 4;
        }
        if (v5 == 1668641652) {
          return 96;
        }
        if (v5 != 1684236338)
        {
          int v7 = 1684434036;
          goto LABEL_63;
        }
        return 8;
      }
      if (v5 <= 1668047218)
      {
        if (v5 != 1634429294)
        {
          int v7 = 1650682995;
          goto LABEL_63;
        }
        return 4;
      }
      if (v5 == 1668047219) {
        return 4;
      }
      int v7 = 1668049764;
    }
LABEL_63:
    if (v5 != v7) {
      return result;
    }
    return 4;
  }
  if (v5 <= 1937007733)
  {
    if (v5 <= 1919512166)
    {
      if (v5 > 1869180522)
      {
        if (v5 == 1869180523) {
          return 4;
        }
        int v9 = 1870098020;
        goto LABEL_54;
      }
      if (v5 != 1853059619)
      {
        int v8 = 1853059700;
LABEL_45:
        if (v5 != v8) {
          return result;
        }
        return 8;
      }
    }
    else
    {
      if (v5 <= 1936092275)
      {
        if (v5 != 1919512167)
        {
          int v7 = 1935763060;
          goto LABEL_63;
        }
        return 4;
      }
      if (v5 == 1936092276) {
        return 4;
      }
      if (v5 != 1936879204)
      {
        unsigned __int16 v6 = 24948;
        goto LABEL_49;
      }
    }
    return 32;
  }
  if (v5 > 1937012084)
  {
    if (v5 > 1937138531)
    {
      if (v5 == 1937138532) {
        return 8;
      }
      if (v5 == 1953653102) {
        return 4;
      }
      int v8 = 1969841184;
      goto LABEL_45;
    }
    if (v5 != 1937012085)
    {
      unsigned __int16 v6 = 30324;
      goto LABEL_49;
    }
    return 8;
  }
  if (v5 <= 1937010546)
  {
    if (v5 == 1937007734) {
      return 4;
    }
    int v9 = 1937009955;
LABEL_54:
    if (v5 != v9) {
      return result;
    }
    int v10 = a2[1];
    switch(v10)
    {
      case 1869968496:
        uint64_t v12 = *(void *)(DerivedStorage + 400);
        break;
      case 1768845428:
        uint64_t v12 = *(void *)(DerivedStorage + 392);
        break;
      case 1735159650:
        if (*(void *)(DerivedStorage + 400)) {
          int v11 = (*(void *)(DerivedStorage + 392) != 0) + 1;
        }
        else {
          int v11 = *(void *)(DerivedStorage + 392) != 0;
        }
        return (4 * v11);
      default:
        return 0;
    }
    int v11 = v12 != 0;
    return (4 * v11);
  }
  if (v5 != 1937010547 && v5 != 1937011572)
  {
    unsigned __int16 v6 = 29812;
LABEL_49:
    int v7 = v6 | 0x73740000;
    goto LABEL_63;
  }
  return 4;
}

uint64_t sub_5744(const void *a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, int *a6, _OWORD *a7)
{
  unsigned int v39 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFTypeRef cf = 0;
  if (dword_10000 <= 30 && (dword_10000 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v13 = *a2;
  if (*a2 <= 1836411235)
  {
    if (v13 <= 1684236337)
    {
      if (v13 <= 1668050794)
      {
        if (v13 > 1668047218)
        {
          if (v13 == 1668047219)
          {
            *a6 = 4;
            if (a5 >= 4)
            {
              int v14 = 0;
              unsigned int v15 = 1633969526;
              goto LABEL_138;
            }
            goto LABEL_139;
          }
          int v20 = 1668049764;
          goto LABEL_65;
        }
        if (v13 != 1634429294)
        {
          if (v13 == 1650682995)
          {
            *a6 = 4;
            if (a5 >= 4)
            {
              int v14 = 0;
              unsigned int v15 = 1634689642;
              goto LABEL_138;
            }
            goto LABEL_139;
          }
          goto LABEL_103;
        }
        *a6 = 4;
        if (a5 >= 4) {
          *(_DWORD *)a7 = *(_DWORD *)(DerivedStorage + 16);
        }
        goto LABEL_144;
      }
      if (v13 > 1668575851)
      {
        if (v13 == 1668575852)
        {
          *a6 = 0;
          goto LABEL_144;
        }
        if (v13 != 1668641652) {
          goto LABEL_103;
        }
        if (a5 <= 0x5F)
        {
          int v37 = 561211770;
          goto LABEL_160;
        }
        a7[2] = xmmword_AD58;
        a7[3] = *(_OWORD *)"sulfwwar";
        a7[4] = xmmword_AD78;
        a7[5] = unk_AD88;
        *a7 = *(_OWORD *)"tatswwar";
        a7[1] = *(_OWORD *)"wwar";
        int v27 = 96;
LABEL_110:
        *a6 = v27;
        goto LABEL_144;
      }
      if (v13 == 1668050795)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          int v14 = 0;
          unsigned int v15 = 1835103847;
          goto LABEL_138;
        }
        goto LABEL_139;
      }
      if (v13 != 1668510818) {
        goto LABEL_103;
      }
      *a6 = 4;
      if (a5 < 4) {
        goto LABEL_139;
      }
      int v14 = 0;
      BOOL v22 = APAudioZeroTimeStampProviderIsStable() == 0;
    }
    else
    {
      if (v13 > 1751737453)
      {
        if (v13 <= 1819107690)
        {
          if (v13 == 1751737454)
          {
LABEL_66:
            *a6 = 4;
            if (a5 >= 4)
            {
              int v14 = 0;
              *(_DWORD *)a7 = 0;
              goto LABEL_140;
            }
            goto LABEL_139;
          }
          if (v13 != 1818850926) {
            goto LABEL_103;
          }
          *a6 = 4;
          if (a5 >= 4)
          {
            int v14 = 0;
            unsigned int v15 = *(unsigned char *)(DerivedStorage + 20) == 0;
            goto LABEL_138;
          }
          goto LABEL_139;
        }
        if (v13 == 1819107691)
        {
          *a6 = 8;
          if (a5 >= 8)
          {
            CFStringRef v28 = @"Apple, Inc.";
            goto LABEL_100;
          }
LABEL_139:
          int v14 = 561211770;
          goto LABEL_140;
        }
        if (v13 == 1819173229)
        {
          *a6 = 8;
          if (a5 >= 8)
          {
            CFStringRef v28 = *(const __CFString **)(DerivedStorage + 56);
            goto LABEL_100;
          }
          goto LABEL_139;
        }
        if (v13 != 1819569763) {
          goto LABEL_103;
        }
        if (!*(void *)(*(void *)(DerivedStorage + 384) + 40))
        {
          int v14 = 2003329396;
          goto LABEL_156;
        }
        uint64_t LatencyInfo = APCarPlayAudioFormatInfoGetLatencyInfo();
        int v17 = a2[1];
        if (v17 == 1869968496)
        {
          v18 = (unsigned int *)(LatencyInfo + 8);
        }
        else
        {
          if (v17 != 1768845428)
          {
            unsigned int v15 = 0;
LABEL_136:
            *a6 = 4;
            if (a5 >= 4)
            {
              int v14 = 0;
              goto LABEL_138;
            }
            goto LABEL_139;
          }
          v18 = (unsigned int *)(LatencyInfo + 4);
        }
        unsigned int v15 = *v18;
        goto LABEL_136;
      }
      if (v13 <= 1718839673)
      {
        if (v13 != 1684236338)
        {
          int v20 = 1684434036;
          goto LABEL_65;
        }
        if (a5 <= 7)
        {
          int v37 = 561211770;
          goto LABEL_160;
        }
        *(void *)a7 = 0x200000001;
        int v27 = 8;
        goto LABEL_110;
      }
      if (v13 == 1718839674) {
        goto LABEL_89;
      }
      if (v13 != 1735354734) {
        goto LABEL_103;
      }
      *a6 = 4;
      if (a5 < 4) {
        goto LABEL_139;
      }
      int v14 = 0;
      BOOL v22 = *(_DWORD *)(DerivedStorage + 408) == 0;
    }
    unsigned int v15 = !v22;
    goto LABEL_138;
  }
  if (v13 > 1937007733)
  {
    if (v13 <= 1937011827)
    {
      if (v13 <= 1937010546)
      {
        if (v13 == 1937007734)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            int v14 = 0;
            unsigned int v15 = 1;
            goto LABEL_138;
          }
          goto LABEL_139;
        }
        int v21 = 1937009955;
        goto LABEL_70;
      }
      if (v13 != 1937010547)
      {
        if (v13 != 1937011572) {
          goto LABEL_103;
        }
        *a6 = 4;
        if (a5 >= 4)
        {
          int v14 = 0;
          unsigned int v15 = *(_DWORD *)(DerivedStorage + 360);
          goto LABEL_138;
        }
        goto LABEL_139;
      }
      CMBaseObjectGetDerivedStorage();
      CFArrayRef theArray = 0;
      CFGetAllocator(a1);
      FigEndpointCopyStreamsForTypeAndSubType();
      APSLogErrorAt();
      *a6 = 4;
      if (a5 >= 4)
      {
        *(_DWORD *)a7 = 0;
        unsigned int v39 = 0;
        goto LABEL_150;
      }
      unsigned int v39 = 561211770;
    }
    else if (v13 <= 1937012339)
    {
      if (v13 == 1937011828)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          int v14 = 0;
          unsigned int v15 = *(_DWORD *)(DerivedStorage + 364);
          goto LABEL_138;
        }
        goto LABEL_139;
      }
      if (v13 != 1937012085) {
        goto LABEL_103;
      }
      CFAllocatorRef v23 = CFGetAllocator(a1);
      uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
      uint64_t v25 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v25) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 0;
      }
      v35 = *(uint64_t (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(v26 + 48);
      if (v35)
      {
        unsigned int v39 = v35(CMBaseObject, kFigEndpointProperty_ID, v23, &cf);
        if (!v39)
        {
          *a6 = 8;
          if (a5 > 7)
          {
            *(void *)a7 = cf;
            return 0;
          }
          unsigned int v39 = 561211770;
        }
      }
      else
      {
        unsigned int v39 = -12782;
      }
    }
    else
    {
      if (v13 != 1937012340)
      {
        if (v13 == 1953653102)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            int v14 = 0;
            unsigned int v15 = 1937011307;
            goto LABEL_138;
          }
          goto LABEL_139;
        }
        if (v13 != 1969841184) {
          goto LABEL_103;
        }
LABEL_87:
        *a6 = 8;
        if (a5 >= 8)
        {
          CFStringRef v28 = *(const __CFString **)(DerivedStorage + 48);
LABEL_100:
          int v14 = 0;
          *(void *)a7 = CFRetain(v28);
          goto LABEL_140;
        }
        goto LABEL_139;
      }
      BOOL v34 = APSGetFBOPropertyInt64() != 0;
      *a6 = 4;
      if (a5 > 3)
      {
        *(_DWORD *)a7 = v34;
        goto LABEL_103;
      }
      unsigned int v39 = 561211770;
    }
    APSLogErrorAt();
LABEL_144:
    int v14 = v39;
    if (!v39) {
      goto LABEL_150;
    }
LABEL_145:
    if (v14 == 2003332927) {
      goto LABEL_150;
    }
LABEL_146:
    if (dword_10000 <= 90 && (dword_10000 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_150;
  }
  if (v13 > 1919512166)
  {
    if (v13 > 1936092275)
    {
      if (v13 != 1936092276)
      {
        if (v13 != 1936879204)
        {
          if (v13 == 1937006964)
          {
            *a6 = 4;
            if (a5 >= 4)
            {
              int v14 = 0;
              unsigned int v15 = *(_DWORD *)(*(void *)(DerivedStorage + 384) + 16);
LABEL_138:
              *(_DWORD *)a7 = v15;
              goto LABEL_140;
            }
            goto LABEL_139;
          }
LABEL_103:
          unsigned int v39 = 2003332927;
          goto LABEL_150;
        }
        if (*(void *)(*(void *)(DerivedStorage + 384) + 40))
        {
          uint64_t HALDescription = APCarPlayAudioFormatInfoGetHALDescription();
          bzero(a7, a5);
          if (*(_DWORD *)(HALDescription + 28) == 1) {
            int v33 = 6553601;
          }
          else {
            int v33 = 6619138;
          }
          *(_DWORD *)a7 = v33;
          int v27 = 32;
          goto LABEL_110;
        }
        int v37 = 2003329396;
LABEL_160:
        APSLogErrorAt();
        unsigned int v39 = v37;
        goto LABEL_146;
      }
      goto LABEL_66;
    }
    if (v13 != 1919512167)
    {
      int v20 = 1935763060;
LABEL_65:
      if (v13 != v20) {
        goto LABEL_103;
      }
      goto LABEL_66;
    }
LABEL_89:
    APAudioZeroTimeStampProviderGetUpdateInterval();
    double v30 = v29;
    double v31 = *(double *)APCarPlayAudioFormatInfoGetDescription();
    *a6 = 4;
    if (a5 >= 4)
    {
      int v14 = 0;
      unsigned int v15 = vcvtmd_u64_f64(v30 * v31);
      goto LABEL_138;
    }
    goto LABEL_139;
  }
  if (v13 > 1869180522)
  {
    if (v13 == 1869180523)
    {
      *a6 = 4;
      if (a5 >= 4)
      {
        int v14 = 0;
        unsigned int v15 = -1;
        goto LABEL_138;
      }
      goto LABEL_139;
    }
    int v21 = 1870098020;
LABEL_70:
    if (v13 != v21) {
      goto LABEL_103;
    }
    LODWORD(theArray) = a5 >> 2;
    sub_6918(DerivedStorage, a2[1], a7, (unsigned int *)&theArray);
    int v27 = 4 * theArray;
    goto LABEL_110;
  }
  if (v13 == 1836411236) {
    goto LABEL_87;
  }
  if (v13 != 1853059700) {
    goto LABEL_103;
  }
  if (*(void *)(*(void *)(DerivedStorage + 384) + 40))
  {
    v19 = (void *)APCarPlayAudioFormatInfoGetHALDescription();
    *a6 = 8;
    if (a5 >= 8)
    {
      int v14 = 0;
      *(void *)a7 = *v19;
      goto LABEL_140;
    }
    goto LABEL_139;
  }
  int v14 = 2003329396;
LABEL_156:
  APSLogErrorAt();
LABEL_140:
  unsigned int v39 = v14;
  if (v14) {
    goto LABEL_145;
  }
LABEL_150:
  if (cf) {
    CFRelease(cf);
  }
  return v39;
}

uint64_t sub_627C(const void *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, CFTypeRef *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v42 = 0;
  if (dword_10000 <= 30 && (dword_10000 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v13 = *a2;
  uint64_t v14 = 2003332927;
  if (*a2 > 1937006963)
  {
    if (v13 != 1937006964)
    {
      if (v13 != 1937138532) {
        goto LABEL_68;
      }
      if (*a6) {
        CFDictionaryRef v22 = (const __CFDictionary *)CFRetain(*a6);
      }
      else {
        CFDictionaryRef v22 = 0;
      }
      if (FigCFEqual())
      {
        CFDictionaryRef v24 = 0;
      }
      else
      {
        values = (void *)CFDictionaryGetValue(v22, @"vocoder sample rate");
        if (!values || (CFGetDouble(), v25 == 0.0))
        {
          CFDictionaryRef v24 = 0;
        }
        else
        {
          CFAllocatorRef v26 = CFGetAllocator(a1);
          CFDictionaryRef v24 = CFDictionaryCreate(v26, &kFigEndpointStreamVocoderInfoKey_SampleRate, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (!v24)
          {
LABEL_81:
            APSLogErrorAt();
            uint64_t v14 = 2003329396;
            goto LABEL_59;
          }
        }
        if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v36 = *(const void **)(DerivedStorage + 376);
        *(void *)(DerivedStorage + 376) = v24;
        if (v24) {
          CFRetain(v24);
        }
        if (v36) {
          CFRelease(v36);
        }
        if (*(unsigned char *)(DerivedStorage + 369) && *(unsigned char *)(*(void *)(DerivedStorage + 384) + 138))
        {
          uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
          uint64_t v38 = *(void *)(CMBaseObjectGetVTable() + 8);
          uint64_t v39 = v38 ? v38 : 0;
          v40 = *(void (**)(uint64_t, void, CFDictionaryRef))(v39 + 56);
          if (v40) {
            v40(CMBaseObject, kFigEndpointStreamProperty_VocoderInfo, v24);
          }
        }
      }
      if (v22) {
        CFRelease(v22);
      }
      if (v24) {
        CFRelease(v24);
      }
      goto LABEL_41;
    }
    if (a5 != 4)
    {
      uint64_t v14 = 561211770;
LABEL_33:
      APSLogErrorAt();
      goto LABEL_59;
    }
    int v23 = *(_DWORD *)a6;
    if (v23 != *(_DWORD *)(*(void *)(DerivedStorage + 384) + 16))
    {
      uint64_t v14 = FigHALAudioConfigChangeCreateRecord();
      if (!v14)
      {
        *(_DWORD *)(v42 + 16) = v23;
LABEL_67:
        FigHALAudioConfigChangeSendRequest();
        uint64_t v42 = 0;
        goto LABEL_68;
      }
      goto LABEL_83;
    }
LABEL_41:
    uint64_t v14 = 0;
    goto LABEL_68;
  }
  if (v13 == 1718383987)
  {
    if (!*(void *)(DerivedStorage + 400))
    {
      uint64_t v14 = 1970171760;
      goto LABEL_33;
    }
    if (*(_DWORD *)(DerivedStorage + 408))
    {
      if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v27 = *(void *)(DerivedStorage + 400);
      uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v28) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = 0;
      }
      double v30 = *(uint64_t (**)(uint64_t, int *, uint64_t, uint64_t, uint64_t, CFTypeRef *))(v29 + 48);
      if (v30)
      {
        uint64_t v14 = v30(v27, a2, a3, a4, a5, a6);
        if (!v14) {
          goto LABEL_68;
        }
        goto LABEL_56;
      }
      uint64_t v14 = 4294954514;
      goto LABEL_59;
    }
    goto LABEL_41;
  }
  if (v13 != 1853059700) {
    goto LABEL_68;
  }
  if (!*(void *)(*(void *)(DerivedStorage + 384) + 40)) {
    goto LABEL_81;
  }
  uint64_t HALDescription = APCarPlayAudioFormatInfoGetHALDescription();
  if (a5 != 8)
  {
    uint64_t v14 = 561211770;
    goto LABEL_33;
  }
  double v16 = *(double *)a6;
  if (*(double *)HALDescription == *(double *)a6) {
    goto LABEL_41;
  }
  uint64_t v14 = 1970171760;
  uint64_t v17 = *(void *)(DerivedStorage + 384);
  uint64_t v18 = *(void *)(v17 + 32);
  if (v18 >= 1)
  {
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)(v17 + 24);
    uint64_t v21 = -1;
    do
    {
      if (*(double *)v20 == v16)
      {
        uint64_t v21 = v19;
        if (*(_DWORD *)(v20 + 28) == *(_DWORD *)(HALDescription + 28))
        {
          uint64_t v21 = v19;
          goto LABEL_65;
        }
      }
      ++v19;
      v20 += 56;
    }
    while (v18 != v19);
    if (v21 == -1) {
      goto LABEL_59;
    }
LABEL_65:
    uint64_t v14 = FigHALAudioConfigChangeCreateRecord();
    if (!v14)
    {
      uint64_t v31 = v42;
      uint64_t v32 = *(void *)(*(void *)(DerivedStorage + 384) + 24) + 56 * v21;
      uint64_t v33 = *(void *)(v32 + 32);
      long long v34 = *(_OWORD *)(v32 + 16);
      *(_OWORD *)(v42 + 16) = *(_OWORD *)v32;
      *(_OWORD *)(v31 + 32) = v34;
      *(void *)(v31 + 48) = v33;
      goto LABEL_67;
    }
LABEL_83:
    APSLogErrorAt();
LABEL_56:
    if (v14 == 2003332927) {
      goto LABEL_68;
    }
  }
LABEL_59:
  if (dword_10000 <= 90 && (dword_10000 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_68:
  FigHALAudioConfigChangeDisposeRecord();
  return v14;
}

uint64_t sub_6918(uint64_t result, int a2, _DWORD *a3, unsigned int *a4)
{
  uint64_t v6 = result;
  if (a2 == 1869968496)
  {
    unsigned int v13 = *a4;
    uint64_t v14 = *(void *)(result + 400);
    unsigned int v15 = v14 != 0;
    if (*a4 > v15)
    {
      *a4 = v15;
      unsigned int v13 = v14 != 0;
    }
    if (v14) {
      BOOL v16 = v13 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16) {
      goto LABEL_20;
    }
    goto LABEL_25;
  }
  if (a2 != 1768845428)
  {
    if (a2 == 1735159650)
    {
      unsigned int v7 = *a4;
      uint64_t v8 = *(void *)(result + 392);
      if (*(void *)(result + 400)) {
        unsigned int v9 = (v8 != 0) + 1;
      }
      else {
        unsigned int v9 = v8 != 0;
      }
      if (v7 > v9)
      {
        *a4 = v9;
        unsigned int v7 = v9;
      }
      unsigned int v10 = 0;
      if (v8 && v7)
      {
        uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v11) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        CFDictionaryRef v22 = *(uint64_t (**)(uint64_t))(v12 + 8);
        if (v22) {
          uint64_t result = v22(v8);
        }
        else {
          uint64_t result = 0;
        }
        *a3 = result;
        unsigned int v7 = *a4;
        unsigned int v10 = 1;
      }
      if (v10 < v7)
      {
        uint64_t v23 = *(void *)(v6 + 400);
        if (v23)
        {
          uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v24) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0;
          }
          CFAllocatorRef v26 = *(uint64_t (**)(uint64_t))(v25 + 8);
          if (v26) {
            uint64_t result = v26(v23);
          }
          else {
            uint64_t result = 0;
          }
          a3[v10++] = result;
        }
      }
      goto LABEL_46;
    }
LABEL_20:
    unsigned int v10 = 0;
    goto LABEL_46;
  }
  unsigned int v17 = *a4;
  uint64_t v14 = *(void *)(result + 392);
  unsigned int v18 = v14 != 0;
  if (*a4 > v18)
  {
    *a4 = v18;
    unsigned int v17 = v14 != 0;
  }
  unsigned int v10 = 0;
  if (v14 && v17)
  {
LABEL_25:
    uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = *(uint64_t (**)(uint64_t))(v20 + 8);
    if (v21) {
      uint64_t result = v21(v14);
    }
    else {
      uint64_t result = 0;
    }
    *a3 = result;
    unsigned int v10 = 1;
  }
LABEL_46:
  *a4 = v10;
  return result;
}

CFTypeRef sub_6BE0()
{
  v0 = *(const void **)(CMBaseObjectGetDerivedStorage() + 48);

  return CFRetain(v0);
}

uint64_t sub_6C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v6 = 1970171760;
  if (a2 > 1768321644)
  {
    if (a2 == 1768321645)
    {
      uint64_t v10 = DerivedStorage[49];
      if (!v10) {
        goto LABEL_38;
      }
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      unsigned int v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
      if (v13)
      {
        uint64_t v14 = v10;
        uint64_t v15 = 1768321645;
LABEL_28:
        uint64_t v6 = v13(v14, v15, a3);
        if (v6) {
          goto LABEL_31;
        }
        goto LABEL_39;
      }
    }
    else
    {
      if (a2 != 1868984941)
      {
LABEL_31:
        APSLogErrorAt();
        goto LABEL_39;
      }
      uint64_t v7 = DerivedStorage[50];
      if (!v7) {
        goto LABEL_38;
      }
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      unsigned int v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
      if (v13)
      {
        uint64_t v14 = v7;
        uint64_t v15 = 1868984941;
        goto LABEL_28;
      }
    }
    uint64_t v6 = 4294954514;
    goto LABEL_31;
  }
  if (a2 != 1635023216)
  {
    if (a2 == 1718579821)
    {
      if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v16 = APCarPlayAudioFormatsCopyFormatInfoForHALDescription();
      if (!v16)
      {
        if (!FigCFEqual())
        {
          uint64_t v17 = DerivedStorage[48];
          unsigned int v18 = *(const void **)(v17 + 40);
          *(void *)(v17 + 40) = 0;
          if (v18) {
            CFRelease(v18);
          }
          FigHALAudioPropertySendChanges();
        }
        goto LABEL_38;
      }
      uint64_t v6 = v16;
    }
    goto LABEL_31;
  }
  if (*(_DWORD *)(a3 + 16) == *(_DWORD *)(DerivedStorage[48] + 16))
  {
LABEL_38:
    uint64_t v6 = 0;
    goto LABEL_39;
  }
  uint64_t v6 = sub_47D0();
  FigHALAudioPropertySendChanges();
  if (v6) {
    goto LABEL_31;
  }
LABEL_39:
  FigHALAudioConfigChangeDisposeRecord();
  FigHALAudioConfigChangeDisposeRecord();
  return v6;
}

uint64_t sub_6F94()
{
  return 0;
}

uint64_t sub_6FB4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage;
  uint64_t v64 = 0;
  int v63 = 0;
  if (*(unsigned char *)(DerivedStorage + 20))
  {
    APSLogErrorAt();
    uint64_t v2 = 560227702;
    goto LABEL_38;
  }
  if (*(_DWORD *)(DerivedStorage + 408)) {
    return 0;
  }
  uint64_t v3 = *(void *)(DerivedStorage + 384);
  if (!*(void *)(v3 + 40))
  {
    APSLogErrorAt();
    uint64_t v2 = 2003329396;
    goto LABEL_38;
  }
  *(_OWORD *)(DerivedStorage + 216) = 0u;
  *(_OWORD *)(DerivedStorage + 120) = 0u;
  *(_OWORD *)(DerivedStorage + 136) = 0u;
  *(_OWORD *)(DerivedStorage + 88) = 0u;
  *(_OWORD *)(DerivedStorage + 104) = 0u;
  *(_OWORD *)(DerivedStorage + 152) = 0u;
  *(_OWORD *)(DerivedStorage + 168) = 0u;
  *(_OWORD *)(DerivedStorage + 184) = 0u;
  *(_OWORD *)(DerivedStorage + 200) = 0u;
  *(_OWORD *)(DerivedStorage + 232) = 0u;
  *(_OWORD *)(DerivedStorage + 248) = 0u;
  *(_OWORD *)(DerivedStorage + 264) = 0u;
  *(_OWORD *)(DerivedStorage + 280) = 0u;
  *(_OWORD *)(DerivedStorage + 296) = 0u;
  *(_OWORD *)(DerivedStorage + 312) = 0u;
  *(_OWORD *)(DerivedStorage + 328) = 0u;
  *(unsigned char *)(DerivedStorage + 344) = 1;
  *(void *)(DerivedStorage + 352) = 0;
  uint64_t Description = APCarPlayAudioFormatInfoGetDescription();
  uint64_t v5 = *(void *)(Description + 32);
  long long v6 = *(_OWORD *)(Description + 16);
  *(_OWORD *)(v3 + 88) = *(_OWORD *)Description;
  *(_OWORD *)(v3 + 104) = v6;
  *(void *)(v3 + 120) = v5;
  uint64_t v7 = *(void *)(v1 + 384);
  uint64_t HALDescription = APCarPlayAudioFormatInfoGetHALDescription();
  long long v10 = *(_OWORD *)HALDescription;
  long long v9 = *(_OWORD *)(HALDescription + 16);
  *(void *)(v7 + 80) = *(void *)(HALDescription + 32);
  *(_OWORD *)(v7 + 48) = v10;
  *(_OWORD *)(v7 + 64) = v9;
  APAudioZeroTimeStampProviderGetUpdateInterval();
  *(double *)(*(void *)(v1 + 384) + 128) = floor(v11 * *(double *)(*(void *)(v1 + 384) + 48));
  int v66 = 0;
  uint64_t v65 = 0x676C6F6273616374;
  uint64_t v12 = *(void *)(v1 + 392);
  if (v12)
  {
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v14 = v13 ? v13 : 0;
    uint64_t v15 = *(void (**)(uint64_t, uint64_t *, void, void, uint64_t, char *, uint64_t *))(v14 + 40);
    if (v15) {
      v15(v12, &v65, 0, 0, 4, (char *)&v64 + 4, &v64);
    }
  }
  uint64_t v16 = *(void *)(v1 + 400);
  if (v16)
  {
    uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v18 = v17 ? v17 : 0;
    uint64_t v19 = *(void (**)(uint64_t, uint64_t *, void, void, uint64_t, char *, int *))(v18 + 40);
    if (v19) {
      v19(v16, &v65, 0, 0, 4, (char *)&v64 + 4, &v63);
    }
  }
  if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v20 = LogCategoryCopyOSLogHandle();
  uint64_t v21 = (void *)v20;
  if (v20) {
    CFDictionaryRef v22 = v20;
  }
  else {
    CFDictionaryRef v22 = &_os_log_default;
  }
  if (os_signpost_enabled(v22))
  {
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(v1 + 40), 0x8000100u);
    *(_DWORD *)buf = 136315138;
    v68 = CStringPtr;
    _os_signpost_emit_with_name_impl(&dword_0, v22, OS_SIGNPOST_EVENT, 0x2B8D0938uLL, "AP_SIGNPOST_CAR_HAL_STARTIO_BEGIN", "stream type=%s\n", buf, 0xCu);
  }
  if (v21) {
    os_release(v21);
  }
  uint64_t v24 = *(void *)(*(void *)(v1 + 384) + 40);
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v26) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = *(uint64_t (**)(uint64_t, void, uint64_t))(v27 + 56);
  if (!v28)
  {
    uint64_t v2 = 4294954514;
    goto LABEL_37;
  }
  uint64_t v29 = v28(CMBaseObject, kAPEndpointStreamCarPlayAudioProperty_AudioFormatInfo, v24);
  if (v29)
  {
    uint64_t v2 = v29;
    goto LABEL_37;
  }
  if (*(unsigned char *)(v1 + 369))
  {
    uint64_t v30 = *(void *)(v1 + 376);
    uint64_t v31 = FigEndpointStreamGetCMBaseObject();
    uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v32) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 0;
    }
    v36 = *(uint64_t (**)(uint64_t, void, uint64_t))(v33 + 56);
    if (v36)
    {
      uint64_t v37 = v36(v31, kFigEndpointStreamProperty_VocoderInfo, v30);
      if (v37)
      {
        uint64_t v2 = v37;
        goto LABEL_37;
      }
      goto LABEL_43;
    }
    uint64_t v2 = 4294954514;
LABEL_37:
    APSLogErrorAt();
LABEL_38:
    uint64_t v34 = *(void *)(v1 + 384);
    *(_WORD *)(v34 + 136) = 0;
    *(unsigned char *)(v34 + 138) = 0;
    return v2;
  }
LABEL_43:
  int v38 = v64;
  if (!v64) {
    goto LABEL_51;
  }
  uint64_t v39 = *(void *)(v1 + 392);
  uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v40) {
    uint64_t v41 = v40;
  }
  else {
    uint64_t v41 = 0;
  }
  uint64_t v42 = *(uint64_t (**)(uint64_t))(v41 + 32);
  if (!v42)
  {
    uint64_t v2 = 4294954514;
    goto LABEL_37;
  }
  uint64_t v43 = v42(v39);
  if (v43)
  {
    uint64_t v2 = v43;
    goto LABEL_37;
  }
  *(unsigned char *)(*(void *)(v1 + 384) + 136) = 1;
LABEL_51:
  if (!v63)
  {
    int v47 = 0;
    goto LABEL_60;
  }
  uint64_t v44 = *(void *)(v1 + 400);
  uint64_t v45 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v45) {
    uint64_t v46 = v45;
  }
  else {
    uint64_t v46 = 0;
  }
  v48 = *(uint64_t (**)(uint64_t))(v46 + 32);
  if (!v48)
  {
    uint64_t v2 = 4294954514;
LABEL_65:
    APSLogErrorAt();
    int v47 = 0;
    goto LABEL_78;
  }
  uint64_t v49 = v48(v44);
  if (v49)
  {
    uint64_t v2 = v49;
    goto LABEL_65;
  }
  int v47 = 1;
  *(unsigned char *)(*(void *)(v1 + 384) + 137) = 1;
LABEL_60:
  uint64_t v50 = FigEndpointStreamResumeSync();
  uint64_t v2 = v50;
  if (v50 == -16764)
  {
    if (dword_10000 <= 90 && (dword_10000 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    FigEndpointStreamSuspend();
    goto LABEL_77;
  }
  if (v50)
  {
LABEL_77:
    APSLogErrorAt();
LABEL_78:
    if (v38)
    {
      uint64_t v55 = *(void *)(v1 + 392);
      uint64_t v56 = *(void *)(CMBaseObjectGetVTable() + 24);
      uint64_t v57 = v56 ? v56 : 0;
      v58 = *(void (**)(uint64_t))(v57 + 40);
      if (v58) {
        v58(v55);
      }
    }
    if (v47)
    {
      uint64_t v59 = *(void *)(v1 + 400);
      uint64_t v60 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v60) {
        uint64_t v61 = v60;
      }
      else {
        uint64_t v61 = 0;
      }
      v62 = *(void (**)(uint64_t))(v61 + 40);
      if (v62) {
        v62(v59);
      }
    }
    goto LABEL_38;
  }
  uint64_t v51 = LogCategoryCopyOSLogHandle();
  v52 = (void *)v51;
  if (v51) {
    v53 = v51;
  }
  else {
    v53 = &_os_log_default;
  }
  if (os_signpost_enabled(v53))
  {
    v54 = CFStringGetCStringPtr(*(CFStringRef *)(v1 + 40), 0x8000100u);
    *(_DWORD *)buf = 136315138;
    v68 = v54;
    _os_signpost_emit_with_name_impl(&dword_0, v53, OS_SIGNPOST_EVENT, 0x2B8D093CuLL, "AP_SIGNPOST_CAR_HAL_STARTIO_END", "stream type=%s\n", buf, 0xCu);
  }
  if (v52) {
    os_release(v52);
  }
  uint64_t v2 = 0;
  *(unsigned char *)(*(void *)(v1 + 384) + 138) = 1;
  *(_DWORD *)(v1 + 408) = 1;
  return v2;
}

uint64_t sub_7920()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_DWORD *)(DerivedStorage + 408)) {
    return 0;
  }
  uint64_t v1 = DerivedStorage;
  if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = FigEndpointStreamSuspendSync();
  if (v2 == -16764)
  {
    if (dword_10000 <= 90 && (dword_10000 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v2 = 0;
  }
  if (*(unsigned char *)(*(void *)(v1 + 384) + 136))
  {
    uint64_t v3 = *(void *)(v1 + 392);
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 24);
    uint64_t v5 = v4 ? v4 : 0;
    long long v6 = *(void (**)(uint64_t))(v5 + 40);
    if (v6) {
      v6(v3);
    }
  }
  if (*(unsigned char *)(*(void *)(v1 + 384) + 137))
  {
    uint64_t v7 = *(void *)(v1 + 400);
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 24);
    uint64_t v9 = v8 ? v8 : 0;
    long long v10 = *(void (**)(uint64_t))(v9 + 40);
    if (v10) {
      v10(v7);
    }
  }
  if (*(_DWORD *)(v1 + 144) && *(_DWORD *)(v1 + 272))
  {
    if (*(void *)(v1 + 224) != *(void *)(v1 + 96)) {
      UpTicksPerSecond();
    }
    if (dword_10000 <= 50 && (dword_10000 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void (**)(uint64_t, void, void))(v13 + 56);
  if (v14) {
    v14(CMBaseObject, kAPEndpointStreamCarPlayAudioProperty_AudioFormatInfo, 0);
  }
  if (*(unsigned char *)(v1 + 369))
  {
    uint64_t v15 = FigEndpointStreamGetCMBaseObject();
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = *(void (**)(uint64_t, void, void))(v17 + 56);
    if (v18) {
      v18(v15, kFigEndpointStreamProperty_VocoderInfo, 0);
    }
  }
  uint64_t v19 = *(void *)(v1 + 384);
  *(void *)(v19 + 120) = 0;
  *(_OWORD *)(v19 + 104) = 0u;
  *(_OWORD *)(v19 + 88) = 0u;
  uint64_t v20 = *(void *)(v1 + 384);
  *(void *)(v20 + 80) = 0;
  *(_OWORD *)(v20 + 48) = 0u;
  *(_OWORD *)(v20 + 64) = 0u;
  uint64_t v21 = *(void *)(v1 + 384);
  *(_DWORD *)(v21 + 135) = 0;
  *(void *)(v21 + 128) = 0;
  *(_DWORD *)(v1 + 408) = 0;
  return v2;
}

uint64_t sub_7D84(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  long long v23 = 0u;
  uint64_t v8 = mach_absolute_time();
  APAudioZeroTimeStampProviderGetZeroTimeStamp();
  *((void *)&v22 + 1) = v8;
  if ((~*(_DWORD *)(DerivedStorage + 272) & 3) != 0)
  {
    *(void *)&long long v22 = 0;
    DWORD2(v23) = 3;
    *(void *)(DerivedStorage + 352) = 0;
  }
  else
  {
    double v9 = *(double *)(*(void *)(DerivedStorage + 384) + 48) * (double)(v8 - *(void *)(DerivedStorage + 96));
    *(double *)&long long v22 = v9 / (double)(unint64_t)UpTicksPerSecond();
    DWORD2(v23) = 3;
  }
  if (!APAudioZeroTimeStampProviderGetHighAccuracySupport()) {
    *(double *)&long long v22 = *(double *)&v22 - *(double *)(DerivedStorage + 352);
  }
  if ((~*(_DWORD *)(DerivedStorage + 144) & 3) != 0)
  {
    *(_OWORD *)(DerivedStorage + 88) = v22;
    *(_OWORD *)(DerivedStorage + 104) = 0u;
    *(_OWORD *)(DerivedStorage + 120) = 0u;
    *(_OWORD *)(DerivedStorage + 136) = v23;
  }
  long long v10 = (_OWORD *)(DerivedStorage + 216);
  if (*(void *)(DerivedStorage + 224) != v8 || *(double *)v10 != *(double *)&v22)
  {
    long long v11 = *(_OWORD *)(DerivedStorage + 248);
    *(_OWORD *)(DerivedStorage + 200) = *(_OWORD *)(DerivedStorage + 264);
    long long v12 = *(_OWORD *)(DerivedStorage + 232);
    *(_OWORD *)(DerivedStorage + 152) = *v10;
    *(_OWORD *)(DerivedStorage + 168) = v12;
    *(_OWORD *)(DerivedStorage + 184) = v11;
    _OWORD *v10 = v22;
    *(_OWORD *)(DerivedStorage + 232) = 0u;
    *(_OWORD *)(DerivedStorage + 248) = 0u;
    *(_OWORD *)(DerivedStorage + 264) = v23;
    if ((~*(_DWORD *)(DerivedStorage + 208) & 3) != 0)
    {
      *(_DWORD *)(DerivedStorage + 208) = 3;
      *(double *)(DerivedStorage + 152) = *(double *)(DerivedStorage + 216)
                                        - *(double *)(*(void *)(DerivedStorage + 384) + 48);
      uint64_t v13 = *(void *)(DerivedStorage + 224);
      *(void *)(DerivedStorage + 160) = v13 - UpTicksPerSecond();
    }
    kdebug_trace();
  }
  if ((~*(_DWORD *)(DerivedStorage + 336) & 3) != 0)
  {
    long long v19 = *(_OWORD *)(DerivedStorage + 232);
    *(_OWORD *)(DerivedStorage + 280) = *v10;
    *(_OWORD *)(DerivedStorage + 296) = v19;
    long long v20 = *(_OWORD *)(DerivedStorage + 264);
    *(_OWORD *)(DerivedStorage + 312) = *(_OWORD *)(DerivedStorage + 248);
    *(_OWORD *)(DerivedStorage + 328) = v20;
  }
  else
  {
    unint64_t v14 = *(void *)(DerivedStorage + 224);
    double v15 = *(double *)(DerivedStorage + 280) + *(double *)(*(void *)(DerivedStorage + 384) + 128);
    double v16 = *(double *)(DerivedStorage + 216);
    double v17 = (double)(v14 - *(void *)(DerivedStorage + 160)) / (v16 - *(double *)(DerivedStorage + 152));
    unint64_t v18 = (unint64_t)((double)v14 - v17 * v16 + v17 * v15);
    if (v8 > v18)
    {
      *(double *)(DerivedStorage + 280) = v15;
      *(void *)(DerivedStorage + 288) = v18;
      kdebug_trace();
    }
  }
  *a2 = *(void *)(DerivedStorage + 280);
  *a3 = *(void *)(DerivedStorage + 288);
  *a4 = 0;
  kdebug_trace();
  return 0;
}

uint64_t sub_8084(uint64_t a1, int a2, unsigned char *a3, unsigned char *a4)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v8 = (unsigned char *)DerivedStorage[48];
  if (v8[138])
  {
    if (a2 == 1919246692)
    {
      if (DerivedStorage[49])
      {
        char v9 = v8[136];
        goto LABEL_9;
      }
    }
    else if (a2 == 1919513701 && DerivedStorage[50])
    {
      char v9 = v8[137];
LABEL_9:
      uint64_t result = 0;
      *a4 = v9;
      *a3 = v9;
      return result;
    }
    char v9 = 0;
    goto LABEL_9;
  }
  return 1937010544;
}

uint64_t sub_8120()
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 384) + 138)) {
    return 0;
  }
  else {
    return 1937010544;
  }
}

uint64_t sub_8154()
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 384) + 138)) {
    return 0;
  }
  else {
    return 1937010544;
  }
}

void sub_8188(id a1)
{
  qword_10100 = 0;
  *(void *)algn_10108 = "APHALCarAudioSharedState";
  qword_10110 = (uint64_t)sub_81E8;
  unk_10118 = 0;
  qword_10120 = (uint64_t)sub_8200;
  unk_10128 = 0u;
  unk_10138 = 0u;
  qword_100F8 = _CFRuntimeRegisterClass();
}

double sub_81E8(_OWORD *a1)
{
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  return result;
}

void sub_8200(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 40) = 0;
  }
}

uint64_t sub_8230(uint64_t a1)
{
  if (qword_100F0 != -1) {
    dispatch_once(&qword_100F0, &stru_C4C8);
  }
  uint64_t v2 = qword_100F8;

  return __CFRuntimeCreateInstance(a1, v2, 128, 0);
}

uint64_t sub_829C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, char a6, const void *a7, void *a8)
{
  CFTypeRef v27 = 0;
  CMTime v26 = kCMTimeInvalid;
  if (!a2 || !a3 || !a4 || !a5 || !a7 || !a8)
  {
    APSLogErrorAt();
    unsigned int v28 = -16891;
    goto LABEL_24;
  }
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v26, HostTimeClock);
  FigHALAudioStreamGetClassID();
  unsigned int v28 = CMDerivedObjectCreate();
  if (v28) {
    goto LABEL_23;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)uint64_t DerivedStorage = a3;
  *(void *)(DerivedStorage + 8) = a2;
  *(_DWORD *)(DerivedStorage + 16) = a4;
  *(void *)(DerivedStorage + 24) = CFRetain(a5);
  *(unsigned char *)(DerivedStorage + 72) = a6;
  *(void *)(DerivedStorage + 64) = CFRetain(a7);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 0x40000000;
  v25[2] = sub_8878;
  v25[3] = &unk_C510;
  v25[4] = a2;
  v25[5] = v27;
  v25[6] = DerivedStorage;
  unsigned int v28 = sub_873C((uint64_t)"FigHALAudioObjectMapperAddMapping", 1017, (uint64_t)v25);
  if (v28) {
    goto LABEL_23;
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 0x40000000;
  v24[2] = sub_888C;
  v24[3] = &unk_C530;
  v24[4] = DerivedStorage;
  v24[5] = a5;
  unsigned int v28 = sub_873C((uint64_t)"FigEndpointStreamCopyProperty", 1021, (uint64_t)v24);
  if (v28) {
    goto LABEL_23;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 0x40000000;
  v23[2] = sub_8984;
  v23[3] = &unk_C550;
  v23[4] = DerivedStorage;
  v23[5] = a5;
  unsigned int v28 = sub_873C((uint64_t)"FigEndpointStreamCopyProperty", 1025, (uint64_t)v23);
  if (v28) {
    goto LABEL_23;
  }
  int v17 = 1937006956;
  if (FigCFEqual())
  {
    int v17 = 1937010030;
    goto LABEL_16;
  }
  if (!FigCFEqual())
  {
    if (FigCFEqual())
    {
      int v17 = 1937006968;
      goto LABEL_16;
    }
    unsigned int v28 = -16760;
LABEL_23:
    APSLogErrorAt();
    goto LABEL_24;
  }
LABEL_16:
  *(_DWORD *)(DerivedStorage + 48) = v17;
  *(void *)(DerivedStorage + 56) = CFStringCreateF();
  if (v28) {
    goto LABEL_23;
  }
  *a8 = v27;
  CFTypeRef v27 = 0;
  if (dword_10070 > 50) {
    return v28;
  }
  if (dword_10070 != -1 || _LogCategory_Initialize())
  {
    unint64_t v18 = CMClockGetHostTimeClock();
    CMClockGetTime(&lhs, v18);
    CMTime rhs = v26;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeGetSeconds(&time);
    LogPrintF();
  }
LABEL_24:
  if (v27) {
    CFRelease(v27);
  }
  return v28;
}

uint64_t sub_873C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v14 = a1;
  int v13 = a2;
  memset(&v12, 0, sizeof(v12));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v12, HostTimeClock);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t *, int *))(a3 + 16))(a3, &v14, &v13);
  long long v6 = CMClockGetHostTimeClock();
  CMClockGetTime(&lhs, v6);
  CMTime rhs = v12;
  CMTimeSubtract(&time, &lhs, &rhs);
  float Seconds = CMTimeGetSeconds(&time);
  if ((float)(Seconds * 1000.0) > 50.0
    && dword_10070 <= 60
    && (dword_10070 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

uint64_t sub_8878()
{
  return FigHALAudioObjectMapperAddMapping();
}

uint64_t sub_888C(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, CFAllocatorRef, uint64_t))(v6 + 48);
  if (!v7) {
    return 4294954514;
  }
  uint64_t v8 = kAPEndpointStreamCarPlayAudioProperty_CarPlayAudioFormats;

  return v7(CMBaseObject, v8, v2, v3 + 40);
}

uint64_t sub_8984(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, CFAllocatorRef, uint64_t))(v6 + 48);
  if (!v7) {
    return 4294954514;
  }
  uint64_t v8 = kFigEndpointStreamProperty_SubType;

  return v7(CMBaseObject, v8, v2, v3 + 32);
}

void sub_8A7C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 20)) {
    FigHALAudioObjectMapperRemoveMapping();
  }
  if (*(unsigned char *)(DerivedStorage + 73) && !*(unsigned char *)(DerivedStorage + 72) && *(void *)(DerivedStorage + 88))
  {
    APSAudioStats_TerminateSession();
    if (dword_10070 <= 50 && (dword_10070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v7 = *(const void **)(DerivedStorage + 88);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(DerivedStorage + 88) = 0;
    }
  }
  uint64_t v1 = *(const void **)(DerivedStorage + 24);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 24) = 0;
  }
  CFAllocatorRef v2 = *(const void **)(DerivedStorage + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 32) = 0;
  }
  uint64_t v3 = *(const void **)(DerivedStorage + 40);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(DerivedStorage + 40) = 0;
  }
  uint64_t v4 = *(const void **)(DerivedStorage + 64);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(DerivedStorage + 64) = 0;
  }
  uint64_t v5 = *(const void **)(DerivedStorage + 80);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(DerivedStorage + 80) = 0;
  }
  uint64_t v6 = *(const void **)(DerivedStorage + 56);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(DerivedStorage + 56) = 0;
  }
}

CFStringRef sub_8BCC(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 72)) {
    uint64_t v3 = "Sink";
  }
  else {
    uint64_t v3 = "Source";
  }
  long long v10 = v3;
  uint64_t v11 = *(void *)(DerivedStorage + 80);
  uint64_t v8 = *(unsigned int *)(DerivedStorage + 16);
  uint64_t v9 = *(void *)(DerivedStorage + 24);
  uint64_t v7 = *(unsigned int *)(DerivedStorage + 20);
  ASPrintF();
  CFAllocatorRef v4 = CFGetAllocator(a1);
  CFStringRef v5 = CFStringCreateWithFormat(v4, 0, @"%s", "CarAudioStream", v7, v8, v9, v10, v11);
  free(0);
  return v5;
}

uint64_t sub_8C94()
{
  return *(unsigned int *)(CMBaseObjectGetDerivedStorage() + 20);
}

uint64_t sub_8CB0(uint64_t a1, int *a2)
{
  uint64_t result = 0;
  int v3 = *a2;
  if (*a2 <= 1935762291)
  {
    if (v3 > 1870098019)
    {
      BOOL v4 = v3 == 1870098020 || v3 == 1885762592;
      int v5 = 1885762657;
    }
    else
    {
      BOOL v4 = v3 == 1650682995 || v3 == 1668047219;
      int v5 = 1819569763;
    }
  }
  else if (v3 <= 1936092512)
  {
    BOOL v4 = v3 == 1935762292 || v3 == 1935894638;
    int v5 = 1935960434;
  }
  else if (v3 > 1937007733)
  {
    BOOL v4 = v3 == 1952805485;
    int v5 = 1937007734;
  }
  else
  {
    BOOL v4 = v3 == 1936092513;
    int v5 = 1936092532;
  }
  if (v4 || v3 == v5) {
    return 1;
  }
  return result;
}

BOOL sub_8DA0(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_8DD4(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = 0;
  int v5 = *a2;
  if (*a2 > 1935894637)
  {
    if (v5 <= 1936092531)
    {
      if (v5 == 1935894638 || v5 == 1935960434) {
        return 4;
      }
      if (v5 != 1936092513) {
        return result;
      }
      return (56 * *(_DWORD *)(*(void *)(DerivedStorage + 64) + 32));
    }
    if (v5 != 1936092532)
    {
      if (v5 == 1937007734) {
        return 4;
      }
      int v7 = 1952805485;
LABEL_21:
      if (v5 != v7) {
        return result;
      }
      return 4;
    }
    return 40;
  }
  if (v5 > 1885762591)
  {
    if (v5 != 1885762592)
    {
      if (v5 != 1885762657)
      {
        int v7 = 1935762292;
        goto LABEL_21;
      }
      return (56 * *(_DWORD *)(*(void *)(DerivedStorage + 64) + 32));
    }
    return 40;
  }
  if (v5 != 1650682995 && v5 != 1668047219)
  {
    int v7 = 1819569763;
    goto LABEL_21;
  }
  return 4;
}

uint64_t sub_8F08(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (dword_10070 <= 30 && (dword_10070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v12 = *a2;
  uint64_t v13 = 2003332927;
  if (*a2 > 1935894637)
  {
    if (v12 <= 1936092531)
    {
      if (v12 == 1935894638)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t v13 = 0;
          int v14 = 1;
          goto LABEL_42;
        }
        goto LABEL_43;
      }
      if (v12 == 1935960434)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t v13 = 0;
          int v14 = *(unsigned char *)(DerivedStorage + 72) != 0;
          goto LABEL_42;
        }
        goto LABEL_43;
      }
      if (v12 != 1936092513) {
        return v13;
      }
LABEL_27:
      uint64_t v15 = *(void *)(DerivedStorage + 64);
      uint64_t v16 = *(void *)(v15 + 32);
      int v17 = 56 * v16;
      if (56 * v16 <= (unint64_t)a5)
      {
        memcpy(a7, *(const void **)(v15 + 24), 56 * v16);
        uint64_t v13 = 0;
        *a6 = v17;
        return v13;
      }
      uint64_t v13 = 561211770;
      goto LABEL_51;
    }
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t v13 = 0;
          int v14 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_42;
        }
        goto LABEL_43;
      }
      if (v12 != 1952805485) {
        return v13;
      }
      *a6 = 4;
      if (a5 < 4) {
        goto LABEL_43;
      }
      uint64_t v13 = 0;
      int v14 = 1936747378;
LABEL_42:
      *a7 = v14;
      return v13;
    }
LABEL_29:
    if (*(void *)(*(void *)(DerivedStorage + 64) + 40))
    {
      uint64_t HALDescription = APCarPlayAudioFormatInfoGetHALDescription();
      *a6 = 40;
      if (a5 >= 0x28)
      {
        uint64_t v13 = 0;
        long long v19 = *(_OWORD *)HALDescription;
        long long v20 = *(_OWORD *)(HALDescription + 16);
        *((void *)a7 + 4) = *(void *)(HALDescription + 32);
        *(_OWORD *)a7 = v19;
        *((_OWORD *)a7 + 1) = v20;
        return v13;
      }
      goto LABEL_43;
    }
    uint64_t v13 = 2003329396;
LABEL_51:
    APSLogErrorAt();
    goto LABEL_44;
  }
  if (v12 > 1885762591)
  {
    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return v13;
        }
        *a6 = 4;
        if (a5 < 4) {
          goto LABEL_43;
        }
        uint64_t v13 = 0;
        int v14 = *(unsigned __int8 *)(DerivedStorage + 73);
        goto LABEL_42;
      }
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  if (v12 == 1650682995)
  {
    *a6 = 4;
    if (a5 < 4) {
      goto LABEL_43;
    }
    uint64_t v13 = 0;
    int v14 = 1634689642;
    goto LABEL_42;
  }
  if (v12 != 1668047219)
  {
    if (v12 != 1819569763) {
      return v13;
    }
    *a6 = 4;
    if (a5 >= 4)
    {
      uint64_t v13 = 0;
      *a7 = 0;
      return v13;
    }
    goto LABEL_43;
  }
  *a6 = 4;
  if (a5 >= 4)
  {
    uint64_t v13 = 0;
    int v14 = 1634956402;
    goto LABEL_42;
  }
LABEL_43:
  uint64_t v13 = 561211770;
LABEL_44:
  if (dword_10070 <= 90 && (dword_10070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v13;
}

uint64_t sub_9308(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, long long *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFTypeRef v33 = 0;
  uint64_t v34 = 0;
  if (dword_10070 <= 30 && (dword_10070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v10 = *a2;
  uint64_t v11 = 2003332927;
  if (*a2 <= 1935762291)
  {
    if (v10 == 1718383987)
    {
      if (*(unsigned char *)(DerivedStorage + 112))
      {
        CMTimeMake(&time, (uint64_t)*(double *)(DerivedStorage + 104), (int)*(double *)(*(void *)(DerivedStorage + 64) + 48));
        *(void *)&long long __s1 = CMTimeCopyAsDictionary(&time, 0);
        CFDictionaryRef v16 = CFDictionaryCreate(0, &kFigEndpointStreamFlushOption_AnchorTime, (const void **)&__s1, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        uint64_t v17 = *(void *)(DerivedStorage + 24);
        uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v18) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = 0;
        }
        long long v20 = *(uint64_t (**)(uint64_t, void, CFDictionaryRef))(v19 + 24);
        if (v20) {
          uint64_t v11 = v20(v17, 0, v16);
        }
        else {
          uint64_t v11 = 4294954514;
        }
        CFRelease((CFTypeRef)__s1);
        CFRelease(v16);
        goto LABEL_40;
      }
      goto LABEL_27;
    }
    if (v10 != 1885762592) {
      goto LABEL_50;
    }
LABEL_16:
    if (a5 != 40)
    {
      uint64_t v11 = 561211770;
      goto LABEL_39;
    }
    long long v13 = a6[1];
    long long __s1 = *a6;
    long long v31 = v13;
    uint64_t v32 = *((void *)a6 + 4);
    if (!*(void *)(*(void *)(DerivedStorage + 64) + 40))
    {
      APSLogErrorAt();
      uint64_t v11 = 2003329396;
      goto LABEL_40;
    }
    uint64_t HALDescription = (const void *)APCarPlayAudioFormatInfoGetHALDescription();
    if (memcmp(&__s1, HALDescription, 0x28uLL))
    {
      uint64_t v15 = APCarPlayAudioFormatsCopyFormatInfoForHALDescription();
      if (v15)
      {
        uint64_t v11 = v15;
        if (dword_10070 <= 50 && (dword_10070 != -1 || _LogCategory_Initialize()))
        {
          long long v27 = __s1;
          long long v28 = v31;
          uint64_t v29 = v32;
          LogPrintF();
        }
        goto LABEL_39;
      }
      uint64_t v21 = FigHALAudioConfigChangeCreateRecord();
      if (!v21)
      {
        if (dword_10070 <= 50 && (dword_10070 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v23 = v34;
        uint64_t v24 = v32;
        long long v25 = v31;
        *(_OWORD *)(v34 + 16) = __s1;
        *(_OWORD *)(v23 + 32) = v25;
        *(void *)(v23 + 48) = v24;
        FigHALAudioConfigChangeSendRequest();
        uint64_t v11 = 0;
        uint64_t v34 = 0;
LABEL_40:
        if (!v11 || v11 == 2003332927) {
          goto LABEL_50;
        }
        goto LABEL_42;
      }
      uint64_t v11 = v21;
LABEL_39:
      APSLogErrorAt();
      goto LABEL_40;
    }
LABEL_27:
    uint64_t v11 = 0;
    goto LABEL_40;
  }
  if (v10 == 1936092532) {
    goto LABEL_16;
  }
  if (v10 != 1935762292) {
    goto LABEL_50;
  }
  if (a5 != 4)
  {
    uint64_t v11 = 561211770;
    APSLogErrorAt();
LABEL_42:
    if (dword_10070 <= 90 && (dword_10070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_50;
  }
  int v12 = *(_DWORD *)a6 != 0;
  if (*(unsigned __int8 *)(DerivedStorage + 73) != v12)
  {
    if (dword_10070 <= 50 && (dword_10070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(unsigned char *)(DerivedStorage + 73) = v12;
    FigHALAudioPropertySendChanges();
  }
  uint64_t v11 = 0;
LABEL_50:
  if (v33) {
    CFRelease(v33);
  }
  FigHALAudioConfigChangeDisposeRecord();
  return v11;
}

uint64_t sub_9918(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 != 1868984941 && a2 != 1768321645)
  {
    uint64_t v4 = FigSignalErrorAt();
    if (!v4)
    {
LABEL_16:
      FigHALAudioConfigChangeDisposeRecord();
      return 0;
    }
    uint64_t v5 = v4;
    goto LABEL_19;
  }
  if (dword_10070 <= 50 && (dword_10070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v6 = APCarPlayAudioFormatsCopyFormatInfoForHALDescription();
  if (v6)
  {
    uint64_t v5 = v6;
LABEL_19:
    APSLogErrorAt();
    goto LABEL_15;
  }
  if (!FigCFEqual())
  {
    uint64_t v7 = *(void *)(DerivedStorage + 64);
    uint64_t v8 = *(const void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
    if (v8) {
      CFRelease(v8);
    }
    FigHALAudioPropertySendChanges();
  }
  uint64_t v5 = 0;
LABEL_15:
  if (!v5) {
    goto LABEL_16;
  }
  return v5;
}

uint64_t sub_9AF0(const void *a1)
{
  unsigned int v18 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  IsAppleInternalBuild();
  if (*(unsigned char *)(DerivedStorage + 73))
  {
    uint64_t LatencyInfo = APCarPlayAudioFormatInfoGetLatencyInfo();
    if (!LatencyInfo)
    {
      APSLogErrorAt();
      unsigned int v18 = -6718;
      goto LABEL_28;
    }
    uint64_t v4 = (_DWORD *)LatencyInfo;
    if (dword_10070 <= 50 && (dword_10070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(void *)(DerivedStorage + 104) = 0;
    *(unsigned char *)(DerivedStorage + 112) = 0;
    if (*(unsigned char *)(DerivedStorage + 72))
    {
      *(void *)(DerivedStorage + 88) = 0;
      *(void *)(DerivedStorage + 96) = 0;
      CFGetAllocator(a1);
      unsigned int v18 = APAudioSinkJitterBufferCreate();
      if (!v18)
      {
        uint64_t v5 = *(void *)(DerivedStorage + 80);
        uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
        uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v7) {
          uint64_t v8 = v7;
        }
        else {
          uint64_t v8 = 0;
        }
        long long v13 = *(uint64_t (**)(uint64_t, void, uint64_t))(v8 + 56);
        if (v13)
        {
          unsigned int v18 = v13(CMBaseObject, kFigEndpointStreamProperty_AudioSink, v5);
          if (v18) {
            goto LABEL_26;
          }
LABEL_24:
          LODWORD(v14) = *v4;
          *(_DWORD *)(DerivedStorage + 116) = (*(double *)(*(void *)(DerivedStorage + 64) + 48)
                                                           * (double)v14
                                                           / 1000.0);
          goto LABEL_27;
        }
        unsigned int v18 = -12782;
        goto LABEL_26;
      }
    }
    else
    {
      CFGetAllocator(a1);
      unsigned int v18 = APAudioSourceCarPlayCreate();
      if (!v18)
      {
        uint64_t v9 = *(void *)(DerivedStorage + 80);
        uint64_t v10 = FigEndpointStreamGetCMBaseObject();
        uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v11) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v15 = *(uint64_t (**)(uint64_t, void, uint64_t))(v12 + 56);
        if (v15)
        {
          unsigned int v18 = v15(v10, kFigEndpointStreamProperty_AudioSource, v9);
          if (v18) {
            goto LABEL_26;
          }
          CFDictionaryRef v16 = (const void *)CFStringCreateF();
          unsigned int v18 = APSAudioStatsCreate();
          if (v18) {
            goto LABEL_26;
          }
          CFRelease(v16);
          goto LABEL_24;
        }
        unsigned int v18 = -12782;
LABEL_26:
        APSLogErrorAt();
        goto LABEL_27;
      }
    }
    APSLogErrorAt();
    goto LABEL_28;
  }
LABEL_27:
  if (v18)
  {
LABEL_28:
    sub_9E94();
    return v18;
  }
  return 0;
}

uint64_t sub_9E94()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 73))
  {
    uint64_t v1 = DerivedStorage;
    int v2 = *(unsigned __int8 *)(DerivedStorage + 72);
    uint64_t v3 = *(void *)(DerivedStorage + 80);
    uint64_t VTable = CMBaseObjectGetVTable();
    if (v2)
    {
      if (*(void *)(VTable + 16)) {
        uint64_t v5 = *(void **)(VTable + 16);
      }
      else {
        uint64_t v5 = 0;
      }
      if (*v5 >= 2uLL)
      {
        uint64_t v7 = (void (*)(uint64_t))v5[4];
        if (v7) {
          v7(v3);
        }
      }
      uint64_t v8 = *(const void **)(v1 + 80);
      if (v8)
      {
        CFRelease(v8);
        *(void *)(v1 + 80) = 0;
      }
      uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = *(void (**)(uint64_t, void, void))(v11 + 56);
      if (v12) {
        v12(CMBaseObject, kFigEndpointStreamProperty_AudioSink, 0);
      }
      unsigned int v13 = *(_DWORD *)(v1 + 88);
      if (v13)
      {
        ++*(_DWORD *)(v1 + 100);
        if (v13 > *(_DWORD *)(v1 + 92)) {
          *(_DWORD *)(v1 + 92) = v13;
        }
        *(_DWORD *)(v1 + 88) = 0;
      }
      if (dword_10070 <= 60 && (dword_10070 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (*(void *)(VTable + 16)) {
        uint64_t v6 = *(void **)(VTable + 16);
      }
      else {
        uint64_t v6 = 0;
      }
      if (*v6 >= 2uLL)
      {
        unint64_t v14 = (void (*)(uint64_t))v6[5];
        if (v14) {
          v14(v3);
        }
      }
      uint64_t v15 = *(const void **)(v1 + 80);
      if (v15)
      {
        CFRelease(v15);
        *(void *)(v1 + 80) = 0;
      }
      uint64_t v16 = FigEndpointStreamGetCMBaseObject();
      uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v17) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = *(void (**)(uint64_t, void, void))(v18 + 56);
      if (v19) {
        v19(v16, kFigEndpointStreamProperty_AudioSource, 0);
      }
      APSAudioStats_TerminateSession();
      if (dword_10070 <= 50 && (dword_10070 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      long long v20 = *(const void **)(v1 + 88);
      if (v20)
      {
        CFRelease(v20);
        *(void *)(v1 + 88) = 0;
      }
    }
  }
  return 0;
}

uint64_t sub_A290(uint64_t a1, int a2, uint64_t a3, _OWORD *a4, unsigned __int8 *a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v34 = a3;
  uint64_t v10 = *(void *)(DerivedStorage + 64);
  if (!*(unsigned char *)(v10 + 138))
  {
    APSLogErrorAt();
    return 1937010544;
  }
  uint64_t v11 = DerivedStorage;
  if (!*(unsigned char *)(DerivedStorage + 73)) {
    return 0;
  }
  size_t v12 = (*(_DWORD *)(v10 + 72) * a3);
  size_t v45 = v12;
  long long v13 = a4[5];
  v35[4] = a4[4];
  long long v36 = v13;
  long long v14 = a4[9];
  long long v39 = a4[8];
  long long v40 = v14;
  long long v15 = a4[7];
  long long v37 = a4[6];
  long long v38 = v15;
  long long v16 = a4[13];
  long long v43 = a4[12];
  long long v44 = v16;
  long long v17 = a4[11];
  long long v41 = a4[10];
  long long v42 = v17;
  long long v18 = a4[3];
  v35[2] = a4[2];
  v35[3] = v18;
  long long v19 = a4[1];
  v35[0] = *a4;
  v35[1] = v19;
  if (!*(unsigned char *)(DerivedStorage + 72))
  {
    if (a2 == 1919513701)
    {
      APSAudioStats_ProcessAudioBuffer();
      LODWORD(v23) = *(_DWORD *)(v11 + 116);
      *(double *)&long long v40 = *(double *)&v40 + (double)v23;
      *(double *)(v11 + 104) = *(double *)&v40 + (double)a3 + (double)(10 * a3);
      *(unsigned char *)(v11 + 112) = 1;
      uint64_t v24 = *(void *)(v11 + 80);
      long long v25 = *(void **)(CMBaseObjectGetVTable() + 16);
      if (v25) {
        CMTime v26 = v25;
      }
      else {
        CMTime v26 = 0;
      }
      if (*v26 < 2uLL) {
        return 4294954515;
      }
      uint64_t v32 = (uint64_t (*)(uint64_t, unsigned __int8 *, size_t, void, uint64_t, _OWORD *))v26[7];
      if (v32) {
        return v32(v24, a5, v12, 0, a3, v35);
      }
      else {
        return 4294954514;
      }
    }
    uint64_t v30 = 1970171760;
LABEL_34:
    APSLogErrorAt();
    return v30;
  }
  if (a2 != 1919246692)
  {
    uint64_t v30 = 1970171760;
    goto LABEL_34;
  }
  *(double *)(DerivedStorage + 104) = *(double *)&v36 + (double)a3;
  *(unsigned char *)(DerivedStorage + 112) = 1;
  uint64_t v20 = *(void *)(DerivedStorage + 80);
  uint64_t v21 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v21) {
    long long v22 = v21;
  }
  else {
    long long v22 = 0;
  }
  if (*v22 < 2uLL
    || (long long v27 = (uint64_t (*)(uint64_t, _OWORD *, unsigned __int8 *, size_t, void, uint64_t, size_t *, int *))v22[7]) == 0
    || (v28 = v27(v20, v35, a5, v12, 0, a3, &v45, &v34), size_t v12 = v45, v28))
  {
    bzero(a5, v12);
  }
  if (!v12)
  {
LABEL_18:
    uint64_t v30 = 0;
    *(_DWORD *)(v11 + 88) += a3;
    *(_DWORD *)(v11 + 96) += a3;
    return v30;
  }
  while (!*a5++)
  {
    if (!--v12) {
      goto LABEL_18;
    }
  }
  unsigned int v31 = *(_DWORD *)(v11 + 88);
  if (!v31) {
    return 0;
  }
  ++*(_DWORD *)(v11 + 100);
  if (v31 > *(_DWORD *)(v11 + 92)) {
    *(_DWORD *)(v11 + 92) = v31;
  }
  uint64_t v30 = 0;
  *(_DWORD *)(v11 + 88) = 0;
  return v30;
}

uint64_t sub_A618(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(CMBaseObjectGetDerivedStorage() + 64) + 40))
  {
    uint64_t HALDescription = APCarPlayAudioFormatInfoGetHALDescription();
    uint64_t result = 0;
    uint64_t v5 = *(void *)(HALDescription + 32);
    long long v6 = *(_OWORD *)(HALDescription + 16);
    *(_OWORD *)a2 = *(_OWORD *)HALDescription;
    *(_OWORD *)(a2 + 16) = v6;
    *(void *)(a2 + 32) = v5;
  }
  else
  {
    APSLogErrorAt();
    return 2003329396;
  }
  return result;
}

uint64_t *CarPlayHALPlugin_Create(uint64_t a1, const void *a2)
{
  if (APSIsRemoteHALPluginLoadingEnabled() && !FigServer_IsAirplayd()) {
    return 0;
  }
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  uint64_t v4 = &qword_10160;
  qword_10160 = FigHALPluginDriverGetInterface();
  if (FigHALAudioObjectMapperCreate() || FigHALAudioCreateEndpointCentricPluginObject())
  {
    APSLogErrorAt();
    return 0;
  }
  return v4;
}

uint64_t sub_A794(uint64_t a1, void *a2)
{
  uint64_t v3 = APGetEndpointManagerCarPlay();
  if (v3) {
    APSLogErrorAt();
  }
  else {
    *a2 = 0;
  }
  return v3;
}

uint64_t APAudioSinkJitterBufferCreate()
{
  return _APAudioSinkJitterBufferCreate();
}

uint64_t APAudioSourceCarPlayCreate()
{
  return _APAudioSourceCarPlayCreate();
}

uint64_t APAudioZeroTimeStampProviderGetHighAccuracySupport()
{
  return _APAudioZeroTimeStampProviderGetHighAccuracySupport();
}

uint64_t APAudioZeroTimeStampProviderGetUpdateInterval()
{
  return _APAudioZeroTimeStampProviderGetUpdateInterval();
}

uint64_t APAudioZeroTimeStampProviderGetZeroTimeStamp()
{
  return _APAudioZeroTimeStampProviderGetZeroTimeStamp();
}

uint64_t APAudioZeroTimeStampProviderIsStable()
{
  return _APAudioZeroTimeStampProviderIsStable();
}

uint64_t APCarPlayAudioFormatInfoGetDescription()
{
  return _APCarPlayAudioFormatInfoGetDescription();
}

uint64_t APCarPlayAudioFormatInfoGetHALDescription()
{
  return _APCarPlayAudioFormatInfoGetHALDescription();
}

uint64_t APCarPlayAudioFormatInfoGetLatencyInfo()
{
  return _APCarPlayAudioFormatInfoGetLatencyInfo();
}

uint64_t APCarPlayAudioFormatsCopyFormatInfoForHALDescription()
{
  return _APCarPlayAudioFormatsCopyFormatInfoForHALDescription();
}

uint64_t APCarPlayAudioFormatsGetHALDescriptions()
{
  return _APCarPlayAudioFormatsGetHALDescriptions();
}

uint64_t APGetEndpointManagerCarPlay()
{
  return _APGetEndpointManagerCarPlay();
}

uint64_t APSAudioStatsCreate()
{
  return _APSAudioStatsCreate();
}

uint64_t APSAudioStats_ProcessAudioBuffer()
{
  return _APSAudioStats_ProcessAudioBuffer();
}

uint64_t APSAudioStats_TerminateSession()
{
  return _APSAudioStats_TerminateSession();
}

uint64_t APSGetFBOPropertyInt64()
{
  return _APSGetFBOPropertyInt64();
}

uint64_t APSIsRemoteHALPluginLoadingEnabled()
{
  return _APSIsRemoteHALPluginLoadingEnabled();
}

uint64_t APSLogErrorAt()
{
  return _APSLogErrorAt();
}

uint64_t ASPrintF()
{
  return _ASPrintF();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return _CFGetAllocator(cf);
}

uint64_t CFGetDouble()
{
  return _CFGetDouble();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t CFStringCreateF()
{
  return _CFStringCreateF();
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return _CMBaseObjectGetDerivedStorage();
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return _CMClockGetHostTimeClock();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return _CMClockGetTime(retstr, clock);
}

uint64_t CMDerivedObjectCreate()
{
  return _CMDerivedObjectCreate();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return _CMNotificationCenterGetDefaultLocalCenter();
}

uint64_t CMNotificationCenterPostNotification()
{
  return _CMNotificationCenterPostNotification();
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeSubtract(retstr, lhs, rhs);
}

uint64_t FigCFEqual()
{
  return _FigCFEqual();
}

uint64_t FigEndpointCopyStreamsForTypeAndSubType()
{
  return _FigEndpointCopyStreamsForTypeAndSubType();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return _FigEndpointGetCMBaseObject();
}

uint64_t FigEndpointStreamGetCMBaseObject()
{
  return _FigEndpointStreamGetCMBaseObject();
}

uint64_t FigEndpointStreamResumeSync()
{
  return _FigEndpointStreamResumeSync();
}

uint64_t FigEndpointStreamSuspend()
{
  return _FigEndpointStreamSuspend();
}

uint64_t FigEndpointStreamSuspendSync()
{
  return _FigEndpointStreamSuspendSync();
}

uint64_t FigHALAudioConfigChangeCreateRecord()
{
  return _FigHALAudioConfigChangeCreateRecord();
}

uint64_t FigHALAudioConfigChangeDisposeRecord()
{
  return _FigHALAudioConfigChangeDisposeRecord();
}

uint64_t FigHALAudioConfigChangeSendRequest()
{
  return _FigHALAudioConfigChangeSendRequest();
}

uint64_t FigHALAudioCreateEndpointCentricPluginObject()
{
  return _FigHALAudioCreateEndpointCentricPluginObject();
}

uint64_t FigHALAudioDeviceGetClassID()
{
  return _FigHALAudioDeviceGetClassID();
}

uint64_t FigHALAudioObjectMapperAddMapping()
{
  return _FigHALAudioObjectMapperAddMapping();
}

uint64_t FigHALAudioObjectMapperCreate()
{
  return _FigHALAudioObjectMapperCreate();
}

uint64_t FigHALAudioObjectMapperRemoveMapping()
{
  return _FigHALAudioObjectMapperRemoveMapping();
}

uint64_t FigHALAudioPropertySendChanges()
{
  return _FigHALAudioPropertySendChanges();
}

uint64_t FigHALAudioStreamGetClassID()
{
  return _FigHALAudioStreamGetClassID();
}

uint64_t FigHALPluginDriverGetInterface()
{
  return _FigHALPluginDriverGetInterface();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return _FigNotificationCenterAddWeakListener();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return _FigNotificationCenterRemoveWeakListener();
}

uint64_t FigServer_IsAirplayd()
{
  return _FigServer_IsAirplayd();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t LogCategoryCopyOSLogHandle()
{
  return _LogCategoryCopyOSLogHandle();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t UpTicksPerSecond()
{
  return _UpTicksPerSecond();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}