uint64_t sub_488C(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  CFStringRef v31;
  const void *v32;
  CFTypeRef v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, int *, uint64_t, uint64_t, uint64_t, _DWORD *, int *);
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t vars8;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v14 = DerivedStorage;
  v15 = *a2;
  v16 = 2003332927;
  if (*a2 <= 1819173228)
  {
    if (v15 > 1668641651)
    {
      if (v15 <= 1735354733)
      {
        if (v15 == 1668641652)
        {
          *a6 = 12;
          if (a5 > 0xB)
          {
            v16 = 0;
            a7[2] = 0;
            *(void *)a7 = *(void *)"tppawwar";
            return v16;
          }
          v16 = 561211770;
          goto LABEL_171;
        }
        if (v15 == 1684236338)
        {
          if (a5 > 7)
          {
            v16 = 0;
            *(void *)a7 = 0x200000001;
            v37 = 8;
LABEL_166:
            *a6 = v37;
            return v16;
          }
          v16 = 561211770;
LABEL_171:
          APSLogErrorAt();
          return v16;
        }
        v17 = 1684434036;
      }
      else
      {
        if (v15 > 1818850925)
        {
          if (v15 == 1818850926)
          {
            *a6 = 4;
            if (a5 < 4) {
              return 561211770;
            }
            v16 = 0;
            v20 = *(unsigned char *)(DerivedStorage + 84) == 0;
            goto LABEL_118;
          }
          if (v15 != 1819107691) {
            return v16;
          }
          *a6 = 8;
          if (a5 < 8) {
            return 561211770;
          }
          v31 = @"Apple, Inc.";
          goto LABEL_74;
        }
        if (v15 == 1735354734)
        {
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          v16 = 0;
          v20 = *(_DWORD *)(DerivedStorage + 80) > 0;
          goto LABEL_118;
        }
        v17 = 1751737454;
      }
      if (v15 != v17) {
        return v16;
      }
LABEL_59:
      *a6 = 4;
      if (a5 >= 4)
      {
        v16 = 0;
        *a7 = 0;
        return v16;
      }
      return 561211770;
    }
    if (v15 <= 1668047218)
    {
      switch(v15)
      {
        case 1634429294:
          *a6 = 4;
          if (a5 < 4) {
            return 0;
          }
          v16 = 0;
          v20 = *(_DWORD *)DerivedStorage;
          break;
        case 1634758772:
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          v16 = 0;
          v20 = *(_DWORD *)(DerivedStorage + 44);
          break;
        case 1650682995:
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          v16 = 0;
          v20 = 1634689642;
          break;
        default:
          return v16;
      }
LABEL_118:
      *a7 = v20;
      return v16;
    }
    if (v15 == 1668047219)
    {
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      v16 = 0;
      v20 = 1633969526;
      goto LABEL_118;
    }
    if (v15 == 1668049764) {
      goto LABEL_59;
    }
    if (v15 != 1668575852) {
      return v16;
    }
    v25 = a5 >> 2;
    v26 = a2[1];
    switch(v26)
    {
      case 1869968496:
        goto LABEL_55;
      case 1768845428:
        if (a5 >= 4) {
          v25 = 0;
        }
        break;
      case 1735159650:
LABEL_55:
        v28 = *(void *)(DerivedStorage + 64);
        v27 = *(void *)(DerivedStorage + 72);
        v29 = v28 != 0;
        if (v27) {
          ++v29;
        }
        if (v25 >= v29) {
          v25 = v29;
        }
        if (v25)
        {
          if (!v28)
          {
            v30 = 0;
LABEL_151:
            if (v27) {
              a7[v30] = sub_5ECC(v27);
            }
            break;
          }
          *a7 = sub_5ECC(*(void *)(v14 + 64));
          if (v25 >= 2)
          {
            v27 = *(void *)(v14 + 72);
            v30 = 1;
            goto LABEL_151;
          }
          v25 = 1;
        }
        break;
    }
    v16 = 0;
    v37 = 4 * v25;
    goto LABEL_166;
  }
  if (v15 > 1935763059)
  {
    if (v15 > 1937007733)
    {
      if (v15 > 1953653101)
      {
        if (v15 == 1953653102)
        {
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          v16 = 0;
          v20 = *(_DWORD *)(DerivedStorage + 40);
          goto LABEL_118;
        }
        v21 = 1969841184;
LABEL_71:
        if (v15 != v21) {
          return v16;
        }
        *a6 = 8;
        if (a5 < 8) {
          return 561211770;
        }
        v31 = *(const __CFString **)(DerivedStorage + 24);
        if (!v31)
        {
LABEL_75:
          v16 = 0;
          *(void *)a7 = v31;
          return v16;
        }
LABEL_74:
        v31 = (const __CFString *)CFRetain(v31);
        goto LABEL_75;
      }
      if (v15 == 1937007734)
      {
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        v16 = 0;
        v20 = 1;
        goto LABEL_118;
      }
      if (v15 != 1937009955) {
        return v16;
      }
      v18 = a2[1];
      if (v18 == 1869968496) {
        goto LABEL_21;
      }
      v19 = a5 >> 2;
      if (v18 == 1768845428)
      {
        if (a5 >= 4) {
          v19 = 0;
        }
        goto LABEL_133;
      }
      if (v18 == 1735159650)
      {
LABEL_21:
        if (a5 < 4)
        {
          v19 = 0;
        }
        else
        {
          *a7 = sub_5ECC(*(void *)(DerivedStorage + 56));
          v19 = 1;
        }
      }
LABEL_133:
      v16 = 0;
      v37 = 4 * v19;
      goto LABEL_166;
    }
    if (v15 != 1935763060 && v15 != 1936092276)
    {
      if (v15 != 1936879204) {
        return v16;
      }
      v22 = *(_DWORD *)(*(void *)(DerivedStorage + 48) + 44);
      v23 = 20 * v22 + 12;
      if (v23 <= a5)
      {
        bzero(a7, (20 * v22 + 12));
        v16 = 0;
        if (v22 == 1) {
          v24 = 6553601;
        }
        else {
          v24 = 6619138;
        }
        *a7 = v24;
        *a6 = v23;
        return v16;
      }
      v16 = 561211770;
      goto LABEL_171;
    }
    goto LABEL_59;
  }
  if (v15 > 1853059618)
  {
    if (v15 <= 1870098019)
    {
      if (v15 == 1853059619)
      {
        v16 = 0;
        *a6 = 0;
        return v16;
      }
      if (v15 != 1853059700) {
        return v16;
      }
      *a6 = 8;
      if (a5 >= 8)
      {
        v16 = 0;
        *(void *)a7 = *(void *)(*(void *)(DerivedStorage + 48) + 16);
        return v16;
      }
      return 561211770;
    }
    if (v15 != 1870098020)
    {
      if (v15 != 1919512167) {
        return v16;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      v16 = 0;
      v20 = 11025;
      goto LABEL_118;
    }
    LODWORD(v38) = a5 >> 2;
    v39 = a2[1];
    switch(v39)
    {
      case 1869968496:
        if (*(void *)(DerivedStorage + 64)) {
          v45 = 2;
        }
        else {
          v45 = 1;
        }
        if (*(void *)(DerivedStorage + 72)) {
          ++v45;
        }
        if (v38 >= v45) {
          v41 = v45;
        }
        else {
          v41 = a5 >> 2;
        }
        if (v41)
        {
          *a7 = sub_5ECC(*(void *)(DerivedStorage + 56));
          if (v41 != 1)
          {
            v46 = *(void *)(v14 + 64);
            if (v46)
            {
              a7[1] = sub_5ECC(v46);
              v47 = 2;
              LODWORD(v38) = 2;
              if (v41 < 3) {
                goto LABEL_165;
              }
            }
            else
            {
              v47 = 1;
            }
            v49 = *(void *)(v14 + 72);
            if (v49) {
              a7[v47] = sub_5ECC(v49);
            }
LABEL_164:
            LODWORD(v38) = v41;
            goto LABEL_165;
          }
          goto LABEL_146;
        }
        break;
      case 1768845428:
        if (a5 >= 4) {
          LODWORD(v38) = 0;
        }
        goto LABEL_165;
      case 1735159650:
        if (*(void *)(DerivedStorage + 64)) {
          v40 = 2;
        }
        else {
          v40 = 1;
        }
        if (*(void *)(DerivedStorage + 72)) {
          ++v40;
        }
        if (v38 >= v40) {
          v41 = v40;
        }
        else {
          v41 = a5 >> 2;
        }
        if (v41)
        {
          *a7 = sub_5ECC(*(void *)(DerivedStorage + 56));
          if (v41 != 1)
          {
            v42 = *(void *)(v14 + 64);
            if (v42)
            {
              a7[1] = sub_5ECC(v42);
              v38 = 2;
              if (v41 < 3) {
                goto LABEL_165;
              }
            }
            else
            {
              v38 = 1;
            }
            v48 = *(void *)(v14 + 72);
            if (v48) {
              a7[v38] = sub_5ECC(v48);
            }
            goto LABEL_164;
          }
LABEL_146:
          LODWORD(v38) = 1;
          goto LABEL_165;
        }
        break;
      default:
LABEL_165:
        v16 = 0;
        v37 = 4 * v38;
        goto LABEL_166;
    }
    LODWORD(v38) = 0;
    goto LABEL_165;
  }
  if (v15 == 1819173229)
  {
    v32 = *(const void **)(DerivedStorage + 32);
    if (!v32 || (v33 = CFRetain(v32)) == 0) {
      v33 = CFRetain(@"No Name Endpoint");
    }
    *a6 = 8;
    if (a5 < 8)
    {
      v16 = 561211770;
    }
    else
    {
      v16 = 0;
      *(void *)a7 = CFRetain(v33);
    }
    if (v33) {
      CFRelease(v33);
    }
    return v16;
  }
  if (v15 != 1819569763)
  {
    v21 = 1836411236;
    goto LABEL_71;
  }
  v34 = *(void *)(DerivedStorage + 56);
  v35 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v35) {
    v36 = v35;
  }
  else {
    v36 = 0;
  }
  v43 = *(uint64_t (**)(uint64_t, int *, uint64_t, uint64_t, uint64_t, _DWORD *, int *))(v36 + 40);
  if (!v43) {
    return 4294954514;
  }

  return v43(v34, a2, a3, a4, a5, a6, a7);
}

BOOL sub_5178(uint64_t a1, int *a2)
{
  BOOL result = 0;
  int v3 = *a2;
  if (*a2 <= 1819173228)
  {
    if (v3 <= 1668641651)
    {
      if (v3 > 1668047218)
      {
        BOOL v5 = v3 == 1668047219 || v3 == 1668049764;
        int v6 = 1668575852;
      }
      else
      {
        BOOL v5 = v3 == 1634429294 || v3 == 1634758772;
        int v6 = 1650682995;
      }
      if (v5 || v3 == v6) {
        return 1;
      }
    }
    else
    {
      if (v3 > 1735354733)
      {
        if (v3 > 1818850925)
        {
          if (v3 == 1818850926) {
            return 1;
          }
          int v4 = 1819107691;
        }
        else
        {
          if (v3 == 1735354734) {
            return 1;
          }
          int v4 = 1751737454;
        }
        goto LABEL_57;
      }
      if (v3 == 1668641652) {
        return 1;
      }
      if (v3 == 1684236338 || v3 == 1684434036) {
        goto LABEL_36;
      }
    }
  }
  else
  {
    if (v3 <= 1935763059)
    {
      if (v3 > 1853059618)
      {
        if (v3 <= 1870098019)
        {
          if (v3 != 1853059619)
          {
            int v4 = 1853059700;
            goto LABEL_57;
          }
          return 1;
        }
        if (v3 == 1870098020) {
          return 1;
        }
        int v4 = 1919512167;
LABEL_57:
        if (v3 != v4) {
          return result;
        }
        return 1;
      }
      if (v3 == 1819173229) {
        return 1;
      }
      if (v3 != 1819569763)
      {
        int v4 = 1836411236;
        goto LABEL_57;
      }
      goto LABEL_36;
    }
    if (v3 > 1937007733)
    {
      if (v3 > 1953653101)
      {
        if (v3 == 1969841184) {
          return 1;
        }
        int v4 = 1953653102;
      }
      else
      {
        if (v3 == 1937007734) {
          return 1;
        }
        int v4 = 1937009955;
      }
      goto LABEL_57;
    }
    if (v3 == 1935763060 || v3 == 1936092276 || v3 == 1936879204)
    {
LABEL_36:
      int v9 = a2[1];
      return v9 == 1768845428 || v9 == 1869968496;
    }
  }
  return result;
}

uint64_t sub_53D0(const __CFAllocator *a1, uint64_t a2, uint64_t a3, CFTypeRef *a4)
{
  CFTypeRef v22 = 0;
  int v21 = 0;
  CFTypeRef cf = 0;
  FigHALAudioDeviceGetClassID();
  uint64_t v8 = CMDerivedObjectCreate();
  if (v8)
  {
    uint64_t v17 = v8;
  }
  else
  {
    uint64_t v9 = FigHALAudioObjectMapperAddMapping();
    if (v9)
    {
      uint64_t v17 = v9;
    }
    else
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      *(void *)(DerivedStorage + 8) = a3;
      *(void *)(DerivedStorage + 16) = a2;
      *(_DWORD *)uint64_t DerivedStorage = v21;
      *(_DWORD *)(DerivedStorage + 40) = 1634300528;
      if (qword_18238 != -1) {
        dispatch_once(&qword_18238, &stru_14728);
      }
      uint64_t Instance = _CFRuntimeCreateInstance();
      if (Instance)
      {
        *(void *)(DerivedStorage + 48) = Instance;
      }
      else
      {
        APSLogErrorAt();
        uint64_t v19 = FigSignalErrorAt();
        if (v19)
        {
          uint64_t v17 = v19;
          goto LABEL_30;
        }
      }
      *(void *)(DerivedStorage + 24) = CFRetain(@"ap:ha:nd:of:fd:ev-screen");
      *(_DWORD *)(DerivedStorage + 44) = 1885433953;
      *(void *)(DerivedStorage + 32) = CFRetain(@"AirPlayHandoffDevice");
      uint64_t v12 = *(void *)(DerivedStorage + 48);
      CFTypeRef v23 = 0;
      uint64_t DescriptionArray = APAudioFormatCreateDescriptionArray();
      if (DescriptionArray)
      {
        uint64_t v17 = DescriptionArray;
        APSLogErrorAt();
      }
      else
      {
        *(void *)(v12 + 56) = v23;
        if (dword_18000 <= 50 && (dword_18000 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v14 = sub_66A0((uint64_t)a1, a2, v21, a3, *(const void **)(DerivedStorage + 48), (void *)(DerivedStorage + 56));
        if (v14)
        {
          uint64_t v17 = v14;
        }
        else
        {
          uint64_t v15 = sub_FE04(a1, (CFDataRef *)&cf);
          if (v15)
          {
            uint64_t v17 = v15;
          }
          else
          {
            uint64_t v16 = sub_FE90((uint64_t)a1, a2, a3, v21, cf, (void *)(DerivedStorage + 64));
            if (v16)
            {
              uint64_t v17 = v16;
            }
            else
            {
              uint64_t v17 = sub_FF94((uint64_t)a1, a2, a3, v21, cf, (void *)(DerivedStorage + 72));
              if (!v17)
              {
                *a4 = v22;
                CFTypeRef v22 = 0;
                goto LABEL_17;
              }
            }
          }
        }
      }
    }
  }
LABEL_30:
  APSLogErrorAt();
LABEL_17:
  if (cf) {
    CFRelease(cf);
  }
  if (v22) {
    CFRelease(v22);
  }
  return v17;
}

void sub_5748()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  v1 = (const void *)DerivedStorage[3];
  if (v1)
  {
    CFRelease(v1);
    DerivedStorage[3] = 0;
  }
  v2 = (const void *)DerivedStorage[4];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[4] = 0;
  }
  int v3 = (const void *)DerivedStorage[7];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[7] = 0;
  }
  int v4 = (const void *)DerivedStorage[6];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[6] = 0;
  }
  BOOL v5 = (const void *)DerivedStorage[8];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[8] = 0;
  }
  int v6 = (const void *)DerivedStorage[9];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[9] = 0;
  }
}

CFStringRef sub_57CC()
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage();
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"APHALHandoffAudioDevice ID %d UID %@", *DerivedStorage, *((void *)DerivedStorage + 3));
}

uint64_t sub_5818()
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage();
}

BOOL sub_5834(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1853059700;
}

uint64_t sub_584C(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t result = 0;
  int v5 = *a2;
  if (*a2 <= 1819173228)
  {
    if (v5 > 1668641651)
    {
      if (v5 == 1819107691) {
        int v9 = 8;
      }
      else {
        int v9 = 0;
      }
      if (v5 == 1818850926) {
        int v10 = 4;
      }
      else {
        int v10 = v9;
      }
      if (v5 == 1751737454) {
        int v11 = 4;
      }
      else {
        int v11 = 0;
      }
      if (v5 == 1735354734) {
        int v12 = 4;
      }
      else {
        int v12 = v11;
      }
      if (v5 <= 1818850925) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v10;
      }
      if (v5 == 1684434036) {
        int v14 = 4;
      }
      else {
        int v14 = 0;
      }
      if (v5 == 1684236338) {
        int v15 = 8;
      }
      else {
        int v15 = v14;
      }
      if (v5 == 1668641652) {
        unsigned int v16 = 12;
      }
      else {
        unsigned int v16 = v15;
      }
      if (v5 <= 1735354733) {
        return v16;
      }
      else {
        return v13;
      }
    }
    if (v5 > 1668047218)
    {
      if (v5 != 1668047219 && v5 != 1668049764)
      {
        if (v5 == 1668575852)
        {
          if (DerivedStorage[9]) {
            int v21 = (DerivedStorage[8] != 0) + 1;
          }
          else {
            int v21 = DerivedStorage[8] != 0;
          }
          return (4 * v21);
        }
        return result;
      }
    }
    else if (v5 != 1634429294 && v5 != 1634758772 && v5 != 1650682995)
    {
      return result;
    }
    return 4;
  }
  if (v5 > 1935763059)
  {
    if (v5 <= 1937007733)
    {
      if (v5 != 1935763060 && v5 != 1936092276)
      {
        if (v5 == 1936879204) {
          return (20 * *(_DWORD *)(DerivedStorage[6] + 44) + 12);
        }
        return result;
      }
    }
    else
    {
      if (v5 > 1953653101)
      {
        int v6 = 1953653102;
        unsigned int v7 = 4;
        int v8 = 1969841184;
LABEL_70:
        if (v5 == v8) {
          unsigned int v20 = 8;
        }
        else {
          unsigned int v20 = 0;
        }
LABEL_73:
        if (v5 == v6) {
          return v7;
        }
        else {
          return v20;
        }
      }
      if (v5 != 1937007734)
      {
        if (v5 != 1937009955) {
          return result;
        }
        int v17 = a2[1];
        BOOL v18 = v17 == 1869968496 || v17 == 1735159650;
        goto LABEL_66;
      }
    }
    return 4;
  }
  if (v5 <= 1853059618)
  {
    int v6 = 1819173229;
    unsigned int v7 = 8;
    if (v5 == 1836411236) {
      int v19 = 8;
    }
    else {
      int v19 = 0;
    }
    if (v5 == 1819569763) {
      unsigned int v20 = 4;
    }
    else {
      unsigned int v20 = v19;
    }
    goto LABEL_73;
  }
  if (v5 <= 1870098019)
  {
    int v6 = 1853059619;
    unsigned int v7 = 32;
    int v8 = 1853059700;
    goto LABEL_70;
  }
  if (v5 != 1870098020)
  {
    BOOL v18 = v5 == 1919512167;
LABEL_66:
    if (v18) {
      return 4;
    }
    else {
      return 0;
    }
  }
  int v22 = a2[1];
  if (v22 != 1869968496 && v22 != 1735159650) {
    return 0;
  }
  if (DerivedStorage[9]) {
    int v23 = (DerivedStorage[8] != 0) + 1;
  }
  else {
    int v23 = DerivedStorage[8] != 0;
  }
  return (4 * v23 + 4);
}

uint64_t sub_5BA8(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, double *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFDataRef v33 = 0;
  uint64_t v34 = 0;
  if (*a2 != 1853059700)
  {
    uint64_t v17 = 2003332927;
    goto LABEL_25;
  }
  uint64_t v10 = DerivedStorage;
  memset(__s2, 0, 40);
  uint64_t v11 = *(void *)(DerivedStorage + 48);
  long long v12 = *(_OWORD *)(v11 + 32);
  long long v29 = *(_OWORD *)(v11 + 16);
  long long v30 = v12;
  uint64_t v31 = *(void *)(v11 + 48);
  if (a5 != 8)
  {
    uint64_t v17 = 561211770;
LABEL_24:
    APSLogErrorAt();
    goto LABEL_25;
  }
  double v13 = *a6;
  if (*a6 == *(double *)&v29)
  {
LABEL_22:
    uint64_t v17 = 0;
    goto LABEL_25;
  }
  uint64_t CMBaseObject = FigHALAudioStreamGetCMBaseObject();
  uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  BOOL v18 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFDataRef *))(v16 + 48);
  if (!v18)
  {
    uint64_t v17 = 4294954514;
    goto LABEL_24;
  }
  uint64_t v19 = v18(CMBaseObject, kFigHALAudioStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, &v33);
  if (v19)
  {
    uint64_t v17 = v19;
    goto LABEL_24;
  }
  CFDataRef v20 = v33;
  unint64_t Length = CFDataGetLength(v33);
  if (Length < 0x70)
  {
    uint64_t v17 = 4294967246;
LABEL_31:
    APSLogErrorAt();
    goto LABEL_24;
  }
  unint64_t v22 = Length / 0x38;
  BytePtr = CFDataGetBytePtr(v20);
  v24 = 0;
  do
  {
    if (*((double *)BytePtr + 5) <= v13 && *((double *)BytePtr + 6) >= v13)
    {
      v24 = BytePtr;
      if (*((_DWORD *)BytePtr + 7) == HIDWORD(v30))
      {
        v24 = BytePtr;
        if (*((_DWORD *)BytePtr + 8) >= v31)
        {
          v24 = BytePtr;
          goto LABEL_19;
        }
      }
    }
    BytePtr += 56;
    --v22;
  }
  while (v22);
  if (!v24)
  {
    uint64_t v17 = 1970171760;
    goto LABEL_31;
  }
LABEL_19:
  *(double *)__s2 = v13;
  long long v25 = *(_OWORD *)(v24 + 24);
  *(_OWORD *)((char *)__s2 + 8) = *(_OWORD *)(v24 + 8);
  *(_OWORD *)((char *)&__s2[1] + 8) = v25;
  if (!memcmp(&v29, __s2, 0x28uLL)) {
    goto LABEL_22;
  }
  sub_5ECC(*(void *)(v10 + 56));
  uint64_t v17 = FigHALAudioConfigChangeCreateRecord();
  if (v17)
  {
    APSLogErrorAt();
  }
  else
  {
    uint64_t v26 = v34;
    long long v27 = __s2[1];
    *(_OWORD *)(v34 + 16) = __s2[0];
    *(_OWORD *)(v26 + 32) = v27;
    *(void *)(v26 + 48) = *(void *)&__s2[2];
    FigHALAudioConfigChangeSendRequest();
    uint64_t v34 = 0;
  }
LABEL_25:
  FigHALAudioConfigChangeDisposeRecord();
  if (v33) {
    CFRelease(v33);
  }
  return v17;
}

uint64_t sub_5ECC(uint64_t a1)
{
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = *(uint64_t (**)(uint64_t))(v3 + 8);
  if (!v4) {
    return 0;
  }

  return v4(a1);
}

CFTypeRef sub_5F84()
{
  CFTypeRef result = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_5FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 == 1718579821)
  {
    uint64_t v6 = *(void *)(DerivedStorage + 56);
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    if (v10)
    {
      uint64_t v9 = v10(v6, 1718579821, a3);
      if (!v9)
      {
        FigHALAudioPropertySendChanges();
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v9 = 4294954514;
    }
    APSLogErrorAt();
    goto LABEL_11;
  }
  uint64_t v9 = FigSignalErrorAt();
LABEL_11:
  FigHALAudioConfigChangeDisposeRecord();
  return v9;
}

uint64_t sub_610C()
{
  return 0;
}

uint64_t sub_612C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage;
  if (*(unsigned char *)(DerivedStorage + 84))
  {
    APSLogErrorAt();
    uint64_t v2 = FigSignalErrorAt();
    if (!v2) {
      return v2;
    }
  }
  else
  {
    if (*(_DWORD *)(DerivedStorage + 80)) {
      return 0;
    }
    uint64_t v4 = *(void *)(DerivedStorage + 48);
    long long v5 = *(_OWORD *)(v4 + 32);
    *(_OWORD *)(v4 + 88) = *(_OWORD *)(v4 + 16);
    *(_OWORD *)(v4 + 104) = v5;
    *(void *)(v4 + 120) = *(void *)(v4 + 48);
    uint64_t v6 = *(void *)(DerivedStorage + 48);
    uint64_t v7 = *(void *)(DerivedStorage + 56);
    unsigned int v8 = *(double *)(v6 + 88);
    *(_DWORD *)(v6 + 160) = *(_DWORD *)(v6 + 112);
    *(_DWORD *)(v6 + 164) = v8;
    *(_DWORD *)(v6 + 156) = 0;
    *(void *)(v6 + 176) = 0;
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(uint64_t (**)(uint64_t))(v10 + 32);
    if (v11)
    {
      uint64_t v2 = v11(v7);
      if (!v2)
      {
        *(unsigned char *)(*(void *)(v1 + 48) + 200) = 1;
        *(_DWORD *)(v1 + 80) = 1;
        return v2;
      }
    }
    else
    {
      uint64_t v2 = 4294954514;
    }
    APSLogErrorAt();
  }
  uint64_t v12 = *(void *)(v1 + 56);
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(void (**)(uint64_t))(v14 + 40);
  if (v15) {
    v15(v12);
  }
  return v2;
}

uint64_t sub_6328()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(int *)(DerivedStorage + 80) >= 1)
  {
    uint64_t v1 = DerivedStorage;
    *(_DWORD *)(DerivedStorage + 80) = 0;
    uint64_t v2 = *(void *)(DerivedStorage + 56);
    uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    long long v5 = *(void (**)(uint64_t))(v4 + 40);
    if (v5) {
      v5(v2);
    }
    *(unsigned char *)(*(void *)(v1 + 48) + 200) = 0;
  }
  return 0;
}

uint64_t sub_63EC(uint64_t a1, double *a2, uint64_t *a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(*(void *)(DerivedStorage + 48) + 200))
  {
    uint64_t v8 = DerivedStorage;
    uint64_t v9 = mach_absolute_time();
    uint64_t v10 = *(void *)(v8 + 48);
    int v11 = *(_DWORD *)(v10 + 164);
    if (*(_DWORD *)(v10 + 156) != v11)
    {
      *(_DWORD *)(v10 + 156) = v11;
      uint64_t v12 = UpTicksPerSecond();
      uint64_t v10 = *(void *)(v8 + 48);
      *(void *)(v10 + 168) = (11025 * v12 / (unint64_t)*(unsigned int *)(v10 + 156));
    }
    uint64_t v13 = *(void *)(v10 + 176);
    if (!v13)
    {
      uint64_t v13 = *(void *)(v10 + 168) + v9;
      *(void *)(v10 + 176) = v13;
      *(void *)(v10 + 184) = v9;
      *(void *)(v10 + 192) = 0;
    }
    if (v9 >= v13)
    {
      *(void *)(v10 + 176) = *(void *)(v10 + 168) + v13;
      *(void *)(v10 + 184) = v13;
      double v14 = *(double *)(v10 + 192) + 11025.0;
      *(double *)(v10 + 192) = v14;
    }
    else
    {
      double v14 = *(double *)(v10 + 192);
      uint64_t v13 = *(void *)(v10 + 184);
    }
    uint64_t result = 0;
    *a2 = v14;
    *a3 = v13;
    *a4 = 0;
  }
  else
  {
    APSLogErrorAt();
    return 1937010544;
  }
  return result;
}

uint64_t sub_64F8(uint64_t a1, int a2, BOOL *a3, BOOL *a4)
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 48) + 200))
  {
    uint64_t result = 0;
    *a3 = a2 == 1919513701;
    *a4 = a2 == 1919513701;
  }
  else
  {
    APSLogErrorAt();
    return 1937010544;
  }
  return result;
}

uint64_t sub_6578()
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 48) + 200)) {
    return 0;
  }
  APSLogErrorAt();
  return 1937010544;
}

uint64_t sub_65C4()
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 48) + 200)) {
    return 0;
  }
  APSLogErrorAt();
  return 1937010544;
}

void sub_6610(id a1)
{
  qword_18248 = 0;
  unk_18250 = "APHALHandoffAudioSharedState";
  qword_18258 = (uint64_t)sub_6670;
  unk_18260 = 0;
  qword_18268 = (uint64_t)sub_6690;
  unk_18270 = 0u;
  unk_18280 = 0u;
  qword_18240 = _CFRuntimeRegisterClass();
}

double sub_6670(_OWORD *a1)
{
  double result = 0.0;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
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

void sub_6690(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 56);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_66A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, const void *a5, void *a6)
{
  FigHALAudioStreamGetClassID();
  uint64_t v10 = CMDerivedObjectCreate();
  if (v10)
  {
    uint64_t v18 = v10;
LABEL_16:
    APSLogErrorAt();
    return v18;
  }
  uint64_t v11 = FigHALAudioObjectMapperAddMapping();
  if (v11)
  {
    uint64_t v18 = v11;
    goto LABEL_16;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)uint64_t DerivedStorage = 0;
  *(void *)(DerivedStorage + 8) = a4;
  *(_DWORD *)(DerivedStorage + 16) = a3;
  *(_DWORD *)(DerivedStorage + 20) = 50;
  uint64_t v13 = (CFDataRef *)CFRetain(a5);
  *(void *)(DerivedStorage + 32) = v13;
  *(unsigned char *)(DerivedStorage + 24) = 1;
  if ((unint64_t)CFDataGetLength(v13[7]) >= 0x38)
  {
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56));
    uint64_t v15 = *(void *)(DerivedStorage + 32);
    long long v16 = *(_OWORD *)BytePtr;
    long long v17 = *((_OWORD *)BytePtr + 1);
    *(void *)(v15 + 48) = *((void *)BytePtr + 4);
    *(_OWORD *)(v15 + 16) = v16;
    *(_OWORD *)(v15 + 32) = v17;
    *(void *)(*(void *)(DerivedStorage + 32) + 16) = *((void *)BytePtr + 5);
    goto LABEL_5;
  }
  APSLogErrorAt();
  uint64_t v20 = FigSignalErrorAt();
  if (v20)
  {
    uint64_t v18 = v20;
    goto LABEL_16;
  }
LABEL_5:
  *a6 = 0;
  if (dword_18070 > 50) {
    return 0;
  }
  if (dword_18070 != -1 || _LogCategory_Initialize()) {
    LogPrintF();
  }
  return 0;
}

void sub_68B4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(const void **)(DerivedStorage + 32);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 32) = 0;
  }
}

CFStringRef sub_68E8()
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage();
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"APHALHandoffAudioStream ID %d Owner %d", *DerivedStorage, DerivedStorage[4]);
}

uint64_t sub_6934(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a4)
  {
    uint64_t v7 = DerivedStorage;
    if (CFEqual(a2, kFigHALAudioStreamProperty_SupportedPCMFormats))
    {
      uint64_t v8 = *(const void **)(*(void *)(v7 + 32) + 56);
      if (v8) {
        CFTypeRef v9 = CFRetain(v8);
      }
      else {
        CFTypeRef v9 = 0;
      }
      uint64_t result = 0;
      *a4 = v9;
    }
    else
    {
      return 4294954509;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294954516;
  }
  return result;
}

uint64_t sub_69D0()
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage();
}

uint64_t sub_69EC(uint64_t a1, int *a2)
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

BOOL sub_6ADC(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_6B10(uint64_t a1, int *a2)
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
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56)) / 0x38uLL);
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
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56)) / 0x38uLL);
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

uint64_t sub_6C60(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v12 = *a2;
  uint64_t result = 2003332927;
  if (*a2 <= 1935894637)
  {
    if (v12 <= 1885762591)
    {
      switch(v12)
      {
        case 1650682995:
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0;
            int v14 = 1634689642;
            goto LABEL_37;
          }
          break;
        case 1668047219:
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0;
            int v14 = 1634956402;
            goto LABEL_37;
          }
          break;
        case 1819569763:
          int v14 = *(_DWORD *)(DerivedStorage + 20);
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0;
LABEL_37:
            *a7 = v14;
            return result;
          }
          break;
        default:
          return result;
      }
      return 561211770;
    }
    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return result;
        }
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v14 = *(unsigned __int8 *)(DerivedStorage + 24);
          goto LABEL_37;
        }
        return 561211770;
      }
LABEL_23:
      size_t v15 = 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56)) / 0x38uLL);
      *a6 = v15;
      if (v15 <= a5)
      {
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56));
        memcpy(a7, BytePtr, v15);
        return 0;
      }
      return 561211770;
    }
LABEL_25:
    *a6 = 40;
    if (a5 >= 0x28)
    {
      uint64_t result = 0;
      uint64_t v17 = *(void *)(DerivedStorage + 32);
      long long v18 = *(_OWORD *)(v17 + 16);
      long long v19 = *(_OWORD *)(v17 + 32);
      *((void *)a7 + 4) = *(void *)(v17 + 48);
      *(_OWORD *)a7 = v18;
      *((_OWORD *)a7 + 1) = v19;
      return result;
    }
    return 561211770;
  }
  if (v12 > 1936092531)
  {
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v14 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_37;
        }
      }
      else
      {
        if (v12 != 1952805485) {
          return result;
        }
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v14 = 1936747378;
          goto LABEL_37;
        }
      }
      return 561211770;
    }
    goto LABEL_25;
  }
  switch(v12)
  {
    case 1935894638:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0;
        int v14 = 1;
        goto LABEL_37;
      }
      return 561211770;
    case 1935960434:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0;
        *a7 = 0;
        return result;
      }
      return 561211770;
    case 1936092513:
      goto LABEL_23;
  }
  return result;
}

uint64_t sub_6F24(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, long long *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v21 = 0;
  if (dword_18070 <= 40 && (dword_18070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v10 = *a2;
  if (*a2 != 1885762592 && v10 != 1936092532)
  {
    if (v10 != 1935762292)
    {
      uint64_t v13 = 2003332927;
      goto LABEL_23;
    }
    if (a5 == 4)
    {
      int v16 = *(_DWORD *)a6 != 0;
      if (*(unsigned __int8 *)(DerivedStorage + 24) != v16)
      {
        *(unsigned char *)(DerivedStorage + 24) = v16;
        FigHALAudioPropertySendChanges();
      }
      goto LABEL_18;
    }
    uint64_t v13 = 561211770;
LABEL_22:
    APSLogErrorAt();
    goto LABEL_23;
  }
  if (a5 != 40)
  {
    uint64_t v13 = 561211770;
    goto LABEL_22;
  }
  long long v12 = a6[1];
  long long __s1 = *a6;
  long long v19 = v12;
  uint64_t v20 = *((void *)a6 + 4);
  if (!memcmp(&__s1, (const void *)(*(void *)(DerivedStorage + 32) + 16), 0x28uLL))
  {
LABEL_18:
    uint64_t v13 = 0;
    goto LABEL_23;
  }
  uint64_t v13 = FigHALAudioConfigChangeCreateRecord();
  if (v13)
  {
    APSLogErrorAt();
  }
  else
  {
    uint64_t v14 = v21;
    long long v15 = v19;
    *(_OWORD *)(v21 + 16) = __s1;
    *(_OWORD *)(v14 + 32) = v15;
    *(void *)(v14 + 48) = v20;
    FigHALAudioConfigChangeSendRequest();
    uint64_t v21 = 0;
  }
LABEL_23:
  FigHALAudioConfigChangeDisposeRecord();
  return v13;
}

uint64_t sub_7140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 == 1718579821)
  {
    uint64_t v6 = *(void *)(DerivedStorage + 32);
    long long v7 = *(_OWORD *)(a3 + 16);
    long long v8 = *(_OWORD *)(a3 + 32);
    *(void *)(v6 + 48) = *(void *)(a3 + 48);
    *(_OWORD *)(v6 + 16) = v7;
    *(_OWORD *)(v6 + 32) = v8;
    if (dword_18070 <= 40 && (dword_18070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    FigHALAudioPropertySendChanges();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = FigSignalErrorAt();
  }
  FigHALAudioConfigChangeDisposeRecord();
  return v9;
}

uint64_t sub_726C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (dword_18070 <= 40 && (dword_18070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (*(unsigned char *)(DerivedStorage + 24)) {
    *(void *)(*(void *)(DerivedStorage + 32) + 136) = 0;
  }
  return 0;
}

uint64_t sub_7318()
{
  if (dword_18070 <= 40 && (dword_18070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

uint64_t sub_73B4(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (dword_18070 <= 40 && (dword_18070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v8 = *(void *)(DerivedStorage + 32);
  if (*(unsigned char *)(v8 + 200))
  {
    if (a2 == 1919513701)
    {
      uint64_t result = 0;
      *(double *)(v8 + 136) = *(double *)(a4 + 144) + (double)a3;
    }
    else
    {
      APSLogErrorAt();
      return FigSignalErrorAt();
    }
  }
  else
  {
    APSLogErrorAt();
    return 1937010544;
  }
  return result;
}

uint64_t sub_7520(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(void *)(DerivedStorage + 32);
    long long v5 = *(_OWORD *)(v4 + 16);
    long long v6 = *(_OWORD *)(v4 + 32);
    *(void *)(a2 + 32) = *(void *)(v4 + 48);
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
  }
  if (dword_18070 <= 40 && (dword_18070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

uint64_t sub_75E4(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, const void *a6, void *a7)
{
  kdebug_trace();
  FigHALAudioStreamGetClassID();
  uint64_t v12 = CMDerivedObjectCreate();
  if (v12)
  {
    uint64_t v28 = v12;
LABEL_37:
    APSLogErrorAt();
    return v28;
  }
  uint64_t v13 = FigHALAudioObjectMapperAddMapping();
  if (v13)
  {
    uint64_t v28 = v13;
    goto LABEL_37;
  }
  if (a4)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListeners();
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v15 = DerivedStorage;
  *(_DWORD *)uint64_t DerivedStorage = 0;
  *(_DWORD *)(DerivedStorage + 16) = a3;
  *(void *)(DerivedStorage + 8) = a5;
  if (a4)
  {
    CFTypeRef v16 = CFRetain(a4);
    *(void *)(v15 + 24) = v16;
    uint64_t v17 = v15 + 32;
    if (v16)
    {
      APSGetFBOPropertyCMTime();
      *(_OWORD *)uint64_t v17 = v31;
      CMTimeEpoch epoch = v32;
      goto LABEL_10;
    }
  }
  else
  {
    *(void *)(DerivedStorage + 24) = 0;
    uint64_t v17 = DerivedStorage + 32;
  }
  *(_OWORD *)uint64_t v17 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
LABEL_10:
  *(void *)(v17 + 16) = epoch;
  *(void *)(v15 + 64) = CFRetain(a6);
  *(unsigned char *)(v15 + 56) = 1;
  CFAllocatorRef DefaultAirPlayMallocZoneCFAllocator = (const __CFAllocator *)APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator();
  uint64_t v20 = CFAllocatorAllocate(DefaultAirPlayMallocZoneCFAllocator, 2048, 0);
  *(void *)(v15 + 96) = v20;
  if (!v20)
  {
    APSLogErrorAt();
    return 4294954510;
  }
  bzero(v20, 0x800uLL);
  char IntWithDefault = APSSettingsGetIntWithDefault();
  *(unsigned char *)(v15 + 80) = IntWithDefault;
  *(unsigned char *)(v15 + 81) = 0;
  if (IntWithDefault)
  {
    uint64_t v22 = CM8021ASClockCreate();
    if (v22)
    {
      uint64_t v28 = v22;
      goto LABEL_37;
    }
  }
  if ((unint64_t)CFDataGetLength(*(CFDataRef *)(*(void *)(v15 + 64) + 56)) >= 0x38)
  {
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(v15 + 64) + 56));
    uint64_t v24 = *(void *)(v15 + 64);
    long long v25 = *(_OWORD *)BytePtr;
    long long v26 = *((_OWORD *)BytePtr + 1);
    *(void *)(v24 + 48) = *((void *)BytePtr + 4);
    *(_OWORD *)(v24 + 16) = v25;
    *(_OWORD *)(v24 + 32) = v26;
    *(void *)(*(void *)(v15 + 64) + 16) = *((void *)BytePtr + 5);
    if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_18;
  }
  APSLogErrorAt();
  uint64_t v30 = FigSignalErrorAt();
  if (v30)
  {
    uint64_t v28 = v30;
    goto LABEL_37;
  }
LABEL_18:
  if (APSSettingsGetIntWithDefault())
  {
    int v27 = IsAppleInternalBuild();
    *(unsigned char *)(v15 + 72) = v27 != 0;
    if (v27)
    {
      uint64_t v28 = APRealTimeAudioFileWriterCreate();
      if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
  }
  else
  {
    uint64_t v28 = 0;
    *(unsigned char *)(v15 + 72) = 0;
  }
  APSAsyncLoggerGetSharedLogger();
  *a7 = 0;
  if (dword_180E0 <= 40 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v28;
}

void sub_7A44()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  kdebug_trace();
  if (*(void *)(DerivedStorage + 24))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListeners();
    uint64_t v1 = *(const void **)(DerivedStorage + 24);
    if (v1)
    {
      CFRelease(v1);
      *(void *)(DerivedStorage + 24) = 0;
    }
  }
  int v2 = *(CFTypeRef **)(DerivedStorage + 64);
  if (*(unsigned char *)(DerivedStorage + 72))
  {
    APRealTimeAudioFileWriterInvalidate();
    int v2 = *(CFTypeRef **)(DerivedStorage + 64);
    if (v2[10])
    {
      CFRelease(v2[10]);
      int v2 = *(CFTypeRef **)(DerivedStorage + 64);
      v2[10] = 0;
    }
    goto LABEL_8;
  }
  if (v2)
  {
LABEL_8:
    CFRelease(v2);
    *(void *)(DerivedStorage + 64) = 0;
  }
  if (*(unsigned char *)(DerivedStorage + 80))
  {
    int v3 = *(const void **)(DerivedStorage + 88);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(DerivedStorage + 88) = 0;
    }
  }
  *(_WORD *)(DerivedStorage + 80) = 0;
  if (*(void *)(DerivedStorage + 96))
  {
    CFAllocatorRef DefaultAirPlayMallocZoneCFAllocator = (const __CFAllocator *)APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator();
    CFAllocatorDeallocate(DefaultAirPlayMallocZoneCFAllocator, *(void **)(DerivedStorage + 96));
  }
  if (*(void *)(DerivedStorage + 104))
  {
    APSAudioStats_TerminateSession();
    if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v5 = *(const void **)(DerivedStorage + 104);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(DerivedStorage + 104) = 0;
    }
  }
}

CFStringRef sub_7BB0()
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage();
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"APHALAudioStream ID %d Owner %d AudioEngine %p AudioSource %p", *DerivedStorage, DerivedStorage[4], *((void *)DerivedStorage + 3), *(void *)(*((void *)DerivedStorage + 8) + 128));
}

uint64_t sub_7C0C(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a4)
  {
    uint64_t v7 = DerivedStorage;
    if (CFEqual(a2, kFigHALAudioStreamProperty_SupportedPCMFormats))
    {
      uint64_t v8 = *(const void **)(*(void *)(v7 + 64) + 56);
      if (v8) {
        CFTypeRef v9 = CFRetain(v8);
      }
      else {
        CFTypeRef v9 = 0;
      }
      uint64_t result = 0;
      *a4 = v9;
    }
    else
    {
      return 4294954509;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294954516;
  }
  return result;
}

uint64_t sub_7CA8()
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage();
}

uint64_t sub_7CC4(uint64_t a1, int *a2)
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

BOOL sub_7DB4(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_7DE8(uint64_t a1, int *a2)
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
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 64) + 56)) / 0x38uLL);
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
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 64) + 56)) / 0x38uLL);
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

uint64_t sub_7F38(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v12 = *a2;
  uint64_t result = 2003332927;
  if (*a2 <= 1935894637)
  {
    if (v12 <= 1885762591)
    {
      if (v12 != 1650682995)
      {
        if (v12 != 1668047219)
        {
          if (v12 != 1819569763) {
            return result;
          }
          int32_t v14 = (int)*(double *)(*(void *)(DerivedStorage + 64) + 16);
          CMTime v22 = *(CMTime *)(DerivedStorage + 32);
          CMTimeConvertScale(&v23, &v22, v14, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          if ((v23.flags & 0x1D) == 1)
          {
            int value = v23.value;
          }
          else
          {
            if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            int value = kCMTimeZero.value;
          }
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0;
            *a7 = value;
            return result;
          }
          return 561211770;
        }
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v16 = 1634956402;
          goto LABEL_37;
        }
        return 561211770;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t result = 0;
      int v16 = 1634689642;
LABEL_37:
      *a7 = v16;
      return result;
    }
    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return result;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        uint64_t result = 0;
        int v16 = *(unsigned __int8 *)(DerivedStorage + 56);
        goto LABEL_37;
      }
LABEL_23:
      size_t v17 = 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 64) + 56)) / 0x38uLL);
      *a6 = v17;
      if (v17 <= a5)
      {
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 64) + 56));
        memcpy(a7, BytePtr, v17);
        return 0;
      }
      return 561211770;
    }
LABEL_25:
    *a6 = 40;
    if (a5 >= 0x28)
    {
      uint64_t result = 0;
      uint64_t v19 = *(void *)(DerivedStorage + 64);
      long long v20 = *(_OWORD *)(v19 + 16);
      long long v21 = *(_OWORD *)(v19 + 32);
      *((void *)a7 + 4) = *(void *)(v19 + 48);
      *(_OWORD *)a7 = v20;
      *((_OWORD *)a7 + 1) = v21;
      return result;
    }
    return 561211770;
  }
  if (v12 > 1936092531)
  {
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0;
          int v16 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_37;
        }
        return 561211770;
      }
      if (v12 != 1952805485) {
        return result;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t result = 0;
      int v16 = 1936747378;
      goto LABEL_37;
    }
    goto LABEL_25;
  }
  switch(v12)
  {
    case 1935894638:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0;
        int v16 = 1;
        goto LABEL_37;
      }
      return 561211770;
    case 1935960434:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0;
        *a7 = 0;
        return result;
      }
      return 561211770;
    case 1936092513:
      goto LABEL_23;
  }
  return result;
}

uint64_t sub_82B0(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, long long *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v23 = 0;
  if (dword_180E0 <= 40 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v10 = *a2;
  if (*a2 != 1885762592 && v10 != 1936092532)
  {
    if (v10 != 1935762292)
    {
      uint64_t v18 = 2003332927;
      goto LABEL_27;
    }
    if (a5 == 4)
    {
      int v17 = *(_DWORD *)a6 != 0;
      if (*(unsigned __int8 *)(DerivedStorage + 56) != v17)
      {
        *(unsigned char *)(DerivedStorage + 56) = v17;
        FigHALAudioPropertySendChanges();
      }
      goto LABEL_20;
    }
    uint64_t v18 = 561211770;
LABEL_24:
    APSLogErrorAt();
    goto LABEL_27;
  }
  if (a5 != 40)
  {
    uint64_t v18 = 561211770;
    goto LABEL_24;
  }
  long long v12 = a6[1];
  long long __s1 = *a6;
  long long v21 = v12;
  uint64_t v22 = *((void *)a6 + 4);
  if (!memcmp(&__s1, (const void *)(*(void *)(DerivedStorage + 64) + 16), 0x28uLL))
  {
LABEL_20:
    uint64_t v18 = 0;
    goto LABEL_27;
  }
  uint64_t v13 = FigHALAudioConfigChangeCreateRecord();
  if (v13)
  {
    uint64_t v18 = v13;
    APSLogErrorAt();
  }
  else
  {
    uint64_t v15 = v22;
    uint64_t v14 = v23;
    long long v16 = v21;
    *(_OWORD *)(v23 + 16) = __s1;
    *(_OWORD *)(v14 + 32) = v16;
    *(void *)(v14 + 48) = v15;
    if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    FigHALAudioConfigChangeSendRequest();
    uint64_t v18 = 0;
    uint64_t v23 = 0;
  }
LABEL_27:
  FigHALAudioConfigChangeDisposeRecord();
  return v18;
}

uint64_t sub_853C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(void *)(DerivedStorage + 24))
  {
    APSLogErrorAt();
    goto LABEL_10;
  }
  if (a2 == 1818326115)
  {
    memset(&v13, 0, sizeof(v13));
    APSGetFBOPropertyCMTime();
    if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize()))
    {
      CMTime time = *(CMTime *)(DerivedStorage + 32);
      CMTimeGetSeconds(&time);
      CMTime time = v13;
      CMTimeGetSeconds(&time);
      LogPrintF();
    }
    *(CMTime *)(DerivedStorage + 32) = v13;
    FigHALAudioPropertySendChanges();
    goto LABEL_20;
  }
  if (a2 != 1718579821)
  {
LABEL_10:
    uint64_t v9 = FigSignalErrorAt();
    goto LABEL_21;
  }
  uint64_t v6 = *(void *)(DerivedStorage + 64);
  long long v7 = *(_OWORD *)(a3 + 16);
  long long v8 = *(_OWORD *)(a3 + 32);
  *(void *)(v6 + 48) = *(void *)(a3 + 48);
  *(_OWORD *)(v6 + 16) = v7;
  *(_OWORD *)(v6 + 32) = v8;
  if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  FigHALAudioPropertySendChanges();
  if (!*(unsigned char *)(DerivedStorage + 72))
  {
LABEL_20:
    uint64_t v9 = 0;
    goto LABEL_21;
  }
  APRealTimeAudioFileWriterInvalidate();
  int v10 = *(const void **)(*(void *)(DerivedStorage + 64) + 80);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(*(void *)(DerivedStorage + 64) + 80) = 0;
  }
  uint64_t v9 = APRealTimeAudioFileWriterCreate();
  if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_21:
  FigHALAudioConfigChangeDisposeRecord();
  return v9;
}

uint64_t sub_882C()
{
  unsigned int v3 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  kdebug_trace();
  if (*(void *)(DerivedStorage + 24))
  {
    if (dword_180E0 <= 40 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (*(unsigned char *)(DerivedStorage + 56))
    {
      *(void *)(*(void *)(DerivedStorage + 64) + 136) = 0;
      if (IsAppleInternalBuild())
      {
        if (FigGetCFPreferenceNumberWithDefault())
        {
          uint64_t v1 = (const void *)CFStringCreateF();
          unsigned int v3 = APSAudioStatsCreate();
          if (v3) {
            APSLogErrorAt();
          }
          else {
            CFRelease(v1);
          }
        }
      }
    }
  }
  else
  {
    APSLogErrorAt();
    unsigned int v3 = FigSignalErrorAt();
  }
  kdebug_trace();
  return v3;
}

uint64_t sub_89F0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  kdebug_trace();
  if (dword_180E0 <= 40 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (*(void *)(DerivedStorage + 104))
  {
    APSAudioStats_TerminateSession();
    if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v1 = *(const void **)(DerivedStorage + 104);
    if (v1)
    {
      CFRelease(v1);
      *(void *)(DerivedStorage + 104) = 0;
    }
  }
  kdebug_trace();
  return 0;
}

uint64_t sub_8B48(CMTimeValue a1, int a2, unsigned int a3, uint64_t a4, void *a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  long long v79 = *(_OWORD *)&kCMTimeInvalid.value;
  *(_OWORD *)&v80.int value = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  v80.CMTimeEpoch epoch = epoch;
  kdebug_trace();
  if (dword_180E0 <= 40 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v12 = *(void *)(DerivedStorage + 64);
  if (!*(unsigned char *)(v12 + 200))
  {
    APSLogErrorAt();
    uint64_t v35 = 1937010544;
    goto LABEL_48;
  }
  if (a2 != 1919513701 || !*(void *)(DerivedStorage + 24))
  {
    APSLogErrorAt();
    uint64_t v35 = FigSignalErrorAt();
    goto LABEL_48;
  }
  if (!*(unsigned char *)(DerivedStorage + 56))
  {
    uint64_t v35 = 0;
LABEL_48:
    kdebug_trace();
    return v35;
  }
  if (*(void *)(DerivedStorage + 104))
  {
    APSAudioStats_ProcessAudioBuffer();
    uint64_t v12 = *(void *)(DerivedStorage + 64);
  }
  if (*(void *)(v12 + 80))
  {
    uint64_t v84 = 0;
    v83.int value = a1;
    *(void *)&v83.timescale = 0;
    v83.timescale = *(_DWORD *)(v12 + 160) * a3;
    v83.CMTimeEpoch epoch = *(void *)(a4 + 144);
    APSAsyncLoggerGetSharedLogger();
    APSAsyncLoggerLogMessage();
    APRealTimeAudioFileWriterWriteAudioBytes();
  }
  uint64_t v13 = CMBaseObjectGetDerivedStorage();
  if (*(double *)(*(void *)(v13 + 64) + 136) == 0.0) {
    goto LABEL_45;
  }
  uint64_t v14 = v13;
  double v15 = *(double *)(a4 + 144);
  uint64_t v16 = CMBaseObjectGetDerivedStorage();
  memset(&v85, 0, sizeof(v85));
  memset(time, 0, sizeof(time));
  uint64_t v17 = *(void *)(v16 + 64);
  double v18 = v15 - *(double *)(v17 + 136);
  if (v18 == 0.0) {
    goto LABEL_45;
  }
  uint64_t v19 = v16;
  atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 144), 1uLL, memory_order_relaxed);
  v83.int value = a1;
  uint64_t v20 = *(void *)(v16 + 64);
  *(double *)&v83.timescale = v18 / *(double *)(v20 + 16) * 1000.0;
  *(double *)&v83.CMTimeEpoch epoch = v15;
  uint64_t v84 = *(void *)(v20 + 136);
  APSAsyncLoggerGetSharedLogger();
  APSAsyncLoggerLogMessage();
  if (*(void *)(*(void *)(v19 + 64) + 72))
  {
    if ((unint64_t)APSRingBufferGetBytesUsed() >= 0x121)
    {
      APSRingBufferGetBytesUsed();
      if (APSRingBufferDequeueBytes()) {
        goto LABEL_23;
      }
    }
    uint64_t v21 = 12;
    do
    {
      if ((unint64_t)APSRingBufferGetBytesUsed() < 0x18) {
        break;
      }
      if (APSRingBufferDequeueBytes()) {
        goto LABEL_23;
      }
      *(void *)CMTime time = a1;
      *(CMTime *)&time[8] = v85;
      APSAsyncLoggerGetSharedLogger();
      APSAsyncLoggerLogMessage();
      --v21;
    }
    while (v21);
  }
  kdebug_trace();
LABEL_23:
  uint64_t v22 = *(void *)(v14 + 64);
  if (*(void *)(v22 + 64)) {
    goto LABEL_45;
  }
  double v23 = v18 / *(double *)(v22 + 16);
  if (v23 <= 0.0 || v23 >= 3.94)
  {
    if (v18 >= 0.0 || -v18 >= (double)a3)
    {
      unint64_t v34 = 0;
      *(unsigned char *)(v22 + 152) = 1;
    }
    else
    {
      unint64_t v34 = (unint64_t)-v18;
    }
    goto LABEL_46;
  }
  unsigned int v24 = v18;
  if (!v18)
  {
LABEL_45:
    unint64_t v34 = 0;
    goto LABEL_46;
  }
  CMTimeEpoch v76 = epoch;
  uint64_t v77 = a4;
  unsigned int v78 = a3;
  unint64_t v25 = (unint64_t)*(double *)(v22 + 136);
  while (1)
  {
    uint64_t v26 = *(void *)(v14 + 64);
    unsigned int v27 = *(_DWORD *)(v26 + 160);
    unsigned int v28 = v24 >= 0x800 / v27 ? 0x800 / v27 : v24;
    uint64_t v29 = *(void *)(v26 + 128);
    uint64_t v30 = *(void *)(v14 + 96);
    uint64_t v31 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v32 = v31 ? v31 : 0;
    CFDataRef v33 = *(unsigned int (**)(uint64_t, uint64_t, void, unint64_t))(v32 + 64);
    if (!v33 || v33(v29, v30, v28 * v27, v25)) {
      break;
    }
    v25 += v28;
    v24 -= v28;
    if (!v24)
    {
      unint64_t v34 = 0;
      goto LABEL_44;
    }
  }
  APSLogErrorAt();
  unint64_t v34 = 0;
  *(unsigned char *)(*(void *)(v14 + 64) + 152) = 1;
LABEL_44:
  a3 = v78;
  CMTimeEpoch epoch = v76;
  a4 = v77;
LABEL_46:
  if (*(void *)(*(void *)(DerivedStorage + 64) + 64))
  {
    FigHALAudioConduitDeviceHALSendAudio();
    uint64_t v35 = 0;
    *(double *)(*(void *)(DerivedStorage + 64) + 136) = *(double *)(a4 + 144) + (double)a3;
    goto LABEL_48;
  }
  uint64_t v37 = CMBaseObjectGetDerivedStorage();
  *(_OWORD *)&v83.int value = v79;
  v83.CMTimeEpoch epoch = epoch;
  v38 = (unsigned int *)(*(void *)(v37 + 64) + 152);
  __swp(v38, v38);
  if (v38)
  {
    uint64_t v39 = v37;
    CFAllocatorRef Default = (const __CFAllocator *)APSRealTimeAllocatorGetDefault();
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(Default, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v42 = Mutable;
      CMTimeMake(&v83, (uint64_t)*(double *)(a4 + 144), *(_DWORD *)(*(void *)(v39 + 64) + 164));
      CFAllocatorRef v43 = (const __CFAllocator *)APSRealTimeAllocatorGetDefault();
      *(CMTime *)CMTime time = v83;
      CFDictionaryRef v44 = CMTimeCopyAsDictionary((CMTime *)time, v43);
      if (v44)
      {
        CFDictionaryRef v45 = v44;
        CFDictionarySetValue(v42, kFigEndpointStreamAudioEngineFlushOption_AnchorTime, v44);
        CFDictionarySetValue(v42, kFigEndpointStreamAudioEngineFlushOption_TimelineReset, kCFBooleanTrue);
        uint64_t v46 = *(void *)(*(void *)(v39 + 64) + 128);
        uint64_t v47 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v47) {
          uint64_t v48 = v47;
        }
        else {
          uint64_t v48 = 0;
        }
        v49 = *(void (**)(uint64_t))(v48 + 128);
        if (v49) {
          v49(v46);
        }
        uint64_t v50 = *(void *)(v39 + 24);
        uint64_t v51 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v51) {
          uint64_t v52 = v51;
        }
        else {
          uint64_t v52 = 0;
        }
        v53 = *(void (**)(uint64_t, __CFDictionary *))(v52 + 32);
        if (v53) {
          v53(v50, v42);
        }
        CFRelease(v42);
        CFRelease(v45);
        unint64_t v34 = 0;
      }
      else
      {
        APSLogErrorAt();
        CFRelease(v42);
      }
    }
    else
    {
      APSLogErrorAt();
    }
  }
  uint64_t v54 = *(void *)(DerivedStorage + 64);
  if (*(double *)(v54 + 136) != 0.0)
  {
    CFDictionaryRef v57 = 0;
    goto LABEL_73;
  }
  CMTimeMake(&v80, (uint64_t)*(double *)(a4 + 144), *(_DWORD *)(v54 + 164));
  CFAllocatorRef v55 = (const __CFAllocator *)APSRealTimeAllocatorGetDefault();
  CMTime v83 = v80;
  CFDictionaryRef v56 = CMTimeCopyAsDictionary(&v83, v55);
  if (!v56)
  {
    APSLogErrorAt();
    uint64_t v35 = 4294954510;
    goto LABEL_48;
  }
  CFDictionaryRef v57 = v56;
  uint64_t CMBaseObject = FigEndpointStreamAudioEngineGetCMBaseObject();
  uint64_t v59 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v59) {
    uint64_t v60 = v59;
  }
  else {
    uint64_t v60 = 0;
  }
  v61 = *(uint64_t (**)(uint64_t, void, CFDictionaryRef))(v60 + 56);
  if (!v61)
  {
    uint64_t v35 = 4294954514;
LABEL_81:
    APSLogErrorAt();
    kdebug_trace();
LABEL_92:
    CFRelease(v57);
    return v35;
  }
  uint64_t v62 = v61(CMBaseObject, kAPAudioEngineProperty_AudioSourceFirstFrameAnchorTime, v57);
  if (v62)
  {
    uint64_t v35 = v62;
    goto LABEL_81;
  }
  uint64_t v54 = *(void *)(DerivedStorage + 64);
LABEL_73:
  double v63 = *(double *)(a4 + 144);
  *(double *)(v54 + 136) = v63 + (double)a3;
  unsigned int v64 = *(_DWORD *)(v54 + 160);
  unint64_t v65 = v64 * a3;
  if (*(unsigned char *)(DerivedStorage + 80))
  {
    uint64_t v66 = CMBaseObjectGetDerivedStorage();
    uint64_t v86 = 0;
    *(_OWORD *)CMTime time = *(_OWORD *)&kCMTimeZero.value;
    *(void *)&time[16] = kCMTimeZero.epoch;
    CMTime v85 = *(CMTime *)time;
    if (v65 >= 8)
    {
      uint64_t v67 = v66;
      if (!*(unsigned char *)(v66 + 81))
      {
        unint64_t v68 = v65 >> 3;
        v69 = a5;
        while (!*v69)
        {
          ++v69;
          if (!--v68) {
            goto LABEL_83;
          }
        }
        *(unsigned char *)(v66 + 81) = 1;
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime((CMTime *)time, HostTimeClock);
        CMTime v83 = *(CMTime *)time;
        CM8021ASClockGetClockTimeForHostTime();
        v83.int value = *(void *)(v67 + 88);
        CMTime v82 = *(CMTime *)time;
        *(void *)&v83.timescale = CMTimeGetSeconds(&v82);
        CMTime v82 = v85;
        v83.CMTimeEpoch epoch = CMTimeGetSeconds(&v82);
        uint64_t v84 = v86;
        APSAsyncLoggerGetSharedLogger();
        APSAsyncLoggerLogMessage();
      }
    }
LABEL_83:
    uint64_t v54 = *(void *)(DerivedStorage + 64);
    unsigned int v64 = *(_DWORD *)(v54 + 160);
  }
  unint64_t v71 = v34 * v64;
  if (v65 < v71)
  {
    APSLogErrorAt();
    uint64_t v35 = 4294960587;
  }
  else
  {
    uint64_t v72 = *(void *)(v54 + 128);
    uint64_t v73 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v73) {
      uint64_t v74 = v73;
    }
    else {
      uint64_t v74 = 0;
    }
    v75 = *(uint64_t (**)(uint64_t, char *, unint64_t, unint64_t))(v74 + 64);
    if (v75) {
      uint64_t v35 = v75(v72, (char *)a5 + v71, v65 - v71, v34 + (unint64_t)v63);
    }
    else {
      uint64_t v35 = 4294954514;
    }
  }
  kdebug_trace();
  if (v57) {
    goto LABEL_92;
  }
  return v35;
}

uint64_t sub_9658(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(void *)(DerivedStorage + 64);
    long long v5 = *(_OWORD *)(v4 + 16);
    long long v6 = *(_OWORD *)(v4 + 32);
    *(void *)(a2 + 32) = *(void *)(v4 + 48);
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
  }
  if (dword_180E0 <= 40 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

uint64_t sub_971C()
{
  if (dword_180E0 <= 40)
  {
    if (dword_180E0 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t sub_97BC()
{
  if (dword_180E0 <= 50)
  {
    if (dword_180E0 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t sub_9860()
{
  if (dword_180E0 <= 50)
  {
    if (dword_180E0 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t sub_9908()
{
  if (dword_180E0 <= 50)
  {
    if (dword_180E0 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t sub_99B0()
{
  if (dword_180E0 <= 50 && (dword_180E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (FigHALAudioConfigChangeCreateRecord()) {
    return APSLogErrorAt();
  }
  else {
    return FigHALAudioConfigChangeSendRequest();
  }
}

uint64_t *APHALPlugin_Create(uint64_t a1, const void *a2)
{
  if (APSIsRemoteHALPluginLoadingEnabled())
  {
    if (!FigServer_IsAirplayd()) {
      return 0;
    }
    off_18150 = 0;
  }
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  uint64_t v4 = &qword_182A8;
  qword_182A8 = FigHALPluginDriverGetInterface();
  if (FigHALAudioObjectMapperCreate()
    || FigHALAudioCreateBrokeredPluginObjectWithSpecialInstantiator())
  {
    APSLogErrorAt();
    return 0;
  }
  FigAtomicIncrement32();
  return v4;
}

uint64_t sub_9BD8(uint64_t a1, void *a2)
{
  LogSetAppID();
  sub_10B6C();
  uint64_t v3 = APGetEndpointManager();
  if (v3) {
    APSLogErrorAt();
  }
  else {
    *a2 = 0;
  }
  return v3;
}

uint64_t sub_9C64(const __CFAllocator *a1, float a2, uint64_t a3, CFDataRef *a4)
{
  *(float *)bytes = a2;
  BOOL v9 = a2 <= -144.0;
  CFDataRef v5 = CFDataCreate(a1, bytes, 8);
  if (v5)
  {
    CFDataRef v6 = v5;
    uint64_t result = 0;
    *a4 = v6;
  }
  else
  {
    APSLogErrorAt();
    return FigSignalErrorAt();
  }
  return result;
}

uint64_t sub_9CFC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, const void *a6, void *a7)
{
  FigHALAudioObjectGetClassID();
  uint64_t v12 = CMDerivedObjectCreate();
  if (v12)
  {
    uint64_t v17 = v12;
LABEL_17:
    APSLogErrorAt();
    return v17;
  }
  uint64_t v13 = FigHALAudioObjectMapperAddMapping();
  if (v13)
  {
    uint64_t v17 = v13;
    goto LABEL_17;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)uint64_t DerivedStorage = a3;
  *(_DWORD *)(DerivedStorage + 8) = 0;
  *(_DWORD *)(DerivedStorage + 12) = a4;
  if (a5) {
    CFTypeRef v15 = CFRetain(a5);
  }
  else {
    CFTypeRef v15 = 0;
  }
  *(void *)(DerivedStorage + 24) = v15;
  if (a6) {
    CFTypeRef v16 = CFRetain(a6);
  }
  else {
    CFTypeRef v16 = 0;
  }
  *(void *)(DerivedStorage + 16) = v16;
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  if (dword_18158 <= 50 && (dword_18158 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v17 = 0;
  *a7 = 0;
  return v17;
}

uint64_t sub_9EB4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BytePtr = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  uint64_t result = APSGetFBOPropertyDouble();
  float v4 = v3;
  if (dword_18158 <= 40)
  {
    if (dword_18158 != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*((_DWORD *)BytePtr + 1)) {
    BOOL v5 = v4 == -144.0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (dword_18158 <= 50)
    {
      if (dword_18158 != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  else
  {
    if (dword_18158 <= 50 && (dword_18158 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(float *)BytePtr = v4;
    FigHALAudioPropertySendChanges();
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterPostNotification();
  }
  return result;
}

uint64_t sub_A120(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, const void *a6, void *a7)
{
  FigHALAudioObjectGetClassID();
  uint64_t v12 = CMDerivedObjectCreate();
  if (v12)
  {
    uint64_t v17 = v12;
LABEL_17:
    APSLogErrorAt();
    return v17;
  }
  uint64_t v13 = FigHALAudioObjectMapperAddMapping();
  if (v13)
  {
    uint64_t v17 = v13;
    goto LABEL_17;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)uint64_t DerivedStorage = a3;
  *(_DWORD *)(DerivedStorage + 8) = 0;
  *(_DWORD *)(DerivedStorage + 12) = a4;
  if (a5) {
    CFTypeRef v15 = CFRetain(a5);
  }
  else {
    CFTypeRef v15 = 0;
  }
  *(void *)(DerivedStorage + 24) = v15;
  if (a6) {
    CFTypeRef v16 = CFRetain(a6);
  }
  else {
    CFTypeRef v16 = 0;
  }
  *(void *)(DerivedStorage + 16) = v16;
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  if (dword_18158 <= 50 && (dword_18158 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v17 = 0;
  *a7 = 0;
  return v17;
}

uint64_t sub_A308(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = (uint64_t)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  uint64_t v5 = result;
  if (dword_18158 <= 50)
  {
    if (dword_18158 != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*(_DWORD *)(v5 + 4) && *(float *)v5 > -30.0)
  {
    return sub_B564(a2, 0);
  }
  return result;
}

uint64_t sub_A414(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  uint64_t v4 = APSGetFBOPropertyInt64();
  if (dword_18158 <= 50 && (dword_18158 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return sub_B564(a2, v4 != 0);
}

void sub_A530()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)(DerivedStorage + 24))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 8);
    double v3 = v2 ? (void *)v2 : 0;
    if (*v3 >= 2uLL)
    {
      uint64_t v4 = (void (*)(uint64_t))v3[8];
      if (v4) {
        v4(CMBaseObject);
      }
    }
  }
  uint64_t v5 = *(const void **)(DerivedStorage + 16);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(DerivedStorage + 16) = 0;
  }
  CFDataRef v6 = *(const void **)(DerivedStorage + 24);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(DerivedStorage + 24) = 0;
  }
}

CFStringRef sub_A640()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  if (*((_DWORD *)BytePtr + 1)) {
    uint64_t v2 = " MUTED";
  }
  else {
    uint64_t v2 = (const char *)&unk_12A15;
  }
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"APAudioVolumeControl ID %d Owner %d VolumeDB %f%s", *(unsigned int *)(DerivedStorage + 8), *(unsigned int *)(DerivedStorage + 12), *(float *)BytePtr, v2);
}

uint64_t sub_A6C8()
{
  return *(unsigned int *)(CMBaseObjectGetDerivedStorage() + 8);
}

uint64_t sub_A6E4(uint64_t a1, int *a2)
{
  uint64_t result = 0;
  int v3 = *a2;
  if (*a2 <= 1818453105)
  {
    if (v3 > 1668047218)
    {
      BOOL v8 = v3 == 1668047219;
      int v9 = 1668506480;
    }
    else
    {
      BOOL v8 = v3 == 1650682995;
      int v9 = 1667591277;
    }
    goto LABEL_16;
  }
  if (v3 > 1818456931)
  {
    BOOL v8 = v3 == 1818456932 || v3 == 1937007734;
    int v9 = 1818456950;
LABEL_16:
    if (v8 || v3 == v9) {
      return 1;
    }
    return result;
  }
  unsigned int v4 = v3 - 1818453106;
  BOOL v5 = v4 > 4;
  int v6 = (1 << v4) & 0x13;
  if (!v5 && v6 != 0) {
    return 1;
  }
  return result;
}

BOOL sub_A7A8(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1818456950 || *a2 == 1818453110;
}

uint64_t sub_A7C8(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 > 1818453106)
  {
    if (v2 <= 1818456931)
    {
      if (v2 != 1818453107 && v2 != 1818453110) {
        return 0;
      }
      return 4;
    }
    if (v2 == 1818456932 || v2 == 1818456950) {
      return 4;
    }
    int v6 = 1937007734;
LABEL_18:
    if (v2 == v6) {
      return 4;
    }
    else {
      return 0;
    }
  }
  if (v2 <= 1668047218)
  {
    if (v2 == 1650682995) {
      return 4;
    }
    int v6 = 1667591277;
    goto LABEL_18;
  }
  if (v2 == 1668047219) {
    return 4;
  }
  if (v2 == 1818453106) {
    unsigned int v3 = 16;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v2 == 1668506480) {
    return 4;
  }
  else {
    return v3;
  }
}

uint64_t sub_A8B4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  int v13 = *a2;
  if (*a2 <= 1818453106)
  {
    if (v13 <= 1668047218)
    {
      if (v13 != 1650682995)
      {
        if (v13 == 1667591277)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            unsigned int v14 = 0;
            *a7 = 0;
            return v14;
          }
          return 561211770;
        }
        return 2003332927;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      unsigned int v14 = 0;
      int v15 = 1818588780;
    }
    else
    {
      switch(v13)
      {
        case 1668047219:
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          unsigned int v14 = 0;
          int v15 = 1986817381;
          break;
        case 1668506480:
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          unsigned int v14 = 0;
          int v15 = 1869968496;
          break;
        case 1818453106:
          *a6 = 16;
          if (a5 >= 0x10)
          {
            unsigned int v14 = 0;
            *(_OWORD *)a7 = xmmword_114D0;
            return v14;
          }
          return 561211770;
        default:
          return 2003332927;
      }
    }
LABEL_34:
    *a7 = v15;
    return v14;
  }
  if (v13 <= 1818456931)
  {
    if (v13 != 1818453107)
    {
      if (v13 != 1818453110) {
        return 2003332927;
      }
      if (*((_DWORD *)BytePtr + 1))
      {
        float v16 = -144.0;
      }
      else
      {
        APSGetFBOPropertyDouble();
        float v16 = v18;
      }
      *a6 = 4;
      if (a5 < 4)
      {
        unsigned int v20 = 561211770;
        goto LABEL_47;
      }
      goto LABEL_45;
    }
    if (a5 != 4)
    {
      unsigned int v20 = 561211770;
      goto LABEL_47;
    }
    unsigned int v20 = 0;
    APSVolumeConvertDBToSliderValue();
  }
  else
  {
    if (v13 != 1818456932)
    {
      if (v13 != 1818456950)
      {
        if (v13 != 1937007734) {
          return 2003332927;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        unsigned int v14 = 0;
        int v15 = *(_DWORD *)(DerivedStorage + 12);
        goto LABEL_34;
      }
      float v16 = 0.0;
      if (!*((_DWORD *)BytePtr + 1))
      {
        APSGetFBOPropertyDouble();
        APSVolumeConvertDBToSliderValue();
      }
      *a6 = 4;
      if (a5 < 4)
      {
        unsigned int v20 = 561211770;
LABEL_47:
        APSLogErrorAt();
        return v20;
      }
LABEL_45:
      *(float *)a7 = v16;
      return 0;
    }
    if (a5 != 4)
    {
      unsigned int v20 = 561211770;
      goto LABEL_47;
    }
    unsigned int v20 = 0;
    APSVolumeConvertSliderValueToDB();
  }
  *a6 = 4;
  *a7 = v17;
  return v20;
}

uint64_t sub_AC4C(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, _DWORD *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BytePtr = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  uint64_t v11 = BytePtr;
  if (*a2 == 1818453110)
  {
    if (a5 == 4)
    {
      *(_DWORD *)BytePtr = *a6;
      if (dword_18158 <= 50 && (dword_18158 != -1 || _LogCategory_Initialize())) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
    uint64_t v13 = 561211770;
LABEL_14:
    APSLogErrorAt();
    return v13;
  }
  if (*a2 != 1818456950) {
    return 2003332927;
  }
  if (a5 != 4)
  {
    uint64_t v13 = 561211770;
    goto LABEL_14;
  }
  APSVolumeConvertSliderValueToDB();
  *(_DWORD *)uint64_t v11 = v12;
  if (dword_18158 <= 50 && (dword_18158 != -1 || _LogCategory_Initialize())) {
LABEL_10:
  }
    LogPrintF();
LABEL_18:
  if (*((_DWORD *)v11 + 1)) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = APSSetFBOPropertyDouble();
  }
  FigHALAudioPropertySendChanges();
  return v13;
}

void sub_AEB4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (dword_18158 <= 50 && (dword_18158 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (*(void *)(DerivedStorage + 16))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    int v2 = *(void **)(CMBaseObjectGetVTable() + 8);
    if (v2) {
      unsigned int v3 = v2;
    }
    else {
      unsigned int v3 = 0;
    }
    if (*v3 >= 2uLL)
    {
      unsigned int v4 = (void (*)(uint64_t))v3[8];
      if (v4) {
        v4(CMBaseObject);
      }
    }
    BOOL v5 = *(const void **)(DerivedStorage + 16);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(DerivedStorage + 16) = 0;
    }
  }
  int v6 = *(const void **)(DerivedStorage + 24);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(DerivedStorage + 24) = 0;
  }
}

CFStringRef sub_B050()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*((_DWORD *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16)) + 1)) {
    uint64_t v1 = (const char *)&unk_12A15;
  }
  else {
    uint64_t v1 = "Not ";
  }
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"APAudioMuteControl ID %d Owner %d %sMuted", *(unsigned int *)(DerivedStorage + 8), *(unsigned int *)(DerivedStorage + 12), v1);
}

uint64_t sub_B0CC(uint64_t a1, int *a2)
{
  uint64_t result = 0;
  int v3 = *a2;
  if (*a2 > 1668047218)
  {
    BOOL v4 = v3 == 1668047219 || v3 == 1937007734;
    int v5 = 1668506480;
  }
  else
  {
    BOOL v4 = v3 == 1650682995 || v3 == 1650685548;
    int v5 = 1667591277;
  }
  if (v4 || v3 == v5) {
    return 1;
  }
  return result;
}

BOOL sub_B138(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1650685548;
}

uint64_t sub_B150(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 > 1668047218)
  {
    if (v2 != 1937007734 && v2 != 1668506480 && v2 != 1668047219) {
      return 0;
    }
    return 4;
  }
  if (v2 == 1650682995) {
    return 4;
  }
  if (v2 == 1667591277) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v2 == 1650685548) {
    return 4;
  }
  else {
    return v3;
  }
}

uint64_t sub_B1E0(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v12 = *a2;
  uint64_t result = 2003332927;
  if (*a2 > 1668047218)
  {
    if (v12 == 1668047219)
    {
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 1836414053;
        goto LABEL_21;
      }
      return 561211770;
    }
    if (v12 == 1668506480)
    {
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 1869968496;
        goto LABEL_21;
      }
      return 561211770;
    }
    if (v12 != 1937007734) {
      return result;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770;
    }
    int v15 = (const UInt8 *)(DerivedStorage + 12);
    goto LABEL_18;
  }
  if (v12 != 1650682995)
  {
    if (v12 != 1650685548)
    {
      if (v12 != 1667591277) {
        return result;
      }
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 0;
LABEL_21:
        uint64_t result = 0;
        *a7 = v14;
        return result;
      }
      return 561211770;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770;
    }
    int v15 = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16)) + 4;
LABEL_18:
    int v14 = *(_DWORD *)v15;
    goto LABEL_21;
  }
  *a6 = 4;
  if (a5 > 3)
  {
    int v14 = 1953458028;
    goto LABEL_21;
  }
  return 561211770;
}

uint64_t sub_B350(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, int *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  if (*a2 == 1650685548)
  {
    if (a5 == 4)
    {
      int v12 = *a6;
      if (v12 == *((_DWORD *)BytePtr + 1))
      {
LABEL_18:
        sub_B564(a1, v12);
        return 0;
      }
      if (dword_18158 <= 50 && (dword_18158 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v14 = *(void *)(DerivedStorage + 24);
      if (v12) {
        int v15 = &kCFBooleanTrue;
      }
      else {
        int v15 = &kCFBooleanFalse;
      }
      uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v16) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
      double v18 = *(uint64_t (**)(uint64_t, void, const CFBooleanRef))(v17 + 56);
      if (v18)
      {
        uint64_t v19 = v18(v14, kAPEndpointProperty_IsHALMuted, *v15);
        if (!v19) {
          goto LABEL_18;
        }
        uint64_t v13 = v19;
      }
      else
      {
        uint64_t v13 = 4294954514;
      }
    }
    else
    {
      uint64_t v13 = 561211770;
    }
    APSLogErrorAt();
    return v13;
  }
  return 2003332927;
}

uint64_t sub_B564(uint64_t a1, int a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = (uint64_t)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  uint64_t v5 = result;
  if (dword_18158 <= 50)
  {
    if (dword_18158 != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*(_DWORD *)(v5 + 4) != a2)
  {
    *(_DWORD *)(v5 + 4) = a2;
    return FigHALAudioPropertySendOneChange();
  }
  return result;
}

uint64_t sub_B690(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5, CFDictionaryRef theDict, CFTypeRef *a7)
{
  CFTypeRef v69 = 0;
  int v68 = 0;
  CFTypeRef v67 = 0;
  if (!theDict)
  {
    APSLogErrorAt();
    uint64_t v22 = 4294950576;
    goto LABEL_70;
  }
  cf[0] = 0;
  CFTypeRef v71 = 0;
  CFTypeRef v72 = 0;
  CFTypeRef v70 = 0;
  uint64_t v13 = (const void *)kFigHALAudioConduitDeviceBrokeredDeviceCreationOption_Conduit;
  Value = CFDictionaryGetValue(theDict, kFigHALAudioConduitDeviceBrokeredDeviceCreationOption_Conduit);
  if (!Value)
  {
    if (a5)
    {
      CFTypeRef v19 = CFRetain(a5);
      if (a4)
      {
LABEL_11:
        CFTypeRef v20 = CFRetain(a4);
LABEL_14:
        CFDictionaryRef MutableCopy = (const __CFDictionary *)CFRetain(theDict);
        uint64_t v22 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      CFTypeRef v19 = 0;
      if (a4) {
        goto LABEL_11;
      }
    }
    CFTypeRef v20 = 0;
    goto LABEL_14;
  }
  uint64_t v15 = (uint64_t)Value;
  uint64_t v16 = sub_C588((uint64_t)Value, kFigHALAudioConduitDeviceProperty_DeviceUID, (uint64_t)"Default DeviceUID", (uint64_t *)&v71);
  if (v16)
  {
    uint64_t v22 = v16;
LABEL_133:
    APSLogErrorAt();
    CFTypeRef v20 = 0;
    CFTypeRef v19 = 0;
    CFDictionaryRef MutableCopy = 0;
    goto LABEL_15;
  }
  uint64_t v17 = sub_C588(v15, kFigHALAudioConduitDeviceProperty_ModelUID, (uint64_t)"Default ModelUID", (uint64_t *)&v70);
  if (v17)
  {
    uint64_t v22 = v17;
    goto LABEL_133;
  }
  uint64_t v18 = sub_C588(v15, kFigHALAudioConduitDeviceProperty_DeviceName, (uint64_t)"Default DeviceName", (uint64_t *)&v72);
  if (v18)
  {
    uint64_t v22 = v18;
    goto LABEL_133;
  }
  if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v23 = APEndpointStreamAudioAVCCreate();
  if (v23)
  {
    uint64_t v22 = v23;
    goto LABEL_133;
  }
  CFDictionaryRef MutableCopy = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  if (!MutableCopy)
  {
    APSLogErrorAt();
    CFTypeRef v20 = 0;
    CFTypeRef v19 = 0;
    uint64_t v22 = 4294960568;
LABEL_15:
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    goto LABEL_21;
  }
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  CFTypeRef v20 = 0;
  uint64_t v22 = 0;
  CFTypeRef v19 = cf[0];
  cf[0] = 0;
LABEL_21:
  if (v71) {
    CFRelease(v71);
  }
  if (v70) {
    CFRelease(v70);
  }
  if (v72) {
    CFRelease(v72);
  }
  if (v22) {
    goto LABEL_60;
  }
  FigHALAudioDeviceGetClassID();
  uint64_t v24 = CMDerivedObjectCreate();
  if (v24)
  {
    uint64_t v22 = v24;
    goto LABEL_60;
  }
  uint64_t v25 = FigHALAudioObjectMapperAddMapping();
  if (v25)
  {
    uint64_t v22 = v25;
    goto LABEL_60;
  }
  uint64_t v65 = a1;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)(DerivedStorage + 8) = a3;
  *(void *)(DerivedStorage + 16) = a2;
  *(_DWORD *)uint64_t DerivedStorage = v68;
  if (v20) {
    CFTypeRef v27 = CFRetain(v20);
  }
  else {
    CFTypeRef v27 = 0;
  }
  *(void *)(DerivedStorage + 96) = v27;
  if (v19) {
    CFTypeRef v28 = CFRetain(v19);
  }
  else {
    CFTypeRef v28 = 0;
  }
  *(void *)(DerivedStorage + 104) = v28;
  *(unsigned char *)(DerivedStorage + 88) = 0;
  if (qword_182C8 != -1) {
    dispatch_once(&qword_182C8, &stru_14C30);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    *(void *)(Instance + 144) = 0;
    *(unsigned char *)(Instance + 152) = 0;
    *(void *)(DerivedStorage + 120) = Instance;
  }
  else
  {
    APSLogErrorAt();
    uint64_t v63 = FigSignalErrorAt();
    if (v63)
    {
      uint64_t v22 = v63;
      goto LABEL_60;
    }
  }
  SNPrintF();
  dispatch_queue_t v30 = dispatch_queue_create((const char *)cf, 0);
  *(void *)(DerivedStorage + 160) = v30;
  if (!v30) {
    goto LABEL_135;
  }
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  unint64_t v34 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(v33 + 48);
  if (!v34)
  {
    uint64_t v22 = 4294954514;
LABEL_60:
    APSLogErrorAt();
LABEL_61:
    CFDictionaryRef v44 = 0;
    goto LABEL_62;
  }
  unsigned int v64 = a7;
  uint64_t v35 = v34(CMBaseObject, kFigEndpointStreamProperty_ID, kCFAllocatorDefault, DerivedStorage + 24);
  if (v35)
  {
    uint64_t v22 = v35;
    goto LABEL_60;
  }
  if (!*(void *)(DerivedStorage + 24))
  {
LABEL_135:
    APSLogErrorAt();
    uint64_t v22 = FigSignalErrorAt();
    goto LABEL_61;
  }
  uint64_t v36 = *(void *)(DerivedStorage + 120);
  uint64_t v37 = FigEndpointStreamGetCMBaseObject();
  uint64_t v38 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v38) {
    uint64_t v39 = v38;
  }
  else {
    uint64_t v39 = 0;
  }
  v40 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(v39 + 48);
  if (!v40)
  {
    uint64_t v22 = 4294954514;
    goto LABEL_60;
  }
  uint64_t v41 = v40(v37, kFigEndpointStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, v36 + 56);
  if (v41)
  {
    uint64_t v22 = v41;
    goto LABEL_60;
  }
  v42 = CFDictionaryGetValue(theDict, v13);
  *(void *)(*(void *)(DerivedStorage + 120) + 64) = v42;
  if (v42) {
    CFRetain(v42);
  }
  uint64_t v43 = sub_C37C((uint64_t)v19, kFigEndpointStreamProperty_AudioEngineClone, (uint64_t)kCFAllocatorDefault, DerivedStorage + 112);
  if (v43)
  {
    uint64_t v22 = v43;
    goto LABEL_60;
  }
  if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v46 = APSRealTimeWritableCreate();
  if (v46)
  {
    uint64_t v22 = v46;
    goto LABEL_60;
  }
  uint64_t v47 = CFDictionaryGetValue(MutableCopy, kAPHALAudioDeviceCreationOption_AudioDeviceType);
  if (!v47 || (CFTypeRef v48 = CFRetain(v47)) == 0)
  {
    APSLogErrorAt();
    CFDictionaryRef v44 = 0;
    uint64_t v22 = 4294950576;
    goto LABEL_62;
  }
  CFDictionaryRef v44 = v48;
  v49 = CFDictionaryGetValue(MutableCopy, kAPHALAudioDeviceCreationOption_NetworkClockType);
  if (v49) {
    v49 = CFRetain(v49);
  }
  *(void *)(DerivedStorage + 72) = v49;
  uint64_t v50 = CFDictionaryGetValue(MutableCopy, kAPHALAudioDeviceCreationOption_EndpointName);
  if (v50) {
    uint64_t v50 = CFRetain(v50);
  }
  *(void *)(DerivedStorage + 32) = v50;
  uint64_t v51 = CFDictionaryGetValue(MutableCopy, kAPHALAudioDeviceCreationOption_ModelUID);
  if (v51) {
    uint64_t v51 = CFRetain(v51);
  }
  *(void *)(DerivedStorage + 40) = v51;
  if (FigCFDictionaryGetInt32IfPresent()) {
    *(_DWORD *)(DerivedStorage + 48) = 0;
  }
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetBooleanIfPresent();
  FigCFDictionaryGetFloatIfPresent();
  if ((int)-999.0 == -999 && dword_181C8 <= 60 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFDataRef v52 = *(const __CFData **)(*(void *)(DerivedStorage + 120) + 56);
  if (v52)
  {
    unint64_t Length = CFDataGetLength(v52);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 120) + 56));
    if (Length >= 0x38)
    {
      CFAllocatorRef v55 = BytePtr;
      uint64_t v56 = 0;
      do
      {
        if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        ++v56;
        v55 += 56;
      }
      while (Length / 0x38 != v56);
    }
  }
  int v57 = 1885433953;
  if (FigCFEqual()) {
    int v58 = 1668506482;
  }
  else {
    int v58 = 1634300528;
  }
  *(_DWORD *)(DerivedStorage + 80) = v58;
  if (FigCFEqual())
  {
    int v57 = 1885433975;
    uint64_t v59 = v64;
  }
  else
  {
    uint64_t v59 = v64;
    if (FigCFEqual())
    {
      int v57 = 1885433971;
    }
    else if (!FigCFEqual())
    {
      if (FigCFEqual())
      {
        int v57 = 1885433964;
      }
      else
      {
        if (!FigCFEqual()) {
          goto LABEL_114;
        }
        int v57 = 1885565807;
      }
    }
  }
  *(_DWORD *)(DerivedStorage + 84) = v57;
LABEL_114:
  uint64_t v60 = FigSimpleMutexCreate();
  *(void *)(DerivedStorage + 64) = v60;
  if (v60)
  {
    uint64_t v61 = sub_75E4(v65, a2, v68, *(const void **)(DerivedStorage + 112), a3, *(const void **)(DerivedStorage + 120), (void *)(DerivedStorage + 136));
    if (v61)
    {
      uint64_t v22 = v61;
    }
    else
    {
      uint64_t v62 = sub_C45C();
      if (!v62)
      {
        if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v22 = 0;
        *uint64_t v59 = v69;
        CFTypeRef v69 = 0;
        goto LABEL_62;
      }
      uint64_t v22 = v62;
    }
    APSLogErrorAt();
  }
  else
  {
    APSLogErrorAt();
    uint64_t v22 = 4294960568;
  }
LABEL_62:
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v44) {
    CFRelease(v44);
  }
LABEL_70:
  if (v67) {
    CFRelease(v67);
  }
  if (v69) {
    CFRelease(v69);
  }
  return v22;
}

uint64_t sub_C37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10) {
    return 4294954514;
  }

  return v10(CMBaseObject, a2, a3, a4);
}

uint64_t sub_C45C()
{
  CMBaseObjectGetDerivedStorage();
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v0 = FigNotificationCenterAddWeakListener();
  if (v0)
  {
    uint64_t v1 = v0;
    goto LABEL_7;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v1 = FigNotificationCenterAddWeakListener();
  if (v1)
  {
LABEL_7:
    APSLogErrorAt();
    return v1;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v2 = FigNotificationCenterAddWeakListener();
  if (v2)
  {
    uint64_t v4 = v2;
    APSLogErrorAt();
    return v4;
  }
  return v1;
}

uint64_t sub_C588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unsigned int v6 = FigHALAudioConduitDeviceCopyProperty();
  if (v6)
  {
    APSLogErrorAt();
    if (dword_181C8 <= 90 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *a4 = CFStringCreateF();
  }
  return v6;
}

void sub_C758()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  if (*(void *)(CMBaseObjectGetDerivedStorage() + 104))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
  }
  sub_C980();
  uint64_t v1 = (const void *)DerivedStorage[3];
  if (v1)
  {
    CFRelease(v1);
    DerivedStorage[3] = 0;
  }
  uint64_t v2 = (const void *)DerivedStorage[5];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[5] = 0;
  }
  unsigned int v3 = (const void *)DerivedStorage[4];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[4] = 0;
  }
  uint64_t v4 = (const void *)DerivedStorage[7];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[7] = 0;
  }
  uint64_t v5 = (const void *)DerivedStorage[12];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[12] = 0;
  }
  unsigned int v6 = (const void *)DerivedStorage[13];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[13] = 0;
  }
  long long v7 = (const void *)DerivedStorage[14];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[14] = 0;
  }
  uint64_t v8 = (const void *)DerivedStorage[17];
  if (v8)
  {
    CFRelease(v8);
    DerivedStorage[17] = 0;
  }
  uint64_t v9 = (const void *)DerivedStorage[18];
  if (v9)
  {
    CFRelease(v9);
    DerivedStorage[18] = 0;
  }
  int v10 = (const void *)DerivedStorage[19];
  if (v10)
  {
    CFRelease(v10);
    DerivedStorage[19] = 0;
  }
  uint64_t v11 = (const void *)DerivedStorage[22];
  if (v11)
  {
    CFRelease(v11);
    DerivedStorage[22] = 0;
  }
  int v12 = (const void *)DerivedStorage[9];
  if (v12)
  {
    CFRelease(v12);
    DerivedStorage[9] = 0;
  }
  uint64_t v13 = (const void *)DerivedStorage[16];
  if (v13)
  {
    CFRelease(v13);
    DerivedStorage[16] = 0;
  }
  FigSimpleMutexDestroy();
  uint64_t v14 = DerivedStorage[20];
  if (v14)
  {
    dispatch_release(v14);
    DerivedStorage[20] = 0;
  }
  uint64_t v15 = (CFTypeRef *)DerivedStorage[15];
  if (v15)
  {
    if (v15[8])
    {
      CFRelease(v15[8]);
      uint64_t v15 = (CFTypeRef *)DerivedStorage[15];
      v15[8] = 0;
    }
    CFRelease(v15);
    DerivedStorage[15] = 0;
  }
}

CFStringRef sub_C92C()
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage();
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"APHALAudioDevice ID %d UID %@ Endpoint %p EndpointStream %p", *DerivedStorage, *((void *)DerivedStorage + 3), *((void *)DerivedStorage + 12), *((void *)DerivedStorage + 13));
}

uint64_t sub_C980()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(int *)(DerivedStorage + 168) < 1) {
    return 0;
  }
  uint64_t v1 = (void *)DerivedStorage;
  *(_DWORD *)(DerivedStorage + 168) = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable) {
    CFDictionarySetInt64();
  }
  uint64_t v3 = FigEndpointStreamAudioEngineSuspendSync();
  uint64_t v4 = v3;
  if (v3)
  {
    if (v3 == -15486)
    {
      if (dword_181C8 <= 90 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v4 = 0;
    }
    else if (dword_181C8 <= 90 && (dword_181C8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  uint64_t v5 = v1[17];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t))(v7 + 40);
  if (v8) {
    v8(v5);
  }
  uint64_t v9 = *(const void **)(v1[15] + 128);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(v1[15] + 128) = 0;
  }
  int v10 = (const void *)v1[22];
  if (v10)
  {
    CFRelease(v10);
    v1[22] = 0;
  }
  uint64_t v11 = (const void *)v1[7];
  if (v11)
  {
    CFRelease(v11);
    v1[7] = 0;
  }
  uint64_t v12 = v1[15];
  uint64_t v13 = *(const void **)(v12 + 72);
  if (v13)
  {
    CFRelease(v13);
    uint64_t v12 = v1[15];
    *(void *)(v12 + 72) = 0;
  }
  *(unsigned char *)(v12 + 200) = 0;
  if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v4;
}

uint64_t sub_CC40()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMNotificationCenterGetDefaultLocalCenter();
  FigDispatchAsyncPostNotification();
  *(unsigned char *)(DerivedStorage + 172) = 1;
  uint64_t v1 = *(void *)(DerivedStorage + 136);
  if (v1)
  {
    uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v2) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void (**)(uint64_t))(v3 + 8);
    if (v4) {
      v4(v1);
    }
    FigHALAudioObjectMapperRemoveMapping();
  }

  return FigHALAudioObjectMapperRemoveMapping();
}

uint64_t sub_CD60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int valuePtr = 0;
  if (a5
    && (uint64_t v7 = DerivedStorage,
        (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a5, kAPEndpointStreamNotificationPayloadKey_DynamicLatencyOffsetMs)) != 0))
  {
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    FigSimpleMutexLock();
    if (*(void *)(v7 + 56)) {
      APSLatencyOffsetStepperSetTargetLatencyOffset();
    }
    return FigSimpleMutexUnlock();
  }
  else
  {
    return APSLogErrorAt();
  }
}

uint64_t sub_CE28()
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage();
}

BOOL sub_CE44(uint64_t a1, int *a2)
{
  BOOL result = 0;
  int v3 = *a2;
  if (*a2 > 1819107690)
  {
    if (v3 <= 1935763059)
    {
      if (v3 > 1853059618)
      {
        if (v3 > 1870098019)
        {
          if (v3 == 1870098020) {
            return 1;
          }
          int v4 = 1919512167;
        }
        else
        {
          if (v3 == 1853059619) {
            return 1;
          }
          int v4 = 1853059700;
        }
        goto LABEL_57;
      }
      if (v3 <= 1819569762)
      {
        if (v3 == 1819107691) {
          return 1;
        }
        int v4 = 1819173229;
        goto LABEL_57;
      }
      if (v3 != 1819569763)
      {
        int v4 = 1836411236;
        goto LABEL_57;
      }
      goto LABEL_43;
    }
    if (v3 > 1937009954)
    {
      if (v3 <= 1969841183)
      {
        if (v3 == 1937009955) {
          return 1;
        }
        int v4 = 1953653102;
        goto LABEL_57;
      }
      if (v3 != 1987012963)
      {
        int v4 = 1969841184;
        goto LABEL_57;
      }
      return sub_E6BC();
    }
    if (v3 > 1936879203)
    {
      if (v3 != 1936879204)
      {
        int v4 = 1937007734;
        goto LABEL_57;
      }
      goto LABEL_43;
    }
    if (v3 != 1935763060)
    {
      int v5 = 1936092276;
      goto LABEL_39;
    }
LABEL_43:
    int v6 = a2[1];
    return v6 == 1768845428 || v6 == 1869968496;
  }
  if (v3 > 1668575851)
  {
    if (v3 > 1718383986)
    {
      if (v3 > 1751737453)
      {
        if (v3 == 1751737454) {
          return 1;
        }
        int v4 = 1818850926;
        goto LABEL_57;
      }
      if (v3 != 1718383987)
      {
        int v4 = 1735354734;
        goto LABEL_57;
      }
      return sub_E59C();
    }
    if (v3 <= 1684236337)
    {
      if (v3 == 1668575852) {
        return 1;
      }
      int v4 = 1668641652;
      goto LABEL_57;
    }
    if (v3 != 1684236338)
    {
      int v5 = 1684434036;
LABEL_39:
      if (v3 != v5) {
        return result;
      }
      goto LABEL_43;
    }
    goto LABEL_43;
  }
  if (v3 <= 1651798131)
  {
    if (v3 <= 1634759531)
    {
      if (v3 != 1634429294)
      {
        int v4 = 1634758772;
        goto LABEL_57;
      }
      return 1;
    }
    if (v3 == 1634759532) {
      return 1;
    }
    int v4 = 1650682995;
LABEL_57:
    if (v3 != v4) {
      return result;
    }
    return 1;
  }
  if (v3 > 1668047218)
  {
    if (v3 == 1668047219) {
      return 1;
    }
    int v4 = 1668049764;
    goto LABEL_57;
  }
  if (v3 == 1651798132) {
    return 1;
  }
  if (v3 == 1667658618) {
    return sub_E7F0() != 0;
  }
  return result;
}

BOOL sub_D198(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1718383987 || v2 == 1987012963 || v2 == 1853059700;
}

uint64_t sub_D1DC(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  int v4 = *a2;
  if (*a2 > 1819107690)
  {
    if (v4 > 1935763059)
    {
      if (v4 > 1937009954)
      {
        if (v4 > 1969841183)
        {
          int v5 = 1969841184;
          unsigned int v6 = 8;
          int v7 = 1987012963;
          goto LABEL_61;
        }
        if (v4 == 1937009955)
        {
          int v23 = a2[1];
          BOOL v14 = v23 == 1869968496 || v23 == 1735159650;
          goto LABEL_56;
        }
        int v21 = 1953653102;
      }
      else
      {
        if (v4 <= 1936879203)
        {
          int v5 = 1935763060;
          unsigned int v6 = 4;
          int v7 = 1936092276;
          goto LABEL_61;
        }
        if (v4 == 1936879204) {
          return (20 * *(_DWORD *)(DerivedStorage[15] + 44) + 12);
        }
        int v21 = 1937007734;
      }
    }
    else
    {
      if (v4 <= 1853059618)
      {
        int v8 = 1819569762;
        if (v4 == 1836411236) {
          int v9 = 8;
        }
        else {
          int v9 = 0;
        }
        if (v4 == 1819569763) {
          unsigned int v10 = 4;
        }
        else {
          unsigned int v10 = v9;
        }
        int v11 = 1819107691;
        BOOL v12 = v4 == 1819173229;
        int v13 = 8;
        goto LABEL_33;
      }
      if (v4 <= 1870098019)
      {
        int v5 = 1853059619;
        unsigned int v6 = 32;
        BOOL v16 = v4 == 1853059700;
        unsigned int v17 = 8;
LABEL_62:
        if (!v16) {
          unsigned int v17 = 0;
        }
        if (v4 == v5) {
          return v6;
        }
        else {
          return v17;
        }
      }
      if (v4 == 1870098020)
      {
        int v24 = a2[1];
        if (v24 != 1869968496 && v24 != 1735159650) {
          return 0;
        }
        int v25 = DerivedStorage[18] != 0;
        if (DerivedStorage[19]) {
          ++v25;
        }
        return (4 * v25 + 4);
      }
      int v21 = 1919512167;
    }
LABEL_55:
    BOOL v14 = v4 == v21;
LABEL_56:
    unsigned int v15 = 4;
LABEL_57:
    if (v14) {
      return v15;
    }
    else {
      return 0;
    }
  }
  if (v4 <= 1668575851)
  {
    if (v4 <= 1651798131)
    {
      if (v4 <= 1634759531)
      {
        int v5 = 1634429294;
        unsigned int v6 = 4;
        int v7 = 1634758772;
LABEL_61:
        BOOL v16 = v4 == v7;
        unsigned int v17 = 4;
        goto LABEL_62;
      }
      if (v4 != 1634759532 && v4 != 1650682995) {
        return 0;
      }
      return 4;
    }
    if (v4 <= 1668047218)
    {
      int v5 = 1651798132;
      unsigned int v6 = 40;
      int v7 = 1667658618;
      goto LABEL_61;
    }
    if (v4 == 1668047219) {
      return 4;
    }
    int v21 = 1668049764;
    goto LABEL_55;
  }
  if (v4 > 1718383986)
  {
    int v8 = 1751737453;
    if (v4 == 1818850926) {
      int v18 = 4;
    }
    else {
      int v18 = 0;
    }
    if (v4 == 1751737454) {
      unsigned int v10 = 4;
    }
    else {
      unsigned int v10 = v18;
    }
    int v11 = 1718383987;
    BOOL v12 = v4 == 1735354734;
    int v13 = 4;
LABEL_33:
    if (!v12) {
      int v13 = 0;
    }
    if (v4 == v11) {
      unsigned int v19 = 8;
    }
    else {
      unsigned int v19 = v13;
    }
    if (v4 <= v8) {
      return v19;
    }
    else {
      return v10;
    }
  }
  if (v4 > 1684236337)
  {
    int v5 = 1684236338;
    unsigned int v6 = 8;
    int v7 = 1684434036;
    goto LABEL_61;
  }
  if (v4 != 1668575852)
  {
    BOOL v14 = v4 == 1668641652;
    unsigned int v15 = 60;
    goto LABEL_57;
  }
  int v22 = DerivedStorage[18] != 0;
  if (DerivedStorage[19]) {
    ++v22;
  }
  return (4 * v22);
}

uint64_t sub_D59C(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, uint64_t a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BOOL v12 = (void *)DerivedStorage;
  int v13 = *a2;
  if (*a2 > 1819107690)
  {
    if (v13 <= 1935763059)
    {
      if (v13 <= 1853059618)
      {
        if (v13 <= 1819569762)
        {
          if (v13 != 1819107691)
          {
            if (v13 != 1819173229) {
              return 2003332927;
            }
            BOOL v16 = *(const void **)(DerivedStorage + 32);
            if (!v16 || (CFTypeRef v17 = CFRetain(v16)) == 0) {
              CFTypeRef v17 = CFRetain(@"No Name Endpoint");
            }
            *a6 = 8;
            if (a5 < 8)
            {
              uint64_t v14 = 561211770;
            }
            else
            {
              uint64_t v14 = 0;
              *(void *)a7 = CFRetain(v17);
            }
            if (v17) {
              CFRelease(v17);
            }
            return v14;
          }
          *a6 = 8;
          if (a5 < 8) {
            return 561211770;
          }
          CFStringRef v19 = @"Apple, Inc.";
          goto LABEL_89;
        }
        if (v13 != 1819569763)
        {
          if (v13 != 1836411236) {
            return 2003332927;
          }
          CFStringRef v19 = *(const __CFString **)(DerivedStorage + 40);
          if (v19)
          {
            *a6 = 8;
            if (a5 < 8) {
              return 561211770;
            }
LABEL_89:
            CFStringRef v19 = (const __CFString *)CFRetain(v19);
LABEL_90:
            uint64_t v14 = 0;
            *(void *)a7 = v19;
            return v14;
          }
LABEL_82:
          *a6 = 8;
          if (a5 < 8) {
            return 561211770;
          }
          CFStringRef v19 = (const __CFString *)v12[3];
          if (!v19) {
            goto LABEL_90;
          }
          goto LABEL_89;
        }
LABEL_76:
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        uint64_t v14 = 0;
        *(_DWORD *)a7 = 0;
        return v14;
      }
      if (v13 <= 1870098019)
      {
        if (v13 == 1853059619)
        {
          uint64_t v14 = 0;
          *a6 = 0;
        }
        else
        {
          if (v13 != 1853059700) {
            return 2003332927;
          }
          *a6 = 8;
          if (a5 < 8) {
            return 561211770;
          }
          uint64_t v14 = 0;
          *(void *)a7 = *(void *)(*(void *)(DerivedStorage + 120) + 16);
        }
        return v14;
      }
      if (v13 != 1870098020)
      {
        if (v13 == 1919512167)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t v14 = 0;
            int v15 = 11025;
            goto LABEL_121;
          }
          return 561211770;
        }
        return 2003332927;
      }
      LODWORD(v37) = a5 >> 2;
      int v38 = a2[1];
      switch(v38)
      {
        case 1869968496:
          if (*(void *)(DerivedStorage + 144)) {
            unsigned int v42 = 2;
          }
          else {
            unsigned int v42 = 1;
          }
          if (*(void *)(DerivedStorage + 152)) {
            ++v42;
          }
          if (v37 >= v42) {
            unsigned int v40 = v42;
          }
          else {
            unsigned int v40 = a5 >> 2;
          }
          if (v40)
          {
            *(_DWORD *)a7 = sub_5ECC(*(void *)(DerivedStorage + 136));
            if (v40 != 1)
            {
              uint64_t v43 = v12[18];
              if (v43)
              {
                *(_DWORD *)(a7 + 4) = sub_5ECC(v43);
                uint64_t v44 = 2;
                LODWORD(v37) = 2;
                if (v40 < 3) {
                  goto LABEL_183;
                }
              }
              else
              {
                uint64_t v44 = 1;
              }
              uint64_t v46 = v12[19];
              if (v46) {
                *(_DWORD *)(a7 + 4 * v44) = sub_5ECC(v46);
              }
LABEL_182:
              LODWORD(v37) = v40;
              goto LABEL_183;
            }
            goto LABEL_162;
          }
          break;
        case 1768845428:
          if (a5 >= 4) {
            LODWORD(v37) = 0;
          }
          goto LABEL_183;
        case 1735159650:
          if (*(void *)(DerivedStorage + 144)) {
            unsigned int v39 = 2;
          }
          else {
            unsigned int v39 = 1;
          }
          if (*(void *)(DerivedStorage + 152)) {
            ++v39;
          }
          if (v37 >= v39) {
            unsigned int v40 = v39;
          }
          else {
            unsigned int v40 = a5 >> 2;
          }
          if (v40)
          {
            *(_DWORD *)a7 = sub_5ECC(*(void *)(DerivedStorage + 136));
            if (v40 != 1)
            {
              uint64_t v41 = v12[18];
              if (v41)
              {
                *(_DWORD *)(a7 + 4) = sub_5ECC(v41);
                uint64_t v37 = 2;
                if (v40 < 3) {
                  goto LABEL_183;
                }
              }
              else
              {
                uint64_t v37 = 1;
              }
              uint64_t v45 = v12[19];
              if (v45) {
                *(_DWORD *)(a7 + 4 * v37) = sub_5ECC(v45);
              }
              goto LABEL_182;
            }
LABEL_162:
            LODWORD(v37) = 1;
            goto LABEL_183;
          }
          break;
        default:
LABEL_183:
          uint64_t v14 = 0;
          int v33 = 4 * v37;
          goto LABEL_184;
      }
      LODWORD(v37) = 0;
      goto LABEL_183;
    }
    if (v13 <= 1937009954)
    {
      if (v13 > 1936879203)
      {
        if (v13 != 1936879204)
        {
          if (v13 == 1937007734)
          {
            *a6 = 4;
            if (a5 >= 4)
            {
              uint64_t v14 = 0;
              int v15 = 1;
              goto LABEL_121;
            }
            return 561211770;
          }
          return 2003332927;
        }
        int v34 = *(_DWORD *)(*(void *)(DerivedStorage + 120) + 44);
        unsigned int v35 = 20 * v34 + 12;
        if (v35 <= a5)
        {
          bzero((void *)a7, (20 * v34 + 12));
          if (v34 == 8)
          {
            *(void *)(a7 + 8) = 0x100000008;
            *(_DWORD *)(a7 + 32) = 2;
            *(_DWORD *)(a7 + 52) = 3;
            *(_DWORD *)(a7 + 72) = 4;
            *(_DWORD *)(a7 + 92) = 5;
            *(_DWORD *)(a7 + 112) = 6;
            *(_DWORD *)(a7 + 132) = 49;
            *(_DWORD *)(a7 + 152) = 51;
          }
          else
          {
            if (v34 == 1) {
              int v36 = 6553601;
            }
            else {
              int v36 = 6619138;
            }
            *(_DWORD *)a7 = v36;
          }
          uint64_t v14 = 0;
          *a6 = v35;
          return v14;
        }
        uint64_t v14 = 561211770;
LABEL_189:
        APSLogErrorAt();
        return v14;
      }
      if (v13 != 1935763060)
      {
        int v18 = 1936092276;
        goto LABEL_66;
      }
      goto LABEL_76;
    }
    if (v13 > 1969841183)
    {
      if (v13 != 1969841184)
      {
        if (v13 == 1987012963)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t v14 = 0;
            int v15 = *(unsigned __int8 *)(DerivedStorage + 88);
            goto LABEL_121;
          }
          return 561211770;
        }
        return 2003332927;
      }
      goto LABEL_82;
    }
    if (v13 != 1937009955)
    {
      if (v13 == 1953653102)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t v14 = 0;
          int v15 = *(_DWORD *)(DerivedStorage + 80);
          goto LABEL_121;
        }
        return 561211770;
      }
      return 2003332927;
    }
    int v31 = a2[1];
    if (v31 == 1869968496) {
      goto LABEL_109;
    }
    int v32 = a5 >> 2;
    if (v31 == 1768845428)
    {
      if (a5 >= 4) {
        int v32 = 0;
      }
      goto LABEL_151;
    }
    if (v31 == 1735159650)
    {
LABEL_109:
      if (a5 < 4)
      {
        int v32 = 0;
      }
      else
      {
        *(_DWORD *)a7 = sub_5ECC(*(void *)(DerivedStorage + 136));
        int v32 = 1;
      }
    }
LABEL_151:
    uint64_t v14 = 0;
    int v33 = 4 * v32;
    goto LABEL_184;
  }
  if (v13 <= 1668575851)
  {
    if (v13 <= 1651798131)
    {
      if (v13 > 1634759531)
      {
        if (v13 == 1634759532)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t v14 = 0;
            int v15 = *(_DWORD *)(DerivedStorage + 48);
            goto LABEL_121;
          }
          return 561211770;
        }
        if (v13 == 1650682995)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t v14 = 0;
            int v15 = 1634689642;
            goto LABEL_121;
          }
          return 561211770;
        }
      }
      else
      {
        if (v13 == 1634429294)
        {
          *a6 = 4;
          if (a5 < 4) {
            return 0;
          }
          uint64_t v14 = 0;
          int v15 = *(_DWORD *)DerivedStorage;
          goto LABEL_121;
        }
        if (v13 == 1634758772)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t v14 = 0;
            int v15 = *(_DWORD *)(DerivedStorage + 84);
LABEL_121:
            *(_DWORD *)a7 = v15;
            return v14;
          }
          return 561211770;
        }
      }
      return 2003332927;
    }
    if (v13 <= 1668047218)
    {
      if (v13 == 1651798132)
      {
        CMBaseObjectGetDerivedStorage();
        APSRealTimeWritableRead();
        *a6 = 40;
        if (a5 < 0x28) {
          return 561211770;
        }
        uint64_t v14 = 0;
        *(void *)a7 = 0;
        *(_OWORD *)(a7 + 8) = 0uLL;
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)(a7 + 24) = _Q0;
      }
      else
      {
        if (v13 != 1667658618) {
          return 2003332927;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        uint64_t v14 = 0;
        *(_DWORD *)a7 = sub_E7F0();
      }
      return v14;
    }
    if (v13 == 1668047219)
    {
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t v14 = 0;
        int v15 = 1633969526;
        goto LABEL_121;
      }
      return 561211770;
    }
    int v18 = 1668049764;
    goto LABEL_66;
  }
  if (v13 <= 1718383986)
  {
    if (v13 <= 1684236337)
    {
      if (v13 != 1668575852)
      {
        if (v13 != 1668641652) {
          return 2003332927;
        }
        *a6 = 60;
        if (a5 > 0x3B)
        {
          uint64_t v14 = 0;
          *(_OWORD *)a7 = *(_OWORD *)"tppawwar";
          *(_OWORD *)(a7 + 16) = *(_OWORD *)"wwar";
          *(_OWORD *)(a7 + 32) = xmmword_1152C;
          *(_OWORD *)(a7 + 44) = *(long long *)((char *)&xmmword_1152C + 12);
          return v14;
        }
        uint64_t v14 = 561211770;
        goto LABEL_189;
      }
      unsigned int v20 = a5 >> 2;
      int v21 = a2[1];
      switch(v21)
      {
        case 1869968496:
          goto LABEL_98;
        case 1768845428:
          if (a5 >= 4) {
            unsigned int v20 = 0;
          }
          break;
        case 1735159650:
LABEL_98:
          uint64_t v23 = *(void *)(DerivedStorage + 144);
          uint64_t v22 = *(void *)(DerivedStorage + 152);
          unsigned int v24 = v23 != 0;
          if (v22) {
            ++v24;
          }
          if (v20 >= v24) {
            unsigned int v20 = v24;
          }
          if (v20)
          {
            if (!v23)
            {
              uint64_t v25 = 0;
LABEL_169:
              if (v22) {
                *(_DWORD *)(a7 + 4 * v25) = sub_5ECC(v22);
              }
              break;
            }
            *(_DWORD *)a7 = sub_5ECC(v12[18]);
            if (v20 >= 2)
            {
              uint64_t v22 = v12[19];
              uint64_t v25 = 1;
              goto LABEL_169;
            }
            unsigned int v20 = 1;
          }
          break;
      }
      uint64_t v14 = 0;
      int v33 = 4 * v20;
      goto LABEL_184;
    }
    if (v13 != 1684236338)
    {
      int v18 = 1684434036;
LABEL_66:
      if (v13 != v18) {
        return 2003332927;
      }
      goto LABEL_76;
    }
    if (a5 <= 7)
    {
      uint64_t v14 = 561211770;
      goto LABEL_189;
    }
    uint64_t v14 = 0;
    *(void *)a7 = 0x200000001;
    int v33 = 8;
LABEL_184:
    *a6 = v33;
    return v14;
  }
  if (v13 > 1751737453)
  {
    if (v13 != 1751737454)
    {
      if (v13 == 1818850926)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t v14 = 0;
          int v15 = *(unsigned char *)(DerivedStorage + 172) == 0;
          goto LABEL_121;
        }
        return 561211770;
      }
      return 2003332927;
    }
    goto LABEL_76;
  }
  if (v13 != 1718383987)
  {
    if (v13 == 1735354734)
    {
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t v14 = 0;
        int v15 = *(_DWORD *)(DerivedStorage + 168) > 0;
        goto LABEL_121;
      }
      return 561211770;
    }
    return 2003332927;
  }
  return 1970171760;
}

uint64_t sub_DF98(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, double *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v10 = DerivedStorage;
  CFDataRef v43 = 0;
  uint64_t v44 = 0;
  int v11 = *a2;
  if (*a2 == 1718383987)
  {
    if (sub_E59C())
    {
      uint64_t v23 = 0;
      *(unsigned char *)(*(void *)(v10 + 120) + 152) = 1;
      goto LABEL_53;
    }
    uint64_t v23 = 1970171760;
    goto LABEL_43;
  }
  if (v11 == 1987012963)
  {
    if (!sub_E6BC())
    {
      uint64_t v23 = 1970171760;
      goto LABEL_43;
    }
    if (a5 == 4)
    {
      int v18 = *(_DWORD *)a6;
      *(unsigned char *)(v10 + 88) = *(_DWORD *)a6;
      CMBaseObjectGetDerivedStorage();
      *(void *)&__s2[0] = 0;
      if ((_BYTE)v18) {
        CFStringRef v19 = &kCFBooleanTrue;
      }
      else {
        CFStringRef v19 = &kCFBooleanFalse;
      }
      uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
      uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v21) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 0;
      }
      unsigned int v24 = *(unsigned int (**)(uint64_t, void, const CFAllocatorRef, _OWORD *))(v22 + 48);
      if (!v24 || v24(CMBaseObject, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, __s2))
      {
        APSLogErrorAt();
      }
      else if (FigCFEqual())
      {
        if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v34 = FigEndpointStreamGetCMBaseObject();
        uint64_t v35 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v35) {
          uint64_t v36 = v35;
        }
        else {
          uint64_t v36 = 0;
        }
        uint64_t v37 = *(void (**)(uint64_t, void, const CFBooleanRef))(v36 + 56);
        if (v37) {
          v37(v34, kAPEndpointStreamProperty_IsHomeTheaterFaceTime, *v19);
        }
      }
      if (*(void *)&__s2[0]) {
        CFRelease(*(CFTypeRef *)&__s2[0]);
      }
      goto LABEL_52;
    }
    uint64_t v23 = 561211770;
LABEL_43:
    APSLogErrorAt();
    goto LABEL_53;
  }
  if (v11 != 1853059700)
  {
    uint64_t v23 = 2003332927;
    goto LABEL_53;
  }
  memset(__s2, 0, 40);
  uint64_t v12 = *(void *)(DerivedStorage + 120);
  long long v13 = *(_OWORD *)(v12 + 32);
  long long __s1 = *(_OWORD *)(v12 + 16);
  long long v40 = v13;
  uint64_t v41 = *(void *)(v12 + 48);
  if (a5 != 8)
  {
    uint64_t v23 = 561211770;
    goto LABEL_43;
  }
  double v14 = *a6;
  if (*a6 == *(double *)&__s1)
  {
LABEL_52:
    uint64_t v23 = 0;
    goto LABEL_53;
  }
  uint64_t v15 = FigHALAudioStreamGetCMBaseObject();
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v25 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFDataRef *))(v17 + 48);
  if (!v25)
  {
    uint64_t v23 = 4294954514;
    goto LABEL_43;
  }
  uint64_t v26 = v25(v15, kFigHALAudioStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, &v43);
  if (v26)
  {
    uint64_t v23 = v26;
    goto LABEL_43;
  }
  CFDataRef v27 = v43;
  unint64_t Length = CFDataGetLength(v43);
  if (Length < 0x70)
  {
    uint64_t v23 = 4294967246;
LABEL_61:
    APSLogErrorAt();
    goto LABEL_43;
  }
  unint64_t v29 = Length / 0x38;
  BytePtr = CFDataGetBytePtr(v27);
  int v31 = 0;
  do
  {
    if (*((double *)BytePtr + 5) <= v14 && *((double *)BytePtr + 6) >= v14)
    {
      int v31 = BytePtr;
      if (*((_DWORD *)BytePtr + 7) == HIDWORD(v40))
      {
        int v31 = BytePtr;
        if (*((_DWORD *)BytePtr + 8) >= v41)
        {
          int v31 = BytePtr;
          goto LABEL_39;
        }
      }
    }
    BytePtr += 56;
    --v29;
  }
  while (v29);
  if (!v31)
  {
    uint64_t v23 = 1970171760;
    goto LABEL_61;
  }
LABEL_39:
  *(double *)__s2 = v14;
  long long v32 = *(_OWORD *)(v31 + 24);
  *(_OWORD *)((char *)__s2 + 8) = *(_OWORD *)(v31 + 8);
  *(_OWORD *)((char *)&__s2[1] + 8) = v32;
  if (!memcmp(&__s1, __s2, 0x28uLL)) {
    goto LABEL_52;
  }
  sub_5ECC(*(void *)(v10 + 136));
  uint64_t v23 = FigHALAudioConfigChangeCreateRecord();
  if (v23)
  {
    APSLogErrorAt();
  }
  else
  {
    uint64_t v33 = v44;
    *(_OWORD *)(v44 + 16) = __s2[0];
    *(_OWORD *)(v33 + 32) = __s2[1];
    *(void *)(v33 + 48) = *(void *)&__s2[2];
    FigHALAudioConfigChangeSendRequest();
    uint64_t v44 = 0;
  }
LABEL_53:
  FigHALAudioConfigChangeDisposeRecord();
  if (v43) {
    CFRelease(v43);
  }
  return v23;
}

BOOL sub_E59C()
{
  CMBaseObjectGetDerivedStorage();
  CFTypeRef cf1 = 0;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v1 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  int v3 = *(unsigned int (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v2 + 48);
  if (!v3 || v3(CMBaseObject, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, &cf1))
  {
    APSLogErrorAt();
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = CFEqual(cf1, kFigEndpointStreamType_LowLatencyAudio) == 0;
  }
  if (cf1) {
    CFRelease(cf1);
  }
  return v4;
}

BOOL sub_E6BC()
{
  CMBaseObjectGetDerivedStorage();
  CFTypeRef cf1 = 0;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v1 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  int v3 = *(unsigned int (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v2 + 48);
  if (v3 && !v3(CMBaseObject, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, &cf1) && cf1)
  {
    BOOL v4 = CFEqual(cf1, kFigEndpointStreamType_LowLatencyAudio) != 0;
  }
  else
  {
    APSLogErrorAt();
    BOOL v4 = 0;
  }
  if (cf1) {
    CFRelease(cf1);
  }
  return v4;
}

uint64_t sub_E7F0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFTypeRef cf1 = 0;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL v4 = *(unsigned int (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v3 + 48);
  if (!v4 || v4(CMBaseObject, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, &cf1))
  {
    APSLogErrorAt();
    uint64_t v6 = 0;
  }
  else
  {
    if (CFEqual(cf1, kFigEndpointStreamType_LowLatencyAudio) && !*(unsigned char *)(DerivedStorage + 88))
    {
      uint64_t UInt32 = 128;
    }
    else if (*(void *)(*(void *)(DerivedStorage + 120) + 64))
    {
      if (FigHALAudioConduitDeviceCopyProperty())
      {
        if (dword_181C8 <= 90 && (dword_181C8 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
          uint64_t UInt32 = 480;
        }
        else
        {
          uint64_t UInt32 = 480;
        }
      }
      else
      {
        uint64_t UInt32 = FigCFNumberGetUInt32();
        if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
    }
    else
    {
      uint64_t UInt32 = 0;
    }
    uint64_t IntWithDefault = APSSettingsGetIntWithDefault();
    if (IntWithDefault)
    {
      uint64_t v6 = IntWithDefault;
      if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v6 = UInt32;
    }
  }
  if (cf1) {
    CFRelease(cf1);
  }
  return v6;
}

uint64_t sub_EB58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v9 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v8 = v9;
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v11)
  {
    return v11(CMBaseObject, a2, a3);
  }
  return result;
}

CFTypeRef sub_EC2C()
{
  CFTypeRef result = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_EC64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 == 1818326115 || a2 == 1718579821)
  {
    if (a3)
    {
      uint64_t v6 = *(void *)(DerivedStorage + 136);
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
      if (v10)
      {
        uint64_t v9 = v10(v6, a2, a3);
        if (!v9)
        {
          FigHALAudioPropertySendChanges();
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v9 = 4294954514;
      }
      APSLogErrorAt();
      goto LABEL_13;
    }
    APSLogErrorAt();
  }
  uint64_t v9 = FigSignalErrorAt();
LABEL_13:
  FigHALAudioConfigChangeDisposeRecord();
  return v9;
}

uint64_t sub_EE08()
{
  return 0;
}

uint64_t sub_EE28()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFNumberRef v51 = 0;
  CFDataRef v52 = 0;
  int valuePtr = 0;
  CMTime v49 = kCMTimeInvalid;
  CMTime v48 = v49;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  *(_OWORD *)bytes = 0u;
  long long v45 = 0u;
  mach_absolute_time();
  if (!*(void *)(DerivedStorage + 112) || *(unsigned char *)(DerivedStorage + 172))
  {
    APSLogErrorAt();
    uint64_t v1 = FigSignalErrorAt();
    CFDataRef v2 = 0;
    char v5 = 1;
    SInt32 = 0;
    CFMutableDictionaryRef Mutable = 0;
    if (!v1) {
      goto LABEL_50;
    }
    goto LABEL_89;
  }
  APSRealTimeAllocatorGetDefault();
  if (*(_DWORD *)(DerivedStorage + 168))
  {
    uint64_t v1 = 0;
    CFDataRef v2 = 0;
    SInt32 = 0;
    CFMutableDictionaryRef Mutable = 0;
    char v5 = 1;
    goto LABEL_50;
  }
  uint64_t v6 = *(void *)(DerivedStorage + 120);
  long long v7 = *(_OWORD *)(v6 + 32);
  *(_OWORD *)(v6 + 88) = *(_OWORD *)(v6 + 16);
  *(_OWORD *)(v6 + 104) = v7;
  *(void *)(v6 + 120) = *(void *)(v6 + 48);
  uint64_t v8 = *(void *)(DerivedStorage + 120);
  int v9 = *(_DWORD *)(v8 + 112);
  *(_DWORD *)(v8 + 156) = 0;
  *(_DWORD *)(v8 + 160) = v9;
  *(_DWORD *)(v8 + 164) = *(double *)(v8 + 88);
  *(void *)(v8 + 176) = 0;
  *(unsigned char *)(v8 + 152) = 0;
  *(void *)(*(void *)(DerivedStorage + 120) + 144) = 0;
  int v11 = (OpaqueCMTimebase **)(DerivedStorage + 176);
  uint64_t v10 = *(const void **)(DerivedStorage + 176);
  if (v10)
  {
    CFRelease(v10);
    *int v11 = 0;
  }
  if (FigCFEqual())
  {
    CFAllocatorRef v12 = kCFAllocatorDefault;
    uint64_t v13 = CMTimeSyncClockCreateForSystemDomainClockIdentifier();
    if (v13)
    {
      uint64_t v1 = v13;
      goto LABEL_82;
    }
    double v14 = v52;
  }
  else
  {
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    if (HostTimeClock) {
      double v14 = (OpaqueCMClock *)CFRetain(HostTimeClock);
    }
    else {
      double v14 = 0;
    }
    CFDataRef v52 = v14;
    CFAllocatorRef v12 = kCFAllocatorDefault;
  }
  uint64_t v16 = CMTimebaseCreateWithSourceClock(v12, v14, (CMTimebaseRef *)(DerivedStorage + 176));
  if (v16)
  {
    uint64_t v1 = v16;
    goto LABEL_82;
  }
  CMClockGetTime(&v49, v52);
  uint64_t v17 = v52;
  CMClockRef v18 = CMClockGetHostTimeClock();
  CMTime time = v49;
  CMSyncConvertTime(&v48, &time, v17, v18);
  CFStringRef v19 = *v11;
  CMTime time = kCMTimeZero;
  CMTime immediateSourceTime = v49;
  uint64_t v20 = CMTimebaseSetRateAndAnchorTime(v19, 1.0, &time, &immediateSourceTime);
  if (v20)
  {
    uint64_t v1 = v20;
    goto LABEL_82;
  }
  FigSimpleMutexLock();
  FigGetCFPreferenceDoubleWithDefault();
  uint64_t v21 = APSLatencyOffsetStepperCreate();
  if (!v21)
  {
    FigSimpleMutexUnlock();
    uint64_t v22 = APAudioSourceConduitCreate();
    if (v22)
    {
      uint64_t v1 = v22;
    }
    else
    {
      if (IsAppleInternalBuild()) {
        APSRingBufferCreate();
      }
      uint64_t v23 = sub_FCBC(*(void *)(DerivedStorage + 136));
      if (!v23)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v12, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          CMTime time = v48;
          uint64_t v24 = FigCFDictionarySetCMTime();
          if (v24)
          {
            uint64_t v1 = v24;
          }
          else
          {
            FigCFDictionarySetValue();
            if (*(_DWORD *)(DerivedStorage + 84) != 1885433964)
            {
              CFDataRef v2 = 0;
              goto LABEL_29;
            }
            uint64_t v25 = ASBDToAPAudioFormat();
            if (v25)
            {
              uint64_t v1 = v25;
            }
            else
            {
              APAudioFormatGetTransportAudioFormatForPCMFormatLowLatencySender();
              uint64_t v26 = APAudioFormatToASBD();
              if (!v26)
              {
                CFDataRef v2 = CFDataCreate(v12, bytes, 40);
                if (v2)
                {
                  FigCFDictionarySetValue();
LABEL_29:
                  uint64_t v27 = FigEndpointStreamAudioEngineResumeSync();
                  if (!v27)
                  {
                    mach_absolute_time();
                    SInt32 = (const void *)FigCFNumberCreateSInt32();
                    sub_EB58(*(void *)(DerivedStorage + 104), kFigEndpointStreamProperty_SubStreamResumptionTimeOutMs, (uint64_t)SInt32);
                    uint64_t v28 = FigEndpointStreamAudioEngineSetEndpointStreamSync();
                    uint64_t v1 = v28;
                    if ((int)v28 <= 200400)
                    {
                      if (v28 == -15486)
                      {
                        if (dword_181C8 > 90 || dword_181C8 == -1 && !_LogCategory_Initialize()) {
                          goto LABEL_47;
                        }
LABEL_39:
                        LogPrintF();
                        goto LABEL_47;
                      }
                      if (!v28)
                      {
LABEL_47:
                        mach_absolute_time();
                        FigSimpleMutexLock();
                        sub_C37C(*(void *)(DerivedStorage + 104), kAPEndpointStreamProperty_DynamicLatencyOffsetMs, (uint64_t)v12, (uint64_t)&v51);
                        if (!v51
                          || (CFNumberGetValue(v51, kCFNumberSInt32Type, &valuePtr),
                              uint64_t v29 = APSLatencyOffsetStepperSetTargetLatencyOffset(),
                              !v29))
                        {
                          FigSimpleMutexUnlock();
                          uint64_t v1 = 0;
                          char v5 = 1;
                          *(unsigned char *)(*(void *)(DerivedStorage + 120) + 200) = 1;
                          *(_DWORD *)(DerivedStorage + 168) = 1;
                          goto LABEL_50;
                        }
                        uint64_t v1 = v29;
                        APSLogErrorAt();
                        char v5 = 0;
                        goto LABEL_89;
                      }
                    }
                    else if (v28 == 200401 || v28 == 200470)
                    {
                      if (dword_181C8 > 90 || dword_181C8 == -1 && !_LogCategory_Initialize()) {
                        goto LABEL_47;
                      }
                      goto LABEL_39;
                    }
                    APSLogErrorAt();
                    if (dword_181C8 <= 90 && (dword_181C8 != -1 || _LogCategory_Initialize())) {
                      LogPrintF();
                    }
                    goto LABEL_88;
                  }
                  uint64_t v1 = v27;
                  APSLogErrorAt();
                  goto LABEL_87;
                }
                APSLogErrorAt();
LABEL_107:
                SInt32 = 0;
                char v5 = 1;
                uint64_t v1 = 4294954510;
                goto LABEL_89;
              }
              uint64_t v1 = v26;
            }
          }
          APSLogErrorAt();
          CFDataRef v2 = 0;
LABEL_87:
          SInt32 = 0;
          goto LABEL_88;
        }
        APSLogErrorAt();
        CFDataRef v2 = 0;
        goto LABEL_107;
      }
      uint64_t v1 = v23;
    }
LABEL_82:
    APSLogErrorAt();
    CFDataRef v2 = 0;
    SInt32 = 0;
    CFMutableDictionaryRef Mutable = 0;
LABEL_88:
    char v5 = 1;
    goto LABEL_89;
  }
  uint64_t v1 = v21;
  APSLogErrorAt();
  CFDataRef v2 = 0;
  SInt32 = 0;
  char v5 = 0;
  CFMutableDictionaryRef Mutable = 0;
LABEL_89:
  uint64_t v31 = *(void *)(DerivedStorage + 136);
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  uint64_t v34 = *(void (**)(uint64_t))(v33 + 40);
  if (v34) {
    v34(v31);
  }
  uint64_t v35 = *(const void **)(*(void *)(DerivedStorage + 120) + 128);
  if (v35)
  {
    CFRelease(v35);
    *(void *)(*(void *)(DerivedStorage + 120) + 128) = 0;
  }
  uint64_t v36 = *(const void **)(DerivedStorage + 176);
  if (v36)
  {
    CFRelease(v36);
    *(void *)(DerivedStorage + 176) = 0;
  }
  uint64_t v37 = *(const void **)(DerivedStorage + 56);
  if (v37)
  {
    CFRelease(v37);
    *(void *)(DerivedStorage + 56) = 0;
  }
  uint64_t v38 = *(void *)(DerivedStorage + 112);
  if (v38)
  {
    uint64_t v39 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v40 = v39 ? v39 : 0;
    uint64_t v41 = *(void (**)(uint64_t, void, void, void))(v40 + 16);
    if (v41) {
      v41(v38, 0, 0, 0);
    }
  }
LABEL_50:
  if (v52) {
    CFRelease(v52);
  }
  if (v51) {
    CFRelease(v51);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (SInt32) {
    CFRelease(SInt32);
  }
  if (v2) {
    CFRelease(v2);
  }
  if ((v5 & 1) == 0) {
    FigSimpleMutexUnlock();
  }
  mach_absolute_time();
  if (dword_181C8 <= 50)
  {
    if (dword_181C8 != -1 || _LogCategory_Initialize())
    {
      UpTicksPerSecond();
      LogPrintF();
    }
    if (dword_181C8 <= 50 && (dword_181C8 != -1 || _LogCategory_Initialize()))
    {
      UpTicksPerSecond();
      LogPrintF();
    }
  }
  return v1;
}

uint64_t sub_F870(uint64_t a1, double *a2, uint64_t *a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v36 = 0;
  double v37 = 0.0;
  uint64_t v38 = 0;
  if (!*(unsigned char *)(*(void *)(DerivedStorage + 120) + 200))
  {
    APSLogErrorAt();
    return 1937010544;
  }
  uint64_t v8 = DerivedStorage;
  if (!*(void *)(DerivedStorage + 176))
  {
    APSLogErrorAt();
    return 1852797029;
  }
  uint64_t v9 = mach_absolute_time();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v8 + 120);
  CMTimeScale v12 = *(_DWORD *)(v11 + 164);
  if (*(_DWORD *)(v11 + 156) != v12) {
    *(_DWORD *)(v11 + 156) = v12;
  }
  uint64_t v13 = *(void *)(v11 + 176);
  if (!v13)
  {
    memset(&v35, 0, sizeof(v35));
    CMTimebaseGetTimeWithTimeScale(&v35, *(CMTimebaseRef *)(v8 + 176), v12, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    memset(&v34, 0, sizeof(v34));
    uint64_t v17 = *(const void **)(v8 + 176);
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    CMTime v33 = v35;
    CMSyncConvertTime(&v34, &v33, v17, HostTimeClock);
    *(double *)(*(void *)(v8 + 120) + 192) = (double)v35.value;
    CMTime v33 = v34;
    uint64_t v19 = CMClockConvertHostTimeToSystemUnits(&v33);
    uint64_t v16 = *(void *)(v8 + 120);
    *(void *)(v16 + 184) = v19;
    goto LABEL_9;
  }
  if (v9 >= v13)
  {
    memset(&v35, 0, sizeof(v35));
    CMTimeMake(&v35, (uint64_t)(*(double *)(v11 + 192) + 11025.0), v12);
    memset(&v34, 0, sizeof(v34));
    double v14 = *(const void **)(v8 + 176);
    CMClockRef v15 = CMClockGetHostTimeClock();
    CMTime v33 = v35;
    CMSyncConvertTime(&v34, &v33, v14, v15);
    *(double *)(*(void *)(v8 + 120) + 192) = (double)v35.value;
    CMTime v33 = v34;
    *(void *)(*(void *)(v8 + 120) + 184) = CMClockConvertHostTimeToSystemUnits(&v33);
    APSLatencyOffsetStepperStepForInterval();
    uint64_t v16 = *(void *)(v8 + 120);
LABEL_9:
    CMTimeMake(&v35, (uint64_t)(*(double *)(v16 + 192) + 11025.0), *(_DWORD *)(v16 + 164));
    uint64_t v20 = *(const void **)(v8 + 176);
    CMClockRef v21 = CMClockGetHostTimeClock();
    CMTime v33 = v35;
    CMSyncConvertTime(&v34, &v33, v20, v21);
    CMTime v33 = v34;
    uint64_t v22 = CMClockConvertHostTimeToSystemUnits(&v33);
    uint64_t v23 = *(void *)(v8 + 120);
    *(void *)(v23 + 176) = v22;
    double v24 = *(double *)(v23 + 192);
    APSLatencyOffsetStepperGetOffsetSamples();
    uint64_t v25 = *(void *)(v8 + 120);
    v33.CMTimeEpoch epoch = *(void *)(v25 + 184);
    uint64_t v26 = *(void *)(v25 + 192);
    *(double *)&v33.int value = v24 + v27;
    *(void *)&v33.timescale = v26;
    APSRealTimeWritableWrite();
    uint64_t v11 = *(void *)(v8 + 120);
  }
  double v28 = *(double *)(v11 + 192);
  APSLatencyOffsetStepperGetOffsetSamples();
  double v30 = v28 + v29;
  *a2 = v30;
  uint64_t v31 = *(void *)(v8 + 120);
  *a3 = *(void *)(v31 + 184);
  *a4 = 0;
  if (*(void *)(v31 + 72))
  {
    uint64_t v36 = v10;
    double v37 = v30;
    uint64_t v38 = *a3;
    APSRingBufferEnqueueBytes();
  }
  kdebug_trace();
  return 0;
}

uint64_t sub_FBA4(uint64_t a1, int a2, BOOL *a3, BOOL *a4)
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 120) + 200))
  {
    uint64_t result = 0;
    *a3 = a2 == 1919513701;
    *a4 = a2 == 1919513701;
  }
  else
  {
    APSLogErrorAt();
    return 1937010544;
  }
  return result;
}

uint64_t sub_FC24()
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 120) + 200)) {
    return 0;
  }
  APSLogErrorAt();
  return 1937010544;
}

uint64_t sub_FC70()
{
  if (*(unsigned char *)(*(void *)(CMBaseObjectGetDerivedStorage() + 120) + 200)) {
    return 0;
  }
  APSLogErrorAt();
  return 1937010544;
}

uint64_t sub_FCBC(uint64_t a1)
{
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL v4 = *(uint64_t (**)(uint64_t))(v3 + 32);
  if (!v4) {
    return 4294954514;
  }

  return v4(a1);
}

void sub_FD74(id a1)
{
  qword_182D8 = 0;
  unk_182E0 = "APHALAudioSharedState";
  qword_182E8 = (uint64_t)sub_FDD4;
  unk_182F0 = 0;
  qword_182F8 = (uint64_t)sub_FDF4;
  unk_18300 = 0u;
  unk_18310 = 0u;
  qword_182D0 = _CFRuntimeRegisterClass();
}

double sub_FDD4(_OWORD *a1)
{
  double result = 0.0;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
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

void sub_FDF4(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 56);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_FE04(const __CFAllocator *a1, CFDataRef *a2)
{
  *(void *)bytes = 3240582185;
  CFDataRef v3 = CFDataCreate(a1, bytes, 8);
  if (v3)
  {
    CFDataRef v4 = v3;
    uint64_t result = 0;
    *a2 = v4;
  }
  else
  {
    APSLogErrorAt();
    return FigSignalErrorAt();
  }
  return result;
}

uint64_t sub_FE90(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, void *a6)
{
  FigHALAudioObjectGetClassID();
  uint64_t v10 = CMDerivedObjectCreate();
  if (v10)
  {
    uint64_t v14 = v10;
LABEL_10:
    APSLogErrorAt();
    return v14;
  }
  uint64_t v11 = FigHALAudioObjectMapperAddMapping();
  if (v11)
  {
    uint64_t v14 = v11;
    goto LABEL_10;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)uint64_t DerivedStorage = a3;
  *(_DWORD *)(DerivedStorage + 8) = 0;
  *(_DWORD *)(DerivedStorage + 12) = a4;
  if (a5) {
    CFTypeRef v13 = CFRetain(a5);
  }
  else {
    CFTypeRef v13 = 0;
  }
  uint64_t v14 = 0;
  *(void *)(DerivedStorage + 16) = v13;
  *a6 = 0;
  return v14;
}

uint64_t sub_FF94(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, void *a6)
{
  FigHALAudioObjectGetClassID();
  uint64_t v10 = CMDerivedObjectCreate();
  if (v10)
  {
    uint64_t v14 = v10;
LABEL_10:
    APSLogErrorAt();
    return v14;
  }
  uint64_t v11 = FigHALAudioObjectMapperAddMapping();
  if (v11)
  {
    uint64_t v14 = v11;
    goto LABEL_10;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)uint64_t DerivedStorage = a3;
  *(_DWORD *)(DerivedStorage + 8) = 0;
  *(_DWORD *)(DerivedStorage + 12) = a4;
  if (a5) {
    CFTypeRef v13 = CFRetain(a5);
  }
  else {
    CFTypeRef v13 = 0;
  }
  uint64_t v14 = 0;
  *(void *)(DerivedStorage + 16) = v13;
  *a6 = 0;
  return v14;
}

void sub_10098()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(const void **)(DerivedStorage + 16);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 16) = 0;
  }
}

CFStringRef sub_100CC()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  if (*((_DWORD *)BytePtr + 1)) {
    uint64_t v2 = " MUTED";
  }
  else {
    uint64_t v2 = (const char *)&unk_12A15;
  }
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"APAudioVolumeControl ID %d Owner %d VolumeDB %f%s", *(unsigned int *)(DerivedStorage + 8), *(unsigned int *)(DerivedStorage + 12), *(float *)BytePtr, v2);
}

uint64_t sub_10154()
{
  return *(unsigned int *)(CMBaseObjectGetDerivedStorage() + 8);
}

uint64_t sub_10170(uint64_t a1, int *a2)
{
  uint64_t result = 0;
  int v3 = *a2;
  if (*a2 <= 1818453105)
  {
    if (v3 > 1668047218)
    {
      BOOL v8 = v3 == 1668047219;
      int v9 = 1668506480;
    }
    else
    {
      BOOL v8 = v3 == 1650682995;
      int v9 = 1667591277;
    }
    goto LABEL_16;
  }
  if (v3 > 1818456931)
  {
    BOOL v8 = v3 == 1818456932 || v3 == 1937007734;
    int v9 = 1818456950;
LABEL_16:
    if (v8 || v3 == v9) {
      return 1;
    }
    return result;
  }
  unsigned int v4 = v3 - 1818453106;
  BOOL v5 = v4 > 4;
  int v6 = (1 << v4) & 0x13;
  if (!v5 && v6 != 0) {
    return 1;
  }
  return result;
}

BOOL sub_10234(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1818456950 || *a2 == 1818453110;
}

uint64_t sub_10254(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 > 1818453106)
  {
    if (v2 <= 1818456931)
    {
      if (v2 != 1818453107 && v2 != 1818453110) {
        return 0;
      }
      return 4;
    }
    if (v2 == 1818456932 || v2 == 1818456950) {
      return 4;
    }
    int v6 = 1937007734;
LABEL_18:
    if (v2 == v6) {
      return 4;
    }
    else {
      return 0;
    }
  }
  if (v2 <= 1668047218)
  {
    if (v2 == 1650682995) {
      return 4;
    }
    int v6 = 1667591277;
    goto LABEL_18;
  }
  if (v2 == 1668047219) {
    return 4;
  }
  if (v2 == 1818453106) {
    unsigned int v3 = 16;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v2 == 1668506480) {
    return 4;
  }
  else {
    return v3;
  }
}

uint64_t sub_10340(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  int v13 = *a2;
  uint64_t v14 = 2003332927;
  if (v13 > 1818453106)
  {
    if (v13 <= 1818456931)
    {
      if (v13 != 1818453107)
      {
        if (v13 != 1818453110) {
          return v14;
        }
        if (*((_DWORD *)BytePtr + 1)) {
          int v16 = -1022361600;
        }
        else {
          int v16 = *(_DWORD *)BytePtr;
        }
        *a6 = 4;
        if (a5 < 4)
        {
          uint64_t v14 = 561211770;
          goto LABEL_46;
        }
LABEL_43:
        uint64_t v14 = 0;
        goto LABEL_44;
      }
      if (a5 != 4)
      {
        uint64_t v14 = 561211770;
        goto LABEL_46;
      }
      APSVolumeConvertDBToSliderValue();
    }
    else
    {
      if (v13 != 1818456932)
      {
        if (v13 != 1818456950)
        {
          if (v13 != 1937007734) {
            return v14;
          }
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          uint64_t v14 = 0;
          int v15 = *(_DWORD *)(DerivedStorage + 12);
LABEL_34:
          *a7 = v15;
          return v14;
        }
        int v16 = 0;
        if (!*((_DWORD *)BytePtr + 1)) {
          APSVolumeConvertDBToSliderValue();
        }
        *a6 = 4;
        if (a5 < 4)
        {
          uint64_t v14 = 561211770;
LABEL_46:
          APSLogErrorAt();
          return v14;
        }
        goto LABEL_43;
      }
      if (a5 != 4)
      {
        uint64_t v14 = 561211770;
        goto LABEL_46;
      }
      APSVolumeConvertSliderValueToDB();
    }
    uint64_t v14 = 0;
    *a6 = 4;
LABEL_44:
    *a7 = v16;
    return v14;
  }
  if (v13 <= 1668047218)
  {
    if (v13 != 1650682995)
    {
      if (v13 != 1667591277) {
        return v14;
      }
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t v14 = 0;
        *a7 = 0;
        return v14;
      }
      return 561211770;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770;
    }
    uint64_t v14 = 0;
    int v15 = 1818588780;
    goto LABEL_34;
  }
  switch(v13)
  {
    case 1668047219:
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t v14 = 0;
      int v15 = 1986817381;
      goto LABEL_34;
    case 1668506480:
      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      uint64_t v14 = 0;
      int v15 = 1869968496;
      goto LABEL_34;
    case 1818453106:
      *a6 = 16;
      if (a5 >= 0x10)
      {
        uint64_t v14 = 0;
        *(_OWORD *)a7 = xmmword_114D0;
        return v14;
      }
      return 561211770;
  }
  return v14;
}

uint64_t sub_1064C(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, int *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  BytePtr = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  if (*a2 == 1818453110)
  {
    if (a5 == 4)
    {
      int v11 = *a6;
      goto LABEL_7;
    }
    uint64_t v12 = 561211770;
LABEL_11:
    APSLogErrorAt();
    return v12;
  }
  if (*a2 != 1818456950) {
    return 2003332927;
  }
  if (a5 != 4)
  {
    uint64_t v12 = 561211770;
    goto LABEL_11;
  }
  APSVolumeConvertSliderValueToDB();
LABEL_7:
  *(_DWORD *)BytePtr = v11;
  FigHALAudioPropertySendChanges();
  return 0;
}

CFStringRef sub_10798()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*((_DWORD *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16)) + 1)) {
    uint64_t v1 = (const char *)&unk_12A15;
  }
  else {
    uint64_t v1 = "Not ";
  }
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"APAudioMuteControl ID %d Owner %d %sMuted", *(unsigned int *)(DerivedStorage + 8), *(unsigned int *)(DerivedStorage + 12), v1);
}

uint64_t sub_10814(uint64_t a1, int *a2)
{
  uint64_t result = 0;
  int v3 = *a2;
  if (*a2 > 1668047218)
  {
    BOOL v4 = v3 == 1668047219 || v3 == 1937007734;
    int v5 = 1668506480;
  }
  else
  {
    BOOL v4 = v3 == 1650682995 || v3 == 1650685548;
    int v5 = 1667591277;
  }
  if (v4 || v3 == v5) {
    return 1;
  }
  return result;
}

BOOL sub_10880(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1650685548;
}

uint64_t sub_10898(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 > 1668047218)
  {
    if (v2 != 1937007734 && v2 != 1668506480 && v2 != 1668047219) {
      return 0;
    }
    return 4;
  }
  if (v2 == 1650682995) {
    return 4;
  }
  if (v2 == 1667591277) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v2 == 1650685548) {
    return 4;
  }
  else {
    return v3;
  }
}

uint64_t sub_10928(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v12 = *a2;
  uint64_t result = 2003332927;
  if (*a2 > 1668047218)
  {
    if (v12 == 1668047219)
    {
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 1836414053;
        goto LABEL_21;
      }
      return 561211770;
    }
    if (v12 == 1668506480)
    {
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 1869968496;
        goto LABEL_21;
      }
      return 561211770;
    }
    if (v12 != 1937007734) {
      return result;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770;
    }
    int v15 = (const UInt8 *)(DerivedStorage + 12);
    goto LABEL_18;
  }
  if (v12 != 1650682995)
  {
    if (v12 != 1650685548)
    {
      if (v12 != 1667591277) {
        return result;
      }
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 0;
LABEL_21:
        uint64_t result = 0;
        *a7 = v14;
        return result;
      }
      return 561211770;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770;
    }
    int v15 = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16)) + 4;
LABEL_18:
    int v14 = *(_DWORD *)v15;
    goto LABEL_21;
  }
  *a6 = 4;
  if (a5 > 3)
  {
    int v14 = 1953458028;
    goto LABEL_21;
  }
  return 561211770;
}

uint64_t sub_10A98(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, int *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*a2 != 1650685548) {
    return 2003332927;
  }
  if (a5 == 4)
  {
    int v10 = *a6;
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
    if (v10 != *((_DWORD *)BytePtr + 1))
    {
      *((_DWORD *)BytePtr + 1) = v10 != 0;
      FigHALAudioPropertySendOneChange();
    }
    return 0;
  }
  else
  {
    uint64_t v12 = 561211770;
    APSLogErrorAt();
  }
  return v12;
}

uint64_t sub_10B6C()
{
  if (IsAppleInternalBuild())
  {
    LogControl();
  }
  else
  {
    LogControl();
    uint64_t v0 = (void (*)(const char *))dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "MediaControlSenderLogControl");
    if (v0) {
      v0("?.*:output2=");
    }
  }

  return LogControl();
}

uint64_t APAudioFormatCreateDescriptionArray()
{
  return _APAudioFormatCreateDescriptionArray();
}

uint64_t APAudioFormatGetTransportAudioFormatForPCMFormatLowLatencySender()
{
  return _APAudioFormatGetTransportAudioFormatForPCMFormatLowLatencySender();
}

uint64_t APAudioFormatToASBD()
{
  return _APAudioFormatToASBD();
}

uint64_t APAudioSourceConduitCreate()
{
  return _APAudioSourceConduitCreate();
}

uint64_t APEndpointStreamAudioAVCCreate()
{
  return _APEndpointStreamAudioAVCCreate();
}

uint64_t APGetEndpointManager()
{
  return _APGetEndpointManager();
}

uint64_t APRealTimeAudioFileWriterCreate()
{
  return _APRealTimeAudioFileWriterCreate();
}

uint64_t APRealTimeAudioFileWriterInvalidate()
{
  return _APRealTimeAudioFileWriterInvalidate();
}

uint64_t APRealTimeAudioFileWriterWriteAudioBytes()
{
  return _APRealTimeAudioFileWriterWriteAudioBytes();
}

uint64_t APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator()
{
  return _APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator();
}

uint64_t APSAsyncLoggerGetSharedLogger()
{
  return _APSAsyncLoggerGetSharedLogger();
}

uint64_t APSAsyncLoggerLogMessage()
{
  return _APSAsyncLoggerLogMessage();
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

uint64_t APSGetFBOPropertyCMTime()
{
  return _APSGetFBOPropertyCMTime();
}

uint64_t APSGetFBOPropertyDouble()
{
  return _APSGetFBOPropertyDouble();
}

uint64_t APSGetFBOPropertyInt64()
{
  return _APSGetFBOPropertyInt64();
}

uint64_t APSIsRemoteHALPluginLoadingEnabled()
{
  return _APSIsRemoteHALPluginLoadingEnabled();
}

uint64_t APSLatencyOffsetStepperCreate()
{
  return _APSLatencyOffsetStepperCreate();
}

uint64_t APSLatencyOffsetStepperGetOffsetSamples()
{
  return _APSLatencyOffsetStepperGetOffsetSamples();
}

uint64_t APSLatencyOffsetStepperSetTargetLatencyOffset()
{
  return _APSLatencyOffsetStepperSetTargetLatencyOffset();
}

uint64_t APSLatencyOffsetStepperStepForInterval()
{
  return _APSLatencyOffsetStepperStepForInterval();
}

uint64_t APSLogErrorAt()
{
  return _APSLogErrorAt();
}

uint64_t APSRealTimeAllocatorGetDefault()
{
  return _APSRealTimeAllocatorGetDefault();
}

uint64_t APSRealTimeWritableCreate()
{
  return _APSRealTimeWritableCreate();
}

uint64_t APSRealTimeWritableRead()
{
  return _APSRealTimeWritableRead();
}

uint64_t APSRealTimeWritableWrite()
{
  return _APSRealTimeWritableWrite();
}

uint64_t APSRingBufferCreate()
{
  return _APSRingBufferCreate();
}

uint64_t APSRingBufferDequeueBytes()
{
  return _APSRingBufferDequeueBytes();
}

uint64_t APSRingBufferEnqueueBytes()
{
  return _APSRingBufferEnqueueBytes();
}

uint64_t APSRingBufferGetBytesUsed()
{
  return _APSRingBufferGetBytesUsed();
}

uint64_t APSSetFBOPropertyDouble()
{
  return _APSSetFBOPropertyDouble();
}

uint64_t APSSettingsGetIntWithDefault()
{
  return _APSSettingsGetIntWithDefault();
}

uint64_t APSVolumeConvertDBToSliderValue()
{
  return _APSVolumeConvertDBToSliderValue();
}

uint64_t APSVolumeConvertSliderValueToDB()
{
  return _APSVolumeConvertSliderValueToDB();
}

uint64_t ASBDToAPAudioFormat()
{
  return _ASBDToAPAudioFormat();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

uint64_t CFDictionarySetInt64()
{
  return _CFDictionarySetInt64();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

uint64_t CM8021ASClockCreate()
{
  return _CM8021ASClockCreate();
}

uint64_t CM8021ASClockGetClockTimeForHostTime()
{
  return _CM8021ASClockGetClockTimeForHostTime();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return _CMBaseObjectGetDerivedStorage();
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return _CMClockConvertHostTimeToSystemUnits(hostTime);
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

uint64_t CMNotificationCenterAddListener()
{
  return _CMNotificationCenterAddListener();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return _CMNotificationCenterGetDefaultLocalCenter();
}

uint64_t CMNotificationCenterPostNotification()
{
  return _CMNotificationCenterPostNotification();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return _CMNotificationCenterRemoveListener();
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return _CMSyncConvertTime(retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return _CMTimeConvertScale(retstr, time, newTimescale, method);
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

uint64_t CMTimeSyncClockCreateForSystemDomainClockIdentifier()
{
  return _CMTimeSyncClockCreateForSystemDomainClockIdentifier();
}

OSStatus CMTimebaseCreateWithSourceClock(CFAllocatorRef allocator, CMClockRef sourceClock, CMTimebaseRef *timebaseOut)
{
  return _CMTimebaseCreateWithSourceClock(allocator, sourceClock, timebaseOut);
}

CMTime *__cdecl CMTimebaseGetTimeWithTimeScale(CMTime *__return_ptr retstr, CMTimebaseRef timebase, CMTimeScale timescale, CMTimeRoundingMethod method)
{
  return _CMTimebaseGetTimeWithTimeScale(retstr, timebase, timescale, method);
}

OSStatus CMTimebaseSetRateAndAnchorTime(CMTimebaseRef timebase, Float64 rate, CMTime *timebaseTime, CMTime *immediateSourceTime)
{
  return _CMTimebaseSetRateAndAnchorTime(timebase, rate, timebaseTime, immediateSourceTime);
}

uint64_t FigAtomicIncrement32()
{
  return _FigAtomicIncrement32();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return _FigCFDictionaryCreateMutableCopy();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return _FigCFDictionaryGetBooleanIfPresent();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return _FigCFDictionaryGetFloatIfPresent();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return _FigCFDictionaryGetInt32IfPresent();
}

uint64_t FigCFDictionarySetCMTime()
{
  return _FigCFDictionarySetCMTime();
}

uint64_t FigCFDictionarySetValue()
{
  return _FigCFDictionarySetValue();
}

uint64_t FigCFEqual()
{
  return _FigCFEqual();
}

uint64_t FigCFNumberCreateSInt32()
{
  return _FigCFNumberCreateSInt32();
}

uint64_t FigCFNumberGetUInt32()
{
  return _FigCFNumberGetUInt32();
}

uint64_t FigDispatchAsyncPostNotification()
{
  return _FigDispatchAsyncPostNotification();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return _FigEndpointGetCMBaseObject();
}

uint64_t FigEndpointStreamAudioEngineGetCMBaseObject()
{
  return _FigEndpointStreamAudioEngineGetCMBaseObject();
}

uint64_t FigEndpointStreamAudioEngineResumeSync()
{
  return _FigEndpointStreamAudioEngineResumeSync();
}

uint64_t FigEndpointStreamAudioEngineSetEndpointStreamSync()
{
  return _FigEndpointStreamAudioEngineSetEndpointStreamSync();
}

uint64_t FigEndpointStreamAudioEngineSuspendSync()
{
  return _FigEndpointStreamAudioEngineSuspendSync();
}

uint64_t FigEndpointStreamGetCMBaseObject()
{
  return _FigEndpointStreamGetCMBaseObject();
}

uint64_t FigGetCFPreferenceDoubleWithDefault()
{
  return _FigGetCFPreferenceDoubleWithDefault();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return _FigGetCFPreferenceNumberWithDefault();
}

uint64_t FigHALAudioConduitDeviceCopyProperty()
{
  return _FigHALAudioConduitDeviceCopyProperty();
}

uint64_t FigHALAudioConduitDeviceHALSendAudio()
{
  return _FigHALAudioConduitDeviceHALSendAudio();
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

uint64_t FigHALAudioCreateBrokeredPluginObjectWithSpecialInstantiator()
{
  return _FigHALAudioCreateBrokeredPluginObjectWithSpecialInstantiator();
}

uint64_t FigHALAudioDeviceGetClassID()
{
  return _FigHALAudioDeviceGetClassID();
}

uint64_t FigHALAudioObjectGetClassID()
{
  return _FigHALAudioObjectGetClassID();
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

uint64_t FigHALAudioPropertySendOneChange()
{
  return _FigHALAudioPropertySendOneChange();
}

uint64_t FigHALAudioStreamGetCMBaseObject()
{
  return _FigHALAudioStreamGetCMBaseObject();
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

uint64_t FigNotificationCenterAddWeakListeners()
{
  return _FigNotificationCenterAddWeakListeners();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return _FigNotificationCenterRemoveWeakListener();
}

uint64_t FigNotificationCenterRemoveWeakListeners()
{
  return _FigNotificationCenterRemoveWeakListeners();
}

uint64_t FigServer_IsAirplayd()
{
  return _FigServer_IsAirplayd();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

uint64_t FigSimpleMutexCreate()
{
  return _FigSimpleMutexCreate();
}

uint64_t FigSimpleMutexDestroy()
{
  return _FigSimpleMutexDestroy();
}

uint64_t FigSimpleMutexLock()
{
  return _FigSimpleMutexLock();
}

uint64_t FigSimpleMutexUnlock()
{
  return _FigSimpleMutexUnlock();
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t LogControl()
{
  return _LogControl();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t LogSetAppID()
{
  return _LogSetAppID();
}

uint64_t SNPrintF()
{
  return _SNPrintF();
}

uint64_t UpTicksPerSecond()
{
  return _UpTicksPerSecond();
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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