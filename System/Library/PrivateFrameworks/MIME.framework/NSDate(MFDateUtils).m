@interface NSDate(MFDateUtils)
+ (uint64_t)mf_copyDateInCommonFormatsWithString:()MFDateUtils;
@end

@implementation NSDate(MFDateUtils)

+ (uint64_t)mf_copyDateInCommonFormatsWithString:()MFDateUtils
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v74[14] = v4;
  v74[15] = v4;
  v74[12] = v4;
  v74[13] = v4;
  v74[10] = v4;
  v74[11] = v4;
  v74[8] = v4;
  v74[9] = v4;
  v74[6] = v4;
  v74[7] = v4;
  v74[4] = v4;
  v74[5] = v4;
  v74[2] = v4;
  v74[3] = v4;
  v74[0] = v4;
  v74[1] = v4;
  v76.CFIndex length = [(__CFString *)v3 length];
  CFIndex length = v76.length;
  v76.location = 0;
  MFStringGetBytes(v3, v76, 0x600u, 0, 0, (UInt8 *)v74, 256, &length);
  CFIndex v5 = length;
  if (!length) {
    goto LABEL_171;
  }
  uint64_t v6 = 0;
  if (length == 256) {
    CFIndex v5 = 255;
  }
  *((unsigned char *)v74 + v5) = 0;
  uint64_t v7 = MEMORY[0x1E4F14390];
  while (1)
  {
    int v8 = *((unsigned __int8 *)v74 + v6);
    if (*((char *)v74 + v6) < 0) {
      break;
    }
    if ((*(_DWORD *)(v7 + 4 * *((unsigned __int8 *)v74 + v6) + 60) & 0x4000) == 0) {
      goto LABEL_10;
    }
LABEL_9:
    ++v6;
  }
  if (__maskrune(*((unsigned __int8 *)v74 + v6), 0x4000uLL)) {
    goto LABEL_9;
  }
LABEL_10:
  int v9 = v8 - 48;
  if ((v8 - 48) < 0xA)
  {
    LODWORD(v10) = -1;
    goto LABEL_28;
  }
  uint64_t v10 = 0;
  while (1)
  {
    size_t v11 = strlen(kDayStrs[v10]);
    if (!memcmp(kDayStrs[v10], (char *)v74 + v6, v11)) {
      break;
    }
    if (++v10 == 14) {
      goto LABEL_171;
    }
  }
  uint64_t v12 = v6 + v11;
  uint64_t v13 = v6 + v11 - 1;
  do
  {
    uint64_t v6 = v12;
    uint64_t v14 = v13;
    int v15 = *((unsigned __int8 *)v74 + v12);
    uint64_t v16 = *((unsigned __int8 *)v74 + v12);
    if (*((char *)v74 + v12) < 0) {
      int v17 = __maskrune(*((unsigned __int8 *)v74 + v12), 0x4000uLL);
    }
    else {
      int v17 = *(_DWORD *)(v7 + 4 * v16 + 60) & 0x4000;
    }
    ++v12;
    uint64_t v13 = v14 + 1;
  }
  while (v15 == 44 || v17 != 0);
  if (v10 >= 7) {
    LODWORD(v10) = v10 - 7;
  }
  int v9 = v16 - 48;
  if ((v16 - 48) < 0xA)
  {
LABEL_28:
    LODWORD(v19) = -1;
    goto LABEL_29;
  }
  uint64_t v19 = 0;
  while (1)
  {
    size_t v27 = strlen(kMonthStrs[v19]);
    if (!memcmp(kMonthStrs[v19], (char *)v74 + v6, v27)) {
      break;
    }
    if (++v19 == 12) {
      goto LABEL_171;
    }
  }
  uint64_t v6 = v14 + v27;
  v35 = (char *)v74 + v27 - 1;
  do
  {
    uint64_t v36 = v35[v12];
    if (v35[v12] < 0) {
      int v37 = __maskrune(v35[v12], 0x4000uLL);
    }
    else {
      int v37 = *(_DWORD *)(v7 + 4 * v36 + 60) & 0x4000;
    }
    ++v35;
    ++v6;
  }
  while (v37);
  int v9 = v36 - 48;
  if ((v36 - 48) > 9) {
    goto LABEL_171;
  }
LABEL_29:
  LODWORD(v20) = 0;
  char v21 = 1;
  do
  {
    uint64_t v20 = (v9 + 10 * v20);
    uint64_t v22 = *((unsigned __int8 *)v74 + ++v6);
    if ((v21 & 1) == 0) {
      break;
    }
    char v21 = 0;
    int v9 = v22 - 48;
  }
  while ((v22 - 48) < 0xA);
  if ((v22 & 0x80) == 0) {
    goto LABEL_36;
  }
LABEL_35:
  for (int i = __maskrune(v22, 0x4000uLL); v22 == 45 || i; int i = *(_DWORD *)(v7 + 4 * v22 + 60) & 0x4000)
  {
    v23 = (char *)v74 + v6++;
    uint64_t v22 = v23[1];
    if ((v22 & 0x80) != 0) {
      goto LABEL_35;
    }
LABEL_36:
    ;
  }
  if (v19 == -1)
  {
    uint64_t v19 = 0;
    while (1)
    {
      size_t v26 = strlen(kMonthStrs[v19]);
      if (!memcmp(kMonthStrs[v19], (char *)v74 + v6, v26)) {
        break;
      }
      if (++v19 == 12) {
        goto LABEL_171;
      }
    }
    v28 = (char *)v74 + v6 + v26;
    uint64_t v6 = v6 + v26 - 1;
    do
    {
      uint64_t v22 = *v28;
      if (*v28 < 0) {
        int v29 = __maskrune(*v28, 0x4000uLL);
      }
      else {
        int v29 = *(_DWORD *)(v7 + 4 * v22 + 60) & 0x4000;
      }
      ++v28;
      ++v6;
    }
    while (v22 == 45 || v29 != 0);
    unsigned int v31 = v22 - 48;
    if ((v22 - 48) > 9)
    {
      LODWORD(v25) = 0;
    }
    else
    {
      LODWORD(v25) = 0;
      unsigned int v32 = 0;
      do
      {
        LODWORD(v25) = v31 + 10 * v25;
        unsigned int v33 = *v28++;
        uint64_t v22 = v33;
        ++v6;
        unsigned int v31 = v33 - 48;
      }
      while (v33 - 48 <= 9 && v32++ < 3);
    }
    if ((v22 & 0x80) == 0) {
      goto LABEL_79;
    }
    while (__maskrune(v22, 0x4000uLL))
    {
      while (1)
      {
        uint64_t v22 = *((unsigned __int8 *)v74 + ++v6);
        if ((v22 & 0x80) != 0) {
          break;
        }
LABEL_79:
        if ((*(_DWORD *)(v7 + 4 * v22 + 60) & 0x4000) == 0) {
          goto LABEL_80;
        }
      }
    }
  }
  else
  {
    LODWORD(v25) = -1;
  }
LABEL_80:
  unsigned int v38 = v22 - 48;
  if (v38 > 9)
  {
    int v39 = 0;
  }
  else
  {
    int v39 = 0;
    char v40 = 1;
    do
    {
      int v39 = v38 + 10 * v39;
      uint64_t v22 = *((unsigned __int8 *)v74 + ++v6);
      if ((v40 & 1) == 0) {
        break;
      }
      char v40 = 0;
      unsigned int v38 = v22 - 48;
    }
    while ((v22 - 48) < 0xA);
  }
  if (v22 != 58) {
    goto LABEL_171;
  }
  int v41 = *((unsigned __int8 *)v74 + v6 + 1);
  int v42 = v41 - 48;
  if ((v41 - 48) > 9)
  {
    int v43 = 0;
  }
  else
  {
    int v43 = 0;
    char v44 = 1;
    do
    {
      int v43 = v42 + 10 * v43;
      int v41 = *((unsigned __int8 *)v74 + v6++ + 2);
      if ((v44 & 1) == 0) {
        break;
      }
      char v44 = 0;
      int v42 = v41 - 48;
    }
    while ((v41 - 48) < 0xA);
  }
  if (v41 != 58) {
    goto LABEL_171;
  }
  uint64_t v45 = v6 + 2;
  unsigned int v46 = *((unsigned __int8 *)v74 + v6 + 2) - 48;
  if (v46 > 9)
  {
    int v72 = 0;
  }
  else
  {
    uint64_t v45 = v6 + 3;
    unsigned int v47 = *((unsigned __int8 *)v74 + v6 + 3) - 48;
    if (v47 < 0xA) {
      unsigned int v46 = v47 + 10 * v46;
    }
    int v72 = v46;
    if (v47 < 0xA) {
      uint64_t v45 = v6 + 4;
    }
  }
  uint64_t v48 = v45 + 1;
  uint64_t v49 = *((unsigned __int8 *)v74 + v45 + 1);
  if (v25 == -1)
  {
    uint64_t v50 = v45 + 2;
    if ((v49 & 0x80) == 0) {
      goto LABEL_107;
    }
    while (__maskrune(v49, 0x4000uLL))
    {
      while (1)
      {
        uint64_t v49 = *((unsigned __int8 *)v74 + v50++);
        if ((v49 & 0x80) != 0) {
          break;
        }
LABEL_107:
        if ((*(_DWORD *)(v7 + 4 * v49 + 60) & 0x4000) == 0) {
          goto LABEL_108;
        }
      }
    }
LABEL_108:
    unsigned int v51 = v49 - 48;
    if (v51 > 9)
    {
      LODWORD(v25) = 0;
      uint64_t v48 = v50 - 1;
    }
    else
    {
      uint64_t v52 = 0;
      LODWORD(v25) = 0;
      v53 = (unsigned __int8 *)v74 + v50;
      do
      {
        unsigned int v54 = *v53++;
        uint64_t v49 = v54;
        LODWORD(v25) = v51 + 10 * v25;
        unsigned int v51 = v54 - 48;
        uint64_t v55 = v52 + 1;
      }
      while (v54 - 48 <= 9 && v52++ < 3);
      uint64_t v48 = v50 + v55 - 1;
    }
  }
  v57 = (char *)v74 + v48 + 2;
  if ((v49 & 0x80) == 0) {
    goto LABEL_122;
  }
  while (__maskrune(v49, 0x4000uLL))
  {
    while (1)
    {
      uint64_t v49 = *(v57++ - 1);
      if ((v49 & 0x80) != 0) {
        break;
      }
LABEL_122:
      if ((*(_DWORD *)(v7 + 4 * v49 + 60) & 0x4000) == 0) {
        goto LABEL_123;
      }
    }
  }
LABEL_123:
  if (v49)
  {
    if (v49 == 45 || v49 == 43)
    {
      unsigned int v58 = *(v57 - 1) - 48;
      if (v58 > 9)
      {
        signed int v60 = 0;
      }
      else
      {
        uint64_t v59 = 0;
        signed int v60 = 0;
        do
        {
          signed int v60 = v58 + 10 * v60;
          unsigned int v58 = v57[v59] - 48;
        }
        while (v58 <= 9 && v59++ < 3);
      }
      int v63 = 60 * (v60 % 100) + 3600 * (v60 / 100);
      if (v49 == 45) {
        int v63 = -v63;
      }
      goto LABEL_143;
    }
    if (*((_WORD *)v57 - 1) != 19783 || *v57 != 84) {
      goto LABEL_171;
    }
  }
  int v63 = 0;
LABEL_143:
  if ((int)v25 >= 100) {
    uint64_t v25 = v25;
  }
  else {
    uint64_t v25 = (v25 + 1900);
  }
  if ((v20 - 32) < 0xFFFFFFE1) {
    goto LABEL_171;
  }
  if (v19 == 1)
  {
    if (v20 == 29)
    {
      if ((v25 & 3) != 0) {
        goto LABEL_171;
      }
      HIDWORD(v64) = -1030792151 * v25 + 85899344;
      LODWORD(v64) = HIDWORD(v64);
      if ((v64 >> 2) <= 0x28F5C28)
      {
        if ((int)v25 % 400) {
          goto LABEL_171;
        }
      }
    }
    else if (v20 > 0x1C)
    {
      goto LABEL_171;
    }
  }
  else if v20 == 31 && (v19 - 3) < 8 && ((0xA5u >> (v19 - 3)))
  {
    goto LABEL_171;
  }
  if ((v25 - 2100) >= 0xFFFFFF39
    && ((v25 & 3) == 0 ? (BOOL v65 = (int)v19 < 2) : (BOOL v65 = 0),
        v65 ? (int v66 = -2) : (int v66 = -1),
        v10 == (int)(v25 - 1900 + v20 + ((v25 - 1900) >> 2) + v66 + monthStarts[(int)v19]) % 7))
  {
    uint64_t v67 = 0;
    if (v39 <= 23 && v43 <= 59 && v72 <= 59)
    {
      if (v49) {
        [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:v63];
      }
      else {
      v69 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
      }
      id v70 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      v71 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      [v70 setCalendar:v71];

      [v70 setYear:v25];
      [v70 setMonth:(int)v19 + 1];
      [v70 setDay:v20];
      [v70 setHour:v39];
      [v70 setMinute:v43];
      [v70 setSecond:v72];
      [v70 setTimeZone:v69];
      uint64_t v67 = [v70 date];
    }
  }
  else
  {
LABEL_171:
    uint64_t v67 = 0;
  }

  if (!v67)
  {
    uint64_t v67 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mf_copyLenientDateInCommonFormatsWithString:", v3);
  }

  return v67;
}

@end