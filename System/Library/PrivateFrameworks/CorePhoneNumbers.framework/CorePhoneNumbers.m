CFHashCode __CFPhoneNumberHash(uint64_t a1)
{
  const void *v2;
  const void *v3;
  CFHashCode v4;
  _OWORD v6[3];
  UInt8 *bytes[2];

  memset(v6, 0, sizeof(v6));
  *(_OWORD *)bytes = unk_21078FA88;
  __CFPhoneNumberNormalize((char *)a1);
  PNDecomposeForCountry(*(char **)(a1 + 16), *(const __CFString **)(a1 + 48), (uint64_t)v6);
  if (LODWORD(bytes[1])) {
    v2 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes[0], LODWORD(bytes[1]), 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  }
  else {
    v2 = CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  v3 = v2;
  v4 = CFHash(v2);
  CFRelease(v3);
  return v4;
}

CFStringRef _PNCopyLastFourDigitsOfLocalNumber(const __CFString *a1, __CFString *a2)
{
  CFStringRef result = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, a2, 0, 0);
  if (result)
  {
    CFStringRef v3 = result;
    v4 = _PNCopyNormalized(result);
    int64_t v5 = strlen(v4);
    if (v5 >= 4) {
      CFIndex v6 = 4;
    }
    else {
      CFIndex v6 = v5;
    }
    CFStringRef v7 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&v4[v5 - v6], v6, 0x8000100u, 0);
    free(v4);
    CFRelease(v3);
    return v7;
  }
  return result;
}

void *_PNCopyStrippedNumberWithoutPauses(const __CFString *a1, __CFString *a2, CFStringRef *a3, int a4)
{
  if (_PNCopyStrippedNumberWithoutPauses_initOnce != -1) {
    dispatch_once(&_PNCopyStrippedNumberWithoutPauses_initOnce, &__block_literal_global_0);
  }
  result.CFIndex location = 0;
  result.length = 0;
  v8 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (a4)
  {
    v9 = _PNCopyBestGuessNumberForCountry(a1, a2, 0, 0, &v20);
    size_t v10 = strlen(v9);
    CFStringRef v11 = CFStringCreateWithBytesNoCopy(*v8, (const UInt8 *)v9, v10, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  }
  else
  {
    CFStringRef v11 = _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(a1);
  }
  CFStringRef v12 = v11;
  CFCharacterSetRef v13 = (const __CFCharacterSet *)_PNCopyStrippedNumberWithoutPauses_pauses;
  v21.length = CFStringGetLength(v11);
  v21.CFIndex location = 0;
  if (CFStringFindCharacterFromSet(v12, v13, v21, 0, &result))
  {
    CFAllocatorRef v14 = *v8;
    v22.length = result.location;
    v22.CFIndex location = 0;
    v15 = (void *)CFStringCreateWithSubstring(*v8, v12, v22);
    if (a3)
    {
      CFIndex location = result.location;
      CFIndex Length = CFStringGetLength(v12);
      v23.length = Length - result.location;
      v23.CFIndex location = location;
      *a3 = CFStringCreateWithSubstring(v14, v12, v23);
    }
  }
  else
  {
    v15 = (void *)CFRetain(v12);
  }
  CFRelease(v12);
  return v15;
}

char *_PNCopyBestGuessNumberForCountry(const __CFString *a1, __CFString *a2, int a3, long long *a4, unsigned char *a5)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  long long v44 = 0u;
  long long v45 = 0u;
  if (a4) {
    v9 = a4;
  }
  else {
    v9 = &v42;
  }
  long long v42 = 0uLL;
  long long v43 = 0uLL;
  if (a3)
  {
    size_t v10 = _PNCopyNormalized(a1);
  }
  else
  {
    CFStringRef v11 = _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(a1);
    CFIndex Length = CFStringGetLength(v11);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    *(void *)usedBufLen = 0;
    size_t v10 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0xC347A27BuLL);
    v52.CFIndex location = 0;
    v52.length = Length;
    CFStringGetBytes(v11, v52, 0x8000100u, 0, 0, v10, MaximumSizeForEncoding, (CFIndex *)usedBufLen);
    v10[*(void *)usedBufLen] = 0;
    CFRelease(v11);
  }
  char v14 = _PNDecomposeForCountry(v10, a2, v9, 1);
  *a5 = v14;
  if (v14) {
    goto LABEL_23;
  }
  v15 = (unsigned int *)PNGetFormatFileHeader();
  if (!a2) {
    goto LABEL_23;
  }
  v16 = v15;
  if (!v15) {
    goto LABEL_23;
  }
  int InfoIndex = UIPhoneFormatCountryGetInfoIndex(v15, a2);
  if (InfoIndex == -1) {
    goto LABEL_23;
  }
  int v18 = InfoIndex;
  unsigned int Count = UIPhoneFormatCountryGetCount(v16);
  if (!v10) {
    goto LABEL_23;
  }
  if (!*(unsigned int *)((char *)&v16[3 * Count + 3] + v16[3 * v18 + 3])) {
    goto LABEL_23;
  }
  char v20 = _PNGetITUCountryCode((unsigned int *)a2);
  if (!v20) {
    goto LABEL_23;
  }
  CFRange v21 = (const char *)v20;
  size_t v22 = strlen((const char *)v10);
  size_t v23 = strlen(v21);
  if (!v22 || v22 < v23 || strncmp((const char *)v10, v21, v23)) {
    goto LABEL_23;
  }
  v24 = malloc_type_malloc(v22 + 2, 0x5F0EBBuLL);
  unsigned char *v24 = 43;
  v24[v22 + 1] = 0;
  strncpy(v24 + 1, (const char *)v10, v22);
  size_t v25 = strlen(v24);
  CFStringRef v26 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v24, v25, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  char valid = _PNIsValidPhoneNumberForCountry(v26, a2, 0, 0, 1);
  CFRelease(v26);
  if ((valid & 1) == 0)
  {
    free(v24);
LABEL_23:
    v24 = v10;
    goto LABEL_24;
  }
  *a5 = _PNDecomposeForCountry(v24, a2, v9, 1);
  v28 = (UInt8 **)&v42;
  if (a4) {
    v28 = (UInt8 **)a4;
  }
  if (v10 == v28[6])
  {
    v41 = cpn_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)usedBufLen = 138412802;
      *(void *)&usedBufLen[4] = a1;
      __int16 v47 = 2112;
      v48 = a2;
      __int16 v49 = 2080;
      v50 = v10;
      _os_log_fault_impl(&dword_210786000, v41, OS_LOG_TYPE_FAULT, "Decompose failure for digits %@ ISO country code %@; cannot deallocate %s",
        usedBufLen,
        0x20u);
    }
  }
  else
  {
    free(v10);
  }
LABEL_24:
  if (*v24 == 43)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v29 = (unsigned int *)PNGetFormatFileHeader();
    if (a2)
    {
      v30 = v29;
      if (v29)
      {
        uint64_t v31 = UIPhoneFormatCountryGetInfoIndex(v29, a2);
        if (v31 != -1)
        {
          uint64_t v32 = v31;
          uint64_t v33 = (uint64_t)&v30[3 * UIPhoneFormatCountryGetCount(v30) + 1] + v30[3 * v31 + 3];
          *(void *)usedBufLen = 0;
          size_t v34 = strlen(v24);
          if (_InternationalPrefixForDigitsInCountry(v33, v32, 0, v24, 0, v34, 0, usedBufLen))
          {
            if (*(void *)usedBufLen)
            {
              size_t v35 = strlen(*(const char **)usedBufLen);
              v36 = strdup(&v24[v35]);
              if (_PNDecomposeForCountry(v36, a2, &v42, 1))
              {
                if (v36)
                {
                  long long v37 = v42;
                  long long v38 = v43;
                  long long v39 = v45;
                  v9[2] = v44;
                  v9[3] = v39;
                  long long *v9 = v37;
                  v9[1] = v38;
                  *a5 = 1;
                  free(v24);
                  return v36;
                }
              }
              else
              {
                free(v36);
              }
            }
          }
        }
      }
    }
  }
  return v24;
}

unsigned char *_PNCopyNormalized(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFStringRef v3 = malloc_type_malloc(Length + 1, 0x11DB78AFuLL);
  CFStringRef theString = a1;
  uint64_t v37 = 0;
  CFIndex v38 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  size_t v35 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v27 = 0u;
  int64_t v39 = 0;
  int64_t v40 = 0;
  size_t v25 = v3;
  v36 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v6 = 0;
    int64_t v7 = 0;
    int v8 = 0;
    char v9 = 0;
    int v10 = 1;
    uint64_t v11 = 64;
    do
    {
      if ((unint64_t)v7 >= 4) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = v7;
      }
      CFIndex v13 = v38;
      if (v38 <= v7)
      {
        unsigned int v15 = 0;
        if (!u_isdigit(0)) {
          goto LABEL_33;
        }
      }
      else
      {
        if (v35)
        {
          UniChar v14 = v35[v7 + v37];
        }
        else if (v36)
        {
          UniChar v14 = v36[v37 + v7];
        }
        else
        {
          int64_t v17 = v39;
          if (v40 <= v7 || v39 > v7)
          {
            int64_t v19 = v7 - v12;
            uint64_t v20 = v12 + v6;
            uint64_t v21 = v11 - v12;
            CFIndex v22 = v19 + 64;
            if (v19 + 64 >= v38) {
              CFIndex v22 = v38;
            }
            int64_t v39 = v19;
            int64_t v40 = v22;
            if (v38 >= v21) {
              CFIndex v13 = v21;
            }
            v41.length = v13 + v20;
            v41.CFIndex location = v37 + v19;
            CFStringGetCharacters(theString, v41, buffer);
            int64_t v17 = v39;
          }
          UniChar v14 = buffer[v7 - v17];
        }
        unsigned int v15 = v14;
        if (!(v9 & 1 | (v14 != 43)))
        {
          int v10 = 0;
          int v8 = 0;
          *v3++ = 43;
          char v9 = 1;
          goto LABEL_36;
        }
        if (v14 == 42 || v14 == 35)
        {
          *v3++ = v14;
          v8 |= v10;
          goto LABEL_36;
        }
        if (!u_isdigit(v14))
        {
          if (v15 > 0x7F)
          {
            if (!__maskrune(v15, 0x100uLL)) {
              goto LABEL_36;
            }
          }
          else
          {
LABEL_33:
            if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v15 + 60) & 0x100) == 0) {
              goto LABEL_36;
            }
          }
          uint64_t v23 = (char)v15 - 65;
          if (v23 > 0x39 || ((0x3FFFFFF03FFFFFFuLL >> v23) & 1) == 0) {
            goto LABEL_36;
          }
          char v16 = byte_21078FA98[v23];
          goto LABEL_13;
        }
      }
      char v16 = u_charDigitValue(v15) + 48;
LABEL_13:
      *v3++ = v16;
      v9 |= v8 ^ 1;
      v10 &= v8;
LABEL_36:
      ++v7;
      --v6;
      ++v11;
    }
    while (Length != v7);
  }
  *CFStringRef v3 = 0;
  return v25;
}

CFStringRef _CreateFormattedNumberForDigitsWithCountryIndex(const __CFString *a1, uint64_t a2, unsigned int a3, const __CFString *a4, _DWORD *a5, void *a6)
{
  uint64_t v12 = (unsigned int *)PNGetFormatFileHeader();
  if (!v12) {
    return 0;
  }
  CFIndex v13 = v12;
  v103 = a5;
  unsigned int v104 = a3;
  UniChar v14 = (unsigned __int16 *)((char *)&v12[3 * UIPhoneFormatCountryGetCount(v12) + 1]
                           + v12[3 * a2 + 3]);
  uint64_t v15 = *v14;
  uint64_t v16 = *((unsigned int *)v14 + 1);
  v118 = (unsigned __int8 *)(v14 + 6);
  if (a6) {
    *a6 = v14;
  }
  v105 = a6;
  memset(v110, 0, sizeof(v110));
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v108 = 0;
  *(void *)v109 = Length;
  CFStringRef v111 = a1;
  uint64_t v114 = 0;
  CFIndex v115 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v112 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  uint64_t v116 = 0;
  uint64_t v117 = 0;
  v113 = CStringPtr;
  uint64_t v20 = _NumberRangeWithoutVerticalServiceCode(a1, 0, a2);
  if (v20 != -1)
  {
    CFIndex v22 = v20;
    CFIndex v23 = v21;
    CFIndex v24 = v20 + v21;
    CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFIndex v26 = CFStringGetLength(a1);
    v27.length = v22;
    if (v22 >= v26) {
      v27.length = CFStringGetLength(a1);
    }
    v27.CFIndex location = 0;
    CFStringRef v28 = CFStringCreateWithSubstring(v25, a1, v27);
    v120.CFIndex location = v22;
    v120.length = v23;
    CFStringRef v29 = CFStringCreateWithSubstring(v25, a1, v120);
    v121.length = Length - v24;
    v121.CFIndex location = v24;
    CFStringRef v30 = CFStringCreateWithSubstring(v25, a1, v121);
    CFStringRef FormattedNumberForDigitsWithCountryIndex = (const __CFString *)_CreateFormattedNumberForDigitsWithCountryIndex(v29, a2, v104, a4, v103, v105);
    if (v104)
    {
      CFRelease(v28);
      CFStringRef v28 = &stru_26C2A3D88;
    }
    long long v32 = "";
    if (CFStringGetLength(FormattedNumberForDigitsWithCountryIndex) && CFStringGetLength(v28)) {
      long long v32 = " ";
    }
    CFStringRef Copy = CFStringCreateWithFormat(v25, 0, @"%@%s%@%@", v28, v32, FormattedNumberForDigitsWithCountryIndex, v30);
    CFRelease(v28);
    CFRelease(v29);
    CFRelease(FormattedNumberForDigitsWithCountryIndex);
    CFStringRef v34 = v30;
LABEL_122:
    CFRelease(v34);
    return Copy;
  }
  CFStringRef v35 = a4;
  if (a4) {
    goto LABEL_17;
  }
  v106 = 0;
  CFStringRef theString = 0;
  uint64_t v47 = _InternationalPrefixForDigitsInCountry(v14, a2, a1, 0, 0, Length, &v106, &theString);
  if (v47)
  {
    v48 = (unsigned __int8 *)v47;
    if (v105) {
      *((unsigned char *)v105 + 40) = 1;
    }
    if (theString) {
      uint64_t v49 = NumberOfDigitsRequiredForPattern((unsigned __int8 *)theString);
    }
    else {
      uint64_t v49 = 0;
    }
    unsigned int v75 = NumberOfDigitsRequiredForPattern(v48);
    if (v49 + v75 <= Length) {
      int64_t v76 = v75;
    }
    else {
      int64_t v76 = Length - v49;
    }
    v102 = v48;
    CFStringRef FormattedStringForDigitsInRange = _CreateFormattedStringForDigitsInRange((uint64_t)v110, 0, v49, v76, (char *)v48, v104, 0, 0, 1);
    CFAllocatorRef v78 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    int64_t v79 = v76 + v49;
    v125.length = CFStringGetLength(a1) - (v76 + v49);
    v125.CFIndex location = v76 + v49;
    CFStringRef v80 = CFStringCreateWithSubstring(v78, a1, v125);
    v81 = v106;
    uint64_t v82 = PNGetFormatFileHeader();
    if (v82)
    {
      v83 = (unsigned int *)v82;
      unsigned int v119 = 0;
      if (v81)
      {
        CFIndex v84 = strlen(v81);
        v85 = v83;
        CFStringRef v86 = 0;
        uint64_t v87 = (uint64_t)v81;
        v88 = 0;
      }
      else
      {
        CFIndex v84 = CFStringGetLength(v80);
        v88 = &v119;
        v85 = v83;
        CFStringRef v86 = v80;
        uint64_t v87 = 0;
      }
      uint64_t CountryOffsetFromDialingCode = _GetCountryOffsetFromDialingCode(v85, v86, v87, 0, v84, v88);
      uint64_t v91 = CountryOffsetFromDialingCode;
      if (CountryOffsetFromDialingCode == a2) {
        uint64_t v92 = v104;
      }
      else {
        uint64_t v92 = v104 & 0xFFFFFFFD;
      }
      if (CountryOffsetFromDialingCode != -1)
      {
        v126.length = v119;
        v126.CFIndex location = 0;
        CFStringRef v93 = CFStringCreateWithSubstring(v78, v80, v126);
        CFIndex v94 = v119;
        CFIndex v95 = CFStringGetLength(v80);
        v127.length = v95 - v119;
        v127.CFIndex location = v94;
        CFStringRef v96 = CFStringCreateWithSubstring(v78, v80, v127);
        CFStringRef v89 = (const __CFString *)_CreateFormattedNumberForDigitsWithCountryIndex(v96, v91, v92, v93, v103, v105);
        if (v105 && *((unsigned char *)v105 + 41)) {
          v105[6] = v119;
        }
        CFRelease(v96);
        CFRelease(v93);
        if ((v92 & 2) == 0) {
          goto LABEL_107;
        }
LABEL_109:
        CFRelease(FormattedStringForDigitsInRange);
        CFStringRef v97 = 0;
        CFStringRef theString = 0;
        CFStringRef FormattedStringForDigitsInRange = &stru_26C2A3D88;
        goto LABEL_110;
      }
      CFStringRef v89 = (const __CFString *)CFRetain(v80);
      if ((v92 & 2) != 0) {
        goto LABEL_109;
      }
    }
    else
    {
      CFStringRef v89 = 0;
      if ((v104 & 2) != 0) {
        goto LABEL_109;
      }
    }
LABEL_107:
    CFStringRef v97 = theString;
LABEL_110:
    v98 = "";
    if (v97) {
      v99 = (const char *)v97;
    }
    else {
      v99 = "";
    }
    if ((*v102 != 43 || v76 >= 2) && CFStringGetLength(v89) && CFStringGetLength(FormattedStringForDigitsInRange) > 0) {
      v98 = " ";
    }
    CFStringRef Copy = CFStringCreateWithFormat(v78, 0, @"%s%@%s%@", v99, FormattedStringForDigitsInRange, v98, v89);
    if (v105 && *((unsigned char *)v105 + 41)) {
      v105[6] += v79;
    }
    CFRelease(FormattedStringForDigitsInRange);
    CFRelease(v80);
    CFStringRef v34 = v89;
    goto LABEL_122;
  }
  CFStringRef v35 = 0;
LABEL_17:
  CFStringRef theString = 0;
  uint64_t v36 = _FormatEntryAndNationalPrefixForDigitsInCountry((uint64_t)v14, (UniChar *)v110, 0, &v108, v35 != 0, &v118, &theString, (uint64_t)a6);
  uint64_t v37 = v36;
  BOOL v101 = v36 != 0;
  if (!v36) {
    goto LABEL_43;
  }
  uint64_t v38 = *(unsigned __int16 *)(v36 + 14);
  uint64_t v39 = _UIPhoneFormatEntryReplacementCountryCodeRange(v14, v36);
  if (v39 != -1)
  {
    int64_t v40 = (char *)v14 + *v14 + *((unsigned int *)v14 + 1) + v38 + v39;
    size_t v41 = strlen(v40);
    uint64_t v42 = _GetCountryOffsetFromDialingCode(v13, 0, (uint64_t)v40, 0, v41, 0);
    if (v42 != -1)
    {
      uint64_t v43 = v42;
      v122.CFIndex location = v108;
      v122.length = *(void *)v109;
      CFStringRef v44 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, v122);
      char v45 = v104;
      CFStringRef Copy = (CFStringRef)_CreateFormattedNumberForDigitsWithCountryIndex(v44, v43, v104, 0, v103, v105);
      CFRelease(v44);
      CFStringRef v46 = a4;
      if (!a4)
      {
LABEL_87:
        CFStringRef v34 = theString;
        if (!theString) {
          return Copy;
        }
        goto LABEL_122;
      }
      goto LABEL_57;
    }
  }
  v50 = (char *)v14 + v15 + v16;
  if (v50)
  {
    char v45 = v104;
    CFStringRef v46 = a4;
    CFStringRef Copy = _CreateFormattedStringForDigitsInRange((uint64_t)v110, 0, v108, *(size_t *)v109, &v50[v38], v104, theString, a4, 0);
    if (v103) {
      _DWORD *v103 = a2;
    }
    if (v105)
    {
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      *(_OWORD *)(v105 + 1) = *(_OWORD *)v37;
      uint64_t v53 = *(unsigned __int16 *)(v37 + 14);
      v105[3] = &v50[v53];
      v54 = (char *)v14 + *v14 + *((unsigned int *)v14 + 1) + v53;
      uint64_t v55 = -1;
      while (1)
      {
        int v56 = v54[v51];
        if (v56 == 91)
        {
          if (v54[v51 + 1] == 91)
          {
            if ((v54[v51 + 2] - 48) > 9)
            {
LABEL_49:
              v105[8] = v55;
              v105[9] = v52;
              break;
            }
            uint64_t v55 = v51 + 2;
          }
        }
        else
        {
          if (!v54[v51]) {
            goto LABEL_49;
          }
          if (v55 != -1 && v56 == 93 && v54[v51 + 1] == 93) {
            uint64_t v52 = v51 - v55;
          }
        }
        ++v51;
      }
    }
    if (!v118 || (*(unsigned char *)(v37 + 12) & 1) != 0)
    {
      int v58 = 1;
    }
    else
    {
      CFStringRef v59 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@%@", theString, Copy);
      CFRelease(Copy);
      int v58 = 1;
      CFStringRef Copy = v59;
    }
  }
  else
  {
LABEL_43:
    CFAllocatorRef v57 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v46 = a4;
    if (a4 && theString)
    {
      v123.CFIndex location = v108;
      v123.length = *(void *)v109;
      CFStringRef Copy = CFStringCreateWithSubstring(v57, a1, v123);
      char v45 = v104;
      if (v37) {
        goto LABEL_56;
      }
      goto LABEL_57;
    }
    CFStringRef Copy = CFStringCreateCopy(v57, a1);
    char v45 = v104;
    int v58 = v101;
  }
  if (!v46) {
    goto LABEL_87;
  }
  if (v58)
  {
LABEL_56:
    if ((*(unsigned char *)(v37 + 12) & 2) != 0) {
      goto LABEL_87;
    }
  }
LABEL_57:
  if (theString)
  {
    v60 = "";
    if ((v45 & 4) != 0) {
      v61 = "";
    }
    else {
      v61 = "(";
    }
    if ((v45 & 4) != 0) {
      v62 = &stru_26C2A3D88;
    }
    else {
      v62 = @"");
    }
    if (CFStringGetLength(Copy))
    {
      int CharacterAtIndex = CFStringGetCharacterAtIndex(Copy, 0);
      CFAllocatorRef v64 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (CharacterAtIndex == 40)
      {
        v124.length = CFStringGetLength(Copy) - 1;
        v124.CFIndex location = 1;
        MutableCFStringRef Copy = (__CFString *)CFStringCreateWithSubstring(v64, Copy, v124);
        if (CFStringGetLength(v46)) {
          v60 = " ";
        }
        CFStringRef v66 = theString;
        if (CFStringGetLength(MutableCopy)) {
          v67 = MutableCopy;
        }
        else {
          v67 = v62;
        }
        CFStringRef v68 = CFStringCreateWithFormat(v64, 0, @"%@%s%s%@%@", v46, v60, v61, v66, v67);
        goto LABEL_85;
      }
    }
    else
    {
      CFAllocatorRef v64 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    }
    CFIndex v72 = CFStringGetLength(theString);
    MutableCFStringRef Copy = CFStringCreateMutableCopy(v64, v72, theString);
    CFStringTrimWhitespace(MutableCopy);
    if (CFStringGetLength(v46)) {
      v73 = " ";
    }
    else {
      v73 = "";
    }
    if (CFStringGetLength(Copy)) {
      v74 = " ";
    }
    else {
      v74 = "";
    }
    CFStringRef v68 = CFStringCreateWithFormat(v64, 0, @"%@%s%s%@%@%s%@", v46, v73, v61, MutableCopy, v62, v74, Copy);
LABEL_85:
    CFStringRef v71 = v68;
    CFRelease(MutableCopy);
LABEL_86:
    CFRelease(Copy);
    CFStringRef Copy = v71;
    goto LABEL_87;
  }
  if ((v45 & 2) == 0)
  {
    CFAllocatorRef v69 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v70 = "";
    if (CFStringGetLength(Copy) && CFStringGetLength(v46)) {
      v70 = " ";
    }
    CFStringRef v71 = CFStringCreateWithFormat(v69, 0, @"%@%s%@", v46, v70, Copy);
    goto LABEL_86;
  }
  return Copy;
}

BOOL __CFPhoneNumberEqual(char *a1, uint64_t a2)
{
  CFStringRef v3 = a1;
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  __CFPhoneNumberNormalize(a1);
  __CFPhoneNumberNormalize((char *)a2);
  LODWORD(v3) = PNDecomposeForCountry(*((char **)v3 + 2), *((const __CFString **)v3 + 6), (uint64_t)v6);
  return v3 == PNDecomposeForCountry(*(char **)(a2 + 16), *(const __CFString **)(a2 + 48), (uint64_t)v5)&& decomposedPhoneNumbersEqual((uint64_t)v6, (uint64_t)v5, 0, 0);
}

uint64_t _PNDecomposeForCountry(char *a1, const __CFString *a2, uint64_t a3, int a4)
{
  int v8 = (unsigned int *)PNGetFormatFileHeader();
  if (!a2 || !v8) {
    return 0;
  }
  unsigned int InfoIndex = UIPhoneFormatCountryGetInfoIndex(v8, a2);
  if (InfoIndex == -1)
  {
    *(void *)(a3 + 48) = a1;
    *(_DWORD *)(a3 + 56) = strlen(a1);
    return 0;
  }
  return _DecomposePhoneNumberWithCountryIndex(a1, InfoIndex, a3, 0, a4);
}

uint64_t UIPhoneFormatCountryGetInfoIndex(unsigned int *a1, CFStringRef theString)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!theString) {
    return 0xFFFFFFFFLL;
  }
  CFIndex Length = CFStringGetLength(theString);
  if (Length < 1) {
    return 0xFFFFFFFFLL;
  }
  CFIndex v5 = Length;
  unsigned int valuePtr = 0;
  os_unfair_lock_lock_with_options();
  CFDictionaryRef IndexCache = __CFPhoneNumberCountryGetIndexCache();
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(IndexCache, theString);
  os_unfair_lock_unlock((os_unfair_lock_t)&__CFPhoneNumberCountryCacheUnfairLock);
  if (Value && CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr)) {
    return valuePtr;
  }
  CFIndex v9 = v5 + 1;
  MEMORY[0x270FA5388]();
  int v10 = (char *)&v18 - ((v5 + 16) & 0xFFFFFFFFFFFFFFF0);
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (!CStringPtr)
  {
    CStringPtr = v10;
    if (!CFStringGetCString(theString, v10, v9, 0x8000100u)) {
      return 0xFFFFFFFFLL;
    }
  }
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v12 = *a1;
  unsigned int v18 = 0;
  if (!v12) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = 0;
  for (i = (const char *)(a1 + 2); strcasecmp(i, CStringPtr); i += 12)
  {
    unsigned int v18 = ++v13;
    if (v12 == v13) {
      return 0xFFFFFFFFLL;
    }
  }
  CFNumberRef v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &v18);
  if (v15)
  {
    CFNumberRef v16 = v15;
    os_unfair_lock_lock_with_options();
    int64_t v17 = __CFPhoneNumberCountryGetIndexCache();
    CFDictionarySetValue(v17, theString, v16);
    os_unfair_lock_unlock((os_unfair_lock_t)&__CFPhoneNumberCountryCacheUnfairLock);
    CFRelease(v16);
  }
  return v18;
}

CFMutableDictionaryRef __CFPhoneNumberCountryGetIndexCache()
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__CFPhoneNumberCountryCacheUnfairLock);
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)__CFPhoneNumberCountryGetIndexCache_sCache;
  if (!__CFPhoneNumberCountryGetIndexCache_sCache)
  {
    CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    __CFPhoneNumberCountryGetIndexCache_sCache = (uint64_t)result;
  }
  return result;
}

CFStringRef _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (Length)
  {
    CFIndex v3 = Length;
    size_t v4 = 2 * Length;
    CFIndex v5 = (UniChar *)malloc_type_malloc(2 * Length, 0x1000040BDFB0063uLL);
    uint64_t v6 = (UniChar *)malloc_type_malloc(v4, 0x1000040BDFB0063uLL);
    v14.CFIndex location = 0;
    v14.length = v3;
    CFStringGetCharacters(a1, v14, v5);
    if (v3 < 1) {
      goto LABEL_15;
    }
    CFIndex v7 = 0;
    int v8 = v5;
    do
    {
      unsigned int v10 = *v8++;
      unsigned int v9 = v10;
      if (pn_uset_expandedPresentationSetContains() == 1 && !_IsInFormattingSet(v9)) {
        v6[v7++] = v9;
      }
      --v3;
    }
    while (v3);
    if (v7) {
      CFStringRef v11 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x263EFFB08], v6, v7);
    }
    else {
LABEL_15:
    }
      CFStringRef v11 = &stru_26C2A3D88;
    free(v5);
    free(v6);
    return v11;
  }
  return (CFStringRef)CFRetain(a1);
}

uint64_t pn_uset_expandedPresentationSetContains()
{
  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getExpandedPresentationSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getExpandedPresentationPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[[+][:Nd:][,;][\\ \"'()\\-./<>\\[\\]][*#][A-Za-z]]",
        __pn_uset_getExpandedPresentationPattern_pattern,
        46);
      __pn_uset_getExpandedPresentationPattern_didInit = 1;
    }
    __pn_uset_getExpandedPresentationSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  uint64_t result = __pn_uset_getExpandedPresentationSet_set;
  if (__pn_uset_getExpandedPresentationSet_set)
  {
    JUMPOUT(0x2166724B0);
  }
  return result;
}

uint64_t _IsInFormattingSet(unsigned int a1)
{
  uint64_t result = 1;
  if (a1 > 0x2F || ((1 << a1) & 0xE30100000000) == 0)
  {
    unsigned int v3 = a1 - 8236;
    BOOL v4 = a1 == 160;
    return v3 < 2 || v4;
  }
  return result;
}

const char *_InternationalPrefixForDigitsInCountry(uint64_t a1, unsigned int a2, const __CFString *a3, const char *a4, CFIndex a5, uint64_t a6, void *a7, const char **a8)
{
  CFNumberRef v16 = (unsigned int *)PNGetFormatFileHeader();
  int64_t v17 = __InternationalPrefixForDigitsInCountry(a1, a2, a3, a4, a5, a6, a7);
  unsigned int v18 = v17;
  if (a8)
  {
    if (v17)
    {
      if (*v17 == 43 && !v17[1])
      {
        uint64_t v19 = a6 - 1;
        if (_GetCountryOffsetFromDialingCode(v16, a3, (uint64_t)a4, 1, v19, 0) == -1)
        {
          uint64_t v20 = __InternationalPrefixForDigitsInCountry(a1, a2, a3, a4, 1, v19, a7);
          if (v20)
          {
            *a8 = v18;
            return v20;
          }
        }
      }
    }
  }
  return v18;
}

const char *__InternationalPrefixForDigitsInCountry(uint64_t a1, unsigned int a2, const __CFString *a3, const char *a4, CFIndex a5, uint64_t a6, void *a7)
{
  uint64_t v10 = 0;
  uint64_t v11 = a1 + 12;
  uint64_t v12 = (const char *)(a1 + 12);
  do
  {
    size_t v13 = strlen(v12);
    v10 += v13 + 1;
    v12 += v13 + 1;
  }
  while (*v12);
  if (!a6) {
    return 0;
  }
  uint64_t v55 = 0;
  uint64_t v14 = v11 + v10 + 1;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  *(_OWORD *)buffer = 0u;
  if (!a4)
  {
    *(void *)&long long v52 = a3;
    *((void *)&v53 + 1) = 0;
    *(void *)&long long v54 = CFStringGetLength(a3);
    CharactersPtr = CFStringGetCharactersPtr(a3);
    CStringPtr = 0;
    *((void *)&v52 + 1) = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(a3, 0x600u);
    }
    *((void *)&v54 + 1) = 0;
    uint64_t v55 = 0;
    *(void *)&long long v53 = CStringPtr;
  }
  uint64_t v38 = a7;
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
  uint64_t v19 = "[[if valid]]";
  uint64_t v20 = a4;
  CFIndex v40 = a5;
  while (1)
  {
    if (*(unsigned char *)v14 == 45)
    {
      if (*(unsigned char *)(v14 + 1) == 62) {
        goto LABEL_23;
      }
    }
    else if (!*(unsigned char *)v14)
    {
      if (v20) {
        int CharacterAtIndex = v20[a5];
      }
      else {
        int CharacterAtIndex = CFStringGetCharacterAtIndex(a3, a5);
      }
      if (CharacterAtIndex == 43) {
        return "+";
      }
      else {
        return 0;
      }
    }
    int v21 = strncmp(v19, (const char *)v14, 0xCuLL);
    CFIndex v22 = (unsigned __int8 *)(v14 + 12);
    if (!v21) {
      v14 += 12;
    }
    if (InlineBufferHasPatternAtOffset(buffer, (uint64_t)v20, (char *)v14, a5))
    {
      size_t v41 = strlen((const char *)v14);
      if (v21) {
        break;
      }
      int v23 = NumberOfDigitsRequiredForPattern(v22);
      if (a6 <= v23) {
        break;
      }
      int v24 = v23;
      if (!InlineBufferHasPatternAtOffset(buffer, (uint64_t)v20, (char *)v22, a5)) {
        break;
      }
      CFAllocatorRef v25 = v19;
      uint64_t v26 = v24;
      CFRange v27 = (const char *)(PNGetFormatFileHeader() + 12 * a2 + 8);
      size_t v28 = strlen(v27);
      CFStringRef v29 = (__CFString *)CFStringCreateWithBytesNoCopy(v17, (const UInt8 *)v27, v28, 0x8000100u, 0, v18);
      if (v20)
      {
        size_t v30 = strlen(v20);
        CFStringRef v31 = CFStringCreateWithBytesNoCopy(v17, (const UInt8 *)&v20[v26], v30 - v26, 0x8000100u, 0, v18);
      }
      else
      {
        v56.length = CFStringGetLength(a3) - v26;
        v56.CFIndex location = v26;
        CFStringRef v31 = CFStringCreateWithSubstring(v17, a3, v56);
      }
      CFStringRef v32 = v31;
      MutableCFStringRef Copy = CFStringCreateMutableCopy(v17, 0, @"+");
      CFStringAppend(MutableCopy, v32);
      int valid = _PNIsValidPhoneNumberForCountry(MutableCopy, v29, 0, 1, 0);
      CFRelease(v29);
      CFRelease(v32);
      CFRelease(MutableCopy);
      uint64_t v19 = v25;
      a5 = v40;
      uint64_t v20 = a4;
      if (valid) {
        break;
      }
    }
LABEL_23:
    v14 += strlen((const char *)v14) + 1;
  }
  if (v38)
  {
    size_t v35 = v14 + v41;
    if (*(unsigned char *)(v14 + v41 + 1) == 45 && *(unsigned char *)(v35 + 2) == 62) {
      *uint64_t v38 = v35 + 3;
    }
  }
  return (const char *)v14;
}

uint64_t _DecomposePhoneNumberWithCountryIndex(char *a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t result = PNGetFormatFileHeader();
  if (result)
  {
    uint64_t v11 = (unsigned int *)result;
    uint64_t v12 = (unsigned __int16 *)(result
                             + 4
                             + 12 * UIPhoneFormatCountryGetCount((unsigned int *)result)
                             + *(unsigned int *)(result + 4 + 12 * a2 + 8));
    uint64_t v55 = (unsigned __int8 *)(v12 + 6);
    size_t v13 = strlen(a1);
    unint64_t v53 = 0;
    size_t v54 = v13;
    uint64_t v14 = _NumberRangeWithoutVerticalServiceCode(0, a1, a2);
    if (v14 == -1)
    {
      CFIndex v16 = 0;
    }
    else
    {
      CFIndex v16 = v14;
      unint64_t v53 = v14;
      size_t v54 = v15;
      size_t v13 = v15;
    }
    *(void *)a3 = &v11[3 * a2 + 1];
    if ((a4 & 1) != 0
      || ((long long v51 = 0, v52 = 0, !a5) ? (v17 = 0) : (v17 = (const char **)&v52),
          (CFAllocatorRef v18 = _InternationalPrefixForDigitsInCountry((uint64_t)v12, a2, 0, a1, v16, v13, &v51, v17)) == 0))
    {
      uint64_t v21 = _FormatEntryAndNationalPrefixForDigitsInCountry((uint64_t)v12, 0, a1, (uint64_t *)&v53, a4, &v55, 0, 0);
      uint64_t v22 = v21;
      if (v55) {
        *(void *)(a3 + 8) = v55;
      }
      if (!v21)
      {
LABEL_52:
        *(_OWORD *)(a3 + 32) = 0u;
        *(_OWORD *)(a3 + 48) = 0u;
        *(_OWORD *)a3 = 0u;
        *(_OWORD *)(a3 + 16) = 0u;
        *(void *)(a3 + 48) = a1;
        int v50 = strlen(a1);
        uint64_t result = 0;
        *(_DWORD *)(a3 + 56) = v50;
        return result;
      }
      unint64_t v23 = v53;
      size_t v24 = v54;
      size_t v25 = v54 + v53;
      uint64_t v26 = &a1[v53];
      if (v54 + v53 > v53 && (*(unsigned char *)(v21 + 10) & 0x80) == 0)
      {
        size_t v27 = *(unsigned char *)(v21 + 10) & 0x7F;
        if ((*(unsigned char *)(v21 + 10) & 0x7F) != 0)
        {
          *(void *)(a3 + 16) = v26;
          if (v24 >= v27) {
            LODWORD(v24) = v27;
          }
          *(_DWORD *)(a3 + 24) = v24;
          v23 += v27;
          v26 += v27;
        }
      }
      size_t v28 = v25 - v23;
      if (v25 <= v23)
      {
        unsigned int v31 = *(_DWORD *)(a3 + 40);
      }
      else
      {
        unint64_t v29 = *(unsigned __int8 *)(v21 + 11);
        if (*(unsigned char *)(v21 + 11)) {
          size_t v30 = v26;
        }
        else {
          size_t v30 = 0;
        }
        *(void *)(a3 + 32) = v30;
        if (v28 >= v29) {
          unsigned int v31 = v29;
        }
        else {
          unsigned int v31 = v25 - v23;
        }
        *(_DWORD *)(a3 + 40) = v31;
      }
      uint64_t v32 = v31;
      unint64_t v33 = v23 + v31;
      if (v25 > v33 && (*(unsigned char *)(v21 + 10) & 0x80) != 0)
      {
        unint64_t v34 = *(unsigned char *)(v21 + 10) & 0x7F;
        if ((*(unsigned char *)(v21 + 10) & 0x7F) != 0)
        {
          *(void *)(a3 + 16) = &v26[v32];
          if (v28 >= v34) {
            LODWORD(v28) = v34;
          }
          *(_DWORD *)(a3 + 24) = v28;
          v26 += v34;
          unint64_t v33 = v23 + v34 + v32;
        }
      }
      if (v25 > v33)
      {
        size_t v35 = &v26[v32];
        *(void *)(a3 + 48) = v35;
        *(_DWORD *)(a3 + 56) = v25 + a1 - v35;
      }
      uint64_t v36 = _UIPhoneFormatEntryReplacementCountryCodeRange(v12, v21);
      if (v36 != -1)
      {
        uint64_t v37 = (char *)v12 + *v12 + *((unsigned int *)v12 + 1) + *(unsigned __int16 *)(v22 + 14) + v36;
        size_t v38 = strlen(v37);
        uint64_t CountryOffsetFromDialingCode = _GetCountryOffsetFromDialingCode(v11, 0, (uint64_t)v37, 0, v38, 0);
        if (CountryOffsetFromDialingCode != -1)
        {
          *(void *)a3 = &v11[3 * CountryOffsetFromDialingCode + 1];
          _DecomposePhoneNumberWithCountryIndex(a1, CountryOffsetFromDialingCode, a3, a4, 0);
        }
      }
      return 1;
    }
    else
    {
      uint64_t v19 = (unsigned __int8 *)v18;
      if (v52) {
        uint64_t v20 = NumberOfDigitsRequiredForPattern(v52);
      }
      else {
        uint64_t v20 = 0;
      }
      unsigned int v40 = NumberOfDigitsRequiredForPattern(v19);
      int64_t v41 = strlen(a1);
      if (v41 >= v20 + v40) {
        int64_t v42 = v20 + v40;
      }
      else {
        int64_t v42 = v41;
      }
      uint64_t v43 = v51;
      uint64_t result = PNGetFormatFileHeader();
      if (result)
      {
        CFStringRef v44 = (unsigned int *)result;
        a1 += v42;
        int v56 = 0;
        if (v43)
        {
          size_t v45 = strlen(v43);
          long long v46 = v44;
          uint64_t v47 = (uint64_t)v43;
          long long v48 = 0;
        }
        else
        {
          size_t v45 = strlen(a1);
          long long v48 = &v56;
          long long v46 = v44;
          uint64_t v47 = (uint64_t)a1;
        }
        uint64_t v49 = _GetCountryOffsetFromDialingCode(v46, 0, v47, 0, v45, v48);
        if (v49 != -1) {
          return _DecomposePhoneNumberWithCountryIndex(&a1[v56], v49, a3, 1, 0);
        }
        goto LABEL_52;
      }
    }
  }
  return result;
}

uint64_t PNGetFormatFileHeader()
{
  uint64_t result = sOverrideFormatFile;
  if (!sOverrideFormatFile)
  {
    if (PNGetFormatFileHeader_initOnce != -1) {
      dispatch_once(&PNGetFormatFileHeader_initOnce, &__block_literal_global_52);
    }
    return sFormatFile;
  }
  return result;
}

uint64_t _GetCountryOffsetFromDialingCode(unsigned int *a1, CFStringRef theString, uint64_t a3, CFIndex a4, CFIndex a5, _DWORD *a6)
{
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  CFIndex v7 = a5;
  CFIndex length = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  *(_OWORD *)theStringa = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)buffer = 0u;
  if (a3)
  {
    int v11 = *(char *)(a3 + a4);
    goto LABEL_17;
  }
  theStringa[0] = theString;
  *((void *)&v46 + 1) = a4;
  *(void *)&long long v47 = a5;
  CFStringRef CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(theString);
  theStringa[1] = CharactersPtr;
  if (!CharactersPtr)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    *((void *)&v47 + 1) = 0;
    CFIndex length = 0;
    *(void *)&long long v46 = CStringPtr;
    if (v7 > 0)
    {
      if (CStringPtr)
      {
        LOWORD(v11) = CStringPtr[a4];
      }
      else
      {
        if ((unint64_t)v7 >= 0x40) {
          v16.CFIndex length = 64;
        }
        else {
          v16.CFIndex length = v7;
        }
        CFIndex length = v16.length;
        v16.CFIndex location = a4;
        CFStringGetCharacters(theString, v16, buffer);
        LOWORD(v11) = buffer[-*((void *)&v47 + 1)];
      }
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  *((void *)&v47 + 1) = 0;
  CFIndex length = 0;
  *(void *)&long long v46 = 0;
  if (v7 < 1)
  {
LABEL_11:
    LOWORD(v11) = 0;
    goto LABEL_16;
  }
  LOWORD(v11) = *((_WORD *)&CharactersPtr->isa + a4);
LABEL_16:
  int v11 = (unsigned __int16)v11;
LABEL_17:
  if (v11 == 48) {
    return 0xFFFFFFFFLL;
  }
  unsigned int Count = UIPhoneFormatCountryGetCount(a1);
  if (!Count) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = 0;
  CFIndex v19 = a3 + a4;
  uint64_t v20 = a1 + 1;
  unint64_t v33 = a6;
  uint64_t v34 = Count;
  size_t v35 = a1;
  CFIndex v36 = v7;
  while (1)
  {
    size_t v21 = strlen((const char *)&a1[3 * v18 + 1]);
    if (v7 >= v21) {
      break;
    }
LABEL_21:
    ++v18;
    v20 += 3;
    uint64_t result = 0xFFFFFFFFLL;
    a1 = v35;
    CFIndex v7 = v36;
    if (v18 == v34) {
      return result;
    }
  }
  size_t v22 = v21;
  if (v21)
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 64;
    do
    {
      uint64_t v26 = (unint64_t)v24 >= 4 ? 4 : v24;
      int32_t v27 = u_charDigitValue(*((char *)v20 + v24));
      if (a3)
      {
        UChar32 v28 = *(char *)(v19 + v24);
      }
      else
      {
        if (v24 < 0 || (uint64_t v29 = v47, (uint64_t)v47 <= v24))
        {
          UniChar v30 = 0;
        }
        else if (theStringa[1])
        {
          UniChar v30 = *((_WORD *)&theStringa[1]->isa + v24 + *((void *)&v46 + 1));
        }
        else if ((void)v46)
        {
          UniChar v30 = *(char *)(v46 + *((void *)&v46 + 1) + v24);
        }
        else
        {
          if (length <= v24 || (uint64_t v31 = *((void *)&v47 + 1), *((uint64_t *)&v47 + 1) > v24))
          {
            uint64_t v32 = v24 - v26 + 64;
            if (v32 >= (uint64_t)v47) {
              uint64_t v32 = v47;
            }
            *((void *)&v47 + 1) = v24 - v26;
            CFIndex length = v32;
            if ((uint64_t)v47 >= v25 - v26) {
              uint64_t v29 = v25 - v26;
            }
            v49.CFIndex length = v29 + v26 + v23;
            v49.CFIndex location = v24 - v26 + *((void *)&v46 + 1);
            CFStringGetCharacters(theStringa[0], v49, buffer);
            uint64_t v31 = *((void *)&v47 + 1);
          }
          UniChar v30 = buffer[v24 - v31];
        }
        UChar32 v28 = v30;
      }
      if (v27 != u_charDigitValue(v28)) {
        goto LABEL_21;
      }
      ++v24;
      --v23;
      ++v25;
    }
    while (v22 != v24);
  }
  if (v33) {
    *unint64_t v33 = v22;
  }
  return v18;
}

unsigned int *UIPhoneFormatCountryGetCount(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t _NumberRangeWithoutVerticalServiceCode(const __CFString *a1, const char *a2, int a3)
{
  uint64_t v6 = PNGetFormatFileHeader();
  if (v6)
  {
    CFIndex v7 = (unsigned int *)v6;
    if (a2)
    {
      if (strlen(a2) >= 3)
      {
        int v8 = *(unsigned __int8 *)a2;
        BOOL v9 = v8 == 42;
        if ((v8 == 35 || v8 == 42) && u_isdigit(a2[1]) && u_isdigit(a2[2]))
        {
          size_t v10 = strlen(a2);
          a1 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)a2, v10, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
          goto LABEL_17;
        }
      }
    }
    else if ((unint64_t)CFStringGetLength(a1) >= 3)
    {
      int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, 0);
      int v12 = CFStringGetCharacterAtIndex(a1, 0);
      BOOL v9 = CharacterAtIndex == 42;
      if (CharacterAtIndex == 42 || v12 == 35)
      {
        UChar32 v13 = CFStringGetCharacterAtIndex(a1, 1);
        if (u_isdigit(v13))
        {
          UChar32 v14 = CFStringGetCharacterAtIndex(a1, 2);
          if (u_isdigit(v14))
          {
            CFRetain(a1);
LABEL_17:
            CFIndex Length = CFStringGetLength(a1);
            if (Length < 2)
            {
              uint64_t v27 = -1;
            }
            else
            {
              uint64_t v16 = Length;
              char v17 = 0;
              CFIndex v18 = Length - 1;
              uint64_t v19 = -1;
              do
              {
                if (a2) {
                  UniChar v20 = a2[v18];
                }
                else {
                  UniChar v20 = CFStringGetCharacterAtIndex(a1, v18);
                }
                if (v20 == 42 || v20 == 35)
                {
                  if (v19 == -1) {
                    uint64_t v19 = v18;
                  }
                  char v17 = 1;
                }
                unint64_t v21 = v18-- + 1;
              }
              while (v21 > 2);
              if (v19 == -1)
              {
                uint64_t v27 = -1;
                if (v17 & 1 | !v9 || v16 < 4) {
                  goto LABEL_62;
                }
                CFAllocatorRef v30 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
                int v41 = a3;
                size_t v31 = strlen((const char *)&v7[3 * a3 + 2]);
                CFStringRef theString1 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&v7[3 * a3 + 2], v31, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
                if (v16 >= 5) {
                  uint64_t v32 = 5;
                }
                else {
                  uint64_t v32 = v16;
                }
                CFIndex v33 = 3;
                CFIndex v34 = v16 - 3;
                while (v32 != v33)
                {
                  UChar32 v35 = CFStringGetCharacterAtIndex(a1, v33);
                  if (!u_isdigit(v35)) {
                    break;
                  }
                  v54.CFIndex location = v33;
                  v54.CFIndex length = v34;
                  CFStringRef v36 = CFStringCreateWithSubstring(v30, a1, v54);
                  char valid = _PNIsValidPhoneNumberForCountry(v36, theString1, 0, 1, 0);
                  CFRelease(v36);
                  ++v33;
                  --v34;
                  if (valid)
                  {
                    uint64_t v27 = v33 - 1;
                    goto LABEL_60;
                  }
                }
                memset(v45, 0, sizeof(v45));
                uint64_t v43 = 0;
                CFIndex v44 = CFStringGetLength(a1);
                CFStringRef v46 = a1;
                uint64_t v49 = 0;
                CFIndex v50 = v44;
                CFStringRef CharactersPtr = CFStringGetCharactersPtr(a1);
                CStringPtr = 0;
                long long v47 = CharactersPtr;
                if (!CharactersPtr) {
                  CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
                }
                uint64_t v51 = 0;
                uint64_t v52 = 0;
                long long v48 = CStringPtr;
                unsigned int Count = UIPhoneFormatCountryGetCount(v7);
                if (_FindFormatEntryForDigitsInCountry((unsigned __int16 *)((char *)&v7[3 * Count + 1] + v7[3 * v41 + 3]), (uint64_t)v45, 0, &v43, 0, 0, 0))
                {
                  uint64_t v27 = -1;
                }
                else if (CFStringGetCharacterAtIndex(a1, 3) == 43)
                {
                  uint64_t v27 = 3;
                }
                else if (v16 >= 5 && CFStringGetCharacterAtIndex(a1, 4) == 43)
                {
                  uint64_t v27 = 4;
                }
                else if (CFStringCompare(theString1, @"us", 0))
                {
                  uint64_t v27 = -1;
                }
                else
                {
                  uint64_t v27 = 3;
                }
LABEL_60:
                CFStringRef v28 = theString1;
              }
              else
              {
                CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
                uint64_t v23 = (const char *)&v7[3 * a3 + 2];
                size_t v24 = strlen(v23);
                CFStringRef v25 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v23, v24, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
                v53.CFIndex length = v16 + ~v19;
                v53.CFIndex location = v19 + 1;
                CFStringRef v26 = CFStringCreateWithSubstring(v22, a1, v53);
                if (_PNIsValidPhoneNumberForCountry(v26, v25, 1, 1, 0)) {
                  uint64_t v27 = v19 + 1;
                }
                else {
                  uint64_t v27 = -1;
                }
                CFRelease(v26);
                CFStringRef v28 = v25;
              }
              CFRelease(v28);
            }
LABEL_62:
            CFRelease(a1);
            return v27;
          }
        }
      }
    }
    return -1;
  }
  else
  {
    if (a2) {
      strlen(a2);
    }
    else {
      CFStringGetLength(a1);
    }
    return 0;
  }
}

uint64_t InlineBufferHasPatternAtOffset(UniChar *buffer, uint64_t a2, char *a3, uint64_t a4)
{
  char v4 = *a3;
  if (!*a3) {
    return v4 & 1;
  }
  int v9 = 0;
  LODWORD(v10) = 0;
  int v11 = a3;
  while (1)
  {
    int64_t v12 = a4 + v9;
    if (a2)
    {
      UniChar v13 = *(char *)(a2 + v12);
      goto LABEL_19;
    }
    if (v12 < 0) {
      break;
    }
    int64_t v14 = *((void *)buffer + 20);
    if (v14 <= v12) {
      break;
    }
    uint64_t v15 = *((void *)buffer + 17);
    if (v15)
    {
      UniChar v13 = *(_WORD *)(v15 + 2 * (*((void *)buffer + 19) + v12));
    }
    else
    {
      uint64_t v16 = *((void *)buffer + 18);
      if (v16)
      {
        UniChar v13 = *(char *)(v16 + *((void *)buffer + 19) + v12);
      }
      else
      {
        if (*((void *)buffer + 22) <= v12 || (int64_t v17 = *((void *)buffer + 21), v17 > v12))
        {
          int64_t v18 = v12 - 4;
          if ((unint64_t)v12 < 4) {
            int64_t v18 = 0;
          }
          if (v18 + 64 < v14) {
            int64_t v14 = v18 + 64;
          }
          *((void *)buffer + 21) = v18;
          *((void *)buffer + 22) = v14;
          v28.CFIndex location = *((void *)buffer + 19) + v18;
          v28.CFIndex length = v14 - v18;
          CFStringGetCharacters(*((CFStringRef *)buffer + 16), v28, buffer);
          int64_t v17 = *((void *)buffer + 21);
        }
        UniChar v13 = buffer[v12 - v17];
      }
    }
LABEL_19:
    UChar32 v19 = v13;
    if (!v13) {
      break;
    }
    int v20 = *v11;
    BOOL v21 = (v20 & 0xFE) != 0x2A || v19 == v20;
    if (!v21 || u_isdigit((char)v20) && (int32_t v22 = u_charDigitValue(*v11), v22 != u_charDigitValue(v19)))
    {
LABEL_38:
      char v26 = 0;
      LOBYTE(v24) = 0;
      goto LABEL_40;
    }
    UChar32 v23 = *v11;
    if (v23 != 92) {
      goto LABEL_44;
    }
    int v24 = a3[(int)v10 + 1];
    if (v19 != 35 && v24 == 35) {
      goto LABEL_38;
    }
    if (v24 == 35)
    {
      ++v9;
      LODWORD(v10) = v10 + 1;
    }
    else
    {
LABEL_44:
      if (u_isdigit(v23)
        || (unsigned int v25 = *v11, v25 <= 0x2B) && (LOBYTE(v24) = 1, ((1 << v25) & 0xC0800000000) != 0))
      {
        ++v9;
      }
    }
    uint64_t v10 = (int)v10 + 1;
    int v11 = &a3[v10];
    if (!a3[v10])
    {
      char v26 = 1;
      goto LABEL_40;
    }
  }
  char v26 = 0;
  LOBYTE(v24) = 1;
LABEL_40:
  char v4 = v26 | v24;
  return v4 & 1;
}

uint64_t NumberOfDigitsRequiredForPattern(unsigned __int8 *a1)
{
  v1 = a1;
  int v2 = *a1;
  uint64_t result = v2 == 43;
  while (v2 == 92)
  {
    if (v1[1] == 35)
    {
      ++v1;
      goto LABEL_13;
    }
LABEL_7:
    int v4 = v2;
    unsigned int v5 = (char)v2 - 48;
    if (v4 != 35 && v5 >= 0xA) {
      uint64_t result = result;
    }
    else {
      uint64_t result = (result + 1);
    }
LABEL_13:
    char v7 = *++v1;
    LOBYTE(v2) = v7;
  }
  if ((_BYTE)v2) {
    goto LABEL_7;
  }
  return result;
}

uint64_t _FormatEntryAndNationalPrefixForDigitsInCountry(uint64_t a1, UniChar *a2, char *__s1, uint64_t *a4, int a5, unsigned __int8 **a6, CFStringRef *a7, uint64_t a8)
{
  if (a5) {
    NationalAccessCodeForDigitsInCountry = 0;
  }
  else {
    NationalAccessCodeForDigitsInCountry = _FindNationalAccessCodeForDigitsInCountry(a2, (uint64_t)__s1, a4, (unsigned __int8 *)(a1 + 12), a7);
  }
  *a6 = NationalAccessCodeForDigitsInCountry;
  uint64_t result = _FindFormatEntryForDigitsInCountry((unsigned __int16 *)a1, (uint64_t)a2, __s1, a4, a5, NationalAccessCodeForDigitsInCountry != 0, a8);
  if (a5)
  {
    if (!result)
    {
      uint64_t v18 = a4[1];
      uint64_t result = (uint64_t)_FindNationalAccessCodeForDigitsInCountry(a2, (uint64_t)__s1, a4, (unsigned __int8 *)(a1 + 12), a7);
      if (result)
      {
        if (a8)
        {
          *(unsigned char *)(a8 + 41) = 1;
          *(void *)(a8 + 56) = v18 - a4[1];
        }
        uint64_t result = _FindFormatEntryForDigitsInCountry((unsigned __int16 *)a1, (uint64_t)a2, __s1, a4, 1, *a6 != 0, a8);
      }
    }
  }
  if (a5 & 1) == 0 && !*a6 && result && (*(_WORD *)(a1 + 2) & 1) != 0 && (*(unsigned char *)(result + 12)) {
    return 0;
  }
  return result;
}

uint64_t _FindFormatEntryForDigitsInCountry(unsigned __int16 *a1, uint64_t a2, char *__s1, uint64_t *a4, int a5, int a6, uint64_t a7)
{
  uint64_t v9 = a2;
  uint64_t v10 = *a1;
  if (a4[1] < 1)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    uint64_t v11 = 0;
    unsigned int v12 = 0;
    uint64_t v13 = 0;
    do
    {
      int64_t v14 = *a4 + v11;
      if (__s1)
      {
        int v15 = __s1[v14];
      }
      else
      {
        if (v14 < 0 || (int64_t v16 = *(void *)(v9 + 160), v16 <= v14))
        {
          LOWORD(v15) = 0;
        }
        else
        {
          uint64_t v17 = *(void *)(v9 + 136);
          if (v17)
          {
            LOWORD(v15) = *(_WORD *)(v17 + 2 * (*(void *)(v9 + 152) + v14));
          }
          else
          {
            uint64_t v19 = *(void *)(v9 + 144);
            if (v19)
            {
              LOWORD(v15) = *(char *)(v19 + *(void *)(v9 + 152) + v14);
            }
            else
            {
              if (*(void *)(v9 + 176) <= v14 || (int64_t v20 = *(void *)(v9 + 168), v20 > v14))
              {
                int64_t v21 = v14 - 4;
                if ((unint64_t)v14 < 4) {
                  int64_t v21 = 0;
                }
                if (v21 + 64 < v16) {
                  int64_t v16 = v21 + 64;
                }
                *(void *)(v9 + 168) = v21;
                *(void *)(v9 + 176) = v16;
                uint64_t v22 = v13;
                v85.CFIndex location = *(void *)(v9 + 152) + v21;
                v85.CFIndex length = v16 - v21;
                CFStringGetCharacters(*(CFStringRef *)(v9 + 128), v85, (UniChar *)a2);
                uint64_t v13 = v22;
                uint64_t v9 = a2;
                int64_t v20 = *(void *)(a2 + 168);
              }
              LOWORD(v15) = *(_WORD *)(v9 + 2 * (v14 - v20));
            }
          }
        }
        int v15 = (unsigned __int16)v15;
      }
      if (v15 == 42 || v15 == 35)
      {
        uint64_t v13 = (v13 + 1);
        uint64_t v18 = a4[1];
      }
      else
      {
        uint64_t v18 = a4[1];
        unsigned int v12 = v18;
      }
      uint64_t v11 = ++v12;
    }
    while (v18 > v12);
  }
  UChar32 v23 = a1;
  if (!*((_DWORD *)a1 + 2)) {
    return 0;
  }
  uint64_t result = 0;
  unsigned int v25 = 0;
  char v26 = (unsigned __int16 *)((char *)a1 + v10);
  if (a5) {
    int v27 = 2;
  }
  else {
    int v27 = 0;
  }
  int v75 = v27 | a6;
  uint64_t v28 = v13;
  BOOL v76 = (v9 | (unint64_t)__s1) == 0;
  uint64_t v73 = v13 + 64;
  int v81 = v13;
  uint64_t v78 = v13;
  do
  {
    uint64_t v29 = *v26;
    if (a4[1] - v28 < v29) {
      goto LABEL_109;
    }
    uint64_t v83 = result;
    if (v76) {
      goto LABEL_35;
    }
    unsigned int v30 = 0;
    if (*v26)
    {
      uint64_t v50 = *a4;
      uint64_t v51 = *a4 + v28;
      if ((v51 & 0x8000000000000000) == 0)
      {
        size_t v52 = v51 + v29;
        if (__s1)
        {
          size_t v53 = strnlen(__s1, v52);
          uint64_t v9 = a2;
          LODWORD(v13) = v81;
        }
        else if ((*(void *)(v9 + 160) & (unint64_t)~(*(uint64_t *)(v9 + 160) >> 63)) >= v52)
        {
          size_t v53 = v51 + v29;
        }
        else
        {
          size_t v53 = *(void *)(v9 + 160) & ~(*(uint64_t *)(v9 + 160) >> 63);
        }
        if (v51 < v53)
        {
          LODWORD(v54) = 0;
          uint64_t v55 = -v51;
          uint64_t v56 = v73 + v50;
          size_t v57 = v53;
          while (1)
          {
            uint64_t v58 = (unint64_t)v51 >= 4 ? 4 : v51;
            if (__s1)
            {
              UChar32 v59 = __s1[v51];
            }
            else
            {
              if (v51 < 0 || (uint64_t v60 = *(void *)(v9 + 160), v60 <= v51))
              {
                unsigned __int16 v62 = 0;
              }
              else
              {
                uint64_t v61 = *(void *)(v9 + 136);
                if (v61)
                {
                  unsigned __int16 v62 = *(_WORD *)(v61 + 2 * (v51 + *(void *)(v9 + 152)));
                }
                else
                {
                  uint64_t v67 = *(void *)(v9 + 144);
                  if (v67)
                  {
                    unsigned __int16 v62 = *(char *)(v67 + *(void *)(v9 + 152) + v51);
                  }
                  else
                  {
                    if (*(void *)(v9 + 176) <= v51 || (uint64_t v68 = *(void *)(v9 + 168), v68 > v51))
                    {
                      uint64_t v69 = v58 + v55;
                      uint64_t v70 = v56 - v58;
                      uint64_t v71 = v51 - v58;
                      uint64_t v72 = v71 + 64;
                      if (v71 + 64 >= v60) {
                        uint64_t v72 = *(void *)(v9 + 160);
                      }
                      *(void *)(v9 + 168) = v71;
                      *(void *)(v9 + 176) = v72;
                      if (v60 >= v70) {
                        uint64_t v60 = v70;
                      }
                      v87.CFIndex length = v60 + v69;
                      v87.CFIndex location = v71 + *(void *)(v9 + 152);
                      CFStringGetCharacters(*(CFStringRef *)(v9 + 128), v87, (UniChar *)a2);
                      uint64_t v9 = a2;
                      uint64_t v68 = *(void *)(a2 + 168);
                    }
                    unsigned __int16 v62 = *(_WORD *)(v9 - 2 * v68 + 2 * v51);
                  }
                }
              }
              UChar32 v59 = v62;
            }
            int32_t v63 = u_charDigitValue(v59);
            unsigned int v30 = 0;
            BOOL v64 = ((10 * v54) & 0xFFFFFFFF00000000) != 0;
            uint64_t v65 = (10 * v54) + (uint64_t)v63;
            uint64_t v54 = v65 << 31 >> 31;
            BOOL v66 = v54 != v65;
            if (v64 || v66) {
              break;
            }
            uint64_t v9 = a2;
            LODWORD(v13) = v81;
            if ((v54 & 0x8000000000000000) == 0)
            {
              ++v51;
              --v55;
              ++v56;
              unsigned int v30 = v54;
              if (v57 != v51) {
                continue;
              }
            }
            goto LABEL_36;
          }
          uint64_t v9 = a2;
          LODWORD(v13) = v81;
          goto LABEL_36;
        }
LABEL_35:
        unsigned int v30 = 0;
      }
    }
LABEL_36:
    if (!v26[1])
    {
      uint64_t v28 = v78;
      UChar32 v23 = a1;
      uint64_t result = v83;
      goto LABEL_109;
    }
    uint64_t v31 = 0;
    uint64_t v28 = v78;
    UChar32 v23 = a1;
    uint64_t result = v83;
    while (2)
    {
      uint64_t v32 = &v26[8 * v31];
      unsigned int v34 = *((_DWORD *)v32 + 1);
      uint64_t v33 = (uint64_t)(v32 + 2);
      if (v30 < v34) {
        goto LABEL_102;
      }
      if (v30 > *(_DWORD *)&v26[8 * v31 + 4]) {
        goto LABEL_102;
      }
      uint64_t v35 = a4[1];
      CFStringRef v36 = &v26[8 * v31];
      if (v35 - v28 > *((unsigned __int8 *)v36 + 13)) {
        goto LABEL_102;
      }
      char v38 = *((unsigned char *)v36 + 16);
      uint64_t v37 = v36 + 8;
      if ((v13 == 0) == (v38 & 0x10) >> 4) {
        goto LABEL_102;
      }
      if (!v13) {
        goto LABEL_79;
      }
      if (v35 < 1)
      {
        unsigned int v25 = 0;
        goto LABEL_79;
      }
      uint64_t v84 = result;
      uint64_t v39 = 0;
      unsigned int v25 = 0;
      long long v40 = (unsigned __int8 *)v23 + *v23 + *((unsigned int *)v23 + 1) + v26[8 * v31 + 9];
      do
      {
        int64_t v41 = *a4 + v39;
        if (__s1)
        {
          int v42 = __s1[v41];
        }
        else
        {
          if (v41 < 0 || (int64_t v43 = *(void *)(v9 + 160), v43 <= v41))
          {
            LOWORD(v42) = 0;
          }
          else
          {
            uint64_t v44 = *(void *)(v9 + 136);
            if (v44)
            {
              LOWORD(v42) = *(_WORD *)(v44 + 2 * (*(void *)(v9 + 152) + v41));
            }
            else
            {
              uint64_t v47 = *(void *)(v9 + 144);
              if (v47)
              {
                LOWORD(v42) = *(char *)(v47 + *(void *)(v9 + 152) + v41);
              }
              else
              {
                if (*(void *)(v9 + 176) <= v41 || (int64_t v48 = *(void *)(v9 + 168), v48 > v41))
                {
                  int64_t v49 = v41 - 4;
                  if ((unint64_t)v41 < 4) {
                    int64_t v49 = 0;
                  }
                  if (v49 + 64 < v43) {
                    int64_t v43 = v49 + 64;
                  }
                  *(void *)(v9 + 168) = v49;
                  *(void *)(v9 + 176) = v43;
                  v86.CFIndex location = *(void *)(v9 + 152) + v49;
                  v86.CFIndex length = v43 - v49;
                  CFStringGetCharacters(*(CFStringRef *)(v9 + 128), v86, (UniChar *)a2);
                  LODWORD(v13) = v81;
                  uint64_t v9 = a2;
                  int64_t v48 = *(void *)(a2 + 168);
                }
                LOWORD(v42) = *(_WORD *)(v9 + 2 * (v41 - v48));
              }
            }
          }
          int v42 = (unsigned __int16)v42;
        }
        if (v42 == 35)
        {
          BOOL v46 = *v40 == 92 && v40[1] == 35;
          ++v40;
          goto LABEL_62;
        }
        if (v42 != 42)
        {
          BOOL v46 = 1;
LABEL_62:
          uint64_t v35 = a4[1];
          unsigned int v25 = v35;
          goto LABEL_63;
        }
        int v45 = *v40++;
        BOOL v46 = v45 == 42;
        uint64_t v35 = a4[1];
LABEL_63:
        uint64_t v39 = ++v25;
      }
      while (v35 > v25 && v46);
      uint64_t v28 = v78;
      UChar32 v23 = a1;
      uint64_t result = v84;
      if (!v46) {
        goto LABEL_102;
      }
LABEL_79:
      if (a5 && (*v37 & 0x40) != 0) {
        goto LABEL_102;
      }
      if (!result
        || a6 && (*(unsigned char *)(result + 12) & 1) == 0 && (*v37 & 1) != 0
        || a5 && (*(unsigned char *)(result + 12) & 2) == 0 && (*v37 & 2) != 0)
      {
        if (a7) {
          goto LABEL_94;
        }
      }
      else
      {
        if (v75) {
          goto LABEL_96;
        }
        if ((*(unsigned char *)(result + 12) & 3) == 0) {
          goto LABEL_96;
        }
        if ((*v37 & 3) != 0) {
          goto LABEL_96;
        }
        uint64_t result = v33;
        if (!a7) {
          goto LABEL_96;
        }
LABEL_94:
        *(_DWORD *)(a7 + 32) = *v26;
        *(_DWORD *)(a7 + 36) = v35;
      }
      uint64_t result = v33;
LABEL_96:
      if (a6 && (*(unsigned char *)(result + 12) & 1) == 0
        || a5 && (*(unsigned char *)(result + 12) & 2) == 0
        || !v75 && (*(unsigned char *)(result + 12) & 3) != 0)
      {
LABEL_102:
        if (++v31 >= (unint64_t)v26[1]) {
          break;
        }
        continue;
      }
      break;
    }
LABEL_109:
    v26 += 8 * v26[1] + 2;
    ++v25;
  }
  while (v25 < *((_DWORD *)v23 + 2));
  return result;
}

uint64_t _UIPhoneFormatEntryReplacementCountryCodeRange(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  unint64_t v3 = (unint64_t)a1 + *a1 + *((unsigned int *)a1 + 1) + (unint64_t)*(unsigned __int16 *)(a2 + 14);
  uint64_t v4 = -1;
  while (*(unsigned char *)(v3 + v2) == 91)
  {
    if (*(unsigned char *)(v3 + v2 + 1) == 91 && !strncmp("country:", (const char *)(v3 + v2 + 2), 8uLL)) {
      uint64_t v4 = v2 + 10;
    }
LABEL_8:
    ++v2;
  }
  if (*(unsigned char *)(v3 + v2)) {
    goto LABEL_8;
  }
  return v4;
}

uint64_t PNDecomposeForCountry(char *a1, const __CFString *a2, uint64_t a3)
{
  return _PNDecomposeForCountry(a1, a2, a3, 1);
}

char *__CFPhoneNumberNormalize(char *result)
{
  if (!*((void *)result + 2))
  {
    v1 = result;
    memset(v3, 0, sizeof(v3));
    char v2 = 0;
    uint64_t result = _PNCopyBestGuessNumberForCountry(*((const __CFString **)result + 5), *((__CFString **)result + 6), 1, v3, &v2);
    *((void *)v1 + 2) = result;
  }
  return result;
}

BOOL decomposedPhoneNumbersEqual(uint64_t a1, uint64_t a2, char a3, unsigned char *a4)
{
  if (!itu_streql(*(const char **)a1, *(const char **)a2))
  {
    BOOL v10 = 0;
    LOBYTE(v11) = 0;
    if (!a4) {
      return v10;
    }
    goto LABEL_26;
  }
  size_t v8 = *(unsigned int *)(a1 + 40);
  BOOL v9 = v8 == *(_DWORD *)(a2 + 40) && itu_strneql(*(const char **)(a1 + 32), *(const char **)(a2 + 32), v8);
  size_t v12 = *(unsigned int *)(a1 + 56);
  if (v12 == *(_DWORD *)(a2 + 56))
  {
    BOOL v13 = itu_strneql(*(const char **)(a1 + 48), *(const char **)(a2 + 48), v12);
    LOBYTE(v10) = v13;
    if (a3)
    {
      LOBYTE(v11) = 1;
      if (v13) {
        goto LABEL_25;
      }
LABEL_20:
      BOOL v10 = 0;
      if (!a4) {
        return v10;
      }
      goto LABEL_26;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (a3)
    {
      LOBYTE(v11) = 1;
      if (!a4) {
        return v10;
      }
      goto LABEL_26;
    }
  }
  if (*(void *)a1) {
    BOOL v14 = strcmp(*(const char **)a1, "86") == 0;
  }
  else {
    BOOL v14 = 0;
  }
  LOBYTE(v11) = v14 || v10 && v9;
  if (!v10) {
    goto LABEL_20;
  }
  if (v11)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      LOBYTE(v11) = 0;
      BOOL v9 = *(void *)(a2 + 32) == 0;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
LABEL_25:
  BOOL v10 = v9;
  if (a4) {
LABEL_26:
  }
    *a4 = v11;
  return v10;
}

BOOL itu_strneql(const char *a1, const char *a2, size_t a3)
{
  if (!a1 && a2) {
    return 0;
  }
  if (a1 == a2) {
    return 1;
  }
  if (a1 && !a2) {
    return 0;
  }
  return strncmp(a1, a2, a3) == 0;
}

BOOL itu_streql(const char *a1, const char *a2)
{
  if (!a1 && a2) {
    return 0;
  }
  if (a1 == a2) {
    return 1;
  }
  if (a1 && !a2) {
    return 0;
  }
  return strcmp(a1, a2) == 0;
}

unsigned __int8 *_FindNationalAccessCodeForDigitsInCountry(UniChar *a1, uint64_t a2, uint64_t *a3, unsigned __int8 *a4, CFStringRef *a5)
{
  if (!*a4) {
    return 0;
  }
  uint64_t v6 = a4;
  while (1)
  {
    unsigned int v10 = NumberOfDigitsRequiredForPattern(v6);
    if (a3[1] >= (unint64_t)v10)
    {
      unsigned int v11 = v10;
      if (InlineBufferHasPatternAtOffset(a1, a2, (char *)v6, *a3)) {
        break;
      }
    }
    size_t v12 = &v6[strlen((const char *)v6)];
    int v13 = v12[1];
    uint64_t v6 = v12 + 1;
    if (!v13) {
      return 0;
    }
  }
  if (a5) {
    *a5 = _CreateFormattedStringForDigitsInRange((uint64_t)a1, a2, *a3, v11, (char *)v6, 0, 0, 0, 1);
  }
  uint64_t v14 = a3[1] - v11;
  *a3 += v11;
  a3[1] = v14;
  return v6;
}

CFStringRef _CreateFormattedStringForDigitsInRange(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4, char *__s, char a6, const __CFString *a7, const __CFString *a8, char a9)
{
  CFStringRef v9 = a8;
  if (a7) {
    BOOL v13 = a8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  size_t v15 = strlen(__s);
  if (a7)
  {
    CFIndex Length = CFStringGetLength(a7);
    if (v9)
    {
LABEL_9:
      CFIndex v17 = CFStringGetLength(v9);
      goto LABEL_12;
    }
  }
  else
  {
    CFIndex Length = 0;
    if (v9) {
      goto LABEL_9;
    }
  }
  CFIndex v17 = 0;
LABEL_12:
  size_t v18 = v15 + 4;
  if (!v14) {
    size_t v18 = v15 + 1;
  }
  size_t v19 = v18 + Length + v17;
  int64_t v20 = malloc_type_malloc(2 * v19, 0x743F1568uLL);
  bzero(v20, 2 * v19);
  uint64_t v21 = 0;
  char v22 = *__s;
  if (!*__s)
  {
    UChar32 v23 = (UniChar *)v20;
    goto LABEL_165;
  }
  UChar32 v23 = (UniChar *)v20;
  if (a4)
  {
    uint64_t v92 = 2 * v19;
    unint64_t v24 = 0;
    uint64_t v21 = 0;
    int v100 = 0;
    char v25 = 0;
    CFStringRef v26 = a7;
    int v27 = 0;
    uint64_t v98 = 0;
    BOOL v28 = 0;
    CFStringRef theString = v26;
    BOOL v95 = v26 == 0;
    if (a4 >= v19) {
      size_t v29 = v19;
    }
    else {
      size_t v29 = a4;
    }
    unint64_t v93 = v29;
    uint64_t v30 = a2;
    UChar32 v23 = (UniChar *)v20;
    CFStringRef v96 = v9;
    while (1)
    {
      if (v28)
      {
        if (v22 != 93)
        {
          char v25 = 0;
          BOOL v28 = 1;
          goto LABEL_72;
        }
        char v25 = 0;
        int v31 = __s[v21 + 1];
        BOOL v13 = v31 == 93;
        BOOL v28 = v31 != 93;
        if (v13) {
          uint64_t v32 = v21 + 1;
        }
        else {
          uint64_t v32 = v21;
        }
      }
      else
      {
        if (v22 <= 90)
        {
          switch(v22)
          {
            case ' ':
              BOOL v28 = 0;
              if (((v27 | HIDWORD(v98) | v98) & 1) != 0 && ((a6 & 8) == 0) | v25 & 1) {
                goto LABEL_71;
              }
              char v25 = 0;
              goto LABEL_72;
            case '!':
            case '""':
            case '$':
            case '%':
            case '&':
            case '\'':
              goto LABEL_43;
            case '#':
              int64_t v36 = v24 + a3;
              if (v30)
              {
                UniChar v37 = *(char *)(v30 + v36);
              }
              else if (v36 < 0 || (uint64_t v43 = a1, v44 = *(void *)(a1 + 160), v44 <= v36))
              {
                UniChar v37 = 0;
              }
              else
              {
                uint64_t v45 = *(void *)(a1 + 136);
                if (v45)
                {
                  UniChar v37 = *(_WORD *)(v45 + 2 * (*(void *)(a1 + 152) + v36));
                }
                else
                {
                  uint64_t v79 = *(void *)(a1 + 144);
                  if (v79)
                  {
                    UniChar v37 = *(char *)(v79 + *(void *)(a1 + 152) + v36);
                  }
                  else
                  {
                    if (*(void *)(a1 + 176) <= v36 || (int64_t v82 = *(void *)(a1 + 168), v82 > v36))
                    {
                      int64_t v83 = v36 - 4;
                      if ((unint64_t)v36 < 4) {
                        int64_t v83 = 0;
                      }
                      if (v83 + 64 < v44) {
                        int64_t v44 = v83 + 64;
                      }
                      *(void *)(a1 + 168) = v83;
                      *(void *)(a1 + 176) = v44;
                      v110.CFIndex location = *(void *)(a1 + 152) + v83;
                      v110.CFIndex length = v44 - v83;
                      CFStringGetCharacters(*(CFStringRef *)(a1 + 128), v110, (UniChar *)a1);
                      uint64_t v43 = a1;
                      int64_t v82 = *(void *)(a1 + 168);
                    }
                    UniChar v37 = *(_WORD *)(v43 + 2 * (v36 - v82));
                  }
                }
              }
              *UChar32 v23 = v37;
              if (pn_uset_basicPresentationSetContains() == 1)
              {
                BOOL v28 = 0;
                char v25 = 0;
                ++v23;
                goto LABEL_90;
              }
              *UChar32 v23 = 0;
              if (v100)
              {
                uint64_t v47 = u_strrchr((const UChar *)v20, 0x28u);
                if (v47 < v23)
                {
                  if ((char *)v23 - (char *)v47 >= 2) {
                    int32_t v48 = ((unint64_t)((char *)v23 - (char *)v47) >> 1) - 1;
                  }
                  else {
                    int32_t v48 = 0;
                  }
                  u_strncpy(v47, v47 + 1, v48);
                  *--UChar32 v23 = 0;
                }
              }
              uint64_t v30 = a2;
              uint64_t v49 = a1;
              unint64_t v50 = v93 - v24;
              if (v93 <= v24)
              {
                BOOL v28 = 0;
                char v25 = 0;
                int v100 = 0;
                int v27 = 1;
                goto LABEL_72;
              }
              v90 = v20;
              size_t v91 = a4;
              uint64_t v51 = 0;
              unint64_t v52 = a2 + a3 + v24;
              unint64_t v53 = a3 + v24;
              uint64_t v54 = -(uint64_t)(a3 + v24);
              unint64_t v55 = a3 + 64 + v24;
              unint64_t v56 = v53;
              size_t v57 = v23;
              uint64_t v58 = a1 + 2 * v53;
              do
              {
                if (v56 >= 4) {
                  uint64_t v59 = 4;
                }
                else {
                  uint64_t v59 = v56;
                }
                if (v30)
                {
                  UniChar v60 = *(char *)(v52 + v51);
                }
                else
                {
                  uint64_t v61 = v53 + v51;
                  if (((v53 + v51) & 0x8000000000000000) != 0 || (uint64_t v62 = *(void *)(v49 + 160), v62 <= v61))
                  {
                    UniChar v60 = 0;
                  }
                  else
                  {
                    uint64_t v63 = v49;
                    uint64_t v64 = *(void *)(v49 + 136);
                    if (v64)
                    {
                      UniChar v60 = *(_WORD *)(v64 + 2 * (v53 + v51 + *(void *)(v63 + 152)));
                    }
                    else
                    {
                      uint64_t v65 = *(void *)(v63 + 144);
                      if (v65)
                      {
                        UniChar v60 = *(char *)(v65 + *(void *)(v63 + 152) + v53 + v51);
                      }
                      else
                      {
                        if (*(void *)(v63 + 176) <= v61 || (uint64_t v66 = *(void *)(v63 + 168), v66 > v61))
                        {
                          unint64_t v67 = v53 - v59;
                          uint64_t v68 = v59 + v54;
                          uint64_t v69 = v55 - v59;
                          uint64_t v70 = v51 + v67;
                          uint64_t v71 = v70 + 64;
                          if (v70 + 64 >= v62) {
                            uint64_t v71 = v62;
                          }
                          *(void *)(v63 + 168) = v70;
                          *(void *)(v63 + 176) = v71;
                          if (v62 >= v69) {
                            uint64_t v62 = v69;
                          }
                          v106.CFIndex length = v62 + v68;
                          unint64_t v101 = v52;
                          uint64_t v88 = v58;
                          unint64_t v89 = v53;
                          v106.CFIndex location = v70 + *(void *)(v63 + 152);
                          CFStringGetCharacters(*(CFStringRef *)(v63 + 128), v106, (UniChar *)v63);
                          uint64_t v58 = v88;
                          unint64_t v53 = v89;
                          unint64_t v52 = v101;
                          uint64_t v30 = a2;
                          uint64_t v66 = *(void *)(v63 + 168);
                        }
                        UniChar v60 = *(_WORD *)(v58 - 2 * v66 + 2 * v51);
                      }
                    }
                    uint64_t v49 = v63;
                  }
                }
                v23[v51] = v60;
                ++v57;
                ++v51;
                ++v56;
                --v54;
                ++v55;
                int v27 = 1;
              }
              while (v50 != v51);
              BOOL v28 = 0;
              char v25 = 0;
              int v100 = 0;
              UChar32 v23 = v57;
              uint64_t v32 = v21;
              unint64_t v24 = v93;
              int64_t v20 = v90;
              a4 = v91;
              CFStringRef v9 = v96;
              goto LABEL_73;
            case '(':
              int v100 = 1;
              if ((a6 & 4) != 0) {
                goto LABEL_57;
              }
              goto LABEL_71;
            case ')':
              if (((v27 | HIDWORD(v98) | v98) & 1) == 0 && ((v100 ^ 1) & 1) == 0)
              {
                bzero(v20, v92);
                uint64_t v30 = a2;
                BOOL v28 = 0;
                uint64_t v98 = 0;
                int v27 = 0;
                char v25 = 0;
                int v100 = 0;
                UChar32 v23 = (UniChar *)v20;
                goto LABEL_72;
              }
              int v100 = 0;
              if ((a6 & 4) == 0) {
                goto LABEL_71;
              }
              char v25 = 0;
              BOOL v28 = 0;
              break;
            default:
              if (v22 != 45) {
                goto LABEL_43;
              }
              if ((a6 & 8) == 0) {
                goto LABEL_71;
              }
              goto LABEL_57;
          }
          goto LABEL_72;
        }
        if (v22 > 98)
        {
          if (v22 == 99)
          {
            if (v9)
            {
              if (v98)
              {
                BOOL v28 = 0;
                char v25 = 0;
                LODWORD(v98) = 1;
              }
              else
              {
                if ((a6 & 2) != 0)
                {
                  do
                  {
                    uint64_t v72 = v21 + 1;
                    int v73 = __s[++v21];
                  }
                  while (v73 == 32);
                  uint64_t v21 = v72 - 1;
                }
                else
                {
                  CFIndex v46 = CFStringGetLength(v9);
                  v105.CFIndex location = 0;
                  v105.CFIndex length = v46;
                  CFStringGetCharacters(v9, v105, v23);
                  uint64_t v30 = a2;
                  v23 += v46;
                }
                BOOL v28 = (char)theString;
                if (theString)
                {
                  if ((v98 & 0x100000000) == 0)
                  {
                    CFIndex v74 = CFStringGetLength(theString);
                    *UChar32 v23 = 32;
                    if ((a6 & 4) != 0)
                    {
                      v108.CFIndex location = 0;
                      CFIndex v78 = v74;
                      v108.CFIndex length = v74;
                      CFStringGetCharacters(theString, v108, v23 + 1);
                      BOOL v28 = 0;
                      char v25 = 1;
                      uint64_t v98 = 0x100000001;
                      uint64_t v32 = v21;
                      v23 += v78 + 1;
                    }
                    else
                    {
                      v23[1] = 40;
                      v107.CFIndex location = 0;
                      CFIndex v75 = v74;
                      v107.CFIndex length = v74;
                      CFStringGetCharacters(theString, v107, v23 + 2);
                      BOOL v28 = 0;
                      BOOL v76 = &v23[v75 + 2];
                      *BOOL v76 = 41;
                      UChar32 v23 = v76 + 1;
                      char v25 = 1;
                      uint64_t v98 = 0x100000001;
                      uint64_t v32 = v21;
                    }
LABEL_91:
                    uint64_t v30 = a2;
                    goto LABEL_73;
                  }
                  BOOL v28 = 0;
                  char v25 = 1;
                  HIDWORD(v98) = 1;
                }
                else
                {
                  char v25 = 1;
                }
                LODWORD(v98) = 1;
              }
            }
            else
            {
LABEL_57:
              BOOL v28 = 0;
              char v25 = 0;
            }
LABEL_72:
            uint64_t v32 = v21;
            goto LABEL_73;
          }
          if (v22 != 110) {
            goto LABEL_43;
          }
          if ((v95 | HIDWORD(v98)) & 1 | (v9 != 0)) {
            goto LABEL_57;
          }
          CFIndex v33 = CFStringGetLength(theString);
          v104.CFIndex location = 0;
          v104.CFIndex length = v33;
          CFStringGetCharacters(theString, v104, v23);
          uint64_t v30 = a2;
          BOOL v28 = 0;
          char v25 = 0;
          HIDWORD(v98) = 1;
          uint64_t v32 = v21;
          v23 += v33;
        }
        else
        {
          if (v22 != 91)
          {
            if (v22 == 92) {
              ++v21;
            }
LABEL_43:
            int64_t v34 = v24 + a3;
            if (v30)
            {
              UniChar v35 = *(char *)(v30 + v34);
            }
            else if (v34 < 0 || (uint64_t v38 = a1, v39 = *(void *)(a1 + 160), v39 <= v34))
            {
              UniChar v35 = 0;
            }
            else
            {
              uint64_t v40 = *(void *)(a1 + 136);
              if (v40)
              {
                UniChar v35 = *(_WORD *)(v40 + 2 * (*(void *)(a1 + 152) + v34));
              }
              else
              {
                uint64_t v77 = *(void *)(a1 + 144);
                if (v77)
                {
                  UniChar v35 = *(char *)(v77 + *(void *)(a1 + 152) + v34);
                }
                else
                {
                  if (*(void *)(a1 + 176) <= v34 || (int64_t v80 = *(void *)(a1 + 168), v80 > v34))
                  {
                    int64_t v81 = v34 - 4;
                    if ((unint64_t)v34 < 4) {
                      int64_t v81 = 0;
                    }
                    if (v81 + 64 < v39) {
                      int64_t v39 = v81 + 64;
                    }
                    *(void *)(a1 + 168) = v81;
                    *(void *)(a1 + 176) = v39;
                    v109.CFIndex location = *(void *)(a1 + 152) + v81;
                    v109.CFIndex length = v39 - v81;
                    CFStringGetCharacters(*(CFStringRef *)(a1 + 128), v109, (UniChar *)a1);
                    uint64_t v38 = a1;
                    int64_t v80 = *(void *)(a1 + 168);
                  }
                  UniChar v35 = *(_WORD *)(v38 + 2 * (v34 - v80));
                }
              }
            }
            if (u_isdigit(__s[v21]))
            {
              if (u_isdigit(v35))
              {
                int32_t v41 = u_charDigitValue(__s[v21]);
                BOOL v13 = v41 == u_charDigitValue(v35);
                CFStringRef v9 = v96;
                if (v13)
                {
                  BOOL v28 = 0;
                  char v25 = 0;
                  *v23++ = v35;
LABEL_90:
                  ++v24;
                  int v27 = 1;
                  uint64_t v32 = v21;
                  goto LABEL_91;
                }
              }
            }
            if (v35 == __s[v21]) {
              ++v24;
            }
            uint64_t v30 = a2;
LABEL_71:
            BOOL v28 = 0;
            char v25 = 0;
            *v23++ = __s[v21];
            goto LABEL_72;
          }
          uint64_t v32 = v21 + 1;
          if (__s[v21 + 1] != 91) {
            goto LABEL_71;
          }
          char v25 = 0;
          BOOL v28 = 1;
        }
      }
LABEL_73:
      uint64_t v21 = v32 + 1;
      char v22 = __s[v32 + 1];
      if (v22) {
        BOOL v42 = v24 >= a4;
      }
      else {
        BOOL v42 = 1;
      }
      if (v42)
      {
        if (!(((v100 & 1) == 0) | ((a6 & 4) >> 2) & 1))
        {
          while (1)
          {
            int v84 = __s[v32 + 1];
            if (v84 == 35) {
              break;
            }
            if (v84 == 41) {
              goto LABEL_161;
            }
            if (v84 != 92 || __s[v32 + 2] != 35)
            {
              uint64_t v21 = v32 + 1;
              goto LABEL_165;
            }
LABEL_162:
            ++v32;
          }
          LOWORD(v84) = 32;
LABEL_161:
          *v23++ = v84;
          goto LABEL_162;
        }
        break;
      }
    }
  }
LABEL_165:
  if (a9 && __s[v21] == 32 && !__s[v21 + 1]) {
    *UChar32 v23 = 32;
  }
  CFAllocatorRef v85 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int32_t v86 = u_strlen((const UChar *)v20);
  return CFStringCreateWithCharactersNoCopy(v85, (const UniChar *)v20, v86, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
}

uint64_t pn_uset_basicPresentationSetContains()
{
  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getBasicPresentationSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getBasicPresentationPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[[+][:Nd:][,;][\\ \"'()\\-./<>\\[\\]][*#]]", __pn_uset_getBasicPresentationPattern_pattern, 38);
      __pn_uset_getBasicPresentationPattern_didInit = 1;
    }
    __pn_uset_getBasicPresentationSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  uint64_t result = __pn_uset_getBasicPresentationSet_set;
  if (__pn_uset_getBasicPresentationSet_set)
  {
    JUMPOUT(0x2166724B0);
  }
  return result;
}

char *PNCopyBestGuessNormalizedNumberForCountry(char *result, __CFString *a2)
{
  if (result)
  {
    if (a2)
    {
      memset(v4, 0, sizeof(v4));
      return _PNCopyBestGuessNumberForCountry((const __CFString *)result, a2, 1, v4, &v3);
    }
    else
    {
      return _PNCopyNormalized((const __CFString *)result);
    }
  }
  return result;
}

void __CFPhoneNumberDeallocate(void *a1)
{
  uint64_t v2 = (void *)a1[2];
  if (v2) {
    free(v2);
  }
  char v3 = (const void *)a1[3];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[4];
  if (v4) {
    CFRelease(v4);
  }
  unsigned int v5 = (const void *)a1[5];
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = (const void *)a1[6];
  if (v6) {
    CFRelease(v6);
  }
  char v7 = (const void *)a1[7];
  if (v7)
  {
    CFRelease(v7);
  }
}

CFStringRef PNCreateFormattedStringWithCountry(const __CFString *a1, __CFString *a2, int a3, unsigned int a4)
{
  if (!a1) {
    return 0;
  }
  if (a3 == 2)
  {
    CFStringRef v5 = _PNCopyCompressedFormattedStringWithCountry(a1, a2, a4);
    if (v5)
    {
      CFStringRef v6 = v5;
      CFTypeRef v7 = _PNCreateLocalizedStringWithString((const __CFAllocator *)*MEMORY[0x263EFFB08], v5);
      CFRelease(v6);
      return (CFStringRef)v7;
    }
    return 0;
  }
  if (a3 != 1) {
    return 0;
  }
  return _PNCopyCompressedFormattedStringWithCountry(a1, a2, a4);
}

CFStringRef _PNCopyCompressedFormattedStringWithCountry(const __CFString *a1, __CFString *cf, unsigned int a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = cf;
  if (!cf)
  {
    uint64_t v4 = (__CFString *)PNCopyBestGuessCountryCodeForNumber(a1);
    if (v4) {
      goto LABEL_5;
    }
    return 0;
  }
  CFRetain(cf);
LABEL_5:
  CFTypeRef cfa = 0;
  CFStringRef v6 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, v4, (CFStringRef *)&cfa, 0);
  CFStringRef v7 = _PNCopyFormattedNumberForDigitsWithCountry(v6, v4, a3);
  CFStringRef v8 = _PNCreateStringByAddingPauses(v7, (CFStringRef)cfa);
  CFRelease(v6);
  if (cfa) {
    CFRelease(cfa);
  }
  if (v7) {
    CFRelease(v7);
  }
  CFRelease(v4);
  return v8;
}

CFStringRef CFPhoneNumberStringCreateLowercaseCopy(const __CFAllocator *a1, CFStringRef theString)
{
  if (!CFStringGetLength(theString)) {
    return 0;
  }
  MutableCFStringRef Copy = CFStringCreateMutableCopy(a1, 0, theString);
  if (!MutableCopy) {
    return 0;
  }
  CFStringRef v5 = MutableCopy;
  if (CFPhoneNumberStringIsEncodingASCII(theString)) {
    CFLocaleRef v6 = 0;
  }
  else {
    CFLocaleRef v6 = CFLocaleCopyCurrent();
  }
  CFStringLowercase(v5, v6);
  CFStringRef Copy = CFStringCreateCopy(a1, v5);
  CFRelease(v5);
  if (v6) {
    CFRelease(v6);
  }
  return Copy;
}

CFStringRef CFPhoneNumberCreate(const __CFAllocator *a1, CFStringRef theString, const __CFString *a3)
{
  CFStringRef v3 = theString;
  if (theString)
  {
    if (CFStringGetLength(theString))
    {
      if (CFPhoneNumberStringIsEncodingASCII(v3)) {
        CFStringRef Copy = (const __CFString *)CFRetain(v3);
      }
      else {
        CFStringRef Copy = CFPhoneNumberStringTransformCreateCopy(a1, v3, 0, @"NFD; Any-Latin; [:Mn:] Remove; Latin-ASCII; [:^ASCII:] Remove; NFC",
      }
                 0);
      CFStringRef v7 = Copy;
      if (Copy)
      {
        if (!CFStringGetLength(Copy)) {
          goto LABEL_25;
        }
        CFStringRef v8 = PNCopyBestGuessCountryCodeForNumber(v7);
        if (v8)
        {
          CFStringRef v9 = (__CFString *)v8;
          if (CFStringGetLength(v8))
          {
LABEL_19:
            if (CFPhoneNumberGetITUCountryCodeForISOCountryCode(v9) == -1)
            {
              CFStringRef v3 = 0;
            }
            else
            {
              if (CFPhoneNumberGetTypeID_initOnce != -1) {
                dispatch_once(&CFPhoneNumberGetTypeID_initOnce, &__block_literal_global_1);
              }
              uint64_t Instance = _CFRuntimeCreateInstance();
              CFStringRef v3 = (CFStringRef)Instance;
              if (Instance)
              {
                *(_OWORD *)(Instance + 32) = 0u;
                *(unsigned char *)(Instance + 64) = 0;
                *(_OWORD *)(Instance + 48) = 0u;
                *(_OWORD *)(Instance + 16) = 0u;
                *(void *)(Instance + 48) = CFPhoneNumberStringCreateLowercaseCopy(a1, v9);
                v3[1].info = (uint64_t)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(v7);
                v3->CFIndex length = (uint64_t)_PNCopyStrippedNumberWithoutPauses(v7, (__CFString *)v3[1].data, (CFStringRef *)&v3[1], 0);
                BOOL v12 = CFStringGetLength((CFStringRef)v3[1].info) >= 1
                   && CFStringGetCharacterAtIndex((CFStringRef)v3[1].info, 0) == 43;
                LOBYTE(v3[2].isa) = v12;
              }
            }
            CFRelease(v7);
            goto LABEL_30;
          }
          CFRelease(v9);
        }
LABEL_13:
        if (a3)
        {
          unsigned int v10 = (__CFString *)(CFPhoneNumberStringIsEncodingASCII(a3)
                             ? CFRetain(a3)
                             : CFPhoneNumberStringTransformCreateCopy(a1, v3, 0, @"NFD; Any-Latin; [:Mn:] Remove; Latin-ASCII; [:^ASCII:] Remove; NFC",
                                 0));
          CFStringRef v9 = v10;
          if (v10) {
            goto LABEL_19;
          }
        }
LABEL_25:
        CFStringRef v3 = 0;
        CFStringRef v9 = (__CFString *)v7;
LABEL_30:
        CFRelease(v9);
        return v3;
      }
    }
    else
    {
      CFStringRef v7 = (const __CFString *)CFRetain(v3);
      if (v7) {
        goto LABEL_13;
      }
    }
    return 0;
  }
  return v3;
}

CFStringRef PNCopyBestGuessCountryCodeForNumber(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFStringRef v1 = _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable(a1);
  if (CFStringGetLength(v1))
  {
    CFStringRef v2 = 0;
    if (CFStringGetCharacterAtIndex(v1, 0) == 43)
    {
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      v6.CFIndex length = CFStringGetLength(v1) - 1;
      v6.CFIndex location = 1;
      CFStringRef v4 = CFStringCreateWithSubstring(v3, v1, v6);
      CFStringRef v2 = _PNCopyCountryCodeForInternationalCode(v4);
      CFRelease(v4);
    }
  }
  else
  {
    CFStringRef v2 = 0;
  }
  CFRelease(v1);
  return v2;
}

uint64_t CFPhoneNumberStringIsEncodingASCII(const __CFString *a1)
{
  if (!a1) {
    return 1;
  }
  memset(v20, 0, sizeof(v20));
  CFIndex Length = CFStringGetLength(a1);
  CFStringRef theString = a1;
  uint64_t v24 = 0;
  CFIndex v25 = Length;
  CFStringRef CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  char v22 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  UChar32 v23 = CStringPtr;
  if (Length < 1) {
    return 1;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  for (uint64_t i = 64; ; ++i)
  {
    uint64_t v9 = (unint64_t)v7 >= 4 ? 4 : v7;
    if (v25 > v7)
    {
      if (v22)
      {
        UniChar v10 = v22[v7 + v24];
      }
      else if (v23)
      {
        UniChar v10 = v23[v24 + v7];
      }
      else
      {
        if (v27 <= v7 || v6 > v7)
        {
          uint64_t v12 = -v9;
          uint64_t v13 = v9 + v5;
          uint64_t v14 = i - v9;
          uint64_t v15 = v7 + v12;
          CFIndex v16 = v15 + 64;
          if (v15 + 64 >= v25) {
            CFIndex v16 = v25;
          }
          uint64_t v26 = v15;
          uint64_t v27 = v16;
          v17.CFIndex location = v15 + v24;
          if (v25 >= v14) {
            uint64_t v18 = v14;
          }
          else {
            uint64_t v18 = v25;
          }
          v17.CFIndex length = v18 + v13;
          CFStringGetCharacters(theString, v17, (UniChar *)v20);
          uint64_t v6 = v26;
        }
        UniChar v10 = *((_WORD *)v20 + v7 - v6);
      }
      if (v10 > 0x7Fu) {
        break;
      }
    }
    ++v7;
    --v5;
    if (Length == v7) {
      return 1;
    }
  }
  return 0;
}

uint64_t CFPhoneNumberGetITUCountryCodeForISOCountryCode(__CFString *a1)
{
  if (!a1) {
    return -1;
  }
  if (!CFStringGetLength(a1)) {
    return -1;
  }
  CFStringRef v2 = _PNCopyInternationalCodeForCountry((unsigned int *)a1);
  if (!v2) {
    return -1;
  }
  CFAllocatorRef v3 = v2;
  IntCFNumberRef Value = CFStringGetIntValue((CFStringRef)v2);
  if (IntValue > 0x7FFFFFFE) {
    int v5 = -1;
  }
  else {
    int v5 = IntValue;
  }
  uint64_t v6 = v5;
  CFRelease(v3);
  return v6;
}

CFStringRef _PNCopyCountryCodeForInternationalCode(const __CFString *a1)
{
  CFStringRef v2 = (unsigned int *)PNGetFormatFileHeader();
  CFStringRef result = 0;
  if (a1 && v2)
  {
    int v6 = 0;
    CFIndex Length = CFStringGetLength(a1);
    int CountryOffsetFromDialingCode = _GetCountryOffsetFromDialingCode(v2, a1, 0, 0, Length, &v6);
    if (CountryOffsetFromDialingCode == -1) {
      return 0;
    }
    else {
      return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)&v2[3 * CountryOffsetFromDialingCode + 2], 0x8000100u);
    }
  }
  return result;
}

unsigned int *_PNCopyInternationalCodeForCountry(unsigned int *a1)
{
  CFStringRef result = _PNGetITUCountryCode(a1);
  if (result)
  {
    CFStringRef v2 = (const char *)result;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    return (unsigned int *)CFStringCreateWithCString(v3, v2, 0x8000100u);
  }
  return result;
}

unsigned int *_PNGetITUCountryCode(unsigned int *result)
{
  if (result)
  {
    CFStringRef v1 = (const __CFString *)result;
    if (CFStringGetLength((CFStringRef)result) == 2)
    {
      CFStringRef result = (unsigned int *)PNGetFormatFileHeader();
      if (result)
      {
        CFStringRef v2 = result;
        int InfoIndex = UIPhoneFormatCountryGetInfoIndex(result, v1);
        if (InfoIndex == -1) {
          return 0;
        }
        else {
          return &v2[3 * InfoIndex + 1];
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFStringRef CFPhoneNumberCreateString(const __CFAllocator *a1, uint64_t a2, char a3)
{
  if (!a2) {
    return 0;
  }
  if (a3)
  {
    if ((a3 & 2) != 0) {
      CFStringRef v5 = _CFPhoneNumberCopyFormattedInternationalRepresentation(a2);
    }
    else {
      CFStringRef v5 = (const __CFString *)_CFPhoneNumberCopyFormattedRepresentation(a2);
    }
  }
  else if ((a3 & 2) != 0)
  {
    CFStringRef v5 = __CFPhoneNumberCopyFullyQualified(a2, 1, 1);
  }
  else
  {
    CFStringRef v5 = (const __CFString *)CFRetain(*(CFTypeRef *)(a2 + 40));
  }
  CFStringRef v6 = v5;
  if (!v5 || (a3 & 4) == 0) {
    return v6;
  }
  CFTypeRef v8 = _PNCreateLocalizedStringWithString(a1, v5);
  CFRelease(v6);
  return (const __CFString *)v8;
}

CFTypeRef _PNCreateLocalizedStringWithString(const __CFAllocator *a1, CFStringRef theString)
{
  if (!theString) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(theString);
  if (Length)
  {
    CFIndex v5 = Length;
    CFLocaleRef v6 = CFLocaleCopyCurrent();
    CFStringRef v7 = (const __CFString *)MEMORY[0x216671F90]();
    if (CFPhoneNumberLocaleGetNumberingSystemFromLocaleIdentifier(v7) == 2)
    {
      CFStringRef Copy = (const __CFString *)CFRetain(theString);
    }
    else
    {
      CFMutableStringRef Mutable = CFStringCreateMutable(a1, v5);
      uint64_t v12 = CFNumberFormatterCreate(a1, v6, kCFNumberFormatterDecimalStyle);
      if (v5 >= 1)
      {
        for (CFIndex i = 0; i != v5; ++i)
        {
          rangep.CFIndex location = i;
          rangep.CFIndex length = 1;
          __int16 valuePtr = 0;
          if (!CFNumberFormatterGetValueFromString(v12, theString, &rangep, kCFNumberShortType, &valuePtr)
            || (CFStringRef v14 = CFNumberFormatterCreateStringWithValue(a1, v12, kCFNumberShortType, &valuePtr)) == 0)
          {
            rangep.CFIndex length = 1;
            v19.CFIndex location = rangep.location;
            v19.CFIndex length = 1;
            CFStringRef v14 = CFStringCreateWithSubstring(a1, theString, v19);
            if (!v14) {
              continue;
            }
          }
          CFStringAppend(Mutable, v14);
          CFRelease(v14);
        }
      }
      CFStringRef Copy = CFStringCreateCopy(a1, Mutable);
      CFRelease(Mutable);
      CFRelease(v12);
    }
    if (CFLocaleGetLanguageCharacterDirection(v7) == kCFLocaleLanguageDirectionRightToLeft
      && CFStringGetLength(Copy) >= 1)
    {
      uint64_t v15 = (void *)CFStringCreateWithFormat(a1, 0, @"\u202D%@\u202C", Copy);
    }
    else
    {
      uint64_t v15 = (void *)CFRetain(Copy);
    }
    uint64_t v9 = v15;
    if (v6) {
      CFRelease(v6);
    }
    if (Copy) {
      CFRelease(Copy);
    }
    return v9;
  }
  return CFRetain(&stru_26C2A3D88);
}

uint64_t CFPhoneNumberLocaleGetNumberingSystemFromLocaleIdentifier(CFLocaleIdentifier localeID)
{
  uint64_t v1 = (uint64_t)localeID;
  if (localeID)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier((CFAllocatorRef)*MEMORY[0x263EFFB08], localeID);
    if (!ComponentsFromLocaleIdentifier) {
      return 0;
    }
    CFDictionaryRef v4 = ComponentsFromLocaleIdentifier;
    if (CFDictionaryGetCount(ComponentsFromLocaleIdentifier) < 1)
    {
      uint64_t v1 = 0;
    }
    else
    {
      CFNumberRef Value = CFDictionaryGetValue(v4, @"numbers");
      if (Value)
      {
        CFLocaleRef v6 = Value;
        if (CFEqual(Value, @"default")) {
          CFStringRef v7 = __CFPhoneNumberLocaleCopyNumberingSystemNameFromLocaleIdentifier(v2, (CFStringRef)v1);
        }
        else {
          CFStringRef v7 = (const __CFString *)CFRetain(v6);
        }
        CFStringRef v12 = v7;
        goto LABEL_15;
      }
      CFIndex Count = CFDictionaryGetCount(v4);
      MutableCFStringRef Copy = CFDictionaryCreateMutableCopy(v2, Count, v4);
      uint64_t v1 = (uint64_t)MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, @"numbers", @"default");
        CFStringRef LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(v2, (CFDictionaryRef)v1);
        if (LocaleIdentifierFromComponents)
        {
          CFStringRef v11 = LocaleIdentifierFromComponents;
          CFStringRef v12 = __CFPhoneNumberLocaleCopyNumberingSystemNameFromLocaleIdentifier(v2, LocaleIdentifierFromComponents);
          CFRelease(v11);
        }
        else
        {
          CFStringRef v12 = 0;
        }
        CFRelease((CFTypeRef)v1);
LABEL_15:
        CFRelease(v4);
        if (v12)
        {
          if (CFEqual(v12, @"arab")) {
            uint64_t v1 = 1;
          }
          else {
            uint64_t v1 = 2 * (CFEqual(v12, @"latn") != 0);
          }
          CFDictionaryRef v4 = (const __CFDictionary *)v12;
          goto LABEL_21;
        }
        return 0;
      }
    }
LABEL_21:
    CFRelease(v4);
  }
  return v1;
}

CFStringRef __CFPhoneNumberLocaleCopyNumberingSystemNameFromLocaleIdentifier(const __CFAllocator *a1, CFStringRef theString)
{
  if (!CFStringGetCStringPtr(theString, 0x8000100u)) {
    return 0;
  }
  uint64_t v3 = unumsys_open();
  if (!v3) {
    return 0;
  }
  CFIndex v5 = (const char *)MEMORY[0x216672490](v3);
  if (v5) {
    CFStringRef v4 = CFStringCreateWithCString(a1, v5, 0x8000100u);
  }
  else {
    CFStringRef v4 = 0;
  }
  unumsys_close();
  return v4;
}

CFTypeRef _CFPhoneNumberCopyFormattedRepresentation(uint64_t a1)
{
  CFAllocatorRef v2 = *(const void **)(a1 + 56);
  if (!v2)
  {
    CFStringRef v4 = _PNCopyFormattedNumberForDigitsWithCountry(*(const __CFString **)(a1 + 24), *(const __CFString **)(a1 + 48), 0);
    if (v4)
    {
      CFStringRef v5 = v4;
      *(void *)(a1 + 56) = _PNCreateStringByAddingPauses(v4, *(CFStringRef *)(a1 + 32));
      CFRelease(v5);
      CFAllocatorRef v2 = *(const void **)(a1 + 56);
      if (v2) {
        goto LABEL_2;
      }
    }
    else
    {
      *(void *)(a1 + 56) = 0;
    }
    return 0;
  }
LABEL_2:
  return CFRetain(v2);
}

CFStringRef _PNCreateStringByAddingPauses(const __CFString *a1, CFStringRef theString)
{
  if (theString && CFStringGetLength(theString))
  {
    if (a1 && CFStringGetLength(a1)) {
      return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@%@", a1, theString);
    }
    CFStringRef v5 = theString;
  }
  else
  {
    if (!a1) {
      return 0;
    }
    CFStringRef v5 = a1;
  }
  return (CFStringRef)CFRetain(v5);
}

CFStringRef _PNCopyFormattedNumberForDigitsWithCountry(const __CFString *a1, const __CFString *a2, unsigned int a3)
{
  CFLocaleRef v6 = (unsigned int *)PNGetFormatFileHeader();
  CFStringRef FormattedNumberForDigitsWithCountryIndex = 0;
  if (!a1 || !a2 || !v6) {
    return FormattedNumberForDigitsWithCountryIndex;
  }
  uint64_t InfoIndex = UIPhoneFormatCountryGetInfoIndex(v6, a2);
  if (InfoIndex != -1)
  {
    uint64_t v9 = InfoIndex;
    CFStringRef FormattedNumberForDigitsWithCountryIndex = _CreateFormattedNumberForDigitsWithCountryIndex(a1, InfoIndex, a3, 0, 0, 0);
    if (!FormattedNumberForDigitsWithCountryIndex) {
      return FormattedNumberForDigitsWithCountryIndex;
    }
    if (!CFEqual(a1, FormattedNumberForDigitsWithCountryIndex)) {
      return FormattedNumberForDigitsWithCountryIndex;
    }
    CFIndex location = CFStringFind(FormattedNumberForDigitsWithCountryIndex, @"x", 0).location;
    if (location == -1) {
      return FormattedNumberForDigitsWithCountryIndex;
    }
    CFIndex v11 = location;
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v20.CFIndex location = 0;
    v20.CFIndex length = location;
    CFStringRef v13 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], FormattedNumberForDigitsWithCountryIndex, v20);
    v21.CFIndex length = CFStringGetLength(FormattedNumberForDigitsWithCountryIndex) - v11;
    v21.CFIndex location = v11;
    CFStringRef v14 = CFStringCreateWithSubstring(v12, FormattedNumberForDigitsWithCountryIndex, v21);
    CFRelease(FormattedNumberForDigitsWithCountryIndex);
    CFStringRef v15 = _CreateFormattedNumberForDigitsWithCountryIndex(v13, v9, a3, 0, 0, 0);
    if (v15)
    {
      CFStringRef v16 = v15;
      if (!CFEqual(v15, v13))
      {
        CFStringRef FormattedNumberForDigitsWithCountryIndex = CFStringCreateWithFormat(v12, 0, @"%@ %@", v16, v14);
        CFRelease(v16);
        goto LABEL_16;
      }
      CFRelease(v16);
    }
    CFStringRef FormattedNumberForDigitsWithCountryIndex = CFStringCreateCopy(v12, a1);
LABEL_16:
    CFRelease(v13);
    CFRelease(v14);
    return FormattedNumberForDigitsWithCountryIndex;
  }
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  return CFStringCreateCopy(v17, a1);
}

CFStringRef _CFPhoneNumberCopyFormattedInternationalRepresentation(uint64_t a1)
{
  CFStringRef v2 = __CFPhoneNumberCopyFullyQualified(a1, 0, 1);
  if (!v2) {
    return 0;
  }
  CFStringRef v3 = v2;
  CFStringRef v4 = _PNCopyFormattedNumberForDigitsWithCountry(v2, *(const __CFString **)(a1 + 48), 0);
  CFRelease(v3);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = _PNCreateStringByAddingPauses(v4, *(CFStringRef *)(a1 + 32));
  CFRelease(v4);
  return v5;
}

CFStringRef __CFPhoneNumberCopyFullyQualified(uint64_t a1, int a2, int a3)
{
  CFStringRef v6 = *(const __CFString **)(a1 + 24);
  CFStringRef v7 = *(__CFString **)(a1 + 48);
  if (a2)
  {
    CFStringRef v8 = *(const __CFString **)(a1 + 32);
    if ((a3 & 1) == 0)
    {
LABEL_3:
      return _PNCopyFullyQualifiedNumberForCountryInternal(v6, v7, v8, &__block_literal_global_9, 0, 0);
    }
  }
  else
  {
    CFStringRef v8 = 0;
    if ((a3 & 1) == 0) {
      goto LABEL_3;
    }
  }
  CFStringRef result = _PNCopyFullyQualifiedNumberForCountryInternal(v6, v7, v8, &__block_literal_global_9, *(unsigned __int8 *)(a1 + 64), 0);
  if (result) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a3 == 0;
  }
  if (!v10)
  {
    if (PNIsValidPhoneNumberForCountry(*(const __CFString **)(a1 + 40), *(__CFString **)(a1 + 48))
      && (CFStringHasPrefix(*(CFStringRef *)(a1 + 40), @"+1800")
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), @"+1888")
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), @"+1877")
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), @"+1866")
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), @"+1855")
       || CFStringHasPrefix(*(CFStringRef *)(a1 + 40), @"+1844")))
    {
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v12 = *(const __CFString **)(a1 + 40);
      return CFStringCreateCopy(v11, v12);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFString *_PNCopyFullyQualifiedNumberForCountryInternal(const __CFString *a1, __CFString *a2, const __CFString *a3, void *a4, int a5, _DWORD *a6)
{
  CFAllocatorRef v11 = a4;
  if (!a6)
  {
    if (CFStringGetLength(a1) >= 5 && (_PNIsValidPhoneNumberForCountry(a1, a2, 1, 1, 0) & 1) != 0) {
      goto LABEL_9;
    }
LABEL_33:
    if (!a5)
    {
LABEL_48:
      MutableCFStringRef Copy = 0;
      goto LABEL_49;
    }
    goto LABEL_34;
  }
  *a6 = 0;
  if (CFStringGetLength(a1) <= 4)
  {
    *a6 = 2;
    if (!a5) {
      goto LABEL_48;
    }
    goto LABEL_34;
  }
  if ((_PNIsValidPhoneNumberForCountry(a1, a2, 1, 1, 0) & 1) == 0)
  {
    *a6 = 3;
    goto LABEL_33;
  }
LABEL_9:
  CFStringGetLength(a1);
  if (!CFStringGetCharactersPtr(a1)) {
    CFStringGetCStringPtr(a1, 0x600u);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  LOBYTE(cStr[0]) = 0;
  CFStringRef v12 = _PNCopyBestGuessNumberForCountry(a1, a2, 1, &v46, cStr);
  if (LOBYTE(cStr[0]))
  {
    uint64_t v13 = DWORD2(v47);
    if (DWORD2(v47))
    {
      CFStringRef v14 = (unsigned __int8 *)v47;
      while (1)
      {
        int v16 = *v14++;
        int v15 = v16;
        if (v16 == 35 || v15 == 42) {
          break;
        }
        if (!--v13) {
          goto LABEL_17;
        }
      }
LABEL_37:
      if (a6) {
        *a6 = 4;
      }
      free(v12);
      if (!a5) {
        goto LABEL_48;
      }
LABEL_34:
      if (a6) {
        *a6 = 0;
      }
LABEL_36:
      MutableCFStringRef Copy = (__CFString *)_PNCopyFullyQualifiedOriginalValue(a1, a3);
      goto LABEL_49;
    }
LABEL_17:
    uint64_t v17 = DWORD2(v48);
    if (DWORD2(v48))
    {
      uint64_t v18 = (unsigned __int8 *)v48;
      do
      {
        int v20 = *v18++;
        int v19 = v20;
        if (v20 == 35 || v19 == 42) {
          goto LABEL_37;
        }
      }
      while (--v17);
    }
    uint64_t v21 = DWORD2(v49);
    if (DWORD2(v49))
    {
      char v22 = (unsigned __int8 *)v49;
      do
      {
        int v24 = *v22++;
        int v23 = v24;
        if (v24 == 35 || v23 == 42) {
          goto LABEL_37;
        }
      }
      while (--v21);
    }
  }
  free(v12);
  long long v54 = 0u;
  long long v52 = 0u;
  *(_OWORD *)unint64_t v53 = 0u;
  *(_OWORD *)numBytes = 0u;
  *(_OWORD *)cStr = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  char v45 = 0;
  CFIndex v25 = _PNCopyBestGuessNumberForCountry(a1, a2, 1, (long long *)cStr, &v45);
  _PNFindFormatRuleForDigitsWithCountry(a1, a2, 0, (uint64_t)&v46);
  if (!v45 || !(void)v54)
  {
    if (a6) {
      *a6 = 3;
    }
LABEL_43:
    free(v25);
    if (!a5) {
      goto LABEL_48;
    }
    goto LABEL_36;
  }
  if ((BYTE4(v47) & 4) != 0)
  {
    if (a6) {
      *a6 = 5;
    }
    free(v25);
    goto LABEL_48;
  }
  CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  MutableCFStringRef Copy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"+");
  if (cStr[0])
  {
    CFStringRef v28 = CFStringCreateWithCString(v26, cStr[0], 0x8000100u);
    CFStringAppend(MutableCopy, v28);
    CFRelease(v28);
    goto LABEL_52;
  }
  CFAllocatorRef v43 = v26;
  uint64_t v30 = _PNCopyInternationalCodeForCountry((unsigned int *)a2);
  if (!v30)
  {
    if (a6) {
      *a6 = 6;
    }
    CFRelease(MutableCopy);
    goto LABEL_43;
  }
  int v31 = v30;
  CFStringAppend(MutableCopy, (CFStringRef)v30);
  CFRelease(v31);
  CFAllocatorRef v26 = v43;
LABEL_52:
  if (numBytes[0] != -1)
  {
    CFStringRef v32 = CFStringCreateWithBytes(v26, (const UInt8 *)(*((void *)&v47 + 1) + numBytes[0]), numBytes[1], 0x8000100u, 0);
    CFStringAppend(MutableCopy, v32);
    CFRelease(v32);
  }
  if (v53[0])
  {
    CFStringRef v33 = CFStringCreateWithBytes(v26, (const UInt8 *)v53[0], LODWORD(v53[1]), 0x8000100u, 0);
    CFStringAppend(MutableCopy, v33);
    CFRelease(v33);
  }
  else if ((BYTE4(v47) & 8) != 0)
  {
    if (cStr[0])
    {
      CFStringRef v38 = CFStringCreateWithCString(v26, cStr[0], 0x8000100u);
      CFStringRef v39 = _PNCopyCountryCodeForInternationalCode(v38);
      uint64_t v40 = v11[2](v11, v39);
      if (v40)
      {
        CFAllocatorRef v41 = v26;
        CFStringRef v42 = (const __CFString *)v40;
        CFAllocatorRef v44 = v41;
        int64_t v34 = CFStringCreateMutableCopy(v41, 0, MutableCopy);
        CFStringAppend(MutableCopy, v42);
        CFRelease(v42);
        CFRelease(v38);
        if (v39) {
          CFRelease(v39);
        }
        CFAllocatorRef v26 = v44;
        if (!MutableCopy) {
          goto LABEL_63;
        }
        goto LABEL_58;
      }
      CFRelease(v38);
      if (v39) {
        CFRelease(v39);
      }
    }
    if (a6) {
      *a6 = 7;
    }
    CFRelease(MutableCopy);
    MutableCFStringRef Copy = 0;
    goto LABEL_65;
  }
  int64_t v34 = 0;
  if (MutableCopy)
  {
LABEL_58:
    CFStringRef v35 = CFStringCreateWithBytes(v26, (const UInt8 *)v54, DWORD2(v54), 0x8000100u, 0);
    if (v35)
    {
      CFStringRef v36 = v35;
      CFStringAppend(MutableCopy, v35);
      if (v34 && (_PNIsValidPhoneNumberForCountry(MutableCopy, a2, 1, 1, 0) & 1) == 0)
      {
        CFRelease(MutableCopy);
        CFStringAppend(v34, v36);
        MutableCFStringRef Copy = v34;
        int64_t v34 = 0;
      }
      CFRelease(v36);
    }
  }
LABEL_63:
  if (v34) {
    CFRelease(v34);
  }
LABEL_65:
  free(v25);
  if (a3 && MutableCopy)
  {
    CFStringRef v37 = _PNCreateStringByAddingPauses(MutableCopy, a3);
    CFRelease(MutableCopy);
    MutableCFStringRef Copy = (__CFString *)v37;
  }
LABEL_49:

  return MutableCopy;
}

uint64_t _PNIsValidPhoneNumberForCountry(const __CFString *a1, __CFString *a2, uint64_t a3, char a4, char a5)
{
  if (a1 && CFStringGetLength(a1))
  {
    if (a2)
    {
      CFRetain(a2);
      goto LABEL_6;
    }
    a2 = (__CFString *)PNCopyBestGuessCountryCodeForNumber(a1);
    if (a2)
    {
LABEL_6:
      CFStringRef v10 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, a2, 0, a3);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      memset(v17, 0, sizeof(v17));
      uint64_t v11 = 0;
      if (!_PNFindFormatRuleForDigitsWithCountry(v10, a2, 0, (uint64_t)&v18))
      {
LABEL_20:
        CFRelease(v10);
        CFRelease(a2);
        return v11;
      }
      CFStringRef v12 = _PNCopyNormalized(v10);
      uint64_t v13 = v12;
      if (((a4 & 1) != 0 || (BYTE4(v19) & 4) == 0) && _PNDecomposeForCountry(v12, a2, v17, a3))
      {
        if ((_BYTE)v19)
        {
          unsigned int v14 = DWORD1(v20);
          unsigned int v15 = BYTE1(v19);
          if (DWORD1(v20) >= v19 && DWORD1(v20) <= BYTE1(v19)) {
            goto LABEL_13;
          }
        }
        else
        {
          unsigned int v14 = DWORD1(v20);
          unsigned int v15 = BYTE1(v19);
          if (DWORD1(v20) == BYTE1(v19))
          {
LABEL_13:
            uint64_t v11 = 1;
LABEL_19:
            free(v13);
            goto LABEL_20;
          }
        }
        if (v14 > 4 || (a5 & 1) == 0)
        {
          uint64_t v11 = 0;
          if (v14 < v15 && *(void *)&v17[0]) {
            uint64_t v11 = (*(unsigned __int16 *)(v18 + 2) >> 1) & 1;
          }
          goto LABEL_19;
        }
      }
      uint64_t v11 = 0;
      goto LABEL_19;
    }
  }
  return 0;
}

uint64_t _PNFindFormatRuleForDigitsWithCountry(const __CFString *a1, const __CFString *a2, int a3, uint64_t a4)
{
  CFStringRef v8 = (unsigned int *)PNGetFormatFileHeader();
  uint64_t v9 = 0;
  if (a1 && a2 && v8)
  {
    if (a4)
    {
      *(_OWORD *)(a4 + 48) = 0u;
      *(_OWORD *)(a4 + 64) = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      *(_OWORD *)(a4 + 32) = 0u;
      *(_OWORD *)a4 = 0u;
      *(void *)(a4 + 64) = -1;
    }
    uint64_t InfoIndex = UIPhoneFormatCountryGetInfoIndex(v8, a2);
    if (InfoIndex == -1)
    {
      return 0;
    }
    else
    {
      int v11 = InfoIndex;
      int v14 = -1;
      CFStringRef v12 = _CreateFormattedNumberForDigitsWithCountryIndex(a1, InfoIndex, 0, 0, &v14, (void *)a4);
      if (v12) {
        CFRelease(v12);
      }
      LODWORD(v9) = a3 ^ 1;
      if (v14 == v11) {
        return 1;
      }
      else {
        return v9;
      }
    }
  }
  return v9;
}

uint64_t PNIsValidPhoneNumberForCountry(const __CFString *a1, __CFString *a2)
{
  return _PNIsValidPhoneNumberForCountry(a1, a2, 1, 1, 0);
}

CFTypeRef CFPhoneNumberCopyISOCountryCode(uint64_t a1, uint64_t a2)
{
  CFTypeRef result = *(CFTypeRef *)(a2 + 48);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef CFPhoneNumberCopyUnformattedRepresentation(uint64_t a1)
{
  return CFRetain(*(CFTypeRef *)(a1 + 40));
}

CFStringRef CFPhoneNumberCopyUnformattedInternationalRepresentation(uint64_t a1)
{
  return __CFPhoneNumberCopyFullyQualified(a1, 1, 1);
}

uint64_t __CFPhoneNumberGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kCFPhoneNumberTypeID = result;
  return result;
}

void __PNGetFormatFileHeader_block_invoke()
{
  v14[1] = *MEMORY[0x263EF8340];
  v0 = CFPhoneNumberBundleCopyRulesetFileSystemPath();
  if (v0)
  {
    CFStringRef v1 = (const __CFString *)v0;
    CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)v0, 0x8000100u);
    CFIndex Length = CFStringGetLength(v1);
    if (CStringPtr
      || (CStringPtr = (char *)v14 - ((Length + 16) & 0xFFFFFFFFFFFFFFF0),
          CFStringGetCString(v1, CStringPtr, Length + 1, 0x8000100u)))
    {
      int v4 = open(CStringPtr, 0);
      if (v4 < 0)
      {
        CFStringRef v10 = (FILE *)*MEMORY[0x263EF8348];
        int v11 = __error();
        fprintf(v10, "Attempt to open file at %s failed with errno (%d).\n", CStringPtr, *v11);
      }
      else
      {
        int v5 = v4;
        size_t v6 = lseek(v4, 0, 2);
        if ((v6 & 0x8000000000000000) != 0)
        {
          CFStringRef v12 = (FILE *)*MEMORY[0x263EF8348];
          uint64_t v13 = __error();
          fprintf(v12, "Attempt to locate end of file at %s failed with errno (%d).\n", CStringPtr, *v13);
        }
        else
        {
          sFormatFile = (uint64_t)mmap(0, v6, 1, 2, v5, 0);
          if (sFormatFile == -1)
          {
            CFStringRef v7 = (FILE *)*MEMORY[0x263EF8348];
            CFStringRef v8 = __error();
            fprintf(v7, "Attempt to memory map file at %s failed with errno (%d).\n", CStringPtr, *v8);
            sFormatFile = 0;
          }
        }
        close(v5);
      }
    }
    else
    {
      fwrite("Could not obtain ruleset file system path.\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    CFRelease(v1);
  }
  else
  {
    uint64_t v9 = (FILE *)*MEMORY[0x263EF8348];
    fwrite("Could not obtain ruleset file system path.\n", 0x2BuLL, 1uLL, v9);
  }
}

__CFBundle *CFPhoneNumberBundleCopyRulesetFileSystemPath()
{
  uint64_t result = CFPhoneNumberBundleCopyRulesetURL();
  if (result)
  {
    CFStringRef v1 = result;
    CFStringRef v2 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
    CFRelease(v1);
    return (__CFBundle *)v2;
  }
  return result;
}

__CFBundle *CFPhoneNumberBundleCopyRulesetURL()
{
  uint64_t result = CFBundleGetBundleWithIdentifier(@"com.apple.CorePhoneNumbers");
  if (result)
  {
    return CFBundleCopyResourceURL(result, @"CorePhoneNumbers.ruleset", 0, 0);
  }
  return result;
}

CFBundleRef CFPhoneNumberBundleGetBundle()
{
  return CFBundleGetBundleWithIdentifier(@"com.apple.CorePhoneNumbers");
}

uint64_t cpn_default_log()
{
  if (cpn_default_log_onceToken != -1) {
    dispatch_once(&cpn_default_log_onceToken, &__block_literal_global);
  }
  return cpn_default_log_sLog;
}

os_log_t __cpn_default_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.corephonenumbers", "default");
  cpn_default_log_sLog = (uint64_t)result;
  return result;
}

CFStringRef PNCopyFormattedStringWithCountry(const __CFString *a1, __CFString *a2)
{
  return _PNCopyCompressedFormattedStringWithCountry(a1, a2, 0);
}

BOOL PNPhoneNumbersEqual(const __CFString *a1, __CFString *cf, const __CFString *a3, __CFString *a4, char a5, unsigned char *a6)
{
  BOOL v6 = 0;
  if (!a1 || !a3) {
    return v6;
  }
  int v11 = cf;
  if (cf)
  {
    CFRetain(cf);
    if (a4) {
      goto LABEL_5;
    }
  }
  else
  {
    int v11 = (__CFString *)PNCopyBestGuessCountryCodeForNumber(a1);
    if (a4)
    {
LABEL_5:
      CFRetain(a4);
      if (!v11) {
        goto LABEL_17;
      }
      goto LABEL_9;
    }
  }
  a4 = (__CFString *)PNCopyBestGuessCountryCodeForNumber(a3);
  if (!v11)
  {
LABEL_17:
    if (v11) {
      CFRelease(v11);
    }
    if (a4) {
      CFRelease(a4);
    }
    return 0;
  }
LABEL_9:
  if (!a4) {
    goto LABEL_17;
  }
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, sizeof(v17));
  __int16 v16 = 0;
  uint64_t v13 = _PNCopyBestGuessNumberForCountry(a1, v11, 1, v18, (unsigned char *)&v16 + 1);
  int v14 = _PNCopyBestGuessNumberForCountry(a3, a4, 1, v17, &v16);
  BOOL v6 = 0;
  if (HIBYTE(v16) == v16) {
    BOOL v6 = decomposedPhoneNumbersEqual((uint64_t)v18, (uint64_t)v17, a5, a6);
  }
  if (v13) {
    free(v13);
  }
  if (v14) {
    free(v14);
  }
  CFRelease(v11);
  CFRelease(a4);
  return v6;
}

__CFString *_PNCopyFullyQualifiedNumberForCountry(const __CFString *a1, __CFString *a2, uint64_t a3, _DWORD *a4)
{
  if (a1 && a2)
  {
    CFStringRef v11 = 0;
    CFStringRef v7 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, a2, &v11, 0);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___PNCopyFullyQualifiedNumberForCountry_block_invoke;
    v10[3] = &__block_descriptor_48_e34_____CFString__16__0____CFString__8l;
    v10[4] = a3;
    v10[5] = a2;
    CFStringRef v8 = _PNCopyFullyQualifiedNumberForCountryInternal(v7, a2, v11, v10, 0, a4);
    if (v11) {
      CFRelease(v11);
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    CFStringRef v8 = 0;
    if (a4) {
      *a4 = 1;
    }
  }
  return v8;
}

CFStringRef _PNCopyAreaCodeForCountry(const __CFString *a1, const __CFString *a2)
{
  int v4 = (unsigned int *)PNGetFormatFileHeader();
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  if (!v4) {
    return 0;
  }
  unsigned int InfoIndex = UIPhoneFormatCountryGetInfoIndex(v4, a2);
  if (InfoIndex == -1) {
    return 0;
  }
  return _CopyPrefixForDigitsWithCountryIndex(a1, InfoIndex);
}

uint64_t PNSetFormatFileHeader(uint64_t result)
{
  sOverrideFormatFile = result;
  return result;
}

__CFArray *_PNCopyIndexStringsForAddressBookSearch(const __CFString *a1, __CFString *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (_PNIsValidPhoneNumberForCountry(a1, a2, 1, 1, 0))
  {
    CFStringRef v6 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses(a1, a2, 0, 1);
    CFStringRef v7 = _PNCopyNormalized(v6);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    *(_OWORD *)CFStringRef v32 = 0u;
    long long v33 = 0u;
    *(_OWORD *)uint64_t v30 = 0u;
    *(_OWORD *)numBytes = 0u;
    long long v29 = 0u;
    if (!_PNFindFormatRuleForDigitsWithCountry(v6, a2, 0, (uint64_t)&v33)) {
      goto LABEL_38;
    }
    CFStringRef v8 = _PNCopyFullyQualifiedNumberForCountry(a1, a2, 0, 0);
    if (v8)
    {
      CFStringRef v9 = v8;
      if (CFStringGetLength(v8) && CFStringGetCharacterAtIndex(v9, 0))
      {
        v38.CFIndex length = CFStringGetLength(v9) - 1;
        v38.CFIndex location = 1;
        CFStringRef v10 = CFStringCreateWithSubstring(v4, v9, v38);
        uint64_t v11 = 0;
        CFStringRef v12 = (const char *)(v33 + 12);
        do
        {
          size_t v13 = strlen(v12);
          v11 += v13 + 1;
          v12 += v13 + 1;
        }
        while (*v12);
        int v14 = (const char *)(v33 + 12 + v11 + 1);
        CFArrayAppendValue(Mutable, v9);
        CFStringRef v15 = CFStringCreateWithFormat(v4, 0, @"%s%@", v14, v10);
        CFArrayAppendValue(Mutable, v15);
        CFRelease(v15);
        if (strcmp(v14, "00"))
        {
          CFStringRef v16 = CFStringCreateWithFormat(v4, 0, @"00%@", v10);
          CFArrayAppendValue(Mutable, v16);
          CFRelease(v16);
        }
        if (strcmp(v14, "011"))
        {
          CFStringRef v17 = CFStringCreateWithFormat(v4, 0, @"011%@", v10);
          CFArrayAppendValue(Mutable, v17);
          CFRelease(v17);
        }
        CFRelease(v10);
      }
      CFRelease(v9);
    }
    if (!_PNDecomposeForCountry(v7, a2, (uint64_t)&v29, 1)) {
      goto LABEL_38;
    }
    if (numBytes[0])
    {
      CFStringRef v18 = CFStringCreateWithBytes(v4, (const UInt8 *)numBytes[0], LODWORD(numBytes[1]), 0x8000100u, 0);
      long long v19 = (const UInt8 *)v32[0];
      if (!v32[0])
      {
LABEL_30:
        if (!v18) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }
    else
    {
      long long v19 = (const UInt8 *)v32[0];
      if (!v32[0])
      {
LABEL_38:
        CFRelease(v6);
        free(v7);
        return Mutable;
      }
      CFStringRef v18 = 0;
    }
    CFStringRef v20 = CFStringCreateWithBytes(v4, v19, LODWORD(v32[1]), 0x8000100u, 0);
    CFStringRef v21 = v20;
    if (v18 && v20)
    {
      if (v30[0] && LODWORD(v30[1]))
      {
        CFStringRef v22 = CFStringCreateWithBytes(v4, (const UInt8 *)v30[0], LODWORD(v30[1]), 0x8000100u, 0);
        CFStringRef v23 = v22;
        if (SBYTE2(v34) < 0) {
          CFStringRef v24 = CFStringCreateWithFormat(v4, 0, @"%s%@%@%@", (void)v33 + 12, v18, v22, v21, v29);
        }
        else {
          CFStringRef v24 = CFStringCreateWithFormat(v4, 0, @"%s%@%@%@", (void)v33 + 12, v22, v18, v21, v29);
        }
        CFStringRef v25 = v24;
        CFArrayAppendValue(Mutable, v24);
        CFRelease(v25);
        CFRelease(v23);
      }
      CFStringRef v26 = CFStringCreateWithFormat(v4, 0, @"%s%@%@", (void)v33 + 12, v18, v21);
      CFArrayAppendValue(Mutable, v26);
      CFRelease(v26);
      CFStringRef v27 = CFStringCreateWithFormat(v4, 0, @"%@%@", v18, v21);
      CFArrayAppendValue(Mutable, v27);
      CFRelease(v27);
      CFArrayAppendValue(Mutable, v21);
    }
    else
    {
      if (!v20) {
        goto LABEL_30;
      }
      CFArrayAppendValue(Mutable, v20);
      if (!v18)
      {
LABEL_36:
        CFStringRef v18 = v21;
LABEL_37:
        CFRelease(v18);
        goto LABEL_38;
      }
    }
    CFRelease(v18);
    goto LABEL_36;
  }
  CFArrayAppendValue(Mutable, a1);
  return Mutable;
}

uint64_t UIPhoneFormatGetInternationalAccessCode(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = a1 + 12;
  CFStringRef v3 = (const char *)(a1 + 12);
  do
  {
    size_t v4 = strlen(v3);
    v1 += v4 + 1;
    v3 += v4 + 1;
  }
  while (*v3);
  return v2 + v1 + 1;
}

void _PNSetSampleNumberForCountry(const __CFString *a1, CFTypeRef cf1)
{
  if (_PNInitializeSamplePhoneNumbers_sSampleNumberOnceToken == -1)
  {
    if (a1)
    {
LABEL_3:
      size_t v4 = _PNCopyNormalized(a1);
      size_t v5 = strlen(v4);
      CFStringRef v6 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v4, v5, 0x8000100u, 0);
      CFDictionarySetValue((CFMutableDictionaryRef)sSamplePhoneNumbers, cf1, v6);
      CFRelease(v6);
      free(v4);
      return;
    }
  }
  else
  {
    dispatch_once(&_PNInitializeSamplePhoneNumbers_sSampleNumberOnceToken, &__block_literal_global_58);
    if (a1) {
      goto LABEL_3;
    }
  }
  int v7 = CFEqual(cf1, @"us");
  CFStringRef v8 = (__CFDictionary *)sSamplePhoneNumbers;
  if (v7)
  {
    CFDictionarySetValue(v8, @"us", @"14085551212");
  }
  else
  {
    CFDictionaryRemoveValue(v8, cf1);
  }
}

__CFString *_PNCopySampleNumberForCountry(const __CFString *key)
{
  if (_PNInitializeSamplePhoneNumbers_sSampleNumberOnceToken == -1)
  {
    if (key) {
      goto LABEL_3;
    }
    return &stru_26C2A3D88;
  }
  dispatch_once(&_PNInitializeSamplePhoneNumbers_sSampleNumberOnceToken, &__block_literal_global_58);
  if (!key) {
    return &stru_26C2A3D88;
  }
LABEL_3:
  CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)sSamplePhoneNumbers, key);
  if (!Value)
  {
    size_t v4 = (unsigned int *)PNGetFormatFileHeader();
    if (!v4) {
      return 0;
    }
    size_t v5 = v4;
    int InfoIndex = UIPhoneFormatCountryGetInfoIndex(v4, key);
    if (InfoIndex == -1) {
      return 0;
    }
    int v7 = (unsigned __int16 *)((char *)&v5[3 * UIPhoneFormatCountryGetCount(v5) + 1] + v5[3 * InfoIndex + 3]);
    int v8 = *((_DWORD *)v7 + 2);
    if (!v8) {
      return 0;
    }
    int v9 = 0;
    CFStringRef v10 = (char *)v7 + *v7;
    while (!*((_WORD *)v10 + 1))
    {
LABEL_15:
      CFMutableStringRef Mutable = 0;
      v10 += 16 * *((unsigned __int16 *)v10 + 1) + 4;
      if (++v9 == v8) {
        return Mutable;
      }
    }
    uint64_t v11 = (unsigned __int8 *)(v10 + 13);
    uint64_t v12 = *((unsigned __int16 *)v10 + 1);
    while (!v11[2])
    {
      v11 += 16;
      if (!--v12) {
        goto LABEL_15;
      }
    }
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], *v11);
    CFStringAppendFormat(Mutable, 0, @"%d", *(unsigned int *)(v11 - 9));
    while (CFStringGetLength(Mutable) < *v11)
      CFStringAppendFormat(Mutable, 0, @"%c", 53);
    return Mutable;
  }
  return (__CFString *)CFRetain(Value);
}

unsigned int *_PNCopyInternationalPrefix(const __CFString *a1, const __CFString *a2)
{
  os_log_t result = 0;
  if (a1)
  {
    if (a2)
    {
      os_log_t result = (unsigned int *)PNGetFormatFileHeader();
      if (result)
      {
        size_t v5 = result;
        unsigned int InfoIndex = UIPhoneFormatCountryGetInfoIndex(result, a2);
        if (InfoIndex == -1) {
          return 0;
        }
        unsigned int v7 = InfoIndex;
        uint64_t v8 = (uint64_t)&v5[3 * UIPhoneFormatCountryGetCount(v5) + 1] + v5[3 * InfoIndex + 3];
        if (!v8)
        {
          return 0;
        }
        else
        {
          uint64_t v9 = _NumberRangeWithoutVerticalServiceCode(a1, 0, v7);
          if (v9 == -1)
          {
            CFIndex Length = CFStringGetLength(a1);
            CFIndex v11 = 0;
          }
          else
          {
            CFIndex v11 = v9;
            CFIndex Length = v10;
          }
          uint64_t v13 = 0;
          int v14 = 0;
          os_log_t result = (unsigned int *)_InternationalPrefixForDigitsInCountry(v8, v7, a1, 0, v11, Length, &v13, &v14);
          if (result) {
            return (unsigned int *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)result, 0x8000100u);
          }
        }
      }
    }
  }
  return result;
}

uint64_t UIPhoneFormatFileGetCountryHeader(unsigned int *a1, int a2)
{
  return (uint64_t)&a1[3 * UIPhoneFormatCountryGetCount(a1) + 1] + a1[3 * a2 + 3];
}

BOOL _PNIsDomesticNumber(const __CFString *a1, const __CFString *a2)
{
  if (CFStringGetCharacterAtIndex(a1, 0) == 43)
  {
    CFStringRef v4 = PNCopyBestGuessCountryCodeForNumber(a1);
    if (!v4)
    {
      CFRelease(0);
      return 0;
    }
    CFStringRef v5 = v4;
    BOOL v6 = CFStringCompare(v4, a2, 1uLL) == kCFCompareEqualTo;
    CFStringRef v7 = v5;
  }
  else
  {
    CFStringRef v8 = _PNCopyInternationalDirectDialingPrefixForCountry((const __CFAllocator *)*MEMORY[0x263EFFB08], a2);
    BOOL v6 = CFStringHasPrefix(a1, v8) == 0;
    CFStringRef v7 = v8;
  }
  CFRelease(v7);
  return v6;
}

CFStringRef _PNCopyInternationalDirectDialingPrefixForCountry(const __CFAllocator *a1, CFStringRef theString)
{
  if (!theString) {
    return 0;
  }
  if (CFStringGetLength(theString) != 2) {
    return 0;
  }
  CFStringRef v4 = (unsigned int *)PNGetFormatFileHeader();
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  int InfoIndex = UIPhoneFormatCountryGetInfoIndex(v4, theString);
  if (InfoIndex == -1) {
    return 0;
  }
  uint64_t v7 = (uint64_t)&v5[3 * UIPhoneFormatCountryGetCount(v5) + 1] + v5[3 * InfoIndex + 3];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = v7 + 12;
  CFIndex v10 = (const char *)(v7 + 12);
  do
  {
    size_t v11 = strlen(v10);
    v8 += v11 + 1;
    v10 += v11 + 1;
  }
  while (*v10);
  return CFStringCreateWithCString(a1, (const char *)(v9 + v8 + 1), 0x8000100u);
}

CFStringRef _CopyPrefixForDigitsWithCountryIndex(const __CFString *a1, unsigned int a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  CFIndex v13 = 0;
  v14[0] = 0;
  v15.CFIndex length = CFStringGetLength(a1);
  v15.CFIndex location = 0;
  CFIndex Bytes = CFStringGetBytes(a1, v15, 0x8000100u, 0, 0, 0, 0, v14);
  MEMORY[0x270FA5388](Bytes);
  BOOL v6 = (UInt8 *)v10 - ((v5 + 16) & 0xFFFFFFFFFFFFFFF0);
  v16.CFIndex length = CFStringGetLength(a1);
  v16.CFIndex location = 0;
  CFStringGetBytes(a1, v16, 0x8000100u, 0, 0, v6, v14[0], &v13);
  v6[v13] = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  memset(v10, 0, sizeof(v10));
  int v7 = _DecomposePhoneNumberWithCountryIndex((char *)v6, a2, (uint64_t)v10, 0, 1);
  CFStringRef result = 0;
  if (v7) {
    BOOL v9 = (void)v11 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v11, DWORD2(v11), 0x8000100u, 0);
  }
  return result;
}

CFStringRef _PNCopyNationalDirectDialingPrefixForCountry(const __CFAllocator *a1, CFStringRef theString)
{
  if (!theString) {
    return 0;
  }
  if (CFStringGetLength(theString) != 2) {
    return 0;
  }
  CFStringRef v4 = (unsigned int *)PNGetFormatFileHeader();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  int InfoIndex = UIPhoneFormatCountryGetInfoIndex(v4, theString);
  if (InfoIndex == -1) {
    return 0;
  }
  uint64_t v7 = (uint64_t)&v5[3 * UIPhoneFormatCountryGetCount(v5) + 1] + v5[3 * InfoIndex + 3];
  if (!v7) {
    return 0;
  }
  return CFStringCreateWithCString(a1, (const char *)(v7 + 12), 0x8000100u);
}

uint64_t UIPhoneFormatGetNationalAccessCode(uint64_t a1)
{
  return a1 + 12;
}

CFStringRef _PNCopyFormattedNumberForDigitsWithCountryByRemovingAtIndex(const __CFString *a1, __CFString *a2, uint64_t a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    return &stru_26C2A3D88;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v7 = Length - 1;
  if (Length < 1) {
    return &stru_26C2A3D88;
  }
  CFIndex v8 = Length;
  CFIndex v9 = a3 - 1;
  MEMORY[0x270FA5388](Length);
  long long v11 = (UniChar *)((char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18.CFIndex location = 0;
  v18.CFIndex length = v8;
  CFStringGetCharacters(a1, v18, v11);
  if (v9 <= v8) {
    CFIndex v12 = v9;
  }
  else {
    CFIndex v12 = v7;
  }
  if (v12 < 0) {
    return _PNCopyCompressedFormattedStringWithCountry(a1, a2, 0);
  }
  while (_IsInFormattingSet(v11[v12]))
  {
    if (v12-- <= 0) {
      return _PNCopyCompressedFormattedStringWithCountry(a1, a2, 0);
    }
  }
  MutableCFStringRef Copy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a1);
  v19.CFIndex location = v12;
  v19.CFIndex length = 1;
  CFStringDelete(MutableCopy, v19);
  if (CFStringGetLength(MutableCopy)) {
    CFStringRef v14 = _PNCopyCompressedFormattedStringWithCountry(MutableCopy, a2, 0);
  }
  else {
    CFStringRef v14 = &stru_26C2A3D88;
  }
  CFRelease(MutableCopy);
  return v14;
}

CFStringRef _PNCopyFormattedNumberSuggestionForDigitsWithCountry(const __CFString *a1, CFIndex a2, const __CFString *a3, uint64_t *a4, __CFString *a5)
{
  if (!a1 || (CFIndex Length = CFStringGetLength(a1)) == 0)
  {
    uint64_t v18 = 0;
    CFStringRef v17 = 0;
    if (!a4) {
      return v17;
    }
    goto LABEL_20;
  }
  CFIndex v11 = Length;
  uint64_t v12 = _PNCountNonPhoneFormattingCharactersPrecedingIndex(a1, a2);
  if (a3
    && (CFTypeID v13 = CFGetTypeID(a3), v13 == CFStringGetTypeID())
    && (CFIndex v14 = CFStringGetLength(a3), v11 < v14)
    && (v14 <= a2 ? (CFIndex v15 = v14 - 1) : (CFIndex v15 = (int)a2),
        unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(a3, v15),
        _IsInFormattingSet(CharacterAtIndex)))
  {
    CFStringRef v17 = _PNCopyFormattedNumberForDigitsWithCountryByRemovingAtIndex(a1, a5, a2);
    --v12;
    if (!v17) {
      goto LABEL_17;
    }
  }
  else
  {
    CFStringRef v17 = _PNCopyCompressedFormattedStringWithCountry(a1, a5, 0);
    if (!v17) {
      goto LABEL_17;
    }
  }
  if (CFStringGetLength(v17)) {
    goto LABEL_18;
  }
  CFRelease(v17);
LABEL_17:
  CFStringRef v17 = &stru_26C2A3D88;
LABEL_18:
  if (a4)
  {
    uint64_t v18 = _PNIndexCountingNonPhoneFormattingCharactersFromStart(v17, v12);
LABEL_20:
    *a4 = v18;
  }
  return v17;
}

uint64_t _PNCountNonPhoneFormattingCharactersPrecedingIndex(const __CFString *a1, CFIndex a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  CFIndex Length = CFStringGetLength(a1);
  if (!Length) {
    return 0;
  }
  if (Length < a2) {
    a2 = Length;
  }
  MEMORY[0x270FA5388](Length);
  BOOL v6 = (unsigned __int16 *)((char *)v10 - v5);
  v11.CFIndex location = 0;
  v11.CFIndex length = a2;
  CFStringGetCharacters(a1, v11, (UniChar *)((char *)v10 - v5));
  if (a2 < 1) {
    return 0;
  }
  uint64_t v7 = 0;
  do
  {
    unsigned int v8 = *v6++;
    if (!_IsInFormattingSet(v8)) {
      ++v7;
    }
    --a2;
  }
  while (a2);
  return v7;
}

uint64_t _PNIndexCountingNonPhoneFormattingCharactersFromStart(const __CFString *a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t Length = CFStringGetLength(a1);
  uint64_t result = 0;
  if (a2 && Length)
  {
    MEMORY[0x270FA5388](0);
    uint64_t v7 = (UniChar *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    v12.CFIndex location = 0;
    v12.CFIndex length = Length;
    CFStringGetCharacters(a1, v12, v7);
    if (Length < 1)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      while (_IsInFormattingSet(v7[v9]) || ++v8 != a2)
      {
        if (Length == ++v9)
        {
          uint64_t v10 = Length;
          goto LABEL_11;
        }
      }
      uint64_t v10 = v9 + 1;
    }
LABEL_11:
    if (v10 >= Length) {
      return Length;
    }
    else {
      return v10;
    }
  }
  return result;
}

char *UIPhoneFormatFileFirstPrefixSectionHeader(unsigned __int16 *a1)
{
  return (char *)a1 + *a1;
}

uint64_t UIPhoneFormatFileNextPrefixSectionHeader(uint64_t a1)
{
  return a1 + 16 * *(unsigned __int16 *)(a1 + 2) + 4;
}

uint64_t UIPhoneFormatFileGetCountryLength(unsigned int *a1, int a2, int a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v7 = (uint64_t)&v6[3 * UIPhoneFormatCountryGetCount(a1)] + v6[3 * a3 + 2];
  unsigned int Count = UIPhoneFormatCountryGetCount(a1);
  unsigned int v9 = a3 + 1;
  if (a3 + 1 >= Count) {
    goto LABEL_7;
  }
  unsigned int v10 = Count;
  unsigned int v11 = a3 + 2;
  uint64_t v12 = 12 * v9 + 12;
  do
  {
    uint64_t v13 = (uint64_t)&v6[3 * UIPhoneFormatCountryGetCount(a1)] + *(unsigned int *)((char *)a1 + v12);
    if (v13 != v7) {
      break;
    }
    v12 += 12;
  }
  while (v11++ < v10);
  if (v13 == v7) {
LABEL_7:
  }
    LODWORD(v13) = a1 + a2;
  return (v13 - v7);
}

char *UIPhoneFormatGetFirstFormatString(unsigned __int16 *a1)
{
  return (char *)a1 + *a1 + *((unsigned int *)a1 + 1);
}

const char *shouldEnableStrictEquality(const char **a1)
{
  uint64_t result = *a1;
  if (result) {
    return (const char *)(strcmp(result, "86") == 0);
  }
  return result;
}

CFStringRef _PNCopyFullyQualifiedOriginalValue(const __CFString *a1, const __CFString *a2)
{
  if (a2) {
    return _PNCreateStringByAddingPauses(a1, a2);
  }
  else {
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a1);
  }
}

uint64_t itu_strcmp(const char *a1, const char *a2)
{
  if (!a1 && a2) {
    return 0xFFFFFFFFLL;
  }
  if (a1 == a2) {
    return 0;
  }
  if (!a1 || a2) {
    return strcmp(a1, a2);
  }
  return 1;
}

uint64_t itu_strncmp(const char *a1, const char *a2, size_t a3)
{
  if (!a1 && a2) {
    return 0xFFFFFFFFLL;
  }
  if (a1 == a2) {
    return 0;
  }
  if (!a1 || a2) {
    return strncmp(a1, a2, a3);
  }
  return 1;
}

uint64_t pn_uset_alphabetSetContains()
{
  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getAlphabetSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getAlphabetPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[A-Za-z]", __pn_uset_getAlphabetPattern_pattern, 9);
      __pn_uset_getAlphabetPattern_didInit = 1;
    }
    __pn_uset_getAlphabetSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  uint64_t result = __pn_uset_getAlphabetSet_set;
  if (__pn_uset_getAlphabetSet_set)
  {
    JUMPOUT(0x2166724B0);
  }
  return result;
}

uint64_t pn_uset_internationalPrefixSetContains()
{
  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getInternationalPrefixSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getInternationalPrefixPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[+]", __pn_uset_getInternationalPrefixPattern_pattern, 4);
      __pn_uset_getInternationalPrefixPattern_didInit = 1;
    }
    __pn_uset_getInternationalPrefixSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  uint64_t result = __pn_uset_getInternationalPrefixSet_set;
  if (__pn_uset_getInternationalPrefixSet_set)
  {
    JUMPOUT(0x2166724B0);
  }
  return result;
}

uint64_t pn_uset_numeralSetContains()
{
  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getNumeralSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getNumeralPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[:Nd:]", __pn_uset_getNumeralPattern_pattern, 7);
      __pn_uset_getNumeralPattern_didInit = 1;
    }
    __pn_uset_getNumeralSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  uint64_t result = __pn_uset_getNumeralSet_set;
  if (__pn_uset_getNumeralSet_set)
  {
    JUMPOUT(0x2166724B0);
  }
  return result;
}

uint64_t pn_uset_pauseSetContains()
{
  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getPauseSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getPausePattern_didInit & 1) == 0)
    {
      u_charsToUChars("[,;]", __pn_uset_getPausePattern_pattern, 5);
      __pn_uset_getPausePattern_didInit = 1;
    }
    __pn_uset_getPauseSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  uint64_t result = __pn_uset_getPauseSet_set;
  if (__pn_uset_getPauseSet_set)
  {
    JUMPOUT(0x2166724B0);
  }
  return result;
}

uint64_t pn_uset_separatorSetContains()
{
  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getSeparatorSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getSeparatorPattern_didInit & 1) == 0)
    {
      u_charsToUChars("[\\ \"'()\\-./<>\\[\\]]", __pn_uset_getSeparatorPattern_pattern, 19);
      __pn_uset_getSeparatorPattern_didInit = 1;
    }
    __pn_uset_getSeparatorSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  uint64_t result = __pn_uset_getSeparatorSet_set;
  if (__pn_uset_getSeparatorSet_set)
  {
    JUMPOUT(0x2166724B0);
  }
  return result;
}

uint64_t pn_uset_verticalServiceSetContains()
{
  os_unfair_lock_lock(&__pn_uset_unfair_lock);
  if (!__pn_uset_getVerticalServiceSet_set)
  {
    os_unfair_lock_assert_owner(&__pn_uset_unfair_lock);
    if ((__pn_uset_getVerticalServicePattern_didInit & 1) == 0)
    {
      u_charsToUChars("[*#]", __pn_uset_getVerticalServicePattern_pattern, 5);
      __pn_uset_getVerticalServicePattern_didInit = 1;
    }
    __pn_uset_getVerticalServiceSet_set = uset_openPattern();
  }
  os_unfair_lock_unlock(&__pn_uset_unfair_lock);
  uint64_t result = __pn_uset_getVerticalServiceSet_set;
  if (__pn_uset_getVerticalServiceSet_set)
  {
    JUMPOUT(0x2166724B0);
  }
  return result;
}

CFStringRef CFPhoneNumberStringTransformCreateCopy(const __CFAllocator *a1, CFStringRef theString, CFRange *a3, const __CFString *a4, Boolean a5)
{
  if (theString)
  {
    CFIndex Length = CFStringGetLength(theString);
    MutableCFStringRef Copy = CFStringCreateMutableCopy(a1, Length, theString);
    if (CFStringTransform(MutableCopy, a3, a4, a5))
    {
      if (MutableCopy)
      {
        CFStringRef Copy = CFStringCreateCopy(a1, MutableCopy);
        CFRelease(MutableCopy);
        return Copy;
      }
    }
    else
    {
      CFRelease(MutableCopy);
    }
  }
  return 0;
}

uint64_t CFPhoneNumberGetTypeID()
{
  if (CFPhoneNumberGetTypeID_initOnce != -1) {
    dispatch_once(&CFPhoneNumberGetTypeID_initOnce, &__block_literal_global_1);
  }
  return __kCFPhoneNumberTypeID;
}

uint64_t CFPhoneNumberCreateCopy(uint64_t a1, uint64_t a2)
{
  if (CFPhoneNumberGetTypeID_initOnce != -1) {
    dispatch_once(&CFPhoneNumberGetTypeID_initOnce, &__block_literal_global_1);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    CFStringRef v4 = *(char **)(a2 + 16);
    if (v4) {
      CFStringRef v4 = strdup(v4);
    }
    *(void *)(Instance + 16) = v4;
    CFTypeRef v5 = *(CFTypeRef *)(a2 + 24);
    if (v5) {
      CFTypeRef v5 = CFRetain(v5);
    }
    *(void *)(Instance + 24) = v5;
    CFTypeRef v6 = *(CFTypeRef *)(a2 + 32);
    if (v6) {
      CFTypeRef v6 = CFRetain(v6);
    }
    *(void *)(Instance + 32) = v6;
    CFTypeRef v7 = *(CFTypeRef *)(a2 + 40);
    if (v7) {
      CFTypeRef v7 = CFRetain(v7);
    }
    *(void *)(Instance + 40) = v7;
    CFTypeRef v8 = *(CFTypeRef *)(a2 + 48);
    if (v8) {
      CFTypeRef v8 = CFRetain(v8);
    }
    *(void *)(Instance + 48) = v8;
    CFTypeRef v9 = *(CFTypeRef *)(a2 + 56);
    if (v9) {
      CFTypeRef v9 = CFRetain(v9);
    }
    *(void *)(Instance + 56) = v9;
    *(unsigned char *)(Instance + 64) = *(unsigned char *)(a2 + 64);
  }
  return Instance;
}

CFStringRef CFPhoneNumberCopyNumberForInternationalAssist(uint64_t a1, char *a2)
{
  CFStringRef v4 = _PNCopyFullyQualifiedNumberForCountryInternal(*(const __CFString **)(a1 + 24), *(__CFString **)(a1 + 48), *(const __CFString **)(a1 + 32), &__block_literal_global_9, 0, 0);
  if (v4)
  {
    CFStringRef Copy = v4;
    if (CFStringCompare(v4, *(CFStringRef *)(a1 + 40), 0))
    {
      if (a2)
      {
        char v6 = 1;
LABEL_8:
        *a2 = v6;
        return Copy;
      }
      return Copy;
    }
    CFRelease(Copy);
  }
  CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFStringRef *)(a1 + 40));
  if (a2)
  {
    char v6 = 0;
    goto LABEL_8;
  }
  return Copy;
}

CFStringRef CFPhoneNumberCopyNumberForLocalAssist(uint64_t a1, char *a2)
{
  int valid = PNIsValidPhoneNumberForCountry(*(const __CFString **)(a1 + 40), *(__CFString **)(a1 + 48));
  CFTypeRef v5 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (valid)
  {
    char v24 = 0;
    memset(v23, 0, sizeof(v23));
    char v6 = _PNCopyBestGuessNumberForCountry(*(const __CFString **)(a1 + 24), *(__CFString **)(a1 + 48), 0, v23, &v24);
    CFTypeRef v7 = (UInt8 *)v6;
    if (v24 && v6)
    {
      CFAllocatorRef v8 = *v5;
      size_t v9 = strlen(v6);
      CFStringRef v10 = CFStringCreateWithBytes(*v5, v7, v9, 0x8000100u, 0);
      free(v7);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      if (_PNFindFormatRuleForDigitsWithCountry(v10, *(const __CFString **)(a1 + 48), 0, (uint64_t)&v18))
      {
        if (BYTE9(v20))
        {
          v25.CFIndex length = v21;
          uint64_t v11 = *((void *)&v21 + 1) + v21;
          v25.CFIndex location = 0;
          CFStringRef v12 = CFStringCreateWithSubstring(v8, v10, v25);
          v26.CFIndex length = CFStringGetLength(v10) - v11;
          v26.CFIndex location = v11;
          CFStringRef v13 = CFStringCreateWithSubstring(v8, v10, v26);
          CFRelease(v10);
          CFStringRef v10 = CFStringCreateWithFormat(v8, 0, @"%@%@", v12, v13);
          CFRelease(v12);
          CFRelease(v13);
        }
        if ((BYTE4(v19) & 0x20) != 0 && !BYTE8(v20) && (!*((void *)&v23[0] + 1) || !**((unsigned char **)&v23[0] + 1)))
        {
          CFStringRef v14 = CFStringCreateWithFormat(v8, 0, @"%s%@", (void)v18 + 12, v10);
          CFRelease(v10);
          CFStringRef v10 = v14;
        }
      }
      if (v10)
      {
        if (CFStringCompare(v10, *(CFStringRef *)(a1 + 24), 0))
        {
          CFStringRef Copy = _PNCreateStringByAddingPauses(v10, *(CFStringRef *)(a1 + 32));
          CFRelease(v10);
          if (a2)
          {
            char v16 = 1;
LABEL_21:
            *a2 = v16;
            return Copy;
          }
          return Copy;
        }
        CFRelease(v10);
      }
    }
    else if (v6)
    {
      free(v6);
    }
  }
  CFStringRef Copy = CFStringCreateCopy(*v5, *(CFStringRef *)(a1 + 40));
  if (a2)
  {
    char v16 = 0;
    goto LABEL_21;
  }
  return Copy;
}

CFTypeRef CFPhoneNumberCopyCountryCode(uint64_t a1)
{
  return CFRetain(*(CFTypeRef *)(a1 + 48));
}

CFTypeRef _CFPhoneNumberCopyCountryCode(uint64_t a1)
{
  return CFRetain(*(CFTypeRef *)(a1 + 48));
}

uint64_t __CFPhoneNumberCopyDescription(uint64_t a1)
{
  if (a1) {
    return (uint64_t)_CFPhoneNumberCopyFormattedRepresentation(a1);
  }
  return a1;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4748](alloc, theString);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x270EE4A98](allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AA8](allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFLocaleLanguageDirection CFLocaleGetLanguageCharacterDirection(CFStringRef isoLangCode)
{
  return MEMORY[0x270EE4AB8](isoLangCode);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x270EE4BF8](allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr)
{
  return (CFStringRef)MEMORY[0x270EE4C10](allocator, formatter, numberType, valuePtr);
}

Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFNumberType numberType, void *valuePtr)
{
  return MEMORY[0x270EE4C30](formatter, string, rangep, numberType, valuePtr);
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50D8](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE5100](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.CFIndex location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x270F994D0](*(void *)&c);
}

void u_charsToUChars(const char *cs, UChar *us, int32_t length)
{
}

UBool u_isdigit(UChar32 c)
{
  return MEMORY[0x270F99548](*(void *)&c);
}

int32_t u_strlen(const UChar *s)
{
  return MEMORY[0x270F995C0](s);
}

UChar *__cdecl u_strncpy(UChar *dst, const UChar *src, int32_t n)
{
  return (UChar *)MEMORY[0x270F995C8](dst, src, *(void *)&n);
}

UChar *__cdecl u_strrchr(const UChar *s, UChar c)
{
  return (UChar *)MEMORY[0x270F995D0](s, c);
}

uint64_t unumsys_close()
{
  return MEMORY[0x270F99840]();
}

uint64_t unumsys_getName()
{
  return MEMORY[0x270F99848]();
}

uint64_t unumsys_open()
{
  return MEMORY[0x270F99850]();
}

uint64_t uset_contains()
{
  return MEMORY[0x270F99968]();
}