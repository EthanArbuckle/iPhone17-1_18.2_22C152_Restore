CFDictionaryRef CreateNamedValue(const char *cStr, const char *a2, __CFArray *a3)
{
  CFAllocatorRef *v5;
  unsigned int v6;
  CFDictionaryRef v7;
  __int16 v9;
  void *values;
  CFTypeRef cf;
  uint64_t v12;
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x263EF8340];
  memset(keys, 0, 24);
  values = 0;
  cf = 0;
  v12 = 0;
  v9 = 0;
  v5 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (cStr)
  {
    keys[0] = @"Name";
    values = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
    v6 = 1;
    LOBYTE(v9) = 1;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v6 = 0;
  if (a2)
  {
LABEL_3:
    keys[v6] = @"Value";
    *(&values + v6) = (void *)CFStringCreateWithCString(*v5, a2, 0x8000100u);
    *(unsigned char *)((unint64_t)&v9 | v6++) = 1;
  }
LABEL_4:
  if (a3)
  {
    keys[v6] = @"List";
    *(&values + v6++) = a3;
  }
  else if (!v6)
  {
    return 0;
  }
  v7 = CFDictionaryCreate(*v5, (const void **)keys, (const void **)&values, v6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if ((_BYTE)v9) {
    CFRelease(values);
  }
  if (HIBYTE(v9)) {
    CFRelease(cf);
  }
  return v7;
}

void ReleaseNamedValue(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

CFDictionaryRef Name(const __CFDictionary *result)
{
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"Name", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

CFDictionaryRef Value(const __CFDictionary *result)
{
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"Value", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

CFDictionaryRef List(const __CFDictionary *result)
{
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"List", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

CFMutableArrayRef CreateNamedValues(void)
{
  return CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
}

void ReleaseNamedValues(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void ClearNamedValues(CFMutableArrayRef theArray)
{
  if (theArray) {
    CFArrayRemoveAllValues(theArray);
  }
}

void AppendNamedValue(CFMutableArrayRef theArray, const void *value)
{
  if (theArray) {
    CFArrayAppendValue(theArray, value);
  }
}

CFArrayRef CountNamedValues(const __CFArray *theArray)
{
  if (theArray) {
    return (const __CFArray *)CFArrayGetCount(theArray);
  }
  return theArray;
}

CFArrayRef GetNamedValue(const __CFArray *result, int a2)
{
  if (result) {
    return (const __CFArray *)CFArrayGetValueAtIndex(result, a2);
  }
  return result;
}

void NamedValue::NamedValue(NamedValue *this)
{
  *(void *)this = 0;
}

{
  *(void *)this = 0;
}

void NamedValue::NamedValue(NamedValue *this, const char *a2, const char *a3, __CFArray *a4)
{
  *(void *)this = 0;
  NamedValue::Set((const void **)this, a2, a3, a4);
}

{
  *(void *)this = 0;
  NamedValue::Set((const void **)this, a2, a3, a4);
}

CFDictionaryRef NamedValue::Set(const void **this, const char *cStr, const char *a3, __CFArray *a4)
{
  v8 = *this;
  if (v8) {
    CFRelease(v8);
  }
  CFDictionaryRef result = CreateNamedValue(cStr, a3, a4);
  *this = result;
  return result;
}

void NamedValue::~NamedValue(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void __clang_call_terminate(void *a1)
{
}

void NamedValue::Name(Name *this)
{
  CFDictionaryRef v1 = *(const __CFDictionary **)this;
  value = 0;
  if (v1) {
    CFDictionaryGetValueIfPresent(v1, @"Name", (const void **)&value);
  }
}

const __CFDictionary *NamedValue::Value(const __CFDictionary **this)
{
  CFDictionaryRef result = *this;
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"Value", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

const __CFDictionary *NamedValue::List(const __CFDictionary **this)
{
  CFDictionaryRef result = *this;
  value = 0;
  if (result)
  {
    CFDictionaryGetValueIfPresent(result, @"List", (const void **)&value);
    return (const __CFDictionary *)value;
  }
  return result;
}

void NamedValues::NamedValues(NamedValues *this)
{
  *(void *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
}

{
  *(void *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
}

void NamedValues::~NamedValues(const void **this)
{
  CFDictionaryRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void NamedValues::push_back(__CFArray **this, const void **a2)
{
  v2 = *this;
  if (v2) {
    CFArrayAppendValue(v2, *a2);
  }
}

const __CFArray *NamedValues::size(const __CFArray **this)
{
  CFArrayRef result = *this;
  if (result) {
    return (const __CFArray *)CFArrayGetCount(result);
  }
  return result;
}

void NamedValues::clear(__CFArray **this)
{
  CFDictionaryRef v1 = *this;
  if (v1) {
    CFArrayRemoveAllValues(v1);
  }
}

H16ISP::H16ISPThreadReadySyncer *H16ISP::H16ISPThreadReadySyncer::H16ISPThreadReadySyncer(H16ISP::H16ISPThreadReadySyncer *this)
{
  return this;
}

void H16ISP::H16ISPThreadReadySyncer::~H16ISPThreadReadySyncer(H16ISP::H16ISPThreadReadySyncer *this)
{
}

uint64_t H16ISP::H16ISPThreadReadySyncer::wait(pthread_mutex_t *this)
{
  return pthread_cond_wait((pthread_cond_t *)&this[1], this);
}

uint64_t H16ISP::H16ISPThreadReadySyncer::signalAndUnlock(H16ISP::H16ISPThreadReadySyncer *this)
{
  pthread_cond_signal((pthread_cond_t *)((char *)this + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)this);
}

CFTypeRef H16ISP::CreateFormatedMetadata(uint64_t a1)
{
  v135[20] = *MEMORY[0x263EF8340];
  if (*(_WORD *)a1 != 4142) {
    return 0;
  }
  NamedValues::NamedValues((NamedValues *)&cf);
  NamedValues::NamedValues((NamedValues *)&v121);
  *(void *)__str = 20;
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v118 = *(void *)(MEMORY[0x263F8C2B8] + 64);
    uint64_t v119 = *MEMORY[0x263F8C2B8];
    uint64_t v117 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    while (1)
    {
      uint64_t v5 = *(unsigned int *)(a1 + 4 * v4 + 20);
      if (v5) {
        break;
      }
LABEL_140:
      if (++v4 == v3) {
        goto LABEL_141;
      }
    }
    NamedValues::NamedValues((NamedValues *)&v120);
    v7 = (unsigned __int16 *)(a1 + v5);
    v8 = "Shared AiCam";
    switch((int)v4)
    {
      case 0:
        *(void *)__str = "unknown";
        switch(*((_DWORD *)v7 + 4))
        {
          case 0:
            v9 = "green-red";
            goto LABEL_99;
          case 1:
            v9 = "red";
            goto LABEL_99;
          case 2:
            v9 = "blue";
            goto LABEL_99;
          case 3:
            v9 = "green-blue";
LABEL_99:
            *(void *)__str = v9;
            break;
          default:
            break;
        }
        __p[0] = "unknown";
        int v101 = v7[14];
        if (v101 == 2)
        {
          v102 = "binning 1/4";
        }
        else if (v101 == 1)
        {
          v102 = "binning 1/2";
        }
        else
        {
          if (v7[14]) {
            goto LABEL_107;
          }
          v102 = "binning disabled";
        }
        __p[0] = (void *)v102;
LABEL_107:
        *(void *)v130 = "unknown";
        int v103 = v7[15];
        if (v103 == 2)
        {
          v104 = "binning 1/4";
        }
        else if (v103 == 1)
        {
          v104 = "binning 1/2";
        }
        else
        {
          if (v7[15]) {
            goto LABEL_114;
          }
          v104 = "binning disabled";
        }
        *(void *)v130 = v104;
LABEL_114:
        *(void *)v129 = "unknown";
        switch(v7[34])
        {
          case 0u:
            v105 = "raw8";
            goto LABEL_119;
          case 1u:
            v105 = "raw10";
            goto LABEL_119;
          case 2u:
            v105 = "raw12";
            goto LABEL_119;
          case 3u:
            v105 = "raw14";
LABEL_119:
            *(void *)v129 = v105;
            break;
          default:
            break;
        }
        *(void *)v126 = "unknown";
        if (v7[35] == 1)
        {
          v106 = "unpacked";
        }
        else
        {
          if (v7[35])
          {
LABEL_125:
            *(void *)&double v125 = 1000;
            LODWORD(v125) = *((unsigned __int8 *)v7 + 43);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 44);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 45);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 46);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 47);
            LODWORD(v107) = *((_DWORD *)v7 + 12);
            double v125 = (double)v107 * 0.00390625;
            LOWORD(v108) = v7[32];
            double v125 = (double)v108 * 0.00390625;
            LODWORD(v125) = *((unsigned __int8 *)v7 + 72);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 73);
            double v125 = COERCE_DOUBLE(bswap64(*(void *)(v7 + 37)));
            *(void *)&double v125 = v7 + 48;
            *(void *)&double v125 = v7 + 64;
            *(void *)&double v125 = v7 + 80;
            *(void *)&double v125 = v7 + 96;
            unsigned int v109 = *((_DWORD *)v7 + 80);
            unsigned int v110 = *((_DWORD *)v7 + 81);
            unsigned int v123 = bswap32(v110);
            unsigned int v124 = bswap32(v109);
            LODWORD(v125) = v109;
            LODWORD(v125) = BYTE1(v109);
            LODWORD(v125) = BYTE2(v109);
            LODWORD(v125) = HIBYTE(v109) & 0xF;
            LODWORD(v125) = v109 >> 28;
            LODWORD(v125) = HIBYTE(v110);
            LODWORD(v125) = BYTE2(v110);
            LODWORD(v125) = BYTE1(v110);
            LODWORD(v125) = v110;
            LODWORD(v125) = (__int16)v7[168];
            double v125 = (double)(__int16)v7[231] * 0.0000305175781 + (double)(__int16)v7[168];
            LODWORD(v125) = *((unsigned __int8 *)v7 + 338);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 339);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 460);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 461);
            LODWORD(v125) = v7[229];
            LODWORD(v125) = v7[246];
            LODWORD(v125) = v7[247];
            LODWORD(v125) = v7[248];
            LODWORD(v125) = v7[249];
            LODWORD(v125) = *((unsigned __int8 *)v7 + 500);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 501);
            LODWORD(v125) = v7[254];
            LODWORD(v125) = v7[255];
            LODWORD(v125) = v7[256];
            LODWORD(v125) = v7[257];
            LODWORD(v125) = *((_DWORD *)v7 + 129);
            LODWORD(v125) = *((_DWORD *)v7 + 130);
            LODWORD(v125) = *((_DWORD *)v7 + 131);
            LODWORD(v125) = *((_DWORD *)v7 + 132);
            LODWORD(v125) = *((_DWORD *)v7 + 133);
            LODWORD(v125) = *((_DWORD *)v7 + 134);
            LODWORD(v125) = *((_DWORD *)v7 + 135);
            LODWORD(v125) = v7[272];
            LODWORD(v125) = v7[273];
            LODWORD(v125) = v7[282];
            LODWORD(v125) = v7[283];
            LODWORD(v125) = v7[284];
            LODWORD(v125) = v7[285];
            LODWORD(v125) = v7[286];
            LODWORD(v125) = v7[287];
            LODWORD(v125) = v7[288];
            LODWORD(v125) = v7[289];
            LODWORD(v125) = *((_DWORD *)v7 + 145);
            LODWORD(v125) = *((_DWORD *)v7 + 146);
            LODWORD(v125) = v7[294];
            LODWORD(v125) = *((_DWORD *)v7 + 148);
            LODWORD(v125) = *((_DWORD *)v7 + 149);
            LODWORD(v125) = *((_DWORD *)v7 + 150);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 604);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 605);
            LODWORD(v125) = *((_DWORD *)v7 + 152);
            LODWORD(v125) = *((_DWORD *)v7 + 153);
            LODWORD(v125) = *((_DWORD *)v7 + 154);
            LODWORD(v125) = v7[312];
            LODWORD(v125) = v7[313];
            LODWORD(v125) = v7[314];
            LODWORD(v125) = v7[315];
            LODWORD(v125) = *((_DWORD *)v7 + 155);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 632);
            LODWORD(v125) = v7[317];
            LODWORD(v125) = *((_DWORD *)v7 + 159);
            LODWORD(v125) = *((_DWORD *)v7 + 162);
            LODWORD(v125) = v7[326];
            LODWORD(v125) = v7[327];
            LODWORD(v125) = v7[328];
            LODWORD(v125) = v7[329];
            LODWORD(v125) = *((unsigned __int8 *)v7 + 660);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 661);
            LODWORD(v125) = *((_DWORD *)v7 + 167);
            LODWORD(v125) = *((_DWORD *)v7 + 168);
            LODWORD(v125) = v7[338];
            LODWORD(v125) = v7[339];
            LODWORD(v125) = v7[340];
            LODWORD(v125) = v7[341];
            LODWORD(v125) = *((_DWORD *)v7 + 173);
            LODWORD(v125) = v7[348];
            LODWORD(v125) = v7[349];
            LODWORD(v125) = v7[350];
            LODWORD(v125) = v7[351];
            LODWORD(v125) = v7[352];
            LODWORD(v125) = v7[353];
            LODWORD(v125) = v7[354];
            LODWORD(v125) = v7[355];
            LODWORD(v125) = v7[356];
            LODWORD(v125) = v7[357];
            LODWORD(v125) = v7[358];
            LODWORD(v125) = v7[359];
            LODWORD(v125) = v7[360];
            LODWORD(v125) = v7[361];
            LODWORD(v125) = v7[362];
            LODWORD(v125) = v7[363];
            LODWORD(v125) = v7[364];
            LODWORD(v125) = v7[365];
            LODWORD(v125) = v7[366];
            LODWORD(v125) = v7[367];
            LODWORD(v125) = v7[368];
            LODWORD(v125) = v7[369];
            LODWORD(v125) = v7[370];
            LODWORD(v125) = v7[371];
            LODWORD(v125) = v7[372];
            LODWORD(v125) = v7[373];
            LODWORD(v125) = *((unsigned __int8 *)v7 + 748);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 749);
            LODWORD(v125) = *((char *)v7 + 750);
            LODWORD(v125) = v7[377];
            LODWORD(v125) = *((unsigned __int8 *)v7 + 804);
            LODWORD(v125) = *((unsigned __int8 *)v7 + 805);
            v8 = "Shared Input";
            goto LABEL_138;
          }
          v106 = "packed";
        }
        *(void *)v126 = v106;
        goto LABEL_125;
      case 1:
        v10 = "unknown";
        *(void *)__str = "unknown";
        int v11 = *v7;
        if (v11 == 2)
        {
          v12 = "R'G'B'";
        }
        else if (v11 == 1)
        {
          v12 = "Y'CbCr 4:2:2";
        }
        else
        {
          if (*v7) {
            goto LABEL_94;
          }
          v12 = "Y'CbCr 4:2:0";
        }
        *(void *)__str = v12;
LABEL_94:
        __p[0] = "unknown";
        switch(v7[1])
        {
          case 0u:
            v100 = "BackEnd";
            goto LABEL_130;
          case 1u:
            v100 = "StatsBlock";
            goto LABEL_130;
          case 2u:
            v100 = "RawProcBlock";
            goto LABEL_130;
          case 3u:
            v100 = "RGBProcBlock";
            goto LABEL_130;
          case 4u:
            v100 = "YCCProcBlock";
LABEL_130:
            __p[0] = (void *)v100;
            break;
          default:
            break;
        }
        v111 = "RGBY";
        if (!*((unsigned char *)v7 + 9)) {
          v111 = "RGGB";
        }
        *(void *)v130 = v111;
        int v112 = *((_DWORD *)v7 + 1028);
        if (v112 == 1)
        {
          v10 = "log2";
        }
        else if (!v112)
        {
          v10 = "linear";
        }
        *(void *)v129 = v10;
        *(void *)v126 = 4772;
        NamedValues::NamedValues((NamedValues *)v126);
        LODWORD(v114) = *((_DWORD *)v7 + 1027);
        double v125 = (double)v114 * 0.0625;
        LODWORD(v125) = *((unsigned __int8 *)v7 + 4138);
        LODWORD(v125) = *((unsigned __int8 *)v7 + 4139);
        LODWORD(v125) = *((_DWORD *)v7 + 1035);
        LODWORD(v125) = *((_DWORD *)v7 + 1036);
        LODWORD(v125) = *((_DWORD *)v7 + 1037);
        LODWORD(v125) = *((_DWORD *)v7 + 1038);
        LODWORD(v125) = *((_DWORD *)v7 + 1039);
        LODWORD(v125) = *((_DWORD *)v7 + 1040);
        LODWORD(v125) = *((_DWORD *)v7 + 1041);
        LODWORD(v125) = *((_DWORD *)v7 + 1042);
        LODWORD(v125) = *((_DWORD *)v7 + 1043);
        LODWORD(v125) = *((_DWORD *)v7 + 1044);
        LODWORD(v125) = *((_DWORD *)v7 + 1045);
        LODWORD(v125) = *((_DWORD *)v7 + 1046);
        LODWORD(v125) = *((unsigned __int8 *)v7 + 4188);
        NamedValues::~NamedValues((NamedValues *)v126);
        v8 = "Shared Output";
LABEL_138:
LABEL_139:
        NamedValues::~NamedValues((NamedValues *)&v120);
        goto LABEL_140;
      case 2:
        *(void *)__str = 5848;
        LOWORD(v13) = v7[2];
        *(double *)__str = (double)v13 * 0.00390625;
        LODWORD(v14) = *((_DWORD *)v7 + 1313);
        *(double *)__str = (double)v14 * 0.00390625;
        LOWORD(v15) = v7[4];
        *(double *)__str = (double)v15 * 0.00390625;
        *(_DWORD *)__str = v7[5];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 13);
        LODWORD(v16) = *((_DWORD *)v7 + 5);
        *(double *)__str = (double)v16 * 0.0000152587891;
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 1732);
        *(_DWORD *)__str = *((_DWORD *)v7 + 434);
        *(_DWORD *)__str = v7[870];
        *(_DWORD *)__str = v7[871];
        *(_DWORD *)__str = v7[872];
        *(_DWORD *)__str = *((_DWORD *)v7 + 437);
        *(_DWORD *)__str = *((_DWORD *)v7 + 438);
        *(_DWORD *)__str = *((_DWORD *)v7 + 439);
        *(_DWORD *)__str = *((_DWORD *)v7 + 440);
        *(_DWORD *)__str = *((_DWORD *)v7 + 441);
        *(_DWORD *)__str = *((_DWORD *)v7 + 442);
        *(_DWORD *)__str = *((_DWORD *)v7 + 443);
        *(_DWORD *)__str = *((_DWORD *)v7 + 444);
        *(_DWORD *)__str = *((_DWORD *)v7 + 445);
        *(_DWORD *)__str = *((_DWORD *)v7 + 446);
        *(_DWORD *)__str = *((_DWORD *)v7 + 447);
        *(_DWORD *)__str = *((_DWORD *)v7 + 448);
        *(_DWORD *)__str = *((_DWORD *)v7 + 449);
        *(_DWORD *)__str = *((_DWORD *)v7 + 450);
        *(_DWORD *)__str = *((_DWORD *)v7 + 451);
        *(_DWORD *)__str = *((_DWORD *)v7 + 452);
        *(_DWORD *)__str = *((_DWORD *)v7 + 453);
        *(_DWORD *)__str = *((_DWORD *)v7 + 455);
        *(_DWORD *)__str = *((_DWORD *)v7 + 456);
        *(_DWORD *)__str = *((_DWORD *)v7 + 457);
        *(_DWORD *)__str = *((_DWORD *)v7 + 458);
        *(_DWORD *)__str = *((_DWORD *)v7 + 459);
        *(_DWORD *)__str = *((_DWORD *)v7 + 460);
        *(_DWORD *)__str = *((_DWORD *)v7 + 461);
        *(_DWORD *)__str = *((_DWORD *)v7 + 462);
        *(_DWORD *)__str = *((_DWORD *)v7 + 463);
        *(_DWORD *)__str = *((_DWORD *)v7 + 479);
        *(_DWORD *)__str = *((_DWORD *)v7 + 483);
        *(_DWORD *)__str = *((_DWORD *)v7 + 484);
        *(_DWORD *)__str = *((_DWORD *)v7 + 485);
        *(_DWORD *)__str = *((_DWORD *)v7 + 486);
        *(_DWORD *)__str = *((_DWORD *)v7 + 487);
        *(_DWORD *)__str = *((_DWORD *)v7 + 488);
        *(_DWORD *)__str = *((_DWORD *)v7 + 489);
        *(_DWORD *)__str = *((_DWORD *)v7 + 490);
        *(_DWORD *)__str = *((_DWORD *)v7 + 491);
        *(_DWORD *)__str = *((_DWORD *)v7 + 492);
        *(_DWORD *)__str = *((_DWORD *)v7 + 493);
        *(_DWORD *)__str = v7[988];
        *(_DWORD *)__str = v7[989];
        *(_DWORD *)__str = v7[990];
        *(_DWORD *)__str = v7[991];
        *(_DWORD *)__str = v7[992];
        *(_DWORD *)__str = *((_DWORD *)v7 + 497);
        NamedValues::NamedValues((NamedValues *)__str);
        LODWORD(__p[0]) = *((unsigned __int8 *)v7 + 592);
        LODWORD(__p[0]) = *((unsigned __int8 *)v7 + 593);
        NamedValues::NamedValues((NamedValues *)__p);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 405);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 406);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 407);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 408);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 409);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 410);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 411);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 412);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 413);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 414);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 415);
        *(_DWORD *)v130 = *((_DWORD *)v7 + 416);
        NamedValues::~NamedValues((NamedValues *)__p);
        NamedValues::~NamedValues((NamedValues *)__str);
        v8 = "Shared Auto Exposure";
        goto LABEL_138;
      case 3:
        *(void *)__str = 3728;
        NamedValues::NamedValues((NamedValues *)v129);
        *(_DWORD *)__str = v7[80];
        *(_DWORD *)__str = v7[81];
        *(_DWORD *)__str = v7[82];
        *(_DWORD *)__str = v7[83];
        *(_DWORD *)__str = v7[1292];
        *(_DWORD *)__str = v7[1293];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 2716);
        *(_DWORD *)__str = v7[1360];
        *(_DWORD *)__str = v7[1361];
        *(_DWORD *)__str = *((_DWORD *)v7 + 682);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 2732);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 2733);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 2734);
        *(_DWORD *)__str = *((_DWORD *)v7 + 684);
        *(_DWORD *)__str = *((_DWORD *)v7 + 685);
        *(_DWORD *)__str = (__int16)v7[1372];
        *(_DWORD *)__str = v7[1373];
        *(_DWORD *)__str = v7[1390];
        *(_DWORD *)__str = v7[1391];
        *(_DWORD *)__str = v7[1392];
        *(_DWORD *)__str = v7[1393];
        *(_DWORD *)__str = v7[1394];
        *(_DWORD *)__str = *((_DWORD *)v7 + 775);
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)__str);
        std::ostream::operator<<();
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v132 + 8, __p);
        if (v128 >= 0) {
          v20 = __p;
        }
        else {
          v20 = (void **)__p[0];
        }
        NamedValue::NamedValue((NamedValue *)v130, "roiType", (const char *)v20, 0);
        if (v128 < 0) {
          operator delete(__p[0]);
        }
        NamedValues::push_back(&v120, (const void **)v130);
        NamedValue::~NamedValue((NamedValue *)v130);
        *(void *)__str = v119;
        *(void *)&__str[*(void *)(v119 - 24)] = v118;
        *(void *)&v132[0] = v117;
        *((void *)&v132[0] + 1) = MEMORY[0x263F8C318] + 16;
        if (v134 < 0) {
          operator delete(v133);
        }
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x2533802A0](v135);
        *(_DWORD *)__str = v7[1695];
        NamedValues::~NamedValues((NamedValues *)v129);
        v8 = "Shared Auto Focus";
        goto LABEL_138;
      case 4:
        *(void *)__str = 1112;
        LOWORD(v21) = v7[6];
        LOWORD(v22) = v7[7];
        LOWORD(v23) = v7[8];
        LOWORD(v25) = v7[9];
        LOWORD(v26) = v7[10];
        LOWORD(v27) = v7[11];
        LOWORD(v32) = v7[21];
        *(double *)__str = (double)v32 * 0.0000610351562;
        LOWORD(v33) = v7[22];
        *(double *)__str = (double)v33 * 0.0000610351562;
        LODWORD(v34) = *((_DWORD *)v7 + 13);
        *(double *)__str = (double)v34 * 0.000244140625;
        *(_DWORD *)__str = v7[73];
        *(_DWORD *)__str = v7[86];
        *(_DWORD *)__str = v7[87];
        *(_DWORD *)__str = v7[88];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 178);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 179);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 180);
        *(_DWORD *)__str = v7[91];
        *(_DWORD *)__str = v7[92];
        *(_DWORD *)__str = v7[93];
        *(_DWORD *)__str = v7[94];
        *(_DWORD *)__str = v7[95];
        *(_DWORD *)__str = v7[96];
        *(_DWORD *)__str = v7[97];
        *(_DWORD *)__str = v7[98];
        *(_DWORD *)__str = v7[99];
        *(_DWORD *)__str = *((_DWORD *)v7 + 68);
        *(_DWORD *)__str = *((_DWORD *)v7 + 86);
        *(_DWORD *)__str = v7[206];
        LOWORD(v35) = v7[138];
        *(double *)__str = (double)v35 * 0.0000610351562;
        LOWORD(v36) = v7[139];
        *(double *)__str = (double)v36 * 0.0000610351562;
        *(_DWORD *)__str = *((_DWORD *)v7 + 70);
        LODWORD(v37) = *((_DWORD *)v7 + 71);
        LODWORD(v38) = *((_DWORD *)v7 + 72);
        LODWORD(v39) = *((_DWORD *)v7 + 73);
        LODWORD(v41) = *((_DWORD *)v7 + 74);
        LODWORD(v42) = *((_DWORD *)v7 + 75);
        LODWORD(v43) = *((_DWORD *)v7 + 76);
        v8 = "Shared Auto White Balance";
        goto LABEL_138;
      case 5:
        *(void *)__str = 24;
        v8 = "Adaptive Tone Curve";
        goto LABEL_138;
      case 6:
        *(void *)__str = 108;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = v7[2];
        *(_DWORD *)__str = v7[3];
        *(_DWORD *)__str = v7[4];
        *(_DWORD *)__str = v7[5];
        *(_DWORD *)__str = v7[10];
        v8 = "Shared LTM";
        goto LABEL_138;
      case 7:
        *(void *)__str = 604;
        LODWORD(v48) = *((_DWORD *)v7 + 5);
        *(double *)__str = (double)v48 * 0.00390625;
        LODWORD(v49) = *((_DWORD *)v7 + 10);
        *(double *)__str = (double)v49 * 0.00390625;
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 60);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 61);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 62);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 63);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 64);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 65);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 66);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 67);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 68);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 69);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 70);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 71);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 72);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 73);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 74);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 75);
        *(_DWORD *)__str = v7[38];
        *(_DWORD *)__str = v7[39];
        *(_DWORD *)__str = (__int16)v7[40];
        *(_DWORD *)__str = v7[41];
        LOWORD(v5pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[44];
        LOWORD(v51) = v7[45];
        LOWORD(v52) = v7[46];
        LOWORD(v57) = v7[56];
        *(double *)__str = (double)v57 * 0.0000610351562;
        LOWORD(v58) = v7[57];
        *(double *)__str = (double)v58 * 0.0000610351562;
        LOWORD(v59) = v7[58];
        *(double *)__str = (double)v59 * 0.000244140625;
        LOWORD(v6pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[59];
        *(double *)__str = (double)v60 * 0.000244140625;
        LOWORD(v61) = v7[60];
        *(double *)__str = (double)v61 * 0.000244140625;
        LOWORD(v62) = v7[61];
        *(double *)__str = (double)v62 * 0.000244140625;
        LOWORD(v63) = v7[62];
        *(double *)__str = (double)v63 * 0.000244140625;
        LOWORD(v64) = v7[63];
        *(double *)__str = (double)v64 * 0.000244140625;
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 128);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 129);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 132);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 133);
        *(_DWORD *)__str = v7[67];
        *(_DWORD *)__str = v7[68];
        *(_DWORD *)__str = v7[69];
        *(_DWORD *)__str = v7[76];
        *(_DWORD *)__str = v7[77];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 160);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 161);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 162);
        *(_DWORD *)__str = *((_DWORD *)v7 + 41);
        *(_DWORD *)__str = *((_DWORD *)v7 + 44);
        *(_DWORD *)__str = *((_DWORD *)v7 + 45);
        *(_DWORD *)__str = *((_DWORD *)v7 + 46);
        *(_DWORD *)__str = *((_DWORD *)v7 + 47);
        *(_DWORD *)__str = *((_DWORD *)v7 + 48);
        *(_DWORD *)__str = *((_DWORD *)v7 + 49);
        *(_DWORD *)__str = *((_DWORD *)v7 + 50);
        *(_DWORD *)__str = *((_DWORD *)v7 + 51);
        *(_DWORD *)__str = *((_DWORD *)v7 + 52);
        *(_DWORD *)__str = *((_DWORD *)v7 + 53);
        *(_DWORD *)__str = v7[108];
        *(_DWORD *)__str = v7[109];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 243);
        *(_DWORD *)__str = (__int16)v7[149];
        *(_DWORD *)__str = (__int16)v7[154];
        *(_DWORD *)__str = (__int16)v7[155];
        *(_DWORD *)__str = *((_DWORD *)v7 + 78);
        *(_DWORD *)__str = *((_DWORD *)v7 + 79);
        *(_DWORD *)__str = *((_DWORD *)v7 + 80);
        *(_DWORD *)__str = *((_DWORD *)v7 + 81);
        *(_DWORD *)__str = *((_DWORD *)v7 + 91);
        *(_DWORD *)__str = *((_DWORD *)v7 + 92);
        *(_DWORD *)__str = *((_DWORD *)v7 + 93);
        *(_DWORD *)__str = *((_DWORD *)v7 + 94);
        uint64_t v65 = 0;
        v66 = (unsigned __int8 *)(a1 + 250 + v5);
        do
        {
          NamedValues::NamedValues((NamedValues *)__p);
          v67 = &v7[8 * v65];
          *(_DWORD *)v130 = *((_DWORD *)v67 + 61);
          *(_DWORD *)v130 = *((unsigned __int8 *)v67 + 248);
          uint64_t v68 = 0;
          v69 = v66;
          do
          {
            NamedValues::NamedValues((NamedValues *)v130);
            *(_DWORD *)v129 = *(v69 - 1);
            *(_DWORD *)v129 = *v69;
            snprintf(__str, 0x40uLL, "strength[%d]", v68);
            NamedValues::~NamedValues((NamedValues *)v130);
            ++v68;
            v69 += 2;
          }
          while (v68 != 5);
          snprintf(__str, 0x40uLL, "mbnrConfig[%d]", v65);
          NamedValues::~NamedValues((NamedValues *)__p);
          ++v65;
          v66 += 16;
        }
        while (v65 != 3);
        v8 = "Shared RAW Proc";
        goto LABEL_138;
      case 8:
        *(void *)__str = 776;
        *(_DWORD *)__str = v7[2];
        *(_DWORD *)__str = v7[275];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 552);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 553);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 554);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 555);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 568);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 640);
        v8 = "Shared RGB Proc";
        goto LABEL_138;
      case 9:
        *(void *)__str = 192;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 2);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 3);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 4);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 5);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 6);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 7);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 8);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 9);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 10);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 11);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 12);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 13);
        *(_DWORD *)__str = v7[7];
        *(_DWORD *)__str = v7[8];
        *(_DWORD *)__str = v7[9];
        *(_DWORD *)__str = v7[10];
        *(_DWORD *)__str = v7[11];
        *(_DWORD *)__str = v7[12];
        *(_DWORD *)__str = v7[79];
        *(_DWORD *)__str = v7[80];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 162);
        *(_DWORD *)__str = v7[82];
        *(_DWORD *)__str = v7[83];
        *(_DWORD *)__str = v7[84];
        *(_DWORD *)__str = *((_DWORD *)v7 + 43);
        *(_DWORD *)__str = *((_DWORD *)v7 + 44);
        *(_DWORD *)__str = *((_DWORD *)v7 + 45);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 184);
        v8 = "Shared YCC Proc";
        goto LABEL_138;
      case 10:
        *(void *)__str = 4;
        *(_DWORD *)__str = *(unsigned __int8 *)v7;
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 1);
        v8 = "Shared BES Proc";
        goto LABEL_138;
      case 11:
        *(void *)__str = 19748;
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 324);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 325);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 326);
        *(_DWORD *)__str = v7[164];
        *(_DWORD *)__str = v7[165];
        *(_DWORD *)__str = v7[166];
        *(_DWORD *)__str = v7[167];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 326);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 326);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 326);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 326);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 326);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 326);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 326);
        *(_DWORD *)__str = v7[170];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 342);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 343);
        *(_DWORD *)__str = v7[174];
        *(_DWORD *)__str = v7[175];
        *(_DWORD *)__str = v7[176];
        *(_DWORD *)__str = v7[177];
        *(_DWORD *)__str = v7[178];
        *(_DWORD *)__str = v7[179];
        *(_DWORD *)__str = v7[180];
        *(_DWORD *)__str = v7[181];
        LOWORD(v76) = v7[186];
        LOWORD(v77) = v7[187];
        LOWORD(v78) = v7[188];
        LOWORD(v8pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[189];
        LOWORD(v81) = v7[190];
        LOWORD(v82) = v7[191];
        *(_DWORD *)__str = v7[191];
        *(_DWORD *)__str = v7[192];
        *(_DWORD *)__str = v7[198];
        *(_DWORD *)__str = v7[199];
        *(_DWORD *)__str = v7[200];
        *(_DWORD *)__str = v7[201];
        *(_DWORD *)__str = v7[204];
        *(_DWORD *)__str = v7[205];
        *(_DWORD *)__str = v7[212];
        *(_DWORD *)__str = v7[213];
        *(_DWORD *)__str = v7[214];
        *(_DWORD *)__str = v7[215];
        *(_DWORD *)__str = v7[216];
        *(_DWORD *)__str = v7[217];
        *(_DWORD *)__str = v7[340];
        *(_DWORD *)__str = v7[341];
        *(_DWORD *)__str = v7[342];
        *(_DWORD *)__str = v7[343];
        *(_DWORD *)__str = v7[344];
        *(_DWORD *)__str = v7[345];
        *(_DWORD *)__str = *((_DWORD *)v7 + 4071);
        *(_DWORD *)__str = *((_DWORD *)v7 + 4072);
        v8 = "Shared Stats";
        goto LABEL_138;
      case 12:
        *(void *)__str = 0x10000;
        v8 = "Shared Debug";
        goto LABEL_138;
      case 13:
        *(void *)__str = 59000;
        v8 = "Shared OIS";
        goto LABEL_138;
      case 14:
        *(void *)__str = 65608;
        v8 = "Shared FocusPixel";
        goto LABEL_138;
      case 15:
        *(void *)__str = 6174;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = v7[2];
        *(_DWORD *)__str = v7[3];
        *(_DWORD *)__str = v7[4];
        *(_DWORD *)__str = v7[5];
        v8 = "Shared LocalHist";
        goto LABEL_138;
      case 16:
        *(void *)__str = 65540;
        v8 = "Shared VIS";
        goto LABEL_138;
      case 17:
        *(void *)__str = 16388;
        v8 = "Shared TNR";
        goto LABEL_138;
      case 18:
        *(void *)__str = 64;
        *(_DWORD *)__str = (__int16)v7[8];
        *(_DWORD *)__str = (__int16)v7[9];
        *(_DWORD *)__str = (__int16)v7[10];
        *(_DWORD *)__str = (__int16)v7[11];
        *(_DWORD *)__str = (__int16)v7[12];
        *(_DWORD *)__str = (__int16)v7[13];
        *(_DWORD *)__str = (__int16)v7[14];
        *(_DWORD *)__str = (__int16)v7[15];
        *(_DWORD *)__str = v7[16];
        *(_DWORD *)__str = v7[17];
        *(_DWORD *)__str = v7[28];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 58);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 59);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 60);
        v8 = "Shared System";
        goto LABEL_138;
      case 19:
        *(void *)__str = 63784;
        *(_DWORD *)__str = v7[31605];
        *(_DWORD *)__str = v7[31606];
        *(_DWORD *)__str = v7[31607];
        *(_DWORD *)__str = v7[31608];
        *(_DWORD *)__str = v7[31610];
        *(_DWORD *)__str = v7[31612];
        *(_DWORD *)__str = v7[31613];
        *(_DWORD *)__str = v7[31614];
        *(_DWORD *)__str = v7[31873];
        *(_DWORD *)__str = v7[31874];
        *(_DWORD *)__str = *((_DWORD *)v7 + 15938);
        *(_DWORD *)__str = *((_DWORD *)v7 + 15939);
        *(_DWORD *)__str = v7[31880];
        *(_DWORD *)__str = v7[31881];
        v8 = "Shared LTM LUTs";
        goto LABEL_138;
      case 20:
        *(void *)__str = 1736;
        v8 = "Shared VIS Info";
        goto LABEL_138;
      case 21:
        *(void *)__str = 11008;
        v8 = "Shared Motion Info";
        goto LABEL_138;
      case 22:
        *(void *)__str = 4144;
        v8 = "Shared AF FocusMap";
        goto LABEL_138;
      case 23:
        *(void *)__str = 644;
        *(_DWORD *)__str = *(_DWORD *)v7;
        v8 = "Shared DMA Config";
        goto LABEL_138;
      case 24:
        *(void *)__str = 17096;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = *((_DWORD *)v7 + 1);
        *(_DWORD *)__str = *((_DWORD *)v7 + 2);
        *(_DWORD *)__str = *((_DWORD *)v7 + 3);
        *(_DWORD *)__str = *((_DWORD *)v7 + 4);
        *(_DWORD *)__str = *((_DWORD *)v7 + 5);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6);
        *(_DWORD *)__str = v7[12];
        *(_DWORD *)__str = v7[13];
        v8 = "Shared HITH";
        goto LABEL_138;
      case 25:
        *(void *)__str = 77528;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = *((_DWORD *)v7 + 19381);
        v8 = "Shared APS";
        goto LABEL_138;
      case 26:
        *(void *)__str = 786600;
        v8 = "Shared SideBand";
        goto LABEL_138;
      case 27:
        *(void *)__str = 33012;
        *(_DWORD *)__str = *(_DWORD *)v7;
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 4);
        v8 = "Shared VisionProc";
        goto LABEL_138;
      case 28:
        *(void *)__str = 116;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = v7[2];
        *(_DWORD *)__str = v7[3];
        *(_DWORD *)__str = *((_DWORD *)v7 + 2);
        *(_DWORD *)__str = *((_DWORD *)v7 + 3);
        *(_DWORD *)__str = *((_DWORD *)v7 + 4);
        *(_DWORD *)__str = *((_DWORD *)v7 + 5);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6);
        *(_DWORD *)__str = *((_DWORD *)v7 + 14);
        *(_DWORD *)__str = *((_DWORD *)v7 + 15);
        *(_DWORD *)__str = v7[14];
        *(_DWORD *)__str = v7[15];
        *(double *)__str = (double)*((int *)v7 + 8) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 9) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 10) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 11) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 12) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 13) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 16) * 0.03125;
        *(_DWORD *)__str = *((_DWORD *)v7 + 18);
        *(_DWORD *)__str = v7[34];
        *(_DWORD *)__str = *((_DWORD *)v7 + 19);
        *(_DWORD *)__str = *((_DWORD *)v7 + 20);
        v8 = "Shared Projector";
        goto LABEL_138;
      case 29:
        *(void *)__str = 456;
        *(_DWORD *)__str = *(_DWORD *)v7;
        *(_DWORD *)__str = *((_DWORD *)v7 + 1);
        v8 = "Shared BodyDetector";
        goto LABEL_138;
      case 30:
        *(void *)__str = 156;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = v7[6];
        *(_DWORD *)__str = v7[7];
        *(_DWORD *)__str = v7[8];
        *(_DWORD *)__str = v7[9];
        *(_DWORD *)__str = *((_DWORD *)v7 + 5);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7);
        *(_DWORD *)__str = *((_DWORD *)v7 + 8);
        *(_DWORD *)__str = *((_DWORD *)v7 + 9);
        *(_DWORD *)__str = *((_DWORD *)v7 + 12);
        *(_DWORD *)__str = *((_DWORD *)v7 + 13);
        *(_DWORD *)__str = *((_DWORD *)v7 + 14);
        *(_DWORD *)__str = *((_DWORD *)v7 + 15);
        *(_DWORD *)__str = v7[34];
        *(_DWORD *)__str = *((_DWORD *)v7 + 18);
        *(_DWORD *)__str = *((_DWORD *)v7 + 19);
        *(_DWORD *)__str = *((_DWORD *)v7 + 20);
        *(_DWORD *)__str = *((_DWORD *)v7 + 21);
        *(_DWORD *)__str = *((_DWORD *)v7 + 22);
        *(_DWORD *)__str = *((_DWORD *)v7 + 25);
        *(_DWORD *)__str = *((_DWORD *)v7 + 26);
        v8 = "Shared Distortion";
        goto LABEL_138;
      case 31:
        *(void *)__str = 1024;
        v8 = "BodyDetector Debug";
        goto LABEL_138;
      case 32:
        *(void *)__str = 1453212;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        v8 = "PDE Debug";
        goto LABEL_138;
      case 33:
        *(void *)__str = 44;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(double *)__str = (double)*((int *)v7 + 3) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 4) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 5) * 0.03125;
        *(double *)__str = (double)*((int *)v7 + 6) * 0.03125;
        *(_DWORD *)__str = *((_DWORD *)v7 + 7);
        *(_DWORD *)__str = *((_DWORD *)v7 + 8);
        *(_DWORD *)__str = *((_DWORD *)v7 + 9);
        *(_DWORD *)__str = *((_DWORD *)v7 + 10);
        v8 = "Shared Powersupply";
        goto LABEL_138;
      case 34:
        *(void *)__str = 2224;
        *(_DWORD *)__str = *((_DWORD *)v7 + 555);
        *(_DWORD *)__str = 0;
        if (*((_DWORD *)v7 + 555))
        {
          unint64_t v98 = 0;
          v99 = v7;
          do
          {
            LODWORD(__p[0]) = *v99;
            LODWORD(__p[0]) = v99[1];
            LODWORD(__p[0]) = *((_DWORD *)v99 + 1);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 2);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 3);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 4);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 5);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 6);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 7);
            LODWORD(__p[0]) = v99[16];
            LODWORD(__p[0]) = v99[17];
            LODWORD(__p[0]) = *((_DWORD *)v99 + 9);
            LODWORD(__p[0]) = v99[20];
            LODWORD(__p[0]) = v99[21];
            LODWORD(__p[0]) = v99[22];
            LODWORD(__p[0]) = *((_DWORD *)v99 + 164);
            LODWORD(__p[0]) = *((unsigned __int8 *)v99 + 51);
            LODWORD(__p[0]) = v99[24];
            LODWORD(__p[0]) = *((_DWORD *)v99 + 13);
            LODWORD(__p[0]) = (__int16)v99[28];
            LODWORD(__p[0]) = v99[29];
            LODWORD(__p[0]) = *((_DWORD *)v99 + 15);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 16);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 17);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 18);
            LODWORD(__p[0]) = *((_DWORD *)v99 + 19);
            LODWORD(__p[0]) = v99[40];
            LODWORD(__p[0]) = v99[327];
            *(_DWORD *)__str = ++v98;
            v99 += 370;
          }
          while (v98 < *((unsigned int *)v7 + 555));
        }
        v8 = "Shared Multi Slave";
        goto LABEL_138;
      case 35:
        *(void *)__str = 10032;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)__str = v7[2];
        v8 = "Shared FD DCN";
        goto LABEL_138;
      case 36:
        *(void *)__str = 4212;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)__str = (*(_DWORD *)v7 >> 18) & 1;
        *(_DWORD *)__str = (*(_DWORD *)v7 >> 19) & 1;
        *(_DWORD *)__str = (*(_DWORD *)v7 >> 20) & 1;
        *(_DWORD *)__str = (*(_DWORD *)v7 >> 21) & 1;
        *(_DWORD *)__str = *((_DWORD *)v7 + 1);
        *(_DWORD *)__str = *((_DWORD *)v7 + 2);
        v8 = "Shared FID DCN";
        goto LABEL_138;
      case 37:
        *(void *)__str = 1036;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = v7[2];
        *(_DWORD *)__str = v7[3];
        *(_DWORD *)__str = v7[4];
        *(_DWORD *)__str = v7[5];
        v8 = "Shared YCC Histogram";
        goto LABEL_138;
      case 38:
        *(void *)__str = 148024;
        *(_DWORD *)__str = *v7;
        v8 = "Shared FD DCN Debug";
        goto LABEL_138;
      case 39:
        *(void *)__str = 695440;
        *(_DWORD *)__str = *v7;
        v8 = "Shared FID DCN Debug";
        goto LABEL_138;
      case 40:
        *(void *)__str = 1788;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = HIWORD(*(_DWORD *)v7) & 1;
        *(_DWORD *)__str = (*(_DWORD *)v7 >> 17) & 1;
        *(_DWORD *)__str = *((_DWORD *)v7 + 1);
        v8 = "Shared Attention";
        goto LABEL_138;
      case 41:
        *(void *)__str = 246036;
        *(_DWORD *)__str = *v7;
        v8 = "Shared Attention Debug";
        goto LABEL_138;
      case 42:
        *(void *)__str = 2945604;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        v8 = "Shared IR PDP Debug";
        goto LABEL_138;
      case 43:
        *(void *)__str = 3848;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = *((_DWORD *)v7 + 1);
        v8 = "Shared MasterSlave AF";
        goto LABEL_138;
      case 44:
        *(void *)__str = 480;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = v7[2];
        *(_DWORD *)__str = *((_DWORD *)v7 + 2);
        *(_DWORD *)__str = v7[6];
        *(_DWORD *)__str = *((_DWORD *)v7 + 6);
        *(_DWORD *)__str = v7[14];
        *(_DWORD *)__str = v7[15];
        *(_DWORD *)__str = (__int16)v7[36];
        if (*((_DWORD *)v7 + 91))
        {
          *(_DWORD *)__str = v7[186];
          *(_DWORD *)__str = v7[187];
          *(_DWORD *)__str = (__int16)v7[208];
        }
        *(_DWORD *)__str = v7[38];
        *(_DWORD *)__str = v7[39];
        *(_DWORD *)__str = v7[40];
        *(_DWORD *)__str = (__int16)v7[41];
        *(_DWORD *)__str = v7[7];
        *(_DWORD *)__str = v7[8];
        *(_DWORD *)__str = v7[42];
        *(_DWORD *)__str = *((_DWORD *)v7 + 22);
        *(_DWORD *)__str = *((_DWORD *)v7 + 23);
        *(_DWORD *)__str = *((_DWORD *)v7 + 24);
        *(_DWORD *)__str = *((_DWORD *)v7 + 25);
        *(_DWORD *)__str = *((_DWORD *)v7 + 26);
        *(_DWORD *)__str = v7[37];
        v8 = "Shared PDE";
        goto LABEL_138;
      case 45:
        *(void *)__str = 182884;
        *(_DWORD *)__str = *(_DWORD *)v7;
        *(_DWORD *)__str = *((_DWORD *)v7 + 9);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 40);
        *(_DWORD *)__str = *((_DWORD *)v7 + 49);
        *(_DWORD *)__str = *((_DWORD *)v7 + 52);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 212);
        *(_DWORD *)__str = *((_DWORD *)v7 + 105);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 824);
        *(_DWORD *)__str = *((_DWORD *)v7 + 207);
        *(_DWORD *)__str = *((_DWORD *)v7 + 208);
        *(_DWORD *)__str = *((_DWORD *)v7 + 209);
        *(_DWORD *)__str = *((_DWORD *)v7 + 210);
        *(_DWORD *)__str = *((_DWORD *)v7 + 213);
        *(_DWORD *)__str = *((_DWORD *)v7 + 215);
        *(_DWORD *)__str = *((_DWORD *)v7 + 221);
        *(_DWORD *)__str = *((_DWORD *)v7 + 222);
        *(_DWORD *)__str = *((_DWORD *)v7 + 223);
        *(_DWORD *)__str = *((_DWORD *)v7 + 224);
        *(_DWORD *)__str = *((_DWORD *)v7 + 225);
        *(_DWORD *)__str = *((_DWORD *)v7 + 226);
        *(_DWORD *)__str = *((_DWORD *)v7 + 227);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 912);
        *(_DWORD *)__str = v7[457];
        *(_DWORD *)__str = v7[458];
        *(_DWORD *)__str = v7[459];
        *(_DWORD *)__str = v7[460];
        *(_DWORD *)__str = v7[461];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 940);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 956);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 957);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 958);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 959);
        *(_DWORD *)__str = *((_DWORD *)v7 + 240);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 964);
        *(_DWORD *)__str = *((_DWORD *)v7 + 242);
        *(_DWORD *)__str = *((_DWORD *)v7 + 243);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 992);
        *(_DWORD *)__str = (__int16)v7[497];
        *(_DWORD *)__str = *((_DWORD *)v7 + 249);
        *(_DWORD *)__str = *((_DWORD *)v7 + 250);
        *(_DWORD *)__str = v7[1182];
        *(_DWORD *)__str = *((_DWORD *)v7 + 6052);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25556);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25557);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25558);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25559);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25560);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25561);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25562);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25563);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25564);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25565);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25566);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25567);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25568);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25569);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25570);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25571);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25572);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25573);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25574);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25575);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25656);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25664);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25665);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25666);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25667);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25668);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 25669);
        *(_DWORD *)__str = (int)*((float *)v7 + 6422);
        *(_DWORD *)__str = (int)*((float *)v7 + 6711);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6985);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6986);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6987);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6988);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6994);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6995);
        *(_DWORD *)__str = *((_DWORD *)v7 + 6997);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7000);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7005);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7014);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7015);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7020);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7021);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7025);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7026);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7027);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7028);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7534);
        *(_DWORD *)__str = *((_DWORD *)v7 + 7535);
        v8 = "Shared CBAF Debug";
        goto LABEL_138;
      case 46:
        *(void *)__str = 131136;
        v8 = "Shared PDAFHW Debug";
        goto LABEL_138;
      case 47:
        *(void *)__str = 316;
        v8 = "Shared CRC Check";
        goto LABEL_138;
      case 48:
        *(void *)__str = 24;
        v8 = "Shared Calibration";
        goto LABEL_138;
      case 49:
        *(void *)__str = 32;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = (int)*((float *)v7 + 1);
        *(_DWORD *)__str = (int)*((float *)v7 + 2);
        *(_DWORD *)__str = (int)*((float *)v7 + 3);
        *(_DWORD *)__str = (int)*((float *)v7 + 4);
        *(_DWORD *)__str = (int)*((float *)v7 + 5);
        *(_DWORD *)__str = (int)*((float *)v7 + 6);
        v8 = "Shared Motion Stats";
        goto LABEL_138;
      case 50:
        *(void *)__str = 116;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = (int)*((float *)v7 + 1);
        *(_DWORD *)__str = (int)*((float *)v7 + 2);
        *(_DWORD *)__str = (int)*((float *)v7 + 3);
        v8 = "Shared APS Stats";
        goto LABEL_138;
      case 51:
        *(void *)__str = 256;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = (int)*((float *)v7 + 1);
        *(_DWORD *)__str = (int)*((float *)v7 + 4);
        *(_DWORD *)__str = (int)*((float *)v7 + 5);
        v8 = "Shared OIS Stats";
        goto LABEL_138;
      case 52:
        goto LABEL_138;
      case 53:
        v8 = "Shared AiCam Debug";
        goto LABEL_138;
      case 54:
        *(void *)__str = 64;
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = *(void *)(v7 + 2);
        *(_DWORD *)__str = v7[1];
        *(_DWORD *)__str = *((_DWORD *)v7 + 3);
        LOWORD(v87) = v7[8];
        *(double *)__str = (double)v87 * 0.00390625;
        LODWORD(v88) = *((_DWORD *)v7 + 9);
        *(double *)__str = (double)v88 * 0.00390625;
        LOWORD(v89) = v7[10];
        *(double *)__str = (double)v89 * 0.00390625;
        LOWORD(v9pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7[11];
        *(double *)__str = (double)v90 * 0.000244140625;
        LOWORD(v91) = v7[12];
        *(double *)__str = (double)v91 * 0.0009765625;
        *(_DWORD *)__str = v7[25];
        *(_DWORD *)__str = v7[26];
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 60);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 59);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 61);
        v8 = "Shared SIFR";
        goto LABEL_138;
      case 55:
        *(_DWORD *)__str = *(_DWORD *)v7;
        *(_DWORD *)__str = *((_DWORD *)v7 + 1);
        v8 = "Shared FPC";
        goto LABEL_138;
      case 56:
        *(_DWORD *)__str = *v7;
        *(_DWORD *)__str = v7[1];
        v8 = "Shared Reduced APS";
        goto LABEL_138;
      case 62:
        *(void *)__str = 264;
        *(_DWORD *)__str = *(unsigned __int8 *)v7;
        *(_DWORD *)__str = *(void *)(v7 + 2);
        *(_DWORD *)__str = (int)*((float *)v7 + 9);
        *(_DWORD *)__str = (int)*((float *)v7 + 10);
        *(_DWORD *)__str = (int)*((float *)v7 + 4);
        *(_DWORD *)__str = (int)*((float *)v7 + 5);
        *(_DWORD *)__str = (int)*((float *)v7 + 6);
        *(_DWORD *)__str = (int)*((float *)v7 + 17);
        *(_DWORD *)__str = (int)*((float *)v7 + 18);
        *(_DWORD *)__str = (int)*((float *)v7 + 19);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 44);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 88);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 89);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 45);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 13);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 12);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 1);
        *(_DWORD *)__str = (int)*((float *)v7 + 8);
        *(_DWORD *)__str = (int)*((float *)v7 + 20);
        *(_DWORD *)__str = (int)*((float *)v7 + 21);
        *(_DWORD *)__str = (int)*((float *)v7 + 26);
        *(_DWORD *)__str = (int)*((float *)v7 + 27);
        *(_DWORD *)__str = (int)*((float *)v7 + 28);
        *(_DWORD *)__str = *((unsigned __int8 *)v7 + 101);
        *(_DWORD *)__str = (__int16)v7[23];
        *(_DWORD *)__str = *((_DWORD *)v7 + 12);
        *(_DWORD *)__str = (__int16)v7[26];
        *(_DWORD *)__str = *((_DWORD *)v7 + 14);
        *(_DWORD *)__str = (int)*((float *)v7 + 15);
        v8 = "Shared Auto Focus Assist Debug";
        goto LABEL_138;
      case 69:
        *(_OWORD *)__str = 0u;
        memset(v132, 0, 48);
        NamedValues::NamedValues((NamedValues *)__p);
        for (uint64_t i = 0; i != 256; ++i)
        {
          snprintf(__str, 0x40uLL, "ch0[%03d]", i);
          *(_DWORD *)v130 = *(_DWORD *)&v7[2 * i];
        }
        NamedValues::NamedValues((NamedValues *)v130);
        for (uint64_t j = 0; j != 256; ++j)
        {
          snprintf(__str, 0x40uLL, "ch1[%03d]", j);
          *(_DWORD *)v129 = *(_DWORD *)(a1 + 1024 + v5 + 4 * j);
        }
        NamedValues::NamedValues((NamedValues *)v129);
        for (uint64_t k = 0; k != 256; ++k)
        {
          snprintf(__str, 0x40uLL, "ch2[%03d]", k);
          *(_DWORD *)v126 = *(_DWORD *)(a1 + 2048 + v5 + 4 * k);
        }
        NamedValues::~NamedValues((NamedValues *)v129);
        NamedValues::~NamedValues((NamedValues *)v130);
        NamedValues::~NamedValues((NamedValues *)__p);
        v8 = "Shared Stats BE Histogram";
        goto LABEL_138;
      case 78:
        *(void *)__str = 288;
        v8 = "Shared Depth to Position Debug";
        goto LABEL_138;
      default:
        goto LABEL_139;
    }
  }
LABEL_141:
  CFTypeRef v115 = cf;
  CFRetain(cf);
  NamedValues::~NamedValues((NamedValues *)&v121);
  NamedValues::~NamedValues((NamedValues *)&cf);
  return v115;
}

void sub_2505ED61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, int a19, __int16 a20,char a21,char a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,char a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35,char a36,int a37,__int16 a38,char a39,char a40,int a41,__int16 a42,char a43,char a44)
{
}

void anonymous namespace'::AppendMetadataList(__CFArray **this, NamedValues *a2, __CFArray **a3, NamedValues *a4)
{
  NamedValue::NamedValue((NamedValue *)&v5, (const char *)a2, 0, *a3);
  NamedValues::push_back(this, &v5);
  NamedValue::~NamedValue((NamedValue *)&v5);
}

void sub_2505ED9C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  NamedValue::~NamedValue((NamedValue *)va);
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned long>(__CFArray **a1)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v8);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v9, __p);
  if (v6 >= 0) {
    v2 = __p;
  }
  else {
    v2 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v7, "size", (const char *)v2, 0);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v7);
  NamedValue::~NamedValue((NamedValue *)&v7);
  v8[0] = *MEMORY[0x263F8C2B8];
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v8 + *(void *)(v8[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v8[2] = v3;
  v9[0] = MEMORY[0x263F8C318] + 16;
  if (v10 < 0) {
    operator delete((void *)v9[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v11);
}

void sub_2505EDB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned short>(__CFArray **a1, const char *a2, _WORD *a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v17);
  if (a4 == 1)
  {
    char v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(void *)(*v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v10 + *(void *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3) {
    v8 = "yes";
  }
  else {
    v8 = "no";
  }
  if (*a3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v19, __p);
  if (v15 >= 0) {
    uint64_t v11 = __p;
  }
  else {
    uint64_t v11 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v16, a2, (const char *)v11, 0);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v16);
  NamedValue::~NamedValue((NamedValue *)&v16);
  v17[0] = *MEMORY[0x263F8C2B8];
  uint64_t v12 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v18 = v12;
  v19[0] = MEMORY[0x263F8C318] + 16;
  if (v20 < 0) {
    operator delete((void *)v19[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v21);
}

void sub_2505EDE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned long long>(__CFArray **a1, const char *a2, uint64_t a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  if (a4 == 1)
  {
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v15, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  }
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v16, __p);
  if (v12 >= 0) {
    v8 = __p;
  }
  else {
    v8 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v13, a2, (const char *)v8, 0);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v13);
  NamedValue::~NamedValue((NamedValue *)&v13);
  v14[0] = *MEMORY[0x263F8C2B8];
  uint64_t v9 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v15 = v9;
  v16[0] = MEMORY[0x263F8C318] + 16;
  if (v17 < 0) {
    operator delete((void *)v16[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v18);
}

void sub_2505EE078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned int>(__CFArray **a1, const char *a2, _DWORD *a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v17);
  if (a4 == 1)
  {
    char v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(void *)(*v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v10 + *(void *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3) {
    v8 = "yes";
  }
  else {
    v8 = "no";
  }
  if (*a3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v19, __p);
  if (v15 >= 0) {
    uint64_t v11 = __p;
  }
  else {
    uint64_t v11 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v16, a2, (const char *)v11, 0);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v16);
  NamedValue::~NamedValue((NamedValue *)&v16);
  v17[0] = *MEMORY[0x263F8C2B8];
  uint64_t v12 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v18 = v12;
  v19[0] = MEMORY[0x263F8C318] + 16;
  if (v20 < 0) {
    operator delete((void *)v19[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v21);
}

void sub_2505EE300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  uint64_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 12pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 24;
  return a1;
}

void sub_2505EE5F0(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x2533802A0](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2533802A0](a1 + 128);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x253380190](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x2533801A0](v13);
  return a1;
}

void sub_2505EE88C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x2533801A0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2505EE86CLL);
}

void sub_2505EE8E0(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      unint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_2505EEA60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265350710, MEMORY[0x263F8C060]);
}

void sub_2505EEB88(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  CFArrayRef result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

uint64_t anonymous namespace'::AppendMetadataItem<char const*>(__CFArray **a1, const char *a2, const char **a3)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  size_t v6 = *a3;
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v15, (uint64_t)v6, v7);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v16, __p);
  if (v12 >= 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v13, a2, (const char *)v8, 0);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v13);
  NamedValue::~NamedValue((NamedValue *)&v13);
  v14[0] = *MEMORY[0x263F8C2B8];
  uint64_t v9 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v15 = v9;
  v16[0] = MEMORY[0x263F8C318] + 16;
  if (v17 < 0) {
    operator delete((void *)v16[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v18);
}

void sub_2505EEE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<unsigned char>(__CFArray **a1, const char *a2, unsigned char *a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  if (a4 == 3)
  {
    if (*a3) {
      uint64_t v8 = "on";
    }
    else {
      uint64_t v8 = "off";
    }
    if (*a3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 3;
    }
    goto LABEL_15;
  }
  if (a4 == 2)
  {
    if (*a3) {
      uint64_t v8 = "yes";
    }
    else {
      uint64_t v8 = "no";
    }
    if (*a3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
LABEL_15:
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)v8, v9);
    goto LABEL_17;
  }
  LOBYTE(__p[0]) = *a3;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)__p, 1);
LABEL_17:
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v18, __p);
  if (v14 >= 0) {
    uint64_t v10 = __p;
  }
  else {
    uint64_t v10 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v15, a2, (const char *)v10, 0);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v15);
  NamedValue::~NamedValue((NamedValue *)&v15);
  v16[0] = *MEMORY[0x263F8C2B8];
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v16 + *(void *)(v16[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v17 = v11;
  v18[0] = MEMORY[0x263F8C318] + 16;
  if (v19 < 0) {
    operator delete((void *)v18[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v20);
}

void sub_2505EF10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<int>(__CFArray **a1, const char *a2, uint64_t a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  if (a4 == 1)
  {
    size_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v15, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  }
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v16, __p);
  if (v12 >= 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v13, a2, (const char *)v8, 0);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v13);
  NamedValue::~NamedValue((NamedValue *)&v13);
  v14[0] = *MEMORY[0x263F8C2B8];
  uint64_t v9 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v15 = v9;
  v16[0] = MEMORY[0x263F8C318] + 16;
  if (v17 < 0) {
    operator delete((void *)v16[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v18);
}

void sub_2505EF360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<double>(__CFArray **a1, const char *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v10);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v11, __p);
  if (v8 >= 0) {
    unint64_t v4 = __p;
  }
  else {
    unint64_t v4 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v9, a2, (const char *)v4, 0);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v9);
  NamedValue::~NamedValue((NamedValue *)&v9);
  v10[0] = *MEMORY[0x263F8C2B8];
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v10 + *(void *)(v10[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v10[2] = v5;
  v11[0] = MEMORY[0x263F8C318] + 16;
  if (v12 < 0) {
    operator delete((void *)v11[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v13);
}

void sub_2505EF560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<short>(__CFArray **a1, const char *a2, _WORD *a3, int a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v17);
  if (a4 == 1)
  {
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)"0x", 2);
    *(_DWORD *)((char *)v10 + *(void *)(*v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v10 + *(void *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_11:
    std::ostream::operator<<();
    goto LABEL_12;
  }
  if (*a3) {
    char v8 = "yes";
  }
  else {
    char v8 = "no";
  }
  if (*a3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)v8, v9);
LABEL_12:
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v19, __p);
  if (v15 >= 0) {
    uint64_t v11 = __p;
  }
  else {
    uint64_t v11 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v16, a2, (const char *)v11, 0);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v16);
  NamedValue::~NamedValue((NamedValue *)&v16);
  v17[0] = *MEMORY[0x263F8C2B8];
  uint64_t v12 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v18 = v12;
  v19[0] = MEMORY[0x263F8C318] + 16;
  if (v20 < 0) {
    operator delete((void *)v19[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v21);
}

void sub_2505EF7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<char [4]>(__CFArray **a1, const char *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v11, (uint64_t)"...", 3);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v12, __p);
  if (v8 >= 0) {
    unint64_t v4 = __p;
  }
  else {
    unint64_t v4 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v9, a2, (const char *)v4, 0);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v9);
  NamedValue::~NamedValue((NamedValue *)&v9);
  v10[0] = *MEMORY[0x263F8C2B8];
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v10 + *(void *)(v10[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v11 = v5;
  v12[0] = MEMORY[0x263F8C318] + 16;
  if (v13 < 0) {
    operator delete((void *)v12[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v14);
}

void sub_2505EF9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<float>(__CFArray **a1, const char *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v10);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v11, __p);
  if (v8 >= 0) {
    unint64_t v4 = __p;
  }
  else {
    unint64_t v4 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v9, a2, (const char *)v4, 0);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v9);
  NamedValue::~NamedValue((NamedValue *)&v9);
  v10[0] = *MEMORY[0x263F8C2B8];
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v10 + *(void *)(v10[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  void v10[2] = v5;
  v11[0] = MEMORY[0x263F8C318] + 16;
  if (v12 < 0) {
    operator delete((void *)v11[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v13);
}

void sub_2505EFBEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem<eCIspFocusingMethod>(__CFArray **a1)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v8);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v9, __p);
  if (v6 >= 0) {
    uint64_t v2 = __p;
  }
  else {
    uint64_t v2 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v7, "lastFocusingMethod", (const char *)v2, 0);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(a1, &v7);
  NamedValue::~NamedValue((NamedValue *)&v7);
  v8[0] = *MEMORY[0x263F8C2B8];
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v8 + *(void *)(v8[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v8[2] = v3;
  v9[0] = MEMORY[0x263F8C318] + 16;
  if (v10 < 0) {
    operator delete((void *)v9[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v11);
}

void sub_2505EFDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t anonymous namespace'::AppendMetadataItem(__CFArray **this, NamedValues *a2, const char *a3, double a4, double a5, double a6)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v16);
  *(void *)((char *)&v18[1] + *(void *)(v17 - 24)) = 5;
  char v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", ", 2);
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", ", 2);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v18, __p);
  if (v14 >= 0) {
    char v10 = __p;
  }
  else {
    char v10 = (void **)__p[0];
  }
  NamedValue::NamedValue((NamedValue *)&v15, (const char *)a2, (const char *)v10, 0);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  NamedValues::push_back(this, &v15);
  NamedValue::~NamedValue((NamedValue *)&v15);
  v16[0] = *MEMORY[0x263F8C2B8];
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v16 + *(void *)(v16[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v17 = v11;
  v18[0] = MEMORY[0x263F8C318] + 16;
  if (v19 < 0) {
    operator delete((void *)v18[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2533802A0](&v20);
}

void sub_2505F0058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
}

void ISPStopwatch::ISPStopwatch(ISPStopwatch *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  mach_timebase_info((mach_timebase_info_t)this + 2);
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  mach_timebase_info((mach_timebase_info_t)this + 2);
}

uint64_t ISPStopwatch::start(uint64_t this)
{
  if (!*(void *)(this + 8))
  {
    uint64_t v1 = this;
    this = mach_absolute_time();
    *(void *)(v1 + 8) = this;
  }
  return this;
}

uint64_t ISPStopwatch::stop(uint64_t this)
{
  unint64_t v1 = *(void *)(this + 8);
  if (v1)
  {
    uint64_t v2 = (void *)this;
    this = mach_absolute_time();
    unint64_t v3 = -(uint64_t)v1;
    if (this < v1) {
      unint64_t v3 = ~v1;
    }
    *v2 += this + v3;
    v2[1] = 0;
  }
  return this;
}

uint64_t ISPStopwatch::getDeltaTicks(ISPStopwatch *this, uint64_t a2)
{
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = -(uint64_t)a2;
  if (v3 < a2) {
    uint64_t v4 = ~a2;
  }
  return v4 + v3;
}

void *ISPStopwatch::reset(void *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

uint64_t ISPStopwatch::getTicks(ISPStopwatch *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *((void *)this + 1);
  if (v2)
  {
    uint64_t v3 = mach_absolute_time();
    uint64_t v4 = -(uint64_t)v2;
    if (v3 < v2) {
      uint64_t v4 = ~v2;
    }
    v1 += v3 + v4;
  }
  return v1;
}

unint64_t ISPStopwatch::getNs(ISPStopwatch *this)
{
  uint64_t v2 = *(void *)this;
  uint64_t v3 = *((void *)this + 1);
  if (v3)
  {
    uint64_t v4 = mach_absolute_time();
    uint64_t v5 = -(uint64_t)v3;
    if (v4 < v3) {
      uint64_t v5 = ~v3;
    }
    v2 += v4 + v5;
  }
  return v2 * (unint64_t)*((unsigned int *)this + 4) / *((unsigned int *)this + 5);
}

unint64_t ISPStopwatch::getMs(ISPStopwatch *this)
{
  return (unint64_t)((double)ISPStopwatch::getNs(this) / 1000000.0);
}

unint64_t ISPStopwatch::getSec(ISPStopwatch *this)
{
  return (unint64_t)((double)ISPStopwatch::getNs(this) / 1000000000.0);
}

void H16ISP::H16ISPAppendNamedValuesToCFString(__CFString *this, __CFString *a2, const __CFArray *a3, const __CFArray *a4)
{
  unsigned int v4 = a4;
  int v5 = (int)a2;
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v7 = 0;
    unsigned int v21 = v4;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
      CFDictionaryRef v9 = Name(ValueAtIndex);
      CFDictionaryRef v10 = Value(ValueAtIndex);
      CFDictionaryRef v11 = List(ValueAtIndex);
      if (v9)
      {
        BOOL v12 = CFStringGetCString((CFStringRef)v9, buffer, 256, 0x8000100u) != 0;
        if (!v10) {
          goto LABEL_12;
        }
      }
      else
      {
        BOOL v12 = 0;
        if (!v10)
        {
LABEL_12:
          BOOL v16 = !v12;
          char v15 = (char *)&unk_25060908B;
          if (v16) {
            char v14 = (char *)&unk_25060908B;
          }
          else {
            char v14 = buffer;
          }
          goto LABEL_15;
        }
      }
      int CString = CFStringGetCString((CFStringRef)v10, v24, 256, 0x8000100u);
      if (v12) {
        char v14 = buffer;
      }
      else {
        char v14 = (char *)&unk_25060908B;
      }
      if (CString) {
        char v15 = v24;
      }
      else {
        char v15 = (char *)&unk_25060908B;
      }
LABEL_15:
      int v17 = v5;
      if (v5 >= 1)
      {
        do
        {
          CFStringAppendCString(this, "    ", 0x8000100u);
          --v17;
        }
        while (v17);
      }
      if (v11)
      {
        if (v21)
        {
          CFStringAppendCString(this, "<name>", 0x8000100u);
          CFStringAppendCString(this, v14, 0x8000100u);
          CFStringAppendCString(this, "</name>", 0x8000100u);
          char v14 = "<value>";
        }
        CFStringAppendCString(this, v14, 0x8000100u);
        CFStringAppendCString(this, "\n", 0x8000100u);
        H16ISP::H16ISPAppendNamedValuesToCFString((H16ISP *)this, (__CFString *)(v5 + 1), (int)v11, (const __CFArray *)v21, v18);
        if (!v5) {
          CFStringAppendCString(this, "\n", 0x8000100u);
        }
        char v19 = "</value>\n";
        if ((v21 & 1) == 0) {
          goto LABEL_37;
        }
      }
      else
      {
        if (v9) {
          LODWORD(v9) = CFStringGetLength((CFStringRef)v9);
        }
        if (v21)
        {
          CFStringAppendCString(this, "<name>", 0x8000100u);
          CFStringAppendCString(this, v14, 0x8000100u);
          char v14 = "</name>";
        }
        CFStringAppendCString(this, v14, 0x8000100u);
        if ((int)v9 <= 37)
        {
          if (((38 - v9) & ~((38 - (int)v9) >> 31)) <= 1) {
            int v20 = 1;
          }
          else {
            int v20 = (38 - v9) & ~((38 - (int)v9) >> 31);
          }
          do
          {
            CFStringAppendCString(this, " ", 0x8000100u);
            --v20;
          }
          while (v20);
        }
        CFStringAppendCString(this, "\t", 0x8000100u);
        if (v21)
        {
          CFStringAppendCString(this, "<value>", 0x8000100u);
          CFStringAppendCString(this, v15, 0x8000100u);
          char v15 = "</value>";
        }
        CFStringAppendCString(this, v15, 0x8000100u);
        char v19 = "\n";
      }
      CFStringAppendCString(this, v19, 0x8000100u);
LABEL_37:
      ++v7;
    }
    while (v7 != Count);
  }
}

__CFString *H16ISP::H16ISPCreateFrameMetaDataAsCFString(unsigned __int16 *a1, const __CFArray *a2)
{
  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable) {
    return @"Apple H16 MetaData\n";
  }
  int v5 = Mutable;
  CFStringAppendCString(Mutable, "Apple H16 Metadata\n", 0x8000100u);
  if (!a1)
  {
    CFDictionaryRef v9 = "No additional frame metadata.\n";
LABEL_10:
    CFStringAppendCString(v5, v9, 0x8000100u);
    return v5;
  }
  uint64_t v6 = *a1;
  if (v6 != 4142)
  {
    CFStringAppendFormat(v5, 0, @"Mismatched frame metadata versions! Expected: 0x%08X, Found: 0x%08X", 4142, v6);
    return v5;
  }
  CFArrayRef FormatedMetadata = (const __CFArray *)H16ISP::CreateFormatedMetadata((uint64_t)a1);
  if (!FormatedMetadata)
  {
    CFDictionaryRef v9 = "Frame metadata could not be formatted.\n";
    goto LABEL_10;
  }
  CFArrayRef v8 = FormatedMetadata;
  H16ISP::H16ISPAppendNamedValuesToCFString(v5, 0, FormatedMetadata, a2);
  CFRelease(v8);
  return v5;
}

__CFDictionary *H16ISP::H16ISPCreateFrameMetaDataAsCFDictionary(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFArrayRef FormatedMetadata = (const __CFArray *)H16ISP::CreateFormatedMetadata(a1);
  if (FormatedMetadata)
  {
    CFArrayRef v5 = FormatedMetadata;
    CFIndex Count = CFArrayGetCount(FormatedMetadata);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      CFDictionaryRef v9 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
      CFDictionaryRef v10 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
        CFDictionaryRef v12 = List(ValueAtIndex);
        if (v12)
        {
          uint64_t v13 = v12;
          char v14 = CFDictionaryCreateMutable(v2, 0, v9, v10);
          H16ISP::AddMetadataToDictionary(v14, v13, v15);
          CFDictionaryRef v16 = Name(ValueAtIndex);
          CFDictionaryAddValue(Mutable, v16, v14);
          CFRelease(v14);
        }
        else
        {
          CFDictionaryRef v17 = Name(ValueAtIndex);
          CFDictionaryRef v18 = Value(ValueAtIndex);
          CFDictionaryAddValue(Mutable, v17, v18);
        }
        ++v8;
      }
      while (v7 != v8);
    }
  }
  return Mutable;
}

const __CFArray *H16ISP::AddMetadataToDictionary(H16ISP *this, __CFDictionary *a2, __CFArray *a3)
{
  CFArrayRef result = CountNamedValues(a2);
  if ((int)result >= 1)
  {
    int v6 = 0;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFIndex v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    CFDictionaryRef v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    do
    {
      CFArrayRef NamedValue = GetNamedValue(a2, v6);
      CFDictionaryRef v11 = List(NamedValue);
      if (v11)
      {
        CFDictionaryRef v12 = v11;
        Mutable = CFDictionaryCreateMutable(v7, 0, v8, v9);
        H16ISP::AddMetadataToDictionary(Mutable, v12, v14);
        CFDictionaryRef v15 = Name(NamedValue);
        CFDictionaryAddValue(this, v15, Mutable);
        CFRelease(Mutable);
      }
      else
      {
        CFDictionaryRef v16 = Name(NamedValue);
        CFDictionaryRef v17 = Value(NamedValue);
        CFDictionaryAddValue(this, v16, v17);
      }
      ++v6;
      CFArrayRef result = CountNamedValues(a2);
    }
    while (v6 < (int)result);
  }
  return result;
}

__CFDictionary *H16ISP::H16ISPCreateEXIFDictFromMetadataDict(H16ISP *this, const __CFDictionary *a2, int a3)
{
  int v56 = (int)a2;
  int v55 = a3;
  uint64_t valuePtr = 0;
  CFTypeRef cf = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFNumberRef v6 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
    CFTypeRef cf = v6;
    if (v6)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0F4C8], v6);
      CFRelease(cf);
    }
    CFMutableDictionaryRef v7 = CFDictionaryCreateMutable(v4, 18, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v7)
    {
      CFIndex v8 = v7;
      if (v56 && v55)
      {
        CFNumberRef v9 = CFNumberCreate(v4, kCFNumberSInt32Type, &v56);
        CFTypeRef cf = v9;
        if (v9)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2E8], v9);
          CFRelease(cf);
        }
        CFNumberRef v10 = CFNumberCreate(v4, kCFNumberSInt32Type, &v55);
        CFTypeRef cf = v10;
        if (v10)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2F0], v10);
          CFRelease(cf);
        }
      }
      if (this)
      {
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D090], &cf))
        {
          double v51 = 0.0;
          long double v52 = 0.0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat64Type, &v51);
          double v50 = 0.0;
          if (v51 > 0.0) {
            double v50 = 1.0 / (double)(int)(1.0 / v51 + 0.5);
          }
          CFNumberRef v11 = CFNumberCreate(v4, kCFNumberFloat64Type, &v50);
          if (v11)
          {
            CFNumberRef v12 = v11;
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F270], cf);
            CFRelease(v12);
          }
          if (v51 > 0.0) {
            long double v52 = -log2(v51);
          }
          CFNumberRef v13 = CFNumberCreate(v4, kCFNumberFloat64Type, &v52);
          CFTypeRef cf = v13;
          if (v13)
          {
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F310], v13);
            CFRelease(cf);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D108], &cf))
        {
          double v51 = 0.0;
          long double v52 = 0.0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat64Type, &v52);
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F278], cf);
          if (v52 > 0.0)
          {
            long double v14 = log2(v52);
            double v51 = v14 + v14;
          }
          CFNumberRef v15 = CFNumberCreate(v4, kCFNumberFloat64Type, &v51);
          CFTypeRef cf = v15;
          if (v15)
          {
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F1B8], v15);
            CFRelease(cf);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D208], &cf))
        {
          LOWORD(v52) = 0;
          uint64_t v16 = 2u;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &v52);
          __int16 v17 = 12;
          while (SLOWORD(v52) > (*(__int16 *)((char *)&unk_25060AD18 + v16) + v17) >> 1)
          {
            __int16 v17 = *(_WORD *)((char *)&unk_25060AD18 + v16);
            v16 += 2;
            if (v16 == 64) {
              goto LABEL_32;
            }
          }
          LOWORD(v52) = v17;
LABEL_32:
          CFTypeRef cf = CFNumberCreate(v4, kCFNumberSInt16Type, &v52);
          if (cf)
          {
            CFArrayRef v18 = CFArrayCreate(v4, &cf, 1, MEMORY[0x263EFFF70]);
            CFRelease(cf);
            if (v18)
            {
              CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F298], v18);
              CFRelease(v18);
            }
          }
        }
        if (CFDictionaryGetValueIfPresent(this, @"FocusWindow", &cf))
        {
          LODWORD(v52) = 0;
          LOWORD(v51) = 0;
          LOWORD(v5pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
          int v49 = 0;
          CFMutableArrayRef v19 = CFArrayCreateMutable(v4, 4, MEMORY[0x263EFFF70]);
          if (v19)
          {
            int v20 = v19;
            CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 0);
            CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &v52);
            LOWORD(v51) = v56 * LODWORD(v52) / 0x3E8u;
            CFNumberRef v22 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 1);
            CFNumberGetValue(v22, kCFNumberIntType, &v52);
            LOWORD(v5pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v55 * LODWORD(v52) / 0x3E8u;
            CFNumberRef v23 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 2);
            CFNumberGetValue(v23, kCFNumberIntType, &v52);
            HIWORD(v49) = v56 * LODWORD(v52) / 0x3E8u;
            CFNumberRef v24 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)cf, 3);
            CFNumberGetValue(v24, kCFNumberIntType, &v52);
            LOWORD(v49) = v55 * LODWORD(v52) / 0x3E8u;
            LOWORD(v51) += (__int16)(HIWORD(v49) + (HIWORD(v49) >> 15)) >> 1;
            LOWORD(v50) += (__int16)(v49 + (((v55 * LODWORD(v52) / 0x3E8u) & 0x8000) >> 15)) >> 1;
            CFNumberRef v25 = CFNumberCreate(v4, kCFNumberShortType, &v51);
            if (v25)
            {
              CFNumberRef v26 = v25;
              CFArrayAppendValue(v20, v25);
              CFRelease(v26);
            }
            CFNumberRef v27 = CFNumberCreate(v4, kCFNumberShortType, &v50);
            if (v27)
            {
              CFNumberRef v28 = v27;
              CFArrayAppendValue(v20, v27);
              CFRelease(v28);
            }
            CFNumberRef v29 = CFNumberCreate(v4, kCFNumberShortType, (char *)&v49 + 2);
            if (v29)
            {
              CFNumberRef v30 = v29;
              CFArrayAppendValue(v20, v29);
              CFRelease(v30);
            }
            CFNumberRef v31 = CFNumberCreate(v4, kCFNumberShortType, &v49);
            if (v31)
            {
              CFNumberRef v32 = v31;
              CFArrayAppendValue(v20, v31);
              CFRelease(v32);
            }
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F328], v20);
            CFRelease(v20);
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D508], &cf))
        {
          LODWORD(v52) = -1;
          LODWORD(v51) = 0;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &v52);
          if ((LODWORD(v52) & 0x80000000) == 0)
          {
            if (LODWORD(v52) > 8)
            {
              int v33 = LODWORD(v52) > 0xC ? 2 : 1;
              LODWORD(v51) = v33;
            }
            else
            {
              LODWORD(v51) = 0;
            }
            CFNumberRef v34 = CFNumberCreate(v4, kCFNumberSInt32Type, &v51);
            if (v34)
            {
              CFNumberRef v35 = v34;
              CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F308], v34);
              CFRelease(v35);
            }
          }
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D118], &cf)) {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F290], cf);
        }
        int ValueIfPresent = CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D658], &cf);
        unint64_t v37 = (const void **)MEMORY[0x263F0F350];
        if (ValueIfPresent) {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F350], cf);
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D110], &cf)) {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F288], cf);
        }
        if (CFDictionaryGetValueIfPresent(this, (const void *)*MEMORY[0x263F2D258], &cf)) {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2A0], cf);
        }
        HIDWORD(valuePtr) = 1;
        if (CFDictionaryGetValueIfPresent(this, @"MeteringMode", &cf)) {
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, (char *)&valuePtr + 4);
        }
        CFNumberRef v38 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&valuePtr + 4);
        CFTypeRef cf = v38;
        if (v38)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2C8], v38);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 2;
        CFNumberRef v39 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v39;
        if (v39)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F268], v39);
          CFRelease(cf);
        }
        CFTypeRef cf = @"H16ISP Test Application";
        CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2C0], @"H16ISP Test Application");
        CFRelease(cf);
        LODWORD(valuePtr) = 0;
        if (CFDictionaryGetValueIfPresent(this, @"GlobalShutterFlag", &cf))
        {
          LODWORD(v52) = -1;
          CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &v52);
        }
        LODWORD(valuePtr) = 32;
        CFNumberRef v40 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v40;
        if (v40)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F280], v40);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 2;
        CFNumberRef v41 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v41;
        if (v41)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F300], v41);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 1;
        CFNumberRef v42 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v42;
        if (v42)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F2F8], v42);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 0;
        CFNumberRef v43 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v43;
        if (v43)
        {
          CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F260], v43);
          CFRelease(cf);
        }
        LODWORD(valuePtr) = 0;
        CFNumberRef v44 = CFNumberCreate(v4, kCFNumberSInt32Type, &valuePtr);
        CFTypeRef cf = v44;
        if (v44)
        {
          CFDictionaryAddValue(v8, *v37, v44);
          CFRelease(cf);
        }
        CFDataRef Value = (const __CFData *)CFDictionaryGetValue(this, (const void *)*MEMORY[0x263F2D410]);
        if (Value)
        {
          BytePtr = (unsigned __int16 *)CFDataGetBytePtr(Value);
          if (BytePtr)
          {
            v47 = H16ISP::H16ISPCreateFrameMetaDataAsCFString(BytePtr, 0);
            CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F0F340], v47);
            CFRelease(v47);
          }
        }
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0F248], v8);
      }
      CFRelease(v8);
    }
  }
  return Mutable;
}

uint64_t ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 48) >= 9u) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(*(_DWORD *)(a2 + 48));
  }
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 52) >= 4u) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(*(_DWORD *)(a2 + 52));
  }
  tb_message_encode_u32();
  return tb_message_encode_BOOL();
}

uint64_t ispirexclavekitmodule_ispexclavecorechrunkitaerslt__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 0;
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 52) = 0;
  return tb_message_decode_BOOL();
}

uint64_t ispirexclavekitmodule_ispexclavecorechrunkitaersltv2__encode(uint64_t a1, unsigned int *a2)
{
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (a2[13] >= 9) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(a2[13]);
  }
  tb_message_encode_u32();
  if (a2[14] >= 4) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(a2[14]);
  }
  tb_message_encode_u32();
  if (a2[15] >= 3) {
    ispirexclavekitmodule_ispexclavecorechrunkitaersltv2__encode_cold_1(a2[15]);
  }
  return tb_message_encode_u32();
}

uint64_t ispirexclavekitmodule_ispexclavecorechrunkitaersltv2__decode(uint64_t a1, _DWORD *a2)
{
  tb_message_decode_u32();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  a2[13] = 0;
  tb_message_decode_u32();
  a2[14] = 0;
  tb_message_decode_u32();
  uint64_t result = 0;
  a2[15] = 0;
  return result;
}

uint64_t ispirexclavekitmodule_ispexclavecorechsensormetadata__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s16();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 72) >= 9u) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(*(_DWORD *)(a2 + 72));
  }
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 76) >= 4u) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(*(_DWORD *)(a2 + 76));
  }
  tb_message_encode_u32();
  tb_message_encode_u32();
  return tb_message_encode_u32();
}

uint64_t ispirexclavekitmodule_ispexclavecorechsensormetadata__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 72) = 0;
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 76) = 0;
  tb_message_decode_u32();
  return tb_message_decode_u32();
}

uint64_t ispirexclavekitmodule_ispexclavecorechsensormetadata2__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s16();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 72) >= 9u) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(*(_DWORD *)(a2 + 72));
  }
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 76) >= 4u) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(*(_DWORD *)(a2 + 76));
  }
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_BOOL();
  for (uint64_t i = 0; i != 36; i += 4)
    uint64_t result = tb_message_encode_f32();
  return result;
}

uint64_t ispirexclavekitmodule_ispexclavecorechsensormetadata2__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s16();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 72) = 0;
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 76) = 0;
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_BOOL();
  for (uint64_t i = 0; i != 36; i += 4)
    uint64_t result = tb_message_decode_f32();
  return result;
}

uint64_t ispirexclavekitmodule_ispexclavecorechsensormetadatav3__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s16();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 80) >= 9u) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(*(_DWORD *)(a2 + 80));
  }
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 84) >= 4u) {
    ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(*(_DWORD *)(a2 + 84));
  }
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_BOOL();
  for (uint64_t i = 0; i != 36; i += 4)
    tb_message_encode_f32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  return tb_message_encode_u32();
}

uint64_t ispirexclavekitmodule_ispexclavecorechsensormetadatav3__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u64();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s16();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 8pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 84) = 0;
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_BOOL();
  for (uint64_t i = 0; i != 36; i += 4)
    tb_message_decode_f32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  return tb_message_decode_u32();
}

uint64_t ispirexclavekitmodule_ispexclavecoreexclavechcameraconfigset__encode()
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u16();
  tb_message_encode_u32();
  tb_message_encode_u8();
  tb_message_encode_u16();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u32();
  return tb_message_encode_u32();
}

uint64_t ispirexclavekitmodule_ispexclavecorechinfoset__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_BOOL();
  if (*(_DWORD *)(a2 + 12) >= 4u) {
    ispirexclavekitmodule_ispexclavecorechinfoset__encode_cold_1(*(_DWORD *)(a2 + 12));
  }
  tb_message_encode_u32();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s8();
  for (uint64_t i = 0; i != 12; i += 4)
    uint64_t result = tb_message_encode_f32();
  return result;
}

uint64_t ispirexclavekitmodule_ispexclavecorechinfoset__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_BOOL();
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 12) = 0;
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s8();
  for (uint64_t i = 0; i != 12; i += 4)
    uint64_t result = tb_message_decode_f32();
  return result;
}

uint64_t ispirexclavekitmodule_ispexclavecorechinfoset2__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_BOOL();
  if (*(_DWORD *)(a2 + 12) >= 4u) {
    ispirexclavekitmodule_ispexclavecorechinfoset__encode_cold_1(*(_DWORD *)(a2 + 12));
  }
  tb_message_encode_u32();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s8();
  for (uint64_t i = 0; i != 12; i += 4)
    tb_message_encode_f32();
  for (uint64_t j = 0; j != 12; j += 4)
    tb_message_encode_f32();
  for (uint64_t k = 0; k != 36; k += 4)
    tb_message_encode_f32();
  for (uint64_t m = 0; m != 12; m += 4)
    tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 116) >= 0x11u) {
    ispirexclavekitmodule_ispexclavecorechinfoset2__encode_cold_1(*(_DWORD *)(a2 + 116));
  }
  return tb_message_encode_u32();
}

uint64_t ispirexclavekitmodule_ispexclavecorechinfoset2__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_BOOL();
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 12) = 0;
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s8();
  for (uint64_t i = 0; i != 12; i += 4)
    tb_message_decode_f32();
  for (uint64_t j = 0; j != 12; j += 4)
    tb_message_decode_f32();
  for (uint64_t k = 0; k != 36; k += 4)
    tb_message_decode_f32();
  for (uint64_t m = 0; m != 12; m += 4)
    tb_message_decode_f32();
  tb_message_decode_u32();
  uint64_t result = 0;
  *(_DWORD *)(a2 + 116) = 0;
  return result;
}

uint64_t ispirexclavekitmodule_sepipelscconfig__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  uint64_t v3 = a2 + 24;
  uint64_t v4 = 11328;
  do
  {
    v3 += 2;
    uint64_t result = tb_message_encode_u16();
    --v4;
  }
  while (v4);
  return result;
}

uint64_t ispirexclavekitmodule_sepipelscconfig__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  uint64_t v3 = a2 + 24;
  uint64_t v4 = 11328;
  do
  {
    uint64_t result = tb_message_decode_u16();
    v3 += 2;
    --v4;
  }
  while (v4);
  return result;
}

uint64_t ispirexclavekitmodule_sepipepdpconfig__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u8();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  for (uint64_t i = 5; i != 1161; ++i)
    tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u16();
  tb_message_encode_u16();
  uint64_t v4 = a2 + 4656;
  uint64_t v5 = 16;
  do
  {
    tb_message_encode_BOOL();
    tb_message_encode_u8();
    tb_message_encode_u16();
    v4 += 6;
    tb_message_encode_u16();
    --v5;
  }
  while (v5);
  uint64_t v6 = -64;
  do
  {
    tb_message_encode_u16();
    tb_message_encode_u16();
    v6 += 4;
  }
  while (v6);
  uint64_t v7 = -64;
  do
  {
    tb_message_encode_u16();
    tb_message_encode_u16();
    v7 += 4;
  }
  while (v7);
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u16();
  return tb_message_encode_u16();
}

uint64_t ispirexclavekitmodule_sepipepdpconfig__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u8();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  uint64_t v3 = a2 + 20;
  uint64_t v4 = 1156;
  do
  {
    tb_message_decode_u32();
    v3 += 4;
    --v4;
  }
  while (v4);
  tb_message_decode_u32();
  tb_message_decode_u16();
  tb_message_decode_u16();
  uint64_t v5 = a2 + 4652;
  uint64_t v6 = 16;
  do
  {
    tb_message_decode_BOOL();
    tb_message_decode_u8();
    tb_message_decode_u16();
    tb_message_decode_u16();
    v5 += 6;
    --v6;
  }
  while (v6);
  uint64_t v7 = a2 + 4748;
  uint64_t v8 = 16;
  do
  {
    tb_message_decode_u16();
    tb_message_decode_u16();
    v7 += 4;
    --v8;
  }
  while (v8);
  uint64_t v9 = a2 + 4812;
  uint64_t v10 = 16;
  do
  {
    tb_message_decode_u16();
    tb_message_decode_u16();
    v9 += 4;
    --v10;
  }
  while (v10);
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u16();
  return tb_message_decode_u16();
}

uint64_t ispirexclavekitmodule_ispexclavecorechdpcset__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  for (uint64_t i = 0; i != 36; i += 12)
  {
    tb_message_encode_u32();
    tb_message_encode_u32();
    if (*(_DWORD *)(a2 + i + 16) >= 4u) {
      ispirexclavekitmodule_ispexclavecorechdpcset__encode_cold_1(*(_DWORD *)(a2 + i + 16));
    }
    tb_message_encode_u32();
  }
  for (uint64_t j = 0; j != 4096; j += 4)
    uint64_t result = tb_message_encode_u32();
  return result;
}

uint64_t ispirexclavekitmodule_ispexclavecorechdpcset__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  for (uint64_t i = 0; i != 36; i += 12)
  {
    tb_message_decode_u32();
    tb_message_decode_u32();
    tb_message_decode_u32();
    *(_DWORD *)(a2 + i + 16) = 0;
  }
  for (uint64_t j = 0; j != 4096; j += 4)
    uint64_t result = tb_message_decode_u32();
  return result;
}

uint64_t ispirexclavekitmodule_attentioninfo__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_BOOL();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 44) >= 5u) {
    ispirexclavekitmodule_attentioninfo__encode_cold_1(*(_DWORD *)(a2 + 44));
  }
  return tb_message_encode_u32();
}

uint64_t ispirexclavekitmodule_attentioninfo__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_BOOL();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  uint64_t result = 0;
  *(_DWORD *)(a2 + 44) = 0;
  return result;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdon()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdoff()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchstart()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchstop()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchinfoset(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    ispirexclavekitmodule_ispexclavecorechinfoset__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchisconcurrent()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_BOOL();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchinfoset2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    ispirexclavekitmodule_ispexclavecorechinfoset2__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 8) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 8));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchalgoenable()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitae(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchsensormetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    ispirexclavekitmodule_ispexclavecorechsensormetadata__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdexclavechcameraconfigset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    ispirexclavekitmodule_ispexclavecoreexclavechcameraconfigset__encode();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeframeratemaxset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeframerateminset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaegaincapset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeintegrationtimemaxset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeupdateresume()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeupdatesuspend()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeintegrationgainset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeinitsettingget()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdaeflickerfreqset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_encode_u8();
    tb_message_encode_u32();
    tb_message_encode_u16();
    tb_message_encode_f32();
    tb_message_encode_u8();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchlscset(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    ispirexclavekitmodule_sepipelscconfig__encode((uint64_t)v5, a2 + 4);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchpdpset(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    ispirexclavekitmodule_sepipepdpconfig__encode((uint64_t)v5, a2 + 4);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeframeratemaxget()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeframerateminget()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchdpcset(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    ispirexclavekitmodule_ispexclavecorechdpcset__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchsensormetadata2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    ispirexclavekitmodule_ispexclavecorechsensormetadata2__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchsensormetadatav3(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    ispirexclavekitmodule_ispexclavecorechsensormetadatav3__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitaev2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeintegrationgainsetv2()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchaeinitsettinggetv2()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkiter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchconfigurationstatusread(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if (*(_DWORD *)(a2 + 4) >= 8u) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchconfigurationstatusread_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitfd(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitad(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitmd(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitmdv2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitanst(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdexclavebootarg(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    if (*a2 >= 3) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdexclavebootarg_cold_1(*a2);
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdexclavechpropertywrite(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    unsigned int v4 = *(_DWORD *)(a2 + 4);
    if (v4 - 16 >= 0x30 && v4 >= 0xF) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdexclavechpropertywrite_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdexclavechpropertyread(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    unsigned int v4 = *(_DWORD *)(a2 + 4);
    if (v4 - 16 >= 0x30 && v4 >= 0xF) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdexclavechpropertywrite_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmddebugcapability()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdadsettings(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    if (*a2 >= 2) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdadsettings_cold_1(*a2);
    }
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitattn(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    if ((*(_DWORD *)(a2 + 4) - 1) >= 7) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdexclaveisphwirq()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdinfiltration(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    if (*a2 >= 2) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdinfiltration_cold_1(*a2);
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_sendcmdexfiltration(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    if (*a2 >= 2) {
      ispirexclavekitmodule_ispirexclavekit_sendcmdinfiltration_cold_1(*a2);
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_init(uint64_t *a1)
{
  tb_endpoint_set_interface_identifier();
  uint64_t v2 = tb_client_connection_create_with_endpoint();
  uint64_t result = tb_client_connection_activate();
  if (!result) {
    *a1 = v2;
  }
  return result;
}

uint64_t ispirexclavekitmodule_ispirexclavekit_init_static(void *a1, uint64_t a2, uint64_t a3)
{
  tb_endpoint_set_interface_identifier();
  uint64_t result = tb_client_connection_create_with_endpoint_static();
  if (!result)
  {
    uint64_t result = tb_client_connection_activate();
    if (!result) {
      *a1 = a3;
    }
  }
  return result;
}

void *ispirexclavekitmodule_ispirexclavekit__copy(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void ispirexclavekitmodule_ispirexclavekit__destruct()
{
}

uint64_t ispirexclavekitmodule_ispirexclavekit_server_start(uint64_t a1)
{
  return ispirexclavekitmodule_ispirexclavekit__server_start_owned(a1, &v2);
}

uint64_t ispirexclavekitmodule_ispirexclavekit__server_start_owned(uint64_t a1, uint64_t *a2)
{
  *a2 = tb_service_connection_create_with_endpoint();
  return tb_service_connection_activate();
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke()
{
}

void ispirexclavekitmodule_ispirexclavekit__server_stop()
{
}

uint64_t ispirexclavekitmodule_ispexclaveproperty__decode(uint64_t a1, _DWORD *a2)
{
  tb_message_decode_u32();
  uint64_t result = 0;
  *a2 = 0;
  return result;
}

uint64_t isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 48) >= 9u) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(*(_DWORD *)(a2 + 48));
  }
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 52) >= 4u) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(*(_DWORD *)(a2 + 52));
  }
  tb_message_encode_u32();
  return tb_message_encode_BOOL();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 0;
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 52) = 0;
  return tb_message_decode_BOOL();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechrunkitaersltv2__encode(uint64_t a1, unsigned int *a2)
{
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (a2[13] >= 9) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(a2[13]);
  }
  tb_message_encode_u32();
  if (a2[14] >= 4) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(a2[14]);
  }
  tb_message_encode_u32();
  if (a2[15] >= 3) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaersltv2__encode_cold_1(a2[15]);
  }
  return tb_message_encode_u32();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechrunkitaersltv2__decode(uint64_t a1, _DWORD *a2)
{
  tb_message_decode_u32();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  a2[13] = 0;
  tb_message_decode_u32();
  a2[14] = 0;
  tb_message_decode_u32();
  uint64_t result = 0;
  a2[15] = 0;
  return result;
}

uint64_t isprgbexclavekitmodule_ispexclavecorechsensormetadata__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s16();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 72) >= 9u) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(*(_DWORD *)(a2 + 72));
  }
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 76) >= 4u) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(*(_DWORD *)(a2 + 76));
  }
  tb_message_encode_u32();
  tb_message_encode_u32();
  return tb_message_encode_u32();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechsensormetadata__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 72) = 0;
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 76) = 0;
  tb_message_decode_u32();
  return tb_message_decode_u32();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechsensormetadata2__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s16();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 72) >= 9u) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(*(_DWORD *)(a2 + 72));
  }
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 76) >= 4u) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(*(_DWORD *)(a2 + 76));
  }
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_BOOL();
  for (uint64_t i = 0; i != 36; i += 4)
    uint64_t result = tb_message_encode_f32();
  return result;
}

uint64_t isprgbexclavekitmodule_ispexclavecorechsensormetadata2__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s16();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 72) = 0;
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 76) = 0;
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_BOOL();
  for (uint64_t i = 0; i != 36; i += 4)
    uint64_t result = tb_message_decode_f32();
  return result;
}

uint64_t isprgbexclavekitmodule_ispexclavecorechsensormetadatav3__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u64();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s16();
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 80) >= 9u) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(*(_DWORD *)(a2 + 80));
  }
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 84) >= 4u) {
    isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(*(_DWORD *)(a2 + 84));
  }
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_BOOL();
  for (uint64_t i = 0; i != 36; i += 4)
    tb_message_encode_f32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_u32();
  return tb_message_encode_u32();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechsensormetadatav3__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u64();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s16();
  tb_message_decode_u64();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 8pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 84) = 0;
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_BOOL();
  for (uint64_t i = 0; i != 36; i += 4)
    tb_message_decode_f32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_u32();
  return tb_message_decode_u32();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechinfoset__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_BOOL();
  if (*(_DWORD *)(a2 + 12) >= 4u) {
    isprgbexclavekitmodule_ispexclavecorechinfoset__encode_cold_1(*(_DWORD *)(a2 + 12));
  }
  tb_message_encode_u32();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  return tb_message_encode_s8();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechinfoset__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 12) = 0;
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  return tb_message_decode_s8();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechinfoset2__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_BOOL();
  if (*(_DWORD *)(a2 + 12) >= 4u) {
    isprgbexclavekitmodule_ispexclavecorechinfoset__encode_cold_1(*(_DWORD *)(a2 + 12));
  }
  tb_message_encode_u32();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u16();
  tb_message_encode_u32();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s8();
  for (uint64_t i = 0; i != 12; i += 4)
    tb_message_encode_f32();
  for (uint64_t j = 0; j != 12; j += 4)
    tb_message_encode_f32();
  for (uint64_t k = 0; k != 36; k += 4)
    tb_message_encode_f32();
  for (uint64_t m = 0; m != 12; m += 4)
    tb_message_encode_f32();
  if (*(_DWORD *)(a2 + 116) >= 0x11u) {
    isprgbexclavekitmodule_ispexclavecorechinfoset2__encode_cold_1(*(_DWORD *)(a2 + 116));
  }
  return tb_message_encode_u32();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechinfoset2__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_BOOL();
  tb_message_decode_u32();
  *(_DWORD *)(a2 + 12) = 0;
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u16();
  tb_message_decode_u32();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s8();
  for (uint64_t i = 0; i != 12; i += 4)
    tb_message_decode_f32();
  for (uint64_t j = 0; j != 12; j += 4)
    tb_message_decode_f32();
  for (uint64_t k = 0; k != 36; k += 4)
    tb_message_decode_f32();
  for (uint64_t m = 0; m != 12; m += 4)
    tb_message_decode_f32();
  tb_message_decode_u32();
  uint64_t result = 0;
  *(_DWORD *)(a2 + 116) = 0;
  return result;
}

uint64_t isprgbexclavekitmodule_ispexclavecorechdpcset__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  for (uint64_t i = 0; i != 36; i += 12)
  {
    tb_message_encode_u32();
    tb_message_encode_u32();
    if (*(_DWORD *)(a2 + i + 16) >= 4u) {
      isprgbexclavekitmodule_ispexclavecorechdpcset__encode_cold_1(*(_DWORD *)(a2 + i + 16));
    }
    tb_message_encode_u32();
  }
  for (uint64_t j = 0; j != 4096; j += 4)
    uint64_t result = tb_message_encode_u32();
  return result;
}

uint64_t isprgbexclavekitmodule_ispexclavecorechdpcset__decode(uint64_t a1, uint64_t a2)
{
  tb_message_decode_u32();
  tb_message_decode_u32();
  for (uint64_t i = 0; i != 36; i += 12)
  {
    tb_message_decode_u32();
    tb_message_decode_u32();
    tb_message_decode_u32();
    *(_DWORD *)(a2 + i + 16) = 0;
  }
  for (uint64_t j = 0; j != 4096; j += 4)
    uint64_t result = tb_message_decode_u32();
  return result;
}

uint64_t isprgbexclavekitmodule_anstobject__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 4) >= 0xAu) {
    isprgbexclavekitmodule_anstobject__encode_cold_1(*(_DWORD *)(a2 + 4));
  }
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  return tb_message_encode_u32();
}

uint64_t isprgbexclavekitmodule_anstobject__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = 0;
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  return tb_message_decode_u32();
}

uint64_t isprgbexclavekitmodule_anstface__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 4) >= 0xAu) {
    isprgbexclavekitmodule_anstobject__encode_cold_1(*(_DWORD *)(a2 + 4));
  }
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_u8();
  tb_message_encode_f32();
  return tb_message_encode_u8();
}

uint64_t isprgbexclavekitmodule_anstface__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = 0;
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_u8();
  tb_message_decode_f32();
  return tb_message_decode_u8();
}

uint64_t isprgbexclavekitmodule_anstobjectv150__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 8) >= 0xAu) {
    isprgbexclavekitmodule_anstobject__encode_cold_1(*(_DWORD *)(a2 + 8));
  }
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_u32();
  return tb_message_encode_f32();
}

uint64_t isprgbexclavekitmodule_anstobjectv150__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 8) = 0;
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  return tb_message_decode_f32();
}

uint64_t isprgbexclavekitmodule_anstfacev150__encode(uint64_t a1, uint64_t a2)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  if (*(_DWORD *)(a2 + 8) >= 0xAu) {
    isprgbexclavekitmodule_anstobject__encode_cold_1(*(_DWORD *)(a2 + 8));
  }
  tb_message_encode_u32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_u32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_s32();
  tb_message_encode_u8();
  tb_message_encode_f32();
  return tb_message_encode_u8();
}

uint64_t isprgbexclavekitmodule_anstfacev150__decode(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 8) = 0;
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_u32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_s32();
  tb_message_decode_u8();
  tb_message_decode_f32();
  return tb_message_decode_u8();
}

uint64_t isprgbexclavekitmodule_runkitfaceprocessanimation__encode()
{
  for (uint64_t i = 0; i != 204; i += 4)
    tb_message_encode_f32();
  for (uint64_t j = 0; j != 12; j += 4)
    tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  tb_message_encode_f32();
  return tb_message_encode_f32();
}

uint64_t isprgbexclavekitmodule_runkitfaceprocessanimation__decode()
{
  for (uint64_t i = 0; i != 204; i += 4)
    tb_message_decode_f32();
  for (uint64_t j = 0; j != 12; j += 4)
    tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  tb_message_decode_f32();
  return tb_message_decode_f32();
}

uint64_t isprgbexclavekitmodule_runkitfaceprocesstrackedface__encode()
{
  tb_message_encode_f32();
  tb_message_encode_f64();
  tb_message_encode_f64();
  tb_message_encode_f64();
  tb_message_encode_f64();
  tb_message_encode_f32();
  for (uint64_t i = 0; i != 16; ++i)
    tb_message_encode_u8();
  tb_message_encode_s32();
  isprgbexclavekitmodule_runkitfaceprocessanimation__encode();
  for (uint64_t j = 0; j != 36; j += 4)
    tb_message_encode_f32();
  for (uint64_t k = 0; k != 12; k += 4)
    tb_message_encode_f32();
  isprgbexclavekitmodule_runkitfaceprocessanimation__encode();
  for (uint64_t m = 0; m != 36; m += 4)
    tb_message_encode_f32();
  for (uint64_t n = 0; n != 12; n += 4)
    tb_message_encode_f32();
  for (iuint64_t i = 0; ii != 528; ii += 4)
    tb_message_encode_f32();
  for (juint64_t j = 0; jj != 12; jj += 4)
    tb_message_encode_f32();
  for (kuint64_t k = 0; kk != 12; kk += 4)
    uint64_t result = tb_message_encode_f32();
  return result;
}

uint64_t isprgbexclavekitmodule_runkitfaceprocesstrackedface__decode()
{
  tb_message_decode_f32();
  tb_message_decode_f64();
  tb_message_decode_f64();
  tb_message_decode_f64();
  tb_message_decode_f64();
  tb_message_decode_f32();
  for (uint64_t i = 0; i != 16; ++i)
    tb_message_decode_u8();
  tb_message_decode_s32();
  isprgbexclavekitmodule_runkitfaceprocessanimation__decode();
  for (uint64_t j = 0; j != 36; j += 4)
    tb_message_decode_f32();
  for (uint64_t k = 0; k != 12; k += 4)
    tb_message_decode_f32();
  isprgbexclavekitmodule_runkitfaceprocessanimation__decode();
  for (uint64_t m = 0; m != 36; m += 4)
    tb_message_decode_f32();
  for (uint64_t n = 0; n != 12; n += 4)
    tb_message_decode_f32();
  for (iuint64_t i = 0; ii != 528; ii += 4)
    tb_message_decode_f32();
  for (juint64_t j = 0; jj != 12; jj += 4)
    tb_message_decode_f32();
  for (kuint64_t k = 0; kk != 12; kk += 4)
    uint64_t result = tb_message_decode_f32();
  return result;
}

uint64_t isprgbexclavekitmodule_ispexclavecorechrunkitfaceprocessrslt__encode()
{
  tb_message_encode_BOOL();
  tb_message_encode_BOOL();
  for (uint64_t i = 4; i != 16; i += 4)
    tb_message_encode_u32();
  tb_message_encode_f64();
  for (uint64_t j = 24; j != 60; j += 4)
    tb_message_encode_f32();
  for (uint64_t k = 0; k != 12; k += 4)
    tb_message_encode_f32();
  for (uint64_t m = 0; m != 36; m += 4)
    tb_message_encode_f32();
  for (uint64_t n = 0; n != 200; n += 40)
  {
    tb_message_encode_f32();
    tb_message_encode_f64();
    tb_message_encode_f64();
    tb_message_encode_f64();
    tb_message_encode_f64();
  }
  for (iuint64_t i = 312; ii != 3960; ii += 1216)
    isprgbexclavekitmodule_runkitfaceprocesstrackedface__encode();
  tb_message_encode_BOOL();
  return tb_message_encode_BOOL();
}

uint64_t isprgbexclavekitmodule_ispexclavecorechrunkitfaceprocessrslt__decode()
{
  tb_message_decode_BOOL();
  tb_message_decode_BOOL();
  for (uint64_t i = 4; i != 16; i += 4)
    tb_message_decode_u32();
  tb_message_decode_f64();
  for (uint64_t j = 24; j != 60; j += 4)
    tb_message_decode_f32();
  for (uint64_t k = 0; k != 12; k += 4)
    tb_message_decode_f32();
  for (uint64_t m = 0; m != 36; m += 4)
    tb_message_decode_f32();
  uint64_t v4 = -200;
  do
  {
    tb_message_decode_f32();
    tb_message_decode_f64();
    tb_message_decode_f64();
    tb_message_decode_f64();
    tb_message_decode_f64();
    v4 += 40;
  }
  while (v4);
  for (uint64_t n = 312; n != 3960; n += 1216)
    isprgbexclavekitmodule_runkitfaceprocesstrackedface__decode();
  tb_message_decode_BOOL();
  return tb_message_decode_BOOL();
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdon()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdoff()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchstart()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchstop()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchinfoset(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    isprgbexclavekitmodule_ispexclavecorechinfoset__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchisconcurrent()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_BOOL();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchinfoset2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    isprgbexclavekitmodule_ispexclavecorechinfoset2__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 8);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 8));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchalgoenable()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitae(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchsensormetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    isprgbexclavekitmodule_ispexclavecorechsensormetadata__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavechcameraconfigset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u16();
    tb_message_encode_u32();
    tb_message_encode_u8();
    tb_message_encode_u16();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeframeratemaxset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeframerateminset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaegaincapset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeintegrationtimemaxset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeupdateresume()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeupdatesuspend()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeintegrationgainset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeinitsettingget()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdaeflickerfreqset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_encode_u8();
    tb_message_encode_u32();
    tb_message_encode_u16();
    tb_message_encode_f32();
    tb_message_encode_u8();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchlscset(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    ispirexclavekitmodule_sepipelscconfig__encode((uint64_t)v5, a2 + 4);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchpdpset(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    ispirexclavekitmodule_sepipepdpconfig__encode((uint64_t)v5, a2 + 4);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeframeratemaxget()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeframerateminget()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchdpcset(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    isprgbexclavekitmodule_ispexclavecorechdpcset__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchsensormetadata2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    isprgbexclavekitmodule_ispexclavecorechsensormetadata2__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchsensormetadatav3(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    isprgbexclavekitmodule_ispexclavecorechsensormetadatav3__encode((uint64_t)v5, a2);
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitaev2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeintegrationgainsetv2()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_encode_u16();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchaeinitsettinggetv2()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitanst(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitanstv150(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchfaceconfigset()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_BOOL();
    tb_message_encode_BOOL();
    tb_message_encode_BOOL();
    tb_message_encode_u32();
    tb_message_encode_BOOL();
    tb_message_encode_f32();
    tb_message_encode_f32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitfaceprocess(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitfacesecondaryprocess(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitperception(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchsetperceptionframerate()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitmd(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitmdv2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitandk(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    int v4 = *(_DWORD *)(a2 + 4);
    if ((v4 - 1) >= 7 && v4 != 9) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavebootarg(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    if (*a2 >= 3) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavebootarg_cold_1(*a2);
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavechpropertywrite(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    unsigned int v4 = *(_DWORD *)(a2 + 4);
    if (v4 - 16 >= 0x30 && v4 >= 0xF) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavechpropertywrite_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavechpropertyread(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    unsigned int v4 = *(_DWORD *)(a2 + 4);
    if (v4 - 16 >= 0x30 && v4 >= 0xF) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavechpropertywrite_cold_1(*(_DWORD *)(a2 + 4));
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmddebugcapability()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclaveisphwirq()
{
  uint64_t v0 = tb_client_connection_message_construct();
  if (!v0)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v0 = tb_connection_send_query();
    if ((v0 & 0xFFFFFFF7) == 0) {
      uint64_t v0 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v0;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdinfiltration(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    if (*a2 >= 2) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdinfiltration_cold_1(*a2);
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_sendcmdexfiltration(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = tb_client_connection_message_construct();
  if (!v3)
  {
    tb_message_encode_u64();
    if (*a2 >= 2) {
      isprgbexclavekitmodule_isprgbexclavekit_sendcmdinfiltration_cold_1(*a2);
    }
    tb_message_encode_u32();
    tb_message_complete();
    uint64_t v3 = tb_connection_send_query();
    if ((v3 & 0xFFFFFFF7) == 0) {
      uint64_t v3 = 4;
    }
    tb_client_connection_message_destruct();
  }
  return v3;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_init(uint64_t *a1)
{
  tb_endpoint_set_interface_identifier();
  uint64_t v2 = tb_client_connection_create_with_endpoint();
  uint64_t result = tb_client_connection_activate();
  if (!result) {
    *a1 = v2;
  }
  return result;
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_init_static(void *a1, uint64_t a2, uint64_t a3)
{
  tb_endpoint_set_interface_identifier();
  uint64_t result = tb_client_connection_create_with_endpoint_static();
  if (!result)
  {
    uint64_t result = tb_client_connection_activate();
    if (!result) {
      *a1 = a3;
    }
  }
  return result;
}

void *isprgbexclavekitmodule_isprgbexclavekit__copy(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void isprgbexclavekitmodule_isprgbexclavekit__destruct()
{
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit_server_start(uint64_t a1)
{
  return isprgbexclavekitmodule_isprgbexclavekit__server_start_owned(a1, &v2);
}

uint64_t isprgbexclavekitmodule_isprgbexclavekit__server_start_owned(uint64_t a1, uint64_t *a2)
{
  *a2 = tb_service_connection_create_with_endpoint();
  return tb_service_connection_activate();
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke()
{
}

void isprgbexclavekitmodule_isprgbexclavekit__server_stop()
{
}

uint64_t isprgbexclavekitmodule_ispexclaveproperty__decode(uint64_t a1, _DWORD *a2)
{
  tb_message_decode_u32();
  uint64_t result = 0;
  *a2 = 0;
  return result;
}

void ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechrunkitaerslt__decode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechrunkitaerslt__decode_cold_2(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechrunkitaersltv2__encode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechrunkitaersltv2__decode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechinfoset__encode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechinfoset__decode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechinfoset2__encode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechinfoset2__decode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechdpcset__encode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispexclavecorechdpcset__decode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_attentioninfo__encode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_attentioninfo__decode_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitisp_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispirexclavekit_sendcmdchconfigurationstatusread_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispirexclavekit_sendcmdchrunkitmdv2_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispirexclavekit_sendcmdexclavebootarg_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispirexclavekit_sendcmdexclavechpropertywrite_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispirexclavekit_sendcmdadsettings_cold_1(unsigned int a1)
{
}

void ispirexclavekitmodule_ispirexclavekit_sendcmdinfiltration_cold_1(unsigned int a1)
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_1(uint64_t a1)
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_2()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_3()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_4()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_6()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_8()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_10()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_12()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_14()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_16()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_18(unsigned int a1)
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_19()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_21()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_24()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_26()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_28()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_30()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_32()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_34()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_36()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_38()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_40()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_42()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_44()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_46()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_48()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_50()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_52()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_54()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_56()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_58()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_60()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_63()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_65()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_67()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_70()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_72(unsigned int a1)
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_73()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_76()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_79()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_82()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_83(unsigned int a1)
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_86()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_89()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_91(unsigned int a1)
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_92()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_94()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_97()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_99()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_101(unsigned int a1)
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_102()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_105()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_107()
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_109(unsigned int a1)
{
}

void __ispirexclavekitmodule_ispirexclavekit__server_start_owned_block_invoke_cold_110()
{
}

void ispirexclavekitmodule_ispexclaveproperty__decode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__encode_cold_2(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__decode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechrunkitaerslt__decode_cold_2(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechrunkitaersltv2__encode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechrunkitaersltv2__decode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechinfoset__encode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechinfoset__decode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechinfoset2__encode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechinfoset2__decode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechdpcset__encode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_ispexclavecorechdpcset__decode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_anstobject__encode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_anstobject__decode_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitisp_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitperception_cold_2(unsigned int a1)
{
}

void isprgbexclavekitmodule_isprgbexclavekit_sendcmdchrunkitmdv2_cold_2(unsigned int a1)
{
}

void isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavebootarg_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_isprgbexclavekit_sendcmdexclavechpropertywrite_cold_1(unsigned int a1)
{
}

void isprgbexclavekitmodule_isprgbexclavekit_sendcmdinfiltration_cold_1(unsigned int a1)
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_1(uint64_t a1)
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_4()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_6()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_8()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_10()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_12()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_14()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_16(unsigned int a1)
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_17()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_19()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_22()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_24()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_26()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_28()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_30()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_32()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_34()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_36()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_38()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_40()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_42()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_44()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_46()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_48()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_50()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_52()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_54()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_56()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_58()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_61()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_63()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_65()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_68()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_71()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_73()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_76()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_79()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_82()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_83(unsigned int a1)
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_85()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_88()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_91()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_92(unsigned int a1)
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_95()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_97()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_99(unsigned int a1)
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_100()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_102()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_105()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_107()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_109()
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_111(unsigned int a1)
{
}

void __isprgbexclavekitmodule_isprgbexclavekit__server_start_owned_block_invoke_cold_112()
{
}

void isprgbexclavekitmodule_ispexclaveproperty__decode_cold_1(unsigned int a1)
{
  printf("TB_FATAL: invalid value: unexpected case value, %llx (%s:%d)\n", a1, "/Library/Caches/com.apple.xbs/Binaries/AppleH16CameraInterface_NoKext/install/TempContent/Objects/AppleH16CameraInterface.build/H16ISPServices.build/DerivedSources/ExclaveKitRGBISPMgrInterface_tightbeam.c", 711);
  uint64_t v1 = (__CFArray *)_os_crash();
  __break(1u);
  CFArrayAppendValue(v1, v2);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
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

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987C8]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
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
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
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

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t tb_client_connection_activate()
{
  return MEMORY[0x270F7E0B0]();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return MEMORY[0x270F7E0C8]();
}

uint64_t tb_client_connection_create_with_endpoint_static()
{
  return MEMORY[0x270F7E0D0]();
}

uint64_t tb_client_connection_destruct()
{
  return MEMORY[0x270F7E0D8]();
}

uint64_t tb_client_connection_message_construct()
{
  return MEMORY[0x270F7E0E8]();
}

uint64_t tb_client_connection_message_destruct()
{
  return MEMORY[0x270F7E0F0]();
}

uint64_t tb_connection_send_query()
{
  return MEMORY[0x270F7E110]();
}

uint64_t tb_endpoint_set_interface_identifier()
{
  return MEMORY[0x270F7E128]();
}

uint64_t tb_message_complete()
{
  return MEMORY[0x270F7E140]();
}

uint64_t tb_message_decode_BOOL()
{
  return MEMORY[0x270F7E158]();
}

uint64_t tb_message_decode_f32()
{
  return MEMORY[0x270F7E170]();
}

uint64_t tb_message_decode_f64()
{
  return MEMORY[0x270F7E178]();
}

uint64_t tb_message_decode_s16()
{
  return MEMORY[0x270F7E188]();
}

uint64_t tb_message_decode_s32()
{
  return MEMORY[0x270F7E190]();
}

uint64_t tb_message_decode_s8()
{
  return MEMORY[0x270F7E198]();
}

uint64_t tb_message_decode_u16()
{
  return MEMORY[0x270F7E1A0]();
}

uint64_t tb_message_decode_u32()
{
  return MEMORY[0x270F7E1A8]();
}

uint64_t tb_message_decode_u64()
{
  return MEMORY[0x270F7E1B8]();
}

uint64_t tb_message_decode_u8()
{
  return MEMORY[0x270F7E1C8]();
}

uint64_t tb_message_encode_BOOL()
{
  return MEMORY[0x270F7E1D8]();
}

uint64_t tb_message_encode_f32()
{
  return MEMORY[0x270F7E1E0]();
}

uint64_t tb_message_encode_f64()
{
  return MEMORY[0x270F7E1F0]();
}

uint64_t tb_message_encode_s16()
{
  return MEMORY[0x270F7E1F8]();
}

uint64_t tb_message_encode_s32()
{
  return MEMORY[0x270F7E200]();
}

uint64_t tb_message_encode_s8()
{
  return MEMORY[0x270F7E208]();
}

uint64_t tb_message_encode_u16()
{
  return MEMORY[0x270F7E210]();
}

uint64_t tb_message_encode_u32()
{
  return MEMORY[0x270F7E220]();
}

uint64_t tb_message_encode_u64()
{
  return MEMORY[0x270F7E230]();
}

uint64_t tb_message_encode_u8()
{
  return MEMORY[0x270F7E238]();
}

uint64_t tb_service_connection_activate()
{
  return MEMORY[0x270F7E248]();
}

uint64_t tb_service_connection_create_with_endpoint()
{
  return MEMORY[0x270F7E250]();
}

uint64_t tb_service_connection_destruct()
{
  return MEMORY[0x270F7E258]();
}