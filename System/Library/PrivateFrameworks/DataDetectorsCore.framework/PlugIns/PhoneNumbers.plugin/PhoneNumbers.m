uint64_t GetVersion()
{
  return 7;
}

uint64_t (*GetSuffixInitialState())(uint64_t a1)
{
  return state_167899;
}

void (*GetResultPostprocessor())()
{
  return DDPhonePostprocessResult;
}

uint64_t (*GetPrefixInitialState())(uint64_t *a1)
{
  return state_167897;
}

uint64_t state_167897(uint64_t *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = a1[7];
  if (v1 <= v2)
  {
    if (v1 >= v2)
    {
      if (*((unsigned char *)a1 + 120))
      {
        a1[13] = -1;
        a1[14] = (uint64_t)state_167897;
        return 1;
      }
      uint64_t v4 = v2 + 1;
      a1[7] = v2 + 1;
      goto LABEL_29;
    }
    return 0;
  }
  uint64_t v3 = *a1;
  uint64_t v4 = v2 + 1;
  a1[7] = v2 + 1;
  int v5 = *(unsigned __int16 *)(v3 + 2 * v2);
  if (v5 > 159)
  {
    BOOL v9 = (v5 - 65288) <= 0x12 && ((1 << (v5 - 8)) & 0x40013) != 0 || v5 == 8212;
    if (v9 || v5 == 160) {
      goto LABEL_29;
    }
  }
  else if (v5 <= 0x3D && ((1 << v5) & 0x3400100500000600) != 0)
  {
    goto LABEL_29;
  }
  if ((v5 - 39) > 2
    && (v5 - 0x2000) > 0xA
    && (v5 - 12288) > 2
    && (v5 - 12353) > 0xBE
    && (v5 - 13312) >> 1 > 0xCDA
    && (v5 - 19968) > 0x51CB)
  {
    return 0;
  }
LABEL_29:
  a1[6] = v4 + a1[1];
  a1[13] = *(unsigned __int16 *)(a1[3] + 38);
  return MEMORY[0x270F25160]();
}

uint64_t state_167899(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2 <= v3)
  {
    if (v2 >= v3)
    {
      if (*(unsigned char *)(a1 + 120))
      {
        *(void *)(a1 + 104) = -1;
        *(void *)(a1 + 112) = state_167899;
      }
      else
      {
        *(void *)(a1 + 56) = v3 + 1;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v4 = *(void *)a1;
    *(void *)(a1 + 56) = v3 + 1;
    int v5 = *(unsigned __int16 *)(v4 + 2 * v3);
    uint64_t result = 1;
    if (v5 > 159)
    {
      if (v5 >= 12288)
      {
        if ((v5 - 65288) <= 6 && ((1 << (v5 - 8)) & 0x43) != 0) {
          return result;
        }
        if (v5 == 12288 || v5 == 12290) {
          return result;
        }
      }
      else
      {
        if (v5 == 160 || v5 == 8212) {
          return result;
        }
        if (v5 == 8230) {
          return state_167901((uint64_t *)a1);
        }
      }
LABEL_34:
      if ((v5 - 39) >= 3 && (v5 - 0x2000) >= 0xB && (v5 - 12353) >= 0x56) {
        return (v5 - 12445) < 3;
      }
      return result;
    }
    uint64_t v7 = (v5 - 32);
    if (v7 > 0x3F) {
      goto LABEL_32;
    }
    if (((1 << (v5 - 32)) & 0x800000008C004002) != 0) {
      return state_167901((uint64_t *)a1);
    }
    if (((1 << (v5 - 32)) & 0x40008005) == 0)
    {
      if (v7 == 12) {
        return state_167902((uint64_t *)a1);
      }
LABEL_32:
      if ((v5 - 9) < 2) {
        return result;
      }
      goto LABEL_34;
    }
  }
  return result;
}

BOOL state_167901(uint64_t *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = a1[7];
  if (v1 <= v2)
  {
    if (v1 >= v2)
    {
      if (*((unsigned char *)a1 + 120))
      {
        a1[13] = -1;
        a1[14] = (uint64_t)state_167901;
      }
      else
      {
        a1[7] = v2 + 1;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v3 = *a1;
    a1[7] = v2 + 1;
    int v4 = *(unsigned __int16 *)(v3 + 2 * v2);
    BOOL result = 1;
    if (v4 > 159)
    {
      BOOL v8 = v4 == 160 || v4 == 8230;
      if (!v8 && v4 != 12288) {
        return (v4 - 0x2000) < 0xB;
      }
    }
    else if (((v4 - 32) > 0x3F || ((1 << (v4 - 32)) & 0x800000008C005003) == 0) {
           && v4 != 10)
    }
    {
      return (v4 - 0x2000) < 0xB;
    }
  }
  return result;
}

BOOL state_167902(uint64_t *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = a1[7];
  if (v1 > v2)
  {
    uint64_t v3 = *a1;
    a1[7] = v2 + 1;
    int v4 = *(unsigned __int16 *)(v3 + 2 * v2);
    BOOL result = 1;
    if (v4 > 94)
    {
      if (v4 > 8229)
      {
        if (v4 == 8230 || v4 == 12288) {
          return result;
        }
      }
      else if (v4 == 95 || v4 == 160)
      {
        return result;
      }
    }
    else if (v4 <= 0x3F && ((1 << v4) & 0x8C00500300000408) != 0)
    {
      return result;
    }
    return (v4 - 0x2000) < 0xB;
  }
  if (v1 < v2) {
    return 0;
  }
  if (*((unsigned char *)a1 + 120))
  {
    a1[13] = -1;
    a1[14] = (uint64_t)state_167902;
  }
  else
  {
    a1[7] = v2 + 1;
  }
  return 1;
}

void DDPhonePostprocessResult()
{
  CFStringRef Type = (const __CFString *)DDResultGetType();
  if (CFEqual(Type, @"PhoneNumber"))
  {
    DDResultGetQueryRange();
    uint64_t v1 = (const void *)DDResultCreate();
    DDResultAddSubresult();
    CFRelease(v1);
  }
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

uint64_t DDResultAddSubresult()
{
  return MEMORY[0x270F25168]();
}

uint64_t DDResultCreate()
{
  return MEMORY[0x270F251A0]();
}

uint64_t DDResultGetQueryRange()
{
  return MEMORY[0x270F251D8]();
}